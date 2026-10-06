
        ORG     $5000
.HEADER:
        BIDECLE $5CB6           ; 5000  Ptr: MOB graphic images
        BIDECLE $5C98           ; 5002  Ptr: EXEC timer table
        BIDECLE $501C           ; 5004  Ptr: Start of game
        BIDECLE $5BAC           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5BBC           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5B0C           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init


        XORR    R6,     R0                      ; 5014   01F0
        XORR    R4,     R0                      ; 5015   01E0
        XORR    R2,     R0                      ; 5016   01D0
        CLRR    R0                              ; 5017   01C0
        ANDR    R6,     R0                      ; 5018   01B0
        ANDR    R4,     R0                      ; 5019   01A0
        ANDR    R2,     R0                      ; 501A   0190
        ANDR    R0,     R0                      ; 501B   0180
.START:
        MVII    #$02F1, R6                      ; 501C   02BE 02F1
        MVII    #$031D, R4                      ; 501E   02BC 031D
        MVII    #$0040, R0                      ; 5020   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 5022   0004 0114 0338

        MVII    #$0032, R1                      ; 5025   02B9 0032
        SWAP    R1,     1                       ; 5027   0041
        MVII    #$0200, R4                      ; 5028   02BC 0200
        MVII    #$00F0, R0                      ; 502A   02B8 00F0

        JSR     R5,     X_FILL_MEM              ; 502C   0004 0114 0341
        JSR     R5,     L_54DB                  ; 502F   0004 0154 00DB

        SDBD                                    ; 5032   0001
        MVII    #$3207, R3                      ; 5033   02BB 0007 0032
        MVII    #$023F, R4                      ; 5036   02BC 023F

        JSR     R5,     X_PRINT_R5              ; 5038   0004 0118 007B
        STRING  "LEVEL (1-4)?"                  ; 503B  
        DECLE   $0000                           ; 5047   0000

        SDBD                                    ; 5048   0001
        MVII    #$5CB2, R5                      ; 5049   02BD 00B2 005C
        MVO     R5,     G_035D                  ; 504C   0245 035D
        J       .EXEC.08F                       ; 504E   0004 0310 008F

        PSHR    R5                              ; 5051   0275
        DECR    R0                              ; 5052   0010
        MVO     R0,     G_015D                  ; 5053   0240 015D
        CMPI    #$0004, R0                      ; 5055   0378 0004
        BNC     L_505C                          ; 5057   0209 0003
        J       X_PLAY_RAZZ2                    ; 5059   0004 031C 02BD

L_505C:
        INCR    R0                              ; 505C   0008
        SLL     R0,     2                       ; 505D   004C
        SLL     R0,     1                       ; 505E   0048
        SDBD                                    ; 505F   0001
        ADDI    #$3287, R0                      ; 5060   02F8 0087 0032
        MVO     R0,     .BTAB.4C                ; 5063   0240 024C
        CLRR    R0                              ; 5065   01C0
        MVII    #$000A, R1                      ; 5066   02B9 000A
        B       L_50ED                          ; 5068   0200 0083

        MVII    #$015E, R4                      ; 506A   02BC 015E
        MVII    #$0088, R0                      ; 506C   02B8 0088

        JSR     R5,     X_FILL_ZERO             ; 506E   0004 0114 0338

        SDBD                                    ; 5071   0001
        MVII    #$1906, R5                      ; 5072   02BD 0006 0019
        MVO     R5,     G_035D                  ; 5075   0245 035D
        SDBD                                    ; 5077   0001
        MVII    #$63E9, R2                      ; 5078   02BA 00E9 0063

        JSRD    R5,     L_5B96                  ; 507B   0004 015A 0396

        SDBD                                    ; 507E   0001
        MVII    #$6E27, R4                      ; 507F   02BC 0027 006E

        JSR     R5,     L_5ADF                  ; 5082   0004 0158 02DF
        JSR     R5,     L_57E6                  ; 5085   0004 0154 03E6

        MVII    #$0001, R0                      ; 5088   02B8 0001
        MVO     R0,     G_0164                  ; 508A   0240 0164
        MVO     R0,     G_0193                  ; 508C   0240 0193
        INCR    R0                              ; 508E   0008
        MVO     R0,     G_0182                  ; 508F   0240 0182
        MVO     R0,     G_0176                  ; 5091   0240 0176
        MVO     R0,     G_015F                  ; 5093   0240 015F
        MVO     R0,     G_0187                  ; 5095   0240 0187
        MVII    #$0038, R0                      ; 5097   02B8 0038
        MVO     R0,     G_0181                  ; 5099   0240 0181
        MVO     R0,     G_0197                  ; 509B   0240 0197
        MVII    #$031D, R2                      ; 509D   02BA 031D
L_509F:
        MVII    #$0001, R0                      ; 509F   02B8 0001
        SDBD                                    ; 50A1   0001
        MVII    #$54EC, R1                      ; 50A2   02B9 00EC 0054

        JSR     R5,     X_INIT_MOBS             ; 50A5   0004 0114 02B4

        ADDI    #$0008, R2                      ; 50A8   02FA 0008
        CMPI    #$034D, R2                      ; 50AA   037A 034D
        BNEQ    L_509F                          ; 50AC   022C 000E

        MVII    #$0055, R2                      ; 50AE   02BA 0055
        SWAP    R2,     1                       ; 50B0   0042
        MVII    #$0320, R1                      ; 50B1   02B9 0320
        MVO@    R2,     R1                      ; 50B3   024A
        MVII    #$0328, R1                      ; 50B4   02B9 0328
        MVO@    R2,     R1                      ; 50B6   024A
        SDBD                                    ; 50B7   0001
        MVII    #$5510, R3                      ; 50B8   02BB 0010 0055
        MVII    #$031D, R1                      ; 50BB   02B9 031D

        JSR     R5,     L_50C6                  ; 50BD   0004 0150 00C6
        DECLE   $0002,  $0054,  $0006,  $003A   ; 50C0   0002 0054 0006 003A
        DECLE   $0001                           ; 50C4   0001

        SAR     R0,     2                       ; 50C5   006C
L_50C6:
        MVI@    R5,     R2                      ; 50C6   02AA
        ADD@    R1,     R2                      ; 50C7   02CA
        MVO@    R2,     R1                      ; 50C8   024A
        MVI@    R5,     R2                      ; 50C9   02AA
        SWAP    R2,     1                       ; 50CA   0042
        ADDI    #$0002, R1                      ; 50CB   02F9 0002
        MVO@    R2,     R1                      ; 50CD   024A
        ADDI    #$0007, R1                      ; 50CE   02F9 0007
        MVO@    R3,     R1                      ; 50D0   024B
        INCR    R1                              ; 50D1   0009
        MVO@    R2,     R1                      ; 50D2   024A
        ADDI    #$0006, R1                      ; 50D3   02F9 0006
        CMPI    #$034D, R1                      ; 50D5   0379 034D
        BNEQ    L_50C6                          ; 50D7   022C 0012

        MVII    #$0005, R0                      ; 50D9   02B8 0005
        MVO     R0,     G_0170                  ; 50DB   0240 0170

        JSR     R5,     L_59EE                  ; 50DD   0004 0158 01EE
        JSR     R5,     L_5C06                  ; 50E0   0004 015C 0006

        MVII    #$0001, R0                      ; 50E3   02B8 0001
        MVO     R0,     G_016F                  ; 50E5   0240 016F
        MVII    #$0002, R0                      ; 50E7   02B8 0002
        MVII    #$0014, R1                      ; 50E9   02B9 0014
        INCR    R7                              ; 50EB   000F

L_50EC:
        PSHR    R5                              ; 50EC   0275
L_50ED:
        MVO     R0,     G_0194                  ; 50ED   0240 0194
        MVO     R1,     G_0195                  ; 50EF   0241 0195

        JSR     R5,     L_54DB                  ; 50F1   0004 0154 00DB

        SUBI    #$0004, R1                      ; 50F4   0339 0004
        J       .EXEC.81F                       ; 50F6   0004 0318 001F

L_50F9:
        PSHR    R5                              ; 50F9   0275
        MVI     G_0195, R0                      ; 50FA   0280 0195
        DECR    R0                              ; 50FC   0010
        MVO     R0,     G_0195                  ; 50FD   0240 0195
        BNEQ    L_522C                          ; 50FF   020C 012B

        MVI     G_0194, R0                      ; 5101   0280 0194

        JSR     R5,     L_5114                  ; 5103   0004 0150 0114

        SAR     R2,     1                       ; 5106   006A
        RLC     R0,     1                       ; 5107   0050
        COMR    R0                              ; 5108   0018
        RLC     R1,     1                       ; 5109   0051
        SARC    R0,     2                       ; 510A   007C
        RLC     R2,     2                       ; 510B   0056
        MOVR    R4,     R0                      ; 510C   00A0
        RLC     R2,     2                       ; 510D   0056
        GSWD    R3                              ; 510E   0033
        RLC     R2,     2                       ; 510F   0056
        ADCR    R3                              ; 5110   002B
        RLC     R1,     1                       ; 5111   0051
        MOVR    R0,     R2                      ; 5112   0082
        RLC     R2,     2                       ; 5113   0056
L_5114:
        ADDR    R0,     R5                      ; 5114   00C5
        SDBD                                    ; 5115   0001
        MVI@    R5,     R4                      ; 5116   02AC
        MOVR    R4,     R7                      ; 5117   00A7

        MVII    #$0014, R0                      ; 5118   02B8 0014
        MVO     R0,     G_0195                  ; 511A   0240 0195

        JSR     R5,     L_55F4                  ; 511C   0004 0154 01F4

        BNEQ    L_522C                          ; 511F   020C 010B

        JSR     R5,     L_512F                  ; 5121   0004 0150 012F

        MVII    #$0064, R0                      ; 5124   02B8 0064
        MVO     R0,     G_0170                  ; 5126   0240 0170
        J       L_5C07                          ; 5128   0004 035C 0007

        JSR     R5,     L_5BEC                  ; 512B   0004 0158 03EC

        INCR    R7                              ; 512E   000F

L_512F:
        PSHR    R5                              ; 512F   0275
L_5130:
        SDBD                                    ; 5130   0001
        MVII    #$5C98, R1                      ; 5131   02B9 0098 005C
        MOVR    R1,     R2                      ; 5134   008A
        ADDI    #$0014, R2                      ; 5135   02FA 0014

L_5137:
        JSR     R5,     .EXEC.81E               ; 5137   0004 0118 001E

        ADDI    #$0004, R1                      ; 513A   02F9 0004
        CMPR    R1,     R2                      ; 513C   014A
        BNEQ    L_5137                          ; 513D   022C 0007

        MOVR    R2,     R1                      ; 513F   0091
        J       .EXEC.839                       ; 5140   0004 0318 0039

L_5143:
        PSHR    R5                              ; 5143   0275
        MVI     G_018C, R0                      ; 5144   0280 018C
        DECR    R0                              ; 5146   0010
        BMI     L_514F                          ; 5147   020B 0006

        MVO     R0,     G_018C                  ; 5149   0240 018C
        MVI     G_018D, R0                      ; 514B   0280 018D
        B       L_51AD                          ; 514D   0200 005E

L_514F:
        MVI     G_0179, R5                      ; 514F   0285 0179
        ANDR    R5,     R5                      ; 5151   01AD
        BNEQ    L_522C                          ; 5152   020C 00D8

        MVI     .PSG0.rgt_hand,R0               ; 5154   0280 01FE
        ANDI    #$001F, R0                      ; 5156   03B8 001F
        MVII    #$000F, R1                      ; 5158   02B9 000F

        JSR     R4,     L_516D                  ; 515A   0004 0050 016D
        DECLE   $001D                           ; 515D   001D

        COMR    R1                              ; 515E   0019
        INCR    R1                              ; 515F   0009
        INCR    R3                              ; 5160   000B
        COMR    R3                              ; 5161   001B
        DECR    R3                              ; 5162   0013
        DIS                                     ; 5163   0003
        SETC                                    ; 5164   0007
L_5165:
        DECR    R7                              ; 5165   0017

        DECR    R6                              ; 5166   0016
        CLRC                                    ; 5167   0006
        INCR    R6                              ; 5168   000E
        COMR    R6                              ; 5169   001E
        COMR    R4                              ; 516A   001C
        INCR    R4                              ; 516B   000C
        INCR    R5                              ; 516C   000D
L_516D:
        CMP@    R4,     R0                      ; 516D   0360
        BEQ     L_51E6                          ; 516E   0204 0076

        DECR    R1                              ; 5170   0011
        BPL     L_516D                          ; 5171   0223 0005

        MVI     G_019B, R0                      ; 5173   0280 019B
        DECR    R0                              ; 5175   0010
        BMI     L_517A                          ; 5176   020B 0002

        MVO     R0,     G_019B                  ; 5178   0240 019B
L_517A:
        MVI     G_0180, R0                      ; 517A   0280 0180
        CMPI    #$0007, R0                      ; 517C   0378 0007
        BNEQ    L_522C                          ; 517E   020C 00AC

        MVI     G_018A, R0                      ; 5180   0280 018A
        ANDR    R0,     R0                      ; 5182   0180
        BNEQ    L_51A1                          ; 5183   020C 001C

        MVI     G_018B, R0                      ; 5185   0280 018B
        DECR    R0                              ; 5187   0010
        BMI     L_522C                          ; 5188   020B 00A2

        MVO     R0,     G_018B                  ; 518A   0240 018B
        BNEQ    L_522C                          ; 518C   020C 009E

        MVII    #$0005, R0                      ; 518E   02B8 0005
        MVO     R0,     G_018B                  ; 5190   0240 018B
        MVI     G_0190, R0                      ; 5192   0280 0190
        MVII    #$031D, R1                      ; 5194   02B9 031D

        JSR     R5,     .EXEC.777               ; 5196   0004 0114 0377

        INCR    R2                              ; 5199   000A
        ANDR    R0,     R0                      ; 519A   0180
        BEQ     L_51C1                          ; 519B   0204 0024

        SUBI    #$0002, R2                      ; 519D   033A 0002
        B       L_51C1                          ; 519F   0200 0020

L_51A1:
        DECR    R0                              ; 51A1   0010
        MVO     R0,     G_018A                  ; 51A2   0240 018A

        JSR     R5,     L_58CF                  ; 51A4   0004 0158 00CF

        MVII    #$0005, R0                      ; 51A7   02B8 0005
        MVO     R0,     G_018B                  ; 51A9   0240 018B
        MVI     G_0190, R0                      ; 51AB   0280 0190
L_51AD:
        MVII    #$0004, R5                      ; 51AD   02BD 0004
        MVO     R5,     G_0199                  ; 51AF   0245 0199
        INCR    R7                              ; 51B1   000F

L_51B2:
        PSHR    R5                              ; 51B2   0275
L_51B3:
        MVII    #$031D, R1                      ; 51B3   02B9 031D

        JSR     R5,     .EXEC.777               ; 51B5   0004 0114 0377

        ADD     G_0199, R2                      ; 51B8   02C2 0199
        ANDR    R0,     R0                      ; 51BA   0180
        BEQ     L_51C1                          ; 51BB   0204 0004

        SUB     G_0199, R2                      ; 51BD   0302 0199
        SUB     G_0199, R2                      ; 51BF   0302 0199
L_51C1:
        MVO     R0,     G_0190                  ; 51C1   0240 0190
L_51C3:
        PSHR    R2                              ; 51C3   0272
        PSHR    R3                              ; 51C4   0273

        JSR     R5,     L_51CE                  ; 51C5   0004 0150 01CE

        PULR    R3                              ; 51C8   02B3
        PULR    R2                              ; 51C9   02B2
        ADDI    #$0004, R4                      ; 51CA   02FC 0004
        PULR    R5                              ; 51CC   02B5
        INCR    R7                              ; 51CD   000F

L_51CE:
        MOVR    R1,     R4                      ; 51CE   008C
L_51CF:
        ADDI    #$0002, R4                      ; 51CF   02FC 0002
        SWAP    R2,     1                       ; 51D1   0042
        MVO@    R2,     R4                      ; 51D2   0262
        SWAP    R3,     1                       ; 51D3   0043
        MVO@    R3,     R4                      ; 51D4   0263
        MOVR    R5,     R7                      ; 51D5   00AF

        DECLE   $0000,  $0008,  $000C,  $0010   ; 51D6   0000 0008 000C 0010
        DECLE   $0014,  $0014,  $0014,  $0014   ; 51DA   0014 0014 0014 0014
        DECLE   $0000                           ; 51DE   0000

        DECR    R5                              ; 51DF   0015
        DECR    R5                              ; 51E0   0015
        DECR    R5                              ; 51E1   0015
        DECR    R5                              ; 51E2   0015
        DECR    R1                              ; 51E3   0011
        INCR    R5                              ; 51E4   000D
        INCR    R1                              ; 51E5   0009
L_51E6:
        MVI     G_019A, R3                      ; 51E6   0283 019A
        DECLE   $0282,  $019C,  $0241,  $019C   ; 51E8   0282 019C 0241 019C
        DECLE   $0111,  $03B9,  $000F,  $0001   ; 51EC   0111 03B9 000F 0001

        ADDI    #$00D6, R1                      ; 51F0   02F9 00D6
        RLC     R1,     1                       ; 51F2   0051
        MVI@    R1,     R2                      ; 51F3   028A
        MVI     G_019B, R5                      ; 51F4   0285 019B
        MVII    #$0002, R0                      ; 51F6   02B8 0002
        MVO     R0,     G_019B                  ; 51F8   0240 019B
        CLRR    R0                              ; 51FA   01C0
        MVO     R0,     G_019A                  ; 51FB   0240 019A
        INCR    R0                              ; 51FD   0008
        SARC    R2,     1                       ; 51FE   007A
        BNC     L_5202                          ; 51FF   0209 0001

        INCR    R0                              ; 5201   0008
L_5202:
        TSTR    R2                              ; 5202   0092
        BEQ     L_517A                          ; 5203   0224 008A

        TSTR    R5                              ; 5205   00AD
        BEQ     L_517A                          ; 5206   0224 008D

        TSTR    R3                              ; 5208   009B
        BEQ     L_520E                          ; 5209   0204 0003

        CMPR    R0,     R3                      ; 520B   0143
        BNEQ    L_517A                          ; 520C   022C 0093

L_520E:
        MVO     R0,     G_019A                  ; 520E   0240 019A
        DECR    R0                              ; 5210   0010
        MVO     R2,     G_0199                  ; 5211   0242 0199

        JSR     R5,     L_51B2                  ; 5213   0004 0150 01B2
        JSR     R5,     L_5BBF                  ; 5216   0004 0158 03BF

        MVII    #$0038, R0                      ; 5219   02B8 0038
        MVO     R0,     G_0197                  ; 521B   0240 0197
        MVI     G_0180, R0                      ; 521D   0280 0180
        CMPI    #$0007, R0                      ; 521F   0378 0007
        BNEQ    L_522C                          ; 5221   020C 0009

        MVII    #$0003, R1                      ; 5223   02B9 0003
        ADD     G_015D, R1                      ; 5225   02C1 015D
        MVO     R1,     G_018A                  ; 5227   0241 018A
        CLRR    R0                              ; 5229   01C0
        MVO     R0,     G_018B                  ; 522A   0240 018B
L_522C:
        PULR    R7                              ; 522C   02B7

L_522D:
        PSHR    R5                              ; 522D   0275

        JSR     R5,     L_57BD                  ; 522E   0004 0154 03BD
        JSR     R5,     L_5143                  ; 5231   0004 0150 0143

        MVI     G_0192, R5                      ; 5234   0285 0192
        ANDR    R5,     R5                      ; 5236   01AD
        BNEQ    L_5350                          ; 5237   020C 0117
        INCR    R7                              ; 5239   000F

L_523A:
        PSHR    R5                              ; 523A   0275
L_523B:
        MVII    #$032D, R1                      ; 523B   02B9 032D

        JSR     R5,     L_5248                  ; 523D   0004 0150 0248

        MVII    #$033D, R1                      ; 5240   02B9 033D

        JSR     R5,     L_5248                  ; 5242   0004 0150 0248

        MVII    #$034D, R1                      ; 5245   02B9 034D
        INCR    R7                              ; 5247   000F

L_5248:
        PSHR    R5                              ; 5248   0275
L_5249:
        MOVR    R1,     R4                      ; 5249   008C
        INCR    R4                              ; 524A   000C
        MVI@    R4,     R5                      ; 524B   02A5
        ANDR    R5,     R5                      ; 524C   01AD
        BEQ     L_522C                          ; 524D   0224 0022

        SDBD                                    ; 524F   0001
        CMPI    #$54F8, R5                      ; 5250   037D 00F8 0054
        BEQ     L_522C                          ; 5253   0224 0028

        MVI     G_018F, R2                      ; 5255   0282 018F
        SWAP    R2,     1                       ; 5257   0042
        ADD     G_018E, R2                      ; 5258   02C2 018E
        SDBD                                    ; 525A   0001
        CMPI    #$556A, R5                      ; 525B   037D 006A 0055
        BNC     L_5267                          ; 525E   0209 0007

        MVI     G_016C, R2                      ; 5260   0282 016C
        SLL     R2,     2                       ; 5262   004E
        SLL     R2,     2                       ; 5263   004E
        SLL     R2,     2                       ; 5264   004E
        ADDI    #$00C0, R2                      ; 5265   02FA 00C0
L_5267:
        INCR    R4                              ; 5267   000C
L_5268:
        MVI@    R4,     R3                      ; 5268   02A3
        ADDR    R2,     R3                      ; 5269   00D3
        SDBD                                    ; 526A   0001
        CMPI    #$3500, R3                      ; 526B   037B 0000 0035
        BNC     L_533A                          ; 526E   0209 00CA

        SDBD                                    ; 5270   0001
        CMPI    #$6000, R3                      ; 5271   037B 0000 0060
        BC      L_533A                          ; 5274   0201 00C4

L_5276:
        JSR     R5,     L_53E5                  ; 5276   0004 0150 03E5
        JSR     R5,     L_5577                  ; 5279   0004 0154 0177

        ADDI    #$0004, R4                      ; 527C   02FC 0004

        JSR     R5,     L_5578                  ; 527E   0004 0154 0178
        JSR     R5,     .EXEC.777               ; 5281   0004 0114 0377

        MOVR    R1,     R5                      ; 5284   008D
        INCR    R5                              ; 5285   000D
        MVI@    R5,     R4                      ; 5286   02AC
        SDBD                                    ; 5287   0001
        CMPI    #$556A, R4                      ; 5288   037C 006A 0055
        BC      L_52EB                          ; 528B   0201 005E

        SDBD                                    ; 528D   0001
        CMPI    #$5546, R4                      ; 528E   037C 0046 0055
        BC      L_5306                          ; 5291   0201 0073

        CLRR    R0                              ; 5293   01C0
        CMPI    #$0039, R3                      ; 5294   037B 0039
        BNC     L_52A8                          ; 5296   0209 0010

        INCR    R0                              ; 5298   0008
        CMPI    #$0044, R3                      ; 5299   037B 0044
        BNC     L_52A8                          ; 529B   0209 000B

        INCR    R0                              ; 529D   0008
        CMPI    #$004F, R3                      ; 529E   037B 004F
        BNC     L_52A8                          ; 52A0   0209 0006

        INCR    R0                              ; 52A2   0008
        CMPI    #$0054, R3                      ; 52A3   037B 0054
        BNC     L_52A8                          ; 52A5   0209 0001

        INCR    R0                              ; 52A7   0008
L_52A8:
        SLL     R0,     2                       ; 52A8   004C

L_52A9:
        JSR     R5,     L_52C4                  ; 52A9   0004 0150 02C4

        MOVR    R1,     R0                      ; 52AC   0088
        DECR    R0                              ; 52AD   0010
        RSWD    R2                              ; 52AE   003A
        RLC     R1,     2                       ; 52AF   0055
        MOVR    R1,     R0                      ; 52B0   0088
        DECR    R0                              ; 52B1   0010
        ADCR    R6                              ; 52B2   002E
        RLC     R1,     2                       ; 52B3   0055
        MOVR    R1,     R0                      ; 52B4   0088
        DECR    R0                              ; 52B5   0010
        NEGR    R2                              ; 52B6   0022
        RLC     R1,     2                       ; 52B7   0055
        MOVR    R1,     R0                      ; 52B8   0088
        GSWD    R0                              ; 52B9   0030
        DECR    R6                              ; 52BA   0016
        RLC     R1,     2                       ; 52BB   0055
        MOVR    R1,     R0                      ; 52BC   0088
        GSWD    R0                              ; 52BD   0030
        INCR    R2                              ; 52BE   000A
        RLC     R1,     2                       ; 52BF   0055
        MOVR    R1,     R0                      ; 52C0   0088
        GSWD    R0                              ; 52C1   0030
        ADDR    R7,     R6                      ; 52C2   00FE
        RLC     R0,     2                       ; 52C3   0054
L_52C4:
        ADDR    R0,     R5                      ; 52C4   00C5
        SDBD                                    ; 52C5   0001
        MVI@    R5,     R2                      ; 52C6   02AA
        SDBD                                    ; 52C7   0001
        MVI@    R5,     R3                      ; 52C8   02AB
        MOVR    R1,     R4                      ; 52C9   008C
        MVI@    R1,     R5                      ; 52CA   028D
        ANDI    #$0017, R5                      ; 52CB   03BD 0017
        ADDR    R2,     R5                      ; 52CD   00D5
        MVO@    R5,     R4                      ; 52CE   0265
        MVO@    R3,     R4                      ; 52CF   0263
        ADDI    #$0006, R4                      ; 52D0   02FC 0006
        MVI     G_0180, R0                      ; 52D2   0280 0180
        CMPI    #$0006, R0                      ; 52D4   0378 0006
        BNEQ    L_52D9                          ; 52D6   020C 0001

        INCR    R2                              ; 52D8   000A
L_52D9:
        MVO@    R2,     R4                      ; 52D9   0262
        ADDI    #$0006, R3                      ; 52DA   02FB 0006
        MVO@    R3,     R4                      ; 52DC   0263
        PULR    R7                              ; 52DD   02B7

L_52DE:
        CLRR    R0                              ; 52DE   01C0
        CMPI    #$0040, R3                      ; 52DF   037B 0040
        BNC     L_52E9                          ; 52E1   0209 0006

        INCR    R0                              ; 52E3   0008
        CMPI    #$004D, R3                      ; 52E4   037B 004D
        BNC     L_52E9                          ; 52E6   0209 0001

        INCR    R0                              ; 52E8   0008
L_52E9:
        SLL     R0,     2                       ; 52E9   004C
        MOVR    R5,     R7                      ; 52EA   00AF

L_52EB:
        JSR     R5,     L_52DE                  ; 52EB   0004 0150 02DE
        JSR     R5,     L_52FD                  ; 52EE   0004 0150 02FD

        INCR    R0                              ; 52F1   0008
        DECR    R0                              ; 52F2   0010
        SAR     R2,     1                       ; 52F3   006A
        RLC     R1,     2                       ; 52F4   0055
        INCR    R0                              ; 52F5   0008
        DECR    R0                              ; 52F6   0010
        RRC     R0,     1                       ; 52F7   0070
        RLC     R1,     2                       ; 52F8   0055
        MOVR    R1,     R0                      ; 52F9   0088
        GSWD    R0                              ; 52FA   0030
        RRC     R0,     1                       ; 52FB   0070
        RLC     R1,     2                       ; 52FC   0055
L_52FD:
        ADDR    R0,     R5                      ; 52FD   00C5
        SDBD                                    ; 52FE   0001
        MVI@    R5,     R2                      ; 52FF   02AA
        SDBD                                    ; 5300   0001
        MVI@    R5,     R3                      ; 5301   02AB
        MOVR    R1,     R4                      ; 5302   008C
        MVO@    R2,     R4                      ; 5303   0262
        MVO@    R3,     R4                      ; 5304   0263
        PULR    R7                              ; 5305   02B7

L_5306:
        JSR     R5,     L_52DE                  ; 5306   0004 0150 02DE
        JSR     R5,     .EXEC.777               ; 5309   0004 0114 0377

        MVII    #$033D, R1                      ; 530C   02B9 033D

        JSR     R5,     L_51CE                  ; 530E   0004 0150 01CE
        JSR     R5,     L_5320                  ; 5311   0004 0150 0320

        INCR    R2                              ; 5314   000A
        DECR    R0                              ; 5315   0010
        SLLC    R0,     1                       ; 5316   0058
        RLC     R1,     2                       ; 5317   0055
        INCR    R2                              ; 5318   000A
        DECR    R0                              ; 5319   0010
        SWAP    R2,     2                       ; 531A   0046
        RLC     R1,     2                       ; 531B   0055
        MOVR    R1,     R2                      ; 531C   008A
        GSWD    R0                              ; 531D   0030
        SWAP    R2,     2                       ; 531E   0046
        RLC     R1,     2                       ; 531F   0055
L_5320:
        ADDR    R0,     R5                      ; 5320   00C5
        SDBD                                    ; 5321   0001
        MVI@    R5,     R2                      ; 5322   02AA
        SDBD                                    ; 5323   0001
        MVI@    R5,     R3                      ; 5324   02AB
        MVII    #$032D, R4                      ; 5325   02BC 032D
        MVO@    R2,     R4                      ; 5327   0262
        MVO@    R3,     R4                      ; 5328   0263
        ADDI    #$0006, R4                      ; 5329   02FC 0006
        ADDI    #$0005, R2                      ; 532B   02FA 0005
        MVO@    R2,     R4                      ; 532D   0262
        ADDI    #$0006, R3                      ; 532E   02FB 0006
        MVO@    R3,     R4                      ; 5330   0263
        ADDI    #$0006, R4                      ; 5331   02FC 0006
        SUBI    #$0007, R2                      ; 5333   033A 0007
        MVO@    R2,     R4                      ; 5335   0262
        ADDI    #$0006, R3                      ; 5336   02FB 0006
        MVO@    R3,     R4                      ; 5338   0263
        PULR    R7                              ; 5339   02B7

L_533A:
        SDBD                                    ; 533A   0001
        MVII    #$54F8, R5                      ; 533B   02BD 00F8 0054
        MVII    #$0002, R2                      ; 533E   02BA 0002
        INCR    R1                              ; 5340   0009
        MVO@    R5,     R1                      ; 5341   024D
        ADDI    #$0005, R1                      ; 5342   02F9 0005
        MVO@    R2,     R1                      ; 5344   024A
        ADDI    #$0003, R1                      ; 5345   02F9 0003
        MVO@    R5,     R1                      ; 5347   024D
L_5348:
        PULR    R7                              ; 5348   02B7

        INCR    R1                              ; 5349   0009
        CLRR    R2                              ; 534A   01D2
        MVO@    R2,     R1                      ; 534B   024A
        ADDI    #$0008, R1                      ; 534C   02F9 0008
        MVO@    R2,     R1                      ; 534E   024A
        MOVR    R5,     R7                      ; 534F   00AF

L_5350:
        MVI     G_0191, R0                      ; 5350   0280 0191
        CMPI    #$0003, R0                      ; 5352   0378 0003
        BC      L_5359                          ; 5354   0201 0003

        JSR     R5,     L_523A                  ; 5356   0004 0150 023A

L_5359:
        CMPI    #$0003, R0                      ; 5359   0378 0003
        BNEQ    L_5362                          ; 535B   020C 0005

        MVII    #$034D, R1                      ; 535D   02B9 034D

        JSR     R5,     L_5248                  ; 535F   0004 0150 0248

L_5362:
        MVI     G_0192, R5                      ; 5362   0285 0192
        DECR    R5                              ; 5364   0015
        MVO     R5,     G_0192                  ; 5365   0245 0192
        BNEQ    L_5348                          ; 5367   022C 0020

        MVII    #$032D, R1                      ; 5369   02B9 032D
        MVI     G_0191, R0                      ; 536B   0280 0191
        DECR    R0                              ; 536D   0010
        SLL     R0,     1                       ; 536E   0048

        JSR     R5,     L_5378                  ; 536F   0004 0150 0378

        SARC    R0,     2                       ; 5372   007C
        RLC     R3,     1                       ; 5373   0053
        MOVR    R1,     R4                      ; 5374   008C
        RLC     R3,     1                       ; 5375   0053
        MOVR    R6,     R1                      ; 5376   00B1
        RLC     R3,     1                       ; 5377   0053
L_5378:
        ADDR    R0,     R5                      ; 5378   00C5
        SDBD                                    ; 5379   0001
        MVI@    R5,     R4                      ; 537A   02AC
        MOVR    R4,     R7                      ; 537B   00A7

        MVII    #$0002, R0                      ; 537C   02B8 0002
        MVO     R0,     G_0191                  ; 537E   0240 0191

        JSR     R5,     L_5BBF                  ; 5380   0004 0158 03BF

        ANDI    #$003F, R0                      ; 5383   03B8 003F
        ADDI    #$000A, R0                      ; 5385   02F8 000A
        MVO     R0,     G_0192                  ; 5387   0240 0192

        JSR     R5,     L_5BF2                  ; 5389   0004 0158 03F2

        MVII    #$0001, R0                      ; 538C   02B8 0001
        MVO     R0,     G_0192                  ; 538E   0240 0192
        MOVR    R1,     R4                      ; 5390   008C
        INCR    R4                              ; 5391   000C
