
        ORG     $5000
.HEADER:
        BIDECLE $5311           ; 5000  Ptr: MOB graphic images
        BIDECLE $501E           ; 5002  Ptr: EXEC timer table
        BIDECLE $50AA           ; 5004  Ptr: Start of game
        BIDECLE $53B7           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $501C           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5028           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0001,  $000D   ; 500F  Color Stack init (0, 1)
        DECLE   $0009,  $0003   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.GRAM_INIT_501C:
        DECLE   $0001           ; 501C  # of GRAM cards to init
        DECLE   $0000           ; 501D  #00   :  CART #00    ----

.TIMER:
        DECLE   $0068,  $0058,  $0001,  $0000; 501E  Timer dispatch/interval
        DECLE   $007D,  $005E,  $000A,  $0000; 5022  Timer dispatch/interval
        BIDECLE $0000           ; 5026  End of timer table

.TITLE:
        DECLE   $0052                           ; 5028  Cartridge year
        DECLE   $0000                           ; 5029  

.TITLECODE:
        PSHR    R5                              ; 502A   0275

        JSR     R5,     L_51F5                  ; 502B   0004 0150 01F5

        MVII    #$0007, R3                      ; 502E   02BB 0007
        MVII    #$0203, R4                      ; 5030   02BC 0203

        JSR     R5,     X_PRINT_R5              ; 5032   0004 0118 007B
        STRING  "PARKER BROTHERS"               ; 5035  
        DECLE   $0000                           ; 5044   0000

        MVII    #$021A, R4                      ; 5045   02BC 021A

        JSR     R5,     X_PRINT_R5              ; 5047   0004 0118 007B
        STRING  "PRESENTS"                      ; 504A  
        DECLE   $0000                           ; 5052   0000

        MVII    #$0255, R4                      ; 5053   02BC 0255

        JSR     R5,     X_PRINT_R5              ; 5055   0004 0118 007B
        STRING  "THE EMPIRE"                    ; 5058  
        DECLE   $0000                           ; 5062   0000

        MVII    #$027C, R4                      ; 5063   02BC 027C

        JSR     R5,     X_PRINT_R5              ; 5065   0004 0118 007B
        STRING  "STRIKES BACK"                  ; 5068  
        DECLE   $0000                           ; 5074   0000

        MVII    #$02CD, R4                      ; 5075   02BC 02CD

        JSR     R5,     X_PRINT_R5              ; 5077   0004 0118 007B
        STRING  "Copr 1983"                     ; 507A  
        DECLE   $0000                           ; 5083   0000

        INCR    R7                              ; 5084   000F

L_5085:
        PSHR    R5                              ; 5085   0275
L_5086:
        ADDI    #$002F, R1                      ; 5086   02F9 002F
        MVO     R1,     G_0146                  ; 5088   0241 0146

        JSR     R5,     X_PLAY_MUS2             ; 508A   0004 0118 035D
        DECLE   $006A                           ; 508D  Note (short)
        DECLE   $006A                           ; 508E  Note (short)
        DECLE   $006A                           ; 508F  Note (short)
        DECLE   $00B7                           ; 5090  Note (short)
        DECLE   $0127                           ; 5091  Note (short)
        DECLE   $0102                           ; 5092  Note (short)
        DECLE   $00F2                           ; 5093  Note (short)
        DECLE   $00D2                           ; 5094  Note (short)
        DECLE   $0177                           ; 5095  Note (short)
        DECLE   $0127                           ; 5096  Note (short)
        DECLE   $0102                           ; 5097  Note (short)
        DECLE   $00F2                           ; 5098  Note (short)
        DECLE   $00D2                           ; 5099  Note (short)
        DECLE   $0177                           ; 509A  Note (short)
        DECLE   $0127                           ; 509B  Note (short)
        DECLE   $0102                           ; 509C  Note (short)
        DECLE   $00F2                           ; 509D  Note (short)
        DECLE   $0102                           ; 509E  Note (short)
        DECLE   $00D7                           ; 509F  Note (short)
        DECLE   $0001                           ; 50A0  Note (short)
        DECLE   $0000                           ; 50A1  End of music

        MVI     G_01C7, R1                      ; 50A2   0281 01C7
        DECR    R1                              ; 50A4   0011
        MVO     R1,     G_01C7                  ; 50A5   0241 01C7
        BPL     L_5086                          ; 50A7   0223 0022
        PULR    R7                              ; 50A9   02B7

.START:
        PSHR    R5                              ; 50AA   0275

        JSR     R5,     L_50B8                  ; 50AB   0004 0150 00B8
        DECLE   $0000,  $0000                   ; 50AE   0000 0000

        ADDR    R3,     R7                      ; 50B0   00DF

        DECLE   $0050,  $0000,  $0000,  $0000   ; 50B1   0050 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 50B5   0000 0000 0000
L_50B8:
        MVO     R5,     G_035D                  ; 50B8   0245 035D
        MVII    #$015F, R4                      ; 50BA   02BC 015F
        MVII    #$0061, R0                      ; 50BC   02B8 0061

        JSR     R5,     X_FILL_ZERO             ; 50BE   0004 0114 0338
        JSR     R5,     L_51F5                  ; 50C1   0004 0150 01F5

        MVII    #$022A, R4                      ; 50C4   02BC 022A
        MVII    #$0001, R1                      ; 50C6   02B9 0001
        MVII    #$015C, R5                      ; 50C8   02BD 015C
        MVO@    R1,     R5                      ; 50CA   0269
        INCR    R5                              ; 50CB   000D
        MVO@    R1,     R5                      ; 50CC   0269
        MVO@    R1,     R5                      ; 50CD   0269
        MVO@    R1,     R5                      ; 50CE   0269
        MVII    #$0006, R3                      ; 50CF   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 50D1   0004 0118 007B
        STRING  "Players ?"                     ; 50D4  
        DECLE   $0000                           ; 50DD   0000

        PULR    R7                              ; 50DE   02B7

        PSHR    R5                              ; 50DF   0275
        MVI     G_0162, R1                      ; 50E0   0281 0162
        TSTR    R1                              ; 50E2   0089
        BNEQ    L_5132                          ; 50E3   020C 004D

        ANDI    #$000F, R0                      ; 50E5   03B8 000F
        MVI     G_0161, R1                      ; 50E7   0281 0161
        TSTR    R1                              ; 50E9   0089
        BEQ     L_5106                          ; 50EA   0204 001A
        B       L_50EE                          ; 50EC   0200 0000

L_50EE:
        CMPI    #$0004, R0                      ; 50EE   0378 0004
        BGT     L_512E                          ; 50F0   020E 003C

        TSTR    R0                              ; 50F2   0080
        BEQ     L_512E                          ; 50F3   0204 0039

        MVI     G_0161, R1                      ; 50F5   0281 0161
        DECR    R1                              ; 50F7   0011
        MVO     R1,     G_0161                  ; 50F8   0241 0161
        MVO     R0,     G_0162                  ; 50FA   0240 0162
        MVII    #$0007, R3                      ; 50FC   02BB 0007
        MVII    #$0001, R1                      ; 50FE   02B9 0001
        MVII    #$029E, R4                      ; 5100   02BC 029E

        JSR     R5,     X_PRNUM_RGT             ; 5102   0004 0118 00C5

        PULR    R7                              ; 5105   02B7

L_5106:
        MVII    #$0005, R4                      ; 5106   02BC 0005
        CMPI    #$0001, R0                      ; 5108   0378 0001
        BEQ     L_5112                          ; 510A   0204 0006

        CMPI    #$0002, R0                      ; 510C   0378 0002
        BNEQ    L_512E                          ; 510E   020C 001E

        MVO     R4,     G_0164                  ; 5110   0244 0164
L_5112:
        MVO     R0,     G_0161                  ; 5112   0240 0161
        MVO     R4,     G_0163                  ; 5114   0244 0163
        MVII    #$0007, R3                      ; 5116   02BB 0007
        MVII    #$023A, R4                      ; 5118   02BC 023A
        MVII    #$0001, R1                      ; 511A   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 511C   0004 0118 00C5

        DECR    R3                              ; 511F   0013
        MVII    #$028E, R4                      ; 5120   02BC 028E

        JSR     R5,     X_PRINT_R5              ; 5122   0004 0118 007B
        STRING  "Level ?"                       ; 5125  
        DECLE   $0000                           ; 512C   0000

        PULR    R7                              ; 512D   02B7

L_512E:
        JSR     R5,     X_PLAY_RAZZ2            ; 512E   0004 011C 02BD

        PULR    R7                              ; 5131   02B7

L_5132:
        DECR    R1                              ; 5132   0011
        MVO     R1,     G_0162                  ; 5133   0241 0162
        MVO     R1,     G_016B                  ; 5135   0241 016B
        MVII    #$0004, R1                      ; 5137   02B9 0004
        MVO     R1,     G_0103                  ; 5139   0241 0103
        MVII    #$0170, R5                      ; 513B   02BD 0170
        SLL     R1,     1                       ; 513D   0049
        MVI     G_0161, R4                      ; 513E   0284 0161
L_5140:
        MVII    #$0004, R0                      ; 5140   02B8 0004
        MVII    #$0002, R3                      ; 5142   02BB 0002
L_5144:
        MVO@    R1,     R5                      ; 5144   0269
        MVO@    R3,     R5                      ; 5145   026B
        ADDI    #$0002, R3                      ; 5146   02FB 0002
        INCR    R5                              ; 5148   000D
        DECR    R0                              ; 5149   0010
        BPL     L_5144                          ; 514A   0223 0007

        DECR    R4                              ; 514C   0014
        BPL     L_5140                          ; 514D   0223 000E

L_514F:
        MVII    #$0190, R4                      ; 514F   02BC 0190
        MVII    #$015F, R0                      ; 5151   02B8 015F
        MVO     R4,     G_035D                  ; 5153   0244 035D

        JSR     R5,     X_FILL_ZERO             ; 5155   0004 0114 0338
        JSR     R5,     L_51FD                  ; 5158   0004 0150 01FD

        MVII    #$0020, R1                      ; 515B   02B9 0020
        SWAP    R1,     1                       ; 515D   0041
        MVO     R1,     .BTAB.3C                ; 515E   0241 023C
        MVO     R1,     .BTAB.78                ; 5160   0241 0278
        PSHR    R1                              ; 5162   0271
        SDBD                                    ; 5163   0001
        MVII    #$08F0, R1                      ; 5164   02B9 00F0 0008
        MVII    #$02A0, R4                      ; 5167   02BC 02A0
        MVII    #$0008, R3                      ; 5169   02BB 0008
        MVII    #$0001, R0                      ; 516B   02B8 0001
L_516D:
        SUBI    #$0050, R1                      ; 516D   0339 0050
        MVII    #$0009, R5                      ; 516F   02BD 0009
L_5171:
        MVO@    R1,     R4                      ; 5171   0261
        ADDR    R3,     R1                      ; 5172   00D9
        DECR    R5                              ; 5173   0015
        BPL     L_5171                          ; 5174   0223 0004

        DECR    R0                              ; 5176   0010
        BPL     L_516D                          ; 5177   0223 000B

        MVII    #$02F8, R1                      ; 5179   02B9 02F8
        MVO     R1,     G_016E                  ; 517B   0241 016E
        MVII    #$003C, R0                      ; 517D   02B8 003C
        MVII    #$02B4, R4                      ; 517F   02BC 02B4

        JSR     R5,     X_FILL_MEM              ; 5181   0004 0114 0341

        PULR    R1                              ; 5184   02B1
        MVO     R1,     .BTAB.CA                ; 5185   0241 02CA

        JSR     R5,     L_5245                  ; 5187   0004 0150 0245

        SDBD                                    ; 518A   0001
        MVII    #$0814, R2                      ; 518B   02BA 0014 0008
        MVII    #$0207, R4                      ; 518E   02BC 0207
        MVII    #$0008, R3                      ; 5190   02BB 0008
        MVI     G_0165, R1                      ; 5192   0281 0165
        SLL     R1,     1                       ; 5194   0049
        ADDR    R1,     R2                      ; 5195   00CA
        MVO@    R2,     R4                      ; 5196   0262
        ADDR    R3,     R2                      ; 5197   00DA
        MVO@    R2,     R4                      ; 5198   0262
        CLRR    R0                              ; 5199   01C0
        CMP     G_0161, R0                      ; 519A   0340 0161
        BEQ     L_51A8                          ; 519C   0204 000A

        ADDI    #$0007, R4                      ; 519E   02FC 0007
        SDBD                                    ; 51A0   0001
        MVII    #$0826, R2                      ; 51A1   02BA 0026 0008
        SUBR    R1,     R2                      ; 51A4   010A
        MVO@    R2,     R4                      ; 51A5   0262
        ADDR    R3,     R2                      ; 51A6   00DA
        MVO@    R2,     R4                      ; 51A7   0262

L_51A8:
        JSR     R5,     L_5219                  ; 51A8   0004 0150 0219

        MVII    #$0004, R0                      ; 51AB   02B8 0004
        MVO     R0,     G_016F                  ; 51AD   0240 016F
        SLL     R0,     1                       ; 51AF   0048
        SDBD                                    ; 51B0   0001
        MVII    #$5423, R1                      ; 51B1   02B9 0023 0054
        MVII    #$031D, R2                      ; 51B4   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 51B6   0004 0114 02B4

        MVI     .BTAB.D9,R3                     ; 51B9   0283 02D9
        TSTR    R3                              ; 51BB   009B
        BEQ     L_51D6                          ; 51BC   0204 0018

        JSR     R5,     L_5B00                  ; 51BE   0004 0158 0300

        ADDI    #$000C, R4                      ; 51C1   02FC 000C
        MVI@    R4,     R1                      ; 51C3   02A1
        SUBI    #$0008, R1                      ; 51C4   0339 0008
        NEGR    R1                              ; 51C6   0021
        MOVR    R1,     R0                      ; 51C7   0088
        SLL     R0,     2                       ; 51C8   004C
        SLL     R0,     1                       ; 51C9   0048
        MOVR    R0,     R2                      ; 51CA   0082
        SLL     R0,     2                       ; 51CB   004C
        SUBR    R2,     R0                      ; 51CC   0110
        MVO     R4,     G_01A3                  ; 51CD   0244 01A3
        SWAP    R0,     1                       ; 51CF   0040

        JSR     R5,     L_55B6                  ; 51D0   0004 0154 01B6
        JSR     R5,     L_5C75                  ; 51D3   0004 015C 0075
L_51D6:
        JSR     R5,     L_5FC3                  ; 51D6   0004 015C 03C3

        SDBD                                    ; 51D9   0001
        MVII    #$54EF, R1                      ; 51DA   02B9 00EF 0054
        MVO     R1,     .ISRVEC.0               ; 51DD   0241 0100
        SWAP    R1,     1                       ; 51DF   0041
        MVO     R1,     .ISRVEC.1               ; 51E0   0241 0101
        MVII    #$0002, R1                      ; 51E2   02B9 0002
        MVO     R1,     G_0160                  ; 51E4   0241 0160
        INCR    R1                              ; 51E6   0009
        MVII    #$015C, R5                      ; 51E7   02BD 015C
        MVO@    R1,     R5                      ; 51E9   0269
        MVII    #$0009, R1                      ; 51EA   02B9 0009
        MVO     R1,     G_01D5                  ; 51EC   0241 01D5
        MVO@    R1,     R5                      ; 51EE   0269
        DECR    R1                              ; 51EF   0011
        MVO@    R1,     R5                      ; 51F0   0269

        JSR     R5,     L_5269                  ; 51F1   0004 0150 0269

        PULR    R7                              ; 51F4   02B7

L_51F5:
        PSHR    R5                              ; 51F5   0275
        MVII    #$0200, R4                      ; 51F6   02BC 0200
        MVII    #$00F0, R0                      ; 51F8   02B8 00F0

        JSR     R5,     .EXEC.739               ; 51FA   0004 0114 0339

L_51FD:
        SDBD                                    ; 51FD   0001
        MVII    #$18A5, R1                      ; 51FE   02B9 00A5 0018
        MVII    #$0228, R4                      ; 5201   02BC 0228
        MVII    #$0008, R3                      ; 5203   02BB 0008
        MVII    #$0002, R0                      ; 5205   02B8 0002
L_5207:
        SUBI    #$0030, R1                      ; 5207   0339 0030
        MVII    #$0005, R2                      ; 5209   02BA 0005
L_520B:
        MVO@    R1,     R4                      ; 520B   0261
        ADDR    R3,     R1                      ; 520C   00D9
        DECR    R2                              ; 520D   0012
        BPL     L_520B                          ; 520E   0223 0004

        DECR    R0                              ; 5210   0010
        BPL     L_5207                          ; 5211   0223 000B

        SUBI    #$0030, R1                      ; 5213   0339 0030
        MVO@    R1,     R4                      ; 5215   0261
        ADDR    R3,     R1                      ; 5216   00D9
        MVO@    R1,     R4                      ; 5217   0261
        MOVR    R5,     R7                      ; 5218   00AF

L_5219:
        PSHR    R5                              ; 5219   0275
        MVII    #$0001, R0                      ; 521A   02B8 0001
        CLRR    R2                              ; 521C   01D2
        MVII    #$0008, R3                      ; 521D   02BB 0008
        SWAP    R3,     1                       ; 521F   0043
        PSHR    R3                              ; 5220   0273
        B       L_5225                          ; 5221   0200 0002

L_5223:
        ADDI    #$0009, R2                      ; 5223   02FA 0009
L_5225:
        ADDI    #$0206, R2                      ; 5225   02FA 0206
        MVII    #$0003, R4                      ; 5227   02BC 0003
        MVII    #$0164, R5                      ; 5229   02BD 0164
        SUBR    R0,     R5                      ; 522B   0105
        MVI@    R5,     R1                      ; 522C   02A9
        DECR    R1                              ; 522D   0011
L_522E:
        DECR    R1                              ; 522E   0011
        BMI     L_5238                          ; 522F   020B 0007

        DECR    R2                              ; 5231   0012
        MVO@    R3,     R2                      ; 5232   0253
        DECR    R4                              ; 5233   0014
        BMI     L_523D                          ; 5234   020B 0007
        B       L_522E                          ; 5236   0220 0009

L_5238:
        CLRR    R3                              ; 5238   01DB
        MVII    #$0004, R1                      ; 5239   02B9 0004
        B       L_522E                          ; 523B   0220 000E

L_523D:
        DECR    R0                              ; 523D   0010
        BMI     L_5244                          ; 523E   020B 0004

        CLRR    R2                              ; 5240   01D2
        PULR    R3                              ; 5241   02B3
        B       L_5223                          ; 5242   0220 0020
L_5244:
        PULR    R7                              ; 5244   02B7

L_5245:
        PSHR    R5                              ; 5245   0275
        MVII    #$02CB, R4                      ; 5246   02BC 02CB
        MVII    #$000F, R0                      ; 5248   02B8 000F

        JSR     R5,     X_FILL_ZERO             ; 524A   0004 0114 0338
        JSR     R5,     L_5B00                  ; 524D   0004 0158 0300

        MVII    #$0004, R0                      ; 5250   02B8 0004
L_5252:
        MVII    #$02CB, R1                      ; 5252   02B9 02CB
        SDBD                                    ; 5254   0001
        MVII    #$0828, R2                      ; 5255   02BA 0028 0008
        MVI@    R4,     R3                      ; 5258   02A3
        TSTR    R3                              ; 5259   009B
        BEQ     L_5263                          ; 525A   0204 0007

        SLL     R3,     1                       ; 525C   004B
        SLL     R3,     2                       ; 525D   004F
        ADDR    R3,     R2                      ; 525E   00DA
        MVI@    R4,     R3                      ; 525F   02A3
        ADDR    R3,     R1                      ; 5260   00D9
        MVO@    R2,     R1                      ; 5261   024A
        INCR    R7                              ; 5262   000F

L_5263:
        INCR    R4                              ; 5263   000C
L_5264:
        INCR    R4                              ; 5264   000C
        DECR    R0                              ; 5265   0010
        BPL     L_5252                          ; 5266   0223 0015
        PULR    R7                              ; 5268   02B7

