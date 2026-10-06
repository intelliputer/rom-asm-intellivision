
        ORG     $5000
.HEADER:
        BIDECLE $58CD           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5034           ; 5004  Ptr: Start of game
        BIDECLE $5816           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $57FB           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502E           ; 500A  Ptr: Date/Title
        DECLE   $0002           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $00E6,  $0054,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0018,  $0057,  $0003,  $0000; 5024  Timer dispatch/interval
        DECLE   $005E,  $0052,  $0001,  $0000; 5028  Timer dispatch/interval
        BIDECLE $0000           ; 502C  End of timer table

.TITLE:
        DECLE   $004F                           ; 502E  Cartridge year
        STRING  "GOLF"                          ; 502F  Title string
        DECLE   $0000                           ; 5033  

.START:
        PSHR    R5                              ; 5034   0275
        MVII    #$0003, R2                      ; 5035   02BA 0003
        SDBD                                    ; 5037   0001
        MVII    #$5020, R1                      ; 5038   02B9 0020 0050

L_503B:
        JSR     R5,     X_TIMER_STOP            ; 503B   0004 0118 0038

        ADDI    #$0004, R1                      ; 503E   02F9 0004
        DECR    R2                              ; 5040   0012
        BNEQ    L_503B                          ; 5041   022C 0007

L_5043:
        JSR     R5,     L_5A8A                  ; 5043   0004 0158 028A

        SDBD                                    ; 5046   0001
        MVII    #$51DD, R4                      ; 5047   02BC 00DD 0051
        MVII    #$0001, R0                      ; 504A   02B8 0001
        MVII    #$0282, R1                      ; 504C   02B9 0282
        CLRR    R2                              ; 504E   01D2

        JSR     R5,     .EXEC.910               ; 504F   0004 0118 0110

        TSTR    R0                              ; 5052   0080
        BEQ     L_5059                          ; 5053   0204 0004

        CMPI    #$0005, R0                      ; 5055   0378 0005
        BMI     L_505E                          ; 5057   020B 0005

L_5059:
        JSR     R5,     X_PLAY_RAZZ2            ; 5059   0004 011C 02BD

        B       L_5043                          ; 505C   0220 001A

L_505E:
        MVO     R0,     G_0161                  ; 505E   0240 0161

        JSR     R5,     L_5090                  ; 5060   0004 0150 0090
        JSR     R5,     L_5070                  ; 5063   0004 0150 0070
        JSR     R5,     L_50AC                  ; 5066   0004 0150 00AC

        SDBD                                    ; 5069   0001
        MVII    #$51D3, R0                      ; 506A   02B8 00D3 0051
        MVO     R0,     G_035D                  ; 506D   0240 035D
        PULR    R7                              ; 506F   02B7

L_5070:
        PSHR    R5                              ; 5070   0275
        MVII    #$0010, R0                      ; 5071   02B8 0010
        MVO     R0,     G_0119                  ; 5073   0240 0119
        MVII    #$0058, R0                      ; 5075   02B8 0058
        MVO     R0,     G_0118                  ; 5077   0240 0118
        CLRR    R0                              ; 5079   01C0
        MVO     R0,     G_0115                  ; 507A   0240 0115
        MVII    #$0179, R4                      ; 507C   02BC 0179
        MVO@    R0,     R4                      ; 507E   0260
        INCR    R0                              ; 507F   0008
        MVO@    R0,     R4                      ; 5080   0260
        INCR    R0                              ; 5081   0008
        MVO@    R0,     R4                      ; 5082   0260
        INCR    R0                              ; 5083   0008
        MVO@    R0,     R4                      ; 5084   0260
        MVO     R0,     G_0103                  ; 5085   0240 0103
        MVII    #$001C, R0                      ; 5087   02B8 001C
        MVO     R0,     G_0175                  ; 5089   0240 0175
        MVII    #$005C, R0                      ; 508B   02B8 005C
        MVO     R0,     G_0176                  ; 508D   0240 0176
        PULR    R7                              ; 508F   02B7

L_5090:
        PSHR    R5                              ; 5090   0275
        MVII    #$0004, R0                      ; 5091   02B8 0004
        SDBD                                    ; 5093   0001
        MVII    #$5856, R1                      ; 5094   02B9 0056 0058
        MVII    #$031D, R2                      ; 5097   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 5099   0004 0114 02B4

        SDBD                                    ; 509C   0001
        MVII    #$5896, R1                      ; 509D   02B9 0096 0058
        MVII    #$033D, R2                      ; 50A0   02BA 033D

L_50A2:
        JSR     R5,     X_INIT_MOB              ; 50A2   0004 0114 02B2

        ADDI    #$0008, R2                      ; 50A5   02FA 0008
        CMPI    #$0355, R2                      ; 50A7   037A 0355
        BLE     L_50A2                          ; 50A9   0226 0008
        PULR    R7                              ; 50AB   02B7

L_50AC:
        PSHR    R5                              ; 50AC   0275
        MVI     G_016C, R0                      ; 50AD   0280 016C
        INCR    R0                              ; 50AF   0008
        MVO     R0,     G_016C                  ; 50B0   0240 016C
        CMPI    #$000A, R0                      ; 50B2   0378 000A
        BPL     L_511B                          ; 50B4   0203 0065

        JSR     R5,     L_50E1                  ; 50B6   0004 0150 00E1

        CLRR    R0                              ; 50B9   01C0
        MVO     R0,     G_0177                  ; 50BA   0240 0177

        JSR     R5,     L_5A45                  ; 50BC   0004 0158 0245
        JSR     R5,     L_5AC9                  ; 50BF   0004 0158 02C9
        JSR     R5,     L_5B61                  ; 50C2   0004 0158 0361

        MVII    #$016D, R4                      ; 50C5   02BC 016D
        SDBD                                    ; 50C7   0001
        MVI@    R4,     R0                      ; 50C8   02A0
        SDBD                                    ; 50C9   0001
        MVI@    R4,     R1                      ; 50CA   02A1
        MVO     R0,     G_0337                  ; 50CB   0240 0337
        MVO     R1,     G_0338                  ; 50CD   0241 0338
        MVII    #$033D, R1                      ; 50CF   02B9 033D
L_50D1:
        MVI@    R1,     R0                      ; 50D1   0288
        SDBD                                    ; 50D2   0001
        ANDI    #$FFF7, R0                      ; 50D3   03B8 00F7 00FF
        MVO@    R0,     R1                      ; 50D6   0248
        ADDI    #$0008, R1                      ; 50D7   02F9 0008
        CMPI    #$0355, R1                      ; 50D9   0379 0355
        BLE     L_50D1                          ; 50DB   0226 000B

        JSR     R5,     L_5138                  ; 50DD   0004 0150 0138

        PULR    R7                              ; 50E0   02B7

L_50E1:
        PSHR    R5                              ; 50E1   0275
        CLRR    R0                              ; 50E2   01C0
L_50E3:
        MOVR    R0,     R3                      ; 50E3   0083
        ADDI    #$0179, R3                      ; 50E4   02FB 0179
        MVI@    R3,     R3                      ; 50E6   029B
        ADDI    #$0162, R3                      ; 50E7   02FB 0162
        MVI@    R3,     R2                      ; 50E9   029A
        MOVR    R0,     R1                      ; 50EA   0081
L_50EB:
        INCR    R1                              ; 50EB   0009
        CMP     G_0161, R1                      ; 50EC   0341 0161
        BEQ     L_510C                          ; 50EE   0204 001C

        MOVR    R1,     R3                      ; 50F0   008B
        ADDI    #$0179, R3                      ; 50F1   02FB 0179
        MVI@    R3,     R3                      ; 50F3   029B
        ADDI    #$0162, R3                      ; 50F4   02FB 0162
        CMP@    R3,     R2                      ; 50F6   035A
        BLE     L_50EB                          ; 50F7   0226 000D

        MVI@    R3,     R2                      ; 50F9   029A
        MOVR    R1,     R3                      ; 50FA   008B
        ADDI    #$0179, R3                      ; 50FB   02FB 0179
        MVI@    R3,     R5                      ; 50FD   029D
L_50FE:
        DECR    R3                              ; 50FE   0013
        MVI@    R3,     R4                      ; 50FF   029C
        INCR    R3                              ; 5100   000B
        MVO@    R4,     R3                      ; 5101   025C
        DECR    R3                              ; 5102   0013
        MOVR    R0,     R4                      ; 5103   0084
        ADDI    #$0179, R4                      ; 5104   02FC 0179
        CMPR    R3,     R4                      ; 5106   015C
        BLT     L_50FE                          ; 5107   0225 000A

        MVO@    R5,     R3                      ; 5109   025D
        B       L_50EB                          ; 510A   0220 0020

L_510C:
        INCR    R0                              ; 510C   0008
        MVI     G_0161, R5                      ; 510D   0285 0161
        DECR    R5                              ; 510F   0015
        CMPR    R5,     R0                      ; 5110   0168
        BMI     L_50E3                          ; 5111   022B 002F

        CLRR    R0                              ; 5113   01C0
        MVII    #$0162, R4                      ; 5114   02BC 0162
        MVO@    R0,     R4                      ; 5116   0260
        MVO@    R0,     R4                      ; 5117   0260
        MVO@    R0,     R4                      ; 5118   0260
        MVO@    R0,     R4                      ; 5119   0260
        PULR    R7                              ; 511A   02B7

L_511B:
        SDBD                                    ; 511B   0001
        MVII    #$1906, R0                      ; 511C   02B8 0006 0019
        MVO     R0,     G_035D                  ; 511F   0240 035D
        MVII    #$0005, R0                      ; 5121   02B8 0005
        MVO     R0,     G_016B                  ; 5123   0240 016B
        MVII    #$0004, R0                      ; 5125   02B8 0004
        MVO     R0,     G_016A                  ; 5127   0240 016A

        JSR     R5,     L_5AC9                  ; 5129   0004 0158 02C9

        MVII    #$0014, R0                      ; 512C   02B8 0014
        SDBD                                    ; 512E   0001
        MVII    #$2800, R1                      ; 512F   02B9 0000 0028
        MVII    #$0200, R4                      ; 5132   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5134   0004 0114 0341

        PULR    R7                              ; 5137   02B7

L_5138:
        PSHR    R5                              ; 5138   0275
        MVI     G_0177, R0                      ; 5139   0280 0177
        MVO     R0,     G_0178                  ; 513B   0240 0178
        TSTR    R0                              ; 513D   0080
        BEQ     L_5142                          ; 513E   0204 0002
        BNEQ    L_5147                          ; 5140   020C 0005

L_5142:
        JSR     R5,     L_5157                  ; 5142   0004 0150 0157

        B       L_514A                          ; 5145   0200 0003

L_5147:
        JSR     R5,     L_518C                  ; 5147   0004 0150 018C
L_514A:
        JSR     R5,     L_5AC9                  ; 514A   0004 0158 02C9
        JSR     R5,     L_53EB                  ; 514D   0004 0150 03EB
        JSR     R5,     L_56F8                  ; 5150   0004 0154 02F8

        CLRR    R0                              ; 5153   01C0
        MVO     R0,     G_015D                  ; 5154   0240 015D
        PULR    R7                              ; 5156   02B7

L_5157:
        PSHR    R5                              ; 5157   0275
        MVI     G_017D, R1                      ; 5158   0281 017D
        ADDI    #$0179, R1                      ; 515A   02F9 0179
        MVI@    R1,     R0                      ; 515C   0288
        MVO     R0,     G_016B                  ; 515D   0240 016B

        JSR     R5,     L_584E                  ; 515F   0004 0158 004E

        MOVR    R1,     R4                      ; 5162   008C
        ADDI    #$0002, R4                      ; 5163   02FC 0002
        MVII    #$0171, R5                      ; 5165   02BD 0171
        SDBD                                    ; 5167   0001
        MVI@    R5,     R0                      ; 5168   02A8
        MVO@    R0,     R4                      ; 5169   0260
        SDBD                                    ; 516A   0001
        MVI@    R5,     R0                      ; 516B   02A8
        MVO@    R0,     R4                      ; 516C   0260
        INCR    R4                              ; 516D   000C
        CLRR    R0                              ; 516E   01C0
        MVO@    R0,     R4                      ; 516F   0260
        MVI@    R1,     R0                      ; 5170   0288
        PSHR    R3                              ; 5171   0273
        SDBD                                    ; 5172   0001
        MVII    #$1000, R3                      ; 5173   02BB 0000 0010
        COMR    R0                              ; 5176   0018
        COMR    R3                              ; 5177   001B
        ANDR    R3,     R0                      ; 5178   0198
        COMR    R0                              ; 5179   0018
        PULR    R3                              ; 517A   02B3
        MVO@    R0,     R1                      ; 517B   0248
        MVI     G_017D, R0                      ; 517C   0280 017D
        INCR    R0                              ; 517E   0008
        MVO     R0,     G_017D                  ; 517F   0240 017D
        CMP     G_0161, R0                      ; 5181   0340 0161
        BMI     L_518B                          ; 5183   020B 0006

        CLRR    R0                              ; 5185   01C0
        MVO     R0,     G_017D                  ; 5186   0240 017D
        INCR    R0                              ; 5188   0008
        MVO     R0,     G_0177                  ; 5189   0240 0177
L_518B:
        PULR    R7                              ; 518B   02B7

L_518C:
        PSHR    R5                              ; 518C   0275
        CLRR    R0                              ; 518D   01C0
        CLRR    R1                              ; 518E   01C9
        CLRR    R2                              ; 518F   01D2
        MVII    #$0339, R5                      ; 5190   02BD 0339
L_5192:
        ADDI    #$0004, R5                      ; 5192   02FD 0004
        MVI@    R5,     R3                      ; 5194   02AB
        ANDI    #$0008, R3                      ; 5195   03BB 0008
        BEQ     L_519D                          ; 5197   0204 0004

        ADDI    #$0003, R5                      ; 5199   02FD 0003
        B       L_51AB                          ; 519B   0200 000E

L_519D:
        ADDI    #$0001, R5                      ; 519D   02FD 0001
        MVI@    R5,     R3                      ; 519F   02AB
        MVI@    R5,     R4                      ; 51A0   02AC
        PSHR    R5                              ; 51A1   0275

        JSR     R5,     L_51B7                  ; 51A2   0004 0150 01B7

        PULR    R5                              ; 51A5   02B5
        CMPR    R3,     R2                      ; 51A6   015A
        BPL     L_51AB                          ; 51A7   0203 0002

        MOVR    R0,     R1                      ; 51A9   0081
        MOVR    R3,     R2                      ; 51AA   009A
L_51AB:
        ADDI    #$0002, R0                      ; 51AB   02F8 0002
        MVI     G_0161, R3                      ; 51AD   0283 0161
        SLL     R3,     1                       ; 51AF   004B
        CMPR    R3,     R0                      ; 51B0   0158
        BLT     L_5192                          ; 51B1   0225 0020

        SLR     R1,     1                       ; 51B3   0061
        MVO     R1,     G_016B                  ; 51B4   0241 016B
        PULR    R7                              ; 51B6   02B7

L_51B7:
        PSHR    R5                              ; 51B7   0275
        MVII    #$016D, R5                      ; 51B8   02BD 016D
        SDBD                                    ; 51BA   0001
        SUB@    R5,     R3                      ; 51BB   032B
        BPL     L_51BF                          ; 51BC   0203 0001

        NEGR    R3                              ; 51BE   0023
L_51BF:
        SDBD                                    ; 51BF   0001
        SUB@    R5,     R4                      ; 51C0   032C
        BPL     L_51C4                          ; 51C1   0203 0001

        NEGR    R4                              ; 51C3   0024
L_51C4:
        CMPR    R3,     R4                      ; 51C4   015C
        BPL     L_51CA                          ; 51C5   0203 0003

        PSHR    R4                              ; 51C7   0274
        MOVR    R3,     R4                      ; 51C8   009C
        PULR    R3                              ; 51C9   02B3
L_51CA:
        SLR     R3,     1                       ; 51CA   0063
        ADDR    R4,     R3                      ; 51CB   00E3
        BNOV    L_51D2                          ; 51CC   020A 0004

        SDBD                                    ; 51CE   0001
        MVII    #$7FFF, R3                      ; 51CF   02BB 00FF 007F
L_51D2:
        PULR    R7                              ; 51D2   02B7

        DECLE   $007F,  $0052,  $00ED,  $0051   ; 51D3   007F 0052 00ED 0051
        DECLE   $00BF,  $0052,  $00BB,  $0052   ; 51D7   00BF 0052 00BB 0052
        DECLE   $00B7,  $0052,  $0000,  $0000   ; 51DB   00B7 0052 0000 0000
        DECLE   $00E7,  $0051,  $0000,  $0000   ; 51DF   00E7 0051 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51E3   0000 0000 0000 0000

        PSHR    R5                              ; 51E7   0275
        CLRR    R1                              ; 51E8   01C9

        JSR     R5,     .EXEC.94C               ; 51E9   0004 0118 014C

        PULR    R7                              ; 51EC   02B7

        PSHR    R5                              ; 51ED   0275
        CMPI    #$000B, R0                      ; 51EE   0378 000B
        BEQ     L_524F                          ; 51F0   0204 005D

        MVI     G_015D, R1                      ; 51F2   0281 015D
        TSTR    R1                              ; 51F4   0089
        BNEQ    L_521D                          ; 51F5   020C 0026

        TSTR    R0                              ; 51F7   0080
        BEQ     L_521E                          ; 51F8   0204 0024

        CMPI    #$0001, R0                      ; 51FA   0378 0001
        BEQ     L_5246                          ; 51FC   0204 0048

        MVI     G_0183, R1                      ; 51FE   0281 0183
        CMPI    #$0004, R1                      ; 5200   0379 0004
        BNEQ    L_520D                          ; 5202   020C 0009

        CMPI    #$0009, R0                      ; 5204   0378 0009
        BEQ     L_520D                          ; 5206   0204 0005

        JSR     R5,     L_57EC                  ; 5208   0004 0154 03EC

        B       L_521D                          ; 520B   0200 0010