L_5392:
        MVI@    R4,     R0                      ; 5392   02A0
        ANDR    R0,     R0                      ; 5393   0180
        BNEQ    L_5348                          ; 5394   022C 004D

        ADDI    #$000F, R4                      ; 5396   02FC 000F
        CMPI    #$035E, R4                      ; 5398   037C 035E
        BNEQ    L_5392                          ; 539A   022C 0009

        MVII    #$0003, R0                      ; 539C   02B8 0003
        MVO     R0,     G_0191                  ; 539E   0240 0191
        MVII    #$0001, R0                      ; 53A0   02B8 0001
        MVO     R0,     G_0175                  ; 53A2   0240 0175
        MVO     R0,     G_0176                  ; 53A4   0240 0176
        SDBD                                    ; 53A6   0001
        MVII    #$5546, R5                      ; 53A7   02BD 0046 0055
        MVO     R5,     G_032E                  ; 53AA   0245 032E
        MVII    #$005F, R3                      ; 53AC   02BB 005F
        SWAP    R3,     1                       ; 53AE   0043
        B       L_5276                          ; 53AF   0220 013A

        MVII    #$0001, R0                      ; 53B1   02B8 0001
        MVO     R0,     G_0192                  ; 53B3   0240 0192

        JSR     R5,     .EXEC.777               ; 53B5   0004 0114 0377

        CMPI    #$0037, R3                      ; 53B8   037B 0037
        BC      L_53D1                          ; 53BA   0201 0015

        CLRR    R0                              ; 53BC   01C0
        MVO     R0,     G_0192                  ; 53BD   0240 0192
        MVII    #$0004, R0                      ; 53BF   02B8 0004
        MVO     R0,     G_0191                  ; 53C1   0240 0191

        JSR     R5,     L_5C54                  ; 53C3   0004 015C 0054

        MVII    #$033D, R1                      ; 53C6   02B9 033D

        JSR     R5,     L_53CE                  ; 53C8   0004 0150 03CE

        MVII    #$032D, R1                      ; 53CB   02B9 032D
        INCR    R7                              ; 53CD   000F

L_53CE:
        PSHR    R5                              ; 53CE   0275
L_53CF:
        B       L_533A                          ; 53CF   0220 0096

L_53D1:
        CMPI    #$004E, R3                      ; 53D1   037B 004E
        BNEQ    L_53DE                          ; 53D3   020C 0009

        JSR     R5,     L_5BBF                  ; 53D5   0004 0158 03BF

        ANDI    #$003F, R0                      ; 53D8   03B8 003F
        ADDI    #$000A, R0                      ; 53DA   02F8 000A
        MVO     R0,     G_0192                  ; 53DC   0240 0192
L_53DE:
        MVII    #$00E8, R2                      ; 53DE   02BA 00E8
        NEGR    R2                              ; 53E0   0022
        MVII    #$0330, R4                      ; 53E1   02BC 0330
        B       L_5268                          ; 53E3   0220 017C

L_53E5:
        MOVR    R3,     R2                      ; 53E5   009A
        SWAP    R2,     1                       ; 53E6   0042
        ANDI    #$00FF, R2                      ; 53E7   03BA 00FF

        JSR     R4,     L_5498                  ; 53E9   0004 0054 0098
        DECLE   $0050,  $004F,  $004E,  $004E   ; 53EC   0050 004F 004E 004E
        DECLE   $004D,  $004C,  $004C,  $004B   ; 53F0   004D 004C 004C 004B
        DECLE   $004B,  $004A,  $0049,  $0049   ; 53F4   004B 004A 0049 0049
        DECLE   $0048,  $0048,  $0047,  $0046   ; 53F8   0048 0048 0047 0046
        DECLE   $0046,  $0045,  $0045,  $0044   ; 53FC   0046 0045 0045 0044
        DECLE   $0044,  $0043,  $0043,  $0042   ; 5400   0044 0043 0043 0042
        DECLE   $0042,  $0042,  $0041,  $0040   ; 5404   0042 0042 0041 0040
        DECLE   $003F,  $003E,  $003E,  $003D   ; 5408   003F 003E 003E 003D
        DECLE   $003C,  $003B,  $003B,  $003A   ; 540C   003C 003B 003B 003A
        DECLE   $003A,  $0039,  $0038,  $0038   ; 5410   003A 0039 0038 0038
        DECLE   $0037,  $0037,  $0036,  $0058   ; 5414   0037 0037 0036 0058
        DECLE   $0056,  $0054,  $0053,  $0051   ; 5418   0056 0054 0053 0051
        DECLE   $0050,  $004F,  $004D,  $004C   ; 541C   0050 004F 004D 004C
        DECLE   $004B,  $004A,  $0049,  $0048   ; 5420   004B 004A 0049 0048
        DECLE   $0047,  $0046,  $0045,  $0044   ; 5424   0047 0046 0045 0044
        DECLE   $0044,  $0043,  $0042,  $0042   ; 5428   0044 0043 0042 0042
        DECLE   $0041,  $0041,  $0041,  $0040   ; 542C   0041 0041 0041 0040
        DECLE   $0040,  $0040,  $0040,  $003F   ; 5430   0040 0040 0040 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5434   003F 003F 003F 003F
        DECLE   $003F,  $003F                   ; 5438   003F 003F

        SWAP    R0,     1                       ; 543A   0040
        SWAP    R0,     1                       ; 543B   0040
        SWAP    R0,     1                       ; 543C   0040
        SWAP    R0,     1                       ; 543D   0040
        SWAP    R1,     1                       ; 543E   0041
        SWAP    R1,     1                       ; 543F   0041
        SWAP    R2,     1                       ; 5440   0042
        SWAP    R2,     1                       ; 5441   0042
        SLLC    R1,     2                       ; 5442   005D
        SLLC    R0,     2                       ; 5443   005C
        SLLC    R3,     1                       ; 5444   005B
        SLLC    R3,     1                       ; 5445   005B
        SLLC    R2,     1                       ; 5446   005A
        SLLC    R1,     1                       ; 5447   0059
        SLLC    R1,     1                       ; 5448   0059
        SLLC    R0,     1                       ; 5449   0058
        RLC     R3,     2                       ; 544A   0057
        RLC     R3,     2                       ; 544B   0057
        RLC     R2,     2                       ; 544C   0056
        RLC     R2,     2                       ; 544D   0056
        RLC     R1,     2                       ; 544E   0055
        RLC     R1,     2                       ; 544F   0055
        RLC     R0,     2                       ; 5450   0054
        RLC     R0,     2                       ; 5451   0054
        RLC     R0,     2                       ; 5452   0054
        RLC     R0,     2                       ; 5453   0054
        RLC     R0,     2                       ; 5454   0054
        RLC     R3,     1                       ; 5455   0053
        RLC     R3,     1                       ; 5456   0053
        RLC     R3,     1                       ; 5457   0053
        RLC     R3,     1                       ; 5458   0053
        RLC     R3,     1                       ; 5459   0053
        RLC     R2,     1                       ; 545A   0052
        RLC     R2,     1                       ; 545B   0052
        RLC     R2,     1                       ; 545C   0052
        RLC     R2,     1                       ; 545D   0052
        RLC     R2,     1                       ; 545E   0052
        RLC     R2,     1                       ; 545F   0052
        RLC     R2,     1                       ; 5460   0052
        RLC     R1,     1                       ; 5461   0051
        RLC     R1,     1                       ; 5462   0051
        RLC     R1,     1                       ; 5463   0051
        RLC     R1,     1                       ; 5464   0051
        RLC     R1,     1                       ; 5465   0051
        RLC     R2,     1                       ; 5466   0052
        RLC     R2,     1                       ; 5467   0052
        RLC     R2,     1                       ; 5468   0052
        RLC     R2,     1                       ; 5469   0052
        RLC     R3,     1                       ; 546A   0053
        RLC     R3,     1                       ; 546B   0053
        RLC     R3,     1                       ; 546C   0053
        SLR     R0,     1                       ; 546D   0060
        SLLC    R3,     2                       ; 546E   005F
        SLLC    R3,     2                       ; 546F   005F
        SLLC    R2,     2                       ; 5470   005E
        SLLC    R2,     2                       ; 5471   005E
        SLLC    R2,     2                       ; 5472   005E
        SLLC    R1,     2                       ; 5473   005D
        SLLC    R1,     2                       ; 5474   005D
        SLLC    R1,     2                       ; 5475   005D
        SLLC    R1,     2                       ; 5476   005D
        SLLC    R1,     2                       ; 5477   005D
        SLLC    R1,     2                       ; 5478   005D
        SLLC    R1,     2                       ; 5479   005D
        SLLC    R2,     2                       ; 547A   005E
        SLLC    R2,     2                       ; 547B   005E
        SLLC    R2,     2                       ; 547C   005E
        SLLC    R3,     2                       ; 547D   005F
        SLLC    R3,     2                       ; 547E   005F
        SLLC    R3,     2                       ; 547F   005F
        SLLC    R3,     2                       ; 5480   005F
        SLLC    R3,     2                       ; 5481   005F
        SLR     R0,     1                       ; 5482   0060
        SLR     R0,     1                       ; 5483   0060
        SLR     R0,     1                       ; 5484   0060
        SLR     R1,     1                       ; 5485   0061
        SLR     R1,     1                       ; 5486   0061
        SLR     R2,     1                       ; 5487   0062
        SLR     R2,     1                       ; 5488   0062
        SLR     R2,     1                       ; 5489   0062
        SLR     R3,     1                       ; 548A   0063
        SLR     R3,     1                       ; 548B   0063
        SLR     R0,     2                       ; 548C   0064
        SLR     R0,     2                       ; 548D   0064
        SLR     R1,     2                       ; 548E   0065
        SLR     R1,     2                       ; 548F   0065
        SLR     R2,     2                       ; 5490   0066
        SLR     R3,     2                       ; 5491   0067
        SLR     R3,     2                       ; 5492   0067
        SAR     R0,     1                       ; 5493   0068
        SAR     R1,     1                       ; 5494   0069
        SAR     R2,     1                       ; 5495   006A
        SAR     R3,     1                       ; 5496   006B
        SAR     R0,     2                       ; 5497   006C
L_5498:
        ADDR    R2,     R4                      ; 5498   00D4
        SUBI    #$0035, R4                      ; 5499   033C 0035
        MOVR    R1,     R2                      ; 549B   008A
        SUBI    #$032D, R2                      ; 549C   033A 032D
        SLR     R2,     2                       ; 549E   0066
        SLR     R2,     2                       ; 549F   0066
        ADDI    #$0175, R2                      ; 54A0   02FA 0175
        MVI@    R2,     R0                      ; 54A2   0290
        MVI     G_0180, R2                      ; 54A3   0282 0180
        CMPI    #$0003, R2                      ; 54A5   037A 0003
        BNEQ    L_54B8                          ; 54A7   020C 000F

        ADDI    #$002B, R4                      ; 54A9   02FC 002B
        DECR    R0                              ; 54AB   0010
        BEQ     L_54B3                          ; 54AC   0204 0005

        DECR    R0                              ; 54AE   0010
        BNEQ    L_54B5                          ; 54AF   020C 0004

        ADDI    #$002B, R4                      ; 54B1   02FC 002B
L_54B3:
        ADDI    #$002B, R4                      ; 54B3   02FC 002B
L_54B5:
        MVI@    R4,     R2                      ; 54B5   02A2
        SWAP    R2,     1                       ; 54B6   0042
        MOVR    R5,     R7                      ; 54B7   00AF

L_54B8:
        CMPI    #$0004, R2                      ; 54B8   037A 0004
        BNEQ    L_54CF                          ; 54BA   020C 0013

        ADDI    #$002B, R4                      ; 54BC   02FC 002B
        DECR    R0                              ; 54BE   0010
        BEQ     L_54C6                          ; 54BF   0204 0005

        DECR    R0                              ; 54C1   0010
        BEQ     L_54C8                          ; 54C2   0204 0004

        ADDI    #$002B, R4                      ; 54C4   02FC 002B
L_54C6:
        ADDI    #$002B, R4                      ; 54C6   02FC 002B
L_54C8:
        MVI@    R4,     R2                      ; 54C8   02A2
        MVII    #$00A6, R0                      ; 54C9   02B8 00A6
        SUBR    R2,     R0                      ; 54CB   0110
        MOVR    R0,     R2                      ; 54CC   0082
        SWAP    R2,     1                       ; 54CD   0042
        MOVR    R5,     R7                      ; 54CE   00AF

L_54CF:
        DECR    R0                              ; 54CF   0010
        BNEQ    L_54D6                          ; 54D0   020C 0004

        MVII    #$0053, R2                      ; 54D2   02BA 0053
        SWAP    R2,     1                       ; 54D4   0042
        MOVR    R5,     R7                      ; 54D5   00AF

L_54D6:
        DECR    R0                              ; 54D6   0010
        BNEQ    L_54B5                          ; 54D7   022C 0023
        B       L_54C8                          ; 54D9   0220 0012

L_54DB:
        PSHR    R5                              ; 54DB   0275
        SDBD                                    ; 54DC   0001
        MVII    #$5C98, R1                      ; 54DD   02B9 0098 005C

L_54E0:
        JSR     R5,     X_TIMER_STOP            ; 54E0   0004 0118 0038

        ADDI    #$0004, R1                      ; 54E3   02F9 0004
        SDBD                                    ; 54E5   0001
        CMPI    #$5CB0, R1                      ; 54E6   0379 00B0 005C
        BNEQ    L_54E0                          ; 54E9   022C 000A
        PULR    R7                              ; 54EB   02B7

        DECLE   $0088,  $0030,  $000A,  $0055   ; 54EC   0088 0030 000A 0055
        DECLE   $0000,  $0048,  $0000,  $0051   ; 54F0   0000 0048 0000 0051
        DECLE   $0000,  $0000,  $0080,  $0002   ; 54F4   0000 0000 0080 0002
        DECLE   $0000,  $0000,  $0049,  $0053   ; 54F8   0000 0000 0049 0053
        DECLE   $0001,  $0000,  $0000,  $0000   ; 54FC   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0001   ; 5500   0000 0000 0004 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5504   0000 0000 0000 0000
        DECLE   $0004,  $0005,  $0000,  $0000   ; 5508   0004 0005 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 550C   0000 0000 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5510   0000 0000 0000 0000
        DECLE   $0001,  $0005,  $0000,  $0000   ; 5514   0001 0005 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0009   ; 5518   0000 0000 0001 0009
        DECLE   $0000,  $0000,  $0000,  $0000   ; 551C   0000 0000 0000 0000
        DECLE   $0001,  $000A,  $0000,  $0000   ; 5520   0001 000A 0000 0000
        DECLE   $0000,  $0000,  $0001,  $000B   ; 5524   0000 0000 0001 000B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5528   0000 0000 0000 0000
        DECLE   $0001,  $000C,  $0000,  $0000   ; 552C   0001 000C 0000 0000
        DECLE   $0000,  $0000,  $0001,  $000D   ; 5530   0000 0000 0001 000D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5534   0000 0000 0000 0000
        DECLE   $0001,  $000E,  $0000,  $0000   ; 5538   0001 000E 0000 0000
        DECLE   $0000,  $0000,  $0001,  $000F   ; 553C   0000 0000 0001 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5540   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5544   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0012   ; 5548   0000 0000 0001 0012
        DECLE   $0000,  $0000,  $0000,  $0000   ; 554C   0000 0000 0000 0000
        DECLE   $0001,  $0013,  $0000,  $0000   ; 5550   0001 0013 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0014   ; 5554   0000 0000 0001 0014
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5558   0000 0000 0000 0000
        DECLE   $0001,  $0015,  $0000,  $0000   ; 555C   0001 0015 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0016   ; 5560   0000 0000 0001 0016
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5564   0000 0000 0000 0000
        DECLE   $0001                           ; 5568   0001
L_5569:
        DECR    R7                              ; 5569   0017

        DECLE   $0000,  $0000,  $0000,  $0000   ; 556A   0000 0000 0000 0000
        DECLE   $0001,  $0010,  $0000,  $0000   ; 556E   0001 0010 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0011   ; 5572   0000 0000 0001 0011
        DECLE   $0000                           ; 5576   0000
L_5577:
        MOVR    R1,     R4                      ; 5577   008C
L_5578:
        ADDI    #$0002, R4                      ; 5578   02FC 0002
        MVO@    R2,     R4                      ; 557A   0262
        MVO@    R3,     R4                      ; 557B   0263
        MOVR    R5,     R7                      ; 557C   00AF

L_557D:
        PSHR    R5                              ; 557D   0275
        MVII    #$032D, R1                      ; 557E   02B9 032D
        MVII    #$0172, R4                      ; 5580   02BC 0172

        JSR     R5,     L_55A7                  ; 5582   0004 0154 01A7

        MVII    #$033D, R1                      ; 5585   02B9 033D
        MVII    #$0173, R4                      ; 5587   02BC 0173

        JSR     R5,     L_55A7                  ; 5589   0004 0154 01A7

        MVII    #$034D, R1                      ; 558C   02B9 034D
        MVII    #$0174, R4                      ; 558E   02BC 0174

        JSR     R5,     L_55A7                  ; 5590   0004 0154 01A7

        INCR    R7                              ; 5593   000F

L_5594:
        PSHR    R5                              ; 5594   0275
L_5595:
        MVI     G_0171, R0                      ; 5595   0280 0171
        MVII    #$0002, R1                      ; 5597   02B9 0002

        JSR     R5,     L_5A4D                  ; 5599   0004 0158 024D

        CMPI    #$001E, R0                      ; 559C   0378 001E
        BNC     L_55A2                          ; 559E   0209 0002

        SUBI    #$0001, R3                      ; 55A0   033B 0001
L_55A2:
        MVII    #$0209, R4                      ; 55A2   02BC 0209
        J       .EXEC.8C6                       ; 55A4   0004 0318 00C6

L_55A7:
        PSHR    R5                              ; 55A7   0275
        MOVR    R1,     R2                      ; 55A8   008A
        INCR    R2                              ; 55A9   000A
        MVI@    R2,     R0                      ; 55AA   0290
        ANDR    R0,     R0                      ; 55AB   0180
        BEQ     L_5612                          ; 55AC   0204 0064

        SDBD                                    ; 55AE   0001
        CMPI    #$5546, R0                      ; 55AF   0378 0046 0055
        BC      L_5612                          ; 55B2   0201 005E

        SDBD                                    ; 55B4   0001
        CMPI    #$54F8, R0                      ; 55B5   0378 00F8 0054
        BEQ     L_5612                          ; 55B8   0204 0058

        JSR     R5,     .EXEC.777               ; 55BA   0004 0114 0377

        MVI@    R4,     R0                      ; 55BD   02A0
        DECR    R4                              ; 55BE   0014
        MVO@    R3,     R4                      ; 55BF   0263
        MVII    #$0053, R1                      ; 55C0   02B9 0053
        MVI     G_0171, R2                      ; 55C2   0282 0171
        CMPR    R1,     R0                      ; 55C4   0148
        BC      L_55E2                          ; 55C5   0201 001B

        CMPR    R1,     R3                      ; 55C7   014B
        BNC     L_5612                          ; 55C8   0209 0048

        CMPI    #$0063, R2                      ; 55CA   037A 0063
        BEQ     L_5612                          ; 55CC   0204 0044

        INCR    R2                              ; 55CE   000A
        MVO     R2,     G_0171                  ; 55CF   0242 0171
        MVII    #$0028, R0                      ; 55D1   02B8 0028

        JSR     R5,     L_5A24                  ; 55D3   0004 0158 0224

        INCR    R7                              ; 55D6   000F

L_55D7:
        PSHR    R5                              ; 55D7   0275

L_55D8:
        JSR     R5,     X_PLAY_SFX2             ; 55D8   0004 0118 03BE
        DECLE   $0060                           ; 55DB  SFX prio
        DECLE   $0308,  $0060                   ; 55DC  SFX data
        DECLE   $0399                           ; 55DE  SFX data
        DECLE   $022B                           ; 55DF  SFX data
        DECLE   $0025                           ; 55E0  SFX data
        DECLE   $03CF                           ; 55E1  SFX end

L_55E2:
        CMPR    R1,     R3                      ; 55E2   014B
        BC      L_5612                          ; 55E3   0201 002D

        DECR    R2                              ; 55E5   0012
        BMI     L_5612                          ; 55E6   020B 002A

        MVO     R2,     G_0171                  ; 55E8   0242 0171

        JSR     R5,     X_PLAY_SFX2             ; 55EA   0004 0118 03BE
        DECLE   $0058                           ; 55ED  SFX prio
        DECLE   $03C8,  $03FF                   ; 55EE  SFX data
        DECLE   $0399                           ; 55F0  SFX data
        DECLE   $022B                           ; 55F1  SFX data
        DECLE   $0025                           ; 55F2  SFX data
        DECLE   $03CF                           ; 55F3  SFX end

L_55F4:
        PSHR    R5                              ; 55F4   0275
        MVI     G_0170, R0                      ; 55F5   0280 0170
        DECR    R0                              ; 55F7   0010
        MVO     R0,     G_0170                  ; 55F8   0240 0170
        CMPI    #$000A, R0                      ; 55FA   0378 000A
        BC      L_5601                          ; 55FC   0201 0003

        JSR     R5,     L_55D7                  ; 55FE   0004 0154 01D7

L_5601:
        INCR    R7                              ; 5601   000F

L_5602:
        PSHR    R5                              ; 5602   0275
L_5603:
        MVI     G_0170, R0                      ; 5603   0280 0170
        MVII    #$0002, R1                      ; 5605   02B9 0002

        JSR     R5,     L_5A4D                  ; 5607   0004 0158 024D

        MVII    #$021D, R4                      ; 560A   02BC 021D

        JSR     R5,     X_PRNUM_RGT             ; 560C   0004 0118 00C5

        MVI     G_0170, R0                      ; 560F   0280 0170
        ANDR    R0,     R0                      ; 5611   0180
L_5612:
        PULR    R7                              ; 5612   02B7

L_5613:
        PSHR    R5                              ; 5613   0275

        JSR     R5,     L_55F4                  ; 5614   0004 0154 01F4

        BNEQ    L_5612                          ; 5617   022C 0006

        MVI     G_0171, R0                      ; 5619   0280 0171
        CMPI    #$001E, R0                      ; 561B   0378 001E
        BNC     L_5657                          ; 561D   0209 0038

        MVI     G_0188, R0                      ; 561F   0280 0188
        INCR    R0                              ; 5621   0008
        MVO     R0,     G_0188                  ; 5622   0240 0188
        MVI     G_0193, R0                      ; 5624   0280 0193
        INCR    R0                              ; 5626   0008
        CMPI    #$0003, R0                      ; 5627   0378 0003
        BC      L_562D                          ; 5629   0201 0002

        MVO     R0,     G_0193                  ; 562B   0240 0193
L_562D:
        MVII    #$000C, R0                      ; 562D   02B8 000C
        MVII    #$0014, R1                      ; 562F   02B9 0014
        B       L_5654                          ; 5631   0200 0021

        MVII    #$0002, R0                      ; 5633   02B8 0002
        MVO     R0,     G_0195                  ; 5635   0240 0195
        MVII    #$0028, R0                      ; 5637   02B8 0028

        JSR     R5,     L_5A24                  ; 5639   0004 0158 0224
        JSR     R5,     .EXEC.60A               ; 563C   0004 0114 020A

        MVI     G_0171, R0                      ; 563F   0280 0171
        DECR    R0                              ; 5641   0010
        MVO     R0,     G_0171                  ; 5642   0240 0171

        JSR     R5,     L_5594                  ; 5644   0004 0154 0194

        MVI     G_0171, R0                      ; 5647   0280 0171
        ANDR    R0,     R0                      ; 5649   0180
        BNEQ    L_5612                          ; 564A   022C 0039

        MVII    #$0064, R0                      ; 564C   02B8 0064
        MVO     R0,     G_0170                  ; 564E   0240 0170
        MVII    #$0014, R1                      ; 5650   02B9 0014
        MVII    #$000A, R0                      ; 5652   02B8 000A
L_5654:
        J       L_50ED                          ; 5654   0004 0350 00ED

L_5657:
        SDBD                                    ; 5657   0001
        MVII    #$3207, R3                      ; 5658   02BB 0007 0032
        MVII    #$0269, R4                      ; 565B   02BC 0269

        JSR     R5,     X_PRINT_R5              ; 565D   0004 0118 007B
        STRING  " THE  END "                    ; 5660  
        DECLE   $0000                           ; 566A   0000

        MVI     G_031E, R5                      ; 566B   0285 031E
        SDBD                                    ; 566D   0001
        CMPI    #$54FE, R5                      ; 566E   037D 00FE 0054
        BEQ     L_5676                          ; 5671   0204 0003

        JSR     R5,     L_569A                  ; 5673   0004 0154 029A

L_5676:
        MVII    #$0004, R0                      ; 5676   02B8 0004
        MVII    #$001E, R1                      ; 5678   02B9 001E
        B       L_5654                          ; 567A   0220 0027

        MVII    #$0006, R0                      ; 567C   02B8 0006
        MVII    #$0040, R1                      ; 567E   02B9 0040
        B       L_5689                          ; 5680   0200 0007

        CLRR    R0                              ; 5682   01C0
        MVO     R0,     G_0179                  ; 5683   0240 0179
        MVII    #$0008, R0                      ; 5685   02B8 0008
        MVII    #$0002, R1                      ; 5687   02B9 0002

L_5689:
        JSR     R5,     L_50EC                  ; 5689   0004 0150 00EC

        INCR    R7                              ; 568C   000F

        PSHR    R5                              ; 568D   0275
L_568E:
        MVI     G_031E, R5                      ; 568E   0285 031E
        SDBD                                    ; 5690   0001
        CMPI    #$54FE, R5                      ; 5691   037D 00FE 0054
        BNEQ    L_5699                          ; 5694   020C 0003

        JSR     R5,     L_57B0                  ; 5696   0004 0154 03B0

L_5699:
        INCR    R7                              ; 5699   000F

L_569A:
        PSHR    R5                              ; 569A   0275

L_569B:
        JSR     R5,     X_PLAY_SFX2             ; 569B   0004 0118 03BE
        DECLE   $00A0                           ; 569E  SFX prio
        DECLE   $02CF                           ; 569F  SFX end


        JSR     R5,     L_54DB                  ; 56A0   0004 0154 00DB
        JSR     R4,     L_56B0                  ; 56A3   0004 0054 02B0

        COMR    R4                              ; 56A6   001C
        RLC     R0,     1                       ; 56A7   0050
        COMR    R4                              ; 56A8   001C
        RLC     R0,     1                       ; 56A9   0050
        COMR    R4                              ; 56AA   001C
        RLC     R0,     1                       ; 56AB   0050
        COMR    R4                              ; 56AC   001C
        RLC     R0,     1                       ; 56AD   0050
        COMR    R4                              ; 56AE   001C
        RLC     R0,     1                       ; 56AF   0050
L_56B0:
        MVO     R4,     G_035D                  ; 56B0   0244 035D
        PULR    R7                              ; 56B2   02B7

L_56B3:
        PSHR    R5                              ; 56B3   0275
        MVI     G_0180, R5                      ; 56B4   0285 0180
        CMPI    #$0005, R5                      ; 56B6   037D 0005
        BNEQ    L_56E9                          ; 56B8   020C 002F

        MVI     G_0191, R0                      ; 56BA   0280 0191
        ANDR    R0,     R0                      ; 56BC   0180
        BNEQ    L_56CC                          ; 56BD   020C 000D

        INCR    R0                              ; 56BF   0008
        MVO     R0,     G_0191                  ; 56C0   0240 0191

        JSR     R5,     L_5BBF                  ; 56C2   0004 0158 03BF

        ANDI    #$001F, R0                      ; 56C5   03B8 001F
        ADDI    #$000D, R0                      ; 56C7   02F8 000D
        MVO     R0,     G_0192                  ; 56C9   0240 0192
L_56CB:
        PULR    R7                              ; 56CB   02B7

L_56CC:
        CMPI    #$0004, R0                      ; 56CC   0378 0004
        BEQ     L_56E9                          ; 56CE   0204 0019

        CMPI    #$0003, R0                      ; 56D0   0378 0003
        BNEQ    L_56CB                          ; 56D2   022C 0008

        JSR     R5,     L_5BBF                  ; 56D4   0004 0158 03BF

        ANDI    #$0007, R0                      ; 56D7   03B8 0007
        BNEQ    L_56CB                          ; 56D9   022C 000F

        MVII    #$034D, R1                      ; 56DB   02B9 034D
        MOVR    R1,     R2                      ; 56DD   008A
        INCR    R2                              ; 56DE   000A
        MVI@    R2,     R5                      ; 56DF   0295
        ANDR    R5,     R5                      ; 56E0   01AD
        BNEQ    L_56CB                          ; 56E1   022C 0017

        MVII    #$0002, R0                      ; 56E3   02B8 0002
        MVO     R0,     G_0196                  ; 56E5   0240 0196
        B       L_5740                          ; 56E7   0200 0057

L_56E9:
        JSR     R5,     L_5BBF                  ; 56E9   0004 0158 03BF

        ANDI    #$000F, R0                      ; 56EC   03B8 000F

        JSR     R5,     L_56F9                  ; 56EE   0004 0154 02F9
        DECLE   $0004,  $0006,  $0008,  $000A   ; 56F1   0004 0006 0008 000A
        DECLE   $0004,  $0005                   ; 56F5   0004 0005

        CLRC                                    ; 56F7   0006
        SETC                                    ; 56F8   0007
L_56F9:
        ADD     G_015D, R5                      ; 56F9   02C5 015D
        MVII    #$0003, R1                      ; 56FB   02B9 0003
        SUB     G_015D, R1                      ; 56FD   0301 015D
        MVI     G_0188, R2                      ; 56FF   0282 0188
        DECR    R2                              ; 5701   0012
        BMI     L_5709                          ; 5702   020B 0005

        CMPR    R1,     R2                      ; 5704   014A
        BNC     L_5708                          ; 5705   0209 0001

        MOVR    R1,     R2                      ; 5707   008A
L_5708:
        ADDR    R2,     R5                      ; 5708   00D5
L_5709:
        MVI     G_016C, R1                      ; 5709   0281 016C
        CMPI    #$0004, R1                      ; 570B   0379 0004
        BNC     L_5711                          ; 570D   0209 0002

        ADDI    #$0004, R5                      ; 570F   02FD 0004
L_5711:
        MVI@    R5,     R1                      ; 5711   02A9
        CMPR    R1,     R0                      ; 5712   0148
        BC      L_573F                          ; 5713   0201 002A

        CLRR    R0                              ; 5715   01C0
        MVO     R0,     G_0196                  ; 5716   0240 0196
        MVI     G_0180, R5                      ; 5718   0285 0180
        CMPI    #$0003, R5                      ; 571A   037D 0003
        BC      L_572F                          ; 571C   0201 0011

        MVII    #$0014, R0                      ; 571E   02B8 0014
        CMP     G_0181, R0                      ; 5720   0340 0181
        BC      L_572F                          ; 5722   0201 000B

        JSR     R5,     L_5BBF                  ; 5724   0004 0158 03BF

        ANDI    #$0003, R0                      ; 5727   03B8 0003
        BNEQ    L_572F                          ; 5729   020C 0004

        MVII    #$0001, R0                      ; 572B   02B8 0001
        MVO     R0,     G_0196                  ; 572D   0240 0196
L_572F:
        CLRR    R0                              ; 572F   01C0
        MVII    #$032D, R1                      ; 5730   02B9 032D
L_5732:
        MOVR    R1,     R2                      ; 5732   008A
        INCR    R2                              ; 5733   000A
        MVI@    R2,     R5                      ; 5734   0295
        ANDR    R5,     R5                      ; 5735   01AD
        BEQ     L_5740                          ; 5736   0204 0008

        ADDI    #$0010, R1                      ; 5738   02F9 0010
        INCR    R0                              ; 573A   0008
        CMPI    #$0003, R0                      ; 573B   0378 0003
        BNEQ    L_5732                          ; 573D   022C 000C
L_573F:
        PULR    R7                              ; 573F   02B7

L_5740:
        MVO     R0,     G_0162                  ; 5740   0240 0162
        MOVR    R1,     R4                      ; 5742   008C
        MVII    #$0010, R0                      ; 5743   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 5745   0004 0114 0338
        JSR     R4,     L_579B                  ; 5748   0004 0054 039B

        CMP     G_0198, R0                      ; 574B   0340 0198
        BNEQ    L_5752                          ; 574D   020C 0003

        JSR     R4,     L_579B                  ; 574F   0004 0054 039B

L_5752:
        MVO     R0,     G_0198                  ; 5752   0240 0198
        MVII    #$0175, R3                      ; 5754   02BB 0175
        ADD     G_0162, R3                      ; 5756   02C3 0162
        MVO@    R0,     R3                      ; 5758   0258
        MVI     G_0196, R0                      ; 5759   0280 0196
        ANDR    R0,     R0                      ; 575B   0180
        BEQ     L_5769                          ; 575C   0204 000B

        MOVR    R1,     R4                      ; 575E   008C
        INCR    R4                              ; 575F   000C
        SDBD                                    ; 5760   0001
        MVII    #$556A, R5                      ; 5761   02BD 006A 0055
        MVO@    R5,     R4                      ; 5764   0265
        MVII    #$0035, R3                      ; 5765   02BB 0035
        B       L_5792                          ; 5767   0200 0029

L_5769:
        CLRR    R0                              ; 5769   01C0
        MVI     G_0180, R5                      ; 576A   0285 0180
        CMPI    #$0006, R0                      ; 576C   0378 0006
        BNEQ    L_5775                          ; 576E   020C 0005

        MVII    #$0008, R2                      ; 5770   02BA 0008
        ADDR    R1,     R2                      ; 5772   00CA
        INCR    R0                              ; 5773   0008
        MVO@    R0,     R2                      ; 5774   0250

L_5775:
        JSR     R5,     L_5BBF                  ; 5775   0004 0158 03BF

        ANDI    #$0007, R0                      ; 5778   03B8 0007

        JSR     R5,     L_5785                  ; 577A   0004 0154 0385

L_577D:
        DECR    R7                              ; 577D   0017

        DECLE   $0003,  $0014,  $0004,  $0006   ; 577E   0003 0014 0004 0006
        DECLE   $0005                           ; 5782   0005

        CLRC                                    ; 5783   0006
        DECR    R6                              ; 5784   0016