L_5269:
        JSR     R4,     L_5276                  ; 5269   0004 0050 0276
        DECLE   $0079,  $0052,  $0000,  $0000   ; 526C   0079 0052 0000 0000
        DECLE   $00E2,  $0052,  $0000,  $0000   ; 5270   00E2 0052 0000 0000
        DECLE   $0000,  $0000                   ; 5274   0000 0000
L_5276:
        MVO     R4,     G_035D                  ; 5276   0244 035D
        MOVR    R5,     R7                      ; 5278   00AF

        PSHR    R5                              ; 5279   0275
        CMP     G_0165, R1                      ; 527A   0341 0165
        BNEQ    L_52E1                          ; 527C   020C 0063

        MVI     G_01B0, R3                      ; 527E   0283 01B0
        TSTR    R3                              ; 5280   009B
        BNEQ    L_52E1                          ; 5281   020C 005E

        CMP     G_01EB, R3                      ; 5283   0343 01EB
        BEQ     L_528D                          ; 5285   0204 0006

        TSTR    R0                              ; 5287   0080
        BPL     L_5298                          ; 5288   0203 000E

        MVO     R3,     G_0321                  ; 528A   0243 0321
        PULR    R7                              ; 528C   02B7

L_528D:
        MVII    #$0004, R1                      ; 528D   02B9 0004
        MVO     R1,     G_035B                  ; 528F   0241 035B
        MVO     R1,     G_034B                  ; 5291   0241 034B
        MVO     R1,     G_01EB                  ; 5293   0241 01EB
        MVO     R1,     G_0160                  ; 5295   0241 0160
        PULR    R7                              ; 5297   02B7

L_5298:
        MVII    #$031D, R1                      ; 5298   02B9 031D

        JSR     R5,     .EXEC.777               ; 529A   0004 0114 0377

        ANDI    #$000F, R0                      ; 529D   03B8 000F
        MOVR    R2,     R4                      ; 529F   0094
        MOVR    R3,     R5                      ; 52A0   009D
        MVII    #$0016, R3                      ; 52A1   02BB 0016
        MVII    #$008C, R2                      ; 52A3   02BA 008C
        CMPI    #$0002, R0                      ; 52A5   0378 0002
        BEQ     L_52DA                          ; 52A7   0204 0031
        BGT     L_52AE                          ; 52A9   020E 0003

        MOVR    R5,     R3                      ; 52AB   00AB
        B       L_52DA                          ; 52AC   0200 002C

L_52AE:
        CMPI    #$0006, R0                      ; 52AE   0378 0006
        BGT     L_52BA                          ; 52B0   020E 0008
        BLT     L_52B7                          ; 52B2   0205 0003

        MVII    #$0054, R2                      ; 52B4   02BA 0054
        INCR    R7                              ; 52B6   000F

L_52B7:
        MOVR    R4,     R2                      ; 52B7   00A2
L_52B8:
        B       L_52DA                          ; 52B8   0200 0020

L_52BA:
        CMPI    #$000A, R0                      ; 52BA   0378 000A
        BGT     L_52CB                          ; 52BC   020E 000D
        BLT     L_52C6                          ; 52BE   0205 0006

        MVII    #$0054, R2                      ; 52C0   02BA 0054
        MVII    #$004E, R3                      ; 52C2   02BB 004E
        B       L_52DA                          ; 52C4   0200 0014

L_52C6:
        MVII    #$0054, R2                      ; 52C6   02BA 0054
        MOVR    R5,     R3                      ; 52C8   00AB
        B       L_52DA                          ; 52C9   0200 000F

L_52CB:
        CMPI    #$000E, R0                      ; 52CB   0378 000E
        BGT     L_52D9                          ; 52CD   020E 000A
        BLT     L_52D5                          ; 52CF   0205 0004

        MVII    #$004E, R3                      ; 52D1   02BB 004E
        B       L_52DA                          ; 52D3   0200 0005

L_52D5:
        MOVR    R4,     R2                      ; 52D5   00A2
        MVII    #$004E, R3                      ; 52D6   02BB 004E
        INCR    R7                              ; 52D8   000F

L_52D9:
        MOVR    R5,     R3                      ; 52D9   00AB
L_52DA:
        SWAP    R2,     1                       ; 52DA   0042
        XORR    R3,     R2                      ; 52DB   01DA
        MVII    #$003F, R3                      ; 52DC   02BB 003F

        JSR     R5,     .EXEC.9A1               ; 52DE   0004 0118 01A1

L_52E1:
        PULR    R7                              ; 52E1   02B7

        PSHR    R5                              ; 52E2   0275
        CMP     G_0165, R1                      ; 52E3   0341 0165
        BNEQ    L_5310                          ; 52E5   020C 0029

        MVI     G_01B0, R0                      ; 52E7   0280 01B0
        ADD     G_01D5, R0                      ; 52E9   02C0 01D5
        BNEQ    L_5310                          ; 52EB   020C 0023

        JSR     R5,     .EXEC.772               ; 52ED   0004 0114 0372

        MVI     G_0107, R1                      ; 52F0   0281 0107
        ANDI    #$00E0, R1                      ; 52F2   03B9 00E0
        BNEQ    L_5310                          ; 52F4   020C 001A

        MVII    #$0004, R3                      ; 52F6   02BB 0004
        SUBI    #$0071, R2                      ; 52F8   033A 0071
        BPL     L_52FD                          ; 52FA   0203 0001

        NEGR    R3                              ; 52FC   0023
L_52FD:
        ANDI    #$00FF, R3                      ; 52FD   03BB 00FF
        SWAP    R3,     1                       ; 52FF   0043
        MVII    #$031F, R5                      ; 5300   02BD 031F
        MVII    #$032F, R4                      ; 5302   02BC 032F
        MVI@    R5,     R1                      ; 5304   02A9
        MVO@    R1,     R4                      ; 5305   0261
        MVI@    R5,     R1                      ; 5306   02A9
        SUBI    #$0200, R1                      ; 5307   0339 0200
        MVO@    R1,     R4                      ; 5309   0261
        MVO@    R3,     R4                      ; 530A   0263
        MVO     R4,     G_01D5                  ; 530B   0244 01D5

        JSR     R5,     L_5F8C                  ; 530D   0004 015C 038C

L_5310:
        PULR    R7                              ; 5310   02B7

        DECLE   $0000,  $0000,  $0000,  $00F0   ; 5311   0000 0000 0000 00F0
        DECLE   $00FF,  $00FC,  $0078,  $00F0   ; 5315   00FF 00FC 0078 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5319   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $003C   ; 531D   0000 0000 0000 003C
        DECLE   $000F,  $003F,  $00FF,  $00FF   ; 5321   000F 003F 00FF 00FF
        DECLE   $00FF,  $003F,  $003F,  $0078   ; 5325   00FF 003F 003F 0078
        DECLE   $007C,  $006C,  $00EE,  $00CE   ; 5329   007C 006C 00EE 00CE
        DECLE   $00C6,  $00A6,  $00E9,  $000F   ; 532D   00C6 00A6 00E9 000F
        DECLE   $000F,  $003F,  $007F,  $00FF   ; 5331   000F 003F 007F 00FF
        DECLE   $00FF,  $00FF,  $003F           ; 5335   00FF 00FF 003F

        SARC    R0,     1                       ; 5338   0078
        SARC    R0,     2                       ; 5339   007C
        SAR     R0,     2                       ; 533A   006C
        ADDR    R5,     R6                      ; 533B   00EE
        ADDR    R0,     R6                      ; 533C   00C6
        ADDR    R0,     R6                      ; 533D   00C6
        ADDR    R0,     R6                      ; 533E   00C6
        MOVR    R5,     R1                      ; 533F   00A9
        ADDR    R5,     R7                      ; 5340   00EF

        DECLE   $000F,  $003F,  $00FF,  $00FF   ; 5341   000F 003F 00FF 00FF
        DECLE   $00FF,  $003F,  $007F,  $0070   ; 5345   00FF 003F 007F 0070
        DECLE   $0060,  $0060,  $0060,  $0060   ; 5349   0060 0060 0060 0060
        DECLE   $0060,  $0060,  $0091,  $00F1   ; 534D   0060 0060 0091 00F1
        DECLE   $000F,  $003F,  $00FF,  $00FF   ; 5351   000F 003F 00FF 00FF
        DECLE   $00FF,  $00FF,  $003F           ; 5355   00FF 00FF 003F

        RSWD    R0                              ; 5358   0038
        SARC    R0,     2                       ; 5359   007C
        SARC    R0,     2                       ; 535A   007C
        SAR     R2,     2                       ; 535B   006E
        ADDR    R4,     R6                      ; 535C   00E6
        ADDR    R0,     R6                      ; 535D   00C6
        ADDR    R0,     R6                      ; 535E   00C6
        MOVR    R5,     R1                      ; 535F   00A9
        ADDR    R5,     R7                      ; 5360   00EF

        DECLE   $00E0,  $00FC,  $00FE,  $00FF   ; 5361   00E0 00FC 00FE 00FF
        DECLE   $00FF,  $00FE,  $00FC,  $007E   ; 5365   00FF 00FE 00FC 007E
        DECLE   $001E,  $000E,  $0007,  $0007   ; 5369   001E 000E 0007 0007
        DECLE   $0003,  $0003,  $0005,  $0007   ; 536D   0003 0003 0005 0007
        DECLE   $00E0,  $00FC,  $00FE,  $00FF   ; 5371   00E0 00FC 00FE 00FF
        DECLE   $00FF,  $00FE,  $00FC,  $0078   ; 5375   00FF 00FE 00FC 0078
        DECLE   $0038,  $0018,  $0018,  $0018   ; 5379   0038 0018 0018 0018
        DECLE   $0018,  $0018,  $0024,  $003E   ; 537D   0018 0018 0024 003E
        DECLE   $00E0,  $00FC,  $00FE,  $00FF   ; 5381   00E0 00FC 00FE 00FF
        DECLE   $00FF,  $00FE,  $00FE,  $007E   ; 5385   00FF 00FE 00FE 007E
        DECLE   $0036,  $0036                   ; 5389   0036 0036

        RRC     R3,     2                       ; 538B   0077
        SLR     R3,     1                       ; 538C   0063
        ADDR    R0,     R3                      ; 538D   00C3
        ADDR    R0,     R3                      ; 538E   00C3
        NEGR    R5                              ; 538F   0025
        ADDR    R4,     R7                      ; 5390   00E7

        DECLE   $00E0,  $00FC,  $00FE,  $00FF   ; 5391   00E0 00FC 00FE 00FF
        DECLE   $00FF,  $00FE,  $00FE,  $007E   ; 5395   00FF 00FE 00FE 007E
        DECLE   $0036,  $0036,  $0067,  $0067   ; 5399   0036 0036 0067 0067
        DECLE   $0093,  $00F3,  $0005,  $0007   ; 539D   0093 00F3 0005 0007
        DECLE   $0000,  $0000,  $001E,  $003F   ; 53A1   0000 0000 001E 003F
        DECLE   $007F,  $007F,  $007C,  $0018   ; 53A5   007F 007F 007C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53A9   0000 0000 0000 0000
        DECLE   $0000,  $0070,  $0000,  $0000   ; 53AD   0000 0070 0000 0000
        DECLE   $0000,  $0018,  $0018,  $00FF   ; 53B1   0000 0018 0018 00FF
        DECLE   $0018,  $0018                   ; 53B5   0018 0018
.GFX_LIST_53B7:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53B7  CART PIC #00
        DECLE   $001C,  $007E,  $000E,  $0000   ; 53BB  
        DECLE   $0000,  $0000,  $00EE,  $00AA   ; 53BF   0000 0000 00EE 00AA
        DECLE   $00AA,  $00AA,  $00EE,  $0000   ; 53C3   00AA 00AA 00EE 0000
        DECLE   $0000,  $0001                   ; 53C7   0000 0001

        MOVR    R0,     R3                      ; 53C9   0083
        ADDR    R0,     R7                      ; 53CA   00C7

        DECLE   $003C,  $007F,  $00FF,  $00FF   ; 53CB   003C 007F 00FF 00FF
        DECLE   $00FF,  $00C0,  $00F0,  $00F0   ; 53CF   00FF 00C0 00F0 00F0
        DECLE   $00F8,  $00FE,  $0000,  $0000   ; 53D3   00F8 00FE 0000 0000
        DECLE   $0000,  $000D,  $003F,  $0000   ; 53D7   0000 000D 003F 0000
        DECLE   $0000,  $0000,  $00F8,  $00FF   ; 53DB   0000 0000 00F8 00FF
        DECLE   $0000,  $000C,  $003F,  $007F   ; 53DF   0000 000C 003F 007F
        DECLE   $00FF,  $0000,  $000F,  $007F   ; 53E3   00FF 0000 000F 007F
        DECLE   $0000,  $00E0,  $00FF,  $0000   ; 53E7   0000 00E0 00FF 0000
        DECLE   $0000,  $007E,  $0000,  $0000   ; 53EB   0000 007E 0000 0000
        DECLE   $000F,  $003F,  $00FF,  $00FF   ; 53EF   000F 003F 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0080   ; 53F3   00FF 00FF 00FF 0080
        DECLE   $00E0,  $00FF,  $0000,  $0000   ; 53F7   00E0 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53FF   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0000,  $00FE   ; 5403   0000 0007 0000 00FE
        DECLE   $00FF,  $0000,  $0000,  $00E7   ; 5407   00FF 0000 0000 00E7
        DECLE   $0000,  $0000,  $00E0,  $0003   ; 540B   0000 0000 00E0 0003
        DECLE   $000F,  $00FF,  $00FF,  $00FF   ; 540F   000F 00FF 00FF 00FF
        DECLE   $00FF,  $00F8,  $00FE,  $00FF   ; 5413   00FF 00F8 00FE 00FF
        DECLE   $0000,  $0000,  $00F0,  $0000   ; 5417   0000 0000 00F0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 541B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 541F   0000 0000 0000 0007
        DECLE   $0013,  $001A,  $00D0,  $0054   ; 5423   0013 001A 00D0 0054
        DECLE   $0000,  $0070,  $0000,  $0038   ; 5427   0000 0070 0000 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 542B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 542F   0000 0000 0000 0000

        MOVR    R4,     R5                      ; 5433   00A5
        COMR    R2                              ; 5434   001A
        ADDR    R3,     R7                      ; 5435   00DF

        DECLE   $0054,  $0000,  $0090,  $0000   ; 5436   0054 0000 0090 0000
        DECLE   $0058,  $0000,  $0000,  $0000   ; 543A   0058 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 543E   0000 0001 0000 0000
        DECLE   $0000,  $0006,  $001A,  $00B6   ; 5442   0000 0006 001A 00B6
        DECLE   $0054,  $0000,  $00B0,  $0000   ; 5446   0054 0000 00B0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 544A   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $007F,  $0000   ; 544E   0000 00FF 007F 0000
        DECLE   $0000                           ; 5452   0000

        MOVR    R0,     R7                      ; 5453   0087

        RSWD    R2                              ; 5454   003A
        ADDR    R0,     R7                      ; 5455   00C7

        DECLE   $0054,  $0000,  $0000,  $0000   ; 5456   0054 0000 0000 0000
        DECLE   $0026,  $0000,  $0000,  $0000   ; 545A   0026 0000 0000 0000
        DECLE   $0001,  $00FF,  $007F,  $0000   ; 545E   0001 00FF 007F 0000
        DECLE   $0000,  $001A,  $0023,  $00E6   ; 5462   0000 001A 0023 00E6
        DECLE   $0054,  $0000,  $0000,  $0000   ; 5466   0054 0000 0000 0000
        DECLE   $0026,  $0000,  $0000,  $0000   ; 546A   0026 0000 0000 0000
        DECLE   $0000,  $00FF,  $007F,  $0000   ; 546E   0000 00FF 007F 0000
        DECLE   $0000                           ; 5472   0000

        TSTR    R0                              ; 5473   0080
        RSWD    R2                              ; 5474   003A
        MOVR    R5,     R7                      ; 5475   00AF

        DECLE   $0054,  $0000,  $0000,  $0000   ; 5476   0054 0000 0000 0000
        DECLE   $002A,  $0000,  $0000,  $0000   ; 547A   002A 0000 0000 0000
        DECLE   $0000,  $00FF,  $007F,  $0000   ; 547E   0000 00FF 007F 0000
        DECLE   $0000,  $0040,  $003B,  $00A1   ; 5482   0000 0040 003B 00A1
        DECLE   $0054,  $0000,  $0000,  $0000   ; 5486   0054 0000 0000 0000
        DECLE   $0026,  $0000,  $0000,  $0000   ; 548A   0026 0000 0000 0000
        DECLE   $0000,  $000F,  $0000,  $0000   ; 548E   0000 000F 0000 0000
        DECLE   $0000,  $0040,  $003B,  $00A8   ; 5492   0000 0040 003B 00A8
        DECLE   $0054,  $0000,  $0000,  $0000   ; 5496   0054 0000 0000 0000
        DECLE   $0026,  $0000,  $0000,  $0000   ; 549A   0026 0000 0000 0000
        DECLE   $0000,  $00FF,  $007F,  $0000   ; 549E   0000 00FF 007F 0000
        DECLE   $0000,  $005E,  $005D,  $0004   ; 54A2   0000 005E 005D 0004
        DECLE   $0002,  $0000,  $0000,  $0000   ; 54A6   0002 0000 0000 0000
        DECLE   $00C3,  $005C,  $0004,  $000A   ; 54AA   00C3 005C 0004 000A
        DECLE   $0000,  $0000,  $0000,  $00EB   ; 54AE   0000 0000 0000 00EB
        DECLE   $005B,  $0001,  $0012,  $0000   ; 54B2   005B 0001 0012 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54B6   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $000A,  $02D0   ; 54BA   0001 0001 000A 02D0
        DECLE   $015B,  $013E,  $005D,  $01B4   ; 54BE   015B 013E 005D 01B4
        DECLE   $015B,  $03B4,  $005B,  $03B4   ; 54C2   015B 03B4 005B 03B4
        DECLE   $015B,  $01DE,  $005B,  $00DE   ; 54C6   015B 01DE 005B 00DE
        DECLE   $005B,  $0001,  $0001           ; 54CA   005B 0001 0001

        EIS                                     ; 54CD   0002
        ADDR    R4,     R7                      ; 54CE   00E7

        DECLE   $005D,  $005B,  $005E,  $005B   ; 54CF   005D 005B 005E 005B
        DECLE   $005E,  $00FF,  $0000,  $0007   ; 54D3   005E 00FF 0000 0007
        DECLE   $0020,  $005E,  $01ED,  $015C   ; 54D7   0020 005E 01ED 015C
        DECLE   $03ED,  $005C,  $03ED,  $015C   ; 54DB   03ED 005C 03ED 015C
        DECLE   $0000,  $0000,  $0012,  $005B   ; 54DF   0000 0000 0012 005B
        DECLE   $0001,  $0014,  $0000,  $0000   ; 54E3   0001 0014 0000 0000
        DECLE   $0000,  $008E,  $005D,  $0001   ; 54E7   0000 008E 005D 0001

        DECR    R3                              ; 54EB   0013
        EIS                                     ; 54EC   0002
        DECR    R5                              ; 54ED   0015
        SLLC    R1,     2                       ; 54EE   005D
        PSHR    R5                              ; 54EF   0275
        MVI     G_0102, R1                      ; 54F0   0281 0102
        SWAP    R1,     1                       ; 54F2   0041
        SWAP    R1,     1                       ; 54F3   0041
        BMI     L_575E                          ; 54F4   020B 0268

        DECR    R1                              ; 54F6   0011
        BEQ     L_5737                          ; 54F7   0204 023E

        CMPI    #$0003, R1                      ; 54F9   0379 0003
        BEQ     L_5582                          ; 54FB   0204 0085

        MVI     .STIC.C.0,R2                    ; 54FD   0282 0018
        ANDI    #$0100, R2                      ; 54FF   03BA 0100
        SWAP    R2,     1                       ; 5501   0042
        MVO     R2,     G_01CB                  ; 5502   0242 01CB
        MVI     G_032F, R2                      ; 5504   0282 032F
        ADD     G_0331, R2                      ; 5506   02C2 0331
        MVO     R2,     G_032F                  ; 5508   0242 032F
        SWAP    R2,     1                       ; 550A   0042
        ANDI    #$00FF, R2                      ; 550B   03BA 00FF
        XORI    #$0300, R2                      ; 550D   03FA 0300
        MVO     R2,     .STIC.X.2               ; 550F   0242 0002
        MVII    #$0028, R5                      ; 5511   02BD 0028
        MVII    #$015C, R4                      ; 5513   02BC 015C
        MVI@    R4,     R3                      ; 5515   02A3
        MVO@    R3,     R5                      ; 5516   026B
        INCR    R5                              ; 5517   000D
        MVI@    R4,     R3                      ; 5518   02A3
        MVO@    R3,     R5                      ; 5519   026B
        INCR    R5                              ; 551A   000D
        MVI@    R4,     R3                      ; 551B   02A3
        MVO@    R3,     R5                      ; 551C   026B
        DECR    R1                              ; 551D   0011
        BEQ     L_559D                          ; 551E   0204 007D
        B       L_575E                          ; 5520   0200 023C

