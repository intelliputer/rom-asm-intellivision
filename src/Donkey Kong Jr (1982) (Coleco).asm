
        ORG     $5000
.HEADER:
        BIDECLE $57F3           ; 5000  Ptr: MOB graphic images
        BIDECLE $501F           ; 5002  Ptr: EXEC timer table
        BIDECLE $508D           ; 5004  Ptr: Start of game
        BIDECLE $54A3           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501C           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502C           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $000A   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $000A   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0190,  $01A0,  $01B0,  $01C0   ; 5014   0190 01A0 01B0 01C0
        DECLE   $01D0,  $0188,  $01E0,  $01F0   ; 5018   01D0 0188 01E0 01F0
.GRAM_INIT_501C:
        DECLE   $0008           ; 501C  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 501D  #00-07:  CART #00-07 ----

.TIMER:
        DECLE   $0093,  $0062,  $0001,  $0000; 501F  Timer dispatch/interval
        DECLE   $00AA,  $005A,  $0028,  $0000; 5023  Timer dispatch/interval
        DECLE   $00C1,  $005A,  $0008,  $0000; 5027  Timer dispatch/interval
        DECLE   $0000,  $0000   ; 502B  End of timer table

        STRING  " "                             ; 502D  Title string
        DECLE   $0000                           ; 502E  

.TITLECODE:
        MVII    #$0004, R0                      ; 502F   02B8 0004
        MVO     R0,     G_0103                  ; 5031   0240 0103

        JSR     R5,     L_511B                  ; 5033   0004 0150 011B

        MVII    #$0217, R4                      ; 5036   02BC 0217
        MVII    #$0007, R3                      ; 5038   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 503A   0004 0118 007B
        STRING  "COLECO PRESENTS"               ; 503D  
        DECLE   $0000                           ; 504C   0000

        MVII    #$0255, R4                      ; 504D   02BC 0255

        JSR     R5,     X_PRINT_R5              ; 504F   0004 0118 007B
        STRING  "DONKEY KONG"                   ; 5052  
        DECLE   $0000                           ; 505D   0000

        MVII    #$027F, R4                      ; 505E   02BC 027F

        JSR     R5,     X_PRINT_R5              ; 5060   0004 0118 007B
        STRING  "JUNIOR"                        ; 5063  
        DECLE   $0000                           ; 5069   0000

        MVII    #$02B9, R4                      ; 506A   02BC 02B9

        JSR     R5,     X_PRINT_R5              ; 506C   0004 0118 007B
        STRING  "by NINTENDO"                   ; 506F  
        DECLE   $0000                           ; 507A   0000

        MVII    #$02E1, R4                      ; 507B   02BC 02E1

        JSR     R5,     X_PRINT_R5              ; 507D   0004 0118 007B
        STRING  "COPR @ 1983"                   ; 5080  
        DECLE   $0000                           ; 508B   0000

        PULR    R7                              ; 508C   02B7

.START:
        PSHR    R5                              ; 508D   0275
        SDBD                                    ; 508E   0001
        MVII    #$6CA8, R1                      ; 508F   02B9 00A8 006C
        MVO     R1,     .ISRVEC.0               ; 5092   0241 0100
        SWAP    R1,     1                       ; 5094   0041
        MVO     R1,     .ISRVEC.1               ; 5095   0241 0101

        JSR     R5,     L_6A47                  ; 5097   0004 0168 0247
L_509A:
        JSR     R5,     L_50A7                  ; 509A   0004 0150 00A7
        DECLE   $0000,  $0000,  $00AA,  $0050   ; 509D   0000 0000 00AA 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A1   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50A5   0000 0000
L_50A7:
        MVO     R5,     G_035D                  ; 50A7   0245 035D
        PULR    R7                              ; 50A9   02B7

        PSHR    R5                              ; 50AA   0275
        MVI     G_015F, R1                      ; 50AB   0281 015F
        TSTR    R1                              ; 50AD   0089
        BEQ     L_50D0                          ; 50AE   0204 0020

        MVI     G_0162, R1                      ; 50B0   0281 0162
        TSTR    R1                              ; 50B2   0089
        BNEQ    L_5142                          ; 50B3   020C 008D

        MVI     G_0161, R1                      ; 50B5   0281 0161
        TSTR    R1                              ; 50B7   0089
        BEQ     L_50F3                          ; 50B8   0204 0039

        CMPI    #$0004, R0                      ; 50BA   0378 0004
        BGT     L_5124                          ; 50BC   020E 0066

        TSTR    R0                              ; 50BE   0080
        BEQ     L_5124                          ; 50BF   0204 0063

        DECR    R1                              ; 50C1   0011
        MVO     R1,     G_0161                  ; 50C2   0241 0161
        MVO     R0,     G_0162                  ; 50C4   0240 0162
        MVII    #$0007, R3                      ; 50C6   02BB 0007
        MVII    #$0001, R1                      ; 50C8   02B9 0001
        MVII    #$028A, R4                      ; 50CA   02BC 028A

        JSR     R5,     X_PRNUM_RGT             ; 50CC   0004 0118 00C5

        PULR    R7                              ; 50CF   02B7

L_50D0:
        MVII    #$015D, R4                      ; 50D0   02BC 015D
        MVII    #$0088, R0                      ; 50D2   02B8 0088

        JSR     R5,     X_FILL_ZERO             ; 50D4   0004 0114 0338
        JSR     R5,     L_511B                  ; 50D7   0004 0150 011B

        MVII    #$0229, R4                      ; 50DA   02BC 0229
        MVO     R4,     G_015F                  ; 50DC   0244 015F
        MVII    #$0006, R3                      ; 50DE   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 50E0   0004 0118 007B
        STRING  "PLAYERS 1 OR 2"                ; 50E3  
        DECLE   $0000                           ; 50F1   0000

        PULR    R7                              ; 50F2   02B7

L_50F3:
        CMPI    #$0001, R0                      ; 50F3   0378 0001
        BEQ     L_50FB                          ; 50F5   0204 0004

        CMPI    #$0002, R0                      ; 50F7   0378 0002
        BNEQ    L_5124                          ; 50F9   020C 0029

L_50FB:
        MVO     R0,     G_0161                  ; 50FB   0240 0161
        MVII    #$0007, R3                      ; 50FD   02BB 0007
        MVII    #$023A, R4                      ; 50FF   02BC 023A
        MVII    #$0001, R1                      ; 5101   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5103   0004 0118 00C5

        DECR    R3                              ; 5106   0013
        MVII    #$0279, R4                      ; 5107   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 5109   0004 0118 007B
        STRING  "LEVEL? 1 TO 4"                 ; 510C  
        DECLE   $0000                           ; 5119   0000

        PULR    R7                              ; 511A   02B7

L_511B:
        PSHR    R5                              ; 511B   0275
        MVII    #$0200, R4                      ; 511C   02BC 0200
        MVII    #$00F0, R0                      ; 511E   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5120   0004 0114 0338

        PULR    R7                              ; 5123   02B7

L_5124:
        JSR     R5,     X_PLAY_RAZZ2            ; 5124   0004 011C 02BD

        PULR    R7                              ; 5127   02B7

L_5128:
        MVI@    R5,     R4                      ; 5128   02AC
L_5129:
        MOVR    R4,     R1                      ; 5129   00A1
        SLL     R1,     2                       ; 512A   004D
        SLL     R1,     1                       ; 512B   0049
        ADDR    R2,     R1                      ; 512C   00D1
        MVI@    R5,     R4                      ; 512D   02AC
L_512E:
        MVO@    R1,     R4                      ; 512E   0261
        MVI@    R5,     R4                      ; 512F   02AC
        TSTR    R4                              ; 5130   00A4
        BEQ     L_5141                          ; 5131   0204 000E

        CMPI    #$02FF, R4                      ; 5133   037C 02FF
        BLT     L_513B                          ; 5135   0205 0004

        ADDI    #$0008, R1                      ; 5137   02F9 0008
        SUBI    #$0100, R4                      ; 5139   033C 0100
L_513B:
        CMPI    #$01FF, R4                      ; 513B   037C 01FF
        BGT     L_512E                          ; 513D   022E 0010
        B       L_5129                          ; 513F   0220 0017
L_5141:
        MOVR    R5,     R7                      ; 5141   00AF

L_5142:
        MVII    #$0004, R0                      ; 5142   02B8 0004
        DECR    R1                              ; 5144   0011
        MVO     R1,     G_0162                  ; 5145   0241 0162
        BEQ     L_514B                          ; 5147   0204 0002

        MVII    #$0002, R0                      ; 5149   02B8 0002
L_514B:
        MVO     R0,     G_016E                  ; 514B   0240 016E
        MVI     G_0161, R1                      ; 514D   0281 0161
        TSTR    R1                              ; 514F   0089
        BEQ     L_5155                          ; 5150   0204 0003

        INCR    R0                              ; 5152   0008
        MVO     R0,     G_016F                  ; 5153   0240 016F
L_5155:
        MVII    #$0001, R0                      ; 5155   02B8 0001
        MVO     R0,     G_017A                  ; 5157   0240 017A
L_5159:
        MVII    #$02F2, R6                      ; 5159   02BE 02F2
        MVII    #$017B, R4                      ; 515B   02BC 017B
        MVII    #$006E, R0                      ; 515D   02B8 006E
        MVO     R4,     G_035D                  ; 515F   0244 035D

        JSR     R5,     X_FILL_ZERO             ; 5161   0004 0114 0338
        JSR     R5,     L_511B                  ; 5164   0004 0150 011B

        MVII    #$0265, R4                      ; 5167   02BC 0265
        MVII    #$0006, R3                      ; 5169   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 516B   0004 0118 007B
        STRING  "GET READY,PLAYER"              ; 516E  
        DECLE   $0000                           ; 517E   0000

        MVII    #$0001, R1                      ; 517F   02B9 0001
        MVII    #$0276, R4                      ; 5181   02BC 0276
        MVI     G_0165, R0                      ; 5183   0280 0165
        INCR    R0                              ; 5185   0008

        JSR     R5,     X_PRNUM_RGT             ; 5186   0004 0118 00C5
        JSR     R5,     X_STOP_SFX              ; 5189   0004 011C 02B4

        MVII    #$0040, R1                      ; 518C   02B9 0040

        JSR     R5,     L_627D                  ; 518E   0004 0160 027D

        DIS                                     ; 5191   0003

        JSR     R5,     L_511B                  ; 5192   0004 0150 011B

L_5195:
        MVI     G_017A, R0                      ; 5195   0280 017A
        SARC    R0,     1                       ; 5197   0078
        BC      L_5195                          ; 5198   0221 0004

        SDBD                                    ; 519A   0001
        MVII    #$0875, R2                      ; 519B   02BA 0075 0008
        MVO     R2,     .BTAB.02                ; 519E   0242 0202
        SUBI    #$006E, R2                      ; 51A0   033A 006E

        JSR     R5,     L_5128                  ; 51A2   0004 0150 0128
        DECLE   $000C,  $0205,  $020F,  $030E   ; 51A5   000C 0205 020F 030E
        DECLE   $000F,  $0203,  $0304,  $0000   ; 51A9   000F 0203 0304 0000

        ADDI    #$017E, R2                      ; 51AD   02FA 017E
        MVII    #$019D, R1                      ; 51AF   02B9 019D
        CMPI    #$0004, R0                      ; 51B1   0378 0004
        BEQ     L_51CE                          ; 51B3   0204 0019

        MVO     R2,     .BTAB.11                ; 51B5   0242 0211
        MVO     R1,     .BTAB.25                ; 51B7   0241 0225
        SDBD                                    ; 51B9   0001
        MVII    #$1805, R2                      ; 51BA   02BA 0005 0018

        JSR     R5,     L_5128                  ; 51BD   0004 0150 0128
        DECLE   $0000,  $020D,  $0310           ; 51C0   0000 020D 0310

        SUB@    R4,     R1                      ; 51C3   0321
        SUB@    R4,     R1                      ; 51C4   0321
        SUB@    R4,     R2                      ; 51C5   0322
        SUB@    R4,     R3                      ; 51C6   0323
        SUB@    R4,     R4                      ; 51C7   0324
        SUB@    R1,     R0                      ; 51C8   0308
        DECR    R1                              ; 51C9   0011
        NOPP                                    ; 51CA   0208 0000
        B       L_51D2                          ; 51CC   0200 0004

L_51CE:
        MVO     R2,     .BTAB.26                ; 51CE   0242 0226
        MVO     R1,     .BTAB.3A                ; 51D0   0241 023A
L_51D2:
        MVI     G_017C, R1                      ; 51D2   0281 017C
        DECR    R1                              ; 51D4   0011
        MVII    #$003D, R2                      ; 51D5   02BA 003D
        CMPI    #$0002, R1                      ; 51D7   0379 0002
        BGE     L_51DD                          ; 51D9   020D 0002

        MVII    #$0033, R2                      ; 51DB   02BA 0033
L_51DD:
        MVO     R2,     G_0175                  ; 51DD   0242 0175
        SLR     R1,     2                       ; 51DF   0065
        ADD     G_0162, R1                      ; 51E0   02C1 0162
        CMPI    #$0004, R1                      ; 51E2   0379 0004
        BLE     L_51E8                          ; 51E4   0206 0002

        MVII    #$0004, R1                      ; 51E6   02B9 0004
L_51E8:
        MVO     R1,     G_017B                  ; 51E8   0241 017B
        MVII    #$0001, R1                      ; 51EA   02B9 0001
        MVO     R1,     G_0127                  ; 51EC   0241 0127

        JSR     R5,     L_5B28                  ; 51EE   0004 0158 0328

        MVII    #$00FF, R0                      ; 51F1   02B8 00FF
        MVO     R0,     G_0193                  ; 51F3   0240 0193
        SDBD                                    ; 51F5   0001
        MVII    #$5A2B, R1                      ; 51F6   02B9 002B 005A
        MVII    #$0003, R0                      ; 51F9   02B8 0003
        MVII    #$0345, R2                      ; 51FB   02BA 0345

        JSR     R5,     X_INIT_MOBS             ; 51FD   0004 0114 02B4

        MVII    #$0080, R2                      ; 5200   02BA 0080
        MVO     R2,     G_011A                  ; 5202   0242 011A

        JSR     R5,     L_5211                  ; 5204   0004 0150 0211
        DECLE   $00BB,  $005E,  $0000,  $0000   ; 5207   00BB 005E 0000 0000
        DECLE   $0074,  $0060,  $0000,  $0000   ; 520B   0074 0060 0000 0000
        DECLE   $0000,  $0000                   ; 520F   0000 0000
L_5211:
        MVO     R5,     G_035D                  ; 5211   0245 035D
        ADD     G_017A, R7                      ; 5213   02C7 017A
        B       L_521F                          ; 5215   0200 0008
        B       L_521F                          ; 5217   0200 0006
        B       L_531F                          ; 5219   0200 0104
        B       L_521F                          ; 521B   0200 0002
        B       L_53D1                          ; 521D   0200 01B2

L_521F:
        MVII    #$02E6, R2                      ; 521F   02BA 02E6
        MVO     R2,     .BTAB.1C                ; 5221   0242 021C
        ADDI    #$0300, R2                      ; 5223   02FA 0300
        MVO     R2,     .BTAB.1A                ; 5225   0242 021A
        MVO     R2,     .BTAB.2E                ; 5227   0242 022E
        ADDI    #$0008, R2                      ; 5229   02FA 0008
        MVO     R2,     .BTAB.17                ; 522B   0242 0217
        MVO     R2,     .BTAB.2B                ; 522D   0242 022B
        ADDI    #$006F, R2                      ; 522F   02FA 006F
        MVO     R2,     .BTAB.DE                ; 5231   0242 02DE
        MVO     R2,     .BTAB.DF                ; 5233   0242 02DF
        MVO     R2,     .BTAB.E0                ; 5235   0242 02E0
        MVO     R2,     .BTAB.E1                ; 5237   0242 02E1
        ADDI    #$01E6, R2                      ; 5239   02FA 01E6

        JSR     R5,     L_530E                  ; 523B   0004 0150 030E

        ADDI    #$0037, R2                      ; 523E   02FA 0037
        MVO     R2,     .BTAB.0B                ; 5240   0242 020B
        MVO     R2,     .BTAB.58                ; 5242   0242 0258
        SUBI    #$008C, R2                      ; 5244   033A 008C

        JSR     R5,     L_5128                  ; 5246   0004 0150 0128
        DECLE   $0013,  $0296,  $0354,  $025B   ; 5249   0013 0296 0354 025B
        DECLE   $0355,  $025C,  $0000           ; 524D   0355 025C 0000

        SUBI    #$0002, R2                      ; 5250   033A 0002

        JSR     R5,     L_5128                  ; 5252   0004 0150 0128
        DECLE   $0018,  $02E6,  $03E7,  $03E8   ; 5255   0018 02E6 03E7 03E8
        DECLE   $03E9,  $001D,  $02EC,  $03E3   ; 5259   03E9 001D 02EC 03E3
        DECLE   $02EA,  $0000                   ; 525D   02EA 0000

        ADDI    #$000D, R2                      ; 525F   02FA 000D
        MVO     R2,     .BTAB.1B                ; 5261   0242 021B
        SDBD                                    ; 5263   0001
        MVII    #$1802, R2                      ; 5264   02BA 0002 0018

        JSR     R5,     L_5128                  ; 5267   0004 0150 0128
        DECLE   $001F,  $0240,  $0242           ; 526A   001F 0240 0242

        MVO     R3,     .BTAB.45                ; 526D   0243 0245
        MVI@    R4,     R7                      ; 526F   02A7

        CMP     G_033F, R1                      ; 5270   0341 033F
        MVO     R4,     .BTAB.46                ; 5272   0244 0246
        MVI@    R4,     R6                      ; 5274   02A6
        CMP@    R1,     R0                      ; 5275   0348
        MVO@    R1,     R1                      ; 5276   0249
        MVO@    R2,     R5                      ; 5277   026A
        MVI     G_0387, R6                      ; 5278   0286 0387
        AND@    R1,     R0                      ; 527A   0388
        CMP     G_03A8, R7                      ; 527B   0347 03A8
        AND@    R4,     R5                      ; 527D   03A5
        CMP@    R1,     R2                      ; 527E   034A
        CMP@    R5,     R1                      ; 527F   0369
        SUB@    R6,     R7                      ; 5280   0337

        DECLE   $024B,  $025F,  $0270,  $0273   ; 5281   024B 025F 0270 0273
        DECLE   $027D                           ; 5285   027D

        MVI     .BTAB.91,R4                     ; 5286   0284 0291
        MVI@    R3,     R0                      ; 5288   0298
        MVI@    R3,     R3                      ; 5289   029B
        MVI@    R5,     R4                      ; 528A   02AC
        MVI@    R5,     R7                      ; 528B   02AF

        DECLE   $02B9,  $0338,  $024C,  $0253   ; 528C   02B9 0338 024C 0253
        DECLE   $025A,  $025D,  $0260,  $0267   ; 5290   025A 025D 0260 0267
        DECLE   $026C,  $026E,  $0271,  $0274   ; 5294   026C 026E 0271 0274
        DECLE   $027B,  $027E                   ; 5298   027B 027E

        MVI     .BTAB.82,R0                     ; 529A   0280 0282
        MVI     .BTAB.8F,R5                     ; 529C   0285 028F
        MVI@    R2,     R2                      ; 529E   0292
        MVI@    R2,     R4                      ; 529F   0294
        MVI@    R3,     R1                      ; 52A0   0299
        MVI@    R3,     R4                      ; 52A1   029C
        MVI@    R4,     R3                      ; 52A2   02A3
        MVI@    R5,     R0                      ; 52A3   02A8
        MVI@    R5,     R5                      ; 52A4   02AD
        PULR    R0                              ; 52A5   02B0
        PULR    R7                              ; 52A6   02B7

        DECLE   $02BA,  $0016,  $021F           ; 52A7   02BA 0016 021F

        MVII    #$02C4, R4                      ; 52AA   02BC 02C4
        ADD@    R1,     R3                      ; 52AC   02CB
        ADD@    R1,     R6                      ; 52AD   02CE
        XOR     .STIC.X.0,R0                    ; 52AE   03C0 0000
        ADDI    #$003B, R2                      ; 52B0   02FA 003B
        MVO     R2,     .BTAB.2F                ; 52B2   0242 022F
        SDBD                                    ; 52B4   0001
        MVII    #$28EC, R2                      ; 52B5   02BA 00EC 0028
        MVO     R2,     .BTAB.E4                ; 52B8   0242 02E4
        MVO     R2,     .BTAB.EB                ; 52BA   0242 02EB
        SUBI    #$0008, R2                      ; 52BC   033A 0008
        MVO     R2,     .BTAB.E5                ; 52BE   0242 02E5
        MVO     R2,     .BTAB.ED                ; 52C0   0242 02ED
        SDBD                                    ; 52C2   0001
        MVII    #$59EB, R1                      ; 52C3   02B9 00EB 0059
        MVII    #$031D, R2                      ; 52C6   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 52C8   0004 0114 02B2

        MVII    #$0017, R0                      ; 52CB   02B8 0017

        JSR     R5,     X_RAND2                 ; 52CD   0004 0114 029E

        ADDI    #$0007, R0                      ; 52D0   02F8 0007
        MVO     R0,     G_0323                  ; 52D2   0240 0323
        MOVR    R0,     R3                      ; 52D4   0083
        MVI     G_017B, R0                      ; 52D5   0280 017B
        TSTR    R0                              ; 52D7   0080
        BEQ     L_52E9                          ; 52D8   0204 000F

        MVII    #$0325, R2                      ; 52DA   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 52DC   0004 0114 02B2

        MVII    #$0017, R0                      ; 52DF   02B8 0017

        JSR     R5,     X_RAND2                 ; 52E1   0004 0114 029E

        ADDI    #$0016, R0                      ; 52E4   02F8 0016
        ADDR    R3,     R0                      ; 52E6   00D8
        MVO     R0,     G_032C                  ; 52E7   0240 032C
L_52E9:
        ADDI    #$0010, R1                      ; 52E9   02F9 0010
        MVI     G_017C, R3                      ; 52EB   0283 017C
        CMPI    #$0002, R3                      ; 52ED   037B 0002
        BLE     L_52F6                          ; 52EF   0206 0005

        MVII    #$032D, R2                      ; 52F1   02BA 032D

        JSR     R5,     X_INIT_MOB              ; 52F3   0004 0114 02B2

L_52F6:
        MVII    #$0335, R2                      ; 52F6   02BA 0335

        JSR     R5,     X_INIT_MOB              ; 52F8   0004 0114 02B2

        SDBD                                    ; 52FB   0001
        MVII    #$8934, R0                      ; 52FC   02B8 0034 0089
        MVO     R0,     G_033C                  ; 52FF   0240 033C
        MVII    #$033D, R2                      ; 5301   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 5303   0004 0114 02B2

        SDBD                                    ; 5306   0001
        MVII    #$392C, R0                      ; 5307   02B8 002C 0039
        MVO     R0,     G_0344                  ; 530A   0240 0344
        B       L_53CD                          ; 530C   0200 00BF

L_530E:
        MVII    #$0218, R1                      ; 530E   02B9 0218
L_5310:
        MVO@    R2,     R1                      ; 5310   024A
        ADDI    #$0008, R2                      ; 5311   02FA 0008
        INCR    R1                              ; 5313   0009
        MVO@    R2,     R1                      ; 5314   024A
        ADDI    #$0013, R1                      ; 5315   02F9 0013
        ADDI    #$0008, R2                      ; 5317   02FA 0008
        MVO@    R2,     R1                      ; 5319   024A
        INCR    R1                              ; 531A   0009
        ADDI    #$0008, R2                      ; 531B   02FA 0008
        MVO@    R2,     R1                      ; 531D   024A
        MOVR    R5,     R7                      ; 531E   00AF

L_531F:
        SDBD                                    ; 531F   0001
        MVII    #$05E6, R2                      ; 5320   02BA 00E6 0005
        MVO     R2,     .BTAB.0B                ; 5323   0242 020B
        MVO     R2,     .BTAB.1F                ; 5325   0242 021F
        ADDI    #$0008, R2                      ; 5327   02FA 0008
        MVO     R2,     .BTAB.08                ; 5329   0242 0208
        MVO     R2,     .BTAB.1C                ; 532B   0242 021C
        ADDI    #$0255, R2                      ; 532D   02FA 0255
        MVII    #$0209, R1                      ; 532F   02B9 0209

        JSR     R5,     L_5310                  ; 5331   0004 0150 0310

        SUBI    #$004A, R2                      ; 5334   033A 004A
        MVO     R2,     .BTAB.07                ; 5336   0242 0207
        SDBD                                    ; 5338   0001
        MVII    #$1805, R2                      ; 5339   02BA 0005 0018

        JSR     R5,     L_5128                  ; 533C   0004 0150 0128
        DECLE   $0007,  $021B,  $0013,  $023F   ; 533F   0007 021B 0013 023F
        DECLE   $0253,  $0267,  $027B           ; 5343   0253 0267 027B

        MVI@    R1,     R7                      ; 5346   028F

        MVI@    R4,     R3                      ; 5347   02A3
        PULR    R7                              ; 5348   02B7

        ADD@    R1,     R3                      ; 5349   02CB
        ADD@    R3,     R7                      ; 534A   02DF

        DECLE   $034C,  $0260,  $0274,  $0288   ; 534B   034C 0260 0274 0288
        DECLE   $029C,  $02B0,  $02C4,  $02D8   ; 534F   029C 02B0 02C4 02D8
        DECLE   $02EC,  $0019,  $0231,  $0234   ; 5353   02EC 0019 0231 0234
        DECLE   $0237,  $032C,  $022F,  $0232   ; 5357   0237 032C 022F 0232
        DECLE   $032B,  $022D,  $022E,  $0230   ; 535B   032B 022D 022E 0230
        DECLE   $0233,  $0235,  $0236,  $0238   ; 535F   0233 0235 0236 0238
        DECLE   $0000                           ; 5363   0000

        MVII    #$02E0, R4                      ; 5364   02BC 02E0
        MVII    #$000C, R0                      ; 5366   02B8 000C
        SDBD                                    ; 5368   0001
        MVII    #$0659, R1                      ; 5369   02B9 0059 0006

        JSR     R5,     X_FILL_MEM              ; 536C   0004 0114 0341

        CLRR    R3                              ; 536F   01DB
L_5370:
        MOVR    R3,     R1                      ; 5370   0099
        ADDI    #$01B0, R1                      ; 5371   02F9 01B0
        MVII    #$004F, R0                      ; 5373   02B8 004F
        MVO@    R0,     R1                      ; 5375   0248

        JSR     R5,     L_6D16                  ; 5376   0004 016C 0116

        INCR    R3                              ; 5379   000B
        CMPI    #$000C, R3                      ; 537A   037B 000C
        BLT     L_5370                          ; 537C   0225 000D

        CLRR    R0                              ; 537E   01C0
        MVO     R0,     G_01B2                  ; 537F   0240 01B2
        MVO     R0,     G_01B9                  ; 5381   0240 01B9
        SDBD                                    ; 5383   0001
        MVII    #$0892, R2                      ; 5384   02BA 0092 0008
        MVO     R2,     .BTAB.71                ; 5387   0242 0271
        SUBI    #$0008, R2                      ; 5389   033A 0008
        MVO     R2,     .BTAB.6A                ; 538B   0242 026A
        SDBD                                    ; 538D   0001
        MVII    #$59FB, R1                      ; 538E   02B9 00FB 0059
        MVII    #$031D, R2                      ; 5391   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 5393   0004 0114 02B2

        SDBD                                    ; 5396   0001
        MVII    #$8812, R2                      ; 5397   02BA 0012 0088
        MVO     R2,     G_0324                  ; 539A   0242 0324
        MVII    #$0325, R2                      ; 539C   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 539E   0004 0114 02B2

        SDBD                                    ; 53A1   0001
        MVII    #$2812, R2                      ; 53A2   02BA 0012 0028
        MVO     R2,     G_032C                  ; 53A5   0242 032C
        SDBD                                    ; 53A7   0001
        MVII    #$5A0B, R1                      ; 53A8   02B9 000B 005A
        MVII    #$0060, R5                      ; 53AB   02BD 0060
        MVII    #$0080, R4                      ; 53AD   02BC 0080
L_53AF:
        PSHR    R4                              ; 53AF   0274
        PSHR    R5                              ; 53B0   0275
        MVII    #$032D, R2                      ; 53B1   02BA 032D

        JSR     R5,     X_INIT_MOB              ; 53B3   0004 0114 02B2

        MVII    #$0335, R2                      ; 53B6   02BA 0335

        JSR     R5,     X_INIT_MOB              ; 53B8   0004 0114 02B2

        PULR    R2                              ; 53BB   02B2
        MVO     R2,     G_033B                  ; 53BC   0242 033B
        MVI     G_017B, R2                      ; 53BE   0282 017B
        TSTR    R2                              ; 53C0   0092
        BEQ     L_53CC                          ; 53C1   0204 0009

        MVII    #$033D, R2                      ; 53C3   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 53C5   0004 0114 02B2

        PULR    R2                              ; 53C8   02B2
        MVO     R2,     G_0343                  ; 53C9   0242 0343
        INCR    R7                              ; 53CB   000F

L_53CC:
        PULR    R2                              ; 53CC   02B2
L_53CD:
        EIS                                     ; 53CD   0002
        MVO     R2,     .STIC.VIDEN             ; 53CE   0242 0020
        PULR    R7                              ; 53D0   02B7

L_53D1:
        MVII    #$0058, R2                      ; 53D1   02BA 0058
        DECLE   $0042,  $0242,  $0350,  $0001   ; 53D3   0042 0242 0350 0001

        MVII    #$0043, R2                      ; 53D7   02BA 0043
        INCR    R2                              ; 53D9   000A

        JSR     R5,     L_530E                  ; 53DA   0004 0150 030E

        SUBI    #$0231, R2                      ; 53DD   033A 0231
        MVO     R2,     .BTAB.0B                ; 53DF   0242 020B
        MVO     R2,     .BTAB.68                ; 53E1   0242 0268
        MVO     R2,     .BTAB.57                ; 53E3   0242 0257
        MVO     R2,     .BTAB.5A                ; 53E5   0242 025A
        ADDI    #$003D, R2                      ; 53E7   02FA 003D
        MVO     R2,     .BTAB.11                ; 53E9   0242 0211
        ADDI    #$0008, R2                      ; 53EB   02FA 0008
        MVO     R2,     .BTAB.10                ; 53ED   0242 0210
        ADDI    #$0020, R2                      ; 53EF   02FA 0020
        MVO     R2,     .BTAB.E2                ; 53F1   0242 02E2
        SUBI    #$008E, R2                      ; 53F3   033A 008E

        JSR     R5,     L_5128                  ; 53F5   0004 0150 0128
        DECLE   $0000,  $020D,  $030E           ; 53F8   0000 020D 030E

        SUB@    R1,     R7                      ; 53FB   030F

        DECLE   $0308,  $0006,  $021C,  $002E   ; 53FC   0308 0006 021C 002E
        DECLE   $021B,  $0000                   ; 5400   021B 0000

        ADDI    #$0005, R2                      ; 5402   02FA 0005

        JSR     R5,     L_5128                  ; 5404   0004 0150 0128
        DECLE   $0004,  $0217,  $022B,  $0007   ; 5407   0004 0217 022B 0007
        DECLE   $021A,  $022E,  $0013           ; 540B   021A 022E 0013

        MVO     R1,     .BTAB.44                ; 540E   0241 0244
        MVO     R7,     .BTAB.4A                ; 5410   0247 024A
        SUBI    #$0242, R7                      ; 5412   033F 0242

        DECLE   $0245,  $0340,  $0243,  $0246   ; 5414   0245 0340 0243 0246
        DECLE   $0348,  $0349,  $0019,  $0223   ; 5418   0348 0349 0019 0223
        DECLE   $0237,  $024B,  $025F,  $0256   ; 541C   0237 024B 025F 0256
        DECLE   $026A,  $0259,  $026D,  $025C   ; 5420   026A 0259 026D 025C
        DECLE   $0270,  $0253,  $0267,  $027B   ; 5424   0270 0253 0267 027B
        DECLE   $0324,  $0238,  $024C,  $0260   ; 5428   0324 0238 024C 0260
        DECLE   $0254,  $027C,  $025D,  $0373   ; 542C   0254 027C 025D 0373
        DECLE   $027E,  $0281,  $0284,  $036B   ; 5430   027E 0281 0284 036B
        DECLE   $026E,  $0271,  $0274,  $038F   ; 5434   026E 0271 0274 038F
        DECLE   $0390,  $021F,  $0000           ; 5438   0390 021F 0000

        DECR    R2                              ; 543B   0012

        JSR     R5,     L_5128                  ; 543C   0004 0150 0128
        DECLE   $0004,  $02D7,  $0007,  $02D8   ; 543F   0004 02D7 0007 02D8
        DECLE   $001F                           ; 5443   001F

        MVI@    R5,     R7                      ; 5444   02AF

        DECLE   $03B0,  $03C3,  $03C4,  $0000   ; 5445   03B0 03C3 03C4 0000

        DECR    R2                              ; 5449   0012

        JSR     R5,     L_5128                  ; 544A   0004 0150 0128
        DECLE   $0025,  $02B8,  $02C1,  $03B9   ; 544D   0025 02B8 02C1 03B9
        DECLE   $02C2,  $02E1,  $02E6,  $02ED   ; 5451   02C2 02E1 02E6 02ED
        DECLE   $03B6,  $02C0,  $02DE,  $02E3   ; 5455   03B6 02C0 02DE 02E3
        DECLE   $02E9,  $039C,  $03BC,  $03BD   ; 5459   02E9 039C 03BC 03BD
        DECLE   $03E7,  $03E8,  $0012,  $029B   ; 545D   03E7 03E8 0012 029B
        DECLE   $0000                           ; 5461   0000

        DECR    R2                              ; 5462   0012

        JSR     R5,     L_5128                  ; 5463   0004 0150 0128
        DECLE   $0018,  $0291,  $0293           ; 5466   0018 0291 0293

        MVI@    R2,     R4                      ; 5469   0294
        MVI@    R2,     R6                      ; 546A   0296
        MVI@    R2,     R7                      ; 546B   0297

        DECLE   $0298,  $0299,  $029A,  $002D   ; 546C   0298 0299 029A 002D
        DECLE   $0292,  $0295,  $0000           ; 5470   0292 0295 0000

        SDBD                                    ; 5473   0001
        MVII    #$1C04, R2                      ; 5474   02BA 0004 001C

        JSR     R5,     L_5128                  ; 5477   0004 0150 0128
        DECLE   $0023,  $02B7,  $02DF,  $02E0   ; 547A   0023 02B7 02DF 02E0
        DECLE   $02E4,  $02E5,  $02EA,  $02EB   ; 547E   02E4 02E5 02EA 02EB
        DECLE   $02EC,  $03CB,  $0000           ; 5482   02EC 03CB 0000

        SDBD                                    ; 5485   0001
        MVII    #$3B78, R2                      ; 5486   02BA 0078 003B
        MVO     R2,     .BTAB.2F                ; 5489   0242 022F
        SDBD                                    ; 548B   0001
        MVII    #$5A2B, R1                      ; 548C   02B9 002B 005A
        MVII    #$031D, R2                      ; 548F   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 5491   0004 0114 02B2

        MVII    #$0325, R2                      ; 5494   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 5496   0004 0114 02B2

        SDBD                                    ; 5499   0001
        MVII    #$5A1B, R1                      ; 549A   02B9 001B 005A
        MVII    #$0018, R5                      ; 549D   02BD 0018
        MVII    #$0030, R4                      ; 549F   02BC 0030
        B       L_53AF                          ; 54A1   0220 00F3

