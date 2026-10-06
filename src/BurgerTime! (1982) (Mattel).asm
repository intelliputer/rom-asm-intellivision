
        ORG     $5000
.HEADER:
        BIDECLE $5B21           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5100           ; 5004  Ptr: Start of game
        BIDECLE $6011           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5AF7           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5040           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0038,  $0050,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $00E1,  $0063,  $0002,  $0000; 5020  Timer dispatch/interval
        DECLE   $00C6,  $0066,  $000E,  $0000; 5024  Timer dispatch/interval
        DECLE   $00DF,  $0053,  $0082,  $0080; 5028  Timer dispatch/interval
        DECLE   $00FC,  $0052,  $0028,  $0080; 502C  Timer dispatch/interval
        DECLE   $00BF,  $0066,  $00C8,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

        DECLE   $0000,  $0000                   ; 5036   0000 0000
L_5038:
        PSHR    R5                              ; 5038   0275

        JSR     R5,     L_6118                  ; 5039   0004 0160 0118
        JSR     R5,     L_6717                  ; 503C   0004 0164 0317

        PULR    R7                              ; 503F   02B7

.TITLE:
        DECLE   $0052                           ; 5040  Cartridge year
        STRING  "BurgerTime!"                   ; 5041  Title string
        DECLE   $0000                           ; 504C  

.TITLECODE:
        MVII    #$0200, R4                      ; 504D   02BC 0200
        MVII    #$00F0, R0                      ; 504F   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5051   0004 0114 0338

        EIS                                     ; 5054   0002
        MVII    #$0000, R0                      ; 5055   02B8 0000
        MVO     R0,     .STIC.BORD              ; 5057   0240 002C
        MVO     R0,     .STIC.CS.0              ; 5059   0240 0028
        MVII    #$0090, R0                      ; 505B   02B8 0090
        MVO     R0,     G_0102                  ; 505D   0240 0102
        MVII    #$0003, R3                      ; 505F   02BB 0003
        MVII    #$0201, R4                      ; 5061   02BC 0201

        JSR     R5,     X_PRINT_R5              ; 5063   0004 0118 007B
        STRING  "Mattel Electronics"            ; 5066  
        DECLE   $0000                           ; 5078   0000

        MVII    #$0003, R3                      ; 5079   02BB 0003
        MVII    #$02E0, R4                      ; 507B   02BC 02E0

        JSR     R5,     X_PRINT_R5              ; 507D   0004 0118 007B
        STRING  "1982 Data East"                ; 5080  
        DECLE   $0000                           ; 508E   0000

        MVII    #$0003, R3                      ; 508F   02BB 0003
        MVII    #$02CD, R4                      ; 5091   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; 5093   0004 0118 007B
        STRING  "1982 Mattel"                   ; 5096  
        DECLE   $0000                           ; 50A1   0000

        SDBD                                    ; 50A2   0001
        MVII    #$0973, R0                      ; 50A3   02B8 0073 0009
        MVO     R0,     .BTAB.CC                ; 50A6   0240 02CC
        MVO     R0,     .BTAB.DF                ; 50A8   0240 02DF
        MVII    #$0003, R3                      ; 50AA   02BB 0003
        MVII    #$0219, R4                      ; 50AC   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 50AE   0004 0118 007B
        STRING  "presents"                      ; 50B1  
        DECLE   $0000                           ; 50B9   0000

        MVII    #$0007, R0                      ; 50BA   02B8 0007
        MVO     R0,     G_016F                  ; 50BC   0240 016F

        JSR     R5,     L_5363                  ; 50BE   0004 0150 0363

        MVII    #$0030, R0                      ; 50C1   02B8 0030
        SWAP    R0,     1                       ; 50C3   0040
        MVO     R0,     G_031F                  ; 50C4   0240 031F
        MVO     R0,     G_0327                  ; 50C6   0240 0327
        MVII    #$0028, R0                      ; 50C8   02B8 0028
        SWAP    R0,     1                       ; 50CA   0040
        MVO     R0,     G_0320                  ; 50CB   0240 0320
        MVO     R0,     G_0328                  ; 50CD   0240 0328
        MVII    #$001F, R0                      ; 50CF   02B8 001F
        MVO     R0,     G_0176                  ; 50D1   0240 0176
        MVII    #$0004, R0                      ; 50D3   02B8 0004
        MVO     R0,     G_0103                  ; 50D5   0240 0103

        JSR     R5,     L_55EF                  ; 50D7   0004 0154 01EF

        MVII    #$0006, R3                      ; 50DA   02BB 0006
        MVII    #$0268, R4                      ; 50DC   02BC 0268

        JSR     R5,     X_PRINT_R5              ; 50DE   0004 0118 007B
        STRING  "BurgerTime!"                   ; 50E1  
        DECLE   $0000                           ; 50EC   0000

        SDBD                                    ; 50ED   0001
        MVII    #$0952, R0                      ; 50EE   02B8 0052 0009
        MVO     R0,     .BTAB.A4                ; 50F1   0240 02A4
        SDBD                                    ; 50F3   0001
        MVII    #$095B, R0                      ; 50F4   02B8 005B 0009
        MVO     R0,     .BTAB.90                ; 50F7   0240 0290
        SDBD                                    ; 50F9   0001
        MVII    #$0942, R0                      ; 50FA   02B8 0042 0009
        MVO     R0,     .BTAB.3D                ; 50FD   0240 023D
        PULR    R7                              ; 50FF   02B7

.START:
        PSHR    R5                              ; 5100   0275

        JSR     R5,     L_529A                  ; 5101   0004 0150 029A

        MVII    #$0008, R0                      ; 5104   02B8 0008
        MVO     R0,     G_01E2                  ; 5106   0240 01E2
        SDBD                                    ; 5108   0001
        MVII    #$555E, R0                      ; 5109   02B8 005E 0055
        MVO     R0,     G_031E                  ; 510C   0240 031E
        SDBD                                    ; 510E   0001
        MVII    #$5565, R0                      ; 510F   02B8 0065 0055
        MVO     R0,     G_0326                  ; 5112   0240 0326
        MVII    #$0090, R0                      ; 5114   02B8 0090
        MVO     R0,     G_0322                  ; 5116   0240 0322
        MVO     R0,     G_032A                  ; 5118   0240 032A
        SDBD                                    ; 511A   0001
        MVII    #$5195, R0                      ; 511B   02B8 0095 0051
        MVO     R0,     G_035D                  ; 511E   0240 035D
        PULR    R7                              ; 5120   02B7

        CMPI    #$0003, R0                      ; 5121   0378 0003
        BLE     L_5126                          ; 5123   0206 0001

        CLRR    R0                              ; 5125   01C0
L_5126:
        ADDI    #$0003, R0                      ; 5126   02F8 0003
        MVO     R0,     G_0103                  ; 5128   0240 0103
        MVI     .ISRVEC.0,R0                    ; 512A   0280 0100
        MVI     .ISRVEC.1,R1                    ; 512C   0281 0101
        MVO     R0,     G_01EB                  ; 512E   0240 01EB
        MVO     R1,     G_01EC                  ; 5130   0241 01EC
        SDBD                                    ; 5132   0001
        MVII    #$6F98, R0                      ; 5133   02B8 0098 006F
        MOVR    R0,     R1                      ; 5136   0081
        SWAP    R1,     1                       ; 5137   0041
        MVO     R0,     .ISRVEC.0               ; 5138   0240 0100
        MVO     R1,     .ISRVEC.1               ; 513A   0241 0101
        PSHR    R5                              ; 513C   0275
        MVII    #$0200, R4                      ; 513D   02BC 0200
        MVII    #$00F0, R0                      ; 513F   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5141   0004 0114 0338

        MVII    #$0162, R4                      ; 5144   02BC 0162
        CLRR    R1                              ; 5146   01C9
        MVO@    R1,     R4                      ; 5147   0261
        MVO@    R1,     R4                      ; 5148   0261
        MVO@    R1,     R4                      ; 5149   0261
        MVO@    R1,     R4                      ; 514A   0261
        INCR    R4                              ; 514B   000C
        INCR    R4                              ; 514C   000C
        MVO@    R1,     R4                      ; 514D   0261
        MVO@    R1,     R4                      ; 514E   0261
        INCR    R4                              ; 514F   000C
        MVO@    R1,     R4                      ; 5150   0261
        MVO@    R1,     R4                      ; 5151   0261
        INCR    R4                              ; 5152   000C
        MVII    #$0008, R0                      ; 5153   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5155   0004 0114 0338
        JSR     R5,     .EXEC.7B3               ; 5158   0004 0114 03B3

        MVII    #$0003, R3                      ; 515B   02BB 0003
        MVII    #$022C, R4                      ; 515D   02BC 022C

        JSR     R5,     X_PRINT_R5              ; 515F   0004 0118 007B
        STRING  "Select 1 or 2"                 ; 5162  
        DECLE   $0000                           ; 516F   0000

        MVII    #$0003, R3                      ; 5170   02BB 0003
        MVII    #$026A, R4                      ; 5172   02BC 026A

        JSR     R5,     X_PRINT_R5              ; 5174   0004 0118 007B
        STRING  "Players:"                      ; 5177  
        DECLE   $0000                           ; 517F   0000

        SDBD                                    ; 5180   0001
        MVII    #$518B, R0                      ; 5181   02B8 008B 0051
        MVO     R0,     G_035D                  ; 5184   0240 035D
        MVII    #$003F, R0                      ; 5186   02B8 003F
        MVO     R0,     G_0176                  ; 5188   0240 0176
        PULR    R7                              ; 518A   02B7

        DECLE   $0000,  $0000,  $009F,  $0051   ; 518B   0000 0000 009F 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 518F   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5193   0000 0000

        NEGR    R5                              ; 5195   0025
        RLC     R1,     1                       ; 5196   0051
        NEGR    R1                              ; 5197   0021
        RLC     R1,     1                       ; 5198   0051
        NEGR    R5                              ; 5199   0025
        RLC     R1,     1                       ; 519A   0051
        NEGR    R5                              ; 519B   0025
        RLC     R1,     1                       ; 519C   0051
        NEGR    R5                              ; 519D   0025
        RLC     R1,     1                       ; 519E   0051
        PSHR    R5                              ; 519F   0275
        CMPI    #$0003, R0                      ; 51A0   0378 0003
        BGE     L_51B3                          ; 51A2   020D 000F

        TSTR    R0                              ; 51A4   0080
        BEQ     L_51B3                          ; 51A5   0204 000C

        MVO     R0,     G_015E                  ; 51A7   0240 015E
        MVII    #$02A9, R4                      ; 51A9   02BC 02A9
        MVII    #$0006, R3                      ; 51AB   02BB 0006
        MVII    #$0001, R1                      ; 51AD   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 51AF   0004 0118 00C5

L_51B2:
        PULR    R7                              ; 51B2   02B7

L_51B3:
        CMPI    #$000B, R0                      ; 51B3   0378 000B
        BEQ     L_51BD                          ; 51B5   0204 0006

        CLRR    R0                              ; 51B7   01C0
        MVO     R0,     G_015E                  ; 51B8   0240 015E
        MVO     R0,     .BTAB.A9                ; 51BA   0240 02A9
        PULR    R7                              ; 51BC   02B7

L_51BD:
        MVI     G_015E, R0                      ; 51BD   0280 015E
        TSTR    R0                              ; 51BF   0080
        BEQ     L_51B2                          ; 51C0   0224 000F

        DECR    R0                              ; 51C2   0010
        MVO     R0,     G_015E                  ; 51C3   0240 015E
        TSTR    R0                              ; 51C5   0080
        BNEQ    L_51CA                          ; 51C6   020C 0002

        MVO     R1,     G_01EF                  ; 51C8   0241 01EF

L_51CA:
        JSR     R5,     L_6CDC                  ; 51CA   0004 016C 00DC

        MVII    #$0004, R0                      ; 51CD   02B8 0004
        MVO     R0,     G_017B                  ; 51CF   0240 017B
        MVO     R0,     G_017C                  ; 51D1   0240 017C
        INCR    R0                              ; 51D3   0008
        MVO     R0,     G_017E                  ; 51D4   0240 017E
        MVO     R0,     G_017D                  ; 51D6   0240 017D
        CLRR    R0                              ; 51D8   01C0
        MVO     R0,     G_015D                  ; 51D9   0240 015D
        SDBD                                    ; 51DB   0001
        MVII    #$1906, R0                      ; 51DC   02B8 0006 0019
        MVO     R0,     G_035D                  ; 51DF   0240 035D
        MVII    #$0003, R0                      ; 51E1   02B8 0003
        MVO     R0,     G_0176                  ; 51E3   0240 0176
        MVO     R0,     G_01E5                  ; 51E5   0240 01E5

        JSR     R5,     L_5682                  ; 51E7   0004 0154 0282

        MVII    #$0001, R0                      ; 51EA   02B8 0001
        MVO     R0,     G_015D                  ; 51EC   0240 015D

        JSR     R5,     L_5682                  ; 51EE   0004 0154 0282

        B       L_5202                          ; 51F1   0200 000F

        PSHR    R5                              ; 51F3   0275
        MVII    #$017D, R1                      ; 51F4   02B9 017D
        ADD     G_015D, R1                      ; 51F6   02C1 015D
        MVI@    R1,     R0                      ; 51F8   0288
        DECR    R0                              ; 51F9   0010
        MVO@    R0,     R1                      ; 51FA   0248
        BEQ     L_52DE                          ; 51FB   0204 00E1

        MVI     G_015E, R0                      ; 51FD   0280 015E
        TSTR    R0                              ; 51FF   0080
        BEQ     L_520F                          ; 5200   0204 000D

L_5202:
        MVI     G_015D, R1                      ; 5202   0281 015D
        XORI    #$0001, R1                      ; 5204   03F9 0001
        MVII    #$017D, R2                      ; 5206   02BA 017D
        ADDR    R1,     R2                      ; 5208   00CA
        MVI@    R2,     R3                      ; 5209   0293
        TSTR    R3                              ; 520A   009B
        BEQ     L_520F                          ; 520B   0204 0002

L_520D:
        MVO     R1,     G_015D                  ; 520D   0241 015D
L_520F:
        MVII    #$0200, R4                      ; 520F   02BC 0200
        MVII    #$00F0, R0                      ; 5211   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5213   0004 0114 0338

        MVII    #$0003, R3                      ; 5216   02BB 0003
        MVII    #$027F, R4                      ; 5218   02BC 027F

        JSR     R5,     X_PRINT_R5              ; 521A   0004 0118 007B
        STRING  "Start"                         ; 521D  
        DECLE   $0000                           ; 5222   0000

        MVII    #$0007, R0                      ; 5223   02B8 0007
        MVO     R0,     G_0176                  ; 5225   0240 0176
L_5227:
        MVII    #$0003, R3                      ; 5227   02BB 0003
        MVII    #$0256, R4                      ; 5229   02BC 0256

        JSR     R5,     X_PRINT_R5              ; 522B   0004 0118 007B
        STRING  "Player"                        ; 522E  
        DECLE   $0000                           ; 5234   0000

        MVI     G_015D, R0                      ; 5235   0280 015D
        INCR    R0                              ; 5237   0008
        MVII    #$0001, R1                      ; 5238   02B9 0001
        MVII    #$0003, R3                      ; 523A   02BB 0003
        MVII    #$025D, R4                      ; 523C   02BC 025D

        JSR     R5,     X_PRNUM_RGT             ; 523E   0004 0118 00C5

        MVII    #$0003, R3                      ; 5241   02BB 0003
        MVII    #$02E8, R4                      ; 5243   02BC 02E8

        JSR     R5,     X_PRINT_R5              ; 5245   0004 0118 007B
        STRING  "Level"                         ; 5248  
        DECLE   $0000                           ; 524D   0000

        MVII    #$0171, R4                      ; 524E   02BC 0171
        ADD     G_015D, R4                      ; 5250   02C4 015D
        MVI@    R4,     R0                      ; 5252   02A0
        MVII    #$0007, R1                      ; 5253   02B9 0007

        JSR     R5,     X_MPY                   ; 5255   0004 011C 01DC

        MOVR    R2,     R0                      ; 5258   0090
        MVII    #$016F, R4                      ; 5259   02BC 016F
        ADD     G_015D, R4                      ; 525B   02C4 015D
        ADD@    R4,     R0                      ; 525D   02E0
        INCR    R0                              ; 525E   0008
        MVII    #$0002, R1                      ; 525F   02B9 0002
        MVII    #$0003, R3                      ; 5261   02BB 0003
        MVII    #$02EE, R4                      ; 5263   02BC 02EE

        JSR     R5,     X_PRNUM_LFT             ; 5265   0004 0118 009E
        JSR     R5,     L_5363                  ; 5268   0004 0150 0363
        JSR     R5,     L_529A                  ; 526B   0004 0150 029A

        SDBD                                    ; 526E   0001
        MVII    #$502C, R1                      ; 526F   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; 5272   0004 0118 0044

        PULR    R7                              ; 5275   02B7

        RLC     R0,     2                       ; 5276   0054
        RLC     R0,     1                       ; 5277   0050
        SLR     R0,     2                       ; 5278   0064
        RLC     R0,     1                       ; 5279   0050
        SLLC    R0,     2                       ; 527A   005C
        RLC     R0,     1                       ; 527B   0050
        SAR     R0,     2                       ; 527C   006C
        RLC     R0,     1                       ; 527D   0050
        RRC     R0,     2                       ; 527E   0074
        RLC     R0,     1                       ; 527F   0050
        RRC     R0,     2                       ; 5280   0074
        RLC     R0,     1                       ; 5281   0050
        SLL     R2,     1                       ; 5282   004A
        RLC     R0,     1                       ; 5283   0050
        SLLC    R2,     1                       ; 5284   005A
        RLC     R0,     1                       ; 5285   0050
        RLC     R2,     1                       ; 5286   0052
        RLC     R0,     1                       ; 5287   0050
        SLR     R2,     1                       ; 5288   0062
        RLC     R0,     1                       ; 5289   0050
        SAR     R2,     1                       ; 528A   006A
        RLC     R0,     1                       ; 528B   0050
        SAR     R2,     1                       ; 528C   006A
        RLC     R0,     1                       ; 528D   0050
        COMR    R0                              ; 528E   0018
        SWAP    R0,     1                       ; 528F   0040
        MOVR    R2,     R0                      ; 5290   0090
        RSWD    R0                              ; 5291   0038
        SLLC    R0,     1                       ; 5292   0058
        SLL     R0,     1                       ; 5293   0048
        SAR     R0,     1                       ; 5294   0068
        DECR    R0                              ; 5295   0010
        RRC     R0,     1                       ; 5296   0070
        DECR    R0                              ; 5297   0010
        RRC     R0,     1                       ; 5298   0070
        DECR    R0                              ; 5299   0010
L_529A:
        PSHR    R5                              ; 529A   0275
        MVII    #$0010, R0                      ; 529B   02B8 0010
        MVII    #$01D9, R4                      ; 529D   02BC 01D9
L_529F:
        MVI@    R4,     R1                      ; 529F   02A1
        CMPI    #$007F, R1                      ; 52A0   0379 007F
        BEQ     L_52A6                          ; 52A2   0204 0002

        DECR    R4                              ; 52A4   0014
        MVO@    R0,     R4                      ; 52A5   0260
L_52A6:
        CMPI    #$01DF, R4                      ; 52A6   037C 01DF
        BLT     L_529F                          ; 52A8   0225 000A

        MVII    #$0004, R1                      ; 52AA   02B9 0004
        MVO@    R1,     R4                      ; 52AC   0261
        MVO@    R1,     R4                      ; 52AD   0261
        NOP                                     ; 52AE   0034
        MVO@    R1,     R4                      ; 52AF   0261
        MVO@    R1,     R4                      ; 52B0   0261
        MVO@    R1,     R4                      ; 52B1   0261
        MVO@    R1,     R4                      ; 52B2   0261
        SDBD                                    ; 52B3   0001
        MVII    #$5276, R5                      ; 52B4   02BD 0076 0052
        MVI     G_0176, R4                      ; 52B7   0284 0176
        CMPI    #$0009, R4                      ; 52B9   037C 0009
        BLT     L_52C5                          ; 52BB   0205 0008

        ADDI    #$000C, R5                      ; 52BD   02FD 000C
        CMPI    #$001F, R4                      ; 52BF   037C 001F
        BNEQ    L_52C5                          ; 52C1   020C 0002

        ADDI    #$000C, R5                      ; 52C3   02FD 000C
L_52C5:
        MVII    #$032F, R4                      ; 52C5   02BC 032F
        MVI     G_01D9, R1                      ; 52C7   0281 01D9
        CMPI    #$007F, R1                      ; 52C9   0379 007F
        BNEQ    L_52D1                          ; 52CB   020C 0004

        ADDI    #$0008, R4                      ; 52CD   02FC 0008
        ADDI    #$0002, R5                      ; 52CF   02FD 0002
L_52D1:
        MVI@    R5,     R0                      ; 52D1   02A8
        SWAP    R0,     1                       ; 52D2   0040
        MVO@    R0,     R4                      ; 52D3   0260
        MVI@    R5,     R0                      ; 52D4   02A8
        SWAP    R0,     1                       ; 52D5   0040
        MVO@    R0,     R4                      ; 52D6   0260
        ADDI    #$0006, R4                      ; 52D7   02FC 0006
        CMPI    #$0358, R4                      ; 52D9   037C 0358
        BLT     L_52D1                          ; 52DB   0225 000B
        PULR    R7                              ; 52DD   02B7

L_52DE:
        MVII    #$0009, R0                      ; 52DE   02B8 0009
        MVO     R0,     G_0176                  ; 52E0   0240 0176
        MVII    #$0200, R4                      ; 52E2   02BC 0200
        MVII    #$00F0, R0                      ; 52E4   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 52E6   0004 0114 0338

        MVII    #$0005, R3                      ; 52E9   02BB 0005
        MVII    #$027D, R4                      ; 52EB   02BC 027D

        JSR     R5,     X_PRINT_R5              ; 52ED   0004 0118 007B
        STRING  "Game Over"                     ; 52F0  
        DECLE   $0000                           ; 52F9   0000

        B       L_5227                          ; 52FA   0220 00D4

L_52FC:
        PSHR    R5                              ; 52FC   0275
        MVI     G_0176, R0                      ; 52FD   0280 0176
        CMPI    #$000F, R0                      ; 52FF   0378 000F
        BNEQ    L_5330                          ; 5301   020C 002D

        MVI     G_015E, R0                      ; 5303   0280 015E
        TSTR    R0                              ; 5305   0080
        BEQ     L_5330                          ; 5306   0204 0028

        MVI     G_015D, R1                      ; 5308   0281 015D
        XORI    #$0001, R1                      ; 530A   03F9 0001
        MVII    #$017D, R2                      ; 530C   02BA 017D
        ADDR    R1,     R2                      ; 530E   00CA
        MVI@    R2,     R3                      ; 530F   0293
        TSTR    R3                              ; 5310   009B
        BEQ     L_5330                          ; 5311   0204 001D

        MVII    #$0003, R0                      ; 5313   02B8 0003
        MVO     R0,     G_0176                  ; 5315   0240 0176
        B       L_520D                          ; 5317   0220 010B

        PSHR    R5                              ; 5319   0275

        JSR     R5,     L_6CDC                  ; 531A   0004 016C 00DC

        MVII    #$016F, R1                      ; 531D   02B9 016F
        ADD     G_015D, R1                      ; 531F   02C1 015D
        MVI@    R1,     R0                      ; 5321   0288
        INCR    R0                              ; 5322   0008
        CMPI    #$0007, R0                      ; 5323   0378 0007
        BLT     L_532F                          ; 5325   0205 0008

        MVII    #$0171, R2                      ; 5327   02BA 0171
        ADD     G_015D, R2                      ; 5329   02C2 015D
        MVI@    R2,     R3                      ; 532B   0293
        INCR    R3                              ; 532C   000B
        MVO@    R3,     R2                      ; 532D   0253
        CLRR    R0                              ; 532E   01C0
L_532F:
        MVO@    R0,     R1                      ; 532F   0248
L_5330:
        CLRR    R0                              ; 5330   01C0
        MVO     R0,     G_015F                  ; 5331   0240 015F
        MVO     R0,     G_0160                  ; 5333   0240 0160
        MVII    #$01D9, R4                      ; 5335   02BC 01D9
L_5337:
        MVO@    R0,     R4                      ; 5337   0260
        CMPI    #$01E5, R4                      ; 5338   037C 01E5
        BNEQ    L_5337                          ; 533A   022C 0004

        JSR     R5,     L_55EF                  ; 533C   0004 0154 01EF
        JSR     R5,     L_5363                  ; 533F   0004 0150 0363

        SDBD                                    ; 5342   0001
        MVII    #$53CB, R0                      ; 5343   02B8 00CB 0053
        MVI     G_0176, R1                      ; 5346   0281 0176
        CMPI    #$000F, R1                      ; 5348   0379 000F
        BNEQ    L_5350                          ; 534A   020C 0004

        SDBD                                    ; 534C   0001
        MVII    #$53D5, R0                      ; 534D   02B8 00D5 0053
L_5350:
        MVO     R0,     G_035D                  ; 5350   0240 035D
        MVII    #$0005, R0                      ; 5352   02B8 0005
        MVO     R0,     G_01E5                  ; 5354   0240 01E5
        CLRR    R0                              ; 5356   01C0
        MVI     G_0176, R1                      ; 5357   0281 0176
        CMPI    #$000F, R1                      ; 5359   0379 000F
        BEQ     L_5362                          ; 535B   0204 0005

        MVO     R0,     G_0176                  ; 535D   0240 0176

        JSR     R5,     L_6DEB                  ; 535F   0004 016C 01EB

L_5362:
        PULR    R7                              ; 5362   02B7

L_5363:
        PSHR    R5                              ; 5363   0275
        MVII    #$031D, R2                      ; 5364   02BA 031D
        SDBD                                    ; 5366   0001
        MVII    #$54DB, R1                      ; 5367   02B9 00DB 0054
        MVII    #$0002, R0                      ; 536A   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 536C   0004 0114 02B4

        MVII    #$0004, R3                      ; 536F   02BB 0004
        MVII    #$032D, R2                      ; 5371   02BA 032D
L_5373:
        SDBD                                    ; 5373   0001
        MVII    #$54FB, R1                      ; 5374   02B9 00FB 0054

        JSR     R5,     X_INIT_MOB              ; 5377   0004 0114 02B2

        ADDI    #$0008, R2                      ; 537A   02FA 0008
        DECR    R3                              ; 537C   0013
        BNEQ    L_5373                          ; 537D   022C 000B

        MVII    #$016F, R4                      ; 537F   02BC 016F
        ADD     G_015D, R4                      ; 5381   02C4 015D
        MVI@    R4,     R4                      ; 5383   02A4
        CLRR    R0                              ; 5384   01C0
        MVO     R0,     G_0173                  ; 5385   0240 0173
        CMPI    #$0006, R4                      ; 5387   037C 0006
        BNEQ    L_538D                          ; 5389   020C 0002

        MVII    #$0002, R0                      ; 538B   02B8 0002
L_538D:
        MVO     R0,     G_017A                  ; 538D   0240 017A
        CMPI    #$0004, R4                      ; 538F   037C 0004
        BGE     L_539B                          ; 5391   020D 0008

        MVII    #$0171, R4                      ; 5393   02BC 0171
        ADD     G_015D, R4                      ; 5395   02C4 015D
        MVI@    R4,     R4                      ; 5397   02A4
        TSTR    R4                              ; 5398   00A4
        BEQ     L_53A9                          ; 5399   0204 000E

L_539B:
        SDBD                                    ; 539B   0001
        MVII    #$550B, R1                      ; 539C   02B9 000B 0055
        MVII    #$033D, R2                      ; 539F   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 53A1   0004 0114 02B2

        ADDI    #$0008, R2                      ; 53A4   02FA 0008

        JSR     R5,     X_INIT_MOB              ; 53A6   0004 0114 02B2

L_53A9:
        MVII    #$034D, R2                      ; 53A9   02BA 034D
        SDBD                                    ; 53AB   0001
        MVII    #$551B, R1                      ; 53AC   02B9 001B 0055
        MVII    #$0002, R0                      ; 53AF   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; 53B1   0004 0114 02B4

        CLRR    R1                              ; 53B4   01C9
        MVII    #$016F, R4                      ; 53B5   02BC 016F
        ADD     G_015D, R4                      ; 53B7   02C4 015D
        MVI@    R4,     R0                      ; 53B9   02A0
        CMPI    #$0002, R0                      ; 53BA   0378 0002
        BGE     L_53C8                          ; 53BC   020D 000A

        MVII    #$0171, R4                      ; 53BE   02BC 0171
        ADD     G_015D, R4                      ; 53C0   02C4 015D
        MVI@    R4,     R0                      ; 53C2   02A0
        TSTR    R0                              ; 53C3   0080
        BNEQ    L_53C8                          ; 53C4   020C 0002

        MVII    #$007F, R1                      ; 53C6   02B9 007F
L_53C8:
        MVO     R1,     G_01D9                  ; 53C8   0241 01D9
        PULR    R7                              ; 53CA   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 53CB   0000 0000 0000 0000
        DECLE   $0015,  $0063,  $0015,  $0063   ; 53CF   0015 0063 0015 0063
        DECLE   $0015,  $0063,  $003C,  $0051   ; 53D3   0015 0063 003C 0051
        DECLE   $003C,  $0051,  $0000,  $0000   ; 53D7   003C 0051 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53DB   0000 0000 0000 0000
L_53DF:
        PSHR    R5                              ; 53DF   0275
        MVI     G_0176, R0                      ; 53E0   0280 0176
        CMPI    #$0004, R0                      ; 53E2   0378 0004
        BNEQ    L_5406                          ; 53E4   020C 0020

        CLRR    R0                              ; 53E6   01C0
        MVO     R0,     G_0176                  ; 53E7   0240 0176
        MVII    #$016F, R1                      ; 53E9   02B9 016F
        ADD     G_015D, R1                      ; 53EB   02C1 015D
        MVI@    R1,     R2                      ; 53ED   028A
        SDBD                                    ; 53EE   0001
        MVII    #$66B8, R1                      ; 53EF   02B9 00B8 0066
        ADDR    R2,     R1                      ; 53F2   00D1
        MVI@    R1,     R1                      ; 53F3   0289
        ADDI    #$0200, R1                      ; 53F4   02F9 0200
        SDBD                                    ; 53F6   0001
        MVII    #$0801, R0                      ; 53F7   02B8 0001 0008
        MVO@    R0,     R1                      ; 53FA   0248
        CMPI    #$0006, R2                      ; 53FB   037A 0006
        BGE     L_5406                          ; 53FD   020D 0007

        ANDI    #$0001, R2                      ; 53FF   03BA 0001
        BNEQ    L_5406                          ; 5401   020C 0003

        SUBI    #$0014, R1                      ; 5403   0339 0014
        MVO@    R0,     R1                      ; 5405   0248
L_5406:
        PULR    R7                              ; 5406   02B7

        PSHR    R5                              ; 5407   0275
        MOVR    R0,     R3                      ; 5408   0083
        ADDI    #$01D7, R3                      ; 5409   02FB 01D7
        MVI@    R3,     R4                      ; 540B   029C
        CMPI    #$0040, R4                      ; 540C   037C 0040
        BNEQ    L_5425                          ; 540E   020C 0015

        JSR     R5,     L_5459                  ; 5410   0004 0154 0059

        CLRR    R4                              ; 5413   01E4
        MVO@    R4,     R3                      ; 5414   025C

        JSR     R5,     X_INIT_MOB              ; 5415   0004 0114 02B2

        CMPI    #$01DE, R3                      ; 5418   037B 01DE
        BNEQ    L_5488                          ; 541A   020C 006C

        MVI     G_01DD, R5                      ; 541C   0285 01DD
        CMPI    #$0080, R5                      ; 541E   037D 0080
        BEQ     L_5488                          ; 5420   0204 0066

        MVO     R4,     G_01DD                  ; 5422   0244 01DD
        PULR    R7                              ; 5424   02B7

L_5425:
        MVII    #$01D9, R3                      ; 5425   02BB 01D9
L_5427:
        MVI@    R3,     R0                      ; 5427   0298
        CMPR    R0,     R4                      ; 5428   0144
        BNEQ    L_5453                          ; 5429   020C 0028

        MVII    #$0010, R0                      ; 542B   02B8 0010
        MVO@    R0,     R3                      ; 542D   0258
        ADDI    #$0006, R3                      ; 542E   02FB 0006
        MVII    #$0001, R0                      ; 5430   02B8 0001

        JSR     R5,     X_RAND1                 ; 5432   0004 0114 027D

        MVII    #$0004, R2                      ; 5435   02BA 0004
        TSTR    R0                              ; 5437   0080
        BEQ     L_543B                          ; 5438   0204 0001

        SLL     R2,     1                       ; 543A   004A
L_543B:
        MVO@    R2,     R3                      ; 543B   025A
        SUBI    #$0006, R3                      ; 543C   033B 0006
        MOVR    R3,     R0                      ; 543E   0098
        SUBI    #$01D7, R0                      ; 543F   0338 01D7

        JSR     R5,     .EXEC.76C               ; 5441   0004 0114 036C
        JSR     R5,     L_5459                  ; 5444   0004 0154 0059

        MOVR    R1,     R5                      ; 5447   008D
        SDBD                                    ; 5448   0001
        MVI@    R5,     R0                      ; 5449   02A8
        MVO@    R0,     R2                      ; 544A   0250
        INCR    R2                              ; 544B   000A
        SDBD                                    ; 544C   0001
        MVI@    R5,     R0                      ; 544D   02A8
        MVO@    R0,     R2                      ; 544E   0250
        ADDI    #$0004, R2                      ; 544F   02FA 0004
        CLRR    R0                              ; 5451   01C0
        MVO@    R0,     R2                      ; 5452   0250
L_5453:
        INCR    R3                              ; 5453   000B
        CMPI    #$01DF, R3                      ; 5454   037B 01DF
        BLT     L_5427                          ; 5456   0225 0030
        PULR    R7                              ; 5458   02B7

L_5459:
        PSHR    R5                              ; 5459   0275
        MOVR    R1,     R2                      ; 545A   008A
        SDBD                                    ; 545B   0001
        MVII    #$54FB, R1                      ; 545C   02B9 00FB 0054
        MVII    #$016F, R5                      ; 545F   02BD 016F
        ADD     G_015D, R5                      ; 5461   02C5 015D
        MVI@    R5,     R5                      ; 5463   02AD
        CMPI    #$0004, R5                      ; 5464   037D 0004
        BGE     L_5470                          ; 5466   020D 0008

        MVII    #$0171, R5                      ; 5468   02BD 0171
        ADD     G_015D, R5                      ; 546A   02C5 015D
        MVI@    R5,     R5                      ; 546C   02AD
        TSTR    R5                              ; 546D   00AD
        BEQ     L_5478                          ; 546E   0204 0008