L_5522:
        SDBD                                    ; 5522   0001
        MVII    #$3830, R4                      ; 5523   02BC 0030 0038
        MVII    #$00C0, R0                      ; 5526   02B8 00C0

        JSR     R5,     X_FILL_ZERO             ; 5528   0004 0114 0338

        SDBD                                    ; 552B   0001
        MVII    #$3833, R4                      ; 552C   02BC 0033 0038
        MVII    #$0007, R2                      ; 552F   02BA 0007
        MVII    #$0001, R1                      ; 5531   02B9 0001
        MVII    #$0007, R0                      ; 5533   02B8 0007
L_5535:
        MVO@    R1,     R4                      ; 5535   0261
        SLL     R1,     1                       ; 5536   0049
        ADDR    R2,     R4                      ; 5537   00D4
        DECR    R0                              ; 5538   0010
        BPL     L_5535                          ; 5539   0223 0005

        JSR     R5,     L_5808                  ; 553B   0004 0158 0008
        JSR     R5,     L_5820                  ; 553E   0004 0158 0020

        MVI     G_015F, R1                      ; 5541   0281 015F
        TSTR    R1                              ; 5543   0089
        BEQ     L_5563                          ; 5544   0204 001D

        SDBD                                    ; 5546   0001
        MVII    #$53BE, R4                      ; 5547   02BC 00BE 0053
        SDBD                                    ; 554A   0001
        MVII    #$3810, R5                      ; 554B   02BD 0010 0038
        MVII    #$0008, R2                      ; 554E   02BA 0008
        NEGR    R2                              ; 5550   0022
        MVII    #$0003, R0                      ; 5551   02B8 0003
        ADDI    #$0008, R4                      ; 5553   02FC 0008
L_5555:
        MVII    #$0007, R3                      ; 5555   02BB 0007
        ADDR    R2,     R4                      ; 5557   00D4
L_5558:
        MVI@    R4,     R1                      ; 5558   02A1
        MVO@    R1,     R5                      ; 5559   0269
        DECR    R3                              ; 555A   0013
        BPL     L_5558                          ; 555B   0223 0004

        DECR    R0                              ; 555D   0010
        BPL     L_5555                          ; 555E   0223 000A

        CLRR    R1                              ; 5560   01C9
        MVO     R1,     G_015F                  ; 5561   0241 015F
L_5563:
        MVII    #$0003, R1                      ; 5563   02B9 0003
        MVO     R1,     G_0160                  ; 5565   0241 0160
        B       L_558C                          ; 5567   0200 0023

L_5569:
        MVI     G_01B7, R3                      ; 5569   0283 01B7
        TSTR    R3                              ; 556B   009B
        BEQ     L_5573                          ; 556C   0204 0005

        JSR     R5,     L_5F07                  ; 556E   0004 015C 0307

        B       L_558C                          ; 5571   0200 0019

L_5573:
        MVI     G_0192, R1                      ; 5573   0281 0192
        SARC    R1,     1                       ; 5575   0079
        MVO     R1,     G_0192                  ; 5576   0241 0192
        BNC     L_558C                          ; 5578   0209 0012
        ADD     G_0191, R7                      ; 557A   02C7 0191
        B       L_5618                          ; 557C   0200 009A
        B       L_568D                          ; 557E   0200 010D
        B       L_570E                          ; 5580   0200 018C

L_5582:
        MVO     R1,     G_0102                  ; 5582   0241 0102
        MVI     G_0160, R2                      ; 5584   0282 0160
        CMPI    #$0002, R2                      ; 5586   037A 0002
        BGT     L_5569                          ; 5588   022E 0020
        BEQ     L_5522                          ; 558A   0224 0069
L_558C:
        J       .EXEC.14E                       ; 558C   0004 0310 014E

L_558F:
        SARC    R1,     1                       ; 558F   0079
        MVO     R1,     G_0192                  ; 5590   0241 0192

        JSR     R5,     L_5808                  ; 5592   0004 0158 0008
        JSR     R5,     L_51FD                  ; 5595   0004 0150 01FD

        CLRR    R1                              ; 5598   01C9
        MVO     R1,     G_0198                  ; 5599   0241 0198
        B       L_558C                          ; 559B   0220 0010

L_559D:
        MVI     G_01A4, R1                      ; 559D   0281 01A4
        SARC    R1,     1                       ; 559F   0079
        MVO     R1,     G_01A4                  ; 55A0   0241 01A4
        BNC     L_5609                          ; 55A2   0209 0065

        MVI     G_01A3, R1                      ; 55A4   0281 01A3
        TSTR    R1                              ; 55A6   0089
        BEQ     L_5609                          ; 55A7   0204 0060

        MVI     G_01A5, R0                      ; 55A9   0280 01A5
        SWAP    R0,     1                       ; 55AB   0040
        MVI     G_01A1, R1                      ; 55AC   0281 01A1
        SARC    R1,     1                       ; 55AE   0079
        BC      L_55DF                          ; 55AF   0201 002E

        JSR     R5,     L_55B6                  ; 55B1   0004 0154 01B6

        B       L_5609                          ; 55B4   0200 0053

L_55B6:
        MVII    #$0010, R3                      ; 55B6   02BB 0010
        SWAP    R3,     1                       ; 55B8   0043
        MVI     G_0347, R1                      ; 55B9   0281 0347
        ADDR    R0,     R1                      ; 55BB   00C1
        SWAP    R1,     1                       ; 55BC   0041
        ANDI    #$00FF, R1                      ; 55BD   03B9 00FF
        CMPI    #$00D0, R1                      ; 55BF   0379 00D0
        BLE     L_55D5                          ; 55C1   0206 0012

        CLRR    R1                              ; 55C3   01C9
        MVO     R1,     G_01A3                  ; 55C4   0241 01A3
        MVO     R1,     G_0357                  ; 55C6   0241 0357
        MVI     G_010F, R1                      ; 55C8   0281 010F
        ANDI    #$0002, R1                      ; 55CA   03B9 0002
        BEQ     L_55DE                          ; 55CC   0204 0010

        MVI     G_0327, R1                      ; 55CE   0281 0327
        SUBI    #$0300, R1                      ; 55D0   0339 0300
        MVO     R1,     G_0327                  ; 55D2   0241 0327
        MOVR    R5,     R7                      ; 55D4   00AF

L_55D5:
        SWAP    R1,     1                       ; 55D5   0041
        MVO     R1,     G_0347                  ; 55D6   0241 0347
        SUBR    R3,     R1                      ; 55D8   0119
        MVO     R1,     G_034F                  ; 55D9   0241 034F
        SUBR    R3,     R1                      ; 55DB   0119
        MVO     R1,     G_0357                  ; 55DC   0241 0357
L_55DE:
        MOVR    R5,     R7                      ; 55DE   00AF

L_55DF:
        MVII    #$0010, R3                      ; 55DF   02BB 0010
        SWAP    R3,     1                       ; 55E1   0043
        MVI     G_0357, R1                      ; 55E2   0281 0357
        SUBR    R0,     R1                      ; 55E4   0101
        MVO     R1,     G_0357                  ; 55E5   0241 0357
        ADDR    R3,     R1                      ; 55E7   00D9
        MVO     R1,     G_034F                  ; 55E8   0241 034F
        ADDR    R3,     R1                      ; 55EA   00D9
        MVO     R1,     G_0347                  ; 55EB   0241 0347
        SWAP    R1,     1                       ; 55ED   0041
        ANDI    #$00FF, R1                      ; 55EE   03B9 00FF
        CMPI    #$00D0, R1                      ; 55F0   0379 00D0
        BGT     L_55F8                          ; 55F2   020E 0004

        CMPI    #$0010, R1                      ; 55F4   0379 0010
        BGE     L_5609                          ; 55F6   020D 0011

L_55F8:
        CLRR    R1                              ; 55F8   01C9
        MVO     R1,     G_01A3                  ; 55F9   0241 01A3
        MVO     R1,     G_0347                  ; 55FB   0241 0347
        MVI     G_010F, R1                      ; 55FD   0281 010F
        ANDI    #$0002, R1                      ; 55FF   03B9 0002
        BEQ     L_5609                          ; 5601   0204 0006

        MVI     G_0327, R1                      ; 5603   0281 0327
        ADDI    #$0300, R1                      ; 5605   02F9 0300
        MVO     R1,     G_0327                  ; 5607   0241 0327
L_5609:
        MVI     G_034F, R1                      ; 5609   0281 034F
        MVI     G_01B8, R2                      ; 560B   0282 01B8
        TSTR    R2                              ; 560D   0092
        BNEQ    L_5616                          ; 560E   020C 0006

        MVI     G_01CA, R2                      ; 5610   0282 01CA
        SWAP    R2,     1                       ; 5612   0042
        SUBR    R2,     R1                      ; 5613   0111
        MVO     R1,     G_033F                  ; 5614   0241 033F
L_5616:
        B       L_575E                          ; 5616   0200 0146

L_5618:
        MVI     G_0198, R1                      ; 5618   0281 0198
        TSTR    R1                              ; 561A   0089
        BNEQ    L_558F                          ; 561B   022C 008D

        CMP     G_01A1, R1                      ; 561D   0341 01A1
        BNEQ    L_5654                          ; 561F   020C 0033

        MVII    #$0004, R5                      ; 5621   02BD 0004
        SDBD                                    ; 5623   0001
        MVII    #$3872, R2                      ; 5624   02BA 0072 0038
        MVII    #$0008, R4                      ; 5627   02BC 0008
L_5629:
        INCR    R2                              ; 5629   000A
        MVII    #$0003, R0                      ; 562A   02B8 0003
        MOVR    R2,     R1                      ; 562C   0091
        ADDR    R4,     R2                      ; 562D   00E2
        MVI@    R1,     R3                      ; 562E   028B
        RRC     R3,     1                       ; 562F   0073
        MVO@    R3,     R1                      ; 5630   024B
        MOVR    R2,     R1                      ; 5631   0091
        MVI@    R1,     R3                      ; 5632   028B
        BNC     L_5637                          ; 5633   0209 0002

        XORI    #$0100, R3                      ; 5635   03FB 0100
L_5637:
        ADDR    R4,     R2                      ; 5637   00E2
        RRC     R3,     1                       ; 5638   0073
        MVO@    R3,     R1                      ; 5639   024B
        MOVR    R2,     R1                      ; 563A   0091
        MVI@    R1,     R3                      ; 563B   028B
        BNC     L_5640                          ; 563C   0209 0002

        XORI    #$0100, R3                      ; 563E   03FB 0100
L_5640:
        DECR    R0                              ; 5640   0010
        BPL     L_5637                          ; 5641   0223 000B

        SUBI    #$0028, R2                      ; 5643   033A 0028
        RRC     R3,     1                       ; 5645   0073
        MVO@    R3,     R1                      ; 5646   024B
        MVI@    R2,     R3                      ; 5647   0293
        BNC     L_564D                          ; 5648   0209 0003

        XORI    #$0080, R3                      ; 564A   03FB 0080
        MVO@    R3,     R2                      ; 564C   0253
L_564D:
        DECR    R5                              ; 564D   0015
        BPL     L_5629                          ; 564E   0223 0026

        MVII    #$0001, R1                      ; 5650   02B9 0001
        B       L_571C                          ; 5652   0200 00C8

L_5654:
        MVII    #$0010, R4                      ; 5654   02BC 0010
        NEGR    R4                              ; 5656   0024
        MVII    #$0004, R5                      ; 5657   02BD 0004
        SDBD                                    ; 5659   0001
        MVII    #$389A, R2                      ; 565A   02BA 009A 0038
        PSHR    R2                              ; 565D   0272
L_565E:
        PULR    R2                              ; 565E   02B2
        INCR    R2                              ; 565F   000A
        PSHR    R2                              ; 5660   0272
        MVII    #$0001, R3                      ; 5661   02BB 0001
        PSHR    R3                              ; 5663   0273
        MOVR    R2,     R1                      ; 5664   0091
        SUBI    #$0008, R2                      ; 5665   033A 0008
        MVI@    R2,     R3                      ; 5667   0293
        SWAP    R3,     1                       ; 5668   0043
        XOR@    R1,     R3                      ; 5669   03CB
        RLC     R3,     1                       ; 566A   0053
        GSWD    R0                              ; 566B   0030
        SWAP    R3,     1                       ; 566C   0043
        MVO@    R3,     R2                      ; 566D   0253
L_566E:
        ADDR    R4,     R2                      ; 566E   00E2
        ADDR    R4,     R1                      ; 566F   00E1
        MVI@    R2,     R3                      ; 5670   0293
        SWAP    R3,     1                       ; 5671   0043
        XOR@    R1,     R3                      ; 5672   03CB
        RSWD    R0                              ; 5673   0038
        RLC     R3,     1                       ; 5674   0053
        GSWD    R0                              ; 5675   0030
        MVO@    R3,     R1                      ; 5676   024B
        SWAP    R3,     1                       ; 5677   0043
        MVO@    R3,     R2                      ; 5678   0253
        PULR    R3                              ; 5679   02B3
        DECR    R3                              ; 567A   0013
        PSHR    R3                              ; 567B   0273
        BPL     L_566E                          ; 567C   0223 000F

        PULR    R3                              ; 567E   02B3
        PULR    R2                              ; 567F   02B2
        MVI@    R2,     R3                      ; 5680   0293
        RSWD    R0                              ; 5681   0038
        RLC     R3,     1                       ; 5682   0053
        MVO@    R3,     R2                      ; 5683   0253
        PSHR    R2                              ; 5684   0272
        DECR    R5                              ; 5685   0015
        BPL     L_565E                          ; 5686   0223 0029

        PULR    R2                              ; 5688   02B2
        MVII    #$0001, R1                      ; 5689   02B9 0001
        B       L_572E                          ; 568B   0200 00A1

L_568D:
        MVI     G_0198, R1                      ; 568D   0281 0198
        TSTR    R1                              ; 568F   0089
        BNEQ    L_558F                          ; 5690   022C 0102

        CMP     G_01A1, R1                      ; 5692   0341 01A1
        BNEQ    L_56D5                          ; 5694   020C 003F

        MVII    #$0004, R5                      ; 5696   02BD 0004
        SDBD                                    ; 5698   0001
        MVII    #$3872, R2                      ; 5699   02BA 0072 0038
        MVII    #$0008, R4                      ; 569C   02BC 0008
L_569E:
        INCR    R2                              ; 569E   000A
        MVII    #$0003, R0                      ; 569F   02B8 0003
        MOVR    R2,     R1                      ; 56A1   0091
        ADDR    R4,     R2                      ; 56A2   00E2
        MVI@    R1,     R3                      ; 56A3   028B
        RRC     R3,     2                       ; 56A4   0077
        MVO@    R3,     R1                      ; 56A5   024B
        MOVR    R2,     R1                      ; 56A6   0091
        MVI@    R1,     R3                      ; 56A7   028B
        BNC     L_56AC                          ; 56A8   0209 0002

        XORI    #$0100, R3                      ; 56AA   03FB 0100
L_56AC:
        BNOV    L_56B0                          ; 56AC   020A 0002

        XORI    #$0200, R3                      ; 56AE   03FB 0200
L_56B0:
        ADDR    R4,     R2                      ; 56B0   00E2
        RRC     R3,     2                       ; 56B1   0077
        MVO@    R3,     R1                      ; 56B2   024B
        MOVR    R2,     R1                      ; 56B3   0091
        MVI@    R1,     R3                      ; 56B4   028B
        BNC     L_56B9                          ; 56B5   0209 0002

        XORI    #$0100, R3                      ; 56B7   03FB 0100
L_56B9:
        BNOV    L_56BD                          ; 56B9   020A 0002

        XORI    #$0200, R3                      ; 56BB   03FB 0200
L_56BD:
        DECR    R0                              ; 56BD   0010
        BPL     L_56B0                          ; 56BE   0223 000F

        SUBI    #$0028, R2                      ; 56C0   033A 0028
        RRC     R3,     2                       ; 56C2   0077
        MVO@    R3,     R1                      ; 56C3   024B
        MVI@    R2,     R3                      ; 56C4   0293
        BNC     L_56C9                          ; 56C5   0209 0002

        XORI    #$0040, R3                      ; 56C7   03FB 0040
L_56C9:
        BNOV    L_56CD                          ; 56C9   020A 0002

        XORI    #$0080, R3                      ; 56CB   03FB 0080
L_56CD:
        MVO@    R3,     R2                      ; 56CD   0253
        DECR    R5                              ; 56CE   0015
        BPL     L_569E                          ; 56CF   0223 0032

        MVII    #$0002, R1                      ; 56D1   02B9 0002
        B       L_571C                          ; 56D3   0200 0047

L_56D5:
        MVII    #$0010, R4                      ; 56D5   02BC 0010
        NEGR    R4                              ; 56D7   0024
        MVII    #$0004, R5                      ; 56D8   02BD 0004
        SDBD                                    ; 56DA   0001
        MVII    #$389A, R2                      ; 56DB   02BA 009A 0038
        PSHR    R2                              ; 56DE   0272
L_56DF:
        PULR    R2                              ; 56DF   02B2
        INCR    R2                              ; 56E0   000A
        PSHR    R2                              ; 56E1   0272
        MVII    #$0001, R3                      ; 56E2   02BB 0001
        PSHR    R3                              ; 56E4   0273
        MOVR    R2,     R1                      ; 56E5   0091
        SUBI    #$0008, R2                      ; 56E6   033A 0008
        MVI@    R2,     R3                      ; 56E8   0293
        SWAP    R3,     1                       ; 56E9   0043
        XOR@    R1,     R3                      ; 56EA   03CB
        RLC     R3,     1                       ; 56EB   0053
        GSWD    R0                              ; 56EC   0030
        SWAP    R3,     1                       ; 56ED   0043
        MVO@    R3,     R2                      ; 56EE   0253
L_56EF:
        ADDR    R4,     R2                      ; 56EF   00E2
        ADDR    R4,     R1                      ; 56F0   00E1
        MVI@    R2,     R3                      ; 56F1   0293
        SWAP    R3,     1                       ; 56F2   0043
        XOR@    R1,     R3                      ; 56F3   03CB
        RSWD    R0                              ; 56F4   0038
        RLC     R3,     1                       ; 56F5   0053
        GSWD    R0                              ; 56F6   0030
        MVO@    R3,     R1                      ; 56F7   024B
        SWAP    R3,     1                       ; 56F8   0043
        MVO@    R3,     R2                      ; 56F9   0253
        PULR    R3                              ; 56FA   02B3
        DECR    R3                              ; 56FB   0013
        PSHR    R3                              ; 56FC   0273
        BPL     L_56EF                          ; 56FD   0223 000F

        PULR    R3                              ; 56FF   02B3
        PULR    R2                              ; 5700   02B2
        MVI@    R2,     R3                      ; 5701   0293
        RSWD    R0                              ; 5702   0038
        RLC     R3,     1                       ; 5703   0053
        MVO@    R3,     R2                      ; 5704   0253
        PSHR    R2                              ; 5705   0272
        DECR    R5                              ; 5706   0015
        BPL     L_56DF                          ; 5707   0223 0029

        PULR    R2                              ; 5709   02B2
        MVII    #$0002, R1                      ; 570A   02B9 0002
        B       L_572E                          ; 570C   0200 0020

