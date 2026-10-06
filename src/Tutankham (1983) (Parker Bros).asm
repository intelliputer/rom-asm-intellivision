
        ORG     $5000
.HEADER:
        BIDECLE $54B2           ; 5000  Ptr: MOB graphic images
        BIDECLE $5029           ; 5002  Ptr: EXEC timer table
        BIDECLE $5095           ; 5004  Ptr: Start of game
        BIDECLE $539A           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501C           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502F           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $0001   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0001   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.GRAM_INIT_501C:
        DECLE   $0030           ; 501C  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 501D  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 501F  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5021  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 5023  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 5025  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 5027  #28-2F:  CART #28-2F ----

.TIMER:
        DECLE   $000B,  $0062,  $0001,  $0000; 5029  Timer dispatch/interval
        BIDECLE $0000           ; 502D  End of timer table

.TITLE:
        DECLE   $0052                           ; 502F  Cartridge year
        DECLE   $0000                           ; 5030  

.TITLECODE:
        PSHR    R5                              ; 5031   0275
        SDBD                                    ; 5032   0001
        MVII    #$65C1, R0                      ; 5033   02B8 00C1 0065
        MVO     R0,     .ISRVEC.0               ; 5036   0240 0100
        SWAP    R0,     1                       ; 5038   0040
        MVO     R0,     .ISRVEC.1               ; 5039   0240 0101

        JSR     R5,     L_516A                  ; 503B   0004 0150 016A

        MVII    #$0203, R4                      ; 503E   02BC 0203
        MVII    #$0007, R3                      ; 5040   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 5042   0004 0118 007B
        STRING  "PARKER BROTHERS"               ; 5045  
        DECLE   $0000                           ; 5054   0000

        MVII    #$021A, R4                      ; 5055   02BC 021A

        JSR     R5,     X_PRINT_R5              ; 5057   0004 0118 007B
        STRING  "PRESENTS"                      ; 505A  
        DECLE   $0000                           ; 5062   0000

        MVII    #$0256, R4                      ; 5063   02BC 0256

        JSR     R5,     X_PRINT_R5              ; 5065   0004 0118 007B
        STRING  "Konami's"                      ; 5068  
        DECLE   $0000                           ; 5070   0000

        MVII    #$027D, R4                      ; 5071   02BC 027D

        JSR     R5,     X_PRINT_R5              ; 5073   0004 0118 007B
        STRING  "TUTANKHAM"                     ; 5076  
        DECLE   $0000                           ; 507F   0000

        MVII    #$02CB, R4                      ; 5080   02BC 02CB

        JSR     R5,     X_PRINT_R5              ; 5082   0004 0118 007B
        STRING  "COPYRIGHT 1983"                ; 5085  
        DECLE   $0000                           ; 5093   0000

        PULR    R7                              ; 5094   02B7

.START:
        PSHR    R5                              ; 5095   0275

L_5096:
        JSR     R5,     L_50A3                  ; 5096   0004 0150 00A3
        DECLE   $0000,  $0000,  $00B2,  $0050   ; 5099   0000 0000 00B2 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 509D   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50A1   0000 0000
L_50A3:
        MVO     R5,     G_035D                  ; 50A3   0245 035D
        MVII    #$0169, R4                      ; 50A5   02BC 0169
        MVII    #$0087, R0                      ; 50A7   02B8 0087

        JSR     R5,     X_FILL_ZERO             ; 50A9   0004 0114 0338

        MVI     G_015F, R1                      ; 50AC   0281 015F
        TSTR    R1                              ; 50AE   0089
        BEQ     L_5111                          ; 50AF   0204 0060
        PULR    R7                              ; 50B1   02B7

        PSHR    R5                              ; 50B2   0275
        MVI     G_015F, R1                      ; 50B3   0281 015F
        TSTR    R1                              ; 50B5   0089
        BEQ     L_50E1                          ; 50B6   0204 0029

        CLRR    R1                              ; 50B8   01C9
        MVO     R1,     G_0169                  ; 50B9   0241 0169
        MVO     R1,     G_0160                  ; 50BB   0241 0160
        MVII    #$0161, R4                      ; 50BD   02BC 0161
        MVII    #$0006, R3                      ; 50BF   02BB 0006
L_50C1:
        MVO@    R1,     R4                      ; 50C1   0261
        DECR    R3                              ; 50C2   0013
        BNEQ    L_50C1                          ; 50C3   022C 0003

        MVI     G_0186, R1                      ; 50C5   0281 0186
        TSTR    R1                              ; 50C7   0089
        BNEQ    L_50E1                          ; 50C8   020C 0017

        CMPI    #$000B, R0                      ; 50CA   0378 000B
        BNEQ    L_50E1                          ; 50CC   020C 0013

        MVII    #$0003, R1                      ; 50CE   02B9 0003
        CMP     G_0168, R1                      ; 50D0   0341 0168
        BEQ     L_50D6                          ; 50D2   0204 0002

        ADDI    #$0002, R1                      ; 50D4   02F9 0002
L_50D6:
        MVO     R1,     G_016A                  ; 50D6   0241 016A
        MVI     G_0167, R2                      ; 50D8   0282 0167
        TSTR    R2                              ; 50DA   0092
        BEQ     L_51A5                          ; 50DB   0204 00C8

        MVO     R1,     G_016B                  ; 50DD   0241 016B
        B       L_51A5                          ; 50DF   0200 00C4

L_50E1:
        MVI     G_0186, R1                      ; 50E1   0281 0186
        TSTR    R1                              ; 50E3   0089
        BEQ     L_5111                          ; 50E4   0204 002B

        MVI     G_0168, R1                      ; 50E6   0281 0168
        TSTR    R1                              ; 50E8   0089
        BNEQ    L_51A0                          ; 50E9   020C 00B5

        MVI     G_0167, R1                      ; 50EB   0281 0167
        TSTR    R1                              ; 50ED   0089
        BEQ     L_513C                          ; 50EE   0204 004C

        DECR    R1                              ; 50F0   0011
        TSTR    R0                              ; 50F1   0080
        BEQ     L_5173                          ; 50F2   0204 007F

        CMPI    #$0004, R0                      ; 50F4   0378 0004
        BGT     L_5173                          ; 50F6   020E 007B
        BNEQ    L_5103                          ; 50F8   020C 0009

        MVII    #$0003, R2                      ; 50FA   02BA 0003
        MVO     R2,     G_016A                  ; 50FC   0242 016A
        TSTR    R1                              ; 50FE   0089
        BEQ     L_5103                          ; 50FF   0204 0002

        MVO     R2,     G_016B                  ; 5101   0242 016B
L_5103:
        MVO     R1,     G_0167                  ; 5103   0241 0167
        MVO     R0,     G_0168                  ; 5105   0240 0168
        MVII    #$0007, R3                      ; 5107   02BB 0007
        MVII    #$0001, R1                      ; 5109   02B9 0001
        MVII    #$028A, R4                      ; 510B   02BC 028A

        JSR     R5,     X_PRNUM_RGT             ; 510D   0004 0118 00C5

        PULR    R7                              ; 5110   02B7

L_5111:
        MVII    #$0004, R0                      ; 5111   02B8 0004
        MVO     R0,     G_0103                  ; 5113   0240 0103

        JSR     R5,     L_516A                  ; 5115   0004 0150 016A
        JSR     R5,     .EXEC.7B3               ; 5118   0004 0114 03B3
        JSR     R5,     .EXEC.A83               ; 511B   0004 0118 0283

        CLRR    R4                              ; 511E   01E4
        MVO     R4,     G_0167                  ; 511F   0244 0167
        MVO     R4,     G_0168                  ; 5121   0244 0168
        MVII    #$0229, R4                      ; 5123   02BC 0229
        MVO     R4,     G_0186                  ; 5125   0244 0186
        MVII    #$0006, R3                      ; 5127   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5129   0004 0118 007B
        STRING  "PLAYERS 1 OR 2"                ; 512C  
        DECLE   $0000                           ; 513A   0000

        PULR    R7                              ; 513B   02B7

L_513C:
        MVII    #$0005, R1                      ; 513C   02B9 0005
        CMPI    #$0001, R0                      ; 513E   0378 0001
        BEQ     L_5148                          ; 5140   0204 0006

        CMPI    #$0002, R0                      ; 5142   0378 0002
        BNEQ    L_5173                          ; 5144   020C 002D

        MVO     R1,     G_016B                  ; 5146   0241 016B
L_5148:
        MVO     R0,     G_0167                  ; 5148   0240 0167
        MVO     R1,     G_016A                  ; 514A   0241 016A
        MVII    #$0007, R3                      ; 514C   02BB 0007
        MVII    #$023A, R4                      ; 514E   02BC 023A
        MVII    #$0001, R1                      ; 5150   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5152   0004 0118 00C5

        DECR    R3                              ; 5155   0013
        MVII    #$0279, R4                      ; 5156   02BC 0279

        JSR     R5,     X_PRINT_R5              ; 5158   0004 0118 007B
        STRING  "LEVEL? 1 TO 4"                 ; 515B  
        DECLE   $0000                           ; 5168   0000

        PULR    R7                              ; 5169   02B7

L_516A:
        PSHR    R5                              ; 516A   0275
        MVII    #$0200, R4                      ; 516B   02BC 0200
        MVII    #$00F0, R0                      ; 516D   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 516F   0004 0114 0338

        PULR    R7                              ; 5172   02B7

L_5173:
        JSR     R5,     X_PLAY_RAZZ2            ; 5173   0004 011C 02BD

        PULR    R7                              ; 5176   02B7

L_5177:
        MVII    #$03FF, R0                      ; 5177   02B8 03FF
L_5179:
        DECR    R0                              ; 5179   0010
        INCR    R0                              ; 517A   0008
        DECR    R0                              ; 517B   0010
        BNEQ    L_5179                          ; 517C   022C 0004

        DECR    R1                              ; 517E   0011
        BNEQ    L_5177                          ; 517F   022C 0009
        MOVR    R5,     R7                      ; 5181   00AF

        DECLE   $00EE,  $0051,  $003F           ; 5182   00EE 0051 003F

        SAR     R2,     1                       ; 5185   006A
        MOVR    R0,     R5                      ; 5186   0085
        SAR     R0,     1                       ; 5187   0068
        COMR    R2                              ; 5188   001A
        SAR     R1,     1                       ; 5189   0069
        SLL     R3,     2                       ; 518A   004F
        SLR     R3,     1                       ; 518B   0063
L_518C:
        MVII    #$00F0, R3                      ; 518C   02BB 00F0

L_518E:
        JSR     R4,     .EXEC.A76               ; 518E   0004 0018 0276

        CLRR    R0                              ; 5191   01C0
        MVO     R0,     G_01CA                  ; 5192   0240 01CA
        MVO     R0,     G_01CD                  ; 5194   0240 01CD
        MVO     R0,     G_01CE                  ; 5196   0240 01CE
        INCR    R0                              ; 5198   0008
        MVO     R1,     G_01CF                  ; 5199   0241 01CF
        MVO     R0,     G_0147                  ; 519B   0240 0147
        J       X_PLAY_MUS1                     ; 519D   0004 0318 0327

L_51A0:
        MVO     R1,     G_015F                  ; 51A0   0241 015F
        DECR    R1                              ; 51A2   0011
        MVO     R1,     G_0168                  ; 51A3   0241 0168
L_51A5:
        SDBD                                    ; 51A5   0001
        MVII    #$51EF, R5                      ; 51A6   02BD 00EF 0051
        PSHR    R5                              ; 51A9   0275
        MVII    #$0001, R1                      ; 51AA   02B9 0001

        JSR     R5,     L_518C                  ; 51AC   0004 0150 018C
        DECLE   $00F8,  $0038,  $00F8,  $0038   ; 51AF   00F8 0038 00F8 0038
        DECLE   $0118,  $0038,  $0128,  $0038   ; 51B3   0118 0038 0128 0038
        DECLE   $0148,  $0038,  $0128,  $0038   ; 51B7   0148 0038 0128 0038
        DECLE   $0118,  $0038,  $00F8,  $00D8   ; 51BB   0118 0038 00F8 00D8
        DECLE   $00F8,  $0038,  $00F8,  $0038   ; 51BF   00F8 0038 00F8 0038
        DECLE   $0118,  $0038,  $0128,  $0038   ; 51C3   0118 0038 0128 0038
        DECLE   $0148,  $0038,  $0128,  $0038   ; 51C7   0148 0038 0128 0038
        DECLE   $0118,  $0038,  $00F8,  $00D8   ; 51CB   0118 0038 00F8 00D8
        DECLE   $00F8,  $0038,  $00F8,  $0038   ; 51CF   00F8 0038 00F8 0038
        DECLE   $0118,  $00F8,  $0038,  $0018   ; 51D3   0118 00F8 0038 0018
        DECLE   $00F8,  $0038,  $00F8,  $0038   ; 51D7   00F8 0038 00F8 0038
        DECLE   $0118,  $00F8,  $0038,  $0018   ; 51DB   0118 00F8 0038 0018
        DECLE   $00F8,  $0038,  $00F8,  $0038   ; 51DF   00F8 0038 00F8 0038
        DECLE   $0118,  $00F8,  $0004,  $0000   ; 51E3   0118 00F8 0004 0000

        CLRR    R0                              ; 51E7   01C0
        MVO     R0,     G_01CF                  ; 51E8   0240 01CF
        INCR    R0                              ; 51EA   0008
        MVO     R0,     G_0183                  ; 51EB   0240 0183
        PULR    R7                              ; 51ED   02B7

        DECLE   $0000                           ; 51EE   0000
L_51EF:
        CLRR    R1                              ; 51EF   01C9
        MVO     R1,     G_035D                  ; 51F0   0241 035D
        MVII    #$018C, R4                      ; 51F2   02BC 018C
        MVII    #$003E, R0                      ; 51F4   02B8 003E

        JSR     R5,     X_FILL_ZERO             ; 51F6   0004 0114 0338
        JSR     R5,     L_516A                  ; 51F9   0004 0150 016A

        MVI     G_017A, R1                      ; 51FC   0281 017A
        TSTR    R1                              ; 51FE   0089
        BEQ     L_5217                          ; 51FF   0204 0016

        CLRR    R1                              ; 5201   01C9
        MVO     R1,     G_017A                  ; 5202   0241 017A
        SDBD                                    ; 5204   0001
        MVII    #$5E3A, R4                      ; 5205   02BC 003A 005E
        SDBD                                    ; 5208   0001
        MVII    #$5E35, R5                      ; 5209   02BD 0035 005E
        MVII    #$0005, R0                      ; 520C   02B8 0005
L_520E:
        MVI@    R4,     R1                      ; 520E   02A1
        ADD     G_0169, R1                      ; 520F   02C1 0169
        MVI@    R5,     R2                      ; 5211   02AA
        MVI@    R1,     R3                      ; 5212   028B
        MVO@    R3,     R2                      ; 5213   0253
        DECR    R0                              ; 5214   0010
        BNEQ    L_520E                          ; 5215   022C 0008

L_5217:
        MVII    #$0001, R0                      ; 5217   02B8 0001
        MVO     R0,     G_019F                  ; 5219   0240 019F
        MVO     R0,     G_019D                  ; 521B   0240 019D
L_521D:
        MVI     G_019F, R0                      ; 521D   0280 019F
        SARC    R0,     1                       ; 521F   0078
        BC      L_521D                          ; 5220   0221 0004

        MVII    #$0201, R3                      ; 5222   02BB 0201
        MVII    #$0013, R4                      ; 5224   02BC 0013
        MVI     G_0187, R0                      ; 5226   0280 0187
        TSTR    R0                              ; 5228   0080
        BEQ     L_523A                          ; 5229   0204 000F

        DECR    R0                              ; 522B   0010
        MVO     R0,     G_0187                  ; 522C   0240 0187
        MVI     G_0188, R0                      ; 522E   0280 0188
        SUBI    #$0014, R0                      ; 5230   0338 0014
        MVO     R0,     G_0188                  ; 5232   0240 0188
        DECR    R3                              ; 5234   0013
        INCR    R4                              ; 5235   000C
        MVO     R4,     G_01A1                  ; 5236   0244 01A1
        B       L_5243                          ; 5238   0200 0009

L_523A:
        SDBD                                    ; 523A   0001
        MVII    #$5E47, R1                      ; 523B   02B9 0047 005E
        ADD     G_018B, R1                      ; 523E   02C1 018B
        MVI@    R1,     R0                      ; 5240   0288
        MVO     R0,     G_0188                  ; 5241   0240 0188
L_5243:
        PSHR    R4                              ; 5243   0274

        JSR     R5,     L_52AF                  ; 5244   0004 0150 02AF

        SUBI    #$00DB, R3                      ; 5247   033B 00DB
        MVI     G_0188, R0                      ; 5249   0280 0188
        INCR    R0                              ; 524B   0008
        MVO     R0,     G_0188                  ; 524C   0240 0188
        PULR    R4                              ; 524E   02B4
        DECR    R4                              ; 524F   0014
        BNEQ    L_5243                          ; 5250   022C 000E

        MVI     G_01A1, R1                      ; 5252   0281 01A1
        TSTR    R1                              ; 5254   0089
        BEQ     L_525E                          ; 5255   0204 0007

        MVO     R4,     G_01A1                  ; 5257   0244 01A1
        MVI     G_0187, R1                      ; 5259   0281 0187
        INCR    R1                              ; 525B   0009
        MVO     R1,     G_0187                  ; 525C   0241 0187
L_525E:
        SDBD                                    ; 525E   0001
        MVII    #$5952, R1                      ; 525F   02B9 0052 0059
        MVII    #$031D, R2                      ; 5262   02BA 031D
        MVII    #$0008, R0                      ; 5264   02B8 0008

        JSR     R5,     X_INIT_MOBS             ; 5266   0004 0114 02B4

        MVI     G_0187, R1                      ; 5269   0281 0187
        MVO     R1,     G_019B                  ; 526B   0241 019B
        TSTR    R1                              ; 526D   0089
        BEQ     L_5280                          ; 526E   0204 0010

        MVI     G_0169, R1                      ; 5270   0281 0169
        MOVR    R1,     R2                      ; 5272   008A
        ADDI    #$017B, R2                      ; 5273   02FA 017B
        MVI@    R2,     R3                      ; 5275   0293
        SWAP    R3,     1                       ; 5276   0043
        MVO     R3,     G_0327                  ; 5277   0243 0327
        MVO     R3,     G_032F                  ; 5279   0243 032F
        ADDI    #$017D, R1                      ; 527B   02F9 017D
        MVI@    R1,     R1                      ; 527D   0289
        B       L_5287                          ; 527E   0200 0007

L_5280:
        SDBD                                    ; 5280   0001
        MVII    #$5E4F, R3                      ; 5281   02BB 004F 005E
        ADD     G_018B, R3                      ; 5284   02C3 018B
        MVI@    R3,     R1                      ; 5286   0299
L_5287:
        SWAP    R1,     1                       ; 5287   0041
        MVO     R1,     G_0328                  ; 5288   0241 0328
        MVO     R1,     G_0330                  ; 528A   0241 0330

        JSR     R5,     L_5299                  ; 528C   0004 0150 0299

        ADDR    R5,     R5                      ; 528F   00ED
        SLLC    R3,     2                       ; 5290   005F
        ADDR    R1,     R0                      ; 5291   00C8
        SLLC    R3,     2                       ; 5292   005F
        SLR     R2,     2                       ; 5293   0066
        SLR     R0,     1                       ; 5294   0060
        MOVR    R2,     R7                      ; 5295   0097

        SLR     R0,     1                       ; 5296   0060
        MOVR    R3,     R4                      ; 5297   009C
        SLR     R0,     1                       ; 5298   0060
L_5299:
        MVO     R5,     G_035D                  ; 5299   0245 035D
        MVI     G_0189, R1                      ; 529B   0281 0189
        TSTR    R1                              ; 529D   0089
        BEQ     L_52AE                          ; 529E   0204 000E

        SDBD                                    ; 52A0   0001
        MVII    #$1046, R1                      ; 52A1   02B9 0046 0010
        MVO     R1,     G_031D                  ; 52A4   0241 031D
        MVI     G_0327, R1                      ; 52A6   0281 0327
        MVO     R1,     G_031F                  ; 52A8   0241 031F
        MVI     G_0328, R1                      ; 52AA   0281 0328
        MVO     R1,     G_0320                  ; 52AC   0241 0320
L_52AE:
        PULR    R7                              ; 52AE   02B7

L_52AF:
        PSHR    R5                              ; 52AF   0275
        PSHR    R3                              ; 52B0   0273

        JSR     R5,     L_5384                  ; 52B1   0004 0150 0384

        MVO@    R2,     R3                      ; 52B4   025A
        CLRR    R0                              ; 52B5   01C0
        SDBD                                    ; 52B6   0001
        MVII    #$5B63, R5                      ; 52B7   02BD 0063 005B
        ADD     G_0188, R5                      ; 52BA   02C5 0188
        CMPI    #$0200, R3                      ; 52BC   037B 0200
        BNEQ    L_52C7                          ; 52BE   020C 0007

        MVI     G_01A1, R1                      ; 52C0   0281 01A1
        TSTR    R1                              ; 52C2   0089
        BNEQ    L_52C7                          ; 52C3   020C 0002

        SUBI    #$0015, R5                      ; 52C5   033D 0015
L_52C7:
        SDBD                                    ; 52C7   0001
        CMPI    #$5B65, R5                      ; 52C8   037D 0065 005B
        BLT     L_52D4                          ; 52CB   0205 0007

        SDBD                                    ; 52CD   0001
        CMPI    #$5B66, R5                      ; 52CE   037D 0066 005B
        BGT     L_52D4                          ; 52D1   020E 0001

        MVO@    R0,     R3                      ; 52D3   0258
L_52D4:
        ADDI    #$0014, R3                      ; 52D4   02FB 0014
        MVI@    R5,     R1                      ; 52D6   02A9
        MVII    #$000A, R4                      ; 52D7   02BC 000A
L_52D9:
        SARC    R1,     1                       ; 52D9   0079
        BC      L_52DF                          ; 52DA   0201 0003

        MVO@    R0,     R3                      ; 52DC   0258
        B       L_52E0                          ; 52DD   0200 0001

L_52DF:
        MVO@    R2,     R3                      ; 52DF   025A
L_52E0:
        ADDI    #$0014, R3                      ; 52E0   02FB 0014
        DECR    R4                              ; 52E2   0014
        BNEQ    L_52D9                          ; 52E3   022C 000B

        MVO@    R2,     R3                      ; 52E5   025A
        MVI     G_0188, R1                      ; 52E6   0281 0188
        MVI     G_019D, R2                      ; 52E8   0282 019D
        SARC    R2,     1                       ; 52EA   007A
        BC      L_52F1                          ; 52EB   0201 0004
        BEQ     L_52F1                          ; 52ED   0204 0002

        SUBI    #$0015, R1                      ; 52EF   0339 0015
L_52F1:
        SDBD                                    ; 52F1   0001
        MVII    #$5C37, R4                      ; 52F2   02BC 0037 005C
        ADDR    R1,     R4                      ; 52F5   00CC
        MVI@    R4,     R1                      ; 52F6   02A1
        PULR    R4                              ; 52F7   02B4
        SUBI    #$0201, R4                      ; 52F8   033C 0201
        BPL     L_5301                          ; 52FA   0203 0005

        MVI     G_01A1, R5                      ; 52FC   0285 01A1
        TSTR    R5                              ; 52FE   00AD
        BEQ     L_5303                          ; 52FF   0204 0002

L_5301:
        ADDI    #$0002, R4                      ; 5301   02FC 0002
L_5303:
        ADD     G_0187, R4                      ; 5303   02C4 0187
        PSHR    R1                              ; 5305   0271
        PSHR    R3                              ; 5306   0273
        PSHR    R4                              ; 5307   0274
        SUBI    #$0028, R3                      ; 5308   033B 0028
        MOVR    R4,     R5                      ; 530A   00A5
        MVII    #$0184, R1                      ; 530B   02B9 0184
        ADD     G_0169, R1                      ; 530D   02C1 0169
        MVI@    R1,     R4                      ; 530F   028C
        TSTR    R4                              ; 5310   00A4
        BEQ     L_532F                          ; 5311   0204 001C

        MVI     G_018B, R4                      ; 5313   0284 018B
        SDBD                                    ; 5315   0001
        ADDI    #$5EC4, R4                      ; 5316   02FC 00C4 005E
        MVI@    R4,     R0                      ; 5319   02A0
        CMPR    R5,     R0                      ; 531A   0168
        BEQ     L_5327                          ; 531B   0204 000A

        MVI     G_018B, R2                      ; 531D   0282 018B
        CMPI    #$0003, R2                      ; 531F   037A 0003
        BNEQ    L_532F                          ; 5321   020C 000C

        INCR    R0                              ; 5323   0008
        CMPR    R5,     R0                      ; 5324   0168
        BNEQ    L_532F                          ; 5325   020C 0008

L_5327:
        SDBD                                    ; 5327   0001
        MVII    #$0825, R2                      ; 5328   02BA 0025 0008

        JSR     R4,     L_536D                  ; 532B   0004 0050 036D

        MVO@    R2,     R3                      ; 532E   025A
L_532F:
        PULR    R4                              ; 532F   02B4
        PULR    R3                              ; 5330   02B3
        PULR    R1                              ; 5331   02B1
        TSTR    R1                              ; 5332   0089
        BEQ     L_536C                          ; 5333   0204 0037

        PSHR    R3                              ; 5335   0273
        SUBI    #$00C8, R3                      ; 5336   033B 00C8
        SDBD                                    ; 5338   0001
        MVII    #$5D0A, R5                      ; 5339   02BD 000A 005D
        ADDR    R1,     R5                      ; 533C   00CD
L_533D:
        MVI@    R5,     R1                      ; 533D   02A9
        TSTR    R1                              ; 533E   0089
        BEQ     L_536B                          ; 533F   0204 002A

        CMPI    #$0135, R1                      ; 5341   0379 0135
        BNEQ    L_534F                          ; 5343   020C 000A

        MVII    #$0184, R2                      ; 5345   02BA 0184
        ADD     G_0169, R2                      ; 5347   02C2 0169
        MVI@    R2,     R2                      ; 5349   0292
        TSTR    R2                              ; 534A   0092
        BEQ     L_534F                          ; 534B   0204 0002

        MVII    #$001E, R1                      ; 534D   02B9 001E
L_534F:
        MOVR    R1,     R2                      ; 534F   008A
        ANDI    #$0100, R2                      ; 5350   03BA 0100
        ADDI    #$0080, R2                      ; 5352   02FA 0080
        SLL     R2,     2                       ; 5354   004E
        SLL     R2,     2                       ; 5355   004E
        ANDI    #$00FF, R1                      ; 5356   03B9 00FF
        ADDR    R1,     R2                      ; 5358   00CA
        MOVR    R2,     R0                      ; 5359   0090
        SDBD                                    ; 535A   0001
        ANDI    #$07F8, R0                      ; 535B   03B8 00F8 0007
        CMPI    #$0020, R0                      ; 535E   0378 0020
        BGT     L_5366                          ; 5360   020E 0004

        MOVR    R4,     R0                      ; 5362   00A0

        JSR     R4,     L_536D                  ; 5363   0004 0050 036D

L_5366:
        MVI@    R5,     R1                      ; 5366   02A9
        ADDR    R3,     R1                      ; 5367   00D9
        MVO@    R2,     R1                      ; 5368   024A
        B       L_533D                          ; 5369   0220 002D

