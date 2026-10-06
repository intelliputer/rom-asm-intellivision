
        ORG     $5000
.HEADER:
        BIDECLE $6F6D           ; 5000  Ptr: MOB graphic images
        BIDECLE $5017           ; 5002  Ptr: EXEC timer table
        BIDECLE $5141           ; 5004  Ptr: Start of game
        BIDECLE $6F9D           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501A           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5023           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $01F0,  $01E0   ; 500F  Color Stack init (0, 1)
        DECLE   $01D0,  $01C0   ; 5011  Color Stack init (2, 3)
        DECLE   $01B0           ; 5013  Border color init

        DECLE   $01A0,  $0190,  $0180           ; 5014   01A0 0190 0180
.TIMER:
        BIDECLE $0000           ; 5017  End of timer table

        DECLE   $0000                           ; 5019   0000
.GRAM_INIT_501A:
        DECLE   $0020           ; 501A  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 501B  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 501D  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 501F  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 5021  #18-1F:  CART #18-1F ----

.TITLE:
        DECLE   $0053                           ; 5023  Cartridge year
        STRING  " "                             ; 5024  Title string
        DECLE   $0000                           ; 5025  

.TITLECODE:
        DIS                                     ; 5026   0003
        MVII    #$02F1, R6                      ; 5027   02BE 02F1
        MVII    #$0310, R4                      ; 5029   02BC 0310
        MVII    #$0018, R0                      ; 502B   02B8 0018

        JSR     R5,     X_FILL_ZERO             ; 502D   0004 0114 0338
        JSR     R5,     L_656A                  ; 5030   0004 0164 016A

        CLRR    R0                              ; 5033   01C0
        MVO     R0,     G_035D                  ; 5034   0240 035D
        MVO     R0,     G_01ED                  ; 5036   0240 01ED
        MVO     R0,     G_01EF                  ; 5038   0240 01EF
        MVII    #$0100, R4                      ; 503A   02BC 0100
        SDBD                                    ; 503C   0001
        MVII    #$54EB, R3                      ; 503D   02BB 00EB 0054
        MVO@    R3,     R4                      ; 5040   0263
        SWAP    R3,     1                       ; 5041   0043
        MVO@    R3,     R4                      ; 5042   0263
        SDBD                                    ; 5043   0001
        MVII    #$67C9, R0                      ; 5044   02B8 00C9 0067

        JSR     R5,     L_6556                  ; 5047   0004 0164 0156

        EIS                                     ; 504A   0002

        JSR     R5,     L_54E0                  ; 504B   0004 0154 00E0

L_504E:
        MVI     G_035D, R0                      ; 504E   0280 035D
        TSTR    R0                              ; 5050   0080
        BNEQ    L_504E                          ; 5051   022C 0004

        MVII    #$000B, R0                      ; 5053   02B8 000B
        MVO     R0,     G_0188                  ; 5055   0240 0188
        MVO     R0,     G_018C                  ; 5057   0240 018C
        MVII    #$0007, R3                      ; 5059   02BB 0007
        MVII    #$022D, R4                      ; 505B   02BC 022D

        JSR     R5,     X_PRINT_R5              ; 505D   0004 0118 007B
        STRING  "INTERPHASE"                    ; 5060  
        DECLE   $0000                           ; 506A   0000

        MVII    #$0256, R4                      ; 506B   02BC 0256

        JSR     R5,     X_PRINT_R5              ; 506D   0004 0118 007B
        STRING  "presents"                      ; 5070  
        DECLE   $0000                           ; 5078   0000

        MVII    #$02B7, R4                      ; 5079   02BC 02B7

        JSR     R5,     X_PRINT_R5              ; 507B   0004 0118 007B
        STRING  "1983 INTERPHASE"               ; 507E  
        DECLE   $0000                           ; 508D   0000

        MVII    #$027D, R4                      ; 508E   02BC 027D
        MVII    #$0006, R3                      ; 5090   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5092   0004 0118 007B
        STRING  "Sewer Sam"                     ; 5095  
        DECLE   $0000                           ; 509E   0000

        SDBD                                    ; 509F   0001
        MVII    #$088F, R0                      ; 50A0   02B8 008F 0008
        MVO     R0,     .BTAB.B6                ; 50A3   0240 02B6
        ADDI    #$0008, R0                      ; 50A5   02F8 0008
        MVO     R0,     .BTAB.37                ; 50A7   0240 0237
        MVO     R0,     .BTAB.86                ; 50A9   0240 0286
        SDBD                                    ; 50AB   0001
        MVII    #$50FF, R4                      ; 50AC   02BC 00FF 0050
        MVII    #$0010, R2                      ; 50AF   02BA 0010

        JSR     R5,     L_658E                  ; 50B1   0004 0164 018E

        CLRR    R3                              ; 50B4   01DB
L_50B5:
        MVII    #$02F8, R4                      ; 50B5   02BC 02F8
        XORR    R3,     R4                      ; 50B7   01DC
        MVII    #$020A, R1                      ; 50B8   02B9 020A
        MVII    #$0209, R2                      ; 50BA   02BA 0209
        MVII    #$000A, R0                      ; 50BC   02B8 000A
L_50BE:
        DECR    R1                              ; 50BE   0011
        INCR    R2                              ; 50BF   000A

        JSR     R5,     L_50F2                  ; 50C0   0004 0150 00F2

        DECR    R0                              ; 50C3   0010
        BNEQ    L_50BE                          ; 50C4   022C 0007

        MVII    #$000B, R0                      ; 50C6   02B8 000B
L_50C8:
        ADDI    #$0014, R1                      ; 50C8   02F9 0014
        ADDI    #$0014, R2                      ; 50CA   02FA 0014

        JSR     R5,     L_50F2                  ; 50CC   0004 0150 00F2

        DECR    R0                              ; 50CF   0010
        BNEQ    L_50C8                          ; 50D0   022C 0009

        MVII    #$0009, R0                      ; 50D2   02B8 0009
L_50D4:
        INCR    R1                              ; 50D4   0009
        DECR    R2                              ; 50D5   0012

        JSR     R5,     L_50F2                  ; 50D6   0004 0150 00F2

        DECR    R0                              ; 50D9   0010
        BNEQ    L_50D4                          ; 50DA   022C 0007

        DECR    R3                              ; 50DC   0013
        ANDI    #$0007, R3                      ; 50DD   03BB 0007
        MVII    #$03FF, R1                      ; 50DF   02B9 03FF
L_50E1:
        MVI     .PSG0.lft_hand,R0               ; 50E1   0280 01FF
        CMPI    #$00FF, R0                      ; 50E3   0378 00FF
        BNEQ    .START                          ; 50E5   020C 005A

        MVI     .PSG0.rgt_hand,R0               ; 50E7   0280 01FE
        CMPI    #$00FF, R0                      ; 50E9   0378 00FF
        BNEQ    .START                          ; 50EB   020C 0054

        DECR    R1                              ; 50ED   0011
        BNEQ    L_50E1                          ; 50EE   022C 000E
        B       L_50B5                          ; 50F0   0220 003C

L_50F2:
        PSHR    R5                              ; 50F2   0275
        MVO@    R4,     R1                      ; 50F3   024C
        MVO@    R4,     R2                      ; 50F4   0254
        MOVR    R4,     R5                      ; 50F5   00A5
        INCR    R5                              ; 50F6   000D
        ANDI    #$0007, R5                      ; 50F7   03BD 0007
        SDBD                                    ; 50F9   0001
        ANDI    #$FFF8, R4                      ; 50FA   03BC 00F8 00FF
        XORR    R5,     R4                      ; 50FD   01EC
        PULR    R7                              ; 50FE   02B7

        DECLE   $0050,  $0010,  $0000,  $0138   ; 50FF   0050 0010 0000 0138
        DECLE   $0040,  $00FF,  $01BF,  $0101   ; 5103   0040 00FF 01BF 0101
        DECLE   $007C,  $00A0,  $0007,  $0101   ; 5107   007C 00A0 0007 0101
        DECLE   $001C,  $00A0,  $000E,  $00A0   ; 510B   001C 00A0 000E 00A0
        DECLE   $0007,  $0100,  $00FE,  $00A0   ; 510F   0007 0100 00FE 00A0
        DECLE   $000E,  $00A0,  $0007,  $0100   ; 5113   000E 00A0 0007 0100
        DECLE   $00E1,  $00A0,  $0006,  $0100   ; 5117   00E1 00A0 0006 0100
        DECLE   $00BE,  $00A0,  $0006,  $0100   ; 511B   00BE 00A0 0006 0100
        DECLE   $00E1,  $00A0,  $0006,  $0101   ; 511F   00E1 00A0 0006 0101
        DECLE   $001C,  $00A0,  $0023,  $0100   ; 5123   001C 00A0 0023 0100
        DECLE   $00A9,  $00A0,  $0014,  $0100   ; 5127   00A9 00A0 0014 0100
        DECLE   $00FE,  $00A0,  $0014,  $0100   ; 512B   00FE 00A0 0014 0100
        DECLE   $00D5,  $00A0,  $0005           ; 512F   00D5 00A0 0005

        SUBR    R0,     R0                      ; 5132   0100
        ADDR    R4,     R1                      ; 5133   00E1
        MOVR    R4,     R0                      ; 5134   00A0
        COMR    R1                              ; 5135   0019
        SUBR    R0,     R1                      ; 5136   0101
        COMR    R4                              ; 5137   001C
        MOVR    R4,     R0                      ; 5138   00A0
        INCR    R7                              ; 5139   000F

        ANDR    R0,     R0                      ; 513A   0180
L_513B:
        SWAP    R1,     1                       ; 513B   0041
        COMR    R3                              ; 513C   001B
        RSWD    R3                              ; 513D   003B
        SWAP    R3,     1                       ; 513E   0043
        SWAP    R3,     1                       ; 513F   0043
        ADDR    R6,     R0                      ; 5140   00F0
.START:
        MVI     .PSG0.lft_hand,R0               ; 5141   0280 01FF
        CMPI    #$00FF, R0                      ; 5143   0378 00FF
        BNEQ    .START                          ; 5145   022C 0005

        MVI     .PSG0.rgt_hand,R0               ; 5147   0280 01FE
        CMPI    #$00FF, R0                      ; 5149   0378 00FF
        BNEQ    .START                          ; 514B   022C 000B

        JSR     R5,     L_656A                  ; 514D   0004 0164 016A

        MVII    #$0201, R4                      ; 5150   02BC 0201
L_5152:
        ADDI    #$0014, R4                      ; 5152   02FC 0014
        PSHR    R4                              ; 5154   0274
        MVII    #$0012, R0                      ; 5155   02B8 0012

        JSR     R5,     X_FILL_ZERO             ; 5157   0004 0114 0338

        PULR    R4                              ; 515A   02B4
        CMPI    #$02C9, R4                      ; 515B   037C 02C9
        BNEQ    L_5152                          ; 515D   022C 000C

        MVII    #$0310, R4                      ; 515F   02BC 0310
        MVII    #$0048, R0                      ; 5161   02B8 0048

        JSR     R5,     X_FILL_ZERO             ; 5163   0004 0114 0338

        MVII    #$0104, R4                      ; 5166   02BC 0104
        MVII    #$00E9, R0                      ; 5168   02B8 00E9

        JSR     R5,     X_FILL_ZERO             ; 516A   0004 0114 0338

        MVII    #$000B, R0                      ; 516D   02B8 000B
        MVO     R0,     G_0188                  ; 516F   0240 0188
        MVO     R0,     G_018C                  ; 5171   0240 018C
        MVII    #$022A, R4                      ; 5173   02BC 022A
        MVII    #$0007, R3                      ; 5175   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5177   0004 0118 007B
        STRING  "NUMBER OF"                     ; 517A  
        DECLE   $0000                           ; 5183   0000

        MVII    #$023E, R4                      ; 5184   02BC 023E

        JSR     R5,     X_PRINT_R5              ; 5186   0004 0118 007B
        STRING  "PLAYERS >"                     ; 5189  
        DECLE   $0000                           ; 5192   0000

        MVII    #$0247, R4                      ; 5193   02BC 0247
        MVII    #$0002, R1                      ; 5195   02B9 0002

        JSR     R5,     L_5427                  ; 5197   0004 0154 0027

        MVO     R0,     G_01E0                  ; 519A   0240 01E0
        MVII    #$0266, R4                      ; 519C   02BC 0266
        MVII    #$0007, R3                      ; 519E   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 51A0   0004 0118 007B
        STRING  "SKILL LEVEL >"                 ; 51A3  
        DECLE   $0000                           ; 51B0   0000

        MVII    #$0273, R4                      ; 51B1   02BC 0273
        MVII    #$0004, R1                      ; 51B3   02B9 0004

        JSR     R5,     L_5427                  ; 51B5   0004 0154 0027

        MVO     R0,     G_01E1                  ; 51B8   0240 01E1
        MVII    #$0005, R1                      ; 51BA   02B9 0005
        SUBR    R0,     R1                      ; 51BC   0101
        MVO     R1,     G_01E2                  ; 51BD   0241 01E2
        MVII    #$03FF, R4                      ; 51BF   02BC 03FF
        MVII    #$000F, R1                      ; 51C1   02B9 000F

        JSR     R5,     L_5427                  ; 51C3   0004 0154 0027

        CMPI    #$000C, R0                      ; 51C6   0378 000C
        BEQ     .START                          ; 51C8   0224 0088

        JSR     R5,     L_54E0                  ; 51CA   0004 0154 00E0

        MVII    #$0150, R5                      ; 51CD   02BD 0150
        MVII    #$0160, R4                      ; 51CF   02BC 0160
        MVII    #$0003, R0                      ; 51D1   02B8 0003
        MVO@    R0,     R4                      ; 51D3   0260
        MVO@    R0,     R5                      ; 51D4   0268
        MVO     R0,     G_0156                  ; 51D5   0240 0156
        MVO     R0,     G_0166                  ; 51D7   0240 0166
        SDBD                                    ; 51D9   0001
        MVII    #$05E9, R0                      ; 51DA   02B8 00E9 0005
        MVO     R0,     .BTAB.08                ; 51DD   0240 0208
        SUBI    #$0008, R0                      ; 51DF   0338 0008
        MVO     R0,     .BTAB.0B                ; 51E1   0240 020B
        MVII    #$0001, R0                      ; 51E3   02B8 0001
        MVO     R0,     G_01E5                  ; 51E5   0240 01E5
        CLRR    R2                              ; 51E7   01D2

        JSR     R5,     L_56F8                  ; 51E8   0004 0154 02F8

        MVI     G_01E0, R0                      ; 51EB   0280 01E0
        CMPI    #$0001, R0                      ; 51ED   0378 0001
        BEQ     L_51F9                          ; 51EF   0204 0008

        MVII    #$0002, R0                      ; 51F1   02B8 0002
        MVO     R0,     G_01E5                  ; 51F3   0240 01E5
        CLRR    R2                              ; 51F5   01D2

        JSR     R5,     L_56F8                  ; 51F6   0004 0154 02F8

L_51F9:
        MVII    #$0310, R4                      ; 51F9   02BC 0310
        MVII    #$0008, R0                      ; 51FB   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 51FD   0004 0114 0338
        JSR     R5,     L_656A                  ; 5200   0004 0164 016A

        MVI     G_01E0, R0                      ; 5203   0280 01E0
        CMPI    #$0001, R0                      ; 5205   0378 0001
        BEQ     L_5222                          ; 5207   0204 0019

        MVI     G_01E5, R0                      ; 5209   0280 01E5
        CMPI    #$0002, R0                      ; 520B   0378 0002
        BEQ     L_5213                          ; 520D   0204 0004

        MVII    #$0200, R4                      ; 520F   02BC 0200
        B       L_5215                          ; 5211   0200 0002

L_5213:
        MVII    #$020E, R4                      ; 5213   02BC 020E

L_5215:
        JSR     R5,     L_5403                  ; 5215   0004 0154 0003

        MVII    #$0003, R0                      ; 5218   02B8 0003
        SUB     G_01E5, R0                      ; 521A   0300 01E5
        MVO     R0,     G_01E5                  ; 521C   0240 01E5
        CMPI    #$0002, R0                      ; 521E   0378 0002
        BEQ     L_5226                          ; 5220   0204 0004

L_5222:
        MVII    #$0150, R4                      ; 5222   02BC 0150
        B       L_5228                          ; 5224   0200 0002

L_5226:
        MVII    #$0160, R4                      ; 5226   02BC 0160
L_5228:
        MVII    #$01D0, R1                      ; 5228   02B9 01D0
        MVII    #$0008, R0                      ; 522A   02B8 0008

        JSR     R5,     .EXEC.730               ; 522C   0004 0114 0330

        MVII    #$0207, R4                      ; 522F   02BC 0207
        MVII    #$0001, R3                      ; 5231   02BB 0001
        MOVR    R3,     R1                      ; 5233   0099
        MVI     G_01D0, R0                      ; 5234   0280 01D0

        JSR     R5,     X_PRNUM_LFT             ; 5236   0004 0118 009E

        MVI     G_01D0, R0                      ; 5239   0280 01D0
        TSTR    R0                              ; 523B   0080
        BNEQ    L_524C                          ; 523C   020C 000E

        MVI     G_01E0, R0                      ; 523E   0280 01E0
        CMPI    #$0001, R0                      ; 5240   0378 0001
        BEQ     L_536C                          ; 5242   0204 0128

        MVI     G_0150, R0                      ; 5244   0280 0150
        CMP     G_0160, R0                      ; 5246   0340 0160
        BEQ     L_536C                          ; 5248   0204 0122
        B       L_51F9                          ; 524A   0220 0052

L_524C:
        CLRR    R2                              ; 524C   01D2

        JSR     R5,     L_56F8                  ; 524D   0004 0154 02F8
        JSR     R5,     L_6719                  ; 5250   0004 0164 0319

        MVI     G_01D3, R0                      ; 5253   0280 01D3
        BEQ     L_5267                          ; 5255   0204 0010

        SDBD                                    ; 5257   0001
        MVII    #$6273, R0                      ; 5258   02B8 0073 0062

        JSR     R5,     L_6556                  ; 525B   0004 0164 0156
        JSR     R5,     L_653E                  ; 525E   0004 0164 013E
        JSR     R5,     L_6544                  ; 5261   0004 0164 0144

        J       L_5267                          ; 5264   0004 0350 0267

L_5267:
        MVI     G_01D1, R0                      ; 5267   0280 01D1
        TSTR    R0                              ; 5269   0080
        BEQ     L_52A6                          ; 526A   0204 003A

        SDBD                                    ; 526C   0001
        MVII    #$5296, R4                      ; 526D   02BC 0096 0052
        MVII    #$00C0, R2                      ; 5270   02BA 00C0

        JSR     R5,     L_658E                  ; 5272   0004 0164 018E

        CLRR    R3                              ; 5275   01DB
        MVI     G_01D1, R2                      ; 5276   0282 01D1
        PSHR    R2                              ; 5278   0272
        MVO     R3,     G_01D1                  ; 5279   0243 01D1
L_527B:
        CLRR    R0                              ; 527B   01C0
        MVO     R0,     G_01EE                  ; 527C   0240 01EE
L_527E:
        MVI     G_01EE, R0                      ; 527E   0280 01EE
        TSTR    R0                              ; 5280   0080
        BNEQ    L_527E                          ; 5281   022C 0004

        CMPR    R2,     R3                      ; 5283   0153
        BGE     L_52A3                          ; 5284   020D 001D

        MVO     R3,     G_01D1                  ; 5286   0243 01D1
        PSHR    R2                              ; 5288   0272
        PSHR    R3                              ; 5289   0273

        JSR     R5,     L_6863                  ; 528A   0004 0168 0063
        JSR     R5,     L_5C22                  ; 528D   0004 015C 0022

        PULR    R3                              ; 5290   02B3
        PULR    R2                              ; 5291   02B2
        ADDI    #$0001, R3                      ; 5292   02FB 0001
        B       L_527B                          ; 5294   0220 001A

        DECLE   $0138,  $018F,  $0105,  $0000   ; 5296   0138 018F 0105 0000
        DECLE   $0040,  $00FF,  $0041,  $00FF   ; 529A   0040 00FF 0041 00FF
        DECLE   $0122,  $0000                   ; 529E   0122 0000

        SWAP    R3,     1                       ; 52A0   0043
        SWAP    R3,     1                       ; 52A1   0043
        ADDR    R6,     R0                      ; 52A2   00F0
L_52A3:
        PULR    R0                              ; 52A3   02B0
        MVO     R0,     G_01D1                  ; 52A4   0240 01D1
L_52A6:
        SDBD                                    ; 52A6   0001
        MVII    #$52A2, R4                      ; 52A7   02BC 00A2 0052
        MVII    #$00C0, R2                      ; 52AA   02BA 00C0

        JSR     R5,     L_658E                  ; 52AC   0004 0164 018E
        JSR     R5,     L_6863                  ; 52AF   0004 0168 0063

        MVII    #$0190, R4                      ; 52B2   02BC 0190
        MVII    #$0010, R0                      ; 52B4   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 52B6   0004 0114 0338

        MVII    #$0030, R0                      ; 52B9   02B8 0030
        MVO     R0,     G_0199                  ; 52BB   0240 0199
        MVII    #$0001, R0                      ; 52BD   02B8 0001
        MVO     R0,     G_0192                  ; 52BF   0240 0192
        MVO     R0,     G_01E3                  ; 52C1   0240 01E3
        MVII    #$0006, R0                      ; 52C3   02B8 0006
        MVO     R0,     G_01A2                  ; 52C5   0240 01A2
        MVII    #$0020, R0                      ; 52C7   02B8 0020
        MVO     R0,     G_0195                  ; 52C9   0240 0195
        SDBD                                    ; 52CB   0001
        MVII    #$5CF0, R0                      ; 52CC   02B8 00F0 005C

        JSR     R5,     L_6556                  ; 52CF   0004 0164 0156

        SDBD                                    ; 52D2   0001
        MVII    #$0957, R0                      ; 52D3   02B8 0057 0009
        MVO     R0,     G_0327                  ; 52D6   0240 0327
        CLRR    R0                              ; 52D8   01C0
        MVO     R0,     G_01A0                  ; 52D9   0240 01A0
        MVO     R0,     G_032F                  ; 52DB   0240 032F
        SDBD                                    ; 52DD   0001
        MVII    #$19F5, R0                      ; 52DE   02B8 00F5 0019
        MVO     R0,     G_0320                  ; 52E1   0240 0320
        SDBD                                    ; 52E3   0001
        MVII    #$09E3, R0                      ; 52E4   02B8 00E3 0009
        MVO     R0,     G_0321                  ; 52E7   0240 0321
        MVII    #$0339, R5                      ; 52E9   02BD 0339
        MVII    #$0110, R0                      ; 52EB   02B8 0110
        MVII    #$0206, R1                      ; 52ED   02B9 0206
        CLRR    R2                              ; 52EF   01D2
        MVO@    R0,     R5                      ; 52F0   0268
        MVO@    R1,     R5                      ; 52F1   0269
        MVO@    R2,     R5                      ; 52F2   026A
        SUBI    #$0030, R0                      ; 52F3   0338 0030
        MVO@    R0,     R5                      ; 52F5   0268
        MVO@    R1,     R5                      ; 52F6   0269
        MVO@    R2,     R5                      ; 52F7   026A
        SUBI    #$0030, R0                      ; 52F8   0338 0030
        MVO@    R0,     R5                      ; 52FA   0268
        MVO@    R1,     R5                      ; 52FB   0269
        MVO@    R2,     R5                      ; 52FC   026A
        CLRR    R0                              ; 52FD   01C0
        CLRR    R4                              ; 52FE   01E4

        JSR     R5,     L_5D09                  ; 52FF   0004 015C 0109

        INCR    R4                              ; 5302   000C

        JSR     R5,     L_5D09                  ; 5303   0004 015C 0109

        INCR    R4                              ; 5306   000C

        JSR     R5,     L_5D09                  ; 5307   0004 015C 0109
        JSR     R5,     L_5C22                  ; 530A   0004 015C 0022

L_530D:
        CLRR    R0                              ; 530D   01C0
        MVO     R0,     G_01EE                  ; 530E   0240 01EE
L_5310:
        MVI     G_01EE, R1                      ; 5310   0281 01EE
L_5312:
        EIS                                     ; 5312   0002
        MVI     G_01EE, R0                      ; 5313   0280 01EE
        CMPR    R0,     R1                      ; 5315   0141
        BEQ     L_5312                          ; 5316   0224 0005

        EIS                                     ; 5318   0002
        MVI     G_017E, R0                      ; 5319   0280 017E
        TSTR    R0                              ; 531B   0080
        BEQ     L_5321                          ; 531C   0204 0003

        DECR    R0                              ; 531E   0010
        MVO     R0,     G_017E                  ; 531F   0240 017E

L_5321:
        JSR     R5,     L_5590                  ; 5321   0004 0154 0190
        JSR     R5,     L_5C56                  ; 5324   0004 015C 0056
        JSR     R5,     L_5410                  ; 5327   0004 0154 0010

        MVI     G_01EE, R0                      ; 532A   0280 01EE
        CMP     G_01E2, R0                      ; 532C   0340 01E2
        BLT     L_5310                          ; 532E   0225 001F

        JSR     R5,     L_5750                  ; 5330   0004 0154 0350
        JSR     R5,     L_5DB4                  ; 5333   0004 015C 01B4
        JSR     R5,     L_62DB                  ; 5336   0004 0160 02DB

        MVI     G_01A2, R0                      ; 5339   0280 01A2
        TSTR    R0                              ; 533B   0080
        BEQ     L_5342                          ; 533C   0204 0004

        MVII    #$0001, R1                      ; 533E   02B9 0001
        B       L_5344                          ; 5340   0200 0002

L_5342:
        MVII    #$0002, R1                      ; 5342   02B9 0002
L_5344:
        ADDI    #$0010, R0                      ; 5344   02F8 0010
        SLL     R0,     2                       ; 5346   004C
        SLL     R0,     1                       ; 5347   0048
        XORR    R1,     R0                      ; 5348   01C8
        MVO     R0,     .BTAB.0C                ; 5349   0240 020C
        MVI     G_01D2, R0                      ; 534B   0280 01D2
        ANDI    #$0001, R0                      ; 534D   03B8 0001
        BEQ     L_5357                          ; 534F   0204 0006

        SDBD                                    ; 5351   0001
        MVII    #$5367, R4                      ; 5352   02BC 0067 0053
        B       L_5360                          ; 5355   0200 0009

L_5357:
        MVI     .PSG0.chn_c_vol,R0              ; 5357   0280 01FD
        TSTR    R0                              ; 5359   0080
        BEQ     L_530D                          ; 535A   0224 004E

        SDBD                                    ; 535C   0001
        MVII    #$536B, R4                      ; 535D   02BC 006B 0053
L_5360:
        MVII    #$0010, R2                      ; 5360   02BA 0010

        JSR     R5,     L_658E                  ; 5362   0004 0164 018E

        B       L_530D                          ; 5365   0220 0059

        MOVR    R1,     R4                      ; 5367   008C
        SUB@    R6,     R1                      ; 5368   0331
        AND@    R1,     R1                      ; 5369   0389
        ADDR    R6,     R0                      ; 536A   00F0
        ADDR    R6,     R0                      ; 536B   00F0
L_536C:
        SDBD                                    ; 536C   0001
        MVII    #$53CD, R4                      ; 536D   02BC 00CD 0053
        MVII    #$00C0, R2                      ; 5370   02BA 00C0

        JSR     R5,     L_658E                  ; 5372   0004 0164 018E

        MVII    #$000B, R0                      ; 5375   02B8 000B
        MVO     R0,     G_0188                  ; 5377   0240 0188
        CLRR    R0                              ; 5379   01C0
        MVII    #$0214, R4                      ; 537A   02BC 0214
        MVII    #$00DC, R0                      ; 537C   02B8 00DC

        JSR     R5,     X_FILL_ZERO             ; 537E   0004 0114 0338

        MVII    #$0269, R4                      ; 5381   02BC 0269
        MVII    #$0007, R3                      ; 5383   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5385   0004 0118 007B
        STRING  "Game over"                     ; 5388  
        DECLE   $0000                           ; 5391   0000

        MVII    #$02A2, R4                      ; 5392   02BC 02A2

        JSR     R5,     X_PRINT_R5              ; 5394   0004 0118 007B
        STRING  "Press any key for"             ; 5397  
        DECLE   $0000                           ; 53A8   0000

        MVII    #$02BA, R4                      ; 53A9   02BC 02BA

        JSR     R5,     X_PRINT_R5              ; 53AB   0004 0118 007B
        STRING  "new game"                      ; 53AE  
        DECLE   $0000                           ; 53B6   0000
L_53B7:
        MVI     .PSG0.lft_hand,R0               ; 53B7   0280 01FF
        CMPI    #$00FF, R0                      ; 53B9   0378 00FF
        BNEQ    L_53C3                          ; 53BB   020C 0006

        MVI     .PSG0.rgt_hand,R0               ; 53BD   0280 01FE
        CMPI    #$00FF, R0                      ; 53BF   0378 00FF
        BEQ     L_53B7                          ; 53C1   0224 000B

L_53C3:
        MVII    #$0200, R4                      ; 53C3   02BC 0200
        MVII    #$0014, R0                      ; 53C5   02B8 0014

        JSR     R5,     X_FILL_ZERO             ; 53C7   0004 0114 0338

        J       .START                          ; 53CA   0004 0350 0141

        DECLE   $0050,  $0030,  $0000,  $0138   ; 53CD   0050 0030 0000 0138
        DECLE   $0238,  $01BF,  $02BF,  $00D0   ; 53D1   0238 01BF 02BF 00D0
        DECLE   $00FD,  $0053,  $0021,  $00A0   ; 53D5   00FD 0053 0021 00A0
        DECLE   $0016,  $00A0,  $000B,  $00A0   ; 53D9   0016 00A0 000B 00A0
        DECLE   $0021,  $0102,  $00A4,  $0201   ; 53DD   0021 0102 00A4 0201
        DECLE   $00C3,  $00A0,  $0016,  $0102   ; 53E1   00C3 00A0 0016 0102
        DECLE   $00C6,  $0201,  $00DE,  $00A0   ; 53E5   00C6 0201 00DE 00A0
        DECLE   $000B,  $00A0,  $0016,  $00D0   ; 53E9   000B 00A0 0016 00D0
        DECLE   $00FD,  $0053,  $000B,  $00A0   ; 53ED   00FD 0053 000B 00A0
        DECLE   $0016,  $0103,  $0054,  $0202   ; 53F1   0016 0103 0054 0202
        DECLE   $0038,  $00A0,  $000B,  $00D0   ; 53F5   0038 00A0 000B 00D0
        DECLE   $00FD,  $0053,  $0021,  $00F0   ; 53F9   00FD 0053 0021 00F0
        DECLE   $0103,  $0024,  $0202           ; 53FD   0103 0024 0202

        COMR    R0                              ; 5400   0018
        MOVR    R4,     R0                      ; 5401   00A0
        ADDR    R4,     R0                      ; 5402   00E0
L_5403:
        MVII    #$0006, R1                      ; 5403   02B9 0006
L_5405:
        MVI@    R4,     R0                      ; 5405   02A0
        DECR    R4                              ; 5406   0014
        SDBD                                    ; 5407   0001
        ANDI    #$FFF8, R0                      ; 5408   03B8 00F8 00FF
        MVO@    R0,     R4                      ; 540B   0260
        DECR    R1                              ; 540C   0011
        BNEQ    L_5405                          ; 540D   022C 0009
        MOVR    R5,     R7                      ; 540F   00AF

L_5410:
        MVI     G_01E0, R0                      ; 5410   0280 01E0
        CMPI    #$0001, R0                      ; 5412   0378 0001
        BNEQ    L_5420                          ; 5414   020C 000A

        MVI     .PSG0.lft_hand,R0               ; 5416   0280 01FF
        CMPI    #$00FF, R0                      ; 5418   0378 00FF
        BNEQ    L_5455                          ; 541A   020C 0039

        MVI     .PSG0.rgt_hand,R0               ; 541C   0280 01FE
        B       L_5455                          ; 541E   0200 0035

L_5420:
        MVII    #$0200, R1                      ; 5420   02B9 0200
        SUB     G_01E5, R1                      ; 5422   0301 01E5
        MVI@    R1,     R0                      ; 5424   0288
        B       L_5455                          ; 5425   0200 002E

L_5427:
        MVII    #$00FF, R3                      ; 5427   02BB 00FF
        MVII    #$01FE, R2                      ; 5429   02BA 01FE
L_542B:
        CMP@    R2,     R3                      ; 542B   0353
        BNEQ    L_5435                          ; 542C   020C 0007

        CMPI    #$01FF, R2                      ; 542E   037A 01FF
        BEQ     L_5427                          ; 5430   0224 000A

        INCR    R2                              ; 5432   000A
        B       L_542B                          ; 5433   0220 0009

L_5435:
        MVI@    R2,     R0                      ; 5435   0290
        PSHR    R1                              ; 5436   0271
        PSHR    R2                              ; 5437   0272
        NOP                                     ; 5438   0034
        PSHR    R3                              ; 5439   0273
        PSHR    R5                              ; 543A   0275

        JSR     R5,     L_5455                  ; 543B   0004 0154 0055

        PULR    R5                              ; 543E   02B5
        PULR    R3                              ; 543F   02B3
        PULR    R2                              ; 5440   02B2
        PULR    R1                              ; 5441   02B1
        MVI     G_01E8, R0                      ; 5442   0280 01E8
        TSTR    R0                              ; 5444   0080
        BEQ     L_5435                          ; 5445   0224 0011

        CMPR    R1,     R0                      ; 5447   0148
        BGT     L_5435                          ; 5448   022E 0014

L_544A:
        CMP@    R2,     R3                      ; 544A   0353
        BNEQ    L_544A                          ; 544B   022C 0002

        PSHR    R0                              ; 544D   0270
        SLL     R0,     2                       ; 544E   004C
        SLL     R0,     1                       ; 544F   0048
        ADDI    #$0087, R0                      ; 5450   02F8 0087
        MVO@    R0,     R4                      ; 5452   0260
        PULR    R0                              ; 5453   02B0
        MOVR    R5,     R7                      ; 5454   00AF

L_5455:
        PSHR    R1                              ; 5455   0271
        DECLE   $0272,  $0034,  $0274,  $01C9   ; 5456   0272 0034 0274 01C9
        DECLE   $0241,  $01E6,  $02B9,  $00F0   ; 545A   0241 01E6 02B9 00F0
        DECLE   $0241,  $01E8,  $0241,  $01E7   ; 545E   0241 01E8 0241 01E7
        DECLE   $0378,  $00FF,  $0204,  $0046   ; 5462   0378 00FF 0204 0046
        DECLE   $0081,  $03B9,  $00E0,  $0204   ; 5466   0081 03B9 00E0 0204
        DECLE   $0030,  $0379,  $0060,  $0204   ; 546A   0030 0379 0060 0204
        DECLE   $002C,  $0379,  $00A0,  $0204   ; 546E   002C 0379 00A0 0204
        DECLE   $0028,  $0379,  $00C0,  $0204   ; 5472   0028 0379 00C0 0204
        DECLE   $0024                           ; 5476   0024

        CMPI    #$0040, R1                      ; 5477   0379 0040
        BEQ     L_5483                          ; 5479   0204 0008

        CMPI    #$0080, R1                      ; 547B   0379 0080
        BEQ     L_5483                          ; 547D   0204 0004

        CMPI    #$0020, R1                      ; 547F   0379 0020
        BNEQ    L_5485                          ; 5481   020C 0002