L_520D:
        MVO     R0,     G_015E                  ; 520D   0240 015E

        JSR     R5,     L_5AF6                  ; 520F   0004 0158 02F6

        MVII    #$0001, R0                      ; 5212   02B8 0001
        MVI     G_015E, R1                      ; 5214   0281 015E
        CMPI    #$000A, R1                      ; 5216   0379 000A
        BNEQ    L_521B                          ; 5218   020C 0001

        CLRR    R0                              ; 521A   01C0
L_521B:
        MVO     R0,     G_032A                  ; 521B   0240 032A
L_521D:
        PULR    R7                              ; 521D   02B7

L_521E:
        JSR     R5,     L_584E                  ; 521E   0004 0158 004E

        MVI@    R1,     R0                      ; 5221   0288
        SDBD                                    ; 5222   0001
        ANDI    #$4000, R0                      ; 5223   03B8 0000 0040
        BEQ     L_5245                          ; 5226   0204 001D

        MOVR    R1,     R4                      ; 5228   008C
        ADDI    #$0002, R4                      ; 5229   02FC 0002
        MVI@    R4,     R0                      ; 522B   02A0
        SWAP    R0,     1                       ; 522C   0040
        MVI@    R4,     R1                      ; 522D   02A1
        SWAP    R1,     1                       ; 522E   0041

        JSR     R5,     X_PACK_BYTES            ; 522F   0004 0114 034F

        ADDI    #$0003, R4                      ; 5232   02FC 0003
        MVI@    R4,     R1                      ; 5234   02A1
        DECR    R4                              ; 5235   0014
        MVO@    R0,     R4                      ; 5236   0260
        MVII    #$00FF, R0                      ; 5237   02B8 00FF
        SWAP    R0,     1                       ; 5239   0040
        ANDR    R1,     R0                      ; 523A   0188
        ANDI    #$00FF, R1                      ; 523B   03B9 00FF
        SWAP    R1,     1                       ; 523D   0041
        SUBI    #$0006, R4                      ; 523E   033C 0006
        MVO@    R0,     R4                      ; 5240   0260
        MVO@    R1,     R4                      ; 5241   0261

        JSR     R5,     L_53EB                  ; 5242   0004 0150 03EB

L_5245:
        PULR    R7                              ; 5245   02B7

L_5246:
        MVI     G_0178, R1                      ; 5246   0281 0178
        TSTR    R1                              ; 5248   0089
        BEQ     L_520D                          ; 5249   0224 003D

        JSR     R5,     L_57EC                  ; 524B   0004 0154 03EC

        PULR    R7                              ; 524E   02B7

L_524F:
        MVII    #$0004, R0                      ; 524F   02B8 0004
        MVO     R0,     G_016A                  ; 5251   0240 016A

        JSR     R5,     L_5AC9                  ; 5253   0004 0158 02C9

        SDBD                                    ; 5256   0001
        MVII    #$5028, R1                      ; 5257   02B9 0028 0050

        JSR     R5,     .EXEC.81E               ; 525A   0004 0118 001E

        PULR    R7                              ; 525D   02B7

L_525E:
        PSHR    R5                              ; 525E   0275
        MVII    #$011F, R4                      ; 525F   02BC 011F
L_5261:
        MVI@    R4,     R0                      ; 5261   02A0
        SWAP    R0,     1                       ; 5262   0040
        SLLC    R0,     2                       ; 5263   005C
        BNC     L_526D                          ; 5264   0209 0007
        BOV     L_526D                          ; 5266   0202 0005

        SWAP    R0,     1                       ; 5268   0040
        CMPI    #$002C, R0                      ; 5269   0378 002C
        BEQ     L_527E                          ; 526B   0204 0011

L_526D:
        CMPI    #$0121, R4                      ; 526D   037C 0121
        BNEQ    L_5261                          ; 526F   022C 000F

        CLRR    R0                              ; 5271   01C0
        MVO     R0,     G_016A                  ; 5272   0240 016A

        JSR     R5,     L_5AC9                  ; 5274   0004 0158 02C9

        SDBD                                    ; 5277   0001
        MVII    #$5028, R1                      ; 5278   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 527B   0004 0118 0038

L_527E:
        PULR    R7                              ; 527E   02B7

        PSHR    R5                              ; 527F   0275
        TSTR    R0                              ; 5280   0080
        BMI     L_52A6                          ; 5281   020B 0023

        MVI     G_015D, R1                      ; 5283   0281 015D
        TSTR    R1                              ; 5285   0089
        BNEQ    L_52A6                          ; 5286   020C 001E

        MVO     R0,     G_015F                  ; 5288   0240 015F
        MOVR    R0,     R4                      ; 528A   0084
        SDBD                                    ; 528B   0001
        ADDI    #$52A7, R4                      ; 528C   02FC 00A7 0052
        MVI@    R4,     R0                      ; 528F   02A0

        JSR     R5,     L_584E                  ; 5290   0004 0158 004E

        MOVR    R0,     R2                      ; 5293   0082
        ANDI    #$0007, R2                      ; 5294   03BA 0007
        MOVR    R1,     R3                      ; 5296   008B
        ADDI    #$0005, R3                      ; 5297   02FB 0005
        MVO@    R2,     R3                      ; 5299   025A
        MOVR    R0,     R2                      ; 529A   0082
        ANDI    #$0300, R2                      ; 529B   03BA 0300
        SLL     R2,     1                       ; 529D   004A
        MOVR    R1,     R4                      ; 529E   008C
        MVI@    R4,     R3                      ; 529F   02A3
        SDBD                                    ; 52A0   0001
        ANDI    #$F9FF, R3                      ; 52A1   03BB 00FF 00F9
        XORR    R2,     R3                      ; 52A4   01D3
        MVO@    R3,     R1                      ; 52A5   024B
L_52A6:
        PULR    R7                              ; 52A6   02B7

        DECLE   $0001,  $0002,  $0003,  $0004   ; 52A7   0001 0002 0003 0004
        DECLE   $0005                           ; 52AB   0005

        BEQ     L_54B1                          ; 52AC   0204 0203
        BOV     L_54B1                          ; 52AE   0202 0201

        SUB     G_0303, R2                      ; 52B0   0302 0303
        SUB     G_0105, R4                      ; 52B2   0304 0105
        SUBR    R0,     R4                      ; 52B4   0104
        SUBR    R0,     R3                      ; 52B5   0103
        SUBR    R0,     R2                      ; 52B6   0102
        MVII    #$0002, R1                      ; 52B7   02B9 0002
        B       L_52C0                          ; 52B9   0200 0005

        MVII    #$0001, R1                      ; 52BB   02B9 0001
        B       L_52C0                          ; 52BD   0200 0001

        CLRR    R1                              ; 52BF   01C9
L_52C0:
        PSHR    R5                              ; 52C0   0275
        NEGR    R0                              ; 52C1   0020
        BPL     L_52CE                          ; 52C2   0203 000A

        MVI     G_015D, R2                      ; 52C4   0282 015D
        TSTR    R2                              ; 52C6   0092
        BNEQ    L_52CF                          ; 52C7   020C 0006

        MVO     R1,     G_0160                  ; 52C9   0241 0160

        JSR     R5,     L_52F6                  ; 52CB   0004 0150 02F6

L_52CE:
        PULR    R7                              ; 52CE   02B7

L_52CF:
        MVI     G_017E, R0                      ; 52CF   0280 017E
        MVI     G_015E, R1                      ; 52D1   0281 015E
        CMPI    #$0009, R1                      ; 52D3   0379 0009
        BNEQ    L_52E7                          ; 52D5   020C 0010

        CMPI    #$0007, R0                      ; 52D7   0378 0007
        BMI     L_52F5                          ; 52D9   020B 001A

        JSR     R5,     X_CLAMP                 ; 52DB   0004 0114 0270
        DECLE   $0008,  $000F                   ; 52DE   0008 000F

        SUBI    #$000C, R0                      ; 52E0   0338 000C
        BGE     L_52F3                          ; 52E2   020D 000F

        INCR    R0                              ; 52E4   0008
        B       L_52F3                          ; 52E5   0200 000C

L_52E7:
        CMPI    #$000B, R0                      ; 52E7   0378 000B
        BMI     L_52F5                          ; 52E9   020B 000A

        JSR     R5,     X_CLAMP                 ; 52EB   0004 0114 0270

        DECR    R1                              ; 52EE   0011
        COMR    R4                              ; 52EF   001C
        SLR     R0,     1                       ; 52F0   0060
        SUBI    #$000B, R0                      ; 52F1   0338 000B
L_52F3:
        MVO     R0,     G_0182                  ; 52F3   0240 0182
L_52F5:
        PULR    R7                              ; 52F5   02B7

L_52F6:
        PSHR    R5                              ; 52F6   0275
        MVII    #$0007, R0                      ; 52F7   02B8 0007

        JSR     R5,     X_RAND2                 ; 52F9   0004 0114 029E

        SUBI    #$0003, R0                      ; 52FC   0338 0003
        MVO     R0,     G_0182                  ; 52FE   0240 0182
        MVI     G_015E, R0                      ; 5300   0280 015E
        CMPI    #$0009, R0                      ; 5302   0378 0009
        BMI     L_531C                          ; 5304   020B 0016
        BEQ     L_530C                          ; 5306   0204 0004

        JSR     R5,     L_57EC                  ; 5308   0004 0154 03EC

        PULR    R7                              ; 530B   02B7

L_530C:
        SDBD                                    ; 530C   0001
        MVII    #$00C1, R0                      ; 530D   02B8 00C1 0000
        MVO     R0,     G_017F                  ; 5310   0240 017F
        MVII    #$0054, R0                      ; 5312   02B8 0054
        MVO     R0,     G_0180                  ; 5314   0240 0180
        MVII    #$0002, R0                      ; 5316   02B8 0002
        MVO     R0,     G_032A                  ; 5318   0240 032A
        B       L_532A                          ; 531A   0200 000E

L_531C:
        SDBD                                    ; 531C   0001
        MVII    #$0080, R0                      ; 531D   02B8 0080 0000
        MVO     R0,     G_017F                  ; 5320   0240 017F
        MVII    #$0054, R0                      ; 5322   02B8 0054
        MVO     R0,     G_0180                  ; 5324   0240 0180
        MVII    #$0001, R0                      ; 5326   02B8 0001
        MVO     R0,     G_032A                  ; 5328   0240 032A
L_532A:
        MVII    #$0001, R0                      ; 532A   02B8 0001
        MVO     R0,     G_015D                  ; 532C   0240 015D

        JSR     R5,     L_584E                  ; 532E   0004 0158 004E

        MVI@    R1,     R0                      ; 5331   0288
        SDBD                                    ; 5332   0001
        ANDI    #$BFFF, R0                      ; 5333   03B8 00FF 00BF
        MVO@    R0,     R1                      ; 5336   0248

        JSR     R5,     L_5610                  ; 5337   0004 0154 0210

        CLRR    R0                              ; 533A   01C0
        MVO     R0,     G_017E                  ; 533B   0240 017E
        INCR    R0                              ; 533D   0008
        MVO     R0,     G_0323                  ; 533E   0240 0323
        PULR    R7                              ; 5340   02B7

L_5341:
        PSHR    R5                              ; 5341   0275

        JSR     R5,     L_5558                  ; 5342   0004 0154 0158

        MVI     G_015E, R0                      ; 5345   0280 015E
        CMPI    #$0009, R0                      ; 5347   0378 0009
        BEQ     L_535A                          ; 5349   0204 000F

        CLRR    R0                              ; 534B   01C0
        MVO     R0,     G_0334                  ; 534C   0240 0334
        SDBD                                    ; 534E   0001
        MVII    #$5020, R1                      ; 534F   02B9 0020 0050

        JSR     R5,     .EXEC.81E               ; 5352   0004 0118 001E
        JSR     R5,     L_57D4                  ; 5355   0004 0154 03D4

        B       L_5361                          ; 5358   0200 0007

L_535A:
        SDBD                                    ; 535A   0001
        MVII    #$5024, R1                      ; 535B   02B9 0024 0050

        JSR     R5,     .EXEC.81E               ; 535E   0004 0118 001E
L_5361:
        JSR     R5,     L_5368                  ; 5361   0004 0150 0368
        JSR     R5,     L_5AC9                  ; 5364   0004 0158 02C9

        PULR    R7                              ; 5367   02B7

L_5368:
        PSHR    R5                              ; 5368   0275
        MVI     G_016B, R1                      ; 5369   0281 016B
        ADDI    #$0162, R1                      ; 536B   02F9 0162
        MVI@    R1,     R0                      ; 536D   0288
        INCR    R0                              ; 536E   0008
        MVO@    R0,     R1                      ; 536F   0248
        ADDI    #$0004, R1                      ; 5370   02F9 0004
        MVI@    R1,     R0                      ; 5372   0288
        INCR    R0                              ; 5373   0008
        MVO@    R0,     R1                      ; 5374   0248
        PULR    R7                              ; 5375   02B7

L_5376:
        PSHR    R5                              ; 5376   0275
        MVI     G_0181, R1                      ; 5377   0281 0181
        MVI     G_0182, R0                      ; 5379   0280 0182

        JSR     R5,     X_EXT_SIGN_LO           ; 537B   0004 0114 0268

        BMI     L_5381                          ; 537E   020B 0001

        NEGR    R0                              ; 5380   0020

L_5381:
        JSR     R5,     X_MPY                   ; 5381   0004 011C 01DC

        SAR     R2,     2                       ; 5384   006E
        SAR     R2,     2                       ; 5385   006E
        MOVR    R2,     R0                      ; 5386   0090
        MVI     G_0182, R1                      ; 5387   0281 0182
        SWAP    R1,     2                       ; 5389   0045
        BMI     L_538D                          ; 538A   020B 0001

        NEGR    R0                              ; 538C   0020
L_538D:
        MVI     G_015F, R1                      ; 538D   0281 015F
        SUBI    #$0004, R1                      ; 538F   0339 0004

        JSR     R5,     .EXEC.629               ; 5391   0004 0114 0229

        ADD     G_0331, R0                      ; 5394   02C0 0331
        MVO     R0,     G_0331                  ; 5396   0240 0331
        PULR    R7                              ; 5398   02B7

L_5399:
        PSHR    R5                              ; 5399   0275

L_539A:
        JSR     R5,     L_53C9                  ; 539A   0004 0150 03C9
        JSR     R5,     .EXEC.A61               ; 539D   0004 0118 0261

        EIS                                     ; 53A0   0002
        MVI     G_0183, R0                      ; 53A1   0280 0183
        TSTR    R0                              ; 53A3   0080
        BNEQ    L_53BE                          ; 53A4   020C 0018

        JSR     R5,     L_57C4                  ; 53A6   0004 0154 03C4

        MVII    #$0002, R0                      ; 53A9   02B8 0002
L_53AB:
        MVO     R0,     G_0332                  ; 53AB   0240 0332

        JSR     R5,     .EXEC.A61               ; 53AD   0004 0118 0261

        EIS                                     ; 53B0   0002
        MVI     G_0332, R0                      ; 53B1   0280 0332
        INCR    R0                              ; 53B3   0008
        CMPI    #$0005, R0                      ; 53B4   0378 0005
        BMI     L_53AB                          ; 53B6   022B 000C

        CLRR    R0                              ; 53B8   01C0
        MVO     R0,     G_0332                  ; 53B9   0240 0332

        JSR     R5,     L_5695                  ; 53BB   0004 0154 0295
L_53BE:
        JSR     R5,     .EXEC.A61               ; 53BE   0004 0118 0261

        COMR    R6                              ; 53C1   001E

        JSR     R5,     L_540F                  ; 53C2   0004 0154 000F
        JSR     R5,     L_5138                  ; 53C5   0004 0150 0138

        PULR    R7                              ; 53C8   02B7

L_53C9:
        PSHR    R5                              ; 53C9   0275
        SDBD                                    ; 53CA   0001
        MVII    #$5020, R1                      ; 53CB   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 53CE   0004 0118 0038

        SDBD                                    ; 53D1   0001
        MVII    #$5024, R1                      ; 53D2   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 53D5   0004 0118 0038

        CLRR    R0                              ; 53D8   01C0
        MVO     R0,     G_017E                  ; 53D9   0240 017E

        JSR     R5,     L_542F                  ; 53DB   0004 0154 002F

        CLRR    R0                              ; 53DE   01C0
        MVO     R0,     G_0323                  ; 53DF   0240 0323
        MVO     R0,     G_032A                  ; 53E1   0240 032A
        NOP                                     ; 53E3   0034
        MVO     R0,     G_0331                  ; 53E4   0240 0331
        MVO     R0,     G_0334                  ; 53E6   0240 0334
        MVO     R0,     G_0332                  ; 53E8   0240 0332
        PULR    R7                              ; 53EA   02B7