L_570E:
        MVI     G_01A1, R1                      ; 570E   0281 01A1
        TSTR    R1                              ; 5710   0089
        BNEQ    L_5725                          ; 5711   020C 0012

        MVII    #$0228, R4                      ; 5713   02BC 0228
        MVO     R4,     G_0198                  ; 5715   0244 0198

        JSR     R5,     L_5837                  ; 5717   0004 0158 0037

        MVII    #$0008, R1                      ; 571A   02B9 0008
L_571C:
        ADD     G_0195, R1                      ; 571C   02C1 0195
        MVO     R1,     G_0195                  ; 571E   0241 0195
        CLRR    R1                              ; 5720   01C9
        MVO     R1,     G_0196                  ; 5721   0241 0196
        B       L_558C                          ; 5723   0220 0198

L_5725:
        MVII    #$023B, R2                      ; 5725   02BA 023B

        JSR     R5,     L_584C                  ; 5727   0004 0158 004C

        MVO     R4,     G_0198                  ; 572A   0244 0198
        MVII    #$0008, R1                      ; 572C   02B9 0008
L_572E:
        ADD     G_0196, R1                      ; 572E   02C1 0196
        MVO     R1,     G_0196                  ; 5730   0241 0196
        CLRR    R1                              ; 5732   01C9
        MVO     R1,     G_0195                  ; 5733   0241 0195
        B       L_558C                          ; 5735   0220 01AA

L_5737:
        MVI     G_0194, R1                      ; 5737   0281 0194
        SARC    R1,     1                       ; 5739   0079
        MVO     R1,     G_0194                  ; 573A   0241 0194
        BNC     L_575E                          ; 573C   0209 0020
        ADD     G_0193, R7                      ; 573E   02C7 0193
        B       L_5761                          ; 5740   0200 001F
        B       L_57F5                          ; 5742   0200 00B1

        MVI     G_01A1, R1                      ; 5744   0281 01A1
        TSTR    R1                              ; 5746   0089
        BNEQ    L_5754                          ; 5747   020C 000B

        MVII    #$02A0, R4                      ; 5749   02BC 02A0

        JSR     R5,     L_5837                  ; 574B   0004 0158 0037

        DECR    R4                              ; 574E   0014

        JSR     R5,     L_5837                  ; 574F   0004 0158 0037

        B       L_575C                          ; 5752   0200 0008

L_5754:
        MVII    #$02B3, R2                      ; 5754   02BA 02B3

        JSR     R5,     L_584C                  ; 5756   0004 0158 004C
        JSR     R5,     L_584C                  ; 5759   0004 0158 004C

L_575C:
        MVO     R7,     .STIC.VIDEN             ; 575C   0247 0020
L_575E:
        J       .EXEC.127                       ; 575E   0004 0310 0127

L_5761:
        MVI     G_01A1, R1                      ; 5761   0281 01A1
        TSTR    R1                              ; 5763   0089
        BNEQ    L_57A3                          ; 5764   020C 003D

        MVII    #$0002, R5                      ; 5766   02BD 0002
        SDBD                                    ; 5768   0001
        MVII    #$38A4, R2                      ; 5769   02BA 00A4 0038
        MVII    #$0008, R4                      ; 576C   02BC 0008
L_576E:
        INCR    R2                              ; 576E   000A
        MVII    #$0007, R0                      ; 576F   02B8 0007
        MOVR    R2,     R1                      ; 5771   0091
        ADDR    R4,     R2                      ; 5772   00E2
        MVI@    R1,     R3                      ; 5773   028B
        RRC     R3,     2                       ; 5774   0077
        MVO@    R3,     R1                      ; 5775   024B
        MOVR    R2,     R1                      ; 5776   0091
        MVI@    R1,     R3                      ; 5777   028B
        BNC     L_577C                          ; 5778   0209 0002

        XORI    #$0100, R3                      ; 577A   03FB 0100
L_577C:
        BNOV    L_5780                          ; 577C   020A 0002

        XORI    #$0200, R3                      ; 577E   03FB 0200
L_5780:
        ADDR    R4,     R2                      ; 5780   00E2
        RRC     R3,     2                       ; 5781   0077
        MVO@    R3,     R1                      ; 5782   024B
        MOVR    R2,     R1                      ; 5783   0091
        MVI@    R1,     R3                      ; 5784   028B
        BNC     L_5789                          ; 5785   0209 0002

        XORI    #$0100, R3                      ; 5787   03FB 0100
L_5789:
        BNOV    L_578D                          ; 5789   020A 0002

        XORI    #$0200, R3                      ; 578B   03FB 0200
L_578D:
        DECR    R0                              ; 578D   0010
        BPL     L_5780                          ; 578E   0223 000F

        SUBI    #$0048, R2                      ; 5790   033A 0048
        RRC     R3,     2                       ; 5792   0077
        MVO@    R3,     R1                      ; 5793   024B
        MVI@    R2,     R3                      ; 5794   0293
        BNC     L_5799                          ; 5795   0209 0002

        XORI    #$0040, R3                      ; 5797   03FB 0040
L_5799:
        BNOV    L_579D                          ; 5799   020A 0002

        XORI    #$0080, R3                      ; 579B   03FB 0080
L_579D:
        MVO@    R3,     R2                      ; 579D   0253
        DECR    R5                              ; 579E   0015
        BPL     L_576E                          ; 579F   0223 0032
        B       L_575C                          ; 57A1   0220 0046

L_57A3:
        MVII    #$0010, R4                      ; 57A3   02BC 0010
        NEGR    R4                              ; 57A5   0024
        MVII    #$0002, R5                      ; 57A6   02BD 0002
        SDBD                                    ; 57A8   0001
        MVII    #$38EC, R2                      ; 57A9   02BA 00EC 0038
        PSHR    R2                              ; 57AC   0272
L_57AD:
        PULR    R2                              ; 57AD   02B2
        INCR    R2                              ; 57AE   000A
        PSHR    R2                              ; 57AF   0272
        MVII    #$0003, R3                      ; 57B0   02BB 0003
        PSHR    R3                              ; 57B2   0273
        MOVR    R2,     R1                      ; 57B3   0091
        SUBI    #$0008, R2                      ; 57B4   033A 0008
        MVI@    R2,     R3                      ; 57B6   0293
        SWAP    R3,     1                       ; 57B7   0043
        XOR@    R1,     R3                      ; 57B8   03CB
        RLC     R3,     2                       ; 57B9   0057
        GSWD    R0                              ; 57BA   0030
        SWAP    R3,     1                       ; 57BB   0043
        MVO@    R3,     R2                      ; 57BC   0253
L_57BD:
        ADDR    R4,     R2                      ; 57BD   00E2
        ADDR    R4,     R1                      ; 57BE   00E1
        MVI@    R2,     R3                      ; 57BF   0293
        SWAP    R3,     1                       ; 57C0   0043
        XOR@    R1,     R3                      ; 57C1   03CB
        RSWD    R0                              ; 57C2   0038
        RLC     R3,     2                       ; 57C3   0057
        GSWD    R0                              ; 57C4   0030
        MVO@    R3,     R1                      ; 57C5   024B
        SWAP    R3,     1                       ; 57C6   0043
        MVO@    R3,     R2                      ; 57C7   0253
        PULR    R3                              ; 57C8   02B3
        DECR    R3                              ; 57C9   0013
        PSHR    R3                              ; 57CA   0273
        BPL     L_57BD                          ; 57CB   0223 000F

        PULR    R3                              ; 57CD   02B3
        PULR    R2                              ; 57CE   02B2
        MVI@    R2,     R3                      ; 57CF   0293
        RSWD    R0                              ; 57D0   0038
        RLC     R3,     2                       ; 57D1   0057
        MVO@    R3,     R2                      ; 57D2   0253
        PSHR    R2                              ; 57D3   0272
        DECR    R5                              ; 57D4   0015
        BPL     L_57AD                          ; 57D5   0223 0029

        PULR    R2                              ; 57D7   02B2
        B       L_575C                          ; 57D8   0220 007D

        MVI     G_0199, R1                      ; 57DA   0281 0199
        XORI    #$0001, R1                      ; 57DC   03F9 0001
        MVO     R1,     G_0199                  ; 57DE   0241 0199
        BEQ     L_57EB                          ; 57E0   0204 0009

        SDBD                                    ; 57E2   0001
        MVII    #$5405, R4                      ; 57E3   02BC 0005 0054

        JSR     R5,     L_5824                  ; 57E6   0004 0158 0024

        B       L_57F3                          ; 57E9   0200 0008

L_57EB:
        JSR     R5,     L_5820                  ; 57EB   0004 0158 0020

        MVII    #$02B3, R2                      ; 57EE   02BA 02B3

        JSR     R5,     L_584C                  ; 57F0   0004 0158 004C

L_57F3:
        B       L_575C                          ; 57F3   0220 0098

L_57F5:
        MVI     G_01A1, R1                      ; 57F5   0281 01A1
        TSTR    R1                              ; 57F7   0089
        BNEQ    L_5801                          ; 57F8   020C 0007

        MVII    #$02A0, R4                      ; 57FA   02BC 02A0

        JSR     R5,     L_5837                  ; 57FC   0004 0158 0037

        B       L_575C                          ; 57FF   0220 00A4

L_5801:
        MVII    #$02B3, R2                      ; 5801   02BA 02B3

        JSR     R5,     L_584C                  ; 5803   0004 0158 004C

        B       L_575C                          ; 5806   0220 00AB

L_5808:
        SDBD                                    ; 5808   0001
        MVII    #$53C6, R4                      ; 5809   02BC 00C6 0053
        PSHR    R5                              ; 580C   0275
        SDBD                                    ; 580D   0001
        MVII    #$3870, R5                      ; 580E   02BD 0070 0038
        MVII    #$0005, R0                      ; 5811   02B8 0005
L_5813:
        ADDI    #$0003, R5                      ; 5813   02FD 0003
        MVII    #$0004, R1                      ; 5815   02B9 0004
L_5817:
        MVI@    R4,     R3                      ; 5817   02A3
        MVO@    R3,     R5                      ; 5818   026B
        DECR    R1                              ; 5819   0011
        BPL     L_5817                          ; 581A   0223 0004

        DECR    R0                              ; 581C   0010
        BPL     L_5813                          ; 581D   0223 000B
        PULR    R7                              ; 581F   02B7

L_5820:
        SDBD                                    ; 5820   0001
        MVII    #$53E4, R4                      ; 5821   02BC 00E4 0053
L_5824:
        PSHR    R5                              ; 5824   0275
        SDBD                                    ; 5825   0001
        MVII    #$38A0, R5                      ; 5826   02BD 00A0 0038
        MVII    #$0009, R0                      ; 5829   02B8 0009
L_582B:
        ADDI    #$0005, R5                      ; 582B   02FD 0005
        MVI@    R4,     R3                      ; 582D   02A3
        MVO@    R3,     R5                      ; 582E   026B
        MVI@    R4,     R3                      ; 582F   02A3
        MVO@    R3,     R5                      ; 5830   026B
        MVI@    R4,     R3                      ; 5831   02A3
        MVO@    R3,     R5                      ; 5832   026B
        DECR    R0                              ; 5833   0010
        BPL     L_582B                          ; 5834   0223 000A
        PULR    R7                              ; 5836   02B7

L_5837:
        PSHR    R5                              ; 5837   0275
        PSHR    R4                              ; 5838   0274
        MOVR    R4,     R5                      ; 5839   00A5
        INCR    R5                              ; 583A   000D
        MVII    #$0005, R0                      ; 583B   02B8 0005
        MVI@    R4,     R1                      ; 583D   02A1
L_583E:
        MVI@    R4,     R2                      ; 583E   02A2
        MVI@    R4,     R3                      ; 583F   02A3
        MVO@    R1,     R5                      ; 5840   0269
        MVO@    R2,     R5                      ; 5841   026A
        MVI@    R4,     R1                      ; 5842   02A1
        MVO@    R3,     R5                      ; 5843   026B
        DECR    R0                              ; 5844   0010
        BPL     L_583E                          ; 5845   0223 0008

        MVI@    R4,     R2                      ; 5847   02A2
        MVO@    R1,     R5                      ; 5848   0269
        PULR    R4                              ; 5849   02B4
        MVO@    R2,     R4                      ; 584A   0262
        PULR    R7                              ; 584B   02B7

L_584C:
        PSHR    R5                              ; 584C   0275
        PSHR    R2                              ; 584D   0272
        MOVR    R2,     R1                      ; 584E   0091
        DECR    R1                              ; 584F   0011
        MVII    #$0005, R0                      ; 5850   02B8 0005
        MVI@    R2,     R3                      ; 5852   0293
L_5853:
        DECR    R2                              ; 5853   0012
        MVI@    R2,     R4                      ; 5854   0294
        DECR    R2                              ; 5855   0012
        MVI@    R2,     R5                      ; 5856   0295
        DECR    R2                              ; 5857   0012
        MVO@    R3,     R1                      ; 5858   024B
        DECR    R1                              ; 5859   0011
        MVO@    R4,     R1                      ; 585A   024C
        DECR    R1                              ; 585B   0011
        MVI@    R2,     R3                      ; 585C   0293
        MVO@    R5,     R1                      ; 585D   024D
        DECR    R1                              ; 585E   0011
        DECR    R0                              ; 585F   0010
        BPL     L_5853                          ; 5860   0223 000E

        DECR    R2                              ; 5862   0012
        MVI@    R1,     R4                      ; 5863   028C
        MVO@    R3,     R1                      ; 5864   024B
        PULR    R2                              ; 5865   02B2
        MVO@    R4,     R2                      ; 5866   0254
        PULR    R7                              ; 5867   02B7

L_5868:
        PSHR    R5                              ; 5868   0275
        MVI     G_032F, R1                      ; 5869   0281 032F
        SWAP    R1,     1                       ; 586B   0041
        ANDI    #$00FF, R1                      ; 586C   03B9 00FF
        CMPI    #$00A7, R1                      ; 586E   0379 00A7
        BLT     L_5875                          ; 5870   0205 0003

        JSR     R5,     L_5BAE                  ; 5872   0004 0158 03AE

L_5875:
        MVI     G_0160, R1                      ; 5875   0281 0160
        CMPI    #$0004, R1                      ; 5877   0379 0004
        BLT     L_5ADC                          ; 5879   0205 0261

        MVI     G_01B0, R1                      ; 587B   0281 01B0
        CMPI    #$00FE, R1                      ; 587D   0379 00FE
        BNEQ    L_58DE                          ; 587F   020C 005D

        JSR     R5,     L_5F62                  ; 5881   0004 015C 0362

        MVI     G_0165, R1                      ; 5884   0281 0165
        MVII    #$0163, R2                      ; 5886   02BA 0163
        MOVR    R2,     R4                      ; 5888   0094
        ADDR    R1,     R2                      ; 5889   00CA
        MVI@    R2,     R3                      ; 588A   0293
        DECR    R3                              ; 588B   0013
        BNEQ    L_58A3                          ; 588C   020C 0015

        MVO     R3,     G_01EE                  ; 588E   0243 01EE
        PSHR    R1                              ; 5890   0271
        PSHR    R2                              ; 5891   0272
        PSHR    R3                              ; 5892   0273
        PSHR    R4                              ; 5893   0274

        JSR     R5,     .EXEC.7B3               ; 5894   0004 0114 03B3
        JSR     R5,     L_5FCA                  ; 5897   0004 015C 03CA

        MVII    #$007F, R1                      ; 589A   02B9 007F

        JSR     R5,     L_5E74                  ; 589C   0004 015C 0274

        PULR    R4                              ; 589F   02B4
        PULR    R3                              ; 58A0   02B3
        PULR    R2                              ; 58A1   02B2
        PULR    R1                              ; 58A2   02B1
L_58A3:
        MVO@    R3,     R2                      ; 58A3   0253
        MVI@    R4,     R3                      ; 58A4   02A3
        ADD@    R4,     R3                      ; 58A5   02E3
        BEQ     L_58BD                          ; 58A6   0204 0015

        CLRR    R0                              ; 58A8   01C0
        MVO     R0,     G_0331                  ; 58A9   0240 0331
        XOR     G_0161, R0                      ; 58AB   03C0 0161
        BEQ     L_58BA                          ; 58AD   0204 000B

        XORI    #$0001, R1                      ; 58AF   03F9 0001
        MVII    #$0163, R2                      ; 58B1   02BA 0163
        ADDR    R1,     R2                      ; 58B3   00CA
        MVI@    R2,     R2                      ; 58B4   0292
        TSTR    R2                              ; 58B5   0092
        BEQ     L_58BA                          ; 58B6   0204 0002

        MVO     R1,     G_0165                  ; 58B8   0241 0165
L_58BA:
        J       L_514F                          ; 58BA   0004 0350 014F

L_58BD:
        MVII    #$0007, R3                      ; 58BD   02BB 0007
        MVII    #$027D, R4                      ; 58BF   02BC 027D

        JSR     R5,     X_PRINT_R5              ; 58C1   0004 0118 007B
        STRING  "GAME  OVER"                    ; 58C4  
        DECLE   $0000                           ; 58CE   0000

        MVO     R1,     G_0331                  ; 58CF   0241 0331
        MVII    #$015F, R4                      ; 58D1   02BC 015F
        MVII    #$0090, R0                      ; 58D3   02B8 0090
        MVO     R4,     G_035D                  ; 58D5   0244 035D

        JSR     R5,     X_FILL_ZERO             ; 58D7   0004 0114 0338
        JSR     R5,     .EXEC.7B3               ; 58DA   0004 0114 03B3

        PULR    R7                              ; 58DD   02B7

L_58DE:
        CLRR    R0                              ; 58DE   01C0

        JSR     R5,     .EXEC.772               ; 58DF   0004 0114 0372

        PSHR    R3                              ; 58E2   0273
        CMP     G_01B0, R0                      ; 58E3   0340 01B0
        BNEQ    L_5911                          ; 58E5   020C 002A

        MVI     G_0321, R1                      ; 58E7   0281 0321
        MVII    #$0004, R4                      ; 58E9   02BC 0004
        SDBD                                    ; 58EB   0001
        ANDI    #$FF00, R1                      ; 58EC   03B9 0000 00FF
        BEQ     L_5911                          ; 58EF   0204 0020

        CMPI    #$0070, R2                      ; 58F1   037A 0070
        BGT     L_58FA                          ; 58F3   020E 0005

        TSTR    R1                              ; 58F5   0089
        BMI     L_5911                          ; 58F6   020B 0019
        B       L_58FE                          ; 58F8   0200 0004

L_58FA:
        TSTR    R1                              ; 58FA   0089
        BPL     L_5911                          ; 58FB   0203 0014

        NEGR    R4                              ; 58FD   0024
L_58FE:
        ADDR    R4,     R2                      ; 58FE   00E2
        PSHR    R2                              ; 58FF   0272
        SWAP    R2,     1                       ; 5900   0042
        MVO     R2,     G_031F                  ; 5901   0242 031F
        MVI     G_0323, R1                      ; 5903   0281 0323
        SUBI    #$0002, R1                      ; 5905   0339 0002
        BPL     L_590D                          ; 5907   0203 0004

        MVO     R0,     G_0321                  ; 5909   0240 0321
        B       L_5910                          ; 590B   0200 0003

L_590D:
        INCR    R1                              ; 590D   0009
        MVO     R1,     G_0323                  ; 590E   0241 0323
L_5910:
        PULR    R2                              ; 5910   02B2