.GFX_LIST_54A3:
        DECLE   $003F,  $0020,  $0024,  $002E   ; 54A3  CART PIC #00
        DECLE   $0024,  $0020,  $0020,  $002E   ; 54A7  
        DECLE   $00F8,  $0008,  $0008,  $0008   ; 54AB  CART PIC #01
        DECLE   $0008,  $0008,  $0008,  $0008   ; 54AF  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54B3  CART PIC #02
        DECLE   $0000,  $0000,  $007C,  $007F   ; 54B7  
        DECLE   $0029,  $0029,  $002E,  $0029   ; 54BB  CART PIC #03
        DECLE   $0029,  $002E,  $0020,  $003F   ; 54BF  
        DECLE   $0000,  $0074,  $0056,  $0055   ; 54C3  CART PIC #04
        DECLE   $0054,  $0074,  $0000,  $00FF   ; 54C7  
        DECLE   $0000,  $00A4,  $00A5,  $00A4   ; 54CB  CART PIC #05
        DECLE   $00A4,  $0099,  $0000,  $00FF   ; 54CF  
        DECLE   $0008,  $00E8,  $0008,  $00C8   ; 54D3  CART PIC #06
        DECLE   $0028,  $00E8,  $0008,  $00F8   ; 54D7  
        DECLE   $007B,  $007C,  $0038,  $007C   ; 54DB  CART PIC #07
        DECLE   $007C,  $0078,  $0030,  $003C   ; 54DF  
        DECLE   $0000,  $0038,  $0078,  $00E3   ; 54E3   0000 0038 0078 00E3
        DECLE   $00E5,  $00F7,  $007C,  $003F   ; 54E7   00E5 00F7 007C 003F
        DECLE   $0000                           ; 54EB   0000

        COMR    R4                              ; 54EC   001C
        COMR    R6                              ; 54ED   001E
        ADDR    R0,     R7                      ; 54EE   00C7
        MOVR    R4,     R7                      ; 54EF   00A7
        ADDR    R5,     R7                      ; 54F0   00EF

        DECLE   $003E,  $00FC,  $001F,  $000F   ; 54F1   003E 00FC 001F 000F
        DECLE   $001F,  $003F,  $00F8,  $00E0   ; 54F5   001F 003F 00F8 00E0
        DECLE   $0070,  $00F8,  $00F8,  $00F0   ; 54F9   0070 00F8 00F8 00F0
        DECLE   $00F8,  $00FE,  $001F,  $0007   ; 54FD   00F8 00FE 001F 0007
        DECLE   $000E,  $001F,  $0000,  $00EE   ; 5501   000E 001F 0000 00EE
        DECLE   $00AA,  $00AA,  $00AA,  $00EE   ; 5505   00AA 00AA 00AA 00EE
        DECLE   $0000,  $0000,  $0000,  $00EE   ; 5509   0000 0000 0000 00EE
        DECLE   $00AA,  $00AA,  $00AA,  $00EE   ; 550D   00AA 00AA 00AA 00EE
        DECLE   $0000,  $0000,  $0000,  $0020   ; 5511   0000 0000 0000 0020
        DECLE   $0060,  $0020,  $0020,  $0020   ; 5515   0060 0020 0020 0020
        DECLE   $0000,  $0000,  $0000,  $00EE   ; 5519   0000 0000 0000 00EE
        DECLE   $00AA,  $00AA,  $00AA,  $00EE   ; 551D   00AA 00AA 00AA 00EE
        DECLE   $0000,  $0000,  $0000,  $00EE   ; 5521   0000 0000 0000 00EE
        DECLE   $00AA,  $00AA,  $00AA,  $00EE   ; 5525   00AA 00AA 00AA 00EE
        DECLE   $0000,  $0000,  $00FF           ; 5529   0000 0000 00FF

        ADDR    R0,     R3                      ; 552C   00C3
        ADDR    R3,     R3                      ; 552D   00DB
        ADDR    R0,     R3                      ; 552E   00C3
        ADDR    R5,     R7                      ; 552F   00EF

        DECLE   $0066,  $003C,  $0018,  $0066   ; 5530   0066 003C 0018 0066
        DECLE   $0099,  $003C,  $007E,  $007E   ; 5534   0099 003C 007E 007E
        DECLE   $003C,  $0018,  $0000,  $00C0   ; 5538   003C 0018 0000 00C0
        DECLE   $00E0,  $007E,  $003C,  $0000   ; 553C   00E0 007E 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5540   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $000F,  $0005   ; 5544   0000 0007 000F 0005
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5548   0000 0000 0000 00C0
        DECLE   $00C0,  $00C0,  $00F0,  $00D8   ; 554C   00C0 00C0 00F0 00D8
        DECLE   $00D0,  $00C0,  $00C0,  $000C   ; 5550   00D0 00C0 00C0 000C
        DECLE   $000C,  $000C,  $000C,  $0000   ; 5554   000C 000C 000C 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5558   0000 0000 0000 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $0000   ; 555C   00C0 00C0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5560   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003F   ; 5564   0000 0000 0000 003F
        DECLE   $007F,  $005F,  $001F,  $0000   ; 5568   007F 005F 001F 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 556C   0000 0000 0000 00F0
        DECLE   $00F8,  $00E8,  $00E0,  $0000   ; 5570   00F8 00E8 00E0 0000
        DECLE   $0000,  $003F,  $007F,  $00FF   ; 5574   0000 003F 007F 00FF

        ADDR    R3,     R7                      ; 5578   00DF
        MOVR    R3,     R7                      ; 5579   009F

        DECLE   $001F,  $0000,  $0000,  $00FC   ; 557A   001F 0000 0000 00FC
        DECLE   $00FE,  $00FF,  $00FB,  $00F9   ; 557E   00FE 00FF 00FB 00F9
        DECLE   $00F8,  $0080,  $00C0,  $00E0   ; 5582   00F8 0080 00C0 00E0
        DECLE   $0060,  $0020,  $0000,  $0000   ; 5586   0060 0020 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $0083   ; 558A   0000 00FF 00FF 0083
        DECLE   $0001,  $0070,  $0008,  $0000   ; 558E   0001 0070 0008 0000
        DECLE   $0002,  $0001,  $0003,  $0007   ; 5592   0002 0001 0003 0007
        DECLE   $0006,  $0004,  $0000,  $0000   ; 5596   0006 0004 0000 0000
        DECLE   $0000,  $00FF,  $00BB,  $00ED   ; 559A   0000 00FF 00BB 00ED
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 559E   00FF 0000 0000 0000
        DECLE   $0000,  $00FF,  $00BB,  $00ED   ; 55A2   0000 00FF 00BB 00ED
        DECLE   $00FF,  $00C0,  $00C0,  $00C0   ; 55A6   00FF 00C0 00C0 00C0
        DECLE   $00C0,  $00FF,  $00BB,  $00ED   ; 55AA   00C0 00FF 00BB 00ED
        DECLE   $00FF,  $000C,  $000C,  $000C   ; 55AE   00FF 000C 000C 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 55B2   000C 0000 0000 0000
        DECLE   $0000,  $00FF,  $00BB,  $00ED   ; 55B6   0000 00FF 00BB 00ED
        DECLE   $00FF,  $00C0,  $00C0,  $00C0   ; 55BA   00FF 00C0 00C0 00C0
        DECLE   $00C0,  $00FF,  $00BB,  $00ED   ; 55BE   00C0 00FF 00BB 00ED
        DECLE   $00FF,  $000C,  $000C,  $000C   ; 55C2   00FF 000C 000C 000C
        DECLE   $000C,  $00FF,  $00BB,  $00ED   ; 55C6   000C 00FF 00BB 00ED
        DECLE   $00FF,  $00F8,  $00B8,  $00E8   ; 55CA   00FF 00F8 00B8 00E8
        DECLE   $00F8,  $00FF,  $00BB,  $00ED   ; 55CE   00F8 00FF 00BB 00ED
        DECLE   $00FF                           ; 55D2   00FF

        COMR    R4                              ; 55D3   001C
        COMR    R4                              ; 55D4   001C
        COMR    R4                              ; 55D5   001C
        COMR    R4                              ; 55D6   001C
        INCR    R4                              ; 55D7   000C
        INCR    R4                              ; 55D8   000C
        INCR    R4                              ; 55D9   000C
        INCR    R4                              ; 55DA   000C
        ADDR    R0,     R7                      ; 55DB   00C7

        ADDR    R0,     R5                      ; 55DC   00C5
        ADDR    R0,     R6                      ; 55DD   00C6
        ADDR    R0,     R7                      ; 55DE   00C7

        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 55DF   00C0 00C0 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55E3   0000 0000 0000 0000

        ADDR    R7,     R0                      ; 55E7   00F8
        MOVR    R7,     R0                      ; 55E8   00B8
        ADDR    R5,     R0                      ; 55E9   00E8
        ADDR    R7,     R0                      ; 55EA   00F8
        ADDR    R0,     R0                      ; 55EB   00C0
        ADDR    R0,     R0                      ; 55EC   00C0
        ADDR    R0,     R0                      ; 55ED   00C0
        ADDR    R0,     R0                      ; 55EE   00C0
        ADDR    R0,     R7                      ; 55EF   00C7

        ADDR    R0,     R5                      ; 55F0   00C5
        ADDR    R0,     R6                      ; 55F1   00C6
        ADDR    R0,     R7                      ; 55F2   00C7

        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 55F3   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 55F7   00C0 00C0 00C0 00C0
        DECLE   $000C,  $000C,  $000C,  $000C   ; 55FB   000C 000C 000C 000C
        DECLE   $000C,  $000C,  $000C,  $000C   ; 55FF   000C 000C 000C 000C
        DECLE   $0040,  $00A0,  $0040,  $0070   ; 5603   0040 00A0 0040 0070
        DECLE   $00F8,  $00F8,  $0070,  $00A0   ; 5607   00F8 00F8 0070 00A0
        DECLE   $0004,  $000A,  $000C,  $001E   ; 560B   0004 000A 000C 001E
        DECLE   $003F,  $003F                   ; 560F   003F 003F

        COMR    R6                              ; 5611   001E
        INCR    R2                              ; 5612   000A
        MOVR    R2,     R0                      ; 5613   0090
        MOVR    R2,     R0                      ; 5614   0090
        ADDR    R6,     R0                      ; 5615   00F0
        ADDR    R6,     R0                      ; 5616   00F0
        SLR     R0,     1                       ; 5617   0060
        SLR     R0,     1                       ; 5618   0060
        ADDR    R6,     R0                      ; 5619   00F0
        ADDR    R6,     R0                      ; 561A   00F0
        INCR    R1                              ; 561B   0009
        INCR    R1                              ; 561C   0009
        INCR    R7                              ; 561D   000F
        INCR    R7                              ; 561E   000F

L_561F:
        CLRC                                    ; 561F   0006
L_5620:
        CLRC                                    ; 5620   0006
        INCR    R7                              ; 5621   000F
        INCR    R7                              ; 5622   000F

L_5623:
        SWAP    R0,     1                       ; 5623   0040
L_5624:
        SWAP    R0,     1                       ; 5624   0040
        DECLE   $00A0,  $00A0,  $0040,  $0040   ; 5625   00A0 00A0 0040 0040
        DECLE   $00A0,  $00A0,  $0004,  $0004   ; 5629   00A0 00A0 0004 0004
        DECLE   $000A,  $000A,  $0004,  $0004   ; 562D   000A 000A 0004 0004
        DECLE   $000A,  $000A,  $0040,  $0040   ; 5631   000A 000A 0040 0040
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5635   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 5639   0000 0000 0004 0004
        DECLE   $000E,  $0000,  $0000,  $0000   ; 563D   000E 0000 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0020   ; 5641   0000 0000 0070 0020
        DECLE   $00FF,  $00FE,  $00CC,  $00DC   ; 5645   00FF 00FE 00CC 00DC
        DECLE   $008E,  $00FF,  $001C,  $0008   ; 5649   008E 00FF 001C 0008
        DECLE   $00FF,  $00FE,  $0072,  $0076   ; 564D   00FF 00FE 0072 0076
        DECLE   $00E2,  $00FF,  $0000,  $0000   ; 5651   00E2 00FF 0000 0000
        DECLE   $00FF,  $00EE,  $0044,  $0044   ; 5655   00FF 00EE 0044 0044
        DECLE   $00EE,  $00FF,  $0004,  $0004   ; 5659   00EE 00FF 0004 0004
        DECLE   $000A,  $000A,  $0004,  $0004   ; 565D   000A 000A 0004 0004
        DECLE   $000A,  $000A,  $000C,  $0012   ; 5661   000A 000A 000C 0012
        DECLE   $0037,  $0023,  $003F,  $0004   ; 5665   0037 0023 003F 0004
        DECLE   $000A,  $000A,  $0004,  $0004   ; 5669   000A 000A 0004 0004
        DECLE   $000A,  $000A,  $0004,  $0004   ; 566D   000A 000A 0004 0004
        DECLE   $000A,  $000A,  $000C,  $0012   ; 5671   000A 000A 000C 0012
        DECLE   $0037,  $0023,  $003F,  $0004   ; 5675   0037 0023 003F 0004
        DECLE   $000A,  $000A,  $0040,  $0040   ; 5679   000A 000A 0040 0040
        DECLE   $00A0,  $00A0,  $0040,  $0040   ; 567D   00A0 00A0 0040 0040
        DECLE   $00A0,  $00A0,  $0030,  $0048   ; 5681   00A0 00A0 0030 0048
        DECLE   $00DC,  $008C,  $00FC,  $0040   ; 5685   00DC 008C 00FC 0040
        DECLE   $00A0,  $00A0,  $0004,  $0004   ; 5689   00A0 00A0 0004 0004
        DECLE   $000A,  $000A,  $0004,  $0004   ; 568D   000A 000A 0004 0004
        DECLE   $000A,  $000A,  $000C,  $0012   ; 5691   000A 000A 000C 0012
        DECLE   $0037,  $0023,  $003F,  $0004   ; 5695   0037 0023 003F 0004

        INCR    R2                              ; 5699   000A
        INCR    R2                              ; 569A   000A
        SWAP    R0,     1                       ; 569B   0040
        SWAP    R0,     1                       ; 569C   0040
        MOVR    R4,     R0                      ; 569D   00A0
        MOVR    R4,     R0                      ; 569E   00A0
        SWAP    R0,     1                       ; 569F   0040
        SWAP    R0,     1                       ; 56A0   0040
        MOVR    R4,     R0                      ; 56A1   00A0
        MOVR    R4,     R0                      ; 56A2   00A0
        GSWD    R0                              ; 56A3   0030
        SLL     R0,     1                       ; 56A4   0048
        ADDR    R3,     R4                      ; 56A5   00DC
        MOVR    R1,     R4                      ; 56A6   008C
        ADDR    R7,     R4                      ; 56A7   00FC
        SWAP    R0,     1                       ; 56A8   0040
        MOVR    R4,     R0                      ; 56A9   00A0
        MOVR    R4,     R0                      ; 56AA   00A0
        SWAP    R0,     1                       ; 56AB   0040
        SWAP    R0,     1                       ; 56AC   0040
        MOVR    R4,     R0                      ; 56AD   00A0
        MOVR    R4,     R0                      ; 56AE   00A0
        SWAP    R0,     1                       ; 56AF   0040
        SWAP    R0,     1                       ; 56B0   0040
        MOVR    R4,     R0                      ; 56B1   00A0
        MOVR    R4,     R0                      ; 56B2   00A0
        GSWD    R0                              ; 56B3   0030
        SLL     R0,     1                       ; 56B4   0048
        ADDR    R3,     R4                      ; 56B5   00DC
        MOVR    R1,     R4                      ; 56B6   008C
        ADDR    R7,     R4                      ; 56B7   00FC
        SWAP    R0,     1                       ; 56B8   0040
        MOVR    R4,     R0                      ; 56B9   00A0
        MOVR    R4,     R0                      ; 56BA   00A0
        ADDR    R4,     R0                      ; 56BB   00E0
        MOVR    R2,     R7                      ; 56BC   0097

        MOVR    R2,     R5                      ; 56BD   0095
        ADDR    R4,     R5                      ; 56BE   00E5
        MOVR    R2,     R5                      ; 56BF   0095
        MOVR    R2,     R7                      ; 56C0   0097

        DECLE   $00E0,  $0000,  $0000,  $004A   ; 56C1   00E0 0000 0000 004A
        DECLE   $006A,  $005A,  $004A,  $0049   ; 56C5   006A 005A 004A 0049
        DECLE   $0000,  $0000,  $0000,  $005C   ; 56C9   0000 0000 0000 005C
        DECLE   $0050,  $004C,  $0044,  $009C   ; 56CD   0050 004C 0044 009C
        DECLE   $0000,  $0000,  $00FF           ; 56D1   0000 0000 00FF

        ADDR    R0,     R3                      ; 56D4   00C3
        ADDR    R3,     R3                      ; 56D5   00DB
        ADDR    R0,     R3                      ; 56D6   00C3
        ADDR    R5,     R7                      ; 56D7   00EF

        DECLE   $0066,  $003C,  $0018,  $0003   ; 56D8   0066 003C 0018 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 56DC   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0005   ; 56E0   0003 0003 0003 0005
        DECLE   $0006,  $001E,  $001F,  $003F   ; 56E4   0006 001E 001F 003F
        DECLE   $001E,  $000A,  $000A,  $0018   ; 56E8   001E 000A 000A 0018
        DECLE   $0018,  $0018,  $0018,  $0000   ; 56EC   0018 0018 0018 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 56F0   0000 0000 0000 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 56F4   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $0000   ; 56F8   00C0 00C0 00C0 0000
        DECLE   $0000,  $0000,  $00FF,  $0024   ; 56FC   0000 0000 00FF 0024
        DECLE   $0042,  $0024,  $00FF,  $0038   ; 5700   0042 0024 00FF 0038
        DECLE   $0044,  $0092,  $0044,  $0038   ; 5704   0044 0092 0044 0038
        DECLE   $0054,  $00FF,  $00FF,  $00FF   ; 5708   0054 00FF 00FF 00FF
        DECLE   $00BB,  $00ED,  $00FF,  $0000   ; 570C   00BB 00ED 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 5710   0000 0000 0000 00FF
        DECLE   $00BB,  $00ED,  $00FF,  $0040   ; 5714   00BB 00ED 00FF 0040
        DECLE   $0040,  $00A0,  $00A0,  $00FF   ; 5718   0040 00A0 00A0 00FF
        DECLE   $00BB,  $00ED,  $00FF,  $0004   ; 571C   00BB 00ED 00FF 0004
        DECLE   $0004,  $000A,  $000A,  $00F8   ; 5720   0004 000A 000A 00F8
        DECLE   $00B8,  $00E8,  $00F8,  $0040   ; 5724   00B8 00E8 00F8 0040
        DECLE   $0040,  $00A0,  $00A0,  $001F   ; 5728   0040 00A0 00A0 001F
        DECLE   $001D,  $001E,  $001F,  $0004   ; 572C   001D 001E 001F 0004
        DECLE   $0004,  $000A,  $000A,  $00FF   ; 5730   0004 000A 000A 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5734   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 5738   0000 0000 0000 0040
        DECLE   $0040,  $00A0,  $00A0,  $0040   ; 573C   0040 00A0 00A0 0040
        DECLE   $0040,  $00A0,  $00A0,  $0004   ; 5740   0040 00A0 00A0 0004
        DECLE   $0004,  $000A,  $000A,  $0004   ; 5744   0004 000A 000A 0004
        DECLE   $0004,  $000A,  $000A,  $0040   ; 5748   0004 000A 000A 0040
        DECLE   $0040,  $00A0,  $00A0,  $0040   ; 574C   0040 00A0 00A0 0040
        DECLE   $0040,  $00E0,  $0000,  $0004   ; 5750   0040 00E0 0000 0004
        DECLE   $0004,  $000A,  $000A,  $0004   ; 5754   0004 000A 000A 0004
        DECLE   $0004,  $000E,  $0000,  $0040   ; 5758   0004 000E 0000 0040
        DECLE   $0040,  $00A0,  $00A0,  $0040   ; 575C   0040 00A0 00A0 0040
        DECLE   $00E0,  $0000,  $0000,  $0004   ; 5760   00E0 0000 0000 0004
        DECLE   $0004,  $000A,  $000A,  $0004   ; 5764   0004 000A 000A 0004
        DECLE   $000E,  $0000,  $0000,  $0063   ; 5768   000E 0000 0000 0063
        DECLE   $0063,  $0063,  $0063,  $0063   ; 576C   0063 0063 0063 0063
        DECLE   $0063,  $0063,  $0063,  $00C6   ; 5770   0063 0063 0063 00C6
        DECLE   $00C6,  $00C6,  $00C6,  $00C6   ; 5774   00C6 00C6 00C6 00C6
        DECLE   $00C6,  $00C6,  $00C6,  $0063   ; 5778   00C6 00C6 00C6 0063
        DECLE   $0063,  $0063,  $0063,  $0003   ; 577C   0063 0063 0063 0003
        DECLE   $0003,  $0003,  $0003,  $00C6   ; 5780   0003 0003 0003 00C6
        DECLE   $00C6,  $00C6,  $00C6,  $00C0   ; 5784   00C6 00C6 00C6 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00FF   ; 5788   00C0 00C0 00C0 00FF
        DECLE   $00FF,  $0083,  $0001,  $0070   ; 578C   00FF 0083 0001 0070
        DECLE   $0008,  $0000,  $0002,  $0000   ; 5790   0008 0000 0002 0000
        DECLE   $0000,  $0070,  $0008,  $0000   ; 5794   0000 0070 0008 0000
        DECLE   $0002,  $0000,  $0000,  $00FF   ; 5798   0002 0000 0000 00FF
        DECLE   $00FF,  $00AD,  $0029,  $0008   ; 579C   00FF 00AD 0029 0008
        DECLE   $0000,  $0000,  $0000,  $0080   ; 57A0   0000 0000 0000 0080
        DECLE   $00C0,  $00E0,  $0060,  $0020   ; 57A4   00C0 00E0 0060 0020
        DECLE   $0000,  $0000,  $0000,  $0001   ; 57A8   0000 0000 0000 0001
        DECLE   $0003,  $0007,  $0006,  $0004   ; 57AC   0003 0007 0006 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57B4   0000 0000 0000 0000
        DECLE   $00FC,  $00FE,  $00FF,  $0000   ; 57B8   00FC 00FE 00FF 0000
        DECLE   $0000,  $0000,  $007E,  $00FF   ; 57BC   0000 0000 007E 00FF
        DECLE   $00AD,  $0029,  $0008,  $0000   ; 57C0   00AD 0029 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $00FF   ; 57CC   0000 0000 007E 00FF
        DECLE   $00AD,  $0029,  $0008,  $0000   ; 57D0   00AD 0029 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 57D8   0000 0000 0000 00FF
        DECLE   $0080,  $0080,  $0080,  $0080   ; 57DC   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0000   ; 57E0   0080 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57E4   0000 0000 0000 0000
        DECLE   $0000                           ; 57E8   0000

        SARC    R0,     2                       ; 57E9   007C
        SARC    R3,     2                       ; 57EA   007F
        MOVR    R0,     R4                      ; 57EB   0084
        MOVR    R0,     R3                      ; 57EC   0083
        ADDR    R0,     R7                      ; 57ED   00C7

        MOVR    R0,     R3                      ; 57EE   0083
        MOVR    R0,     R3                      ; 57EF   0083
        MOVR    R0,     R7                      ; 57F0   0087
        ADDR    R1,     R7                      ; 57F1   00CF

        DECLE   $00C3,  $0000,  $0000,  $0000   ; 57F2   00C3 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 57F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $00B0   ; 57FA   0000 0000 00E0 00B0
        DECLE   $00FF,  $00F5,  $00E0,  $006A   ; 57FE   00FF 00F5 00E0 006A
        DECLE   $003F,  $0000,  $0000,  $0000   ; 5802   003F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5806   0000 0000 0000 0000
        DECLE   $0000                           ; 580A   0000

        ADDR    R4,     R3                      ; 580B   00E3
        ADDR    R5,     R7                      ; 580C   00EF

        ADDR    R7,     R5                      ; 580D   00FD
        ADDR    R6,     R4                      ; 580E   00F4
        ADDR    R4,     R0                      ; 580F   00E0
        RRC     R0,     1                       ; 5810   0070
        RSWD    R2                              ; 5811   003A
        INCR    R7                              ; 5812   000F

        ADCR    R0                              ; 5813   0028
L_5814:
        RSWD    R0                              ; 5814   0038
        RSWD    R0                              ; 5815   0038
        RSWD    R0                              ; 5816   0038
        ADCR    R0                              ; 5817   0028
        RSWD    R0                              ; 5818   0038
        RSWD    R0                              ; 5819   0038
        RSWD    R0                              ; 581A   0038
        ADCR    R0                              ; 581B   0028
        RSWD    R0                              ; 581C   0038
        RSWD    R0                              ; 581D   0038
        RSWD    R4                              ; 581E   003C
        NOP                                     ; 581F   0034
        NOP                                     ; 5820   0034
        RSWD    R4                              ; 5821   003C
        COMR    R0                              ; 5822   0018
        DIS                                     ; 5823   0003
        ADDR    R0,     R1                      ; 5824   00C1
        MOVR    R0,     R1                      ; 5825   0081
        MOVR    R0,     R7                      ; 5826   0087

        DECLE   $00E2,  $0042,  $004E,  $0074   ; 5827   00E2 0042 004E 0074
        DECLE   $002C,  $003C,  $0038,  $003C   ; 582B   002C 003C 0038 003C
        DECLE   $0034,  $0034,  $003C,  $0018   ; 582F   0034 0034 003C 0018
        DECLE   $000C,  $001E,  $003D,  $003F   ; 5833   000C 001E 003D 003F
        DECLE   $0007,  $000A,  $001C,  $001C   ; 5837   0007 000A 001C 001C
        DECLE   $001E,  $000E,  $0006,  $0063   ; 583B   001E 000E 0006 0063
        DECLE   $00E3,  $0063,  $0061,  $0073   ; 583F   00E3 0063 0061 0073
        DECLE   $0018,  $003C,  $007A,  $007E   ; 5843   0018 003C 007A 007E
        DECLE   $000E,  $0014,  $0030,  $0030   ; 5847   000E 0014 0030 0030
        DECLE   $0030,  $0034,  $003E,  $0037   ; 584B   0030 0034 003E 0037
        DECLE   $0030,  $0030,  $0010,  $0030   ; 584F   0030 0030 0010 0030
        DECLE   $0000                           ; 5853   0000

        GSWD    R0                              ; 5854   0030
        SARC    R0,     1                       ; 5855   0078
        ADDR    R6,     R4                      ; 5856   00F4
        ADDR    R7,     R4                      ; 5857   00FC
        COMR    R4                              ; 5858   001C
        MOVR    R1,     R0                      ; 5859   0088
        ADDR    R0,     R0                      ; 585A   00C0
        ADDR    R0,     R0                      ; 585B   00C0
        ADDR    R0,     R0                      ; 585C   00C0
        ADDR    R0,     R0                      ; 585D   00C0
        ADDR    R1,     R4                      ; 585E   00CC
        ADDR    R3,     R4                      ; 585F   00DC
        ADDR    R1,     R6                      ; 5860   00CE
        SWAP    R2,     2                       ; 5861   0046
        ADDR    R0,     R7                      ; 5862   00C7

        DECLE   $0018,  $003C,  $007A,  $007E   ; 5863   0018 003C 007A 007E
        DECLE   $000E,  $0024,  $0060,  $0060   ; 5867   000E 0024 0060 0060
        DECLE   $007C,  $003A,  $0000,  $0000   ; 586B   007C 003A 0000 0000

        RSWD    R0                              ; 586F   0038
        RSWD    R0                              ; 5870   0038
        COMR    R0                              ; 5871   0018
        COMR    R4                              ; 5872   001C
        MOVR    R0,     R6                      ; 5873   0086
        MOVR    R1,     R7                      ; 5874   008F

        DECLE   $00D6,  $005F,  $0069,  $0036   ; 5875   00D6 005F 0069 0036
        DECLE   $0016,  $0000,  $0000,  $0000   ; 5879   0016 0000 0000 0000
        DECLE   $0039,  $0039,  $0060,  $0060   ; 587D   0039 0039 0060 0060
        DECLE   $00C0,  $0000,  $0006,  $000F   ; 5881   00C0 0000 0006 000F
        DECLE   $0016,  $001F,  $0089,  $0096   ; 5885   0016 001F 0089 0096
        DECLE   $00F6,  $0060,  $0000,  $0000   ; 5889   00F6 0060 0000 0000
        DECLE   $0010,  $0079,  $00F0,  $00C0   ; 588D   0010 0079 00F0 00C0
        DECLE   $0000,  $0000,  $0043,  $00E3   ; 5891   0000 0000 0043 00E3
        DECLE   $00D3,  $00F6,  $00EE,  $00DC   ; 5895   00D3 00F6 00EE 00DC
        DECLE   $005C,  $0008,  $0000,  $0000   ; 5899   005C 0008 0000 0000
        DECLE   $0000,  $0008,  $001C,  $001E   ; 589D   0000 0008 001C 001E
        DECLE   $0006,  $0003,  $0020,  $0070   ; 58A1   0006 0003 0020 0070
        DECLE   $0068,  $007B,  $007B,  $0043   ; 58A5   0068 007B 007B 0043
        DECLE   $001E,  $001E,  $000C,  $0000   ; 58A9   001E 001E 000C 0000
        DECLE   $000E,  $001E,  $001B,  $0000   ; 58AD   000E 001E 001B 0000
        DECLE   $0000,  $0000                   ; 58B1   0000 0000

        DECR    R0                              ; 58B3   0010
        RSWD    R1                              ; 58B4   0039
        GSWD    R1                              ; 58B5   0031
        RSWD    R5                              ; 58B6   003D
        RSWD    R1                              ; 58B7   0039
        ADDR    R4,     R7                      ; 58B8   00E7

        ADDR    R5,     R6                      ; 58B9   00EE
        ADDR    R1,     R5                      ; 58BA   00CD
        MOVR    R0,     R3                      ; 58BB   0083
        MOVR    R0,     R7                      ; 58BC   0087

        DECLE   $00CE,  $006C,  $00E8,  $00C0   ; 58BD   00CE 006C 00E8 00C0
        DECLE   $0080,  $0080,  $0000,  $0000   ; 58C1   0080 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 58C5   0000 0000 0000 0018
        DECLE   $0010,  $0030,  $0038,  $0038   ; 58C9   0010 0030 0038 0038
        DECLE   $0030,  $0010,  $0000,  $0000   ; 58CD   0030 0010 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0004   ; 58D1   0000 0000 0002 0004
        DECLE   $003C,  $003E,  $007E,  $003C   ; 58D5   003C 003E 007E 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 58D9   0018 0000 0000 0000
        DECLE   $0000,  $00C0,  $00E0,  $007E   ; 58DD   0000 00C0 00E0 007E
        DECLE   $003C,  $0000,  $001B,  $007C   ; 58E1   003C 0000 001B 007C
        DECLE   $00FF,  $004F,  $0001,  $0000   ; 58E5   00FF 004F 0001 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 58E9   0000 0000 0000 000C
        DECLE   $001E,  $001E,  $000C,  $0000   ; 58ED   001E 001E 000C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58F1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0078   ; 58F5   0000 0000 00F0 0078
        DECLE   $003D,  $00BA,  $00FE,  $00FF   ; 58F9   003D 00BA 00FE 00FF
        DECLE   $00FC,  $0078,  $0030,  $0000   ; 58FD   00FC 0078 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5901   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5905   0000 0000 0000 0000
        DECLE   $000C,  $009A,  $00FF,  $00FE   ; 5909   000C 009A 00FF 00FE
        DECLE   $00FC,  $00F8,  $0078,  $0070   ; 590D   00FC 00F8 0078 0070
        DECLE   $00F0,  $00E0,  $0000,  $0000   ; 5911   00F0 00E0 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0078   ; 5915   0000 0000 00F0 0078
        DECLE   $003D,  $00BA,  $00FE,  $00FF   ; 5919   003D 00BA 00FE 00FF
        DECLE   $00FC,  $0078,  $0030,  $0000   ; 591D   00FC 0078 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5921   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5925   0000 0000 0000 0000
        DECLE   $000C,  $009A,  $00FF,  $00FE   ; 5929   000C 009A 00FF 00FE
        DECLE   $00FC,  $00F8,  $0078,  $0070   ; 592D   00FC 00F8 0078 0070
        DECLE   $00F0,  $00E0,  $00BD,  $0099   ; 5931   00F0 00E0 00BD 0099
        DECLE   $0099,  $00DB,  $00DB,  $00FF   ; 5935   0099 00DB 00DB 00FF
        DECLE   $00FF,  $00FF,  $007E,  $007E   ; 5939   00FF 00FF 007E 007E
        DECLE   $003C,  $0018,  $0018,  $003C   ; 593D   003C 0018 0018 003C
        DECLE   $003C,  $0018,  $00BD,  $0099   ; 5941   003C 0018 00BD 0099
        DECLE   $0099,  $00DB,  $00DB,  $00FF   ; 5945   0099 00DB 00DB 00FF
        DECLE   $00FF,  $00FF,  $007E,  $007E   ; 5949   00FF 00FF 007E 007E
        DECLE   $003C,  $0018,  $0018,  $003C   ; 594D   003C 0018 0018 003C
        DECLE   $003C,  $0018,  $0000,  $0000   ; 5951   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0038,  $0074   ; 5955   0000 0000 0038 0074
        DECLE   $00E0,  $00E0,  $00E0,  $00F0   ; 5959   00E0 00E0 00E0 00F0
        DECLE   $00F0,  $0090,  $0000,  $0000   ; 595D   00F0 0090 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5961   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0068   ; 5965   0000 0000 0070 0068
        DECLE   $0048,  $0048,  $004C,  $0048   ; 5969   0048 0048 004C 0048
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5971   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 5975   0000 0000 0000 00E0
        DECLE   $0070,  $0030,  $0038,  $0038   ; 5979   0070 0030 0038 0038
        DECLE   $0038,  $0030,  $0020,  $0000   ; 597D   0038 0030 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5981   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0058   ; 5985   0000 0000 0070 0058
        DECLE   $0018,  $0018,  $0000,  $0040   ; 5989   0018 0018 0000 0040
        DECLE   $0078,  $0078,  $0040,  $0000   ; 598D   0078 0078 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5991   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0012   ; 5995   0000 0000 0000 0012
        DECLE   $0012,  $003F,  $001E,  $001E   ; 5999   0012 003F 001E 001E
        DECLE   $000C,  $000C,  $0000,  $0000   ; 599D   000C 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0020   ; 59A5   0000 0000 0010 0020
        DECLE   $0020,  $0070,  $0078,  $0078   ; 59A9   0020 0070 0078 0078
        DECLE   $0078,  $0070,  $0020,  $0020   ; 59AD   0078 0070 0020 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 59B5   0000 0000 0000 0038
        DECLE   $0060,  $00E0,  $00F0,  $00F8   ; 59B9   0060 00E0 00F0 00F8
        DECLE   $0070,  $0020,  $0000,  $0000   ; 59BD   0070 0020 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; 59C1   0000 0000 0002 0000
        DECLE   $0004,  $019D,  $015C,  $0310   ; 59C5   0004 019D 015C 0310
        DECLE   $0069,  $0000,  $0000,  $0000   ; 59C9   0069 0000 0000 0000
        DECLE   $0000,  $0002,  $0004,  $0004   ; 59CD   0000 0002 0004 0004
        DECLE   $019D,  $015C,  $0310,  $0069   ; 59D1   019D 015C 0310 0069
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D5   0000 0000 0000 0000
        DECLE   $0002,  $0024,  $0004,  $019D   ; 59D9   0002 0024 0004 019D
        DECLE   $015C,  $0310,  $0069,  $0000   ; 59DD   015C 0310 0069 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 59E1   0000 0000 0000 0002
        DECLE   $0028,  $0004,  $019D,  $015C   ; 59E5   0028 0004 019D 015C
        DECLE   $0310,  $0069,  $0041,  $0018   ; 59E9   0310 0069 0041 0018
        DECLE   $00BF,  $0059,  $0000,  $0000   ; 59ED   00BF 0059 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F1   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 59F5   0000 0001 0000 0000
        DECLE   $0018,  $0049,  $0042,  $0018   ; 59F9   0018 0049 0042 0018
        DECLE   $00BF,  $0059,  $0000,  $0000   ; 59FD   00BF 0059 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A01   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0002,  $0000   ; 5A05   0000 0001 0002 0000
        DECLE   $001C,  $0071,  $0041,  $0018   ; 5A09   001C 0071 0041 0018
        DECLE   $00D5,  $0059,  $0000,  $0000   ; 5A0D   00D5 0059 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A11   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0040,  $0000   ; 5A15   0000 0001 0040 0000
        DECLE   $0010,  $0037,  $0057,  $0018   ; 5A19   0010 0037 0057 0018
        DECLE   $00D5,  $0059,  $0000,  $0000   ; 5A1D   00D5 0059 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A21   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0008,  $0000   ; 5A25   0000 0001 0008 0000

        COMR    R0                              ; 5A29   0018
        SLL     R0,     1                       ; 5A2A   0048
        MOVR    R0,     R7                      ; 5A2B   0087

        DECLE   $0018,  $008C,  $005A,  $0000   ; 5A2C   0018 008C 005A 0000
        DECLE   $0068,  $0000,  $0000,  $0000   ; 5A30   0068 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0043   ; 5A38   0000 0000 0000 0043
        DECLE   $0018,  $0071,  $005A,  $0000   ; 5A3C   0018 0071 005A 0000
        DECLE   $0028,  $0000,  $005E,  $0000   ; 5A40   0028 0000 005E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A44   0000 0000 0000 0000
        DECLE   $0000,  $005E,  $0028,  $0047   ; 5A48   0000 005E 0028 0047
        DECLE   $0018,  $0055,  $005A,  $0000   ; 5A4C   0018 0055 005A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A54   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $002C,  $0000   ; 5A58   0000 0004 002C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A5C   0000 0000 0000 0000
        DECLE   $0002,  $0036,  $0000,  $0000   ; 5A60   0002 0036 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5A64   0000 0000 0000 0001
        DECLE   $0034,  $0000,  $0000,  $0000   ; 5A68   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $001A   ; 5A6C   0000 0000 0001 001A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A70   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0008,  $0000   ; 5A74   0000 0004 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A78   0000 0000 0000 0000
        DECLE   $0002,  $0014,  $0000,  $0000   ; 5A7C   0002 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5A80   0000 0000 0000 0002
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5A84   0010 0000 0000 0000
        DECLE   $001F,  $0061,  $0001,  $0018   ; 5A88   001F 0061 0001 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8C   0000 0000 0000 0000
        DECLE   $0000,  $001F,  $0002,  $0310   ; 5A90   0000 001F 0002 0310
        DECLE   $0069,  $0000,  $0000,  $0000   ; 5A94   0069 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0000   ; 5A98   0000 0000 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A9C   0000 0000 0000 0000
        DECLE   $0000,  $001D,  $0000,  $0000   ; 5AA0   0000 001D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA4   0000 0000 0000 0000
        DECLE   $001E,  $0000                   ; 5AA8   001E 0000