L_536B:
        PULR    R3                              ; 536B   02B3
L_536C:
        PULR    R7                              ; 536C   02B7

L_536D:
        PSHR    R4                              ; 536D   0274
        MVI     G_0169, R1                      ; 536E   0281 0169
        SLL     R1,     2                       ; 5370   004D
        SLL     R1,     2                       ; 5371   004D
        MOVR    R1,     R4                      ; 5372   008C
        ADDI    #$01D0, R4                      ; 5373   02FC 01D0
        MVI     G_018A, R1                      ; 5375   0281 018A
        TSTR    R1                              ; 5377   0089
        BEQ     L_5383                          ; 5378   0204 0009

L_537A:
        CMP@    R4,     R0                      ; 537A   0360
        BEQ     L_5382                          ; 537B   0204 0005

        DECR    R1                              ; 537D   0011
        BNEQ    L_537A                          ; 537E   022C 0005
        B       L_5383                          ; 5380   0200 0001

L_5382:
        CLRR    R2                              ; 5382   01D2
L_5383:
        PULR    R7                              ; 5383   02B7

L_5384:
        PSHR    R5                              ; 5384   0275
        SDBD                                    ; 5385   0001
        MVII    #$5E4B, R1                      ; 5386   02B9 004B 005E
        ADD     G_018B, R1                      ; 5389   02C1 018B
        MVI@    R1,     R2                      ; 538B   028A
        CMPI    #$0008, R2                      ; 538C   037A 0008
        BNEQ    L_5395                          ; 538E   020C 0005

        SWAP    R2,     1                       ; 5390   0042
        ADDI    #$0003, R2                      ; 5391   02FA 0003
        B       L_5399                          ; 5393   0200 0004

L_5395:
        SDBD                                    ; 5395   0001
        ADDI    #$1800, R2                      ; 5396   02FA 0000 0018
L_5399:
        PULR    R7                              ; 5399   02B7

.GFX_LIST_539A:
        DECLE   $00D7,  $00DB,  $00D7,  $0000   ; 539A  CART PIC #00
        DECLE   $00FD,  $00D9,  $00BD,  $0000   ; 539E  
        DECLE   $007E,  $0081,  $0099,  $005A   ; 53A2  CART PIC #01
        DECLE   $00BD,  $0081,  $00FF,  $0000   ; 53A6  
        DECLE   $0018,  $003C,  $0018,  $0024   ; 53AA  CART PIC #02
        DECLE   $0042,  $0042,  $003C,  $0000   ; 53AE  
        DECLE   $0002,  $0006,  $000D,  $00D2   ; 53B2  CART PIC #03
        DECLE   $00A0,  $0050,  $0030,  $0000   ; 53B6  
        DECLE   $00FF,  $00E7,  $00C3,  $00C3   ; 53BA  CART PIC #04
        DECLE   $00E7,  $00E7,  $00C3,  $00FF   ; 53BE  
        DECLE   $00C3,  $0081,  $0081,  $00C3   ; 53C2  CART PIC #05
        DECLE   $0081,  $0081,  $00C3,  $0000   ; 53C6  
        DECLE   $00FF,  $0023,  $0001,  $0001   ; 53CA  CART PIC #06
        DECLE   $0003,  $0001,  $0049,  $00FF   ; 53CE  
        DECLE   $00FF,  $00C9,  $0081,  $0083   ; 53D2  CART PIC #07
        DECLE   $0081,  $00C1,  $0083,  $0081   ; 53D6  
        DECLE   $00FF,  $0092,  $0080,  $00C0   ; 53DA  CART PIC #08
        DECLE   $0080,  $0080,  $00C4,  $00FF   ; 53DE  
        DECLE   $0081,  $00C1,  $0083,  $0081   ; 53E2  CART PIC #09
        DECLE   $00C1,  $0081,  $0093,  $00FF   ; 53E6  
        DECLE   $00FF,  $0081,  $0001,  $0001   ; 53EA  CART PIC #0A
        DECLE   $0001,  $0001,  $0081,  $00FF   ; 53EE  
        DECLE   $00FF,  $0081,  $0081,  $0081   ; 53F2  CART PIC #0B
        DECLE   $0081,  $0081,  $00C3,  $0000   ; 53F6  
        DECLE   $00FF,  $0081,  $0080,  $0080   ; 53FA  CART PIC #0C
        DECLE   $0080,  $0080,  $0081,  $00FF   ; 53FE  
        DECLE   $00C3,  $0081,  $0081,  $0081   ; 5402  CART PIC #0D
        DECLE   $0081,  $0081,  $0081,  $00FF   ; 5406  
        DECLE   $0000,  $0030,  $0030,  $0000   ; 540A  CART PIC #0E
        DECLE   $0000,  $0060,  $0066,  $0006   ; 540E  
        DECLE   $00FF,  $00FF,  $0006,  $0006   ; 5412  CART PIC #0F
        DECLE   $0000,  $0060,  $0060,  $0000   ; 5416  
        DECLE   $0006,  $0006,  $00FF,  $00FF   ; 541A  CART PIC #10
        DECLE   $0006,  $0066,  $0060,  $0000   ; 541E  
        DECLE   $0000,  $00C3,  $00C3,  $0000   ; 5422  CART PIC #11
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5426  
        DECLE   $0081,  $0081,  $0000,  $0066   ; 542A  CART PIC #12
        DECLE   $00FF,  $007E,  $0024,  $005A   ; 542E  
        DECLE   $0024,  $0000,  $0081,  $0081   ; 5432  CART PIC #13
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5436  
        DECLE   $0000,  $000C,  $000C,  $0000   ; 543A  CART PIC #14
        DECLE   $0000,  $0006,  $0066,  $0060   ; 543E  
        DECLE   $00FF,  $00FF,  $0060,  $0060   ; 5442  CART PIC #15
        DECLE   $0000,  $0006,  $0006,  $0000   ; 5446  
        DECLE   $0060,  $0060,  $00FF,  $00FF   ; 544A  CART PIC #16
        DECLE   $0060,  $0066,  $0006,  $0000   ; 544E  
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5452  CART PIC #17
        DECLE   $0038,  $00FE,  $0000,  $0000   ; 5456  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 545A  CART PIC #18
        DECLE   $0000,  $0000,  $00AA,  $00FF   ; 545E  
        DECLE   $0055,  $0000,  $0000,  $0000   ; 5462  CART PIC #19
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5466  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 546A  CART PIC #1A
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 546E  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5472  CART PIC #1B
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 5476  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 547A  CART PIC #1C
        DECLE   $00FF,  $00FF,  $001F,  $003F   ; 547E  
        DECLE   $00F8,  $00F8,  $00FC,  $00FC   ; 5482  CART PIC #1D
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 5486  
        DECLE   $0000,  $0001,  $0000,  $0000   ; 548A  CART PIC #1E
        DECLE   $0040,  $0040,  $0040,  $0040   ; 548E  
        DECLE   $007F,  $00FF,  $00FF,  $003F   ; 5492  CART PIC #1F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 5496  
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 549A  CART PIC #20
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 549E  
        DECLE   $0040,  $00C0,  $00FF,  $00FF   ; 54A2  CART PIC #21
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 54A6  
        DECLE   $001F,  $001F,  $00FF,  $00FF   ; 54AA  CART PIC #22
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 54AE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54B2  CART PIC #23
        DECLE   $0034,  $003F,  $003A,  $001C   ; 54B6  
        DECLE   $0000,  $0011,  $001B,  $000C   ; 54BA  CART PIC #24
        DECLE   $0000,  $0000,  $0001,  $0077   ; 54BE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54C2  CART PIC #25
        DECLE   $0034,  $003F,  $003A,  $001C   ; 54C6  
        DECLE   $0000,  $0011,  $0017,  $001C   ; 54CA  CART PIC #26
        DECLE   $0000,  $0000,  $0000,  $001C   ; 54CE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54D2  CART PIC #27
        DECLE   $0034,  $003F,  $003A,  $001C   ; 54D6  
        DECLE   $0000,  $0012,  $0012,  $0018   ; 54DA  CART PIC #28
        DECLE   $0008,  $0080,  $0081,  $00C7   ; 54DE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54E2  CART PIC #29
        DECLE   $0034,  $003F,  $003A,  $001C   ; 54E6  
        DECLE   $0000,  $0011,  $0017,  $001C   ; 54EA  CART PIC #2A
        DECLE   $0000,  $0000,  $0000,  $001C   ; 54EE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54F2  CART PIC #2B
        DECLE   $0000,  $0000,  $0000,  $00D6   ; 54F6  
        DECLE   $0092,  $0082,  $00C6,  $0000   ; 54FA  CART PIC #2C
        DECLE   $0000,  $0000,  $0000,  $006C   ; 54FE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5502  CART PIC #2D
        DECLE   $0000,  $0000,  $0000,  $006B   ; 5506  
        DECLE   $0049,  $0041,  $0063,  $0000   ; 550A  CART PIC #2E
        DECLE   $0000,  $0030,  $0000,  $0006   ; 550E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5512  CART PIC #2F
        DECLE   $0000,  $0000,  $0000,  $00D6   ; 5516  
        DECLE   $0092,  $0082,  $00C6,  $0000   ; 551A   0092 0082 00C6 0000
        DECLE   $0000,  $0000,  $0000,  $006C   ; 551E   0000 0000 0000 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5522   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $006B   ; 5526   0000 0000 0000 006B
        DECLE   $0049,  $0041,  $0063,  $0000   ; 552A   0049 0041 0063 0000
        DECLE   $0000,  $0006,  $0000,  $0030   ; 552E   0000 0006 0000 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5532   0000 0000 0000 0000
        DECLE   $0054,  $007C,  $0028,  $00D6   ; 5536   0054 007C 0028 00D6
        DECLE   $0092,  $0082,  $00C6,  $0000   ; 553A   0092 0082 00C6 0000
        DECLE   $0000,  $0000,  $0000,  $006C   ; 553E   0000 0000 0000 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5542   0000 0000 0000 0000
        DECLE   $002A,  $003E,  $0014,  $006B   ; 5546   002A 003E 0014 006B
        DECLE   $0049,  $0041,  $0063,  $0000   ; 554A   0049 0041 0063 0000
        DECLE   $0000,  $0030,  $0000,  $0006   ; 554E   0000 0030 0000 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5552   0000 0000 0000 0000
        DECLE   $0054,  $007C,  $0028,  $00D6   ; 5556   0054 007C 0028 00D6
        DECLE   $0092,  $0082,  $00C6,  $0000   ; 555A   0092 0082 00C6 0000
        DECLE   $0000,  $0000,  $0000,  $006C   ; 555E   0000 0000 0000 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5562   0000 0000 0000 0000
        DECLE   $002A,  $003E,  $0014,  $006B   ; 5566   002A 003E 0014 006B
        DECLE   $0049,  $0041,  $0063,  $0000   ; 556A   0049 0041 0063 0000
        DECLE   $0000,  $0006,  $0000,  $0030   ; 556E   0000 0006 0000 0030
        DECLE   $0018,  $003C,  $003C,  $00FF   ; 5572   0018 003C 003C 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5576   0000 0000 0000 0000
        DECLE   $0038,  $002C,  $0024,  $0030   ; 557A   0038 002C 0024 0030
        DECLE   $003C,  $0036,  $0066,  $0000   ; 557E   003C 0036 0066 0000
        DECLE   $0018,  $003C,  $003C,  $00FF   ; 5582   0018 003C 003C 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5586   0000 0000 0000 0000
        DECLE   $0038,  $002C,  $0028,  $0020   ; 558A   0038 002C 0028 0020
        DECLE   $003C,  $0018,  $0018,  $0000   ; 558E   003C 0018 0018 0000
        DECLE   $0018,  $003C,  $003C,  $00FF   ; 5592   0018 003C 003C 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5596   0000 0000 0000 0000
        DECLE   $0038,  $002C,  $002C,  $0024   ; 559A   0038 002C 002C 0024
        DECLE   $0034,  $007E,  $0066,  $0000   ; 559E   0034 007E 0066 0000
        DECLE   $0018,  $003C,  $003C,  $00FF   ; 55A2   0018 003C 003C 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55A6   0000 0000 0000 0000
        DECLE   $0038,  $002C,  $0028,  $0020   ; 55AA   0038 002C 0028 0020
        DECLE   $003C,  $0018,  $0018,  $0000   ; 55AE   003C 0018 0018 0000
        DECLE   $0010,  $0038,  $007C,  $00FF   ; 55B2   0010 0038 007C 00FF
        DECLE   $007C,  $007C,  $0038,  $0028   ; 55B6   007C 007C 0038 0028
        DECLE   $0028,  $0038,  $0038,  $007C   ; 55BA   0028 0038 0038 007C
        DECLE   $007C,  $006C,  $006C,  $0000   ; 55BE   007C 006C 006C 0000
        DECLE   $0008,  $001C,  $003E,  $00FF   ; 55C2   0008 001C 003E 00FF
        DECLE   $003E,  $003E,  $001C,  $0014   ; 55C6   003E 003E 001C 0014
        DECLE   $0014,  $001C,  $001C,  $003E   ; 55CA   0014 001C 001C 003E
        DECLE   $003E,  $0006,  $0006,  $0000   ; 55CE   003E 0006 0006 0000
        DECLE   $0010,  $0038,  $007C,  $00FF   ; 55D2   0010 0038 007C 00FF
        DECLE   $007C,  $007C,  $0038,  $0028   ; 55D6   007C 007C 0038 0028
        DECLE   $0028,  $0038,  $0038,  $007C   ; 55DA   0028 0038 0038 007C
        DECLE   $007C,  $006C,  $006C,  $0000   ; 55DE   007C 006C 006C 0000
        DECLE   $0008,  $001C,  $003E,  $00FF   ; 55E2   0008 001C 003E 00FF
        DECLE   $003E,  $003E,  $001C,  $0014   ; 55E6   003E 003E 001C 0014
        DECLE   $0014,  $001C,  $001C,  $003E   ; 55EA   0014 001C 001C 003E
        DECLE   $003E,  $0030,  $0030,  $0000   ; 55EE   003E 0030 0030 0000
        DECLE   $0010,  $0038,  $007C,  $00FF   ; 55F2   0010 0038 007C 00FF
        DECLE   $0000,  $0000,  $0000,  $0028   ; 55F6   0000 0000 0000 0028
        DECLE   $0028,  $0038,  $0038,  $007C   ; 55FA   0028 0038 0038 007C
        DECLE   $007C,  $006C,  $006C,  $0000   ; 55FE   007C 006C 006C 0000
        DECLE   $0008,  $001C,  $003E,  $00FF   ; 5602   0008 001C 003E 00FF
        DECLE   $0000,  $0000,  $0000,  $0014   ; 5606   0000 0000 0000 0014
        DECLE   $0014,  $001C,  $001C,  $003E   ; 560A   0014 001C 001C 003E
        DECLE   $003E,  $0006,  $0006,  $0000   ; 560E   003E 0006 0006 0000
        DECLE   $0010,  $0038,  $007C,  $00FF   ; 5612   0010 0038 007C 00FF
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5616   0000 0000 0000 0028
        DECLE   $0028,  $0038,  $0038,  $007C   ; 561A   0028 0038 0038 007C
        DECLE   $007C,  $006C,  $006C,  $0000   ; 561E   007C 006C 006C 0000
        DECLE   $0008,  $001C,  $003E,  $00FF   ; 5622   0008 001C 003E 00FF
        DECLE   $0000,  $0000,  $0000,  $0014   ; 5626   0000 0000 0000 0014
        DECLE   $0014,  $001C,  $001C,  $003E   ; 562A   0014 001C 001C 003E
        DECLE   $003E,  $0030,  $0030,  $0000   ; 562E   003E 0030 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5632   0000 0000 0000 0000
        DECLE   $00C0,  $00C0,  $00E0,  $0030   ; 5636   00C0 00C0 00E0 0030
        DECLE   $0018,  $000C,  $0004,  $0000   ; 563A   0018 000C 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 563E   0000 0000 0000 0000
        DECLE   $0018,  $003E,  $003F,  $0020   ; 5642   0018 003E 003F 0020
        DECLE   $003C,  $003C,  $000C,  $000C   ; 5646   003C 003C 000C 000C
        DECLE   $0004                           ; 564A   0004

        CLRC                                    ; 564B   0006
        EIS                                     ; 564C   0002
        RRC     R3,     1                       ; 564D   0073
        SARC    R3,     2                       ; 564E   007F
        ADDR    R3,     R7                      ; 564F   00DF

        DECLE   $00FC,  $0006,  $0018,  $003E   ; 5650   00FC 0006 0018 003E
        DECLE   $003F                           ; 5654   003F

        GSWD    R0                              ; 5655   0030
        ADCR    R6                              ; 5656   002E
        RSWD    R6                              ; 5657   003E
        COMR    R6                              ; 5658   001E
        INCR    R6                              ; 5659   000E
        CLRC                                    ; 565A   0006
        SLR     R2,     2                       ; 565B   0066
        RRC     R2,     2                       ; 565C   0076
        SARC    R3,     2                       ; 565D   007F
        SLLC    R3,     2                       ; 565E   005F
        SLLC    R3,     2                       ; 565F   005F
        ADDR    R1,     R7                      ; 5660   00CF

        DECLE   $00C6,  $0018,  $003E,  $003F   ; 5661   00C6 0018 003E 003F
        DECLE   $0030,  $002C,  $003C,  $001C   ; 5665   0030 002C 003C 001C
        DECLE   $000C,  $0024,  $0036,  $0037   ; 5669   000C 0024 0036 0037
        DECLE   $003F,  $003F,  $0037           ; 566D   003F 003F 0037

        RRC     R3,     1                       ; 5670   0073
        SLR     R2,     1                       ; 5671   0062
        MOVR    R0,     R6                      ; 5672   0086
        ADDR    R5,     R7                      ; 5673   00EF

        DECLE   $006C,  $003C,  $0030,  $003A   ; 5674   006C 003C 0030 003A
        DECLE   $001F                           ; 5678   001F

        INCR    R7                              ; 5679   000F

        INCR    R6                              ; 567A   000E
L_567B:
        MOVR    R3,     R4                      ; 567B   009C
        DECLE   $00BF,  $00BC,  $00BF           ; 567C   00BF 00BC 00BF

        ADDR    R7,     R4                      ; 567F   00FC
        SARC    R0,     1                       ; 5680   0078
        ADCR    R0                              ; 5681   0028
        MOVR    R0,     R6                      ; 5682   0086
        ADDR    R5,     R7                      ; 5683   00EF

        DECLE   $006C,  $003C,  $0030,  $003A   ; 5684   006C 003C 0030 003A
        DECLE   $001F,  $000C,  $000C,  $006F   ; 5688   001F 000C 000C 006F
        DECLE   $007C,  $00BF                   ; 568C   007C 00BF

        MOVR    R5,     R4                      ; 568E   00AC
        ADDR    R4,     R4                      ; 568F   00E4
        ADDR    R4,     R4                      ; 5690   00E4
        SLR     R0,     1                       ; 5691   0060
        ADDR    R0,     R0                      ; 5692   00C0
        RRC     R0,     1                       ; 5693   0070
        ADCR    R7                              ; 5694   002F

        RRC     R1,     2                       ; 5695   0075
L_5696:
        SARC    R2,     1                       ; 5696   007A
        DECLE   $007F,  $0038,  $003F,  $003C   ; 5697   007F 0038 003F 003C
        DECLE   $0038,  $003F,  $003C,  $00BF   ; 569B   0038 003F 003C 00BF
        DECLE   $00BC,  $00FC,  $0068,  $0030   ; 569F   00BC 00FC 0068 0030
        DECLE   $007E,  $007F,  $00FF           ; 56A3   007E 007F 00FF

        ADDR    R7,     R0                      ; 56A6   00F8
        ADDR    R7,     R4                      ; 56A7   00FC
        ADDR    R7,     R6                      ; 56A8   00FE
        ADDR    R7,     R6                      ; 56A9   00FE
        ADDR    R7,     R6                      ; 56AA   00FE
        ADDR    R7,     R6                      ; 56AB   00FE
        SARC    R2,     2                       ; 56AC   007E
        ADDR    R7,     R6                      ; 56AD   00FE
        ADDR    R7,     R4                      ; 56AE   00FC
        ADCR    R0                              ; 56AF   0028
        ADCR    R0                              ; 56B0   0028
        ADCR    R0                              ; 56B1   0028
        RSWD    R6                              ; 56B2   003E
        SARC    R3,     2                       ; 56B3   007F
        SAR     R0,     2                       ; 56B4   006C
        ADDR    R5,     R7                      ; 56B5   00EF

        DECLE   $00F8,  $00FC,  $00FE,  $00FE   ; 56B6   00F8 00FC 00FE 00FE
        DECLE   $00FE,  $00FE,  $007C,  $00FC   ; 56BA   00FE 00FE 007C 00FC
        DECLE   $00FC,  $0024,  $0036,  $0012   ; 56BE   00FC 0024 0036 0012
        DECLE   $0036,  $007F,  $006C,  $00EC   ; 56C2   0036 007F 006C 00EC
        DECLE   $00FE,  $00F9,  $00FC,  $00FE   ; 56C6   00FE 00F9 00FC 00FE
        DECLE   $00FE,  $00FE,  $007E,  $00FC   ; 56CA   00FE 00FE 007E 00FC
        DECLE   $00FC,  $0068,  $00D8,  $0090   ; 56CE   00FC 0068 00D8 0090
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56D2   0000 0000 0000 0000
        DECLE   $0000,  $0060,  $0060,  $00F0   ; 56D6   0000 0060 0060 00F0
        DECLE   $00BC,  $00FC,  $006C,  $0038   ; 56DA   00BC 00FC 006C 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0070   ; 56E2   0000 0000 0010 0070
        DECLE   $0060,  $00E0,  $00E8,  $00AC   ; 56E6   0060 00E0 00E8 00AC
        DECLE   $00F8,  $00FD,  $003D,  $003F   ; 56EA   00F8 00FD 003D 003F
        DECLE   $0075,  $0067,  $0044,  $0000   ; 56EE   0075 0067 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0078   ; 56F2   0000 0000 0000 0078
        DECLE   $00E0,  $00E8,  $00EC,  $00AC   ; 56F6   00E0 00E8 00EC 00AC
        DECLE   $00F8,  $0039,  $0039,  $003F   ; 56FA   00F8 0039 0039 003F
        DECLE   $007F,  $0077,  $005E,  $0000   ; 56FE   007F 0077 005E 0000
        DECLE   $0030,  $0060,  $0040,  $00C0   ; 5702   0030 0060 0040 00C0
        DECLE   $00C0,  $0060,  $0060,  $003C   ; 5706   00C0 0060 0060 003C
        DECLE   $003E,  $000B,  $000B,  $0019   ; 570A   003E 000B 000B 0019
        DECLE   $009B,  $00D2,  $0076,  $0000   ; 570E   009B 00D2 0076 0000
        DECLE   $0060,  $0067,  $00CD,  $0088   ; 5712   0060 0067 00CD 0088
        DECLE   $0088,  $00D8,  $00FC,  $007E   ; 5716   0088 00D8 00FC 007E
        DECLE   $001B,  $001B,  $0099,  $00B1   ; 571A   001B 001B 0099 00B1
        DECLE   $00F3,  $0042,  $000E,  $001C   ; 571E   00F3 0042 000E 001C
        DECLE   $0020,  $0067,  $004C,  $0048   ; 5722   0020 0067 004C 0048
        DECLE   $0068,  $002A,  $003F,  $001D   ; 5726   0068 002A 003F 001D
        DECLE   $0019,  $001C,  $00BC,  $00E4   ; 572A   0019 001C 00BC 00E4
        DECLE   $0044,  $000C,  $0018,  $0018   ; 572E   0044 000C 0018 0018
        DECLE   $0000,  $0002,  $0007,  $0025   ; 5732   0000 0002 0007 0025
        DECLE   $0065,  $004C,  $0078,  $000C   ; 5736   0065 004C 0078 000C
        DECLE   $006E,  $00DB,  $009D,  $00E3   ; 573A   006E 00DB 009D 00E3
        DECLE   $003B,  $00AA,  $00EC,  $0058   ; 573E   003B 00AA 00EC 0058
        DECLE   $0020,  $00B0,  $00F0,  $00F8   ; 5742   0020 00B0 00F0 00F8
        DECLE   $00F8,  $0078,  $0078,  $0078   ; 5746   00F8 0078 0078 0078
        DECLE   $0038,  $007F,  $00F6,  $00F8   ; 574A   0038 007F 00F6 00F8
        DECLE   $00FE,  $00A8,  $0028,  $003C   ; 574E   00FE 00A8 0028 003C
        DECLE   $0002,  $0086,  $00CE,  $00EE   ; 5752   0002 0086 00CE 00EE
        DECLE   $00FC,  $00FC,  $007C,  $0078   ; 5756   00FC 00FC 007C 0078
        DECLE   $0038,  $007F,  $00F6,  $00F8   ; 575A   0038 007F 00F6 00F8
        DECLE   $00FE,  $00A8,  $0028,  $003C   ; 575E   00FE 00A8 0028 003C
        DECLE   $0000,  $000C,  $006E,  $00FF   ; 5762   0000 000C 006E 00FF
        DECLE   $00DD,  $00BC,  $0038,  $0038   ; 5766   00DD 00BC 0038 0038
        DECLE   $0018,  $007F,  $00F6,  $00FE   ; 576A   0018 007F 00F6 00FE
        DECLE   $00FC,  $00A8,  $0028,  $0028   ; 576E   00FC 00A8 0028 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5772   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5776   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 577A   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 577E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5782   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5786   0000 0000 0018 003C
        DECLE   $003C,  $0018,  $0000,  $0000   ; 578A   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 578E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5792   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $003C,  $007E   ; 5796   0018 003C 003C 007E
        DECLE   $007E,  $003C,  $003C,  $0018   ; 579A   007E 003C 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 579E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 57A2   0000 0000 0000 0018
        DECLE   $003C,  $003C,  $007E,  $007E   ; 57A6   003C 003C 007E 007E
        DECLE   $007E,  $007E,  $003C,  $003C   ; 57AA   007E 007E 003C 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 57AE   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0044   ; 57B2   0000 0000 0010 0044
        DECLE   $0000,  $0029,  $0080,  $0012   ; 57B6   0000 0029 0080 0012
        DECLE   $0048,  $0001,  $0094,  $0000   ; 57BA   0048 0001 0094 0000
        DECLE   $0022,  $0008,  $0000,  $0000   ; 57BE   0022 0008 0000 0000

        COMR    R0                              ; 57C2   0018
        RSWD    R4                              ; 57C3   003C
        SLLC    R2,     1                       ; 57C4   005A
        SLLC    R2,     1                       ; 57C5   005A
        SARC    R2,     2                       ; 57C6   007E
        SARC    R2,     2                       ; 57C7   007E
        NEGR    R4                              ; 57C8   0024
        COMR    R0                              ; 57C9   0018
        SLLC    R2,     1                       ; 57CA   005A
        ADDR    R0,     R3                      ; 57CB   00C3
        SLR     R2,     2                       ; 57CC   0066
        RSWD    R4                              ; 57CD   003C
        COMR    R0                              ; 57CE   0018
        RSWD    R4                              ; 57CF   003C
        ADDR    R4,     R7                      ; 57D0   00E7

        SWAP    R2,     1                       ; 57D1   0042
        DIS                                     ; 57D2   0003
        INCR    R7                              ; 57D3   000F

        INCR    R1                              ; 57D4   0009