L_5483:
        MVO     R1,     G_01E6                  ; 5483   0241 01E6
L_5485:
        MOVR    R0,     R1                      ; 5485   0081
        ANDI    #$001F, R1                      ; 5486   03B9 001F
        SDBD                                    ; 5488   0001
        MVII    #$54B0, R4                      ; 5489   02BC 00B0 0054
L_548C:
        MVI@    R4,     R2                      ; 548C   02A2
        DECLE   $0092,  $0204,  $000B           ; 548D   0092 0204 000B

        CMPR    R2,     R1                      ; 5490   0151
        BEQ     L_5496                          ; 5491   0204 0003

        INCR    R4                              ; 5493   000C
        B       L_548C                          ; 5494   0220 0009

L_5496:
        MVI@    R4,     R2                      ; 5496   02A2
        MVO     R2,     G_01E7                  ; 5497   0242 01E7
        B       L_54AC                          ; 5499   0200 0011

        DECLE   $0001                           ; 549B   0001

        MVII    #$00D2, R4                      ; 549C   02BC 00D2
        RLC     R0,     2                       ; 549E   0054
L_549F:
        MVI@    R4,     R1                      ; 549F   02A1
        TSTR    R1                              ; 54A0   0089
        BEQ     L_54AC                          ; 54A1   0204 0009

        CMPR    R0,     R1                      ; 54A3   0141
        BEQ     L_54A9                          ; 54A4   0204 0003

        INCR    R4                              ; 54A6   000C
        B       L_549F                          ; 54A7   0220 0009

L_54A9:
        MVI@    R4,     R1                      ; 54A9   02A1
        MVO     R1,     G_01E8                  ; 54AA   0241 01E8
L_54AC:
        PULR    R4                              ; 54AC   02B4
        PULR    R2                              ; 54AD   02B2
        PULR    R1                              ; 54AE   02B1
        MOVR    R5,     R7                      ; 54AF   00AF

        DECLE   $001B,  $0000,  $000B,  $0001   ; 54B0   001B 0000 000B 0001
        DECLE   $0009,  $0002,  $0019,  $0003   ; 54B4   0009 0002 0019 0003
        DECLE   $001D,  $0004,  $000D,  $0005   ; 54B8   001D 0004 000D 0005

        INCR    R4                              ; 54BC   000C
        CLRC                                    ; 54BD   0006
        COMR    R4                              ; 54BE   001C
        SETC                                    ; 54BF   0007
        COMR    R6                              ; 54C0   001E
        INCR    R0                              ; 54C1   0008
        INCR    R6                              ; 54C2   000E
        INCR    R1                              ; 54C3   0009
        CLRC                                    ; 54C4   0006
        INCR    R2                              ; 54C5   000A
        DECR    R6                              ; 54C6   0016
        INCR    R3                              ; 54C7   000B
L_54C8:
        DECR    R7                              ; 54C8   0017

        DECLE   $000C,  $0007,  $000D,  $0003   ; 54C9   000C 0007 000D 0003
        DECLE   $000E,  $0013,  $000F,  $0000   ; 54CD   000E 0013 000F 0000
        DECLE   $0000,  $007E,  $0001,  $00BE   ; 54D1   0000 007E 0001 00BE
        DECLE   $0002,  $00DE,  $0003,  $007D   ; 54D5   0002 00DE 0003 007D
        DECLE   $0004                           ; 54D9   0004

        RRC     R3,     2                       ; 54DA   0077
        INCR    R4                              ; 54DB   000C
        ADDR    R2,     R7                      ; 54DC   00D7

        DECLE   $000E,  $0000,  $0000           ; 54DD   000E 0000 0000
L_54E0:
        MVII    #$00F0, R0                      ; 54E0   02B8 00F0
        MVII    #$0200, R4                      ; 54E2   02BC 0200
        SDBD                                    ; 54E4   0001
        MVII    #$37FF, R1                      ; 54E5   02B9 00FF 0037
        J       X_FILL_MEM                      ; 54E8   0004 0314 0341

        PSHR    R5                              ; 54EB   0275
        MVII    #$0180, R0                      ; 54EC   02B8 0180
        MVII    #$0018, R4                      ; 54EE   02BC 0018

        JSR     R5,     L_556E                  ; 54F0   0004 0154 016E

        CLRR    R0                              ; 54F3   01C0
        MVII    #$0310, R4                      ; 54F4   02BC 0310

        JSR     R5,     L_556E                  ; 54F6   0004 0154 016E
        JSR     R5,     L_556E                  ; 54F9   0004 0154 016E
        JSR     R5,     L_556E                  ; 54FC   0004 0154 016E

        CLRR    R0                              ; 54FF   01C0
        MVII    #$0018, R4                      ; 5500   02BC 0018
L_5502:
        MVO@    R0,     R4                      ; 5502   0260
        CMPI    #$0020, R4                      ; 5503   037C 0020
        BNEQ    L_5502                          ; 5505   022C 0004

        MVII    #$0028, R4                      ; 5507   02BC 0028
        MVI     G_0188, R0                      ; 5509   0280 0188
        MVO@    R0,     R4                      ; 550B   0260
        MVI     G_0189, R0                      ; 550C   0280 0189
        MVO@    R0,     R4                      ; 550E   0260
        MVI     G_018A, R0                      ; 550F   0280 018A
        MVO@    R0,     R4                      ; 5511   0260
        MVI     G_018B, R0                      ; 5512   0280 018B
        MVO@    R0,     R4                      ; 5514   0260
        MVI     G_018C, R0                      ; 5515   0280 018C
        MVO@    R0,     R4                      ; 5517   0260
        MVO     R0,     .STIC.VIDEN             ; 5518   0240 0020
        MVI     G_035D, R4                      ; 551A   0284 035D
        TSTR    R4                              ; 551C   00A4
        BEQ     L_5560                          ; 551D   0204 0041

        SDBD                                    ; 551F   0001
        MVII    #$0546, R3                      ; 5520   02BB 0046 0005
        MVI     G_01ED, R1                      ; 5523   0281 01ED
        TSTR    R1                              ; 5525   0089
        BEQ     L_5530                          ; 5526   0204 0008

        MVI     G_035C, R4                      ; 5528   0284 035C
        MVI     G_035B, R0                      ; 552A   0280 035B
        SUBI    #$004F, R3                      ; 552C   033B 004F
        B       L_5545                          ; 552E   0200 0015

L_5530:
        SDBD                                    ; 5530   0001
        MVII    #$3800, R0                      ; 5531   02B8 0000 0038
        ADD@    R4,     R0                      ; 5534   02E0
        MVI@    R4,     R2                      ; 5535   02A2
        MOVR    R2,     R1                      ; 5536   0091
        ANDI    #$00FF, R1                      ; 5537   03B9 00FF
        ANDI    #$0200, R2                      ; 5539   03BA 0200
        BEQ     L_5543                          ; 553B   0204 0006

        MVI@    R4,     R5                      ; 553D   02A5
        MOVR    R5,     R4                      ; 553E   00AC
        SUBI    #$009A, R3                      ; 553F   033B 009A
        B       L_5545                          ; 5541   0200 0002

L_5543:
        SUBI    #$0080, R3                      ; 5543   033B 0080
L_5545:
        CMPI    #$00FA, R3                      ; 5545   037B 00FA
        BLT     L_5558                          ; 5547   0205 000F

        JSR     R5,     L_556E                  ; 5549   0004 0154 016E

        SUBI    #$00FA, R3                      ; 554C   033B 00FA
        DECR    R1                              ; 554E   0011
        BNEQ    L_5545                          ; 554F   022C 000B

        CLRR    R0                              ; 5551   01C0
        MVO     R0,     G_01ED                  ; 5552   0240 01ED
        MVO     R0,     G_035D                  ; 5554   0240 035D
        B       L_5560                          ; 5556   0200 0008

L_5558:
        MVO     R1,     G_01ED                  ; 5558   0241 01ED
        MVO     R4,     G_035C                  ; 555A   0244 035C
        MVO     R0,     G_035B                  ; 555C   0240 035B
        B       L_5560                          ; 555E   0200 0000

L_5560:
        MVI     G_01EE, R0                      ; 5560   0280 01EE
        INCR    R0                              ; 5562   0008
        MVO     R0,     G_01EE                  ; 5563   0240 01EE

        JSR     R5,     L_65B7                  ; 5565   0004 0164 01B7

        MVII    #$0001, R0                      ; 5568   02B8 0001

        JSR     R5,     X_RAND1                 ; 556A   0004 0114 027D

        PULR    R7                              ; 556D   02B7

L_556E:
        PSHR    R5                              ; 556E   0275
        MOVR    R0,     R5                      ; 556F   0085
        MVI@    R4,     R0                      ; 5570   02A0
        MVO@    R0,     R5                      ; 5571   0268
        MVI@    R4,     R0                      ; 5572   02A0
        MVO@    R0,     R5                      ; 5573   0268
        MVI@    R4,     R0                      ; 5574   02A0
        MVO@    R0,     R5                      ; 5575   0268
        MVI@    R4,     R0                      ; 5576   02A0
        MVO@    R0,     R5                      ; 5577   0268
        MVI@    R4,     R0                      ; 5578   02A0
        MVO@    R0,     R5                      ; 5579   0268
        MVI@    R4,     R0                      ; 557A   02A0
        MVO@    R0,     R5                      ; 557B   0268
        MVI@    R4,     R0                      ; 557C   02A0
        MVO@    R0,     R5                      ; 557D   0268
        MVI@    R4,     R0                      ; 557E   02A0
        MVO@    R0,     R5                      ; 557F   0268
        MOVR    R5,     R0                      ; 5580   00A8
        PULR    R7                              ; 5581   02B7

L_5582:
        PSHR    R2                              ; 5582   0272
        MOVR    R0,     R2                      ; 5583   0082
        CLRR    R0                              ; 5584   01C0
L_5585:
        CLRC                                    ; 5585   0006
        RRC     R1,     1                       ; 5586   0071
        BNC     L_558A                          ; 5587   0209 0001

        ADDR    R2,     R0                      ; 5589   00D0
L_558A:
        SLL     R2,     1                       ; 558A   004A
        TSTR    R1                              ; 558B   0089
        BNEQ    L_5585                          ; 558C   022C 0008

        PULR    R2                              ; 558E   02B2
        MOVR    R5,     R7                      ; 558F   00AF

L_5590:
        PSHR    R5                              ; 5590   0275
        CLRR    R4                              ; 5591   01E4

        JSR     R5,     L_5648                  ; 5592   0004 0154 0248

        INCR    R4                              ; 5595   000C

        JSR     R5,     L_5648                  ; 5596   0004 0154 0248

        INCR    R4                              ; 5599   000C

        JSR     R5,     L_5648                  ; 559A   0004 0154 0248

        MVI     G_01D4, R0                      ; 559D   0280 01D4
        TSTR    R0                              ; 559F   0080
        BNEQ    L_55F5                          ; 55A0   020C 0053

        CLRR    R4                              ; 55A2   01E4
        MVI     G_0187, R0                      ; 55A3   0280 0187
        MOVR    R0,     R1                      ; 55A5   0081
        ANDI    #$0070, R0                      ; 55A6   03B8 0070
        BEQ     L_563E                          ; 55A8   0204 0094

        MVII    #$0010, R2                      ; 55AA   02BA 0010
L_55AC:
        MOVR    R1,     R0                      ; 55AC   0088
        ANDR    R2,     R0                      ; 55AD   0190
        BEQ     L_55ED                          ; 55AE   0204 003D

        JSR     R5,     L_5D02                  ; 55B0   0004 015C 0102

        TSTR    R0                              ; 55B3   0080
        BEQ     L_55ED                          ; 55B4   0204 0037

        CMPI    #$00FF, R0                      ; 55B6   0378 00FF
        BEQ     L_55ED                          ; 55B8   0204 0033

        MOVR    R0,     R3                      ; 55BA   0083
        MVII    #$00FF, R0                      ; 55BB   02B8 00FF

        JSR     R5,     L_5D09                  ; 55BD   0004 015C 0109

        MVI     G_01E1, R0                      ; 55C0   0280 01E1
        SLL     R0,     2                       ; 55C2   004C
        SLL     R0,     2                       ; 55C3   004C

        JSR     R5,     L_5D29                  ; 55C4   0004 015C 0129

        PSHR    R1                              ; 55C7   0271
        PSHR    R2                              ; 55C8   0272
        MOVR    R3,     R2                      ; 55C9   009A
        SLL     R2,     2                       ; 55CA   004E
        ADDR    R3,     R2                      ; 55CB   00DA
        PSHR    R4                              ; 55CC   0274

        JSR     R5,     L_56F8                  ; 55CD   0004 0154 02F8

        SDBD                                    ; 55D0   0001
        MVII    #$563F, R4                      ; 55D1   02BC 003F 0056
        MVII    #$0090, R2                      ; 55D4   02BA 0090

        JSR     R5,     L_658E                  ; 55D6   0004 0164 018E

        MVI     G_01E6, R0                      ; 55D9   0280 01E6
        TSTR    R0                              ; 55DB   0080
        BEQ     L_55E2                          ; 55DC   0204 0004

        MVII    #$00FF, R0                      ; 55DE   02B8 00FF
        B       L_55E3                          ; 55E0   0200 0001

L_55E2:
        CLRR    R0                              ; 55E2   01C0
L_55E3:
        MVO     R0,     G_01A0                  ; 55E3   0240 01A0
        CLRR    R0                              ; 55E5   01C0
        MVO     R0,     G_0317                  ; 55E6   0240 0317
        MVO     R0,     G_031F                  ; 55E8   0240 031F
        PULR    R4                              ; 55EA   02B4
        PULR    R2                              ; 55EB   02B2
        PULR    R1                              ; 55EC   02B1
L_55ED:
        CMPI    #$0040, R2                      ; 55ED   037A 0040
        BEQ     L_563E                          ; 55EF   0204 004D

        INCR    R4                              ; 55F1   000C
        SLL     R2,     1                       ; 55F2   004A
        B       L_55AC                          ; 55F3   0220 0048

L_55F5:
        CMPI    #$0005, R0                      ; 55F5   0378 0005
        BNEQ    L_563E                          ; 55F7   020C 0045

        MVI     G_0187, R0                      ; 55F9   0280 0187
        ANDI    #$0040, R0                      ; 55FB   03B8 0040
        BEQ     L_563E                          ; 55FD   0204 003F

        CLRR    R0                              ; 55FF   01C0
        MVO     R0,     G_01D7                  ; 5600   0240 01D7
        MVO     R0,     G_01D8                  ; 5602   0240 01D8
        MVII    #$0064, R2                      ; 5604   02BA 0064

        JSR     R5,     L_56F8                  ; 5606   0004 0154 02F8

        SDBD                                    ; 5609   0001
        MVII    #$563F, R4                      ; 560A   02BC 003F 0056
        MVII    #$0090, R2                      ; 560D   02BA 0090

        JSR     R5,     L_658E                  ; 560F   0004 0164 018E

        MVII    #$0140, R4                      ; 5612   02BC 0140
        MVII    #$0010, R0                      ; 5614   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 5616   0004 0114 0338
        JSR     R5,     L_6544                  ; 5619   0004 0164 0144

        SDBD                                    ; 561C   0001
        MVII    #$08D7, R0                      ; 561D   02B8 00D7 0008
        MVO     R0,     G_0326                  ; 5620   0240 0326
        MVI     G_01D5, R0                      ; 5622   0280 01D5
        INCR    R0                              ; 5624   0008
        CMPI    #$0003, R0                      ; 5625   0378 0003
        BEQ     L_562F                          ; 5627   0204 0006

        MVO     R0,     G_01D5                  ; 5629   0240 01D5
        MVII    #$0003, R0                      ; 562B   02B8 0003
        B       L_563C                          ; 562D   0200 000D

L_562F:
        CLRR    R0                              ; 562F   01C0
        MVO     R0,     G_01D3                  ; 5630   0240 01D3

        JSR     R5,     L_5C22                  ; 5632   0004 015C 0022

        MVII    #$00FA, R2                      ; 5635   02BA 00FA

        JSR     R5,     L_56F8                  ; 5637   0004 0154 02F8

        MVII    #$0008, R0                      ; 563A   02B8 0008
L_563C:
        MVO     R0,     G_01D4                  ; 563C   0240 01D4
L_563E:
        PULR    R7                              ; 563E   02B7

        DECLE   $0050,  $0040,  $0000,  $0088   ; 563F   0050 0040 0000 0088
        DECLE   $0131,  $01BF                   ; 5643   0131 01BF

        MOVR    R4,     R0                      ; 5645   00A0
        COMR    R6                              ; 5646   001E
        ADDR    R6,     R0                      ; 5647   00F0
L_5648:
        PSHR    R5                              ; 5648   0275
        PSHR    R4                              ; 5649   0274
        MVI     G_01D4, R0                      ; 564A   0280 01D4
        CMPI    #$0006, R0                      ; 564C   0378 0006
        BEQ     L_56DE                          ; 564E   0204 008E

        CMPI    #$0007, R0                      ; 5650   0378 0007
        BEQ     L_56DE                          ; 5652   0204 008A

        JSR     R5,     L_5D02                  ; 5654   0004 015C 0102

        TSTR    R0                              ; 5657   0080
        BEQ     L_56E9                          ; 5658   0204 008F

        CMPI    #$00FF, R0                      ; 565A   0378 00FF
        BEQ     L_56E9                          ; 565C   0204 008B

        JSR     R5,     L_5D88                  ; 565E   0004 015C 0188

        ANDI    #$000F, R0                      ; 5661   03B8 000F
        BEQ     L_56E9                          ; 5663   0204 0084

        JSR     R5,     L_5D10                  ; 5665   0004 015C 0110

        SUB     G_0199, R0                      ; 5668   0300 0199
        BPL     L_566D                          ; 566A   0203 0001

        NEGR    R0                              ; 566C   0020
L_566D:
        CMPI    #$0004, R0                      ; 566D   0378 0004
        BGT     L_56E9                          ; 566F   020E 0078

        MVI     G_019C, R0                      ; 5671   0280 019C
        TSTR    R0                              ; 5673   0080
        BNEQ    L_56E9                          ; 5674   020C 0073

        MVI     G_019B, R0                      ; 5676   0280 019B
        TSTR    R0                              ; 5678   0080
        BNEQ    L_56E9                          ; 5679   020C 006E

        JSR     R5,     L_5D02                  ; 567B   0004 015C 0102

        CMPI    #$0004, R0                      ; 567E   0378 0004
        BEQ     L_56A3                          ; 5680   0204 0021

        CMPI    #$0005, R0                      ; 5682   0378 0005
        BEQ     L_56BE                          ; 5684   0204 0038

        CMPI    #$000A, R0                      ; 5686   0378 000A
        BEQ     L_56D2                          ; 5688   0204 0048

L_568A:
        MVII    #$0001, R0                      ; 568A   02B8 0001
        MVO     R0,     G_019B                  ; 568C   0240 019B
        MVI     G_0195, R0                      ; 568E   0280 0195
        CMPI    #$0014, R0                      ; 5690   0378 0014
        BLT     L_5698                          ; 5692   0205 0004

        CMPI    #$002C, R0                      ; 5694   0378 002C
        BLE     L_56E9                          ; 5696   0206 0051

L_5698:
        SDBD                                    ; 5698   0001
        MVII    #$5A89, R4                      ; 5699   02BC 0089 005A
        MVII    #$00B0, R2                      ; 569C   02BA 00B0

        JSR     R5,     L_658E                  ; 569E   0004 0164 018E

        B       L_56E9                          ; 56A1   0200 0046

L_56A3:
        MVI     G_0193, R0                      ; 56A3   0280 0193
        TSTR    R0                              ; 56A5   0080
        BNEQ    L_56E9                          ; 56A6   020C 0041

        MVI     G_01D1, R0                      ; 56A8   0280 01D1
        TSTR    R0                              ; 56AA   0080
        BEQ     L_56E9                          ; 56AB   0204 003C

        MVII    #$0040, R0                      ; 56AD   02B8 0040
        MVO     R0,     G_019C                  ; 56AF   0240 019C
        MVO     R4,     G_019D                  ; 56B1   0244 019D
        SDBD                                    ; 56B3   0001
        MVII    #$56EB, R4                      ; 56B4   02BC 00EB 0056
        MVII    #$00C0, R2                      ; 56B7   02BA 00C0

        JSR     R5,     L_658E                  ; 56B9   0004 0164 018E

        B       L_56E9                          ; 56BC   0200 002B

L_56BE:
        MVI     G_01AF, R0                      ; 56BE   0280 01AF
        TSTR    R0                              ; 56C0   0080
        BNEQ    L_56E9                          ; 56C1   020C 0026

        MVI     G_01E3, R0                      ; 56C3   0280 01E3
        SLL     R0,     1                       ; 56C5   0048
        MVO     R0,     G_01E3                  ; 56C6   0240 01E3
        MVI     G_01E1, R0                      ; 56C8   0280 01E1
        SLL     R0,     2                       ; 56CA   004C
        SLL     R0,     2                       ; 56CB   004C
        SLL     R0,     2                       ; 56CC   004C
        DECR    R0                              ; 56CD   0010
        MVO     R0,     G_01AF                  ; 56CE   0240 01AF
        B       L_56E9                          ; 56D0   0200 0017

L_56D2:
        JSR     R5,     L_5D2E                  ; 56D2   0004 015C 012E

        TSTR    R0                              ; 56D5   0080
        BEQ     L_56E9                          ; 56D6   0204 0011

        MVII    #$0030, R0                      ; 56D8   02B8 0030
        MVO     R0,     G_017E                  ; 56DA   0240 017E
        B       L_568A                          ; 56DC   0220 0053

L_56DE:
        MVI     G_0186, R0                      ; 56DE   0280 0186
        ANDI    #$000F, R0                      ; 56E0   03B8 000F
        BEQ     L_56E9                          ; 56E2   0204 0005

        MVI     G_019B, R0                      ; 56E4   0280 019B
        TSTR    R0                              ; 56E6   0080
        BEQ     L_568A                          ; 56E7   0224 005E

L_56E9:
        PULR    R4                              ; 56E9   02B4
        PULR    R7                              ; 56EA   02B7

        DECLE   $0138,  $018C,  $0101,  $0000   ; 56EB   0138 018C 0101 0000
        DECLE   $0040,  $00FF,  $0114,  $0001   ; 56EF   0040 00FF 0114 0001

        SWAP    R3,     1                       ; 56F3   0043
        ADDR    R6,     R0                      ; 56F4   00F0
L_56F5:
        PSHR    R5                              ; 56F5   0275
        B       L_570F                          ; 56F6   0200 0017

L_56F8:
        PSHR    R5                              ; 56F8   0275
        MVII    #$0001, R0                      ; 56F9   02B8 0001
        MVI     G_01D1, R1                      ; 56FB   0281 01D1
        CMPI    #$0080, R1                      ; 56FD   0379 0080
        BLT     L_570B                          ; 56FF   0205 000A

        SUBI    #$0060, R1                      ; 5701   0339 0060
        SLR     R1,     2                       ; 5703   0065
        SLR     R1,     2                       ; 5704   0065
        SLR     R1,     1                       ; 5705   0061
        ADDR    R1,     R0                      ; 5706   00C8
        MVI     G_01D2, R1                      ; 5707   0281 01D2
        SLR     R1,     1                       ; 5709   0061
        ADDR    R1,     R0                      ; 570A   00C8
L_570B:
        MOVR    R2,     R1                      ; 570B   0091

        JSR     R5,     L_5582                  ; 570C   0004 0154 0182

L_570F:
        MOVR    R0,     R2                      ; 570F   0082
        MVI     G_01E5, R3                      ; 5710   0283 01E5
        CMPI    #$0002, R3                      ; 5712   037B 0002
        BEQ     L_571A                          ; 5714   0204 0004

        MVII    #$0350, R5                      ; 5716   02BD 0350
        B       L_571C                          ; 5718   0200 0002

L_571A:
        MVII    #$0352, R5                      ; 571A   02BD 0352
L_571C:
        MVI@    R5,     R0                      ; 571C   02A8
        MVI@    R5,     R1                      ; 571D   02A9
        SUBI    #$0002, R5                      ; 571E   033D 0002
        ADDR    R2,     R0                      ; 5720   00D0
L_5721:
        SDBD                                    ; 5721   0001
        CMPI    #$270F, R0                      ; 5722   0378 000F 0027
        BLE     L_572E                          ; 5725   0206 0007

        SDBD                                    ; 5727   0001
        SUBI    #$2710, R0                      ; 5728   0338 0010 0027
        INCR    R1                              ; 572B   0009
        B       L_5721                          ; 572C   0220 000C

L_572E:
        MVO@    R0,     R5                      ; 572E   0268
        MVO@    R1,     R5                      ; 572F   0269
        PSHR    R4                              ; 5730   0274
        CMPI    #$0002, R3                      ; 5731   037B 0002
        BEQ     L_5739                          ; 5733   0204 0004

        MVII    #$0200, R4                      ; 5735   02BC 0200
        B       L_573B                          ; 5737   0200 0002

L_5739:
        MVII    #$020E, R4                      ; 5739   02BC 020E
L_573B:
        PSHR    R0                              ; 573B   0270
        MOVR    R1,     R0                      ; 573C   0088
        MVII    #$0007, R3                      ; 573D   02BB 0007
        MVII    #$0002, R1                      ; 573F   02B9 0002
        PSHR    R4                              ; 5741   0274

        JSR     R5,     X_PRNUM_RGT             ; 5742   0004 0118 00C5

        PULR    R4                              ; 5745   02B4
        ADDI    #$0002, R4                      ; 5746   02FC 0002
        PULR    R0                              ; 5748   02B0
        MVII    #$0004, R1                      ; 5749   02B9 0004

        JSR     R5,     X_PRNUM_ZRO             ; 574B   0004 0118 00AD

        PULR    R4                              ; 574E   02B4
        PULR    R7                              ; 574F   02B7

L_5750:
        PSHR    R5                              ; 5750   0275
        MVI     G_01AF, R0                      ; 5751   0280 01AF
        TSTR    R0                              ; 5753   0080
        BNEQ    L_5ACF                          ; 5754   020C 0379

L_5756:
        MVI     G_019C, R0                      ; 5756   0280 019C
        TSTR    R0                              ; 5758   0080
        BNEQ    L_5991                          ; 5759   020C 0236

        MVI     G_0193, R0                      ; 575B   0280 0193
        TSTR    R0                              ; 575D   0080
        BNEQ    L_5ADB                          ; 575E   020C 037B

        MVI     G_0192, R0                      ; 5760   0280 0192
        TSTR    R0                              ; 5762   0080
        BNEQ    L_5982                          ; 5763   020C 021D

        MVI     G_019B, R0                      ; 5765   0280 019B
        TSTR    R0                              ; 5767   0080
        BNEQ    L_59CA                          ; 5768   020C 0260

        MVI     G_0190, R0                      ; 576A   0280 0190
        INCR    R0                              ; 576C   0008
        MVO     R0,     G_0190                  ; 576D   0240 0190
        CMP     G_01E3, R0                      ; 576F   0340 01E3
        BLT     L_5967                          ; 5771   0205 01F4

        CLRR    R0                              ; 5773   01C0
        MVO     R0,     G_0190                  ; 5774   0240 0190
        MVI     G_032F, R0                      ; 5776   0280 032F
        TSTR    R0                              ; 5778   0080
        BNEQ    L_5785                          ; 5779   020C 000A

        MVI     G_01A0, R0                      ; 577B   0280 01A0
        TSTR    R0                              ; 577D   0080
        BNEQ    L_5785                          ; 577E   020C 0005

        MVI     G_01E6, R0                      ; 5780   0280 01E6
        TSTR    R0                              ; 5782   0080
        BNEQ    L_5B0B                          ; 5783   020C 0386

L_5785:
        MVI     G_01E7, R0                      ; 5785   0280 01E7
        CMPI    #$0010, R0                      ; 5787   0378 0010
        BGE     L_5967                          ; 5789   020D 01DC

        MVI     G_0195, R1                      ; 578B   0281 0195
        CMPI    #$0014, R1                      ; 578D   0379 0014
        BLT     L_583B                          ; 578F   0205 00AA

        CMPI    #$002C, R1                      ; 5791   0379 002C
        BGT     L_584F                          ; 5793   020E 00BA

        MVI     G_01D2, R3                      ; 5795   0283 01D2
        ANDI    #$0001, R3                      ; 5797   03BB 0001
        BEQ     L_57A4                          ; 5799   0204 0009

        MVI     G_01AE, R3                      ; 579B   0283 01AE
        INCR    R3                              ; 579D   000B
        MVO     R3,     G_01AE                  ; 579E   0243 01AE
        ANDI    #$0001, R3                      ; 57A0   03BB 0001
        BNEQ    L_5967                          ; 57A2   020C 01C3

L_57A4:
        CMPI    #$0002, R0                      ; 57A4   0378 0002
        BLT     L_57B4                          ; 57A6   0205 000C

        CMPI    #$0007, R0                      ; 57A8   0378 0007
        BLT     L_57F5                          ; 57AA   0205 0049

        CMPI    #$000A, R0                      ; 57AC   0378 000A
        BLT     L_57D5                          ; 57AE   0205 0025

        CMPI    #$000F, R0                      ; 57B0   0378 000F
        BLT     L_5817                          ; 57B2   0205 0063

L_57B4:
        MVI     G_01D4, R0                      ; 57B4   0280 01D4
        TSTR    R0                              ; 57B6   0080
        BNEQ    L_5967                          ; 57B7   020C 01AE

        MVI     G_01D1, R0                      ; 57B9   0280 01D1
        CMPI    #$00FF, R0                      ; 57BB   0378 00FF
        BEQ     L_5967                          ; 57BD   0204 01A8

        MVI     G_0191, R1                      ; 57BF   0281 0191
        INCR    R1                              ; 57C1   0009
        MVO     R1,     G_0191                  ; 57C2   0241 0191
        CMPI    #$0004, R1                      ; 57C4   0379 0004
        BLT     L_5948                          ; 57C6   0205 0180

        CLRR    R1                              ; 57C8   01C9
        MVO     R1,     G_0191                  ; 57C9   0241 0191
        INCR    R0                              ; 57CB   0008
        MVO     R0,     G_01D1                  ; 57CC   0240 01D1

        JSR     R5,     L_5BF1                  ; 57CE   0004 0158 03F1

        MVII    #$0003, R1                      ; 57D1   02B9 0003
        B       L_5863                          ; 57D3   0200 008E

L_57D5:
        MVI     G_01D4, R0                      ; 57D5   0280 01D4
        TSTR    R0                              ; 57D7   0080
        BNEQ    L_5967                          ; 57D8   020C 018D

        MVI     G_01D1, R0                      ; 57DA   0280 01D1
        TSTR    R0                              ; 57DC   0080
        BEQ     L_5967                          ; 57DD   0204 0188

        MVI     G_0191, R1                      ; 57DF   0281 0191
        INCR    R1                              ; 57E1   0009
        MVO     R1,     G_0191                  ; 57E2   0241 0191
        CMPI    #$0004, R1                      ; 57E4   0379 0004
        BLT     L_5948                          ; 57E6   0205 0160

        CLRR    R1                              ; 57E8   01C9
        MVO     R1,     G_0191                  ; 57E9   0241 0191
        DECR    R0                              ; 57EB   0010
        MVO     R0,     G_01D1                  ; 57EC   0240 01D1

        JSR     R5,     L_5C1B                  ; 57EE   0004 015C 001B

        MVII    #$0004, R1                      ; 57F1   02B9 0004
        B       L_5863                          ; 57F3   0200 006E

L_57F5:
        MVI     G_01D1, R1                      ; 57F5   0281 01D1
        CMPI    #$00BF, R1                      ; 57F7   0379 00BF
        BEQ     L_5803                          ; 57F9   0204 0008

        CMPI    #$00DF, R1                      ; 57FB   0379 00DF
        BEQ     L_5803                          ; 57FD   0204 0004

        CMPI    #$00FF, R1                      ; 57FF   0379 00FF
        BNEQ    L_580C                          ; 5801   020C 0009

L_5803:
        MVI     G_0195, R1                      ; 5803   0281 0195
        CMPI    #$0014, R1                      ; 5805   0379 0014
        BNEQ    L_580C                          ; 5807   020C 0003
        J       L_5B3E                          ; 5809   0004 0358 033E

L_580C:
        MVII    #$0001, R1                      ; 580C   02B9 0001
L_580E:
        MVI     G_0195, R0                      ; 580E   0280 0195
        CMPI    #$000C, R0                      ; 5810   0378 000C
        BEQ     L_5967                          ; 5812   0204 0153

        DECR    R0                              ; 5814   0010
        B       L_5837                          ; 5815   0200 0020

L_5817:
        MVI     G_01D1, R1                      ; 5817   0281 01D1
        CMPI    #$009F, R1                      ; 5819   0379 009F
        BEQ     L_5825                          ; 581B   0204 0008

        CMPI    #$00BF, R1                      ; 581D   0379 00BF
        BEQ     L_5825                          ; 581F   0204 0004

        CMPI    #$00FF, R1                      ; 5821   0379 00FF
        BNEQ    L_582E                          ; 5823   020C 0009

L_5825:
        MVI     G_0195, R1                      ; 5825   0281 0195
        CMPI    #$002C, R1                      ; 5827   0379 002C
        BNEQ    L_582E                          ; 5829   020C 0003
        J       L_5B3E                          ; 582B   0004 0358 033E

L_582E:
        MVII    #$0002, R1                      ; 582E   02B9 0002
L_5830:
        MVI     G_0195, R0                      ; 5830   0280 0195
        CMPI    #$0034, R0                      ; 5832   0378 0034
        BEQ     L_5967                          ; 5834   0204 0131

        INCR    R0                              ; 5836   0008
L_5837:
        MVO     R0,     G_0195                  ; 5837   0240 0195
        B       L_5863                          ; 5839   0200 0028

L_583B:
        MVII    #$0005, R1                      ; 583B   02B9 0005
        CMPI    #$0002, R0                      ; 583D   0378 0002
        BLT     L_580E                          ; 583F   0225 0032

        CMPI    #$0006, R0                      ; 5841   0378 0006
        BLE     L_5967                          ; 5843   0206 0122

        CMPI    #$000A, R0                      ; 5845   0378 000A
        BLT     L_5830                          ; 5847   0225 0018

        CMPI    #$000E, R0                      ; 5849   0378 000E
        BLE     L_5967                          ; 584B   0206 011A
        B       L_580E                          ; 584D   0220 0040

