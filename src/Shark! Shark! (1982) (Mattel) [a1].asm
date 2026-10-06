
        ORG     $5000
.HEADER:
        BIDECLE $56DA           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $506B           ; 5004  Ptr: Start of game
        BIDECLE $52EF           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5036           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5043           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0009,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $001A,  $005B,  $0010,  $0000; 5020  Timer dispatch/interval
        DECLE   $0075,  $005B,  $002D,  $0000; 5024  Timer dispatch/interval
        DECLE   $007F,  $005C,  $000A,  $0000; 5028  Timer dispatch/interval
        DECLE   $00EA,  $005C,  $0002,  $0000; 502C  Timer dispatch/interval
        DECLE   $005B,  $005D,  $0050,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.GRAM_INIT_5036:
        DECLE   $0030           ; 5036  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5037  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5039  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 503B  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 503D  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 503F  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 5041  #28-2F:  CART #28-2F ----

.TITLE:
        DECLE   $0052                           ; 5043  Cartridge year
        DECLE   $0000                           ; 5044  

.TITLECODE:
        PSHR    R5                              ; 5045   0275
        MVII    #$0009, R0                      ; 5046   02B8 0009
        MVO     R0,     .STIC.CS.0              ; 5048   0240 0028
        MVO     R0,     .STIC.BORD              ; 504A   0240 002C
        MVII    #$028F, R4                      ; 504C   02BC 028F
        CLRR    R3                              ; 504E   01DB

        JSR     R5,     X_PRINT_R5              ; 504F   0004 0118 007B
        STRING  "SHARK!  SHARK!"                ; 5052  
        DECLE   $0000                           ; 5060   0000

        PULR    R7                              ; 5061   02B7

        DIS                                     ; 5062   0003
        MVII    #$02F1, R6                      ; 5063   02BE 02F1

        JSR     R5,     .EXEC.A83               ; 5065   0004 0118 0283

        J       .EXEC.041                       ; 5068   0004 0310 0041

.START:
        PSHR    R5                              ; 506B   0275

        JSR     R5,     .EXEC.7B3               ; 506C   0004 0114 03B3
        JSR     R5,     L_51A2                  ; 506F   0004 0150 01A2

        MVII    #$0010, R0                      ; 5072   02B8 0010
        MVO     R0,     G_0117                  ; 5074   0240 0117
        MVII    #$0064, R0                      ; 5076   02B8 0064
        MVO     R0,     G_0118                  ; 5078   0240 0118
        MVII    #$015D, R4                      ; 507A   02BC 015D
        MVII    #$0093, R0                      ; 507C   02B8 0093

        JSR     R5,     X_FILL_ZERO             ; 507E   0004 0114 0338

        MVII    #$031D, R4                      ; 5081   02BC 031D
        MVII    #$0040, R0                      ; 5083   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 5085   0004 0114 0338

        MVII    #$0200, R4                      ; 5088   02BC 0200
        MVII    #$00F0, R0                      ; 508A   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 508C   0004 0114 0338

        MVII    #$0007, R3                      ; 508F   02BB 0007
        MVII    #$0254, R4                      ; 5091   02BC 0254

        JSR     R5,     X_PRINT_R5              ; 5093   0004 0118 007B
        STRING  "SELECT 1 OR 2"                 ; 5096  
        DECLE   $0000                           ; 50A3   0000

        MVII    #$0007, R3                      ; 50A4   02BB 0007
        MVII    #$027C, R4                      ; 50A6   02BC 027C

        JSR     R5,     X_PRINT_R5              ; 50A8   0004 0118 007B
        STRING  "PLAYERS  :"                    ; 50AB  
        DECLE   $0000                           ; 50B5   0000
L_50B6:
        MVII    #$0001, R0                      ; 50B6   02B8 0001
        MVII    #$0288, R1                      ; 50B8   02B9 0288
        CLRR    R2                              ; 50BA   01D2
        MVII    #$0007, R3                      ; 50BB   02BB 0007
        SDBD                                    ; 50BD   0001
        MVII    #$5185, R4                      ; 50BE   02BC 0085 0051

        JSR     R5,     .EXEC.910               ; 50C1   0004 0118 0110

        TSTR    R0                              ; 50C4   0080
        BEQ     L_519D                          ; 50C5   0204 00D6

        CMPI    #$0002, R0                      ; 50C7   0378 0002
        BGT     L_519D                          ; 50C9   020E 00D2

        MVO     R0,     G_0172                  ; 50CB   0240 0172
        MVII    #$0250, R4                      ; 50CD   02BC 0250
        MVII    #$003C, R0                      ; 50CF   02B8 003C

        JSR     R5,     X_FILL_ZERO             ; 50D1   0004 0114 0338

        MVII    #$0028, R1                      ; 50D4   02B9 0028
        SDBD                                    ; 50D6   0001
        MVII    #$54BF, R3                      ; 50D7   02BB 00BF 0054
        SDBD                                    ; 50DA   0001
        MVII    #$546F, R4                      ; 50DB   02BC 006F 0054

        JSR     R5,     L_511A                  ; 50DE   0004 0150 011A

        MVII    #$0005, R1                      ; 50E1   02B9 0005
        MVO     R1,     G_0164                  ; 50E3   0241 0164
        CLRR    R1                              ; 50E5   01C9
        MVO     R1,     G_0173                  ; 50E6   0241 0173

        JSR     R5,     L_52A1                  ; 50E8   0004 0150 02A1

        CLRR    R0                              ; 50EB   01C0

        JSR     R5,     L_51C4                  ; 50EC   0004 0150 01C4
        JSR     R5,     L_5125                  ; 50EF   0004 0150 0125

        MVI     G_0172, R1                      ; 50F2   0281 0172
        DECR    R1                              ; 50F4   0011
        BEQ     L_5107                          ; 50F5   0204 0010

        MVO     R1,     G_0173                  ; 50F7   0241 0173
        MVII    #$0005, R1                      ; 50F9   02B9 0005
        MVO     R1,     G_0165                  ; 50FB   0241 0165

        JSR     R5,     L_52A1                  ; 50FD   0004 0150 02A1

        CLRR    R0                              ; 5100   01C0

        JSR     R5,     L_51C4                  ; 5101   0004 0150 01C4
        JSR     R5,     L_5147                  ; 5104   0004 0150 0147
L_5107:
        JSR     R5,     L_516B                  ; 5107   0004 0150 016B
        JSR     R5,     L_5F8A                  ; 510A   0004 015C 038A
        JSR     R5,     L_51B3                  ; 510D   0004 0150 01B3

        SDBD                                    ; 5110   0001
        MVII    #$5193, R0                      ; 5111   02B8 0093 0051
        MVO     R0,     G_035D                  ; 5114   0240 035D

        JSR     R5,     L_64D2                  ; 5116   0004 0164 00D2

        PULR    R7                              ; 5119   02B7

L_511A:
        PSHR    R5                              ; 511A   0275
L_511B:
        MVI@    R4,     R2                      ; 511B   02A2
        MVI@    R4,     R5                      ; 511C   02A5
        ADDR    R3,     R5                      ; 511D   00DD
        SDBD                                    ; 511E   0001
        MVI@    R5,     R0                      ; 511F   02A8
        MVO@    R0,     R2                      ; 5120   0250
        DECR    R1                              ; 5121   0011
        BNEQ    L_511B                          ; 5122   022C 0008
        PULR    R7                              ; 5124   02B7

L_5125:
        PSHR    R5                              ; 5125   0275
        MVI     G_0324, R3                      ; 5126   0283 0324
        MVII    #$031D, R2                      ; 5128   02BA 031D
        SDBD                                    ; 512A   0001
        MVII    #$5517, R1                      ; 512B   02B9 0017 0055

        JSR     R5,     X_INIT_MOB              ; 512E   0004 0114 02B2

        MVO     R3,     G_0324                  ; 5131   0243 0324
        CLRR    R0                              ; 5133   01C0
        MVO     R0,     G_0168                  ; 5134   0240 0168
        MVO     R0,     G_016C                  ; 5136   0240 016C
        MVO     R0,     G_016E                  ; 5138   0240 016E
        INCR    R0                              ; 513A   0008
        MVO     R0,     G_016A                  ; 513B   0240 016A
        SDBD                                    ; 513D   0001
        MVII    #$60C3, R1                      ; 513E   02B9 00C3 0060
        MVI@    R1,     R1                      ; 5141   0289
        ADD     G_0175, R1                      ; 5142   02C1 0175
        MVO     R1,     G_0166                  ; 5144   0241 0166
        PULR    R7                              ; 5146   02B7

L_5147:
        PSHR    R5                              ; 5147   0275
        MVI     G_032C, R3                      ; 5148   0283 032C
        MVII    #$0325, R2                      ; 514A   02BA 0325
        SDBD                                    ; 514C   0001
        MVII    #$5527, R1                      ; 514D   02B9 0027 0055

        JSR     R5,     X_INIT_MOB              ; 5150   0004 0114 02B2

        MVO     R3,     G_032C                  ; 5153   0243 032C
        CLRR    R0                              ; 5155   01C0
        MVO     R0,     G_016D                  ; 5156   0240 016D
        MVO     R0,     G_016F                  ; 5158   0240 016F
        INCR    R0                              ; 515A   0008
        MVO     R0,     G_016B                  ; 515B   0240 016B
        MVII    #$0008, R0                      ; 515D   02B8 0008
        MVO     R0,     G_0169                  ; 515F   0240 0169
        SDBD                                    ; 5161   0001
        MVII    #$60C3, R1                      ; 5162   02B9 00C3 0060
        MVI@    R1,     R1                      ; 5165   0289
        ADD     G_0175, R1                      ; 5166   02C1 0175
        MVO     R1,     G_0167                  ; 5168   0241 0167
        PULR    R7                              ; 516A   02B7

L_516B:
        PSHR    R5                              ; 516B   0275
        MVII    #$0003, R2                      ; 516C   02BA 0003
        MVII    #$0001, R0                      ; 516E   02B8 0001
        MVII    #$0325, R1                      ; 5170   02B9 0325
L_5172:
        INCR    R0                              ; 5172   0008
        ADDI    #$0008, R1                      ; 5173   02F9 0008
        PSHR    R0                              ; 5175   0270
        PSHR    R1                              ; 5176   0271
        PSHR    R2                              ; 5177   0272

        JSR     R5,     L_5E3E                  ; 5178   0004 015C 023E

        PULR    R2                              ; 517B   02B2
        PULR    R1                              ; 517C   02B1
        PULR    R0                              ; 517D   02B0
        DECR    R2                              ; 517E   0012
        BNEQ    L_5172                          ; 517F   022C 000E

        JSR     R5,     L_606A                  ; 5181   0004 0160 006A

        PULR    R7                              ; 5184   02B7

        DECLE   $0000,  $0000,  $008F,  $0051   ; 5185   0000 0000 008F 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5189   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 518D   0000 0000

        CLRR    R1                              ; 518F   01C9
        J       .EXEC.94C                       ; 5190   0004 0318 014C

        DECLE   $00AD,  $0063,  $0005           ; 5193   00AD 0063 0005

        SLR     R0,     2                       ; 5196   0064
        ADDR    R5,     R2                      ; 5197   00EA
        SLR     R3,     1                       ; 5198   0063
        ADDR    R5,     R2                      ; 5199   00EA
        SLR     R3,     1                       ; 519A   0063
        ADDR    R5,     R2                      ; 519B   00EA
        SLR     R3,     1                       ; 519C   0063

L_519D:
        JSR     R5,     X_PLAY_RAZZ1            ; 519D   0004 011C 02BA

        B       L_50B6                          ; 51A0   0220 00EB

L_51A2:
        PSHR    R5                              ; 51A2   0275
        SDBD                                    ; 51A3   0001
        MVII    #$5020, R1                      ; 51A4   02B9 0020 0050

L_51A7:
        JSR     R5,     X_TIMER_STOP            ; 51A7   0004 0118 0038

        ADDI    #$0004, R1                      ; 51AA   02F9 0004
        SDBD                                    ; 51AC   0001
        CMPI    #$5036, R1                      ; 51AD   0379 0036 0050
        BMI     L_51A7                          ; 51B0   022B 000A
        PULR    R7                              ; 51B2   02B7

L_51B3:
        PSHR    R5                              ; 51B3   0275
        SDBD                                    ; 51B4   0001
        MVII    #$5020, R1                      ; 51B5   02B9 0020 0050

L_51B8:
        JSR     R5,     X_TIMER_START           ; 51B8   0004 0118 0044

        ADDI    #$0004, R1                      ; 51BB   02F9 0004
        SDBD                                    ; 51BD   0001
        CMPI    #$5036, R1                      ; 51BE   0379 0036 0050
        BMI     L_51B8                          ; 51C1   022B 000A
        PULR    R7                              ; 51C3   02B7

L_51C4:
        PSHR    R5                              ; 51C4   0275
        CLRR    R4                              ; 51C5   01E4
        MVI     G_0173, R5                      ; 51C6   0285 0173
        TSTR    R5                              ; 51C8   00AD
        BNEQ    L_51D5                          ; 51C9   020C 000A

        SDBD                                    ; 51CB   0001
        MVII    #$0324, R2                      ; 51CC   02BA 0024 0003
        SDBD                                    ; 51CF   0001
        MVII    #$032C, R3                      ; 51D0   02BB 002C 0003
        B       L_51DD                          ; 51D3   0200 0008

L_51D5:
        SDBD                                    ; 51D5   0001
        MVII    #$0354, R2                      ; 51D6   02BA 0054 0003
        SDBD                                    ; 51D9   0001
        MVII    #$035C, R3                      ; 51DA   02BB 005C 0003
L_51DD:
        ADD@    R2,     R0                      ; 51DD   02D0
        MVI@    R3,     R1                      ; 51DE   0299
        CMPI    #$03E8, R0                      ; 51DF   0378 03E8
        BLT     L_51EF                          ; 51E1   0205 000C

        INCR    R4                              ; 51E3   000C
        SUBI    #$03E8, R0                      ; 51E4   0338 03E8
        INCR    R1                              ; 51E6   0009
        SDBD                                    ; 51E7   0001
        CMPI    #$270F, R1                      ; 51E8   0379 000F 0027
        BLE     L_51EE                          ; 51EB   0206 0001

        CLRR    R1                              ; 51ED   01C9
L_51EE:
        MVO@    R1,     R3                      ; 51EE   0259
L_51EF:
        MVO@    R0,     R2                      ; 51EF   0250
        CLRR    R2                              ; 51F0   01D2
        CLRR    R3                              ; 51F1   01DB
        CMPI    #$0005, R1                      ; 51F2   0379 0005
        BLT     L_5217                          ; 51F4   0205 0021

        INCR    R2                              ; 51F6   000A
        CMPI    #$000F, R1                      ; 51F7   0379 000F
        BLT     L_5217                          ; 51F9   0205 001C

        INCR    R2                              ; 51FB   000A
        CMPI    #$0019, R1                      ; 51FC   0379 0019
        BLT     L_5217                          ; 51FE   0205 0017

        INCR    R2                              ; 5200   000A
        CMPI    #$0032, R1                      ; 5201   0379 0032
        BLT     L_5217                          ; 5203   0205 0012

        INCR    R2                              ; 5205   000A
        CMPI    #$005A, R1                      ; 5206   0379 005A
        BLT     L_5217                          ; 5208   0205 000D

        INCR    R2                              ; 520A   000A
        CMPI    #$0064, R1                      ; 520B   0379 0064
        BLT     L_5217                          ; 520D   0205 0008

        MVII    #$000A, R3                      ; 520F   02BB 000A
        CMPI    #$00FA, R1                      ; 5211   0379 00FA
        BLT     L_5217                          ; 5213   0205 0002

        MVII    #$0019, R3                      ; 5215   02BB 0019
L_5217:
        CMP     G_0175, R3                      ; 5217   0343 0175
        BLE     L_521D                          ; 5219   0206 0002

        MVO     R3,     G_0175                  ; 521B   0243 0175
L_521D:
        CMP     G_0171, R2                      ; 521D   0342 0171
        BLE     L_5223                          ; 521F   0206 0002

        MVO     R2,     G_0171                  ; 5221   0242 0171
L_5223:
        MOVR    R4,     R2                      ; 5223   00A2
        TSTR    R5                              ; 5224   00AD
        BNEQ    L_522D                          ; 5225   020C 0006

        MVII    #$020C, R4                      ; 5227   02BC 020C
        MVII    #$0006, R3                      ; 5229   02BB 0006
        B       L_5231                          ; 522B   0200 0004

L_522D:
        MVII    #$0220, R4                      ; 522D   02BC 0220
        MVII    #$0002, R3                      ; 522F   02BB 0002
L_5231:
        TSTR    R1                              ; 5231   0089
        BEQ     L_5299                          ; 5232   0204 0065

        PSHR    R0                              ; 5234   0270
        MOVR    R1,     R0                      ; 5235   0088
        MVII    #$0004, R1                      ; 5236   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 5238   0004 0118 00C5

        ADDR    R1,     R4                      ; 523B   00CC
        PULR    R0                              ; 523C   02B0
        DECR    R1                              ; 523D   0011

        JSR     R5,     X_PRNUM_ZRO             ; 523E   0004 0118 00AD

        TSTR    R2                              ; 5241   0092
        BEQ     L_5298                          ; 5242   0204 0054

        MVI     G_0173, R5                      ; 5244   0285 0173
        MVII    #$016C, R2                      ; 5246   02BA 016C
        ADDR    R5,     R2                      ; 5248   00EA
        MVII    #$0001, R0                      ; 5249   02B8 0001
        MVO@    R0,     R2                      ; 524B   0250
        MVII    #$016A, R2                      ; 524C   02BA 016A
        ADDR    R5,     R2                      ; 524E   00EA
        MVI@    R2,     R0                      ; 524F   0290
        CMPI    #$0005, R0                      ; 5250   0378 0005
        BLT     L_5263                          ; 5252   0205 000F

        MVII    #$0164, R1                      ; 5254   02B9 0164
        ADDR    R5,     R1                      ; 5256   00E9
        MVI@    R1,     R4                      ; 5257   028C
        CMPI    #$00FF, R4                      ; 5258   037C 00FF
        BEQ     L_5295                          ; 525A   0204 0039

        INCR    R4                              ; 525C   000C
        MVO@    R4,     R1                      ; 525D   024C

        JSR     R5,     L_52A1                  ; 525E   0004 0150 02A1

        B       L_5295                          ; 5261   0200 0032

L_5263:
        INCR    R0                              ; 5263   0008
        MOVR    R0,     R3                      ; 5264   0083
        CLRR    R4                              ; 5265   01E4
        CMPI    #$0004, R0                      ; 5266   0378 0004
        BNEQ    L_526E                          ; 5268   020C 0004

        SDBD                                    ; 526A   0001
        XORI    #$2000, R4                      ; 526B   03FC 0000 0020
L_526E:
        MVO@    R0,     R2                      ; 526E   0250
        MOVR    R5,     R0                      ; 526F   00A8

        JSR     R5,     .EXEC.76C               ; 5270   0004 0114 036C

        MVI@    R1,     R2                      ; 5273   028A
        XORR    R2,     R4                      ; 5274   01D4
        MVO@    R4,     R1                      ; 5275   024C
        MOVR    R3,     R4                      ; 5276   009C
        SDBD                                    ; 5277   0001
        ADDI    #$60C2, R3                      ; 5278   02FB 00C2 0060
        MVII    #$0166, R2                      ; 527B   02BA 0166
        ADDR    R0,     R2                      ; 527D   00C2
        MVI@    R3,     R5                      ; 527E   029D
        MVO@    R5,     R2                      ; 527F   0255
        SUBI    #$0002, R4                      ; 5280   033C 0002
        TSTR    R0                              ; 5282   0080
        BNEQ    L_528B                          ; 5283   020C 0006

        SDBD                                    ; 5285   0001
        MVII    #$52BB, R2                      ; 5286   02BA 00BB 0052
        B       L_528F                          ; 5289   0200 0004

L_528B:
        SDBD                                    ; 528B   0001
        MVII    #$52C3, R2                      ; 528C   02BA 00C3 0052
L_528F:
        ADDR    R4,     R2                      ; 528F   00E2
        ADDR    R2,     R4                      ; 5290   00D4
        INCR    R1                              ; 5291   0009
        SDBD                                    ; 5292   0001
        MVI@    R4,     R0                      ; 5293   02A0
        MVO@    R0,     R1                      ; 5294   0248

L_5295:
        JSR     R5,     L_643B                  ; 5295   0004 0164 003B

L_5298:
        PULR    R7                              ; 5298   02B7

L_5299:
        ADDI    #$0004, R4                      ; 5299   02FC 0004
        MVII    #$0003, R1                      ; 529B   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 529D   0004 0118 00C5

        PULR    R7                              ; 52A0   02B7

L_52A1:
        PSHR    R5                              ; 52A1   0275
        MVII    #$0164, R2                      ; 52A2   02BA 0164
        MVI     G_0173, R5                      ; 52A4   0285 0173
        ADDR    R5,     R2                      ; 52A6   00EA
        MVI@    R2,     R0                      ; 52A7   0290
        TSTR    R5                              ; 52A8   00AD
        BNEQ    L_52B1                          ; 52A9   020C 0006

        MVII    #$0006, R3                      ; 52AB   02BB 0006
        MVII    #$0204, R4                      ; 52AD   02BC 0204
        B       L_52B5                          ; 52AF   0200 0004

L_52B1:
        MVII    #$0002, R3                      ; 52B1   02BB 0002
        MVII    #$0218, R4                      ; 52B3   02BC 0218
L_52B5:
        MVII    #$0003, R1                      ; 52B5   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 52B7   0004 0118 00C5

        PULR    R7                              ; 52BA   02B7

        SWAP    R2,     2                       ; 52BB   0046
        RLC     R1,     2                       ; 52BC   0055
        RLC     R1,     2                       ; 52BD   0055
        RLC     R1,     2                       ; 52BE   0055
        SLR     R0,     2                       ; 52BF   0064
        RLC     R1,     2                       ; 52C0   0055
        RRC     R3,     1                       ; 52C1   0073
        RLC     R1,     2                       ; 52C2   0055
        MOVR    R1,     R7                      ; 52C3   008F

        RLC     R1,     2                       ; 52C4   0055
        MOVR    R3,     R4                      ; 52C5   009C
        RLC     R1,     2                       ; 52C6   0055
        MOVR    R5,     R1                      ; 52C7   00A9
        RLC     R1,     2                       ; 52C8   0055
        TSTR    R6                              ; 52C9   00B6
        RLC     R1,     2                       ; 52CA   0055
L_52CB:
        PSHR    R5                              ; 52CB   0275
        PSHR    R1                              ; 52CC   0271
        PSHR    R2                              ; 52CD   0272
        CLRR    R0                              ; 52CE   01C0
        ADDI    #$0007, R1                      ; 52CF   02F9 0007
        ADDI    #$0007, R2                      ; 52D1   02FA 0007
        MVI@    R1,     R3                      ; 52D3   028B
        MVI@    R2,     R4                      ; 52D4   0294
        MOVR    R3,     R1                      ; 52D5   0099
        MOVR    R4,     R2                      ; 52D6   00A2
        XORR    R4,     R3                      ; 52D7   01E3
        BEQ     L_52EC                          ; 52D8   0204 0012

        MVII    #$00FF, R5                      ; 52DA   02BD 00FF
        MOVR    R3,     R4                      ; 52DC   009C
        ANDR    R5,     R4                      ; 52DD   01AC
        BEQ     L_52EC                          ; 52DE   0204 000C

        SWAP    R3,     1                       ; 52E0   0043
        ANDR    R5,     R3                      ; 52E1   01AB
        BEQ     L_52EC                          ; 52E2   0204 0008

        ANDR    R5,     R1                      ; 52E4   01A9
        ANDR    R5,     R2                      ; 52E5   01AA
        CMPR    R1,     R2                      ; 52E6   014A
        BGT     L_52EB                          ; 52E7   020E 0002

        SUBI    #$0002, R0                      ; 52E9   0338 0002
L_52EB:
        INCR    R0                              ; 52EB   0008
L_52EC:
        PULR    R2                              ; 52EC   02B2
        PULR    R1                              ; 52ED   02B1
        PULR    R7                              ; 52EE   02B7