L_57D5:
        INCR    R5                              ; 57D5   000D
        COMR    R5                              ; 57D6   001D
        DECR    R4                              ; 57D7   0014
L_57D8:
        DECR    R7                              ; 57D8   0017

        DECLE   $0034,  $003E,  $0068,  $006F   ; 57D9   0034 003E 0068 006F
        DECLE   $0040,  $007F,  $0071,  $0040   ; 57DD   0040 007F 0071 0040
        DECLE   $0000,  $00C0,  $00E0,  $00F8   ; 57E1   0000 00C0 00E0 00F8
        DECLE   $001F                           ; 57E5   001F

        SARC    R2,     2                       ; 57E6   007E
        NEGR    R3                              ; 57E7   0023
        MOVR    R7,     R0                      ; 57E8   00B8
        TSTR    R3                              ; 57E9   009B
        ADDR    R2,     R2                      ; 57EA   00D2
        SLLC    R3,     1                       ; 57EB   005B
        ADDR    R6,     R0                      ; 57EC   00F0
        ADDR    R3,     R7                      ; 57ED   00DF

        DECLE   $0099,  $00CD,  $007F,  $001E   ; 57EE   0099 00CD 007F 001E
        DECLE   $0006,  $003E,  $0062,  $00FA   ; 57F2   0006 003E 0062 00FA
        DECLE   $0006,  $00EC,  $004C,  $00FC   ; 57F6   0006 00EC 004C 00FC
        DECLE   $0018,  $00D8,  $00D0,  $00F0   ; 57FA   0018 00D8 00D0 00F0
        DECLE   $00E0,  $00C0,  $0000,  $0000   ; 57FE   00E0 00C0 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0002   ; 5802   0000 0000 0006 0002
        DECLE   $0002,  $000B,  $0008,  $000B   ; 5806   0002 000B 0008 000B
        DECLE   $0001                           ; 580A   0001
L_580B:
        DECR    R7                              ; 580B   0017

        DECLE   $0010,  $003F,  $0000,  $0000   ; 580C   0010 003F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5810   0000 0000 0000 0000
        DECLE   $0000                           ; 5814   0000

        ADDR    R4,     R0                      ; 5815   00E0
        MOVR    R0,     R1                      ; 5816   0081
        ADDR    R3,     R4                      ; 5817   00DC
        SWAP    R3,     2                       ; 5818   0047
        SLR     R0,     2                       ; 5819   0064
        ADCR    R5                              ; 581A   002D
        TSTR    R4                              ; 581B   00A4
        INCR    R7                              ; 581C   000F

        NEGR    R0                              ; 581D   0020
L_581E:
        SLR     R2,     2                       ; 581E   0066
        DECLE   $0032,  $0000,  $0000,  $0000   ; 581F   0032 0000 0000 0000
        DECLE   $0000,  $001C,  $0004,  $00F8   ; 5823   0000 001C 0004 00F8
        DECLE   $0010,  $00B0,  $0000,  $00E0   ; 5827   0010 00B0 0000 00E0
        DECLE   $0020,  $0020,  $0000,  $0000   ; 582B   0020 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 582F   0000 0000 0000 0001
        DECLE   $0003,  $0007,  $0000           ; 5833   0003 0007 0000

        DIS                                     ; 5836   0003
        DIS                                     ; 5837   0003
        GSWD    R1                              ; 5838   0031
        SARC    R0,     1                       ; 5839   0078
        TSTR    R1                              ; 583A   0089
        MOVR    R1,     R3                      ; 583B   008B
        MOVR    R1,     R7                      ; 583C   008F
        MOVR    R0,     R7                      ; 583D   0087

        DECLE   $0080,  $0027,  $0027           ; 583E   0080 0027 0027
L_5841:
        DECR    R7                              ; 5841   0017

        DECLE   $0080,  $00C0,  $00E0,  $0000   ; 5842   0080 00C0 00E0 0000
        DECLE   $00C3,  $00C6,  $0086,  $000C   ; 5846   00C3 00C6 0086 000C
        DECLE   $008C,  $00DC,  $00F8,  $00F0   ; 584A   008C 00DC 00F8 00F0
        DECLE   $0010,  $00F0,  $00E0,  $00E0   ; 584E   0010 00F0 00E0 00E0
        DECLE   $0000,  $00FE,  $00FC,  $003C   ; 5852   0000 00FE 00FC 003C
        DECLE   $0000,  $001C,  $001E,  $003F   ; 5856   0000 001C 001E 003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; 5862   0000 0000 0000 000F
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5866   0000 0000 0000 0003
        DECLE   $0010,  $0010,  $0000,  $0000   ; 586A   0010 0010 0000 0000
        DECLE   $0007,  $0040,  $0000,  $0020   ; 586E   0007 0040 0000 0020
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 5872   0000 0000 0000 00F0
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5876   0000 0000 0000 00C0
        DECLE   $0000,  $0000,  $0004,  $000C   ; 587A   0000 0000 0004 000C
        DECLE   $00E8,  $0000,  $0000,  $0000   ; 587E   00E8 0000 0000 0000
        DECLE   $00BF,  $0080,  $0080,  $0000   ; 5882   00BF 0080 0080 0000
        DECLE   $001E,  $0010,  $0030,  $0060   ; 5886   001E 0010 0030 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588E   0000 0000 0000 0000
        DECLE   $001C,  $0022,  $0047,  $0048   ; 5892   001C 0022 0047 0048
        DECLE   $0090,  $00A0,  $00C0,  $0082   ; 5896   0090 00A0 00C0 0082
        DECLE   $0048,  $0064,  $0051,  $0048   ; 589A   0048 0064 0051 0048
        DECLE   $0047,  $0044,  $0044,  $0044   ; 589E   0047 0044 0044 0044
        DECLE   $0002,  $0001,  $00FF,  $0002   ; 58A2   0002 0001 00FF 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; 58A6   0004 0008 0010 0020
        DECLE   $0010,  $0088,  $0024,  $0002   ; 58AA   0010 0088 0024 0002
        DECLE   $00FF,  $0001,  $0071,  $0051   ; 58AE   00FF 0001 0071 0051
        DECLE   $0044,  $0044,  $0044,  $0044   ; 58B2   0044 0044 0044 0044
        DECLE   $0024,  $0014,  $000C,  $0007   ; 58B6   0024 0014 000C 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BE   0000 0000 0000 0000
        DECLE   $0071,  $0021,  $0021,  $0071   ; 58C2   0071 0021 0021 0071
        DECLE   $0071,  $00F9,  $0001,  $00FF   ; 58C6   0071 00F9 0001 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58CA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58CE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 58D6   0000 0000 0000 0020
        DECLE   $0002,  $0090,  $0020,  $000A   ; 58DA   0002 0090 0020 000A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58DE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58E6   0000 0000 0000 0000
        DECLE   $0050,  $0004,  $0088,  $0021   ; 58EA   0050 0004 0088 0021
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EE   0000 0000 0000 0000
        DECLE   $0003,  $0000,  $000F,  $0001   ; 58F2   0003 0000 000F 0001
        DECLE   $001F,  $0000,  $0030,  $0000   ; 58F6   001F 0000 0030 0000
        DECLE   $0070,  $0000,  $00F0,  $0000   ; 58FA   0070 0000 00F0 0000
        DECLE   $0030,  $0000,  $0018,  $0000   ; 58FE   0030 0000 0018 0000
        DECLE   $00C0,  $0080,  $00F0,  $0000   ; 5902   00C0 0080 00F0 0000
        DECLE   $00F8,  $0080,  $000C,  $0000   ; 5906   00F8 0080 000C 0000
        DECLE   $000E,  $0000,  $000F,  $0000   ; 590A   000E 0000 000F 0000
        DECLE   $000C,  $0000,  $0018,  $0000   ; 590E   000C 0000 0018 0000
        DECLE   $0081,  $0000,  $00C3,  $002C   ; 5912   0081 0000 00C3 002C
        DECLE   $00F7,  $0018,  $003C,  $0000   ; 5916   00F7 0018 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591E   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0000,  $000E   ; 5922   0000 0007 0000 000E
        DECLE   $0000,  $001F                   ; 5926   0000 001F

        INCR    R7                              ; 5928   000F

        RSWD    R1                              ; 5929   0039
L_592A:
        INCR    R1                              ; 592A   0009
        DECLE   $00FF,  $000E,  $007E,  $000C   ; 592B   00FF 000E 007E 000C
        DECLE   $001E,  $0007,  $001E,  $0000   ; 592F   001E 0007 001E 0000
        DECLE   $0060,  $0000,  $00F0,  $0000   ; 5933   0060 0000 00F0 0000
        DECLE   $0078,  $00F0,  $009C,  $0090   ; 5937   0078 00F0 009C 0090
        DECLE   $00FF,  $0070,  $007E,  $0030   ; 593B   00FF 0070 007E 0030
        DECLE   $0078,  $00E0,  $0078,  $0066   ; 593F   0078 00E0 0078 0066
        DECLE   $00DB,  $0024,  $00D3,  $0008   ; 5943   00DB 0024 00D3 0008
        DECLE   $0066,  $0000,  $0000,  $0000   ; 5947   0066 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594F   0000 0000 0000 0000
        DECLE   $0008,  $0008,  $005A,  $0000   ; 5953   0008 0008 005A 0000
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5957   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0043   ; 595F   0000 0000 0000 0043
        DECLE   $0018,  $00D2,  $0059,  $0000   ; 5963   0018 00D2 0059 0000
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5967   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0055   ; 596F   0000 0000 0000 0055
        DECLE   $0018,  $00ED,  $0059,  $0000   ; 5973   0018 00ED 0059 0000
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5977   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 597B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 597F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5983   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5987   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 598B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 598F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5993   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5997   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 599B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 599F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59AB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59AF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59B7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59BF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59CB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59CF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 59D3   0000 0000 0000 0004
        DECLE   $0000,  $0001,  $00CB,  $0067   ; 59D7   0000 0001 00CB 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59DB   0000 0000 0000 0000
        DECLE   $0004,  $0008,  $0001,  $00CB   ; 59DF   0004 0008 0001 00CB
        DECLE   $0067,  $0000,  $0000,  $0000   ; 59E3   0067 0000 0000 0000
        DECLE   $0000,  $0004,  $0010,  $0001   ; 59E7   0000 0004 0010 0001
        DECLE   $00CB,  $0067,  $0000,  $0000   ; 59EB   00CB 0067 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0018   ; 59EF   0000 0000 0004 0018
        DECLE   $0001,  $00CB,  $0067,  $0000   ; 59F3   0001 00CB 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 59F7   0000 0000 0000 0004
        DECLE   $0020,  $0001,  $00CB,  $0067   ; 59FB   0020 0001 00CB 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59FF   0000 0000 0000 0000
        DECLE   $0004,  $0028,  $0001,  $00CB   ; 5A03   0004 0028 0001 00CB
        DECLE   $0067,  $0000,  $0000,  $0000   ; 5A07   0067 0000 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0000   ; 5A0B   0000 0000 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A0F   0000 0000 0000 0000
        DECLE   $0004,  $0058,  $0000,  $0000   ; 5A13   0004 0058 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A17   0000 0000 0000 0000
        DECLE   $0060,  $0000,  $0000,  $0000   ; 5A1B   0060 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0062   ; 5A1F   0000 0000 0000 0062
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5A23   0000 0000 0000 0001
        DECLE   $0061,  $0003,  $0032,  $0006   ; 5A27   0061 0003 0032 0006
        DECLE   $00DA,  $0161,  $02DA,  $0061   ; 5A2B   00DA 0161 02DA 0061
        DECLE   $0000,  $0000,  $0001,  $0061   ; 5A2F   0000 0000 0001 0061
        DECLE   $0003,  $003E,  $0006,  $00DA   ; 5A33   0003 003E 0006 00DA
        DECLE   $0161,  $02DA,  $0061,  $0000   ; 5A37   0161 02DA 0061 0000
        DECLE   $0000,  $0001,  $0061,  $0003   ; 5A3B   0000 0001 0061 0003
        DECLE   $0038,  $0006,  $00DA,  $0161   ; 5A3F   0038 0006 00DA 0161
        DECLE   $02DA,  $0061,  $0000,  $0000   ; 5A43   02DA 0061 0000 0000
        DECLE   $0001,  $0061,  $0003,  $0052   ; 5A47   0001 0061 0003 0052
        DECLE   $0006,  $00DA,  $0161,  $02DA   ; 5A4B   0006 00DA 0161 02DA
        DECLE   $0061,  $0000,  $0000,  $0001   ; 5A4F   0061 0000 0000 0001
        DECLE   $0061,  $0003,  $0044,  $0006   ; 5A53   0061 0003 0044 0006
        DECLE   $00DA,  $0161,  $02DA,  $0061   ; 5A57   00DA 0161 02DA 0061
        DECLE   $0000,  $0000,  $0001,  $0061   ; 5A5B   0000 0000 0001 0061
        DECLE   $0004,  $004A,  $0006,  $00DA   ; 5A5F   0004 004A 0006 00DA
        DECLE   $0161,  $02DA,  $0061,  $0000   ; 5A63   0161 02DA 0061 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A67   0000 0000 0000 0000
        DECLE   $0064,  $0000,  $0000,  $0000   ; 5A6B   0064 0000 0000 0000
        DECLE   $0000,  $0000,  $0066,  $0000   ; 5A6F   0000 0000 0066 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A73   0000 0000 0000 0000
        DECLE   $0068,  $0000,  $0000,  $0000   ; 5A77   0068 0000 0000 0000
        DECLE   $0000,  $0000,  $006A,  $0000   ; 5A7B   0000 0000 006A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A7F   0000 0000 0000 0000
        DECLE   $006C,  $0000,  $0000,  $0000   ; 5A83   006C 0000 0000 0000
        DECLE   $0000,  $0000,  $006E,  $0000   ; 5A87   0000 0000 006E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A8B   0000 0000 0000 0000
        DECLE   $0070,  $0000,  $0000,  $0000   ; 5A8F   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $0072,  $0000   ; 5A93   0000 0000 0072 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A97   0000 0000 0000 0000
        DECLE   $0074,  $0000,  $0000,  $0000   ; 5A9B   0074 0000 0000 0000
        DECLE   $0000,  $0000,  $0076,  $0000   ; 5A9F   0000 0000 0076 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AA3   0000 0000 0000 0000
        DECLE   $0078,  $0000,  $0000,  $0000   ; 5AA7   0078 0000 0000 0000
        DECLE   $0000,  $0000,  $007A,  $0000   ; 5AAB   0000 0000 007A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AAF   0000 0000 0000 0000
        DECLE   $007C,  $0000,  $0000,  $0000   ; 5AB3   007C 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $0000   ; 5AB7   0000 0000 007E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ABB   0000 0000 0000 0000
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5ABF   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0082,  $0000   ; 5AC3   0000 0000 0082 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AC7   0000 0000 0000 0000
        DECLE   $0084,  $0000,  $0000,  $0000   ; 5ACB   0084 0000 0000 0000
        DECLE   $0000,  $0000,  $0086,  $0000   ; 5ACF   0000 0000 0086 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AD3   0000 0000 0000 0000
        DECLE   $0088,  $0000,  $0000,  $0000   ; 5AD7   0088 0000 0000 0000
        DECLE   $0000,  $0000,  $008A,  $0000   ; 5ADB   0000 0000 008A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADF   0000 0000 0000 0000
        DECLE   $008C,  $0000,  $0000,  $0000   ; 5AE3   008C 0000 0000 0000
        DECLE   $0000,  $0000,  $008E,  $0000   ; 5AE7   0000 0000 008E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AEB   0000 0000 0000 0000
        DECLE   $0090,  $0000,  $0000,  $0000   ; 5AEF   0090 0000 0000 0000
        DECLE   $0000,  $0000,  $0092,  $0000   ; 5AF3   0000 0000 0092 0000

        SWAP    R2,     1                       ; 5AF7   0042
        MOVR    R1,     R0                      ; 5AF8   0088
        RLC     R0,     1                       ; 5AF9   0050
        SWAP    R2,     1                       ; 5AFA   0042
        MOVR    R2,     R0                      ; 5AFB   0090
        RLC     R0,     1                       ; 5AFC   0050
        SWAP    R2,     1                       ; 5AFD   0042
        MOVR    R3,     R0                      ; 5AFE   0098
        RLC     R0,     1                       ; 5AFF   0050
        SWAP    R2,     2                       ; 5B00   0046
        MOVR    R1,     R0                      ; 5B01   0088
        RLC     R0,     1                       ; 5B02   0050
        SWAP    R2,     2                       ; 5B03   0046
        MOVR    R2,     R0                      ; 5B04   0090
        RLC     R0,     1                       ; 5B05   0050
        SWAP    R2,     2                       ; 5B06   0046
        MOVR    R3,     R0                      ; 5B07   0098
        RLC     R0,     1                       ; 5B08   0050
        RLC     R3,     1                       ; 5B09   0053
        MOVR    R1,     R4                      ; 5B0A   008C
        SLL     R2,     2                       ; 5B0B   004E
        RLC     R3,     1                       ; 5B0C   0053
        MOVR    R2,     R4                      ; 5B0D   0094
        SLL     R2,     2                       ; 5B0E   004E
        RLC     R3,     1                       ; 5B0F   0053
        MOVR    R2,     R0                      ; 5B10   0090
        RLC     R2,     2                       ; 5B11   0056
        SWAP    R1,     1                       ; 5B12   0041
        MOVR    R1,     R4                      ; 5B13   008C
        SLL     R2,     2                       ; 5B14   004E
        SWAP    R1,     1                       ; 5B15   0041
        MOVR    R2,     R4                      ; 5B16   0094
        SLL     R2,     2                       ; 5B17   004E
        SWAP    R1,     1                       ; 5B18   0041
        MOVR    R1,     R7                      ; 5B19   008F

        RLC     R2,     2                       ; 5B1A   0056
        SWAP    R2,     2                       ; 5B1B   0046
        MOVR    R1,     R4                      ; 5B1C   008C
        SLL     R2,     2                       ; 5B1D   004E
        SWAP    R2,     2                       ; 5B1E   0046
        MOVR    R2,     R4                      ; 5B1F   0094
        SLL     R2,     2                       ; 5B20   004E
        SWAP    R2,     2                       ; 5B21   0046
        MOVR    R1,     R4                      ; 5B22   008C
        RLC     R2,     2                       ; 5B23   0056
        SWAP    R2,     2                       ; 5B24   0046
        MOVR    R2,     R4                      ; 5B25   0094
        RLC     R2,     2                       ; 5B26   0056
        SWAP    R1,     2                       ; 5B27   0045
        MOVR    R1,     R7                      ; 5B28   008F

        DECLE   $004E,  $0055,  $0090,  $004E   ; 5B29   004E 0055 0090 004E
        DECLE   $0041,  $008C,  $004E,  $0041   ; 5B2D   0041 008C 004E 0041
        DECLE   $0094,  $004E,  $0041,  $0090   ; 5B31   0094 004E 0041 0090
        DECLE   $0056,  $0046,  $008C,  $004E   ; 5B35   0056 0046 008C 004E
        DECLE   $0046,  $0094,  $004E,  $0046   ; 5B39   0046 0094 004E 0046
        DECLE   $0090,  $0056,  $0022,  $0039   ; 5B3D   0090 0056 0022 0039
        DECLE   $0000,  $0025,  $0024,  $0000   ; 5B41   0000 0025 0024 0000
        DECLE   $0033,  $0023,  $0028,  $002E   ; 5B45   0033 0023 0028 002E
        DECLE   $0025,  $0029,  $0024,  $0025   ; 5B49   0025 0029 0024 0025
        DECLE   $0032,  $0000,  $0021,  $002E   ; 5B4D   0032 0000 0021 002E
        DECLE   $0024,  $0000,  $0024,  $0021   ; 5B51   0024 0000 0024 0021
        DECLE   $002E,  $0000,  $002B,  $0032   ; 5B55   002E 0000 002B 0032
        DECLE   $0029,  $0034,  $0023,  $0028   ; 5B59   0029 0034 0023 0028
        DECLE   $0025,  $0036,  $0033,  $002B   ; 5B5D   0025 0036 0033 002B
        DECLE   $0039,  $0000,  $0000,  $03FF   ; 5B61   0039 0000 0000 03FF
        DECLE   $0380,  $0380,  $03BF           ; 5B65   0380 0380 03BF

        AND@    R1,     R0                      ; 5B68   0388
        AND@    R5,     R2                      ; 5B69   03AA
        MOVR    R4,     R2                      ; 5B6A   00A2
        ANDR    R0,     R2                      ; 5B6B   0182
        XORR    R5,     R0                      ; 5B6C   01E8
        SLR     R2,     1                       ; 5B6D   0062
        SUBR    R6,     R6                      ; 5B6E   0136
        MOVR    R7,     R4                      ; 5B6F   00BC
        SUBR    R7,     R6                      ; 5B70   013E
        CMPR    R7,     R6                      ; 5B71   017E
        INCR    R6                              ; 5B72   000E
        MVI@    R5,     R7                      ; 5B73   02AF

        DECLE   $0281,  $02DB,  $0380,  $03AE   ; 5B74   0281 02DB 0380 03AE
        DECLE   $0326,  $03F0,  $021E           ; 5B78   0326 03F0 021E

        ADD     G_02F2, R2                      ; 5B7B   02C2 02F2
        ADD@    R6,     R0                      ; 5B7D   02F0
        SLR     R2,     1                       ; 5B7E   0062
        SARC    R2,     1                       ; 5B7F   007A
        SWAP    R0,     1                       ; 5B80   0040
        ADDI    #$02FF, R7                      ; 5B81   02FF 02FF
        ADDI    #$02FF, R7                      ; 5B83   02FF 02FF
        INCR    R7                              ; 5B85   000F

        DECLE   $01EF                           ; 5B86   01EF