L_584F:
        MVII    #$0006, R1                      ; 584F   02B9 0006
        CMPI    #$0002, R0                      ; 5851   0378 0002
        BLT     L_5830                          ; 5853   0225 0024

        CMPI    #$0006, R0                      ; 5855   0378 0006
        BLE     L_5967                          ; 5857   0206 010E

        CMPI    #$000A, R0                      ; 5859   0378 000A
        BLT     L_580E                          ; 585B   0225 004E

        CMPI    #$000E, R0                      ; 585D   0378 000E
        BLE     L_5967                          ; 585F   0206 0106
        B       L_5830                          ; 5861   0220 0032

L_5863:
        TSTR    R1                              ; 5863   0089
        BEQ     L_58A9                          ; 5864   0204 0043

        CMP     G_0196, R1                      ; 5866   0341 0196
        BEQ     L_58A9                          ; 5868   0204 003F

        MVO     R1,     G_0196                  ; 586A   0241 0196
        DECR    R1                              ; 586C   0011
        MOVR    R1,     R0                      ; 586D   0088
        ADDR    R0,     R0                      ; 586E   00C0
        ADDR    R1,     R0                      ; 586F   00C8
        SDBD                                    ; 5870   0001
        ADDI    #$6AB3, R0                      ; 5871   02F8 00B3 006A
        MOVR    R0,     R4                      ; 5874   0084
        MVI@    R4,     R3                      ; 5875   02A3
        MVI@    R4,     R2                      ; 5876   02A2
        MVI@    R4,     R1                      ; 5877   02A1
        SLL     R3,     1                       ; 5878   004B
        MVO     R3,     G_032C                  ; 5879   0243 032C
        CMP     G_01AD, R1                      ; 587B   0341 01AD
        BEQ     L_588C                          ; 587D   0204 000D

        MVO     R1,     G_01AD                  ; 587F   0241 01AD
        MOVR    R1,     R4                      ; 5881   008C
        ADDR    R4,     R4                      ; 5882   00E4
        SDBD                                    ; 5883   0001
        ADDI    #$6AC5, R4                      ; 5884   02FC 00C5 006A
        SDBD                                    ; 5887   0001
        MVI@    R4,     R0                      ; 5888   02A0

        JSR     R5,     L_6556                  ; 5889   0004 0164 0156

L_588C:
        CMP     G_0197, R2                      ; 588C   0342 0197
        BEQ     L_58A9                          ; 588E   0204 0019

        MVO     R2,     G_0197                  ; 5890   0242 0197
        ADDR    R2,     R2                      ; 5892   00D2
        SDBD                                    ; 5893   0001
        ADDI    #$6ACB, R2                      ; 5894   02FA 00CB 006A
        MOVR    R2,     R4                      ; 5897   0094
        SDBD                                    ; 5898   0001
        MVI@    R4,     R0                      ; 5899   02A0

        JSR     R5,     L_6556                  ; 589A   0004 0164 0156

        CLRR    R0                              ; 589D   01C0
        MVO     R0,     G_0198                  ; 589E   0240 0198
        MVO     R0,     G_0328                  ; 58A0   0240 0328
        NOP                                     ; 58A2   0034
        MVO     R0,     G_0329                  ; 58A3   0240 0329
        MVO     R0,     G_032A                  ; 58A5   0240 032A
        MVO     R0,     G_032B                  ; 58A7   0240 032B
L_58A9:
        MVI     G_0198, R0                      ; 58A9   0280 0198
        SDBD                                    ; 58AB   0001
        MVII    #$58D6, R4                      ; 58AC   02BC 00D6 0058
        ADD     G_0197, R4                      ; 58AF   02C4 0197
        ADD     G_0197, R4                      ; 58B1   02C4 0197
        SDBD                                    ; 58B3   0001
        MVI@    R4,     R1                      ; 58B4   02A1
        MOVR    R1,     R4                      ; 58B5   008C
        MVI@    R4,     R1                      ; 58B6   02A1
        INCR    R0                              ; 58B7   0008
        CMPR    R1,     R0                      ; 58B8   0148
        BNEQ    L_58BC                          ; 58B9   020C 0001

        CLRR    R0                              ; 58BB   01C0
L_58BC:
        MVO     R0,     G_0198                  ; 58BC   0240 0198
        ADDR    R0,     R4                      ; 58BE   00C4
        MVI@    R4,     R0                      ; 58BF   02A0
        MOVR    R0,     R1                      ; 58C0   0081
        ANDI    #$0010, R1                      ; 58C1   03B9 0010
        BEQ     L_58D2                          ; 58C3   0204 000D

        MOVR    R0,     R1                      ; 58C5   0081
        ANDI    #$0020, R1                      ; 58C6   03B9 0020
        BNEQ    L_58CD                          ; 58C8   020C 0003

        CLRR    R1                              ; 58CA   01C9
        B       L_58D0                          ; 58CB   0200 0003

L_58CD:
        MVII    #$03FF, R1                      ; 58CD   02B9 03FF
        INCR    R1                              ; 58CF   0009
L_58D0:
        MVO     R1,     G_032C                  ; 58D0   0241 032C
L_58D2:
        ANDI    #$000F, R0                      ; 58D2   03B8 000F
        B       L_5902                          ; 58D4   0200 002C

        ADDR    R3,     R6                      ; 58D6   00DE
        SLLC    R0,     1                       ; 58D7   0058
        ADDR    R4,     R7                      ; 58D8   00E7

        SLLC    R0,     1                       ; 58D9   0058
        ADDR    R4,     R7                      ; 58DA   00E7

        DECLE   $0058,  $00F0,  $0058,  $0008   ; 58DB   0058 00F0 0058 0008
        DECLE   $0000,  $0001,  $0002,  $0003   ; 58DF   0000 0001 0002 0003
        DECLE   $0000,  $0003,  $0002,  $0001   ; 58E3   0000 0003 0002 0001
        DECLE   $0008,  $0010,  $0011,  $0012   ; 58E7   0008 0010 0011 0012
        DECLE   $0031,  $0030,  $0031,  $0012   ; 58EB   0031 0030 0031 0012
        DECLE   $0011,  $000A,  $0000,  $0001   ; 58EF   0011 000A 0000 0001
        DECLE   $0002,  $0000,  $0003,  $0002   ; 58F3   0002 0000 0003 0002
        DECLE   $0003,  $0000,  $0002,  $0001   ; 58F7   0003 0000 0002 0001
        DECLE   $0014,  $0001,  $0000,  $0001   ; 58FB   0014 0001 0000 0001
        DECLE   $0002,  $0001,  $0000           ; 58FF   0002 0001 0000
L_5902:
        PSHR    R0                              ; 5902   0270
        MVI     G_0195, R2                      ; 5903   0282 0195
        MVI     G_0199, R3                      ; 5905   0283 0199

        JSR     R5,     L_6A21                  ; 5907   0004 0168 0221

        ADD     G_032C, R1                      ; 590A   02C1 032C
        ADDI    #$0080, R1                      ; 590C   02F9 0080
        MOVR    R1,     R2                      ; 590E   008A
        ADDI    #$0300, R0                      ; 590F   02F8 0300
        SUBI    #$0004, R1                      ; 5911   0339 0004
        ADDI    #$0004, R2                      ; 5913   02FA 0004
        PULR    R3                              ; 5915   02B3
        ADDR    R3,     R3                      ; 5916   00DB
        NEGR    R3                              ; 5917   0023
        ADDI    #$009D, R3                      ; 5918   02FB 009D
        SLL     R3,     2                       ; 591A   004F
        SLL     R3,     2                       ; 591B   004F
        MOVR    R3,     R5                      ; 591C   009D
        SUBI    #$0010, R5                      ; 591D   033D 0010
        SDBD                                    ; 591F   0001
        XORI    #$1002, R3                      ; 5920   03FB 0002 0010
        ADD     G_032A, R1                      ; 5923   02C1 032A
        ADD     G_032B, R2                      ; 5925   02C2 032B
        PSHR    R0                              ; 5927   0270
        ADD     G_0328, R0                      ; 5928   02C0 0328
        MVO     R0,     G_0310                  ; 592A   0240 0310
        MVO     R1,     G_0318                  ; 592C   0241 0318
        NOP                                     ; 592E   0034
        MVO     R0,     G_0311                  ; 592F   0240 0311
        MVO     R1,     G_0319                  ; 5931   0241 0319
        PULR    R0                              ; 5933   02B0
        ADD     G_0329, R0                      ; 5934   02C0 0329
        MVO     R0,     G_0312                  ; 5936   0240 0312
        MVO     R2,     G_031A                  ; 5938   0242 031A
        MVO     R3,     G_0322                  ; 593A   0243 0322
        NOP                                     ; 593C   0034
        MVO     R0,     G_0313                  ; 593D   0240 0313
        MVO     R2,     G_031B                  ; 593F   0242 031B
        MVO     R5,     G_0323                  ; 5941   0245 0323
        MVI     G_019B, R0                      ; 5943   0280 019B
        TSTR    R0                              ; 5945   0080
        BNEQ    L_5967                          ; 5946   020C 001F

L_5948:
        MVI     G_019A, R0                      ; 5948   0280 019A
        INCR    R0                              ; 594A   0008
        MVO     R0,     G_019A                  ; 594B   0240 019A
        CMPI    #$0008, R0                      ; 594D   0378 0008
        BEQ     L_595E                          ; 594F   0204 000D

        CMPI    #$0010, R0                      ; 5951   0378 0010
        BNEQ    L_5967                          ; 5953   020C 0012

        CLRR    R0                              ; 5955   01C0
        MVO     R0,     G_019A                  ; 5956   0240 019A
        SDBD                                    ; 5958   0001
        MVII    #$5975, R4                      ; 5959   02BC 0075 0059
        B       L_5962                          ; 595C   0200 0004

L_595E:
        SDBD                                    ; 595E   0001
        MVII    #$5968, R4                      ; 595F   02BC 0068 0059
L_5962:
        MVII    #$0020, R2                      ; 5962   02BA 0020

        JSR     R5,     L_658E                  ; 5964   0004 0164 018E

L_5967:
        PULR    R7                              ; 5967   02B7

        DECLE   $0331,  $03BF,  $0050,  $0000   ; 5968   0331 03BF 0050 0000
        DECLE   $00C0,  $0080,  $0104,  $00F8   ; 596C   00C0 0080 0104 00F8
        DECLE   $0138,  $018E,  $00A0,  $0006   ; 5970   0138 018E 00A0 0006
        DECLE   $00F0,  $0331,  $03BF,  $0050   ; 5974   00F0 0331 03BF 0050
        DECLE   $0000                           ; 5978   0000

        ADDR    R0,     R0                      ; 5979   00C0
        TSTR    R0                              ; 597A   0080
        SUBR    R0,     R3                      ; 597B   0103
        ADDR    R7,     R0                      ; 597C   00F8
        SUBR    R7,     R0                      ; 597D   0138
        ANDR    R1,     R6                      ; 597E   018E
        MOVR    R4,     R0                      ; 597F   00A0
        CLRC                                    ; 5980   0006
        ADDR    R6,     R0                      ; 5981   00F0
L_5982:
        CLRR    R0                              ; 5982   01C0
        MVO     R0,     G_0192                  ; 5983   0240 0192
        MVII    #$0010, R0                      ; 5985   02B8 0010
        MVO     R0,     G_0196                  ; 5987   0240 0196
        MVO     R0,     G_0197                  ; 5989   0240 0197
        MVO     R0,     G_01AD                  ; 598B   0240 01AD
        MVII    #$0003, R1                      ; 598D   02B9 0003
        B       L_5863                          ; 598F   0220 012D

L_5991:
        DECR    R0                              ; 5991   0010
        BEQ     L_59B1                          ; 5992   0204 001D

        MVO     R0,     G_019C                  ; 5994   0240 019C
        MVI     G_01D1, R0                      ; 5996   0280 01D1
        DECR    R0                              ; 5998   0010
        MVO     R0,     G_01D1                  ; 5999   0240 01D1

        JSR     R5,     L_5C1B                  ; 599B   0004 015C 001B

        MVI     G_01D1, R0                      ; 599E   0280 01D1
        TSTR    R0                              ; 59A0   0080
        BEQ     L_59B1                          ; 59A1   0204 000E

        MVI     G_019D, R4                      ; 59A3   0284 019D
        MVI     G_0199, R0                      ; 59A5   0280 0199

        JSR     R5,     L_5D15                  ; 59A7   0004 015C 0115

        MVI     G_0195, R0                      ; 59AA   0280 0195

        JSR     R5,     L_5D1F                  ; 59AC   0004 015C 011F

        B       L_5967                          ; 59AF   0220 0049

L_59B1:
        CLRR    R0                              ; 59B1   01C0
        MVO     R0,     G_019C                  ; 59B2   0240 019C
        MVI     G_019D, R4                      ; 59B4   0284 019D

        JSR     R5,     L_5D09                  ; 59B6   0004 015C 0109
        JSR     R5,     L_5D6F                  ; 59B9   0004 015C 016F

        SDBD                                    ; 59BC   0001
        MVII    #$59C9, R4                      ; 59BD   02BC 00C9 0059
        MVII    #$00C0, R2                      ; 59C0   02BA 00C0
        MVII    #$0001, R1                      ; 59C2   02B9 0001

        JSR     R5,     L_658E                  ; 59C4   0004 0164 018E

        B       L_5967                          ; 59C7   0220 0061

        ADDR    R6,     R0                      ; 59C9   00F0
L_59CA:
        CMPI    #$0001, R0                      ; 59CA   0378 0001
        BEQ     L_5A48                          ; 59CC   0204 007A

        MVI     G_01E1, R1                      ; 59CE   0281 01E1
        SLL     R1,     2                       ; 59D0   004D
        MVI     G_0190, R0                      ; 59D1   0280 0190
        INCR    R0                              ; 59D3   0008
        MVO     R0,     G_0190                  ; 59D4   0240 0190
        CMPR    R0,     R1                      ; 59D6   0141
        BNEQ    L_5967                          ; 59D7   022C 0071

        CLRR    R0                              ; 59D9   01C0
        MVO     R0,     G_0190                  ; 59DA   0240 0190
L_59DC:
        MVI     G_0198, R0                      ; 59DC   0280 0198
        CMPI    #$0006, R0                      ; 59DE   0378 0006
        BGE     L_5A08                          ; 59E0   020D 0026

        MOVR    R0,     R1                      ; 59E2   0081
        INCR    R1                              ; 59E3   0009
        MVO     R1,     G_0198                  ; 59E4   0241 0198
        SDBD                                    ; 59E6   0001
        MVII    #$58FB, R4                      ; 59E7   02BC 00FB 0058
        INCR    R0                              ; 59EA   0008
        ADDR    R0,     R4                      ; 59EB   00C4
        MVI@    R4,     R0                      ; 59EC   02A0
        PSHR    R0                              ; 59ED   0270
        SDBD                                    ; 59EE   0001
        MVII    #$5AAF, R4                      ; 59EF   02BC 00AF 005A
        SLL     R0,     2                       ; 59F2   004C
        SLL     R0,     1                       ; 59F3   0048
        ADDR    R0,     R4                      ; 59F4   00C4
        SDBD                                    ; 59F5   0001
        MVI@    R4,     R0                      ; 59F6   02A0
        MVO     R0,     G_0328                  ; 59F7   0240 0328
        SDBD                                    ; 59F9   0001
        MVI@    R4,     R0                      ; 59FA   02A0
        MVO     R0,     G_0329                  ; 59FB   0240 0329
        SDBD                                    ; 59FD   0001
        MVI@    R4,     R0                      ; 59FE   02A0
        MVO     R0,     G_032A                  ; 59FF   0240 032A
        SDBD                                    ; 5A01   0001
        MVI@    R4,     R0                      ; 5A02   02A0
        MVO     R0,     G_032B                  ; 5A03   0240 032B
        PULR    R0                              ; 5A05   02B0
        B       L_5902                          ; 5A06   0220 0105

L_5A08:
        CMPI    #$0007, R0                      ; 5A08   0378 0007
        BNEQ    L_5A22                          ; 5A0A   020C 0016

        INCR    R0                              ; 5A0C   0008
        MVO     R0,     G_0198                  ; 5A0D   0240 0198
        SDBD                                    ; 5A0F   0001
        MVII    #$6D85, R0                      ; 5A10   02B8 0085 006D

        JSR     R5,     L_6556                  ; 5A13   0004 0164 0156

        MVII    #$0008, R0                      ; 5A16   02B8 0008
        NEGR    R0                              ; 5A18   0020
        MVO     R0,     G_0328                  ; 5A19   0240 0328
        MVII    #$000B, R0                      ; 5A1B   02B8 000B
        MVO     R0,     G_032A                  ; 5A1D   0240 032A
        CLRR    R0                              ; 5A1F   01C0
        B       L_5902                          ; 5A20   0220 011F

L_5A22:
        INCR    R0                              ; 5A22   0008
        MVO     R0,     G_0198                  ; 5A23   0240 0198
        CMPI    #$000B, R0                      ; 5A25   0378 000B
        BNEQ    L_5967                          ; 5A27   022C 00C1

        CLRR    R0                              ; 5A29   01C0
        MVO     R0,     G_019B                  ; 5A2A   0240 019B
        MVI     G_01D0, R0                      ; 5A2C   0280 01D0
        DECR    R0                              ; 5A2E   0010
        MVO     R0,     G_01D0                  ; 5A2F   0240 01D0
        MVI     G_01E5, R0                      ; 5A31   0280 01E5
        CMPI    #$0002, R0                      ; 5A33   0378 0002
        BEQ     L_5A3B                          ; 5A35   0204 0004

        MVII    #$0150, R1                      ; 5A37   02B9 0150
        B       L_5A3D                          ; 5A39   0200 0002

L_5A3B:
        MVII    #$0160, R1                      ; 5A3B   02B9 0160
L_5A3D:
        MVII    #$01D0, R4                      ; 5A3D   02BC 01D0
        MVII    #$0008, R0                      ; 5A3F   02B8 0008

        JSR     R5,     .EXEC.730               ; 5A41   0004 0114 0330

        DECR    R6                              ; 5A44   0016
        J       L_51F9                          ; 5A45   0004 0350 01F9

L_5A48:
        MVI     G_0190, R0                      ; 5A48   0280 0190
        INCR    R0                              ; 5A4A   0008
        MVO     R0,     G_0190                  ; 5A4B   0240 0190
        MVI     G_01E1, R1                      ; 5A4D   0281 01E1
        SLL     R1,     1                       ; 5A4F   0049
        CMPR    R1,     R0                      ; 5A50   0148
        BLT     L_5967                          ; 5A51   0225 00EB

        CLRR    R0                              ; 5A53   01C0
        MVO     R0,     G_0190                  ; 5A54   0240 0190
        MVI     G_0195, R0                      ; 5A56   0280 0195
        CMPI    #$0014, R0                      ; 5A58   0378 0014
        BLT     L_5A80                          ; 5A5A   0205 0024

        CMPI    #$002C, R0                      ; 5A5C   0378 002C
        BGT     L_5A83                          ; 5A5E   020E 0023

        SDBD                                    ; 5A60   0001
        MVII    #$5A93, R4                      ; 5A61   02BC 0093 005A
        MVII    #$00B0, R2                      ; 5A64   02BA 00B0
        MVII    #$000B, R1                      ; 5A66   02B9 000B

        JSR     R5,     L_658E                  ; 5A68   0004 0164 018E

        MVI     G_019B, R0                      ; 5A6B   0280 019B
        INCR    R0                              ; 5A6D   0008
        MVO     R0,     G_019B                  ; 5A6E   0240 019B
        CLRR    R0                              ; 5A70   01C0
        MVO     R0,     G_032C                  ; 5A71   0240 032C
        MVO     R0,     G_0190                  ; 5A73   0240 0190
        MVO     R0,     G_0198                  ; 5A75   0240 0198
        SDBD                                    ; 5A77   0001
        MVII    #$6D03, R0                      ; 5A78   02B8 0003 006D

        JSR     R5,     L_6556                  ; 5A7B   0004 0164 0156

        B       L_59DC                          ; 5A7E   0220 00A3

L_5A80:
        INCR    R0                              ; 5A80   0008
        B       L_5A84                          ; 5A81   0200 0001

L_5A83:
        DECR    R0                              ; 5A83   0010
L_5A84:
        MVO     R0,     G_0195                  ; 5A84   0240 0195
        CLRR    R0                              ; 5A86   01C0
        B       L_5902                          ; 5A87   0220 0186

        DECLE   $0138,  $018C,  $0101,  $0000   ; 5A89   0138 018C 0101 0000
        DECLE   $0040,  $0080,  $0111,  $0000   ; 5A8D   0040 0080 0111 0000
        DECLE   $0043,  $00F0,  $0050,  $0040   ; 5A91   0043 00F0 0050 0040
        DECLE   $0000,  $0138,  $01BF           ; 5A95   0000 0138 01BF

        SUBR    R0,     R0                      ; 5A98   0100
        ADDR    R5,     R7                      ; 5A99   00EF

        MOVR    R4,     R0                      ; 5A9A   00A0
        INCR    R4                              ; 5A9B   000C
        MOVR    R4,     R0                      ; 5A9C   00A0
        COMR    R0                              ; 5A9D   0018
        SUBR    R0,     R1                      ; 5A9E   0101
        COMR    R4                              ; 5A9F   001C
        MOVR    R4,     R0                      ; 5AA0   00A0
        COMR    R0                              ; 5AA1   0018
        SUBR    R0,     R0                      ; 5AA2   0100
        ADDR    R2,     R5                      ; 5AA3   00D5
        MOVR    R4,     R0                      ; 5AA4   00A0
        INCR    R4                              ; 5AA5   000C
        SUBR    R0,     R0                      ; 5AA6   0100
        ADDR    R5,     R7                      ; 5AA7   00EF

        DECLE   $00A0,  $0024,  $0101,  $001C   ; 5AA8   00A0 0024 0101 001C
        DECLE   $00A0,  $0024,  $00F0,  $00FB   ; 5AAC   00A0 0024 00F0 00FB
        DECLE   $00FF,  $00FE,  $00FF,  $0000   ; 5AB0   00FF 00FE 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5ABC   0000 0000 0000 0007
        DECLE   $0000,  $0003,  $0000,  $0000   ; 5AC0   0000 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FB   ; 5AC4   0000 0000 0000 00FB
        DECLE   $00FF,  $00FE,  $00FF,  $0006   ; 5AC8   00FF 00FE 00FF 0006
        DECLE   $0000,  $0000,  $0000           ; 5ACC   0000 0000 0000
L_5ACF:
        DECR    R0                              ; 5ACF   0010
        MVO     R0,     G_01AF                  ; 5AD0   0240 01AF
        BNEQ    L_5756                          ; 5AD2   022C 037D

        MVI     G_01E3, R0                      ; 5AD4   0280 01E3
        SLR     R0,     1                       ; 5AD6   0060
        MVO     R0,     G_01E3                  ; 5AD7   0240 01E3
        B       L_5756                          ; 5AD9   0220 0384

L_5ADB:
        MVI     G_0190, R1                      ; 5ADB   0281 0190
        INCR    R1                              ; 5ADD   0009
        MVO     R1,     G_0190                  ; 5ADE   0241 0190
        CMP     G_01E1, R1                      ; 5AE0   0341 01E1
        BLT     L_5967                          ; 5AE2   0225 017C

        CLRR    R1                              ; 5AE4   01C9
        MVO     R1,     G_0190                  ; 5AE5   0241 0190
        DECR    R0                              ; 5AE7   0010
        MVO     R0,     G_0193                  ; 5AE8   0240 0193
        BEQ     L_5B00                          ; 5AEA   0204 0014

        MVI     G_0323, R0                      ; 5AEC   0280 0323

        JSR     R5,     L_6560                  ; 5AEE   0004 0164 0160

        MVO     R0,     G_0323                  ; 5AF1   0240 0323
        MVI     G_01AC, R4                      ; 5AF3   0284 01AC

        JSR     R5,     L_5D60                  ; 5AF5   0004 015C 0160
        JSR     R5,     L_6560                  ; 5AF8   0004 0164 0160
        JSR     R5,     L_5D65                  ; 5AFB   0004 015C 0165

        B       L_5967                          ; 5AFE   0220 0198

L_5B00:
        MVI     G_01AC, R4                      ; 5B00   0284 01AC
        CLRR    R0                              ; 5B02   01C0

        JSR     R5,     L_5D09                  ; 5B03   0004 015C 0109
        JSR     R5,     L_5D6F                  ; 5B06   0004 015C 016F

        B       L_5982                          ; 5B09   0220 0188

L_5B0B:
        MVI     G_0195, R0                      ; 5B0B   0280 0195
        CMPI    #$002C, R0                      ; 5B0D   0378 002C
        BGT     L_5B22                          ; 5B0F   020E 0011

        CMPI    #$0014, R0                      ; 5B11   0378 0014
        BLT     L_5B27                          ; 5B13   0205 0012

        SDBD                                    ; 5B15   0001
        MVII    #$6B17, R0                      ; 5B16   02B8 0017 006B

        JSR     R5,     L_6556                  ; 5B19   0004 0164 0156

        SDBD                                    ; 5B1C   0001
        MVII    #$6C9F, R0                      ; 5B1D   02B8 009F 006C
        B       L_5B2B                          ; 5B20   0200 0009

L_5B22:
        MVII    #$03FF, R0                      ; 5B22   02B8 03FF
        INCR    R0                              ; 5B24   0008
        MVO     R0,     G_032C                  ; 5B25   0240 032C
L_5B27:
        SDBD                                    ; 5B27   0001
        MVII    #$6CC1, R0                      ; 5B28   02B8 00C1 006C

L_5B2B:
        JSR     R5,     L_6556                  ; 5B2B   0004 0164 0156

        MVII    #$0010, R0                      ; 5B2E   02B8 0010
        MVO     R0,     G_0196                  ; 5B30   0240 0196
        MVO     R0,     G_01AD                  ; 5B32   0240 01AD
        MVO     R0,     G_0197                  ; 5B34   0240 0197
        CLRR    R0                              ; 5B36   01C0
        MVO     R0,     G_0198                  ; 5B37   0240 0198
        MVO     R0,     G_019A                  ; 5B39   0240 019A
        J       L_5902                          ; 5B3B   0004 0358 0102

L_5B3E:
        MVII    #$0001, R1                      ; 5B3E   02B9 0001
        MVI     G_0195, R0                      ; 5B40   0280 0195
        CMPI    #$0020, R0                      ; 5B42   0378 0020
        BLT     L_5B47                          ; 5B44   0205 0001

        INCR    R1                              ; 5B46   0009
L_5B47:
        SDBD                                    ; 5B47   0001
        MVII    #$5B4E, R5                      ; 5B48   02BD 004E 005B
        PSHR    R5                              ; 5B4B   0275
        B       L_5863                          ; 5B4C   0220 02EA

        SDBD                                    ; 5B4E   0001
        MVII    #$5BE0, R4                      ; 5B4F   02BC 00E0 005B
        MVII    #$00E0, R2                      ; 5B52   02BA 00E0

        JSR     R5,     L_658E                  ; 5B54   0004 0164 018E

        CLRR    R4                              ; 5B57   01E4
        CLRR    R0                              ; 5B58   01C0
        MVO     R0,     G_0189                  ; 5B59   0240 0189
        MVO     R0,     G_018A                  ; 5B5B   0240 018A
        MVO     R0,     G_018B                  ; 5B5D   0240 018B
        MVII    #$0003, R1                      ; 5B5F   02B9 0003

L_5B61:
        JSR     R5,     L_5D09                  ; 5B61   0004 015C 0109
        JSR     R5,     L_5D6F                  ; 5B64   0004 015C 016F

        INCR    R4                              ; 5B67   000C
        DECR    R1                              ; 5B68   0011
        BNEQ    L_5B61                          ; 5B69   022C 0009

        MVI     G_0195, R0                      ; 5B6B   0280 0195
        CMPI    #$002C, R0                      ; 5B6D   0378 002C
        BEQ     L_5B8A                          ; 5B6F   0204 0019

        JSR     R5,     L_6A7B                  ; 5B71   0004 0168 027B

        MVI     G_01D1, R0                      ; 5B74   0280 01D1
        CMPI    #$00BF, R0                      ; 5B76   0378 00BF
        BEQ     L_5B82                          ; 5B78   0204 0008

        CMPI    #$00DF, R0                      ; 5B7A   0378 00DF
        BEQ     L_5B86                          ; 5B7C   0204 0008

        MVII    #$0005, R0                      ; 5B7E   02B8 0005
        B       L_5BA0                          ; 5B80   0200 001E

L_5B82:
        MVII    #$0002, R0                      ; 5B82   02B8 0002
        B       L_5BA0                          ; 5B84   0200 001A

L_5B86:
        MVII    #$0003, R0                      ; 5B86   02B8 0003
        B       L_5BA0                          ; 5B88   0200 0016

L_5B8A:
        JSR     R5,     L_6A82                  ; 5B8A   0004 0168 0282

        MVI     G_01D1, R0                      ; 5B8D   0280 01D1
        CMPI    #$009F, R0                      ; 5B8F   0378 009F
        BEQ     L_5B9B                          ; 5B91   0204 0008

        CMPI    #$00BF, R0                      ; 5B93   0378 00BF
        BEQ     L_5B9E                          ; 5B95   0204 0007

        MVII    #$0004, R0                      ; 5B97   02B8 0004
        B       L_5BA0                          ; 5B99   0200 0005

L_5B9B:
        CLRR    R0                              ; 5B9B   01C0
        B       L_5BA0                          ; 5B9C   0200 0002

L_5B9E:
        MVII    #$0001, R0                      ; 5B9E   02B8 0001
L_5BA0:
        INCR    R0                              ; 5BA0   0008
        ADD     G_01D2, R0                      ; 5BA1   02C0 01D2
L_5BA3:
        MVO     R0,     G_01D2                  ; 5BA3   0240 01D2
        CLRR    R1                              ; 5BA5   01C9
        MVO     R1,     G_01D1                  ; 5BA6   0241 01D1
        ANDI    #$0001, R0                      ; 5BA8   03B8 0001
        BEQ     L_5BC9                          ; 5BAA   0204 001D

L_5BAC:
        JSR     R5,     L_654B                  ; 5BAC   0004 0164 014B

        MVI     G_01D6, R1                      ; 5BAF   0281 01D6
        CMPI    #$0003, R1                      ; 5BB1   0379 0003
        BNEQ    L_5BBB                          ; 5BB3   020C 0006

        ANDI    #$0001, R0                      ; 5BB5   03B8 0001
        BNEQ    L_5BC5                          ; 5BB7   020C 000C
        B       L_5BC9                          ; 5BB9   0200 000E

L_5BBB:
        ANDI    #$0007, R0                      ; 5BBB   03B8 0007
        CMPI    #$0005, R0                      ; 5BBD   0378 0005
        BGT     L_5BAC                          ; 5BBF   022E 0014

        CMPI    #$0003, R0                      ; 5BC1   0378 0003
        BNEQ    L_5BC9                          ; 5BC3   020C 0004

L_5BC5:
        MVII    #$0001, R0                      ; 5BC5   02B8 0001
        B       L_5BCA                          ; 5BC7   0200 0001

L_5BC9:
        CLRR    R0                              ; 5BC9   01C0
L_5BCA:
        MVO     R0,     G_01D3                  ; 5BCA   0240 01D3
        MVII    #$0032, R0                      ; 5BCC   02B8 0032

        JSR     R5,     L_56F5                  ; 5BCE   0004 0154 02F5

        MVII    #$0020, R0                      ; 5BD1   02B8 0020
        MVO     R0,     G_0195                  ; 5BD3   0240 0195

        JSR     R5,     L_6719                  ; 5BD5   0004 0164 0319
        JSR     R5,     L_5C22                  ; 5BD8   0004 015C 0022

        MVII    #$0003, R1                      ; 5BDB   02B9 0003
        J       L_5863                          ; 5BDD   0004 0358 0063

        SUBI    #$038D, R0                      ; 5BE0   0338 038D
        SWAP    R0,     1                       ; 5BE2   0040
        DIS                                     ; 5BE3   0003
        SUB     G_0052, R1                      ; 5BE4   0301 0052
        CLRC                                    ; 5BE6   0006
        SUB     .STIC.C.4,R1                    ; 5BE7   0301 001C
        CLRC                                    ; 5BE9   0006
        SUB     G_00D5, R0                      ; 5BEA   0300 00D5
        CLRC                                    ; 5BEC   0006
        SWAP    R3,     1                       ; 5BED   0043
        SUBI    #$0380, R1                      ; 5BEE   0339 0380
        ADDR    R6,     R4                      ; 5BF0   00F4
L_5BF1:
        PSHR    R5                              ; 5BF1   0275
        MVII    #$0002, R1                      ; 5BF2   02B9 0002
        CLRR    R4                              ; 5BF4   01E4

L_5BF5:
        JSR     R5,     L_5D10                  ; 5BF5   0004 015C 0110

        CMPI    #$0010, R0                      ; 5BF8   0378 0010
        BLT     L_5C02                          ; 5BFA   0205 0006

        CMPI    #$0028, R0                      ; 5BFC   0378 0028
        BLT     L_5C01                          ; 5BFE   0205 0001

        ADDR    R1,     R0                      ; 5C00   00C8
L_5C01:
        ADDR    R1,     R0                      ; 5C01   00C8
L_5C02:
        ADDR    R1,     R0                      ; 5C02   00C8

        JSR     R5,     L_5D15                  ; 5C03   0004 015C 0115

        CMPI    #$0000, R0                      ; 5C06   0378 0000
        BGT     L_5C0F                          ; 5C08   020E 0005

        MVII    #$0001, R0                      ; 5C0A   02B8 0001

        JSR     R5,     L_5D15                  ; 5C0C   0004 015C 0115

L_5C0F:
        INCR    R4                              ; 5C0F   000C
        CMPI    #$0003, R4                      ; 5C10   037C 0003
        BLT     L_5BF5                          ; 5C12   0225 001E

        JSR     R5,     L_6863                  ; 5C14   0004 0168 0063
        JSR     R5,     L_5C22                  ; 5C17   0004 015C 0022

        PULR    R7                              ; 5C1A   02B7

L_5C1B:
        PSHR    R5                              ; 5C1B   0275
        CLRR    R4                              ; 5C1C   01E4
        MVII    #$0002, R1                      ; 5C1D   02B9 0002
        NEGR    R1                              ; 5C1F   0021
        B       L_5BF5                          ; 5C20   0220 002C

L_5C22:
        PSHR    R3                              ; 5C22   0273
        MVII    #$0007, R3                      ; 5C23   02BB 0007
        MVI     G_01D3, R0                      ; 5C25   0280 01D3
        TSTR    R0                              ; 5C27   0080
        BEQ     L_5C2C                          ; 5C28   0204 0002

        MVII    #$0002, R3                      ; 5C2A   02BB 0002