.GFX_LIST_52EF:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52EF  CART PIC #00
        DECLE   $0000,  $0008,  $0004,  $0002   ; 52F3  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52F7  CART PIC #01
        DECLE   $00A0,  $00C0,  $0080,  $0090   ; 52FB  
        DECLE   $0041,  $0029,  $0011,  $00A5   ; 52FF  CART PIC #02
        DECLE   $0043,  $0041,  $0029,  $0011   ; 5303  
        DECLE   $0020,  $0040,  $0088,  $0012   ; 5307  CART PIC #03
        DECLE   $0014,  $0088,  $0010,  $000A   ; 530B  
        DECLE   $00A4,  $0048,  $0052,  $0021   ; 530F  CART PIC #04
        DECLE   $0018,  $0006,  $0001,  $0000   ; 5313  
        DECLE   $0084,  $00A8,  $00C9,  $0092   ; 5317  CART PIC #05
        DECLE   $00AC,  $00C0,  $0080,  $0080   ; 531B  
        DECLE   $0040,  $0020,  $0040,  $0080   ; 531F  CART PIC #06
        DECLE   $0040,  $0080,  $0041,  $0020   ; 5323  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5327  CART PIC #07
        DECLE   $0040,  $0080,  $0000,  $0080   ; 532B  
        DECLE   $0020,  $0040,  $0020,  $0040   ; 532F  CART PIC #08
        DECLE   $0021,  $0040,  $0021,  $0010   ; 5333  
        DECLE   $0041,  $0022,  $0044,  $0082   ; 5337  CART PIC #09
        DECLE   $0004,  $0088,  $0004,  $0088   ; 533B  
        DECLE   $0000,  $0008,  $0010,  $0020   ; 533F  CART PIC #0A
        DECLE   $0010,  $0020,  $0040,  $0022   ; 5343  
        DECLE   $0008,  $0004,  $0002,  $0004   ; 5347  CART PIC #0B
        DECLE   $0002,  $0001,  $0000,  $0000   ; 534B  
        DECLE   $0044,  $0082,  $0044,  $0022   ; 534F  CART PIC #0C
        DECLE   $0014,  $0022,  $0095,  $004A   ; 5353  
        DECLE   $0044,  $0022,  $0044,  $0088   ; 5357  CART PIC #0D
        DECLE   $0050,  $0088,  $0010,  $00A0   ; 535B  
        DECLE   $0018,  $003E,  $007B,  $00FF   ; 535F  CART PIC #0E
        DECLE   $00DE,  $00FC,  $00F0,  $00E0   ; 5363  
        DECLE   $0080,  $00E0,  $00C0,  $0080   ; 5367  CART PIC #0F
        DECLE   $00C1,  $00E3,  $00BF,  $00FE   ; 536B  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 536F  CART PIC #10
        DECLE   $0000,  $000C,  $003E,  $00F7   ; 5373  
        DECLE   $007F,  $007D,  $00FF,  $00EF   ; 5377  CART PIC #11
        DECLE   $00FE,  $00BF,  $00FB,  $00FF   ; 537B  
        DECLE   $0001,  $00C3,  $00C7,  $00FE   ; 537F  CART PIC #12
        DECLE   $00FF,  $00DF,  $00FB,  $00FF   ; 5383  
        DECLE   $00E0,  $00F8,  $00EF,  $00FE   ; 5387  CART PIC #13
        DECLE   $00FF,  $00FB,  $007F,  $00FF   ; 538B  
        DECLE   $0000,  $0000,  $00C0,  $00F0   ; 538F  CART PIC #14
        DECLE   $00B0,  $00FF,  $00F7,  $00FF   ; 5393  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5397  CART PIC #15
        DECLE   $0000,  $0007,  $009D,  $00FF   ; 539B  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 539F  CART PIC #16
        DECLE   $0006,  $0003,  $0009,  $001F   ; 53A3  
        DECLE   $004E,  $00FF,  $000F,  $003B   ; 53A7  CART PIC #17
        DECLE   $007F,  $001E,  $0047,  $00FF   ; 53AB  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53AF  CART PIC #18
        DECLE   $0040,  $00D0,  $0070,  $00FC   ; 53B3  
        DECLE   $00F0,  $00B8,  $00FE,  $00E8   ; 53B7  CART PIC #19
        DECLE   $00FF,  $00FC,  $00D8,  $00FE   ; 53BB  
        DECLE   $0000,  $0001,  $0003,  $0007   ; 53BF  CART PIC #1A
        DECLE   $001D,  $003F,  $006F,  $00FF   ; 53C3  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53C7  CART PIC #1B
        DECLE   $0000,  $0000,  $002D,  $007F   ; 53CB  
        DECLE   $00FF,  $006F,  $00FD,  $003F   ; 53CF  CART PIC #1C
        DECLE   $0003,  $0001,  $0000,  $0000   ; 53D3  
        DECLE   $0000,  $0081,  $00C3,  $00FF   ; 53D7  CART PIC #1D
        DECLE   $00FD,  $00DF,  $00FF,  $00FF   ; 53DB  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53DF  CART PIC #1E
        DECLE   $0000,  $0004,  $0002,  $0001   ; 53E3  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53E7  CART PIC #1F
        DECLE   $0050,  $0060,  $0040,  $0048   ; 53EB  
        DECLE   $0020,  $0014,  $0008,  $0052   ; 53EF  CART PIC #20
        DECLE   $0021,  $0020,  $0014,  $0008   ; 53F3  
        DECLE   $0090,  $00A0,  $00C4,  $0089   ; 53F7  CART PIC #21
        DECLE   $008A,  $00C4,  $0088,  $0085   ; 53FB  
        DECLE   $0052,  $0024,  $0029,  $0010   ; 53FF  CART PIC #22
        DECLE   $000C,  $0003,  $0000,  $0000   ; 5403  
        DECLE   $0042,  $0054,  $0064,  $00C9   ; 5407  CART PIC #23
        DECLE   $0056,  $0060,  $00C0,  $0040   ; 540B  
        DECLE   $0008,  $0010,  $0020,  $0010   ; 540F  CART PIC #24
        DECLE   $0020,  $0040,  $0020,  $0010   ; 5413  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5417  CART PIC #25
        DECLE   $0080,  $0040,  $0080,  $0040   ; 541B  
        DECLE   $0020,  $0010,  $0008,  $0010   ; 541F  CART PIC #26
        DECLE   $0008,  $0004,  $0008,  $0004   ; 5423  
        DECLE   $0020,  $0011,  $0008,  $0011   ; 5427  CART PIC #27
        DECLE   $0022,  $0011,  $0022,  $0044   ; 542B  
        DECLE   $0080,  $0000,  $0088,  $0010   ; 542F  CART PIC #28
        DECLE   $0020,  $0010,  $0020,  $0042   ; 5433  
        DECLE   $0008,  $0004,  $0002,  $0001   ; 5437  CART PIC #29
        DECLE   $0002,  $0001,  $0000,  $0000   ; 543B  
        DECLE   $0022,  $0044,  $0022,  $0014   ; 543F  CART PIC #2A
        DECLE   $0022,  $0014,  $00A2,  $0055   ; 5443  
        DECLE   $0024,  $0042,  $0084,  $0048   ; 5447  CART PIC #2B
        DECLE   $0084,  $0048,  $0090,  $0020   ; 544B  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 544F  CART PIC #2C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5453  
        DECLE   $0010,  $0000,  $0008,  $0000   ; 5457  CART PIC #2D
        DECLE   $0020,  $0000,  $0010,  $0000   ; 545B  
        DECLE   $0004,  $0000,  $0040,  $0000   ; 545F  CART PIC #2E
        DECLE   $0008,  $0000,  $0010,  $0000   ; 5463  
        DECLE   $0020,  $0000,  $0004,  $0000   ; 5467  CART PIC #2F
        DECLE   $0040,  $0000,  $0008,  $0000   ; 546B  
        DECLE   $02A3,  $0000                   ; 546F   02A3 0000

        MVI@    R4,     R4                      ; 5471   02A4
        EIS                                     ; 5472   0002
        PULR    R7                              ; 5473   02B7

        DECLE   $0004                           ; 5474   0004

        MVII    #$0006, R0                      ; 5475   02B8 0006
        ADD@    R1,     R3                      ; 5477   02CB
        INCR    R0                              ; 5478   0008
        ADD@    R1,     R4                      ; 5479   02CC
        INCR    R2                              ; 547A   000A
        MVI@    R5,     R5                      ; 547B   02AD
        INCR    R4                              ; 547C   000C
        MVI@    R5,     R6                      ; 547D   02AE
        INCR    R6                              ; 547E   000E
        ADD     .STIC.A.0,R0                    ; 547F   02C0 0010
        ADD     .STIC.A.2,R1                    ; 5481   02C1 0012
        ADD     .STIC.A.4,R2                    ; 5483   02C2 0014
        ADD@    R2,     R4                      ; 5485   02D4
        DECR    R6                              ; 5486   0016
        ADD@    R2,     R5                      ; 5487   02D5
        COMR    R0                              ; 5488   0018
        ADD@    R2,     R6                      ; 5489   02D6
        COMR    R2                              ; 548A   001A
        ADD@    R1,     R1                      ; 548B   02C9
        COMR    R4                              ; 548C   001C
        ADD@    R3,     R5                      ; 548D   02DD
        COMR    R6                              ; 548E   001E
        ADD@    R1,     R2                      ; 548F   02CA
        NEGR    R0                              ; 5490   0020
        ADD@    R3,     R6                      ; 5491   02DE
        NEGR    R2                              ; 5492   0022
        ADD@    R3,     R7                      ; 5493   02DF

        NEGR    R4                              ; 5494   0024
        ADD@    R4,     R0                      ; 5495   02E0
        NEGR    R6                              ; 5496   0026
        ADD@    R4,     R1                      ; 5497   02E1
        ADCR    R0                              ; 5498   0028
        ADD@    R4,     R2                      ; 5499   02E2
        ADCR    R2                              ; 549A   002A
        ADD@    R4,     R3                      ; 549B   02E3
        ADCR    R2                              ; 549C   002A
        ADD@    R2,     R0                      ; 549D   02D0
        ADCR    R4                              ; 549E   002C
        ADD@    R4,     R4                      ; 549F   02E4
        ADCR    R6                              ; 54A0   002E
        ADD@    R2,     R1                      ; 54A1   02D1
        GSWD    R0                              ; 54A2   0030
        ADD@    R4,     R5                      ; 54A3   02E5
        GSWD    R2                              ; 54A4   0032
        ADD@    R4,     R7                      ; 54A5   02E7

        NEGR    R0                              ; 54A6   0020
        ADD@    R5,     R0                      ; 54A7   02E8
        NOP                                     ; 54A8   0034
        ADD@    R5,     R1                      ; 54A9   02E9
        NEGR    R2                              ; 54AA   0022
        ADD@    R5,     R2                      ; 54AB   02EA
        NEGR    R6                              ; 54AC   0026
        ADD@    R5,     R3                      ; 54AD   02EB
        ADCR    R0                              ; 54AE   0028
        ADD@    R5,     R4                      ; 54AF   02EC
        NEGR    R0                              ; 54B0   0020
        ADD@    R5,     R5                      ; 54B1   02ED
        NOP                                     ; 54B2   0034
        ADD     G_0036, R6                      ; 54B3   02C6 0036
        ADD@    R3,     R2                      ; 54B5   02DA
        RSWD    R0                              ; 54B6   0038
        ADD@    R5,     R6                      ; 54B7   02EE
        RSWD    R2                              ; 54B8   003A
        ADD     G_0034, R7                      ; 54B9   02C7 0034

        ADD@    R3,     R3                      ; 54BB   02DB
        NEGR    R2                              ; 54BC   0022
        ADD@    R5,     R7                      ; 54BD   02EF

        DECLE   $0022,  $0006,  $0018,  $000E   ; 54BE   0022 0006 0018 000E
        DECLE   $0018,  $0016,  $0018,  $001E   ; 54C2   0018 0016 0018 001E
        DECLE   $0018,  $0026,  $0018,  $002E   ; 54C6   0018 0026 0018 002E
        DECLE   $0018,  $0035                   ; 54CA   0018 0035

        INCR    R0                              ; 54CC   0008
        RSWD    R5                              ; 54CD   003D
        INCR    R0                              ; 54CE   0008
        SWAP    R1,     2                       ; 54CF   0045
        INCR    R0                              ; 54D0   0008
        SLL     R1,     2                       ; 54D1   004D
        INCR    R0                              ; 54D2   0008
        RLC     R1,     2                       ; 54D3   0055
        INCR    R0                              ; 54D4   0008
        SLLC    R1,     2                       ; 54D5   005D
        INCR    R0                              ; 54D6   0008
        SLR     R1,     2                       ; 54D7   0065
        INCR    R0                              ; 54D8   0008
        SAR     R1,     2                       ; 54D9   006D
        INCR    R0                              ; 54DA   0008
        RRC     R3,     2                       ; 54DB   0077
        INCR    R0                              ; 54DC   0008
        SARC    R3,     2                       ; 54DD   007F
        INCR    R0                              ; 54DE   0008
        MOVR    R0,     R7                      ; 54DF   0087

        INCR    R0                              ; 54E0   0008
        MOVR    R1,     R7                      ; 54E1   008F

        INCR    R0                              ; 54E2   0008
        MOVR    R2,     R7                      ; 54E3   0097

        INCR    R0                              ; 54E4   0008
        MOVR    R3,     R7                      ; 54E5   009F

        INCR    R0                              ; 54E6   0008
        MOVR    R4,     R7                      ; 54E7   00A7

        INCR    R0                              ; 54E8   0008
        MOVR    R5,     R7                      ; 54E9   00AF

        DECLE   $0008,  $00B7,  $0008,  $00BF   ; 54EA   0008 00B7 0008 00BF

        INCR    R0                              ; 54EE   0008
        ADDR    R0,     R7                      ; 54EF   00C7

        INCR    R0                              ; 54F0   0008
        ADDR    R1,     R7                      ; 54F1   00CF

        INCR    R0                              ; 54F2   0008
        ADDR    R2,     R7                      ; 54F3   00D7

        INCR    R0                              ; 54F4   0008
        ADDR    R3,     R7                      ; 54F5   00DF

        INCR    R0                              ; 54F6   0008
        ADDR    R4,     R7                      ; 54F7   00E7

        INCR    R0                              ; 54F8   0008
        ADDR    R5,     R7                      ; 54F9   00EF

        DECLE   $0008,  $00F5,  $0008,  $00FD   ; 54FA   0008 00F5 0008 00FD
        DECLE   $0008,  $0005,  $0009,  $000D   ; 54FE   0008 0005 0009 000D
        DECLE   $0009,  $0015,  $0009,  $001D   ; 5502   0009 0015 0009 001D
        DECLE   $0009,  $0024,  $0009,  $002C   ; 5506   0009 0024 0009 002C
        DECLE   $0009,  $0034,  $0009,  $003C   ; 550A   0009 0034 0009 003C
        DECLE   $0009,  $0044,  $0009,  $004C   ; 550E   0009 0044 0009 004C
        DECLE   $0009,  $0054,  $0009,  $005C   ; 5512   0009 0054 0009 005C
        DECLE   $0009,  $0066,  $0018,  $0037   ; 5516   0009 0066 0018 0037
        DECLE   $0055,  $0000,  $0048,  $0000   ; 551A   0055 0000 0048 0000
        DECLE   $0033,  $0000,  $0000,  $0040   ; 551E   0033 0000 0000 0040
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5522   0001 0000 0000 0000
        DECLE   $0000,  $0062,  $001A,  $0082   ; 5526   0000 0062 001A 0082
        DECLE   $0055,  $0000,  $0068,  $0000   ; 552A   0055 0000 0068 0000
        DECLE   $0033,  $0000,  $0000,  $0040   ; 552E   0033 0000 0000 0040
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5532   0001 0000 0000 0000
        DECLE   $0000,  $0300,  $0000,  $0021   ; 5536   0000 0300 0000 0021
        DECLE   $0064,  $0002,  $0000,  $0008   ; 553A   0064 0002 0000 0008
        DECLE   $0011,  $0161,  $0241,  $0061   ; 553E   0011 0161 0241 0061
        DECLE   $0241,  $0161,  $0141,  $0061   ; 5542   0241 0161 0141 0061
        DECLE   $0300,  $0000,  $0021,  $0064   ; 5546   0300 0000 0021 0064
        DECLE   $0002,  $0004,  $0008,  $0011   ; 554A   0002 0004 0008 0011
        DECLE   $0161,  $0241,  $0061,  $0241   ; 554E   0161 0241 0061 0241
        DECLE   $0161,  $0141,  $0061,  $0300   ; 5552   0161 0141 0061 0300
        DECLE   $0000,  $0021,  $0064,  $0002   ; 5556   0000 0021 0064 0002
        DECLE   $0008,  $0008,  $0011,  $0161   ; 555A   0008 0008 0011 0161
        DECLE   $0241,  $0061,  $0241,  $0161   ; 555E   0241 0061 0241 0161
        DECLE   $0141,  $0061,  $0300,  $0000   ; 5562   0141 0061 0300 0000
        DECLE   $0021,  $0064,  $0002,  $000C   ; 5566   0021 0064 0002 000C
        DECLE   $0008,  $0011,  $0161,  $0241   ; 556A   0008 0011 0161 0241
        DECLE   $0061,  $0241,  $0161,  $0141   ; 556E   0061 0241 0161 0141
        DECLE   $0061,  $0300,  $0000,  $0021   ; 5572   0061 0300 0000 0021
        DECLE   $0064,  $0002,  $0010,  $0008   ; 5576   0064 0002 0010 0008
        DECLE   $0011,  $0161,  $0241,  $0061   ; 557A   0011 0161 0241 0061
        DECLE   $0241,  $0161,  $0141,  $0061   ; 557E   0241 0161 0141 0061
        DECLE   $0300,  $0000,  $0021,  $0064   ; 5582   0300 0000 0021 0064
        DECLE   $0002,  $0000,  $0006,  $0241   ; 5586   0002 0000 0006 0241
        DECLE   $0061,  $0241,  $0161,  $0141   ; 558A   0061 0241 0161 0141
        DECLE   $0061,  $0300,  $0000,  $0021   ; 558E   0061 0300 0000 0021
        DECLE   $0064,  $0002,  $0004,  $0006   ; 5592   0064 0002 0004 0006
        DECLE   $0241,  $0061,  $0241,  $0161   ; 5596   0241 0061 0241 0161
        DECLE   $0141,  $0061,  $0300,  $0000   ; 559A   0141 0061 0300 0000
        DECLE   $0021,  $0064,  $0002,  $0008   ; 559E   0021 0064 0002 0008
        DECLE   $0006,  $0241,  $0061,  $0241   ; 55A2   0006 0241 0061 0241
        DECLE   $0161,  $0141,  $0061,  $0300   ; 55A6   0161 0141 0061 0300
        DECLE   $0000,  $0021,  $0064,  $0002   ; 55AA   0000 0021 0064 0002
        DECLE   $000C,  $0006,  $0241,  $0061   ; 55AE   000C 0006 0241 0061
        DECLE   $0241,  $0161,  $0141,  $0061   ; 55B2   0241 0161 0141 0061
        DECLE   $0300,  $0000,  $0021,  $0064   ; 55B6   0300 0000 0021 0064
        DECLE   $0002,  $0010,  $0006,  $0241   ; 55BA   0002 0010 0006 0241
        DECLE   $0061,  $0241,  $0161,  $0141   ; 55BE   0061 0241 0161 0141
        DECLE   $0061,  $023E,  $005E,  $0000   ; 55C2   0061 023E 005E 0000
        DECLE   $0000,  $0002,  $0044,  $0004   ; 55C6   0000 0002 0044 0004
        DECLE   $02AC,  $0162,  $01AC,  $0062   ; 55CA   02AC 0162 01AC 0062
        DECLE   $023E,  $005E,  $0000,  $0000   ; 55CE   023E 005E 0000 0000
        DECLE   $0002,  $0048,  $0004,  $02AC   ; 55D2   0002 0048 0004 02AC
        DECLE   $0162,  $01AC,  $0062,  $023E   ; 55D6   0162 01AC 0062 023E
        DECLE   $005E,  $0000,  $0000,  $0002   ; 55DA   005E 0000 0000 0002
        DECLE   $004C,  $0004,  $02AC,  $0162   ; 55DE   004C 0004 02AC 0162
        DECLE   $01AC,  $0062,  $023E,  $005E   ; 55E2   01AC 0062 023E 005E
        DECLE   $0000,  $0000,  $0007,  $0054   ; 55E6   0000 0000 0007 0054
        DECLE   $0004,  $02AC,  $0162,  $01AC   ; 55EA   0004 02AC 0162 01AC
        DECLE   $0062,  $023E,  $005E,  $0000   ; 55EE   0062 023E 005E 0000
        DECLE   $0000,  $0002,  $0068,  $0004   ; 55F2   0000 0002 0068 0004
        DECLE   $02AC,  $0162,  $01AC,  $0062   ; 55F6   02AC 0162 01AC 0062
        DECLE   $023E,  $005E,  $0000,  $0000   ; 55FA   023E 005E 0000 0000
        DECLE   $0002,  $0050,  $0004,  $02AC   ; 55FE   0002 0050 0004 02AC
        DECLE   $0162,  $01AC,  $0062,  $023E   ; 5602   0162 01AC 0062 023E
        DECLE   $005E,  $0000,  $0000,  $0003   ; 5606   005E 0000 0000 0003
        DECLE   $002C,  $0002,  $01AC,  $0062   ; 560A   002C 0002 01AC 0062
        DECLE   $023E,  $005E,  $0000,  $0000   ; 560E   023E 005E 0000 0000
        DECLE   $0003,  $0032,  $0002,  $01AC   ; 5612   0003 0032 0002 01AC
        DECLE   $0062,  $023E,  $005E,  $0000   ; 5616   0062 023E 005E 0000
        DECLE   $0000,  $0003,  $0038,  $0002   ; 561A   0000 0003 0038 0002
        DECLE   $01AC,  $0062,  $023E,  $005E   ; 561E   01AC 0062 023E 005E
        DECLE   $0000,  $0000,  $0007,  $0054   ; 5622   0000 0000 0007 0054
        DECLE   $0002,  $01AC,  $0062,  $023E   ; 5626   0002 01AC 0062 023E
        DECLE   $005E,  $0000,  $0000,  $0002   ; 562A   005E 0000 0000 0002
        DECLE   $0068,  $0002,  $01AC,  $0062   ; 562E   0068 0002 01AC 0062
        DECLE   $023E,  $005E,  $0000,  $0000   ; 5632   023E 005E 0000 0000
        DECLE   $0002,  $0050,  $0002,  $01AC   ; 5636   0002 0050 0002 01AC
        DECLE   $0062,  $023E,  $005E,  $0000   ; 563A   0062 023E 005E 0000
        DECLE   $0000,  $0003,  $002C,  $0000   ; 563E   0000 0003 002C 0000
        DECLE   $023E,  $005E,  $0000,  $0000   ; 5642   023E 005E 0000 0000
        DECLE   $0002,  $0048,  $0000,  $023E   ; 5646   0002 0048 0000 023E
        DECLE   $005E,  $0000,  $0000,  $0002   ; 564A   005E 0000 0000 0002
        DECLE   $004C,  $0000,  $023E,  $005E   ; 564E   004C 0000 023E 005E
        DECLE   $0000,  $0000,  $0003,  $0062   ; 5652   0000 0000 0003 0062
        DECLE   $0000,  $023E,  $005E,  $0000   ; 5656   0000 023E 005E 0000
        DECLE   $0000,  $0002,  $006C,  $0000   ; 565A   0000 0002 006C 0000
        DECLE   $023E,  $005E,  $0000,  $0000   ; 565E   023E 005E 0000 0000
        DECLE   $0003,  $003E,  $0000,  $024D   ; 5662   0003 003E 0000 024D
        DECLE   $005F,  $00BF                   ; 5666   005F 00BF

        SLLC    R3,     2                       ; 5668   005F

        JSR     R4,     .EXEC.40A               ; 5669   0004 0014 000A

        ADDR    R2,     R1                      ; 566C   00D1
        SLR     R1,     1                       ; 566D   0061
        ADDR    R2,     R1                      ; 566E   00D1
        CMPR    R4,     R1                      ; 566F   0161
        ADD@    R1,     R3                      ; 5670   02CB
        SLR     R2,     1                       ; 5671   0062
        ADD@    R1,     R3                      ; 5672   02CB
        CMPR    R4,     R2                      ; 5673   0162
        XORR    R1,     R3                      ; 5674   01CB
        SLR     R2,     1                       ; 5675   0062
        PSHR    R1                              ; 5676   0271
        SLLC    R3,     2                       ; 5677   005F
        MOVR    R4,     R1                      ; 5678   00A1
        SLR     R3,     1                       ; 5679   0063

        JSR     R4,     .EXEC.C04               ; 567A   0004 001C 0004
        DECLE   $00FD,  $0062,  $00FD,  $0162   ; 567D   00FD 0062 00FD 0162
        DECLE   $024D,  $005F,  $0000,  $0000   ; 5681   024D 005F 0000 0000
        DECLE   $0002,  $0024,  $0000,  $0271   ; 5685   0002 0024 0000 0271
        DECLE   $005F,  $0000,  $0000,  $0002   ; 5689   005F 0000 0000 0002
        DECLE   $0028,  $0000                   ; 568D   0028 0000

        MVO@    R2,     R5                      ; 568F   026A
        SLR     R0,     1                       ; 5690   0060
        MOVR    R1,     R7                      ; 5691   008F

        SLLC    R1,     2                       ; 5692   005D
        DIS                                     ; 5693   0003
        RRC     R0,     1                       ; 5694   0070
        INCR    R2                              ; 5695   000A
        RRC     R2,     2                       ; 5696   0076
        SLR     R1,     1                       ; 5697   0061
        RRC     R2,     2                       ; 5698   0076
        CMPR    R4,     R1                      ; 5699   0161
        ADD@    R1,     R3                      ; 569A   02CB
        SLR     R2,     1                       ; 569B   0062
        ADD@    R1,     R3                      ; 569C   02CB
        CMPR    R4,     R2                      ; 569D   0162
        XORR    R1,     R3                      ; 569E   01CB
        SLR     R2,     1                       ; 569F   0062
        MVO@    R2,     R5                      ; 56A0   026A
        SLR     R0,     1                       ; 56A1   0060
        MOVR    R1,     R7                      ; 56A2   008F

        DECLE   $005D,  $0003,  $0076,  $000A   ; 56A3   005D 0003 0076 000A
        DECLE   $0076,  $0061,  $0076,  $0161   ; 56A7   0076 0061 0076 0161
        DECLE   $02CB,  $0062,  $02CB,  $0162   ; 56AB   02CB 0062 02CB 0162
        DECLE   $01CB,  $0062,  $0300,  $0000   ; 56AF   01CB 0062 0300 0000
        DECLE   $000B,  $0062,  $0004,  $007C   ; 56B3   000B 0062 0004 007C
        DECLE   $0000,  $0100,  $0000,  $003E   ; 56B7   0000 0100 0000 003E
        DECLE   $005E,  $0004,  $007C,  $0000   ; 56BB   005E 0004 007C 0000
        DECLE   $023E,  $005E,  $0000,  $0000   ; 56BF   023E 005E 0000 0000
        DECLE   $0002,  $0084,  $0004,  $02AC   ; 56C3   0002 0084 0004 02AC
        DECLE   $0162,  $01AC,  $0062,  $023E   ; 56C7   0162 01AC 0062 023E
        DECLE   $005E,  $0000,  $0000,  $0002   ; 56CB   005E 0000 0000 0002
        DECLE   $0084,  $0002,  $01AC,  $0062   ; 56CF   0084 0002 01AC 0062
        DECLE   $023E,  $005E,  $0000,  $0000   ; 56D3   023E 005E 0000 0000
        DECLE   $0002,  $0084,  $0000,  $0038   ; 56D7   0002 0084 0000 0038
        DECLE   $001C,  $00DA,  $007C,  $003E   ; 56DB   001C 00DA 007C 003E
        DECLE   $007C,  $00C8,  $0010,  $0000   ; 56DF   007C 00C8 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56E3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 56E7   0000 0000 0000 0038
        DECLE   $001C,  $005E,  $007E,  $003C   ; 56EB   001C 005E 007E 003C
        DECLE   $007C,  $0058,  $0000,  $0000   ; 56EF   007C 0058 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 56F7   0000 0000 0000 0038
        DECLE   $001C,  $001E,  $00DB,  $007E   ; 56FB   001C 001E 00DB 007E
        DECLE   $003F,  $007E,  $00DC,  $0008   ; 56FF   003F 007E 00DC 0008
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5703   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 5707   0000 0000 0000 0038
        DECLE   $001C,  $001E,  $005F,  $007F   ; 570B   001C 001E 005F 007F
        DECLE   $003E,  $007E,  $005C,  $0018   ; 570F   003E 007E 005C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5713   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 5717   0000 0000 0000 0038
        DECLE   $001C,  $001E,  $001E,  $00DB   ; 571B   001C 001E 001E 00DB
        DECLE   $007E,  $003F,  $003E,  $007E   ; 571F   007E 003F 003E 007E
        DECLE   $00DE,  $001C,  $0008,  $0010   ; 5723   00DE 001C 0008 0010
        DECLE   $0000,  $0000,  $0000,  $0038   ; 5727   0000 0000 0000 0038
        DECLE   $001C,  $001E,  $001E,  $005F   ; 572B   001C 001E 001E 005F
        DECLE   $007F,  $003E,  $003E,  $007E   ; 572F   007F 003E 003E 007E
        DECLE   $005E,  $001C,  $0018,  $0000   ; 5733   005E 001C 0018 0000
        DECLE   $0000,  $0000,  $0000           ; 5737   0000 0000 0000

        COMR    R0                              ; 573A   0018
        INCR    R4                              ; 573B   000C
        INCR    R6                              ; 573C   000E
        INCR    R6                              ; 573D   000E
        ADCR    R2                              ; 573E   002A
        RSWD    R3                              ; 573F   003B
        COMR    R6                              ; 5740   001E
        INCR    R7                              ; 5741   000F

        COMR    R6                              ; 5742   001E