L_5785:
        ADDR    R0,     R5                      ; 5785   00C5
        MVI@    R5,     R0                      ; 5786   02A8
        MVO@    R0,     R1                      ; 5787   0248
        MVII    #$0035, R3                      ; 5788   02BB 0035
        MVI     G_018F, R0                      ; 578A   0280 018F
        SWAP    R0,     1                       ; 578C   0040
        ANDR    R0,     R0                      ; 578D   0180
        BPL     L_5792                          ; 578E   0203 0002

        MVII    #$005F, R3                      ; 5790   02BB 005F
L_5792:
        MVII    #$0172, R4                      ; 5792   02BC 0172
        ADD     G_0162, R4                      ; 5794   02C4 0162
        MVO@    R3,     R4                      ; 5796   0263
        SWAP    R3,     1                       ; 5797   0043
        J       L_5276                          ; 5798   0004 0350 0276

L_579B:
        JSR     R5,     L_5BBF                  ; 579B   0004 0158 03BF

        CMPI    #$00C0, R0                      ; 579E   0378 00C0
        BC      L_579B                          ; 57A0   0221 0006

        SLR     R0,     2                       ; 57A2   0064
        SLR     R0,     2                       ; 57A3   0064
        SLR     R0,     2                       ; 57A4   0064
        MVI     G_018F, R3                      ; 57A5   0283 018F
        SWAP    R3,     1                       ; 57A7   0043
        ANDR    R3,     R3                      ; 57A8   019B
        BPL     L_57AF                          ; 57A9   0203 0004

        CMP     G_0197, R0                      ; 57AB   0340 0197
        BEQ     L_579B                          ; 57AD   0224 0013
L_57AF:
        MOVR    R4,     R7                      ; 57AF   00A7

L_57B0:
        PSHR    R5                              ; 57B0   0275
        MVII    #$0322, R1                      ; 57B1   02B9 0322
        MVII    #$0280, R0                      ; 57B3   02B8 0280
        MVO@    R0,     R1                      ; 57B5   0248
        ADDI    #$0008, R1                      ; 57B6   02F9 0008
        MVO@    R0,     R1                      ; 57B8   0248
        MVII    #$0010, R0                      ; 57B9   02B8 0010
        B       L_585D                          ; 57BB   0200 00A0

L_57BD:
        PSHR    R5                              ; 57BD   0275
        MVI     G_0179, R0                      ; 57BE   0280 0179
        DECR    R0                              ; 57C0   0010
        BMI     L_57CC                          ; 57C1   020B 0009

        MVO     R0,     G_0179                  ; 57C3   0240 0179
        BNEQ    L_57CA                          ; 57C5   020C 0003

        JSR     R5,     L_57B0                  ; 57C7   0004 0154 03B0

L_57CA:
        B       L_57D5                          ; 57CA   0200 0009

L_57CC:
        JSR     R5,     L_58E3                  ; 57CC   0004 0158 00E3
        JSR     R5,     L_5863                  ; 57CF   0004 0158 0063
        JSR     R5,     L_57FB                  ; 57D2   0004 0154 03FB

L_57D5:
        INCR    R7                              ; 57D5   000F

L_57D6:
        PSHR    R5                              ; 57D6   0275
L_57D7:
        MVI     G_016E, R0                      ; 57D7   0280 016E

        JSR     R5,     L_5A4D                  ; 57D9   0004 0158 024D

        ADDI    #$0140, R3                      ; 57DC   02FB 0140
        ANDR    R0,     R0                      ; 57DE   0180
        BNEQ    L_57E3                          ; 57DF   020C 0002

        ADDI    #$0020, R3                      ; 57E1   02FB 0020
L_57E3:
        MVO     R3,     .BTAB.26                ; 57E3   0243 0226
        PULR    R7                              ; 57E5   02B7

L_57E6:
        PSHR    R5                              ; 57E6   0275

        JSR     R5,     L_5953                  ; 57E7   0004 0158 0153

        MVII    #$0002, R0                      ; 57EA   02B8 0002
        MVI     G_016C, R2                      ; 57EC   0282 016C
        CMPI    #$0006, R2                      ; 57EE   037A 0006
        BC      L_57F8                          ; 57F0   0201 0006

        INCR    R0                              ; 57F2   0008
        CMPI    #$0003, R2                      ; 57F3   037A 0003
        BC      L_57F8                          ; 57F5   0201 0001

        INCR    R0                              ; 57F7   0008
L_57F8:
        J       L_52A8                          ; 57F8   0004 0350 02A8

L_57FB:
        PSHR    R5                              ; 57FB   0275
        MVII    #$031D, R1                      ; 57FC   02B9 031D
        MOVR    R1,     R2                      ; 57FE   008A
        INCR    R2                              ; 57FF   000A
        MVI@    R2,     R5                      ; 5800   0295
        SDBD                                    ; 5801   0001
        MVII    #$54FE, R4                      ; 5802   02BC 00FE 0054
        CMPR    R4,     R5                      ; 5805   0165
        BEQ     L_5862                          ; 5806   0204 005A

        JSR     R5,     .EXEC.777               ; 5808   0004 0114 0377

        MVI     G_016C, R0                      ; 580B   0280 016C
        SLR     R0,     1                       ; 580D   0060
        SLL     R0,     2                       ; 580E   004C

        JSR     R5,     L_5822                  ; 580F   0004 0158 0022

        ADCR    R0                              ; 5812   0028
        ADCR    R6                              ; 5813   002E
        SARC    R0,     1                       ; 5814   0078
        RRC     R2,     1                       ; 5815   0072
        ADCR    R2                              ; 5816   002A
        GSWD    R0                              ; 5817   0030
        RRC     R2,     2                       ; 5818   0076
        RRC     R0,     1                       ; 5819   0070
        ADCR    R4                              ; 581A   002C
        GSWD    R2                              ; 581B   0032
        RRC     R0,     2                       ; 581C   0074
        SAR     R2,     2                       ; 581D   006E
        RSWD    R2                              ; 581E   003A
        RSWD    R3                              ; 581F   003B
        SAR     R3,     2                       ; 5820   006F
        SAR     R2,     1                       ; 5821   006A
L_5822:
        ADDR    R0,     R5                      ; 5822   00C5
        CMP@    R5,     R2                      ; 5823   036A
        BNC     L_5837                          ; 5824   0209 0011

        CMP@    R5,     R2                      ; 5826   036A
        BNC     L_582F                          ; 5827   0209 0006

        CMP@    R5,     R2                      ; 5829   036A
        BC      L_5831                          ; 582A   0201 0005

        CMP@    R5,     R2                      ; 582C   036A
        BNC     L_5862                          ; 582D   0209 0033
L_582F:
        B       L_58D0                          ; 582F   0200 009F

L_5831:
        MVII    #$0009, R0                      ; 5831   02B8 0009
        MVII    #$0002, R4                      ; 5833   02BC 0002
        B       L_5839                          ; 5835   0200 0002

L_5837:
        CLRR    R0                              ; 5837   01C0
        MOVR    R0,     R4                      ; 5838   0084
L_5839:
        MVO     R0,     G_018D                  ; 5839   0240 018D
        MVII    #$0004, R0                      ; 583B   02B8 0004
        MVO     R0,     G_018C                  ; 583D   0240 018C
        INCR    R7                              ; 583F   000F

L_5840:
        PSHR    R5                              ; 5840   0275
L_5841:
        MVO     R4,     G_0197                  ; 5841   0244 0197
        CLRR    R0                              ; 5843   01C0
        MVO     R0,     G_018A                  ; 5844   0240 018A
        MVO     R0,     G_016F                  ; 5846   0240 016F
        MVO     R0,     G_018B                  ; 5848   0240 018B
        MVII    #$0025, R0                      ; 584A   02B8 0025
        MVO     R0,     G_0179                  ; 584C   0240 0179

        JSR     R5,     L_5BDA                  ; 584E   0004 0158 03DA

        CLRR    R0                              ; 5851   01C0
        MVO     R0,     G_016E                  ; 5852   0240 016E
        MVO     R0,     G_016D                  ; 5854   0240 016D
        MVO     R0,     G_016C                  ; 5856   0240 016C

        JSR     R5,     L_57E6                  ; 5858   0004 0154 03E6

        MVII    #$0014, R0                      ; 585B   02B8 0014
L_585D:
        MVII    #$031D, R1                      ; 585D   02B9 031D
        J       L_52A9                          ; 585F   0004 0350 02A9
L_5862:
        PULR    R7                              ; 5862   02B7

L_5863:
        PSHR    R5                              ; 5863   0275
        MVII    #$031D, R1                      ; 5864   02B9 031D

        JSR     R5,     .EXEC.777               ; 5866   0004 0114 0377

        MVO     R2,     G_0162                  ; 5869   0242 0162
        MVO     R3,     G_0163                  ; 586B   0243 0163
        MVII    #$032D, R1                      ; 586D   02B9 032D

        JSR     R5,     L_587A                  ; 586F   0004 0158 007A

        MVII    #$033D, R1                      ; 5872   02B9 033D

        JSR     R5,     L_587A                  ; 5874   0004 0158 007A

        MVII    #$034D, R1                      ; 5877   02B9 034D
        INCR    R7                              ; 5879   000F

L_587A:
        PSHR    R5                              ; 587A   0275
L_587B:
        MOVR    R1,     R2                      ; 587B   008A
        INCR    R2                              ; 587C   000A
        MVI@    R2,     R0                      ; 587D   0290
        ANDR    R0,     R0                      ; 587E   0180
        BEQ     L_5862                          ; 587F   0224 001E

        JSR     R5,     .EXEC.777               ; 5881   0004 0114 0377

        MVI     G_0162, R0                      ; 5884   0280 0162
        ADDI    #$0008, R0                      ; 5886   02F8 0008
        CMPR    R0,     R2                      ; 5888   0142
        BC      L_5862                          ; 5889   0221 0028

        SUBI    #$000D, R0                      ; 588B   0338 000D
        CMPR    R0,     R2                      ; 588D   0142
        BNC     L_5862                          ; 588E   0229 002D

        MVI     G_0163, R0                      ; 5890   0280 0163
        ADDI    #$0006, R0                      ; 5892   02F8 0006
        CMPR    R0,     R3                      ; 5894   0143
        BC      L_5862                          ; 5895   0221 0034

        SUBI    #$000B, R0                      ; 5897   0338 000B
        CMPR    R0,     R3                      ; 5899   0143
        BNC     L_5862                          ; 589A   0229 0039

        INCR    R1                              ; 589C   0009
        MVI@    R1,     R5                      ; 589D   028D
        SDBD                                    ; 589E   0001
        CMPI    #$556A, R5                      ; 589F   037D 006A 0055
        BC      L_58C2                          ; 58A2   0201 001E

        SUBI    #$032E, R1                      ; 58A4   0339 032E
        SLR     R1,     2                       ; 58A6   0065
        SLR     R1,     2                       ; 58A7   0065
        ADDI    #$0175, R1                      ; 58A8   02F9 0175
        MVI@    R1,     R4                      ; 58AA   028C

        JSR     R5,     L_5840                  ; 58AB   0004 0158 0040

        MVI     G_0188, R0                      ; 58AE   0280 0188
        ANDR    R0,     R0                      ; 58B0   0180
        BEQ     L_5862                          ; 58B1   0224 0050

        MVI     G_015D, R0                      ; 58B3   0280 015D
        ANDR    R0,     R0                      ; 58B5   0180
        BEQ     L_5862                          ; 58B6   0224 0055

        MVI     G_0193, R0                      ; 58B8   0280 0193
        DECR    R0                              ; 58BA   0010
        MVO     R0,     G_0193                  ; 58BB   0240 0193
        BNEQ    L_5862                          ; 58BD   022C 005C
        J       L_5657                          ; 58BF   0004 0354 0257

L_58C2:
        JSR     R5,     L_5BBF                  ; 58C2   0004 0158 03BF

        ANDI    #$0001, R0                      ; 58C5   03B8 0001
        MVO     R0,     G_018D                  ; 58C7   0240 018D
        MVI     G_015D, R0                      ; 58C9   0280 015D
        INCR    R0                              ; 58CB   0008
        MVO     R0,     G_018C                  ; 58CC   0240 018C
        INCR    R7                              ; 58CE   000F

L_58CF:
        PSHR    R5                              ; 58CF   0275

L_58D0:
        JSR     R5,     X_PLAY_SFX2             ; 58D0   0004 0118 03BE
        DECLE   $0080                           ; 58D3  SFX prio
        DECLE   $021D                           ; 58D4  SFX data
        DECLE   $0319                           ; 58D5  SFX data
        DECLE   $00ED                           ; 58D6  SFX data
        DECLE   $0048,  $0040                   ; 58D7  SFX data
        DECLE   $0001,  $0042                   ; 58D9  SFX data
        DECLE   $0305                           ; 58DB  SFX data
        DECLE   $0325                           ; 58DC  SFX data
        DECLE   $00AB                           ; 58DD  SFX data
        DECLE   $0005                           ; 58DE  SFX data
        DECLE   $0025                           ; 58DF  SFX data
        DECLE   $0043,  $03D4                   ; 58E0  SFX data
        DECLE   $03CF                           ; 58E2  SFX end

L_58E3:
        PSHR    R5                              ; 58E3   0275
        CLRR    R1                              ; 58E4   01C9
        CLRR    R2                              ; 58E5   01D2
        MVI     .PSG0.rgt_hand,R0               ; 58E6   0280 01FE
        ANDI    #$00E0, R0                      ; 58E8   03B8 00E0
        CMPI    #$0040, R0                      ; 58EA   0378 0040
        BNEQ    L_58F1                          ; 58EC   020C 0003

        INCR    R2                              ; 58EE   000A
        B       L_58F9                          ; 58EF   0200 0008

L_58F1:
        CMPI    #$0020, R0                      ; 58F1   0378 0020
        BEQ     L_58F9                          ; 58F3   0204 0004

        CMPI    #$0080, R0                      ; 58F5   0378 0080
        BNEQ    L_58FC                          ; 58F7   020C 0003

L_58F9:
        INCR    R1                              ; 58F9   0009
        MVO     R2,     G_016D                  ; 58FA   0242 016D
L_58FC:
        MVI     G_016F, R0                      ; 58FC   0280 016F
        TSTR    R0                              ; 58FE   0080
        BEQ     L_5906                          ; 58FF   0204 0005

        DECR    R0                              ; 5901   0010
        MVO     R0,     G_016F                  ; 5902   0240 016F
L_5904:
        B       L_593A                          ; 5904   0200 0034

L_5906:
        TSTR    R1                              ; 5906   0089
        BNEQ    L_590F                          ; 5907   020C 0006

        MVI     G_016C, R0                      ; 5909   0280 016C
        CMPI    #$0003, R0                      ; 590B   0378 0003
        BEQ     L_5904                          ; 590D   0224 000A

L_590F:
        MVI     G_016D, R2                      ; 590F   0282 016D
        TSTR    R2                              ; 5911   0092
        BNEQ    L_5921                          ; 5912   020C 000D

        MVI     G_016C, R0                      ; 5914   0280 016C
        TSTR    R0                              ; 5916   0080
        BEQ     L_5904                          ; 5917   0224 0014

        DECR    R0                              ; 5919   0010
        SDBD                                    ; 591A   0001
        MVII    #$594C, R1                      ; 591B   02B9 004C 0059
        ADDR    R0,     R1                      ; 591E   00C1
        B       L_5932                          ; 591F   0200 0011

L_5921:
        JSR     R5,     L_5C5C                  ; 5921   0004 015C 005C

        BNEQ    L_5904                          ; 5924   022C 0021

        MVI     G_016C, R0                      ; 5926   0280 016C
        CMPI    #$0007, R0                      ; 5928   0378 0007
        BEQ     L_5904                          ; 592A   0224 0027

        SDBD                                    ; 592C   0001
        MVII    #$5945, R1                      ; 592D   02B9 0045 0059
        ADDR    R0,     R1                      ; 5930   00C1
        INCR    R0                              ; 5931   0008
L_5932:
        MVI@    R1,     R2                      ; 5932   028A
        MVO     R2,     G_016F                  ; 5933   0242 016F
        MVO     R0,     G_016C                  ; 5935   0240 016C

        JSR     R5,     L_57E6                  ; 5937   0004 0154 03E6

L_593A:
        MVI     G_016C, R0                      ; 593A   0280 016C
        CLRR    R1                              ; 593C   01C9
        CMPI    #$0004, R0                      ; 593D   0378 0004
        BLT     L_5942                          ; 593F   0205 0001

        INCR    R1                              ; 5941   0009
L_5942:
        MVO     R1,     G_016E                  ; 5942   0241 016E
        PULR    R7                              ; 5944   02B7

        INCR    R4                              ; 5945   000C
        INCR    R4                              ; 5946   000C
        INCR    R4                              ; 5947   000C
        INCR    R4                              ; 5948   000C
        INCR    R4                              ; 5949   000C
        INCR    R4                              ; 594A   000C
        INCR    R4                              ; 594B   000C
        CLRC                                    ; 594C   0006
        CLRC                                    ; 594D   0006
        CLRC                                    ; 594E   0006
        CLRC                                    ; 594F   0006
        CLRC                                    ; 5950   0006
        CLRC                                    ; 5951   0006
        CLRC                                    ; 5952   0006
L_5953:
        PSHR    R5                              ; 5953   0275

        JSR     R5,     L_5971                  ; 5954   0004 0158 0171

        MVII    #$0007, R0                      ; 5957   02B8 0007
        SUB     G_016C, R0                      ; 5959   0300 016C
        CMPI    #$0004, R0                      ; 595B   0378 0004
        BC      L_5962                          ; 595D   0201 0003

        SLR     R0,     1                       ; 595F   0060
        INCR    R0                              ; 5960   0008
        INCR    R7                              ; 5961   000F

L_5962:
        DECR    R0                              ; 5962   0010
L_5963:
        MVO     R0,     G_015E                  ; 5963   0240 015E
        MVII    #$031D, R1                      ; 5965   02B9 031D

        JSR     R5,     .EXEC.777               ; 5967   0004 0114 0377

        MVII    #$0055, R3                      ; 596A   02BB 0055
        SUB     G_016C, R3                      ; 596C   0303 016C
        J       L_51C3                          ; 596E   0004 0350 01C3

L_5971:
        PSHR    R5                              ; 5971   0275

        JSR     R5,     L_5995                  ; 5972   0004 0158 0195

        MOVR    R3,     R1                      ; 5975   0099
        TSTR    R0                              ; 5976   0080
        SWAP    R0,     1                       ; 5977   0040
        SWAP    R0,     1                       ; 5978   0040
        TSTR    R0                              ; 5979   0080
        ADDR    R0,     R0                      ; 597A   00C0
        CMPR    R0,     R0                      ; 597B   0140
        ANDR    R0,     R0                      ; 597C   0180
        SUBR    R0,     R0                      ; 597D   0100
        TSTR    R0                              ; 597E   0080
        SWAP    R0,     1                       ; 597F   0040
        SWAP    R0,     1                       ; 5980   0040
        TSTR    R0                              ; 5981   0080
        SUBR    R0,     R0                      ; 5982   0100
        ANDR    R0,     R0                      ; 5983   0180
        B       L_5B06                          ; 5984   0200 0180

        DECLE   $0100,  $0080,  $0040,  $00C0   ; 5986   0100 0080 0040 00C0
        DECLE   $0140,  $0200,  $0280           ; 598A   0140 0200 0280

        B       L_5B0F                          ; 598D   0200 0180

        ADDR    R0,     R0                      ; 598F   00C0
        SWAP    R0,     1                       ; 5990   0040
        TSTR    R0                              ; 5991   0080
        CMPR    R0,     R0                      ; 5992   0140
        MVO     R0,     G_0300                  ; 5993   0240 0300
L_5995:
        MVI     G_016C, R2                      ; 5995   0282 016C
        ADDR    R2,     R5                      ; 5997   00D5
        MVI     G_015D, R1                      ; 5998   0281 015D
        MOVR    R1,     R3                      ; 599A   008B
        SLL     R1,     2                       ; 599B   004D
        SLL     R1,     1                       ; 599C   0049
        ADDR    R1,     R5                      ; 599D   00CD
        MVI@    R5,     R1                      ; 599E   02A9
        MVII    #$0003, R0                      ; 599F   02B8 0003
        CMPR    R0,     R3                      ; 59A1   0143
        BNEQ    L_59A5                          ; 59A2   020C 0001

        INCR    R0                              ; 59A4   0008
L_59A5:
        CMPR    R0,     R2                      ; 59A5   0142
        BC      L_59A9                          ; 59A6   0201 0001

        NEGR    R1                              ; 59A8   0021
L_59A9:
        MVO     R1,     G_018E                  ; 59A9   0241 018E
        SWAP    R1,     1                       ; 59AB   0041
        MVO     R1,     G_018F                  ; 59AC   0241 018F
        J       L_5C07                          ; 59AE   0004 035C 0007

        DECLE   $0038,  $0000,  $0035           ; 59B1   0038 0000 0035

        NEGR    R0                              ; 59B4   0020
        RSWD    R0                              ; 59B5   0038
        SWAP    R3,     1                       ; 59B6   0043
        NEGR    R0                              ; 59B7   0020
        NEGR    R0                              ; 59B8   0020
        GSWD    R0                              ; 59B9   0030
        SLR     R0,     2                       ; 59BA   0064
        SLL     R0,     1                       ; 59BB   0048
        NEGR    R5                              ; 59BC   0025
        SWAP    R1,     2                       ; 59BD   0045
        MOVR    R0,     R6                      ; 59BE   0086
        NEGR    R0                              ; 59BF   0020
        NEGR    R0                              ; 59C0   0020
        SWAP    R0,     1                       ; 59C1   0040
        MOVR    R4,     R7                      ; 59C2   00A7

        DECLE   $0020,  $0020,  $0038,  $0001   ; 59C3   0020 0020 0038 0001

        ADCR    R0                              ; 59C7   0028
        NEGR    R0                              ; 59C8   0020
        RSWD    R0                              ; 59C9   0038
        MOVR    R0,     R6                      ; 59CA   0086
        NEGR    R0                              ; 59CB   0020
        NEGR    R0                              ; 59CC   0020
        GSWD    R0                              ; 59CD   0030
        SLR     R0,     2                       ; 59CE   0064
        NEGR    R0                              ; 59CF   0020
        NEGR    R0                              ; 59D0   0020
        GSWD    R0                              ; 59D1   0030
        SWAP    R3,     1                       ; 59D2   0043
        NEGR    R0                              ; 59D3   0020
        NEGR    R0                              ; 59D4   0020
        SWAP    R0,     1                       ; 59D5   0040
        MOVR    R4,     R7                      ; 59D6   00A7

        SLL     R0,     1                       ; 59D7   0048
        NEGR    R5                              ; 59D8   0025
        SWAP    R1,     2                       ; 59D9   0045
        EIS                                     ; 59DA   0002
        GSWD    R0                              ; 59DB   0030
        NEGR    R0                              ; 59DC   0020
        RSWD    R0                              ; 59DD   0038
        SWAP    R3,     1                       ; 59DE   0043
        NEGR    R0                              ; 59DF   0020
        NEGR    R0                              ; 59E0   0020
        GSWD    R0                              ; 59E1   0030
        SLR     R0,     2                       ; 59E2   0064
        SLL     R0,     1                       ; 59E3   0048
        NEGR    R5                              ; 59E4   0025
        SWAP    R1,     2                       ; 59E5   0045
        MOVR    R0,     R6                      ; 59E6   0086
        NEGR    R0                              ; 59E7   0020
        NEGR    R0                              ; 59E8   0020
        SWAP    R0,     1                       ; 59E9   0040
        MOVR    R4,     R7                      ; 59EA   00A7

        DECLE   $0020,  $0020,  $0000           ; 59EB   0020 0020 0000
L_59EE:
        MVII    #$0032, R1                      ; 59EE   02B9 0032
        INCR    R7                              ; 59F0   000F

L_59F1:
        CLRR    R1                              ; 59F1   01C9
L_59F2:
        PSHR    R5                              ; 59F2   0275
        MVO     R1,     G_017D                  ; 59F3   0241 017D
        SWAP    R1,     1                       ; 59F5   0041
        MVII    #$0200, R4                      ; 59F6   02BC 0200
        MVII    #$0028, R0                      ; 59F8   02B8 0028

        JSR     R5,     X_FILL_MEM              ; 59FA   0004 0114 0341
        JSR     R4,     L_5A13                  ; 59FD   0004 0058 0213
        DECLE   $0200,  $0043,  $0041,  $0052   ; 5A00   0200 0043 0041 0052
        DECLE   $0020,  $0050,  $0041,  $0053   ; 5A04   0020 0050 0041 0053
        DECLE   $0053,  $003A,  $0000,  $0218   ; 5A08   0053 003A 0000 0218
        DECLE   $0054,  $0049,  $004D,  $0045   ; 5A0C   0054 0049 004D 0045
        DECLE   $003A,  $0000,  $0000           ; 5A10   003A 0000 0000
L_5A13:
        JSR     R5,     L_5B4F                  ; 5A13   0004 0158 034F
        JSR     R5,     L_5594                  ; 5A16   0004 0154 0194
        JSR     R5,     L_57D6                  ; 5A19   0004 0154 03D6
        JSR     R5,     L_5602                  ; 5A1C   0004 0154 0202
        JSR     R5,     L_5971                  ; 5A1F   0004 0158 0171

        CLRR    R0                              ; 5A22   01C0
        INCR    R7                              ; 5A23   000F

L_5A24:
        PSHR    R5                              ; 5A24   0275
L_5A25:
        MVII    #$017A, R2                      ; 5A25   02BA 017A
        MVII    #$0064, R4                      ; 5A27   02BC 0064
L_5A29:
        MVI@    R2,     R1                      ; 5A29   0291
        ADDR    R0,     R1                      ; 5A2A   00C1
        MVO@    R1,     R2                      ; 5A2B   0251
        CMPR    R4,     R1                      ; 5A2C   0161
        BNC     L_5A38                          ; 5A2D   0209 0009

        SUBR    R4,     R1                      ; 5A2F   0121
        MVO@    R1,     R2                      ; 5A30   0251
        MVII    #$0001, R0                      ; 5A31   02B8 0001
        INCR    R2                              ; 5A33   000A
        CMPI    #$017D, R2                      ; 5A34   037A 017D
        BNEQ    L_5A29                          ; 5A36   022C 000E

L_5A38:
        MVII    #$017A, R2                      ; 5A38   02BA 017A

        JSR     R5,     L_5A4D                  ; 5A3A   0004 0158 024D

        MVII    #$0002, R1                      ; 5A3D   02B9 0002
        MVII    #$0212, R4                      ; 5A3F   02BC 0212
L_5A41:
        MVI@    R2,     R0                      ; 5A41   0290
        INCR    R2                              ; 5A42   000A

        JSR     R5,     X_PRNUM_ZRO             ; 5A43   0004 0118 00AD

        SUBI    #$0002, R4                      ; 5A46   033C 0002
        CMPI    #$020C, R4                      ; 5A48   037C 020C
        BNEQ    L_5A41                          ; 5A4A   022C 000A
        PULR    R7                              ; 5A4C   02B7

L_5A4D:
        MVI     G_017D, R3                      ; 5A4D   0283 017D
        SWAP    R3,     1                       ; 5A4F   0043
        ADDI    #$0007, R3                      ; 5A50   02FB 0007
        MOVR    R5,     R7                      ; 5A52   00AF

L_5A53:
        PSHR    R5                              ; 5A53   0275
        MVI     G_015F, R0                      ; 5A54   0280 015F
        DECR    R0                              ; 5A56   0010
        MVO     R0,     G_015F                  ; 5A57   0240 015F
        BEQ     L_5A5C                          ; 5A59   0204 0001
        PULR    R7                              ; 5A5B   02B7

L_5A5C:
        MVII    #$0002, R0                      ; 5A5C   02B8 0002

        JSR     R5,     L_5A24                  ; 5A5E   0004 0158 0224

        MVI     G_015E, R0                      ; 5A61   0280 015E
        MVO     R0,     G_015F                  ; 5A63   0240 015F
        MVI     G_0164, R0                      ; 5A65   0280 0164
        SDBD                                    ; 5A67   0001
        MVII    #$6407, R5                      ; 5A68   02BD 0007 0064
        ADDR    R0,     R5                      ; 5A6B   00C5
        ADDR    R0,     R5                      ; 5A6C   00C5
        SDBD                                    ; 5A6D   0001
        MVI@    R5,     R4                      ; 5A6E   02AC
        INCR    R0                              ; 5A6F   0008
        MVII    #$0003, R1                      ; 5A70   02B9 0003
        ANDR    R0,     R1                      ; 5A72   0181
        BNEQ    L_5ADC                          ; 5A73   020C 0067

        SUBI    #$0003, R0                      ; 5A75   0338 0003
        MVI     G_0181, R1                      ; 5A77   0281 0181
        DECR    R1                              ; 5A79   0011
        MVO     R1,     G_0181                  ; 5A7A   0241 0181
        BNEQ    L_5ADC                          ; 5A7C   020C 005E

        MVI     G_0180, R0                      ; 5A7E   0280 0180
        CMPI    #$0006, R0                      ; 5A80   0378 0006
        BNEQ    L_5A8C                          ; 5A82   020C 0008

        JSR     R5,     L_59EE                  ; 5A84   0004 0158 01EE

        MVII    #$0325, R1                      ; 5A87   02B9 0325
        MVI@    R1,     R0                      ; 5A89   0288
        DECR    R0                              ; 5A8A   0010
        MVO@    R0,     R1                      ; 5A8B   0248
L_5A8C:
        MVI     G_0182, R0                      ; 5A8C   0280 0182
L_5A8E:
        SDBD                                    ; 5A8E   0001
        MVII    #$59B1, R5                      ; 5A8F   02BD 00B1 0059
        ADDR    R0,     R5                      ; 5A92   00C5
        MVI@    R5,     R1                      ; 5A93   02A9
        ANDR    R1,     R1                      ; 5A94   0189
        BNEQ    L_5A9A                          ; 5A95   020C 0003

        CLRR    R0                              ; 5A97   01C0
        B       L_5A8E                          ; 5A98   0220 000B

L_5A9A:
        MVO     R1,     G_0181                  ; 5A9A   0241 0181
        ADDI    #$0002, R0                      ; 5A9C   02F8 0002
        MVO     R0,     G_0182                  ; 5A9E   0240 0182
        MVI@    R5,     R1                      ; 5AA0   02A9
        MOVR    R1,     R0                      ; 5AA1   0088
        ANDI    #$0007, R1                      ; 5AA2   03B9 0007
        MVO     R1,     G_0180                  ; 5AA4   0241 0180
        SLR     R0,     2                       ; 5AA6   0064
        SLR     R0,     1                       ; 5AA7   0060
        SDBD                                    ; 5AA8   0001
        MVII    #$6407, R5                      ; 5AA9   02BD 0007 0064
        ADDR    R0,     R5                      ; 5AAC   00C5
        ADDR    R0,     R5                      ; 5AAD   00C5
        SDBD                                    ; 5AAE   0001
        MVI@    R5,     R2                      ; 5AAF   02AA
        SDBD                                    ; 5AB0   0001
        MVI@    R5,     R4                      ; 5AB1   02AC
        ADDI    #$0002, R0                      ; 5AB2   02F8 0002
        MVO     R0,     G_0164                  ; 5AB4   0240 0164

        JSRD    R5,     L_5B96                  ; 5AB6   0004 015A 0396

        MVI     G_0180, R0                      ; 5AB9   0280 0180
        CMPI    #$0006, R0                      ; 5ABB   0378 0006
        BEQ     L_5AD0                          ; 5ABD   0204 0011

        CLRR    R5                              ; 5ABF   01ED
        CMPI    #$0007, R0                      ; 5AC0   0378 0007
        BNEQ    L_5AC8                          ; 5AC2   020C 0004

        MVO     R5,     G_018A                  ; 5AC4   0245 018A
        B       L_5AE0                          ; 5AC6   0200 0018

L_5AC8:
        CMPI    #$0005, R0                      ; 5AC8   0378 0005
        BNEQ    L_5AE0                          ; 5ACA   020C 0014

        MVO     R5,     G_0191                  ; 5ACC   0245 0191
        B       L_5AE0                          ; 5ACE   0200 0010

L_5AD0:
        PSHR    R4                              ; 5AD0   0274

        JSR     R5,     L_59F1                  ; 5AD1   0004 0158 01F1

        PULR    R4                              ; 5AD4   02B4
        MVII    #$0325, R1                      ; 5AD5   02B9 0325
        MVI@    R1,     R0                      ; 5AD7   0288
        INCR    R0                              ; 5AD8   0008
        MVO@    R0,     R1                      ; 5AD9   0248
        B       L_5AE0                          ; 5ADA   0200 0004

L_5ADC:
        MVO     R0,     G_0164                  ; 5ADC   0240 0164
        INCR    R7                              ; 5ADE   000F

L_5ADF:
        PSHR    R5                              ; 5ADF   0275
L_5AE0:
        SDBD                                    ; 5AE0   0001
        MVII    #$6437, R3                      ; 5AE1   02BB 0037 0064
        MVI     G_0180, R0                      ; 5AE4   0280 0180
        CMPI    #$0001, R0                      ; 5AE6   0378 0001
        BEQ     L_5AF0                          ; 5AE8   0204 0006

        CMPI    #$0002, R0                      ; 5AEA   0378 0002
        BNEQ    L_5AF2                          ; 5AEC   020C 0004

        ADDI    #$0050, R3                      ; 5AEE   02FB 0050
L_5AF0:
        ADDI    #$0120, R3                      ; 5AF0   02FB 0120
L_5AF2:
        MVII    #$0228, R5                      ; 5AF2   02BD 0228
        MOVR    R4,     R2                      ; 5AF4   00A2
        B       L_5AFD                          ; 5AF5   0200 0006

L_5AF7:
        MOVR    R3,     R4                      ; 5AF7   009C
        SLL     R1,     1                       ; 5AF8   0049
        ADDR    R1,     R4                      ; 5AF9   00CC
        SDBD                                    ; 5AFA   0001
        MVI@    R4,     R0                      ; 5AFB   02A0
        MVO@    R0,     R5                      ; 5AFC   0268