L_5C2C:
        MVII    #$0209, R1                      ; 5C2C   02B9 0209
        MVI     G_01D1, R2                      ; 5C2E   0282 01D1
        ANDI    #$00E0, R2                      ; 5C30   03BA 00E0
        CMPI    #$0080, R2                      ; 5C32   037A 0080
        BLT     L_5C3F                          ; 5C34   0205 0009

        MVII    #$02F8, R0                      ; 5C36   02B8 02F8
        XORR    R3,     R0                      ; 5C38   01D8
        MVO@    R0,     R1                      ; 5C39   0248
        INCR    R1                              ; 5C3A   0009
        ANDI    #$0060, R2                      ; 5C3B   03BA 0060
        B       L_5C42                          ; 5C3D   0200 0003

L_5C3F:
        CLRR    R0                              ; 5C3F   01C0
        MVO     R0,     .BTAB.0A                ; 5C40   0240 020A
L_5C42:
        SLR     R2,     2                       ; 5C42   0066
        SLR     R2,     2                       ; 5C43   0066
        SLR     R2,     1                       ; 5C44   0062
        ANDI    #$0003, R2                      ; 5C45   03BA 0003
        SDBD                                    ; 5C47   0001
        ADDI    #$5C52, R2                      ; 5C48   02FA 0052 005C
        MVI@    R2,     R0                      ; 5C4B   0290
        SLL     R0,     2                       ; 5C4C   004C
        SLL     R0,     1                       ; 5C4D   0048
        XORR    R3,     R0                      ; 5C4E   01D8
        MVO@    R0,     R1                      ; 5C4F   0248
        PULR    R3                              ; 5C50   02B3
        MOVR    R5,     R7                      ; 5C51   00AF

        MOVR    R7,     R4                      ; 5C52   00BC
        MOVR    R4,     R5                      ; 5C53   00A5
        SUBR    R0,     R3                      ; 5C54   0103
        SLLC    R3,     2                       ; 5C55   005F
L_5C56:
        PSHR    R5                              ; 5C56   0275
        MVI     G_01A0, R0                      ; 5C57   0280 01A0
        CMPI    #$00FF, R0                      ; 5C59   0378 00FF
        BEQ     L_5CDE                          ; 5C5B   0204 0081

        TSTR    R0                              ; 5C5D   0080
        BNEQ    L_5CA6                          ; 5C5E   020C 0046

        MVI     G_01A2, R0                      ; 5C60   0280 01A2
        TSTR    R0                              ; 5C62   0080
        BNEQ    L_5C71                          ; 5C63   020C 000C

        MVI     G_032F, R0                      ; 5C65   0280 032F
        DECR    R0                              ; 5C67   0010
        MVO     R0,     G_032F                  ; 5C68   0240 032F
        TSTR    R0                              ; 5C6A   0080
        BNEQ    L_5CE6                          ; 5C6B   020C 0079

        MVII    #$0006, R0                      ; 5C6D   02B8 0006
        MVO     R0,     G_01A2                  ; 5C6F   0240 01A2
L_5C71:
        MVI     G_019B, R0                      ; 5C71   0280 019B
        TSTR    R0                              ; 5C73   0080
        BNEQ    L_5CE6                          ; 5C74   020C 0070

        MVI     G_0193, R0                      ; 5C76   0280 0193
        TSTR    R0                              ; 5C78   0080
        BNEQ    L_5CE6                          ; 5C79   020C 006B

        MVI     G_0196, R0                      ; 5C7B   0280 0196
        CMPI    #$0007, R0                      ; 5C7D   0378 0007
        BLT     L_5CE6                          ; 5C7F   0205 0065

        MVI     G_01E6, R0                      ; 5C81   0280 01E6
        TSTR    R0                              ; 5C83   0080
        BEQ     L_5CE6                          ; 5C84   0204 0060

        MVI     G_0199, R1                      ; 5C86   0281 0199
        DECR    R1                              ; 5C88   0011
        MVO     R1,     G_01A0                  ; 5C89   0241 01A0
        MVI     G_0195, R0                      ; 5C8B   0280 0195
        MVO     R0,     G_01A1                  ; 5C8D   0240 01A1
        MVI     G_01A2, R0                      ; 5C8F   0280 01A2
        DECR    R0                              ; 5C91   0010
        MVO     R0,     G_01A2                  ; 5C92   0240 01A2
        TSTR    R0                              ; 5C94   0080
        BNEQ    L_5C9B                          ; 5C95   020C 0004

        MVII    #$017F, R0                      ; 5C97   02B8 017F
        MVO     R0,     G_032F                  ; 5C99   0240 032F
L_5C9B:
        SDBD                                    ; 5C9B   0001
        MVII    #$5CE7, R4                      ; 5C9C   02BC 00E7 005C
        MVII    #$0080, R2                      ; 5C9F   02BA 0080
        MVII    #$0009, R1                      ; 5CA1   02B9 0009

        JSR     R5,     L_658E                  ; 5CA3   0004 0164 018E

L_5CA6:
        MVI     G_01A0, R0                      ; 5CA6   0280 01A0
        TSTR    R0                              ; 5CA8   0080
        BEQ     L_5CE6                          ; 5CA9   0204 003B

        CMP     G_0199, R0                      ; 5CAB   0340 0199
        BGT     L_5CB6                          ; 5CAD   020E 0007

        CMPI    #$000C, R0                      ; 5CAF   0378 000C
        BLE     L_5CCD                          ; 5CB1   0206 001A

        DECR    R0                              ; 5CB3   0010
        B       L_5CBB                          ; 5CB4   0200 0005

L_5CB6:
        CMPI    #$0054, R0                      ; 5CB6   0378 0054
        BGE     L_5CCD                          ; 5CB8   020D 0013

        INCR    R0                              ; 5CBA   0008
L_5CBB:
        MVO     R0,     G_01A0                  ; 5CBB   0240 01A0
        MOVR    R0,     R3                      ; 5CBD   0083
        MVI     G_01A1, R2                      ; 5CBE   0282 01A1

        JSR     R5,     L_6A21                  ; 5CC0   0004 0168 0221

        ADDI    #$0300, R0                      ; 5CC3   02F8 0300
        MVO     R0,     G_0317                  ; 5CC5   0240 0317
        ADDI    #$0080, R1                      ; 5CC7   02F9 0080
        MVO     R1,     G_031F                  ; 5CC9   0241 031F
        B       L_5CE6                          ; 5CCB   0200 0019

L_5CCD:
        MVI     G_01E6, R0                      ; 5CCD   0280 01E6
        TSTR    R0                              ; 5CCF   0080
        BEQ     L_5CD6                          ; 5CD0   0204 0004

        MVII    #$00FF, R0                      ; 5CD2   02B8 00FF
        B       L_5CD7                          ; 5CD4   0200 0001

L_5CD6:
        CLRR    R0                              ; 5CD6   01C0
L_5CD7:
        MVO     R0,     G_01A0                  ; 5CD7   0240 01A0
        CLRR    R0                              ; 5CD9   01C0
        MVO     R0,     G_0317                  ; 5CDA   0240 0317
        B       L_5CE6                          ; 5CDC   0200 0008

L_5CDE:
        MVI     G_01E6, R0                      ; 5CDE   0280 01E6
        TSTR    R0                              ; 5CE0   0080
        BNEQ    L_5CE6                          ; 5CE1   020C 0003

        CLRR    R0                              ; 5CE3   01C0
        MVO     R0,     G_01A0                  ; 5CE4   0240 01A0
L_5CE6:
        PULR    R7                              ; 5CE6   02B7

        DECLE   $0050,  $0020,  $0000,  $0080   ; 5CE7   0050 0020 0000 0080
        DECLE   $0131,  $01BF,  $00A0,  $002D   ; 5CEB   0131 01BF 00A0 002D
        DECLE   $00F0,  $0150,  $0002,  $0000   ; 5CEF   00F0 0150 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0010   ; 5CF7   0000 0000 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5CFF   0000 0000 0000
L_5D02:
        PSHR    R1                              ; 5D02   0271
        MVII    #$01B0, R1                      ; 5D03   02B9 01B0
L_5D05:
        ADDR    R4,     R1                      ; 5D05   00E1
        MVI@    R1,     R0                      ; 5D06   0288
        PULR    R1                              ; 5D07   02B1
        MOVR    R5,     R7                      ; 5D08   00AF

L_5D09:
        PSHR    R1                              ; 5D09   0271
        MVII    #$01B0, R1                      ; 5D0A   02B9 01B0
L_5D0C:
        ADDR    R4,     R1                      ; 5D0C   00E1
        MVO@    R0,     R1                      ; 5D0D   0248
        PULR    R1                              ; 5D0E   02B1
        MOVR    R5,     R7                      ; 5D0F   00AF

L_5D10:
        PSHR    R1                              ; 5D10   0271
        MVII    #$01B3, R1                      ; 5D11   02B9 01B3
        B       L_5D05                          ; 5D13   0220 000F

L_5D15:
        PSHR    R1                              ; 5D15   0271
        MVII    #$01B3, R1                      ; 5D16   02B9 01B3
        B       L_5D0C                          ; 5D18   0220 000D

L_5D1A:
        PSHR    R1                              ; 5D1A   0271
        MVII    #$01B6, R1                      ; 5D1B   02B9 01B6
        B       L_5D05                          ; 5D1D   0220 0019

L_5D1F:
        PSHR    R1                              ; 5D1F   0271
        MVII    #$01B6, R1                      ; 5D20   02B9 01B6
        B       L_5D0C                          ; 5D22   0220 0017

L_5D24:
        PSHR    R1                              ; 5D24   0271
        MVII    #$01B9, R1                      ; 5D25   02B9 01B9
        B       L_5D05                          ; 5D27   0220 0023

L_5D29:
        PSHR    R1                              ; 5D29   0271
        MVII    #$01B9, R1                      ; 5D2A   02B9 01B9
        B       L_5D0C                          ; 5D2C   0220 0021

L_5D2E:
        PSHR    R1                              ; 5D2E   0271
        MVII    #$01BC, R1                      ; 5D2F   02B9 01BC
        B       L_5D05                          ; 5D31   0220 002D

L_5D33:
        PSHR    R1                              ; 5D33   0271
        MVII    #$01BC, R1                      ; 5D34   02B9 01BC
        B       L_5D0C                          ; 5D36   0220 002B

L_5D38:
        PSHR    R1                              ; 5D38   0271
        MVII    #$01BF, R1                      ; 5D39   02B9 01BF
        B       L_5D05                          ; 5D3B   0220 0037

L_5D3D:
        PSHR    R1                              ; 5D3D   0271
        MVII    #$01BF, R1                      ; 5D3E   02B9 01BF
        B       L_5D0C                          ; 5D40   0220 0035

L_5D42:
        PSHR    R1                              ; 5D42   0271
        MVII    #$01C2, R1                      ; 5D43   02B9 01C2
        B       L_5D05                          ; 5D45   0220 0041

L_5D47:
        PSHR    R1                              ; 5D47   0271
        MVII    #$01C2, R1                      ; 5D48   02B9 01C2
        B       L_5D0C                          ; 5D4A   0220 003F

L_5D4C:
        PSHR    R1                              ; 5D4C   0271
        MVII    #$0330, R1                      ; 5D4D   02B9 0330
        B       L_5D05                          ; 5D4F   0220 004B

L_5D51:
        PSHR    R1                              ; 5D51   0271
        MVII    #$0330, R1                      ; 5D52   02B9 0330
        B       L_5D0C                          ; 5D54   0220 0049

L_5D56:
        PSHR    R1                              ; 5D56   0271
        MVII    #$0333, R1                      ; 5D57   02B9 0333
        B       L_5D05                          ; 5D59   0220 0055

L_5D5B:
        PSHR    R1                              ; 5D5B   0271
        MVII    #$0333, R1                      ; 5D5C   02B9 0333
        B       L_5D0C                          ; 5D5E   0220 0053

L_5D60:
        PSHR    R1                              ; 5D60   0271
        MVII    #$0336, R1                      ; 5D61   02B9 0336
        B       L_5D05                          ; 5D63   0220 005F

L_5D65:
        PSHR    R1                              ; 5D65   0271
        MVII    #$0336, R1                      ; 5D66   02B9 0336
        B       L_5D0C                          ; 5D68   0220 005D

        PSHR    R1                              ; 5D6A   0271
        MVII    #$0314, R1                      ; 5D6B   02B9 0314
        B       L_5D05                          ; 5D6D   0220 0069

L_5D6F:
        PSHR    R1                              ; 5D6F   0271
        MVII    #$0314, R1                      ; 5D70   02B9 0314
        B       L_5D0C                          ; 5D72   0220 0067

        PSHR    R1                              ; 5D74   0271
        MVII    #$031C, R1                      ; 5D75   02B9 031C
        B       L_5D05                          ; 5D77   0220 0073

        PSHR    R1                              ; 5D79   0271
        MVII    #$031C, R1                      ; 5D7A   02B9 031C
        B       L_5D0C                          ; 5D7C   0220 0071

L_5D7E:
        PSHR    R1                              ; 5D7E   0271
        MVII    #$0324, R1                      ; 5D7F   02B9 0324
        B       L_5D05                          ; 5D81   0220 007D

L_5D83:
        PSHR    R1                              ; 5D83   0271
        MVII    #$0324, R1                      ; 5D84   02B9 0324
        B       L_5D0C                          ; 5D86   0220 007B

L_5D88:
        PSHR    R1                              ; 5D88   0271
        MVII    #$0184, R1                      ; 5D89   02B9 0184
        B       L_5D05                          ; 5D8B   0220 0087

L_5D8D:
        PSHR    R3                              ; 5D8D   0273
        MVII    #$0314, R3                      ; 5D8E   02BB 0314
        ADDR    R4,     R3                      ; 5D90   00E3
        MVO@    R0,     R3                      ; 5D91   0258
        ADDI    #$0008, R3                      ; 5D92   02FB 0008
        MVO@    R1,     R3                      ; 5D94   0259
        ADDI    #$0008, R3                      ; 5D95   02FB 0008
        MVO@    R2,     R3                      ; 5D97   025A
        PULR    R3                              ; 5D98   02B3
        MOVR    R5,     R7                      ; 5D99   00AF

L_5D9A:
        MOVR    R4,     R0                      ; 5D9A   00A0
        ADDR    R0,     R0                      ; 5D9B   00C0
        ADDR    R4,     R0                      ; 5D9C   00E0
        NEGR    R0                              ; 5D9D   0020
        ADDI    #$0091, R0                      ; 5D9E   02F8 0091
        MOVR    R5,     R7                      ; 5DA0   00AF

L_5DA1:
        PSHR    R5                              ; 5DA1   0275
        ADDR    R0,     R0                      ; 5DA2   00C0
        MOVR    R1,     R5                      ; 5DA3   008D
        ADDR    R0,     R5                      ; 5DA4   00C5
        SDBD                                    ; 5DA5   0001
        MVI@    R5,     R2                      ; 5DA6   02AA
        MOVR    R4,     R3                      ; 5DA7   00A3
        ADDR    R3,     R3                      ; 5DA8   00DB
        ADDR    R4,     R3                      ; 5DA9   00E3
        ADDI    #$0339, R3                      ; 5DAA   02FB 0339
        MOVR    R3,     R0                      ; 5DAC   0098
        ADDI    #$0002, R3                      ; 5DAD   02FB 0002
        MVO@    R2,     R3                      ; 5DAF   025A

        JSR     R5,     L_6556                  ; 5DB0   0004 0164 0156

        PULR    R7                              ; 5DB3   02B7

L_5DB4:
        PSHR    R5                              ; 5DB4   0275
        MVI     G_01D4, R0                      ; 5DB5   0280 01D4
        TSTR    R0                              ; 5DB7   0080
        BNEQ    L_5DC6                          ; 5DB8   020C 000C

        CLRR    R4                              ; 5DBA   01E4

        JSR     R5,     L_5DC7                  ; 5DBB   0004 015C 01C7

        INCR    R4                              ; 5DBE   000C

        JSR     R5,     L_5DC7                  ; 5DBF   0004 015C 01C7

        INCR    R4                              ; 5DC2   000C

        JSR     R5,     L_5DC7                  ; 5DC3   0004 015C 01C7

L_5DC6:
        PULR    R7                              ; 5DC6   02B7

L_5DC7:
        PSHR    R5                              ; 5DC7   0275

        JSR     R5,     L_5D02                  ; 5DC8   0004 015C 0102

        TSTR    R0                              ; 5DCB   0080
        BNEQ    L_5DD1                          ; 5DCC   020C 0003
        J       L_60AA                          ; 5DCE   0004 0360 00AA

L_5DD1:
        CMPI    #$00FF, R0                      ; 5DD1   0378 00FF
        BNEQ    L_5DD8                          ; 5DD3   020C 0003
        J       L_608A                          ; 5DD5   0004 0360 008A

L_5DD8:
        SDBD                                    ; 5DD8   0001
        MVII    #$5DE2, R5                      ; 5DD9   02BD 00E2 005D
        DECR    R0                              ; 5DDC   0010
        ADDR    R0,     R0                      ; 5DDD   00C0
        ADDR    R0,     R5                      ; 5DDE   00C5
        SDBD                                    ; 5DDF   0001
        MVI@    R5,     R0                      ; 5DE0   02A8
        MOVR    R0,     R7                      ; 5DE1   0087

        ADDR    R6,     R6                      ; 5DE2   00F6
        SLLC    R1,     2                       ; 5DE3   005D
        ADDR    R7,     R2                      ; 5DE4   00FA
        SLLC    R1,     2                       ; 5DE5   005D
        DECR    R3                              ; 5DE6   0013
        SLLC    R2,     2                       ; 5DE7   005E
        MOVR    R1,     R5                      ; 5DE8   008D
        SLLC    R2,     2                       ; 5DE9   005E
        ADDR    R2,     R1                      ; 5DEA   00D1
        SLLC    R2,     2                       ; 5DEB   005E
        ADDR    R2,     R1                      ; 5DEC   00D1
        SLLC    R2,     2                       ; 5DED   005E
        TSTR    R1                              ; 5DEE   0089
        SLR     R0,     1                       ; 5DEF   0060
        INCR    R6                              ; 5DF0   000E
        SLLC    R3,     2                       ; 5DF1   005F
        TSTR    R1                              ; 5DF2   0089
        SLR     R0,     1                       ; 5DF3   0060
        MOVR    R1,     R0                      ; 5DF4   0088
        SLLC    R3,     2                       ; 5DF5   005F
        MVII    #$0004, R1                      ; 5DF6   02B9 0004
        B       L_5DFC                          ; 5DF8   0200 0002

        MVII    #$0002, R1                      ; 5DFA   02B9 0002

L_5DFC:
        JSR     R5,     L_6012                  ; 5DFC   0004 0160 0012

        TSTR    R0                              ; 5DFF   0080
        BEQ     L_5E05                          ; 5E00   0204 0003
        J       L_6042                          ; 5E02   0004 0360 0042

L_5E05:
        JSR     R5,     L_5D10                  ; 5E05   0004 015C 0110

        INCR    R0                              ; 5E08   0008

        JSR     R5,     L_5D15                  ; 5E09   0004 015C 0115

        SDBD                                    ; 5E0C   0001
        MVII    #$6DD9, R1                      ; 5E0D   02B9 00D9 006D
        J       L_601F                          ; 5E10   0004 0360 001F

        MVI     G_019B, R0                      ; 5E13   0280 019B
        TSTR    R0                              ; 5E15   0080
        BNEQ    L_5E4B                          ; 5E16   020C 0033

        MVI     G_0193, R0                      ; 5E18   0280 0193
        TSTR    R0                              ; 5E1A   0080
        BNEQ    L_5E4B                          ; 5E1B   020C 002E

        JSR     R5,     L_5D10                  ; 5E1D   0004 015C 0110

        SUB     G_0199, R0                      ; 5E20   0300 0199
        BPL     L_5E25                          ; 5E22   0203 0001

        NEGR    R0                              ; 5E24   0020
L_5E25:
        CMPI    #$0002, R0                      ; 5E25   0378 0002
        BGT     L_5E4B                          ; 5E27   020E 0022

        MVII    #$0030, R0                      ; 5E29   02B8 0030
        MVO     R0,     G_0193                  ; 5E2B   0240 0193
        MVO     R4,     G_01AC                  ; 5E2D   0244 01AC
        SDBD                                    ; 5E2F   0001
        MVII    #$6DC7, R0                      ; 5E30   02B8 00C7 006D

        JSR     R5,     L_6556                  ; 5E33   0004 0164 0156

        SDBD                                    ; 5E36   0001
        MVII    #$1992, R0                      ; 5E37   02B8 0092 0019
        MVO     R0,     G_0322                  ; 5E3A   0240 0322
        SUBI    #$0012, R0                      ; 5E3C   0338 0012
        MVO     R0,     G_0323                  ; 5E3E   0240 0323
        PSHR    R4                              ; 5E40   0274
        SDBD                                    ; 5E41   0001
        MVII    #$5E7C, R4                      ; 5E42   02BC 007C 005E
        MVII    #$00A0, R2                      ; 5E45   02BA 00A0

        JSR     R5,     L_658E                  ; 5E47   0004 0164 018E

        PULR    R4                              ; 5E4A   02B4
L_5E4B:
        MVI     G_01E1, R1                      ; 5E4B   0281 01E1
        SLL     R1,     2                       ; 5E4D   004D

        JSR     R5,     L_6012                  ; 5E4E   0004 0160 0012

        TSTR    R0                              ; 5E51   0080
        BEQ     L_5E5B                          ; 5E52   0204 0007

        ANDI    #$0003, R0                      ; 5E54   03B8 0003
        BEQ     L_5E75                          ; 5E56   0204 001D
        J       L_6089                          ; 5E58   0004 0360 0089

L_5E5B:
        JSR     R5,     L_5D42                  ; 5E5B   0004 015C 0142

        MOVR    R0,     R1                      ; 5E5E   0081

        JSR     R5,     L_5D1A                  ; 5E5F   0004 015C 011A

        TSTR    R1                              ; 5E62   0089
        BNEQ    L_5E68                          ; 5E63   020C 0003

        DECR    R0                              ; 5E65   0010
        B       L_5E69                          ; 5E66   0200 0001

L_5E68:
        INCR    R0                              ; 5E68   0008
L_5E69:
        ANDI    #$003F, R0                      ; 5E69   03B8 003F

        JSR     R5,     L_5D1F                  ; 5E6B   0004 015C 011F

        SDBD                                    ; 5E6E   0001
        MVII    #$6E3D, R1                      ; 5E6F   02B9 003D 006E
        J       L_601F                          ; 5E72   0004 0360 001F

L_5E75:
        SDBD                                    ; 5E75   0001
        MVII    #$6E3D, R1                      ; 5E76   02B9 003D 006E
        J       L_6028                          ; 5E79   0004 0360 0028

        DECLE   $0100,  $00C0,  $0202,  $0040   ; 5E7C   0100 00C0 0202 0040
        DECLE   $0138,  $018C,  $0238,  $028C   ; 5E80   0138 018C 0238 028C
        DECLE   $0040,  $00BF,  $0112,  $0222   ; 5E84   0040 00BF 0112 0222
        DECLE   $0000                           ; 5E88   0000

        SWAP    R3,     1                       ; 5E89   0043
        ANDR    R0,     R0                      ; 5E8A   0180
        MVI     .PSG1.chn_a_lo,R0               ; 5E8B   0280 00F0
        MVI     G_01E1, R1                      ; 5E8D   0281 01E1
        SLL     R1,     1                       ; 5E8F   0049

        JSR     R5,     L_6012                  ; 5E90   0004 0160 0012

        TSTR    R0                              ; 5E93   0080
        BEQ     L_5E99                          ; 5E94   0204 0003
        J       L_6089                          ; 5E96   0004 0360 0089

L_5E99:
        JSR     R5,     L_654B                  ; 5E99   0004 0164 014B

        MOVR    R0,     R1                      ; 5E9C   0081
        ANDI    #$0003, R0                      ; 5E9D   03B8 0003
        BEQ     L_5E99                          ; 5E9F   0224 0007

        SUBI    #$0002, R0                      ; 5EA1   0338 0002
        MOVR    R0,     R2                      ; 5EA3   0082
        SWAP    R1,     1                       ; 5EA4   0041
        ANDI    #$0003, R1                      ; 5EA5   03B9 0003
        DECR    R1                              ; 5EA7   0011

        JSR     R5,     L_5D10                  ; 5EA8   0004 015C 0110

        CMPI    #$000C, R0                      ; 5EAB   0378 000C
        BLT     L_5EB2                          ; 5EAD   0205 0003

        ADDR    R1,     R0                      ; 5EAF   00C8
        B       L_5EB3                          ; 5EB0   0200 0001

L_5EB2:
        INCR    R0                              ; 5EB2   0008

L_5EB3:
        JSR     R5,     L_5D15                  ; 5EB3   0004 015C 0115

        MOVR    R0,     R3                      ; 5EB6   0083

        JSR     R5,     L_5D1A                  ; 5EB7   0004 015C 011A

        CMPI    #$000C, R0                      ; 5EBA   0378 000C
        BNEQ    L_5EC1                          ; 5EBC   020C 0003

        INCR    R2                              ; 5EBE   000A
        B       L_5EC6                          ; 5EBF   0200 0005

L_5EC1:
        CMPI    #$0034, R0                      ; 5EC1   0378 0034
        BNEQ    L_5EC6                          ; 5EC3   020C 0001

        DECR    R2                              ; 5EC5   0012
L_5EC6:
        ADDR    R2,     R0                      ; 5EC6   00D0

        JSR     R5,     L_5D1F                  ; 5EC7   0004 015C 011F

        SDBD                                    ; 5ECA   0001
        MVII    #$6EA1, R1                      ; 5ECB   02B9 00A1 006E
        J       L_601F                          ; 5ECE   0004 0360 001F

        MVII    #$0003, R1                      ; 5ED1   02B9 0003

        JSR     R5,     L_6012                  ; 5ED3   0004 0160 0012

        TSTR    R0                              ; 5ED6   0080
        BEQ     L_5EDC                          ; 5ED7   0204 0003
        J       L_6089                          ; 5ED9   0004 0360 0089

L_5EDC:
        JSR     R5,     L_654B                  ; 5EDC   0004 0164 014B

        ANDI    #$0001, R0                      ; 5EDF   03B8 0001
        BNEQ    L_5EF7                          ; 5EE1   020C 0014

        JSR     R5,     L_5D10                  ; 5EE3   0004 015C 0110

        CMP     G_0199, R0                      ; 5EE6   0340 0199
        BEQ     L_5F07                          ; 5EE8   0204 001D
        BGT     L_5EF0                          ; 5EEA   020E 0004

        ADDI    #$0002, R0                      ; 5EEC   02F8 0002
        B       L_5EF2                          ; 5EEE   0200 0002

L_5EF0:
        SUBI    #$0002, R0                      ; 5EF0   0338 0002

L_5EF2:
        JSR     R5,     L_5D15                  ; 5EF2   0004 015C 0115

        B       L_5F07                          ; 5EF5   0200 0010

L_5EF7:
        JSR     R5,     L_5D1A                  ; 5EF7   0004 015C 011A

        CMP     G_0195, R0                      ; 5EFA   0340 0195
        BEQ     L_5F07                          ; 5EFC   0204 0009
        BGT     L_5F03                          ; 5EFE   020E 0003

        INCR    R0                              ; 5F00   0008
        B       L_5F04                          ; 5F01   0200 0001

L_5F03:
        DECR    R0                              ; 5F03   0010

L_5F04:
        JSR     R5,     L_5D1F                  ; 5F04   0004 015C 011F

L_5F07:
        SDBD                                    ; 5F07   0001
        MVII    #$6F05, R1                      ; 5F08   02B9 0005 006F
        J       L_601F                          ; 5F0B   0004 0360 001F

        MVI     G_01E1, R1                      ; 5F0E   0281 01E1

        JSR     R5,     L_6012                  ; 5F10   0004 0160 0012

        TSTR    R0                              ; 5F13   0080
        BNEQ    L_6089                          ; 5F14   020C 0173

        JSR     R5,     L_5D10                  ; 5F16   0004 015C 0110

        CMP     G_0199, R0                      ; 5F19   0340 0199
        BEQ     L_5F48                          ; 5F1B   0204 002B
        BPL     L_5F22                          ; 5F1D   0203 0003

        INCR    R0                              ; 5F1F   0008
        B       L_5F23                          ; 5F20   0200 0001

L_5F22:
        DECR    R0                              ; 5F22   0010

L_5F23:
        JSR     R5,     L_5D15                  ; 5F23   0004 015C 0115
        JSR     R5,     L_5D1A                  ; 5F26   0004 015C 011A

        CMP     G_0195, R0                      ; 5F29   0340 0195
        BNEQ    L_5F5B                          ; 5F2B   020C 002E

        CMPI    #$0014, R0                      ; 5F2D   0378 0014
        BEQ     L_5F42                          ; 5F2F   0204 0011

        CMPI    #$002C, R0                      ; 5F31   0378 002C
        BEQ     L_5F3F                          ; 5F33   0204 000A

        PSHR    R0                              ; 5F35   0270

        JSR     R5,     L_654B                  ; 5F36   0004 0164 014B

        MOVR    R0,     R1                      ; 5F39   0081
        PULR    R0                              ; 5F3A   02B0
        ANDI    #$0001, R1                      ; 5F3B   03B9 0001
        BNEQ    L_5F42                          ; 5F3D   020C 0003

L_5F3F:
        DECR    R0                              ; 5F3F   0010
        B       L_5F43                          ; 5F40   0200 0001

L_5F42:
        INCR    R0                              ; 5F42   0008

L_5F43:
        JSR     R5,     L_5D1F                  ; 5F43   0004 015C 011F

        B       L_5F5B                          ; 5F46   0200 0013

L_5F48:
        JSR     R5,     L_5D1A                  ; 5F48   0004 015C 011A

        CMP     G_0195, R0                      ; 5F4B   0340 0195
        BEQ     L_5F5B                          ; 5F4D   0204 000C
        BLT     L_5F57                          ; 5F4F   0205 0006

        CMPI    #$0014, R0                      ; 5F51   0378 0014
        BGT     L_5F3F                          ; 5F53   022E 0015
        B       L_5F5B                          ; 5F55   0200 0004

L_5F57:
        CMPI    #$002C, R0                      ; 5F57   0378 002C
        BLT     L_5F42                          ; 5F59   0225 0018

L_5F5B:
        JSR     R5,     L_5D10                  ; 5F5B   0004 015C 0110

        ANDI    #$000F, R0                      ; 5F5E   03B8 000F
        BNEQ    L_5F6D                          ; 5F60   020C 000B

        PSHR    R4                              ; 5F62   0274
        SDBD                                    ; 5F63   0001
        MVII    #$5F7F, R4                      ; 5F64   02BC 007F 005F
        MVII    #$0040, R2                      ; 5F67   02BA 0040

        JSR     R5,     L_658E                  ; 5F69   0004 0164 018E

        PULR    R4                              ; 5F6C   02B4
L_5F6D:
        SDBD                                    ; 5F6D   0001
        MVII    #$6F69, R1                      ; 5F6E   02B9 0069 006F

        JSR     R5,     L_5D42                  ; 5F71   0004 015C 0142

        INCR    R0                              ; 5F74   0008
        ANDI    #$0003, R0                      ; 5F75   03B8 0003

        JSR     R5,     L_5D47                  ; 5F77   0004 015C 0147

        TSTR    R0                              ; 5F7A   0080
        BNEQ    L_6028                          ; 5F7B   020C 00AB
        B       L_601F                          ; 5F7D   0200 00A0

        DECLE   $0050,  $0010,  $0000,  $008C   ; 5F7F   0050 0010 0000 008C
        DECLE   $0231,  $02BF                   ; 5F83   0231 02BF

        MOVR    R5,     R7                      ; 5F85   00AF

        NEGR    R2                              ; 5F86   0022
        ADDR    R6,     R0                      ; 5F87   00F0

        JSR     R5,     L_5D42                  ; 5F88   0004 015C 0142

        TSTR    R0                              ; 5F8B   0080
        BEQ     L_5F95                          ; 5F8C   0204 0007

        DECR    R0                              ; 5F8E   0010

        JSR     R5,     L_5D47                  ; 5F8F   0004 015C 0147

        J       L_6089                          ; 5F92   0004 0360 0089

L_5F95:
        JSR     R5,     L_5D10                  ; 5F95   0004 015C 0110

        CMPI    #$000A, R0                      ; 5F98   0378 000A
        BLT     L_5FED                          ; 5F9A   0205 0051

        CMPI    #$0014, R0                      ; 5F9C   0378 0014
        BLT     L_5FD9                          ; 5F9E   0205 0039

        JSR     R5,     L_5D24                  ; 5FA0   0004 015C 0124

        MOVR    R0,     R1                      ; 5FA3   0081
        ANDI    #$0003, R0                      ; 5FA4   03B8 0003
        INCR    R0                              ; 5FA6   0008
        CMP     G_01E1, R0                      ; 5FA7   0340 01E1
        BNEQ    L_5FCC                          ; 5FA9   020C 0021

        MOVR    R1,     R0                      ; 5FAB   0088
        ANDI    #$001C, R0                      ; 5FAC   03B8 001C
        ADDI    #$0004, R0                      ; 5FAE   02F8 0004
        CMPI    #$0020, R0                      ; 5FB0   0378 0020
        BNEQ    L_5FD0                          ; 5FB2   020C 001C

        MOVR    R1,     R0                      ; 5FB4   0088
        ANDI    #$00E0, R0                      ; 5FB5   03B8 00E0
        ADDI    #$0020, R0                      ; 5FB7   02F8 0020
        CMPI    #$00A0, R0                      ; 5FB9   0378 00A0
        BEQ     L_5FD9                          ; 5FBB   0204 001C

        JSR     R5,     L_5D29                  ; 5FBD   0004 015C 0129
        JSR     R5,     L_5D2E                  ; 5FC0   0004 015C 012E

        INCR    R0                              ; 5FC3   0008
        ANDI    #$0003, R0                      ; 5FC4   03B8 0003

        JSR     R5,     L_5D33                  ; 5FC6   0004 015C 0133

        J       L_6042                          ; 5FC9   0004 0360 0042

L_5FCC:
        ANDI    #$00FC, R1                      ; 5FCC   03B9 00FC
        B       L_5FD2                          ; 5FCE   0200 0002

L_5FD0:
        ANDI    #$00E0, R1                      ; 5FD0   03B9 00E0
L_5FD2:
        XORR    R1,     R0                      ; 5FD2   01C8

        JSR     R5,     L_5D29                  ; 5FD3   0004 015C 0129

        J       L_6042                          ; 5FD6   0004 0360 0042