L_5743:
        RSWD    R6                              ; 5743   003E
        DECLE   $002E,  $0004,  $0008,  $0000   ; 5744   002E 0004 0008 0000
        DECLE   $0000,  $0000,  $0018,  $000C   ; 5748   0000 0000 0018 000C
        DECLE   $000E,  $000E,  $000E,  $001F   ; 574C   000E 000E 000E 001F
        DECLE   $001F,  $000E,  $001E,  $001E   ; 5750   001F 000E 001E 001E
        DECLE   $000E,  $000C,  $0000,  $0000   ; 5754   000E 000C 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0018   ; 5758   0000 0000 0030 0018
        DECLE   $001C,  $001E,  $005A,  $007B   ; 575C   001C 001E 005A 007B
        DECLE   $003E,  $001E,  $003F,  $007E   ; 5760   003E 001E 003F 007E
        DECLE   $005E,  $001C,  $0008,  $0010   ; 5764   005E 001C 0008 0010
        DECLE   $0000,  $0000,  $0030,  $0018   ; 5768   0000 0000 0030 0018
        DECLE   $001C,  $001E,  $001E,  $003F   ; 576C   001C 001E 001E 003F
        DECLE   $003F,  $001F,  $003E,  $003E   ; 5770   003F 001F 003E 003E
        DECLE   $001E,  $001C,  $0018,  $0000   ; 5774   001E 001C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5778   0000 0000 0000 00C0
        DECLE   $0060,  $0070,  $00FC,  $00FF   ; 577C   0060 0070 00FC 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 5780   00FF 00FF 00FE 00FC
        DECLE   $00F8,  $00FC,  $0010,  $0020   ; 5784   00F8 00FC 0010 0020
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5788   0000 0000 0000 00C0
        DECLE   $0060,  $0070,  $00FC,  $00FF   ; 578C   0060 0070 00FC 00FF
        DECLE   $00FB,  $00FF,  $00FE,  $00FC   ; 5790   00FB 00FF 00FE 00FC
        DECLE   $00F8,  $00FC,  $0010,  $0020   ; 5794   00F8 00FC 0010 0020
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5798   0000 0000 0000 00C0
        DECLE   $0060,  $0070,  $00FC,  $00FF   ; 579C   0060 0070 00FC 00FF
        DECLE   $00FB,  $00FF,  $00FE,  $00FC   ; 57A0   00FB 00FF 00FE 00FC
        DECLE   $00FC,  $00F8,  $0010,  $0010   ; 57A4   00FC 00F8 0010 0010
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 57A8   0000 0000 0000 00C0
        DECLE   $0060,  $0070,  $00FC,  $00FF   ; 57AC   0060 0070 00FC 00FF
        DECLE   $00FB,  $00FF,  $00FE,  $00FC   ; 57B0   00FB 00FF 00FE 00FC
        DECLE   $00FC,  $00F8,  $0010,  $0020   ; 57B4   00FC 00F8 0010 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B8   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0061,  $0023   ; 57BC   0000 00C0 0061 0023
        DECLE   $003F,  $003F,  $001F,  $001F   ; 57C0   003F 003F 001F 001F
        DECLE   $003F,  $0027,  $0060,  $0000   ; 57C4   003F 0027 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C8   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0061,  $0023   ; 57CC   0000 00C0 0061 0023
        DECLE   $0037,  $003F,  $001F,  $001F   ; 57D0   0037 003F 001F 001F
        DECLE   $003F,  $002F,  $0060,  $0000   ; 57D4   003F 002F 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D8   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0061,  $0023   ; 57DC   0000 0040 0061 0023
        DECLE   $0037,  $003F,  $001F,  $001F   ; 57E0   0037 003F 001F 001F
        DECLE   $003F,  $002F,  $0020,  $0000   ; 57E4   003F 002F 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E8   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0061,  $0023   ; 57EC   0000 0040 0061 0023
        DECLE   $0037,  $003F,  $001F,  $001F   ; 57F0   0037 003F 001F 001F
        DECLE   $003F,  $002F,  $0020,  $0000   ; 57F4   003F 002F 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 57F8   0000 0000 0000 0060
        DECLE   $0020,  $00F0,  $00F0,  $00F8   ; 57FC   0020 00F0 00F0 00F8
        DECLE   $00F8,  $00FC,  $00FC,  $00FE   ; 5800   00F8 00FC 00FC 00FE
        DECLE   $00FE,  $00FF,  $007F,  $0033   ; 5804   00FE 00FF 007F 0033
        DECLE   $0018,  $000C,  $0060,  $0020   ; 5808   0018 000C 0060 0020
        DECLE   $00F0,  $00F0,  $00F8,  $00F8   ; 580C   00F0 00F0 00F8 00F8
        DECLE   $00FC,  $00FC,  $00FE,  $00FF   ; 5810   00FC 00FC 00FE 00FF
        DECLE   $00FF,  $007F,  $0030,  $001C   ; 5814   00FF 007F 0030 001C
        DECLE   $0008,  $0000,  $0000,  $0000   ; 5818   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0001           ; 581C   0000 0000 0001

        DIS                                     ; 581F   0003
        DIS                                     ; 5820   0003
        SETC                                    ; 5821   0007
L_5822:
        DECR    R7                              ; 5822   0017

        DECLE   $003F,  $003F                   ; 5823   003F 003F

        ADCR    R7                              ; 5825   002F

        SLL     R0,     2                       ; 5826   004C
L_5827:
        RLC     R0,     1                       ; 5827   0050
        DECLE   $0090,  $0020,  $0000,  $0000   ; 5828   0090 0020 0000 0000
        DECLE   $0000,  $0001                   ; 582C   0000 0001

        DIS                                     ; 582E   0003
        DIS                                     ; 582F   0003
        SETC                                    ; 5830   0007
L_5831:
        DECR    R7                              ; 5831   0017

        DECLE   $003F,  $007F,  $006F,  $008C   ; 5832   003F 007F 006F 008C
        DECLE   $0010,  $0030,  $0000,  $0000   ; 5836   0010 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 583A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 583E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0088,  $005C   ; 5842   0000 0000 0088 005C
        DECLE   $0034,  $0058,  $0090,  $000C   ; 5846   0034 0058 0090 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 584A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 584E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0048,  $005C   ; 5852   0000 0000 0048 005C
        DECLE   $003C,  $0058,  $005C,  $0008   ; 5856   003C 0058 005C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0088,  $005C   ; 5862   0000 0000 0088 005C
        DECLE   $0034,  $005C,  $009C,  $0008   ; 5866   0034 005C 009C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586E   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $009E,  $005A   ; 5872   0000 000C 009E 005A
        DECLE   $003E,  $0058,  $0090,  $000E   ; 5876   003E 0058 0090 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587E   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $005E,  $005E   ; 5882   0000 000C 005E 005E
        DECLE   $003E,  $0058,  $005E,  $000C   ; 5886   003E 0058 005E 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588E   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $009E,  $005A   ; 5892   0000 000C 009E 005A
        DECLE   $003E,  $005E,  $009E,  $000C   ; 5896   003E 005E 009E 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589E   0000 0000 0000 0000
        DECLE   $000C,  $009E,  $005F,  $003D   ; 58A2   000C 009E 005F 003D
        DECLE   $003F,  $005C,  $0090,  $000F   ; 58A6   003F 005C 0090 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58AE   0000 0000 0000 0000
        DECLE   $000C,  $005E,  $005F,  $003F   ; 58B2   000C 005E 005F 003F
        DECLE   $003F,  $005C,  $005F,  $000C   ; 58B6   003F 005C 005F 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BE   0000 0000 0000 0000
        DECLE   $0004,  $008E,  $005F,  $003D   ; 58C2   0004 008E 005F 003D
        DECLE   $003F,  $005F,  $009E,  $000C   ; 58C6   003F 005F 009E 000C
        DECLE   $0000,  $0000,  $0000,  $000C   ; 58CA   0000 0000 0000 000C
        DECLE   $008C,  $009E,  $005E,  $005A   ; 58CE   008C 009E 005E 005A
        DECLE   $003A,  $003E,  $003C,  $005C   ; 58D2   003A 003E 003C 005C
        DECLE   $0050,  $0090,  $008E,  $000E   ; 58D6   0050 0090 008E 000E
        DECLE   $0000,  $0000,  $0000,  $000C   ; 58DA   0000 0000 0000 000C
        DECLE   $004C,  $005E,  $005E,  $005E   ; 58DE   004C 005E 005E 005E
        DECLE   $003E,  $003E,  $003C,  $005C   ; 58E2   003E 003E 003C 005C
        DECLE   $005E,  $005E,  $004C,  $000C   ; 58E6   005E 005E 004C 000C
        DECLE   $0000,  $0000,  $0000,  $000C   ; 58EA   0000 0000 0000 000C
        DECLE   $008C,  $009E,  $005E,  $005A   ; 58EE   008C 009E 005E 005A
        DECLE   $003A,  $003E,  $003E,  $005E   ; 58F2   003A 003E 003E 005E
        DECLE   $005E,  $009E,  $008C,  $000C   ; 58F6   005E 009E 008C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00D8,  $0074   ; 5902   0000 0000 00D8 0074
        DECLE   $0038,  $007C,  $00D8,  $0000   ; 5906   0038 007C 00D8 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590E   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0058,  $003C   ; 5912   0000 0080 0058 003C
        DECLE   $003C,  $0038,  $0058,  $0080   ; 5916   003C 0038 0058 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591E   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $00DC,  $0076   ; 5922   0000 0008 00DC 0076
        DECLE   $003C,  $007E,  $00DC,  $0008   ; 5926   003C 007E 00DC 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 592A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 592E   0000 0000 0000 0000
        DECLE   $0000,  $0088,  $005C,  $003E   ; 5932   0000 0088 005C 003E
        DECLE   $003E,  $003C,  $005C,  $0088   ; 5936   003E 003C 005C 0088
        DECLE   $0000,  $0000,  $0000,  $0000   ; 593A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 593E   0000 0000 0000 0008
        DECLE   $00DC,  $007E,  $003B,  $003A   ; 5942   00DC 007E 003B 003A
        DECLE   $003F,  $007E,  $00DC,  $0008   ; 5946   003F 007E 00DC 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0088   ; 594E   0000 0000 0000 0088
        DECLE   $005C,  $003E,  $003F,  $003F   ; 5952   005C 003E 003F 003F
        DECLE   $003E,  $003E,  $005C,  $0088   ; 5956   003E 003E 005C 0088
        DECLE   $0000,  $0000,  $0000,  $0010   ; 595A   0000 0000 0000 0010
        DECLE   $0038,  $00B8,  $00FC,  $0074   ; 595E   0038 00B8 00FC 0074
        DECLE   $0036,  $003C,  $003E,  $007C   ; 5962   0036 003C 003E 007C
        DECLE   $00FC,  $00B8,  $0038,  $0010   ; 5966   00FC 00B8 0038 0010
        DECLE   $0000,  $0000,  $0000,  $0010   ; 596A   0000 0000 0000 0010
        DECLE   $00B8,  $00B8,  $007C,  $007C   ; 596E   00B8 00B8 007C 007C
        DECLE   $003E,  $003E,  $003E,  $007C   ; 5972   003E 003E 003E 007C
        DECLE   $007C,  $00B8,  $00B8,  $0010   ; 5976   007C 00B8 00B8 0010
        DECLE   $0000,  $0000,  $0070,  $0038   ; 597A   0000 0000 0070 0038
        DECLE   $003C,  $0024,  $0010,  $0018   ; 597E   003C 0024 0010 0018
        DECLE   $0018,  $0018,  $0030,  $0020   ; 5982   0018 0018 0030 0020
        DECLE   $002C,  $004A,  $0031,  $0002   ; 5986   002C 004A 0031 0002
        DECLE   $0000,  $0000,  $00E0,  $0050   ; 598A   0000 0000 00E0 0050
        DECLE   $0078,  $0048,  $0040,  $0020   ; 598E   0078 0048 0040 0020
        DECLE   $0030,  $0030,  $0030,  $0060   ; 5992   0030 0030 0030 0060
        DECLE   $0082,  $0085,  $0049,  $0030   ; 5996   0082 0085 0049 0030
        DECLE   $0000,  $0000,  $0070,  $0028   ; 599A   0000 0000 0070 0028
        DECLE   $003C,  $0024,  $0020,  $0020   ; 599E   003C 0024 0020 0020
        DECLE   $0010,  $0018,  $0018,  $0030   ; 59A2   0010 0018 0018 0030
        DECLE   $0022,  $0045,  $0045,  $003A   ; 59A6   0022 0045 0045 003A
        DECLE   $0000,  $0000,  $0038,  $0014   ; 59AA   0000 0000 0038 0014
        DECLE   $001E,  $0012,  $0010,  $0010   ; 59AE   001E 0012 0010 0010
        DECLE   $0008,  $000C,  $000C,  $0018   ; 59B2   0008 000C 000C 0018
        DECLE   $0012,  $0025,  $0021,  $001E   ; 59B6   0012 0025 0021 001E
        DECLE   $0000,  $0000                   ; 59BA   0000 0000

        COMR    R4                              ; 59BC   001C
        INCR    R2                              ; 59BD   000A
        INCR    R7                              ; 59BE   000F

        INCR    R1                              ; 59BF   0009
L_59C0:
        INCR    R0                              ; 59C0   0008
        DECLE   $0004,  $0006,  $0006,  $000C   ; 59C1   0004 0006 0006 000C
        DECLE   $0018,  $0020,  $0042,  $0045   ; 59C5   0018 0020 0042 0045
        DECLE   $0039,  $0000,  $0000           ; 59C9   0039 0000 0000

        COMR    R4                              ; 59CC   001C
        INCR    R2                              ; 59CD   000A
        INCR    R7                              ; 59CE   000F

        INCR    R1                              ; 59CF   0009
L_59D0:
        INCR    R4                              ; 59D0   000C
        DECLE   $0006,  $0003,  $0006,  $000C   ; 59D1   0006 0003 0006 000C
        DECLE   $0010,  $0022,  $0025,  $0029   ; 59D5   0010 0022 0025 0029
        DECLE   $0012,  $0000,  $0000,  $0038   ; 59D9   0012 0000 0000 0038
        DECLE   $0014,  $001E,  $0012,  $0018   ; 59DD   0014 001E 0012 0018
        DECLE   $000C,  $0006,  $000C,  $0010   ; 59E1   000C 0006 000C 0010
        DECLE   $0026,  $0029,  $0011,  $0002   ; 59E5   0026 0029 0011 0002
        DECLE   $0004,  $0000,  $0000,  $0000   ; 59E9   0004 0000 0000 0000
        DECLE   $0000,  $0000                   ; 59ED   0000 0000

        ADDR    R7,     R0                      ; 59EF   00F8
        SARC    R0,     2                       ; 59F0   007C
        RSWD    R6                              ; 59F1   003E
        MOVR    R3,     R2                      ; 59F2   009A
        SARC    R3,     1                       ; 59F3   007B
        SARC    R2,     2                       ; 59F4   007E
        MOVR    R3,     R7                      ; 59F5   009F

        DECLE   $003E,  $007C,  $00E4,  $0008   ; 59F6   003E 007C 00E4 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59FA   0000 0000 0000 0000
        DECLE   $0000,  $0078,  $007C,  $003E   ; 59FE   0000 0078 007C 003E
        DECLE   $001A,  $007B,  $007F,  $001E   ; 5A02   001A 007B 007F 001E
        DECLE   $003E,  $007C,  $0064,  $0008   ; 5A06   003E 007C 0064 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A0A   0000 0000 0000 0000
        DECLE   $0000                           ; 5A0E   0000

        ADDR    R7,     R0                      ; 5A0F   00F8
        SARC    R0,     2                       ; 5A10   007C
        RSWD    R6                              ; 5A11   003E
        MOVR    R3,     R6                      ; 5A12   009E
        SARC    R3,     2                       ; 5A13   007F
        SARC    R2,     2                       ; 5A14   007E
        MOVR    R3,     R7                      ; 5A15   009F

        DECLE   $003E,  $007C,  $00EC,  $0000   ; 5A16   003E 007C 00EC 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $00CC   ; 5A1E   0000 0000 0018 00CC
        DECLE   $007E,  $003B,  $001F,  $001C   ; 5A22   007E 003B 001F 001C
        DECLE   $003F,  $007F,  $00CC,  $0018   ; 5A26   003F 007F 00CC 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $004C   ; 5A2E   0000 0000 0018 004C
        DECLE   $007E,  $003F,  $001F,  $001F   ; 5A32   007E 003F 001F 001F
        DECLE   $003F,  $007E,  $004C,  $0008   ; 5A36   003F 007E 004C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $009C   ; 5A3E   0000 0000 0008 009C
        DECLE   $00BE,  $007B,  $007A,  $007F   ; 5A42   00BE 007B 007A 007F
        DECLE   $007E,  $00BE,  $009C,  $0008   ; 5A46   007E 00BE 009C 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 5A4E   0000 0000 0008 001C
        DECLE   $00BE,  $00FF,  $007F,  $00FE   ; 5A52   00BE 00FF 007F 00FE
        DECLE   $00BE,  $001C,  $0008,  $0000   ; 5A56   00BE 001C 0008 0000
        DECLE   $0000,  $0000,  $00A5,  $00A5   ; 5A5A   0000 0000 00A5 00A5
        DECLE   $0042,  $0024,  $0018,  $0018   ; 5A5E   0042 0024 0018 0018
        DECLE   $005A,  $00BD,  $0018,  $007E   ; 5A62   005A 00BD 0018 007E
        DECLE   $0099,  $003C,  $0042,  $0081   ; 5A66   0099 003C 0042 0081
        DECLE   $0000,  $0000,  $0065,  $0065   ; 5A6A   0000 0000 0065 0065
        DECLE   $0042,  $0024,  $0018,  $0098   ; 5A6E   0042 0024 0018 0098
        DECLE   $005A,  $003D,  $0098,  $007E   ; 5A72   005A 003D 0098 007E
        DECLE   $0019,  $00BC,  $0042,  $0001   ; 5A76   0019 00BC 0042 0001
        DECLE   $0000,  $0000,  $00A6,  $00A6   ; 5A7A   0000 0000 00A6 00A6
        DECLE   $0042,  $0024,  $0018,  $0019   ; 5A7E   0042 0024 0018 0019
        DECLE   $005A,  $00BC,  $0019,  $007E   ; 5A82   005A 00BC 0019 007E
        DECLE   $0098,  $003D,  $0042,  $0080   ; 5A86   0098 003D 0042 0080
        DECLE   $0000,  $0060,  $0010,  $0068   ; 5A8A   0000 0060 0010 0068
        DECLE   $0008,  $0028,  $0018,  $002C   ; 5A8E   0008 0028 0018 002C
        DECLE   $000E,  $00D6,  $0026,  $00C3   ; 5A92   000E 00D6 0026 00C3
        DECLE   $0003,  $0002,  $0006,  $0009   ; 5A96   0003 0002 0006 0009
        DECLE   $0000,  $0030,  $0038,  $0004   ; 5A9A   0000 0030 0038 0004
        DECLE   $0004,  $0024,  $0014,  $003C   ; 5A9E   0004 0024 0014 003C
        DECLE   $001E,  $00DE,  $0037,  $00C3   ; 5AA2   001E 00DE 0037 00C3
        DECLE   $0002,  $0004,  $000C,  $0012   ; 5AA6   0002 0004 000C 0012
        DECLE   $0000,  $0060,  $0010,  $0068   ; 5AAA   0000 0060 0010 0068
        DECLE   $0008,  $0028,  $0018,  $003C   ; 5AAE   0008 0028 0018 003C
        DECLE   $000E,  $000E,  $0077,  $0063   ; 5AB2   000E 000E 0077 0063
        DECLE   $0002,  $0002,  $0006,  $0009   ; 5AB6   0002 0002 0006 0009
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5AC2   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ACA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ACE   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0028,  $0000   ; 5AD2   0010 0000 0028 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5AD6   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5ADE   0000 0000 0000 0028
        DECLE   $0000,  $0000,  $0044,  $0000   ; 5AE2   0000 0000 0044 0000
        DECLE   $0000,  $0028,  $0000,  $0000   ; 5AE6   0000 0028 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AEA   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0000,  $0044   ; 5AEE   0000 0010 0000 0044
        DECLE   $0000,  $0000,  $0082,  $0000   ; 5AF2   0000 0000 0082 0000
        DECLE   $0000,  $0044,  $0000,  $0010   ; 5AF6   0000 0044 0000 0010
        DECLE   $0018,  $003C,  $007E,  $007E   ; 5AFA   0018 003C 007E 007E
        DECLE   $00A9,  $009A,  $0052,  $004A   ; 5AFE   00A9 009A 0052 004A
        DECLE   $0035,  $0015,  $000A,  $0012   ; 5B02   0035 0015 000A 0012
        DECLE   $0024,  $0024,  $0028,  $00D0   ; 5B06   0024 0024 0028 00D0
        DECLE   $0000,  $007C,  $00FE,  $00FE   ; 5B0A   0000 007C 00FE 00FE
        DECLE   $00AA,  $00A8,  $0094,  $0054   ; 5B0E   00AA 00A8 0094 0054
        DECLE   $0048,  $0094,  $00A4,  $0048   ; 5B12   0048 0094 00A4 0048
        DECLE   $0044,  $0036                   ; 5B16   0044 0036

        DECR    R1                              ; 5B18   0011
        INCR    R4                              ; 5B19   000C
L_5B1A:
        PSHR    R5                              ; 5B1A   0275
        MVI     G_0181, R0                      ; 5B1B   0280 0181
        TSTR    R0                              ; 5B1D   0080
        BNEQ    L_5B4E                          ; 5B1E   020C 002E

        MVII    #$0006, R0                      ; 5B20   02B8 0006

        JSR     R5,     X_RAND2                 ; 5B22   0004 0114 029E

        CMPI    #$0002, R0                      ; 5B25   0378 0002
        BLT     L_5B4E                          ; 5B27   0205 0025

        CMPI    #$0005, R0                      ; 5B29   0378 0005
        BNEQ    L_5B32                          ; 5B2B   020C 0005

        MVI     G_0174, R5                      ; 5B2D   0285 0174
        TSTR    R5                              ; 5B2F   00AD
        BNEQ    L_5B4E                          ; 5B30   020C 001C