L_5911:
        PSHR    R2                              ; 5911   0272
        MVII    #$0001, R3                      ; 5912   02BB 0001

        JSR     R5,     L_592F                  ; 5914   0004 0158 012F
        DECLE   $0002,  $0000,  $0004,  $0001   ; 5917   0002 0000 0004 0001
        DECLE   $0008,  $0000,  $0006,  $0001   ; 591B   0008 0000 0006 0001
        DECLE   $000E,  $0002,  $0006,  $0002   ; 591F   000E 0002 0006 0002
        DECLE   $0014,  $0002,  $0007,  $0002   ; 5923   0014 0002 0007 0002
        DECLE   $001A,  $0004,  $0006,  $0008   ; 5927   001A 0004 0006 0008
        DECLE   $00FF,  $0004                   ; 592B   00FF 0004

        SETC                                    ; 592D   0007
        INCR    R0                              ; 592E   0008
L_592F:
        CLRR    R4                              ; 592F   01E4
        SUBI    #$0070, R2                      ; 5930   033A 0070
        BNEQ    L_5938                          ; 5932   020C 0004

        MVO     R4,     G_01A1                  ; 5934   0244 01A1
        B       L_5960                          ; 5936   0200 0028
L_5938:
        BPL     L_593C                          ; 5938   0203 0002

        NEGR    R2                              ; 593A   0022
        CLRR    R3                              ; 593B   01DB
L_593C:
        CMP@    R5,     R2                      ; 593C   036A
        BLT     L_5944                          ; 593D   0205 0005

        ADDI    #$0003, R5                      ; 593F   02FD 0003
        INCR    R4                              ; 5941   000C
        B       L_593C                          ; 5942   0220 0007

L_5944:
        MVO     R3,     G_01A1                  ; 5944   0243 01A1
        CMP     G_01BC, R4                      ; 5946   0344 01BC
        BNEQ    L_594F                          ; 5948   020C 0005

        MVI     G_0194, R0                      ; 594A   0280 0194
        TSTR    R0                              ; 594C   0080
        BNEQ    L_5960                          ; 594D   020C 0011

L_594F:
        MVO     R4,     G_01BC                  ; 594F   0244 01BC
        MVI@    R5,     R1                      ; 5951   02A9
        MVO     R1,     G_0191                  ; 5952   0241 0191
        MVO     R1,     G_0193                  ; 5954   0241 0193
        MVI@    R5,     R1                      ; 5956   02A9
        MVO     R1,     G_0192                  ; 5957   0241 0192
        MVO     R1,     G_0194                  ; 5959   0241 0194
        MVO     R1,     G_01A4                  ; 595B   0241 01A4
        MVI@    R5,     R1                      ; 595D   02A9
        MVO     R1,     G_01A5                  ; 595E   0241 01A5
L_5960:
        PULR    R2                              ; 5960   02B2
        MVII    #$001A, R1                      ; 5961   02B9 001A
        SWAP    R1,     1                       ; 5963   0041
        MVII    #$0002, R3                      ; 5964   02BB 0002
        SWAP    R3,     1                       ; 5966   0043
        CMPI    #$0070, R2                      ; 5967   037A 0070
        BLE     L_596C                          ; 5969   0206 0001

        SUBR    R3,     R1                      ; 596B   0119
L_596C:
        MVI     G_031D, R3                      ; 596C   0283 031D
        ANDI    #$001F, R3                      ; 596E   03BB 001F
        XORR    R3,     R1                      ; 5970   01D9
        MVO     R1,     G_031D                  ; 5971   0241 031D
        PULR    R3                              ; 5973   02B3
        MVI     G_01CB, R1                      ; 5974   0281 01CB
        TSTR    R1                              ; 5976   0089
        BNEQ    L_59C3                          ; 5977   020C 004A

        CMPI    #$004B, R3                      ; 5979   037B 004B
        BLE     L_59C3                          ; 597B   0206 0046

        MVI     G_01D4, R5                      ; 597D   0285 01D4
        TSTR    R5                              ; 597F   00AD
        BEQ     L_59C3                          ; 5980   0204 0041

        CMPI    #$0003, R5                      ; 5982   037D 0003
        BGT     L_59C3                          ; 5984   020E 003D

        SUBI    #$0070, R2                      ; 5986   033A 0070
        BPL     L_598B                          ; 5988   0203 0001

        NEGR    R2                              ; 598A   0022
L_598B:
        MVI     G_0162, R1                      ; 598B   0281 0162
        CMPI    #$0003, R1                      ; 598D   0379 0003
        BLT     L_5992                          ; 598F   0205 0001

        DECR    R1                              ; 5991   0011
L_5992:
        SLL     R1,     2                       ; 5992   004D
        NEGR    R1                              ; 5993   0021
        ADDI    #$000C, R1                      ; 5994   02F9 000C
        CMPR    R2,     R1                      ; 5996   0151
        BLT     L_59C3                          ; 5997   0205 002A

        CLRR    R1                              ; 5999   01C9
        MVII    #$0070, R2                      ; 599A   02BA 0070
        SWAP    R2,     1                       ; 599C   0042
        MVO     R2,     G_031F                  ; 599D   0242 031F
        MVII    #$004C, R2                      ; 599F   02BA 004C
        SWAP    R2,     1                       ; 59A1   0042
        MVO     R2,     G_0320                  ; 59A2   0242 0320
        MVI     G_01D3, R2                      ; 59A4   0282 01D3
        INCR    R2                              ; 59A6   000A
        CMPI    #$0002, R2                      ; 59A7   037A 0002
        BGT     L_59C3                          ; 59A9   020E 0018

        MVI     G_01E6, R3                      ; 59AB   0283 01E6
        INCR    R3                              ; 59AD   000B
        MVO     R3,     G_01E6                  ; 59AE   0243 01E6
        CMPI    #$000F, R3                      ; 59B0   037B 000F
        BLT     L_59C3                          ; 59B2   0205 000F

        MVO     R2,     G_01D3                  ; 59B4   0242 01D3
        MVO     R1,     G_01D4                  ; 59B6   0241 01D4
        MVO     R1,     G_01E6                  ; 59B8   0241 01E6
        SDBD                                    ; 59BA   0001
        MVII    #$1A13, R1                      ; 59BB   02B9 0013 001A
        MVO     R1,     G_031D                  ; 59BE   0241 031D

        JSR     R5,     L_5FC3                  ; 59C0   0004 015C 03C3

L_59C3:
        MVI     G_01B3, R1                      ; 59C3   0281 01B3
        TSTR    R1                              ; 59C5   0089
        BEQ     L_59CD                          ; 59C6   0204 0005

        JSR     R5,     L_5B76                  ; 59C8   0004 0158 0376

        B       L_59D0                          ; 59CB   0200 0003

L_59CD:
        JSR     R5,     L_5C75                  ; 59CD   0004 015C 0075

L_59D0:
        MVI     G_01A7, R1                      ; 59D0   0281 01A7
        TSTR    R1                              ; 59D2   0089
        BNEQ    L_5A39                          ; 59D3   020C 0064

        MVI     G_01E0, R0                      ; 59D5   0280 01E0
        DECR    R0                              ; 59D7   0010
        BMI     L_59DE                          ; 59D8   020B 0004

        MVO     R0,     G_01E0                  ; 59DA   0240 01E0
        BNEQ    L_5A39                          ; 59DC   020C 005B

L_59DE:
        MVI     G_0357, R1                      ; 59DE   0281 0357
        SWAP    R1,     1                       ; 59E0   0041
        CMPI    #$00A7, R1                      ; 59E1   0379 00A7
        BGT     L_59EA                          ; 59E3   020E 0005

        MVI     G_01A3, R1                      ; 59E5   0281 01A3
        TSTR    R1                              ; 59E7   0089
        BNEQ    L_59EF                          ; 59E8   020C 0005

L_59EA:
        CLRR    R0                              ; 59EA   01C0
        MVO     R0,     G_01E0                  ; 59EB   0240 01E0
        B       L_5A39                          ; 59ED   0200 004A

L_59EF:
        CLRR    R0                              ; 59EF   01C0

        JSR     R5,     .EXEC.772               ; 59F0   0004 0114 0372

        SWAP    R2,     1                       ; 59F3   0042
        XORR    R3,     R2                      ; 59F4   01DA
        PSHR    R2                              ; 59F5   0272
        MVII    #$0003, R4                      ; 59F6   02BC 0003
        MVII    #$002A, R2                      ; 59F8   02BA 002A
        CMPI    #$0030, R3                      ; 59FA   037B 0030
        BLT     L_5A00                          ; 59FC   0205 0002
        B       L_5A05                          ; 59FE   0200 0005

L_5A00:
        CMPI    #$002C, R3                      ; 5A00   037B 002C
        BGT     L_5A06                          ; 5A02   020E 0002

        NEGR    R4                              ; 5A04   0024
L_5A05:
        ADDR    R4,     R2                      ; 5A05   00E2
L_5A06:
        SWAP    R2,     1                       ; 5A06   0042
        MVO     R2,     G_0348                  ; 5A07   0242 0348
        ADDI    #$0200, R2                      ; 5A09   02FA 0200
        MVO     R2,     G_0338                  ; 5A0B   0242 0338
        MVI     G_0347, R1                      ; 5A0D   0281 0347
        SWAP    R1,     1                       ; 5A0F   0041
        CMPI    #$0098, R1                      ; 5A10   0379 0098
        BGT     L_5A18                          ; 5A12   020E 0004

        ADDI    #$0008, R1                      ; 5A14   02F9 0008
        B       L_5A1B                          ; 5A16   0200 0003

L_5A18:
        MVI     G_0357, R1                      ; 5A18   0281 0357
        INCR    R7                              ; 5A1A   000F

L_5A1B:
        SWAP    R1,     1                       ; 5A1B   0041
L_5A1C:
        MVO     R1,     G_0337                  ; 5A1C   0241 0337
        PULR    R2                              ; 5A1E   02B2
        SUBI    #$0004, R2                      ; 5A1F   033A 0004
        MVII    #$0335, R1                      ; 5A21   02B9 0335
        MVO     R1,     G_01A7                  ; 5A23   0241 01A7
        MVI     G_01E2, R3                      ; 5A25   0283 01E2

        JSR     R5,     .EXEC.9A1               ; 5A27   0004 0118 01A1

        MVI     G_033B, R1                      ; 5A2A   0281 033B
        SLL     R1,     1                       ; 5A2C   0049
        MVO     R1,     G_033B                  ; 5A2D   0241 033B
        MVI     G_01E1, R0                      ; 5A2F   0280 01E1

        JSR     R5,     X_RAND2                 ; 5A31   0004 0114 029E

        MVO     R0,     G_01E0                  ; 5A34   0240 01E0

        JSR     R5,     L_5FAD                  ; 5A36   0004 015C 03AD

L_5A39:
        MVI     G_01D0, R1                      ; 5A39   0281 01D0
        TSTR    R1                              ; 5A3B   0089
        BNEQ    L_5A64                          ; 5A3C   020C 0026

        CMP     G_01B0, R1                      ; 5A3E   0341 01B0
        BNEQ    L_5A83                          ; 5A40   020C 0041

        MVII    #$01D1, R4                      ; 5A42   02BC 01D1
        SDBD                                    ; 5A44   0001
        MVI@    R4,     R2                      ; 5A45   02A2
        INCR    R2                              ; 5A46   000A
        SDBD                                    ; 5A47   0001
        CMPI    #$072D, R2                      ; 5A48   037A 002D 0007
        BLT     L_5A5D                          ; 5A4B   0205 0010

        DECR    R1                              ; 5A4D   0011
        MVO     R1,     G_01D0                  ; 5A4E   0241 01D0
        SDBD                                    ; 5A50   0001
        MVII    #$1A07, R1                      ; 5A51   02B9 0007 001A
        MVO     R1,     G_031D                  ; 5A54   0241 031D
        MVO     R1,     G_01C7                  ; 5A56   0241 01C7

        JSR     R5,     L_5085                  ; 5A58   0004 0150 0085

        B       L_5A83                          ; 5A5B   0200 0026

L_5A5D:
        MVO     R2,     G_01D1                  ; 5A5D   0242 01D1
        SWAP    R2,     1                       ; 5A5F   0042
        MVO     R2,     G_01D2                  ; 5A60   0242 01D2
        B       L_5A83                          ; 5A62   0200 001F

L_5A64:
        MVI     G_01D0, R1                      ; 5A64   0281 01D0
        DECR    R1                              ; 5A66   0011
        BMI     L_5A83                          ; 5A67   020B 001A

        MVO     R1,     G_01D0                  ; 5A69   0241 01D0
        BNEQ    L_5A76                          ; 5A6B   020C 0009

        SDBD                                    ; 5A6D   0001
        MVII    #$1A12, R1                      ; 5A6E   02B9 0012 001A
        MVO     R1,     G_031D                  ; 5A71   0241 031D

        JSR     R5,     L_5F62                  ; 5A73   0004 015C 0362

L_5A76:
        MVI     G_031D, R1                      ; 5A76   0281 031D
        XORI    #$0001, R1                      ; 5A78   03F9 0001
        MVO     R1,     G_031D                  ; 5A7A   0241 031D
        CLRR    R1                              ; 5A7C   01C9
        MVII    #$01D1, R4                      ; 5A7D   02BC 01D1
        MVO@    R1,     R4                      ; 5A7F   0261
        MVO@    R1,     R4                      ; 5A80   0261
        MVO@    R1,     R4                      ; 5A81   0261
        MVO@    R1,     R4                      ; 5A82   0261
L_5A83:
        MVI     G_0162, R1                      ; 5A83   0281 0162
        CMPI    #$0002, R1                      ; 5A85   0379 0002
        BLT     L_5AB0                          ; 5A87   0205 0027

        MVI     G_01B8, R1                      ; 5A89   0281 01B8
        TSTR    R1                              ; 5A8B   0089
        BNEQ    L_5AB2                          ; 5A8C   020C 0024

        MVI     G_01B2, R1                      ; 5A8E   0281 01B2
        DECR    R1                              ; 5A90   0011
        MVO     R1,     G_01B2                  ; 5A91   0241 01B2
        BPL     L_5AB0                          ; 5A93   0203 001B

        MVI     G_01A3, R1                      ; 5A95   0281 01A3
        TSTR    R1                              ; 5A97   0089
        BNEQ    L_5A9F                          ; 5A98   020C 0005

        INCR    R1                              ; 5A9A   0009
        MVO     R1,     G_01B2                  ; 5A9B   0241 01B2
        B       L_5AB0                          ; 5A9D   0200 0011

L_5A9F:
        MVI     G_035E, R0                      ; 5A9F   0280 035E
        MVO     R0,     G_01B2                  ; 5AA1   0240 01B2
        MVI     G_0162, R1                      ; 5AA3   0281 0162
        SARC    R1,     1                       ; 5AA5   0079
        BC      L_5AAB                          ; 5AA6   0201 0003

        SARC    R0,     1                       ; 5AA8   0078
        BNC     L_5AB0                          ; 5AA9   0209 0005

L_5AAB:
        JSR     R5,     L_5D8E                  ; 5AAB   0004 015C 018E

        B       L_5AB2                          ; 5AAE   0200 0002

L_5AB0:
        MVO     R7,     G_0343                  ; 5AB0   0247 0343
L_5AB2:
        MVI     G_0196, R0                      ; 5AB2   0280 0196
        SUBI    #$0018, R0                      ; 5AB4   0338 0018
        BMI     L_5AC7                          ; 5AB6   020B 000F

        MVO     R0,     G_0196                  ; 5AB8   0240 0196
        MVI     G_0327, R1                      ; 5ABA   0281 0327
        SWAP    R1,     1                       ; 5ABC   0041
        INCR    R1                              ; 5ABD   0009
        CMPI    #$0098, R1                      ; 5ABE   0379 0098
        BLT     L_5AC4                          ; 5AC0   0205 0002

        MVII    #$0019, R1                      ; 5AC2   02B9 0019
L_5AC4:
        SWAP    R1,     1                       ; 5AC4   0041
        MVO     R1,     G_0327                  ; 5AC5   0241 0327
L_5AC7:
        MVI     G_0195, R0                      ; 5AC7   0280 0195
        SUBI    #$0018, R0                      ; 5AC9   0338 0018
        BMI     L_5ADC                          ; 5ACB   020B 000F

        MVO     R0,     G_0195                  ; 5ACD   0240 0195
        MVI     G_0327, R1                      ; 5ACF   0281 0327
        SWAP    R1,     1                       ; 5AD1   0041
        DECR    R1                              ; 5AD2   0011
        CMPI    #$0019, R1                      ; 5AD3   0379 0019
        BGT     L_5AD9                          ; 5AD5   020E 0002

        MVII    #$0099, R1                      ; 5AD7   02B9 0099
L_5AD9:
        SWAP    R1,     1                       ; 5AD9   0041
        MVO     R1,     G_0327                  ; 5ADA   0241 0327
L_5ADC:
        PULR    R7                              ; 5ADC   02B7

L_5ADD:
        PSHR    R5                              ; 5ADD   0275

        JSR     R5,     L_5B00                  ; 5ADE   0004 0158 0300

        PSHR    R4                              ; 5AE1   0274
        DECR    R2                              ; 5AE2   0012
        BMI     L_5AF7                          ; 5AE3   020B 0012

        MOVR    R5,     R4                      ; 5AE5   00AC
        MVII    #$0003, R3                      ; 5AE6   02BB 0003
        ADDR    R3,     R4                      ; 5AE8   00DC
        SLL     R3,     1                       ; 5AE9   004B
        ADDR    R3,     R5                      ; 5AEA   00DD
L_5AEB:
        SUBR    R3,     R4                      ; 5AEB   011C
        SUBR    R3,     R5                      ; 5AEC   011D
        MVI@    R4,     R1                      ; 5AED   02A1
        MVO@    R1,     R5                      ; 5AEE   0269
        MVI@    R4,     R1                      ; 5AEF   02A1
        MVO@    R1,     R5                      ; 5AF0   0269
        MVI@    R4,     R1                      ; 5AF1   02A1
        MVO@    R1,     R5                      ; 5AF2   0269
        SUBI    #$0003, R2                      ; 5AF3   033A 0003
        BPL     L_5AEB                          ; 5AF5   0223 000B

L_5AF7:
        PULR    R5                              ; 5AF7   02B5
        CLRR    R1                              ; 5AF8   01C9
        MVO@    R1,     R5                      ; 5AF9   0269
        MVO@    R1,     R5                      ; 5AFA   0269
        MVO@    R1,     R5                      ; 5AFB   0269

        JSR     R5,     L_5245                  ; 5AFC   0004 0150 0245

        PULR    R7                              ; 5AFF   02B7

L_5B00:
        PSHR    R5                              ; 5B00   0275
        MVI     G_016F, R0                      ; 5B01   0280 016F
        MVII    #$0170, R5                      ; 5B03   02BD 0170
        MVI     G_0165, R3                      ; 5B05   0283 0165
        TSTR    R3                              ; 5B07   009B
        BEQ     L_5B0C                          ; 5B08   0204 0002

        ADDI    #$000F, R5                      ; 5B0A   02FD 000F
L_5B0C:
        MOVR    R5,     R4                      ; 5B0C   00AC
        MOVR    R0,     R2                      ; 5B0D   0082
        SLL     R0,     1                       ; 5B0E   0048
        ADDR    R0,     R2                      ; 5B0F   00C2
        ADDR    R2,     R5                      ; 5B10   00D5
        PULR    R7                              ; 5B11   02B7

        PSHR    R5                              ; 5B12   0275
L_5B13:
        CLRR    R0                              ; 5B13   01C0
        CMP     G_01A3, R0                      ; 5B14   0340 01A3
        BNEQ    L_5B71                          ; 5B16   020C 0059

        INCR    R0                              ; 5B18   0008

        JSR     R5,     .EXEC.772               ; 5B19   0004 0114 0372

        MVI     G_01A1, R1                      ; 5B1C   0281 01A1
L_5B1E:
        PSHR    R1                              ; 5B1E   0271
        PSHR    R2                              ; 5B1F   0272
        TSTR    R1                              ; 5B20   0089
        BEQ     L_5B25                          ; 5B21   0204 0002

        ADDI    #$0007, R2                      ; 5B23   02FA 0007