L_5FD9:
        CLRR    R0                              ; 5FD9   01C0

        JSR     R5,     L_5D29                  ; 5FDA   0004 015C 0129
        JSR     R5,     L_5D15                  ; 5FDD   0004 015C 0115
        JSR     R5,     L_5D6F                  ; 5FE0   0004 015C 016F

        MVI     G_01E1, R0                      ; 5FE3   0280 01E1
        SLL     R0,     2                       ; 5FE5   004C
        SLL     R0,     1                       ; 5FE6   0048

        JSR     R5,     L_5D47                  ; 5FE7   0004 015C 0147

        J       L_6089                          ; 5FEA   0004 0360 0089

L_5FED:
        JSR     R5,     L_654B                  ; 5FED   0004 0164 014B

        MOVR    R0,     R1                      ; 5FF0   0081
        ANDI    #$001F, R0                      ; 5FF1   03B8 001F
        CMPI    #$0016, R0                      ; 5FF3   0378 0016
        BGE     L_5FED                          ; 5FF5   022D 0009

        ADDI    #$0015, R0                      ; 5FF7   02F8 0015

        JSR     R5,     L_5D1F                  ; 5FF9   0004 015C 011F

        MOVR    R1,     R0                      ; 5FFC   0088
        SWAP    R0,     1                       ; 5FFD   0040
        ANDI    #$001F, R0                      ; 5FFE   03B8 001F
        ADDI    #$0016, R0                      ; 6000   02F8 0016

        JSR     R5,     L_5D15                  ; 6002   0004 015C 0115

        CLRR    R0                              ; 6005   01C0

        JSR     R5,     L_5D33                  ; 6006   0004 015C 0133

        SDBD                                    ; 6009   0001
        MVII    #$0700, R0                      ; 600A   02B8 0000 0007

        JSR     R5,     L_5D51                  ; 600D   0004 015C 0151

        B       L_6042                          ; 6010   0200 0030

L_6012:
        PSHR    R5                              ; 6012   0275

        JSR     R5,     L_5D24                  ; 6013   0004 015C 0124

        INCR    R0                              ; 6016   0008
        CMPR    R1,     R0                      ; 6017   0148
        BLT     L_601B                          ; 6018   0205 0001

        CLRR    R0                              ; 601A   01C0

L_601B:
        JSR     R5,     L_5D29                  ; 601B   0004 015C 0129

        PULR    R7                              ; 601E   02B7

L_601F:
        JSR     R5,     L_5D2E                  ; 601F   0004 015C 012E

        INCR    R0                              ; 6022   0008
        ANDI    #$0003, R0                      ; 6023   03B8 0003

        JSR     R5,     L_5D33                  ; 6025   0004 015C 0133

L_6028:
        CLRR    R2                              ; 6028   01D2

        JSR     R5,     L_5D10                  ; 6029   0004 015C 0110

        CMPI    #$0000, R0                      ; 602C   0378 0000
        BLE     L_6082                          ; 602E   0206 0052

        CMPI    #$001E, R0                      ; 6030   0378 001E
        BLT     L_6035                          ; 6032   0205 0001

        INCR    R2                              ; 6034   000A

L_6035:
        JSR     R5,     L_5D38                  ; 6035   0004 015C 0138

        CMPR    R2,     R0                      ; 6038   0150
        BEQ     L_6042                          ; 6039   0204 0007

        MOVR    R2,     R0                      ; 603B   0090

        JSR     R5,     L_5D3D                  ; 603C   0004 015C 013D
        JSR     R5,     L_5DA1                  ; 603F   0004 015C 01A1
L_6042:
        JSR     R5,     L_5D10                  ; 6042   0004 015C 0110

        MOVR    R0,     R3                      ; 6045   0083

        JSR     R5,     L_5D1A                  ; 6046   0004 015C 011A

        MOVR    R0,     R2                      ; 6049   0082

        JSR     R5,     L_6A21                  ; 604A   0004 0168 0221

        SDBD                                    ; 604D   0001
        CMPI    #$FFF8, R0                      ; 604E   0378 00F8 00FF
        BLT     L_6082                          ; 6051   0205 002F

        CMPI    #$00A8, R0                      ; 6053   0378 00A8
        BGT     L_6082                          ; 6055   020E 002B

        CMPI    #$000C, R1                      ; 6057   0379 000C
        BLT     L_6082                          ; 6059   0205 0027

        CMPI    #$006C, R1                      ; 605B   0379 006C
        BGT     L_6082                          ; 605D   020E 0023

        MOVR    R0,     R2                      ; 605F   0082

        JSR     R5,     L_5D4C                  ; 6060   0004 015C 014C

        ADDR    R0,     R2                      ; 6063   00C2

        JSR     R5,     L_5D56                  ; 6064   0004 015C 0156

        ADDR    R0,     R1                      ; 6067   00C1

        JSR     R5,     L_5D9A                  ; 6068   0004 015C 019A

        MOVR    R0,     R3                      ; 606B   0083

        JSR     R5,     L_5D2E                  ; 606C   0004 015C 012E

        CMPI    #$0003, R0                      ; 606F   0378 0003
        BNEQ    L_6075                          ; 6071   020C 0002

        MVII    #$0001, R0                      ; 6073   02B8 0001
L_6075:
        ADDR    R0,     R3                      ; 6075   00C3
        SLL     R3,     2                       ; 6076   004F
        SLL     R3,     2                       ; 6077   004F

        JSR     R5,     L_5D60                  ; 6078   0004 015C 0160

        ADDR    R0,     R3                      ; 607B   00C3
        MOVR    R2,     R0                      ; 607C   0090
        MOVR    R3,     R2                      ; 607D   009A

        JSR     R5,     L_5D8D                  ; 607E   0004 015C 018D

        PULR    R7                              ; 6081   02B7

L_6082:
        CLRR    R0                              ; 6082   01C0

        JSR     R5,     L_5D09                  ; 6083   0004 015C 0109
        JSR     R5,     L_5D6F                  ; 6086   0004 015C 016F

L_6089:
        PULR    R7                              ; 6089   02B7

L_608A:
        JSR     R5,     L_5D24                  ; 608A   0004 015C 0124

        TSTR    R0                              ; 608D   0080
        BEQ     L_6082                          ; 608E   0224 000D

        DECR    R0                              ; 6090   0010
        BEQ     L_6082                          ; 6091   0224 0010

        JSR     R5,     L_5D29                  ; 6093   0004 015C 0129
        JSR     R5,     L_5D7E                  ; 6096   0004 015C 017E

        MOVR    R0,     R1                      ; 6099   0081
        SDBD                                    ; 609A   0001
        ANDI    #$0FF8, R0                      ; 609B   03B8 00F8 000F
        INCR    R1                              ; 609E   0009
        ANDI    #$0007, R1                      ; 609F   03B9 0007
        SDBD                                    ; 60A1   0001
        XORI    #$1000, R1                      ; 60A2   03F9 0000 0010
        XORR    R1,     R0                      ; 60A5   01C8

        JSR     R5,     L_5D83                  ; 60A6   0004 015C 0183

        PULR    R7                              ; 60A9   02B7

L_60AA:
        MVI     G_01D2, R0                      ; 60AA   0280 01D2
        ANDI    #$0001, R0                      ; 60AC   03B8 0001
        BEQ     L_60E7                          ; 60AE   0204 0037

        PSHR    R4                              ; 60B0   0274
        CLRR    R4                              ; 60B1   01E4

L_60B2:
        JSR     R5,     L_5D02                  ; 60B2   0004 015C 0102

        CMPI    #$000A, R0                      ; 60B5   0378 000A
        BEQ     L_60E6                          ; 60B7   0204 002D

        CMPI    #$0002, R4                      ; 60B9   037C 0002
        BEQ     L_60C0                          ; 60BB   0204 0003

        INCR    R4                              ; 60BD   000C
        B       L_60B2                          ; 60BE   0220 000D

L_60C0:
        PULR    R4                              ; 60C0   02B4
        MVI     G_017E, R0                      ; 60C1   0280 017E
        TSTR    R0                              ; 60C3   0080
        BNEQ    L_60E7                          ; 60C4   020C 0021

        MVII    #$000A, R0                      ; 60C6   02B8 000A

        JSR     R5,     L_5D09                  ; 60C8   0004 015C 0109

        CLRR    R0                              ; 60CB   01C0

        JSR     R5,     L_5D15                  ; 60CC   0004 015C 0115
        JSR     R5,     L_5D47                  ; 60CF   0004 015C 0147
        JSR     R5,     L_5D29                  ; 60D2   0004 015C 0129

        SDBD                                    ; 60D5   0001
        MVII    #$1006, R0                      ; 60D6   02B8 0006 0010

        JSR     R5,     L_5D65                  ; 60D9   0004 015C 0165

        CLRR    R0                              ; 60DC   01C0
        SDBD                                    ; 60DD   0001
        MVII    #$6FCD, R1                      ; 60DE   02B9 00CD 006F

        JSR     R5,     L_5DA1                  ; 60E1   0004 015C 01A1

        B       L_61E8                          ; 60E4   0200 0102

L_60E6:
        PULR    R4                              ; 60E6   02B4
L_60E7:
        CLRR    R1                              ; 60E7   01C9
        MVI     G_01D1, R0                      ; 60E8   0280 01D1
        MVII    #$0080, R2                      ; 60EA   02BA 0080
L_60EC:
        CMPR    R2,     R0                      ; 60EC   0150
        BLT     L_60F4                          ; 60ED   0205 0005

        INCR    R1                              ; 60EF   0009
        ADDI    #$0020, R2                      ; 60F0   02FA 0020
        B       L_60EC                          ; 60F2   0220 0007

L_60F4:
        MVI     G_01D2, R0                      ; 60F4   0280 01D2
        MVII    #$0001, R2                      ; 60F6   02BA 0001
L_60F8:
        CMPR    R2,     R0                      ; 60F8   0150
        BLE     L_60FF                          ; 60F9   0206 0004

        INCR    R1                              ; 60FB   0009
        SLL     R2,     1                       ; 60FC   004A
        B       L_60F8                          ; 60FD   0220 0006

L_60FF:
        MVI     G_01D1, R0                      ; 60FF   0280 01D1
        CMPI    #$00F8, R0                      ; 6101   0378 00F8
        BLT     L_6107                          ; 6103   0205 0002

        MVII    #$000B, R1                      ; 6105   02B9 000B
L_6107:
        ADDR    R1,     R1                      ; 6107   00C9
        SDBD                                    ; 6108   0001
        ADDI    #$612C, R1                      ; 6109   02F9 002C 0061
        MOVR    R1,     R5                      ; 610C   008D
        SDBD                                    ; 610D   0001
        MVI@    R5,     R2                      ; 610E   02AA

        JSR     R5,     L_654B                  ; 610F   0004 0164 014B

        ANDI    #$001F, R0                      ; 6112   03B8 001F
L_6114:
        MVI@    R2,     R1                      ; 6114   0291
        ANDI    #$001F, R1                      ; 6115   03B9 001F
        CMPR    R1,     R0                      ; 6117   0148
        BLE     L_611D                          ; 6118   0206 0003

        INCR    R2                              ; 611A   000A
        B       L_6114                          ; 611B   0220 0008

L_611D:
        MVI@    R2,     R1                      ; 611D   0291
        SLR     R1,     2                       ; 611E   0065
        SLR     R1,     2                       ; 611F   0065
        SLR     R1,     1                       ; 6120   0061
        ANDI    #$0007, R1                      ; 6121   03B9 0007
        ADDR    R1,     R1                      ; 6123   00C9
        SDBD                                    ; 6124   0001
        ADDI    #$6192, R1                      ; 6125   02F9 0092 0061
        MOVR    R1,     R5                      ; 6128   008D
        SDBD                                    ; 6129   0001
        MVI@    R5,     R0                      ; 612A   02A8
        MOVR    R0,     R7                      ; 612B   0087

        DECLE   $0044,  $0061,  $0048,  $0061   ; 612C   0044 0061 0048 0061
        DECLE   $004D,  $0061,  $0053,  $0061   ; 6130   004D 0061 0053 0061
        DECLE   $005A,  $0061,  $0061,  $0061   ; 6134   005A 0061 0061 0061
        DECLE   $0068,  $0061,  $006F,  $0061   ; 6138   0068 0061 006F 0061
        DECLE   $0076,  $0061,  $007D,  $0061   ; 613C   0076 0061 007D 0061
        DECLE   $0084,  $0061,  $008B,  $0061   ; 6140   0084 0061 008B 0061
        DECLE   $0008,  $0038,  $005D,  $00FF   ; 6144   0008 0038 005D 00FF
        DECLE   $0008,  $0035,  $005E,  $007D   ; 6148   0008 0035 005E 007D
        DECLE   $00FF,  $0004,  $002C,  $0054   ; 614C   00FF 0004 002C 0054
        DECLE   $0078,  $009D,  $00FF,  $0004   ; 6150   0078 009D 00FF 0004
        DECLE   $002A,  $0052,  $0074,  $009C   ; 6154   002A 0052 0074 009C
        DECLE   $00DD,  $00FF,  $0003,  $0028   ; 6158   00DD 00FF 0003 0028
        DECLE   $004E,  $0070,  $0096,  $00DD   ; 615C   004E 0070 0096 00DD
        DECLE   $00FF,  $0002,  $0028,  $0050   ; 6160   00FF 0002 0028 0050
        DECLE   $0072,  $0096,  $00DD,  $00FF   ; 6164   0072 0096 00DD 00FF
        DECLE   $0002,  $0028,  $004E,  $0070   ; 6168   0002 0028 004E 0070
        DECLE   $0098,  $00DD,  $00FF,  $0002   ; 616C   0098 00DD 00FF 0002
        DECLE   $0028,  $004E,  $0070,  $0096   ; 6170   0028 004E 0070 0096
        DECLE   $00DD,  $00FF,  $0002,  $0026   ; 6174   00DD 00FF 0002 0026
        DECLE   $004C,  $006E,  $0092,  $00DA   ; 6178   004C 006E 0092 00DA
        DECLE   $00FF,  $0002,  $0025,  $004A   ; 617C   00FF 0002 0025 004A
        DECLE   $006B,  $008E,  $00D9,  $00FF   ; 6180   006B 008E 00D9 00FF
        DECLE   $0001,  $0024,  $0048,  $0069   ; 6184   0001 0024 0048 0069
        DECLE   $008C,  $00D8,  $00FF,  $0000   ; 6188   008C 00D8 00FF 0000
        DECLE   $0021,  $0048,  $0069,  $008C   ; 618C   0021 0048 0069 008C
        DECLE   $00D6,  $00FF                   ; 6190   00D6 00FF

        MOVR    R6,     R4                      ; 6192   00B4
        SLR     R1,     1                       ; 6193   0061
        MOVR    R7,     R0                      ; 6194   00B8
        SLR     R1,     1                       ; 6195   0061
        MOVR    R7,     R4                      ; 6196   00BC
        SLR     R1,     1                       ; 6197   0061
        ADDR    R7,     R4                      ; 6198   00FC
        SLR     R1,     1                       ; 6199   0061
L_619A:
        DECR    R7                              ; 619A   0017

        DECLE   $0062,  $0037,  $0062,  $0037   ; 619B   0062 0037 0062 0037

        SLR     R2,     1                       ; 619F   0062
        RLC     R1,     1                       ; 61A0   0051
        SLR     R2,     1                       ; 61A1   0062
L_61A2:
        PSHR    R1                              ; 61A2   0271
        MVI     G_01D2, R1                      ; 61A3   0281 01D2
        ANDI    #$0001, R1                      ; 61A5   03B9 0001
        BEQ     L_61B2                          ; 61A7   0204 0009

        CMPI    #$0014, R0                      ; 61A9   0378 0014
        BLT     L_61B2                          ; 61AB   0205 0005

        CMPI    #$002C, R0                      ; 61AD   0378 002C
        BGT     L_61B2                          ; 61AF   020E 0001

        CLRR    R0                              ; 61B1   01C0
L_61B2:
        PULR    R1                              ; 61B2   02B1
        MOVR    R5,     R7                      ; 61B3   00AF

        MVII    #$0001, R0                      ; 61B4   02B8 0001
        B       L_61C5                          ; 61B6   0200 000D

        MVII    #$0002, R0                      ; 61B8   02B8 0002
        B       L_61C5                          ; 61BA   0200 0009

        MVII    #$0002, R0                      ; 61BC   02B8 0002

        JSR     R5,     L_5D09                  ; 61BE   0004 015C 0109

        MVI     G_0195, R0                      ; 61C1   0280 0195
        B       L_61D6                          ; 61C3   0200 0011

L_61C5:
        JSR     R5,     L_5D09                  ; 61C5   0004 015C 0109
L_61C8:
        JSR     R5,     L_654B                  ; 61C8   0004 0164 014B

        SWAP    R0,     1                       ; 61CB   0040
        ANDI    #$003F, R0                      ; 61CC   03B8 003F
        CMPI    #$000C, R0                      ; 61CE   0378 000C
        BLT     L_61C8                          ; 61D0   0225 0009

        CMPI    #$0034, R0                      ; 61D2   0378 0034
        BGT     L_61C8                          ; 61D4   022E 000D

L_61D6:
        JSR     R5,     L_61A2                  ; 61D6   0004 0160 01A2

        TSTR    R0                              ; 61D9   0080
        BEQ     L_61C8                          ; 61DA   0224 0013

        JSR     R5,     L_5D1F                  ; 61DC   0004 015C 011F

        CLRR    R0                              ; 61DF   01C0

L_61E0:
        JSR     R5,     L_5D65                  ; 61E0   0004 015C 0165

        MVII    #$0001, R0                      ; 61E3   02B8 0001

        JSR     R5,     L_5D15                  ; 61E5   0004 015C 0115

L_61E8:
        MVII    #$0300, R0                      ; 61E8   02B8 0300

        JSR     R5,     L_5D51                  ; 61EA   0004 015C 0151

        MVII    #$0084, R0                      ; 61ED   02B8 0084

        JSR     R5,     L_5D5B                  ; 61EF   0004 015C 015B

        MVII    #$001F, R0                      ; 61F2   02B8 001F

        JSR     R5,     L_5D3D                  ; 61F4   0004 015C 013D

        CLRR    R0                              ; 61F7   01C0

        JSR     R5,     L_5D29                  ; 61F8   0004 015C 0129

        PULR    R7                              ; 61FB   02B7

        JSR     R5,     L_654B                  ; 61FC   0004 0164 014B

        ANDI    #$0001, R0                      ; 61FF   03B8 0001

        JSR     R5,     L_5D47                  ; 6201   0004 015C 0147

        MVII    #$0003, R0                      ; 6204   02B8 0003

        JSR     R5,     L_5D09                  ; 6206   0004 015C 0109
        JSR     R5,     L_654B                  ; 6209   0004 0164 014B

        ANDI    #$003F, R0                      ; 620C   03B8 003F

        JSR     R5,     L_5D1F                  ; 620E   0004 015C 011F

        SDBD                                    ; 6211   0001
        MVII    #$1007, R0                      ; 6212   02B8 0007 0010
        B       L_61E0                          ; 6215   0220 0036

        MVI     G_01D1, R0                      ; 6217   0280 01D1
        CMPI    #$00FA, R0                      ; 6219   0378 00FA
        BGE     L_60AA                          ; 621B   022D 0172

        CLRR    R0                              ; 621D   01C0

        JSR     R5,     L_5D47                  ; 621E   0004 015C 0147

        MVI     G_0195, R0                      ; 6221   0280 0195

        JSR     R5,     L_61A2                  ; 6223   0004 0160 01A2

        TSTR    R0                              ; 6226   0080
        BEQ     L_60AA                          ; 6227   0224 017E

        JSR     R5,     L_5D1F                  ; 6229   0004 015C 011F

        MVII    #$0004, R0                      ; 622C   02B8 0004

        JSR     R5,     L_5D09                  ; 622E   0004 015C 0109

        SDBD                                    ; 6231   0001
        MVII    #$1005, R0                      ; 6232   02B8 0005 0010
        B       L_61E0                          ; 6235   0220 0056

        JSR     R5,     L_654B                  ; 6237   0004 0164 014B

        ANDI    #$000F, R0                      ; 623A   03B8 000F
        SUBI    #$0008, R0                      ; 623C   0338 0008
        ADD     G_0195, R0                      ; 623E   02C0 0195

        JSR     R5,     L_5D1F                  ; 6240   0004 015C 011F
        JSR     R5,     L_5D1F                  ; 6243   0004 015C 011F

        MVII    #$0005, R0                      ; 6246   02B8 0005

        JSR     R5,     L_5D09                  ; 6248   0004 015C 0109

        SDBD                                    ; 624B   0001
        MVII    #$1000, R0                      ; 624C   02B8 0000 0010
        B       L_61E0                          ; 624F   0220 0070

L_6251:
        JSR     R5,     L_654B                  ; 6251   0004 0164 014B

        ANDI    #$003F, R0                      ; 6254   03B8 003F
        CMPI    #$0014, R0                      ; 6256   0378 0014
        BLT     L_6251                          ; 6258   0225 0008

        CMPI    #$002C, R0                      ; 625A   0378 002C
        BGT     L_6251                          ; 625C   022E 000C

        JSR     R5,     L_5D1F                  ; 625E   0004 015C 011F

        MVII    #$0008, R0                      ; 6261   02B8 0008

        JSR     R5,     L_5D09                  ; 6263   0004 015C 0109

        CLRR    R0                              ; 6266   01C0

        JSR     R5,     L_5D29                  ; 6267   0004 015C 0129
        JSR     R5,     L_5D47                  ; 626A   0004 015C 0147

        SDBD                                    ; 626D   0001
        MVII    #$1004, R0                      ; 626E   02B8 0004 0010
        B       L_61E0                          ; 6271   0220 0092

        DECLE   $00E0,  $0006,  $0000,  $0000   ; 6273   00E0 0006 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6277   0000 0000 0000 0000
        DECLE   $0080,  $00FE,  $00FF,  $00FE   ; 627B   0080 00FE 00FF 00FE
        DECLE   $0080,  $0000,  $0000,  $0000   ; 627F   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; 6283   0000 0000 003C 003C
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6287   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 628B   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 628F   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 6293   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 6297   0000 0000 0008 001C
        DECLE   $003E,  $007F,  $003E,  $001C   ; 629B   003E 007F 003E 001C
        DECLE   $0008,  $0000,  $0000,  $0000   ; 629F   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007C   ; 62A7   0000 0000 0000 007C
        DECLE   $0054,  $00D4,  $00FE,  $00FF   ; 62AB   0054 00D4 00FE 00FF
        DECLE   $00FE,  $0090,  $0010,  $0010   ; 62AF   00FE 0090 0010 0010
        DECLE   $0038,  $007C,  $00B0,  $0204   ; 62B3   0038 007C 00B0 0204
        DECLE   $0120,  $0000,  $0000,  $0000   ; 62B7   0120 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62BB   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 62BF   0000 0001 0001 0001
        DECLE   $0001,  $001F,  $003F,  $007F   ; 62C3   0001 001F 003F 007F
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 62C7   00FF 0000 0000 0000
        DECLE   $00C0,  $00C0,  $0080,  $0080   ; 62CB   00C0 00C0 0080 0080
        DECLE   $0080,  $00C0,  $00C0,  $00C0   ; 62CF   0080 00C0 00C0 00C0
        DECLE   $00C0,  $00FE,  $00FF,  $00FF   ; 62D3   00C0 00FE 00FF 00FF
        DECLE   $00FE,  $00D0,  $0202,  $0140   ; 62D7   00FE 00D0 0202 0140
L_62DB:
        PSHR    R5                              ; 62DB   0275
        MVI     G_01D4, R0                      ; 62DC   0280 01D4
        TSTR    R0                              ; 62DE   0080
        BNEQ    L_633D                          ; 62DF   020C 005C

        MVI     G_01D3, R0                      ; 62E1   0280 01D3
        TSTR    R0                              ; 62E3   0080
        BEQ     L_650E                          ; 62E4   0204 0228

        MVI     G_01D1, R0                      ; 62E6   0280 01D1
        CMPI    #$00F0, R0                      ; 62E8   0378 00F0
        BLT     L_650E                          ; 62EA   0205 0222

        CLRR    R4                              ; 62EC   01E4
        CLRR    R0                              ; 62ED   01C0

L_62EE:
        JSR     R5,     L_5D09                  ; 62EE   0004 015C 0109
        JSR     R5,     L_5D6F                  ; 62F1   0004 015C 016F

        INCR    R4                              ; 62F4   000C
        CMPI    #$0003, R4                      ; 62F5   037C 0003
        BNEQ    L_62EE                          ; 62F7   022C 000A

        MVII    #$0120, R4                      ; 62F9   02BC 0120
        MVII    #$0030, R0                      ; 62FB   02B8 0030

        JSR     R5,     X_FILL_ZERO             ; 62FD   0004 0114 0338

        SDBD                                    ; 6300   0001
        MVII    #$6273, R0                      ; 6301   02B8 0073 0062

        JSR     R5,     L_6556                  ; 6304   0004 0164 0156

        SDBD                                    ; 6307   0001
        MVII    #$62B5, R0                      ; 6308   02B8 00B5 0062

        JSR     R5,     L_6556                  ; 630B   0004 0164 0156

        MVII    #$0140, R4                      ; 630E   02BC 0140
        MVII    #$0010, R0                      ; 6310   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 6312   0004 0114 0338
        JSR     R5,     L_6544                  ; 6315   0004 0164 0144

        MVII    #$0050, R0                      ; 6318   02B8 0050
        MVO     R0,     G_01DF                  ; 631A   0240 01DF
        MVII    #$003C, R0                      ; 631C   02B8 003C
        MVO     R0,     G_0170                  ; 631E   0240 0170
        MVII    #$0001, R0                      ; 6320   02B8 0001
        MVO     R0,     G_0171                  ; 6322   0240 0171
        MVO     R0,     G_01D4                  ; 6324   0240 01D4
        CLRR    R0                              ; 6326   01C0
        MVO     R0,     G_01D9                  ; 6327   0240 01D9
        MVO     R0,     G_01DA                  ; 6329   0240 01DA
        NOP                                     ; 632B   0034
        MVO     R0,     G_01D7                  ; 632C   0240 01D7
        MVO     R0,     G_01D8                  ; 632E   0240 01D8
        MVO     R0,     G_01D5                  ; 6330   0240 01D5
        SDBD                                    ; 6332   0001
        MVII    #$650F, R4                      ; 6333   02BC 000F 0065
        MVII    #$00D0, R2                      ; 6336   02BA 00D0

        JSR     R5,     L_658E                  ; 6338   0004 0164 018E

        B       L_650E                          ; 633B   0200 01D1

L_633D:
        CMPI    #$0001, R0                      ; 633D   0378 0001
        BNEQ    L_6365                          ; 633F   020C 0024

        JSR     R5,     L_6524                  ; 6341   0004 0164 0124

        MVII    #$0120, R5                      ; 6344   02BD 0120
        MVII    #$0121, R4                      ; 6346   02BC 0121
L_6348:
        MVI@    R4,     R0                      ; 6348   02A0
        MVO@    R0,     R5                      ; 6349   0268
        CMPI    #$014F, R5                      ; 634A   037D 014F
        BNEQ    L_6348                          ; 634C   022C 0005

        MVI     G_01D8, R3                      ; 634E   0283 01D8
        SDBD                                    ; 6350   0001
        ADDI    #$62B8, R3                      ; 6351   02FB 00B8 0062
        MVII    #$0010, R1                      ; 6354   02B9 0010
        MVI@    R3,     R0                      ; 6356   0298
        MVO     R0,     G_012F                  ; 6357   0240 012F
        ADDR    R1,     R3                      ; 6359   00CB
        MVI@    R3,     R0                      ; 635A   0298
        MVO     R0,     G_013F                  ; 635B   0240 013F

        JSR     R5,     L_653E                  ; 635D   0004 0164 013E
        JSR     R5,     L_652B                  ; 6360   0004 0164 012B

        B       L_6480                          ; 6363   0200 011B

L_6365:
        CMPI    #$0002, R0                      ; 6365   0378 0002
        BNEQ    L_636B                          ; 6367   020C 0002
        B       L_6480                          ; 6369   0200 0115

L_636B:
        CMPI    #$0003, R0                      ; 636B   0378 0003
        BNEQ    L_6384                          ; 636D   020C 0015

        MVI     G_019B, R0                      ; 636F   0280 019B
        TSTR    R0                              ; 6371   0080
        BNEQ    L_6485                          ; 6372   020C 0111

        JSR     R5,     L_654B                  ; 6374   0004 0164 014B

        ANDI    #$000F, R0                      ; 6377   03B8 000F
        ADDI    #$0008, R0                      ; 6379   02F8 0008
        MVI     G_01E1, R1                      ; 637B   0281 01E1

        JSR     R5,     L_5582                  ; 637D   0004 0154 0182

        MVO     R0,     G_01DA                  ; 6380   0240 01DA
        B       L_6480                          ; 6382   0200 00FC

L_6384:
        CMPI    #$0004, R0                      ; 6384   0378 0004
        BNEQ    L_6391                          ; 6386   020C 0009

        MVI     G_01DA, R1                      ; 6388   0281 01DA
        DECR    R1                              ; 638A   0011
        BEQ     L_6480                          ; 638B   0204 00F3

        MVO     R1,     G_01DA                  ; 638D   0241 01DA
        B       L_6485                          ; 638F   0200 00F4

L_6391:
        CMPI    #$0005, R0                      ; 6391   0378 0005
        BNEQ    L_63BD                          ; 6393   020C 0028

        JSR     R5,     L_6520                  ; 6395   0004 0164 0120

        MVII    #$0140, R5                      ; 6398   02BD 0140
        MVII    #$0141, R4                      ; 639A   02BC 0141
L_639C:
        MVI@    R4,     R0                      ; 639C   02A0
        MVO@    R0,     R5                      ; 639D   0268
        CMPI    #$014F, R5                      ; 639E   037D 014F
        BNEQ    L_639C                          ; 63A0   022C 0005

        SDBD                                    ; 63A2   0001
        MVII    #$62A5, R3                      ; 63A3   02BB 00A5 0062
        ADD     G_01D8, R3                      ; 63A6   02C3 01D8
        MVI@    R3,     R0                      ; 63A8   0298
        MVO@    R0,     R5                      ; 63A9   0268

        JSR     R5,     L_6544                  ; 63AA   0004 0164 0144
        JSR     R5,     L_652B                  ; 63AD   0004 0164 012B

        MVI     G_0195, R2                      ; 63B0   0282 0195
        MVI     G_0199, R3                      ; 63B2   0283 0199

        JSR     R5,     L_6A21                  ; 63B4   0004 0168 0221

        MVO     R0,     G_01DD                  ; 63B7   0240 01DD
        MVO     R1,     G_01DE                  ; 63B9   0241 01DE
        B       L_6480                          ; 63BB   0200 00C3

L_63BD:
        CMPI    #$0006, R0                      ; 63BD   0378 0006
        BNEQ    L_6418                          ; 63BF   020C 0057

        MVI     G_01DB, R0                      ; 63C1   0280 01DB
        MVI     G_01DC, R1                      ; 63C3   0281 01DC
        MVII    #$0300, R2                      ; 63C5   02BA 0300
        MVII    #$0080, R3                      ; 63C7   02BB 0080
        SDBD                                    ; 63C9   0001
        MVII    #$08E7, R4                      ; 63CA   02BC 00E7 0008
        CMP     G_01DD, R0                      ; 63CD   0340 01DD
        BEQ     L_63DD                          ; 63CF   0204 000C
        BGT     L_63D6                          ; 63D1   020E 0003

        INCR    R0                              ; 63D3   0008
        B       L_63ED                          ; 63D4   0200 0017

L_63D6:
        DECR    R0                              ; 63D6   0010
        SDBD                                    ; 63D7   0001
        ADDI    #$0400, R3                      ; 63D8   02FB 0000 0004
        B       L_63ED                          ; 63DB   0200 0010

L_63DD:
        CMP     G_01DE, R1                      ; 63DD   0341 01DE
        BEQ     L_63FB                          ; 63DF   0204 001A
        BGT     L_63E6                          ; 63E1   020E 0003

        INCR    R1                              ; 63E3   0009
        B       L_63EB                          ; 63E4   0200 0005

L_63E6:
        DECR    R1                              ; 63E6   0011
        SDBD                                    ; 63E7   0001
        ADDI    #$0800, R3                      ; 63E8   02FB 0000 0008
L_63EB:
        ADDI    #$0010, R4                      ; 63EB   02FC 0010
L_63ED:
        MVO     R0,     G_01DB                  ; 63ED   0240 01DB
        MVO     R1,     G_01DC                  ; 63EF   0241 01DC
        ADDR    R2,     R0                      ; 63F1   00D0
        ADDR    R3,     R1                      ; 63F2   00D9
        MVO     R0,     G_0316                  ; 63F3   0240 0316
        MVO     R1,     G_031E                  ; 63F5   0241 031E
        MVO     R4,     G_0326                  ; 63F7   0244 0326
        B       L_6485                          ; 63F9   0200 008A

L_63FB:
        SDBD                                    ; 63FB   0001
        MVII    #$563F, R4                      ; 63FC   02BC 003F 0056
        MVII    #$0090, R2                      ; 63FF   02BA 0090

        JSR     R5,     L_658E                  ; 6401   0004 0164 018E

L_6404:
        SDBD                                    ; 6404   0001
        MVII    #$0900, R0                      ; 6405   02B8 0000 0009
        MVO     R0,     G_0326                  ; 6408   0240 0326
        MVI     G_0316, R0                      ; 640A   0280 0316
        ADDI    #$03FC, R0                      ; 640C   02F8 03FC
        MVO     R0,     G_0316                  ; 640E   0240 0316
        MVI     G_031E, R0                      ; 6410   0280 031E
        ADDI    #$00FC, R0                      ; 6412   02F8 00FC
        MVO     R0,     G_031E                  ; 6414   0240 031E
        B       L_6480                          ; 6416   0200 0068

L_6418:
        CMPI    #$0007, R0                      ; 6418   0378 0007
        BNEQ    L_643E                          ; 641A   020C 0022

        MVII    #$0002, R4                      ; 641C   02BC 0002

L_641E:
        JSR     R5,     L_6520                  ; 641E   0004 0164 0120

        MVI     G_0326, R0                      ; 6421   0280 0326
        INCR    R0                              ; 6423   0008
        MVO     R0,     G_0326                  ; 6424   0240 0326
        ANDI    #$0007, R0                      ; 6426   03B8 0007
        BNEQ    L_6485                          ; 6428   020C 005B

        MVO     R4,     G_01D4                  ; 642A   0244 01D4
        MVII    #$0140, R4                      ; 642C   02BC 0140
        MVII    #$0010, R0                      ; 642E   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 6430   0004 0114 0338
        JSR     R5,     L_6544                  ; 6433   0004 0164 0144

        SDBD                                    ; 6436   0001
        MVII    #$08D7, R0                      ; 6437   02B8 00D7 0008
        MVO     R0,     G_0326                  ; 643A   0240 0326
        B       L_6480                          ; 643C   0200 0042