L_5AFD:
        MVI@    R2,     R1                      ; 5AFD   0291
        INCR    R2                              ; 5AFE   000A
        ANDR    R1,     R1                      ; 5AFF   0189
        BEQ     L_5B0B                          ; 5B00   0204 0009

        SARC    R1,     1                       ; 5B02   0079
        BC      L_5AF7                          ; 5B03   0221 000D

L_5B05:
        MVO@    R0,     R5                      ; 5B05   0268
L_5B06:
        DECR    R1                              ; 5B06   0011
        BNEQ    L_5B05                          ; 5B07   022C 0003
        B       L_5AFD                          ; 5B09   0220 000D
L_5B0B:
        PULR    R7                              ; 5B0B   02B7

.TITLE:
        DECLE   $0020                           ; 5B0C  Cartridge year
        DECLE   $0000                           ; 5B0D  

.TITLECODE:
        PSHR    R5                              ; 5B0E   0275
L_5B0F:
        MVII    #$00F0, R0                      ; 5B0F   02B8 00F0
        MVII    #$0200, R4                      ; 5B11   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5B13   0004 0114 0338

        SDBD                                    ; 5B16   0001
        MVII    #$0807, R0                      ; 5B17   02B8 0007 0008
        MVO     R0,     .BTAB.CA                ; 5B1A   0240 02CA
        ADDI    #$0008, R0                      ; 5B1C   02F8 0008
        MVO     R0,     .BTAB.83                ; 5B1E   0240 0283

        JSR     R4,     L_5B50                  ; 5B20   0004 0058 0350
        DECLE   $023F,  $0054,  $0048,  $0045   ; 5B23   023F 0054 0048 0045
        DECLE   $0020,  $004F,  $0046,  $0046   ; 5B27   0020 004F 0046 0046
        DECLE   $0049,  $0043,  $0049,  $0041   ; 5B2B   0049 0043 0049 0041
        DECLE   $004C,  $0000,  $027E,  $0054   ; 5B2F   004C 0000 027E 0054
        DECLE   $0055,  $0052,  $0042,  $004F   ; 5B33   0055 0052 0042 004F
        DECLE   $0000,  $02A5,  $0062,  $0079   ; 5B37   0000 02A5 0062 0079
        DECLE   $0020,  $0053,  $0065,  $0067   ; 5B3B   0020 0053 0065 0067
        DECLE   $0061,  $0000,  $02CC,  $0031   ; 5B3F   0061 0000 02CC 0031
        DECLE   $0039,  $0038,  $0033,  $0020   ; 5B43   0039 0038 0033 0020
        DECLE   $0043,  $004F,  $004C,  $0045   ; 5B47   0043 004F 004C 0045
        DECLE   $0043,  $004F,  $0000,  $0000   ; 5B4B   0043 004F 0000 0000
L_5B4F:
        PSHR    R5                              ; 5B4F   0275
L_5B50:
        MOVR    R4,     R5                      ; 5B50   00A5
L_5B51:
        MVI@    R5,     R4                      ; 5B51   02AC
        ANDR    R4,     R4                      ; 5B52   01A4
        BEQ     L_5B0B                          ; 5B53   0224 0049

        PSHR    R5                              ; 5B55   0275
        MOVR    R5,     R1                      ; 5B56   00A9

        JSR     R5,     L_5A4D                  ; 5B57   0004 0158 024D
        JSR     R5,     X_PRINT_R1              ; 5B5A   0004 0118 0067

        PULR    R5                              ; 5B5D   02B5
L_5B5E:
        MVI@    R5,     R4                      ; 5B5E   02AC
        ANDR    R4,     R4                      ; 5B5F   01A4
        BNEQ    L_5B5E                          ; 5B60   022C 0003
        B       L_5B51                          ; 5B62   0220 0012

        SDBD                                    ; 5B64   0001
        MVII    #$3800, R5                      ; 5B65   02BD 0000 0038
        SDBD                                    ; 5B68   0001
        MVII    #$5D76, R3                      ; 5B69   02BB 0076 005D
        MVI     G_017F, R2                      ; 5B6C   0282 017F
        SWAP    R2,     1                       ; 5B6E   0042
        ADD     G_017E, R2                      ; 5B6F   02C2 017E
        DIS                                     ; 5B71   0003
L_5B72:
        MOVR    R2,     R4                      ; 5B72   0094
        MVII    #$0008, R0                      ; 5B73   02B8 0008
        MVI@    R4,     R1                      ; 5B75   02A1
        SARC    R1,     1                       ; 5B76   0079
        BNC     L_5B7D                          ; 5B77   0209 0004

        MVI@    R4,     R0                      ; 5B79   02A0
        ANDR    R0,     R0                      ; 5B7A   0180
        BEQ     L_5B89                          ; 5B7B   0204 000C

L_5B7D:
        MOVR    R4,     R2                      ; 5B7D   00A2
        MOVR    R3,     R4                      ; 5B7E   009C
        SLL     R1,     1                       ; 5B7F   0049
        SLL     R1,     2                       ; 5B80   004D
        ADDR    R1,     R4                      ; 5B81   00CC
L_5B82:
        MVI@    R4,     R1                      ; 5B82   02A1
        MVO@    R1,     R5                      ; 5B83   0269
        DECR    R0                              ; 5B84   0010
        BNEQ    L_5B82                          ; 5B85   022C 0004
        B       L_5B72                          ; 5B87   0220 0016

L_5B89:
        MVII    #$0026, R0                      ; 5B89   02B8 0026
        MVO     R0,     .ISRVEC.0               ; 5B8B   0240 0100
        MVII    #$0011, R0                      ; 5B8D   02B8 0011
        MVO     R0,     .ISRVEC.1               ; 5B8F   0240 0101
        MVO     R0,     G_0186                  ; 5B91   0240 0186
        J       .EXEC.00D                       ; 5B93   0004 0310 000D

L_5B96:
        MVII    #$0064, R1                      ; 5B96   02B9 0064
        MVO     R1,     .ISRVEC.0               ; 5B98   0241 0100
        MVII    #$005B, R1                      ; 5B9A   02B9 005B
        MVO     R1,     .ISRVEC.1               ; 5B9C   0241 0101
        MVO     R2,     G_017E                  ; 5B9E   0242 017E
        SWAP    R2,     1                       ; 5BA0   0042
        MVO     R2,     G_017F                  ; 5BA1   0242 017F
        CLRR    R0                              ; 5BA3   01C0
        MVO     R0,     G_0186                  ; 5BA4   0240 0186
L_5BA6:
        EIS                                     ; 5BA6   0002
        CMP     G_0186, R0                      ; 5BA7   0340 0186
        BEQ     L_5BA6                          ; 5BA9   0224 0004
        MOVR    R5,     R7                      ; 5BAB   00AF

.GFX_LIST_5BAC:
        DECLE   $007E,  $0081,  $00BD,  $00A1   ; 5BAC  CART PIC #00
        DECLE   $00A1,  $00BD,  $0081,  $007E   ; 5BB0  
        DECLE   $00F1,  $005B,  $0055,  $0051   ; 5BB4  CART PIC #01
        DECLE   $0051,  $0000,  $0000,  $0000   ; 5BB8  
.GRAM_INIT_5BBC:
        DECLE   $0002           ; 5BBC  # of GRAM cards to init
        DECLE   $0000           ; 5BBD  #00   :  CART #00    ----
        DECLE   $0002           ; 5BBE  #01   :  CART #01    ----

L_5BBF:
        PSHR    R1                              ; 5BBF   0271
        PSHR    R2                              ; 5BC0   0272
        MVI     G_0187, R0                      ; 5BC1   0280 0187
        MOVR    R0,     R1                      ; 5BC3   0081
        MOVR    R0,     R2                      ; 5BC4   0082
        SWAP    R1,     1                       ; 5BC5   0041
        TSTR    R1                              ; 5BC6   0089
        BPL     L_5BCA                          ; 5BC7   0203 0001

        INCR    R2                              ; 5BC9   000A
L_5BCA:
        SLL     R1,     1                       ; 5BCA   0049
        BPL     L_5BCE                          ; 5BCB   0203 0001

        INCR    R2                              ; 5BCD   000A
L_5BCE:
        SLL     R1,     1                       ; 5BCE   0049
        BPL     L_5BD2                          ; 5BCF   0203 0001

        INCR    R2                              ; 5BD1   000A
L_5BD2:
        RRC     R2,     1                       ; 5BD2   0072
        RLC     R0,     1                       ; 5BD3   0050
        MVO     R0,     G_0187                  ; 5BD4   0240 0187
        DECR    R0                              ; 5BD6   0010
        PULR    R2                              ; 5BD7   02B2
        PULR    R1                              ; 5BD8   02B1
        MOVR    R5,     R7                      ; 5BD9   00AF

L_5BDA:
        PSHR    R5                              ; 5BDA   0275

        JSR     R5,     X_PLAY_SFX2             ; 5BDB   0004 0118 03BE
        DECLE   $0098                           ; 5BDE  SFX prio
        DECLE   $0079                           ; 5BDF  SFX data
        DECLE   $03ED                           ; 5BE0  SFX data
        DECLE   $021D                           ; 5BE1  SFX data
        DECLE   $03F5                           ; 5BE2  SFX data
        DECLE   $03FE                           ; 5BE3  SFX data
        DECLE   $0057,  $0040                   ; 5BE4  SFX data
        DECLE   $0003,  $03E8                   ; 5BE6  SFX data
        DECLE   $008F,  $0028                   ; 5BE8  SFX data
        DECLE   $00CF                           ; 5BEA  SFX end


        INCR    R7                              ; 5BEB   000F

L_5BEC:
        PSHR    R5                              ; 5BEC   0275

L_5BED:
        JSR     R5,     L_5C5C                  ; 5BED   0004 015C 005C

        BEQ     L_5C0C                          ; 5BF0   0204 001A

L_5BF2:
        MVII    #$0080, R0                      ; 5BF2   02B8 0080

        JSR     R5,     X_PLAY_SFX2             ; 5BF4   0004 0118 03BE
        DECLE   $0090                           ; 5BF7  SFX prio
        DECLE   $0389                           ; 5BF8  SFX data
        DECLE   $02C0,  $0050                   ; 5BF9  SFX data
        DECLE   $02C8,  $00A0                   ; 5BFB  SFX data
        DECLE   $008F,  $0017                   ; 5BFD  SFX data
        DECLE   $02C0,  $0090                   ; 5BFF  SFX data
        DECLE   $02C8,  $0120                   ; 5C01  SFX data
        DECLE   $0383,  $03D0                   ; 5C03  SFX data
        DECLE   $03CF                           ; 5C05  SFX end

L_5C06:
        PSHR    R5                              ; 5C06   0275

L_5C07:
        JSR     R5,     L_5C5C                  ; 5C07   0004 015C 005C

        BNEQ    L_5C64                          ; 5C0A   020C 0058

L_5C0C:
        JSR     R5,     L_5C47                  ; 5C0C   0004 015C 0047
        DECLE   $0044,  $00F8,  $000C,  $007C   ; 5C0F   0044 00F8 000C 007C
        DECLE   $03B9,  $020B,  $03CF,  $0044   ; 5C13   03B9 020B 03CF 0044
        DECLE   $00F0,  $000C,  $0078,  $03B9   ; 5C17   00F0 000C 0078 03B9
        DECLE   $020B,  $03CF,  $0044,  $00E8   ; 5C1B   020B 03CF 0044 00E8
        DECLE   $000C,  $0074,  $03B9,  $020B   ; 5C1F   000C 0074 03B9 020B
        DECLE   $03CF,  $0044,  $00E0,  $000C   ; 5C23   03CF 0044 00E0 000C
        DECLE   $0070,  $03B9,  $020B,  $03CF   ; 5C27   0070 03B9 020B 03CF
        DECLE   $0044,  $00D8,  $000C,  $006C   ; 5C2B   0044 00D8 000C 006C
        DECLE   $03B9,  $020B,  $03CF,  $0044   ; 5C2F   03B9 020B 03CF 0044
        DECLE   $00D0,  $000C,  $0068,  $03B9   ; 5C33   00D0 000C 0068 03B9
        DECLE   $020B,  $03CF,  $0044,  $00C8   ; 5C37   020B 03CF 0044 00C8
        DECLE   $000C,  $0064,  $03B9,  $020B   ; 5C3B   000C 0064 03B9 020B
        DECLE   $03CF,  $0044,  $00C0,  $000C   ; 5C3F   03CF 0044 00C0 000C
        DECLE   $0060,  $03B9,  $020B,  $03CF   ; 5C43   0060 03B9 020B 03CF
L_5C47:
        MVI     G_016C, R0                      ; 5C47   0280 016C
        MOVR    R0,     R1                      ; 5C49   0081
        SLL     R1,     2                       ; 5C4A   004D
        ADDR    R0,     R1                      ; 5C4B   00C1
        ADDR    R0,     R1                      ; 5C4C   00C1
        ADDR    R0,     R1                      ; 5C4D   00C1
        ADDR    R1,     R5                      ; 5C4E   00CD
        MVII    #$0088, R3                      ; 5C4F   02BB 0088
        J       .EXEC.BBF                       ; 5C51   0004 0318 03BF

L_5C54:
        PSHR    R5                              ; 5C54   0275

        JSR     R5,     X_PLAY_SFX2             ; 5C55   0004 0118 03BE
        DECLE   $00A0                           ; 5C58  SFX prio
        DECLE   $00CF                           ; 5C59  SFX end


        B       L_5C0C                          ; 5C5A   0220 004F

L_5C5C:
        PSHR    R5                              ; 5C5C   0275
        MVI     G_0191, R5                      ; 5C5D   0285 0191
        ANDR    R5,     R5                      ; 5C5F   01AD
        BEQ     L_5C64                          ; 5C60   0204 0002

        CMPI    #$0004, R5                      ; 5C62   037D 0004
L_5C64:
        PULR    R7                              ; 5C64   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5C95   0000 0000 0000
.TIMER:
        DECLE   $002D,  $0052,  $0001,  $0000; 5C98  Timer dispatch/interval
        DECLE   $0053,  $005A,  $0001,  $0000; 5C9C  Timer dispatch/interval
        DECLE   $00B3,  $0056,  $0004,  $0000; 5CA0  Timer dispatch/interval
        DECLE   $007D,  $0055,  $0002,  $0000; 5CA4  Timer dispatch/interval
        DECLE   $0013,  $0056,  $0014,  $0000; 5CA8  Timer dispatch/interval
        DECLE   $00F9,  $0050,  $0001,  $0000; 5CAC  Timer dispatch/interval
        BIDECLE $0000           ; 5CB0  End of timer table

        DECLE   $0000,  $0000,  $0051,  $0050   ; 5CB2   0000 0000 0051 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CBA   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $003C,  $007E   ; 5CBE   0000 0018 003C 007E
        DECLE   $003C,  $003C,  $0000,  $0000   ; 5CC2   003C 003C 0000 0000
        DECLE   $0000,  $0008,  $003C,  $003E   ; 5CC6   0000 0008 003C 003E
        DECLE   $003E,  $003C,  $0008,  $0000   ; 5CCA   003E 003C 0008 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; 5CCE   0000 0000 003C 003C
        DECLE   $007E,  $003C,  $0018,  $0000   ; 5CD2   007E 003C 0018 0000
        DECLE   $0000,  $0010,  $003C,  $007C   ; 5CD6   0000 0010 003C 007C
        DECLE   $007C,  $003C,  $0010,  $0000   ; 5CDA   007C 003C 0010 0000
        DECLE   $0000,  $0024,  $0000,  $0000   ; 5CDE   0000 0024 0000 0000
        DECLE   $00C3,  $00C3,  $00C3,  $00C3   ; 5CE2   00C3 00C3 00C3 00C3
        DECLE   $00F0,  $00F0,  $0010,  $0000   ; 5CE6   00F0 00F0 0010 0000
        DECLE   $0000,  $0010,  $00F0,  $00F0   ; 5CEA   0000 0010 00F0 00F0
        DECLE   $00C3,  $00C3,  $00C3,  $00C3   ; 5CEE   00C3 00C3 00C3 00C3
        DECLE   $0000,  $0000,  $0024,  $0000   ; 5CF2   0000 0000 0024 0000
        DECLE   $000F,  $000F,  $0040,  $0000   ; 5CF6   000F 000F 0040 0000
        DECLE   $0000,  $0040,  $000F,  $000F   ; 5CFA   0000 0040 000F 000F
        DECLE   $0000,  $0008,  $001C,  $003E   ; 5CFE   0000 0008 001C 003E
        DECLE   $001C,  $001C,  $0000,  $0000   ; 5D02   001C 001C 0000 0000
        DECLE   $0000,  $0014,  $0000,  $0000   ; 5D06   0000 0014 0000 0000
        DECLE   $0063,  $0063,  $0063,  $0000   ; 5D0A   0063 0063 0063 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5D0E   0000 0000 0018 003C
        DECLE   $007E,  $003C,  $0000,  $0000   ; 5D12   007E 003C 0000 0000
        DECLE   $0000,  $0000,  $0024,  $0000   ; 5D16   0000 0000 0024 0000
        DECLE   $0000,  $00C3,  $00C3,  $0000   ; 5D1A   0000 00C3 00C3 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1E   0000 0000 0000 0000
        DECLE   $0004,  $000E,  $0004,  $0000   ; 5D22   0004 000E 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D26   0000 0000 0000 0000
        DECLE   $000A,  $0000,  $001B,  $001B   ; 5D2A   000A 0000 001B 001B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2E   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $0000,  $0000   ; 5D32   0000 000C 0000 0000
        DECLE   $0000,  $0000,  $000C,  $001E   ; 5D36   0000 0000 000C 001E
        DECLE   $001F,  $000C,  $0000,  $0000   ; 5D3A   001F 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3E   0000 0000 0000 0000
        DECLE   $0060,  $00F0,  $00F8,  $0060   ; 5D42   0060 00F0 00F8 0060
        DECLE   $0000,  $0000,  $0010,  $0038   ; 5D46   0000 0000 0010 0038
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5D4A   0010 0000 0000 0000
        DECLE   $0000,  $007C,  $006C,  $0044   ; 5D4E   0000 007C 006C 0044
        DECLE   $006C,  $007C,  $007C,  $0000   ; 5D52   006C 007C 007C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D56   0000 0000 0000 0000
        DECLE   $0000,  $0082,  $0082,  $0082   ; 5D5A   0000 0082 0082 0082
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5E   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5D62   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0038   ; 5D66   0000 0000 0000 0038
        DECLE   $0028,  $0038,  $0038,  $0000   ; 5D6A   0028 0038 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $006C,  $006C   ; 5D72   0000 0000 006C 006C
        DECLE   $00C0,  $00FC,  $00FF,  $00FE   ; 5D76   00C0 00FC 00FF 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5D7A   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7E   0000 0000 0000 0000
        DECLE   $00C0,  $0080,  $00E0,  $00F0   ; 5D82   00C0 0080 00E0 00F0
        DECLE   $00F8,  $00FC,  $00F0,  $00FC   ; 5D86   00F8 00FC 00F0 00FC
        DECLE   $00FF,  $00FC,  $00FE,  $00F8   ; 5D8A   00FF 00FC 00FE 00F8
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5D8E   0000 0000 0000 0003
        DECLE   $000F,  $003F,  $001F,  $007F   ; 5D92   000F 003F 001F 007F
        DECLE   $0003,  $003F,  $00FF,  $007F   ; 5D96   0003 003F 00FF 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5D9A   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9E   0000 0000 0000 0000
        DECLE   $0003,  $0001,  $0007,  $000F   ; 5DA2   0003 0001 0007 000F
        DECLE   $001F,  $003F,  $000F,  $003F   ; 5DA6   001F 003F 000F 003F
        DECLE   $00FF,  $003F,  $007F,  $001F   ; 5DAA   00FF 003F 007F 001F
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5DAE   0000 0000 0000 00C0
        DECLE   $00F0,  $00FC,  $00F8,  $00FE   ; 5DB2   00F0 00FC 00F8 00FE
        DECLE   $0001,  $0003,  $0000           ; 5DB6   0001 0003 0000

        DIS                                     ; 5DB9   0003
        INCR    R7                              ; 5DBA   000F

        DIS                                     ; 5DBB   0003
L_5DBC:
        SETC                                    ; 5DBC   0007
        DECLE   $0001,  $0080,  $00C0,  $0000   ; 5DBD   0001 0080 00C0 0000
        DECLE   $00C0,  $00F0,  $00C0,  $00E0   ; 5DC1   00C0 00F0 00C0 00E0
        DECLE   $0080,  $0007,  $0007,  $0007   ; 5DC5   0080 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 5DC9   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 5DCD   0007 0007 0007 0007
        DECLE   $0007,  $0000,  $0000,  $0000   ; 5DD1   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0018,  $003C   ; 5DD5   0000 0000 0018 003C
        DECLE   $007E,  $007E,  $00FF,  $00FF   ; 5DD9   007E 007E 00FF 00FF
        DECLE   $003C,  $00E0,  $00E0,  $00E0   ; 5DDD   003C 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5DE1   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5DE5   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5DE9   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DED   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5DF1   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0080,  $00C0,  $0000   ; 5DF5   00FF 0080 00C0 0000

        ADDR    R0,     R0                      ; 5DF9   00C0
        ADDR    R6,     R3                      ; 5DFA   00F3
        ADDR    R0,     R3                      ; 5DFB   00C3
        ADDR    R4,     R7                      ; 5DFC   00E7

        DECLE   $0083,  $0000,  $0000,  $0000   ; 5DFD   0083 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $00C0   ; 5E01   0000 0080 0080 00C0
        DECLE   $0080,  $00F8,  $00F8,  $00F8   ; 5E05   0080 00F8 00F8 00F8
        DECLE   $00F8,  $00FF,  $00FF,  $00FF   ; 5E09   00F8 00FF 00FF 00FF
        DECLE   $00FF,  $001F,  $001F,  $001F   ; 5E0D   00FF 001F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 5E11   001F 001F 001F 001F
        DECLE   $001F,  $0001,  $0003,  $0000   ; 5E15   001F 0001 0003 0000

        DIS                                     ; 5E19   0003
        ADDR    R1,     R7                      ; 5E1A   00CF

        ADDR    R0,     R3                      ; 5E1B   00C3
        ADDR    R4,     R7                      ; 5E1C   00E7

        DECLE   $00C1,  $0000,  $0000,  $0000   ; 5E1D   00C1 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0003   ; 5E21   0000 0001 0001 0003
        DECLE   $0001,  $001F,  $001F,  $001F   ; 5E25   0001 001F 001F 001F
        DECLE   $001F,  $00FF,  $00FF,  $00FF   ; 5E29   001F 00FF 00FF 00FF
        DECLE   $00FF,  $00F8,  $00F8,  $00F8   ; 5E2D   00FF 00F8 00F8 00F8
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 5E31   00F8 00F8 00F8 00F8
        DECLE   $00F8,  $0000,  $0003,  $000F   ; 5E35   00F8 0000 0003 000F
        DECLE   $0007,  $003F,  $001F,  $007F   ; 5E39   0007 003F 001F 007F
        DECLE   $00FF,  $0000,  $00C0,  $00F0   ; 5E3D   00FF 0000 00C0 00F0
        DECLE   $00E0,  $00FC,  $00F8,  $00FE   ; 5E41   00E0 00FC 00F8 00FE
        DECLE   $00FF,  $0000,  $0000,  $0003   ; 5E45   00FF 0000 0000 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5E49   0003 0003 0003 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E4D   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0007,  $0007   ; 5E51   0000 0007 0007 0007
        DECLE   $0007,  $0000,  $0000,  $0000   ; 5E55   0007 0000 0000 0000
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5E59   0003 0003 0003 0003
        DECLE   $0003,  $0000,  $0000,  $00C0   ; 5E5D   0003 0000 0000 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5E61   00C0 00C0 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E65   0000 0000 0000 0000
        DECLE   $0000,  $00E0,  $00E0,  $00E0   ; 5E69   0000 00E0 00E0 00E0
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5E6D   00E0 0000 0000 0000
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5E71   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $0003,  $0003,  $0000   ; 5E75   00C0 0003 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5E79   0000 0000 0000 0007
        DECLE   $0007,  $00C0,  $00C0,  $0000   ; 5E7D   0007 00C0 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $00E0   ; 5E81   0000 0000 0000 00E0
        DECLE   $00E0,  $0001,  $0001,  $0001   ; 5E85   00E0 0001 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5E89   0001 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $0080   ; 5E8D   0000 0080 0080 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5E91   0080 0000 0000 0000
        DECLE   $0000,  $0007,  $0007,  $0000   ; 5E95   0000 0007 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E99   0000 0000 0000 0000
        DECLE   $0000,  $00E0,  $00E0,  $0000   ; 5E9D   0000 00E0 00E0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA1   0000 0000 0000 0000
        DECLE   $0000,  $00E0,  $00C0,  $0080   ; 5EA5   0000 00E0 00C0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA9   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $0003,  $0001   ; 5EAD   0000 0007 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB1   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 5EB5   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00FC,  $00F8   ; 5EB9   00FF 00FE 00FC 00F8
        DECLE   $00F0,  $00FF,  $00FF,  $00FF   ; 5EBD   00F0 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $003F,  $001F   ; 5EC1   00FF 007F 003F 001F

        INCR    R7                              ; 5EC5   000F
        ADDR    R4,     R7                      ; 5EC6   00E7
L_5EC7:
        ADDR    R4,     R7                      ; 5EC7   00E7
        ADDR    R4,     R7                      ; 5EC8   00E7
        ADDR    R4,     R7                      ; 5EC9   00E7

        ADDR    R4,     R6                      ; 5ECA   00E6
        ADDR    R7,     R4                      ; 5ECB   00FC
        ADDR    R7,     R0                      ; 5ECC   00F8
        ADDR    R6,     R0                      ; 5ECD   00F0
        ADDR    R4,     R7                      ; 5ECE   00E7
        ADDR    R4,     R7                      ; 5ECF   00E7
        ADDR    R4,     R7                      ; 5ED0   00E7
        ADDR    R4,     R7                      ; 5ED1   00E7

        DECLE   $0067,  $003F,  $001F,  $000F   ; 5ED2   0067 003F 001F 000F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 5ED6   001F 001F 001F 001F
        DECLE   $00FE,  $00FC,  $00F8,  $00F0   ; 5EDA   00FE 00FC 00F8 00F0
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 5EDE   00F8 00F8 00F8 00F8
        DECLE   $007F,  $003F,  $001F           ; 5EE2   007F 003F 001F

        INCR    R7                              ; 5EE5   000F

        ADDR    R7,     R6                      ; 5EE6   00FE
L_5EE7:
        ADDR    R7,     R6                      ; 5EE7   00FE
        DECLE   $00FF,  $00FF,  $00FE,  $00FC   ; 5EE8   00FF 00FF 00FE 00FC
        DECLE   $00F8,  $00F0,  $007F,  $007F   ; 5EEC   00F8 00F0 007F 007F
        DECLE   $00FF,  $00FF,  $007F,  $003F   ; 5EF0   00FF 00FF 007F 003F
        DECLE   $001F                           ; 5EF4   001F

        INCR    R7                              ; 5EF5   000F

        RSWD    R4                              ; 5EF6   003C
L_5EF7:
        RSWD    R4                              ; 5EF7   003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 5EF8   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0080,  $0080   ; 5EFC   003C 003C 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5F00   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $003C,  $003C   ; 5F04   0080 0080 003C 003C
        DECLE   $003C,  $003C,  $003C,  $001C   ; 5F08   003C 003C 003C 001C
        DECLE   $000C,  $0004,  $003F,  $003F   ; 5F0C   000C 0004 003F 003F
        DECLE   $003F,  $003F,  $003F,  $000F   ; 5F10   003F 003F 003F 000F
        DECLE   $0003,  $0000,  $00FF,  $00FF   ; 5F14   0003 0000 00FF 00FF
        DECLE   $00FF,  $003F,  $0007,  $0000   ; 5F18   00FF 003F 0007 0000
        DECLE   $0000,  $0000,  $00FC,  $00FC   ; 5F1C   0000 0000 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00F8   ; 5F20   00FC 00FC 00FC 00F8
        DECLE   $00F8,  $00F8,  $00FE,  $00C0   ; 5F24   00F8 00F8 00FE 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0071,  $0071   ; 5F2C   0000 0000 0071 0071
        DECLE   $0071,  $0071,  $0071,  $0071   ; 5F30   0071 0071 0071 0071
        DECLE   $0071,  $0071,  $0071,  $0071   ; 5F34   0071 0071 0071 0071
        DECLE   $0031,  $0011,  $0001,  $0001   ; 5F38   0031 0011 0001 0001
        DECLE   $0001,  $0001,  $00FF,  $00FF   ; 5F3C   0001 0001 00FF 00FF
        DECLE   $00FF,  $00F0,  $00C0,  $0000   ; 5F40   00FF 00F0 00C0 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5F44   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; 5F48   00FF 00FF 00FF 00FE
        DECLE   $00F0,  $00C0,  $00FF,  $00FC   ; 5F4C   00F0 00C0 00FF 00FC
        DECLE   $00E0,  $0080,  $0000,  $0000   ; 5F50   00E0 0080 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5F54   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00F8   ; 5F58   00FF 00FF 00FE 00F8
        DECLE   $00E0,  $0080,  $00FF,  $00FE   ; 5F5C   00E0 0080 00FF 00FE
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; 5F60   00F8 00F0 00E0 00C0
        DECLE   $0080,  $0000,  $00FE,  $00FC   ; 5F64   0080 0000 00FE 00FC
        DECLE   $00F8,  $00F0,  $00E0,  $00E0   ; 5F68   00F8 00F0 00E0 00E0
        DECLE   $00C0,  $00C0,  $0080,  $0080   ; 5F6C   00C0 00C0 0080 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5F70   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0070   ; 5F74   0000 0000 00F0 0070
        DECLE   $0030,  $0010,  $0000,  $0000   ; 5F78   0030 0010 0000 0000
        DECLE   $0000,  $0000,  $003F,  $000F   ; 5F7C   0000 0000 003F 000F
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5F80   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 5F84   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $003F   ; 5F88   00FF 00FF 00FF 003F
        DECLE   $000F,  $0000                   ; 5F8C   000F 0000

        ADDR    R1,     R7                      ; 5F8E   00CF
        ADDR    R1,     R7                      ; 5F8F   00CF
        ADDR    R1,     R7                      ; 5F90   00CF
        ADDR    R1,     R7                      ; 5F91   00CF
        ADDR    R1,     R7                      ; 5F92   00CF
        ADDR    R1,     R7                      ; 5F93   00CF
        ADDR    R1,     R7                      ; 5F94   00CF
        ADDR    R1,     R7                      ; 5F95   00CF

        SLL     R3,     2                       ; 5F96   004F
        INCR    R7                              ; 5F97   000F
        INCR    R7                              ; 5F98   000F
L_5F99:
        INCR    R7                              ; 5F99   000F
L_5F9A:
        INCR    R7                              ; 5F9A   000F

L_5F9B:
        SETC                                    ; 5F9B   0007
L_5F9C:
        DIS                                     ; 5F9C   0003
        DECLE   $0001                           ; 5F9D   0001

        INCR    R7                              ; 5F9E   000F
        INCR    R7                              ; 5F9F   000F
L_5FA0:
        INCR    R7                              ; 5FA0   000F
L_5FA1:
        INCR    R7                              ; 5FA1   000F

L_5FA2:
        SETC                                    ; 5FA2   0007
L_5FA3:
        DIS                                     ; 5FA3   0003
        DECLE   $0001,  $0000,  $000F,  $000F   ; 5FA4   0001 0000 000F 000F
        DECLE   $000F,  $000F,  $0007,  $0001   ; 5FA8   000F 000F 0007 0001
        DECLE   $0000,  $0000,  $00F0,  $00F0   ; 5FAC   0000 0000 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 5FB0   00F0 00F0 00F0 00F0
        DECLE   $0070,  $0000,  $00FF,  $00FF   ; 5FB4   0070 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; 5FB8   00FF 00FF 00FF 00FE
        DECLE   $00FE,  $00FE,  $0080,  $0000   ; 5FBC   00FE 00FE 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC4   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0030   ; 5FC8   0000 0030 0030 0030
        DECLE   $0030,  $0000,  $0000,  $0000   ; 5FCC   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $000F,  $000F   ; 5FD0   0000 0000 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; 5FD4   000F 000F 000F 000F
        DECLE   $000F,  $000F,  $0000,  $0000   ; 5FD8   000F 000F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; 5FDC   0000 0000 0000 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; 5FE0   000F 000F 000F 000F
        DECLE   $000F,  $0000,  $0000,  $0000   ; 5FE4   000F 0000 0000 0000
        DECLE   $0003,  $0003,  $0003,  $0000   ; 5FE8   0003 0003 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5FEC   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5FF0   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $003C,  $003C   ; 5FF4   0000 0000 003C 003C
        DECLE   $003C,  $003C,  $0000,  $0000   ; 5FF8   003C 003C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5FFC   0000 0000 0000 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6000   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0000,  $00F0   ; 6004   0003 0003 0000 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6008   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 600C   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $0000,  $0000   ; 6010   00F0 00F0 0000 0000
        DECLE   $0000,  $0000,  $007F,  $007F   ; 6014   0000 0000 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 6018   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $00FF,  $0099   ; 601C   007F 007F 00FF 0099
        DECLE   $0099,  $00FF,  $00FF,  $0099   ; 6020   0099 00FF 00FF 0099
        DECLE   $0099,  $00FF,  $0000,  $0080   ; 6024   0099 00FF 0000 0080
        DECLE   $00E0,  $00F8,  $00FC,  $00FF   ; 6028   00E0 00F8 00FC 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0001   ; 602C   00FF 00FF 0000 0001
        DECLE   $0007,  $001F,  $003F,  $00FF   ; 6030   0007 001F 003F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0099   ; 6034   00FF 00FF 00FF 0099
        DECLE   $0099,  $00FF,  $0000,  $0000   ; 6038   0099 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 603C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0099   ; 6040   0000 0000 00FF 0099
        DECLE   $0099,  $00FF,  $0000,  $0000   ; 6044   0099 00FF 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0098   ; 6048   0000 0000 00F0 0098
        DECLE   $009C,  $00FF,  $00FF           ; 604C   009C 00FF 00FF

        MOVR    R3,     R7                      ; 604F   009F
        MOVR    R3,     R7                      ; 6050   009F

        DECLE   $00FF,  $00FF                   ; 6051   00FF 00FF

        MOVR    R3,     R7                      ; 6053   009F
        MOVR    R3,     R7                      ; 6054   009F

        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6055   00FF 0000 0000 0000
        DECLE   $0000                           ; 6059   0000

        INCR    R7                              ; 605A   000F

        COMR    R1                              ; 605B   0019