L_5470:
        CMPI    #$0004, R0                      ; 5470   0378 0004
        BLT     L_5488                          ; 5472   0205 0014

        SDBD                                    ; 5474   0001
        MVII    #$550B, R1                      ; 5475   02B9 000B 0055
L_5478:
        CMPI    #$0006, R0                      ; 5478   0378 0006
        BLT     L_5488                          ; 547A   0205 000C

        SDBD                                    ; 547C   0001
        MVII    #$551B, R1                      ; 547D   02B9 001B 0055
        CMPI    #$0007, R0                      ; 5480   0378 0007
        BLT     L_5488                          ; 5482   0205 0004

        SDBD                                    ; 5484   0001
        MVII    #$552B, R1                      ; 5485   02B9 002B 0055
L_5488:
        PULR    R7                              ; 5488   02B7

L_5489:
        PSHR    R5                              ; 5489   0275
        PSHR    R0                              ; 548A   0270
        PSHR    R1                              ; 548B   0271
        PSHR    R2                              ; 548C   0272
L_548D:
        SDBD                                    ; 548D   0001
        MVII    #$1047, R5                      ; 548E   02BD 0047 0010
        MVO@    R5,     R3                      ; 5491   025D
        INCR    R3                              ; 5492   000B
        SDBD                                    ; 5493   0001
        MVII    #$55CD, R5                      ; 5494   02BD 00CD 0055
        MVO@    R5,     R3                      ; 5497   025D
        ADDI    #$0004, R3                      ; 5498   02FB 0004
        MVO@    R4,     R3                      ; 549A   025C
        INCR    R3                              ; 549B   000B
        MVI     G_0171, R2                      ; 549C   0282 0171
        SLL     R2,     2                       ; 549E   004E
        MVII    #$0028, R5                      ; 549F   02BD 0028
        SUBR    R2,     R5                      ; 54A1   0115
        TSTR    R4                              ; 54A2   00A4
        BEQ     L_54A8                          ; 54A3   0204 0003

        ADDI    #$002D, R5                      ; 54A5   02FD 002D
        SUBR    R2,     R5                      ; 54A7   0115
L_54A8:
        MVO@    R5,     R3                      ; 54A8   025D
        CMPI    #$0006, R4                      ; 54A9   037C 0006
        BEQ     L_54D7                          ; 54AB   0204 002A

        CMPI    #$0002, R4                      ; 54AD   037C 0002
        BLT     L_54D7                          ; 54AF   0205 0026

        MVI     G_01CF, R2                      ; 54B1   0282 01CF
        ADDI    #$017E, R2                      ; 54B3   02FA 017E
        MVI@    R2,     R1                      ; 54B5   0291

        JSR     R5,     L_6306                  ; 54B6   0004 0160 0306

        ADDI    #$0006, R1                      ; 54B9   02F9 0006
        SDBD                                    ; 54BB   0001
        ADDI    #$FFFC, R3                      ; 54BC   02FB 00FC 00FF
        SWAP    R1,     1                       ; 54BF   0041
        MVO@    R1,     R3                      ; 54C0   0259
        MVI     G_01EA, R2                      ; 54C1   0282 01EA
        XORI    #$0300, R2                      ; 54C3   03FA 0300
        CMPI    #$034D, R2                      ; 54C5   037A 034D
        BLT     L_54CB                          ; 54C7   0205 0002

        MVII    #$0355, R2                      ; 54C9   02BA 0355
L_54CB:
        MOVR    R2,     R3                      ; 54CB   0093
        SDBD                                    ; 54CC   0001
        ADDI    #$0800, R1                      ; 54CD   02F9 0000 0008
        ADDI    #$0002, R2                      ; 54D0   02FA 0002
        MVO@    R1,     R2                      ; 54D2   0251
        MVII    #$0006, R4                      ; 54D3   02BC 0006
        B       L_548D                          ; 54D5   0220 0049

L_54D7:
        PULR    R2                              ; 54D7   02B2
        PULR    R1                              ; 54D8   02B1
        PULR    R0                              ; 54D9   02B0
        PULR    R7                              ; 54DA   02B7

        DECLE   $0052,  $0010,  $0049,  $0055   ; 54DB   0052 0010 0049 0055
        DECLE   $0000,  $0030,  $0000,  $0050   ; 54DF   0000 0030 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54E7   0000 0000 0000 0000
        DECLE   $0047,  $0018,  $003B,  $0055   ; 54EB   0047 0018 003B 0055
        DECLE   $0000,  $0030,  $0000,  $0050   ; 54EF   0000 0030 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54F7   0000 0000 0000 0000
        DECLE   $0052,  $0018,  $008B,  $0055   ; 54FB   0052 0018 008B 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5503   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5507   0000 0000 0000 0000
        DECLE   $0056,  $0018,  $00E6,  $0055   ; 550B   0056 0018 00E6 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 550F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5513   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5517   0000 0000 0000 0000
        DECLE   $0046,  $0018,  $00B8,  $0055   ; 551B   0046 0018 00B8 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 551F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5523   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5527   0000 0000 0000 0000
        DECLE   $0047,  $0018,  $00A6,  $0055   ; 552B   0047 0018 00A6 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 552F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5533   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5537   0000 0000 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 553B   0200 0000 0000 0000
        DECLE   $0002,  $0002,  $0000,  $0200   ; 553F   0002 0002 0000 0200
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5543   0000 0000 0000 0002
        DECLE   $0014,  $0000,  $0200,  $0000   ; 5547   0014 0000 0200 0000
        DECLE   $0000,  $0000,  $0002,  $000C   ; 554B   0000 0000 0002 000C
        DECLE   $0000,  $0200,  $0000,  $0000   ; 554F   0000 0200 0000 0000
        DECLE   $0000,  $0003,  $0024,  $0000   ; 5553   0000 0003 0024 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 5557   0200 0000 0000 0000
        DECLE   $0003,  $001C,  $0000           ; 555B   0003 001C 0000

        B       L_5560                          ; 555E   0200 0000

L_5560:
        COMR    R1                              ; 5560   0019
        DECLE   $0053,  $0002,  $000A,  $0000   ; 5561   0053 0002 000A 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 5565   0200 0000 0000 0000
        DECLE   $0002,  $0000,  $0000           ; 5569   0002 0000 0000

        B       L_556E                          ; 556C   0200 0000

L_556E:
        ADDR    R6,     R3                      ; 556E   00F3
        DECLE   $0051,  $0002,  $002C,  $0000   ; 556F   0051 0002 002C 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 5573   0200 0000 0000 0000
        DECLE   $0002,  $0030,  $0000           ; 5577   0002 0030 0000

        B       L_557C                          ; 557A   0200 0000

L_557C:
        COMR    R4                              ; 557C   001C
        SAR     R2,     1                       ; 557D   006A
        EIS                                     ; 557E   0002
        NOP                                     ; 557F   0034
        INCR    R2                              ; 5580   000A
        MVI@    R4,     R7                      ; 5581   02A7

        SAR     R1,     1                       ; 5582   0069
        MVI@    R4,     R7                      ; 5583   02A7

        DECLE   $0169,  $01A7,  $0069,  $01A7   ; 5584   0169 01A7 0069 01A7
        DECLE   $0169,  $03A7,  $0169,  $0300   ; 5588   0169 03A7 0169 0300
        DECLE   $0000,  $00F0,  $0069,  $0004   ; 558C   0000 00F0 0069 0004
        DECLE   $0038,  $0002,  $0081,  $0163   ; 5590   0038 0002 0081 0163
        DECLE   $0300,  $0000,  $00F0,  $0069   ; 5594   0300 0000 00F0 0069
        DECLE   $0004,  $0048,  $0002,  $0081   ; 5598   0004 0048 0002 0081
        DECLE   $0163,  $0300,  $0000,  $00F0   ; 559C   0163 0300 0000 00F0
        DECLE   $0069,  $0004                   ; 55A0   0069 0004

        SWAP    R0,     1                       ; 55A2   0040
        EIS                                     ; 55A3   0002
        MOVR    R0,     R1                      ; 55A4   0081
        CMPR    R4,     R3                      ; 55A5   0163
        SUB     .STIC.X.0,R0                    ; 55A6   0300 0000
        ADDR    R6,     R0                      ; 55A8   00F0
        SAR     R1,     1                       ; 55A9   0069

        JSR     R4,     L_6802                  ; 55AA   0004 0068 0002
        DECLE   $0081,  $0163,  $0300,  $0000   ; 55AD   0081 0163 0300 0000
        DECLE   $00F0,  $0069,  $0004,  $0080   ; 55B1   00F0 0069 0004 0080
        DECLE   $0002,  $0081,  $0163,  $0300   ; 55B5   0002 0081 0163 0300
        DECLE   $0000,  $0000,  $0000,  $0004   ; 55B9   0000 0000 0000 0004
        DECLE   $0078,  $0000,  $0300,  $0000   ; 55BD   0078 0000 0300 0000
        DECLE   $0000,  $0000,  $0004,  $0088   ; 55C1   0000 0000 0004 0088
        DECLE   $0000,  $0300,  $0000,  $0000   ; 55C5   0000 0300 0000 0000
        DECLE   $0000,  $0004,  $0070,  $0000   ; 55C9   0000 0004 0070 0000
        DECLE   $0300,  $0000,  $0007,  $0054   ; 55CD   0300 0000 0007 0054
        DECLE   $0006,  $0090,  $0000,  $0300   ; 55D1   0006 0090 0000 0300
        DECLE   $0000,  $00F0,  $0069,  $0005   ; 55D5   0000 00F0 0069 0005
        DECLE   $005E,  $0002,  $0081,  $0163   ; 55D9   005E 0002 0081 0163
        DECLE   $0300,  $0000,  $00F0,  $0069   ; 55DD   0300 0000 00F0 0069
        DECLE   $0005,  $0050,  $0002,  $0081   ; 55E1   0005 0050 0002 0081
        DECLE   $0163,  $0300,  $0000,  $00F0   ; 55E5   0163 0300 0000 00F0
        DECLE   $0069,  $0005                   ; 55E9   0069 0005

        RLC     R0,     2                       ; 55EB   0054
        EIS                                     ; 55EC   0002
        MOVR    R0,     R1                      ; 55ED   0081
        CMPR    R4,     R3                      ; 55EE   0163
L_55EF:
        PSHR    R5                              ; 55EF   0275
        SDBD                                    ; 55F0   0001
        MVII    #$57E1, R4                      ; 55F1   02BC 00E1 0057
        MVII    #$0028, R1                      ; 55F4   02B9 0028
        MVI     G_0176, R5                      ; 55F6   0285 0176
        CMPI    #$001F, R5                      ; 55F8   037D 001F
        BEQ     L_55FE                          ; 55FA   0204 0002

        MVII    #$0014, R1                      ; 55FC   02B9 0014

L_55FE:
        JSR     R5,     L_668A                  ; 55FE   0004 0164 028A

        MVI     G_0176, R5                      ; 5601   0285 0176
        CMPI    #$001F, R5                      ; 5603   037D 001F
        BEQ     L_5678                          ; 5605   0204 0071

        CMPI    #$00DC, R1                      ; 5607   0379 00DC
        BLT     L_55FE                          ; 5609   0225 000C

        ADDI    #$0200, R1                      ; 560B   02F9 0200
        SDBD                                    ; 560D   0001
        MVII    #$0800, R0                      ; 560E   02B8 0000 0008
L_5611:
        MVO@    R0,     R1                      ; 5611   0248
        INCR    R1                              ; 5612   0009
        CMPI    #$02F0, R1                      ; 5613   0379 02F0
        BLT     L_5611                          ; 5615   0225 0005

        MVI     G_0176, R0                      ; 5617   0280 0176
        CMPI    #$0007, R0                      ; 5619   0378 0007
        BEQ     L_5624                          ; 561B   0204 0007

        CMPI    #$000F, R0                      ; 561D   0378 000F
        BEQ     L_5624                          ; 561F   0204 0003

L_5621:
        JSR     R5,     L_5682                  ; 5621   0004 0154 0282

L_5624:
        MVII    #$01CF, R3                      ; 5624   02BB 01CF
        ADD     G_015D, R3                      ; 5626   02C3 015D
        ADD     G_015D, R3                      ; 5628   02C3 015D
        SDBD                                    ; 562A   0001
        MVII    #$56E9, R4                      ; 562B   02BC 00E9 0056
        CLRR    R0                              ; 562E   01C0
L_562F:
        SUBI    #$0003, R3                      ; 562F   033B 0003
        CLRR    R5                              ; 5631   01ED
        MVO@    R5,     R3                      ; 5632   025D
        DECR    R3                              ; 5633   0013
        MVI@    R3,     R5                      ; 5634   029D
        CMPI    #$00FF, R5                      ; 5635   037D 00FF
        BEQ     L_5657                          ; 5637   0204 001E

        PSHR    R4                              ; 5639   0274
        MVII    #$016F, R2                      ; 563A   02BA 016F
        ADD     G_015D, R2                      ; 563C   02C2 015D
        MVI@    R2,     R2                      ; 563E   0292
        TSTR    R2                              ; 563F   0092
        BNEQ    L_564A                          ; 5640   020C 0008

        CMPI    #$00B4, R5                      ; 5642   037D 00B4
        BLT     L_564A                          ; 5644   0205 0004

        SDBD                                    ; 5646   0001
        ADDI    #$FFD8, R4                      ; 5647   02FC 00D8 00FF
L_564A:
        ADDI    #$0200, R5                      ; 564A   02FD 0200
        SDBD                                    ; 564C   0001
        MVI@    R4,     R2                      ; 564D   02A2
        MVO@    R2,     R5                      ; 564E   026A
        SDBD                                    ; 564F   0001
        MVI@    R4,     R2                      ; 5650   02A2
        NOP                                     ; 5651   0034
        MVO@    R2,     R5                      ; 5652   026A
        SDBD                                    ; 5653   0001
        MVI@    R4,     R2                      ; 5654   02A2
        MVO@    R2,     R5                      ; 5655   026A
        PULR    R4                              ; 5656   02B4
L_5657:
        INCR    R0                              ; 5657   0008
        CMPI    #$0004, R0                      ; 5658   0378 0004
        BLT     L_562F                          ; 565A   0225 002C

        CLRR    R0                              ; 565C   01C0
        SUBI    #$0008, R4                      ; 565D   033C 0008
        CMPI    #$0181, R3                      ; 565F   037B 0181
        BGT     L_562F                          ; 5661   022E 0033

        MVI     G_0176, R1                      ; 5663   0281 0176
        CMPI    #$001F, R1                      ; 5665   0379 001F
        BEQ     L_5677                          ; 5667   0204 000E

        MVI     G_0103, R1                      ; 5669   0281 0103
        MOVR    R1,     R4                      ; 566B   008C
        SDBD                                    ; 566C   0001
        ADDI    #$567B, R4                      ; 566D   02FC 007B 0056
        MVI@    R4,     R1                      ; 5670   02A1
        MVO     R1,     .BTAB.4F                ; 5671   0241 024F
        CLRR    R0                              ; 5673   01C0

        JSR     R5,     L_6A4B                  ; 5674   0004 0168 024B

L_5677:
        PULR    R7                              ; 5677   02B7

L_5678:
        CMPI    #$00C8, R1                      ; 5678   0379 00C8
        BLT     L_55FE                          ; 567A   0225 007D
        B       L_5621                          ; 567C   0220 005C

        RRC     R0,     2                       ; 567E   0074
        ADDR    R2,     R4                      ; 567F   00D4
        DECR    R4                              ; 5680   0014
        SAR     R0,     2                       ; 5681   006C
L_5682:
        PSHR    R5                              ; 5682   0275
        SDBD                                    ; 5683   0001
        MVII    #$5741, R4                      ; 5684   02BC 0041 0057
        MVII    #$016F, R1                      ; 5687   02B9 016F
        ADD     G_015D, R1                      ; 5689   02C1 015D
        MVI@    R1,     R0                      ; 568B   0288
        MVII    #$0014, R1                      ; 568C   02B9 0014

        JSR     R5,     X_MPY                   ; 568E   0004 011C 01DC

        ADDR    R2,     R4                      ; 5691   00D4
        MVII    #$017F, R3                      ; 5692   02BB 017F
        ADD     G_015D, R3                      ; 5694   02C3 015D
        ADD     G_015D, R3                      ; 5696   02C3 015D
L_5698:
        MVI@    R4,     R1                      ; 5698   02A1
        MVO@    R1,     R3                      ; 5699   0259
        ADDI    #$0004, R3                      ; 569A   02FB 0004
        CMPI    #$01CE, R3                      ; 569C   037B 01CE
        BLT     L_5698                          ; 569E   0225 0007
        PULR    R7                              ; 56A0   02B7

        DECLE   $0073,  $0008,  $007B,  $0008   ; 56A1   0073 0008 007B 0008
        DECLE   $0083,  $0008,  $0000,  $0000   ; 56A5   0083 0008 0000 0000
        DECLE   $00E3,  $0018,  $00F3,  $0018   ; 56A9   00E3 0018 00F3 0018
        DECLE   $001B,  $0019,  $0000,  $0000   ; 56AD   001B 0019 0000 0000
        DECLE   $0005,  $0009,  $0005,  $0009   ; 56B1   0005 0009 0005 0009
        DECLE   $0005,  $0009,  $0000,  $0000   ; 56B5   0005 0009 0000 0000
        DECLE   $000A,  $0009,  $000A,  $0009   ; 56B9   000A 0009 000A 0009
        DECLE   $000A,  $0009,  $0000,  $0000   ; 56BD   000A 0009 0000 0000
        DECLE   $0093,  $0008,  $00B3,  $0008   ; 56C1   0093 0008 00B3 0008
        DECLE   $00BB,  $0008,  $0000,  $0000   ; 56C5   00BB 0008 0000 0000
        DECLE   $00DB,  $0008,  $002B,  $0009   ; 56C9   00DB 0008 002B 0009
        DECLE   $0013,  $0009,  $0000,  $0000   ; 56CD   0013 0009 0000 0000
        DECLE   $00E3,  $0018,  $00F3,  $0018   ; 56D1   00E3 0018 00F3 0018
        DECLE   $001B,  $0019,  $0000,  $0000   ; 56D5   001B 0019 0000 0000
        DECLE   $0005,  $0009,  $0005,  $0009   ; 56D9   0005 0009 0005 0009
        DECLE   $0005,  $0009,  $0000,  $0000   ; 56DD   0005 0009 0000 0000
        DECLE   $000A,  $0009,  $000A,  $0009   ; 56E1   000A 0009 000A 0009
        DECLE   $000A,  $0009,  $0000,  $0000   ; 56E5   000A 0009 0000 0000
        DECLE   $0023,  $0009,  $00FB,  $0008   ; 56E9   0023 0009 00FB 0008
        DECLE   $00EB,  $0008,  $0000,  $0000   ; 56ED   00EB 0008 0000 0000
        DECLE   $001B,  $0008,  $0023,  $0008   ; 56F1   001B 0008 0023 0008
        DECLE   $002B,  $0008,  $0000,  $0000   ; 56F5   002B 0008 0000 0000
        DECLE   $009B,  $0008,  $00B3,  $0008   ; 56F9   009B 0008 00B3 0008
        DECLE   $00C3,  $0008,  $0000,  $0000   ; 56FD   00C3 0008 0000 0000
        DECLE   $0033,  $0018,  $003B,  $0018   ; 5701   0033 0018 003B 0018
        DECLE   $0043,  $0018,  $0000,  $0000   ; 5705   0043 0018 0000 0000
        DECLE   $00A3,  $0018,  $00AB,  $0018   ; 5709   00A3 0018 00AB 0018
        DECLE   $00CB,  $0018,  $0000,  $0000   ; 570D   00CB 0018 0000 0000
        DECLE   $006D,  $0008,  $006D,  $0008   ; 5711   006D 0008 006D 0008
        DECLE   $006D,  $0008,  $0000,  $0000   ; 5715   006D 0008 0000 0000
        DECLE   $008D,  $0008,  $008D,  $0008   ; 5719   008D 0008 008D 0008
        DECLE   $008D,  $0008,  $0000,  $0000   ; 571D   008D 0008 0000 0000
        DECLE   $0062,  $0008,  $0062,  $0008   ; 5721   0062 0008 0062 0008
        DECLE   $0062,  $0008,  $0000,  $0000   ; 5725   0062 0008 0000 0000
        DECLE   $00D2,  $0008,  $00D2,  $0008   ; 5729   00D2 0008 00D2 0008
        DECLE   $00D2,  $0008,  $0000,  $0000   ; 572D   00D2 0008 0000 0000
        DECLE   $004B,  $0008,  $0053,  $0008   ; 5731   004B 0008 0053 0008
        DECLE   $005B,  $0008,  $0000,  $0000   ; 5735   005B 0008 0000 0000
        DECLE   $0093,  $0008,  $00B3,  $0008   ; 5739   0093 0008 00B3 0008
        DECLE   $00BB,  $0008,  $0000,  $0000   ; 573D   00BB 0008 0000 0000
        DECLE   $0016,  $0023,  $0030,  $03FF   ; 5741   0016 0023 0030 03FF
        DECLE   $003E,  $004B,  $0058,  $03FF   ; 5745   003E 004B 0058 03FF
        DECLE   $0066,  $0073,  $03FF,  $03FF   ; 5749   0066 0073 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 574D   03FF 03FF 03FF 03FF
        DECLE   $008E,  $009B,  $0094,  $03FF   ; 5751   008E 009B 0094 03FF
        DECLE   $0016,  $001A,  $001F,  $0023   ; 5755   0016 001A 001F 0023
        DECLE   $003E,  $006A,  $0047,  $0073   ; 5759   003E 006A 0047 0073
        DECLE   $0066,  $0092,  $006F,  $009B   ; 575D   0066 0092 006F 009B
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5761   03FF 03FF 03FF 03FF
        DECLE   $00B6,  $00BA,  $00BF,  $00C3   ; 5765   00B6 00BA 00BF 00C3
        DECLE   $0016,  $001A,  $001F,  $0023   ; 5769   0016 001A 001F 0023
        DECLE   $0066,  $0056,  $0047,  $0073   ; 576D   0066 0056 0047 0073
        DECLE   $008E,  $0092,  $006F,  $009B   ; 5771   008E 0092 006F 009B
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 5775   03FF 03FF 03FF 03FF
        DECLE   $00B6,  $00BA,  $00BF,  $00C3   ; 5779   00B6 00BA 00BF 00C3
        DECLE   $0043,  $0047,  $004B,  $03FF   ; 577D   0043 0047 004B 03FF
        DECLE   $006B,  $006F,  $0073,  $03FF   ; 5781   006B 006F 0073 03FF
        DECLE   $0093,  $03FF,  $03FF,  $03FF   ; 5785   0093 03FF 03FF 03FF
        DECLE   $03FF,  $0097,  $009B,  $03FF   ; 5789   03FF 0097 009B 03FF
        DECLE   $00BB,  $00BF,  $00C3,  $03FF   ; 578D   00BB 00BF 00C3 03FF
        DECLE   $0016,  $001A,  $001F,  $0023   ; 5791   0016 001A 001F 0023
        DECLE   $003E,  $006A,  $005B,  $0073   ; 5795   003E 006A 005B 0073
        DECLE   $007A,  $0092,  $0083,  $009B   ; 5799   007A 0092 0083 009B
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 579D   03FF 03FF 03FF 03FF
        DECLE   $00B6,  $00BA,  $00BF,  $00C3   ; 57A1   00B6 00BA 00BF 00C3
        DECLE   $0016,  $002E,  $001F,  $0037   ; 57A5   0016 002E 001F 0037

        RSWD    R6                              ; 57A9   003E
        RLC     R2,     2                       ; 57AA   0056
        SWAP    R3,     2                       ; 57AB   0047
        SLLC    R3,     2                       ; 57AC   005F
        SLR     R2,     2                       ; 57AD   0066
        SARC    R2,     2                       ; 57AE   007E
        MOVR    R2,     R7                      ; 57AF   0097
        MOVR    R0,     R7                      ; 57B0   0087

        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 57B1   03FF 03FF 03FF 03FF
        DECLE   $00B6,  $00A6,  $00BF,  $00AF   ; 57B5   00B6 00A6 00BF 00AF
        DECLE   $0016,  $002E,  $001F,  $0037   ; 57B9   0016 002E 001F 0037
        DECLE   $003E,  $0056,  $0047,  $005F   ; 57BD   003E 0056 0047 005F
        DECLE   $03FF,  $007E,  $03FF,  $0087   ; 57C1   03FF 007E 03FF 0087
        DECLE   $0066,  $03FF,  $0097,  $03FF   ; 57C5   0066 03FF 0097 03FF
        DECLE   $00B6,  $00A6,  $00BF,  $00AF   ; 57C9   00B6 00A6 00BF 00AF
        DECLE   $004B,  $03FF,  $03FF,  $03FF   ; 57CD   004B 03FF 03FF 03FF
        DECLE   $0087,  $03FF,  $03FF,  $03FF   ; 57D1   0087 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 57D5   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 57D9   03FF 03FF 03FF 03FF
        DECLE   $00AF,  $03FF,  $03FF,  $03FF   ; 57DD   00AF 03FF 03FF 03FF
        DECLE   $0000,  $0000,  $000A,  $00CC   ; 57E1   0000 0000 000A 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $0060   ; 57E5   00CC 00CC 00CC 0060
        DECLE   $0000,  $0000                   ; 57E9   0000 0000

        INCR    R2                              ; 57EB   000A
        ADDR    R1,     R6                      ; 57EC   00CE
        ADDR    R0,     R7                      ; 57ED   00C7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 57EE   0000 0000 0000 0000
        DECLE   $00BC,  $00EC,  $0060,  $0003   ; 57F2   00BC 00EC 0060 0003
        DECLE   $0003,  $000B,  $00CE,  $00CC   ; 57F6   0003 000B 00CE 00CC
        DECLE   $00C6,  $0000                   ; 57FA   00C6 0000

        GSWD    R0                              ; 57FC   0030
        GSWD    R0                              ; 57FD   0030
        GSWD    R0                              ; 57FE   0030
        INCR    R3                              ; 57FF   000B
        ADDR    R1,     R7                      ; 5800   00CF
        ADDR    R1,     R7                      ; 5801   00CF
        ADDR    R0,     R7                      ; 5802   00C7

        DECLE   $0000                           ; 5803   0000

        INCR    R3                              ; 5804   000B
        ADDR    R1,     R4                      ; 5805   00CC
        ADDR    R7,     R4                      ; 5806   00FC
        ADDR    R7,     R4                      ; 5807   00FC
        RRC     R0,     1                       ; 5808   0070
        DIS                                     ; 5809   0003
        DIS                                     ; 580A   0003
        DIS                                     ; 580B   0003
        INCR    R3                              ; 580C   000B
        ADDR    R1,     R4                      ; 580D   00CC
        ADDR    R0,     R7                      ; 580E   00C7

        DECLE   $0000                           ; 580F   0000

        GSWD    R0                              ; 5810   0030
        GSWD    R0                              ; 5811   0030
        GSWD    R0                              ; 5812   0030
        INCR    R3                              ; 5813   000B
        ADDR    R1,     R5                      ; 5814   00CD
        ADDR    R0,     R7                      ; 5815   00C7

        DECLE   $0003,  $0000,  $0003,  $0000   ; 5816   0003 0000 0003 0000
        DECLE   $00BC,  $00DC,  $0070,  $0003   ; 581A   00BC 00DC 0070 0003
        DECLE   $0000,  $0003,  $0003,  $0000   ; 581E   0000 0003 0003 0000
        DECLE   $0003,  $0000,  $0030,  $0000   ; 5822   0003 0000 0030 0000

        GSWD    R0                              ; 5826   0030
        INCR    R1                              ; 5827   0009
        ADDR    R1,     R4                      ; 5828   00CC
        ADDR    R1,     R7                      ; 5829   00CF

        ADDR    R1,     R5                      ; 582A   00CD
        ADDR    R1,     R4                      ; 582B   00CC
        ADDR    R0,     R7                      ; 582C   00C7

        DECLE   $0000,  $00BC,  $00CC,  $0070   ; 582D   0000 00BC 00CC 0070
        DECLE   $0000,  $0000,  $0003,  $0000   ; 5831   0000 0000 0003 0000
        DECLE   $0000,  $0009,  $00CC,  $0050   ; 5835   0000 0009 00CC 0050
        DECLE   $0000,  $0030,  $0000,  $0000   ; 5839   0000 0030 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 583D   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5841   0000 0000 0000 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5845   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5849   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $00CE   ; 584D   0000 0000 000A 00CE
        DECLE   $00CC,  $00CE,  $00CC,  $00CC   ; 5851   00CC 00CE 00CC 00CC
        DECLE   $00EC,  $00CC,  $00EC,  $0060   ; 5855   00EC 00CC 00EC 0060
        DECLE   $0003,  $0003,  $0000,  $0003   ; 5859   0003 0003 0000 0003
        DECLE   $0000,  $0000,  $0030,  $0000   ; 585D   0000 0000 0030 0000
        DECLE   $0030,  $0030,  $000B,  $00CD   ; 5861   0030 0030 000B 00CD
        DECLE   $00CE,  $00CD,  $00CE,  $00CC   ; 5865   00CE 00CD 00CE 00CC
        DECLE   $00DC,  $00EC,  $00DC,  $0070   ; 5869   00DC 00EC 00DC 0070
        DECLE   $0003,  $0000,  $0003,  $0000   ; 586D   0003 0000 0003 0000
        DECLE   $0003,  $0000,  $0000,  $0030   ; 5871   0003 0000 0000 0030
        DECLE   $0000,  $0030,  $0009,  $00CE   ; 5875   0000 0030 0009 00CE
        DECLE   $00CD,  $00CE,  $00CD,  $00EC   ; 5879   00CD 00CE 00CD 00EC
        DECLE   $00EC,  $00DC,  $00EC,  $0050   ; 587D   00EC 00DC 00EC 0050
        DECLE   $0000,  $0003,  $0000,  $0003   ; 5881   0000 0003 0000 0003
        DECLE   $0000,  $0030,  $0030,  $0000   ; 5885   0000 0030 0030 0000
        DECLE   $0030,  $0000,  $000A,  $00CD   ; 5889   0030 0000 000A 00CD
        DECLE   $00CE,  $00CD,  $00CE,  $00DC   ; 588D   00CE 00CD 00CE 00DC
        DECLE   $00DC,  $00EC,  $00DC,  $0060   ; 5891   00DC 00EC 00DC 0060
        DECLE   $0003,  $0000,  $0003,  $0000   ; 5895   0003 0000 0003 0000
        DECLE   $0003,  $0000,  $0000,  $0030   ; 5899   0003 0000 0000 0030
        DECLE   $0000,  $0030,  $000B,  $00CC   ; 589D   0000 0030 000B 00CC
        DECLE   $00CD,  $00CC,  $00CD,  $00CC   ; 58A1   00CD 00CC 00CD 00CC
        DECLE   $00CC,  $00DC,  $00CC,  $0070   ; 58A5   00CC 00DC 00CC 0070
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $00CC   ; 58B1   0000 0000 000A 00CC
        DECLE   $00CE,  $00CE,  $00CC,  $00EC   ; 58B5   00CE 00CE 00CC 00EC
        DECLE   $00EC,  $00EC,  $00CC,  $0060   ; 58B9   00EC 00EC 00CC 0060
        DECLE   $0003,  $0000,  $0003,  $0003   ; 58BD   0003 0000 0003 0003
        DECLE   $0000,  $0030,  $0030,  $0030   ; 58C1   0000 0030 0030 0030
        DECLE   $0000                           ; 58C5   0000

        GSWD    R0                              ; 58C6   0030
        INCR    R3                              ; 58C7   000B
        ADDR    R1,     R6                      ; 58C8   00CE
        ADDR    R0,     R7                      ; 58C9   00C7

        DECLE   $0003,  $0000,  $00BC,  $00DC   ; 58CA   0003 0000 00BC 00DC
        DECLE   $00FC,  $00EC,  $0070,  $0003   ; 58CE   00FC 00EC 0070 0003
        DECLE   $0003,  $000B,  $00CD,  $00CC   ; 58D2   0003 000B 00CD 00CC
        DECLE   $0070,  $0000                   ; 58D6   0070 0000

        GSWD    R0                              ; 58D8   0030
        GSWD    R0                              ; 58D9   0030
        GSWD    R0                              ; 58DA   0030
        INCR    R3                              ; 58DB   000B
        ADDR    R1,     R7                      ; 58DC   00CF

        DECLE   $00C5,  $0000,  $0000,  $009C   ; 58DD   00C5 0000 0000 009C
        DECLE   $00CC,  $00DC,  $00FC,  $0070   ; 58E1   00CC 00DC 00FC 0070
        DECLE   $0003,  $0003,  $0000,  $0000   ; 58E5   0003 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E9   0000 0000 0000 0000

        GSWD    R0                              ; 58ED   0030
        GSWD    R0                              ; 58EE   0030
        INCR    R3                              ; 58EF   000B
        ADDR    R1,     R7                      ; 58F0   00CF

        DECLE   $00CE,  $00CC,  $00CC,  $00EC   ; 58F1   00CE 00CC 00CC 00EC
        DECLE   $00EC,  $00EC,  $00DC,  $0070   ; 58F5   00EC 00EC 00DC 0070
        DECLE   $0003,  $0003,  $0003,  $0000   ; 58F9   0003 0003 0003 0000
        DECLE   $0000,  $0030,  $0030,  $0030   ; 58FD   0000 0030 0030 0030
        DECLE   $0000                           ; 5901   0000

        GSWD    R0                              ; 5902   0030
        INCR    R3                              ; 5903   000B
        ADDR    R1,     R5                      ; 5904   00CD
        ADDR    R1,     R5                      ; 5905   00CD
        ADDR    R1,     R4                      ; 5906   00CC
        ADDR    R1,     R4                      ; 5907   00CC
        ADDR    R3,     R4                      ; 5908   00DC
        ADDR    R3,     R4                      ; 5909   00DC
        ADDR    R3,     R4                      ; 590A   00DC
        ADDR    R1,     R4                      ; 590B   00CC
        RRC     R0,     1                       ; 590C   0070
        INCR    R2                              ; 590D   000A
        ADDR    R1,     R6                      ; 590E   00CE
        ADDR    R1,     R4                      ; 590F   00CC
        ADDR    R1,     R4                      ; 5910   00CC
        ADDR    R1,     R4                      ; 5911   00CC
        ADDR    R1,     R4                      ; 5912   00CC
        ADDR    R1,     R4                      ; 5913   00CC
        ADDR    R1,     R4                      ; 5914   00CC
        ADDR    R1,     R4                      ; 5915   00CC
        SLR     R0,     1                       ; 5916   0060
        INCR    R3                              ; 5917   000B
        ADDR    R0,     R7                      ; 5918   00C7

        DECLE   $000A,  $00CC,  $00EC,  $00CC   ; 5919   000A 00CC 00EC 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $0050   ; 591D   00CC 00CC 00CC 0050
        DECLE   $0003,  $0003,  $0003,  $0000   ; 5921   0003 0003 0003 0000
        DECLE   $0030,  $0000,  $0000,  $0000   ; 5925   0030 0000 0000 0000
        DECLE   $0000,  $0010,  $0003,  $0003   ; 5929   0000 0010 0003 0003
        DECLE   $0009,  $00CC,  $00DC,  $00CC   ; 592D   0009 00CC 00DC 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $0060   ; 5931   00CC 00CC 00CC 0060
        DECLE   $0003,  $0003,  $0000,  $0000   ; 5935   0003 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5939   0000 0000 0000 0000
        DECLE   $0000                           ; 593D   0000

        GSWD    R0                              ; 593E   0030
        INCR    R3                              ; 593F   000B
        ADDR    R1,     R7                      ; 5940   00CF

        DECLE   $00CC,  $00EC,  $00CC,  $00CC   ; 5941   00CC 00EC 00CC 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $0070   ; 5945   00CC 00CC 00CC 0070
        DECLE   $0003,  $0003,  $0000,  $0030   ; 5949   0003 0003 0000 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594D   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0003,  $0003   ; 5951   0000 0030 0003 0003
        DECLE   $0000,  $009C,  $00EC,  $00CC   ; 5955   0000 009C 00EC 00CC
        DECLE   $00CC,  $00EC,  $00CC,  $0070   ; 5959   00CC 00EC 00CC 0070
        DECLE   $0003,  $000B,  $00C6,  $0000   ; 595D   0003 000B 00C6 0000
        DECLE   $0030,  $0000,  $0000,  $0030   ; 5961   0030 0000 0000 0030
        DECLE   $0000                           ; 5965   0000

        GSWD    R0                              ; 5966   0030
        INCR    R3                              ; 5967   000B
        ADDR    R1,     R7                      ; 5968   00CF
        ADDR    R0,     R7                      ; 5969   00C7

        DECLE   $0008,  $00DC,  $00CC,  $00CC   ; 596A   0008 00DC 00CC 00CC
        DECLE   $00DC,  $00CC,  $0070,  $0000   ; 596E   00DC 00CC 0070 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5972   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5976   0000 0000 0000 0000
        DECLE   $0000,  $000A,  $00CE,  $00CE   ; 597A   0000 000A 00CE 00CE
        DECLE   $00CE,  $00CE,  $00CC,  $00EC   ; 597E   00CE 00CE 00CC 00EC
        DECLE   $00EC,  $00EC,  $0060,  $0003   ; 5982   00EC 00EC 0060 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5986   0003 0003 0003 0003
        DECLE   $0000                           ; 598A   0000

        GSWD    R0                              ; 598B   0030
        GSWD    R0                              ; 598C   0030
        GSWD    R0                              ; 598D   0030
        GSWD    R0                              ; 598E   0030
        INCR    R3                              ; 598F   000B
        ADDR    R1,     R7                      ; 5990   00CF
        ADDR    R1,     R7                      ; 5991   00CF
        ADDR    R1,     R7                      ; 5992   00CF
        ADDR    R0,     R7                      ; 5993   00C7

        DECLE   $0000                           ; 5994   0000

        GSWD    R0                              ; 5995   0030
        MOVR    R7,     R4                      ; 5996   00BC
        ADDR    R7,     R4                      ; 5997   00FC
        RRC     R0,     1                       ; 5998   0070
        DIS                                     ; 5999   0003
        DIS                                     ; 599A   0003
        DIS                                     ; 599B   0003
        DIS                                     ; 599C   0003
        INCR    R3                              ; 599D   000B
        ADDR    R1,     R4                      ; 599E   00CC
        ADDR    R7,     R4                      ; 599F   00FC
        RRC     R0,     1                       ; 59A0   0070
        GSWD    R0                              ; 59A1   0030
        GSWD    R0                              ; 59A2   0030
        DIS                                     ; 59A3   0003
        DIS                                     ; 59A4   0003
        INCR    R3                              ; 59A5   000B
        ADDR    R1,     R7                      ; 59A6   00CF
        ADDR    R0,     R7                      ; 59A7   00C7

        DECLE   $0000                           ; 59A8   0000

        GSWD    R0                              ; 59A9   0030
        MOVR    R7,     R4                      ; 59AA   00BC
        ADDR    R7,     R4                      ; 59AB   00FC
        RRC     R0,     1                       ; 59AC   0070
        INCR    R3                              ; 59AD   000B
        ADDR    R1,     R7                      ; 59AE   00CF
        ADDR    R0,     R7                      ; 59AF   00C7

        DIS                                     ; 59B0   0003
        INCR    R3                              ; 59B1   000B
        ADDR    R1,     R4                      ; 59B2   00CC
        ADDR    R7,     R4                      ; 59B3   00FC
        RRC     R0,     1                       ; 59B4   0070
        GSWD    R0                              ; 59B5   0030
        GSWD    R0                              ; 59B6   0030
        DIS                                     ; 59B7   0003
        DIS                                     ; 59B8   0003
        INCR    R3                              ; 59B9   000B
        ADDR    R1,     R7                      ; 59BA   00CF
        ADDR    R0,     R7                      ; 59BB   00C7

        DECLE   $0000,  $0030,  $00BC,  $00FC   ; 59BC   0000 0030 00BC 00FC
        DECLE   $0070,  $0003,  $0003,  $0003   ; 59C0   0070 0003 0003 0003
        DECLE   $0003,  $0003,  $0000,  $0030   ; 59C4   0003 0003 0000 0030
        DECLE   $0030,  $0030,  $0030,  $000B   ; 59C8   0030 0030 0030 000B
        DECLE   $00CD,  $00CD,  $00CD,  $00CD   ; 59CC   00CD 00CD 00CD 00CD
        DECLE   $00CC,  $00DC,  $00DC,  $00DC   ; 59D0   00CC 00DC 00DC 00DC
        DECLE   $0070,  $0000,  $0000,  $0000   ; 59D4   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 59DC   0000 0000 0000 000A
        DECLE   $00CE,  $00C6,  $0000,  $000A   ; 59E0   00CE 00C6 0000 000A
        DECLE   $00CC,  $00EC,  $0060,  $0000   ; 59E4   00CC 00EC 0060 0000
        DECLE   $0000,  $0003,  $0003,  $0009   ; 59E8   0000 0003 0003 0009
        DECLE   $00CE,  $00C5,  $0000,  $0030   ; 59EC   00CE 00C5 0000 0030
        DECLE   $00BC,  $00CC,  $0060,  $000B   ; 59F0   00BC 00CC 0060 000B
        DECLE   $00CD,  $00C6,  $0003,  $0000   ; 59F4   00CD 00C6 0003 0000
        DECLE   $00AC,  $00FC,  $0070,  $0000   ; 59F8   00AC 00FC 0070 0000
        DECLE   $0030,  $0003,  $0000           ; 59FC   0030 0003 0000

        INCR    R3                              ; 59FF   000B
        ADDR    R1,     R5                      ; 5A00   00CD
        ADDR    R1,     R4                      ; 5A01   00CC
        RRC     R0,     1                       ; 5A02   0070
        GSWD    R0                              ; 5A03   0030
        MOVR    R3,     R4                      ; 5A04   009C
        ADDR    R5,     R4                      ; 5A05   00EC
        RLC     R0,     1                       ; 5A06   0050
        INCR    R1                              ; 5A07   0009
        ADDR    R1,     R6                      ; 5A08   00CE
        ADDR    R0,     R7                      ; 5A09   00C7

        DECLE   $0000,  $000A,  $00DC,  $00DC   ; 5A0A   0000 000A 00DC 00DC
        DECLE   $0060,  $0030,  $0000,  $0000   ; 5A0E   0060 0030 0000 0000

        DIS                                     ; 5A12   0003
        INCR    R1                              ; 5A13   0009
        ADDR    R1,     R6                      ; 5A14   00CE
        ADDR    R0,     R7                      ; 5A15   00C7

        DECLE   $0000,  $0000,  $00BC,  $00FC   ; 5A16   0000 0000 00BC 00FC
        DECLE   $0060,  $000A,  $00CD,  $00C6   ; 5A1A   0060 000A 00CD 00C6
        DECLE   $0003,  $0009,  $00EC,  $00EC   ; 5A1E   0003 0009 00EC 00EC
        DECLE   $0050,  $0030,  $0030,  $0003   ; 5A22   0050 0030 0030 0003
        DECLE   $0000                           ; 5A26   0000

        INCR    R3                              ; 5A27   000B
        ADDR    R1,     R5                      ; 5A28   00CD
        ADDR    R1,     R4                      ; 5A29   00CC
        RRC     R0,     1                       ; 5A2A   0070
        GSWD    R0                              ; 5A2B   0030
        MOVR    R5,     R4                      ; 5A2C   00AC
        ADDR    R3,     R4                      ; 5A2D   00DC
        RLC     R0,     1                       ; 5A2E   0050
        INCR    R1                              ; 5A2F   0009
        ADDR    R1,     R4                      ; 5A30   00CC
        ADDR    R0,     R7                      ; 5A31   00C7

        DECLE   $0000,  $0000,  $009C,  $00DC   ; 5A32   0000 0000 009C 00DC
        DECLE   $0070,  $0000,  $0000,  $0000   ; 5A36   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3E   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $00CC,  $00C6   ; 5A42   0000 0008 00CC 00C6
        DECLE   $0000,  $0000,  $008C,  $00EC   ; 5A46   0000 0000 008C 00EC
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5A4A   0060 0000 0000 0000
        DECLE   $0000,  $0009,  $00CE,  $00C4   ; 5A4E   0000 0009 00CE 00C4
        DECLE   $0000,  $0030,  $00BC,  $00CC   ; 5A52   0000 0030 00BC 00CC
        DECLE   $0040,  $0008,  $00CC,  $00C6   ; 5A56   0040 0008 00CC 00C6
        DECLE   $0003,  $000A,  $00CC,  $00FC   ; 5A5A   0003 000A 00CC 00FC
        DECLE   $0070,  $0000,  $0000,  $0000   ; 5A5E   0070 0000 0000 0000
        DECLE   $0000                           ; 5A62   0000

        INCR    R3                              ; 5A63   000B
        ADDR    R1,     R5                      ; 5A64   00CD
        ADDR    R0,     R7                      ; 5A65   00C7

        DECLE   $0000                           ; 5A66   0000

        GSWD    R0                              ; 5A67   0030
        MOVR    R3,     R4                      ; 5A68   009C
        ADDR    R1,     R4                      ; 5A69   00CC
        SWAP    R0,     1                       ; 5A6A   0040
        INCR    R0                              ; 5A6B   0008
        ADDR    R1,     R4                      ; 5A6C   00CC
        ADDR    R0,     R7                      ; 5A6D   00C7

        DECLE   $0000,  $000B,  $00CC,  $00DC   ; 5A6E   0000 000B 00CC 00DC
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5A72   0060 0000 0000 0000
        DECLE   $0000,  $0009,  $00CE,  $00C5   ; 5A76   0000 0009 00CE 00C5
        DECLE   $0000,  $0000,  $00BC,  $00CC   ; 5A7A   0000 0000 00BC 00CC
        DECLE   $0040,  $0008,  $00CC,  $00C6   ; 5A7E   0040 0008 00CC 00C6
        DECLE   $0003,  $0000,  $00AC,  $00CC   ; 5A82   0003 0000 00AC 00CC
        DECLE   $0070,  $0000,  $0010,  $0000   ; 5A86   0070 0000 0010 0000
        DECLE   $0000,  $000B,  $00CD,  $00CC   ; 5A8A   0000 000B 00CD 00CC
        DECLE   $0070,  $0000                   ; 5A8E   0070 0000

        MOVR    R3,     R4                      ; 5A90   009C
        ADDR    R1,     R4                      ; 5A91   00CC
        SWAP    R0,     1                       ; 5A92   0040
        INCR    R0                              ; 5A93   0008
        ADDR    R1,     R4                      ; 5A94   00CC
        ADDR    R0,     R7                      ; 5A95   00C7

        DECLE   $0000,  $0000,  $00BC,  $00CC   ; 5A96   0000 0000 00BC 00CC
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5A9A   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $00CC   ; 5AA6   0000 0000 000A 00CC
        DECLE   $00CC,  $00CC,  $00CC,  $00CC   ; 5AAA   00CC 00CC 00CC 00CC
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5AAE   0060 0000 0000 0000
        DECLE   $0003,  $0000,  $0000,  $0000   ; 5AB2   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 5AB6   0000 0000 0030 0000
        DECLE   $0000,  $000A,  $00C5,  $0000   ; 5ABA   0000 000A 00C5 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABE   0000 0000 0000 0000
        DECLE   $009C,  $00CC,  $0060,  $0003   ; 5AC2   009C 00CC 0060 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ACA   0000 0000 0000 0000
        DECLE   $0030,  $0003,  $0000,  $0000   ; 5ACE   0030 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0003   ; 5AD6   0000 0000 0030 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00AC,  $00CC   ; 5ADE   0000 0000 00AC 00CC
        DECLE   $0070,  $0009,  $00C6,  $0000   ; 5AE2   0070 0009 00C6 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE6   0000 0000 0000 0000
        DECLE   $0030,  $0000,  $0030,  $0000   ; 5AEA   0030 0000 0030 0000
        DECLE   $0009,  $00CC,  $00CC,  $00CC   ; 5AEE   0009 00CC 00CC 00CC
        DECLE   $00CC,  $00CC,  $00DC,  $00CC   ; 5AF2   00CC 00CC 00DC 00CC
        DECLE   $0050                           ; 5AF6   0050