L_643E:
        CMPI    #$0008, R0                      ; 643E   0378 0008
        BEQ     L_6404                          ; 6440   0224 003D

        CMPI    #$0009, R0                      ; 6442   0378 0009
        BNEQ    L_6449                          ; 6444   020C 0003

        MOVR    R0,     R4                      ; 6446   0084
        B       L_641E                          ; 6447   0220 002A

L_6449:
        CMPI    #$000A, R0                      ; 6449   0378 000A
        BNEQ    L_650E                          ; 644B   020C 00C1

        JSR     R5,     L_6524                  ; 644D   0004 0164 0124

        MVII    #$013E, R4                      ; 6450   02BC 013E
L_6452:
        MVI@    R4,     R0                      ; 6452   02A0
        MVO@    R0,     R4                      ; 6453   0260
        SUBI    #$0003, R4                      ; 6454   033C 0003
        CMPI    #$011F, R4                      ; 6456   037C 011F
        BNEQ    L_6452                          ; 6458   022C 0007

        CLRR    R0                              ; 645A   01C0
        MVO     R0,     G_0120                  ; 645B   0240 0120
        MVO     R0,     G_0130                  ; 645D   0240 0130

        JSR     R5,     L_653E                  ; 645F   0004 0164 013E
        JSR     R5,     L_652B                  ; 6462   0004 0164 012B

        CLRR    R0                              ; 6465   01C0
        MVO     R0,     G_01D4                  ; 6466   0240 01D4
        MVI     G_01D6, R0                      ; 6468   0280 01D6
        DECR    R0                              ; 646A   0010
        BEQ     L_6471                          ; 646B   0204 0004

        MVO     R0,     G_01D6                  ; 646D   0240 01D6
        B       L_650E                          ; 646F   0200 009D

L_6471:
        MVII    #$0003, R0                      ; 6471   02B8 0003
        MVO     R0,     G_01D6                  ; 6473   0240 01D6
        SDBD                                    ; 6475   0001
        MVII    #$2710, R2                      ; 6476   02BA 0010 0027

        JSR     R5,     L_56F5                  ; 6479   0004 0154 02F5

        CLRR    R0                              ; 647C   01C0
        J       L_5BA3                          ; 647D   0004 0358 03A3

L_6480:
        MVI     G_01D4, R0                      ; 6480   0280 01D4
        INCR    R0                              ; 6482   0008
        MVO     R0,     G_01D4                  ; 6483   0240 01D4
L_6485:
        MVI     G_01D9, R0                      ; 6485   0280 01D9
        INCR    R0                              ; 6487   0008
        MVO     R0,     G_01D9                  ; 6488   0240 01D9
        CMP     G_01E1, R0                      ; 648A   0340 01E1
        BNEQ    L_650E                          ; 648C   020C 0080

        CLRR    R0                              ; 648E   01C0
        MVO     R0,     G_01D9                  ; 648F   0240 01D9
        MVI     G_01DF, R0                      ; 6491   0280 01DF
        MVI     G_0171, R1                      ; 6493   0281 0171
        TSTR    R1                              ; 6495   0089
        BEQ     L_649F                          ; 6496   0204 0007

        DECR    R0                              ; 6498   0010
        CMPI    #$0038, R0                      ; 6499   0378 0038
        BEQ     L_64A4                          ; 649B   0204 0007
        B       L_64A9                          ; 649D   0200 000A

L_649F:
        INCR    R0                              ; 649F   0008
        CMPI    #$0058, R0                      ; 64A0   0378 0058
        BNEQ    L_64A9                          ; 64A2   020C 0005

L_64A4:
        COMR    R1                              ; 64A4   0019
        ANDI    #$0001, R1                      ; 64A5   03B9 0001
        MVO     R1,     G_0171                  ; 64A7   0241 0171
L_64A9:
        MVO     R0,     G_01DF                  ; 64A9   0240 01DF
        MVI     G_0171, R5                      ; 64AB   0285 0171
        MVI     G_01D4, R4                      ; 64AD   0284 01D4
        MVI     G_01DF, R0                      ; 64AF   0280 01DF
        SDBD                                    ; 64B1   0001
        ADDI    #$0700, R0                      ; 64B2   02F8 0000 0007
        MOVR    R0,     R1                      ; 64B5   0081
        ADDI    #$0010, R1                      ; 64B6   02F9 0010
        MVI     G_0170, R2                      ; 64B8   0282 0170
        ADDI    #$0180, R2                      ; 64BA   02FA 0180
        TSTR    R5                              ; 64BC   00AD
        BEQ     L_64C6                          ; 64BD   0204 0007

        PSHR    R1                              ; 64BF   0271
        MOVR    R0,     R1                      ; 64C0   0081
        PULR    R0                              ; 64C1   02B0
        SDBD                                    ; 64C2   0001
        ADDI    #$0400, R2                      ; 64C3   02FA 0000 0004
L_64C6:
        MVO     R0,     G_0314                  ; 64C6   0240 0314
        MVO     R1,     G_0315                  ; 64C8   0241 0315
        NOP                                     ; 64CA   0034
        MVO     R2,     G_031C                  ; 64CB   0242 031C
        MVO     R2,     G_031D                  ; 64CD   0242 031D
        SDBD                                    ; 64CF   0001
        MVII    #$18B0, R3                      ; 64D0   02BB 00B0 0018
        MVO     R3,     G_0324                  ; 64D3   0243 0324
        ADDI    #$0010, R3                      ; 64D5   02FB 0010
        MVO     R3,     G_0325                  ; 64D7   0243 0325
        CMPI    #$0002, R4                      ; 64D9   037C 0002
        BGT     L_64E7                          ; 64DB   020E 000A

        MVO     R1,     G_0316                  ; 64DD   0241 0316
        MVO     R2,     G_031E                  ; 64DF   0242 031E
        ADDI    #$0010, R3                      ; 64E1   02FB 0010
        MVO     R3,     G_0326                  ; 64E3   0243 0326
        B       L_650E                          ; 64E5   0200 0027

L_64E7:
        CMPI    #$0005, R4                      ; 64E7   037C 0005
        BGT     L_650E                          ; 64E9   020E 0023

        MVI     G_01DF, R0                      ; 64EB   0280 01DF
        MVI     G_0170, R1                      ; 64ED   0281 0170
        ADDI    #$0315, R0                      ; 64EF   02F8 0315
        ADDI    #$0084, R1                      ; 64F1   02F9 0084
        TSTR    R5                              ; 64F3   00AD
        BEQ     L_64FC                          ; 64F4   0204 0006

        SUBI    #$0012, R0                      ; 64F6   0338 0012
        SDBD                                    ; 64F8   0001
        ADDI    #$0400, R1                      ; 64F9   02F9 0000 0004
L_64FC:
        SDBD                                    ; 64FC   0001
        MVII    #$08D7, R2                      ; 64FD   02BA 00D7 0008
        MVO     R0,     G_0316                  ; 6500   0240 0316
        MVO     R1,     G_031E                  ; 6502   0241 031E
        MVO     R2,     G_0326                  ; 6504   0242 0326
        ANDI    #$007F, R0                      ; 6506   03B8 007F
        ANDI    #$007F, R1                      ; 6508   03B9 007F
        MVO     R0,     G_01DB                  ; 650A   0240 01DB
        MVO     R1,     G_01DC                  ; 650C   0241 01DC
L_650E:
        PULR    R7                              ; 650E   02B7

        DECLE   $0138,  $018E,  $0104,  $0070   ; 650F   0138 018E 0104 0070
        DECLE   $0020,  $0105,  $0048,  $0020   ; 6513   0020 0105 0048 0020
        DECLE   $0103,  $00F8,  $003F,  $0105   ; 6517   0103 00F8 003F 0105
        DECLE   $0048,  $003F                   ; 651B   0048 003F

        DECR    R4                              ; 651D   0014
        ANDR    R0,     R0                      ; 651E   0180
        ADDR    R6,     R0                      ; 651F   00F0
L_6520:
        MVI     G_01E1, R1                      ; 6520   0281 01E1
        B       L_6527                          ; 6522   0200 0003

L_6524:
        MVI     G_01E1, R1                      ; 6524   0281 01E1
        SLL     R1,     2                       ; 6526   004D
L_6527:
        MVII    #$01D7, R0                      ; 6527   02B8 01D7
        B       L_652F                          ; 6529   0200 0004

L_652B:
        MVII    #$01D8, R0                      ; 652B   02B8 01D8
        MVII    #$0010, R1                      ; 652D   02B9 0010
L_652F:
        PSHR    R3                              ; 652F   0273
        MOVR    R0,     R3                      ; 6530   0083
        MVI@    R3,     R0                      ; 6531   0298
        INCR    R0                              ; 6532   0008
        MVO@    R0,     R3                      ; 6533   0258
        CMPR    R1,     R0                      ; 6534   0148
        BLT     L_6539                          ; 6535   0205 0002

        CLRR    R0                              ; 6537   01C0
        MVO@    R0,     R3                      ; 6538   0258
L_6539:
        PULR    R3                              ; 6539   02B3
        TSTR    R0                              ; 653A   0080
        BNEQ    L_6485                          ; 653B   022C 00B7
        MOVR    R5,     R7                      ; 653D   00AF

L_653E:
        SDBD                                    ; 653E   0001
        MVII    #$62B5, R0                      ; 653F   02B8 00B5 0062
        B       L_6548                          ; 6542   0200 0004

L_6544:
        SDBD                                    ; 6544   0001
        MVII    #$62D8, R0                      ; 6545   02B8 00D8 0062
L_6548:
        J       L_6556                          ; 6548   0004 0364 0156

L_654B:
        PSHR    R5                              ; 654B   0275
        PSHR    R4                              ; 654C   0274
        MVII    #$0001, R0                      ; 654D   02B8 0001

        JSR     R5,     X_RAND1                 ; 654F   0004 0114 027D

        MVI     G_035E, R0                      ; 6552   0280 035E
        PULR    R4                              ; 6554   02B4
        PULR    R7                              ; 6555   02B7

L_6556:
        PSHR    R0                              ; 6556   0270
L_6557:
        MVI     G_035D, R0                      ; 6557   0280 035D
        TSTR    R0                              ; 6559   0080
        BNEQ    L_6557                          ; 655A   022C 0004

        PULR    R0                              ; 655C   02B0
        MVO     R0,     G_035D                  ; 655D   0240 035D
        MOVR    R5,     R7                      ; 655F   00AF

L_6560:
        MOVR    R0,     R1                      ; 6560   0081
        SDBD                                    ; 6561   0001
        ANDI    #$FFF8, R1                      ; 6562   03B9 00F8 00FF
        INCR    R0                              ; 6565   0008
        ANDI    #$0007, R0                      ; 6566   03B8 0007
        XORR    R1,     R0                      ; 6568   01C8
        MOVR    R5,     R7                      ; 6569   00AF

L_656A:
        PSHR    R5                              ; 656A   0275
        MVII    #$01F0, R4                      ; 656B   02BC 01F0
        MVII    #$000E, R0                      ; 656D   02B8 000E

        JSR     R5,     X_FILL_ZERO             ; 656F   0004 0114 0338

        CLRR    R0                              ; 6572   01C0
        MVO     R0,     G_0175                  ; 6573   0240 0175
        MVO     R0,     G_0176                  ; 6575   0240 0176
        MVO     R0,     G_0177                  ; 6577   0240 0177
        MVII    #$0178, R4                      ; 6579   02BC 0178
        MVO@    R0,     R4                      ; 657B   0260
        MVO@    R0,     R4                      ; 657C   0260
        MVO@    R0,     R4                      ; 657D   0260
        NOP                                     ; 657E   0034
        MVO     R0,     G_017B                  ; 657F   0240 017B
        MVO     R0,     G_0354                  ; 6581   0240 0354
        MVII    #$0355, R4                      ; 6583   02BC 0355
        MVO@    R0,     R4                      ; 6585   0260
        MVO@    R0,     R4                      ; 6586   0260
        MVO@    R0,     R4                      ; 6587   0260
        MVII    #$0344, R0                      ; 6588   02B8 0344
        INCR    R0                              ; 658A   0008
        MVO     R0,     G_0344                  ; 658B   0240 0344
        PULR    R7                              ; 658D   02B7

L_658E:
        PSHR    R5                              ; 658E   0275
        MVI     G_0354, R0                      ; 658F   0280 0354
        TSTR    R0                              ; 6591   0080
        BEQ     L_659C                          ; 6592   0204 0008

        MVI     G_0175, R0                      ; 6594   0280 0175
        TSTR    R0                              ; 6596   0080
        BEQ     L_659C                          ; 6597   0204 0003

        CMPR    R0,     R2                      ; 6599   0142
        BLT     L_65B6                          ; 659A   0205 001A

L_659C:
        CLRR    R0                              ; 659C   01C0
        MVO     R0,     G_0176                  ; 659D   0240 0176
        MVO     R0,     G_0176                  ; 659F   0240 0176
        NOP                                     ; 65A1   0034
        MVO     R0,     .PSG0.chn_a_vol         ; 65A2   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 65A4   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 65A6   0240 01FD
        MVII    #$003F, R0                      ; 65A8   02B8 003F
        MVO     R0,     .PSG0.chan_enable       ; 65AA   0240 01F8
        MVO     R4,     G_0354                  ; 65AC   0244 0354
        MVO     R2,     G_0175                  ; 65AE   0242 0175

L_65B0:
        JSR     R5,     L_65D1                  ; 65B0   0004 0164 01D1

        TSTR    R0                              ; 65B3   0080
        BNEQ    L_65B0                          ; 65B4   022C 0005
L_65B6:
        PULR    R7                              ; 65B6   02B7

L_65B7:
        PSHR    R5                              ; 65B7   0275
        MVI     G_0176, R0                      ; 65B8   0280 0176
        TSTR    R0                              ; 65BA   0080
        BEQ     L_65D0                          ; 65BB   0204 0013

        MVI     G_0177, R0                      ; 65BD   0280 0177
        TSTR    R0                              ; 65BF   0080
        BEQ     L_65C7                          ; 65C0   0204 0005

        DECR    R0                              ; 65C2   0010
        MVO     R0,     G_0177                  ; 65C3   0240 0177
        B       L_65D0                          ; 65C5   0200 0009

L_65C7:
        CLRR    R0                              ; 65C7   01C0
        MVO     R0,     G_0176                  ; 65C8   0240 0176

L_65CA:
        JSR     R5,     L_65D1                  ; 65CA   0004 0164 01D1

        TSTR    R0                              ; 65CD   0080
        BNEQ    L_65CA                          ; 65CE   022C 0005
L_65D0:
        PULR    R7                              ; 65D0   02B7

L_65D1:
        PSHR    R5                              ; 65D1   0275
        MVI     G_0354, R4                      ; 65D2   0284 0354
        TSTR    R4                              ; 65D4   00A4
        BEQ     L_65ED                          ; 65D5   0204 0016

        MVI@    R4,     R3                      ; 65D7   02A3
        MOVR    R3,     R0                      ; 65D8   0098
        ANDI    #$0300, R0                      ; 65D9   03B8 0300
        BNEQ    L_668F                          ; 65DB   020C 00B2

        MOVR    R3,     R0                      ; 65DD   0098
        ANDI    #$00C0, R0                      ; 65DE   03B8 00C0
        BNEQ    L_65EF                          ; 65E0   020C 000D

        MOVR    R3,     R0                      ; 65E2   0098
        ANDI    #$003F, R0                      ; 65E3   03B8 003F
        MVO     R0,     G_0177                  ; 65E5   0240 0177
        MVO     R4,     G_0354                  ; 65E7   0244 0354
        MVII    #$0001, R0                      ; 65E9   02B8 0001
        MVO     R0,     G_0176                  ; 65EB   0240 0176
L_65ED:
        CLRR    R0                              ; 65ED   01C0
        PULR    R7                              ; 65EE   02B7

L_65EF:
        MOVR    R3,     R0                      ; 65EF   0098
        ANDI    #$00F0, R0                      ; 65F0   03B8 00F0
        CMPI    #$0040, R0                      ; 65F2   0378 0040
        BEQ     L_661D                          ; 65F4   0204 0027

        CMPI    #$0050, R0                      ; 65F6   0378 0050
        BEQ     L_665B                          ; 65F8   0204 0061

        CMPI    #$0060, R0                      ; 65FA   0378 0060
        BEQ     L_6665                          ; 65FC   0204 0067

        CMPI    #$0070, R0                      ; 65FE   0378 0070
        BEQ     L_666A                          ; 6600   0204 0068

        CMPI    #$00A0, R0                      ; 6602   0378 00A0
        BEQ     L_6676                          ; 6604   0204 0070

        CMPI    #$00D0, R0                      ; 6606   0378 00D0
        BEQ     L_66E5                          ; 6608   0204 00DB

        CMPI    #$00E0, R0                      ; 660A   0378 00E0
        BEQ     L_66F3                          ; 660C   0204 00E5

        CMPI    #$00F0, R0                      ; 660E   0378 00F0
        BEQ     L_667D                          ; 6610   0204 006B

        ANDI    #$00E0, R0                      ; 6612   03B8 00E0
        CMPI    #$0080, R0                      ; 6614   0378 0080
        BEQ     L_6688                          ; 6616   0204 0070

L_6618:
        MVO     R4,     G_0354                  ; 6618   0244 0354
        MVII    #$0001, R0                      ; 661A   02B8 0001
        PULR    R7                              ; 661C   02B7

L_661D:
        MOVR    R3,     R0                      ; 661D   0098
        ANDI    #$0003, R0                      ; 661E   03B8 0003
        BEQ     L_6645                          ; 6620   0204 0023

        CMPI    #$0001, R0                      ; 6622   0378 0001
        BEQ     L_6648                          ; 6624   0204 0022

        CMPI    #$0002, R0                      ; 6626   0378 0002
        BEQ     L_664C                          ; 6628   0204 0022

        MVII    #$0178, R2                      ; 662A   02BA 0178
        ADD     G_017B, R2                      ; 662C   02C2 017B
        MVI@    R2,     R0                      ; 662E   0290
        TSTR    R0                              ; 662F   0080
        BEQ     L_663E                          ; 6630   0204 000C

        DECR    R0                              ; 6632   0010
        MVO@    R0,     R2                      ; 6633   0250
        MVII    #$0355, R2                      ; 6634   02BA 0355
        ADD     G_017B, R2                      ; 6636   02C2 017B
        MVI@    R2,     R0                      ; 6638   0290
        MVO     R0,     G_0354                  ; 6639   0240 0354
        MVII    #$0001, R0                      ; 663B   02B8 0001
        PULR    R7                              ; 663D   02B7

L_663E:
        MVI     G_017B, R2                      ; 663E   0282 017B
        DECR    R2                              ; 6640   0012
        MVO     R2,     G_017B                  ; 6641   0242 017B
        B       L_6618                          ; 6643   0220 002C

L_6645:
        CLRR    R0                              ; 6645   01C0
        B       L_664E                          ; 6646   0200 0006

L_6648:
        MVII    #$0001, R0                      ; 6648   02B8 0001
        B       L_664E                          ; 664A   0200 0002

L_664C:
        MVI     .STIC.X.2,R0                    ; 664C   0280 0002
L_664E:
        MVI@    R4,     R1                      ; 664E   02A1
        MVII    #$0355, R2                      ; 664F   02BA 0355
        ADDR    R0,     R2                      ; 6651   00C2
        MVO@    R4,     R2                      ; 6652   0254
        MVII    #$0178, R2                      ; 6653   02BA 0178
        ADDR    R0,     R2                      ; 6655   00C2
        MVO@    R1,     R2                      ; 6656   0251
        MVO     R0,     G_017B                  ; 6657   0240 017B
        B       L_6618                          ; 6659   0220 0042

L_665B:
        JSR     R5,     L_6704                  ; 665B   0004 0164 0304

        MVII    #$01F3, R2                      ; 665E   02BA 01F3

L_6660:
        JSR     R5,     L_6710                  ; 6660   0004 0164 0310

        B       L_6618                          ; 6663   0220 004C

L_6665:
        MOVR    R3,     R1                      ; 6665   0099
        ANDI    #$000F, R1                      ; 6666   03B9 000F
        B       L_666E                          ; 6668   0200 0004

L_666A:
        MOVR    R3,     R1                      ; 666A   0099
        ANDI    #$000F, R1                      ; 666B   03B9 000F
        NEGR    R1                              ; 666D   0021
L_666E:
        MVII    #$01F3, R2                      ; 666E   02BA 01F3

        JSR     R5,     L_6708                  ; 6670   0004 0164 0308

        ADDR    R1,     R0                      ; 6673   00C8
        B       L_6660                          ; 6674   0220 0015

L_6676:
        MOVR    R3,     R0                      ; 6676   0098
        ANDI    #$000F, R0                      ; 6677   03B8 000F
        MVO     R0,     .PSG0.envelope          ; 6679   0240 01FA
        B       L_6618                          ; 667B   0220 0064

L_667D:
        CLRR    R0                              ; 667D   01C0
        MVO     R0,     G_0354                  ; 667E   0240 0354
        MVO     R0,     G_0175                  ; 6680   0240 0175
        NOP                                     ; 6682   0034
        MVO     R0,     G_0176                  ; 6683   0240 0176
        MVO     R0,     G_0177                  ; 6685   0240 0177
        PULR    R7                              ; 6687   02B7

L_6688:
        MOVR    R3,     R0                      ; 6688   0098
        ANDI    #$001F, R0                      ; 6689   03B8 001F
        MVO     R0,     .PSG0.noise             ; 668B   0240 01F9
        B       L_6618                          ; 668D   0220 0076

L_668F:
        SWAP    R0,     1                       ; 668F   0040
        DECR    R0                              ; 6690   0010
        MOVR    R0,     R2                      ; 6691   0082
        MOVR    R3,     R0                      ; 6692   0098
        ANDI    #$00F0, R0                      ; 6693   03B8 00F0
        BEQ     L_66AB                          ; 6695   0204 0014

        CMPI    #$0010, R0                      ; 6697   0378 0010
        BEQ     L_66B5                          ; 6699   0204 001A

        CMPI    #$0020, R0                      ; 669B   0378 0020
        BEQ     L_66BA                          ; 669D   0204 001B

        CMPI    #$0030, R0                      ; 669F   0378 0030
        BEQ     L_66C6                          ; 66A1   0204 0023

        ANDI    #$00C0, R0                      ; 66A3   03B8 00C0
        CMPI    #$0080, R0                      ; 66A5   0378 0080
        BEQ     L_66DD                          ; 66A7   0204 0034
        B       L_6618                          ; 66A9   0220 0092

L_66AB:
        JSR     R5,     L_66FE                  ; 66AB   0004 0164 02FE

        ADDI    #$01F0, R2                      ; 66AE   02FA 01F0

L_66B0:
        JSR     R5,     L_6710                  ; 66B0   0004 0164 0310

        B       L_6618                          ; 66B3   0220 009C

L_66B5:
        MOVR    R3,     R1                      ; 66B5   0099
        ANDI    #$000F, R1                      ; 66B6   03B9 000F
        B       L_66BE                          ; 66B8   0200 0004

L_66BA:
        MOVR    R3,     R1                      ; 66BA   0099
        ANDI    #$000F, R1                      ; 66BB   03B9 000F
        NEGR    R1                              ; 66BD   0021
L_66BE:
        ADDI    #$01F0, R2                      ; 66BE   02FA 01F0

        JSR     R5,     L_6708                  ; 66C0   0004 0164 0308

        ADDR    R1,     R0                      ; 66C3   00C8
        B       L_66B0                          ; 66C4   0220 0015

L_66C6:
        MOVR    R3,     R1                      ; 66C6   0099
        ANDI    #$0009, R1                      ; 66C7   03B9 0009
        MVII    #$0009, R0                      ; 66C9   02B8 0009
L_66CB:
        TSTR    R2                              ; 66CB   0092
        BEQ     L_66D3                          ; 66CC   0204 0005

        SLL     R0,     1                       ; 66CE   0048
        SLL     R1,     1                       ; 66CF   0049
        DECR    R2                              ; 66D0   0012
        B       L_66CB                          ; 66D1   0220 0007

L_66D3:
        MOVR    R0,     R2                      ; 66D3   0082
        COMR    R2                              ; 66D4   001A
        MVI     .PSG0.chan_enable,R0            ; 66D5   0280 01F8
        ANDR    R2,     R0                      ; 66D7   0190
        XORR    R1,     R0                      ; 66D8   01C8
        MVO     R0,     .PSG0.chan_enable       ; 66D9   0240 01F8
        B       L_6618                          ; 66DB   0220 00C4

L_66DD:
        MOVR    R3,     R0                      ; 66DD   0098
        ANDI    #$003F, R0                      ; 66DE   03B8 003F
        ADDI    #$01FB, R2                      ; 66E0   02FA 01FB
        MVO@    R0,     R2                      ; 66E2   0250
        B       L_6618                          ; 66E3   0220 00CC

L_66E5:
        SDBD                                    ; 66E5   0001
        MVI@    R4,     R0                      ; 66E6   02A0
        DIS                                     ; 66E7   0003
        MOVR    R6,     R1                      ; 66E8   00B1
        MVI     G_0344, R6                      ; 66E9   0286 0344
        PSHR    R4                              ; 66EB   0274
        MVO     R6,     G_0344                  ; 66EC   0246 0344
        MOVR    R1,     R6                      ; 66EE   008E
        EIS                                     ; 66EF   0002
        MOVR    R0,     R4                      ; 66F0   0084
        B       L_6618                          ; 66F1   0220 00DA

L_66F3:
        DIS                                     ; 66F3   0003
        MOVR    R6,     R1                      ; 66F4   00B1
        MVI     G_0344, R6                      ; 66F5   0286 0344
        PULR    R4                              ; 66F7   02B4
        MVO     R6,     G_0344                  ; 66F8   0246 0344
        MOVR    R1,     R6                      ; 66FA   008E
        EIS                                     ; 66FB   0002
        B       L_6618                          ; 66FC   0220 00E5

L_66FE:
        MOVR    R3,     R0                      ; 66FE   0098
        ANDI    #$000F, R0                      ; 66FF   03B8 000F
        SWAP    R0,     1                       ; 6701   0040
        XOR@    R4,     R0                      ; 6702   03E0
        MOVR    R5,     R7                      ; 6703   00AF

L_6704:
        MVI@    R4,     R0                      ; 6704   02A0
        SWAP    R0,     1                       ; 6705   0040
        XOR@    R4,     R0                      ; 6706   03E0
        MOVR    R5,     R7                      ; 6707   00AF

L_6708:
        ADDI    #$0004, R2                      ; 6708   02FA 0004
        MVI@    R2,     R0                      ; 670A   0290
        SWAP    R0,     1                       ; 670B   0040
        SUBI    #$0004, R2                      ; 670C   033A 0004
        XOR@    R2,     R0                      ; 670E   03D0
        MOVR    R5,     R7                      ; 670F   00AF

L_6710:
        SWAP    R0,     1                       ; 6710   0040
        ADDI    #$0004, R2                      ; 6711   02FA 0004
        MVO@    R0,     R2                      ; 6713   0250
        SWAP    R0,     1                       ; 6714   0040
        SUBI    #$0004, R2                      ; 6715   033A 0004
        MVO@    R0,     R2                      ; 6717   0250
        MOVR    R5,     R7                      ; 6718   00AF

L_6719:
        PSHR    R5                              ; 6719   0275
        CLRR    R0                              ; 671A   01C0
        MVII    #$0214, R4                      ; 671B   02BC 0214
L_671D:
        MVO@    R0,     R4                      ; 671D   0260
        CMPI    #$02F0, R4                      ; 671E   037C 02F0
        BNEQ    L_671D                          ; 6720   022C 0004

        MVII    #$0002, R1                      ; 6722   02B9 0002
        MVII    #$0008, R2                      ; 6724   02BA 0008
        MVII    #$0228, R4                      ; 6726   02BC 0228
        MVII    #$023B, R3                      ; 6728   02BB 023B
        MVII    #$02F8, R0                      ; 672A   02B8 02F8
L_672C:
        PSHR    R1                              ; 672C   0271
        PSHR    R3                              ; 672D   0273
        PSHR    R4                              ; 672E   0274
        NOP                                     ; 672F   0034
L_6730:
        MVO@    R0,     R3                      ; 6730   0258
        MVO@    R0,     R4                      ; 6731   0260
        DECR    R3                              ; 6732   0013
        DECR    R1                              ; 6733   0011
        BNEQ    L_6730                          ; 6734   022C 0005

        PULR    R4                              ; 6736   02B4
        PULR    R3                              ; 6737   02B3
        PULR    R1                              ; 6738   02B1
        CMPI    #$0005, R2                      ; 6739   037A 0005
        BEQ     L_6745                          ; 673B   0204 0008
        BLT     L_6743                          ; 673D   0205 0004

        ADDI    #$0002, R1                      ; 673F   02F9 0002
        B       L_6745                          ; 6741   0200 0002

L_6743:
        SUBI    #$0002, R1                      ; 6743   0339 0002
L_6745:
        ADDI    #$0014, R3                      ; 6745   02FB 0014
        ADDI    #$0014, R4                      ; 6747   02FC 0014
        DECR    R2                              ; 6749   0012
        BNEQ    L_672C                          ; 674A   022C 001F

        MVII    #$0227, R2                      ; 674C   02BA 0227
        MVII    #$02DB, R3                      ; 674E   02BB 02DB
        MVII    #$0214, R4                      ; 6750   02BC 0214
        MVII    #$02C8, R5                      ; 6752   02BD 02C8
        MVII    #$0008, R1                      ; 6754   02B9 0008
L_6756:
        MOVR    R1,     R0                      ; 6756   0088
        ANDI    #$0001, R0                      ; 6757   03B8 0001
        BNEQ    L_675F                          ; 6759   020C 0004

        MVII    #$0020, R0                      ; 675B   02B8 0020
        B       L_6760                          ; 675D   0200 0001

L_675F:
        CLRR    R0                              ; 675F   01C0
L_6760:
        ADDI    #$0360, R0                      ; 6760   02F8 0360
        MVO@    R0,     R2                      ; 6762   0250
        ADDI    #$0008, R0                      ; 6763   02F8 0008
        MVO@    R0,     R4                      ; 6765   0260
        ADDI    #$0008, R0                      ; 6766   02F8 0008
        MVO@    R0,     R3                      ; 6768   0258
        ADDI    #$0008, R0                      ; 6769   02F8 0008
        MVO@    R0,     R5                      ; 676B   0268
        DECR    R2                              ; 676C   0012
        DECR    R3                              ; 676D   0013
        MOVR    R1,     R0                      ; 676E   0088
        ANDI    #$0001, R0                      ; 676F   03B8 0001
        BEQ     L_677B                          ; 6771   0204 0008

        ADDI    #$0014, R2                      ; 6773   02FA 0014
        ADDI    #$0014, R4                      ; 6775   02FC 0014
        SUBI    #$0014, R3                      ; 6777   033B 0014
        SUBI    #$0014, R5                      ; 6779   033D 0014
L_677B:
        DECR    R1                              ; 677B   0011
        BNEQ    L_6756                          ; 677C   022C 0027

        CLRR    R0                              ; 677E   01C0
        MVO     R0,     G_0188                  ; 677F   0240 0188
        MVO     R0,     G_018A                  ; 6781   0240 018A
        MVO     R0,     G_018C                  ; 6783   0240 018C
        MVII    #$000B, R0                      ; 6785   02B8 000B
        MVO     R0,     G_0189                  ; 6787   0240 0189
        MVI     G_01D2, R1                      ; 6789   0281 01D2
        ANDI    #$0001, R1                      ; 678B   03B9 0001
        BEQ     L_6791                          ; 678D   0204 0002

        MVII    #$0001, R0                      ; 678F   02B8 0001
L_6791:
        MVO     R0,     G_018B                  ; 6791   0240 018B
        SDBD                                    ; 6793   0001
        MVII    #$2000, R1                      ; 6794   02B9 0000 0020
        MVI     .BTAB.14,R0                     ; 6797   0280 0214
        XORR    R1,     R0                      ; 6799   01C8
        MVO     R0,     .BTAB.14                ; 679A   0240 0214
        MVI     .BTAB.64,R0                     ; 679C   0280 0264
        XORR    R1,     R0                      ; 679E   01C8
        MVO     R0,     .BTAB.64                ; 679F   0240 0264
        MVI     .BTAB.8C,R0                     ; 67A1   0280 028C
        XORR    R1,     R0                      ; 67A3   01C8
        MVO     R0,     .BTAB.8C                ; 67A4   0240 028C
        MVII    #$00FF, R0                      ; 67A6   02B8 00FF
        MVO     R0,     G_017E                  ; 67A8   0240 017E
        MVI     G_01D2, R1                      ; 67AA   0281 01D2
        MVII    #$0007, R2                      ; 67AC   02BA 0007
        ANDR    R2,     R1                      ; 67AE   0191
        SDBD                                    ; 67AF   0001
        ADDI    #$67C1, R1                      ; 67B0   02F9 00C1 0067
        MVI@    R1,     R0                      ; 67B3   0288
        MOVR    R0,     R1                      ; 67B4   0081
        SLR     R1,     2                       ; 67B5   0065
        SLR     R1,     2                       ; 67B6   0065
        ANDR    R2,     R1                      ; 67B7   0191
        ANDR    R2,     R0                      ; 67B8   0190
        MVO     R0,     G_017C                  ; 67B9   0240 017C
        MVO     R1,     G_017D                  ; 67BB   0241 017D

        JSR     R5,     L_6863                  ; 67BD   0004 0168 0063

        PULR    R7                              ; 67C0   02B7

        DECLE   $0045,  $0045,  $0014,  $0056   ; 67C1   0045 0045 0014 0056
        DECLE   $0015,  $0046,  $0012,  $0026   ; 67C5   0015 0046 0012 0026
        DECLE   $0000                           ; 67C9   0000

        DECR    R3                              ; 67CA   0013
        ADDR    R4,     R7                      ; 67CB   00E7
        ADDR    R4,     R7                      ; 67CC   00E7
        ADDR    R4,     R7                      ; 67CD   00E7
        ADDR    R4,     R7                      ; 67CE   00E7
        ADDR    R4,     R7                      ; 67CF   00E7
        ADDR    R4,     R7                      ; 67D0   00E7
        ADDR    R4,     R7                      ; 67D1   00E7
        ADDR    R4,     R7                      ; 67D2   00E7
        ADDR    R4,     R7                      ; 67D3   00E7

        DECLE   $00E4,  $00E0,  $00C0,  $0000   ; 67D4   00E4 00E0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $00E7   ; 67D8   0000 0000 0000 00E7
        DECLE   $0027,  $0007,  $0003,  $0000   ; 67DC   0027 0007 0003 0000
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 67E0   0000 0000 0000 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 67E4   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $003F   ; 67E8   00FC 00FC 00FC 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 67EC   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $00FC   ; 67F0   003F 003F 003F 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 67F4   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $00F0,  $00C0,  $003F   ; 67F8   00FC 00F0 00C0 003F
        DECLE   $003C,  $0030,  $0000,  $0000   ; 67FC   003C 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FC   ; 6800   0000 0000 0000 00FC
        DECLE   $003C,  $000C,  $0000,  $0000   ; 6804   003C 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003F   ; 6808   0000 0000 0000 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 680C   003F 003F 003F 003F
        DECLE   $003F                           ; 6810   003F

        INCR    R7                              ; 6811   000F

        DIS                                     ; 6812   0003