L_5B32:
        MOVR    R0,     R4                      ; 5B32   0084

        JSR     R5,     .EXEC.76C               ; 5B33   0004 0114 036C

        MVI@    R1,     R3                      ; 5B36   028B
        MOVR    R3,     R5                      ; 5B37   009D
        SDBD                                    ; 5B38   0001
        ANDI    #$0800, R5                      ; 5B39   03BD 0000 0008
        BEQ     L_5B4E                          ; 5B3C   0204 0010

        XORI    #$0200, R3                      ; 5B3E   03FB 0200
        MVO@    R3,     R1                      ; 5B40   024B
        MOVR    R1,     R2                      ; 5B41   008A
        ADDI    #$0004, R2                      ; 5B42   02FA 0004
        MVI@    R2,     R0                      ; 5B44   0290
        MOVR    R0,     R1                      ; 5B45   0081
        SWAP    R0,     1                       ; 5B46   0040
        ANDI    #$00FF, R0                      ; 5B47   03B8 00FF
        NEGR    R0                              ; 5B49   0020

        JSR     R5,     X_PACK_BYTES            ; 5B4A   0004 0114 034F

        MVO@    R0,     R2                      ; 5B4D   0250
L_5B4E:
        SDBD                                    ; 5B4E   0001
        MVII    #$546F, R4                      ; 5B4F   02BC 006F 0054
        MVII    #$000E, R1                      ; 5B52   02B9 000E
        MVI     G_0161, R0                      ; 5B54   0280 0161
        XORI    #$0001, R0                      ; 5B56   03F8 0001
        BEQ     L_5B60                          ; 5B58   0204 0006

        SDBD                                    ; 5B5A   0001
        MVII    #$54FB, R3                      ; 5B5B   02BB 00FB 0054
        ADDI    #$0004, R7                      ; 5B5E   02FF 0004

L_5B60:
        SDBD                                    ; 5B60   0001
        MVII    #$54BF, R3                      ; 5B61   02BB 00BF 0054
L_5B64:
        MVO     R0,     G_0161                  ; 5B64   0240 0161

        JSR     R5,     L_511A                  ; 5B66   0004 0150 011A

        MVI     G_0180, R0                      ; 5B69   0280 0180
        DECR    R0                              ; 5B6B   0010
        MVO     R0,     G_0180                  ; 5B6C   0240 0180
        TSTR    R0                              ; 5B6E   0080
        BNEQ    L_5B74                          ; 5B6F   020C 0003

        JSR     R5,     L_64D2                  ; 5B71   0004 0164 00D2

L_5B74:
        PULR    R7                              ; 5B74   02B7

L_5B75:
        PSHR    R5                              ; 5B75   0275
        MVI     G_0181, R0                      ; 5B76   0280 0181
        TSTR    R0                              ; 5B78   0080
        BNEQ    L_5B74                          ; 5B79   022C 0006

        CLRR    R0                              ; 5B7B   01C0
        MVO     R0,     G_0176                  ; 5B7C   0240 0176
        INCR    R0                              ; 5B7E   0008
        MVO     R0,     G_0177                  ; 5B7F   0240 0177
L_5B81:
        MVII    #$003D, R0                      ; 5B81   02B8 003D
        MVO     R0,     G_017D                  ; 5B83   0240 017D
        CLRR    R1                              ; 5B85   01C9
        MVO     R1,     G_017B                  ; 5B86   0241 017B
        MVO     R1,     G_017C                  ; 5B88   0241 017C
        SDBD                                    ; 5B8A   0001
        MVII    #$5CE1, R3                      ; 5B8B   02BB 00E1 005C
        ADD     G_0176, R3                      ; 5B8E   02C3 0176
        MVI@    R3,     R1                      ; 5B90   0299
        MVO     R1,     G_0178                  ; 5B91   0241 0178
        MVI@    R1,     R4                      ; 5B93   028C
        TSTR    R4                              ; 5B94   00A4
        BMI     L_5C36                          ; 5B95   020B 009F

        INCR    R3                              ; 5B97   000B
L_5B98:
        MVI@    R3,     R1                      ; 5B98   0299
        MVO     R1,     G_0179                  ; 5B99   0241 0179
        MVI@    R1,     R4                      ; 5B9B   028C
        TSTR    R4                              ; 5B9C   00A4
        BMI     L_5BEE                          ; 5B9D   020B 004F

        MVI     G_0178, R2                      ; 5B9F   0282 0178
        ADDI    #$0300, R2                      ; 5BA1   02FA 0300

        JSR     R5,     L_52CB                  ; 5BA3   0004 0150 02CB

        MVO     R0,     G_017A                  ; 5BA6   0240 017A
        TSTR    R0                              ; 5BA8   0080
        BEQ     L_5BEE                          ; 5BA9   0204 0043

        ADDI    #$0002, R2                      ; 5BAB   02FA 0002
        MOVR    R2,     R4                      ; 5BAD   0094
        MVI     G_0179, R1                      ; 5BAE   0281 0179
        ADDI    #$0300, R1                      ; 5BB0   02F9 0300

        JSR     R5,     .EXEC.766               ; 5BB2   0004 0114 0366

        MVI@    R2,     R2                      ; 5BB5   0292
        SWAP    R2,     1                       ; 5BB6   0042
        ANDI    #$00FF, R2                      ; 5BB7   03BA 00FF
        PSHR    R2                              ; 5BB9   0272

        JSR     R5,     .EXEC.772               ; 5BBA   0004 0114 0372

        PULR    R5                              ; 5BBD   02B5
        SUBR    R2,     R5                      ; 5BBE   0115
        BPL     L_5BC2                          ; 5BBF   0203 0001

        NEGR    R5                              ; 5BC1   0025
L_5BC2:
        CMPI    #$0096, R5                      ; 5BC2   037D 0096
        BGT     L_5BEE                          ; 5BC4   020E 0028

        JSR     R5,     .EXEC.7A3               ; 5BC6   0004 0114 03A3

        CMPI    #$003C, R2                      ; 5BC9   037A 003C
        BGT     L_5BEE                          ; 5BCB   020E 0021

        CMP     G_017D, R2                      ; 5BCD   0342 017D
        BGT     L_5BEE                          ; 5BCF   020E 001D
        BLT     L_5BE3                          ; 5BD1   0205 0010

        MVI     G_017A, R0                      ; 5BD3   0280 017A

        JSR     R5,     X_EXT_SIGN_LO           ; 5BD5   0004 0114 0268

        TSTR    R0                              ; 5BD8   0080
        BMI     L_5BE3                          ; 5BD9   020B 0008

        MVI     G_017C, R0                      ; 5BDB   0280 017C

        JSR     R5,     X_EXT_SIGN_LO           ; 5BDD   0004 0114 0268

        TSTR    R0                              ; 5BE0   0080
        BMI     L_5BEE                          ; 5BE1   020B 000B

L_5BE3:
        MVO     R2,     G_017D                  ; 5BE3   0242 017D
        MVI     G_017A, R0                      ; 5BE5   0280 017A
        MVO     R0,     G_017C                  ; 5BE7   0240 017C
        NOP                                     ; 5BE9   0034
        MVI     G_0179, R0                      ; 5BEA   0280 0179
        MVO     R0,     G_017B                  ; 5BEC   0240 017B
L_5BEE:
        MVI     G_0177, R0                      ; 5BEE   0280 0177
        INCR    R0                              ; 5BF0   0008
        MVO     R0,     G_0177                  ; 5BF1   0240 0177
        CMPI    #$0002, R0                      ; 5BF3   0378 0002
        BGT     L_5C00                          ; 5BF5   020E 0009

        SDBD                                    ; 5BF7   0001
        MVII    #$5CE1, R3                      ; 5BF8   02BB 00E1 005C
        ADDR    R0,     R3                      ; 5BFB   00C3
        ADD     G_0176, R3                      ; 5BFC   02C3 0176
        B       L_5B98                          ; 5BFE   0220 0067

L_5C00:
        MVI     G_017C, R0                      ; 5C00   0280 017C

        JSR     R5,     X_EXT_SIGN_LO           ; 5C02   0004 0114 0268

        TSTR    R0                              ; 5C05   0080
        BEQ     L_5C36                          ; 5C06   0204 002E
        BMI     L_5C45                          ; 5C08   020B 003B

        MVI     G_017B, R1                      ; 5C0A   0281 017B
        ADDI    #$0300, R1                      ; 5C0C   02F9 0300
        MOVR    R1,     R4                      ; 5C0E   008C
        ADDI    #$0002, R4                      ; 5C0F   02FC 0002
        MVI@    R4,     R0                      ; 5C11   02A0
        SWAP    R0,     1                       ; 5C12   0040
        MVI@    R4,     R1                      ; 5C13   02A1
        SWAP    R1,     1                       ; 5C14   0041

        JSR     R5,     X_PACK_BYTES            ; 5C15   0004 0114 034F

        MOVR    R0,     R2                      ; 5C18   0082

        JSR     R5,     L_5C6A                  ; 5C19   0004 015C 006A
        JSR     R5,     .EXEC.9A3               ; 5C1C   0004 0118 01A3

        ADDI    #$0004, R1                      ; 5C1F   02F9 0004
        MVI@    R1,     R0                      ; 5C21   0288
L_5C22:
        SDBD                                    ; 5C22   0001
        ANDI    #$FF00, R0                      ; 5C23   03B8 0000 00FF
        BEQ     L_5C36                          ; 5C26   0204 000E

        SDBD                                    ; 5C28   0001
        ANDI    #$FDFF, R4                      ; 5C29   03BC 00FF 00FD
        TSTR    R0                              ; 5C2C   0080
        BPL     L_5C31                          ; 5C2D   0203 0002

        XORI    #$0200, R4                      ; 5C2F   03FC 0200
L_5C31:
        MVI     G_0178, R1                      ; 5C31   0281 0178
        ADDI    #$0300, R1                      ; 5C33   02F9 0300
        MVO@    R4,     R1                      ; 5C35   024C
L_5C36:
        MVII    #$0001, R0                      ; 5C36   02B8 0001
        MVO     R0,     G_0177                  ; 5C38   0240 0177
        MVI     G_0176, R0                      ; 5C3A   0280 0176
        ADDI    #$0003, R0                      ; 5C3C   02F8 0003
        MVO     R0,     G_0176                  ; 5C3E   0240 0176
        CMPI    #$0006, R0                      ; 5C40   0378 0006
        BLE     L_5B81                          ; 5C42   0226 00C2
        PULR    R7                              ; 5C44   02B7

L_5C45:
        JSR     R5,     L_5C6A                  ; 5C45   0004 015C 006A

        MVI     G_017B, R1                      ; 5C48   0281 017B
        ADDI    #$0300, R1                      ; 5C4A   02F9 0300
        ADDI    #$0004, R1                      ; 5C4C   02F9 0004
        MVI@    R1,     R0                      ; 5C4E   0288

        JSR     R5,     X_UNPK_BYTES            ; 5C4F   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 5C52   0004 0118 022F

        MVII    #$0004, R0                      ; 5C55   02B8 0004
        CMPI    #$0008, R1                      ; 5C57   0379 0008
        BLT     L_5C5C                          ; 5C59   0205 0001

        NEGR    R0                              ; 5C5B   0020
L_5C5C:
        ADDR    R0,     R1                      ; 5C5C   00C1
        MOVR    R3,     R0                      ; 5C5D   0098

        JSR     R5,     .EXEC.629               ; 5C5E   0004 0114 0229

        MVI     G_0178, R1                      ; 5C61   0281 0178
        ADDI    #$0300, R1                      ; 5C63   02F9 0300
        ADDI    #$0004, R1                      ; 5C65   02F9 0004
        MVO@    R0,     R1                      ; 5C67   0248
        B       L_5C22                          ; 5C68   0220 0047

L_5C6A:
        PSHR    R5                              ; 5C6A   0275
        MVI     G_0178, R1                      ; 5C6B   0281 0178
        ADDI    #$0300, R1                      ; 5C6D   02F9 0300
        MOVR    R1,     R3                      ; 5C6F   008B
        ADDI    #$0007, R3                      ; 5C70   02FB 0007
        MVI@    R3,     R4                      ; 5C72   029C
        ANDI    #$00FF, R4                      ; 5C73   03BC 00FF
        SDBD                                    ; 5C75   0001
        ADDI    #$60C2, R4                      ; 5C76   02FC 00C2 0060
        MVI@    R4,     R3                      ; 5C79   02A3
        ADD     G_0175, R3                      ; 5C7A   02C3 0175
        SLR     R3,     1                       ; 5C7C   0063
        MVI@    R1,     R4                      ; 5C7D   028C
        PULR    R7                              ; 5C7E   02B7

L_5C7F:
        PSHR    R5                              ; 5C7F   0275
        MVI     G_0181, R0                      ; 5C80   0280 0181
        TSTR    R0                              ; 5C82   0080
        BNEQ    L_5CE0                          ; 5C83   020C 005B

        MVI     G_0175, R0                      ; 5C85   0280 0175
        TSTR    R0                              ; 5C87   0080
        BNEQ    L_5C97                          ; 5C88   020C 000D

        MVI     G_0170, R0                      ; 5C8A   0280 0170
        MVI     G_0171, R1                      ; 5C8C   0281 0171
        ADDR    R0,     R1                      ; 5C8E   00C1
        CMPI    #$0006, R1                      ; 5C8F   0379 0006
        BGE     L_5C97                          ; 5C91   020D 0004

        INCR    R0                              ; 5C93   0008
        MVO     R0,     G_0170                  ; 5C94   0240 0170
        PULR    R7                              ; 5C96   02B7

L_5C97:
        CLRR    R0                              ; 5C97   01C0
        MVO     R0,     G_0170                  ; 5C98   0240 0170
        MVI     G_034D, R0                      ; 5C9A   0280 034D
        SDBD                                    ; 5C9C   0001
        ANDI    #$0800, R0                      ; 5C9D   03B8 0000 0008
        BEQ     L_5CE0                          ; 5CA0   0204 003E

        MVI     G_0355, R0                      ; 5CA2   0280 0355
        SDBD                                    ; 5CA4   0001
        ANDI    #$0800, R0                      ; 5CA5   03B8 0000 0008
        BEQ     L_5CE0                          ; 5CA8   0204 0036

L_5CAA:
        MVI     G_0351, R0                      ; 5CAA   0280 0351
        PSHR    R0                              ; 5CAC   0270

        JSR     R5,     L_6014                  ; 5CAD   0004 0160 0014

        CLRR    R4                              ; 5CB0   01E4
        PULR    R1                              ; 5CB1   02B1
        MVI     G_0351, R0                      ; 5CB2   0280 0351
        TSTR    R0                              ; 5CB4   0080
        BMI     L_5CC0                          ; 5CB5   020B 0009

        MVII    #$00F1, R2                      ; 5CB7   02BA 00F1
        TSTR    R1                              ; 5CB9   0089
        BPL     L_5CCF                          ; 5CBA   0203 0013

        MVII    #$000F, R0                      ; 5CBC   02B8 000F
        B       L_5CC9                          ; 5CBE   0200 0009

L_5CC0:
        MVII    #$000F, R2                      ; 5CC0   02BA 000F
        MVII    #$0200, R4                      ; 5CC2   02BC 0200
        TSTR    R1                              ; 5CC4   0089
        BMI     L_5CCF                          ; 5CC5   020B 0008

        MVII    #$00F1, R0                      ; 5CC7   02B8 00F1
L_5CC9:
        SWAP    R0,     1                       ; 5CC9   0040
        ADD     G_034F, R0                      ; 5CCA   02C0 034F
        MVO     R0,     G_034F                  ; 5CCC   0240 034F
        CLRR    R3                              ; 5CCE   01DB
L_5CCF:
        SWAP    R2,     1                       ; 5CCF   0042
        MVO     R2,     G_0359                  ; 5CD0   0242 0359
        SDBD                                    ; 5CD2   0001
        XORI    #$3860, R4                      ; 5CD3   03FC 0060 0038
        MVO     R4,     G_034D                  ; 5CD6   0244 034D
        MVO     R4,     G_0355                  ; 5CD8   0244 0355
        TSTR    R3                              ; 5CDA   009B
        BNEQ    L_5CE0                          ; 5CDB   020C 0003

        JSR     R5,     L_6564                  ; 5CDD   0004 0164 0164

L_5CE0:
        PULR    R7                              ; 5CE0   02B7

        SUB@    R5,     R5                      ; 5CE1   032D
        SUB@    R6,     R5                      ; 5CE2   0335
        SUBI    #$0335, R5                      ; 5CE3   033D 0335
        SUB@    R5,     R5                      ; 5CE5   032D
        SUBI    #$033D, R5                      ; 5CE6   033D 033D
        SUB@    R5,     R5                      ; 5CE8   032D
        SUB@    R6,     R5                      ; 5CE9   0335
L_5CEA:
        PSHR    R5                              ; 5CEA   0275
        MVI     G_015D, R1                      ; 5CEB   0281 015D
        INCR    R1                              ; 5CED   0009
        MVO     R1,     G_015D                  ; 5CEE   0241 015D
        SDBD                                    ; 5CF0   0001
        MVII    #$5DDC, R2                      ; 5CF1   02BA 00DC 005D
        SARC    R1,     1                       ; 5CF4   0079
        BNC     L_5CF9                          ; 5CF5   0209 0002

        ADDI    #$000C, R2                      ; 5CF7   02FA 000C

L_5CF9:
        JSR     R5,     L_5DF4                  ; 5CF9   0004 015C 01F4

        MVI     G_015D, R1                      ; 5CFC   0281 015D
        CMPI    #$0008, R1                      ; 5CFE   0379 0008
        BLT     L_5D34                          ; 5D00   0205 0032

        CLRR    R0                              ; 5D02   01C0
        MVO     R0,     G_015D                  ; 5D03   0240 015D
        MVI     G_0162, R1                      ; 5D05   0281 0162
        SDBD                                    ; 5D07   0001
        MVII    #$5DBC, R5                      ; 5D08   02BD 00BC 005D
        ADDR    R1,     R5                      ; 5D0B   00CD
        MVI@    R5,     R2                      ; 5D0C   02AA
        CMPI    #$0014, R1                      ; 5D0D   0379 0014
        BGE     L_5D2A                          ; 5D0F   020D 0019

        MVI     G_0163, R3                      ; 5D11   0283 0163
        SDBD                                    ; 5D13   0001
        MVII    #$5DD4, R4                      ; 5D14   02BC 00D4 005D
        ADDR    R3,     R4                      ; 5D17   00DC
        SDBD                                    ; 5D18   0001
        MVI@    R4,     R0                      ; 5D19   02A0
        MVO@    R0,     R2                      ; 5D1A   0250
        ADDI    #$0002, R3                      ; 5D1B   02FB 0002
        CMPI    #$0006, R3                      ; 5D1D   037B 0006
        BLE     L_5D22                          ; 5D1F   0206 0001

        CLRR    R3                              ; 5D21   01DB
L_5D22:
        MVO     R3,     G_0163                  ; 5D22   0243 0163
        CMPI    #$0004, R1                      ; 5D24   0379 0004
        BLT     L_5D2C                          ; 5D26   0205 0004

        MVI@    R5,     R2                      ; 5D28   02AA
        INCR    R1                              ; 5D29   0009
L_5D2A:
        CLRR    R0                              ; 5D2A   01C0
        MVO@    R0,     R2                      ; 5D2B   0250
L_5D2C:
        INCR    R1                              ; 5D2C   0009
        CMPI    #$0018, R1                      ; 5D2D   0379 0018
        BLT     L_5D32                          ; 5D2F   0205 0001

        CLRR    R1                              ; 5D31   01C9
L_5D32:
        MVO     R1,     G_0162                  ; 5D32   0241 0162
L_5D34:
        MVI     G_0172, R5                      ; 5D34   0285 0172
        MVII    #$031D, R3                      ; 5D36   02BB 031D
        MVII    #$016C, R1                      ; 5D38   02B9 016C
L_5D3A:
        MVI@    R1,     R2                      ; 5D3A   028A
        TSTR    R2                              ; 5D3B   0092
        BEQ     L_5D52                          ; 5D3C   0204 0014

        MVI@    R3,     R4                      ; 5D3E   029C
        TSTR    R4                              ; 5D3F   00A4
        BMI     L_5D4B                          ; 5D40   020B 0009

        INCR    R2                              ; 5D42   000A
        CMPI    #$000F, R2                      ; 5D43   037A 000F
        BGE     L_5D4B                          ; 5D45   020D 0004

        XORI    #$0001, R4                      ; 5D47   03FC 0001
        B       L_5D50                          ; 5D49   0200 0005

L_5D4B:
        CLRR    R2                              ; 5D4B   01D2
        SDBD                                    ; 5D4C   0001
        ANDI    #$FFFE, R4                      ; 5D4D   03BC 00FE 00FF
L_5D50:
        MVO@    R4,     R3                      ; 5D50   025C
        MVO@    R2,     R1                      ; 5D51   024A
L_5D52:
        DECR    R5                              ; 5D52   0015
        BEQ     L_5D5A                          ; 5D53   0204 0005

        INCR    R1                              ; 5D55   0009
        MVII    #$0325, R3                      ; 5D56   02BB 0325
        B       L_5D3A                          ; 5D58   0220 001F
L_5D5A:
        PULR    R7                              ; 5D5A   02B7

L_5D5B:
        PSHR    R5                              ; 5D5B   0275
        MVI     G_0181, R0                      ; 5D5C   0280 0181
        TSTR    R0                              ; 5D5E   0080
        BNEQ    L_5D8E                          ; 5D5F   020C 002D

        MVI     G_0345, R0                      ; 5D61   0280 0345
        SDBD                                    ; 5D63   0001
        ANDI    #$0800, R0                      ; 5D64   03B8 0000 0008
        BEQ     L_5D8E                          ; 5D67   0204 0025

        MVI     G_0174, R0                      ; 5D69   0280 0174
        TSTR    R0                              ; 5D6B   0080
        BNEQ    L_5D8E                          ; 5D6C   020C 0020

        INCR    R0                              ; 5D6E   0008
        MVO     R0,     G_0174                  ; 5D6F   0240 0174

        JSR     R5,     L_642B                  ; 5D71   0004 0164 002B

        MVI     G_0171, R3                      ; 5D74   0283 0171
        SDBD                                    ; 5D76   0001
        ADDI    #$5DB6, R3                      ; 5D77   02FB 00B6 005D
        MVI@    R3,     R1                      ; 5D7A   0299
L_5D7B:
        MVI     G_0347, R0                      ; 5D7B   0280 0347
        SWAP    R0,     1                       ; 5D7D   0040

        JSR     R5,     X_PACK_BYTES            ; 5D7E   0004 0114 034F

        MOVR    R0,     R2                      ; 5D81   0082
        MVII    #$0345, R1                      ; 5D82   02B9 0345
        SDBD                                    ; 5D84   0001
        MVII    #$60C2, R4                      ; 5D85   02BC 00C2 0060
        ADD     G_0171, R4                      ; 5D88   02C4 0171
        MVI@    R4,     R3                      ; 5D8A   02A3

        JSR     R5,     .EXEC.9A1               ; 5D8B   0004 0118 01A1

L_5D8E:
        PULR    R7                              ; 5D8E   02B7

        PSHR    R5                              ; 5D8F   0275
        MVI     G_0174, R0                      ; 5D90   0280 0174

        JSR     R5,     X_EXT_SIGN_LO           ; 5D92   0004 0114 0268

        TSTR    R0                              ; 5D95   0080
        BMI     L_5DA0                          ; 5D96   020B 0008

        NEGR    R0                              ; 5D98   0020
        MVO     R0,     G_0174                  ; 5D99   0240 0174
        MVII    #$005A, R1                      ; 5D9B   02B9 005A
        J       L_5D7B                          ; 5D9D   0004 035C 017B

L_5DA0:
        CLRR    R0                              ; 5DA0   01C0
        MVO     R0,     G_0174                  ; 5DA1   0240 0174
        SDBD                                    ; 5DA3   0001
        MVII    #$0014, R3                      ; 5DA4   02BB 0014 0000
        ADD     G_0175, R3                      ; 5DA7   02C3 0175
        MVI     G_0345, R4                      ; 5DA9   0284 0345
        ANDI    #$0200, R4                      ; 5DAB   03BC 0200
        BNEQ    L_5DB0                          ; 5DAD   020C 0001

        NEGR    R3                              ; 5DAF   0023
L_5DB0:
        ANDI    #$00FF, R3                      ; 5DB0   03BB 00FF
        SWAP    R3,     1                       ; 5DB2   0043
        MVO     R3,     G_0349                  ; 5DB3   0243 0349
        PULR    R7                              ; 5DB5   02B7

        DECLE   $004F,  $0047,  $003F,  $0037   ; 5DB6   004F 0047 003F 0037

        ADCR    R7                              ; 5DBA   002F

        ADCR    R0                              ; 5DBB   0028