L_5B87:
        SUBR    R0,     R0                      ; 5B87   0100
        DECLE   $006E,  $0146,  $0110,  $0155   ; 5B88   006E 0146 0110 0155
        DECLE   $025C,  $0351,  $0054,  $0176   ; 5B8C   025C 0351 0054 0176
        DECLE   $0110,  $01BA,  $010A,  $011E   ; 5B90   0110 01BA 010A 011E
        DECLE   $0002,  $032B,  $0000           ; 5B94   0002 032B 0000

        XORR    R2,     R6                      ; 5B97   01D6
        ADDR    R6,     R4                      ; 5B98   00F4
        ANDR    R6,     R6                      ; 5B99   01B6
        GSWD    R0                              ; 5B9A   0030
        CMP     G_0070, R6                      ; 5B9B   0346 0070
        CLRR    R3                              ; 5B9D   01DB
        SUBR    R0,     R1                      ; 5B9E   0101
        CMP@    R3,     R5                      ; 5B9F   035D
        SWAP    R0,     1                       ; 5BA0   0040
        ADD@    R6,     R5                      ; 5BA1   02F5
        MVO     R4,     G_035F                  ; 5BA2   0244 035F
        B       L_5F9C                          ; 5BA4   0200 03F6

        DECLE   $03FE,  $03FE,  $0000,  $0000   ; 5BA6   03FE 03FE 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB2   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5BB6   0000 0000

        ADD     .BTAB.C0,R0                     ; 5BB8   02C0 02C0
        SARC    R3,     2                       ; 5BBA   007F
        SARC    R3,     2                       ; 5BBB   007F
        SARC    R3,     2                       ; 5BBC   007F
        ADDI    #$02FF, R7                      ; 5BBD   02FF 02FF
        ADDI    #$02FF, R7                      ; 5BBF   02FF 02FF

        DECLE   $0000                           ; 5BC1   0000

        XORI    #$0002, R6                      ; 5BC2   03FE 0002
        ANDR    R6,     R6                      ; 5BC4   01B6
        MOVR    R0,     R4                      ; 5BC5   0084
        ANDR    R6,     R6                      ; 5BC6   01B6
        EIS                                     ; 5BC7   0002
        CMPR    R5,     R2                      ; 5BC8   016A
        SUBR    R7,     R6                      ; 5BC9   013E
        XORR    R7,     R6                      ; 5BCA   01FE
        EIS                                     ; 5BCB   0002
        XORI    #$0018, R2                      ; 5BCC   03FA 0018
        CMPR    R0,     R0                      ; 5BCE   0140
        CMPR    R0,     R0                      ; 5BCF   0140
        MOVR    R1,     R7                      ; 5BD0   008F

        DECLE   $0015,  $01F0,  $0000,  $0020   ; 5BD1   0015 01F0 0000 0020
        DECLE   $0000,  $03DC,  $0070,  $0000   ; 5BD5   0000 03DC 0070 0000
        DECLE   $02A8,  $00F8,  $03F8,  $0054   ; 5BD9   02A8 00F8 03F8 0054
        DECLE   $0344,  $0212,  $02BA,  $0010   ; 5BDD   0344 0212 02BA 0010
        DECLE   $01B6,  $0101,  $016F,  $0108   ; 5BE1   01B6 0101 016F 0108
        DECLE   $01FA,  $0022,  $0101,  $0351   ; 5BE5   01FA 0022 0101 0351
        DECLE   $0371,  $0301,  $0007,  $0380   ; 5BE9   0371 0301 0007 0380
        DECLE   $0200,  $02DC,  $0201,  $03F3   ; 5BED   0200 02DC 0201 03F3
        DECLE   $0219,  $02D3,  $02C3,  $02C0   ; 5BF1   0219 02D3 02C3 02C0
        DECLE   $02CE,  $0042,  $0058,  $004D   ; 5BF5   02CE 0042 0058 004D
        DECLE   $02FF,  $02FF,  $02FF,  $02FF   ; 5BF9   02FF 02FF 02FF 02FF
        DECLE   $02FF,  $0220,  $02AA,  $02AC   ; 5BFD   02FF 0220 02AA 02AC
        DECLE   $0201,  $00DC,  $0255,  $0001   ; 5C01   0201 00DC 0255 0001
        DECLE   $01D7,  $01F7,  $0071,  $037B   ; 5C05   01D7 01F7 0071 037B
        DECLE   $0009,  $02EB,  $0028,  $018E   ; 5C09   0009 02EB 0028 018E
        DECLE   $00E3,  $03AB,  $0208,  $02BE   ; 5C0D   00E3 03AB 0208 02BE
        DECLE   $0088,  $01EB,  $0080,  $02BF   ; 5C11   0088 01EB 0080 02BF
        DECLE   $0000                           ; 5C15   0000

        XORR    R3,     R6                      ; 5C16   01DE
        NOP                                     ; 5C17   0034
        RRC     R2,     2                       ; 5C18   0076
        SUBR    R0,     R0                      ; 5C19   0100
        XORR    R3,     R5                      ; 5C1A   01DD
        B       L_6013                          ; 5C1B   0200 03F6

        DECLE   $0286,  $02BE,  $0200,  $02EF   ; 5C1D   0286 02BE 0200 02EF
        DECLE   $027D,  $0200,  $0222,  $0222   ; 5C21   027D 0200 0222 0222
        DECLE   $0203,  $0201,  $00EC,  $03BD   ; 5C25   0203 0201 00EC 03BD
        DECLE   $0001,  $0377,  $0300,  $03EE   ; 5C29   0001 0377 0300 03EE
        DECLE   $0230,  $02B7,  $02B0,  $028E   ; 5C2D   0230 02B7 02B0 028E
        DECLE   $02EE,  $02C0,  $0072,  $0062   ; 5C31   02EE 02C0 0072 0062
        DECLE   $0000,  $03FF,  $0000,  $0000   ; 5C35   0000 03FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C39   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5C3D   0000 0001 0000 0000
        DECLE   $0000,  $0004,  $0007,  $0000   ; 5C41   0000 0004 0007 0000
        DECLE   $0000,  $000C,  $0000,  $000F   ; 5C45   0000 000C 0000 000F
        DECLE   $0012,  $0000,  $0000,  $0015   ; 5C49   0012 0000 0000 0015
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C4D   0000 0000 0000 0000
        DECLE   $0018,  $001B,  $0024,  $002B   ; 5C51   0018 001B 0024 002B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0034,  $0039   ; 5C5D   0000 0000 0034 0039
        DECLE   $0000,  $003E,  $0000,  $0000   ; 5C61   0000 003E 0000 0000
        DECLE   $0000,  $0041,  $0000,  $0046   ; 5C65   0000 0041 0000 0046
        DECLE   $0000,  $0000,  $0049,  $004C   ; 5C69   0000 0000 0049 004C
        DECLE   $0000,  $0000,  $0051,  $0000   ; 5C6D   0000 0000 0051 0000
        DECLE   $0054,  $0057,  $0000,  $005A   ; 5C71   0054 0057 0000 005A
        DECLE   $0000,  $005F,  $0000,  $0062   ; 5C75   0000 005F 0000 0062
        DECLE   $0000,  $0065,  $0000,  $0000   ; 5C79   0000 0065 0000 0000
        DECLE   $0000,  $0000,  $0068,  $0000   ; 5C7D   0000 0000 0068 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C85   0000 0000 0000 0000
        DECLE   $006B,  $0000,  $0000,  $0000   ; 5C89   006B 0000 0000 0000
        DECLE   $006E,  $0071,  $0078,  $007F   ; 5C8D   006E 0071 0078 007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C95   0000 0000 0000 0000
        DECLE   $0086,  $0000,  $0000,  $008B   ; 5C99   0086 0000 0000 008B
        DECLE   $0090,  $0000,  $0000,  $0000   ; 5C9D   0090 0000 0000 0000
        DECLE   $0000,  $0000,  $0093,  $0000   ; 5CA1   0000 0000 0093 0000
        DECLE   $0096,  $0000,  $0000,  $0000   ; 5CA5   0096 0000 0000 0000
        DECLE   $0000,  $0099,  $0000,  $0000   ; 5CA9   0000 0099 0000 0000
        DECLE   $0000,  $009C,  $0000,  $009F   ; 5CAD   0000 009C 0000 009F
        DECLE   $0000,  $0000,  $0000,  $00A2   ; 5CB1   0000 0000 0000 00A2
        DECLE   $0000,  $00A5,  $0000,  $0000   ; 5CB5   0000 00A5 0000 0000
        DECLE   $0000,  $00A8,  $0000,  $00AB   ; 5CB9   0000 00A8 0000 00AB
        DECLE   $0000,  $0000,  $00AE,  $0000   ; 5CBD   0000 0000 00AE 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC1   0000 0000 0000 0000
        DECLE   $00B1,  $0000,  $0000,  $00B4   ; 5CC5   00B1 0000 0000 00B4
        DECLE   $00B7,  $00BA,  $00C1,  $00C8   ; 5CC9   00B7 00BA 00C1 00C8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00D3,  $0000   ; 5CD1   0000 0000 00D3 0000
        DECLE   $0000,  $00D6,  $00DB,  $0000   ; 5CD5   0000 00D6 00DB 0000
        DECLE   $00DE,  $0000,  $0000,  $0000   ; 5CD9   00DE 0000 0000 0000
        DECLE   $00E1,  $0000,  $0000,  $00E6   ; 5CDD   00E1 0000 0000 00E6
        DECLE   $00E9,  $00EC,  $0000,  $0000   ; 5CE1   00E9 00EC 0000 0000
        DECLE   $0000,  $0000,  $00EF,  $0000   ; 5CE5   0000 0000 00EF 0000
        DECLE   $0000,  $0000,  $00F2,  $0000   ; 5CE9   0000 0000 00F2 0000
        DECLE   $0000,  $00F9,  $0000,  $0000   ; 5CED   0000 00F9 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF1   0000 0000 0000 0000
        DECLE   $00FC,  $0000,  $0000,  $00FF   ; 5CF5   00FC 0000 0000 00FF
        DECLE   $0000,  $0000,  $0102,  $0000   ; 5CF9   0000 0000 0102 0000
        DECLE   $0109,  $0000,  $0000,  $0000   ; 5CFD   0109 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D01   0000 0000 0000 0000

        SUBR    R1,     R4                      ; 5D05   010C
        SUBR    R1,     R7                      ; 5D06   010F

        DECLE   $0114,  $011B,  $0122,  $0000   ; 5D07   0114 011B 0122 0000
        DECLE   $010C,  $00A0,  $0000,  $0152   ; 5D0B   010C 00A0 0000 0152
        DECLE   $003C,  $0000,  $002E,  $0014   ; 5D0F   003C 0000 002E 0014
        DECLE   $002E,  $00A0,  $0000,  $001E   ; 5D13   002E 00A0 0000 001E
        DECLE   $0000,  $0000,  $015A,  $0014   ; 5D17   0000 0000 015A 0014
        DECLE   $0000,  $0135,  $00A0,  $0000   ; 5D1B   0000 0135 00A0 0000
        DECLE   $0012,  $008C,  $0000,  $0025   ; 5D1F   0012 008C 0000 0025
        DECLE   $00A0,  $0000,  $016A,  $0050   ; 5D23   00A0 0000 016A 0050
        DECLE   $0076,  $008C,  $007E,  $00A0   ; 5D27   0076 008C 007E 00A0
        DECLE   $0086,  $00B4,  $0000,  $008E   ; 5D2B   0086 00B4 0000 008E
        DECLE   $008C,  $0096,  $00A0,  $009E   ; 5D2F   008C 0096 00A0 009E
        DECLE   $00B4,  $0000,  $0012,  $0064   ; 5D33   00B4 0000 0012 0064
        DECLE   $00A6,  $008C,  $00AE,  $00A0   ; 5D37   00A6 008C 00AE 00A0
        DECLE   $00B6,  $00B4,  $0000,  $0152   ; 5D3B   00B6 00B4 0000 0152
        DECLE   $003C,  $0135,  $00B4,  $0000   ; 5D3F   003C 0135 00B4 0000
        DECLE   $002E,  $0000,  $002E,  $00A0   ; 5D43   002E 0000 002E 00A0
        DECLE   $0000,  $0012,  $0064,  $0000   ; 5D47   0000 0012 0064 0000
        DECLE   $010C,  $0028,  $015A,  $0050   ; 5D4B   010C 0028 015A 0050
        DECLE   $0000,  $001E,  $0000,  $0000   ; 5D4F   0000 001E 0000 0000
        DECLE   $0152,  $0064,  $0000,  $002E   ; 5D53   0152 0064 0000 002E
        DECLE   $0014,  $002E,  $00A0,  $0000   ; 5D57   0014 002E 00A0 0000
        DECLE   $0012,  $0064,  $0000,  $0162   ; 5D5B   0012 0064 0000 0162
        DECLE   $0064,  $0000,  $001E,  $00B4   ; 5D5F   0064 0000 001E 00B4
        DECLE   $0000,  $002E,  $0000,  $002E   ; 5D63   0000 002E 0000 002E
        DECLE   $00B4,  $0000,  $0012,  $0000   ; 5D67   00B4 0000 0012 0000
        DECLE   $0000,  $016A,  $00A0,  $0000   ; 5D6B   0000 016A 00A0 0000
        DECLE   $0025,  $0000,  $0000,  $0012   ; 5D6F   0025 0000 0000 0012
        DECLE   $0064,  $0000,  $010C,  $0014   ; 5D73   0064 0000 010C 0014
        DECLE   $0000,  $0025,  $00A0,  $0000   ; 5D77   0000 0025 00A0 0000
        DECLE   $0076,  $008C,  $007E,  $00A0   ; 5D7B   0076 008C 007E 00A0
        DECLE   $0086,  $00B4,  $0000,  $008E   ; 5D7F   0086 00B4 0000 008E
        DECLE   $008C,  $0096,  $00A0,  $009E   ; 5D83   008C 0096 00A0 009E
        DECLE   $00B4,  $0000,  $00A6,  $008C   ; 5D87   00B4 0000 00A6 008C
        DECLE   $00AE,  $00A0,  $00B6,  $00B4   ; 5D8B   00AE 00A0 00B6 00B4
        DECLE   $0000,  $002E,  $0014,  $002E   ; 5D8F   0000 002E 0014 002E
        DECLE   $00A0,  $0000,  $001E,  $0028   ; 5D93   00A0 0000 001E 0028
        DECLE   $0152,  $0050,  $0000,  $0012   ; 5D97   0152 0050 0000 0012
        DECLE   $0078,  $0000,  $001E,  $008C   ; 5D9B   0078 0000 001E 008C
        DECLE   $0000,  $0162,  $0014,  $0000   ; 5D9F   0000 0162 0014 0000
        DECLE   $0152,  $0064,  $0000,  $0012   ; 5DA3   0152 0064 0000 0012
        DECLE   $00B4,  $0000,  $0012,  $00B4   ; 5DA7   00B4 0000 0012 00B4
        DECLE   $0000,  $015A,  $0064,  $0000   ; 5DAB   0000 015A 0064 0000
        DECLE   $010C,  $0014,  $0000,  $0135   ; 5DAF   010C 0014 0000 0135
        DECLE   $0000,  $0000,  $0152,  $0064   ; 5DB3   0000 0000 0152 0064
        DECLE   $0000,  $0012,  $00B4,  $0000   ; 5DB7   0000 0012 00B4 0000
        DECLE   $015A,  $0014,  $0000,  $0025   ; 5DBB   015A 0014 0000 0025
        DECLE   $00A0,  $0000,  $0025,  $00A0   ; 5DBF   00A0 0000 0025 00A0
        DECLE   $0000,  $0076,  $008C,  $007E   ; 5DC3   0000 0076 008C 007E
        DECLE   $00A0,  $0086,  $00B4,  $0000   ; 5DC7   00A0 0086 00B4 0000
        DECLE   $008E,  $008C,  $0096,  $00A0   ; 5DCB   008E 008C 0096 00A0
        DECLE   $009E,  $00B4,  $0000,  $0152   ; 5DCF   009E 00B4 0000 0152
        DECLE   $0014,  $010C,  $0050,  $00A6   ; 5DD3   0014 010C 0050 00A6
        DECLE   $008C,  $00AE,  $00A0,  $00B6   ; 5DD7   008C 00AE 00A0 00B6
        DECLE   $00B4,  $0000,  $001E,  $0028   ; 5DDB   00B4 0000 001E 0028
        DECLE   $0000,  $002E,  $0000,  $002E   ; 5DDF   0000 002E 0000 002E
        DECLE   $00B4,  $0000,  $0012,  $003C   ; 5DE3   00B4 0000 0012 003C
        DECLE   $0000,  $0152,  $0064,  $0000   ; 5DE7   0000 0152 0064 0000
        DECLE   $002E,  $0014,  $002E,  $00B4   ; 5DEB   002E 0014 002E 00B4
        DECLE   $0000,  $001E,  $0000,  $0000   ; 5DEF   0000 001E 0000 0000
        DECLE   $0012,  $00A0,  $0000,  $0162   ; 5DF3   0012 00A0 0000 0162
        DECLE   $0078,  $0000,  $010C,  $0000   ; 5DF7   0078 0000 010C 0000
        DECLE   $0000,  $002E,  $0014,  $0162   ; 5DFB   0000 002E 0014 0162
        DECLE   $003C,  $002E,  $0078,  $0000   ; 5DFF   003C 002E 0078 0000
        DECLE   $0135,  $00B4,  $0000,  $0162   ; 5E03   0135 00B4 0000 0162
        DECLE   $0014,  $0000,  $0135,  $0000   ; 5E07   0014 0000 0135 0000
        DECLE   $0000,  $015A,  $0000,  $0152   ; 5E0B   0000 015A 0000 0152
        DECLE   $0050,  $0012,  $00B4,  $0000   ; 5E0F   0050 0012 00B4 0000
        DECLE   $0012,  $00B4,  $0000,  $0025   ; 5E13   0012 00B4 0000 0025
        DECLE   $00A0,  $0000,  $016A,  $0064   ; 5E17   00A0 0000 016A 0064
        DECLE   $0025,  $00A0,  $0000,  $0076   ; 5E1B   0025 00A0 0000 0076
        DECLE   $008C,  $007E,  $00A0,  $0086   ; 5E1F   008C 007E 00A0 0086
        DECLE   $00B4,  $0000,  $008E,  $008C   ; 5E23   00B4 0000 008E 008C
        DECLE   $0096,  $00A0,  $009E,  $00B4   ; 5E27   0096 00A0 009E 00B4
        DECLE   $0000,  $0012,  $0078,  $00A6   ; 5E2B   0000 0012 0078 00A6
        DECLE   $008C,  $00AE,  $00A0,  $00B6   ; 5E2F   008C 00AE 00A0 00B6
        DECLE   $00B4,  $0000,  $0187,  $0188   ; 5E33   00B4 0000 0187 0188
        DECLE   $0189,  $018A,  $018B,  $0172   ; 5E37   0189 018A 018B 0172
        DECLE   $0174,  $0176,  $0178,  $016E   ; 5E3B   0174 0176 0178 016E
        DECLE   $0015,  $0033,  $006F,  $00AB   ; 5E3F   0015 0033 006F 00AB
        DECLE   $001F                           ; 5E43   001F

        SLLC    R3,     1                       ; 5E44   005B
        MOVR    R2,     R7                      ; 5E45   0097

        DECLE   $00D4,  $0001,  $001F           ; 5E46   00D4 0001 001F

        SLLC    R3,     1                       ; 5E49   005B
        MOVR    R2,     R7                      ; 5E4A   0097

        DECLE   $0000,  $0001,  $0008,  $0005   ; 5E4B   0000 0001 0008 0005
        DECLE   $0040,  $0050,  $0050,  $0050   ; 5E4F   0040 0050 0050 0050
        DECLE   $0001,  $0001,  $000B,  $0000   ; 5E53   0001 0001 000B 0000
        DECLE   $0000,  $0000,  $0009,  $0012   ; 5E57   0000 0000 0009 0012
        DECLE   $0001,  $0004,  $0001,  $0004   ; 5E5B   0001 0004 0001 0004
        DECLE   $0002,  $0004,  $0003,  $0005   ; 5E5F   0002 0004 0003 0005
        DECLE   $0016,  $0006,  $0012,  $0003   ; 5E63   0016 0006 0012 0003
        DECLE   $0002,  $0010,  $0000,  $0004   ; 5E67   0002 0010 0000 0004
        DECLE   $000B,  $0013,  $000B,  $0011   ; 5E6B   000B 0013 000B 0011
        DECLE   $001B,  $0000,  $000A,  $0011   ; 5E6F   001B 0000 000A 0011
        DECLE   $0016,  $001C,  $0023,  $002E   ; 5E73   0016 001C 0023 002E
        DECLE   $0000,  $000B,  $0014,  $0019   ; 5E77   0000 000B 0014 0019
        DECLE   $0023,  $002B,  $0034,  $003B   ; 5E7B   0023 002B 0034 003B
        DECLE   $0000                           ; 5E7F   0000

        INCR    R4                              ; 5E80   000C
        DECR    R5                              ; 5E81   0015
L_5E82:
        COMR    R6                              ; 5E82   001E
        ADCR    R0                              ; 5E83   0028
L_5E84:
        ADCR    R6                              ; 5E84   002E
        DECLE   $002E,  $0039,  $0000,  $0028   ; 5E85   002E 0039 0000 0028
        DECLE   $0018,  $0030,  $0000,  $0028   ; 5E89   0018 0030 0000 0028
        DECLE   $0030,  $0038,  $0038,  $0050   ; 5E8D   0030 0038 0038 0050
        DECLE   $0030,  $0000,  $0030,  $0018   ; 5E91   0030 0000 0030 0018
        DECLE   $0038,  $0038,  $0038,  $0018   ; 5E95   0038 0038 0038 0018
        DECLE   $0018,  $0000,  $0038,  $0040   ; 5E99   0018 0000 0038 0040
        DECLE   $0028,  $0018,  $0010,  $0030   ; 5E9D   0028 0018 0010 0030
        DECLE   $0038,  $0000,  $001B,  $001E   ; 5EA1   0038 0000 001B 001E
        DECLE   $0027,  $002D,  $0036           ; 5EA5   0027 002D 0036

        RSWD    R1                              ; 5EA8   0039
        SLL     R3,     1                       ; 5EA9   004B
        SLL     R2,     2                       ; 5EAA   004E
        SLR     R3,     1                       ; 5EAB   0063
        SAR     R0,     2                       ; 5EAC   006C
        RRC     R2,     1                       ; 5EAD   0072
        SARC    R0,     1                       ; 5EAE   0078
        MOVR    R0,     R7                      ; 5EAF   0087

        MOVR    R1,     R5                      ; 5EB0   008D
        MOVR    R2,     R3                      ; 5EB1   0093
        MOVR    R3,     R4                      ; 5EB2   009C
        MOVR    R6,     R1                      ; 5EB3   00B1
        MOVR    R6,     R4                      ; 5EB4   00B4
        ADDR    R0,     R6                      ; 5EB5   00C6
        ADDR    R1,     R1                      ; 5EB6   00C9
        ADDR    R2,     R2                      ; 5EB7   00D2
        ADDR    R3,     R0                      ; 5EB8   00D8
        ADDR    R4,     R1                      ; 5EB9   00E1
        ADDR    R4,     R4                      ; 5EBA   00E4
        PULR    R0                              ; 5EBB   02B0
        PULR    R1                              ; 5EBC   02B1
        PULR    R2                              ; 5EBD   02B2
L_5EBE:
        ADD     .BTAB.C5,R4                     ; 5EBE   02C4 02C5
L_5EC0:
        ADD     .BTAB.D8,R6                     ; 5EC0   02C6 02D8
        DECLE   $02D9,  $02DA,  $0019,  $0037   ; 5EC2   02D9 02DA 0019 0037
        DECLE   $0036,  $0036,  $0000,  $0000   ; 5EC6   0036 0036 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F12   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F22   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5F26   0000 0000 0000 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F2A   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F2E   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F32   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5F36   0001 0000 0000 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F3A   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F3E   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0001,  $0001   ; 5F42   0001 0000 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5F46   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F52   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F56   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5F86   0000 0000 0000 0002
        DECLE   $0002,  $0000,  $0002,  $0002   ; 5F8A   0002 0000 0002 0002
        DECLE   $0002,  $0000,  $0002,  $0002   ; 5F8E   0002 0000 0002 0002
        DECLE   $0002,  $0000,  $0002,  $0002   ; 5F92   0002 0000 0002 0002
        DECLE   $0002,  $0000,  $0000,  $0002   ; 5F96   0002 0000 0000 0002
        DECLE   $0002,  $0000                   ; 5F9A   0002 0000
L_5F9C:
        EIS                                     ; 5F9C   0002
        DECLE   $0002,  $0002,  $0000,  $0002   ; 5F9D   0002 0002 0000 0002
        DECLE   $0002,  $0002,  $0000,  $0002   ; 5FA1   0002 0002 0000 0002
        DECLE   $0002,  $0002,  $0000,  $0000   ; 5FA5   0002 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5FC5   0000 0000 0000

        PSHR    R5                              ; 5FC8   0275
L_5FC9:
        MVI     G_01A5, R3                      ; 5FC9   0283 01A5
        TSTR    R3                              ; 5FCB   009B
        BNEQ    L_5FEC                          ; 5FCC   020C 001E

        MOVR    R1,     R2                      ; 5FCE   008A
        SUB     G_0169, R2                      ; 5FCF   0302 0169
        BNEQ    L_5FEC                          ; 5FD1   020C 0019

        ADD     G_019E, R2                      ; 5FD3   02C2 019E
        BNEQ    L_5FEC                          ; 5FD5   020C 0015

        ADD     G_0183, R2                      ; 5FD7   02C2 0183
        BEQ     L_5FEC                          ; 5FD9   0204 0011

        MOVR    R1,     R2                      ; 5FDB   008A
        XORI    #$0001, R2                      ; 5FDC   03FA 0001
        ADDI    #$01FE, R2                      ; 5FDE   02FA 01FE
        MVI@    R2,     R2                      ; 5FE0   0292
        SDBD                                    ; 5FE1   0001
        ADDI    #$5EC8, R2                      ; 5FE2   02FA 00C8 005E
        MVI@    R2,     R2                      ; 5FE5   0292
        TSTR    R2                              ; 5FE6   0092
        BEQ     L_5FEC                          ; 5FE7   0204 0003

        SAR     R2,     1                       ; 5FE9   006A
        B       L_60C6                          ; 5FEA   0200 00DA
L_5FEC:
        PULR    R7                              ; 5FEC   02B7

        PSHR    R5                              ; 5FED   0275
        MVI     G_01A5, R3                      ; 5FEE   0283 01A5
        TSTR    R3                              ; 5FF0   009B
        BNEQ    L_6028                          ; 5FF1   020C 0035

        MOVR    R1,     R2                      ; 5FF3   008A
        SUB     G_0169, R2                      ; 5FF4   0302 0169
        BNEQ    L_6028                          ; 5FF6   020C 0030

        TSTR    R0                              ; 5FF8   0080
        BMI     L_5FC9                          ; 5FF9   022B 0031

        CMPI    #$00FF, R0                      ; 5FFB   0378 00FF
        BEQ     L_6028                          ; 5FFD   0204 0029

        CMPI    #$0003, R0                      ; 5FFF   0378 0003
        BLT     L_6017                          ; 6001   0205 0014

        CMPI    #$0007, R0                      ; 6003   0378 0007
        BLT     L_6013                          ; 6005   0205 000C

        CMPI    #$000B, R0                      ; 6007   0378 000B
        BLT     L_601B                          ; 6009   0205 0010

        CMPI    #$000E, R0                      ; 600B   0378 000E
        BGT     L_6017                          ; 600D   020E 0008

        MVII    #$0004, R0                      ; 600F   02B8 0004
        B       L_601D                          ; 6011   0200 000A

L_6013:
        MVII    #$0003, R0                      ; 6013   02B8 0003
        B       L_601D                          ; 6015   0200 0006

L_6017:
        MVII    #$0001, R0                      ; 6017   02B8 0001
        B       L_6022                          ; 6019   0200 0007

L_601B:
        MVII    #$0002, R0                      ; 601B   02B8 0002
L_601D:
        MVI     G_019B, R3                      ; 601D   0283 019B
        TSTR    R3                              ; 601F   009B
        BEQ     L_6028                          ; 6020   0204 0006

L_6022:
        MVO     R0,     G_01A3                  ; 6022   0240 01A3
        MVO     R0,     G_019B                  ; 6024   0240 019B
        MVO     R0,     G_01A2                  ; 6026   0240 01A2
L_6028:
        PULR    R7                              ; 6028   02B7

L_6029:
        PSHR    R5                              ; 6029   0275
        MVI     G_019D, R0                      ; 602A   0280 019D
        SDBD                                    ; 602C   0001
        MVII    #$1843, R1                      ; 602D   02B9 0043 0018
        SDBD                                    ; 6030   0001
        MVII    #$1855, R2                      ; 6031   02BA 0055 0018
        CMPI    #$0002, R0                      ; 6034   0378 0002
        BNEQ    L_603C                          ; 6036   020C 0004

        ADDI    #$0200, R1                      ; 6038   02F9 0200
        ADDI    #$0200, R2                      ; 603A   02FA 0200
L_603C:
        MVO     R1,     G_0325                  ; 603C   0241 0325
        MVO     R2,     G_032D                  ; 603E   0242 032D
        MOVR    R0,     R3                      ; 6040   0083
        DECR    R0                              ; 6041   0010
        MOVR    R0,     R1                      ; 6042   0081
        SDBD                                    ; 6043   0001
        ADDI    #$5E57, R1                      ; 6044   02F9 0057 005E
        MVI@    R1,     R1                      ; 6047   0289
        MOVR    R1,     R2                      ; 6048   008A
        SDBD                                    ; 6049   0001
        ADDI    #$59D2, R1                      ; 604A   02F9 00D2 0059
        MVO     R1,     G_0326                  ; 604D   0241 0326
        SDBD                                    ; 604F   0001
        ADDI    #$59ED, R2                      ; 6050   02FA 00ED 0059
        MVO     R2,     G_032E                  ; 6053   0242 032E
        MVI     G_0189, R0                      ; 6055   0280 0189
        TSTR    R0                              ; 6057   0080
        BEQ     L_6065                          ; 6058   0204 000B

        SDBD                                    ; 605A   0001
        MVII    #$1046, R1                      ; 605B   02B9 0046 0010
        SARC    R3,     1                       ; 605E   007B
        BC      L_6063                          ; 605F   0201 0002

        ADDI    #$0200, R1                      ; 6061   02F9 0200
L_6063:
        MVO     R1,     G_031D                  ; 6063   0241 031D
L_6065:
        PULR    R7                              ; 6065   02B7

        PSHR    R5                              ; 6066   0275
        MVI     G_01A5, R3                      ; 6067   0283 01A5
        TSTR    R3                              ; 6069   009B
        BNEQ    L_6096                          ; 606A   020C 002A

        SUB     G_0169, R1                      ; 606C   0301 0169
        BNEQ    L_6096                          ; 606E   020C 0026

        ADD     G_019E, R1                      ; 6070   02C1 019E
        BNEQ    L_6096                          ; 6072   020C 0022

        MVII    #$0181, R2                      ; 6074   02BA 0181
        ADD     G_0169, R2                      ; 6076   02C2 0169
        ADD@    R2,     R1                      ; 6078   02D1
        BNEQ    L_6096                          ; 6079   020C 001B

        ADD     G_0183, R1                      ; 607B   02C1 0183
        BEQ     L_6096                          ; 607D   0204 0017

        MVII    #$0046, R1                      ; 607F   02B9 0046
        MVO@    R1,     R2                      ; 6081   0251
        MVO     R1,     G_019A                  ; 6082   0241 019A
        MVII    #$01C0, R4                      ; 6084   02BC 01C0
        MVII    #$0005, R3                      ; 6086   02BB 0005
        CLRR    R0                              ; 6088   01C0
L_6089:
        ADD@    R4,     R0                      ; 6089   02E0
        DECR    R3                              ; 608A   0013
        BNEQ    L_6089                          ; 608B   022C 0003

        TSTR    R0                              ; 608D   0080
        BEQ     L_6093                          ; 608E   0204 0003

        JSR     R5,     L_6A76                  ; 6090   0004 0168 0276
L_6093:
        JSR     R5,     L_69B9                  ; 6093   0004 0168 01B9

L_6096:
        PULR    R7                              ; 6096   02B7

        CLRR    R2                              ; 6097   01D2
        MVII    #$00A0, R0                      ; 6098   02B8 00A0
        B       L_60A0                          ; 609A   0200 0004

        MVII    #$0001, R2                      ; 609C   02BA 0001
        MVII    #$0040, R0                      ; 609E   02B8 0040