L_5AAA:
        PSHR    R5                              ; 5AAA   0275
        MVI     G_017A, R2                      ; 5AAB   0282 017A
        TSTR    R2                              ; 5AAD   0092
        BEQ     L_5ADD                          ; 5AAE   0204 002D

        CMPI    #$0008, R2                      ; 5AB0   037A 0008
        BGT     L_5ADD                          ; 5AB2   020E 0029

        MVII    #$0001, R0                      ; 5AB4   02B8 0001
        MVO     R0,     G_019D                  ; 5AB6   0240 019D
        MVI     G_0175, R0                      ; 5AB8   0280 0175
        CMPI    #$000A, R0                      ; 5ABA   0378 000A
        BNEQ    L_5ADD                          ; 5ABC   020C 001F
        J       L_6BF1                          ; 5ABE   0004 0368 03F1

L_5AC1:
        PSHR    R5                              ; 5AC1   0275
        MVI     G_0175, R0                      ; 5AC2   0280 0175
        CMPI    #$000A, R0                      ; 5AC4   0378 000A
        BGT     L_5ADD                          ; 5AC6   020E 0015

        MVII    #$020E, R2                      ; 5AC8   02BA 020E
        MVI     G_017A, R3                      ; 5ACA   0283 017A
        CMPI    #$0008, R3                      ; 5ACC   037B 0008
        BGT     L_5ADD                          ; 5ACE   020E 000D
        BNEQ    L_5AD4                          ; 5AD0   020C 0002

        MVII    #$0210, R2                      ; 5AD2   02BA 0210
L_5AD4:
        MVI@    R2,     R3                      ; 5AD4   0293
        XORI    #$0005, R3                      ; 5AD5   03FB 0005
        MVO@    R3,     R2                      ; 5AD7   0253
        INCR    R2                              ; 5AD8   000A
        MVI@    R2,     R3                      ; 5AD9   0293
        XORI    #$0005, R3                      ; 5ADA   03FB 0005
        MVO@    R3,     R2                      ; 5ADC   0253
L_5ADD:
        PULR    R7                              ; 5ADD   02B7

L_5ADE:
        PSHR    R5                              ; 5ADE   0275
        MVI     G_019B, R0                      ; 5ADF   0280 019B
        TSTR    R0                              ; 5AE1   0080
        BEQ     L_5B27                          ; 5AE2   0204 0043

        MVI     G_0165, R2                      ; 5AE4   0282 0165
        MVII    #$0168, R3                      ; 5AE6   02BB 0168
        ADDR    R2,     R3                      ; 5AE8   00D3
        ADDR    R2,     R3                      ; 5AE9   00D3
        ADDR    R2,     R3                      ; 5AEA   00D3
        ADDI    #$0163, R2                      ; 5AEB   02FA 0163
        CLRR    R1                              ; 5AED   01C9
        MVO     R1,     G_019B                  ; 5AEE   0241 019B
        MVII    #$0064, R4                      ; 5AF0   02BC 0064
        ADD@    R3,     R0                      ; 5AF2   02D8
        CMPI    #$0050, R0                      ; 5AF3   0378 0050
        BLT     L_5B05                          ; 5AF5   0205 000E

        SDBD                                    ; 5AF7   0001
        ADD@    R2,     R1                      ; 5AF8   02D1
        BNEQ    L_5B05                          ; 5AF9   020C 000A

        INCR    R1                              ; 5AFB   0009
        MVO     R1,     G_0192                  ; 5AFC   0241 0192
        MVO@    R1,     R2                      ; 5AFE   0251
        MVII    #$016E, R2                      ; 5AFF   02BA 016E
        ADD     G_0165, R2                      ; 5B01   02C2 0165
        ADD@    R2,     R1                      ; 5B03   02D1
        MVO@    R1,     R2                      ; 5B04   0251
L_5B05:
        CLRR    R1                              ; 5B05   01C9
L_5B06:
        CMPR    R4,     R0                      ; 5B06   0160
        BLT     L_5B0D                          ; 5B07   0205 0004

        SUBR    R4,     R0                      ; 5B09   0120
        INCR    R1                              ; 5B0A   0009
        B       L_5B06                          ; 5B0B   0220 0006

L_5B0D:
        MVO@    R0,     R3                      ; 5B0D   0258
        INCR    R3                              ; 5B0E   000B
        ADD@    R3,     R1                      ; 5B0F   02D9
        MOVR    R1,     R0                      ; 5B10   0088
        CLRR    R1                              ; 5B11   01C9
L_5B12:
        CMPR    R4,     R0                      ; 5B12   0160
        BLT     L_5B19                          ; 5B13   0205 0004

        INCR    R1                              ; 5B15   0009
        SUBR    R4,     R0                      ; 5B16   0120
        B       L_5B12                          ; 5B17   0220 0006

L_5B19:
        MVO@    R0,     R3                      ; 5B19   0258
        MVO     R3,     G_019C                  ; 5B1A   0243 019C
        MVI     G_0192, R3                      ; 5B1C   0283 0192
        TSTR    R3                              ; 5B1E   009B
        BEQ     L_5B27                          ; 5B1F   0204 0006

        JSR     R5,     L_5B28                  ; 5B21   0004 0158 0328

        CLRR    R0                              ; 5B24   01C0
        MVO     R0,     G_0192                  ; 5B25   0240 0192
L_5B27:
        PULR    R7                              ; 5B27   02B7

L_5B28:
        PSHR    R5                              ; 5B28   0275
        MVI     G_0165, R0                      ; 5B29   0280 0165
        MVII    #$0007, R3                      ; 5B2B   02BB 0007
        TSTR    R0                              ; 5B2D   0080
        BEQ     L_5B32                          ; 5B2E   0204 0002

        MVII    #$0002, R3                      ; 5B30   02BB 0002
L_5B32:
        MVII    #$0001, R1                      ; 5B32   02B9 0001
        MVI     G_016E, R0                      ; 5B34   0280 016E
        MVII    #$02DD, R4                      ; 5B36   02BC 02DD

        JSR     R5,     X_PRNUM_RGT             ; 5B38   0004 0118 00C5

        MVII    #$0001, R1                      ; 5B3B   02B9 0001
        CMP     G_0161, R1                      ; 5B3D   0341 0161
        BNEQ    L_5B4A                          ; 5B3F   020C 0009

        XORI    #$0005, R3                      ; 5B41   03FB 0005
        MVII    #$02EE, R4                      ; 5B43   02BC 02EE
        MVI     G_016F, R0                      ; 5B45   0280 016F

        JSR     R5,     X_PRNUM_RGT             ; 5B47   0004 0118 00C5

L_5B4A:
        PULR    R7                              ; 5B4A   02B7

L_5B4B:
        MVI     G_0165, R0                      ; 5B4B   0280 0165
        PSHR    R5                              ; 5B4D   0275
        SDBD                                    ; 5B4E   0001
        MVII    #$3881, R2                      ; 5B4F   02BA 0081 0038
        MVII    #$0168, R4                      ; 5B52   02BC 0168
        ADDR    R0,     R4                      ; 5B54   00C4
        ADDR    R0,     R4                      ; 5B55   00C4
        ADDR    R0,     R4                      ; 5B56   00C4
        MVI@    R4,     R3                      ; 5B57   02A3
        PSHR    R4                              ; 5B58   0274

        JSR     R5,     L_5B82                  ; 5B59   0004 0158 0382

        PULR    R4                              ; 5B5C   02B4
        SDBD                                    ; 5B5D   0001
        MVII    #$3879, R2                      ; 5B5E   02BA 0079 0038
        MVI@    R4,     R3                      ; 5B61   02A3

        JSR     R5,     L_5B82                  ; 5B62   0004 0158 0382

        CLRR    R0                              ; 5B65   01C0
        MVO     R0,     G_019C                  ; 5B66   0240 019C
        PULR    R7                              ; 5B68   02B7

        ADDR    R4,     R2                      ; 5B69   00E2
        MOVR    R4,     R6                      ; 5B6A   00A6
        MOVR    R4,     R2                      ; 5B6B   00A2
        MOVR    R4,     R2                      ; 5B6C   00A2
        ADDR    R4,     R2                      ; 5B6D   00E2
        ADDR    R5,     R6                      ; 5B6E   00EE
        NEGR    R2                              ; 5B6F   0022
        ADDR    R5,     R6                      ; 5B70   00EE
        MOVR    R0,     R2                      ; 5B71   0082
        ADDR    R5,     R6                      ; 5B72   00EE
        MOVR    R5,     R6                      ; 5B73   00AE
        MOVR    R5,     R0                      ; 5B74   00A8
        ADDR    R5,     R6                      ; 5B75   00EE
        NEGR    R2                              ; 5B76   0022
        ADCR    R6                              ; 5B77   002E
        ADDR    R5,     R6                      ; 5B78   00EE
        MOVR    R0,     R2                      ; 5B79   0082
        ADDR    R4,     R2                      ; 5B7A   00E2
        TSTR    R4                              ; 5B7B   00A4
        ADDR    R5,     R0                      ; 5B7C   00E8
        ADDR    R5,     R6                      ; 5B7D   00EE
        MOVR    R5,     R2                      ; 5B7E   00AA
        ADDR    R5,     R6                      ; 5B7F   00EE
        MOVR    R4,     R2                      ; 5B80   00A2
        ADDR    R4,     R2                      ; 5B81   00E2
L_5B82:
        PSHR    R5                              ; 5B82   0275
        SDBD                                    ; 5B83   0001
        MVII    #$5B69, R5                      ; 5B84   02BD 0069 005B
        MOVR    R5,     R4                      ; 5B87   00AC
        CLRR    R0                              ; 5B88   01C0
        CLRR    R1                              ; 5B89   01C9
L_5B8A:
        CMPI    #$0014, R3                      ; 5B8A   037B 0014
        BLT     L_5B94                          ; 5B8C   0205 0006

        SUBI    #$0014, R3                      ; 5B8E   033B 0014
        ADDI    #$0005, R4                      ; 5B90   02FC 0005
        B       L_5B8A                          ; 5B92   0220 0009

L_5B94:
        CMPI    #$000A, R3                      ; 5B94   037B 000A
        BLT     L_5B9C                          ; 5B96   0205 0004

        SUBI    #$000A, R3                      ; 5B98   033B 000A
        MVII    #$0001, R0                      ; 5B9A   02B8 0001
L_5B9C:
        SARC    R3,     1                       ; 5B9C   007B
        RLC     R1,     1                       ; 5B9D   0051
        ADDR    R3,     R5                      ; 5B9E   00DD
        SLL     R3,     2                       ; 5B9F   004F
        ADDR    R3,     R5                      ; 5BA0   00DD
        MVII    #$0005, R3                      ; 5BA1   02BB 0005
L_5BA3:
        PSHR    R3                              ; 5BA3   0273
        MVI@    R4,     R3                      ; 5BA4   02A3
        TSTR    R0                              ; 5BA5   0080
        BEQ     L_5BAA                          ; 5BA6   0204 0002

        SLL     R3,     2                       ; 5BA8   004F
        SLL     R3,     2                       ; 5BA9   004F
L_5BAA:
        ANDI    #$00F0, R3                      ; 5BAA   03BB 00F0
        PSHR    R3                              ; 5BAC   0273
        MVI@    R5,     R3                      ; 5BAD   02AB
        TSTR    R1                              ; 5BAE   0089
        BNEQ    L_5BB3                          ; 5BAF   020C 0002

        SLR     R3,     2                       ; 5BB1   0067
        SLR     R3,     2                       ; 5BB2   0067
L_5BB3:
        ANDI    #$000F, R3                      ; 5BB3   03BB 000F
        XOR@    R6,     R3                      ; 5BB5   03F3
        MVO@    R3,     R2                      ; 5BB6   0253
        INCR    R2                              ; 5BB7   000A
        PULR    R3                              ; 5BB8   02B3
        DECR    R3                              ; 5BB9   0013
        BNEQ    L_5BA3                          ; 5BBA   022C 0018
        PULR    R7                              ; 5BBC   02B7

        INCR    R0                              ; 5BBD   0008
        SLR     R0,     1                       ; 5BBE   0060
        BMI     L_5BC2                          ; 5BBF   020B 0001

        SLLC    R2,     1                       ; 5BC1   005A
L_5BC2:
        COMR    R1                              ; 5BC2   0019
        DECLE   $0028,  $002C,  $0255,  $0012   ; 5BC3   0028 002C 0255 0012
        DECLE   $0052,  $0019,  $0028,  $0048   ; 5BC7   0052 0019 0028 0048
        DECLE   $0258,  $0001,  $005A,  $0019   ; 5BCB   0258 0001 005A 0019
        DECLE   $0028,  $0064,  $025C,  $0012   ; 5BCF   0028 0064 025C 0012
        DECLE   $0052,  $0019,  $0040,  $0058   ; 5BD3   0052 0019 0040 0058
        DECLE   $0296,  $0003,  $0000,  $0000   ; 5BD7   0296 0003 0000 0000
        DECLE   $03FF,  $0030,  $0034,  $026A   ; 5BDB   03FF 0030 0034 026A
        DECLE   $0011,  $00AD,  $0018,  $0030   ; 5BDF   0011 00AD 0018 0030
        DECLE   $0071,  $0271,  $0001,  $00B5   ; 5BE3   0071 0271 0001 00B5
        DECLE   $0018,  $03FF                   ; 5BE7   0018 03FF

        INCR    R0                              ; 5BE9   0008
        SLR     R0,     1                       ; 5BEA   0060
        BMI     L_5BEE                          ; 5BEB   020B 0001

        ADDR    R2,     R6                      ; 5BED   00D6
L_5BEE:
        INCR    R0                              ; 5BEE   0008
        DECLE   $0028,  $0040,  $0257,  $0001   ; 5BEF   0028 0040 0257 0001
        DECLE   $00D6,  $0008,  $0028,  $0058   ; 5BF3   00D6 0008 0028 0058
        DECLE   $025A,  $0001,  $00D6,  $0008   ; 5BF7   025A 0001 00D6 0008
        DECLE   $0030,  $0028,  $0268,  $0001   ; 5BFB   0030 0028 0268 0001
        DECLE   $00D6,  $0008,  $03FF           ; 5BFF   00D6 0008 03FF

        INCR    R0                              ; 5C02   0008
        SLR     R0,     1                       ; 5C03   0060
        BMI     L_5C07                          ; 5C04   020B 0001

        SLLC    R2,     1                       ; 5C06   005A
L_5C07:
        COMR    R1                              ; 5C07   0019
        DECLE   $03FF                           ; 5C08   03FF
L_5C09:
        PSHR    R5                              ; 5C09   0275
        MVII    #$034D, R1                      ; 5C0A   02B9 034D

        JSR     R5,     .EXEC.777               ; 5C0C   0004 0114 0377
        JSR     R5,     L_5C1C                  ; 5C0F   0004 015C 001C

        MOVR    R7,     R5                      ; 5C12   00BD
        SLLC    R3,     1                       ; 5C13   005B
        MOVR    R7,     R5                      ; 5C14   00BD
        SLLC    R3,     1                       ; 5C15   005B
        ADDR    R3,     R4                      ; 5C16   00DC
        SLLC    R3,     1                       ; 5C17   005B
        MOVR    R7,     R5                      ; 5C18   00BD
        SLLC    R3,     1                       ; 5C19   005B
        ADDR    R5,     R1                      ; 5C1A   00E9
        SLLC    R3,     1                       ; 5C1B   005B
L_5C1C:
        ADD     G_017A, R5                      ; 5C1C   02C5 017A
        SDBD                                    ; 5C1E   0001
        MVI@    R5,     R4                      ; 5C1F   02AC
        B       L_5C24                          ; 5C20   0200 0002

L_5C22:
        ADDI    #$0004, R4                      ; 5C22   02FC 0004
L_5C24:
        MVI@    R4,     R0                      ; 5C24   02A0
        CMPI    #$03FF, R0                      ; 5C25   0378 03FF
        BEQ     L_5C9C                          ; 5C27   0204 0073

        MVI@    R4,     R1                      ; 5C29   02A1
        MOVR    R0,     R5                      ; 5C2A   0085
        SUBR    R3,     R5                      ; 5C2B   011D
        BPL     L_5C2F                          ; 5C2C   0203 0001

        NEGR    R5                              ; 5C2E   0025
L_5C2F:
        CMPI    #$0004, R5                      ; 5C2F   037D 0004
        BGT     L_5C22                          ; 5C31   022E 0010

        MOVR    R2,     R5                      ; 5C33   0095
        SUBR    R1,     R5                      ; 5C34   010D
        BPL     L_5C38                          ; 5C35   0203 0001

        NEGR    R5                              ; 5C37   0025
L_5C38:
        CMPI    #$0005, R5                      ; 5C38   037D 0005
        BLE     L_5C45                          ; 5C3A   0206 0009

        CMPI    #$0008, R5                      ; 5C3C   037D 0008
        BGT     L_5C22                          ; 5C3E   022E 001D

        MVI     G_0195, R5                      ; 5C40   0285 0195
        DECR    R5                              ; 5C42   0015
        BNEQ    L_5C22                          ; 5C43   022C 0022

L_5C45:
        MOVR    R1,     R2                      ; 5C45   008A
        MOVR    R0,     R3                      ; 5C46   0083
        MVI@    R4,     R1                      ; 5C47   02A1
        MVI@    R4,     R5                      ; 5C48   02A5
        SDBD                                    ; 5C49   0001
        MVI@    R4,     R0                      ; 5C4A   02A0
        CMP@    R1,     R0                      ; 5C4B   0348
        BEQ     L_5C9C                          ; 5C4C   0204 004E

        MVO@    R0,     R1                      ; 5C4E   0248
        MOVR    R5,     R0                      ; 5C4F   00A8
        ANDI    #$0007, R5                      ; 5C50   03BD 0007
        SLR     R0,     2                       ; 5C52   0064
        SLR     R0,     2                       ; 5C53   0064
        BEQ     L_5C59                          ; 5C54   0204 0003

        CLRR    R4                              ; 5C56   01E4
        DECR    R1                              ; 5C57   0011
        MVO@    R4,     R1                      ; 5C58   024C
L_5C59:
        CLRR    R4                              ; 5C59   01E4
        MVII    #$0002, R0                      ; 5C5A   02B8 0002
        CMPR    R0,     R5                      ; 5C5C   0145
        BLT     L_5C67                          ; 5C5D   0205 0008

        MVII    #$0006, R0                      ; 5C5F   02B8 0006
        MVII    #$0007, R4                      ; 5C61   02BC 0007
        BNEQ    L_5C67                          ; 5C63   020C 0002

        MVII    #$000E, R4                      ; 5C65   02BC 000E
L_5C67:
        SWAP    R3,     1                       ; 5C67   0043
        MVO     R3,     G_0348                  ; 5C68   0243 0348
        MVII    #$0068, R3                      ; 5C6A   02BB 0068
        SWAP    R2,     1                       ; 5C6C   0042
        MVO     R2,     G_0347                  ; 5C6D   0242 0347
        XORR    R3,     R2                      ; 5C6F   01DA
        MVII    #$0345, R1                      ; 5C70   02B9 0345
        MVI@    R1,     R5                      ; 5C72   028D
        SDBD                                    ; 5C73   0001
        ANDI    #$FFF8, R5                      ; 5C74   03BD 00F8 00FF
        XORR    R0,     R5                      ; 5C77   01C5
        MVO@    R5,     R1                      ; 5C78   024D
        SDBD                                    ; 5C79   0001
        MVII    #$5A95, R5                      ; 5C7A   02BD 0095 005A
        ADDR    R4,     R5                      ; 5C7D   00E5
        MVO     R5,     G_0346                  ; 5C7E   0245 0346
        MVII    #$003F, R3                      ; 5C80   02BB 003F

        JSR     R5,     .EXEC.9A8               ; 5C82   0004 0118 01A8

        MVII    #$0004, R0                      ; 5C85   02B8 0004
        MVO     R0,     G_01A9                  ; 5C87   0240 01A9
        MVO     R0,     G_019B                  ; 5C89   0240 019B

        JSR     R5,     L_6BCA                  ; 5C8B   0004 0168 03CA

        MVII    #$000B, R1                      ; 5C8E   02B9 000B
        MVO     R1,     G_0111                  ; 5C90   0241 0111
        CLRR    R1                              ; 5C92   01C9
        MVO     R1,     G_0112                  ; 5C93   0241 0112
        NOP                                     ; 5C95   0034
        MVO     R1,     G_0113                  ; 5C96   0241 0113
        MVO     R1,     G_0114                  ; 5C98   0241 0114
        B       L_5CC6                          ; 5C9A   0200 002A
L_5C9C:
        PULR    R7                              ; 5C9C   02B7

        PSHR    R5                              ; 5C9D   0275
        MVI     G_011B, R0                      ; 5C9E   0280 011B

        JSR     R5,     .EXEC.772               ; 5CA0   0004 0114 0372

        CLRR    R4                              ; 5CA3   01E4
        MOVR    R1,     R5                      ; 5CA4   008D
        MVI@    R5,     R1                      ; 5CA5   02A9
        ANDI    #$0003, R1                      ; 5CA6   03B9 0003
        CMPI    #$0002, R1                      ; 5CA8   0379 0002
        BNEQ    L_5CAE                          ; 5CAA   020C 0002

        MVO@    R4,     R5                      ; 5CAC   026C
        INCR    R7                              ; 5CAD   000F

L_5CAE:
        INCR    R5                              ; 5CAE   000D
L_5CAF:
        MVO@    R4,     R5                      ; 5CAF   026C
        MVII    #$0068, R3                      ; 5CB0   02BB 0068
        INCR    R5                              ; 5CB2   000D
        MVO@    R4,     R5                      ; 5CB3   026C
        ADDI    #$0002, R5                      ; 5CB4   02FD 0002
        MVO@    R3,     R5                      ; 5CB6   026B

        JSR     R5,     L_6BDC                  ; 5CB7   0004 0168 03DC

        MVII    #$0004, R1                      ; 5CBA   02B9 0004
        ADD     G_01A9, R1                      ; 5CBC   02C1 01A9
        MVO     R1,     G_019B                  ; 5CBE   0241 019B
        CMPI    #$0008, R1                      ; 5CC0   0379 0008
        BGT     L_5CC6                          ; 5CC2   020E 0002

        MVO     R1,     G_01A9                  ; 5CC4   0241 01A9

L_5CC6:
        JSR     R5,     L_5ADE                  ; 5CC6   0004 0158 02DE

        MVII    #$0004, R1                      ; 5CC9   02B9 0004
        MVO     R1,     G_0102                  ; 5CCB   0241 0102
        MVII    #$0015, R1                      ; 5CCD   02B9 0015

        JSR     R5,     L_627D                  ; 5CCF   0004 0160 027D
        JSR     R5,     L_6C97                  ; 5CD2   0004 016C 0097

        PULR    R7                              ; 5CD5   02B7

        DECLE   $0025,  $0024,  $005C,  $0002   ; 5CD6   0025 0024 005C 0002
        DECLE   $0131,  $0024,  $002C,  $0000   ; 5CDA   0131 0024 002C 0000
        DECLE   $0131,  $0038,  $0040,  $0000   ; 5CDE   0131 0038 0040 0000
        DECLE   $0131,  $004C,  $0058,  $0006   ; 5CE2   0131 004C 0058 0006
        DECLE   $0231,  $0024,  $0058,  $0006   ; 5CE6   0231 0024 0058 0006
        DECLE   $003D,  $0038,  $0040,  $0000   ; 5CEA   003D 0038 0040 0000
        DECLE   $003D,  $004C,  $005C,  $0002   ; 5CEE   003D 004C 005C 0002
        DECLE   $004D,  $000C,  $0018,  $00FF   ; 5CF2   004D 000C 0018 00FF
        DECLE   $004D,  $0024,  $0054,  $0004   ; 5CF6   004D 0024 0054 0004
        DECLE   $005D,  $0028,  $0040,  $0028   ; 5CFA   005D 0028 0040 0028
        DECLE   $0065,  $0008,  $0014,  $0006   ; 5CFE   0065 0008 0014 0006
        DECLE   $0069,  $0028,  $0054,  $0016   ; 5D02   0069 0028 0054 0016
        DECLE   $0175,  $0028,  $0034,  $0000   ; 5D06   0175 0028 0034 0000

        CMPR    R6,     R5                      ; 5D0A   0175
        SWAP    R0,     1                       ; 5D0B   0040
        RLC     R0,     1                       ; 5D0C   0050
        INCR    R2                              ; 5D0D   000A
        PSHR    R5                              ; 5D0E   0275
        ADCR    R0                              ; 5D0F   0028
        RLC     R0,     1                       ; 5D10   0050
        INCR    R2                              ; 5D11   000A
        ANDR    R0,     R1                      ; 5D12   0181
L_5D13:
        DECR    R7                              ; 5D13   0017

        DECLE   $0034,  $0000,  $0281,  $0017   ; 5D14   0034 0000 0281 0017
        DECLE   $001C,  $0000,  $0281,  $0028   ; 5D18   001C 0000 0281 0028
        DECLE   $0034,  $0000                   ; 5D1C   0034 0000

        MOVR    R0,     R1                      ; 5D1E   0081
        SWAP    R0,     1                       ; 5D1F   0040
        RLC     R0,     1                       ; 5D20   0050
        INCR    R0                              ; 5D21   0008
        MOVR    R1,     R5                      ; 5D22   008D
L_5D23:
        DECR    R7                              ; 5D23   0017

        DECLE   $0034,  $0000,  $008D,  $0040   ; 5D24   0034 0000 008D 0040
        DECLE   $0054,  $0004,  $03FF,  $002D   ; 5D28   0054 0004 03FF 002D
        DECLE   $0020,  $005B,  $0002,  $0039   ; 5D2C   0020 005B 0002 0039
        DECLE   $0020,  $005B,  $0002,  $0045   ; 5D30   0020 005B 0002 0045
        DECLE   $0020,  $005B,  $0002,  $0051   ; 5D34   0020 005B 0002 0051
        DECLE   $0020,  $005B,  $0002,  $005D   ; 5D38   0020 005B 0002 005D
        DECLE   $0020,  $005B,  $0002,  $0069   ; 5D3C   0020 005B 0002 0069
        DECLE   $0020,  $005B,  $0002,  $0075   ; 5D40   0020 005B 0002 0075
        DECLE   $0020,  $005B,  $0002,  $0081   ; 5D44   0020 005B 0002 0081
        DECLE   $0020,  $005B,  $0002,  $03FF   ; 5D48   0020 005B 0002 03FF
        DECLE   $0021,  $0024,  $0045,  $0003   ; 5D4C   0021 0024 0045 0003
        DECLE   $002D,  $0024,  $0045,  $0003   ; 5D50   002D 0024 0045 0003
        DECLE   $0039,  $0024,  $003F,  $0028   ; 5D54   0039 0024 003F 0028
        DECLE   $0338,  $0041,  $0047,  $0020   ; 5D58   0338 0041 0047 0020
        DECLE   $0046,  $0024,  $0037,  $0030   ; 5D5C   0046 0024 0037 0030
        DECLE   $004C,  $000C,  $0014,  $00FF   ; 5D60   004C 000C 0014 00FF
        DECLE   $0350,  $0041,  $0047,  $0020   ; 5D64   0350 0041 0047 0020
        DECLE   $0052,  $0024,  $003F,  $0028   ; 5D68   0052 0024 003F 0028
        DECLE   $005D,  $0024,  $0037,  $0030   ; 5D6C   005D 0024 0037 0030
        DECLE   $0064,  $0008,  $0016,  $0002   ; 5D70   0064 0008 0016 0002
        DECLE   $0069,  $0024,  $003F,  $0028   ; 5D74   0069 0024 003F 0028
        DECLE   $0076,  $0024,  $0037,  $0030   ; 5D78   0076 0024 0037 0030
        DECLE   $0182,  $0010,  $0037,  $0030   ; 5D7C   0182 0010 0037 0030
        DECLE   $0282,  $0010,  $0018,  $0000   ; 5D80   0282 0010 0018 0000
        DECLE   $0282,  $0024,  $0037,  $0030   ; 5D84   0282 0024 0037 0030
        DECLE   $0082,  $0048,  $0054,  $0002   ; 5D88   0082 0048 0054 0002
        DECLE   $008D,  $0010,  $0037,  $0030   ; 5D8C   008D 0010 0037 0030
        DECLE   $008D,  $0048,  $0054,  $0002   ; 5D90   008D 0048 0054 0002
        DECLE   $03FF,  $0018,  $0138,  $0163   ; 5D94   03FF 0018 0138 0163
        DECLE   $001C,  $0163,  $037A,  $002C   ; 5D98   001C 0163 037A 002C
        DECLE   $0331,  $0040,  $0034,  $0375   ; 5D9C   0331 0040 0034 0375
        DECLE   $018F,  $0040,  $0331,  $0345   ; 5DA0   018F 0040 0331 0345
        DECLE   $0058,  $0040,  $0250,  $0058   ; 5DA4   0058 0040 0250 0058
        DECLE   $0279,  $018F,  $005A,  $0265   ; 5DA8   0279 018F 005A 0265
        DECLE   $0274,  $005C,  $0255,  $0264   ; 5DAC   0274 005C 0255 0264
        DECLE   $005E,  $0118,  $0037,  $03FF   ; 5DB0   005E 0118 0037 03FF
        DECLE   $005E,  $0120,  $0186,  $03FF   ; 5DB4   005E 0120 0186 03FF
        DECLE   $0018,  $0138,  $0069,  $0018   ; 5DB8   0018 0138 0069 0018
        DECLE   $006C,  $037A,  $0048,  $0120   ; 5DBC   006C 037A 0048 0120
        DECLE   $0033,  $0048,  $0067,  $037A   ; 5DC0   0033 0048 0067 037A
        DECLE   $014B,  $0242,  $024F,  $0058   ; 5DC4   014B 0242 024F 0058
        DECLE   $0120,  $0232,  $0058,  $0242   ; 5DC8   0120 0232 0058 0242
        DECLE   $025A,  $0058,  $0271,  $0192   ; 5DCC   025A 0058 0271 0192
        DECLE   $005B,  $0234,  $023F,  $035B   ; 5DD0   005B 0234 023F 035B
        DECLE   $025A,  $0267,  $03FF           ; 5DD4   025A 0267 03FF
L_5DD7:
        PSHR    R5                              ; 5DD7   0275

        JSR     R4,     L_5DE5                  ; 5DD8   0004 005C 01E5

        MOVR    R2,     R5                      ; 5DDB   0095
        SLLC    R1,     2                       ; 5DDC   005D
        MOVR    R2,     R5                      ; 5DDD   0095
        SLLC    R1,     2                       ; 5DDE   005D
        MOVR    R6,     R4                      ; 5DDF   00B4
        SLLC    R1,     2                       ; 5DE0   005D
        MOVR    R2,     R5                      ; 5DE1   0095
        SLLC    R1,     2                       ; 5DE2   005D
        MOVR    R7,     R0                      ; 5DE3   00B8
        SLLC    R1,     2                       ; 5DE4   005D
L_5DE5:
        ADD     G_017A, R4                      ; 5DE5   02C4 017A
        SDBD                                    ; 5DE7   0001
        MVI@    R4,     R5                      ; 5DE8   02A5
L_5DE9:
        CLRR    R4                              ; 5DE9   01E4
        NOP                                     ; 5DEA   0034
        MVO     R4,     G_01C7                  ; 5DEB   0244 01C7
        MVO     R4,     G_01C8                  ; 5DED   0244 01C8
        MVI@    R5,     R4                      ; 5DEF   02AC
        CMPI    #$03FF, R4                      ; 5DF0   037C 03FF
        BEQ     L_5E4A                          ; 5DF2   0204 0056

        MOVR    R4,     R1                      ; 5DF4   00A1
        ANDI    #$00FF, R4                      ; 5DF5   03BC 00FF
        MVO     R4,     G_019A                  ; 5DF7   0244 019A
        SUBR    R3,     R4                      ; 5DF9   011C
        BPL     L_5DFD                          ; 5DFA   0203 0001

        NEGR    R4                              ; 5DFC   0024
L_5DFD:
        CMPI    #$0002, R4                      ; 5DFD   037C 0002
        BLE     L_5E09                          ; 5DFF   0206 0008

        CMP     G_019A, R3                      ; 5E01   0343 019A
        BLT     L_5E4A                          ; 5E03   0205 0045

        ADDI    #$0002, R5                      ; 5E05   02FD 0002
        B       L_5DE9                          ; 5E07   0220 001F

L_5E09:
        XOR     G_019A, R1                      ; 5E09   03C1 019A
        BEQ     L_5E1A                          ; 5E0B   0204 000D

        SWAP    R1,     1                       ; 5E0D   0041
        MVO     R1,     G_01C7                  ; 5E0E   0241 01C7
        MVII    #$01C1, R4                      ; 5E10   02BC 01C1
        DECR    R1                              ; 5E12   0011
        BEQ     L_5E17                          ; 5E13   0204 0002

        MVII    #$01CB, R4                      ; 5E15   02BC 01CB
L_5E17:
        MVI@    R4,     R1                      ; 5E17   02A1
        MVO     R1,     G_01C8                  ; 5E18   0241 01C8
L_5E1A:
        MVI@    R5,     R4                      ; 5E1A   02AC
        ADD     G_01C8, R4                      ; 5E1B   02C4 01C8
        MOVR    R4,     R1                      ; 5E1D   00A1
        ANDI    #$00FF, R4                      ; 5E1E   03BC 00FF
        TSTR    R0                              ; 5E20   0080
        BNEQ    L_5E31                          ; 5E21   020C 000E

        CMPR    R2,     R4                      ; 5E23   0154
        MVI@    R5,     R4                      ; 5E24   02AC
        BGT     L_5DE9                          ; 5E25   022E 003D

        ADD     G_01C8, R4                      ; 5E27   02C4 01C8
        MOVR    R4,     R1                      ; 5E29   00A1
        ANDI    #$00FF, R4                      ; 5E2A   03BC 00FF
        CMPR    R2,     R4                      ; 5E2C   0154
        BLE     L_5DE9                          ; 5E2D   0226 0045
        B       L_5E3A                          ; 5E2F   0200 0009

L_5E31:
        MVI@    R5,     R0                      ; 5E31   02A8
        CMPR    R2,     R4                      ; 5E32   0154
        BGE     L_5DE9                          ; 5E33   022D 004B

        ANDI    #$00FF, R0                      ; 5E35   03B8 00FF
        CMPR    R2,     R0                      ; 5E37   0150
        BLT     L_5DE9                          ; 5E38   0225 0050