L_5DBC:
        ADD@    R4,     R6                      ; 5DBC   02E6
        DECLE   $02D2,  $02BE,  $02AA,  $0296   ; 5DBD   02D2 02BE 02AA 0296
        DECLE   $02E6,  $0282,  $02D2,  $026E   ; 5DC1   02E6 0282 02D2 026E
        DECLE   $02BE,  $025A,  $02AA,  $0246   ; 5DC5   02BE 025A 02AA 0246
        DECLE   $0296,  $0232,  $0282,  $021E   ; 5DC9   0296 0232 0282 021E
        DECLE   $026E,  $020A,  $025A,  $0246   ; 5DCD   026E 020A 025A 0246
        DECLE   $0232,  $021E                   ; 5DD1   0232 021E

        BNOV    L_5E54                          ; 5DD3   020A 007F

        INCR    R1                              ; 5DD5   0009
        RRC     R3,     2                       ; 5DD6   0077
        INCR    R1                              ; 5DD7   0009
        SAR     R3,     2                       ; 5DD8   006F
        INCR    R1                              ; 5DD9   0009
        SLR     R3,     2                       ; 5DDA   0067
        INCR    R1                              ; 5DDB   0009
        DECR    R0                              ; 5DDC   0010
        INCR    R0                              ; 5DDD   0008
        NEGR    R0                              ; 5DDE   0020
        DECR    R0                              ; 5DDF   0010
        NEGR    R0                              ; 5DE0   0020
        EIS                                     ; 5DE1   0002
        SWAP    R0,     1                       ; 5DE2   0040

        JSR     R4,     .EXEC.002               ; 5DE3   0004 0010 0002
        DECLE   $0040,  $0008,  $0008,  $0010   ; 5DE6   0040 0008 0008 0010
        DECLE   $0004,  $0008,  $0004           ; 5DEA   0004 0008 0004

        SWAP    R0,     1                       ; 5DED   0040
        EIS                                     ; 5DEE   0002
        NEGR    R0                              ; 5DEF   0020
        INCR    R0                              ; 5DF0   0008
        SWAP    R0,     1                       ; 5DF1   0040
        EIS                                     ; 5DF2   0002
        DECR    R0                              ; 5DF3   0010
L_5DF4:
        PSHR    R5                              ; 5DF4   0275
        CLRR    R0                              ; 5DF5   01C0
        MVO     R0,     G_015E                  ; 5DF6   0240 015E
        DIS                                     ; 5DF8   0003
        MVI     .ISRVEC.0,R0                    ; 5DF9   0280 0100
        MVO     R0,     G_015F                  ; 5DFB   0240 015F
        MVI     .ISRVEC.1,R0                    ; 5DFD   0280 0101
        MVO     R0,     G_0160                  ; 5DFF   0240 0160
        SDBD                                    ; 5E01   0001
        MVII    #$0014, R0                      ; 5E02   02B8 0014 0000
        MVO     R0,     .ISRVEC.0               ; 5E05   0240 0100
        SDBD                                    ; 5E07   0001
        MVII    #$005E, R0                      ; 5E08   02B8 005E 0000
        MVO     R0,     .ISRVEC.1               ; 5E0B   0240 0101
L_5E0D:
        EIS                                     ; 5E0D   0002
        MVI     G_015E, R0                      ; 5E0E   0280 015E
        TSTR    R0                              ; 5E10   0080
        BEQ     L_5E0D                          ; 5E11   0224 0005
        PULR    R7                              ; 5E13   02B7

        PSHR    R5                              ; 5E14   0275
        SDBD                                    ; 5E15   0001
        MVII    #$3960, R4                      ; 5E16   02BC 0060 0039
        MOVR    R4,     R5                      ; 5E19   00A5
        MVI@    R5,     R0                      ; 5E1A   02A8
        MVII    #$001F, R3                      ; 5E1B   02BB 001F
L_5E1D:
        MVI@    R5,     R1                      ; 5E1D   02A9
        TSTR    R1                              ; 5E1E   0089
        BEQ     L_5E23                          ; 5E1F   0204 0002

        MVI@    R2,     R1                      ; 5E21   0291
        INCR    R2                              ; 5E22   000A
L_5E23:
        MVO@    R1,     R4                      ; 5E23   0261
        DECR    R3                              ; 5E24   0013
        BNEQ    L_5E1D                          ; 5E25   022C 0009

        TSTR    R0                              ; 5E27   0080
        BEQ     L_5E2B                          ; 5E28   0204 0001

        MVI@    R2,     R0                      ; 5E2A   0290
L_5E2B:
        MVO@    R0,     R4                      ; 5E2B   0260
        MVII    #$0001, R3                      ; 5E2C   02BB 0001
        MVO     R3,     G_015E                  ; 5E2E   0243 015E
        MVO     R1,     .STIC.VIDEN             ; 5E30   0241 0020
        MVI     G_015F, R0                      ; 5E32   0280 015F
        MVO     R0,     .ISRVEC.0               ; 5E34   0240 0100
        MVI     G_0160, R0                      ; 5E36   0280 0160
        MVO     R0,     .ISRVEC.1               ; 5E38   0240 0101

        JSR     R5,     X_PLAY_NOTE             ; 5E3A   0004 0118 02BD

        PULR    R7                              ; 5E3D   02B7

L_5E3E:
        PSHR    R5                              ; 5E3E   0275
        MVII    #$0006, R2                      ; 5E3F   02BA 0006
        MVII    #$016A, R3                      ; 5E41   02BB 016A
        MVII    #$0005, R4                      ; 5E43   02BC 0005
        MVI@    R3,     R5                      ; 5E45   029D
        CMPR    R4,     R5                      ; 5E46   0165
        BNEQ    L_5E51                          ; 5E47   020C 0008

        MVI     G_031D, R5                      ; 5E49   0285 031D
        SDBD                                    ; 5E4B   0001
        ANDI    #$0800, R5                      ; 5E4C   03BD 0000 0008
        BNEQ    L_5E5E                          ; 5E4F   020C 000D

L_5E51:
        INCR    R3                              ; 5E51   000B
        MVI@    R3,     R5                      ; 5E52   029D
        CMPR    R4,     R5                      ; 5E53   0165
L_5E54:
        BNEQ    L_5EAE                          ; 5E54   020C 0058

        MVI     G_0325, R5                      ; 5E56   0285 0325
        SDBD                                    ; 5E58   0001
        ANDI    #$0800, R5                      ; 5E59   03BD 0000 0008
        BEQ     L_5EAE                          ; 5E5C   0204 0050

L_5E5E:
        MOVR    R0,     R3                      ; 5E5E   0083
        MVII    #$000A, R0                      ; 5E5F   02B8 000A

        JSR     R5,     X_RAND2                 ; 5E61   0004 0114 029E

        CMP     G_0171, R0                      ; 5E64   0340 0171
        BLE     L_5E6B                          ; 5E66   0206 0003

        MOVR    R3,     R0                      ; 5E68   0098
        B       L_5ED7                          ; 5E69   0200 006C

L_5E6B:
        MOVR    R1,     R4                      ; 5E6B   008C
        SDBD                                    ; 5E6C   0001
        MVII    #$18F5, R5                      ; 5E6D   02BD 00F5 0018
        MVO@    R5,     R4                      ; 5E70   0265
        SUBI    #$0002, R3                      ; 5E71   033B 0002
        SDBD                                    ; 5E73   0001
        MVII    #$5EA8, R5                      ; 5E74   02BD 00A8 005E
        ADDR    R3,     R5                      ; 5E77   00DD
        ADDR    R3,     R5                      ; 5E78   00DD
        SDBD                                    ; 5E79   0001
        MVI@    R5,     R3                      ; 5E7A   02AB
        MVO@    R3,     R4                      ; 5E7B   0263
        SDBD                                    ; 5E7C   0001
        MVII    #$60C8, R3                      ; 5E7D   02BB 00C8 0060
        MVI@    R3,     R3                      ; 5E80   029B
        ADD     G_0175, R3                      ; 5E81   02C3 0175
        SWAP    R3,     1                       ; 5E83   0043
        MVII    #$0002, R0                      ; 5E84   02B8 0002

        JSR     R5,     X_RAND2                 ; 5E86   0004 0114 029E

        TSTR    R0                              ; 5E89   0080
        BEQ     L_5E8F                          ; 5E8A   0204 0003

        MVII    #$0097, R0                      ; 5E8C   02B8 0097
        NEGR    R3                              ; 5E8E   0023
L_5E8F:
        ADDI    #$0008, R0                      ; 5E8F   02F8 0008
        SWAP    R0,     1                       ; 5E91   0040
        MVO@    R0,     R4                      ; 5E92   0260
        MVII    #$0048, R0                      ; 5E93   02B8 0048

        JSR     R5,     X_RAND2                 ; 5E95   0004 0114 029E

        ADDI    #$0010, R0                      ; 5E98   02F8 0010
        SWAP    R0,     1                       ; 5E9A   0040
        MVO@    R0,     R4                      ; 5E9B   0260
        MVO@    R3,     R4                      ; 5E9C   0263
        MVII    #$0170, R5                      ; 5E9D   02BD 0170
        MVO@    R5,     R4                      ; 5E9F   0265
        CLRR    R5                              ; 5EA0   01ED
        MVO@    R5,     R4                      ; 5EA1   0265
        SDBD                                    ; 5EA2   0001
        MVII    #$0606, R5                      ; 5EA3   02BD 0006 0006
        MVO@    R5,     R4                      ; 5EA6   0265
        PULR    R7                              ; 5EA7   02B7

        DECLE   $00BF                           ; 5EA8   00BF

        RLC     R2,     2                       ; 5EA9   0056
        ADDR    R1,     R2                      ; 5EAA   00CA
        RLC     R2,     2                       ; 5EAB   0056
        ADDR    R2,     R3                      ; 5EAC   00D3
        RLC     R2,     2                       ; 5EAD   0056
L_5EAE:
        MVII    #$016A, R3                      ; 5EAE   02BB 016A
        MVII    #$0002, R4                      ; 5EB0   02BC 0002
        CMPR    R4,     R0                      ; 5EB2   0160
        BEQ     L_5EC9                          ; 5EB3   0204 0014

        CMPI    #$0003, R0                      ; 5EB5   0378 0003
        BNEQ    L_5ED7                          ; 5EB7   020C 001E

        MVI     G_0172, R5                      ; 5EB9   0285 0172
        CMPR    R4,     R5                      ; 5EBB   0165
        BNEQ    L_5ED7                          ; 5EBC   020C 0019

        MVI     G_0325, R5                      ; 5EBE   0285 0325
        SDBD                                    ; 5EC0   0001
        ANDI    #$0800, R5                      ; 5EC1   03BD 0000 0008
        BEQ     L_5ED7                          ; 5EC4   0204 0011

        INCR    R3                              ; 5EC6   000B
        B       L_5ED1                          ; 5EC7   0200 0008

L_5EC9:
        MVI     G_031D, R5                      ; 5EC9   0285 031D
        SDBD                                    ; 5ECB   0001
        ANDI    #$0800, R5                      ; 5ECC   03BD 0000 0008
        BEQ     L_5ED7                          ; 5ECF   0204 0006

L_5ED1:
        MVI@    R3,     R5                      ; 5ED1   029D
        CMPR    R4,     R5                      ; 5ED2   0165
        BGT     L_5ED7                          ; 5ED3   020E 0002

        INCR    R5                              ; 5ED5   000D
        MOVR    R5,     R2                      ; 5ED6   00AA
L_5ED7:
        SDBD                                    ; 5ED7   0001
        MVII    #$8000, R5                      ; 5ED8   02BD 0000 0080
        MVO@    R5,     R1                      ; 5EDB   024D
        DECR    R0                              ; 5EDC   0010
        DECR    R0                              ; 5EDD   0010
        SDBD                                    ; 5EDE   0001
        MVII    #$60CF, R5                      ; 5EDF   02BD 00CF 0060
        ADDR    R0,     R5                      ; 5EE2   00C5
        ADDR    R0,     R5                      ; 5EE3   00C5
        ADDR    R0,     R5                      ; 5EE4   00C5
        ADDR    R0,     R5                      ; 5EE5   00C5
        SDBD                                    ; 5EE6   0001
        MVI@    R5,     R4                      ; 5EE7   02AC
        SDBD                                    ; 5EE8   0001
        MVI@    R5,     R3                      ; 5EE9   02AB
        MOVR    R2,     R0                      ; 5EEA   0090

        JSR     R5,     X_RAND2                 ; 5EEB   0004 0114 029E

        ADDR    R0,     R3                      ; 5EEE   00C3
        MVI@    R3,     R2                      ; 5EEF   029A
        CMPI    #$0004, R0                      ; 5EF0   0378 0004
        BLT     L_5EFA                          ; 5EF2   0205 0006

        MVI@    R1,     R5                      ; 5EF4   028D
        SDBD                                    ; 5EF5   0001
        XORI    #$2000, R5                      ; 5EF6   03FD 0000 0020
        MVO@    R5,     R1                      ; 5EF9   024D
L_5EFA:
        ADDR    R0,     R4                      ; 5EFA   00C4
        ADDR    R0,     R4                      ; 5EFB   00C4
        SDBD                                    ; 5EFC   0001
        MVI@    R4,     R5                      ; 5EFD   02A5
        MOVR    R1,     R3                      ; 5EFE   008B
        INCR    R3                              ; 5EFF   000B
        MVO@    R5,     R3                      ; 5F00   025D
        SDBD                                    ; 5F01   0001
        MVII    #$60BC, R4                      ; 5F02   02BC 00BC 0060
        ADDR    R2,     R4                      ; 5F05   00D4
        SWAP    R2,     1                       ; 5F06   0042
        ADDR    R0,     R2                      ; 5F07   00C2
        MVI@    R4,     R0                      ; 5F08   02A0
        MVI@    R1,     R4                      ; 5F09   028C
        XORR    R0,     R4                      ; 5F0A   01C4
        MVII    #$0002, R0                      ; 5F0B   02B8 0002
        INCR    R3                              ; 5F0D   000B

        JSR     R5,     X_RAND2                 ; 5F0E   0004 0114 029E

        PSHR    R0                              ; 5F11   0270
        TSTR    R0                              ; 5F12   0080
        BEQ     L_5F19                          ; 5F13   0204 0004

        XORI    #$0200, R4                      ; 5F15   03FC 0200
        MVII    #$0097, R0                      ; 5F17   02B8 0097
L_5F19:
        ADDI    #$0008, R0                      ; 5F19   02F8 0008
        SWAP    R0,     1                       ; 5F1B   0040
        MVO@    R0,     R3                      ; 5F1C   0258
        MVO@    R4,     R1                      ; 5F1D   024C
        INCR    R3                              ; 5F1E   000B
        MVII    #$0048, R0                      ; 5F1F   02B8 0048

        JSR     R5,     X_RAND2                 ; 5F21   0004 0114 029E

        ADDI    #$0010, R0                      ; 5F24   02F8 0010
        SWAP    R0,     1                       ; 5F26   0040
        MVO@    R0,     R3                      ; 5F27   0258
        ADDI    #$0002, R3                      ; 5F28   02FB 0002
        MVII    #$0140, R5                      ; 5F2A   02BD 0140
        MVO@    R5,     R3                      ; 5F2C   025D
        CLRR    R5                              ; 5F2D   01ED
        INCR    R3                              ; 5F2E   000B
        MVO@    R5,     R3                      ; 5F2F   025D
        INCR    R3                              ; 5F30   000B
        MVO@    R2,     R3                      ; 5F31   025A
        ANDI    #$00FF, R2                      ; 5F32   03BA 00FF
        SUBI    #$0003, R3                      ; 5F34   033B 0003
        SDBD                                    ; 5F36   0001
        ADDI    #$60C2, R2                      ; 5F37   02FA 00C2 0060
        MVI@    R2,     R1                      ; 5F3A   0291
        ADD     G_0175, R1                      ; 5F3B   02C1 0175
        SWAP    R1,     1                       ; 5F3D   0041
        PULR    R0                              ; 5F3E   02B0
        TSTR    R0                              ; 5F3F   0080
        BEQ     L_5F43                          ; 5F40   0204 0001

        NEGR    R1                              ; 5F42   0021
L_5F43:
        MVO@    R1,     R3                      ; 5F43   0259
        SUBI    #$0004, R3                      ; 5F44   033B 0004
        MVI@    R3,     R0                      ; 5F46   0298
        SDBD                                    ; 5F47   0001
        XORI    #$9860, R0                      ; 5F48   03F8 0060 0098
        MVO@    R0,     R3                      ; 5F4B   0258
        PULR    R7                              ; 5F4C   02B7

        PSHR    R5                              ; 5F4D   0275
        MVI     G_034D, R0                      ; 5F4E   0280 034D
        TSTR    R0                              ; 5F50   0080
        BMI     L_5F6B                          ; 5F51   020B 0018

        SDBD                                    ; 5F53   0001
        MVII    #$8000, R0                      ; 5F54   02B8 0000 0080
        MVO     R0,     G_034D                  ; 5F57   0240 034D
        MVI     G_017F, R0                      ; 5F59   0280 017F
        TSTR    R0                              ; 5F5B   0080
        BNEQ    L_5F6C                          ; 5F5C   020C 000E

        MVII    #$0001, R0                      ; 5F5E   02B8 0001
        MVO     R0,     G_017E                  ; 5F60   0240 017E
        MVII    #$0007, R0                      ; 5F62   02B8 0007

        JSR     R5,     .EXEC.6D5               ; 5F64   0004 0114 02D5

        MVI     G_0351, R1                      ; 5F67   0281 0351
        MVO     R1,     G_0359                  ; 5F69   0241 0359
L_5F6B:
        PULR    R7                              ; 5F6B   02B7

L_5F6C:
        CLRR    R0                              ; 5F6C   01C0
        MVO     R0,     G_017F                  ; 5F6D   0240 017F
        B       L_5FA3                          ; 5F6F   0200 0032

        PSHR    R5                              ; 5F71   0275
        MVI     G_0355, R0                      ; 5F72   0280 0355
        TSTR    R0                              ; 5F74   0080
        BMI     L_5F89                          ; 5F75   020B 0012

        SDBD                                    ; 5F77   0001
        MVII    #$8000, R0                      ; 5F78   02B8 0000 0080
        MVO     R0,     G_0355                  ; 5F7B   0240 0355
        MVI     G_017E, R0                      ; 5F7D   0280 017E
        CLRR    R1                              ; 5F7F   01C9
        MVO     R1,     G_017E                  ; 5F80   0241 017E
        TSTR    R0                              ; 5F82   0080
        BNEQ    L_5FA3                          ; 5F83   020C 001E

        MVII    #$0001, R0                      ; 5F85   02B8 0001
        MVO     R0,     G_017F                  ; 5F87   0240 017F
L_5F89:
        PULR    R7                              ; 5F89   02B7

L_5F8A:
        PSHR    R5                              ; 5F8A   0275
        SDBD                                    ; 5F8B   0001
        MVII    #$8000, R0                      ; 5F8C   02B8 0000 0080
        MVO     R0,     G_034D                  ; 5F8F   0240 034D
        MVO     R0,     G_0355                  ; 5F91   0240 0355
        CLRR    R0                              ; 5F93   01C0
        MVO     R0,     G_017E                  ; 5F94   0240 017E
        MVO     R0,     G_017F                  ; 5F96   0240 017F
        MVO     R0,     G_034F                  ; 5F98   0240 034F
        MVO     R0,     G_0357                  ; 5F9A   0240 0357
        NOP                                     ; 5F9C   0034
        MVO     R0,     G_0350                  ; 5F9D   0240 0350
        MVO     R0,     G_0358                  ; 5F9F   0240 0358
        MVO     R0,     G_035B                  ; 5FA1   0240 035B
L_5FA3:
        SDBD                                    ; 5FA3   0001
        MVII    #$5665, R0                      ; 5FA4   02B8 0065 0056
        MVO     R0,     G_034E                  ; 5FA7   0240 034E
        SDBD                                    ; 5FA9   0001
        MVII    #$5676, R0                      ; 5FAA   02B8 0076 0056
        NOP                                     ; 5FAD   0034
        MVO     R0,     G_0356                  ; 5FAE   0240 0356
        MVII    #$0014, R0                      ; 5FB0   02B8 0014

        JSR     R5,     X_RAND2                 ; 5FB2   0004 0114 029E

        MVI     G_0171, R1                      ; 5FB5   0281 0171
        SDBD                                    ; 5FB7   0001
        ADDI    #$60C9, R1                      ; 5FB8   02F9 00C9 0060
        ADD@    R1,     R0                      ; 5FBB   02C8
        MVO     R0,     G_0353                  ; 5FBC   0240 0353
        PULR    R7                              ; 5FBE   02B7

        PSHR    R5                              ; 5FBF   0275
        MVII    #$0007, R0                      ; 5FC0   02B8 0007

        JSR     R5,     .EXEC.6CF               ; 5FC2   0004 0114 02CF

        MVII    #$0140, R0                      ; 5FC5   02B8 0140
        MVO     R0,     G_0352                  ; 5FC7   0240 0352
        MVO     R0,     G_035A                  ; 5FC9   0240 035A
        CLRR    R0                              ; 5FCB   01C0
        MVO     R0,     G_016E                  ; 5FCC   0240 016E
        MVO     R0,     G_016F                  ; 5FCE   0240 016F
        MVI     G_0171, R4                      ; 5FD0   0284 0171
        SDBD                                    ; 5FD2   0001
        ADDI    #$60C2, R4                      ; 5FD3   02FC 00C2 0060
        MVI@    R4,     R3                      ; 5FD6   02A3
        ADDI    #$001C, R3                      ; 5FD7   02FB 001C
        ADD     G_0175, R3                      ; 5FD9   02C3 0175
        SWAP    R3,     1                       ; 5FDB   0043
        CLRR    R4                              ; 5FDC   01E4
        MVII    #$0002, R0                      ; 5FDD   02B8 0002

        JSR     R5,     X_RAND2                 ; 5FDF   0004 0114 029E

        TSTR    R0                              ; 5FE2   0080
        BEQ     L_5FEE                          ; 5FE3   0204 0009

        NEGR    R3                              ; 5FE5   0023
        MVII    #$000F, R1                      ; 5FE6   02B9 000F
        MVII    #$0200, R4                      ; 5FE8   02BC 0200
        MVII    #$0097, R0                      ; 5FEA   02B8 0097
        B       L_5FF2                          ; 5FEC   0200 0004

L_5FEE:
        MVII    #$0011, R0                      ; 5FEE   02B8 0011
        MVII    #$00F1, R1                      ; 5FF0   02B9 00F1
L_5FF2:
        SWAP    R1,     1                       ; 5FF2   0041
        SWAP    R0,     1                       ; 5FF3   0040
        NOP                                     ; 5FF4   0034
        MVO     R1,     G_0359                  ; 5FF5   0241 0359
        MVO     R0,     G_034F                  ; 5FF7   0240 034F
        MVO     R3,     G_0351                  ; 5FF9   0243 0351
        MVII    #$0048, R0                      ; 5FFB   02B8 0048

        JSR     R5,     X_RAND2                 ; 5FFD   0004 0114 029E

        ADDI    #$0010, R0                      ; 6000   02F8 0010
        SWAP    R0,     1                       ; 6002   0040
        MVO     R0,     G_0350                  ; 6003   0240 0350

        JSR     R5,     L_6014                  ; 6005   0004 0160 0014

        SDBD                                    ; 6008   0001
        XORI    #$3860, R4                      ; 6009   03FC 0060 0038
        MVO     R4,     G_034D                  ; 600C   0244 034D
        MVO     R4,     G_0355                  ; 600E   0244 0355

        JSR     R5,     L_6501                  ; 6010   0004 0164 0101

        PULR    R7                              ; 6013   02B7

L_6014:
        PSHR    R5                              ; 6014   0275
        CLRR    R0                              ; 6015   01C0
        MVII    #$031D, R2                      ; 6016   02BA 031D
        MVI@    R2,     R5                      ; 6018   0295
        SDBD                                    ; 6019   0001
        ANDI    #$0800, R5                      ; 601A   03BD 0000 0008
        BEQ     L_6020                          ; 601D   0204 0001

        INCR    R0                              ; 601F   0008
L_6020:
        MVI     G_0172, R3                      ; 6020   0283 0172
        DECR    R3                              ; 6022   0013
        BEQ     L_6033                          ; 6023   0204 000E

        ADDI    #$0008, R2                      ; 6025   02FA 0008
        MVI@    R2,     R5                      ; 6027   0295
        SDBD                                    ; 6028   0001
        ANDI    #$0800, R5                      ; 6029   03BD 0000 0008
        BEQ     L_6033                          ; 602C   0204 0005

        INCR    R0                              ; 602E   0008
        CMPI    #$0002, R0                      ; 602F   0378 0002
        BNEQ    L_6039                          ; 6031   020C 0006

L_6033:
        TSTR    R0                              ; 6033   0080
        BEQ     L_5F89                          ; 6034   0224 00AC

        JSR     R5,     X_RAND2                 ; 6036   0004 0114 029E
L_6039:
        JSR     R5,     .EXEC.76C               ; 6039   0004 0114 036C

        MOVR    R1,     R2                      ; 603C   008A
        ADDI    #$0002, R2                      ; 603D   02FA 0002
        MVI@    R2,     R0                      ; 603F   0290
        SWAP    R0,     1                       ; 6040   0040
        MOVR    R0,     R5                      ; 6041   0085
        ANDI    #$00FF, R5                      ; 6042   03BD 00FF
        MVI     G_034F, R3                      ; 6044   0283 034F
        SWAP    R3,     1                       ; 6046   0043
        ANDI    #$00FF, R3                      ; 6047   03BB 00FF
        SUBR    R3,     R5                      ; 6049   011D
        BPL     L_604D                          ; 604A   0203 0001

        NEGR    R5                              ; 604C   0025