L_60A0:
        PSHR    R5                              ; 60A0   0275
        MVI     G_01A5, R3                      ; 60A1   0283 01A5
        TSTR    R3                              ; 60A3   009B
        BNEQ    L_60EE                          ; 60A4   020C 0048

        MOVR    R1,     R4                      ; 60A6   008C
        SUB     G_0169, R1                      ; 60A7   0301 0169
        BNEQ    L_60EE                          ; 60A9   020C 0043

        ADD     G_019E, R1                      ; 60AB   02C1 019E
        BNEQ    L_60EE                          ; 60AD   020C 003F

        ADD     G_0183, R1                      ; 60AF   02C1 0183
        BEQ     L_60EE                          ; 60B1   0204 003B

        MOVR    R2,     R3                      ; 60B3   0093
        ADDI    #$018F, R3                      ; 60B4   02FB 018F
        MVI@    R3,     R5                      ; 60B6   029D
        XORI    #$0001, R4                      ; 60B7   03FC 0001
        ADDI    #$01FE, R4                      ; 60B9   02FC 01FE
        MVI@    R4,     R1                      ; 60BB   02A1
        CMPR    R0,     R1                      ; 60BC   0141
        BLT     L_60C2                          ; 60BD   0205 0003

        CLRR    R1                              ; 60BF   01C9
        MVO@    R1,     R3                      ; 60C0   0259
        PULR    R7                              ; 60C1   02B7

L_60C2:
        TSTR    R5                              ; 60C2   00AD
        BNEQ    L_60EE                          ; 60C3   020C 0029

        MVO@    R3,     R3                      ; 60C5   025B
L_60C6:
        SLL     R2,     2                       ; 60C6   004E
        MVO     R2,     G_018C                  ; 60C7   0242 018C
        MVI     G_0327, R1                      ; 60C9   0281 0327
        SWAP    R1,     1                       ; 60CB   0041
        MVO     R1,     G_018D                  ; 60CC   0241 018D
        MVI     G_0328, R1                      ; 60CE   0281 0328
        SWAP    R1,     1                       ; 60D0   0041
        MVO     R1,     G_018E                  ; 60D1   0241 018E
        SDBD                                    ; 60D3   0001
        MVII    #$60E8, R5                      ; 60D4   02BD 00E8 0060
        PSHR    R5                              ; 60D7   0275

        JSR     R5,     X_PLAY_SFX1             ; 60D8   0004 0118 03BB
        DECLE   $0229                           ; 60DB  SFX data
        DECLE   $0035                           ; 60DC  SFX data
        DECLE   $03A5                           ; 60DD  SFX data
        DECLE   $03ED                           ; 60DE  SFX data
        DECLE   $0384,  $0180                   ; 60DF  SFX data
        DECLE   $000F,  $00FE                   ; 60E1  SFX data
        DECLE   $0001,  $03E1                   ; 60E3  SFX data
        DECLE   $008F,  $0030                   ; 60E5  SFX data
        DECLE   $02CF                           ; 60E7  SFX end


        MVII    #$0001, R1                      ; 60E8   02B9 0001
        MVO     R1,     G_01A4                  ; 60EA   0241 01A4
        MVO     R1,     G_01A7                  ; 60EC   0241 01A7
L_60EE:
        PULR    R7                              ; 60EE   02B7

L_60EF:
        PSHR    R5                              ; 60EF   0275
        MOVR    R1,     R2                      ; 60F0   008A
        CLRR    R3                              ; 60F1   01DB
        SLL     R2,     2                       ; 60F2   004E
        SLL     R2,     1                       ; 60F3   004A
        ADDI    #$031E, R2                      ; 60F4   02FA 031E
        MVO@    R3,     R2                      ; 60F6   0253
        SUBI    #$0003, R1                      ; 60F7   0339 0003
        MOVR    R1,     R2                      ; 60F9   008A
        ADDI    #$01B8, R1                      ; 60FA   02F9 01B8
        MVO@    R3,     R1                      ; 60FC   024B
        ADDI    #$01C0, R2                      ; 60FD   02FA 01C0
        MVO@    R3,     R2                      ; 60FF   0253
        PULR    R7                              ; 6100   02B7

        MVI     G_011B, R0                      ; 6101   0280 011B
L_6103:
        PSHR    R5                              ; 6103   0275
        MOVR    R0,     R2                      ; 6104   0082
        SUBI    #$0003, R2                      ; 6105   033A 0003
        ADDI    #$01C0, R2                      ; 6107   02FA 01C0
        MVI@    R2,     R2                      ; 6109   0292
        TSTR    R2                              ; 610A   0092
        BEQ     L_61D9                          ; 610B   0204 00CC

        PSHR    R0                              ; 610D   0270
        MOVR    R0,     R5                      ; 610E   0085
        SLL     R0,     2                       ; 610F   004C
        SLL     R0,     1                       ; 6110   0048
        ADDI    #$031D, R0                      ; 6111   02F8 031D
        PSHR    R0                              ; 6113   0270
        MVII    #$0004, R2                      ; 6114   02BA 0004
L_6116:
        CMP     G_0102, R2                      ; 6116   0342 0102
        BEQ     L_6116                          ; 6118   0224 0003

        MOVR    R0,     R1                      ; 611A   0081
        ADDI    #$0002, R1                      ; 611B   02F9 0002
        MVI@    R1,     R3                      ; 611D   028B
        SDBD                                    ; 611E   0001
        ADDI    #$0400, R3                      ; 611F   02FB 0000 0004
        SDBD                                    ; 6122   0001
        ANDI    #$F800, R3                      ; 6123   03BB 0000 00F8
        MVO@    R3,     R1                      ; 6126   024B
        SWAP    R3,     1                       ; 6127   0043
        INCR    R1                              ; 6128   0009
        MVI@    R1,     R2                      ; 6129   028A
        SDBD                                    ; 612A   0001
        ADDI    #$0400, R2                      ; 612B   02FA 0000 0004
        SDBD                                    ; 612E   0001
        ANDI    #$F800, R2                      ; 612F   03BA 0000 00F8
        MVO@    R2,     R1                      ; 6132   024A
        SWAP    R2,     1                       ; 6133   0042
        INCR    R1                              ; 6134   0009
        CLRR    R4                              ; 6135   01E4
        MVO@    R4,     R1                      ; 6136   024C
        CMPI    #$0010, R3                      ; 6137   037B 0010
        BLT     L_6147                          ; 6139   0205 000C

        CMPI    #$00A0, R3                      ; 613B   037B 00A0
        BGE     L_6147                          ; 613D   020D 0008

        CMPI    #$0008, R2                      ; 613F   037A 0008
        BLT     L_6147                          ; 6141   0205 0004

        CMPI    #$0068, R2                      ; 6143   037A 0068
        BLT     L_614D                          ; 6145   0205 0006

L_6147:
        PULR    R1                              ; 6147   02B1
        PULR    R1                              ; 6148   02B1

        JSR     R5,     L_60EF                  ; 6149   0004 0160 00EF

        PULR    R7                              ; 614C   02B7

L_614D:
        SUBI    #$0003, R5                      ; 614D   033D 0003
        ADDI    #$01B8, R5                      ; 614F   02FD 01B8
        MVI@    R5,     R4                      ; 6151   02AC
        DECR    R1                              ; 6152   0011
        MVI@    R1,     R2                      ; 6153   028A
        DECR    R1                              ; 6154   0011
        MVI@    R1,     R3                      ; 6155   028B
        SWAP    R3,     1                       ; 6156   0043

        JSR     R5,     L_69D5                  ; 6157   0004 0168 01D5

        MVI@    R1,     R2                      ; 615A   028A
        TSTR    R2                              ; 615B   0092
        BEQ     L_616A                          ; 615C   0204 000C

        SDBD                                    ; 615E   0001
        ANDI    #$07F8, R2                      ; 615F   03BA 00F8 0007
        CMPI    #$0050, R2                      ; 6162   037A 0050
        BLT     L_6147                          ; 6164   0225 001E

        CMPI    #$0068, R2                      ; 6166   037A 0068
        BGT     L_6147                          ; 6168   022E 0022

L_616A:
        TSTR    R4                              ; 616A   00A4
        BEQ     L_6174                          ; 616B   0204 0007

        MOVR    R4,     R2                      ; 616D   00A2

        JSR     R5,     L_6A63                  ; 616E   0004 0168 0263

        TSTR    R3                              ; 6171   009B
        BEQ     L_618D                          ; 6172   0204 0019

L_6174:
        MVII    #$0018, R0                      ; 6174   02B8 0018

        JSR     R5,     X_RAND2                 ; 6176   0004 0114 029E

        MOVR    R0,     R2                      ; 6179   0082
        SDBD                                    ; 617A   0001
        ADDI    #$5EA3, R2                      ; 617B   02FA 00A3 005E
        MVI@    R2,     R0                      ; 617E   0290
L_617F:
        CLRR    R2                              ; 617F   01D2
        SARC    R0,     1                       ; 6180   0078
        RLC     R2,     1                       ; 6181   0052
        SARC    R0,     1                       ; 6182   0078
        RLC     R2,     1                       ; 6183   0052
        INCR    R2                              ; 6184   000A

        JSR     R5,     L_6A63                  ; 6185   0004 0168 0263

        TSTR    R3                              ; 6188   009B
        BEQ     L_618D                          ; 6189   0204 0002
        B       L_617F                          ; 618B   0220 000D

L_618D:
        PULR    R3                              ; 618D   02B3
        PULR    R1                              ; 618E   02B1
        PSHR    R1                              ; 618F   0271
        PSHR    R3                              ; 6190   0273
        SUBI    #$0003, R1                      ; 6191   0339 0003
        ADDI    #$01B8, R1                      ; 6193   02F9 01B8
        MVO@    R2,     R1                      ; 6195   024A
        CMPI    #$0002, R2                      ; 6196   037A 0002
        BGT     L_61A5                          ; 6198   020E 000B

        MOVR    R2,     R1                      ; 619A   0091
        DECR    R1                              ; 619B   0011
        SLL     R1,     1                       ; 619C   0049
        SWAP    R1,     1                       ; 619D   0041
        MVI@    R3,     R0                      ; 619E   0298
        SDBD                                    ; 619F   0001
        ANDI    #$FDFF, R0                      ; 61A0   03B8 00FF 00FD
        ADDR    R1,     R0                      ; 61A3   00C8
        MVO@    R0,     R3                      ; 61A4   0258
L_61A5:
        MVII    #$0008, R1                      ; 61A5   02B9 0008
        MVII    #$0195, R3                      ; 61A7   02BB 0195
        CMPI    #$0003, R2                      ; 61A9   037A 0003
        BLT     L_61AE                          ; 61AB   0205 0001

        INCR    R3                              ; 61AD   000B
L_61AE:
        ANDI    #$0002, R2                      ; 61AE   03BA 0002
        BEQ     L_61B3                          ; 61B0   0204 0001

        NEGR    R1                              ; 61B2   0021
L_61B3:
        CLRR    R2                              ; 61B3   01D2
        MVO     R2,     G_0195                  ; 61B4   0242 0195
        MVO     R2,     G_0196                  ; 61B6   0242 0196
        MVO@    R1,     R3                      ; 61B8   0259
        PULR    R1                              ; 61B9   02B1
        MOVR    R1,     R4                      ; 61BA   008C
        ADDI    #$0002, R4                      ; 61BB   02FC 0002
        MVI     G_0195, R3                      ; 61BD   0283 0195
        SWAP    R3,     1                       ; 61BF   0043
        ADD@    R4,     R3                      ; 61C0   02E3
        MVI@    R4,     R2                      ; 61C1   02A2
        SWAP    R2,     1                       ; 61C2   0042
        ADD     G_0196, R2                      ; 61C3   02C2 0196
        ADDR    R3,     R2                      ; 61C5   00DA
        PULR    R3                              ; 61C6   02B3
        SUBI    #$0003, R3                      ; 61C7   033B 0003
        ADDI    #$01C0, R3                      ; 61C9   02FB 01C0
        MVI@    R3,     R3                      ; 61CB   029B
        ADD     G_0168, R3                      ; 61CC   02C3 0168
        MOVR    R3,     R4                      ; 61CE   009C
        SLL     R3,     2                       ; 61CF   004F
        ADDR    R4,     R3                      ; 61D0   00E3

        JSR     R5,     .EXEC.9A8               ; 61D1   0004 0118 01A8

        ADDI    #$0006, R1                      ; 61D4   02F9 0006
        MVI@    R1,     R2                      ; 61D6   028A
        DECR    R2                              ; 61D7   0012
        MVO@    R2,     R1                      ; 61D8   024A
L_61D9:
        PULR    R7                              ; 61D9   02B7

        PSHR    R5                              ; 61DA   0275
        CLRR    R1                              ; 61DB   01C9
        MVO     R1,     G_032A                  ; 61DC   0241 032A
        MVO     R1,     G_0332                  ; 61DE   0241 0332
        MVO     R1,     G_01A4                  ; 61E0   0241 01A4
        MVO     R1,     G_01A0                  ; 61E2   0241 01A0
        MVII    #$0017, R1                      ; 61E4   02B9 0017
        MVO     R1,     G_019E                  ; 61E6   0241 019E

        JSR     R5,     .EXEC.7B3               ; 61E8   0004 0114 03B3

        SDBD                                    ; 61EB   0001
        MVII    #$1047, R1                      ; 61EC   02B9 0047 0010
        MVO     R1,     G_0325                  ; 61EF   0241 0325
        SDBD                                    ; 61F1   0001
        MVII    #$5A1D, R1                      ; 61F2   02B9 001D 005A
        MVO     R1,     G_0326                  ; 61F5   0241 0326
        SDBD                                    ; 61F7   0001
        MVII    #$620A, R5                      ; 61F8   02BD 000A 0062
        PSHR    R5                              ; 61FB   0275

        JSR     R5,     X_PLAY_SFX1             ; 61FC   0004 0118 03BB
        DECLE   $0079                           ; 61FF  SFX data
        DECLE   $03ED                           ; 6200  SFX data
        DECLE   $03C5                           ; 6201  SFX data
        DECLE   $03E5                           ; 6202  SFX data
        DECLE   $03D5                           ; 6203  SFX data
        DECLE   $03F2                           ; 6204  SFX data
        DECLE   $03FA                           ; 6205  SFX data
        DECLE   $03F6                           ; 6206  SFX data
        DECLE   $008F,  $005B                   ; 6207  SFX data
        DECLE   $02CF                           ; 6209  SFX end


        PULR    R7                              ; 620A   02B7

L_620B:
        PSHR    R5                              ; 620B   0275
        MVI     G_0160, R1                      ; 620C   0281 0160
        TSTR    R1                              ; 620E   0089
        BEQ     L_625E                          ; 620F   0204 004D

        DECR    R1                              ; 6211   0011
        BNEQ    L_6216                          ; 6212   020C 0002

        MVII    #$0021, R1                      ; 6214   02B9 0021
L_6216:
        MVO     R1,     G_0160                  ; 6216   0241 0160
        MOVR    R1,     R2                      ; 6218   008A
        ANDI    #$000F, R2                      ; 6219   03BA 000F
        BNEQ    L_625E                          ; 621B   020C 0041

        MVII    #$0200, R4                      ; 621D   02BC 0200
L_621F:
        MVO@    R2,     R4                      ; 621F   0262
        CMPI    #$0214, R4                      ; 6220   037C 0214
        BLT     L_621F                          ; 6222   0225 0004

        CMPI    #$0020, R1                      ; 6224   0379 0020
        BNEQ    L_623A                          ; 6226   020C 0012

        MVII    #$0206, R4                      ; 6228   02BC 0206
        MVII    #$0006, R3                      ; 622A   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 622C   0004 0118 007B
        STRING  "GAME OVER"                     ; 622F  
        DECLE   $0000                           ; 6238   0000

        PULR    R7                              ; 6239   02B7

L_623A:
        MVI     G_0167, R0                      ; 623A   0280 0167
        TSTR    R0                              ; 623C   0080
        BNEQ    L_6249                          ; 623D   020C 000A

        MVO     R0,     G_0169                  ; 623F   0240 0169
        MVII    #$0007, R1                      ; 6241   02B9 0007
        MVO     R1,     G_01A6                  ; 6243   0241 01A6

        JSR     R5,     L_6A76                  ; 6245   0004 0168 0276

        PULR    R7                              ; 6248   02B7

L_6249:
        MVO     R0,     G_01A6                  ; 6249   0240 01A6
        CLRR    R0                              ; 624B   01C0
        MVO     R0,     G_0169                  ; 624C   0240 0169

        JSR     R5,     L_6A76                  ; 624E   0004 0168 0276

        MVII    #$000D, R1                      ; 6251   02B9 000D
        MVO     R1,     G_01A6                  ; 6253   0241 01A6
        MVII    #$0001, R1                      ; 6255   02B9 0001
        MVO     R1,     G_0169                  ; 6257   0241 0169
        CLRR    R0                              ; 6259   01C0

        JSR     R5,     L_6A76                  ; 625A   0004 0168 0276

        PULR    R7                              ; 625D   02B7

L_625E:
        MVI     G_0183, R1                      ; 625E   0281 0183
        TSTR    R1                              ; 6260   0089
        BEQ     L_65B9                          ; 6261   0204 0356

        MVI     G_019F, R3                      ; 6263   0283 019F
        SARC    R3,     1                       ; 6265   007B
        BC      L_65B9                          ; 6266   0201 0351
        BEQ     L_65B9                          ; 6268   0204 034F

        MVI     G_0199, R1                      ; 626A   0281 0199
        TSTR    R1                              ; 626C   0089
        BNEQ    L_65B9                          ; 626D   020C 034A

        INCR    R1                              ; 626F   0009
        MVO     R1,     G_0199                  ; 6270   0241 0199
        MVI     G_01A5, R1                      ; 6272   0281 01A5
        TSTR    R1                              ; 6274   0089
        BNEQ    L_6524                          ; 6275   020C 02AD

        MVII    #$0004, R1                      ; 6277   02B9 0004
L_6279:
        CMP     G_0102, R1                      ; 6279   0341 0102
        BEQ     L_6279                          ; 627B   0224 0003

        MVI     G_019E, R1                      ; 627D   0281 019E
        DECR    R1                              ; 627F   0011
        BMI     L_630E                          ; 6280   020B 008C

        MVO     R1,     G_019E                  ; 6282   0241 019E
        BEQ     L_628E                          ; 6284   0204 0008

        MVI     G_0325, R1                      ; 6286   0281 0325
        XORI    #$0007, R1                      ; 6288   03F9 0007
        MVO     R1,     G_0325                  ; 628A   0241 0325
        B       L_6552                          ; 628C   0200 02C4

L_628E:
        MVI     G_0169, R0                      ; 628E   0280 0169
        MOVR    R0,     R2                      ; 6290   0082
        ADDI    #$017B, R2                      ; 6291   02FA 017B
        MVI     G_0327, R3                      ; 6293   0283 0327
        SWAP    R3,     1                       ; 6295   0043
        ANDI    #$00F8, R3                      ; 6296   03BB 00F8
        MVO@    R3,     R2                      ; 6298   0253
        MOVR    R0,     R2                      ; 6299   0082
        ADDI    #$017D, R2                      ; 629A   02FA 017D
        MVI     G_0328, R3                      ; 629C   0283 0328
        SWAP    R3,     1                       ; 629E   0043
        ANDI    #$00FF, R3                      ; 629F   03BB 00FF
        MVO@    R3,     R2                      ; 62A1   0253
        MOVR    R0,     R2                      ; 62A2   0082
        ADDI    #$0181, R2                      ; 62A3   02FA 0181
        MVO@    R1,     R2                      ; 62A5   0251
        MOVR    R0,     R1                      ; 62A6   0081
        ADDI    #$016A, R1                      ; 62A7   02F9 016A
        MVI@    R1,     R2                      ; 62A9   028A
        DECR    R2                              ; 62AA   0012
        MVO@    R2,     R1                      ; 62AB   024A
        XORI    #$0001, R0                      ; 62AC   03F8 0001
        MOVR    R0,     R1                      ; 62AE   0081
        ADDI    #$016A, R1                      ; 62AF   02F9 016A
        MVI@    R1,     R1                      ; 62B1   0289
        ADDR    R1,     R2                      ; 62B2   00CA
        BNEQ    L_62BC                          ; 62B3   020C 0007

        MVII    #$0021, R1                      ; 62B5   02B9 0021
        MVO     R1,     G_0160                  ; 62B7   0241 0160
        J       L_5096                          ; 62B9   0004 0350 0096

L_62BC:
        MVO     R1,     G_017A                  ; 62BC   0241 017A
        TSTR    R1                              ; 62BE   0089
        BEQ     L_62DA                          ; 62BF   0204 0019

        MVII    #$0005, R0                      ; 62C1   02B8 0005
        SDBD                                    ; 62C3   0001
        MVII    #$5E35, R4                      ; 62C4   02BC 0035 005E
        SDBD                                    ; 62C7   0001
        MVII    #$5E3A, R5                      ; 62C8   02BD 003A 005E
L_62CB:
        MVI@    R4,     R1                      ; 62CB   02A1
        MVI@    R5,     R2                      ; 62CC   02AA
        ADD     G_0169, R2                      ; 62CD   02C2 0169
        MVI@    R1,     R3                      ; 62CF   028B
        MVO@    R3,     R2                      ; 62D0   0253
        DECR    R0                              ; 62D1   0010
        BNEQ    L_62CB                          ; 62D2   022C 0008

        MVI     G_0169, R1                      ; 62D4   0281 0169
        XORI    #$0001, R1                      ; 62D6   03F9 0001
        MVO     R1,     G_0169                  ; 62D8   0241 0169
L_62DA:
        MVII    #$0020, R1                      ; 62DA   02B9 0020
        MVO     R1,     G_01A5                  ; 62DC   0241 01A5
        MVII    #$0204, R4                      ; 62DE   02BC 0204
        MVII    #$0007, R3                      ; 62E0   02BB 0007

        JSR     R5,     X_PRINT_R5              ; 62E2   0004 0118 007B
        STRING  "PLAYER   "                     ; 62E5  
        DECLE   $0000                           ; 62EE   0000

        MVI     G_0169, R1                      ; 62EF   0281 0169
        SLL     R1,     2                       ; 62F1   004D
        SLL     R1,     1                       ; 62F2   0049
        ADDI    #$008F, R1                      ; 62F3   02F9 008F
        MVO     R1,     .BTAB.0B                ; 62F5   0241 020B
        MVI     G_0169, R1                      ; 62F7   0281 0169
        ADDI    #$016A, R1                      ; 62F9   02F9 016A
        MVI@    R1,     R0                      ; 62FB   0288
        CMPI    #$0006, R0                      ; 62FC   0378 0006
        BLE     L_6302                          ; 62FE   0206 0002

        MVII    #$0006, R0                      ; 6300   02B8 0006
L_6302:
        MVII    #$020D, R4                      ; 6302   02BC 020D
        SDBD                                    ; 6304   0001
        MVII    #$18BD, R1                      ; 6305   02B9 00BD 0018
L_6308:
        MVO@    R1,     R4                      ; 6308   0261
        DECR    R0                              ; 6309   0010
        BNEQ    L_6308                          ; 630A   022C 0003
        B       L_6524                          ; 630C   0200 0216

L_630E:
        MVI     G_0197, R1                      ; 630E   0281 0197
        TSTR    R1                              ; 6310   0089
        BEQ     L_6350                          ; 6311   0204 003D

        CLRR    R0                              ; 6313   01C0
        MVO     R0,     G_0197                  ; 6314   0240 0197
        MOVR    R1,     R2                      ; 6316   008A
        SUBI    #$0003, R2                      ; 6317   033A 0003
        MOVR    R2,     R4                      ; 6319   0094
        ADDI    #$01A8, R2                      ; 631A   02FA 01A8
        MVII    #$0003, R3                      ; 631C   02BB 0003
        MVO@    R3,     R2                      ; 631E   0253
        SLL     R1,     2                       ; 631F   004D
        SLL     R1,     1                       ; 6320   0049
        ADDI    #$031D, R1                      ; 6321   02F9 031D
        MVI@    R1,     R2                      ; 6323   028A
        SDBD                                    ; 6324   0001
        ADDI    #$8000, R2                      ; 6325   02FA 0000 0080
        MVO@    R2,     R1                      ; 6328   024A
        INCR    R1                              ; 6329   0009
        SDBD                                    ; 632A   0001
        MVII    #$5A16, R2                      ; 632B   02BA 0016 005A
        MVO@    R2,     R1                      ; 632E   024A
        ADDI    #$0004, R1                      ; 632F   02F9 0004
        CLRR    R2                              ; 6331   01D2
        MVO@    R2,     R1                      ; 6332   024A
        ADDI    #$01C0, R4                      ; 6333   02FC 01C0
        MVI@    R4,     R0                      ; 6335   02A0

        JSR     R5,     L_6A76                  ; 6336   0004 0168 0276

        SDBD                                    ; 6339   0001
        MVII    #$6350, R5                      ; 633A   02BD 0050 0063
        PSHR    R5                              ; 633D   0275
        MVII    #$0005, R1                      ; 633E   02B9 0005
        MVII    #$0004, R3                      ; 6340   02BB 0004

        JSR     R5,     L_518E                  ; 6342   0004 0150 018E
        DECLE   $0268,  $0288,  $02A8,  $02C8   ; 6345   0268 0288 02A8 02C8
        DECLE   $0004,  $0000                   ; 6349   0004 0000

        CLRR    R0                              ; 634B   01C0
        MVO     R0,     G_01CF                  ; 634C   0240 01CF
        PULR    R7                              ; 634E   02B7

        DECLE   $0000                           ; 634F   0000
L_6350:
        MVI     G_0194, R1                      ; 6350   0281 0194
        ADD     G_019E, R1                      ; 6352   02C1 019E
        BNEQ    L_63DB                          ; 6354   020C 0085

        ADD     G_01A2, R1                      ; 6356   02C1 01A2
        BEQ     L_63DB                          ; 6358   0204 0081

        MVI     G_0169, R1                      ; 635A   0281 0169
        XORI    #$0001, R1                      ; 635C   03F9 0001
        ADDI    #$01FE, R1                      ; 635E   02F9 01FE
        MVI@    R1,     R1                      ; 6360   0289
        CMPI    #$00FF, R1                      ; 6361   0379 00FF
        BEQ     L_63D2                          ; 6363   0204 006D

        CMPI    #$009F, R1                      ; 6365   0379 009F
        BEQ     L_63D2                          ; 6367   0204 0069

        CMPI    #$003F, R1                      ; 6369   0379 003F
        BEQ     L_63D2                          ; 636B   0204 0065

        MVI     G_0327, R0                      ; 636D   0280 0327
        SWAP    R0,     1                       ; 636F   0040
        MOVR    R0,     R3                      ; 6370   0083
        MVI     G_0328, R1                      ; 6371   0281 0328
        MOVR    R1,     R2                      ; 6373   008A
        SWAP    R1,     1                       ; 6374   0041
        ANDI    #$00FF, R0                      ; 6375   03B8 00FF
        ANDI    #$00FF, R1                      ; 6377   03B9 00FF
        CMPI    #$0010, R0                      ; 6379   0378 0010
        BGE     L_6380                          ; 637B   020D 0003

        INCR    R0                              ; 637D   0008
        B       L_6385                          ; 637E   0200 0005

L_6380:
        CMPI    #$0008, R1                      ; 6380   0379 0008
        BGE     L_6395                          ; 6382   020D 0011

        INCR    R1                              ; 6384   0009