L_53EB:
        PSHR    R5                              ; 53EB   0275

        JSR     R5,     L_584E                  ; 53EC   0004 0158 004E

        MOVR    R1,     R4                      ; 53EF   008C
        ADDI    #$0002, R4                      ; 53F0   02FC 0002
        MVI@    R4,     R2                      ; 53F2   02A2
        MVO     R2,     G_032F                  ; 53F3   0242 032F
        MVI@    R4,     R2                      ; 53F5   02A2
        MVO     R2,     G_0330                  ; 53F6   0242 0330
        MVI     G_032D, R0                      ; 53F8   0280 032D
        PSHR    R3                              ; 53FA   0273
        SDBD                                    ; 53FB   0001
        MVII    #$1000, R3                      ; 53FC   02BB 0000 0010
        COMR    R0                              ; 53FF   0018
        COMR    R3                              ; 5400   001B
        ANDR    R3,     R0                      ; 5401   0198
        COMR    R0                              ; 5402   0018
        PULR    R3                              ; 5403   02B3
        MVO     R0,     G_032D                  ; 5404   0240 032D
        ADDI    #$0005, R1                      ; 5406   02F9 0005
        MVII    #$0001, R2                      ; 5408   02BA 0001
        MVO@    R2,     R1                      ; 540A   024A
        CLRR    R0                              ; 540B   01C0
        MVO     R0,     G_015F                  ; 540C   0240 015F
        PULR    R7                              ; 540E   02B7

L_540F:
        PSHR    R5                              ; 540F   0275

        JSR     R5,     L_584E                  ; 5410   0004 0158 004E

        CLRR    R0                              ; 5413   01C0
        MOVR    R1,     R4                      ; 5414   008C
        ADDI    #$0005, R4                      ; 5415   02FC 0005
        MVO@    R0,     R4                      ; 5417   0260
        MVI@    R1,     R0                      ; 5418   0288
        SDBD                                    ; 5419   0001
        ANDI    #$F9FF, R0                      ; 541A   03B8 00FF 00F9
        MVO@    R0,     R1                      ; 541D   0248
        MOVR    R1,     R4                      ; 541E   008C
        ADDI    #$0002, R4                      ; 541F   02FC 0002
        MVI     G_032F, R0                      ; 5421   0280 032F
        MVO@    R0,     R4                      ; 5423   0260
        MVI     G_0330, R0                      ; 5424   0280 0330
        MVO@    R0,     R4                      ; 5426   0260
        MVI     G_016B, R0                      ; 5427   0280 016B
        ADDI    #$0004, R0                      ; 5429   02F8 0004

        JSR     R5,     .EXEC.41C               ; 542B   0004 0114 001C

        PULR    R7                              ; 542E   02B7

L_542F:
        PSHR    R5                              ; 542F   0275
L_5430:
        MVI     G_017E, R4                      ; 5430   0284 017E
        INCR    R4                              ; 5432   000C
        MVO     R4,     G_017E                  ; 5433   0244 017E
        ADDR    R4,     R4                      ; 5435   00E4
        MVII    #$017F, R5                      ; 5436   02BD 017F
        SDBD                                    ; 5438   0001
        ADD@    R5,     R4                      ; 5439   02EC
        MVI@    R4,     R0                      ; 543A   02A0
        CMPI    #$03FF, R0                      ; 543B   0378 03FF
        BEQ     L_5456                          ; 543D   0204 0017

        CMPI    #$03FE, R0                      ; 543F   0378 03FE
        BNEQ    L_5449                          ; 5441   020C 0006

        JSR     R5,     L_5341                  ; 5443   0004 0150 0341

        J       L_5430                          ; 5446   0004 0354 0030

L_5449:
        MOVR    R0,     R1                      ; 5449   0081
        AND     G_0160, R1                      ; 544A   0381 0160
        BNEQ    L_5430                          ; 544C   022C 001D

        JSR     R5,     L_545A                  ; 544E   0004 0154 005A

        CLRR    R0                              ; 5451   01C0

        JSR     R5,     .EXEC.41C               ; 5452   0004 0114 001C

        PULR    R7                              ; 5455   02B7

L_5456:
        JSR     R5,     L_5376                  ; 5456   0004 0150 0376

        PULR    R7                              ; 5459   02B7

L_545A:
        PSHR    R5                              ; 545A   0275
        MOVR    R0,     R1                      ; 545B   0081
        ANDI    #$0300, R1                      ; 545C   03B9 0300
        SLL     R1,     1                       ; 545E   0049
        MVI     G_031D, R2                      ; 545F   0282 031D
        SDBD                                    ; 5461   0001
        ANDI    #$F9FF, R2                      ; 5462   03BA 00FF 00F9
        XORR    R1,     R2                      ; 5465   01CA
        MVO     R2,     G_031D                  ; 5466   0242 031D
        MOVR    R0,     R1                      ; 5468   0081
        SLR     R1,     2                       ; 5469   0065
        ANDI    #$000F, R1                      ; 546A   03B9 000F
        MVO     R1,     G_0322                  ; 546C   0241 0322
        ANDI    #$00C0, R0                      ; 546E   03B8 00C0
        SLL     R0,     2                       ; 5470   004C
        SWAP    R0,     1                       ; 5471   0040
        MVO     R0,     G_0323                  ; 5472   0240 0323
        MVI@    R4,     R0                      ; 5474   02A0
        MOVR    R0,     R1                      ; 5475   0081
        ANDI    #$001F, R0                      ; 5476   03B8 001F
        SWAP    R0,     1                       ; 5478   0040
        MVO     R0,     G_031F                  ; 5479   0240 031F
        ANDI    #$03E0, R1                      ; 547B   03B9 03E0
        SLL     R1,     2                       ; 547D   004D
        SLL     R1,     1                       ; 547E   0049
        MVO     R1,     G_0320                  ; 547F   0241 0320
        PULR    R7                              ; 5481   02B7

        DECLE   $0080,  $02D4,  $0084,  $02CD   ; 5482   0080 02D4 0084 02CD
        DECLE   $0088,  $028B,  $008C,  $024A   ; 5486   0088 028B 008C 024A
        DECLE   $0090,  $01E9,  $028C,  $0189   ; 548A   0090 01E9 028C 0189
        DECLE   $0288,  $014A,  $0284,  $010C   ; 548E   0288 014A 0284 010C
        DECLE   $0280,  $00F0,  $0386,  $00F3   ; 5492   0280 00F0 0386 00F3
        DECLE   $038B,  $0114,  $0387           ; 5496   038B 0114 0387

        ADDR    R6,     R3                      ; 5499   00F3
        MVI     .PSG1.chn_a_lo,R2               ; 549A   0282 00F0
        MVO     R4,     G_010C                  ; 549C   0244 010C
        MVO@    R0,     R1                      ; 549E   0248
        CMPR    R1,     R2                      ; 549F   014A
        MVO@    R4,     R1                      ; 54A0   024C
        ANDR    R1,     R1                      ; 54A1   0189
        RLC     R0,     1                       ; 54A2   0050
        XORR    R5,     R1                      ; 54A3   01E9
        SLL     R0,     2                       ; 54A4   004C
        MVO@    R2,     R1                      ; 54A5   024A
        SLL     R0,     1                       ; 54A6   0048
        MVI@    R1,     R3                      ; 54A7   028B
        SWAP    R0,     2                       ; 54A8   0044
        ADD@    R1,     R5                      ; 54A9   02CD
        SWAP    R0,     1                       ; 54AA   0040
        ADD@    R2,     R4                      ; 54AB   02D4
        XORI    #$0000, R6                      ; 54AC   03FE 0000
        CMPR    R0,     R4                      ; 54AE   0144
        ADD@    R3,     R3                      ; 54AF   02DB
        CMPR    R1,     R0                      ; 54B0   0148
L_54B1:
        MVI@    R3,     R5                      ; 54B1   029D
        DECLE   $014C,  $025F,  $0150,  $01FF   ; 54B2   014C 025F 0150 01FF
        DECLE   $034C,  $019F,  $0348,  $015E   ; 54B6   034C 019F 0348 015E
        DECLE   $0344,  $011C,  $0240,  $00F7   ; 54BA   0344 011C 0240 00F7
        DECLE   $0246,  $00F5,  $024B,  $0114   ; 54BE   0246 00F5 024B 0114
        DECLE   $03FF                           ; 54C2   03FF

        TSTR    R0                              ; 54C3   0080
        ADD@    R2,     R4                      ; 54C4   02D4
        MOVR    R2,     R4                      ; 54C5   0094
        ADD@    R2,     R3                      ; 54C6   02D3
        MOVR    R3,     R0                      ; 54C7   0098
        ADD@    R2,     R1                      ; 54C8   02D1
        MOVR    R3,     R4                      ; 54C9   009C
        ADD@    R2,     R0                      ; 54CA   02D0
        MOVR    R4,     R2                      ; 54CB   00A2
        ADD@    R1,     R6                      ; 54CC   02CE
        MOVR    R0,     R7                      ; 54CD   0087

        ADD@    R1,     R5                      ; 54CE   02CD
        MOVR    R4,     R3                      ; 54CF   00A3
        ADD@    R1,     R6                      ; 54D0   02CE
        MOVR    R3,     R6                      ; 54D1   009E
        ADD@    R2,     R0                      ; 54D2   02D0
        MOVR    R3,     R0                      ; 54D3   0098
        ADD@    R2,     R1                      ; 54D4   02D1
        MOVR    R2,     R4                      ; 54D5   0094
        ADD@    R2,     R3                      ; 54D6   02D3
        TSTR    R0                              ; 54D7   0080
        ADD@    R2,     R4                      ; 54D8   02D4
        XORI    #$0000, R6                      ; 54D9   03FE 0000
        ANDR    R2,     R4                      ; 54DB   0194
        ADD@    R2,     R5                      ; 54DC   02D5
        ANDR    R3,     R0                      ; 54DD   0198
        ADD@    R2,     R7                      ; 54DE   02D7

        DECLE   $019C,  $02D8,  $01A2,  $02DA   ; 54DF   019C 02D8 01A2 02DA
        DECLE   $0187,  $02DB,  $03FF           ; 54E3   0187 02DB 03FF
L_54E6:
        PSHR    R5                              ; 54E6   0275
        MVI     G_032C, R0                      ; 54E7   0280 032C
        BMI     L_54EF                          ; 54E9   020B 0004

        SUBI    #$0020, R0                      ; 54EB   0338 0020
        B       L_54F1                          ; 54ED   0200 0002

L_54EF:
        SUBI    #$0080, R0                      ; 54EF   0338 0080
L_54F1:
        MVO     R0,     G_032C                  ; 54F1   0240 032C
        ADD     G_0334, R0                      ; 54F3   02C0 0334
        MVO     R0,     G_0334                  ; 54F5   0240 0334
        BMI     L_550A                          ; 54F7   020B 0011

        SDBD                                    ; 54F9   0001
        CMPI    #$2710, R0                      ; 54FA   0378 0010 0027
        BMI     L_5505                          ; 54FD   020B 0006

        MVII    #$0001, R0                      ; 54FF   02B8 0001
        MVO     R0,     G_0332                  ; 5501   0240 0332
        B       L_5512                          ; 5503   0200 000D

L_5505:
        CLRR    R0                              ; 5505   01C0
        MVO     R0,     G_0332                  ; 5506   0240 0332
        B       L_5512                          ; 5508   0200 0008

L_550A:
        JSR     R5,     L_56CF                  ; 550A   0004 0154 02CF

        BC      L_5512                          ; 550D   0201 0003

        JSR     R5,     L_5399                  ; 550F   0004 0150 0399

L_5512:
        PULR    R7                              ; 5512   02B7

        PSHR    R5                              ; 5513   0275

        JSR     R5,     L_553B                  ; 5514   0004 0154 013B

        MVI     G_010F, R1                      ; 5517   0281 010F
        ANDI    #$0004, R1                      ; 5519   03B9 0004
        BEQ     L_5521                          ; 551B   0204 0004

        ANDI    #$0007, R0                      ; 551D   03B8 0007
        B       L_5525                          ; 551F   0200 0004

L_5521:
        SWAP    R0,     1                       ; 5521   0040
        SLR     R0,     1                       ; 5522   0060
        ANDI    #$0003, R0                      ; 5523   03B8 0003
L_5525:
        DECR    R0                              ; 5525   0010
        MVI     G_0183, R1                      ; 5526   0281 0183
        MVO     R0,     G_0183                  ; 5528   0240 0183
        MVO     R1,     G_0184                  ; 552A   0241 0184

        JSR     R5,     L_5622                  ; 552C   0004 0154 0222
        JSR     R5,     L_567E                  ; 552F   0004 0154 027E

        MVII    #$0001, R0                      ; 5532   02B8 0001
        MVO     R0,     G_0333                  ; 5534   0240 0333
        MVII    #$0003, R0                      ; 5536   02B8 0003
        MVO     R0,     G_0102                  ; 5538   0240 0102
        PULR    R7                              ; 553A   02B7

L_553B:
        PSHR    R5                              ; 553B   0275
        MVI     G_031A, R0                      ; 553C   0280 031A
        MVI     G_0319, R3                      ; 553E   0283 0319
        SWAP    R0,     1                       ; 5540   0040
        SWAP    R3,     1                       ; 5541   0043
        ANDI    #$00FF, R0                      ; 5542   03B8 00FF
        ANDI    #$00FF, R3                      ; 5544   03BB 00FF
        SUBI    #$0004, R0                      ; 5546   0338 0004
        SUBI    #$0004, R3                      ; 5548   033B 0004
        SLR     R0,     2                       ; 554A   0064
        SLR     R0,     1                       ; 554B   0060
        SLR     R3,     2                       ; 554C   0067
        SLR     R3,     1                       ; 554D   0063
        MVII    #$0014, R1                      ; 554E   02B9 0014

        JSR     R5,     X_MPY                   ; 5550   0004 011C 01DC

        ADDR    R2,     R3                      ; 5553   00D3
        ADDI    #$0200, R3                      ; 5554   02FB 0200
        MVI@    R3,     R0                      ; 5556   0298
        PULR    R7                              ; 5557   02B7

L_5558:
        PSHR    R5                              ; 5558   0275
        MVI     G_015E, R4                      ; 5559   0284 015E
        MVI     G_0183, R0                      ; 555B   0280 0183
        CMPI    #$0001, R0                      ; 555D   0378 0001
        BEQ     L_556F                          ; 555F   0204 000E

        CMPI    #$0005, R0                      ; 5561   0378 0005
        BEQ     L_556A                          ; 5563   0204 0005

        JSR     R5,     L_55AB                  ; 5565   0004 0154 01AB

        B       L_5572                          ; 5568   0200 0008

L_556A:
        JSR     R5,     L_5587                  ; 556A   0004 0154 0187

        B       L_5572                          ; 556D   0200 0003

L_556F:
        JSR     R5,     L_5582                  ; 556F   0004 0154 0182

L_5572:
        MVO     R0,     G_032C                  ; 5572   0240 032C
        MVO     R1,     G_0181                  ; 5574   0241 0181
        MOVR    R1,     R0                      ; 5576   0088
        MVI     G_015F, R1                      ; 5577   0281 015F

        JSR     R5,     .EXEC.629               ; 5579   0004 0114 0229
        JSR     R5,     L_55F4                  ; 557C   0004 0154 01F4

        MVO     R0,     G_0331                  ; 557F   0240 0331
        PULR    R7                              ; 5581   02B7

L_5582:
        PSHR    R5                              ; 5582   0275

        JSR     R5,     L_55C8                  ; 5583   0004 0154 01C8

        PULR    R7                              ; 5586   02B7

L_5587:
        PSHR    R5                              ; 5587   0275
        CMPI    #$0004, R4                      ; 5588   037C 0004
        BMI     L_55A6                          ; 558A   020B 001A

        CMPI    #$0008, R4                      ; 558C   037C 0008
        BMI     L_559E                          ; 558E   020B 000E
        BEQ     L_5597                          ; 5590   0204 0005

        JSR     R5,     L_55C8                  ; 5592   0004 0154 01C8

        B       L_55AA                          ; 5595   0200 0013

L_5597:
        JSR     R5,     L_55C8                  ; 5597   0004 0154 01C8

        SUBI    #$0002, R1                      ; 559A   0339 0002
        B       L_55AA                          ; 559C   0200 000C

L_559E:
        JSR     R5,     L_55C8                  ; 559E   0004 0154 01C8
        JSR     R5,     X_RAND2                 ; 55A1   0004 0114 029E

        B       L_55AA                          ; 55A4   0200 0004

L_55A6:
        MVII    #$0024, R0                      ; 55A6   02B8 0024
        MVII    #$0024, R1                      ; 55A8   02B9 0024
L_55AA:
        PULR    R7                              ; 55AA   02B7