L_604D:
        CMPI    #$0096, R5                      ; 604D   037D 0096
        BGT     L_5F89                          ; 604F   022E 00C7

        INCR    R2                              ; 6051   000A
        MVI@    R2,     R1                      ; 6052   0291
        SWAP    R1,     1                       ; 6053   0041

        JSR     R5,     X_PACK_BYTES            ; 6054   0004 0114 034F

        MOVR    R0,     R2                      ; 6057   0082
        MVI     G_0171, R5                      ; 6058   0285 0171
        SDBD                                    ; 605A   0001
        ADDI    #$60C2, R5                      ; 605B   02FD 00C2 0060
        MVI@    R5,     R3                      ; 605E   02AB
        ADDI    #$001C, R3                      ; 605F   02FB 001C
        ADD     G_0175, R3                      ; 6061   02C3 0175
        MVII    #$034D, R1                      ; 6063   02B9 034D
        SLR     R3,     1                       ; 6065   0063

        JSR     R5,     .EXEC.9A3               ; 6066   0004 0118 01A3

        PULR    R7                              ; 6069   02B7

L_606A:
        PSHR    R5                              ; 606A   0275
        SDBD                                    ; 606B   0001
        MVII    #$8000, R0                      ; 606C   02B8 0000 0080
        MVO     R0,     G_0345                  ; 606F   0240 0345
        CLRR    R0                              ; 6071   01C0
        MVO     R0,     G_0174                  ; 6072   0240 0174
        MVO     R0,     G_034B                  ; 6074   0240 034B
        MVII    #$0002, R0                      ; 6076   02B8 0002

        JSR     R5,     X_RAND2                 ; 6078   0004 0114 029E

        TSTR    R0                              ; 607B   0080
        BNEQ    L_6086                          ; 607C   020C 0008

        SDBD                                    ; 607E   0001
        MVII    #$568F, R0                      ; 607F   02B8 008F 0056
        MVII    #$0012, R4                      ; 6082   02BC 0012
        B       L_608C                          ; 6084   0200 0006

L_6086:
        SDBD                                    ; 6086   0001
        MVII    #$56A0, R0                      ; 6087   02B8 00A0 0056
        MVII    #$0002, R4                      ; 608A   02BC 0002
L_608C:
        MVO     R0,     G_0346                  ; 608C   0240 0346
        MVII    #$0014, R1                      ; 608E   02B9 0014
        ADD     G_0175, R1                      ; 6090   02C1 0175
        SWAP    R1,     1                       ; 6092   0041
        MVII    #$0002, R0                      ; 6093   02B8 0002

        JSR     R5,     X_RAND2                 ; 6095   0004 0114 029E

        TSTR    R0                              ; 6098   0080
        BEQ     L_60A1                          ; 6099   0204 0006

        NEGR    R1                              ; 609B   0021
        MVII    #$009F, R0                      ; 609C   02B8 009F
        SWAP    R0,     1                       ; 609E   0040
        XORI    #$0200, R4                      ; 609F   03FC 0200
L_60A1:
        XORI    #$0200, R4                      ; 60A1   03FC 0200
        MVO     R0,     G_0347                  ; 60A3   0240 0347
        MVII    #$0009, R0                      ; 60A5   02B8 0009

        JSR     R5,     X_RAND2                 ; 60A7   0004 0114 029E

        ADDI    #$0057, R0                      ; 60AA   02F8 0057
        SWAP    R0,     1                       ; 60AC   0040
        MVO     R0,     G_0348                  ; 60AD   0240 0348
        MVO     R1,     G_0349                  ; 60AF   0241 0349
        MVII    #$0100, R0                      ; 60B1   02B8 0100
        MVO     R0,     G_034A                  ; 60B3   0240 034A
        SDBD                                    ; 60B5   0001
        XORI    #$1860, R4                      ; 60B6   03FC 0060 0018
        MVO     R4,     G_0345                  ; 60B9   0244 0345
        PULR    R7                              ; 60BB   02B7

        DECLE   $0001                           ; 60BC   0001

        DIS                                     ; 60BD   0003
L_60BE:
        DECR    R7                              ; 60BE   0017

        DECLE   $0012,  $0013,  $0014,  $0018   ; 60BF   0012 0013 0014 0018
        DECLE   $001E,  $0024,  $002A,  $0030   ; 60C3   001E 0024 002A 0030
        DECLE   $0036,  $003C,  $0050,  $0032   ; 60C7   0036 003C 0050 0032
        DECLE   $001E,  $000F,  $0005,  $0001   ; 60CB   001E 000F 0005 0001
        DECLE   $00DB,  $0060,  $00FF           ; 60CF   00DB 0060 00FF

        SLR     R0,     1                       ; 60D2   0060
        ADDR    R4,     R7                      ; 60D3   00E7

        DECLE   $0060,  $0005                   ; 60D4   0060 0005

        SLR     R1,     1                       ; 60D6   0061
        ADDR    R6,     R3                      ; 60D7   00F3
        SLR     R0,     1                       ; 60D8   0060
        INCR    R3                              ; 60D9   000B
        SLR     R1,     1                       ; 60DA   0061
        ADDR    R0,     R3                      ; 60DB   00C3
        RLC     R1,     2                       ; 60DC   0055
        ADDR    R1,     R6                      ; 60DD   00CE
        RLC     R1,     2                       ; 60DE   0055
        ADDR    R3,     R1                      ; 60DF   00D9
        RLC     R1,     2                       ; 60E0   0055
        ADDR    R4,     R4                      ; 60E1   00E4
        RLC     R1,     2                       ; 60E2   0055
        ADDR    R5,     R7                      ; 60E3   00EF

        DECLE   $0055,  $00FA,  $0055,  $0005   ; 60E4   0055 00FA 0055 0005

        RLC     R2,     2                       ; 60E8   0056
        INCR    R6                              ; 60E9   000E
        RLC     R2,     2                       ; 60EA   0056
L_60EB:
        DECR    R7                              ; 60EB   0017

        DECLE   $0056,  $0020,  $0056,  $0029   ; 60EC   0056 0020 0056 0029
        DECLE   $0056,  $0032,  $0056,  $003B   ; 60F0   0056 0032 0056 003B
        DECLE   $0056,  $0042,  $0056,  $0049   ; 60F4   0056 0042 0056 0049
        DECLE   $0056,  $0050,  $0056,  $0057   ; 60F8   0056 0050 0056 0057
        DECLE   $0056,  $005E,  $0056,  $0001   ; 60FC   0056 005E 0056 0001
        DECLE   $0001,  $0001,  $0004,  $0005   ; 6100   0001 0001 0004 0005
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6104   0001 0000 0000 0000
        DECLE   $0004,  $0005,  $0001,  $0000   ; 6108   0004 0005 0001 0000
        DECLE   $0001,  $0001,  $0002,  $0003   ; 610C   0001 0001 0002 0003
        DECLE   $0000                           ; 6110   0000

        PSHR    R5                              ; 6111   0275
        MVI@    R1,     R4                      ; 6112   028C
        SDBD                                    ; 6113   0001
        ANDI    #$0800, R4                      ; 6114   03BC 0000 0008
        BEQ     L_620A                          ; 6117   0204 00F1

        MVI     G_0325, R4                      ; 6119   0284 0325
        SDBD                                    ; 611B   0001
        ANDI    #$0800, R4                      ; 611C   03BC 0000 0008
        BEQ     L_620A                          ; 611F   0204 00E9

        MVI     G_016A, R4                      ; 6121   0284 016A
        CMP     G_016B, R4                      ; 6123   0344 016B
        BEQ     L_620A                          ; 6125   0204 00E3
        BLT     L_612E                          ; 6127   0205 0005

        MOVR    R0,     R3                      ; 6129   0083
        ADDI    #$0008, R1                      ; 612A   02F9 0008
        MVI     G_016B, R4                      ; 612C   0284 016B
L_612E:
        MVO     R3,     G_0173                  ; 612E   0243 0173
        SDBD                                    ; 6130   0001
        ADDI    #$62A6, R4                      ; 6131   02FC 00A6 0062
        MVI@    R4,     R0                      ; 6134   02A0
        PSHR    R1                              ; 6135   0271

        JSR     R5,     L_51C4                  ; 6136   0004 0150 01C4

        PULR    R1                              ; 6139   02B1

        JSR     R5,     .EXEC.766               ; 613A   0004 0114 0366

        MVO     R0,     G_0173                  ; 613D   0240 0173
        B       L_61D8                          ; 613F   0200 0097

        PSHR    R5                              ; 6141   0275
        MVI@    R1,     R4                      ; 6142   028C
        SDBD                                    ; 6143   0001
        ANDI    #$0800, R4                      ; 6144   03BC 0000 0008
        BEQ     L_620A                          ; 6147   0204 00C1

        MOVR    R0,     R4                      ; 6149   0084
        MOVR    R1,     R2                      ; 614A   008A
        MOVR    R3,     R0                      ; 614B   0098

        JSR     R5,     .EXEC.76C               ; 614C   0004 0114 036C

        MVI@    R1,     R5                      ; 614F   028D
        SDBD                                    ; 6150   0001
        ANDI    #$0800, R5                      ; 6151   03BD 0000 0008
        BEQ     L_620A                          ; 6154   0204 00B4

        MOVR    R1,     R3                      ; 6156   008B
        MVO     R4,     G_0173                  ; 6157   0244 0173
        MVII    #$016A, R5                      ; 6159   02BD 016A
        ADDR    R4,     R5                      ; 615B   00E5
        MVI@    R5,     R4                      ; 615C   02AC
        ADDI    #$0007, R3                      ; 615D   02FB 0007
        MVI@    R3,     R3                      ; 615F   029B
        ANDI    #$00FF, R3                      ; 6160   03BB 00FF
        CMPR    R3,     R4                      ; 6162   015C
        BGE     L_6168                          ; 6163   020D 0003

        MOVR    R2,     R1                      ; 6165   0091
        B       L_61D8                          ; 6166   0200 0070

L_6168:
        SDBD                                    ; 6168   0001
        ADDI    #$62A6, R3                      ; 6169   02FB 00A6 0062
        MVI@    R3,     R0                      ; 616C   0298
        PSHR    R1                              ; 616D   0271

        JSR     R5,     L_51C4                  ; 616E   0004 0150 01C4

        PULR    R1                              ; 6171   02B1
        MVII    #$0001, R4                      ; 6172   02BC 0001
        B       L_62D1                          ; 6174   0200 015B

        PSHR    R5                              ; 6176   0275
        MVO     R3,     G_0173                  ; 6177   0243 0173
        MVI@    R1,     R4                      ; 6179   028C
        SDBD                                    ; 617A   0001
        ANDI    #$0800, R4                      ; 617B   03BC 0000 0008
        BEQ     L_620A                          ; 617E   0204 008A

        MOVR    R3,     R0                      ; 6180   0098

        JSR     R5,     .EXEC.76C               ; 6181   0004 0114 036C

        MVI@    R1,     R4                      ; 6184   028C
        SDBD                                    ; 6185   0001
        ANDI    #$0800, R4                      ; 6186   03BC 0000 0008
        BEQ     L_620A                          ; 6189   0204 007F

        MVII    #$016A, R2                      ; 618B   02BA 016A
        ADDR    R3,     R2                      ; 618D   00DA
        MVI@    R2,     R4                      ; 618E   0294
        CMPI    #$0004, R4                      ; 618F   037C 0004
        BLT     L_61D8                          ; 6191   0205 0045

        MVI     G_0349, R0                      ; 6193   0280 0349
        ANDI    #$00FF, R0                      ; 6195   03B8 00FF
        BEQ     L_61D8                          ; 6197   0204 003F

        JSR     R5,     X_EXT_SIGN_LO           ; 6199   0004 0114 0268

        TSTR    R0                              ; 619C   0080
        BMI     L_61D8                          ; 619D   020B 0039

        SDBD                                    ; 619F   0001
        MVII    #$1073, R4                      ; 61A0   02BC 0073 0010
        MVI     G_0345, R5                      ; 61A3   0285 0345
        ANDI    #$0200, R5                      ; 61A5   03BD 0200
        XORR    R5,     R4                      ; 61A7   01EC
        MVO     R4,     G_0345                  ; 61A8   0244 0345
        MVII    #$0014, R0                      ; 61AA   02B8 0014
        MVO     R0,     G_0349                  ; 61AC   0240 0349
        CLRR    R0                              ; 61AE   01C0
        MVO     R0,     G_0174                  ; 61AF   0240 0174
        MVO     R0,     G_034B                  ; 61B1   0240 034B
        SDBD                                    ; 61B3   0001
        MVII    #$62A6, R4                      ; 61B4   02BC 00A6 0062
        ADD     G_0171, R4                      ; 61B7   02C4 0171
        MVII    #$0190, R0                      ; 61B9   02B8 0190
        ADD@    R4,     R0                      ; 61BB   02E0

        JSR     R5,     L_51C4                  ; 61BC   0004 0150 01C4

        MVII    #$0164, R3                      ; 61BF   02BB 0164
        ADD     G_0173, R3                      ; 61C1   02C3 0173
        MVI@    R3,     R0                      ; 61C3   0298
        CMPI    #$00FF, R0                      ; 61C4   0378 00FF
        BEQ     L_61CD                          ; 61C6   0204 0005

        INCR    R0                              ; 61C8   0008
        MVO@    R0,     R3                      ; 61C9   0258

        JSR     R5,     L_52A1                  ; 61CA   0004 0150 02A1
L_61CD:
        JSR     R5,     L_65A6                  ; 61CD   0004 0164 01A6

        PULR    R7                              ; 61D0   02B7

        PSHR    R5                              ; 61D1   0275
        MVO     R3,     G_0173                  ; 61D2   0243 0173
        MOVR    R3,     R0                      ; 61D4   0098

        JSR     R5,     .EXEC.76C               ; 61D5   0004 0114 036C

L_61D8:
        MVI@    R1,     R4                      ; 61D8   028C
        MOVR    R4,     R5                      ; 61D9   00A5
        SDBD                                    ; 61DA   0001
        ANDI    #$0800, R5                      ; 61DB   03BD 0000 0008
        BEQ     L_620A                          ; 61DE   0204 002A

        CLRR    R5                              ; 61E0   01ED
        MVII    #$016C, R2                      ; 61E1   02BA 016C
        ADD     G_0173, R2                      ; 61E3   02C2 0173
        MVO@    R5,     R2                      ; 61E5   0255
        ANDI    #$0200, R4                      ; 61E6   03BC 0200
        SDBD                                    ; 61E8   0001
        MVII    #$B0F2, R0                      ; 61E9   02B8 00F2 00B0
        XORR    R4,     R0                      ; 61EC   01E0
        MVO@    R0,     R1                      ; 61ED   0248
        INCR    R1                              ; 61EE   0009
        SDBD                                    ; 61EF   0001
        MVII    #$56B1, R0                      ; 61F0   02B8 00B1 0056
        MVO@    R0,     R1                      ; 61F3   0248
        ADDI    #$0004, R1                      ; 61F4   02F9 0004
        MVII    #$01F0, R0                      ; 61F6   02B8 01F0
        MVO@    R0,     R1                      ; 61F8   0248
        INCR    R1                              ; 61F9   0009
        MVII    #$001E, R0                      ; 61FA   02B8 001E
        MVO@    R0,     R1                      ; 61FC   0248
        MVII    #$0164, R2                      ; 61FD   02BA 0164
        ADD     G_0173, R2                      ; 61FF   02C2 0173
        MVI@    R2,     R4                      ; 6201   0294
        DECR    R4                              ; 6202   0014
        MVO@    R4,     R2                      ; 6203   0254

        JSR     R5,     L_52A1                  ; 6204   0004 0150 02A1
        JSR     R5,     L_657E                  ; 6207   0004 0164 017E

L_620A:
        PULR    R7                              ; 620A   02B7

        PSHR    R5                              ; 620B   0275
        SDBD                                    ; 620C   0001
        MVII    #$8000, R2                      ; 620D   02BA 0000 0080
        MVO@    R2,     R1                      ; 6210   024A
        MVI     G_0164, R1                      ; 6211   0281 0164
        TSTR    R1                              ; 6213   0089
        BNEQ    L_621B                          ; 6214   020C 0005

        MVI     G_0165, R2                      ; 6216   0282 0165
        TSTR    R2                              ; 6218   0092
        BEQ     L_6266                          ; 6219   0204 004B

L_621B:
        MVI     G_0172, R4                      ; 621B   0284 0172
        DECR    R4                              ; 621D   0014
        BNEQ    L_6228                          ; 621E   020C 0008

        JSR     R5,     .EXEC.7B3               ; 6220   0004 0114 03B3
        JSR     R5,     L_5125                  ; 6223   0004 0150 0125

        B       L_6255                          ; 6226   0200 002D

L_6228:
        MVI     G_031D, R3                      ; 6228   0283 031D
        SDBD                                    ; 622A   0001
        ANDI    #$0800, R3                      ; 622B   03BB 0000 0008
        BNEQ    L_620A                          ; 622E   022C 0025

        MVI     G_0325, R3                      ; 6230   0283 0325
        SDBD                                    ; 6232   0001
        ANDI    #$0800, R3                      ; 6233   03BB 0000 0008
        BNEQ    L_620A                          ; 6236   022C 002D

        MVI     G_0323, R3                      ; 6238   0283 0323
        TSTR    R3                              ; 623A   009B
        BNEQ    L_620A                          ; 623B   022C 0032

        MVI     G_032B, R3                      ; 623D   0283 032B
        TSTR    R3                              ; 623F   009B
        BNEQ    L_620A                          ; 6240   022C 0037

        JSR     R5,     .EXEC.7B3               ; 6242   0004 0114 03B3

        MVI     G_0164, R1                      ; 6245   0281 0164
        TSTR    R1                              ; 6247   0089
        BEQ     L_6252                          ; 6248   0204 0008

        JSR     R5,     L_5125                  ; 624A   0004 0150 0125

        MVI     G_0165, R2                      ; 624D   0282 0165
        TSTR    R2                              ; 624F   0092
        BEQ     L_6255                          ; 6250   0204 0003

L_6252:
        JSR     R5,     L_5147                  ; 6252   0004 0150 0147

L_6255:
        MVII    #$0023, R0                      ; 6255   02B8 0023
        MVO     R0,     G_0181                  ; 6257   0240 0181

        JSR     R5,     .EXEC.A62               ; 6259   0004 0118 0262

        CLRR    R0                              ; 625C   01C0
        MVO     R0,     G_0181                  ; 625D   0240 0181

        JSR     R5,     L_516B                  ; 625F   0004 0150 016B
        JSR     R5,     L_5F8A                  ; 6262   0004 015C 038A

        PULR    R7                              ; 6265   02B7

L_6266:
        JSR     R5,     .EXEC.7B3               ; 6266   0004 0114 03B3
        JSR     R5,     L_516B                  ; 6269   0004 0150 016B
        JSR     R5,     L_5F8A                  ; 626C   0004 015C 038A

        SDBD                                    ; 626F   0001
        MVII    #$1906, R0                      ; 6270   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6273   0240 035D
        MVII    #$026A, R4                      ; 6275   02BC 026A
        MVII    #$0007, R3                      ; 6277   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 6279   0004 0118 007B
        STRING  "GAME OVER"                     ; 627C  
        DECLE   $0000                           ; 6285   0000

        JSR     R5,     L_65F1                  ; 6286   0004 0164 01F1

        SDBD                                    ; 6289   0001
        MVII    #$5028, R1                      ; 628A   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 628D   0004 0118 0038

        MVII    #$0014, R0                      ; 6290   02B8 0014

        JSR     R5,     .EXEC.A62               ; 6292   0004 0118 0262

        SDBD                                    ; 6295   0001
        MVII    #$629C, R0                      ; 6296   02B8 009C 0062
        MVO     R0,     G_035D                  ; 6299   0240 035D
        PULR    R7                              ; 629B   02B7

        SLR     R2,     1                       ; 629C   0062
        RLC     R0,     1                       ; 629D   0050
        SLR     R2,     1                       ; 629E   0062
        RLC     R0,     1                       ; 629F   0050
        SLR     R2,     1                       ; 62A0   0062
        RLC     R0,     1                       ; 62A1   0050
        SLR     R2,     1                       ; 62A2   0062
        RLC     R0,     1                       ; 62A3   0050
        SLR     R2,     1                       ; 62A4   0062
        RLC     R0,     1                       ; 62A5   0050
        SLR     R0,     2                       ; 62A6   0064
        MOVR    R2,     R6                      ; 62A7   0096
        ADDR    R1,     R0                      ; 62A8   00C8
        ADDR    R7,     R2                      ; 62A9   00FA
        SUBR    R5,     R4                      ; 62AA   012C
        CMPR    R3,     R6                      ; 62AB   015E
        PSHR    R5                              ; 62AC   0275
        MVI@    R1,     R4                      ; 62AD   028C
        SDBD                                    ; 62AE   0001
        ANDI    #$0800, R4                      ; 62AF   03BC 0000 0008
        BEQ     L_620A                          ; 62B2   0224 00A9

        MOVR    R1,     R2                      ; 62B4   008A
        MOVR    R3,     R0                      ; 62B5   0098

        JSR     R5,     .EXEC.76C               ; 62B6   0004 0114 036C

        MVI@    R1,     R4                      ; 62B9   028C
        SDBD                                    ; 62BA   0001
        ANDI    #$0800, R4                      ; 62BB   03BC 0000 0008
        BEQ     L_620A                          ; 62BE   0224 00B5

        JSR     R5,     L_52CB                  ; 62C0   0004 0150 02CB

        TSTR    R0                              ; 62C3   0080
        BEQ     L_620A                          ; 62C4   0224 00BB
        BPL     L_62D0                          ; 62C6   0203 0008

        MOVR    R2,     R1                      ; 62C8   0091
        B       L_62D0                          ; 62C9   0200 0005

        PSHR    R5                              ; 62CB   0275
        MOVR    R3,     R0                      ; 62CC   0098

        JSR     R5,     .EXEC.76C               ; 62CD   0004 0114 036C

L_62D0:
        CLRR    R4                              ; 62D0   01E4
L_62D1:
        MVI@    R1,     R5                      ; 62D1   028D
        TSTR    R5                              ; 62D2   00AD
        BMI     L_620A                          ; 62D3   022B 00CA

        SDBD                                    ; 62D5   0001
        MVII    #$8000, R0                      ; 62D6   02B8 0000 0080
        MVO@    R0,     R1                      ; 62D9   0248
        MOVR    R1,     R2                      ; 62DA   008A
        INCR    R1                              ; 62DB   0009
        SDBD                                    ; 62DC   0001
        MVII    #$56B8, R0                      ; 62DD   02B8 00B8 0056
        MVO@    R0,     R1                      ; 62E0   0248
        ADDI    #$0004, R1                      ; 62E1   02F9 0004
        MVII    #$01F0, R0                      ; 62E3   02B8 01F0
        MVO@    R0,     R1                      ; 62E5   0248
        INCR    R1                              ; 62E6   0009
        SDBD                                    ; 62E7   0001
        MVII    #$9067, R0                      ; 62E8   02B8 0067 0090
        ANDI    #$0200, R5                      ; 62EB   03BD 0200
        XORR    R5,     R0                      ; 62ED   01E8
        MVO@    R0,     R2                      ; 62EE   0250
        MVII    #$0019, R0                      ; 62EF   02B8 0019
        MVO@    R0,     R1                      ; 62F1   0248
        TSTR    R4                              ; 62F2   00A4
        BNEQ    L_62F9                          ; 62F3   020C 0004

        JSR     R5,     L_65BE                  ; 62F5   0004 0164 01BE

        PULR    R7                              ; 62F8   02B7

L_62F9:
        JSR     R5,     L_6466                  ; 62F9   0004 0164 0066

        PULR    R7                              ; 62FC   02B7

        PSHR    R5                              ; 62FD   0275
        MVI@    R1,     R4                      ; 62FE   028C
        SDBD                                    ; 62FF   0001
        ANDI    #$0800, R4                      ; 6300   03BC 0000 0008
        BEQ     L_620A                          ; 6303   0224 00FA

        MOVR    R3,     R0                      ; 6305   0098

        JSR     R5,     .EXEC.76C               ; 6306   0004 0114 036C

        MVI@    R1,     R2                      ; 6309   028A
        SDBD                                    ; 630A   0001
        ANDI    #$0800, R2                      ; 630B   03BA 0000 0008
        BEQ     L_620A                          ; 630E   0224 0105

        MVO     R0,     G_0173                  ; 6310   0240 0173
        MVII    #$016A, R2                      ; 6312   02BA 016A
        ADDR    R0,     R2                      ; 6314   00C2
        SDBD                                    ; 6315   0001
        MVII    #$62A6, R3                      ; 6316   02BB 00A6 0062
        ADD@    R2,     R3                      ; 6319   02D3
        MVI@    R3,     R0                      ; 631A   0298
        PSHR    R2                              ; 631B   0272

        JSR     R5,     L_51C4                  ; 631C   0004 0150 01C4

        PULR    R2                              ; 631F   02B2
        MVII    #$016E, R3                      ; 6320   02BB 016E
        ADD     G_0173, R3                      ; 6322   02C3 0173
        MVI@    R3,     R0                      ; 6324   0298
        INCR    R0                              ; 6325   0008
        MVO@    R0,     R3                      ; 6326   0258
        ADD@    R2,     R0                      ; 6327   02D0
        CMPI    #$0008, R0                      ; 6328   0378 0008
        BGE     L_635A                          ; 632A   020D 002E

        SDBD                                    ; 632C   0001
        MVII    #$3860, R3                      ; 632D   02BB 0060 0038
        SDBD                                    ; 6330   0001
        XORI    #$8813, R3                      ; 6331   03FB 0013 0088
        MVI     G_0355, R1                      ; 6334   0281 0355
        ANDI    #$0200, R1                      ; 6336   03B9 0200
        XORR    R1,     R3                      ; 6338   01CB
        MVI     G_034D, R2                      ; 6339   0282 034D
        SDBD                                    ; 633B   0001
        ANDI    #$1000, R2                      ; 633C   03BA 0000 0010
        BEQ     L_6343                          ; 633F   0204 0002

        MVO     R3,     G_034D                  ; 6341   0243 034D