.GRAM_INIT_5AF7:
        DECLE   $002F           ; 5AF7  # of GRAM cards to init
        DECLE   $0001,  $0010   ; 5AF8  #00-00:  GROM #00-00 ----
        DECLE   $0019,  $0070   ; 5AFA  #01-01:  GROM #0C-0C ----
        DECLE   $0000           ; 5AFC  #02   :  CART #00    ----
        DECLE   $0002           ; 5AFD  #03   :  CART #01    ----
        DECLE   $0281,  $000E   ; 5AFE  #04   :  Algo #1
        DECLE   $0207,  $0040   ; 5B00  #05-05:  GRAM #03-03 X---
        DECLE   $0005,  $0080   ; 5B02  #06-07:  CART #02-03 ----
        DECLE   $020D,  $0040   ; 5B04  #08-08:  GRAM #06-06 X---
        DECLE   $0008           ; 5B06  #09   :  CART #04    ----
        DECLE   $0023,  $0070   ; 5B07  #0A-0A:  GROM #11-11 ----
        DECLE   $0213,  $0040   ; 5B09  #0B-0B:  GRAM #09-09 X---
        DECLE   $0281,  $002E   ; 5B0B  #0C   :  Algo #1
        DECLE   $000B,  $0100   ; 5B0D  #0D-0F:  CART #05-07 ----
        DECLE   $021D,  $0040   ; 5B0F  #10-10:  GRAM #0E-0E X---
        DECLE   $0011,  $0200   ; 5B11  #11-15:  CART #08-0C ----
        DECLE   $0095,  $0040   ; 5B13  #16-16:  GRAM #0A-0A --I-
        DECLE   $0225,  $0140   ; 5B15  #17-19:  GRAM #12-14 X---
        DECLE   $0201,  $0036   ; 5B17  #1A   :  Algo #1
        DECLE   $001B,  $0300   ; 5B19  #1B-21:  CART #0D-13 ----
        DECLE   $0237,  $0140   ; 5B1B  #22-24:  GRAM #1B-1D X---
        DECLE   $0028           ; 5B1D  #25   :  CART #14    ----
        DECLE   $002B,  $0380   ; 5B1E  #26-2D:  CART #15-1C ----
        DECLE   $003A           ; 5B20  #2E   :  CART #1D    ----


        SLLC    R2,     2                       ; 5B21   005E
        SARC    R2,     2                       ; 5B22   007E
        RSWD    R4                              ; 5B23   003C
        RSWD    R4                              ; 5B24   003C
        RSWD    R4                              ; 5B25   003C
        MOVR    R3,     R1                      ; 5B26   0099
        MOVR    R7,     R5                      ; 5B27   00BD
        ADDR    R3,     R3                      ; 5B28   00DB
        ADDR    R4,     R7                      ; 5B29   00E7

        DECLE   $003C,  $007E,  $007E,  $007E   ; 5B2A   003C 007E 007E 007E
        DECLE   $0000,  $0000,  $0036,  $006E   ; 5B2E   0000 0000 0036 006E
        DECLE   $007E,  $003C,  $003C,  $003C   ; 5B32   007E 003C 003C 003C
        DECLE   $0018,  $003C,  $007E,  $00FF   ; 5B36   0018 003C 007E 00FF
        DECLE   $00BD,  $00BD,  $007E,  $007E   ; 5B3A   00BD 00BD 007E 007E
        DECLE   $0000,  $0000,  $0036,  $0000   ; 5B3E   0000 0000 0036 0000
        DECLE   $006E,  $007E,  $003C,  $003C   ; 5B42   006E 007E 003C 003C
        DECLE   $003C,  $0018,  $003C,  $007E   ; 5B46   003C 0018 003C 007E
        DECLE   $00FF,  $00BD,  $00BD,  $007E   ; 5B4A   00FF 00BD 00BD 007E
        DECLE   $007E,  $0010,  $0004,  $006E   ; 5B4E   007E 0010 0004 006E
        DECLE   $007E,  $003C,  $003C,  $003C   ; 5B52   007E 003C 003C 003C
        DECLE   $0018,  $003C,  $007E,  $00FF   ; 5B56   0018 003C 007E 00FF
        DECLE   $00BD,  $00BD,  $007E,  $007E   ; 5B5A   00BD 00BD 007E 007E
        DECLE   $0004,  $0000,  $0030,  $0000   ; 5B5E   0004 0000 0030 0000
        DECLE   $006E,  $007E,  $003C,  $003C   ; 5B62   006E 007E 003C 003C
        DECLE   $003C,  $0018,  $003C,  $007E   ; 5B66   003C 0018 003C 007E
        DECLE   $00FF,  $00BD,  $00BD,  $007E   ; 5B6A   00FF 00BD 00BD 007E
        DECLE   $007E,  $000C,  $0004,  $0000   ; 5B6E   007E 000C 0004 0000
        DECLE   $0000,  $0000,  $0000,  $00BD   ; 5B72   0000 0000 0000 00BD
        DECLE   $0018,  $003C,  $0024,  $0018   ; 5B76   0018 003C 0024 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B7A   0000 0000 0000 0000
        DECLE   $0034,  $0034,  $0000,  $0000   ; 5B7E   0034 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5B82   0000 0000 0000 003C
        DECLE   $0018,  $003C,  $0024,  $0018   ; 5B86   0018 003C 0024 0018
        DECLE   $0000,  $0000,  $0081,  $0000   ; 5B8A   0000 0000 0081 0000
        DECLE   $003C,  $0034,  $0000,  $0000   ; 5B8E   003C 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B92   0000 0000 0000 0000
        DECLE   $003C,  $0018,  $003C,  $0024   ; 5B96   003C 0018 003C 0024
        DECLE   $0018,  $0000,  $0000,  $0081   ; 5B9A   0018 0000 0000 0081
        DECLE   $0000,  $0024,  $0000,  $0000   ; 5B9E   0000 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5BA2   0000 0000 0000 003C
        DECLE   $0018,  $003C,  $0024,  $0018   ; 5BA6   0018 003C 0024 0018
        DECLE   $0000,  $0000,  $0081,  $0000   ; 5BAA   0000 0000 0081 0000
        DECLE   $0032,  $0030,  $0000,  $0000   ; 5BAE   0032 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB2   0000 0000 0000 0000
        DECLE   $003C,  $0018,  $003C,  $0024   ; 5BB6   003C 0018 003C 0024
        DECLE   $0018,  $0000,  $0000,  $0081   ; 5BBA   0018 0000 0000 0081
        DECLE   $0000,  $002C,  $0000,  $0000   ; 5BBE   0000 002C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BC2   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $0000,  $0000   ; 5BC6   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0081,  $0000   ; 5BCA   0000 0000 0081 0000
        DECLE   $003C,  $0034,  $0000,  $0000   ; 5BCE   003C 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BD2   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $003C,  $0000   ; 5BD6   0000 003C 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 5BDA   0000 0000 0000 0081
        DECLE   $0000,  $0024,  $0000,  $0000   ; 5BDE   0000 0024 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE2   0000 0000 0000 0000
        DECLE   $003C,  $003C,  $0000,  $0000   ; 5BE6   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0081,  $0000   ; 5BEA   0000 0000 0081 0000
        DECLE   $0032,  $0030,  $0000,  $0000   ; 5BEE   0032 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BF2   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $003C,  $0000   ; 5BF6   0000 003C 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 5BFA   0000 0000 0000 0081
        DECLE   $0000,  $002C,  $0000,  $0000   ; 5BFE   0000 002C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5C02   0000 0000 0000 003C
        DECLE   $001C,  $003C,  $0000,  $0000   ; 5C06   001C 003C 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5C0A   0000 0001 0000 0000
        DECLE   $001C,  $002C,  $0004,  $0000   ; 5C0E   001C 002C 0004 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5C12   0000 0000 0000 003C
        DECLE   $001C,  $003C,  $0000,  $0000   ; 5C16   001C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C1A   0000 0000 0000 0000
        DECLE   $002C,  $0034,  $0000,  $0000   ; 5C1E   002C 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5C22   0000 0000 0000 003C
        DECLE   $001C,  $003C,  $0000,  $0080   ; 5C26   001C 003C 0000 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C2A   0000 0000 0000 0000
        DECLE   $005C,  $0060,  $0000,  $0000   ; 5C2E   005C 0060 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 5C32   0000 0000 0000 003C
        DECLE   $001C,  $003C,  $0000,  $0000   ; 5C36   001C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C3A   0000 0000 0000 0000
        DECLE   $0036,  $0032,  $0000,  $006E   ; 5C3E   0036 0032 0000 006E
        DECLE   $0076,  $003C,  $003C,  $003C   ; 5C42   0076 003C 003C 003C
        DECLE   $001C,  $003C,  $003C,  $0064   ; 5C46   001C 003C 003C 0064
        DECLE   $004E,  $005E,  $00BE,  $00FE   ; 5C4A   004E 005E 00BE 00FE
        DECLE   $0000,  $0060,  $000C,  $006E   ; 5C4E   0000 0060 000C 006E
        DECLE   $0076,  $003C,  $003C,  $003C   ; 5C52   0076 003C 003C 003C
        DECLE   $001C,  $003C,  $003C,  $002C   ; 5C56   001C 003C 003C 002C
        DECLE   $006E,  $006E,  $00EE,  $00FC   ; 5C5A   006E 006E 00EE 00FC
        DECLE   $0002,  $0002,  $0018,  $006E   ; 5C5E   0002 0002 0018 006E
        DECLE   $0076,  $003C,  $003C,  $003C   ; 5C62   0076 003C 003C 003C
        DECLE   $001C,  $003C,  $003C,  $0034   ; 5C66   001C 003C 003C 0034
        DECLE   $0072,  $007A,  $00FA,  $00FE   ; 5C6A   0072 007A 00FA 00FE
        DECLE   $0000,  $000C,  $0060,  $006E   ; 5C6E   0000 000C 0060 006E
        DECLE   $0076,  $003C,  $003C,  $003C   ; 5C72   0076 003C 003C 003C
        DECLE   $001C,  $003C,  $003C,  $0034   ; 5C76   001C 003C 003C 0034
        DECLE   $0076,  $0076,  $00F6,  $00FE   ; 5C7A   0076 0076 00F6 00FE
        DECLE   $0001,  $0001,  $0030,  $0000   ; 5C7E   0001 0001 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 5C86   0000 0000 0000 0060
        DECLE   $006C,  $00EC,  $00FE,  $007E   ; 5C8A   006C 00EC 00FE 007E
        DECLE   $007E,  $003C,  $0038,  $0000   ; 5C8E   007E 003C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 5C96   0000 0000 0000 000C
        DECLE   $006D,  $006E,  $007E,  $00FE   ; 5C9A   006D 006E 007E 00FE
        DECLE   $00FC,  $007C,  $0038,  $0000   ; 5C9E   00FC 007C 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $000C   ; 5CA6   0000 0000 0060 000C
        DECLE   $0080,  $0002,  $0000,  $0000   ; 5CAA   0080 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0060   ; 5CB6   0000 0000 000C 0060
        DECLE   $0000,  $0081,  $0081,  $0000   ; 5CBA   0000 0081 0081 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5CBE   0000 0000 0000 0020
        DECLE   $0002,  $0010,  $0040,  $0002   ; 5CC2   0002 0010 0040 0002
        DECLE   $0090,  $0004,  $0040,  $0011   ; 5CC6   0090 0004 0040 0011
        DECLE   $0080,  $0000,  $0045,  $0090   ; 5CCA   0080 0000 0045 0090
        DECLE   $0000,  $0041,  $0014,  $0049   ; 5CCE   0000 0041 0014 0049
        DECLE   $0000,  $0004,  $0020,  $0001   ; 5CD2   0000 0004 0020 0001
        DECLE   $0090,  $0000,  $0002,  $0020   ; 5CD6   0090 0000 0002 0020
        DECLE   $0009,  $0000,  $0040,  $0000   ; 5CDA   0009 0000 0040 0000
        DECLE   $0014,  $0000,  $0020,  $0038   ; 5CDE   0014 0000 0020 0038
        DECLE   $007C,  $0054,  $007C,  $003E   ; 5CE2   007C 0054 007C 003E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 5CE6   001E 001E 001E 001E
        DECLE   $003E,  $007E,  $007C,  $0038   ; 5CEA   003E 007E 007C 0038
        DECLE   $00E0,  $0000                   ; 5CEE   00E0 0000

        INCR    R6                              ; 5CF0   000E
        RRC     R0,     1                       ; 5CF1   0070
        SARC    R0,     1                       ; 5CF2   0078
        ADDR    R7,     R4                      ; 5CF3   00FC
        MOVR    R5,     R4                      ; 5CF4   00AC
        ADDR    R7,     R4                      ; 5CF5   00FC
        ADDR    R7,     R4                      ; 5CF6   00FC
        SARC    R2,     2                       ; 5CF7   007E
        RSWD    R6                              ; 5CF8   003E
        RSWD    R6                              ; 5CF9   003E
        RSWD    R6                              ; 5CFA   003E
        SARC    R2,     2                       ; 5CFB   007E
        SARC    R0,     2                       ; 5CFC   007C
        SARC    R0,     2                       ; 5CFD   007C
        RSWD    R0                              ; 5CFE   0038
        COMR    R0                              ; 5CFF   0018
        ADDR    R5,     R6                      ; 5D00   00EE
        RSWD    R0                              ; 5D01   0038
        SARC    R0,     2                       ; 5D02   007C
        RLC     R0,     2                       ; 5D03   0054
        ADDR    R7,     R4                      ; 5D04   00FC
        ADDR    R7,     R4                      ; 5D05   00FC
        ADDR    R7,     R4                      ; 5D06   00FC
        ADDR    R7,     R0                      ; 5D07   00F8
        ADDR    R7,     R0                      ; 5D08   00F8
        ADDR    R7,     R0                      ; 5D09   00F8
        ADDR    R7,     R4                      ; 5D0A   00FC
        ADDR    R7,     R4                      ; 5D0B   00FC
        SARC    R0,     2                       ; 5D0C   007C
        SARC    R0,     2                       ; 5D0D   007C
        RSWD    R0                              ; 5D0E   0038
        INCR    R7                              ; 5D0F   000F

        ADDR    R4,     R0                      ; 5D10   00E0