L_5B25:
        MOVR    R2,     R5                      ; 5B25   0095
        ANDI    #$0007, R5                      ; 5B26   03BD 0007
        SLR     R2,     1                       ; 5B28   0062
        SLR     R2,     2                       ; 5B29   0066
        ADDI    #$02C7, R2                      ; 5B2A   02FA 02C7
        MVI@    R2,     R3                      ; 5B2C   0293
        CMPI    #$02F8, R3                      ; 5B2D   037B 02F8
        BEQ     L_5B68                          ; 5B2F   0204 0037

        TSTR    R3                              ; 5B31   009B
        BEQ     L_5B68                          ; 5B32   0204 0034

        SLR     R3,     1                       ; 5B34   0063
        SLR     R3,     2                       ; 5B35   0067
        ANDI    #$000F, R3                      ; 5B36   03BB 000F
        SUBI    #$000D, R3                      ; 5B38   033B 000D
        NEGR    R3                              ; 5B3A   0023
        CMPR    R5,     R3                      ; 5B3B   016B
        BNEQ    L_5B68                          ; 5B3C   020C 002A

        SARC    R1,     1                       ; 5B3E   0079
        BNC     L_5B4A                          ; 5B3F   0209 0009

        MVII    #$00B0, R3                      ; 5B41   02BB 00B0
        SWAP    R3,     1                       ; 5B43   0043
        MVO     R3,     G_0357                  ; 5B44   0243 0357
        MVO     R3,     G_0347                  ; 5B46   0243 0347
        B       L_5B4F                          ; 5B48   0200 0005

L_5B4A:
        MVII    #$0010, R3                      ; 5B4A   02BB 0010
        SWAP    R3,     1                       ; 5B4C   0043
        MVO     R3,     G_0347                  ; 5B4D   0243 0347
L_5B4F:
        INCR    R2                              ; 5B4F   000A
        MVII    #$02D9, R3                      ; 5B50   02BB 02D9
        SUBR    R3,     R2                      ; 5B52   011A
        NEGR    R2                              ; 5B53   0022
        DECR    R2                              ; 5B54   0012
        BMI     L_5B60                          ; 5B55   020B 0009

L_5B57:
        MVI@    R3,     R4                      ; 5B57   029C
        TSTR    R4                              ; 5B58   00A4
        BEQ     L_5B5C                          ; 5B59   0204 0001

        INCR    R1                              ; 5B5B   0009
L_5B5C:
        DECR    R3                              ; 5B5C   0013
        DECR    R2                              ; 5B5D   0012
        BPL     L_5B57                          ; 5B5E   0223 0008

L_5B60:
        SUBI    #$0004, R1                      ; 5B60   0339 0004
        NEGR    R1                              ; 5B62   0021
        MVO     R1,     G_016F                  ; 5B63   0241 016F
        INCR    R1                              ; 5B65   0009
        MVO     R1,     G_01A3                  ; 5B66   0241 01A3
L_5B68:
        PULR    R2                              ; 5B68   02B2
        PULR    R1                              ; 5B69   02B1
        XORI    #$0001, R1                      ; 5B6A   03F9 0001
        BNEQ    L_5B71                          ; 5B6C   020C 0003

        DECR    R0                              ; 5B6E   0010
        BPL     L_5B1E                          ; 5B6F   0223 0052

L_5B71:
        MVII    #$0001, R1                      ; 5B71   02B9 0001
        MVO     R1,     G_032B                  ; 5B73   0241 032B
        PULR    R7                              ; 5B75   02B7

L_5B76:
        PSHR    R5                              ; 5B76   0275
        MVI     G_01B3, R1                      ; 5B77   0281 01B3
        TSTR    R1                              ; 5B79   0089
        BNEQ    L_5B8D                          ; 5B7A   020C 0011

        MVI     G_01B6, R1                      ; 5B7C   0281 01B6
        ADDI    #$0032, R1                      ; 5B7E   02F9 0032
        MVO     R1,     G_01B6                  ; 5B80   0241 01B6

        JSR     R5,     L_5ADD                  ; 5B82   0004 0158 02DD

        MVO     R5,     G_01EE                  ; 5B85   0245 01EE

        JSR     R5,     L_5FCA                  ; 5B87   0004 015C 03CA

        CLRR    R1                              ; 5B8A   01C9
        MVO     R1,     G_01A3                  ; 5B8B   0241 01A3
L_5B8D:
        INCR    R1                              ; 5B8D   0009
        MVO     R1,     G_01B3                  ; 5B8E   0241 01B3
        CMPI    #$000C, R1                      ; 5B90   0379 000C
        BNEQ    L_5B9F                          ; 5B92   020C 000B

        CLRR    R1                              ; 5B94   01C9
        MVO     R1,     G_01B3                  ; 5B95   0241 01B3
        MVO     R1,     G_0347                  ; 5B97   0241 0347
        MVO     R1,     G_034F                  ; 5B99   0241 034F
        MVO     R1,     G_0357                  ; 5B9B   0241 0357
        B       L_5D9C                          ; 5B9D   0200 01FD

L_5B9F:
        MVI     G_0345, R1                      ; 5B9F   0281 0345
        XORI    #$0007, R1                      ; 5BA1   03F9 0007
        MVO     R1,     G_0345                  ; 5BA3   0241 0345
        MVI     G_034D, R1                      ; 5BA5   0281 034D
        XORI    #$0007, R1                      ; 5BA7   03F9 0007
        MVO     R1,     G_034D                  ; 5BA9   0241 034D
        MVO     R1,     G_0355                  ; 5BAB   0241 0355
        PULR    R7                              ; 5BAD   02B7

L_5BAE:
        CLRR    R1                              ; 5BAE   01C9
        MVO     R1,     G_01D5                  ; 5BAF   0241 01D5
        MVO     R1,     G_0330                  ; 5BB1   0241 0330
        MOVR    R5,     R7                      ; 5BB3   00AF

        PSHR    R5                              ; 5BB4   0275
        MVI     G_01A3, R1                      ; 5BB5   0281 01A3
        TSTR    R1                              ; 5BB7   0089
        BEQ     L_5BCC                          ; 5BB8   0204 0012

        MVI     G_0330, R3                      ; 5BBA   0283 0330
        SDBD                                    ; 5BBC   0001
        CMPI    #$2F00, R3                      ; 5BBD   037B 0000 002F
        BGE     L_5BCC                          ; 5BC0   020D 000A

        MVII    #$0001, R1                      ; 5BC2   02B9 0001
        MOVR    R1,     R2                      ; 5BC4   008A
        ADD     G_01B6, R2                      ; 5BC5   02C2 01B6
        MVO     R2,     G_01B6                  ; 5BC7   0242 01B6

        JSR     R5,     L_5CDA                  ; 5BC9   0004 015C 00DA
L_5BCC:
        JSR     R5,     L_5BAE                  ; 5BCC   0004 0158 03AE

        PULR    R7                              ; 5BCF   02B7

        PSHR    R5                              ; 5BD0   0275

        JSR     R5,     L_5BAE                  ; 5BD1   0004 0158 03AE
        JSR     R5,     L_5BDE                  ; 5BD4   0004 0158 03DE

        MVI     G_01B6, R1                      ; 5BD7   0281 01B6
        ADDI    #$000A, R1                      ; 5BD9   02F9 000A
        MVO     R1,     G_01B6                  ; 5BDB   0241 01B6
        PULR    R7                              ; 5BDD   02B7

L_5BDE:
        CLRR    R1                              ; 5BDE   01C9
        MVO     R1,     G_0337                  ; 5BDF   0241 0337
        MVO     R1,     G_0339                  ; 5BE1   0241 0339
        MVO     R1,     G_01A7                  ; 5BE3   0241 01A7
        MVII    #$002A, R1                      ; 5BE5   02B9 002A
        SWAP    R1,     1                       ; 5BE7   0041
        MVO     R1,     G_0348                  ; 5BE8   0241 0348
        MOVR    R5,     R7                      ; 5BEA   00AF

        PSHR    R5                              ; 5BEB   0275

        JSR     R5,     L_5F67                  ; 5BEC   0004 015C 0367

        MVI     G_0352, R1                      ; 5BEF   0281 0352
        INCR    R1                              ; 5BF1   0009
        ANDI    #$0003, R1                      ; 5BF2   03B9 0003
        MVO     R1,     G_0352                  ; 5BF4   0241 0352
        MVO     R1,     G_035A                  ; 5BF6   0241 035A
        MVI     G_01A3, R1                      ; 5BF8   0281 01A3
        TSTR    R1                              ; 5BFA   0089
        BEQ     L_5C03                          ; 5BFB   0204 0006

        MVII    #$0008, R0                      ; 5BFD   02B8 0008
        SWAP    R0,     1                       ; 5BFF   0040

        JSR     R5,     L_55B6                  ; 5C00   0004 0154 01B6

L_5C03:
        MVI     G_01E3, R1                      ; 5C03   0281 01E3
        MVO     R1,     G_034B                  ; 5C05   0241 034B
        MVI     .BTAB.D9,R1                     ; 5C07   0281 02D9
        MVII    #$0003, R2                      ; 5C09   02BA 0003
        TSTR    R1                              ; 5C0B   0089
        BEQ     L_5C15                          ; 5C0C   0204 0007

        JSR     R5,     L_5F9E                  ; 5C0E   0004 015C 039E

        MVI     G_015C, R2                      ; 5C11   0282 015C
        XORI    #$0009, R2                      ; 5C13   03FA 0009
L_5C15:
        MVO     R2,     G_015C                  ; 5C15   0242 015C
        MVI     G_01E4, R1                      ; 5C17   0281 01E4
        INCR    R1                              ; 5C19   0009
        MVO     R1,     G_01E4                  ; 5C1A   0241 01E4
        CMPI    #$0003, R1                      ; 5C1C   0379 0003
        BNEQ    L_5C23                          ; 5C1E   020C 0003

        JSR     R5,     L_5C24                  ; 5C20   0004 015C 0024

L_5C23:
        PULR    R7                              ; 5C23   02B7

L_5C24:
        PSHR    R5                              ; 5C24   0275
        CLRR    R1                              ; 5C25   01C9
        MVO     R1,     G_01BB                  ; 5C26   0241 01BB

        JSR     R5,     L_5B00                  ; 5C28   0004 0158 0300

        MVO     R4,     G_01BF                  ; 5C2B   0244 01BF
        MOVR    R4,     R5                      ; 5C2D   00A5
        ADDI    #$0012, R5                      ; 5C2E   02FD 0012
        MVII    #$0004, R0                      ; 5C30   02B8 0004
L_5C32:
        CLRR    R3                              ; 5C32   01DB
        SUBI    #$0006, R5                      ; 5C33   033D 0006
        MVI@    R5,     R1                      ; 5C35   02A9
        DECR    R5                              ; 5C36   0015
L_5C37:
        DECR    R1                              ; 5C37   0011
        BMI     L_5C8F                          ; 5C38   020B 0055
        BNEQ    L_5C3F                          ; 5C3A   020C 0003

        MVII    #$0008, R1                      ; 5C3C   02B9 0008
        INCR    R3                              ; 5C3E   000B
L_5C3F:
        MVO@    R1,     R5                      ; 5C3F   0269
        MVI@    R5,     R2                      ; 5C40   02AA
        ADDR    R3,     R2                      ; 5C41   00DA
        DECR    R5                              ; 5C42   0015
        MVO@    R2,     R5                      ; 5C43   026A
        INCR    R5                              ; 5C44   000D
        DECR    R0                              ; 5C45   0010
        BPL     L_5C32                          ; 5C46   0223 0015

        CLRR    R1                              ; 5C48   01C9
        MVO     R1,     G_01E4                  ; 5C49   0241 01E4

        JSR     R5,     L_5245                  ; 5C4B   0004 0150 0245

        MVI     .BTAB.D8,R1                     ; 5C4E   0281 02D8
        TSTR    R1                              ; 5C50   0089
        BEQ     L_5C5C                          ; 5C51   0204 0009

        MVI     G_015C, R2                      ; 5C53   0282 015C
        XORI    #$0009, R2                      ; 5C55   03FA 0009
        MVO     R2,     G_015C                  ; 5C57   0242 015C

        JSR     R5,     L_5F9E                  ; 5C59   0004 015C 039E

L_5C5C:
        MVI     .BTAB.D9,R1                     ; 5C5C   0281 02D9
        SLR     R1,     1                       ; 5C5E   0061
        SLR     R1,     2                       ; 5C5F   0065
        ANDI    #$000F, R1                      ; 5C60   03B9 000F
        BEQ     L_5C73                          ; 5C62   0204 000F

        CMPI    #$0006, R1                      ; 5C64   0379 0006
        BNEQ    L_5C73                          ; 5C66   020C 000B

        MVII    #$00FE, R1                      ; 5C68   02B9 00FE
        MVO     R1,     G_01B0                  ; 5C6A   0241 01B0
        MVII    #$0163, R3                      ; 5C6C   02BB 0163
        ADD     G_0165, R3                      ; 5C6E   02C3 0165
        MVII    #$0001, R1                      ; 5C70   02B9 0001
        MVO@    R1,     R3                      ; 5C72   0259
L_5C73:
        B       L_5B13                          ; 5C73   0220 0161

L_5C75:
        PSHR    R5                              ; 5C75   0275

        JSR     R5,     L_5B00                  ; 5C76   0004 0158 0300

        ADDI    #$0002, R5                      ; 5C79   02FD 0002
        MVI@    R5,     R1                      ; 5C7B   02A9
        SLR     R1,     1                       ; 5C7C   0061
        SLR     R1,     2                       ; 5C7D   0065
        SDBD                                    ; 5C7E   0001
        MVII    #$3A80, R2                      ; 5C7F   02BA 0080 003A
        ADDR    R1,     R2                      ; 5C82   00CA
        MVO     R2,     G_0345                  ; 5C83   0242 0345
        SDBD                                    ; 5C85   0001
        MVII    #$3B40, R2                      ; 5C86   02BA 0040 003B
        ADDR    R1,     R2                      ; 5C89   00CA
        MVO     R2,     G_034D                  ; 5C8A   0242 034D
        MVO     R2,     G_0355                  ; 5C8C   0242 0355
        PULR    R7                              ; 5C8E   02B7

L_5C8F:
        CLRR    R1                              ; 5C8F   01C9
        MVII    #$02CB, R4                      ; 5C90   02BC 02CB
        CMP@    R4,     R1                      ; 5C92   0361
        BNEQ    L_5C3F                          ; 5C93   022C 0055

        CMP@    R4,     R1                      ; 5C95   0361
        BNEQ    L_5C3F                          ; 5C96   022C 0058

        CMP@    R4,     R1                      ; 5C98   0361
        BNEQ    L_5C3F                          ; 5C99   022C 005B

        CMP     G_01BB, R1                      ; 5C9B   0341 01BB
        BNEQ    L_5C3F                          ; 5C9D   022C 005F

        PSHR    R2                              ; 5C9F   0272
        MVI     G_01BF, R2                      ; 5CA0   0282 01BF
        ADDI    #$0100, R2                      ; 5CA2   02FA 0100
        MVI@    R2,     R1                      ; 5CA4   0291
        MVI     G_0327, R2                      ; 5CA5   0282 0327
        SWAP    R2,     1                       ; 5CA7   0042
        CMPI    #$0028, R2                      ; 5CA8   037A 0028
        BGE     L_5CB9                          ; 5CAA   020D 000D

        CMPI    #$0020, R2                      ; 5CAC   037A 0020
        BLE     L_5CB9                          ; 5CAE   0206 0009

        PULR    R2                              ; 5CB0   02B2
        PSHR    R1                              ; 5CB1   0271
        CLRR    R1                              ; 5CB2   01C9
        CMP@    R4,     R1                      ; 5CB3   0361
        PULR    R1                              ; 5CB4   02B1
        BNEQ    L_5C3F                          ; 5CB5   022C 0077

        INCR    R3                              ; 5CB7   000B
        INCR    R7                              ; 5CB8   000F

L_5CB9:
        PULR    R2                              ; 5CB9   02B2
L_5CBA:
        TSTR    R1                              ; 5CBA   0089
        BNEQ    L_5CBE                          ; 5CBB   020C 0001

        INCR    R1                              ; 5CBD   0009
L_5CBE:
        INCR    R1                              ; 5CBE   0009
        MVO     R1,     G_01BB                  ; 5CBF   0241 01BB
        B       L_5C37                          ; 5CC1   0220 008B

        PSHR    R5                              ; 5CC3   0275

        JSR     R5,     L_5B00                  ; 5CC4   0004 0158 0300

        ADDI    #$0002, R4                      ; 5CC7   02FC 0002
        MVI@    R4,     R1                      ; 5CC9   02A1
        SLR     R1,     1                       ; 5CCA   0061
        ADDI    #$000B, R4                      ; 5CCB   02FC 000B
        MVI@    R4,     R2                      ; 5CCD   02A2
        SLR     R2,     1                       ; 5CCE   0062
        ADDR    R2,     R1                      ; 5CCF   00D1
        ADD     G_034B, R1                      ; 5CD0   02C1 034B
        ANDI    #$003F, R1                      ; 5CD2   03B9 003F
        INCR    R1                              ; 5CD4   0009
        MVO     R1,     G_034B                  ; 5CD5   0241 034B
        MVO     R1,     G_035B                  ; 5CD7   0241 035B
        PULR    R7                              ; 5CD9   02B7

L_5CDA:
        PSHR    R5                              ; 5CDA   0275

        JSR     R5,     L_5B00                  ; 5CDB   0004 0158 0300

        ADDI    #$0002, R5                      ; 5CDE   02FD 0002
        MVI@    R5,     R2                      ; 5CE0   02AA
        ADDR    R1,     R2                      ; 5CE1   00CA
        CMPI    #$001E, R2                      ; 5CE2   037A 001E
        BLT     L_5CEA                          ; 5CE4   0205 0004

        JSR     R5,     L_5B76                  ; 5CE6   0004 0158 0376

        PULR    R7                              ; 5CE9   02B7

L_5CEA:
        DECR    R5                              ; 5CEA   0015
        MVO@    R2,     R5                      ; 5CEB   026A
        PULR    R7                              ; 5CEC   02B7

        PSHR    R5                              ; 5CED   0275
        MVI     G_01B0, R0                      ; 5CEE   0280 01B0
        TSTR    R0                              ; 5CF0   0080
        BNEQ    L_5D14                          ; 5CF1   020C 0021

        MVI     G_01D0, R0                      ; 5CF3   0280 01D0
        TSTR    R0                              ; 5CF5   0080
        BNEQ    L_5D14                          ; 5CF6   020C 001C

        JSR     R5,     .EXEC.772               ; 5CF8   0004 0114 0372

        CMPI    #$0038, R3                      ; 5CFB   037B 0038
        BGE     L_5D14                          ; 5CFD   020D 0015

        MVI     G_0162, R1                      ; 5CFF   0281 0162
        SARC    R1,     1                       ; 5D01   0079
        BNC     L_5D14                          ; 5D02   0209 0010

        MVII    #$00FF, R1                      ; 5D04   02B9 00FF
        MVO     R1,     G_01D4                  ; 5D06   0241 01D4
        MVII    #$0019, R1                      ; 5D08   02B9 0019
        MVO     R1,     G_01B6                  ; 5D0A   0241 01B6

        JSR     R5,     L_5E3E                  ; 5D0C   0004 015C 023E

        MVII    #$0019, R1                      ; 5D0F   02B9 0019

        JSR     R5,     L_5CDA                  ; 5D11   0004 015C 00DA

L_5D14:
        PULR    R7                              ; 5D14   02B7

        PSHR    R5                              ; 5D15   0275
        MVI     G_01B8, R1                      ; 5D16   0281 01B8
        TSTR    R1                              ; 5D18   0089
        BNEQ    L_5D2D                          ; 5D19   020C 0012

        MVI     G_0162, R1                      ; 5D1B   0281 0162
        CMPI    #$0002, R1                      ; 5D1D   0379 0002
        BLT     L_5D14                          ; 5D1F   0225 000C

        JSR     R5,     L_5B76                  ; 5D21   0004 0158 0376

        MVII    #$0032, R1                      ; 5D24   02B9 0032
        ADD     G_01B6, R1                      ; 5D26   02C1 01B6
        MVO     R1,     G_01B6                  ; 5D28   0241 01B6
        MOVR    R1,     R2                      ; 5D2A   008A
        B       L_5E12                          ; 5D2B   0200 00E5