L_605C:
        RSWD    R1                              ; 605C   0039
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 605D   00FF 0000 0000 0000
        DECLE   $0000,  $00C0,  $00F0,  $00F0   ; 6061   0000 00C0 00F0 00F0
        DECLE   $00F0,  $0080,  $00C0,  $00F0   ; 6065   00F0 0080 00C0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6069   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $0000,  $0000,  $0000   ; 606D   00F0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6071   0000 0000 0000 0001
        DECLE   $0007,  $00FF,  $00FF,  $007F   ; 6075   0007 00FF 00FF 007F
        DECLE   $003F,  $001F                   ; 6079   003F 001F

        INCR    R7                              ; 607B   000F

        SETC                                    ; 607C   0007
L_607D:
        DIS                                     ; 607D   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 607E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00E0   ; 6082   0000 0000 0080 00E0
        DECLE   $00F0,  $00F8,  $00FE,  $00FF   ; 6086   00F0 00F8 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 608A   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00F9,  $00F9,  $00FF   ; 608E   00FF 00F9 00F9 00FF
        DECLE   $00FF,  $00F9,  $00F9,  $00FF   ; 6092   00FF 00F9 00F9 00FF
        DECLE   $00FF,  $00FF                   ; 6096   00FF 00FF

        ADDR    R7,     R6                      ; 6098   00FE
        ADDR    R7,     R4                      ; 6099   00FC
        ADDR    R7,     R0                      ; 609A   00F8
        ADDR    R6,     R0                      ; 609B   00F0
        ADDR    R4,     R0                      ; 609C   00E0
        ADDR    R0,     R0                      ; 609D   00C0
        INCR    R7                              ; 609E   000F

        DECLE   $001F                           ; 609F   001F
L_60A0:
        SARC    R3,     2                       ; 60A0   007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 60A1   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $00F0,  $0090   ; 60A5   00FF 0000 00F0 0090
        DECLE   $00F0,  $0090,  $00F0,  $0090   ; 60A9   00F0 0090 00F0 0090
        DECLE   $00F0,  $00FF                   ; 60AD   00F0 00FF

        MOVR    R3,     R7                      ; 60AF   009F
        MOVR    R3,     R7                      ; 60B0   009F

        DECLE   $00FF,  $00FE,  $009C,  $0098   ; 60B1   00FF 00FE 009C 0098
        DECLE   $00F0,  $00FF                   ; 60B5   00F0 00FF

        MOVR    R3,     R7                      ; 60B7   009F
        MOVR    R3,     R7                      ; 60B8   009F

        DECLE   $00FF,  $00FE,  $009C,  $0098   ; 60B9   00FF 00FE 009C 0098
        DECLE   $00F0,  $00FF,  $00F9,  $00F9   ; 60BD   00F0 00FF 00F9 00F9
        DECLE   $00FF                           ; 60C1   00FF

        SARC    R3,     2                       ; 60C2   007F
        RSWD    R1                              ; 60C3   0039
        COMR    R1                              ; 60C4   0019
        INCR    R7                              ; 60C5   000F

        ADDR    R4,     R0                      ; 60C6   00E0
L_60C7:
        TSTR    R0                              ; 60C7   0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60C8   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 60CC   0000 0000

        ADDR    R7,     R0                      ; 60CE   00F8
        MOVR    R3,     R6                      ; 60CF   009E
        MOVR    R3,     R7                      ; 60D0   009F

        DECLE   $00FF,  $00FF                   ; 60D1   00FF 00FF

        MOVR    R3,     R7                      ; 60D3   009F
        MOVR    R3,     R7                      ; 60D4   009F

        DECLE   $00FF,  $0003,  $0001,  $0000   ; 60D5   00FF 0003 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 60DD   0000 0000 0000 0080
        DECLE   $00C0,  $00F0,  $00F8,  $00FE   ; 60E1   00C0 00F0 00F8 00FE
        DECLE   $00FF,  $0000,  $0000,  $0001   ; 60E5   00FF 0000 0000 0001

        DIS                                     ; 60E9   0003
        INCR    R7                              ; 60EA   000F

        DECLE   $001F                           ; 60EB   001F
L_60EC:
        SARC    R3,     2                       ; 60EC   007F
        DECLE   $00FF,  $001F,  $0079,  $00F9   ; 60ED   00FF 001F 0079 00F9
        DECLE   $00FF,  $00FF,  $00F9,  $00F9   ; 60F1   00FF 00FF 00F9 00F9
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 60F5   00FF 0000 0000 0000
        DECLE   $0000                           ; 60F9   0000

        DIS                                     ; 60FA   0003
        INCR    R7                              ; 60FB   000F

        DECLE   $000F                           ; 60FC   000F
L_60FD:
        INCR    R7                              ; 60FD   000F

        DECLE   $0001                           ; 60FE   0001
L_60FF:
        DIS                                     ; 60FF   0003
        DECLE   $000F,  $000F,  $000F,  $000F   ; 6100   000F 000F 000F 000F
        DECLE   $000F,  $000F,  $00FF,  $00F9   ; 6104   000F 000F 00FF 00F9
        DECLE   $00F9,  $00FF,  $00F0,  $00F0   ; 6108   00F9 00FF 00F0 00F0
        DECLE   $00F0,  $00F0,  $00FF,  $005F   ; 610C   00F0 00F0 00FF 005F
        DECLE   $005F,  $00FF                   ; 6110   005F 00FF

        INCR    R7                              ; 6112   000F
        INCR    R7                              ; 6113   000F
L_6114:
        INCR    R7                              ; 6114   000F
L_6115:
        INCR    R7                              ; 6115   000F

L_6116:
        ADDR    R6,     R0                      ; 6116   00F0
L_6117:
        ADDR    R6,     R0                      ; 6117   00F0
        DECLE   $00F0,  $00F0,  $00FF,  $00F9   ; 6118   00F0 00F0 00FF 00F9
        DECLE   $00F9,  $00FF,  $000F,  $000F   ; 611C   00F9 00FF 000F 000F
        DECLE   $000F,  $000F,  $00FF,  $005F   ; 6120   000F 000F 00FF 005F
        DECLE   $005F,  $00FF,  $0000           ; 6124   005F 00FF 0000

        INCR    R7                              ; 6127   000F

        INCR    R1                              ; 6128   0009
L_6129:
        INCR    R7                              ; 6129   000F

        INCR    R1                              ; 612A   0009
L_612B:
        INCR    R7                              ; 612B   000F

        INCR    R1                              ; 612C   0009
L_612D:
        INCR    R7                              ; 612D   000F

        ADDR    R6,     R0                      ; 612E   00F0
L_612F:
        ADDR    R6,     R0                      ; 612F   00F0
        ADDR    R6,     R0                      ; 6130   00F0
        ADDR    R6,     R0                      ; 6131   00F0
        ADDR    R6,     R0                      ; 6132   00F0
        ADDR    R6,     R0                      ; 6133   00F0
        ADDR    R4,     R0                      ; 6134   00E0
        ADDR    R0,     R0                      ; 6135   00C0
        INCR    R7                              ; 6136   000F
        INCR    R7                              ; 6137   000F
L_6138:
        INCR    R7                              ; 6138   000F
L_6139:
        INCR    R7                              ; 6139   000F
L_613A:
        INCR    R7                              ; 613A   000F
L_613B:
        INCR    R7                              ; 613B   000F

L_613C:
        SETC                                    ; 613C   0007
L_613D:
        DIS                                     ; 613D   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 613E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0007,  $000F   ; 6142   0000 0000 0007 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6146   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $00F0   ; 614A   0000 0000 00E0 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 614E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F8,  $00F0   ; 6152   0000 0000 00F8 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6156   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001F,  $000F   ; 615A   0000 0000 001F 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 615E   0000 0000 0000 0000
        DECLE   $0001,  $0003,  $0007,  $0000   ; 6162   0001 0003 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6166   0000 0000 0000 0000
        DECLE   $0080,  $00C0,  $00E0,  $0000   ; 616A   0080 00C0 00E0 0000
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 616E   001F 003F 007F 00FF
        DECLE   $00FE,  $00FC,  $00F8,  $0000   ; 6172   00FE 00FC 00F8 0000
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 6176   00F8 00FC 00FE 00FF
        DECLE   $007F,  $003F,  $001F,  $0000   ; 617A   007F 003F 001F 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 617E   0000 0000 0000 0000
        DECLE   $0001,  $0003,  $0000,  $0000   ; 6182   0001 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6186   0000 0000 0000 0000
        DECLE   $0080,  $00C0,  $0000,  $0000   ; 618A   0080 00C0 0000 0000
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 618E   001F 003F 007F 00FF
        DECLE   $00FE,  $00FC,  $0000,  $0000   ; 6192   00FE 00FC 0000 0000
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 6196   00F8 00FC 00FE 00FF
        DECLE   $007F,  $003F,  $0000,  $0000   ; 619A   007F 003F 0000 0000
        DECLE   $0000,  $0000,  $00F8,  $00FC   ; 619E   0000 0000 00F8 00FC
        DECLE   $007E,  $003F,  $0000,  $0000   ; 61A2   007E 003F 0000 0000
        DECLE   $0000,  $0000,  $001F,  $003F   ; 61A6   0000 0000 001F 003F
        DECLE   $007E,  $00FC,  $0000,  $0000   ; 61AA   007E 00FC 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 61AE   0000 0000 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61B2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 61B6   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61BA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61BE   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $0078,  $00F0   ; 61C2   0000 003C 0078 00F0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61C6   0000 0000 0000 0000
        DECLE   $0000,  $003C,  $001E,  $000F   ; 61CA   0000 003C 001E 000F
        DECLE   $0000,  $0000,  $0000,  $0003   ; 61CE   0000 0000 0000 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61D2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 61D6   0000 0000 0000 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61DA   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0000,  $0000   ; 61DE   0000 00C0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61E2   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $0000,  $0000   ; 61E6   0000 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61EA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61EE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; 61F2   0000 0000 0000 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61F6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 61FA   0000 0000 0000 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61FE   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $0000,  $0000   ; 6202   0000 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6206   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0000,  $0000   ; 620A   0000 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 620E   0000 0000 0000 0000
        DECLE   $0080,  $0080,  $0080,  $0080   ; 6212   0080 0080 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6216   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0001   ; 621A   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 621E   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6222   0001 0001 0001 0001
        DECLE   $0080,  $0080,  $0080,  $0080   ; 6226   0080 0080 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 622A   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0001   ; 622E   0001 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6232   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6236   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 623A   0000 0000 0001 0001
        DECLE   $0003,  $0003,  $0003,  $0003   ; 623E   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6242   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6246   0003 0003 0003 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 624A   0000 0000 0000 0000
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 624E   00C0 00C0 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6252   0000 0000 0000 0000
        DECLE   $0007,  $0007,  $0007,  $0007   ; 6256   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 625A   0007 0007 0007 0007
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 625E   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 6262   00E0 00E0 00E0 00E0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6266   0000 0000 0000 0000
        DECLE   $0003,  $0003,  $0003,  $0003   ; 626A   0003 0003 0003 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 626E   0000 0000 0000 0000
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 6272   00C0 00C0 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6276   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0003   ; 627A   0000 0000 0003 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 627E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0080   ; 6282   0000 0000 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6286   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 628A   0000 0000 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 628E   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 6292   00C0 00C0 00C0 00C0
        DECLE   $003C,  $003C,  $003C,  $003C   ; 6296   003C 003C 003C 003C
        DECLE   $003C,  $0038,  $0030,  $0020   ; 629A   003C 0038 0030 0020
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 629E   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $00F0,  $00C0,  $0000   ; 62A2   00FC 00F0 00C0 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FC   ; 62A6   00FF 00FF 00FF 00FC
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 62AA   00E0 0000 0000 0000
        DECLE   $003F,  $003F,  $003F,  $003F   ; 62AE   003F 003F 003F 003F
        DECLE   $003F,  $001F,  $001F,  $001F   ; 62B2   003F 001F 001F 001F
        DECLE   $007F,  $0003,  $0000,  $0000   ; 62B6   007F 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62BA   0000 0000 0000 0000
        DECLE   $008E,  $008E,  $008E,  $008E   ; 62BE   008E 008E 008E 008E
        DECLE   $008E,  $008E,  $008E,  $008E   ; 62C2   008E 008E 008E 008E
        DECLE   $008E,  $008E,  $008C,  $0088   ; 62C6   008E 008E 008C 0088
        DECLE   $0080,  $0080,  $0080,  $0080   ; 62CA   0080 0080 0080 0080
        DECLE   $00FF,  $00FF,  $00FF,  $000F   ; 62CE   00FF 00FF 00FF 000F
        DECLE   $0003,  $0000,  $0000,  $0000   ; 62D2   0003 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62D6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007F,  $000F,  $0003   ; 62DA   00FF 007F 000F 0003
        DECLE   $00FF,  $003F,  $0007,  $0001   ; 62DE   00FF 003F 0007 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62E2   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 62E6   00FF 00FF 00FF 00FF
        DECLE   $007F,  $001F,  $0007,  $0001   ; 62EA   007F 001F 0007 0001
        DECLE   $00FF,  $007F,  $001F           ; 62EE   00FF 007F 001F

        INCR    R7                              ; 62F1   000F

        SETC                                    ; 62F2   0007
L_62F3:
        DIS                                     ; 62F3   0003
        DECLE   $0001,  $0000,  $007F,  $003F   ; 62F4   0001 0000 007F 003F
        DECLE   $001F                           ; 62F8   001F

        INCR    R7                              ; 62F9   000F

        SETC                                    ; 62FA   0007
L_62FB:
        SETC                                    ; 62FB   0007
        DECLE   $0003,  $0003,  $0001,  $0001   ; 62FC   0003 0003 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6300   0001 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6304   0000 0000

        INCR    R7                              ; 6306   000F

        INCR    R6                              ; 6307   000E
L_6308:
        INCR    R4                              ; 6308   000C
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6309   0008 0000 0000 0000
        DECLE   $0000,  $00FC,  $00F0,  $0080   ; 630D   0000 00FC 00F0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6311   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6315   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FC,  $00F0   ; 6319   00FF 00FF 00FC 00F0
        DECLE   $0000,  $00F3,  $00F3,  $00F3   ; 631D   0000 00F3 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; 6321   00F3 00F3 00F3 00F3
        DECLE   $00F3,  $00F2,  $00F0,  $00F0   ; 6325   00F3 00F2 00F0 00F0
        DECLE   $00F0,  $00F0,  $00E0,  $00C0   ; 6329   00F0 00F0 00E0 00C0
        DECLE   $0080,  $00F0,  $00F0,  $00F0   ; 632D   0080 00F0 00F0 00F0
        DECLE   $00F0,  $00E0,  $00C0,  $0080   ; 6331   00F0 00E0 00C0 0080
        DECLE   $0000,  $00F0,  $00F0,  $00F0   ; 6335   0000 00F0 00F0 00F0
        DECLE   $00F0,  $00E0,  $0080,  $0000   ; 6339   00F0 00E0 0080 0000
        DECLE   $0000,  $000F,  $000F,  $000F   ; 633D   0000 000F 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000E   ; 6341   000F 000F 000F 000E
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6345   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $007F,  $007F   ; 6349   00FF 00FF 007F 007F
        DECLE   $007F,  $0001,  $0000,  $0000   ; 634D   007F 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6351   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6355   0000 0000 0000 0000
        DECLE   $000C,  $000C,  $000C,  $000C   ; 6359   000C 000C 000C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 635D   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $00F0,  $00F0   ; 6361   0000 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6365   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $0000,  $0000,  $0000   ; 6369   00F0 0000 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $00F0   ; 636D   0000 0000 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 6371   00F0 00F0 00F0 00F0
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 6375   0000 0000 0000 00C0
        DECLE   $00C0,  $00C0,  $0000,  $0000   ; 6379   00C0 00C0 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00C0   ; 637D   0000 0000 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 6381   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $0000,  $000F,  $000F   ; 6385   00C0 0000 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; 6389   000F 000F 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; 638D   000F 000F 000F 000F
        DECLE   $000F,  $0000,  $0000,  $0000   ; 6391   000F 0000 0000 0000
        DECLE   $0000                           ; 6395   0000

        ADDR    R7,     R6                      ; 6396   00FE
        ADDR    R7,     R6                      ; 6397   00FE
        ADDR    R7,     R6                      ; 6398   00FE
        ADDR    R7,     R6                      ; 6399   00FE
        ADDR    R7,     R6                      ; 639A   00FE
        ADDR    R7,     R6                      ; 639B   00FE
        ADDR    R7,     R6                      ; 639C   00FE
        ADDR    R7,     R6                      ; 639D   00FE
        INCR    R7                              ; 639E   000F
        INCR    R7                              ; 639F   000F
L_63A0:
        INCR    R7                              ; 63A0   000F
L_63A1:
        INCR    R7                              ; 63A1   000F
L_63A2:
        INCR    R7                              ; 63A2   000F
L_63A3:
        INCR    R7                              ; 63A3   000F
L_63A4:
        INCR    R7                              ; 63A4   000F
L_63A5:
        INCR    R7                              ; 63A5   000F

L_63A6:
        ADDR    R6,     R0                      ; 63A6   00F0
L_63A7:
        ADDR    R6,     R0                      ; 63A7   00F0
        ADDR    R6,     R0                      ; 63A8   00F0
        ADDR    R6,     R0                      ; 63A9   00F0
        ADDR    R6,     R0                      ; 63AA   00F0
        ADDR    R6,     R0                      ; 63AB   00F0
        ADDR    R6,     R0                      ; 63AC   00F0
        ADDR    R6,     R0                      ; 63AD   00F0
        ADDR    R4,     R7                      ; 63AE   00E7
        ADDR    R4,     R7                      ; 63AF   00E7
        ADDR    R4,     R7                      ; 63B0   00E7
        ADDR    R4,     R7                      ; 63B1   00E7
        ADDR    R4,     R7                      ; 63B2   00E7

        DECLE   $00FF,  $00FF,  $00FF           ; 63B3   00FF 00FF 00FF

        ADDR    R4,     R7                      ; 63B6   00E7
        ADDR    R4,     R7                      ; 63B7   00E7
        ADDR    R4,     R7                      ; 63B8   00E7
        ADDR    R4,     R7                      ; 63B9   00E7
        ADDR    R4,     R7                      ; 63BA   00E7

        DECLE   $00FF,  $00FF,  $00FF,  $001F   ; 63BB   00FF 00FF 00FF 001F
        DECLE   $001F,  $001F,  $001F,  $00FF   ; 63BF   001F 001F 001F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00F8   ; 63C3   00FF 00FF 00FF 00F8
        DECLE   $00F8,  $00F8,  $00F8,  $00FF   ; 63C7   00F8 00F8 00F8 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; 63CB   00FF 00FF 00FF 00FE
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 63CF   00FE 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 63D3   00FF 00FF 00FF 007F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 63D7   007F 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0001   ; 63DB   00FF 00FF 00FF 0001
        DECLE   $0180,  $0001,  $0000,  $0061   ; 63DF   0180 0001 0000 0061
        DECLE   $0128,  $018A,  $018C,  $0134   ; 63E3   0128 018A 018C 0134
        DECLE   $0001,  $0000,  $00AB,  $0120   ; 63E7   0001 0000 00AB 0120
        DECLE   $0001,  $0000,  $00F3,  $0158   ; 63EB   0001 0000 00F3 0158
        DECLE   $004C,  $004E,  $0062,  $0001   ; 63EF   004C 004E 0062 0001
        DECLE   $0000,  $0060,  $012A,  $0149   ; 63F3   0000 0060 012A 0149
        DECLE   $00E8,  $009E,  $00A0,  $0183   ; 63F7   00E8 009E 00A0 0183
        DECLE   $0020,  $018C,  $018A,  $0136   ; 63FB   0020 018C 018A 0136
        DECLE   $0001,  $0000,  $0001,  $0150   ; 63FF   0001 0000 0001 0150
        DECLE   $018F,  $0030,  $0001,  $0000   ; 6403   018F 0030 0001 0000
        DECLE   $00E9,  $0063,  $0027,  $006E   ; 6407   00E9 0063 0027 006E
        DECLE   $008A,  $006D,  $00FB,  $006C   ; 640B   008A 006D 00FB 006C
        DECLE   $00DE,  $0063,  $004D,  $0068   ; 640F   00DE 0063 004D 0068
        DECLE   $00E9,  $0068,  $008C,  $0069   ; 6413   00E9 0068 008C 0069
        DECLE   $00E2,  $0063,  $002D,  $006A   ; 6417   00E2 0063 002D 006A
        DECLE   $00A4,  $006A,  $001F,  $006B   ; 641B   00A4 006A 001F 006B
        DECLE   $00F4,  $0063,  $0094,  $006B   ; 641F   00F4 0063 0094 006B
        DECLE   $000B,  $006C,  $0086,  $006C   ; 6423   000B 006C 0086 006C
        DECLE   $00ED,  $0063,  $009E,  $006E   ; 6427   00ED 0063 009E 006E
        DECLE   $00FB,  $006E,  $007F,  $006F   ; 642B   00FB 006E 007F 006F
        DECLE   $0001,  $0064,  $00BB,  $0066   ; 642F   0001 0064 00BB 0066
        DECLE   $003F,  $0067,  $00C4,  $0067   ; 6433   003F 0067 00C4 0067
        DECLE   $0000,  $0010,  $0000,  $0024   ; 6437   0000 0010 0000 0024
        DECLE   $0000,  $0022,  $0000,  $0032   ; 643B   0000 0022 0000 0032
        DECLE   $0000,  $0020,  $000C,  $003A   ; 643F   0000 0020 000C 003A
        DECLE   $0014,  $003A,  $001C,  $003A   ; 6443   0014 003A 001C 003A
        DECLE   $0024,  $003A,  $002C,  $003A   ; 6447   0024 003A 002C 003A
        DECLE   $0034,  $003A,  $003C,  $003A   ; 644B   0034 003A 003C 003A
        DECLE   $0044,  $003A,  $004C,  $003A   ; 644F   0044 003A 004C 003A
        DECLE   $0084,  $003A,  $00A4,  $003A   ; 6453   0084 003A 00A4 003A
        DECLE   $008C,  $003A,  $00AC,  $003A   ; 6457   008C 003A 00AC 003A
        DECLE   $0095,  $0018,  $00B5,  $0018   ; 645B   0095 0018 00B5 0018
        DECLE   $0055,  $0018,  $006D,  $0018   ; 645F   0055 0018 006D 0018
        DECLE   $005D,  $0018,  $0075,  $0018   ; 6463   005D 0018 0075 0018
        DECLE   $0065,  $003A,  $007C,  $003A   ; 6467   0065 003A 007C 003A
        DECLE   $00C4,  $003A,  $00CC,  $003A   ; 646B   00C4 003A 00CC 003A
        DECLE   $00D3,  $0018,  $00EB,  $0018   ; 646F   00D3 0018 00EB 0018
        DECLE   $00DB,  $0018,  $00F3,  $0018   ; 6473   00DB 0018 00F3 0018
        DECLE   $00E3,  $0018,  $00FB,  $0018   ; 6477   00E3 0018 00FB 0018
        DECLE   $0003,  $0019,  $000B,  $0019   ; 647B   0003 0019 000B 0019
        DECLE   $0013,  $0019,  $001B,  $0019   ; 647F   0013 0019 001B 0019
        DECLE   $0023,  $0019,  $002B,  $0019   ; 6483   0023 0019 002B 0019
        DECLE   $0035,  $0019,  $003D,  $0019   ; 6487   0035 0019 003D 0019
        DECLE   $0045,  $0019,  $004D,  $0019   ; 648B   0045 0019 004D 0019
        DECLE   $0055,  $0019,  $005D,  $0019   ; 648F   0055 0019 005D 0019
        DECLE   $0065,  $0019,  $006D,  $0019   ; 6493   0065 0019 006D 0019
        DECLE   $0075,  $0019,  $007D,  $0019   ; 6497   0075 0019 007D 0019
        DECLE   $0014,  $002A,  $0034,  $002A   ; 649B   0014 002A 0034 002A
        DECLE   $0044,  $002A,  $004C,  $002A   ; 649F   0044 002A 004C 002A
        DECLE   $009D,  $0018,  $00BD,  $0018   ; 64A3   009D 0018 00BD 0018
        DECLE   $009B,  $0018,  $00BB,  $0018   ; 64A7   009B 0018 00BB 0018
        DECLE   $0053,  $0018,  $006B,  $0018   ; 64AB   0053 0018 006B 0018
        DECLE   $005B,  $0018,  $0073,  $0018   ; 64AF   005B 0018 0073 0018
        DECLE   $0004,  $003A,  $000A,  $0018   ; 64B3   0004 003A 000A 0018
        DECLE   $0002,  $0018,  $003A,  $0018   ; 64B7   0002 0018 003A 0018
        DECLE   $0012,  $0018,  $001A,  $0018   ; 64BB   0012 0018 001A 0018
        DECLE   $007A,  $0018,  $0042,  $0018   ; 64BF   007A 0018 0042 0018
        DECLE   $0000,  $0002,  $00F8,  $0018   ; 64C3   0000 0002 00F8 0018
        DECLE   $0000,  $0019,  $0008,  $0019   ; 64C7   0000 0019 0008 0019
        DECLE   $0010,  $0019,  $0038,  $0019   ; 64CB   0010 0019 0038 0019
        DECLE   $0018,  $0019,  $0029,  $0018   ; 64CF   0018 0019 0029 0018
        DECLE   $0031,  $0018,  $0049,  $0018   ; 64D3   0031 0018 0049 0018
        DECLE   $0051,  $0018,  $0059,  $0018   ; 64D7   0051 0018 0059 0018
        DECLE   $0061,  $0018,  $0069,  $0018   ; 64DB   0061 0018 0069 0018
        DECLE   $0071,  $0018,  $00F0,  $0018   ; 64DF   0071 0018 00F0 0018
        DECLE   $0082,  $0018,  $008A,  $0018   ; 64E3   0082 0018 008A 0018
        DECLE   $0092,  $0018,  $009A,  $0018   ; 64E7   0092 0018 009A 0018
        DECLE   $00A2,  $0018,  $00AA,  $0018   ; 64EB   00A2 0018 00AA 0018
        DECLE   $00B2,  $0018,  $00BA,  $0018   ; 64EF   00B2 0018 00BA 0018
        DECLE   $00C1,  $0018,  $002A,  $0019   ; 64F3   00C1 0018 002A 0019
        DECLE   $0032,  $0019,  $0022,  $0019   ; 64F7   0032 0019 0022 0019
        DECLE   $0006,  $003A,  $000E,  $003A   ; 64FB   0006 003A 000E 003A
        DECLE   $0016,  $003A,  $001E,  $0018   ; 64FF   0016 003A 001E 0018
        DECLE   $0026,  $003A,  $002E,  $003A   ; 6503   0026 003A 002E 003A
        DECLE   $0036,  $003A,  $003E,  $003A   ; 6507   0036 003A 003E 003A
        DECLE   $0046,  $003A,  $004E,  $003A   ; 650B   0046 003A 004E 003A
        DECLE   $0056,  $003A,  $005E,  $0018   ; 650F   0056 003A 005E 0018
        DECLE   $0066,  $003A,  $006E,  $003A   ; 6513   0066 003A 006E 003A
        DECLE   $0076,  $003A,  $007E,  $0018   ; 6517   0076 003A 007E 0018
        DECLE   $0086,  $003A,  $008E,  $003A   ; 651B   0086 003A 008E 003A
        DECLE   $0096,  $0018,  $009E,  $0018   ; 651F   0096 0018 009E 0018
        DECLE   $00A6,  $0018,  $00AE,  $0018   ; 6523   00A6 0018 00AE 0018
        DECLE   $00B6,  $003A,  $00BE,  $0018   ; 6527   00B6 003A 00BE 0018
        DECLE   $00C6,  $003A,  $00CE,  $003A   ; 652B   00C6 003A 00CE 003A
        DECLE   $00D6,  $003A,  $00DE,  $003A   ; 652F   00D6 003A 00DE 003A
        DECLE   $00E6,  $003A,  $00EE,  $0018   ; 6533   00E6 003A 00EE 0018
        DECLE   $00F6,  $0018,  $00FE,  $003A   ; 6537   00F6 0018 00FE 003A
        DECLE   $0006,  $003B,  $000E,  $003B   ; 653B   0006 003B 000E 003B
        DECLE   $0016,  $0019,  $001E,  $0019   ; 653F   0016 0019 001E 0019
        DECLE   $0000,  $0010,  $0000,  $0024   ; 6543   0000 0010 0000 0024
        DECLE   $0000,  $0032,  $0000,  $0022   ; 6547   0000 0032 0000 0022
        DECLE   $0022,  $0008,  $002A,  $0008   ; 654B   0022 0008 002A 0008
        DECLE   $0032,  $0008,  $003A,  $0008   ; 654F   0032 0008 003A 0008
        DECLE   $0042,  $0008,  $004A,  $0008   ; 6553   0042 0008 004A 0008
        DECLE   $0052,  $0008,  $005A,  $0008   ; 6557   0052 0008 005A 0008
        DECLE   $0062,  $0008,  $006A,  $0008   ; 655B   0062 0008 006A 0008
        DECLE   $0072,  $0008,  $007A,  $0008   ; 655F   0072 0008 007A 0008
        DECLE   $0082,  $0008,  $008A,  $0008   ; 6563   0082 0008 008A 0008
        DECLE   $0092,  $0008,  $009A,  $0008   ; 6567   0092 0008 009A 0008
        DECLE   $00A2,  $0008,  $00AA,  $0008   ; 656B   00A2 0008 00AA 0008
        DECLE   $00B2,  $0008,  $00BA,  $0008   ; 656F   00B2 0008 00BA 0008
        DECLE   $00C2,  $0008,  $00CA,  $0008   ; 6573   00C2 0008 00CA 0008
        DECLE   $0000,  $0000,  $005A,  $0009   ; 6577   0000 0000 005A 0009
        DECLE   $0062,  $0009,  $00D1,  $0008   ; 657B   0062 0009 00D1 0008
        DECLE   $00D9,  $0008,  $0069,  $0009   ; 657F   00D9 0008 0069 0009
        DECLE   $00E1,  $0008,  $00E9,  $0008   ; 6583   00E1 0008 00E9 0008
        DECLE   $00F1,  $0008,  $0051,  $0009   ; 6587   00F1 0008 0051 0009
        DECLE   $0001                           ; 658B   0001

        INCR    R1                              ; 658C   0009
        INCR    R1                              ; 658D   0009
        INCR    R1                              ; 658E   0009
        DECR    R1                              ; 658F   0011
        INCR    R1                              ; 6590   0009
        COMR    R1                              ; 6591   0019
        INCR    R1                              ; 6592   0009
        NEGR    R1                              ; 6593   0021
        INCR    R1                              ; 6594   0009
        ADCR    R1                              ; 6595   0029
        INCR    R1                              ; 6596   0009
        GSWD    R1                              ; 6597   0031
        INCR    R1                              ; 6598   0009
        RSWD    R1                              ; 6599   0039
        INCR    R1                              ; 659A   0009
        SWAP    R1,     1                       ; 659B   0041
        INCR    R1                              ; 659C   0009
        SLL     R1,     1                       ; 659D   0049
        INCR    R1                              ; 659E   0009
        ADDR    R2,     R7                      ; 659F   00D7

        INCR    R0                              ; 65A0   0008
        ADDR    R3,     R7                      ; 65A1   00DF

        INCR    R0                              ; 65A2   0008
        SAR     R3,     2                       ; 65A3   006F
        INCR    R1                              ; 65A4   0009
        ADDR    R4,     R7                      ; 65A5   00E7

        INCR    R0                              ; 65A6   0008
        ADDR    R5,     R7                      ; 65A7   00EF

        DECLE   $0008,  $00F7                   ; 65A8   0008 00F7

        INCR    R0                              ; 65AA   0008
        RLC     R3,     2                       ; 65AB   0057
        INCR    R1                              ; 65AC   0009
        SETC                                    ; 65AD   0007
        INCR    R1                              ; 65AE   0009
        INCR    R7                              ; 65AF   000F

        INCR    R1                              ; 65B0   0009