L_6813:
        SETC                                    ; 6813   0007
        DECLE   $0000,  $007F,  $0000,  $007F   ; 6814   0000 007F 0000 007F
        DECLE   $0000,  $0003,  $0000,  $00E0   ; 6818   0000 0003 0000 00E0
        DECLE   $0000,  $00FE,  $0000,  $00FE   ; 681C   0000 00FE 0000 00FE
        DECLE   $0000,  $00C0,  $0000,  $0000   ; 6820   0000 00C0 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0000   ; 6824   0000 0000 0003 0000
        DECLE   $003F,  $0000,  $0007,  $0000   ; 6828   003F 0000 0007 0000
        DECLE   $0000,  $0000,  $00C0,  $0000   ; 682C   0000 0000 00C0 0000
        DECLE   $00FC,  $0000,  $00E0,  $0000   ; 6830   00FC 0000 00E0 0000
        DECLE   $0000,  $0003,  $0000,  $0003   ; 6834   0000 0003 0000 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6838   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0000,  $00C0   ; 683C   0000 00C0 0000 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6840   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 6844   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6848   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 684C   0000 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6850   0000 0000 0000 00FF
        DECLE   $0081,  $00BD,  $00A1,  $00A1   ; 6854   0081 00BD 00A1 00A1
        DECLE   $00BD,  $0081,  $00FF           ; 6858   00BD 0081 00FF

        TSTR    R0                              ; 685B   0080
        ADDR    R3,     R7                      ; 685C   00DF

        DECLE   $0095,  $00D5,  $0000,  $0000   ; 685D   0095 00D5 0000 0000
        DECLE   $0000,  $0000                   ; 6861   0000 0000
L_6863:
        PSHR    R5                              ; 6863   0275
        MVI     G_017C, R4                      ; 6864   0284 017C
        MVI     G_017D, R5                      ; 6866   0285 017D
        MVI     G_01D1, R0                      ; 6868   0280 01D1
        ANDI    #$0002, R0                      ; 686A   03B8 0002
        BEQ     L_6871                          ; 686C   0204 0003

        PSHR    R4                              ; 686E   0274
        MOVR    R5,     R4                      ; 686F   00AC
        PULR    R5                              ; 6870   02B5
L_6871:
        CLRR    R1                              ; 6871   01C9
        MVI     G_01D1, R0                      ; 6872   0280 01D1
        ANDI    #$0001, R0                      ; 6874   03B8 0001
        BEQ     L_6879                          ; 6876   0204 0001

        INCR    R1                              ; 6878   0009
L_6879:
        MVO     R1,     G_035A                  ; 6879   0241 035A
        MVII    #$0008, R0                      ; 687B   02B8 0008
        MVII    #$000A, R1                      ; 687D   02B9 000A
        MVII    #$0214, R2                      ; 687F   02BA 0214
        MVII    #$0227, R3                      ; 6881   02BB 0227
L_6883:
        PSHR    R0                              ; 6883   0270
        PSHR    R1                              ; 6884   0271
        NOP                                     ; 6885   0034
        PSHR    R2                              ; 6886   0272
        PSHR    R3                              ; 6887   0273
L_6888:
        MVI@    R2,     R0                      ; 6888   0290
        SDBD                                    ; 6889   0001
        ANDI    #$3FF8, R0                      ; 688A   03B8 00F8 003F
        XORR    R4,     R0                      ; 688D   01E0
        MVO@    R0,     R2                      ; 688E   0250
        MVI@    R3,     R0                      ; 688F   0298
        ANDI    #$03F8, R0                      ; 6890   03B8 03F8
        XORR    R4,     R0                      ; 6892   01E0
        MVO@    R0,     R3                      ; 6893   0258
        ADDI    #$0014, R2                      ; 6894   02FA 0014
        ADDI    #$0014, R3                      ; 6896   02FB 0014
        DECR    R1                              ; 6898   0011
        BNEQ    L_6888                          ; 6899   022C 0012

        PULR    R3                              ; 689B   02B3
        PULR    R2                              ; 689C   02B2
        PULR    R1                              ; 689D   02B1
        PULR    R0                              ; 689E   02B0
        DECR    R0                              ; 689F   0010
        BEQ     L_68CF                          ; 68A0   0204 002D

        PSHR    R0                              ; 68A2   0270
        ANDI    #$0001, R0                      ; 68A3   03B8 0001
        BNEQ    L_68AD                          ; 68A5   020C 0006

        SUBI    #$0002, R1                      ; 68A7   0339 0002
        ADDI    #$0014, R2                      ; 68A9   02FA 0014
        ADDI    #$0014, R3                      ; 68AB   02FB 0014
L_68AD:
        INCR    R2                              ; 68AD   000A
        DECR    R3                              ; 68AE   0013
        MVI     G_035A, R0                      ; 68AF   0280 035A
        TSTR    R0                              ; 68B1   0080
        BNEQ    L_68BF                          ; 68B2   020C 000B

        PULR    R0                              ; 68B4   02B0
        CMPI    #$0004, R0                      ; 68B5   0378 0004
        BEQ     L_68CA                          ; 68B7   0204 0011

        CMPI    #$0001, R0                      ; 68B9   0378 0001
        BEQ     L_68CA                          ; 68BB   0204 000D
        B       L_6883                          ; 68BD   0220 003B

L_68BF:
        PULR    R0                              ; 68BF   02B0
        CMPI    #$0006, R0                      ; 68C0   0378 0006
        BEQ     L_68CA                          ; 68C2   0204 0006

        CMPI    #$0002, R0                      ; 68C4   0378 0002
        BEQ     L_68CA                          ; 68C6   0204 0002
        B       L_6883                          ; 68C8   0220 0046

L_68CA:
        PSHR    R4                              ; 68CA   0274
        MOVR    R5,     R4                      ; 68CB   00AC
        PULR    R5                              ; 68CC   02B5
        B       L_6883                          ; 68CD   0220 004B

L_68CF:
        MVI     .BTAB.7E,R0                     ; 68CF   0280 027E
        ANDI    #$0007, R0                      ; 68D1   03B8 0007
        MOVR    R0,     R1                      ; 68D3   0081
        XORI    #$02F8, R0                      ; 68D4   03F8 02F8
        MVO     R0,     .BTAB.7E                ; 68D6   0240 027E
        MVO     R0,     .BTAB.85                ; 68D8   0240 0285
        XORI    #$0398, R1                      ; 68DA   03F9 0398
        MVO     R1,     .BTAB.92                ; 68DC   0241 0292
        SUBI    #$0008, R1                      ; 68DE   0339 0008
        MVO     R1,     .BTAB.99                ; 68E0   0241 0299
        MVI     .BTAB.7F,R0                     ; 68E2   0280 027F
        ANDI    #$0007, R0                      ; 68E4   03B8 0007
        MOVR    R0,     R1                      ; 68E6   0081
        XORI    #$02F8, R0                      ; 68E7   03F8 02F8
        MVO     R0,     .BTAB.7F                ; 68E9   0240 027F
        MVO     R0,     .BTAB.84                ; 68EB   0240 0284
        XORI    #$0378, R1                      ; 68ED   03F9 0378
        MVO     R1,     .BTAB.93                ; 68EF   0241 0293
        SUBI    #$0008, R1                      ; 68F1   0339 0008
        MVO     R1,     .BTAB.98                ; 68F3   0241 0298
        MVI     G_01D1, R0                      ; 68F5   0280 01D1
        CMPI    #$009C, R0                      ; 68F7   0378 009C
        BLT     L_6924                          ; 68F9   0205 0029

        DECR    R0                              ; 68FB   0010
        MOVR    R0,     R1                      ; 68FC   0081
        ANDI    #$000F, R0                      ; 68FD   03B8 000F
        CMPI    #$000B, R0                      ; 68FF   0378 000B
        BLT     L_6924                          ; 6901   0205 0021

        ANDI    #$00F0, R1                      ; 6903   03B9 00F0
        CMPI    #$0090, R1                      ; 6905   0379 0090
        BEQ     L_6917                          ; 6907   0204 000E

        CMPI    #$00B0, R1                      ; 6909   0379 00B0
        BEQ     L_691C                          ; 690B   0204 000F

        CMPI    #$00D0, R1                      ; 690D   0379 00D0
        BEQ     L_6921                          ; 690F   0204 0010

        CMPI    #$00F0, R1                      ; 6911   0379 00F0
        BEQ     L_691C                          ; 6913   0204 0007
        B       L_6924                          ; 6915   0200 000D

L_6917:
        JSR     R5,     L_6980                  ; 6917   0004 0168 0180

        B       L_6924                          ; 691A   0200 0008

L_691C:
        PSHR    R0                              ; 691C   0270

        JSR     R5,     L_6980                  ; 691D   0004 0168 0180

        PULR    R0                              ; 6920   02B0

L_6921:
        JSR     R5,     L_69B2                  ; 6921   0004 0168 01B2

L_6924:
        MVI     G_01D1, R0                      ; 6924   0280 01D1
        CMPI    #$00FF, R0                      ; 6926   0378 00FF
        BEQ     L_6933                          ; 6928   0204 0009

        MVI     .BTAB.6C,R0                     ; 692A   0280 026C
        ANDI    #$0007, R0                      ; 692C   03B8 0007
        BEQ     L_6943                          ; 692E   0204 0013

        CLRR    R0                              ; 6930   01C0
        B       L_6935                          ; 6931   0200 0002

L_6933:
        MVII    #$02FC, R0                      ; 6933   02B8 02FC
L_6935:
        MVII    #$026C, R4                      ; 6935   02BC 026C
        MVO@    R0,     R4                      ; 6937   0260
        MVO@    R0,     R4                      ; 6938   0260
        NOP                                     ; 6939   0034
        MVO@    R0,     R4                      ; 693A   0260
        MVO@    R0,     R4                      ; 693B   0260
        ADDI    #$0010, R4                      ; 693C   02FC 0010
        MVO@    R0,     R4                      ; 693E   0260
        MVO@    R0,     R4                      ; 693F   0260
        NOP                                     ; 6940   0034
        MVO@    R0,     R4                      ; 6941   0260
        MVO@    R0,     R4                      ; 6942   0260
L_6943:
        CLRR    R0                              ; 6943   01C0
        MVII    #$0004, R1                      ; 6944   02B9 0004
        MVII    #$021D, R2                      ; 6946   02BA 021D
        MVII    #$021E, R3                      ; 6948   02BB 021E
L_694A:
        MVO@    R0,     R2                      ; 694A   0250
        MVO@    R0,     R3                      ; 694B   0258
        ADDI    #$0014, R2                      ; 694C   02FA 0014
        ADDI    #$0014, R3                      ; 694E   02FB 0014
        DECR    R1                              ; 6950   0011
        BNEQ    L_694A                          ; 6951   022C 0008

        MVII    #$010F, R1                      ; 6953   02B9 010F
        MVII    #$0259, R4                      ; 6955   02BC 0259
        MVI     G_01D1, R0                      ; 6957   0280 01D1
        ANDI    #$000F, R0                      ; 6959   03B8 000F
        BEQ     L_6977                          ; 695B   0204 001A

        CMPI    #$0001, R0                      ; 695D   0378 0001
        BEQ     L_6973                          ; 695F   0204 0012

        CMPI    #$0002, R0                      ; 6961   0378 0002
        BEQ     L_696F                          ; 6963   0204 000A

        CMPI    #$0003, R0                      ; 6965   0378 0003
        BEQ     L_696B                          ; 6967   0204 0002
        B       L_697F                          ; 6969   0200 0014

L_696B:
        SUBI    #$0002, R1                      ; 696B   0339 0002
        SUBI    #$0014, R4                      ; 696D   033C 0014
L_696F:
        SUBI    #$0002, R1                      ; 696F   0339 0002
        SUBI    #$0014, R4                      ; 6971   033C 0014
L_6973:
        SUBI    #$0002, R1                      ; 6973   0339 0002
        SUBI    #$0014, R4                      ; 6975   033C 0014
L_6977:
        SLL     R1,     2                       ; 6977   004D
        SLL     R1,     1                       ; 6978   0049
        XORI    #$0007, R1                      ; 6979   03F9 0007
        MVO@    R1,     R4                      ; 697B   0261
        ADDI    #$0008, R1                      ; 697C   02F9 0008
        MVO@    R1,     R4                      ; 697E   0261
L_697F:
        PULR    R7                              ; 697F   02B7

L_6980:
        CMPI    #$000B, R0                      ; 6980   0378 000B
        BEQ     L_6995                          ; 6982   0204 0011

        CMPI    #$000C, R0                      ; 6984   0378 000C
        BEQ     L_699C                          ; 6986   0204 0014

        CMPI    #$000D, R0                      ; 6988   0378 000D
        BEQ     L_69A3                          ; 698A   0204 0017

        CMPI    #$000E, R0                      ; 698C   0378 000E
        BEQ     L_69A8                          ; 698E   0204 0018

        CMPI    #$000F, R0                      ; 6990   0378 000F
        BEQ     L_69AD                          ; 6992   0204 0019
        MOVR    R5,     R7                      ; 6994   00AF

L_6995:
        MVII    #$027F, R2                      ; 6995   02BA 027F
        MVII    #$0101, R3                      ; 6997   02BB 0101
        J       L_69CB                          ; 6999   0004 0368 01CB

L_699C:
        MVII    #$027E, R2                      ; 699C   02BA 027E
        MVII    #$0105, R3                      ; 699E   02BB 0105
        J       L_69DF                          ; 69A0   0004 0368 01DF

L_69A3:
        MVII    #$027D, R2                      ; 69A3   02BA 027D
        J       L_69F9                          ; 69A5   0004 0368 01F9

L_69A8:
        MVII    #$027B, R2                      ; 69A8   02BA 027B
        J       L_6A01                          ; 69AA   0004 0368 0201

L_69AD:
        MVII    #$0278, R2                      ; 69AD   02BA 0278
        J       L_6A09                          ; 69AF   0004 0368 0209

L_69B2:
        CMPI    #$000B, R0                      ; 69B2   0378 000B
        BEQ     L_69C7                          ; 69B4   0204 0011

        CMPI    #$000C, R0                      ; 69B6   0378 000C
        BEQ     L_69DB                          ; 69B8   0204 0021

        CMPI    #$000D, R0                      ; 69BA   0378 000D
        BEQ     L_69F7                          ; 69BC   0204 0039

        CMPI    #$000E, R0                      ; 69BE   0378 000E
        BEQ     L_69FF                          ; 69C0   0204 003D

        CMPI    #$000F, R0                      ; 69C2   0378 000F
        BEQ     L_6A07                          ; 69C4   0204 0041
        MOVR    R5,     R7                      ; 69C6   00AF

L_69C7:
        MVII    #$0284, R2                      ; 69C7   02BA 0284
        MVII    #$0102, R3                      ; 69C9   02BB 0102
L_69CB:
        MVI@    R2,     R1                      ; 69CB   0291
        ANDI    #$0007, R1                      ; 69CC   03B9 0007
        SDBD                                    ; 69CE   0001
        MVII    #$0800, R0                      ; 69CF   02B8 0000 0008
        XORR    R1,     R0                      ; 69D2   01C8
        MVO@    R0,     R2                      ; 69D3   0250
        ADDI    #$0014, R2                      ; 69D4   02FA 0014
        SLL     R3,     2                       ; 69D6   004F
        SLL     R3,     1                       ; 69D7   004B
        XORR    R1,     R3                      ; 69D8   01CB
        MVO@    R3,     R2                      ; 69D9   0253
        MOVR    R5,     R7                      ; 69DA   00AF

L_69DB:
        MVII    #$0284, R2                      ; 69DB   02BA 0284
        MVII    #$0107, R3                      ; 69DD   02BB 0107
L_69DF:
        SLL     R3,     2                       ; 69DF   004F
        SLL     R3,     1                       ; 69E0   004B
        MVI@    R2,     R1                      ; 69E1   0291
        ANDI    #$0007, R1                      ; 69E2   03B9 0007
        SDBD                                    ; 69E4   0001
        MVII    #$0818, R0                      ; 69E5   02B8 0018 0008
        XORR    R1,     R0                      ; 69E8   01C8
        MVO@    R0,     R2                      ; 69E9   0250
        INCR    R2                              ; 69EA   000A
        ADDI    #$0008, R0                      ; 69EB   02F8 0008
        MVO@    R0,     R2                      ; 69ED   0250
        ADDI    #$0013, R2                      ; 69EE   02FA 0013
        XORR    R1,     R3                      ; 69F0   01CB
        MVO@    R3,     R2                      ; 69F1   0253
        ADDI    #$0008, R3                      ; 69F2   02FB 0008
        INCR    R2                              ; 69F4   000A
        MVO@    R3,     R2                      ; 69F5   0253
        MOVR    R5,     R7                      ; 69F6   00AF

L_69F7:
        MVII    #$0286, R2                      ; 69F7   02BA 0286
L_69F9:
        MVII    #$0003, R3                      ; 69F9   02BB 0003
        MVII    #$0001, R4                      ; 69FB   02BC 0001
        B       L_6A0D                          ; 69FD   0200 000E

L_69FF:
        MVII    #$0287, R2                      ; 69FF   02BA 0287
L_6A01:
        MVII    #$0004, R3                      ; 6A01   02BB 0004
        MVII    #$0002, R4                      ; 6A03   02BC 0002
        B       L_6A0D                          ; 6A05   0200 0006

L_6A07:
        MVII    #$0289, R2                      ; 6A07   02BA 0289
L_6A09:
        MVII    #$0005, R3                      ; 6A09   02BB 0005
        MVII    #$0003, R4                      ; 6A0B   02BC 0003
L_6A0D:
        PSHR    R2                              ; 6A0D   0272
        PSHR    R3                              ; 6A0E   0273
L_6A0F:
        MVI@    R2,     R0                      ; 6A0F   0290
        SDBD                                    ; 6A10   0001
        ANDI    #$FFF8, R0                      ; 6A11   03B8 00F8 00FF
        MVO@    R0,     R2                      ; 6A14   0250
        ADDI    #$0014, R2                      ; 6A15   02FA 0014
        DECR    R3                              ; 6A17   0013
        BNEQ    L_6A0F                          ; 6A18   022C 000A

        PULR    R3                              ; 6A1A   02B3
        PULR    R2                              ; 6A1B   02B2
        INCR    R2                              ; 6A1C   000A
        DECR    R4                              ; 6A1D   0014
        BNEQ    L_6A0D                          ; 6A1E   022C 0012
        MOVR    R5,     R7                      ; 6A20   00AF

L_6A21:
        PSHR    R5                              ; 6A21   0275
        PSHR    R4                              ; 6A22   0274
        MOVR    R2,     R4                      ; 6A23   0094
        ANDI    #$001F, R4                      ; 6A24   03BC 001F
        CMPI    #$0010, R4                      ; 6A26   037C 0010
        BLE     L_6A2D                          ; 6A28   0206 0003

        NEGR    R4                              ; 6A2A   0024
        ADDI    #$0020, R4                      ; 6A2B   02FC 0020
L_6A2D:
        ADDR    R4,     R4                      ; 6A2D   00E4
        SDBD                                    ; 6A2E   0001
        ADDI    #$6A59, R4                      ; 6A2F   02FC 0059 006A
        MVI@    R4,     R1                      ; 6A32   02A1
        MOVR    R3,     R0                      ; 6A33   0098

        JSR     R5,     L_5582                  ; 6A34   0004 0154 0182

        SWAP    R0,     1                       ; 6A37   0040
        ANDI    #$00FF, R0                      ; 6A38   03B8 00FF
        PSHR    R0                              ; 6A3A   0270
        MVI@    R4,     R1                      ; 6A3B   02A1
        MOVR    R3,     R0                      ; 6A3C   0098

        JSR     R5,     L_5582                  ; 6A3D   0004 0154 0182

        SWAP    R0,     1                       ; 6A40   0040
        ANDI    #$00FF, R0                      ; 6A41   03B8 00FF
        MOVR    R0,     R1                      ; 6A43   0081
        PULR    R0                              ; 6A44   02B0
        CMPI    #$0010, R2                      ; 6A45   037A 0010
        BLT     L_6A4D                          ; 6A47   0205 0004

        CMPI    #$0030, R2                      ; 6A49   037A 0030
        BLT     L_6A4E                          ; 6A4B   0205 0001

L_6A4D:
        NEGR    R1                              ; 6A4D   0021
L_6A4E:
        CMPI    #$0020, R2                      ; 6A4E   037A 0020
        BLE     L_6A53                          ; 6A50   0206 0001

        NEGR    R0                              ; 6A52   0020
L_6A53:
        ADDI    #$0054, R0                      ; 6A53   02F8 0054
        ADDI    #$0034, R1                      ; 6A55   02F9 0034
        PULR    R4                              ; 6A57   02B4
        PULR    R7                              ; 6A58   02B7

        DECLE   $0000,  $0080,  $0015,  $0080   ; 6A59   0000 0080 0015 0080
        DECLE   $002A,  $0080,  $0040,  $0080   ; 6A5D   002A 0080 0040 0080
        DECLE   $0055,  $0080,  $006A,  $0080   ; 6A61   0055 0080 006A 0080
        DECLE   $0080,  $0080,  $0095,  $0080   ; 6A65   0080 0080 0095 0080
        DECLE   $00AA,  $0080,  $00C0,  $0080   ; 6A69   00AA 0080 00C0 0080
        DECLE   $00D5,  $0080,  $00EA,  $0080   ; 6A6D   00D5 0080 00EA 0080
        DECLE   $0100,  $0080,  $0100,  $0060   ; 6A71   0100 0080 0100 0060
        DECLE   $0100,  $0040,  $0100,  $0020   ; 6A75   0100 0040 0100 0020
        DECLE   $0100,  $0000                   ; 6A79   0100 0000
L_6A7B:
        PSHR    R5                              ; 6A7B   0275
        MVII    #$0215, R4                      ; 6A7C   02BC 0215
        MVII    #$0001, R5                      ; 6A7E   02BD 0001
        B       L_6A87                          ; 6A80   0200 0005

L_6A82:
        PSHR    R5                              ; 6A82   0275
        MVII    #$0226, R4                      ; 6A83   02BC 0226
        CLRR    R5                              ; 6A85   01ED
        DECR    R5                              ; 6A86   0015
L_6A87:
        MVII    #$0014, R1                      ; 6A87   02B9 0014
L_6A89:
        PSHR    R1                              ; 6A89   0271
        MVII    #$000A, R1                      ; 6A8A   02B9 000A
        MOVR    R4,     R2                      ; 6A8C   00A2
L_6A8D:
        PSHR    R1                              ; 6A8D   0271
        MVII    #$0013, R1                      ; 6A8E   02B9 0013
        PSHR    R2                              ; 6A90   0272
        MOVR    R2,     R3                      ; 6A91   0093
        SUBR    R5,     R3                      ; 6A92   012B
        MVI@    R3,     R0                      ; 6A93   0298
        PSHR    R0                              ; 6A94   0270
L_6A95:
        MVI@    R2,     R0                      ; 6A95   0290
        MVO@    R0,     R3                      ; 6A96   0258
        ADDR    R5,     R2                      ; 6A97   00EA
        ADDR    R5,     R3                      ; 6A98   00EB
        DECR    R1                              ; 6A99   0011
        BNEQ    L_6A95                          ; 6A9A   022C 0006

        PULR    R0                              ; 6A9C   02B0
        MVO@    R0,     R3                      ; 6A9D   0258
        PULR    R2                              ; 6A9E   02B2
        ADDI    #$0014, R2                      ; 6A9F   02FA 0014
        PULR    R1                              ; 6AA1   02B1
        DECR    R1                              ; 6AA2   0011
        BNEQ    L_6A8D                          ; 6AA3   022C 0017

        CLRR    R0                              ; 6AA5   01C0
        MVO     R0,     G_01EE                  ; 6AA6   0240 01EE
L_6AA8:
        MVI     G_01EE, R0                      ; 6AA8   0280 01EE
        CMPI    #$0004, R0                      ; 6AAA   0378 0004
        BNEQ    L_6AA8                          ; 6AAC   022C 0005

        PULR    R1                              ; 6AAE   02B1
        DECR    R1                              ; 6AAF   0011
        BNEQ    L_6A89                          ; 6AB0   022C 0028
        PULR    R7                              ; 6AB2   02B7

        DECLE   $0000,  $0000,  $0000,  $0200   ; 6AB3   0000 0000 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6AB7   0000 0000 0000 0001
        DECLE   $0001,  $0000,  $0002,  $0002   ; 6ABB   0001 0000 0002 0002
        DECLE   $0000,  $0003,  $0000,  $0200   ; 6ABF   0000 0003 0000 0200
        DECLE   $0003,  $0000                   ; 6AC3   0003 0000

        ADDR    R2,     R3                      ; 6AC5   00D3
        SAR     R2,     1                       ; 6AC6   006A
L_6AC7:
        DECR    R7                              ; 6AC7   0017

        DECLE   $006B,  $00F5,  $006A,  $0039   ; 6AC8   006B 00F5 006A 0039
        DECLE   $006B,  $00BB,  $006B,  $00BB   ; 6ACC   006B 00BB 006B 00BB
        DECLE   $006B,  $001D,  $006C,  $01E0   ; 6AD0   006B 001D 006C 01E0
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6AD4   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0038   ; 6AD8   0000 0000 001C 0038
        DECLE   $003C,  $00FE,  $00FF,  $00FC   ; 6ADC   003C 00FE 00FF 00FC
        DECLE   $0070,  $003C,  $0038,  $0010   ; 6AE0   0070 003C 0038 0010
        DECLE   $0010,  $0010,  $0038,  $007C   ; 6AE4   0010 0010 0038 007C
        DECLE   $007C,  $00FF,  $00E0,  $00C4   ; 6AE8   007C 00FF 00E0 00C4
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 6AEC   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF0   0000 0000 0000 0000
        DECLE   $0000,  $01E0,  $0004,  $0000   ; 6AF4   0000 01E0 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF8   0000 0000 0000 0000
        DECLE   $007E,  $005A,  $007E,  $007E   ; 6AFC   007E 005A 007E 007E
        DECLE   $007E,  $007E,  $0042,  $007E   ; 6B00   007E 007E 0042 007E
        DECLE   $003C,  $0018,  $0018,  $0018   ; 6B04   003C 0018 0018 0018
        DECLE   $003C,  $007E,  $007E,  $00FF   ; 6B08   003C 007E 007E 00FF
        DECLE   $0081,  $00A5,  $0081,  $0000   ; 6B0C   0081 00A5 0081 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $01E0   ; 6B14   0000 0000 0000 01E0
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6B18   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1C   0000 0000 0000 0000
        DECLE   $0000,  $007E,  $007E,  $007E   ; 6B20   0000 007E 007E 007E
        DECLE   $007E,  $007E,  $003C,  $0018   ; 6B24   007E 007E 003C 0018
        DECLE   $0018,  $0018,  $003C,  $007E   ; 6B28   0018 0018 003C 007E
        DECLE   $007E,  $00FF,  $00FF,  $00FF   ; 6B2C   007E 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6B30   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B34   0000 0000 0000 0000
        DECLE   $0000,  $0160,  $0010,  $0000   ; 6B38   0000 0160 0010 0000
        DECLE   $0000,  $0000,  $0003,  $0001   ; 6B3C   0000 0000 0003 0001
        DECLE   $0000,  $0000,  $0018,  $0000   ; 6B40   0000 0000 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B44   0000 0000 0000 0000
        DECLE   $0024,  $0036,  $0036,  $0010   ; 6B48   0024 0036 0036 0010
        DECLE   $0038,  $0078,  $00D8,  $00DA   ; 6B4C   0038 0078 00D8 00DA
        DECLE   $007E,  $003C,  $0000,  $0018   ; 6B50   007E 003C 0000 0018
        DECLE   $001C,  $003E,  $0036,  $0024   ; 6B54   001C 003E 0036 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5C   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0018,  $0000   ; 6B60   0001 0001 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B64   0000 0000 0000 0000
        DECLE   $0010,  $0018,  $0018,  $0010   ; 6B68   0010 0018 0018 0010
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6B6C   0018 0018 0018 0018
        DECLE   $001E,  $001E,  $0000,  $0018   ; 6B70   001E 001E 0000 0018
        DECLE   $0018,  $0010,  $0010,  $0010   ; 6B74   0018 0010 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0001   ; 6B7C   0000 0000 0003 0001
        DECLE   $0010,  $0010,  $0018,  $0000   ; 6B80   0010 0010 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B84   0000 0000 0000 0000
        DECLE   $0024,  $0036,  $0036,  $0010   ; 6B88   0024 0036 0036 0010
        DECLE   $0038,  $0078,  $00D8,  $00DA   ; 6B8C   0038 0078 00D8 00DA
        DECLE   $006E,  $002C,  $0000,  $0018   ; 6B90   006E 002C 0000 0018
        DECLE   $001C,  $003E,  $0036,  $0024   ; 6B94   001C 003E 0036 0024
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6B98   0000 0000 0000 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6B9C   0001 0000 0000 0000
        DECLE   $0000,  $0080,  $0098,  $0000   ; 6BA0   0000 0080 0098 0000
        DECLE   $0000,  $0000                   ; 6BA4   0000 0000

        ADDR    R0,     R0                      ; 6BA6   00C0
        ADDR    R0,     R0                      ; 6BA7   00C0
        MOVR    R0,     R2                      ; 6BA8   0082
        MOVR    R0,     R3                      ; 6BA9   0083
        DIS                                     ; 6BAA   0003
        DECR    R0                              ; 6BAB   0010
        ADDR    R7,     R0                      ; 6BAC   00F8
        ADDR    R7,     R1                      ; 6BAD   00F9
        MOVR    R3,     R7                      ; 6BAE   009F
        MOVR    R3,     R7                      ; 6BAF   009F

        DECLE   $0098,  $0018,  $0000,  $0018   ; 6BB0   0098 0018 0000 0018
        DECLE   $001E,  $001E,  $0032,  $0032   ; 6BB4   001E 001E 0032 0032
        DECLE   $0000,  $0000,  $0000,  $0180   ; 6BB8   0000 0000 0000 0180
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6BBC   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 6BC0   0000 0000 0000 0081
        DECLE   $00BD,  $0000,  $0000,  $0000   ; 6BC4   00BD 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; 6BC8   0000 0000 0000 0024
        DECLE   $0024,  $0018,  $00FF,  $00FF   ; 6BCC   0024 0018 00FF 00FF
        DECLE   $00BD,  $00BD,  $00BD,  $003C   ; 6BD0   00BD 00BD 00BD 003C
        DECLE   $0000,  $003C,  $003C,  $003C   ; 6BD4   0000 003C 003C 003C
        DECLE   $0024,  $0024,  $0024,  $0000   ; 6BD8   0024 0024 0024 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0081   ; 6BE0   0000 0000 0080 0081
        DECLE   $003C,  $0000,  $0000,  $0000   ; 6BE4   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0004           ; 6BE8   0000 0000 0004

        NEGR    R4                              ; 6BEB   0024

        JSR     R4,     X_GETNUM                ; 6BEC   0004 0018 00FF
        DECLE   $00FF,  $00BD,  $00BD,  $003D   ; 6BEF   00FF 00BD 00BD 003D
        DECLE   $003C,  $0000,  $003C,  $003C   ; 6BF3   003C 0000 003C 003C
        DECLE   $003C,  $0024,  $0024,  $0020   ; 6BF7   003C 0024 0024 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0080   ; 6BFF   0000 0000 0080 0080
        DECLE   $0000,  $003C,  $0000,  $0000   ; 6C03   0000 003C 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0024   ; 6C07   0000 0000 0004 0024
        DECLE   $0004,  $0000,  $0018,  $00FF   ; 6C0B   0004 0000 0018 00FF
        DECLE   $00FF,  $00BD,  $003D,  $003C   ; 6C0F   00FF 00BD 003D 003C
        DECLE   $003C,  $0000,  $003C,  $003C   ; 6C13   003C 0000 003C 003C
        DECLE   $003C,  $0024,  $0020,  $0000   ; 6C17   003C 0024 0020 0000
        DECLE   $0000,  $0000,  $0160,  $0010   ; 6C1B   0000 0000 0160 0010
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6C1F   0000 0000 0000 0001
        DECLE   $0001,  $0000,  $0002,  $001A   ; 6C23   0001 0000 0002 001A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C27   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0000           ; 6C2B   0001 0001 0000

        DIS                                     ; 6C2E   0003
        DECR    R0                              ; 6C2F   0010
        COMR    R0                              ; 6C30   0018
        COMR    R0                              ; 6C31   0018
        COMR    R6                              ; 6C32   001E
        COMR    R6                              ; 6C33   001E
        COMR    R0                              ; 6C34   0018
        COMR    R4                              ; 6C35   001C

        JSR     R4,     .EXEC.81F               ; 6C36   0004 0018 001F
        DECLE   $001F,  $0009,  $000C,  $0006   ; 6C39   001F 0009 000C 0006
        DECLE   $0002,  $0000,  $0000,  $0001   ; 6C3D   0002 0000 0000 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6C41   0001 0000 0000 0000
        DECLE   $0001,  $0019,  $0000,  $0000   ; 6C45   0001 0019 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6C49   0000 0000 0000 0001
        DECLE   $0009,  $000C,  $0010,  $0018   ; 6C4D   0009 000C 0010 0018
        DECLE   $001A,  $001E,  $001C,  $0018   ; 6C51   001A 001E 001C 0018
        DECLE   $001E,  $0006,  $0018,  $0018   ; 6C55   001E 0006 0018 0018
        DECLE   $001F,  $0007,  $000D,  $0008   ; 6C59   001F 0007 000D 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5D   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0000   ; 6C61   0000 0001 0001 0000
        DECLE   $0002,  $0012,  $0000,  $0000   ; 6C65   0002 0012 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 6C69   0000 0000 0001 0001
        DECLE   $0000,  $0003,  $0010,  $0018   ; 6C6D   0000 0003 0010 0018
        DECLE   $0018,  $001E,  $001E,  $0018   ; 6C71   0018 001E 001E 0018
        DECLE   $001C,  $000C,  $0018,  $001F   ; 6C75   001C 000C 0018 001F
        DECLE   $001F,  $0009,  $000C,  $0006   ; 6C79   001F 0009 000C 0006
        DECLE   $0002,  $0000,  $0001,  $0000   ; 6C7D   0002 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C81   0000 0000 0000 0000
        DECLE   $0001,  $0019,  $0000,  $0000   ; 6C85   0001 0019 0000 0000
        DECLE   $0000,  $0000,  $0001           ; 6C89   0000 0000 0001

        INCR    R3                              ; 6C8C   000B
        INCR    R7                              ; 6C8D   000F

        INCR    R4                              ; 6C8E   000C