L_5D2D:
        MVII    #$00FF, R1                      ; 5D2D   02B9 00FF
        MVO     R1,     G_01B8                  ; 5D2F   0241 01B8

        JSR     R5,     L_5D8E                  ; 5D31   0004 015C 018E

        MVI     G_01D0, R1                      ; 5D34   0281 01D0
        TSTR    R1                              ; 5D36   0089
        BEQ     L_5D3A                          ; 5D37   0204 0001
        PULR    R7                              ; 5D39   02B7

L_5D3A:
        MVII    #$0002, R2                      ; 5D3A   02BA 0002
        B       L_5E12                          ; 5D3C   0200 00D4

        PSHR    R5                              ; 5D3E   0275
        MVI     G_01B8, R1                      ; 5D3F   0281 01B8
        PSHR    R1                              ; 5D41   0271
        MVII    #$00FF, R1                      ; 5D42   02B9 00FF
        MVO     R1,     G_01B8                  ; 5D44   0241 01B8

        JSR     R5,     L_5D8E                  ; 5D46   0004 015C 018E

        PULR    R1                              ; 5D49   02B1
        TSTR    R1                              ; 5D4A   0089
        BNEQ    L_5D54                          ; 5D4B   020C 0007

        CMP     G_01A3, R1                      ; 5D4D   0341 01A3
        BEQ     L_5D5D                          ; 5D4F   0204 000C

        JSR     R5,     L_5B76                  ; 5D51   0004 0158 0376

L_5D54:
        MVII    #$0064, R1                      ; 5D54   02B9 0064
        ADD     G_01B6, R1                      ; 5D56   02C1 01B6
        MVO     R1,     G_01B6                  ; 5D58   0241 01B6

        JSR     R5,     L_5BAE                  ; 5D5A   0004 0158 03AE

L_5D5D:
        PULR    R7                              ; 5D5D   02B7

L_5D5E:
        MVI     G_035E, R3                      ; 5D5E   0283 035E
        MVI     G_01B8, R1                      ; 5D60   0281 01B8
        TSTR    R1                              ; 5D62   0089
        BNEQ    L_5D89                          ; 5D63   020C 0024

        MVI     G_01C9, R1                      ; 5D65   0281 01C9
        XORI    #$0001, R1                      ; 5D67   03F9 0001
        MVO     R1,     G_01C9                  ; 5D69   0241 01C9
        BEQ     L_5D83                          ; 5D6B   0204 0016

        SARC    R3,     1                       ; 5D6D   007B
        BC      L_5D7B                          ; 5D6E   0201 000B

        SDBD                                    ; 5D70   0001
        MVII    #$3B1A, R1                      ; 5D71   02B9 001A 003B
        CLRR    R2                              ; 5D74   01D2
L_5D75:
        MVO     R1,     G_033D                  ; 5D75   0241 033D
        MVO     R2,     G_01CA                  ; 5D77   0242 01CA
        B       L_5D89                          ; 5D79   0200 000E

L_5D7B:
        SDBD                                    ; 5D7B   0001
        MVII    #$3F1A, R1                      ; 5D7C   02B9 001A 003F
        MVII    #$0014, R2                      ; 5D7F   02BA 0014
        B       L_5D75                          ; 5D81   0220 000D

L_5D83:
        SDBD                                    ; 5D83   0001
        MVII    #$231A, R1                      ; 5D84   02B9 001A 0023
        MVO     R1,     G_033D                  ; 5D87   0241 033D
L_5D89:
        ANDI    #$00FF, R3                      ; 5D89   03BB 00FF
        MVO     R3,     G_0353                  ; 5D8B   0243 0353
        MOVR    R5,     R7                      ; 5D8D   00AF

L_5D8E:
        PSHR    R5                              ; 5D8E   0275
        MVI     G_01B8, R2                      ; 5D8F   0282 01B8
        CMPI    #$00FF, R2                      ; 5D91   037A 00FF
        BEQ     L_5D9C                          ; 5D93   0204 0007

        MVI     G_0162, R1                      ; 5D95   0281 0162
        SLL     R1,     2                       ; 5D97   004D
        SLL     R1,     2                       ; 5D98   004D
        CMPR    R2,     R1                      ; 5D99   0151
        BGE     L_5DAF                          ; 5D9A   020D 0013

L_5D9C:
        CLRR    R1                              ; 5D9C   01C9
        MVO     R1,     G_01B8                  ; 5D9D   0241 01B8
        MVO     R1,     G_0341                  ; 5D9F   0241 0341
        MVO     R1,     G_0343                  ; 5DA1   0241 0343
        MVII    #$0026, R3                      ; 5DA3   02BB 0026
        SWAP    R3,     1                       ; 5DA5   0043
        MVO     R3,     G_0340                  ; 5DA6   0243 0340

        JSR     R5,     L_5F62                  ; 5DA8   0004 015C 0362
        JSR     R5,     L_5D5E                  ; 5DAB   0004 015C 015E

        PULR    R7                              ; 5DAE   02B7

L_5DAF:
        DECR    R2                              ; 5DAF   0012
        BPL     L_5DB6                          ; 5DB0   0203 0004

        MVI     G_0347, R1                      ; 5DB2   0281 0347
        MVO     R1,     G_033F                  ; 5DB4   0241 033F
L_5DB6:
        CLRR    R0                              ; 5DB6   01C0

        JSR     R5,     .EXEC.772               ; 5DB7   0004 0114 0372

        SWAP    R2,     1                       ; 5DBA   0042
        XORR    R3,     R2                      ; 5DBB   01DA
        MVII    #$0070, R0                      ; 5DBC   02B8 0070

        JSR     R5,     X_RAND2                 ; 5DBE   0004 0114 029E

        SUBI    #$030A, R2                      ; 5DC1   033A 030A
        SWAP    R2,     1                       ; 5DC3   0042
        SARC    R0,     1                       ; 5DC4   0078
        BNC     L_5DC9                          ; 5DC5   0209 0002

        SUBR    R0,     R2                      ; 5DC7   0102
        INCR    R7                              ; 5DC8   000F

L_5DC9:
        ADDR    R0,     R2                      ; 5DC9   00C2
L_5DCA:
        SWAP    R2,     1                       ; 5DCA   0042
        CMPI    #$0024, R3                      ; 5DCB   037B 0024
        BGT     L_5DD1                          ; 5DCD   020E 0002

        ADDI    #$0008, R2                      ; 5DCF   02FA 0008
L_5DD1:
        MVII    #$033D, R1                      ; 5DD1   02B9 033D
        MVII    #$0030, R3                      ; 5DD3   02BB 0030

        JSR     R5,     .EXEC.9A1               ; 5DD5   0004 0118 01A1

        SDBD                                    ; 5DD8   0001
        MVII    #$1B0A, R1                      ; 5DD9   02B9 000A 001B
        MVO     R1,     G_033D                  ; 5DDC   0241 033D
        MVI     G_01B8, R1                      ; 5DDE   0281 01B8
        INCR    R1                              ; 5DE0   0009
        MVO     R1,     G_01B8                  ; 5DE1   0241 01B8

        JSR     R5,     L_5F7E                  ; 5DE3   0004 015C 037E

        PULR    R7                              ; 5DE6   02B7

        PSHR    R5                              ; 5DE7   0275

        JSR     R5,     L_5BDE                  ; 5DE8   0004 0158 03DE

        MVI     G_01D0, R0                      ; 5DEB   0280 01D0
        TSTR    R0                              ; 5DED   0080
        BNEQ    L_5E3D                          ; 5DEE   020C 004D

        JSR     R5,     .EXEC.772               ; 5DF0   0004 0114 0372

        MVI     G_0347, R0                      ; 5DF3   0280 0347
        SWAP    R0,     1                       ; 5DF5   0040
        ANDI    #$00FF, R0                      ; 5DF6   03B8 00FF
        CMPR    R0,     R2                      ; 5DF8   0142
        BLT     L_5E05                          ; 5DF9   0205 000A

        ADDI    #$0010, R2                      ; 5DFB   02FA 0010
        CMPI    #$0090, R2                      ; 5DFD   037A 0090
        BLT     L_5E0D                          ; 5DFF   0205 000C

        MVII    #$0090, R2                      ; 5E01   02BA 0090
        B       L_5E0D                          ; 5E03   0200 0008

L_5E05:
        SUBI    #$0010, R2                      ; 5E05   033A 0010
        CMPI    #$0050, R2                      ; 5E07   037A 0050
        BGT     L_5E0D                          ; 5E09   020E 0002

        MVII    #$0050, R2                      ; 5E0B   02BA 0050
L_5E0D:
        SWAP    R2,     1                       ; 5E0D   0042
        MVO     R2,     G_031F                  ; 5E0E   0242 031F
        MVII    #$0001, R2                      ; 5E10   02BA 0001
L_5E12:
        MVI     G_01D4, R3                      ; 5E12   0283 01D4
        ADDR    R2,     R3                      ; 5E14   00D3
        CMPI    #$0004, R3                      ; 5E15   037B 0004
        BLT     L_5E1C                          ; 5E17   0205 0003

        JSR     R5,     L_5E3E                  ; 5E19   0004 015C 023E

L_5E1C:
        MVO     R3,     G_01D4                  ; 5E1C   0243 01D4
        B       L_5E34                          ; 5E1E   0200 0014

        PSHR    R5                              ; 5E20   0275
        MVI     G_01B0, R0                      ; 5E21   0280 01B0
        TSTR    R0                              ; 5E23   0080
        BNEQ    L_5E3D                          ; 5E24   020C 0017

        JSR     R5,     .EXEC.772               ; 5E26   0004 0114 0372

        CMPI    #$0048, R3                      ; 5E29   037B 0048
        BLE     L_5E3D                          ; 5E2B   0206 0010

        SUBI    #$0008, R3                      ; 5E2D   033B 0008
        SWAP    R3,     1                       ; 5E2F   0043
        MVO     R3,     G_0320                  ; 5E30   0243 0320
        B       L_5E3A                          ; 5E32   0200 0006

L_5E34:
        SDBD                                    ; 5E34   0001
        MVII    #$1A06, R1                      ; 5E35   02B9 0006 001A
        MVO     R1,     G_031D                  ; 5E38   0241 031D

L_5E3A:
        JSR     R5,     L_5FBA                  ; 5E3A   0004 015C 03BA

L_5E3D:
        PULR    R7                              ; 5E3D   02B7

L_5E3E:
        PSHR    R5                              ; 5E3E   0275
        MVII    #$00FF, R3                      ; 5E3F   02BB 00FF
        MVO     R3,     G_01B0                  ; 5E41   0243 01B0
        DECR    R3                              ; 5E43   0013
        MVO     R3,     G_01EE                  ; 5E44   0243 01EE
        SDBD                                    ; 5E46   0001
        MVII    #$1A06, R1                      ; 5E47   02B9 0006 001A
        MVO     R1,     G_031D                  ; 5E4A   0241 031D
        MVII    #$0030, R3                      ; 5E4C   02BB 0030
        SDBD                                    ; 5E4E   0001
        MVII    #$704D, R2                      ; 5E4F   02BA 004D 0070
        MVII    #$031D, R1                      ; 5E52   02B9 031D

        JSR     R5,     .EXEC.9A1               ; 5E54   0004 0118 01A1
        JSR     R5,     L_5FCA                  ; 5E57   0004 015C 03CA

        PULR    R7                              ; 5E5A   02B7

        PSHR    R5                              ; 5E5B   0275
        CLRR    R0                              ; 5E5C   01C0
        MVO     R0,     G_0321                  ; 5E5D   0240 0321
        MVI     G_01B0, R1                      ; 5E5F   0281 01B0
        TSTR    R1                              ; 5E61   0089
        BEQ     L_5E73                          ; 5E62   0204 000F

        CMPI    #$00FF, R1                      ; 5E64   0379 00FF
        BNEQ    L_5E73                          ; 5E66   020C 000B

        DECR    R1                              ; 5E68   0011
        MVO     R1,     G_01B0                  ; 5E69   0241 01B0
        MVII    #$0003, R0                      ; 5E6B   02B8 0003
        MVO     R0,     G_0102                  ; 5E6D   0240 0102
        SLR     R1,     1                       ; 5E6F   0061

        JSR     R5,     L_5E74                  ; 5E70   0004 015C 0274

L_5E73:
        PULR    R7                              ; 5E73   02B7

L_5E74:
        MVII    #$03FF, R0                      ; 5E74   02B8 03FF
L_5E76:
        DECR    R0                              ; 5E76   0010
        BNEQ    L_5E76                          ; 5E77   022C 0002

        DECR    R1                              ; 5E79   0011
        BNEQ    L_5E74                          ; 5E7A   022C 0007
        MOVR    R5,     R7                      ; 5E7C   00AF

L_5E7D:
        PSHR    R5                              ; 5E7D   0275
        MVI     G_01B6, R2                      ; 5E7E   0282 01B6
        MVI     G_0165, R0                      ; 5E80   0280 0165
        MVII    #$0167, R3                      ; 5E82   02BB 0167
        SLL     R0,     1                       ; 5E84   0048
        ADDR    R0,     R3                      ; 5E85   00C3
        CLRR    R1                              ; 5E86   01C9
        MVO     R1,     G_01B6                  ; 5E87   0241 01B6
        MVII    #$0064, R4                      ; 5E89   02BC 0064
        ADD@    R3,     R2                      ; 5E8B   02DA
        CLRR    R1                              ; 5E8C   01C9
        CMPR    R4,     R2                      ; 5E8D   0162
        BLT     L_5E95                          ; 5E8E   0205 0005

L_5E90:
        SUBR    R4,     R2                      ; 5E90   0122
        INCR    R1                              ; 5E91   0009
        CMPR    R4,     R2                      ; 5E92   0162
        BGE     L_5E90                          ; 5E93   022D 0004

L_5E95:
        MVO@    R2,     R3                      ; 5E95   025A
        DECR    R3                              ; 5E96   0013
        ADD@    R3,     R1                      ; 5E97   02D9
L_5E98:
        CMPR    R4,     R1                      ; 5E98   0161
        BLT     L_5E9E                          ; 5E99   0205 0003

        SUBR    R4,     R1                      ; 5E9B   0121
        B       L_5E98                          ; 5E9C   0220 0005

L_5E9E:
        MOVR    R1,     R4                      ; 5E9E   008C
        CLRR    R0                              ; 5E9F   01C0
L_5EA0:
        SUBI    #$0002, R4                      ; 5EA0   033C 0002
        BMI     L_5EA7                          ; 5EA2   020B 0003

        INCR    R0                              ; 5EA4   0008
        B       L_5EA0                          ; 5EA5   0220 0006

L_5EA7:
        CMPI    #$0003, R0                      ; 5EA7   0378 0003
        BLE     L_5EAD                          ; 5EA9   0206 0002

        MVII    #$0003, R0                      ; 5EAB   02B8 0003
L_5EAD:
        CMP     G_016B, R0                      ; 5EAD   0340 016B
        BLE     L_5EB3                          ; 5EAF   0206 0002

        MVO     R0,     G_016B                  ; 5EB1   0240 016B
L_5EB3:
        MVO@    R1,     R3                      ; 5EB3   0259
        MVO     R3,     G_01B7                  ; 5EB4   0243 01B7
        CLRR    R2                              ; 5EB6   01D2
L_5EB7:
        SUBI    #$0014, R1                      ; 5EB7   0339 0014
        BMI     L_5EBE                          ; 5EB9   020B 0003

        INCR    R2                              ; 5EBB   000A
        B       L_5EB7                          ; 5EBC   0220 0006

L_5EBE:
        MVII    #$016C, R1                      ; 5EBE   02B9 016C
        ADD     G_0165, R1                      ; 5EC0   02C1 0165
        CMP@    R1,     R2                      ; 5EC2   034A
        BEQ     L_5ED0                          ; 5EC3   0204 000B

        MVO@    R2,     R1                      ; 5EC5   024A
        MVII    #$0163, R2                      ; 5EC6   02BA 0163
        ADD     G_0165, R2                      ; 5EC8   02C2 0165
        MVI@    R2,     R1                      ; 5ECA   0291
        INCR    R1                              ; 5ECB   0009
        MVO@    R1,     R2                      ; 5ECC   0251

        JSR     R5,     L_5219                  ; 5ECD   0004 0150 0219
L_5ED0:
        JSR     R4,     L_5ED7                  ; 5ED0   0004 005C 02D7

        DECR    R0                              ; 5ED3   0010
        INCR    R5                              ; 5ED4   000D
        INCR    R2                              ; 5ED5   000A
        INCR    R1                              ; 5ED6   0009
L_5ED7:
        ADD     G_016B, R4                      ; 5ED7   02C4 016B
        MVI@    R4,     R1                      ; 5ED9   02A1
        MVO     R1,     G_01E3                  ; 5EDA   0241 01E3
        MVI     G_016B, R0                      ; 5EDC   0280 016B
        MOVR    R0,     R1                      ; 5EDE   0081
        ADDI    #$0002, R0                      ; 5EDF   02F8 0002
        SLL     R0,     2                       ; 5EE1   004C
        SLL     R0,     1                       ; 5EE2   0048
        NEGR    R0                              ; 5EE3   0020
        ADDI    #$0032, R0                      ; 5EE4   02F8 0032
        MVO     R0,     G_01E1                  ; 5EE6   0240 01E1
        SLL     R1,     2                       ; 5EE8   004D
        ADDI    #$0033, R1                      ; 5EE9   02F9 0033
        MVO     R1,     G_01E2                  ; 5EEB   0241 01E2
        PULR    R7                              ; 5EED   02B7

        ADDR    R4,     R2                      ; 5EEE   00E2
        MOVR    R4,     R6                      ; 5EEF   00A6
        MOVR    R4,     R2                      ; 5EF0   00A2
        MOVR    R4,     R2                      ; 5EF1   00A2
        ADDR    R4,     R2                      ; 5EF2   00E2
        ADDR    R5,     R6                      ; 5EF3   00EE
        NEGR    R2                              ; 5EF4   0022
        ADDR    R5,     R6                      ; 5EF5   00EE
        MOVR    R0,     R2                      ; 5EF6   0082
        ADDR    R5,     R6                      ; 5EF7   00EE
        MOVR    R5,     R6                      ; 5EF8   00AE
        MOVR    R5,     R0                      ; 5EF9   00A8
        ADDR    R5,     R6                      ; 5EFA   00EE
        NEGR    R2                              ; 5EFB   0022
        ADCR    R6                              ; 5EFC   002E
        ADDR    R5,     R6                      ; 5EFD   00EE
        MOVR    R0,     R2                      ; 5EFE   0082
        ADDR    R4,     R2                      ; 5EFF   00E2
        TSTR    R4                              ; 5F00   00A4
        ADDR    R5,     R0                      ; 5F01   00E8
        ADDR    R5,     R6                      ; 5F02   00EE
        MOVR    R5,     R2                      ; 5F03   00AA
        ADDR    R5,     R6                      ; 5F04   00EE
        MOVR    R4,     R2                      ; 5F05   00A2
        ADDR    R4,     R2                      ; 5F06   00E2
L_5F07:
        PSHR    R5                              ; 5F07   0275
        MVII    #$0166, R3                      ; 5F08   02BB 0166
        MVI     G_0165, R0                      ; 5F0A   0280 0165
        SLL     R0,     1                       ; 5F0C   0048
        MOVR    R0,     R4                      ; 5F0D   0084
        ADDR    R3,     R4                      ; 5F0E   00DC
        MVI@    R4,     R3                      ; 5F0F   02A3
        SLL     R0,     2                       ; 5F10   004C
        SLL     R0,     1                       ; 5F11   0048
        PSHR    R4                              ; 5F12   0274
        SDBD                                    ; 5F13   0001
        MVII    #$3813, R2                      ; 5F14   02BA 0013 0038
        ADDR    R0,     R2                      ; 5F17   00C2
        PSHR    R2                              ; 5F18   0272

        JSR     R5,     L_5F27                  ; 5F19   0004 015C 0327

        PULR    R2                              ; 5F1C   02B2
        PULR    R4                              ; 5F1D   02B4
        ADDI    #$0008, R2                      ; 5F1E   02FA 0008
        MVI@    R4,     R3                      ; 5F20   02A3

        JSR     R5,     L_5F27                  ; 5F21   0004 015C 0327

        MVO     R3,     G_01B7                  ; 5F24   0243 01B7
        PULR    R7                              ; 5F26   02B7