L_65B1:
        DECR    R7                              ; 65B1   0017

        DECLE   $0009,  $003F,  $0009,  $0047   ; 65B2   0009 003F 0009 0047
        DECLE   $0009,  $002F,  $0009,  $0037   ; 65B6   0009 002F 0009 0037
        DECLE   $0009,  $004F,  $0009,  $00F9   ; 65BA   0009 004F 0009 00F9
        DECLE   $0008,  $00FF,  $0008,  $00C8   ; 65BE   0008 00FF 0008 00C8
        DECLE   $0018,  $00D0,  $0018,  $00D8   ; 65C2   0018 00D0 0018 00D8
        DECLE   $0018,  $00E0,  $0018,  $00E8   ; 65C6   0018 00E0 0018 00E8
        DECLE   $0018,  $0022,  $0018,  $0000   ; 65CA   0018 0022 0018 0000

        NEGR    R6                              ; 65CE   0026
        SWAP    R0,     2                       ; 65CF   0044
        ADCR    R6                              ; 65D0   002E
        SLL     R0,     2                       ; 65D1   004C
        ADCR    R6                              ; 65D2   002E
        RLC     R3,     2                       ; 65D3   0057
        COMR    R1                              ; 65D4   0019
        SLLC    R3,     2                       ; 65D5   005F
        COMR    R1                              ; 65D6   0019
        DECR    R4                              ; 65D7   0014
        ADCR    R6                              ; 65D8   002E
        NOP                                     ; 65D9   0034
        ADCR    R6                              ; 65DA   002E
        MOVR    R3,     R7                      ; 65DB   009F

        DECLE   $0018,  $00BF                   ; 65DC   0018 00BF

        COMR    R0                              ; 65DE   0018
        ADDR    R2,     R3                      ; 65DF   00D3
        ADCR    R6                              ; 65E0   002E
        ADDR    R5,     R3                      ; 65E1   00EB
        ADCR    R6                              ; 65E2   002E
        ADDR    R3,     R3                      ; 65E3   00DB
        ADCR    R6                              ; 65E4   002E
        ADDR    R6,     R3                      ; 65E5   00F3
        ADCR    R6                              ; 65E6   002E
        RLC     R3,     2                       ; 65E7   0057
        COMR    R0                              ; 65E8   0018
        SAR     R3,     2                       ; 65E9   006F
        COMR    R0                              ; 65EA   0018
        ADDR    R4,     R3                      ; 65EB   00E3
        ADCR    R6                              ; 65EC   002E
        ADDR    R7,     R3                      ; 65ED   00FB
        ADCR    R6                              ; 65EE   002E
        DIS                                     ; 65EF   0003
        ADCR    R7                              ; 65F0   002F

        INCR    R3                              ; 65F1   000B
L_65F2:
        ADCR    R7                              ; 65F2   002F

        SLLC    R3,     1                       ; 65F3   005B
L_65F4:
        ADCR    R6                              ; 65F4   002E
        RRC     R3,     1                       ; 65F5   0073
        ADCR    R6                              ; 65F6   002E
        RRC     R3,     2                       ; 65F7   0077
        COMR    R1                              ; 65F8   0019
        SARC    R3,     2                       ; 65F9   007F
        COMR    R1                              ; 65FA   0019
        SLR     R3,     2                       ; 65FB   0067
        COMR    R1                              ; 65FC   0019
        SAR     R3,     2                       ; 65FD   006F
        COMR    R1                              ; 65FE   0019
        DECR    R3                              ; 65FF   0013
        ADCR    R7                              ; 6600   002F

        COMR    R3                              ; 6601   001B
L_6602:
        ADCR    R7                              ; 6602   002F

        NEGR    R3                              ; 6603   0023
L_6604:
        ADCR    R7                              ; 6604   002F

        ADCR    R3                              ; 6605   002B
L_6606:
        ADCR    R7                              ; 6606   002F

        RLC     R3,     1                       ; 6607   0053
L_6608:
        ADCR    R6                              ; 6608   002E
        DECLE   $006B,  $002E,  $009B,  $002E   ; 6609   006B 002E 009B 002E
        DECLE   $00BB,  $002E,  $0000,  $0004   ; 660D   00BB 002E 0000 0004
        DECLE   $0002,  $0008,  $000A,  $0008   ; 6611   0002 0008 000A 0008
        DECLE   $0012,  $0008,  $001A,  $0008   ; 6615   0012 0008 001A 0008
        DECLE   $0000,  $0006,  $0002,  $003A   ; 6619   0000 0006 0002 003A
        DECLE   $000A,  $003A,  $0012,  $003A   ; 661D   000A 003A 0012 003A
        DECLE   $001A,  $0018,  $0022,  $003A   ; 6621   001A 0018 0022 003A
        DECLE   $002A,  $003A,  $0032,  $003A   ; 6625   002A 003A 0032 003A
        DECLE   $003A,  $003A,  $0042,  $003A   ; 6629   003A 003A 0042 003A
        DECLE   $004A,  $003A,  $0052,  $003A   ; 662D   004A 003A 0052 003A
        DECLE   $005A,  $0018,  $0062,  $003A   ; 6631   005A 0018 0062 003A
        DECLE   $006A,  $003A,  $0072,  $003A   ; 6635   006A 003A 0072 003A
        DECLE   $007A,  $0018,  $0082,  $003A   ; 6639   007A 0018 0082 003A
        DECLE   $008A,  $003A,  $0092,  $0018   ; 663D   008A 003A 0092 0018
        DECLE   $009A,  $0018,  $00A2,  $0018   ; 6641   009A 0018 00A2 0018
        DECLE   $00AA,  $0018,  $00B2,  $003A   ; 6645   00AA 0018 00B2 003A
        DECLE   $00BA,  $0018,  $00C2,  $003A   ; 6649   00BA 0018 00C2 003A
        DECLE   $00CA,  $003A,  $00D2,  $003A   ; 664D   00CA 003A 00D2 003A
        DECLE   $00DA,  $003A,  $00E2,  $003A   ; 6651   00DA 003A 00E2 003A
        DECLE   $00EA,  $0018,  $00F2,  $0018   ; 6655   00EA 0018 00F2 0018
        DECLE   $00FA,  $003A,  $0002,  $003B   ; 6659   00FA 003A 0002 003B
        DECLE   $000A,  $003B,  $0012,  $0019   ; 665D   000A 003B 0012 0019
        DECLE   $001A,  $0019,  $0000,  $0010   ; 6661   001A 0019 0000 0010
        DECLE   $0000,  $0004,  $0000,  $0032   ; 6665   0000 0004 0000 0032
        DECLE   $0000                           ; 6669   0000

        NEGR    R2                              ; 666A   0022
        SETC                                    ; 666B   0007
        RSWD    R2                              ; 666C   003A
        INCR    R7                              ; 666D   000F

        RSWD    R2                              ; 666E   003A
L_666F:
        DECR    R7                              ; 666F   0017

        DECLE   $003A,  $001F,  $0018,  $0027   ; 6670   003A 001F 0018 0027
        DECLE   $003A,  $002F,  $003A,  $0037   ; 6674   003A 002F 003A 0037
        DECLE   $003A,  $003F                   ; 6678   003A 003F

        RSWD    R2                              ; 667A   003A
        SWAP    R3,     2                       ; 667B   0047
        RSWD    R2                              ; 667C   003A
        SLL     R3,     2                       ; 667D   004F
        RSWD    R2                              ; 667E   003A
        RLC     R3,     2                       ; 667F   0057
        RSWD    R2                              ; 6680   003A
        SLLC    R3,     2                       ; 6681   005F
        COMR    R0                              ; 6682   0018
        SLR     R3,     2                       ; 6683   0067
        RSWD    R2                              ; 6684   003A
        SAR     R3,     2                       ; 6685   006F
        RSWD    R2                              ; 6686   003A
        RRC     R3,     2                       ; 6687   0077
        RSWD    R2                              ; 6688   003A
        SARC    R3,     2                       ; 6689   007F
        COMR    R0                              ; 668A   0018
        MOVR    R0,     R7                      ; 668B   0087

        RSWD    R2                              ; 668C   003A
        MOVR    R1,     R7                      ; 668D   008F

        RSWD    R2                              ; 668E   003A
        MOVR    R2,     R7                      ; 668F   0097

        COMR    R0                              ; 6690   0018
        MOVR    R3,     R7                      ; 6691   009F

        COMR    R0                              ; 6692   0018
        MOVR    R4,     R7                      ; 6693   00A7

        COMR    R0                              ; 6694   0018
        MOVR    R5,     R7                      ; 6695   00AF

        DECLE   $0018,  $00B7,  $003A,  $00BF   ; 6696   0018 00B7 003A 00BF

        COMR    R0                              ; 669A   0018
        ADDR    R0,     R7                      ; 669B   00C7

        RSWD    R2                              ; 669C   003A
        ADDR    R1,     R7                      ; 669D   00CF

        RSWD    R2                              ; 669E   003A
        ADDR    R2,     R7                      ; 669F   00D7

        RSWD    R2                              ; 66A0   003A
        ADDR    R3,     R7                      ; 66A1   00DF

        RSWD    R2                              ; 66A2   003A
        ADDR    R4,     R7                      ; 66A3   00E7

        RSWD    R2                              ; 66A4   003A
        ADDR    R5,     R7                      ; 66A5   00EF

        DECLE   $0018,  $00F7,  $0018,  $00FF   ; 66A6   0018 00F7 0018 00FF

        RSWD    R2                              ; 66AA   003A
        SETC                                    ; 66AB   0007
        RSWD    R3                              ; 66AC   003B
        INCR    R7                              ; 66AD   000F

        RSWD    R3                              ; 66AE   003B
L_66AF:
        DECR    R7                              ; 66AF   0017

        DECLE   $0019,  $001F,  $0019,  $0000   ; 66B0   0019 001F 0019 0000
        DECLE   $0010,  $0000,  $0026,  $0000   ; 66B4   0010 0000 0026 0000
        DECLE   $0032,  $0000,  $0022,  $0009   ; 66B8   0032 0000 0022 0009
        DECLE   $007D,  $000B,  $0007,  $001A   ; 66BC   007D 000B 0007 001A
        DECLE   $0013,  $0011,  $0009,  $0004   ; 66C0   0013 0011 0009 0004

        INCR    R5                              ; 66C4   000D
        SETC                                    ; 66C5   0007
        SETC                                    ; 66C6   0007
        INCR    R7                              ; 66C7   000F
L_66C8:
        DECR    R7                              ; 66C8   0017

L_66C9:
        SETC                                    ; 66C9   0007
        INCR    R2                              ; 66CA   000A
        INCR    R7                              ; 66CB   000F
L_66CC:
        DECR    R7                              ; 66CC   0017

L_66CD:
        SETC                                    ; 66CD   0007
        DECLE   $0007,  $0015,  $0009,  $0006   ; 66CE   0007 0015 0009 0006
        DECLE   $000D,  $0007,  $0019,  $0009   ; 66D2   000D 0007 0019 0009
        DECLE   $0009,  $001B,  $0007,  $0006   ; 66D6   0009 001B 0007 0006
        DECLE   $0019,  $0009,  $0009,  $001B   ; 66DA   0019 0009 0009 001B
        DECLE   $0007,  $0015,  $0009,  $0006   ; 66DE   0007 0015 0009 0006
        DECLE   $000D,  $0007,  $0019,  $0009   ; 66E2   000D 0007 0019 0009
        DECLE   $0009,  $001B,  $0031,  $0007   ; 66E6   0009 001B 0031 0007
        DECLE   $0007,  $0031,  $0019,  $0009   ; 66EA   0007 0031 0019 0009
        DECLE   $0009,  $001B,  $0007,  $0015   ; 66EE   0009 001B 0007 0015
        DECLE   $0009,  $0006,  $01A1,  $0197   ; 66F2   0009 0006 01A1 0197
        DECLE   $0199,  $0009,  $0009,  $019B   ; 66F6   0199 0009 0009 019B
        DECLE   $019D,  $0197,  $0197,  $019F   ; 66FA   019D 0197 0197 019F
        DECLE   $0199,  $0009,  $0009,  $019B   ; 66FE   0199 0009 0009 019B
        DECLE   $0197,  $01A3,  $0009,  $0006   ; 6702   0197 01A3 0009 0006
        DECLE   $01A1,  $0197,  $0197,  $01A7   ; 6706   01A1 0197 0197 01A7
        DECLE   $01A5,  $0197,  $0197,  $01A9   ; 670A   01A5 0197 0197 01A9
        DECLE   $01AB,  $0197,  $0197,  $01A7   ; 670E   01AB 0197 0197 01A7
        DECLE   $01A5,  $0197,  $0197,  $01A3   ; 6712   01A5 0197 0197 01A3
        DECLE   $0009,  $0006,  $01A1,  $0197   ; 6716   0009 0006 01A1 0197
        DECLE   $0197,  $01C7,  $01C5,  $0197   ; 671A   0197 01C7 01C5 0197
        DECLE   $0197,  $01AD,  $01AF,  $0197   ; 671E   0197 01AD 01AF 0197
        DECLE   $0197,  $01C7,  $01C5,  $0197   ; 6722   0197 01C7 01C5 0197
        DECLE   $0197,  $01A3,  $0009,  $0009   ; 6726   0197 01A3 0009 0009
        DECLE   $0001,  $0197,  $000E,  $01D1   ; 672A   0001 0197 000E 01D1
        DECLE   $01D3,  $0197,  $000E,  $0001   ; 672E   01D3 0197 000E 0001
        DECLE   $0001,  $0197,  $0022,  $0001   ; 6732   0001 0197 0022 0001
        DECLE   $0001,  $0197,  $000E,  $01D5   ; 6736   0001 0197 000E 01D5
        DECLE   $01D7,  $0197,  $000E,  $0001   ; 673A   01D7 0197 000E 0001
        DECLE   $0000                           ; 673E   0000

        COMR    R3                              ; 673F   001B
        SETC                                    ; 6740   0007
        SETC                                    ; 6741   0007
        INCR    R7                              ; 6742   000F

        GSWD    R3                              ; 6743   0033
L_6744:
        INCR    R3                              ; 6744   000B
        SETC                                    ; 6745   0007
        INCR    R6                              ; 6746   000E
        DECR    R3                              ; 6747   0013
        GSWD    R3                              ; 6748   0033
L_6749:
        DECR    R7                              ; 6749   0017

        DECLE   $0007,  $0007,  $0019,  $001B   ; 674A   0007 0007 0019 001B
        DECLE   $0007,  $0019,  $0009,  $0009   ; 674E   0007 0019 0009 0009
        DECLE   $000D,  $0007,  $000E,  $0015   ; 6752   000D 0007 000E 0015
        DECLE   $0009,  $0009,  $001B,  $0007   ; 6756   0009 0009 001B 0007
        DECLE   $0019,  $001B,  $0007,  $0019   ; 675A   0019 001B 0007 0019
        DECLE   $0009,  $0009,  $000D,  $0007   ; 675E   0009 0009 000D 0007
        DECLE   $0013,  $000B,  $0007,  $0007   ; 6762   0013 000B 0007 0007
        DECLE   $0013,  $000B,  $0007,  $0015   ; 6766   0013 000B 0007 0015
        DECLE   $0009,  $0009,  $001B,  $0007   ; 676A   0009 0009 001B 0007
        DECLE   $0019,  $001B,  $0007,  $0019   ; 676E   0019 001B 0007 0019
        DECLE   $0009,  $0009,  $000D,  $0007   ; 6772   0009 0009 000D 0007
        DECLE   $0015,  $000D,  $0007,  $0007   ; 6776   0015 000D 0007 0007
        DECLE   $0015,  $000D,  $0007,  $0015   ; 677A   0015 000D 0007 0015
        DECLE   $0009,  $0009,  $001B,  $0007   ; 677E   0009 0009 001B 0007
        DECLE   $0019,  $019B,  $0197,  $0199   ; 6782   0019 019B 0197 0199
        DECLE   $0009,  $0009,  $01A1,  $0197   ; 6786   0009 0009 01A1 0197
        DECLE   $01A7,  $0197,  $0006,  $01A5   ; 678A   01A7 0197 0006 01A5
        DECLE   $0197,  $01A3,  $0009,  $0009   ; 678E   0197 01A3 0009 0009
        DECLE   $019B,  $0197,  $0199,  $019B   ; 6792   019B 0197 0199 019B
        DECLE   $0197,  $0197,  $01A7,  $01B1   ; 6796   0197 0197 01A7 01B1
        DECLE   $0197,  $0006,  $01B5,  $01B7   ; 679A   0197 0006 01B5 01B7
        DECLE   $0197,  $0006,  $01B3,  $01A5   ; 679E   0197 0006 01B3 01A5
        DECLE   $0197,  $0197,  $0199,  $0197   ; 67A2   0197 0197 0199 0197
        DECLE   $0004,  $01A7,  $01B1,  $0197   ; 67A6   0004 01A7 01B1 0197
        DECLE   $0006,  $01B9,  $01BB,  $0197   ; 67AA   0006 01B9 01BB 0197
        DECLE   $0006,  $01B3,  $01A5,  $0197   ; 67AE   0006 01B3 01A5 0197
        DECLE   $000A,  $01A7,  $01B1,  $0197   ; 67B2   000A 01A7 01B1 0197
        DECLE   $0006,  $01D1,  $01D3,  $0197   ; 67B6   0006 01D1 01D3 0197
        DECLE   $0006,  $01B3,  $01A5,  $0197   ; 67BA   0006 01B3 01A5 0197
        DECLE   $0016,  $01BD,  $01BF,  $0197   ; 67BE   0016 01BD 01BF 0197
        DECLE   $0038,  $0000,  $0007,  $0035   ; 67C2   0038 0000 0007 0035
        DECLE   $0009,  $007D,  $000B,  $0007   ; 67C6   0009 007D 000B 0007
        DECLE   $0012,  $0013,  $0011,  $0009   ; 67CA   0012 0013 0011 0009
        DECLE   $0037,  $0007,  $0019,  $0009   ; 67CE   0037 0007 0019 0009
        DECLE   $0004,  $000D,  $0007,  $0012   ; 67D2   0004 000D 0007 0012
        DECLE   $0015,  $0009,  $0004,  $001B   ; 67D6   0015 0009 0004 001B
        DECLE   $0019,  $0009,  $0004,  $000D   ; 67DA   0019 0009 0004 000D
        DECLE   $0007,  $0035,  $007D,  $000B   ; 67DE   0007 0035 007D 000B
        DECLE   $0007,  $0007,  $0013,  $0011   ; 67E2   0007 0007 0013 0011
        DECLE   $0037,  $0007,  $0015,  $0009   ; 67E6   0037 0007 0015 0009
        DECLE   $0004,  $001B,  $0019,  $0009   ; 67EA   0004 001B 0019 0009
        DECLE   $0004,  $000D,  $0007,  $0015   ; 67EE   0004 000D 0007 0015
        DECLE   $0009,  $001D,  $0021,  $0023   ; 67F2   0009 001D 0021 0023
        DECLE   $001F,  $0009,  $000D,  $0007   ; 67F6   001F 0009 000D 0007
        DECLE   $0015,  $0009,  $0004,  $001B   ; 67FA   0015 0009 0004 001B
        DECLE   $0199,  $0009,  $0004,  $01A1   ; 67FE   0199 0009 0004 01A1
        DECLE   $0197,  $0197,  $01A5,  $01C1   ; 6802   0197 0197 01A5 01C1
        DECLE   $0197,  $0197,  $01C3,  $01A7   ; 6806   0197 0197 01C3 01A7
        DECLE   $0197,  $0197,  $01A3,  $0009   ; 680A   0197 0197 01A3 0009
        DECLE   $0004,  $019B,  $0199,  $0009   ; 680E   0004 019B 0199 0009
        DECLE   $0004,  $01A1,  $0197,  $0197   ; 6812   0004 01A1 0197 0197
        DECLE   $01C5,  $0197,  $01C9,  $01CB   ; 6816   01C5 0197 01C9 01CB
        DECLE   $0197,  $01C7,  $0197,  $0197   ; 681A   0197 01C7 0197 0197
        DECLE   $01A3,  $0009,  $0004,  $019B   ; 681E   01A3 0009 0004 019B
        DECLE   $0197,  $0197,  $0001,  $01A5   ; 6822   0197 0197 0001 01A5
        DECLE   $0197,  $0008,  $01D1,  $01D3   ; 6826   0197 0008 01D1 01D3
        DECLE   $0197,  $0008,  $01A7,  $0001   ; 682A   0197 0008 01A7 0001
        DECLE   $0197,  $0006,  $0001,  $01A5   ; 682E   0197 0006 0001 01A5
        DECLE   $0197,  $0008,  $01CD,  $01CF   ; 6832   0197 0008 01CD 01CF
        DECLE   $0197,  $0008,  $01A7,  $0001   ; 6836   0197 0008 01A7 0001
        DECLE   $0197,  $0006,  $0001,  $01A5   ; 683A   0197 0006 0001 01A5
        DECLE   $0197,  $0008,  $01D5,  $01D7   ; 683E   0197 0008 01D5 01D7
        DECLE   $0197,  $0008,  $01A7,  $0001   ; 6842   0197 0008 01A7 0001
        DECLE   $0197,  $0014,  $01D5,  $01D7   ; 6846   0197 0014 01D5 01D7
        DECLE   $0197,  $0010,  $0000,  $0009   ; 684A   0197 0010 0000 0009
        DECLE   $007D,  $000B,  $0007,  $001A   ; 684E   007D 000B 0007 001A
        DECLE   $0013,  $0011,  $0009,  $0004   ; 6852   0013 0011 0009 0004

        INCR    R5                              ; 6856   000D
        SETC                                    ; 6857   0007
        SETC                                    ; 6858   0007
        INCR    R7                              ; 6859   000F
L_685A:
        DECR    R7                              ; 685A   0017

L_685B:
        SETC                                    ; 685B   0007
        INCR    R2                              ; 685C   000A
        INCR    R7                              ; 685D   000F
L_685E:
        DECR    R7                              ; 685E   0017

L_685F:
        SETC                                    ; 685F   0007
        DECLE   $0007,  $0015,  $0009,  $0006   ; 6860   0007 0015 0009 0006
        DECLE   $000D,  $0007,  $0019,  $0009   ; 6864   000D 0007 0019 0009
        DECLE   $0009,  $001B,  $0007,  $0006   ; 6868   0009 001B 0007 0006
        DECLE   $0019,  $0009,  $0009,  $001B   ; 686C   0019 0009 0009 001B
        DECLE   $0007,  $0015,  $0009,  $0006   ; 6870   0007 0015 0009 0006
        DECLE   $000D,  $0007,  $0019,  $0009   ; 6874   000D 0007 0019 0009
        DECLE   $0009,  $001B,  $0031,  $0007   ; 6878   0009 001B 0031 0007
        DECLE   $0007,  $0031,  $0019,  $0009   ; 687C   0007 0031 0019 0009
        DECLE   $0009,  $001B,  $0007,  $0015   ; 6880   0009 001B 0007 0015
        DECLE   $0009,  $0006,  $0065,  $0005   ; 6884   0009 0006 0065 0005
        DECLE   $0069,  $0009,  $0009,  $006B   ; 6888   0069 0009 0009 006B
        DECLE   $0059,  $0051,  $0053,  $005B   ; 688C   0059 0051 0053 005B
        DECLE   $0069,  $0009,  $0009,  $006B   ; 6890   0069 0009 0009 006B
        DECLE   $0005,  $0067,  $0009,  $0006   ; 6894   0005 0067 0009 0006
        DECLE   $0065,  $0005,  $0005,  $006F   ; 6898   0065 0005 0005 006F
        DECLE   $006D,  $0055,  $0051,  $0039   ; 689C   006D 0055 0051 0039
        DECLE   $003B,  $0053,  $0057,  $006F   ; 68A0   003B 0053 0057 006F
        DECLE   $006D,  $0005,  $0005,  $0067   ; 68A4   006D 0005 0005 0067
        DECLE   $0009,  $0006,  $0065,  $0005   ; 68A8   0009 0006 0065 0005
        DECLE   $0005,  $0025,  $005D,  $0051   ; 68AC   0005 0025 005D 0051
        DECLE   $0001,  $003D,  $003F,  $0001   ; 68B0   0001 003D 003F 0001
        DECLE   $0053,  $005F,  $0027,  $0005   ; 68B4   0053 005F 0027 0005
        DECLE   $0005,  $0067,  $0009,  $0009   ; 68B8   0005 0067 0009 0009
        DECLE   $0001,  $0005,  $0006,  $0055   ; 68BC   0001 0005 0006 0055
        DECLE   $0051,  $0001,  $0001,  $0075   ; 68C0   0051 0001 0001 0075
        DECLE   $0077,  $0001,  $0001,  $0053   ; 68C4   0077 0001 0001 0053
        DECLE   $0057,  $0005,  $0006,  $0001   ; 68C8   0057 0005 0006 0001
        DECLE   $0001,  $0005,  $0004,  $0055   ; 68CC   0001 0005 0004 0055
        DECLE   $0051,  $0001,  $000E,  $0053   ; 68D0   0051 0001 000E 0053
        DECLE   $0057,  $0005,  $0004,  $0001   ; 68D4   0057 0005 0004 0001
        DECLE   $0001,  $0005,  $0005,  $0055   ; 68D8   0001 0005 0005 0055
        DECLE   $0051,  $0001,  $0006,  $0071   ; 68DC   0051 0001 0006 0071
        DECLE   $0073,  $0001,  $0006,  $0053   ; 68E0   0073 0001 0006 0053
        DECLE   $0057,  $0005,  $0005,  $0001   ; 68E4   0057 0005 0005 0001
        DECLE   $0000                           ; 68E8   0000

        COMR    R3                              ; 68E9   001B
        SETC                                    ; 68EA   0007
        SETC                                    ; 68EB   0007
        INCR    R7                              ; 68EC   000F

        GSWD    R3                              ; 68ED   0033
L_68EE:
        INCR    R3                              ; 68EE   000B
        SETC                                    ; 68EF   0007
        INCR    R6                              ; 68F0   000E
        DECR    R3                              ; 68F1   0013
        GSWD    R3                              ; 68F2   0033