L_6C8F:
        DECR    R2                              ; 6C8F   0012
        DECLE   $001A,  $001E,  $0018,  $001C   ; 6C90   001A 001E 0018 001C
        DECLE   $001E,  $001A,  $0000,  $0018   ; 6C94   001E 001A 0000 0018
        DECLE   $001E,  $000A,  $000A,  $0008   ; 6C98   001E 000A 000A 0008
        DECLE   $0000,  $0000,  $0000,  $01C0   ; 6C9C   0000 0000 0000 01C0
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6CA0   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0081   ; 6CA4   0000 0000 0003 0081
        DECLE   $00BC,  $0000,  $0000,  $0000   ; 6CA8   00BC 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0042   ; 6CAC   0000 0000 0000 0042
        DECLE   $0042,  $0018,  $00FF,  $00FF   ; 6CB0   0042 0018 00FF 00FF
        DECLE   $00BD,  $00BD,  $00BC,  $003C   ; 6CB4   00BD 00BD 00BC 003C
        DECLE   $0000,  $003C,  $003C,  $0066   ; 6CB8   0000 003C 003C 0066
        DECLE   $0066,  $0042,  $0042,  $0000   ; 6CBC   0066 0042 0042 0000
        DECLE   $0000,  $01C0,  $0008,  $0000   ; 6CC0   0000 01C0 0008 0000
        DECLE   $00C0,  $0041,  $0001,  $0000   ; 6CC4   00C0 0041 0001 0000
        DECLE   $0000,  $0000,  $0018,  $0000   ; 6CC8   0000 0000 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6CCC   0000 0000 0000 0001
        DECLE   $0001,  $0000,  $0003,  $0010   ; 6CD0   0001 0000 0003 0010
        DECLE   $0038,  $003E,  $001E,  $0018   ; 6CD4   0038 003E 001E 0018
        DECLE   $0018,  $0018,  $0000,  $0018   ; 6CD8   0018 0018 0000 0018
        DECLE   $001F,  $001F,  $0009,  $000C   ; 6CDC   001F 001F 0009 000C
        DECLE   $0006,  $0002,  $0000,  $0000   ; 6CE0   0006 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE4   0000 0000 0000 0000
        DECLE   $0038,  $001C,  $003C,  $007F   ; 6CE8   0038 001C 003C 007F
        DECLE   $00FF,  $003F,  $000E,  $003C   ; 6CEC   00FF 003F 000E 003C
        DECLE   $001C,  $0010,  $0010,  $0008   ; 6CF0   001C 0010 0010 0008
        DECLE   $001C,  $003E,  $003E,  $00FF   ; 6CF4   001C 003E 003E 00FF
        DECLE   $0007,  $0023,  $0003,  $0000   ; 6CF8   0007 0023 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0180   ; 6D00   0000 0000 0000 0180
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6D04   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D08   0000 0000 0000 0000
        DECLE   $0010,  $0008,  $0000,  $0000   ; 6D0C   0010 0008 0000 0000
        DECLE   $0000,  $0002,  $0042,  $0060   ; 6D10   0000 0002 0042 0060
        DECLE   $0060,  $0001,  $0003,  $0003   ; 6D14   0060 0001 0003 0003
        DECLE   $0007,  $0007,  $000E,  $000E   ; 6D18   0007 0007 000E 000E
        DECLE   $000E,  $0032,  $0032,  $0062   ; 6D1C   000E 0032 0032 0062
        DECLE   $0042,  $0040,  $0000,  $0000   ; 6D20   0042 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D28   0000 0000 0000 0000
        DECLE   $0008,  $0010,  $0010,  $0000   ; 6D2C   0008 0010 0010 0000
        DECLE   $0000,  $0000,  $0008,  $000C   ; 6D30   0000 0000 0008 000C
        DECLE   $000C,  $0010,  $0018,  $0018   ; 6D34   000C 0010 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6D38   0018 0018 0018 0018
        DECLE   $0010,  $0008,  $0008,  $0018   ; 6D3C   0010 0008 0008 0018
        DECLE   $0008,  $0008,  $0000,  $0000   ; 6D40   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D48   0000 0000 0000 0000
        DECLE   $0008,  $0010,  $0000,  $0000   ; 6D4C   0008 0010 0000 0000
        DECLE   $0000,  $0040,  $0042,  $0003   ; 6D50   0000 0040 0042 0003
        DECLE   $0003,  $0080,  $00C0,  $00C0   ; 6D54   0003 0080 00C0 00C0
        DECLE   $0060,  $0060,  $0070,  $0070   ; 6D58   0060 0060 0070 0070
        DECLE   $0070,  $0048,  $005C,  $0044   ; 6D5C   0070 0048 005C 0044
        DECLE   $0046,  $0002,  $0000,  $0000   ; 6D60   0046 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0038   ; 6D68   0000 0000 001C 0038
        DECLE   $003C,  $00FE,  $00FF,  $00FC   ; 6D6C   003C 00FE 00FF 00FC
        DECLE   $0060,  $002C,  $0038,  $0010   ; 6D70   0060 002C 0038 0010
        DECLE   $0010,  $0010,  $0038,  $007C   ; 6D74   0010 0010 0038 007C
        DECLE   $007C,  $00FF,  $00E0,  $00C0   ; 6D78   007C 00FF 00E0 00C0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 6D7C   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D80   0000 0000 0000 0000
        DECLE   $0000,  $01C0,  $0008,  $0000   ; 6D84   0000 01C0 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6D90   0000 0000 0000 0001
        DECLE   $0011,  $0019,  $0019,  $0000   ; 6D94   0011 0019 0019 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA0   0000 0000 0000 0000
        DECLE   $00E0,  $00E6,  $00E6,  $0004   ; 6DA4   00E0 00E6 00E6 0004
        DECLE   $0004,  $000C,  $000C,  $001E   ; 6DA8   0004 000C 000C 001E
        DECLE   $001E,  $001E,  $001E,  $001F   ; 6DAC   001E 001E 001E 001F
        DECLE   $001F                           ; 6DB0   001F

        COMR    R6                              ; 6DB1   001E
        COMR    R6                              ; 6DB2   001E
        INCR    R6                              ; 6DB3   000E
        INCR    R4                              ; 6DB4   000C
        INCR    R4                              ; 6DB5   000C
        INCR    R4                              ; 6DB6   000C
        NEGR    R0                              ; 6DB7   0020
        NEGR    R0                              ; 6DB8   0020
        NEGR    R0                              ; 6DB9   0020
        NEGR    R0                              ; 6DBA   0020
        SLR     R0,     1                       ; 6DBB   0060
        SLR     R0,     1                       ; 6DBC   0060
        ADDR    R4,     R0                      ; 6DBD   00E0
        ADDR    R4,     R0                      ; 6DBE   00E0
        ADDR    R4,     R0                      ; 6DBF   00E0
        ADDR    R4,     R0                      ; 6DC0   00E0
        ADDR    R4,     R0                      ; 6DC1   00E0
        SLR     R0,     1                       ; 6DC2   0060
        RRC     R0,     1                       ; 6DC3   0070
        RRC     R0,     1                       ; 6DC4   0070
        GSWD    R0                              ; 6DC5   0030
        GSWD    R0                              ; 6DC6   0030
        ANDR    R0,     R0                      ; 6DC7   0180
        EIS                                     ; 6DC8   0002
        ADDR    R4,     R7                      ; 6DC9   00E7

        DECLE   $0000,  $0000,  $0000,  $0042   ; 6DCA   0000 0000 0000 0042
        DECLE   $0000,  $0081,  $00FF,  $0000   ; 6DCE   0000 0081 00FF 0000
        DECLE   $0000,  $00C3,  $0000,  $0000   ; 6DD2   0000 00C3 0000 0000
        DECLE   $00DB,  $0024,  $0024,  $00DD   ; 6DD6   00DB 0024 0024 00DD
        DECLE   $006D,  $000D,  $006E,  $0000   ; 6DDA   006D 000D 006E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDE   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 6DE2   0000 0010 0010 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6DE6   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0010   ; 6DF2   0000 0000 0028 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6DF6   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 6E02   0000 0000 0000 0038
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6E06   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0E   0000 0000 0000 0000
        DECLE   $0042,  $0024,  $0018,  $0018   ; 6E12   0042 0024 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1E   0000 0000 0000 0000
        DECLE   $0000,  $0066,  $0018,  $0018   ; 6E22   0000 0066 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2E   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $005A,  $0018   ; 6E32   0000 0024 005A 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0041   ; 6E3A   0000 0000 0000 0041
        DECLE   $006E,  $0071,  $006E,  $0000   ; 6E3E   006E 0071 006E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E42   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $0010,  $0028   ; 6E46   0000 0038 0010 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E52   0000 0000 0000 0000
        DECLE   $0028,  $0010,  $0038,  $0000   ; 6E56   0028 0010 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E62   0000 0000 0000 0000
        DECLE   $0028,  $0010,  $0010,  $0028   ; 6E66   0028 0010 0010 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0042   ; 6E72   0000 0000 0000 0042
        DECLE   $0024,  $007E,  $0018,  $007E   ; 6E76   0024 007E 0018 007E
        DECLE   $0018,  $0024,  $0042,  $0000   ; 6E7A   0018 0024 0042 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; 6E82   0000 0000 0000 0024
        DECLE   $0024,  $007E,  $005A,  $003C   ; 6E86   0024 007E 005A 003C
        DECLE   $005A,  $0024,  $0000,  $0000   ; 6E8A   005A 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6E92   0000 0000 0000 0018
        DECLE   $0024,  $007E,  $0018,  $007E   ; 6E96   0024 007E 0018 007E
        DECLE   $0018,  $0066,  $0000,  $0000   ; 6E9A   0018 0066 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00A5   ; 6E9E   0000 0000 0000 00A5
        DECLE   $006E,  $00D5,  $006E,  $0000   ; 6EA2   006E 00D5 006E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA6   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0010   ; 6EAA   0000 0010 0010 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6EAE   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0028,  $0010   ; 6EBA   0000 0000 0028 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6EBE   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 6ECA   0000 0000 0000 0038
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6ECE   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED6   0000 0000 0000 0000
        DECLE   $00E7,  $0024,  $0018,  $003C   ; 6EDA   00E7 0024 0018 003C
        DECLE   $003C,  $0018,  $0000,  $0000   ; 6EDE   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE6   0000 0000 0000 0000
        DECLE   $0000,  $00E7,  $0018,  $003C   ; 6EEA   0000 00E7 0018 003C
        DECLE   $003C,  $0018,  $0000,  $0000   ; 6EEE   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF6   0000 0000 0000 0000
        DECLE   $0000,  $0066,  $0099,  $00BD   ; 6EFA   0000 0066 0099 00BD
        DECLE   $003C,  $0018,  $0000,  $0000   ; 6EFE   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0009   ; 6F02   0000 0000 0000 0009
        DECLE   $006F,  $0039,  $006F,  $0000   ; 6F06   006F 0039 006F 0000
        DECLE   $0000,  $0000,  $0000,  $0036   ; 6F0A   0000 0000 0000 0036
        DECLE   $0036,  $003E,  $002A,  $003E   ; 6F0E   0036 003E 002A 003E
        DECLE   $0036,  $0014,  $0004,  $0000   ; 6F12   0036 0014 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0036   ; 6F1A   0000 0000 0000 0036
        DECLE   $0036,  $003E,  $002A,  $003E   ; 6F1E   0036 003E 002A 003E
        DECLE   $0036,  $0014,  $0014,  $0000   ; 6F22   0036 0014 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0036   ; 6F2A   0000 0000 0000 0036
        DECLE   $0036,  $003E,  $002A,  $003E   ; 6F2E   0036 003E 002A 003E
        DECLE   $0036,  $0014,  $0010,  $0000   ; 6F32   0036 0014 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F36   0000 0000 0000 0000
        DECLE   $0000                           ; 6F3A   0000

        SWAP    R2,     1                       ; 6F3B   0042
        ADDR    R4,     R7                      ; 6F3C   00E7

        DECLE   $00A5,  $00BD,  $00BD,  $00FF   ; 6F3D   00A5 00BD 00BD 00FF
        DECLE   $00DB,  $00FF,  $00C3,  $00DB   ; 6F41   00DB 00FF 00C3 00DB
        DECLE   $007E,  $0066,  $0066,  $0006   ; 6F45   007E 0066 0066 0006
        DECLE   $0000,  $0000                   ; 6F49   0000 0000

        SWAP    R2,     1                       ; 6F4B   0042
        ADDR    R4,     R7                      ; 6F4C   00E7

        DECLE   $00A5,  $00BD,  $00BD,  $00FF   ; 6F4D   00A5 00BD 00BD 00FF
        DECLE   $00DB,  $00FF,  $00C3,  $00DB   ; 6F51   00DB 00FF 00C3 00DB
        DECLE   $007E,  $0066,  $0066,  $0066   ; 6F55   007E 0066 0066 0066
        DECLE   $0000,  $0000                   ; 6F59   0000 0000

        SWAP    R2,     1                       ; 6F5B   0042
        ADDR    R4,     R7                      ; 6F5C   00E7

        DECLE   $00A5,  $00BD,  $00BD,  $00FF   ; 6F5D   00A5 00BD 00BD 00FF
        DECLE   $00DB,  $00FF,  $00C3,  $00DB   ; 6F61   00DB 00FF 00C3 00DB
        DECLE   $007E,  $0066,  $0066,  $0060   ; 6F65   007E 0066 0066 0060
        DECLE   $006D,  $006F,  $009D,  $006F   ; 6F69   006D 006F 009D 006F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $003B,  $002A   ; 6F71   0000 0000 003B 002A
        DECLE   $002A,  $006E,  $0000,  $0000   ; 6F75   002A 006E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $006E,  $002A   ; 6F81   0000 0000 006E 002A
        DECLE   $002A,  $003A,  $0007,  $0000   ; 6F85   002A 003A 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8D   0000 0000 0000 0000
        DECLE   $000C,  $000C,  $00E8,  $00A8   ; 6F91   000C 000C 00E8 00A8
        DECLE   $00A8,  $002C,  $0024,  $003C   ; 6F95   00A8 002C 0024 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F99   0000 0000 0000 0000
.GFX_LIST_6F9D:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9D  CART PIC #00
        DECLE   $0026,  $0077,  $0054,  $0054   ; 6FA1  
        DECLE   $0054,  $0054,  $00DC,  $0088   ; 6FA5  CART PIC #01
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA9  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAD  CART PIC #02
        DECLE   $0008,  $00DC,  $0054,  $0054   ; 6FB1  
        DECLE   $0054,  $0054,  $0076,  $0027   ; 6FB5  CART PIC #03
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB9  
        DECLE   $0000,  $000C,  $000E,  $0008   ; 6FBD  CART PIC #04
        DECLE   $000C,  $0024,  $0076,  $0053   ; 6FC1  
        DECLE   $0051,  $00D9,  $000F,  $0006   ; 6FC5  CART PIC #05
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC9  
        DECLE   $00CF,  $006F,  $0000,  $0000   ; 6FCD  CART PIC #06
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD1  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD5  CART PIC #07
        DECLE   $0030,  $0038,  $002E,  $006F   ; 6FD9  
        DECLE   $006D,  $007D,  $0000,  $0000   ; 6FDD  CART PIC #08
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1  
        DECLE   $0030,  $0038,  $002F,  $006D   ; 6FE5  CART PIC #09
        DECLE   $006D,  $007F,  $006A,  $00C0   ; 6FE9  
        DECLE   $00D5,  $00FF,  $0002,  $0007   ; 6FED  CART PIC #0A
        DECLE   $0005,  $001D,  $003F,  $006E   ; 6FF1  
        DECLE   $006E,  $006A,  $0078,  $0068   ; 6FF5  CART PIC #0B
        DECLE   $0060,  $00C0,  $00C0,  $00C0   ; 6FF9  
        DECLE   $00D5,  $00FF,  $0212,  $0000   ; 6FFD  CART PIC #0C
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5026       <entry>
;;  $504E       $5051  
;;  $50B5       $50F0  
;;  $50BE       $50C4  
;;  $50C8       $50D0  
;;  $50D4       $50DA  
;;  $50E1       $50EE  
;;  $50F2       $50C0   $50CC   $50D6  
;;  $513B       $5139  
;;  $5141       <entry> $50E5   $50EB   $5145   $514B   $51C8   $53CA  
;;  $5152       $515D  
;;  $51F9       $51EF   $524A   $5A45  
;;  $5213       $520D  
;;  $5215       $5211  
;;  $5222       $5207  
;;  $5226       $5220  
;;  $5228       $5224  
;;  $524C       $523C  
;;  $5267       $5255   $5264  
;;  $527B       $5294  
;;  $527E       $5281  
;;  $52A3       $5284  
;;  $52A6       $526A  
;;  $530D       $535A   $5365  
;;  $5310       $532E  
;;  $5312       $5316  
;;  $5321       $531C  
;;  $5342       $533C  
;;  $5344       $5340  
;;  $5357       $534F  
;;  $5360       $5355  
;;  $536C       $5242   $5248  
;;  $53B7       $53C1  
;;  $53C3       $53BB  
;;  $5403       $5215  
;;  $5405       $540D  
;;  $5410       $5327  
;;  $5420       $5414  
;;  $5427       $5197   $51B5   $51C3   $5430  
;;  $542B       $5433  
;;  $5435       $542C   $5445   $5448  
;;  $544A       $544B  
;;  $5455       $541A   $541E   $5425   $543B  
;;  $5483       $5479   $547D  
;;  $5485       $5481  
;;  $548C       $5494  
;;  $5496       $5491  
;;  $549F       $54A7  
;;  $54A9       $54A4  
;;  $54AC       $5499   $54A1  
;;  $54C8       $54C8  
;;  $54E0       $504B   $51CA  
;;  $5502       $5505  
;;  $5530       $5526  
;;  $5543       $553B  
;;  $5545       $552E   $5541   $554F  
;;  $5558       $5547  
;;  $5560       $551D   $5556   $555E  
;;  $556E       $54F0   $54F6   $54F9   $54FC   $5549  
;;  $5582       $570C   $637D   $6A34   $6A3D  
;;  $5585       $558C  
;;  $558A       $5587  
;;  $5590       $5321  
;;  $55AC       $55F3  
;;  $55E2       $55DC  
;;  $55E3       $55E0  
;;  $55ED       $55AE   $55B4   $55B8  
;;  $55F5       $55A0  
;;  $562F       $5627  
;;  $563C       $562D  
;;  $563E       $55A8   $55EF   $55F7   $55FD  
;;  $5648       $5592   $5596   $559A  
;;  $566D       $566A  
;;  $568A       $56DC   $56E7  
;;  $5698       $5692  
;;  $56A3       $5680  
;;  $56BE       $5684  
;;  $56D2       $5688  
;;  $56DE       $564E   $5652  
;;  $56E9       $5658   $565C   $5663   $566F   $5674   $5679   $5696   $56A1  
;;  $56E9       $56A6   $56AB   $56BC   $56C1   $56D0   $56D6   $56E2  
;;  $56F5       $5BCE   $6479  
;;  $56F8       $51E8   $51F6   $524D   $55CD   $5606   $5637  
;;  $570B       $56FF  
;;  $570F       $56F6  
;;  $571A       $5714  
;;  $571C       $5718  
;;  $5721       $572C  
;;  $572E       $5725  
;;  $5739       $5733  
;;  $573B       $5737  
;;  $5750       $5330  
;;  $5756       $5AD2   $5AD9  
;;  $5785       $5779   $577E  
;;  $57A4       $5799  
;;  $57B4       $57A6  
;;  $57D5       $57AE  
;;  $57F5       $57AA  
;;  $5803       $57F9   $57FD  
;;  $580C       $5801   $5807  
;;  $580E       $583F   $584D   $585B  
;;  $5817       $57B2  
;;  $5825       $581B   $581F  
;;  $582E       $5823   $5829  
;;  $5830       $5847   $5853   $5861  
;;  $5837       $5815  
;;  $583B       $578F  
;;  $584F       $5793  
;;  $5863       $57D3   $57F3   $5839   $598F   $5B4C   $5BDD  
;;  $588C       $587D  
;;  $58A9       $5864   $5868   $588E  
;;  $58BC       $58B9  
;;  $58CD       $58C8  
;;  $58D0       $58CB  
;;  $58D2       $58C3  
;;  $5902       $58D4   $5A06   $5A20   $5A87   $5B3B  
;;  $5948       $57C6   $57E6  
;;  $595E       $594F  
;;  $5962       $595C  
;;  $5967       $5771   $5789   $57A2   $57B7   $57BD   $57D8   $57DD   $5812  
;;  $5967       $5834   $5843   $584B   $5857   $585F   $5946   $5953   $59AF  
;;  $5967       $59C7   $59D7   $5A27   $5A51   $5AE2   $5AFE  
;;  $5982       $5763   $5B09  
;;  $5991       $5759  
;;  $59B1       $5992   $59A1  
;;  $59CA       $5768  
;;  $59DC       $5A7E  
;;  $5A08       $59E0  
;;  $5A22       $5A0A  
;;  $5A3B       $5A35  
;;  $5A3D       $5A39  
;;  $5A48       $59CC  
;;  $5A80       $5A5A  
;;  $5A83       $5A5E  
;;  $5A84       $5A81  
;;  $5ACF       $5754  
;;  $5ADB       $575E  
;;  $5B00       $5AEA  
;;  $5B0B       $5783  
;;  $5B22       $5B0F  
;;  $5B27       $5B13  
;;  $5B2B       $5B20  
;;  $5B3E       $5809   $582B  
;;  $5B47       $5B44  
;;  $5B61       $5B69  
;;  $5B82       $5B78  
;;  $5B86       $5B7C  
;;  $5B8A       $5B6F  
;;  $5B9B       $5B91  
;;  $5B9E       $5B95  
;;  $5BA0       $5B80   $5B84   $5B88   $5B99   $5B9C  
;;  $5BA3       $647D  
;;  $5BAC       $5BBF  
;;  $5BBB       $5BB3  
;;  $5BC5       $5BB7  
;;  $5BC9       $5BAA   $5BB9   $5BC3  
;;  $5BCA       $5BC7  
;;  $5BF1       $57CE  
;;  $5BF5       $5C12   $5C20  
;;  $5C01       $5BFE  
;;  $5C02       $5BFA  
;;  $5C0F       $5C08  
;;  $5C1B       $57EE   $599B  
;;  $5C22       $528D   $530A   $5632   $5BD8   $5C17  
;;  $5C2C       $5C28  
;;  $5C3F       $5C34  
;;  $5C42       $5C3D  
;;  $5C56       $5324  
;;  $5C71       $5C63  
;;  $5C9B       $5C95  
;;  $5CA6       $5C5E  
;;  $5CB6       $5CAD  
;;  $5CBB       $5CB4  
;;  $5CCD       $5CB1   $5CB8  
;;  $5CD6       $5CD0  
;;  $5CD7       $5CD4  
;;  $5CDE       $5C5B  
;;  $5CE6       $5C6B   $5C74   $5C79   $5C7F   $5C84   $5CA9   $5CCB   $5CDC  
;;  $5CE6       $5CE1  
;;  $5D02       $55B0   $5654   $567B   $5DC8   $60B2  
;;  $5D05       $5D13   $5D1D   $5D27   $5D31   $5D3B   $5D45   $5D4F   $5D59  
;;  $5D05       $5D63   $5D6D   $5D77   $5D81   $5D8B  
;;  $5D09       $52FF   $5303   $5307   $55BD   $59B6   $5B03   $5B61   $6083  
;;  $5D09       $60C8   $61BE   $61C5   $6206   $622E   $6248   $6263   $62EE  
;;  $5D0C       $5D18   $5D22   $5D2C   $5D36   $5D40   $5D4A   $5D54   $5D5E  
;;  $5D0C       $5D68   $5D72   $5D7C   $5D86  
;;  $5D10       $5665   $5BF5   $5E05   $5E1D   $5EA8   $5EE3   $5F16   $5F5B  
;;  $5D10       $5F95   $6029   $6042  
;;  $5D15       $59A7   $5C03   $5C0C   $5E09   $5EB3   $5EF2   $5F23   $5FDD  
;;  $5D15       $6002   $60CC   $61E5  
;;  $5D1A       $5E5F   $5EB7   $5EF7   $5F26   $5F48   $6046  
;;  $5D1F       $59AC   $5E6B   $5EC7   $5F04   $5F43   $5FF9   $61DC   $620E  
;;  $5D1F       $6229   $6240   $6243   $625E  
;;  $5D24       $5FA0   $6013   $608A  
;;  $5D29       $55C4   $5FBD   $5FD3   $5FDA   $601B   $6093   $60D2   $61F8  
;;  $5D29       $6267  
;;  $5D2E       $56D2   $5FC0   $601F   $606C  
;;  $5D33       $5FC6   $6006   $6025  
;;  $5D38       $6035  
;;  $5D3D       $603C   $61F4  
;;  $5D42       $5E5B   $5F71   $5F88  
;;  $5D47       $5F77   $5F8F   $5FE7   $60CF   $6201   $621E   $626A  
;;  $5D4C       $6060  
;;  $5D51       $600D   $61EA  
;;  $5D56       $6064  
;;  $5D5B       $61EF  
;;  $5D60       $5AF5   $6078  
;;  $5D65       $5AFB   $60D9   $61E0  
;;  $5D6F       $59B9   $5B06   $5B64   $5FE0   $6086   $62F1  
;;  $5D7E       $6096  
;;  $5D83       $60A6  
;;  $5D88       $565E  
;;  $5D8D       $607E  
;;  $5D9A       $6068  
;;  $5DA1       $603F   $60E1  
;;  $5DB4       $5333  
;;  $5DC6       $5DB8  
;;  $5DC7       $5DBB   $5DBF   $5DC3  
;;  $5DD1       $5DCC  
;;  $5DD8       $5DD3  
;;  $5DFC       $5DF8  
;;  $5E05       $5E00  
;;  $5E25       $5E22  
;;  $5E4B       $5E16   $5E1B   $5E27  
;;  $5E5B       $5E52  
;;  $5E68       $5E63  
;;  $5E69       $5E66  
;;  $5E75       $5E56  
;;  $5E99       $5E94   $5E9F  
;;  $5EB2       $5EAD  
;;  $5EB3       $5EB0  
;;  $5EC1       $5EBC  
;;  $5EC6       $5EBF   $5EC3  
;;  $5EDC       $5ED7  
;;  $5EF0       $5EEA  
;;  $5EF2       $5EEE  
;;  $5EF7       $5EE1  
;;  $5F03       $5EFE  
;;  $5F04       $5F01  
;;  $5F07       $5EE8   $5EF5   $5EFC  
;;  $5F22       $5F1D  
;;  $5F23       $5F20  
;;  $5F3F       $5F33   $5F53  
;;  $5F42       $5F2F   $5F3D   $5F59  
;;  $5F43       $5F40  
;;  $5F48       $5F1B  
;;  $5F57       $5F4F  
;;  $5F5B       $5F2B   $5F46   $5F4D   $5F55  
;;  $5F6D       $5F60  
;;  $5F95       $5F8C  
;;  $5FCC       $5FA9  
;;  $5FD0       $5FB2  
;;  $5FD2       $5FCE  
;;  $5FD9       $5F9E   $5FBB  
;;  $5FED       $5F9A   $5FF5  
;;  $6012       $5DFC   $5E4E   $5E90   $5ED3   $5F10  
;;  $601B       $6018  
;;  $601F       $5E10   $5E72   $5ECE   $5F0B   $5F7D  
;;  $6028       $5E79   $5F7B  
;;  $6035       $6032  
;;  $6042       $5E02   $5FC9   $5FD6   $6010   $6039  
;;  $6075       $6071  
;;  $6082       $602E   $6051   $6055   $6059   $605D   $608E   $6091  
;;  $6089       $5E58   $5E96   $5ED9   $5F14   $5F92   $5FEA  
;;  $608A       $5DD5  
;;  $60AA       $5DCE   $621B   $6227  
;;  $60B2       $60BE  
;;  $60C0       $60BB  
;;  $60E6       $60B7  
;;  $60E7       $60AE   $60C4  
;;  $60EC       $60F2  
;;  $60F4       $60ED  
;;  $60F8       $60FD  
;;  $60FF       $60F9  
;;  $6107       $6103  
;;  $6114       $611B  
;;  $611D       $6118  
;;  $619A       $619A  
;;  $61A2       $61D6   $6223  
;;  $61B2       $61A7   $61AB   $61AF  
;;  $61C5       $61B6   $61BA  
;;  $61C8       $61D0   $61D4   $61DA  
;;  $61D6       $61C3  
;;  $61E0       $6215   $6235   $624F   $6271  
;;  $61E8       $60E4  
;;  $6251       $6258   $625C  
;;  $62DB       $5336  
;;  $62EE       $62F7  
;;  $633D       $62DF  
;;  $6348       $634C  
;;  $6365       $633F  
;;  $636B       $6367  
;;  $6384       $636D  
;;  $6391       $6386  
;;  $639C       $63A0  
;;  $63BD       $6393  
;;  $63D6       $63D1  
;;  $63DD       $63CF  
;;  $63E6       $63E1  
;;  $63EB       $63E4  
;;  $63ED       $63D4   $63DB  
;;  $63FB       $63DF  
;;  $6404       $6440  
;;  $6418       $63BF  
;;  $641E       $6447  
;;  $643E       $641A  
;;  $6449       $6444  
;;  $6452       $6458  
;;  $6471       $646B  
;;  $6480       $6363   $6369   $6382   $638B   $63BB   $6416   $643C  
;;  $6485       $6372   $638F   $63F9   $6428   $653B  
;;  $649F       $6496  
;;  $64A4       $649B  
;;  $64A9       $649D   $64A2  
;;  $64C6       $64BD  
;;  $64E7       $64DB  
;;  $64FC       $64F4  
;;  $650E       $62E4   $62EA   $633B   $644B   $646F   $648C   $64E5   $64E9  
;;  $6520       $6395   $641E  
;;  $6524       $6341   $644D  
;;  $6527       $6522  
;;  $652B       $6360   $63AD   $6462  
;;  $652F       $6529  
;;  $6539       $6535  
;;  $653E       $525E   $635D   $645F  
;;  $6544       $5261   $5619   $6315   $63AA   $6433  
;;  $6548       $6542  
;;  $654B       $5BAC   $5E99   $5EDC   $5F36   $5FED   $610F   $61C8   $61FC  
;;  $654B       $6209   $6237   $6251   $6374  
;;  $6556       $5047   $525B   $52CF   $5889   $589A   $5A13   $5A7B   $5B19  
;;  $6556       $5B2B   $5DB0   $5E33   $6304   $630B   $6548  
;;  $6557       $655A  
;;  $6560       $5AEE   $5AF8  
;;  $656A       $5030   $514D   $5200  
;;  $658E       $50B1   $5272   $52AC   $5362   $5372   $55D6   $560F   $569E  
;;  $658E       $56B9   $5964   $59C4   $5A68   $5B54   $5CA3   $5E47   $5F69  
;;  $658E       $6338   $6401  
;;  $659C       $6592   $6597  
;;  $65B0       $65B4  
;;  $65B6       $659A  
;;  $65B7       $5565  
;;  $65C7       $65C0  
;;  $65CA       $65CE  
;;  $65D0       $65BB   $65C5  
;;  $65D1       $65B0   $65CA  
;;  $65ED       $65D5  
;;  $65EF       $65E0  
;;  $6618       $6643   $6659   $6663   $667B   $668D   $66A9   $66B3   $66DB  
;;  $6618       $66E3   $66F1   $66FC  
;;  $661D       $65F4  
;;  $663E       $6630  
;;  $6645       $6620  
;;  $6648       $6624  
;;  $664C       $6628  
;;  $664E       $6646   $664A  
;;  $665B       $65F8  
;;  $6660       $6674  
;;  $6665       $65FC  
;;  $666A       $6600  
;;  $666E       $6668  
;;  $6676       $6604  
;;  $667D       $6610  
;;  $6688       $6616  
;;  $668F       $65DB  
;;  $66AB       $6695  
;;  $66B0       $66C4  
;;  $66B5       $6699  
;;  $66BA       $669D  
;;  $66BE       $66B8  
;;  $66C6       $66A1  
;;  $66CB       $66D1  
;;  $66D3       $66CC  
;;  $66DD       $66A7  
;;  $66E5       $6608  
;;  $66F3       $660C  
;;  $66FE       $66AB  
;;  $6704       $665B  
;;  $6708       $6670   $66C0  
;;  $6710       $6660   $66B0  
;;  $6719       $5250   $5BD5  
;;  $671D       $6720  
;;  $672C       $674A  
;;  $6730       $6734  
;;  $6743       $673D  
;;  $6745       $673B   $6741  
;;  $6756       $677C  
;;  $675F       $6759  
;;  $6760       $675D  
;;  $677B       $6771  
;;  $6791       $678D  
;;  $6813       $6811  
;;  $6863       $528A   $52AF   $5C14   $67BD  
;;  $6871       $686C  
;;  $6879       $6876  
;;  $6883       $68BD   $68C8   $68CD  
;;  $6888       $6899  
;;  $68AD       $68A5  
;;  $68BF       $68B2  
;;  $68CA       $68B7   $68BB   $68C2   $68C6  
;;  $68CF       $68A0  
;;  $6917       $6907  
;;  $691C       $690B   $6913  
;;  $6921       $690F  
;;  $6924       $68F9   $6901   $6915   $691A  
;;  $6933       $6928  
;;  $6935       $6931  
;;  $6943       $692E  
;;  $694A       $6951  
;;  $696B       $6967  
;;  $696F       $6963  
;;  $6973       $695F  
;;  $6977       $695B  
;;  $697F       $6969  
;;  $6980       $6917   $691D  
;;  $6995       $6982  
;;  $699C       $6986  
;;  $69A3       $698A  
;;  $69A8       $698E  
;;  $69AD       $6992  
;;  $69B2       $6921  
;;  $69C7       $69B4  
;;  $69CB       $6999  
;;  $69DB       $69B8  
;;  $69DF       $69A0  
;;  $69F7       $69BC  
;;  $69F9       $69A5  
;;  $69FF       $69C0  
;;  $6A01       $69AA  
;;  $6A07       $69C4  
;;  $6A09       $69AF  
;;  $6A0D       $69FD   $6A05   $6A1E  
;;  $6A0F       $6A18  
;;  $6A21       $5907   $5CC0   $604A   $63B4  
;;  $6A2D       $6A28  
;;  $6A4D       $6A47  
;;  $6A4E       $6A4B  
;;  $6A53       $6A50  
;;  $6A7B       $5B71  
;;  $6A82       $5B8A  
;;  $6A87       $6A80  
;;  $6A89       $6AB0  
;;  $6A8D       $6AA3  
;;  $6A95       $6A9A  
;;  $6AA8       $6AAC  
;;  $6AC7       $6AC7  
;;  $6C8F       $6C8D  
;; ======================================================================== ;;