L_5D11:
        RRC     R0,     1                       ; 5D11   0070
        DECLE   $0078,  $00FC,  $00AC,  $00FC   ; 5D12   0078 00FC 00AC 00FC
        DECLE   $00FC,  $007E,  $003E,  $003E   ; 5D16   00FC 007E 003E 003E
        DECLE   $003E,  $007E,  $007C,  $007C   ; 5D1A   003E 007E 007C 007C
        DECLE   $0038,  $0018,  $00EE,  $0038   ; 5D1E   0038 0018 00EE 0038
        DECLE   $007C,  $007C,  $007C,  $003E   ; 5D22   007C 007C 007C 003E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 5D26   001E 001E 001E 001E
        DECLE   $003E,  $007E,  $007C,  $0038   ; 5D2A   003E 007E 007C 0038
        DECLE   $00E0,  $0000,  $000E,  $0070   ; 5D2E   00E0 0000 000E 0070
        DECLE   $0078,  $00FC,  $00FC,  $00FC   ; 5D32   0078 00FC 00FC 00FC
        DECLE   $00FC,  $007E,  $003E,  $003E   ; 5D36   00FC 007E 003E 003E
        DECLE   $003E,  $007E,  $007C,  $007C   ; 5D3A   003E 007E 007C 007C
        DECLE   $0038,  $0018,  $00EE,  $0038   ; 5D3E   0038 0018 00EE 0038
        DECLE   $007C,  $007C,  $00FC,  $00FC   ; 5D42   007C 007C 00FC 00FC
        DECLE   $00FC,  $00F8,  $00F8,  $00F8   ; 5D46   00FC 00F8 00F8 00F8
        DECLE   $00FC,  $00FC,  $007C,  $007C   ; 5D4A   00FC 00FC 007C 007C
        DECLE   $0038,  $0007,  $00E0,  $0070   ; 5D4E   0038 0007 00E0 0070
        DECLE   $0078,  $00FC,  $00FC,  $00FC   ; 5D52   0078 00FC 00FC 00FC
        DECLE   $00FC,  $007E,  $003E,  $003E   ; 5D56   00FC 007E 003E 003E
        DECLE   $003E,  $007E,  $007C,  $007C   ; 5D5A   003E 007E 007C 007C
        DECLE   $0038,  $0018,  $00EE,  $001C   ; 5D5E   0038 0018 00EE 001C
        DECLE   $003E,  $0016,  $003F,  $001F   ; 5D62   003E 0016 003F 001F
        DECLE   $000F,  $000F,  $000F,  $001F   ; 5D66   000F 000F 000F 001F
        DECLE   $003F,  $003E,  $003E,  $001C   ; 5D6A   003F 003E 003E 001C
        DECLE   $0002,  $00EE,  $0000,  $0018   ; 5D6E   0002 00EE 0000 0018
        DECLE   $003C,  $007C,  $002C,  $007E   ; 5D72   003C 007C 002C 007E
        DECLE   $007E,  $003E,  $003E,  $001F   ; 5D76   007E 003E 003E 001F
        DECLE   $001F,  $001F,  $001E,  $0001   ; 5D7A   001F 001F 001E 0001
        DECLE   $0007,  $0010,  $0070,  $0038   ; 5D7E   0007 0010 0070 0038
        DECLE   $007C,  $002C,  $007C,  $007C   ; 5D82   007C 002C 007C 007C
        DECLE   $0078,  $0078,  $007C,  $007E   ; 5D86   0078 0078 007C 007E
        DECLE   $007E,  $007E,  $003E,  $001C   ; 5D8A   007E 007E 003E 001C
        DECLE   $0000,  $0002,  $00EE,  $0038   ; 5D8E   0000 0002 00EE 0038
        DECLE   $003C,  $007E,  $002E,  $007E   ; 5D92   003C 007E 002E 007E
        DECLE   $007E,  $003F,  $003F,  $001F   ; 5D96   007E 003F 003F 001F
        DECLE   $001F,  $003F,  $003E,  $00FE   ; 5D9A   001F 003F 003E 00FE
        DECLE   $001C,  $0002,  $000E,  $0018   ; 5D9E   001C 0002 000E 0018
        DECLE   $003C,  $007E,  $00FF,  $00EB   ; 5DA2   003C 007E 00FF 00EB
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DA6   00FF 00FF 00FF 00FF
        DECLE   $00E7,  $007E,  $007E,  $003C   ; 5DAA   00E7 007E 007E 003C
        DECLE   $0000,  $0026,  $0060,  $0018   ; 5DAE   0000 0026 0060 0018
        DECLE   $003C,  $007E,  $00FF,  $00EB   ; 5DB2   003C 007E 00FF 00EB
        DECLE   $00FF,  $00FF,  $00FF,  $00E7   ; 5DB6   00FF 00FF 00FF 00E7
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5DBA   00FF 007E 007E 003C
        DECLE   $0000,  $0064,  $0006,  $0000   ; 5DBE   0000 0064 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC2   0000 0000 0000 0000
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5DC6   003C 007E 00FF 00FF
        DECLE   $007E,  $003C,  $0000,  $0006   ; 5DCA   007E 003C 0000 0006
        DECLE   $0000,  $0000,  $0060,  $0000   ; 5DCE   0000 0000 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5DD6   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0060   ; 5DDA   0000 0000 0000 0060
        DECLE   $0000,  $0000,  $0006,  $0000   ; 5DDE   0000 0000 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE2   0000 0000 0000 0000
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5DE6   003C 007E 00FF 00FF
        DECLE   $007E,  $003C,  $0000,  $0006   ; 5DEA   007E 003C 0000 0006
        DECLE   $0000,  $0000,  $0060,  $0018   ; 5DEE   0000 0000 0060 0018
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5DF2   003C 007E 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DF6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5DFA   00FF 007E 007E 003C
        DECLE   $0000,  $0026,  $0060,  $0018   ; 5DFE   0000 0026 0060 0018
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5E02   003C 007E 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E06   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5E0A   00FF 007E 007E 003C
        DECLE   $0000,  $0064,  $0006,  $0018   ; 5E0E   0000 0064 0006 0018
        DECLE   $003C,  $007E,  $00FF,  $006F   ; 5E12   003C 007E 00FF 006F
        DECLE   $00FF,  $00FF,  $00FF,  $009F   ; 5E16   00FF 00FF 00FF 009F
        DECLE   $00FF,  $007E,  $007E,  $003C   ; 5E1A   00FF 007E 007E 003C
        DECLE   $0000,  $0064,  $0006,  $0018   ; 5E1E   0000 0064 0006 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5E22   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5E26   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; 5E2A   0018 0018 0018 0000
        DECLE   $0070,  $0000,  $000E,  $0003   ; 5E2E   0070 0000 000E 0003
        DECLE   $0003,  $0006,  $0006,  $000C   ; 5E32   0003 0006 0006 000C
        DECLE   $000C,  $0018,  $0018,  $0030   ; 5E36   000C 0018 0018 0030
        DECLE   $0030,  $0060,  $0060,  $0020   ; 5E3A   0030 0060 0060 0020
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5E3E   0060 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5E46   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $000E,  $0000   ; 5E4A   0000 0000 000E 0000
        DECLE   $0070,  $0000,  $0000,  $00C0   ; 5E4E   0070 0000 0000 00C0
        DECLE   $00C0,  $0060,  $0060,  $0030   ; 5E52   00C0 0060 0060 0030
        DECLE   $0030,  $0018,  $0018,  $000C   ; 5E56   0030 0018 0018 000C
        DECLE   $000C,  $0006,  $0006,  $0004   ; 5E5A   000C 0006 0006 0004
        DECLE   $0006,  $0000,  $0000,  $001C   ; 5E5E   0006 0000 0000 001C
        DECLE   $003C,  $007E,  $00FE,  $00FF   ; 5E62   003C 007E 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E66   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $007E,  $003C,  $00DC   ; 5E6A   00FE 007E 003C 00DC
        DECLE   $0008,  $0004,  $0006,  $0038   ; 5E6E   0008 0004 0006 0038
        DECLE   $007C,  $007E,  $00FE,  $00FF   ; 5E72   007C 007E 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E76   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FE,  $0078,  $0034   ; 5E7A   00FE 00FE 0078 0034
        DECLE   $0006,  $0040,  $00C0,  $0038   ; 5E7E   0006 0040 00C0 0038
        DECLE   $007C,  $007E,  $00FF,  $00FF   ; 5E82   007C 007E 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E86   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $003E,  $00DC   ; 5E8A   00FF 007F 003E 00DC
        DECLE   $0008,  $0004,  $0006,  $0038   ; 5E8E   0008 0004 0006 0038
        DECLE   $007C,  $007C,  $00FE,  $00FE   ; 5E92   007C 007C 00FE 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E96   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $0078,  $0034   ; 5E9A   00FF 00FE 0078 0034
        DECLE   $0046,  $0040,  $00C0,  $0000   ; 5E9E   0046 0040 00C0 0000
        DECLE   $0006,  $0006,  $0003,  $0003   ; 5EA2   0006 0006 0003 0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5EA6   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5EAE   0000 0000 0000 0018
        DECLE   $001C,  $000E,  $0006,  $0000   ; 5EB2   001C 000E 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 5EBE   0000 0000 0000 0038
        DECLE   $007C,  $0078,  $0030,  $0000   ; 5EC2   007C 0078 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5EE2   0000 0000 0010 0038
        DECLE   $0038,  $003C,  $003C,  $0018   ; 5EE6   0038 003C 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF2   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $003C,  $0018   ; 5EF6   0018 003C 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5F02   0000 0000 0010 0038
        DECLE   $0038,  $003C,  $003C,  $0018   ; 5F06   0038 003C 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5F12   0000 0000 0000 0018
        DECLE   $0038,  $003C,  $003C,  $0018   ; 5F16   0038 003C 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; 5F1E   0000 0000 0000 001C
        DECLE   $003C,  $003E,  $007E,  $00FF   ; 5F22   003C 003E 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 5F26   00FF 00FF 00FF 007F
        DECLE   $007F,  $003E,  $003E,  $0018   ; 5F2A   007F 003E 003E 0018
        DECLE   $0064,  $0004,  $000C,  $0038   ; 5F2E   0064 0004 000C 0038
        DECLE   $0038,  $007C,  $007C,  $00FE   ; 5F32   0038 007C 007C 00FE
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 5F36   00FE 00FF 00FF 00FF
        DECLE   $00FE,  $0078,  $0074,  $000C   ; 5F3A   00FE 0078 0074 000C
        DECLE   $0020,  $0020,  $0060,  $0018   ; 5F3E   0020 0020 0060 0018
        DECLE   $0038,  $003C,  $007C,  $007C   ; 5F42   0038 003C 007C 007C
        DECLE   $00FE,  $00FE,  $00FF,  $00FF   ; 5F46   00FE 00FE 00FF 00FF
        DECLE   $007F,  $007E,  $007C,  $0038   ; 5F4A   007F 007E 007C 0038
        DECLE   $00D4,  $0004,  $000C,  $0030   ; 5F4E   00D4 0004 000C 0030
        DECLE   $0078,  $007C,  $00FC,  $00FE   ; 5F52   0078 007C 00FC 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 5F56   00FE 00FE 00FE 00FE
        DECLE   $00FE,  $00FC,  $007C,  $0038   ; 5F5A   00FE 00FC 007C 0038
        DECLE   $0004,  $004C,  $00C0,  $0000   ; 5F5E   0004 004C 00C0 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; 5F62   0000 0000 0018 0018
        DECLE   $003C,  $003C,  $0038,  $0018   ; 5F66   003C 003C 0038 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 5F72   0000 0000 0000 0060
        DECLE   $00F0,  $00F0,  $00E0,  $0020   ; 5F76   00F0 00F0 00E0 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 5F82   0000 0000 0000 0060
        DECLE   $0060,  $00E0,  $00E0,  $00E0   ; 5F86   0060 00E0 00E0 00E0
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5F8A   0060 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5F92   0000 0000 0000 0010
        DECLE   $0030,  $0078,  $0078,  $0038   ; 5F96   0030 0078 0078 0038
        DECLE   $0030,  $0000,  $0000,  $0000   ; 5F9A   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5F9E   0000 0000 0000 0080
        DECLE   $0080,  $0080,  $0080,  $0090   ; 5FA2   0080 0080 0080 0090
        DECLE   $00A8,  $0028,  $0028,  $0028   ; 5FA6   00A8 0028 0028 0028
        DECLE   $002A,  $0015,  $0005,  $0005   ; 5FAA   002A 0015 0005 0005
        DECLE   $0005,  $0005,  $0002,  $00E0   ; 5FAE   0005 0005 0002 00E0
        DECLE   $0080,  $00C0,  $0020,  $00A0   ; 5FB2   0080 00C0 0020 00A0
        DECLE   $0050,  $0028,  $0028,  $0028   ; 5FB6   0050 0028 0028 0028
        DECLE   $0028,  $0014,  $000A,  $000A   ; 5FBA   0028 0014 000A 000A
        DECLE   $000A,  $000A,  $0004,  $0020   ; 5FBE   000A 000A 0004 0020
        DECLE   $0060,  $0020,  $0024,  $002A   ; 5FC2   0060 0020 0024 002A
        DECLE   $002A,  $002A,  $000A,  $000A   ; 5FC6   002A 002A 000A 000A
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5FCA   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5FCE   0000 0000 0000 0040
        DECLE   $00A0,  $0020,  $0064,  $00CA   ; 5FD2   00A0 0020 0064 00CA
        DECLE   $008A,  $00EA,  $000A,  $000A   ; 5FD6   008A 00EA 000A 000A
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5FDA   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5FDE   0000 0000 0000 0080
        DECLE   $00A0,  $00A0,  $00A4,  $00EA   ; 5FE2   00A0 00A0 00A4 00EA
        DECLE   $002A,  $002A,  $000A,  $000A   ; 5FE6   002A 002A 000A 000A
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5FEA   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5FEE   0000 0000 0000 0040
        DECLE   $00A0,  $00A0,  $0044,  $00AA   ; 5FF2   00A0 00A0 0044 00AA
        DECLE   $00AA,  $00AA,  $004A,  $000A   ; 5FF6   00AA 00AA 004A 000A
        DECLE   $0004,  $0000,  $0000,  $0000   ; 5FFA   0004 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6002   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $00A0,  $00A0   ; 6006   0000 0040 00A0 00A0
        DECLE   $00A4,  $00AA,  $00AA,  $004A   ; 600A   00A4 00AA 00AA 004A
        DECLE   $000A,  $000A,  $0004           ; 600E   000A 000A 0004
.GFX_LIST_6011:
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; 6011  CART PIC #00
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; 6015  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6019  CART PIC #01
        DECLE   $0007,  $001F,  $007F,  $00FF   ; 601D  
        DECLE   $0000,  $0000,  $0000,  $001D   ; 6021  CART PIC #02
        DECLE   $006F,  $00DD,  $00FF,  $006C   ; 6025  
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6029  CART PIC #03
        DECLE   $00D9,  $00F6,  $006D,  $0077   ; 602D  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6031  CART PIC #04
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 6035  
        DECLE   $0000,  $0000,  $0000,  $0042   ; 6039  CART PIC #05
        DECLE   $00EB,  $0057,  $00BD,  $006A   ; 603D  
        DECLE   $0000,  $0000,  $0000,  $0007   ; 6041  CART PIC #06
        DECLE   $001F,  $007F,  $00FF,  $00FF   ; 6045  
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6049  CART PIC #07
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 604D  
        DECLE   $0042,  $00EB,  $0057,  $006A   ; 6051  CART PIC #08
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6055  
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 6059  CART PIC #09
        DECLE   $0000,  $0000,  $0000,  $0000   ; 605D  
        DECLE   $0007,  $001F,  $007F,  $00FF   ; 6061  CART PIC #0A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6065  
        DECLE   $006F,  $00DD,  $00BB,  $006C   ; 6069  CART PIC #0B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 606D  
        DECLE   $00FF,  $00D9,  $00F6,  $009F   ; 6071  CART PIC #0C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6075  
        DECLE   $0000,  $0000,  $0007,  $001F   ; 6079  CART PIC #0D
        DECLE   $007F,  $00FF,  $00FF,  $0000   ; 607D  
        DECLE   $0000,  $001D,  $006F,  $00DD   ; 6081  CART PIC #0E
        DECLE   $00BB,  $007D,  $001F,  $0000   ; 6085  
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6089  CART PIC #0F
        DECLE   $00FF,  $00FF,  $00FE,  $0000   ; 608D  
        DECLE   $0000,  $00FF,  $00D9,  $00F6   ; 6091  CART PIC #10
        DECLE   $006D,  $009F,  $00FF,  $0000   ; 6095  
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6099  CART PIC #11
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 609D  
        DECLE   $0000,  $0040,  $00C2,  $00EB   ; 60A1  CART PIC #12
        DECLE   $0057,  $00BD,  $0077,  $0060   ; 60A5  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60A9  CART PIC #13
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 60AD  
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 60B1  CART PIC #14
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 60B5  
        DECLE   $0000,  $0038,  $0044,  $0054   ; 60B9  CART PIC #15
        DECLE   $0044,  $005C,  $005C,  $007C   ; 60BD  
        DECLE   $0000,  $0000,  $00DE,  $00EE   ; 60C1  CART PIC #16
        DECLE   $007C,  $007C,  $007C,  $0000   ; 60C5  
        DECLE   $0008,  $001C,  $003E,  $003E   ; 60C9  CART PIC #17
        DECLE   $003E,  $003E,  $003E,  $003E   ; 60CD  
        DECLE   $0000,  $00FE,  $009D,  $00AD   ; 60D1  CART PIC #18
        DECLE   $009D,  $00AD,  $009E,  $007C   ; 60D5  
        DECLE   $00FF,  $00E7,  $00EB,  $00E7   ; 60D9  CART PIC #19
        DECLE   $00EB,  $0066,  $007E,  $0000   ; 60DD  
        DECLE   $0000,  $0000,  $0002,  $0016   ; 60E1  CART PIC #1A
        DECLE   $00D4,  $006D,  $00FA,  $005F   ; 60E5  
        DECLE   $00FE,  $007C,  $0038,  $0038   ; 60E9  CART PIC #1B
        DECLE   $0038,  $0000,  $0000,  $0000   ; 60ED  
        DECLE   $0000,  $0000,  $0000,  $0006   ; 60F1  CART PIC #1C
        DECLE   $001C,  $0038,  $007C,  $00FE   ; 60F5  
        DECLE   $003C,  $0042,  $0099,  $00A1   ; 60F9  CART PIC #1D
        DECLE   $00A1,  $0099,  $0042,  $003C   ; 60FD  
L_6101:
        PSHR    R5                              ; 6101   0275
        CLRR    R2                              ; 6102   01D2
        TSTR    R0                              ; 6103   0080
        BMI     L_6111                          ; 6104   020B 000B

        MOVR    R0,     R1                      ; 6106   0081
        ADDI    #$0002, R1                      ; 6107   02F9 0002
        ANDI    #$000F, R1                      ; 6109   03B9 000F
        SLR     R1,     2                       ; 610B   0065
        SDBD                                    ; 610C   0001
        ADDI    #$6114, R1                      ; 610D   02F9 0014 0061
        MVI@    R1,     R2                      ; 6110   028A
L_6111:
        MVO     R2,     G_0160                  ; 6111   0242 0160
        PULR    R7                              ; 6113   02B7

        DECLE   $0008,  $0001,  $0004           ; 6114   0008 0001 0004

        EIS                                     ; 6117   0002
L_6118:
        PSHR    R5                              ; 6118   0275
        MVI     G_0176, R0                      ; 6119   0280 0176
        ANDI    #$0001, R0                      ; 611B   03B8 0001
        BNEQ    L_62B5                          ; 611D   020C 0196

        MVI     G_015F, R0                      ; 611F   0280 015F
        MVII    #$031D, R1                      ; 6121   02B9 031D

        JSR     R5,     .EXEC.777               ; 6123   0004 0114 0377

        TSTR    R0                              ; 6126   0080
        BEQ     L_6133                          ; 6127   0204 000A

        MVO     R0,     G_0161                  ; 6129   0240 0161
        MVI     G_0322, R4                      ; 612B   0284 0322
        MVII    #$0004, R5                      ; 612D   02BD 0004
        INCR    R4                              ; 612F   000C
        CMPR    R5,     R4                      ; 6130   016C
        BLT     L_6134                          ; 6131   0205 0001

L_6133:
        CLRR    R4                              ; 6133   01E4
L_6134:
        MVO     R4,     G_0322                  ; 6134   0244 0322
        MVO     R4,     G_032A                  ; 6136   0244 032A
        TSTR    R0                              ; 6138   0080
        BEQ     L_6178                          ; 6139   0204 003D

        CMPI    #$0003, R0                      ; 613B   0378 0003
        BLT     L_6167                          ; 613D   0205 0028

        MVI     G_031D, R1                      ; 613F   0281 031D
        SDBD                                    ; 6141   0001
        ANDI    #$FDFF, R1                      ; 6142   03B9 00FF 00FD
        MVI     G_0325, R4                      ; 6145   0284 0325
        SDBD                                    ; 6147   0001
        ANDI    #$FDFF, R4                      ; 6148   03BC 00FF 00FD
        SLR     R0,     1                       ; 614B   0060
        SUBI    #$0003, R0                      ; 614C   0338 0003
        BMI     L_6154                          ; 614E   020B 0004

        XORI    #$0200, R1                      ; 6150   03F9 0200
        XORI    #$0200, R4                      ; 6152   03FC 0200
L_6154:
        MVO     R1,     G_031D                  ; 6154   0241 031D
        MVO     R4,     G_0325                  ; 6156   0244 0325
        SDBD                                    ; 6158   0001
        MVII    #$5557, R4                      ; 6159   02BC 0057 0055
        MVO     R4,     G_031E                  ; 615C   0244 031E
        SDBD                                    ; 615E   0001
        MVII    #$5550, R4                      ; 615F   02BC 0050 0055
        MVO     R4,     G_0326                  ; 6162   0244 0326
        ADDR    R0,     R2                      ; 6164   00C2
        B       L_6196                          ; 6165   0200 002F

L_6167:
        ANDI    #$0001, R4                      ; 6167   03BC 0001
        BNEQ    L_6196                          ; 6169   020C 002B

        SLL     R0,     1                       ; 616B   0048
        SUBI    #$0003, R0                      ; 616C   0338 0003
        BPL     L_6178                          ; 616E   0203 0008

        SDBD                                    ; 6170   0001
        MVII    #$5542, R4                      ; 6171   02BC 0042 0055
        MVO     R4,     G_031E                  ; 6174   0244 031E
        B       L_617E                          ; 6176   0200 0006

L_6178:
        SDBD                                    ; 6178   0001
        MVII    #$5549, R4                      ; 6179   02BC 0049 0055
        MVO     R4,     G_031E                  ; 617C   0244 031E
L_617E:
        SDBD                                    ; 617E   0001
        MVII    #$553B, R4                      ; 617F   02BC 003B 0055
        MVO     R4,     G_0326                  ; 6182   0244 0326
        ADDR    R0,     R3                      ; 6184   00C3
        ADDR    R0,     R3                      ; 6185   00C3
        MVI     G_031D, R1                      ; 6186   0281 031D
        SDBD                                    ; 6188   0001
        ANDI    #$FDFF, R1                      ; 6189   03B9 00FF 00FD
        MVO     R1,     G_031D                  ; 618C   0241 031D
        MVI     G_0325, R1                      ; 618E   0281 0325
        SDBD                                    ; 6190   0001
        ANDI    #$FDFF, R1                      ; 6191   03B9 00FF 00FD
        MVO     R1,     G_0325                  ; 6194   0241 0325
L_6196:
        PSHR    R3                              ; 6196   0273
        SWAP    R3,     1                       ; 6197   0043
        NOP                                     ; 6198   0034
        MVO     R3,     G_0320                  ; 6199   0243 0320
        MVO     R3,     G_0328                  ; 619B   0243 0328
        PULR    R3                              ; 619D   02B3
        PSHR    R2                              ; 619E   0272
        SWAP    R2,     1                       ; 619F   0042
        NOP                                     ; 61A0   0034
        MVO     R2,     G_031F                  ; 61A1   0242 031F
        MVO     R2,     G_0327                  ; 61A3   0242 0327
        PULR    R2                              ; 61A5   02B2
        MOVR    R2,     R0                      ; 61A6   0090
        MOVR    R3,     R1                      ; 61A7   0099
        ANDI    #$0007, R0                      ; 61A8   03B8 0007
        BNEQ    L_62B6                          ; 61AA   020C 010A

        ANDI    #$0007, R1                      ; 61AC   03B9 0007
        BNEQ    L_62B6                          ; 61AE   020C 0106

        JSR     R5,     L_6961                  ; 61B0   0004 0168 0161

        PSHR    R3                              ; 61B3   0273
        MOVR    R1,     R3                      ; 61B4   008B
        SLL     R2,     1                       ; 61B5   004A
        ADDR    R2,     R3                      ; 61B6   00D3
        MVII    #$017F, R4                      ; 61B7   02BC 017F
        ADD     G_015D, R4                      ; 61B9   02C4 015D
        ADD     G_015D, R4                      ; 61BB   02C4 015D
L_61BD:
        MVI@    R4,     R2                      ; 61BD   02A2
        ADDI    #$0003, R4                      ; 61BE   02FC 0003
        SUBR    R3,     R2                      ; 61C0   011A
        CMPI    #$0001, R2                      ; 61C1   037A 0001
        BGE     L_6260                          ; 61C3   020D 009B

        SDBD                                    ; 61C5   0001
        CMPI    #$FFFE, R2                      ; 61C6   037A 00FE 00FF
        BLT     L_6260                          ; 61C9   0205 0095

        MVI     G_015F, R0                      ; 61CB   0280 015F
        TSTR    R0                              ; 61CD   0080
        BEQ     L_61D4                          ; 61CE   0204 0004

        CMPI    #$0004, R0                      ; 61D0   0378 0004
        BLT     L_62A0                          ; 61D2   0205 00CC

L_61D4:
        MOVR    R4,     R1                      ; 61D4   00A1
        SUBI    #$0003, R1                      ; 61D5   0339 0003
        MVI@    R1,     R4                      ; 61D7   028C
        NEGR    R2                              ; 61D8   0022
        PSHR    R2                              ; 61D9   0272
        MVII    #$0008, R0                      ; 61DA   02B8 0008
        INCR    R2                              ; 61DC   000A
L_61DD:
        SLR     R0,     1                       ; 61DD   0060
        DECR    R2                              ; 61DE   0012
        BNEQ    L_61DD                          ; 61DF   022C 0003

        PULR    R2                              ; 61E1   02B2
        ANDR    R0,     R4                      ; 61E2   0184
        BNEQ    L_62A0                          ; 61E3   020C 00BB

        XOR@    R1,     R0                      ; 61E5   03C8
        MVO@    R0,     R1                      ; 61E6   0248
        CMPI    #$0007, R0                      ; 61E7   0378 0007
        BNEQ    L_6246                          ; 61E9   020C 005B

        SUBI    #$017F, R1                      ; 61EB   0339 017F

        JSR     R5,     L_662D                  ; 61ED   0004 0164 022D

        ADDI    #$017E, R1                      ; 61F0   02F9 017E
        PSHR    R1                              ; 61F2   0271
        PSHR    R2                              ; 61F3   0272
        PSHR    R3                              ; 61F4   0273
        MVI@    R1,     R1                      ; 61F5   0289

        JSR     R5,     L_6306                  ; 61F6   0004 0160 0306

        CLRR    R5                              ; 61F9   01ED
        MVII    #$0330, R2                      ; 61FA   02BA 0330
L_61FC:
        MVI@    R2,     R3                      ; 61FC   0293
        SWAP    R3,     1                       ; 61FD   0043
        ANDI    #$00FF, R3                      ; 61FE   03BB 00FF
        SUBR    R0,     R3                      ; 6200   0103
        CMPI    #$0002, R3                      ; 6201   037B 0002
        BGT     L_623B                          ; 6203   020E 0036

        SDBD                                    ; 6205   0001
        CMPI    #$FFFF, R3                      ; 6206   037B 00FF 00FF
        BLT     L_623B                          ; 6209   0205 0030

        DECR    R2                              ; 620B   0012
        MVI@    R2,     R3                      ; 620C   0293
        INCR    R2                              ; 620D   000A
        SWAP    R3,     1                       ; 620E   0043
        ANDI    #$00FF, R3                      ; 620F   03BB 00FF
        SUBR    R1,     R3                      ; 6211   010B
        BMI     L_623B                          ; 6212   020B 0027

        CMPI    #$0014, R3                      ; 6214   037B 0014
        BGT     L_623B                          ; 6216   020E 0023

        MVII    #$01D9, R4                      ; 6218   02BC 01D9
        ADDR    R5,     R4                      ; 621A   00EC
        PSHR    R3                              ; 621B   0273
        MVI@    R4,     R3                      ; 621C   02A3
        DECR    R4                              ; 621D   0014
        CMPI    #$0010, R3                      ; 621E   037B 0010
        BEQ     L_6226                          ; 6220   0204 0004

        CMPI    #$0008, R3                      ; 6222   037B 0008
        BNEQ    L_623A                          ; 6224   020C 0014

L_6226:
        SWAP    R0,     1                       ; 6226   0040
        MVO@    R0,     R2                      ; 6227   0250
        SWAP    R0,     1                       ; 6228   0040
        MVI     G_01E6, R3                      ; 6229   0283 01E6
        ADDI    #$0020, R3                      ; 622B   02FB 0020
        MVO@    R3,     R4                      ; 622D   0263
        PSHR    R0                              ; 622E   0270
        PSHR    R1                              ; 622F   0271
        NOP                                     ; 6230   0034
        PSHR    R2                              ; 6231   0272
        PSHR    R5                              ; 6232   0275

        JSR     R5,     L_6B6A                  ; 6233   0004 0168 036A

        PULR    R5                              ; 6236   02B5
        PULR    R2                              ; 6237   02B2
        PULR    R1                              ; 6238   02B1
        PULR    R0                              ; 6239   02B0
L_623A:
        PULR    R3                              ; 623A   02B3
L_623B:
        ADDI    #$0008, R2                      ; 623B   02FA 0008
        INCR    R5                              ; 623D   000D
        CMPI    #$0006, R5                      ; 623E   037D 0006
        BLT     L_61FC                          ; 6240   0225 0045

        PULR    R3                              ; 6242   02B3
        PULR    R2                              ; 6243   02B2
        PULR    R1                              ; 6244   02B1
        INCR    R1                              ; 6245   0009
L_6246:
        SUBI    #$0180, R1                      ; 6246   0339 0180
        SLR     R1,     2                       ; 6248   0065
        SLR     R1,     2                       ; 6249   0065
        SLL     R1,     2                       ; 624A   004D
        SLL     R1,     2                       ; 624B   004D
        NOP                                     ; 624C   0034
        SLL     R2,     1                       ; 624D   004A
        ADDR    R2,     R1                      ; 624E   00D1
        SDBD                                    ; 624F   0001
        ADDI    #$56F1, R1                      ; 6250   02F9 00F1 0056
        XORR    R1,     R4                      ; 6253   01CC
        XORR    R4,     R1                      ; 6254   01E1
        XORR    R1,     R4                      ; 6255   01CC
        SDBD                                    ; 6256   0001
        MVI@    R4,     R0                      ; 6257   02A0
        ADDI    #$0200, R3                      ; 6258   02FB 0200
        MVO@    R0,     R3                      ; 625A   0258

        JSR     R5,     L_6F41                  ; 625B   0004 016C 0341

        B       L_62A0                          ; 625E   0200 0040

L_6260:
        CMPI    #$01CE, R4                      ; 6260   037C 01CE
        BLT     L_61BD                          ; 6262   0225 00A6

        MVI     G_0176, R0                      ; 6264   0280 0176
        CMPI    #$0004, R0                      ; 6266   0378 0004
        BNEQ    L_62A0                          ; 6268   020C 0036

        MVII    #$016F, R2                      ; 626A   02BA 016F
        ADD     G_015D, R2                      ; 626C   02C2 015D
        MVI@    R2,     R2                      ; 626E   0292
        SDBD                                    ; 626F   0001
        ADDI    #$66B8, R2                      ; 6270   02FA 00B8 0066
        MVI@    R2,     R0                      ; 6273   0290
        CMPR    R0,     R3                      ; 6274   0143
        BNEQ    L_62A0                          ; 6275   020C 0029

        CLRR    R0                              ; 6277   01C0
        MVO     R0,     G_0176                  ; 6278   0240 0176
        ADDI    #$0200, R3                      ; 627A   02FB 0200
        SDBD                                    ; 627C   0001
        MVII    #$0801, R0                      ; 627D   02B8 0001 0008
        MVO@    R0,     R3                      ; 6280   0258
        MVII    #$016F, R2                      ; 6281   02BA 016F
        ADD     G_015D, R2                      ; 6283   02C2 015D
        MVI@    R2,     R2                      ; 6285   0292
        CMPI    #$0005, R2                      ; 6286   037A 0005
        BGT     L_6291                          ; 6288   020E 0007

        ANDI    #$0001, R2                      ; 628A   03BA 0001
        BNEQ    L_6291                          ; 628C   020C 0003

        SUBI    #$0014, R3                      ; 628E   033B 0014
        MVO@    R0,     R3                      ; 6290   0258
L_6291:
        MVII    #$017B, R3                      ; 6291   02BB 017B
        ADD     G_015D, R3                      ; 6293   02C3 015D
        MVI@    R3,     R0                      ; 6295   0298
        INCR    R0                              ; 6296   0008
        MVO@    R0,     R3                      ; 6297   0258
        MVII    #$0032, R0                      ; 6298   02B8 0032

        JSR     R5,     L_6A4B                  ; 629A   0004 0168 024B
        JSR     R5,     L_6C19                  ; 629D   0004 016C 0019

L_62A0:
        PULR    R3                              ; 62A0   02B3
        MOVR    R3,     R2                      ; 62A1   009A
        MVI     G_0160, R0                      ; 62A2   0280 0160
        TSTR    R0                              ; 62A4   0080
        BEQ     L_62AA                          ; 62A5   0204 0003

        ANDR    R0,     R3                      ; 62A7   0183
        BEQ     L_62AD                          ; 62A8   0204 0003

L_62AA:
        MVO     R0,     G_015F                  ; 62AA   0240 015F
        PULR    R7                              ; 62AC   02B7

L_62AD:
        MVI     G_015F, R0                      ; 62AD   0280 015F
        TSTR    R0                              ; 62AF   0080
        BEQ     L_62DD                          ; 62B0   0204 002B

        ANDR    R2,     R0                      ; 62B2   0190
        BEQ     L_62AA                          ; 62B3   0224 000A
L_62B5:
        PULR    R7                              ; 62B5   02B7

L_62B6:
        ANDI    #$0003, R0                      ; 62B6   03B8 0003
        BNEQ    L_62C3                          ; 62B8   020C 0009

        ANDI    #$0003, R1                      ; 62BA   03B9 0003
        BNEQ    L_62C3                          ; 62BC   020C 0005

        MVI     G_0160, R0                      ; 62BE   0280 0160
        TSTR    R0                              ; 62C0   0080
        BEQ     L_62AA                          ; 62C1   0224 0018

L_62C3:
        MVI     G_0160, R0                      ; 62C3   0280 0160
        MVI     G_015F, R1                      ; 62C5   0281 015F
        TSTR    R1                              ; 62C7   0089
        BNEQ    L_62CC                          ; 62C8   020C 0002

        MVI     G_0161, R1                      ; 62CA   0281 0161
L_62CC:
        MVII    #$0003, R5                      ; 62CC   02BD 0003
        CMPI    #$0003, R1                      ; 62CE   0379 0003
        BLT     L_62D4                          ; 62D0   0205 0002

        MVII    #$000C, R5                      ; 62D2   02BD 000C
L_62D4:
        MOVR    R5,     R2                      ; 62D4   00AA
        ANDR    R0,     R5                      ; 62D5   0185
        BNEQ    L_62AA                          ; 62D6   022C 002D

        MVI     G_015F, R1                      ; 62D8   0281 015F
        TSTR    R1                              ; 62DA   0089
        BNEQ    L_62B5                          ; 62DB   022C 0027

L_62DD:
        MVII    #$011F, R1                      ; 62DD   02B9 011F
        ADD     G_015D, R1                      ; 62DF   02C1 015D
        MVI@    R1,     R1                      ; 62E1   0289
        MOVR    R1,     R3                      ; 62E2   008B
        ANDI    #$0040, R3                      ; 62E3   03BB 0040
        BNEQ    L_62B5                          ; 62E5   022C 0031

        ANDI    #$000F, R1                      ; 62E7   03B9 000F
        CMPI    #$0003, R2                      ; 62E9   037A 0003
        BEQ     L_62FE                          ; 62EB   0204 0011

        CMPI    #$000C, R2                      ; 62ED   037A 000C
        BNEQ    L_62B5                          ; 62EF   022C 003B

        MVII    #$0004, R0                      ; 62F1   02B8 0004
        ADDI    #$0004, R1                      ; 62F3   02F9 0004
        ANDI    #$000F, R1                      ; 62F5   03B9 000F
        CMPI    #$0008, R1                      ; 62F7   0379 0008
        BGT     L_62AA                          ; 62F9   022E 0050

L_62FB:
        SLL     R0,     1                       ; 62FB   0048
        B       L_62AA                          ; 62FC   0220 0053

L_62FE:
        MVII    #$0001, R0                      ; 62FE   02B8 0001
        CMPI    #$0008, R1                      ; 6300   0379 0008
        BLE     L_62AA                          ; 6302   0226 0059
        B       L_62FB                          ; 6304   0220 000A

L_6306:
        PSHR    R5                              ; 6306   0275
        MVII    #$0014, R2                      ; 6307   02BA 0014

        JSR     R5,     X_DIV                   ; 6309   0004 011C 01FB

        INCR    R0                              ; 630C   0008
        INCR    R1                              ; 630D   0009
        SLL     R0,     2                       ; 630E   004C
        SLL     R0,     1                       ; 630F   0048
        SLL     R1,     2                       ; 6310   004D
        SLL     R1,     1                       ; 6311   0049
        SUBI    #$0002, R1                      ; 6312   0339 0002
        PULR    R7                              ; 6314   02B7

        PSHR    R5                              ; 6315   0275
        CMPI    #$0001, R0                      ; 6316   0378 0001
        BNEQ    L_637C                          ; 6318   020C 0062

        MVI     G_0176, R0                      ; 631A   0280 0176
        ANDI    #$0001, R0                      ; 631C   03B8 0001
        BNEQ    L_637C                          ; 631E   020C 005C

        MVI     G_015D, R3                      ; 6320   0283 015D
        MVI     G_015E, R2                      ; 6322   0282 015E
        TSTR    R2                              ; 6324   0092
        BNEQ    L_6329                          ; 6325   020C 0002

        MVI     G_01EF, R3                      ; 6327   0283 01EF
L_6329:
        CMPR    R3,     R1                      ; 6329   0159
        BNEQ    L_637C                          ; 632A   020C 0050

        MVII    #$017B, R1                      ; 632C   02B9 017B
        ADD     G_015D, R1                      ; 632E   02C1 015D
        MVI@    R1,     R0                      ; 6330   0288
        TSTR    R0                              ; 6331   0080
        BEQ     L_637D                          ; 6332   0204 0049

        MVII    #$0080, R2                      ; 6334   02BA 0080
        AND     G_01DD, R2                      ; 6336   0382 01DD
        BNEQ    L_637C                          ; 6338   020C 0042

        DECR    R0                              ; 633A   0010
        MVO@    R0,     R1                      ; 633B   0248
        MVII    #$0081, R2                      ; 633C   02BA 0081
        MVO     R2,     G_01DD                  ; 633E   0242 01DD
        MVI     G_031F, R2                      ; 6340   0282 031F
        MVI     G_0320, R3                      ; 6342   0283 0320
        SDBD                                    ; 6344   0001
        MVII    #$0900, R4                      ; 6345   02BC 0000 0009
        MVI     G_015F, R0                      ; 6348   0280 015F
        TSTR    R0                              ; 634A   0080
        BNEQ    L_634F                          ; 634B   020C 0002

        MVI     G_0161, R0                      ; 634D   0280 0161
L_634F:
        CMPI    #$0003, R0                      ; 634F   0378 0003
        BLT     L_635B                          ; 6351   0205 0008

        CMPI    #$0004, R0                      ; 6353   0378 0004
        BNEQ    L_6358                          ; 6355   020C 0001

        NEGR    R4                              ; 6357   0024
L_6358:
        ADDR    R4,     R2                      ; 6358   00E2
        B       L_6361                          ; 6359   0200 0006

L_635B:
        CMPI    #$0001, R0                      ; 635B   0378 0001
        BNEQ    L_6360                          ; 635D   020C 0001

        NEGR    R4                              ; 635F   0024
L_6360:
        ADDR    R4,     R3                      ; 6360   00E3