L_68F3:
        DECR    R7                              ; 68F3   0017

        DECLE   $0007,  $0007,  $0019,  $001B   ; 68F4   0007 0007 0019 001B
        DECLE   $0007,  $0019,  $0009,  $0009   ; 68F8   0007 0019 0009 0009
        DECLE   $000D,  $0007,  $000E,  $0015   ; 68FC   000D 0007 000E 0015
        DECLE   $0009,  $0009,  $001B,  $0007   ; 6900   0009 0009 001B 0007
        DECLE   $0019,  $001B,  $0007,  $0019   ; 6904   0019 001B 0007 0019
        DECLE   $0009,  $0009,  $000D,  $0007   ; 6908   0009 0009 000D 0007
        DECLE   $0013,  $000B,  $0007,  $0007   ; 690C   0013 000B 0007 0007
        DECLE   $0013,  $000B,  $0007,  $0015   ; 6910   0013 000B 0007 0015
        DECLE   $0009,  $0009,  $001B,  $0007   ; 6914   0009 0009 001B 0007
        DECLE   $0019,  $001B,  $0007,  $0019   ; 6918   0019 001B 0007 0019
        DECLE   $0009,  $0009,  $000D,  $0007   ; 691C   0009 0009 000D 0007
        DECLE   $0015,  $000D,  $0007,  $0007   ; 6920   0015 000D 0007 0007
        DECLE   $0015,  $000D,  $0007,  $0015   ; 6924   0015 000D 0007 0015
        DECLE   $0009,  $0009,  $001B,  $0007   ; 6928   0009 0009 001B 0007
        DECLE   $0019,  $006B,  $0005,  $0069   ; 692C   0019 006B 0005 0069
        DECLE   $0009,  $0009,  $0065,  $0005   ; 6930   0009 0009 0065 0005
        DECLE   $006F,  $0055,  $0051,  $0053   ; 6934   006F 0055 0051 0053
        DECLE   $0057,  $006D,  $0005,  $0067   ; 6938   0057 006D 0005 0067
        DECLE   $0009,  $0009,  $006B,  $0005   ; 693C   0009 0009 006B 0005
        DECLE   $0069,  $006B,  $0005,  $0005   ; 6940   0069 006B 0005 0005
        DECLE   $006F,  $0029,  $0005,  $0005   ; 6944   006F 0029 0005 0005
        DECLE   $0055,  $0051,  $0041,  $0043   ; 6948   0055 0051 0041 0043
        DECLE   $0053,  $0057,  $0005,  $0005   ; 694C   0053 0057 0005 0005
        DECLE   $002B,  $006D,  $0005,  $0005   ; 6950   002B 006D 0005 0005
        DECLE   $0069,  $0005,  $0004,  $006F   ; 6954   0069 0005 0004 006F
        DECLE   $0029,  $0005,  $0055,  $0051   ; 6958   0029 0005 0055 0051
        DECLE   $0001,  $0045,  $0047,  $0001   ; 695C   0001 0045 0047 0001
        DECLE   $0053,  $0057,  $0005,  $002B   ; 6960   0053 0057 0005 002B
        DECLE   $006D,  $0005,  $000A,  $006F   ; 6964   006D 0005 000A 006F
        DECLE   $0029,  $0055,  $0051,  $0001   ; 6968   0029 0055 0051 0001
        DECLE   $0001,  $0075,  $0077,  $0001   ; 696C   0001 0075 0077 0001
        DECLE   $0001,  $0053,  $0057,  $002B   ; 6970   0001 0053 0057 002B
        DECLE   $006D,  $0005,  $000C,  $0055   ; 6974   006D 0005 000C 0055
        DECLE   $0051,  $0001,  $0004,  $0079   ; 6978   0051 0001 0004 0079
        DECLE   $007B,  $0001,  $0004,  $0053   ; 697C   007B 0001 0004 0053
        DECLE   $0057,  $0005,  $000C,  $0055   ; 6980   0057 0005 000C 0055
        DECLE   $0051,  $0001,  $0012,  $0053   ; 6984   0051 0001 0012 0053
        DECLE   $0057,  $0005,  $0004,  $0000   ; 6988   0057 0005 0004 0000
        DECLE   $0007,  $0035,  $0009,  $007D   ; 698C   0007 0035 0009 007D
        DECLE   $000B,  $0007,  $0012,  $0013   ; 6990   000B 0007 0012 0013
        DECLE   $0011,  $0009,  $0037,  $0007   ; 6994   0011 0009 0037 0007
        DECLE   $0019,  $0009,  $0004,  $000D   ; 6998   0019 0009 0004 000D
        DECLE   $0007,  $0012,  $0015,  $0009   ; 699C   0007 0012 0015 0009
        DECLE   $0004,  $001B,  $0019,  $0009   ; 69A0   0004 001B 0019 0009
        DECLE   $0004,  $000D,  $0007,  $0035   ; 69A4   0004 000D 0007 0035
        DECLE   $007D,  $000B,  $0007,  $0007   ; 69A8   007D 000B 0007 0007
        DECLE   $0013,  $0011,  $0037,  $0007   ; 69AC   0013 0011 0037 0007
        DECLE   $0015,  $0009,  $0004,  $001B   ; 69B0   0015 0009 0004 001B
        DECLE   $0019,  $0009,  $0004,  $000D   ; 69B4   0019 0009 0004 000D
        DECLE   $0007,  $0015,  $0009,  $001D   ; 69B8   0007 0015 0009 001D
        DECLE   $0021,  $0023,  $001F,  $0009   ; 69BC   0021 0023 001F 0009
        DECLE   $000D,  $0007,  $0015,  $0009   ; 69C0   000D 0007 0015 0009
        DECLE   $0004,  $001B,  $0069,  $0009   ; 69C4   0004 001B 0069 0009
        DECLE   $0004,  $0065,  $0005,  $0005   ; 69C8   0004 0065 0005 0005
        DECLE   $006D,  $0061,  $0051,  $0053   ; 69CC   006D 0061 0051 0053
        DECLE   $0063,  $006F,  $0005,  $0005   ; 69D0   0063 006F 0005 0005
        DECLE   $0067,  $0009,  $0004,  $006B   ; 69D4   0067 0009 0004 006B
        DECLE   $0069,  $0009,  $0004,  $0065   ; 69D8   0069 0009 0004 0065
        DECLE   $0005,  $0005,  $005D,  $0051   ; 69DC   0005 0005 005D 0051
        DECLE   $0049,  $004B,  $0053,  $005F   ; 69E0   0049 004B 0053 005F
        DECLE   $0005,  $0005,  $0067,  $0009   ; 69E4   0005 0005 0067 0009
        DECLE   $0004,  $006B,  $0005,  $0005   ; 69E8   0004 006B 0005 0005
        DECLE   $0001,  $006D,  $0005,  $0005   ; 69EC   0001 006D 0005 0005
        DECLE   $0055,  $0051,  $0001,  $0075   ; 69F0   0055 0051 0001 0075
        DECLE   $0077,  $0001,  $0053,  $0057   ; 69F4   0077 0001 0053 0057
        DECLE   $0005,  $0005,  $006F,  $0001   ; 69F8   0005 0005 006F 0001
        DECLE   $0005,  $0006,  $0001,  $006D   ; 69FC   0005 0006 0001 006D
        DECLE   $0005,  $0055,  $0051,  $0001   ; 6A00   0005 0055 0051 0001
        DECLE   $0001,  $004D,  $004F,  $0001   ; 6A04   0001 004D 004F 0001
        DECLE   $0001,  $0053,  $0057,  $0005   ; 6A08   0001 0053 0057 0005
        DECLE   $006F,  $0001,  $0005,  $0006   ; 6A0C   006F 0001 0005 0006
        DECLE   $0001,  $006D,  $0055,  $0051   ; 6A10   0001 006D 0055 0051
        DECLE   $0001,  $0004,  $0071,  $0073   ; 6A14   0001 0004 0071 0073
        DECLE   $0001,  $0004,  $0053,  $0057   ; 6A18   0001 0004 0053 0057
        DECLE   $006F,  $0001,  $0005,  $0008   ; 6A1C   006F 0001 0005 0008
        DECLE   $0055,  $0051,  $0001,  $0006   ; 6A20   0055 0051 0001 0006
        DECLE   $0071,  $0073,  $0001,  $0006   ; 6A24   0071 0073 0001 0006
        DECLE   $0053,  $0057,  $0005,  $0004   ; 6A28   0053 0057 0005 0004
        DECLE   $0000,  $0007,  $0016,  $00B3   ; 6A2C   0000 0007 0016 00B3
        DECLE   $00BF,  $00C1,  $00BF,  $00C1   ; 6A30   00BF 00C1 00BF 00C1
        DECLE   $00BF,  $01D9,  $0001,  $0007   ; 6A34   00BF 01D9 0001 0007
        DECLE   $0016,  $00B3,  $00BF,  $00C1   ; 6A38   0016 00B3 00BF 00C1
        DECLE   $00BF,  $00C1,  $00BF,  $01D9   ; 6A3C   00BF 00C1 00BF 01D9
        DECLE   $0001,  $0007,  $0016,  $00B3   ; 6A40   0001 0007 0016 00B3
        DECLE   $00BF,  $00C1,  $00BF,  $00C1   ; 6A44   00BF 00C1 00BF 00C1
        DECLE   $00BF,  $01D9,  $0001,  $0007   ; 6A48   00BF 01D9 0001 0007
        DECLE   $0016,  $00B3,  $00BF,  $00C1   ; 6A4C   0016 00B3 00BF 00C1
        DECLE   $00BF,  $00C1,  $00BF,  $01D9   ; 6A50   00BF 00C1 00BF 01D9
        DECLE   $0001                           ; 6A54   0001

        MOVR    R1,     R5                      ; 6A55   008D
        INCR    R2                              ; 6A56   000A
        MOVR    R4,     R1                      ; 6A57   00A1
        MOVR    R3,     R7                      ; 6A58   009F

        DECLE   $009D,  $018D,  $0001,  $018B   ; 6A59   009D 018D 0001 018B
        DECLE   $00B3,  $00BF,  $00C1,  $00BF   ; 6A5D   00B3 00BF 00C1 00BF
        DECLE   $00C1,  $00BF,  $01D9,  $0001   ; 6A61   00C1 00BF 01D9 0001
        DECLE   $008D,  $0006,  $00A5,  $00A3   ; 6A65   008D 0006 00A5 00A3
        DECLE   $018F,  $0001,  $0008,  $00B3   ; 6A69   018F 0001 0008 00B3
        DECLE   $00BF,  $00C1,  $00BF,  $00C1   ; 6A6D   00BF 00C1 00BF 00C1
        DECLE   $00BF,  $01D9,  $0001,  $008D   ; 6A71   00BF 01D9 0001 008D
        DECLE   $0004,  $00A7,  $0001,  $0001   ; 6A75   0004 00A7 0001 0001
        DECLE   $0191,  $0001,  $0008,  $00B5   ; 6A79   0191 0001 0008 00B5
        DECLE   $00BF,  $00C1,  $00BF,  $00C1   ; 6A7D   00BF 00C1 00BF 00C1
        DECLE   $00BF,  $01D9,  $0001,  $008D   ; 6A81   00BF 01D9 0001 008D
        DECLE   $008D,  $00A9,  $0001,  $0012   ; 6A85   008D 00A9 0001 0012
        DECLE   $00B7,  $00C1,  $00BF,  $00C1   ; 6A89   00B7 00C1 00BF 00C1
        DECLE   $00BF,  $01D9,  $0001,  $008D   ; 6A8D   00BF 01D9 0001 008D
        DECLE   $00BD,  $0001,  $0004,  $0141   ; 6A91   00BD 0001 0004 0141
        DECLE   $0001,  $0010,  $00B9,  $00BB   ; 6A95   0001 0010 00B9 00BB
        DECLE   $00BF,  $01D9,  $0001,  $008D   ; 6A99   00BF 01D9 0001 008D
        DECLE   $009B,  $0001,  $0004,  $0141   ; 6A9D   009B 0001 0004 0141
        DECLE   $0001,  $001A,  $0000,  $0007   ; 6AA1   0001 001A 0000 0007
        DECLE   $0016,  $0083,  $00C1,  $01D9   ; 6AA5   0016 0083 00C1 01D9
        DECLE   $007F,  $01D9,  $007F,  $00BF   ; 6AA9   007F 01D9 007F 00BF
        DECLE   $01D9,  $0007,  $0016,  $0083   ; 6AAD   01D9 0007 0016 0083
        DECLE   $00C1,  $01D9,  $007F,  $01D9   ; 6AB1   00C1 01D9 007F 01D9
        DECLE   $007F,  $00BF,  $01D9,  $0007   ; 6AB5   007F 00BF 01D9 0007
        DECLE   $0016,  $0083,  $00C1,  $01D9   ; 6AB9   0016 0083 00C1 01D9
        DECLE   $007F,  $01D9,  $007F,  $00BF   ; 6ABD   007F 01D9 007F 00BF
        DECLE   $01D9,  $0007,  $0016,  $0083   ; 6AC1   01D9 0007 0016 0083
        DECLE   $00C1,  $01D9,  $007F,  $01D9   ; 6AC5   00C1 01D9 007F 01D9
        DECLE   $007F,  $00BF                   ; 6AC9   007F 00BF

        XORR    R3,     R1                      ; 6ACB   01D9
        MOVR    R1,     R5                      ; 6ACC   008D
        INCR    R2                              ; 6ACD   000A
        MOVR    R4,     R1                      ; 6ACE   00A1
        MOVR    R3,     R7                      ; 6ACF   009F

        DECLE   $009D,  $0001,  $008F,  $0001   ; 6AD0   009D 0001 008F 0001
        DECLE   $0083,  $00C1,  $01D9,  $007F   ; 6AD4   0083 00C1 01D9 007F
        DECLE   $01D9,  $007F,  $00BF,  $01D9   ; 6AD8   01D9 007F 00BF 01D9
        DECLE   $008D,  $0006,  $00A5,  $00A3   ; 6ADC   008D 0006 00A5 00A3
        DECLE   $0001,  $0001,  $0091,  $0001   ; 6AE0   0001 0001 0091 0001
        DECLE   $0004,  $0083,  $00C1,  $01D9   ; 6AE4   0004 0083 00C1 01D9
        DECLE   $007F,  $01D9,  $007F,  $00BF   ; 6AE8   007F 01D9 007F 00BF
        DECLE   $01D9,  $008D,  $0004,  $00A7   ; 6AEC   01D9 008D 0004 00A7
        DECLE   $0001,  $0093,  $0095,  $0001   ; 6AF0   0001 0093 0095 0001
        DECLE   $0008,  $008B,  $00C1,  $01D9   ; 6AF4   0008 008B 00C1 01D9
        DECLE   $007F,  $01D9,  $007F,  $00BF   ; 6AF8   007F 01D9 007F 00BF
        DECLE   $01D9,  $008D,  $008D,  $00A9   ; 6AFC   01D9 008D 008D 00A9
        DECLE   $0001,  $0001,  $0097,  $0099   ; 6B00   0001 0001 0097 0099
        DECLE   $0001,  $000A,  $00AD,  $01D9   ; 6B04   0001 000A 00AD 01D9
        DECLE   $007F,  $01D9,  $007F,  $00BF   ; 6B08   007F 01D9 007F 00BF
        DECLE   $01D9,  $008D,  $00BD,  $0001   ; 6B0C   01D9 008D 00BD 0001

        DECR    R6                              ; 6B10   0016
        MOVR    R5,     R7                      ; 6B11   00AF

        DECLE   $0089,  $00B1,  $007F,  $00BF   ; 6B12   0089 00B1 007F 00BF
        DECLE   $01D9,  $008D,  $009B,  $0001   ; 6B16   01D9 008D 009B 0001
        DECLE   $0006,  $0141,  $0001,  $0018   ; 6B1A   0006 0141 0001 0018
        DECLE   $0000,  $0007,  $0016,  $0081   ; 6B1E   0000 0007 0016 0081
        DECLE   $00C3,  $007F,  $01D9,  $0001   ; 6B22   00C3 007F 01D9 0001
        DECLE   $01D9,  $007F,  $00BF,  $0007   ; 6B26   01D9 007F 00BF 0007
        DECLE   $0016,  $0081,  $00C3,  $007F   ; 6B2A   0016 0081 00C3 007F
        DECLE   $01D9,  $0001,  $01D9,  $007F   ; 6B2E   01D9 0001 01D9 007F
        DECLE   $00BF,  $0007,  $0016,  $0081   ; 6B32   00BF 0007 0016 0081
        DECLE   $00C3,  $007F,  $01D9,  $0001   ; 6B36   00C3 007F 01D9 0001
        DECLE   $01D9,  $007F,  $00BF,  $0007   ; 6B3A   01D9 007F 00BF 0007
        DECLE   $0016,  $0081,  $00C3,  $007F   ; 6B3E   0016 0081 00C3 007F
        DECLE   $01D9,  $0001,  $01D9,  $007F   ; 6B42   01D9 0001 01D9 007F
        DECLE   $00BF                           ; 6B46   00BF

        MOVR    R1,     R5                      ; 6B47   008D
        INCR    R2                              ; 6B48   000A
        MOVR    R4,     R1                      ; 6B49   00A1
        MOVR    R3,     R7                      ; 6B4A   009F

        DECLE   $009D,  $00AB,  $0001,  $0001   ; 6B4B   009D 00AB 0001 0001
        DECLE   $0081,  $00C3,  $007F,  $01D9   ; 6B4F   0081 00C3 007F 01D9
        DECLE   $0001,  $01D9,  $007F,  $00BF   ; 6B53   0001 01D9 007F 00BF
        DECLE   $008D,  $0006,  $00A5,  $00A3   ; 6B57   008D 0006 00A5 00A3
        DECLE   $0001,  $0193,  $0001,  $0006   ; 6B5B   0001 0193 0001 0006
        DECLE   $0081,  $00C3,  $007F,  $01D9   ; 6B5F   0081 00C3 007F 01D9
        DECLE   $0001,  $01D9,  $007F,  $00BF   ; 6B63   0001 01D9 007F 00BF
        DECLE   $008D,  $0004,  $00A7,  $0001   ; 6B67   008D 0004 00A7 0001
        DECLE   $000E,  $0085,  $00C3,  $007F   ; 6B6B   000E 0085 00C3 007F
        DECLE   $01D9,  $0001,  $01D9,  $007F   ; 6B6F   01D9 0001 01D9 007F
        DECLE   $00BF,  $008D,  $008D,  $00A9   ; 6B73   00BF 008D 008D 00A9
        DECLE   $0001,  $0001,  $0141,  $0001   ; 6B77   0001 0001 0141 0001

        INCR    R4                              ; 6B7B   000C
        MOVR    R0,     R7                      ; 6B7C   0087

        DECLE   $007F,  $01D9,  $0001,  $01D9   ; 6B7D   007F 01D9 0001 01D9
        DECLE   $007F,  $00BF,  $008D,  $00BD   ; 6B81   007F 00BF 008D 00BD
        DECLE   $0001,  $0004,  $0141,  $0001   ; 6B85   0001 0004 0141 0001
        DECLE   $0010,  $0195,  $0001,  $01D9   ; 6B89   0010 0195 0001 01D9
        DECLE   $007F,  $00BF,  $008D,  $009B   ; 6B8D   007F 00BF 008D 009B
        DECLE   $0001,  $0022,  $0000,  $0001   ; 6B91   0001 0022 0000 0001
        DECLE   $01D9,  $00BF,  $00C1,  $00BF   ; 6B95   01D9 00BF 00C1 00BF
        DECLE   $00C1,  $00BF,  $00B3,  $0007   ; 6B99   00C1 00BF 00B3 0007
        DECLE   $0016,  $0001,  $01D9,  $00BF   ; 6B9D   0016 0001 01D9 00BF
        DECLE   $00C1,  $00BF,  $00C1,  $00BF   ; 6BA1   00C1 00BF 00C1 00BF
        DECLE   $00B3,  $0007,  $0016,  $0001   ; 6BA5   00B3 0007 0016 0001
        DECLE   $01D9,  $00BF,  $00C1,  $00BF   ; 6BA9   01D9 00BF 00C1 00BF
        DECLE   $00C1,  $00BF,  $00B3,  $0007   ; 6BAD   00C1 00BF 00B3 0007
        DECLE   $0016,  $0001,  $01D9,  $00BF   ; 6BB1   0016 0001 01D9 00BF
        DECLE   $00C1,  $00BF,  $00C1,  $00BF   ; 6BB5   00C1 00BF 00C1 00BF
        DECLE   $00B3,  $0007,  $0016,  $0001   ; 6BB9   00B3 0007 0016 0001
        DECLE   $01D9,  $00BF,  $00C1,  $00BF   ; 6BBD   01D9 00BF 00C1 00BF
        DECLE   $00C1,  $00BF,  $00B3,  $018B   ; 6BC1   00C1 00BF 00B3 018B
        DECLE   $0001                           ; 6BC5   0001

        ANDR    R1,     R5                      ; 6BC6   018D
        MOVR    R3,     R5                      ; 6BC7   009D
        MOVR    R3,     R7                      ; 6BC8   009F

        DECLE   $00A1,  $008D,  $000A,  $0001   ; 6BC9   00A1 008D 000A 0001
        DECLE   $01D9,  $00BF,  $00C1,  $00BF   ; 6BCD   01D9 00BF 00C1 00BF
        DECLE   $00C1,  $00BF,  $00B3,  $0001   ; 6BD1   00C1 00BF 00B3 0001
        DECLE   $0008,  $018F,  $00A3,  $00A5   ; 6BD5   0008 018F 00A3 00A5
        DECLE   $008D,  $0006,  $0001,  $01D9   ; 6BD9   008D 0006 0001 01D9
        DECLE   $00BF,  $00C1,  $00BF,  $00C1   ; 6BDD   00BF 00C1 00BF 00C1
        DECLE   $00BF,  $00B5,  $0001,  $0008   ; 6BE1   00BF 00B5 0001 0008
        DECLE   $0191,  $0001,  $0001,  $00A7   ; 6BE5   0191 0001 0001 00A7
        DECLE   $008D,  $0004,  $0001,  $01D9   ; 6BE9   008D 0004 0001 01D9
        DECLE   $00BF,  $00C1,  $00BF,  $00C1   ; 6BED   00BF 00C1 00BF 00C1
        DECLE   $00B7,  $0001,  $0012,  $00A9   ; 6BF1   00B7 0001 0012 00A9
        DECLE   $008D,  $008D,  $0001,  $01D9   ; 6BF5   008D 008D 0001 01D9
        DECLE   $00BF,  $00BB,  $00B9,  $0001   ; 6BF9   00BF 00BB 00B9 0001
        DECLE   $0010,  $0141,  $0001,  $0004   ; 6BFD   0010 0141 0001 0004
        DECLE   $00BD,  $008D,  $0001,  $001A   ; 6C01   00BD 008D 0001 001A
        DECLE   $0141,  $0001,  $0004,  $009B   ; 6C05   0141 0001 0004 009B
        DECLE   $008D,  $0000,  $01D9,  $00BF   ; 6C09   008D 0000 01D9 00BF
        DECLE   $007F,  $01D9,  $007F,  $01D9   ; 6C0D   007F 01D9 007F 01D9
        DECLE   $00C1,  $0083,  $0007,  $0016   ; 6C11   00C1 0083 0007 0016
        DECLE   $01D9,  $00BF,  $007F,  $01D9   ; 6C15   01D9 00BF 007F 01D9
        DECLE   $007F,  $01D9,  $00C1,  $0083   ; 6C19   007F 01D9 00C1 0083
        DECLE   $0007,  $0016,  $01D9,  $00BF   ; 6C1D   0007 0016 01D9 00BF
        DECLE   $007F,  $01D9,  $007F,  $01D9   ; 6C21   007F 01D9 007F 01D9
        DECLE   $00C1,  $0083,  $0007,  $0016   ; 6C25   00C1 0083 0007 0016
        DECLE   $01D9,  $00BF,  $007F,  $01D9   ; 6C29   01D9 00BF 007F 01D9
        DECLE   $007F,  $01D9,  $00C1,  $0083   ; 6C2D   007F 01D9 00C1 0083
        DECLE   $0007,  $0016,  $01D9,  $00BF   ; 6C31   0007 0016 01D9 00BF
        DECLE   $007F,  $01D9,  $007F,  $01D9   ; 6C35   007F 01D9 007F 01D9
        DECLE   $00C1,  $0083,  $0001,  $008F   ; 6C39   00C1 0083 0001 008F
        DECLE   $0001                           ; 6C3D   0001

        MOVR    R3,     R5                      ; 6C3E   009D
        MOVR    R3,     R7                      ; 6C3F   009F

        DECLE   $00A1,  $008D,  $000A,  $01D9   ; 6C40   00A1 008D 000A 01D9
        DECLE   $00BF,  $007F,  $01D9,  $007F   ; 6C44   00BF 007F 01D9 007F
        DECLE   $01D9,  $00C1,  $0083,  $0001   ; 6C48   01D9 00C1 0083 0001
        DECLE   $0004,  $0091,  $0001,  $0001   ; 6C4C   0004 0091 0001 0001
        DECLE   $00A3,  $00A5,  $008D,  $0006   ; 6C50   00A3 00A5 008D 0006
        DECLE   $01D9,  $00BF,  $007F,  $01D9   ; 6C54   01D9 00BF 007F 01D9
        DECLE   $007F,  $01D9,  $00C1,  $008B   ; 6C58   007F 01D9 00C1 008B
        DECLE   $0001,  $0008,  $0095,  $0093   ; 6C5C   0001 0008 0095 0093
        DECLE   $0001,  $00A7,  $008D,  $0004   ; 6C60   0001 00A7 008D 0004
        DECLE   $01D9,  $00BF,  $007F,  $01D9   ; 6C64   01D9 00BF 007F 01D9
        DECLE   $007F,  $01D9,  $00AD,  $0001   ; 6C68   007F 01D9 00AD 0001

        INCR    R2                              ; 6C6C   000A
        MOVR    R3,     R1                      ; 6C6D   0099
        MOVR    R2,     R7                      ; 6C6E   0097

        DECLE   $0001,  $0001,  $00A9,  $008D   ; 6C6F   0001 0001 00A9 008D
        DECLE   $008D,  $01D9,  $00BF           ; 6C73   008D 01D9 00BF

        SARC    R3,     2                       ; 6C76   007F
        MOVR    R6,     R1                      ; 6C77   00B1
        TSTR    R1                              ; 6C78   0089
        MOVR    R5,     R7                      ; 6C79   00AF

        DECLE   $0001,  $0016,  $00BD,  $008D   ; 6C7A   0001 0016 00BD 008D
        DECLE   $0001,  $0018,  $0141,  $0001   ; 6C7E   0001 0018 0141 0001
        DECLE   $0006,  $009B,  $008D,  $0000   ; 6C82   0006 009B 008D 0000
        DECLE   $00BF,  $007F,  $01D9,  $0001   ; 6C86   00BF 007F 01D9 0001
        DECLE   $01D9,  $007F,  $00C3,  $0081   ; 6C8A   01D9 007F 00C3 0081
        DECLE   $0007,  $0016,  $00BF,  $007F   ; 6C8E   0007 0016 00BF 007F
        DECLE   $01D9,  $0001,  $01D9,  $007F   ; 6C92   01D9 0001 01D9 007F
        DECLE   $00C3,  $0081,  $0007,  $0016   ; 6C96   00C3 0081 0007 0016
        DECLE   $00BF,  $007F,  $01D9,  $0001   ; 6C9A   00BF 007F 01D9 0001
        DECLE   $01D9,  $007F,  $00C3,  $0081   ; 6C9E   01D9 007F 00C3 0081
        DECLE   $0007,  $0016,  $00BF,  $007F   ; 6CA2   0007 0016 00BF 007F
        DECLE   $01D9,  $0001,  $01D9,  $007F   ; 6CA6   01D9 0001 01D9 007F
        DECLE   $00C3,  $0081,  $0007,  $0016   ; 6CAA   00C3 0081 0007 0016
        DECLE   $00BF,  $007F,  $01D9,  $0001   ; 6CAE   00BF 007F 01D9 0001
        DECLE   $01D9,  $007F,  $00C3,  $0081   ; 6CB2   01D9 007F 00C3 0081
        DECLE   $0001,  $0001                   ; 6CB6   0001 0001

        MOVR    R5,     R3                      ; 6CB8   00AB
        MOVR    R3,     R5                      ; 6CB9   009D
        MOVR    R3,     R7                      ; 6CBA   009F

        DECLE   $00A1,  $008D,  $000A,  $00BF   ; 6CBB   00A1 008D 000A 00BF
        DECLE   $007F,  $01D9,  $0001,  $01D9   ; 6CBF   007F 01D9 0001 01D9
        DECLE   $007F,  $00C3,  $0081,  $0001   ; 6CC3   007F 00C3 0081 0001
        DECLE   $0006,  $0193,  $0001,  $00A3   ; 6CC7   0006 0193 0001 00A3
        DECLE   $00A5,  $008D,  $0006,  $00BF   ; 6CCB   00A5 008D 0006 00BF
        DECLE   $007F,  $01D9,  $0001,  $01D9   ; 6CCF   007F 01D9 0001 01D9
        DECLE   $007F,  $00C3,  $0085,  $0001   ; 6CD3   007F 00C3 0085 0001

        INCR    R6                              ; 6CD7   000E
        MOVR    R4,     R7                      ; 6CD8   00A7

        DECLE   $008D,  $0004,  $00BF,  $007F   ; 6CD9   008D 0004 00BF 007F
        DECLE   $01D9,  $0001                   ; 6CDD   01D9 0001

        XORR    R3,     R1                      ; 6CDF   01D9
        SARC    R3,     2                       ; 6CE0   007F
        MOVR    R0,     R7                      ; 6CE1   0087

        DECLE   $0001,  $000C,  $0141,  $0001   ; 6CE2   0001 000C 0141 0001
        DECLE   $0001,  $00A9,  $008D,  $008D   ; 6CE6   0001 00A9 008D 008D
        DECLE   $00BF,  $007F,  $01D9,  $0001   ; 6CEA   00BF 007F 01D9 0001
        DECLE   $0195,  $0001,  $0010,  $0141   ; 6CEE   0195 0001 0010 0141
        DECLE   $0001,  $0004,  $00BD,  $008D   ; 6CF2   0001 0004 00BD 008D
        DECLE   $0001,  $0022,  $009B,  $008D   ; 6CF6   0001 0022 009B 008D
        DECLE   $0000                           ; 6CFA   0000

        SUBR    R1,     R7                      ; 6CFB   010F
        SUBR    R1,     R7                      ; 6CFC   010F

        ADDR    R0,     R5                      ; 6CFD   00C5
        ADDR    R0,     R5                      ; 6CFE   00C5
        ADDR    R0,     R7                      ; 6CFF   00C7

        ADDR    R3,     R5                      ; 6D00   00DD
        SUBR    R2,     R1                      ; 6D01   0111
        INCR    R6                              ; 6D02   000E
        ADDR    R3,     R1                      ; 6D03   00D9
        ADDR    R1,     R1                      ; 6D04   00C9
        ADDR    R0,     R5                      ; 6D05   00C5
        ADDR    R0,     R5                      ; 6D06   00C5
        SUBR    R1,     R7                      ; 6D07   010F

        CLRC                                    ; 6D08   0006
        ADDR    R0,     R5                      ; 6D09   00C5
        ADDR    R0,     R5                      ; 6D0A   00C5
        SUBR    R1,     R7                      ; 6D0B   010F
        ADDR    R3,     R7                      ; 6D0C   00DF

        ADDR    R1,     R5                      ; 6D0D   00CD
        ADDR    R3,     R5                      ; 6D0E   00DD
        SUBR    R2,     R1                      ; 6D0F   0111
        CLRC                                    ; 6D10   0006
        ADDR    R3,     R1                      ; 6D11   00D9
        ADDR    R1,     R5                      ; 6D12   00CD
        ADDR    R4,     R5                      ; 6D13   00E5
        SUBR    R1,     R7                      ; 6D14   010F

        ADDR    R0,     R5                      ; 6D15   00C5
        ADDR    R0,     R5                      ; 6D16   00C5
        SUBR    R1,     R7                      ; 6D17   010F

        CLRC                                    ; 6D18   0006
        ADDR    R0,     R5                      ; 6D19   00C5
        ADDR    R0,     R5                      ; 6D1A   00C5
        SUBR    R1,     R7                      ; 6D1B   010F
        SUBR    R1,     R7                      ; 6D1C   010F

        ADDR    R0,     R5                      ; 6D1D   00C5
        ADDR    R3,     R7                      ; 6D1E   00DF
        ADDR    R1,     R7                      ; 6D1F   00CF

        SUBR    R2,     R1                      ; 6D20   0111
        SUBR    R2,     R1                      ; 6D21   0111
        ADDR    R2,     R3                      ; 6D22   00D3
        ADDR    R4,     R5                      ; 6D23   00E5
        ADDR    R0,     R5                      ; 6D24   00C5
        SUBR    R1,     R7                      ; 6D25   010F
        SUBR    R1,     R7                      ; 6D26   010F

        ADDR    R0,     R5                      ; 6D27   00C5
        ADDR    R0,     R5                      ; 6D28   00C5
        SUBR    R1,     R7                      ; 6D29   010F

        CLRC                                    ; 6D2A   0006
        ADDR    R0,     R5                      ; 6D2B   00C5
        ADDR    R0,     R5                      ; 6D2C   00C5
        SUBR    R1,     R7                      ; 6D2D   010F
        SUBR    R1,     R7                      ; 6D2E   010F

        ADDR    R0,     R5                      ; 6D2F   00C5
        SUBR    R1,     R7                      ; 6D30   010F

        ADDR    R2,     R1                      ; 6D31   00D1
        SUBR    R2,     R1                      ; 6D32   0111
        SUBR    R2,     R1                      ; 6D33   0111
        ADDR    R4,     R1                      ; 6D34   00E1
        SUBR    R1,     R7                      ; 6D35   010F

        ADDR    R0,     R5                      ; 6D36   00C5
        SUBR    R1,     R7                      ; 6D37   010F
        SUBR    R1,     R7                      ; 6D38   010F

        ADDR    R0,     R5                      ; 6D39   00C5
        ADDR    R0,     R5                      ; 6D3A   00C5
        SUBR    R1,     R7                      ; 6D3B   010F

        CLRC                                    ; 6D3C   0006
        ADDR    R0,     R5                      ; 6D3D   00C5
        ADDR    R0,     R5                      ; 6D3E   00C5
        SUBR    R1,     R7                      ; 6D3F   010F
        SUBR    R1,     R7                      ; 6D40   010F

        ADDR    R0,     R5                      ; 6D41   00C5
        SUBR    R1,     R7                      ; 6D42   010F

        ADDR    R5,     R1                      ; 6D43   00E9
        SUBR    R1,     R5                      ; 6D44   010D
        SUBR    R1,     R5                      ; 6D45   010D
        ADDR    R5,     R5                      ; 6D46   00ED
        SUBR    R1,     R7                      ; 6D47   010F

        ADDR    R0,     R5                      ; 6D48   00C5
        SUBR    R1,     R7                      ; 6D49   010F
        SUBR    R1,     R7                      ; 6D4A   010F

        ADDR    R0,     R5                      ; 6D4B   00C5
        ADDR    R0,     R5                      ; 6D4C   00C5
        SUBR    R1,     R7                      ; 6D4D   010F

        CLRC                                    ; 6D4E   0006
        ADDR    R0,     R5                      ; 6D4F   00C5
        ADDR    R0,     R5                      ; 6D50   00C5
        SUBR    R1,     R7                      ; 6D51   010F
        SUBR    R1,     R7                      ; 6D52   010F

        ADDR    R0,     R5                      ; 6D53   00C5
        ADDR    R4,     R3                      ; 6D54   00E3
        SUBR    R1,     R5                      ; 6D55   010D
        CLRC                                    ; 6D56   0006
        ADDR    R3,     R3                      ; 6D57   00DB
        ADDR    R0,     R5                      ; 6D58   00C5
        SUBR    R1,     R7                      ; 6D59   010F
        SUBR    R1,     R7                      ; 6D5A   010F

        ADDR    R0,     R5                      ; 6D5B   00C5
        ADDR    R0,     R5                      ; 6D5C   00C5
        SUBR    R1,     R7                      ; 6D5D   010F

        CLRC                                    ; 6D5E   0006
        ADDR    R0,     R5                      ; 6D5F   00C5
        ADDR    R0,     R5                      ; 6D60   00C5
        SUBR    R1,     R7                      ; 6D61   010F
        SUBR    R1,     R7                      ; 6D62   010F

        ADDR    R1,     R3                      ; 6D63   00CB
        ADDR    R5,     R7                      ; 6D64   00EF

        SUBR    R1,     R5                      ; 6D65   010D
        CLRC                                    ; 6D66   0006
        ADDR    R6,     R3                      ; 6D67   00F3
        ADDR    R1,     R3                      ; 6D68   00CB
        SUBR    R1,     R7                      ; 6D69   010F
        SUBR    R1,     R7                      ; 6D6A   010F

        ADDR    R0,     R5                      ; 6D6B   00C5
        ADDR    R0,     R5                      ; 6D6C   00C5
        SUBR    R1,     R7                      ; 6D6D   010F

        CLRC                                    ; 6D6E   0006
        ADDR    R0,     R5                      ; 6D6F   00C5
        ADDR    R0,     R5                      ; 6D70   00C5
        SUBR    R1,     R7                      ; 6D71   010F

        ADDR    R4,     R3                      ; 6D72   00E3
        SUBR    R1,     R5                      ; 6D73   010D
        INCR    R6                              ; 6D74   000E
        ADDR    R3,     R3                      ; 6D75   00DB
        SUBR    R1,     R7                      ; 6D76   010F

        ADDR    R0,     R5                      ; 6D77   00C5
        ADDR    R0,     R5                      ; 6D78   00C5
        SUBR    R1,     R7                      ; 6D79   010F

        CLRC                                    ; 6D7A   0006
        ADDR    R0,     R5                      ; 6D7B   00C5
        ADDR    R0,     R5                      ; 6D7C   00C5
        ADDR    R4,     R3                      ; 6D7D   00E3
        SUBR    R1,     R5                      ; 6D7E   010D
        DECR    R2                              ; 6D7F   0012
        ADDR    R3,     R3                      ; 6D80   00DB
        ADDR    R0,     R5                      ; 6D81   00C5
        ADDR    R0,     R5                      ; 6D82   00C5
        SUBR    R1,     R7                      ; 6D83   010F

        CLRC                                    ; 6D84   0006
        SUBR    R1,     R5                      ; 6D85   010D
        COMR    R6                              ; 6D86   001E
        SUBR    R1,     R7                      ; 6D87   010F
        SUBR    R1,     R7                      ; 6D88   010F

        DECLE   $0000                           ; 6D89   0000

        ADDR    R0,     R5                      ; 6D8A   00C5
        ADDR    R2,     R1                      ; 6D8B   00D1
        SUBR    R1,     R7                      ; 6D8C   010F
        SUBR    R1,     R7                      ; 6D8D   010F

        SUBR    R2,     R1                      ; 6D8E   0111
        DECR    R6                              ; 6D8F   0016
        SUBR    R1,     R7                      ; 6D90   010F
        SUBR    R1,     R7                      ; 6D91   010F

        ADDR    R4,     R1                      ; 6D92   00E1
        ADDR    R0,     R5                      ; 6D93   00C5
        ADDR    R0,     R5                      ; 6D94   00C5
        ADDR    R2,     R1                      ; 6D95   00D1
        SUBR    R1,     R7                      ; 6D96   010F
        SUBR    R1,     R7                      ; 6D97   010F

        DECLE   $00C5,  $00F1,  $00F5,  $0111   ; 6D98   00C5 00F1 00F5 0111
        DECLE   $000A,  $00F7                   ; 6D9C   000A 00F7

        ADDR    R7,     R1                      ; 6D9E   00F9
        ADDR    R0,     R5                      ; 6D9F   00C5
        SUBR    R1,     R7                      ; 6DA0   010F
        SUBR    R1,     R7                      ; 6DA1   010F

        ADDR    R4,     R1                      ; 6DA2   00E1
        ADDR    R0,     R5                      ; 6DA3   00C5
        ADDR    R0,     R5                      ; 6DA4   00C5
        ADDR    R2,     R1                      ; 6DA5   00D1
        SUBR    R1,     R7                      ; 6DA6   010F
        SUBR    R1,     R7                      ; 6DA7   010F

        ADDR    R0,     R5                      ; 6DA8   00C5
        ADDR    R2,     R1                      ; 6DA9   00D1
        SUBR    R1,     R7                      ; 6DAA   010F

        ADDR    R1,     R5                      ; 6DAB   00CD
        ADDR    R2,     R5                      ; 6DAC   00D5
        SUBR    R2,     R1                      ; 6DAD   0111
        SUBR    R2,     R1                      ; 6DAE   0111
        ADDR    R7,     R3                      ; 6DAF   00FB
        ADDR    R1,     R5                      ; 6DB0   00CD
        SUBR    R1,     R7                      ; 6DB1   010F

        ADDR    R4,     R1                      ; 6DB2   00E1
        ADDR    R0,     R5                      ; 6DB3   00C5
        SUBR    R1,     R7                      ; 6DB4   010F
        SUBR    R1,     R7                      ; 6DB5   010F

        ADDR    R4,     R1                      ; 6DB6   00E1
        ADDR    R0,     R5                      ; 6DB7   00C5
        ADDR    R0,     R5                      ; 6DB8   00C5
        ADDR    R2,     R1                      ; 6DB9   00D1
        SUBR    R1,     R7                      ; 6DBA   010F
        SUBR    R1,     R7                      ; 6DBB   010F

        ADDR    R0,     R5                      ; 6DBC   00C5
        ADDR    R2,     R1                      ; 6DBD   00D1
        SUBR    R1,     R7                      ; 6DBE   010F

        ADDR    R0,     R5                      ; 6DBF   00C5
        ADDR    R4,     R1                      ; 6DC0   00E1
        ADDR    R2,     R7                      ; 6DC1   00D7

        ADDR    R7,     R5                      ; 6DC2   00FD
        ADDR    R2,     R1                      ; 6DC3   00D1
        ADDR    R0,     R5                      ; 6DC4   00C5
        SUBR    R1,     R7                      ; 6DC5   010F

        ADDR    R4,     R1                      ; 6DC6   00E1
        ADDR    R0,     R5                      ; 6DC7   00C5
        SUBR    R1,     R7                      ; 6DC8   010F
        SUBR    R1,     R7                      ; 6DC9   010F

        ADDR    R4,     R1                      ; 6DCA   00E1
        ADDR    R0,     R5                      ; 6DCB   00C5
        ADDR    R0,     R5                      ; 6DCC   00C5
        ADDR    R2,     R1                      ; 6DCD   00D1
        SUBR    R1,     R7                      ; 6DCE   010F
        SUBR    R1,     R7                      ; 6DCF   010F

        ADDR    R0,     R5                      ; 6DD0   00C5
        ADDR    R2,     R1                      ; 6DD1   00D1
        SUBR    R1,     R7                      ; 6DD2   010F

        DECLE   $00C5,  $00FF                   ; 6DD3   00C5 00FF

        ADDR    R5,     R7                      ; 6DD5   00EF

        ADDR    R6,     R3                      ; 6DD6   00F3
        SUBR    R0,     R1                      ; 6DD7   0101
        ADDR    R0,     R5                      ; 6DD8   00C5
        SUBR    R1,     R7                      ; 6DD9   010F

        ADDR    R4,     R1                      ; 6DDA   00E1
        ADDR    R0,     R5                      ; 6DDB   00C5
        SUBR    R1,     R7                      ; 6DDC   010F
        SUBR    R1,     R7                      ; 6DDD   010F

        ADDR    R4,     R1                      ; 6DDE   00E1
        ADDR    R0,     R5                      ; 6DDF   00C5
        ADDR    R0,     R5                      ; 6DE0   00C5
        ADDR    R2,     R1                      ; 6DE1   00D1
        SUBR    R1,     R7                      ; 6DE2   010F
        SUBR    R1,     R7                      ; 6DE3   010F

        ADDR    R0,     R5                      ; 6DE4   00C5
        ADDR    R2,     R1                      ; 6DE5   00D1
        SUBR    R1,     R7                      ; 6DE6   010F

        ADDR    R1,     R3                      ; 6DE7   00CB
        ADDR    R5,     R7                      ; 6DE8   00EF

        SUBR    R1,     R5                      ; 6DE9   010D
        SUBR    R1,     R5                      ; 6DEA   010D
        ADDR    R6,     R3                      ; 6DEB   00F3
        ADDR    R1,     R3                      ; 6DEC   00CB
        SUBR    R1,     R7                      ; 6DED   010F

        ADDR    R4,     R1                      ; 6DEE   00E1
        ADDR    R0,     R5                      ; 6DEF   00C5
        SUBR    R1,     R7                      ; 6DF0   010F
        SUBR    R1,     R7                      ; 6DF1   010F

        ADDR    R4,     R1                      ; 6DF2   00E1
        ADDR    R0,     R5                      ; 6DF3   00C5
        ADDR    R0,     R5                      ; 6DF4   00C5
        ADDR    R2,     R1                      ; 6DF5   00D1
        SUBR    R1,     R7                      ; 6DF6   010F
        SUBR    R1,     R7                      ; 6DF7   010F

        ADDR    R0,     R5                      ; 6DF8   00C5
        ADDR    R2,     R1                      ; 6DF9   00D1
        ADDR    R4,     R3                      ; 6DFA   00E3
        SUBR    R1,     R5                      ; 6DFB   010D
        INCR    R2                              ; 6DFC   000A
        ADDR    R3,     R3                      ; 6DFD   00DB
        ADDR    R4,     R1                      ; 6DFE   00E1
        ADDR    R0,     R5                      ; 6DFF   00C5
        SUBR    R1,     R7                      ; 6E00   010F
        SUBR    R1,     R7                      ; 6E01   010F

        ADDR    R4,     R1                      ; 6E02   00E1
        ADDR    R0,     R5                      ; 6E03   00C5
        ADDR    R0,     R5                      ; 6E04   00C5
        ADDR    R2,     R1                      ; 6E05   00D1
        SUBR    R1,     R7                      ; 6E06   010F
        SUBR    R1,     R7                      ; 6E07   010F

        ADDR    R0,     R5                      ; 6E08   00C5
        ADDR    R5,     R1                      ; 6E09   00E9
        SUBR    R1,     R5                      ; 6E0A   010D
        INCR    R6                              ; 6E0B   000E
        ADDR    R5,     R5                      ; 6E0C   00ED
        ADDR    R0,     R5                      ; 6E0D   00C5
        SUBR    R1,     R7                      ; 6E0E   010F
        SUBR    R1,     R7                      ; 6E0F   010F

        ADDR    R4,     R1                      ; 6E10   00E1
        ADDR    R0,     R5                      ; 6E11   00C5
        ADDR    R0,     R5                      ; 6E12   00C5
        ADDR    R2,     R1                      ; 6E13   00D1
        SUBR    R1,     R7                      ; 6E14   010F
        SUBR    R1,     R7                      ; 6E15   010F

        SUBR    R1,     R5                      ; 6E16   010D
        DECR    R6                              ; 6E17   0016
        SUBR    R1,     R7                      ; 6E18   010F
        SUBR    R1,     R7                      ; 6E19   010F

        ADDR    R4,     R1                      ; 6E1A   00E1
        ADDR    R0,     R5                      ; 6E1B   00C5
        ADDR    R0,     R5                      ; 6E1C   00C5
        ADDR    R2,     R1                      ; 6E1D   00D1
        SUBR    R1,     R7                      ; 6E1E   010F

        ADDR    R4,     R3                      ; 6E1F   00E3
        SUBR    R1,     R5                      ; 6E20   010D
        DECR    R6                              ; 6E21   0016
        ADDR    R3,     R3                      ; 6E22   00DB
        SUBR    R1,     R7                      ; 6E23   010F

        DECLE   $00E1,  $00C5,  $0000,  $00C5   ; 6E24   00E1 00C5 0000 00C5
        DECLE   $0004                           ; 6E28   0004

        SUBR    R1,     R7                      ; 6E29   010F
        ADDR    R0,     R7                      ; 6E2A   00C7

        SUBR    R2,     R1                      ; 6E2B   0111
        DECR    R2                              ; 6E2C   0012
        ADDR    R1,     R1                      ; 6E2D   00C9
        SUBR    R1,     R7                      ; 6E2E   010F

        ADDR    R0,     R5                      ; 6E2F   00C5
        INCR    R2                              ; 6E30   000A
        SUBR    R1,     R7                      ; 6E31   010F
        SUBR    R1,     R7                      ; 6E32   010F

        ADDR    R1,     R5                      ; 6E33   00CD
        ADDR    R1,     R7                      ; 6E34   00CF

        SUBR    R2,     R1                      ; 6E35   0111
        INCR    R2                              ; 6E36   000A
        ADDR    R2,     R3                      ; 6E37   00D3
        ADDR    R1,     R5                      ; 6E38   00CD
        SUBR    R1,     R7                      ; 6E39   010F
        SUBR    R1,     R7                      ; 6E3A   010F

        ADDR    R0,     R5                      ; 6E3B   00C5
        INCR    R2                              ; 6E3C   000A
        SUBR    R1,     R7                      ; 6E3D   010F
        SUBR    R1,     R7                      ; 6E3E   010F

        ADDR    R0,     R5                      ; 6E3F   00C5
        ADDR    R2,     R1                      ; 6E40   00D1
        SUBR    R0,     R3                      ; 6E41   0103
        ADDR    R1,     R7                      ; 6E42   00CF

        SUBR    R2,     R1                      ; 6E43   0111
        SUBR    R2,     R1                      ; 6E44   0111
        ADDR    R2,     R3                      ; 6E45   00D3
        SUBR    R0,     R5                      ; 6E46   0105
        ADDR    R4,     R1                      ; 6E47   00E1
        ADDR    R0,     R5                      ; 6E48   00C5
        SUBR    R1,     R7                      ; 6E49   010F
        SUBR    R1,     R7                      ; 6E4A   010F

        ADDR    R0,     R5                      ; 6E4B   00C5
        INCR    R2                              ; 6E4C   000A
        SUBR    R1,     R7                      ; 6E4D   010F
        SUBR    R1,     R7                      ; 6E4E   010F

        ADDR    R0,     R5                      ; 6E4F   00C5
        ADDR    R2,     R1                      ; 6E50   00D1
        ADDR    R4,     R1                      ; 6E51   00E1
        ADDR    R2,     R1                      ; 6E52   00D1
        ADDR    R4,     R7                      ; 6E53   00E7
        SUBR    R0,     R7                      ; 6E54   0107

        ADDR    R4,     R1                      ; 6E55   00E1
        ADDR    R2,     R1                      ; 6E56   00D1
        ADDR    R4,     R1                      ; 6E57   00E1
        ADDR    R0,     R5                      ; 6E58   00C5
        SUBR    R1,     R7                      ; 6E59   010F
        SUBR    R1,     R7                      ; 6E5A   010F

        ADDR    R0,     R5                      ; 6E5B   00C5
        INCR    R2                              ; 6E5C   000A
        SUBR    R1,     R7                      ; 6E5D   010F
        SUBR    R1,     R7                      ; 6E5E   010F

        ADDR    R0,     R5                      ; 6E5F   00C5
        ADDR    R2,     R1                      ; 6E60   00D1
        ADDR    R4,     R1                      ; 6E61   00E1
        ADDR    R5,     R3                      ; 6E62   00EB
        SUBR    R1,     R5                      ; 6E63   010D
        SUBR    R1,     R5                      ; 6E64   010D
        ADDR    R5,     R5                      ; 6E65   00ED
        ADDR    R2,     R1                      ; 6E66   00D1
        ADDR    R4,     R1                      ; 6E67   00E1
        ADDR    R0,     R5                      ; 6E68   00C5
        SUBR    R1,     R7                      ; 6E69   010F
        SUBR    R1,     R7                      ; 6E6A   010F

        ADDR    R0,     R5                      ; 6E6B   00C5
        INCR    R2                              ; 6E6C   000A
        SUBR    R1,     R7                      ; 6E6D   010F
        SUBR    R1,     R7                      ; 6E6E   010F

        ADDR    R0,     R5                      ; 6E6F   00C5
        ADDR    R2,     R1                      ; 6E70   00D1
        SUBR    R1,     R1                      ; 6E71   0109
        SUBR    R1,     R5                      ; 6E72   010D
        CLRC                                    ; 6E73   0006
        SUBR    R1,     R3                      ; 6E74   010B
        ADDR    R4,     R1                      ; 6E75   00E1
        ADDR    R0,     R5                      ; 6E76   00C5
        SUBR    R1,     R7                      ; 6E77   010F
        SUBR    R1,     R7                      ; 6E78   010F

        ADDR    R0,     R5                      ; 6E79   00C5
        INCR    R2                              ; 6E7A   000A
        SUBR    R1,     R7                      ; 6E7B   010F
        SUBR    R1,     R7                      ; 6E7C   010F

        ADDR    R0,     R5                      ; 6E7D   00C5
        ADDR    R5,     R3                      ; 6E7E   00EB
        SUBR    R1,     R5                      ; 6E7F   010D
        INCR    R2                              ; 6E80   000A
        ADDR    R5,     R5                      ; 6E81   00ED
        ADDR    R0,     R5                      ; 6E82   00C5
        SUBR    R1,     R7                      ; 6E83   010F
        SUBR    R1,     R7                      ; 6E84   010F

        ADDR    R0,     R5                      ; 6E85   00C5
        INCR    R2                              ; 6E86   000A
        SUBR    R1,     R7                      ; 6E87   010F
        SUBR    R1,     R7                      ; 6E88   010F

        SUBR    R1,     R5                      ; 6E89   010D
        DECR    R2                              ; 6E8A   0012
        SUBR    R1,     R7                      ; 6E8B   010F
        SUBR    R1,     R7                      ; 6E8C   010F

        ADDR    R0,     R5                      ; 6E8D   00C5
        INCR    R2                              ; 6E8E   000A
        SUBR    R1,     R7                      ; 6E8F   010F

        ADDR    R4,     R3                      ; 6E90   00E3
        SUBR    R1,     R5                      ; 6E91   010D
        DECR    R2                              ; 6E92   0012
        ADDR    R3,     R3                      ; 6E93   00DB
        SUBR    R1,     R7                      ; 6E94   010F

        DECLE   $00C5,  $000A,  $00E3,  $010D   ; 6E95   00C5 000A 00E3 010D
        DECLE   $0016,  $00DB,  $00C5,  $0004   ; 6E99   0016 00DB 00C5 0004
        DECLE   $0000,  $0141,  $002A,  $0155   ; 6E9D   0000 0141 002A 0155
        DECLE   $0175,  $0141,  $0016,  $0177   ; 6EA1   0175 0141 0016 0177
        DECLE   $0153,  $0141,  $0006,  $0155   ; 6EA5   0153 0141 0006 0155
        DECLE   $0175,  $0141,  $014D,  $016D   ; 6EA9   0175 0141 014D 016D
        DECLE   $0141,  $000A,  $016F,  $014B   ; 6EAD   0141 000A 016F 014B
        DECLE   $0141,  $0177,  $0153,  $0141   ; 6EB1   0141 0177 0153 0141
        DECLE   $0006,  $0155,  $0175,  $0141   ; 6EB5   0006 0155 0175 0141
        DECLE   $014D,  $016D,  $0141,  $0149   ; 6EB9   014D 016D 0141 0149
        DECLE   $0169,  $016B,  $0147,  $0141   ; 6EBD   0169 016B 0147 0141
        DECLE   $016F,  $014B,  $0141,  $0177   ; 6EC1   016F 014B 0141 0177
        DECLE   $0153,  $0141,  $0006,  $0155   ; 6EC5   0153 0141 0006 0155
        DECLE   $0175,  $0141,  $014D,  $016D   ; 6EC9   0175 0141 014D 016D
        DECLE   $0141,  $0139,  $0135,  $0137   ; 6ECD   0141 0139 0135 0137
        DECLE   $013B,  $0141,  $016F,  $014B   ; 6ED1   013B 0141 016F 014B
        DECLE   $0141,  $0177,  $0153,  $0141   ; 6ED5   0141 0177 0153 0141
        DECLE   $0006,  $0155,  $0175,  $0141   ; 6ED9   0006 0155 0175 0141
        DECLE   $0004                           ; 6EDD   0004

        SUBR    R5,     R5                      ; 6EDE   012D
        CMPR    R0,     R1                      ; 6EDF   0141
        CLRC                                    ; 6EE0   0006
        SUBR    R5,     R7                      ; 6EE1   012F

        DECLE   $0141,  $0004                   ; 6EE2   0141 0004

        CMPR    R6,     R7                      ; 6EE4   0177
        CMPR    R2,     R3                      ; 6EE5   0153
        CMPR    R0,     R1                      ; 6EE6   0141
        CLRC                                    ; 6EE7   0006
        CMPR    R2,     R5                      ; 6EE8   0155
        CMPR    R6,     R5                      ; 6EE9   0175
        CMPR    R0,     R1                      ; 6EEA   0141
        DECR    R6                              ; 6EEB   0016
        CMPR    R6,     R7                      ; 6EEC   0177
        CMPR    R2,     R3                      ; 6EED   0153
        CMPR    R0,     R1                      ; 6EEE   0141
        GSWD    R0                              ; 6EEF   0030
        SUBR    R3,     R5                      ; 6EF0   011D
        SUBR    R4,     R1                      ; 6EF1   0121
        CMPR    R0,     R3                      ; 6EF2   0143
        CMPR    R0,     R1                      ; 6EF3   0141
        INCR    R6                              ; 6EF4   000E
        CMPR    R0,     R5                      ; 6EF5   0145
        SUBR    R4,     R3                      ; 6EF6   0123
        SUBR    R3,     R7                      ; 6EF7   011F

        DECLE   $0141,  $002C,  $0000,  $0141   ; 6EF8   0141 002C 0000 0141
        DECLE   $0163,  $0185,  $0141,  $001A   ; 6EFC   0163 0185 0141 001A
        DECLE   $017D,  $0167,  $0141,  $0141   ; 6F00   017D 0167 0141 0141
        DECLE   $0155,  $0175,  $0141,  $0163   ; 6F04   0155 0175 0141 0163
        DECLE   $017F,  $0141,  $000E,  $0189   ; 6F08   017F 0141 000E 0189
        DECLE   $0167,  $0141,  $0177,  $0153   ; 6F0C   0167 0141 0177 0153
        DECLE   $0141,  $0141,  $0155,  $0175   ; 6F10   0141 0141 0155 0175
        DECLE   $0141,  $0155,  $016D,  $0141   ; 6F14   0141 0155 016D 0141
        DECLE   $000E,  $016F,  $0153,  $0141   ; 6F18   000E 016F 0153 0141
        DECLE   $0177,  $0153,  $0141,  $0141   ; 6F1C   0177 0153 0141 0141
        DECLE   $0155,  $0175,  $0141,  $0155   ; 6F20   0155 0175 0141 0155
        DECLE   $016D,  $0141,  $014D,  $016D   ; 6F24   016D 0141 014D 016D
        DECLE   $0141,  $0141,  $016F,  $014B   ; 6F28   0141 0141 016F 014B
        DECLE   $0141,  $016F,  $0153,  $0141   ; 6F2C   0141 016F 0153 0141
        DECLE   $0177,  $0153,  $0141,  $0141   ; 6F30   0177 0153 0141 0141
        DECLE   $0155,  $0175,  $0141,  $0155   ; 6F34   0155 0175 0141 0155
        DECLE   $016D,  $0141,  $0141,  $0131   ; 6F38   016D 0141 0141 0131
        DECLE   $0141,  $0141,  $0133,  $0141   ; 6F3C   0141 0141 0133 0141
        DECLE   $0141,  $016F,  $0153,  $0141   ; 6F40   0141 016F 0153 0141
        DECLE   $0177,  $0153,  $0141,  $0141   ; 6F44   0177 0153 0141 0141
        DECLE   $0155,  $0175,  $0141,  $0157   ; 6F48   0155 0175 0141 0157
        DECLE   $0171,  $0141,  $0141,  $0135   ; 6F4C   0171 0141 0141 0135
        DECLE   $0141,  $0141,  $0137,  $0141   ; 6F50   0141 0141 0137 0141
        DECLE   $0141,  $0173,  $0159,  $0141   ; 6F54   0141 0173 0159 0141
        DECLE   $0177,  $0153,  $0141,  $0141   ; 6F58   0177 0153 0141 0141
        DECLE   $0155,  $0175,  $0141,  $0004   ; 6F5C   0155 0175 0141 0004
        DECLE   $0127,  $0129,  $0141,  $0006   ; 6F60   0127 0129 0141 0006
        DECLE   $012B,  $0125,  $0141,  $0004   ; 6F64   012B 0125 0141 0004

        CMPR    R6,     R7                      ; 6F68   0177
        CMPR    R2,     R3                      ; 6F69   0153
        CMPR    R0,     R1                      ; 6F6A   0141
        CMPR    R0,     R1                      ; 6F6B   0141
        CMPR    R2,     R7                      ; 6F6C   0157
        CMPR    R7,     R3                      ; 6F6D   017B
        CMPR    R0,     R1                      ; 6F6E   0141
        COMR    R2                              ; 6F6F   001A
        CMPR    R7,     R1                      ; 6F70   0179
        CMPR    R3,     R1                      ; 6F71   0159
        CMPR    R0,     R1                      ; 6F72   0141
        ADCR    R4                              ; 6F73   002C
        SUBR    R2,     R5                      ; 6F74   0115
        SUBR    R3,     R1                      ; 6F75   0119
        CMPR    R0,     R3                      ; 6F76   0143
        CMPR    R0,     R1                      ; 6F77   0141
        DECR    R2                              ; 6F78   0012
        CMPR    R0,     R5                      ; 6F79   0145
        SUBR    R3,     R3                      ; 6F7A   011B
        SUBR    R2,     R7                      ; 6F7B   0117

        DECLE   $0141,  $0141,  $0000,  $015B   ; 6F7C   0141 0141 0000 015B
        DECLE   $0175,  $0141,  $001E,  $0177   ; 6F80   0175 0141 001E 0177
        DECLE   $015D,  $015B,  $0175,  $0141   ; 6F84   015D 015B 0175 0141
        DECLE   $015F,  $0169,  $0141,  $0012   ; 6F88   015F 0169 0141 0012
        DECLE   $016B,  $0161,  $0141,  $0177   ; 6F8C   016B 0161 0141 0177
        DECLE   $015D,  $015B,  $0175,  $0141   ; 6F90   015D 015B 0175 0141
        DECLE   $0155,  $016D,  $0141,  $0149   ; 6F94   0155 016D 0141 0149
        DECLE   $0169,  $0141,  $0006,  $016B   ; 6F98   0169 0141 0006 016B
        DECLE   $0147,  $0141,  $016F,  $0153   ; 6F9C   0147 0141 016F 0153
        DECLE   $0141,  $0177,  $015D,  $015B   ; 6FA0   0141 0177 015D 015B
        DECLE   $0175,  $0141,  $0155,  $016D   ; 6FA4   0175 0141 0155 016D
        DECLE   $0141,  $014D,  $016D,  $0141   ; 6FA8   0141 014D 016D 0141
        DECLE   $0006,  $016F,  $014B,  $0141   ; 6FAC   0006 016F 014B 0141
        DECLE   $016F,  $0153,  $0141,  $0177   ; 6FB0   016F 0153 0141 0177
        DECLE   $015D,  $015B,  $0175,  $0141   ; 6FB4   015D 015B 0175 0141
        DECLE   $0155,  $016D,  $0141,  $0151   ; 6FB8   0155 016D 0141 0151
        DECLE   $0171,  $013D,  $0141,  $0141   ; 6FBC   0171 013D 0141 0141
        DECLE   $013F,  $0173,  $014F,  $0141   ; 6FC0   013F 0173 014F 0141
        DECLE   $016F,  $0153,  $0141,  $0177   ; 6FC4   016F 0153 0141 0177
        DECLE   $015D,  $015B,  $0175,  $0141   ; 6FC8   015D 015B 0175 0141
        DECLE   $0155,  $016D,  $0141,  $0141   ; 6FCC   0155 016D 0141 0141
        DECLE   $0131,  $0141,  $0006,  $0133   ; 6FD0   0131 0141 0006 0133
        DECLE   $0141,  $0141,  $016F,  $0153   ; 6FD4   0141 0141 016F 0153
        DECLE   $0141,  $0177,  $015D,  $015B   ; 6FD8   0141 0177 015D 015B
        DECLE   $0175,  $0141,  $001E,  $0177   ; 6FDC   0175 0141 001E 0177
        DECLE   $015D,  $015B,  $0175,  $0141   ; 6FE0   015D 015B 0175 0141
        DECLE   $0004,  $0127,  $0129,  $0141   ; 6FE4   0004 0127 0129 0141
        DECLE   $000A,  $012B,  $0125,  $0141   ; 6FE8   000A 012B 0125 0141
        DECLE   $0004,  $0177,  $015D,  $015B   ; 6FEC   0004 0177 015D 015B
        DECLE   $0175,  $0141,  $001E,  $0177   ; 6FF0   0175 0141 001E 0177
        DECLE   $015D,  $0141,  $0141,  $01DB   ; 6FF4   015D 0141 0141 01DB
        DECLE   $01DF                           ; 6FF8   01DF

        CMPR    R0,     R1                      ; 6FF9   0141
        DECR    R6                              ; 6FFA   0016
        XORR    R4,     R1                      ; 6FFB   01E1
        XORR    R3,     R5                      ; 6FFC   01DD
        CMPR    R0,     R1                      ; 6FFD   0141
        CMPR    R0,     R1                      ; 6FFE   0141
        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $501C       <entry>