L_55AB:
        PSHR    R5                              ; 55AB   0275
        CMPI    #$0004, R4                      ; 55AC   037C 0004
        BMI     L_55C1                          ; 55AE   020B 0011

        CMPI    #$0008, R4                      ; 55B0   037C 0008
        BMI     L_55BB                          ; 55B2   020B 0007

        JSR     R5,     L_55C8                  ; 55B4   0004 0154 01C8

        SUBI    #$0002, R1                      ; 55B7   0339 0002
        B       L_55C7                          ; 55B9   0200 000C

L_55BB:
        INCR    R4                              ; 55BB   000C

        JSR     R5,     L_55C8                  ; 55BC   0004 0154 01C8

        B       L_55C7                          ; 55BF   0200 0006

L_55C1:
        JSR     R5,     L_55C8                  ; 55C1   0004 0154 01C8
        JSR     R5,     X_RAND2                 ; 55C4   0004 0114 029E

L_55C7:
        PULR    R7                              ; 55C7   02B7

L_55C8:
        PSHR    R5                              ; 55C8   0275
        ADDR    R4,     R4                      ; 55C9   00E4
        SDBD                                    ; 55CA   0001
        ADDI    #$55E0, R4                      ; 55CB   02FC 00E0 0055
        MVI@    R4,     R0                      ; 55CE   02A0
        MVI@    R4,     R1                      ; 55CF   02A1
        MVII    #$007F, R3                      ; 55D0   02BB 007F
        MOVR    R1,     R2                      ; 55D2   008A
        ANDR    R3,     R1                      ; 55D3   0199
        COMR    R3                              ; 55D4   001B
        ANDR    R3,     R2                      ; 55D5   019A
        SLL     R2,     1                       ; 55D6   004A
        SWAP    R2,     1                       ; 55D7   0042
        MVI     G_0160, R3                      ; 55D8   0283 0160
        TSTR    R3                              ; 55DA   009B
L_55DB:
        BEQ     L_55E1                          ; 55DB   0204 0004

        SUBR    R2,     R1                      ; 55DD   0111
        DECR    R3                              ; 55DE   0013
        B       L_55DB                          ; 55DF   0220 0005
L_55E1:
        PULR    R7                              ; 55E1   02B7

        ADD@    R6,     R0                      ; 55E2   02F0
        SUBR    R4,     R5                      ; 55E3   0125
        CMP@    R1,     R4                      ; 55E4   034C
        MOVR    R3,     R4                      ; 55E5   009C
        AND@    R4,     R0                      ; 55E6   03A0
        MOVR    R2,     R7                      ; 55E7   0097

        SUB@    R6,     R4                      ; 55E8   0334
        MOVR    R2,     R7                      ; 55E9   0097

        DECLE   $034C,  $0094,  $03BC,  $008F   ; 55EA   034C 0094 03BC 008F
        DECLE   $03F4,  $008C,  $03FC,  $0109   ; 55EE   03F4 008C 03FC 0109
        DECLE   $0000                           ; 55F2   0000

        MVI@    R2,     R0                      ; 55F3   0290
L_55F4:
        PSHR    R5                              ; 55F4   0275

        JSR     R5,     X_UNPK_BYTES            ; 55F5   0004 0114 0357

        MOVR    R0,     R2                      ; 55F8   0082
        SLL     R2,     2                       ; 55F9   004E
        ADDR    R0,     R2                      ; 55FA   00C2
        SAR     R2,     2                       ; 55FB   006E
        MVII    #$0002, R0                      ; 55FC   02B8 0002

        JSR     R5,     X_RAND1                 ; 55FE   0004 0114 027D

        SUBI    #$0002, R0                      ; 5601   0338 0002
        ADDR    R0,     R1                      ; 5603   00C1
        MVII    #$0002, R0                      ; 5604   02B8 0002

        JSR     R5,     X_RAND1                 ; 5606   0004 0114 027D

        SUBI    #$0002, R0                      ; 5609   0338 0002
        ADDR    R2,     R0                      ; 560B   00D0

        JSR     R5,     X_PACK_BYTES            ; 560C   0004 0114 034F

        PULR    R7                              ; 560F   02B7

L_5610:
        PSHR    R5                              ; 5610   0275

        JSR     R5,     L_584E                  ; 5611   0004 0158 004E

        MOVR    R1,     R4                      ; 5614   008C
        ADDI    #$0002, R4                      ; 5615   02FC 0002
        MVI@    R4,     R0                      ; 5617   02A0
        SWAP    R0,     1                       ; 5618   0040
        MVI@    R4,     R1                      ; 5619   02A1
        SWAP    R1,     1                       ; 561A   0041

        JSR     R5,     X_PACK_BYTES            ; 561B   0004 0114 034F

        ADDI    #$0003, R4                      ; 561E   02FC 0003
        MVO@    R0,     R4                      ; 5620   0260
        PULR    R7                              ; 5621   02B7

L_5622:
        PSHR    R5                              ; 5622   0275
        MVI     G_0183, R0                      ; 5623   0280 0183
        TSTR    R0                              ; 5625   0080
        BEQ     L_5631                          ; 5626   0204 0009

        CMPI    #$0003, R0                      ; 5628   0378 0003
        BNEQ    L_5638                          ; 562A   020C 000C

        JSR     R5,     L_5639                  ; 562C   0004 0154 0239

        B       L_5638                          ; 562F   0200 0007

L_5631:
        CMP     G_0184, R0                      ; 5631   0340 0184
        BEQ     L_5638                          ; 5633   0204 0003

        JSR     R5,     L_568A                  ; 5635   0004 0154 028A

L_5638:
        PULR    R7                              ; 5638   02B7

L_5639:
        PSHR    R5                              ; 5639   0275
        MVI     G_0334, R0                      ; 563A   0280 0334
        SDBD                                    ; 563C   0001
        CMPI    #$2710, R0                      ; 563D   0378 0010 0027
        BPL     L_567D                          ; 5640   0203 003B

        SDBD                                    ; 5642   0001
        CMPI    #$0D05, R0                      ; 5643   0378 0005 000D
        BMI     L_567D                          ; 5646   020B 0035

        MVII    #$0001, R0                      ; 5648   02B8 0001

        JSR     R5,     X_RAND1                 ; 564A   0004 0114 027D

        TSTR    R0                              ; 564D   0080
        BEQ     L_567D                          ; 564E   0204 002D

        MVII    #$0003, R0                      ; 5650   02B8 0003

        JSR     R5,     X_RAND1                 ; 5652   0004 0114 027D

        ADDI    #$0004, R0                      ; 5655   02F8 0004
        ADD     G_015F, R0                      ; 5657   02C0 015F
        MOVR    R0,     R4                      ; 5659   0084
        MVI     G_0331, R0                      ; 565A   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 565C   0004 0114 0357

        TSTR    R0                              ; 565F   0080
        BPL     L_5663                          ; 5660   0203 0001

        NEGR    R0                              ; 5662   0020
L_5663:
        TSTR    R1                              ; 5663   0089
        BPL     L_5667                          ; 5664   0203 0001

        NEGR    R1                              ; 5666   0021
L_5667:
        ADDR    R1,     R0                      ; 5667   00C8
        SAR     R0,     2                       ; 5668   006C
        MOVR    R4,     R1                      ; 5669   00A1

        JSR     R5,     .EXEC.629               ; 566A   0004 0114 0229

        MVO     R0,     G_0331                  ; 566D   0240 0331
        MVI     G_032C, R0                      ; 566F   0280 032C

        JSR     R5,     X_EXT_SIGN_LO           ; 5671   0004 0114 0268

        TSTR    R0                              ; 5674   0080
        BMI     L_567D                          ; 5675   020B 0006

        CLRR    R0                              ; 5677   01C0
        MVO     R0,     G_032C                  ; 5678   0240 032C

        JSR     R5,     L_57E7                  ; 567A   0004 0154 03E7

L_567D:
        PULR    R7                              ; 567D   02B7

L_567E:
        PSHR    R5                              ; 567E   0275
        MVI     G_0319, R0                      ; 567F   0280 0319
        SWAP    R0,     1                       ; 5681   0040
        MVO     R0,     G_0185                  ; 5682   0240 0185
        MVI     G_031A, R0                      ; 5684   0280 031A
        SWAP    R0,     1                       ; 5686   0040
        MVO     R0,     G_0186                  ; 5687   0240 0186
        PULR    R7                              ; 5689   02B7

L_568A:
        PSHR    R5                              ; 568A   0275
        MVI     G_0185, R0                      ; 568B   0280 0185
        MVI     G_0186, R1                      ; 568D   0281 0186

        JSR     R5,     X_PACK_BYTES            ; 568F   0004 0114 034F

        MVO     R0,     G_033C                  ; 5692   0240 033C
        PULR    R7                              ; 5694   02B7

L_5695:
        PSHR    R5                              ; 5695   0275

        JSR     R5,     L_584E                  ; 5696   0004 0158 004E

        MVI@    R1,     R0                      ; 5699   0288
        PSHR    R3                              ; 569A   0273
        SDBD                                    ; 569B   0001
        MVII    #$4000, R3                      ; 569C   02BB 0000 0040
        COMR    R0                              ; 569F   0018
        COMR    R3                              ; 56A0   001B
        ANDR    R3,     R0                      ; 56A1   0198
        COMR    R0                              ; 56A2   0018
        PULR    R3                              ; 56A3   02B3
        MVO@    R0,     R1                      ; 56A4   0248
        MVI     G_033C, R0                      ; 56A5   0280 033C

        JSR     R5,     X_UNPK_BYTES            ; 56A7   0004 0114 0357

        SWAP    R0,     1                       ; 56AA   0040
        SWAP    R1,     1                       ; 56AB   0041
        MVO     R0,     G_032F                  ; 56AC   0240 032F
        MVO     R1,     G_0330                  ; 56AE   0241 0330

        JSR     R5,     L_5368                  ; 56B0   0004 0150 0368
        JSR     R5,     L_5AC9                  ; 56B3   0004 0158 02C9

        PULR    R7                              ; 56B6   02B7

L_56B7:
        PSHR    R5                              ; 56B7   0275
        MVI     G_0331, R0                      ; 56B8   0280 0331
        BEQ     L_56CE                          ; 56BA   0204 0012

        JSR     R5,     L_53C9                  ; 56BC   0004 0150 03C9
        JSR     R5,     L_5368                  ; 56BF   0004 0150 0368
        JSR     R5,     L_5AC9                  ; 56C2   0004 0158 02C9
        JSR     R5,     L_56E7                  ; 56C5   0004 0154 02E7

        CLRR    R0                              ; 56C8   01C0
        MVO     R0,     G_015D                  ; 56C9   0240 015D

        JSR     R5,     L_57EC                  ; 56CB   0004 0154 03EC

L_56CE:
        PULR    R7                              ; 56CE   02B7

L_56CF:
        PSHR    R5                              ; 56CF   0275
        MVI     G_0330, R0                      ; 56D0   0280 0330
        SDBD                                    ; 56D2   0001
        CMPI    #$2000, R0                      ; 56D3   0378 0000 0020
        CLRC                                    ; 56D6   0006
        BPL     L_56E6                          ; 56D7   0203 000D

        MVI     G_032F, R0                      ; 56D9   0280 032F
        SDBD                                    ; 56DB   0001
        CMPI    #$2800, R0                      ; 56DC   0378 0000 0028
        CLRC                                    ; 56DF   0006
        BPL     L_56E6                          ; 56E0   0203 0004

        JSR     R5,     L_56B7                  ; 56E2   0004 0154 02B7

        SETC                                    ; 56E5   0007
L_56E6:
        PULR    R7                              ; 56E6   02B7

L_56E7:
        PSHR    R5                              ; 56E7   0275

        JSR     R5,     L_584E                  ; 56E8   0004 0158 004E

        ADDI    #$0007, R1                      ; 56EB   02F9 0007
        MVI@    R1,     R0                      ; 56ED   0288

        JSR     R5,     X_UNPK_BYTES            ; 56EE   0004 0114 0357

        SWAP    R0,     1                       ; 56F1   0040
        SWAP    R1,     1                       ; 56F2   0041
        MVO     R0,     G_032F                  ; 56F3   0240 032F
        MVO     R1,     G_0330                  ; 56F5   0241 0330
        PULR    R7                              ; 56F7   02B7

L_56F8:
        PSHR    R5                              ; 56F8   0275
        MVII    #$000A, R0                      ; 56F9   02B8 000A
        MVO     R0,     G_015E                  ; 56FB   0240 015E

        JSR     R5,     .EXEC.A61               ; 56FD   0004 0118 0261

        DIS                                     ; 5700   0003
        MVI     G_0183, R2                      ; 5701   0282 0183
        CMPI    #$0004, R2                      ; 5703   037A 0004
        BNEQ    L_570D                          ; 5705   020C 0006

        MVII    #$0001, R1                      ; 5707   02B9 0001
        MVII    #$0009, R0                      ; 5709   02B8 0009
        B       L_5710                          ; 570B   0200 0003

L_570D:
        CLRR    R1                              ; 570D   01C9
        MVII    #$000A, R0                      ; 570E   02B8 000A
L_5710:
        MVO     R0,     G_015E                  ; 5710   0240 015E
        MVO     R1,     G_032A                  ; 5712   0241 032A

        JSR     R5,     L_5AF6                  ; 5714   0004 0158 02F6

        PULR    R7                              ; 5717   02B7

L_5718:
        PSHR    R5                              ; 5718   0275
        MVI     G_0331, R0                      ; 5719   0280 0331

        JSR     R5,     X_UNPK_BYTES            ; 571B   0004 0114 0357

        MVI     G_0183, R2                      ; 571E   0282 0183
        TSTR    R2                              ; 5720   0092
        BEQ     L_5735                          ; 5721   0204 0012

        CMPI    #$0004, R2                      ; 5723   037A 0004
        BEQ     L_572B                          ; 5725   0204 0004

        SAR     R0,     1                       ; 5727   0068
        SAR     R1,     1                       ; 5728   0069
        B       L_5738                          ; 5729   0200 000D

L_572B:
        MOVR    R0,     R2                      ; 572B   0082
        MOVR    R1,     R3                      ; 572C   008B
        SLL     R2,     1                       ; 572D   004A
        SLL     R3,     1                       ; 572E   004B
        ADDR    R2,     R0                      ; 572F   00D0
        ADDR    R3,     R1                      ; 5730   00D9
        SAR     R0,     2                       ; 5731   006C
        SAR     R1,     2                       ; 5732   006D
        B       L_5738                          ; 5733   0200 0003
L_5735:
        J       L_539A                          ; 5735   0004 0350 039A

L_5738:
        MOVR    R0,     R2                      ; 5738   0082
        ADDI    #$0003, R2                      ; 5739   02FA 0003
        SLR     R2,     2                       ; 573B   0066
        SLL     R2,     2                       ; 573C   004E
        BNEQ    L_574E                          ; 573D   020C 000F

        MOVR    R1,     R2                      ; 573F   008A
        ADDI    #$0003, R2                      ; 5740   02FA 0003
        SLR     R2,     2                       ; 5742   0066
        SLL     R2,     2                       ; 5743   004E
        BNEQ    L_574E                          ; 5744   020C 0008

        JSR     R5,     L_56CF                  ; 5746   0004 0154 02CF

        BC      L_5753                          ; 5749   0201 0008
        J       L_539A                          ; 574B   0004 0350 039A

L_574E:
        JSR     R5,     X_PACK_BYTES            ; 574E   0004 0114 034F

        MVO     R0,     G_0331                  ; 5751   0240 0331
L_5753:
        PULR    R7                              ; 5753   02B7

        PSHR    R5                              ; 5754   0275

        JSR     R5,     L_584E                  ; 5755   0004 0158 004E

        MVI@    R1,     R0                      ; 5758   0288
        ANDI    #$0008, R0                      ; 5759   03B8 0008
        BNEQ    L_57AE                          ; 575B   020C 0051

        MVI     G_0334, R0                      ; 575D   0280 0334
        TSTR    R0                              ; 575F   0080
        BNEQ    L_57AE                          ; 5760   020C 004C

        SDBD                                    ; 5762   0001
        MVII    #$F800, R0                      ; 5763   02B8 0000 00F8
        MVO     R0,     G_032F                  ; 5766   0240 032F
        MVI@    R1,     R0                      ; 5768   0288
        XORI    #$0008, R0                      ; 5769   03F8 0008
        MVO@    R0,     R1                      ; 576B   0248
        SDBD                                    ; 576C   0001
        MVII    #$57AE, R2                      ; 576D   02BA 00AE 0057
        ADD     G_016C, R2                      ; 5770   02C2 016C
        MVII    #$0162, R3                      ; 5772   02BB 0162
        ADD     G_016B, R3                      ; 5774   02C3 016B
        MVI@    R3,     R3                      ; 5776   029B
        CMP@    R2,     R3                      ; 5777   0353
        BGT     L_578A                          ; 5778   020E 0010
        BEQ     L_5783                          ; 577A   0204 0007

        MVII    #$0006, R0                      ; 577C   02B8 0006

        JSR     R5,     X_PLAY_CHEER1           ; 577E   0004 011C 02D5

        B       L_578D                          ; 5781   0200 000A