L_6361:
        SDBD                                    ; 6361   0001
        MVII    #$557A, R0                      ; 6362   02B8 007A 0055
        MVII    #$034E, R4                      ; 6365   02BC 034E
        MVO@    R0,     R4                      ; 6367   0260
        MVO@    R2,     R4                      ; 6368   0262
        MVO@    R3,     R4                      ; 6369   0263
        INCR    R4                              ; 636A   000C
        MVII    #$0200, R0                      ; 636B   02B8 0200
        MVO@    R0,     R4                      ; 636D   0260
        MVII    #$000A, R0                      ; 636E   02B8 000A
        MVO@    R0,     R4                      ; 6370   0260
        MVII    #$0006, R0                      ; 6371   02B8 0006

        JSR     R5,     .EXEC.41C               ; 6373   0004 0114 001C
        JSR     R5,     L_6B0E                  ; 6376   0004 0168 030E
        JSR     R5,     L_6BBE                  ; 6379   0004 0168 03BE

L_637C:
        PULR    R7                              ; 637C   02B7

L_637D:
        JSR     R5,     L_6F82                  ; 637D   0004 016C 0382

        PULR    R7                              ; 6380   02B7

        PSHR    R5                              ; 6381   0275
        MVI     G_0176, R4                      ; 6382   0284 0176
        CMPI    #$0009, R4                      ; 6384   037C 0009
        BEQ     L_638C                          ; 6386   0204 0004

        ANDI    #$0001, R4                      ; 6388   03BC 0001
        BNEQ    L_63E0                          ; 638A   020C 0054

L_638C:
        MVII    #$01D7, R2                      ; 638C   02BA 01D7
        ADDR    R0,     R2                      ; 638E   00C2
        MVI@    R2,     R3                      ; 638F   0293
        CMPI    #$0010, R3                      ; 6390   037B 0010
        BNEQ    L_63E0                          ; 6392   020C 004C

        MOVR    R1,     R4                      ; 6394   008C
        MVII    #$0327, R5                      ; 6395   02BD 0327
        ADDI    #$0002, R4                      ; 6397   02FC 0002
        MVI@    R4,     R2                      ; 6399   02A2
        MVI@    R4,     R3                      ; 639A   02A3
        SUB@    R5,     R2                      ; 639B   032A
        SUB@    R5,     R3                      ; 639C   032B
        SDBD                                    ; 639D   0001
        CMPI    #$FC00, R2                      ; 639E   037A 0000 00FC
        BLT     L_63E0                          ; 63A1   0205 003D

        SDBD                                    ; 63A3   0001
        CMPI    #$0400, R2                      ; 63A4   037A 0000 0004
        BGT     L_63E0                          ; 63A7   020E 0037

        MVI     G_0176, R4                      ; 63A9   0284 0176
        CMPI    #$0009, R4                      ; 63AB   037C 0009
        BEQ     L_63BF                          ; 63AD   0204 0010

        SDBD                                    ; 63AF   0001
        CMPI    #$FD00, R3                      ; 63B0   037B 0000 00FD
        BLT     L_63E0                          ; 63B3   0205 002B

        SDBD                                    ; 63B5   0001
        CMPI    #$0500, R3                      ; 63B6   037B 0000 0005
        BGT     L_63E0                          ; 63B9   020E 0025

        MVII    #$0003, R2                      ; 63BB   02BA 0003
        B       L_63C1                          ; 63BD   0200 0002

L_63BF:
        MVII    #$000F, R2                      ; 63BF   02BA 000F
L_63C1:
        MVO     R2,     G_0176                  ; 63C1   0242 0176
        SDBD                                    ; 63C3   0001
        MVII    #$556C, R2                      ; 63C4   02BA 006C 0055
        MVO     R2,     G_031E                  ; 63C7   0242 031E
        SDBD                                    ; 63C9   0001
        MVII    #$5573, R2                      ; 63CA   02BA 0073 0055
        MVO     R2,     G_0326                  ; 63CD   0242 0326
        MVII    #$0130, R2                      ; 63CF   02BA 0130
        MVO     R2,     G_0322                  ; 63D1   0242 0322
        MVO     R2,     G_032A                  ; 63D3   0242 032A
        CMPI    #$0009, R4                      ; 63D5   037C 0009
        BEQ     L_63E0                          ; 63D7   0204 0007

        MVII    #$005A, R2                      ; 63D9   02BA 005A
        MVO     R2,     G_0323                  ; 63DB   0242 0323

        JSR     R5,     L_6C40                  ; 63DD   0004 016C 0040

L_63E0:
        PULR    R7                              ; 63E0   02B7

L_63E1:
        PSHR    R5                              ; 63E1   0275
        CLRR    R0                              ; 63E2   01C0
        MVII    #$01D1, R4                      ; 63E3   02BC 01D1
L_63E5:
        INCR    R0                              ; 63E5   0008
        MVO     R0,     G_01E7                  ; 63E6   0240 01E7
        MVI@    R4,     R3                      ; 63E8   02A3
        MVO     R3,     G_01CF                  ; 63E9   0243 01CF
        MVI@    R4,     R1                      ; 63EB   02A1
        MVO     R1,     G_01D0                  ; 63EC   0241 01D0
        PSHR    R4                              ; 63EE   0274
        TSTR    R3                              ; 63EF   009B
        BEQ     L_653A                          ; 63F0   0204 0148

        CLRR    R0                              ; 63F2   01C0
        DECR    R3                              ; 63F3   0013
        MOVR    R3,     R2                      ; 63F4   009A
        ADDI    #$0180, R3                      ; 63F5   02FB 0180
        MVO@    R0,     R3                      ; 63F7   0258
        DECR    R3                              ; 63F8   0013
        SLR     R2,     2                       ; 63F9   0066
        SLR     R2,     2                       ; 63FA   0066
        MVI@    R3,     R4                      ; 63FB   029C
        CMPI    #$0080, R1                      ; 63FC   0379 0080
        BEQ     L_6415                          ; 63FE   0204 0015

        CMPI    #$0003, R1                      ; 6400   0379 0003
        BGT     L_658C                          ; 6402   020E 0188

        TSTR    R1                              ; 6404   0089
        BNEQ    L_6419                          ; 6405   020C 0012

        PSHR    R1                              ; 6407   0271
        PSHR    R2                              ; 6408   0272
        CLRR    R2                              ; 6409   01D2
        MOVR    R4,     R1                      ; 640A   00A1

L_640B:
        JSR     R5,     L_668A                  ; 640B   0004 0164 028A

        INCR    R2                              ; 640E   000A
        CMPI    #$0003, R2                      ; 640F   037A 0003
        BLT     L_640B                          ; 6411   0225 0007

        PULR    R2                              ; 6413   02B2
        PULR    R1                              ; 6414   02B1
L_6415:
        CLRR    R1                              ; 6415   01C9
        ADDI    #$0014, R4                      ; 6416   02FC 0014
        MVO@    R4,     R3                      ; 6418   025C
L_6419:
        XORI    #$0001, R1                      ; 6419   03F9 0001
        MVO     R1,     G_01D0                  ; 641B   0241 01D0
        SLL     R2,     1                       ; 641D   004A
        ADDR    R1,     R2                      ; 641E   00CA
        SLL     R2,     2                       ; 641F   004E
        SLL     R2,     1                       ; 6420   004A
        SDBD                                    ; 6421   0001
        ADDI    #$56F1, R2                      ; 6422   02FA 00F1 0056
        MOVR    R2,     R4                      ; 6425   0094
        MVI@    R3,     R5                      ; 6426   029D
        ADDI    #$0200, R5                      ; 6427   02FD 0200
        SDBD                                    ; 6429   0001
        MVI@    R4,     R0                      ; 642A   02A0
        MVO@    R0,     R5                      ; 642B   0268
        SDBD                                    ; 642C   0001
        MVI@    R4,     R0                      ; 642D   02A0
        NOP                                     ; 642E   0034
        MVO@    R0,     R5                      ; 642F   0268
        SDBD                                    ; 6430   0001
        MVI@    R4,     R0                      ; 6431   02A0
        MVO@    R0,     R5                      ; 6432   0268
        MVI     G_01E7, R0                      ; 6433   0280 01E7
        MVII    #$01D9, R4                      ; 6435   02BC 01D9
L_6437:
        MVI@    R4,     R5                      ; 6437   02A5
        ANDI    #$00DF, R5                      ; 6438   03BD 00DF
        CMPR    R5,     R0                      ; 643A   0168
        BNEQ    L_644A                          ; 643B   020C 000D

        MOVR    R4,     R2                      ; 643D   00A2
        SUBI    #$01DA, R2                      ; 643E   033A 01DA
        SLL     R2,     1                       ; 6440   004A
        SLL     R2,     2                       ; 6441   004E
        ADDI    #$0330, R2                      ; 6442   02FA 0330
        MVI@    R2,     R5                      ; 6444   0295
        SDBD                                    ; 6445   0001
        ADDI    #$0400, R5                      ; 6446   02FD 0000 0004
        MVO@    R5,     R2                      ; 6449   0255
L_644A:
        CMPI    #$01DF, R4                      ; 644A   037C 01DF
        BLT     L_6437                          ; 644C   0225 0016

        TSTR    R1                              ; 644E   0089
        BNEQ    L_65D0                          ; 644F   020C 017F

        MVI@    R3,     R1                      ; 6451   0299
        ADDI    #$0014, R1                      ; 6452   02F9 0014
        MVII    #$016F, R5                      ; 6454   02BD 016F
        ADD     G_015D, R5                      ; 6456   02C5 015D
        MVI@    R5,     R0                      ; 6458   02A8
        TSTR    R0                              ; 6459   0080
        BNEQ    L_6470                          ; 645A   020C 0014

        MVI     G_01CF, R0                      ; 645C   0280 01CF
        SLR     R0,     2                       ; 645E   0064
        SLR     R0,     2                       ; 645F   0064
        SDBD                                    ; 6460   0001
        MVII    #$646B, R5                      ; 6461   02BD 006B 0064
        ADDR    R0,     R5                      ; 6464   00C5
        MVI@    R5,     R0                      ; 6465   02A8
        CMPR    R0,     R1                      ; 6466   0141
        BLT     L_647A                          ; 6467   0205 0011
        B       L_6474                          ; 6469   0200 0009

        ADDR    R1,     R0                      ; 646B   00C8
        ADDR    R3,     R4                      ; 646C   00DC
        ADDR    R3,     R4                      ; 646D   00DC
        ADDR    R3,     R4                      ; 646E   00DC
        ADDR    R6,     R0                      ; 646F   00F0
L_6470:
        CMPI    #$00F0, R1                      ; 6470   0379 00F0
        BLT     L_647A                          ; 6472   0205 0006

L_6474:
        MVII    #$0020, R5                      ; 6474   02BD 0020
        MVO     R5,     G_01D0                  ; 6476   0245 01D0
        B       L_6484                          ; 6478   0200 000A

L_647A:
        CMPI    #$00DC, R1                      ; 647A   0379 00DC
        BGE     L_653A                          ; 647C   020D 00BC

        JSR     R5,     L_6656                  ; 647E   0004 0164 0256

        TSTR    R0                              ; 6481   0080
        BEQ     L_653A                          ; 6482   0204 00B6

L_6484:
        PSHR    R3                              ; 6484   0273
        PSHR    R1                              ; 6485   0271
        MVII    #$0005, R0                      ; 6486   02B8 0005

        JSR     R5,     L_6A4B                  ; 6488   0004 0168 024B

        CLRR    R4                              ; 648B   01E4
        MVII    #$01DE, R3                      ; 648C   02BB 01DE
L_648E:
        MVI@    R3,     R5                      ; 648E   029D
        ANDI    #$00DF, R5                      ; 648F   03BD 00DF
        MVI     G_01E7, R0                      ; 6491   0280 01E7
        CMPR    R5,     R0                      ; 6493   0168
        BNEQ    L_64C3                          ; 6494   020C 002D

        MVI@    R3,     R5                      ; 6496   029D
        ANDI    #$0020, R5                      ; 6497   03BD 0020
        BEQ     L_64AA                          ; 6499   0204 000F

        MVI     G_01D0, R5                      ; 649B   0285 01D0
        CMPI    #$0020, R5                      ; 649D   037D 0020
        BEQ     L_64AA                          ; 649F   0204 0009

        MVII    #$0004, R5                      ; 64A1   02BD 0004
        MVO     R5,     G_01D0                  ; 64A3   0245 01D0
        MVI@    R3,     R5                      ; 64A5   029D
        ANDI    #$00DF, R5                      ; 64A6   03BD 00DF
        B       L_64C2                          ; 64A8   0200 0018

L_64AA:
        MVI     G_0177, R5                      ; 64AA   0285 0177
        ADDI    #$0041, R5                      ; 64AC   02FD 0041
        MVO     R2,     G_01EA                  ; 64AE   0242 01EA
        MOVR    R3,     R2                      ; 64B0   009A
        SUBI    #$01D9, R2                      ; 64B1   033A 01D9
        SLL     R2,     2                       ; 64B3   004E
        SLL     R2,     1                       ; 64B4   004A
        ADDI    #$032D, R2                      ; 64B5   02FA 032D
        MOVR    R2,     R1                      ; 64B7   0091
        PSHR    R5                              ; 64B8   0275

        JSR     R5,     .EXEC.7AE               ; 64B9   0004 0114 03AE

        PULR    R5                              ; 64BC   02B5
        CMPI    #$01DD, R3                      ; 64BD   037B 01DD
        BEQ     L_64C2                          ; 64BF   0204 0001

        INCR    R4                              ; 64C1   000C
L_64C2:
        MVO@    R5,     R3                      ; 64C2   025D
L_64C3:
        DECR    R3                              ; 64C3   0013
        CMPI    #$01D8, R3                      ; 64C4   037B 01D8
        BGT     L_648E                          ; 64C6   022E 0039

        TSTR    R4                              ; 64C8   00A4
        BEQ     L_64EC                          ; 64C9   0204 0021

        MOVR    R2,     R3                      ; 64CB   0093
        CMPI    #$034D, R3                      ; 64CC   037B 034D
        BNEQ    L_64D2                          ; 64CE   020C 0002

        ADDI    #$0008, R3                      ; 64D0   02FB 0008
L_64D2:
        MOVR    R4,     R2                      ; 64D2   00A2

        JSR     R5,     L_5489                  ; 64D3   0004 0154 0089

        MVII    #$0019, R0                      ; 64D6   02B8 0019
L_64D8:
        SLL     R0,     1                       ; 64D8   0048
        DECR    R2                              ; 64D9   0012
        BNEQ    L_64D8                          ; 64DA   022C 0003

        JSR     R5,     L_6A4B                  ; 64DC   0004 0168 024B

        MVI     G_0177, R5                      ; 64DF   0285 0177
        DECR    R5                              ; 64E1   0015
        SDBD                                    ; 64E2   0001
        CMPI    #$FFFF, R5                      ; 64E3   037D 00FF 00FF
        BGT     L_64EA                          ; 64E6   020E 0002

        MVII    #$0004, R5                      ; 64E8   02BD 0004
L_64EA:
        MVO     R5,     G_0177                  ; 64EA   0245 0177
L_64EC:
        PULR    R1                              ; 64EC   02B1
        PULR    R3                              ; 64ED   02B3
        MVI     G_01D0, R5                      ; 64EE   0285 01D0
        CMPI    #$0020, R5                      ; 64F0   037D 0020
        BEQ     L_654A                          ; 64F2   0204 0056

        TSTR    R5                              ; 64F4   00AD
        BNEQ    L_651F                          ; 64F5   020C 0028

L_64F7:
        SDBD                                    ; 64F7   0001
        MVII    #$56C9, R5                      ; 64F8   02BD 00C9 0056
L_64FB:
        MVI     G_01CF, R2                      ; 64FB   0282 01CF
        SLR     R2,     2                       ; 64FD   0066
        SLR     R2,     2                       ; 64FE   0066
        NOP                                     ; 64FF   0034
        SLL     R2,     2                       ; 6500   004E
        SLL     R2,     1                       ; 6501   004A
        ADDI    #$01EC, R1                      ; 6502   02F9 01EC
        ADDR    R5,     R2                      ; 6504   00EA
        MOVR    R2,     R4                      ; 6505   0094
        MOVR    R1,     R5                      ; 6506   008D
        SDBD                                    ; 6507   0001
        MVI@    R4,     R2                      ; 6508   02A2
        MVO@    R2,     R5                      ; 6509   026A
        NOP                                     ; 650A   0034
        SDBD                                    ; 650B   0001
        MVI@    R4,     R2                      ; 650C   02A2
        MVO@    R2,     R5                      ; 650D   026A
        SDBD                                    ; 650E   0001
        MVI@    R4,     R2                      ; 650F   02A2
        MVO@    R2,     R5                      ; 6510   026A
        CLRR    R0                              ; 6511   01C0
        MVO     R0,     G_01CF                  ; 6512   0240 01CF
        PSHR    R3                              ; 6514   0273
        MVI     G_0176, R3                      ; 6515   0283 0176
        ANDI    #$0001, R3                      ; 6517   03BB 0001
        BNEQ    L_651E                          ; 6519   020C 0003

        JSR     R5,     L_6CAE                  ; 651B   0004 016C 00AE

L_651E:
        PULR    R3                              ; 651E   02B3
L_651F:
        MVI@    R3,     R2                      ; 651F   029A
        ADDI    #$0004, R3                      ; 6520   02FB 0004

        JSR     R5,     L_6644                  ; 6522   0004 0164 0244

        MVI     G_01D0, R2                      ; 6525   0282 01D0
        CMPI    #$0020, R2                      ; 6527   037A 0020
        BEQ     L_6558                          ; 6529   0204 002D

        TSTR    R1                              ; 652B   0089
        BEQ     L_653A                          ; 652C   0204 000C

        JSR     R5,     L_662D                  ; 652E   0004 0164 022D

        MVII    #$0080, R1                      ; 6531   02B9 0080
        MVO@    R1,     R4                      ; 6533   0261
        TSTR    R2                              ; 6534   0092
        BEQ     L_653A                          ; 6535   0204 0003

        SLL     R2,     2                       ; 6537   004E
        MVO     R2,     G_01D0                  ; 6538   0242 01D0
L_653A:
        PULR    R4                              ; 653A   02B4
        SUBI    #$0002, R4                      ; 653B   033C 0002
        MVI     G_01CF, R0                      ; 653D   0280 01CF
        MVO@    R0,     R4                      ; 653F   0260
        MVI     G_01D0, R0                      ; 6540   0280 01D0
        MVO@    R0,     R4                      ; 6542   0260
        MVI     G_01E7, R0                      ; 6543   0280 01E7
        CMPI    #$01D9, R4                      ; 6545   037C 01D9
        BLT     L_63E5                          ; 6547   0225 0163
        PULR    R7                              ; 6549   02B7

L_654A:
        MVII    #$016F, R5                      ; 654A   02BD 016F
        ADD     G_015D, R5                      ; 654C   02C5 015D
        MVI@    R5,     R5                      ; 654E   02AD
        TSTR    R5                              ; 654F   00AD
        BNEQ    L_64F7                          ; 6550   022C 005A

        SDBD                                    ; 6552   0001
        MVII    #$56A1, R5                      ; 6553   02BD 00A1 0056
        B       L_64FB                          ; 6556   0220 005C

L_6558:
        MVII    #$0174, R1                      ; 6558   02B9 0174
        ADD     G_015D, R1                      ; 655A   02C1 015D
        MVI@    R1,     R0                      ; 655C   0288
        INCR    R0                              ; 655D   0008
        MVII    #$016F, R2                      ; 655E   02BA 016F
        ADD     G_015D, R2                      ; 6560   02C2 015D
        MVI@    R2,     R2                      ; 6562   0292
        SDBD                                    ; 6563   0001
        ADDI    #$66A3, R2                      ; 6564   02FA 00A3 0066
        MVI@    R2,     R4                      ; 6567   0294
        CMPR    R4,     R0                      ; 6568   0160
        BNEQ    L_6593                          ; 6569   020C 0028

        CLRR    R0                              ; 656B   01C0
        MVO@    R0,     R1                      ; 656C   0248
        SDBD                                    ; 656D   0001
        MVII    #$555E, R0                      ; 656E   02B8 005E 0055
        MVO     R0,     G_031E                  ; 6571   0240 031E
        SDBD                                    ; 6573   0001
        MVII    #$5565, R0                      ; 6574   02B8 0065 0055
        MVO     R0,     G_0326                  ; 6577   0240 0326
        MVII    #$0090, R0                      ; 6579   02B8 0090
        MVO     R0,     G_0322                  ; 657B   0240 0322
        MVO     R0,     G_032A                  ; 657D   0240 032A
        MVII    #$005A, R0                      ; 657F   02B8 005A
        MVO     R0,     G_0323                  ; 6581   0240 0323
        MVII    #$0001, R0                      ; 6583   02B8 0001
        MVO     R0,     G_0176                  ; 6585   0240 0176

        JSR     R5,     L_6D78                  ; 6587   0004 016C 0178

L_658A:
        MVII    #$0004, R1                      ; 658A   02B9 0004
L_658C:
        SLR     R1,     2                       ; 658C   0065
        DECR    R1                              ; 658D   0011
        SLL     R1,     2                       ; 658E   004D
        MVO     R1,     G_01D0                  ; 658F   0241 01D0
        B       L_653A                          ; 6591   0220 0058

L_6593:
        MVO@    R0,     R1                      ; 6593   0248
        ANDI    #$0003, R0                      ; 6594   03B8 0003
        BNEQ    L_658A                          ; 6596   022C 000D

        MVI     G_0176, R1                      ; 6598   0281 0176
        ANDI    #$0001, R1                      ; 659A   03B9 0001
        BNEQ    L_658A                          ; 659C   022C 0013

        MVII    #$0004, R1                      ; 659E   02B9 0004
        MVO     R1,     G_0176                  ; 65A0   0241 0176
        SDBD                                    ; 65A2   0001
        ADDI    #$0015, R2                      ; 65A3   02FA 0015 0000
        MVI@    R2,     R1                      ; 65A6   0291
        ADDI    #$0200, R1                      ; 65A7   02F9 0200
        SDBD                                    ; 65A9   0001
        SUBI    #$66B8, R2                      ; 65AA   033A 00B8 0066
        SLL     R2,     1                       ; 65AD   004A
        SDBD                                    ; 65AE   0001
        ADDI    #$66AA, R2                      ; 65AF   02FA 00AA 0066
        MVI@    R2,     R3                      ; 65B2   0293
        SDBD                                    ; 65B3   0001
        ADDI    #$0800, R3                      ; 65B4   02FB 0000 0008
        MVO@    R3,     R1                      ; 65B7   024B
        INCR    R2                              ; 65B8   000A
        MVI@    R2,     R3                      ; 65B9   0293
        TSTR    R3                              ; 65BA   009B
        BEQ     L_65C4                          ; 65BB   0204 0007

        SUBI    #$0014, R1                      ; 65BD   0339 0014
        SDBD                                    ; 65BF   0001
        ADDI    #$0800, R3                      ; 65C0   02FB 0000 0008
        MVO@    R3,     R1                      ; 65C3   024B
L_65C4:
        SDBD                                    ; 65C4   0001
        MVII    #$5028, R1                      ; 65C5   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 65C8   0004 0118 0044
        JSR     R5,     L_6BE3                  ; 65CB   0004 0168 03E3

        B       L_658A                          ; 65CE   0220 0045

L_65D0:
        MVI@    R3,     R1                      ; 65D0   0299

        JSR     R5,     L_6306                  ; 65D1   0004 0160 0306

        CLRR    R5                              ; 65D4   01ED
        MVII    #$0330, R2                      ; 65D5   02BA 0330
L_65D7:
        MVI@    R2,     R3                      ; 65D7   0293
        SWAP    R3,     1                       ; 65D8   0043
        ANDI    #$00FF, R3                      ; 65D9   03BB 00FF
        SUBR    R0,     R3                      ; 65DB   0103
        CMPI    #$0009, R3                      ; 65DC   037B 0009
        BGT     L_661D                          ; 65DE   020E 003D

        SDBD                                    ; 65E0   0001
        CMPI    #$FFF8, R3                      ; 65E1   037B 00F8 00FF
        BLE     L_661D                          ; 65E4   0206 0037

        DECR    R2                              ; 65E6   0012
        MVI@    R2,     R3                      ; 65E7   0293
        INCR    R2                              ; 65E8   000A
        SWAP    R3,     1                       ; 65E9   0043
        ANDI    #$00FF, R3                      ; 65EA   03BB 00FF
        SUBR    R1,     R3                      ; 65EC   010B
        BMI     L_661D                          ; 65ED   020B 002E

        CMPI    #$0014, R3                      ; 65EF   037B 0014
        BGT     L_661D                          ; 65F1   020E 002A

        MVII    #$01D9, R3                      ; 65F3   02BB 01D9
        ADDR    R5,     R3                      ; 65F5   00EB
        MVI@    R3,     R4                      ; 65F6   029C
        CMPI    #$0008, R4                      ; 65F7   037C 0008
        BEQ     L_65FF                          ; 65F9   0204 0004

        CMPI    #$0010, R4                      ; 65FB   037C 0010
        BNEQ    L_661D                          ; 65FD   020C 001E

L_65FF:
        MVII    #$0040, R4                      ; 65FF   02BC 0040
        MVO@    R4,     R3                      ; 6601   025C
        MOVR    R5,     R3                      ; 6602   00AB
        SLL     R3,     2                       ; 6603   004F
        SLL     R3,     1                       ; 6604   004B
        CLRR    R4                              ; 6605   01E4
        PSHR    R0                              ; 6606   0270
        PSHR    R2                              ; 6607   0272
        PSHR    R5                              ; 6608   0275
        ADDI    #$032D, R3                      ; 6609   02FB 032D
        CMPI    #$034D, R3                      ; 660B   037B 034D
        BEQ     L_6626                          ; 660D   0204 0017

        JSR     R5,     L_5489                  ; 660F   0004 0154 0089

        MVII    #$000A, R0                      ; 6612   02B8 000A

        JSR     R5,     L_6A4B                  ; 6614   0004 0168 024B
        JSR     R5,     L_6F19                  ; 6617   0004 016C 0319

L_661A:
        PULR    R5                              ; 661A   02B5
        PULR    R2                              ; 661B   02B2
        PULR    R0                              ; 661C   02B0
L_661D:
        ADDI    #$0008, R2                      ; 661D   02FA 0008
        INCR    R5                              ; 661F   000D
        CMPI    #$0006, R5                      ; 6620   037D 0006
        BLT     L_65D7                          ; 6622   0225 004C
        B       L_653A                          ; 6624   0220 00EB

L_6626:
        ADDI    #$0002, R3                      ; 6626   02FB 0002
        MVO@    R4,     R3                      ; 6628   025C
        INCR    R3                              ; 6629   000B
        MVO@    R4,     R3                      ; 662A   025C
        B       L_661A                          ; 662B   0220 0012

L_662D:
        PSHR    R5                              ; 662D   0275
        CLRR    R5                              ; 662E   01ED
        MVII    #$01D1, R4                      ; 662F   02BC 01D1
L_6631:
        MVI@    R4,     R0                      ; 6631   02A0
        INCR    R4                              ; 6632   000C
        INCR    R5                              ; 6633   000D
        TSTR    R0                              ; 6634   0080
        BEQ     L_663E                          ; 6635   0204 0007

        CMPI    #$01D9, R4                      ; 6637   037C 01D9
        BLT     L_6631                          ; 6639   0225 0009

        MVO     R5,     G_01E6                  ; 663B   0245 01E6
        PULR    R7                              ; 663D   02B7

L_663E:
        SUBI    #$0002, R4                      ; 663E   033C 0002
        MVO@    R1,     R4                      ; 6640   0261
        MVO     R5,     G_01E6                  ; 6641   0245 01E6
        PULR    R7                              ; 6643   02B7

L_6644:
        PSHR    R5                              ; 6644   0275
        MOVR    R3,     R4                      ; 6645   009C
L_6646:
        MVI@    R4,     R0                      ; 6646   02A0
        ADDI    #$0003, R4                      ; 6647   02FC 0003
        CMPR    R0,     R2                      ; 6649   0142
        BEQ     L_6652                          ; 664A   0204 0006

        CMPI    #$01CE, R4                      ; 664C   037C 01CE
        BLT     L_6646                          ; 664E   0225 0009

        CLRR    R1                              ; 6650   01C9
        PULR    R7                              ; 6651   02B7

L_6652:
        MOVR    R4,     R1                      ; 6652   00A1
        SUBI    #$0182, R1                      ; 6653   0339 0182
        PULR    R7                              ; 6655   02B7

L_6656:
        PSHR    R5                              ; 6656   0275
        NOP                                     ; 6657   0034
        PSHR    R1                              ; 6658   0271
        PSHR    R2                              ; 6659   0272
        PSHR    R3                              ; 665A   0273
        MOVR    R1,     R3                      ; 665B   008B
        MVII    #$0064, R0                      ; 665C   02B8 0064
        MVII    #$016F, R1                      ; 665E   02B9 016F
        ADD     G_015D, R1                      ; 6660   02C1 015D
        MVI@    R1,     R1                      ; 6662   0289

        JSR     R5,     X_MPY                   ; 6663   0004 011C 01DC

        SDBD                                    ; 6666   0001
        ADDI    #$57E1, R2                      ; 6667   02FA 00E1 0057
        CLRR    R0                              ; 666A   01C0
        SUBI    #$0014, R3                      ; 666B   033B 0014
        BMI     L_6682                          ; 666D   020B 0013

        SARC    R3,     1                       ; 666F   007B
        BC      L_6686                          ; 6670   0201 0014

        ADDR    R2,     R3                      ; 6672   00D3
        MVI@    R3,     R1                      ; 6673   0299
        SLR     R1,     2                       ; 6674   0065
        SLR     R1,     2                       ; 6675   0065
L_6676:
        ANDI    #$000F, R1                      ; 6676   03B9 000F
        CMPI    #$0001, R1                      ; 6678   0379 0001
        BLE     L_6682                          ; 667A   0206 0006

        INCR    R0                              ; 667C   0008
        ANDI    #$0002, R1                      ; 667D   03B9 0002
        BEQ     L_6682                          ; 667F   0204 0001

        INCR    R0                              ; 6681   0008
L_6682:
        PULR    R3                              ; 6682   02B3
        PULR    R2                              ; 6683   02B2
        PULR    R1                              ; 6684   02B1
        PULR    R7                              ; 6685   02B7

L_6686:
        ADDR    R2,     R3                      ; 6686   00D3
        MVI@    R3,     R1                      ; 6687   0299
        B       L_6676                          ; 6688   0220 0013

L_668A:
        PSHR    R5                              ; 668A   0275

        JSR     R5,     L_6656                  ; 668B   0004 0164 0256

        SLL     R0,     2                       ; 668E   004C
        SLL     R0,     1                       ; 668F   0048
        CMPI    #$0008, R0                      ; 6690   0378 0008
        BNEQ    L_6698                          ; 6692   020C 0004

        SDBD                                    ; 6694   0001
        XORI    #$1004, R0                      ; 6695   03F8 0004 0010
L_6698:
        SDBD                                    ; 6698   0001
        XORI    #$0801, R0                      ; 6699   03F8 0001 0008
        ADDI    #$0200, R1                      ; 669C   02F9 0200
        MVO@    R0,     R1                      ; 669E   0248
        SUBI    #$0200, R1                      ; 669F   0339 0200
        INCR    R1                              ; 66A1   0009
        PULR    R7                              ; 66A2   02B7

        DECLE   $000B,  $0010,  $0010,  $000C   ; 66A3   000B 0010 0010 000C
        DECLE   $0010,  $0010,  $0010,  $0152   ; 66A7   0010 0010 0010 0152
        DECLE   $015B,  $014E,  $0000,  $0163   ; 66AB   015B 014E 0000 0163
        DECLE   $016F,  $0142,  $0000,  $0152   ; 66AF   016F 0142 0000 0152
        DECLE   $015B,  $014E,  $0000,  $0142   ; 66B3   015B 014E 0000 0142
        DECLE   $0000                           ; 66B7   0000

        MOVR    R5,     R4                      ; 66B8   00AC
        COMR    R5                              ; 66B9   001D
        MOVR    R2,     R5                      ; 66BA   0095
        SWAP    R2,     1                       ; 66BB   0042
        MOVR    R7,     R6                      ; 66BC   00BE
        SWAP    R2,     2                       ; 66BD   0046
        GSWD    R1                              ; 66BE   0031
L_66BF:
        PSHR    R5                              ; 66BF   0275
        MVI     G_0173, R0                      ; 66C0   0280 0173
        INCR    R0                              ; 66C2   0008
        MVO     R0,     G_0173                  ; 66C3   0240 0173
        PULR    R7                              ; 66C5   02B7

L_66C6:
        PSHR    R5                              ; 66C6   0275
        MVI     G_017A, R0                      ; 66C7   0280 017A
        INCR    R0                              ; 66C9   0008
        ANDI    #$0003, R0                      ; 66CA   03B8 0003
        MVO     R0,     G_017A                  ; 66CC   0240 017A
        MVI     G_0176, R3                      ; 66CE   0283 0176
        ANDI    #$0001, R3                      ; 66D0   03BB 0001
        BNEQ    L_6706                          ; 66D2   020C 0032

        MVII    #$01D9, R4                      ; 66D4   02BC 01D9
L_66D6:
        MVI@    R4,     R0                      ; 66D6   02A0
        TSTR    R0                              ; 66D7   0080
        BEQ     L_66DF                          ; 66D8   0204 0005

        CMPI    #$01DE, R4                      ; 66DA   037C 01DE
        BLT     L_66D6                          ; 66DC   0225 0007
L_66DE:
        PULR    R7                              ; 66DE   02B7

L_66DF:
        DECR    R4                              ; 66DF   0014
        MOVR    R4,     R0                      ; 66E0   00A0
        SUBI    #$01D7, R0                      ; 66E1   0338 01D7

        JSR     R5,     .EXEC.76C               ; 66E3   0004 0114 036C

        ADDI    #$0002, R1                      ; 66E6   02F9 0002
        MVI     G_017A, R0                      ; 66E8   0280 017A
        SLL     R0,     2                       ; 66EA   004C
        MOVR    R0,     R5                      ; 66EB   0085
        SDBD                                    ; 66EC   0001
        ADDI    #$6707, R5                      ; 66ED   02FD 0007 0067
L_66F0:
        MVII    #$0010, R0                      ; 66F0   02B8 0010
        MVO@    R0,     R4                      ; 66F2   0260
        CMPI    #$01DE, R4                      ; 66F3   037C 01DE
        BNEQ    L_66FB                          ; 66F5   020C 0004

        ADDI    #$0008, R1                      ; 66F7   02F9 0008
        B       L_66F0                          ; 66F9   0220 000A