L_5E3A:
        MOVR    R4,     R2                      ; 5E3A   00A2
        MVI     G_01C7, R4                      ; 5E3B   0284 01C7
        MVO     R4,     G_01C3                  ; 5E3D   0244 01C3
        MVI     G_019A, R3                      ; 5E3F   0283 019A
        SWAP    R3,     1                       ; 5E41   0043
        MVO     R3,     G_0350                  ; 5E42   0243 0350
        NOP                                     ; 5E44   0034
        MVO     R3,     G_0358                  ; 5E45   0243 0358
        SWAP    R3,     1                       ; 5E47   0043
        CLRC                                    ; 5E48   0006
        PULR    R7                              ; 5E49   02B7

L_5E4A:
        SETC                                    ; 5E4A   0007
        PULR    R7                              ; 5E4B   02B7

L_5E4C:
        PSHR    R5                              ; 5E4C   0275

        JSR     R4,     L_5E5A                  ; 5E4D   0004 005C 025A

        ADDR    R2,     R6                      ; 5E50   00D6
        SLLC    R0,     2                       ; 5E51   005C
        ADDR    R2,     R6                      ; 5E52   00D6
        SLLC    R0,     2                       ; 5E53   005C
        ADCR    R3                              ; 5E54   002B
        SLLC    R1,     2                       ; 5E55   005D
        ADDR    R2,     R6                      ; 5E56   00D6
        SLLC    R0,     2                       ; 5E57   005C
        SLL     R0,     2                       ; 5E58   004C
        SLLC    R1,     2                       ; 5E59   005D
L_5E5A:
        ADD     G_017A, R4                      ; 5E5A   02C4 017A
        SDBD                                    ; 5E5C   0001
        MVI@    R4,     R5                      ; 5E5D   02A5
        DECR    R5                              ; 5E5E   0015
L_5E5F:
        CLRR    R1                              ; 5E5F   01C9
        NOP                                     ; 5E60   0034
        MVO     R1,     G_01C7                  ; 5E61   0241 01C7
        INCR    R5                              ; 5E63   000D
        MVI@    R5,     R4                      ; 5E64   02AC
        CMPI    #$03FF, R4                      ; 5E65   037C 03FF
        BEQ     L_5EB9                          ; 5E67   0204 0050

        MOVR    R4,     R1                      ; 5E69   00A1
        ANDI    #$0300, R4                      ; 5E6A   03BC 0300
        BEQ     L_5E83                          ; 5E6C   0204 0015

        CMPI    #$0300, R4                      ; 5E6E   037C 0300
        BNEQ    L_5E80                          ; 5E70   020C 000E

        PSHR    R1                              ; 5E72   0271
        MVII    #$0002, R1                      ; 5E73   02B9 0002
        MVO     R1,     G_01C7                  ; 5E75   0241 01C7
        MVI     G_01C5, R1                      ; 5E77   0281 01C5
        SLL     R1,     2                       ; 5E79   004D
        SLL     R1,     1                       ; 5E7A   0049
        ADD     G_01C4, R1                      ; 5E7B   02C1 01C4
        ADD@    R6,     R1                      ; 5E7D   02F1
        B       L_5E83                          ; 5E7E   0200 0003

L_5E80:
        ANDR    R0,     R4                      ; 5E80   0184
        BEQ     L_5E96                          ; 5E81   0204 0013

L_5E83:
        ANDI    #$00FF, R1                      ; 5E83   03B9 00FF
        MOVR    R1,     R4                      ; 5E85   008C
        SUBR    R2,     R1                      ; 5E86   0111
        BPL     L_5E8A                          ; 5E87   0203 0001

        NEGR    R1                              ; 5E89   0021
L_5E8A:
        CMPI    #$0002, R1                      ; 5E8A   0379 0002
        BLE     L_5E9A                          ; 5E8C   0206 000C

        MVI     G_01C7, R1                      ; 5E8E   0281 01C7
        TSTR    R1                              ; 5E90   0089
        BNEQ    L_5E96                          ; 5E91   020C 0003

        CMPR    R4,     R2                      ; 5E93   0162
        BLT     L_5EB9                          ; 5E94   0205 0023

L_5E96:
        ADDI    #$0002, R5                      ; 5E96   02FD 0002
        B       L_5E5F                          ; 5E98   0220 003A

L_5E9A:
        MOVR    R4,     R2                      ; 5E9A   00A2
        MVI@    R5,     R1                      ; 5E9B   02A9
        MVI@    R5,     R4                      ; 5E9C   02AC
        CMPR    R1,     R3                      ; 5E9D   014B
        BLT     L_5E5F                          ; 5E9E   0225 0040

        CMPR    R4,     R3                      ; 5EA0   0163
        BGE     L_5E5F                          ; 5EA1   022D 0043

        ANDI    #$0003, R0                      ; 5EA3   03B8 0003
        SARC    R0,     1                       ; 5EA5   0078
        MVI@    R5,     R0                      ; 5EA6   02A8
        BNEQ    L_5EAF                          ; 5EA7   020C 0006

        CMPR    R1,     R3                      ; 5EA9   014B
        BEQ     L_5EB9                          ; 5EAA   0204 000D

        MOVR    R1,     R4                      ; 5EAC   008C
        B       L_5EB2                          ; 5EAD   0200 0003

L_5EAF:
        CMPR    R4,     R3                      ; 5EAF   0163
        BEQ     L_5EB9                          ; 5EB0   0204 0007

L_5EB2:
        MOVR    R4,     R3                      ; 5EB2   00A3
        MVI     G_01C7, R4                      ; 5EB3   0284 01C7
        MVO     R4,     G_01C3                  ; 5EB5   0244 01C3
        CLRC                                    ; 5EB7   0006
        PULR    R7                              ; 5EB8   02B7

L_5EB9:
        SETC                                    ; 5EB9   0007
        PULR    R7                              ; 5EBA   02B7

        PSHR    R5                              ; 5EBB   0275
        SUB     G_0165, R1                      ; 5EBC   0301 0165
        BNEQ    L_6073                          ; 5EBE   020C 01B3

        ADD     G_0190, R1                      ; 5EC0   02C1 0190
        ADD     G_0198, R1                      ; 5EC2   02C1 0198
        BNEQ    L_6073                          ; 5EC4   020C 01AD

        TSTR    R0                              ; 5EC6   0080
        BMI     L_6058                          ; 5EC7   020B 018F

L_5EC9:
        MVI     G_0102, R1                      ; 5EC9   0281 0102
        CMPI    #$0003, R1                      ; 5ECB   0379 0003
        BGT     L_5EC9                          ; 5ECD   022E 0005

        MVII    #$034D, R1                      ; 5ECF   02B9 034D

        JSR     R5,     .EXEC.777               ; 5ED1   0004 0114 0377

        CMPI    #$0002, R0                      ; 5ED4   0378 0002
        BLT     L_5EF0                          ; 5ED6   0205 0018

        CMPI    #$0007, R0                      ; 5ED8   0378 0007
        BLT     L_5EEC                          ; 5EDA   0205 0010

        CMPI    #$000A, R0                      ; 5EDC   0378 000A
        BLT     L_5EE8                          ; 5EDE   0205 0008

        CMPI    #$000E, R0                      ; 5EE0   0378 000E
        BGT     L_5EF0                          ; 5EE2   020E 000C

        MVII    #$0003, R0                      ; 5EE4   02B8 0003
        B       L_5EF1                          ; 5EE6   0200 0009

L_5EE8:
        MVII    #$0002, R0                      ; 5EE8   02B8 0002
        B       L_5EF1                          ; 5EEA   0200 0005

L_5EEC:
        MVII    #$0001, R0                      ; 5EEC   02B8 0001
        B       L_5EF1                          ; 5EEE   0200 0001

L_5EF0:
        CLRR    R0                              ; 5EF0   01C0
L_5EF1:
        MVI     G_0193, R4                      ; 5EF1   0284 0193
        CMPR    R4,     R0                      ; 5EF3   0160
        BEQ     L_6073                          ; 5EF4   0204 017D

        MVI     G_01A6, R4                      ; 5EF6   0284 01A6
        TSTR    R4                              ; 5EF8   00A4
        BNEQ    L_5F02                          ; 5EF9   020C 0007

        MVO     R0,     G_01A7                  ; 5EFB   0240 01A7
        MVI     G_0197, R4                      ; 5EFD   0284 0197
        TSTR    R4                              ; 5EFF   00A4
        BEQ     L_5F18                          ; 5F00   0204 0016

L_5F02:
        MVO     R0,     G_0193                  ; 5F02   0240 0193
        PULR    R7                              ; 5F04   02B7

L_5F05:
        PSHR    R5                              ; 5F05   0275
L_5F06:
        MVI     G_0190, R0                      ; 5F06   0280 0190
        TSTR    R0                              ; 5F08   0080
        BNEQ    L_6073                          ; 5F09   020C 0168

        MVI     G_0193, R0                      ; 5F0B   0280 0193
        CMPI    #$00FF, R0                      ; 5F0D   0378 00FF
        BEQ     L_606A                          ; 5F0F   0204 0159

        MVII    #$034D, R1                      ; 5F11   02B9 034D

        JSR     R5,     .EXEC.777               ; 5F13   0004 0114 0377

        MVO     R0,     G_01A7                  ; 5F16   0240 01A7
L_5F18:
        SDBD                                    ; 5F18   0001
        MVII    #$5A71, R4                      ; 5F19   02BC 0071 005A
        MVI@    R1,     R5                      ; 5F1C   028D
        SDBD                                    ; 5F1D   0001
        ANDI    #$187F, R5                      ; 5F1E   03BD 007F 0018
        NOP                                     ; 5F21   0034
        SARC    R0,     1                       ; 5F22   0078
        BC      L_600A                          ; 5F23   0201 00E5

        MVI     G_0191, R1                      ; 5F25   0281 0191
        TSTR    R1                              ; 5F27   0089
        BNEQ    L_5F48                          ; 5F28   020C 001E

        SWAP    R0,     1                       ; 5F2A   0040
        SLL     R0,     1                       ; 5F2B   0048
        XORR    R0,     R5                      ; 5F2C   01C5
        MVO     R5,     G_034D                  ; 5F2D   0245 034D
        MVO     R4,     G_034E                  ; 5F2F   0244 034E
        ADDI    #$0004, R5                      ; 5F31   02FD 0004
        MVO     R5,     G_0355                  ; 5F33   0245 0355
        SUBI    #$001C, R4                      ; 5F35   033C 001C
        MVO     R4,     G_0356                  ; 5F37   0244 0356
        CLRR    R5                              ; 5F39   01ED
        MVO     R5,     G_0359                  ; 5F3A   0245 0359

        JSR     R5,     L_5DD7                  ; 5F3C   0004 015C 01D7

        BC      L_622D                          ; 5F3F   0201 02EC

        SWAP    R1,     1                       ; 5F41   0041
        ANDI    #$0003, R1                      ; 5F42   03B9 0003
        MVO     R1,     G_01A5                  ; 5F44   0241 01A5
        B       L_604F                          ; 5F46   0200 0107

L_5F48:
        ADDI    #$0007, R4                      ; 5F48   02FC 0007
        TSTR    R0                              ; 5F4A   0080
        MVI     G_0195, R0                      ; 5F4B   0280 0195
        BEQ     L_5F76                          ; 5F4D   0204 0027

        INCR    R0                              ; 5F4F   0008
        CMPI    #$0002, R0                      ; 5F50   0378 0002
        BEQ     L_5F61                          ; 5F52   0204 000D
        BLT     L_5F5B                          ; 5F54   0205 0005

        CLRR    R0                              ; 5F56   01C0
        SUBI    #$0008, R2                      ; 5F57   033A 0008
        B       L_5FB9                          ; 5F59   0200 005E

L_5F5B:
        SUBI    #$0004, R2                      ; 5F5B   033A 0004
        ADDI    #$0007, R4                      ; 5F5D   02FC 0007
        B       L_5FE7                          ; 5F5F   0200 0086

L_5F61:
        XORI    #$0200, R5                      ; 5F61   03FD 0200
        PSHR    R0                              ; 5F63   0270
        PSHR    R3                              ; 5F64   0273
        NOP                                     ; 5F65   0034
        PSHR    R4                              ; 5F66   0274
        PSHR    R5                              ; 5F67   0275
        MVII    #$0103, R0                      ; 5F68   02B8 0103

        JSR     R5,     L_5E4C                  ; 5F6A   0004 015C 024C

        PULR    R5                              ; 5F6D   02B5
        PULR    R4                              ; 5F6E   02B4
        PULR    R3                              ; 5F6F   02B3
        PULR    R0                              ; 5F70   02B0
        BNC     L_5FE7                          ; 5F71   0209 0074

        CLRR    R0                              ; 5F73   01C0
        B       L_5F96                          ; 5F74   0200 0020

L_5F76:
        DECR    R0                              ; 5F76   0010
        BMI     L_5FB3                          ; 5F77   020B 003A
        BEQ     L_5F7F                          ; 5F79   0204 0004

        ADDI    #$0007, R4                      ; 5F7B   02FC 0007
        B       L_5FE7                          ; 5F7D   0200 0068

L_5F7F:
        ADDI    #$0004, R2                      ; 5F7F   02FA 0004
        PSHR    R2                              ; 5F81   0272
        PSHR    R3                              ; 5F82   0273
        NOP                                     ; 5F83   0034
        PSHR    R4                              ; 5F84   0274
        PSHR    R5                              ; 5F85   0275
        ADDI    #$0008, R2                      ; 5F86   02FA 0008
        MVII    #$0203, R0                      ; 5F88   02B8 0203

        JSR     R5,     L_5E4C                  ; 5F8A   0004 015C 024C

        PULR    R5                              ; 5F8D   02B5
        PULR    R4                              ; 5F8E   02B4
        PULR    R3                              ; 5F8F   02B3
        PULR    R2                              ; 5F90   02B2
        CLRR    R0                              ; 5F91   01C0
        BNC     L_5FE7                          ; 5F92   0209 0053

        SUBI    #$0004, R2                      ; 5F94   033A 0004
L_5F96:
        MVO     R0,     G_0194                  ; 5F96   0240 0194
        MVII    #$00FF, R0                      ; 5F98   02B8 00FF
        MVO     R0,     G_0193                  ; 5F9A   0240 0193
        SWAP    R2,     1                       ; 5F9C   0042
        NOP                                     ; 5F9D   0034
        MVO     R2,     G_034F                  ; 5F9E   0242 034F
        SWAP    R2,     1                       ; 5FA0   0042
        MVO     R3,     G_01A6                  ; 5FA1   0243 01A6
        DECR    R3                              ; 5FA3   0013
        SWAP    R3,     1                       ; 5FA4   0043
        NOP                                     ; 5FA5   0034
        MVO     R3,     G_0350                  ; 5FA6   0243 0350
        CLRR    R3                              ; 5FA8   01DB
        MVO     R3,     G_01C3                  ; 5FA9   0243 01C3
        MVII    #$0068, R3                      ; 5FAB   02BB 0068
        MVII    #$0006, R0                      ; 5FAD   02B8 0006

        JSR     R5,     L_6869                  ; 5FAF   0004 0168 0069

        PULR    R7                              ; 5FB2   02B7

L_5FB3:
        MVII    #$0002, R0                      ; 5FB3   02B8 0002
        XORI    #$0200, R5                      ; 5FB5   03FD 0200
        ADDI    #$0008, R2                      ; 5FB7   02FA 0008
L_5FB9:
        MVI     G_017A, R1                      ; 5FB9   0281 017A
        CMPI    #$0002, R1                      ; 5FBB   0379 0002
        BNEQ    L_5FE7                          ; 5FBD   020C 0028

        PSHR    R4                              ; 5FBF   0274

        JSR     R4,     L_5FD2                  ; 5FC0   0004 005C 03D2
        DECLE   $0031,  $002D,  $0037,  $0031   ; 5FC3   0031 002D 0037 0031
        DECLE   $0041,  $004B,  $0075,  $0035   ; 5FC7   0041 004B 0075 0035
        DECLE   $003F,  $0079,  $001D,  $0027   ; 5FCB   003F 0079 001D 0027
        DECLE   $03FF                           ; 5FCF   03FF
L_5FD0:
        ADDI    #$0002, R4                      ; 5FD0   02FC 0002
L_5FD2:
        MVI@    R4,     R1                      ; 5FD2   02A1
        CMPR    R2,     R1                      ; 5FD3   0151
        BGT     L_5FE6                          ; 5FD4   020E 0010
        BLT     L_5FD0                          ; 5FD6   0225 0007

        MVI@    R4,     R1                      ; 5FD8   02A1
        CMPR    R3,     R1                      ; 5FD9   0159
        BGT     L_5FE6                          ; 5FDA   020E 000A

        MVI@    R4,     R1                      ; 5FDC   02A1
        CMPR    R3,     R1                      ; 5FDD   0159
        BLT     L_5FD2                          ; 5FDE   0225 000D

        PULR    R4                              ; 5FE0   02B4
        MVII    #$00FF, R0                      ; 5FE1   02B8 00FF
        MVO     R0,     G_0193                  ; 5FE3   0240 0193
        PULR    R7                              ; 5FE5   02B7

L_5FE6:
        PULR    R4                              ; 5FE6   02B4
L_5FE7:
        MVO     R0,     G_0195                  ; 5FE7   0240 0195
        MVO     R5,     G_034D                  ; 5FE9   0245 034D
        NOP                                     ; 5FEB   0034
        MVO     R4,     G_034E                  ; 5FEC   0244 034E
        ADDI    #$0004, R5                      ; 5FEE   02FD 0004
        MVO     R5,     G_0355                  ; 5FF0   0245 0355
        SUBI    #$001C, R4                      ; 5FF2   033C 001C
        MVO     R4,     G_0356                  ; 5FF4   0244 0356
        SWAP    R0,     1                       ; 5FF6   0040
        ANDI    #$0100, R0                      ; 5FF7   03B8 0100
        MVO     R0,     G_0359                  ; 5FF9   0240 0359
        SWAP    R2,     1                       ; 5FFB   0042
        MVO     R2,     G_034F                  ; 5FFC   0242 034F
        MVI     G_01A7, R0                      ; 5FFE   0280 01A7
        MVO     R0,     G_0193                  ; 6000   0240 0193
        MVII    #$0004, R0                      ; 6002   02B8 0004
        MVO     R0,     G_0194                  ; 6004   0240 0194

        JSR     R5,     L_6BA0                  ; 6006   0004 0168 03A0

        PULR    R7                              ; 6009   02B7

L_600A:
        RLC     R0,     1                       ; 600A   0050
        PSHR    R0                              ; 600B   0270
        MVI     G_0191, R0                      ; 600C   0280 0191
        TSTR    R0                              ; 600E   0080
        PULR    R0                              ; 600F   02B0
        BEQ     L_622D                          ; 6010   0204 021B

        ADDI    #$0100, R0                      ; 6012   02F8 0100
        MVI     G_0195, R5                      ; 6014   0285 0195
        TSTR    R5                              ; 6016   00AD
        BNEQ    L_601D                          ; 6017   020C 0004

        ADDI    #$0100, R0                      ; 6019   02F8 0100
        ADDI    #$0008, R2                      ; 601B   02FA 0008
L_601D:
        PSHR    R0                              ; 601D   0270
        NOP                                     ; 601E   0034
        PSHR    R3                              ; 601F   0273

        JSR     R5,     L_5E4C                  ; 6020   0004 015C 024C

        MVO     R0,     G_01A5                  ; 6023   0240 01A5
        PULR    R5                              ; 6025   02B5
        PULR    R0                              ; 6026   02B0
        BC      L_622D                          ; 6027   0201 0204

        ANDI    #$00FF, R0                      ; 6029   03B8 00FF
        XORI    #$0200, R0                      ; 602B   03F8 0200
        MVI     G_0195, R4                      ; 602D   0284 0195
        CMPI    #$0001, R4                      ; 602F   037C 0001
        BNEQ    L_6041                          ; 6031   020C 000E

        PSHR    R3                              ; 6033   0273
        PSHR    R2                              ; 6034   0272
        MOVR    R5,     R3                      ; 6035   00AB
        ADDI    #$000C, R2                      ; 6036   02FA 000C

        JSR     R5,     L_5E4C                  ; 6038   0004 015C 024C

        PULR    R2                              ; 603B   02B2
        PULR    R3                              ; 603C   02B3
        BC      L_622D                          ; 603D   0201 01EE

        MVI     G_0195, R4                      ; 603F   0284 0195
L_6041:
        TSTR    R4                              ; 6041   00A4
        BNEQ    L_6046                          ; 6042   020C 0002

        SUBI    #$0008, R2                      ; 6044   033A 0008
L_6046:
        SWAP    R2,     1                       ; 6046   0042
        NOP                                     ; 6047   0034
        MVO     R2,     G_034F                  ; 6048   0242 034F
        SWAP    R2,     1                       ; 604A   0042
        MVII    #$0001, R1                      ; 604B   02B9 0001
        MVO     R1,     G_0191                  ; 604D   0241 0191
L_604F:
        MVI     G_01A7, R0                      ; 604F   0280 01A7
        MVO     R0,     G_0193                  ; 6051   0240 0193
        MVII    #$0006, R0                      ; 6053   02B8 0006
        J       L_686A                          ; 6055   0004 0368 006A

L_6058:
        MVI     G_01A6, R1                      ; 6058   0281 01A6
        TSTR    R1                              ; 605A   0089
        BNEQ    L_606F                          ; 605B   020C 0012

        MVII    #$01FF, R1                      ; 605D   02B9 01FF
        SUB     G_0165, R1                      ; 605F   0301 0165
        MVI@    R1,     R1                      ; 6061   0289
        CMPI    #$00FF, R1                      ; 6062   0379 00FF
        BEQ     L_606A                          ; 6064   0204 0004

        CMPI    #$005F, R1                      ; 6066   0379 005F
        BLT     L_607C                          ; 6068   0205 0012

L_606A:
        MVI     G_0197, R0                      ; 606A   0280 0197
        TSTR    R0                              ; 606C   0080
        BEQ     L_622D                          ; 606D   0204 01BE

L_606F:
        MVII    #$00FF, R1                      ; 606F   02B9 00FF
        MVO     R1,     G_0193                  ; 6071   0241 0193
L_6073:
        PULR    R7                              ; 6073   02B7

        PSHR    R5                              ; 6074   0275
        CMP     G_0165, R1                      ; 6075   0341 0165
        BNEQ    L_60AF                          ; 6077   020C 0036

        TSTR    R0                              ; 6079   0080
        BMI     L_60AF                          ; 607A   020B 0033

L_607C:
        MVI     G_0197, R1                      ; 607C   0281 0197
        ADD     G_0196, R1                      ; 607E   02C1 0196
        ADD     G_0190, R1                      ; 6080   02C1 0190
        ADD     G_0191, R1                      ; 6082   02C1 0191
        ADD     G_01A6, R1                      ; 6084   02C1 01A6
        BNEQ    L_60AB                          ; 6086   020C 0023
        INCR    R7                              ; 6088   000F

L_6089:
        PSHR    R5                              ; 6089   0275
L_608A:
        INCR    R1                              ; 608A   0009
        MVI     G_01C3, R3                      ; 608B   0283 01C3
        TSTR    R3                              ; 608D   009B
        BEQ     L_609E                          ; 608E   0204 000E

        CLRR    R0                              ; 6090   01C0
        MVO     R0,     G_01C3                  ; 6091   0240 01C3
        MVI     G_034F, R0                      ; 6093   0280 034F
        MVO     R0,     G_0354                  ; 6095   0240 0354
        MVI     G_034D, R0                      ; 6097   0280 034D
        ANDI    #$0200, R0                      ; 6099   03B8 0200
        SWAP    R0,     1                       ; 609B   0040
        B       L_60A0                          ; 609C   0200 0002

L_609E:
        MVI     G_0193, R0                      ; 609E   0280 0193
L_60A0:
        CMPI    #$0002, R0                      ; 60A0   0378 0002
        BEQ     L_60B0                          ; 60A2   0204 000C

        CMPI    #$00FF, R0                      ; 60A4   0378 00FF
        BGE     L_60B2                          ; 60A6   020D 000A

        TSTR    R0                              ; 60A8   0080
        BEQ     L_60B3                          ; 60A9   0204 0008

L_60AB:
        MVII    #$0002, R1                      ; 60AB   02B9 0002
        MVO     R1,     G_0196                  ; 60AD   0241 0196
L_60AF:
        PULR    R7                              ; 60AF   02B7

L_60B0:
        NEGR    R1                              ; 60B0   0021
        INCR    R7                              ; 60B1   000F

L_60B2:
        CLRR    R1                              ; 60B2   01C9
L_60B3:
        MVO     R1,     G_01A0                  ; 60B3   0241 01A0

        JSR     R5,     L_6B90                  ; 60B5   0004 0168 0390

        MVII    #$034D, R1                      ; 60B8   02B9 034D

        JSR     R5,     .EXEC.777               ; 60BA   0004 0114 0377

        MVO     R3,     G_01A2                  ; 60BD   0243 01A2
        MVO     R2,     G_01A1                  ; 60BF   0242 01A1
        MVI     G_0354, R0                      ; 60C1   0280 0354
        SWAP    R0,     1                       ; 60C3   0040
        MVO     R0,     G_01A3                  ; 60C4   0240 01A3
        MVI     G_01A0, R0                      ; 60C6   0280 01A0
        SLL     R0,     2                       ; 60C8   004C
        ADDR    R0,     R2                      ; 60C9   00C2
        ADD     G_01A0, R2                      ; 60CA   02C2 01A0
        ADD     G_01A0, R2                      ; 60CC   02C2 01A0
        ANDI    #$00FF, R2                      ; 60CE   03BA 00FF
        SUBI    #$0006, R3                      ; 60D0   033B 0006
        MVI     G_0198, R5                      ; 60D2   0285 0198
        DECR    R5                              ; 60D4   0015
        BMI     L_60F8                          ; 60D5   020B 0021

        CLRR    R0                              ; 60D7   01C0
        MVO     R0,     G_0198                  ; 60D8   0240 0198
        MVII    #$00FF, R0                      ; 60DA   02B8 00FF
        MVO     R0,     G_0193                  ; 60DC   0240 0193
        MVO     R2,     G_01A3                  ; 60DE   0242 01A3
        MVII    #$0002, R1                      ; 60E0   02B9 0002
        MVO     R1,     G_01A5                  ; 60E2   0241 01A5
        MVI     G_034D, R0                      ; 60E4   0280 034D
        SWAP    R0,     1                       ; 60E6   0040
        ANDR    R1,     R0                      ; 60E7   0188
        TSTR    R0                              ; 60E8   0080
        BNEQ    L_60F0                          ; 60E9   020C 0005

        TSTR    R5                              ; 60EB   00AD
        BEQ     L_60F0                          ; 60EC   0204 0002

        MVII    #$0049, R3                      ; 60EE   02BB 0049
L_60F0:
        DECR    R0                              ; 60F0   0010
        NEGR    R0                              ; 60F1   0020
        MVO     R0,     G_01A0                  ; 60F2   0240 01A0
        NOP                                     ; 60F4   0034
        SLL     R0,     2                       ; 60F5   004C
        SLL     R0,     1                       ; 60F6   0048
        ADDR    R0,     R2                      ; 60F7   00C2
L_60F8:
        SDBD                                    ; 60F8   0001
        MVII    #$5A86, R5                      ; 60F9   02BD 0086 005A
        CMP     G_01A1, R2                      ; 60FC   0342 01A1
        BNEQ    L_6102                          ; 60FE   020C 0002

        SUBI    #$0002, R3                      ; 6100   033B 0002
L_6102:
        MVO     R5,     G_034E                  ; 6102   0245 034E
        SUBI    #$001C, R5                      ; 6104   033D 001C
        MVO     R5,     G_0356                  ; 6106   0245 0356
        CLRR    R0                              ; 6108   01C0
        MVO     R0,     G_0359                  ; 6109   0240 0359
        MVO     R0,     G_035A                  ; 610B   0240 035A
        NOP                                     ; 610D   0034
        MVO     R0,     G_0352                  ; 610E   0240 0352
        INCR    R0                              ; 6110   0008
L_6111:
        MVO     R0,     G_0197                  ; 6111   0240 0197
        MVII    #$034D, R1                      ; 6113   02B9 034D
        ANDI    #$00FF, R2                      ; 6115   03BA 00FF
        SWAP    R2,     1                       ; 6117   0042
        XORR    R3,     R2                      ; 6118   01DA
        MVII    #$0020, R3                      ; 6119   02BB 0020

        JSR     R5,     .EXEC.9A8               ; 611B   0004 0118 01A8

        PULR    R7                              ; 611E   02B7

        PSHR    R5                              ; 611F   0275
        MVI     G_0197, R0                      ; 6120   0280 0197
        MVI     G_0354, R3                      ; 6122   0283 0354
        MOVR    R3,     R2                      ; 6124   009A
        SWAP    R2,     1                       ; 6125   0042
        ANDI    #$00FF, R2                      ; 6126   03BA 00FF
        ANDI    #$00FF, R3                      ; 6128   03BB 00FF
        CMPI    #$0002, R0                      ; 612A   0378 0002
        BEQ     L_6138                          ; 612C   0204 000A
        BGT     L_618B                          ; 612E   020E 005B

        MVI     G_01A0, R0                      ; 6130   0280 01A0
        SLL     R0,     2                       ; 6132   004C
        ADDR    R0,     R2                      ; 6133   00C2
        MVII    #$0002, R0                      ; 6134   02B8 0002
        B       L_6111                          ; 6136   0220 0026

L_6138:
        MVI     G_01A2, R3                      ; 6138   0283 01A2
        MVI     G_01A0, R4                      ; 613A   0284 01A0
        MVI     G_01A3, R1                      ; 613C   0281 01A3
        SUBR    R2,     R1                      ; 613E   0111
        CMPI    #$0001, R4                      ; 613F   037C 0001
        BLT     L_6179                          ; 6141   0205 0036
        BEQ     L_6146                          ; 6143   0204 0001

        NEGR    R1                              ; 6145   0021
L_6146:
        SUBI    #$0003, R1                      ; 6146   0339 0003
        BPL     L_6179                          ; 6148   0203 002F

        MVI     G_01A5, R0                      ; 614A   0280 01A5
        TSTR    R0                              ; 614C   0080
        BEQ     L_6182                          ; 614D   0204 0033

        CMPI    #$0002, R0                      ; 614F   0378 0002
        BEQ     L_616E                          ; 6151   0204 001B

        MVI     G_01A2, R1                      ; 6153   0281 01A2
        BGT     L_6170                          ; 6155   020E 0019

        CMPI    #$001C, R3                      ; 6157   037B 001C
        BGT     L_6166                          ; 6159   020E 000B

        MVII    #$0018, R3                      ; 615B   02BB 0018
        MVI     G_01A0, R0                      ; 615D   0280 01A0
        DECR    R0                              ; 615F   0010
        BNEQ    L_6179                          ; 6160   020C 0017

        MVII    #$001C, R3                      ; 6162   02BB 001C
        B       L_6179                          ; 6164   0200 0013

L_6166:
        MVI     G_01A3, R2                      ; 6166   0282 01A3
        MVII    #$00FF, R0                      ; 6168   02B8 00FF
        MVO     R0,     G_0193                  ; 616A   0240 0193
        B       L_617E                          ; 616C   0200 0010

L_616E:
        MVII    #$005D, R1                      ; 616E   02B9 005D
L_6170:
        MVII    #$0068, R3                      ; 6170   02BB 0068
        MVO     R1,     G_01A6                  ; 6172   0241 01A6
        MVI     G_01A0, R0                      ; 6174   0280 01A0
        SLL     R0,     1                       ; 6176   0048
        B       L_617B                          ; 6177   0200 0002

L_6179:
        MVI     G_01A0, R0                      ; 6179   0280 01A0
L_617B:
        ADDR    R0,     R2                      ; 617B   00C2
        ADDR    R0,     R2                      ; 617C   00C2
        ADDR    R0,     R2                      ; 617D   00C2
L_617E:
        MVII    #$0003, R0                      ; 617E   02B8 0003
        B       L_6111                          ; 6180   0220 0070

L_6182:
        MVO     R3,     G_01A6                  ; 6182   0243 01A6
        MVII    #$0068, R3                      ; 6184   02BB 0068
        MVII    #$0006, R0                      ; 6186   02B8 0006
        J       L_686A                          ; 6188   0004 0368 006A

L_618B:
        CMPI    #$0066, R3                      ; 618B   037B 0066
        BLT     L_6192                          ; 618D   0205 0003
        J       L_65D9                          ; 618F   0004 0364 01D9

L_6192:
        SWAP    R2,     1                       ; 6192   0042
        MVO     R2,     G_034F                  ; 6193   0242 034F
        NOP                                     ; 6195   0034
        SWAP    R3,     1                       ; 6196   0043
        MVO     R3,     G_0350                  ; 6197   0243 0350

        JSR     R5,     L_6C86                  ; 6199   0004 016C 0086

        CLRR    R1                              ; 619C   01C9
        MVO     R1,     G_0197                  ; 619D   0241 0197
        MVII    #$0003, R1                      ; 619F   02B9 0003
        MVO     R1,     G_0196                  ; 61A1   0241 0196
        B       L_5F06                          ; 61A3   0220 029E

L_61A5:
        PSHR    R5                              ; 61A5   0275
L_61A6:
        MVI     G_0102, R0                      ; 61A6   0280 0102
        CMPI    #$0002, R0                      ; 61A8   0378 0002
        BGT     L_61A6                          ; 61AA   022E 0005

        CLRR    R0                              ; 61AC   01C0
        MVO     R0,     G_01BC                  ; 61AD   0240 01BC
        MVO     R0,     G_01BD                  ; 61AF   0240 01BD
        MVI     G_0193, R0                      ; 61B1   0280 0193
        CMPI    #$00FF, R0                      ; 61B3   0378 00FF
        BEQ     L_622B                          ; 61B5   0204 0074

        SARC    R0,     2                       ; 61B7   007C
        BNC     L_622B                          ; 61B8   0209 0071

        MVII    #$034D, R1                      ; 61BA   02B9 034D

        JSR     R5,     .EXEC.777               ; 61BC   0004 0114 0377

        MVI     G_0195, R0                      ; 61BF   0280 0195
        TSTR    R0                              ; 61C1   0080
        BNEQ    L_61C6                          ; 61C2   020C 0002

        ADDI    #$0008, R2                      ; 61C4   02FA 0008
L_61C6:
        SUBI    #$0028, R2                      ; 61C6   033A 0028
        PSHR    R2                              ; 61C8   0272
        SLR     R2,     2                       ; 61C9   0066
        SLR     R2,     1                       ; 61CA   0062
        MVII    #$01BC, R4                      ; 61CB   02BC 01BC
        PSHR    R3                              ; 61CD   0273

        JSR     R5,     L_61E2                  ; 61CE   0004 0160 01E2

        PULR    R3                              ; 61D1   02B3
        PULR    R2                              ; 61D2   02B2
        MVI     G_0195, R0                      ; 61D3   0280 0195
        DECR    R0                              ; 61D5   0010
        BNEQ    L_61E1                          ; 61D6   020C 0009

        ADDI    #$000C, R2                      ; 61D8   02FA 000C
        SLR     R2,     2                       ; 61DA   0066
        SLR     R2,     1                       ; 61DB   0062
        MVII    #$01BD, R4                      ; 61DC   02BC 01BD

        JSR     R5,     L_61E2                  ; 61DE   0004 0160 01E2

L_61E1:
        PULR    R7                              ; 61E1   02B7

L_61E2:
        PSHR    R5                              ; 61E2   0275
        MOVR    R2,     R1                      ; 61E3   0091
        INCR    R2                              ; 61E4   000A
        ADDI    #$01B0, R1                      ; 61E5   02F9 01B0
        MVI@    R1,     R0                      ; 61E7   0288
        CMPI    #$0020, R0                      ; 61E8   0378 0020
        BLE     L_622B                          ; 61EA   0206 003F

        MVI     G_0193, R5                      ; 61EC   0285 0193
        DECR    R5                              ; 61EE   0015
        BEQ     L_6200                          ; 61EF   0204 000F

        CMPI    #$004B, R3                      ; 61F1   037B 004B
        BGT     L_622B                          ; 61F3   020E 0036

        CMPR    R0,     R3                      ; 61F5   0143
        BGT     L_622B                          ; 61F6   020E 0033

        ADDI    #$0005, R3                      ; 61F8   02FB 0005
        CMPR    R0,     R3                      ; 61FA   0143
        BLT     L_622B                          ; 61FB   0205 002E

        MVO@    R3,     R1                      ; 61FD   024B
        MVO@    R2,     R4                      ; 61FE   0262
        PULR    R7                              ; 61FF   02B7