L_5783:
        MVII    #$0003, R0                      ; 5783   02B8 0003

        JSR     R5,     X_PLAY_CHEER1           ; 5785   0004 011C 02D5

        B       L_578D                          ; 5788   0200 0003

L_578A:
        JSR     R5,     L_57B8                  ; 578A   0004 0154 03B8

L_578D:
        CLRR    R0                              ; 578D   01C0
        MVII    #$033D, R1                      ; 578E   02B9 033D
L_5790:
        MVI@    R1,     R2                      ; 5790   028A
        ANDI    #$0008, R2                      ; 5791   03BA 0008
        BEQ     L_57AB                          ; 5793   0204 0016

        ADDI    #$0008, R1                      ; 5795   02F9 0008
        INCR    R0                              ; 5797   0008
        CMP     G_0161, R0                      ; 5798   0340 0161
        BLT     L_5790                          ; 579A   0225 000B

        JSR     R5,     L_5399                  ; 579C   0004 0150 0399
        JSR     R5,     .EXEC.A61               ; 579F   0004 0118 0261

        RSWD    R4                              ; 57A2   003C

        JSR     R5,     L_540F                  ; 57A3   0004 0154 000F
        JSR     R5,     L_50AC                  ; 57A6   0004 0150 00AC

        B       L_57AE                          ; 57A9   0200 0003

L_57AB:
        JSR     R5,     L_5399                  ; 57AB   0004 0150 0399

L_57AE:
        PULR    R7                              ; 57AE   02B7

        DECLE   $0003,  $0004,  $0005,  $0005   ; 57AF   0003 0004 0005 0005
        DECLE   $0004,  $0004,  $0003,  $0005   ; 57B3   0004 0004 0003 0005
        DECLE   $0005                           ; 57B7   0005
L_57B8:
        PSHR    R5                              ; 57B8   0275

        JSR     R5,     X_PLAY_SFX2             ; 57B9   0004 0118 03BE
        DECLE   $000A                           ; 57BC  SFX prio
        DECLE   $0009                           ; 57BD  SFX data
        DECLE   $0040,  $0100                   ; 57BE  SFX data
        DECLE   $000C,  $0100                   ; 57C0  SFX data
        DECLE   $000B                           ; 57C2  SFX data
        DECLE   $03CF                           ; 57C3  SFX end

L_57C4:
        PSHR    R5                              ; 57C4   0275

        JSR     R5,     X_PLAY_SFX1             ; 57C5   0004 0118 03BB
        DECLE   $03C9                           ; 57C8  SFX data
        DECLE   $0050,  $0000                   ; 57C9  SFX data
        DECLE   $0058,  $0040                   ; 57CB  SFX data
        DECLE   $0001,  $0343                   ; 57CD  SFX data
        DECLE   $000C,  $00E0                   ; 57CF  SFX data
        DECLE   $038B                           ; 57D1  SFX data
        DECLE   $03EB                           ; 57D2  SFX data
        DECLE   $02CF                           ; 57D3  SFX end

L_57D4:
        PSHR    R5                              ; 57D4   0275

        JSR     R5,     X_PLAY_SFX1             ; 57D5   0004 0118 03BB
        DECLE   $0079                           ; 57D8  SFX data
        DECLE   $010D                           ; 57D9  SFX data
        DECLE   $0035                           ; 57DA  SFX data
        DECLE   $006E                           ; 57DB  SFX data
        DECLE   $02EB                           ; 57DC  SFX data
        DECLE   $03AE                           ; 57DD  SFX data
        DECLE   $02EB                           ; 57DE  SFX data
        DECLE   $02CF                           ; 57DF  SFX end


        PSHR    R5                              ; 57E0   0275
        MVII    #$0003, R0                      ; 57E1   02B8 0003

        JSR     R5,     X_PLAY_CHEER1           ; 57E3   0004 011C 02D5

        PULR    R7                              ; 57E6   02B7

L_57E7:
        PSHR    R5                              ; 57E7   0275

        JSR     R5,     L_57B8                  ; 57E8   0004 0154 03B8

        PULR    R7                              ; 57EB   02B7

L_57EC:
        PSHR    R5                              ; 57EC   0275
        MVII    #$0003, R0                      ; 57ED   02B8 0003

        JSR     R5,     X_PLAY_SFX1             ; 57EF   0004 0118 03BB
        DECLE   $0044,  $0030                   ; 57F2  SFX data
        DECLE   $000C,  $0033                   ; 57F4  SFX data
        DECLE   $03B9                           ; 57F6  SFX data
        DECLE   $020B                           ; 57F7  SFX data
        DECLE   $00C3,  $03F8                   ; 57F8  SFX data
        DECLE   $02CF                           ; 57FA  SFX end

.GRAM_INIT_57FB:
        DECLE   $0027           ; 57FB  # of GRAM cards to init
        DECLE   $00BF,  $0030   ; 57FC  #00-00:  GROM #5F-5F --I-
        DECLE   $0073,  $0030   ; 57FE  #01-01:  GROM #79-79 ----
        DECLE   $005B,  $0030   ; 5800  #02-02:  GROM #6D-6D ----
        DECLE   $000B,  $0050   ; 5802  #03-03:  GROM #05-05 ----
        DECLE   $006B,  $0030   ; 5804  #04-04:  GROM #75-75 ----
        DECLE   $0063,  $0030   ; 5806  #05-05:  GROM #71-71 ----
        DECLE   $0003,  $0050   ; 5808  #06-06:  GROM #01-01 ----
        DECLE   $007B,  $0030   ; 580A  #07-07:  GROM #7D-7D ----
        DECLE   $0081,  $03C0   ; 580C  #08-0F:  GRAM #00-07 --I-
        DECLE   $00A1,  $0070   ; 580E  #10-10:  GROM #10-10 --I-
        DECLE   $0103,  $0340   ; 5810  #11-17:  GRAM #01-07 -Y--
        DECLE   $00A1,  $03C0   ; 5812  #18-1F:  GRAM #10-17 --I-
        DECLE   $0001,  $0300   ; 5814  #20-26:  CART #00-06 ----

.GFX_LIST_5816:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5816  CART PIC #00
        DECLE   $0000,  $0003,  $0003,  $0002   ; 581A  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 581E  CART PIC #01
        DECLE   $0000,  $0080,  $0080,  $0080   ; 5822  
        DECLE   $0002,  $0002,  $0002,  $0002   ; 5826  CART PIC #02
        DECLE   $0006,  $0000,  $0000,  $0000   ; 582A  
        DECLE   $0080,  $0080,  $0080,  $0080   ; 582E  CART PIC #03
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5832  
        DECLE   $0070,  $00FC,  $0068,  $0000   ; 5836  CART PIC #04
        DECLE   $001C,  $0037,  $005E,  $0038   ; 583A  
        DECLE   $0000,  $0000,  $0014,  $00B9   ; 583E  CART PIC #05
        DECLE   $007E,  $00FC,  $005A,  $0010   ; 5842  
        DECLE   $002C,  $001E,  $003F,  $005D   ; 5846  CART PIC #06
        DECLE   $0026,  $0008,  $0000,  $0000   ; 584A  
L_584E:
        PSHR    R5                              ; 584E   0275
        MVI     G_016B, R1                      ; 584F   0281 016B
        SLL     R1,     2                       ; 5851   004D
        SLL     R1,     1                       ; 5852   0049
        ADDI    #$033D, R1                      ; 5853   02F9 033D
        PULR    R7                              ; 5855   02B7

        DECLE   $0046,  $0090,  $00A6,  $0058   ; 5856   0046 0090 00A6 0058
        DECLE   $0000,  $0014,  $0000,  $0016   ; 585A   0000 0014 0000 0016
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5862   0000 0000 0000 0000
        DECLE   $0046,  $0090,  $00B6,  $0058   ; 5866   0046 0090 00B6 0058
        DECLE   $0000,  $0014,  $0000,  $000D   ; 586A   0000 0014 0000 000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5872   0000 0000 0000 0000
        DECLE   $0047,  $0008,  $00AD,  $0058   ; 5876   0047 0008 00AD 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 587E   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5882   0001 0000 0000 0000
        DECLE   $0080,  $0098,  $00BD,  $0058   ; 5886   0080 0098 00BD 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 588E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5892   0000 0000 0000 0000
        DECLE   $0047,  $0080,  $00C6,  $0058   ; 5896   0047 0080 00C6 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 589E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58A2   0000 0000 0000 0000
        DECLE   $0100,  $0000                   ; 58A6   0100 0000

        ADCR    R7                              ; 58A8   002F

        RLC     R0,     2                       ; 58A9   0054
L_58AA:
        DECR    R2                              ; 58AA   0012
        DECLE   $0000,  $0000,  $03B7,  $0056   ; 58AB   0000 0000 03B7 0056
        DECLE   $0013,  $0055,  $0002,  $0012   ; 58AF   0013 0055 0002 0012
        DECLE   $0002,  $0254,  $0157,  $0100   ; 58B3   0002 0254 0157 0100
        DECLE   $0000,  $0000,  $0000,  $0004   ; 58B7   0000 0000 0000 0004
        DECLE   $001D,  $0000,  $0100,  $0000   ; 58BB   001D 0000 0100 0000
        DECLE   $0000,  $0000,  $0001,  $001C   ; 58BF   0000 0000 0001 001C
        DECLE   $0002,  $0254,  $0057,  $0100   ; 58C3   0002 0254 0057 0100
        DECLE   $0000,  $0000,  $0000,  $0005   ; 58C7   0000 0000 0000 0005
        DECLE   $0023,  $0000,  $0000,  $0000   ; 58CB   0023 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0008   ; 58CF   0000 0000 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 58D3   0008 0008 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0008   ; 58D7   0008 0008 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58DB   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0002,  $0004   ; 58DF   0000 0002 0002 0004
        DECLE   $0004,  $0008,  $0008,  $0010   ; 58E3   0004 0008 0008 0010
        DECLE   $0010,  $0020,  $0000,  $0000   ; 58E7   0010 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58EB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 58EF   0000 0000 0000 0002
        DECLE   $0004,  $0008,  $0010,  $0020   ; 58F3   0004 0008 0010 0020
        DECLE   $0040,  $0000,  $0000,  $0000   ; 58F7   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58FF   0000 0000 0000 0000
        DECLE   $0002,  $000C,  $0030,  $00C0   ; 5903   0002 000C 0030 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5907   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 590F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FE,  $0000   ; 5913   0000 0000 00FE 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5917   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 591B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0008   ; 591F   0000 0000 0008 0008
        DECLE   $0008,  $0008,  $0008,  $0010   ; 5923   0008 0008 0008 0010
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5927   0010 0010 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 592B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 592F   0000 0000 0004 0004
        DECLE   $0004,  $0008,  $0008,  $0008   ; 5933   0004 0008 0008 0008
        DECLE   $0008,  $0010,  $0010,  $0010   ; 5937   0008 0010 0010 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 593B   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0004,  $0004   ; 593F   0000 0004 0004 0004
        DECLE   $0008,  $0008,  $0008,  $0010   ; 5943   0008 0008 0008 0010
        DECLE   $0010,  $0020,  $0020,  $0000   ; 5947   0010 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 594B   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0002,  $0004   ; 594F   0000 0002 0002 0004
        DECLE   $0004,  $0008,  $0008,  $0010   ; 5953   0004 0008 0008 0010
        DECLE   $0010,  $0020,  $0020,  $0000   ; 5957   0010 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5963   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5967   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 596F   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 5973   0000 0018 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5977   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 597B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 597F   0000 0000 0000 0000
        DECLE   $0004,  $0010,  $0004,  $0008   ; 5983   0004 0010 0004 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5987   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 598B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 598F   0000 0000 0000 0002
        DECLE   $0008,  $0020,  $0004,  $0000   ; 5993   0008 0020 0004 0000
        DECLE   $000A,  $0000,  $0000,  $0000   ; 5997   000A 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 599B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 599F   0000 0000 0000 0004
        DECLE   $0020,  $0000,  $0000,  $0000   ; 59A3   0020 0000 0000 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; 59A7   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59AB   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0000   ; 59AF   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; 59B3   0000 0000 0000 0030
        DECLE   $0030,  $0030,  $0030,  $0000   ; 59B7   0030 0030 0030 0000
        DECLE   $0038,  $00FE,  $00FE,  $00BA   ; 59BB   0038 00FE 00FE 00BA
        DECLE   $00BA,  $00BA,  $00BA,  $00BA   ; 59BF   00BA 00BA 00BA 00BA
        DECLE   $00BA,  $00BA,  $0000,  $0030   ; 59C3   00BA 00BA 0000 0030
        DECLE   $0030,  $0030,  $0030,  $0000   ; 59C7   0030 0030 0030 0000
        DECLE   $0038,  $00FE,  $00FE,  $007C   ; 59CB   0038 00FE 00FE 007C
        DECLE   $007C,  $007C,  $007C,  $0038   ; 59CF   007C 007C 007C 0038
        DECLE   $0038,  $0038,  $0000,  $0000   ; 59D3   0038 0038 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59D7   0000 0000 0000 0000
        DECLE   $0030,  $0000,  $0038,  $00FE   ; 59DB   0030 0000 0038 00FE
        DECLE   $00FE,  $007C,  $007C,  $007C   ; 59DF   00FE 007C 007C 007C
        DECLE   $0038,  $0038,  $0000,  $0000   ; 59E3   0038 0038 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; 59EB   0000 0000 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59EF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59F3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $007E   ; 59F7   0000 0000 007E 007E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59FB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 59FF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A03   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0030,  $0070   ; 5A07   0000 0010 0030 0070
        DECLE   $00E0,  $00C0,  $0080,  $0000   ; 5A0B   00E0 00C0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A0F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A13   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0060   ; 5A17   0000 0030 0030 0060
        DECLE   $0060,  $00C0,  $00C0,  $0080   ; 5A1B   0060 00C0 00C0 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5A1F   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A23   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0020,  $0060   ; 5A27   0000 0020 0020 0060
        DECLE   $0060,  $0040,  $0040,  $00C0   ; 5A2B   0060 0040 0040 00C0
        DECLE   $00C0,  $0080,  $0080,  $0000   ; 5A2F   00C0 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A33   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $0040,  $0040   ; 5A37   0000 0040 0040 0040
        DECLE   $0040,  $0040,  $0040,  $0040   ; 5A3B   0040 0040 0040 0040
        DECLE   $0040,  $0040,  $0040,  $0000   ; 5A3F   0040 0040 0040 0000
        DECLE   $0000,  $0000                   ; 5A43   0000 0000
L_5A45:
        PSHR    R5                              ; 5A45   0275
        MVII    #$0018, R0                      ; 5A46   02B8 0018
        SDBD                                    ; 5A48   0001
        MVII    #$2800, R1                      ; 5A49   02B9 0000 0028
        MVII    #$0200, R4                      ; 5A4C   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5A4E   0004 0114 0341

        ADDI    #$0010, R4                      ; 5A51   02FC 0010
        MVII    #$0004, R0                      ; 5A53   02B8 0004

        JSR     R5,     X_FILL_MEM              ; 5A55   0004 0114 0341
        JSR     R5,     L_5A5F                  ; 5A58   0004 0158 025F
        JSR     R5,     L_5A76                  ; 5A5B   0004 0158 0276

        PULR    R7                              ; 5A5E   02B7

L_5A5F:
        PSHR    R5                              ; 5A5F   0275
        SDBD                                    ; 5A60   0001
        MVII    #$2007, R3                      ; 5A61   02BB 0007 0020
        MVII    #$0204, R4                      ; 5A64   02BC 0204

        JSR     R5,     X_PRINT_R5              ; 5A66   0004 0118 007B
        STRING  "HOLE"                          ; 5A69   0048 004F 004C 0045
        DECLE   $0000                           ; 5A6D   0000

        MVI     G_016C, R0                      ; 5A6E   0280 016C
        MVII    #$0002, R1                      ; 5A70   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 5A72   0004 0118 00C5

        PULR    R7                              ; 5A75   02B7

L_5A76:
        PSHR    R5                              ; 5A76   0275
        SDBD                                    ; 5A77   0001
        MVII    #$2906, R0                      ; 5A78   02B8 0006 0029
        MVO     R0,     .BTAB.15                ; 5A7B   0240 0215
        ADDI    #$0008, R0                      ; 5A7D   02F8 0008
        MVO     R0,     .BTAB.16                ; 5A7F   0240 0216
        ADDI    #$0008, R0                      ; 5A81   02F8 0008
        MVO     R0,     .BTAB.29                ; 5A83   0240 0229
        ADDI    #$0008, R0                      ; 5A85   02F8 0008
        MVO     R0,     .BTAB.2A                ; 5A87   0240 022A
        PULR    R7                              ; 5A89   02B7