L_66FB:
        MVI@    R5,     R0                      ; 66FB   02A8
        SWAP    R0,     1                       ; 66FC   0040
        MVO@    R0,     R1                      ; 66FD   0248
        MVI@    R5,     R0                      ; 66FE   02A8
        SWAP    R0,     1                       ; 66FF   0040
        INCR    R1                              ; 6700   0009
        MVO@    R0,     R1                      ; 6701   0248
        ADDI    #$0005, R4                      ; 6702   02FC 0005
        MVI@    R5,     R0                      ; 6704   02A8
        MVO@    R0,     R4                      ; 6705   0260
L_6706:
        PULR    R7                              ; 6706   02B7

        DECLE   $0000,  $0040,  $0008,  $0000   ; 6707   0000 0040 0008 0000
        DECLE   $00A8,  $0040,  $0004,  $0000   ; 670B   00A8 0040 0004 0000
        DECLE   $0000,  $0010,  $0008,  $0000   ; 670F   0000 0010 0008 0000
        DECLE   $00A8,  $0018,  $0004,  $0000   ; 6713   00A8 0018 0004 0000
L_6717:
        PSHR    R5                              ; 6717   0275
        MVI     G_0176, R0                      ; 6718   0280 0176
        CMPI    #$0007, R0                      ; 671A   0378 0007
        BEQ     L_672A                          ; 671C   0204 000C

        CMPI    #$0009, R0                      ; 671E   0378 0009
        BEQ     L_672A                          ; 6720   0204 0008

        CMPI    #$001F, R0                      ; 6722   0378 001F
        BEQ     L_6A41                          ; 6724   0204 031B

        ANDI    #$0001, R0                      ; 6726   03B8 0001
        BNEQ    L_6876                          ; 6728   020C 014C

L_672A:
        MVI     G_01DD, R0                      ; 672A   0280 01DD
        CMPI    #$0081, R0                      ; 672C   0378 0081
        BNEQ    L_6733                          ; 672E   020C 0003

        DECR    R0                              ; 6730   0010
        MVO     R0,     G_01DD                  ; 6731   0240 01DD
L_6733:
        MVI     G_01E5, R0                      ; 6733   0280 01E5
        DECR    R0                              ; 6735   0010
        BEQ     L_6886                          ; 6736   0204 014E

        MVO     R0,     G_01E5                  ; 6738   0240 01E5
L_673A:
        MVI     G_0179, R1                      ; 673A   0281 0179
        INCR    R1                              ; 673C   0009
        CMPI    #$0002, R1                      ; 673D   0379 0002
        BNEQ    L_6742                          ; 673F   020C 0001

        CLRR    R1                              ; 6741   01C9
L_6742:
        MVO     R1,     G_0179                  ; 6742   0241 0179
        MVII    #$01D9, R1                      ; 6744   02B9 01D9
L_6746:
        MVI@    R1,     R0                      ; 6746   0288
        CMPI    #$0010, R0                      ; 6747   0378 0010
        BNEQ    L_6871                          ; 6749   020C 0126

        MOVR    R1,     R0                      ; 674B   0088
        SUBI    #$01D7, R0                      ; 674C   0338 01D7
        MOVR    R1,     R4                      ; 674E   008C

        JSR     R5,     .EXEC.772               ; 674F   0004 0114 0372

        MVI@    R1,     R5                      ; 6752   028D
        SDBD                                    ; 6753   0001
        ANDI    #$FDFF, R5                      ; 6754   03BD 00FF 00FD
        ADDI    #$0006, R4                      ; 6757   02FC 0006
        MVI@    R4,     R0                      ; 6759   02A0
        PSHR    R4                              ; 675A   0274
        PSHR    R5                              ; 675B   0275

        JSR     R5,     L_68FC                  ; 675C   0004 0168 00FC

        MVO     R4,     G_01E8                  ; 675F   0244 01E8
        PULR    R5                              ; 6761   02B5
        CMPI    #$0003, R0                      ; 6762   0378 0003
        BLT     L_6770                          ; 6764   0205 000A

        SLR     R0,     1                       ; 6766   0060
        SUBI    #$0003, R0                      ; 6767   0338 0003
        BMI     L_676D                          ; 6769   020B 0002

        XORI    #$0200, R5                      ; 676B   03FD 0200
L_676D:
        ADDR    R0,     R2                      ; 676D   00C2
        B       L_677A                          ; 676E   0200 000A

L_6770:
        ADDI    #$0008, R4                      ; 6770   02FC 0008
        SLL     R0,     1                       ; 6772   0048
        SUBI    #$0003, R0                      ; 6773   0338 0003
        BMI     L_6779                          ; 6775   020B 0002

        ADDI    #$0008, R4                      ; 6777   02FC 0008
L_6779:
        ADDR    R0,     R3                      ; 6779   00C3
L_677A:
        MVO@    R5,     R1                      ; 677A   024D
        INCR    R1                              ; 677B   0009
        SDBD                                    ; 677C   0001
        ADDI    #$6921, R4                      ; 677D   02FC 0021 0069
        SDBD                                    ; 6780   0001
        MVI@    R4,     R5                      ; 6781   02A5
        MVO@    R5,     R1                      ; 6782   024D
        PULR    R4                              ; 6783   02B4
        CMPI    #$01E4, R4                      ; 6784   037C 01E4
        BEQ     L_686E                          ; 6786   0204 00E6

        ADDI    #$0001, R1                      ; 6788   02F9 0001
        SWAP    R2,     1                       ; 678A   0042
        SWAP    R3,     1                       ; 678B   0043
L_678C:
        MVO@    R2,     R1                      ; 678C   024A
        INCR    R1                              ; 678D   0009
        MVO@    R3,     R1                      ; 678E   024B
        CMPI    #$01E5, R4                      ; 678F   037C 01E5
        BNEQ    L_67A2                          ; 6791   020C 000F

        MVI     G_01DD, R5                      ; 6793   0285 01DD
        CMPI    #$0080, R5                      ; 6795   037D 0080
        BEQ     L_67A2                          ; 6797   0204 0009

        SUBI    #$0009, R1                      ; 6799   0339 0009
        DECR    R4                              ; 679B   0014
        MVI@    R4,     R5                      ; 679C   02A5
        SUBI    #$0002, R4                      ; 679D   033C 0002
        MVO@    R5,     R4                      ; 679F   0265
        B       L_678C                          ; 67A0   0220 0015

L_67A2:
        SWAP    R2,     1                       ; 67A2   0042
        SWAP    R3,     1                       ; 67A3   0043
        CMPI    #$01E4, R4                      ; 67A4   037C 01E4
        BNEQ    L_67AB                          ; 67A6   020C 0003

        INCR    R4                              ; 67A8   000C
        ADDI    #$0008, R1                      ; 67A9   02F9 0008
L_67AB:
        MVI     G_0179, R5                      ; 67AB   0285 0179
        TSTR    R5                              ; 67AD   00AD
        BNEQ    L_67D5                          ; 67AE   020C 0025

        PSHR    R4                              ; 67B0   0274
        MVI     G_01E8, R4                      ; 67B1   0284 01E8
        ADDI    #$0002, R1                      ; 67B3   02F9 0002
        MVI@    R1,     R5                      ; 67B5   028D
        INCR    R5                              ; 67B6   000D
        CMPI    #$0002, R4                      ; 67B7   037C 0002
        BNEQ    L_67C1                          ; 67B9   020C 0006

        CMPI    #$0005, R5                      ; 67BB   037D 0005
        BLT     L_67C6                          ; 67BD   0205 0007
        B       L_67C5                          ; 67BF   0200 0004

L_67C1:
        CMPI    #$0004, R5                      ; 67C1   037D 0004
        BLT     L_67C6                          ; 67C3   0205 0001

L_67C5:
        CLRR    R5                              ; 67C5   01ED
L_67C6:
        MVO@    R5,     R1                      ; 67C6   024D
        CMPI    #$0004, R4                      ; 67C7   037C 0004
        BLT     L_67D4                          ; 67C9   0205 0009

        MVI     G_01DD, R4                      ; 67CB   0284 01DD
        CMPI    #$0080, R4                      ; 67CD   037C 0080
        BEQ     L_67D4                          ; 67CF   0204 0003

        SUBI    #$0008, R1                      ; 67D1   0339 0008
        MVO@    R5,     R1                      ; 67D3   024D
L_67D4:
        PULR    R4                              ; 67D4   02B4
L_67D5:
        MVO     R2,     G_01E9                  ; 67D5   0242 01E9
        MVO     R3,     G_01EA                  ; 67D7   0243 01EA
        ANDI    #$0007, R2                      ; 67D9   03BA 0007
        BNEQ    L_686E                          ; 67DB   020C 0091

        ANDI    #$0007, R3                      ; 67DD   03BB 0007
        BNEQ    L_686E                          ; 67DF   020C 008D

        MVI     G_0176, R2                      ; 67E1   0282 0176
        CMPI    #$001F, R2                      ; 67E3   037A 001F
        BEQ     L_67EB                          ; 67E5   0204 0004

        ANDI    #$0001, R2                      ; 67E7   03BA 0001
        BNEQ    L_686E                          ; 67E9   020C 0083

L_67EB:
        MVI     G_01E9, R2                      ; 67EB   0282 01E9
        MVI     G_01EA, R3                      ; 67ED   0283 01EA

        JSR     R5,     L_6961                  ; 67EF   0004 0168 0161

        TSTR    R3                              ; 67F2   009B
        BEQ     L_686E                          ; 67F3   0204 0079

        DECR    R4                              ; 67F5   0014
        MVI@    R4,     R0                      ; 67F6   02A0
        ANDR    R3,     R0                      ; 67F7   0198
        BEQ     L_6880                          ; 67F8   0204 0086

        CMPI    #$0003, R3                      ; 67FA   037B 0003
        BEQ     L_686E                          ; 67FC   0204 0070

        CMPI    #$000C, R3                      ; 67FE   037B 000C
        BEQ     L_686E                          ; 6800   0204 006C

L_6802:
        DECR    R4                              ; 6802   0014
        MVI@    R4,     R0                      ; 6803   02A0
        CMPI    #$0001, R0                      ; 6804   0378 0001
        BEQ     L_680E                          ; 6806   0204 0006

        CMPI    #$0004, R0                      ; 6808   0378 0004
        BEQ     L_680E                          ; 680A   0204 0002

        SLR     R0,     1                       ; 680C   0060
        INCR    R7                              ; 680D   000F

L_680E:
        SLL     R0,     1                       ; 680E   0048
L_680F:
        COMR    R0                              ; 680F   0018
        ANDR    R0,     R3                      ; 6810   0183
        BEQ     L_68C9                          ; 6811   0204 00B6

        MVO     R3,     G_01E7                  ; 6813   0243 01E7
        MVII    #$0171, R1                      ; 6815   02B9 0171
        ADD     G_015D, R1                      ; 6817   02C1 015D
        MVI@    R1,     R0                      ; 6819   0288
        SUBI    #$0001, R0                      ; 681A   0338 0001
        BMI     L_6830                          ; 681C   020B 0012
        BEQ     L_6830                          ; 681E   0204 0010

        SLL     R0,     1                       ; 6820   0048
        NEGR    R0                              ; 6821   0020
        ADDI    #$000D, R0                      ; 6822   02F8 000D
        CMPI    #$0006, R0                      ; 6824   0378 0006
        BGT     L_682A                          ; 6826   020E 0002

        MVII    #$0006, R0                      ; 6828   02B8 0006

L_682A:
        JSR     R5,     X_RAND2                 ; 682A   0004 0114 029E

        TSTR    R0                              ; 682D   0080
        BEQ     L_684C                          ; 682E   0204 001C

L_6830:
        DECR    R4                              ; 6830   0014
        MVI@    R4,     R1                      ; 6831   02A1
        CMPI    #$0003, R1                      ; 6832   0379 0003
        BLT     L_6842                          ; 6834   0205 000C

        JSR     R5,     L_6939                  ; 6836   0004 0168 0139

        BNC     L_6864                          ; 6839   0209 0029

        JSR     R5,     L_68D1                  ; 683B   0004 0168 00D1

        BNC     L_6864                          ; 683E   0209 0024
        B       L_684C                          ; 6840   0200 000A

L_6842:
        JSR     R5,     L_68D1                  ; 6842   0004 0168 00D1

        BNC     L_6864                          ; 6845   0209 001D

        JSR     R5,     L_6939                  ; 6847   0004 0168 0139

        BNC     L_6864                          ; 684A   0209 0018

L_684C:
        MVII    #$0004, R0                      ; 684C   02B8 0004

        JSR     R5,     X_RAND2                 ; 684E   0004 0114 029E

        MOVR    R0,     R1                      ; 6851   0081
        SDBD                                    ; 6852   0001
        ADDI    #$68CD, R1                      ; 6853   02F9 00CD 0068
        MVI@    R1,     R1                      ; 6856   0289
L_6857:
        MOVR    R3,     R2                      ; 6857   009A
        ANDR    R1,     R2                      ; 6858   018A
        BNEQ    L_6864                          ; 6859   020C 0009

        SLL     R1,     1                       ; 685B   0049
        CMPI    #$0010, R1                      ; 685C   0379 0010
        BNEQ    L_6857                          ; 685E   022C 0008

        MVII    #$0001, R1                      ; 6860   02B9 0001
        B       L_6857                          ; 6862   0220 000C

L_6864:
        DECR    R4                              ; 6864   0014
        MVO@    R2,     R4                      ; 6865   0262
        CMPI    #$01E5, R4                      ; 6866   037C 01E5
        BNEQ    L_686E                          ; 6868   020C 0004

        SUBI    #$0002, R4                      ; 686A   033C 0002
        MVO@    R2,     R4                      ; 686C   0262
        INCR    R4                              ; 686D   000C
L_686E:
        SUBI    #$0007, R4                      ; 686E   033C 0007
        MOVR    R4,     R1                      ; 6870   00A1
L_6871:
        INCR    R1                              ; 6871   0009
        CMPI    #$01DF, R1                      ; 6872   0379 01DF
        BLT     L_6746                          ; 6874   0225 012F

L_6876:
        MVI     G_0178, R0                      ; 6876   0280 0178
        TSTR    R0                              ; 6878   0080
        BEQ     L_66DE                          ; 6879   0224 019C

        CLRR    R0                              ; 687B   01C0
        MVO     R0,     G_0178                  ; 687C   0240 0178
        B       L_673A                          ; 687E   0220 0145

L_6880:
        CMPI    #$000C, R3                      ; 6880   037B 000C
        BEQ     L_684C                          ; 6882   0224 0037
        B       L_6802                          ; 6884   0220 0083

L_6886:
        MVI     G_0173, R0                      ; 6886   0280 0173
        SUBI    #$0008, R0                      ; 6888   0338 0008
        BMI     L_6896                          ; 688A   020B 000A

        ADDI    #$0001, R0                      ; 688C   02F8 0001
        CMPI    #$0007, R0                      ; 688E   0378 0007
        BLT     L_6898                          ; 6890   0205 0006

        MVII    #$0007, R0                      ; 6892   02B8 0007
        B       L_6898                          ; 6894   0200 0002

L_6896:
        MVII    #$0000, R0                      ; 6896   02B8 0000
L_6898:
        ADDI    #$0003, R0                      ; 6898   02F8 0003
        MVII    #$0171, R1                      ; 689A   02B9 0171
        ADD     G_015D, R1                      ; 689C   02C1 015D
        MVI@    R1,     R1                      ; 689E   0289
        CMPI    #$0002, R1                      ; 689F   0379 0002
        BLT     L_68A4                          ; 68A1   0205 0001

        INCR    R1                              ; 68A3   0009
L_68A4:
        SLL     R1,     1                       ; 68A4   0049
        ADDR    R1,     R0                      ; 68A5   00C8
        MVI     G_0176, R1                      ; 68A6   0281 0176
        CMPI    #$0007, R1                      ; 68A8   0379 0007
        BLT     L_68B4                          ; 68AA   0205 0008

        MVII    #$0003, R0                      ; 68AC   02B8 0003
        CMPI    #$0009, R1                      ; 68AE   0379 0009
        BNEQ    L_68B4                          ; 68B0   020C 0002

        MVII    #$000B, R0                      ; 68B2   02B8 000B
L_68B4:
        MVO     R0,     G_01E5                  ; 68B4   0240 01E5
        MVII    #$000A, R2                      ; 68B6   02BA 000A
        SUBR    R0,     R2                      ; 68B8   0102
        BPL     L_66DE                          ; 68B9   0223 01DC

        ADDR    R2,     R0                      ; 68BB   00D0
        ADDR    R2,     R0                      ; 68BC   00D0
        CMPI    #$0003, R0                      ; 68BD   0378 0003
        BGT     L_68C3                          ; 68BF   020E 0002

        MVII    #$0003, R0                      ; 68C1   02B8 0003
L_68C3:
        MVO     R0,     G_01E5                  ; 68C3   0240 01E5
        MVO     R0,     G_0178                  ; 68C5   0240 0178
        B       L_673A                          ; 68C7   0220 018E

L_68C9:
        COMR    R0                              ; 68C9   0018
        MOVR    R0,     R2                      ; 68CA   0082
        B       L_6864                          ; 68CB   0220 0068

        DECLE   $0001,  $0002,  $0004           ; 68CD   0001 0002 0004

        INCR    R0                              ; 68D0   0008
L_68D1:
        PSHR    R5                              ; 68D1   0275
        MVI     G_031F, R0                      ; 68D2   0280 031F
        SWAP    R0,     1                       ; 68D4   0040
        ANDI    #$00FF, R0                      ; 68D5   03B8 00FF
        MVI     G_01E9, R2                      ; 68D7   0282 01E9
        SUBR    R0,     R2                      ; 68D9   0102
        BEQ     L_68ED                          ; 68DA   0204 0011
        BPL     L_68EF                          ; 68DC   0203 0011

        MVII    #$0008, R2                      ; 68DE   02BA 0008
        ANDR    R3,     R2                      ; 68E0   019A
        BNEQ    L_68FA                          ; 68E1   020C 0017

        SDBD                                    ; 68E3   0001
        MVII    #$FFFB, R2                      ; 68E4   02BA 00FB 00FF
L_68E7:
        ANDR    R3,     R2                      ; 68E7   019A
        BEQ     L_68ED                          ; 68E8   0204 0003

        MOVR    R2,     R3                      ; 68EA   0093
        MVO     R3,     G_01E7                  ; 68EB   0243 01E7
L_68ED:
        SETC                                    ; 68ED   0007
        PULR    R7                              ; 68EE   02B7

L_68EF:
        MVII    #$0004, R2                      ; 68EF   02BA 0004
        ANDR    R3,     R2                      ; 68F1   019A
        BNEQ    L_68FA                          ; 68F2   020C 0006

        SDBD                                    ; 68F4   0001
        MVII    #$FFF7, R2                      ; 68F5   02BA 00F7 00FF
        B       L_68E7                          ; 68F8   0220 0012

L_68FA:
        CLRC                                    ; 68FA   0006
        PULR    R7                              ; 68FB   02B7

L_68FC:
        PSHR    R5                              ; 68FC   0275
        CLRR    R4                              ; 68FD   01E4
        MVII    #$016F, R5                      ; 68FE   02BD 016F
        ADD     G_015D, R5                      ; 6900   02C5 015D
        MVI@    R5,     R5                      ; 6902   02AD
        CMPI    #$0004, R5                      ; 6903   037D 0004
        BGE     L_690F                          ; 6905   020D 0008

        MVII    #$0171, R5                      ; 6907   02BD 0171
        ADD     G_015D, R5                      ; 6909   02C5 015D
        MVI@    R5,     R5                      ; 690B   02AD
        TSTR    R5                              ; 690C   00AD
        BEQ     L_6914                          ; 690D   0204 0005

L_690F:
        CMPI    #$033D, R1                      ; 690F   0379 033D
        BLT     L_691F                          ; 6911   0205 000C

        INCR    R4                              ; 6913   000C
L_6914:
        CMPI    #$034D, R1                      ; 6914   0379 034D
        BLT     L_691F                          ; 6916   0205 0007

        MVII    #$0002, R4                      ; 6918   02BC 0002
        CMPI    #$0355, R1                      ; 691A   0379 0355
        BLT     L_691F                          ; 691C   0205 0001

        INCR    R4                              ; 691E   000C
L_691F:
        ADDR    R4,     R4                      ; 691F   00E4
        PULR    R7                              ; 6920   02B7

        DECLE   $0094,  $0055,  $00D4,  $0055   ; 6921   0094 0055 00D4 0055
        DECLE   $00BF                           ; 6925   00BF

        RLC     R1,     2                       ; 6926   0055
        MOVR    R5,     R7                      ; 6927   00AF

        RLC     R1,     2                       ; 6928   0055
        MOVR    R3,     R5                      ; 6929   009D
        RLC     R1,     2                       ; 692A   0055
        ADDR    R4,     R6                      ; 692B   00E6
        RLC     R1,     2                       ; 692C   0055
        ADDR    R0,     R6                      ; 692D   00C6
        RLC     R1,     2                       ; 692E   0055
        MOVR    R4,     R6                      ; 692F   00A6
        RLC     R1,     2                       ; 6930   0055
        MOVR    R1,     R3                      ; 6931   008B
        RLC     R1,     2                       ; 6932   0055
        ADDR    R3,     R5                      ; 6933   00DD
        RLC     R1,     2                       ; 6934   0055
        MOVR    R7,     R0                      ; 6935   00B8
        RLC     R1,     2                       ; 6936   0055
        MOVR    R4,     R6                      ; 6937   00A6
        RLC     R1,     2                       ; 6938   0055
L_6939:
        PSHR    R5                              ; 6939   0275
        MVI     G_0320, R0                      ; 693A   0280 0320
        SWAP    R0,     1                       ; 693C   0040
        ANDI    #$00FF, R0                      ; 693D   03B8 00FF
        MVI     G_01EA, R2                      ; 693F   0282 01EA
        SUBR    R0,     R2                      ; 6941   0102
        BEQ     L_6951                          ; 6942   0204 000D
        BMI     L_6956                          ; 6944   020B 0010

L_6946:
        MVII    #$0001, R2                      ; 6946   02BA 0001
        ANDR    R3,     R2                      ; 6948   019A
        BNEQ    L_68FA                          ; 6949   022C 0050

        SDBD                                    ; 694B   0001
        MVII    #$FFFD, R2                      ; 694C   02BA 00FD 00FF
        B       L_68E7                          ; 694F   0220 0069

L_6951:
        MVI     G_01E8, R0                      ; 6951   0280 01E8
        TSTR    R0                              ; 6953   0080
        BNEQ    L_6946                          ; 6954   022C 000F

L_6956:
        MVII    #$0002, R2                      ; 6956   02BA 0002
        ANDR    R3,     R2                      ; 6958   019A
        BNEQ    L_68FA                          ; 6959   022C 0060

        SDBD                                    ; 695B   0001
        MVII    #$FFFE, R2                      ; 695C   02BA 00FE 00FF
        B       L_68E7                          ; 695F   0220 0079

L_6961:
        PSHR    R5                              ; 6961   0275
        SLR     R2,     2                       ; 6962   0066
        SLR     R2,     1                       ; 6963   0062
        NOP                                     ; 6964   0034
        SLR     R3,     2                       ; 6965   0067
        SLR     R3,     1                       ; 6966   0063
        DECR    R3                              ; 6967   0013
        DECR    R2                              ; 6968   0012
        MOVR    R3,     R1                      ; 6969   0099
        MVII    #$000A, R0                      ; 696A   02B8 000A
        MOVR    R2,     R3                      ; 696C   0093

        JSR     R5,     X_MPY                   ; 696D   0004 011C 01DC

        PSHR    R3                              ; 6970   0273
        PSHR    R2                              ; 6971   0272
        MVII    #$016F, R5                      ; 6972   02BD 016F
        ADD     G_015D, R5                      ; 6974   02C5 015D
        MVI@    R5,     R5                      ; 6976   02AD
        TSTR    R5                              ; 6977   00AD
        BNEQ    L_697E                          ; 6978   020C 0004

        CMPI    #$005A, R2                      ; 697A   037A 005A
        BGE     L_69A0                          ; 697C   020D 0022

L_697E:
        CMPI    #$0064, R2                      ; 697E   037A 0064
        BGE     L_69A0                          ; 6980   020D 001E

        PSHR    R2                              ; 6982   0272
        MVII    #$0064, R0                      ; 6983   02B8 0064
        MVII    #$016F, R1                      ; 6985   02B9 016F
        ADD     G_015D, R1                      ; 6987   02C1 015D
        MVI@    R1,     R1                      ; 6989   0289

        JSR     R5,     X_MPY                   ; 698A   0004 011C 01DC

        PULR    R1                              ; 698D   02B1
        ADDR    R1,     R2                      ; 698E   00CA
        SDBD                                    ; 698F   0001
        ADDI    #$57E1, R2                      ; 6990   02FA 00E1 0057
        SARC    R3,     1                       ; 6993   007B
        BC      L_699C                          ; 6994   0201 0006

        ADDR    R3,     R2                      ; 6996   00DA
        MVI@    R2,     R3                      ; 6997   0293
        SLR     R3,     2                       ; 6998   0067
        SLR     R3,     2                       ; 6999   0067
        B       L_69A2                          ; 699A   0200 0006

L_699C:
        ADDR    R3,     R2                      ; 699C   00DA
        MVI@    R2,     R3                      ; 699D   0293
        ADDI    #$0002, R7                      ; 699E   02FF 0002

L_69A0:
        MVII    #$0001, R3                      ; 69A0   02BB 0001
L_69A2:
        ANDI    #$000F, R3                      ; 69A2   03BB 000F
        PULR    R2                              ; 69A4   02B2
        PULR    R1                              ; 69A5   02B1
        PULR    R7                              ; 69A6   02B7

        PSHR    R5                              ; 69A7   0275
        MVI     G_01DD, R0                      ; 69A8   0280 01DD
        CMPI    #$0080, R0                      ; 69AA   0378 0080
        BNEQ    L_69E7                          ; 69AC   020C 0039

        MVI     G_0176, R0                      ; 69AE   0280 0176
        ANDI    #$0001, R0                      ; 69B0   03B8 0001
        BNEQ    L_69E7                          ; 69B2   020C 0033

        MOVR    R3,     R0                      ; 69B4   0098
        ADDI    #$01D7, R3                      ; 69B5   02FB 01D7
        MVI@    R3,     R1                      ; 69B7   0299
        CMPI    #$0010, R1                      ; 69B8   0379 0010
        BEQ     L_69C0                          ; 69BA   0204 0004

        CMPI    #$0008, R1                      ; 69BC   0379 0008
        BNEQ    L_69E7                          ; 69BE   020C 0027

L_69C0:
        MVII    #$0008, R1                      ; 69C0   02B9 0008
        MVO@    R1,     R3                      ; 69C2   0259

        JSR     R5,     .EXEC.76C               ; 69C3   0004 0114 036C

        MVI@    R1,     R2                      ; 69C6   028A
        SDBD                                    ; 69C7   0001
        ANDI    #$FFE8, R2                      ; 69C8   03BA 00E8 00FF

        JSR     R5,     L_68FC                  ; 69CB   0004 0168 00FC

        MOVR    R4,     R3                      ; 69CE   00A3
        SDBD                                    ; 69CF   0001
        ADDI    #$69E8, R4                      ; 69D0   02FC 00E8 0069
        MVI@    R4,     R3                      ; 69D3   02A3
        XORR    R3,     R2                      ; 69D4   01DA
        MVO@    R2,     R1                      ; 69D5   024A
        ADDI    #$0005, R1                      ; 69D6   02F9 0005
        MVII    #$00E0, R0                      ; 69D8   02B8 00E0
        MVO@    R0,     R1                      ; 69DA   0248
        INCR    R1                              ; 69DB   0009
        MVII    #$0050, R0                      ; 69DC   02B8 0050
        MVI     G_0171, R2                      ; 69DE   0282 0171
        SLL     R2,     2                       ; 69E0   004E
        SLL     R2,     1                       ; 69E1   004A
        SUBR    R2,     R0                      ; 69E2   0110
        MVO@    R0,     R1                      ; 69E3   0248

        JSR     R5,     L_6F65                  ; 69E4   0004 016C 0365

L_69E7:
        PULR    R7                              ; 69E7   02B7

        EIS                                     ; 69E8   0002
        DECR    R2                              ; 69E9   0012
        DECR    R0                              ; 69EA   0010
        DECR    R6                              ; 69EB   0016
        DECR    R2                              ; 69EC   0012
        SETC                                    ; 69ED   0007
        DECR    R2                              ; 69EE   0012
        SETC                                    ; 69EF   0007
        PSHR    R5                              ; 69F0   0275
        MVI@    R1,     R2                      ; 69F1   028A
        SDBD                                    ; 69F2   0001
        ANDI    #$FFE8, R2                      ; 69F3   03BA 00E8 00FF

        JSR     R5,     L_68FC                  ; 69F6   0004 0168 00FC

        SDBD                                    ; 69F9   0001
        ADDI    #$69E9, R4                      ; 69FA   02FC 00E9 0069
        MVI@    R4,     R3                      ; 69FD   02A3
        XORR    R3,     R2                      ; 69FE   01DA
        MVO@    R2,     R1                      ; 69FF   024A
        ADDI    #$0005, R1                      ; 6A00   02F9 0005
        CLRR    R2                              ; 6A02   01D2
        MVO@    R2,     R1                      ; 6A03   024A
        ADDI    #$01D7, R0                      ; 6A04   02F8 01D7
        MOVR    R0,     R1                      ; 6A06   0081
        MVI@    R1,     R2                      ; 6A07   028A
        CMPI    #$0008, R2                      ; 6A08   037A 0008
        BNEQ    L_6A1B                          ; 6A0A   020C 000F

        MVII    #$0010, R2                      ; 6A0C   02BA 0010
        MVO@    R2,     R1                      ; 6A0E   024A
        CMPI    #$01DE, R1                      ; 6A0F   0379 01DE
        BNEQ    L_6A1B                          ; 6A11   020C 0008

        MVI     G_01DD, R0                      ; 6A13   0280 01DD
        CMPI    #$0080, R0                      ; 6A15   0378 0080
        BEQ     L_6A1B                          ; 6A17   0204 0002

        MVO     R2,     G_01DD                  ; 6A19   0242 01DD
L_6A1B:
        PULR    R7                              ; 6A1B   02B7

        PSHR    R5                              ; 6A1C   0275
        MVII    #$034E, R4                      ; 6A1D   02BC 034E
        MVII    #$0357, R5                      ; 6A1F   02BD 0357
        SDBD                                    ; 6A21   0001
        MVII    #$55B8, R0                      ; 6A22   02B8 00B8 0055
        MVO@    R0,     R4                      ; 6A25   0260
        MVI     G_01DE, R3                      ; 6A26   0283 01DE
        MVO     R3,     G_01DD                  ; 6A28   0243 01DD
        ANDI    #$0040, R3                      ; 6A2A   03BB 0040
        BNEQ    L_6A34                          ; 6A2C   020C 0006

        MVI@    R5,     R0                      ; 6A2E   02A8
        MVI@    R5,     R1                      ; 6A2F   02A9
        INCR    R5                              ; 6A30   000D
        MVI@    R5,     R2                      ; 6A31   02AA
        B       L_6A37                          ; 6A32   0200 0003

L_6A34:
        CLRR    R0                              ; 6A34   01C0
        CLRR    R1                              ; 6A35   01C9
        CLRR    R2                              ; 6A36   01D2
L_6A37:
        MVO@    R0,     R4                      ; 6A37   0260
        MVO@    R1,     R4                      ; 6A38   0261
        INCR    R4                              ; 6A39   000C
        MVO@    R2,     R4                      ; 6A3A   0262
        MVII    #$0006, R0                      ; 6A3B   02B8 0006

        JSR     R5,     .EXEC.41C               ; 6A3D   0004 0114 001C

        PULR    R7                              ; 6A40   02B7

L_6A41:
        MVII    #$0019, R0                      ; 6A41   02B8 0019
        MVO     R0,     G_011E                  ; 6A43   0240 011E
        B       L_672A                          ; 6A45   0220 031C

        DECLE   $00A8,  $0018,  $0004,  $0000   ; 6A47   00A8 0018 0004 0000
L_6A4B:
        PSHR    R5                              ; 6A4B   0275
        PSHR    R1                              ; 6A4C   0271
        PSHR    R2                              ; 6A4D   0272
        NOP                                     ; 6A4E   0034
        PSHR    R4                              ; 6A4F   0274
        MVII    #$0163, R3                      ; 6A50   02BB 0163
        ADD     G_015D, R3                      ; 6A52   02C3 015D
        ADD     G_015D, R3                      ; 6A54   02C3 015D
        MVII    #$03E8, R1                      ; 6A56   02B9 03E8
        MVI@    R3,     R2                      ; 6A58   029A
        DECR    R3                              ; 6A59   0013
        SWAP    R2,     1                       ; 6A5A   0042
        XOR@    R3,     R2                      ; 6A5B   03DA
        ADDR    R0,     R2                      ; 6A5C   00C2
        MVII    #$0168, R4                      ; 6A5D   02BC 0168
        ADD     G_015D, R4                      ; 6A5F   02C4 015D
        CMPR    R1,     R2                      ; 6A61   014A
        BLT     L_6B67                          ; 6A62   0205 0103

        SUBR    R1,     R2                      ; 6A64   010A
        MVI@    R4,     R1                      ; 6A65   02A1
        PSHR    R1                              ; 6A66   0271
        PSHR    R2                              ; 6A67   0272
        NOP                                     ; 6A68   0034
        PSHR    R3                              ; 6A69   0273
        PSHR    R4                              ; 6A6A   0274
        MVII    #$017D, R4                      ; 6A6B   02BC 017D
        ADD     G_015D, R4                      ; 6A6D   02C4 015D
        MVI@    R4,     R1                      ; 6A6F   02A1
        DECR    R4                              ; 6A70   0014
        INCR    R1                              ; 6A71   0009
        MVO@    R1,     R4                      ; 6A72   0261

        JSR     R5,     L_6CC5                  ; 6A73   0004 016C 00C5

        PULR    R4                              ; 6A76   02B4
        PULR    R3                              ; 6A77   02B3
        PULR    R2                              ; 6A78   02B2
        PULR    R1                              ; 6A79   02B1
        DECR    R4                              ; 6A7A   0014
        INCR    R1                              ; 6A7B   0009
        CMPI    #$0063, R1                      ; 6A7C   0379 0063
        BLE     L_6A89                          ; 6A7E   0206 0009

        CLRR    R1                              ; 6A80   01C9
        ADDI    #$0003, R4                      ; 6A81   02FC 0003
        MVI@    R4,     R5                      ; 6A83   02A5
        INCR    R5                              ; 6A84   000D
        DECR    R4                              ; 6A85   0014
        MVO@    R5,     R4                      ; 6A86   0265
        SUBI    #$0004, R4                      ; 6A87   033C 0004