L_6200:
        CMPR    R0,     R3                      ; 6200   0143
        BLE     L_622B                          ; 6201   0206 0028

        SUBI    #$0005, R3                      ; 6203   033B 0005
        CMPR    R0,     R3                      ; 6205   0143
        BGE     L_622B                          ; 6206   020D 0023

        CMPI    #$0020, R3                      ; 6208   037B 0020
        BGE     L_620E                          ; 620A   020D 0002

        MVII    #$0020, R3                      ; 620C   02BB 0020
L_620E:
        MVO@    R3,     R1                      ; 620E   024B
        MVO@    R2,     R4                      ; 620F   0262
        BGT     L_622B                          ; 6210   020E 0019

        MOVR    R2,     R0                      ; 6212   0090
        DECR    R0                              ; 6213   0010
        CMPI    #$0008, R0                      ; 6214   0378 0008
        BLT     L_621A                          ; 6216   0205 0002

        SUBI    #$0004, R0                      ; 6218   0338 0004

L_621A:
        JSR     R5,     X_POW2                  ; 621A   0004 0114 0345

        XOR     G_01BF, R0                      ; 621D   03C0 01BF
        MVO     R0,     G_01BF                  ; 621F   0240 01BF
        MVII    #$0002, R0                      ; 6221   02B8 0002
        MVO     R0,     G_019B                  ; 6223   0240 019B

        JSR     R5,     L_5ADE                  ; 6225   0004 0158 02DE
        JSR     R5,     L_6C4F                  ; 6228   0004 016C 004F

L_622B:
        PULR    R7                              ; 622B   02B7

L_622C:
        PSHR    R5                              ; 622C   0275
L_622D:
        MVII    #$034F, R5                      ; 622D   02BD 034F
        MVI@    R5,     R2                      ; 622F   02AA
        MVI@    R5,     R0                      ; 6230   02A8
        MVO     R0,     G_0358                  ; 6231   0240 0358
        CLRR    R0                              ; 6233   01C0
        MVO@    R0,     R5                      ; 6234   0268
        MVO     R0,     G_0359                  ; 6235   0240 0359
        NOP                                     ; 6237   0034
        MVO@    R0,     R5                      ; 6238   0268
        MVO     R0,     G_035A                  ; 6239   0240 035A
        NOP                                     ; 623B   0034
        MVO@    R0,     R5                      ; 623C   0268
        MVO     R0,     G_0194                  ; 623D   0240 0194
        MVI     G_0191, R0                      ; 623F   0280 0191
        TSTR    R0                              ; 6241   0080
        SDBD                                    ; 6242   0001
        MVII    #$5A71, R4                      ; 6243   02BC 0071 005A
        BEQ     L_6259                          ; 6246   0204 0011

        ADDI    #$0007, R4                      ; 6248   02FC 0007
        MVI     G_0195, R0                      ; 624A   0280 0195
        MOVR    R0,     R1                      ; 624C   0081
        SWAP    R1,     1                       ; 624D   0041
        ANDI    #$0100, R1                      ; 624E   03B9 0100
        MVO     R1,     G_0359                  ; 6250   0241 0359
        ADDR    R1,     R2                      ; 6252   00CA
        CMPI    #$0001, R0                      ; 6253   0378 0001
        BNEQ    L_6259                          ; 6255   020C 0002

        ADDI    #$0007, R4                      ; 6257   02FC 0007
L_6259:
        MVO     R2,     G_0357                  ; 6259   0242 0357
        MVO     R4,     G_034E                  ; 625B   0244 034E
        SUBI    #$001C, R4                      ; 625D   033C 001C
        MVO     R4,     G_0356                  ; 625F   0244 0356
        MVII    #$00FF, R0                      ; 6261   02B8 00FF
        MVO     R0,     G_0193                  ; 6263   0240 0193
        MVI     G_0149, R0                      ; 6265   0280 0149
        CMPI    #$000C, R0                      ; 6267   0378 000C
        BNEQ    L_627C                          ; 6269   020C 0011

        MVI     G_0146, R0                      ; 626B   0280 0146
        CMPI    #$0080, R0                      ; 626D   0378 0080
        BGT     L_627C                          ; 626F   020E 000B

        JSR     R5,     .EXEC.A83               ; 6271   0004 0118 0283

        CLRR    R0                              ; 6274   01C0
        MVO     R0,     G_0145                  ; 6275   0240 0145
        NOP                                     ; 6277   0034
        MVO     R0,     G_0146                  ; 6278   0240 0146
        MVO     R0,     G_0149                  ; 627A   0240 0149
L_627C:
        PULR    R7                              ; 627C   02B7

L_627D:
        MVII    #$03FF, R0                      ; 627D   02B8 03FF
L_627F:
        DECR    R0                              ; 627F   0010
        INCR    R0                              ; 6280   0008
        DECR    R0                              ; 6281   0010
        BNEQ    L_627F                          ; 6282   022C 0004

        DECR    R1                              ; 6284   0011
        BNEQ    L_627D                          ; 6285   022C 0009
        MOVR    R5,     R7                      ; 6287   00AF

        PSHR    R5                              ; 6288   0275
        NOP                                     ; 6289   0034
        PSHR    R0                              ; 628A   0270
        MVII    #$0008, R0                      ; 628B   02B8 0008
        MOVR    R1,     R4                      ; 628D   008C

        JSR     R5,     X_FILL_ZERO             ; 628E   0004 0114 0338

        PULR    R0                              ; 6291   02B0
        PULR    R7                              ; 6292   02B7

L_6293:
        PSHR    R5                              ; 6293   0275
        MVI     G_015F, R0                      ; 6294   0280 015F
        TSTR    R0                              ; 6296   0080
        BEQ     L_62A5                          ; 6297   0204 000C

        MVI     G_017A, R3                      ; 6299   0283 017A
        SARC    R3,     1                       ; 629B   007B
        BC      L_62A5                          ; 629C   0201 0007
        BEQ     L_62A5                          ; 629E   0204 0005

        MVI     G_018F, R1                      ; 62A0   0281 018F
        TSTR    R1                              ; 62A2   0089
        BEQ     L_62A6                          ; 62A3   0204 0001
L_62A5:
        PULR    R7                              ; 62A5   02B7

L_62A6:
        INCR    R1                              ; 62A6   0009
        MVO     R1,     G_018F                  ; 62A7   0241 018F
        CMPI    #$0002, R3                      ; 62A9   037B 0002
        BNEQ    L_62B6                          ; 62AB   020C 0009

        MVI     G_01BF, R0                      ; 62AD   0280 01BF
        CMPI    #$00F9, R0                      ; 62AF   0378 00F9
        BNEQ    L_62FC                          ; 62B1   020C 0049
        J       L_68D5                          ; 62B3   0004 0368 00D5

L_62B6:
        SARC    R3,     1                       ; 62B6   007B
        BNC     L_62DE                          ; 62B7   0209 0025

        MVII    #$031F, R3                      ; 62B9   02BB 031F
L_62BB:
        MVI@    R3,     R1                      ; 62BB   0299
        INCR    R3                              ; 62BC   000B
        SWAP    R1,     1                       ; 62BD   0041
        ANDI    #$007F, R1                      ; 62BE   03B9 007F
        CMPI    #$0060, R1                      ; 62C0   0379 0060
        BLT     L_62D8                          ; 62C2   0205 0014

        CMPI    #$0064, R1                      ; 62C4   0379 0064
        BGT     L_62D8                          ; 62C6   020E 0010

        MVII    #$001C, R1                      ; 62C8   02B9 001C
        ADDI    #$0004, R3                      ; 62CA   02FB 0004
        MVI@    R3,     R2                      ; 62CC   029A
        SDBD                                    ; 62CD   0001
        ANDI    #$FF00, R2                      ; 62CE   03BA 0000 00FF
        XORR    R1,     R2                      ; 62D1   01CA
        MVO@    R2,     R3                      ; 62D2   025A
        SWAP    R1,     1                       ; 62D3   0041
        NOP                                     ; 62D4   0034
        SUBI    #$0004, R3                      ; 62D5   033B 0004
        MVO@    R1,     R3                      ; 62D7   0259
L_62D8:
        ADDI    #$0007, R3                      ; 62D8   02FB 0007
        CMPI    #$0327, R3                      ; 62DA   037B 0327
        BEQ     L_62BB                          ; 62DC   0224 0022

L_62DE:
        MVI     G_0350, R1                      ; 62DE   0281 0350
        SDBD                                    ; 62E0   0001
        CMPI    #$1800, R1                      ; 62E1   0379 0000 0018
        BGT     L_62EE                          ; 62E4   020E 0008

        MVI     G_034F, R1                      ; 62E6   0281 034F
        SDBD                                    ; 62E8   0001
        CMPI    #$4400, R1                      ; 62E9   0379 0000 0044
        BNC     L_65D9                          ; 62EC   0209 02EB

L_62EE:
        MVI     G_0199, R1                      ; 62EE   0281 0199
        XORI    #$0001, R1                      ; 62F0   03F9 0001
        MVO     R1,     G_0199                  ; 62F2   0241 0199
        BEQ     L_62FC                          ; 62F4   0204 0006

        MVII    #$0208, R1                      ; 62F6   02B9 0208
        MVI@    R1,     R2                      ; 62F8   028A
        XORI    #$0003, R2                      ; 62F9   03FA 0003
        MVO@    R2,     R1                      ; 62FB   024A
L_62FC:
        MVI     G_0190, R1                      ; 62FC   0281 0190
        CMPI    #$0001, R1                      ; 62FE   0379 0001
        BEQ     L_65D9                          ; 6300   0204 02D7

        MVI     G_0196, R0                      ; 6302   0280 0196
        DECR    R0                              ; 6304   0010
        BMI     L_6309                          ; 6305   020B 0002

        MVO     R0,     G_0196                  ; 6307   0240 0196
L_6309:
        MVI     G_0198, R0                      ; 6309   0280 0198
        DECR    R0                              ; 630B   0010
        BMI     L_631A                          ; 630C   020B 000C

        MVO     R0,     G_0198                  ; 630E   0240 0198
        CMPI    #$0001, R0                      ; 6310   0378 0001
        BGT     L_631A                          ; 6312   020E 0006

        CLRR    R1                              ; 6314   01C9

        JSR     R5,     L_6089                  ; 6315   0004 0160 0089

        B       L_63B7                          ; 6318   0200 009D

L_631A:
        MVI     G_0197, R1                      ; 631A   0281 0197
        TSTR    R1                              ; 631C   0089
        BEQ     L_634F                          ; 631D   0204 0030

        MVII    #$034D, R1                      ; 631F   02B9 034D

        JSR     R5,     .EXEC.777               ; 6321   0004 0114 0377

        MVI     G_034D, R0                      ; 6324   0280 034D
        ANDI    #$0200, R0                      ; 6326   03B8 0200
        BNEQ    L_632C                          ; 6328   020C 0002

        ADDI    #$0008, R2                      ; 632A   02FA 0008
L_632C:
        SWAP    R0,     1                       ; 632C   0040
        MVO     R0,     G_0195                  ; 632D   0240 0195
        MVII    #$0301, R0                      ; 632F   02B8 0301

        JSR     R5,     L_5E4C                  ; 6331   0004 015C 024C

        BC      L_634F                          ; 6334   0201 0019

        MVI     G_0195, R0                      ; 6336   0280 0195
        TSTR    R0                              ; 6338   0080
        BNEQ    L_633D                          ; 6339   020C 0002

        SUBI    #$0008, R2                      ; 633B   033A 0008
L_633D:
        SWAP    R2,     1                       ; 633D   0042
        MVO     R2,     G_034F                  ; 633E   0242 034F
        MVII    #$0001, R1                      ; 6340   02B9 0001
        MVO     R1,     G_0191                  ; 6342   0241 0191
        CLRR    R1                              ; 6344   01C9
        MVO     R1,     G_0197                  ; 6345   0241 0197
        NOP                                     ; 6347   0034
        MVO     R1,     G_01A6                  ; 6348   0241 01A6

        JSR     R5,     L_622C                  ; 634A   0004 0160 022C

        B       L_635A                          ; 634D   0200 000B

L_634F:
        MVI     G_0191, R0                      ; 634F   0280 0191
        TSTR    R0                              ; 6351   0080
        BEQ     L_635D                          ; 6352   0204 0009

        MVI     G_0193, R0                      ; 6354   0280 0193
        CMPI    #$00FF, R0                      ; 6356   0378 00FF
        BEQ     L_635D                          ; 6358   0204 0003

L_635A:
        JSR     R5,     L_5C09                  ; 635A   0004 015C 0009

L_635D:
        MVI     G_01A6, R0                      ; 635D   0280 01A6
        TSTR    R0                              ; 635F   0080
        BEQ     L_639D                          ; 6360   0204 003B

        MVII    #$034D, R1                      ; 6362   02B9 034D

        JSR     R5,     .EXEC.777               ; 6364   0004 0114 0377

        CMPI    #$0065, R3                      ; 6367   037B 0065
        BGE     L_65D9                          ; 6369   020D 026E

        CLRR    R0                              ; 636B   01C0

        JSR     R5,     L_5DD7                  ; 636C   0004 015C 01D7

        BC      L_639D                          ; 636F   0201 002C

        PSHR    R2                              ; 6371   0272
        PSHR    R3                              ; 6372   0273

        JSR     R5,     L_6C86                  ; 6373   0004 016C 0086

        PULR    R3                              ; 6376   02B3
        PULR    R2                              ; 6377   02B2
        MVI     G_017A, R0                      ; 6378   0280 017A
        CMPI    #$0008, R0                      ; 637A   0378 0008
        BNEQ    L_638C                          ; 637C   020C 000E

        CMPI    #$005A, R3                      ; 637E   037B 005A
        BLT     L_638C                          ; 6380   0205 000A

        CMPI    #$0046, R2                      ; 6382   037A 0046
        BGT     L_638C                          ; 6384   020E 0006

        MVII    #$0003, R0                      ; 6386   02B8 0003
        MVO     R0,     G_0198                  ; 6388   0240 0198
        B       L_6393                          ; 638A   0200 0007

L_638C:
        MOVR    R3,     R4                      ; 638C   009C
        SUB     G_01A6, R4                      ; 638D   0304 01A6
        CMPI    #$0008, R4                      ; 638F   037C 0008
        BGT     L_65D9                          ; 6391   020E 0246

L_6393:
        CLRR    R0                              ; 6393   01C0
        MVO     R0,     G_01A6                  ; 6394   0240 01A6
        NOP                                     ; 6396   0034
        MVO     R0,     G_0197                  ; 6397   0240 0197
        MVO     R0,     G_0191                  ; 6399   0240 0191
        B       L_63A6                          ; 639B   0200 0009

L_639D:
        MVI     G_0194, R0                      ; 639D   0280 0194
        DECR    R0                              ; 639F   0010
        BMI     L_63B7                          ; 63A0   020B 0015

        MVO     R0,     G_0194                  ; 63A2   0240 0194
        BNEQ    L_63B7                          ; 63A4   020C 0011

L_63A6:
        MVII    #$01FF, R1                      ; 63A6   02B9 01FF
        SUB     G_0165, R1                      ; 63A8   0301 0165
        MVI@    R1,     R1                      ; 63AA   0289
        CMPI    #$00FF, R1                      ; 63AB   0379 00FF
        BNEQ    L_63B4                          ; 63AD   020C 0005

        JSR     R5,     L_622C                  ; 63AF   0004 0160 022C

        B       L_63B7                          ; 63B2   0200 0003

L_63B4:
        JSR     R5,     L_5F05                  ; 63B4   0004 015C 0305

L_63B7:
        CLRR    R0                              ; 63B7   01C0
        MVO     R0,     G_019E                  ; 63B8   0240 019E
L_63BA:
        CMPI    #$0005, R0                      ; 63BA   0378 0005
        BLT     L_63D2                          ; 63BC   0205 0014
        BEQ     L_640F                          ; 63BE   0204 004F

        MVI     G_0194, R1                      ; 63C0   0281 0194
        TSTR    R1                              ; 63C2   0089
        BNEQ    L_6422                          ; 63C3   020C 005D

        MVI     G_0193, R1                      ; 63C5   0281 0193
        CMPI    #$00FF, R1                      ; 63C7   0379 00FF
        BEQ     L_6422                          ; 63C9   0204 0057

        MVI     G_0197, R1                      ; 63CB   0281 0197
        TSTR    R1                              ; 63CD   0089
        BNEQ    L_6422                          ; 63CE   020C 0052
        B       L_640F                          ; 63D0   0200 003D

L_63D2:
        MVI     G_0197, R1                      ; 63D2   0281 0197
        TSTR    R1                              ; 63D4   0089
        BEQ     L_640F                          ; 63D5   0204 0038

        MOVR    R0,     R2                      ; 63D7   0082
        INCR    R2                              ; 63D8   000A
        CMP     G_019F, R2                      ; 63D9   0342 019F
        BEQ     L_640F                          ; 63DB   0204 0032

        JSR     R5,     .EXEC.772               ; 63DD   0004 0114 0372

        MVI     G_0350, R1                      ; 63E0   0281 0350
        SWAP    R1,     1                       ; 63E2   0041
        ANDI    #$00FF, R1                      ; 63E3   03B9 00FF
        ADDI    #$0005, R1                      ; 63E5   02F9 0005
        SUBR    R1,     R3                      ; 63E7   010B
        BMI     L_640F                          ; 63E8   020B 0025

        CMPI    #$0004, R3                      ; 63EA   037B 0004
        BGT     L_640F                          ; 63EC   020E 0021

        MVI     G_034F, R1                      ; 63EE   0281 034F
        SWAP    R1,     1                       ; 63F0   0041
        ANDI    #$00FF, R1                      ; 63F1   03B9 00FF
        SUBI    #$0002, R1                      ; 63F3   0339 0002
        SUBR    R1,     R2                      ; 63F5   010A
        BMI     L_640F                          ; 63F6   020B 0017

        CMPI    #$0004, R2                      ; 63F8   037A 0004
        BGT     L_640F                          ; 63FA   020E 0013

        MVO     R0,     G_019F                  ; 63FC   0240 019F
        MVII    #$0001, R1                      ; 63FE   02B9 0001
        ADD     G_019E, R1                      ; 6400   02C1 019E
        MVO     R1,     G_019E                  ; 6402   0241 019E
        MVO     R1,     G_019B                  ; 6404   0241 019B
        NOP                                     ; 6406   0034
        PSHR    R0                              ; 6407   0270

        JSR     R5,     L_5ADE                  ; 6408   0004 0158 02DE
        JSR     R5,     L_6C64                  ; 640B   0004 016C 0064

        PULR    R0                              ; 640E   02B0

L_640F:
        JSR     R5,     .EXEC.76C               ; 640F   0004 0114 036C

        INCR    R1                              ; 6412   0009
        MVI@    R1,     R5                      ; 6413   028D
        TSTR    R5                              ; 6414   00AD
        BEQ     L_646B                          ; 6415   0204 0054

        ADDI    #$0005, R1                      ; 6417   02F9 0005
        MVI@    R1,     R5                      ; 6419   028D
        DECR    R5                              ; 641A   0015
        BMI     L_646D                          ; 641B   020B 0050

L_641D:
        INCR    R0                              ; 641D   0008
        CMPI    #$0007, R0                      ; 641E   0378 0007
        BLT     L_63BA                          ; 6420   0225 0067

L_6422:
        MVI     G_017A, R0                      ; 6422   0280 017A
        CMPI    #$0004, R0                      ; 6424   0378 0004
        BNEQ    L_642B                          ; 6426   020C 0003

        JSR     R5,     L_61A5                  ; 6428   0004 0160 01A5

L_642B:
        CLRR    R0                              ; 642B   01C0
        MVO     R0,     G_018F                  ; 642C   0240 018F
        MVI     G_0149, R0                      ; 642E   0280 0149
        ADD     G_0145, R0                      ; 6430   02C0 0145
        BNEQ    L_646A                          ; 6432   020C 0036

        MVI     G_017E, R1                      ; 6434   0281 017E
        MVO     R0,     G_017E                  ; 6436   0240 017E
        MVI     G_017D, R5                      ; 6438   0285 017D
        SWAP    R1,     1                       ; 643A   0041
        XORR    R1,     R5                      ; 643B   01CD
        MVI     G_017A, R1                      ; 643C   0281 017A
        SARC    R1,     1                       ; 643E   0079
        BC      L_644F                          ; 643F   0201 000E

        SDBD                                    ; 6441   0001
        CMPI    #$6C2C, R5                      ; 6442   037D 002C 006C
        BLE     L_6467                          ; 6445   0206 0020

        SDBD                                    ; 6447   0001
        CMPI    #$6C4C, R5                      ; 6448   037D 004C 006C
        BGE     L_6467                          ; 644B   020D 001A
        B       L_645B                          ; 644D   0200 000C

L_644F:
        SDBD                                    ; 644F   0001
        CMPI    #$6C14, R5                      ; 6450   037D 0014 006C
        BLE     L_6467                          ; 6453   0206 0012

        SDBD                                    ; 6455   0001
        CMPI    #$6C26, R5                      ; 6456   037D 0026 006C
        BGE     L_6467                          ; 6459   020D 000C

L_645B:
        DECR    R5                              ; 645B   0015
        MVI@    R5,     R1                      ; 645C   02A9
        TSTR    R1                              ; 645D   0089
        BEQ     L_6467                          ; 645E   0204 0007

        MVII    #$0070, R3                      ; 6460   02BB 0070
        MVII    #$0003, R1                      ; 6462   02B9 0003
        J       L_6A34                          ; 6464   0004 0368 0234

L_6467:
        JSR     R5,     L_6C07                  ; 6467   0004 016C 0007

L_646A:
        PULR    R7                              ; 646A   02B7
L_646B:
        B       L_641D                          ; 646B   0220 004F

L_646D:
        CLRR    R3                              ; 646D   01DB
        SUBI    #$0002, R1                      ; 646E   0339 0002
        MVO@    R3,     R1                      ; 6470   024B

        JSR     R5,     .EXEC.98D               ; 6471   0004 0118 018D

        PSHR    R1                              ; 6474   0271
        MOVR    R1,     R4                      ; 6475   008C
        ADDI    #$0007, R1                      ; 6476   02F9 0007
        MVI@    R1,     R2                      ; 6478   028A
        MOVR    R2,     R3                      ; 6479   0093
        ANDI    #$00FF, R3                      ; 647A   03BB 00FF
        SWAP    R3,     1                       ; 647C   0043
        ADDI    #$0002, R4                      ; 647D   02FC 0002
        CMPI    #$0006, R0                      ; 647F   0378 0006
        BNEQ    L_648A                          ; 6481   020C 0007

        MVI     G_01C3, R5                      ; 6483   0285 01C3
        TSTR    R5                              ; 6485   00AD
        BEQ     L_648A                          ; 6486   0204 0002

        MVI     G_034F, R2                      ; 6488   0282 034F
L_648A:
        SDBD                                    ; 648A   0001
        ANDI    #$FF00, R2                      ; 648B   03BA 0000 00FF
        MVO@    R2,     R4                      ; 648E   0262
        MVO@    R3,     R4                      ; 648F   0263
        NOP                                     ; 6490   0034
        PULR    R1                              ; 6491   02B1
        SWAP    R2,     1                       ; 6492   0042
        SWAP    R3,     1                       ; 6493   0043
        CMPI    #$0006, R0                      ; 6494   0378 0006
        BNEQ    L_650A                          ; 6496   020C 0072

        CLRR    R1                              ; 6498   01C9
        MVO     R1,     G_01A6                  ; 6499   0241 01A6
        MVI     G_0191, R1                      ; 649B   0281 0191
        TSTR    R1                              ; 649D   0089
        BEQ     L_64C1                          ; 649E   0204 0021

        MVI     G_0193, R1                      ; 64A0   0281 0193
        CMPI    #$0003, R1                      ; 64A2   0379 0003
        BEQ     L_64AF                          ; 64A4   0204 0009

        MVI     G_01A5, R1                      ; 64A6   0281 01A5
        CMPI    #$00FF, R1                      ; 64A8   0379 00FF
        BNEQ    L_64ED                          ; 64AA   020C 0041
        J       L_68D5                          ; 64AC   0004 0368 00D5

L_64AF:
        CLRR    R1                              ; 64AF   01C9
        MVO     R1,     G_0191                  ; 64B0   0241 0191
        MVI     G_01A5, R1                      ; 64B2   0281 01A5
        CMPI    #$0004, R1                      ; 64B4   0379 0004
        BGT     L_64F6                          ; 64B6   020E 003E

        ADDR    R1,     R3                      ; 64B8   00CB
        SWAP    R3,     1                       ; 64B9   0043
        MVO     R3,     G_0350                  ; 64BA   0243 0350

        JSR     R5,     L_6C86                  ; 64BC   0004 016C 0086

        B       L_64ED                          ; 64BF   0200 002C

L_64C1:
        MVI     G_01A5, R1                      ; 64C1   0281 01A5
        TSTR    R1                              ; 64C3   0089
        BEQ     L_64F2                          ; 64C4   0204 002C

        CMPI    #$0002, R1                      ; 64C6   0379 0002
        BEQ     L_64F2                          ; 64C8   0204 0028
        BGT     L_64E2                          ; 64CA   020E 0016

        CMPI    #$0018, R3                      ; 64CC   037B 0018
        BNEQ    L_64ED                          ; 64CE   020C 001D

        CMPI    #$0063, R2                      ; 64D0   037A 0063
        BNEQ    L_64ED                          ; 64D2   020C 0019

        MVII    #$001C, R3                      ; 64D4   02BB 001C
        SWAP    R3,     1                       ; 64D6   0043
        NOP                                     ; 64D7   0034
        MVO     R3,     G_0350                  ; 64D8   0243 0350
        SWAP    R3,     1                       ; 64DA   0043
        MVII    #$007A, R2                      ; 64DB   02BA 007A
        CLRR    R1                              ; 64DD   01C9
        MVO     R1,     G_01A5                  ; 64DE   0241 01A5
        B       L_6505                          ; 64E0   0200 0023

L_64E2:
        MVII    #$0001, R1                      ; 64E2   02B9 0001
        MVO     R1,     G_0191                  ; 64E4   0241 0191
        MVI     G_034D, R1                      ; 64E6   0281 034D
        ANDI    #$0200, R1                      ; 64E8   03B9 0200
        SWAP    R1,     1                       ; 64EA   0041
        MVO     R1,     G_0195                  ; 64EB   0241 0195

L_64ED:
        JSR     R5,     L_622C                  ; 64ED   0004 0160 022C

        B       L_6422                          ; 64F0   0220 00CF

L_64F2:
        CMPI    #$0064, R3                      ; 64F2   037B 0064
        BGE     L_65D9                          ; 64F4   020D 00E3

L_64F6:
        MVO     R3,     G_01A6                  ; 64F6   0243 01A6
        CLRR    R3                              ; 64F8   01DB
        MVO     R3,     G_01C3                  ; 64F9   0243 01C3
        MVO     R3,     G_0352                  ; 64FB   0243 0352
        NOP                                     ; 64FD   0034
        MVO     R3,     G_035A                  ; 64FE   0243 035A
        INCR    R3                              ; 6500   000B
        MVO     R3,     G_01A5                  ; 6501   0243 01A5
        MVII    #$0069, R3                      ; 6503   02BB 0069

L_6505:
        JSR     R5,     L_6869                  ; 6505   0004 0168 0069

        B       L_6422                          ; 6508   0220 00E7

L_650A:
        CMPI    #$0005, R0                      ; 650A   0378 0005
        BNEQ    L_6513                          ; 650C   020C 0005

        CLRR    R1                              ; 650E   01C9
        MVO     R1,     G_0346                  ; 650F   0241 0346
        B       L_641D                          ; 6511   0220 00F5

L_6513:
        PSHR    R0                              ; 6513   0270
        CLRR    R5                              ; 6514   01ED
        MVO     R5,     G_017F                  ; 6515   0245 017F
        ADD     G_017A, R7                      ; 6517   02C7 017A
        B       L_6523                          ; 6519   0200 0008
        B       L_6523                          ; 651B   0200 0006
        B       L_670A                          ; 651D   0200 01EB
        B       L_6523                          ; 651F   0200 0002
        B       L_67DB                          ; 6521   0200 02B8

L_6523:
        CMPI    #$0001, R0                      ; 6523   0378 0001
        DECLE   $020E,  $00B4,  $008C,  $037B   ; 6525   020E 00B4 008C 037B
        DECLE   $0068,  $0205,  $003E,  $020E   ; 6529   0068 0205 003E 020E
        DECLE   $0012,  $028B,  $0001,  $03BB   ; 652D   0012 028B 0001 03BB
        DECLE   $00FF,  $00F9,  $0263,  $0001   ; 6531   00FF 00F9 0263 0001

        MVII    #$00BF, R3                      ; 6535   02BB 00BF
        SLLC    R1,     1                       ; 6537   0059
        MVO@    R3,     R4                      ; 6538   0263
        MVII    #$0074, R3                      ; 6539   02BB 0074
        SWAP    R2,     1                       ; 653B   0042
        ADDI    #$0004, R4                      ; 653C   02FC 0004
        B       L_6562                          ; 653E   0200 0022

        MVI     G_032C, R1                      ; 6540   0281 032C
        TSTR    R0                              ; 6542   0080
        BEQ     L_6547                          ; 6543   0204 0002

        MVI     G_0324, R1                      ; 6545   0281 0324
L_6547:
        SDBD                                    ; 6547   0001
        CMPI    #$4918, R1                      ; 6548   0379 0018 0049
        BNEQ    L_6555                          ; 654B   020C 0008

        MVII    #$0015, R1                      ; 654D   02B9 0015
        ADDI    #$0006, R4                      ; 654F   02FC 0006
        MVO@    R1,     R4                      ; 6551   0261
        PULR    R0                              ; 6552   02B0
        B       L_641D                          ; 6553   0220 0137

L_6555:
        MVII    #$0049, R2                      ; 6555   02BA 0049
        SWAP    R2,     1                       ; 6557   0042
        ADDI    #$0002, R4                      ; 6558   02FC 0002
        MVO@    R2,     R4                      ; 655A   0262
        MVII    #$0018, R3                      ; 655B   02BB 0018
        SWAP    R3,     1                       ; 655D   0043
        MVO@    R3,     R4                      ; 655E   0263
        ADDI    #$0002, R4                      ; 655F   02FC 0002
        SWAP    R3,     1                       ; 6561   0043
L_6562:
        XORR    R3,     R2                      ; 6562   01DA
        MVII    #$000F, R3                      ; 6563   02BB 000F
        MVO@    R3,     R4                      ; 6565   0263
        MVO@    R2,     R4                      ; 6566   0262
        PULR    R0                              ; 6567   02B0
        B       L_641D                          ; 6568   0220 014C

        ADDI    #$0007, R4                      ; 656A   02FC 0007
        MVI@    R4,     R5                      ; 656C   02A5
        SDBD                                    ; 656D   0001
        CMPI    #$4918, R5                      ; 656E   037D 0018 0049
        BNEQ    L_65C5                          ; 6571   020C 0052

        MVI     G_035E, R0                      ; 6573   0280 035E

        JSR     R4,     L_6580                  ; 6575   0004 0064 0180
        DECLE   $0021,  $002D,  $0049,  $0059   ; 6578   0021 002D 0049 0059
        DECLE   $0065,  $0071,  $007D,  $00FF   ; 657C   0065 0071 007D 00FF
L_6580:
        SARC    R0,     1                       ; 6580   0078
        BC      L_6593                          ; 6581   0201 0010

L_6583:
        MOVR    R0,     R2                      ; 6583   0082
        ANDI    #$0007, R0                      ; 6584   03B8 0007
        DECR    R0                              ; 6586   0010
        BPL     L_658F                          ; 6587   0203 0006

        MVI     G_035E, R0                      ; 6589   0280 035E
        SARC    R2,     2                       ; 658B   007E
        SUBR    R2,     R0                      ; 658C   0110
        B       L_6583                          ; 658D   0220 000B

L_658F:
        ADDR    R0,     R4                      ; 658F   00C4
        MVI@    R4,     R2                      ; 6590   02A2
        B       L_65B9                          ; 6591   0200 0026

L_6593:
        MVI     G_017B, R2                      ; 6593   0282 017B
        TSTR    R2                              ; 6595   0092
        BNEQ    L_659B                          ; 6596   020C 0003

        SARC    R0,     1                       ; 6598   0078
        BNC     L_6583                          ; 6599   0229 0017

L_659B:
        MVI     G_034F, R2                      ; 659B   0282 034F
        SWAP    R2,     1                       ; 659D   0042
        ANDI    #$00FF, R2                      ; 659E   03BA 00FF
        SUBI    #$0004, R2                      ; 65A0   033A 0004
        MVI     G_034D, R0                      ; 65A2   0280 034D
        ANDI    #$0200, R0                      ; 65A4   03B8 0200
        BEQ     L_65AA                          ; 65A6   0204 0002

        ADDI    #$0008, R2                      ; 65A8   02FA 0008
L_65AA:
        CMP@    R4,     R2                      ; 65AA   0362
        BGT     L_65AA                          ; 65AB   022E 0002

        DECR    R4                              ; 65AD   0014
        MVI@    R4,     R2                      ; 65AE   02A2
        CMPI    #$00FF, R2                      ; 65AF   037A 00FF
        BNEQ    L_65B9                          ; 65B1   020C 0006

        MVI     G_035E, R0                      ; 65B3   0280 035E
        SUBI    #$0008, R4                      ; 65B5   033C 0008
        B       L_6583                          ; 65B7   0220 0035

L_65B9:
        CMPI    #$0049, R2                      ; 65B9   037A 0049
        BGT     L_65CA                          ; 65BB   020E 000D
        BEQ     L_65C5                          ; 65BD   0204 0006

        MVI@    R1,     R0                      ; 65BF   0288
        XORI    #$0200, R0                      ; 65C0   03F8 0200
        MVO@    R0,     R1                      ; 65C2   0248
        B       L_65CA                          ; 65C3   0200 0005

L_65C5:
        MVII    #$0068, R5                      ; 65C5   02BD 0068
        MVI@    R1,     R4                      ; 65C7   028C
        B       L_662D                          ; 65C8   0200 0063

L_65CA:
        JSR     R4,     L_65D2                  ; 65CA   0004 0064 01D2

        INCR    R5                              ; 65CD   000D
        DECR    R0                              ; 65CE   0010
        DECR    R4                              ; 65CF   0014
        COMR    R0                              ; 65D0   0018
        NEGR    R0                              ; 65D1   0020
L_65D2:
        ADD     G_017B, R4                      ; 65D2   02C4 017B
        MVI@    R4,     R0                      ; 65D4   02A0
        MVO     R0,     G_017F                  ; 65D5   0240 017F
        B       L_6862                          ; 65D7   0200 0289
L_65D9:
        B       L_6943                          ; 65D9   0200 0368

        CMPI    #$0004, R0                      ; 65DB   0378 0004
        BNEQ    L_6661                          ; 65DD   020C 0082

        MVI@    R1,     R4                      ; 65DF   028C
        CMPI    #$0039, R2                      ; 65E0   037A 0039
        BEQ     L_65FC                          ; 65E2   0204 0018

        CMPI    #$0031, R2                      ; 65E4   037A 0031
        BNEQ    L_65F5                          ; 65E6   020C 000D

        ADDI    #$0007, R1                      ; 65E8   02F9 0007
        MVI@    R1,     R2                      ; 65EA   028A
        ADDI    #$0100, R2                      ; 65EB   02FA 0100
        MVO@    R2,     R1                      ; 65ED   024A
        DECR    R1                              ; 65EE   0011
        MVII    #$0004, R2                      ; 65EF   02BA 0004
        MVO@    R2,     R1                      ; 65F1   024A
        PULR    R0                              ; 65F2   02B0
        B       L_641D                          ; 65F3   0220 01D7

L_65F5:
        XORI    #$0200, R4                      ; 65F5   03FC 0200
        MVO@    R4,     R1                      ; 65F7   024C
        MVII    #$0039, R2                      ; 65F8   02BA 0039
        B       L_65CA                          ; 65FA   0220 0031