L_6385:
        SWAP    R0,     1                       ; 6385   0040
        MVO     R0,     G_031F                  ; 6386   0240 031F
        MVO     R0,     G_0327                  ; 6388   0240 0327
        MVO     R0,     G_032F                  ; 638A   0240 032F
        SWAP    R1,     1                       ; 638C   0041
        MVO     R1,     G_0320                  ; 638D   0241 0320
        MVO     R1,     G_0328                  ; 638F   0241 0328
        MVO     R1,     G_0330                  ; 6391   0241 0330
        B       L_63DB                          ; 6393   0200 0046

L_6395:
        ANDI    #$0007, R0                      ; 6395   03B8 0007
        ANDI    #$0007, R1                      ; 6397   03B9 0007
        ADDR    R0,     R1                      ; 6399   00C1
        BEQ     L_63A9                          ; 639A   0204 000D

        MVI     G_019D, R1                      ; 639C   0281 019D
        MVI     G_01A3, R2                      ; 639E   0282 01A3
        XORR    R2,     R1                      ; 63A0   01D1
        ANDI    #$0003, R1                      ; 63A1   03B9 0003
        CMPI    #$0003, R1                      ; 63A3   0379 0003
        BEQ     L_63C2                          ; 63A5   0204 001B
        B       L_63C7                          ; 63A7   0200 001E

L_63A9:
        JSR     R5,     L_69D5                  ; 63A9   0004 0168 01D5

        MVI     G_01A3, R2                      ; 63AC   0282 01A3
        CMP     G_019D, R2                      ; 63AE   0342 019D
        BEQ     L_63C7                          ; 63B0   0204 0015

        JSR     R5,     L_6A63                  ; 63B2   0004 0168 0263
        DECLE   $009B,  $0204,  $000A,  $0001   ; 63B5   009B 0204 000A 0001
        DECLE   $03BB,  $00F8,  $000F,  $0001   ; 63B9   03BB 00F8 000F 0001

        CMPI    #$0000, R3                      ; 63BD   037B 0000
        INCR    R0                              ; 63BF   0008
        BEQ     L_63C7                          ; 63C0   0204 0005

L_63C2:
        MVO     R2,     G_019D                  ; 63C2   0242 019D

        JSR     R5,     L_6029                  ; 63C4   0004 0160 0029

L_63C7:
        MVII    #$0201, R1                      ; 63C7   02B9 0201
        MVO     R1,     G_01A0                  ; 63C9   0241 01A0
        MVI     G_032A, R2                      ; 63CB   0282 032A
        TSTR    R2                              ; 63CD   0092
        BNEQ    L_63DB                          ; 63CE   020C 000B
        B       L_63D7                          ; 63D0   0200 0005

L_63D2:
        CLRR    R1                              ; 63D2   01C9
        MVO     R1,     G_01A2                  ; 63D3   0241 01A2
        MVO     R1,     G_01A0                  ; 63D5   0241 01A0
L_63D7:
        MVO     R1,     G_032A                  ; 63D7   0241 032A
        MVO     R1,     G_0332                  ; 63D9   0241 0332
L_63DB:
        MVI     G_0192, R1                      ; 63DB   0281 0192
        TSTR    R1                              ; 63DD   0089
        BEQ     L_63E9                          ; 63DE   0204 0009

        DECR    R1                              ; 63E0   0011
        MVO     R1,     G_0192                  ; 63E1   0241 0192
        CMPI    #$0003, R1                      ; 63E3   0379 0003
        BEQ     L_64CA                          ; 63E5   0204 00E3
        B       L_6524                          ; 63E7   0200 013B

L_63E9:
        MVII    #$0018, R0                      ; 63E9   02B8 0018

        JSR     R5,     X_RAND2                 ; 63EB   0004 0114 029E

        ADD     G_019A, R0                      ; 63EE   02C0 019A
        ADD     G_019E, R0                      ; 63F0   02C0 019E
        ADD     G_01A4, R0                      ; 63F2   02C0 01A4
        BNEQ    L_6524                          ; 63F4   020C 012E

        MVII    #$01C0, R4                      ; 63F6   02BC 01C0
        MVII    #$0003, R0                      ; 63F8   02B8 0003
L_63FA:
        MVI@    R4,     R1                      ; 63FA   02A1
        TSTR    R1                              ; 63FB   0089
        BEQ     L_6405                          ; 63FC   0204 0007

        INCR    R0                              ; 63FE   0008
        CMPI    #$0008, R0                      ; 63FF   0378 0008
        BLT     L_63FA                          ; 6401   0225 0008
        B       L_6524                          ; 6403   0200 011F

L_6405:
        MVO     R0,     G_0191                  ; 6405   0240 0191
        SDBD                                    ; 6407   0001
        MVII    #$641C, R5                      ; 6408   02BD 001C 0064
        PSHR    R5                              ; 640B   0275

        JSR     R5,     X_PLAY_SFX1             ; 640C   0004 0118 03BB
        DECLE   $00A9                           ; 640F  SFX data
        DECLE   $0035                           ; 6410  SFX data
        DECLE   $03A5                           ; 6411  SFX data
        DECLE   $000D                           ; 6412  SFX data
        DECLE   $03C0,  $0080                   ; 6413  SFX data
        DECLE   $000F,  $0008                   ; 6415  SFX data
        DECLE   $0001,  $0080                   ; 6417  SFX data
        DECLE   $008F,  $000F                   ; 6419  SFX data
        DECLE   $02CF                           ; 641B  SFX end


        MVII    #$0007, R1                      ; 641C   02B9 0007
        MVO     R1,     G_0192                  ; 641E   0241 0192
        MVI     G_0327, R3                      ; 6420   0283 0327
        SWAP    R3,     1                       ; 6422   0043
        ANDI    #$00FF, R3                      ; 6423   03BB 00FF
        SLR     R3,     2                       ; 6425   0067
        SLR     R3,     1                       ; 6426   0063
        DECR    R3                              ; 6427   0013
        ADD     G_0187, R3                      ; 6428   02C3 0187
        MVO     R3,     G_0193                  ; 642A   0243 0193
        SDBD                                    ; 642C   0001
        MVII    #$5E69, R1                      ; 642D   02B9 0069 005E
        ADD     G_018B, R1                      ; 6430   02C1 018B
        MVI@    R1,     R4                      ; 6432   028C
        SDBD                                    ; 6433   0001
        ADDI    #$5E6D, R4                      ; 6434   02FC 006D 005E
        CLRR    R3                              ; 6437   01DB
        MOVR    R3,     R0                      ; 6438   0098
        SUBI    #$0020, R0                      ; 6439   0338 0020
        MVII    #$01B0, R5                      ; 643B   02BD 01B0
L_643D:
        ADDI    #$0020, R0                      ; 643D   02F8 0020
        MVI@    R4,     R1                      ; 643F   02A1
        TSTR    R1                              ; 6440   0089
        BEQ     L_6459                          ; 6441   0204 0016

        MOVR    R1,     R2                      ; 6443   008A
        SUB     G_0187, R1                      ; 6444   0301 0187
        BMI     L_643D                          ; 6446   022B 000A
        BEQ     L_643D                          ; 6448   0224 000C

        CMPI    #$0013, R1                      ; 644A   0379 0013
        BGE     L_643D                          ; 644C   022D 0010

        SUB     G_0193, R2                      ; 644E   0302 0193
        BPL     L_6453                          ; 6450   0203 0001

        NEGR    R2                              ; 6452   0022
L_6453:
        INCR    R2                              ; 6453   000A
        ADDR    R0,     R2                      ; 6454   00C2
        MVO@    R2,     R5                      ; 6455   026A
        INCR    R3                              ; 6456   000B
        B       L_643D                          ; 6457   0220 001B

L_6459:
        DECR    R3                              ; 6459   0013
        BEQ     L_648C                          ; 645A   0204 0030

        MVO     R3,     G_0193                  ; 645C   0243 0193
L_645E:
        MVII    #$01B0, R2                      ; 645E   02BA 01B0
        MOVR    R2,     R3                      ; 6460   0093
        INCR    R3                              ; 6461   000B
        CLRR    R4                              ; 6462   01E4
        MVI     G_0193, R5                      ; 6463   0285 0193
L_6465:
        MVI@    R2,     R0                      ; 6465   0290
        ANDI    #$001F, R0                      ; 6466   03B8 001F
        MVI@    R3,     R1                      ; 6468   0299
        ANDI    #$001F, R1                      ; 6469   03B9 001F
        CMPR    R1,     R0                      ; 646B   0148
        BLE     L_6473                          ; 646C   0206 0005

        MVI@    R2,     R0                      ; 646E   0290
        MVI@    R3,     R1                      ; 646F   0299
        MVO@    R0,     R3                      ; 6470   0258
        INCR    R4                              ; 6471   000C
        MVO@    R1,     R2                      ; 6472   0251
L_6473:
        INCR    R2                              ; 6473   000A
        INCR    R3                              ; 6474   000B
        DECR    R5                              ; 6475   0015
        BNEQ    L_6465                          ; 6476   022C 0012

        TSTR    R4                              ; 6478   00A4
        BNEQ    L_645E                          ; 6479   022C 001C

        MVI     G_01B0, R1                      ; 647B   0281 01B0
        ANDI    #$001F, R1                      ; 647D   03B9 001F
        MVI     G_01B1, R2                      ; 647F   0282 01B1
        ANDI    #$001F, R2                      ; 6481   03BA 001F
        CLRR    R0                              ; 6483   01C0
L_6484:
        INCR    R0                              ; 6484   0008
        SUBR    R1,     R2                      ; 6485   010A
        BPL     L_6484                          ; 6486   0223 0003

        SLL     R0,     1                       ; 6488   0048

        JSR     R5,     X_RAND2                 ; 6489   0004 0114 029E

L_648C:
        MVII    #$01B0, R1                      ; 648C   02B9 01B0
        TSTR    R0                              ; 648E   0080
        BNEQ    L_6492                          ; 648F   020C 0001

        INCR    R1                              ; 6491   0009
L_6492:
        MVI@    R1,     R1                      ; 6492   0289
        SLR     R1,     2                       ; 6493   0065
        SLR     R1,     2                       ; 6494   0065
        SLR     R1,     1                       ; 6495   0061
        SDBD                                    ; 6496   0001
        MVII    #$5E69, R2                      ; 6497   02BA 0069 005E
        ADD     G_018B, R2                      ; 649A   02C2 018B
        MVI@    R2,     R2                      ; 649C   0292
        MOVR    R2,     R3                      ; 649D   0093
        SDBD                                    ; 649E   0001
        ADDI    #$5E6D, R2                      ; 649F   02FA 006D 005E
        ADDR    R1,     R2                      ; 64A2   00CA
        MVI@    R2,     R2                      ; 64A3   0292
        SUB     G_0187, R2                      ; 64A4   0302 0187
        INCR    R2                              ; 64A6   000A
        SLL     R2,     2                       ; 64A7   004E
        SLL     R2,     1                       ; 64A8   004A
        MVI     G_0191, R0                      ; 64A9   0280 0191
        SLL     R0,     2                       ; 64AB   004C
        SLL     R0,     1                       ; 64AC   0048
        MOVR    R0,     R4                      ; 64AD   0084
        ADDI    #$031D, R4                      ; 64AE   02FC 031D
        SDBD                                    ; 64B0   0001
        MVII    #$9047, R0                      ; 64B1   02B8 0047 0090
        MVO@    R0,     R4                      ; 64B4   0260
        SDBD                                    ; 64B5   0001
        MVII    #$5A0F, R0                      ; 64B6   02B8 000F 005A
        MVO@    R0,     R4                      ; 64B9   0260
        SWAP    R2,     1                       ; 64BA   0042
        MVO@    R2,     R4                      ; 64BB   0262
        SDBD                                    ; 64BC   0001
        ADDI    #$5E88, R3                      ; 64BD   02FB 0088 005E
        ADDR    R1,     R3                      ; 64C0   00CB
        MVI@    R3,     R0                      ; 64C1   0298
        SWAP    R0,     1                       ; 64C2   0040
        MVO@    R0,     R4                      ; 64C3   0260
        INCR    R4                              ; 64C4   000C
        MVII    #$0301, R0                      ; 64C5   02B8 0301
        MVO@    R0,     R4                      ; 64C7   0260
        B       L_6524                          ; 64C8   0200 005A

L_64CA:
        MVI     G_0191, R2                      ; 64CA   0282 0191
        PSHR    R2                              ; 64CC   0272
        SLL     R2,     2                       ; 64CD   004E
        SLL     R2,     1                       ; 64CE   004A
        ADDI    #$031D, R2                      ; 64CF   02FA 031D
        MOVR    R2,     R4                      ; 64D1   0094
        MVII    #$017F, R3                      ; 64D2   02BB 017F
        ADD     G_0169, R3                      ; 64D4   02C3 0169
        MVI@    R3,     R1                      ; 64D6   0299
        INCR    R1                              ; 64D7   0009
        MVO@    R1,     R3                      ; 64D8   0259
        CMPI    #$0006, R1                      ; 64D9   0379 0006
        BGT     L_64E0                          ; 64DB   020E 0003

        CLRR    R1                              ; 64DD   01C9
        B       L_64F2                          ; 64DE   0200 0012

L_64E0:
        MVI     G_018B, R3                      ; 64E0   0283 018B
        SLL     R3,     1                       ; 64E2   004B
        SDBD                                    ; 64E3   0001
        ADDI    #$5E5B, R3                      ; 64E4   02FB 005B 005E
        CMPI    #$000C, R1                      ; 64E7   0379 000C
        BLE     L_64F1                          ; 64E9   0206 0006

        MVII    #$0002, R0                      ; 64EB   02B8 0002

        JSR     R5,     X_RAND2                 ; 64ED   0004 0114 029E

        ADDR    R0,     R3                      ; 64F0   00C3
L_64F1:
        MVI@    R3,     R1                      ; 64F1   0299
L_64F2:
        MOVR    R1,     R2                      ; 64F2   008A
        SDBD                                    ; 64F3   0001
        ADDI    #$5E63, R2                      ; 64F4   02FA 0063 005E
        MVI@    R2,     R2                      ; 64F7   0292
        CMPI    #$0002, R2                      ; 64F8   037A 0002
        BNEQ    L_6504                          ; 64FA   020C 0008

        MVI     G_018B, R5                      ; 64FC   0285 018B
        CMPI    #$0002, R5                      ; 64FE   037D 0002
        BNEQ    L_6504                          ; 6500   020C 0002

        MVII    #$0011, R2                      ; 6502   02BA 0011
L_6504:
        SDBD                                    ; 6504   0001
        ADDI    #$1840, R2                      ; 6505   02FA 0040 0018
        MVO@    R2,     R4                      ; 6508   0262
        MOVR    R1,     R2                      ; 6509   008A
        SLL     R2,     2                       ; 650A   004E
        MOVR    R2,     R3                      ; 650B   0093
        SLL     R2,     2                       ; 650C   004E
        SUBR    R3,     R2                      ; 650D   011A
        SUBR    R1,     R2                      ; 650E   010A
        SDBD                                    ; 650F   0001
        ADDI    #$5A24, R2                      ; 6510   02FA 0024 005A
        MVO@    R2,     R4                      ; 6513   0262
        ADDI    #$0003, R4                      ; 6514   02FC 0003
        MVII    #$0201, R2                      ; 6516   02BA 0201
        MVO@    R2,     R4                      ; 6518   0262
        INCR    R1                              ; 6519   0009
        PULR    R5                              ; 651A   02B5
        MOVR    R5,     R0                      ; 651B   00A8
        SUBI    #$0003, R5                      ; 651C   033D 0003
        ADDI    #$01C0, R5                      ; 651E   02FD 01C0
        MVO@    R1,     R5                      ; 6520   0269

        JSR     R5,     L_6103                  ; 6521   0004 0160 0103

L_6524:
        MVI     G_01A5, R0                      ; 6524   0280 01A5
        TSTR    R0                              ; 6526   0080
        BEQ     L_6531                          ; 6527   0204 0008

        DECR    R0                              ; 6529   0010
        MVO     R0,     G_01A5                  ; 652A   0240 01A5
        BNEQ    L_6531                          ; 652C   020C 0003
        J       L_51EF                          ; 652E   0004 0350 01EF

L_6531:
        MVII    #$01A8, R3                      ; 6531   02BB 01A8
        CLRR    R0                              ; 6533   01C0
        CLRR    R4                              ; 6534   01E4
L_6535:
        MVI@    R3,     R1                      ; 6535   0299
        DECR    R1                              ; 6536   0011
        BMI     L_654C                          ; 6537   020B 0013

        MVO@    R1,     R3                      ; 6539   0259
        BNEQ    L_654C                          ; 653A   020C 0010

        MOVR    R0,     R2                      ; 653C   0082
        ADDI    #$0003, R2                      ; 653D   02FA 0003
        SLL     R2,     2                       ; 653F   004E
        SLL     R2,     1                       ; 6540   004A
        ADDI    #$031E, R2                      ; 6541   02FA 031E
        MVO@    R4,     R2                      ; 6543   0254
        MOVR    R0,     R2                      ; 6544   0082
        ADDI    #$01B8, R2                      ; 6545   02FA 01B8
        MVO@    R4,     R2                      ; 6547   0254
        MOVR    R0,     R2                      ; 6548   0082
        ADDI    #$01C0, R2                      ; 6549   02FA 01C0
        MVO@    R4,     R2                      ; 654B   0254
L_654C:
        INCR    R3                              ; 654C   000B
        INCR    R0                              ; 654D   0008
        CMPI    #$0005, R0                      ; 654E   0378 0005
        BLT     L_6535                          ; 6550   0225 001C

L_6552:
        MVI     G_0198, R1                      ; 6552   0281 0198
        DECR    R1                              ; 6554   0011
        BMI     L_6565                          ; 6555   020B 000E

        MVO     R1,     G_0198                  ; 6557   0241 0198
        BNEQ    L_6565                          ; 6559   020C 000A

        JSR     R5,     L_5384                  ; 655B   0004 0150 0384

        MVII    #$0204, R4                      ; 655E   02BC 0204
L_6560:
        MVO@    R2,     R4                      ; 6560   0262
        CMPI    #$0214, R4                      ; 6561   037C 0214
        BLT     L_6560                          ; 6563   0225 0004

L_6565:
        CLRR    R1                              ; 6565   01C9
        MVO     R1,     G_0199                  ; 6566   0241 0199
        MVI     G_019A, R1                      ; 6568   0281 019A
        CMPI    #$003C, R1                      ; 656A   0379 003C
        BLT     L_657E                          ; 656C   0205 0010

        SDBD                                    ; 656E   0001
        MVII    #$657E, R5                      ; 656F   02BD 007E 0065
        PSHR    R5                              ; 6572   0275

        JSR     R5,     X_PLAY_SFX1             ; 6573   0004 0118 03BB
        DECLE   $0089                           ; 6576  SFX data
        DECLE   $0035                           ; 6577  SFX data
        DECLE   $03C0,  $0080                   ; 6578  SFX data
        DECLE   $0201,  $0000                   ; 657A  SFX data
        DECLE   $006B                           ; 657C  SFX data
        DECLE   $02CF                           ; 657D  SFX end

L_657E:
        MVI     G_032A, R1                      ; 657E   0281 032A
        DECLE   $0089,  $0204,  $0036,  $0281   ; 6580   0089 0204 0036 0281
        DECLE   $011D,  $008A,  $03BA,  $0003   ; 6584   011D 008A 03BA 0003
        DECLE   $020C,  $002F,  $0001           ; 6588   020C 002F 0001

        MVII    #$00B9, R5                      ; 658B   02BD 00B9
        SLR     R1,     2                       ; 658D   0065
        PSHR    R5                              ; 658E   0275
        ANDI    #$000C, R1                      ; 658F   03B9 000C
        SLL     R1,     1                       ; 6591   0049
        MOVR    R1,     R5                      ; 6592   008D
        SDBD                                    ; 6593   0001
        ADDI    #$659A, R5                      ; 6594   02FD 009A 0065
        J       X_PLAY_SFX2                     ; 6597   0004 0318 03BE

        DECLE   $0002,  $0089,  $0035           ; 659A   0002 0089 0035

        CMP     G_01DE, R0                      ; 659D   0340 01DE
        ADDR    R5,     R3                      ; 659F   00EB
        ADD@    R1,     R7                      ; 65A0   02CF

        DECLE   $0000,  $0002,  $0089,  $0035   ; 65A1   0000 0002 0089 0035

        CMP     G_0097, R0                      ; 65A5   0340 0097
        ADDR    R5,     R3                      ; 65A7   00EB
        ADD@    R1,     R7                      ; 65A8   02CF

        DECLE   $0000,  $0002,  $0089,  $0035   ; 65A9   0000 0002 0089 0035

        CMP     G_01AA, R0                      ; 65AD   0340 01AA
        ADDR    R5,     R3                      ; 65AF   00EB
        ADD@    R1,     R7                      ; 65B0   02CF

        DECLE   $0000,  $0002,  $0089,  $0035   ; 65B1   0000 0002 0089 0035

        CMP     G_0086, R0                      ; 65B5   0340 0086
        ADDR    R5,     R3                      ; 65B7   00EB
        ADD@    R1,     R7                      ; 65B8   02CF

L_65B9:
        MVI     G_0194, R1                      ; 65B9   0281 0194
        DECR    R1                              ; 65BB   0011
        BMI     L_65C0                          ; 65BC   020B 0002

        MVO     R1,     G_0194                  ; 65BE   0241 0194
L_65C0:
        PULR    R7                              ; 65C0   02B7

        PSHR    R5                              ; 65C1   0275
        MVI     G_0186, R0                      ; 65C2   0280 0186
        TSTR    R0                              ; 65C4   0080
        BNEQ    L_65CC                          ; 65C5   020C 0005

        INCR    R0                              ; 65C7   0008
        MVO     R0,     .STIC.CS.0              ; 65C8   0240 0028
        MVO     R0,     .STIC.BORD              ; 65CA   0240 002C
L_65CC:
        MVI     G_019F, R3                      ; 65CC   0283 019F
        SARC    R3,     1                       ; 65CE   007B
        BC      L_67B4                          ; 65CF   0201 01E3
        BEQ     L_6734                          ; 65D1   0204 0161

        MVI     G_01A7, R3                      ; 65D3   0283 01A7
        TSTR    R3                              ; 65D5   009B
        BNEQ    L_65F9                          ; 65D6   020C 0021

        SDBD                                    ; 65D8   0001
        MVII    #$08C7, R3                      ; 65D9   02BB 00C7 0008
        CMP     .STIC.A.0,R3                    ; 65DC   0343 0010
        BNEQ    L_65F9                          ; 65DE   020C 0019

        MVI     .STIC.C.0,R2                    ; 65E0   0282 0018
        ANDI    #$03F8, R2                      ; 65E2   03BA 03F8
        BEQ     L_65F9                          ; 65E4   0204 0013

        JSR     R5,     .EXEC.A83               ; 65E6   0004 0118 0283

        CLRR    R1                              ; 65E9   01C9
        MVO     R1,     G_0146                  ; 65EA   0241 0146
        MVO     R1,     G_01A4                  ; 65EC   0241 01A4
        ANDI    #$00F8, R2                      ; 65EE   03BA 00F8
        BEQ     L_65F9                          ; 65F0   0204 0007

L_65F2:
        INCR    R1                              ; 65F2   0009
        SARC    R2,     1                       ; 65F3   007A
        BNEQ    L_65F2                          ; 65F4   022C 0003

        DECR    R1                              ; 65F6   0011
        MVO     R1,     G_0197                  ; 65F7   0241 0197
L_65F9:
        MVI     G_019E, R1                      ; 65F9   0281 019E
        TSTR    R1                              ; 65FB   0089
        BNEQ    L_6734                          ; 65FC   020C 0136

        MVI     G_0102, R1                      ; 65FE   0281 0102
        MOVR    R1,     R2                      ; 6600   008A
        SARC    R2,     1                       ; 6601   007A
        BC      L_6734                          ; 6602   0201 0130

        MVI     G_01A4, R3                      ; 6604   0283 01A4
        TSTR    R3                              ; 6606   009B
        BEQ     L_6628                          ; 6607   0204 001F

        MVI     G_018C, R3                      ; 6609   0283 018C
        TSTR    R3                              ; 660B   009B
        BNEQ    L_6610                          ; 660C   020C 0002

        SUBI    #$0004, R3                      ; 660E   033B 0004
L_6610:
        MVI     G_018D, R2                      ; 6610   0282 018D
        ADDR    R3,     R2                      ; 6612   00DA
        MVO     R2,     G_018D                  ; 6613   0242 018D
        ADDI    #$0300, R2                      ; 6615   02FA 0300
        MVO     R2,     .STIC.X.0               ; 6617   0242 0000
        MVI     G_018E, R2                      ; 6619   0282 018E
        ADDI    #$0080, R2                      ; 661B   02FA 0080
        MVO     R2,     .STIC.Y.0               ; 661D   0242 0008
        SDBD                                    ; 661F   0001
        MVII    #$08C7, R2                      ; 6620   02BA 00C7 0008
        MVO     R2,     .STIC.A.0               ; 6623   0242 0010
        CLRR    R2                              ; 6625   01D2
        MVO     R2,     G_01A7                  ; 6626   0242 01A7
L_6628:
        CMPI    #$0002, R1                      ; 6628   0379 0002
        BNEQ    L_664B                          ; 662A   020C 001F

        CLRR    R2                              ; 662C   01D2
        MVO     R2,     .STIC.C.0               ; 662D   0242 0018
        MVI     G_019A, R2                      ; 662F   0282 019A
        DECR    R2                              ; 6631   0012
        BMI     L_6734                          ; 6632   020B 0100

        MVO     R2,     G_019A                  ; 6634   0242 019A
        CMPI    #$003C, R2                      ; 6636   037A 003C
        BEQ     L_6642                          ; 6638   0204 0008
        BLT     L_664B                          ; 663A   0205 000F

        MVI     .STIC.CS.0,R2                   ; 663C   0282 0028
        XORI    #$0007, R2                      ; 663E   03FA 0007
        B       L_6649                          ; 6640   0200 0007

L_6642:
        SDBD                                    ; 6642   0001
        MVII    #$5E53, R2                      ; 6643   02BA 0053 005E
        ADD     G_018B, R2                      ; 6646   02C2 018B
        MVI@    R2,     R2                      ; 6648   0292
L_6649:
        MVO     R2,     .STIC.CS.0              ; 6649   0242 0028