L_6A89:
        MVO@    R1,     R4                      ; 6A89   0261
L_6A8A:
        MVO@    R2,     R3                      ; 6A8A   025A
        SWAP    R2,     1                       ; 6A8B   0042
        INCR    R3                              ; 6A8C   000B
        MVO@    R2,     R3                      ; 6A8D   025A
        SWAP    R2,     1                       ; 6A8E   0042
        ADDI    #$0002, R4                      ; 6A8F   02FC 0002
        MVI@    R4,     R4                      ; 6A91   02A4
        MVI     G_016D, R3                      ; 6A92   0283 016D
        CMPR    R3,     R4                      ; 6A94   015C
        BLT     L_6AB4                          ; 6A95   0205 001D
        BEQ     L_6A9D                          ; 6A97   0204 0004

        MVO     R4,     G_016D                  ; 6A99   0244 016D
        B       L_6AAC                          ; 6A9B   0200 000F

L_6A9D:
        MVI     G_0167, R3                      ; 6A9D   0283 0167
        SWAP    R3,     1                       ; 6A9F   0043
        XOR     G_0166, R3                      ; 6AA0   03C3 0166
        MVI     G_016A, R4                      ; 6AA2   0284 016A
        CMPR    R4,     R1                      ; 6AA4   0161
        BGT     L_6AAC                          ; 6AA5   020E 0005
        BLT     L_6AB4                          ; 6AA7   0205 000B

        CMPR    R3,     R2                      ; 6AA9   015A
        BLT     L_6AB4                          ; 6AAA   0205 0008

L_6AAC:
        MVO     R1,     G_016A                  ; 6AAC   0241 016A
        MVO     R2,     G_0166                  ; 6AAE   0242 0166
        NOP                                     ; 6AB0   0034
        SWAP    R2,     1                       ; 6AB1   0042
        MVO     R2,     G_0167                  ; 6AB2   0242 0167
L_6AB4:
        MVII    #$0006, R3                      ; 6AB4   02BB 0006
        MVI     G_015D, R5                      ; 6AB6   0285 015D
        CMPI    #$0001, R5                      ; 6AB8   037D 0001
        BNEQ    L_6ABE                          ; 6ABA   020C 0002

        MVII    #$0003, R3                      ; 6ABC   02BB 0003
L_6ABE:
        MVII    #$0162, R2                      ; 6ABE   02BA 0162
        MVII    #$0205, R4                      ; 6AC0   02BC 0205

        JSR     R5,     L_6B15                  ; 6AC2   0004 0168 0315

        MVII    #$0006, R3                      ; 6AC5   02BB 0006
        MVI     G_015D, R5                      ; 6AC7   0285 015D
        TSTR    R5                              ; 6AC9   00AD
        BNEQ    L_6ACE                          ; 6ACA   020C 0002

        MVII    #$0003, R3                      ; 6ACC   02BB 0003
L_6ACE:
        MVII    #$0213, R4                      ; 6ACE   02BC 0213

        JSR     R5,     L_6B15                  ; 6AD0   0004 0168 0315

        MVII    #$020C, R4                      ; 6AD3   02BC 020C
        MVII    #$0005, R3                      ; 6AD5   02BB 0005

        JSR     R5,     L_6B15                  ; 6AD7   0004 0168 0315

L_6ADA:
        MVI     G_0176, R1                      ; 6ADA   0281 0176
        CMPI    #$001F, R1                      ; 6ADC   0379 001F
        BEQ     L_6B0A                          ; 6ADE   0204 002A

        MVII    #$017B, R1                      ; 6AE0   02B9 017B
        ADD     G_015D, R1                      ; 6AE2   02C1 015D
        MVI@    R1,     R0                      ; 6AE4   0288
        MVII    #$0002, R1                      ; 6AE5   02B9 0002
        MVII    #$0003, R3                      ; 6AE7   02BB 0003
        MVII    #$02DC, R4                      ; 6AE9   02BC 02DC

        JSR     R5,     X_PRNUM_LFT             ; 6AEB   0004 0118 009E

        MVII    #$017D, R4                      ; 6AEE   02BC 017D
        ADD     G_015D, R4                      ; 6AF0   02C4 015D
        MVI@    R4,     R0                      ; 6AF2   02A0
        DECR    R0                              ; 6AF3   0010
        BPL     L_6AF7                          ; 6AF4   0203 0001

        CLRR    R0                              ; 6AF6   01C0
L_6AF7:
        MVII    #$02EE, R4                      ; 6AF7   02BC 02EE

        JSR     R5,     X_PRNUM_RGT             ; 6AF9   0004 0118 00C5

        SDBD                                    ; 6AFC   0001
        MVII    #$1933, R0                      ; 6AFD   02B8 0033 0019
        MVII    #$02C8, R1                      ; 6B00   02B9 02C8
        MVO@    R0,     R1                      ; 6B02   0248
        SDBD                                    ; 6B03   0001
        MVII    #$093F, R0                      ; 6B04   02B8 003F 0009
        MVII    #$02DB, R1                      ; 6B07   02B9 02DB
        MVO@    R0,     R1                      ; 6B09   0248
L_6B0A:
        PULR    R4                              ; 6B0A   02B4
        PULR    R2                              ; 6B0B   02B2
        PULR    R1                              ; 6B0C   02B1
        PULR    R7                              ; 6B0D   02B7

L_6B0E:
        PSHR    R5                              ; 6B0E   0275
        PSHR    R1                              ; 6B0F   0271
        PSHR    R2                              ; 6B10   0272
        NOP                                     ; 6B11   0034
        PSHR    R4                              ; 6B12   0274
        B       L_6ADA                          ; 6B13   0220 003A

L_6B15:
        PSHR    R5                              ; 6B15   0275
        MVI@    R2,     R0                      ; 6B16   0290
        INCR    R2                              ; 6B17   000A
        SWAP    R0,     1                       ; 6B18   0040
        XOR@    R2,     R0                      ; 6B19   03D0
        SWAP    R0,     1                       ; 6B1A   0040
        MVII    #$0003, R1                      ; 6B1B   02B9 0003
        SUBI    #$0003, R4                      ; 6B1D   033C 0003
        PSHR    R2                              ; 6B1F   0272
        SUBI    #$0163, R2                      ; 6B20   033A 0163
        SLR     R2,     1                       ; 6B22   0062
        ADDI    #$0168, R2                      ; 6B23   02FA 0168
        MVI@    R2,     R5                      ; 6B25   0295
        TSTR    R5                              ; 6B26   00AD
        BEQ     L_6B2E                          ; 6B27   0204 0005

        JSR     R5,     X_PRNUM_ZRO             ; 6B29   0004 0118 00AD

        B       L_6B38                          ; 6B2C   0200 000A

L_6B2E:
        SUBI    #$0002, R4                      ; 6B2E   033C 0002
        MVO@    R5,     R4                      ; 6B30   0265
        MVO@    R5,     R4                      ; 6B31   0265
        TSTR    R0                              ; 6B32   0080
        BEQ     L_6B62                          ; 6B33   0204 002D

        JSR     R5,     X_PRNUM_RGT             ; 6B35   0004 0118 00C5

L_6B38:
        SUBI    #$0002, R4                      ; 6B38   033C 0002
        MVI@    R2,     R5                      ; 6B3A   0295
        TSTR    R5                              ; 6B3B   00AD
        BEQ     L_6B44                          ; 6B3C   0204 0006

        MOVR    R5,     R0                      ; 6B3E   00A8
        MVII    #$0002, R1                      ; 6B3F   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 6B41   0004 0118 00C5

L_6B44:
        CLRR    R0                              ; 6B44   01C0
        MVII    #$0001, R1                      ; 6B45   02B9 0001
        ADDI    #$0005, R4                      ; 6B47   02FC 0005

        JSR     R5,     X_PRNUM_ZRO             ; 6B49   0004 0118 00AD

L_6B4C:
        MVI     G_0176, R5                      ; 6B4C   0285 0176
        CMPI    #$000F, R5                      ; 6B4E   037D 000F
        BNEQ    L_6B5F                          ; 6B50   020C 000D

        ADDI    #$0012, R4                      ; 6B52   02FC 0012
        ADDI    #$0003, R2                      ; 6B54   02FA 0003
        MVI@    R2,     R0                      ; 6B56   0290
        TSTR    R0                              ; 6B57   0080
        BEQ     L_6B5F                          ; 6B58   0204 0005

        MVII    #$0003, R1                      ; 6B5A   02B9 0003

        JSR     R5,     X_PRNUM_ZRO             ; 6B5C   0004 0118 00AD

L_6B5F:
        PULR    R2                              ; 6B5F   02B2
        INCR    R2                              ; 6B60   000A
        PULR    R7                              ; 6B61   02B7

L_6B62:
        MVO@    R5,     R4                      ; 6B62   0265
        MVO@    R5,     R4                      ; 6B63   0265
        MVO@    R5,     R4                      ; 6B64   0265
        B       L_6B4C                          ; 6B65   0220 001A

L_6B67:
        MVI@    R4,     R1                      ; 6B67   02A1
        B       L_6A8A                          ; 6B68   0220 00DF

L_6B6A:
        PSHR    R5                              ; 6B6A   0275

        JSR     R5,     X_PLAY_SFX2             ; 6B6B   0004 0118 03BE
        DECLE   $0014                           ; 6B6E  SFX prio
        DECLE   $03E9                           ; 6B6F  SFX data
        DECLE   $0035                           ; 6B70  SFX data
        DECLE   $002B                           ; 6B71  SFX data
        DECLE   $0340,  $006B                   ; 6B72  SFX data
        DECLE   $006B                           ; 6B74  SFX data
        DECLE   $0005                           ; 6B75  SFX data
        DECLE   $002B                           ; 6B76  SFX data
        DECLE   $0340,  $0071                   ; 6B77  SFX data
        DECLE   $006B                           ; 6B79  SFX data
        DECLE   $0005                           ; 6B7A  SFX data
        DECLE   $002B                           ; 6B7B  SFX data
        DECLE   $0340,  $0078                   ; 6B7C  SFX data
        DECLE   $006B                           ; 6B7E  SFX data
        DECLE   $0005                           ; 6B7F  SFX data
        DECLE   $002B                           ; 6B80  SFX data
        DECLE   $0340,  $007F                   ; 6B81  SFX data
        DECLE   $006B                           ; 6B83  SFX data
        DECLE   $0005                           ; 6B84  SFX data
        DECLE   $002B                           ; 6B85  SFX data
        DECLE   $0340,  $0087                   ; 6B86  SFX data
        DECLE   $006B                           ; 6B88  SFX data
        DECLE   $0005                           ; 6B89  SFX data
        DECLE   $002B                           ; 6B8A  SFX data
        DECLE   $0340,  $008F                   ; 6B8B  SFX data
        DECLE   $006B                           ; 6B8D  SFX data
        DECLE   $0005                           ; 6B8E  SFX data
        DECLE   $002B                           ; 6B8F  SFX data
        DECLE   $0340,  $0097                   ; 6B90  SFX data
        DECLE   $006B                           ; 6B92  SFX data
        DECLE   $0005                           ; 6B93  SFX data
        DECLE   $002B                           ; 6B94  SFX data
        DECLE   $0340,  $00A0                   ; 6B95  SFX data
        DECLE   $006B                           ; 6B97  SFX data
        DECLE   $0005                           ; 6B98  SFX data
        DECLE   $002B                           ; 6B99  SFX data
        DECLE   $0340,  $00AA                   ; 6B9A  SFX data
        DECLE   $006B                           ; 6B9C  SFX data
        DECLE   $0005                           ; 6B9D  SFX data
        DECLE   $002B                           ; 6B9E  SFX data
        DECLE   $0340,  $00B4                   ; 6B9F  SFX data
        DECLE   $006B                           ; 6BA1  SFX data
        DECLE   $0005                           ; 6BA2  SFX data
        DECLE   $002B                           ; 6BA3  SFX data
        DECLE   $0340,  $00BE                   ; 6BA4  SFX data
        DECLE   $006B                           ; 6BA6  SFX data
        DECLE   $0005                           ; 6BA7  SFX data
        DECLE   $002B                           ; 6BA8  SFX data
        DECLE   $0340,  $00CA                   ; 6BA9  SFX data
        DECLE   $006B                           ; 6BAB  SFX data
        DECLE   $0005                           ; 6BAC  SFX data
        DECLE   $002B                           ; 6BAD  SFX data
        DECLE   $0340,  $00D7                   ; 6BAE  SFX data
        DECLE   $006B                           ; 6BB0  SFX data
        DECLE   $0005                           ; 6BB1  SFX data
        DECLE   $002B                           ; 6BB2  SFX data
        DECLE   $03F9                           ; 6BB3  SFX data
        DECLE   $00CF                           ; 6BB4  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6BB5   0004 0118 03BE
        DECLE   $0002                           ; 6BB8  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6BB9  SFX data
        DECLE   $02CF                           ; 6BBC  SFX end


        PULR    R7                              ; 6BBD   02B7

L_6BBE:
        PSHR    R5                              ; 6BBE   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BBF   0004 0118 03BE
        DECLE   $000C                           ; 6BC2  SFX prio
        DECLE   $00DD                           ; 6BC3  SFX data
        DECLE   $019D                           ; 6BC4  SFX data
        DECLE   $0379                           ; 6BC5  SFX data
        DECLE   $028D                           ; 6BC6  SFX data
        DECLE   $000F,  $03FA                   ; 6BC7  SFX data
        DECLE   $0245                           ; 6BC9  SFX data
        DECLE   $00A2                           ; 6BCA  SFX data
        DECLE   $00EB                           ; 6BCB  SFX data
        DECLE   $0312                           ; 6BCC  SFX data
        DECLE   $000F,  $0008                   ; 6BCD  SFX data
        DECLE   $006B                           ; 6BCF  SFX data
        DECLE   $0005                           ; 6BD0  SFX data
        DECLE   $006B                           ; 6BD1  SFX data
        DECLE   $028D                           ; 6BD2  SFX data
        DECLE   $0245                           ; 6BD3  SFX data
        DECLE   $0052                           ; 6BD4  SFX data
        DECLE   $00C3,  $03E4                   ; 6BD5  SFX data
        DECLE   $0005                           ; 6BD7  SFX data
        DECLE   $0043,  $03AA                   ; 6BD8  SFX data
        DECLE   $00CF                           ; 6BDA  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6BDB   0004 0118 03BE
        DECLE   $0002                           ; 6BDE  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6BDF  SFX data
        DECLE   $02CF                           ; 6BE2  SFX end

L_6BE3:
        PSHR    R5                              ; 6BE3   0275

        JSR     R5,     X_PLAY_SFX2             ; 6BE4   0004 0118 03BE
        DECLE   $0020                           ; 6BE7  SFX prio
        DECLE   $03E9                           ; 6BE8  SFX data
        DECLE   $0035                           ; 6BE9  SFX data
        DECLE   $006B                           ; 6BEA  SFX data
        DECLE   $0380,  $00D7                   ; 6BEB  SFX data
        DECLE   $012B                           ; 6BED  SFX data
        DECLE   $0005                           ; 6BEE  SFX data
        DECLE   $006B                           ; 6BEF  SFX data
        DECLE   $0380,  $00D7                   ; 6BF0  SFX data
        DECLE   $012B                           ; 6BF2  SFX data
        DECLE   $0005                           ; 6BF3  SFX data
        DECLE   $006B                           ; 6BF4  SFX data
        DECLE   $0380,  $00FE                   ; 6BF5  SFX data
        DECLE   $012B                           ; 6BF7  SFX data
        DECLE   $0005                           ; 6BF8  SFX data
        DECLE   $006B                           ; 6BF9  SFX data
        DECLE   $0380,  $00FE                   ; 6BFA  SFX data
        DECLE   $012B                           ; 6BFC  SFX data
        DECLE   $0005                           ; 6BFD  SFX data
        DECLE   $006B                           ; 6BFE  SFX data
        DECLE   $0380,  $0140                   ; 6BFF  SFX data
        DECLE   $012B                           ; 6C01  SFX data
        DECLE   $0005                           ; 6C02  SFX data
        DECLE   $006B                           ; 6C03  SFX data
        DECLE   $0380,  $0140                   ; 6C04  SFX data
        DECLE   $012B                           ; 6C06  SFX data
        DECLE   $0005                           ; 6C07  SFX data
        DECLE   $006B                           ; 6C08  SFX data
        DECLE   $0380,  $0140                   ; 6C09  SFX data
        DECLE   $012B                           ; 6C0B  SFX data
        DECLE   $0005                           ; 6C0C  SFX data
        DECLE   $006B                           ; 6C0D  SFX data
        DECLE   $03F9                           ; 6C0E  SFX data
        DECLE   $00CF                           ; 6C0F  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6C10   0004 0118 03BE
        DECLE   $0002                           ; 6C13  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6C14  SFX data
        DECLE   $02CF                           ; 6C17  SFX end


        PULR    R7                              ; 6C18   02B7

L_6C19:
        PSHR    R5                              ; 6C19   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C1A   0004 0118 03BE
        DECLE   $0020                           ; 6C1D  SFX prio
        DECLE   $03E9                           ; 6C1E  SFX data
        DECLE   $0035                           ; 6C1F  SFX data
        DECLE   $006B                           ; 6C20  SFX data
        DECLE   $0380,  $01AC                   ; 6C21  SFX data
        DECLE   $00EB                           ; 6C23  SFX data
        DECLE   $0005                           ; 6C24  SFX data
        DECLE   $006B                           ; 6C25  SFX data
        DECLE   $0380,  $01AC                   ; 6C26  SFX data
        DECLE   $00EB                           ; 6C28  SFX data
        DECLE   $0005                           ; 6C29  SFX data
        DECLE   $006B                           ; 6C2A  SFX data
        DECLE   $0380,  $0153                   ; 6C2B  SFX data
        DECLE   $00EB                           ; 6C2D  SFX data
        DECLE   $0005                           ; 6C2E  SFX data
        DECLE   $006B                           ; 6C2F  SFX data
        DECLE   $0380,  $011D                   ; 6C30  SFX data
        DECLE   $00EB                           ; 6C32  SFX data
        DECLE   $0005                           ; 6C33  SFX data
        DECLE   $006B                           ; 6C34  SFX data
        DECLE   $03F9                           ; 6C35  SFX data
        DECLE   $00CF                           ; 6C36  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6C37   0004 0118 03BE
        DECLE   $0002                           ; 6C3A  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6C3B  SFX data
        DECLE   $02CF                           ; 6C3E  SFX end


        PULR    R7                              ; 6C3F   02B7

L_6C40:
        PSHR    R5                              ; 6C40   0275

        JSR     R5,     X_PLAY_SFX2             ; 6C41   0004 0118 03BE
        DECLE   $0024                           ; 6C44  SFX prio
        DECLE   $03C9                           ; 6C45  SFX data
        DECLE   $0035                           ; 6C46  SFX data
        DECLE   $006B                           ; 6C47  SFX data
        DECLE   $0380,  $0140                   ; 6C48  SFX data
        DECLE   $006B                           ; 6C4A  SFX data
        DECLE   $006B                           ; 6C4B  SFX data
        DECLE   $0308,  $0140                   ; 6C4C  SFX data
        DECLE   $00AB                           ; 6C4E  SFX data
        DECLE   $0005                           ; 6C4F  SFX data
        DECLE   $006B                           ; 6C50  SFX data
        DECLE   $0380,  $00FE                   ; 6C51  SFX data
        DECLE   $006B                           ; 6C53  SFX data
        DECLE   $0025                           ; 6C54  SFX data
        DECLE   $006B                           ; 6C55  SFX data
        DECLE   $0308,  $0140                   ; 6C56  SFX data
        DECLE   $00AB                           ; 6C58  SFX data
        DECLE   $0005                           ; 6C59  SFX data
        DECLE   $006B                           ; 6C5A  SFX data
        DECLE   $0380,  $00D7                   ; 6C5B  SFX data
        DECLE   $006B                           ; 6C5D  SFX data
        DECLE   $0025                           ; 6C5E  SFX data
        DECLE   $006B                           ; 6C5F  SFX data
        DECLE   $0308,  $0140                   ; 6C60  SFX data
        DECLE   $00AB                           ; 6C62  SFX data
        DECLE   $0005                           ; 6C63  SFX data
        DECLE   $006B                           ; 6C64  SFX data
        DECLE   $0380,  $00A0                   ; 6C65  SFX data
        DECLE   $006B                           ; 6C67  SFX data
        DECLE   $0025                           ; 6C68  SFX data
        DECLE   $006B                           ; 6C69  SFX data
        DECLE   $0308,  $0140                   ; 6C6A  SFX data
        DECLE   $00AB                           ; 6C6C  SFX data
        DECLE   $0005                           ; 6C6D  SFX data
        DECLE   $006B                           ; 6C6E  SFX data
        DECLE   $0380,  $00D7                   ; 6C6F  SFX data
        DECLE   $006B                           ; 6C71  SFX data
        DECLE   $0025                           ; 6C72  SFX data
        DECLE   $006B                           ; 6C73  SFX data
        DECLE   $0308,  $0140                   ; 6C74  SFX data
        DECLE   $00AB                           ; 6C76  SFX data
        DECLE   $0005                           ; 6C77  SFX data
        DECLE   $006B                           ; 6C78  SFX data
        DECLE   $0380,  $00FE                   ; 6C79  SFX data
        DECLE   $006B                           ; 6C7B  SFX data
        DECLE   $0025                           ; 6C7C  SFX data
        DECLE   $006B                           ; 6C7D  SFX data
        DECLE   $0308,  $0140                   ; 6C7E  SFX data
        DECLE   $00AB                           ; 6C80  SFX data
        DECLE   $0005                           ; 6C81  SFX data
        DECLE   $006B                           ; 6C82  SFX data
        DECLE   $0380,  $0140                   ; 6C83  SFX data
        DECLE   $006B                           ; 6C85  SFX data
        DECLE   $0025                           ; 6C86  SFX data
        DECLE   $006B                           ; 6C87  SFX data
        DECLE   $0308,  $0140                   ; 6C88  SFX data
        DECLE   $00AB                           ; 6C8A  SFX data
        DECLE   $0005                           ; 6C8B  SFX data
        DECLE   $006B                           ; 6C8C  SFX data
        DECLE   $0380,  $00FE                   ; 6C8D  SFX data
        DECLE   $006B                           ; 6C8F  SFX data
        DECLE   $0025                           ; 6C90  SFX data
        DECLE   $006B                           ; 6C91  SFX data
        DECLE   $0308,  $0140                   ; 6C92  SFX data
        DECLE   $00AB                           ; 6C94  SFX data
        DECLE   $0005                           ; 6C95  SFX data
        DECLE   $006B                           ; 6C96  SFX data
        DECLE   $0380,  $00D7                   ; 6C97  SFX data
        DECLE   $006B                           ; 6C99  SFX data
        DECLE   $0025                           ; 6C9A  SFX data
        DECLE   $006B                           ; 6C9B  SFX data
        DECLE   $0308,  $0140                   ; 6C9C  SFX data
        DECLE   $00AB                           ; 6C9E  SFX data
        DECLE   $0005                           ; 6C9F  SFX data
        DECLE   $006B                           ; 6CA0  SFX data
        DECLE   $0380,  $00A0                   ; 6CA1  SFX data
        DECLE   $006B                           ; 6CA3  SFX data
        DECLE   $0025                           ; 6CA4  SFX data
        DECLE   $006B                           ; 6CA5  SFX data
        DECLE   $0308,  $0140                   ; 6CA6  SFX data
        DECLE   $00AB                           ; 6CA8  SFX data
        DECLE   $006B                           ; 6CA9  SFX data
        DECLE   $0035                           ; 6CAA  SFX data
        DECLE   $006B                           ; 6CAB  SFX data
        DECLE   $03F9                           ; 6CAC  SFX data
        DECLE   $02CF                           ; 6CAD  SFX end

L_6CAE:
        PSHR    R5                              ; 6CAE   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CAF   0004 0118 03BE
        DECLE   $0008                           ; 6CB2  SFX prio
        DECLE   $03E9                           ; 6CB3  SFX data
        DECLE   $0040,  $03B6                   ; 6CB4  SFX data
        DECLE   $007C,  $0340                   ; 6CB6  SFX data
        DECLE   $000B                           ; 6CB8  SFX data
        DECLE   $008F,  $0013                   ; 6CB9  SFX data
        DECLE   $00CF                           ; 6CBB  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6CBC   0004 0118 03BE
        DECLE   $0002                           ; 6CBF  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6CC0  SFX data
        DECLE   $02CF                           ; 6CC3  SFX end


        PULR    R7                              ; 6CC4   02B7

L_6CC5:
        PSHR    R5                              ; 6CC5   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CC6   0004 0118 03BE
        DECLE   $001C                           ; 6CC9  SFX prio
        DECLE   $03C9                           ; 6CCA  SFX data
        DECLE   $031D                           ; 6CCB  SFX data
        DECLE   $0035                           ; 6CCC  SFX data
        DECLE   $006B                           ; 6CCD  SFX data
        DECLE   $0348,  $006E                   ; 6CCE  SFX data
        DECLE   $0083,  $03E8                   ; 6CD0  SFX data
        DECLE   $00CF                           ; 6CD2  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6CD3   0004 0118 03BE
        DECLE   $0002                           ; 6CD6  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6CD7  SFX data
        DECLE   $02CF                           ; 6CDA  SFX end


        PULR    R7                              ; 6CDB   02B7

L_6CDC:
        PSHR    R5                              ; 6CDC   0275

        JSR     R5,     X_PLAY_SFX2             ; 6CDD   0004 0118 03BE
        DECLE   $0024                           ; 6CE0  SFX prio
        DECLE   $03C9                           ; 6CE1  SFX data
        DECLE   $0035                           ; 6CE2  SFX data
        DECLE   $006B                           ; 6CE3  SFX data
        DECLE   $0380,  $00E2                   ; 6CE4  SFX data
        DECLE   $0348,  $023B                   ; 6CE6  SFX data
        DECLE   $026B                           ; 6CE8  SFX data
        DECLE   $0005                           ; 6CE9  SFX data
        DECLE   $0025                           ; 6CEA  SFX data
        DECLE   $006B                           ; 6CEB  SFX data
        DECLE   $0380,  $00BE                   ; 6CEC  SFX data
        DECLE   $0348,  $01C5                   ; 6CEE  SFX data
        DECLE   $026B                           ; 6CF0  SFX data
        DECLE   $0005                           ; 6CF1  SFX data
        DECLE   $0025                           ; 6CF2  SFX data
        DECLE   $006B                           ; 6CF3  SFX data
        DECLE   $0380,  $00BE                   ; 6CF4  SFX data
        DECLE   $0348,  $017D                   ; 6CF6  SFX data
        DECLE   $026B                           ; 6CF8  SFX data
        DECLE   $0005                           ; 6CF9  SFX data
        DECLE   $0025                           ; 6CFA  SFX data
        DECLE   $006B                           ; 6CFB  SFX data
        DECLE   $0380,  $00D7                   ; 6CFC  SFX data
        DECLE   $0008,  $0000                   ; 6CFE  SFX data
        DECLE   $00EB                           ; 6D00  SFX data
        DECLE   $0005                           ; 6D01  SFX data
        DECLE   $006B                           ; 6D02  SFX data
        DECLE   $0380,  $00E2                   ; 6D03  SFX data
        DECLE   $00EB                           ; 6D05  SFX data
        DECLE   $0005                           ; 6D06  SFX data
        DECLE   $0025                           ; 6D07  SFX data
        DECLE   $006B                           ; 6D08  SFX data
        DECLE   $0380,  $00D7                   ; 6D09  SFX data
        DECLE   $0348,  $01FC                   ; 6D0B  SFX data
        DECLE   $026B                           ; 6D0D  SFX data
        DECLE   $0005                           ; 6D0E  SFX data
        DECLE   $0025                           ; 6D0F  SFX data
        DECLE   $006B                           ; 6D10  SFX data
        DECLE   $0380,  $00AA                   ; 6D11  SFX data
        DECLE   $0348,  $01AC                   ; 6D13  SFX data
        DECLE   $026B                           ; 6D15  SFX data
        DECLE   $0005                           ; 6D16  SFX data
        DECLE   $0025                           ; 6D17  SFX data
        DECLE   $006B                           ; 6D18  SFX data
        DECLE   $0380,  $00AA                   ; 6D19  SFX data
        DECLE   $0348,  $0153                   ; 6D1B  SFX data
        DECLE   $026B                           ; 6D1D  SFX data
        DECLE   $0005                           ; 6D1E  SFX data
        DECLE   $0025                           ; 6D1F  SFX data
        DECLE   $006B                           ; 6D20  SFX data
        DECLE   $0380,  $00BE                   ; 6D21  SFX data
        DECLE   $0008,  $0000                   ; 6D23  SFX data
        DECLE   $00EB                           ; 6D25  SFX data
        DECLE   $0005                           ; 6D26  SFX data
        DECLE   $006B                           ; 6D27  SFX data
        DECLE   $0380,  $00D7                   ; 6D28  SFX data
        DECLE   $00EB                           ; 6D2A  SFX data
        DECLE   $0005                           ; 6D2B  SFX data
        DECLE   $0025                           ; 6D2C  SFX data
        DECLE   $006B                           ; 6D2D  SFX data
        DECLE   $0380,  $00BE                   ; 6D2E  SFX data
        DECLE   $0348,  $012E                   ; 6D30  SFX data
        DECLE   $026B                           ; 6D32  SFX data
        DECLE   $0005                           ; 6D33  SFX data
        DECLE   $0025                           ; 6D34  SFX data
        DECLE   $006B                           ; 6D35  SFX data
        DECLE   $0380,  $0097                   ; 6D36  SFX data
        DECLE   $0348,  $017D                   ; 6D38  SFX data
        DECLE   $026B                           ; 6D3A  SFX data
        DECLE   $0005                           ; 6D3B  SFX data
        DECLE   $0025                           ; 6D3C  SFX data
        DECLE   $006B                           ; 6D3D  SFX data
        DECLE   $0380,  $0097                   ; 6D3E  SFX data
        DECLE   $0348,  $0153                   ; 6D40  SFX data
        DECLE   $026B                           ; 6D42  SFX data
        DECLE   $0005                           ; 6D43  SFX data
        DECLE   $0025                           ; 6D44  SFX data
        DECLE   $006B                           ; 6D45  SFX data
        DECLE   $0380,  $00AA                   ; 6D46  SFX data
        DECLE   $0348,  $012E                   ; 6D48  SFX data
        DECLE   $00EB                           ; 6D4A  SFX data
        DECLE   $0005                           ; 6D4B  SFX data
        DECLE   $006B                           ; 6D4C  SFX data
        DECLE   $0380,  $0097                   ; 6D4D  SFX data
        DECLE   $00EB                           ; 6D4F  SFX data
        DECLE   $0005                           ; 6D50  SFX data
        DECLE   $0025                           ; 6D51  SFX data
        DECLE   $006B                           ; 6D52  SFX data
        DECLE   $0380,  $008F                   ; 6D53  SFX data
        DECLE   $0348,  $011D                   ; 6D55  SFX data
        DECLE   $026B                           ; 6D57  SFX data
        DECLE   $0005                           ; 6D58  SFX data
        DECLE   $0025                           ; 6D59  SFX data
        DECLE   $006B                           ; 6D5A  SFX data
        DECLE   $0380,  $00AA                   ; 6D5B  SFX data
        DECLE   $0348,  $0153                   ; 6D5D  SFX data
        DECLE   $026B                           ; 6D5F  SFX data
        DECLE   $0005                           ; 6D60  SFX data
        DECLE   $0025                           ; 6D61  SFX data
        DECLE   $006B                           ; 6D62  SFX data
        DECLE   $0380,  $00BE                   ; 6D63  SFX data
        DECLE   $0348,  $017D                   ; 6D65  SFX data
        DECLE   $026B                           ; 6D67  SFX data
        DECLE   $0025                           ; 6D68  SFX data
        DECLE   $006B                           ; 6D69  SFX data
        DECLE   $026B                           ; 6D6A  SFX data
        DECLE   $0005                           ; 6D6B  SFX data
        DECLE   $006B                           ; 6D6C  SFX data
        DECLE   $03F9                           ; 6D6D  SFX data
        DECLE   $00CF                           ; 6D6E  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 6D6F   0004 0118 03BE
        DECLE   $0002                           ; 6D72  SFX prio
        DECLE   $0077,  $0002,  $006F           ; 6D73  SFX data
        DECLE   $02CF                           ; 6D76  SFX end


        PULR    R7                              ; 6D77   02B7