L_5F27:
        PSHR    R5                              ; 5F27   0275
        SDBD                                    ; 5F28   0001
        MVII    #$5EEE, R5                      ; 5F29   02BD 00EE 005E
        MOVR    R5,     R4                      ; 5F2C   00AC
        CLRR    R0                              ; 5F2D   01C0
        CLRR    R1                              ; 5F2E   01C9
L_5F2F:
        CMPI    #$0014, R3                      ; 5F2F   037B 0014
        BLT     L_5F39                          ; 5F31   0205 0006

        SUBI    #$0014, R3                      ; 5F33   033B 0014
        ADDI    #$0005, R4                      ; 5F35   02FC 0005
        B       L_5F2F                          ; 5F37   0220 0009

L_5F39:
        CMPI    #$000A, R3                      ; 5F39   037B 000A
        BLT     L_5F41                          ; 5F3B   0205 0004

        SUBI    #$000A, R3                      ; 5F3D   033B 000A
        MVII    #$0001, R0                      ; 5F3F   02B8 0001
L_5F41:
        SARC    R3,     1                       ; 5F41   007B
        RLC     R1,     1                       ; 5F42   0051
        ADDR    R3,     R5                      ; 5F43   00DD
        SLL     R3,     2                       ; 5F44   004F
        ADDR    R3,     R5                      ; 5F45   00DD
        MVII    #$0005, R3                      ; 5F46   02BB 0005
L_5F48:
        PSHR    R3                              ; 5F48   0273
        MVI@    R4,     R3                      ; 5F49   02A3
        TSTR    R0                              ; 5F4A   0080
        BEQ     L_5F4F                          ; 5F4B   0204 0002

        SLL     R3,     2                       ; 5F4D   004F
        SLL     R3,     2                       ; 5F4E   004F
L_5F4F:
        ANDI    #$00F0, R3                      ; 5F4F   03BB 00F0
        PSHR    R3                              ; 5F51   0273
        MVI@    R5,     R3                      ; 5F52   02AB
        TSTR    R1                              ; 5F53   0089
        BNEQ    L_5F58                          ; 5F54   020C 0002

        SLR     R3,     2                       ; 5F56   0067
        SLR     R3,     2                       ; 5F57   0067
L_5F58:
        ANDI    #$000F, R3                      ; 5F58   03BB 000F
        XOR@    R6,     R3                      ; 5F5A   03F3
        MVO@    R3,     R2                      ; 5F5B   0253
        INCR    R2                              ; 5F5C   000A
        PULR    R3                              ; 5F5D   02B3
        DECR    R3                              ; 5F5E   0013
        BNEQ    L_5F48                          ; 5F5F   022C 0018
        PULR    R7                              ; 5F61   02B7

L_5F62:
        PSHR    R5                              ; 5F62   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F63   0004 0118 03BB
        DECLE   $02CF                           ; 5F66  SFX end

L_5F67:
        PSHR    R5                              ; 5F67   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F68   0004 0118 03BE
        DECLE   $0002                           ; 5F6B  SFX prio
        DECLE   $03C9                           ; 5F6C  SFX data
        DECLE   $0320,  $0170                   ; 5F6D  SFX data
        DECLE   $0318,  $00D5                   ; 5F6F  SFX data
        DECLE   $0314,  $005A                   ; 5F71  SFX data
        DECLE   $032B                           ; 5F73  SFX data
        DECLE   $0189                           ; 5F74  SFX data
        DECLE   $03B7                           ; 5F75  SFX data
        DECLE   $003C,  $0100                   ; 5F76  SFX data
        DECLE   $024F,  $000F                   ; 5F78  SFX data
        DECLE   $0009                           ; 5F7A  SFX data
        DECLE   $0063,  $03EE                   ; 5F7B  SFX data
        DECLE   $02CF                           ; 5F7D  SFX end

L_5F7E:
        PSHR    R5                              ; 5F7E   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F7F   0004 0118 03BE
        DECLE   $0004                           ; 5F82  SFX prio
        DECLE   $03C8,  $01FB                   ; 5F83  SFX data
        DECLE   $03C4,  $01CB                   ; 5F85  SFX data
        DECLE   $031D                           ; 5F87  SFX data
        DECLE   $009B                           ; 5F88  SFX data
        DECLE   $0023,  $03F0                   ; 5F89  SFX data
        DECLE   $02CF                           ; 5F8B  SFX end

L_5F8C:
        PSHR    R5                              ; 5F8C   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F8D   0004 0118 03BE
        DECLE   $000C                           ; 5F90  SFX prio
        DECLE   $03C9                           ; 5F91  SFX data
        DECLE   $03C0,  $008E                   ; 5F92  SFX data
        DECLE   $03C8,  $0047                   ; 5F94  SFX data
        DECLE   $0001,  $00F8                   ; 5F96  SFX data
        DECLE   $0001,  $00FA                   ; 5F98  SFX data
        DECLE   $019D                           ; 5F9A  SFX data
        DECLE   $0183,  $03F8                   ; 5F9B  SFX data
        DECLE   $02CF                           ; 5F9D  SFX end

L_5F9E:
        PSHR    R5                              ; 5F9E   0275

        JSR     R5,     X_PLAY_SFX2             ; 5F9F   0004 0118 03BE
        DECLE   $000A                           ; 5FA2  SFX prio
        DECLE   $03C9                           ; 5FA3  SFX data
        DECLE   $0340,  $01FB                   ; 5FA4  SFX data
        DECLE   $0348,  $01FB                   ; 5FA6  SFX data
        DECLE   $0001,  $03C0                   ; 5FA8  SFX data
        DECLE   $008F,  $002D                   ; 5FAA  SFX data
        DECLE   $02CF                           ; 5FAC  SFX end

L_5FAD:
        PSHR    R5                              ; 5FAD   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FAE   0004 0118 03BE
        DECLE   $000C                           ; 5FB1  SFX prio
        DECLE   $0079                           ; 5FB2  SFX data
        DECLE   $011C,  $00AB                   ; 5FB3  SFX data
        DECLE   $000B                           ; 5FB5  SFX data
        DECLE   $03B7                           ; 5FB6  SFX data
        DECLE   $008F,  $0027                   ; 5FB7  SFX data
        DECLE   $02CF                           ; 5FB9  SFX end

L_5FBA:
        PSHR    R5                              ; 5FBA   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FBB   0004 0118 03BE
        DECLE   $0010                           ; 5FBE  SFX prio
        DECLE   $0079                           ; 5FBF  SFX data
        DECLE   $03F5                           ; 5FC0  SFX data
        DECLE   $00EB                           ; 5FC1  SFX data
        DECLE   $02CF                           ; 5FC2  SFX end

L_5FC3:
        PSHR    R5                              ; 5FC3   0275

        JSR     R5,     X_PLAY_MUS1             ; 5FC4   0004 0118 0327
        DECLE   $0017                           ; 5FC7  Note (short)
        DECLE   $0000                           ; 5FC8  End of music

        PULR    R7                              ; 5FC9   02B7

L_5FCA:
        PSHR    R5                              ; 5FCA   0275

        JSR     R5,     X_PLAY_SFX1             ; 5FCB   0004 0118 03BB
        DECLE   $004F,  $00FF                   ; 5FCE  SFX data
        DECLE   $0079                           ; 5FD0  SFX data
        DECLE   $03ED                           ; 5FD1  SFX data
        DECLE   $03F5                           ; 5FD2  SFX data
        DECLE   $00C7                           ; 5FD3  SFX data
        DECLE   $0077,  $00DA,  $005F           ; 5FD4  SFX data
        DECLE   $0023,  $03E8                   ; 5FD7  SFX data
        DECLE   $02CF                           ; 5FD9  SFX end

UC_5FDA:
        MVI     G_01EE, R1                      ; 5FDA  SLIB UCALL target
        TSTR    R1                              ; 5FDC   0089
        BNEQ    L_5FEA                          ; 5FDD   020C 000B

        MVII    #$015C, R3                      ; 5FDF   02BB 015C
        MVI@    R3,     R1                      ; 5FE1   0299
        INCR    R1                              ; 5FE2   0009
        MVO@    R1,     R3                      ; 5FE3   0259
        INCR    R3                              ; 5FE4   000B
        MVI@    R3,     R1                      ; 5FE5   0299
        INCR    R1                              ; 5FE6   0009
        MVO@    R1,     R3                      ; 5FE7   0259
        B       L_5FFD                          ; 5FE8   0200 0013

L_5FEA:
        MVI     G_0159, R2                      ; 5FEA   0282 0159
        CMPI    #$00FE, R1                      ; 5FEC   0379 00FE
        BEQ     L_5FF9                          ; 5FEE   0204 0009

        DECR    R2                              ; 5FF0   0012
L_5FF1:
        CMPI    #$0002, R2                      ; 5FF1   037A 0002
        BLE     L_5FFD                          ; 5FF3   0206 0008

        MVO     R2,     G_0159                  ; 5FF5   0242 0159
        B       L_5FFD                          ; 5FF7   0200 0004

L_5FF9:
        SUBI    #$0004, R2                      ; 5FF9   033A 0004
        B       L_5FF1                          ; 5FFB   0220 000B
L_5FFD:
        PULR    R7                              ; 5FFD   02B7

        DECLE   $0000                           ; 5FFE   0000

        SUB@    R5,     R1                      ; 5FFF   0329
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502A       <entry>
;;  $5085       $5A58  
;;  $5086       $5084   $50A7  
;;  $50AA       <entry>
;;  $50B8       $50AB  
;;  $50EE       $50EC  
;;  $5106       $50EA  
;;  $5112       $510A  
;;  $512E       $50F0   $50F3   $510E  
;;  $5132       $50E3  
;;  $5140       $514D  
;;  $5144       $514A  
;;  $514F       $58BA  
;;  $516D       $5177  
;;  $5171       $5174  
;;  $51A8       $519C  
;;  $51D6       $51BC  
;;  $51F5       $502B   $50C1  
;;  $51FD       $5158   $5595  
;;  $5207       $5211  
;;  $520B       $520E  
;;  $5219       $51A8   $5ECD  
;;  $5223       $5242  
;;  $5225       $5221  
;;  $522E       $5236   $523B  
;;  $5238       $522F  
;;  $523D       $5234  
;;  $5244       $523E  
;;  $5245       $5187   $5AFC   $5C4B  
;;  $5252       $5266  
;;  $5263       $525A  
;;  $5264       $5262  
;;  $5269       $51F1  
;;  $5276       $5269  
;;  $528D       $5285  
;;  $5298       $5288  
;;  $52AE       $52A9  
;;  $52B7       $52B2  
;;  $52B8       $52B6  
;;  $52BA       $52B0  
;;  $52C6       $52BE  
;;  $52CB       $52BC  
;;  $52D5       $52CF  
;;  $52D9       $52CD  
;;  $52DA       $52A7   $52AC   $52B8   $52C4   $52C9   $52D3   $52D8  
;;  $52E1       $527C   $5281  
;;  $52FD       $52FA  
;;  $5310       $52E5   $52EB   $52F4  
;;  $5522       $558A  
;;  $5535       $5539  
;;  $5555       $555E  
;;  $5558       $555B  
;;  $5563       $5544  
;;  $5569       $5588  
;;  $5573       $556C  
;;  $5582       $54FB  
;;  $558C       $5567   $5571   $5578   $559B   $5723   $5735  
;;  $558F       $561B   $5690  
;;  $559D       $551E  
;;  $55B6       $51D0   $55B1   $5C00  
;;  $55D5       $55C1  
;;  $55DE       $55CC  
;;  $55DF       $55AF  
;;  $55F8       $55F2  
;;  $5609       $55A2   $55A7   $55B4   $55F6   $5601  
;;  $5616       $560E  
;;  $5618       $557C  
;;  $5629       $564E  
;;  $5637       $5633   $5641  
;;  $5640       $563C  
;;  $564D       $5648  
;;  $5654       $561F  
;;  $565E       $5686  
;;  $566E       $567C  
;;  $568D       $557E  
;;  $569E       $56CF  
;;  $56AC       $56A8  
;;  $56B0       $56AC   $56BE  
;;  $56B9       $56B5  
;;  $56BD       $56B9  
;;  $56C9       $56C5  
;;  $56CD       $56C9  
;;  $56D5       $5694  
;;  $56DF       $5707  
;;  $56EF       $56FD  
;;  $570E       $5580  
;;  $571C       $5652   $56D3  
;;  $5725       $5711  
;;  $572E       $568B   $570C  
;;  $5737       $54F7  
;;  $5754       $5747  
;;  $575C       $5752   $57A1   $57D8   $57F3   $57FF   $5806  
;;  $575E       $54F4   $5520   $5616   $573C  
;;  $5761       $5740  
;;  $576E       $579F  
;;  $577C       $5778  
;;  $5780       $577C   $578E  
;;  $5789       $5785  
;;  $578D       $5789  
;;  $5799       $5795  
;;  $579D       $5799  
;;  $57A3       $5764  
;;  $57AD       $57D5  
;;  $57BD       $57CB  
;;  $57EB       $57E0  
;;  $57F3       $57E9  
;;  $57F5       $5742  
;;  $5801       $57F8  
;;  $5808       $553B   $5592  
;;  $5813       $581D  
;;  $5817       $581A  
;;  $5820       $553E   $57EB  
;;  $5824       $57E6  
;;  $582B       $5834  
;;  $5837       $5717   $574B   $574F   $57FC  
;;  $583E       $5845  
;;  $584C       $5727   $5756   $5759   $57F0   $5803  
;;  $5853       $5860  
;;  $5868       <entry>
;;  $5875       $5870  
;;  $58A3       $588C  
;;  $58BA       $58AD   $58B6  
;;  $58BD       $58A6  
;;  $58DE       $587F  
;;  $58FA       $58F3  
;;  $58FE       $58F8  
;;  $590D       $5907  
;;  $5910       $590B  
;;  $5911       $58E5   $58EF   $58F6   $58FB  
;;  $592F       $5914  
;;  $5938       $5932  
;;  $593C       $5938   $5942  
;;  $5944       $593D  
;;  $594F       $5948  
;;  $5960       $5936   $594D  
;;  $596C       $5969  
;;  $598B       $5988  
;;  $5992       $598F  
;;  $59C3       $5977   $597B   $5980   $5984   $5997   $59A9   $59B2  
;;  $59CD       $59C6  
;;  $59D0       $59CB  
;;  $59DE       $59D8  
;;  $59EA       $59E3  
;;  $59EF       $59E8  
;;  $5A00       $59FC  
;;  $5A05       $59FE  
;;  $5A06       $5A02  
;;  $5A18       $5A12  
;;  $5A1B       $5A16  
;;  $5A1C       $5A1A  
;;  $5A39       $59D3   $59DC   $59ED  
;;  $5A5D       $5A4B  
;;  $5A64       $5A3C  
;;  $5A76       $5A6B  
;;  $5A83       $5A40   $5A5B   $5A62   $5A67  
;;  $5A9F       $5A98  
;;  $5AAB       $5AA6  
;;  $5AB0       $5A87   $5A93   $5A9D   $5AA9  
;;  $5AB2       $5A8C   $5AAE  
;;  $5AC4       $5AC0  
;;  $5AC7       $5AB6  
;;  $5AD9       $5AD5  
;;  $5ADC       $5879   $5ACB  
;;  $5ADD       $5B82  
;;  $5AEB       $5AF5  
;;  $5AF7       $5AE3  
;;  $5B00       $51BE   $524D   $5ADE   $5C28   $5C76   $5CC4   $5CDB  
;;  $5B0C       $5B08  
;;  $5B13       $5C73  
;;  $5B1E       $5B6F  
;;  $5B25       $5B21  
;;  $5B4A       $5B3F  
;;  $5B4F       $5B48  
;;  $5B57       $5B5E  
;;  $5B5C       $5B59  
;;  $5B60       $5B55  
;;  $5B68       $5B2F   $5B32   $5B3C  
;;  $5B71       $5B16   $5B6C  
;;  $5B76       $59C8   $5CE6   $5D21   $5D51  
;;  $5B8D       $5B7A  
;;  $5B9F       $5B92  
;;  $5BAE       $5872   $5BCC   $5BD1   $5D5A  
;;  $5BCC       $5BB8   $5BC0  
;;  $5BDE       $5BD4   $5DE8  
;;  $5C03       $5BFB  
;;  $5C15       $5C0C  
;;  $5C23       $5C1E  
;;  $5C24       $5C20  
;;  $5C32       $5C46  
;;  $5C37       $5CC1  
;;  $5C3F       $5C3A   $5C93   $5C96   $5C99   $5C9D   $5CB5  
;;  $5C5C       $5C51  
;;  $5C73       $5C62   $5C66  
;;  $5C75       $51D3   $59CD  
;;  $5C8F       $5C38  
;;  $5CB9       $5CAA   $5CAE  
;;  $5CBA       $5CB8  
;;  $5CBE       $5CBB  
;;  $5CDA       $5BC9   $5D11  
;;  $5CEA       $5CE4  
;;  $5D14       $5CF1   $5CF6   $5CFD   $5D02   $5D1F  
;;  $5D2D       $5D19  
;;  $5D3A       $5D37  
;;  $5D54       $5D4B  
;;  $5D5D       $5D4F  
;;  $5D5E       $5DAB  
;;  $5D75       $5D81  
;;  $5D7B       $5D6E  
;;  $5D83       $5D6B  
;;  $5D89       $5D63   $5D79  
;;  $5D8E       $5AAB   $5D31   $5D46  
;;  $5D9C       $5B9D   $5D93  
;;  $5DAF       $5D9A  
;;  $5DB6       $5DB0  
;;  $5DC9       $5DC5  
;;  $5DCA       $5DC8  
;;  $5DD1       $5DCD  
;;  $5E05       $5DF9  
;;  $5E0D       $5DFF   $5E03   $5E09  
;;  $5E12       $5D2B   $5D3C  
;;  $5E1C       $5E17  
;;  $5E34       $5E1E  
;;  $5E3A       $5E32  
;;  $5E3D       $5DEE   $5E24   $5E2B  
;;  $5E3E       $5D0C   $5E19  
;;  $5E73       $5E62   $5E66  
;;  $5E74       $589C   $5E70   $5E7A  
;;  $5E76       $5E77  
;;  $5E7D       <entry>
;;  $5E90       $5E93  
;;  $5E95       $5E8E  
;;  $5E98       $5E9C  
;;  $5E9E       $5E99  
;;  $5EA0       $5EA5  
;;  $5EA7       $5EA2  
;;  $5EAD       $5EA9  
;;  $5EB3       $5EAF  
;;  $5EB7       $5EBC  
;;  $5EBE       $5EB9  
;;  $5ED0       $5EC3  
;;  $5ED7       $5ED0  
;;  $5F07       $556E  
;;  $5F27       $5F19   $5F21  
;;  $5F2F       $5F37  
;;  $5F39       $5F31  
;;  $5F41       $5F3B  
;;  $5F48       $5F5F  
;;  $5F4F       $5F4B  
;;  $5F58       $5F54  
;;  $5F62       $5881   $5A73   $5DA8  
;;  $5F67       $5BEC  
;;  $5F7E       $5DE3  
;;  $5F8C       $530D  
;;  $5F9E       $5C0E   $5C59  
;;  $5FAD       $5A36  
;;  $5FBA       $5E3A  
;;  $5FC3       $51D6   $59C0  
;;  $5FCA       $5897   $5B87   $5E57  
;;  $5FDA       <entry>
;;  $5FEA       $5FDD  
;;  $5FF1       $5FFB  
;;  $5FF9       $5FEE  
;;  $5FFD       $5FE8   $5FF3   $5FF7  
;; ======================================================================== ;;