;;  $505C       $5057  
;;  $509F       $50AC  
;;  $50C6       $50BD   $50D7  
;;  $50EC       $5689  
;;  $50ED       $5068   $50EB   $5654  
;;  $50F9       <entry>
;;  $5114       $5103  
;;  $512F       $5121  
;;  $5130       $512E  
;;  $5137       $513D  
;;  $5143       $5231  
;;  $514F       $5147  
;;  $5165       $5165  
;;  $516D       $515A   $5171  
;;  $517A       $5176   $5203   $5206   $520C  
;;  $51A1       $5183  
;;  $51AD       $514D  
;;  $51B2       $5213  
;;  $51B3       $51B1  
;;  $51C1       $519B   $519F   $51BB  
;;  $51C3       $596E  
;;  $51CE       $51C5   $530E  
;;  $51CF       $51CD  
;;  $51E6       $516E  
;;  $5202       $51FF  
;;  $520E       $5209  
;;  $522C       $50FF   $511F   $5152   $517E   $5188   $518C   $5221   $524D  
;;  $522C       $5253  
;;  $522D       <entry>
;;  $523A       $5356  
;;  $523B       $5239  
;;  $5248       $523D   $5242   $535F  
;;  $5249       $5247  
;;  $5267       $525E  
;;  $5268       $53E3  
;;  $5276       $53AF   $5798  
;;  $52A8       $5296   $529B   $52A0   $52A5   $57F8  
;;  $52A9       $585F  
;;  $52C4       $52A9  
;;  $52D9       $52D6  
;;  $52DE       $52EB   $5306  
;;  $52E9       $52E1   $52E6  
;;  $52EB       $528B  
;;  $52FD       $52EE  
;;  $5306       $5291  
;;  $5320       $5311  
;;  $533A       $526E   $5274   $53CF  
;;  $5348       $5367   $5394  
;;  $5350       $5237  
;;  $5359       $5354  
;;  $5362       $535B  
;;  $5378       $536F  
;;  $5392       $539A  
;;  $53CE       $53C8  
;;  $53CF       $53CD  
;;  $53D1       $53BA  
;;  $53DE       $53D3  
;;  $53E5       $5276  
;;  $5498       $53E9  
;;  $54B3       $54AC  
;;  $54B5       $54AF   $54D7  
;;  $54B8       $54A7  
;;  $54C6       $54BF  
;;  $54C8       $54C2   $54D9  
;;  $54CF       $54BA  
;;  $54D6       $54D0  
;;  $54DB       $502F   $50F1   $56A0  
;;  $54E0       $54E9  
;;  $5569       $5569  
;;  $5577       $5279  
;;  $5578       $527E  
;;  $557D       <entry>
;;  $5594       $5644   $5A16  
;;  $5595       $5593  
;;  $55A2       $559E  
;;  $55A7       $5582   $5589   $5590  
;;  $55D7       $55FE  
;;  $55D8       $55D6  
;;  $55E2       $55C5  
;;  $55F4       $511C   $5614  
;;  $5601       $55FC  
;;  $5602       $5A1C  
;;  $5603       $5601  
;;  $5612       $55AC   $55B2   $55B8   $55C8   $55CC   $55E3   $55E6   $5617  
;;  $5612       $564A  
;;  $5613       <entry>
;;  $562D       $5629  
;;  $5654       $5631   $567A  
;;  $5657       $561D   $58BF  
;;  $5676       $5671  
;;  $5689       $5680  
;;  $568E       $568C  
;;  $5699       $5694  
;;  $569A       $5673  
;;  $569B       $5699  
;;  $56B0       $56A3  
;;  $56B3       <entry>
;;  $56CB       $56D2   $56D9   $56E1  
;;  $56CC       $56BD  
;;  $56E9       $56B8   $56CE  
;;  $56F9       $56EE  
;;  $5708       $5705  
;;  $5709       $5702  
;;  $5711       $570D  
;;  $572F       $571C   $5722   $5729  
;;  $5732       $573D  
;;  $573F       $5713  
;;  $5740       $56E7   $5736  
;;  $5752       $574D  
;;  $5769       $575C  
;;  $5775       $576E  
;;  $577D       $577D  
;;  $5785       $577A  
;;  $5792       $5767   $578E  
;;  $579B       $5748   $574F   $57A0   $57AD  
;;  $57AF       $57A9  
;;  $57B0       $5696   $57C7  
;;  $57BD       $522E  
;;  $57CA       $57C5  
;;  $57CC       $57C1  
;;  $57D5       $57CA  
;;  $57D6       $5A19  
;;  $57D7       $57D5  
;;  $57E3       $57DF  
;;  $57E6       $5085   $5858   $5937  
;;  $57F8       $57F0   $57F5  
;;  $57FB       $57D2  
;;  $5822       $580F  
;;  $582F       $5827  
;;  $5831       $582A  
;;  $5837       $5824  
;;  $5839       $5835  
;;  $5840       $58AB  
;;  $5841       $583F  
;;  $585D       $57BB  
;;  $5862       $5806   $582D   $587F   $5889   $588E   $5895   $589A   $58B1  
;;  $5862       $58B6   $58BD  
;;  $5863       $57CF  
;;  $587A       $586F   $5874  
;;  $587B       $5879  
;;  $58C2       $58A2  
;;  $58CF       $51A4  
;;  $58D0       $582F   $58CE  
;;  $58E3       $57CC  
;;  $58F1       $58EC  
;;  $58F9       $58EF   $58F3  
;;  $58FC       $58F7  
;;  $5904       $590D   $5917   $5924   $592A  
;;  $5906       $58FF  
;;  $590F       $5907  
;;  $5921       $5912  
;;  $5932       $591F  
;;  $593A       $5904  
;;  $5942       $593F  
;;  $5953       $57E7  
;;  $5962       $595D  
;;  $5963       $5961  
;;  $5971       $5954   $5A1F  
;;  $5995       $5972  
;;  $59A5       $59A2  
;;  $59A9       $59A6  
;;  $59EE       $50DD   $5A84  
;;  $59F1       $5AD1  
;;  $59F2       $59F0  
;;  $5A13       $59FD  
;;  $5A24       $55D3   $5639   $5A5E  
;;  $5A25       $5A23  
;;  $5A29       $5A36  
;;  $5A38       $5A2D  
;;  $5A41       $5A4A  
;;  $5A4D       $5599   $5607   $57D9   $5A3A   $5B57  
;;  $5A53       <entry>
;;  $5A5C       $5A59  
;;  $5A8C       $5A82  
;;  $5A8E       $5A98  
;;  $5A9A       $5A95  
;;  $5AC8       $5AC2  
;;  $5AD0       $5ABD  
;;  $5ADC       $5A73   $5A7C  
;;  $5ADF       $5082  
;;  $5AE0       $5AC6   $5ACA   $5ACE   $5ADA   $5ADE  
;;  $5AF0       $5AE8  
;;  $5AF2       $5AEC  
;;  $5AF7       $5B03  
;;  $5AFD       $5AF5   $5B09  
;;  $5B05       $5B07  
;;  $5B06       $5984  
;;  $5B0B       $5B00   $5B53  
;;  $5B0E       <entry>
;;  $5B0F       $598D  
;;  $5B4F       $5A13  
;;  $5B50       $5B20  
;;  $5B51       $5B62  
;;  $5B5E       $5B60  
;;  $5B72       $5B87  
;;  $5B7D       $5B77  
;;  $5B82       $5B85  
;;  $5B89       $5B7B  
;;  $5B96       $507B   $5AB6  
;;  $5BA6       $5BA9  
;;  $5BBF       $5216   $5380   $53D5   $56C2   $56D4   $56E9   $5724   $5775  
;;  $5BBF       $579B   $58C2  
;;  $5BCA       $5BC7  
;;  $5BCE       $5BCB  
;;  $5BD2       $5BCF  
;;  $5BDA       $584E  
;;  $5BEC       $512B  
;;  $5BED       $5BEB  
;;  $5BF2       $5389  
;;  $5C06       $50E0  
;;  $5C07       $5128   $59AE  
;;  $5C0C       $5BF0   $5C5A  
;;  $5C47       $5C0C  
;;  $5C54       $53C3  
;;  $5C5C       $5921   $5BED   $5C07  
;;  $5C64       $5C0A   $5C60  
;;  $5DBC       $5DBA  
;;  $5EC7       $5EC5  
;;  $5EE7       $5EE5  
;;  $5EF7       $5EF5  
;;  $5F99       $5F97  
;;  $5F9A       $5F98  
;;  $5F9B       $5F99  
;;  $5F9C       $5F9A  
;;  $5FA0       $5F9E  
;;  $5FA1       $5F9F  
;;  $5FA2       $5FA0  
;;  $5FA3       $5FA1  
;;  $605C       $605A  
;;  $607D       $607B  
;;  $60A0       $609E  
;;  $60C7       $60C5  
;;  $60EC       $60EA  
;;  $60FD       $60FB  
;;  $60FF       $60FD  
;;  $6114       $6112  
;;  $6115       $6113  
;;  $6116       $6114  
;;  $6117       $6115  
;;  $6129       $6127  
;;  $612B       $6129  
;;  $612D       $612B  
;;  $612F       $612D  
;;  $6138       $6136  
;;  $6139       $6137  
;;  $613A       $6138  
;;  $613B       $6139  
;;  $613C       $613A  
;;  $613D       $613B  
;;  $62F3       $62F1  
;;  $62FB       $62F9  
;;  $6308       $6306  
;;  $63A0       $639E  
;;  $63A1       $639F  
;;  $63A2       $63A0  
;;  $63A3       $63A1  
;;  $63A4       $63A2  
;;  $63A5       $63A3  
;;  $63A6       $63A4  
;;  $63A7       $63A5  
;;  $65B1       $65AF   $65B1  
;;  $65F2       $65F0  
;;  $65F4       $65F2  
;;  $6602       $6600  
;;  $6604       $6602  
;;  $6606       $6604  
;;  $6608       $6606  
;;  $666F       $666D   $666F  
;;  $66AF       $66AD   $66AF  
;;  $66C8       $66C8  
;;  $66C9       $66C7  
;;  $66CC       $66CC  
;;  $66CD       $66CB  
;;  $6744       $6742  
;;  $6749       $6749  
;;  $685A       $685A  
;;  $685B       $6859  
;;  $685E       $685E  
;;  $685F       $685D  
;;  $68EE       $68EC  
;;  $68F3       $68F3  
;; ======================================================================== ;;