L_6D78:
        PSHR    R5                              ; 6D78   0275

        JSR     R5,     X_PLAY_SFX1             ; 6D79   0004 0118 03BB
        DECLE   $03C9                           ; 6D7C  SFX data
        DECLE   $0035                           ; 6D7D  SFX data
        DECLE   $006B                           ; 6D7E  SFX data
        DECLE   $0380,  $00E2                   ; 6D7F  SFX data
        DECLE   $0348,  $01C5                   ; 6D81  SFX data
        DECLE   $02EB                           ; 6D83  SFX data
        DECLE   $0025                           ; 6D84  SFX data
        DECLE   $006B                           ; 6D85  SFX data
        DECLE   $0348,  $023B                   ; 6D86  SFX data
        DECLE   $02EB                           ; 6D88  SFX data
        DECLE   $0035                           ; 6D89  SFX data
        DECLE   $006B                           ; 6D8A  SFX data
        DECLE   $0380,  $00D7                   ; 6D8B  SFX data
        DECLE   $0348,  $01FC                   ; 6D8D  SFX data
        DECLE   $02EB                           ; 6D8F  SFX data
        DECLE   $0035                           ; 6D90  SFX data
        DECLE   $006B                           ; 6D91  SFX data
        DECLE   $0380,  $00E2                   ; 6D92  SFX data
        DECLE   $0348,  $01C5                   ; 6D94  SFX data
        DECLE   $02EB                           ; 6D96  SFX data
        DECLE   $0035                           ; 6D97  SFX data
        DECLE   $006B                           ; 6D98  SFX data
        DECLE   $0380,  $00FE                   ; 6D99  SFX data
        DECLE   $0348,  $01AC                   ; 6D9B  SFX data
        DECLE   $02EB                           ; 6D9D  SFX data
        DECLE   $0025                           ; 6D9E  SFX data
        DECLE   $006B                           ; 6D9F  SFX data
        DECLE   $0348,  $01AC                   ; 6DA0  SFX data
        DECLE   $02EB                           ; 6DA2  SFX data
        DECLE   $0035                           ; 6DA3  SFX data
        DECLE   $006B                           ; 6DA4  SFX data
        DECLE   $0380,  $00AA                   ; 6DA5  SFX data
        DECLE   $0348,  $01AC                   ; 6DA7  SFX data
        DECLE   $02EB                           ; 6DA9  SFX data
        DECLE   $0035                           ; 6DAA  SFX data
        DECLE   $006B                           ; 6DAB  SFX data
        DECLE   $0380,  $00BE                   ; 6DAC  SFX data
        DECLE   $0348,  $01AC                   ; 6DAE  SFX data
        DECLE   $012B                           ; 6DB0  SFX data
        DECLE   $0005                           ; 6DB1  SFX data
        DECLE   $006B                           ; 6DB2  SFX data
        DECLE   $0380,  $00D7                   ; 6DB3  SFX data
        DECLE   $012B                           ; 6DB5  SFX data
        DECLE   $0035                           ; 6DB6  SFX data
        DECLE   $006B                           ; 6DB7  SFX data
        DECLE   $0380,  $00E2                   ; 6DB8  SFX data
        DECLE   $0348,  $01C5                   ; 6DBA  SFX data
        DECLE   $02EB                           ; 6DBC  SFX data
        DECLE   $0035                           ; 6DBD  SFX data
        DECLE   $006B                           ; 6DBE  SFX data
        DECLE   $0380,  $00BE                   ; 6DBF  SFX data
        DECLE   $0348,  $01C5                   ; 6DC1  SFX data
        DECLE   $02EB                           ; 6DC3  SFX data
        DECLE   $0035                           ; 6DC4  SFX data
        DECLE   $006B                           ; 6DC5  SFX data
        DECLE   $0380,  $00AA                   ; 6DC6  SFX data
        DECLE   $0348,  $01FC                   ; 6DC8  SFX data
        DECLE   $02EB                           ; 6DCA  SFX data
        DECLE   $0035                           ; 6DCB  SFX data
        DECLE   $006B                           ; 6DCC  SFX data
        DECLE   $0380,  $0097                   ; 6DCD  SFX data
        DECLE   $0348,  $01FC                   ; 6DCF  SFX data
        DECLE   $02EB                           ; 6DD1  SFX data
        DECLE   $0035                           ; 6DD2  SFX data
        DECLE   $006B                           ; 6DD3  SFX data
        DECLE   $0380,  $008F                   ; 6DD4  SFX data
        DECLE   $0348,  $023B                   ; 6DD6  SFX data
        DECLE   $01EB                           ; 6DD8  SFX data
        DECLE   $0380,  $00BE                   ; 6DD9  SFX data
        DECLE   $00EB                           ; 6DDB  SFX data
        DECLE   $0035                           ; 6DDC  SFX data
        DECLE   $006B                           ; 6DDD  SFX data
        DECLE   $0380,  $0097                   ; 6DDE  SFX data
        DECLE   $02EB                           ; 6DE0  SFX data
        DECLE   $0005                           ; 6DE1  SFX data
        DECLE   $006B                           ; 6DE2  SFX data
        DECLE   $0380,  $008F                   ; 6DE3  SFX data
        DECLE   $008F,  $0019                   ; 6DE5  SFX data
        DECLE   $0005                           ; 6DE7  SFX data
        DECLE   $006B                           ; 6DE8  SFX data
        DECLE   $03F9                           ; 6DE9  SFX data
        DECLE   $02CF                           ; 6DEA  SFX end

L_6DEB:
        PSHR    R5                              ; 6DEB   0275

        JSR     R5,     X_PLAY_SFX2             ; 6DEC   0004 0118 03BE
        DECLE   $0001                           ; 6DEF  SFX prio
        DECLE   $007D                           ; 6DF0  SFX data
        DECLE   $0077,  $0002,  $006F           ; 6DF1  SFX data
        DECLE   $03C9                           ; 6DF4  SFX data
        DECLE   $017D                           ; 6DF5  SFX data
        DECLE   $0035                           ; 6DF6  SFX data
        DECLE   $00AB                           ; 6DF7  SFX data
        DECLE   $0280,  $008F                   ; 6DF8  SFX data
        DECLE   $0248,  $01AC                   ; 6DFA  SFX data
        DECLE   $00AB                           ; 6DFC  SFX data
        DECLE   $0035                           ; 6DFD  SFX data
        DECLE   $00AB                           ; 6DFE  SFX data
        DECLE   $0280,  $006B                   ; 6DFF  SFX data
        DECLE   $00AB                           ; 6E01  SFX data
        DECLE   $0035                           ; 6E02  SFX data
        DECLE   $00AB                           ; 6E03  SFX data
        DECLE   $0280,  $0071                   ; 6E04  SFX data
        DECLE   $0248,  $017D                   ; 6E06  SFX data
        DECLE   $00AB                           ; 6E08  SFX data
        DECLE   $0035                           ; 6E09  SFX data
        DECLE   $00AB                           ; 6E0A  SFX data
        DECLE   $0280,  $007F                   ; 6E0B  SFX data
        DECLE   $00AB                           ; 6E0D  SFX data
        DECLE   $0035                           ; 6E0E  SFX data
        DECLE   $00AB                           ; 6E0F  SFX data
        DECLE   $0280,  $008F                   ; 6E10  SFX data
        DECLE   $0248,  $0153                   ; 6E12  SFX data
        DECLE   $00AB                           ; 6E14  SFX data
        DECLE   $0035                           ; 6E15  SFX data
        DECLE   $00AB                           ; 6E16  SFX data
        DECLE   $0280,  $0097                   ; 6E17  SFX data
        DECLE   $0248,  $017D                   ; 6E19  SFX data
        DECLE   $00AB                           ; 6E1B  SFX data
        DECLE   $0035                           ; 6E1C  SFX data
        DECLE   $00AB                           ; 6E1D  SFX data
        DECLE   $0280,  $008F                   ; 6E1E  SFX data
        DECLE   $0248,  $0153                   ; 6E20  SFX data
        DECLE   $00AB                           ; 6E22  SFX data
        DECLE   $0035                           ; 6E23  SFX data
        DECLE   $00AB                           ; 6E24  SFX data
        DECLE   $0280,  $0097                   ; 6E25  SFX data
        DECLE   $0248,  $017D                   ; 6E27  SFX data
        DECLE   $00AB                           ; 6E29  SFX data
        DECLE   $0035                           ; 6E2A  SFX data
        DECLE   $00AB                           ; 6E2B  SFX data
        DECLE   $0280,  $008F                   ; 6E2C  SFX data
        DECLE   $0248,  $0153                   ; 6E2E  SFX data
        DECLE   $016B                           ; 6E30  SFX data
        DECLE   $0025                           ; 6E31  SFX data
        DECLE   $00AB                           ; 6E32  SFX data
        DECLE   $0005                           ; 6E33  SFX data
        DECLE   $00AB                           ; 6E34  SFX data
        DECLE   $0280,  $006B                   ; 6E35  SFX data
        DECLE   $00AB                           ; 6E37  SFX data
        DECLE   $0025                           ; 6E38  SFX data
        DECLE   $00AB                           ; 6E39  SFX data
        DECLE   $0248,  $0153                   ; 6E3A  SFX data
        DECLE   $00AB                           ; 6E3C  SFX data
        DECLE   $0035                           ; 6E3D  SFX data
        DECLE   $00AB                           ; 6E3E  SFX data
        DECLE   $0280,  $008F                   ; 6E3F  SFX data
        DECLE   $0248,  $0153                   ; 6E41  SFX data
        DECLE   $016B                           ; 6E43  SFX data
        DECLE   $0025                           ; 6E44  SFX data
        DECLE   $00AB                           ; 6E45  SFX data
        DECLE   $0005                           ; 6E46  SFX data
        DECLE   $00AB                           ; 6E47  SFX data
        DECLE   $0280,  $006B                   ; 6E48  SFX data
        DECLE   $016B                           ; 6E4A  SFX data
        DECLE   $0025                           ; 6E4B  SFX data
        DECLE   $00AB                           ; 6E4C  SFX data
        DECLE   $0035                           ; 6E4D  SFX data
        DECLE   $00AB                           ; 6E4E  SFX data
        DECLE   $0077,  $0002,  $006F           ; 6E4F  SFX data
        DECLE   $02CF                           ; 6E52  SFX end

        DECLE   $03C9,  $007D,  $0280,  $008F   ; 6E53   03C9 007D 0280 008F
        DECLE   $0248,  $01AC,  $01EB,  $0035   ; 6E57   0248 01AC 01EB 0035
        DECLE   $00EB,  $0280,  $0055,  $00EB   ; 6E5B   00EB 0280 0055 00EB
        DECLE   $0025,  $006B,  $0248,  $01AC   ; 6E5F   0025 006B 0248 01AC
        DECLE   $00EB,  $0035,  $006B,  $0280   ; 6E63   00EB 0035 006B 0280
        DECLE   $008F,  $0248,  $01AC,  $01EB   ; 6E67   008F 0248 01AC 01EB
        DECLE   $0035,  $00EB,  $0280,  $0055   ; 6E6B   0035 00EB 0280 0055
        DECLE   $01EB,  $0035,  $00EB,  $0280   ; 6E6F   01EB 0035 00EB 0280
        DECLE   $007F,  $0248,  $017D,  $01EB   ; 6E73   007F 0248 017D 01EB
        DECLE   $0035,  $00EB,  $0280,  $005F   ; 6E77   0035 00EB 0280 005F
        DECLE   $01EB,  $0035,  $00EB,  $0280   ; 6E7B   01EB 0035 00EB 0280
        DECLE   $008F,  $0248,  $01AC,  $01EB   ; 6E7F   008F 0248 01AC 01EB
        DECLE   $0035,  $00EB,  $0280,  $006B   ; 6E83   0035 00EB 0280 006B
        DECLE   $01EB,  $0035,  $00EB,  $0280   ; 6E87   01EB 0035 00EB 0280
        DECLE   $007F,  $0248,  $017D,  $01EB   ; 6E8B   007F 0248 017D 01EB
        DECLE   $0035,  $00EB,  $0280,  $005F   ; 6E8F   0035 00EB 0280 005F
        DECLE   $01EB,  $0035,  $00EB,  $0280   ; 6E93   01EB 0035 00EB 0280
        DECLE   $008F,  $0248,  $01AC,  $01EB   ; 6E97   008F 0248 01AC 01EB
        DECLE   $0035,  $00EB,  $0280,  $006B   ; 6E9B   0035 00EB 0280 006B
        DECLE   $01EB,  $0035                   ; 6E9F   01EB 0035

        ADDR    R5,     R3                      ; 6EA1   00EB
        RRC     R3,     2                       ; 6EA2   0077
        EIS                                     ; 6EA3   0002
        SAR     R3,     2                       ; 6EA4   006F
        ADD@    R1,     R7                      ; 6EA5   02CF

        DECLE   $03C9,  $00FD,  $0280,  $00AA   ; 6EA6   03C9 00FD 0280 00AA
        DECLE   $0248,  $0140,  $00AB,  $0035   ; 6EAA   0248 0140 00AB 0035
        DECLE   $00AB,  $0280,  $00AA,  $0248   ; 6EAE   00AB 0280 00AA 0248
        DECLE   $0140,  $00AB,  $0035,  $00AB   ; 6EB2   0140 00AB 0035 00AB
        DECLE   $0280,  $00A0,  $0248,  $0153   ; 6EB6   0280 00A0 0248 0153
        DECLE   $00AB,  $0035,  $00AB,  $0280   ; 6EBA   00AB 0035 00AB 0280
        DECLE   $00A0,  $0248,  $0153,  $00AB   ; 6EBE   00A0 0248 0153 00AB
        DECLE   $0035                           ; 6EC2   0035

        MOVR    R5,     R3                      ; 6EC3   00AB
        MVI     G_0097, R0                      ; 6EC4   0280 0097
L_6EC6:
        MVO@    R0,     R1                      ; 6EC6   0248
        DECLE   $0168,  $00AB,  $0035,  $00AB   ; 6EC7   0168 00AB 0035 00AB
        DECLE   $0280,  $0097,  $0248,  $0168   ; 6ECB   0280 0097 0248 0168
        DECLE   $00AB,  $0035,  $00AB,  $0280   ; 6ECF   00AB 0035 00AB 0280
        DECLE   $0087,  $0248,  $017D,  $00AB   ; 6ED3   0087 0248 017D 00AB
        DECLE   $0035,  $00AB,  $0280,  $0087   ; 6ED7   0035 00AB 0280 0087
        DECLE   $0248,  $017D,  $00AB,  $0035   ; 6EDB   0248 017D 00AB 0035
        DECLE   $00AB,  $0280,  $007F,  $0248   ; 6EDF   00AB 0280 007F 0248
        DECLE   $0194,  $022B,  $0005,  $00AB   ; 6EE3   0194 022B 0005 00AB
        DECLE   $0280,  $00AA,  $00AB,  $0025   ; 6EE7   0280 00AA 00AB 0025
        DECLE   $00AB,  $0248,  $0194,  $00AB   ; 6EEB   00AB 0248 0194 00AB
        DECLE   $0035                           ; 6EEF   0035

        MOVR    R5,     R3                      ; 6EF0   00AB
L_6EF1:
        MVI     G_007F, R0                      ; 6EF1   0280 007F
        MVO@    R0,     R1                      ; 6EF3   0248
        ANDR    R2,     R4                      ; 6EF4   0194
        BMI     L_6EF1                          ; 6EF5   022B 0005

        MOVR    R5,     R3                      ; 6EF7   00AB
        MVI     G_00AA, R0                      ; 6EF8   0280 00AA
        BMI     L_6EC6                          ; 6EFA   022B 0035

        MOVR    R5,     R3                      ; 6EFC   00AB
        RRC     R3,     2                       ; 6EFD   0077
        EIS                                     ; 6EFE   0002
        SAR     R3,     2                       ; 6EFF   006F
        XORI    #$02CF, R1                      ; 6F00   03F9 02CF
UC_6F02:
        MVI     G_015C, R0                      ; 6F02  SLIB UCALL target
        TSTR    R0                              ; 6F04   0080
        BEQ     L_6F0F                          ; 6F05   0204 0008

        DECR    R0                              ; 6F07   0010
        BEQ     L_6F14                          ; 6F08   0204 000A

        SDBD                                    ; 6F0A   0001
        MVII    #$6E53, R4                      ; 6F0B   02BC 0053 006E
        PULR    R7                              ; 6F0E   02B7

L_6F0F:
        SDBD                                    ; 6F0F   0001
        MVII    #$6EA6, R4                      ; 6F10   02BC 00A6 006E
        PULR    R7                              ; 6F13   02B7

L_6F14:
        SDBD                                    ; 6F14   0001
        MVII    #$6DF4, R4                      ; 6F15   02BC 00F4 006D
        PULR    R7                              ; 6F18   02B7

L_6F19:
        PSHR    R5                              ; 6F19   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F1A   0004 0118 03BE
        DECLE   $0010                           ; 6F1D  SFX prio

        XOR@    R5,     R1                      ; 6F1E   03E9
        AND     G_0074, R0                      ; 6F1F   0380 0074
        ADCR    R3                              ; 6F21   002B
        AND     G_0069, R0                      ; 6F22   0380 0069
        ADCR    R3                              ; 6F24   002B
        AND     G_005F, R0                      ; 6F25   0380 005F
        ADCR    R3                              ; 6F27   002B
        AND     G_0056, R0                      ; 6F28   0380 0056
        ADCR    R3                              ; 6F2A   002B
        AND     G_004E, R0                      ; 6F2B   0380 004E
        ADCR    R3                              ; 6F2D   002B
        AND     G_0046, R0                      ; 6F2E   0380 0046
        ADCR    R3                              ; 6F30   002B
        AND     G_0040, R0                      ; 6F31   0380 0040
        ADCR    R3                              ; 6F33   002B
        AND     G_0046, R0                      ; 6F34   0380 0046
        ADCR    R3                              ; 6F36   002B
        ADDR    R1,     R7                      ; 6F37   00CF

        JSR     R5,     X_PLAY_SFX2             ; 6F38   0004 0118 03BE
        DECLE   $0002                           ; 6F3B  SFX prio

        RRC     R3,     2                       ; 6F3C   0077
        EIS                                     ; 6F3D   0002
        SAR     R3,     2                       ; 6F3E   006F
        ADD@    R1,     R7                      ; 6F3F   02CF
        PULR    R7                              ; 6F40   02B7

L_6F41:
        PSHR    R5                              ; 6F41   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F42   0004 0118 03BE
        DECLE   $000E                           ; 6F45  SFX prio
        DECLE   $03E9,  $0340,  $0357,  $00EB   ; 6F46   03E9 0340 0357 00EB
        DECLE   $0005,  $006B,  $0340,  $02CF   ; 6F4A   0005 006B 0340 02CF
        DECLE   $00EB,  $0005,  $006B,  $0340   ; 6F4E   00EB 0005 006B 0340
        DECLE   $0357,  $012B,  $0005,  $006B   ; 6F52   0357 012B 0005 006B
        DECLE   $0340,  $02CF,  $012B,  $0005   ; 6F56   0340 02CF 012B 0005

        SAR     R3,     1                       ; 6F5A   006B
        ADDR    R1,     R7                      ; 6F5B   00CF

        JSR     R5,     X_PLAY_SFX2             ; 6F5C   0004 0118 03BE
        DECLE   $0002                           ; 6F5F  SFX prio

        RRC     R3,     2                       ; 6F60   0077
        EIS                                     ; 6F61   0002
        SAR     R3,     2                       ; 6F62   006F
        ADD@    R1,     R7                      ; 6F63   02CF
        PULR    R7                              ; 6F64   02B7

L_6F65:
        PSHR    R5                              ; 6F65   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F66   0004 0118 03BE
        DECLE   $0014                           ; 6F69  SFX prio
        DECLE   $0389,  $0040,  $00C8,  $0048   ; 6F6A   0389 0040 00C8 0048
        DECLE   $00D2,  $0044,  $00FF,  $0011   ; 6F6E   00D2 0044 00FF 0011
        DECLE   $03EF                           ; 6F72   03EF

        ADCR    R4                              ; 6F73   002C
        ANDI    #$000B, R0                      ; 6F74   03B8 000B
        MOVR    R1,     R7                      ; 6F76   008F

        DECR    R3                              ; 6F77   0013
        ADDR    R1,     R7                      ; 6F78   00CF

        JSR     R5,     X_PLAY_SFX2             ; 6F79   0004 0118 03BE
        DECLE   $0002                           ; 6F7C  SFX prio

        RRC     R3,     2                       ; 6F7D   0077
        EIS                                     ; 6F7E   0002
        SAR     R3,     2                       ; 6F7F   006F
        ADD@    R1,     R7                      ; 6F80   02CF
        PULR    R7                              ; 6F81   02B7

L_6F82:
        PSHR    R5                              ; 6F82   0275

        JSR     R5,     X_PLAY_SFX2             ; 6F83   0004 0118 03BE
        DECLE   $0014                           ; 6F86  SFX prio

        XOR@    R5,     R1                      ; 6F87   03E9
        SWAP    R0,     1                       ; 6F88   0040
        SUB@    R4,     R0                      ; 6F89   0320
        COMR    R4                              ; 6F8A   001C
        XORR    R3,     R4                      ; 6F8B   01DC
        CMP@    R1,     R3                      ; 6F8C   034B
        MOVR    R1,     R7                      ; 6F8D   008F

        DECR    R3                              ; 6F8E   0013
        ADDR    R1,     R7                      ; 6F8F   00CF

        JSR     R5,     X_PLAY_SFX2             ; 6F90   0004 0118 03BE
        DECLE   $0002                           ; 6F93  SFX prio

        RRC     R3,     2                       ; 6F94   0077
        EIS                                     ; 6F95   0002
        SAR     R3,     2                       ; 6F96   006F
        ADD@    R1,     R7                      ; 6F97   02CF

        PSHR    R5                              ; 6F98   0275
        MVI     G_0102, R1                      ; 6F99   0281 0102
        CMPI    #$0081, R1                      ; 6F9B   0379 0081
        BEQ     L_6FE6                          ; 6F9D   0204 0047

        MVI     G_015D, R0                      ; 6F9F   0280 015D
        MVI     G_015E, R5                      ; 6FA1   0285 015E
        TSTR    R5                              ; 6FA3   00AD
        BNEQ    L_6FA8                          ; 6FA4   020C 0002

        MVI     G_01EF, R0                      ; 6FA6   0280 01EF
L_6FA8:
        CMPI    #$0000, R0                      ; 6FA8   0378 0000
        BNEQ    L_6FB0                          ; 6FAA   020C 0004

        MVI     .PSG0.lft_hand,R0               ; 6FAC   0280 01FF
        B       L_6FB2                          ; 6FAE   0200 0002

L_6FB0:
        MVI     .PSG0.rgt_hand,R0               ; 6FB0   0280 01FE
L_6FB2:
        ANDI    #$001F, R0                      ; 6FB2   03B8 001F
        CMP     G_01ED, R0                      ; 6FB4   0340 01ED
        BEQ     L_6FBC                          ; 6FB6   0204 0004

        MVO     R0,     G_01ED                  ; 6FB8   0240 01ED
        B       L_6FE6                          ; 6FBA   0200 002A

L_6FBC:
        CMP     G_01EE, R0                      ; 6FBC   0340 01EE
        BEQ     L_6FE6                          ; 6FBE   0204 0026

        MVO     R0,     G_01EE                  ; 6FC0   0240 01EE
        CMPI    #$001F, R0                      ; 6FC2   0378 001F
        BEQ     L_6FDB                          ; 6FC4   0204 0015

        CLRR    R2                              ; 6FC6   01D2
        SDBD                                    ; 6FC7   0001
        MVII    #$6FF0, R4                      ; 6FC8   02BC 00F0 006F
        MVI     G_01ED, R0                      ; 6FCB   0280 01ED
L_6FCD:
        MVI@    R4,     R3                      ; 6FCD   02A3
        CMPR    R3,     R0                      ; 6FCE   0158
        BEQ     L_6FD8                          ; 6FCF   0204 0007

        INCR    R2                              ; 6FD1   000A
        CMPI    #$0010, R2                      ; 6FD2   037A 0010
        BNEQ    L_6FCD                          ; 6FD4   022C 0008
        B       L_6FE6                          ; 6FD6   0200 000E

L_6FD8:
        MOVR    R2,     R0                      ; 6FD8   0090
        B       L_6FDF                          ; 6FD9   0200 0004

L_6FDB:
        SDBD                                    ; 6FDB   0001
        MVII    #$FFFF, R0                      ; 6FDC   02B8 00FF 00FF
L_6FDF:
        MVO     R1,     .STIC.VIDEN             ; 6FDF   0241 0020

        JSR     R5,     L_6101                  ; 6FE1   0004 0160 0101

        MVO     R1,     .STIC.VIDEN             ; 6FE4   0241 0020
L_6FE6:
        PULR    R5                              ; 6FE6   02B5
        CLRR    R0                              ; 6FE7   01C0
        CLRR    R1                              ; 6FE8   01C9
        MVI     G_01EB, R0                      ; 6FE9   0280 01EB
        MVI     G_01EC, R1                      ; 6FEB   0281 01EC
        SWAP    R1,     1                       ; 6FED   0041
        XORR    R0,     R1                      ; 6FEE   01C1
        MOVR    R1,     R7                      ; 6FEF   008F

        COMR    R5                              ; 6FF0   001D
        COMR    R1                              ; 6FF1   0019
        INCR    R1                              ; 6FF2   0009
        INCR    R3                              ; 6FF3   000B
        COMR    R3                              ; 6FF4   001B
        DECR    R3                              ; 6FF5   0013
        DIS                                     ; 6FF6   0003
        SETC                                    ; 6FF7   0007
L_6FF8:
        DECR    R7                              ; 6FF8   0017

        DECR    R6                              ; 6FF9   0016
        CLRC                                    ; 6FFA   0006
        INCR    R6                              ; 6FFB   000E
        COMR    R6                              ; 6FFC   001E
        COMR    R4                              ; 6FFD   001C
        INCR    R4                              ; 6FFE   000C
        INCR    R5                              ; 6FFF   000D
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5038       <entry>
;;  $504D       <entry>
;;  $5100       <entry>
;;  $5126       $5123  
;;  $51B2       $51C0  
;;  $51B3       $51A2   $51A5  
;;  $51BD       $51B5  
;;  $51CA       $51C6  
;;  $5202       $51F1  
;;  $520D       $5317  
;;  $520F       $5200   $520B  
;;  $5227       $52FA  
;;  $529A       $5101   $526B  
;;  $529F       $52A8  
;;  $52A6       $52A2  
;;  $52C5       $52BB   $52C1  
;;  $52D1       $52CB   $52DB  
;;  $52DE       $51FB  
;;  $52FC       <entry>
;;  $532F       $5325  
;;  $5330       $5301   $5306   $5311  
;;  $5337       $533A  
;;  $5350       $534A  
;;  $5362       $535B  
;;  $5363       $50BE   $5268   $533F  
;;  $5373       $537D  
;;  $538D       $5389  
;;  $539B       $5391  
;;  $53A9       $5399  
;;  $53C8       $53BC   $53C4  
;;  $53DF       <entry>
;;  $5406       $53E4   $53FD   $5401  
;;  $5425       $540E  
;;  $5427       $5456  
;;  $543B       $5438  
;;  $5453       $5429  
;;  $5459       $5410   $5444  
;;  $5470       $5466  
;;  $5478       $546E  
;;  $5488       $541A   $5420   $5472   $547A   $5482  
;;  $5489       $64D3   $660F  
;;  $548D       $54D5  
;;  $54A8       $54A3  
;;  $54CB       $54C7  
;;  $54D7       $54AB   $54AF  
;;  $5560       $555E  
;;  $556E       $556C  
;;  $557C       $557A  
;;  $55EF       $50D7   $533C  
;;  $55FE       $55FA   $5609   $567A  
;;  $5611       $5615  
;;  $5621       $567C  
;;  $5624       $561B   $561F  
;;  $562F       $565A   $5661  
;;  $564A       $5640   $5644  
;;  $5657       $5637  
;;  $5677       $5667  
;;  $5678       $5605  
;;  $5682       $51E7   $51EE   $5621  
;;  $5698       $569E  
;;  $5D11       $5D0F  
;;  $6101       $6FE1  
;;  $6111       $6104  
;;  $6118       $5039  
;;  $6133       $6127  
;;  $6134       $6131  
;;  $6154       $614E  
;;  $6167       $613D  
;;  $6178       $6139   $616E  
;;  $617E       $6176  
;;  $6196       $6165   $6169  
;;  $61BD       $6262  
;;  $61D4       $61CE  
;;  $61DD       $61DF  
;;  $61FC       $6240  
;;  $6226       $6220  
;;  $623A       $6224  
;;  $623B       $6203   $6209   $6212   $6216  
;;  $6246       $61E9  
;;  $6260       $61C3   $61C9  
;;  $6291       $6288   $628C  
;;  $62A0       $61D2   $61E3   $625E   $6268   $6275  
;;  $62AA       $62A5   $62B3   $62C1   $62D6   $62F9   $62FC   $6302  
;;  $62AD       $62A8  
;;  $62B5       $611D   $62DB   $62E5   $62EF  
;;  $62B6       $61AA   $61AE  
;;  $62C3       $62B8   $62BC  
;;  $62CC       $62C8  
;;  $62D4       $62D0  
;;  $62DD       $62B0  
;;  $62FB       $6304  
;;  $62FE       $62EB  
;;  $6306       $54B6   $61F6   $65D1  
;;  $6329       $6325  
;;  $634F       $634B  
;;  $6358       $6355  
;;  $635B       $6351  
;;  $6360       $635D  
;;  $6361       $6359  
;;  $637C       $6318   $631E   $632A   $6338  
;;  $637D       $6332  
;;  $638C       $6386  
;;  $63BF       $63AD  
;;  $63C1       $63BD  
;;  $63E0       $638A   $6392   $63A1   $63A7   $63B3   $63B9   $63D7  
;;  $63E1       <entry>
;;  $63E5       $6547  
;;  $640B       $6411  
;;  $6415       $63FE  
;;  $6419       $6405  
;;  $6437       $644C  
;;  $644A       $643B  
;;  $6470       $645A  
;;  $6474       $6469  
;;  $647A       $6467   $6472  
;;  $6484       $6478  
;;  $648E       $64C6  
;;  $64AA       $6499   $649F  
;;  $64C2       $64A8   $64BF  
;;  $64C3       $6494  
;;  $64D2       $64CE  
;;  $64D8       $64DA  
;;  $64EA       $64E6  
;;  $64EC       $64C9  
;;  $64F7       $6550  
;;  $64FB       $6556  
;;  $651E       $6519  
;;  $651F       $64F5  
;;  $653A       $63F0   $647C   $6482   $652C   $6535   $6591   $6624  
;;  $654A       $64F2  
;;  $6558       $6529  
;;  $658A       $6596   $659C   $65CE  
;;  $658C       $6402  
;;  $6593       $6569  
;;  $65C4       $65BB  
;;  $65D0       $644F  
;;  $65D7       $6622  
;;  $65FF       $65F9  
;;  $661A       $662B  
;;  $661D       $65DE   $65E4   $65ED   $65F1   $65FD  
;;  $6626       $660D  
;;  $662D       $61ED   $652E  
;;  $6631       $6639  
;;  $663E       $6635  
;;  $6644       $6522  
;;  $6646       $664E  
;;  $6652       $664A  
;;  $6656       $647E   $668B  
;;  $6676       $6688  
;;  $6682       $666D   $667A   $667F  
;;  $6686       $6670  
;;  $668A       $55FE   $640B  
;;  $6698       $6692  
;;  $66BF       <entry>
;;  $66C6       <entry>
;;  $66D6       $66DC  
;;  $66DE       $6879   $68B9  
;;  $66DF       $66D8  
;;  $66F0       $66F9  
;;  $66FB       $66F5  
;;  $6706       $66D2  
;;  $6717       $503C  
;;  $672A       $671C   $6720   $6A45  
;;  $6733       $672E  
;;  $673A       $687E   $68C7  
;;  $6742       $673F  
;;  $6746       $6874  
;;  $676D       $6769  
;;  $6770       $6764  
;;  $6779       $6775  
;;  $677A       $676E  
;;  $678C       $67A0  
;;  $67A2       $6791   $6797  
;;  $67AB       $67A6  
;;  $67C1       $67B9  
;;  $67C5       $67BF  
;;  $67C6       $67BD   $67C3  
;;  $67D4       $67C9   $67CF  
;;  $67D5       $67AE  
;;  $67EB       $67E5  
;;  $6802       $55AA   $6884  
;;  $680E       $6806   $680A  
;;  $680F       $680D  
;;  $682A       $6826  
;;  $6830       $681C   $681E  
;;  $6842       $6834  
;;  $684C       $682E   $6840   $6882  
;;  $6857       $685E   $6862  
;;  $6864       $6839   $683E   $6845   $684A   $6859   $68CB  
;;  $686E       $6786   $67DB   $67DF   $67E9   $67F3   $67FC   $6800   $6868  
;;  $6871       $6749  
;;  $6876       $6728  
;;  $6880       $67F8  
;;  $6886       $6736  
;;  $6896       $688A  
;;  $6898       $6890   $6894  
;;  $68A4       $68A1  
;;  $68B4       $68AA   $68B0  
;;  $68C3       $68BF  
;;  $68C9       $6811  
;;  $68D1       $683B   $6842  
;;  $68E7       $68F8   $694F   $695F  
;;  $68ED       $68DA   $68E8  
;;  $68EF       $68DC  
;;  $68FA       $68E1   $68F2   $6949   $6959  
;;  $68FC       $675C   $69CB   $69F6  
;;  $690F       $6905  
;;  $6914       $690D  
;;  $691F       $6911   $6916   $691C  
;;  $6939       $6836   $6847  
;;  $6946       $6954  
;;  $6951       $6942  
;;  $6956       $6944  
;;  $6961       $61B0   $67EF  
;;  $697E       $6978  
;;  $699C       $6994  
;;  $69A0       $697C   $6980  
;;  $69A2       $699A   $699E  
;;  $69C0       $69BA  
;;  $69E7       $69AC   $69B2   $69BE  
;;  $6A1B       $6A0A   $6A11   $6A17  
;;  $6A34       $6A2C  
;;  $6A37       $6A32  
;;  $6A41       $6724  
;;  $6A4B       $5674   $629A   $6488   $64DC   $6614  
;;  $6A89       $6A7E  
;;  $6A8A       $6B68  
;;  $6A9D       $6A97  
;;  $6AAC       $6A9B   $6AA5  
;;  $6AB4       $6A95   $6AA7   $6AAA  
;;  $6ABE       $6ABA  
;;  $6ACE       $6ACA  
;;  $6ADA       $6B13  
;;  $6AF7       $6AF4  
;;  $6B0A       $6ADE  
;;  $6B0E       $6376  
;;  $6B15       $6AC2   $6AD0   $6AD7  
;;  $6B2E       $6B27  
;;  $6B38       $6B2C  
;;  $6B44       $6B3C  
;;  $6B4C       $6B65  
;;  $6B5F       $6B50   $6B58  
;;  $6B62       $6B33  
;;  $6B67       $6A62  
;;  $6B6A       $6233  
;;  $6BBE       $6379  
;;  $6BE3       $65CB  
;;  $6C19       $629D  
;;  $6C40       $63DD  
;;  $6CAE       $651B  
;;  $6CC5       $6A73  
;;  $6CDC       $51CA   $531A  
;;  $6D78       $6587  
;;  $6DEB       $535F  
;;  $6EC6       $6EFA  
;;  $6EF1       $6EF5  
;;  $6F02       <entry>
;;  $6F0F       $6F05  
;;  $6F14       $6F08  
;;  $6F19       $6617  
;;  $6F41       $625B  
;;  $6F65       $69E4  
;;  $6F82       $637D  
;;  $6FA8       $6FA4  
;;  $6FB0       $6FAA  
;;  $6FB2       $6FAE  
;;  $6FBC       $6FB6  
;;  $6FCD       $6FD4  
;;  $6FD8       $6FCF  
;;  $6FDB       $6FC4  
;;  $6FDF       $6FD9  
;;  $6FE6       $6F9D   $6FBA   $6FBE   $6FD6  
;;  $6FF8       $6FF8  
;; ======================================================================== ;;