L_5A8A:
        PSHR    R5                              ; 5A8A   0275
        MVII    #$00F0, R0                      ; 5A8B   02B8 00F0
        SDBD                                    ; 5A8D   0001
        MVII    #$2800, R1                      ; 5A8E   02B9 0000 0028
        MVII    #$0200, R4                      ; 5A91   02BC 0200

        JSR     R5,     X_FILL_MEM              ; 5A93   0004 0114 0341

        SDBD                                    ; 5A96   0001
        MVII    #$2007, R3                      ; 5A97   02BB 0007 0020
        MVII    #$023E, R4                      ; 5A9A   02BC 023E

        JSR     R5,     X_PRINT_R5              ; 5A9C   0004 0118 007B
        STRING  "HOW MANY PLAYERS?"             ; 5A9F  
        DECLE   $0000                           ; 5AB0   0000

        MVII    #$02CA, R4                      ; 5AB1   02BC 02CA

        JSR     R5,     X_PRINT_R5              ; 5AB3   0004 0118 007B
        STRING  "UP TO 4 CAN PLAY."             ; 5AB6  
        DECLE   $0000                           ; 5AC7   0000

        PULR    R7                              ; 5AC8   02B7

L_5AC9:
        PSHR    R5                              ; 5AC9   0275
        CLRR    R5                              ; 5ACA   01ED
        MVII    #$02DC, R4                      ; 5ACB   02BC 02DC
        MVII    #$0162, R2                      ; 5ACD   02BA 0162
        ADD     G_016A, R2                      ; 5ACF   02C2 016A
        MVII    #$0004, R1                      ; 5AD1   02B9 0004
L_5AD3:
        MVI@    R2,     R0                      ; 5AD3   0290
        SDBD                                    ; 5AD4   0001
        MVII    #$2003, R3                      ; 5AD5   02BB 0003 0020
        CMP     G_016B, R5                      ; 5AD8   0345 016B
        BNEQ    L_5AE0                          ; 5ADA   020C 0004

        SDBD                                    ; 5ADC   0001
        MVII    #$2007, R3                      ; 5ADD   02BB 0007 0020

L_5AE0:
        JSR     R5,     X_PRNUM_RGT             ; 5AE0   0004 0118 00C5

        ADDR    R1,     R4                      ; 5AE3   00CC
        MVII    #$0005, R1                      ; 5AE4   02B9 0005
        INCR    R2                              ; 5AE6   000A
        MOVR    R2,     R5                      ; 5AE7   0095
        SUBI    #$0162, R5                      ; 5AE8   033D 0162
        SUB     G_016A, R5                      ; 5AEA   0305 016A
        CMPI    #$0003, R5                      ; 5AEC   037D 0003
        BLE     L_5AD3                          ; 5AEE   0226 001C

        SDBD                                    ; 5AF0   0001
        MVII    #$2800, R2                      ; 5AF1   02BA 0000 0028
        MVO@    R2,     R4                      ; 5AF4   0262
        PULR    R7                              ; 5AF5   02B7

L_5AF6:
        PSHR    R5                              ; 5AF6   0275
        MVI     G_015E, R0                      ; 5AF7   0280 015E
        MVII    #$0007, R1                      ; 5AF9   02B9 0007

        JSR     R5,     X_MPY                   ; 5AFB   0004 011C 01DC

        MOVR    R2,     R1                      ; 5AFE   0091
        SDBD                                    ; 5AFF   0001
        ADDI    #$5B06, R1                      ; 5B00   02F9 0006 005B
        MVII    #$020D, R4                      ; 5B03   02BC 020D
        SDBD                                    ; 5B05   0001
        MVII    #$2007, R3                      ; 5B06   02BB 0007 0020

        JSR     R5,     X_PRINT_R1              ; 5B09   0004 0118 0067

        PULR    R7                              ; 5B0C   02B7

        DECLE   $0044,  $0052,  $0049,  $0056   ; 5B0D   0044 0052 0049 0056
        DECLE   $0045,  $0052,  $0000,  $0033   ; 5B11   0045 0052 0000 0033
        DECLE   $002D,  $0057,  $004F,  $004F   ; 5B15   002D 0057 004F 004F
        DECLE   $0044,  $0000,  $0035,  $002D   ; 5B19   0044 0000 0035 002D
        DECLE   $0057,  $004F,  $004F,  $0044   ; 5B1D   0057 004F 004F 0044
        DECLE   $0000,  $0033,  $002D,  $0049   ; 5B21   0000 0033 002D 0049
        DECLE   $0052,  $004F,  $004E,  $0000   ; 5B25   0052 004F 004E 0000
        DECLE   $0035,  $002D,  $0049,  $0052   ; 5B29   0035 002D 0049 0052
        DECLE   $004F,  $004E,  $0000,  $0037   ; 5B2D   004F 004E 0000 0037
        DECLE   $002D,  $0049,  $0052,  $004F   ; 5B31   002D 0049 0052 004F
        DECLE   $004E,  $0000,  $0039,  $002D   ; 5B35   004E 0000 0039 002D
        DECLE   $0049,  $0052,  $004F,  $004E   ; 5B39   0049 0052 004F 004E
        DECLE   $0000,  $0057,  $0045,  $0044   ; 5B3D   0000 0057 0045 0044
        DECLE   $0047,  $0045,  $0020,  $0000   ; 5B41   0047 0045 0020 0000
        DECLE   $0050,  $0055,  $0054,  $0054   ; 5B45   0050 0055 0054 0054
        DECLE   $0045,  $0052,  $0000,  $0020   ; 5B49   0045 0052 0000 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5B4D   0020 0020 0020 0020
        DECLE   $0020,  $0000,  $0003,  $003C   ; 5B51   0020 0000 0003 003C
        DECLE   $0006,  $003C,  $0001,  $003C   ; 5B55   0006 003C 0001 003C
        DECLE   $0005,  $003C,  $0006,  $000E   ; 5B59   0005 003C 0006 000E
        DECLE   $0001,  $000E,  $0005           ; 5B5D   0001 000E 0005

        INCR    R6                              ; 5B60   000E
L_5B61:
        PSHR    R5                              ; 5B61   0275
        MVII    #$0175, R5                      ; 5B62   02BD 0175
        SDBD                                    ; 5B64   0001
        MVI@    R5,     R4                      ; 5B65   02AC
        MVII    #$0218, R3                      ; 5B66   02BB 0218
        MVII    #$0010, R2                      ; 5B68   02BA 0010

        JSR     R5,     L_5B81                  ; 5B6A   0004 0158 0381

        ADDI    #$0004, R3                      ; 5B6D   02FB 0004
        MVII    #$00B0, R2                      ; 5B6F   02BA 00B0

        JSR     R5,     L_5B81                  ; 5B71   0004 0158 0381

        MOVR    R4,     R3                      ; 5B74   00A3
        MOVR    R4,     R2                      ; 5B75   00A2
        MVII    #$00FF, R1                      ; 5B76   02B9 00FF
        ANDR    R1,     R2                      ; 5B78   018A
        SWAP    R1,     1                       ; 5B79   0041
        ANDR    R1,     R3                      ; 5B7A   018B
        SWAP    R3,     1                       ; 5B7B   0043
        MVO     R2,     G_0175                  ; 5B7C   0242 0175
        MVO     R3,     G_0176                  ; 5B7E   0243 0176
        PULR    R7                              ; 5B80   02B7

L_5B81:
        PSHR    R5                              ; 5B81   0275
L_5B82:
        TSTR    R2                              ; 5B82   0092
        BEQ     L_5B93                          ; 5B83   0204 000E

        MVI@    R4,     R0                      ; 5B85   02A0
        SARC    R0,     1                       ; 5B86   0078
        BC      L_5B8E                          ; 5B87   0201 0005

        JSR     R5,     L_5B94                  ; 5B89   0004 0158 0394

        B       L_5B82                          ; 5B8C   0220 000B

L_5B8E:
        JSR     R5,     L_5BA8                  ; 5B8E   0004 0158 03A8

        B       L_5B82                          ; 5B91   0220 0010
L_5B93:
        PULR    R7                              ; 5B93   02B7

L_5B94:
        PSHR    R5                              ; 5B94   0275
        MVII    #$000F, R1                      ; 5B95   02B9 000F
        MOVR    R1,     R5                      ; 5B97   008D
        COMR    R1                              ; 5B98   0019
        ANDR    R0,     R1                      ; 5B99   0181
        ANDR    R0,     R5                      ; 5B9A   0185
        SLR     R1,     1                       ; 5B9B   0061
        SDBD                                    ; 5B9C   0001
        ADDI    #$5B53, R5                      ; 5B9D   02FD 0053 005B
        SDBD                                    ; 5BA0   0001
        XOR@    R5,     R1                      ; 5BA1   03E9
        MVO@    R1,     R3                      ; 5BA2   0259
        MVO     R1,     G_0324                  ; 5BA3   0241 0324
        INCR    R3                              ; 5BA5   000B
        DECR    R2                              ; 5BA6   0012
        PULR    R7                              ; 5BA7   02B7

L_5BA8:
        PSHR    R5                              ; 5BA8   0275
        SARC    R0,     2                       ; 5BA9   007C
        BOV     L_5BB0                          ; 5BAA   0202 0004
        BNC     L_5BBC                          ; 5BAC   0209 000E
        BC      L_5BC8                          ; 5BAE   0201 0018
L_5BB0:
        BNC     L_5BD1                          ; 5BB0   0209 001F

L_5BB2:
        JSR     R5,     L_5BDE                  ; 5BB2   0004 0158 03DE

        DECR    R0                              ; 5BB5   0010
        BMI     L_5BDB                          ; 5BB6   020B 0023

        DECR    R2                              ; 5BB8   0012
        INCR    R3                              ; 5BB9   000B
        B       L_5BB2                          ; 5BBA   0220 0009

L_5BBC:
        SDBD                                    ; 5BBC   0001
        MVII    #$0845, R0                      ; 5BBD   02B8 0045 0008
        MVO@    R0,     R3                      ; 5BC0   0258
        MVII    #$016E, R1                      ; 5BC1   02B9 016E

        JSR     R5,     L_5C05                  ; 5BC3   0004 015C 0005

        B       L_5BDB                          ; 5BC6   0200 0013

L_5BC8:
        JSR     R5,     L_5BEA                  ; 5BC8   0004 0158 03EA

        CLRR    R1                              ; 5BCB   01C9
        COMR    R1                              ; 5BCC   0019
        MVO     R1,     G_0324                  ; 5BCD   0241 0324
        B       L_5BDB                          ; 5BCF   0200 000A

L_5BD1:
        SDBD                                    ; 5BD1   0001
        MVII    #$3C00, R0                      ; 5BD2   02B8 0000 003C
        MVO@    R0,     R3                      ; 5BD5   0258
        MVII    #$0172, R1                      ; 5BD6   02B9 0172

        JSR     R5,     L_5C05                  ; 5BD8   0004 015C 0005

L_5BDB:
        DECR    R2                              ; 5BDB   0012
        INCR    R3                              ; 5BDC   000B
        PULR    R7                              ; 5BDD   02B7

L_5BDE:
        PSHR    R5                              ; 5BDE   0275
        MVI     G_0324, R1                      ; 5BDF   0281 0324
        TSTR    R1                              ; 5BE1   0089
        BPL     L_5BE8                          ; 5BE2   0203 0004

        JSR     R5,     L_5BEA                  ; 5BE4   0004 0158 03EA

        PULR    R7                              ; 5BE7   02B7

L_5BE8:
        MVO@    R1,     R3                      ; 5BE8   0259
        PULR    R7                              ; 5BE9   02B7

L_5BEA:
        PSHR    R5                              ; 5BEA   0275
        PSHR    R0                              ; 5BEB   0270
        MVII    #$0004, R0                      ; 5BEC   02B8 0004

        JSR     R5,     X_RAND2                 ; 5BEE   0004 0114 029E

        TSTR    R0                              ; 5BF1   0080
        BEQ     L_5BFE                          ; 5BF2   0204 000A

        ADDI    #$0023, R0                      ; 5BF4   02F8 0023
        SLL     R0,     2                       ; 5BF6   004C
        SLL     R0,     1                       ; 5BF7   0048
        SDBD                                    ; 5BF8   0001
        XORI    #$0E04, R0                      ; 5BF9   03F8 0004 000E
        B       L_5C02                          ; 5BFC   0200 0004

L_5BFE:
        SDBD                                    ; 5BFE   0001
        MVII    #$0E03, R0                      ; 5BFF   02B8 0003 000E
L_5C02:
        MVO@    R0,     R3                      ; 5C02   0258
        PULR    R0                              ; 5C03   02B0
        PULR    R7                              ; 5C04   02B7

L_5C05:
        PSHR    R5                              ; 5C05   0275
        PSHR    R2                              ; 5C06   0272
        PSHR    R1                              ; 5C07   0271
        MOVR    R3,     R1                      ; 5C08   0099
        SUBI    #$01FF, R1                      ; 5C09   0339 01FF
        MVII    #$0014, R2                      ; 5C0B   02BA 0014

        JSR     R5,     X_DIV                   ; 5C0D   0004 011C 01FB

        INCR    R0                              ; 5C10   0008
        PULR    R2                              ; 5C11   02B2
        SLL     R1,     2                       ; 5C12   004D
        SLL     R1,     1                       ; 5C13   0049
        MVO@    R1,     R2                      ; 5C14   0251
        ADDI    #$0002, R2                      ; 5C15   02FA 0002
        SLL     R0,     2                       ; 5C17   004C
        SLL     R0,     1                       ; 5C18   0048
        MVO@    R0,     R2                      ; 5C19   0250
        PULR    R2                              ; 5C1A   02B2
        PULR    R7                              ; 5C1B   02B7

        DECLE   $0003,  $0077,  $0003,  $0047   ; 5C1C   0003 0077 0003 0047
        DECLE   $03B0,  $0050,  $0003,  $0037   ; 5C20   03B0 0050 0003 0037
        DECLE   $02A0,  $0300,  $0140,  $02A0   ; 5C24   02A0 0300 0140 02A0
        DECLE   $0300,  $0240,  $0000           ; 5C28   0300 0240 0000

        ANDR    R4,     R0                      ; 5C2B   01A0
        CMPR    R0,     R0                      ; 5C2C   0140
        MVI@    R4,     R0                      ; 5C2D   02A0
        CMPR    R0,     R4                      ; 5C2E   0144
        SUBR    R0,     R4                      ; 5C2F   0104
        MOVR    R6,     R0                      ; 5C30   00B0
        GSWD    R0                              ; 5C31   0030
        DIS                                     ; 5C32   0003
L_5C33:
        DECR    R7                              ; 5C33   0017

        DECLE   $0010,  $0007,  $0020,  $0000   ; 5C34   0010 0007 0020 0000
        DECLE   $003F,  $03CC,  $0001,  $0098   ; 5C38   003F 03CC 0001 0098
        DECLE   $03F0,  $0050,  $0003,  $0007   ; 5C3C   03F0 0050 0003 0007
        DECLE   $0005                           ; 5C40   0005

        DECR    R0                              ; 5C41   0010
        INCR    R7                              ; 5C42   000F

        SLR     R0,     1                       ; 5C43   0060
L_5C44:
        AND@    R4,     R0                      ; 5C44   03A0
        DECLE   $0200,  $0340,  $0003,  $00A0   ; 5C45   0200 0340 0003 00A0
        DECLE   $0040,  $0000                   ; 5C49   0040 0000

        SETC                                    ; 5C4B   0007
        XORR    R5,     R4                      ; 5C4C   01EC
        SUB@    R3,     R0                      ; 5C4D   0318
        MVO@    R0,     R3                      ; 5C4E   0258
        CMP@    R6,     R0                      ; 5C4F   0370
        MVI@    R2,     R0                      ; 5C50   0290
        DIS                                     ; 5C51   0003
        SLLC    R3,     2                       ; 5C52   005F
        MOVR    R4,     R0                      ; 5C53   00A0
        CMP     .STIC.X.3,R0                    ; 5C54   0340 0003
        INCR    R7                              ; 5C56   000F

        MVO@    R0,     R2                      ; 5C57   0250
L_5C58:
        DIS                                     ; 5C58   0003
        MVI     .STIC.X.3,R7                    ; 5C59   0287 0003

        RRC     R3,     2                       ; 5C5B   0077
        ADCR    R7                              ; 5C5C   002F

        MVI@    R4,     R0                      ; 5C5D   02A0
L_5C5E:
        MVO     R0,     .STIC.X.0               ; 5C5E   0240 0000
L_5C60:
        DECR    R7                              ; 5C60   0017

        DECLE   $01A0,  $0140,  $0003,  $0037   ; 5C61   01A0 0140 0003 0037

        MVI     .STIC.X.0,R0                    ; 5C65   0280 0000
        ANDR    R4,     R0                      ; 5C67   01A0
        MVO     R0,     .STIC.X.0               ; 5C68   0240 0000
L_5C6A:
        DECR    R7                              ; 5C6A   0017

        DECLE   $0144,  $0284,  $0000,  $0007   ; 5C6B   0144 0284 0000 0007
        DECLE   $0180,  $0003,  $0027           ; 5C6F   0180 0003 0027

        MVI     .STIC.X.0,R0                    ; 5C72   0280 0000
        ADCR    R7                              ; 5C74   002F

        XOR@    R5,     R0                      ; 5C75   03E8
L_5C76:
        SLL     R0,     1                       ; 5C76   0048
        DECLE   $0000                           ; 5C77   0000
L_5C78:
        DECR    R7                              ; 5C78   0017

        CMPR    R4,     R0                      ; 5C79   0160
        DIS                                     ; 5C7A   0003
        INCR    R7                              ; 5C7B   000F

        ADD@    R4,     R0                      ; 5C7C   02E0