L_664B:
        CMPI    #$0004, R1                      ; 664B   0379 0004
        BNEQ    L_6734                          ; 664D   020C 00E5

        MVI     .STIC.HDLY,R1                   ; 664F   0281 0030
        ANDI    #$0007, R1                      ; 6651   03B9 0007
        MVI     G_01A0, R0                      ; 6653   0280 01A0
        TSTR    R0                              ; 6655   0080
        BEQ     L_6734                          ; 6656   0204 00DC

        MVI     G_019D, R0                      ; 6658   0280 019D
        CMPI    #$0003, R0                      ; 665A   0378 0003
        BGE     L_67A3                          ; 665C   020D 0145

        MVI     G_0327, R2                      ; 665E   0282 0327
        SWAP    R2,     1                       ; 6660   0042
        ANDI    #$00FF, R2                      ; 6661   03BA 00FF
        SARC    R0,     1                       ; 6663   0078
        BC      L_66C9                          ; 6664   0201 0063

        DECR    R2                              ; 6666   0012
        CMPI    #$0054, R2                      ; 6667   037A 0054
        BGT     L_672D                          ; 6669   020E 00C2

        INCR    R1                              ; 666B   0009
        CMPI    #$0008, R1                      ; 666C   0379 0008
        BLT     L_672B                          ; 666E   0205 00BB

        MVI     G_0188, R0                      ; 6670   0280 0188
        SDBD                                    ; 6672   0001
        MVII    #$5E3F, R3                      ; 6673   02BB 003F 005E
        ADD     G_018B, R3                      ; 6676   02C3 018B
        CMP@    R3,     R0                      ; 6678   0358
        BLE     L_672D                          ; 6679   0206 00B2

        CLRR    R1                              ; 667B   01C9
        MVO     R1,     .STIC.HDLY              ; 667C   0241 0030
        ADDI    #$0008, R2                      ; 667E   02FA 0008
        SWAP    R2,     1                       ; 6680   0042
        MVO     R2,     G_031F                  ; 6681   0242 031F
        MVO     R2,     G_0327                  ; 6683   0242 0327
        MVO     R2,     G_032F                  ; 6685   0242 032F
        MVI     .STIC.X.1,R1                    ; 6687   0281 0001
        ADDI    #$0008, R1                      ; 6689   02F9 0008
        MVO     R1,     .STIC.X.0               ; 668B   0241 0000
        MVO     R1,     .STIC.X.1               ; 668D   0241 0001
        MVO     R1,     .STIC.X.2               ; 668F   0241 0002
        MVII    #$0008, R0                      ; 6691   02B8 0008
        MOVR    R0,     R1                      ; 6693   0081
        SWAP    R1,     1                       ; 6694   0041
        MVII    #$0003, R2                      ; 6695   02BA 0003
        MVII    #$0337, R3                      ; 6697   02BB 0337
L_6699:
        MVI@    R3,     R4                      ; 6699   029C
        ADDR    R1,     R4                      ; 669A   00CC
        MVO@    R4,     R3                      ; 669B   025C
        ADDI    #$0005, R3                      ; 669C   02FB 0005
        MVI@    R3,     R4                      ; 669E   029C
        ADDR    R1,     R4                      ; 669F   00CC
        MVO@    R4,     R3                      ; 66A0   025C
        MVI@    R2,     R4                      ; 66A1   0294
        ADDR    R0,     R4                      ; 66A2   00C4
        MVO@    R4,     R2                      ; 66A3   0254
        ADDI    #$0003, R3                      ; 66A4   02FB 0003
        INCR    R2                              ; 66A6   000A
        CMPR    R0,     R2                      ; 66A7   0142
        BLT     L_6699                          ; 66A8   0225 0010

        JSR     R5,     X_DEF_ISR               ; 66AA   0004 0110 0126

        MVII    #$00EE, R0                      ; 66AD   02B8 00EE
        MVII    #$0200, R4                      ; 66AF   02BC 0200
        MVII    #$0201, R5                      ; 66B1   02BD 0201
        MVI@    R4,     R1                      ; 66B3   02A1
        MVI@    R5,     R2                      ; 66B4   02AA
        DECR    R5                              ; 66B5   0015
L_66B6:
        MVI@    R5,     R2                      ; 66B6   02AA
        MVO@    R1,     R4                      ; 66B7   0261
        MOVR    R2,     R1                      ; 66B8   0091
        DECR    R0                              ; 66B9   0010
        BNEQ    L_66B6                          ; 66BA   022C 0005

        MVII    #$0200, R3                      ; 66BC   02BB 0200

        JSR     R5,     L_52AF                  ; 66BE   0004 0150 02AF

        MVI     G_0188, R0                      ; 66C1   0280 0188
        DECR    R0                              ; 66C3   0010
        MVI     G_0187, R1                      ; 66C4   0281 0187
        DECR    R1                              ; 66C6   0011
        B       L_6723                          ; 66C7   0200 005A

L_66C9:
        INCR    R2                              ; 66C9   000A
        CMPI    #$0050, R2                      ; 66CA   037A 0050
        BLT     L_672D                          ; 66CC   0205 005F

        DECR    R1                              ; 66CE   0011
        BPL     L_672B                          ; 66CF   0203 005A

        MVI     G_0188, R0                      ; 66D1   0280 0188
        SDBD                                    ; 66D3   0001
        MVII    #$5E43, R3                      ; 66D4   02BB 0043 005E
        ADD     G_018B, R3                      ; 66D7   02C3 018B
        CMP@    R3,     R0                      ; 66D9   0358
        BGE     L_672D                          ; 66DA   020D 0051

        MVII    #$0007, R1                      ; 66DC   02B9 0007
        MVO     R1,     .STIC.HDLY              ; 66DE   0241 0030
        SUBI    #$0008, R2                      ; 66E0   033A 0008
        SWAP    R2,     1                       ; 66E2   0042
        MVO     R2,     G_031F                  ; 66E3   0242 031F
        MVO     R2,     G_0327                  ; 66E5   0242 0327
        MVO     R2,     G_032F                  ; 66E7   0242 032F
        MVI     .STIC.X.1,R1                    ; 66E9   0281 0001
        SUBI    #$0008, R1                      ; 66EB   0339 0008
        MVO     R1,     .STIC.X.0               ; 66ED   0241 0000
        MVO     R1,     .STIC.X.1               ; 66EF   0241 0001
        MVO     R1,     .STIC.X.2               ; 66F1   0241 0002
        MVII    #$0008, R0                      ; 66F3   02B8 0008
        MOVR    R0,     R1                      ; 66F5   0081
        SWAP    R1,     1                       ; 66F6   0041
        MVII    #$0003, R2                      ; 66F7   02BA 0003
        MVII    #$0337, R3                      ; 66F9   02BB 0337
L_66FB:
        MVI@    R3,     R4                      ; 66FB   029C
        SUBR    R1,     R4                      ; 66FC   010C
        MVO@    R4,     R3                      ; 66FD   025C
        ADDI    #$0005, R3                      ; 66FE   02FB 0005
        MVI@    R3,     R4                      ; 6700   029C
        SUBR    R1,     R4                      ; 6701   010C
        MVO@    R4,     R3                      ; 6702   025C
        MVI@    R2,     R4                      ; 6703   0294
        SUBR    R0,     R4                      ; 6704   0104
        MVO@    R4,     R2                      ; 6705   0254
        ADDI    #$0003, R3                      ; 6706   02FB 0003
        INCR    R2                              ; 6708   000A
        CMPR    R0,     R2                      ; 6709   0142
        BLT     L_66FB                          ; 670A   0225 0010

        JSR     R5,     X_DEF_ISR               ; 670C   0004 0110 0126

        MVII    #$0201, R4                      ; 670F   02BC 0201
        MVII    #$0200, R1                      ; 6711   02B9 0200
        MVII    #$00EE, R0                      ; 6713   02B8 00EE

        JSR     R5,     .EXEC.730               ; 6715   0004 0114 0330

        MVII    #$0213, R3                      ; 6718   02BB 0213

        JSR     R5,     L_52AF                  ; 671A   0004 0150 02AF

        MVI     G_0188, R0                      ; 671D   0280 0188
        INCR    R0                              ; 671F   0008
        MVI     G_0187, R1                      ; 6720   0281 0187
        INCR    R1                              ; 6722   0009
L_6723:
        MVO     R0,     G_0188                  ; 6723   0240 0188
        MVO     R1,     G_0187                  ; 6725   0241 0187

        JSR     R5,     L_673B                  ; 6727   0004 0164 033B

        PULR    R7                              ; 672A   02B7

L_672B:
        MVO     R1,     .STIC.HDLY              ; 672B   0241 0030
L_672D:
        SWAP    R2,     1                       ; 672D   0042
        MVO     R2,     G_031F                  ; 672E   0242 031F
        MVO     R2,     G_0327                  ; 6730   0242 0327
        MVO     R2,     G_032F                  ; 6732   0242 032F

L_6734:
        JSR     R5,     X_DEF_ISR               ; 6734   0004 0110 0126
        JSR     R5,     L_673B                  ; 6737   0004 0164 033B

        PULR    R7                              ; 673A   02B7

L_673B:
        PSHR    R5                              ; 673B   0275
        MVI     G_01CF, R3                      ; 673C   0283 01CF
        TSTR    R3                              ; 673E   009B
        BEQ     L_67A2                          ; 673F   0204 0061

        MVI     G_0149, R1                      ; 6741   0281 0149
        TSTR    R1                              ; 6743   0089
        BEQ     L_67A2                          ; 6744   0204 005C

        CMPI    #$000A, R1                      ; 6746   0379 000A
        BGT     L_67A2                          ; 6748   020E 0058

        MVI     G_035F, R1                      ; 674A   0281 035F
        PSHR    R1                              ; 674C   0271
        MVI     G_01CD, R2                      ; 674D   0282 01CD
        CMPI    #$0001, R2                      ; 674F   037A 0001
        BLE     L_675D                          ; 6751   0206 000A

        DECR    R2                              ; 6753   0012
        MVO     R2,     G_01CD                  ; 6754   0242 01CD
        MVI     G_01CC, R0                      ; 6756   0280 01CC
        SWAP    R0,     1                       ; 6758   0040
        XOR     G_01CB, R0                      ; 6759   03C0 01CB
        B       L_678D                          ; 675B   0200 0030

L_675D:
        MVI     G_01CA, R2                      ; 675D   0282 01CA
        DECR    R2                              ; 675F   0012
        BMI     L_6767                          ; 6760   020B 0005

        MVO     R2,     G_01CA                  ; 6762   0242 01CA
        CLRR    R0                              ; 6764   01C0
        B       L_678D                          ; 6765   0200 0026

L_6767:
        DECR    R3                              ; 6767   0013
        SLL     R3,     1                       ; 6768   004B
        SDBD                                    ; 6769   0001
        MVII    #$5182, R4                      ; 676A   02BC 0082 0051
        ADDR    R3,     R4                      ; 676D   00DC
        SDBD                                    ; 676E   0001
        MVI@    R4,     R2                      ; 676F   02A2
        ADD     G_01CE, R2                      ; 6770   02C2 01CE
        MVI@    R2,     R0                      ; 6772   0290
        TSTR    R0                              ; 6773   0080
        BEQ     L_678D                          ; 6774   0204 0017

        MOVR    R2,     R4                      ; 6776   0094
        MVO     R2,     G_035F                  ; 6777   0242 035F

        JSR     R5,     .EXEC.AF4               ; 6779   0004 0118 02F4

        TSTR    R2                              ; 677C   0092
        BEQ     L_6782                          ; 677D   0204 0003

        MVII    #$0002, R2                      ; 677F   02BA 0002
        SUBR    R2,     R1                      ; 6781   0111
L_6782:
        MVO     R1,     G_01CD                  ; 6782   0241 01CD
        MVO     R2,     G_01CA                  ; 6784   0242 01CA
        MVI     G_035F, R2                      ; 6786   0282 035F
        SUBR    R4,     R2                      ; 6788   0122
        ADD     G_01CE, R2                      ; 6789   02C2 01CE
        MVO     R2,     G_01CE                  ; 678B   0242 01CE
L_678D:
        MVO     R0,     .PSG0.chn_a_lo          ; 678D   0240 01F0
        NOP                                     ; 678F   0034
        MVO     R0,     G_01CB                  ; 6790   0240 01CB
        SWAP    R0,     1                       ; 6792   0040
        MVO     R0,     G_01CC                  ; 6793   0240 01CC
        BNEQ    L_679A                          ; 6795   020C 0003

        MVO     R0,     .PSG0.chn_a_vol         ; 6797   0240 01FB
        DECR    R0                              ; 6799   0010
L_679A:
        MVO     R0,     .PSG0.chn_a_hi          ; 679A   0240 01F4
        CLRR    R1                              ; 679C   01C9
        MVO     R1,     .PSG0.chn_b_vol         ; 679D   0241 01FC
        PULR    R1                              ; 679F   02B1
        MVO     R1,     G_035F                  ; 67A0   0241 035F
L_67A2:
        PULR    R7                              ; 67A2   02B7

L_67A3:
        MVI     G_0328, R1                      ; 67A3   0281 0328
        SUBI    #$0100, R1                      ; 67A5   0339 0100
        SARC    R0,     1                       ; 67A7   0078
        BC      L_67AC                          ; 67A8   0201 0002

        ADDI    #$0200, R1                      ; 67AA   02F9 0200
L_67AC:
        MVO     R1,     G_0320                  ; 67AC   0241 0320
        MVO     R1,     G_0328                  ; 67AE   0241 0328
        MVO     R1,     G_0330                  ; 67B0   0241 0330
        B       L_6734                          ; 67B2   0220 007F

L_67B4:
        SDBD                                    ; 67B4   0001
        MVII    #$5E53, R3                      ; 67B5   02BB 0053 005E
        ADD     G_018B, R3                      ; 67B8   02C3 018B
        MVI@    R3,     R0                      ; 67BA   0298
        MVII    #$0028, R4                      ; 67BB   02BC 0028
L_67BD:
        MVO@    R0,     R4                      ; 67BD   0260
        CMPI    #$002D, R4                      ; 67BE   037C 002D
        BLT     L_67BD                          ; 67C0   0225 0004

        MVII    #$0002, R0                      ; 67C2   02B8 0002
        MVO     R0,     G_019F                  ; 67C4   0240 019F
        CLRR    R0                              ; 67C6   01C0
        MVO     R0,     .STIC.HDLY              ; 67C7   0240 0030
        B       L_6734                          ; 67C9   0220 0096

        PSHR    R5                              ; 67CB   0275
        MVI     G_0194, R0                      ; 67CC   0280 0194
        ADD     G_019E, R0                      ; 67CE   02C0 019E
        BNEQ    L_69B8                          ; 67D0   020C 01E6

        MVO     R0,     G_01A0                  ; 67D2   0240 01A0
        MVII    #$0002, R1                      ; 67D4   02B9 0002
        MVO     R1,     G_0194                  ; 67D6   0241 0194
        MVI     G_019D, R1                      ; 67D8   0281 019D
        MOVR    R1,     R4                      ; 67DA   008C
        MVI     G_0327, R3                      ; 67DB   0283 0327
        SDBD                                    ; 67DD   0001
        ANDI    #$FF00, R3                      ; 67DE   03BB 0000 00FF
        SDBD                                    ; 67E1   0001
        ADDI    #$0400, R3                      ; 67E2   02FB 0000 0004
        SDBD                                    ; 67E5   0001
        ANDI    #$F800, R3                      ; 67E6   03BB 0000 00F8
        MVO     R3,     G_031F                  ; 67E9   0243 031F
        MVO     R3,     G_0327                  ; 67EB   0243 0327
        MVO     R3,     G_032F                  ; 67ED   0243 032F
        MVI     G_0328, R2                      ; 67EF   0282 0328
        SDBD                                    ; 67F1   0001
        ANDI    #$FF00, R2                      ; 67F2   03BA 0000 00FF
        SDBD                                    ; 67F5   0001
        ADDI    #$0400, R2                      ; 67F6   02FA 0000 0004
        SDBD                                    ; 67F9   0001
        ANDI    #$F800, R2                      ; 67FA   03BA 0000 00F8
        MVO     R2,     G_0320                  ; 67FD   0242 0320
        MVO     R2,     G_0328                  ; 67FF   0242 0328
        MVO     R2,     G_0330                  ; 6801   0242 0330
        SARC    R1,     1                       ; 6803   0079
        BC      L_6807                          ; 6804   0201 0001

        SARC    R1,     1                       ; 6806   0079
L_6807:
        BEQ     L_680B                          ; 6807   0204 0002
        B       L_6954                          ; 6809   0200 0149

L_680B:
        SWAP    R3,     1                       ; 680B   0043

        JSR     R5,     L_69D5                  ; 680C   0004 0168 01D5
        JSR     R5,     L_69ED                  ; 680F   0004 0168 01ED

        CMPI    #$0002, R4                      ; 6812   037C 0002
        BEQ     L_69B8                          ; 6814   0204 01A2

        INCR    R1                              ; 6816   0009
        MVI@    R1,     R2                      ; 6817   028A
        SDBD                                    ; 6818   0001
        CMPI    #$0825, R2                      ; 6819   037A 0025 0008
        BEQ     L_6852                          ; 681C   0204 0034

        SDBD                                    ; 681E   0001
        CMPI    #$081E, R2                      ; 681F   037A 001E 0008
        BNEQ    L_69B8                          ; 6822   020C 0194

        MVI     G_0189, R2                      ; 6824   0282 0189
        TSTR    R2                              ; 6826   0092
        BNEQ    L_69B8                          ; 6827   020C 018F

        MVO@    R2,     R1                      ; 6829   024A
        SDBD                                    ; 682A   0001
        MVII    #$1046, R2                      ; 682B   02BA 0046 0010
        MVO     R2,     G_031D                  ; 682E   0242 031D
        MVI     G_0327, R2                      ; 6830   0282 0327
        MVO     R2,     G_031F                  ; 6832   0242 031F
        MVI     G_0328, R2                      ; 6834   0282 0328
        MVO     R2,     G_0320                  ; 6836   0242 0320
        INCR    R3                              ; 6838   000B
        MVO     R3,     G_0189                  ; 6839   0243 0189

        JSR     R5,     L_6A4F                  ; 683B   0004 0168 024F

        MVII    #$0005, R0                      ; 683E   02B8 0005

        JSR     R5,     L_6A76                  ; 6840   0004 0168 0276

        SDBD                                    ; 6843   0001
        MVII    #$69B8, R5                      ; 6844   02BD 00B8 0069
        PSHR    R5                              ; 6847   0275

        JSR     R5,     X_PLAY_SFX1             ; 6848   0004 0118 03BB
        DECLE   $0089                           ; 684B  SFX data
        DECLE   $0035                           ; 684C  SFX data
        DECLE   $03C0,  $0077                   ; 684D  SFX data
        DECLE   $03C2                           ; 684F  SFX data
        DECLE   $03EB                           ; 6850  SFX data
        DECLE   $02CF                           ; 6851  SFX end

L_6852:
        MVI     G_0189, R4                      ; 6852   0284 0189
        TSTR    R4                              ; 6854   00A4
        BEQ     L_69B8                          ; 6855   0204 0161

        MVO@    R0,     R1                      ; 6857   0248
        MVO     R0,     G_0189                  ; 6858   0240 0189
        SDBD                                    ; 685A   0001
        MVII    #$0800, R0                      ; 685B   02B8 0000 0008
        MVO     R0,     G_031D                  ; 685E   0240 031D
        INCR    R3                              ; 6860   000B

        JSR     R5,     L_6A4F                  ; 6861   0004 0168 024F

        INCR    R1                              ; 6864   0009
        MVI@    R1,     R3                      ; 6865   028B
        TSTR    R3                              ; 6866   009B
        BEQ     L_686C                          ; 6867   0204 0003

        CMPR    R3,     R2                      ; 6869   015A
        BNEQ    L_6889                          ; 686A   020C 001D

L_686C:
        SDBD                                    ; 686C   0001
        MVII    #$69B8, R5                      ; 686D   02BD 00B8 0069
        PSHR    R5                              ; 6870   0275
        MVII    #$0003, R1                      ; 6871   02B9 0003

        JSR     R5,     L_518C                  ; 6873   0004 0150 018C

        ANDR    R0,     R0                      ; 6876   0180
        CMPR    R4,     R0                      ; 6877   0160
        CMPR    R0,     R0                      ; 6878   0140
        SUBR    R6,     R0                      ; 6879   0130
        SUBR    R2,     R0                      ; 687A   0110
        ADDR    R6,     R0                      ; 687B   00F0
        ADDR    R4,     R0                      ; 687C   00E0
        ADDR    R0,     R0                      ; 687D   00C0
        MOVR    R4,     R7                      ; 687E   00A7

        DECLE   $0004,  $0000                   ; 687F   0004 0000

        CLRR    R0                              ; 6881   01C0
        MVO     R0,     G_01CF                  ; 6882   0240 01CF
        PULR    R7                              ; 6884   02B7
        SUBR    R2,     R7                      ; 6885   0117
        SUBR    R2,     R7                      ; 6886   0117

        DECLE   $0004,  $0000                   ; 6887   0004 0000
L_6889:
        SDBD                                    ; 6889   0001
        MVII    #$692D, R5                      ; 688A   02BD 002D 0069
        PSHR    R5                              ; 688D   0275
        MVII    #$0003, R1                      ; 688E   02B9 0003

        JSR     R5,     L_518C                  ; 6890   0004 0150 018C

        ANDR    R0,     R0                      ; 6893   0180
        CMPR    R4,     R0                      ; 6894   0160
        CMPR    R0,     R0                      ; 6895   0140
        SUBR    R6,     R0                      ; 6896   0130
        SUBR    R2,     R0                      ; 6897   0110
        ADDR    R6,     R0                      ; 6898   00F0
        ADDR    R4,     R0                      ; 6899   00E0
        ADDR    R0,     R0                      ; 689A   00C0
        MOVR    R4,     R7                      ; 689B   00A7

        DECLE   $0004,  $0000                   ; 689C   0004 0000

        CLRR    R0                              ; 689E   01C0
        MVO     R0,     G_01CF                  ; 689F   0240 01CF
        SDBD                                    ; 68A1   0001
        MVII    #$5EBB, R4                      ; 68A2   02BC 00BB 005E
        SDBD                                    ; 68A5   0001
        MVII    #$08D0, R5                      ; 68A6   02BD 00D0 0008
        MVII    #$0009, R0                      ; 68A9   02B8 0009
        MVI     G_018B, R1                      ; 68AB   0281 018B
        MVII    #$02F8, R3                      ; 68AD   02BB 02F8
L_68AF:
        MVI@    R4,     R2                      ; 68AF   02A2
        CMPI    #$0002, R1                      ; 68B0   0379 0002
        BNEQ    L_68B7                          ; 68B2   020C 0003

        MOVR    R5,     R3                      ; 68B4   00AB
        ADDI    #$0008, R5                      ; 68B5   02FD 0008
L_68B7:
        MVO@    R3,     R2                      ; 68B7   0253
        DECR    R0                              ; 68B8   0010
        BNEQ    L_68AF                          ; 68B9   022C 000B

        MVI     G_018B, R0                      ; 68BB   0280 018B
        SLL     R0,     1                       ; 68BD   0048
        MOVR    R0,     R4                      ; 68BE   0084
        SLL     R0,     1                       ; 68BF   0048
        SLL     R0,     2                       ; 68C0   004C
        ADDR    R0,     R4                      ; 68C1   00C4
        MOVR    R4,     R3                      ; 68C2   00A3
        SDBD                                    ; 68C3   0001
        ADDI    #$5AF7, R4                      ; 68C4   02FC 00F7 005A
        SLL     R3,     1                       ; 68C7   004B
        SDBD                                    ; 68C8   0001
        ADDI    #$5A66, R3                      ; 68C9   02FB 0066 005A
        MVII    #$031D, R5                      ; 68CC   02BD 031D
        CLRR    R0                              ; 68CE   01C0
        MVII    #$0006, R2                      ; 68CF   02BA 0006
L_68D1:
        MVI@    R4,     R1                      ; 68D1   02A1
        SDBD                                    ; 68D2   0001
        ADDI    #$1000, R1                      ; 68D3   02F9 0000 0010
        MVO@    R1,     R5                      ; 68D6   0269
        MVO@    R3,     R5                      ; 68D7   026B
        ADDI    #$0006, R3                      ; 68D8   02FB 0006
        MVI@    R4,     R1                      ; 68DA   02A1
        SWAP    R1,     1                       ; 68DB   0041
        MVO@    R1,     R5                      ; 68DC   0269
        MVI@    R4,     R1                      ; 68DD   02A1
        SWAP    R1,     1                       ; 68DE   0041
        NOP                                     ; 68DF   0034
        MVO@    R1,     R5                      ; 68E0   0269
        MVO@    R0,     R5                      ; 68E1   0268
        MVO@    R0,     R5                      ; 68E2   0268
        NOP                                     ; 68E3   0034
        MVO@    R0,     R5                      ; 68E4   0268
        MVO@    R0,     R5                      ; 68E5   0268
        CMPI    #$0325, R5                      ; 68E6   037D 0325
        BNEQ    L_68EC                          ; 68E8   020C 0002

        ADDI    #$0010, R5                      ; 68EA   02FD 0010
L_68EC:
        DECR    R2                              ; 68EC   0012
        BNEQ    L_68D1                          ; 68ED   022C 001D

        MVI     G_018B, R1                      ; 68EF   0281 018B
        INCR    R1                              ; 68F1   0009
        CMPI    #$0004, R1                      ; 68F2   0379 0004
        BLT     L_68FC                          ; 68F4   0205 0006

        MVII    #$0184, R2                      ; 68F6   02BA 0184
        ADD     G_0169, R2                      ; 68F8   02C2 0169
        MVO@    R1,     R2                      ; 68FA   0251
        CLRR    R1                              ; 68FB   01C9
L_68FC:
        MVO     R1,     G_018B                  ; 68FC   0241 018B
        MVII    #$0004, R1                      ; 68FE   02B9 0004

        JSR     R5,     L_518C                  ; 6900   0004 0150 018C
        DECLE   $00FC,  $010C,  $013C,  $014C   ; 6903   00FC 010C 013C 014C
        DECLE   $013C,  $010C,  $00FC,  $00DC   ; 6907   013C 010C 00FC 00DC
        DECLE   $00F0,  $0100,  $00F0,  $0100   ; 690B   00F0 0100 00F0 0100
        DECLE   $00F0,  $0100,  $00F0,  $0100   ; 690F   00F0 0100 00F0 0100
        DECLE   $00F7,  $0004,  $0000           ; 6913   00F7 0004 0000

        CLRR    R0                              ; 6916   01C0
        MVO     R0,     G_01CF                  ; 6917   0240 01CF
        PULR    R7                              ; 6919   02B7

        DECLE   $003C,  $004C,  $007C,  $008C   ; 691A   003C 004C 007C 008C
        DECLE   $007C,  $004C,  $003C,  $001C   ; 691E   007C 004C 003C 001C
        DECLE   $0030,  $0040,  $0030,  $0040   ; 6922   0030 0040 0030 0040
        DECLE   $0030,  $0040,  $0030,  $0040   ; 6926   0030 0040 0030 0040
        DECLE   $0037,  $0004,  $0000           ; 692A   0037 0004 0000

        CLRR    R0                              ; 692D   01C0
        NOP                                     ; 692E   0034
        MVO     R0,     G_032A                  ; 692F   0240 032A
        MVO     R0,     G_0332                  ; 6931   0240 0332
        MVO     R0,     G_0188                  ; 6933   0240 0188
        NOP                                     ; 6935   0034
        MVO     R0,     G_0187                  ; 6936   0240 0187
        MVO     R0,     G_018A                  ; 6938   0240 018A
        MVO     R0,     G_0189                  ; 693A   0240 0189
        MVII    #$0040, R1                      ; 693C   02B9 0040
        MVO     R1,     G_01A5                  ; 693E   0241 01A5
        MVII    #$017F, R1                      ; 6940   02B9 017F
        ADD     G_0169, R1                      ; 6942   02C1 0169
        MVO@    R0,     R1                      ; 6944   0248

        JSR     R5,     L_69B9                  ; 6945   0004 0168 01B9

        MVI     G_018B, R0                      ; 6948   0280 018B
        INCR    R0                              ; 694A   0008
        MOVR    R0,     R1                      ; 694B   0081
        SLL     R0,     2                       ; 694C   004C
        ADDR    R1,     R0                      ; 694D   00C8
        SLL     R0,     1                       ; 694E   0048

        JSR     R5,     L_6A76                  ; 694F   0004 0168 0276

        B       L_69B8                          ; 6952   0200 0064