L_6343:
        MVO     R3,     G_0355                  ; 6343   0243 0355
        MVII    #$0008, R0                      ; 6345   02B8 0008
        SUB     G_0171, R0                      ; 6347   0300 0171
        MVI     G_0175, R1                      ; 6349   0281 0175
        TSTR    R1                              ; 634B   0089
        BEQ     L_6354                          ; 634C   0204 0006

        DECR    R0                              ; 634E   0010
        CMPI    #$000A, R1                      ; 634F   0379 000A
        BEQ     L_6354                          ; 6351   0204 0001

        DECR    R0                              ; 6353   0010
L_6354:
        MVO     R0,     G_035B                  ; 6354   0240 035B

        JSR     R5,     L_649F                  ; 6356   0004 0164 009F

        PULR    R7                              ; 6359   02B7

L_635A:
        CLRR    R0                              ; 635A   01C0
        MVO@    R0,     R3                      ; 635B   0258
        MVII    #$0164, R3                      ; 635C   02BB 0164
        ADD     G_0173, R3                      ; 635E   02C3 0173
        MVI@    R3,     R0                      ; 6360   0298
        CMPI    #$00FF, R0                      ; 6361   0378 00FF
        BEQ     L_636A                          ; 6363   0204 0005

        INCR    R0                              ; 6365   0008
        MVO@    R0,     R3                      ; 6366   0258

        JSR     R5,     L_52A1                  ; 6367   0004 0150 02A1

L_636A:
        SDBD                                    ; 636A   0001
        MVII    #$3860, R4                      ; 636B   02BC 0060 0038
        MVI     G_0355, R3                      ; 636E   0283 0355
        ANDI    #$0200, R3                      ; 6370   03BB 0200
        XORR    R3,     R4                      ; 6372   01DC
        SDBD                                    ; 6373   0001
        XORI    #$0813, R4                      ; 6374   03FC 0013 0008
        MVII    #$03F0, R3                      ; 6377   02BB 03F0
        MVII    #$0032, R2                      ; 6379   02BA 0032
        MVI     G_034D, R5                      ; 637B   0285 034D
        SDBD                                    ; 637D   0001
        ANDI    #$1000, R5                      ; 637E   03BD 0000 0010
        BNEQ    L_6387                          ; 6381   020C 0004

        MVO     R2,     G_0359                  ; 6383   0242 0359
        B       L_6393                          ; 6385   0200 000C

L_6387:
        MVO     R4,     G_034D                  ; 6387   0244 034D
        MVO     R3,     G_0352                  ; 6389   0243 0352
        MVO     R2,     G_0351                  ; 638B   0242 0351
        SDBD                                    ; 638D   0001
        MVII    #$5681, R0                      ; 638E   02B8 0081 0056
        MVO     R0,     G_034E                  ; 6391   0240 034E
L_6393:
        MVO     R4,     G_0355                  ; 6393   0244 0355
        SDBD                                    ; 6395   0001
        MVII    #$5688, R0                      ; 6396   02B8 0088 0056
        MVO     R0,     G_0356                  ; 6399   0240 0356
        MVO     R3,     G_035A                  ; 639B   0243 035A

        JSR     R5,     L_6527                  ; 639D   0004 0164 0127

        PULR    R7                              ; 63A0   02B7

        PSHR    R5                              ; 63A1   0275
        CLRR    R3                              ; 63A2   01DB
        MVO     R3,     G_0170                  ; 63A3   0243 0170
        MVII    #$0007, R0                      ; 63A5   02B8 0007

        JSR     R5,     .EXEC.6CF               ; 63A7   0004 0114 02CF

        J       L_5CAA                          ; 63AA   0004 035C 00AA

        PSHR    R5                              ; 63AD   0275

        JSR     R5,     L_63D3                  ; 63AE   0004 0160 03D3

        MOVR    R0,     R1                      ; 63B1   0081
        BMI     L_6415                          ; 63B2   020B 0061

        MVO@    R1,     R4                      ; 63B4   0261
        MVI@    R3,     R0                      ; 63B5   0298
        SDBD                                    ; 63B6   0001
        ADDI    #$001C, R0                      ; 63B7   02F8 001C 0000
        ADD     G_0175, R0                      ; 63BA   02C0 0175
        SLR     R0,     1                       ; 63BC   0060

        JSR     R5,     .EXEC.629               ; 63BD   0004 0114 0229

        MVI@    R2,     R1                      ; 63C0   0291
        SDBD                                    ; 63C1   0001
        ANDI    #$FDFF, R1                      ; 63C2   03B9 00FF 00FD
        TSTR    R0                              ; 63C5   0080
        BPL     L_63CA                          ; 63C6   0203 0002

        XORI    #$0200, R1                      ; 63C8   03F9 0200
L_63CA:
        MVO@    R1,     R2                      ; 63CA   0251
        ADDI    #$0004, R2                      ; 63CB   02FA 0004
        MVO@    R0,     R2                      ; 63CD   0250
        CLRR    R0                              ; 63CE   01C0
        ADDI    #$0002, R2                      ; 63CF   02FA 0002
        MVO@    R0,     R2                      ; 63D1   0250
L_63D2:
        PULR    R7                              ; 63D2   02B7

L_63D3:
        PSHR    R5                              ; 63D3   0275
        MVII    #$031D, R2                      ; 63D4   02BA 031D
        MVII    #$0166, R3                      ; 63D6   02BB 0166
        MVII    #$0168, R4                      ; 63D8   02BC 0168
        TSTR    R1                              ; 63DA   0089
        BEQ     L_63E1                          ; 63DB   0204 0004

        ADDI    #$0008, R2                      ; 63DD   02FA 0008
        INCR    R3                              ; 63DF   000B
        INCR    R4                              ; 63E0   000C
L_63E1:
        MVI@    R2,     R1                      ; 63E1   0291
        SDBD                                    ; 63E2   0001
        ANDI    #$0800, R1                      ; 63E3   03B9 0000 0008
        BNEQ    L_63E9                          ; 63E6   020C 0001

        PULR    R5                              ; 63E8   02B5
L_63E9:
        PULR    R7                              ; 63E9   02B7

        PSHR    R5                              ; 63EA   0275
        CMPI    #$0001, R0                      ; 63EB   0378 0001
        BNEQ    L_63D2                          ; 63ED   022C 001C

        MVII    #$031D, R2                      ; 63EF   02BA 031D
        TSTR    R1                              ; 63F1   0089
        BEQ     L_63F6                          ; 63F2   0204 0002

        MVII    #$0325, R2                      ; 63F4   02BA 0325
L_63F6:
        MVI@    R2,     R4                      ; 63F6   0294
        SDBD                                    ; 63F7   0001
        ANDI    #$0800, R4                      ; 63F8   03BC 0000 0008
        BEQ     L_63D2                          ; 63FB   0224 002A

        CLRR    R0                              ; 63FD   01C0
        ADDI    #$0004, R2                      ; 63FE   02FA 0004
        MVO@    R0,     R2                      ; 6400   0250
        ADDI    #$0002, R2                      ; 6401   02FA 0002
        MVO@    R0,     R2                      ; 6403   0250
        PULR    R7                              ; 6404   02B7

        PSHR    R5                              ; 6405   0275

        JSR     R5,     L_63D3                  ; 6406   0004 0160 03D3

        MOVR    R2,     R5                      ; 6409   0095
        ADDI    #$0006, R5                      ; 640A   02FD 0006
        MVII    #$000A, R0                      ; 640C   02B8 000A
        ADD     G_0171, R0                      ; 640E   02C0 0171
        MVO@    R0,     R5                      ; 6410   0268
        MVII    #$0078, R0                      ; 6411   02B8 0078
        B       L_6418                          ; 6413   0200 0003

L_6415:
        MVI@    R3,     R0                      ; 6415   0298
        ADD     G_0175, R0                      ; 6416   02C0 0175
L_6418:
        MVI@    R4,     R1                      ; 6418   02A1
        SLR     R0,     1                       ; 6419   0060

        JSR     R5,     .EXEC.629               ; 641A   0004 0114 0229

        ADDI    #$0004, R2                      ; 641D   02FA 0004
        MVO@    R0,     R2                      ; 641F   0250
        PULR    R7                              ; 6420   02B7

        PSHR    R5                              ; 6421   0275
        MOVR    R1,     R2                      ; 6422   008A
        MVII    #$0166, R3                      ; 6423   02BB 0166
        MVII    #$0168, R4                      ; 6425   02BC 0168
        ADDR    R0,     R3                      ; 6427   00C3
        ADDR    R0,     R4                      ; 6428   00C4
        B       L_6415                          ; 6429   0220 0015

L_642B:
        PSHR    R5                              ; 642B   0275
        MVII    #$0003, R0                      ; 642C   02B8 0003
        MVO     R0,     G_0180                  ; 642E   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 6430   0004 0118 03BE
        DECLE   $0007                           ; 6433  SFX prio
        DECLE   $03E9                           ; 6434  SFX data
        DECLE   $0340,  $00C8                   ; 6435  SFX data
        DECLE   $0001,  $039C                   ; 6437  SFX data
        DECLE   $026B                           ; 6439  SFX data
        DECLE   $02CF                           ; 643A  SFX end

L_643B:
        PSHR    R5                              ; 643B   0275
        MVII    #$0003, R0                      ; 643C   02B8 0003
        MVO     R0,     G_0180                  ; 643E   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 6440   0004 0118 03BE
        DECLE   $0014                           ; 6443  SFX prio
        DECLE   $019D                           ; 6444  SFX data
        DECLE   $014F,  $000A                   ; 6445  SFX data
        DECLE   $03BD                           ; 6447  SFX data
        DECLE   $002F                           ; 6448  SFX data
        DECLE   $03E9                           ; 6449  SFX data
        DECLE   $0380,  $0046                   ; 644A  SFX data
        DECLE   $0021,  $03F4                   ; 644C  SFX data
        DECLE   $009B                           ; 644E  SFX data
        DECLE   $00EB                           ; 644F  SFX data
        DECLE   $0005                           ; 6450  SFX data
        DECLE   $006B                           ; 6451  SFX data
        DECLE   $0003,  $03D8                   ; 6452  SFX data
        DECLE   $0080,  $0046                   ; 6454  SFX data
        DECLE   $009D                           ; 6456  SFX data
        DECLE   $0077,  $005D,  $0064           ; 6457  SFX data
        DECLE   $0003,  $03C1                   ; 645A  SFX data
        DECLE   $02CF                           ; 645C  SFX end

UC_645D:
        MVII    #$01FB, R1                      ; 645D  SLIB UCALL target
        MVI     G_015A, R2                      ; 645F   0282 015A
        DECR    R2                              ; 6461   0012
        MVO     R2,     G_015A                  ; 6462   0242 015A
        MVO@    R2,     R1                      ; 6464   024A
        PULR    R7                              ; 6465   02B7

L_6466:
        PSHR    R5                              ; 6466   0275
        MVII    #$0003, R0                      ; 6467   02B8 0003
        MVO     R0,     G_0180                  ; 6469   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 646B   0004 0118 03BE
        DECLE   $0012                           ; 646E  SFX prio

        XOR@    R5,     R1                      ; 646F   03E9
        CMP     G_0069, R0                      ; 6470   0340 0069
        RRC     R3,     2                       ; 6472   0077
        MOVR    R3,     R1                      ; 6473   0099
        SLR     R0,     2                       ; 6474   0064
        CMP     G_005F, R0                      ; 6475   0340 005F
        RRC     R3,     2                       ; 6477   0077
        MOVR    R3,     R1                      ; 6478   0099
        SLR     R0,     2                       ; 6479   0064
        CMP     G_0056, R0                      ; 647A   0340 0056
        RRC     R3,     2                       ; 647C   0077
        MOVR    R3,     R1                      ; 647D   0099
        SLR     R0,     2                       ; 647E   0064
        CMP     G_004E, R0                      ; 647F   0340 004E
        RRC     R3,     2                       ; 6481   0077
        MOVR    R3,     R1                      ; 6482   0099
        SLR     R0,     2                       ; 6483   0064
        CMP     G_0046, R0                      ; 6484   0340 0046
        RRC     R3,     2                       ; 6486   0077
        MOVR    R3,     R1                      ; 6487   0099
        SLR     R0,     2                       ; 6488   0064
        CMP     G_0040, R0                      ; 6489   0340 0040
        RRC     R3,     2                       ; 648B   0077
        MOVR    R3,     R1                      ; 648C   0099
        SLR     R0,     2                       ; 648D   0064
        CMP     G_0046, R0                      ; 648E   0340 0046
        RRC     R3,     2                       ; 6490   0077
        MOVR    R3,     R1                      ; 6491   0099
        SLR     R0,     2                       ; 6492   0064
        CMP     G_004E, R0                      ; 6493   0340 004E
        RRC     R3,     2                       ; 6495   0077
        MOVR    R3,     R1                      ; 6496   0099
        SLR     R0,     2                       ; 6497   0064
        ADD@    R1,     R7                      ; 6498   02CF

        MVII    #$00C8, R0                      ; 6499   02B8 00C8
L_649B:
        DECR    R0                              ; 649B   0010
        BNEQ    L_649B                          ; 649C   022C 0002
        PULR    R7                              ; 649E   02B7

L_649F:
        PSHR    R5                              ; 649F   0275
        MVII    #$0003, R0                      ; 64A0   02B8 0003
        MVO     R0,     G_0180                  ; 64A2   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 64A4   0004 0118 03BE
        DECLE   $0013                           ; 64A7  SFX prio

        XOR@    R5,     R1                      ; 64A8   03E9
        CMP     G_00D3, R0                      ; 64A9   0340 00D3
        RRC     R3,     2                       ; 64AB   0077
        MOVR    R3,     R1                      ; 64AC   0099
        SLR     R0,     2                       ; 64AD   0064
        CMP     G_00BE, R0                      ; 64AE   0340 00BE
        RRC     R3,     2                       ; 64B0   0077
        MOVR    R3,     R1                      ; 64B1   0099
        SLR     R0,     2                       ; 64B2   0064
        CMP     G_00AC, R0                      ; 64B3   0340 00AC
        RRC     R3,     2                       ; 64B5   0077
        MOVR    R3,     R1                      ; 64B6   0099
        SLR     R0,     2                       ; 64B7   0064
        CMP     G_009C, R0                      ; 64B8   0340 009C
        RRC     R3,     2                       ; 64BA   0077
        MOVR    R3,     R1                      ; 64BB   0099
        SLR     R0,     2                       ; 64BC   0064
        CMP     G_008D, R0                      ; 64BD   0340 008D
        RRC     R3,     2                       ; 64BF   0077
        MOVR    R3,     R1                      ; 64C0   0099
        SLR     R0,     2                       ; 64C1   0064
        CMP     .IV.ALD,R0                      ; 64C2   0340 0080
        RRC     R3,     2                       ; 64C4   0077
        MOVR    R3,     R1                      ; 64C5   0099
        SLR     R0,     2                       ; 64C6   0064
        CMP     G_008D, R0                      ; 64C7   0340 008D
        RRC     R3,     2                       ; 64C9   0077
        MOVR    R3,     R1                      ; 64CA   0099
        SLR     R0,     2                       ; 64CB   0064
        CMP     G_009C, R0                      ; 64CC   0340 009C
        RRC     R3,     2                       ; 64CE   0077
        MOVR    R3,     R1                      ; 64CF   0099
        SLR     R0,     2                       ; 64D0   0064
        ADD@    R1,     R7                      ; 64D1   02CF

L_64D2:
        PSHR    R5                              ; 64D2   0275
        MVII    #$0003, R0                      ; 64D3   02B8 0003
        MVO     R0,     G_0180                  ; 64D5   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 64D7   0004 0118 03BE
        DECLE   $000A                           ; 64DA  SFX prio

        AND@    R3,     R5                      ; 64DB   039D
        CMPR    R1,     R7                      ; 64DC   014F
        INCR    R2                              ; 64DD   000A
        MVO@    R7,     R1                      ; 64DE   024F
        INCR    R0                              ; 64DF   0008
        ADCR    R7                              ; 64E0   002F

        XOR@    R5,     R1                      ; 64E1   03E9
L_64E2:
        SUB     G_0190, R0                      ; 64E2   0300 0190
        RLC     R1,     1                       ; 64E4   0051
        CMP@    R1,     R4                      ; 64E5   034C
        ANDR    R3,     R3                      ; 64E6   019B
        SARC    R3,     1                       ; 64E7   007B
L_64E8:
        DECR    R7                              ; 64E8   0017

        DECLE   $001D,  $0005                   ; 64E9   001D 0005
L_64EB:
        DECR    R7                              ; 64EB   0017

        INCR    R6                              ; 64EC   000E
        DIS                                     ; 64ED   0003
        XOR@    R1,     R4                      ; 64EE   03CC
        TSTR    R0                              ; 64EF   0080
        ANDR    R2,     R0                      ; 64F0   0190
        MOVR    R3,     R5                      ; 64F1   009D
        RRC     R3,     2                       ; 64F2   0077
        ADDR    R7,     R0                      ; 64F3   00F8
        SLR     R0,     2                       ; 64F4   0064
        DIS                                     ; 64F5   0003
        AND@    R6,     R5                      ; 64F6   03B5
        ADD@    R1,     R7                      ; 64F7   02CF

        MVII    #$01FB, R1                      ; 64F8   02B9 01FB
        MVI     G_015A, R2                      ; 64FA   0282 015A
        DECR    R2                              ; 64FC   0012
        MVO     R2,     G_015A                  ; 64FD   0242 015A
        MVO@    R2,     R1                      ; 64FF   024A
        PULR    R7                              ; 6500   02B7

L_6501:
        PSHR    R5                              ; 6501   0275
        MVII    #$0003, R0                      ; 6502   02B8 0003
        MVO     R0,     G_0180                  ; 6504   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 6506   0004 0118 03BE
        DECLE   $0012                           ; 6509  SFX prio

        SUBR    R5,     R7                      ; 650A   012F

        DECLE   $0389,  $0035,  $01A0,  $03B8   ; 650B   0389 0035 01A0 03B8
        DECLE   $0022,  $01A8,  $03B8,  $002A   ; 650F   0022 01A8 03B8 002A
        DECLE   $0001                           ; 6513   0001

        XORI    #$01A4, R3                      ; 6514   03FB 01A4
        ANDI    #$0026, R0                      ; 6516   03B8 0026
        MOVR    R1,     R7                      ; 6518   008F

        DECLE   $0025,  $000E,  $0375,  $00AB   ; 6519   0025 000E 0375 00AB
        DECLE   $0001,  $0363,  $03FE,  $01EB   ; 651D   0001 0363 03FE 01EB
        DECLE   $03EE,  $0001                   ; 6521   03EE 0001

        DIS                                     ; 6523   0003
        MOVR    R1,     R7                      ; 6524   008F

        NEGR    R2                              ; 6525   0022
        ADD@    R1,     R7                      ; 6526   02CF

L_6527:
        PSHR    R5                              ; 6527   0275
        MVII    #$0003, R0                      ; 6528   02B8 0003
        MVO     R0,     G_0180                  ; 652A   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 652C   0004 0118 03BE
        DECLE   $0020                           ; 652F  SFX prio

        ADCR    R7                              ; 6530   002F

        MVI@    R3,     R5                      ; 6531   029D
L_6532:
        SLLC    R1,     2                       ; 6532   005D
        DECLE   $023D,  $02E9,  $0035           ; 6533   023D 02E9 0035

        CMP     .PSG0.chn_a_hi,R0               ; 6536   0340 01F4
        ADCR    R5                              ; 6538   002D
        SUB@    R4,     R5                      ; 6539   0325
        INCR    R7                              ; 653A   000F

        DECLE   $0001                           ; 653B   0001
L_653C:
        ADCR    R3                              ; 653C   002B
        DECLE   $03FA,  $03E2,  $0001,  $0310   ; 653D   03FA 03E2 0001 0310
        DECLE   $03EB,  $0005,  $00AB,  $0300   ; 6541   03EB 0005 00AB 0300
        DECLE   $01F4,  $0077,  $0058,  $0065   ; 6545   01F4 0077 0058 0065
        DECLE   $0003,  $03D0,  $0025,  $009D   ; 6549   0003 03D0 0025 009D
        DECLE   $0003,  $03C1,  $002B,  $0360   ; 654D   0003 03C1 002B 0360
        DECLE   $01C4,  $0001                   ; 6551   01C4 0001

        RLC     R0,     1                       ; 6553   0050
        XOR@    R6,     R2                      ; 6554   03F2
        MOVR    R1,     R7                      ; 6555   008F

        SLL     R3,     2                       ; 6556   004F
        ADD@    R1,     R7                      ; 6557   02CF

        MVII    #$01F4, R1                      ; 6558   02B9 01F4
        MVI     G_015A, R2                      ; 655A   0282 015A
        ADDI    #$0001, R2                      ; 655C   02FA 0001
        MVO     R2,     G_015A                  ; 655E   0242 015A
        MVI@    R1,     R3                      ; 6560   028B
        ADDR    R2,     R3                      ; 6561   00D3
        MVO@    R3,     R1                      ; 6562   024B
        PULR    R7                              ; 6563   02B7

L_6564:
        PSHR    R5                              ; 6564   0275
        MVII    #$0003, R0                      ; 6565   02B8 0003
        MVO     R0,     G_0180                  ; 6567   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 6569   0004 0118 03BE
        DECLE   $0012                           ; 656C  SFX prio
        DECLE   $002F                           ; 656D   002F

        CMPI    #$00C5, R1                      ; 656E   0379 00C5
        ADCR    R5                              ; 6570   002D
        INCR    R7                              ; 6571   000F

        DIS                                     ; 6572   0003
L_6573:
        NEGR    R2                              ; 6573   0022
        MOVR    R1,     R7                      ; 6574   008F

        DECLE   $0027,  $0345,  $000F,  $03FF   ; 6575   0027 0345 000F 03FF

        MVO@    R3,     R5                      ; 6579   026B
        XOR@    R6,     R2                      ; 657A   03F2
        MOVR    R1,     R7                      ; 657B   008F

        SLLC    R1,     1                       ; 657C   0059
        ADD@    R1,     R7                      ; 657D   02CF

L_657E:
        PSHR    R5                              ; 657E   0275
        MVII    #$0003, R0                      ; 657F   02B8 0003
        MVO     R0,     G_0180                  ; 6581   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 6583   0004 0118 03BE
        DECLE   $0020                           ; 6586  SFX prio

        ADCR    R7                              ; 6587   002F

        SLL     R3,     2                       ; 6588   004F
L_6589:
        INCR    R0                              ; 6589   0008
        CMPR    R1,     R7                      ; 658A   014F
        INCR    R6                              ; 658B   000E
        AND@    R1,     R1                      ; 658C   0389
        CMP     G_002D, R0                      ; 658D   0340 002D
        CMP@    R1,     R0                      ; 658F   0348
        SAR     R1,     1                       ; 6590   0069
        CMP     G_00AD, R4                      ; 6591   0344 00AD
        NEGR    R1                              ; 6593   0021
        XOR@    R3,     R3                      ; 6594   03DB
        RRC     R3,     2                       ; 6595   0077
        TSTR    R3                              ; 6596   009B
        SLR     R1,     2                       ; 6597   0065
        CMPR    R0,     R3                      ; 6598   0143
        XOR@    R1,     R4                      ; 6599   03CC
        ADD@    R1,     R7                      ; 659A   02CF

        MVI     G_015A, R1                      ; 659B   0281 015A
        MVII    #$01FB, R5                      ; 659D   02BD 01FB
        DECR    R1                              ; 659F   0011
        MVO     R1,     G_015A                  ; 65A0   0241 015A
        MVO@    R1,     R5                      ; 65A2   0269
        MVO@    R1,     R5                      ; 65A3   0269
        MVO@    R1,     R5                      ; 65A4   0269
        PULR    R7                              ; 65A5   02B7

L_65A6:
        PSHR    R5                              ; 65A6   0275
        MVII    #$0003, R0                      ; 65A7   02B8 0003
        MVO     R0,     G_0180                  ; 65A9   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 65AB   0004 0118 03BE
        DECLE   $0020                           ; 65AE  SFX prio

        ADCR    R7                              ; 65AF   002F

        XOR@    R5,     R1                      ; 65B0   03E9
L_65B1:
        AND     .PSG1.envelope,R0               ; 65B1   0380 00FA
        DECLE   $0001,  $0388,  $03AB,  $03C0   ; 65B3   0001 0388 03AB 03C0
        DECLE   $0096,  $0001                   ; 65B7   0096 0001

        XORR    R4,     R0                      ; 65B9   01E0
        XOR@    R4,     R2                      ; 65BA   03E2
        MOVR    R1,     R7                      ; 65BB   008F

        NEGR    R2                              ; 65BC   0022
        ADD@    R1,     R7                      ; 65BD   02CF