L_5C7D:
        MVO     R0,     .STIC.X.0               ; 5C7D   0240 0000
        DECLE   $0007,  $03A4,  $0324,  $0264   ; 5C7F   0007 03A4 0324 0264
        DECLE   $0000,  $0380,  $0003,  $0334   ; 5C83   0000 0380 0003 0334
        DECLE   $02F4,  $0003,  $0000           ; 5C87   02F4 0003 0000

        INCR    R7                              ; 5C8A   000F

        CMP@    R4,     R0                      ; 5C8B   0360
L_5C8C:
        DIS                                     ; 5C8C   0003
        DECLE   $0007,  $02E0,  $0220           ; 5C8D   0007 02E0 0220

        AND@    R4,     R0                      ; 5C90   03A0
        NEGR    R0                              ; 5C91   0020
        AND@    R4,     R0                      ; 5C92   03A0
        MVO@    R0,     R2                      ; 5C93   0250
        DIS                                     ; 5C94   0003
L_5C95:
        DECR    R7                              ; 5C95   0017

        DECLE   $0334,  $0108,  $0003,  $03B8   ; 5C96   0334 0108 0003 03B8
        DECLE   $020C,  $004C,  $0380,  $0003   ; 5C9A   020C 004C 0380 0003
        DECLE   $0007,  $0010,  $00E0,  $0380   ; 5C9E   0007 0010 00E0 0380
        DECLE   $0003,  $0037,  $0194,  $0294   ; 5CA2   0003 0037 0194 0294
        DECLE   $0003,  $0158,  $0001,  $02B8   ; 5CA6   0003 0158 0001 02B8
        DECLE   $0003,  $0007,  $0010,  $003F   ; 5CAA   0003 0007 0010 003F
        DECLE   $0003,  $0194,  $00D4,  $0394   ; 5CAE   0003 0194 00D4 0394
        DECLE   $0074,  $0003,  $0027,  $0010   ; 5CB2   0074 0003 0027 0010
        DECLE   $0005,  $003F,  $0003,  $0134   ; 5CB6   0005 003F 0003 0134
        DECLE   $0108,  $0274,  $0003,  $0027   ; 5CBA   0108 0274 0003 0027
        DECLE   $0010,  $0037,  $0003,  $0057   ; 5CBE   0010 0037 0003 0057
        DECLE   $0003,  $0057,  $03B8,  $0218   ; 5CC2   0003 0057 03B8 0218
        DECLE   $0038,  $0003,  $0027,  $02A0   ; 5CC6   0038 0003 0027 02A0
        DECLE   $0140,  $0003,  $0007,  $02A0   ; 5CCA   0140 0003 0007 02A0
        DECLE   $0300,  $0240,  $018C,  $0001   ; 5CCE   0300 0240 018C 0001
        DECLE   $0278,  $0003,  $0037,  $03B0   ; 5CD2   0278 0003 0037 03B0
        DECLE   $0240,  $0000,  $0007,  $01E4   ; 5CD6   0240 0000 0007 01E4
        DECLE   $0244,  $0000,  $000F,  $0344   ; 5CDA   0244 0000 000F 0344
        DECLE   $0104,  $0003,  $002F           ; 5CDE   0104 0003 002F
L_5CE1:
        MVI     .BTAB.A4,R0                     ; 5CE1   0280 02A4
        DECLE   $0244,  $03A4,  $0044,  $0000   ; 5CE3   0244 03A4 0044 0000
        DECLE   $0380,  $0003,  $0080,  $0000   ; 5CE7   0380 0003 0080 0000
        DECLE   $0007,  $0184,  $02D0,  $0003   ; 5CEB   0007 0184 02D0 0003
        DECLE   $0027,  $0010,  $0000           ; 5CEF   0027 0010 0000

        SETC                                    ; 5CF2   0007
        AND     .BTAB.90,R4                     ; 5CF3   0384 0290
        ANDR    R6,     R0                      ; 5CF5   01B0
        CMP     .STIC.X.3,R0                    ; 5CF6   0340 0003
        INCR    R7                              ; 5CF8   000F

        MOVR    R4,     R0                      ; 5CF9   00A0
L_5CFA:
        SWAP    R0,     1                       ; 5CFA   0040
        DECLE   $0000,  $0360,  $0003,  $0027   ; 5CFB   0000 0360 0003 0027
        DECLE   $0010,  $0080,  $0000           ; 5CFF   0010 0080 0000

        XOR     .STIC.X.3,R0                    ; 5D02   03C0 0003
        INCR    R7                              ; 5D04   000F

        DECR    R0                              ; 5D05   0010
L_5D06:
        SETC                                    ; 5D06   0007
        DECLE   $0003,  $0037,  $0010,  $001F   ; 5D07   0003 0037 0010 001F
        DECLE   $0003,  $0007,  $0010,  $0027   ; 5D0B   0003 0007 0010 0027

        DIS                                     ; 5D0F   0003
        ADCR    R7                              ; 5D10   002F

        DECR    R0                              ; 5D11   0010
L_5D12:
        SLL     R3,     2                       ; 5D12   004F
        DECLE   $0003,  $003F,  $0005,  $0010   ; 5D13   0003 003F 0005 0010
        DECLE   $0037                           ; 5D17   0037

        DIS                                     ; 5D18   0003
        ADDR    R4,     R7                      ; 5D19   00E7

        DIS                                     ; 5D1A   0003
        RRC     R3,     2                       ; 5D1B   0077
        SLR     R3,     2                       ; 5D1C   0067
        AND@    R6,     R0                      ; 5D1D   03B0
        RLC     R0,     1                       ; 5D1E   0050
        DIS                                     ; 5D1F   0003
        DECR    R0                              ; 5D20   0010
L_5D21:
        DECR    R7                              ; 5D21   0017

        DECLE   $0003,  $005F,  $03D8,  $0001   ; 5D22   0003 005F 03D8 0001
        DECLE   $0374,  $0010,  $0005,  $0007   ; 5D26   0374 0010 0005 0007
        DECLE   $0003,  $005F,  $0280,  $01EC   ; 5D2A   0003 005F 0280 01EC
        DECLE   $024C,  $0108,  $0010,  $0007   ; 5D2E   024C 0108 0010 0007
        DECLE   $0003,  $0010,  $000F,  $0003   ; 5D32   0003 0010 000F 0003
        DECLE   $003F,  $0280,  $03A4,  $0204   ; 5D36   003F 0280 03A4 0204

        XOR@    R1,     R0                      ; 5D3A   03C8
        SUBR    R1,     R0                      ; 5D3B   0108
        DECR    R0                              ; 5D3C   0010
L_5D3D:
        DECR    R7                              ; 5D3D   0017

        MVI@    R4,     R0                      ; 5D3E   02A0
        MVO     R0,     .STIC.X.0               ; 5D3F   0240 0000
        SETC                                    ; 5D41   0007
        XOR     G_00D0, R4                      ; 5D42   03C4 00D0
        DIS                                     ; 5D44   0003
L_5D45:
        DECR    R7                              ; 5D45   0017

        DECLE   $0280,  $0000,  $02A4,  $0244   ; 5D46   0280 0000 02A4 0244
        DECLE   $0368,  $0108,  $0010,  $000F   ; 5D4A   0368 0108 0010 000F

        ADD     .STIC.X.0,R0                    ; 5D4E   02C0 0000
L_5D50:
        DECR    R7                              ; 5D50   0017

        DECLE   $01E4,  $0144,  $0070,  $0003   ; 5D51   01E4 0144 0070 0003
        DECLE   $0007,  $0370,  $0064,  $0000   ; 5D55   0007 0370 0064 0000
        DECLE   $0007,  $0388,  $0108,  $0007   ; 5D59   0007 0388 0108 0007
        DECLE   $0010,  $000F,  $0260,  $0000   ; 5D5D   0010 000F 0260 0000
        DECLE   $0388,  $0108,  $0007,  $0088   ; 5D61   0388 0108 0007 0088
        DECLE   $0000                           ; 5D65   0000
L_5D66:
        DECR    R7                              ; 5D66   0017

        DECLE   $03E8,  $0208,  $0007,  $0348   ; 5D67   03E8 0208 0007 0348
        DECLE   $0108,  $000F,  $0003,  $000F   ; 5D6B   0108 000F 0003 000F
        DECLE   $0080,  $0000                   ; 5D6F   0080 0000

        SUBR    R1,     R0                      ; 5D71   0108
L_5D72:
        DECR    R7                              ; 5D72   0017

        DECLE   $00A8,  $0048,  $0000,  $03A8   ; 5D73   00A8 0048 0000 03A8
        DECLE   $0328,  $0108,  $0027           ; 5D77   0328 0108 0027

        DIS                                     ; 5D7A   0003
L_5D7B:
        DECR    R7                              ; 5D7B   0017

        TSTR    R0                              ; 5D7C   0080
        CMPR    R5,     R0                      ; 5D7D   0168
        SUBR    R1,     R0                      ; 5D7E   0108
        SLR     R3,     2                       ; 5D7F   0067
        DIS                                     ; 5D80   0003
        RRC     R3,     2                       ; 5D81   0077
        MOVR    R5,     R7                      ; 5D82   00AF

        DECLE   $0005,  $0097,  $0010,  $0003   ; 5D83   0005 0097 0010 0003
        DECLE   $0037,  $03B0,  $0350,  $00B0   ; 5D87   0037 03B0 0350 00B0
        DECLE   $0030,  $0003,  $001F,  $0280   ; 5D8B   0030 0003 001F 0280
        DECLE   $0000,  $0180,  $0003,  $0037   ; 5D8F   0000 0180 0003 0037
        DECLE   $03B8,  $0058,  $0130,  $0230   ; 5D93   03B8 0058 0130 0230
        DECLE   $0003,  $001F,  $0020,  $0000   ; 5D97   0003 001F 0020 0000
L_5D9B:
        DECR    R7                              ; 5D9B   0017

        DECLE   $01A0,  $0300,  $0017,  $0240   ; 5D9C   01A0 0300 0017 0240
        DECLE   $010C,  $0001,  $0098,  $0003   ; 5DA0   010C 0001 0098 0003
        DECLE   $0027,  $00E0,  $0040,  $0000   ; 5DA4   0027 00E0 0040 0000
        DECLE   $003F,  $01AC,  $030C,  $0258   ; 5DA8   003F 01AC 030C 0258
        DECLE   $0330,  $0003,  $003F,  $00A0   ; 5DAC   0330 0003 003F 00A0
        DECLE   $0040,  $0000,  $0324,  $0064   ; 5DB0   0040 0000 0324 0064
        DECLE   $03A0,  $0040,  $0000,  $0380   ; 5DB4   03A0 0040 0000 0380
        DECLE   $0350,  $0250,  $0003,  $013F   ; 5DB8   0350 0250 0003 013F
        DECLE   $0003,  $0047,  $0194,  $00F4   ; 5DBC   0003 0047 0194 00F4
        DECLE   $0214                           ; 5DC0   0214

        INCR    R7                              ; 5DC1   000F

        RLC     R0,     2                       ; 5DC2   0054
L_5DC3:
        DIS                                     ; 5DC3   0003
        DECLE   $0047,  $0010,  $0220,  $0000   ; 5DC4   0047 0010 0220 0000
        DECLE   $0007,  $01E8,  $0108,  $0010   ; 5DC8   0007 01E8 0108 0010
        DECLE   $0005                           ; 5DCC   0005
L_5DCD:
        DECR    R7                              ; 5DCD   0017

        DECLE   $0003,  $0037,  $0010,  $02C0   ; 5DCE   0003 0037 0010 02C0
        DECLE   $03EC,  $020C,  $004C,  $0000   ; 5DD2   03EC 020C 004C 0000
        DECLE   $0108,  $0010,  $000F,  $0280   ; 5DD6   0108 0010 000F 0280
        DECLE   $01A0,  $0140,  $0003,  $0027   ; 5DDA   01A0 0140 0003 0027
        DECLE   $0010,  $0007,  $0260,  $01CC   ; 5DDE   0010 0007 0260 01CC
        DECLE   $0001,  $010C,  $0000,  $0108   ; 5DE2   0001 010C 0000 0108
        DECLE   $0010,  $0007,  $0240,  $0000   ; 5DE6   0010 0007 0240 0000
        DECLE   $000F,  $0003,  $001F           ; 5DEA   000F 0003 001F

        DECR    R0                              ; 5DED   0010
        INCR    R7                              ; 5DEE   000F

        XOR@    R4,     R4                      ; 5DEF   03E4
L_5DF0:
        SLR     R0,     2                       ; 5DF0   0064
        DECLE   $01AC,  $030C,  $0000,  $0108   ; 5DF1   01AC 030C 0000 0108
        DECLE   $0010,  $0007,  $0020,  $0000   ; 5DF5   0010 0007 0020 0000

        INCR    R7                              ; 5DF9   000F

        ANDR    R4,     R0                      ; 5DFA   01A0
L_5DFB:
        MVO     R0,     .STIC.X.0               ; 5DFB   0240 0000
        DECLE   $0007,  $0180,  $02A0,  $0300   ; 5DFD   0007 0180 02A0 0300
        DECLE   $0240,  $01E4,  $0224,  $0000   ; 5E01   0240 01E4 0224 0000

        AND     G_0064, R4                      ; 5E05   0384 0064
        SUBR    R1,     R0                      ; 5E07   0108
        DECR    R0                              ; 5E08   0010
        SETC                                    ; 5E09   0007
        ADDR    R4,     R0                      ; 5E0A   00E0
        B       L_5E14                          ; 5E0B   0200 0007

        DECLE   $0040,  $0000,  $0384,  $00E4   ; 5E0D   0040 0000 0384 00E4
        DECLE   $0000,  $0037                   ; 5E11   0000 0037

        CLRR    R4                              ; 5E13   01E4
L_5E14:
        BEQ     L_5CE1                          ; 5E14   0224 0134

        DECR    R0                              ; 5E16   0010
        ADCR    R7                              ; 5E17   002F

        ANDR    R6,     R0                      ; 5E18   01B0
L_5E19:
        SUBR    R6,     R0                      ; 5E19   0130
        DECLE   $0000                           ; 5E1A   0000

        ADCR    R7                              ; 5E1B   002F

        AND@    R4,     R0                      ; 5E1C   03A0
L_5E1D:
        CMP     .STIC.A.0,R0                    ; 5E1D   0340 0010
        DECLE   $01F4,  $0010,  $003F           ; 5E1F   01F4 0010 003F

        MOVR    R4,     R0                      ; 5E22   00A0
        B       L_5E65                          ; 5E23   0200 0040

        DECLE   $0000,  $0007,  $03A0,  $0340   ; 5E25   0000 0007 03A0 0340
        DECLE   $0010,  $00B7                   ; 5E29   0010 00B7

        DIS                                     ; 5E2B   0003
        INCR    R7                              ; 5E2C   000F

        XOR@    R6,     R0                      ; 5E2D   03F0
L_5E2E:
        RLC     R0,     1                       ; 5E2E   0050
        MVI@    R4,     R0                      ; 5E2F   02A0
        MVO     R0,     .STIC.X.0               ; 5E30   0240 0000
        ANDR    R4,     R0                      ; 5E32   01A0
        CMPR    R0,     R0                      ; 5E33   0140
        AND@    R6,     R0                      ; 5E34   03B0
        RLC     R0,     1                       ; 5E35   0050
        DIS                                     ; 5E36   0003
L_5E37:
        DECR    R7                              ; 5E37   0017

        DIS                                     ; 5E38   0003
        INCR    R7                              ; 5E39   000F

        XORR    R2,     R0                      ; 5E3A   01D0
L_5E3B:
        ADD@    R4,     R4                      ; 5E3B   02E4
        DECLE   $0000,  $03AC,  $020C,  $004C   ; 5E3C   0000 03AC 020C 004C
        DECLE   $0000,  $0184,  $02F0,  $0003   ; 5E40   0000 0184 02F0 0003
        DECLE   $0057,  $0000,  $0007,  $010C   ; 5E44   0057 0000 0007 010C
        DECLE   $0001,  $02CC,  $0000,  $03E0   ; 5E48   0001 02CC 0000 03E0
        DECLE   $0003,  $005F,  $0000,  $0007   ; 5E4C   0003 005F 0000 0007
        DECLE   $01AC,  $030C,  $022C,  $03A4   ; 5E50   01AC 030C 022C 03A4
        DECLE   $0030,  $0003,  $004F,  $02A0   ; 5E54   0030 0003 004F 02A0
        DECLE   $0240,  $0000,  $001F,  $01A4   ; 5E58   0240 0000 001F 01A4
        DECLE   $0230,  $0003,  $004F,  $0080   ; 5E5C   0230 0003 004F 0080
        DECLE   $0000                           ; 5E60   0000
L_5E61:
        DECR    R7                              ; 5E61   0017

        AND     .STIC.X.3,R0                    ; 5E62   0380 0003
        SLLC    R3,     2                       ; 5E64   005F
