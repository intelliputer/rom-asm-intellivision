
        ORG     $5000
.HEADER:
        BIDECLE $67B1           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $51DA           ; 5004  Ptr: Start of game
        BIDECLE $58EC           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $58DF           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5036           ; 500A  Ptr: Date/Title
        DECLE   $0040           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0005,  $0005   ; 500F  Color Stack init (0, 1)
        DECLE   $0005,  $0005   ; 5011  Color Stack init (2, 3)
        DECLE   $0005           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01E8   ; 5018   01C0 01D0 01E0 01E8
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $005A,  $0050,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $00C0,  $00D6,  $0002,  $0000; 5024  Timer dispatch/interval
        DECLE   $0085,  $0050,  $0005,  $0000; 5028  Timer dispatch/interval
        DECLE   $0044,  $0050,  $0014,  $0000; 502C  Timer dispatch/interval
        DECLE   $004F,  $0050,  $0028,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.TITLE:
        DECLE   $0053                           ; 5036  Cartridge year
        STRING  "SUPER SOCCER"                  ; 5037  Title string
        DECLE   $0000                           ; 5043  

L_5044:
        PSHR    R5                              ; 5044   0275

        JSR     R5,     L_D669                  ; 5045   0004 01D4 0269
        JSR     R5,     L_66A3                  ; 5048   0004 0164 02A3
        JSR     R5,     L_5B40                  ; 504B   0004 0158 0340

        PULR    R7                              ; 504E   02B7

L_504F:
        PSHR    R5                              ; 504F   0275

        JSR     R5,     L_5B11                  ; 5050   0004 0158 0311
        JSR     R5,     L_5E3A                  ; 5053   0004 015C 023A
        JSR     R5,     L_57D8                  ; 5056   0004 0154 03D8

        PULR    R7                              ; 5059   02B7

L_505A:
        PSHR    R5                              ; 505A   0275
        CLRR    R0                              ; 505B   01C0
        MVO     R0,     G_01C1                  ; 505C   0240 01C1

        JSR     R5,     L_637E                  ; 505E   0004 0160 037E
        JSR     R5,     L_5A6C                  ; 5061   0004 0158 026C
        JSR     R5,     L_D621                  ; 5064   0004 01D4 0221
        JSR     R5,     L_6AF9                  ; 5067   0004 0168 02F9
        JSR     R5,     L_6B60                  ; 506A   0004 0168 0360
        JSR     R5,     L_D769                  ; 506D   0004 01D4 0369
        JSR     R5,     L_D85B                  ; 5070   0004 01D8 005B
        JSR     R5,     L_DB61                  ; 5073   0004 01D8 0361
        JSR     R5,     .EXEC.4F1               ; 5076   0004 0114 00F1
        JSR     R5,     L_DC9E                  ; 5079   0004 01DC 009E
        JSR     R5,     L_5F55                  ; 507C   0004 015C 0355
        JSR     R5,     L_50B4                  ; 507F   0004 0150 00B4

        CMP@    R2,     R7                      ; 5082   0357
        CMP@    R1,     R7                      ; 5083   034F
        PULR    R7                              ; 5084   02B7

L_5085:
        PSHR    R5                              ; 5085   0275

        JSR     R5,     L_571F                  ; 5086   0004 0154 031F
        JSR     R5,     L_DC2B                  ; 5089   0004 01DC 002B
        JSR     R5,     L_5E5F                  ; 508C   0004 015C 025F
        JSR     R5,     L_F047                  ; 508F   0004 01F0 0047

        MVI     G_01BA, R0                      ; 5092   0280 01BA
        CMPI    #$0004, R0                      ; 5094   0378 0004
        BNEQ    L_50B3                          ; 5096   020C 001B

        JSR     R5,     L_5FFA                  ; 5098   0004 015C 03FA

        MVI     G_01B9, R1                      ; 509B   0281 01B9
        CMPI    #$00FF, R1                      ; 509D   0379 00FF
        BEQ     L_50B3                          ; 509F   0204 0012

        MOVR    R1,     R2                      ; 50A1   008A
        ADDI    #$01C6, R2                      ; 50A2   02FA 01C6
        MVI@    R2,     R0                      ; 50A4   0290
        SWAP    R0,     1                       ; 50A5   0040
        SLLC    R0,     1                       ; 50A6   0058
        BC      L_50B3                          ; 50A7   0201 000A

        JSR     R5,     L_5ECA                  ; 50A9   0004 015C 02CA

        BC      L_50B3                          ; 50AC   0201 0005

        MVI     G_01B9, R1                      ; 50AE   0281 01B9

        JSR     R5,     L_6056                  ; 50B0   0004 0160 0056

L_50B3:
        PULR    R7                              ; 50B3   02B7

L_50B4:
        PSHR    R5                              ; 50B4   0275
        MVI     G_01C5, R0                      ; 50B5   0280 01C5
        TSTR    R0                              ; 50B7   0080
        BEQ     L_5101                          ; 50B8   0204 0047

        SDBD                                    ; 50BA   0001
        MVII    #$FFE1, R1                      ; 50BB   02B9 00E1 00FF
        ADD     G_035C, R1                      ; 50BE   02C1 035C
        MVO     R1,     G_035C                  ; 50C0   0241 035C
        MOVR    R1,     R2                      ; 50C2   008A
        ADD     G_0354, R2                      ; 50C3   02C2 0354
        MVO     R2,     G_0354                  ; 50C5   0242 0354
        TSTR    R2                              ; 50C7   0092
        BMI     L_50DA                          ; 50C8   020B 0010

L_50CA:
        PULR    R5                              ; 50CA   02B5
        MVI@    R5,     R4                      ; 50CB   02AC
        MVI@    R5,     R1                      ; 50CC   02A9
        PSHR    R5                              ; 50CD   0275
        MOVR    R1,     R5                      ; 50CE   008D
        NEGR    R2                              ; 50CF   0022
        MVI@    R4,     R0                      ; 50D0   02A0
        MVO@    R0,     R5                      ; 50D1   0268
        MOVR    R5,     R1                      ; 50D2   00A9
        MVI@    R4,     R0                      ; 50D3   02A0
        MVO@    R0,     R5                      ; 50D4   0268
        ADD@    R1,     R2                      ; 50D5   02CA
        MVO@    R2,     R1                      ; 50D6   024A
        MVI@    R5,     R3                      ; 50D7   02AB
        MVO@    R3,     R4                      ; 50D8   0263
        PULR    R7                              ; 50D9   02B7

L_50DA:
        JSR     R5,     L_D0FD                  ; 50DA   0004 01D0 00FD

        CLRR    R2                              ; 50DD   01D2
        MVO     R2,     G_0354                  ; 50DE   0242 0354
        MVI     G_035C, R1                      ; 50E0   0281 035C
        NEGR    R1                              ; 50E2   0021
        SUBI    #$007F, R1                      ; 50E3   0339 007F
        MVO     R1,     G_035C                  ; 50E5   0241 035C
        BMI     L_50ED                          ; 50E7   020B 0004

        MVO     R1,     G_035C                  ; 50E9   0241 035C
        B       L_50CA                          ; 50EB   0220 0022

L_50ED:
        MVI     G_033E, R0                      ; 50ED   0280 033E
        SDBD                                    ; 50EF   0001
        CMPI    #$F469, R0                      ; 50F0   0378 0069 00F4
        BNEQ    L_50FE                          ; 50F3   020C 0009

        SDBD                                    ; 50F5   0001
        MVII    #$5105, R4                      ; 50F6   02BC 0005 0051

        JSR     R5,     L_D843                  ; 50F9   0004 01D8 0043

        B       L_5101                          ; 50FC   0200 0003

L_50FE:
        JSR     R5,     L_D83F                  ; 50FE   0004 01D8 003F

L_5101:
        PULR    R5                              ; 5101   02B5
        INCR    R5                              ; 5102   000D
        INCR    R5                              ; 5103   000D
        MOVR    R5,     R7                      ; 5104   00AF

        SUB@    R6,     R5                      ; 5105   0335
        SUB@    R5,     R7                      ; 5106   032F

        DECLE   $0216,  $0053,  $0045,  $004C   ; 5107   0216 0053 0045 004C
        DECLE   $0045,  $0043,  $0054,  $0020   ; 510B   0045 0043 0054 0020
        DECLE   $0047,  $0041,  $004D,  $0045   ; 510F   0047 0041 004D 0045
        DECLE   $0020,  $003A,  $0000,  $0242   ; 5113   0020 003A 0000 0242
        DECLE   $0031,  $003A,  $004D,  $0041   ; 5117   0031 003A 004D 0041
        DECLE   $0054,  $0043,  $0048,  $0000   ; 511B   0054 0043 0048 0000
        DECLE   $0256,  $0032,  $003A,  $0050   ; 511F   0256 0032 003A 0050
        DECLE   $0045,  $004E,  $0041,  $004C   ; 5123   0045 004E 0041 004C
        DECLE   $0054,  $0059,  $0000,  $03FF   ; 5127   0054 0059 0000 03FF
        DECLE   $0216,  $004E,  $004F,  $002E   ; 512B   0216 004E 004F 002E
        DECLE   $0020,  $004F,  $0046,  $0020   ; 512F   0020 004F 0046 0020
        DECLE   $0050,  $004C,  $0041,  $0059   ; 5133   0050 004C 0041 0059
        DECLE   $0045,  $0052,  $0053,  $0000   ; 5137   0045 0052 0053 0000
        DECLE   $0242,  $0048,  $004F,  $004D   ; 513B   0242 0048 004F 004D
        DECLE   $0045,  $0020,  $0020,  $0020   ; 513F   0045 0020 0020 0020
        DECLE   $0020,  $003A,  $0000,  $0256   ; 5143   0020 003A 0000 0256
        DECLE   $0056,  $0049,  $0053,  $0049   ; 5147   0056 0049 0053 0049
        DECLE   $0054,  $004F,  $0052,  $0053   ; 514B   0054 004F 0052 0053
        DECLE   $003A,  $0000,  $03FF,  $0216   ; 514F   003A 0000 03FF 0216
        DECLE   $0050,  $0045,  $004E,  $0041   ; 5153   0050 0045 004E 0041
        DECLE   $004C,  $0054,  $0059,  $0020   ; 5157   004C 0054 0059 0020
        DECLE   $003A,  $0000,  $0244,  $0031   ; 515B   003A 0000 0244 0031
        DECLE   $003A,  $0047,  $0041,  $004D   ; 515F   003A 0047 0041 004D
        DECLE   $0045,  $0000,  $0258,  $0032   ; 5163   0045 0000 0258 0032
        DECLE   $003A,  $004B,  $0049,  $0043   ; 5167   003A 004B 0049 0043
        DECLE   $004B,  $0045,  $0052,  $0000   ; 516B   004B 0045 0052 0000
        DECLE   $026C,  $0033,  $003A,  $004B   ; 516F   026C 0033 003A 004B
        DECLE   $0045,  $0045,  $0050,  $0045   ; 5173   0045 0045 0050 0045
        DECLE   $0052,  $0000,  $03FF           ; 5177   0052 0000 03FF
L_517A:
        PSHR    R5                              ; 517A   0275
        MOVR    R1,     R5                      ; 517B   008D
        MVII    #$0007, R3                      ; 517C   02BB 0007
L_517E:
        MVI@    R5,     R4                      ; 517E   02AC
        CMPI    #$03FF, R4                      ; 517F   037C 03FF
        BEQ     L_5189                          ; 5181   0204 0006

        MOVR    R5,     R1                      ; 5183   00A9

        JSR     R5,     X_PRINT_R1              ; 5184   0004 0118 0067

        B       L_517E                          ; 5187   0220 000A
L_5189:
        PULR    R7                              ; 5189   02B7

L_518A:
        PSHR    R5                              ; 518A   0275
        TSTR    R2                              ; 518B   0092
        BEQ     L_5198                          ; 518C   0204 000A

        TSTR    R0                              ; 518E   0080
        BEQ     L_5198                          ; 518F   0204 0007

        CMPR    R3,     R0                      ; 5191   0158
        BGT     L_5198                          ; 5192   020E 0004

        DECR    R0                              ; 5194   0010
        SLL     R0,     1                       ; 5195   0048
        CLRC                                    ; 5196   0006
        PULR    R7                              ; 5197   02B7

L_5198:
        MVII    #$0002, R0                      ; 5198   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; 519A   0004 011C 02C4

        SETC                                    ; 519D   0007
        PULR    R7                              ; 519E   02B7

L_519F:
        PSHR    R5                              ; 519F   0275
        TSTR    R2                              ; 51A0   0092
        BEQ     L_5198                          ; 51A1   0224 000A

        MVI     G_015E, R1                      ; 51A3   0281 015E
        ANDI    #$0001, R1                      ; 51A5   03B9 0001
        BEQ     L_51AD                          ; 51A7   0204 0004

        CMPI    #$0002, R0                      ; 51A9   0378 0002
        B       L_51AF                          ; 51AB   0200 0002

L_51AD:
        CMPI    #$0001, R0                      ; 51AD   0378 0001
L_51AF:
        BGT     L_5198                          ; 51AF   022E 0018

        CLRC                                    ; 51B1   0006
        PULR    R7                              ; 51B2   02B7

L_51B3:
        MVII    #$0128, R1                      ; 51B3   02B9 0128
        MVII    #$0002, R3                      ; 51B5   02BB 0002
        MVII    #$0005, R2                      ; 51B7   02BA 0005
L_51B9:
        MVO@    R0,     R1                      ; 51B9   0248
        ADDR    R3,     R1                      ; 51BA   00D9
        DECR    R2                              ; 51BB   0012
        BNEQ    L_51B9                          ; 51BC   022C 0004
        MOVR    R5,     R7                      ; 51BE   00AF

L_51BF:
        MVI@    R5,     R1                      ; 51BF   02A9
        MVII    #$0007, R3                      ; 51C0   02BB 0007
        CLRR    R2                              ; 51C2   01D2
        MOVR    R2,     R0                      ; 51C3   0090
        INCR    R0                              ; 51C4   0008
        MOVR    R5,     R7                      ; 51C5   00AF

        JSR     R5,     L_DD8F                  ; 51C6   0004 01DC 018F

        MVII    #$0008, R0                      ; 51C9   02B8 0008

        JSR     R5,     X_PLAY_CHEER1           ; 51CB   0004 011C 02D5

        MVII    #$0040, R0                      ; 51CE   02B8 0040
        MVO     R0,     G_01BA                  ; 51D0   0240 01BA

        JSR     R5,     L_D822                  ; 51D2   0004 01D8 0022

        MVII    #$02F2, R6                      ; 51D5   02BE 02F2
        CLRR    R3                              ; 51D7   01DB
        B       L_51EF                          ; 51D8   0200 0015

.START:
        MVII    #$00FF, R3                      ; 51DA   02BB 00FF
        SDBD                                    ; 51DC   0001
        MVII    #$47CD, R1                      ; 51DD   02B9 00CD 0047
        MVII    #$0001, R0                      ; 51E0   02B8 0001
        MVO@    R0,     R1                      ; 51E2   0248
        CMP@    R1,     R0                      ; 51E3   0348
        BNEQ    L_51EB                          ; 51E4   020C 0005

        SDBD                                    ; 51E6   0001
        MVII    #$70C4, R5                      ; 51E7   02BD 00C4 0070
        INCR    R7                              ; 51EA   000F

L_51EB:
        CLRR    R0                              ; 51EB   01C0
L_51EC:
        MVO     R0,     G_015E                  ; 51EC   0240 015E
        PSHR    R5                              ; 51EE   0275
L_51EF:
        PSHR    R3                              ; 51EF   0273
        MVII    #$008E, R0                      ; 51F0   02B8 008E
        MVII    #$016B, R4                      ; 51F2   02BC 016B

        JSR     R5,     X_FILL_ZERO             ; 51F4   0004 0114 0338

        MVI     .ISRVEC.0,R0                    ; 51F7   0280 0100
        MVO     R0,     G_017B                  ; 51F9   0240 017B
        MVI     .ISRVEC.1,R0                    ; 51FB   0280 0101
        MVO     R0,     G_017C                  ; 51FD   0240 017C
        MVII    #$00F0, R0                      ; 51FF   02B8 00F0
        MVII    #$0200, R4                      ; 5201   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5203   0004 0114 0338

        MVII    #$0080, R0                      ; 5206   02B8 0080

        JSR     R5,     L_51B3                  ; 5208   0004 0150 01B3
        JSR     R5,     L_5380                  ; 520B   0004 0150 0380

        PULR    R3                              ; 520E   02B3
        MVO     R3,     G_01CE                  ; 520F   0243 01CE
        CLRR    R0                              ; 5211   01C0
        TSTR    R3                              ; 5212   009B
        BNEQ    L_526E                          ; 5213   020C 0059

        SDBD                                    ; 5215   0001
        MVII    #$5107, R1                      ; 5216   02B9 0007 0051

        JSR     R5,     L_517A                  ; 5219   0004 0150 017A
L_521C:
        JSR     R5,     L_51BF                  ; 521C   0004 0150 01BF
        DECLE   $0225                           ; 521F   0225

        JSR     R5,     X_GETNUM                ; 5220   0004 0118 00FF

        MVII    #$0002, R3                      ; 5223   02BB 0002

        JSR     R5,     L_518A                  ; 5225   0004 0150 018A

        BC      L_521C                          ; 5228   0221 000D

        PSHR    R0                              ; 522A   0270
        MVII    #$00F0, R0                      ; 522B   02B8 00F0
        MVII    #$0200, R4                      ; 522D   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 522F   0004 0114 0338

        PULR    R0                              ; 5232   02B0
        ADDR    R0,     R7                      ; 5233   00C7
        B       L_524D                          ; 5234   0200 0017

        SDBD                                    ; 5236   0001
        MVII    #$5152, R1                      ; 5237   02B9 0052 0051

        JSR     R5,     L_517A                  ; 523A   0004 0150 017A
L_523D:
        JSR     R5,     L_51BF                  ; 523D   0004 0150 01BF
        DECLE   $0221                           ; 5240   0221

        JSR     R5,     X_GETNUM                ; 5241   0004 0118 00FF

        MVII    #$0003, R3                      ; 5244   02BB 0003

        JSR     R5,     L_518A                  ; 5246   0004 0150 018A

        BC      L_523D                          ; 5249   0221 000D
        B       L_5272                          ; 524B   0200 0025

L_524D:
        SDBD                                    ; 524D   0001
        MVII    #$512B, R1                      ; 524E   02B9 002B 0051

        JSR     R5,     L_517A                  ; 5251   0004 0150 017A
L_5254:
        JSR     R5,     L_51BF                  ; 5254   0004 0150 01BF
        DECLE   $024E                           ; 5257   024E

        JSR     R5,     X_GETNUM                ; 5258   0004 0118 00FF
        JSR     R5,     L_519F                  ; 525B   0004 0150 019F

        BC      L_5254                          ; 525E   0221 000B

        MVO     R0,     G_01C5                  ; 5260   0240 01C5

L_5262:
        JSR     R5,     L_51BF                  ; 5262   0004 0150 01BF
        DECLE   $0262                           ; 5265   0262

        JSR     R5,     X_GETNUM                ; 5266   0004 0118 00FF
        JSR     R5,     L_519F                  ; 5269   0004 0150 019F

        BC      L_5262                          ; 526C   0221 000B

L_526E:
        MVO     R0,     G_01C2                  ; 526E   0240 01C2
        B       L_5275                          ; 5270   0200 0003
L_5272:
        J       L_DE6F                          ; 5272   0004 03DC 026F

L_5275:
        MVII    #$01C6, R4                      ; 5275   02BC 01C6
        MVII    #$000F, R0                      ; 5277   02B8 000F
        MVII    #$0006, R2                      ; 5279   02BA 0006
L_527B:
        MVO@    R0,     R4                      ; 527B   0260
        DECR    R2                              ; 527C   0012
        BNEQ    L_527B                          ; 527D   022C 0003

        MVI     G_01C5, R1                      ; 527F   0281 01C5
        INCR    R1                              ; 5281   0009
        MVII    #$0097, R0                      ; 5282   02B8 0097
        MVII    #$01C6, R4                      ; 5284   02BC 01C6
L_5286:
        DECR    R1                              ; 5286   0011
        BEQ     L_528C                          ; 5287   0204 0003

        MVO@    R0,     R4                      ; 5289   0260
        B       L_5286                          ; 528A   0220 0005

L_528C:
        MVO     R1,     G_01C5                  ; 528C   0241 01C5
        MVII    #$01C9, R4                      ; 528E   02BC 01C9
        MVI     G_01C2, R1                      ; 5290   0281 01C2
        INCR    R1                              ; 5292   0009
L_5293:
        DECR    R1                              ; 5293   0011
        BEQ     L_5299                          ; 5294   0204 0003

        MVO@    R0,     R4                      ; 5296   0260
        B       L_5293                          ; 5297   0220 0005

L_5299:
        MVO     R1,     G_01C2                  ; 5299   0241 01C2
        MVII    #$0030, R0                      ; 529B   02B8 0030
        MVO     R0,     G_0175                  ; 529D   0240 0175
        MVII    #$002D, R0                      ; 529F   02B8 002D
        MVO     R0,     G_01B4                  ; 52A1   0240 01B4
        MVII    #$00FF, R0                      ; 52A3   02B8 00FF
        MVO     R0,     G_017E                  ; 52A5   0240 017E
        MVO     R0,     G_01D8                  ; 52A7   0240 01D8
        MVO     R0,     G_01CC                  ; 52A9   0240 01CC
        MVII    #$000A, R0                      ; 52AB   02B8 000A
        MVO     R0,     G_01A7                  ; 52AD   0240 01A7
        MVO     R0,     G_01A8                  ; 52AF   0240 01A8
        MVII    #$001A, R2                      ; 52B1   02BA 001A
        MVO     R2,     G_01A6                  ; 52B3   0242 01A6

        JSR     R5,     L_57B7                  ; 52B5   0004 0154 03B7

        MVI     G_02F0, R0                      ; 52B8   0280 02F0
        SDBD                                    ; 52BA   0001
        CMPI    #$DDC7, R0                      ; 52BB   0378 00C7 00DD
        BNEQ    L_530F                          ; 52BE   020C 004F
        B       L_52F5                          ; 52C0   0200 0033

L_52C2:
        MVI     G_01DB, R0                      ; 52C2   0280 01DB
        SUBI    #$0002, R0                      ; 52C4   0338 0002
        ADDR    R0,     R7                      ; 52C6   00C7
        B       L_52F2                          ; 52C7   0200 0029

        MVI     G_0334, R0                      ; 52C9   0280 0334
        TSTR    R0                              ; 52CB   0080
        BNEQ    L_52D7                          ; 52CC   020C 0009

        MVI     .BTAB.01,R0                     ; 52CE   0280 0201
        SLLC    R0,     1                       ; 52D0   0058
        BC      L_52EF                          ; 52D1   0201 001C

L_52D3:
        MVII    #$0006, R0                      ; 52D3   02B8 0006
        B       L_52F3                          ; 52D5   0200 001C

L_52D7:
        MVI     G_033C, R0                      ; 52D7   0280 033C
        TSTR    R0                              ; 52D9   0080
        BNEQ    L_52D3                          ; 52DA   022C 0008

        MVI     G_032C, R0                      ; 52DC   0280 032C

        JSR     R5,     X_UNPK_BYTES            ; 52DE   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 52E1   0004 0118 022F

        MVO     R1,     G_01DD                  ; 52E4   0241 01DD
        MVI     G_032F, R0                      ; 52E6   0280 032F
        SWAP    R0,     1                       ; 52E8   0040
        MVO     R0,     G_01E1                  ; 52E9   0240 01E1
        MVII    #$0004, R0                      ; 52EB   02B8 0004
        B       L_52F3                          ; 52ED   0200 0004

L_52EF:
        MVII    #$0002, R0                      ; 52EF   02B8 0002
        INCR    R7                              ; 52F1   000F

L_52F2:
        CLRR    R0                              ; 52F2   01C0
L_52F3:
        MVO     R0,     G_01DC                  ; 52F3   0240 01DC

L_52F5:
        JSR     R5,     L_5380                  ; 52F5   0004 0150 0380

        MVII    #$02F2, R6                      ; 52F8   02BE 02F2
        SDBD                                    ; 52FA   0001
        MVII    #$5014, R2                      ; 52FB   02BA 0014 0050
        SDBD                                    ; 52FE   0001
        MVII    #$DDDB, R3                      ; 52FF   02BB 00DB 00DD
        MVI     G_01A6, R0                      ; 5302   0280 01A6
        CMPI    #$001A, R0                      ; 5304   0378 001A
        BNEQ    L_530C                          ; 5306   020C 0004

        SDBD                                    ; 5308   0001
        MVII    #$58DF, R3                      ; 5309   02BB 00DF 0058

L_530C:
        JSR     R5,     L_DDE6                  ; 530C   0004 01DC 01E6

L_530F:
        CLRR    R0                              ; 530F   01C0

        JSR     R5,     L_51B3                  ; 5310   0004 0150 01B3

        CLRR    R1                              ; 5313   01C9
        MVI     G_01A6, R2                      ; 5314   0282 01A6
L_5316:
        PSHR    R1                              ; 5316   0271
        PSHR    R2                              ; 5317   0272
        SDBD                                    ; 5318   0001
        MVII    #$5320, R5                      ; 5319   02BD 0020 0053
        PSHR    R5                              ; 531C   0275
        J       L_6176                          ; 531D   0004 0360 0176

        PULR    R2                              ; 5320   02B2
        PULR    R1                              ; 5321   02B1
        INCR    R1                              ; 5322   0009
        INCR    R2                              ; 5323   000A
        CMPI    #$0014, R1                      ; 5324   0379 0014
        BLT     L_5316                          ; 5326   0225 0011

        MVI     G_01CE, R3                      ; 5328   0283 01CE
        SDBD                                    ; 532A   0001
        MVII    #$6C13, R0                      ; 532B   02B8 0013 006C
        TSTR    R3                              ; 532E   009B
        BEQ     L_5335                          ; 532F   0204 0004

        SDBD                                    ; 5331   0001
        MVII    #$589E, R0                      ; 5332   02B8 009E 0058
L_5335:
        MVO     R0,     G_035D                  ; 5335   0240 035D

        JSR     R5,     L_539D                  ; 5337   0004 0150 039D

        BC      L_537F                          ; 533A   0201 0043

        JSR     R5,     L_58A8                  ; 533C   0004 0158 00A8

        MVI     G_01DC, R0                      ; 533F   0280 01DC
        ADDR    R0,     R7                      ; 5341   00C7
        B       L_534C                          ; 5342   0200 0008
        B       L_5353                          ; 5344   0200 000D
        B       L_5356                          ; 5346   0200 000E

        JSR     R5,     L_DD29                  ; 5348   0004 01DC 0129

        PULR    R7                              ; 534B   02B7

L_534C:
        JSR     R5,     L_D5DA                  ; 534C   0004 01D4 01DA
        JSR     R5,     L_DAD3                  ; 534F   0004 01D8 02D3

        PULR    R7                              ; 5352   02B7
L_5353:
        J       L_D950                          ; 5353   0004 03D8 0150

L_5356:
        JSR     R5,     L_D5DA                  ; 5356   0004 01D4 01DA

        MVI     G_01DD, R1                      ; 5359   0281 01DD
        ADDI    #$0004, R1                      ; 535B   02F9 0004
        MVI     G_01A6, R3                      ; 535D   0283 01A6
        CMPI    #$001A, R3                      ; 535F   037B 001A
        BLT     L_5365                          ; 5361   0205 0002

        SUBI    #$0008, R1                      ; 5363   0339 0008
L_5365:
        MVII    #$003C, R0                      ; 5365   02B8 003C

        JSR     R5,     .EXEC.629               ; 5367   0004 0114 0229

        MVO     R0,     G_0351                  ; 536A   0240 0351
        MVII    #$0058, R0                      ; 536C   02B8 0058
        SWAP    R0,     1                       ; 536E   0040
        MVII    #$034F, R4                      ; 536F   02BC 034F
        MVO@    R0,     R4                      ; 5371   0260
        MVI     G_01E1, R0                      ; 5372   0280 01E1
        SLR     R0,     2                       ; 5374   0064
        SLR     R0,     2                       ; 5375   0064
        NEGR    R0                              ; 5376   0020
        ADDI    #$0032, R0                      ; 5377   02F8 0032
        SWAP    R0,     1                       ; 5379   0040
        MVO@    R0,     R4                      ; 537A   0260
        MVII    #$0004, R0                      ; 537B   02B8 0004
        MVO     R0,     G_01BA                  ; 537D   0240 01BA
L_537F:
        PULR    R7                              ; 537F   02B7

L_5380:
        PSHR    R5                              ; 5380   0275
        SDBD                                    ; 5381   0001
        MVII    #$1906, R0                      ; 5382   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5385   0240 035D
        MVII    #$031D, R4                      ; 5387   02BC 031D
        MVII    #$0040, R0                      ; 5389   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 538B   0004 0114 0338

        MVII    #$031D, R1                      ; 538E   02B9 031D

L_5390:
        JSR     R5,     .EXEC.992               ; 5390   0004 0118 0192
        JSR     R5,     .EXEC.6D5               ; 5393   0004 0114 02D5

        ADDI    #$0008, R1                      ; 5396   02F9 0008
        CMPI    #$0355, R1                      ; 5398   0379 0355
        BLE     L_5390                          ; 539A   0226 000B
        PULR    R7                              ; 539C   02B7

L_539D:
        PSHR    R5                              ; 539D   0275
        SDBD                                    ; 539E   0001
        MVII    #$5803, R1                      ; 539F   02B9 0003 0058
        MVII    #$0006, R3                      ; 53A2   02BB 0006
        MVII    #$031D, R2                      ; 53A4   02BA 031D

        JSR     R5,     L_53FF                  ; 53A6   0004 0150 03FF

        MVII    #$0017, R3                      ; 53A9   02BB 0017

        JSR     R5,     L_53FF                  ; 53AB   0004 0150 03FF

        SDBD                                    ; 53AE   0001
        MVII    #$5850, R1                      ; 53AF   02B9 0050 0058

        JSR     R5,     X_INIT_MOB              ; 53B2   0004 0114 02B2

        MVII    #$0355, R2                      ; 53B5   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 53B7   0004 0114 02B2

        MVI     G_0355, R0                      ; 53BA   0280 0355
        XORI    #$0007, R0                      ; 53BC   03F8 0007
        MVO     R0,     G_0355                  ; 53BE   0240 0355
        SDBD                                    ; 53C0   0001
        MVII    #$5875, R0                      ; 53C1   02B8 0075 0058
        MVO     R0,     G_0356                  ; 53C4   0240 0356
        CLRR    R0                              ; 53C6   01C0
        MVO     R0,     G_0359                  ; 53C7   0240 0359
        MVII    #$0007, R0                      ; 53C9   02B8 0007

        JSR     R5,     .EXEC.6CF               ; 53CB   0004 0114 02CF

        MVI     G_01BA, R0                      ; 53CE   0280 01BA
        CMPI    #$0080, R0                      ; 53D0   0378 0080
        BNEQ    L_53E0                          ; 53D2   020C 000C

        JSR     R5,     L_F3AF                  ; 53D4   0004 01F0 03AF
        JSR     R5,     L_53E5                  ; 53D7   0004 0150 03E5

        PULR    R0                              ; 53DA   02B0

        JSR     R5,     L_53E5                  ; 53DB   0004 0150 03E5

        CLRC                                    ; 53DE   0006
        PULR    R7                              ; 53DF   02B7

L_53E0:
        JSR     R5,     L_DA71                  ; 53E0   0004 01D8 0271

        SETC                                    ; 53E3   0007
        PULR    R7                              ; 53E4   02B7

L_53E5:
        PSHR    R5                              ; 53E5   0275
        MVII    #$0003, R3                      ; 53E6   02BB 0003

        JSR     R5,     .EXEC.76C               ; 53E8   0004 0114 036C

        ADDI    #$0002, R1                      ; 53EB   02F9 0002
        MOVR    R1,     R5                      ; 53ED   008D
L_53EE:
        SDBD                                    ; 53EE   0001
        MVI@    R4,     R0                      ; 53EF   02A0
        PSHR    R5                              ; 53F0   0275

        JSR     R5,     X_UNPK_BYTES            ; 53F1   0004 0114 0357

        PULR    R5                              ; 53F4   02B5
        SWAP    R0,     1                       ; 53F5   0040
        SWAP    R1,     1                       ; 53F6   0041
        MVO@    R0,     R5                      ; 53F7   0268
        MVO@    R1,     R5                      ; 53F8   0269
        ADDI    #$0006, R5                      ; 53F9   02FD 0006
        DECR    R3                              ; 53FB   0013
        BNEQ    L_53EE                          ; 53FC   022C 000F
        PULR    R7                              ; 53FE   02B7

L_53FF:
        PSHR    R5                              ; 53FF   0275
        MVII    #$0003, R4                      ; 5400   02BC 0003

L_5402:
        JSR     R5,     X_INIT_MOB              ; 5402   0004 0114 02B2

        MVI@    R2,     R0                      ; 5405   0290
        XORR    R3,     R0                      ; 5406   01D8
        MVO@    R0,     R2                      ; 5407   0250
        ADDI    #$0008, R2                      ; 5408   02FA 0008
        DECR    R4                              ; 540A   0014
        BNEQ    L_5402                          ; 540B   022C 000A
        PULR    R7                              ; 540D   02B7

        PSHR    R5                              ; 540E   0275
        ADDI    #$01A9, R0                      ; 540F   02F8 01A9
        MOVR    R0,     R2                      ; 5411   0082
        MVI@    R2,     R0                      ; 5412   0290
        ADDI    #$0007, R1                      ; 5413   02F9 0007
        MVI@    R1,     R3                      ; 5415   028B
        TSTR    R3                              ; 5416   009B
        BNEQ    L_542A                          ; 5417   020C 0011

        XORI    #$0020, R0                      ; 5419   03F8 0020
        MVO@    R0,     R2                      ; 541B   0250
        INCR    R3                              ; 541C   000B
        MVO@    R3,     R1                      ; 541D   024B
        DECR    R1                              ; 541E   0011
        MVII    #$0012, R3                      ; 541F   02BB 0012
        MVO@    R3,     R1                      ; 5421   024B
        DECR    R1                              ; 5422   0011
        MVII    #$0004, R3                      ; 5423   02BB 0004
        MVO@    R3,     R1                      ; 5425   024B
        DECR    R1                              ; 5426   0011
        CLRR    R3                              ; 5427   01DB
        MVO@    R3,     R1                      ; 5428   024B
        PULR    R7                              ; 5429   02B7

L_542A:
        SDBD                                    ; 542A   0001
        ANDI    #$FF89, R0                      ; 542B   03B8 0089 00FF
        MVO@    R0,     R2                      ; 542E   0250
        PULR    R7                              ; 542F   02B7

        PSHR    R5                              ; 5430   0275
        ADDI    #$0007, R1                      ; 5431   02F9 0007
        MVI@    R1,     R2                      ; 5433   028A
        TSTR    R2                              ; 5434   0092
        BNEQ    L_5446                          ; 5435   020C 000F

        INCR    R2                              ; 5437   000A
        MVO@    R2,     R1                      ; 5438   024A
        DECR    R1                              ; 5439   0011
        MVII    #$000C, R0                      ; 543A   02B8 000C
        MVO@    R0,     R1                      ; 543C   0248
        SDBD                                    ; 543D   0001
        ADDI    #$FFFE, R1                      ; 543E   02F9 00FE 00FF
        MVII    #$0010, R0                      ; 5441   02B8 0010
        MVO@    R0,     R1                      ; 5443   0248
        B       L_5452                          ; 5444   0200 000C

L_5446:
        ADDI    #$01A9, R0                      ; 5446   02F8 01A9
        MOVR    R0,     R2                      ; 5448   0082
        MVI@    R2,     R0                      ; 5449   0290
        SDBD                                    ; 544A   0001
        ADDI    #$FFFD, R1                      ; 544B   02F9 00FD 00FF
        CLRR    R3                              ; 544E   01DB
        MVO@    R3,     R1                      ; 544F   024B
        B       L_542A                          ; 5450   0220 0027
L_5452:
        PULR    R7                              ; 5452   02B7

        PSHR    R5                              ; 5453   0275
        MVI     G_01D1, R2                      ; 5454   0282 01D1
        ANDI    #$0080, R2                      ; 5456   03BA 0080
        BNEQ    L_5464                          ; 5458   020C 000A

        MVI     G_01BA, R2                      ; 545A   0282 01BA
        CMPI    #$0010, R2                      ; 545C   037A 0010
        BNEQ    L_546C                          ; 545E   020C 000C

        JSR     R5,     L_DCC4                  ; 5460   0004 01DC 00C4

        PULR    R7                              ; 5463   02B7

L_5464:
        JSR     R5,     .EXEC.76C               ; 5464   0004 0114 036C

        CLRR    R0                              ; 5467   01C0
        ADDI    #$0004, R1                      ; 5468   02F9 0004
        MVO@    R0,     R1                      ; 546A   0248
        PULR    R7                              ; 546B   02B7

L_546C:
        MOVR    R0,     R2                      ; 546C   0082
        ADDI    #$01A9, R2                      ; 546D   02FA 01A9
        MVI@    R2,     R3                      ; 546F   0293
        ANDI    #$00DF, R3                      ; 5470   03BB 00DF
        MVO@    R3,     R2                      ; 5472   0253
        MVI     G_01BA, R5                      ; 5473   0285 01BA
        MOVR    R5,     R3                      ; 5475   00AB
        SDBD                                    ; 5476   0001
        ANDI    #$0021, R5                      ; 5477   03BD 0021 0000
        BNEQ    L_55C2                          ; 547A   020C 0146

        SDBD                                    ; 547C   0001
        ANDI    #$00C2, R3                      ; 547D   03BB 00C2 0000
        BNEQ    L_54D0                          ; 5480   020C 004E

        MVI     G_01BA, R2                      ; 5482   0282 01BA
        CMPI    #$0004, R2                      ; 5484   037A 0004
        BNEQ    L_55B7                          ; 5486   020C 012F

        CMP     G_01B9, R0                      ; 5488   0340 01B9
        BNEQ    L_55B7                          ; 548A   020C 012B

        MOVR    R0,     R1                      ; 548C   0081

        JSR     R5,     L_5E05                  ; 548D   0004 015C 0205

        MOVR    R4,     R1                      ; 5490   00A1

        JSR     R5,     .EXEC.766               ; 5491   0004 0114 0366

        MOVR    R0,     R1                      ; 5494   0081
        MOVR    R0,     R2                      ; 5495   0082
        ADDI    #$01A9, R2                      ; 5496   02FA 01A9
        MVII    #$0006, R0                      ; 5498   02B8 0006
L_549A:
        PSHR    R1                              ; 549A   0271
        PSHR    R2                              ; 549B   0272
        NOP                                     ; 549C   0034
        PSHR    R0                              ; 549D   0270
        MVI@    R2,     R0                      ; 549E   0290
        ANDI    #$0004, R0                      ; 549F   03B8 0004
        BNEQ    L_54BA                          ; 54A1   020C 0017

        MVII    #$0007, R0                      ; 54A3   02B8 0007

        JSR     R5,     L_5E1F                  ; 54A5   0004 015C 021F
        DECLE   $0005                           ; 54A8   0005

        INCR    R5                              ; 54A9   000D
        PULR    R0                              ; 54AA   02B0
        PSHR    R0                              ; 54AB   0270
        CMPI    #$0003, R0                      ; 54AC   0378 0003
        BGT     L_54B2                          ; 54AE   020E 0002

        ADDI    #$0008, R1                      ; 54B0   02F9 0008
L_54B2:
        MVII    #$0019, R0                      ; 54B2   02B8 0019

        JSR     R5,     .EXEC.629               ; 54B4   0004 0114 0229

        ADDI    #$0004, R2                      ; 54B7   02FA 0004
        MVO@    R0,     R2                      ; 54B9   0250
L_54BA:
        PULR    R0                              ; 54BA   02B0
        PULR    R2                              ; 54BB   02B2
        PULR    R1                              ; 54BC   02B1
        INCR    R1                              ; 54BD   0009
        INCR    R2                              ; 54BE   000A
        DECR    R0                              ; 54BF   0010
        BEQ     L_55B7                          ; 54C0   0204 00F5

        CMPI    #$0003, R0                      ; 54C2   0378 0003
        BNEQ    L_549A                          ; 54C4   022C 002B

        CMPI    #$0006, R1                      ; 54C6   0379 0006
        BNEQ    L_549A                          ; 54C8   022C 002F

        CLRR    R1                              ; 54CA   01C9
        MOVR    R1,     R2                      ; 54CB   008A
        ADDI    #$01A9, R2                      ; 54CC   02FA 01A9
        B       L_549A                          ; 54CE   0220 0035

L_54D0:
        CLRR    R0                              ; 54D0   01C0
        ADDI    #$0004, R1                      ; 54D1   02F9 0004
        MVO@    R0,     R1                      ; 54D3   0248
        DECR    R1                              ; 54D4   0011
        MVI@    R1,     R4                      ; 54D5   028C
        CMPI    #$01FF, R4                      ; 54D6   037C 01FF
        BGT     L_54DB                          ; 54D8   020E 0001

        MVO@    R0,     R1                      ; 54DA   0248
L_54DB:
        DECR    R1                              ; 54DB   0011
        MVI     G_01BC, R0                      ; 54DC   0280 01BC
        TSTR    R0                              ; 54DE   0080
        BEQ     L_54E6                          ; 54DF   0204 0005

        DECR    R0                              ; 54E1   0010
        MVO     R0,     G_01BC                  ; 54E2   0240 01BC
        BNEQ    L_55B7                          ; 54E4   020C 00D1

L_54E6:
        MVI     G_01BA, R0                      ; 54E6   0280 01BA
        CMPI    #$0040, R0                      ; 54E8   0378 0040
        BEQ     L_5523                          ; 54EA   0204 0037

        CMPI    #$0080, R0                      ; 54EC   0378 0080
        BNEQ    L_54F6                          ; 54EE   020C 0006

        JSR     R5,     X_STOP_SFX              ; 54F0   0004 011C 02B4

        J       L_DF78                          ; 54F3   0004 03DC 0378

L_54F6:
        MVI     G_01BB, R0                      ; 54F6   0280 01BB
        CMPI    #$0003, R0                      ; 54F8   0378 0003
        BNEQ    L_5503                          ; 54FA   020C 0007

        MVII    #$0001, R0                      ; 54FC   02B8 0001
        MVO     R0,     G_01BB                  ; 54FE   0240 01BB
        J       L_6BCB                          ; 5500   0004 0368 03CB

L_5503:
        MVI     G_01B9, R1                      ; 5503   0281 01B9
        CMPI    #$00FF, R1                      ; 5505   0379 00FF
        BEQ     L_55B7                          ; 5507   0204 00AE

        MOVR    R1,     R0                      ; 5509   0088
        ADDI    #$01C6, R1                      ; 550A   02F9 01C6
        MVI@    R1,     R2                      ; 550C   028A
        SWAP    R2,     1                       ; 550D   0042
        SLLC    R2,     1                       ; 550E   005A
        BC      L_551E                          ; 550F   0201 000D

        JSR     R5,     .EXEC.76C               ; 5511   0004 0114 036C

        ADDI    #$0006, R1                      ; 5514   02F9 0006
        MVII    #$003C, R0                      ; 5516   02B8 003C
        MVO@    R0,     R1                      ; 5518   0248
        MVII    #$0003, R0                      ; 5519   02B8 0003
        MVO     R0,     G_01BB                  ; 551B   0240 01BB
        PULR    R7                              ; 551D   02B7

L_551E:
        MVII    #$0001, R0                      ; 551E   02B8 0001
        MVO     R0,     G_01BB                  ; 5520   0240 01BB
        PULR    R7                              ; 5522   02B7

L_5523:
        MVI     G_01B1, R2                      ; 5523   0282 01B1
        TSTR    R2                              ; 5525   0092
        BEQ     L_5531                          ; 5526   0204 0009

        CLRR    R2                              ; 5528   01D2
        MVO     R2,     G_01B1                  ; 5529   0242 01B1

        JSR     R5,     L_6755                  ; 552B   0004 0164 0355

        BNC     L_5531                          ; 552E   0209 0001
        PULR    R7                              ; 5530   02B7

L_5531:
        MVII    #$003C, R0                      ; 5531   02B8 003C

        JSR     R5,     .EXEC.A62               ; 5533   0004 0118 0262

        MVI     G_01B6, R0                      ; 5536   0280 01B6
        TSTR    R0                              ; 5538   0080
        BEQ     L_557C                          ; 5539   0204 0041

        CMPI    #$0002, R0                      ; 553B   0378 0002
        BEQ     L_557C                          ; 553D   0204 003D

        MVI     G_01B7, R0                      ; 553F   0280 01B7
        CMP     G_01B8, R0                      ; 5541   0340 01B8
        BEQ     L_5561                          ; 5543   0204 001C

        SDBD                                    ; 5545   0001
        MVII    #$F2EB, R0                      ; 5546   02B8 00EB 00F2
        MVO     R0,     G_0317                  ; 5549   0240 0317

        JSR     R5,     L_F248                  ; 554B   0004 01F0 0248

        MVII    #$003C, R0                      ; 554E   02B8 003C
        MOVR    R7,     R1                      ; 5550   00B9
        SDBD                                    ; 5551   0001
        ADDI    #$0008, R1                      ; 5552   02F9 0008 0000

        JSR     R5,     .EXEC.A5E               ; 5555   0004 0118 025E

        PULR    R7                              ; 5558   02B7

        MVII    #$02F1, R6                      ; 5559   02BE 02F1
        SDBD                                    ; 555B   0001
        MVII    #$108F, R5                      ; 555C   02BD 008F 0010
        B       .START                          ; 555F   0220 0386

L_5561:
        MVI     G_01B6, R0                      ; 5561   0280 01B6
        CMPI    #$0003, R0                      ; 5563   0378 0003
        BEQ     L_556E                          ; 5565   0204 0007

        CMPI    #$0001, R0                      ; 5567   0378 0001
        BNEQ    L_557C                          ; 5569   020C 0011

        MVO     R0,     G_01BB                  ; 556B   0240 01BB
        PULR    R7                              ; 556D   02B7

L_556E:
        JSR     R5,     X_STOP_SFX              ; 556E   0004 011C 02B4

        MVII    #$0002, R0                      ; 5571   02B8 0002
        SDBD                                    ; 5573   0001
        MVII    #$DF81, R1                      ; 5574   02B9 0081 00DF

        JSR     R5,     .EXEC.A5E               ; 5577   0004 0118 025E

        PULR    R7                              ; 557A   02B7

L_557B:
        PSHR    R5                              ; 557B   0275
L_557C:
        SDBD                                    ; 557C   0001
        MVII    #$5846, R1                      ; 557D   02B9 0046 0058
        MVII    #$031D, R2                      ; 5580   02BA 031D

        JSR     R5,     L_55B8                  ; 5582   0004 0154 01B8

        ADDI    #$0011, R1                      ; 5585   02F9 0011

        JSR     R5,     L_55B8                  ; 5587   0004 0154 01B8

        CLRR    R0                              ; 558A   01C0
        MVO     R0,     G_01BB                  ; 558B   0240 01BB
        MVII    #$002D, R1                      ; 558D   02B9 002D
        CLRR    R2                              ; 558F   01D2
        MVI     G_01B6, R3                      ; 5590   0283 01B6
        INCR    R3                              ; 5592   000B
        CMPI    #$0002, R3                      ; 5593   037B 0002
        BLT     L_5599                          ; 5595   0205 0002

        MVII    #$000F, R1                      ; 5597   02B9 000F
L_5599:
        MVO     R1,     G_01B4                  ; 5599   0241 01B4
        MVO     R2,     G_01B5                  ; 559B   0242 01B5
        MVO     R3,     G_01B6                  ; 559D   0243 01B6
        CLRR    R0                              ; 559F   01C0
        SARC    R3,     1                       ; 55A0   007B
        BNC     L_55A5                          ; 55A1   0209 0002

        MVII    #$0003, R0                      ; 55A3   02B8 0003
L_55A5:
        MVO     R0,     G_01B9                  ; 55A5   0240 01B9
        MVI     G_01B2, R3                      ; 55A7   0283 01B2
        ADDI    #$01A9, R3                      ; 55A9   02FB 01A9
        MVI@    R3,     R1                      ; 55AB   0299
        ANDI    #$007F, R1                      ; 55AC   03B9 007F
        MVO     R0,     G_01B2                  ; 55AE   0240 01B2
        MVO@    R1,     R3                      ; 55B0   0259

        JSR     R5,     L_57B7                  ; 55B1   0004 0154 03B7
        JSR     R5,     L_DA71                  ; 55B4   0004 01D8 0271

L_55B7:
        PULR    R7                              ; 55B7   02B7

L_55B8:
        PSHR    R5                              ; 55B8   0275
        MVII    #$0003, R3                      ; 55B9   02BB 0003
L_55BB:
        MVO@    R1,     R2                      ; 55BB   0251
        ADDI    #$0008, R2                      ; 55BC   02FA 0008
        DECR    R3                              ; 55BE   0013
        BNEQ    L_55BB                          ; 55BF   022C 0005
        PULR    R7                              ; 55C1   02B7

L_55C2:
        JSR     R5,     .EXEC.766               ; 55C2   0004 0114 0366

        MOVR    R0,     R2                      ; 55C5   0082
        ADDI    #$01A9, R2                      ; 55C6   02FA 01A9
        MVI@    R2,     R0                      ; 55C8   0290
        MOVR    R0,     R3                      ; 55C9   0083
        ANDI    #$0008, R0                      ; 55CA   03B8 0008
        BEQ     L_55D8                          ; 55CC   0204 000A

        SDBD                                    ; 55CE   0001
        ANDI    #$FFF7, R3                      ; 55CF   03BB 00F7 00FF
        MVO@    R3,     R2                      ; 55D2   0253
        CLRR    R0                              ; 55D3   01C0
        ADDI    #$0004, R1                      ; 55D4   02F9 0004
        MVO@    R0,     R1                      ; 55D6   0248
        PULR    R7                              ; 55D7   02B7

L_55D8:
        MVI     G_01BB, R0                      ; 55D8   0280 01BB
        CMPI    #$0002, R0                      ; 55DA   0378 0002
        BGE     L_5654                          ; 55DC   020D 0076

        ADDI    #$0004, R1                      ; 55DE   02F9 0004
        CLRR    R0                              ; 55E0   01C0
        MVO@    R0,     R1                      ; 55E1   0248
        ADDI    #$0003, R1                      ; 55E2   02F9 0003
        MVO@    R0,     R1                      ; 55E4   0248
        SUBI    #$0006, R1                      ; 55E5   0339 0006
        PSHR    R1                              ; 55E7   0271
        DECR    R1                              ; 55E8   0011

        JSR     R5,     .EXEC.766               ; 55E9   0004 0114 0366

        MOVR    R0,     R1                      ; 55EC   0081
        MVO     R0,     G_01B9                  ; 55ED   0240 01B9
        MVO     R0,     G_01B2                  ; 55EF   0240 01B2
        CLRR    R2                              ; 55F1   01D2
        CMPI    #$0003, R0                      ; 55F2   0378 0003
        BLT     L_55F8                          ; 55F4   0205 0002

        MVII    #$0003, R2                      ; 55F6   02BA 0003
L_55F8:
        ADDI    #$01C6, R2                      ; 55F8   02FA 01C6
        MVI@    R2,     R0                      ; 55FA   0290
        ANDI    #$0080, R0                      ; 55FB   03B8 0080
        MVII    #$0005, R2                      ; 55FD   02BA 0005
        MVI     G_01BA, R0                      ; 55FF   0280 01BA
        PULR    R1                              ; 5601   02B1
        PSHR    R1                              ; 5602   0271
        BEQ     L_561C                          ; 5603   0204 0017

        MVII    #$0032, R2                      ; 5605   02BA 0032
        CMPI    #$0020, R0                      ; 5607   0378 0020
        BNEQ    L_5620                          ; 5609   020C 0015

        MVII    #$0001, R0                      ; 560B   02B8 0001
        CMP     G_01BB, R0                      ; 560D   0340 01BB
        MVII    #$0005, R2                      ; 560F   02BA 0005
        BEQ     L_5632                          ; 5611   0204 001F

        MVO     R0,     G_01BB                  ; 5613   0240 01BB
        ADDI    #$0005, R1                      ; 5615   02F9 0005
        MVII    #$0032, R2                      ; 5617   02BA 0032
        MVO@    R2,     R1                      ; 5619   024A
        PULR    R1                              ; 561A   02B1
        PULR    R7                              ; 561B   02B7

L_561C:
        CMPI    #$0020, R0                      ; 561C   0378 0020
        BEQ     L_5632                          ; 561E   0204 0012

L_5620:
        INCR    R1                              ; 5620   0009
        MVI@    R1,     R0                      ; 5621   0288
        ADDI    #$0300, R0                      ; 5622   02F8 0300
        MVO     R0,     G_034F                  ; 5624   0240 034F
        INCR    R1                              ; 5626   0009
        MVI@    R1,     R0                      ; 5627   0288
        SUBI    #$0200, R0                      ; 5628   0338 0200
        MVO     R0,     G_0350                  ; 562A   0240 0350
        SDBD                                    ; 562C   0001
        MVII    #$5828, R0                      ; 562D   02B8 0028 0058
        B       L_5636                          ; 5630   0200 0004

L_5632:
        SDBD                                    ; 5632   0001
        MVII    #$582F, R0                      ; 5633   02B8 002F 0058
L_5636:
        PULR    R1                              ; 5636   02B1
        MVO@    R0,     R1                      ; 5637   0248
        ADDI    #$0005, R1                      ; 5638   02F9 0005
        MVO@    R2,     R1                      ; 563A   024A
        DECR    R1                              ; 563B   0011
        MVII    #$03F0, R0                      ; 563C   02B8 03F0
        MVO@    R0,     R1                      ; 563E   0248
        SUBI    #$0005, R1                      ; 563F   0339 0005

        JSR     R5,     .EXEC.766               ; 5641   0004 0114 0366

        MOVR    R0,     R1                      ; 5644   0081
        ADDI    #$01A9, R1                      ; 5645   02F9 01A9
        MVI@    R1,     R0                      ; 5647   0288
        SDBD                                    ; 5648   0001
        ANDI    #$FFFB, R0                      ; 5649   03B8 00FB 00FF
        XORI    #$0004, R0                      ; 564C   03F8 0004
        MVO@    R0,     R1                      ; 564E   0248
        MVII    #$0002, R0                      ; 564F   02B8 0002
        MVO     R0,     G_01BB                  ; 5651   0240 01BB
        PULR    R7                              ; 5653   02B7

L_5654:
        MVII    #$0004, R0                      ; 5654   02B8 0004
        MVO     R0,     G_01BB                  ; 5656   0240 01BB
        MVII    #$0004, R0                      ; 5658   02B8 0004
        MVO     R0,     G_01BA                  ; 565A   0240 01BA

        JSR     R5,     .EXEC.766               ; 565C   0004 0114 0366

        MVO     R0,     G_01B2                  ; 565F   0240 01B2
        CLRR    R2                              ; 5661   01D2
        COMR    R2                              ; 5662   001A
        MVO     R2,     G_01B9                  ; 5663   0242 01B9
        MOVR    R0,     R2                      ; 5665   0082
        ADDI    #$01A9, R2                      ; 5666   02FA 01A9
        MVI@    R2,     R0                      ; 5668   0290
        SDBD                                    ; 5669   0001
        ANDI    #$FFFD, R0                      ; 566A   03B8 00FD 00FF
        MVO@    R0,     R2                      ; 566D   0250
        PULR    R7                              ; 566E   02B7

L_566F:
        PSHR    R5                              ; 566F   0275
        CLRR    R4                              ; 5670   01E4
        INCR    R7                              ; 5671   000F

L_5672:
        PSHR    R5                              ; 5672   0275
L_5673:
        PSHR    R4                              ; 5673   0274
        MVI     G_0350, R5                      ; 5674   0285 0350
        SDBD                                    ; 5676   0001
        CMPI    #$1400, R5                      ; 5677   037D 0000 0014
        BC      L_5680                          ; 567A   0201 0004

        SDBD                                    ; 567C   0001
        MVII    #$1400, R5                      ; 567D   02BD 0000 0014
L_5680:
        MVO     R5,     G_0350                  ; 5680   0245 0350
        MVII    #$0002, R5                      ; 5682   02BD 0002
        MVO     R5,     G_01BB                  ; 5684   0245 01BB
        MOVR    R0,     R2                      ; 5686   0082
        ADDI    #$01A9, R2                      ; 5687   02FA 01A9
        MVI@    R2,     R0                      ; 5689   0290
        SDBD                                    ; 568A   0001
        ANDI    #$FFFB, R0                      ; 568B   03B8 00FB 00FF
        MVO@    R0,     R2                      ; 568E   0250
        ADDI    #$0004, R1                      ; 568F   02F9 0004
        MVI     G_01BA, R0                      ; 5691   0280 01BA
        CMPI    #$0020, R0                      ; 5693   0378 0020
        BEQ     L_56A5                          ; 5695   0204 000E

        MVII    #$0032, R0                      ; 5697   02B8 0032
        MVI     G_0350, R3                      ; 5699   0283 0350
        SDBD                                    ; 569B   0001
        CMPI    #$3000, R3                      ; 569C   037B 0000 0030
        BNC     L_56A2                          ; 569F   0209 0001

        NEGR    R0                              ; 56A1   0020
L_56A2:
        ANDI    #$00FF, R0                      ; 56A2   03B8 00FF
        MVO@    R0,     R1                      ; 56A4   0248
L_56A5:
        MVII    #$0005, R0                      ; 56A5   02B8 0005
        ADDI    #$0002, R1                      ; 56A7   02F9 0002
        MVO@    R0,     R1                      ; 56A9   0248
        SUBI    #$0006, R1                      ; 56AA   0339 0006

        JSR     R5,     .EXEC.766               ; 56AC   0004 0114 0366

        MOVR    R0,     R1                      ; 56AF   0081
        MVI     G_01BA, R2                      ; 56B0   0282 01BA
        CMPI    #$0020, R2                      ; 56B2   037A 0020
        BNEQ    L_56F2                          ; 56B4   020C 003C

        MOVR    R0,     R2                      ; 56B6   0082
        PSHR    R0                              ; 56B7   0270
        ADDI    #$01A9, R2                      ; 56B8   02FA 01A9
        MVI@    R2,     R0                      ; 56BA   0290
        XORI    #$0080, R0                      ; 56BB   03F8 0080
        MVO@    R0,     R2                      ; 56BD   0250

        JSR     R5,     L_5E05                  ; 56BE   0004 015C 0205

        PULR    R5                              ; 56C1   02B5
        PULR    R3                              ; 56C2   02B3
        TSTR    R3                              ; 56C3   009B
        PSHR    R5                              ; 56C4   0275
        BEQ     L_56D0                          ; 56C5   0204 0009

        PSHR    R1                              ; 56C7   0271

        JSR     R5,     L_5D7B                  ; 56C8   0004 015C 017B

        PULR    R1                              ; 56CB   02B1
        PSHR    R2                              ; 56CC   0272
        MOVR    R3,     R4                      ; 56CD   009C
        B       L_56D4                          ; 56CE   0200 0004

L_56D0:
        JSR     R5,     L_5D8B                  ; 56D0   0004 015C 018B

        PSHR    R0                              ; 56D3   0270
L_56D4:
        MOVR    R1,     R2                      ; 56D4   008A
        MOVR    R4,     R1                      ; 56D5   00A1

        JSR     R5,     L_6099                  ; 56D6   0004 0160 0099

        MOVR    R0,     R4                      ; 56D9   0084
        PULR    R1                              ; 56DA   02B1
        MVII    #$0037, R0                      ; 56DB   02B8 0037
        PULR    R3                              ; 56DD   02B3
        CMPI    #$0030, R1                      ; 56DE   0379 0030
        BLT     L_56EA                          ; 56E0   0205 0008

        JSR     R5,     L_6C1D                  ; 56E2   0004 016C 001D

        MVII    #$0004, R0                      ; 56E5   02B8 0004
        MVO     R0,     G_01BB                  ; 56E7   0240 01BB
        PULR    R7                              ; 56E9   02B7

L_56EA:
        SDBD                                    ; 56EA   0001
        MVII    #$56E5, R5                      ; 56EB   02BD 00E5 0056
        PSHR    R5                              ; 56EE   0275
        J       L_6CAF                          ; 56EF   0004 036C 00AF

L_56F2:
        PULR    R4                              ; 56F2   02B4
        TSTR    R4                              ; 56F3   00A4
        BNEQ    L_5707                          ; 56F4   020C 0011

        JSR     R5,     L_5700                  ; 56F6   0004 0154 0300

        MVII    #$001E, R0                      ; 56F9   02B8 001E
        MVO     R0,     G_01CF                  ; 56FB   0240 01CF
        MVO     R0,     G_0353                  ; 56FD   0240 0353
        PULR    R7                              ; 56FF   02B7

L_5700:
        PSHR    R5                              ; 5700   0275

        JSR     R5,     L_5E05                  ; 5701   0004 015C 0205
        JSR     R5,     L_5D8B                  ; 5704   0004 015C 018B

L_5707:
        MOVR    R4,     R1                      ; 5707   00A1

        JSR     R5,     .EXEC.777               ; 5708   0004 0114 0377

        ADDI    #$0008, R3                      ; 570B   02FB 0008
        MOVR    R3,     R0                      ; 570D   0098

        JSR     R5,     X_CLAMP                 ; 570E   0004 0114 0270

        COMR    R1                              ; 5711   0019
        RLC     R1,     2                       ; 5712   0055
        SWAP    R2,     1                       ; 5713   0042
        XORR    R0,     R2                      ; 5714   01C2
        MVII    #$001E, R3                      ; 5715   02BB 001E
        MVII    #$0006, R0                      ; 5717   02B8 0006

        JSR     R5,     .EXEC.9BB               ; 5719   0004 0118 01BB

        PULR    R7                              ; 571C   02B7

        PSHR    R5                              ; 571D   0275
        PULR    R7                              ; 571E   02B7

L_571F:
        PSHR    R5                              ; 571F   0275
        MVI     G_01BA, R0                      ; 5720   0280 01BA
        CMPI    #$0004, R0                      ; 5722   0378 0004
        BNEQ    L_5742                          ; 5724   020C 001C

        MVI     G_01B5, R0                      ; 5726   0280 01B5
        MVI     G_01B4, R1                      ; 5728   0281 01B4
        MVI     G_01B6, R2                      ; 572A   0282 01B6
        DECR    R0                              ; 572C   0010
        BNEQ    L_5736                          ; 572D   020C 0007

        TSTR    R1                              ; 572F   0089
        BNEQ    L_573C                          ; 5730   020C 000A

        JSR     R5,     L_5775                  ; 5732   0004 0154 0375

        PULR    R7                              ; 5735   02B7

L_5736:
        TSTR    R0                              ; 5736   0080
        BPL     L_573C                          ; 5737   0203 0003

        DECR    R1                              ; 5739   0011
        MVII    #$003B, R0                      ; 573A   02B8 003B
L_573C:
        MVO     R0,     G_01B5                  ; 573C   0240 01B5
        MVO     R1,     G_01B4                  ; 573E   0241 01B4
        MVO     R2,     G_01B6                  ; 5740   0242 01B6
L_5742:
        PULR    R7                              ; 5742   02B7

L_5743:
        PSHR    R5                              ; 5743   0275
        MVI     G_035B, R0                      ; 5744   0280 035B
        TSTR    R0                              ; 5746   0080
        BNEQ    L_5774                          ; 5747   020C 002B

        MVI     G_01B3, R0                      ; 5749   0280 01B3
        TSTR    R0                              ; 574B   0080
        BNEQ    L_5754                          ; 574C   020C 0006

        MVI     G_01BA, R0                      ; 574E   0280 01BA
        CMPI    #$0008, R0                      ; 5750   0378 0008
        BNEQ    L_5774                          ; 5752   020C 0020

L_5754:
        JSR     R5,     L_F29F                  ; 5754   0004 01F0 029F

        MVI     G_01B4, R0                      ; 5757   0280 01B4
        MVII    #$0002, R1                      ; 5759   02B9 0002
        MVII    #$0007, R3                      ; 575B   02BB 0007
        MVII    #$02E2, R4                      ; 575D   02BC 02E2

        JSR     R5,     X_PRNUM_ZRO             ; 575F   0004 0118 00AD

        MVII    #$02E4, R4                      ; 5762   02BC 02E4

        JSR     R5,     X_PRINT_R5              ; 5764   0004 0118 007B
        STRING  ":"                             ; 5767   003A
        DECLE   $0000                           ; 5768   0000

        MVII    #$0007, R3                      ; 5769   02BB 0007
        MVII    #$02E5, R4                      ; 576B   02BC 02E5
        MVI     G_01B5, R0                      ; 576D   0280 01B5
        MVII    #$0002, R1                      ; 576F   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 5771   0004 0118 00AD

L_5774:
        PULR    R7                              ; 5774   02B7

L_5775:
        PSHR    R5                              ; 5775   0275
        CLRR    R0                              ; 5776   01C0
        MVO     R0,     G_01B5                  ; 5777   0240 01B5

        JSR     R5,     L_5743                  ; 5779   0004 0154 0343
        JSR     R5,     L_DD8F                  ; 577C   0004 01DC 018F

        MVII    #$0040, R0                      ; 577F   02B8 0040
        MVO     R0,     G_01BA                  ; 5781   0240 01BA
        MVI     G_017E, R0                      ; 5783   0280 017E
        CMPI    #$00FF, R0                      ; 5785   0378 00FF
        BEQ     L_578C                          ; 5787   0204 0003
        J       L_D9AA                          ; 5789   0004 03D8 01AA

L_578C:
        JSR     R5,     L_D5DA                  ; 578C   0004 01D4 01DA

        MVII    #$000A, R0                      ; 578F   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5791   0004 011C 02D5
        JSR     R5,     L_58A8                  ; 5794   0004 0158 00A8

        CLRR    R0                              ; 5797   01C0
        MVO     R0,     G_01BB                  ; 5798   0240 01BB
        MVO     R0,     G_016B                  ; 579A   0240 016B
        MVO     R0,     G_01D1                  ; 579C   0240 01D1

        JSR     R5,     L_D822                  ; 579E   0004 01D8 0022

        MVII    #$0006, R0                      ; 57A1   02B8 0006
        MVO     R0,     G_01B1                  ; 57A3   0240 01B1
L_57A5:
        MVII    #$0019, R3                      ; 57A5   02BB 0019
        SDBD                                    ; 57A7   0001
        MVII    #$5000, R2                      ; 57A8   02BA 0000 0050
        MVO     R0,     G_01BC                  ; 57AB   0240 01BC
        DECR    R0                              ; 57AD   0010

L_57AE:
        JSR     R5,     .EXEC.9AD               ; 57AE   0004 0118 01AD

        SLR     R3,     1                       ; 57B1   0063
        DECR    R0                              ; 57B2   0010
        BPL     L_57AE                          ; 57B3   0223 0006

        SETC                                    ; 57B5   0007
        PULR    R7                              ; 57B6   02B7

L_57B7:
        PSHR    R5                              ; 57B7   0275
        CLRR    R0                              ; 57B8   01C0
        MVI     G_01B6, R1                      ; 57B9   0281 01B6
        SARC    R1,     1                       ; 57BB   0079
        BNC     L_57C0                          ; 57BC   0209 0002

        MVII    #$0080, R0                      ; 57BE   02B8 0080
L_57C0:
        SDBD                                    ; 57C0   0001
        MVII    #$587C, R5                      ; 57C1   02BD 007C 0058
        SDBD                                    ; 57C4   0001
        MVII    #$0180, R4                      ; 57C5   02BC 0080 0001
L_57C8:
        MVI@    R5,     R2                      ; 57C8   02AA
        TSTR    R2                              ; 57C9   0092
        BEQ     L_57D7                          ; 57CA   0204 000B

        XORR    R0,     R2                      ; 57CC   01C2
        MVO@    R2,     R4                      ; 57CD   0262
        MVII    #$0003, R1                      ; 57CE   02B9 0003
L_57D0:
        MVI@    R5,     R2                      ; 57D0   02AA
        MVO@    R2,     R4                      ; 57D1   0262
        DECR    R1                              ; 57D2   0011
        BNEQ    L_57D0                          ; 57D3   022C 0004
        B       L_57C8                          ; 57D5   0220 000E
L_57D7:
        PULR    R7                              ; 57D7   02B7

L_57D8:
        PSHR    R5                              ; 57D8   0275
        MVI     G_01B3, R1                      ; 57D9   0281 01B3
        TSTR    R1                              ; 57DB   0089
        BNEQ    L_57FC                          ; 57DC   020C 001E

        MVI     G_01B4, R1                      ; 57DE   0281 01B4
        CMPI    #$000F, R1                      ; 57E0   0379 000F
        BGT     L_57FB                          ; 57E2   020E 0017
        BEQ     L_57EE                          ; 57E4   0204 0008

        CMPI    #$000A, R1                      ; 57E6   0379 000A
        BEQ     L_57EE                          ; 57E8   0204 0004

        CMPI    #$0005, R1                      ; 57EA   0379 0005
        BPL     L_57FB                          ; 57EC   0203 000D

L_57EE:
        MVI     G_01B5, R1                      ; 57EE   0281 01B5
        CMPI    #$000F, R1                      ; 57F0   0379 000F
        BGT     L_57FB                          ; 57F2   020E 0007

        MVII    #$00FF, R1                      ; 57F4   02B9 00FF
        MVO     R1,     G_01B3                  ; 57F6   0241 01B3

        JSR     R5,     L_5743                  ; 57F8   0004 0154 0343

L_57FB:
        PULR    R7                              ; 57FB   02B7

L_57FC:
        JSR     R5,     L_F29F                  ; 57FC   0004 01F0 029F

        CLRR    R1                              ; 57FF   01C9
        MVO     R1,     G_01B3                  ; 5800   0241 01B3
        PULR    R7                              ; 5802   02B7

        DECLE   $0040,  $0058,  $0013,  $0058   ; 5803   0040 0058 0013 0058
        DECLE   $0000,  $0054,  $0000,  $0000   ; 5807   0000 0054 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0003   ; 580B   0000 0000 00F0 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 580F   0000 0000 0000 0000
        DECLE   $001D,  $0057,  $0053,  $0054   ; 5813   001D 0057 0053 0054
        DECLE   $0006,  $000C,  $0000,  $001D   ; 5817   0006 000C 0000 001D
        DECLE   $0057,  $0053,  $0054,  $0004   ; 581B   0057 0053 0054 0004
        DECLE   $0004,  $0000,  $001D,  $0057   ; 581F   0004 0000 001D 0057
        DECLE   $0053,  $0054,  $0001,  $0002   ; 5823   0053 0054 0001 0002
        DECLE   $0000,  $001D,  $0057,  $006F   ; 5827   0000 001D 0057 006F
        DECLE   $0056,  $0001,  $0018,  $0000   ; 582B   0056 0001 0018 0000
        DECLE   $001D,  $0057,  $0031,  $006E   ; 582F   001D 0057 0031 006E
        DECLE   $0003,  $001A,  $0000,  $001D   ; 5833   0003 001A 0000 001D
        DECLE   $0057,  $0030,  $0054,  $0005   ; 5837   0057 0030 0054 0005
        DECLE   $0020,  $0000,  $001D,  $0057   ; 583B   0020 0000 001D 0057
        DECLE   $000E,  $0054,  $0005,  $002A   ; 583F   000E 0054 0005 002A
        DECLE   $000C,  $0021,  $00F1,  $0021   ; 5843   000C 0021 00F1 0021
        DECLE   $01F1,  $0221,  $00F1,  $0221   ; 5847   01F1 0221 00F1 0221
        DECLE   $01F1,  $0121,  $00F1,  $0121   ; 584B   01F1 0121 00F1 0121
        DECLE   $01F1,  $0007,  $0048,  $0060   ; 584F   01F1 0007 0048 0060
        DECLE   $0058,  $0000,  $0054,  $0000   ; 5853   0058 0000 0054 0000
        DECLE   $0034,  $0000,  $0000,  $0000   ; 5857   0034 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585B   0000 0000 0000 0000
        DECLE   $0000,  $001D,  $0057,  $0064   ; 585F   0000 001D 0057 0064
        DECLE   $00D5,  $0001,  $0000,  $000D   ; 5863   00D5 0001 0000 000D
        DECLE   $00A3,  $0066,  $0030,  $00D4   ; 5867   00A3 0066 0030 00D4
        DECLE   $0030,  $01D4,  $0230,  $00D4   ; 586B   0030 01D4 0230 00D4
        DECLE   $0230,  $01D4,  $0130,  $00D4   ; 586F   0230 01D4 0130 00D4
        DECLE   $0130,  $01D4,  $001D,  $0057   ; 5873   0130 01D4 001D 0057
        DECLE   $0089,  $00D6,  $0001,  $0001   ; 5877   0089 00D6 0001 0001
        DECLE   $0000,  $000F,  $0005,  $0022   ; 587B   0000 000F 0005 0022
        DECLE   $0000,  $0018,  $0003,  $0022   ; 587F   0000 0018 0003 0022
        DECLE   $0000,  $0030,  $0009,  $0022   ; 5883   0000 0030 0009 0022
        DECLE   $0000,  $0037,  $0006,  $0022   ; 5887   0000 0037 0006 0022
        DECLE   $0000,  $00B9,  $0005,  $0022   ; 588B   0000 00B9 0005 0022
        DECLE   $0000,  $00B0,  $0003,  $0022   ; 588F   0000 00B0 0003 0022
        DECLE   $0000,  $0098,  $0009,  $0022   ; 5893   0000 0098 0009 0022
        DECLE   $0000,  $0091,  $0006,  $0022   ; 5897   0000 0091 0006 0022
        DECLE   $0000,  $0000,  $0000           ; 589B   0000 0000 0000

        ADDR    R0,     R6                      ; 589E   00C6
        RLC     R1,     1                       ; 589F   0051
        ADDR    R0,     R6                      ; 58A0   00C6
        RLC     R1,     1                       ; 58A1   0051
        ADDR    R0,     R6                      ; 58A2   00C6
        RLC     R1,     1                       ; 58A3   0051
        ADDR    R0,     R6                      ; 58A4   00C6
        RLC     R1,     1                       ; 58A5   0051
        ADDR    R0,     R6                      ; 58A6   00C6
        RLC     R1,     1                       ; 58A7   0051
L_58A8:
        MVII    #$01C6, R1                      ; 58A8   02B9 01C6
        MVII    #$031D, R3                      ; 58AA   02BB 031D
L_58AC:
        MVI@    R1,     R0                      ; 58AC   0288
        ANDI    #$0080, R0                      ; 58AD   03B8 0080
        BEQ     L_58B5                          ; 58AF   0204 0004

        MVI@    R3,     R0                      ; 58B1   0298
        XORI    #$0014, R0                      ; 58B2   03F8 0014
        MVO@    R0,     R3                      ; 58B4   0258
L_58B5:
        INCR    R1                              ; 58B5   0009
        ADDI    #$0008, R3                      ; 58B6   02FB 0008
        CMPI    #$01C9, R1                      ; 58B8   0379 01C9
        BLT     L_58AC                          ; 58BA   0225 000F

L_58BC:
        MVI@    R1,     R0                      ; 58BC   0288
        ANDI    #$0080, R0                      ; 58BD   03B8 0080
        BEQ     L_58C5                          ; 58BF   0204 0004

        MVI@    R3,     R0                      ; 58C1   0298
        XORI    #$0002, R0                      ; 58C2   03F8 0002
        MVO@    R0,     R3                      ; 58C4   0258
L_58C5:
        INCR    R1                              ; 58C5   0009
        ADDI    #$0008, R3                      ; 58C6   02FB 0008
        CMPI    #$01CC, R1                      ; 58C8   0379 01CC
        BLT     L_58BC                          ; 58CA   0225 000F
        MOVR    R5,     R7                      ; 58CC   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 58CD   0000 0000 0000 0000
        DECLE   $000B,  $0036,  $0002,  $037C   ; 58D1   000B 0036 0002 037C
        DECLE   $0066,  $0000,  $0000,  $0000   ; 58D5   0066 0000 0000 0000
        DECLE   $0000,  $000B,  $004C,  $0002   ; 58D9   0000 000B 004C 0002
        DECLE   $037C,  $0066                   ; 58DD   037C 0066
.GRAM_INIT_58DF:
        DECLE   $0030           ; 58DF  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 58E0  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 58E2  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 58E4  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 58E6  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 58E8  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 58EA  #28-2F:  CART #28-2F ----

.GFX_LIST_58EC:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EC  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 58F0  
        DECLE   $0010,  $001C,  $0017,  $0010   ; 58F4  CART PIC #01
        DECLE   $0010,  $0010,  $0000,  $00FF   ; 58F8  
        DECLE   $0018,  $0018,  $0018,  $0018   ; 58FC  CART PIC #02
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5900  
        DECLE   $0001,  $0002,  $0004,  $0008   ; 5904  CART PIC #03
        DECLE   $0010,  $0020,  $0040,  $00FF   ; 5908  
        DECLE   $0080,  $0040,  $0020,  $0010   ; 590C  CART PIC #04
        DECLE   $0008,  $0004,  $0002,  $00FF   ; 5910  
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5914  CART PIC #05
        DECLE   $0018,  $0018,  $0018,  $00FF   ; 5918  
        DECLE   $0001,  $0003,  $0007,  $000F   ; 591C  CART PIC #06
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 5920  
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; 5924  CART PIC #07
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 5928  
        DECLE   $00E4,  $00EC,  $00B4,  $00A4   ; 592C  CART PIC #08
        DECLE   $0085,  $0085,  $0086,  $0000   ; 5930  
        DECLE   $007B,  $004B,  $0088,  $00F8   ; 5934  CART PIC #09
        DECLE   $0008,  $0008,  $0008,  $0000   ; 5938  
        DECLE   $00FD,  $0091,  $0091,  $0097   ; 593C  CART PIC #0A
        DECLE   $0094,  $0094,  $0097,  $0000   ; 5940  
        DECLE   $00E8,  $0008,  $0008,  $00E8   ; 5944  CART PIC #0B
        DECLE   $0008,  $000F,  $00EF,  $0000   ; 5948  
        DECLE   $0001,  $0001,  $0001,  $0007   ; 594C  CART PIC #0C
        DECLE   $0004,  $0084,  $0087,  $0000   ; 5950  
        DECLE   $000F,  $0008,  $0008,  $003F   ; 5954  CART PIC #0D
        DECLE   $0020,  $00A0,  $00BF,  $0000   ; 5958  
        DECLE   $007D,  $007D,  $0040,  $0040   ; 595C  CART PIC #0E
        DECLE   $0040,  $0040,  $007C,  $0000   ; 5960  
        DECLE   $00F7,  $00F4,  $0044,  $0047   ; 5964  CART PIC #0F
        DECLE   $0044,  $0044,  $0044,  $0000   ; 5968  
        DECLE   $00CF,  $0048,  $0048,  $00E8   ; 596C  CART PIC #10
        DECLE   $0028,  $002F,  $002F,  $0000   ; 5970  
        DECLE   $00DF,  $005F,  $0050,  $0050   ; 5974  CART PIC #11
        DECLE   $0050,  $00D0,  $00D0,  $0000   ; 5978  
        DECLE   $0093,  $0093,  $0092,  $0092   ; 597C  CART PIC #12
        DECLE   $0092,  $00BA,  $00BB,  $0000   ; 5980  
        DECLE   $00EF,  $00E8,  $00E8,  $000F   ; 5984  CART PIC #13
        DECLE   $0000,  $0000,  $00EF,  $0000   ; 5988  
        DECLE   $009D,  $0009,  $0000,  $00C0   ; 598C  CART PIC #14
        DECLE   $00C0,  $00C0,  $00C0,  $0000   ; 5990  
        DECLE   $00E7,  $00CF,  $008F,  $0087   ; 5994  CART PIC #15
        DECLE   $00CF,  $00CF,  $009F,  $00CF   ; 5998  
        DECLE   $00B0,  $0050,  $0000,  $0000   ; 599C  CART PIC #16
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A0  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A4  CART PIC #17
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59A8  
        DECLE   $0000,  $0000,  $00FF,  $00EF   ; 59AC  CART PIC #18
        DECLE   $00FF,  $00C7,  $00BB,  $0003   ; 59B0  
        DECLE   $0000,  $0000,  $00FF,  $00EF   ; 59B4  CART PIC #19
        DECLE   $00FF,  $00C7,  $00BB,  $0000   ; 59B8  
        DECLE   $00E7,  $00CF,  $008F,  $0087   ; 59BC  CART PIC #1A
        DECLE   $00CF,  $00CF,  $009F,  $00CF   ; 59C0  
        DECLE   $00E7,  $00FF,  $00C7,  $00AB   ; 59C4  CART PIC #1B
        DECLE   $00C7,  $00D7,  $00D7,  $00D7   ; 59C8  
        DECLE   $00CF,  $00FF,  $00C7,  $00AB   ; 59CC  CART PIC #1C
        DECLE   $00C7,  $00D7,  $00D7,  $00D7   ; 59D0  
        DECLE   $0081,  $00C2,  $00A4,  $0088   ; 59D4  CART PIC #1D
        DECLE   $009C,  $00A2,  $00C1,  $00FF   ; 59D8  
        DECLE   $0081,  $0043,  $0025,  $0011   ; 59DC  CART PIC #1E
        DECLE   $0039,  $0045,  $0083,  $00FF   ; 59E0  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E4  CART PIC #1F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E8  
        DECLE   $007F,  $0080,  $0000,  $0000   ; 59EC  CART PIC #20
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F0  
        DECLE   $0000,  $000F,  $00F0,  $0000   ; 59F4  CART PIC #21
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F8  
        DECLE   $0000,  $0000,  $0000,  $0003   ; 59FC  CART PIC #22
        DECLE   $000C,  $0030,  $0040,  $0080   ; 5A00  
        DECLE   $0001,  $0002,  $0002,  $0002   ; 5A04  CART PIC #23
        DECLE   $0002,  $0002,  $0001,  $0000   ; 5A08  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A0C  CART PIC #24
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5A10  
        DECLE   $0040,  $0030,  $000C,  $0003   ; 5A14  CART PIC #25
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A18  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A1C  CART PIC #26
        DECLE   $00F0,  $000F,  $0000,  $0000   ; 5A20  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A24  CART PIC #27
        DECLE   $0000,  $00C0,  $003F,  $0000   ; 5A28  
        DECLE   $00FE,  $0001,  $0000,  $0000   ; 5A2C  CART PIC #28
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A30  
        DECLE   $0000,  $00F0,  $000F,  $0000   ; 5A34  CART PIC #29
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A38  
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5A3C  CART PIC #2A
        DECLE   $0030,  $000C,  $0002,  $0001   ; 5A40  
        DECLE   $0080,  $0040,  $0040,  $0040   ; 5A44  CART PIC #2B
        DECLE   $0040,  $0040,  $0080,  $0000   ; 5A48  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A4C  CART PIC #2C
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5A50  
        DECLE   $0002,  $000C,  $0030,  $00C0   ; 5A54  CART PIC #2D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A58  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A5C  CART PIC #2E
        DECLE   $000F,  $00F0,  $0000,  $0000   ; 5A60  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A64  CART PIC #2F
        DECLE   $0000,  $0003,  $00FC,  $0000   ; 5A68  
L_5A6C:
        PSHR    R5                              ; 5A6C   0275
        MVII    #$016B, R4                      ; 5A6D   02BC 016B
        MVI@    R4,     R0                      ; 5A6F   02A0
        SWAP    R0,     1                       ; 5A70   0040
        SAR     R0,     2                       ; 5A71   006C
        SAR     R0,     2                       ; 5A72   006C
        SAR     R0,     1                       ; 5A73   0068
        MOVR    R4,     R3                      ; 5A74   00A3
        SDBD                                    ; 5A75   0001
        ADD@    R4,     R0                      ; 5A76   02E0
        MVO@    R0,     R3                      ; 5A77   0258
        SWAP    R0,     1                       ; 5A78   0040
        MOVR    R0,     R2                      ; 5A79   0082
        INCR    R3                              ; 5A7A   000B
        SUB@    R3,     R0                      ; 5A7B   0318
        MOVR    R2,     R1                      ; 5A7C   0091
        ANDI    #$0007, R1                      ; 5A7D   03B9 0007
        MVO@    R1,     R3                      ; 5A7F   0259
        XORR    R1,     R2                      ; 5A80   01CA
        MVII    #$0171, R5                      ; 5A81   02BD 0171
        MVO@    R2,     R5                      ; 5A83   026A
        SUBR    R0,     R2                      ; 5A84   0102
        INCR    R5                              ; 5A85   000D
        MVO@    R2,     R5                      ; 5A86   026A
        MVII    #$0003, R3                      ; 5A87   02BB 0003
        MVO@    R3,     R5                      ; 5A89   026B
        MVII    #$0100, R5                      ; 5A8A   02BD 0100
        MVI@    R5,     R0                      ; 5A8C   02A8
        MVO@    R0,     R4                      ; 5A8D   0260
        MVI@    R5,     R0                      ; 5A8E   02A8
        MVO@    R0,     R4                      ; 5A8F   0260
        MVII    #$00A4, R0                      ; 5A90   02B8 00A4
        MVII    #$005A, R1                      ; 5A92   02B9 005A
        MVO     R0,     .ISRVEC.0               ; 5A94   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5A96   0241 0101
L_5A98:
        EIS                                     ; 5A98   0002
        MVI     G_0174, R2                      ; 5A99   0282 0174
        SARC    R2,     2                       ; 5A9B   007E
        BC      L_5A98                          ; 5A9C   0221 0005
        BNOV    L_5AA3                          ; 5A9E   020A 0003

        JSR     R5,     L_D7D9                  ; 5AA0   0004 01D4 03D9

L_5AA3:
        PULR    R7                              ; 5AA3   02B7

        PSHR    R5                              ; 5AA4   0275
        MVII    #$031D, R2                      ; 5AA5   02BA 031D
        CLRR    R3                              ; 5AA7   01DB
L_5AA8:
        MVII    #$0172, R5                      ; 5AA8   02BD 0172
        MVI@    R2,     R0                      ; 5AAA   0290
        SLL     R0,     1                       ; 5AAB   0048
        BPL     L_5AB0                          ; 5AAC   0203 0002

        MVII    #$0170, R5                      ; 5AAE   02BD 0170
L_5AB0:
        ADDI    #$0002, R2                      ; 5AB0   02FA 0002
        MVI@    R2,     R0                      ; 5AB2   0290
        SDBD                                    ; 5AB3   0001
        ADD@    R5,     R0                      ; 5AB4   02E8
        MVO@    R0,     R2                      ; 5AB5   0250
        MVI@    R3,     R0                      ; 5AB6   0298
        MOVR    R0,     R1                      ; 5AB7   0081
        ANDI    #$00FF, R1                      ; 5AB8   03B9 00FF
        XORR    R1,     R0                      ; 5ABA   01C8
        DECR    R5                              ; 5ABB   0015
        ADD@    R5,     R1                      ; 5ABC   02E9
        ANDI    #$00FF, R1                      ; 5ABD   03B9 00FF
        XORR    R1,     R0                      ; 5ABF   01C8
        MVO@    R0,     R3                      ; 5AC0   0258
        ADDI    #$0006, R2                      ; 5AC1   02FA 0006
        INCR    R3                              ; 5AC3   000B
        CMPI    #$0008, R3                      ; 5AC4   037B 0008
        BNEQ    L_5AA8                          ; 5AC6   022C 001F

        MVI     G_016D, R0                      ; 5AC8   0280 016D
        MVO     R0,     .STIC.HDLY              ; 5ACA   0240 0030
        MVO     R0,     .STIC.VIDEN             ; 5ACC   0240 0020
        MVI     G_016E, R0                      ; 5ACE   0280 016E
        MVI     G_016F, R1                      ; 5AD0   0281 016F
        MVO     R0,     .ISRVEC.0               ; 5AD2   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5AD4   0241 0101
        CLRR    R2                              ; 5AD6   01D2
        MVI     G_0171, R0                      ; 5AD7   0280 0171
        SWAP    R0,     2                       ; 5AD9   0044
        BEQ     L_5B09                          ; 5ADA   0204 002D
        BPL     L_5AF2                          ; 5ADC   0203 0014

        MVII    #$0200, R4                      ; 5ADE   02BC 0200
        MOVR    R4,     R5                      ; 5AE0   00A5
L_5AE1:
        MVI@    R4,     R0                      ; 5AE1   02A0
        MVI@    R4,     R0                      ; 5AE2   02A0
        MVO@    R0,     R5                      ; 5AE3   0268
        MVII    #$0012, R3                      ; 5AE4   02BB 0012
L_5AE6:
        MVI@    R4,     R0                      ; 5AE6   02A0
        MVO@    R0,     R5                      ; 5AE7   0268
        DECR    R3                              ; 5AE8   0013
        BNEQ    L_5AE6                          ; 5AE9   022C 0004

        INCR    R5                              ; 5AEB   000D
        CMPI    #$02E6, R4                      ; 5AEC   037C 02E6
        BLT     L_5AE1                          ; 5AEE   0225 000E
        B       L_5B07                          ; 5AF0   0200 0015

L_5AF2:
        MVII    #$0212, R5                      ; 5AF2   02BD 0212
        MVII    #$0003, R1                      ; 5AF4   02B9 0003
L_5AF6:
        MVII    #$0012, R3                      ; 5AF6   02BB 0012
L_5AF8:
        MVI@    R5,     R0                      ; 5AF8   02A8
        MVO@    R0,     R5                      ; 5AF9   0268
        SUBR    R1,     R5                      ; 5AFA   010D
        DECR    R3                              ; 5AFB   0013
        BNEQ    L_5AF8                          ; 5AFC   022C 0005

        MVI@    R5,     R0                      ; 5AFE   02A8
        MVO@    R0,     R5                      ; 5AFF   0268
        ADDI    #$0024, R5                      ; 5B00   02FD 0024
        CMPI    #$02F0, R5                      ; 5B02   037D 02F0
        BLT     L_5AF6                          ; 5B04   0225 000F

        INCR    R2                              ; 5B06   000A
L_5B07:
        MVII    #$0002, R0                      ; 5B07   02B8 0002
L_5B09:
        SLL     R2,     2                       ; 5B09   004E
        XORR    R0,     R2                      ; 5B0A   01C2
        MVO     R2,     G_0174                  ; 5B0B   0242 0174

        JSR     R5,     X_PLAY_NOTE             ; 5B0D   0004 0118 02BD

        PULR    R7                              ; 5B10   02B7

L_5B11:
        PSHR    R5                              ; 5B11   0275
        MVII    #$0321, R2                      ; 5B12   02BA 0321
        MVII    #$01C6, R3                      ; 5B14   02BB 01C6
        MVI@    R3,     R1                      ; 5B16   0299
        MVII    #$0006, R4                      ; 5B17   02BC 0006
L_5B19:
        MVI@    R2,     R0                      ; 5B19   0290
        TSTR    R0                              ; 5B1A   0080
        PSHR    R1                              ; 5B1B   0271
        BNEQ    L_5B36                          ; 5B1C   020C 0018

        ANDI    #$0007, R1                      ; 5B1E   03B9 0007
        CMPI    #$0004, R1                      ; 5B20   0379 0004
        BGT     L_5B29                          ; 5B22   020E 0005

L_5B24:
        PULR    R1                              ; 5B24   02B1
        ADDI    #$0003, R1                      ; 5B25   02F9 0003
        MVO@    R1,     R3                      ; 5B27   0259
        PSHR    R1                              ; 5B28   0271
L_5B29:
        PULR    R1                              ; 5B29   02B1
L_5B2A:
        INCR    R3                              ; 5B2A   000B
        ADDI    #$0008, R2                      ; 5B2B   02FA 0008
        MVI@    R3,     R1                      ; 5B2D   0299
        DECR    R4                              ; 5B2E   0014
        BNEQ    L_5B19                          ; 5B2F   022C 0017

        MVII    #$007F, R0                      ; 5B31   02B8 007F
        MVO     R0,     G_011E                  ; 5B33   0240 011E
        PULR    R7                              ; 5B35   02B7

L_5B36:
        ANDI    #$0007, R1                      ; 5B36   03B9 0007
        TSTR    R1                              ; 5B38   0089
        BEQ     L_5B24                          ; 5B39   0224 0016

        PULR    R1                              ; 5B3B   02B1
        DECR    R1                              ; 5B3C   0011
        MVO@    R1,     R3                      ; 5B3D   0259
        B       L_5B2A                          ; 5B3E   0220 0015

L_5B40:
        PSHR    R5                              ; 5B40   0275
        MVI     G_01BA, R0                      ; 5B41   0280 01BA
        CMPI    #$0004, R0                      ; 5B43   0378 0004
        BNEQ    L_5BE1                          ; 5B45   020C 009A

        CLRR    R2                              ; 5B47   01D2
        CLRR    R3                              ; 5B48   01DB
        MVI     G_01B9, R0                      ; 5B49   0280 01B9
        CMPI    #$00FF, R0                      ; 5B4B   0378 00FF
        BEQ     L_5B57                          ; 5B4D   0204 0008

        MVII    #$0020, R3                      ; 5B4F   02BB 0020
        CMPI    #$0003, R0                      ; 5B51   0378 0003
        BLT     L_5B57                          ; 5B53   0205 0002

        MOVR    R3,     R2                      ; 5B55   009A
        CLRR    R3                              ; 5B56   01DB
L_5B57:
        CLRR    R0                              ; 5B57   01C0

        JSR     R5,     L_DA3D                  ; 5B58   0004 01D8 023D

        MVI     G_01A6, R4                      ; 5B5B   0284 01A6
        MVII    #$0010, R0                      ; 5B5D   02B8 0010
        MVII    #$0008, R1                      ; 5B5F   02B9 0008
        BC      L_5B75                          ; 5B61   0201 0012

        CMPI    #$002D, R4                      ; 5B63   037C 002D
        BGE     L_5B7F                          ; 5B65   020D 0018

        CMPI    #$0007, R4                      ; 5B67   037C 0007
        BLT     L_5B70                          ; 5B69   0205 0005

L_5B6B:
        MVII    #$0018, R0                      ; 5B6B   02B8 0018
        MOVR    R0,     R1                      ; 5B6D   0081
        B       L_5B7F                          ; 5B6E   0200 000F

L_5B70:
        MOVR    R0,     R5                      ; 5B70   0085
        MOVR    R1,     R0                      ; 5B71   0088
        MOVR    R5,     R1                      ; 5B72   00A9
        B       L_5B7F                          ; 5B73   0200 000A

L_5B75:
        CMPI    #$0007, R4                      ; 5B75   037C 0007
        BLT     L_5B7F                          ; 5B77   0205 0006

        CMPI    #$002D, R4                      ; 5B79   037C 002D
        BGE     L_5B70                          ; 5B7B   022D 000C
        B       L_5B6B                          ; 5B7D   0220 0013

L_5B7F:
        XORR    R0,     R3                      ; 5B7F   01C3
        XORR    R1,     R2                      ; 5B80   01CA
        SDBD                                    ; 5B81   0001
        MVII    #$FF87, R4                      ; 5B82   02BC 0087 00FF
        MVII    #$01C6, R1                      ; 5B85   02B9 01C6
        MVII    #$0006, R5                      ; 5B87   02BD 0006
L_5B89:
        MVI@    R1,     R0                      ; 5B89   0288
        ANDR    R4,     R0                      ; 5B8A   01A0
        XORR    R3,     R0                      ; 5B8B   01D8
        MVO@    R0,     R1                      ; 5B8C   0248
        INCR    R1                              ; 5B8D   0009
        DECR    R5                              ; 5B8E   0015
        BEQ     L_5B98                          ; 5B8F   0204 0007

        CMPI    #$0003, R5                      ; 5B91   037D 0003
        BNEQ    L_5B89                          ; 5B93   022C 000B

        MOVR    R2,     R3                      ; 5B95   0093
        B       L_5B89                          ; 5B96   0220 000E

L_5B98:
        MVI     G_01B9, R1                      ; 5B98   0281 01B9
        CMPI    #$00FF, R1                      ; 5B9A   0379 00FF
        BEQ     L_5BA4                          ; 5B9C   0204 0006

        ADDI    #$01C6, R1                      ; 5B9E   02F9 01C6
        MVI@    R1,     R0                      ; 5BA0   0288
        XORI    #$0040, R0                      ; 5BA1   03F8 0040
        MVO@    R0,     R1                      ; 5BA3   0248
L_5BA4:
        MVI     G_01CC, R0                      ; 5BA4   0280 01CC
        MVII    #$01C6, R4                      ; 5BA6   02BC 01C6
        MVII    #$031D, R3                      ; 5BA8   02BB 031D
        MVII    #$01A9, R2                      ; 5BAA   02BA 01A9
        TSTR    R0                              ; 5BAC   0080
        BNEQ    L_5BB3                          ; 5BAD   020C 0004

        MVO     R3,     G_01CC                  ; 5BAF   0243 01CC
        B       L_5BBC                          ; 5BB1   0200 0009

L_5BB3:
        CLRR    R0                              ; 5BB3   01C0
        ADDI    #$0003, R4                      ; 5BB4   02FC 0003
        ADDI    #$0003, R2                      ; 5BB6   02FA 0003
        MVII    #$0335, R3                      ; 5BB8   02BB 0335
        MVO     R0,     G_01CC                  ; 5BBA   0240 01CC
L_5BBC:
        MVII    #$0003, R0                      ; 5BBC   02B8 0003
L_5BBE:
        MVI@    R4,     R1                      ; 5BBE   02A1
        MVI@    R2,     R5                      ; 5BBF   0295
        ANDI    #$0004, R5                      ; 5BC0   03BD 0004
        BNEQ    L_5BDB                          ; 5BC2   020C 0017

        SWAP    R1,     1                       ; 5BC4   0041
        MVII    #$01DB, R5                      ; 5BC5   02BD 01DB
        MVO@    R3,     R5                      ; 5BC7   026B
        MVO@    R2,     R5                      ; 5BC8   026A
        MVO@    R0,     R5                      ; 5BC9   0268

        JSR     R5,     L_5BE2                  ; 5BCA   0004 0158 03E2

        MVII    #$01DB, R5                      ; 5BCD   02BD 01DB
        MVI@    R5,     R3                      ; 5BCF   02AB
        MVI@    R5,     R2                      ; 5BD0   02AA
        MVI@    R5,     R0                      ; 5BD1   02A8
        ADDI    #$0300, R3                      ; 5BD2   02FB 0300
        ADDI    #$0100, R2                      ; 5BD4   02FA 0100
        MOVR    R2,     R4                      ; 5BD6   0094
        SDBD                                    ; 5BD7   0001
        ADDI    #$001E, R4                      ; 5BD8   02FC 001E 0000
L_5BDB:
        ADDI    #$0008, R3                      ; 5BDB   02FB 0008
        INCR    R2                              ; 5BDD   000A
        DECR    R0                              ; 5BDE   0010
        BNEQ    L_5BBE                          ; 5BDF   022C 0022
L_5BE1:
        PULR    R7                              ; 5BE1   02B7

L_5BE2:
        PSHR    R5                              ; 5BE2   0275
        SLLC    R1,     2                       ; 5BE3   005D
        BC      L_5BEF                          ; 5BE4   0201 0009
        BOV     L_5C8D                          ; 5BE6   0202 00A5
        BMI     L_5D2D                          ; 5BE8   020B 0143

        SLLC    R1,     2                       ; 5BEA   005D
        BOV     L_5BF0                          ; 5BEB   0202 0003
        BMI     L_5C2C                          ; 5BED   020B 003D
L_5BEF:
        PULR    R7                              ; 5BEF   02B7
L_5BF0:
        BMI     L_5C11                          ; 5BF0   020B 001F

        SDBD                                    ; 5BF2   0001
        ANDI    #$7000, R1                      ; 5BF3   03B9 0000 0070
        SDBD                                    ; 5BF6   0001
        CMPI    #$4000, R1                      ; 5BF7   0379 0000 0040
        BNC     L_5C89                          ; 5BFA   0209 008D

        JSR     R5,     L_5D7B                  ; 5BFC   0004 015C 017B

        CMPI    #$001C, R2                      ; 5BFF   037A 001C
        BMI     L_5C18                          ; 5C01   020B 0015

        MOVR    R3,     R1                      ; 5C03   0099

        JSR     R5,     .EXEC.766               ; 5C04   0004 0114 0366

        MOVR    R0,     R1                      ; 5C07   0081
        MVII    #$0005, R0                      ; 5C08   02B8 0005

        JSR     R5,     L_5E1F                  ; 5C0A   0004 015C 021F

        CLRC                                    ; 5C0D   0006
        INCR    R6                              ; 5C0E   000E
        B       L_5D6A                          ; 5C0F   0200 0159

L_5C11:
        JSR     R5,     L_5D7B                  ; 5C11   0004 015C 017B

        CMPI    #$000D, R2                      ; 5C14   037A 000D
        BGT     L_5C37                          ; 5C16   020E 001F

L_5C18:
        MVII    #$034D, R1                      ; 5C18   02B9 034D
        MOVR    R3,     R2                      ; 5C1A   009A

L_5C1B:
        JSR     R5,     L_6099                  ; 5C1B   0004 0160 0099

        ANDI    #$000F, R0                      ; 5C1E   03B8 000F
        MOVR    R0,     R1                      ; 5C20   0081
        SDBD                                    ; 5C21   0001
        MVII    #$0013, R0                      ; 5C22   02B8 0013 0000

        JSR     R5,     .EXEC.629               ; 5C25   0004 0114 0229

        ADDI    #$0004, R2                      ; 5C28   02FA 0004
        MVO@    R0,     R2                      ; 5C2A   0250
        PULR    R7                              ; 5C2B   02B7

L_5C2C:
        JSR     R5,     L_5D7B                  ; 5C2C   0004 015C 017B

        CMPI    #$000D, R2                      ; 5C2F   037A 000D
        BGT     L_5C76                          ; 5C31   020E 0043

        MOVR    R3,     R1                      ; 5C33   0099

        JSR     R5,     L_5DD8                  ; 5C34   0004 015C 01D8

L_5C37:
        MVI     G_01B9, R0                      ; 5C37   0280 01B9
        CMPI    #$00FF, R0                      ; 5C39   0378 00FF
        BEQ     L_5BEF                          ; 5C3B   0224 004D

        MOVR    R3,     R1                      ; 5C3D   0099

        JSR     R5,     .EXEC.766               ; 5C3E   0004 0114 0366

        CMP     G_01CD, R0                      ; 5C41   0340 01CD
        BEQ     L_5BEF                          ; 5C43   0224 0055

        MOVR    R0,     R1                      ; 5C45   0081
        PSHR    R3                              ; 5C46   0273

        JSR     R5,     L_5E05                  ; 5C47   0004 015C 0205

        MOVR    R3,     R0                      ; 5C4A   0098

        JSR     R5,     L_DA3D                  ; 5C4B   0004 01D8 023D

        ADDI    #$0002, R1                      ; 5C4E   02F9 0002
        MVI@    R1,     R0                      ; 5C50   0288
        MVI     G_034F, R2                      ; 5C51   0282 034F
        BC      L_5C5C                          ; 5C53   0201 0007

        SDBD                                    ; 5C55   0001
        SUBI    #$0A00, R2                      ; 5C56   033A 0000 000A
        CMPR    R0,     R2                      ; 5C59   0142
        B       L_5C61                          ; 5C5A   0200 0005

L_5C5C:
        SDBD                                    ; 5C5C   0001
        ADDI    #$0A00, R2                      ; 5C5D   02FA 0000 000A
        CMPR    R2,     R0                      ; 5C60   0150
L_5C61:
        PULR    R3                              ; 5C61   02B3
        BNC     L_5C66                          ; 5C62   0209 0002
        B       L_5C89                          ; 5C64   0200 0023

L_5C66:
        MOVR    R3,     R1                      ; 5C66   0099

        JSR     R5,     .EXEC.766               ; 5C67   0004 0114 0366

        MOVR    R0,     R1                      ; 5C6A   0081
        MVII    #$0003, R0                      ; 5C6B   02B8 0003

        JSR     R5,     L_5E1F                  ; 5C6D   0004 015C 021F
        DECLE   $0007,  $000F                   ; 5C70   0007 000F

        ADDI    #$0008, R1                      ; 5C72   02F9 0008
        B       L_5D6A                          ; 5C74   0200 00F4

L_5C76:
        CMPI    #$0014, R2                      ; 5C76   037A 0014
        BLT     L_5C18                          ; 5C78   0225 0061

        MOVR    R3,     R1                      ; 5C7A   0099

        JSR     R5,     .EXEC.766               ; 5C7B   0004 0114 0366

        MOVR    R0,     R1                      ; 5C7E   0081

        JSR     R5,     L_5E15                  ; 5C7F   0004 015C 0215
        JSR     R5,     L_5D8B                  ; 5C82   0004 015C 018B

        MOVR    R1,     R2                      ; 5C85   008A
        MOVR    R4,     R1                      ; 5C86   00A1
        B       L_5C1B                          ; 5C87   0220 006D

L_5C89:
        CLRR    R1                              ; 5C89   01C9

        JSR     R5,     L_5D75                  ; 5C8A   0004 015C 0175

L_5C8D:
        MOVR    R1,     R2                      ; 5C8D   008A
        MOVR    R3,     R1                      ; 5C8E   0099

        JSR     R5,     .EXEC.766               ; 5C8F   0004 0114 0366

        MOVR    R0,     R1                      ; 5C92   0081
        SLLC    R2,     2                       ; 5C93   005E
        BOV     L_5C99                          ; 5C94   0202 0003
        BMI     L_5CA8                          ; 5C96   020B 0010
        PULR    R7                              ; 5C98   02B7
L_5C99:
        BMI     L_5D20                          ; 5C99   020B 0085

        SDBD                                    ; 5C9B   0001
        ANDI    #$7000, R2                      ; 5C9C   03BA 0000 0070
        SDBD                                    ; 5C9F   0001
        CMPI    #$2000, R2                      ; 5CA0   037A 0000 0020
        BNC     L_5D1D                          ; 5CA3   0209 0078
        J       L_5ECB                          ; 5CA5   0004 035C 02CB

L_5CA8:
        SDBD                                    ; 5CA8   0001
        ANDI    #$7000, R2                      ; 5CA9   03BA 0000 0070
        SDBD                                    ; 5CAC   0001
        CMPI    #$2000, R2                      ; 5CAD   037A 0000 0020
        BNC     L_5CBA                          ; 5CB0   0209 0008

L_5CB2:
        JSR     R5,     L_5FB3                  ; 5CB2   0004 015C 03B3

        MVII    #$003C, R0                      ; 5CB5   02B8 003C

        JSR     R5,     L_6C1E                  ; 5CB7   0004 016C 001E
L_5CBA:
        JSR     R5,     L_6057                  ; 5CBA   0004 0160 0057
L_5CBD:
        JSR     R5,     L_5E05                  ; 5CBD   0004 015C 0205

        MOVR    R3,     R0                      ; 5CC0   0098
        ADDI    #$0002, R4                      ; 5CC1   02FC 0002
        ADDI    #$0002, R1                      ; 5CC3   02F9 0002
        MVII    #$0003, R2                      ; 5CC5   02BA 0003

        JSR     R5,     L_DA3D                  ; 5CC7   0004 01D8 023D

        BC      L_5CED                          ; 5CCA   0201 0021

L_5CCC:
        CMPR    R4,     R1                      ; 5CCC   0161
        BEQ     L_5CDF                          ; 5CCD   0204 0010

        MVI@    R1,     R0                      ; 5CCF   0288
        SDBD                                    ; 5CD0   0001
        SUBI    #$1000, R0                      ; 5CD1   0338 0000 0010
        SUB@    R4,     R0                      ; 5CD4   0320
        BPL     L_5CE0                          ; 5CD5   0203 0009

        SDBD                                    ; 5CD7   0001
        CMPI    #$CE00, R0                      ; 5CD8   0378 0000 00CE
        BLE     L_5D15                          ; 5CDB   0206 0038
        B       L_5D08                          ; 5CDD   0200 0029

L_5CDF:
        INCR    R4                              ; 5CDF   000C
L_5CE0:
        ADDI    #$0007, R4                      ; 5CE0   02FC 0007
        DECR    R2                              ; 5CE2   0012
        BNEQ    L_5CCC                          ; 5CE3   022C 0018

L_5CE5:
        SUBI    #$0002, R1                      ; 5CE5   0339 0002

        JSR     R5,     .EXEC.766               ; 5CE7   0004 0114 0366

        MOVR    R0,     R1                      ; 5CEA   0081
        B       L_5CB2                          ; 5CEB   0220 003A

L_5CED:
        CMPR    R4,     R1                      ; 5CED   0161
        BEQ     L_5D00                          ; 5CEE   0204 0010

        MVI@    R1,     R0                      ; 5CF0   0288
        SDBD                                    ; 5CF1   0001
        ADDI    #$1000, R0                      ; 5CF2   02F8 0000 0010
        SUB@    R4,     R0                      ; 5CF5   0320
        BMI     L_5D01                          ; 5CF6   020B 0009

        SDBD                                    ; 5CF8   0001
        CMPI    #$3200, R0                      ; 5CF9   0378 0000 0032
        BGT     L_5D15                          ; 5CFC   020E 0017
        B       L_5D08                          ; 5CFE   0200 0008

L_5D00:
        INCR    R4                              ; 5D00   000C
L_5D01:
        ADDI    #$0007, R4                      ; 5D01   02FC 0007
        DECR    R2                              ; 5D03   0012
        BNEQ    L_5CED                          ; 5D04   022C 0018
        B       L_5CE5                          ; 5D06   0220 0022

L_5D08:
        JSR     R5,     L_5FE9                  ; 5D08   0004 015C 03E9

        MVII    #$002D, R0                      ; 5D0B   02B8 002D
        SDBD                                    ; 5D0D   0001
        MVII    #$5BEF, R5                      ; 5D0E   02BD 00EF 005B
        PSHR    R5                              ; 5D11   0275
        J       L_6CAF                          ; 5D12   0004 036C 00AF

L_5D15:
        JSR     R5,     L_5FE9                  ; 5D15   0004 015C 03E9

        MVII    #$003C, R0                      ; 5D18   02B8 003C

        JSR     R5,     L_6C1E                  ; 5D1A   0004 016C 001E
L_5D1D:
        JSR     R5,     L_6C2B                  ; 5D1D   0004 016C 002B

L_5D20:
        SDBD                                    ; 5D20   0001
        ANDI    #$7000, R2                      ; 5D21   03BA 0000 0070
        SDBD                                    ; 5D24   0001
        CMPI    #$5000, R2                      ; 5D25   037A 0000 0050
        BNC     L_5CBD                          ; 5D28   0229 006C

        JSR     R5,     L_6057                  ; 5D2A   0004 0160 0057

L_5D2D:
        SLLC    R1,     2                       ; 5D2D   005D
        BOV     L_5D33                          ; 5D2E   0202 0003
        BMI     L_5D35                          ; 5D30   020B 0003
        PULR    R7                              ; 5D32   02B7
L_5D33:
        BMI     L_5D35                          ; 5D33   020B 0000

L_5D35:
        SDBD                                    ; 5D35   0001
        ANDI    #$7000, R1                      ; 5D36   03B9 0000 0070
        SDBD                                    ; 5D39   0001
        CMPI    #$2000, R1                      ; 5D3A   0379 0000 0020
        BNC     L_5C89                          ; 5D3D   0229 00B5

        MOVR    R3,     R1                      ; 5D3F   0099

        JSR     R5,     .EXEC.766               ; 5D40   0004 0114 0366

        MOVR    R0,     R1                      ; 5D43   0081
        PSHR    R0                              ; 5D44   0270

        JSR     R5,     L_5D7B                  ; 5D45   0004 015C 017B

        CMPI    #$0032, R2                      ; 5D48   037A 0032
        PULR    R1                              ; 5D4A   02B1
        BLT     L_5D52                          ; 5D4B   0205 0005

        MOVR    R3,     R2                      ; 5D4D   009A
        MVII    #$034D, R1                      ; 5D4E   02B9 034D
        B       L_5C1B                          ; 5D50   0220 0136

L_5D52:
        CMPI    #$0008, R2                      ; 5D52   037A 0008
        BGT     L_5D63                          ; 5D54   020E 000D

        MOVR    R3,     R1                      ; 5D56   0099
        ADDI    #$0004, R1                      ; 5D57   02F9 0004

        JSR     R5,     L_DB9E                  ; 5D59   0004 01D8 039E

        ADDI    #$0004, R1                      ; 5D5C   02F9 0004

        JSR     R5,     L_DBAE                  ; 5D5E   0004 01D8 03AE

        B       L_5BEF                          ; 5D61   0220 0173

L_5D63:
        MVII    #$0005, R0                      ; 5D63   02B8 0005

        JSR     R5,     L_5E1F                  ; 5D65   0004 015C 021F

        CLRC                                    ; 5D68   0006
        INCR    R6                              ; 5D69   000E
L_5D6A:
        MVII    #$0019, R0                      ; 5D6A   02B8 0019

        JSR     R5,     .EXEC.629               ; 5D6C   0004 0114 0229

        ADDI    #$0004, R2                      ; 5D6F   02FA 0004
        MVO@    R0,     R2                      ; 5D71   0250
        B       L_5BEF                          ; 5D72   0220 0184

        PSHR    R5                              ; 5D74   0275
L_5D75:
        PSHR    R3                              ; 5D75   0273
        ADDI    #$0004, R3                      ; 5D76   02FB 0004
        MVO@    R1,     R3                      ; 5D78   0259
        PULR    R3                              ; 5D79   02B3
        PULR    R7                              ; 5D7A   02B7

L_5D7B:
        PSHR    R5                              ; 5D7B   0275
        MOVR    R3,     R1                      ; 5D7C   0099
        PSHR    R3                              ; 5D7D   0273

        JSR     R5,     .EXEC.777               ; 5D7E   0004 0114 0377

        MVII    #$0357, R4                      ; 5D81   02BC 0357

        JSR     R5,     .EXEC.7A3               ; 5D83   0004 0114 03A3

        SWAP    R3,     1                       ; 5D86   0043
        ADDR    R3,     R4                      ; 5D87   00DC
        MOVR    R4,     R1                      ; 5D88   00A1
        PULR    R3                              ; 5D89   02B3
        PULR    R7                              ; 5D8A   02B7

L_5D8B:
        PSHR    R5                              ; 5D8B   0275

        JSR     R5,     .EXEC.777               ; 5D8C   0004 0114 0377

        ADDI    #$0002, R4                      ; 5D8F   02FC 0002
        ADDI    #$0002, R1                      ; 5D91   02F9 0002
        MVII    #$0003, R5                      ; 5D93   02BD 0003
        PSHR    R5                              ; 5D95   0275
        SDBD                                    ; 5D96   0001
        MVII    #$7FFF, R0                      ; 5D97   02B8 00FF 007F
        PSHR    R0                              ; 5D9A   0270
L_5D9B:
        CMPR    R1,     R4                      ; 5D9B   014C
        BNEQ    L_5DA3                          ; 5D9C   020C 0005

        ADDI    #$0008, R4                      ; 5D9E   02FC 0008
        DECR    R5                              ; 5DA0   0015
        BEQ     L_5DCD                          ; 5DA1   0204 002A

L_5DA3:
        MOVR    R5,     R0                      ; 5DA3   00A8
        MVII    #$01DE, R5                      ; 5DA4   02BD 01DE
        MVO@    R1,     R5                      ; 5DA6   0269
        MVO@    R2,     R5                      ; 5DA7   026A
        MVO@    R3,     R5                      ; 5DA8   026B
        NOP                                     ; 5DA9   0034
        MVO@    R4,     R5                      ; 5DAA   026C
        MVO@    R0,     R5                      ; 5DAB   0268

        JSR     R5,     .EXEC.7A3               ; 5DAC   0004 0114 03A3

        MOVR    R2,     R0                      ; 5DAF   0090
        MVII    #$01DE, R5                      ; 5DB0   02BD 01DE
        MVI@    R5,     R1                      ; 5DB2   02A9
        MVI@    R5,     R2                      ; 5DB3   02AA
        MVI@    R5,     R3                      ; 5DB4   02AB
        MVI@    R5,     R4                      ; 5DB5   02AC
        MVI     G_01E2, R5                      ; 5DB6   0285 01E2
        ADDI    #$0300, R1                      ; 5DB8   02F9 0300
        ADDI    #$0300, R4                      ; 5DBA   02FC 0300
        DIS                                     ; 5DBC   0003
        CMP@    R6,     R0                      ; 5DBD   0370
        BGE     L_5DC6                          ; 5DBE   020D 0006

        EIS                                     ; 5DC0   0002
        DECR    R6                              ; 5DC1   0016
        PSHR    R5                              ; 5DC2   0275
        PSHR    R0                              ; 5DC3   0270
        B       L_5DC8                          ; 5DC4   0200 0002

L_5DC6:
        INCR    R6                              ; 5DC6   000E
        EIS                                     ; 5DC7   0002
L_5DC8:
        ADDI    #$0008, R4                      ; 5DC8   02FC 0008
        DECR    R5                              ; 5DCA   0015
        BNEQ    L_5D9B                          ; 5DCB   022C 0031

L_5DCD:
        SUBI    #$0002, R1                      ; 5DCD   0339 0002
        SUBI    #$0002, R4                      ; 5DCF   033C 0002
        PULR    R0                              ; 5DD1   02B0
        PULR    R2                              ; 5DD2   02B2
        SLL     R2,     2                       ; 5DD3   004E
        SLL     R2,     1                       ; 5DD4   004A
        SUBR    R2,     R4                      ; 5DD5   0114
        PULR    R7                              ; 5DD6   02B7

        PSHR    R5                              ; 5DD7   0275
L_5DD8:
        MOVR    R1,     R2                      ; 5DD8   008A
        MVII    #$034D, R1                      ; 5DD9   02B9 034D

        JSR     R5,     L_6099                  ; 5DDB   0004 0160 0099

        MOVR    R0,     R3                      ; 5DDE   0083
        ANDI    #$0007, R0                      ; 5DDF   03B8 0007
        CMPI    #$0006, R0                      ; 5DE1   0378 0006
        BGE     L_5DE9                          ; 5DE3   020D 0004

        CMPI    #$0002, R0                      ; 5DE5   0378 0002
        BGT     L_5DF9                          ; 5DE7   020E 0010

L_5DE9:
        MVI@    R2,     R0                      ; 5DE9   0290
        SDBD                                    ; 5DEA   0001
        ANDI    #$FDFF, R0                      ; 5DEB   03B8 00FF 00FD
        CMPI    #$0005, R3                      ; 5DEE   037B 0005
        BLT     L_5DF9                          ; 5DF0   0205 0007

        CMPI    #$000B, R3                      ; 5DF2   037B 000B
        BGT     L_5DF9                          ; 5DF4   020E 0003

        XORI    #$0200, R0                      ; 5DF6   03F8 0200
        MVO@    R0,     R2                      ; 5DF8   0250
L_5DF9:
        MOVR    R2,     R1                      ; 5DF9   0091

        JSR     R5,     .EXEC.766               ; 5DFA   0004 0114 0366

        MOVR    R0,     R1                      ; 5DFD   0081
        MOVR    R1,     R2                      ; 5DFE   008A
        ADDI    #$01A9, R2                      ; 5DFF   02FA 01A9

        JSR     R5,     L_6D66                  ; 5E01   0004 016C 0166

        PULR    R7                              ; 5E04   02B7

L_5E05:
        PSHR    R5                              ; 5E05   0275
        MVII    #$031D, R4                      ; 5E06   02BC 031D
        CLRR    R3                              ; 5E08   01DB
        CMPI    #$0003, R1                      ; 5E09   0379 0003
        BLT     L_5E10                          ; 5E0B   0205 0003

L_5E0D:
        MVII    #$0335, R4                      ; 5E0D   02BC 0335
        INCR    R3                              ; 5E0F   000B
L_5E10:
        MOVR    R1,     R0                      ; 5E10   0088

        JSR     R5,     .EXEC.76C               ; 5E11   0004 0114 036C

        PULR    R7                              ; 5E14   02B7

L_5E15:
        PSHR    R5                              ; 5E15   0275
        MVII    #$031D, R4                      ; 5E16   02BC 031D
        CLRR    R3                              ; 5E18   01DB
        CMPI    #$0003, R1                      ; 5E19   0379 0003
        BGE     L_5E10                          ; 5E1B   022D 000C
        B       L_5E0D                          ; 5E1D   0220 0011

L_5E1F:
        PSHR    R5                              ; 5E1F   0275

        JSR     R5,     X_RAND2                 ; 5E20   0004 0114 029E

        PSHR    R0                              ; 5E23   0270

        JSR     R5,     L_5E05                  ; 5E24   0004 015C 0205

        MOVR    R0,     R4                      ; 5E27   0084
        MOVR    R3,     R0                      ; 5E28   0098

        JSR     R5,     L_DA3D                  ; 5E29   0004 01D8 023D

        PULR    R0                              ; 5E2C   02B0
        PULR    R5                              ; 5E2D   02B5
        BC      L_5E34                          ; 5E2E   0201 0004

        INCR    R5                              ; 5E30   000D
        ADD@    R5,     R0                      ; 5E31   02E8
        B       L_5E36                          ; 5E32   0200 0002

L_5E34:
        ADD@    R5,     R0                      ; 5E34   02E8
        INCR    R5                              ; 5E35   000D
L_5E36:
        MOVR    R1,     R2                      ; 5E36   008A
        MOVR    R0,     R1                      ; 5E37   0081
        MOVR    R4,     R0                      ; 5E38   00A0
        MOVR    R5,     R7                      ; 5E39   00AF

L_5E3A:
        PSHR    R5                              ; 5E3A   0275
        MVI     G_01BA, R0                      ; 5E3B   0280 01BA
        CMPI    #$0004, R0                      ; 5E3D   0378 0004
        BNEQ    L_5E5E                          ; 5E3F   020C 001D

        MVI     G_01B9, R1                      ; 5E41   0281 01B9
        CMPI    #$00FF, R1                      ; 5E43   0379 00FF
        BEQ     L_5E5E                          ; 5E45   0204 0017

        MOVR    R1,     R2                      ; 5E47   008A
        ADDI    #$01C6, R2                      ; 5E48   02FA 01C6
        MVI@    R2,     R0                      ; 5E4A   0290
        SWAP    R0,     1                       ; 5E4B   0040
        SLLC    R0,     1                       ; 5E4C   0058
        BC      L_5E5E                          ; 5E4D   0201 000F

        MVII    #$0003, R0                      ; 5E4F   02B8 0003

        JSR     R5,     L_5E1F                  ; 5E51   0004 015C 021F
        DECLE   $0007,  $000F                   ; 5E54   0007 000F

        MVII    #$000F, R0                      ; 5E56   02B8 000F

        JSR     R5,     .EXEC.629               ; 5E58   0004 0114 0229

        ADDI    #$0004, R2                      ; 5E5B   02FA 0004
        MVO@    R0,     R2                      ; 5E5D   0250
L_5E5E:
        PULR    R7                              ; 5E5E   02B7

L_5E5F:
        PSHR    R5                              ; 5E5F   0275
        MVI     G_01BA, R0                      ; 5E60   0280 01BA
        CMPI    #$0004, R0                      ; 5E62   0378 0004
        BNEQ    L_5E92                          ; 5E64   020C 002C

        MVI     G_01B9, R0                      ; 5E66   0280 01B9
        CMPI    #$00FF, R0                      ; 5E68   0378 00FF
        BEQ     L_5E93                          ; 5E6A   0204 0027

        MOVR    R0,     R1                      ; 5E6C   0081

        JSR     R5,     L_5E15                  ; 5E6D   0004 015C 0215

        MVII    #$034D, R1                      ; 5E70   02B9 034D

        JSR     R5,     L_5D8B                  ; 5E72   0004 015C 018B

        MOVR    R4,     R1                      ; 5E75   00A1

        JSR     R5,     .EXEC.766               ; 5E76   0004 0114 0366

        MOVR    R0,     R1                      ; 5E79   0081
        MOVR    R1,     R2                      ; 5E7A   008A
        ADDI    #$01A9, R2                      ; 5E7B   02FA 01A9
        MVI@    R2,     R0                      ; 5E7D   0290
        ANDI    #$0004, R0                      ; 5E7E   03B8 0004
        BNEQ    L_5E92                          ; 5E80   020C 0010

        SDBD                                    ; 5E82   0001
        ADDI    #$001D, R2                      ; 5E83   02FA 001D 0000
        MVI@    R2,     R0                      ; 5E86   0290
        SWAP    R0,     1                       ; 5E87   0040
        SLLC    R0,     2                       ; 5E88   005C
        BC      L_5E92                          ; 5E89   0201 0007

        MVO     R1,     G_01CD                  ; 5E8B   0241 01CD
        MVII    #$0007, R0                      ; 5E8D   02B8 0007

        JSR     R5,     L_5EAE                  ; 5E8F   0004 015C 02AE

L_5E92:
        PULR    R7                              ; 5E92   02B7

L_5E93:
        MVII    #$0007, R0                      ; 5E93   02B8 0007
        MVI     G_01AB, R2                      ; 5E95   0282 01AB
        ANDI    #$0004, R2                      ; 5E97   03BA 0004
        BNEQ    L_5EA2                          ; 5E99   020C 0007

        MVII    #$0002, R1                      ; 5E9B   02B9 0002

        JSR     R5,     L_5EAE                  ; 5E9D   0004 015C 02AE

        MVII    #$0007, R0                      ; 5EA0   02B8 0007
L_5EA2:
        MVI     G_01AE, R2                      ; 5EA2   0282 01AE
        ANDI    #$0004, R2                      ; 5EA4   03BA 0004
        BNEQ    L_5E92                          ; 5EA6   022C 0015

        MVII    #$0005, R1                      ; 5EA8   02B9 0005

        JSR     R5,     L_5EAE                  ; 5EAA   0004 015C 02AE

        PULR    R7                              ; 5EAD   02B7

L_5EAE:
        PSHR    R5                              ; 5EAE   0275
        PSHR    R1                              ; 5EAF   0271

        JSR     R5,     .EXEC.772               ; 5EB0   0004 0114 0372

        MVI     G_0351, R4                      ; 5EB3   0284 0351
        SDBD                                    ; 5EB5   0001
        ANDI    #$8000, R4                      ; 5EB6   03BC 0000 0080
        BNEQ    L_5EBD                          ; 5EB9   020C 0002
        B       L_5EBF                          ; 5EBB   0200 0002

L_5EBD:
        SUBI    #$0004, R2                      ; 5EBD   033A 0004
L_5EBF:
        SWAP    R2,     1                       ; 5EBF   0042
        SUBI    #$0004, R3                      ; 5EC0   033B 0004
        XORR    R3,     R2                      ; 5EC2   01DA
        MVII    #$001C, R3                      ; 5EC3   02BB 001C
        PULR    R0                              ; 5EC5   02B0

        JSR     R5,     .EXEC.9BB               ; 5EC6   0004 0118 01BB

        PULR    R7                              ; 5EC9   02B7

L_5ECA:
        PSHR    R5                              ; 5ECA   0275

L_5ECB:
        JSR     R5,     L_5E05                  ; 5ECB   0004 015C 0205

        PSHR    R0                              ; 5ECE   0270
        MOVR    R3,     R0                      ; 5ECF   0098

        JSR     R5,     L_DA3D                  ; 5ED0   0004 01D8 023D

        MVI     G_01A6, R2                      ; 5ED3   0282 01A6
        BC      L_5EE1                          ; 5ED5   0201 000A

        CMPI    #$002B, R2                      ; 5ED7   037A 002B
        BLE     L_5F39                          ; 5ED9   0206 005E

        SDBD                                    ; 5EDB   0001
        MVII    #$5F41, R3                      ; 5EDC   02BB 0041 005F
        B       L_5EE9                          ; 5EDF   0200 0008

L_5EE1:
        CMPI    #$0005, R2                      ; 5EE1   037A 0005
        BGT     L_5F39                          ; 5EE3   020E 0054

        SDBD                                    ; 5EE5   0001
        MVII    #$5F3C, R3                      ; 5EE6   02BB 003C 005F
L_5EE9:
        PSHR    R3                              ; 5EE9   0273

        JSR     R5,     L_DA41                  ; 5EEA   0004 01D8 0241

        DECR    R6                              ; 5EED   0016
        RLC     R0,     1                       ; 5EEE   0050
        PULR    R4                              ; 5EEF   02B4
        BC      L_5F0C                          ; 5EF0   0201 001A

        MVII    #$000A, R2                      ; 5EF2   02BA 000A
        MVII    #$0030, R3                      ; 5EF4   02BB 0030
        SDBD                                    ; 5EF6   0001
        CMPI    #$5F3C, R4                      ; 5EF7   037C 003C 005F
        BEQ     L_5EFE                          ; 5EFA   0204 0002

        MVII    #$003E, R2                      ; 5EFC   02BA 003E
L_5EFE:
        SUB     G_01A6, R2                      ; 5EFE   0302 01A6
        SLL     R2,     2                       ; 5F00   004E
        SLL     R2,     1                       ; 5F01   004A

        JSR     R5,     L_5F46                  ; 5F02   0004 015C 0346

        MOVR    R0,     R4                      ; 5F05   0084
        MVII    #$003C, R0                      ; 5F06   02B8 003C
        PULR    R3                              ; 5F08   02B3

        JSR     R5,     L_6C1E                  ; 5F09   0004 016C 001E

L_5F0C:
        MVI@    R4,     R2                      ; 5F0C   02A2
        SUB     G_01A6, R2                      ; 5F0D   0302 01A6
        SLL     R2,     2                       ; 5F0F   004E
        SLL     R2,     1                       ; 5F10   004A
        MVI@    R4,     R3                      ; 5F11   02A3

        JSR     R5,     L_5F46                  ; 5F12   0004 015C 0346

        PSHR    R0                              ; 5F15   0270
        PSHR    R0                              ; 5F16   0270
        MVI@    R4,     R2                      ; 5F17   02A2
        SUB     G_01A6, R2                      ; 5F18   0302 01A6
        SLL     R2,     2                       ; 5F1A   004E
        SLL     R2,     1                       ; 5F1B   004A
        MVI@    R4,     R3                      ; 5F1C   02A3

        JSR     R5,     L_5F46                  ; 5F1D   0004 015C 0346
        JSR     R5,     L_D75D                  ; 5F20   0004 01D4 035D

        INCR    R0                              ; 5F23   0008

        JSR     R5,     X_RAND2                 ; 5F24   0004 0114 029E

        MVI@    R4,     R3                      ; 5F27   02A3
        PULR    R4                              ; 5F28   02B4
        TSTR    R3                              ; 5F29   009B
        BNEQ    L_5F2F                          ; 5F2A   020C 0003

        SUBR    R0,     R4                      ; 5F2C   0104
        B       L_5F30                          ; 5F2D   0200 0001

L_5F2F:
        ADDR    R0,     R4                      ; 5F2F   00C4
L_5F30:
        PULR    R3                              ; 5F30   02B3
        MVII    #$003C, R0                      ; 5F31   02B8 003C

        JSR     R5,     L_6C27                  ; 5F33   0004 016C 0027

        SETC                                    ; 5F36   0007
        PULR    R7                              ; 5F37   02B7

        PULR    R3                              ; 5F38   02B3
L_5F39:
        PULR    R2                              ; 5F39   02B2
        CLRC                                    ; 5F3A   0006
        PULR    R7                              ; 5F3B   02B7

        DECLE   $0008,  $0026,  $0006,  $0034   ; 5F3C   0008 0026 0006 0034
        DECLE   $0001,  $0041,  $0026,  $0043   ; 5F40   0001 0041 0026 0043
        DECLE   $0034,  $0000                   ; 5F44   0034 0000
L_5F46:
        PSHR    R5                              ; 5F46   0275
        PSHR    R2                              ; 5F47   0272
        PSHR    R4                              ; 5F48   0274
        MVII    #$034F, R4                      ; 5F49   02BC 034F

        JSR     R5,     .EXEC.784               ; 5F4B   0004 0114 0384
        JSR     R5,     .EXEC.A2F               ; 5F4E   0004 0118 022F

        MOVR    R1,     R0                      ; 5F51   0088
        PULR    R4                              ; 5F52   02B4
        PULR    R2                              ; 5F53   02B2
        PULR    R7                              ; 5F54   02B7

L_5F55:
        PSHR    R5                              ; 5F55   0275
        MVI     G_01BA, R0                      ; 5F56   0280 01BA
        CMPI    #$0004, R0                      ; 5F58   0378 0004
        BNEQ    L_5F8E                          ; 5F5A   020C 0032

        CLRR    R4                              ; 5F5C   01E4
        MVII    #$01C6, R2                      ; 5F5D   02BA 01C6
        MVII    #$031F, R1                      ; 5F5F   02B9 031F
        CLRR    R5                              ; 5F61   01ED
        MVI     G_01A6, R0                      ; 5F62   0280 01A6
        MVI     G_016B, R3                      ; 5F64   0283 016B
        TSTR    R3                              ; 5F66   009B
        BEQ     L_5F8E                          ; 5F67   0204 0025
        BPL     L_5F8F                          ; 5F69   0203 0024

        CMPI    #$0028, R0                      ; 5F6B   0378 0028
        BGT     L_5F8E                          ; 5F6D   020E 001F

        SDBD                                    ; 5F6F   0001
        MVII    #$1A00, R0                      ; 5F70   02B8 0000 001A
L_5F73:
        CMP     G_01B9, R5                      ; 5F73   0345 01B9
        BEQ     L_5F86                          ; 5F75   0204 000F

        MVI@    R2,     R3                      ; 5F77   0293
        SWAP    R3,     1                       ; 5F78   0043
        SLLC    R3,     1                       ; 5F79   005B
        BC      L_5F86                          ; 5F7A   0201 000A

        CMP@    R1,     R0                      ; 5F7C   0348
        BNC     L_5F86                          ; 5F7D   0209 0007

        ADDI    #$0002, R1                      ; 5F7F   02F9 0002
        MVO@    R4,     R1                      ; 5F81   024C
        SDBD                                    ; 5F82   0001
        ADDI    #$FFFE, R1                      ; 5F83   02F9 00FE 00FF
L_5F86:
        ADDI    #$0008, R1                      ; 5F86   02F9 0008
        INCR    R2                              ; 5F88   000A
        INCR    R5                              ; 5F89   000D
        CMPI    #$0005, R5                      ; 5F8A   037D 0005
        BLE     L_5F73                          ; 5F8C   0226 001A
L_5F8E:
        PULR    R7                              ; 5F8E   02B7

L_5F8F:
        CMPI    #$000A, R0                      ; 5F8F   0378 000A
        BLT     L_5F8E                          ; 5F91   0225 0004

        SDBD                                    ; 5F93   0001
        MVII    #$8800, R0                      ; 5F94   02B8 0000 0088
L_5F97:
        CMP     G_01B9, R5                      ; 5F97   0345 01B9
        BEQ     L_5FAA                          ; 5F99   0204 000F

        MVI@    R2,     R3                      ; 5F9B   0293
        SWAP    R3,     1                       ; 5F9C   0043
        SLLC    R3,     1                       ; 5F9D   005B
        BC      L_5FAA                          ; 5F9E   0201 000A

        CMP@    R1,     R0                      ; 5FA0   0348
        BC      L_5FAA                          ; 5FA1   0201 0007

        ADDI    #$0002, R1                      ; 5FA3   02F9 0002
        MVO@    R4,     R1                      ; 5FA5   024C
        SDBD                                    ; 5FA6   0001
        ADDI    #$FFFE, R1                      ; 5FA7   02F9 00FE 00FF
L_5FAA:
        ADDI    #$0008, R1                      ; 5FAA   02F9 0008
        INCR    R2                              ; 5FAC   000A
        INCR    R5                              ; 5FAD   000D
        CMPI    #$0005, R5                      ; 5FAE   037D 0005
        BLE     L_5F97                          ; 5FB0   0226 001A
        PULR    R7                              ; 5FB2   02B7

L_5FB3:
        PSHR    R5                              ; 5FB3   0275
        PSHR    R1                              ; 5FB4   0271

        JSR     R5,     L_5E05                  ; 5FB5   0004 015C 0205

        CLRR    R4                              ; 5FB8   01E4
        MOVR    R3,     R0                      ; 5FB9   0098

        JSR     R5,     L_DA3D                  ; 5FBA   0004 01D8 023D

        PULR    R3                              ; 5FBD   02B3
        BC      L_5FC2                          ; 5FBE   0201 0002
        B       L_5FC4                          ; 5FC0   0200 0002

L_5FC2:
        MVII    #$0008, R4                      ; 5FC2   02BC 0008
L_5FC4:
        PSHR    R4                              ; 5FC4   0274
        PSHR    R3                              ; 5FC5   0273

        JSR     R5,     L_DA41                  ; 5FC6   0004 01D8 0241

        NEGR    R6                              ; 5FC9   0026
        SWAP    R2,     2                       ; 5FCA   0046
        PULR    R3                              ; 5FCB   02B3
        PULR    R4                              ; 5FCC   02B4
        BC      L_5FE8                          ; 5FCD   0201 0019

        ADDI    #$0003, R1                      ; 5FCF   02F9 0003
        SDBD                                    ; 5FD1   0001
        MVII    #$3200, R0                      ; 5FD2   02B8 0000 0032
        CMP@    R1,     R0                      ; 5FD5   0348
        BC      L_5FDF                          ; 5FD6   0201 0007

        TSTR    R4                              ; 5FD8   00A4
        BEQ     L_5FE2                          ; 5FD9   0204 0007

L_5FDB:
        SUBI    #$0002, R4                      ; 5FDB   033C 0002
        B       L_5FE6                          ; 5FDD   0200 0007

L_5FDF:
        TSTR    R4                              ; 5FDF   00A4
        BEQ     L_5FDB                          ; 5FE0   0224 0006

L_5FE2:
        ADDI    #$0002, R4                      ; 5FE2   02FC 0002
        ANDI    #$000F, R4                      ; 5FE4   03BC 000F
L_5FE6:
        SUBI    #$0003, R1                      ; 5FE6   0339 0003
L_5FE8:
        PULR    R7                              ; 5FE8   02B7

L_5FE9:
        PSHR    R5                              ; 5FE9   0275
        SUBI    #$0002, R1                      ; 5FEA   0339 0002
        SUBI    #$0003, R4                      ; 5FEC   033C 0003

        JSR     R5,     .EXEC.766               ; 5FEE   0004 0114 0366

        PSHR    R0                              ; 5FF1   0270
        MOVR    R1,     R2                      ; 5FF2   008A
        MOVR    R4,     R1                      ; 5FF3   00A1

        JSR     R5,     L_6099                  ; 5FF4   0004 0160 0099

        MOVR    R0,     R4                      ; 5FF7   0084
        PULR    R3                              ; 5FF8   02B3
        PULR    R7                              ; 5FF9   02B7

L_5FFA:
        PSHR    R5                              ; 5FFA   0275
        MVI     G_01C5, R0                      ; 5FFB   0280 01C5
        TSTR    R0                              ; 5FFD   0080
        BEQ     L_6055                          ; 5FFE   0204 0055

        MVI     G_0354, R0                      ; 6000   0280 0354
        SDBD                                    ; 6002   0001
        CMPI    #$0E00, R0                      ; 6003   0378 0000 000E
        BGT     L_6055                          ; 6006   020E 004D

        CMPI    #$0300, R0                      ; 6008   0378 0300
        BLT     L_6055                          ; 600A   0205 0049

        MVII    #$031D, R3                      ; 600C   02BB 031D
        CLRR    R4                              ; 600E   01E4
        MOVR    R4,     R5                      ; 600F   00A5
        ADDI    #$01C6, R4                      ; 6010   02FC 01C6
        ADDI    #$01A9, R5                      ; 6012   02FD 01A9
L_6014:
        MVI@    R4,     R0                      ; 6014   02A0
        MVI@    R5,     R1                      ; 6015   02A9
        SWAP    R0,     1                       ; 6016   0040
        SLLC    R0,     1                       ; 6017   0058
        BC      L_604F                          ; 6018   0201 0035

        ANDI    #$0004, R1                      ; 601A   03B9 0004
        BNEQ    L_604F                          ; 601C   020C 0031

        MVO     R5,     G_01DB                  ; 601E   0245 01DB
        PSHR    R3                              ; 6020   0273

        JSR     R5,     L_5D7B                  ; 6021   0004 015C 017B

        CMPI    #$000C, R2                      ; 6024   037A 000C
        BGT     L_6045                          ; 6026   020E 001D

        JSR     R5,     L_D69E                  ; 6028   0004 01D4 029E

        PULR    R1                              ; 602B   02B1
        PSHR    R1                              ; 602C   0271
        PSHR    R0                              ; 602D   0270

        JSR     R5,     L_D68E                  ; 602E   0004 01D4 028E
        JSR     R5,     L_D75D                  ; 6031   0004 01D4 035D

        CMPI    #$0003, R0                      ; 6034   0378 0003
        BGT     L_6045                          ; 6036   020E 000D

        PULR    R1                              ; 6038   02B1
        PSHR    R1                              ; 6039   0271

        JSR     R5,     .EXEC.766               ; 603A   0004 0114 0366

        MVI     G_01DB, R2                      ; 603D   0282 01DB
        ADDI    #$00FF, R2                      ; 603F   02FA 00FF
        MOVR    R0,     R1                      ; 6041   0081

        JSR     R5,     L_6D57                  ; 6042   0004 016C 0157

L_6045:
        PULR    R3                              ; 6045   02B3
        MVI     G_01DB, R5                      ; 6046   0285 01DB
        ADDI    #$0100, R5                      ; 6048   02FD 0100
        MOVR    R5,     R4                      ; 604A   00AC
        SDBD                                    ; 604B   0001
        ADDI    #$001D, R4                      ; 604C   02FC 001D 0000
L_604F:
        ADDI    #$0008, R3                      ; 604F   02FB 0008
        CMPI    #$0345, R3                      ; 6051   037B 0345
        BLE     L_6014                          ; 6053   0226 0040
L_6055:
        PULR    R7                              ; 6055   02B7

L_6056:
        PSHR    R5                              ; 6056   0275

L_6057:
        JSR     R5,     L_5E15                  ; 6057   0004 015C 0215
        JSR     R5,     L_5D8B                  ; 605A   0004 015C 018B

        CMPI    #$0010, R0                      ; 605D   0378 0010
        BPL     L_6098                          ; 605F   0203 0037

        MOVR    R4,     R3                      ; 6061   00A3
        MOVR    R1,     R4                      ; 6062   008C
        ADDI    #$0004, R4                      ; 6063   02FC 0004
        MVI@    R4,     R0                      ; 6065   02A0

        JSR     R5,     X_UNPK_BYTES            ; 6066   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 6069   0004 0118 022F

        PSHR    R1                              ; 606C   0271
        PSHR    R1                              ; 606D   0271
        SUBI    #$0005, R4                      ; 606E   033C 0005
        MOVR    R4,     R2                      ; 6070   00A2
        MOVR    R3,     R1                      ; 6071   0099

        JSR     R5,     L_6099                  ; 6072   0004 0160 0099
        JSR     R5,     L_D75D                  ; 6075   0004 01D4 035D

        CMPI    #$0003, R0                      ; 6078   0378 0003
        PULR    R3                              ; 607A   02B3
        BGE     L_6098                          ; 607B   020D 001B

        MVII    #$0001, R0                      ; 607D   02B8 0001

        JSR     R5,     X_RAND1                 ; 607F   0004 0114 027D

        MVII    #$0004, R5                      ; 6082   02BD 0004
        TSTR    R0                              ; 6084   0080
        BEQ     L_6088                          ; 6085   0204 0001

        NEGR    R5                              ; 6087   0025
L_6088:
        ADDR    R3,     R5                      ; 6088   00DD
        MOVR    R2,     R4                      ; 6089   0094
        MOVR    R2,     R1                      ; 608A   0091
        PSHR    R5                              ; 608B   0275

        JSR     R5,     .EXEC.766               ; 608C   0004 0114 0366

        PULR    R1                              ; 608F   02B1
        MVII    #$0019, R0                      ; 6090   02B8 0019

        JSR     R5,     .EXEC.629               ; 6092   0004 0114 0229

        ADDI    #$0004, R4                      ; 6095   02FC 0004
        MVO@    R0,     R4                      ; 6097   0260
L_6098:
        PULR    R7                              ; 6098   02B7

L_6099:
        PSHR    R5                              ; 6099   0275
        PSHR    R1                              ; 609A   0271
        PSHR    R2                              ; 609B   0272
        MOVR    R2,     R4                      ; 609C   0094

        JSR     R5,     .EXEC.777               ; 609D   0004 0114 0377

        ADDI    #$0002, R4                      ; 60A0   02FC 0002

        JSR     R5,     .EXEC.784               ; 60A2   0004 0114 0384
        JSR     R5,     .EXEC.A2F               ; 60A5   0004 0118 022F

        MOVR    R1,     R0                      ; 60A8   0088
        PULR    R2                              ; 60A9   02B2
        PULR    R1                              ; 60AA   02B1
        PULR    R7                              ; 60AB   02B7

L_60AC:
        PSHR    R5                              ; 60AC   0275
        SDBD                                    ; 60AD   0001
        MVII    #$622F, R4                      ; 60AE   02BC 002F 0062
L_60B1:
        CMP@    R4,     R3                      ; 60B1   0363
        BMI     L_60D5                          ; 60B2   020B 0021
        BEQ     L_60B8                          ; 60B4   0204 0002
        B       L_60B1                          ; 60B6   0220 0006

L_60B8:
        MVI     G_0175, R0                      ; 60B8   0280 0175
        MOVR    R0,     R5                      ; 60BA   0085
        SWAP    R0,     1                       ; 60BB   0040
        SLLC    R0,     2                       ; 60BC   005C
        BC      L_6143                          ; 60BD   0201 0084
        BOV     L_6125                          ; 60BF   0202 0064
        BMI     L_6107                          ; 60C1   020B 0044
        BNEQ    L_60E9                          ; 60C3   020C 0024

        CMPI    #$000A, R3                      ; 60C5   037B 000A
        BMI     L_6176                          ; 60C7   020B 00AD

        XORI    #$0010, R5                      ; 60C9   03FD 0010
        SDBD                                    ; 60CB   0001
        MVII    #$629A, R4                      ; 60CC   02BC 009A 0062
        SDBD                                    ; 60CF   0001
        MVII    #$3900, R0                      ; 60D0   02B8 0000 0039
        B       L_6151                          ; 60D3   0200 007C

L_60D5:
        MVI     G_0175, R0                      ; 60D5   0280 0175
        CMPI    #$0025, R3                      ; 60D7   037B 0025
        BGT     L_60E1                          ; 60D9   020E 0006

        CMPI    #$0070, R0                      ; 60DB   0378 0070
L_60DD:
        BNEQ    L_6176                          ; 60DD   020C 0097
        B       L_60B8                          ; 60DF   0220 0028

L_60E1:
        CMPI    #$002B, R3                      ; 60E1   037B 002B
        BGT     L_6176                          ; 60E3   020E 0091

        CMPI    #$00F0, R0                      ; 60E5   0378 00F0
        B       L_60DD                          ; 60E7   0220 000B

L_60E9:
        CMPI    #$000A, R3                      ; 60E9   037B 000A
        BEQ     L_6176                          ; 60EB   0204 0089
        BMI     L_60FB                          ; 60ED   020B 000C

        XORI    #$0020, R5                      ; 60EF   03FD 0020
        SDBD                                    ; 60F1   0001
        MVII    #$62DB, R4                      ; 60F2   02BC 00DB 0062
        SDBD                                    ; 60F5   0001
        MVII    #$3940, R0                      ; 60F6   02B8 0040 0039
        B       L_6151                          ; 60F9   0200 0056

L_60FB:
        XORI    #$0010, R5                      ; 60FB   03FD 0010
        SDBD                                    ; 60FD   0001
        MVII    #$6238, R4                      ; 60FE   02BC 0038 0062
        SDBD                                    ; 6101   0001
        MVII    #$3900, R0                      ; 6102   02B8 0000 0039
        B       L_6151                          ; 6105   0200 004A

L_6107:
        CMPI    #$000C, R3                      ; 6107   037B 000C
        BEQ     L_6176                          ; 6109   0204 006B
        BMI     L_6119                          ; 610B   020B 000C

        XORI    #$0040, R5                      ; 610D   03FD 0040
        SDBD                                    ; 610F   0001
        MVII    #$631C, R4                      ; 6110   02BC 001C 0063
        SDBD                                    ; 6113   0001
        MVII    #$3900, R0                      ; 6114   02B8 0000 0039
        B       L_6151                          ; 6117   0200 0038

L_6119:
        XORI    #$0020, R5                      ; 6119   03FD 0020
        SDBD                                    ; 611B   0001
        MVII    #$6269, R4                      ; 611C   02BC 0069 0062
        SDBD                                    ; 611F   0001
        MVII    #$3940, R0                      ; 6120   02B8 0040 0039
        B       L_6151                          ; 6123   0200 002C

L_6125:
        CMPI    #$0026, R3                      ; 6125   037B 0026
        BEQ     L_6176                          ; 6127   0204 004D
        BMI     L_6137                          ; 6129   020B 000C

        XORI    #$0080, R5                      ; 612B   03FD 0080
        SDBD                                    ; 612D   0001
        MVII    #$634D, R4                      ; 612E   02BC 004D 0063
        SDBD                                    ; 6131   0001
        MVII    #$3940, R0                      ; 6132   02B8 0040 0039
        B       L_6151                          ; 6135   0200 001A

L_6137:
        XORI    #$0040, R5                      ; 6137   03FD 0040
        SDBD                                    ; 6139   0001
        MVII    #$629A, R4                      ; 613A   02BC 009A 0062
        SDBD                                    ; 613D   0001
        MVII    #$3900, R0                      ; 613E   02B8 0000 0039
        B       L_6151                          ; 6141   0200 000E

L_6143:
        CMPI    #$002C, R3                      ; 6143   037B 002C
        BEQ     L_6176                          ; 6145   0204 002F

        XORI    #$0080, R5                      ; 6147   03FD 0080
        SDBD                                    ; 6149   0001
        MVII    #$62DB, R4                      ; 614A   02BC 00DB 0062
        SDBD                                    ; 614D   0001
        MVII    #$3940, R0                      ; 614E   02B8 0040 0039
L_6151:
        MVO     R0,     G_0179                  ; 6151   0240 0179
        SWAP    R0,     1                       ; 6153   0040
        MVO     R0,     G_017A                  ; 6154   0240 017A
        MOVR    R4,     R0                      ; 6156   00A0
        MVO     R0,     G_0177                  ; 6157   0240 0177
        SWAP    R0,     1                       ; 6159   0040
        MVO     R0,     G_0178                  ; 615A   0240 0178
        PSHR    R1                              ; 615C   0271
        SDBD                                    ; 615D   0001
        MVII    #$61DF, R1                      ; 615E   02B9 00DF 0061
        PSHR    R2                              ; 6161   0272
        DIS                                     ; 6162   0003
        MVO     R1,     .ISRVEC.0               ; 6163   0241 0100
        SWAP    R1,     1                       ; 6165   0041
        MVO     R1,     .ISRVEC.1               ; 6166   0241 0101
        MVII    #$0001, R1                      ; 6168   02B9 0001
        MVO     R1,     G_017D                  ; 616A   0241 017D
        MVO     R5,     G_0175                  ; 616C   0245 0175
        EIS                                     ; 616E   0002
L_616F:
        MVI     G_017D, R1                      ; 616F   0281 017D
        TSTR    R1                              ; 6171   0089
        BNEQ    L_616F                          ; 6172   022C 0004

        PULR    R2                              ; 6174   02B2
        PULR    R1                              ; 6175   02B1
L_6176:
        PSHR    R2                              ; 6176   0272
        SLL     R2,     1                       ; 6177   004A
        SDBD                                    ; 6178   0001
        ADDI    #$D10A, R2                      ; 6179   02FA 000A 00D1
        MOVR    R2,     R5                      ; 617C   0095
        MVII    #$0200, R2                      ; 617D   02BA 0200
        ADDR    R1,     R2                      ; 617F   00CA
        PSHR    R2                              ; 6180   0272
        SDBD                                    ; 6181   0001
        MVI@    R5,     R1                      ; 6182   02A9
        MOVR    R1,     R5                      ; 6183   008D
        SDBD                                    ; 6184   0001
        MVII    #$6215, R4                      ; 6185   02BC 0015 0062
        MOVR    R2,     R3                      ; 6188   0093
L_6189:
        SDBD                                    ; 6189   0001
        MVI@    R4,     R1                      ; 618A   02A1
        TSTR    R1                              ; 618B   0089
        BEQ     L_6193                          ; 618C   0204 0005

        MVO@    R1,     R3                      ; 618E   0259
        ADDI    #$0014, R3                      ; 618F   02FB 0014
        B       L_6189                          ; 6191   0220 0009

L_6193:
        TSTR    R5                              ; 6193   00AD
        BEQ     L_61A1                          ; 6194   0204 000B

L_6196:
        MVI@    R5,     R1                      ; 6196   02A9
        CMPI    #$00FF, R1                      ; 6197   0379 00FF
        BEQ     L_61A1                          ; 6199   0204 0006

        SDBD                                    ; 619B   0001
        MVI@    R5,     R0                      ; 619C   02A8
        ADDR    R1,     R2                      ; 619D   00CA
        MVO@    R0,     R2                      ; 619E   0250
        B       L_6196                          ; 619F   0220 000A

L_61A1:
        PULR    R3                              ; 61A1   02B3
        PULR    R2                              ; 61A2   02B2
        SDBD                                    ; 61A3   0001
        MVII    #$3687, R0                      ; 61A4   02B8 0087 0036
        CMPI    #$001F, R2                      ; 61A7   037A 001F
        BNEQ    L_61B7                          ; 61A9   020C 000C

        MVI     G_01B7, R1                      ; 61AB   0281 01B7

        JSR     R5,     L_6211                  ; 61AD   0004 0160 0211

        SDBD                                    ; 61B0   0001
        ANDI    #$1487, R0                      ; 61B1   03B8 0087 0014
        TSTR    R1                              ; 61B4   0089
        BNEQ    L_61D5                          ; 61B5   020C 001E

L_61B7:
        CMPI    #$0020, R2                      ; 61B7   037A 0020
        BNEQ    L_61C3                          ; 61B9   020C 0008

        MVI     G_01B7, R1                      ; 61BB   0281 01B7
        SDBD                                    ; 61BD   0001
        ANDI    #$1487, R0                      ; 61BE   03B8 0087 0014
        B       L_61D5                          ; 61C1   0200 0012

L_61C3:
        CMPI    #$002A, R2                      ; 61C3   037A 002A
        BNEQ    L_61CF                          ; 61C5   020C 0008

        MVI     G_01B8, R1                      ; 61C7   0281 01B8

        JSR     R5,     L_6211                  ; 61C9   0004 0160 0211

        TSTR    R1                              ; 61CC   0089
        BNEQ    L_61D5                          ; 61CD   020C 0006

L_61CF:
        CMPI    #$002B, R2                      ; 61CF   037A 002B
        BNEQ    L_61DB                          ; 61D1   020C 0008

        MVI     G_01B8, R1                      ; 61D3   0281 01B8
L_61D5:
        ANDI    #$000F, R1                      ; 61D5   03B9 000F
        SLL     R1,     2                       ; 61D7   004D
        SLL     R1,     1                       ; 61D8   0049
        ADDR    R1,     R0                      ; 61D9   00C8
        MVO@    R0,     R3                      ; 61DA   0258

L_61DB:
        JSR     R5,     L_6724                  ; 61DB   0004 0164 0324

        PULR    R7                              ; 61DE   02B7

        PSHR    R5                              ; 61DF   0275
        DIS                                     ; 61E0   0003
        MVII    #$0177, R5                      ; 61E1   02BD 0177
        SDBD                                    ; 61E3   0001
        MVI@    R5,     R0                      ; 61E4   02A8
        MOVR    R0,     R4                      ; 61E5   0084
        SDBD                                    ; 61E6   0001
        MVI@    R5,     R0                      ; 61E7   02A8
        MOVR    R0,     R5                      ; 61E8   0085
L_61E9:
        MVI@    R4,     R0                      ; 61E9   02A0
        CMPI    #$00D3, R0                      ; 61EA   0378 00D3
        BEQ     L_61F1                          ; 61EC   0204 0003

        MVO@    R0,     R5                      ; 61EE   0268
        B       L_61E9                          ; 61EF   0220 0007

L_61F1:
        MVI     G_017B, R1                      ; 61F1   0281 017B
        MVO     R1,     .ISRVEC.0               ; 61F3   0241 0100
        MVI     G_017C, R1                      ; 61F5   0281 017C
        MVO     R1,     .ISRVEC.1               ; 61F7   0241 0101
        MVO     R1,     .STIC.VIDEN             ; 61F9   0241 0020
        CLRR    R1                              ; 61FB   01C9
        MVO     R1,     G_017D                  ; 61FC   0241 017D
        PULR    R5                              ; 61FE   02B5
        SDBD                                    ; 61FF   0001
        MVII    #$0100, R4                      ; 6200   02BC 0000 0001
        EIS                                     ; 6203   0002
        SDBD                                    ; 6204   0001
        MVI@    R4,     R7                      ; 6205   02A7

L_6206:
        PSHR    R5                              ; 6206   0275
        MOVR    R0,     R5                      ; 6207   0085
L_6208:
        MVI@    R4,     R0                      ; 6208   02A0
        CMPI    #$00D3, R0                      ; 6209   0378 00D3
        BEQ     L_6210                          ; 620B   0204 0003

        MVO@    R0,     R5                      ; 620D   0268
        B       L_6208                          ; 620E   0220 0007
L_6210:
        PULR    R7                              ; 6210   02B7

L_6211:
        PSHR    R5                              ; 6211   0275
        SLR     R1,     2                       ; 6212   0065
        SLR     R1,     2                       ; 6213   0065
        PULR    R7                              ; 6214   02B7

        DECLE   $0000,  $0006,  $0007,  $0028   ; 6215   0000 0006 0007 0028
        DECLE   $0000,  $0022,  $0000,  $0022   ; 6219   0000 0022 0000 0022
        DECLE   $0000,  $0022,  $0000,  $0022   ; 621D   0000 0022 0000 0022
        DECLE   $0000,  $0022,  $0000,  $0022   ; 6221   0000 0022 0000 0022
        DECLE   $0000,  $0022,  $0000,  $0022   ; 6225   0000 0022 0000 0022
        DECLE   $0007,  $002A,  $0003,  $0028   ; 6229   0007 002A 0003 0028
        DECLE   $0000,  $0000,  $0009,  $000A   ; 622D   0000 0000 0009 000A
        DECLE   $000B,  $000C,  $0025,  $0026   ; 6231   000B 000C 0025 0026
        DECLE   $002B,  $002C,  $0047,  $0000   ; 6235   002B 002C 0047 0000
        DECLE   $0000,  $0001,  $0002,  $0005   ; 6239   0000 0001 0002 0005
        DECLE   $000A,  $0015,  $001A,  $0055   ; 623D   000A 0015 001A 0055
        DECLE   $00AB,  $0055,  $00AB,  $0055   ; 6241   00AB 0055 00AB 0055
        DECLE   $00AB,  $0055,  $00AB,  $0000   ; 6245   00AB 0055 00AB 0000
        DECLE   $0000,  $0000,  $0001           ; 6249   0000 0000 0001

        EIS                                     ; 624C   0002
        INCR    R7                              ; 624D   000F

        DECR    R5                              ; 624E   0015
L_624F:
        ADCR    R3                              ; 624F   002B
        DECLE   $0028,  $0050,  $00A0,  $0040   ; 6250   0028 0050 00A0 0040
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6254   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6258   0000 0000 0000 0001
        DECLE   $0002,  $0005,  $000A,  $0014   ; 625C   0002 0005 000A 0014
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6260   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6264   0000 0000

        INCR    R7                              ; 6266   000F

        DECR    R5                              ; 6267   0015
L_6268:
        ADDR    R2,     R3                      ; 6268   00D3
        DECLE   $0029,  $0053,  $00A5,  $004B   ; 6269   0029 0053 00A5 004B
        DECLE   $0095,  $002B,  $0055,  $00AB   ; 626D   0095 002B 0055 00AB
        DECLE   $0000,  $0000,  $0080,  $00E0   ; 6271   0000 0000 0080 00E0
        DECLE   $0080,  $0080,  $0080,  $00FF   ; 6275   0080 0080 0080 00FF
        DECLE   $0004,  $0018,  $00E0,  $0000   ; 6279   0004 0018 00E0 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 627D   0000 0000 0000 00FF
        DECLE   $0000,  $0000,  $0000,  $00F8   ; 6281   0000 0000 0000 00F8
        DECLE   $0010,  $0020,  $0040,  $0080   ; 6285   0010 0020 0040 0080
        DECLE   $0001,  $0002,  $0004           ; 6289   0001 0002 0004

        INCR    R7                              ; 628C   000F

        DECR    R0                              ; 628D   0010
L_628E:
        NEGR    R0                              ; 628E   0020
        DECLE   $0040,  $0080,  $0000,  $0000   ; 628F   0040 0080 0000 0000
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6293   0000 00FF 0000 0000
        DECLE   $0000,  $0000,  $00D3,  $007F   ; 6297   0000 0000 00D3 007F
        DECLE   $0080,  $0000,  $0000,  $0000   ; 629B   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 629F   0000 0000 0000 0000
        DECLE   $000F,  $00F0,  $0000,  $0000   ; 62A3   000F 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62A7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $000C   ; 62AB   0000 0000 0003 000C
        DECLE   $0030,  $0040,  $0080,  $0001   ; 62AF   0030 0040 0080 0001
        DECLE   $0002,  $0002,  $0002,  $0002   ; 62B3   0002 0002 0002 0002
        DECLE   $0002,  $0001,  $0000,  $0000   ; 62B7   0002 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62BB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; 62BF   0000 0000 0080 0040
        DECLE   $0030,  $000C,  $0003,  $0000   ; 62C3   0030 000C 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00F0   ; 62CB   0000 0000 0000 00F0
        DECLE   $000F,  $0000,  $0000,  $0000   ; 62CF   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D3   0000 0000 0000 0000
        DECLE   $00C0,  $003F,  $0000,  $00D3   ; 62D7   00C0 003F 0000 00D3
        DECLE   $00FE,  $0001,  $0000,  $0000   ; 62DB   00FE 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62DF   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $000F,  $0000   ; 62E3   0000 00F0 000F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 62EB   0000 0000 0000 00C0
        DECLE   $0030,  $000C,  $0002,  $0001   ; 62EF   0030 000C 0002 0001
        DECLE   $0080,  $0040,  $0040,  $0040   ; 62F3   0080 0040 0040 0040
        DECLE   $0040,  $0040,  $0080,  $0000   ; 62F7   0040 0040 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 62FF   0000 0000 0000 0001
        DECLE   $0002,  $000C,  $0030,  $00C0   ; 6303   0002 000C 0030 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6307   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 630B   0000 0000 0000 0000
        DECLE   $000F,  $00F0,  $0000,  $0000   ; 630F   000F 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6313   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $00FC,  $0000   ; 6317   0000 0003 00FC 0000
        DECLE   $00D3,  $0094,  $00CA,  $00A5   ; 631B   00D3 0094 00CA 00A5
        DECLE   $00D2,  $00A9,  $00D4,  $00AA   ; 631F   00D2 00A9 00D4 00AA
        DECLE   $00D5,  $0000,  $0000,  $0001   ; 6323   00D5 0000 0000 0001
        DECLE   $0007,  $000D,  $0001,  $0001   ; 6327   0007 000D 0001 0001
        DECLE   $00FF,  $0020,  $0018,  $0007   ; 632B   00FF 0020 0018 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 632F   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6333   00FF 0000 0000 0000
        DECLE   $001F,  $0008,  $0004,  $0002   ; 6337   001F 0008 0004 0002
        DECLE   $0001,  $0080,  $0040,  $0020   ; 633B   0001 0080 0040 0020
        DECLE   $00F0,  $0008,  $0004,  $0002   ; 633F   00F0 0008 0004 0002
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6343   0001 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6347   00FF 0000 0000 0000
        DECLE   $0000,  $00D3,  $0000,  $0000   ; 634B   0000 00D3 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 634F   0000 0000 0000 0000
        DECLE   $00F0,  $00A8,  $0000,  $0000   ; 6353   00F0 00A8 0000 0000
        DECLE   $0000,  $0080,  $0040,  $00A0   ; 6357   0000 0080 0040 00A0
        DECLE   $0050,  $0028,  $0014,  $000A   ; 635B   0050 0028 0014 000A
        DECLE   $0005,  $0002,  $0001,  $0000   ; 635F   0005 0002 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6363   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0040,  $00F0   ; 6367   0000 0080 0040 00F0
        DECLE   $00A8,  $00D4,  $00AA,  $00D5   ; 636B   00A8 00D4 00AA 00D5
        DECLE   $00AA,  $00D5,  $00AA,  $00D5   ; 636F   00AA 00D5 00AA 00D5
        DECLE   $00AA,  $00D5,  $0000,  $0000   ; 6373   00AA 00D5 0000 0000

        TSTR    R0                              ; 6377   0080
        SWAP    R0,     1                       ; 6378   0040
        MOVR    R4,     R0                      ; 6379   00A0
        RLC     R0,     1                       ; 637A   0050
        MOVR    R5,     R0                      ; 637B   00A8
        SLLC    R0,     1                       ; 637C   0058
        ADDR    R2,     R3                      ; 637D   00D3
L_637E:
        PSHR    R5                              ; 637E   0275
        MVI     G_01BA, R0                      ; 637F   0280 01BA
        TSTR    R0                              ; 6381   0080
        BEQ     L_639D                          ; 6382   0204 0019

        ANDI    #$0040, R0                      ; 6384   03B8 0040
        BNEQ    L_6392                          ; 6386   020C 000A

        MVI     G_01A6, R0                      ; 6388   0280 01A6
        CMPI    #$0007, R0                      ; 638A   0378 0007
        BLT     L_639A                          ; 638C   0205 000C

        CMPI    #$002D, R0                      ; 638E   0378 002D
        BGE     L_639A                          ; 6390   020D 0008

L_6392:
        MVI     G_017E, R0                      ; 6392   0280 017E
        CMPI    #$00FF, R0                      ; 6394   0378 00FF
        BEQ     L_639D                          ; 6396   0204 0005
        B       L_6532                          ; 6398   0200 0198

L_639A:
        JSR     R5,     L_6475                  ; 639A   0004 0164 0075

L_639D:
        PULR    R7                              ; 639D   02B7

L_639E:
        PSHR    R5                              ; 639E   0275
        SDBD                                    ; 639F   0001
        MVII    #$034F, R4                      ; 63A0   02BC 004F 0003
        MVI@    R4,     R0                      ; 63A3   02A0
        MVI@    R4,     R1                      ; 63A4   02A1
        SWAP    R0,     1                       ; 63A5   0040
        ANDI    #$00FF, R0                      ; 63A6   03B8 00FF
        SWAP    R1,     1                       ; 63A8   0041
        ANDI    #$00FF, R1                      ; 63A9   03B9 00FF
        MVI     G_017E, R4                      ; 63AB   0284 017E
        ADDI    #$0300, R4                      ; 63AD   02FC 0300
        PSHR    R4                              ; 63AF   0274
        MVI@    R4,     R2                      ; 63B0   02A2
        MVI@    R4,     R3                      ; 63B1   02A3
        SWAP    R2,     1                       ; 63B2   0042
        ANDI    #$00FF, R2                      ; 63B3   03BA 00FF
        SWAP    R3,     1                       ; 63B5   0043
        ANDI    #$00FF, R3                      ; 63B6   03BB 00FF
        MOVR    R1,     R5                      ; 63B8   008D
        SUBR    R2,     R0                      ; 63B9   0110
        SUBR    R3,     R1                      ; 63BA   0119
        CLRR    R2                              ; 63BB   01D2
        ADDR    R0,     R2                      ; 63BC   00C2
        BPL     L_63C0                          ; 63BD   0203 0001

        NEGR    R2                              ; 63BF   0022
L_63C0:
        CLRR    R4                              ; 63C0   01E4
        ADDR    R1,     R4                      ; 63C1   00CC
        BPL     L_63C5                          ; 63C2   0203 0001

        NEGR    R4                              ; 63C4   0024
L_63C5:
        ADDR    R4,     R2                      ; 63C5   00E2
        MVI     G_01B9, R4                      ; 63C6   0284 01B9
        CMPI    #$00FF, R4                      ; 63C8   037C 00FF
        BNEQ    L_63D0                          ; 63CA   020C 0004

        CMPI    #$0012, R2                      ; 63CC   037A 0012
        BLT     L_63DD                          ; 63CE   0205 000D

L_63D0:
        JSR     R5,     .EXEC.A2F               ; 63D0   0004 0118 022F

        MVII    #$0006, R0                      ; 63D3   02B8 0006

        JSR     R5,     .EXEC.629               ; 63D5   0004 0114 0229

        PULR    R4                              ; 63D8   02B4
        ADDI    #$0002, R4                      ; 63D9   02FC 0002
        MVO@    R0,     R4                      ; 63DB   0260
        PULR    R7                              ; 63DC   02B7

L_63DD:
        PULR    R0                              ; 63DD   02B0
        MVII    #$0005, R2                      ; 63DE   02BA 0005
        CMPR    R5,     R3                      ; 63E0   016B
        BLT     L_63E4                          ; 63E1   0205 0001

        CLRR    R2                              ; 63E3   01D2
L_63E4:
        J       L_DCF3                          ; 63E4   0004 03DC 00F3

L_63E7:
        PSHR    R5                              ; 63E7   0275
        MVII    #$0009, R3                      ; 63E8   02BB 0009
        MVI     G_01A6, R4                      ; 63EA   0284 01A6
        CMPI    #$001A, R4                      ; 63EC   037C 001A
        BLT     L_63F2                          ; 63EE   0205 0002

        MVII    #$003F, R3                      ; 63F0   02BB 003F
L_63F2:
        SUBR    R4,     R3                      ; 63F2   0123
        SLL     R3,     2                       ; 63F3   004F
        SLL     R3,     1                       ; 63F4   004B
        MVII    #$0028, R4                      ; 63F5   02BC 0028
        PULR    R7                              ; 63F7   02B7

L_63F8:
        PSHR    R5                              ; 63F8   0275
        MVII    #$0008, R3                      ; 63F9   02BB 0008
        MVI     G_01A6, R2                      ; 63FB   0282 01A6
        CMPI    #$001A, R2                      ; 63FD   037A 001A
        BLT     L_6403                          ; 63FF   0205 0002

        MVII    #$003E, R3                      ; 6401   02BB 003E
L_6403:
        SUBR    R2,     R3                      ; 6403   0113
        ADDI    #$0250, R3                      ; 6404   02FB 0250
        MVO@    R1,     R3                      ; 6406   0259
        PULR    R7                              ; 6407   02B7

L_6408:
        PSHR    R5                              ; 6408   0275
        MVI     G_017E, R5                      ; 6409   0285 017E
        ADDI    #$02FE, R5                      ; 640B   02FD 02FE
        MVI@    R5,     R2                      ; 640D   02AA
        SDBD                                    ; 640E   0001
        ANDI    #$FFE8, R2                      ; 640F   03BA 00E8 00FF
        XORI    #$0006, R2                      ; 6412   03FA 0006
        SDBD                                    ; 6414   0001
        CMPI    #$0335, R5                      ; 6415   037D 0035 0003
        BLT     L_641C                          ; 6418   0205 0002

        XORI    #$0011, R2                      ; 641A   03FA 0011
L_641C:
        DECR    R5                              ; 641C   0015
        MVO@    R2,     R5                      ; 641D   026A
        SDBD                                    ; 641E   0001
        MVII    #$5821, R3                      ; 641F   02BB 0021 0058
        MVO@    R3,     R5                      ; 6422   026B
        MVII    #$0180, R1                      ; 6423   02B9 0180
L_6425:
        MOVR    R1,     R2                      ; 6425   008A
        ADDI    #$0004, R2                      ; 6426   02FA 0004
        MVI@    R2,     R3                      ; 6428   0293
        TSTR    R3                              ; 6429   009B
        BEQ     L_6430                          ; 642A   0204 0004

        ADDI    #$0004, R1                      ; 642C   02F9 0004
        B       L_6425                          ; 642E   0220 000A

L_6430:
        CLRR    R3                              ; 6430   01DB
        MVI@    R1,     R0                      ; 6431   0288
        MVO@    R3,     R1                      ; 6432   024B
        INCR    R1                              ; 6433   0009
        MVI@    R1,     R3                      ; 6434   028B
        INCR    R1                              ; 6435   0009
        MVI@    R1,     R2                      ; 6436   028A
        SWAP    R2,     1                       ; 6437   0042
        INCR    R1                              ; 6438   0009
        XOR@    R1,     R2                      ; 6439   03CA
        ANDI    #$007F, R0                      ; 643A   03B8 007F
        SUB     G_01A6, R0                      ; 643C   0300 01A6
        PSHR    R0                              ; 643E   0270
        SWAP    R0,     1                       ; 643F   0040
        SLL     R0,     2                       ; 6440   004C
        NOP                                     ; 6441   0034
        SLL     R0,     1                       ; 6442   0048
        MVO@    R0,     R5                      ; 6443   0268
        PSHR    R3                              ; 6444   0273
        SWAP    R3,     1                       ; 6445   0043
        NOP                                     ; 6446   0034
        SLL     R3,     2                       ; 6447   004F
        SLL     R3,     1                       ; 6448   004B
        MVO@    R3,     R5                      ; 6449   026B
        PULR    R3                              ; 644A   02B3
        PULR    R0                              ; 644B   02B0
        INCR    R5                              ; 644C   000D
        TSTR    R0                              ; 644D   0080
        BMI     L_645F                          ; 644E   020B 000F

        CMPI    #$0014, R0                      ; 6450   0378 0014
        BGT     L_645F                          ; 6452   020E 000B

        DECR    R5                              ; 6454   0015
        SLL     R3,     2                       ; 6455   004F
        MOVR    R3,     R1                      ; 6456   0099
        SLL     R3,     2                       ; 6457   004F
        ADDR    R1,     R3                      ; 6458   00CB
        ADDR    R0,     R3                      ; 6459   00C3
        ADDI    #$0200, R3                      ; 645A   02FB 0200
        MVO@    R2,     R3                      ; 645C   025A
        CLRR    R2                              ; 645D   01D2
        MVO@    R2,     R5                      ; 645E   026A
L_645F:
        SUBI    #$0005, R5                      ; 645F   033D 0005
        MOVR    R5,     R1                      ; 6461   00A9

        JSR     R5,     .EXEC.766               ; 6462   0004 0114 0366

        MOVR    R0,     R1                      ; 6465   0081
        SDBD                                    ; 6466   0001
        ADDI    #$01C6, R1                      ; 6467   02F9 00C6 0001
        MVI@    R1,     R2                      ; 646A   028A
        ANDI    #$007F, R2                      ; 646B   03BA 007F
        MVO@    R2,     R1                      ; 646D   024A
        SDBD                                    ; 646E   0001
        ADDI    #$FFE3, R1                      ; 646F   02F9 00E3 00FF
        CLRR    R0                              ; 6472   01C0
        MVO@    R0,     R1                      ; 6473   0248
L_6474:
        PULR    R7                              ; 6474   02B7

L_6475:
        PSHR    R5                              ; 6475   0275
        MVI     G_017E, R1                      ; 6476   0281 017E
        SDBD                                    ; 6478   0001
        SUBI    #$001F, R1                      ; 6479   0339 001F 0000
        SLR     R1,     2                       ; 647C   0065
        SLR     R1,     1                       ; 647D   0061
        MVI     G_01BD, R0                      ; 647E   0280 01BD
        ANDI    #$0002, R0                      ; 6480   03B8 0002
        BEQ     L_649E                          ; 6482   0204 001A

        CMP     G_01B9, R1                      ; 6484   0341 01B9
        BEQ     L_6491                          ; 6486   0204 0009

        MVI     G_017E, R1                      ; 6488   0281 017E
        ADDI    #$0303, R1                      ; 648A   02F9 0303
        MVI@    R1,     R0                      ; 648C   0288
        ANDI    #$000C, R0                      ; 648D   03B8 000C
        BNEQ    L_6474                          ; 648F   022C 001C

L_6491:
        SDBD                                    ; 6491   0001
        MVII    #$669A, R0                      ; 6492   02B8 009A 0066
        SUBI    #$0004, R1                      ; 6495   0339 0004
        MVO@    R0,     R1                      ; 6497   0248
        MVI     G_01BD, R0                      ; 6498   0280 01BD
        ANDI    #$00FD, R0                      ; 649A   03B8 00FD
        MVO     R0,     G_01BD                  ; 649C   0240 01BD
L_649E:
        DECR    R1                              ; 649E   0011
        CMP     G_01B9, R1                      ; 649F   0341 01B9
        BEQ     L_64BE                          ; 64A1   0204 001B

        DECR    R1                              ; 64A3   0011
        CMP     G_01B9, R1                      ; 64A4   0341 01B9
        BEQ     L_64BE                          ; 64A6   0204 0016

        SDBD                                    ; 64A8   0001
        MVII    #$0351, R1                      ; 64A9   02B9 0051 0003
        MVI@    R1,     R0                      ; 64AC   0288
        TSTR    R0                              ; 64AD   0080
        BEQ     L_64BE                          ; 64AE   0204 000E

        MVI     G_01A6, R1                      ; 64B0   0281 01A6
        CMPI    #$001A, R1                      ; 64B2   0379 001A
        BLT     L_64BB                          ; 64B4   0205 0005

        TSTR    R0                              ; 64B6   0080
        BLT     L_64BE                          ; 64B7   0205 0005
        B       L_653A                          ; 64B9   0200 007F

L_64BB:
        TSTR    R0                              ; 64BB   0080
        BLT     L_653A                          ; 64BC   0205 007C

L_64BE:
        MVI     G_017E, R2                      ; 64BE   0282 017E
        CMPI    #$00FF, R2                      ; 64C0   037A 00FF
        BNEQ    L_64C5                          ; 64C2   020C 0001
        PULR    R7                              ; 64C4   02B7

L_64C5:
        ADDI    #$0300, R2                      ; 64C5   02FA 0300
        MVI     G_01BA, R0                      ; 64C7   0280 01BA
        SDBD                                    ; 64C9   0001
        ANDI    #$00B9, R0                      ; 64CA   03B8 00B9 0000
        BNEQ    L_64DB                          ; 64CD   020C 000C

        MVI@    R2,     R3                      ; 64CF   0293
        SUB     G_034F, R3                      ; 64D0   0303 034F
        BPL     L_64D5                          ; 64D2   0203 0001

        NEGR    R3                              ; 64D4   0023
L_64D5:
        SDBD                                    ; 64D5   0001
        CMPI    #$0400, R3                      ; 64D6   037B 0000 0004
        BLT     L_654A                          ; 64D9   0205 006F

L_64DB:
        JSR     R5,     L_63E7                  ; 64DB   0004 0160 03E7

        MVI@    R2,     R0                      ; 64DE   0290
        SWAP    R0,     1                       ; 64DF   0040
        ANDI    #$00FF, R0                      ; 64E0   03B8 00FF
        SUBR    R3,     R0                      ; 64E2   0118
        INCR    R2                              ; 64E3   000A
        MVI@    R2,     R1                      ; 64E4   0291
        SWAP    R1,     1                       ; 64E5   0041
        ANDI    #$00FF, R1                      ; 64E6   03B9 00FF
        SUBR    R4,     R1                      ; 64E8   0121
        PSHR    R0                              ; 64E9   0270
        PSHR    R1                              ; 64EA   0271
        SLR     R0,     1                       ; 64EB   0060
        SLR     R1,     1                       ; 64EC   0061
        ADDR    R0,     R1                      ; 64ED   00C1
        BEQ     L_6501                          ; 64EE   0204 0011

        PULR    R1                              ; 64F0   02B1
        PULR    R0                              ; 64F1   02B0
        NEGR    R0                              ; 64F2   0020
        NEGR    R1                              ; 64F3   0021
        PSHR    R2                              ; 64F4   0272

        JSR     R5,     .EXEC.A2F               ; 64F5   0004 0118 022F

        MVII    #$0014, R0                      ; 64F8   02B8 0014

        JSR     R5,     .EXEC.629               ; 64FA   0004 0114 0229

        PULR    R2                              ; 64FD   02B2
        INCR    R2                              ; 64FE   000A
        MVO@    R0,     R2                      ; 64FF   0250
        PULR    R7                              ; 6500   02B7

L_6501:
        PULR    R1                              ; 6501   02B1
        PULR    R0                              ; 6502   02B0

        JSR     R5,     L_6690                  ; 6503   0004 0164 0290

        CMP     G_017E, R3                      ; 6506   0343 017E
        BNEQ    L_652B                          ; 6508   020C 0021

        MVI     G_01BD, R0                      ; 650A   0280 01BD
        SDBD                                    ; 650C   0001
        ANDI    #$FFF7, R0                      ; 650D   03B8 00F7 00FF
        CMP     G_01BD, R0                      ; 6510   0340 01BD
        BNEQ    L_6523                          ; 6512   020C 000F

        XORI    #$0008, R0                      ; 6514   03F8 0008
        MVO     R0,     G_01BD                  ; 6516   0240 01BD
        MVII    #$0002, R0                      ; 6518   02B8 0002
        MVO     R0,     G_01BB                  ; 651A   0240 01BB
        MVII    #$0080, R0                      ; 651C   02B8 0080
        MVO     R0,     G_01D1                  ; 651E   0240 01D1
        J       L_6BE1                          ; 6520   0004 0368 03E1

L_6523:
        ADDI    #$0003, R2                      ; 6523   02FA 0003
        MVI@    R2,     R1                      ; 6525   0291
        TSTR    R1                              ; 6526   0089
        BNEQ    L_6539                          ; 6527   020C 0010

        MVO     R0,     G_01BD                  ; 6529   0240 01BD
L_652B:
        SDBD                                    ; 652B   0001
        MVII    #$0AD5, R1                      ; 652C   02B9 00D5 000A

        JSR     R5,     L_63F8                  ; 652F   0004 0160 03F8
L_6532:
        JSR     R5,     L_6408                  ; 6532   0004 0164 0008

        MVII    #$00FF, R0                      ; 6535   02B8 00FF
        MVO     R0,     G_017E                  ; 6537   0240 017E
L_6539:
        PULR    R7                              ; 6539   02B7

L_653A:
        MVI     G_017E, R2                      ; 653A   0282 017E
        CMPI    #$00FF, R2                      ; 653C   037A 00FF
        BEQ     L_654E                          ; 653E   0204 000E

        JSR     R5,     L_6690                  ; 6540   0004 0164 0290

        CMPR    R3,     R2                      ; 6543   015A
        BNEQ    L_654A                          ; 6544   020C 0004

        ADDI    #$0300, R2                      ; 6546   02FA 0300
        B       L_64DB                          ; 6548   0220 006E

L_654A:
        JSR     R5,     L_639E                  ; 654A   0004 0160 039E

        PULR    R7                              ; 654D   02B7

L_654E:
        MVI     G_01BA, R0                      ; 654E   0280 01BA
        SDBD                                    ; 6550   0001
        ANDI    #$0021, R0                      ; 6551   03B8 0021 0000
        BNEQ    L_65DE                          ; 6554   020C 0088

        CLRR    R1                              ; 6556   01C9
        MVI     G_01B6, R2                      ; 6557   0282 01B6
        SARC    R2,     1                       ; 6559   007A
        BNC     L_655D                          ; 655A   0209 0001

        COMR    R1                              ; 655C   0019
L_655D:
        MVI     G_01A6, R2                      ; 655D   0282 01A6
        CMPI    #$001A, R2                      ; 655F   037A 001A
        BLT     L_6564                          ; 6561   0205 0001

        COMR    R1                              ; 6563   0019
L_6564:
        MVII    #$0002, R0                      ; 6564   02B8 0002
        MVO     R0,     G_017F                  ; 6566   0240 017F

        JSR     R5,     L_65DF                  ; 6568   0004 0164 01DF

        MVI     G_0315, R1                      ; 656B   0281 0315
        TSTR    R1                              ; 656D   0089
        BEQ     L_65DE                          ; 656E   0204 006E

        MVII    #$0180, R1                      ; 6570   02B9 0180
L_6572:
        MVI@    R1,     R4                      ; 6572   028C
        TSTR    R4                              ; 6573   00A4
        BEQ     L_657A                          ; 6574   0204 0004

        ADDI    #$0004, R1                      ; 6576   02F9 0004
        B       L_6572                          ; 6578   0220 0007

L_657A:
        ADD     G_01A6, R2                      ; 657A   02C2 01A6
        MVO@    R2,     R1                      ; 657C   024A
        INCR    R1                              ; 657D   0009
        MVO@    R3,     R1                      ; 657E   024B
        INCR    R1                              ; 657F   0009
        MVI     G_0315, R2                      ; 6580   0282 0315
        SWAP    R2,     1                       ; 6582   0042
        MVO@    R2,     R1                      ; 6583   024A
        SWAP    R2,     1                       ; 6584   0042
        INCR    R1                              ; 6585   0009
        MVO@    R2,     R1                      ; 6586   024A
        MVO     R0,     G_017E                  ; 6587   0240 017E
        SDBD                                    ; 6589   0001
        MVII    #$2200, R1                      ; 658A   02B9 0000 0022

        JSR     R5,     L_63F8                  ; 658D   0004 0160 03F8

        MOVR    R0,     R5                      ; 6590   0085
        DECR    R5                              ; 6591   0015
        DECR    R5                              ; 6592   0015
        MVI@    R5,     R1                      ; 6593   02A9
        SDBD                                    ; 6594   0001
        ANDI    #$FDFF, R1                      ; 6595   03B9 00FF 00FD
        SDBD                                    ; 6598   0001
        ANDI    #$FFE8, R1                      ; 6599   03B9 00E8 00FF
        XORI    #$0001, R1                      ; 659C   03F9 0001
        MVI     G_01A6, R2                      ; 659E   0282 01A6
        CMPI    #$001A, R2                      ; 65A0   037A 001A
        BLT     L_65A6                          ; 65A2   0205 0002

        XORI    #$0200, R1                      ; 65A4   03F9 0200
L_65A6:
        DECR    R5                              ; 65A6   0015
        MVO@    R1,     R5                      ; 65A7   0269
        SDBD                                    ; 65A8   0001
        MVII    #$669A, R1                      ; 65A9   02B9 009A 0066
        MVO@    R1,     R5                      ; 65AC   0269
        SUBI    #$024F, R3                      ; 65AD   033B 024F
        SLL     R3,     2                       ; 65AF   004F
        SLL     R3,     1                       ; 65B0   004B
        SWAP    R3,     1                       ; 65B1   0043
        MVO@    R3,     R5                      ; 65B2   026B
        SDBD                                    ; 65B3   0001
        MVII    #$2800, R3                      ; 65B4   02BB 0000 0028
        MVO@    R3,     R5                      ; 65B7   026B
        INCR    R5                              ; 65B8   000D
        MVI@    R5,     R3                      ; 65B9   02AB
        SDBD                                    ; 65BA   0001
        ANDI    #$FFF0, R3                      ; 65BB   03BB 00F0 00FF
        DECR    R5                              ; 65BE   0015
        MVO@    R3,     R5                      ; 65BF   026B
        CLRR    R3                              ; 65C0   01DB
        MVO@    R3,     R5                      ; 65C1   026B
        SUBI    #$0007, R5                      ; 65C2   033D 0007
        MOVR    R5,     R1                      ; 65C4   00A9

        JSR     R5,     .EXEC.766               ; 65C5   0004 0114 0366

        MOVR    R0,     R1                      ; 65C8   0081
        SDBD                                    ; 65C9   0001
        ADDI    #$01C6, R1                      ; 65CA   02F9 00C6 0001
        MVI@    R1,     R2                      ; 65CD   028A
        ANDI    #$007F, R2                      ; 65CE   03BA 007F
        XORI    #$0080, R2                      ; 65D0   03FA 0080
        MVO@    R2,     R1                      ; 65D2   024A
        MOVR    R0,     R1                      ; 65D3   0081
        ADDI    #$01A9, R1                      ; 65D4   02F9 01A9
        MVI@    R1,     R0                      ; 65D6   0288
        SDBD                                    ; 65D7   0001
        ANDI    #$FFFB, R0                      ; 65D8   03B8 00FB 00FF
        XORI    #$0004, R0                      ; 65DB   03F8 0004
        MVO@    R0,     R1                      ; 65DD   0248
L_65DE:
        PULR    R7                              ; 65DE   02B7

L_65DF:
        PSHR    R5                              ; 65DF   0275
        CLRR    R5                              ; 65E0   01ED
        MVO     R5,     G_0315                  ; 65E1   0245 0315
        SDBD                                    ; 65E3   0001
        MVII    #$032F, R4                      ; 65E4   02BC 002F 0003
        TSTR    R1                              ; 65E7   0089
        BEQ     L_65F0                          ; 65E8   0204 0006

        MVII    #$0003, R1                      ; 65EA   02B9 0003
        SDBD                                    ; 65EC   0001
        MVII    #$0347, R4                      ; 65ED   02BC 0047 0003
L_65F0:
        ADDI    #$0002, R1                      ; 65F0   02F9 0002
        CMP     G_01B9, R1                      ; 65F2   0341 01B9
        BEQ     L_6608                          ; 65F4   0204 0012

        MVI     G_017E, R2                      ; 65F6   0282 017E
        ADDI    #$0300, R2                      ; 65F8   02FA 0300
        CMPR    R2,     R4                      ; 65FA   0154
        BEQ     L_6608                          ; 65FB   0204 000B

        ADDI    #$01A9, R1                      ; 65FD   02F9 01A9
        CLRR    R3                              ; 65FF   01DB
        MVO@    R3,     R1                      ; 6600   024B
        ADDI    #$0004, R4                      ; 6601   02FC 0004
        MVO@    R3,     R4                      ; 6603   0263
        SUBI    #$0005, R4                      ; 6604   033C 0005
        MVO     R4,     G_0315                  ; 6606   0244 0315
L_6608:
        MVI     G_0315, R4                      ; 6608   0284 0315
        TSTR    R4                              ; 660A   00A4
        BEQ     L_667B                          ; 660B   0204 006E

        SUBI    #$01A9, R1                      ; 660D   0339 01A9
        MVII    #$0001, R0                      ; 660F   02B8 0001
L_6611:
        DECR    R1                              ; 6611   0011
        BMI     L_6617                          ; 6612   020B 0003

        SLL     R0,     1                       ; 6614   0048
        B       L_6611                          ; 6615   0220 0005

L_6617:
        COMR    R1                              ; 6617   0019
        MOVR    R1,     R0                      ; 6618   0088
        MVII    #$010D, R1                      ; 6619   02B9 010D
        AND@    R1,     R0                      ; 661B   0388
        MVO@    R0,     R1                      ; 661C   0248
        MVI@    R4,     R2                      ; 661D   02A2
        MVI@    R4,     R3                      ; 661E   02A3
        SLR     R2,     2                       ; 661F   0066
        SLR     R2,     1                       ; 6620   0062
        SWAP    R2,     1                       ; 6621   0042
        ANDI    #$00FF, R2                      ; 6622   03BA 00FF
        SLR     R3,     2                       ; 6624   0067
        SLR     R3,     1                       ; 6625   0063
        SWAP    R3,     1                       ; 6626   0043
        ANDI    #$00FF, R3                      ; 6627   03BB 00FF
        DECR    R3                              ; 6629   0013
        CMPI    #$0002, R3                      ; 662A   037B 0002
        BGT     L_662F                          ; 662C   020E 0001

        INCR    R3                              ; 662E   000B
L_662F:
        TSTR    R2                              ; 662F   0092
        BPL     L_6633                          ; 6630   0203 0001

        INCR    R2                              ; 6632   000A
L_6633:
        CMPI    #$0014, R2                      ; 6633   037A 0014
        BMI     L_6638                          ; 6635   020B 0001

        DECR    R2                              ; 6637   0012
L_6638:
        PSHR    R2                              ; 6638   0272
        PSHR    R3                              ; 6639   0273
        SLL     R3,     2                       ; 663A   004F
        MOVR    R3,     R4                      ; 663B   009C
        SLL     R3,     2                       ; 663C   004F
        ADDR    R4,     R3                      ; 663D   00E3
        ADDR    R2,     R3                      ; 663E   00D3
        ADDI    #$0200, R3                      ; 663F   02FB 0200
        MVI@    R3,     R4                      ; 6641   029C
        CLRR    R1                              ; 6642   01C9
        SDBD                                    ; 6643   0001
        ANDI    #$2C00, R4                      ; 6644   03BC 0000 002C
        SDBD                                    ; 6647   0001
        CMPI    #$2C00, R4                      ; 6648   037C 0000 002C
        BNEQ    L_6658                          ; 664B   020C 000B

        DECR    R2                              ; 664D   0012
        BMI     L_6656                          ; 664E   020B 0006
        BEQ     L_6656                          ; 6650   0204 0004

        DECR    R1                              ; 6652   0011
        DECR    R3                              ; 6653   0013
        B       L_6658                          ; 6654   0200 0002

L_6656:
        INCR    R1                              ; 6656   0009
        INCR    R3                              ; 6657   000B
L_6658:
        MVI@    R3,     R4                      ; 6658   029C
        MVI     G_0315, R5                      ; 6659   0285 0315
        MVO     R4,     G_0315                  ; 665B   0244 0315
        SDBD                                    ; 665D   0001
        MVII    #$3ED5, R4                      ; 665E   02BC 00D5 003E
        PSHR    R5                              ; 6661   0275
        MVII    #$0003, R0                      ; 6662   02B8 0003

        JSR     R5,     X_RAND2                 ; 6664   0004 0114 029E

        SLL     R0,     2                       ; 6667   004C
        SLL     R0,     1                       ; 6668   0048
        ADDR    R0,     R4                      ; 6669   00C4
        PULR    R5                              ; 666A   02B5
        SDBD                                    ; 666B   0001
        CMPI    #$0335, R5                      ; 666C   037D 0035 0003
        BGE     L_6675                          ; 666F   020D 0004

        SDBD                                    ; 6671   0001
        ANDI    #$2DFF, R4                      ; 6672   03BC 00FF 002D
L_6675:
        MVO@    R4,     R3                      ; 6675   025C
        PULR    R3                              ; 6676   02B3
        PULR    R2                              ; 6677   02B2
        ADDR    R1,     R2                      ; 6678   00CA
        MOVR    R5,     R1                      ; 6679   00A9
        MOVR    R5,     R0                      ; 667A   00A8
L_667B:
        PULR    R7                              ; 667B   02B7

        PSHR    R5                              ; 667C   0275
        MVI     G_01BA, R5                      ; 667D   0285 01BA
        CMPI    #$0004, R5                      ; 667F   037D 0004
        BNEQ    L_668F                          ; 6681   020C 000C

        MVI     G_01B2, R1                      ; 6683   0281 01B2
        CMPR    R0,     R1                      ; 6685   0141
        BEQ     L_668F                          ; 6686   0204 0007

        MVO     R0,     G_01B2                  ; 6688   0240 01B2
        MVI     G_0351, R1                      ; 668A   0281 0351

        JSR     R5,     L_DBAE                  ; 668C   0004 01D8 03AE

L_668F:
        PULR    R7                              ; 668F   02B7

L_6690:
        PSHR    R5                              ; 6690   0275
        MVI     G_01B9, R3                      ; 6691   0283 01B9
        SLL     R3,     2                       ; 6693   004F
        SLL     R3,     1                       ; 6694   004B
        SDBD                                    ; 6695   0001
        ADDI    #$001F, R3                      ; 6696   02FB 001F 0000
        PULR    R7                              ; 6699   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 669A   0000 0000 0000 0000
        DECLE   $0005,  $0036                   ; 669E   0005 0036

        EIS                                     ; 66A0   0002
        CMPI    #$0066, R4                      ; 66A1   037C 0066
L_66A3:
        PSHR    R5                              ; 66A3   0275
        MVI     G_017F, R1                      ; 66A4   0281 017F
        TSTR    R1                              ; 66A6   0089
        BNEQ    L_671B                          ; 66A7   020C 0072

        MVII    #$0005, R1                      ; 66A9   02B9 0005
        MVO     R1,     G_017F                  ; 66AB   0241 017F
        MVI     G_01BA, R1                      ; 66AD   0281 01BA
        CMPI    #$0004, R1                      ; 66AF   0379 0004
        BNEQ    L_671B                          ; 66B1   020C 0068

        MVII    #$0180, R1                      ; 66B3   02B9 0180
        MVI     G_034F, R3                      ; 66B5   0283 034F
        SDBD                                    ; 66B7   0001
        ANDI    #$FF00, R3                      ; 66B8   03BB 0000 00FF
        SWAP    R3,     1                       ; 66BB   0043
        SLR     R3,     2                       ; 66BC   0067
        SLR     R3,     1                       ; 66BD   0063
        ADD     G_01A6, R3                      ; 66BE   02C3 01A6
L_66C0:
        MOVR    R3,     R4                      ; 66C0   009C
        MVI@    R1,     R2                      ; 66C1   028A
        ANDI    #$007F, R2                      ; 66C2   03BA 007F
        SUBR    R2,     R4                      ; 66C4   0114
        BPL     L_66C8                          ; 66C5   0203 0001

        COMR    R4                              ; 66C7   001C
L_66C8:
        CMPR    R4,     R3                      ; 66C8   0163
        BEQ     L_671B                          ; 66C9   0204 0050

        CMPI    #$0002, R4                      ; 66CB   037C 0002
        BLT     L_66D3                          ; 66CD   0205 0004

        ADDI    #$0004, R1                      ; 66CF   02F9 0004
        B       L_66C0                          ; 66D1   0220 0012

L_66D3:
        PSHR    R1                              ; 66D3   0271
        MVI@    R1,     R3                      ; 66D4   028B
        CLRR    R1                              ; 66D5   01C9
        ANDI    #$0080, R3                      ; 66D6   03BB 0080
        BEQ     L_66DB                          ; 66D8   0204 0001

        COMR    R1                              ; 66DA   0019

L_66DB:
        JSR     R5,     L_65DF                  ; 66DB   0004 0164 01DF

        MVI     G_0315, R4                      ; 66DE   0284 0315
        TSTR    R4                              ; 66E0   00A4
        BEQ     L_6721                          ; 66E1   0204 003E

        MOVR    R0,     R5                      ; 66E3   0085
        ADD     G_01A6, R2                      ; 66E4   02C2 01A6
        MOVR    R2,     R4                      ; 66E6   0094
        PULR    R1                              ; 66E7   02B1
        CMPI    #$0335, R5                      ; 66E8   037D 0335
        BLT     L_66EE                          ; 66EA   0205 0002

        XORI    #$0080, R4                      ; 66EC   03FC 0080
L_66EE:
        MVI@    R1,     R2                      ; 66EE   028A
        MVO@    R4,     R1                      ; 66EF   024C
        INCR    R1                              ; 66F0   0009
        MVI@    R1,     R0                      ; 66F1   0288
        MVO@    R3,     R1                      ; 66F2   024B
        ANDI    #$007F, R2                      ; 66F3   03BA 007F
        PSHR    R0                              ; 66F5   0270
        PSHR    R2                              ; 66F6   0272
        SLL     R0,     2                       ; 66F7   004C
        MOVR    R0,     R3                      ; 66F8   0083
        SLL     R0,     2                       ; 66F9   004C
        ADDR    R0,     R3                      ; 66FA   00C3
        ADDR    R3,     R2                      ; 66FB   00DA
        SUB     G_01A6, R2                      ; 66FC   0302 01A6
        ADDI    #$0200, R2                      ; 66FE   02FA 0200
        INCR    R1                              ; 6700   0009
        MVI@    R1,     R0                      ; 6701   0288
        MVI     G_0315, R3                      ; 6702   0283 0315
        SWAP    R3,     1                       ; 6704   0043
        MVO@    R3,     R1                      ; 6705   024B
        SWAP    R3,     1                       ; 6706   0043
        INCR    R1                              ; 6707   0009
        SWAP    R0,     1                       ; 6708   0040
        XOR@    R1,     R0                      ; 6709   03C8
        MVO@    R0,     R2                      ; 670A   0250
        MVO@    R3,     R1                      ; 670B   024B
        PULR    R0                              ; 670C   02B0
        PULR    R2                              ; 670D   02B2
        SLL     R2,     2                       ; 670E   004E
        SLL     R2,     1                       ; 670F   004A
        ADDI    #$0008, R2                      ; 6710   02FA 0008
        SUB     G_01A6, R0                      ; 6712   0300 01A6
        INCR    R0                              ; 6714   0008
        SLL     R0,     2                       ; 6715   004C
        SLL     R0,     1                       ; 6716   0048
        SWAP    R0,     1                       ; 6717   0040
        SWAP    R2,     1                       ; 6718   0042
        MVO@    R0,     R5                      ; 6719   0268
        MVO@    R2,     R5                      ; 671A   026A
L_671B:
        MVI     G_017F, R3                      ; 671B   0283 017F
        DECR    R3                              ; 671D   0013
        MVO     R3,     G_017F                  ; 671E   0243 017F
        PULR    R7                              ; 6720   02B7

L_6721:
        PULR    R1                              ; 6721   02B1
        B       L_671B                          ; 6722   0220 0008

L_6724:
        PSHR    R5                              ; 6724   0275
        MVII    #$0180, R1                      ; 6725   02B9 0180
L_6727:
        MVI@    R1,     R0                      ; 6727   0288
        ANDI    #$007F, R0                      ; 6728   03B8 007F
        BEQ     L_6754                          ; 672A   0204 0028

        CMPR    R2,     R0                      ; 672C   0150
        BEQ     L_6733                          ; 672D   0204 0004

L_672F:
        ADDI    #$0004, R1                      ; 672F   02F9 0004
        B       L_6727                          ; 6731   0220 000B

L_6733:
        INCR    R1                              ; 6733   0009
        MVI@    R1,     R0                      ; 6734   0288
        SLL     R0,     2                       ; 6735   004C
        MOVR    R0,     R4                      ; 6736   0084
        SLL     R0,     2                       ; 6737   004C
        ADDR    R0,     R4                      ; 6738   00C4
        ADDR    R3,     R4                      ; 6739   00DC
        PSHR    R5                              ; 673A   0275
        MVII    #$0003, R0                      ; 673B   02B8 0003

        JSR     R5,     X_RAND2                 ; 673D   0004 0114 029E

        SLL     R0,     2                       ; 6740   004C
        SLL     R0,     1                       ; 6741   0048
        SDBD                                    ; 6742   0001
        ADDI    #$3ED5, R0                      ; 6743   02F8 00D5 003E
        PULR    R5                              ; 6746   02B5
        DECR    R1                              ; 6747   0011
        MVI@    R1,     R5                      ; 6748   028D
        ANDI    #$0080, R5                      ; 6749   03BD 0080
        BNEQ    L_6751                          ; 674B   020C 0004

        SDBD                                    ; 674D   0001
        ANDI    #$2DFF, R0                      ; 674E   03B8 00FF 002D
L_6751:
        MVO@    R0,     R4                      ; 6751   0260
        B       L_672F                          ; 6752   0220 0024
L_6754:
        PULR    R7                              ; 6754   02B7

L_6755:
        PSHR    R5                              ; 6755   0275
        MVII    #$031D, R5                      ; 6756   02BD 031D
        CLRR    R0                              ; 6758   01C0
        MVII    #$017C, R4                      ; 6759   02BC 017C
L_675B:
        ADDI    #$0004, R4                      ; 675B   02FC 0004
L_675D:
        MVI@    R4,     R1                      ; 675D   02A1
        TSTR    R1                              ; 675E   0089
        BEQ     L_67A9                          ; 675F   0204 0048

        DECR    R4                              ; 6761   0014
        ANDI    #$007F, R1                      ; 6762   03B9 007F
        CMPI    #$002D, R1                      ; 6764   0379 002D
        BPL     L_675B                          ; 6766   0223 000C

        CMPI    #$0019, R1                      ; 6768   0379 0019
        BMI     L_675B                          ; 676A   022B 0010

        MVI@    R4,     R1                      ; 676C   02A1
        MVI@    R4,     R2                      ; 676D   02A2
        PSHR    R2                              ; 676E   0272
        SUB     G_01A6, R1                      ; 676F   0301 01A6
        PSHR    R1                              ; 6771   0271
        ANDI    #$007F, R1                      ; 6772   03B9 007F
        SLL     R2,     2                       ; 6774   004E
        MOVR    R2,     R3                      ; 6775   0093
        SLL     R2,     2                       ; 6776   004E
        ADDR    R3,     R2                      ; 6777   00DA
        ADDR    R1,     R2                      ; 6778   00CA
        ADDI    #$0200, R2                      ; 6779   02FA 0200
        MVI@    R4,     R3                      ; 677B   02A3
        SWAP    R3,     1                       ; 677C   0043
        XOR@    R4,     R3                      ; 677D   03E3
        MVO@    R3,     R2                      ; 677E   0253
        INCR    R0                              ; 677F   0008
        PULR    R1                              ; 6780   02B1
        SDBD                                    ; 6781   0001
        MVII    #$5846, R2                      ; 6782   02BA 0046 0058
        CMPI    #$0080, R1                      ; 6785   0379 0080
        BMI     L_678F                          ; 6787   020B 0006

        ANDI    #$007F, R1                      ; 6789   03B9 007F
        SDBD                                    ; 678B   0001
        MVII    #$5857, R2                      ; 678C   02BA 0057 0058
L_678F:
        MVO@    R2,     R5                      ; 678F   026A
        SDBD                                    ; 6790   0001
        MVII    #$5821, R2                      ; 6791   02BA 0021 0058
        MVO@    R2,     R5                      ; 6794   026A
        INCR    R1                              ; 6795   0009
        SLL     R1,     2                       ; 6796   004D
        SLL     R1,     1                       ; 6797   0049
        SWAP    R1,     1                       ; 6798   0041
        MVO@    R1,     R5                      ; 6799   0269
        PULR    R1                              ; 679A   02B1
        INCR    R1                              ; 679B   0009
        SLL     R1,     2                       ; 679C   004D
        SLL     R1,     1                       ; 679D   0049
        SWAP    R1,     1                       ; 679E   0041
        MVO@    R1,     R5                      ; 679F   0269
        CLRR    R1                              ; 67A0   01C9
        MVO@    R1,     R5                      ; 67A1   0269
        MVII    #$03F0, R1                      ; 67A2   02B9 03F0
        MVO@    R1,     R5                      ; 67A4   0269
        ADDI    #$0002, R5                      ; 67A5   02FD 0002
        B       L_675D                          ; 67A7   0220 004B

L_67A9:
        TSTR    R0                              ; 67A9   0080
        BEQ     L_67AF                          ; 67AA   0204 0003
        J       L_57A5                          ; 67AC   0004 0354 03A5

L_67AF:
        CLRC                                    ; 67AF   0006
        PULR    R7                              ; 67B0   02B7

        DECLE   $0040,  $00A0,  $0040,  $00A0   ; 67B1   0040 00A0 0040 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; 67B5   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $00E0   ; 67B9   0000 0000 0040 00E0
        DECLE   $00E0,  $0040,  $0000,  $0000   ; 67BD   00E0 0040 0000 0000
        DECLE   $000C,  $000C,  $0000,  $001E   ; 67C1   000C 000C 0000 001E
        DECLE   $002D,  $001D,  $000C,  $0000   ; 67C5   002D 001D 000C 0000
        DECLE   $000C,  $000A,  $000A,  $000A   ; 67C9   000C 000A 000A 000A
        DECLE   $000A,  $0012,  $0010,  $001B   ; 67CD   000A 0012 0010 001B
        DECLE   $0018,  $0018,  $0000,  $007C   ; 67D1   0018 0018 0000 007C
        DECLE   $007C,  $005A,  $001A,  $0000   ; 67D5   007C 005A 001A 0000
        DECLE   $001A,  $0018,  $0018,  $0010   ; 67D9   001A 0018 0018 0010
        DECLE   $0010,  $0010,  $0000,  $0010   ; 67DD   0010 0010 0000 0010
        DECLE   $0018,  $0018,  $0000,  $003C   ; 67E1   0018 0018 0000 003C
        DECLE   $007E,  $005A,  $005A,  $0000   ; 67E5   007E 005A 005A 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 67E9   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 67ED   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0000,  $003E   ; 67F1   0018 0018 0000 003E
        DECLE   $003E,  $005A,  $0058,  $0000   ; 67F5   003E 005A 0058 0000
        DECLE   $0058,  $0018,  $0018,  $0008   ; 67F9   0058 0018 0018 0008
        DECLE   $0008,  $0008,  $0000,  $0008   ; 67FD   0008 0008 0000 0008
        DECLE   $0018,  $0018,  $0000,  $003C   ; 6801   0018 0018 0000 003C
        DECLE   $007E,  $005A,  $005A,  $0000   ; 6805   007E 005A 005A 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 6809   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 680D   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0000,  $0030   ; 6811   0018 0018 0000 0030
        DECLE   $0030,  $0030,  $0058,  $0020   ; 6815   0030 0030 0058 0020
        DECLE   $0030,  $0038,  $0028,  $0024   ; 6819   0030 0038 0028 0024
        DECLE   $0024,  $0028,  $0048,  $0040   ; 681D   0024 0028 0048 0040
        DECLE   $0018,  $0018,  $0000,  $0030   ; 6821   0018 0018 0000 0030
        DECLE   $0070,  $0080,  $0090,  $002C   ; 6825   0070 0080 0090 002C
        DECLE   $0030,  $0028,  $002C,  $0024   ; 6829   0030 0028 002C 0024
        DECLE   $0020,  $0064,  $0040,  $0040   ; 682D   0020 0064 0040 0040
        DECLE   $0018,  $0018,  $0000,  $0030   ; 6831   0018 0018 0000 0030
        DECLE   $00F4,  $00B8,  $0000,  $0010   ; 6835   00F4 00B8 0000 0010
        DECLE   $0038,  $0038,  $002C,  $0024   ; 6839   0038 0038 002C 0024
        DECLE   $0022,  $0042,  $0080,  $0080   ; 683D   0022 0042 0080 0080
        DECLE   $0018,  $0018,  $0000,  $0030   ; 6841   0018 0018 0000 0030
        DECLE   $0070,  $00B0,  $0084,  $0038   ; 6845   0070 00B0 0084 0038
        DECLE   $0030,  $0028,  $0024,  $0024   ; 6849   0030 0028 0024 0024
        DECLE   $0042,  $00C0,  $0080,  $0000   ; 684D   0042 00C0 0080 0000
        DECLE   $0018,  $0018,  $0000,  $0030   ; 6851   0018 0018 0000 0030
        DECLE   $0070,  $0070,  $0050,  $006C   ; 6855   0070 0070 0050 006C
        DECLE   $0030,  $0030,  $0010,  $0020   ; 6859   0030 0030 0010 0020
        DECLE   $0070,  $0050,  $0010,  $0008   ; 685D   0070 0050 0010 0008
        DECLE   $0018,  $0018,  $0000,  $0030   ; 6861   0018 0018 0000 0030
        DECLE   $0030,  $0070,  $0030,  $0008   ; 6865   0030 0070 0030 0008
        DECLE   $0034,  $0030,  $0030,  $0018   ; 6869   0034 0030 0030 0018
        DECLE   $0038,  $0030,  $0020,  $0020   ; 686D   0038 0030 0020 0020
        DECLE   $005C,  $005C,  $0044,  $003C   ; 6871   005C 005C 0044 003C
        DECLE   $0018,  $0018,  $0018,  $0000   ; 6875   0018 0018 0018 0000
        DECLE   $0018,  $0018,  $0024,  $0024   ; 6879   0018 0018 0024 0024
        DECLE   $0024,  $0024,  $0000,  $0026   ; 687D   0024 0024 0000 0026
        DECLE   $0030,  $0030,  $0000,  $0070   ; 6881   0030 0030 0000 0070
        DECLE   $0078,  $0036,  $0030,  $0000   ; 6885   0078 0036 0030 0000
        DECLE   $0030,  $0031,  $001F,  $0008   ; 6889   0030 0031 001F 0008
        DECLE   $0008,  $0008,  $0008,  $000C   ; 688D   0008 0008 0008 000C
        DECLE   $0018,  $0018,  $0000,  $0038   ; 6891   0018 0018 0000 0038
        DECLE   $0038,  $003F,  $0018,  $0000   ; 6895   0038 003F 0018 0000
        DECLE   $0018,  $0018,  $0014,  $0014   ; 6899   0018 0018 0014 0014
        DECLE   $0012,  $0012,  $0002,  $001B   ; 689D   0012 0012 0002 001B
        DECLE   $0018,  $0018,  $0000,  $0038   ; 68A1   0018 0018 0000 0038
        DECLE   $0058,  $003F,  $0018,  $0000   ; 68A5   0058 003F 0018 0000
        DECLE   $0018,  $001C,  $000C,  $0016   ; 68A9   0018 001C 000C 0016
        DECLE   $0022,  $0082,  $0042,  $0003   ; 68AD   0022 0082 0042 0003
        DECLE   $0018,  $0018,  $0000,  $0018   ; 68B1   0018 0018 0000 0018
        DECLE   $0038,  $0038,  $003C,  $0010   ; 68B5   0038 0038 003C 0010
        DECLE   $0018,  $0008,  $0014,  $0014   ; 68B9   0018 0008 0014 0014
        DECLE   $0014,  $0018,  $0000,  $0010   ; 68BD   0014 0018 0000 0010
        DECLE   $0018,  $0018,  $0000,  $0018   ; 68C1   0018 0018 0000 0018
        DECLE   $0038,  $007C,  $0038,  $0010   ; 68C5   0038 007C 0038 0010
        DECLE   $0018,  $0008,  $0014,  $0014   ; 68C9   0018 0008 0014 0014
        DECLE   $0018,  $0010,  $0000,  $0010   ; 68CD   0018 0010 0000 0010
        DECLE   $0018,  $0018,  $0000,  $0010   ; 68D1   0018 0018 0000 0010
        DECLE   $0038,  $0078,  $005C,  $0030   ; 68D5   0038 0078 005C 0030
        DECLE   $0018,  $0008,  $0014,  $001C   ; 68D9   0018 0008 0014 001C
        DECLE   $0008,  $0010,  $0010,  $0000   ; 68DD   0008 0010 0010 0000
        DECLE   $0018,  $0018,  $0000,  $0018   ; 68E1   0018 0018 0000 0018
        DECLE   $0038,  $007C,  $0038,  $0010   ; 68E5   0038 007C 0038 0010
        DECLE   $0018,  $0008,  $0014,  $000C   ; 68E9   0018 0008 0014 000C
        DECLE   $0018,  $0010,  $0010,  $0000   ; 68ED   0018 0010 0010 0000
        DECLE   $000C,  $000C,  $0000,  $0018   ; 68F1   000C 000C 0000 0018
        DECLE   $0038,  $0038,  $002C,  $0010   ; 68F5   0038 0038 002C 0010
        DECLE   $0018,  $0008,  $0014,  $0014   ; 68F9   0018 0008 0014 0014
        DECLE   $0018,  $0010,  $0000,  $0000   ; 68FD   0018 0010 0000 0000
        DECLE   $0030,  $0030,  $0000,  $0020   ; 6901   0030 0030 0000 0020
        DECLE   $0030,  $0070,  $0078,  $0000   ; 6905   0030 0070 0078 0000
        DECLE   $0030,  $0030,  $0028,  $0028   ; 6909   0030 0030 0028 0028
        DECLE   $0028,  $0020,  $0028,  $0020   ; 690D   0028 0020 0028 0020
        DECLE   $0000,  $0000,  $0030,  $0030   ; 6911   0000 0000 0030 0030
        DECLE   $0000,  $0030,  $0070,  $0070   ; 6915   0000 0030 0070 0070
        DECLE   $0038,  $0000,  $0030,  $0028   ; 6919   0038 0000 0030 0028
        DECLE   $0028,  $0020,  $0028,  $0020   ; 691D   0028 0020 0028 0020
        DECLE   $0000,  $0000,  $0000,  $0060   ; 6921   0000 0000 0000 0060
        DECLE   $0060,  $0000,  $0060,  $00E0   ; 6925   0060 0000 0060 00E0
        DECLE   $00F0,  $0068,  $0060,  $0030   ; 6929   00F0 0068 0060 0030
        DECLE   $0028,  $0028,  $0068,  $0044   ; 692D   0028 0028 0068 0044
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6931   0000 0000 0000 0000
        DECLE   $0060,  $0060,  $0000,  $0060   ; 6935   0060 0060 0000 0060
        DECLE   $00F0,  $00F8,  $0060,  $0000   ; 6939   00F0 00F8 0060 0000
        DECLE   $0030,  $0018,  $0014,  $0022   ; 693D   0030 0018 0014 0022
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6941   0000 0000 0000 0000
        DECLE   $0000,  $0060,  $0060,  $0000   ; 6945   0000 0060 0060 0000
        DECLE   $0060,  $0070,  $00F8,  $0060   ; 6949   0060 0070 00F8 0060
        DECLE   $0030,  $003C,  $0012,  $0070   ; 694D   0030 003C 0012 0070
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6951   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $00C0,  $0000   ; 6955   0000 00C0 00C0 0000
        DECLE   $00C0,  $00E0,  $00F8,  $00E0   ; 6959   00C0 00E0 00F8 00E0
        DECLE   $0038,  $00BF,  $0040,  $0000   ; 695D   0038 00BF 0040 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 6961   0000 0018 0018 0000
        DECLE   $0038,  $0078,  $0078,  $007E   ; 6965   0038 0078 0078 007E
        DECLE   $0030,  $0008,  $0028,  $0024   ; 6969   0030 0008 0028 0024
        DECLE   $0024,  $0024,  $0006,  $0020   ; 696D   0024 0024 0006 0020
        DECLE   $0000,  $000C,  $000C,  $0000   ; 6971   0000 000C 000C 0000
        DECLE   $0038,  $0078,  $0078,  $0074   ; 6975   0038 0078 0078 0074
        DECLE   $0032,  $0008,  $0028,  $0024   ; 6979   0032 0008 0028 0024
        DECLE   $0024,  $0024,  $0000,  $0020   ; 697D   0024 0024 0000 0020
        DECLE   $0000,  $000C,  $000C,  $0000   ; 6981   0000 000C 000C 0000
        DECLE   $0038,  $0078,  $0078,  $007C   ; 6985   0038 0078 0078 007C
        DECLE   $0042,  $0028,  $0028,  $0024   ; 6989   0042 0028 0028 0024
        DECLE   $0024,  $0024,  $0006,  $0020   ; 698D   0024 0024 0006 0020
        DECLE   $0000,  $0018,  $0018,  $0000   ; 6991   0000 0018 0018 0000
        DECLE   $0038,  $0078,  $007C,  $0076   ; 6995   0038 0078 007C 0076
        DECLE   $0038,  $0028,  $0028,  $0034   ; 6999   0038 0028 0028 0034
        DECLE   $0014,  $0014,  $0026,  $0000   ; 699D   0014 0014 0026 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 69A1   0000 0018 0018 0000
        DECLE   $0038,  $0078,  $0078,  $007E   ; 69A5   0038 0078 0078 007E
        DECLE   $0030,  $0008,  $0028,  $0024   ; 69A9   0030 0008 0028 0024
        DECLE   $0024,  $0024,  $0006,  $0020   ; 69AD   0024 0024 0006 0020
        DECLE   $0000,  $000C,  $000C,  $0000   ; 69B1   0000 000C 000C 0000
        DECLE   $0038,  $007C,  $00FC,  $00B4   ; 69B5   0038 007C 00FC 00B4
        DECLE   $00B8,  $0088,  $0028,  $0024   ; 69B9   00B8 0088 0028 0024
        DECLE   $0024,  $0022,  $0002,  $0020   ; 69BD   0024 0022 0002 0020
        DECLE   $0000,  $0018,  $0018,  $0000   ; 69C1   0000 0018 0018 0000
        DECLE   $0030,  $0078,  $00FC,  $00B4   ; 69C5   0030 0078 00FC 00B4
        DECLE   $00B8,  $0088,  $0028,  $0024   ; 69C9   00B8 0088 0028 0024
        DECLE   $0034,  $0022,  $0002,  $0000   ; 69CD   0034 0022 0002 0000
        DECLE   $0000,  $0000,  $0030,  $0030   ; 69D1   0000 0000 0030 0030
        DECLE   $0078,  $0078,  $00F8,  $00B8   ; 69D5   0078 0078 00F8 00B8
        DECLE   $00A8,  $00AC,  $003F,  $0001   ; 69D9   00A8 00AC 003F 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 69DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0003   ; 69E1   0000 0000 0002 0003
        DECLE   $0003,  $00FF,  $00FD,  $00FB   ; 69E5   0003 00FF 00FD 00FB
        DECLE   $006E,  $00A0,  $00A0,  $00A0   ; 69E9   006E 00A0 00A0 00A0
        DECLE   $0040,  $0080,  $0000,  $0000   ; 69ED   0040 0080 0000 0000
        DECLE   $0000,  $0005,  $0005,  $0005   ; 69F1   0000 0005 0005 0005
        DECLE   $0005,  $001F,  $00FE,  $00F8   ; 69F5   0005 001F 00FE 00F8
        DECLE   $00F0,  $0060,  $00A0,  $00A0   ; 69F9   00F0 0060 00A0 00A0
        DECLE   $00A0,  $0040,  $0080,  $0000   ; 69FD   00A0 0040 0080 0000
        DECLE   $0005,  $0005,  $0005,  $0005   ; 6A01   0005 0005 0005 0005
        DECLE   $000E,  $00DE,  $00FC,  $0078   ; 6A05   000E 00DE 00FC 0078
        DECLE   $00F0,  $00F0,  $00A0,  $00A0   ; 6A09   00F0 00F0 00A0 00A0
        DECLE   $00A0,  $00C0,  $0040,  $0080   ; 6A0D   00A0 00C0 0040 0080
        DECLE   $0000,  $0018,  $0018,  $0000   ; 6A11   0000 0018 0018 0000
        DECLE   $0038,  $0078,  $0078,  $007E   ; 6A15   0038 0078 0078 007E
        DECLE   $0030,  $0008,  $0028,  $0024   ; 6A19   0030 0008 0028 0024
        DECLE   $0024,  $0024,  $0006,  $0020   ; 6A1D   0024 0024 0006 0020
        DECLE   $0000,  $000C,  $000C,  $0000   ; 6A21   0000 000C 000C 0000
        DECLE   $0038,  $0078,  $0078,  $0074   ; 6A25   0038 0078 0078 0074
        DECLE   $0032,  $0008,  $0028,  $0024   ; 6A29   0032 0008 0028 0024
        DECLE   $0024,  $0024,  $0000,  $0020   ; 6A2D   0024 0024 0000 0020
        DECLE   $0000,  $000C,  $000C,  $0000   ; 6A31   0000 000C 000C 0000
        DECLE   $0038,  $0078,  $0078,  $007C   ; 6A35   0038 0078 0078 007C
        DECLE   $0042,  $0028,  $0028,  $0024   ; 6A39   0042 0028 0028 0024
        DECLE   $0024,  $0024,  $0006,  $0020   ; 6A3D   0024 0024 0006 0020
        DECLE   $0000,  $0018,  $0018,  $0000   ; 6A41   0000 0018 0018 0000
        DECLE   $0038,  $0078,  $007C,  $0076   ; 6A45   0038 0078 007C 0076
        DECLE   $0038,  $0028,  $0028,  $0034   ; 6A49   0038 0028 0028 0034
        DECLE   $0014,  $0014,  $0026,  $0000   ; 6A4D   0014 0014 0026 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 6A51   0000 0018 0018 0000
        DECLE   $0038,  $0078,  $0078,  $007E   ; 6A55   0038 0078 0078 007E
        DECLE   $0030,  $0008,  $0028,  $0024   ; 6A59   0030 0008 0028 0024
        DECLE   $0024,  $0024,  $0006,  $0020   ; 6A5D   0024 0024 0006 0020
        DECLE   $0000,  $000C,  $000C,  $0000   ; 6A61   0000 000C 000C 0000
        DECLE   $0038,  $007C,  $00FC,  $00B6   ; 6A65   0038 007C 00FC 00B6
        DECLE   $00B0,  $0088,  $0048,  $0044   ; 6A69   00B0 0088 0048 0044
        DECLE   $0044,  $0044,  $0006,  $0040   ; 6A6D   0044 0044 0006 0040
        DECLE   $0000,  $000C,  $000C,  $0000   ; 6A71   0000 000C 000C 0000
        DECLE   $0038,  $007C,  $00FC,  $00B6   ; 6A75   0038 007C 00FC 00B6
        DECLE   $0070,  $0030,  $0000,  $0028   ; 6A79   0070 0030 0000 0028
        DECLE   $0028,  $0048,  $0048,  $0048   ; 6A7D   0028 0048 0048 0048
        DECLE   $0000,  $0006,  $0006,  $0000   ; 6A81   0000 0006 0006 0000
        DECLE   $0038,  $007C,  $007D,  $001A   ; 6A85   0038 007C 007D 001A
        DECLE   $0018,  $0018,  $0000,  $0028   ; 6A89   0018 0018 0000 0028
        DECLE   $0028,  $0050,  $0060,  $00A0   ; 6A8D   0028 0050 0060 00A0
        DECLE   $0001,  $0006,  $000C,  $001D   ; 6A91   0001 0006 000C 001D
        DECLE   $0019,  $001F,  $001C,  $0018   ; 6A95   0019 001F 001C 0018
        DECLE   $0018,  $0018,  $0000,  $0028   ; 6A99   0018 0018 0000 0028
        DECLE   $0030,  $0050,  $0060,  $00A0   ; 6A9D   0030 0050 0060 00A0
        DECLE   $0003,  $0007,  $000D,  $001D   ; 6AA1   0003 0007 000D 001D
        DECLE   $001A,  $001E,  $001C,  $0018   ; 6AA5   001A 001E 001C 0018
        DECLE   $0018,  $0000,  $0028,  $0028   ; 6AA9   0018 0000 0028 0028
        DECLE   $0030,  $0050,  $00E0,  $0080   ; 6AAD   0030 0050 00E0 0080
        DECLE   $0003,  $000D,  $000D,  $0012   ; 6AB1   0003 000D 000D 0012
        DECLE   $001C,  $001C,  $0018,  $0018   ; 6AB5   001C 001C 0018 0018
        DECLE   $0000,  $0000,  $0000,  $000C   ; 6AB9   0000 0000 0000 000C
        DECLE   $000C,  $0030,  $005E,  $00A0   ; 6ABD   000C 0030 005E 00A0
        DECLE   $0030,  $0038,  $0028,  $0024   ; 6AC1   0030 0038 0028 0024
        DECLE   $0024,  $0028,  $0048,  $0040   ; 6AC5   0024 0028 0048 0040
        DECLE   $0000,  $0000,  $0040,  $0020   ; 6AC9   0000 0000 0040 0020
        DECLE   $0010,  $0016,  $0016,  $0020   ; 6ACD   0010 0016 0016 0020
        DECLE   $0030,  $003C,  $002A,  $00A9   ; 6AD1   0030 003C 002A 00A9
        DECLE   $00A8,  $00F0,  $0030,  $0020   ; 6AD5   00A8 00F0 0030 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0003   ; 6ADD   0000 0000 0003 0003
        DECLE   $0020,  $003F,  $00A9,  $00CA   ; 6AE1   0020 003F 00A9 00CA
        DECLE   $00FE,  $0000,  $0000,  $0000   ; 6AE5   00FE 0000 0000 0000
        DECLE   $005A,  $005A,  $0042,  $005A   ; 6AE9   005A 005A 0042 005A
        DECLE   $003C,  $0018,  $0018,  $0000   ; 6AED   003C 0018 0018 0000

        COMR    R4                              ; 6AF1   001C
        RSWD    R4                              ; 6AF2   003C
        NEGR    R4                              ; 6AF3   0024
        NEGR    R4                              ; 6AF4   0024
        NEGR    R4                              ; 6AF5   0024
        NEGR    R4                              ; 6AF6   0024
        NEGR    R6                              ; 6AF7   0026
        SLR     R0,     1                       ; 6AF8   0060
L_6AF9:
        PSHR    R5                              ; 6AF9   0275
        MVII    #$0321, R3                      ; 6AFA   02BB 0321
        MVII    #$01A9, R5                      ; 6AFC   02BD 01A9
L_6AFE:
        PSHR    R3                              ; 6AFE   0273
        MVI@    R5,     R0                      ; 6AFF   02A8
        PSHR    R5                              ; 6B00   0275
        ANDI    #$0004, R0                      ; 6B01   03B8 0004
        BNEQ    L_6B48                          ; 6B03   020C 0043

        MVI@    R3,     R0                      ; 6B05   0298
        SUBI    #$0004, R3                      ; 6B06   033B 0004
        MVI@    R3,     R2                      ; 6B08   029A
        SDBD                                    ; 6B09   0001
        ANDI    #$FDFF, R2                      ; 6B0A   03BA 00FF 00FD
        TSTR    R0                              ; 6B0D   0080
        BEQ     L_6B51                          ; 6B0E   0204 0041

        JSR     R5,     X_UNPK_BYTES            ; 6B10   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 6B13   0004 0118 022F

        MOVR    R1,     R0                      ; 6B16   0088
        ANDI    #$0007, R0                      ; 6B17   03B8 0007
        CMPI    #$0006, R0                      ; 6B19   0378 0006
        BGE     L_6B29                          ; 6B1B   020D 000C

        CMPI    #$0002, R0                      ; 6B1D   0378 0002
        BLE     L_6B29                          ; 6B1F   0206 0008

        SDBD                                    ; 6B21   0001
        MVII    #$581A, R4                      ; 6B22   02BC 001A 0058
        MVII    #$0004, R0                      ; 6B25   02B8 0004
        B       L_6B2F                          ; 6B27   0200 0006

L_6B29:
        MVII    #$0008, R0                      ; 6B29   02B8 0008
        SDBD                                    ; 6B2B   0001
        MVII    #$5813, R4                      ; 6B2C   02BC 0013 0058
L_6B2F:
        CMPI    #$0005, R1                      ; 6B2F   0379 0005
        BLT     L_6B39                          ; 6B31   0205 0006

        CMPI    #$000B, R1                      ; 6B33   0379 000B
        BGT     L_6B39                          ; 6B35   020E 0002

L_6B37:
        XORI    #$0200, R2                      ; 6B37   03FA 0200
L_6B39:
        MVO@    R2,     R3                      ; 6B39   025A
        INCR    R3                              ; 6B3A   000B
        MVO@    R4,     R3                      ; 6B3B   025C
        ADDI    #$0004, R3                      ; 6B3C   02FB 0004
        MVI@    R3,     R5                      ; 6B3E   029D
        ANDI    #$000F, R5                      ; 6B3F   03BD 000F
        CMPR    R5,     R0                      ; 6B41   0168
        BGE     L_6B45                          ; 6B42   020D 0001

        CLRR    R5                              ; 6B44   01ED
L_6B45:
        XORI    #$03F0, R5                      ; 6B45   03FD 03F0
        MVO@    R5,     R3                      ; 6B47   025D
L_6B48:
        PULR    R5                              ; 6B48   02B5
        PULR    R3                              ; 6B49   02B3
        ADDI    #$0008, R3                      ; 6B4A   02FB 0008
        CMPI    #$0351, R3                      ; 6B4C   037B 0351
        BLT     L_6AFE                          ; 6B4E   0225 0051
        PULR    R7                              ; 6B50   02B7

L_6B51:
        SDBD                                    ; 6B51   0001
        MVII    #$5821, R4                      ; 6B52   02BC 0021 0058
        ADDI    #$0002, R3                      ; 6B55   02FB 0002
        MVI@    R3,     R5                      ; 6B57   029D
        SUBI    #$0002, R3                      ; 6B58   033B 0002
        CMP     G_034F, R5                      ; 6B5A   0345 034F
        BC      L_6B37                          ; 6B5C   0221 0026
        B       L_6B39                          ; 6B5E   0220 0026

L_6B60:
        PSHR    R5                              ; 6B60   0275
        MVI     G_01BA, R0                      ; 6B61   0280 01BA
        ANDI    #$0002, R0                      ; 6B63   03B8 0002
        BNEQ    L_6BBD                          ; 6B65   020C 0056

        MVI     G_01D1, R0                      ; 6B67   0280 01D1
        ANDI    #$0080, R0                      ; 6B69   03B8 0080
        BNEQ    L_6BBC                          ; 6B6B   020C 004F

        MVI     G_01BA, R0                      ; 6B6D   0280 01BA
        SDBD                                    ; 6B6F   0001
        ANDI    #$00D8, R0                      ; 6B70   03B8 00D8 0000
        BNEQ    L_6BBC                          ; 6B73   020C 0047

        MVII    #$011F, R2                      ; 6B75   02BA 011F
        MVII    #$031D, R3                      ; 6B77   02BB 031D
        CLRR    R4                              ; 6B79   01E4
L_6B7A:
        MOVR    R4,     R1                      ; 6B7A   00A1
        ADDI    #$01A9, R1                      ; 6B7B   02F9 01A9
        MVI@    R1,     R0                      ; 6B7D   0288
        ANDI    #$0004, R0                      ; 6B7E   03B8 0004
        BNEQ    L_6BA3                          ; 6B80   020C 0021

        SDBD                                    ; 6B82   0001
        ADDI    #$001D, R1                      ; 6B83   02F9 001D 0000
        MVI@    R1,     R0                      ; 6B86   0288
        SWAP    R0,     1                       ; 6B87   0040
        SLLC    R0,     1                       ; 6B88   0058
        BNC     L_6BA3                          ; 6B89   0209 0018

        MVI@    R2,     R0                      ; 6B8B   0290
        MOVR    R0,     R1                      ; 6B8C   0081
        ANDI    #$00C0, R0                      ; 6B8D   03B8 00C0
        BNEQ    L_6B9E                          ; 6B8F   020C 000D

        MVII    #$001E, R0                      ; 6B91   02B8 001E
        CMP     G_01B9, R4                      ; 6B93   0344 01B9
        BNEQ    L_6B99                          ; 6B95   020C 0002

        SUBI    #$000A, R0                      ; 6B97   0338 000A

L_6B99:
        JSR     R5,     .EXEC.629               ; 6B99   0004 0114 0229

        B       L_6B9F                          ; 6B9C   0200 0001

L_6B9E:
        CLRR    R0                              ; 6B9E   01C0
L_6B9F:
        MOVR    R3,     R1                      ; 6B9F   0099
        ADDI    #$0004, R1                      ; 6BA0   02F9 0004
        MVO@    R0,     R1                      ; 6BA2   0248
L_6BA3:
        INCR    R2                              ; 6BA3   000A
        ADDI    #$0018, R3                      ; 6BA4   02FB 0018
        ADDI    #$0003, R4                      ; 6BA6   02FC 0003
        CMPI    #$0335, R3                      ; 6BA8   037B 0335
        BEQ     L_6B7A                          ; 6BAA   0224 0031

        CMPI    #$0006, R4                      ; 6BAC   037C 0006
        BGT     L_6BBC                          ; 6BAE   020E 000C
        BLT     L_6B7A                          ; 6BB0   0225 0037

        SDBD                                    ; 6BB2   0001
        MVII    #$4042, R2                      ; 6BB3   02BA 0042 0040
        MVII    #$0325, R3                      ; 6BB6   02BB 0325
        CLRR    R4                              ; 6BB8   01E4
        INCR    R4                              ; 6BB9   000C
        B       L_6B7A                          ; 6BBA   0220 0041
L_6BBC:
        PULR    R7                              ; 6BBC   02B7

L_6BBD:
        MVII    #$011F, R1                      ; 6BBD   02B9 011F
        MVI     G_01B9, R0                      ; 6BBF   0280 01B9
        CMPI    #$0003, R0                      ; 6BC1   0378 0003
        BLT     L_6BC6                          ; 6BC3   0205 0001

        INCR    R1                              ; 6BC5   0009
L_6BC6:
        MVI@    R1,     R0                      ; 6BC6   0288
        ANDI    #$00C0, R0                      ; 6BC7   03B8 00C0
        BNEQ    L_6BBC                          ; 6BC9   022C 000E

L_6BCB:
        MVI     G_01BB, R0                      ; 6BCB   0280 01BB
        CMPI    #$0001, R0                      ; 6BCD   0378 0001
        BNEQ    L_6BBC                          ; 6BCF   022C 0014

L_6BD1:
        MVII    #$0002, R0                      ; 6BD1   02B8 0002
        MVO     R0,     G_01BB                  ; 6BD3   0240 01BB
        MVI     G_01B9, R1                      ; 6BD5   0281 01B9
        ADDI    #$01A9, R1                      ; 6BD7   02F9 01A9
        MVI@    R1,     R0                      ; 6BD9   0288
        SDBD                                    ; 6BDA   0001
        ANDI    #$FFFB, R0                      ; 6BDB   03B8 00FB 00FF
        XORI    #$0004, R0                      ; 6BDE   03F8 0004
        MVO@    R0,     R1                      ; 6BE0   0248
L_6BE1:
        MVI     G_01B9, R0                      ; 6BE1   0280 01B9

        JSR     R5,     .EXEC.76C               ; 6BE3   0004 0114 036C

        MVI@    R1,     R2                      ; 6BE6   028A
        SDBD                                    ; 6BE7   0001
        ANDI    #$FDFF, R2                      ; 6BE8   03BA 00FF 00FD

        JSR     R5,     L_DA3D                  ; 6BEB   0004 01D8 023D

        BNC     L_6BF2                          ; 6BEE   0209 0002

        XORI    #$0200, R2                      ; 6BF0   03FA 0200
L_6BF2:
        MVO@    R2,     R1                      ; 6BF2   024A
        INCR    R1                              ; 6BF3   0009
        SDBD                                    ; 6BF4   0001
        MVII    #$582F, R0                      ; 6BF5   02B8 002F 0058
        MVO@    R0,     R1                      ; 6BF8   0248
        ADDI    #$0004, R1                      ; 6BF9   02F9 0004
        MVII    #$03F0, R0                      ; 6BFB   02B8 03F0
        MVO@    R0,     R1                      ; 6BFD   0248
        INCR    R1                              ; 6BFE   0009
        MVII    #$0004, R0                      ; 6BFF   02B8 0004
        MVO@    R0,     R1                      ; 6C01   0248
        SUBI    #$0002, R1                      ; 6C02   0339 0002
        MVI     G_01B9, R0                      ; 6C04   0280 01B9

        JSR     R5,     L_DA3D                  ; 6C06   0004 01D8 023D

        MVII    #$0019, R0                      ; 6C09   02B8 0019
        BNC     L_6C0E                          ; 6C0B   0209 0001

        NEGR    R0                              ; 6C0D   0020
L_6C0E:
        ANDI    #$00FF, R0                      ; 6C0E   03B8 00FF
        SWAP    R0,     1                       ; 6C10   0040
        MVO@    R0,     R1                      ; 6C11   0248
        PULR    R7                              ; 6C12   02B7

        DECLE   $0000,  $0000                   ; 6C13   0000 0000

        INCR    R3                              ; 6C15   000B
        SAR     R3,     2                       ; 6C16   006F
        NEGR    R6                              ; 6C17   0026
        SAR     R1,     2                       ; 6C18   006D
        SLL     R3,     2                       ; 6C19   004F
        SAR     R0,     2                       ; 6C1A   006C
        MOVR    R5,     R4                      ; 6C1B   00AC
        SAR     R1,     2                       ; 6C1C   006D
L_6C1D:
        PSHR    R5                              ; 6C1D   0275
L_6C1E:
        SDBD                                    ; 6C1E   0001
        MVII    #$6D3D, R5                      ; 6C1F   02BD 003D 006D
        PSHR    R5                              ; 6C22   0275
        MVO     R5,     G_01C5                  ; 6C23   0245 01C5
        B       L_6CAF                          ; 6C25   0200 0088

L_6C27:
        PSHR    R5                              ; 6C27   0275
        B       L_6CAF                          ; 6C28   0200 0085

        PSHR    R5                              ; 6C2A   0275

L_6C2B:
        JSR     R5,     L_5E05                  ; 6C2B   0004 015C 0205

        PSHR    R0                              ; 6C2E   0270

        JSR     R5,     L_5D8B                  ; 6C2F   0004 015C 018B

        PSHR    R0                              ; 6C32   0270
        MOVR    R1,     R2                      ; 6C33   008A
        MOVR    R4,     R1                      ; 6C34   00A1

        JSR     R5,     L_6099                  ; 6C35   0004 0160 0099

        MOVR    R0,     R4                      ; 6C38   0084
        PULR    R1                              ; 6C39   02B1
        CMPI    #$0032, R1                      ; 6C3A   0379 0032
        PULR    R3                              ; 6C3C   02B3
        BLE     L_6C45                          ; 6C3D   0206 0006

        MVII    #$003C, R0                      ; 6C3F   02B8 003C

        JSR     R5,     L_6C1D                  ; 6C41   0004 016C 001D

        PULR    R7                              ; 6C44   02B7

L_6C45:
        MVII    #$0023, R0                      ; 6C45   02B8 0023
        B       L_6CAF                          ; 6C47   0200 0066

L_6C49:
        MVII    #$003C, R4                      ; 6C49   02BC 003C
        MVII    #$0002, R2                      ; 6C4B   02BA 0002
        B       L_6CA4                          ; 6C4D   0200 0055

        PSHR    R5                              ; 6C4F   0275
        SDBD                                    ; 6C50   0001
        MVII    #$6CA0, R5                      ; 6C51   02BD 00A0 006C
        SDBD                                    ; 6C54   0001
        MVII    #$6C5A, R4                      ; 6C55   02BC 005A 006C
        B       L_6DB7                          ; 6C58   0200 015D

        SUBI    #$01A9, R2                      ; 6C5A   033A 01A9
        MOVR    R2,     R0                      ; 6C5C   0090
        MVI     G_01BA, R3                      ; 6C5D   0283 01BA
        MOVR    R3,     R4                      ; 6C5F   009C
        SDBD                                    ; 6C60   0001
        ANDI    #$0021, R3                      ; 6C61   03BB 0021 0000
        BNEQ    L_6CF0                          ; 6C64   020C 008A

        ANDI    #$0004, R4                      ; 6C66   03BC 0004
        BEQ     L_6CEF                          ; 6C68   0204 0085

        MVI     G_01B9, R2                      ; 6C6A   0282 01B9
        CMPI    #$00FF, R2                      ; 6C6C   037A 00FF
        BEQ     L_6CEF                          ; 6C6E   0204 007F

        CMPR    R2,     R0                      ; 6C70   0150
        BEQ     L_6CEF                          ; 6C71   0204 007C

        JSR     R5,     L_6FCE                  ; 6C73   0004 016C 03CE

        ADDI    #$01C6, R2                      ; 6C76   02FA 01C6
        MVI@    R2,     R3                      ; 6C78   0293
        ANDI    #$0080, R3                      ; 6C79   03BB 0080
        BNEQ    L_6CEF                          ; 6C7B   020C 0072

        SDBD                                    ; 6C7D   0001
        ADDI    #$FFE3, R2                      ; 6C7E   02FA 00E3 00FF
        PSHR    R2                              ; 6C81   0272
        MVI@    R2,     R3                      ; 6C82   0293
        XORI    #$0080, R3                      ; 6C83   03FB 0080
        MVO@    R3,     R2                      ; 6C85   0253

        JSR     R5,     .EXEC.76C               ; 6C86   0004 0114 036C
        JSR     R5,     .EXEC.777               ; 6C89   0004 0114 0377

        ADDI    #$0006, R3                      ; 6C8C   02FB 0006
        MOVR    R3,     R0                      ; 6C8E   0098

        JSR     R5,     X_CLAMP                 ; 6C8F   0004 0114 0270

L_6C92:
        DECR    R7                              ; 6C92   0017

        RLC     R1,     2                       ; 6C93   0055
        SWAP    R2,     1                       ; 6C94   0042
        XORR    R0,     R2                      ; 6C95   01C2
        MVII    #$002D, R3                      ; 6C96   02BB 002D
        MVII    #$0006, R0                      ; 6C98   02B8 0006

        JSR     R5,     .EXEC.9BB               ; 6C9A   0004 0118 01BB

        PULR    R3                              ; 6C9D   02B3
        B       L_6CDB                          ; 6C9E   0200 003B

        MVII    #$002D, R4                      ; 6CA0   02BC 002D
        MVII    #$0005, R2                      ; 6CA2   02BA 0005
L_6CA4:
        MOVR    R4,     R0                      ; 6CA4   00A0
        MVI     G_011F, R4                      ; 6CA5   0284 011F
        CLRR    R3                              ; 6CA7   01DB
        TSTR    R1                              ; 6CA8   0089
        BEQ     L_6CAF                          ; 6CA9   0204 0004

        MVI     G_0120, R4                      ; 6CAB   0284 0120
        MVII    #$0003, R3                      ; 6CAD   02BB 0003
L_6CAF:
        ADDI    #$01A9, R3                      ; 6CAF   02FB 01A9
        MVI@    R3,     R1                      ; 6CB1   0299
        MOVR    R1,     R2                      ; 6CB2   008A
        ANDI    #$0080, R1                      ; 6CB3   03B9 0080
        BEQ     L_6CEF                          ; 6CB5   0204 0038

        MOVR    R4,     R1                      ; 6CB7   00A1
        ANDI    #$0080, R4                      ; 6CB8   03BC 0080
        BNEQ    L_6CEF                          ; 6CBA   020C 0033

        MVI     G_01C5, R5                      ; 6CBC   0285 01C5
        TSTR    R5                              ; 6CBE   00AD
        BEQ     L_6CD3                          ; 6CBF   0204 0012

        MOVR    R1,     R5                      ; 6CC1   008D
        ANDI    #$0007, R5                      ; 6CC2   03BD 0007
        CMPI    #$0006, R5                      ; 6CC4   037D 0006
        BGT     L_6CD0                          ; 6CC6   020E 0008

        CMPI    #$0002, R5                      ; 6CC8   037D 0002
        BLT     L_6CD0                          ; 6CCA   0205 0004

        MVII    #$002D, R0                      ; 6CCC   02B8 002D
        B       L_6CD3                          ; 6CCE   0200 0003

L_6CD0:
        CLRR    R5                              ; 6CD0   01ED
        MVO     R5,     G_01C5                  ; 6CD1   0245 01C5

L_6CD3:
        JSR     R5,     .EXEC.629               ; 6CD3   0004 0114 0229

        MVO     R0,     G_0351                  ; 6CD6   0240 0351
        XORI    #$0080, R2                      ; 6CD8   03FA 0080
        MVO@    R2,     R3                      ; 6CDA   025A
L_6CDB:
        CLRR    R0                              ; 6CDB   01C0
        COMR    R0                              ; 6CDC   0018
        MVO     R0,     G_01B9                  ; 6CDD   0240 01B9
        MVII    #$0001, R0                      ; 6CDF   02B8 0001
        MVO     R0,     G_01BB                  ; 6CE1   0240 01BB
        MVII    #$0007, R0                      ; 6CE3   02B8 0007
        MVO     R0,     G_0353                  ; 6CE5   0240 0353
        MOVR    R3,     R2                      ; 6CE7   009A
        SUBI    #$01A9, R2                      ; 6CE8   033A 01A9
        MVO     R2,     G_01B2                  ; 6CEA   0242 01B2

        JSR     R5,     L_D0FD                  ; 6CEC   0004 01D0 00FD

L_6CEF:
        PULR    R7                              ; 6CEF   02B7

L_6CF0:
        MVI     G_01B9, R1                      ; 6CF0   0281 01B9
        CMPI    #$00FF, R1                      ; 6CF2   0379 00FF
        BEQ     L_6D25                          ; 6CF4   0204 002F

        MVII    #$0003, R2                      ; 6CF6   02BA 0003
        CMPR    R2,     R0                      ; 6CF8   0150
        BLT     L_6CFF                          ; 6CF9   0205 0004

        CMPR    R2,     R1                      ; 6CFB   0151
        BGE     L_6D03                          ; 6CFC   020D 0005
        PULR    R7                              ; 6CFE   02B7

L_6CFF:
        CMPR    R2,     R1                      ; 6CFF   0151
        BLT     L_6D03                          ; 6D00   0205 0001
        PULR    R7                              ; 6D02   02B7

L_6D03:
        MOVR    R0,     R2                      ; 6D03   0082
        SLL     R2,     2                       ; 6D04   004E
        SLL     R2,     1                       ; 6D05   004A
        ADDI    #$031D, R2                      ; 6D06   02FA 031D
        MOVR    R1,     R0                      ; 6D08   0088

        JSR     R5,     .EXEC.76C               ; 6D09   0004 0114 036C

        ADDI    #$0007, R1                      ; 6D0C   02F9 0007
        MVO@    R2,     R1                      ; 6D0E   024A
        SUBI    #$0007, R1                      ; 6D0F   0339 0007
        ANDI    #$0001, R3                      ; 6D11   03BB 0001
        BNEQ    L_6D21                          ; 6D13   020C 000C

        INCR    R1                              ; 6D15   0009
        PSHR    R1                              ; 6D16   0271
        INCR    R1                              ; 6D17   0009
        MVII    #$0001, R2                      ; 6D18   02BA 0001
        CLRR    R3                              ; 6D1A   01DB
        COMR    R3                              ; 6D1B   001B
        MVO     R3,     G_01B9                  ; 6D1C   0243 01B9
        J       L_5632                          ; 6D1E   0004 0354 0232

L_6D21:
        MOVR    R2,     R4                      ; 6D21   0094

        JSR     R5,     L_5672                  ; 6D22   0004 0154 0272

L_6D25:
        PULR    R7                              ; 6D25   02B7

        PSHR    R5                              ; 6D26   0275
        SDBD                                    ; 6D27   0001
        MVII    #$6D33, R5                      ; 6D28   02BD 0033 006D
        SDBD                                    ; 6D2B   0001
        MVII    #$6D58, R4                      ; 6D2C   02BC 0058 006D
        MVII    #$0002, R2                      ; 6D2F   02BA 0002
        B       L_6DB7                          ; 6D31   0200 0084

        SDBD                                    ; 6D33   0001
        MVII    #$6D3D, R5                      ; 6D34   02BD 003D 006D
        PSHR    R5                              ; 6D37   0275
        MVO     R5,     G_01C5                  ; 6D38   0245 01C5

        JSR     R5,     L_6C49                  ; 6D3A   0004 016C 0049

        MVI     G_01C5, R2                      ; 6D3D   0282 01C5
        TSTR    R2                              ; 6D3F   0092
        BEQ     L_6D46                          ; 6D40   0204 0004

        MVII    #$019F, R0                      ; 6D42   02B8 019F
        B       L_6D4C                          ; 6D44   0200 0006

L_6D46:
        MVII    #$0001, R0                      ; 6D46   02B8 0001
        MVO     R0,     G_01C5                  ; 6D48   0240 01C5
        MVII    #$01FF, R0                      ; 6D4A   02B8 01FF
L_6D4C:
        MVO     R0,     G_035C                  ; 6D4C   0240 035C
        CLRR    R0                              ; 6D4E   01C0
        MVO     R0,     G_0354                  ; 6D4F   0240 0354
        MVII    #$0007, R0                      ; 6D51   02B8 0007

        JSR     R5,     .EXEC.6D5               ; 6D53   0004 0114 02D5

        PULR    R7                              ; 6D56   02B7

L_6D57:
        PSHR    R5                              ; 6D57   0275
        SDBD                                    ; 6D58   0001
        MVII    #$5836, R3                      ; 6D59   02BB 0036 0058
        MVII    #$00F1, R4                      ; 6D5C   02BC 00F1
        SDBD                                    ; 6D5E   0001
        MVII    #$0046, R5                      ; 6D5F   02BD 0046 0000
        MVII    #$0008, R0                      ; 6D62   02B8 0008
        B       L_6D82                          ; 6D64   0200 001C

L_6D66:
        PSHR    R5                              ; 6D66   0275
        MOVR    R3,     R5                      ; 6D67   009D
        ANDI    #$0080, R5                      ; 6D68   03BD 0080
        BNEQ    L_6D81                          ; 6D6A   020C 0015

        MVII    #$0023, R0                      ; 6D6C   02B8 0023
        PSHR    R1                              ; 6D6E   0271
        MOVR    R3,     R1                      ; 6D6F   0099

        JSR     R5,     .EXEC.629               ; 6D70   0004 0114 0229

        PULR    R1                              ; 6D73   02B1
        MOVR    R0,     R4                      ; 6D74   0084
        SDBD                                    ; 6D75   0001
        MVII    #$583D, R3                      ; 6D76   02BB 003D 0058
        SDBD                                    ; 6D79   0001
        MVII    #$0016, R5                      ; 6D7A   02BD 0016 0000
        MVII    #$000A, R0                      ; 6D7D   02B8 000A
        B       L_6D82                          ; 6D7F   0200 0001
L_6D81:
        PULR    R7                              ; 6D81   02B7

L_6D82:
        PSHR    R0                              ; 6D82   0270
        MVI     G_01BA, R0                      ; 6D83   0280 01BA
        CMPI    #$0004, R0                      ; 6D85   0378 0004
        BNEQ    L_6DAA                          ; 6D87   020C 0021

        MVI@    R2,     R0                      ; 6D89   0290
        ANDI    #$0004, R0                      ; 6D8A   03B8 0004
        BNEQ    L_6DAA                          ; 6D8C   020C 001C

        MVI@    R2,     R0                      ; 6D8E   0290
        SDBD                                    ; 6D8F   0001
        ANDI    #$FFDD, R0                      ; 6D90   03B8 00DD 00FF
        XORR    R5,     R0                      ; 6D93   01E8
        MVO@    R0,     R2                      ; 6D94   0250
        MOVR    R1,     R0                      ; 6D95   0088

        JSR     R5,     .EXEC.76C               ; 6D96   0004 0114 036C

        PULR    R5                              ; 6D99   02B5
        INCR    R1                              ; 6D9A   0009
        MVO@    R3,     R1                      ; 6D9B   024B
        ADDI    #$0003, R1                      ; 6D9C   02F9 0003
        MVO@    R4,     R1                      ; 6D9E   024C
        INCR    R1                              ; 6D9F   0009
        MVII    #$02F0, R0                      ; 6DA0   02B8 02F0
        MVO@    R0,     R1                      ; 6DA2   0248
        ADDI    #$0002, R1                      ; 6DA3   02F9 0002
        CLRR    R0                              ; 6DA5   01C0
        MVO@    R0,     R1                      ; 6DA6   0248
        DECR    R1                              ; 6DA7   0011
        MVO@    R5,     R1                      ; 6DA8   024D
        PULR    R7                              ; 6DA9   02B7

L_6DAA:
        PULR    R5                              ; 6DAA   02B5
        PULR    R7                              ; 6DAB   02B7

        PSHR    R5                              ; 6DAC   0275
        SDBD                                    ; 6DAD   0001
        MVII    #$6C49, R5                      ; 6DAE   02BD 0049 006C
        SDBD                                    ; 6DB1   0001
        MVII    #$6D67, R4                      ; 6DB2   02BC 0067 006D
        MVII    #$0005, R2                      ; 6DB5   02BA 0005
L_6DB7:
        PSHR    R1                              ; 6DB7   0271
        PSHR    R2                              ; 6DB8   0272
        CMPI    #$0001, R0                      ; 6DB9   0378 0001
        BNEQ    L_6E22                          ; 6DBB   020C 0065

        MOVR    R1,     R3                      ; 6DBD   008B
        CLRR    R1                              ; 6DBE   01C9
        MVI     .PSG0.lft_hand,R0               ; 6DBF   0280 01FF
        PSHR    R0                              ; 6DC1   0270
        MVI     G_011F, R0                      ; 6DC2   0280 011F
        TSTR    R3                              ; 6DC4   009B
        BEQ     L_6DCF                          ; 6DC5   0204 0008

        MVII    #$0003, R1                      ; 6DC7   02B9 0003
        PULR    R0                              ; 6DC9   02B0
        MVI     .PSG0.rgt_hand,R0               ; 6DCA   0280 01FE
        PSHR    R0                              ; 6DCC   0270
        MVI     G_0120, R0                      ; 6DCD   0280 0120
L_6DCF:
        MVI     G_015E, R3                      ; 6DCF   0283 015E
        ANDI    #$0020, R3                      ; 6DD1   03BB 0020
        BEQ     L_6DDE                          ; 6DD3   0204 0009

        SDBD                                    ; 6DD5   0001
        ADDI    #$3F23, R0                      ; 6DD6   02F8 0023 003F
        PULR    R3                              ; 6DD9   02B3
        ANDI    #$00FF, R3                      ; 6DDA   03BB 00FF
        PSHR    R3                              ; 6DDC   0273
        INCR    R1                              ; 6DDD   0009
L_6DDE:
        MOVR    R1,     R2                      ; 6DDE   008A
        ADDI    #$01C6, R2                      ; 6DDF   02FA 01C6
        MVI@    R2,     R3                      ; 6DE1   0293
        ANDI    #$0080, R3                      ; 6DE2   03BB 0080
        BEQ     L_6E21                          ; 6DE4   0204 003B

        SDBD                                    ; 6DE6   0001
        ADDI    #$FFE3, R2                      ; 6DE7   02FA 00E3 00FF
        MVI@    R2,     R3                      ; 6DEA   0293
        ANDI    #$0080, R3                      ; 6DEB   03BB 0080
        BNEQ    L_6E02                          ; 6DED   020C 0013

        MVI     G_01BA, R3                      ; 6DEF   0283 01BA
        SDBD                                    ; 6DF1   0001
        ANDI    #$0025, R3                      ; 6DF2   03BB 0025 0000
        PULR    R3                              ; 6DF5   02B3
        BEQ     L_6E22                          ; 6DF6   0204 002A

        ANDI    #$000F, R3                      ; 6DF8   03BB 000F
        CMPI    #$000F, R3                      ; 6DFA   037B 000F
        BEQ     L_6E25                          ; 6DFC   0204 0027

L_6DFE:
        MOVR    R0,     R3                      ; 6DFE   0083
        PULR    R5                              ; 6DFF   02B5
        PULR    R5                              ; 6E00   02B5
        MOVR    R4,     R7                      ; 6E01   00A7

L_6E02:
        PULR    R4                              ; 6E02   02B4
        PULR    R4                              ; 6E03   02B4
        PULR    R1                              ; 6E04   02B1
        MVI     G_01D1, R3                      ; 6E05   0283 01D1
        ANDI    #$0080, R3                      ; 6E07   03BB 0080
        BEQ     L_6E20                          ; 6E09   0204 0015

        MVI     G_01BA, R3                      ; 6E0B   0283 01BA
        CMPI    #$0080, R3                      ; 6E0D   037B 0080
        BNEQ    L_6E20                          ; 6E0F   020C 000F

        MVI     G_01D2, R3                      ; 6E11   0283 01D2
        SUBI    #$01A9, R2                      ; 6E13   033A 01A9
        CMPR    R3,     R2                      ; 6E15   015A
        BNEQ    L_6E24                          ; 6E16   020C 000C

        MVO     R0,     G_035C                  ; 6E18   0240 035C
        MVO     R5,     G_0354                  ; 6E1A   0245 0354
        MVO     R2,     G_01B9                  ; 6E1C   0242 01B9
        B       L_6BD1                          ; 6E1E   0220 024E
L_6E20:
        MOVR    R5,     R7                      ; 6E20   00AF

L_6E21:
        PULR    R5                              ; 6E21   02B5
L_6E22:
        PULR    R5                              ; 6E22   02B5
        PULR    R5                              ; 6E23   02B5
L_6E24:
        PULR    R7                              ; 6E24   02B7

L_6E25:
        SDBD                                    ; 6E25   0001
        CMPI    #$6C5A, R4                      ; 6E26   037C 005A 006C
        BEQ     L_6DFE                          ; 6E29   0224 002C

        PULR    R2                              ; 6E2B   02B2
        PULR    R1                              ; 6E2C   02B1

        JSR     R5,     L_DCE5                  ; 6E2D   0004 01DC 00E5

        PULR    R7                              ; 6E30   02B7

        PSHR    R5                              ; 6E31   0275
        MVII    #$0020, R5                      ; 6E32   02BD 0020
        CMP     G_01BA, R5                      ; 6E34   0345 01BA
        BNEQ    L_6E4A                          ; 6E36   020C 0012

        ADDI    #$0007, R1                      ; 6E38   02F9 0007
        MVI@    R1,     R4                      ; 6E3A   028C
        SUBI    #$0007, R1                      ; 6E3B   0339 0007
        TSTR    R4                              ; 6E3D   00A4
        BEQ     L_6E45                          ; 6E3E   0204 0005

        JSR     R5,     L_5672                  ; 6E40   0004 0154 0272

        B       L_6F07                          ; 6E43   0200 00C2

L_6E45:
        JSR     R5,     L_566F                  ; 6E45   0004 0154 026F

        B       L_6F07                          ; 6E48   0200 00BD

L_6E4A:
        MOVR    R0,     R2                      ; 6E4A   0082
        MVO     R0,     G_01B2                  ; 6E4B   0240 01B2
        ADDI    #$01A9, R2                      ; 6E4D   02FA 01A9
        MVI     G_017E, R0                      ; 6E4F   0280 017E
        CMPI    #$00FF, R0                      ; 6E51   0378 00FF
        BNEQ    L_6E5B                          ; 6E53   020C 0006

        MVI@    R2,     R0                      ; 6E55   0290
        SDBD                                    ; 6E56   0001
        ANDI    #$FFF9, R0                      ; 6E57   03B8 00F9 00FF
        MVO@    R0,     R2                      ; 6E5A   0250
L_6E5B:
        CLRR    R0                              ; 6E5B   01C0
        COMR    R0                              ; 6E5C   0018
        MVO     R0,     G_01B9                  ; 6E5D   0240 01B9
        MVII    #$0002, R0                      ; 6E5F   02B8 0002
        MVO     R0,     G_01BB                  ; 6E61   0240 01BB
        MVI     G_01D1, R0                      ; 6E63   0280 01D1
        ANDI    #$007F, R0                      ; 6E65   03B8 007F
        CMP     G_01D1, R0                      ; 6E67   0340 01D1
        BEQ     L_6EED                          ; 6E69   0204 0082

        MVO     R0,     G_01D1                  ; 6E6B   0240 01D1
        MVI     G_01BA, R0                      ; 6E6D   0280 01BA
        CMPI    #$0080, R0                      ; 6E6F   0378 0080
        BNEQ    L_6EAD                          ; 6E71   020C 003A

        SDBD                                    ; 6E73   0001
        MVII    #$6EE8, R5                      ; 6E74   02BD 00E8 006E
        PSHR    R5                              ; 6E77   0275
        MVI     G_01D2, R4                      ; 6E78   0284 01D2
        ADDI    #$01C6, R4                      ; 6E7A   02FC 01C6
        MVI@    R4,     R0                      ; 6E7C   02A0
        ANDI    #$0080, R0                      ; 6E7D   03B8 0080
        BNEQ    L_6E93                          ; 6E7F   020C 0012

        MVI     G_01D2, R0                      ; 6E81   0280 01D2
        PSHR    R0                              ; 6E83   0270
        SDBD                                    ; 6E84   0001
        MVII    #$5F3C, R3                      ; 6E85   02BB 003C 005F
        MVI     G_01A6, R0                      ; 6E88   0280 01A6
        CMPI    #$001A, R0                      ; 6E8A   0378 001A
        BLT     L_6E90                          ; 6E8C   0205 0002

        ADDI    #$0005, R3                      ; 6E8E   02FB 0005
L_6E90:
        J       L_5EE9                          ; 6E90   0004 035C 02E9

L_6E93:
        MVI     G_035C, R4                      ; 6E93   0284 035C
        MVI     G_0354, R5                      ; 6E95   0285 0354
        MVI     G_01D2, R3                      ; 6E97   0283 01D2
        MVII    #$003C, R0                      ; 6E99   02B8 003C
        SDBD                                    ; 6E9B   0001
        CMPI    #$6C49, R5                      ; 6E9C   037D 0049 006C
        BEQ     L_6EA9                          ; 6E9F   0204 0008

        SDBD                                    ; 6EA1   0001
        CMPI    #$6D33, R5                      ; 6EA2   037D 0033 006D
        BEQ     L_6EAB                          ; 6EA5   0204 0004

        MVII    #$002D, R0                      ; 6EA7   02B8 002D
L_6EA9:
        B       L_6CAF                          ; 6EA9   0220 01FB
L_6EAB:
        B       L_6C1E                          ; 6EAB   0220 028E

L_6EAD:
        SUBI    #$01A9, R2                      ; 6EAD   033A 01A9
        MOVR    R2,     R3                      ; 6EAF   0093
        CLRR    R4                              ; 6EB0   01E4
        CMPI    #$0003, R2                      ; 6EB1   037A 0003
        BLT     L_6EB7                          ; 6EB3   0205 0002

        ADDI    #$0008, R4                      ; 6EB5   02FC 0008
L_6EB7:
        CLRR    R0                              ; 6EB7   01C0

        JSR     R5,     L_DA3D                  ; 6EB8   0004 01D8 023D

        BNC     L_6EBF                          ; 6EBB   0209 0002

        XORI    #$0008, R4                      ; 6EBD   03FC 0008
L_6EBF:
        PSHR    R4                              ; 6EBF   0274
        MVII    #$003C, R0                      ; 6EC0   02B8 003C

        JSR     R5,     L_6C1D                  ; 6EC2   0004 016C 001D

        PULR    R4                              ; 6EC5   02B4
        MVI     G_01BA, R1                      ; 6EC6   0281 01BA
        CMPI    #$0010, R1                      ; 6EC8   0379 0010
        BNEQ    L_6EE8                          ; 6ECA   020C 001C

        MVII    #$0090, R1                      ; 6ECC   02B9 0090
        TSTR    R4                              ; 6ECE   00A4
        BNEQ    L_6ED3                          ; 6ECF   020C 0002

        MVII    #$006F, R1                      ; 6ED1   02B9 006F
L_6ED3:
        SWAP    R1,     1                       ; 6ED3   0041
        MVII    #$0001, R0                      ; 6ED4   02B8 0001

        JSR     R5,     X_RAND1                 ; 6ED6   0004 0114 027D

        MVII    #$00F9, R2                      ; 6ED9   02BA 00F9
        TSTR    R0                              ; 6EDB   0080
        BEQ     L_6EE0                          ; 6EDC   0204 0002

        MVII    #$0008, R2                      ; 6EDE   02BA 0008
L_6EE0:
        XORR    R2,     R1                      ; 6EE0   01D1
        MVO     R1,     G_0351                  ; 6EE1   0241 0351
        MVII    #$0028, R0                      ; 6EE3   02B8 0028
        MVO     R0,     G_0353                  ; 6EE5   0240 0353
        PULR    R7                              ; 6EE7   02B7

L_6EE8:
        MVII    #$0004, R0                      ; 6EE8   02B8 0004
        MVO     R0,     G_01BA                  ; 6EEA   0240 01BA
        PULR    R7                              ; 6EEC   02B7

L_6EED:
        MVII    #$0004, R0                      ; 6EED   02B8 0004
        MVO     R0,     G_01BA                  ; 6EEF   0240 01BA
        MVII    #$0002, R0                      ; 6EF1   02B8 0002
        MVII    #$002D, R1                      ; 6EF3   02B9 002D

        JSR     R5,     X_RAND2                 ; 6EF5   0004 0114 029E

        TSTR    R0                              ; 6EF8   0080
        BEQ     L_6EFC                          ; 6EF9   0204 0001

        NEGR    R1                              ; 6EFB   0021
L_6EFC:
        ANDI    #$00FF, R1                      ; 6EFC   03B9 00FF
        MVO     R1,     G_0351                  ; 6EFE   0241 0351

        JSR     R5,     L_58A8                  ; 6F00   0004 0158 00A8

        MVII    #$000A, R0                      ; 6F03   02B8 000A
        MVO     R0,     G_012B                  ; 6F05   0240 012B

L_6F07:
        JSR     R5,     L_D0FD                  ; 6F07   0004 01D0 00FD

        PULR    R7                              ; 6F0A   02B7

        PSHR    R5                              ; 6F0B   0275
        MVI     G_01BA, R5                      ; 6F0C   0285 01BA
        CMPI    #$0040, R5                      ; 6F0E   037D 0040
        BNEQ    L_6F1F                          ; 6F10   020C 000D

        CMPI    #$0003, R0                      ; 6F12   0378 0003
        BNEQ    L_6F1E                          ; 6F14   020C 0008

        MVI     G_01BB, R5                      ; 6F16   0285 01BB
        TSTR    R5                              ; 6F18   00AD
        BEQ     L_6F1E                          ; 6F19   0204 0003

        JSR     R5,     L_557B                  ; 6F1B   0004 0154 017B

L_6F1E:
        PULR    R7                              ; 6F1E   02B7

L_6F1F:
        MVI     G_01BA, R5                      ; 6F1F   0285 01BA
        SDBD                                    ; 6F21   0001
        ANDI    #$0025, R5                      ; 6F22   03BD 0025 0000
        BEQ     L_6FBA                          ; 6F25   0204 0093

        MVII    #$01C2, R5                      ; 6F27   02BD 01C2
        CLRR    R2                              ; 6F29   01D2
        TSTR    R1                              ; 6F2A   0089
        BEQ     L_6F30                          ; 6F2B   0204 0003

        MVII    #$0003, R2                      ; 6F2D   02BA 0003
        INCR    R5                              ; 6F2F   000D
L_6F30:
        MVI     G_015E, R4                      ; 6F30   0284 015E
        ANDI    #$0020, R4                      ; 6F32   03BC 0020
        BEQ     L_6F37                          ; 6F34   0204 0001

        INCR    R2                              ; 6F36   000A
L_6F37:
        MOVR    R2,     R0                      ; 6F37   0090
        ADDI    #$01C6, R2                      ; 6F38   02FA 01C6
        MVI@    R2,     R4                      ; 6F3A   0294
        ANDI    #$0080, R4                      ; 6F3B   03BC 0080
        BEQ     L_6FBA                          ; 6F3D   0204 007B

        SDBD                                    ; 6F3F   0001
        ADDI    #$FFE3, R2                      ; 6F40   02FA 00E3 00FF
        MVI@    R2,     R4                      ; 6F43   0294
        ANDI    #$0004, R4                      ; 6F44   03BC 0004
        BNEQ    L_6FBA                          ; 6F46   020C 0072

        MVI@    R5,     R3                      ; 6F48   02AB
        INCR    R3                              ; 6F49   000B
        MOVR    R3,     R4                      ; 6F4A   009C
        MOVR    R5,     R2                      ; 6F4B   00AA

        JSR     R5,     L_6FBB                  ; 6F4C   0004 016C 03BB

        BEQ     L_6F59                          ; 6F4F   0204 0008

        XORI    #$0003, R4                      ; 6F51   03FC 0003
        MOVR    R4,     R3                      ; 6F53   00A3

        JSR     R5,     L_6FBB                  ; 6F54   0004 016C 03BB

        BNEQ    L_6FBA                          ; 6F57   020C 0061

L_6F59:
        SUBI    #$01A9, R3                      ; 6F59   033B 01A9
        MVII    #$01B9, R1                      ; 6F5B   02B9 01B9
        CMP@    R1,     R0                      ; 6F5D   0348
        BEQ     L_6F65                          ; 6F5E   0204 0005

        CMP@    R1,     R3                      ; 6F60   034B
        BNEQ    L_6F69                          ; 6F61   020C 0006

        MOVR    R0,     R4                      ; 6F63   0084
        INCR    R7                              ; 6F64   000F

L_6F65:
        MOVR    R3,     R4                      ; 6F65   009C
L_6F66:
        MVO@    R4,     R1                      ; 6F66   024C
        MVO     R4,     G_01B2                  ; 6F67   0244 01B2
L_6F69:
        PSHR    R2                              ; 6F69   0272
        PSHR    R0                              ; 6F6A   0270
        PSHR    R3                              ; 6F6B   0273

        JSR     R5,     .EXEC.76C               ; 6F6C   0004 0114 036C

        SLL     R3,     2                       ; 6F6F   004F
        SLL     R3,     1                       ; 6F70   004B
        ADDI    #$031D, R3                      ; 6F71   02FB 031D
        MOVR    R1,     R2                      ; 6F73   008A
        INCR    R2                              ; 6F74   000A
        INCR    R3                              ; 6F75   000B
        MVII    #$0007, R4                      ; 6F76   02BC 0007
L_6F78:
        MVI@    R2,     R0                      ; 6F78   0290
        MVI@    R3,     R1                      ; 6F79   0299
        MVO@    R0,     R3                      ; 6F7A   0258
        MVO@    R1,     R2                      ; 6F7B   0251
        INCR    R2                              ; 6F7C   000A
        INCR    R3                              ; 6F7D   000B
        DECR    R4                              ; 6F7E   0014
        BNEQ    L_6F78                          ; 6F7F   022C 0008

        MVI     G_01BA, R0                      ; 6F81   0280 01BA
        CMPI    #$0004, R0                      ; 6F83   0378 0004
        BNEQ    L_6F8F                          ; 6F85   020C 0008

        DECR    R2                              ; 6F87   0012
        DECR    R2                              ; 6F88   0012
        DECR    R3                              ; 6F89   0013
        DECR    R3                              ; 6F8A   0013
        MVII    #$0002, R0                      ; 6F8B   02B8 0002
        MVO@    R0,     R2                      ; 6F8D   0250
        MVO@    R0,     R3                      ; 6F8E   0258
L_6F8F:
        PULR    R1                              ; 6F8F   02B1
        PULR    R2                              ; 6F90   02B2
        PULR    R5                              ; 6F91   02B5
        DECR    R5                              ; 6F92   0015
        CLRR    R3                              ; 6F93   01DB
        CMPI    #$0002, R1                      ; 6F94   0379 0002
        BEQ     L_6F9F                          ; 6F96   0204 0007
        BLT     L_6F9E                          ; 6F98   0205 0004

        CMPI    #$0005, R1                      ; 6F9A   0379 0005
        BEQ     L_6F9F                          ; 6F9C   0204 0001

L_6F9E:
        INCR    R3                              ; 6F9E   000B
L_6F9F:
        MVO@    R3,     R5                      ; 6F9F   026B
        ADDI    #$01A9, R1                      ; 6FA0   02F9 01A9
        ADDI    #$01A9, R2                      ; 6FA2   02FA 01A9
        MVI@    R1,     R0                      ; 6FA4   0288
        MVI@    R2,     R3                      ; 6FA5   0293
        MVI     G_01BA, R5                      ; 6FA6   0285 01BA
        CMPI    #$0004, R5                      ; 6FA8   037D 0004
        BNEQ    L_6FB8                          ; 6FAA   020C 000C

        SDBD                                    ; 6FAC   0001
        ANDI    #$FFDF, R0                      ; 6FAD   03B8 00DF 00FF
        XORI    #$0020, R0                      ; 6FB0   03F8 0020
        SDBD                                    ; 6FB2   0001
        ANDI    #$FFDF, R3                      ; 6FB3   03BB 00DF 00FF
        XORI    #$0020, R3                      ; 6FB6   03FB 0020
L_6FB8:
        MVO@    R3,     R1                      ; 6FB8   024B
        MVO@    R0,     R2                      ; 6FB9   0250
L_6FBA:
        PULR    R7                              ; 6FBA   02B7

L_6FBB:
        PSHR    R5                              ; 6FBB   0275
        ADDR    R0,     R3                      ; 6FBC   00C3
        ADDI    #$01C6, R3                      ; 6FBD   02FB 01C6
        MVI@    R3,     R1                      ; 6FBF   0299
        ANDI    #$0080, R1                      ; 6FC0   03B9 0080
        BNEQ    L_6FCD                          ; 6FC2   020C 0009

        SDBD                                    ; 6FC4   0001
        ADDI    #$FFE3, R3                      ; 6FC5   02FB 00E3 00FF
        MVI@    R3,     R1                      ; 6FC8   0299
        SDBD                                    ; 6FC9   0001
        ANDI    #$0006, R1                      ; 6FCA   03B9 0006 0000
L_6FCD:
        PULR    R7                              ; 6FCD   02B7

L_6FCE:
        CMPI    #$0003, R2                      ; 6FCE   037A 0003
        BLT     L_6FD7                          ; 6FD0   0205 0005

        CMPI    #$0003, R0                      ; 6FD2   0378 0003
        BLT     L_6FDC                          ; 6FD4   0205 0006
        MOVR    R5,     R7                      ; 6FD6   00AF

L_6FD7:
        CMPI    #$0003, R0                      ; 6FD7   0378 0003
        BGE     L_6FDC                          ; 6FD9   020D 0001
        MOVR    R5,     R7                      ; 6FDB   00AF
L_6FDC:
        PULR    R7                              ; 6FDC   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000

        PSHR    R5                              ; D000   0275

        JSR     R5,     X_PLAY_SFX1             ; D001   0004 0118 03BB
        DECLE   $0399                           ; D004  SFX data
        DECLE   $0248,  $023B                   ; D005  SFX data
        DECLE   $0254,  $0076                   ; D007  SFX data
        DECLE   $008F,  $0011                   ; D009  SFX data
        DECLE   $0025                           ; D00B  SFX data
        DECLE   $0015                           ; D00C  SFX data
        DECLE   $006B                           ; D00D  SFX data
        DECLE   $0248,  $02A7                   ; D00E  SFX data
        DECLE   $0254,  $014E                   ; D010  SFX data
        DECLE   $01EB                           ; D012  SFX data
        DECLE   $0025                           ; D013  SFX data
        DECLE   $0015                           ; D014  SFX data
        DECLE   $006B                           ; D015  SFX data
        DECLE   $0248,  $02A7                   ; D016  SFX data
        DECLE   $0254,  $014E                   ; D018  SFX data
        DECLE   $01EB                           ; D01A  SFX data
        DECLE   $0025                           ; D01B  SFX data
        DECLE   $0015                           ; D01C  SFX data
        DECLE   $006B                           ; D01D  SFX data
        DECLE   $0248,  $02A7                   ; D01E  SFX data
        DECLE   $0254,  $014E                   ; D020  SFX data
        DECLE   $008F,  $0011                   ; D022  SFX data
        DECLE   $0025                           ; D024  SFX data
        DECLE   $0015                           ; D025  SFX data
        DECLE   $006B                           ; D026  SFX data
        DECLE   $0248,  $023B                   ; D027  SFX data
        DECLE   $0254,  $0076                   ; D029  SFX data
        DECLE   $008F,  $0011                   ; D02B  SFX data
        DECLE   $0025                           ; D02D  SFX data
        DECLE   $0015                           ; D02E  SFX data
        DECLE   $006B                           ; D02F  SFX data
        DECLE   $0248,  $02A7                   ; D030  SFX data
        DECLE   $0254,  $014E                   ; D032  SFX data
        DECLE   $01EB                           ; D034  SFX data
        DECLE   $0025                           ; D035  SFX data
        DECLE   $0015                           ; D036  SFX data
        DECLE   $006B                           ; D037  SFX data
        DECLE   $0248,  $02A7                   ; D038  SFX data
        DECLE   $0254,  $014E                   ; D03A  SFX data
        DECLE   $01EB                           ; D03C  SFX data
        DECLE   $0025                           ; D03D  SFX data
        DECLE   $0015                           ; D03E  SFX data
        DECLE   $006B                           ; D03F  SFX data
        DECLE   $0248,  $02A7                   ; D040  SFX data
        DECLE   $0254,  $014E                   ; D042  SFX data
        DECLE   $008F,  $0011                   ; D044  SFX data
        DECLE   $0025                           ; D046  SFX data
        DECLE   $0015                           ; D047  SFX data
        DECLE   $006B                           ; D048  SFX data
        DECLE   $0248,  $0281                   ; D049  SFX data
        DECLE   $0254,  $0102                   ; D04B  SFX data
        DECLE   $008F,  $0011                   ; D04D  SFX data
        DECLE   $0025                           ; D04F  SFX data
        DECLE   $0015                           ; D050  SFX data
        DECLE   $006B                           ; D051  SFX data
        DECLE   $0248,  $02FA                   ; D052  SFX data
        DECLE   $0254,  $01F4                   ; D054  SFX data
        DECLE   $008F,  $0025                   ; D056  SFX data
        DECLE   $0025                           ; D058  SFX data
        DECLE   $0015                           ; D059  SFX data
        DECLE   $006B                           ; D05A  SFX data
        DECLE   $012B                           ; D05B  SFX data
        DECLE   $0258,  $0076                   ; D05C  SFX data
        DECLE   $0264,  $00EC                   ; D05E  SFX data
        DECLE   $008F,  $0011                   ; D060  SFX data
        DECLE   $0025                           ; D062  SFX data
        DECLE   $0015                           ; D063  SFX data
        DECLE   $006B                           ; D064  SFX data
        DECLE   $0248,  $02FA                   ; D065  SFX data
        DECLE   $0254,  $01F4                   ; D067  SFX data
        DECLE   $01EB                           ; D069  SFX data
        DECLE   $0025                           ; D06A  SFX data
        DECLE   $0015                           ; D06B  SFX data
        DECLE   $006B                           ; D06C  SFX data
        DECLE   $0248,  $02FA                   ; D06D  SFX data
        DECLE   $0254,  $01F4                   ; D06F  SFX data
        DECLE   $01EB                           ; D071  SFX data
        DECLE   $0025                           ; D072  SFX data
        DECLE   $0015                           ; D073  SFX data
        DECLE   $006B                           ; D074  SFX data
        DECLE   $0248,  $02FA                   ; D075  SFX data
        DECLE   $0254,  $01F4                   ; D077  SFX data
        DECLE   $008F,  $0011                   ; D079  SFX data
        DECLE   $0025                           ; D07B  SFX data
        DECLE   $0015                           ; D07C  SFX data
        DECLE   $006B                           ; D07D  SFX data
        DECLE   $0258,  $0076                   ; D07E  SFX data
        DECLE   $0264,  $00EC                   ; D080  SFX data
        DECLE   $008F,  $0011                   ; D082  SFX data
        DECLE   $0025                           ; D084  SFX data
        DECLE   $0015                           ; D085  SFX data
        DECLE   $006B                           ; D086  SFX data
        DECLE   $0248,  $02FA                   ; D087  SFX data
        DECLE   $0254,  $01F4                   ; D089  SFX data
        DECLE   $01EB                           ; D08B  SFX data
        DECLE   $0025                           ; D08C  SFX data
        DECLE   $0015                           ; D08D  SFX data
        DECLE   $006B                           ; D08E  SFX data
        DECLE   $0248,  $02FA                   ; D08F  SFX data
        DECLE   $0254,  $01F4                   ; D091  SFX data
        DECLE   $01EB                           ; D093  SFX data
        DECLE   $0025                           ; D094  SFX data
        DECLE   $0015                           ; D095  SFX data
        DECLE   $006B                           ; D096  SFX data
        DECLE   $0248,  $02FA                   ; D097  SFX data
        DECLE   $0254,  $01F4                   ; D099  SFX data
        DECLE   $008F,  $0011                   ; D09B  SFX data
        DECLE   $0025                           ; D09D  SFX data
        DECLE   $0015                           ; D09E  SFX data
        DECLE   $006B                           ; D09F  SFX data
        DECLE   $0248,  $02A7                   ; D0A0  SFX data
        DECLE   $0254,  $014E                   ; D0A2  SFX data
        DECLE   $008F,  $0011                   ; D0A4  SFX data
        DECLE   $0025                           ; D0A6  SFX data
        DECLE   $0015                           ; D0A7  SFX data
        DECLE   $006B                           ; D0A8  SFX data
        DECLE   $0248,  $0357                   ; D0A9  SFX data
        DECLE   $0254,  $02AE                   ; D0AB  SFX data
        DECLE   $008F,  $0025                   ; D0AD  SFX data
        DECLE   $0025                           ; D0AF  SFX data
        DECLE   $0015                           ; D0B0  SFX data
        DECLE   $006B                           ; D0B1  SFX data
        DECLE   $02CF                           ; D0B2  SFX end


        PSHR    R5                              ; D0B3   0275

        JSR     R5,     X_PLAY_SFX1             ; D0B4   0004 0118 03BB
        DECLE   $0399                           ; D0B7  SFX data
        DECLE   $0248,  $023B                   ; D0B8  SFX data
        DECLE   $0254,  $0076                   ; D0BA  SFX data
        DECLE   $03AB                           ; D0BC  SFX data
        DECLE   $0025                           ; D0BD  SFX data
        DECLE   $0015                           ; D0BE  SFX data
        DECLE   $012B                           ; D0BF  SFX data
        DECLE   $0265                           ; D0C0  SFX data
        DECLE   $0255                           ; D0C1  SFX data
        DECLE   $03AB                           ; D0C2  SFX data
        DECLE   $0025                           ; D0C3  SFX data
        DECLE   $0015                           ; D0C4  SFX data
        DECLE   $012B                           ; D0C5  SFX data
        DECLE   $0265                           ; D0C6  SFX data
        DECLE   $0255                           ; D0C7  SFX data
        DECLE   $01AB                           ; D0C8  SFX data
        DECLE   $0025                           ; D0C9  SFX data
        DECLE   $0015                           ; D0CA  SFX data
        DECLE   $00AB                           ; D0CB  SFX data
        DECLE   $0265                           ; D0CC  SFX data
        DECLE   $0255                           ; D0CD  SFX data
        DECLE   $01AB                           ; D0CE  SFX data
        DECLE   $0025                           ; D0CF  SFX data
        DECLE   $0015                           ; D0D0  SFX data
        DECLE   $00AB                           ; D0D1  SFX data
        DECLE   $0265                           ; D0D2  SFX data
        DECLE   $0255                           ; D0D3  SFX data
        DECLE   $01AB                           ; D0D4  SFX data
        DECLE   $0025                           ; D0D5  SFX data
        DECLE   $0015                           ; D0D6  SFX data
        DECLE   $032B                           ; D0D7  SFX data
        DECLE   $0265                           ; D0D8  SFX data
        DECLE   $0255                           ; D0D9  SFX data
        DECLE   $01AB                           ; D0DA  SFX data
        DECLE   $0025                           ; D0DB  SFX data
        DECLE   $0015                           ; D0DC  SFX data
        DECLE   $00AB                           ; D0DD  SFX data
        DECLE   $0265                           ; D0DE  SFX data
        DECLE   $0255                           ; D0DF  SFX data
        DECLE   $01AB                           ; D0E0  SFX data
        DECLE   $0025                           ; D0E1  SFX data
        DECLE   $0015                           ; D0E2  SFX data
        DECLE   $00AB                           ; D0E3  SFX data
        DECLE   $0265                           ; D0E4  SFX data
        DECLE   $0255                           ; D0E5  SFX data
        DECLE   $01AB                           ; D0E6  SFX data
        DECLE   $0025                           ; D0E7  SFX data
        DECLE   $0015                           ; D0E8  SFX data
        DECLE   $00AB                           ; D0E9  SFX data
        DECLE   $0265                           ; D0EA  SFX data
        DECLE   $0255                           ; D0EB  SFX data
        DECLE   $01AB                           ; D0EC  SFX data
        DECLE   $0025                           ; D0ED  SFX data
        DECLE   $0015                           ; D0EE  SFX data
        DECLE   $032B                           ; D0EF  SFX data
        DECLE   $0265                           ; D0F0  SFX data
        DECLE   $0255                           ; D0F1  SFX data
        DECLE   $01AB                           ; D0F2  SFX data
        DECLE   $0025                           ; D0F3  SFX data
        DECLE   $0015                           ; D0F4  SFX data
        DECLE   $00AB                           ; D0F5  SFX data
        DECLE   $0265                           ; D0F6  SFX data
        DECLE   $0255                           ; D0F7  SFX data
        DECLE   $03AB                           ; D0F8  SFX data
        DECLE   $0025                           ; D0F9  SFX data
        DECLE   $0015                           ; D0FA  SFX data
        DECLE   $012B                           ; D0FB  SFX data
        DECLE   $02CF                           ; D0FC  SFX end

L_D0FD:
        PSHR    R5                              ; D0FD   0275

        JSR     R5,     X_PLAY_SFX2             ; D0FE   0004 0118 03BE
        DECLE   $0028                           ; D101  SFX prio
        DECLE   $03E9                           ; D102  SFX data
        DECLE   $0040,  $0328                   ; D103  SFX data
        DECLE   $001B                           ; D105  SFX data
        DECLE   $000C,  $0108                   ; D106  SFX data
        DECLE   $000B                           ; D108  SFX data
        DECLE   $03CF                           ; D109  SFX end


        MOVR    R3,     R0                      ; D10A   0098
        ADDR    R2,     R1                      ; D10B   00D1
        MOVR    R3,     R1                      ; D10C   0099
        ADDR    R2,     R1                      ; D10D   00D1
        MOVR    R5,     R4                      ; D10E   00AC
        ADDR    R2,     R1                      ; D10F   00D1
        MOVR    R7,     R4                      ; D110   00BC
        ADDR    R2,     R1                      ; D111   00D1
        ADDR    R1,     R1                      ; D112   00C9
        ADDR    R2,     R1                      ; D113   00D1
        ADDR    R2,     R3                      ; D114   00D3
        ADDR    R2,     R1                      ; D115   00D1
        ADDR    R4,     R6                      ; D116   00E6
        ADDR    R2,     R1                      ; D117   00D1
        ADDR    R7,     R4                      ; D118   00FC
        ADDR    R2,     R1                      ; D119   00D1
        DECR    R2                              ; D11A   0012
        ADDR    R2,     R2                      ; D11B   00D2
        NEGR    R5                              ; D11C   0025
        ADDR    R2,     R2                      ; D11D   00D2
        RSWD    R0                              ; D11E   0038
        ADDR    R2,     R2                      ; D11F   00D2
        SLL     R0,     1                       ; D120   0048
        ADDR    R2,     R2                      ; D121   00D2
        RLC     R2,     1                       ; D122   0052
        ADDR    R2,     R2                      ; D123   00D2
        SLLC    R0,     2                       ; D124   005C
        ADDR    R2,     R2                      ; D125   00D2
        SLR     R2,     2                       ; D126   0066
        ADDR    R2,     R2                      ; D127   00D2
        RRC     R0,     1                       ; D128   0070
        ADDR    R2,     R2                      ; D129   00D2
        RRC     R0,     2                       ; D12A   0074
        ADDR    R2,     R2                      ; D12B   00D2
        SARC    R0,     1                       ; D12C   0078
        ADDR    R2,     R2                      ; D12D   00D2
        SARC    R0,     2                       ; D12E   007C
        ADDR    R2,     R2                      ; D12F   00D2
        TSTR    R0                              ; D130   0080
        ADDR    R2,     R2                      ; D131   00D2
        MOVR    R0,     R4                      ; D132   0084
        ADDR    R2,     R2                      ; D133   00D2
        MOVR    R1,     R0                      ; D134   0088
        ADDR    R2,     R2                      ; D135   00D2
        TSTR    R1                              ; D136   0089
        ADDR    R2,     R2                      ; D137   00D2
        MOVR    R1,     R5                      ; D138   008D
        ADDR    R2,     R2                      ; D139   00D2
        MOVR    R2,     R1                      ; D13A   0091
        ADDR    R2,     R2                      ; D13B   00D2
        MOVR    R2,     R5                      ; D13C   0095
        ADDR    R2,     R2                      ; D13D   00D2
        MOVR    R2,     R6                      ; D13E   0096
        ADDR    R2,     R2                      ; D13F   00D2
        MOVR    R2,     R7                      ; D140   0097

        ADDR    R2,     R2                      ; D141   00D2
        TSTR    R3                              ; D142   009B
        ADDR    R2,     R2                      ; D143   00D2
        MOVR    R3,     R7                      ; D144   009F

        DECLE   $00D2,  $00A3,  $00D2,  $00AA   ; D145   00D2 00A3 00D2 00AA
        DECLE   $00D2,  $00B7,  $00D2,  $00C1   ; D149   00D2 00B7 00D2 00C1
        DECLE   $00D2,  $00C8,  $00D2,  $00D2   ; D14D   00D2 00C8 00D2 00D2
        DECLE   $00D2,  $00F7,  $00D2,  $0001   ; D151   00D2 00F7 00D2 0001
        DECLE   $00D3,  $0008,  $00D3,  $0012   ; D155   00D3 0008 00D3 0012
        DECLE   $00D3,  $001F,  $00D3,  $0026   ; D159   00D3 001F 00D3 0026
        DECLE   $00D3,  $002A,  $00D3,  $002E   ; D15D   00D3 002A 00D3 002E
        DECLE   $00D3,  $0000,  $0000,  $0032   ; D161   00D3 0000 0000 0032
        DECLE   $00D3,  $0036,  $00D3,  $003A   ; D165   00D3 0036 00D3 003A
        DECLE   $00D3,  $003E,  $00D3,  $003F   ; D169   00D3 003E 00D3 003F

        ADDR    R2,     R3                      ; D16D   00D3
        SWAP    R0,     1                       ; D16E   0040
        ADDR    R2,     R3                      ; D16F   00D3
        SWAP    R1,     1                       ; D170   0041
        ADDR    R2,     R3                      ; D171   00D3
        SWAP    R1,     2                       ; D172   0045
        ADDR    R2,     R3                      ; D173   00D3
        SLL     R1,     1                       ; D174   0049
        ADDR    R2,     R3                      ; D175   00D3
        SLL     R1,     2                       ; D176   004D
        ADDR    R2,     R3                      ; D177   00D3
        RLC     R1,     1                       ; D178   0051
        ADDR    R2,     R3                      ; D179   00D3
        RLC     R1,     2                       ; D17A   0055
        ADDR    R2,     R3                      ; D17B   00D3
        SLLC    R3,     2                       ; D17C   005F
        ADDR    R2,     R3                      ; D17D   00D3
        SAR     R1,     1                       ; D17E   0069
        ADDR    R2,     R3                      ; D17F   00D3
        RRC     R3,     1                       ; D180   0073
        ADDR    R2,     R3                      ; D181   00D3
        SARC    R1,     2                       ; D182   007D
        ADDR    R2,     R3                      ; D183   00D3
        MOVR    R1,     R5                      ; D184   008D
        ADDR    R2,     R3                      ; D185   00D3
        MOVR    R4,     R0                      ; D186   00A0
        ADDR    R2,     R3                      ; D187   00D3
        MOVR    R6,     R3                      ; D188   00B3
        ADDR    R2,     R3                      ; D189   00D3
        ADDR    R1,     R1                      ; D18A   00C9
        ADDR    R2,     R3                      ; D18B   00D3
        ADDR    R3,     R7                      ; D18C   00DF

        DECLE   $00D3,  $00F2,  $00D3,  $00FF   ; D18D   00D3 00F2 00D3 00FF
        DECLE   $00D3,  $000C,  $00D4,  $001C   ; D191   00D3 000C 00D4 001C
        DECLE   $00D4,  $002F,  $00D4,  $00FF   ; D195   00D4 002F 00D4 00FF
        DECLE   $0000,  $007C,  $0006,  $0014   ; D199   0000 007C 0006 0014
        DECLE   $007C,  $0006,  $0014,  $0032   ; D19D   007C 0006 0014 0032
        DECLE   $000E,  $0014,  $0034,  $000C   ; D1A1   000E 0014 0034 000C
        DECLE   $0014,  $0035                   ; D1A5   0014 0035

        ADCR    R0                              ; D1A7   0028
        SARC    R0,     1                       ; D1A8   0078
        ADDR    R5,     R7                      ; D1A9   00EF

        DECLE   $002A,  $00FF,  $0000,  $007C   ; D1AA   002A 00FF 0000 007C
        DECLE   $0006,  $0014,  $0032,  $000E   ; D1AE   0006 0014 0032 000E
        DECLE   $0014,  $0034,  $000C,  $0014   ; D1B2   0014 0034 000C 0014
        DECLE   $0035,  $0028,  $0078,  $007F   ; D1B6   0035 0028 0078 007F
        DECLE   $0022,  $00FF,  $0000,  $0032   ; D1BA   0022 00FF 0000 0032
        DECLE   $000E,  $0014,  $0034,  $000C   ; D1BE   000E 0014 0034 000C
        DECLE   $0014,  $0035,  $0028,  $0078   ; D1C2   0014 0035 0028 0078
        DECLE   $007F,  $0022,  $00FF,  $0014   ; D1C6   007F 0022 00FF 0014
        DECLE   $0000,  $0020,  $0050,  $0007   ; D1CA   0000 0020 0050 0007
        DECLE   $002B,  $0028,  $001F,  $002A   ; D1CE   002B 0028 001F 002A
        DECLE   $00FF,  $0000,  $0007,  $0002   ; D1D2   00FF 0000 0007 0002
        DECLE   $0014,  $0000                   ; D1D6   0014 0000

        NEGR    R0                              ; D1D8   0020
        RSWD    R4                              ; D1D9   003C
L_D1DA:
        DECR    R7                              ; D1DA   0017

        ADCR    R3                              ; D1DB   002B
        DECR    R4                              ; D1DC   0014
        INCR    R7                              ; D1DD   000F

        ADCR    R3                              ; D1DE   002B
L_D1DF:
        DECR    R4                              ; D1DF   0014
        DECLE   $001F,  $002A,  $0014,  $0007   ; D1E0   001F 002A 0014 0007
        DECLE   $002A,  $00FF,  $0000,  $0047   ; D1E4   002A 00FF 0000 0047
        DECLE   $000A,  $0014,  $0007,  $0020   ; D1E8   000A 0014 0007 0020
        DECLE   $0028,  $0027,  $002B,  $0014   ; D1EC   0028 0027 002B 0014
        DECLE   $001F,  $002B,  $0014,  $007F   ; D1F0   001F 002B 0014 007F
        DECLE   $0022,  $0014,  $0007,  $002A   ; D1F4   0022 0014 0007 002A
        DECLE   $0014,  $0007,  $002A,  $00FF   ; D1F8   0014 0007 002A 00FF
        DECLE   $0000,  $004F,  $000A,  $0014   ; D1FC   0000 004F 000A 0014
        DECLE   $0000                           ; D200   0000

        NEGR    R0                              ; D201   0020
        DECR    R4                              ; D202   0014
        ADCR    R7                              ; D203   002F

        ADCR    R3                              ; D204   002B
L_D205:
        DECR    R4                              ; D205   0014
        DECLE   $0047,  $002B,  $0014,  $007F   ; D206   0047 002B 0014 007F
        DECLE   $0022,  $0028,  $007F,  $0022   ; D20A   0022 0028 007F 0022
        DECLE   $0014,  $0007,  $002A,  $00FF   ; D20E   0014 0007 002A 00FF
        DECLE   $0000,  $0057,  $000A,  $0014   ; D212   0000 0057 000A 0014
        DECLE   $0000,  $0020,  $0028,  $0067   ; D216   0000 0020 0028 0067
        DECLE   $002B,  $0014,  $00D5,  $000A   ; D21A   002B 0014 00D5 000A
        DECLE   $0014,  $007F,  $0022,  $0028   ; D21E   0014 007F 0022 0028
        DECLE   $0007,  $002A,  $00FF,  $0000   ; D222   0007 002A 00FF 0000
        DECLE   $005F,  $000A,  $0014,  $0000   ; D226   005F 000A 0014 0000
        DECLE   $0020,  $0014,  $001F,  $002A   ; D22A   0020 0014 001F 002A
        DECLE   $0014,  $006F,  $002B,  $0014   ; D22E   0014 006F 002B 0014
        DECLE   $007F,  $0022,  $003C,  $0007   ; D232   007F 0022 003C 0007
        DECLE   $002A,  $00FF,  $0000,  $0067   ; D236   002A 00FF 0000 0067
        DECLE   $000A,  $0014,  $004F,  $0029   ; D23A   000A 0014 004F 0029
        DECLE   $0014,  $0057,  $002B,  $0014   ; D23E   0014 0057 002B 0014
        DECLE   $005F,  $002B,  $0050,  $007F   ; D242   005F 002B 0050 007F
        DECLE   $0022,  $00FF,  $0000,  $005F   ; D246   0022 00FF 0000 005F
        DECLE   $000A,  $0028,  $0007,  $002A   ; D24A   000A 0028 0007 002A
        DECLE   $0050,  $007F,  $0022,  $00FF   ; D24E   0050 007F 0022 00FF
        DECLE   $0000,  $006F,  $000A,  $0028   ; D252   0000 006F 000A 0028
        DECLE   $0007,  $002A,  $003C,  $007F   ; D256   0007 002A 003C 007F
        DECLE   $0022,  $00FF,  $0000,  $0077   ; D25A   0022 00FF 0000 0077
        DECLE   $000A,  $0028,  $0007,  $002A   ; D25E   000A 0028 0007 002A
        DECLE   $0028,  $007F,  $0022,  $00FF   ; D262   0028 007F 0022 00FF
        DECLE   $0000,  $007F,  $000A,  $0028   ; D266   0000 007F 000A 0028
        DECLE   $0007,  $002A,  $0014,  $007F   ; D26A   0007 002A 0014 007F
        DECLE   $0022,  $00FF,  $0000,  $0087   ; D26E   0022 00FF 0000 0087
        DECLE   $000A,  $00FF,  $0000,  $008F   ; D272   000A 00FF 0000 008F
        DECLE   $000A,  $00FF,  $0000,  $0097   ; D276   000A 00FF 0000 0097
        DECLE   $000A,  $00FF,  $0000,  $009F   ; D27A   000A 00FF 0000 009F
        DECLE   $000A,  $00FF,  $0000,  $00A7   ; D27E   000A 00FF 0000 00A7
        DECLE   $000A,  $00FF,  $0000,  $00B7   ; D282   000A 00FF 0000 00B7
        DECLE   $000A,  $00FF,  $00FF,  $0000   ; D286   000A 00FF 00FF 0000
        DECLE   $00C8,  $000E,  $00FF,  $0000   ; D28A   00C8 000E 00FF 0000
        DECLE   $00C8,  $000E,  $00FF,  $0000   ; D28E   00C8 000E 00FF 0000
        DECLE   $00C0,  $000E,  $00FF,  $00FF   ; D292   00C0 000E 00FF 00FF
        DECLE   $00FF,  $0000,  $0047,  $0015   ; D296   00FF 0000 0047 0015
        DECLE   $00FF,  $0000,  $007F,  $0015   ; D29A   00FF 0000 007F 0015
        DECLE   $00FF,  $0000,  $006F,  $0015   ; D29E   00FF 0000 006F 0015
        DECLE   $00FF,  $0000                   ; D2A2   00FF 0000

        ADCR    R7                              ; D2A4   002F

        DECR    R5                              ; D2A5   0015
L_D2A6:
        SLR     R0,     2                       ; D2A6   0064
        DECLE   $001F,  $002B,  $00FF,  $0000   ; D2A7   001F 002B 00FF 0000

        SETC                                    ; D2AB   0007
        DECR    R4                              ; D2AC   0014
        RLC     R0,     1                       ; D2AD   0050
L_D2AE:
        DECR    R7                              ; D2AE   0017

        DECLE   $002B,  $0014,  $0027,  $002B   ; D2AF   002B 0014 0027 002B
        DECLE   $0014,  $002F,  $002B,  $00FF   ; D2B3   0014 002F 002B 00FF
        DECLE   $0000                           ; D2B7   0000

        MOVR    R0,     R7                      ; D2B8   0087

        DECR    R4                              ; D2B9   0014
        RLC     R0,     1                       ; D2BA   0050
        INCR    R7                              ; D2BB   000F

        ADCR    R3                              ; D2BC   002B
L_D2BD:
        ADCR    R0                              ; D2BD   0028
        DECLE   $0037,  $002B,  $00FF,  $0050   ; D2BE   0037 002B 00FF 0050
        DECLE   $0007,  $002B,  $0028,  $003F   ; D2C2   0007 002B 0028 003F
        DECLE   $002B,  $00FF,  $0000,  $0034   ; D2C6   002B 00FF 0000 0034
        DECLE   $0008,  $003C,  $0007,  $002A   ; D2CA   0008 003C 0007 002A
        DECLE   $003C,  $0007,  $002A,  $00FF   ; D2CE   003C 0007 002A 00FF
        DECLE   $0000,  $0000                   ; D2D2   0000 0000

        NEGR    R0                              ; D2D4   0020
        DECR    R4                              ; D2D5   0014
        INCR    R7                              ; D2D6   000F

        ADCR    R0                              ; D2D7   0028
L_D2D8:
        DECR    R4                              ; D2D8   0014
L_D2D9:
        DECR    R7                              ; D2D9   0017

        ADCR    R2                              ; D2DA   002A
        DECR    R4                              ; D2DB   0014
        ADCR    R7                              ; D2DC   002F

        ADCR    R2                              ; D2DD   002A
L_D2DE:
        DECR    R4                              ; D2DE   0014
L_D2DF:
        DECR    R7                              ; D2DF   0017

        ADCR    R2                              ; D2E0   002A
        DECR    R4                              ; D2E1   0014
L_D2E2:
        DECR    R7                              ; D2E2   0017

        ADCR    R2                              ; D2E3   002A
        DECR    R4                              ; D2E4   0014
        ADCR    R7                              ; D2E5   002F

        ADCR    R2                              ; D2E6   002A
L_D2E7:
        DECR    R4                              ; D2E7   0014
L_D2E8:
        DECR    R7                              ; D2E8   0017

        ADCR    R2                              ; D2E9   002A
        DECR    R4                              ; D2EA   0014
L_D2EB:
        DECR    R7                              ; D2EB   0017

        ADCR    R2                              ; D2EC   002A
        DECR    R4                              ; D2ED   0014
L_D2EE:
        DECR    R7                              ; D2EE   0017

        ADCR    R2                              ; D2EF   002A
        DECR    R4                              ; D2F0   0014
        ADCR    R7                              ; D2F1   002F

        ADCR    R2                              ; D2F2   002A
L_D2F3:
        DECR    R4                              ; D2F3   0014
        DECLE   $000F,  $0028,  $00FF,  $0000   ; D2F4   000F 0028 00FF 0000
        DECLE   $003C,  $0008,  $003C,  $0007   ; D2F8   003C 0008 003C 0007
        DECLE   $002A,  $003C,  $0007,  $002A   ; D2FC   002A 003C 0007 002A
        DECLE   $00FF,  $0050,  $0047,  $002B   ; D300   00FF 0050 0047 002B
        DECLE   $0028,  $007F,  $002B,  $00FF   ; D304   0028 007F 002B 00FF
        DECLE   $0000,  $000F,  $0037,  $0050   ; D308   0000 000F 0037 0050
        DECLE   $004F,  $002B,  $0028,  $0077   ; D30C   004F 002B 0028 0077
        DECLE   $002B,  $00FF,  $0000,  $00BF   ; D310   002B 00FF 0000 00BF
        DECLE   $0037,  $0050,  $0057,  $002B   ; D314   0037 0050 0057 002B
        DECLE   $0014,  $0067,  $002B,  $0014   ; D318   0014 0067 002B 0014
        DECLE   $006F,  $002B,  $00FF,  $0000   ; D31C   006F 002B 00FF 0000
        DECLE   $000F,  $0037,  $0064,  $005F   ; D320   000F 0037 0064 005F
        DECLE   $002B,  $00FF,  $0000,  $00CF   ; D324   002B 00FF 0000 00CF
        DECLE   $0037,  $00FF,  $0000,  $0007   ; D328   0037 00FF 0000 0007
        DECLE   $0036,  $00FF,  $0000,  $0087   ; D32C   0036 00FF 0000 0087
        DECLE   $0036,  $00FF,  $0000,  $00C8   ; D330   0036 00FF 0000 00C8
        DECLE   $000E,  $00FF,  $0000,  $00C0   ; D334   000E 00FF 0000 00C0
        DECLE   $000E,  $00FF,  $0000,  $00C8   ; D338   000E 00FF 0000 00C8
        DECLE   $000E,  $00FF,  $00FF,  $00FF   ; D33C   000E 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0007,  $0004   ; D340   00FF 0000 0007 0004
        DECLE   $00FF,  $0000,  $0047,  $000C   ; D344   00FF 0000 0047 000C
        DECLE   $00FF,  $0000,  $004F,  $000C   ; D348   00FF 0000 004F 000C
        DECLE   $00FF,  $0000,  $0057,  $000C   ; D34C   00FF 0000 0057 000C
        DECLE   $00FF,  $0000,  $005F,  $000C   ; D350   00FF 0000 005F 000C
        DECLE   $00FF,  $0000                   ; D354   00FF 0000

        SLR     R3,     2                       ; D356   0067
        INCR    R4                              ; D357   000C
        ADCR    R0                              ; D358   0028
        SETC                                    ; D359   0007
        ADCR    R2                              ; D35A   002A
        DECR    R4                              ; D35B   0014
        ADDR    R4,     R7                      ; D35C   00E7

        DECLE   $0023,  $00FF,  $0000           ; D35D   0023 00FF 0000

        SLLC    R3,     2                       ; D360   005F
        INCR    R4                              ; D361   000C
        ADCR    R0                              ; D362   0028
        SETC                                    ; D363   0007
        ADCR    R2                              ; D364   002A
        ADCR    R0                              ; D365   0028
        ADDR    R4,     R7                      ; D366   00E7

        DECLE   $0023,  $00FF,  $0000           ; D367   0023 00FF 0000

        SAR     R3,     2                       ; D36A   006F
        INCR    R4                              ; D36B   000C
        ADCR    R0                              ; D36C   0028
        SETC                                    ; D36D   0007
        ADCR    R2                              ; D36E   002A
        RSWD    R4                              ; D36F   003C
        ADDR    R4,     R7                      ; D370   00E7

        DECLE   $0023,  $00FF,  $0000           ; D371   0023 00FF 0000

        RRC     R3,     2                       ; D374   0077
        INCR    R4                              ; D375   000C
        ADCR    R0                              ; D376   0028
        SETC                                    ; D377   0007
        ADCR    R2                              ; D378   002A
        RLC     R0,     1                       ; D379   0050
        ADDR    R4,     R7                      ; D37A   00E7

        DECLE   $0023,  $00FF,  $0000           ; D37B   0023 00FF 0000

        SARC    R3,     2                       ; D37E   007F
        INCR    R4                              ; D37F   000C
        DECR    R4                              ; D380   0014
        INCR    R7                              ; D381   000F

        ADCR    R1                              ; D382   0029
L_D383:
        DECR    R4                              ; D383   0014
L_D384:
        DECR    R7                              ; D384   0017

        DECLE   $002B,  $0014,  $001F           ; D385   002B 0014 001F

        ADCR    R3                              ; D388   002B
        RLC     R0,     1                       ; D389   0050
        ADDR    R4,     R7                      ; D38A   00E7

        DECLE   $0023,  $00FF,  $0000,  $0087   ; D38B   0023 00FF 0000 0087
        DECLE   $000C,  $0014,  $0007,  $0020   ; D38F   000C 0014 0007 0020
        DECLE   $0014,  $0027                   ; D393   0014 0027

        ADCR    R2                              ; D395   002A
        DECR    R4                              ; D396   0014
        ADCR    R7                              ; D397   002F

        ADCR    R3                              ; D398   002B
L_D399:
        DECR    R4                              ; D399   0014
        ADDR    R4,     R7                      ; D39A   00E7

        DECLE   $0023,  $003C,  $0007,  $002A   ; D39B   0023 003C 0007 002A
        DECLE   $00FF,  $0000,  $008F,  $000C   ; D39F   00FF 0000 008F 000C
        DECLE   $0014,  $0007,  $0020,  $0028   ; D3A3   0014 0007 0020 0028
        DECLE   $0027                           ; D3A7   0027

        ADCR    R3                              ; D3A8   002B
        DECR    R4                              ; D3A9   0014
        ADDR    R2,     R5                      ; D3AA   00D5
        INCR    R2                              ; D3AB   000A
        DECR    R4                              ; D3AC   0014
        ADDR    R4,     R7                      ; D3AD   00E7

        DECLE   $0023,  $0028,  $0007,  $002A   ; D3AE   0023 0028 0007 002A
        DECLE   $00FF,  $0000                   ; D3B2   00FF 0000

        MOVR    R2,     R7                      ; D3B4   0097

        INCR    R4                              ; D3B5   000C
        DECR    R4                              ; D3B6   0014
        SETC                                    ; D3B7   0007
        NEGR    R0                              ; D3B8   0020
        DECR    R4                              ; D3B9   0014
        SWAP    R3,     2                       ; D3BA   0047
        ADCR    R3                              ; D3BB   002B
        DECR    R4                              ; D3BC   0014
        SETC                                    ; D3BD   0007
        ADCR    R3                              ; D3BE   002B
        DECR    R4                              ; D3BF   0014
        ADDR    R4,     R7                      ; D3C0   00E7

        NEGR    R3                              ; D3C1   0023
        ADCR    R0                              ; D3C2   0028
        ADDR    R4,     R7                      ; D3C3   00E7

        DECLE   $0023,  $0014,  $0007,  $002A   ; D3C4   0023 0014 0007 002A
        DECLE   $00FF,  $0000                   ; D3C8   00FF 0000

        MOVR    R3,     R7                      ; D3CA   009F

        INCR    R4                              ; D3CB   000C
        DECR    R4                              ; D3CC   0014
        SETC                                    ; D3CD   0007
        NEGR    R0                              ; D3CE   0020
        ADCR    R0                              ; D3CF   0028
        SLL     R3,     2                       ; D3D0   004F
        ADCR    R3                              ; D3D1   002B
        DECR    R4                              ; D3D2   0014
        RLC     R3,     2                       ; D3D3   0057
        ADCR    R3                              ; D3D4   002B
        DECR    R4                              ; D3D5   0014
        ADDR    R4,     R7                      ; D3D6   00E7

        DECLE   $0023,  $0014,  $0007,  $002A   ; D3D7   0023 0014 0007 002A
        DECLE   $0014,  $0007,  $002A,  $00FF   ; D3DB   0014 0007 002A 00FF
        DECLE   $0000,  $00A7,  $000C,  $0014   ; D3DF   0000 00A7 000C 0014
        DECLE   $0007,  $0020,  $003C,  $005F   ; D3E3   0007 0020 003C 005F
        DECLE   $002B,  $0014,  $0067,  $002B   ; D3E7   002B 0014 0067 002B
        DECLE   $0014,  $0027,  $002A,  $0014   ; D3EB   0014 0027 002A 0014
        DECLE   $0007,  $002A,  $00FF,  $0000   ; D3EF   0007 002A 00FF 0000
        DECLE   $00B7,  $000C,  $0014,  $0007   ; D3F3   00B7 000C 0014 0007
        DECLE   $0020,  $0050,  $006F,  $002B   ; D3F7   0020 0050 006F 002B
        DECLE   $0028,  $0027,  $002A,  $00FF   ; D3FB   0028 0027 002A 00FF
        DECLE   $0000                           ; D3FF   0000

        RSWD    R2                              ; D400   003A
        INCR    R6                              ; D401   000E
        DECR    R4                              ; D402   0014
        RSWD    R4                              ; D403   003C
        INCR    R4                              ; D404   000C
        DECR    R4                              ; D405   0014
        RSWD    R5                              ; D406   003D
        ADCR    R0                              ; D407   0028
        SARC    R0,     1                       ; D408   0078
        ADDR    R4,     R7                      ; D409   00E7

        DECLE   $0023,  $00FF,  $0000           ; D40A   0023 00FF 0000

        ADDR    R4,     R4                      ; D40D   00E4
        SETC                                    ; D40E   0007
        DECR    R4                              ; D40F   0014
        RSWD    R2                              ; D410   003A
        INCR    R6                              ; D411   000E
        DECR    R4                              ; D412   0014
        RSWD    R4                              ; D413   003C
        INCR    R4                              ; D414   000C
        DECR    R4                              ; D415   0014
        RSWD    R5                              ; D416   003D
        ADCR    R0                              ; D417   0028
        SARC    R0,     1                       ; D418   0078
        ADDR    R4,     R7                      ; D419   00E7

        DECLE   $0023,  $00FF,  $0000,  $00E4   ; D41A   0023 00FF 0000 00E4
        DECLE   $0007,  $0014,  $00E4,  $0007   ; D41E   0007 0014 00E4 0007
        DECLE   $0014,  $003A,  $000E,  $0014   ; D422   0014 003A 000E 0014
        DECLE   $003C,  $000C,  $0014,  $003D   ; D426   003C 000C 0014 003D
        DECLE   $0028,  $0078,  $00F7,  $002A   ; D42A   0028 0078 00F7 002A
        DECLE   $00FF,  $00FF                   ; D42E   00FF 00FF

        PSHR    R5                              ; D430   0275
        CMP     G_01B9, R3                      ; D431   0343 01B9
        BEQ     L_D55C                          ; D433   0204 0127

        MVI     G_01BA, R0                      ; D435   0280 01BA
        CMPI    #$0004, R0                      ; D437   0378 0004
        BNEQ    L_D55B                          ; D439   020C 0120

        MVI     G_01D1, R0                      ; D43B   0280 01D1
        ANDI    #$0080, R0                      ; D43D   03B8 0080
        BNEQ    L_D55B                          ; D43F   020C 011A

        MVI     G_01B2, R2                      ; D441   0282 01B2
        MVI     G_01CF, R0                      ; D443   0280 01CF
        TSTR    R0                              ; D445   0080
        BEQ     L_D44C                          ; D446   0204 0004

        MOVR    R3,     R0                      ; D448   0098

        JSR     R5,     L_6FCE                  ; D449   0004 016C 03CE

L_D44C:
        MVI     G_01BB, R0                      ; D44C   0280 01BB
        TSTR    R0                              ; D44E   0080
        BEQ     L_D454                          ; D44F   0204 0003

        CMPR    R3,     R2                      ; D451   015A
        BEQ     L_D55B                          ; D452   0204 0107

L_D454:
        MOVR    R3,     R2                      ; D454   009A
        ADDI    #$01A9, R2                      ; D455   02FA 01A9
        MVI@    R2,     R0                      ; D457   0290
        ANDI    #$0020, R0                      ; D458   03B8 0020
        BNEQ    L_D55B                          ; D45A   020C 00FF

        MVI     G_01C5, R0                      ; D45C   0280 01C5
        TSTR    R0                              ; D45E   0080
        BEQ     L_D472                          ; D45F   0204 0011

        MVI     G_0354, R0                      ; D461   0280 0354
        SDBD                                    ; D463   0001
        CMPI    #$08FF, R0                      ; D464   0378 00FF 0008
        BLE     L_D472                          ; D467   0206 0009

        MVI@    R2,     R0                      ; D469   0290
        ANDI    #$0040, R0                      ; D46A   03B8 0040
        BEQ     L_D55B                          ; D46C   0204 00ED

        MVI     G_01B9, R2                      ; D46E   0282 01B9
        B       L_D48E                          ; D470   0200 001C

L_D472:
        MOVR    R3,     R0                      ; D472   0098

        JSR     R5,     .EXEC.76C               ; D473   0004 0114 036C

        ADDI    #$0003, R1                      ; D476   02F9 0003
        MVI     G_0350, R4                      ; D478   0284 0350
        MVI@    R2,     R0                      ; D47A   0290
        MOVR    R0,     R5                      ; D47B   0085
        ANDI    #$0040, R0                      ; D47C   03B8 0040
        MVI@    R1,     R0                      ; D47E   0288
        MVI     G_01B9, R2                      ; D47F   0282 01B9
        BNEQ    L_D48E                          ; D481   020C 000B

        ANDI    #$0010, R5                      ; D483   03BD 0010
        BEQ     L_D4AB                          ; D485   0204 0024

        ADDI    #$0001, R1                      ; D487   02F9 0001
        MVI@    R1,     R0                      ; D489   0288
        PSHR    R1                              ; D48A   0271
        PSHR    R2                              ; D48B   0272
        B       L_D4D1                          ; D48C   0200 0043

L_D48E:
        MVI     G_01C5, R0                      ; D48E   0280 01C5
        TSTR    R0                              ; D490   0080
        BNEQ    L_D497                          ; D491   020C 0004

        CMPI    #$00FF, R2                      ; D493   037A 00FF
        BNEQ    L_D55B                          ; D495   020C 00C4

L_D497:
        MVI     G_011F, R4                      ; D497   0284 011F
        CMPI    #$0003, R3                      ; D499   037B 0003
        BLT     L_D49F                          ; D49B   0205 0002

        MVI     G_0120, R4                      ; D49D   0284 0120
L_D49F:
        MOVR    R4,     R0                      ; D49F   00A0
        ANDI    #$00C0, R0                      ; D4A0   03B8 00C0
        PSHR    R1                              ; D4A2   0271
        PSHR    R2                              ; D4A3   0272
        BNEQ    L_D4C1                          ; D4A4   020C 001B

        MOVR    R4,     R1                      ; D4A6   00A1
        MVII    #$002D, R0                      ; D4A7   02B8 002D
        B       L_D4CE                          ; D4A9   0200 0023

L_D4AB:
        CMPR    R4,     R0                      ; D4AB   0160
        BC      L_D55B                          ; D4AC   0201 00AD

        PSHR    R1                              ; D4AE   0271
        PSHR    R2                              ; D4AF   0272
        PSHR    R3                              ; D4B0   0273

        JSR     R5,     L_D6A9                  ; D4B1   0004 01D4 02A9

        PULR    R3                              ; D4B4   02B3
        CMPI    #$0069, R0                      ; D4B5   0378 0069
        BLT     L_D4FE                          ; D4B7   0205 0045

        MVII    #$0004, R0                      ; D4B9   02B8 0004

        JSR     R5,     X_RAND1                 ; D4BB   0004 0114 027D

        MOVR    R0,     R1                      ; D4BE   0081
        B       L_D4CA                          ; D4BF   0200 0009

L_D4C1:
        MOVR    R3,     R1                      ; D4C1   0099
        MVII    #$0007, R0                      ; D4C2   02B8 0007

        JSR     R5,     L_5E1F                  ; D4C4   0004 015C 021F
        DECLE   $0004                           ; D4C7   0004

        INCR    R4                              ; D4C8   000C
        MOVR    R0,     R3                      ; D4C9   0083
L_D4CA:
        SDBD                                    ; D4CA   0001
        MVII    #$0016, R0                      ; D4CB   02B8 0016 0000

L_D4CE:
        JSR     R5,     .EXEC.629               ; D4CE   0004 0114 0229

L_D4D1:
        MVO     R0,     G_0351                  ; D4D1   0240 0351
        MVII    #$0005, R0                      ; D4D3   02B8 0005
        MVO     R0,     G_0353                  ; D4D5   0240 0353
        MVII    #$0001, R0                      ; D4D7   02B8 0001
        MVO     R0,     G_01BB                  ; D4D9   0240 01BB
        MVO     R3,     G_01B2                  ; D4DB   0243 01B2
        MVI     G_01B9, R2                      ; D4DD   0282 01B9
        CMPI    #$00FF, R2                      ; D4DF   037A 00FF
        BEQ     L_D4F6                          ; D4E1   0204 0013

        MOVR    R2,     R0                      ; D4E3   0090

        JSR     R5,     .EXEC.76C               ; D4E4   0004 0114 036C

        ADDI    #$0006, R1                      ; D4E7   02F9 0006
        MVII    #$0005, R0                      ; D4E9   02B8 0005
        MVO@    R0,     R1                      ; D4EB   0248
        ADDI    #$01A9, R2                      ; D4EC   02FA 01A9
        MVI@    R2,     R0                      ; D4EE   0290
        SDBD                                    ; D4EF   0001
        ANDI    #$FFDF, R0                      ; D4F0   03B8 00DF 00FF
        XORI    #$0020, R0                      ; D4F3   03F8 0020
        MVO@    R0,     R2                      ; D4F5   0250
L_D4F6:
        MVII    #$00FF, R0                      ; D4F6   02B8 00FF
        MVO     R0,     G_01B9                  ; D4F8   0240 01B9
        PULR    R2                              ; D4FA   02B2
        PULR    R1                              ; D4FB   02B1
        B       L_D558                          ; D4FC   0200 005A

L_D4FE:
        PULR    R2                              ; D4FE   02B2
        PULR    R1                              ; D4FF   02B1
        CMPI    #$0003, R3                      ; D500   037B 0003
        BGE     L_D50A                          ; D502   020D 0006

        CLRR    R0                              ; D504   01C0
        COMR    R0                              ; D505   0018
        MVO     R0,     G_01C1                  ; D506   0240 01C1
        B       L_D517                          ; D508   0200 000D

L_D50A:
        MVI     G_01C1, R0                      ; D50A   0280 01C1
        TSTR    R0                              ; D50C   0080
        BEQ     L_D517                          ; D50D   0204 0008

        MVII    #$0001, R0                      ; D50F   02B8 0001

        JSR     R5,     X_RAND1                 ; D511   0004 0114 027D

        TSTR    R0                              ; D514   0080
        BNEQ    L_D55B                          ; D515   020C 0044

L_D517:
        CMPI    #$00FF, R2                      ; D517   037A 00FF
        BEQ     L_D521                          ; D519   0204 0006

        ADDI    #$01A9, R2                      ; D51B   02FA 01A9
        MVI@    R2,     R0                      ; D51D   0290
        ANDI    #$007F, R0                      ; D51E   03B8 007F
        MVO@    R0,     R2                      ; D520   0250
L_D521:
        MOVR    R3,     R2                      ; D521   009A
        ADDI    #$01A9, R2                      ; D522   02FA 01A9
        MVI@    R2,     R0                      ; D524   0290
        XORI    #$0020, R0                      ; D525   03F8 0020
        MVO@    R0,     R2                      ; D527   0250
        PSHR    R1                              ; D528   0271
        ADDI    #$0003, R1                      ; D529   02F9 0003
        MVII    #$0003, R0                      ; D52B   02B8 0003
        MVO@    R0,     R1                      ; D52D   0248
        PULR    R1                              ; D52E   02B1
        SUBI    #$0003, R1                      ; D52F   0339 0003

        JSR     R5,     .EXEC.766               ; D531   0004 0114 0366

        MVO     R0,     G_01B9                  ; D534   0240 01B9
        MVO     R0,     G_01B2                  ; D536   0240 01B2
        CMPI    #$0003, R0                      ; D538   0378 0003
        BGE     L_D53E                          ; D53A   020D 0002

        MVO     R1,     G_01C1                  ; D53C   0241 01C1
L_D53E:
        MOVR    R0,     R1                      ; D53E   0081
        ADDI    #$01A9, R1                      ; D53F   02F9 01A9
        MVI@    R1,     R2                      ; D541   028A
        SDBD                                    ; D542   0001
        ANDI    #$FF7F, R2                      ; D543   03BA 007F 00FF
        XORI    #$0080, R2                      ; D546   03FA 0080
        MVO@    R2,     R1                      ; D548   024A
        MVI     G_01C5, R0                      ; D549   0280 01C5
        TSTR    R0                              ; D54B   0080
        BEQ     L_D551                          ; D54C   0204 0003

        JSR     R5,     L_D83F                  ; D54E   0004 01D8 003F

L_D551:
        CLRR    R0                              ; D551   01C0
        MVO     R0,     G_01BB                  ; D552   0240 01BB
        MVII    #$0001, R0                      ; D554   02B8 0001
        MVO     R0,     G_0353                  ; D556   0240 0353

L_D558:
        JSR     R5,     L_D0FD                  ; D558   0004 01D0 00FD

L_D55B:
        PULR    R7                              ; D55B   02B7

L_D55C:
        CMPI    #$0003, R3                      ; D55C   037B 0003
        BGE     L_D55B                          ; D55E   022D 0004

        INCR    R3                              ; D560   000B
        MVO     R3,     G_01C1                  ; D561   0243 01C1
        PULR    R7                              ; D563   02B7

        PSHR    R5                              ; D564   0275
        MVI     G_01CF, R5                      ; D565   0285 01CF
        CLRR    R0                              ; D567   01C0
        TSTR    R5                              ; D568   00AD
        BEQ     L_D56F                          ; D569   0204 0004

        MVO     R0,     G_01BB                  ; D56B   0240 01BB
        MVO     R0,     G_01CF                  ; D56D   0240 01CF
L_D56F:
        MVI     G_01BA, R0                      ; D56F   0280 01BA
        CMPI    #$0008, R0                      ; D571   0378 0008
        BEQ     L_D5EF                          ; D573   0204 007A

        CMPI    #$0010, R0                      ; D575   0378 0010
        BNEQ    L_D57F                          ; D577   020C 0006

        MVII    #$0004, R0                      ; D579   02B8 0004
        MVO     R0,     G_01BA                  ; D57B   0240 01BA
        B       L_D5D0                          ; D57D   0200 0051

L_D57F:
        CMPI    #$0004, R0                      ; D57F   0378 0004
        BNEQ    L_D5D3                          ; D581   020C 0050

        MVI     G_01B9, R0                      ; D583   0280 01B9
        CMPI    #$00FF, R0                      ; D585   0378 00FF
        BEQ     L_D5C4                          ; D587   0204 003B

        JSR     R5,     .EXEC.76C               ; D589   0004 0114 036C

        MOVR    R1,     R3                      ; D58C   008B

        JSR     R5,     L_5D7B                  ; D58D   0004 015C 017B

        CMPI    #$0010, R2                      ; D590   037A 0010
        BGT     L_D5D4                          ; D592   020E 0040

        PSHR    R3                              ; D594   0273
        MOVR    R3,     R1                      ; D595   0099
        ADDI    #$0001, R1                      ; D596   02F9 0001
        MVI@    R1,     R2                      ; D598   028A
        MVII    #$0200, R0                      ; D599   02B8 0200
        SDBD                                    ; D59B   0001
        CMPI    #$581A, R2                      ; D59C   037A 001A 0058
        PULR    R1                              ; D59F   02B1
        BEQ     L_D5AF                          ; D5A0   0204 000D

        SDBD                                    ; D5A2   0001
        MVII    #$FE00, R0                      ; D5A3   02B8 0000 00FE
        MVI@    R1,     R2                      ; D5A6   028A
        ANDI    #$0200, R2                      ; D5A7   03BA 0200
        BNEQ    L_D5AF                          ; D5A9   020C 0004

        SDBD                                    ; D5AB   0001
        MVII    #$0700, R0                      ; D5AC   02B8 0000 0007
L_D5AF:
        ADDI    #$0002, R1                      ; D5AF   02F9 0002
        ADD@    R1,     R0                      ; D5B1   02C8
        MVII    #$034F, R4                      ; D5B2   02BC 034F
        MVO@    R0,     R4                      ; D5B4   0260
        INCR    R1                              ; D5B5   0009
        MVI@    R1,     R0                      ; D5B6   0288
        SDBD                                    ; D5B7   0001
        ADDI    #$0500, R0                      ; D5B8   02F8 0000 0005
        MVO@    R0,     R4                      ; D5BB   0260
        INCR    R1                              ; D5BC   0009
        MVI@    R1,     R0                      ; D5BD   0288
        MVO     R0,     G_0351                  ; D5BE   0240 0351
        MVII    #$0001, R0                      ; D5C0   02B8 0001
        MVO     R0,     G_0353                  ; D5C2   0240 0353
L_D5C4:
        MVI     G_01BA, R0                      ; D5C4   0280 01BA
        CMPI    #$0001, R0                      ; D5C6   0378 0001
        BEQ     L_D5D3                          ; D5C8   0204 0009

        MVI     G_01BB, R0                      ; D5CA   0280 01BB
        CMPI    #$0001, R0                      ; D5CC   0378 0001
        BNEQ    L_D5D3                          ; D5CE   020C 0003

L_D5D0:
        CLRR    R0                              ; D5D0   01C0
        MVO     R0,     G_01BB                  ; D5D1   0240 01BB
L_D5D3:
        PULR    R7                              ; D5D3   02B7

L_D5D4:
        CLRR    R0                              ; D5D4   01C0
        COMR    R0                              ; D5D5   0018
        MVO     R0,     G_01B9                  ; D5D6   0240 01B9
        B       L_D5D0                          ; D5D8   0220 0009

L_D5DA:
        MVI     G_034D, R0                      ; D5DA   0280 034D
        SDBD                                    ; D5DC   0001
        XORI    #$1000, R0                      ; D5DD   03F8 0000 0010
        MVO     R0,     G_034D                  ; D5E0   0240 034D
        MVI     G_0355, R0                      ; D5E2   0280 0355
        SDBD                                    ; D5E4   0001
        XORI    #$1000, R0                      ; D5E5   03F8 0000 0010
        MVO     R0,     G_0355                  ; D5E8   0240 0355
        MOVR    R5,     R7                      ; D5EA   00AF

        DECLE   $0000                           ; D5EB   0000

        ADDR    R2,     R0                      ; D5EC   00D0
        MOVR    R6,     R3                      ; D5ED   00B3
        ADDR    R2,     R0                      ; D5EE   00D0

L_D5EF:
        JSR     R5,     L_D5DA                  ; D5EF   0004 01D4 01DA

        SDBD                                    ; D5F2   0001
        MVII    #$D5EB, R4                      ; D5F3   02BC 00EB 00D5
        MVII    #$0001, R0                      ; D5F6   02B8 0001

        JSR     R5,     X_RAND1                 ; D5F8   0004 0114 027D

        SLL     R0,     1                       ; D5FB   0048
        ADDR    R0,     R4                      ; D5FC   00C4
        SDBD                                    ; D5FD   0001
        MVII    #$D603, R5                      ; D5FE   02BD 0003 00D6
        SDBD                                    ; D601   0001
        MVI@    R4,     R7                      ; D602   02A7

        CLRR    R2                              ; D603   01D2
        MVII    #$01B8, R1                      ; D604   02B9 01B8

        JSR     R5,     L_DA33                  ; D606   0004 01D8 0233

        BC      L_D60F                          ; D609   0201 0004

        MVII    #$0003, R2                      ; D60B   02BA 0003
        MVII    #$01B7, R1                      ; D60D   02B9 01B7
L_D60F:
        MVO     R2,     G_01B9                  ; D60F   0242 01B9
        DECLE   $0242,  $01B2,  $0001           ; D611   0242 01B2 0001

        MVII    #$0021, R3                      ; D614   02BB 0021
        SLLC    R0,     1                       ; D616   0058

        JSR     R5,     L_DB3F                  ; D617   0004 01D8 033F
        JSR     R5,     L_D822                  ; D61A   0004 01D8 0022
        JSR     R5,     L_DA71                  ; D61D   0004 01D8 0271

        PULR    R7                              ; D620   02B7

L_D621:
        PSHR    R5                              ; D621   0275
        MVI     G_01BA, R0                      ; D622   0280 01BA
        SDBD                                    ; D624   0001
        ANDI    #$0021, R0                      ; D625   03B8 0021 0000
        BNEQ    L_D664                          ; D628   020C 003A

        MVI     G_01BA, R0                      ; D62A   0280 01BA
        SDBD                                    ; D62C   0001
        ANDI    #$004A, R0                      ; D62D   03B8 004A 0000
        BNEQ    L_D668                          ; D630   020C 0036

        MVI     G_034F, R2                      ; D632   0282 034F
        MVI     G_0351, R0                      ; D634   0280 0351

        JSR     R5,     X_UNPK_BYTES            ; D636   0004 0114 0357

        SDBD                                    ; D639   0001
        CMPI    #$4000, R2                      ; D63A   037A 0000 0040
        BC      L_D650                          ; D63D   0201 0011

        MVI     G_01A8, R5                      ; D63F   0285 01A8
        TSTR    R5                              ; D641   00AD
        BEQ     L_D664                          ; D642   0204 0020

        TSTR    R0                              ; D644   0080
        BNEQ    L_D64C                          ; D645   020C 0005

        MVII    #$0032, R0                      ; D647   02B8 0032
        NEGR    R0                              ; D649   0020
        B       L_D665                          ; D64A   0200 0019
L_D64C:
        BPL     L_D664                          ; D64C   0203 0016
        B       L_D665                          ; D64E   0200 0015

L_D650:
        SDBD                                    ; D650   0001
        CMPI    #$7000, R2                      ; D651   037A 0000 0070
        BNC     L_D664                          ; D654   0209 000E

        MVI     G_01A7, R5                      ; D656   0285 01A7
        TSTR    R5                              ; D658   00AD
        BEQ     L_D664                          ; D659   0204 0009

        TSTR    R0                              ; D65B   0080
        BNEQ    L_D662                          ; D65C   020C 0004

        MVII    #$0032, R0                      ; D65E   02B8 0032
        B       L_D665                          ; D660   0200 0003
L_D662:
        BPL     L_D665                          ; D662   0203 0001

L_D664:
        CLRR    R0                              ; D664   01C0
L_D665:
        NEGR    R0                              ; D665   0020
        MVO     R0,     G_016B                  ; D666   0240 016B
L_D668:
        PULR    R7                              ; D668   02B7

L_D669:
        PSHR    R5                              ; D669   0275
        MVI     G_01BA, R0                      ; D66A   0280 01BA
        CMPI    #$0010, R0                      ; D66C   0378 0010
        BEQ     L_D688                          ; D66E   0204 0018

        MVI     G_01B9, R0                      ; D670   0280 01B9
        CMPI    #$00FF, R0                      ; D672   0378 00FF
        BNEQ    L_D688                          ; D674   020C 0012

        MVI     G_0351, R0                      ; D676   0280 0351

        JSR     R5,     X_UNPK_BYTES            ; D678   0004 0114 0357

        MOVR    R0,     R2                      ; D67B   0082
        MOVR    R1,     R3                      ; D67C   008B
        SAR     R0,     2                       ; D67D   006C
        SAR     R1,     2                       ; D67E   006D
        NEGR    R0                              ; D67F   0020
        NEGR    R1                              ; D680   0021
        ADDR    R2,     R0                      ; D681   00D0
        ADDR    R3,     R1                      ; D682   00D9

        JSR     R5,     X_PACK_BYTES            ; D683   0004 0114 034F

        MVO     R0,     G_0351                  ; D686   0240 0351
L_D688:
        PULR    R7                              ; D688   02B7

        PSHR    R5                              ; D689   0275

        JSR     R5,     L_F270                  ; D68A   0004 01F0 0270

        PULR    R7                              ; D68D   02B7

L_D68E:
        PSHR    R5                              ; D68E   0275

        JSR     R5,     .EXEC.777               ; D68F   0004 0114 0377

        ADDI    #$0004, R3                      ; D692   02FB 0004
        MVII    #$0357, R4                      ; D694   02BC 0357

        JSR     R5,     .EXEC.784               ; D696   0004 0114 0384
        JSR     R5,     .EXEC.A2F               ; D699   0004 0118 022F

        MOVR    R1,     R0                      ; D69C   0088
        PULR    R7                              ; D69D   02B7

L_D69E:
        PSHR    R5                              ; D69E   0275
        MVI     G_0351, R0                      ; D69F   0280 0351

        JSR     R5,     X_UNPK_BYTES            ; D6A1   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; D6A4   0004 0118 022F

        MOVR    R1,     R0                      ; D6A7   0088
        PULR    R7                              ; D6A8   02B7

L_D6A9:
        PSHR    R5                              ; D6A9   0275
        MVI     G_0351, R0                      ; D6AA   0280 0351

        JSR     R5,     X_UNPK_BYTES            ; D6AC   0004 0114 0357

        TSTR    R0                              ; D6AF   0080
        BPL     L_D6B3                          ; D6B0   0203 0001

        NEGR    R0                              ; D6B2   0020
L_D6B3:
        TSTR    R1                              ; D6B3   0089
        BPL     L_D6B7                          ; D6B4   0203 0001

        NEGR    R1                              ; D6B6   0021
L_D6B7:
        MOVR    R0,     R2                      ; D6B7   0082
        CMPR    R0,     R1                      ; D6B8   0141
        BLT     L_D6BC                          ; D6B9   0205 0001

        MOVR    R1,     R2                      ; D6BB   008A
L_D6BC:
        ADDR    R1,     R0                      ; D6BC   00C8
        ADDR    R2,     R0                      ; D6BD   00D0
        SAR     R0,     1                       ; D6BE   0068
        PULR    R7                              ; D6BF   02B7

L_D6C0:
        PSHR    R5                              ; D6C0   0275
        MVI     G_01BA, R0                      ; D6C1   0280 01BA
        CMPI    #$0004, R0                      ; D6C3   0378 0004
        BNEQ    L_D6DC                          ; D6C5   020C 0015

        MVI     G_01B9, R0                      ; D6C7   0280 01B9
        CMPI    #$00FF, R0                      ; D6C9   0378 00FF
        BNEQ    L_D6DC                          ; D6CB   020C 000F

        MVII    #$031D, R1                      ; D6CD   02B9 031D
        CLRR    R3                              ; D6CF   01DB
        MOVR    R3,     R4                      ; D6D0   009C

        JSR     R5,     L_D6DD                  ; D6D1   0004 01D4 02DD

        MVII    #$0335, R1                      ; D6D4   02B9 0335
        MVII    #$0003, R3                      ; D6D6   02BB 0003
        MOVR    R3,     R4                      ; D6D8   009C

        JSR     R5,     L_D6DD                  ; D6D9   0004 01D4 02DD

L_D6DC:
        PULR    R7                              ; D6DC   02B7

L_D6DD:
        PSHR    R5                              ; D6DD   0275
        ADDI    #$01A9, R3                      ; D6DE   02FB 01A9
        MVII    #$0003, R2                      ; D6E0   02BA 0003
L_D6E2:
        MVO     R2,     G_01DC                  ; D6E2   0242 01DC
        MVO     R3,     G_01DD                  ; D6E4   0243 01DD
        MOVR    R3,     R4                      ; D6E6   009C
        SDBD                                    ; D6E7   0001
        ADDI    #$001D, R4                      ; D6E8   02FC 001D 0000
        PSHR    R1                              ; D6EB   0271
        MVI@    R4,     R0                      ; D6EC   02A0
        SWAP    R0,     1                       ; D6ED   0040
        SLLC    R0,     1                       ; D6EE   0058
        BC      L_D74F                          ; D6EF   0201 005E

        MVI@    R3,     R0                      ; D6F1   0298
        ANDI    #$0004, R0                      ; D6F2   03B8 0004
        BNEQ    L_D74F                          ; D6F4   020C 0059

        JSR     R5,     L_D6A9                  ; D6F6   0004 01D4 02A9

        SDBD                                    ; D6F9   0001
        MVII    #$0064, R1                      ; D6FA   02B9 0064 0000
        SLL     R0,     2                       ; D6FD   004C
        SLL     R0,     1                       ; D6FE   0048
        CMPR    R0,     R1                      ; D6FF   0141
        BGT     L_D748                          ; D700   020E 0046

        MVII    #$0002, R2                      ; D702   02BA 0002
L_D704:
        SAR     R0,     1                       ; D704   0068
        CMPR    R0,     R1                      ; D705   0141
        BGE     L_D70B                          ; D706   020D 0003

        DECR    R2                              ; D708   0012
        BNEQ    L_D704                          ; D709   022C 0006

L_D70B:
        ADDI    #$0002, R2                      ; D70B   02FA 0002
        PSHR    R2                              ; D70D   0272

        JSR     R5,     L_D69E                  ; D70E   0004 01D4 029E

        PULR    R2                              ; D711   02B2
        PULR    R1                              ; D712   02B1
        PSHR    R1                              ; D713   0271
        PSHR    R2                              ; D714   0272
        PSHR    R0                              ; D715   0270

        JSR     R5,     L_D68E                  ; D716   0004 01D4 028E
        JSR     R5,     L_D75D                  ; D719   0004 01D4 035D

        CMP@    R6,     R0                      ; D71C   0370
        BGT     L_D74F                          ; D71D   020E 0030

        TSTR    R0                              ; D71F   0080
        BEQ     L_D748                          ; D720   0204 0026

        JSR     R5,     L_D69E                  ; D722   0004 01D4 029E

        ADDI    #$0004, R0                      ; D725   02F8 0004
        ANDI    #$000F, R0                      ; D727   03B8 000F
        PULR    R1                              ; D729   02B1
        PSHR    R1                              ; D72A   0271
        PSHR    R0                              ; D72B   0270
        PSHR    R0                              ; D72C   0270

        JSR     R5,     L_D68E                  ; D72D   0004 01D4 028E
        JSR     R5,     L_D75D                  ; D730   0004 01D4 035D

        PULR    R1                              ; D733   02B1
        CMPI    #$0004, R0                      ; D734   0378 0004
        BGT     L_D73C                          ; D736   020E 0004

        ADDI    #$0008, R1                      ; D738   02F9 0008
        ANDI    #$000F, R1                      ; D73A   03B9 000F
L_D73C:
        MVII    #$0019, R0                      ; D73C   02B8 0019

        JSR     R5,     .EXEC.629               ; D73E   0004 0114 0229

        PULR    R1                              ; D741   02B1
        PSHR    R1                              ; D742   0271
        ADDI    #$0004, R1                      ; D743   02F9 0004
        MVO@    R0,     R1                      ; D745   0248
        B       L_D74F                          ; D746   0200 0007

L_D748:
        PULR    R1                              ; D748   02B1
        PSHR    R1                              ; D749   0271

        JSR     R5,     L_D7C3                  ; D74A   0004 01D4 03C3

        B       L_D74F                          ; D74D   0200 0000

L_D74F:
        PULR    R1                              ; D74F   02B1
        MVI     G_01DC, R2                      ; D750   0282 01DC
        MVI     G_01DD, R3                      ; D752   0283 01DD
        ADDI    #$0100, R3                      ; D754   02FB 0100
        INCR    R3                              ; D756   000B
        ADDI    #$0008, R1                      ; D757   02F9 0008
        DECR    R2                              ; D759   0012
        BNEQ    L_D6E2                          ; D75A   022C 0079
        PULR    R7                              ; D75C   02B7

L_D75D:
        SUB@    R6,     R0                      ; D75D   0330
        BPL     L_D761                          ; D75E   0203 0001

        NEGR    R0                              ; D760   0020
L_D761:
        CMPI    #$0008, R0                      ; D761   0378 0008
        BLE     L_D768                          ; D763   0206 0003

        SUBI    #$0010, R0                      ; D765   0338 0010
        NEGR    R0                              ; D767   0020
L_D768:
        MOVR    R5,     R7                      ; D768   00AF

L_D769:
        PSHR    R5                              ; D769   0275
        MVII    #$031F, R1                      ; D76A   02B9 031F
        CLRR    R2                              ; D76C   01D2
L_D76D:
        PSHR    R1                              ; D76D   0271
        PSHR    R2                              ; D76E   0272
        MVI@    R1,     R0                      ; D76F   0288
        SDBD                                    ; D770   0001
        CMPI    #$1000, R0                      ; D771   0378 0000 0010
        BC      L_D77B                          ; D774   0201 0005

        JSR     R5,     L_D78E                  ; D776   0004 01D4 038E

        B       L_D784                          ; D779   0200 0009

L_D77B:
        SDBD                                    ; D77B   0001
        CMPI    #$A800, R0                      ; D77C   0378 0000 00A8
        BNC     L_D784                          ; D77F   0209 0003

        JSR     R5,     L_D794                  ; D781   0004 01D4 0394

L_D784:
        PULR    R2                              ; D784   02B2
        PULR    R1                              ; D785   02B1
        INCR    R2                              ; D786   000A
        ADDI    #$0008, R1                      ; D787   02F9 0008
        CMPI    #$034F, R1                      ; D789   0379 034F
        BLT     L_D76D                          ; D78B   0225 001F
        PULR    R7                              ; D78D   02B7

L_D78E:
        SDBD                                    ; D78E   0001
        MVII    #$10A7, R3                      ; D78F   02BB 00A7 0010
        B       L_D798                          ; D792   0200 0004

L_D794:
        SDBD                                    ; D794   0001
        MVII    #$A710, R3                      ; D795   02BB 0010 00A7
L_D798:
        MVI     G_01D1, R0                      ; D798   0280 01D1
        ANDI    #$0080, R0                      ; D79A   03B8 0080
        BNEQ    L_D7C1                          ; D79C   020C 0023

        MVI     G_01BA, R0                      ; D79E   0280 01BA
        SDBD                                    ; D7A0   0001
        ANDI    #$0035, R0                      ; D7A1   03B8 0035 0000
        BEQ     L_D7C0                          ; D7A4   0204 001A

        MVI     G_01A6, R0                      ; D7A6   0280 01A6
        CMPI    #$000A, R0                      ; D7A8   0378 000A
        BLT     L_D7C1                          ; D7AA   0205 0015

        CMPI    #$002B, R0                      ; D7AC   0378 002B
        BGT     L_D7C1                          ; D7AE   020E 0011

        CMP     G_01B9, R2                      ; D7B0   0342 01B9
        BEQ     L_D7C1                          ; D7B2   0204 000D

        MVI     G_034F, R0                      ; D7B4   0280 034F
        SUB@    R1,     R0                      ; D7B6   0308
        BPL     L_D7BA                          ; D7B7   0203 0001

        NEGR    R0                              ; D7B9   0020
L_D7BA:
        SDBD                                    ; D7BA   0001
        CMPI    #$5000, R0                      ; D7BB   0378 0000 0050
        BLT     L_D7C1                          ; D7BE   0205 0001

L_D7C0:
        SWAP    R3,     1                       ; D7C0   0043
L_D7C1:
        MVO@    R3,     R1                      ; D7C1   024B
        MOVR    R5,     R7                      ; D7C2   00AF

L_D7C3:
        PSHR    R5                              ; D7C3   0275
        PSHR    R1                              ; D7C4   0271
        MVII    #$0007, R0                      ; D7C5   02B8 0007

        JSR     R5,     .EXEC.772               ; D7C7   0004 0114 0372

        SUBI    #$0004, R3                      ; D7CA   033B 0004
        SUBI    #$0004, R2                      ; D7CC   033A 0004
        SWAP    R2,     1                       ; D7CE   0042
        XORR    R3,     R2                      ; D7CF   01DA
        MVII    #$0019, R3                      ; D7D0   02BB 0019
        PULR    R1                              ; D7D2   02B1

        JSR     R5,     .EXEC.9A3               ; D7D3   0004 0118 01A3

        ADDI    #$0006, R1                      ; D7D6   02F9 0006
        PULR    R7                              ; D7D8   02B7

L_D7D9:
        PSHR    R5                              ; D7D9   0275
        MVII    #$000A, R5                      ; D7DA   02BD 000A
        MOVR    R5,     R4                      ; D7DC   00AC
        MVI     G_01A6, R3                      ; D7DD   0283 01A6
        CLRR    R0                              ; D7DF   01C0
        TSTR    R2                              ; D7E0   0092
        BNEQ    L_D7F4                          ; D7E1   020C 0011

        CMPI    #$0032, R3                      ; D7E3   037B 0032
        BLT     L_D7EA                          ; D7E5   0205 0003

        CLRR    R4                              ; D7E7   01E4
        MVO     R4,     G_016B                  ; D7E8   0244 016B
L_D7EA:
        INCR    R3                              ; D7EA   000B
        MOVR    R3,     R2                      ; D7EB   009A
        ADDI    #$0013, R2                      ; D7EC   02FA 0013
        MVII    #$0013, R1                      ; D7EE   02B9 0013
        MVII    #$00FF, R0                      ; D7F0   02B8 00FF
        B       L_D7FE                          ; D7F2   0200 000A

L_D7F4:
        CMPI    #$0001, R3                      ; D7F4   037B 0001
        BGT     L_D7FB                          ; D7F6   020E 0003

        CLRR    R5                              ; D7F8   01ED
        MVO     R5,     G_016B                  ; D7F9   0245 016B
L_D7FB:
        DECR    R3                              ; D7FB   0013
        MOVR    R3,     R2                      ; D7FC   009A
        CLRR    R1                              ; D7FD   01C9
L_D7FE:
        MVO     R3,     G_01A6                  ; D7FE   0243 01A6
        PSHR    R4                              ; D800   0274
        PSHR    R5                              ; D801   0275

        JSR     R5,     L_60AC                  ; D802   0004 0160 00AC

        PULR    R5                              ; D805   02B5
        PULR    R4                              ; D806   02B4
        MVO     R4,     G_01A7                  ; D807   0244 01A7
        MVO     R5,     G_01A8                  ; D809   0245 01A8
        MVI     G_01C0, R0                      ; D80B   0280 01C0
        TSTR    R0                              ; D80D   0080
        BEQ     L_D821                          ; D80E   0204 0011

        MVI     G_01A6, R0                      ; D810   0280 01A6
        CMPI    #$001A, R0                      ; D812   0378 001A
        BNEQ    L_D821                          ; D814   020C 000B

        CLRR    R0                              ; D816   01C0
        MVO     R0,     G_016B                  ; D817   0240 016B
        MVO     R0,     G_01C0                  ; D819   0240 01C0
        MVI     G_01BF, R3                      ; D81B   0283 01BF
        SWAP    R3,     1                       ; D81D   0043
        XOR     G_01BE, R3                      ; D81E   03C3 01BE
        MOVR    R3,     R7                      ; D820   009F
L_D821:
        PULR    R7                              ; D821   02B7

L_D822:
        MVII    #$007F, R1                      ; D822   02B9 007F
        MVI     G_01A6, R0                      ; D824   0280 01A6
        SUBI    #$001A, R0                      ; D826   0338 001A
        BNEQ    L_D82D                          ; D828   020C 0003

        MVO     R0,     G_016B                  ; D82A   0240 016B
        MOVR    R5,     R7                      ; D82C   00AF
L_D82D:
        BPL     L_D830                          ; D82D   0203 0001

        NEGR    R1                              ; D82F   0021
L_D830:
        MVO     R1,     G_016B                  ; D830   0241 016B
        MOVR    R5,     R0                      ; D832   00A8
        MVO     R0,     G_01BE                  ; D833   0240 01BE
        SWAP    R0,     1                       ; D835   0040
        MVO     R0,     G_01BF                  ; D836   0240 01BF
        MVI     .PSG1.lft_hand,R0               ; D838   0280 00FF
        MVO     R0,     G_01C0                  ; D83A   0240 01C0
        PULR    R7                              ; D83C   02B7

        CMP@    R2,     R5                      ; D83D   0355
        CMP@    R1,     R7                      ; D83E   034F
L_D83F:
        SDBD                                    ; D83F   0001
        MVII    #$D83D, R4                      ; D840   02BC 003D 00D8
L_D843:
        PSHR    R5                              ; D843   0275
        CLRR    R3                              ; D844   01DB
        MVI@    R4,     R1                      ; D845   02A1
        MVI@    R4,     R2                      ; D846   02A2

        JSR     R5,     .EXEC.766               ; D847   0004 0114 0366

        ADDI    #$0004, R1                      ; D84A   02F9 0004
        MVO     R3,     G_01C5                  ; D84C   0243 01C5
        MVO@    R3,     R1                      ; D84E   024B
        DECR    R1                              ; D84F   0011
        DECR    R1                              ; D850   0011
        MOVR    R1,     R4                      ; D851   008C
        MOVR    R2,     R5                      ; D852   0095
        MVI@    R4,     R3                      ; D853   02A3
        MVO@    R3,     R5                      ; D854   026B
        MVI@    R4,     R3                      ; D855   02A3
        MVO@    R3,     R5                      ; D856   026B

        JSR     R5,     .EXEC.6CF               ; D857   0004 0114 02CF

        PULR    R7                              ; D85A   02B7

L_D85B:
        PSHR    R5                              ; D85B   0275
        MVII    #$031D, R1                      ; D85C   02B9 031D
        MVII    #$01C6, R3                      ; D85E   02BB 01C6
L_D860:
        PSHR    R3                              ; D860   0273
        PSHR    R1                              ; D861   0271
        MVI     G_01A6, R0                      ; D862   0280 01A6
        CMPI    #$0027, R0                      ; D864   0378 0027
        BLT     L_D88A                          ; D866   0205 0022

        JSR     R5,     L_DA0D                  ; D868   0004 01D8 020D
        DECLE   $0001,  $0000,  $00FF,  $00FF   ; D86B   0001 0000 00FF 00FF

        ADCR    R4                              ; D86F   002C
        ADDR    R7,     R6                      ; D870   00FE
        BNC     L_D88A                          ; D871   0209 0017

        JSR     R5,     L_DA01                  ; D873   0004 01D8 0201

        PULR    R1                              ; D876   02B1
        PULR    R3                              ; D877   02B3
        MVI@    R3,     R0                      ; D878   0298
        SWAP    R0,     1                       ; D879   0040
        SLLC    R0,     1                       ; D87A   0058
        BC      L_D88C                          ; D87B   0201 000F

        MVI     G_01BA, R0                      ; D87D   0280 01BA
        CMPI    #$0004, R0                      ; D87F   0378 0004
        BNEQ    L_D88C                          ; D881   020C 0009

        ADDI    #$0004, R1                      ; D883   02F9 0004

        JSR     R5,     L_DBAE                  ; D885   0004 01D8 03AE

        B       L_D88C                          ; D888   0200 0002

L_D88A:
        PULR    R1                              ; D88A   02B1
        PULR    R3                              ; D88B   02B3
L_D88C:
        PSHR    R3                              ; D88C   0273
        PSHR    R1                              ; D88D   0271
        MVI     G_01A6, R0                      ; D88E   0280 01A6
        CMPI    #$0008, R0                      ; D890   0378 0008
        BGT     L_D8B6                          ; D892   020E 0022

        JSR     R5,     L_DA0D                  ; D894   0004 01D8 020D
        DECLE   $0001,  $0000,  $0001,  $0000   ; D897   0001 0000 0001 0000
        DECLE   $0094,  $00FF                   ; D89B   0094 00FF

        BC      L_D8B6                          ; D89D   0201 0017

        JSR     R5,     L_DA01                  ; D89F   0004 01D8 0201

        PULR    R1                              ; D8A2   02B1
        PULR    R3                              ; D8A3   02B3
        MVI@    R3,     R0                      ; D8A4   0298
        SWAP    R0,     1                       ; D8A5   0040
        SLLC    R0,     1                       ; D8A6   0058
        BC      L_D8B8                          ; D8A7   0201 000F

        MVI     G_01BA, R0                      ; D8A9   0280 01BA
        CMPI    #$0004, R0                      ; D8AB   0378 0004
        BNEQ    L_D8B8                          ; D8AD   020C 0009

        ADDI    #$0004, R1                      ; D8AF   02F9 0004

        JSR     R5,     L_DBAE                  ; D8B1   0004 01D8 03AE

        B       L_D8B8                          ; D8B4   0200 0002

L_D8B6:
        PULR    R1                              ; D8B6   02B1
        PULR    R3                              ; D8B7   02B3
L_D8B8:
        ADDI    #$0008, R1                      ; D8B8   02F9 0008
        INCR    R3                              ; D8BA   000B
        CMPI    #$0345, R1                      ; D8BB   0379 0345
        BLE     L_D860                          ; D8BD   0226 005E

        MVI     G_01BA, R0                      ; D8BF   0280 01BA
        CMPI    #$0008, R0                      ; D8C1   0378 0008
        BEQ     L_DA00                          ; D8C3   0204 013B

        ANDI    #$0004, R0                      ; D8C5   03B8 0004
        BEQ     L_DA00                          ; D8C7   0204 0137

        MVI     G_01B9, R0                      ; D8C9   0280 01B9
        CMPI    #$00FF, R0                      ; D8CB   0378 00FF
        BNEQ    L_D988                          ; D8CD   020C 00B9

        MVII    #$0355, R1                      ; D8CF   02B9 0355

        JSR     R5,     L_DA0D                  ; D8D1   0004 01D8 020D
        DECLE   $0001,  $0000,  $0001,  $0000   ; D8D4   0001 0000 0001 0000
        DECLE   $0093,  $00FF                   ; D8D8   0093 00FF

        BNC     L_D8E9                          ; D8DA   0209 000D

        MVII    #$0355, R1                      ; D8DC   02B9 0355

        JSR     R5,     L_DA0D                  ; D8DE   0004 01D8 020D
        DECLE   $0001,  $0000,  $00FF,  $00FF   ; D8E1   0001 0000 00FF 00FF

        NEGR    R6                              ; D8E5   0026
        ADDR    R7,     R6                      ; D8E6   00FE
        BNC     L_D988                          ; D8E7   0209 009F

L_D8E9:
        MVI     G_01C5, R0                      ; D8E9   0280 01C5
        TSTR    R0                              ; D8EB   0080
        BEQ     L_D8F6                          ; D8EC   0204 0008

        MVI     G_0354, R0                      ; D8EE   0280 0354
        SDBD                                    ; D8F0   0001
        CMPI    #$0A00, R0                      ; D8F1   0378 0000 000A
        BC      L_D934                          ; D8F4   0201 003E

L_D8F6:
        MVII    #$0355, R1                      ; D8F6   02B9 0355

        JSR     R5,     L_DA41                  ; D8F8   0004 01D8 0241

        NEGR    R6                              ; D8FB   0026
        NOP                                     ; D8FC   0034
        BNC     L_D906                          ; D8FD   0209 0007

        JSR     R5,     L_D83F                  ; D8FF   0004 01D8 003F
        JSR     R5,     L_DAD3                  ; D902   0004 01D8 02D3

        PULR    R7                              ; D905   02B7

L_D906:
        MVII    #$0355, R1                      ; D906   02B9 0355

        JSR     R5,     L_DA41                  ; D908   0004 01D8 0241
        DECLE   $0025,  $0035                   ; D90B   0025 0035

        BNC     L_D934                          ; D90D   0209 0025

        MVI     G_0351, R0                      ; D90F   0280 0351
        MOVR    R0,     R1                      ; D911   0081
        SDBD                                    ; D912   0001
        ANDI    #$FF00, R0                      ; D913   03B8 0000 00FF
        ANDI    #$00FF, R1                      ; D916   03B9 00FF
        NEGR    R0                              ; D918   0020
        XORR    R0,     R1                      ; D919   01C1
        MVO     R1,     G_0351                  ; D91A   0241 0351
        MVI     G_034F, R1                      ; D91C   0281 034F
        MVI     G_01A6, R0                      ; D91E   0280 01A6
        CMPI    #$001A, R0                      ; D920   0378 001A
        BLT     L_D92A                          ; D922   0205 0006

        SDBD                                    ; D924   0001
        SUBI    #$0500, R1                      ; D925   0339 0000 0005
        B       L_D92E                          ; D928   0200 0004

L_D92A:
        SDBD                                    ; D92A   0001
        ADDI    #$0500, R1                      ; D92B   02F9 0000 0005
L_D92E:
        MVO     R1,     G_034F                  ; D92E   0241 034F

        JSR     R5,     L_D0FD                  ; D930   0004 01D0 00FD

        PULR    R7                              ; D933   02B7

L_D934:
        JSR     R5,     X_PLAY_WHST1            ; D934   0004 011C 031B
        JSR     R5,     L_D5DA                  ; D937   0004 01D4 01DA
        JSR     R5,     L_D83F                  ; D93A   0004 01D8 003F

        CLRR    R1                              ; D93D   01C9
        MVI     G_01B2, R0                      ; D93E   0280 01B2
        CMPI    #$0003, R0                      ; D940   0378 0003
        BLT     L_D945                          ; D942   0205 0001

        INCR    R1                              ; D944   0009

L_D945:
        JSR     R5,     L_DA33                  ; D945   0004 01D8 0233

        ADCR    R1                              ; D948   0029
        DECR    R1                              ; D949   0011
        BEQ     L_D950                          ; D94A   0204 0004

        JSR     R5,     L_DD29                  ; D94C   0004 01DC 0129

        PULR    R7                              ; D94F   02B7

L_D950:
        MVII    #$00FF, R0                      ; D950   02B8 00FF
        MVO     R0,     G_01C4                  ; D952   0240 01C4
        MVII    #$0020, R0                      ; D954   02B8 0020
        CMP     G_01BA, R0                      ; D956   0340 01BA
        BEQ     L_DA00                          ; D958   0204 00A6

        MVO     R0,     G_01BA                  ; D95A   0240 01BA
        SDBD                                    ; D95C   0001
        MVII    #$D980, R4                      ; D95D   02BC 0080 00D9
        MVI     G_01A6, R0                      ; D960   0280 01A6
        CMPI    #$001A, R0                      ; D962   0378 001A
        BLT     L_D968                          ; D964   0205 0002

        ADDI    #$0004, R4                      ; D966   02FC 0004
L_D968:
        MVI     G_0350, R0                      ; D968   0280 0350
        SDBD                                    ; D96A   0001
        CMPI    #$3000, R0                      ; D96B   0378 0000 0030
        BC      L_D972                          ; D96E   0201 0002

        ADDI    #$0002, R4                      ; D970   02FC 0002

L_D972:
        JSR     R5,     L_DD81                  ; D972   0004 01DC 0181
        JSR     R5,     L_D5DA                  ; D975   0004 01D4 01DA

        CLRR    R0                              ; D978   01C0
        MVO     R0,     G_0351                  ; D979   0240 0351

        JSR     R5,     L_DD8F                  ; D97B   0004 01DC 018F

        B       L_D9AA                          ; D97E   0200 002A

        DECR    R6                              ; D980   0016
        SLLC    R0,     2                       ; D981   005C
        SLLC    R2,     1                       ; D982   005A
L_D983:
        DECR    R7                              ; D983   0017

        DECLE   $022E,  $005C                   ; D984   022E 005C

        XORR    R4,     R6                      ; D986   01E6
L_D987:
        DECR    R7                              ; D987   0017

L_D988:
        MVI     G_01BA, R0                      ; D988   0280 01BA
        CMPI    #$0001, R0                      ; D98A   0378 0001
        BEQ     L_DA00                          ; D98C   0204 0072

        MVII    #$0355, R1                      ; D98E   02B9 0355

        JSR     R5,     L_DA41                  ; D990   0004 01D8 0241

        DECR    R6                              ; D993   0016
        SLLC    R1,     2                       ; D994   005D
        BC      L_DA00                          ; D995   0201 0069

        JSR     R5,     X_PLAY_WHST1            ; D997   0004 011C 031B
        JSR     R5,     L_D83F                  ; D99A   0004 01D8 003F

        CLRR    R0                              ; D99D   01C0
        MVO     R0,     G_0351                  ; D99E   0240 0351
        COMR    R0                              ; D9A0   0018
        MVO     R0,     G_01B9                  ; D9A1   0240 01B9

        JSR     R5,     L_DD8F                  ; D9A3   0004 01DC 018F

        MVII    #$0001, R0                      ; D9A6   02B8 0001
        MVO     R0,     G_01BA                  ; D9A8   0240 01BA
L_D9AA:
        MVII    #$0001, R0                      ; D9AA   02B8 0001
        SDBD                                    ; D9AC   0001
        MVII    #$D9B4, R1                      ; D9AD   02B9 00B4 00D9

        JSR     R5,     .EXEC.A5E               ; D9B0   0004 0118 025E

        PULR    R7                              ; D9B3   02B7

        MVI     G_017E, R0                      ; D9B4   0280 017E
        CMPI    #$00FF, R0                      ; D9B6   0378 00FF
        BNEQ    L_D9AA                          ; D9B8   022C 000F

        MVI     G_01BA, R0                      ; D9BA   0280 01BA
        CMPI    #$0001, R0                      ; D9BC   0378 0001
        BEQ     L_D9D7                          ; D9BE   0204 0017

        CMPI    #$0020, R0                      ; D9C0   0378 0020
        BEQ     L_D9D7                          ; D9C2   0204 0013

        CMPI    #$0010, R0                      ; D9C4   0378 0010
        BNEQ    L_D9CB                          ; D9C6   020C 0003
        J       L_DD39                          ; D9C8   0004 03DC 0139

L_D9CB:
        CMPI    #$0008, R0                      ; D9CB   0378 0008
        BEQ     L_DB08                          ; D9CD   0204 0139

        CMPI    #$0040, R0                      ; D9CF   0378 0040
        BNEQ    L_D9D6                          ; D9D1   020C 0003
        J       L_578C                          ; D9D3   0004 0354 038C
L_D9D6:
        PULR    R7                              ; D9D6   02B7

L_D9D7:
        MVII    #$0006, R0                      ; D9D7   02B8 0006

        JSR     R5,     .EXEC.772               ; D9D9   0004 0114 0372

        SUBI    #$0006, R3                      ; D9DC   033B 0006
        SWAP    R2,     1                       ; D9DE   0042
        XORR    R3,     R2                      ; D9DF   01DA
        MVII    #$0019, R3                      ; D9E0   02BB 0019
        MVII    #$0002, R0                      ; D9E2   02B8 0002
        MVO     R0,     G_01C4                  ; D9E4   0240 01C4
        MVI     G_01B2, R1                      ; D9E6   0281 01B2
        CMPI    #$0003, R1                      ; D9E8   0379 0003
        BGE     L_D9F0                          ; D9EA   020D 0004

        MVII    #$0005, R0                      ; D9EC   02B8 0005
        MVO     R0,     G_01C4                  ; D9EE   0240 01C4

L_D9F0:
        JSR     R5,     .EXEC.9AD               ; D9F0   0004 0118 01AD

        ADDI    #$01A9, R0                      ; D9F3   02F8 01A9
        MOVR    R0,     R1                      ; D9F5   0081
        MVI@    R1,     R0                      ; D9F6   0288
        XORI    #$0002, R0                      ; D9F7   03F8 0002
        MVO@    R0,     R1                      ; D9F9   0248
        CLRR    R0                              ; D9FA   01C0
        MVO     R0,     G_01BB                  ; D9FB   0240 01BB

        JSR     R5,     L_DBB9                  ; D9FD   0004 01D8 03B9

L_DA00:
        PULR    R7                              ; DA00   02B7

L_DA01:
        MVI     G_01A6, R2                      ; DA01   0282 01A6
        SLL     R2,     2                       ; DA03   004E
        SLL     R2,     1                       ; DA04   004A
        SUBR    R2,     R0                      ; DA05   0110
        PULR    R1                              ; DA06   02B1
        PSHR    R1                              ; DA07   0271
        ADDI    #$0002, R1                      ; DA08   02F9 0002
        SWAP    R0,     1                       ; DA0A   0040
        MVO@    R0,     R1                      ; DA0B   0248
        MOVR    R5,     R7                      ; DA0C   00AF

L_DA0D:
        MOVR    R5,     R4                      ; DA0D   00AC

        JSR     R5,     .EXEC.777               ; DA0E   0004 0114 0377

        MVI     G_01A6, R1                      ; DA11   0281 01A6
        SLL     R1,     2                       ; DA13   004D
        SLL     R1,     1                       ; DA14   0049
        SDBD                                    ; DA15   0001
        MVI@    R4,     R0                      ; DA16   02A0
        PSHR    R0                              ; DA17   0270
        ADDR    R2,     R1                      ; DA18   00D1

        JSR     R5,     X_MPY                   ; DA19   0004 011C 01DC

        MOVR    R3,     R1                      ; DA1C   0099
        SDBD                                    ; DA1D   0001
        MVI@    R4,     R0                      ; DA1E   02A0
        MOVR    R2,     R3                      ; DA1F   0093

        JSR     R5,     X_MPY                   ; DA20   0004 011C 01DC

        SDBD                                    ; DA23   0001
        ADD@    R4,     R2                      ; DA24   02E2
        MOVR    R2,     R1                      ; DA25   0091
        ADDR    R2,     R3                      ; DA26   00D3
        PULR    R2                              ; DA27   02B2
        NEGR    R1                              ; DA28   0021

        JSR     R5,     X_DIV                   ; DA29   0004 011C 01FB

        TSTR    R3                              ; DA2C   009B
        BMI     L_DA31                          ; DA2D   020B 0002

        SETC                                    ; DA2F   0007
        MOVR    R4,     R7                      ; DA30   00A7

L_DA31:
        CLRC                                    ; DA31   0006
        MOVR    R4,     R7                      ; DA32   00A7

L_DA33:
        PSHR    R5                              ; DA33   0275
        MVI     G_01A6, R5                      ; DA34   0285 01A6
        CLRR    R0                              ; DA36   01C0
        CMPI    #$001A, R5                      ; DA37   037D 001A
        BGT     L_DA3C                          ; DA39   020E 0001

        INCR    R0                              ; DA3B   0008
L_DA3C:
        PULR    R5                              ; DA3C   02B5
L_DA3D:
        XOR     G_01B6, R0                      ; DA3D   03C0 01B6
        SARC    R0,     1                       ; DA3F   0078
        MOVR    R5,     R7                      ; DA40   00AF

L_DA41:
        MOVR    R5,     R4                      ; DA41   00AC

        JSR     R5,     .EXEC.777               ; DA42   0004 0114 0377

L_DA45:
        MVI@    R4,     R0                      ; DA45   02A0
        CMPR    R0,     R3                      ; DA46   0143
        BLT     L_DA4F                          ; DA47   0205 0006

        MVI@    R4,     R0                      ; DA49   02A0
        CMPR    R0,     R3                      ; DA4A   0143
        BGT     L_DA50                          ; DA4B   020E 0003

        SETC                                    ; DA4D   0007
        MOVR    R4,     R7                      ; DA4E   00A7

L_DA4F:
        INCR    R4                              ; DA4F   000C
L_DA50:
        CLRC                                    ; DA50   0006
        MOVR    R4,     R7                      ; DA51   00A7

L_DA52:
        MOVR    R5,     R4                      ; DA52   00AC

        JSR     R5,     .EXEC.777               ; DA53   0004 0114 0377

        MOVR    R3,     R0                      ; DA56   0098
        MOVR    R2,     R3                      ; DA57   0093
        MOVR    R0,     R2                      ; DA58   0082
        B       L_DA45                          ; DA59   0220 0015

L_DA5B:
        SDBD                                    ; DA5B   0001
        ADDI    #$DABB, R4                      ; DA5C   02FC 00BB 00DA
L_DA5F:
        PSHR    R5                              ; DA5F   0275
        MVII    #$0003, R5                      ; DA60   02BD 0003
        MVII    #$0019, R3                      ; DA62   02BB 0019
L_DA64:
        SDBD                                    ; DA64   0001
        MVI@    R4,     R2                      ; DA65   02A2
        PSHR    R5                              ; DA66   0275

        JSR     R5,     .EXEC.9AD               ; DA67   0004 0118 01AD

        SLR     R3,     1                       ; DA6A   0063
        INCR    R0                              ; DA6B   0008
        PULR    R5                              ; DA6C   02B5
        DECR    R5                              ; DA6D   0015
        BNEQ    L_DA64                          ; DA6E   022C 000B
        PULR    R7                              ; DA70   02B7

L_DA71:
        PSHR    R5                              ; DA71   0275
        MVII    #$0002, R0                      ; DA72   02B8 0002
        MVO     R0,     G_01BA                  ; DA74   0240 01BA
        CLRR    R0                              ; DA76   01C0
        MVO     R0,     G_01BB                  ; DA77   0240 01BB
        MVO     R0,     G_0351                  ; DA79   0240 0351
        MVII    #$0005, R0                      ; DA7B   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; DA7D   0004 011C 02D5

        MVII    #$0054, R0                      ; DA80   02B8 0054
        SWAP    R0,     1                       ; DA82   0040
        MVO     R0,     G_034F                  ; DA83   0240 034F
        MVO     R0,     G_0357                  ; DA85   0240 0357
        MVII    #$0034, R0                      ; DA87   02B8 0034
        SWAP    R0,     1                       ; DA89   0040
        MVO     R0,     G_0350                  ; DA8A   0240 0350
        MVO     R0,     G_0358                  ; DA8C   0240 0358

        JSR     R5,     L_D5DA                  ; DA8E   0004 01D4 01DA

        MVII    #$0003, R0                      ; DA91   02B8 0003
        MVI     G_01B9, R1                      ; DA93   0281 01B9
        CMPI    #$0003, R1                      ; DA95   0379 0003
        BLT     L_DA9A                          ; DA97   0205 0001

        SWAP    R0,     1                       ; DA99   0040

L_DA9A:
        JSR     R5,     X_UNPK_BYTES            ; DA9A   0004 0114 0357

        PSHR    R1                              ; DA9D   0271
        PSHR    R0                              ; DA9E   0270

        JSR     R5,     L_DA3D                  ; DA9F   0004 01D8 023D

        CLRR    R4                              ; DAA2   01E4
        BNC     L_DAA7                          ; DAA3   0209 0002

        MVII    #$0006, R4                      ; DAA5   02BC 0006
L_DAA7:
        PULR    R0                              ; DAA7   02B0
        PSHR    R4                              ; DAA8   0274

        JSR     R5,     L_DA5B                  ; DAA9   0004 01D8 025B

        PULR    R4                              ; DAAC   02B4
        ADDI    #$000C, R4                      ; DAAD   02FC 000C
        PULR    R0                              ; DAAF   02B0

        JSR     R5,     L_DA5B                  ; DAB0   0004 01D8 025B

        MVII    #$0006, R0                      ; DAB3   02B8 0006
        MVO     R0,     G_01BC                  ; DAB5   0240 01BC

        JSR     R5,     L_5743                  ; DAB7   0004 0154 0343

        PULR    R7                              ; DABA   02B7

        DECLE   $0030,  $0048,  $0026,  $0048   ; DABB   0030 0048 0026 0048
        DECLE   $0036,  $0048,  $0030,  $0058   ; DABF   0036 0048 0030 0058
        DECLE   $0026,  $0058,  $0036           ; DAC3   0026 0058 0036

        SLLC    R0,     1                       ; DAC6   0058
        GSWD    R0                              ; DAC7   0030
        TSTR    R0                              ; DAC8   0080
        COMR    R4                              ; DAC9   001C
        SAR     R0,     1                       ; DACA   0068
        RSWD    R6                              ; DACB   003E
        SAR     R0,     1                       ; DACC   0068
        GSWD    R0                              ; DACD   0030
        ADCR    R1                              ; DACE   0029
        COMR    R4                              ; DACF   001C
        SWAP    R0,     1                       ; DAD0   0040
        RSWD    R6                              ; DAD1   003E
        SWAP    R0,     1                       ; DAD2   0040
L_DAD3:
        PSHR    R5                              ; DAD3   0275
        MVII    #$0008, R0                      ; DAD4   02B8 0008
        CMP     G_01BA, R0                      ; DAD6   0340 01BA
        BEQ     L_DB3E                          ; DAD8   0204 0064

        MVO     R0,     G_01BA                  ; DADA   0240 01BA
        CLRR    R0                              ; DADC   01C0
        MVO     R0,     G_01BB                  ; DADD   0240 01BB
        MVO     R0,     G_0351                  ; DADF   0240 0351
        MVO     R0,     G_0353                  ; DAE1   0240 0353
        SDBD                                    ; DAE3   0001
        MVII    #$DB06, R4                      ; DAE4   02BC 0006 00DB
        MVI@    R4,     R1                      ; DAE7   02A1
        MVI     G_01A6, R0                      ; DAE8   0280 01A6
        CMPI    #$001A, R0                      ; DAEA   0378 001A
        BLT     L_DAEF                          ; DAEC   0205 0001

        MVI@    R4,     R1                      ; DAEE   02A1
L_DAEF:
        SUBR    R0,     R1                      ; DAEF   0101
        SLL     R1,     2                       ; DAF0   004D
        SLL     R1,     1                       ; DAF1   0049
        SWAP    R1,     1                       ; DAF2   0041
        MVO     R1,     G_034F                  ; DAF3   0241 034F
        MVII    #$002D, R1                      ; DAF5   02B9 002D
        SWAP    R1,     1                       ; DAF7   0041
        MVO     R1,     G_0350                  ; DAF8   0241 0350

        JSR     R5,     L_DD8F                  ; DAFA   0004 01DC 018F

        MVI     G_017E, R5                      ; DAFD   0285 017E
        CMPI    #$00FF, R5                      ; DAFF   037D 00FF
        BEQ     L_DB08                          ; DB01   0204 0005
        J       L_D9AA                          ; DB03   0004 03D8 01AA

        SETC                                    ; DB06   0007
        SWAP    R1,     1                       ; DB07   0041

L_DB08:
        JSR     R5,     L_58A8                  ; DB08   0004 0158 00A8
        JSR     R5,     L_DD8F                  ; DB0B   0004 01DC 018F

        MVII    #$0028, R0                      ; DB0E   02B8 0028
        MVO     R0,     G_0353                  ; DB10   0240 0353
        MVII    #$01B7, R1                      ; DB12   02B9 01B7

        JSR     R5,     L_DA33                  ; DB14   0004 01D8 0233

        BNC     L_DB1B                          ; DB17   0209 0002

        MVII    #$01B8, R1                      ; DB19   02B9 01B8
L_DB1B:
        MVI@    R1,     R0                      ; DB1B   0288
        MOVR    R0,     R2                      ; DB1C   0082
        ANDI    #$000F, R0                      ; DB1D   03B8 000F
        CMPI    #$0009, R0                      ; DB1F   0378 0009
        BNEQ    L_DB27                          ; DB21   020C 0004

        ADDI    #$0010, R2                      ; DB23   02FA 0010
        CLRR    R0                              ; DB25   01C0
        INCR    R7                              ; DB26   000F

L_DB27:
        INCR    R0                              ; DB27   0008
L_DB28:
        ANDI    #$00F0, R2                      ; DB28   03BA 00F0
        XORR    R2,     R0                      ; DB2A   01D0
        MVO@    R0,     R1                      ; DB2B   0248
        SDBD                                    ; DB2C   0001
        MVII    #$DB5A, R3                      ; DB2D   02BB 005A 00DB

        JSR     R5,     L_DB3F                  ; DB30   0004 01D8 033F
        JSR     R5,     L_5743                  ; DB33   0004 0154 0343
        JSR     R5,     L_57B7                  ; DB36   0004 0154 03B7

        MVII    #$0005, R0                      ; DB39   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; DB3B   0004 011C 02D5

L_DB3E:
        PULR    R7                              ; DB3E   02B7

L_DB3F:
        PSHR    R5                              ; DB3F   0275
        MVII    #$01A9, R4                      ; DB40   02BC 01A9
        MVII    #$031E, R2                      ; DB42   02BA 031E
        CMPI    #$01B7, R1                      ; DB44   0379 01B7
        BEQ     L_DB4C                          ; DB46   0204 0004

        ADDI    #$0003, R4                      ; DB48   02FC 0003
        MVII    #$0336, R2                      ; DB4A   02BA 0336
L_DB4C:
        MVII    #$0003, R1                      ; DB4C   02B9 0003
L_DB4E:
        MVI@    R4,     R0                      ; DB4E   02A0
        XORI    #$0004, R0                      ; DB4F   03F8 0004
        DECR    R4                              ; DB51   0014
        MVO@    R0,     R4                      ; DB52   0260
        MVO@    R3,     R2                      ; DB53   0253
        ADDI    #$0008, R2                      ; DB54   02FA 0008
        DECR    R1                              ; DB56   0011
        BNEQ    L_DB4E                          ; DB57   022C 000A
        PULR    R7                              ; DB59   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; DB5A   0000 0000 0000 0000
        DECLE   $0001,  $0018,  $0000           ; DB5E   0001 0018 0000
L_DB61:
        PSHR    R5                              ; DB61   0275
        MVI     G_01BA, R0                      ; DB62   0280 01BA
        SDBD                                    ; DB64   0001
        ANDI    #$004A, R0                      ; DB65   03B8 004A 0000
        BNEQ    L_DB9D                          ; DB68   020C 0033

        MVII    #$031D, R1                      ; DB6A   02B9 031D
        MVII    #$01A9, R4                      ; DB6C   02BC 01A9
        MVII    #$01C6, R3                      ; DB6E   02BB 01C6
L_DB70:
        MVI@    R4,     R0                      ; DB70   02A0
        ANDI    #$0002, R0                      ; DB71   03B8 0002
        BNEQ    L_DB96                          ; DB73   020C 0021

        PSHR    R1                              ; DB75   0271
        PSHR    R4                              ; DB76   0274
        PSHR    R3                              ; DB77   0273

        JSR     R5,     L_DA41                  ; DB78   0004 01D8 0241

        DECR    R3                              ; DB7B   0013
        RLC     R2,     2                       ; DB7C   0056
        PULR    R3                              ; DB7D   02B3
        BC      L_DB94                          ; DB7E   0201 0014

        ADDI    #$0003, R1                      ; DB80   02F9 0003
        SWAP    R0,     1                       ; DB82   0040
        MVO@    R0,     R1                      ; DB83   0248
        MVI@    R3,     R0                      ; DB84   0298
        SWAP    R0,     1                       ; DB85   0040
        SLLC    R0,     1                       ; DB86   0058
        BC      L_DB94                          ; DB87   0201 000B

        MVI     G_01BA, R0                      ; DB89   0280 01BA
        CMPI    #$0020, R0                      ; DB8B   0378 0020
        BEQ     L_DB94                          ; DB8D   0204 0005

        ADDI    #$0001, R1                      ; DB8F   02F9 0001

        JSR     R5,     L_DB9E                  ; DB91   0004 01D8 039E

L_DB94:
        PULR    R4                              ; DB94   02B4
        PULR    R1                              ; DB95   02B1
L_DB96:
        ADDI    #$0008, R1                      ; DB96   02F9 0008
        INCR    R3                              ; DB98   000B
        CMPI    #$0345, R1                      ; DB99   0379 0345
        BLE     L_DB70                          ; DB9B   0226 002C
L_DB9D:
        PULR    R7                              ; DB9D   02B7

L_DB9E:
        MVI@    R1,     R0                      ; DB9E   0288
        MOVR    R0,     R2                      ; DB9F   0082
        ANDI    #$00FF, R0                      ; DBA0   03B8 00FF
        SDBD                                    ; DBA2   0001
        ANDI    #$FF00, R2                      ; DBA3   03BA 0000 00FF
        SWAP    R0,     1                       ; DBA6   0040
        NEGR    R0                              ; DBA7   0020
        SWAP    R0,     1                       ; DBA8   0040
L_DBA9:
        XORR    R0,     R2                      ; DBA9   01C2
        MVO@    R2,     R1                      ; DBAA   024A
        SUBI    #$0004, R1                      ; DBAB   0339 0004
        MOVR    R5,     R7                      ; DBAD   00AF

L_DBAE:
        MVI@    R1,     R0                      ; DBAE   0288
        MOVR    R0,     R2                      ; DBAF   0082
        SDBD                                    ; DBB0   0001
        ANDI    #$FF00, R0                      ; DBB1   03B8 0000 00FF
        ANDI    #$00FF, R2                      ; DBB4   03BA 00FF
        NEGR    R0                              ; DBB6   0020
        B       L_DBA9                          ; DBB7   0220 000F

L_DBB9:
        PSHR    R5                              ; DBB9   0275
        MVI     G_01BA, R0                      ; DBBA   0280 01BA
        CMPI    #$0020, R0                      ; DBBC   0378 0020
        BNEQ    L_DBD1                          ; DBBE   020C 0011

        SDBD                                    ; DBC0   0001
        MVII    #$F3DA, R4                      ; DBC1   02BC 00DA 00F3
        MVI     G_01A6, R0                      ; DBC4   0280 01A6
        CMPI    #$001A, R0                      ; DBC6   0378 001A
        BLE     L_DBCC                          ; DBC8   0206 0002

        ADDI    #$000C, R4                      ; DBCA   02FC 000C
L_DBCC:
        SDBD                                    ; DBCC   0001
        MVI@    R4,     R2                      ; DBCD   02A2
        SWAP    R2,     1                       ; DBCE   0042
        B       L_DBDD                          ; DBCF   0200 000C

L_DBD1:
        MVII    #$034F, R4                      ; DBD1   02BC 034F
        MVI@    R4,     R0                      ; DBD3   02A0
        MVI@    R4,     R2                      ; DBD4   02A2
        SWAP    R2,     1                       ; DBD5   0042
        ANDI    #$00FF, R2                      ; DBD6   03BA 00FF
        SDBD                                    ; DBD8   0001
        ANDI    #$FF00, R0                      ; DBD9   03B8 0000 00FF
        XORR    R0,     R2                      ; DBDC   01C2
L_DBDD:
        MVO     R2,     G_035C                  ; DBDD   0242 035C
        MVI     G_01C4, R1                      ; DBDF   0281 01C4
        PSHR    R1                              ; DBE1   0271

        JSR     R5,     L_5E05                  ; DBE2   0004 015C 0205

        MOVR    R1,     R3                      ; DBE5   008B
        MOVR    R4,     R1                      ; DBE6   00A1

        JSR     R5,     .EXEC.766               ; DBE7   0004 0114 0366

        MOVR    R0,     R1                      ; DBEA   0081
        PULR    R2                              ; DBEB   02B2
L_DBEC:
        PSHR    R2                              ; DBEC   0272
        CMPR    R1,     R2                      ; DBED   014A
        BEQ     L_DC01                          ; DBEE   0204 0011

        MOVR    R1,     R2                      ; DBF0   008A
        ADDI    #$01C6, R2                      ; DBF1   02FA 01C6
        MVI@    R2,     R0                      ; DBF3   0290
        SWAP    R0,     1                       ; DBF4   0040
        SLLC    R0,     1                       ; DBF5   0058
        BC      L_DC01                          ; DBF6   0201 0009

        PSHR    R1                              ; DBF8   0271

        JSR     R5,     L_5D7B                  ; DBF9   0004 015C 017B

        PULR    R1                              ; DBFC   02B1
        CMPI    #$0014, R2                      ; DBFD   037A 0014
        BGT     L_DC11                          ; DBFF   020E 0010

L_DC01:
        ADDI    #$0008, R3                      ; DC01   02FB 0008
        PULR    R2                              ; DC03   02B2
        INCR    R1                              ; DC04   0009
        CMPI    #$0003, R1                      ; DC05   0379 0003
        BEQ     L_DC10                          ; DC07   0204 0007

        CMPI    #$0006, R1                      ; DC09   0379 0006
        BEQ     L_DC10                          ; DC0B   0204 0003
        B       L_DBEC                          ; DC0D   0220 0022

        PULR    R2                              ; DC0F   02B2
L_DC10:
        PULR    R7                              ; DC10   02B7

L_DC11:
        MVI     G_035C, R2                      ; DC11   0282 035C
        MOVR    R1,     R3                      ; DC13   008B
        ADDI    #$01A9, R3                      ; DC14   02FB 01A9
        MVI@    R3,     R0                      ; DC16   0298
        XORI    #$0008, R0                      ; DC17   03F8 0008
        MVO@    R0,     R3                      ; DC19   0258
        MVII    #$0019, R3                      ; DC1A   02BB 0019
        MOVR    R1,     R0                      ; DC1C   0088

        JSR     R5,     .EXEC.9B9               ; DC1D   0004 0118 01B9

        PSHR    R1                              ; DC20   0271
        ADDI    #$0006, R1                      ; DC21   02F9 0006
        MVI@    R1,     R2                      ; DC23   028A
        SLR     R2,     1                       ; DC24   0062
        INCR    R2                              ; DC25   000A
        MVO@    R2,     R1                      ; DC26   024A
        PULR    R3                              ; DC27   02B3
        MOVR    R0,     R1                      ; DC28   0081
        B       L_DC01                          ; DC29   0220 0029

L_DC2B:
        PSHR    R5                              ; DC2B   0275
        MVI     G_01BA, R0                      ; DC2C   0280 01BA
        CMPI    #$0004, R0                      ; DC2E   0378 0004
        BNEQ    L_DC48                          ; DC30   020C 0016

        MVI     G_01B9, R0                      ; DC32   0280 01B9
        CMPI    #$00FF, R0                      ; DC34   0378 00FF
        BEQ     L_DC48                          ; DC36   0204 0010

        MVI     G_0351, R0                      ; DC38   0280 0351
        TSTR    R0                              ; DC3A   0080
        BEQ     L_DC48                          ; DC3B   0204 000B

        MVII    #$0001, R0                      ; DC3D   02B8 0001

        JSR     R5,     X_RAND1                 ; DC3F   0004 0114 027D

        TSTR    R0                              ; DC42   0080
        BNEQ    L_DC48                          ; DC43   020C 0003

        JSR     R5,     L_D0FD                  ; DC45   0004 01D0 00FD

L_DC48:
        PULR    R7                              ; DC48   02B7

L_DC49:
        PSHR    R5                              ; DC49   0275
        MVI     G_01BD, R0                      ; DC4A   0280 01BD
        XORI    #$0001, R0                      ; DC4C   03F8 0001
        MVO     R0,     G_01BD                  ; DC4E   0240 01BD
        TSTR    R0                              ; DC50   0080
        BEQ     L_DC71                          ; DC51   0204 001E

        SDBD                                    ; DC53   0001
        MVII    #$DC78, R1                      ; DC54   02B9 0078 00DC
        MVI     G_01A6, R0                      ; DC57   0280 01A6
        CMPI    #$001A, R0                      ; DC59   0378 001A
        BLT     L_DC61                          ; DC5B   0205 0004

        SDBD                                    ; DC5D   0001
        ADDI    #$FFFA, R1                      ; DC5E   02F9 00FA 00FF
L_DC61:
        DIS                                     ; DC61   0003
        MVO     R1,     .ISRVEC.0               ; DC62   0241 0100
        SWAP    R1,     1                       ; DC64   0041
        MVO     R1,     .ISRVEC.1               ; DC65   0241 0101
        MVII    #$0001, R1                      ; DC67   02B9 0001
        MVO     R1,     G_017D                  ; DC69   0241 017D
        EIS                                     ; DC6B   0002
L_DC6C:
        MVI     G_017D, R1                      ; DC6C   0281 017D
        TSTR    R1                              ; DC6E   0089
        BNEQ    L_DC6C                          ; DC6F   022C 0004
L_DC71:
        PULR    R7                              ; DC71   02B7

        SDBD                                    ; DC72   0001
        MVII    #$DC8C, R4                      ; DC73   02BC 008C 00DC
        B       L_DC7C                          ; DC76   0200 0004

        SDBD                                    ; DC78   0001
        MVII    #$DC95, R4                      ; DC79   02BC 0095 00DC
L_DC7C:
        PSHR    R5                              ; DC7C   0275
        SDBD                                    ; DC7D   0001
        MVII    #$38D0, R5                      ; DC7E   02BD 00D0 0038
L_DC81:
        MVI@    R4,     R0                      ; DC81   02A0
        CMPI    #$00FF, R0                      ; DC82   0378 00FF
        BEQ     L_DC89                          ; DC84   0204 0003

        MVO@    R0,     R5                      ; DC86   0268
        B       L_DC81                          ; DC87   0220 0007
L_DC89:
        J       L_61F1                          ; DC89   0004 0360 01F1
        ADDR    R4,     R7                      ; DC8C   00E7

        DECLE   $00F3,  $00F1,  $00E1,  $00F3   ; DC8D   00F3 00F1 00E1 00F3
        DECLE   $00F3,  $00F9,  $00F3,  $00FF   ; DC91   00F3 00F9 00F3 00FF

        ADDR    R4,     R7                      ; DC95   00E7
        ADDR    R1,     R7                      ; DC96   00CF
        MOVR    R1,     R7                      ; DC97   008F
        MOVR    R0,     R7                      ; DC98   0087
        ADDR    R1,     R7                      ; DC99   00CF
        ADDR    R1,     R7                      ; DC9A   00CF
        MOVR    R3,     R7                      ; DC9B   009F
        ADDR    R1,     R7                      ; DC9C   00CF

        DECLE   $00FF                           ; DC9D   00FF
L_DC9E:
        PSHR    R5                              ; DC9E   0275
        MVI     G_01BD, R0                      ; DC9F   0280 01BD
        ANDI    #$0001, R0                      ; DCA1   03B8 0001
        BNEQ    L_DCB3                          ; DCA3   020C 000E

        MVI     G_01A6, R0                      ; DCA5   0280 01A6
        CMPI    #$0007, R0                      ; DCA7   0378 0007
        BLE     L_DCAF                          ; DCA9   0206 0004

        CMPI    #$002B, R0                      ; DCAB   0378 002B
        BLE     L_DCB2                          ; DCAD   0206 0003

L_DCAF:
        JSR     R5,     L_DC49                  ; DCAF   0004 01DC 0049

L_DCB2:
        PULR    R7                              ; DCB2   02B7

L_DCB3:
        MVI     G_01A6, R0                      ; DCB3   0280 01A6
        CMPI    #$0006, R0                      ; DCB5   0378 0006
        BLE     L_DCC3                          ; DCB7   0206 000A

        CMPI    #$002B, R0                      ; DCB9   0378 002B
        BGE     L_DCC3                          ; DCBB   020D 0006

        JSR     R5,     L_DC49                  ; DCBD   0004 01DC 0049

        CLRR    R0                              ; DCC0   01C0
        MVO     R0,     G_01BD                  ; DCC1   0240 01BD
L_DCC3:
        PULR    R7                              ; DCC3   02B7

L_DCC4:
        PSHR    R5                              ; DCC4   0275
        MVII    #$032F, R5                      ; DCC5   02BD 032F
        MVI     G_01B6, R0                      ; DCC7   0280 01B6
        SARC    R0,     1                       ; DCC9   0078
        BNC     L_DCCE                          ; DCCA   0209 0002

        XORI    #$0038, R5                      ; DCCC   03FD 0038
L_DCCE:
        SDBD                                    ; DCCE   0001
        MVII    #$F000, R1                      ; DCCF   02B9 0000 00F0
        CLRR    R2                              ; DCD2   01D2
        MVI     G_01A6, R0                      ; DCD3   0280 01A6
        CMPI    #$001A, R0                      ; DCD5   0378 001A
        BLT     L_DCE0                          ; DCD7   0205 0007

        SDBD                                    ; DCD9   0001
        MVII    #$1000, R1                      ; DCDA   02B9 0000 0010
        COMR    R2                              ; DCDD   001A
        XORI    #$0038, R5                      ; DCDE   03FD 0038
L_DCE0:
        MVO     R2,     G_01D1                  ; DCE0   0242 01D1
        J       L_F36D                          ; DCE2   0004 03F0 036D

L_DCE5:
        PSHR    R5                              ; DCE5   0275
        MVI     G_01BD, R0                      ; DCE6   0280 01BD
        ANDI    #$0001, R0                      ; DCE8   03B8 0001
        BEQ     L_DD1C                          ; DCEA   0204 0030

        JSR     R5,     L_DA33                  ; DCEC   0004 01D8 0233

        ADCR    R1                              ; DCEF   0029
        DECR    R1                              ; DCF0   0011
        BNEQ    L_DD1C                          ; DCF1   020C 0029

L_DCF3:
        SDBD                                    ; DCF3   0001
        MVII    #$58CD, R1                      ; DCF4   02B9 00CD 0058
        MVII    #$0020, R3                      ; DCF7   02BB 0020
        CMPI    #$0005, R2                      ; DCF9   037A 0005
        BEQ     L_DD03                          ; DCFB   0204 0006

        MVII    #$00DF, R3                      ; DCFD   02BB 00DF
        SDBD                                    ; DCFF   0001
        ADDI    #$0009, R1                      ; DD00   02F9 0009 0000
L_DD03:
        MVI     G_01BD, R0                      ; DD03   0280 01BD
        ANDI    #$00FD, R0                      ; DD05   03B8 00FD
        XORI    #$0002, R0                      ; DD07   03F8 0002
        MVO     R0,     G_01BD                  ; DD09   0240 01BD
        MVI     G_017E, R2                      ; DD0B   0282 017E
        ADDI    #$02FF, R2                      ; DD0D   02FA 02FF
        MVO@    R1,     R2                      ; DD0F   0251
        ADDI    #$0003, R2                      ; DD10   02FA 0003
        MVO@    R3,     R2                      ; DD12   0253
        INCR    R2                              ; DD13   000A
        MVI@    R2,     R1                      ; DD14   0291
        SDBD                                    ; DD15   0001
        ANDI    #$FFF0, R1                      ; DD16   03B9 00F0 00FF
        XORI    #$0006, R1                      ; DD19   03F9 0006
        MVO@    R1,     R2                      ; DD1B   0251
L_DD1C:
        PULR    R7                              ; DD1C   02B7

        NOP                                     ; DD1D   0034
        ADCR    R0                              ; DD1E   0028
        ADCR    R6                              ; DD1F   002E
        NOP                                     ; DD20   0034
        ADCR    R0                              ; DD21   0028
        SWAP    R0,     1                       ; DD22   0040
        XORR    R0,     R5                      ; DD23   01C5
        ADCR    R0                              ; DD24   0028
        XORR    R1,     R3                      ; DD25   01CB
        NOP                                     ; DD26   0034
        XORR    R2,     R0                      ; DD27   01D0
        SWAP    R0,     1                       ; DD28   0040
L_DD29:
        PSHR    R5                              ; DD29   0275
        CLRR    R0                              ; DD2A   01C0
        MVO     R0,     G_0351                  ; DD2B   0240 0351
        MVO     R0,     G_0353                  ; DD2D   0240 0353
        MVII    #$0010, R0                      ; DD2F   02B8 0010
        MVO     R0,     G_01BA                  ; DD31   0240 01BA

        JSR     R5,     L_DD8F                  ; DD33   0004 01DC 018F

        J       L_D9AA                          ; DD36   0004 03D8 01AA

L_DD39:
        CLRR    R0                              ; DD39   01C0
        MVO     R0,     G_01BB                  ; DD3A   0240 01BB
        SDBD                                    ; DD3C   0001
        MVII    #$DD79, R4                      ; DD3D   02BC 0079 00DD
        MVI     G_01A6, R0                      ; DD40   0280 01A6
        CMPI    #$001A, R0                      ; DD42   0378 001A
        BLT     L_DD48                          ; DD44   0205 0002

        ADDI    #$0004, R4                      ; DD46   02FC 0004
L_DD48:
        MVI     G_0350, R0                      ; DD48   0280 0350
        SDBD                                    ; DD4A   0001
        CMPI    #$3000, R0                      ; DD4B   0378 0000 0030
        BC      L_DD52                          ; DD4E   0201 0002

        ADDI    #$0002, R4                      ; DD50   02FC 0002

L_DD52:
        JSR     R5,     L_DD81                  ; DD52   0004 01DC 0181
        JSR     R5,     L_D5DA                  ; DD55   0004 01D4 01DA

        SDBD                                    ; DD58   0001
        MVII    #$14F6, R0                      ; DD59   02B8 00F6 0014
        MVII    #$0002, R3                      ; DD5C   02BB 0002
        MVI     G_01A6, R1                      ; DD5E   0281 01A6
        CMPI    #$001A, R1                      ; DD60   0379 001A
        BLT     L_DD6A                          ; DD62   0205 0006

        SDBD                                    ; DD64   0001
        MVII    #$EAF6, R0                      ; DD65   02B8 00F6 00EA
        MVII    #$0005, R3                      ; DD68   02BB 0005
L_DD6A:
        PSHR    R0                              ; DD6A   0270

        JSR     R5,     L_DA3D                  ; DD6B   0004 01D8 023D

        BNC     L_DD72                          ; DD6E   0209 0002

        XORI    #$0007, R3                      ; DD70   03FB 0007
L_DD72:
        PULR    R0                              ; DD72   02B0
        MVO     R3,     G_01D2                  ; DD73   0243 01D2
        J       L_F303                          ; DD75   0004 03F0 0303
        PULR    R7                              ; DD78   02B7

        DECLE   $0042,  $003B,  $0055,  $0027   ; DD79   0042 003B 0055 0027
        DECLE   $0202,  $003B,  $01F2,  $0027   ; DD7D   0202 003B 01F2 0027
L_DD81:
        MVI     G_01A6, R0                      ; DD81   0280 01A6
        SLL     R0,     2                       ; DD83   004C
        SLL     R0,     1                       ; DD84   0048
        NEGR    R0                              ; DD85   0020
        ADD@    R4,     R0                      ; DD86   02E0
        SWAP    R0,     1                       ; DD87   0040
        MVO     R0,     G_034F                  ; DD88   0240 034F
        MVI@    R4,     R0                      ; DD8A   02A0
        SWAP    R0,     1                       ; DD8B   0040
        MVO     R0,     G_0350                  ; DD8C   0240 0350
        MOVR    R5,     R7                      ; DD8E   00AF

L_DD8F:
        PSHR    R5                              ; DD8F   0275
        MVI     G_017E, R5                      ; DD90   0285 017E
        ADDI    #$0304, R5                      ; DD92   02FD 0304
        MVII    #$0321, R1                      ; DD94   02B9 0321
        MVII    #$01A9, R2                      ; DD96   02BA 01A9
        CLRR    R0                              ; DD98   01C0
        SDBD                                    ; DD99   0001
        MVII    #$FFF0, R3                      ; DD9A   02BB 00F0 00FF
L_DD9D:
        MVO@    R0,     R1                      ; DD9D   0248
        INCR    R1                              ; DD9E   0009
        MVI@    R1,     R4                      ; DD9F   028C
        ANDI    #$000F, R4                      ; DDA0   03BC 000F
        XORR    R3,     R4                      ; DDA2   01DC
        MVO@    R4,     R1                      ; DDA3   024C
        ADDI    #$0001, R1                      ; DDA4   02F9 0001
        MVO@    R0,     R1                      ; DDA6   0248
        CMPR    R1,     R5                      ; DDA7   014D
        BEQ     L_DDAB                          ; DDA8   0204 0001

        MVO@    R0,     R2                      ; DDAA   0250
L_DDAB:
        INCR    R2                              ; DDAB   000A
        ADDI    #$0006, R1                      ; DDAC   02F9 0006
        CMPI    #$0351, R1                      ; DDAE   0379 0351
        BNEQ    L_DD9D                          ; DDB0   022C 0014
        PULR    R7                              ; DDB2   02B7

        MOVR    R7,     R5                      ; DDB3   00BD
        ADDR    R6,     R4                      ; DDB4   00F4
        ADDR    R1,     R7                      ; DDB5   00CF

        ADDR    R3,     R5                      ; DDB6   00DD
        SAR     R2,     2                       ; DDB7   006E
        ADDR    R3,     R6                      ; DDB8   00DE
        MOVR    R4,     R5                      ; DDB9   00A5
        ADDR    R7,     R1                      ; DDBA   00F9
        ADDR    R3,     R7                      ; DDBB   00DF

        DECLE   $0058,  $0000,  $0000,  $0081   ; DDBC   0058 0000 0000 0081
        DECLE   $0000,  $0001,  $0003,  $0004   ; DDC0   0000 0001 0003 0004
        DECLE   $0005,  $0006,  $0005,  $01F0   ; DDC4   0005 0006 0005 01F0
        DECLE   $01E0,  $01D0,  $01C0,  $01B0   ; DDC8   01E0 01D0 01C0 01B0
        DECLE   $01A0,  $0190,  $0180,  $0071   ; DDCC   01A0 0190 0180 0071
        DECLE   $001A,  $0001                   ; DDD0   001A 0001

        TSTR    R0                              ; DDD2   0080
        CLRC                                    ; DDD3   0006
        ADDR    R3,     R7                      ; DDD4   00DF

        DECLE   $0001,  $0000,  $0000,  $0000   ; DDD5   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0001   ; DDD9   0000 0000 0020 0001

        AND     .STIC.A.1,R0                    ; DDDD   0380 0011
        AND     .STIC.MODE,R0                   ; DDDF   0380 0021
        AND     .STIC.VDLY,R0                   ; DDE1   0380 0031
        AND     .BTAB.75,R0                     ; DDE3   0380 0275
        PULR    R7                              ; DDE5   02B7

L_DDE6:
        PSHR    R5                              ; DDE6   0275
        DIS                                     ; DDE7   0003
        CLRR    R0                              ; DDE8   01C0
        MVO     R0,     G_01D0                  ; DDE9   0240 01D0
        MVII    #$0013, R0                      ; DDEB   02B8 0013
        MVII    #$00DF, R1                      ; DDED   02B9 00DF
        MVO     R0,     .ISRVEC.0               ; DDEF   0240 0100
        MVO     R1,     .ISRVEC.1               ; DDF1   0241 0101
        EIS                                     ; DDF3   0002
L_DDF4:
        MVI     G_01D0, R0                      ; DDF4   0280 01D0
        TSTR    R0                              ; DDF6   0080
        BEQ     L_DDF4                          ; DDF7   0224 0004

        DIS                                     ; DDF9   0003
        PULR    R7                              ; DDFA   02B7

        MVI     G_01C5, R0                      ; DDFB   0280 01C5
        TSTR    R0                              ; DDFD   0080
        BNEQ    L_DE12                          ; DDFE   020C 0012

        MVI     .STIC.X.2,R1                    ; DE00   0281 0002
        MVI     .STIC.Y.2,R2                    ; DE02   0282 000A
        MVO     R1,     .STIC.X.3               ; DE04   0241 0003
        MVO     R2,     .STIC.Y.3               ; DE06   0242 000B
        ANDI    #$00FF, R1                      ; DE08   03B9 00FF
        ANDI    #$007F, R2                      ; DE0A   03BA 007F
        SWAP    R1,     1                       ; DE0C   0041
        SWAP    R2,     1                       ; DE0D   0042
        MVO     R1,     G_0337                  ; DE0E   0241 0337
        MVO     R2,     G_0338                  ; DE10   0242 0338
L_DE12:
        MVII    #$017B, R4                      ; DE12   02BC 017B
        SDBD                                    ; DE14   0001
        MVI@    R4,     R7                      ; DE15   02A7

L_DE16:
        PSHR    R5                              ; DE16   0275

        JSR     R5,     L_5380                  ; DE17   0004 0150 0380

        SDBD                                    ; DE1A   0001
        MVII    #$DE58, R2                      ; DE1B   02BA 0058 00DE
        MVI     G_01BA, R0                      ; DE1E   0280 01BA
        SDBD                                    ; DE20   0001
        ANDI    #$00C0, R0                      ; DE21   03B8 00C0 0000
        BNEQ    L_DE2F                          ; DE24   020C 0009

        MVI     G_01DC, R3                      ; DE26   0283 01DC
        MVI     G_01DD, R5                      ; DE28   0285 01DD
        XORR    R5,     R3                      ; DE2A   01EB
        CMPI    #$0001, R3                      ; DE2B   037B 0001
        BGT     L_DE38                          ; DE2D   020E 0009

L_DE2F:
        MVI     G_01E6, R3                      ; DE2F   0283 01E6
        SARC    R3,     1                       ; DE31   007B
        BNC     L_DE38                          ; DE32   0209 0004

        SDBD                                    ; DE34   0001
        ADDI    #$0008, R2                      ; DE35   02FA 0008 0000
L_DE38:
        MVII    #$0319, R4                      ; DE38   02BC 0319
        SDBD                                    ; DE3A   0001
        MVII    #$F40D, R5                      ; DE3B   02BD 000D 00F4
L_DE3E:
        MVII    #$0004, R1                      ; DE3E   02B9 0004
        ADDR    R1,     R4                      ; DE40   00CC
        CMPI    #$035D, R4                      ; DE41   037C 035D
        BEQ     L_DE53                          ; DE43   0204 000E

        PSHR    R4                              ; DE45   0274
L_DE46:
        SDBD                                    ; DE46   0001
        MVI@    R5,     R0                      ; DE47   02A8
        MVO@    R0,     R4                      ; DE48   0260
        DECR    R1                              ; DE49   0011
        BNEQ    L_DE46                          ; DE4A   022C 0005

        PULR    R3                              ; DE4C   02B3
        MVI@    R3,     R0                      ; DE4D   0298
        XOR@    R2,     R0                      ; DE4E   03D0
        MVO@    R0,     R3                      ; DE4F   0258
        INCR    R2                              ; DE50   000A
        B       L_DE3E                          ; DE51   0220 0014

L_DE53:
        MVII    #$000F, R0                      ; DE53   02B8 000F
        MVO     R0,     G_01E2                  ; DE55   0240 01E2
        PULR    R7                              ; DE57   02B7

        DECLE   $0011,  $0001,  $0006,  $0000   ; DE58   0011 0001 0006 0000
        DECLE   $0013,  $0002,  $0000,  $0002   ; DE5C   0013 0002 0000 0002
        DECLE   $0002,  $0000,  $0006,  $0000   ; DE60   0002 0000 0006 0000
        DECLE   $0013,  $0001,  $0000,  $0001   ; DE64   0013 0001 0000 0001
L_DE68:
        MVI@    R5,     R1                      ; DE68   02A9
        MVI@    R1,     R0                      ; DE69   0288
        SLL     R0,     1                       ; DE6A   0048
        RRC     R0,     1                       ; DE6B   0070
        MVO@    R0,     R1                      ; DE6C   0248
        MOVR    R5,     R7                      ; DE6D   00AF

        PSHR    R5                              ; DE6E   0275
L_DE6F:
        CLRR    R2                              ; DE6F   01D2
        CLRR    R3                              ; DE70   01DB
        ADDR    R0,     R7                      ; DE71   00C7
        B       L_DE7B                          ; DE72   0200 0007
        B       L_DE79                          ; DE74   0200 0003

        COMR    R3                              ; DE76   001B
        B       L_DE7C                          ; DE77   0200 0003

L_DE79:
        COMR    R2                              ; DE79   001A
        INCR    R7                              ; DE7A   000F

L_DE7B:
        INCR    R2                              ; DE7B   000A
L_DE7C:
        MVO     R2,     G_01DC                  ; DE7C   0242 01DC
        MVO     R3,     G_01DD                  ; DE7E   0243 01DD
        MVO     R0,     G_01E6                  ; DE80   0240 01E6
L_DE82:
        MVII    #$02F2, R6                      ; DE82   02BE 02F2
        SDBD                                    ; DE84   0001
        MVII    #$DDC7, R2                      ; DE85   02BA 00C7 00DD
        SDBD                                    ; DE88   0001
        MVII    #$58DF, R3                      ; DE89   02BB 00DF 0058

        JSR     R5,     L_DDE6                  ; DE8C   0004 01DC 01E6
        JSR     R5,     L_F000                  ; DE8F   0004 01F0 0000

        MVI     .ISRVEC.0,R0                    ; DE92   0280 0100
        MVO     R0,     G_017B                  ; DE94   0240 017B
        MVI     .ISRVEC.1,R0                    ; DE96   0280 0101
        MVO     R0,     G_017C                  ; DE98   0240 017C
        MVII    #$00FB, R0                      ; DE9A   02B8 00FB
        MVII    #$00DD, R1                      ; DE9C   02B9 00DD
        MVO     R0,     .ISRVEC.0               ; DE9E   0240 0100
        MVO     R1,     .ISRVEC.1               ; DEA0   0241 0101
        MVII    #$0128, R1                      ; DEA2   02B9 0128
        CLRR    R0                              ; DEA4   01C0
        MVII    #$0002, R3                      ; DEA5   02BB 0002
        MVII    #$0005, R2                      ; DEA7   02BA 0005

        JSR     R5,     L_51B3                  ; DEA9   0004 0150 01B3

        CLRR    R0                              ; DEAC   01C0
        MVO     R0,     G_01E4                  ; DEAD   0240 01E4
        MVO     R0,     G_01E5                  ; DEAF   0240 01E5
        MVO     R0,     G_033C                  ; DEB1   0240 033C

L_DEB3:
        JSR     R5,     L_DE16                  ; DEB3   0004 01DC 0216

        MVII    #$0001, R0                      ; DEB6   02B8 0001

        JSR     R5,     .EXEC.6CF               ; DEB8   0004 0114 02CF

        MVII    #$0007, R0                      ; DEBB   02B8 0007
        MVO     R0,     G_0329                  ; DEBD   0240 0329
        MVII    #$0006, R0                      ; DEBF   02B8 0006

        JSR     R5,     .EXEC.6CF               ; DEC1   0004 0114 02CF

        MVII    #$0003, R0                      ; DEC4   02B8 0003
        MVO     R0,     G_0351                  ; DEC6   0240 0351
        MVII    #$0007, R0                      ; DEC8   02B8 0007

        JSR     R5,     .EXEC.6CF               ; DECA   0004 0114 02CF

        SDBD                                    ; DECD   0001
        MVII    #$08FD, R0                      ; DECE   02B8 00FD 0008
        MVO     R0,     G_0359                  ; DED1   0240 0359
        SDBD                                    ; DED3   0001
        MVII    #$DEFC, R0                      ; DED4   02B8 00FC 00DE
        MVO     R0,     G_035D                  ; DED7   0240 035D
        MVII    #$0002, R2                      ; DED9   02BA 0002
        MVII    #$0200, R1                      ; DEDB   02B9 0200
L_DEDD:
        SDBD                                    ; DEDD   0001
        MVII    #$7FFF, R0                      ; DEDE   02B8 00FF 007F
        AND@    R1,     R0                      ; DEE1   0388
        MVO@    R0,     R1                      ; DEE2   0248
        INCR    R1                              ; DEE3   0009
        DECR    R2                              ; DEE4   0012
        BNEQ    L_DEDD                          ; DEE5   022C 0009

        MVO     R2,     G_01DB                  ; DEE7   0242 01DB
        MVO     R2,     G_01E1                  ; DEE9   0242 01E1
        MVI     G_01DD, R0                      ; DEEB   0280 01DD
        CMPI    #$00FF, R0                      ; DEED   0378 00FF
        BNEQ    L_DEFA                          ; DEEF   020C 0009

        MVII    #$0032, R0                      ; DEF1   02B8 0032
        SDBD                                    ; DEF3   0001
        MVII    #$FCF1, R1                      ; DEF4   02B9 00F1 00FC

        JSR     R5,     .EXEC.A5E               ; DEF7   0004 0118 025E

L_DEFA:
        EIS                                     ; DEFA   0002
        PULR    R7                              ; DEFB   02B7

        DECLE   $007E,  $00FF,  $0000,  $0000   ; DEFC   007E 00FF 0000 0000
        DECLE   $00C5,  $00FE,  $0000,  $0000   ; DF00   00C5 00FE 0000 0000
        DECLE   $0000,  $0000                   ; DF04   0000 0000

        PSHR    R5                              ; DF06   0275

        JSR     R5,     L_FB1D                  ; DF07   0004 01F8 031D
        JSR     R5,     L_50B4                  ; DF0A   0004 0150 00B4

        SUB@    R6,     R7                      ; DF0D   0337
        SUB@    R5,     R7                      ; DF0E   032F

        JSR     R5,     L_FCC3                  ; DF0F   0004 01FC 00C3

        PULR    R7                              ; DF12   02B7

        PSHR    R5                              ; DF13   0275
        MVO     R2,     G_02F0                  ; DF14   0242 02F0
        MOVR    R3,     R5                      ; DF16   009D

        JSRD    R4,     X_NEW_GRAM_INIT         ; DF17   0004 001E 0335

        DIS                                     ; DF1A   0003
        MVI     G_02F0, R0                      ; DF1B   0280 02F0
        SDBD                                    ; DF1D   0001
        CMPI    #$5014, R0                      ; DF1E   0378 0014 0050
        BNEQ    L_DF44                          ; DF21   020C 0021

        SDBD                                    ; DF23   0001
        MVII    #$6238, R4                      ; DF24   02BC 0038 0062
        MVI     G_01A6, R0                      ; DF27   0280 01A6
        CMPI    #$001A, R0                      ; DF29   0378 001A
        BEQ     L_DF41                          ; DF2B   0204 0014
        BLT     L_DF33                          ; DF2D   0205 0004

        SDBD                                    ; DF2F   0001
        MVII    #$631C, R4                      ; DF30   02BC 001C 0063
L_DF33:
        SDBD                                    ; DF33   0001
        MVII    #$3900, R0                      ; DF34   02B8 0000 0039

        JSR     R5,     L_6206                  ; DF37   0004 0160 0206

        SDBD                                    ; DF3A   0001
        MVII    #$3940, R0                      ; DF3B   02B8 0040 0039

        JSR     R5,     L_6206                  ; DF3E   0004 0160 0206

L_DF41:
        MVII    #$0001, R1                      ; DF41   02B9 0001
        INCR    R7                              ; DF43   000F

L_DF44:
        CLRR    R1                              ; DF44   01C9
L_DF45:
        MVO     R1,     .STIC.EDGE              ; DF45   0241 0032
        MVII    #$0001, R3                      ; DF47   02BB 0001
        MVO     R3,     G_01D0                  ; DF49   0243 01D0
        MVO     R3,     .STIC.VIDEN             ; DF4B   0243 0020
        MVI     G_017B, R0                      ; DF4D   0280 017B
        MVI     G_017C, R1                      ; DF4F   0281 017C
        MVO     R0,     .ISRVEC.0               ; DF51   0240 0100
        MVO     R1,     .ISRVEC.1               ; DF53   0241 0101
        PULR    R7                              ; DF55   02B7

        MVII    #$017B, R4                      ; DF56   02BC 017B
        SDBD                                    ; DF58   0001
        MVI@    R4,     R7                      ; DF59   02A7
        PULR    R7                              ; DF5A   02B7

        PSHR    R5                              ; DF5B   0275
        MVI     G_0331, R0                      ; DF5C   0280 0331
        MVO     R0,     G_032C                  ; DF5E   0240 032C
        MVII    #$0330, R4                      ; DF60   02BC 0330
        MVII    #$0338, R5                      ; DF62   02BD 0338
        CLRR    R0                              ; DF64   01C0
        MVII    #$0003, R3                      ; DF65   02BB 0003
L_DF67:
        MVO@    R0,     R5                      ; DF67   0268
        MVO@    R0,     R4                      ; DF68   0260
        DECR    R3                              ; DF69   0013
        BNEQ    L_DF67                          ; DF6A   022C 0004

        MVII    #$0004, R0                      ; DF6C   02B8 0004
        MVO     R0,     G_01DB                  ; DF6E   0240 01DB
        SDBD                                    ; DF70   0001
        MVII    #$5105, R4                      ; DF71   02BC 0005 0051

        JSR     R5,     L_D843                  ; DF74   0004 01D8 0043

        PULR    R7                              ; DF77   02B7

L_DF78:
        MVII    #$0003, R1                      ; DF78   02B9 0003

        JSR     R5,     L_DA33                  ; DF7A   0004 01D8 0233

        BC      L_DF80                          ; DF7D   0201 0001

        CLRR    R1                              ; DF7F   01C9
L_DF80:
        INCR    R1                              ; DF80   0009
        MVO     R1,     G_01E6                  ; DF81   0241 01E6

        JSR     R5,     L_5E05                  ; DF83   0004 015C 0205
        JSR     R5,     L_DF95                  ; DF86   0004 01DC 0395

        MVO     R0,     G_01DD                  ; DF89   0240 01DD

        JSR     R5,     L_5E15                  ; DF8B   0004 015C 0215
        JSR     R5,     L_DF95                  ; DF8E   0004 01DC 0395

        MVO     R0,     G_01DC                  ; DF91   0240 01DC
        B       L_DE82                          ; DF93   0220 0112

L_DF95:
        CLRR    R0                              ; DF95   01C0
        CMPI    #$0335, R4                      ; DF96   037C 0335
        BLT     L_DF9C                          ; DF98   0205 0002

        MVII    #$0003, R0                      ; DF9A   02B8 0003
L_DF9C:
        MOVR    R0,     R2                      ; DF9C   0082
        MOVR    R0,     R1                      ; DF9D   0081
        ADDI    #$01C6, R2                      ; DF9E   02FA 01C6
        MVI@    R2,     R3                      ; DFA0   0293
        SWAP    R3,     1                       ; DFA1   0043
        SLLC    R3,     1                       ; DFA2   005B
        BC      L_DFA8                          ; DFA3   0201 0003

        MVII    #$00FF, R0                      ; DFA5   02B8 00FF
        MOVR    R5,     R7                      ; DFA7   00AF

L_DFA8:
        ANDI    #$0001, R0                      ; DFA8   03B8 0001
        MOVR    R5,     R7                      ; DFAA   00AF

        DECLE   $0201,  $0093,  $0094,  $009A   ; DFAB   0201 0093 0094 009A
        DECLE   $009C,  $009E,  $00C0,  $00C2   ; DFAF   009C 009E 00C0 00C2
        DECLE   $0204,  $0047,  $0048,  $004B   ; DFB3   0204 0047 0048 004B
        DECLE   $0010,  $0204                   ; DFB7   0010 0204

        MVI     G_0092, R1                      ; DFB9   0281 0092
        MOVR    R3,     R1                      ; DFBB   0099
        TSTR    R3                              ; DFBC   009B
        MOVR    R3,     R5                      ; DFBD   009D
        MOVR    R3,     R7                      ; DFBE   009F

        ADDR    R0,     R1                      ; DFBF   00C1
        ADDR    R0,     R3                      ; DFC0   00C3
        MVI     .STIC.X.6,R4                    ; DFC1   0284 0006
        SWAP    R2,     2                       ; DFC3   0046
        SLL     R0,     2                       ; DFC4   004C
        SLL     R2,     2                       ; DFC5   004E
        MVI     .BTAB.0C,R4                     ; DFC6   0284 020C
        INCR    R6                              ; DFC8   000E
        SLL     R1,     1                       ; DFC9   0049
        SLL     R2,     1                       ; DFCA   004A
        INCR    R7                              ; DFCB   000F

        DECLE   $0204                           ; DFCC   0204
L_DFCD:
        SUB     .ISRVEC.0,R5                    ; DFCD   0305 0100
        DECLE   $0388,  $0103,  $0305,  $0245   ; DFCF   0388 0103 0305 0245
        DECLE   $0101,  $03C8,  $0104,  $024A   ; DFD3   0101 03C8 0104 024A
        DECLE   $0105,  $0348,  $0108,  $0245   ; DFD7   0105 0348 0108 0245
        DECLE   $0343,  $014D,  $034C,  $010B   ; DFDB   0343 014D 034C 010B
        DECLE   $0343,  $0242,  $010C,  $024E   ; DFDF   0343 0242 010C 024E
        DECLE   $010D,  $0244,  $0350,  $027E   ; DFE3   010D 0244 0350 027E
        DECLE   $000C,  $000D,  $0018,  $0019   ; DFE7   000C 000D 0018 0019
        DECLE   $002A,  $002B,  $0000,  $0010   ; DFEB   002A 002B 0000 0010
        DECLE   $0000                           ; DFEF   0000

        NEGR    R2                              ; DFF0   0022
        MOVR    R7,     R0                      ; DFF1   00B8
        COMR    R0                              ; DFF2   0018
        SLR     R3,     2                       ; DFF3   0067
        ADCR    R3                              ; DFF4   002B
        RLC     R0,     1                       ; DFF5   0050
        ADCR    R0                              ; DFF6   0028
        RLC     R3,     2                       ; DFF7   0057
        ADCR    R2                              ; DFF8   002A
L_DFF9:
        DECR    R7                              ; DFF9   0017

        ADCR    R2                              ; DFFA   002A
        MOVR    R1,     R7                      ; DFFB   008F

        ADCR    R2                              ; DFFC   002A
        DECLE   $0000,  $0000,  $0000           ; DFFD   0000 0000 0000

        ORG     $F000
L_F000:
        PSHR    R5                              ; F000   0275
        MVII    #$0200, R5                      ; F001   02BD 0200
        SDBD                                    ; F003   0001
        MVII    #$DFAB, R4                      ; F004   02BC 00AB 00DF
        SDBD                                    ; F007   0001
        MVII    #$003C, R0                      ; F008   02B8 003C 0000
L_F00B:
        PSHR    R0                              ; F00B   0270
        DECLE   $0275,  $02A0,  $0081,  $005C   ; F00C   0275 02A0 0081 005C
        DECLE   $0083,  $005C,  $005C,  $020B   ; F010   0083 005C 005C 020B
        DECLE   $001B,  $0043,  $03BB,  $000F   ; F014   001B 0043 03BB 000F
        DECLE   $0001                           ; F018   0001

        MVII    #$00E7, R5                      ; F019   02BD 00E7
        ADDR    R3,     R7                      ; F01B   00DF

        ADDR    R3,     R5                      ; F01C   00DD
        MVI@    R5,     R3                      ; F01D   02AB
        SWAP    R3,     1                       ; F01E   0043
        MVII    #$0007, R0                      ; F01F   02B8 0007
        SARC    R1,     1                       ; F021   0079
        BNC     L_F026                          ; F022   0209 0002

        MVII    #$000F, R0                      ; F024   02B8 000F
L_F026:
        XORR    R0,     R3                      ; F026   01C3
        ANDI    #$000F, R1                      ; F027   03B9 000F
        SLL     R1,     2                       ; F029   004D
        SLL     R1,     2                       ; F02A   004D
        XORR    R1,     R3                      ; F02B   01CB
        MVII    #$0001, R1                      ; F02C   02B9 0001
        B       L_F03D                          ; F02E   0200 000D

        SWAP    R3,     1                       ; F030   0043
        ANDI    #$0007, R3                      ; F031   03BB 0007
        SDBD                                    ; F033   0001
        MVII    #$DFED, R5                      ; F034   02BD 00ED 00DF
        SLL     R3,     1                       ; F037   004B
        ADDR    R3,     R5                      ; F038   00DD
        SDBD                                    ; F039   0001
        MVI@    R5,     R3                      ; F03A   02AB
        ANDI    #$003F, R1                      ; F03B   03B9 003F
L_F03D:
        PULR    R5                              ; F03D   02B5
L_F03E:
        MVO@    R3,     R5                      ; F03E   026B
        DECR    R1                              ; F03F   0011
        BNEQ    L_F03E                          ; F040   022C 0003

        PULR    R0                              ; F042   02B0
        DECR    R0                              ; F043   0010
        BNEQ    L_F00B                          ; F044   022C 003A
        PULR    R7                              ; F046   02B7

L_F047:
        PSHR    R5                              ; F047   0275
        MVI     G_01B9, R1                      ; F048   0281 01B9
        MVI     G_01D8, R0                      ; F04A   0280 01D8
        CMPR    R0,     R1                      ; F04C   0141
        BEQ     L_F117                          ; F04D   0204 00C8

        CMPI    #$00FF, R0                      ; F04F   0378 00FF
        BEQ     L_F113                          ; F051   0204 00C0

        MVI     G_01BA, R0                      ; F053   0280 01BA
        CMPI    #$0004, R0                      ; F055   0378 0004
        BNEQ    L_F113                          ; F057   020C 00BA

        MVII    #$0001, R0                      ; F059   02B8 0001
        MVI     G_01A6, R1                      ; F05B   0281 01A6
        CMPI    #$0007, R1                      ; F05D   0379 0007
        BLT     L_F066                          ; F05F   0205 0005

        NEGR    R0                              ; F061   0020
        CMPI    #$002D, R1                      ; F062   0379 002D
        BLT     L_F113                          ; F064   0205 00AD

L_F066:
        MVO     R0,     G_01DA                  ; F066   0240 01DA
        MVI     G_01B2, R1                      ; F068   0281 01B2

        JSR     R5,     L_DA33                  ; F06A   0004 01D8 0233

        BNC     L_F075                          ; F06D   0209 0006

        CMPI    #$0003, R1                      ; F06F   0379 0003
        BLT     L_F113                          ; F071   0205 00A0
        B       L_F079                          ; F073   0200 0004

L_F075:
        CMPI    #$0003, R1                      ; F075   0379 0003
        BGE     L_F113                          ; F077   020D 009A

L_F079:
        MVI     G_017E, R1                      ; F079   0281 017E
        SDBD                                    ; F07B   0001
        SUBI    #$001F, R1                      ; F07C   0339 001F 0000
        SLR     R1,     2                       ; F07F   0065
        SLR     R1,     1                       ; F080   0061
        PSHR    R1                              ; F081   0271
        CLRR    R0                              ; F082   01C0
        MVO     R0,     G_01D9                  ; F083   0240 01D9
        PSHR    R0                              ; F085   0270
L_F086:
        MVI     G_01D9, R0                      ; F086   0280 01D9

        JSR     R5,     .EXEC.772               ; F088   0004 0114 0372

        PULR    R0                              ; F08B   02B0
        INCR    R0                              ; F08C   0008
        PULR    R1                              ; F08D   02B1
        PSHR    R1                              ; F08E   0271
        CMPR    R0,     R1                      ; F08F   0141
        BNEQ    L_F093                          ; F090   020C 0001

        INCR    R0                              ; F092   0008
L_F093:
        CMPI    #$0006, R0                      ; F093   0378 0006
        BGT     L_F0BA                          ; F095   020E 0023
        BNEQ    L_F09A                          ; F097   020C 0001

        INCR    R0                              ; F099   0008
L_F09A:
        PSHR    R0                              ; F09A   0270
        PSHR    R2                              ; F09B   0272
        PSHR    R3                              ; F09C   0273

        JSR     R5,     .EXEC.772               ; F09D   0004 0114 0372

        SUB@    R6,     R3                      ; F0A0   0333
        MVI     G_01DA, R1                      ; F0A1   0281 01DA
        SWAP    R1,     1                       ; F0A3   0041
        TSTR    R1                              ; F0A4   0089
        BPL     L_F0A8                          ; F0A5   0203 0001

        NEGR    R3                              ; F0A7   0023
L_F0A8:
        ADDR    R3,     R2                      ; F0A8   00DA
        SUB@    R6,     R2                      ; F0A9   0332
        TSTR    R1                              ; F0AA   0089
        BPL     L_F0AE                          ; F0AB   0203 0001

        NEGR    R2                              ; F0AD   0022
L_F0AE:
        TSTR    R2                              ; F0AE   0092
        BMI     L_F0B3                          ; F0AF   020B 0002
        B       L_F086                          ; F0B1   0220 002C

L_F0B3:
        PULR    R1                              ; F0B3   02B1
        MVO     R1,     G_01D9                  ; F0B4   0241 01D9
        PSHR    R1                              ; F0B6   0271
        B       L_F086                          ; F0B7   0220 0032

        PULR    R1                              ; F0B9   02B1
L_F0BA:
        PULR    R1                              ; F0BA   02B1
        MVI     G_01D9, R1                      ; F0BB   0281 01D9
        CMPI    #$0007, R1                      ; F0BD   0379 0007
        BEQ     L_F113                          ; F0BF   0204 0052

        CMP     G_01B2, R1                      ; F0C1   0341 01B2
        BEQ     L_F113                          ; F0C3   0204 004E

        JSR     R5,     L_5E05                  ; F0C5   0004 015C 0205

        MOVR    R3,     R0                      ; F0C8   0098

        JSR     R5,     L_DA3D                  ; F0C9   0004 01D8 023D

        MVI     G_01DA, R1                      ; F0CC   0281 01DA
        BC      L_F0D6                          ; F0CE   0201 0006

        SWAP    R1,     1                       ; F0D0   0041
        TSTR    R1                              ; F0D1   0089
        BPL     L_F113                          ; F0D2   0203 003F
        B       L_F0DA                          ; F0D4   0200 0004

L_F0D6:
        SWAP    R1,     1                       ; F0D6   0041
        TSTR    R1                              ; F0D7   0089
        BMI     L_F113                          ; F0D8   020B 0039

L_F0DA:
        MVI     G_01A6, R2                      ; F0DA   0282 01A6
        MVI     G_01D9, R1                      ; F0DC   0281 01D9
        CLRR    R3                              ; F0DE   01DB
        CMPI    #$001A, R2                      ; F0DF   037A 001A
        BPL     L_F0E4                          ; F0E1   0203 0001

        COMR    R3                              ; F0E3   001B
L_F0E4:
        MVO     R3,     G_01D1                  ; F0E4   0243 01D1
        MVII    #$0005, R2                      ; F0E6   02BA 0005
        CMPI    #$0003, R1                      ; F0E8   0379 0003
        BLT     L_F0EE                          ; F0EA   0205 0002

        MVII    #$0002, R2                      ; F0EC   02BA 0002
L_F0EE:
        MVO     R2,     G_01D2                  ; F0EE   0242 01D2
        SLL     R1,     1                       ; F0F0   0049
        SLL     R1,     2                       ; F0F1   004D
        SDBD                                    ; F0F2   0001
        ADDI    #$031F, R1                      ; F0F3   02F9 001F 0003
        MOVR    R1,     R4                      ; F0F6   008C
        MVI@    R4,     R1                      ; F0F7   02A1
        MVO     R1,     G_0357                  ; F0F8   0241 0357
        MVI@    R4,     R2                      ; F0FA   02A2
        SDBD                                    ; F0FB   0001
        ADDI    #$0500, R2                      ; F0FC   02FA 0000 0005
        MVO     R2,     G_0358                  ; F0FF   0242 0358
        CLRR    R2                              ; F101   01D2
        MVO     R2,     G_0351                  ; F102   0242 0351
        COMR    R2                              ; F104   001A
        MVO     R2,     G_01B9                  ; F105   0242 01B9
        SDBD                                    ; F107   0001
        MVII    #$F2C4, R2                      ; F108   02BA 00C4 00F2
        MVO     R2,     G_0316                  ; F10B   0242 0316
        SDBD                                    ; F10D   0001
        MVII    #$F2E3, R2                      ; F10E   02BA 00E3 00F2
        B       L_F1EA                          ; F111   0200 00D7

L_F113:
        MVI     G_01B9, R1                      ; F113   0281 01B9
        MVO     R1,     G_01D8                  ; F115   0241 01D8
L_F117:
        PULR    R7                              ; F117   02B7

L_F118:
        CLRR    R0                              ; F118   01C0
        CMPI    #$0003, R3                      ; F119   037B 0003
        BLT     L_F11E                          ; F11B   0205 0001

        INCR    R0                              ; F11D   0008
L_F11E:
        J       L_DA3D                          ; F11E   0004 03D8 023D

        PSHR    R5                              ; F121   0275
        MVI     G_01BA, R0                      ; F122   0280 01BA
        ANDI    #$0004, R0                      ; F124   03B8 0004
        BEQ     L_F1DF                          ; F126   0204 00B7

        MVI     G_01B2, R0                      ; F128   0280 01B2
        SLL     R0,     2                       ; F12A   004C
        SLL     R0,     1                       ; F12B   0048
        SDBD                                    ; F12C   0001
        ADDI    #$031D, R0                      ; F12D   02F8 001D 0003
        CMPR    R0,     R1                      ; F130   0141
        BEQ     L_F1DF                          ; F131   0204 00AC

        MOVR    R1,     R2                      ; F133   008A
        SDBD                                    ; F134   0001
        SUBI    #$031D, R2                      ; F135   033A 001D 0003
        SLR     R2,     2                       ; F138   0066
        SLR     R2,     1                       ; F139   0062
        CMPI    #$0003, R3                      ; F13A   037B 0003
        BLT     L_F144                          ; F13C   0205 0006

        CMPI    #$0003, R2                      ; F13E   037A 0003
        BGE     L_F1DF                          ; F140   020D 009D
        B       L_F148                          ; F142   0200 0004

L_F144:
        CMPI    #$0003, R2                      ; F144   037A 0003
        BLT     L_F1DF                          ; F146   0205 0097

L_F148:
        MVO     R3,     G_01D2                  ; F148   0243 01D2
        SLL     R3,     2                       ; F14A   004F
        SLL     R3,     1                       ; F14B   004B
        SDBD                                    ; F14C   0001
        ADDI    #$0320, R3                      ; F14D   02FB 0020 0003
        MVI@    R3,     R0                      ; F150   0298
        SDBD                                    ; F151   0001
        ANDI    #$FF00, R0                      ; F152   03B8 0000 00FF
        SLR     R0,     1                       ; F155   0060
        PSHR    R1                              ; F156   0271
        ADDI    #$0003, R1                      ; F157   02F9 0003
        MVI@    R1,     R2                      ; F159   028A
        SDBD                                    ; F15A   0001
        ANDI    #$FF00, R2                      ; F15B   03BA 0000 00FF
        SLR     R2,     1                       ; F15E   0062
        PULR    R1                              ; F15F   02B1
        CMPR    R2,     R0                      ; F160   0150
        BNEQ    L_F1DF                          ; F161   020C 007C

        MVI     G_017E, R0                      ; F163   0280 017E
        SDBD                                    ; F165   0001
        SUBI    #$001F, R0                      ; F166   0338 001F 0000
        SLR     R0,     2                       ; F169   0064
        SLR     R0,     1                       ; F16A   0060
        CMP     G_01D2, R0                      ; F16B   0340 01D2
        BEQ     L_F1DF                          ; F16D   0204 0070

        SDBD                                    ; F16F   0001
        MVII    #$F176, R5                      ; F170   02BD 0076 00F1
        PSHR    R5                              ; F173   0275
        B       L_F196                          ; F174   0200 0020

        MVI     G_01D7, R0                      ; F176   0280 01D7

        JSR     R5,     .EXEC.76C               ; F178   0004 0114 036C

        MOVR    R0,     R2                      ; F17B   0082
        ADDI    #$01A9, R2                      ; F17C   02FA 01A9
        MVI@    R2,     R0                      ; F17E   0290
        SDBD                                    ; F17F   0001
        ANDI    #$FFFB, R0                      ; F180   03B8 00FB 00FF
        XORI    #$0004, R0                      ; F183   03F8 0004
        MVO@    R0,     R2                      ; F185   0250
        INCR    R1                              ; F186   0009
        SDBD                                    ; F187   0001
        MVII    #$F406, R2                      ; F188   02BA 0006 00F4
        MVO@    R2,     R1                      ; F18B   024A
        ADDI    #$0004, R1                      ; F18C   02F9 0004
        MVII    #$00F0, R2                      ; F18E   02BA 00F0
        MVO@    R2,     R1                      ; F190   024A
        INCR    R1                              ; F191   0009
        MVII    #$0014, R2                      ; F192   02BA 0014
        MVO@    R2,     R1                      ; F194   024A
        PULR    R7                              ; F195   02B7

L_F196:
        MVI     G_01D2, R2                      ; F196   0282 01D2
        MVO     R2,     G_01D7                  ; F198   0242 01D7
        MVII    #$0002, R3                      ; F19A   02BB 0002
        CMPI    #$0003, R2                      ; F19C   037A 0003
        BLT     L_F1A2                          ; F19E   0205 0002

        MVII    #$0005, R3                      ; F1A0   02BB 0005
L_F1A2:
        MVO     R3,     G_01D2                  ; F1A2   0243 01D2
        CLRR    R2                              ; F1A4   01D2

        JSR     R5,     L_F118                  ; F1A5   0004 01F0 0118

        BC      L_F1AB                          ; F1A8   0201 0001

        COMR    R2                              ; F1AA   001A
L_F1AB:
        MVO     R2,     G_01D1                  ; F1AB   0242 01D1
        ADDI    #$0004, R1                      ; F1AD   02F9 0004
        CLRR    R2                              ; F1AF   01D2
        MVO@    R2,     R1                      ; F1B0   024A
        MVO     R2,     G_0351                  ; F1B1   0242 0351
        COMR    R2                              ; F1B3   001A
        MVO     R2,     G_01B9                  ; F1B4   0242 01B9
        DECR    R1                              ; F1B6   0011
        MVI@    R1,     R3                      ; F1B7   028B
        DECR    R1                              ; F1B8   0011
        MVI@    R1,     R2                      ; F1B9   028A
        MVO     R2,     G_0357                  ; F1BA   0242 0357
        SDBD                                    ; F1BC   0001
        ADDI    #$0500, R3                      ; F1BD   02FB 0000 0005
        MVO     R3,     G_0358                  ; F1C0   0243 0358
        SUBI    #$0002, R1                      ; F1C2   0339 0002
        SWAP    R2,     1                       ; F1C4   0042
        ANDI    #$00FF, R2                      ; F1C5   03BA 00FF
        SWAP    R3,     1                       ; F1C7   0043
        ANDI    #$00FF, R3                      ; F1C8   03BB 00FF
        SLR     R2,     2                       ; F1CA   0066
        SLR     R2,     1                       ; F1CB   0062
        ADD     G_01A6, R2                      ; F1CC   02C2 01A6

        JSR     R5,     L_F213                  ; F1CE   0004 01F0 0213

        BC      L_F1E0                          ; F1D1   0201 000D

        SDBD                                    ; F1D3   0001
        MVII    #$F2C4, R2                      ; F1D4   02BA 00C4 00F2
        MVO     R2,     G_0316                  ; F1D7   0242 0316
        SDBD                                    ; F1D9   0001
        MVII    #$F2D2, R2                      ; F1DA   02BA 00D2 00F2
        B       L_F1EA                          ; F1DD   0200 000B
L_F1DF:
        PULR    R7                              ; F1DF   02B7

L_F1E0:
        SDBD                                    ; F1E0   0001
        MVII    #$F397, R2                      ; F1E1   02BA 0097 00F3
        MVO     R2,     G_0316                  ; F1E4   0242 0316
        SDBD                                    ; F1E6   0001
        MVII    #$F2DB, R2                      ; F1E7   02BA 00DB 00F2
L_F1EA:
        MVO     R2,     G_0317                  ; F1EA   0242 0317

        JSR     R5,     X_PLAY_WHST1            ; F1EC   0004 011C 031B
        JSR     R5,     L_DD8F                  ; F1EF   0004 01DC 018F
        JSR     R5,     L_D83F                  ; F1F2   0004 01D8 003F

        MVII    #$0080, R0                      ; F1F5   02B8 0080
        MVO     R0,     G_01BA                  ; F1F7   0240 01BA
L_F1F9:
        MVII    #$0001, R0                      ; F1F9   02B8 0001
        SDBD                                    ; F1FB   0001
        MVII    #$F203, R1                      ; F1FC   02B9 0003 00F2

        JSR     R5,     .EXEC.A5E               ; F1FF   0004 0118 025E

        PULR    R7                              ; F202   02B7

        MVI     G_017E, R0                      ; F203   0280 017E
        CMPI    #$00FF, R0                      ; F205   0378 00FF
        BNEQ    L_F1F9                          ; F207   022C 000F

        MVI     G_016B, R0                      ; F209   0280 016B
        TSTR    R0                              ; F20B   0080
        BNEQ    L_F1F9                          ; F20C   022C 0014

        JSR     R5,     L_F248                  ; F20E   0004 01F0 0248

        MVI     G_0316, R7                      ; F211   0287 0316

L_F213:
        PSHR    R5                              ; F213   0275
        PSHR    R2                              ; F214   0272
        CMPI    #$0050, R3                      ; F215   037B 0050
        BGT     L_F241                          ; F217   020E 0028

        CMPI    #$0020, R3                      ; F219   037B 0020
        BLT     L_F241                          ; F21B   0205 0024

        PSHR    R3                              ; F21D   0273
        SDBD                                    ; F21E   0001
        MVII    #$0355, R1                      ; F21F   02B9 0055 0003
        MVI     G_01A6, R0                      ; F222   0280 01A6
        CMPI    #$001A, R0                      ; F224   0378 001A
        BLT     L_F235                          ; F226   0205 000D

        JSR     R5,     L_DA0D                  ; F228   0004 01D8 020D
        DECLE   $0001,  $0000,  $00FF,  $00FF   ; F22B   0001 0000 00FF 00FF

        RLC     R0,     2                       ; F22F   0054
        ADDR    R7,     R6                      ; F230   00FE
        BNC     L_F240                          ; F231   0209 000D
        B       L_F244                          ; F233   0200 000F

L_F235:
        JSR     R5,     L_DA0D                  ; F235   0004 01D8 020D
        DECLE   $0001,  $0000,  $0001,  $0000   ; F238   0001 0000 0001 0000
        DECLE   $006C,  $00FF                   ; F23C   006C 00FF

        BNC     L_F244                          ; F23E   0209 0004

L_F240:
        PULR    R3                              ; F240   02B3
L_F241:
        PULR    R2                              ; F241   02B2
        CLRC                                    ; F242   0006
        PULR    R7                              ; F243   02B7

L_F244:
        PULR    R3                              ; F244   02B3
        PULR    R2                              ; F245   02B2
        SETC                                    ; F246   0007
        PULR    R7                              ; F247   02B7

L_F248:
        PSHR    R5                              ; F248   0275

        JSR     R5,     L_F29F                  ; F249   0004 01F0 029F

        MVI     G_0317, R5                      ; F24C   0285 0317
        MVII    #$02E2, R4                      ; F24E   02BC 02E2
L_F250:
        MVI@    R5,     R2                      ; F250   02AA
        TSTR    R2                              ; F251   0092
        BEQ     L_F25B                          ; F252   0204 0007

        SDBD                                    ; F254   0001
        XORI    #$2000, R2                      ; F255   03FA 0000 0020
        MVO@    R2,     R4                      ; F258   0262
        B       L_F250                          ; F259   0220 000A
L_F25B:
        PULR    R7                              ; F25B   02B7

L_F25C:
        PSHR    R5                              ; F25C   0275
        CLRR    R0                              ; F25D   01C0
        MVO     R0,     G_01BA                  ; F25E   0240 01BA

        JSR     R5,     L_F2F5                  ; F260   0004 01F0 02F5

        MVI     G_01D1, R2                      ; F263   0282 01D1
        ANDI    #$007F, R2                      ; F265   03BA 007F
        XORI    #$0080, R2                      ; F267   03FA 0080
        MVO     R2,     G_01D1                  ; F269   0242 01D1
        MVII    #$0050, R2                      ; F26B   02BA 0050
        MVO     R2,     G_035B                  ; F26D   0242 035B
        PULR    R7                              ; F26F   02B7

L_F270:
        PSHR    R5                              ; F270   0275

        JSR     R5,     L_F29F                  ; F271   0004 01F0 029F
        JSR     R5,     L_DD8F                  ; F274   0004 01DC 018F

        MVII    #$0080, R0                      ; F277   02B8 0080
        MVO     R0,     G_01BA                  ; F279   0240 01BA
        MVI     G_01D2, R0                      ; F27B   0280 01D2

        JSR     R5,     .EXEC.76C               ; F27D   0004 0114 036C

        SDBD                                    ; F280   0001
        MVII    #$034F, R5                      ; F281   02BD 004F 0003
        MOVR    R1,     R4                      ; F284   008C
        ADDI    #$0002, R4                      ; F285   02FC 0002
        MVI@    R4,     R2                      ; F287   02A2
        MVO@    R2,     R5                      ; F288   026A
        MVI@    R4,     R2                      ; F289   02A2
        SDBD                                    ; F28A   0001
        ADDI    #$0700, R2                      ; F28B   02FA 0000 0007
        MVO@    R2,     R5                      ; F28E   026A
        MOVR    R0,     R1                      ; F28F   0081
        ADDI    #$01C6, R1                      ; F290   02F9 01C6
        MVI@    R1,     R0                      ; F292   0288
        ANDI    #$0080, R0                      ; F293   03B8 0080
        BEQ     L_F29D                          ; F295   0204 0006

        SDBD                                    ; F297   0001
        ADDI    #$FFE3, R1                      ; F298   02F9 00E3 00FF
        MVO@    R0,     R1                      ; F29B   0248
        PULR    R7                              ; F29C   02B7
L_F29D:
        MVI     G_0316, R7                      ; F29D   0287 0316

L_F29F:
        PSHR    R5                              ; F29F   0275
        MVII    #$0014, R1                      ; F2A0   02B9 0014
        SDBD                                    ; F2A2   0001
        MVII    #$2803, R2                      ; F2A3   02BA 0003 0028
        MVII    #$02DC, R4                      ; F2A6   02BC 02DC
L_F2A8:
        MVO@    R2,     R4                      ; F2A8   0262
        DECR    R1                              ; F2A9   0011
        BNEQ    L_F2A8                          ; F2AA   022C 0003

        MVII    #$0024, R2                      ; F2AC   02BA 0024
        SUB     G_01A6, R2                      ; F2AE   0302 01A6
        BMI     L_F2C3                          ; F2B0   020B 0011
        BEQ     L_F2C3                          ; F2B2   0204 000F

        CMPI    #$0015, R2                      ; F2B4   037A 0015
        BGE     L_F2C3                          ; F2B6   020D 000B

        ADDI    #$02DB, R2                      ; F2B8   02FA 02DB
        CMPI    #$02EF, R2                      ; F2BA   037A 02EF
        BGT     L_F2C3                          ; F2BC   020E 0005

        SDBD                                    ; F2BE   0001
        MVII    #$280F, R1                      ; F2BF   02B9 000F 0028
        MVO@    R1,     R2                      ; F2C2   0251
L_F2C3:
        PULR    R7                              ; F2C3   02B7

        CLRR    R0                              ; F2C4   01C0
        COMR    R0                              ; F2C5   0018
        MVO     R0,     G_01D7                  ; F2C6   0240 01D7

        JSR     R5,     L_F25C                  ; F2C8   0004 01F0 025C

        SDBD                                    ; F2CB   0001
        MVII    #$F355, R2                      ; F2CC   02BA 0055 00F3
        MVO     R2,     G_0316                  ; F2CF   0242 0316
        PULR    R7                              ; F2D1   02B7

        CMPR    R1,     R7                      ; F2D2   014F
        CMPR    R6,     R7                      ; F2D3   0177
        SUBR    R4,     R7                      ; F2D4   0127

        DECLE   $014F,  $0197                   ; F2D5   014F 0197

        SUBR    R5,     R7                      ; F2D7   012F
        SUBR    R3,     R7                      ; F2D8   011F

        DECLE   $01A7,  $0000,  $0187           ; F2D9   01A7 0000 0187

        SUBR    R5,     R7                      ; F2DC   012F

        CMPR    R6,     R7                      ; F2DD   0177
        SUBR    R1,     R7                      ; F2DE   010F

        DECLE   $0167,  $01A7,  $01CF,  $0000   ; F2DF   0167 01A7 01CF 0000
        DECLE   $017F,  $0137,  $0137,  $019F   ; F2E3   017F 0137 0137 019F

        CMPR    R1,     R7                      ; F2E7   014F
        SUBR    R4,     R7                      ; F2E8   0127
        SUBR    R5,     R7                      ; F2E9   012F

        DECLE   $0000,  $013F                   ; F2EA   0000 013F

        SUBR    R1,     R7                      ; F2EC   010F

        CMPR    R5,     R7                      ; F2ED   016F
        SUBR    R5,     R7                      ; F2EE   012F

        DECLE   $0007,  $017F,  $01B7,  $012F   ; F2EF   0007 017F 01B7 012F
        DECLE   $0197,  $0000                   ; F2F3   0197 0000
L_F2F5:
        PSHR    R5                              ; F2F5   0275
        SDBD                                    ; F2F6   0001
        MVII    #$EAF6, R0                      ; F2F7   02B8 00F6 00EA
        MVI     G_01D1, R1                      ; F2FA   0281 01D1
        TSTR    R1                              ; F2FC   0089
        BEQ     L_F303                          ; F2FD   0204 0004

        SDBD                                    ; F2FF   0001
        MVII    #$14F6, R0                      ; F300   02B8 00F6 0014

L_F303:
        JSR     R5,     L_F318                  ; F303   0004 01F0 0318

        MVI     G_034F, R1                      ; F306   0281 034F
        MVI     G_0350, R2                      ; F308   0282 0350
        SWAP    R1,     1                       ; F30A   0041
        SWAP    R2,     1                       ; F30B   0042
        SUBI    #$0006, R2                      ; F30C   033A 0006
        MVO     R2,     G_01D3                  ; F30E   0242 01D3
        MVO     R1,     G_01D4                  ; F310   0241 01D4
        MVI     G_01D2, R0                      ; F312   0280 01D2
        MVII    #$0001, R5                      ; F314   02BD 0001
        B       L_F3EC                          ; F316   0200 00D4

L_F318:
        PSHR    R5                              ; F318   0275
        SDBD                                    ; F319   0001
        MVII    #$5813, R2                      ; F31A   02BA 0013 0058
        MVII    #$03F0, R3                      ; F31D   02BB 03F0
        MVII    #$01A9, R4                      ; F31F   02BC 01A9
        SDBD                                    ; F321   0001
        MVII    #$031E, R1                      ; F322   02B9 001E 0003
L_F325:
        MVI     G_01D2, R5                      ; F325   0285 01D2
        ADDI    #$01A9, R5                      ; F327   02FD 01A9
        CMPR    R4,     R5                      ; F329   0165
        BNEQ    L_F331                          ; F32A   020C 0005

L_F32C:
        ADDI    #$0005, R1                      ; F32C   02F9 0005
        INCR    R4                              ; F32E   000C
        B       L_F348                          ; F32F   0200 0017

L_F331:
        MVI     G_01D7, R5                      ; F331   0285 01D7
        ADDI    #$01A9, R5                      ; F333   02FD 01A9
        CMPR    R4,     R5                      ; F335   0165
        BEQ     L_F32C                          ; F336   0224 000B

        MVO@    R2,     R1                      ; F338   024A
        ADDI    #$0003, R1                      ; F339   02F9 0003
        MVO@    R0,     R1                      ; F33B   0248
        INCR    R1                              ; F33C   0009
        MVO@    R3,     R1                      ; F33D   024B
        INCR    R1                              ; F33E   0009
        CLRR    R5                              ; F33F   01ED
        MVO@    R5,     R1                      ; F340   024D
        MVI@    R4,     R5                      ; F341   02A5
        SDBD                                    ; F342   0001
        ANDI    #$FFFB, R5                      ; F343   03BD 00FB 00FF
        DECR    R4                              ; F346   0014
        MVO@    R5,     R4                      ; F347   0265
L_F348:
        SDBD                                    ; F348   0001
        CMPI    #$034B, R1                      ; F349   0379 004B 0003
        BEQ     L_F354                          ; F34C   0204 0006

        ADDI    #$0005, R0                      ; F34E   02F8 0005
        ADDI    #$0003, R1                      ; F350   02F9 0003
        B       L_F325                          ; F352   0220 002E
L_F354:
        PULR    R7                              ; F354   02B7

        MVII    #$0020, R0                      ; F355   02B8 0020
        MVO     R0,     G_01BA                  ; F357   0240 01BA
        MVI     G_01D2, R0                      ; F359   0280 01D2
        MOVR    R0,     R1                      ; F35B   0081
        ADDI    #$01A9, R1                      ; F35C   02F9 01A9
        MVI@    R1,     R2                      ; F35E   028A
        XORI    #$0002, R2                      ; F35F   03FA 0002
        MVO@    R2,     R1                      ; F361   024A

        JSR     R5,     .EXEC.76C               ; F362   0004 0114 036C

        CLRR    R0                              ; F365   01C0
        MVO     R0,     G_01BB                  ; F366   0240 01BB
        MVO     R0,     G_01D1                  ; F368   0240 01D1
        J       L_55D8                          ; F36A   0004 0354 01D8

L_F36D:
        MVI     G_034F, R2                      ; F36D   0282 034F
        ADDR    R1,     R2                      ; F36F   00CA
        MVO@    R2,     R5                      ; F370   026A
        MVI     G_0350, R2                      ; F371   0282 0350
        SDBD                                    ; F373   0001
        SUBI    #$0400, R2                      ; F374   033A 0000 0004
        MVO@    R2,     R5                      ; F377   026A
        MVI     G_01D1, R0                      ; F378   0280 01D1
        ANDI    #$007F, R0                      ; F37A   03B8 007F
        XORI    #$0080, R0                      ; F37C   03F8 0080
        MVO     R0,     G_01D1                  ; F37E   0240 01D1
        MVI     G_01D2, R1                      ; F380   0281 01D2
        MVO     R1,     G_01B9                  ; F382   0241 01B9
        SLL     R1,     2                       ; F384   004D
        SLL     R1,     1                       ; F385   0049
        SDBD                                    ; F386   0001
        ADDI    #$0322, R1                      ; F387   02F9 0022 0003
        MVII    #$03F0, R0                      ; F38A   02B8 03F0
        MVO@    R0,     R1                      ; F38C   0248
        MVI     G_01D2, R1                      ; F38D   0281 01D2
        ADDI    #$01A9, R1                      ; F38F   02F9 01A9
        MVII    #$0080, R0                      ; F391   02B8 0080
        MVO@    R0,     R1                      ; F393   0248
        J       L_6BD1                          ; F394   0004 0368 03D1

        MVII    #$0080, R0                      ; F397   02B8 0080
        MVO     R0,     G_01BA                  ; F399   0240 01BA

        JSR     R5,     L_DD8F                  ; F39B   0004 01DC 018F
        JSR     R5,     L_F3AF                  ; F39E   0004 01F0 03AF
        JSR     R5,     L_DA5F                  ; F3A1   0004 01D8 025F

        PULR    R0                              ; F3A4   02B0

        JSR     R5,     L_DA5F                  ; F3A5   0004 01D8 025F

        MVII    #$0006, R0                      ; F3A8   02B8 0006
        MVO     R0,     G_01D1                  ; F3AA   0240 01D1
        MVO     R0,     G_01BC                  ; F3AC   0240 01BC
        PULR    R7                              ; F3AE   02B7

L_F3AF:
        PSHR    R5                              ; F3AF   0275
        CLRR    R1                              ; F3B0   01C9
        MVII    #$0003, R3                      ; F3B1   02BB 0003
        CLRR    R0                              ; F3B3   01C0
        SDBD                                    ; F3B4   0001
        MVII    #$F3D4, R4                      ; F3B5   02BC 00D4 00F3

        JSR     R5,     L_DA3D                  ; F3B8   0004 01D8 023D

        BC      L_F3BE                          ; F3BB   0201 0001

        COMR    R0                              ; F3BD   0018
L_F3BE:
        MVI     G_01A6, R2                      ; F3BE   0282 01A6
        CMPI    #$001A, R2                      ; F3C0   037A 001A
        BGT     L_F3C9                          ; F3C2   020E 0005

        TSTR    R0                              ; F3C4   0080
        BNEQ    L_F3CE                          ; F3C5   020C 0007
        B       L_F3D0                          ; F3C7   0200 0007

L_F3C9:
        ADDI    #$000C, R4                      ; F3C9   02FC 000C
        TSTR    R0                              ; F3CB   0080
        BNEQ    L_F3D0                          ; F3CC   020C 0002

L_F3CE:
        MOVR    R3,     R1                      ; F3CE   0099
        CLRR    R3                              ; F3CF   01DB
L_F3D0:
        PULR    R5                              ; F3D0   02B5
        PSHR    R1                              ; F3D1   0271
        MOVR    R3,     R0                      ; F3D2   0098
        MOVR    R5,     R7                      ; F3D3   00AF

        ADCR    R2                              ; F3D4   002A
        SWAP    R2,     1                       ; F3D5   0042
        RSWD    R6                              ; F3D6   003E
        SLLC    R3,     2                       ; F3D7   005F
        ADCR    R0                              ; F3D8   0028
        RRC     R0,     2                       ; F3D9   0074
        ADCR    R2                              ; F3DA   002A
        RLC     R0,     2                       ; F3DB   0054
        NOP                                     ; F3DC   0034
        SLR     R3,     2                       ; F3DD   0067
        NEGR    R0                              ; F3DE   0020
        SARC    R1,     2                       ; F3DF   007D
        ADCR    R2                              ; F3E0   002A
        SAR     R2,     2                       ; F3E1   006E
        GSWD    R2                              ; F3E2   0032
        SLL     R0,     1                       ; F3E3   0048
        COMR    R5                              ; F3E4   001D
        NOP                                     ; F3E5   0034
        ADCR    R2                              ; F3E6   002A
        SLR     R2,     1                       ; F3E7   0062
        ADCR    R0                              ; F3E8   0028
        RSWD    R6                              ; F3E9   003E
        RSWD    R5                              ; F3EA   003D
        RLC     R1,     2                       ; F3EB   0055
L_F3EC:
        MVII    #$01D3, R4                      ; F3EC   02BC 01D3
        MVII    #$001E, R3                      ; F3EE   02BB 001E
        SDBD                                    ; F3F0   0001
        MVII    #$F3F8, R2                      ; F3F1   02BA 00F8 00F3
        PSHR    R2                              ; F3F4   0272
        J       L_DA64                          ; F3F5   0004 03D8 0264
        PULR    R7                              ; F3F8   02B7

        PSHR    R5                              ; F3F9   0275
        MVII    #$0002, R2                      ; F3FA   02BA 0002
        ADDI    #$0005, R1                      ; F3FC   02F9 0005
        MVO@    R2,     R1                      ; F3FE   024A
        CLRR    R2                              ; F3FF   01D2
        SDBD                                    ; F400   0001
        ADDI    #$FFFF, R1                      ; F401   02F9 00FF 00FF
        MVO@    R2,     R1                      ; F404   024A
        PULR    R7                              ; F405   02B7

        DECLE   $0000,  $0000,  $00F9,  $00F3   ; F406   0000 0000 00F9 00F3
        DECLE   $0003,  $0061,  $0000,  $0040   ; F40A   0003 0061 0000 0040
        DECLE   $0010,  $004D,  $00F4,  $0000   ; F40E   0010 004D 00F4 0000
        DECLE   $0041,  $0000,  $0058,  $0040   ; F412   0041 0000 0058 0040
        DECLE   $0010,  $0054,  $00F4,  $0000   ; F416   0010 0054 00F4 0000
        DECLE   $0041,  $0000,  $005F,  $0040   ; F41A   0041 0000 005F 0040
        DECLE   $0018,  $005B,  $00F4,  $0000   ; F41E   0018 005B 00F4 0000
        DECLE   $0057,  $0000,  $0057,  $0040   ; F422   0057 0000 0057 0040
        DECLE   $0010,  $0062,  $00F4,  $0000   ; F426   0010 0062 00F4 0000
        DECLE   $0057,  $0000,  $0057,  $0000   ; F42A   0057 0000 0057 0000
        DECLE   $0020,  $0069,  $00F4,  $0000   ; F42E   0020 0069 00F4 0000
        DECLE   $0055,  $0000,  $0037,  $00C0   ; F432   0055 0000 0037 00C0
        DECLE   $0018,  $0070,  $00F4,  $0000   ; F436   0018 0070 00F4 0000
        DECLE   $0055,  $0000,  $0028,  $00C0   ; F43A   0055 0000 0028 00C0
        DECLE   $0018,  $0079,  $00F4,  $0000   ; F43E   0018 0079 00F4 0000
        DECLE   $0055,  $0000,  $002B,  $00C0   ; F442   0055 0000 002B 00C0
        DECLE   $0018,  $0082,  $00F4,  $0000   ; F446   0018 0082 00F4 0000
        DECLE   $005D,  $0000,  $002B,  $0000   ; F44A   005D 0000 002B 0000
        DECLE   $0000,  $00D2,  $00FD,  $0006   ; F44E   0000 00D2 00FD 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; F452   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $000C   ; F456   0000 0000 0006 000C
        DECLE   $0000                           ; F45A   0000

        MVO@    R3,     R3                      ; F45B   025B
        ADDR    R3,     R7                      ; F45C   00DF

        DECLE   $0000,  $0000,  $0001,  $0018   ; F45D   0000 0000 0001 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; F461   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $001B,  $0000   ; F465   0000 0001 001B 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F469   0000 0000 0000 0000
        DECLE   $0001,  $001A,  $0000,  $0000   ; F46D   0001 001A 0000 0000
        DECLE   $0000,  $000D,  $00FD,  $000A   ; F471   0000 000D 00FD 000A
        DECLE   $001D,  $0002,  $02D2,  $00FF   ; F475   001D 0002 02D2 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; F479   0000 0000 0000 0000
        DECLE   $000A,  $0031,  $0002,  $02D2   ; F47D   000A 0031 0002 02D2
        DECLE   $00FF,  $0000,  $0000,  $0000   ; F481   00FF 0000 0000 0000
        DECLE   $0000,  $000A,  $0045,  $0002   ; F485   0000 000A 0045 0002
        DECLE   $02D2,  $00FF,  $0000,  $0000   ; F489   02D2 00FF 0000 0000
        DECLE   $000D,  $00FD,  $0007,  $0059   ; F48D   000D 00FD 0007 0059
        DECLE   $0002,  $02D2,  $00FF,  $0000   ; F491   0002 02D2 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; F495   0000 0000 0000 0007
        DECLE   $0067,  $0002,  $02D2,  $00FF   ; F499   0067 0002 02D2 00FF
        DECLE   $0000,  $0000,  $00D2,  $00FD   ; F49D   0000 0000 00D2 00FD
        DECLE   $0006,  $0075,  $0000,  $0000   ; F4A1   0006 0075 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; F4A5   0000 0000 0000 0006
        DECLE   $0081,  $0000,  $0000,  $0000   ; F4A9   0081 0000 0000 0000
        DECLE   $000D,  $00FD,  $0004,  $008D   ; F4AD   000D 00FD 0004 008D
        DECLE   $0002,  $02D2,  $00FF,  $0000   ; F4B1   0002 02D2 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; F4B5   0000 0000 0000 0004
        DECLE   $0095,  $0002,  $02D2,  $00FF   ; F4B9   0095 0002 02D2 00FF
        DECLE   $0000,  $0000,  $0000,  $0006   ; F4BD   0000 0000 0000 0006
        DECLE   $0006,  $0006,  $0000,  $000C   ; F4C1   0006 0006 0000 000C
        DECLE   $001E,  $003E,  $007F,  $005D   ; F4C5   001E 003E 007F 005D
        DECLE   $005D,  $0020,  $0001,  $0001   ; F4C9   005D 0020 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0006   ; F4CD   0000 0000 0000 0006
        DECLE   $0006,  $0006,  $0000,  $000C   ; F4D1   0006 0006 0000 000C
        DECLE   $001E,  $003E,  $005A,  $005A   ; F4D5   001E 003E 005A 005A
        DECLE   $007C,  $0024,  $0003,  $0001   ; F4D9   007C 0024 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0006   ; F4DD   0000 0000 0000 0006
        DECLE   $0006,  $0006,  $0000,  $000C   ; F4E1   0006 0006 0000 000C
        DECLE   $001E,  $001A,  $003A,  $003A   ; F4E5   001E 001A 003A 003A
        DECLE   $0028,  $000C,  $0003,  $0003   ; F4E9   0028 000C 0003 0003
        DECLE   $0000,  $0000,  $0000,  $0006   ; F4ED   0000 0000 0000 0006
        DECLE   $0006,  $0006,  $0000,  $000C   ; F4F1   0006 0006 0000 000C
        DECLE   $001E,  $001A,  $003A,  $003A   ; F4F5   001E 001A 003A 003A
        DECLE   $004D,  $004D,  $0000,  $0000   ; F4F9   004D 004D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; F4FD   0000 0000 0000 0006
        DECLE   $0006,  $0006,  $0000,  $000C   ; F501   0006 0006 0000 000C
        DECLE   $001E,  $003A,  $003A,  $007A   ; F505   001E 003A 003A 007A
        DECLE   $005D,  $005D,  $0040,  $0000   ; F509   005D 005D 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; F50D   0000 0000 0000 0006
        DECLE   $0006,  $0006,  $0000,  $000C   ; F511   0006 0006 0000 000C
        DECLE   $001E,  $003A,  $003B,  $005B   ; F515   001E 003A 003B 005B
        DECLE   $005D,  $005C,  $0040,  $0000   ; F519   005D 005C 0040 0000
        DECLE   $0000,  $001C,  $001C,  $001C   ; F51D   0000 001C 001C 001C
        DECLE   $0014,  $000C,  $000C,  $000C   ; F521   0014 000C 000C 000C
        DECLE   $0008,  $0010,  $0018,  $0018   ; F525   0008 0010 0018 0018
        DECLE   $0028,  $002C,  $0020,  $0000   ; F529   0028 002C 0020 0000
        DECLE   $0000,  $001C,  $001C,  $001E   ; F52D   0000 001C 001C 001E
        DECLE   $000A,  $000A,  $0009,  $0009   ; F531   000A 000A 0009 0009
        DECLE   $001A,  $0014,  $0014,  $0014   ; F535   001A 0014 0014 0014
        DECLE   $0010,  $0010,  $0018,  $0000   ; F539   0010 0010 0018 0000
        DECLE   $0000,  $001C,  $001C,  $001E   ; F53D   0000 001C 001C 001E
        DECLE   $0016,  $0012,  $0012,  $0011   ; F541   0016 0012 0012 0011
        DECLE   $0031,  $0021,  $0021,  $0020   ; F545   0031 0021 0021 0020
        DECLE   $0060,  $0040,  $0040,  $0040   ; F549   0060 0040 0040 0040
        DECLE   $0000,  $001C,  $001C,  $001E   ; F54D   0000 001C 001C 001E
        DECLE   $000E,  $0006,  $0006,  $0004   ; F551   000E 0006 0006 0004
        DECLE   $000C,  $0014,  $0018,  $0018   ; F555   000C 0014 0018 0018
        DECLE   $0008,  $0008,  $0008,  $000C   ; F559   0008 0008 0008 000C
        DECLE   $0000,  $001C,  $001C,  $001E   ; F55D   0000 001C 001C 001E
        DECLE   $000E,  $000E,  $000E,  $000A   ; F561   000E 000E 000E 000A
        DECLE   $000E,  $000C,  $000C,  $000C   ; F565   000E 000C 000C 000C
        DECLE   $0018,  $0010,  $0010,  $0018   ; F569   0018 0010 0010 0018
        DECLE   $0000,  $001C,  $001C,  $001E   ; F56D   0000 001C 001C 001E
        DECLE   $000E,  $000A,  $000A,  $0012   ; F571   000E 000A 000A 0012
        DECLE   $0012,  $0012,  $0032,  $0023   ; F575   0012 0012 0032 0023
        DECLE   $0060,  $0040,  $0040,  $0040   ; F579   0060 0040 0040 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; F57D   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0028,  $0034   ; F581   0000 0018 0028 0034
        DECLE   $001C,  $0028,  $0018,  $0000   ; F585   001C 0028 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F589   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F58D   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $007E,  $003C   ; F591   0000 003C 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; F595   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F599   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $003E   ; F59D   0000 0000 001C 003E
        DECLE   $001C,  $0000,  $0000,  $0000   ; F5A1   001C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5A5   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; F5A9   0000 0018 0018 0000
        DECLE   $003C,  $005A,  $0081,  $0081   ; F5AD   003C 005A 0081 0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5B5   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $000C,  $0000   ; F5B9   0000 000C 000C 0000
        DECLE   $005C,  $007C,  $0003,  $0000   ; F5BD   005C 007C 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5C5   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0026,  $0020   ; F5C9   0000 0006 0026 0020
        DECLE   $002C,  $003D,  $0003,  $0000   ; F5CD   002C 003D 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5D5   0000 0000 0000 0000
        DECLE   $0000                           ; F5D9   0000

        DIS                                     ; F5DA   0003
        INCR    R3                              ; F5DB   000B
        DECR    R0                              ; F5DC   0010
L_F5DD:
        DECR    R7                              ; F5DD   0017

        DECLE   $000F,  $0000,  $0000,  $0000   ; F5DE   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5E6   0000 0000 0000 0000
        DECLE   $0003,  $0005,  $0008,  $000F   ; F5EA   0003 0005 0008 000F
        DECLE   $0007,  $0000,  $0000,  $0000   ; F5EE   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F5F6   0000 0000 0000 0000
        DECLE   $0001,  $0003,  $0005,  $0007   ; F5FA   0001 0003 0005 0007
        DECLE   $0003,  $0000,  $0000,  $0000   ; F5FE   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F602   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F606   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; F60A   0000 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; F60E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F612   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F616   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F61A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F61E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F622   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F626   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F62A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F62E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F632   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F636   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F63A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F63E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F642   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F646   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F64A   0000 0000 0000 0018
        DECLE   $003C,  $0024,  $0042,  $0042   ; F64E   003C 0024 0042 0042
        DECLE   $0042,  $00C3,  $0000,  $0000   ; F652   0042 00C3 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F656   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F65A   0000 0000 0000 0018
        DECLE   $003C,  $0024,  $0042,  $0042   ; F65E   003C 0024 0042 0042
        DECLE   $0042,  $00C2,  $0003,  $0000   ; F662   0042 00C2 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F666   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F66A   0000 0000 0000 0018
        DECLE   $003C,  $0024,  $0042,  $0042   ; F66E   003C 0024 0042 0042
        DECLE   $00C2,  $0002,  $0003,  $0000   ; F672   00C2 0002 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F676   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; F67A   0000 0000 0000 001C
        DECLE   $003C,  $0026,  $0042,  $0042   ; F67E   003C 0026 0042 0042
        DECLE   $0084,  $0004,  $0006,  $0000   ; F682   0084 0004 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F686   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $001C   ; F68A   0000 0000 0000 001C
        DECLE   $007E,  $0042,  $0042,  $0082   ; F68E   007E 0042 0042 0082
        DECLE   $001C,  $0010,  $0000,  $0000   ; F692   001C 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F696   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000E   ; F69A   0000 0000 0000 000E
        DECLE   $007F,  $0041,  $00C1,  $000E   ; F69E   007F 0041 00C1 000E
        DECLE   $0010,  $0010,  $0000,  $0000   ; F6A2   0010 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; F6AA   0000 0000 0001 0003
        DECLE   $007F,  $00C1,  $0039,  $0026   ; F6AE   007F 00C1 0039 0026
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $00C3   ; F6BA   0000 0000 0001 00C3
        DECLE   $007F,  $0009,  $0007,  $0000   ; F6BE   007F 0009 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0048   ; F6CA   0000 0000 0040 0048
        DECLE   $007E,  $000A,  $000E,  $0000   ; F6CE   007E 000A 000E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6D6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0050   ; F6DA   0000 0000 0000 0050
        DECLE   $007E,  $000A,  $000E,  $0000   ; F6DE   007E 000A 000E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F6FE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F702   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F706   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F70A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F70E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F712   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F716   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $00A0,  $0040   ; F71A   0000 0020 00A0 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; F71E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F722   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F726   0000 0000 0000 0000
        DECLE   $0090,  $0090,  $0020,  $00C0   ; F72A   0090 0090 0020 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; F72E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F732   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; F736   0000 0000 0000 0008
        DECLE   $00C8,  $00D0,  $00E0,  $0080   ; F73A   00C8 00D0 00E0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; F73E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F742   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0044,  $0084   ; F746   0000 0000 0044 0084
        DECLE   $00B4,  $0038,  $00F0,  $00E0   ; F74A   00B4 0038 00F0 00E0
        DECLE   $0040,  $0000,  $0000,  $0000   ; F74E   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F752   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F756   0000 0000 0000 0000
        DECLE   $0010,  $0060,  $005A,  $007A   ; F75A   0010 0060 005A 007A
        DECLE   $0064,  $0038,  $0000,  $0000   ; F75E   0064 0038 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F762   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F766   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F76A   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $0030,  $00F1   ; F76E   0000 001C 0030 00F1
        DECLE   $00E6,  $00B8,  $0000,  $0000   ; F772   00E6 00B8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F776   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F77A   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $0030,  $00F1   ; F77E   0000 000C 0030 00F1
        DECLE   $00E6,  $00B8,  $0000,  $0000   ; F782   00E6 00B8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F786   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F78A   0000 0000 0018 0018
        DECLE   $0000,  $003C,  $005A,  $0081   ; F78E   0000 003C 005A 0081
        DECLE   $0081,  $0000,  $0000,  $0000   ; F792   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F796   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F79A   0000 0000 0000 0000
        DECLE   $0018,  $005A,  $00BD,  $0099   ; F79E   0018 005A 00BD 0099
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7A2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7A6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F7AA   0000 0000 0018 0018
        DECLE   $0066,  $0099,  $0018,  $0000   ; F7AE   0066 0099 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7B6   0000 0000 0000 0000
        DECLE   $0000,  $0099,  $0099,  $0042   ; F7BA   0000 0099 0099 0042
        DECLE   $003C,  $0018,  $0000,  $0000   ; F7BE   003C 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7C2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7C6   0000 0000 0000 0000
        DECLE   $0042,  $005A,  $005A,  $0024   ; F7CA   0042 005A 005A 0024
        DECLE   $0018,  $0018,  $0000,  $0000   ; F7CE   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; F7D6   0000 0000 0000 0024
        DECLE   $0042,  $005A,  $005A,  $0024   ; F7DA   0042 005A 005A 0024
        DECLE   $0018,  $0018,  $0000,  $0000   ; F7DE   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7E2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0024   ; F7E6   0000 0000 0000 0024
        DECLE   $0042,  $005A,  $005A,  $0024   ; F7EA   0042 005A 005A 0024
        DECLE   $0018,  $0018,  $0000,  $0000   ; F7EE   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7F2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7F6   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; F7FA   0000 0018 003C 0024
        DECLE   $0066,  $0042,  $0042,  $00C3   ; F7FE   0066 0042 0042 00C3
        DECLE   $0000,  $0000,  $0000,  $0000   ; F802   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F806   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $007E   ; F80A   0000 0000 0018 007E
        DECLE   $0042,  $0042,  $0042,  $0000   ; F80E   0042 0042 0042 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F812   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F816   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0066   ; F81A   0000 0018 003C 0066
        DECLE   $0042,  $0042,  $0042,  $0000   ; F81E   0042 0042 0042 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F822   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F826   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $0024   ; F82A   0018 0018 0024 0024
        DECLE   $0022,  $0024,  $0024,  $0000   ; F82E   0022 0024 0024 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F832   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F836   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $0024   ; F83A   0018 0018 0024 0024
        DECLE   $0024,  $002C,  $0018,  $0000   ; F83E   0024 002C 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F842   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F846   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $0024   ; F84A   0018 0018 0024 0024
        DECLE   $002C,  $0030,  $0018,  $0008   ; F84E   002C 0030 0018 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; F852   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F856   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0024,  $0024   ; F85A   0018 0018 0024 0024
        DECLE   $002C,  $0038,  $0008,  $0000   ; F85E   002C 0038 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F862   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F866   0000 0000 0018 0018
        DECLE   $0018,  $0000,  $0030,  $00F8   ; F86A   0018 0000 0030 00F8
        DECLE   $00F8,  $00F8,  $0074,  $0074   ; F86E   00F8 00F8 0074 0074
        DECLE   $0000,  $0004,  $0004,  $0000   ; F872   0000 0004 0004 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F876   0000 0000 0018 0018
        DECLE   $0018,  $0000,  $0070,  $00F8   ; F87A   0018 0000 0070 00F8
        DECLE   $00F8,  $0078,  $0068,  $0068   ; F87E   00F8 0078 0068 0068
        DECLE   $0004,  $0004,  $0000,  $0000   ; F882   0004 0004 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F886   0000 0000 0018 0018
        DECLE   $0018,  $0000,  $00F0,  $00F8   ; F88A   0018 0000 00F0 00F8
        DECLE   $0078,  $0078,  $0068,  $0050   ; F88E   0078 0078 0068 0050
        DECLE   $0008,  $0000,  $0000,  $0000   ; F892   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $0018   ; F896   0000 0000 0018 0018
        DECLE   $0018,  $0000,  $0070,  $00F8   ; F89A   0018 0000 0070 00F8
        DECLE   $00F8,  $0048,  $0058,  $0070   ; F89E   00F8 0048 0058 0070
        DECLE   $0010,  $0010,  $0000,  $0000   ; F8A2   0010 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; F8A6   0000 0000 0000 000C
        DECLE   $000C,  $000C,  $0030,  $0078   ; F8AA   000C 000C 0030 0078
        DECLE   $0078,  $006C,  $0058,  $0050   ; F8AE   0078 006C 0058 0050
        DECLE   $0028,  $0020,  $0020,  $0000   ; F8B2   0028 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; F8B6   0000 0000 0000 000C
        DECLE   $000C,  $001C,  $0038,  $0038   ; F8BA   000C 001C 0038 0038
        DECLE   $007A,  $006A,  $0058,  $0070   ; F8BE   007A 006A 0058 0070
        DECLE   $0030,  $0030,  $0040,  $0000   ; F8C2   0030 0030 0040 0000
        DECLE   $0038,  $0038,  $0038,  $0018   ; F8C6   0038 0038 0038 0018
        DECLE   $0018,  $000C,  $0018,  $0030   ; F8CA   0018 000C 0018 0030
        DECLE   $0048,  $0048,  $0010,  $0010   ; F8CE   0048 0048 0010 0010
        DECLE   $0018,  $0000,  $0000,  $0000   ; F8D2   0018 0000 0000 0000
        DECLE   $0038,  $0038,  $003C,  $001E   ; F8D6   0038 0038 003C 001E
        DECLE   $0016,  $0004,  $0008,  $0018   ; F8DA   0016 0004 0008 0018
        DECLE   $0010,  $0008,  $0010,  $0010   ; F8DE   0010 0008 0010 0010
        DECLE   $0018,  $0000,  $0000,  $0000   ; F8E2   0018 0000 0000 0000
        DECLE   $0038,  $0038,  $003C,  $001E   ; F8E6   0038 0038 003C 001E
        DECLE   $0012,  $0016,  $0014,  $001C   ; F8EA   0012 0016 0014 001C
        DECLE   $0008,  $0010,  $0010,  $0010   ; F8EE   0008 0010 0010 0010
        DECLE   $0018,  $0000,  $0000,  $0000   ; F8F2   0018 0000 0000 0000
        DECLE   $0038,  $0038,  $003C,  $001C   ; F8F6   0038 0038 003C 001C
        DECLE   $0016,  $0002,  $000A,  $000A   ; F8FA   0016 0002 000A 000A
        DECLE   $001A,  $0011,  $0010,  $0010   ; F8FE   001A 0011 0010 0010
        DECLE   $0018,  $0000,  $0000,  $0000   ; F902   0018 0000 0000 0000

        RSWD    R0                              ; F906   0038
        RSWD    R0                              ; F907   0038
        RSWD    R4                              ; F908   003C

        JSRD    R4,     .EXEC.412               ; F909   0004 0016 0012
        DECLE   $0012,  $0013,  $0021,  $0021   ; F90C   0012 0013 0021 0021
        DECLE   $0020,  $0010,  $0020,  $0000   ; F910   0020 0010 0020 0000
        DECLE   $0000,  $0040,  $00B8,  $003C   ; F914   0000 0040 00B8 003C
        DECLE   $003C,  $0016,  $0012,  $0012   ; F918   003C 0016 0012 0012
        DECLE   $0022,  $0021,  $0021,  $0020   ; F91C   0022 0021 0021 0020
        DECLE   $0030,  $0020,  $0020,  $0000   ; F920   0030 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F924   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F928   0000 0000 0000 0018
        DECLE   $0018,  $003C,  $005A,  $0042   ; F92C   0018 003C 005A 0042
        DECLE   $0081,  $0000,  $0000,  $0000   ; F930   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F934   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; F938   0000 0000 0000 0030
        DECLE   $0030,  $003C,  $005A,  $0042   ; F93C   0030 003C 005A 0042
        DECLE   $0082,  $0000,  $0000,  $0000   ; F940   0082 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F944   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; F948   0000 0000 0000 0018
        DECLE   $0018,  $003C,  $005A,  $0042   ; F94C   0018 003C 005A 0042
        DECLE   $0081,  $0000,  $0000,  $0000   ; F950   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F954   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; F958   0000 0000 0000 000C
        DECLE   $000C,  $003C,  $005A,  $0042   ; F95C   000C 003C 005A 0042
        DECLE   $0041,  $0000,  $0000,  $0000   ; F960   0041 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F964   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F968   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; F96C   0000 0018 003C 0024
        DECLE   $0042,  $0042,  $0042,  $0042   ; F970   0042 0042 0042 0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; F974   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F978   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; F97C   0000 0018 003C 0024
        DECLE   $0044,  $0042,  $0042,  $0042   ; F980   0044 0042 0042 0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; F984   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F988   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; F98C   0000 0018 003C 0024
        DECLE   $0042,  $0042,  $0042,  $0042   ; F990   0042 0042 0042 0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; F994   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F998   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $0024   ; F99C   0000 0018 003C 0024
        DECLE   $0022,  $0042,  $0042,  $0042   ; F9A0   0022 0042 0042 0042
        DECLE   $0000,  $00FF,  $00FF,  $00FA   ; F9A4   0000 00FF 00FF 00FA
        DECLE   $00FD,  $00EE,  $00F7,  $00EB   ; F9A8   00FD 00EE 00F7 00EB
        DECLE   $00F5,  $00F5,  $00EB,  $00F5   ; F9AC   00F5 00F5 00EB 00F5
        DECLE   $00EB,  $00F5,  $00EB,  $00F5   ; F9B0   00EB 00F5 00EB 00F5
        DECLE   $00EB,  $00FF,  $00FF,  $00AA   ; F9B4   00EB 00FF 00FF 00AA
        DECLE   $0055,  $00AA,  $0055,  $00FF   ; F9B8   0055 00AA 0055 00FF
        DECLE   $0055,  $00FF,  $00FF,  $00BF   ; F9BC   0055 00FF 00FF 00BF

        RRC     R3,     2                       ; F9C0   0077
        ADDR    R5,     R7                      ; F9C1   00EF
        ADDR    R2,     R7                      ; F9C2   00D7
        MOVR    R5,     R7                      ; F9C3   00AF
        ADDR    R2,     R7                      ; F9C4   00D7
        MOVR    R5,     R7                      ; F9C5   00AF
        ADDR    R2,     R7                      ; F9C6   00D7
        MOVR    R5,     R7                      ; F9C7   00AF
        ADDR    R2,     R7                      ; F9C8   00D7
        MOVR    R5,     R7                      ; F9C9   00AF
        ADDR    R2,     R7                      ; F9CA   00D7
        MOVR    R5,     R7                      ; F9CB   00AF
        ADDR    R2,     R7                      ; F9CC   00D7

        DECLE   $00F5,  $00EB,  $00F5,  $00EA   ; F9CD   00F5 00EB 00F5 00EA
        DECLE   $00F4,  $00E8,  $00F0,  $00E0   ; F9D1   00F4 00E8 00F0 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; F9D9   0000 0000 0000 0001

        ADDR    R6,     R0                      ; F9DD   00F0
        ADDR    R6,     R0                      ; F9DE   00F0
        ADDR    R6,     R0                      ; F9DF   00F0
        ADDR    R6,     R0                      ; F9E0   00F0
        ADDR    R6,     R0                      ; F9E1   00F0
        ADDR    R6,     R0                      ; F9E2   00F0
        ADDR    R6,     R0                      ; F9E3   00F0
        ADDR    R6,     R0                      ; F9E4   00F0
        MOVR    R5,     R7                      ; F9E5   00AF
        ADDR    R2,     R7                      ; F9E6   00D7
        MOVR    R5,     R7                      ; F9E7   00AF

        DECLE   $0057,  $002F                   ; F9E8   0057 002F
L_F9EA:
        DECR    R7                              ; F9EA   0017

        DECLE   $000F,  $0007,  $0001,  $0002   ; F9EB   000F 0007 0001 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; F9EF   0004 0008 0010 0020
        DECLE   $0040,  $0080,  $00FF,  $0000   ; F9F3   0040 0080 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F9F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0040   ; F9FB   0000 0000 00FF 0040
        DECLE   $0020,  $0010,  $0008,  $0004   ; F9FF   0020 0010 0008 0004
        DECLE   $0002,  $0001,  $0001,  $0002   ; FA03   0002 0001 0001 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; FA07   0004 0008 0010 0020
        DECLE   $0040,  $0080,  $0080,  $0040   ; FA0B   0040 0080 0080 0040
        DECLE   $0020,  $0010,  $0008,  $0004   ; FA0F   0020 0010 0008 0004
        DECLE   $0002,  $0001                   ; FA13   0002 0001

        ADDR    R0,     R1                      ; FA15   00C1
        ADDR    R1,     R7                      ; FA16   00CF

        DECLE   $00CD,  $00F6,  $00F3,  $00FD   ; FA17   00CD 00F6 00F3 00FD
        DECLE   $00FF,  $00FF,  $0003,  $0003   ; FA1B   00FF 00FF 0003 0003
        DECLE   $0003,  $000F,  $000F,  $003F   ; FA1F   0003 000F 000F 003F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; FA23   00FF 00FF 00FF 00FF
        DECLE   $003F                           ; FA27   003F

        INCR    R7                              ; FA28   000F

        SAR     R3,     2                       ; FA29   006F
L_FA2A:
        ADDR    R0,     R3                      ; FA2A   00C3
        DECLE   $0083,  $0003,  $00AA,  $0055   ; FA2B   0083 0003 00AA 0055
        DECLE   $00AA,  $0055,  $00AA,  $0055   ; FA2F   00AA 0055 00AA 0055
        DECLE   $00AA,  $0055,  $00F9,  $0009   ; FA33   00AA 0055 00F9 0009
        DECLE   $0009,  $0009,  $0009,  $00F9   ; FA37   0009 0009 0009 00F9
        DECLE   $0001,  $00FF,  $0000,  $00FF   ; FA3B   0001 00FF 0000 00FF

        MOVR    R0,     R1                      ; FA3F   0081
        MOVR    R3,     R7                      ; FA40   009F

        MOVR    R2,     R0                      ; FA41   0090
        MOVR    R2,     R0                      ; FA42   0090
        MOVR    R3,     R7                      ; FA43   009F

        DECLE   $0081,  $0000,  $0039,  $0039   ; FA44   0081 0000 0039 0039
        DECLE   $003F,  $003F,  $003F,  $0000   ; FA48   003F 003F 003F 0000
        DECLE   $003F,  $00FF,  $00FF,  $00BF   ; FA4C   003F 00FF 00FF 00BF

        RRC     R3,     2                       ; FA50   0077
        ADDR    R5,     R7                      ; FA51   00EF
        ADDR    R2,     R7                      ; FA52   00D7
        MOVR    R5,     R7                      ; FA53   00AF

        DECLE   $0057,  $0066,  $003C,  $0000   ; FA54   0057 0066 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; FA60   0000 0000 00FF 0000
        DECLE   $00FF,  $00F0,  $0000,  $0000   ; FA64   00FF 00F0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FA68   0000 0000 0000 0000
        DECLE   $0000,  $0024,  $0024,  $0024   ; FA6C   0000 0024 0024 0024
        DECLE   $0024,  $0024,  $0027,  $0020   ; FA70   0024 0024 0027 0020
        DECLE   $003F,  $0000,  $0079,  $0075   ; FA74   003F 0000 0079 0075
        DECLE   $0079,  $0071,  $0071,  $0000   ; FA78   0079 0071 0071 0000
        DECLE   $001F                           ; FA7C   001F

        TSTR    R2                              ; FA7D   0092
        TSTR    R2                              ; FA7E   0092
        TSTR    R2                              ; FA7F   0092
        TSTR    R2                              ; FA80   0092
        TSTR    R2                              ; FA81   0092
        MOVR    R2,     R3                      ; FA82   0093
        MOVR    R2,     R0                      ; FA83   0090
        MOVR    R3,     R7                      ; FA84   009F

        DECLE   $0000                           ; FA85   0000

        ADDR    R5,     R7                      ; FA86   00EF

        ADDR    R1,     R6                      ; FA87   00CE
        ADDR    R5,     R7                      ; FA88   00EF

        DECLE   $00CE,  $00EE,  $0000           ; FA89   00CE 00EE 0000

        MOVR    R1,     R7                      ; FA8C   008F

        SLL     R1,     1                       ; FA8D   0049
        INCR    R1                              ; FA8E   0009
        INCR    R1                              ; FA8F   0009
        INCR    R1                              ; FA90   0009
        INCR    R1                              ; FA91   0009
        ADDR    R1,     R1                      ; FA92   00C9
        SLL     R0,     1                       ; FA93   0048
        ADDR    R1,     R7                      ; FA94   00CF

        DECLE   $0000,  $0000,  $0080,  $0000   ; FA95   0000 0000 0080 0000
        DECLE   $00C0,  $00C0,  $0000,  $00C7   ; FA99   00C0 00C0 0000 00C7
        DECLE   $0024,  $0004,  $0004,  $0004   ; FA9D   0024 0004 0004 0004
        DECLE   $0004                           ; FAA1   0004

        ADDR    R4,     R4                      ; FAA2   00E4
        NEGR    R4                              ; FAA3   0024
        ADDR    R4,     R7                      ; FAA4   00E7

        DECLE   $0000,  $0000,  $0000,  $0000   ; FAA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00E7   ; FAA9   0000 0000 0000 00E7
        DECLE   $0082,  $00B2,  $0082,  $0082   ; FAAD   0082 00B2 0082 0082
        DECLE   $0082,  $00F2,  $0012,  $00F3   ; FAB1   0082 00F2 0012 00F3
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FAB9   0000 0000 0000

        ADDR    R7,     R0                      ; FABC   00F8
        SWAP    R0,     2                       ; FABD   0044
        SARC    R0,     1                       ; FABE   0078
        SLL     R2,     2                       ; FABF   004E
        SLL     R1,     1                       ; FAC0   0049
        SLL     R1,     1                       ; FAC1   0049
        SLL     R1,     1                       ; FAC2   0049
        SLL     R0,     1                       ; FAC3   0048
        ADDR    R1,     R7                      ; FAC4   00CF

        DECLE   $000E,  $0032,  $0067,  $00FF   ; FAC5   000E 0032 0067 00FF
        DECLE   $0008,  $0010,  $0020,  $0040   ; FAC9   0008 0010 0020 0040
        DECLE   $009B,  $0076,  $00C6,  $008C   ; FACD   009B 0076 00C6 008C
        DECLE   $0019,  $0032,  $00FC,  $00B0   ; FAD1   0019 0032 00FC 00B0
        DECLE   $0003,  $0007,  $000C,  $001E   ; FAD5   0003 0007 000C 001E
        DECLE   $0033,  $0079,  $005C,  $00D6   ; FAD9   0033 0079 005C 00D6
        DECLE   $00FF,  $00FF,  $00FC,  $00F0   ; FADD   00FF 00FF 00FC 00F0
        DECLE   $00F0,  $00C0,  $00C0,  $00C0   ; FAE1   00F0 00C0 00C0 00C0
        DECLE   $00F0,  $0000,  $0000,  $0000   ; FAE5   00F0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; FAE9   0000 0000 0000 0001
        DECLE   $00E2,  $00B0,  $0098,  $0000   ; FAED   00E2 00B0 0098 0000
        DECLE   $0000,  $0080,  $0080,  $00F0   ; FAF1   0000 0080 0080 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; FAF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; FAF9   0000 0000 0000 000F
        DECLE   $000F,  $0000,  $0000,  $0018   ; FAFD   000F 0000 0000 0018
        DECLE   $003C,  $0066,  $00C3,  $00F1   ; FB01   003C 0066 00C3 00F1
        DECLE   $0036,  $009C,  $00C8,  $0060   ; FB05   0036 009C 00C8 0060
        DECLE   $0020,  $0080,  $0080,  $0000   ; FB09   0020 0080 0080 0000
        DECLE   $00FF,  $0002,  $0004,  $0008   ; FB0D   00FF 0002 0004 0008
        DECLE   $0010,  $0020,  $0040,  $0080   ; FB11   0010 0020 0040 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FB19   0000 0000 0000 0000
L_FB1D:
        PSHR    R5                              ; FB1D   0275
        MVI     G_0331, R0                      ; FB1E   0280 0331
        TSTR    R0                              ; FB20   0080
        BNEQ    L_FBC5                          ; FB21   020C 00A2

        MVI     G_01C5, R0                      ; FB23   0280 01C5
        TSTR    R0                              ; FB25   0080
        BNEQ    L_FC7C                          ; FB26   020C 0154

        MVI     G_01DB, R0                      ; FB28   0280 01DB
        TSTR    R0                              ; FB2A   0080
        BEQ     L_FBC4                          ; FB2B   0204 0097

        MVI     .BTAB.03,R1                     ; FB2D   0281 0203
        SLLC    R1,     1                       ; FB2F   0059
        BC      L_FBC4                          ; FB30   0201 0092

        PSHR    R0                              ; FB32   0270
        SETC                                    ; FB33   0007

        JSR     R5,     L_DE68                  ; FB34   0004 01DC 0268
        DECLE   $0203,  $02B0,  $0378,  $0002   ; FB37   0203 02B0 0378 0002
        DECLE   $02B8,  $003C,  $0204,  $000F   ; FB3B   02B8 003C 0204 000F
        DECLE   $0001                           ; FB3F   0001

        MVII    #$0064, R1                      ; FB40   02B9 0064
        ADDR    R7,     R3                      ; FB42   00FB
L_FB43:
        MVI     G_01BA, R3                      ; FB43   0283 01BA
        CMPI    #$0080, R3                      ; FB45   037B 0080
        BNEQ    L_FB4A                          ; FB47   020C 0001
        MOVR    R1,     R7                      ; FB49   008F

L_FB4A:
        JSR     R5,     .EXEC.A5E               ; FB4A   0004 0118 025E

        PULR    R7                              ; FB4D   02B7

        PSHR    R0                              ; FB4E   0270
        MVII    #$0008, R0                      ; FB4F   02B8 0008

        JSR     R5,     X_PLAY_CHEER1           ; FB51   0004 011C 02D5

        PULR    R0                              ; FB54   02B0
        SDBD                                    ; FB55   0001
        MVII    #$FB5B, R1                      ; FB56   02B9 005B 00FB
        B       L_FB43                          ; FB59   0220 0017

        MVI     G_01DD, R1                      ; FB5B   0281 01DD
        ANDI    #$0001, R1                      ; FB5D   03B9 0001
        ADDI    #$01E4, R1                      ; FB5F   02F9 01E4
        MVI@    R1,     R0                      ; FB61   0288
        INCR    R0                              ; FB62   0008
        MVO@    R0,     R1                      ; FB63   0248
        MVI     G_01BA, R3                      ; FB64   0283 01BA
        CMPI    #$0080, R3                      ; FB66   037B 0080
        BEQ     L_FBAB                          ; FB68   0204 0041

        MVI     G_01E6, R0                      ; FB6A   0280 01E6
        INCR    R0                              ; FB6C   0008
        CMPI    #$000A, R0                      ; FB6D   0378 000A
        BGE     L_FBAB                          ; FB6F   020D 003A

        MVO     R0,     G_01E6                  ; FB71   0240 01E6
        MVI     G_01DD, R1                      ; FB73   0281 01DD
        MVI     G_01DC, R2                      ; FB75   0282 01DC
        MOVR    R2,     R3                      ; FB77   0093
        XORR    R1,     R3                      ; FB78   01CB
        CMPI    #$0001, R3                      ; FB79   037B 0001
        BGT     L_FB83                          ; FB7B   020E 0006

        MVO     R2,     G_01DD                  ; FB7D   0242 01DD
        MVO     R1,     G_01DC                  ; FB7F   0241 01DC
        B       L_FB8B                          ; FB81   0200 0008

L_FB83:
        MVII    #$0002, R4                      ; FB83   02BC 0002
        MVII    #$0001, R5                      ; FB85   02BD 0001
        CMPI    #$00FF, R1                      ; FB87   0379 00FF
        BEQ     L_FB8F                          ; FB89   0204 0004

L_FB8B:
        MVII    #$0001, R4                      ; FB8B   02BC 0001
        MVII    #$0002, R5                      ; FB8D   02BD 0002
L_FB8F:
        PSHR    R5                              ; FB8F   0275
        PSHR    R4                              ; FB90   0274
        MVII    #$0002, R1                      ; FB91   02B9 0002
        MVI     G_01E4, R0                      ; FB93   0280 01E4
        PULR    R3                              ; FB95   02B3
        MVII    #$02DC, R4                      ; FB96   02BC 02DC

        JSR     R5,     X_PRNUM_RGT             ; FB98   0004 0118 00C5

        MVI     G_01E5, R0                      ; FB9B   0280 01E5
        MVII    #$02EE, R4                      ; FB9D   02BC 02EE
        PULR    R3                              ; FB9F   02B3

        JSR     R5,     X_PRNUM_RGT             ; FBA0   0004 0118 00C5

        CLRC                                    ; FBA3   0006

        JSR     R5,     L_DE68                  ; FBA4   0004 01DC 0268
        DECLE   $0203                           ; FBA7   0203

        J       L_DEB3                          ; FBA8   0004 03DC 02B3

L_FBAB:
        MVI     G_017B, R0                      ; FBAB   0280 017B
        MVI     G_017C, R1                      ; FBAD   0281 017C
        MVO     R0,     .ISRVEC.0               ; FBAF   0240 0100
        MVO     R1,     .ISRVEC.1               ; FBB1   0241 0101

        JSR     R5,     .EXEC.7B3               ; FBB3   0004 0114 03B3

        MVI     G_01BA, R3                      ; FBB6   0283 01BA
        CMPI    #$0080, R3                      ; FBB8   037B 0080
        BEQ     L_FBBF                          ; FBBA   0204 0003
        J       L_51EF                          ; FBBC   0004 0350 01EF
L_FBBF:
        J       L_52C2                          ; FBBF   0004 0350 02C2

L_FBC2:
        MVO     R0,     G_0334                  ; FBC2   0240 0334
L_FBC4:
        PULR    R7                              ; FBC4   02B7

L_FBC5:
        MVI     G_0338, R1                      ; FBC5   0281 0338
        SDBD                                    ; FBC7   0001
        CMPI    #$3500, R1                      ; FBC8   0379 0000 0035
        BC      L_FBC2                          ; FBCB   0221 000A

        CLRR    R0                              ; FBCD   01C0
        MVO     R0,     G_0334                  ; FBCE   0240 0334
        MVI     G_01DB, R0                      ; FBD0   0280 01DB
        ADDR    R0,     R7                      ; FBD2   00C7
        B       L_FC20                          ; FBD3   0200 004B
        B       L_FC5C                          ; FBD5   0200 0085

L_FBD7:
        MVII    #$0004, R0                      ; FBD7   02B8 0004
        MVO     R0,     G_01DB                  ; FBD9   0240 01DB
        MVI     G_0338, R2                      ; FBDB   0282 0338
        SDBD                                    ; FBDD   0001
        CMPI    #$1A00, R2                      ; FBDE   037A 0000 001A
        BNC     L_FC0F                          ; FBE1   0209 002C

        MVII    #$0335, R1                      ; FBE3   02B9 0335

        JSR     R5,     L_DA52                  ; FBE5   0004 01D8 0252

        GSWD    R2                              ; FBE8   0032
        RRC     R3,     2                       ; FBE9   0077
        BC      L_FBED                          ; FBEA   0201 0001
        PULR    R7                              ; FBEC   02B7

L_FBED:
        MVI     G_0335, R0                      ; FBED   0280 0335
        SDBD                                    ; FBEF   0001
        ANDI    #$EFFF, R0                      ; FBF0   03B8 00FF 00EF
        MVO     R0,     G_0335                  ; FBF3   0240 0335
        MVII    #$032D, R1                      ; FBF5   02B9 032D

        JSR     R5,     L_DA52                  ; FBF7   0004 01D8 0252

        GSWD    R2                              ; FBFA   0032
        RRC     R3,     2                       ; FBFB   0077
        MVI     G_0330, R2                      ; FBFC   0282 0330
        SDBD                                    ; FBFE   0001
        CMPI    #$2000, R2                      ; FBFF   037A 0000 0020
        BC      L_FC05                          ; FC02   0201 0001
        PULR    R7                              ; FC04   02B7

L_FC05:
        MVI     G_032D, R0                      ; FC05   0280 032D
        SDBD                                    ; FC07   0001
        MVII    #$EFFF, R2                      ; FC08   02BA 00FF 00EF
        ANDR    R2,     R0                      ; FC0B   0190
        MVO     R0,     G_032D                  ; FC0C   0240 032D
        PULR    R7                              ; FC0E   02B7

L_FC0F:
        SDBD                                    ; FC0F   0001
        MVII    #$1E00, R1                      ; FC10   02B9 0000 001E
        MVO     R1,     G_033C                  ; FC13   0241 033C
L_FC15:
        MVO     R1,     G_0338                  ; FC15   0241 0338
        MVII    #$0331, R1                      ; FC17   02B9 0331

        JSR     R5,     L_DB9E                  ; FC19   0004 01D8 039E
        JSR     R5,     L_D0FD                  ; FC1C   0004 01D0 00FD

        PULR    R7                              ; FC1F   02B7

L_FC20:
        MVI     G_0330, R3                      ; FC20   0283 0330
        SDBD                                    ; FC22   0001
        CMPI    #$1C00, R3                      ; FC23   037B 0000 001C
        BLE     L_FBD7                          ; FC26   0226 0050

        MVII    #$032D, R1                      ; FC28   02B9 032D

        JSR     R5,     L_DA52                  ; FC2A   0004 01D8 0252

        GSWD    R2                              ; FC2D   0032
        RRC     R3,     2                       ; FC2E   0077
        BC      L_FC4C                          ; FC2F   0201 001B

        JSR     R5,     L_DA52                  ; FC31   0004 01D8 0252

        GSWD    R0                              ; FC34   0030
        SARC    R1,     1                       ; FC35   0079
        BC      L_FC49                          ; FC36   0201 0011

        JSR     R5,     L_DA52                  ; FC38   0004 01D8 0252

        ADCR    R3                              ; FC3B   002B
        SARC    R2,     2                       ; FC3C   007E
        BNC     L_FBD7                          ; FC3D   0229 0067

        MVII    #$0004, R0                      ; FC3F   02B8 0004
        MVO     R0,     G_01DB                  ; FC41   0240 01DB
        SDBD                                    ; FC43   0001
        MVII    #$3900, R1                      ; FC44   02B9 0000 0039
        B       L_FC15                          ; FC47   0220 0033

L_FC49:
        JSR     R5,     L_D0FD                  ; FC49   0004 01D0 00FD

L_FC4C:
        MVI     G_0330, R3                      ; FC4C   0283 0330
        SDBD                                    ; FC4E   0001
        CMPI    #$2000, R3                      ; FC4F   037B 0000 0020
        BGT     L_FC5C                          ; FC52   020E 0008

        SDBD                                    ; FC54   0001
        CMPI    #$1C00, R3                      ; FC55   037B 0000 001C
        BGT     L_FCB5                          ; FC58   020E 005B
        B       L_FBD7                          ; FC5A   0220 0084

L_FC5C:
        MVII    #$0002, R0                      ; FC5C   02B8 0002
        MVO     R0,     G_01DB                  ; FC5E   0240 01DB
        MVI     G_0338, R2                      ; FC60   0282 0338
        SDBD                                    ; FC62   0001
        CMPI    #$2D00, R2                      ; FC63   037A 0000 002D
        BC      L_FC7C                          ; FC66   0201 0014

        CLRR    R0                              ; FC68   01C0
        MVO     R0,     G_0331                  ; FC69   0240 0331
        SDBD                                    ; FC6B   0001
        MVII    #$2D00, R2                      ; FC6C   02BA 0000 002D
        MVI     G_01C5, R1                      ; FC6F   0281 01C5
        TSTR    R1                              ; FC71   0089
        BNEQ    L_FC78                          ; FC72   020C 0004

        MVO     R2,     G_0330                  ; FC74   0242 0330
        B       L_FC94                          ; FC76   0200 001C

L_FC78:
        ADDI    #$0200, R2                      ; FC78   02FA 0200
        MVO     R2,     G_0338                  ; FC7A   0242 0338
L_FC7C:
        MVI     G_0330, R3                      ; FC7C   0283 0330
        SDBD                                    ; FC7E   0001
        SUBI    #$2600, R3                      ; FC7F   033B 0000 0026
        BPL     L_FC94                          ; FC82   0203 0010

        MVI     G_035C, R4                      ; FC84   0284 035C
        TSTR    R4                              ; FC86   00A4
        BMI     L_FC8A                          ; FC87   020B 0001

        NEGR    R4                              ; FC89   0024
L_FC8A:
        MVO     R4,     G_035C                  ; FC8A   0244 035C
        SDBD                                    ; FC8C   0001
        MVII    #$FF00, R0                      ; FC8D   02B8 0000 00FF
        ADD     G_0354, R0                      ; FC90   02C0 0354
        MVO     R0,     G_0354                  ; FC92   0240 0354
L_FC94:
        MVII    #$032D, R1                      ; FC94   02B9 032D

        JSR     R5,     L_DA52                  ; FC96   0004 01D8 0252
        DECLE   $0037                           ; FC99   0037

        RRC     R2,     1                       ; FC9A   0072
        BC      L_FBC4                          ; FC9B   0221 00D8

        MVI     G_0331, R0                      ; FC9D   0280 0331
        ANDI    #$00FF, R0                      ; FC9F   03B8 00FF
        MVO     R0,     G_0331                  ; FCA1   0240 0331
        MVII    #$0002, R0                      ; FCA3   02B8 0002

        JSR     R5,     .EXEC.772               ; FCA5   0004 0114 0372

        SUBR    R0,     R2                      ; FCA8   0102
        CMPI    #$0068, R2                      ; FCA9   037A 0068
        BGT     L_FCAF                          ; FCAB   020E 0002

        ADDI    #$0004, R2                      ; FCAD   02FA 0004
L_FCAF:
        SWAP    R2,     1                       ; FCAF   0042
        MVO     R2,     G_032F                  ; FCB0   0242 032F
        MVO     R2,     G_0337                  ; FCB2   0242 0337
        PULR    R7                              ; FCB4   02B7

L_FCB5:
        MVI     G_0354, R0                      ; FCB5   0280 0354
        SDBD                                    ; FCB7   0001
        ADDI    #$0600, R0                      ; FCB8   02F8 0000 0006
        MVO     R0,     G_0354                  ; FCBB   0240 0354
        SDBD                                    ; FCBD   0001
        MVII    #$3900, R1                      ; FCBE   02B9 0000 0039
        B       L_FC15                          ; FCC1   0220 00AD

L_FCC3:
        PSHR    R5                              ; FCC3   0275
        MVI     G_01DD, R1                      ; FCC4   0281 01DD
        MOVR    R1,     R4                      ; FCC6   008C
        CMPI    #$00FF, R1                      ; FCC7   0379 00FF
        BEQ     L_FD0C                          ; FCC9   0204 0041

        MOVR    R1,     R4                      ; FCCB   008C
        ADDI    #$011F, R4                      ; FCCC   02FC 011F
        NEGR    R1                              ; FCCE   0021
        ADDI    #$01FF, R1                      ; FCCF   02F9 01FF
        MVI@    R1,     R0                      ; FCD1   0288
        MOVR    R0,     R1                      ; FCD2   0081
        ANDI    #$00E0, R1                      ; FCD3   03B9 00E0
        CMPI    #$00E0, R1                      ; FCD5   0379 00E0
        BNEQ    L_FD0C                          ; FCD7   020C 0033

        ANDI    #$000F, R0                      ; FCD9   03B8 000F
        CMPI    #$000F, R0                      ; FCDB   0378 000F
        BNEQ    L_FCE0                          ; FCDD   020C 0001
        PULR    R7                              ; FCDF   02B7

L_FCE0:
        MVI@    R4,     R0                      ; FCE0   02A0
        MOVR    R0,     R1                      ; FCE1   0081
        ANDI    #$00C0, R1                      ; FCE2   03B9 00C0
        BNEQ    L_FD0C                          ; FCE4   020C 0026

        MVO     R0,     G_01DE                  ; FCE6   0240 01DE
        MVI     G_01E1, R1                      ; FCE8   0281 01E1
        CMPI    #$0002, R1                      ; FCEA   0379 0002
        BEQ     L_FD0C                          ; FCEC   0204 001E

        TSTR    R1                              ; FCEE   0089
        BNEQ    L_FD06                          ; FCEF   020C 0015

        MVII    #$02F0, R0                      ; FCF1   02B8 02F0
        MVO     R0,     G_0322                  ; FCF3   0240 0322
        MVO     R0,     G_032A                  ; FCF5   0240 032A
        SDBD                                    ; FCF7   0001
        MVII    #$5354, R2                      ; FCF8   02BA 0054 0053
        MVII    #$0014, R3                      ; FCFB   02BB 0014
        MVII    #$031D, R1                      ; FCFD   02B9 031D

        JSR     R5,     .EXEC.9A8               ; FCFF   0004 0118 01A8

        MVII    #$0001, R0                      ; FD02   02B8 0001
        MVO     R0,     G_01E1                  ; FD04   0240 01E1
L_FD06:
        MVII    #$0035, R0                      ; FD06   02B8 0035
        ADD     G_035C, R0                      ; FD08   02C0 035C
        MVO     R0,     G_035C                  ; FD0A   0240 035C
L_FD0C:
        PULR    R7                              ; FD0C   02B7

        PSHR    R5                              ; FD0D   0275
        MVI     G_01E0, R0                      ; FD0E   0280 01E0
        CMPI    #$0006, R0                      ; FD10   0378 0006
        BNEQ    L_FD31                          ; FD12   020C 001D

        JSR     R5,     L_FE86                  ; FD14   0004 01FC 0286

        BLE     L_FD27                          ; FD17   0206 000E

        MVII    #$0002, R0                      ; FD19   02B8 0002

        JSR     R5,     X_RAND1                 ; FD1B   0004 0114 027D

        TSTR    R1                              ; FD1E   0089
        BPL     L_FD23                          ; FD1F   0203 0002

        ADDI    #$0005, R0                      ; FD21   02F8 0005
L_FD23:
        MVO     R0,     G_01E0                  ; FD23   0240 01E0
        B       L_FEEF                          ; FD25   0200 01C8

L_FD27:
        MVI     G_035C, R0                      ; FD27   0280 035C
        CMPI    #$0190, R0                      ; FD29   0378 0190
        MVII    #$0004, R0                      ; FD2B   02B8 0004
        BGE     L_FD23                          ; FD2D   022D 000B
        B       L_FD8F                          ; FD2F   0200 005E

L_FD31:
        CMPI    #$0001, R0                      ; FD31   0378 0001
        BLT     L_FD6F                          ; FD33   0205 003A
        BNEQ    L_FD8F                          ; FD35   020C 0058

        MVI     G_033D, R0                      ; FD37   0280 033D
        SDBD                                    ; FD39   0001
        ANDI    #$EFFF, R0                      ; FD3A   03B8 00FF 00EF
        MVO     R0,     G_033D                  ; FD3D   0240 033D
        CLRR    R0                              ; FD3F   01C0
        MVI     G_0349, R0                      ; FD40   0280 0349

        JSR     R5,     X_UNPK_BYTES            ; FD42   0004 0114 0357

        MOVR    R0,     R2                      ; FD45   0082
        MOVR    R1,     R3                      ; FD46   008B
        SAR     R0,     2                       ; FD47   006C
        SAR     R0,     1                       ; FD48   0068
        BEQ     L_FD62                          ; FD49   0204 0017

        SAR     R1,     2                       ; FD4B   006D
        NEGR    R0                              ; FD4C   0020
        NEGR    R1                              ; FD4D   0021
        ADDR    R2,     R0                      ; FD4E   00D0
        ADDR    R3,     R1                      ; FD4F   00D9

        JSR     R5,     X_PACK_BYTES            ; FD50   0004 0114 034F

        MVO     R0,     G_0349                  ; FD53   0240 0349
        MVII    #$0009, R0                      ; FD55   02B8 0009
        MVO     R0,     G_034A                  ; FD57   0240 034A
        MVO     R0,     G_0352                  ; FD59   0240 0352
        MVO     R0,     G_035A                  ; FD5B   0240 035A
        MVII    #$0001, R0                      ; FD5D   02B8 0001
        MVO     R0,     G_034B                  ; FD5F   0240 034B
        PULR    R7                              ; FD61   02B7

L_FD62:
        MVI     G_01E0, R0                      ; FD62   0280 01E0
        INCR    R0                              ; FD64   0008
        MVO     R0,     G_01E0                  ; FD65   0240 01E0
        CLRR    R0                              ; FD67   01C0
        MVO     R0,     G_0349                  ; FD68   0240 0349
        MVII    #$000F, R0                      ; FD6A   02B8 000F
        MVO     R0,     G_034B                  ; FD6C   0240 034B
        PULR    R7                              ; FD6E   02B7

L_FD6F:
        INCR    R0                              ; FD6F   0008
        MVO     R0,     G_01E0                  ; FD70   0240 01E0
        MVI     G_0346, R1                      ; FD72   0281 0346
        SDBD                                    ; FD74   0001
        CMPI    #$F48B, R1                      ; FD75   0379 008B 00F4
        BEQ     L_FD84                          ; FD78   0204 000A

L_FD7A:
        MVII    #$0349, R1                      ; FD7A   02B9 0349

        JSR     R5,     L_DB9E                  ; FD7C   0004 01D8 039E

        MVII    #$000A, R0                      ; FD7F   02B8 000A
        MVO     R0,     G_034B                  ; FD81   0240 034B
        PULR    R7                              ; FD83   02B7

L_FD84:
        MVII    #$0006, R1                      ; FD84   02B9 0006
        MVO     R1,     G_034A                  ; FD86   0241 034A
        MVO     R1,     G_0352                  ; FD88   0241 0352
        INCR    R0                              ; FD8A   0008
        MVO     R0,     G_01E0                  ; FD8B   0240 01E0
        B       L_FD7A                          ; FD8D   0220 0014

L_FD8F:
        MVI     G_033D, R0                      ; FD8F   0280 033D
        SDBD                                    ; FD91   0001
        ANDI    #$EFFF, R0                      ; FD92   03B8 00FF 00EF
        MVO     R0,     G_033D                  ; FD95   0240 033D
        CLRR    R0                              ; FD97   01C0
        MVO     R0,     G_0349                  ; FD98   0240 0349
        MVO     R0,     G_034A                  ; FD9A   0240 034A
        MVO     R0,     G_0352                  ; FD9C   0240 0352
        MVO     R0,     G_035A                  ; FD9E   0240 035A
        MVO     R0,     G_0341                  ; FDA0   0240 0341
        SDBD                                    ; FDA2   0001
        MVII    #$08FD, R0                      ; FDA3   02B8 00FD 0008
        MVO     R0,     G_0359                  ; FDA6   0240 0359
        MVII    #$0345, R1                      ; FDA8   02B9 0345
L_FDAA:
        SDBD                                    ; FDAA   0001
        MVII    #$FDFF, R2                      ; FDAB   02BA 00FF 00FD
        AND@    R1,     R2                      ; FDAE   038A
        MVO@    R2,     R1                      ; FDAF   024A
        ADDI    #$0008, R1                      ; FDB0   02F9 0008
        CMPI    #$0355, R1                      ; FDB2   0379 0355
        BLE     L_FDAA                          ; FDB4   0226 000B

        SDBD                                    ; FDB6   0001
        MVII    #$F470, R0                      ; FDB7   02B8 0070 00F4
        MVO     R0,     G_0346                  ; FDBA   0240 0346
        SDBD                                    ; FDBC   0001
        MVII    #$F479, R0                      ; FDBD   02B8 0079 00F4
        MVO     R0,     G_034E                  ; FDC0   0240 034E
        MVII    #$0003, R0                      ; FDC2   02B8 0003
        MVO     R0,     G_0351                  ; FDC4   0240 0351
        CLRC                                    ; FDC6   0006

        JSR     R5,     L_DE68                  ; FDC7   0004 01DC 0268
        DECLE   $0200                           ; FDCA   0200

        SDBD                                    ; FDCB   0001
        MVII    #$2800, R0                      ; FDCC   02B8 0000 0028
        MVO     R0,     G_0348                  ; FDCF   0240 0348
        PULR    R7                              ; FDD1   02B7

        PSHR    R5                              ; FDD2   0275
        MVI     G_031E, R0                      ; FDD3   0280 031E
        SDBD                                    ; FDD5   0001
        CMPI    #$F44D, R0                      ; FDD6   0378 004D 00F4
        BEQ     L_FE97                          ; FDD9   0204 00BC

        MVI     G_01DE, R1                      ; FDDB   0281 01DE
        SDBD                                    ; FDDD   0001
        ADDI    #$FEB5, R1                      ; FDDE   02F9 00B5 00FE
        MVI     G_01DD, R0                      ; FDE1   0280 01DD
        CMPI    #$00FF, R0                      ; FDE3   0378 00FF
        BNEQ    L_FE22                          ; FDE5   020C 003B

        MVII    #$000E, R0                      ; FDE7   02B8 000E

        JSR     R5,     X_RAND2                 ; FDE9   0004 0114 029E

        MVII    #$0035, R1                      ; FDEC   02B9 0035

        JSR     R5,     X_MPY                   ; FDEE   0004 011C 01DC

        MVO     R2,     G_035C                  ; FDF1   0242 035C
        MVII    #$0001, R0                      ; FDF3   02B8 0001

        JSR     R5,     X_RAND1                 ; FDF5   0004 0114 027D

        CLRR    R1                              ; FDF8   01C9
        TSTR    R0                              ; FDF9   0080
        BEQ     L_FDFE                          ; FDFA   0204 0002

        MVII    #$0008, R1                      ; FDFC   02B9 0008
L_FDFE:
        MVII    #$0004, R0                      ; FDFE   02B8 0004

        JSR     R5,     X_RAND2                 ; FE00   0004 0114 029E

        MOVR    R0,     R2                      ; FE03   0082
        MVII    #$0001, R0                      ; FE04   02B8 0001

        JSR     R5,     X_RAND1                 ; FE06   0004 0114 027D

        TSTR    R0                              ; FE09   0080
        BEQ     L_FE0D                          ; FE0A   0204 0001

        NEGR    R2                              ; FE0C   0022
L_FE0D:
        ADDR    R2,     R1                      ; FE0D   00D1
        ANDI    #$000F, R1                      ; FE0E   03B9 000F
        MVO     R1,     G_01DE                  ; FE10   0241 01DE
        MVII    #$0002, R0                      ; FE12   02B8 0002

        JSR     R5,     X_RAND1                 ; FE14   0004 0114 027D

        SDBD                                    ; FE17   0001
        ADDI    #$FEB5, R1                      ; FE18   02F9 00B5 00FE
        MOVR    R0,     R2                      ; FE1B   0082
        MVII    #$0030, R3                      ; FE1C   02BB 0030
        MVO     R3,     G_01DF                  ; FE1E   0243 01DF
        B       L_FE2D                          ; FE20   0200 000B

L_FE22:
        MVI     G_01E2, R2                      ; FE22   0282 01E2
        MVII    #$0001, R0                      ; FE24   02B8 0001

        JSR     R5,     X_RAND1                 ; FE26   0004 0114 027D

        TSTR    R0                              ; FE29   0080
        BEQ     L_FE2D                          ; FE2A   0204 0001

        NEGR    R2                              ; FE2C   0022
L_FE2D:
        ADD@    R1,     R2                      ; FE2D   02CA
        MVO     R2,     G_01DE                  ; FE2E   0242 01DE
        SWAP    R2,     1                       ; FE30   0042
        XORI    #$0035, R2                      ; FE31   03FA 0035
        MVII    #$032D, R1                      ; FE33   02B9 032D
        MVI     G_01DF, R3                      ; FE35   0283 01DF

        JSR     R5,     .EXEC.9A3               ; FE37   0004 0118 01A3

        MVII    #$02A0, R0                      ; FE3A   02B8 02A0
        CMP     G_035C, R0                      ; FE3C   0340 035C
        BGT     L_FE42                          ; FE3E   020E 0002

        MVO     R0,     G_035C                  ; FE40   0240 035C

L_FE42:
        JSR     R5,     L_D0FD                  ; FE42   0004 01D0 00FD

        MVI     G_01DC, R1                      ; FE45   0281 01DC
        CMPI    #$00FF, R1                      ; FE47   0379 00FF
        BNEQ    L_FE54                          ; FE49   020C 0009

        MVII    #$0003, R0                      ; FE4B   02B8 0003
        SDBD                                    ; FE4D   0001
        MVII    #$FE6C, R1                      ; FE4E   02B9 006C 00FE

        JSR     R5,     .EXEC.A5E               ; FE51   0004 0118 025E

L_FE54:
        CLRR    R0                              ; FE54   01C0
        MVO     R0,     G_0322                  ; FE55   0240 0322
        MVO     R0,     G_032A                  ; FE57   0240 032A
        MVO     R0,     G_0321                  ; FE59   0240 0321
        MVII    #$0002, R0                      ; FE5B   02B8 0002
        MVO     R0,     G_01E1                  ; FE5D   0240 01E1
        MVO     R0,     G_01C5                  ; FE5F   0240 01C5
        SDBD                                    ; FE61   0001
        MVII    #$F44D, R0                      ; FE62   02B8 004D 00F4
        SDBD                                    ; FE65   0001
        MVII    #$F454, R1                      ; FE66   02B9 0054 00F4
        B       L_FEB0                          ; FE69   0200 0045
        PULR    R7                              ; FE6B   02B7

        JSR     R5,     L_FE86                  ; FE6C   0004 01FC 0286

        MVII    #$0004, R0                      ; FE6F   02B8 0004
        BLE     L_FE79                          ; FE71   0206 0006

        CLRR    R0                              ; FE73   01C0
        TSTR    R1                              ; FE74   0089
        BPL     L_FE79                          ; FE75   0203 0002

        MVII    #$0008, R0                      ; FE77   02B8 0008
L_FE79:
        MVII    #$0006, R2                      ; FE79   02BA 0006
        MVO     R2,     G_034B                  ; FE7B   0242 034B
        MVO     R2,     G_01E0                  ; FE7D   0242 01E0
        SDBD                                    ; FE7F   0001
        MVII    #$FE54, R5                      ; FE80   02BD 0054 00FE
        PSHR    R5                              ; FE83   0275
        B       L_FF8D                          ; FE84   0200 0107

L_FE86:
        PSHR    R5                              ; FE86   0275
        MVI     G_01DE, R2                      ; FE87   0282 01DE
        MVI     G_0347, R0                      ; FE89   0280 0347
        SWAP    R0,     1                       ; FE8B   0040
        ANDI    #$00FF, R0                      ; FE8C   03B8 00FF
        SUBR    R0,     R2                      ; FE8E   0102
        MOVR    R2,     R1                      ; FE8F   0091
        TSTR    R2                              ; FE90   0092
        BPL     L_FE94                          ; FE91   0203 0001

        NEGR    R2                              ; FE93   0022
L_FE94:
        CMPI    #$0005, R2                      ; FE94   037A 0005
        PULR    R7                              ; FE96   02B7

L_FE97:
        MVII    #$02F0, R0                      ; FE97   02B8 02F0
        MVO     R0,     G_0322                  ; FE99   0240 0322
        MVO     R0,     G_032A                  ; FE9B   0240 032A
        SDBD                                    ; FE9D   0001
        MVII    #$5450, R2                      ; FE9E   02BA 0050 0054
        MVII    #$0007, R3                      ; FEA1   02BB 0007
        MVII    #$031D, R1                      ; FEA3   02B9 031D

        JSR     R5,     .EXEC.9A8               ; FEA5   0004 0118 01A8

        SDBD                                    ; FEA8   0001
        MVII    #$F49D, R0                      ; FEA9   02B8 009D 00F4
        SDBD                                    ; FEAC   0001
        MVII    #$F4A4, R1                      ; FEAD   02B9 00A4 00F4
L_FEB0:
        MVO     R0,     G_031E                  ; FEB0   0240 031E
        MVO     R1,     G_0326                  ; FEB2   0241 0326
        PULR    R7                              ; FEB4   02B7

        DECLE   $0069,  $0064,  $005F,  $005A   ; FEB5   0069 0064 005F 005A
        DECLE   $0055,  $0050,  $004B,  $0046   ; FEB9   0055 0050 004B 0046
        DECLE   $0041,  $003C,  $0037           ; FEBD   0041 003C 0037

        GSWD    R2                              ; FEC0   0032
        RLC     R1,     2                       ; FEC1   0055
        RRC     R3,     2                       ; FEC2   0077
        RRC     R3,     1                       ; FEC3   0073
        SAR     R2,     2                       ; FEC4   006E
        PSHR    R5                              ; FEC5   0275
        CMP     G_01DC, R1                      ; FEC6   0341 01DC
        BEQ     L_FECE                          ; FEC8   0204 0004

        CMP     G_01DD, R1                      ; FECA   0341 01DD
        BEQ     L_FF62                          ; FECC   0204 0094

L_FECE:
        CMPI    #$0001, R0                      ; FECE   0378 0001
        BNEQ    L_FF7D                          ; FED0   020C 00AB

        MVI     .BTAB.00,R0                     ; FED2   0280 0200
        SLLC    R0,     1                       ; FED4   0058
        BC      L_FF7D                          ; FED5   0201 00A6

        NEGR    R1                              ; FED7   0021
        ADDI    #$01FF, R1                      ; FED8   02F9 01FF
        MVI@    R1,     R3                      ; FEDA   028B
        COMR    R3                              ; FEDB   001B
        ANDI    #$001F, R3                      ; FEDC   03BB 001F
        SDBD                                    ; FEDE   0001
        MVII    #$1596, R5                      ; FEDF   02BD 0096 0015
        MVII    #$000F, R0                      ; FEE2   02B8 000F
L_FEE4:
        CMP@    R5,     R3                      ; FEE4   036B
        BEQ     L_FEEC                          ; FEE5   0204 0005

        DECR    R0                              ; FEE7   0010
        BPL     L_FEE4                          ; FEE8   0223 0005
        B       L_FEEF                          ; FEEA   0200 0003

L_FEEC:
        MOVR    R0,     R1                      ; FEEC   0081
        B       L_FEF1                          ; FEED   0200 0002

L_FEEF:
        MVI     G_01E0, R1                      ; FEEF   0281 01E0
L_FEF1:
        TSTR    R1                              ; FEF1   0089
        BEQ     L_FF28                          ; FEF2   0204 0034

        CMPI    #$0008, R1                      ; FEF4   0379 0008
        BLE     L_FEF9                          ; FEF6   0206 0001

        NEGR    R1                              ; FEF8   0021
L_FEF9:
        ANDI    #$000F, R1                      ; FEF9   03B9 000F
        CMPI    #$0004, R1                      ; FEFB   0379 0004
        BEQ     L_FF18                          ; FEFD   0204 0019
        BLT     L_FF28                          ; FEFF   0205 0027

        MVII    #$0345, R2                      ; FF01   02BA 0345
L_FF03:
        MVII    #$0200, R0                      ; FF03   02B8 0200
        MOVR    R0,     R3                      ; FF05   0083
        COMR    R3                              ; FF06   001B
        AND@    R2,     R3                      ; FF07   0393
        XORR    R3,     R0                      ; FF08   01D8
        MVO@    R0,     R2                      ; FF09   0250
        ADDI    #$0008, R2                      ; FF0A   02FA 0008
        CMPI    #$0355, R2                      ; FF0C   037A 0355
        BLE     L_FF03                          ; FF0E   0226 000C

        SDBD                                    ; FF10   0001
        MVII    #$F8FD, R2                      ; FF11   02BA 00FD 00F8
        MVO     R2,     G_0359                  ; FF14   0242 0359
        B       L_FF28                          ; FF16   0200 0010

L_FF18:
        SDBD                                    ; FF18   0001
        MVII    #$F48B, R0                      ; FF19   02B8 008B 00F4
        SDBD                                    ; FF1C   0001
        MVII    #$F494, R3                      ; FF1D   02BB 0094 00F4
        MVII    #$0007, R2                      ; FF20   02BA 0007
        MVO     R2,     G_0351                  ; FF22   0242 0351
        MVII    #$0350, R4                      ; FF24   02BC 0350
        B       L_FF34                          ; FF26   0200 000C

L_FF28:
        SDBD                                    ; FF28   0001
        DECLE   $02B8,  $0070,  $00F4,  $0001   ; FF29   02B8 0070 00F4 0001

        MVII    #$0079, R3                      ; FF2D   02BB 0079
        ADDR    R6,     R4                      ; FF2F   00F4
        MVII    #$0300, R4                      ; FF30   02BC 0300
        MVO     R4,     G_035A                  ; FF32   0244 035A
L_FF34:
        MVO     R4,     G_034A                  ; FF34   0244 034A
        MVO     R4,     G_0352                  ; FF36   0244 0352
        MVO     R0,     G_0346                  ; FF38   0240 0346
        MVO     R3,     G_034E                  ; FF3A   0243 034E
        MVI     G_034F, R0                      ; FF3C   0280 034F
        MVO     R0,     G_033F                  ; FF3E   0240 033F
        MVI     G_033D, R0                      ; FF40   0280 033D
        SDBD                                    ; FF42   0001
        XORI    #$1000, R0                      ; FF43   03F8 0000 0010
        MVO     R0,     G_033D                  ; FF46   0240 033D
        MVII    #$001E, R0                      ; FF48   02B8 001E

        JSR     R5,     .EXEC.629               ; FF4A   0004 0114 0229

        MVO     R0,     G_0349                  ; FF4D   0240 0349
        SDBD                                    ; FF4F   0001
        ANDI    #$FF00, R0                      ; FF50   03B8 0000 00FF
        MVO     R0,     G_0341                  ; FF53   0240 0341
        MVII    #$0006, R0                      ; FF55   02B8 0006
        MVO     R0,     G_034B                  ; FF57   0240 034B
        CLRR    R0                              ; FF59   01C0
        MVO     R0,     G_01E0                  ; FF5A   0240 01E0
        SETC                                    ; FF5C   0007

        JSR     R5,     L_DE68                  ; FF5D   0004 01DC 0268
        DECLE   $0200                           ; FF60   0200

        PULR    R7                              ; FF61   02B7

L_FF62:
        MVI     .BTAB.02,R0                     ; FF62   0280 0202
        SLLC    R0,     1                       ; FF64   0058
        BC      L_FF7D                          ; FF65   0201 0016

        MVI     G_031E, R0                      ; FF67   0280 031E
        SDBD                                    ; FF69   0001
        CMPI    #$F49D, R0                      ; FF6A   0378 009D 00F4
        BNEQ    L_FF78                          ; FF6D   020C 0009

        MVI     G_0322, R0                      ; FF6F   0280 0322
        ANDI    #$000F, R0                      ; FF71   03B8 000F
        NEGR    R0                              ; FF73   0020
        ADD     G_01E2, R0                      ; FF74   02C0 01E2
        MVO     R0,     G_01E2                  ; FF76   0240 01E2
L_FF78:
        SETC                                    ; FF78   0007

        JSR     R5,     L_DE68                  ; FF79   0004 01DC 0268
        DECLE   $0202                           ; FF7C   0202
L_FF7D:
        PULR    R7                              ; FF7D   02B7

        PSHR    R5                              ; FF7E   0275
        CMP     G_01DC, R1                      ; FF7F   0341 01DC
        BNEQ    L_FFCD                          ; FF81   020C 004A

        MVI     .BTAB.00,R2                     ; FF83   0282 0200
        SLLC    R2,     1                       ; FF85   005A
        BC      L_FFBC                          ; FF86   0201 0034

        TSTR    R0                              ; FF88   0080
        BMI     L_FFBD                          ; FF89   020B 0032

        MVO     R0,     G_01E0                  ; FF8B   0240 01E0
L_FF8D:
        CLRR    R2                              ; FF8D   01D2
        CMPI    #$0004, R0                      ; FF8E   0378 0004
        BEQ     L_FFBD                          ; FF90   0204 002B
        BLT     L_FFA2                          ; FF92   0205 000E

        CMPI    #$000C, R0                      ; FF94   0378 000C
        BEQ     L_FFBD                          ; FF96   0204 0025
        BGT     L_FFA2                          ; FF98   020E 0008

        MVII    #$0008, R2                      ; FF9A   02BA 0008
        MVI     G_0345, R1                      ; FF9C   0281 0345
        XORI    #$0200, R1                      ; FF9E   03F9 0200
        MVO     R1,     G_0345                  ; FFA0   0241 0345
L_FFA2:
        MOVR    R2,     R1                      ; FFA2   0091
        MVII    #$0019, R0                      ; FFA3   02B8 0019

        JSR     R5,     .EXEC.629               ; FFA5   0004 0114 0229

        MVO     R0,     G_0349                  ; FFA8   0240 0349
        MVII    #$00F0, R0                      ; FFAA   02B8 00F0
        MVO     R0,     G_034A                  ; FFAC   0240 034A
        MVO     R0,     G_0352                  ; FFAE   0240 0352
        SDBD                                    ; FFB0   0001
        MVII    #$F4AB, R0                      ; FFB1   02B8 00AB 00F4
        MVO     R0,     G_0346                  ; FFB4   0240 0346
        SDBD                                    ; FFB6   0001
        MVII    #$F4B4, R0                      ; FFB7   02B8 00B4 00F4
        MVO     R0,     G_034E                  ; FFBA   0240 034E
L_FFBC:
        PULR    R7                              ; FFBC   02B7

L_FFBD:
        CLRR    R2                              ; FFBD   01D2
        MVO     R2,     G_0349                  ; FFBE   0242 0349
        MVO     R2,     G_034A                  ; FFC0   0242 034A
        MVO     R2,     G_0352                  ; FFC2   0242 0352
        MVI     G_0345, R0                      ; FFC4   0280 0345
        SDBD                                    ; FFC6   0001
        ANDI    #$FDFF, R0                      ; FFC7   03B8 00FF 00FD
        MVO     R0,     G_0345                  ; FFCA   0240 0345
        PULR    R7                              ; FFCC   02B7

L_FFCD:
        MVII    #$0033, R0                      ; FFCD   02B8 0033
        MVO     R0,     G_01DF                  ; FFCF   0240 01DF
        PULR    R7                              ; FFD1   02B7

        PSHR    R5                              ; FFD2   0275
        MVI     .BTAB.01,R0                     ; FFD3   0280 0201
        SLLC    R0,     1                       ; FFD5   0058
        BC      L_FFED                          ; FFD6   0201 0015

        MVI     G_0338, R0                      ; FFD8   0280 0338
        SDBD                                    ; FFDA   0001
        CMPI    #$3800, R0                      ; FFDB   0378 0000 0038
        BC      L_FFED                          ; FFDE   0201 000D

        MVII    #$0331, R1                      ; FFE0   02B9 0331

        JSR     R5,     L_DB9E                  ; FFE2   0004 01D8 039E

        SETC                                    ; FFE5   0007

        JSR     R5,     L_DE68                  ; FFE6   0004 01DC 0268
        DECLE   $0201                           ; FFE9   0201

        JSR     R5,     L_D0FD                  ; FFEA   0004 01D0 00FD

L_FFED:
        PULR    R7                              ; FFED   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; FFFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5044       <entry>
;;  $504F       <entry>
;;  $505A       <entry>
;;  $5085       <entry>
;;  $50B3       $5096   $509F   $50A7   $50AC  
;;  $50B4       $507F   $DF0A  
;;  $50CA       $50EB  
;;  $50DA       $50C8  
;;  $50ED       $50E7  
;;  $50FE       $50F3  
;;  $5101       $50B8   $50FC  
;;  $517A       $5219   $523A   $5251  
;;  $517E       $5187  
;;  $5189       $5181  
;;  $518A       $5225   $5246  
;;  $5198       $518C   $518F   $5192   $51A1   $51AF  
;;  $519F       $525B   $5269  
;;  $51AD       $51A7  
;;  $51AF       $51AB  
;;  $51B3       $5208   $5310   $DEA9  
;;  $51B9       $51BC  
;;  $51BF       $521C   $523D   $5254   $5262  
;;  $51DA       <entry> $555F  
;;  $51EB       $51E4  
;;  $51EC       $51EA  
;;  $51EF       $51D8   $FBBC  
;;  $521C       $5228  
;;  $523D       $5249  
;;  $524D       $5234  
;;  $5254       $525E  
;;  $5262       $526C  
;;  $526E       $5213  
;;  $5272       $524B  
;;  $5275       $5270  
;;  $527B       $527D  
;;  $5286       $528A  
;;  $528C       $5287  
;;  $5293       $5297  
;;  $5299       $5294  
;;  $52C2       $FBBF  
;;  $52D3       $52DA  
;;  $52D7       $52CC  
;;  $52EF       $52D1  
;;  $52F2       $52C7  
;;  $52F3       $52D5   $52ED   $52F1  
;;  $52F5       $52C0  
;;  $530C       $5306  
;;  $530F       $52BE  
;;  $5316       $5326  
;;  $5335       $532F  
;;  $534C       $5342  
;;  $5353       $5344  
;;  $5356       $5346  
;;  $5365       $5361  
;;  $537F       $533A  
;;  $5380       $520B   $52F5   $DE17  
;;  $5390       $539A  
;;  $539D       $5337  
;;  $53E0       $53D2  
;;  $53E5       $53D7   $53DB  
;;  $53EE       $53FC  
;;  $53FF       $53A6   $53AB  
;;  $5402       $540B  
;;  $542A       $5417   $5450  
;;  $5446       $5435  
;;  $5452       $5444  
;;  $5464       $5458  
;;  $546C       $545E  
;;  $549A       $54C4   $54C8   $54CE  
;;  $54B2       $54AE  
;;  $54BA       $54A1  
;;  $54D0       $5480  
;;  $54DB       $54D8  
;;  $54E6       $54DF  
;;  $54F6       $54EE  
;;  $5503       $54FA  
;;  $551E       $550F  
;;  $5523       $54EA  
;;  $5531       $5526   $552E  
;;  $5561       $5543  
;;  $556E       $5565  
;;  $557B       $6F1B  
;;  $557C       $5539   $553D   $5569  
;;  $5599       $5595  
;;  $55A5       $55A1  
;;  $55B7       $5486   $548A   $54C0   $54E4   $5507  
;;  $55B8       $5582   $5587  
;;  $55BB       $55BF  
;;  $55C2       $547A  
;;  $55D8       $55CC   $F36A  
;;  $55F8       $55F4  
;;  $561C       $5603  
;;  $5620       $5609  
;;  $5632       $5611   $561E   $6D1E  
;;  $5636       $5630  
;;  $5654       $55DC  
;;  $566F       $6E45  
;;  $5672       $6D22   $6E40  
;;  $5673       $5671  
;;  $5680       $567A  
;;  $56A2       $569F  
;;  $56A5       $5695  
;;  $56D0       $56C5  
;;  $56D4       $56CE  
;;  $56EA       $56E0  
;;  $56F2       $56B4  
;;  $5700       $56F6  
;;  $5707       $56F4  
;;  $571F       $5086  
;;  $5736       $572D  
;;  $573C       $5730   $5737  
;;  $5742       $5724  
;;  $5743       $5779   $57F8   $DAB7   $DB33  
;;  $5754       $574C  
;;  $5774       $5747   $5752  
;;  $5775       $5732  
;;  $578C       $5787   $D9D3  
;;  $57A5       $67AC  
;;  $57AE       $57B3  
;;  $57B7       $52B5   $55B1   $DB36  
;;  $57C0       $57BC  
;;  $57C8       $57D5  
;;  $57D0       $57D3  
;;  $57D7       $57CA  
;;  $57D8       $5056  
;;  $57EE       $57E4   $57E8  
;;  $57FB       $57E2   $57EC   $57F2  
;;  $57FC       $57DC  
;;  $58A8       $533C   $5794   $6F00   $DB08  
;;  $58AC       $58BA  
;;  $58B5       $58AF  
;;  $58BC       $58CA  
;;  $58C5       $58BF  
;;  $5A6C       $5061  
;;  $5A98       $5A9C  
;;  $5AA3       $5A9E  
;;  $5AA8       $5AC6  
;;  $5AB0       $5AAC  
;;  $5AE1       $5AEE  
;;  $5AE6       $5AE9  
;;  $5AF2       $5ADC  
;;  $5AF6       $5B04  
;;  $5AF8       $5AFC  
;;  $5B07       $5AF0  
;;  $5B09       $5ADA  
;;  $5B11       $5050  
;;  $5B19       $5B2F  
;;  $5B24       $5B39  
;;  $5B29       $5B22  
;;  $5B2A       $5B3E  
;;  $5B36       $5B1C  
;;  $5B40       $504B  
;;  $5B57       $5B4D   $5B53  
;;  $5B6B       $5B7D  
;;  $5B70       $5B69   $5B7B  
;;  $5B75       $5B61  
;;  $5B7F       $5B65   $5B6E   $5B73   $5B77  
;;  $5B89       $5B93   $5B96  
;;  $5B98       $5B8F  
;;  $5BA4       $5B9C  
;;  $5BB3       $5BAD  
;;  $5BBC       $5BB1  
;;  $5BBE       $5BDF  
;;  $5BDB       $5BC2  
;;  $5BE1       $5B45  
;;  $5BE2       $5BCA  
;;  $5BEF       $5BE4   $5C3B   $5C43   $5D61   $5D72  
;;  $5BF0       $5BEB  
;;  $5C11       $5BF0  
;;  $5C18       $5C01   $5C78  
;;  $5C1B       $5C87   $5D50  
;;  $5C2C       $5BED  
;;  $5C37       $5C16  
;;  $5C5C       $5C53  
;;  $5C61       $5C5A  
;;  $5C66       $5C62  
;;  $5C76       $5C31  
;;  $5C89       $5BFA   $5C64   $5D3D  
;;  $5C8D       $5BE6  
;;  $5C99       $5C94  
;;  $5CA8       $5C96  
;;  $5CB2       $5CEB  
;;  $5CBA       $5CB0  
;;  $5CBD       $5D28  
;;  $5CCC       $5CE3  
;;  $5CDF       $5CCD  
;;  $5CE0       $5CD5  
;;  $5CE5       $5D06  
;;  $5CED       $5CCA   $5D04  
;;  $5D00       $5CEE  
;;  $5D01       $5CF6  
;;  $5D08       $5CDD   $5CFE  
;;  $5D15       $5CDB   $5CFC  
;;  $5D1D       $5CA3  
;;  $5D20       $5C99  
;;  $5D2D       $5BE8  
;;  $5D33       $5D2E  
;;  $5D35       $5D30   $5D33  
;;  $5D52       $5D4B  
;;  $5D63       $5D54  
;;  $5D6A       $5C0F   $5C74  
;;  $5D75       $5C8A  
;;  $5D7B       $56C8   $5BFC   $5C11   $5C2C   $5D45   $6021   $D58D   $DBF9  
;;  $5D8B       $56D0   $5704   $5C82   $5E72   $605A   $6C2F  
;;  $5D9B       $5DCB  
;;  $5DA3       $5D9C  
;;  $5DC6       $5DBE  
;;  $5DC8       $5DC4  
;;  $5DCD       $5DA1  
;;  $5DD8       $5C34  
;;  $5DE9       $5DE3  
;;  $5DF9       $5DE7   $5DF0   $5DF4  
;;  $5E05       $548D   $56BE   $5701   $5C47   $5CBD   $5E24   $5ECB   $5FB5  
;;  $5E05       $6C2B   $DBE2   $DF83   $F0C5  
;;  $5E0D       $5E1D  
;;  $5E10       $5E0B   $5E1B  
;;  $5E15       $5C7F   $5E6D   $6057   $DF8B  
;;  $5E1F       $54A5   $5C0A   $5C6D   $5D65   $5E51   $D4C4  
;;  $5E34       $5E2E  
;;  $5E36       $5E32  
;;  $5E3A       $5053  
;;  $5E5E       $5E3F   $5E45   $5E4D  
;;  $5E5F       $508C  
;;  $5E92       $5E64   $5E80   $5E89   $5EA6  
;;  $5E93       $5E6A  
;;  $5EA2       $5E99  
;;  $5EAE       $5E8F   $5E9D   $5EAA  
;;  $5EBD       $5EB9  
;;  $5EBF       $5EBB  
;;  $5ECA       $50A9  
;;  $5ECB       $5CA5  
;;  $5EE1       $5ED5  
;;  $5EE9       $5EDF   $6E90  
;;  $5EFE       $5EFA  
;;  $5F0C       $5EF0  
;;  $5F2F       $5F2A  
;;  $5F30       $5F2D  
;;  $5F39       $5ED9   $5EE3  
;;  $5F46       $5F02   $5F12   $5F1D  
;;  $5F55       $507C  
;;  $5F73       $5F8C  
;;  $5F86       $5F75   $5F7A   $5F7D  
;;  $5F8E       $5F5A   $5F67   $5F6D   $5F91  
;;  $5F8F       $5F69  
;;  $5F97       $5FB0  
;;  $5FAA       $5F99   $5F9E   $5FA1  
;;  $5FB3       $5CB2  
;;  $5FC2       $5FBE  
;;  $5FC4       $5FC0  
;;  $5FDB       $5FE0  
;;  $5FDF       $5FD6  
;;  $5FE2       $5FD9  
;;  $5FE6       $5FDD  
;;  $5FE8       $5FCD  
;;  $5FE9       $5D08   $5D15  
;;  $5FFA       $5098  
;;  $6014       $6053  
;;  $6045       $6026   $6036  
;;  $604F       $6018   $601C  
;;  $6055       $5FFE   $6006   $600A  
;;  $6056       $50B0  
;;  $6057       $5CBA   $5D2A  
;;  $6088       $6085  
;;  $6098       $605F   $607B  
;;  $6099       $56D6   $5C1B   $5DDB   $5FF4   $6072   $6C35  
;;  $60AC       $D802  
;;  $60B1       $60B6  
;;  $60B8       $60B4   $60DF  
;;  $60D5       $60B2  
;;  $60DD       $60E7  
;;  $60E1       $60D9  
;;  $60E9       $60C3  
;;  $60FB       $60ED  
;;  $6107       $60C1  
;;  $6119       $610B  
;;  $6125       $60BF  
;;  $6137       $6129  
;;  $6143       $60BD  
;;  $6151       $60D3   $60F9   $6105   $6117   $6123   $6135   $6141  
;;  $616F       $6172  
;;  $6176       $531D   $60C7   $60DD   $60E3   $60EB   $6109   $6127   $6145  
;;  $6189       $6191  
;;  $6193       $618C  
;;  $6196       $619F  
;;  $61A1       $6194   $6199  
;;  $61B7       $61A9  
;;  $61C3       $61B9  
;;  $61CF       $61C5  
;;  $61D5       $61B5   $61C1   $61CD  
;;  $61DB       $61D1  
;;  $61E9       $61EF  
;;  $61F1       $61EC   $DC89  
;;  $6206       $DF37   $DF3E  
;;  $6208       $620E  
;;  $6210       $620B  
;;  $6211       $61AD   $61C9  
;;  $624F       $624D  
;;  $6268       $6266  
;;  $628E       $628C  
;;  $637E       $505E  
;;  $6392       $6386  
;;  $639A       $638C   $6390  
;;  $639D       $6382   $6396  
;;  $639E       $654A  
;;  $63C0       $63BD  
;;  $63C5       $63C2  
;;  $63D0       $63CA  
;;  $63DD       $63CE  
;;  $63E4       $63E1  
;;  $63E7       $64DB  
;;  $63F2       $63EE  
;;  $63F8       $652F   $658D  
;;  $6403       $63FF  
;;  $6408       $6532  
;;  $641C       $6418  
;;  $6425       $642E  
;;  $6430       $642A  
;;  $645F       $644E   $6452  
;;  $6474       $648F  
;;  $6475       $639A  
;;  $6491       $6486  
;;  $649E       $6482  
;;  $64BB       $64B4  
;;  $64BE       $64A1   $64A6   $64AE   $64B7  
;;  $64C5       $64C2  
;;  $64D5       $64D2  
;;  $64DB       $64CD   $6548  
;;  $6501       $64EE  
;;  $6523       $6512  
;;  $652B       $6508  
;;  $6532       $6398  
;;  $6539       $6527  
;;  $653A       $64B9   $64BC  
;;  $654A       $64D9   $6544  
;;  $654E       $653E  
;;  $655D       $655A  
;;  $6564       $6561  
;;  $6572       $6578  
;;  $657A       $6574  
;;  $65A6       $65A2  
;;  $65DE       $6554   $656E  
;;  $65DF       $6568   $66DB  
;;  $65F0       $65E8  
;;  $6608       $65F4   $65FB  
;;  $6611       $6615  
;;  $6617       $6612  
;;  $662F       $662C  
;;  $6633       $6630  
;;  $6638       $6635  
;;  $6656       $664E   $6650  
;;  $6658       $664B   $6654  
;;  $6675       $666F  
;;  $667B       $660B  
;;  $668F       $6681   $6686  
;;  $6690       $6503   $6540  
;;  $66A3       $5048  
;;  $66C0       $66D1  
;;  $66C8       $66C5  
;;  $66D3       $66CD  
;;  $66DB       $66D8  
;;  $66EE       $66EA  
;;  $671B       $66A7   $66B1   $66C9   $6722  
;;  $6721       $66E1  
;;  $6724       $61DB  
;;  $6727       $6731  
;;  $672F       $6752  
;;  $6733       $672D  
;;  $6751       $674B  
;;  $6754       $672A  
;;  $6755       $552B  
;;  $675B       $6766   $676A  
;;  $675D       $67A7  
;;  $678F       $6787  
;;  $67A9       $675F  
;;  $67AF       $67AA  
;;  $6AF9       $5067  
;;  $6AFE       $6B4E  
;;  $6B29       $6B1B   $6B1F  
;;  $6B2F       $6B27  
;;  $6B37       $6B5C  
;;  $6B39       $6B31   $6B35   $6B5E  
;;  $6B45       $6B42  
;;  $6B48       $6B03  
;;  $6B51       $6B0E  
;;  $6B60       $506A  
;;  $6B7A       $6BAA   $6BB0   $6BBA  
;;  $6B99       $6B95  
;;  $6B9E       $6B8F  
;;  $6B9F       $6B9C  
;;  $6BA3       $6B80   $6B89  
;;  $6BBC       $6B6B   $6B73   $6BAE   $6BC9   $6BCF  
;;  $6BBD       $6B65  
;;  $6BC6       $6BC3  
;;  $6BCB       $5500  
;;  $6BD1       $6E1E   $F394  
;;  $6BE1       $6520  
;;  $6BF2       $6BEE  
;;  $6C0E       $6C0B  
;;  $6C1D       $56E2   $6C41   $6EC2  
;;  $6C1E       $5CB7   $5D1A   $5F09   $6EAB  
;;  $6C27       $5F33  
;;  $6C2B       $5D1D  
;;  $6C45       $6C3D  
;;  $6C49       $6D3A  
;;  $6C92       $6C92  
;;  $6CA4       $6C4D  
;;  $6CAF       $56EF   $5D12   $6C25   $6C28   $6C47   $6CA9   $6EA9  
;;  $6CD0       $6CC6   $6CCA  
;;  $6CD3       $6CBF   $6CCE  
;;  $6CDB       $6C9E  
;;  $6CEF       $6C68   $6C6E   $6C71   $6C7B   $6CB5   $6CBA  
;;  $6CF0       $6C64  
;;  $6CFF       $6CF9  
;;  $6D03       $6CFC   $6D00  
;;  $6D21       $6D13  
;;  $6D25       $6CF4  
;;  $6D46       $6D40  
;;  $6D4C       $6D44  
;;  $6D57       $6042  
;;  $6D66       $5E01  
;;  $6D81       $6D6A  
;;  $6D82       $6D64   $6D7F  
;;  $6DAA       $6D87   $6D8C  
;;  $6DB7       $6C58   $6D31  
;;  $6DCF       $6DC5  
;;  $6DDE       $6DD3  
;;  $6DFE       $6E29  
;;  $6E02       $6DED  
;;  $6E20       $6E09   $6E0F  
;;  $6E21       $6DE4  
;;  $6E22       $6DBB   $6DF6  
;;  $6E24       $6E16  
;;  $6E25       $6DFC  
;;  $6E45       $6E3E  
;;  $6E4A       $6E36  
;;  $6E5B       $6E53  
;;  $6E90       $6E8C  
;;  $6E93       $6E7F  
;;  $6EA9       $6E9F  
;;  $6EAB       $6EA5  
;;  $6EAD       $6E71  
;;  $6EB7       $6EB3  
;;  $6EBF       $6EBB  
;;  $6ED3       $6ECF  
;;  $6EE0       $6EDC  
;;  $6EE8       $6ECA  
;;  $6EED       $6E69  
;;  $6EFC       $6EF9  
;;  $6F07       $6E43   $6E48  
;;  $6F1E       $6F14   $6F19  
;;  $6F1F       $6F10  
;;  $6F30       $6F2B  
;;  $6F37       $6F34  
;;  $6F59       $6F4F  
;;  $6F65       $6F5E  
;;  $6F66       $6F64  
;;  $6F69       $6F61  
;;  $6F78       $6F7F  
;;  $6F8F       $6F85  
;;  $6F9E       $6F98  
;;  $6F9F       $6F96   $6F9C  
;;  $6FB8       $6FAA  
;;  $6FBA       $6F25   $6F3D   $6F46   $6F57  
;;  $6FBB       $6F4C   $6F54  
;;  $6FCD       $6FC2  
;;  $6FCE       $6C73   $D449  
;;  $6FD7       $6FD0  
;;  $6FDC       $6FD4   $6FD9  
;;  $D0FD       $50DA   $6CEC   $6F07   $D558   $D930   $DC45   $FC1C   $FC49  
;;  $D0FD       $FE42   $FFEA  
;;  $D1DA       $D1DA  
;;  $D1DF       $D1DD  
;;  $D205       $D203  
;;  $D2A6       $D2A4  
;;  $D2AE       $D2AE  
;;  $D2BD       $D2BB  
;;  $D2D8       $D2D6  
;;  $D2D9       $D2D9  
;;  $D2DE       $D2DC  
;;  $D2DF       $D2DF  
;;  $D2E2       $D2E2  
;;  $D2E7       $D2E5  
;;  $D2E8       $D2E8  
;;  $D2EB       $D2EB  
;;  $D2EE       $D2EE  
;;  $D2F3       $D2F1  
;;  $D383       $D381  
;;  $D384       $D384  
;;  $D399       $D397  
;;  $D44C       $D446  
;;  $D454       $D44F  
;;  $D472       $D45F   $D467  
;;  $D48E       $D470   $D481  
;;  $D497       $D491  
;;  $D49F       $D49B  
;;  $D4AB       $D485  
;;  $D4C1       $D4A4  
;;  $D4CA       $D4BF  
;;  $D4CE       $D4A9  
;;  $D4D1       $D48C  
;;  $D4F6       $D4E1  
;;  $D4FE       $D4B7  
;;  $D50A       $D502  
;;  $D517       $D508   $D50D  
;;  $D521       $D519  
;;  $D53E       $D53A  
;;  $D551       $D54C  
;;  $D558       $D4FC  
;;  $D55B       $D439   $D43F   $D452   $D45A   $D46C   $D495   $D4AC   $D515  
;;  $D55B       $D55E  
;;  $D55C       $D433  
;;  $D56F       $D569  
;;  $D57F       $D577  
;;  $D5AF       $D5A0   $D5A9  
;;  $D5C4       $D587  
;;  $D5D0       $D57D   $D5D8  
;;  $D5D3       $D581   $D5C8   $D5CE  
;;  $D5D4       $D592  
;;  $D5DA       $534C   $5356   $578C   $D5EF   $D937   $D975   $DA8E   $DD55  
;;  $D5EF       $D573  
;;  $D60F       $D609  
;;  $D621       $5064  
;;  $D64C       $D645  
;;  $D650       $D63D  
;;  $D662       $D65C  
;;  $D664       $D628   $D642   $D64C   $D654   $D659  
;;  $D665       $D64A   $D64E   $D660   $D662  
;;  $D668       $D630  
;;  $D669       $5045  
;;  $D688       $D66E   $D674  
;;  $D68E       $602E   $D716   $D72D  
;;  $D69E       $6028   $D70E   $D722  
;;  $D6A9       $D4B1   $D6F6  
;;  $D6B3       $D6B0  
;;  $D6B7       $D6B4  
;;  $D6BC       $D6B9  
;;  $D6C0       <entry>
;;  $D6DC       $D6C5   $D6CB  
;;  $D6DD       $D6D1   $D6D9  
;;  $D6E2       $D75A  
;;  $D704       $D709  
;;  $D70B       $D706  
;;  $D73C       $D736  
;;  $D748       $D700   $D720  
;;  $D74F       $D6EF   $D6F4   $D71D   $D746   $D74D  
;;  $D75D       $5F20   $6031   $6075   $D719   $D730  
;;  $D761       $D75E  
;;  $D768       $D763  
;;  $D769       $506D  
;;  $D76D       $D78B  
;;  $D77B       $D774  
;;  $D784       $D779   $D77F  
;;  $D78E       $D776  
;;  $D794       $D781  
;;  $D798       $D792  
;;  $D7BA       $D7B7  
;;  $D7C0       $D7A4  
;;  $D7C1       $D79C   $D7AA   $D7AE   $D7B2   $D7BE  
;;  $D7C3       $D74A  
;;  $D7D9       $5AA0  
;;  $D7EA       $D7E5  
;;  $D7F4       $D7E1  
;;  $D7FB       $D7F6  
;;  $D7FE       $D7F2  
;;  $D821       $D80E   $D814  
;;  $D822       $51D2   $579E   $D61A  
;;  $D82D       $D828  
;;  $D830       $D82D  
;;  $D83F       $50FE   $D54E   $D8FF   $D93A   $D99A   $F1F2  
;;  $D843       $50F9   $DF74  
;;  $D85B       $5070  
;;  $D860       $D8BD  
;;  $D88A       $D866   $D871  
;;  $D88C       $D87B   $D881   $D888  
;;  $D8B6       $D892   $D89D  
;;  $D8B8       $D8A7   $D8AD   $D8B4  
;;  $D8E9       $D8DA  
;;  $D8F6       $D8EC  
;;  $D906       $D8FD  
;;  $D92A       $D922  
;;  $D92E       $D928  
;;  $D934       $D8F4   $D90D  
;;  $D945       $D942  
;;  $D950       $5353   $D94A  
;;  $D968       $D964  
;;  $D972       $D96E  
;;  $D983       $D983  
;;  $D987       $D987  
;;  $D988       $D8CD   $D8E7  
;;  $D9AA       $5789   $D97E   $D9B8   $DB03   $DD36  
;;  $D9CB       $D9C6  
;;  $D9D6       $D9D1  
;;  $D9D7       $D9BE   $D9C2  
;;  $D9F0       $D9EA  
;;  $DA00       $D8C3   $D8C7   $D958   $D98C   $D995  
;;  $DA01       $D873   $D89F  
;;  $DA0D       $D868   $D894   $D8D1   $D8DE   $F228   $F235  
;;  $DA31       $DA2D  
;;  $DA33       $D606   $D945   $DB14   $DCEC   $DF7A   $F06A  
;;  $DA3C       $DA39  
;;  $DA3D       $5B58   $5C4B   $5CC7   $5E29   $5ED0   $5FBA   $6BEB   $6C06  
;;  $DA3D       $6EB8   $DA9F   $DD6B   $F0C9   $F11E   $F3B8  
;;  $DA41       $5EEA   $5FC6   $D8F8   $D908   $D990   $DB78  
;;  $DA45       $DA59  
;;  $DA4F       $DA47  
;;  $DA50       $DA4B  
;;  $DA52       $FBE5   $FBF7   $FC2A   $FC31   $FC38   $FC96  
;;  $DA5B       $DAA9   $DAB0  
;;  $DA5F       $F3A1   $F3A5  
;;  $DA64       $DA6E   $F3F5  
;;  $DA71       $53E0   $55B4   $D61D  
;;  $DA9A       $DA97  
;;  $DAA7       $DAA3  
;;  $DAD3       $534F   $D902  
;;  $DAEF       $DAEC  
;;  $DB08       $D9CD   $DB01  
;;  $DB1B       $DB17  
;;  $DB27       $DB21  
;;  $DB28       $DB26  
;;  $DB3E       $DAD8  
;;  $DB3F       $D617   $DB30  
;;  $DB4C       $DB46  
;;  $DB4E       $DB57  
;;  $DB61       $5073  
;;  $DB70       $DB9B  
;;  $DB94       $DB7E   $DB87   $DB8D  
;;  $DB96       $DB73  
;;  $DB9D       $DB68  
;;  $DB9E       $5D59   $DB91   $FC19   $FD7C   $FFE2  
;;  $DBA9       $DBB7  
;;  $DBAE       $5D5E   $668C   $D885   $D8B1  
;;  $DBB9       $D9FD  
;;  $DBCC       $DBC8  
;;  $DBD1       $DBBE  
;;  $DBDD       $DBCF  
;;  $DBEC       $DC0D  
;;  $DC01       $DBEE   $DBF6   $DC29  
;;  $DC10       $DC07   $DC0B  
;;  $DC11       $DBFF  
;;  $DC2B       $5089  
;;  $DC48       $DC30   $DC36   $DC3B   $DC43  
;;  $DC49       $DCAF   $DCBD  
;;  $DC61       $DC5B  
;;  $DC6C       $DC6F  
;;  $DC71       $DC51  
;;  $DC7C       $DC76  
;;  $DC81       $DC87  
;;  $DC89       $DC84  
;;  $DC9E       $5079  
;;  $DCAF       $DCA9  
;;  $DCB2       $DCAD  
;;  $DCB3       $DCA3  
;;  $DCC3       $DCB7   $DCBB  
;;  $DCC4       $5460  
;;  $DCCE       $DCCA  
;;  $DCE0       $DCD7  
;;  $DCE5       $6E2D  
;;  $DCF3       $63E4  
;;  $DD03       $DCFB  
;;  $DD1C       $DCEA   $DCF1  
;;  $DD29       $5348   $D94C  
;;  $DD39       $D9C8  
;;  $DD48       $DD44  
;;  $DD52       $DD4E  
;;  $DD6A       $DD62  
;;  $DD72       $DD6E  
;;  $DD81       $D972   $DD52  
;;  $DD8F       $51C6   $577C   $D97B   $D9A3   $DAFA   $DB0B   $DD33   $F1EF  
;;  $DD8F       $F274   $F39B  
;;  $DD9D       $DDB0  
;;  $DDAB       $DDA8  
;;  $DDE6       $530C   $DE8C  
;;  $DDF4       $DDF7  
;;  $DE12       $DDFE  
;;  $DE16       $DEB3  
;;  $DE2F       $DE24  
;;  $DE38       $DE2D   $DE32  
;;  $DE3E       $DE51  
;;  $DE46       $DE4A  
;;  $DE53       $DE43  
;;  $DE68       $FB34   $FBA4   $FDC7   $FF5D   $FF79   $FFE6  
;;  $DE6F       $5272  
;;  $DE79       $DE74  
;;  $DE7B       $DE72  
;;  $DE7C       $DE77   $DE7A  
;;  $DE82       $DF93  
;;  $DEB3       $FBA8  
;;  $DEDD       $DEE5  
;;  $DEFA       $DEEF  
;;  $DF33       $DF2D  
;;  $DF41       $DF2B  
;;  $DF44       $DF21  
;;  $DF45       $DF43  
;;  $DF67       $DF6A  
;;  $DF78       $54F3  
;;  $DF80       $DF7D  
;;  $DF95       $DF86   $DF8E  
;;  $DF9C       $DF98  
;;  $DFA8       $DFA3  
;;  $DFCD       $DFCB  
;;  $DFF9       $DFF9  
;;  $F000       $DE8F  
;;  $F00B       $F044  
;;  $F026       $F022  
;;  $F03D       $F02E  
;;  $F03E       $F040  
;;  $F047       $508F  
;;  $F066       $F05F  
;;  $F075       $F06D  
;;  $F079       $F073  
;;  $F086       $F0B1   $F0B7  
;;  $F093       $F090  
;;  $F09A       $F097  
;;  $F0A8       $F0A5  
;;  $F0AE       $F0AB  
;;  $F0B3       $F0AF  
;;  $F0BA       $F095  
;;  $F0D6       $F0CE  
;;  $F0DA       $F0D4  
;;  $F0E4       $F0E1  
;;  $F0EE       $F0EA  
;;  $F113       $F051   $F057   $F064   $F071   $F077   $F0BF   $F0C3   $F0D2  
;;  $F113       $F0D8  
;;  $F117       $F04D  
;;  $F118       $F1A5  
;;  $F11E       $F11B  
;;  $F144       $F13C  
;;  $F148       $F142  
;;  $F196       $F174  
;;  $F1A2       $F19E  
;;  $F1AB       $F1A8  
;;  $F1DF       $F126   $F131   $F140   $F146   $F161   $F16D  
;;  $F1E0       $F1D1  
;;  $F1EA       $F111   $F1DD  
;;  $F1F9       $F207   $F20C  
;;  $F213       $F1CE  
;;  $F235       $F226  
;;  $F240       $F231  
;;  $F241       $F217   $F21B  
;;  $F244       $F233   $F23E  
;;  $F248       $554B   $F20E  
;;  $F250       $F259  
;;  $F25B       $F252  
;;  $F25C       $F2C8  
;;  $F270       $D68A  
;;  $F29D       $F295  
;;  $F29F       $5754   $57FC   $F249   $F271  
;;  $F2A8       $F2AA  
;;  $F2C3       $F2B0   $F2B2   $F2B6   $F2BC  
;;  $F2F5       $F260  
;;  $F303       $DD75   $F2FD  
;;  $F318       $F303  
;;  $F325       $F352  
;;  $F32C       $F336  
;;  $F331       $F32A  
;;  $F348       $F32F  
;;  $F354       $F34C  
;;  $F36D       $DCE2  
;;  $F3AF       $53D4   $F39E  
;;  $F3BE       $F3BB  
;;  $F3C9       $F3C2  
;;  $F3CE       $F3C5  
;;  $F3D0       $F3C7   $F3CC  
;;  $F3EC       $F316  
;;  $F5DD       $F5DD  
;;  $F9EA       $F9EA  
;;  $FA2A       $FA28  
;;  $FB1D       $DF07  
;;  $FB43       $FB59  
;;  $FB4A       $FB47  
;;  $FB83       $FB7B  
;;  $FB8B       $FB81  
;;  $FB8F       $FB89  
;;  $FBAB       $FB68   $FB6F  
;;  $FBBF       $FBBA  
;;  $FBC2       $FBCB  
;;  $FBC4       $FB2B   $FB30   $FC9B  
;;  $FBC5       $FB21  
;;  $FBD7       $FC26   $FC3D   $FC5A  
;;  $FBED       $FBEA  
;;  $FC05       $FC02  
;;  $FC0F       $FBE1  
;;  $FC15       $FC47   $FCC1  
;;  $FC20       $FBD3  
;;  $FC49       $FC36  
;;  $FC4C       $FC2F  
;;  $FC5C       $FBD5   $FC52  
;;  $FC78       $FC72  
;;  $FC7C       $FB26   $FC66  
;;  $FC8A       $FC87  
;;  $FC94       $FC76   $FC82  
;;  $FCAF       $FCAB  
;;  $FCB5       $FC58  
;;  $FCC3       $DF0F  
;;  $FCE0       $FCDD  
;;  $FD06       $FCEF  
;;  $FD0C       $FCC9   $FCD7   $FCE4   $FCEC  
;;  $FD23       $FD1F   $FD2D  
;;  $FD27       $FD17  
;;  $FD31       $FD12  
;;  $FD62       $FD49  
;;  $FD6F       $FD33  
;;  $FD7A       $FD8D  
;;  $FD84       $FD78  
;;  $FD8F       $FD2F   $FD35  
;;  $FDAA       $FDB4  
;;  $FDFE       $FDFA  
;;  $FE0D       $FE0A  
;;  $FE22       $FDE5  
;;  $FE2D       $FE20   $FE2A  
;;  $FE42       $FE3E  
;;  $FE54       $FE49  
;;  $FE79       $FE71   $FE75  
;;  $FE86       $FD14   $FE6C  
;;  $FE94       $FE91  
;;  $FE97       $FDD9  
;;  $FEB0       $FE69  
;;  $FECE       $FEC8  
;;  $FEE4       $FEE8  
;;  $FEEC       $FEE5  
;;  $FEEF       $FD25   $FEEA  
;;  $FEF1       $FEED  
;;  $FEF9       $FEF6  
;;  $FF03       $FF0E  
;;  $FF18       $FEFD  
;;  $FF28       $FEF2   $FEFF   $FF16  
;;  $FF34       $FF26  
;;  $FF62       $FECC  
;;  $FF78       $FF6D  
;;  $FF7D       $FED0   $FED5   $FF65  
;;  $FF8D       $FE84  
;;  $FFA2       $FF92   $FF98  
;;  $FFBC       $FF86  
;;  $FFBD       $FF89   $FF90   $FF96  
;;  $FFCD       $FF81  
;;  $FFED       $FFD6   $FFDE  
;; ======================================================================== ;;