L_6954:
        SWAP    R3,     1                       ; 6954   0043
        MOVR    R3,     R0                      ; 6955   0098
        ANDI    #$0007, R0                      ; 6956   03B8 0007
        BNEQ    L_69B8                          ; 6958   020C 005E

        JSR     R5,     L_69D5                  ; 695A   0004 0168 01D5
        JSR     R5,     L_69ED                  ; 695D   0004 0168 01ED

        MVI     G_019D, R3                      ; 6960   0283 019D
        SARC    R3,     1                       ; 6962   007B
        BC      L_699A                          ; 6963   0201 0035

        ADDI    #$0014, R1                      ; 6965   02F9 0014
        MVI@    R1,     R3                      ; 6967   028B
        SDBD                                    ; 6968   0001
        CMPI    #$082E, R3                      ; 6969   037B 002E 0008
        BNEQ    L_69B8                          ; 696C   020C 004A

        CMPI    #$023C, R1                      ; 696E   0379 023C
        BLT     L_6976                          ; 6970   0205 0004

        SUBI    #$0050, R1                      ; 6972   0339 0050
        B       L_69AB                          ; 6974   0200 0035

L_6976:
        ADDI    #$0014, R1                      ; 6976   02F9 0014
        INCR    R0                              ; 6978   0008
        CMP@    R1,     R3                      ; 6979   034B
        BNEQ    L_6976                          ; 697A   022C 0005

        SLL     R0,     2                       ; 697C   004C
        SLL     R0,     1                       ; 697D   0048
        ADDI    #$0010, R0                      ; 697E   02F8 0010
        ADDR    R0,     R2                      ; 6980   00C2
L_6981:
        SWAP    R2,     1                       ; 6981   0042
        MVO     R2,     G_0320                  ; 6982   0242 0320
        MVO     R2,     G_0328                  ; 6984   0242 0328
        MVO     R2,     G_0330                  ; 6986   0242 0330
        SDBD                                    ; 6988   0001
        MVII    #$69B8, R5                      ; 6989   02BD 00B8 0069
        PSHR    R5                              ; 698C   0275

        JSR     R5,     X_PLAY_SFX1             ; 698D   0004 0118 03BB
        DECLE   $0029                           ; 6990  SFX data
        DECLE   $0035                           ; 6991  SFX data
        DECLE   $03A5                           ; 6992  SFX data
        DECLE   $03ED                           ; 6993  SFX data
        DECLE   $000F,  $00F8                   ; 6994  SFX data
        DECLE   $02EB                           ; 6996  SFX data
        DECLE   $02CF                           ; 6997  SFX end


        B       L_69B8                          ; 6998   0200 001E

L_699A:
        SUBI    #$0014, R1                      ; 699A   0339 0014
        MVI@    R1,     R3                      ; 699C   028B
        SDBD                                    ; 699D   0001
        CMPI    #$082E, R3                      ; 699E   037B 002E 0008
        BNEQ    L_69B8                          ; 69A1   020C 0015

        CMPI    #$028C, R1                      ; 69A3   0379 028C
        BGE     L_69AB                          ; 69A5   020D 0004

        ADDI    #$0050, R1                      ; 69A7   02F9 0050
        B       L_6976                          ; 69A9   0220 0034

L_69AB:
        SUBI    #$0014, R1                      ; 69AB   0339 0014
        INCR    R0                              ; 69AD   0008
        CMP@    R1,     R3                      ; 69AE   034B
        BNEQ    L_69AB                          ; 69AF   022C 0005

        SLL     R0,     2                       ; 69B1   004C
        SLL     R0,     1                       ; 69B2   0048
        ADDI    #$0010, R0                      ; 69B3   02F8 0010
        SUBR    R0,     R2                      ; 69B5   0102
        B       L_6981                          ; 69B6   0220 0036
L_69B8:
        PULR    R7                              ; 69B8   02B7

L_69B9:
        PSHR    R5                              ; 69B9   0275

        JSR     R5,     .EXEC.7B3               ; 69BA   0004 0114 03B3

        SDBD                                    ; 69BD   0001
        MVII    #$5A08, R2                      ; 69BE   02BA 0008 005A
        MVO     R2,     G_031E                  ; 69C1   0242 031E

        JSR     R5,     L_6029                  ; 69C3   0004 0160 0029

        CLRR    R1                              ; 69C6   01C9
        MVO     R1,     G_0192                  ; 69C7   0241 0192
        MVII    #$01C0, R4                      ; 69C9   02BC 01C0
        MVII    #$01B8, R5                      ; 69CB   02BD 01B8
        MVII    #$0005, R2                      ; 69CD   02BA 0005
L_69CF:
        MVO@    R1,     R4                      ; 69CF   0261
        MVO@    R1,     R5                      ; 69D0   0269
        DECR    R2                              ; 69D1   0012
        BNEQ    L_69CF                          ; 69D2   022C 0004
        PULR    R7                              ; 69D4   02B7

L_69D5:
        PSHR    R5                              ; 69D5   0275
        ANDI    #$00F8, R3                      ; 69D6   03BB 00F8
        SUBI    #$0008, R3                      ; 69D8   033B 0008
        SLR     R3,     2                       ; 69DA   0067
        SLR     R3,     1                       ; 69DB   0063
        SWAP    R2,     1                       ; 69DC   0042
        ADDI    #$0004, R2                      ; 69DD   02FA 0004
        ANDI    #$0078, R2                      ; 69DF   03BA 0078
        MOVR    R2,     R0                      ; 69E1   0090
        SLR     R0,     2                       ; 69E2   0064
        SLR     R0,     1                       ; 69E3   0060
        MVII    #$01EC, R1                      ; 69E4   02B9 01EC
L_69E6:
        ADDI    #$0014, R1                      ; 69E6   02F9 0014
        DECR    R0                              ; 69E8   0010
        BNEQ    L_69E6                          ; 69E9   022C 0004

        ADDR    R3,     R1                      ; 69EB   00D9
        PULR    R7                              ; 69EC   02B7

L_69ED:
        PSHR    R5                              ; 69ED   0275
        PSHR    R1                              ; 69EE   0271
        PSHR    R3                              ; 69EF   0273
        MVII    #$0014, R0                      ; 69F0   02B8 0014
        CMPI    #$0002, R4                      ; 69F2   037C 0002
        BGT     L_69FF                          ; 69F4   020E 0009

        INCR    R3                              ; 69F6   000B
        CMPI    #$0002, R4                      ; 69F7   037C 0002
        BNEQ    L_69FD                          ; 69F9   020C 0002

        SUBI    #$0002, R3                      ; 69FB   033B 0002
L_69FD:
        MVII    #$0001, R0                      ; 69FD   02B8 0001
L_69FF:
        ANDI    #$0002, R4                      ; 69FF   03BC 0002
        BEQ     L_6A04                          ; 6A01   0204 0001

        NEGR    R0                              ; 6A03   0020
L_6A04:
        ADDR    R0,     R1                      ; 6A04   00C1
        MVI@    R1,     R0                      ; 6A05   0288
        SDBD                                    ; 6A06   0001
        CMPI    #$180C, R0                      ; 6A07   0378 000C 0018
        BEQ     L_6A12                          ; 6A0A   0204 0006

        SDBD                                    ; 6A0C   0001
        CMPI    #$0812, R0                      ; 6A0D   0378 0012 0008
        BNEQ    L_6A4B                          ; 6A10   020C 0039

L_6A12:
        CLRR    R0                              ; 6A12   01C0
        MVO@    R0,     R1                      ; 6A13   0248

        JSR     R5,     L_6A4F                  ; 6A14   0004 0168 024F

        MVII    #$0170, R1                      ; 6A17   02B9 0170
        ADD     G_0169, R1                      ; 6A19   02C1 0169
        MVI@    R1,     R0                      ; 6A1B   0288
        INCR    R0                              ; 6A1C   0008
        MVO@    R0,     R1                      ; 6A1D   0248
        MOVR    R0,     R1                      ; 6A1E   0081
        SLL     R0,     2                       ; 6A1F   004C
        ADDR    R1,     R0                      ; 6A20   00C8

        JSR     R5,     L_6A76                  ; 6A21   0004 0168 0276

        SDBD                                    ; 6A24   0001
        MVII    #$6A4A, R5                      ; 6A25   02BD 004A 006A
        PSHR    R5                              ; 6A28   0275
        MVII    #$0002, R1                      ; 6A29   02B9 0002
        MVII    #$00F4, R3                      ; 6A2B   02BB 00F4

        JSR     R5,     L_518E                  ; 6A2D   0004 0150 018E
        DECLE   $01B0,  $01C0,  $01E0,  $0200   ; 6A30   01B0 01C0 01E0 0200
        DECLE   $0220,  $0230                   ; 6A34   0220 0230

        B       L_6807                          ; 6A36   0220 0230

        DECLE   $01E4,  $0004,  $0000           ; 6A38   01E4 0004 0000

        CLRR    R0                              ; 6A3B   01C0
        MVO     R0,     G_01CF                  ; 6A3C   0240 01CF
        PULR    R7                              ; 6A3E   02B7

        DECLE   $0170,  $0190,  $01B0,  $01C0   ; 6A3F   0170 0190 01B0 01C0
        DECLE   $01E0,  $0200,  $01E0,  $0200   ; 6A43   01E0 0200 01E0 0200
        DECLE   $01B4,  $0004,  $0000           ; 6A47   01B4 0004 0000

        PULR    R1                              ; 6A4A   02B1
L_6A4B:
        PULR    R3                              ; 6A4B   02B3
        PULR    R1                              ; 6A4C   02B1
        CLRR    R0                              ; 6A4D   01C0
        PULR    R7                              ; 6A4E   02B7

L_6A4F:
        PSHR    R5                              ; 6A4F   0275
        ADD     G_0187, R3                      ; 6A50   02C3 0187
        MVI     G_018A, R4                      ; 6A52   0284 018A
        MOVR    R4,     R5                      ; 6A54   00A5
        ADDI    #$01D0, R5                      ; 6A55   02FD 01D0
        PSHR    R1                              ; 6A57   0271
        MVI     G_0169, R1                      ; 6A58   0281 0169
        SLL     R1,     2                       ; 6A5A   004D
        SLL     R1,     2                       ; 6A5B   004D
        ADDR    R1,     R5                      ; 6A5C   00CD
        PULR    R1                              ; 6A5D   02B1
        MVO@    R3,     R5                      ; 6A5E   026B
        INCR    R4                              ; 6A5F   000C
        MVO     R4,     G_018A                  ; 6A60   0244 018A
        PULR    R7                              ; 6A62   02B7

L_6A63:
        PSHR    R5                              ; 6A63   0275
        MVII    #$0001, R3                      ; 6A64   02BB 0001
        CMPI    #$0002, R2                      ; 6A66   037A 0002
        BLE     L_6A6C                          ; 6A68   0206 0002

        MVII    #$0014, R3                      ; 6A6A   02BB 0014
L_6A6C:
        PSHR    R2                              ; 6A6C   0272
        ANDI    #$0002, R2                      ; 6A6D   03BA 0002
        BEQ     L_6A72                          ; 6A6F   0204 0001

        NEGR    R3                              ; 6A71   0023
L_6A72:
        ADDR    R1,     R3                      ; 6A72   00CB
        MVI@    R3,     R3                      ; 6A73   029B
        PULR    R2                              ; 6A74   02B2
        PULR    R7                              ; 6A75   02B7

L_6A76:
        PSHR    R5                              ; 6A76   0275
        MVI     G_0169, R2                      ; 6A77   0282 0169
        MVII    #$0161, R3                      ; 6A79   02BB 0161
        ADDR    R2,     R3                      ; 6A7B   00D3
        ADDR    R2,     R3                      ; 6A7C   00D3
        ADDR    R2,     R3                      ; 6A7D   00D3
        ADDI    #$016C, R2                      ; 6A7E   02FA 016C
        MVII    #$0064, R4                      ; 6A80   02BC 0064
        ADD@    R3,     R0                      ; 6A82   02D8
        CMPI    #$0050, R0                      ; 6A83   0378 0050
        BLT     L_6A94                          ; 6A85   0205 000D

        CLRR    R1                              ; 6A87   01C9
        SDBD                                    ; 6A88   0001
        ADD@    R2,     R1                      ; 6A89   02D1
        BNEQ    L_6A94                          ; 6A8A   020C 0008

        INCR    R1                              ; 6A8C   0009
        MVO@    R1,     R2                      ; 6A8D   0251
        MVII    #$016A, R2                      ; 6A8E   02BA 016A
        ADD     G_0169, R2                      ; 6A90   02C2 0169
        ADD@    R2,     R1                      ; 6A92   02D1
        MVO@    R1,     R2                      ; 6A93   0251
L_6A94:
        CLRR    R1                              ; 6A94   01C9
L_6A95:
        CMPR    R4,     R0                      ; 6A95   0160
        BLT     L_6A9C                          ; 6A96   0205 0004

        SUBR    R4,     R0                      ; 6A98   0120
        INCR    R1                              ; 6A99   0009
        B       L_6A95                          ; 6A9A   0220 0006

L_6A9C:
        MVO@    R0,     R3                      ; 6A9C   0258
        PSHR    R0                              ; 6A9D   0270
        INCR    R3                              ; 6A9E   000B
        ADD@    R3,     R1                      ; 6A9F   02D9
        MOVR    R1,     R0                      ; 6AA0   0088
        CLRR    R1                              ; 6AA1   01C9
L_6AA2:
        CMPR    R4,     R0                      ; 6AA2   0160
        BLT     L_6AA9                          ; 6AA3   0205 0004

        INCR    R1                              ; 6AA5   0009
        SUBR    R4,     R0                      ; 6AA6   0120
        B       L_6AA2                          ; 6AA7   0220 0006

L_6AA9:
        MVO@    R0,     R3                      ; 6AA9   0258
        MVI     G_0160, R2                      ; 6AAA   0282 0160
        TSTR    R2                              ; 6AAC   0092
        BNEQ    L_6AB3                          ; 6AAD   020C 0004

        MVII    #$0006, R1                      ; 6AAF   02B9 0006
        MVO     R1,     G_01A6                  ; 6AB1   0241 01A6
L_6AB3:
        MVII    #$0007, R3                      ; 6AB3   02BB 0007
        MVII    #$0002, R1                      ; 6AB5   02B9 0002
        MVII    #$0200, R4                      ; 6AB7   02BC 0200
        ADD     G_01A6, R4                      ; 6AB9   02C4 01A6

        JSR     R5,     X_PRNUM_RGT             ; 6ABB   0004 0118 00C5

        PULR    R0                              ; 6ABE   02B0
        MVII    #$0002, R1                      ; 6ABF   02B9 0002
        MVII    #$0202, R4                      ; 6AC1   02BC 0202
        ADD     G_01A6, R4                      ; 6AC3   02C4 01A6

        JSR     R5,     X_PRNUM_ZRO             ; 6AC5   0004 0118 00AD

        MVII    #$0087, R1                      ; 6AC8   02B9 0087
        MVII    #$0204, R4                      ; 6ACA   02BC 0204
        ADD     G_01A6, R4                      ; 6ACC   02C4 01A6
        MVO@    R1,     R4                      ; 6ACE   0261
        MVO@    R1,     R4                      ; 6ACF   0261
        TSTR    R2                              ; 6AD0   0092
        BNEQ    L_6ADF                          ; 6AD1   020C 000C

        MVI     .BTAB.06,R1                     ; 6AD3   0281 0206
        SDBD                                    ; 6AD5   0001
        ANDI    #$0FF8, R1                      ; 6AD6   03B9 00F8 000F
        BNEQ    L_6ADF                          ; 6AD9   020C 0004

        MVI     .BTAB.13,R2                     ; 6ADB   0282 0213
        MVO     R2,     .BTAB.06                ; 6ADD   0242 0206
L_6ADF:
        MVII    #$0010, R1                      ; 6ADF   02B9 0010
        MVO     R1,     G_0198                  ; 6AE1   0241 0198
        PULR    R7                              ; 6AE3   02B7

        DECLE   $00FF,  $03FF,  $03FF,  $03FF   ; 6AE4   00FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AE8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AEC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AF0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AF4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AF8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6AFC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B00   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B04   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B08   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B0C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B10   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B14   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B18   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B1C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B20   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B24   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B28   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B2C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B30   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B34   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B38   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B3C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B40   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B44   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B48   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B4C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B50   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B54   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B58   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B5C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B60   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B64   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B68   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B6C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B70   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B74   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B78   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B7C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B80   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B84   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B88   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B8C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B90   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B94   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B98   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6B9C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BA0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BA4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BA8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BAC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BB0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BB4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BB8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BBC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BC0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BC4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BC8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BCC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BD0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BD4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BD8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BDC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BE0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BE4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BE8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BEC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BF0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BF4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BF8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6BFC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C00   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C04   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C08   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C0C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C10   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C14   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C18   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C1C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C20   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C24   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C28   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C2C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C30   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C34   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C38   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C3C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C40   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C44   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C48   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C4C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C50   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C54   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C58   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C5C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C60   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C64   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C68   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C6C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C70   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C74   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C78   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C7C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C80   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C84   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C88   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C8C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C90   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C94   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C98   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6C9C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CA0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CA4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CA8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CAC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CB0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CB4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CB8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CBC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CC0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CC4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CC8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CCC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CD0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CD4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CD8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CDC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CE0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CE4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CE8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CEC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CF0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CF4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CF8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6CFC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D00   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D04   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D08   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D0C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D10   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D14   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D18   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D1C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D20   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D24   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D28   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D2C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D30   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D34   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D38   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D3C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D40   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D44   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D48   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D4C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D50   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D54   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D58   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D5C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D60   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D64   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D68   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D6C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D70   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D74   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D78   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D7C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D80   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D84   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D88   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D8C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D90   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D94   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D98   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6D9C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DA0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DA4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DA8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DAC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DB0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DB4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DB8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DBC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DC0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DC4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DC8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DCC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DD0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DD4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DD8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DDC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DE0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DE4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DE8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DEC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DF0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DF4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DF8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6DFC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E00   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E04   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E08   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E0C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E10   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E14   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E18   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E1C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E20   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E24   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E28   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E2C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E30   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E34   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E38   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E3C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E40   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E44   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E48   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E4C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E50   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E54   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E58   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E5C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E60   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E64   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E68   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E6C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E70   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E74   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E78   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E7C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E80   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E84   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E88   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E8C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E90   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E94   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E98   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6E9C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EA0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EA4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EA8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EAC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EB0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EB4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EB8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EBC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EC0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EC4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EC8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ECC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ED0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ED4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6ED8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EDC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EE0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EE4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EE8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EEC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EF0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EF4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EF8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6EFC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F00   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F04   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F08   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F0C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F10   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F14   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F18   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F1C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F20   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F24   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F28   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F2C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F30   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F34   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F38   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F3C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F40   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F44   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F48   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F4C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F50   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F54   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F58   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F5C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F60   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F64   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F68   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F6C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F70   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F74   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F78   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F7C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F80   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F84   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F88   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F8C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F90   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F94   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F98   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6F9C   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FA0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FA4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FA8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FAC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FB0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FB4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FB8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FBC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FC0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FC4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FC8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FCC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FD0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FD4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FD8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FDC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FE0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FE4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FE8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FEC   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FF0   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FF4   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FF8   03FF 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; 6FFC   03FF 03FF 03FF 03FF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5031       <entry>
;;  $5095       <entry>
;;  $5096       $62B9  
;;  $50A3       $5096  
;;  $50C1       $50C3  
;;  $50D6       $50D2  
;;  $50E1       $50B6   $50C8   $50CC  
;;  $5103       $50F8   $50FF  
;;  $5111       $50AF   $50E4  
;;  $513C       $50EE  
;;  $5148       $5140  
;;  $516A       $503B   $5115   $51F9  
;;  $5173       $50F2   $50F6   $5144  
;;  $5177       $517F  
;;  $5179       $517C  
;;  $518C       $51AC   $6873   $6890   $6900  
;;  $518E       $6342   $6A2D  
;;  $51A0       $50E9  
;;  $51A5       $50DB   $50DF  
;;  $51EF       $652E  
;;  $520E       $5215  
;;  $5217       $51FF  
;;  $521D       $5220  
;;  $523A       $5229  
;;  $5243       $5238   $5250  
;;  $525E       $5255  
;;  $5280       $526E  
;;  $5287       $527E  
;;  $5299       $528C  
;;  $52AE       $529E  
;;  $52AF       $5244   $66BE   $671A  
;;  $52C7       $52BE   $52C3  
;;  $52D4       $52CB   $52D1  
;;  $52D9       $52E3  
;;  $52DF       $52DA  
;;  $52E0       $52DD  
;;  $52F1       $52EB   $52ED  
;;  $5301       $52FA  
;;  $5303       $52FF  
;;  $5327       $531B  
;;  $532F       $5311   $5321   $5325  
;;  $533D       $5369  
;;  $534F       $5343   $534B  
;;  $5366       $5360  
;;  $536B       $533F  
;;  $536C       $5333  
;;  $536D       $532B   $5363  
;;  $537A       $537E  
;;  $5382       $537B  
;;  $5383       $5378   $5380  
;;  $5384       $52B1   $655B  
;;  $5395       $538E  
;;  $5399       $5393  
;;  $567B       $5679  
;;  $5696       $5694  
;;  $57D5       $57D3  
;;  $57D8       $57D8  
;;  $580B       $580B  
;;  $581E       $581C  
;;  $5841       $5841  
;;  $592A       $5928  
;;  $5B87       $5B85  
;;  $5E82       $5B81  
;;  $5E84       $5B83  
;;  $5EBE       $5BBD  
;;  $5EC0       $5BBF  
;;  $5F9C       $5BA4  
;;  $5FC9       $5FF9  
;;  $5FEC       $5FCC   $5FD1   $5FD5   $5FD9   $5FE7  
;;  $6013       $5C1B   $6005  
;;  $6017       $6001   $600D  
;;  $601B       $6009  
;;  $601D       $6011   $6015  
;;  $6022       $6019  
;;  $6028       $5FF1   $5FF6   $5FFD   $6020  
;;  $6029       $63C4   $69C3  
;;  $603C       $6036  
;;  $6063       $605F  
;;  $6065       $6058  
;;  $6089       $608B  
;;  $6093       $608E  
;;  $6096       $606A   $606E   $6072   $6079   $607D  
;;  $60A0       $609A  
;;  $60C2       $60BD  
;;  $60C6       $5FEA  
;;  $60EE       $60A4   $60A9   $60AD   $60B1   $60C3  
;;  $60EF       $6149  
;;  $6103       $6521  
;;  $6116       $6118  
;;  $6147       $6139   $613D   $6141   $6164   $6168  
;;  $614D       $6145  
;;  $616A       $615C  
;;  $6174       $616B  
;;  $617F       $618B  
;;  $618D       $6172   $6189  
;;  $61A5       $6198  
;;  $61AE       $61AB  
;;  $61B3       $61B0  
;;  $61D9       $610B  
;;  $620B       <entry>
;;  $6216       $6212  
;;  $621F       $6222  
;;  $623A       $6226  
;;  $6249       $623D  
;;  $625E       $620F   $621B  
;;  $6279       $627B  
;;  $628E       $6284  
;;  $62BC       $62B3  
;;  $62CB       $62D2  
;;  $62DA       $62BF  
;;  $6302       $62FE  
;;  $6308       $630A  
;;  $630E       $6280  
;;  $6350       $6311  
;;  $6380       $637B  
;;  $6385       $637E  
;;  $6395       $6382  
;;  $63A9       $639A  
;;  $63C2       $63A5  
;;  $63C7       $63A7   $63B0   $63C0  
;;  $63D2       $6363   $6367   $636B  
;;  $63D7       $63D0  
;;  $63DB       $6354   $6358   $6393   $63CE  
;;  $63E9       $63DE  
;;  $63FA       $6401  
;;  $6405       $63FC  
;;  $643D       $6446   $6448   $644C   $6457  
;;  $6453       $6450  
;;  $6459       $6441  
;;  $645E       $6479  
;;  $6465       $6476  
;;  $6473       $646C  
;;  $6484       $6486  
;;  $648C       $645A  
;;  $6492       $648F  
;;  $64CA       $63E5  
;;  $64E0       $64DB  
;;  $64F1       $64E9  
;;  $64F2       $64DE  
;;  $6504       $64FA   $6500  
;;  $6524       $6275   $630C   $63E7   $63F4   $6403   $64C8  
;;  $6531       $6527   $652C  
;;  $6535       $6550  
;;  $654C       $6537   $653A  
;;  $6552       $628C  
;;  $6560       $6563  
;;  $6565       $6555   $6559  
;;  $657E       $656C  
;;  $65B9       $6261   $6266   $6268   $626D  
;;  $65C0       $65BC  
;;  $65CC       $65C5  
;;  $65F2       $65F4  
;;  $65F9       $65D6   $65DE   $65E4   $65F0  
;;  $6610       $660C  
;;  $6628       $6607  
;;  $6642       $6638  
;;  $6649       $6640  
;;  $664B       $662A   $663A  
;;  $6699       $66A8  
;;  $66B6       $66BA  
;;  $66C9       $6664  
;;  $66FB       $670A  
;;  $6723       $66C7  
;;  $672B       $666E   $66CF  
;;  $672D       $6669   $6679   $66CC   $66DA  
;;  $6734       $65D1   $65FC   $6602   $6632   $664D   $6656   $67B2   $67C9  
;;  $673B       $6727   $6737  
;;  $675D       $6751  
;;  $6767       $6760  
;;  $6782       $677D  
;;  $678D       $675B   $6765   $6774  
;;  $679A       $6795  
;;  $67A2       $673F   $6744   $6748  
;;  $67A3       $665C  
;;  $67AC       $67A8  
;;  $67B4       $65CF  
;;  $67BD       $67C0  
;;  $6807       $6804   $6A36  
;;  $680B       $6807  
;;  $6852       $681C  
;;  $686C       $6867  
;;  $6889       $686A  
;;  $68AF       $68B9  
;;  $68B7       $68B2  
;;  $68D1       $68ED  
;;  $68EC       $68E8  
;;  $68FC       $68F4  
;;  $6954       $6809  
;;  $6976       $6970   $697A   $69A9  
;;  $6981       $69B6  
;;  $699A       $6963  
;;  $69AB       $6974   $69A5   $69AF  
;;  $69B8       $67D0   $6814   $6822   $6827   $6855   $6952   $6958   $696C  
;;  $69B8       $6998   $69A1  
;;  $69B9       $6093   $6945  
;;  $69CF       $69D2  
;;  $69D5       $6157   $63A9   $680C   $695A  
;;  $69E6       $69E9  
;;  $69ED       $680F   $695D  
;;  $69FD       $69F9  
;;  $69FF       $69F4  
;;  $6A04       $6A01  
;;  $6A12       $6A0A  
;;  $6A4B       $6A10  
;;  $6A4F       $683B   $6861   $6A14  
;;  $6A63       $616E   $6185   $63B2  
;;  $6A6C       $6A68  
;;  $6A72       $6A6F  
;;  $6A76       $6090   $6245   $624E   $625A   $6336   $6840   $694F   $6A21  
;;  $6A94       $6A85   $6A8A  
;;  $6A95       $6A9A  
;;  $6A9C       $6A96  
;;  $6AA2       $6AA7  
;;  $6AA9       $6AA3  
;;  $6AB3       $6AAD  
;;  $6ADF       $6AD1   $6AD9  
;; ======================================================================== ;;