L_65BE:
        PSHR    R5                              ; 65BE   0275
        MVII    #$0003, R0                      ; 65BF   02B8 0003
        MVO     R0,     G_0180                  ; 65C1   0240 0180

        JSR     R5,     X_PLAY_SFX2             ; 65C3   0004 0118 03BE
        DECLE   $0010                           ; 65C6  SFX prio

        XOR@    R5,     R1                      ; 65C7   03E9
        CMP     G_0069, R0                      ; 65C8   0340 0069
        RRC     R3,     2                       ; 65CA   0077
        MOVR    R3,     R1                      ; 65CB   0099
        SLR     R0,     2                       ; 65CC   0064
        CMP     G_005F, R0                      ; 65CD   0340 005F
        RRC     R3,     2                       ; 65CF   0077
        MOVR    R3,     R1                      ; 65D0   0099
        SLR     R0,     2                       ; 65D1   0064
        CMP     G_0056, R0                      ; 65D2   0340 0056
        RRC     R3,     2                       ; 65D4   0077
        MOVR    R3,     R1                      ; 65D5   0099
        SLR     R0,     2                       ; 65D6   0064
        CMP     G_004E, R0                      ; 65D7   0340 004E
        RRC     R3,     2                       ; 65D9   0077
        MOVR    R3,     R1                      ; 65DA   0099
        SLR     R0,     2                       ; 65DB   0064
        CMP     G_0046, R0                      ; 65DC   0340 0046
        RRC     R3,     2                       ; 65DE   0077
        MOVR    R3,     R1                      ; 65DF   0099
        SLR     R0,     2                       ; 65E0   0064
        CMP     G_0040, R0                      ; 65E1   0340 0040
        RRC     R3,     2                       ; 65E3   0077
        MOVR    R3,     R1                      ; 65E4   0099
        SLR     R0,     2                       ; 65E5   0064
        CMP     G_0046, R0                      ; 65E6   0340 0046
        RRC     R3,     2                       ; 65E8   0077
        MOVR    R3,     R1                      ; 65E9   0099
        SLR     R0,     2                       ; 65EA   0064
        CMP     G_004E, R0                      ; 65EB   0340 004E
        RRC     R3,     2                       ; 65ED   0077
        MOVR    R3,     R1                      ; 65EE   0099
        SLR     R0,     2                       ; 65EF   0064
        ADD@    R1,     R7                      ; 65F0   02CF

L_65F1:
        PSHR    R5                              ; 65F1   0275

        JSR     R5,     X_PLAY_SFX2             ; 65F2   0004 0118 03BE
        DECLE   $0020                           ; 65F5  SFX prio

        SUBR    R5,     R7                      ; 65F6   012F

        DECLE   $011D,  $0389,  $0240,  $00D7   ; 65F7   011D 0389 0240 00D7
        DECLE   $0308,  $011D,  $0354,  $02AE   ; 65FB   0308 011D 0354 02AE
        DECLE   $0142,  $01EB,  $0015,  $006B   ; 65FF   0142 01EB 0015 006B
        DECLE   $0344,  $0357,  $00AB,  $0005   ; 6603   0344 0357 00AB 0005
        DECLE   $006B,  $0240,  $00BE,  $0142   ; 6607   006B 0240 00BE 0142
        DECLE   $00AB,  $0005,  $0015,  $006B   ; 660B   00AB 0005 0015 006B
        DECLE   $0240,  $00AA,  $0354,  $02AE   ; 660F   0240 00AA 0354 02AE
        DECLE   $0142,  $01EB,  $0005,  $0015   ; 6613   0142 01EB 0005 0015
        DECLE   $006B,  $0240,  $00D7,  $0344   ; 6617   006B 0240 00D7 0344
        DECLE   $0357,  $0142,  $01EB,  $0035   ; 661B   0357 0142 01EB 0035
        DECLE   $006B,  $0240,  $011D,  $0308   ; 661F   006B 0240 011D 0308
        DECLE   $00E2,  $0354,  $02AE,  $0142   ; 6623   00E2 0354 02AE 0142
        DECLE   $01EB,  $0005,  $0015,  $006B   ; 6627   01EB 0005 0015 006B
        DECLE   $0300,  $023B,  $0344,  $0357   ; 662B   0300 023B 0344 0357
        DECLE   $0142,  $00AB,  $0005,  $006B   ; 662F   0142 00AB 0005 006B
        DECLE   $0300,  $021B,  $0142,  $00AB   ; 6633   0300 021B 0142 00AB
        DECLE   $0005,  $0015,  $006B,  $0300   ; 6637   0005 0015 006B 0300
        DECLE   $01FC,  $0354,  $02AE,  $0142   ; 663B   01FC 0354 02AE 0142
        DECLE   $00AB,  $0005,  $006B,  $0300   ; 663F   00AB 0005 006B 0300
        DECLE   $021B,  $0142,  $00AB,  $0005   ; 6643   021B 0142 00AB 0005
        DECLE   $0015,  $006B,  $0300,  $023B   ; 6647   0015 006B 0300 023B
        DECLE   $0344,  $0357,  $0142,  $01EB   ; 664B   0344 0357 0142 01EB
        DECLE   $0035,  $006B,  $0340,  $00BE   ; 664F   0035 006B 0340 00BE
        DECLE   $0308,  $00FE,  $0354,  $01F4   ; 6653   0308 00FE 0354 01F4
        DECLE   $0142,  $01EB,  $0015,  $006B   ; 6657   0142 01EB 0015 006B
        DECLE   $0344,  $02FA,  $00AB,  $0005   ; 665B   0344 02FA 00AB 0005
        DECLE   $006B,  $0340,  $00AA,  $0142   ; 665F   006B 0340 00AA 0142
        DECLE   $00AB,  $0005,  $0015,  $006B   ; 6663   00AB 0005 0015 006B
        DECLE   $0340,  $00A0,  $0354,  $01F4   ; 6667   0340 00A0 0354 01F4
        DECLE   $0142,  $01EB,  $0005,  $0015   ; 666B   0142 01EB 0005 0015
        DECLE   $006B,  $0340,  $00BE,  $0344   ; 666F   006B 0340 00BE 0344
        DECLE   $02FA,  $0142,  $01EB,  $0035   ; 6673   02FA 0142 01EB 0035
        DECLE   $006B,  $0340,  $011D,  $0308   ; 6677   006B 0340 011D 0308
        DECLE   $00E2,  $0364,  $00EB,  $0142   ; 667B   00E2 0364 00EB 0142
        DECLE   $01EB,  $0005,  $0015,  $006B   ; 667F   01EB 0005 0015 006B
        DECLE   $0300,  $023B,  $0354,  $0075   ; 6683   0300 023B 0354 0075
        DECLE   $0142,  $00AB,  $0005,  $006B   ; 6687   0142 00AB 0005 006B
        DECLE   $0300,  $021B,  $0142,  $00AB   ; 668B   0300 021B 0142 00AB
        DECLE   $0005,  $0015,  $006B,  $0300   ; 668F   0005 0015 006B 0300
        DECLE   $01FC,  $0364,  $00EB,  $0142   ; 6693   01FC 0364 00EB 0142
        DECLE   $00AB,  $0005,  $006B,  $0300   ; 6697   00AB 0005 006B 0300
        DECLE   $021B,  $0142,  $00AB,  $0005   ; 669B   021B 0142 00AB 0005
        DECLE   $0015,  $006B,  $0300,  $023B   ; 669F   0015 006B 0300 023B
        DECLE   $0354,  $0075,  $0142,  $01EB   ; 66A3   0354 0075 0142 01EB
        DECLE   $0035,  $006B,  $0340,  $00AA   ; 66A7   0035 006B 0340 00AA
        DECLE   $0308,  $00FE,  $0354,  $0101   ; 66AB   0308 00FE 0354 0101
        DECLE   $0142,  $01EB,  $0015,  $006B   ; 66AF   0142 01EB 0015 006B
        DECLE   $0344,  $0281,  $00AB,  $0005   ; 66B3   0344 0281 00AB 0005
        DECLE   $006B,  $0340,  $00A0,  $0142   ; 66B7   006B 0340 00A0 0142
        DECLE   $00AB,  $0005,  $0015,  $006B   ; 66BB   00AB 0005 0015 006B
        DECLE   $0340,  $008F,  $0354,  $0101   ; 66BF   0340 008F 0354 0101
        DECLE   $0142,  $01EB,  $0005,  $0015   ; 66C3   0142 01EB 0005 0015
        DECLE   $006B,  $0340,  $00AA,  $0344   ; 66C7   006B 0340 00AA 0344
        DECLE   $0281,  $0142,  $01EB,  $0035   ; 66CB   0281 0142 01EB 0035
        DECLE   $006B,  $0340,  $00D7,  $0308   ; 66CF   006B 0340 00D7 0308
        DECLE   $011D,  $0354,  $014D,  $0142   ; 66D3   011D 0354 014D 0142
        DECLE   $01EB,  $0015,  $006B,  $0344   ; 66D7   01EB 0015 006B 0344
        DECLE   $02A7,  $01EB,  $0025,  $0015   ; 66DB   02A7 01EB 0025 0015
        DECLE   $006B,  $0348,  $011D,  $0354   ; 66DF   006B 0348 011D 0354
        DECLE   $014D,  $0041,  $03B2,  $002A   ; 66E3   014D 0041 03B2 002A
        DECLE   $01EB,  $0015,  $006B,  $0344   ; 66E7   01EB 0015 006B 0344
        DECLE   $02A7,  $01EB,  $0005,  $0015   ; 66EB   02A7 01EB 0005 0015
        DECLE   $006B,  $0077,  $00EE,  $0067   ; 66EF   006B 0077 00EE 0067
        DECLE   $0340,  $00BE,  $0308,  $0140   ; 66F3   0340 00BE 0308 0140
        DECLE   $0344,  $01E0,  $0142,  $00AB   ; 66F7   0344 01E0 0142 00AB
        DECLE   $0005,  $006B,  $0340,  $00AA   ; 66FB   0005 006B 0340 00AA
        DECLE   $0142,  $00AB,  $0005,  $006B   ; 66FF   0142 00AB 0005 006B
        DECLE   $0340,  $00A0,  $0142,  $01EB   ; 6703   0340 00A0 0142 01EB
        DECLE   $0035                           ; 6707   0035

        SAR     R3,     1                       ; 6708   006B
        CMP     G_00A0, R0                      ; 6709   0340 00A0
        SUB@    R1,     R0                      ; 670B   0308
        ADDR    R2,     R7                      ; 670C   00D7

        DECLE   $0344,  $01FC,  $0142,  $01EB   ; 670D   0344 01FC 0142 01EB
        DECLE   $0035,  $006B,  $0000,  $0000   ; 6711   0035 006B 0000 0000
        DECLE   $0008,  $0000,  $0004,  $0000   ; 6715   0008 0000 0004 0000
        DECLE   $01EB,  $0035                   ; 6719   01EB 0035

        SAR     R3,     1                       ; 671B   006B
        CMP     G_00AA, R0                      ; 671C   0340 00AA
        SUB@    R1,     R0                      ; 671E   0308
        ADDR    R2,     R7                      ; 671F   00D7

        DECLE   $0344,  $023B,  $0142,  $01EB   ; 6720   0344 023B 0142 01EB
        DECLE   $0035                           ; 6724   0035

        SAR     R3,     1                       ; 6725   006B
        CMP     G_00A0, R0                      ; 6726   0340 00A0
        SUB@    R1,     R0                      ; 6728   0308
        ADDR    R2,     R7                      ; 6729   00D7

        DECLE   $0344,  $01FC,  $0142,  $01EB   ; 672A   0344 01FC 0142 01EB
        DECLE   $0035,  $006B,  $0340,  $008F   ; 672E   0035 006B 0340 008F
        DECLE   $0308,  $00BE,  $0344,  $01C5   ; 6732   0308 00BE 0344 01C5
        DECLE   $0142,  $01EB,  $0015,  $006B   ; 6736   0142 01EB 0015 006B
        DECLE   $0364,  $00EB,  $01EB,  $0035   ; 673A   0364 00EB 01EB 0035
        DECLE   $006B,  $0340,  $0078,  $0308   ; 673E   006B 0340 0078 0308
        DECLE   $01AC,  $0354,  $02AE,  $0142   ; 6742   01AC 0354 02AE 0142
        DECLE   $00AB,  $0005,  $006B,  $0340   ; 6746   00AB 0005 006B 0340
        DECLE   $007F,  $0142,  $00AB,  $0005   ; 674A   007F 0142 00AB 0005
        DECLE   $006B,  $0340,  $008F,  $0142   ; 674E   006B 0340 008F 0142
        DECLE   $00AB,  $0005,  $006B,  $0340   ; 6752   00AB 0005 006B 0340
        DECLE   $00A0,  $0142,  $00AB,  $0005   ; 6756   00A0 0142 00AB 0005
        DECLE   $0025,  $006B,  $0340,  $006B   ; 675A   0025 006B 0340 006B
        DECLE   $0308,  $0153,  $0142,  $00AB   ; 675E   0308 0153 0142 00AB
        DECLE   $0005,  $006B,  $0340,  $008F   ; 6762   0005 006B 0340 008F
        DECLE   $0142,  $00AB,  $0005,  $006B   ; 6766   0142 00AB 0005 006B
        DECLE   $0340,  $00D7,  $0142,  $01EB   ; 676A   0340 00D7 0142 01EB
        DECLE   $0035                           ; 676E   0035

        SAR     R3,     1                       ; 676F   006B
        CMP     G_00A0, R0                      ; 6770   0340 00A0
        SUB@    R1,     R0                      ; 6772   0308
        ADDR    R7,     R6                      ; 6773   00FE
        CMP@    R2,     R4                      ; 6774   0354
        SUBR    R0,     R1                      ; 6775   0101
        CMPR    R0,     R2                      ; 6776   0142
        XORR    R5,     R3                      ; 6777   01EB
        NEGR    R5                              ; 6778   0025
        SAR     R3,     1                       ; 6779   006B
        SUB@    R1,     R0                      ; 677A   0308
        ADDR    R2,     R7                      ; 677B   00D7

        DECLE   $01EB,  $0035,  $006B,  $0380   ; 677C   01EB 0035 006B 0380
        DECLE   $0050,  $0348,  $0140,  $0344   ; 6780   0050 0348 0140 0344
        DECLE   $0281,  $0142,  $01EB,  $0035   ; 6784   0281 0142 01EB 0035
        DECLE   $006B,  $0000,  $0000,  $0008   ; 6788   006B 0000 0000 0008
        DECLE   $0000,  $0004,  $0000,  $01EB   ; 678C   0000 0004 0000 01EB
        DECLE   $0035,  $006B,  $03F9,  $02CF   ; 6790   0035 006B 03F9 02CF
        DECLE   $0340,  $00BE,  $0308,  $0140   ; 6794   0340 00BE 0308 0140
        DECLE   $0344,  $01E0,  $00AB,  $0005   ; 6798   0344 01E0 00AB 0005
        DECLE   $006B,  $0340,  $00AA,  $0142   ; 679C   006B 0340 00AA 0142
        DECLE   $00AB,  $0005,  $006B,  $0340   ; 67A0   00AB 0005 006B 0340
        DECLE   $00A0,  $0142,  $01EB,  $0035   ; 67A4   00A0 0142 01EB 0035

        SAR     R3,     1                       ; 67A8   006B
        CMP     G_00A0, R0                      ; 67A9   0340 00A0
        SUB@    R1,     R0                      ; 67AB   0308
        ADDR    R2,     R7                      ; 67AC   00D7

        DECLE   $0344,  $01FC,  $0142,  $01EB   ; 67AD   0344 01FC 0142 01EB
        DECLE   $0005,  $006B,  $0000,  $0000   ; 67B1   0005 006B 0000 0000
        DECLE   $01EB,  $0035,  $006B,  $0000   ; 67B5   01EB 0035 006B 0000
        DECLE   $0000                           ; 67B9   0000

        SUB@    R1,     R0                      ; 67BA   0308
        ADDR    R2,     R7                      ; 67BB   00D7

        DECLE   $0344,  $023B,  $01EB,  $0035   ; 67BC   0344 023B 01EB 0035
        DECLE   $006B,  $0142,  $0340,  $00A0   ; 67C0   006B 0142 0340 00A0
        DECLE   $0008,  $0000,  $0004,  $0000   ; 67C4   0008 0000 0004 0000
        DECLE   $0142,  $00AB,  $0005,  $006B   ; 67C8   0142 00AB 0005 006B
        DECLE   $0340,  $00AA,  $0142,  $00AB   ; 67CC   0340 00AA 0142 00AB
        DECLE   $0035                           ; 67D0   0035

        SAR     R3,     1                       ; 67D1   006B
        CMP     G_00A0, R0                      ; 67D2   0340 00A0
        SUB@    R1,     R0                      ; 67D4   0308
        ADDR    R2,     R7                      ; 67D5   00D7

        DECLE   $0344,  $023B,  $0142,  $01EB   ; 67D6   0344 023B 0142 01EB
        DECLE   $0035,  $006B,  $0340,  $008F   ; 67DA   0035 006B 0340 008F
        DECLE   $0308,  $00E2,  $0344,  $023B   ; 67DE   0308 00E2 0344 023B
        DECLE   $0142,  $01EB,  $0035           ; 67E2   0142 01EB 0035

        SAR     R3,     1                       ; 67E5   006B
        RRC     R3,     2                       ; 67E6   0077
        ADDR    R5,     R1                      ; 67E7   00E9
        SLR     R3,     2                       ; 67E8   0067
        SDBD                                    ; 67E9   0001
        MVII    #$65F9, R4                      ; 67EA   02BC 00F9 0065
        PULR    R7                              ; 67ED   02B7

        MVI     G_0159, R1                      ; 67EE   0281 0159
        DECR    R1                              ; 67F0   0011
        BEQ     L_67F9                          ; 67F1   0204 0006

        SDBD                                    ; 67F3   0001
        MVII    #$6794, R4                      ; 67F4   02BC 0094 0067
        MVO     R1,     G_0159                  ; 67F7   0241 0159
L_67F9:
        PULR    R7                              ; 67F9   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6802   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6806   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 680A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 680E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6812   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6816   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 681E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6822   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6826   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 682A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 682E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6832   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6836   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 683E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6842   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6846   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 684A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 684E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6852   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6856   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 685E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6862   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6866   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 686E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6872   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6876   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 687E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6882   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6886   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 688A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 688E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6892   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6896   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 689A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 689E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6902   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6906   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 690E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6912   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6916   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 691E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6922   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6926   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 692E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6932   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6936   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6942   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6946   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 694E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6952   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6956   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 695E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6962   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6966   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 696A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 696E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6972   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6976   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 697A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 697E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6982   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6986   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 698E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6992   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6996   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ABE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ACE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F26   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F32   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F42   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F46   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCA   0000 0000 0000 0000
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
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5045       <entry>
;;  $506B       <entry>
;;  $50B6       $51A0  
;;  $5107       $50F5  
;;  $511A       $50DE   $5B66  
;;  $511B       $5122  
;;  $5125       $50EF   $6223   $624A  
;;  $5147       $5104   $6252  
;;  $516B       $5107   $625F   $6269  
;;  $5172       $517F  
;;  $519D       $50C5   $50C9  
;;  $51A2       $506F  
;;  $51A7       $51B0  
;;  $51B3       $510D  
;;  $51B8       $51C1  
;;  $51C4       $50EC   $5101   $6136   $616E   $61BC   $631C  
;;  $51D5       $51C9  
;;  $51DD       $51D3  
;;  $51EE       $51EB  
;;  $51EF       $51E1  
;;  $5217       $51F4   $51F9   $51FE   $5203   $5208   $520D   $5213  
;;  $521D       $5219  
;;  $5223       $521F  
;;  $522D       $5225  
;;  $5231       $522B  
;;  $5263       $5252  
;;  $526E       $5268  
;;  $528B       $5283  
;;  $528F       $5289  
;;  $5295       $525A   $5261  
;;  $5298       $5242  
;;  $5299       $5232  
;;  $52A1       $50E8   $50FD   $525E   $61CA   $6204   $6367  
;;  $52B1       $52A9  
;;  $52B5       $52AF  
;;  $52CB       $5BA3   $62C0  
;;  $52EB       $52E7  
;;  $52EC       $52D8   $52DE   $52E2  
;;  $5743       $5741  
;;  $5822       $5822  
;;  $5827       $5825  
;;  $5831       $5831  
;;  $59C0       $59BE  
;;  $59D0       $59CE  
;;  $5B1A       <entry>
;;  $5B32       $5B2B  
;;  $5B4E       $5B1E   $5B27   $5B30   $5B3C  
;;  $5B60       $5B58  
;;  $5B64       $5B5E  
;;  $5B74       $5B6F   $5B79  
;;  $5B75       <entry>
;;  $5B81       $5C42  
;;  $5B98       $5BFE  
;;  $5BC2       $5BBF  
;;  $5BE3       $5BD1   $5BD9  
;;  $5BEE       $5B9D   $5BA9   $5BC4   $5BCB   $5BCF   $5BE1  
;;  $5C00       $5BF5  
;;  $5C22       $5C68  
;;  $5C31       $5C2D  
;;  $5C36       $5B95   $5C06   $5C26  
;;  $5C45       $5C08  
;;  $5C5C       $5C59  
;;  $5C6A       $5C19   $5C45  
;;  $5C7F       <entry>
;;  $5C97       $5C88   $5C91  
;;  $5CAA       $63AA  
;;  $5CC0       $5CB5  
;;  $5CC9       $5CBE  
;;  $5CCF       $5CBA   $5CC5  
;;  $5CE0       $5C83   $5CA0   $5CA8   $5CDB  
;;  $5CEA       <entry>
;;  $5CF9       $5CF5  
;;  $5D22       $5D1F  
;;  $5D2A       $5D0F  
;;  $5D2C       $5D26  
;;  $5D32       $5D2F  
;;  $5D34       $5D00  
;;  $5D3A       $5D58  
;;  $5D4B       $5D40   $5D45  
;;  $5D50       $5D49  
;;  $5D52       $5D3C  
;;  $5D5A       $5D53  
;;  $5D5B       <entry>
;;  $5D7B       $5D9D  
;;  $5D8E       $5D5F   $5D67   $5D6C  
;;  $5DA0       $5D96  
;;  $5DB0       $5DAD  
;;  $5DBC       $5DBA  
;;  $5DF4       $5CF9  
;;  $5E0D       $5E11  
;;  $5E1D       $5E25  
;;  $5E23       $5E1F  
;;  $5E2B       $5E28  
;;  $5E3E       $5178  
;;  $5E51       $5E47  
;;  $5E54       $5DD3  
;;  $5E5E       $5E4F  
;;  $5E6B       $5E66  
;;  $5E8F       $5E8A  
;;  $5EAE       $5E54   $5E5C  
;;  $5EC9       $5EB3  
;;  $5ED1       $5EC7  
;;  $5ED7       $5E69   $5EB7   $5EBC   $5EC4   $5ECF   $5ED3  
;;  $5EFA       $5EF2  
;;  $5F19       $5F13  
;;  $5F43       $5F40  
;;  $5F6B       $5F51  
;;  $5F6C       $5F5C  
;;  $5F89       $5F75   $6034   $604F  
;;  $5F8A       $510A   $6262   $626C  
;;  $5FA3       $5F6F   $5F83  
;;  $5FEE       $5FE3  
;;  $5FF2       $5FEC  
;;  $6014       $5CAD   $6005  
;;  $6020       $601D  
;;  $6033       $6023   $602C  
;;  $6039       $6031  
;;  $604D       $604A  
;;  $606A       $5181  
;;  $6086       $607C  
;;  $608C       $6084  
;;  $60A1       $6099  
;;  $60BE       $60BE  
;;  $60EB       $60EB  
;;  $612E       $6127  
;;  $6168       $6163  
;;  $61CD       $61C6  
;;  $61D8       $613F   $6166   $6191   $6197   $619D  
;;  $620A       $6117   $611F   $6125   $6147   $6154   $617E   $6189   $61DE  
;;  $620A       $622E   $6236   $623B   $6240   $62B2   $62BE   $62C4   $62D3  
;;  $620A       $6303   $630E  
;;  $621B       $6214  
;;  $6228       $621E  
;;  $6252       $6248  
;;  $6255       $6226   $6250  
;;  $6266       $6219  
;;  $62D0       $62C6   $62C9  
;;  $62D1       $6174  
;;  $62F9       $62F3  
;;  $6343       $633F  
;;  $6354       $634C   $6351  
;;  $635A       $632A  
;;  $636A       $6363  
;;  $6387       $6381  
;;  $6393       $6385  
;;  $63CA       $63C6  
;;  $63D2       $63ED   $63FB  
;;  $63D3       $63AE   $6406  
;;  $63E1       $63DB  
;;  $63E9       $63E6  
;;  $63F6       $63F2  
;;  $6415       $63B2   $6429  
;;  $6418       $6413  
;;  $642B       $5D71  
;;  $643B       $5295  
;;  $645D       <entry>
;;  $6466       $62F9  
;;  $649B       $649C  
;;  $649F       $6356  
;;  $64D2       $5116   $5B71  
;;  $64E2       $64E0  
;;  $64E8       $64E8  
;;  $64EB       $64EB  
;;  $6501       $6010  
;;  $6527       $639D  
;;  $6532       $6530  
;;  $653C       $653A  
;;  $6564       $5CDD  
;;  $6573       $6571  
;;  $657E       $6207  
;;  $6589       $6587  
;;  $65A6       $61CD  
;;  $65B1       $65AF  
;;  $65BE       $62F5  
;;  $65F1       $6286  
;;  $67F9       $67F1  
;; ======================================================================== ;;