L_65FC:
        SDBD                                    ; 65FC   0001
        ANDI    #$F9FF, R4                      ; 65FD   03BC 00FF 00F9
        CMPI    #$0050, R3                      ; 6600   037B 0050
        BNEQ    L_6608                          ; 6602   020C 0004

        MVII    #$0040, R3                      ; 6604   02BB 0040
        B       L_664B                          ; 6606   0200 0043

L_6608:
        MVII    #$0004, R0                      ; 6608   02B8 0004

        JSR     R5,     X_RAND2                 ; 660A   0004 0114 029E

        SARC    R0,     2                       ; 660D   007C
        BC      L_6623                          ; 660E   0201 0013
        BOV     L_661F                          ; 6610   0202 000D

        MVII    #$0031, R2                      ; 6612   02BA 0031
L_6614:
        XORI    #$0200, R4                      ; 6614   03FC 0200
L_6616:
        MVO@    R4,     R1                      ; 6616   024C
        SDBD                                    ; 6617   0001
        MVII    #$59BF, R4                      ; 6618   02BC 00BF 0059
        INCR    R1                              ; 661B   0009
        MVO@    R4,     R1                      ; 661C   024C
        B       L_65CA                          ; 661D   0220 0054

L_661F:
        MVII    #$003E, R2                      ; 661F   02BA 003E
        B       L_6616                          ; 6621   0220 000C
L_6623:
        BOV     L_6643                          ; 6623   0202 001E

        CMPI    #$002C, R3                      ; 6625   037B 002C
        MVII    #$0050, R5                      ; 6627   02BD 0050
        BNEQ    L_662D                          ; 6629   020C 0002

        MVII    #$0040, R5                      ; 662B   02BD 0040
L_662D:
        PSHR    R1                              ; 662D   0271
        ADDI    #$0003, R1                      ; 662E   02F9 0003
        ADDI    #$0004, R3                      ; 6630   02FB 0004
        SWAP    R3,     1                       ; 6632   0043
        MVO@    R3,     R1                      ; 6633   024B
        PULR    R1                              ; 6634   02B1
        MOVR    R5,     R3                      ; 6635   00AB
L_6636:
        SDBD                                    ; 6636   0001
        XORI    #$0400, R4                      ; 6637   03FC 0000 0004
        MVO@    R4,     R1                      ; 663A   024C
        INCR    R1                              ; 663B   0009
        SDBD                                    ; 663C   0001
        MVII    #$59CA, R5                      ; 663D   02BD 00CA 0059
        MVO@    R5,     R1                      ; 6640   024D
        B       L_65CA                          ; 6641   0220 0078

L_6643:
        CMPI    #$002C, R3                      ; 6643   037B 002C
        MVII    #$0050, R3                      ; 6645   02BB 0050
        BEQ     L_6636                          ; 6647   0224 0012

        MVII    #$002C, R3                      ; 6649   02BB 002C
L_664B:
        MVO@    R4,     R1                      ; 664B   024C
        INCR    R1                              ; 664C   0009
        SDBD                                    ; 664D   0001
        MVII    #$59CA, R5                      ; 664E   02BD 00CA 0059
        MVO@    R5,     R1                      ; 6651   024D

        JSR     R4,     L_665A                  ; 6652   0004 0064 025A

        INCR    R0                              ; 6655   0008
        INCR    R2                              ; 6656   000A
        INCR    R4                              ; 6657   000C
        INCR    R7                              ; 6658   000F

        DECR    R2                              ; 6659   0012
L_665A:
        ADD     G_017B, R4                      ; 665A   02C4 017B
        MVI@    R4,     R0                      ; 665C   02A0
        MVO     R0,     G_017F                  ; 665D   0240 017F
        B       L_6862                          ; 665F   0200 0201

L_6661:
        JSR     R4,     L_66B0                  ; 6661   0004 0064 02B0
        DECLE   $0065,  $001C,  $0071,  $007D   ; 6664   0065 001C 0071 007D
        DECLE   $0349,  $0349,  $0065,  $0049   ; 6668   0349 0349 0065 0049
        DECLE   $011C,  $011C,  $011C,  $011C   ; 666C   011C 011C 011C 011C
        DECLE   $0071,  $001C,  $0265,  $007D   ; 6670   0071 001C 0265 007D
        DECLE   $0345,  $0345,  $0071,  $0045   ; 6674   0345 0345 0071 0045
        DECLE   $011C,  $011C,  $011C,  $011C   ; 6678   011C 011C 011C 011C
        DECLE   $0076,  $0034,  $007D,  $0089   ; 667C   0076 0034 007D 0089
        DECLE   $007D,  $0089,  $007D,  $0018   ; 6680   007D 0089 007D 0018
        DECLE   $031C,  $0334,  $0334,  $0345   ; 6684   031C 0334 0334 0345
        DECLE   $007D,  $001C,  $0265,  $0271   ; 6688   007D 001C 0265 0271
        DECLE   $0334,  $0334,  $007D,  $0034   ; 668C   0334 0334 007D 0034
        DECLE   $0276,  $0089,  $0118,  $0345   ; 6690   0276 0089 0118 0345
        DECLE   $007D,  $0045,  $0134,  $0134   ; 6694   007D 0045 0134 0134
        DECLE   $011C,  $0134,  $0089,  $0018   ; 6698   011C 0134 0089 0018
        DECLE   $0334,  $0345,  $0334,  $0345   ; 669C   0334 0345 0334 0345
        DECLE   $0089,  $0034,  $0276,  $027D   ; 66A0   0089 0034 0276 027D
        DECLE   $0118,  $0345,  $0089,  $0045   ; 66A4   0118 0345 0089 0045
        DECLE   $0134,  $0134,  $0134,  $0134   ; 66A8   0134 0134 0134 0134
        DECLE   $03FF                           ; 66AC   03FF
L_66AD:
        DECR    R4                              ; 66AD   0014
L_66AE:
        ADDI    #$0005, R4                      ; 66AE   02FC 0005
L_66B0:
        MVI@    R4,     R0                      ; 66B0   02A0
        CMPR    R0,     R2                      ; 66B1   0142
        BGT     L_66AE                          ; 66B2   022E 0005

        CMPI    #$03FF, R0                      ; 66B4   0378 03FF
        BNEQ    L_66BE                          ; 66B6   020C 0006

        CLRR    R2                              ; 66B8   01D2
        INCR    R1                              ; 66B9   0009
        MVO@    R2,     R1                      ; 66BA   024A
        PULR    R0                              ; 66BB   02B0
        B       L_641D                          ; 66BC   0220 02A0

L_66BE:
        CMP@    R4,     R3                      ; 66BE   0363
        BNEQ    L_66AD                          ; 66BF   022C 0013

        MVII    #$0004, R0                      ; 66C1   02B8 0004

        JSR     R5,     X_RAND2                 ; 66C3   0004 0114 029E

        ADDR    R0,     R4                      ; 66C6   00C4
        MVI@    R4,     R0                      ; 66C7   02A0
        MOVR    R0,     R5                      ; 66C8   0085
        ANDI    #$00FF, R5                      ; 66C9   03BD 00FF
        XORR    R5,     R0                      ; 66CB   01E8
        SWAP    R0,     1                       ; 66CC   0040
        MVI@    R1,     R4                      ; 66CD   028C
        SDBD                                    ; 66CE   0001
        ANDI    #$F9FF, R4                      ; 66CF   03BC 00FF 00F9
        SARC    R0,     1                       ; 66D2   0078
        BC      L_66DB                          ; 66D3   0201 0006

        MOVR    R5,     R2                      ; 66D5   00AA
        SARC    R0,     1                       ; 66D6   0078
        BC      L_6614                          ; 66D7   0221 00C4
        B       L_6616                          ; 66D9   0220 00C4

L_66DB:
        SARC    R0,     1                       ; 66DB   0078
        BC      L_662D                          ; 66DC   0221 00B0

        MOVR    R5,     R3                      ; 66DE   00AB
        CMPI    #$007C, R2                      ; 66DF   037A 007C
        BLT     L_664B                          ; 66E1   0225 0097

        CMPI    #$0018, R3                      ; 66E3   037B 0018
        BNEQ    L_664B                          ; 66E5   022C 009B

        MVII    #$032E, R5                      ; 66E7   02BD 032E
        CMP@    R5,     R0                      ; 66E9   0368
        BEQ     L_664B                          ; 66EA   0224 00A0

        CMPI    #$032D, R1                      ; 66EC   0379 032D
        BNEQ    L_66F2                          ; 66EE   020C 0002

        ADDI    #$0008, R5                      ; 66F0   02FD 0008
L_66F2:
        MVI@    R5,     R0                      ; 66F2   02A8
        SWAP    R0,     1                       ; 66F3   0040
        ANDI    #$00FF, R0                      ; 66F4   03B8 00FF
        CMPR    R2,     R0                      ; 66F6   0150
        BEQ     L_664B                          ; 66F7   0224 00AD

        CMPI    #$007C, R0                      ; 66F9   0378 007C
        BLT     L_664B                          ; 66FB   0225 00B1

        ADDI    #$0004, R5                      ; 66FD   02FD 0004
        MVI@    R5,     R0                      ; 66FF   02A8
        ANDI    #$00FF, R0                      ; 6700   03B8 00FF
        CMPI    #$0018, R0                      ; 6702   0378 0018
        BNEQ    L_664B                          ; 6704   022C 00BA

        MVII    #$0045, R3                      ; 6706   02BB 0045
        B       L_6636                          ; 6708   0220 00D3

L_670A:
        MVII    #$0008, R5                      ; 670A   02BD 0008
        MVO     R5,     G_017F                  ; 670C   0245 017F
        MVI@    R1,     R4                      ; 670E   028C
        SDBD                                    ; 670F   0001
        ANDI    #$F9FF, R4                      ; 6710   03BC 00FF 00F9
        CMPI    #$0001, R0                      ; 6713   0378 0001
        BGT     L_675E                          ; 6715   020E 0047

        CMPI    #$0012, R3                      ; 6717   037B 0012
        BEQ     L_671F                          ; 6719   0204 0004

        MVII    #$0012, R3                      ; 671B   02BB 0012
        B       L_664B                          ; 671D   0220 00D3

L_671F:
        INCR    R1                              ; 671F   0009
        MVI@    R1,     R5                      ; 6720   028D
        DECR    R1                              ; 6721   0011
        SDBD                                    ; 6722   0001
        CMPI    #$59CA, R5                      ; 6723   037D 00CA 0059
        BNEQ    L_6733                          ; 6726   020C 000B

        MVII    #$0088, R2                      ; 6728   02BA 0088
        MVI     G_035E, R0                      ; 672A   0280 035E
        SARC    R0,     1                       ; 672C   0078
        BC      L_6616                          ; 672D   0221 0118

        MVII    #$0028, R2                      ; 672F   02BA 0028
        B       L_6614                          ; 6731   0220 011E

L_6733:
        CMPI    #$0028, R2                      ; 6733   037A 0028
        BEQ     L_673F                          ; 6735   0204 0008

        CMPI    #$0088, R2                      ; 6737   037A 0088
        BEQ     L_673F                          ; 6739   0204 0004

        MVII    #$004C, R3                      ; 673B   02BB 004C
        B       L_6636                          ; 673D   0220 0108

L_673F:
        PSHR    R2                              ; 673F   0272
L_6740:
        MVII    #$0008, R0                      ; 6740   02B8 0008

        JSR     R5,     X_RAND2                 ; 6742   0004 0114 029E
        JSR     R5,     L_6750                  ; 6745   0004 0164 0350
        DECLE   $0029,  $0035                   ; 6748   0029 0035

        SWAP    R1,     1                       ; 674A   0041
        SLL     R1,     2                       ; 674B   004D
        SLLC    R1,     1                       ; 674C   0059
        SLR     R1,     2                       ; 674D   0065
        RRC     R1,     1                       ; 674E   0071
        SARC    R1,     2                       ; 674F   007D
L_6750:
        ADDR    R0,     R5                      ; 6750   00C5
        MVI@    R5,     R2                      ; 6751   02AA
        MVI     G_018E, R0                      ; 6752   0280 018E
        CMPR    R0,     R2                      ; 6754   0142
        BEQ     L_6740                          ; 6755   0224 0016

        MVO     R2,     G_018E                  ; 6757   0242 018E
        CMP@    R6,     R2                      ; 6759   0372
        BLT     L_6614                          ; 675A   0225 0147
        B       L_6616                          ; 675C   0220 0147

L_675E:
        CMPI    #$0037, R2                      ; 675E   037A 0037
        BNEQ    L_676E                          ; 6760   020C 000C

        MVII    #$000F, R2                      ; 6762   02BA 000F
        ADDI    #$0006, R1                      ; 6764   02F9 0006
        MVO@    R2,     R1                      ; 6766   024A
        MVII    #$0038, R2                      ; 6767   02BA 0038
        CLRR    R1                              ; 6769   01C9
        MVO     R1,     G_017F                  ; 676A   0241 017F
        B       L_6862                          ; 676C   0200 00F4

L_676E:
        CMPI    #$0038, R2                      ; 676E   037A 0038
        BNEQ    L_677D                          ; 6770   020C 000B

        MVII    #$0080, R2                      ; 6772   02BA 0080
        MVI     G_035E, R0                      ; 6774   0280 035E
        SARC    R0,     2                       ; 6776   007C
        BNOV    L_67C3                          ; 6777   020A 004A

        MVII    #$0024, R2                      ; 6779   02BA 0024
        B       L_67C1                          ; 677B   0200 0044

L_677D:
        CMPI    #$0010, R3                      ; 677D   037B 0010
        BNEQ    L_67A9                          ; 677F   020C 0028

L_6781:
        MVII    #$0008, R0                      ; 6781   02B8 0008
        MVI     G_017B, R3                      ; 6783   0283 017B
        MVII    #$0005, R0                      ; 6785   02B8 0005
        INCR    R3                              ; 6787   000B
        SARC    R3,     1                       ; 6788   007B
        ADDR    R3,     R0                      ; 6789   00D8

        JSR     R5,     X_RAND2                 ; 678A   0004 0114 029E

        SLL     R0,     2                       ; 678D   004C
        SLL     R0,     1                       ; 678E   0048
        ADDI    #$0020, R0                      ; 678F   02F8 0020
        MVI     G_018B, R3                      ; 6791   0283 018B
        MVI     G_018C, R5                      ; 6793   0285 018C
        CMPR    R0,     R5                      ; 6795   0145
        BEQ     L_6781                          ; 6796   0224 0016

        CMPR    R0,     R3                      ; 6798   0143
        BEQ     L_6781                          ; 6799   0224 0019

        MVO     R5,     G_018D                  ; 679B   0245 018D
        MVO     R3,     G_018C                  ; 679D   0243 018C
        NOP                                     ; 679F   0034
        MVO     R0,     G_018B                  ; 67A0   0240 018B
        MOVR    R0,     R3                      ; 67A2   0083
L_67A3:
        SDBD                                    ; 67A3   0001
        MVII    #$59E0, R5                      ; 67A4   02BD 00E0 0059
        B       L_67C7                          ; 67A7   0200 001E

L_67A9:
        CMPI    #$0024, R2                      ; 67A9   037A 0024
        BEQ     L_67BB                          ; 67AB   0204 000E

        CMPI    #$0080, R2                      ; 67AD   037A 0080
        BEQ     L_67BF                          ; 67AF   0204 000E

        SDBD                                    ; 67B1   0001
        MVII    #$3710, R0                      ; 67B2   02B8 0010 0037
        ADDI    #$0007, R1                      ; 67B5   02F9 0007
        MVO@    R0,     R1                      ; 67B7   0248
        PULR    R0                              ; 67B8   02B0
        B       L_641D                          ; 67B9   0220 039D

L_67BB:
        MVII    #$0088, R2                      ; 67BB   02BA 0088
        B       L_67C3                          ; 67BD   0200 0004

L_67BF:
        MVII    #$0020, R2                      ; 67BF   02BA 0020
L_67C1:
        XORI    #$0200, R4                      ; 67C1   03FC 0200
L_67C3:
        SDBD                                    ; 67C3   0001
        MVII    #$59D5, R5                      ; 67C4   02BD 00D5 0059
L_67C7:
        MVO@    R4,     R1                      ; 67C7   024C
        INCR    R1                              ; 67C8   0009
        MVO@    R5,     R1                      ; 67C9   024D

L_67CA:
        JSR     R5,     L_67D2                  ; 67CA   0004 0164 03D2

        DECR    R0                              ; 67CD   0010
        COMR    R2                              ; 67CE   001A
        NEGR    R0                              ; 67CF   0020
        ADCR    R0                              ; 67D0   0028
        GSWD    R0                              ; 67D1   0030
L_67D2:
        ADD     G_017B, R5                      ; 67D2   02C5 017B
        MVI@    R5,     R4                      ; 67D4   02AC
        ADD     G_017F, R4                      ; 67D5   02C4 017F
        MVO     R4,     G_017F                  ; 67D7   0244 017F
        B       L_6862                          ; 67D9   0200 0087

L_67DB:
        CMPI    #$0001, R0                      ; 67DB   0378 0001
        BLE     L_6844                          ; 67DD   0206 0065

        MVI@    R1,     R4                      ; 67DF   028C
        SDBD                                    ; 67E0   0001
        ANDI    #$F9FF, R4                      ; 67E1   03BC 00FF 00F9
        CMPI    #$0048, R2                      ; 67E4   037A 0048
        BNEQ    L_67F7                          ; 67E6   020C 000F

        MVO@    R4,     R1                      ; 67E8   024C
        MVII    #$000F, R2                      ; 67E9   02BA 000F
        ADDI    #$0006, R1                      ; 67EB   02F9 0006
        MVO@    R2,     R1                      ; 67ED   024A
        INCR    R1                              ; 67EE   0009
        SDBD                                    ; 67EF   0001
        MVII    #$4918, R2                      ; 67F0   02BA 0018 0049
L_67F3:
        MVO@    R2,     R1                      ; 67F3   024A
        PULR    R0                              ; 67F4   02B0
        B       L_641D                          ; 67F5   0220 03D9

L_67F7:
        CMPI    #$0049, R2                      ; 67F7   037A 0049
        BNEQ    L_67FF                          ; 67F9   020C 0004

        MVII    #$006C, R2                      ; 67FB   02BA 006C
        B       L_67CA                          ; 67FD   0220 0034

L_67FF:
        CMPI    #$001C, R2                      ; 67FF   037A 001C
        BGT     L_680B                          ; 6801   020E 0008

        ADDI    #$0007, R1                      ; 6803   02F9 0007
        SDBD                                    ; 6805   0001
        MVII    #$4818, R2                      ; 6806   02BA 0018 0048
        B       L_67F3                          ; 6809   0220 0017

L_680B:
        CMPI    #$0018, R3                      ; 680B   037B 0018
        BNEQ    L_6822                          ; 680D   020C 0013

        PSHR    R1                              ; 680F   0271
        ADDI    #$0003, R1                      ; 6810   02F9 0003
        ADDI    #$0004, R3                      ; 6812   02FB 0004
        SWAP    R3,     1                       ; 6814   0043
        MVO@    R3,     R1                      ; 6815   024B
        PULR    R1                              ; 6816   02B1
        MVII    #$0005, R0                      ; 6817   02B8 0005

        JSR     R5,     X_RAND2                 ; 6819   0004 0114 029E

        MVII    #$0024, R3                      ; 681C   02BB 0024
        SLL     R0,     2                       ; 681E   004C
        ADDR    R0,     R3                      ; 681F   00C3
        B       L_67A3                          ; 6820   0220 007E

L_6822:
        MVII    #$001C, R2                      ; 6822   02BA 001C
        MVI     G_017B, R0                      ; 6824   0280 017B
        TSTR    R0                              ; 6826   0080
        BEQ     L_67C1                          ; 6827   0224 0067

        MVI     G_035E, R0                      ; 6829   0280 035E
        SARC    R0,     1                       ; 682B   0078
        BC      L_67C1                          ; 682C   0221 006C

        MVI     G_018A, R0                      ; 682E   0280 018A
        CMPI    #$0001, R0                      ; 6830   0378 0001
        BGT     L_67C1                          ; 6832   022E 0072

        MVII    #$0324, R5                      ; 6834   02BD 0324
        BLT     L_683A                          ; 6836   0205 0002

        MVII    #$032C, R5                      ; 6838   02BD 032C
L_683A:
        INCR    R0                              ; 683A   0008
        MVO     R0,     G_018A                  ; 683B   0240 018A
        MVII    #$006B, R0                      ; 683D   02B8 006B
        SWAP    R0,     1                       ; 683F   0040
        XORR    R3,     R0                      ; 6840   01D8
        MVO@    R0,     R5                      ; 6841   0268
        B       L_67C1                          ; 6842   0220 0082

L_6844:
        TSTR    R3                              ; 6844   009B
        BNEQ    L_684A                          ; 6845   020C 0003

        PULR    R0                              ; 6847   02B0
        B       L_6866                          ; 6848   0200 001C

L_684A:
        CMPI    #$0050, R3                      ; 684A   037B 0050
        BNEQ    L_685C                          ; 684C   020C 000E

        MVI     G_018A, R0                      ; 684E   0280 018A
        DECR    R0                              ; 6850   0010
        BMI     L_6855                          ; 6851   020B 0002

        MVO     R0,     G_018A                  ; 6853   0240 018A
L_6855:
        CLRR    R3                              ; 6855   01DB
        ADDI    #$0003, R1                      ; 6856   02F9 0003
        MVO@    R3,     R1                      ; 6858   024B
        PULR    R0                              ; 6859   02B0
        B       L_6866                          ; 685A   0200 000A

L_685C:
        MVII    #$0030, R3                      ; 685C   02BB 0030
        MVO     R3,     G_017F                  ; 685E   0243 017F
        MVII    #$0050, R3                      ; 6860   02BB 0050
L_6862:
        PULR    R0                              ; 6862   02B0

        JSR     R5,     L_6869                  ; 6863   0004 0168 0069

L_6866:
        J       L_641D                          ; 6866   0004 0364 001D

L_6869:
        PSHR    R5                              ; 6869   0275
L_686A:
        PSHR    R0                              ; 686A   0270
        NOP                                     ; 686B   0034
        SWAP    R2,     1                       ; 686C   0042
        XORR    R3,     R2                      ; 686D   01DA
        PSHR    R2                              ; 686E   0272
        CMPI    #$0006, R0                      ; 686F   0378 0006
        BNEQ    L_68C1                          ; 6871   020C 004E

        MVI     G_01A6, R1                      ; 6873   0281 01A6
        TSTR    R1                              ; 6875   0089
        BEQ     L_687F                          ; 6876   0204 0007

        JSR     R5,     L_6C72                  ; 6878   0004 016C 0072

        MVII    #$0030, R3                      ; 687B   02BB 0030
        B       L_68CC                          ; 687D   0200 004D

L_687F:
        MVII    #$0200, R1                      ; 687F   02B9 0200
        MVO     R1,     G_0352                  ; 6881   0241 0352
        MVO     R1,     G_035A                  ; 6883   0241 035A
        MVI     G_0191, R1                      ; 6885   0281 0191
        TSTR    R1                              ; 6887   0089
        BNEQ    L_6891                          ; 6888   020C 0007

        JSR     R5,     L_6B78                  ; 688A   0004 0168 0378

        MVII    #$0018, R3                      ; 688D   02BB 0018
        B       L_68CC                          ; 688F   0200 003B

L_6891:
        MVI     G_0195, R1                      ; 6891   0281 0195
        MVI     G_0193, R3                      ; 6893   0283 0193
        DECR    R1                              ; 6895   0011
        BEQ     L_68B1                          ; 6896   0204 0019

        DECR    R3                              ; 6898   0013
        BNEQ    L_68A2                          ; 6899   020C 0007

        JSR     R5,     L_6BA0                  ; 689B   0004 0168 03A0

        MVII    #$000C, R3                      ; 689E   02BB 000C
        B       L_68CC                          ; 68A0   0200 002A

L_68A2:
        JSR     R5,     L_6BB5                  ; 68A2   0004 0168 03B5

        MVII    #$0010, R3                      ; 68A5   02BB 0010
        MVI     G_01C3, R5                      ; 68A7   0285 01C3
        CMPI    #$0002, R5                      ; 68A9   037D 0002
        BEQ     L_68CC                          ; 68AB   0204 001F

        MVII    #$0028, R3                      ; 68AD   02BB 0028
        B       L_68CC                          ; 68AF   0200 001B

L_68B1:
        PSHR    R3                              ; 68B1   0273

        JSR     R5,     L_6BA0                  ; 68B2   0004 0168 03A0

        PULR    R3                              ; 68B5   02B3
        DECR    R3                              ; 68B6   0013
        BNEQ    L_68BD                          ; 68B7   020C 0004

        MVII    #$0018, R3                      ; 68B9   02BB 0018
        B       L_68CC                          ; 68BB   0200 000F

L_68BD:
        MVII    #$0010, R3                      ; 68BD   02BB 0010
        B       L_68CC                          ; 68BF   0200 000B

L_68C1:
        MVI     G_017B, R3                      ; 68C1   0283 017B
        SLL     R3,     2                       ; 68C3   004F
        ADD     G_017F, R3                      ; 68C4   02C3 017F
        MVII    #$003F, R1                      ; 68C6   02B9 003F
        CMPR    R1,     R3                      ; 68C8   014B
        BLE     L_68CC                          ; 68C9   0206 0001

        MOVR    R1,     R3                      ; 68CB   008B
L_68CC:
        PULR    R2                              ; 68CC   02B2
        PULR    R0                              ; 68CD   02B0
        PSHR    R0                              ; 68CE   0270

        JSR     R5,     .EXEC.9AD               ; 68CF   0004 0118 01AD

        PULR    R0                              ; 68D2   02B0
        PULR    R7                              ; 68D3   02B7

        PSHR    R5                              ; 68D4   0275
L_68D5:
        CLRR    R0                              ; 68D5   01C0
        MVO     R0,     G_0102                  ; 68D6   0240 0102

        JSR     R5,     L_622C                  ; 68D8   0004 0160 022C

        MVI     G_0165, R3                      ; 68DB   0283 0165
        ADDI    #$0166, R3                      ; 68DD   02FB 0166
        MVI@    R3,     R1                      ; 68DF   0299
        INCR    R1                              ; 68E0   0009
        MVO@    R1,     R3                      ; 68E1   0259

        JSR     R5,     L_6AAA                  ; 68E2   0004 0168 02AA

        MVII    #$020E, R2                      ; 68E5   02BA 020E
        MVI     G_017A, R4                      ; 68E7   0284 017A
        CMPI    #$0008, R4                      ; 68E9   037C 0008
        BNEQ    L_68EF                          ; 68EB   020C 0002

        MVII    #$0210, R2                      ; 68ED   02BA 0210
L_68EF:
        MVI@    R2,     R4                      ; 68EF   0294
        XORI    #$0006, R4                      ; 68F0   03FC 0006
        MVO@    R4,     R2                      ; 68F2   0254
        INCR    R2                              ; 68F3   000A
        MVI@    R2,     R4                      ; 68F4   0294
        XORI    #$0006, R4                      ; 68F5   03FC 0006
        MVO@    R4,     R2                      ; 68F7   0254
        MVII    #$0018, R1                      ; 68F8   02B9 0018

        JSR     R5,     L_627D                  ; 68FA   0004 0160 027D

        DECR    R2                              ; 68FD   0012
        MVI     G_035F, R3                      ; 68FE   0283 035F
        DECR    R3                              ; 6900   0013
        MVI@    R3,     R3                      ; 6901   029B
        TSTR    R3                              ; 6902   009B
        BNEQ    L_68EF                          ; 6903   022C 0015

        MVI     G_0175, R1                      ; 6905   0281 0175
        ADD     G_019B, R1                      ; 6907   02C1 019B
        MVO     R1,     G_019B                  ; 6909   0241 019B

        JSR     R5,     L_5ADE                  ; 690B   0004 0158 02DE

        B       L_69AE                          ; 690E   0200 009E

        PSHR    R5                              ; 6910   0275
        MVI     G_0190, R0                      ; 6911   0280 0190
        TSTR    R0                              ; 6913   0080
        BNEQ    L_6942                          ; 6914   020C 002C

        MVI     G_011B, R0                      ; 6916   0280 011B

        JSR     R5,     .EXEC.772               ; 6918   0004 0114 0372

        MVII    #$034F, R4                      ; 691B   02BC 034F

        JSR     R5,     .EXEC.7A3               ; 691D   0004 0114 03A3

        CMPI    #$0005, R2                      ; 6920   037A 0005
        BLT     L_6943                          ; 6922   0205 001F

        TSTR    R4                              ; 6924   00A4
        BPL     L_6928                          ; 6925   0203 0001

        NEGR    R4                              ; 6927   0024
L_6928:
        CMPI    #$0004, R4                      ; 6928   037C 0004
        BGT     L_6942                          ; 692A   020E 0016

        MVI     G_0191, R0                      ; 692C   0280 0191
        TSTR    R0                              ; 692E   0080
        BEQ     L_6942                          ; 692F   0204 0011

        MVI     G_0195, R0                      ; 6931   0280 0195
        CMPI    #$0002, R0                      ; 6933   0378 0002
        BEQ     L_6942                          ; 6935   0204 000B

        SUBI    #$0006, R2                      ; 6937   033A 0006
        DECR    R0                              ; 6939   0010
        BEQ     L_693E                          ; 693A   0204 0002

        SUBI    #$0002, R2                      ; 693C   033A 0002
L_693E:
        CMPI    #$0006, R2                      ; 693E   037A 0006
        BLT     L_6943                          ; 6940   0205 0001
L_6942:
        PULR    R7                              ; 6942   02B7

L_6943:
        JSR     R5,     L_622C                  ; 6943   0004 0160 022C

        MVII    #$0017, R0                      ; 6946   02B8 0017
        MVO     R0,     G_0111                  ; 6948   0240 0111
        CLRR    R0                              ; 694A   01C0
        MVO     R0,     G_0112                  ; 694B   0240 0112
        MVO     R0,     G_0113                  ; 694D   0240 0113
        MVII    #$0003, R1                      ; 694F   02B9 0003
        MVO     R1,     G_0102                  ; 6951   0241 0102

        JSR     R5,     L_6B5C                  ; 6953   0004 0168 035C

        MVII    #$0030, R1                      ; 6956   02B9 0030
        MVO     R1,     G_0146                  ; 6958   0241 0146

        JSR     R5,     L_627D                  ; 695A   0004 0160 027D

        MVI     G_0165, R1                      ; 695D   0281 0165
        MVII    #$016E, R2                      ; 695F   02BA 016E
        MOVR    R2,     R4                      ; 6961   0094
        MVI@    R4,     R3                      ; 6962   02A3
        ADD@    R4,     R3                      ; 6963   02E3
        BEQ     L_69C8                          ; 6964   0204 0062

        CLRR    R0                              ; 6966   01C0
        XOR     G_0161, R0                      ; 6967   03C0 0161
        BEQ     L_69A9                          ; 6969   0204 003E

        MOVR    R2,     R4                      ; 696B   0094
        ADDR    R1,     R4                      ; 696C   00CC
        MVI@    R4,     R3                      ; 696D   02A3
        TSTR    R3                              ; 696E   009B
        BNEQ    L_699F                          ; 696F   020C 002E

        PSHR    R1                              ; 6971   0271
        PSHR    R2                              ; 6972   0272
        MVII    #$0007, R3                      ; 6973   02BB 0007
        MVII    #$0278, R4                      ; 6975   02BC 0278

        JSR     R5,     X_PRINT_R5              ; 6977   0004 0118 007B
        STRING  " GAME OVER,PLAYER   "          ; 697A  
        DECLE   $0000                           ; 698E   0000

        MOVR    R1,     R0                      ; 698F   0088
        INCR    R0                              ; 6990   0008
        MVII    #$0001, R1                      ; 6991   02B9 0001
        MVII    #$028A, R4                      ; 6993   02BC 028A

        JSR     R5,     X_PRNUM_RGT             ; 6995   0004 0118 00C5

        MVII    #$0060, R1                      ; 6998   02B9 0060

        JSR     R5,     L_627D                  ; 699A   0004 0160 027D

        PULR    R2                              ; 699D   02B2
        PULR    R1                              ; 699E   02B1
L_699F:
        XORI    #$0001, R1                      ; 699F   03F9 0001
        MOVR    R2,     R4                      ; 69A1   0094
        ADDR    R1,     R4                      ; 69A2   00CC
        MVI@    R4,     R3                      ; 69A3   02A3
        TSTR    R3                              ; 69A4   009B
        BEQ     L_69A9                          ; 69A5   0204 0002

        MVO     R1,     G_0165                  ; 69A7   0241 0165
L_69A9:
        ADD     G_0165, R2                      ; 69A9   02C2 0165
        MVI@    R2,     R3                      ; 69AB   0293
        DECR    R3                              ; 69AC   0013
        MVO@    R3,     R2                      ; 69AD   0253

L_69AE:
        JSR     R5,     .EXEC.7B3               ; 69AE   0004 0114 03B3

        MVII    #$0004, R3                      ; 69B1   02BB 0004
        MVO     R3,     G_0102                  ; 69B3   0243 0102
L_69B5:
        MVI     G_0102, R3                      ; 69B5   0283 0102
        TSTR    R3                              ; 69B7   009B
        BNEQ    L_69B5                          ; 69B8   022C 0004

        MVI     G_0165, R3                      ; 69BA   0283 0165
        ADDI    #$0166, R3                      ; 69BC   02FB 0166
        MVI@    R3,     R1                      ; 69BE   0299
        SLL     R1,     1                       ; 69BF   0049
        INCR    R1                              ; 69C0   0009
        ANDI    #$0007, R1                      ; 69C1   03B9 0007
        MVO     R1,     G_017A                  ; 69C3   0241 017A
        J       L_5159                          ; 69C5   0004 0350 0159

L_69C8:
        JSR     R5,     .EXEC.7B3               ; 69C8   0004 0114 03B3

        MVII    #$0003, R3                      ; 69CB   02BB 0003
        MVO     R3,     G_0102                  ; 69CD   0243 0102
        MVII    #$0007, R3                      ; 69CF   02BB 0007
        MVII    #$027C, R4                      ; 69D1   02BC 027C

        JSR     R5,     X_PRINT_R5              ; 69D3   0004 0118 007B
        STRING  " GAME OVER "                   ; 69D6  
        DECLE   $0000                           ; 69E1   0000

        JSR     R5,     L_6AE1                  ; 69E2   0004 0168 02E1

        MVII    #$0080, R1                      ; 69E5   02B9 0080

        JSR     R5,     L_627D                  ; 69E7   0004 0160 027D

L_69EA:
        MVI     G_0102, R0                      ; 69EA   0280 0102
        TSTR    R0                              ; 69EC   0080
        BNEQ    L_69EA                          ; 69ED   022C 0004

        CLRR    R0                              ; 69EF   01C0
        MVO     R0,     G_018F                  ; 69F0   0240 018F
        MVO     R0,     G_015F                  ; 69F2   0240 015F
        MVII    #$000B, R0                      ; 69F4   02B8 000B
        MVO     R0,     G_017A                  ; 69F6   0240 017A
        J       L_509A                          ; 69F8   0004 0350 009A

L_69FB:
        MVII    #$0080, R3                      ; 69FB   02BB 0080
        INCR    R7                              ; 69FD   000F

L_69FE:
        MVI@    R5,     R3                      ; 69FE   02AB

L_69FF:
        JSR     R4,     .EXEC.A76               ; 69FF   0004 0018 0276

        PSHR    R5                              ; 6A02   0275

        JSR     R5,     .EXEC.A83               ; 6A03   0004 0118 0283

        PULR    R5                              ; 6A06   02B5
L_6A07:
        CLRR    R1                              ; 6A07   01C9
        MVO     R1,     G_01EF                  ; 6A08   0241 01EF
        INCR    R1                              ; 6A0A   0009
        MVO     R1,     G_0147                  ; 6A0B   0241 0147
        MVI     G_017E, R1                      ; 6A0D   0281 017E
        TSTR    R1                              ; 6A0F   0089
        BNEQ    L_6A1A                          ; 6A10   020C 0008

        MVI     G_035F, R1                      ; 6A12   0281 035F
        MVO     R1,     G_017D                  ; 6A14   0241 017D
        SWAP    R1,     1                       ; 6A16   0041
        NOP                                     ; 6A17   0034
        MVO     R1,     G_017E                  ; 6A18   0241 017E
L_6A1A:
        MVI     G_01CC, R1                      ; 6A1A   0281 01CC
        TSTR    R1                              ; 6A1C   0089
        BNEQ    L_6A22                          ; 6A1D   020C 0003
        J       .EXEC.BC2                       ; 6A1F   0004 0318 03C2