L_5E65:
        DECR    R0                              ; 5E65   0010
        DECLE   $0007,  $0000,  $0007,  $0380   ; 5E66   0007 0000 0007 0380
        DECLE   $0003,  $0067,  $0005,  $0010   ; 5E6A   0003 0067 0005 0010
        DECLE   $0010,  $00A0,  $0340,  $0003   ; 5E6E   0010 00A0 0340 0003
        DECLE   $018F                           ; 5E72   018F

        DIS                                     ; 5E73   0003
        RLC     R3,     2                       ; 5E74   0057
        AND@    R6,     R4                      ; 5E75   03B4
        NOP                                     ; 5E76   0034
        DIS                                     ; 5E77   0003
        SETC                                    ; 5E78   0007
        SWAP    R3,     2                       ; 5E79   0047
        XOR@    R6,     R4                      ; 5E7A   03F4
        CMP@    R2,     R4                      ; 5E7B   0354
        SUBR    R1,     R0                      ; 5E7C   0108
        MVI@    R2,     R4                      ; 5E7D   0294
        DIS                                     ; 5E7E   0003
L_5E7F:
        DECR    R7                              ; 5E7F   0017

        DECLE   $0005,  $0057,  $0334,  $0108   ; 5E80   0005 0057 0334 0108
        DECLE   $02D4,  $0010,  $03B8,  $0058   ; 5E84   02D4 0010 03B8 0058
        DECLE   $0010,  $001F                   ; 5E88   0010 001F

        DIS                                     ; 5E8A   0003
        ADCR    R7                              ; 5E8B   002F

        CMP@    R2,     R4                      ; 5E8C   0354
L_5E8D:
        SUBR    R1,     R0                      ; 5E8D   0108
        DECLE   $0007,  $0003,  $02A0,  $0358   ; 5E8E   0007 0003 02A0 0358
        DECLE   $0001                           ; 5E92   0001

        SUBR    R1,     R4                      ; 5E93   010C
        DECR    R0                              ; 5E94   0010
L_5E95:
        DECR    R7                              ; 5E95   0017

        DIS                                     ; 5E96   0003
        DECR    R0                              ; 5E97   0010
        MVI@    R4,     R0                      ; 5E98   02A0
        CMPR    R0,     R0                      ; 5E99   0140
        DECR    R0                              ; 5E9A   0010
        DIS                                     ; 5E9B   0003
        INCR    R7                              ; 5E9C   000F

        XORR    R6,     R4                      ; 5E9D   01F4
L_5E9E:
        SUBR    R1,     R0                      ; 5E9E   0108
        DECLE   $02D4,  $0003,  $0000           ; 5E9F   02D4 0003 0000

        ANDR    R5,     R4                      ; 5EA2   01AC
        SUB@    R1,     R4                      ; 5EA3   030C
        MVO@    R4,     R1                      ; 5EA4   024C
        ANDR    R0,     R0                      ; 5EA5   0180
        DECR    R0                              ; 5EA6   0010
L_5EA7:
        DECR    R7                              ; 5EA7   0017

        MVI     .STIC.X.0,R0                    ; 5EA8   0280 0000
        INCR    R7                              ; 5EAA   000F

        ANDR    R0,     R4                      ; 5EAB   0184
L_5EAC:
        MOVR    R2,     R0                      ; 5EAC   0090
        DECLE   $0003,  $0007,  $0194,  $0003   ; 5EAD   0003 0007 0194 0003
        DECLE   $0007,  $0000                   ; 5EB1   0007 0000
L_5EB3:
        DECR    R7                              ; 5EB3   0017

        DECLE   $0380,  $0010,  $000F           ; 5EB4   0380 0010 000F

        MVI     .STIC.X.0,R0                    ; 5EB7   0280 0000
        CMP     .STIC.X.3,R0                    ; 5EB9   0340 0003
        TSTR    R4                              ; 5EBB   00A4
        NEGR    R4                              ; 5EBC   0024
        AND     .STIC.X.3,R0                    ; 5EBD   0380 0003
L_5EBF:
        DECR    R7                              ; 5EBF   0017

        DECLE   $0280,  $0144,  $0000           ; 5EC0   0280 0144 0000

        SETC                                    ; 5EC3   0007
        XOR     .STIC.X.3,R0                    ; 5EC4   03C0 0003
L_5EC6:
        DECR    R7                              ; 5EC6   0017

        DECLE   $0000,  $0007,  $0180,  $0003   ; 5EC7   0000 0007 0180 0003
        DECLE   $0007,  $0000,  $0180,  $0003   ; 5ECB   0007 0000 0180 0003
        DECLE   $000F,  $0280,  $03A4,  $0024   ; 5ECF   000F 0280 03A4 0024
        DECLE   $0000                           ; 5ED3   0000

        AND@    R4,     R0                      ; 5ED4   03A0
        SUB@    R4,     R0                      ; 5ED5   0320
        DIS                                     ; 5ED6   0003
L_5ED7:
        DECR    R7                              ; 5ED7   0017

        DECLE   $0060,  $0000,  $0037,  $01A4   ; 5ED8   0060 0000 0037 01A4
        DECLE   $0304,  $0144,  $0264,  $0380   ; 5EDC   0304 0144 0264 0380
        DECLE   $0003,  $0027,  $00E0,  $0040   ; 5EE0   0003 0027 00E0 0040
        DECLE   $0000,  $0027                   ; 5EE4   0000 0027

        CLRR    R4                              ; 5EE6   01E4
        CMPR    R0,     R4                      ; 5EE7   0144
        TSTR    R4                              ; 5EE8   00A4
        AND@    R4,     R0                      ; 5EE9   03A0
        CMP     .STIC.X.3,R0                    ; 5EEA   0340 0003
L_5EEC:
        DECR    R7                              ; 5EEC   0017

        DECLE   $0003,  $02A0,  $0300,  $0140   ; 5EED   0003 02A0 0300 0140
        DECLE   $0003,  $0394,  $0108,  $0007   ; 5EF1   0003 0394 0108 0007
        DECLE   $0003,  $02E0,  $0300,  $000F   ; 5EF5   0003 02E0 0300 000F
        DECLE   $0140,  $0003,  $0007,  $02C0   ; 5EF9   0140 0003 0007 02C0
        DECLE   $0000,  $005F,  $0180,  $0010   ; 5EFD   0000 005F 0180 0010
        DECLE   $001F,  $00C0,  $0000           ; 5F01   001F 00C0 0000
L_5F04:
        DECR    R7                              ; 5F04   0017

        DECLE   $0388,  $0108,  $0007,  $0003   ; 5F05   0388 0108 0007 0003
        DECLE   $0080,  $0000,  $0007,  $03E4   ; 5F09   0080 0000 0007 03E4
        DECLE   $0344,  $0000,  $0160,  $0003   ; 5F0D   0344 0000 0160 0003
        DECLE   $0005                           ; 5F11   0005

        DECR    R0                              ; 5F12   0010
L_5F13:
        DECR    R7                              ; 5F13   0017

        DECLE   $0003,  $0060,  $0000           ; 5F14   0003 0060 0000

        SUBR    R1,     R0                      ; 5F17   0108
        INCR    R7                              ; 5F18   000F

        MOVR    R2,     R4                      ; 5F19   0094
L_5F1A:
        DIS                                     ; 5F1A   0003
        DECLE   $0080,  $0000                   ; 5F1B   0080 0000

        CLRR    R4                              ; 5F1D   01E4
        MVO     R4,     .STIC.X.0               ; 5F1E   0244 0000
        CMP@    R4,     R0                      ; 5F20   0360
        DIS                                     ; 5F21   0003
        ADCR    R7                              ; 5F22   002F

        ADDR    R0,     R0                      ; 5F23   00C0
L_5F24:
        XOR@    R1,     R0                      ; 5F24   03C8
        SUBR    R1,     R0                      ; 5F25   0108
L_5F26:
        DECR    R7                              ; 5F26   0017

        DECLE   $00B4,  $0003,  $0040,  $0000   ; 5F27   00B4 0003 0040 0000
        DECLE   $0044,  $0000,  $0010,  $003F   ; 5F2B   0044 0000 0010 003F

        XORR    R6,     R4                      ; 5F2F   01F4
        CMPR    R2,     R4                      ; 5F30   0154
        SUBR    R1,     R0                      ; 5F31   0108
L_5F32:
        DECR    R7                              ; 5F32   0017

        DECLE   $0094,  $0003,  $01D0,  $02C4   ; 5F33   0094 0003 01D0 02C4
        DECLE   $0000,  $0160,  $0003,  $004F   ; 5F37   0000 0160 0003 004F
        DECLE   $0174,  $0108,  $0007,  $0288   ; 5F3B   0174 0108 0007 0288
        DECLE   $0384,  $0003,  $0000,  $0007   ; 5F3F   0384 0003 0000 0007
        DECLE   $0360,  $0003,  $004F,  $01F4   ; 5F43   0360 0003 004F 01F4
        DECLE   $0314,  $0254,  $03C4,  $0003   ; 5F47   0314 0254 03C4 0003
        DECLE   $03B8,  $020C,  $004C,  $0003   ; 5F4B   03B8 020C 004C 0003
        DECLE   $006F,  $0080,  $0000,  $016C   ; 5F4F   006F 0080 0000 016C
        DECLE   $0001,  $02F8,  $0003,  $007F   ; 5F53   0001 02F8 0003 007F
        DECLE   $01F8,  $0318,  $0238           ; 5F57   01F8 0318 0238

        DIS                                     ; 5F5A   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F67   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F73   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F77   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F83   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F93   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 5FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5034       <entry>
;;  $503B       $5041  
;;  $5043       $505C  
;;  $5059       $5053  
;;  $505E       $5057  
;;  $5070       $5063  
;;  $5090       $5060  
;;  $50A2       $50A9  
;;  $50AC       $5066   $57A6  
;;  $50D1       $50DB  
;;  $50E1       $50B6  
;;  $50E3       $5111  
;;  $50EB       $50F7   $510A  
;;  $50FE       $5107  
;;  $510C       $50EE  
;;  $511B       $50B4  
;;  $5138       $50DD   $53C5  
;;  $5142       $513E  
;;  $5147       $5140  
;;  $514A       $5145  
;;  $5157       $5142  
;;  $518B       $5183  
;;  $518C       $5147  
;;  $5192       $51B1  
;;  $519D       $5197  
;;  $51AB       $519B   $51A7  
;;  $51B7       $51A2  
;;  $51BF       $51BC  
;;  $51C4       $51C1  
;;  $51CA       $51C5  
;;  $51D2       $51CC  
;;  $520D       $5202   $5206   $5249  
;;  $521B       $5218  
;;  $521D       $51F5   $520B  
;;  $521E       $51F8  
;;  $5245       $5226  
;;  $5246       $51FC  
;;  $524F       $51F0  
;;  $525E       <entry>
;;  $5261       $526F  
;;  $526D       $5264   $5266  
;;  $527E       $526B  
;;  $52A6       $5281   $5286  
;;  $52C0       $52B9   $52BD  
;;  $52CE       $52C2  
;;  $52CF       $52C7  
;;  $52E7       $52D5  
;;  $52F3       $52E2   $52E5  
;;  $52F5       $52D9   $52E9  
;;  $52F6       $52CB  
;;  $530C       $5306  
;;  $531C       $5304  
;;  $532A       $531A  
;;  $5341       $5443  
;;  $535A       $5349  
;;  $5361       $5358  
;;  $5368       $5361   $56B0   $56BF  
;;  $5376       $5456  
;;  $5381       $537E  
;;  $538D       $538A  
;;  $5399       $550F   $579C   $57AB  
;;  $539A       $5735   $574B  
;;  $53AB       $53B6  
;;  $53BE       $53A4  
;;  $53C9       $539A   $56BC  
;;  $53EB       $514D   $5242  
;;  $540F       $53C2   $57A3  
;;  $542F       $53DB  
;;  $5430       $5446   $544C  
;;  $5449       $5441  
;;  $5456       $543D  
;;  $545A       $544E  
;;  $54B1       $52AC   $52AE  
;;  $54E6       <entry>
;;  $54EF       $54E9  
;;  $54F1       $54ED  
;;  $5505       $54FD  
;;  $550A       $54F7  
;;  $5512       $5503   $5508   $550D  
;;  $5521       $551B  
;;  $5525       $551F  
;;  $553B       $5514  
;;  $5558       $5342  
;;  $556A       $5563  
;;  $556F       $555F  
;;  $5572       $5568   $556D  
;;  $5582       $556F  
;;  $5587       $556A  
;;  $5597       $5590  
;;  $559E       $558E  
;;  $55A6       $558A  
;;  $55AA       $5595   $559C   $55A4  
;;  $55AB       $5565  
;;  $55BB       $55B2  
;;  $55C1       $55AE  
;;  $55C7       $55B9   $55BF  
;;  $55C8       $5583   $5592   $5597   $559E   $55B4   $55BC   $55C1  
;;  $55DB       $55DF  
;;  $55E1       $55DB  
;;  $55F4       $557C  
;;  $5610       $5337  
;;  $5622       $552C  
;;  $5631       $5626  
;;  $5638       $562A   $562F   $5633  
;;  $5639       $562C  
;;  $5663       $5660  
;;  $5667       $5664  
;;  $567D       $5640   $5646   $564E   $5675  
;;  $567E       $552F  
;;  $568A       $5635  
;;  $5695       $53BB  
;;  $56B7       $56E2  
;;  $56CE       $56BA  
;;  $56CF       $550A   $5746  
;;  $56E6       $56D7   $56E0  
;;  $56E7       $56C5  
;;  $56F8       $5150  
;;  $570D       $5705  
;;  $5710       $570B  
;;  $5718       <entry>
;;  $572B       $5725  
;;  $5735       $5721  
;;  $5738       $5729   $5733  
;;  $574E       $573D   $5744  
;;  $5753       $5749  
;;  $5783       $577A  
;;  $578A       $5778  
;;  $578D       $5781   $5788  
;;  $5790       $579A  
;;  $57AB       $5793  
;;  $57AE       $575B   $5760   $57A9  
;;  $57B8       $578A   $57E8  
;;  $57C4       $53A6  
;;  $57D4       $5355  
;;  $57E7       $567A  
;;  $57EC       $5208   $524B   $5308   $56CB  
;;  $584E       $515F   $521E   $5290   $532E   $53EC   $5410   $5611   $5696  
;;  $584E       $56E8   $5755  
;;  $58AA       $58A8  
;;  $5A45       $50BC  
;;  $5A5F       $5A58  
;;  $5A76       $5A5B  
;;  $5A8A       $5043  
;;  $5AC9       $50BF   $5129   $514A   $5253   $5274   $5364   $56B3   $56C2  
;;  $5AD3       $5AEE  
;;  $5AE0       $5ADA  
;;  $5AF6       $520F   $5714  
;;  $5B61       $50C2  
;;  $5B81       $5B6A   $5B71  
;;  $5B82       $5B8C   $5B91  
;;  $5B8E       $5B87  
;;  $5B93       $5B83  
;;  $5B94       $5B89  
;;  $5BA8       $5B8E  
;;  $5BB0       $5BAA  
;;  $5BB2       $5BBA  
;;  $5BBC       $5BAC  
;;  $5BC8       $5BAE  
;;  $5BD1       $5BB0  
;;  $5BDB       $5BB6   $5BC6   $5BCF  
;;  $5BDE       $5BB2  
;;  $5BE8       $5BE2  
;;  $5BEA       $5BC8   $5BE4  
;;  $5BFE       $5BF2  
;;  $5C02       $5BFC  
;;  $5C05       $5BC3   $5BD8  
;;  $5C33       $5C33  
;;  $5C44       $5C42  
;;  $5C58       $5C56  
;;  $5C5E       $5C5C  
;;  $5C60       $5C60  
;;  $5C6A       $5C6A  
;;  $5C76       $5C74  
;;  $5C78       $5C78  
;;  $5C7D       $5C7B  
;;  $5C8C       $5C8A  
;;  $5C95       $5C95  
;;  $5CE1       $5E14  
;;  $5CFA       $5CF8  
;;  $5D06       $5D04  
;;  $5D12       $5D10  
;;  $5D21       $5D21  
;;  $5D3D       $5D3D  
;;  $5D45       $5D45  
;;  $5D50       $5D50  
;;  $5D66       $5D66  
;;  $5D72       $5D72  
;;  $5D7B       $5D7B  
;;  $5D9B       $5D9B  
;;  $5DC3       $5DC1  
;;  $5DCD       $5DCD  
;;  $5DF0       $5DEE  
;;  $5DFB       $5DF9  
;;  $5E14       $5E0B  
;;  $5E19       $5E17  
;;  $5E1D       $5E1B  
;;  $5E2E       $5E2C  
;;  $5E37       $5E37  
;;  $5E3B       $5E39  
;;  $5E61       $5E61  
;;  $5E65       $5E23  
;;  $5E7F       $5E7F  
;;  $5E8D       $5E8B  
;;  $5E95       $5E95  
;;  $5E9E       $5E9C  
;;  $5EA7       $5EA7  
;;  $5EAC       $5EAA  
;;  $5EB3       $5EB3  
;;  $5EBF       $5EBF  
;;  $5EC6       $5EC6  
;;  $5ED7       $5ED7  
;;  $5EEC       $5EEC  
;;  $5F04       $5F04  
;;  $5F13       $5F13  
;;  $5F1A       $5F18  
;;  $5F24       $5F22  
;;  $5F26       $5F26  
;;  $5F32       $5F32  
;; ======================================================================== ;;