L_6A22:
        CLRR    R1                              ; 6A22   01C9
        MVO     R1,     G_01CC                  ; 6A23   0241 01CC
        J       X_PLAY_MUS2                     ; 6A25   0004 0318 035D

        TSTR    R0                              ; 6A28   0080
        SAR     R2,     1                       ; 6A29   006A
        INCR    R5                              ; 6A2A   000D
        SAR     R3,     1                       ; 6A2B   006B
        NEGR    R6                              ; 6A2C   0026
        SAR     R0,     2                       ; 6A2D   006C
        SLL     R0,     1                       ; 6A2E   0048
        SAR     R3,     1                       ; 6A2F   006B
        ADDR    R2,     R2                      ; 6A30   00D2
        SAR     R2,     1                       ; 6A31   006A
L_6A32:
        MVII    #$00F0, R3                      ; 6A32   02BB 00F0

L_6A34:
        JSR     R4,     .EXEC.A76               ; 6A34   0004 0018 0276

        CLRR    R0                              ; 6A37   01C0
        MVO     R0,     G_01EA                  ; 6A38   0240 01EA
        MVO     R0,     G_01ED                  ; 6A3A   0240 01ED
        NOP                                     ; 6A3C   0034
        MVO     R0,     G_01EE                  ; 6A3D   0240 01EE
        INCR    R0                              ; 6A3F   0008
        MVO     R1,     G_01EF                  ; 6A40   0241 01EF
        MVO     R0,     G_0147                  ; 6A42   0240 0147
        J       X_PLAY_MUS1                     ; 6A44   0004 0318 0327

L_6A47:
        PSHR    R5                              ; 6A47   0275
        MVII    #$0001, R1                      ; 6A48   02B9 0001

        JSR     R5,     L_6A32                  ; 6A4A   0004 0168 0232
        DECLE   $0230,  $0210,  $03F2,  $0234   ; 6A4D   0230 0210 03F2 0234
        DECLE   $0001,  $0210,  $01F0,  $01E0   ; 6A51   0001 0210 01F0 01E0
        DECLE   $01C0,  $01B1,  $0001,  $03F2   ; 6A55   01C0 01B1 0001 03F2
        DECLE   $01C6,  $03F4,  $0004,  $0171   ; 6A59   01C6 03F4 0004 0171
        DECLE   $0151,  $03F4,  $0173,  $0001   ; 6A5D   0151 03F4 0173 0001
        DECLE   $0121,  $0131,  $00F1,  $03F2   ; 6A61   0121 0131 00F1 03F2
        DECLE   $0106,  $03F4,  $0004,  $03F4   ; 6A65   0106 03F4 0004 03F4
        DECLE   $0040,  $03F4,  $00A0,  $03F4   ; 6A69   0040 03F4 00A0 03F4
        DECLE   $0100,  $03F4,  $0160,  $01C4   ; 6A6D   0100 03F4 0160 01C4
        DECLE   $01B4,  $01C4,  $01B4,  $01C4   ; 6A71   01B4 01C4 01B4 01C4
        DECLE   $01B4,  $01C4,  $01B4,  $03F2   ; 6A75   01B4 01C4 01B4 03F2
        DECLE   $01C6,  $0002,  $0000           ; 6A79   01C6 0002 0000
L_6A7C:
        CLRR    R0                              ; 6A7C   01C0
        MVO     R0,     G_01EF                  ; 6A7D   0240 01EF
        PULR    R7                              ; 6A7F   02B7

        DECLE   $0170,  $0150,  $03F2,  $0174   ; 6A80   0170 0150 03F2 0174
        DECLE   $0001,  $0150,  $0130,  $0120   ; 6A84   0001 0150 0130 0120
        DECLE   $0100,  $00F1,  $0001,  $03F2   ; 6A88   0100 00F1 0001 03F2
        DECLE   $0106,  $03F4,  $0004,  $00B1   ; 6A8C   0106 03F4 0004 00B1
        DECLE   $0091,  $03F4,  $00B3,  $0001   ; 6A90   0091 03F4 00B3 0001
        DECLE   $0061,  $0071,  $0031,  $03F2   ; 6A94   0061 0071 0031 03F2
        DECLE   $0046,  $03F4,  $0003,  $03F4   ; 6A98   0046 03F4 0003 03F4
        DECLE   $0074,  $03F4,  $00D0,  $03F4   ; 6A9C   0074 03F4 00D0 03F4
        DECLE   $0130,  $0191,  $03F2,  $0196   ; 6AA0   0130 0191 03F2 0196
        DECLE   $03F2,  $0196,  $0002,  $0000   ; 6AA4   03F2 0196 0002 0000

        B       L_6A7C                          ; 6AA8   0220 002D

L_6AAA:
        PSHR    R5                              ; 6AAA   0275
        ADD     G_017A, R7                      ; 6AAB   02C7 017A
        B       L_6AB7                          ; 6AAD   0200 0008
        B       L_6AB7                          ; 6AAF   0200 0006
        B       L_6AE2                          ; 6AB1   0200 002F
        B       L_6AB7                          ; 6AB3   0200 0002
        B       L_6B2D                          ; 6AB5   0200 0076

L_6AB7:
        MVII    #$0005, R1                      ; 6AB7   02B9 0005

        JSR     R5,     L_6A32                  ; 6AB9   0004 0168 0232
        DECLE   $021A,  $026D,  $021A,  $026D   ; 6ABC   021A 026D 021A 026D
        DECLE   $021D,  $020A,  $026D,  $020A   ; 6AC0   021D 020A 026D 020A
        DECLE   $026D,  $020D,  $01FA,  $026D   ; 6AC4   026D 020D 01FA 026D
        DECLE   $01FA,  $026D,  $02AD,  $02DD   ; 6AC8   01FA 026D 02AD 02DD
        DECLE   $015D,  $009D,  $0004,  $0000   ; 6ACC   015D 009D 0004 0000

        B       L_6A7C                          ; 6AD0   0220 0055

        DECLE   $00ED,  $012D,  $015D,  $012D   ; 6AD2   00ED 012D 015D 012D
        DECLE   $00ED,  $011D,  $014D,  $011D   ; 6AD6   00ED 011D 014D 011D
        DECLE   $010D,  $013D,  $017D,  $01AD   ; 6ADA   010D 013D 017D 01AD
        DECLE   $0002,  $014D,  $0000           ; 6ADE   0002 014D 0000
L_6AE1:
        PSHR    R5                              ; 6AE1   0275
L_6AE2:
        MVII    #$0002, R1                      ; 6AE2   02B9 0002

        JSR     R5,     L_6A32                  ; 6AE4   0004 0168 0232
        DECLE   $01A1,  $0211,  $01E2,  $01A3   ; 6AE7   01A1 0211 01E2 01A3
        DECLE   $0191,  $0211,  $01E2,  $0193   ; 6AEB   0191 0211 01E2 0193
        DECLE   $0171,  $01A1,  $01F4,  $0211   ; 6AEF   0171 01A1 01F4 0211
        DECLE   $01F2,  $03F4,  $01E4,  $03F4   ; 6AF3   01F2 03F4 01E4 03F4
        DECLE   $01C4,  $01A1,  $0211,  $01E2   ; 6AF7   01C4 01A1 0211 01E2
        DECLE   $01A3,  $0191,  $0211,  $01E2   ; 6AFB   01A3 0191 0211 01E2
        DECLE   $0193,  $0171,  $01A1,  $01E4   ; 6AFF   0193 0171 01A1 01E4
        DECLE   $0211,  $01E2,  $03F4,  $01C4   ; 6B03   0211 01E2 03F4 01C4
        DECLE   $03F4,  $01A4,  $0004,  $0000   ; 6B07   03F4 01A4 0004 0000

        B       L_6A7C                          ; 6B0B   0220 0090

        DECLE   $00E1,  $0091,  $0021,  $0091   ; 6B0D   00E1 0091 0021 0091
        DECLE   $0121,  $00D1,  $0121,  $00D1   ; 6B11   0121 00D1 0121 00D1
        DECLE   $0071,  $0021,  $0071,  $0021   ; 6B15   0071 0021 0071 0021
        DECLE   $00E1,  $0091,  $0151,  $0101   ; 6B19   00E1 0091 0151 0101
        DECLE   $00E1,  $0091,  $0021,  $0091   ; 6B1D   00E1 0091 0021 0091
        DECLE   $0121,  $00D1,  $0121,  $00D1   ; 6B21   0121 00D1 0121 00D1
        DECLE   $0071,  $0021,  $0121,  $00D1   ; 6B25   0071 0021 0121 00D1
        DECLE   $0091,  $0041,  $00E1,  $0004   ; 6B29   0091 0041 00E1 0004
L_6B2D:
        MVII    #$0004, R1                      ; 6B2D   02B9 0004

        JSR     R5,     L_6A32                  ; 6B2F   0004 0168 0232
        DECLE   $0179,  $019A,  $01BA,  $01C9   ; 6B32   0179 019A 01BA 01C9
        DECLE   $01B9,  $0199,  $017A,  $0169   ; 6B36   01B9 0199 017A 0169
        DECLE   $014A,  $0129,  $0179,  $019A   ; 6B3A   014A 0129 0179 019A
        DECLE   $01BA,  $01C9,  $01B9,  $0199   ; 6B3E   01BA 01C9 01B9 0199
        DECLE   $017A,  $0167,  $0004,  $0000   ; 6B42   017A 0167 0004 0000

        B       L_6A7C                          ; 6B46   0220 00CB

        SUBR    R5,     R1                      ; 6B48   0129
        CMPR    R1,     R2                      ; 6B49   014A
        CMPR    R5,     R2                      ; 6B4A   016A
        CMPR    R7,     R1                      ; 6B4B   0179
        CMPR    R7,     R1                      ; 6B4C   0179
        CMPR    R7,     R1                      ; 6B4D   0179
        CMPR    R1,     R2                      ; 6B4E   014A
        SUBR    R5,     R1                      ; 6B4F   0129
        SUBR    R1,     R2                      ; 6B50   010A
        ADDR    R7,     R1                      ; 6B51   00F9
        SUBR    R5,     R1                      ; 6B52   0129
        CMPR    R1,     R2                      ; 6B53   014A
        CMPR    R5,     R2                      ; 6B54   016A
        CMPR    R7,     R1                      ; 6B55   0179
        CMPR    R7,     R1                      ; 6B56   0179
        CMPR    R7,     R1                      ; 6B57   0179
        CMPR    R1,     R2                      ; 6B58   014A
        SUBR    R4,     R7                      ; 6B59   0127

        DECLE   $0004,  $0000                   ; 6B5A   0004 0000
L_6B5C:
        PSHR    R5                              ; 6B5C   0275

        JSR     R5,     L_69FE                  ; 6B5D   0004 0168 01FE
        DECLE   $00F2,  $0389,  $03C0,  $008B   ; 6B60   00F2 0389 03C0 008B
        DECLE   $0308,  $008B,  $0304,  $008B   ; 6B64   0308 008B 0304 008B
        DECLE   $03F1,  $03F7                   ; 6B68   03F1 03F7

        MOVR    R1,     R7                      ; 6B6A   008F

        DECLE   $0018,  $03C0,  $0040,  $03C8   ; 6B6B   0018 03C0 0040 03C8
        DECLE   $0040,  $03C4,  $0040,  $0001   ; 6B6F   0040 03C4 0040 0001
        DECLE   $0027                           ; 6B73   0027

        ANDR    R1,     R6                      ; 6B74   018E
        MOVR    R1,     R7                      ; 6B75   008F

        RSWD    R4                              ; 6B76   003C
        ADD@    R1,     R7                      ; 6B77   02CF

L_6B78:
        PSHR    R5                              ; 6B78   0275

        JSR     R5,     L_69FB                  ; 6B79   0004 0168 01FB

        AND@    R1,     R1                      ; 6B7C   0389
        XOR@    R2,     R0                      ; 6B7D   03D0
        SLLC    R1,     1                       ; 6B7E   0059
        XOR@    R3,     R0                      ; 6B7F   03D8
        SLLC    R1,     1                       ; 6B80   0059
        XOR@    R2,     R4                      ; 6B81   03D4
        CMPR    R3,     R1                      ; 6B82   0159
        XOR@    R3,     R3                      ; 6B83   03DB
        MOVR    R1,     R7                      ; 6B84   008F

        DECLE   $0000,  $0001,  $03C3,  $008F   ; 6B85   0000 0001 03C3 008F
        DECLE   $0008,  $0035                   ; 6B89   0008 0035

        MOVR    R1,     R7                      ; 6B8B   008F

        DECR    R0                              ; 6B8C   0010
        DIS                                     ; 6B8D   0003
        XOR     .BTAB.CF,R1                     ; 6B8E   03C1 02CF
L_6B90:
        PSHR    R5                              ; 6B90   0275
        MVII    #$0001, R0                      ; 6B91   02B8 0001
        MVO     R0,     G_01CC                  ; 6B93   0240 01CC

        JSR     R5,     L_6A07                  ; 6B95   0004 0168 0207
        DECLE   $0124,  $01A4,  $0130,  $01A0   ; 6B98   0124 01A4 0130 01A0
        DECLE   $0138,  $01A8,  $0000           ; 6B9C   0138 01A8 0000

        PULR    R7                              ; 6B9F   02B7

L_6BA0:
        PSHR    R5                              ; 6BA0   0275

        JSR     R5,     L_69FB                  ; 6BA1   0004 0168 01FB
        DECLE   $0389,  $03C0,  $0008,  $0308   ; 6BA4   0389 03C0 0008 0308
        DECLE   $0008,  $0304,  $0100,  $0001   ; 6BA8   0008 0304 0100 0001

        RRC     R3,     1                       ; 6BAC   0073
        MOVR    R1,     R7                      ; 6BAD   008F

        DECLE   $000C,  $0035                   ; 6BAE   000C 0035

        MOVR    R1,     R7                      ; 6BB0   008F

        DECR    R0                              ; 6BB1   0010
        DIS                                     ; 6BB2   0003
        XOR     .BTAB.CF,R1                     ; 6BB3   03C1 02CF
L_6BB5:
        PSHR    R5                              ; 6BB5   0275

        JSR     R5,     L_69FB                  ; 6BB6   0004 0168 01FB
        DECLE   $0389,  $03C0,  $0008,  $0308   ; 6BB9   0389 03C0 0008 0308
        DECLE   $0008,  $0304,  $0100,  $0001   ; 6BBD   0008 0304 0100 0001

        RRC     R3,     1                       ; 6BC1   0073
        MOVR    R1,     R7                      ; 6BC2   008F

        DECLE   $0008,  $0035,  $008F,  $0004   ; 6BC3   0008 0035 008F 0004

        DIS                                     ; 6BC7   0003
        XOR     .BTAB.CF,R1                     ; 6BC8   03C1 02CF
L_6BCA:
        PSHR    R5                              ; 6BCA   0275

        JSR     R5,     L_69FE                  ; 6BCB   0004 0168 01FE
        DECLE   $0090,  $0389,  $03C0,  $0100   ; 6BCE   0090 0389 03C0 0100
        DECLE   $03C8,  $013F,  $03C4,  $013F   ; 6BD2   03C8 013F 03C4 013F
        DECLE   $0001                           ; 6BD6   0001

        XOR@    R6,     R3                      ; 6BD7   03F3
        ANDR    R1,     R6                      ; 6BD8   018E
        MOVR    R1,     R7                      ; 6BD9   008F

        ADCR    R0                              ; 6BDA   0028
        ADD@    R1,     R7                      ; 6BDB   02CF

L_6BDC:
        PSHR    R5                              ; 6BDC   0275

        JSR     R5,     L_69FE                  ; 6BDD   0004 0168 01FE
        DECLE   $0092                           ; 6BE0   0092

        AND@    R1,     R1                      ; 6BE1   0389
        SWAP    R0,     1                       ; 6BE2   0040
        ADD@    R1,     R7                      ; 6BE3   02CF

        DECLE   $0048,  $003F                   ; 6BE4   0048 003F

        SWAP    R0,     2                       ; 6BE6   0044
        ADD@    R1,     R7                      ; 6BE7   02CF

        INCR    R4                              ; 6BE8   000C
        CMPR    R4,     R0                      ; 6BE9   0160
        AND@    R1,     R3                      ; 6BEA   038B
        SDBD                                    ; 6BEB   0001
        XOR@    R1,     R3                      ; 6BEC   03CB
        MOVR    R1,     R7                      ; 6BED   008F

        ADCR    R2                              ; 6BEE   002A
        ADD@    R1,     R7                      ; 6BEF   02CF

        PSHR    R5                              ; 6BF0   0275
L_6BF1:
        MVII    #$00E0, R3                      ; 6BF1   02BB 00E0
        MVII    #$0003, R1                      ; 6BF3   02B9 0003

        JSR     R5,     L_6A34                  ; 6BF5   0004 0168 0234
        DECLE   $002A,  $002A,  $002A,  $002A   ; 6BF8   002A 002A 002A 002A
        DECLE   $004A,  $006A,  $007A,  $007A   ; 6BFC   004A 006A 007A 007A
        DECLE   $007A,  $007A,  $006A,  $0042   ; 6C00   007A 007A 006A 0042
        DECLE   $0000                           ; 6C04   0000

        B       L_6BF1                          ; 6C05   0220 0015

L_6C07:
        PSHR    R5                              ; 6C07   0275
L_6C08:
        MVII    #$0070, R3                      ; 6C08   02BB 0070
        MVII    #$0003, R1                      ; 6C0A   02B9 0003
        MVI     G_017C, R0                      ; 6C0C   0280 017C
        SARC    R0,     1                       ; 6C0E   0078
        BNC     L_6C29                          ; 6C0F   0209 0018

        JSR     R5,     L_6A34                  ; 6C11   0004 0168 0234
        DECLE   $0066,  $0036,  $0016,  $0034   ; 6C14   0066 0036 0016 0034
        DECLE   $006E,  $0066,  $0034,  $0016   ; 6C18   006E 0066 0034 0016
        DECLE   $0036,  $0086,  $0066,  $0036   ; 6C1C   0036 0086 0066 0036
        DECLE   $0054,  $008E,  $0086,  $0054   ; 6C20   0054 008E 0086 0054
        DECLE   $0036,  $0056,  $0000           ; 6C24   0036 0056 0000

        B       L_6C08                          ; 6C27   0220 0020

L_6C29:
        JSR     R5,     L_6A34                  ; 6C29   0004 0168 0234
        DECLE   $007A,  $007A,  $0002,  $002A   ; 6C2C   007A 007A 0002 002A
        DECLE   $007A,  $007A,  $0002,  $002A   ; 6C30   007A 007A 0002 002A
        DECLE   $007A,  $007A,  $0002,  $002A   ; 6C34   007A 007A 0002 002A
        DECLE   $007A,  $006A,  $007A,  $008A   ; 6C38   007A 006A 007A 008A
        DECLE   $009A,  $009A,  $0002,  $004A   ; 6C3C   009A 009A 0002 004A
        DECLE   $009A,  $009A,  $0002,  $004A   ; 6C40   009A 009A 0002 004A
        DECLE   $009A,  $009A,  $0002,  $004A   ; 6C44   009A 009A 0002 004A
        DECLE   $009A,  $008A,  $009A,  $00A2   ; 6C48   009A 008A 009A 00A2
        DECLE   $0000                           ; 6C4C   0000

        B       L_6C08                          ; 6C4D   0220 0046

L_6C4F:
        PSHR    R5                              ; 6C4F   0275

        JSR     R5,     L_69FE                  ; 6C50   0004 0168 01FE
        DECLE   $0090,  $0389,  $03C0,  $008B   ; 6C53   0090 0389 03C0 008B
        DECLE   $03C8,  $022C,  $0304           ; 6C57   03C8 022C 0304
L_6C5A:
        BNEQ    L_6C5A                          ; 6C5A   022C 0001

        XOR@    R6,     R4                      ; 6C5C   03F4
        XOR@    R6,     R1                      ; 6C5D   03F1
        XOR     G_03F1, R6                      ; 6C5E   03C6 03F1
        XOR     G_008F, R1                      ; 6C60   03C1 008F
        NEGR    R0                              ; 6C62   0020
        ADD@    R1,     R7                      ; 6C63   02CF

L_6C64:
        PSHR    R5                              ; 6C64   0275
        CLRR    R0                              ; 6C65   01C0
        MVO     R0,     G_01EF                  ; 6C66   0240 01EF

        JSR     R5,     X_PLAY_MUS2             ; 6C68   0004 0118 035D
        DECLE   $0220                           ; 6C6B  Note (short)
        DECLE   $0240                           ; 6C6C  Note (short)
        DECLE   $0260                           ; 6C6D  Note (short)
        DECLE   $02B0                           ; 6C6E  Note (short)
        DECLE   $0272                           ; 6C6F  Note (short)
        DECLE   $0000                           ; 6C70  End of music

        PULR    R7                              ; 6C71   02B7

L_6C72:
        PSHR    R5                              ; 6C72   0275

        JSR     R5,     L_69FB                  ; 6C73   0004 0168 01FB
        DECLE   $0389,  $03C0,  $0041,  $03C8   ; 6C76   0389 03C0 0041 03C8
        DECLE   $0041,  $0304,  $0041,  $0001   ; 6C7A   0041 0304 0041 0001

        SETC                                    ; 6C7E   0007
        MOVR    R1,     R7                      ; 6C7F   008F

        DECLE   $0080,  $0001                   ; 6C80   0080 0001

        INCR    R3                              ; 6C82   000B
        MOVR    R1,     R7                      ; 6C83   008F

        SLR     R0,     1                       ; 6C84   0060
        ADD@    R1,     R7                      ; 6C85   02CF

L_6C86:
        PSHR    R5                              ; 6C86   0275

        JSR     R5,     L_69FE                  ; 6C87   0004 0168 01FE
        DECLE   $0094,  $0319,  $0048,  $03FF   ; 6C8A   0094 0319 0048 03FF
        DECLE   $0040,  $03FF                   ; 6C8E   0040 03FF

        RSWD    R4                              ; 6C90   003C
        SUB     G_03B7, R0                      ; 6C91   0300 03B7
        MVI@    R1,     R3                      ; 6C93   028B
        MOVR    R1,     R7                      ; 6C94   008F

        COMR    R0                              ; 6C95   0018
        ADD@    R1,     R7                      ; 6C96   02CF

L_6C97:
        PSHR    R5                              ; 6C97   0275

        JSR     R5,     L_69FE                  ; 6C98   0004 0168 01FE
        DECLE   $0090,  $0389,  $03C0,  $004A   ; 6C9B   0090 0389 03C0 004A
        DECLE   $03C8,  $004A,  $0304,  $022C   ; 6C9F   03C8 004A 0304 022C
        DECLE   $0001                           ; 6CA3   0001

        INCR    R3                              ; 6CA4   000B
        MOVR    R1,     R7                      ; 6CA5   008F

        NEGR    R4                              ; 6CA6   0024
        ADD@    R1,     R7                      ; 6CA7   02CF

        PSHR    R5                              ; 6CA8   0275
        MVI     G_017A, R2                      ; 6CA9   0282 017A
        SARC    R2,     1                       ; 6CAB   007A
        BC      L_6F39                          ; 6CAC   0201 028B
        BEQ     L_6CF0                          ; 6CAE   0204 0040

        MVI     G_0102, R1                      ; 6CB0   0281 0102
        CMPI    #$0002, R1                      ; 6CB2   0379 0002
        BEQ     L_6CF0                          ; 6CB4   0204 003A

        MVI     G_034E, R0                      ; 6CB6   0280 034E
        SDBD                                    ; 6CB8   0001
        CMPI    #$5A7F, R0                      ; 6CB9   0378 007F 005A
        BNEQ    L_6CE6                          ; 6CBC   020C 0028

        MVII    #$0004, R4                      ; 6CBE   02BC 0004
        MVI     .STIC.Y.6,R0                    ; 6CC0   0280 000E
        TSTR    R1                              ; 6CC2   0089
        BNEQ    L_6CD2                          ; 6CC3   020C 000D

        MOVR    R0,     R3                      ; 6CC5   0083
        SDBD                                    ; 6CC6   0001
        XORI    #$0400, R0                      ; 6CC7   03F8 0000 0004
        SDBD                                    ; 6CCA   0001
        ANDI    #$0400, R3                      ; 6CCB   03BB 0000 0004
        BNEQ    L_6CDF                          ; 6CCE   020C 000F
        B       L_6CE0                          ; 6CD0   0200 000E

L_6CD2:
        SDBD                                    ; 6CD2   0001
        ANDI    #$FBFF, R0                      ; 6CD3   03B8 00FF 00FB
        MOVR    R1,     R3                      ; 6CD6   008B
        SARC    R3,     1                       ; 6CD7   007B
        BNC     L_6CDF                          ; 6CD8   0209 0005

        SDBD                                    ; 6CDA   0001
        XORI    #$0400, R0                      ; 6CDB   03F8 0000 0004
        INCR    R7                              ; 6CDE   000F

L_6CDF:
        NEGR    R4                              ; 6CDF   0024
L_6CE0:
        ADD     .STIC.X.6,R4                    ; 6CE0   02C4 0006
        MVO     R4,     .STIC.X.6               ; 6CE2   0244 0006
        MVO     R0,     .STIC.Y.6               ; 6CE4   0240 000E
L_6CE6:
        SWAP    R1,     1                       ; 6CE6   0041
        SWAP    R1,     1                       ; 6CE7   0041
        BMI     L_6CF0                          ; 6CE8   020B 0006
        BEQ     L_6CEC                          ; 6CEA   0204 0000

L_6CEC:
        CMPI    #$0004, R1                      ; 6CEC   0379 0004
        BEQ     L_6CF5                          ; 6CEE   0204 0005

L_6CF0:
        JSR     R5,     X_DEF_ISR               ; 6CF0   0004 0110 0126

        B       L_6ECF                          ; 6CF3   0200 01DA

L_6CF5:
        DECR    R1                              ; 6CF5   0011
        MVO     R1,     G_0102                  ; 6CF6   0241 0102
        MVO     R1,     .STIC.VIDEN             ; 6CF8   0241 0020
        MVI     G_017A, R0                      ; 6CFA   0280 017A
        CMPI    #$0008, R0                      ; 6CFC   0378 0008
        BEQ     L_6D9A                          ; 6CFE   0204 009A

        CMPI    #$0004, R0                      ; 6D00   0378 0004
        BNEQ    L_6EA7                          ; 6D02   020C 01A3

        MVI     G_01BC, R3                      ; 6D04   0283 01BC
        DECR    R3                              ; 6D06   0013
        BMI     L_6D0C                          ; 6D07   020B 0003

        JSR     R5,     L_6D16                  ; 6D09   0004 016C 0116

L_6D0C:
        MVI     G_01BD, R3                      ; 6D0C   0283 01BD
        DECR    R3                              ; 6D0E   0013
        BMI     L_6EA7                          ; 6D0F   020B 0196

        JSR     R5,     L_6D16                  ; 6D11   0004 016C 0116

        B       L_6EA7                          ; 6D14   0200 0191

L_6D16:
        PSHR    R5                              ; 6D16   0275
        PSHR    R3                              ; 6D17   0273

        JSR     R4,     L_6D27                  ; 6D18   0004 006C 0127
        DECLE   $0101,  $0000                   ; 6D1B   0101 0000

        B       L_6E30                          ; 6D1D   0200 0111

        DECLE   $0000,  $0221,  $0131,  $0000   ; 6D1F   0000 0221 0131 0000
        DECLE   $0241,  $0100,  $0000           ; 6D23   0241 0100 0000

        MVO@    R1,     R2                      ; 6D26   0251
L_6D27:
        ADDR    R3,     R4                      ; 6D27   00DC
        MVI@    R4,     R5                      ; 6D28   02A5
        TSTR    R5                              ; 6D29   00AD
        BEQ     L_6D98                          ; 6D2A   0204 006C

        MVII    #$0006, R0                      ; 6D2C   02B8 0006
        MVII    #$0240, R1                      ; 6D2E   02B9 0240
        SDBD                                    ; 6D30   0001
        MVII    #$18B5, R2                      ; 6D31   02BA 00B5 0018
        ADDR    R3,     R1                      ; 6D34   00D9
        CMPI    #$01FF, R5                      ; 6D35   037D 01FF
        BLT     L_6D3B                          ; 6D37   0205 0002

        SUBI    #$0008, R2                      ; 6D39   033A 0008
L_6D3B:
        ANDI    #$00FF, R5                      ; 6D3B   03BD 00FF
L_6D3D:
        MVO@    R2,     R1                      ; 6D3D   024A
        ADDI    #$0014, R1                      ; 6D3E   02F9 0014
        DECR    R0                              ; 6D40   0010
        BPL     L_6D3D                          ; 6D41   0223 0005

        ADDI    #$0010, R2                      ; 6D43   02FA 0010
        MVO@    R2,     R1                      ; 6D45   024A
        DECR    R5                              ; 6D46   0015
        BMI     L_6D98                          ; 6D47   020B 004F

        MOVR    R5,     R4                      ; 6D49   00AC
        SDBD                                    ; 6D4A   0001
        ADDI    #$18E5, R4                      ; 6D4B   02FC 00E5 0018
        MOVR    R3,     R2                      ; 6D4E   009A
        ADDI    #$01B0, R2                      ; 6D4F   02FA 01B0
        MVI@    R2,     R0                      ; 6D51   0290
        MOVR    R0,     R1                      ; 6D52   0081
        ANDI    #$00F8, R1                      ; 6D53   03B9 00F8
        SLR     R1,     1                       ; 6D55   0061
        PSHR    R1                              ; 6D56   0271
        SLL     R1,     2                       ; 6D57   004D
        ADD@    R6,     R1                      ; 6D58   02F1
        ADDR    R3,     R1                      ; 6D59   00D9
        ADDI    #$01F0, R1                      ; 6D5A   02F9 01F0
        MVO@    R4,     R1                      ; 6D5C   024C
        CMPI    #$02B8, R1                      ; 6D5D   0379 02B8
        BGE     L_6D66                          ; 6D5F   020D 0005

        ADDI    #$0008, R4                      ; 6D61   02FC 0008
        ADDI    #$0014, R1                      ; 6D63   02F9 0014
        MVO@    R4,     R1                      ; 6D65   024C
L_6D66:
        MOVR    R5,     R4                      ; 6D66   00AC
        SDBD                                    ; 6D67   0001
        ADDI    #$38E0, R4                      ; 6D68   02FC 00E0 0038
        SDBD                                    ; 6D6B   0001
        ADDI    #$565B, R5                      ; 6D6C   02FD 005B 0056
        MOVR    R5,     R1                      ; 6D6F   00A9
        MVII    #$000B, R3                      ; 6D70   02BB 000B
        ANDI    #$0007, R0                      ; 6D72   03B8 0007
        BEQ     L_6D7C                          ; 6D74   0204 0006

        SUBR    R0,     R3                      ; 6D76   0103
L_6D77:
        MVI@    R5,     R2                      ; 6D77   02AA
        MVO@    R2,     R4                      ; 6D78   0262
        DECR    R0                              ; 6D79   0010
        BNEQ    L_6D77                          ; 6D7A   022C 0004

L_6D7C:
        INCR    R5                              ; 6D7C   000D
        ADDI    #$0008, R1                      ; 6D7D   02F9 0008
        MVI@    R1,     R2                      ; 6D7F   028A
        MVO@    R2,     R4                      ; 6D80   0262
        INCR    R1                              ; 6D81   0009
        MVI@    R1,     R2                      ; 6D82   028A
        MVO@    R2,     R4                      ; 6D83   0262
        INCR    R1                              ; 6D84   0009
        MVI@    R1,     R2                      ; 6D85   028A
        MVO@    R2,     R4                      ; 6D86   0262
        INCR    R1                              ; 6D87   0009
        MVI@    R1,     R2                      ; 6D88   028A
        MVO@    R2,     R4                      ; 6D89   0262
        INCR    R1                              ; 6D8A   0009
        MVI@    R1,     R2                      ; 6D8B   028A
        MVO@    R2,     R4                      ; 6D8C   0262
        SUBI    #$000C, R1                      ; 6D8D   0339 000C
L_6D8F:
        SUBR    R1,     R5                      ; 6D8F   010D
        ANDI    #$0007, R5                      ; 6D90   03BD 0007
        ADDR    R1,     R5                      ; 6D92   00CD
        MVI@    R5,     R2                      ; 6D93   02AA
        MVO@    R2,     R4                      ; 6D94   0262
        DECR    R3                              ; 6D95   0013
        BNEQ    L_6D8F                          ; 6D96   022C 0008

L_6D98:
        PULR    R3                              ; 6D98   02B3
        PULR    R7                              ; 6D99   02B7

L_6D9A:
        MVI     G_01C2, R0                      ; 6D9A   0280 01C2
        INCR    R0                              ; 6D9C   0008
        ANDI    #$0003, R0                      ; 6D9D   03B8 0003
        MVO     R0,     G_01C2                  ; 6D9F   0240 01C2
        SARC    R0,     1                       ; 6DA1   0078
        BC      L_6DAB                          ; 6DA2   0201 0007
        BEQ     L_6EA7                          ; 6DA4   0204 0101

        JSR     R5,     L_6DBD                  ; 6DA6   0004 016C 01BD

        B       L_6EA7                          ; 6DA9   0200 00FC

L_6DAB:
        MVII    #$0001, R3                      ; 6DAB   02BB 0001
        MVO     R3,     G_01CD                  ; 6DAD   0243 01CD
        MVII    #$01C0, R3                      ; 6DAF   02BB 01C0
        SDBD                                    ; 6DB1   0001
        MVII    #$394B, R4                      ; 6DB2   02BC 004B 0039

        JSR     R5,     L_6DC9                  ; 6DB5   0004 016C 01C9
        JSR     R5,     L_6DBD                  ; 6DB8   0004 016C 01BD

        B       L_6E1B                          ; 6DBB   0200 005E

L_6DBD:
        PSHR    R5                              ; 6DBD   0275
        MVII    #$0003, R3                      ; 6DBE   02BB 0003
        MVO     R3,     G_01CD                  ; 6DC0   0243 01CD
        MVII    #$01CA, R3                      ; 6DC2   02BB 01CA
        SDBD                                    ; 6DC4   0001
        MVII    #$395B, R4                      ; 6DC5   02BC 005B 0039
        INCR    R7                              ; 6DC8   000F

L_6DC9:
        PSHR    R5                              ; 6DC9   0275
L_6DCA:
        MVI@    R3,     R0                      ; 6DCA   0298
        INCR    R3                              ; 6DCB   000B
        TSTR    R0                              ; 6DCC   0080
        BEQ     L_6DEA                          ; 6DCD   0204 001B

        PSHR    R3                              ; 6DCF   0273
        MOVR    R4,     R2                      ; 6DD0   00A2
        ADDI    #$0008, R2                      ; 6DD1   02FA 0008
        MOVR    R4,     R5                      ; 6DD3   00A5
        MVII    #$0005, R0                      ; 6DD4   02B8 0005
L_6DD6:
        MVI@    R4,     R3                      ; 6DD6   02A3
        SWAP    R3,     1                       ; 6DD7   0043
        XOR@    R2,     R3                      ; 6DD8   03D3
        SLL     R3,     1                       ; 6DD9   004B
        MVO@    R3,     R2                      ; 6DDA   0253
        SWAP    R3,     1                       ; 6DDB   0043
        MVO@    R3,     R5                      ; 6DDC   026B
        INCR    R2                              ; 6DDD   000A
        DECR    R0                              ; 6DDE   0010
        BNEQ    L_6DD6                          ; 6DDF   022C 000A

        PULR    R3                              ; 6DE1   02B3
        MVII    #$0100, R4                      ; 6DE2   02BC 0100
        NEGR    R4                              ; 6DE4   0024
        MVII    #$0001, R0                      ; 6DE5   02B8 0001
        NEGR    R0                              ; 6DE7   0020
        B       L_6E01                          ; 6DE8   0200 0017

L_6DEA:
        PSHR    R3                              ; 6DEA   0273
        MOVR    R4,     R2                      ; 6DEB   00A2
        ADDI    #$0008, R4                      ; 6DEC   02FC 0008
        MOVR    R4,     R5                      ; 6DEE   00A5
        MVII    #$0005, R0                      ; 6DEF   02B8 0005
L_6DF1:
        MVI@    R2,     R3                      ; 6DF1   0293
        SWAP    R3,     1                       ; 6DF2   0043
        XOR@    R4,     R3                      ; 6DF3   03E3
        SLR     R3,     1                       ; 6DF4   0063
        MVO@    R3,     R5                      ; 6DF5   026B
        SWAP    R3,     1                       ; 6DF6   0043
        MVO@    R3,     R2                      ; 6DF7   0253
        INCR    R2                              ; 6DF8   000A
        DECR    R0                              ; 6DF9   0010
        BNEQ    L_6DF1                          ; 6DFA   022C 000A

        PULR    R3                              ; 6DFC   02B3
        MVII    #$0100, R4                      ; 6DFD   02BC 0100
        MVII    #$0001, R0                      ; 6DFF   02B8 0001
L_6E01:
        MVI     G_01C3, R2                      ; 6E01   0282 01C3
        XOR     G_01CD, R2                      ; 6E03   03C2 01CD
        BNEQ    L_6E0E                          ; 6E05   020C 0007

        MVI     G_034F, R2                      ; 6E07   0282 034F
        ADDR    R4,     R2                      ; 6E09   00E2
        MVO     R2,     G_034F                  ; 6E0A   0242 034F
        MVO     R2,     G_0357                  ; 6E0C   0242 0357
L_6E0E:
        MVI@    R3,     R1                      ; 6E0E   0299
        ADDR    R0,     R1                      ; 6E0F   00C1
        MVO@    R1,     R3                      ; 6E10   0259
        ANDI    #$0007, R1                      ; 6E11   03B9 0007
        BNEQ    L_6E1A                          ; 6E13   020C 0005

        DECR    R3                              ; 6E15   0013
        MVI@    R3,     R0                      ; 6E16   0298
        XORI    #$0001, R0                      ; 6E17   03F8 0001
        MVO@    R0,     R3                      ; 6E19   0258
L_6E1A:
        PULR    R7                              ; 6E1A   02B7

L_6E1B:
        CLRR    R4                              ; 6E1B   01E4
        MVI     G_01C4, R0                      ; 6E1C   0280 01C4
        MVI     G_01C5, R1                      ; 6E1E   0281 01C5
        MVI     G_01C6, R2                      ; 6E20   0282 01C6
        TSTR    R2                              ; 6E22   0092
        BEQ     L_6E3D                          ; 6E23   0204 0018

        MVI     G_01C3, R3                      ; 6E25   0283 01C3
        CMPI    #$0002, R3                      ; 6E27   037B 0002
        BNEQ    L_6E2D                          ; 6E29   020C 0002

        SUBI    #$0100, R4                      ; 6E2B   033C 0100
L_6E2D:
        DECR    R0                              ; 6E2D   0010
        MVO     R0,     G_01C4                  ; 6E2E   0240 01C4
L_6E30:
        BPL     L_6E80                          ; 6E30   0203 004E

        DECR    R1                              ; 6E32   0011
        BPL     L_6E5B                          ; 6E33   0203 0026

        CLRR    R2                              ; 6E35   01D2
        CLRR    R4                              ; 6E36   01E4
        MVO     R2,     G_01C6                  ; 6E37   0242 01C6
        MVO     R2,     G_01C4                  ; 6E39   0242 01C4
        B       L_6E80                          ; 6E3B   0200 0043

L_6E3D:
        MVI     G_01C3, R3                      ; 6E3D   0283 01C3
        CMPI    #$0002, R3                      ; 6E3F   037B 0002
        BNEQ    L_6E45                          ; 6E41   020C 0002

        ADDI    #$0100, R4                      ; 6E43   02FC 0100
L_6E45:
        INCR    R0                              ; 6E45   0008
        MVO     R0,     G_01C4                  ; 6E46   0240 01C4
        CMPI    #$0008, R0                      ; 6E48   0378 0008
        BLT     L_6E80                          ; 6E4A   0205 0034

        INCR    R1                              ; 6E4C   0009
        CMPI    #$0003, R1                      ; 6E4D   0379 0003
        BLT     L_6E69                          ; 6E4F   0205 0018

        MVII    #$0001, R2                      ; 6E51   02BA 0001
        MVO     R2,     G_01C6                  ; 6E53   0242 01C6
        CLRR    R4                              ; 6E55   01E4
        DECR    R0                              ; 6E56   0010
        MVO     R0,     G_01C4                  ; 6E57   0240 01C4
        B       L_6E80                          ; 6E59   0200 0025

L_6E5B:
        MVII    #$0007, R0                      ; 6E5B   02B8 0007
        MVO     R0,     G_01C4                  ; 6E5D   0240 01C4
        MVO     R1,     G_01C5                  ; 6E5F   0241 01C5
        MVI     .BTAB.94,R1                     ; 6E61   0281 0294
        MVI     .BTAB.93,R3                     ; 6E63   0283 0293
        MVI     .BTAB.92,R2                     ; 6E65   0282 0292
        B       L_6E74                          ; 6E67   0200 000B

L_6E69:
        CLRR    R0                              ; 6E69   01C0
        MVO     R0,     G_01C4                  ; 6E6A   0240 01C4
        MVO     R1,     G_01C5                  ; 6E6C   0241 01C5
        MVI     .BTAB.92,R1                     ; 6E6E   0281 0292
        MVI     .BTAB.93,R2                     ; 6E70   0282 0293
        MVI     .BTAB.94,R3                     ; 6E72   0283 0294
L_6E74:
        MVO     R1,     .BTAB.93                ; 6E74   0241 0293
        MVO     R2,     .BTAB.94                ; 6E76   0242 0294
        MVO     R3,     .BTAB.92                ; 6E78   0243 0292
        MVO     R1,     .BTAB.96                ; 6E7A   0241 0296
        MVO     R2,     .BTAB.97                ; 6E7C   0242 0297
        MVO     R3,     .BTAB.95                ; 6E7E   0243 0295
L_6E80:
        TSTR    R4                              ; 6E80   00A4
        BEQ     L_6E8D                          ; 6E81   0204 000A

        MVI     G_034F, R3                      ; 6E83   0283 034F
        ADDR    R4,     R3                      ; 6E85   00E3
        MVO     R3,     G_034F                  ; 6E86   0243 034F
        MVI     G_0357, R3                      ; 6E88   0283 0357
        ADDR    R4,     R3                      ; 6E8A   00E3
        MVO     R3,     G_0357                  ; 6E8B   0243 0357
L_6E8D:
        MVI     G_01C4, R0                      ; 6E8D   0280 01C4

        JSR     R4,     L_6E9A                  ; 6E8F   0004 006C 029A
        DECLE   $0080,  $0040,  $0020,  $0010   ; 6E92   0080 0040 0020 0010
        DECLE   $0008,  $0004,  $0002,  $0001   ; 6E96   0008 0004 0002 0001
L_6E9A:
        ADDR    R0,     R4                      ; 6E9A   00C4
        MVI@    R4,     R1                      ; 6E9B   02A1
        SDBD                                    ; 6E9C   0001
        MVII    #$3969, R4                      ; 6E9D   02BC 0069 0039
        MVO@    R1,     R4                      ; 6EA0   0261
        MVO@    R1,     R4                      ; 6EA1   0261
        MVO@    R1,     R4                      ; 6EA2   0261
        MVO@    R1,     R4                      ; 6EA3   0261
        MVO@    R1,     R4                      ; 6EA4   0261
        MVO@    R1,     R4                      ; 6EA5   0261
        MVO@    R1,     R4                      ; 6EA6   0261
L_6EA7:
        MVI     G_019C, R0                      ; 6EA7   0280 019C
        TSTR    R0                              ; 6EA9   0080
        BEQ     L_6EAF                          ; 6EAA   0204 0003

        JSR     R5,     L_5B4B                  ; 6EAC   0004 0158 034B

L_6EAF:
        MVI     G_019D, R0                      ; 6EAF   0280 019D
        DECR    R0                              ; 6EB1   0010
        BMI     L_6ECC                          ; 6EB2   020B 0018

        MVO     R0,     G_019D                  ; 6EB4   0240 019D
        MVI     G_0175, R3                      ; 6EB6   0283 0175
        DECR    R3                              ; 6EB8   0013
        BMI     L_6ECC                          ; 6EB9   020B 0011
        BNEQ    L_6EC3                          ; 6EBB   020C 0006

        MVII    #$0001, R0                      ; 6EBD   02B8 0001
        MVO     R0,     G_0190                  ; 6EBF   0240 0190
        MVO     R0,     G_0102                  ; 6EC1   0240 0102
L_6EC3:
        MVO     R3,     G_0175                  ; 6EC3   0243 0175
        SDBD                                    ; 6EC5   0001
        MVII    #$3869, R2                      ; 6EC6   02BA 0069 0038

        JSR     R5,     L_5B82                  ; 6EC9   0004 0158 0382
L_6ECC:
        JSR     R5,     X_PLAY_NOTE             ; 6ECC   0004 0118 02BD

L_6ECF:
        MVI     G_0145, R3                      ; 6ECF   0283 0145
        TSTR    R3                              ; 6ED1   009B
        BNEQ    L_6F38                          ; 6ED2   020C 0064

        ADD     G_01EF, R3                      ; 6ED4   02C3 01EF
        BEQ     L_6F38                          ; 6ED6   0204 0060

        MVI     G_0149, R1                      ; 6ED8   0281 0149
        TSTR    R1                              ; 6EDA   0089
        BEQ     L_6F38                          ; 6EDB   0204 005B

        CMPI    #$000A, R1                      ; 6EDD   0379 000A
        BGT     L_6F38                          ; 6EDF   020E 0057

        MVI     G_035F, R1                      ; 6EE1   0281 035F
        PSHR    R1                              ; 6EE3   0271
        MVI     G_01ED, R2                      ; 6EE4   0282 01ED
        CMPI    #$0001, R2                      ; 6EE6   037A 0001
        BLE     L_6EF4                          ; 6EE8   0206 000A

        DECR    R2                              ; 6EEA   0012
        MVO     R2,     G_01ED                  ; 6EEB   0242 01ED
        MVI     G_01EC, R0                      ; 6EED   0280 01EC
        SWAP    R0,     1                       ; 6EEF   0040
        XOR     G_01EB, R0                      ; 6EF0   03C0 01EB
        B       L_6F23                          ; 6EF2   0200 002F

L_6EF4:
        MVI     G_01EA, R2                      ; 6EF4   0282 01EA
        DECR    R2                              ; 6EF6   0012
        BMI     L_6EFE                          ; 6EF7   020B 0005

        MVO     R2,     G_01EA                  ; 6EF9   0242 01EA
        CLRR    R0                              ; 6EFB   01C0
        B       L_6F23                          ; 6EFC   0200 0025

L_6EFE:
        DECR    R3                              ; 6EFE   0013
        SLL     R3,     1                       ; 6EFF   004B
        SDBD                                    ; 6F00   0001
        MVII    #$6A28, R4                      ; 6F01   02BC 0028 006A
        ADDR    R3,     R4                      ; 6F04   00DC
        SDBD                                    ; 6F05   0001
        MVI@    R4,     R2                      ; 6F06   02A2
        ADD     G_01EE, R2                      ; 6F07   02C2 01EE
        MVI@    R2,     R0                      ; 6F09   0290
        TSTR    R0                              ; 6F0A   0080
        BEQ     L_6F23                          ; 6F0B   0204 0016

        MOVR    R2,     R4                      ; 6F0D   0094
        MVO     R2,     G_035F                  ; 6F0E   0242 035F

        JSR     R5,     .EXEC.AF4               ; 6F10   0004 0118 02F4

        TSTR    R2                              ; 6F13   0092
        BEQ     L_6F18                          ; 6F14   0204 0002

        INCR    R2                              ; 6F16   000A
        SUBR    R2,     R1                      ; 6F17   0111
L_6F18:
        MVO     R1,     G_01ED                  ; 6F18   0241 01ED
        MVO     R2,     G_01EA                  ; 6F1A   0242 01EA
        MVI     G_035F, R2                      ; 6F1C   0282 035F
        SUBR    R4,     R2                      ; 6F1E   0122
        ADD     G_01EE, R2                      ; 6F1F   02C2 01EE
        MVO     R2,     G_01EE                  ; 6F21   0242 01EE
L_6F23:
        MVO     R0,     .PSG0.chn_a_lo          ; 6F23   0240 01F0
        NOP                                     ; 6F25   0034
        MVO     R0,     G_01EB                  ; 6F26   0240 01EB
        SWAP    R0,     1                       ; 6F28   0040
        MVO     R0,     G_01EC                  ; 6F29   0240 01EC
        BNEQ    L_6F30                          ; 6F2B   020C 0003

        MVO     R0,     .PSG0.chn_a_vol         ; 6F2D   0240 01FB
        DECR    R0                              ; 6F2F   0010
L_6F30:
        MVO     R0,     .PSG0.chn_a_hi          ; 6F30   0240 01F4
        CLRR    R1                              ; 6F32   01C9
        MVO     R1,     .PSG0.chn_b_vol         ; 6F33   0241 01FC
        PULR    R1                              ; 6F35   02B1
        MVO     R1,     G_035F                  ; 6F36   0241 035F
L_6F38:
        PULR    R7                              ; 6F38   02B7

L_6F39:
        CMPI    #$0005, R2                      ; 6F39   037A 0005
        BEQ     L_6FAF                          ; 6F3B   0204 0072

        DIS                                     ; 6F3D   0003
        MVII    #$0038, R1                      ; 6F3E   02B9 0038
        SWAP    R1,     1                       ; 6F40   0041
        SDBD                                    ; 6F41   0001
        MVII    #$54A3, R4                      ; 6F42   02BC 00A3 0054
        MVII    #$0088, R0                      ; 6F45   02B8 0088

        JSR     R5,     .EXEC.730               ; 6F47   0004 0114 0330

        MOVR    R5,     R1                      ; 6F4A   00A9
        SLL     R2,     1                       ; 6F4B   004A
        PSHR    R2                              ; 6F4C   0272
        ADDR    R2,     R7                      ; 6F4D   00D7
        B       L_6F56                          ; 6F4E   0200 0006
        B       L_6F5F                          ; 6F50   0200 000D
        B       L_6F56                          ; 6F52   0200 0002
        B       L_6F6C                          ; 6F54   0200 0016

L_6F56:
        MVII    #$00E0, R0                      ; 6F56   02B8 00E0

        JSR     R5,     .EXEC.730               ; 6F58   0004 0114 0330

        MVII    #$0001, R3                      ; 6F5B   02BB 0001
        B       L_6F84                          ; 6F5D   0200 0025

L_6F5F:
        SDBD                                    ; 6F5F   0001
        MVII    #$5603, R4                      ; 6F60   02BC 0003 0056
        MVII    #$00B8, R0                      ; 6F63   02B8 00B8

        JSR     R5,     .EXEC.730               ; 6F65   0004 0114 0330

        MVII    #$0008, R3                      ; 6F68   02BB 0008
        B       L_6F84                          ; 6F6A   0200 0018

L_6F6C:
        SDBD                                    ; 6F6C   0001
        MVII    #$56FB, R4                      ; 6F6D   02BC 00FB 0056
        MVII    #$0100, R0                      ; 6F70   02B8 0100

        JSR     R5,     .EXEC.730               ; 6F72   0004 0114 0330

        SDBD                                    ; 6F75   0001
        MVII    #$56BB, R4                      ; 6F76   02BC 00BB 0056
        MVII    #$0040, R0                      ; 6F79   02B8 0040
        MVII    #$0038, R1                      ; 6F7B   02B9 0038
        SWAP    R1,     1                       ; 6F7D   0041

        JSR     R5,     .EXEC.730               ; 6F7E   0004 0114 0330

        INCR    R0                              ; 6F81   0008
        MVII    #$0001, R3                      ; 6F82   02BB 0001
L_6F84:
        MVO     R0,     G_0105                  ; 6F84   0240 0105
        MVI     .STIC.MODE,R1                   ; 6F86   0281 0021
        TSTR    R0                              ; 6F88   0080
        BEQ     L_6F8D                          ; 6F89   0204 0002

        MVO     R1,     .STIC.MODE              ; 6F8B   0241 0021
L_6F8D:
        MVII    #$0004, R0                      ; 6F8D   02B8 0004
        MVO     R0,     .STIC.HDLY              ; 6F8F   0240 0030
        MVO     R3,     G_0106                  ; 6F91   0243 0106
        MVO     R3,     .STIC.BORD              ; 6F93   0243 002C
        MVII    #$031D, R4                      ; 6F95   02BC 031D
        MVII    #$0040, R0                      ; 6F97   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 6F99   0004 0114 0338

        SDBD                                    ; 6F9C   0001
        MVII    #$3980, R4                      ; 6F9D   02BC 0080 0039
        MVII    #$0080, R0                      ; 6FA0   02B8 0080

        JSR     R5,     X_FILL_ZERO             ; 6FA2   0004 0114 0338
        JSR     R5,     L_6FCE                  ; 6FA5   0004 016C 03CE

        PULR    R2                              ; 6FA8   02B2
        ADDI    #$0002, R2                      ; 6FA9   02FA 0002
        MVO     R2,     G_017A                  ; 6FAB   0242 017A
        EIS                                     ; 6FAD   0002
        PULR    R7                              ; 6FAE   02B7

L_6FAF:
        CLRR    R0                              ; 6FAF   01C0
        CMP     G_0161, R0                      ; 6FB0   0340 0161
        BEQ     L_6CF0                          ; 6FB2   0224 02C3

        MVI     G_011E, R0                      ; 6FB4   0280 011E
        ADD     G_011D, R0                      ; 6FB6   02C0 011D
        BEQ     L_6CF0                          ; 6FB8   0224 02C9

        MVI     G_015E, R0                      ; 6FBA   0280 015E
        DECR    R0                              ; 6FBC   0010
        MVO     R0,     G_015E                  ; 6FBD   0240 015E
        MVO     R0,     .STIC.VIDEN             ; 6FBF   0240 0020
        BPL     L_6CF0                          ; 6FC1   0223 02D2

        MVII    #$0078, R0                      ; 6FC3   02B8 0078
        MVO     R0,     G_015E                  ; 6FC5   0240 015E
        MVI     G_0165, R0                      ; 6FC7   0280 0165
        XORI    #$0001, R0                      ; 6FC9   03F8 0001
        MVO     R0,     G_0165                  ; 6FCB   0240 0165
        INCR    R7                              ; 6FCD   000F

L_6FCE:
        PSHR    R5                              ; 6FCE   0275
L_6FCF:
        MVI     G_0165, R3                      ; 6FCF   0283 0165
        ADDI    #$0166, R3                      ; 6FD1   02FB 0166
        MVI@    R3,     R3                      ; 6FD3   029B
        INCR    R3                              ; 6FD4   000B
        MVO     R3,     G_017C                  ; 6FD5   0243 017C
        SDBD                                    ; 6FD7   0001
        MVII    #$3982, R2                      ; 6FD8   02BA 0082 0039

        JSR     R5,     L_5B82                  ; 6FDB   0004 0158 0382
        JSR     R5,     L_5B4B                  ; 6FDE   0004 0158 034B

        MVI     G_0165, R2                      ; 6FE1   0282 0165

        JSR     R4,     L_6FF0                  ; 6FE3   0004 006C 03F0

        NEGR    R0                              ; 6FE6   0020
        SLR     R0,     1                       ; 6FE7   0060
        NEGR    R0                              ; 6FE8   0020
        NEGR    R0                              ; 6FE9   0020
        NEGR    R0                              ; 6FEA   0020
        ADDR    R4,     R0                      ; 6FEB   00E0
        NEGR    R0                              ; 6FEC   0020
        ADDR    R4,     R0                      ; 6FED   00E0
        TSTR    R0                              ; 6FEE   0080
        ADDR    R4,     R0                      ; 6FEF   00E0
L_6FF0:
        ADDR    R2,     R4                      ; 6FF0   00D4
        SLL     R2,     2                       ; 6FF1   004E
        ADDR    R2,     R4                      ; 6FF2   00D4
        SDBD                                    ; 6FF3   0001
        MVII    #$3871, R1                      ; 6FF4   02B9 0071 0038
        MVII    #$0005, R0                      ; 6FF7   02B8 0005

        JSR     R5,     .EXEC.730               ; 6FF9   0004 0114 0330

        PULR    R7                              ; 6FFC   02B7

        DECLE   $00FF,  $00FF,  $00FF           ; 6FFD   00FF 00FF 00FF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502F       <entry>
;;  $508D       <entry>
;;  $509A       $69F8  
;;  $50A7       $509A  
;;  $50D0       $50AE  
;;  $50F3       $50B8  
;;  $50FB       $50F5  
;;  $511B       $5033   $50D7   $5164   $5192  
;;  $5124       $50BC   $50BF   $50F9  
;;  $5128       $51A2   $51BD   $5246   $5252   $5267   $533C   $53F5   $5404  
;;  $5128       $543C   $544A   $5463   $5477  
;;  $5129       $513F  
;;  $512E       $513D  
;;  $513B       $5135  
;;  $5141       $5131  
;;  $5142       $50B3  
;;  $514B       $5147  
;;  $5155       $5150  
;;  $5159       $69C5  
;;  $5195       $5198  
;;  $51CE       $51B3  
;;  $51D2       $51CC   $5412  
;;  $51DD       $51D9  
;;  $51E8       $51E4  
;;  $5211       $5204  
;;  $521F       $5215   $5217   $521B  
;;  $52E9       $52D8  
;;  $52F6       $52EF  
;;  $530E       $523B   $53DA  
;;  $5310       $5331  
;;  $531F       $5219  
;;  $5370       $537C  
;;  $53AF       $54A1  
;;  $53CC       $53C1  
;;  $53CD       $530C   $53CB  
;;  $53D1       $521D  
;;  $561F       $561D  
;;  $5620       $561E  
;;  $5623       $5621  
;;  $5624       $5622  
;;  $5814       $5812  
;;  $5AAA       <entry>
;;  $5AC1       <entry>
;;  $5AD4       $5AD0  
;;  $5ADD       $5AAE   $5AB2   $5ABC   $5AC6   $5ACE  
;;  $5ADE       $5CC6   $6225   $6408   $690B  
;;  $5B05       $5AF5   $5AF9  
;;  $5B06       $5B0B  
;;  $5B0D       $5B07  
;;  $5B12       $5B17  
;;  $5B19       $5B13  
;;  $5B27       $5AE2   $5B1F  
;;  $5B28       $51EE   $5B21  
;;  $5B32       $5B2E  
;;  $5B4A       $5B3F  
;;  $5B4B       $6EAC   $6FDE  
;;  $5B82       $5B59   $5B62   $6EC9   $6FDB  
;;  $5B8A       $5B92  
;;  $5B94       $5B8C  
;;  $5B9C       $5B96  
;;  $5BA3       $5BBA  
;;  $5BAA       $5BA6  
;;  $5BB3       $5BAF  
;;  $5BC2       $5BBF  
;;  $5BEE       $5BEB  
;;  $5C07       $5C04  
;;  $5C09       $635A  
;;  $5C1C       $5C0F  
;;  $5C22       $5C31   $5C3E   $5C43  
;;  $5C24       $5C20  
;;  $5C2F       $5C2C  
;;  $5C38       $5C35  
;;  $5C45       $5C3A  
;;  $5C59       $5C54  
;;  $5C67       $5C5D   $5C63  
;;  $5C9C       $5C27   $5C4C  
;;  $5CAE       $5CAA  
;;  $5CAF       $5CAD  
;;  $5CC6       $5C9A   $5CC2  
;;  $5D13       $5D13  
;;  $5D23       $5D23  
;;  $5DD7       $5F3C   $636C  
;;  $5DE5       $5DD8  
;;  $5DE9       $5E07   $5E25   $5E2D   $5E33   $5E38  
;;  $5DFD       $5DFA  
;;  $5E09       $5DFF  
;;  $5E17       $5E13  
;;  $5E1A       $5E0B  
;;  $5E31       $5E21  
;;  $5E3A       $5E2F  
;;  $5E4A       $5DF2   $5E03  
;;  $5E4C       $5F6A   $5F8A   $6020   $6038   $6331  
;;  $5E5A       $5E4D  
;;  $5E5F       $5E98   $5E9E   $5EA1  
;;  $5E80       $5E70  
;;  $5E83       $5E6C   $5E7E  
;;  $5E8A       $5E87  
;;  $5E96       $5E81   $5E91  
;;  $5E9A       $5E8C  
;;  $5EAF       $5EA7  
;;  $5EB2       $5EAD  
;;  $5EB9       $5E67   $5E94   $5EAA   $5EB0  
;;  $5EC9       $5ECD  
;;  $5EE8       $5EDE  
;;  $5EEC       $5EDA  
;;  $5EF0       $5ED6   $5EE2  
;;  $5EF1       $5EE6   $5EEA   $5EEE  
;;  $5F02       $5EF9  
;;  $5F05       $63B4  
;;  $5F06       $61A3  
;;  $5F18       $5F00  
;;  $5F48       $5F28  
;;  $5F5B       $5F54  
;;  $5F61       $5F52  
;;  $5F76       $5F4D  
;;  $5F7F       $5F79  
;;  $5F96       $5F74  
;;  $5FB3       $5F77  
;;  $5FB9       $5F59  
;;  $5FD0       $5FD6  
;;  $5FD2       $5FC0   $5FDE  
;;  $5FE6       $5FD4   $5FDA  
;;  $5FE7       $5F5F   $5F71   $5F7D   $5F92   $5FBD  
;;  $600A       $5F23  
;;  $601D       $6017  
;;  $6041       $6031  
;;  $6046       $6042  
;;  $604F       $5F46  
;;  $6058       $5EC7  
;;  $606A       $5F0F   $6064  
;;  $606F       $605B  
;;  $6073       $5EBE   $5EC4   $5EF4   $5F09  
;;  $607C       $6068  
;;  $6089       $6315  
;;  $608A       $6088  
;;  $609E       $608E  
;;  $60A0       $609C  
;;  $60AB       $6086  
;;  $60AF       $6077   $607A  
;;  $60B0       $60A2  
;;  $60B2       $60A6  
;;  $60B3       $60A9   $60B1  
;;  $60F0       $60E9   $60EC  
;;  $60F8       $60D5  
;;  $6102       $60FE  
;;  $6111       $6136   $6180  
;;  $6138       $612C  
;;  $6146       $6143  
;;  $6166       $6159  
;;  $616E       $6151  
;;  $6170       $6155  
;;  $6179       $6141   $6148   $6160   $6164  
;;  $617B       $6177  
;;  $617E       $616C  
;;  $6182       $614D  
;;  $618B       $612E  
;;  $6192       $618D  
;;  $61A5       $6428  
;;  $61A6       $61AA  
;;  $61C6       $61C2  
;;  $61E1       $61D6  
;;  $61E2       $61CE   $61DE  
;;  $6200       $61EF  
;;  $620E       $620A  
;;  $621A       $6216  
;;  $622B       $61B5   $61B8   $61EA   $61F3   $61F6   $61FB   $6201   $6206  
;;  $622B       $6210  
;;  $622C       $634A   $63AF   $64ED   $68D8   $6943  
;;  $622D       $5F3F   $6010   $6027   $603D   $606D  
;;  $6259       $6246   $6255  
;;  $627C       $6269   $626F  
;;  $627D       $518E   $5CCF   $6285   $68FA   $695A   $699A   $69E7  
;;  $627F       $6282  
;;  $6293       <entry>
;;  $62A5       $6297   $629C   $629E  
;;  $62A6       $62A3  
;;  $62B6       $62AB  
;;  $62BB       $62DC  
;;  $62D8       $62C2   $62C6  
;;  $62DE       $62B7  
;;  $62EE       $62E4  
;;  $62FC       $62B1   $62F4  
;;  $6309       $6305  
;;  $631A       $630C   $6312  
;;  $632C       $6328  
;;  $633D       $6339  
;;  $634F       $631D   $6334  
;;  $635A       $634D  
;;  $635D       $6352   $6358  
;;  $638C       $637C   $6380   $6384  
;;  $6393       $638A  
;;  $639D       $6360   $636F  
;;  $63A6       $639B  
;;  $63B4       $63AD  
;;  $63B7       $6318   $63A0   $63A4   $63B2  
;;  $63BA       $6420  
;;  $63D2       $63BC  
;;  $640F       $63BE   $63D0   $63D5   $63DB   $63E8   $63EC   $63F6   $63FA  
;;  $641D       $646B   $6511   $6553   $6568   $65F3   $66BC   $67B9   $67F5  
;;  $641D       $6866  
;;  $6422       $63C3   $63C9   $63CE   $64F0   $6508  
;;  $642B       $6426  
;;  $644F       $643F  
;;  $645B       $644D  
;;  $6467       $6445   $644B   $6453   $6459   $645E  
;;  $646A       $6432  
;;  $646B       $6415  
;;  $646D       $641B  
;;  $648A       $6481   $6486  
;;  $64AF       $64A4  
;;  $64C1       $649E  
;;  $64E2       $64CA  
;;  $64ED       $64AA   $64BF   $64CE   $64D2  
;;  $64F2       $64C4   $64C8  
;;  $64F6       $64B6  
;;  $6505       $64E0  
;;  $650A       $6496  
;;  $6513       $650C  
;;  $6523       $6519   $651B   $651F  
;;  $6547       $6543  
;;  $6555       $654B  
;;  $6562       $653E  
;;  $6580       $6575  
;;  $6583       $658D   $6599   $65B7  
;;  $658F       $6587  
;;  $6593       $6581  
;;  $659B       $6596  
;;  $65AA       $65A6   $65AB  
;;  $65B9       $6591   $65B1  
;;  $65C5       $6571   $65BD  
;;  $65CA       $65BB   $65C3   $65FA   $661D   $6641  
;;  $65D2       $65CA  
;;  $65D9       $618F   $62EC   $6300   $6369   $6391   $64F4  
;;  $65F5       $65E6  
;;  $65FC       $65E2  
;;  $6608       $6602  
;;  $6614       $66D7   $6731   $675A  
;;  $6616       $6621   $66D9   $672D   $675C  
;;  $661F       $6610  
;;  $6623       $660E  
;;  $662D       $65C8   $6629   $66DC  
;;  $6636       $6647   $6708   $673D  
;;  $6643       $6623  
;;  $664B       $6606   $66E1   $66E5   $66EA   $66F7   $66FB   $6704   $671D  
;;  $665A       $6652   $6658  
;;  $6661       $65DD  
;;  $66AD       $66BF  
;;  $66AE       $66B2  
;;  $66B0       $6661  
;;  $66BE       $66B6  
;;  $66DB       $66D3  
;;  $66F2       $66EE  
;;  $670A       $651D  
;;  $671F       $6719  
;;  $6733       $6726  
;;  $673F       $6735   $6739  
;;  $6740       $6755  
;;  $6750       $6745  
;;  $675E       $6715  
;;  $676E       $6760  
;;  $677D       $6770  
;;  $6781       $6796   $6799  
;;  $67A3       $6820  
;;  $67A9       $677F  
;;  $67BB       $67AB  
;;  $67BF       $67AF  
;;  $67C1       $677B   $6827   $682C   $6832   $6842  
;;  $67C3       $6777   $67BD  
;;  $67C7       $67A7  
;;  $67CA       $67FD  
;;  $67D2       $67CA  
;;  $67DB       $6521  
;;  $67F3       $6809  
;;  $67F7       $67E6  
;;  $67FF       $67F9  
;;  $680B       $6801  
;;  $6822       $680D  
;;  $683A       $6836  
;;  $6844       $67DD  
;;  $684A       $6845  
;;  $6855       $6851  
;;  $685C       $684C  
;;  $6862       $65D7   $665F   $676C   $67D9  
;;  $6866       $6848   $685A  
;;  $6869       $5FAF   $6505   $6863  
;;  $686A       $6055   $6188  
;;  $687F       $6876  
;;  $6891       $6888  
;;  $68A2       $6899  
;;  $68B1       $6896  
;;  $68BD       $68B7  
;;  $68C1       $6871  
;;  $68CC       $687D   $688F   $68A0   $68AB   $68AF   $68BB   $68BF   $68C9  
;;  $68D5       $62B3   $64AC  
;;  $68EF       $68EB   $6903  
;;  $6928       $6925  
;;  $693E       $693A  
;;  $6942       $6914   $692A   $692F   $6935  
;;  $6943       $65D9   $6922   $6940  
;;  $699F       $696F  
;;  $69A9       $6969   $69A5  
;;  $69AE       $690E  
;;  $69B5       $69B8  
;;  $69C8       $6964  
;;  $69EA       $69ED  
;;  $69FB       $6B79   $6BA1   $6BB6   $6C73  
;;  $69FE       $6B5D   $6BCB   $6BDD   $6C50   $6C87   $6C98  
;;  $69FF       $69FD  
;;  $6A07       $6B95  
;;  $6A1A       $6A10  
;;  $6A22       $6A1D  
;;  $6A32       $6A4A   $6AB9   $6AE4   $6B2F  
;;  $6A34       $6464   $6BF5   $6C11   $6C29  
;;  $6A47       $5097  
;;  $6A7C       $6AA8   $6AD0   $6B0B   $6B46  
;;  $6AAA       $68E2  
;;  $6AB7       $6AAD   $6AAF   $6AB3  
;;  $6AE1       $69E2  
;;  $6AE2       $6AB1  
;;  $6B2D       $6AB5  
;;  $6B5C       $6953  
;;  $6B78       $688A  
;;  $6B90       $60B5  
;;  $6BA0       $6006   $689B   $68B2  
;;  $6BB5       $68A2  
;;  $6BCA       $5C8B  
;;  $6BDC       $5CB7  
;;  $6BF1       $5ABE   $6C05  
;;  $6C07       $6467  
;;  $6C08       $6C27   $6C4D  
;;  $6C29       $6C0F  
;;  $6C4F       $6228  
;;  $6C5A       $6C5A  
;;  $6C64       $640B  
;;  $6C72       $6878  
;;  $6C86       $6199   $6373   $64BC  
;;  $6C97       $5CD2  
;;  $6CD2       $6CC3  
;;  $6CDF       $6CCE   $6CD8  
;;  $6CE0       $6CD0   $6CDE  
;;  $6CE6       $6CBC  
;;  $6CEC       $6CEA  
;;  $6CF0       $6CAE   $6CB4   $6CE8   $6FB2   $6FB8   $6FC1  
;;  $6CF5       $6CEE  
;;  $6D0C       $6D07  
;;  $6D16       $5376   $6D09   $6D11  
;;  $6D27       $6D18  
;;  $6D3B       $6D37  
;;  $6D3D       $6D41  
;;  $6D66       $6D5F  
;;  $6D77       $6D7A  
;;  $6D7C       $6D74  
;;  $6D8F       $6D96  
;;  $6D98       $6D2A   $6D47  
;;  $6D9A       $6CFE  
;;  $6DAB       $6DA2  
;;  $6DBD       $6DA6   $6DB8  
;;  $6DC9       $6DB5  
;;  $6DCA       $6DC8  
;;  $6DD6       $6DDF  
;;  $6DEA       $6DCD  
;;  $6DF1       $6DFA  
;;  $6E01       $6DE8  
;;  $6E0E       $6E05  
;;  $6E1A       $6E13  
;;  $6E1B       $6DBB  
;;  $6E2D       $6E29  
;;  $6E30       $6D1D  
;;  $6E3D       $6E23  
;;  $6E45       $6E41  
;;  $6E5B       $6E33  
;;  $6E69       $6E4F  
;;  $6E74       $6E67  
;;  $6E80       $6E30   $6E3B   $6E4A   $6E59  
;;  $6E8D       $6E81  
;;  $6E9A       $6E8F  
;;  $6EA7       $6D02   $6D0F   $6D14   $6DA4   $6DA9  
;;  $6EAF       $6EAA  
;;  $6EC3       $6EBB  
;;  $6ECC       $6EB2   $6EB9  
;;  $6ECF       $6CF3  
;;  $6EF4       $6EE8  
;;  $6EFE       $6EF7  
;;  $6F18       $6F14  
;;  $6F23       $6EF2   $6EFC   $6F0B  
;;  $6F30       $6F2B  
;;  $6F38       $6ED2   $6ED6   $6EDB   $6EDF  
;;  $6F39       $6CAC  
;;  $6F56       $6F4E   $6F52  
;;  $6F5F       $6F50  
;;  $6F6C       $6F54  
;;  $6F84       $6F5D   $6F6A  
;;  $6F8D       $6F89  
;;  $6FAF       $6F3B  
;;  $6FCE       $6FA5  
;;  $6FCF       $6FCD  
;;  $6FF0       $6FE3  
;; ======================================================================== ;;
