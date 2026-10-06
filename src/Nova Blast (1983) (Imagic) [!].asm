
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  End of timer table

        BIDECLE $5000           ; 5002  Ptr: EXEC timer table
        BIDECLE $501F           ; 5004  Ptr: Start of game
        BIDECLE $500F           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5017           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
.GFX_LIST_500F:
        DECLE   $007E,  $00C3   ; 500F  Color Stack init (0, 1)
        DECLE   $009D,  $00A1   ; 5011  Color Stack init (2, 3)
        DECLE   $00A1           ; 5013  Border color init

        DECLE   $009D,  $00C3,  $007E           ; 5014   009D 00C3 007E
.TITLE:
        DECLE   $0052                           ; 5017  Cartridge year
        STRING  "IMAGIC"                        ; 5018  Title string
        DECLE   $0000                           ; 501E  

.TITLECODE:
        SDBD                                    ; 501F   0001
        MVII    #$5054, R1                      ; 5020   02B9 0054 0050

        JSR     R5,     L_6D68                  ; 5023   0004 016C 0168

        MVII    #$02F0, R6                      ; 5026   02BE 02F0
        MVII    #$00F0, R0                      ; 5028   02B8 00F0
        MVII    #$0200, R4                      ; 502A   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 502C   0004 0114 0338

        MVII    #$0318, R4                      ; 502F   02BC 0318
        MVII    #$0047, R0                      ; 5031   02B8 0047

        JSR     R5,     X_FILL_ZERO             ; 5033   0004 0114 0338

        MVII    #$0102, R4                      ; 5036   02BC 0102
        MVII    #$00ED, R0                      ; 5038   02B8 00ED

        JSR     R5,     X_FILL_ZERO             ; 503A   0004 0114 0338

        SDBD                                    ; 503D   0001
        MVII    #$6B9A, R0                      ; 503E   02B8 009A 006B
        MVO     R0,     G_035D                  ; 5041   0240 035D
        SDBD                                    ; 5043   0001
        MVII    #$FFFF, R0                      ; 5044   02B8 00FF 00FF
        MVO     R0,     G_0106                  ; 5047   0240 0106
        MVO     R0,     G_035E                  ; 5049   0240 035E
        EIS                                     ; 504B   0002
L_504C:
        MVI     G_0106, R0                      ; 504C   0280 0106
        TSTR    R0                              ; 504E   0080
        BNEQ    L_504C                          ; 504F   022C 0004
        J       L_509D                          ; 5051   0004 0350 009D

        PSHR    R5                              ; 5054   0275
        DIS                                     ; 5055   0003
        CLRR    R0                              ; 5056   01C0
        MVO     R0,     G_0106                  ; 5057   0240 0106
        MVO     R0,     .STIC.HDLY              ; 5059   0240 0030
        MVO     R0,     .STIC.VDLY              ; 505B   0240 0031
        MVO     R0,     .STIC.BORD              ; 505D   0240 002C
        MVO     R0,     .STIC.EDGE              ; 505F   0240 0032
        MVI     .STIC.MODE,R0                   ; 5061   0280 0021
        SDBD                                    ; 5063   0001
        MVII    #$6EF2, R4                      ; 5064   02BC 00F2 006E
        MVII    #$0028, R1                      ; 5067   02B9 0028
        MVII    #$0004, R0                      ; 5069   02B8 0004

        JSR     R5,     .EXEC.730               ; 506B   0004 0114 0330

        MVII    #$0200, R0                      ; 506E   02B8 0200
        SDBD                                    ; 5070   0001
        MVII    #$3800, R4                      ; 5071   02BC 0000 0038

        JSR     R5,     X_FILL_ZERO             ; 5074   0004 0114 0338
        JSR     R5,     L_5082                  ; 5077   0004 0150 0082

        SDBD                                    ; 507A   0001
        MVII    #$58FE, R1                      ; 507B   02B9 00FE 0058

        JSR     R5,     L_6D68                  ; 507E   0004 016C 0168

L_5081:
        PULR    R7                              ; 5081   02B7

L_5082:
        PSHR    R5                              ; 5082   0275
        SDBD                                    ; 5083   0001
        MVII    #$6EF6, R4                      ; 5084   02BC 00F6 006E
L_5087:
        MVI@    R4,     R0                      ; 5087   02A0
        TSTR    R0                              ; 5088   0080
        BEQ     L_5081                          ; 5089   0224 0009

        SLL     R0,     2                       ; 508B   004C
        SLL     R0,     1                       ; 508C   0048
        DECR    R0                              ; 508D   0010
        MVI@    R4,     R1                      ; 508E   02A1
        SLL     R1,     2                       ; 508F   004D
        SLL     R1,     1                       ; 5090   0049
        SDBD                                    ; 5091   0001
        ADDI    #$3800, R1                      ; 5092   02F9 0000 0038
L_5095:
        MVI@    R4,     R2                      ; 5095   02A2
        MVO@    R2,     R1                      ; 5096   024A
        INCR    R1                              ; 5097   0009
        DECR    R0                              ; 5098   0010
        BPL     L_5095                          ; 5099   0223 0005
        B       L_5087                          ; 509B   0220 0015

L_509D:
        MVI     .PSG0.rgt_hand,R1               ; 509D   0281 01FE
        ADD     .PSG0.lft_hand,R1               ; 509F   02C1 01FF
        CMPI    #$00FC, R1                      ; 50A1   0379 00FC
        BNEQ    L_50EC                          ; 50A3   020C 0047

        SDBD                                    ; 50A5   0001
        MVII    #$6DD5, R1                      ; 50A6   02B9 00D5 006D

        JSR     R5,     L_6D68                  ; 50A9   0004 016C 0168

        EIS                                     ; 50AC   0002
        MVII    #$0006, R3                      ; 50AD   02BB 0006
        MVII    #$023C, R4                      ; 50AF   02BC 023C

        JSR     R5,     X_PRINT_R5              ; 50B1   0004 0118 007B
        STRING  "W. BROWN ENGINEERING"          ; 50B4  
        DECLE   $0000                           ; 50C8   0000

        MVII    #$0006, R3                      ; 50C9   02BB 0006
        MVII    #$026B, R4                      ; 50CB   02BC 026B

        JSR     R5,     X_PRINT_R5              ; 50CD   0004 0118 007B
        STRING  "PRESENTS"                      ; 50D0  
        DECLE   $0000                           ; 50D8   0000

        MVII    #$0002, R3                      ; 50D9   02BB 0002
        MVII    #$0292, R4                      ; 50DB   02BC 0292

        JSR     R5,     X_PRINT_R5              ; 50DD   0004 0118 007B
        STRING  "HYPERBEAM"                     ; 50E0  
        DECLE   $0000                           ; 50E9   0000
L_50EA:
        B       L_50EA                          ; 50EA   0220 0001

L_50EC:
        JSR     R5,     L_6DE3                  ; 50EC   0004 016C 01E3

        EIS                                     ; 50EF   0002
        B       L_514E                          ; 50F0   0200 005C

L_50F2:
        MVI     G_0131, R1                      ; 50F2   0281 0131
        TSTR    R1                              ; 50F4   0089
        BEQ     L_510A                          ; 50F5   0204 0013

        MVII    #$0002, R3                      ; 50F7   02BB 0002
        MVII    #$0255, R4                      ; 50F9   02BC 0255

        JSR     R5,     X_PRINT_R5              ; 50FB   0004 0118 007B
        STRING  "GAME OVER"                     ; 50FE  
        DECLE   $0000                           ; 5107   0000

        B       L_5144                          ; 5108   0200 003A

L_510A:
        MVI     G_0132, R0                      ; 510A   0280 0132
        TSTR    R0                              ; 510C   0080
        BNEQ    L_5144                          ; 510D   020C 0035

        MVII    #$0001, R3                      ; 510F   02BB 0001
        MVII    #$0241, R4                      ; 5111   02BC 0241

        JSR     R5,     X_PRINT_R5              ; 5113   0004 0118 007B
        STRING  "NOVA BLAST"                    ; 5116  
        DECLE   $0000                           ; 5120   0000

        MVII    #$0279, R4                      ; 5121   02BC 0279
        MVII    #$0006, R3                      ; 5123   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 5125   0004 0118 007B
        STRING  "By Imagic"                     ; 5128  
        DECLE   $0000                           ; 5131   0000

        MVII    #$0284, R4                      ; 5132   02BC 0284
        SDBD                                    ; 5134   0001
        MVII    #$0806, R3                      ; 5135   02BB 0006 0008
        MVO@    R3,     R4                      ; 5138   0263
        MVII    #$0006, R3                      ; 5139   02BB 0006

        JSR     R5,     X_PRINT_R5              ; 513B   0004 0118 007B
        STRING  " 1983"                         ; 513E  
        DECLE   $0000                           ; 5143   0000
L_5144:
        MVII    #$012C, R5                      ; 5144   02BD 012C
L_5146:
        DECR    R5                              ; 5146   0015
        BPL     L_5146                          ; 5147   0223 0002

        MVII    #$000A, R0                      ; 5149   02B8 000A

        JSR     R5,     X_RAND2                 ; 514B   0004 0114 029E
L_514E:
        JSR     R5,     L_5184                  ; 514E   0004 0150 0184

        MVI     G_0131, R1                      ; 5151   0281 0131
        CMPI    #$0001, R1                      ; 5153   0379 0001
        BNEQ    L_50F2                          ; 5155   022C 0064

        JSR     R5,     L_5226                  ; 5157   0004 0150 0226
        JSR     R5,     L_56C2                  ; 515A   0004 0154 02C2
        JSR     R5,     L_574F                  ; 515D   0004 0154 034F
        JSR     R5,     L_6082                  ; 5160   0004 0160 0082
        JSR     R5,     L_5184                  ; 5163   0004 0150 0184
        JSR     R5,     L_51F2                  ; 5166   0004 0150 01F2

        MVI     G_012F, R0                      ; 5169   0280 012F
        CMPI    #$0005, R0                      ; 516B   0378 0005
        BNC     L_514E                          ; 516D   0229 0020

        MVII    #$0002, R0                      ; 516F   02B8 0002
        MVO     R0,     G_012F                  ; 5171   0240 012F

        JSR     R5,     L_6954                  ; 5173   0004 0168 0154
        JSR     R5,     L_69C6                  ; 5176   0004 0168 01C6
        JSR     R5,     L_69C6                  ; 5179   0004 0168 01C6
        JSR     R5,     L_518F                  ; 517C   0004 0150 018F
        JSR     R5,     L_562B                  ; 517F   0004 0154 022B

        B       L_514E                          ; 5182   0220 0035

L_5184:
        PSHR    R5                              ; 5184   0275

        JSR     R5,     .EXEC.4F1               ; 5185   0004 0114 00F1
        JSR     R5,     L_5840                  ; 5188   0004 0158 0040
        JSR     R5,     L_57DC                  ; 518B   0004 0154 03DC

        PULR    R7                              ; 518E   02B7

L_518F:
        PSHR    R5                              ; 518F   0275
        MVI     G_015F, R0                      ; 5190   0280 015F
        MVII    #$0002, R1                      ; 5192   02B9 0002
        MVII    #$0002, R3                      ; 5194   02BB 0002
        MVII    #$02DD, R4                      ; 5196   02BC 02DD

        JSR     R5,     X_PRNUM_RGT             ; 5198   0004 0118 00C5

        MVII    #$02E9, R4                      ; 519B   02BC 02E9
        MVII    #$0004, R1                      ; 519D   02B9 0004
        MVII    #$0002, R2                      ; 519F   02BA 0002
        MVI     G_034F, R0                      ; 51A1   0280 034F
        TSTR    R0                              ; 51A3   0080
        BNEQ    L_51B2                          ; 51A4   020C 000C

        CLRR    R0                              ; 51A6   01C0
        MVO@    R0,     R4                      ; 51A7   0260
        MVO@    R0,     R4                      ; 51A8   0260
        MVO@    R0,     R4                      ; 51A9   0260
        MVO@    R0,     R4                      ; 51AA   0260
        MVII    #$0003, R1                      ; 51AB   02B9 0003
        MVI     G_034E, R0                      ; 51AD   0280 034E
        J       .EXEC.8C9                       ; 51AF   0004 0318 00C9

L_51B2:
        JSR     R5,     X_PRNUM_RGT             ; 51B2   0004 0118 00C5

        ADDI    #$0004, R4                      ; 51B5   02FC 0004
        MVI     G_034E, R0                      ; 51B7   0280 034E
        MVII    #$0082, R2                      ; 51B9   02BA 0082
        MVII    #$0003, R1                      ; 51BB   02B9 0003
        J       .EXEC.8CA                       ; 51BD   0004 0318 00CA

        DECLE   $0000,  $0080,  $00C0,  $00E0   ; 51C0   0000 0080 00C0 00E0
        DECLE   $00F0,  $00F8,  $00FC,  $00FE   ; 51C4   00F0 00F8 00FC 00FE
        DECLE   $0080,  $0040,  $0020,  $0010   ; 51C8   0080 0040 0020 0010
        DECLE   $0008,  $0004,  $0002,  $0001   ; 51CC   0008 0004 0002 0001
L_51D0:
        MVII    #$03E8, R1                      ; 51D0   02B9 03E8
L_51D2:
        PSHR    R5                              ; 51D2   0275
        PSHR    R2                              ; 51D3   0272
        PSHR    R3                              ; 51D4   0273
        MVI     G_034E, R2                      ; 51D5   0282 034E
        ADDR    R1,     R2                      ; 51D7   00CA
        CMPI    #$03E8, R2                      ; 51D8   037A 03E8
        BNC     L_51ED                          ; 51DA   0209 0011

        SUBI    #$03E8, R2                      ; 51DC   033A 03E8
        MVI     G_034F, R3                      ; 51DE   0283 034F
        INCR    R3                              ; 51E0   000B
        SDBD                                    ; 51E1   0001
        CMPI    #$2710, R3                      ; 51E2   037B 0010 0027
        BNC     L_51EB                          ; 51E5   0209 0004

        SDBD                                    ; 51E7   0001
        SUBI    #$2710, R3                      ; 51E8   033B 0010 0027
L_51EB:
        MVO     R3,     G_034F                  ; 51EB   0243 034F
L_51ED:
        MVO     R2,     G_034E                  ; 51ED   0242 034E
        PULR    R3                              ; 51EF   02B3
        PULR    R2                              ; 51F0   02B2
        PULR    R7                              ; 51F1   02B7

L_51F2:
        PSHR    R5                              ; 51F2   0275
        MVI     G_0162, R4                      ; 51F3   0284 0162
        ADDI    #$0200, R4                      ; 51F5   02FC 0200
        MVII    #$0004, R2                      ; 51F7   02BA 0004
L_51F9:
        MVI@    R4,     R1                      ; 51F9   02A1
        MOVR    R1,     R0                      ; 51FA   0088
        BEQ     L_5217                          ; 51FB   0204 001A

        SLR     R0,     2                       ; 51FD   0064
        SLR     R0,     1                       ; 51FE   0060
        ANDI    #$00FF, R0                      ; 51FF   03B8 00FF
        SDBD                                    ; 5201   0001
        CMPI    #$000C, R0                      ; 5202   0378 000C 0000
        BEQ     L_5217                          ; 5205   0204 0010

        SDBD                                    ; 5207   0001
        SUBI    #$0024, R0                      ; 5208   0338 0024 0000
        BMI     L_5211                          ; 520B   020B 0004

        CMPI    #$000C, R0                      ; 520D   0378 000C
        BNC     L_5217                          ; 520F   0209 0006

L_5211:
        DECR    R4                              ; 5211   0014
        SDBD                                    ; 5212   0001
        ANDI    #$2000, R1                      ; 5213   03B9 0000 0020
        MVO@    R1,     R4                      ; 5216   0261
L_5217:
        DECR    R2                              ; 5217   0012
        BNEQ    L_51F9                          ; 5218   022C 0020

        MVI     G_0162, R4                      ; 521A   0284 0162
        ADDI    #$0004, R4                      ; 521C   02FC 0004
        CMPI    #$00A0, R4                      ; 521E   037C 00A0
        BNC     L_5223                          ; 5220   0209 0001

        CLRR    R4                              ; 5222   01E4
L_5223:
        MVO     R4,     G_0162                  ; 5223   0244 0162
        PULR    R7                              ; 5225   02B7

L_5226:
        PSHR    R5                              ; 5226   0275
        MVI     G_0163, R1                      ; 5227   0281 0163
        DECR    R1                              ; 5229   0011
        BMI     L_525E                          ; 522A   020B 0032

        MVI     G_010C, R1                      ; 522C   0281 010C
        TSTR    R1                              ; 522E   0089
        BNEQ    L_5415                          ; 522F   020C 01E4

        MVII    #$0190, R4                      ; 5231   02BC 0190
L_5233:
        MVI@    R4,     R1                      ; 5233   02A1
        TSTR    R1                              ; 5234   0089
        BNEQ    L_5415                          ; 5235   020C 01DE

        CMPI    #$01A0, R4                      ; 5237   037C 01A0
        BNC     L_5233                          ; 5239   0229 0007

        MVII    #$0355, R4                      ; 523B   02BC 0355
L_523D:
        MVI@    R4,     R1                      ; 523D   02A1
        TSTR    R1                              ; 523E   0089
        BMI     L_5415                          ; 523F   020B 01D4

        CMPI    #$0359, R4                      ; 5241   037C 0359
        BNC     L_523D                          ; 5243   0229 0007

        SDBD                                    ; 5245   0001
        MVII    #$0400, R4                      ; 5246   02BC 0000 0004
L_5249:
        PSHR    R4                              ; 5249   0274

        JSR     R5,     L_5840                  ; 524A   0004 0158 0040

        PULR    R4                              ; 524D   02B4
        DECR    R4                              ; 524E   0014
        BPL     L_5249                          ; 524F   0223 0007

        MVII    #$0107, R4                      ; 5251   02BC 0107
L_5253:
        MVI@    R4,     R0                      ; 5253   02A0
        CMPI    #$0004, R0                      ; 5254   0378 0004
        BNEQ    L_525E                          ; 5256   020C 0006

        CMPI    #$010B, R4                      ; 5258   037C 010B
        BNC     L_5253                          ; 525A   0229 0008
        B       L_5415                          ; 525C   0200 01B7

L_525E:
        DIS                                     ; 525E   0003
        CLRR    R0                              ; 525F   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 5260   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 5262   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 5264   0240 01FD
        MVO     R0,     G_0172                  ; 5266   0240 0172
        NOP                                     ; 5268   0034
        MVO     R0,     G_0114                  ; 5269   0240 0114
        MVO     R0,     G_017B                  ; 526B   0240 017B
        MVO     R0,     G_0352                  ; 526D   0240 0352
        MVO     R0,     G_017D                  ; 526F   0240 017D
        MVO     R0,     G_017E                  ; 5271   0240 017E
        NOP                                     ; 5273   0034
        MVO     R0,     G_017A                  ; 5274   0240 017A
        MVO     R0,     G_0178                  ; 5276   0240 0178
        MVO     R0,     G_0176                  ; 5278   0240 0176
        MVO     R0,     G_0135                  ; 527A   0240 0135
        MVO     R0,     G_0168                  ; 527C   0240 0168
        NOP                                     ; 527E   0034
        MVII    #$000A, R0                      ; 527F   02B8 000A
        MVO     R0,     G_015F                  ; 5281   0240 015F
        SDBD                                    ; 5283   0001
        MVII    #$58B1, R0                      ; 5284   02B8 00B1 0058
        MVO     R0,     G_0342                  ; 5287   0240 0342
        MVII    #$03F2, R0                      ; 5289   02B8 03F2
        MVO     R0,     G_0330                  ; 528B   0240 0330
        MVO     R0,     G_012B                  ; 528D   0240 012B
        NOP                                     ; 528F   0034
        MVO     R0,     G_034B                  ; 5290   0240 034B
        SDBD                                    ; 5292   0001
        MVII    #$6FC6, R1                      ; 5293   02B9 00C6 006F
        MVO     R1,     G_0338                  ; 5296   0241 0338
        SDBD                                    ; 5298   0001
        MVII    #$0E68, R0                      ; 5299   02B8 0068 000E
        MVO     R0,     G_0331                  ; 529C   0240 0331
        MVI     G_0163, R1                      ; 529E   0281 0163
        CMPI    #$0009, R1                      ; 52A0   0379 0009
        BEQ     L_52A8                          ; 52A2   0204 0004

        CMPI    #$0018, R1                      ; 52A4   0379 0018
        BNEQ    L_52B0                          ; 52A6   020C 0008

L_52A8:
        CLRR    R0                              ; 52A8   01C0
        MVII    #$0107, R4                      ; 52A9   02BC 0107
        MVO@    R0,     R4                      ; 52AB   0260
        MVO@    R0,     R4                      ; 52AC   0260
        NOP                                     ; 52AD   0034
        MVO@    R0,     R4                      ; 52AE   0260
        MVO@    R0,     R4                      ; 52AF   0260
L_52B0:
        MVI     G_0132, R1                      ; 52B0   0281 0132
        CMPI    #$0003, R1                      ; 52B2   0379 0003
        BPL     L_52C4                          ; 52B4   0203 000E

        MVII    #$0107, R4                      ; 52B6   02BC 0107
L_52B8:
        MVI@    R4,     R1                      ; 52B8   02A1
        CMPI    #$0002, R1                      ; 52B9   0379 0002
        BNEQ    L_52C0                          ; 52BB   020C 0003

        CLRR    R1                              ; 52BD   01C9
        DECR    R4                              ; 52BE   0014
        MVO@    R1,     R4                      ; 52BF   0261
L_52C0:
        CMPI    #$010B, R4                      ; 52C0   037C 010B
        BNC     L_52B8                          ; 52C2   0229 000B

L_52C4:
        JSR     R5,     L_5416                  ; 52C4   0004 0154 0016

        MVII    #$0001, R5                      ; 52C7   02BD 0001
        MVO     R5,     G_0106                  ; 52C9   0245 0106
        SDBD                                    ; 52CB   0001
        MVII    #$543A, R1                      ; 52CC   02B9 003A 0054

        JSR     R5,     L_6D68                  ; 52CF   0004 016C 0168

        EIS                                     ; 52D2   0002
L_52D3:
        MVI     G_0106, R5                      ; 52D3   0285 0106
        TSTR    R5                              ; 52D5   00AD
        BNEQ    L_52D3                          ; 52D6   022C 0004

        MVI     G_0163, R1                      ; 52D8   0281 0163
        DECR    R1                              ; 52DA   0011
        BMI     L_5350                          ; 52DB   020B 0073

        SDBD                                    ; 52DD   0001
        MVII    #$5480, R3                      ; 52DE   02BB 0080 0054
        MVII    #$022F, R4                      ; 52E1   02BC 022F

        JSR     R5,     L_545A                  ; 52E3   0004 0154 005A

        SDBD                                    ; 52E6   0001
        MVII    #$6DD5, R1                      ; 52E7   02B9 00D5 006D

        JSR     R5,     L_6D68                  ; 52EA   0004 016C 0168

        EIS                                     ; 52ED   0002
        SDBD                                    ; 52EE   0001
        MVII    #$7FFF, R5                      ; 52EF   02BD 00FF 007F
L_52F2:
        DECR    R5                              ; 52F2   0015
        BPL     L_52F2                          ; 52F3   0223 0002

        SDBD                                    ; 52F5   0001
        MVII    #$08D1, R3                      ; 52F6   02BB 00D1 0008
        MVII    #$02D1, R4                      ; 52F9   02BC 02D1
        MVO@    R3,     R4                      ; 52FB   0263
        MVO@    R3,     R4                      ; 52FC   0263
        MVO@    R3,     R4                      ; 52FD   0263
        MVII    #$0107, R4                      ; 52FE   02BC 0107
        CLRR    R3                              ; 5300   01DB
L_5301:
        MVI@    R4,     R0                      ; 5301   02A0
        CMPI    #$0004, R0                      ; 5302   0378 0004
        BPL     L_5340                          ; 5304   0203 003A

        INCR    R3                              ; 5306   000B
        MOVR    R3,     R2                      ; 5307   009A
        SLL     R2,     2                       ; 5308   004E
        SLL     R2,     1                       ; 5309   004A
        SDBD                                    ; 530A   0001
        ADDI    #$08D1, R2                      ; 530B   02FA 00D1 0008
        MVII    #$02D0, R5                      ; 530E   02BD 02D0
        MVO@    R2,     R5                      ; 5310   026A
        MOVR    R3,     R1                      ; 5311   0099
        SLL     R1,     2                       ; 5312   004D
        ADDI    #$0277, R1                      ; 5313   02F9 0277
        SDBD                                    ; 5315   0001
        MVII    #$0922, R0                      ; 5316   02B8 0022 0009
        MVO@    R0,     R1                      ; 5319   0248
        INCR    R1                              ; 531A   0009
        SDBD                                    ; 531B   0001
        MVII    #$092A, R0                      ; 531C   02B8 002A 0009
        MVO@    R0,     R1                      ; 531F   0248
        MVII    #$0060, R0                      ; 5320   02B8 0060
        MVO     R0,     .PSG0.chn_b_lo          ; 5322   0240 01F1
        MVII    #$0001, R0                      ; 5324   02B8 0001
        MVO     R0,     .PSG0.chn_b_hi          ; 5326   0240 01F5
        MVII    #$000F, R0                      ; 5328   02B8 000F
        MVO     R0,     .PSG0.chn_b_vol         ; 532A   0240 01FC

        JSR     R5,     L_51D0                  ; 532C   0004 0150 01D0

        SDBD                                    ; 532F   0001
        MVII    #$0E00, R5                      ; 5330   02BD 0000 000E
L_5333:
        DECR    R5                              ; 5333   0015
        BPL     L_5333                          ; 5334   0223 0002

        CLRR    R0                              ; 5336   01C0
        MVO     R0,     .PSG0.chn_b_vol         ; 5337   0240 01FC
        SDBD                                    ; 5339   0001
        MVII    #$2800, R5                      ; 533A   02BD 0000 0028
L_533D:
        DECR    R5                              ; 533D   0015
        BPL     L_533D                          ; 533E   0223 0002

L_5340:
        CMPI    #$010B, R4                      ; 5340   037C 010B
        BNC     L_5301                          ; 5342   0229 0042

        MVII    #$0004, R4                      ; 5344   02BC 0004
L_5346:
        SDBD                                    ; 5346   0001
        MVII    #$5000, R5                      ; 5347   02BD 0000 0050
L_534A:
        DECR    R5                              ; 534A   0015
        BPL     L_534A                          ; 534B   0223 0002

        DECR    R4                              ; 534D   0014
        BPL     L_5346                          ; 534E   0223 0009

L_5350:
        MVI     G_0163, R0                      ; 5350   0280 0163
        INCR    R0                              ; 5352   0008
        MVO     R0,     G_0163                  ; 5353   0240 0163
        ANDI    #$0003, R0                      ; 5355   03B8 0003
        CLRR    R1                              ; 5357   01C9
        CMPI    #$0002, R0                      ; 5358   0378 0002
        BNEQ    L_535D                          ; 535A   020C 0001

        INCR    R1                              ; 535C   0009
L_535D:
        MVO     R1,     G_0136                  ; 535D   0241 0136
        MVI     G_0163, R0                      ; 535F   0280 0163
        ANDI    #$0001, R0                      ; 5361   03B8 0001
        BEQ     L_536E                          ; 5363   0204 0009

        MVI     G_0132, R0                      ; 5365   0280 0132
        INCR    R0                              ; 5367   0008
        CMPI    #$000F, R0                      ; 5368   0378 000F
        BPL     L_536E                          ; 536A   0203 0002

        MVO     R0,     G_0132                  ; 536C   0240 0132
L_536E:
        MVI     G_0132, R1                      ; 536E   0281 0132
        ADDR    R1,     R1                      ; 5370   00C9
        INCR    R1                              ; 5371   0009
        MVO     R1,     G_010C                  ; 5372   0241 010C
        MVII    #$0002, R0                      ; 5374   02B8 0002
        MVO     R0,     G_010D                  ; 5376   0240 010D

        JSR     R5,     L_5416                  ; 5378   0004 0154 0016

        MVI     G_0163, R5                      ; 537B   0285 0163
        DECR    R5                              ; 537D   0015
        ANDI    #$0007, R5                      ; 537E   03BD 0007
        ADDR    R5,     R5                      ; 5380   00ED
        SDBD                                    ; 5381   0001
        ADDI    #$54EB, R5                      ; 5382   02FD 00EB 0054
        SDBD                                    ; 5385   0001
        MVI@    R5,     R4                      ; 5386   02AC
        MVII    #$0267, R5                      ; 5387   02BD 0267
L_5389:
        MVI@    R4,     R1                      ; 5389   02A1
        TSTR    R1                              ; 538A   0089
        BEQ     L_539D                          ; 538B   0204 0010

        SUBI    #$0061, R1                      ; 538D   0339 0061
        BPL     L_5394                          ; 538F   0203 0003

        CLRR    R1                              ; 5391   01C9
        B       L_539A                          ; 5392   0200 0006

L_5394:
        SLL     R1,     2                       ; 5394   004D
        SLL     R1,     1                       ; 5395   0049
        SDBD                                    ; 5396   0001
        XORI    #$0802, R1                      ; 5397   03F9 0002 0008
L_539A:
        MVO@    R1,     R5                      ; 539A   0269
        B       L_5389                          ; 539B   0220 0013

L_539D:
        MVI     G_0163, R0                      ; 539D   0280 0163
        MVII    #$0003, R1                      ; 539F   02B9 0003
        SDBD                                    ; 53A1   0001
        MVII    #$8006, R3                      ; 53A2   02BB 0006 0080
        MVII    #$0234, R4                      ; 53A5   02BC 0234

        JSR     R5,     X_PRNUM_RGT             ; 53A7   0004 0118 00C5

        MVII    #$0233, R4                      ; 53AA   02BC 0233
        MVI@    R4,     R1                      ; 53AC   02A1
        MOVR    R1,     R0                      ; 53AD   0088
        ANDI    #$0007, R0                      ; 53AE   03B8 0007
        BEQ     L_53B8                          ; 53B0   0204 0006

        SDBD                                    ; 53B2   0001
        ADDI    #$0850, R1                      ; 53B3   02F9 0050 0008
        DECR    R4                              ; 53B6   0014
        MVO@    R1,     R4                      ; 53B7   0261
L_53B8:
        CMPI    #$0239, R4                      ; 53B8   037C 0239
        DECLE   $0229,  $000F,  $0001           ; 53BA   0229 000F 0001

        MVII    #$007B, R3                      ; 53BD   02BB 007B
        RLC     R0,     2                       ; 53BF   0054
        MVII    #$022F, R4                      ; 53C0   02BC 022F

        JSR     R5,     L_545A                  ; 53C2   0004 0154 005A

        SDBD                                    ; 53C5   0001
        MVII    #$6DD5, R1                      ; 53C6   02B9 00D5 006D

        JSR     R5,     L_6D68                  ; 53C9   0004 016C 0168

        EIS                                     ; 53CC   0002
        SDBD                                    ; 53CD   0001
        MVII    #$2000, R5                      ; 53CE   02BD 0000 0020
L_53D1:
        DECR    R5                              ; 53D1   0015
        BPL     L_53D1                          ; 53D2   0223 0002

        MVII    #$0001, R1                      ; 53D4   02B9 0001
        MVO     R1,     .PSG0.chn_b_hi          ; 53D6   0241 01F5
        SDBD                                    ; 53D8   0001
        MVII    #$546A, R4                      ; 53D9   02BC 006A 0054
L_53DC:
        MVI@    R4,     R5                      ; 53DC   02A5
        MVI@    R4,     R1                      ; 53DD   02A1
        MVO     R1,     .PSG0.chn_b_lo          ; 53DE   0241 01F1
        MVII    #$000F, R1                      ; 53E0   02B9 000F
        MVO     R1,     .PSG0.chn_b_vol         ; 53E2   0241 01FC
        TSTR    R5                              ; 53E4   00AD
        BEQ     L_53F1                          ; 53E5   0204 000A

L_53E7:
        MVII    #$03E8, R0                      ; 53E7   02B8 03E8
L_53E9:
        DECR    R0                              ; 53E9   0010
        BPL     L_53E9                          ; 53EA   0223 0002

        DECR    R5                              ; 53EC   0015
        BPL     L_53E7                          ; 53ED   0223 0007
        B       L_53DC                          ; 53EF   0220 0014

L_53F1:
        SDBD                                    ; 53F1   0001
        MVII    #$7000, R5                      ; 53F2   02BD 0000 0070
        MVO     R5,     .PSG0.chn_b_vol         ; 53F5   0245 01FC
L_53F7:
        DECR    R5                              ; 53F7   0015
        NOP                                     ; 53F8   0034
        NOP                                     ; 53F9   0034
        BPL     L_53F7                          ; 53FA   0223 0004

        MVII    #$0001, R5                      ; 53FC   02BD 0001
        MVO     R5,     G_0106                  ; 53FE   0245 0106
        SDBD                                    ; 5400   0001
        MVII    #$5421, R1                      ; 5401   02B9 0021 0054

        JSR     R5,     L_6D68                  ; 5404   0004 016C 0168

        EIS                                     ; 5407   0002
L_5408:
        MVI     G_0106, R5                      ; 5408   0285 0106
        TSTR    R5                              ; 540A   00AD
        BNEQ    L_5408                          ; 540B   022C 0004

        SDBD                                    ; 540D   0001
        MVII    #$58FE, R1                      ; 540E   02B9 00FE 0058

        JSR     R5,     L_6D68                  ; 5411   0004 016C 0168

        EIS                                     ; 5414   0002
L_5415:
        PULR    R7                              ; 5415   02B7

L_5416:
        PSHR    R5                              ; 5416   0275
        MVII    #$00F0, R0                      ; 5417   02B8 00F0
        MVII    #$0200, R4                      ; 5419   02BC 0200
        MVII    #$02F8, R1                      ; 541B   02B9 02F8

        JSR     R5,     X_FILL_MEM              ; 541D   0004 0114 0341

        PULR    R7                              ; 5420   02B7

        PSHR    R5                              ; 5421   0275
        DIS                                     ; 5422   0003
        MVII    #$0200, R0                      ; 5423   02B8 0200
        SDBD                                    ; 5425   0001
        MVII    #$3800, R4                      ; 5426   02BC 0000 0038

        JSR     R5,     X_FILL_ZERO             ; 5429   0004 0114 0338

        MVII    #$00F0, R0                      ; 542C   02B8 00F0
        MVII    #$0200, R4                      ; 542E   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5430   0004 0114 0338
        JSR     R5,     L_6DF2                  ; 5433   0004 016C 01F2

        CLRR    R0                              ; 5436   01C0
        MVO     R0,     G_0106                  ; 5437   0240 0106
        PULR    R7                              ; 5439   02B7

        PSHR    R5                              ; 543A   0275
        DIS                                     ; 543B   0003
        MVII    #$0000, R1                      ; 543C   02B9 0000
        MVO     R1,     .STIC.CS.0              ; 543E   0241 0028
        SDBD                                    ; 5440   0001
        MVII    #$3800, R1                      ; 5441   02B9 0000 0038
        SDBD                                    ; 5444   0001
        MVII    #$54FB, R4                      ; 5445   02BC 00FB 0054
        MVII    #$0200, R0                      ; 5448   02B8 0200

        JSR     R5,     .EXEC.730               ; 544A   0004 0114 0330

        CLRR    R0                              ; 544D   01C0
        MOVR    R0,     R4                      ; 544E   0084
        MVO@    R0,     R4                      ; 544F   0260
        MVO@    R0,     R4                      ; 5450   0260
        MVO@    R0,     R4                      ; 5451   0260
        MVO@    R0,     R4                      ; 5452   0260
        MVO@    R0,     R4                      ; 5453   0260
        MVO@    R0,     R4                      ; 5454   0260
        MVO@    R0,     R4                      ; 5455   0260
        MVO@    R0,     R4                      ; 5456   0260
        MVO     R0,     G_0106                  ; 5457   0240 0106
        PULR    R7                              ; 5459   02B7

L_545A:
        MVI@    R3,     R0                      ; 545A   0298
        INCR    R3                              ; 545B   000B
        SUBI    #$0061, R0                      ; 545C   0338 0061
        BMI     L_5469                          ; 545E   020B 0009

        SLL     R0,     2                       ; 5460   004C
        SLL     R0,     1                       ; 5461   0048
        SDBD                                    ; 5462   0001
        XORI    #$0806, R0                      ; 5463   03F8 0006 0008
        MVO@    R0,     R4                      ; 5466   0260
        B       L_545A                          ; 5467   0220 000E
L_5469:
        MOVR    R5,     R7                      ; 5469   00AF

        DECLE   $0005,  $005F,  $0005,  $007F   ; 546A   0005 005F 0005 007F
        DECLE   $0005,  $005F,  $0005,  $007F   ; 546E   0005 005F 0005 007F
        DECLE   $0005,  $0050,  $0005,  $007F   ; 5472   0005 0050 0005 007F
        DECLE   $0014,  $0028,  $0000,  $0000   ; 5476   0014 0028 0000 0000
        DECLE   $0000,  $0077,  $0061,  $0076   ; 547A   0000 0077 0061 0076
        DECLE   $0065,  $0000,  $0062,  $006F   ; 547E   0065 0000 0062 006F
        DECLE   $006E,  $0075,  $0073,  $0000   ; 5482   006E 0075 0073 0000
        DECLE   $006F,  $0072,  $0069,  $006F   ; 5486   006F 0072 0069 006F
        DECLE   $006E,  $0020,  $0066,  $0069   ; 548A   006E 0020 0066 0069
        DECLE   $0067,  $0068,  $0074,  $0065   ; 548E   0067 0068 0074 0065
        DECLE   $0072,  $0073,  $0000,  $0020   ; 5492   0072 0073 0000 0020
        DECLE   $0020,  $0067,  $0072,  $0061   ; 5496   0020 0067 0072 0061
        DECLE   $0076,  $0069,  $0074,  $0069   ; 549A   0076 0069 0074 0069
        DECLE   $006E,  $0065,  $0073,  $0000   ; 549E   006E 0065 0073 0000
        DECLE   $0061,  $0073,  $0074,  $0072   ; 54A2   0061 0073 0074 0072
        DECLE   $006F,  $0020,  $0073,  $0061   ; 54A6   006F 0020 0073 0061
        DECLE   $0069,  $006C,  $006F,  $0072   ; 54AA   0069 006C 006F 0072
        DECLE   $0073,  $0000,  $0020,  $0020   ; 54AE   0073 0000 0020 0020
        DECLE   $0020,  $0071,  $0075,  $0065   ; 54B2   0020 0071 0075 0065
        DECLE   $006D,  $0065,  $006E,  $0073   ; 54B6   006D 0065 006E 0073
        DECLE   $0000,  $0020,  $0064,  $0069   ; 54BA   0000 0020 0064 0069
        DECLE   $0076,  $0069,  $006E,  $0067   ; 54BE   0076 0069 006E 0067
        DECLE   $0020,  $0064,  $0072,  $006F   ; 54C2   0020 0064 0072 006F
        DECLE   $006E,  $0065,  $0073,  $0000   ; 54C6   006E 0065 0073 0000
        DECLE   $0020,  $0020,  $0020,  $0020   ; 54CA   0020 0020 0020 0020
        DECLE   $0073,  $006F,  $006E,  $0061   ; 54CE   0073 006F 006E 0061
        DECLE   $0064,  $0073,  $0000,  $0020   ; 54D2   0064 0073 0000 0020
        DECLE   $0020,  $0020,  $0077,  $0069   ; 54D6   0020 0020 0077 0069
        DECLE   $006E,  $0074,  $006F,  $006B   ; 54DA   006E 0074 006F 006B
        DECLE   $0073,  $0000,  $0020,  $0020   ; 54DE   0073 0000 0020 0020
        DECLE   $0020,  $0020,  $0074,  $0072   ; 54E2   0020 0020 0074 0072
        DECLE   $006F,  $0065,  $006B,  $0073   ; 54E6   006F 0065 006B 0073
        DECLE   $0000,  $0086,  $0054,  $0095   ; 54EA   0000 0086 0054 0095
        DECLE   $0054,  $00A2,  $0054,  $00B0   ; 54EE   0054 00A2 0054 00B0
        DECLE   $0054,  $00BB,  $0054,  $00CA   ; 54F2   0054 00BB 0054 00CA
        DECLE   $0054,  $00D5,  $0054,  $00E0   ; 54F6   0054 00D5 0054 00E0
        DECLE   $0054,  $007C,  $0044,  $0044   ; 54FA   0054 007C 0044 0044
        DECLE   $0044,  $00FE,  $00C2,  $00C2   ; 54FE   0044 00FE 00C2 00C2
        DECLE   $00C2,  $00FC,  $0084,  $0084   ; 5502   00C2 00FC 0084 0084
        DECLE   $0084,  $00FE,  $00C2,  $00C2   ; 5506   0084 00FE 00C2 00C2
        DECLE   $00FE,  $00FE,  $0082,  $0080   ; 550A   00FE 00FE 0082 0080
        DECLE   $0080,  $00C0,  $00C0,  $00C2   ; 550E   0080 00C0 00C0 00C2
        DECLE   $00FE,  $00FC,  $0086,  $0082   ; 5512   00FE 00FC 0086 0082
        DECLE   $0082,  $00C2,  $00C2,  $00C6   ; 5516   0082 00C2 00C2 00C6
        DECLE   $00FC,  $00FE,  $0080,  $0080   ; 551A   00FC 00FE 0080 0080
        DECLE   $0080,  $00FE,  $00C0,  $00C0   ; 551E   0080 00FE 00C0 00C0
        DECLE   $00FE,  $00FE,  $0080,  $0080   ; 5522   00FE 00FE 0080 0080
        DECLE   $0080,  $00FE,  $00C0,  $00C0   ; 5526   0080 00FE 00C0 00C0
        DECLE   $00C0,  $00FE,  $0082,  $0080   ; 552A   00C0 00FE 0082 0080
        DECLE   $0080,  $00CE,  $00C2,  $00C2   ; 552E   0080 00CE 00C2 00C2
        DECLE   $00FE,  $0082,  $0082,  $0082   ; 5532   00FE 0082 0082 0082
        DECLE   $0082,  $00FE,  $00C2,  $00C2   ; 5536   0082 00FE 00C2 00C2
        DECLE   $00C2,  $0010,  $0010,  $0010   ; 553A   00C2 0010 0010 0010
        DECLE   $0010,  $0018,  $0018,  $0018   ; 553E   0010 0018 0018 0018
        DECLE   $0018,  $0004,  $0004,  $0004   ; 5542   0018 0004 0004 0004
        DECLE   $0004,  $0006,  $0086,  $0086   ; 5546   0004 0006 0086 0086
        DECLE   $00FE,  $0084,  $0084,  $008C   ; 554A   00FE 0084 0084 008C
        DECLE   $0088,  $00FE,  $00C2,  $00C2   ; 554E   0088 00FE 00C2 00C2
        DECLE   $00C2,  $0080,  $0080,  $0080   ; 5552   00C2 0080 0080 0080
        DECLE   $0080,  $00C0,  $00C0,  $00C0   ; 5556   0080 00C0 00C0 00C0
        DECLE   $00FE,  $00FE,  $0092,  $0092   ; 555A   00FE 00FE 0092 0092
        DECLE   $0092,  $00D2,  $00D2,  $00D2   ; 555E   0092 00D2 00D2 00D2
        DECLE   $00D2,  $00FE,  $0082,  $0082   ; 5562   00D2 00FE 0082 0082
        DECLE   $0082,  $00C2,  $00C2,  $00C2   ; 5566   0082 00C2 00C2 00C2
        DECLE   $00C2,  $00FE,  $0086,  $0082   ; 556A   00C2 00FE 0086 0082
        DECLE   $0082,  $0082,  $0082,  $0082   ; 556E   0082 0082 0082 0082
        DECLE   $00FE,  $00FE,  $0082,  $0082   ; 5572   00FE 00FE 0082 0082
        DECLE   $00FE,  $00C0,  $00C0,  $00C0   ; 5576   00FE 00C0 00C0 00C0
        DECLE   $00C0,  $00FE,  $0082,  $0082   ; 557A   00C0 00FE 0082 0082
        DECLE   $0082,  $0082,  $0082,  $009E   ; 557E   0082 0082 0082 009E
        DECLE   $00FE,  $00FC,  $0084,  $0084   ; 5582   00FE 00FC 0084 0084
        DECLE   $0084,  $00FE,  $00C2,  $00C2   ; 5586   0084 00FE 00C2 00C2
        DECLE   $00C2,  $00FE,  $0082,  $0080   ; 558A   00C2 00FE 0082 0080
        DECLE   $00FE,  $0006,  $0086,  $0086   ; 558E   00FE 0006 0086 0086
        DECLE   $00FE,  $00FE,  $0010,  $0010   ; 5592   00FE 00FE 0010 0010
        DECLE   $0010,  $0018,  $0018,  $0018   ; 5596   0010 0018 0018 0018
        DECLE   $0018,  $0082,  $0082,  $0082   ; 559A   0018 0082 0082 0082
        DECLE   $0082,  $00C2,  $00C2,  $00C2   ; 559E   0082 00C2 00C2 00C2
        DECLE   $00FE,  $00C2,  $00C2,  $00C2   ; 55A2   00FE 00C2 00C2 00C2
        DECLE   $00C6,  $0044,  $0044,  $0044   ; 55A6   00C6 0044 0044 0044
        DECLE   $007C,  $0092,  $0092,  $0092   ; 55AA   007C 0092 0092 0092
        DECLE   $0092,  $00D2,  $00D2,  $00D2   ; 55AE   0092 00D2 00D2 00D2
        DECLE   $00FE,  $0082,  $0082,  $0082   ; 55B2   00FE 0082 0082 0082
        DECLE   $00FE,  $0044,  $00C2,  $00C2   ; 55B6   00FE 0044 00C2 00C2
        DECLE   $00C2,  $0082,  $0082,  $0082   ; 55BA   00C2 0082 0082 0082
        DECLE   $0082,  $00FE,  $0018,  $0018   ; 55BE   0082 00FE 0018 0018
        DECLE   $0018,  $00FE,  $0082,  $0002   ; 55C2   0018 00FE 0082 0002
        DECLE   $007E,  $00C0,  $00C0,  $00C2   ; 55C6   007E 00C0 00C0 00C2
        DECLE   $00FE,  $00FE,  $0082,  $0082   ; 55CA   00FE 00FE 0082 0082
        DECLE   $0082,  $0086,  $0086,  $0086   ; 55CE   0082 0086 0086 0086
        DECLE   $00FE,  $0008,  $0008,  $0008   ; 55D2   00FE 0008 0008 0008
        DECLE   $0008,  $0018,  $0018,  $0018   ; 55D6   0008 0018 0018 0018
        DECLE   $0018,  $00FE,  $0082,  $0002   ; 55DA   0018 00FE 0082 0002
        DECLE   $0002,  $00FE,  $00C0,  $00C0   ; 55DE   0002 00FE 00C0 00C0
        DECLE   $00FE,  $00FC,  $0084,  $0004   ; 55E2   00FE 00FC 0084 0004
        DECLE   $003C,  $0006,  $0086,  $0086   ; 55E6   003C 0006 0086 0086
        DECLE   $00FE,  $0084,  $0084,  $0084   ; 55EA   00FE 0084 0084 0084
        DECLE   $0084,  $00FE,  $000C,  $000C   ; 55EE   0084 00FE 000C 000C
        DECLE   $000C,  $00FE,  $0080,  $0080   ; 55F2   000C 00FE 0080 0080
        DECLE   $00FE,  $0006,  $0006,  $0086   ; 55F6   00FE 0006 0006 0086
        DECLE   $00FE,  $00FE,  $0082,  $0080   ; 55FA   00FE 00FE 0082 0080
        DECLE   $00FE,  $0086,  $0086,  $0086   ; 55FE   00FE 0086 0086 0086
        DECLE   $00FE,  $00FE,  $0002,  $0002   ; 5602   00FE 00FE 0002 0002
        DECLE   $0002,  $0006,  $0006,  $0006   ; 5606   0002 0006 0006 0006
        DECLE   $0006,  $007C,  $0044,  $0044   ; 560A   0006 007C 0044 0044
        DECLE   $00FE,  $0086,  $0086,  $0086   ; 560E   00FE 0086 0086 0086
        DECLE   $00FE,  $00FE,  $0082,  $0082   ; 5612   00FE 00FE 0082 0082
        DECLE   $0082,  $00FE,  $0006,  $0006   ; 5616   0082 00FE 0006 0006
        DECLE   $0006,  $0000,  $0001,  $0001   ; 561A   0006 0000 0001 0001
        DECLE   $0003,  $0007,  $001F,  $005F   ; 561E   0003 0007 001F 005F
        DECLE   $00FF,  $0000,  $0080,  $0080   ; 5622   00FF 0000 0080 0080
        DECLE   $00E8,  $00F8,  $00FC,  $00FE   ; 5626   00E8 00F8 00FC 00FE
        DECLE   $00FF                           ; 562A   00FF
L_562B:
        PSHR    R5                              ; 562B   0275
        MVI     G_0129, R0                      ; 562C   0280 0129
        TSTR    R0                              ; 562E   0080
        BNEQ    L_56C1                          ; 562F   020C 0090

        MVI     G_015D, R1                      ; 5631   0281 015D
        TSTR    R1                              ; 5633   0089
        BEQ     L_5643                          ; 5634   0204 000D

        MVII    #$02B5, R4                      ; 5636   02BC 02B5
L_5638:
        MVI@    R4,     R0                      ; 5638   02A0
        SDBD                                    ; 5639   0001
        CMPI    #$189C, R0                      ; 563A   0378 009C 0018
        BEQ     L_5644                          ; 563D   0204 0005

        CMPI    #$02C6, R4                      ; 563F   037C 02C6
        BMI     L_5638                          ; 5641   022B 000A
L_5643:
        PULR    R7                              ; 5643   02B7

L_5644:
        SUBI    #$02B4, R4                      ; 5644   033C 02B4
        MOVR    R4,     R0                      ; 5646   00A0
        SLL     R0,     2                       ; 5647   004C
        SLL     R0,     1                       ; 5648   0048
        SUBI    #$0004, R0                      ; 5649   0338 0004
        MVO     R0,     G_0343                  ; 564B   0240 0343
        MVII    #$010E, R4                      ; 564D   02BC 010E
        SDBD                                    ; 564F   0001
        MVI@    R4,     R2                      ; 5650   02A2
        SDBD                                    ; 5651   0001
        MVI@    R4,     R3                      ; 5652   02A3
        MVI     G_032D, R0                      ; 5653   0280 032D

        JSR     R5,     X_UNPK_BYTES            ; 5655   0004 0114 0357

        PSHR    R0                              ; 5658   0270
        MVI     G_0132, R0                      ; 5659   0280 0132
        SLR     R0,     1                       ; 565B   0060
        INCR    R0                              ; 565C   0008
        MOVR    R0,     R5                      ; 565D   0085
        PULR    R0                              ; 565E   02B0
L_565F:
        ADDR    R0,     R0                      ; 565F   00C0
        ADDR    R1,     R1                      ; 5660   00C9
        DECR    R5                              ; 5661   0015
        BNEQ    L_565F                          ; 5662   022C 0004

        ADDR    R2,     R0                      ; 5664   00D0
        ADDR    R1,     R3                      ; 5665   00CB
        SWAP    R0,     1                       ; 5666   0040
        SWAP    R3,     1                       ; 5667   0043
        ANDI    #$00FF, R0                      ; 5668   03B8 00FF
        MVI     G_0343, R2                      ; 566A   0282 0343
        SUBR    R0,     R2                      ; 566C   0102
        MVII    #$0050, R1                      ; 566D   02B9 0050
        ANDI    #$007F, R3                      ; 566F   03BB 007F
        SUBR    R3,     R1                      ; 5671   0119
        BPL     L_5675                          ; 5672   0203 0001

        NEGR    R1                              ; 5674   0021
L_5675:
        MOVR    R2,     R3                      ; 5675   0093
        MOVR    R1,     R4                      ; 5676   008C
        MVII    #$000F, R0                      ; 5677   02B8 000F
        MVO     R0,     G_017D                  ; 5679   0240 017D
        SWAP    R0,     1                       ; 567B   0040
        MVO     R0,     G_0353                  ; 567C   0240 0353
        SDBD                                    ; 567E   0001
        MVII    #$67A1, R0                      ; 567F   02B8 00A1 0067
        MVO     R0,     G_0342                  ; 5682   0240 0342
        CLRR    R0                              ; 5684   01C0
        MVO     R0,     G_0127                  ; 5685   0240 0127
        MVO     R0,     G_0128                  ; 5687   0240 0128
        MVO     R0,     G_015E                  ; 5689   0240 015E
        INCR    R0                              ; 568B   0008
        MVO     R0,     G_0129                  ; 568C   0240 0129
        MVII    #$0050, R0                      ; 568E   02B8 0050
        MVO     R0,     G_0346                  ; 5690   0240 0346
        MVI     G_0343, R0                      ; 5692   0280 0343
        ADD     G_0330, R0                      ; 5694   02C0 0330
        MVO     R0,     G_0345                  ; 5696   0240 0345
        MVI     G_0132, R1                      ; 5698   0281 0132
        SLL     R1,     2                       ; 569A   004D
        ADDI    #$000A, R1                      ; 569B   02F9 000A
        MVO     R1,     G_0125                  ; 569D   0241 0125
        PSHR    R4                              ; 569F   0274
        MOVR    R3,     R0                      ; 56A0   0098
        TSTR    R3                              ; 56A1   009B
        BPL     L_56A5                          ; 56A2   0203 0001

        NEGR    R3                              ; 56A4   0023
L_56A5:
        ADDR    R4,     R3                      ; 56A5   00E3
        MVI     G_0125, R1                      ; 56A6   0281 0125

        JSR     R5,     X_MPY                   ; 56A8   0004 011C 01DC

        MOVR    R2,     R1                      ; 56AB   0091
        MOVR    R3,     R2                      ; 56AC   009A

        JSR     R5,     X_DIVR                  ; 56AD   0004 011C 01F8

        NEGR    R0                              ; 56B0   0020
        MVO     R0,     G_0347                  ; 56B1   0240 0347
        PULR    R0                              ; 56B3   02B0
        MVI     G_0125, R1                      ; 56B4   0281 0125

        JSR     R5,     X_MPY                   ; 56B6   0004 011C 01DC

        MOVR    R2,     R1                      ; 56B9   0091
        MOVR    R3,     R2                      ; 56BA   009A

        JSR     R5,     X_DIVR                  ; 56BB   0004 011C 01F8

        NEGR    R0                              ; 56BE   0020
        MVO     R0,     G_0348                  ; 56BF   0240 0348
L_56C1:
        PULR    R7                              ; 56C1   02B7

L_56C2:
        PSHR    R5                              ; 56C2   0275
        MVI     G_0130, R0                      ; 56C3   0280 0130
        CMPI    #$0046, R0                      ; 56C5   0378 0046
        BNC     L_56C1                          ; 56C7   0229 0007

        MVII    #$003C, R0                      ; 56C9   02B8 003C
        MVO     R0,     G_0130                  ; 56CB   0240 0130
        MVII    #$0190, R4                      ; 56CD   02BC 0190
L_56CF:
        MVI@    R4,     R0                      ; 56CF   02A0
        TSTR    R0                              ; 56D0   0080
        BEQ     L_56FC                          ; 56D1   0204 0029

        SLR     R0,     2                       ; 56D3   0064
        SLR     R0,     2                       ; 56D4   0064
        ANDI    #$0003, R0                      ; 56D5   03B8 0003
        ADDI    #$0107, R0                      ; 56D7   02F8 0107
        MOVR    R0,     R5                      ; 56D9   0085
        MVI@    R5,     R0                      ; 56DA   02A8
        CMPI    #$0003, R0                      ; 56DB   0378 0003
        BNC     L_56FC                          ; 56DD   0209 001D

        MVII    #$0006, R2                      ; 56DF   02BA 0006
L_56E1:
        INCR    R3                              ; 56E1   000B
        ANDI    #$0003, R3                      ; 56E2   03BB 0003
        MVII    #$0107, R5                      ; 56E4   02BD 0107
        ADDR    R3,     R5                      ; 56E6   00DD
        MVI@    R5,     R1                      ; 56E7   02A9
        CMPI    #$0004, R1                      ; 56E8   0379 0004
        BEQ     L_56F9                          ; 56EA   0204 000D

        DECR    R4                              ; 56EC   0014
        MVI@    R4,     R0                      ; 56ED   02A0
        ANDI    #$00CF, R0                      ; 56EE   03B8 00CF
        SLL     R3,     2                       ; 56F0   004F
        SLL     R3,     2                       ; 56F1   004F
        ANDI    #$0030, R3                      ; 56F2   03BB 0030
        XORR    R3,     R0                      ; 56F4   01D8
        DECR    R4                              ; 56F5   0014
        MVO@    R0,     R4                      ; 56F6   0260
        B       L_56FC                          ; 56F7   0200 0003

L_56F9:
        DECR    R2                              ; 56F9   0012
        BPL     L_56E1                          ; 56FA   0223 001A

L_56FC:
        CMPI    #$01A0, R4                      ; 56FC   037C 01A0
        BNC     L_56CF                          ; 56FE   0229 0030

        MVI     G_010C, R0                      ; 5700   0280 010C
        TSTR    R0                              ; 5702   0080
        BEQ     L_574E                          ; 5703   0204 0049

        MVI     G_010D, R1                      ; 5705   0281 010D
        DECR    R1                              ; 5707   0011
        MVO     R1,     G_010D                  ; 5708   0241 010D
        BNEQ    L_574E                          ; 570A   020C 0042

        MVII    #$0008, R0                      ; 570C   02B8 0008

        JSR     R5,     X_RAND2                 ; 570E   0004 0114 029E

        ADDI    #$0003, R0                      ; 5711   02F8 0003
        MVO     R0,     G_010D                  ; 5713   0240 010D
        MVII    #$0003, R0                      ; 5715   02B8 0003
        MVO     R0,     G_017E                  ; 5717   0240 017E
        MVII    #$00FA, R0                      ; 5719   02B8 00FA
        MVO     R0,     G_0354                  ; 571B   0240 0354
        MVI     G_0132, R1                      ; 571D   0281 0132
        SLR     R1,     1                       ; 571F   0061
        DECR    R1                              ; 5720   0011
        CMPI    #$0004, R1                      ; 5721   0379 0004
        BNC     L_5727                          ; 5723   0209 0002

        MVII    #$0003, R1                      ; 5725   02B9 0003
L_5727:
        TSTR    R1                              ; 5727   0089
        BEQ     L_5734                          ; 5728   0204 000A
        BMI     L_5734                          ; 572A   020B 0008

        PSHR    R1                              ; 572C   0271

        JSR     R5,     L_57A4                  ; 572D   0004 0154 03A4

        PULR    R1                              ; 5730   02B1
        DECR    R1                              ; 5731   0011
        B       L_5727                          ; 5732   0220 000C

L_5734:
        MVI     G_0132, R0                      ; 5734   0280 0132
        CMPI    #$000A, R0                      ; 5736   0378 000A
        BNC     L_573C                          ; 5738   0209 0002

        MVII    #$000A, R0                      ; 573A   02B8 000A
L_573C:
        ADDI    #$0003, R0                      ; 573C   02F8 0003
        MVO     R0,     G_010B                  ; 573E   0240 010B
        MOVR    R0,     R1                      ; 5740   0081
        SUB     G_010C, R0                      ; 5741   0300 010C
        BNC     L_5749                          ; 5743   0209 0004

        MVI     G_010C, R1                      ; 5745   0281 010C
        MVO     R1,     G_010B                  ; 5747   0241 010B
L_5749:
        MVI     G_010C, R3                      ; 5749   0283 010C
        SUBR    R1,     R3                      ; 574B   010B
        MVO     R3,     G_010C                  ; 574C   0243 010C
L_574E:
        PULR    R7                              ; 574E   02B7

L_574F:
        PSHR    R5                              ; 574F   0275
        MVI     G_010B, R1                      ; 5750   0281 010B
        DECR    R1                              ; 5752   0011
        BMI     L_574E                          ; 5753   022B 0006

        MVO     R1,     G_010B                  ; 5755   0241 010B
        SDBD                                    ; 5757   0001
        MVII    #$07D0, R0                      ; 5758   02B8 00D0 0007

        JSR     R5,     X_RAND2                 ; 575B   0004 0114 029E

        SUBI    #$03E8, R0                      ; 575E   0338 03E8
        MOVR    R0,     R4                      ; 5760   0084
        ANDI    #$0003, R4                      ; 5761   03BC 0003
        ADDR    R4,     R4                      ; 5763   00E4
        SDBD                                    ; 5764   0001
        ADDI    #$6AAB, R4                      ; 5765   02FC 00AB 006A
        SDBD                                    ; 5768   0001
        MVI@    R4,     R3                      ; 5769   02A3
        ADDR    R3,     R0                      ; 576A   00D8
        BPL     L_576E                          ; 576B   0203 0001

        CLRR    R0                              ; 576D   01C0
L_576E:
        SDBD                                    ; 576E   0001
        CMPI    #$0D30, R0                      ; 576F   0378 0030 000D
        BNC     L_5778                          ; 5772   0209 0004

        SDBD                                    ; 5774   0001
        MVII    #$0D30, R0                      ; 5775   02B8 0030 000D
L_5778:
        MOVR    R0,     R1                      ; 5778   0081
        MVII    #$00FF, R0                      ; 5779   02B8 00FF

        JSR     R5,     X_RAND2                 ; 577B   0004 0114 029E

        INCR    R0                              ; 577E   0008
        ANDI    #$00F7, R0                      ; 577F   03B8 00F7
        MOVR    R0,     R2                      ; 5781   0082
        ANDI    #$00C0, R0                      ; 5782   03B8 00C0
        BNEQ    L_5788                          ; 5784   020C 0002

        ADDI    #$0040, R2                      ; 5786   02FA 0040
L_5788:
        INCR    R7                              ; 5788   000F

        PSHR    R5                              ; 5789   0275
L_578A:
        MVII    #$0190, R4                      ; 578A   02BC 0190
L_578C:
        MVI@    R4,     R5                      ; 578C   02A5
        TSTR    R5                              ; 578D   00AD
        BEQ     L_5796                          ; 578E   0204 0006

        CMPI    #$01A0, R4                      ; 5790   037C 01A0
        BNC     L_578C                          ; 5792   0229 0007
        B       L_57A3                          ; 5794   0200 000D

L_5796:
        DECR    R4                              ; 5796   0014
        MVO@    R2,     R4                      ; 5797   0262
        ADDI    #$000F, R4                      ; 5798   02FC 000F
        MVO@    R1,     R4                      ; 579A   0261
        SWAP    R1,     1                       ; 579B   0041
        ADDI    #$000F, R4                      ; 579C   02FC 000F
        MVO@    R1,     R4                      ; 579E   0261
        ADDI    #$000F, R4                      ; 579F   02FC 000F
        CLRR    R1                              ; 57A1   01C9
        MVO@    R1,     R4                      ; 57A2   0261
L_57A3:
        PULR    R7                              ; 57A3   02B7

L_57A4:
        PSHR    R5                              ; 57A4   0275
        PSHR    R4                              ; 57A5   0274
        MVII    #$0355, R4                      ; 57A6   02BC 0355
L_57A8:
        MVI@    R4,     R1                      ; 57A8   02A1
        TSTR    R1                              ; 57A9   0089
        BPL     L_57B2                          ; 57AA   0203 0006

        CMPI    #$0359, R4                      ; 57AC   037C 0359
        BNC     L_57A8                          ; 57AE   0229 0007
        B       L_57DA                          ; 57B0   0200 0028

L_57B2:
        MVII    #$0003, R0                      ; 57B2   02B8 0003

        JSR     R5,     X_RAND2                 ; 57B4   0004 0114 029E

        ADDR    R0,     R0                      ; 57B7   00C0
        MOVR    R0,     R5                      ; 57B8   0085
        SDBD                                    ; 57B9   0001
        ADDI    #$6AB3, R5                      ; 57BA   02FD 00B3 006A
        SDBD                                    ; 57BD   0001
        MVI@    R5,     R1                      ; 57BE   02A9
        SDBD                                    ; 57BF   0001
        ADDI    #$8017, R1                      ; 57C0   02F9 0017 0080
        MVII    #$000A, R0                      ; 57C3   02B8 000A

        JSR     R5,     X_RAND2                 ; 57C5   0004 0114 029E

        ADDR    R1,     R0                      ; 57C8   00C8
        MVII    #$0355, R5                      ; 57C9   02BD 0355
L_57CB:
        MVI@    R5,     R1                      ; 57CB   02A9
        SUBR    R0,     R1                      ; 57CC   0101
        BPL     L_57D0                          ; 57CD   0203 0001

        NEGR    R1                              ; 57CF   0021
L_57D0:
        CMPI    #$0005, R1                      ; 57D0   0379 0005
        BNC     L_57B2                          ; 57D2   0229 0021

        CMPI    #$0359, R5                      ; 57D4   037D 0359
        BNC     L_57CB                          ; 57D6   0229 000C

        DECR    R4                              ; 57D8   0014
        MVO@    R0,     R4                      ; 57D9   0260
L_57DA:
        PULR    R4                              ; 57DA   02B4
        PULR    R7                              ; 57DB   02B7

L_57DC:
        PSHR    R5                              ; 57DC   0275
        MVI     G_0167, R0                      ; 57DD   0280 0167
        TSTR    R0                              ; 57DF   0080
        BNEQ    L_580E                          ; 57E0   020C 002C

        MVI     G_0165, R0                      ; 57E2   0280 0165
        CLRR    R5                              ; 57E4   01ED
        MVI     G_0333, R1                      ; 57E5   0281 0333
        TSTR    R1                              ; 57E7   0089
        BPL     L_57F7                          ; 57E8   0203 000D

        SDBD                                    ; 57EA   0001
        ADDI    #$0600, R1                      ; 57EB   02F9 0000 0006
        SLL     R0,     1                       ; 57EE   0048
        CMPI    #$0100, R0                      ; 57EF   0378 0100
        BNEQ    L_5808                          ; 57F1   020C 0015

        SWAP    R0,     1                       ; 57F3   0040
        INCR    R5                              ; 57F4   000D
        B       L_5808                          ; 57F5   0200 0011

L_57F7:
        SDBD                                    ; 57F7   0001
        CMPI    #$0600, R1                      ; 57F8   0379 0000 0006
        BNC     L_580E                          ; 57FB   0209 0011

        SDBD                                    ; 57FD   0001
        SUBI    #$0600, R1                      ; 57FE   0339 0000 0006
        SLR     R0,     1                       ; 5801   0060
        BNEQ    L_5808                          ; 5802   020C 0004

        MVII    #$0080, R0                      ; 5804   02B8 0080
        MVII    #$0003, R5                      ; 5806   02BD 0003
L_5808:
        MVO     R0,     G_0165                  ; 5808   0240 0165
        MVO     R1,     G_0333                  ; 580A   0241 0333
        MVO     R5,     G_0167                  ; 580C   0245 0167
L_580E:
        MVI     G_0164, R3                      ; 580E   0283 0164
L_5810:
        INCR    R3                              ; 5810   000B
        MVO     R3,     G_0164                  ; 5811   0243 0164
        SDBD                                    ; 5813   0001
        ADDI    #$6FE2, R3                      ; 5814   02FB 00E2 006F
        MVI@    R3,     R3                      ; 5817   029B
        TSTR    R3                              ; 5818   009B
        BEQ     L_5810                          ; 5819   0224 000A

        ADDI    #$019C, R3                      ; 581B   02FB 019C
        ADD     G_0166, R3                      ; 581D   02C3 0166
        MVI@    R3,     R0                      ; 581F   0298
        SDBD                                    ; 5820   0001
        ANDI    #$07F8, R0                      ; 5821   03B8 00F8 0007
        SDBD                                    ; 5824   0001
        CMPI    #$0060, R0                      ; 5825   0378 0060 0000
        BNEQ    L_5837                          ; 5828   020C 000D

        MVI     G_033A, R0                      ; 582A   0280 033A
        ANDI    #$0007, R0                      ; 582C   03B8 0007
        XOR@    R3,     R0                      ; 582E   03D8
        MVI     G_0136, R2                      ; 582F   0282 0136
        TSTR    R2                              ; 5831   0092
        BEQ     L_5835                          ; 5832   0204 0001

        CLRR    R0                              ; 5834   01C0
L_5835:
        MVO@    R0,     R3                      ; 5835   0258
        PULR    R7                              ; 5836   02B7

L_5837:
        TSTR    R0                              ; 5837   0080
        BNEQ    L_583F                          ; 5838   020C 0005

        SDBD                                    ; 583A   0001
        MVII    #$1865, R0                      ; 583B   02B8 0065 0018
        MVO@    R0,     R3                      ; 583E   0258
L_583F:
        PULR    R7                              ; 583F   02B7

L_5840:
        PSHR    R5                              ; 5840   0275
        MVII    #$01D4, R4                      ; 5841   02BC 01D4
L_5843:
        MVI@    R4,     R1                      ; 5843   02A1
        TSTR    R1                              ; 5844   0089
        BEQ     L_5895                          ; 5845   0204 004E

        DECR    R4                              ; 5847   0014
        INCR    R1                              ; 5848   0009
        MOVR    R1,     R2                      ; 5849   008A
        SDBD                                    ; 584A   0001
        ADDI    #$58F1, R2                      ; 584B   02FA 00F1 0058
        MVI@    R2,     R3                      ; 584E   0293
        TSTR    R3                              ; 584F   009B
        BNEQ    L_5853                          ; 5850   020C 0001

        CLRR    R1                              ; 5852   01C9
L_5853:
        MVO@    R1,     R4                      ; 5853   0261
        PSHR    R4                              ; 5854   0274
        MOVR    R3,     R5                      ; 5855   009D
        SLL     R3,     2                       ; 5856   004F
        SLL     R3,     1                       ; 5857   004B
        ADDR    R5,     R3                      ; 5858   00EB
        SDBD                                    ; 5859   0001
        ADDI    #$58B4, R3                      ; 585A   02FB 00B4 0058
        SUBI    #$0005, R4                      ; 585D   033C 0005
        MVI@    R4,     R4                      ; 585F   02A4
        MVI     G_033A, R1                      ; 5860   0281 033A
        ANDI    #$0007, R1                      ; 5862   03B9 0007
        BNEQ    L_5867                          ; 5864   020C 0001

        INCR    R1                              ; 5866   0009
L_5867:
        SDBD                                    ; 5867   0001
        CMPI    #$0006, R5                      ; 5868   037D 0006 0000
        BNEQ    L_586F                          ; 586B   020C 0002

        MVII    #$0007, R1                      ; 586D   02B9 0007
L_586F:
        SDBD                                    ; 586F   0001
        XORI    #$8000, R1                      ; 5870   03F9 0000 0080
        MOVR    R4,     R2                      ; 5873   00A2
L_5874:
        SUBI    #$0014, R2                      ; 5874   033A 0014
        BPL     L_5874                          ; 5876   0223 0003

        ADDI    #$0014, R2                      ; 5878   02FA 0014
        BNEQ    L_587D                          ; 587A   020C 0001

        INCR    R4                              ; 587C   000C
L_587D:
        CMPI    #$0013, R2                      ; 587D   037A 0013
        BNEQ    L_5882                          ; 587F   020C 0001

        DECR    R4                              ; 5881   0014
L_5882:
        MVII    #$0002, R2                      ; 5882   02BA 0002
        ADDI    #$01EB, R4                      ; 5884   02FC 01EB

L_5886:
        JSR     R5,     L_589A                  ; 5886   0004 0158 009A
        JSR     R5,     L_589A                  ; 5889   0004 0158 009A
        JSR     R5,     L_589A                  ; 588C   0004 0158 009A

        ADDI    #$0011, R4                      ; 588F   02FC 0011
        DECR    R2                              ; 5891   0012
        BPL     L_5886                          ; 5892   0223 000D

        PULR    R4                              ; 5894   02B4
L_5895:
        CMPI    #$01D8, R4                      ; 5895   037C 01D8
        BNC     L_5843                          ; 5897   0229 0055
        PULR    R7                              ; 5899   02B7

L_589A:
        MVI@    R3,     R0                      ; 589A   0298
        INCR    R3                              ; 589B   000B
        SLL     R0,     2                       ; 589C   004C
        SLL     R0,     1                       ; 589D   0048
        BEQ     L_58A5                          ; 589E   0204 0005

        SDBD                                    ; 58A0   0001
        ANDI    #$7FF8, R0                      ; 58A1   03B8 00F8 007F
        XORR    R1,     R0                      ; 58A4   01C8
L_58A5:
        CMPI    #$0200, R4                      ; 58A5   037C 0200
        BNC     L_58AF                          ; 58A7   0209 0006

        CMPI    #$02A0, R4                      ; 58A9   037C 02A0
        BPL     L_58AF                          ; 58AB   0203 0002

        MVO@    R0,     R4                      ; 58AD   0260
        MOVR    R5,     R7                      ; 58AE   00AF

L_58AF:
        INCR    R4                              ; 58AF   000C
        MOVR    R5,     R7                      ; 58B0   00AF

        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58B9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58BD   0000 0000 0000 0000
        DECLE   $004F,  $0000,  $0000,  $0000   ; 58C1   004F 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 58C5   0000 0000 0000 0000
        DECLE   $0000,  $002F,  $0000,  $0000   ; 58C9   0000 002F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00CF   ; 58CD   0000 0000 0000 00CF
        DECLE   $0000,  $00C1,  $0000,  $00C0   ; 58D1   0000 00C1 0000 00C0
        DECLE   $0000,  $00CC,  $0000,  $00BB   ; 58D5   0000 00CC 0000 00BB
        DECLE   $00CE,  $00BA,  $00C3,  $0000   ; 58D9   00CE 00BA 00C3 0000
        DECLE   $00C2,  $00B9,  $00CD,  $00B8   ; 58DD   00C2 00B9 00CD 00B8
        DECLE   $00BB,  $00CD,  $00BA,  $00C2   ; 58E1   00BB 00CD 00BA 00C2
        DECLE   $0000,  $00C3,  $00B9,  $00CE   ; 58E5   0000 00C3 00B9 00CE
        DECLE   $00B8,  $0078,  $00D1,  $0079   ; 58E9   00B8 0078 00D1 0079
        DECLE   $00A4,  $005F,  $00A5,  $007A   ; 58ED   00A4 005F 00A5 007A
        DECLE   $00D0,  $007B,  $0001,  $0002   ; 58F1   00D0 007B 0001 0002
        DECLE   $0003,  $0004,  $0006,  $0005   ; 58F5   0003 0004 0006 0005
        DECLE   $0004,  $0003,  $0002,  $0001   ; 58F9   0004 0003 0002 0001
        DECLE   $0000                           ; 58FD   0000

        PSHR    R5                              ; 58FE   0275

        JSR     R5,     L_6DD5                  ; 58FF   0004 016C 01D5

        MVI     G_0161, R4                      ; 5902   0284 0161
        TSTR    R4                              ; 5904   00A4
        BNEQ    L_5975                          ; 5905   020C 006E

        INCR    R4                              ; 5907   000C
        MVO     R4,     G_0161                  ; 5908   0244 0161

        JSR     R5,     L_597E                  ; 590A   0004 0158 017E
        JSR     R5,     L_5A83                  ; 590D   0004 0158 0283
        JSR     R5,     L_5A67                  ; 5910   0004 0158 0267
        JSR     R5,     L_6415                  ; 5913   0004 0164 0015
        JSR     R5,     L_5B23                  ; 5916   0004 0158 0323
        JSR     R5,     L_5B8A                  ; 5919   0004 0158 038A
        JSR     R5,     L_6035                  ; 591C   0004 0160 0035
        JSR     R5,     L_6452                  ; 591F   0004 0164 0052
        JSR     R5,     L_60EC                  ; 5922   0004 0160 00EC
        JSR     R5,     L_60AD                  ; 5925   0004 0160 00AD
        JSR     R5,     L_688C                  ; 5928   0004 0168 008C
        JSR     R5,     L_6390                  ; 592B   0004 0160 0390
        JSR     R5,     L_6589                  ; 592E   0004 0164 0189
        JSR     R5,     L_6811                  ; 5931   0004 0168 0011
        JSR     R5,     L_6AD5                  ; 5934   0004 0168 02D5
        JSR     R5,     L_64E9                  ; 5937   0004 0164 00E9

        MVI     G_033A, R0                      ; 593A   0280 033A
        INCR    R0                              ; 593C   0008
        MVO     R0,     G_033A                  ; 593D   0240 033A
        MVI     G_0130, R0                      ; 593F   0280 0130
        DECR    R0                              ; 5941   0010
        MVO     R0,     G_0130                  ; 5942   0240 0130
        MVI     G_012F, R0                      ; 5944   0280 012F
        DECR    R0                              ; 5946   0010
        MVO     R0,     G_012F                  ; 5947   0240 012F
        MVI     G_0131, R1                      ; 5949   0281 0131
        CMPI    #$0001, R1                      ; 594B   0379 0001
        BNEQ    L_5971                          ; 594D   020C 0022

        MVI     G_0163, R1                      ; 594F   0281 0163
        CMPI    #$0008, R1                      ; 5951   0379 0008
        BPL     L_595B                          ; 5953   0203 0006

        MVI     G_033A, R1                      ; 5955   0281 033A
        ANDI    #$0001, R1                      ; 5957   03B9 0001
        BEQ     L_5971                          ; 5959   0204 0016

L_595B:
        MVI     G_0171, R1                      ; 595B   0281 0171
        ADDR    R1,     R1                      ; 595D   00C9
        DECR    R1                              ; 595E   0011
        MOVR    R1,     R5                      ; 595F   008D
        ADD     G_016C, R1                      ; 5960   02C1 016C
        MVO     R1,     G_016C                  ; 5962   0241 016C
        ADD     G_016F, R5                      ; 5964   02C5 016F
        MVO     R5,     G_016F                  ; 5966   0245 016F
        ANDI    #$0007, R5                      ; 5968   03BD 0007
        SDBD                                    ; 596A   0001
        ADDI    #$5C9D, R5                      ; 596B   02FD 009D 005C
        MVI@    R5,     R1                      ; 596E   02A9
        MVO     R1,     G_016E                  ; 596F   0241 016E
L_5971:
        CLRR    R1                              ; 5971   01C9
        MVO     R1,     G_0161                  ; 5972   0241 0161
        PULR    R7                              ; 5974   02B7

L_5975:
        SDBD                                    ; 5975   0001
        MVII    #$3078, R3                      ; 5976   02BB 0078 0030
        MVI@    R3,     R0                      ; 5979   0298
        DECR    R0                              ; 597A   0010
        BEQ     L_5975                          ; 597B   0224 0007
        PULR    R7                              ; 597D   02B7

L_597E:
        PSHR    R5                              ; 597E   0275
        MVII    #$0000, R0                      ; 597F   02B8 0000
        MVI     G_0136, R5                      ; 5981   0285 0136
        TSTR    R5                              ; 5983   00AD
        BEQ     L_5988                          ; 5984   0204 0002

        MVII    #$000D, R0                      ; 5986   02B8 000D
L_5988:
        MVI     G_0178, R1                      ; 5988   0281 0178
        ANDI    #$000B, R1                      ; 598A   03B9 000B
        CMPI    #$000B, R1                      ; 598C   0379 000B
        BNEQ    L_599C                          ; 598E   020C 000C

        MVII    #$0013, R0                      ; 5990   02B8 0013
        MVO     R0,     G_017D                  ; 5992   0240 017D
        SDBD                                    ; 5994   0001
        MVII    #$3000, R0                      ; 5995   02B8 0000 0030
        MVO     R0,     G_0353                  ; 5998   0240 0353
        MVII    #$0007, R0                      ; 599A   02B8 0007
L_599C:
        MVO     R0,     .STIC.CS.0              ; 599C   0240 0028
        MVI     .STIC.C.0,R0                    ; 599E   0280 0018
        MVO     R0,     G_0349                  ; 59A0   0240 0349
        MVI     .STIC.C.2,R0                    ; 59A2   0280 001A
        MVO     R0,     G_034A                  ; 59A4   0240 034A
        CLRR    R0                              ; 59A6   01C0
        MVO     R0,     .STIC.C.0               ; 59A7   0240 0018
        MVO     R0,     .STIC.C.2               ; 59A9   0240 001A
        MVI     G_0165, R0                      ; 59AB   0280 0165
        SDBD                                    ; 59AD   0001
        MVII    #$3863, R5                      ; 59AE   02BD 0063 0038
        MVO@    R0,     R5                      ; 59B1   0268
        SDBD                                    ; 59B2   0001
        MVII    #$3808, R4                      ; 59B3   02BC 0008 0038
        CLRR    R1                              ; 59B6   01C9
        MVI     G_0134, R0                      ; 59B7   0280 0134
        ANDI    #$0001, R0                      ; 59B9   03B8 0001
        BEQ     L_59BE                          ; 59BB   0204 0001

        MVO@    R1,     R4                      ; 59BD   0261
L_59BE:
        MVII    #$0010, R0                      ; 59BE   02B8 0010
        MVO@    R0,     R4                      ; 59C0   0260
        MVII    #$0018, R0                      ; 59C1   02B8 0018
        MVO@    R0,     R4                      ; 59C3   0260
        MVO@    R1,     R4                      ; 59C4   0261
        MVI     G_012C, R0                      ; 59C5   0280 012C
        SUBI    #$0019, R0                      ; 59C7   0338 0019
        BMI     L_59F0                          ; 59C9   020B 0025

        CMPI    #$0004, R0                      ; 59CB   0378 0004
        BPL     L_59F0                          ; 59CD   0203 0021

        MVII    #$0107, R5                      ; 59CF   02BD 0107
        ADDR    R0,     R5                      ; 59D1   00C5
        SDBD                                    ; 59D2   0001
        MVII    #$3810, R4                      ; 59D3   02BC 0010 0038
        SLL     R0,     2                       ; 59D6   004C
        SLL     R0,     1                       ; 59D7   0048
        ADDR    R0,     R4                      ; 59D8   00C4
        MVI     G_012D, R1                      ; 59D9   0281 012D
        ADDR    R1,     R4                      ; 59DB   00CC
        CLRR    R1                              ; 59DC   01C9
        MVO@    R1,     R4                      ; 59DD   0261
        MVO@    R1,     R4                      ; 59DE   0261
        MVO@    R1,     R4                      ; 59DF   0261
        MVO@    R1,     R4                      ; 59E0   0261
        MVO@    R1,     R4                      ; 59E1   0261
        MVI@    R5,     R2                      ; 59E2   02AA
        INCR    R2                              ; 59E3   000A
        ANDI    #$00FE, R2                      ; 59E4   03BA 00FE
        SDBD                                    ; 59E6   0001
        ADDI    #$6ABB, R2                      ; 59E7   02FA 00BB 006A
        MVI@    R2,     R0                      ; 59EA   0290
        MVO@    R0,     R4                      ; 59EB   0260
        INCR    R2                              ; 59EC   000A
        MVI@    R2,     R0                      ; 59ED   0290
        MVO@    R0,     R4                      ; 59EE   0260
        MVO@    R1,     R4                      ; 59EF   0261
L_59F0:
        MVI     G_033E, R2                      ; 59F0   0282 033E
        MVI@    R2,     R1                      ; 59F2   0291
        MVI     G_012E, R0                      ; 59F3   0280 012E
        COMR    R0                              ; 59F5   0018
        ANDR    R0,     R1                      ; 59F6   0181
        COMR    R0                              ; 59F7   0018
        XORR    R0,     R1                      ; 59F8   01C1
        MVO@    R1,     R2                      ; 59F9   0251
        MVI     G_0318, R0                      ; 59FA   0280 0318
        MVO     R0,     .STIC.X.0               ; 59FC   0240 0000
        MVO     R0,     .STIC.X.1               ; 59FE   0240 0001
        MVI     G_0319, R0                      ; 5A00   0280 0319
        ADD     G_034D, R0                      ; 5A02   02C0 034D
        MVO     R0,     .STIC.Y.0               ; 5A04   0240 0008
        MVO     R0,     .STIC.Y.1               ; 5A06   0240 0009
        MVI     G_031A, R0                      ; 5A08   0280 031A
        MVO     R0,     .STIC.A.0               ; 5A0A   0240 0010
        MVII    #$031B, R4                      ; 5A0C   02BC 031B
        MVII    #$0002, R5                      ; 5A0E   02BD 0002
        MVII    #$0003, R3                      ; 5A10   02BB 0003
L_5A12:
        MVI@    R4,     R0                      ; 5A12   02A0
        MVO@    R0,     R5                      ; 5A13   0268
        MVI@    R4,     R0                      ; 5A14   02A0
        MVO@    R0,     R5                      ; 5A15   0268
        MVI@    R4,     R0                      ; 5A16   02A0
        MVO@    R0,     R5                      ; 5A17   0268
        MVI@    R4,     R0                      ; 5A18   02A0
        MVO@    R0,     R5                      ; 5A19   0268
        MVI@    R4,     R0                      ; 5A1A   02A0
        MVO@    R0,     R5                      ; 5A1B   0268
        MVI@    R4,     R0                      ; 5A1C   02A0
        MVO@    R0,     R5                      ; 5A1D   0268
        ADDI    #$0002, R5                      ; 5A1E   02FD 0002
        DECR    R3                              ; 5A20   0013
        BNEQ    L_5A12                          ; 5A21   022C 0010

        MVI     G_033A, R1                      ; 5A23   0281 033A
        ANDI    #$0001, R1                      ; 5A25   03B9 0001
        BNEQ    L_5A4D                          ; 5A27   020C 0024

        MVI     G_0168, R1                      ; 5A29   0281 0168
        SUB     G_0338, R1                      ; 5A2B   0301 0338
        BEQ     L_5A4D                          ; 5A2D   0204 001E

        MVI     G_0169, R5                      ; 5A2F   0285 0169
        ADDI    #$0002, R5                      ; 5A31   02FD 0002
        CMPI    #$000A, R5                      ; 5A33   037D 000A
        BPL     L_5A5F                          ; 5A35   0203 0028

        MVO     R5,     G_0169                  ; 5A37   0245 0169
        SUBI    #$0002, R5                      ; 5A39   033D 0002
        MOVR    R5,     R2                      ; 5A3B   00AA
        ADD     G_0338, R5                      ; 5A3C   02C5 0338
        SDBD                                    ; 5A3E   0001
        MVI@    R5,     R4                      ; 5A3F   02AC
        SLL     R2,     2                       ; 5A40   004E
        SLL     R2,     1                       ; 5A41   004A
        SDBD                                    ; 5A42   0001
        ADDI    #$39C0, R2                      ; 5A43   02FA 00C0 0039
        MOVR    R2,     R1                      ; 5A46   0091

        JSR     R5,     L_5B0F                  ; 5A47   0004 0158 030F
        JSR     R5,     L_5B0F                  ; 5A4A   0004 0158 030F

L_5A4D:
        MVI     G_0339, R1                      ; 5A4D   0281 0339
        SWAP    R1,     1                       ; 5A4F   0041
        SLR     R1,     1                       ; 5A50   0061
        ANDI    #$0007, R1                      ; 5A51   03B9 0007
        SDBD                                    ; 5A53   0001
        ADDI    #$51C0, R1                      ; 5A54   02F9 00C0 0051
        MVI@    R1,     R0                      ; 5A57   0288
        SDBD                                    ; 5A58   0001
        MVII    #$3853, R5                      ; 5A59   02BD 0053 0038
        MVO@    R0,     R5                      ; 5A5C   0268
        MVO@    R0,     R5                      ; 5A5D   0268
        PULR    R7                              ; 5A5E   02B7

L_5A5F:
        MVI     G_0338, R1                      ; 5A5F   0281 0338
        MVO     R1,     G_0168                  ; 5A61   0241 0168
        CLRR    R1                              ; 5A63   01C9
        MVO     R1,     G_0169                  ; 5A64   0241 0169
        PULR    R7                              ; 5A66   02B7

L_5A67:
        PSHR    R5                              ; 5A67   0275
        MVI     G_033A, R0                      ; 5A68   0280 033A
        ANDI    #$0001, R0                      ; 5A6A   03B8 0001
        BEQ     L_5A79                          ; 5A6C   0204 000B

        MVI     G_0342, R4                      ; 5A6E   0284 0342
        SDBD                                    ; 5A70   0001
        MVII    #$39B0, R1                      ; 5A71   02B9 00B0 0039

        JSR     R5,     L_5B0F                  ; 5A74   0004 0158 030F

        B       L_5A7F                          ; 5A77   0200 0006

L_5A79:
        MVI     G_0341, R4                      ; 5A79   0284 0341
        SDBD                                    ; 5A7B   0001
        MVII    #$39A0, R1                      ; 5A7C   02B9 00A0 0039

L_5A7F:
        JSR     R5,     L_5B0F                  ; 5A7F   0004 0158 030F

        PULR    R7                              ; 5A82   02B7

L_5A83:
        PSHR    R5                              ; 5A83   0275
        DECLE   $0280,  $0335,  $0064,  $0064   ; 5A84   0280 0335 0064 0064
        DECLE   $0064,  $03B8,  $0007,  $0085   ; 5A88   0064 03B8 0007 0085
        DECLE   $004C,  $0048,  $00E8,  $00E8   ; 5A8C   004C 0048 00E8 00E8
        DECLE   $0001,  $02F8,  $00E5,  $005F   ; 5A90   0001 02F8 00E5 005F
        DECLE   $0084,  $0001,  $02BD,  $0072   ; 5A94   0084 0001 02BD 0072
        DECLE   $0038,  $02A0,  $0268,  $02A0   ; 5A98   0038 02A0 0268 02A0
        DECLE   $0268,  $02FD,  $0006,  $02A0   ; 5A9C   0268 02FD 0006 02A0
        DECLE   $0268,  $02A0,  $0268,  $02FD   ; 5AA0   0268 02A0 0268 02FD
        DECLE   $0006,  $02A0,  $0268,  $02A0   ; 5AA4   0006 02A0 0268 02A0
        DECLE   $0268,  $02FD,  $0006,  $02A0   ; 5AA8   0268 02FD 0006 02A0
        DECLE   $0268,  $02A0,  $0268,  $0280   ; 5AAC   0268 02A0 0268 0280
        DECLE   $016D,  $03B8,  $0007,  $004C   ; 5AB0   016D 03B8 0007 004C
        DECLE   $004C,  $004C,  $0281,  $016E   ; 5AB4   004C 004C 0281 016E
        DECLE   $004D,  $004D,  $0001           ; 5AB8   004D 004D 0001

        MVII    #$00A5, R4                      ; 5ABB   02BC 00A5
        SLLC    R0,     2                       ; 5ABD   005C
        ADDR    R1,     R4                      ; 5ABE   00CC
        ADDR    R0,     R4                      ; 5ABF   00C4
        SDBD                                    ; 5AC0   0001
        MVII    #$3890, R5                      ; 5AC1   02BD 0090 0038
        MVI@    R4,     R0                      ; 5AC4   02A0
        MVO@    R0,     R5                      ; 5AC5   0268
        MVI@    R4,     R0                      ; 5AC6   02A0
        MVO@    R0,     R5                      ; 5AC7   0268
        MVI@    R4,     R0                      ; 5AC8   02A0
        MVO@    R0,     R5                      ; 5AC9   0268
        MVI@    R4,     R0                      ; 5ACA   02A0
        MVO@    R0,     R5                      ; 5ACB   0268
        MVI@    R4,     R0                      ; 5ACC   02A0
        MVO@    R0,     R5                      ; 5ACD   0268
        MVI@    R4,     R0                      ; 5ACE   02A0
        MVO@    R0,     R5                      ; 5ACF   0268
        MVI@    R4,     R0                      ; 5AD0   02A0
        MVO@    R0,     R5                      ; 5AD1   0268
        MVI@    R4,     R0                      ; 5AD2   02A0
        MVO@    R0,     R5                      ; 5AD3   0268
        MVI@    R4,     R0                      ; 5AD4   02A0
        MVO@    R0,     R5                      ; 5AD5   0268
        MVI@    R4,     R0                      ; 5AD6   02A0
        MVO@    R0,     R5                      ; 5AD7   0268
        MVI@    R4,     R0                      ; 5AD8   02A0
        MVO@    R0,     R5                      ; 5AD9   0268
        MVI@    R4,     R0                      ; 5ADA   02A0
        MVO@    R0,     R5                      ; 5ADB   0268
        MVI@    R4,     R0                      ; 5ADC   02A0
        MVO@    R0,     R5                      ; 5ADD   0268
        MVI@    R4,     R0                      ; 5ADE   02A0
        MVO@    R0,     R5                      ; 5ADF   0268
        MVI@    R4,     R0                      ; 5AE0   02A0
        MVO@    R0,     R5                      ; 5AE1   0268
        MVI@    R4,     R0                      ; 5AE2   02A0
        MVO@    R0,     R5                      ; 5AE3   0268
        MVI     G_0337, R0                      ; 5AE4   0280 0337
        SLR     R0,     2                       ; 5AE6   0064
        SLR     R0,     2                       ; 5AE7   0064
        SLR     R0,     2                       ; 5AE8   0064
        ANDI    #$0007, R0                      ; 5AE9   03B8 0007
        SLL     R0,     2                       ; 5AEB   004C
        SLL     R0,     1                       ; 5AEC   0048
        MOVR    R0,     R1                      ; 5AED   0081
        SLL     R1,     2                       ; 5AEE   004D
        ADDR    R1,     R0                      ; 5AEF   00C8
        SDBD                                    ; 5AF0   0001
        ADDI    #$5EA5, R0                      ; 5AF1   02F8 00A5 005E
        MOVR    R0,     R4                      ; 5AF4   0084
        SDBD                                    ; 5AF5   0001
        MVII    #$38A0, R5                      ; 5AF6   02BD 00A0 0038
        MVII    #$0004, R2                      ; 5AF9   02BA 0004
L_5AFB:
        MVI@    R4,     R0                      ; 5AFB   02A0
        MVO@    R0,     R5                      ; 5AFC   0268
        MVI@    R4,     R0                      ; 5AFD   02A0
        MVO@    R0,     R5                      ; 5AFE   0268
        MVI@    R4,     R0                      ; 5AFF   02A0
        MVO@    R0,     R5                      ; 5B00   0268
        MVI@    R4,     R0                      ; 5B01   02A0
        MVO@    R0,     R5                      ; 5B02   0268
        MVI@    R4,     R0                      ; 5B03   02A0
        MVO@    R0,     R5                      ; 5B04   0268
        MVI@    R4,     R0                      ; 5B05   02A0
        MVO@    R0,     R5                      ; 5B06   0268
        MVI@    R4,     R0                      ; 5B07   02A0
        MVO@    R0,     R5                      ; 5B08   0268
        MVI@    R4,     R0                      ; 5B09   02A0
        MVO@    R0,     R5                      ; 5B0A   0268
        DECR    R2                              ; 5B0B   0012
        BPL     L_5AFB                          ; 5B0C   0223 0012
        PULR    R7                              ; 5B0E   02B7

L_5B0F:
        PSHR    R5                              ; 5B0F   0275
        MOVR    R1,     R5                      ; 5B10   008D
        MVI@    R4,     R0                      ; 5B11   02A0
        MVO@    R0,     R5                      ; 5B12   0268
        MVI@    R4,     R0                      ; 5B13   02A0
        MVO@    R0,     R5                      ; 5B14   0268
        MVI@    R4,     R0                      ; 5B15   02A0
        MVO@    R0,     R5                      ; 5B16   0268
        MVI@    R4,     R0                      ; 5B17   02A0
        MVO@    R0,     R5                      ; 5B18   0268
        MVI@    R4,     R0                      ; 5B19   02A0
        MVO@    R0,     R5                      ; 5B1A   0268
        MVI@    R4,     R0                      ; 5B1B   02A0
        MVO@    R0,     R5                      ; 5B1C   0268
        MVI@    R4,     R0                      ; 5B1D   02A0
        MVO@    R0,     R5                      ; 5B1E   0268
        MVI@    R4,     R0                      ; 5B1F   02A0
        MVO@    R0,     R5                      ; 5B20   0268
        MOVR    R5,     R1                      ; 5B21   00A9
        PULR    R7                              ; 5B22   02B7

L_5B23:
        PSHR    R5                              ; 5B23   0275
        MVI     G_0172, R5                      ; 5B24   0285 0172
        TSTR    R5                              ; 5B26   00AD
        BNEQ    L_5B37                          ; 5B27   020C 000E

        MVII    #$0335, R3                      ; 5B29   02BB 0335
        MVII    #$00A0, R4                      ; 5B2B   02BC 00A0

        JSR     R5,     L_5B38                  ; 5B2D   0004 0158 0338

        MVII    #$0337, R3                      ; 5B30   02BB 0337
        MVII    #$00C8, R4                      ; 5B32   02BC 00C8

        JSR     R5,     L_5B38                  ; 5B34   0004 0158 0338

L_5B37:
        PULR    R7                              ; 5B37   02B7

L_5B38:
        PSHR    R5                              ; 5B38   0275
        MVI@    R3,     R1                      ; 5B39   0299
        TSTR    R1                              ; 5B3A   0089
        BMI     L_5B67                          ; 5B3B   020B 002A

        CMPI    #$0200, R1                      ; 5B3D   0379 0200
        BNC     L_5B89                          ; 5B3F   0209 0048

        SUBI    #$0200, R1                      ; 5B41   0339 0200
        MVO@    R1,     R3                      ; 5B43   0259
        PSHR    R4                              ; 5B44   0274
        ADDI    #$0213, R4                      ; 5B45   02FC 0213
        MVI@    R4,     R2                      ; 5B47   02A2
        SUBI    #$0002, R4                      ; 5B48   033C 0002
        MVII    #$0013, R1                      ; 5B4A   02B9 0013
L_5B4C:
        MVI@    R4,     R0                      ; 5B4C   02A0
        SDBD                                    ; 5B4D   0001
        ANDI    #$5FFF, R0                      ; 5B4E   03B8 00FF 005F
        MVO@    R0,     R4                      ; 5B51   0260
        SUBI    #$0003, R4                      ; 5B52   033C 0003
        DECR    R1                              ; 5B54   0011
        BNEQ    L_5B4C                          ; 5B55   022C 000A

        PULR    R1                              ; 5B57   02B1
        ADDI    #$0200, R1                      ; 5B58   02F9 0200
        MVI@    R1,     R0                      ; 5B5A   0288
        SDBD                                    ; 5B5B   0001
        ANDI    #$A000, R0                      ; 5B5C   03B8 0000 00A0
        SDBD                                    ; 5B5F   0001
        ANDI    #$5FFF, R2                      ; 5B60   03BA 00FF 005F
        XORR    R0,     R2                      ; 5B63   01C2
        MVO@    R2,     R1                      ; 5B64   024A
        B       L_5B89                          ; 5B65   0200 0022

L_5B67:
        ADDI    #$0200, R1                      ; 5B67   02F9 0200
        MVO@    R1,     R3                      ; 5B69   0259
        ADDI    #$0200, R4                      ; 5B6A   02FC 0200
        PSHR    R4                              ; 5B6C   0274
        MVI@    R4,     R2                      ; 5B6D   02A2
        MVII    #$0013, R1                      ; 5B6E   02B9 0013
L_5B70:
        MVI@    R4,     R0                      ; 5B70   02A0
        SUBI    #$0002, R4                      ; 5B71   033C 0002
        MVO@    R0,     R4                      ; 5B73   0260
        INCR    R4                              ; 5B74   000C
        DECR    R1                              ; 5B75   0011
        BNEQ    L_5B70                          ; 5B76   022C 0007

        MOVR    R2,     R5                      ; 5B78   0095
        PULR    R4                              ; 5B79   02B4
        MVI@    R4,     R0                      ; 5B7A   02A0
        SDBD                                    ; 5B7B   0001
        ANDI    #$A000, R5                      ; 5B7C   03BD 0000 00A0
        XORR    R5,     R0                      ; 5B7F   01E8
        DECR    R4                              ; 5B80   0014
        MVO@    R0,     R4                      ; 5B81   0260
        ADDI    #$0012, R4                      ; 5B82   02FC 0012
        SDBD                                    ; 5B84   0001
        ANDI    #$5FFF, R2                      ; 5B85   03BA 00FF 005F
        MVO@    R2,     R4                      ; 5B88   0262
L_5B89:
        PULR    R7                              ; 5B89   02B7

L_5B8A:
        PSHR    R5                              ; 5B8A   0275
        MVI     G_016D, R3                      ; 5B8B   0283 016D
        SLR     R3,     2                       ; 5B8D   0067
        SLR     R3,     1                       ; 5B8E   0063
        ANDI    #$0001, R3                      ; 5B8F   03BB 0001
        MVI     G_0331, R5                      ; 5B91   0285 0331
        ADDR    R3,     R5                      ; 5B93   00DD
        MVO     R5,     G_0332                  ; 5B94   0245 0332
        MVI     G_034C, R4                      ; 5B96   0284 034C
        SUBR    R5,     R4                      ; 5B98   012C
        MVI     G_034B, R0                      ; 5B99   0280 034B
        CMPR    R0,     R4                      ; 5B9B   0144
        BEQ     L_5BF6                          ; 5B9C   0204 0058

        MVO     R4,     G_034B                  ; 5B9E   0244 034B
        MVII    #$02B4, R4                      ; 5BA0   02BC 02B4
        SDBD                                    ; 5BA2   0001
        MVII    #$2000, R0                      ; 5BA3   02B8 0000 0020
        MVO@    R0,     R4                      ; 5BA6   0260
        CLRR    R0                              ; 5BA7   01C0
        MVO     R0,     G_015D                  ; 5BA8   0240 015D
        MVO@    R0,     R4                      ; 5BAA   0260
        MVO@    R0,     R4                      ; 5BAB   0260
        NOP                                     ; 5BAC   0034
        MVO@    R0,     R4                      ; 5BAD   0260
        MVO@    R0,     R4                      ; 5BAE   0260
        MVII    #$0002, R3                      ; 5BAF   02BB 0002
L_5BB1:
        MVO@    R0,     R4                      ; 5BB1   0260
        MVO@    R0,     R4                      ; 5BB2   0260
        MVO@    R0,     R4                      ; 5BB3   0260
        NOP                                     ; 5BB4   0034
        MVO@    R0,     R4                      ; 5BB5   0260
        MVO@    R0,     R4                      ; 5BB6   0260
        DECR    R3                              ; 5BB7   0013
        BPL     L_5BB1                          ; 5BB8   0223 0008

        SUBI    #$02B4, R5                      ; 5BBA   033D 02B4
        MVII    #$0355, R3                      ; 5BBC   02BB 0355
L_5BBE:
        MVI@    R3,     R4                      ; 5BBE   029C
        DECLE   $00A4,  $0203,  $002F,  $0001   ; 5BBF   00A4 0203 002F 0001

        ANDI    #$00FF, R4                      ; 5BC3   03BC 00FF
        SARC    R3,     2                       ; 5BC5   007F
        SUBR    R5,     R4                      ; 5BC6   012C
        CMPI    #$02B4, R4                      ; 5BC7   037C 02B4
        BNC     L_5BDD                          ; 5BC9   0209 0012

        CMPI    #$02C8, R4                      ; 5BCB   037C 02C8
        BPL     L_5BDD                          ; 5BCD   0203 000E

        MVI@    R4,     R0                      ; 5BCF   02A0
        DECR    R4                              ; 5BD0   0014
        SDBD                                    ; 5BD1   0001
        ANDI    #$2000, R0                      ; 5BD2   03B8 0000 0020
        SDBD                                    ; 5BD5   0001
        XORI    #$1894, R0                      ; 5BD6   03F8 0094 0018
        MVO     R0,     G_015D                  ; 5BD9   0240 015D
        MVO@    R0,     R4                      ; 5BDB   0260
        DECR    R4                              ; 5BDC   0014
L_5BDD:
        INCR    R4                              ; 5BDD   000C
        CMPI    #$02B4, R4                      ; 5BDE   037C 02B4
        BNC     L_5BF1                          ; 5BE0   0209 000F

        CMPI    #$02C8, R4                      ; 5BE2   037C 02C8
        BPL     L_5BF1                          ; 5BE4   0203 000B

        MVI@    R4,     R0                      ; 5BE6   02A0
        DECR    R4                              ; 5BE7   0014
        SDBD                                    ; 5BE8   0001
        ANDI    #$2000, R0                      ; 5BE9   03B8 0000 0020
        SDBD                                    ; 5BEC   0001
        XORI    #$189C, R0                      ; 5BED   03F8 009C 0018
        MVO@    R0,     R4                      ; 5BF0   0260
L_5BF1:
        INCR    R3                              ; 5BF1   000B
        CMPI    #$0359, R3                      ; 5BF2   037B 0359
        BNC     L_5BBE                          ; 5BF4   0229 0037

L_5BF6:
        CLRR    R5                              ; 5BF6   01ED
        MVI     G_0336, R1                      ; 5BF7   0281 0336
        TSTR    R1                              ; 5BF9   0089
        BMI     L_5C05                          ; 5BFA   020B 0009

        CMPI    #$0200, R1                      ; 5BFC   0379 0200
        BNC     L_5C1F                          ; 5BFE   0209 001F

        SUBI    #$0200, R1                      ; 5C00   0339 0200
        INCR    R5                              ; 5C02   000D
        B       L_5C08                          ; 5C03   0200 0003

L_5C05:
        ADDI    #$0200, R1                      ; 5C05   02F9 0200
        DECR    R5                              ; 5C07   0015
L_5C08:
        MVO     R1,     G_0336                  ; 5C08   0241 0336
        MVI     G_0331, R0                      ; 5C0A   0280 0331
        ADDR    R5,     R0                      ; 5C0C   00E8
        SDBD                                    ; 5C0D   0001
        CMPI    #$0E03, R0                      ; 5C0E   0378 0003 000E
        BPL     L_5C15                          ; 5C11   0203 0002

        ADDI    #$00D8, R0                      ; 5C13   02F8 00D8
L_5C15:
        SDBD                                    ; 5C15   0001
        CMPI    #$0EDB, R0                      ; 5C16   0378 00DB 000E
        BNC     L_5C1D                          ; 5C19   0209 0002

        SUBI    #$00D8, R0                      ; 5C1B   0338 00D8
L_5C1D:
        MVO     R0,     G_0331                  ; 5C1D   0240 0331
L_5C1F:
        CLRR    R2                              ; 5C1F   01D2
L_5C20:
        MVI     G_016C, R1                      ; 5C20   0281 016C
        CMPI    #$0080, R1                      ; 5C22   0379 0080
        BPL     L_5C2F                          ; 5C24   0203 0009

        CMPI    #$0008, R1                      ; 5C26   0379 0008
        BNC     L_5C36                          ; 5C28   0209 000C

        SUBI    #$0008, R1                      ; 5C2A   0339 0008
        INCR    R2                              ; 5C2C   000A
        B       L_5C32                          ; 5C2D   0200 0003

L_5C2F:
        ADDI    #$0008, R1                      ; 5C2F   02F9 0008
        DECR    R2                              ; 5C31   0012
L_5C32:
        MVO     R1,     G_016C                  ; 5C32   0241 016C
        B       L_5C20                          ; 5C34   0220 0015

L_5C36:
        TSTR    R2                              ; 5C36   0092
        BEQ     L_5C92                          ; 5C37   0204 0059

        MVII    #$0355, R3                      ; 5C39   02BB 0355
L_5C3B:
        MVI@    R3,     R1                      ; 5C3B   0299
        TSTR    R1                              ; 5C3C   0089
        BPL     L_5C89                          ; 5C3D   0203 004A

        ADDR    R2,     R1                      ; 5C3F   00D1
        SDBD                                    ; 5C40   0001
        CMPI    #$8E1A, R1                      ; 5C41   0379 001A 008E
        BPL     L_5C4A                          ; 5C44   0203 0004

        MVII    #$0001, R5                      ; 5C46   02BD 0001
        MVO     R5,     G_0171                  ; 5C48   0245 0171
L_5C4A:
        SDBD                                    ; 5C4A   0001
        CMPI    #$8EC6, R1                      ; 5C4B   0379 00C6 008E
        BNC     L_5C53                          ; 5C4E   0209 0003

        CLRR    R5                              ; 5C50   01ED
        MVO     R5,     G_0171                  ; 5C51   0245 0171
L_5C53:
        MVO@    R1,     R3                      ; 5C53   0259
        MOVR    R1,     R5                      ; 5C54   008D
        SDBD                                    ; 5C55   0001
        ANDI    #$7FFF, R5                      ; 5C56   03BD 00FF 007F
        SDBD                                    ; 5C59   0001
        MVII    #$6AB3, R4                      ; 5C5A   02BC 00B3 006A
L_5C5D:
        SDBD                                    ; 5C5D   0001
        MVI@    R4,     R0                      ; 5C5E   02A0
        CMPR    R0,     R5                      ; 5C5F   0145
        BNC     L_5C89                          ; 5C60   0209 0027
        BNEQ    L_5C83                          ; 5C62   020C 001F

        SDBD                                    ; 5C64   0001
        SUBI    #$6AB5, R4                      ; 5C65   033C 00B5 006A
        MOVR    R4,     R0                      ; 5C68   00A0
        SLR     R0,     1                       ; 5C69   0060
        MOVR    R0,     R5                      ; 5C6A   0085
        ADDI    #$0107, R5                      ; 5C6B   02FD 0107
        MVI@    R5,     R1                      ; 5C6D   02A9
        CMPI    #$0004, R1                      ; 5C6E   0379 0004
        BEQ     L_5C89                          ; 5C70   0204 0017

        SDBD                                    ; 5C72   0001
        ADDI    #$6ACF, R1                      ; 5C73   02F9 00CF 006A
        MVI@    R1,     R1                      ; 5C76   0289
        DECR    R5                              ; 5C77   0015
        MVO@    R1,     R5                      ; 5C78   0269
        MVI     G_0171, R0                      ; 5C79   0280 0171
        XORI    #$0001, R0                      ; 5C7B   03F8 0001
        MVO     R0,     G_0171                  ; 5C7D   0240 0171
        CLRR    R0                              ; 5C7F   01C0
        MVO@    R0,     R3                      ; 5C80   0258
        B       L_5C89                          ; 5C81   0200 0006

L_5C83:
        SDBD                                    ; 5C83   0001
        CMPI    #$6ABC, R4                      ; 5C84   037C 00BC 006A
        BNC     L_5C5D                          ; 5C87   0229 002B

L_5C89:
        INCR    R3                              ; 5C89   000B
        CMPI    #$0359, R3                      ; 5C8A   037B 0359
        BNC     L_5C3B                          ; 5C8C   0229 0052

        ADD     G_034C, R2                      ; 5C8E   02C2 034C
        MVO     R2,     G_034C                  ; 5C90   0242 034C
L_5C92:
        MVI     G_0336, R0                      ; 5C92   0280 0336
        NEGR    R0                              ; 5C94   0020
        SLR     R0,     2                       ; 5C95   0064
        SLR     R0,     2                       ; 5C96   0064
        SLR     R0,     2                       ; 5C97   0064
        ADD     G_016C, R0                      ; 5C98   02C0 016C
        MVO     R0,     G_016D                  ; 5C9A   0240 016D
        PULR    R7                              ; 5C9C   02B7

        DECLE   $0003,  $0002,  $0001,  $0000   ; 5C9D   0003 0002 0001 0000
        DECLE   $0000,  $0001,  $0002,  $0003   ; 5CA1   0000 0001 0002 0003
        DECLE   $0018,  $00FF,  $0018,  $007E   ; 5CA5   0018 00FF 0018 007E
        DECLE   $007E,  $00FF,  $00AA,  $0055   ; 5CA9   007E 00FF 00AA 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CB1   0000 0000 0000 0000
        DECLE   $0018,  $007E,  $0018,  $007E   ; 5CB5   0018 007E 0018 007E
        DECLE   $007E,  $00FF,  $0055,  $00AA   ; 5CB9   007E 00FF 0055 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC1   0000 0000 0000 0000
        DECLE   $0018,  $003C,  $0018,  $007E   ; 5CC5   0018 003C 0018 007E
        DECLE   $007E,  $00FF,  $00AA,  $0055   ; 5CC9   007E 00FF 00AA 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD1   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0018,  $007E   ; 5CD5   0018 0018 0018 007E
        DECLE   $007E,  $00FF,  $0055,  $00AA   ; 5CD9   007E 00FF 0055 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE1   0000 0000 0000 0000
        DECLE   $000C,  $007F,  $000C,  $003F   ; 5CE5   000C 007F 000C 003F
        DECLE   $003F,  $007F,  $0055,  $002A   ; 5CE9   003F 007F 0055 002A
        DECLE   $0000,  $0080,  $0000,  $0000   ; 5CED   0000 0080 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0080   ; 5CF1   0000 0080 0000 0080
        DECLE   $000C,  $003F,  $000C,  $003F   ; 5CF5   000C 003F 000C 003F
        DECLE   $003F,  $007F,  $002A,  $0055   ; 5CF9   003F 007F 002A 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFD   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $0000   ; 5D01   0000 0080 0080 0000
        DECLE   $000C,  $001E,  $000C,  $003F   ; 5D05   000C 001E 000C 003F
        DECLE   $003F,  $007F,  $0055,  $002A   ; 5D09   003F 007F 0055 002A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0D   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0000,  $0080   ; 5D11   0000 0080 0000 0080
        DECLE   $000C,  $000C,  $000C,  $003F   ; 5D15   000C 000C 000C 003F
        DECLE   $003F,  $007F,  $002A,  $0055   ; 5D19   003F 007F 002A 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1D   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0080,  $0000   ; 5D21   0000 0080 0080 0000
        DECLE   $0006,  $003F,  $0006,  $001F   ; 5D25   0006 003F 0006 001F
        DECLE   $001F,  $003F,  $002A,  $0015   ; 5D29   001F 003F 002A 0015
        DECLE   $0000,  $00C0,  $0000,  $0080   ; 5D2D   0000 00C0 0000 0080
        DECLE   $0080,  $00C0,  $0080,  $0040   ; 5D31   0080 00C0 0080 0040
        DECLE   $0006,  $001F,  $0006,  $001F   ; 5D35   0006 001F 0006 001F
        DECLE   $001F,  $003F,  $0015,  $002A   ; 5D39   001F 003F 0015 002A
        DECLE   $0000,  $0080,  $0000,  $0080   ; 5D3D   0000 0080 0000 0080
        DECLE   $0080,  $00C0,  $0040,  $0080   ; 5D41   0080 00C0 0040 0080
        DECLE   $0006,  $000F,  $0006,  $001F   ; 5D45   0006 000F 0006 001F
        DECLE   $001F,  $003F,  $002A,  $0015   ; 5D49   001F 003F 002A 0015
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5D4D   0000 0000 0000 0080
        DECLE   $0080,  $00C0,  $0080,  $0040   ; 5D51   0080 00C0 0080 0040
        DECLE   $0006,  $0006,  $0006,  $001F   ; 5D55   0006 0006 0006 001F
        DECLE   $001F,  $003F,  $0015,  $002A   ; 5D59   001F 003F 0015 002A
        DECLE   $0000,  $0000,  $0000,  $0080   ; 5D5D   0000 0000 0000 0080
        DECLE   $0080,  $00C0,  $0040,  $0080   ; 5D61   0080 00C0 0040 0080
        DECLE   $0003,  $001F,  $0003,  $000F   ; 5D65   0003 001F 0003 000F
        DECLE   $000F,  $001F,  $0015,  $000A   ; 5D69   000F 001F 0015 000A
        DECLE   $0000,  $00E0,  $0000,  $00C0   ; 5D6D   0000 00E0 0000 00C0
        DECLE   $00C0,  $00E0,  $0040,  $00A0   ; 5D71   00C0 00E0 0040 00A0
        DECLE   $0003,  $000F,  $0003,  $000F   ; 5D75   0003 000F 0003 000F
        DECLE   $000F,  $001F,  $000A,  $0015   ; 5D79   000F 001F 000A 0015
        DECLE   $0000,  $00C0,  $0000,  $00C0   ; 5D7D   0000 00C0 0000 00C0
        DECLE   $00C0,  $00E0,  $00A0,  $0040   ; 5D81   00C0 00E0 00A0 0040
        DECLE   $0003,  $0007,  $0003,  $000F   ; 5D85   0003 0007 0003 000F
        DECLE   $000F,  $001F,  $0015,  $000A   ; 5D89   000F 001F 0015 000A
        DECLE   $0000,  $0080,  $0000,  $00C0   ; 5D8D   0000 0080 0000 00C0
        DECLE   $00C0,  $00E0,  $0040,  $00A0   ; 5D91   00C0 00E0 0040 00A0
        DECLE   $0003,  $0003,  $0003,  $000F   ; 5D95   0003 0003 0003 000F
        DECLE   $000F,  $001F,  $000A,  $0015   ; 5D99   000F 001F 000A 0015
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5D9D   0000 0000 0000 00C0
        DECLE   $00C0,  $00E0,  $00A0,  $0040   ; 5DA1   00C0 00E0 00A0 0040
        DECLE   $0001,  $000F,  $0001,  $0007   ; 5DA5   0001 000F 0001 0007
        DECLE   $0007,  $000F,  $000A,  $0005   ; 5DA9   0007 000F 000A 0005
        DECLE   $0080,  $00F0,  $0080,  $00E0   ; 5DAD   0080 00F0 0080 00E0
        DECLE   $00E0,  $00F0,  $00A0,  $0050   ; 5DB1   00E0 00F0 00A0 0050
        DECLE   $0001,  $0007,  $0001           ; 5DB5   0001 0007 0001

        SETC                                    ; 5DB8   0007
        SETC                                    ; 5DB9   0007
        INCR    R7                              ; 5DBA   000F

        DECLE   $0005                           ; 5DBB   0005
L_5DBC:
        INCR    R2                              ; 5DBC   000A
        DECLE   $0080,  $00E0,  $0080,  $00E0   ; 5DBD   0080 00E0 0080 00E0
        DECLE   $00E0,  $00F0,  $0050,  $00A0   ; 5DC1   00E0 00F0 0050 00A0
        DECLE   $0001,  $0003,  $0001,  $0007   ; 5DC5   0001 0003 0001 0007
        DECLE   $0007,  $000F,  $000A,  $0005   ; 5DC9   0007 000F 000A 0005
        DECLE   $0080,  $00C0,  $0080,  $00E0   ; 5DCD   0080 00C0 0080 00E0
        DECLE   $00E0,  $00F0,  $00A0,  $0050   ; 5DD1   00E0 00F0 00A0 0050
        DECLE   $0001,  $0001,  $0001           ; 5DD5   0001 0001 0001

        SETC                                    ; 5DD8   0007
        SETC                                    ; 5DD9   0007
        INCR    R7                              ; 5DDA   000F

        DECLE   $0005                           ; 5DDB   0005
L_5DDC:
        INCR    R2                              ; 5DDC   000A
        DECLE   $0080,  $0080,  $0080,  $00E0   ; 5DDD   0080 0080 0080 00E0
        DECLE   $00E0,  $00F0,  $0050,  $00A0   ; 5DE1   00E0 00F0 0050 00A0
        DECLE   $0000,  $0007,  $0000,  $0003   ; 5DE5   0000 0007 0000 0003
        DECLE   $0003,  $0007,  $0005,  $0002   ; 5DE9   0003 0007 0005 0002
        DECLE   $00C0,  $00F8,  $00C0,  $00F0   ; 5DED   00C0 00F8 00C0 00F0
        DECLE   $00F0,  $00F8,  $0050,  $00A8   ; 5DF1   00F0 00F8 0050 00A8
        DECLE   $0000,  $0003,  $0000,  $0003   ; 5DF5   0000 0003 0000 0003
        DECLE   $0003,  $0007,  $0002,  $0005   ; 5DF9   0003 0007 0002 0005
        DECLE   $00C0,  $00F0,  $00C0,  $00F0   ; 5DFD   00C0 00F0 00C0 00F0
        DECLE   $00F0,  $00F8,  $00A8,  $0050   ; 5E01   00F0 00F8 00A8 0050
        DECLE   $0000,  $0001,  $0000,  $0003   ; 5E05   0000 0001 0000 0003
        DECLE   $0003,  $0007,  $0005,  $0002   ; 5E09   0003 0007 0005 0002
        DECLE   $00C0,  $00E0,  $00C0,  $00F0   ; 5E0D   00C0 00E0 00C0 00F0
        DECLE   $00F0,  $00F8,  $0050,  $00A8   ; 5E11   00F0 00F8 0050 00A8
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5E15   0000 0000 0000 0003
        DECLE   $0003,  $0007,  $0002,  $0005   ; 5E19   0003 0007 0002 0005
        DECLE   $00C0,  $00C0,  $00C0,  $00F0   ; 5E1D   00C0 00C0 00C0 00F0
        DECLE   $00F0,  $00F8,  $00A8,  $0050   ; 5E21   00F0 00F8 00A8 0050
        DECLE   $0000,  $0003,  $0000,  $0001   ; 5E25   0000 0003 0000 0001
        DECLE   $0001,  $0003,  $0002,  $0001   ; 5E29   0001 0003 0002 0001
        DECLE   $0060,  $00FC,  $0060,  $00F8   ; 5E2D   0060 00FC 0060 00F8
        DECLE   $00F8,  $00FC,  $00A8,  $0054   ; 5E31   00F8 00FC 00A8 0054
        DECLE   $0000,  $0001,  $0000,  $0001   ; 5E35   0000 0001 0000 0001
        DECLE   $0001,  $0003,  $0001,  $0002   ; 5E39   0001 0003 0001 0002
        DECLE   $0060,  $00F8,  $0060,  $00F8   ; 5E3D   0060 00F8 0060 00F8
        DECLE   $00F8,  $00FC,  $0054,  $00A8   ; 5E41   00F8 00FC 0054 00A8
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5E45   0000 0000 0000 0001
        DECLE   $0001,  $0003,  $0002,  $0001   ; 5E49   0001 0003 0002 0001
        DECLE   $0060,  $00F0,  $0060,  $00F8   ; 5E4D   0060 00F0 0060 00F8
        DECLE   $00F8,  $00FC,  $00A8,  $0054   ; 5E51   00F8 00FC 00A8 0054
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5E55   0000 0000 0000 0001
        DECLE   $0001,  $0003,  $0001,  $0002   ; 5E59   0001 0003 0001 0002
        DECLE   $0060,  $0060,  $0060,  $00F8   ; 5E5D   0060 0060 0060 00F8
        DECLE   $00F8,  $00FC,  $0054,  $00A8   ; 5E61   00F8 00FC 0054 00A8
        DECLE   $0000,  $0001,  $0000,  $0000   ; 5E65   0000 0001 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0000   ; 5E69   0000 0001 0001 0000
        DECLE   $0030,  $00FE,  $0030,  $00FC   ; 5E6D   0030 00FE 0030 00FC
        DECLE   $00FC,  $00FE,  $0054,  $00AA   ; 5E71   00FC 00FE 0054 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E75   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0001   ; 5E79   0000 0001 0000 0001
        DECLE   $0030,  $00FC,  $0030,  $00FC   ; 5E7D   0030 00FC 0030 00FC
        DECLE   $00FC,  $00FE,  $00AA,  $0054   ; 5E81   00FC 00FE 00AA 0054
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E85   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0000   ; 5E89   0000 0001 0001 0000
        DECLE   $0030,  $0078,  $0030,  $00FC   ; 5E8D   0030 0078 0030 00FC
        DECLE   $00FC,  $00FE,  $0054,  $00AA   ; 5E91   00FC 00FE 0054 00AA
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E95   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0001   ; 5E99   0000 0001 0000 0001
        DECLE   $0030,  $0030,  $0030,  $00FC   ; 5E9D   0030 0030 0030 00FC
        DECLE   $00FC,  $00FE,  $00AA,  $0054   ; 5EA1   00FC 00FE 00AA 0054
        DECLE   $0003,  $0007,  $000F,  $000F   ; 5EA5   0003 0007 000F 000F
        DECLE   $001F,  $001F,  $007F,  $00FF   ; 5EA9   001F 001F 007F 00FF
        DECLE   $0080,  $00F0,  $00F8,  $00FC   ; 5EAD   0080 00F0 00F8 00FC
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 5EB1   00FE 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB5   0000 0000 0000 0000
        DECLE   $0030,  $0078,  $00FE,  $00FF   ; 5EB9   0030 0078 00FE 00FF
        DECLE   $0000,  $0000,  $0000,  $000E   ; 5EBD   0000 0000 0000 000E
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 5EC1   001F 003F 007F 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC5   0000 0000 0000 0000
        DECLE   $0080,  $00F0,  $00FE,  $00FF   ; 5EC9   0080 00F0 00FE 00FF
        DECLE   $0001,  $0003,  $0007,  $0007   ; 5ECD   0001 0003 0007 0007
        DECLE   $000F,  $000F,  $003F,  $00FF   ; 5ED1   000F 000F 003F 00FF
        DECLE   $00C0,  $00F8,  $00FC,  $00FE   ; 5ED5   00C0 00F8 00FC 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5ED9   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDD   0000 0000 0000 0000
        DECLE   $0018,  $00BC,  $00FF,  $00FF   ; 5EE1   0018 00BC 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0007   ; 5EE5   0000 0000 0000 0007
        DECLE   $000F,  $001F,  $003F,  $00FF   ; 5EE9   000F 001F 003F 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EED   0000 0000 0000 0000
        DECLE   $00C0,  $00F8,  $00FF,  $00FF   ; 5EF1   00C0 00F8 00FF 00FF
        DECLE   $0000,  $0001                   ; 5EF5   0000 0001

        DIS                                     ; 5EF7   0003
        DIS                                     ; 5EF8   0003
        SETC                                    ; 5EF9   0007
        SETC                                    ; 5EFA   0007
        MOVR    R3,     R7                      ; 5EFB   009F

        DECLE   $00FF,  $00E0,  $00FC,  $00FE   ; 5EFC   00FF 00E0 00FC 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F00   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F04   00FF 0000 0000 0000
        DECLE   $0000,  $008C,  $00DE,  $00FF   ; 5F08   0000 008C 00DE 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F0C   00FF 0000 0000 0000
        DECLE   $0003,  $0007,  $000F,  $009F   ; 5F10   0003 0007 000F 009F
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F14   00FF 0000 0000 0000
        DECLE   $0080,  $00E0,  $00FC,  $00FF   ; 5F18   0080 00E0 00FC 00FF
        DECLE   $00FF,  $0000,  $0000,  $0001   ; 5F1C   00FF 0000 0000 0001
        DECLE   $0001                           ; 5F20   0001

        DIS                                     ; 5F21   0003
        DIS                                     ; 5F22   0003
        ADDR    R1,     R7                      ; 5F23   00CF

        DECLE   $00FF,  $0070,  $00FE,  $00FF   ; 5F24   00FF 0070 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F28   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F2C   00FF 0000 0000 0000

        TSTR    R0                              ; 5F30   0080
        ADDR    R0,     R6                      ; 5F31   00C6
        ADDR    R5,     R7                      ; 5F32   00EF

        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 5F33   00FF 00FF 0000 0000
        DECLE   $0000,  $0001                   ; 5F37   0000 0001

        DIS                                     ; 5F39   0003
        SETC                                    ; 5F3A   0007
        ADDR    R1,     R7                      ; 5F3B   00CF

        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F3C   00FF 0000 0000 0000
        DECLE   $00C0,  $00F0,  $00FE,  $00FF   ; 5F40   00C0 00F0 00FE 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F44   00FF 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $00E7   ; 5F48   0000 0001 0001 00E7
        DECLE   $00FF,  $0038,  $007F,  $00FF   ; 5F4C   00FF 0038 007F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F50   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0080   ; 5F54   00FF 0000 0000 0080
        DECLE   $00C0,  $00E3,  $00F7,  $00FF   ; 5F58   00C0 00E3 00F7 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F5C   00FF 0000 0000 0000
        DECLE   $0000,  $0001                   ; 5F60   0000 0001

        MOVR    R0,     R3                      ; 5F62   0083
        ADDR    R4,     R7                      ; 5F63   00E7

        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F64   00FF 0000 0000 0000
        DECLE   $00E0,  $00F8,  $00FF,  $00FF   ; 5F68   00E0 00F8 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F6C   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $00F3   ; 5F70   0000 0000 0080 00F3
        DECLE   $00FF,  $001C,  $003F,  $007F   ; 5F74   00FF 001C 003F 007F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5F78   007F 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0080,  $00C0   ; 5F7C   00FF 0000 0080 00C0
        DECLE   $00E0,  $00F1,  $00FB,  $00FF   ; 5F80   00E0 00F1 00FB 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F84   00FF 0000 0000 0000
        DECLE   $0000,  $0080,  $00C1,  $00F3   ; 5F88   0000 0080 00C1 00F3
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F8C   00FF 0000 0000 0000
        DECLE   $0070,  $00FC,  $00FF,  $00FF   ; 5F90   0070 00FC 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F94   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $00F9   ; 5F98   0000 0000 00C0 00F9
        DECLE   $00FF,  $000E,  $001F,  $003F   ; 5F9C   00FF 000E 001F 003F
        DECLE   $003F,  $007F,  $007F,  $00FF   ; 5FA0   003F 007F 007F 00FF
        DECLE   $00FF,  $0000,  $00C0,  $00E0   ; 5FA4   00FF 0000 00C0 00E0
        DECLE   $00F0,  $00F8,  $00FD,  $00FF   ; 5FA8   00F0 00F8 00FD 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5FAC   00FF 0000 0000 0000
        DECLE   $0000,  $00C0,  $00E0,  $00F9   ; 5FB0   0000 00C0 00E0 00F9
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5FB4   00FF 0000 0000 0000
        DECLE   $0038,  $007E,  $00FF,  $00FF   ; 5FB8   0038 007E 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5FBC   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $00FC   ; 5FC0   0000 0000 00E0 00FC
        DECLE   $00FF,  $0007,  $000F,  $001F   ; 5FC4   00FF 0007 000F 001F
        DECLE   $001F,  $003F,  $003F,  $00FF   ; 5FC8   001F 003F 003F 00FF
        DECLE   $00FF,  $0000,  $00E0,  $00F0   ; 5FCC   00FF 0000 00E0 00F0
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 5FD0   00F8 00FC 00FE 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5FD4   00FF 0000 0000 0000
        DECLE   $0000,  $0060,  $00F0,  $00FC   ; 5FD8   0000 0060 00F0 00FC
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5FDC   00FF 0000 0000 0000
        DECLE   $001C,  $003F,  $007F,  $00FF   ; 5FE0   001C 003F 007F 00FF
        DECLE   $00FF,  $003B,  $00FF,  $00E3   ; 5FE4   00FF 003B 00FF 00E3
        DECLE   $00FF,  $00F8,  $00FC,  $0000   ; 5FE8   00FF 00F8 00FC 0000
        DECLE   $0000,  $00F8,  $00FF,  $001D   ; 5FEC   0000 00F8 00FF 001D
        DECLE   $007F,  $00F1,  $00FF,  $00FC   ; 5FF0   007F 00F1 00FF 00FC
        DECLE   $00FE,  $0000,  $0000,  $00FC   ; 5FF4   00FE 0000 0000 00FC
        DECLE   $007F,  $000E,  $003F,  $00F8   ; 5FF8   007F 000E 003F 00F8
        DECLE   $00FF,  $00FE,  $00FF,  $0000   ; 5FFC   00FF 00FE 00FF 0000
        DECLE   $0000,  $00FE,  $003F,  $0007   ; 6000   0000 00FE 003F 0007
        DECLE   $001F,  $007C,  $00FF,  $007F   ; 6004   001F 007C 00FF 007F
        DECLE   $00FF,  $0000,  $0080,  $00FF   ; 6008   00FF 0000 0080 00FF
        DECLE   $001F,  $0003,  $000F,  $00BE   ; 600C   001F 0003 000F 00BE
        DECLE   $00FF,  $003F,  $00FF,  $0080   ; 6010   00FF 003F 00FF 0080
        DECLE   $00C0,  $00FF,  $008F,  $0001   ; 6014   00C0 00FF 008F 0001

        SETC                                    ; 6018   0007
        ADDR    R3,     R7                      ; 6019   00DF

        DECLE   $00FF,  $001F,  $00FF,  $00C0   ; 601A   00FF 001F 00FF 00C0
        DECLE   $00E0,  $00FF,  $00C7,  $0000   ; 601E   00E0 00FF 00C7 0000

        DIS                                     ; 6022   0003
        ADDR    R5,     R7                      ; 6023   00EF

        DECLE   $00FF,  $008F,  $00FF,  $00E0   ; 6024   00FF 008F 00FF 00E0
        DECLE   $00F0,  $00FF,  $00E3,  $0000   ; 6028   00F0 00FF 00E3 0000
        DECLE   $0001,  $0077,  $00FF,  $00C7   ; 602C   0001 0077 00FF 00C7
        DECLE   $00FF,  $00F0,  $00F8,  $00FF   ; 6030   00FF 00F0 00F8 00FF

        ADDR    R6,     R1                      ; 6034   00F1
L_6035:
        PSHR    R5                              ; 6035   0275
        MVI     G_0115, R3                      ; 6036   0283 0115
        MVI     G_0112, R0                      ; 6038   0280 0112
        MVI     G_0113, R1                      ; 603A   0281 0113
        MVO     R0,     G_0113                  ; 603C   0240 0113
        SUBR    R0,     R1                      ; 603E   0101
        BNEQ    L_604B                          ; 603F   020C 000A

        CMPI    #$00FA, R3                      ; 6041   037B 00FA
        BPL     L_604C                          ; 6043   0203 0007

        INCR    R3                              ; 6045   000B
        MVI     G_032D, R0                      ; 6046   0280 032D
        TSTR    R0                              ; 6048   0080
        BNEQ    L_604C                          ; 6049   020C 0001

L_604B:
        CLRR    R3                              ; 604B   01DB
L_604C:
        MVO     R3,     G_0115                  ; 604C   0243 0115
        MVI     G_032D, R2                      ; 604E   0282 032D
        MVI     G_032E, R0                      ; 6050   0280 032E
        CMPR    R2,     R0                      ; 6052   0150
        BEQ     L_6081                          ; 6053   0204 002C

        JSR     R5,     X_UNPK_BYTES            ; 6055   0004 0114 0357

        MOVR    R0,     R3                      ; 6058   0083
        MOVR    R1,     R4                      ; 6059   008C
        MOVR    R2,     R0                      ; 605A   0090

        JSR     R5,     X_UNPK_BYTES            ; 605B   0004 0114 0357

        MOVR    R3,     R5                      ; 605E   009D
        MVII    #$0001, R2                      ; 605F   02BA 0001
        SUBR    R0,     R3                      ; 6061   0103
        BPL     L_6066                          ; 6062   0203 0002

        NEGR    R2                              ; 6064   0022
        NEGR    R3                              ; 6065   0023
L_6066:
        CMPI    #$0001, R3                      ; 6066   037B 0001
        BPL     L_606C                          ; 6068   0203 0002

        MOVR    R5,     R0                      ; 606A   00A8
        INCR    R7                              ; 606B   000F

L_606C:
        ADDR    R2,     R0                      ; 606C   00D0
L_606D:
        MOVR    R4,     R5                      ; 606D   00A5
        MVII    #$0002, R2                      ; 606E   02BA 0002
        SUBR    R1,     R4                      ; 6070   010C
        BPL     L_6075                          ; 6071   0203 0002

        NEGR    R2                              ; 6073   0022
        NEGR    R4                              ; 6074   0024
L_6075:
        CMPI    #$0002, R4                      ; 6075   037C 0002
        BPL     L_607B                          ; 6077   0203 0002

        MOVR    R5,     R1                      ; 6079   00A9
        INCR    R7                              ; 607A   000F

L_607B:
        ADDR    R2,     R1                      ; 607B   00D1

L_607C:
        JSR     R5,     X_PACK_BYTES            ; 607C   0004 0114 034F

        MVO     R0,     G_032D                  ; 607F   0240 032D
L_6081:
        PULR    R7                              ; 6081   02B7

L_6082:
        PSHR    R5                              ; 6082   0275
        MVI     G_015F, R0                      ; 6083   0280 015F
        TSTR    R0                              ; 6085   0080
        BMI     L_6095                          ; 6086   020B 000D
        BEQ     L_6095                          ; 6088   0204 000B

        MVII    #$0107, R4                      ; 608A   02BC 0107
L_608C:
        MVI@    R4,     R1                      ; 608C   02A1
        CMPI    #$0004, R1                      ; 608D   0379 0004
        BNC     L_60AC                          ; 608F   0209 001B

        CMPI    #$010B, R4                      ; 6091   037C 010B
        BNC     L_608C                          ; 6093   0229 0008

L_6095:
        MVI     G_0176, R0                      ; 6095   0280 0176
        ADD     G_0178, R0                      ; 6097   02C0 0178
        BNEQ    L_60AC                          ; 6099   020C 0011

        MVI     G_0131, R0                      ; 609B   0280 0131
        CMPI    #$0001, R0                      ; 609D   0378 0001
        BNEQ    L_60AC                          ; 609F   020C 000B

        CLRR    R0                              ; 60A1   01C0
        MVO     R0,     G_032E                  ; 60A2   0240 032E
        DECR    R0                              ; 60A4   0010

        JSR     R5,     L_6C4D                  ; 60A5   0004 016C 004D

        MVII    #$0002, R1                      ; 60A8   02B9 0002
        MVO     R1,     G_0131                  ; 60AA   0241 0131
L_60AC:
        PULR    R7                              ; 60AC   02B7

L_60AD:
        PSHR    R5                              ; 60AD   0275
        MVI     G_0339, R0                      ; 60AE   0280 0339
        SWAP    R0,     1                       ; 60B0   0040
        SLR     R0,     2                       ; 60B1   0064
        SLR     R0,     2                       ; 60B2   0064
        ANDI    #$0003, R0                      ; 60B3   03B8 0003
        MVII    #$0006, R3                      ; 60B5   02BB 0006
        CMPI    #$0001, R0                      ; 60B7   0378 0001
        BPL     L_60D0                          ; 60B9   0203 0015

        MVI     G_017A, R5                      ; 60BB   0285 017A
        TSTR    R5                              ; 60BD   00AD
        BNEQ    L_60C8                          ; 60BE   020C 0008

        MVI     G_0131, R4                      ; 60C0   0284 0131
        DECR    R4                              ; 60C2   0014
        BNEQ    L_60C8                          ; 60C3   020C 0003

        INCR    R5                              ; 60C5   000D
        MVO     R5,     G_017A                  ; 60C6   0245 017A
L_60C8:
        MVI     G_033A, R5                      ; 60C8   0285 033A
        ANDI    #$0010, R5                      ; 60CA   03BD 0010
        BEQ     L_60D0                          ; 60CC   0204 0002

        MVII    #$0002, R3                      ; 60CE   02BB 0002
L_60D0:
        MVII    #$02DF, R4                      ; 60D0   02BC 02DF
        SDBD                                    ; 60D2   0001
        MVII    #$0698, R1                      ; 60D3   02B9 0098 0006
        XORR    R3,     R1                      ; 60D6   01D9
L_60D7:
        DECR    R0                              ; 60D7   0010
        BMI     L_60DD                          ; 60D8   020B 0003

        MVO@    R1,     R4                      ; 60DA   0261
        B       L_60D7                          ; 60DB   0220 0005

L_60DD:
        SDBD                                    ; 60DD   0001
        MVII    #$0850, R1                      ; 60DE   02B9 0050 0008
        XORR    R3,     R1                      ; 60E1   01D9
        MVO@    R1,     R4                      ; 60E2   0261
        CLRR    R1                              ; 60E3   01C9
L_60E4:
        CMPI    #$02E3, R4                      ; 60E4   037C 02E3
        BPL     L_60EB                          ; 60E6   0203 0003

        MVO@    R1,     R4                      ; 60E8   0261
        B       L_60E4                          ; 60E9   0220 0006
L_60EB:
        PULR    R7                              ; 60EB   02B7

L_60EC:
        PSHR    R5                              ; 60EC   0275
        MVI     G_033D, R0                      ; 60ED   0280 033D
        DECR    R0                              ; 60EF   0010
        BMI     L_6100                          ; 60F0   020B 000E

        MVO     R0,     G_033D                  ; 60F2   0240 033D
        BNEQ    L_6100                          ; 60F4   020C 000A

        MVI     G_033C, R3                      ; 60F6   0283 033C
        MVI@    R3,     R0                      ; 60F8   0298
        CMPI    #$0003, R0                      ; 60F9   0378 0003
        BPL     L_6100                          ; 60FB   0203 0003

        MVII    #$0002, R0                      ; 60FD   02B8 0002
        MVO@    R0,     R3                      ; 60FF   0258
L_6100:
        MVI     G_0334, R1                      ; 6100   0281 0334
        CLRR    R3                              ; 6102   01DB
L_6103:
        TSTR    R1                              ; 6103   0089
        BMI     L_610F                          ; 6104   020B 0009

        CMPI    #$0040, R1                      ; 6106   0379 0040
        BNC     L_6114                          ; 6108   0209 000A

        SUBI    #$0040, R1                      ; 610A   0339 0040
        INCR    R3                              ; 610C   000B
        B       L_6103                          ; 610D   0220 000B

L_610F:
        ADDI    #$0040, R1                      ; 610F   02F9 0040
        DECR    R3                              ; 6111   0013
        B       L_6103                          ; 6112   0220 0010

L_6114:
        MVO     R1,     G_0334                  ; 6114   0241 0334
        MVI     G_0330, R0                      ; 6116   0280 0330
        SUBR    R3,     R0                      ; 6118   0118
        MVO     R0,     G_0330                  ; 6119   0240 0330
        MVI     G_0126, R1                      ; 611B   0281 0126
        MVI     G_016A, R2                      ; 611D   0282 016A
        MVO     R1,     G_016A                  ; 611F   0241 016A
        SUBR    R2,     R1                      ; 6121   0111
        MVII    #$031D, R4                      ; 6122   02BC 031D
        MVII    #$0004, R3                      ; 6124   02BB 0004
L_6126:
        MVI@    R4,     R0                      ; 6126   02A0
        DECR    R4                              ; 6127   0014
        ADDR    R1,     R0                      ; 6128   00C8
        MVO@    R0,     R4                      ; 6129   0260
        DECR    R3                              ; 612A   0013
        BPL     L_6126                          ; 612B   0223 0006

        MVI     G_012A, R2                      ; 612D   0282 012A
        SDBD                                    ; 612F   0001
        ADDI    #$6FF0, R2                      ; 6130   02FA 00F0 006F
        MVI@    R2,     R2                      ; 6133   0292
        DECR    R2                              ; 6134   0012
        BMI     L_61EA                          ; 6135   020B 00B3

        MVI     G_0338, R2                      ; 6137   0282 0338
        SUB     G_0168, R2                      ; 6139   0302 0168
        BEQ     L_6146                          ; 613B   0204 0009

        MVI     G_0169, R2                      ; 613D   0282 0169
        CMPI    #$0004, R2                      ; 613F   037A 0004
        BNEQ    L_6146                          ; 6141   020C 0003

        JSR     R5,     L_633B                  ; 6143   0004 0160 033B

L_6146:
        MVI     G_012A, R2                      ; 6146   0282 012A
        SDBD                                    ; 6148   0001
        ADDI    #$6FF0, R2                      ; 6149   02FA 00F0 006F
        MVI@    R2,     R2                      ; 614C   0292
        ADDI    #$0106, R2                      ; 614D   02FA 0106
        MVI@    R2,     R5                      ; 614F   0295
        CMPI    #$0001, R5                      ; 6150   037D 0001
        BEQ     L_6165                          ; 6152   0204 0011

        CMPI    #$0003, R5                      ; 6154   037D 0003
        BNEQ    L_6177                          ; 6156   020C 001F

        MVII    #$0001, R0                      ; 6158   02B8 0001
        MVO     R0,     G_0178                  ; 615A   0240 0178
        DECR    R0                              ; 615C   0010
        MVO     R0,     G_0176                  ; 615D   0240 0176
        MVI     G_012A, R0                      ; 615F   0280 012A
        MVO     R0,     G_0179                  ; 6161   0240 0179
        B       L_6177                          ; 6163   0200 0012

L_6165:
        MVII    #$001F, R1                      ; 6165   02B9 001F
        MVO     R1,     G_017D                  ; 6167   0241 017D
        SDBD                                    ; 6169   0001
        MVII    #$FF00, R2                      ; 616A   02BA 0000 00FF
        MVO     R2,     G_0353                  ; 616D   0242 0353
        MVII    #$0001, R0                      ; 616F   02B8 0001
        MVO     R0,     G_0176                  ; 6171   0240 0176
        MVI     G_012A, R0                      ; 6173   0280 012A
        MVO     R0,     G_0177                  ; 6175   0240 0177
L_6177:
        MVI     G_016B, R3                      ; 6177   0283 016B
        XORI    #$0001, R3                      ; 6179   03FB 0001
        MVO     R3,     G_016B                  ; 617B   0243 016B
        BEQ     L_61E8                          ; 617D   0204 0069

        MVI     G_0176, R3                      ; 617F   0283 0176
        TSTR    R3                              ; 6181   009B
        BNEQ    L_6197                          ; 6182   020C 0013

        TSTR    R5                              ; 6184   00AD
        BNEQ    L_61F3                          ; 6185   020C 006C

        SDBD                                    ; 6187   0001
        MVII    #$1980, R0                      ; 6188   02B8 0080 0019
        MVO     R0,     G_0329                  ; 618B   0240 0329
        MVO     R0,     G_032C                  ; 618D   0240 032C
        ADDI    #$0010, R0                      ; 618F   02F8 0010
        MVO     R0,     G_032A                  ; 6191   0240 032A
        MVO     R0,     G_032B                  ; 6193   0240 032B
        B       L_61F3                          ; 6195   0200 005C

L_6197:
        MVI     G_012A, R0                      ; 6197   0280 012A
        SUB     G_0177, R0                      ; 6199   0300 0177
        BNEQ    L_61F3                          ; 619B   020C 0056

        MVII    #$0007, R1                      ; 619D   02B9 0007
        SDBD                                    ; 619F   0001
        MVII    #$05A0, R0                      ; 61A0   02B8 00A0 0005
        XORR    R1,     R0                      ; 61A3   01C8
        MVO     R0,     G_0329                  ; 61A4   0240 0329
        MVO     R0,     G_032C                  ; 61A6   0240 032C
        SDBD                                    ; 61A8   0001
        MVII    #$0590, R0                      ; 61A9   02B8 0090 0005
        XORR    R1,     R0                      ; 61AC   01C8
        MVO     R0,     G_032A                  ; 61AD   0240 032A
        MVO     R0,     G_032B                  ; 61AF   0240 032B
        MVI     G_0176, R3                      ; 61B1   0283 0176
        SLR     R3,     2                       ; 61B3   0067
        MOVR    R3,     R2                      ; 61B4   009A
        CMPI    #$0010, R2                      ; 61B5   037A 0010
        BNC     L_61BC                          ; 61B7   0209 0003

        SUBI    #$0020, R2                      ; 61B9   033A 0020
        NEGR    R2                              ; 61BB   0022
L_61BC:
        SDBD                                    ; 61BC   0001
        ADDI    #$62B9, R2                      ; 61BD   02FA 00B9 0062
        MVI@    R2,     R2                      ; 61C0   0292
        NEGR    R3                              ; 61C1   0023
        MVII    #$031D, R4                      ; 61C2   02BC 031D
        MVII    #$0323, R5                      ; 61C4   02BD 0323
L_61C6:
        CMPI    #$031F, R4                      ; 61C6   037C 031F
        BNEQ    L_61CB                          ; 61C8   020C 0001

        NEGR    R3                              ; 61CA   0023
L_61CB:
        MVI@    R4,     R1                      ; 61CB   02A1
        DECR    R4                              ; 61CC   0014
        ADDR    R3,     R1                      ; 61CD   00D9
        ADDR    R3,     R1                      ; 61CE   00D9
        MVI@    R5,     R0                      ; 61CF   02A8
        SUBR    R2,     R0                      ; 61D0   0110
        DECR    R5                              ; 61D1   0015
        CMPI    #$0323, R5                      ; 61D2   037D 0323
        BEQ     L_61DC                          ; 61D4   0204 0006

        CMPI    #$0326, R5                      ; 61D6   037D 0326
        BEQ     L_61DC                          ; 61D8   0204 0002

        SUBR    R2,     R0                      ; 61DA   0110
        SUBR    R3,     R1                      ; 61DB   0119
L_61DC:
        SDBD                                    ; 61DC   0001
        ANDI    #$FF7F, R0                      ; 61DD   03B8 007F 00FF
        MVO@    R0,     R5                      ; 61E0   0268
        MVO@    R1,     R4                      ; 61E1   0261
        CMPI    #$0321, R4                      ; 61E2   037C 0321
        BNC     L_61C6                          ; 61E4   0229 001F
        B       L_61F3                          ; 61E6   0200 000B
L_61E8:
        B       L_61F0                          ; 61E8   0200 0006

L_61EA:
        MVI     G_033A, R1                      ; 61EA   0281 033A
        ANDI    #$0007, R1                      ; 61EC   03B9 0007
        BNEQ    L_61F3                          ; 61EE   020C 0003

L_61F0:
        JSR     R5,     L_633B                  ; 61F0   0004 0160 033B

L_61F3:
        MVII    #$0107, R4                      ; 61F3   02BC 0107
L_61F5:
        MVI@    R4,     R1                      ; 61F5   02A1
        CMPI    #$0001, R1                      ; 61F6   0379 0001
        BEQ     L_6202                          ; 61F8   0204 0008

        CMPI    #$0003, R1                      ; 61FA   0379 0003
        BNEQ    L_6205                          ; 61FC   020C 0007

        MVII    #$0001, R3                      ; 61FE   02BB 0001
        MVO     R3,     G_017C                  ; 6200   0243 017C
L_6202:
        INCR    R1                              ; 6202   0009
        DECR    R4                              ; 6203   0014
        MVO@    R1,     R4                      ; 6204   0261
L_6205:
        CMPI    #$010B, R4                      ; 6205   037C 010B
        BNC     L_61F5                          ; 6207   0229 0013

        MVI     G_0176, R3                      ; 6209   0283 0176
        TSTR    R3                              ; 620B   009B
        BEQ     L_621C                          ; 620C   0204 000E

        MVI     G_033A, R1                      ; 620E   0281 033A
        ANDI    #$0001, R1                      ; 6210   03B9 0001
        BEQ     L_621C                          ; 6212   0204 0008

        INCR    R3                              ; 6214   000B
        CMPI    #$0080, R3                      ; 6215   037B 0080
        BNC     L_621A                          ; 6217   0209 0001

        CLRR    R3                              ; 6219   01DB
L_621A:
        MVO     R3,     G_0176                  ; 621A   0243 0176
L_621C:
        MVI     G_0338, R2                      ; 621C   0282 0338
        SDBD                                    ; 621E   0001
        CMPI    #$6FB6, R2                      ; 621F   037A 00B6 006F
        BNEQ    L_6240                          ; 6222   020C 001C

        MVI     G_0176, R2                      ; 6224   0282 0176
        TSTR    R2                              ; 6226   0092
        BEQ     L_622E                          ; 6227   0204 0005

        MVI     G_016B, R2                      ; 6229   0282 016B
        TSTR    R2                              ; 622B   0092
        BNEQ    L_6240                          ; 622C   020C 0012

L_622E:
        MVII    #$0329, R4                      ; 622E   02BC 0329
        MVI     G_033A, R2                      ; 6230   0282 033A
        ANDI    #$0007, R2                      ; 6232   03BA 0007
L_6234:
        MVI@    R4,     R0                      ; 6234   02A0
        DECR    R4                              ; 6235   0014
        SDBD                                    ; 6236   0001
        ANDI    #$FFF8, R0                      ; 6237   03B8 00F8 00FF
        XORR    R2,     R0                      ; 623A   01D0
        MVO@    R0,     R4                      ; 623B   0260
        CMPI    #$032D, R4                      ; 623C   037C 032D
        BNC     L_6234                          ; 623E   0229 000B

L_6240:
        MVI     G_0178, R3                      ; 6240   0283 0178
        DECLE   $009B,  $0204,  $0073,  $0282   ; 6242   009B 0204 0073 0282
        DECLE   $016B,  $0092,  $020C,  $006E   ; 6246   016B 0092 020C 006E
        DECLE   $0285,  $0178,  $000D,  $0245   ; 624A   0285 0178 000D 0245
        DECLE   $0178,  $037D,  $0046,  $0203   ; 624E   0178 037D 0046 0203
        DECLE   $0055,  $0281,  $012A,  $0301   ; 6252   0055 0281 012A 0301
        DECLE   $0179,  $020C,  $005F,  $00A9   ; 6256   0179 020C 005F 00A9
        DECLE   $0065,  $0088,  $00C8,  $00C8   ; 625A   0065 0088 00C8 00C8
        DECLE   $0240,  $0174,  $03BD,  $000F   ; 625E   0240 0174 03BD 000F
        DECLE   $0001                           ; 6262   0001

        MVII    #$00CC, R4                      ; 6263   02BC 00CC
        SLR     R2,     1                       ; 6265   0062
L_6266:
        MVI@    R4,     R0                      ; 6266   02A0
        MVI@    R4,     R1                      ; 6267   02A1
        MVI@    R4,     R2                      ; 6268   02A2
        SDBD                                    ; 6269   0001
        MVI@    R4,     R3                      ; 626A   02A3
        TSTR    R0                              ; 626B   0080
        BEQ     L_62B8                          ; 626C   0204 004A

        CMPR    R0,     R5                      ; 626E   0145
        BNC     L_6266                          ; 626F   0229 000A

        CMPR    R1,     R5                      ; 6271   014D
        BPL     L_6266                          ; 6272   0223 000D

        MOVR    R2,     R0                      ; 6274   0090
        ADD     G_0174, R0                      ; 6275   02C0 0174
        ANDI    #$0003, R0                      ; 6277   03B8 0003
        MVII    #$0329, R1                      ; 6279   02B9 0329
        ADDR    R0,     R1                      ; 627B   00C1
        MVO@    R3,     R1                      ; 627C   024B
        MOVR    R2,     R1                      ; 627D   0091
        ANDI    #$0004, R1                      ; 627E   03B9 0004
        BEQ     L_6291                          ; 6280   0204 000F

        MVII    #$031D, R3                      ; 6282   02BB 031D
        ADDR    R0,     R3                      ; 6284   00C3
        MVI@    R3,     R1                      ; 6285   0299
        SUBI    #$0004, R1                      ; 6286   0339 0004
        SDBD                                    ; 6288   0001
        ANDI    #$FBFF, R1                      ; 6289   03B9 00FF 00FB
        SDBD                                    ; 628C   0001
        XORI    #$0400, R1                      ; 628D   03F9 0000 0004
        MVO@    R1,     R3                      ; 6290   0259
L_6291:
        MVII    #$0323, R3                      ; 6291   02BB 0323
        ADDR    R0,     R3                      ; 6293   00C3
        MVI@    R3,     R1                      ; 6294   0299
        SDBD                                    ; 6295   0001
        ANDI    #$FC7F, R1                      ; 6296   03B9 007F 00FC
        XORI    #$0100, R1                      ; 6299   03F9 0100
        SUBI    #$0004, R1                      ; 629B   0339 0004
        ANDI    #$0008, R2                      ; 629D   03BA 0008
        BEQ     L_62A5                          ; 629F   0204 0004

        XORI    #$0300, R1                      ; 62A1   03F9 0300
        SUBI    #$0004, R1                      ; 62A3   0339 0004
L_62A5:
        MVO@    R1,     R3                      ; 62A5   0259
        B       L_6266                          ; 62A6   0220 0041

        MVII    #$001F, R1                      ; 62A8   02B9 001F
        MVO     R1,     G_017D                  ; 62AA   0241 017D
        SDBD                                    ; 62AC   0001
        MVII    #$FF00, R2                      ; 62AD   02BA 0000 00FF
        MVO     R2,     G_0353                  ; 62B0   0242 0353
        CLRR    R1                              ; 62B2   01C9
        MVO     R1,     G_0178                  ; 62B3   0241 0178

        JSR     R5,     L_63ED                  ; 62B5   0004 0160 03ED

L_62B8:
        PULR    R7                              ; 62B8   02B7

        DECLE   $0000,  $0002,  $0005           ; 62B9   0000 0002 0005

        SETC                                    ; 62BC   0007
        INCR    R1                              ; 62BD   0009
        INCR    R3                              ; 62BE   000B
        INCR    R4                              ; 62BF   000C
        INCR    R6                              ; 62C0   000E
        INCR    R7                              ; 62C1   000F

        DECR    R0                              ; 62C2   0010
L_62C3:
        DECR    R1                              ; 62C3   0011
        DECLE   $0012,  $0012,  $0013,  $0013   ; 62C4   0012 0012 0013 0013
        DECLE   $0013,  $0013,  $0013,  $0013   ; 62C8   0013 0013 0013 0013
        DECLE   $0003,  $0008,  $0001,  $0037   ; 62CC   0003 0008 0001 0037
        DECLE   $0005,  $0008,  $000C,  $0001   ; 62D0   0005 0008 000C 0001
        DECLE   $0047,  $0005                   ; 62D4   0047 0005

        INCR    R4                              ; 62D6   000C
        INCR    R7                              ; 62D7   000F

        DECLE   $0001                           ; 62D8   0001
L_62D9:
        RLC     R3,     2                       ; 62D9   0057
        DECLE   $0005,  $0005,  $0008,  $0003   ; 62DA   0005 0005 0008 0003
        DECLE   $0036,  $0005,  $0008,  $000B   ; 62DE   0036 0005 0008 000B
        DECLE   $0003,  $0046,  $0005,  $000B   ; 62E2   0003 0046 0005 000B
        DECLE   $000E,  $0003,  $0056,  $0005   ; 62E6   000E 0003 0056 0005
        DECLE   $0003,  $0005,  $0002,  $0051   ; 62EA   0003 0005 0002 0051
        DECLE   $0000,  $0005,  $0007,  $0002   ; 62EE   0000 0005 0007 0002
        DECLE   $0053,  $0000,  $0007,  $0009   ; 62F2   0053 0000 0007 0009
        DECLE   $0002,  $0051,  $0000,  $000B   ; 62F6   0002 0051 0000 000B
        DECLE   $000D,  $0002,  $0053,  $0000   ; 62FA   000D 0002 0053 0000

        INCR    R5                              ; 62FE   000D
        INCR    R7                              ; 62FF   000F

        EIS                                     ; 6300   0002
L_6301:
        RLC     R1,     1                       ; 6301   0051
        DECLE   $0000,  $0003,  $0005,  $0004   ; 6302   0000 0003 0005 0004
        DECLE   $0057,  $0000,  $0005,  $0007   ; 6306   0057 0000 0005 0007
        DECLE   $0004,  $0052,  $0000,  $0007   ; 630A   0004 0052 0000 0007
        DECLE   $0009,  $0004,  $0057,  $0000   ; 630E   0009 0004 0057 0000
        DECLE   $000B,  $000D,  $0004,  $0052   ; 6312   000B 000D 0004 0052
        DECLE   $0000                           ; 6316   0000

        INCR    R5                              ; 6317   000D
        INCR    R7                              ; 6318   000F

        DECLE   $0004                           ; 6319   0004
L_631A:
        RLC     R3,     2                       ; 631A   0057
        DECLE   $0000,  $0000                   ; 631B   0000 0000

        PSHR    R5                              ; 631D   0275
        MVII    #$031D, R5                      ; 631E   02BD 031D
        MVI     G_0126, R1                      ; 6320   0281 0126
        MVO     R1,     G_016A                  ; 6322   0241 016A
        XORI    #$0200, R1                      ; 6324   03F9 0200
        MVO@    R1,     R5                      ; 6326   0269
        ADDI    #$0008, R1                      ; 6327   02F9 0008
        MVO@    R1,     R5                      ; 6329   0269
        ADDI    #$0008, R1                      ; 632A   02F9 0008
        MVO@    R1,     R5                      ; 632C   0269
        ADDI    #$0008, R1                      ; 632D   02F9 0008
        MVO@    R1,     R5                      ; 632F   0269
        SDBD                                    ; 6330   0001
        MVII    #$0050, R1                      ; 6331   02B9 0050 0000
        ADDI    #$0005, R5                      ; 6334   02FD 0005
        MVO@    R1,     R5                      ; 6336   0269
        MVO@    R1,     R5                      ; 6337   0269
        MVO@    R1,     R5                      ; 6338   0269
        MVO@    R1,     R5                      ; 6339   0269
        PULR    R7                              ; 633A   02B7

L_633B:
        PSHR    R5                              ; 633B   0275
        MVI     G_0338, R4                      ; 633C   0284 0338
        ADDI    #$0008, R4                      ; 633E   02FC 0008
        MVII    #$031D, R2                      ; 6340   02BA 031D
L_6342:
        MVI@    R4,     R3                      ; 6342   02A3
        MVI@    R4,     R5                      ; 6343   02A5
        MVI     G_0126, R0                      ; 6344   0280 0126
        MOVR    R5,     R1                      ; 6346   00A9
        SLR     R1,     2                       ; 6347   0065
        SLR     R1,     2                       ; 6348   0065
        SLR     R1,     1                       ; 6349   0061
        ANDI    #$001F, R1                      ; 634A   03B9 001F
        ADDR    R1,     R0                      ; 634C   00C8
        ANDI    #$00FF, R0                      ; 634D   03B8 00FF
        XORI    #$0300, R0                      ; 634F   03F8 0300
        MOVR    R3,     R1                      ; 6351   0099
        SDBD                                    ; 6352   0001
        ANDI    #$0200, R1                      ; 6353   03B9 0000 0002
        SLL     R1,     1                       ; 6356   0049
        XORR    R1,     R0                      ; 6357   01C8
        MVO@    R0,     R2                      ; 6358   0250
        ADDI    #$0006, R2                      ; 6359   02FA 0006
        SDBD                                    ; 635B   0001
        MVII    #$0046, R0                      ; 635C   02B8 0046 0000
        MOVR    R5,     R1                      ; 635F   00A9
        ANDI    #$001F, R1                      ; 6360   03B9 001F
        ADDR    R1,     R0                      ; 6362   00C8
        ANDI    #$007F, R0                      ; 6363   03B8 007F
        MOVR    R3,     R1                      ; 6365   0099
        SDBD                                    ; 6366   0001
        ANDI    #$01F0, R1                      ; 6367   03B9 00F0 0001
        SLL     R1,     2                       ; 636A   004D
        SLL     R1,     1                       ; 636B   0049
        XORR    R1,     R0                      ; 636C   01C8
        MVO@    R0,     R2                      ; 636D   0250
        ADDI    #$0006, R2                      ; 636E   02FA 0006
        MOVR    R2,     R0                      ; 6370   0090
        SUBI    #$0329, R0                      ; 6371   0338 0329
        SLL     R0,     1                       ; 6373   0048
        SDBD                                    ; 6374   0001
        ADDI    #$0038, R0                      ; 6375   02F8 0038 0000
        SLL     R0,     2                       ; 6378   004C
        SLL     R0,     1                       ; 6379   0048
        SDBD                                    ; 637A   0001
        XORI    #$0800, R0                      ; 637B   03F8 0000 0008
        MOVR    R3,     R1                      ; 637E   0099
        ANDI    #$0007, R1                      ; 637F   03B9 0007
        XORR    R1,     R0                      ; 6381   01C8
        MVO@    R0,     R2                      ; 6382   0250
        SDBD                                    ; 6383   0001
        ADDI    #$FFF5, R2                      ; 6384   02FA 00F5 00FF
        CMPI    #$0321, R2                      ; 6387   037A 0321
        BNC     L_6342                          ; 6389   0229 0048

        MVI     G_0126, R1                      ; 638B   0281 0126
        MVO     R1,     G_016A                  ; 638D   0241 016A
        PULR    R7                              ; 638F   02B7

L_6390:
        PSHR    R5                              ; 6390   0275
        MVI     G_0330, R1                      ; 6391   0281 0330
        SUBI    #$001E, R1                      ; 6393   0339 001E
        CLRR    R0                              ; 6395   01C0
L_6396:
        ADDI    #$000A, R0                      ; 6396   02F8 000A
        SDBD                                    ; 6398   0001
        SUBI    #$0870, R1                      ; 6399   0339 0070 0008
        BPL     L_6396                          ; 639C   0223 0007

        SUBI    #$000A, R0                      ; 639E   0338 000A
        SDBD                                    ; 63A0   0001
        ADDI    #$0870, R1                      ; 63A1   02F9 0070 0008
        DECR    R0                              ; 63A4   0010
L_63A5:
        INCR    R0                              ; 63A5   0008
        SUBI    #$00D8, R1                      ; 63A6   0339 00D8
        BPL     L_63A5                          ; 63A8   0223 0004

        MVO     R0,     G_012A                  ; 63AA   0240 012A
        NEGR    R1                              ; 63AC   0021
        SUBI    #$0019, R1                      ; 63AD   0339 0019
        MVO     R1,     G_0126                  ; 63AF   0241 0126
        MVI     G_012A, R3                      ; 63B1   0283 012A
        CMPI    #$0009, R3                      ; 63B3   037B 0009
        BNEQ    L_63C9                          ; 63B5   020C 0012

        SUBI    #$0008, R3                      ; 63B7   033B 0008
        MVI     G_0330, R5                      ; 63B9   0285 0330
        SDBD                                    ; 63BB   0001
        SUBI    #$06C0, R5                      ; 63BC   033D 00C0 0006
        MVO     R5,     G_0330                  ; 63BF   0245 0330
        MVI     G_0331, R5                      ; 63C1   0285 0331
        SUBI    #$00D8, R5                      ; 63C3   033D 00D8
        MVO     R5,     G_0331                  ; 63C5   0245 0331
        B       L_63DD                          ; 63C7   0200 0014

L_63C9:
        CMPI    #$0000, R3                      ; 63C9   037B 0000
        BNEQ    L_63DD                          ; 63CB   020C 0010

        ADDI    #$0008, R3                      ; 63CD   02FB 0008
        MVI     G_0330, R5                      ; 63CF   0285 0330
        SDBD                                    ; 63D1   0001
        ADDI    #$06C0, R5                      ; 63D2   02FD 00C0 0006
        MVO     R5,     G_0330                  ; 63D5   0245 0330
        MVI     G_0331, R5                      ; 63D7   0285 0331
        ADDI    #$00D8, R5                      ; 63D9   02FD 00D8
        MVO     R5,     G_0331                  ; 63DB   0245 0331
L_63DD:
        MVO     R3,     G_012A                  ; 63DD   0243 012A
        MVI     G_012B, R5                      ; 63DF   0285 012B
        MVO     R3,     G_012B                  ; 63E1   0243 012B
        CMPR    R3,     R5                      ; 63E3   015D
        BEQ     L_63EC                          ; 63E4   0204 0006

        JSR     R5,     L_63ED                  ; 63E6   0004 0160 03ED
        JSR     R5,     L_633B                  ; 63E9   0004 0160 033B

L_63EC:
        PULR    R7                              ; 63EC   02B7

L_63ED:
        PSHR    R5                              ; 63ED   0275
        MVI     G_012A, R3                      ; 63EE   0283 012A
        SDBD                                    ; 63F0   0001
        ADDI    #$6FDA, R3                      ; 63F1   02FB 00DA 006F
        MVI@    R3,     R2                      ; 63F4   029A
        SLL     R2,     1                       ; 63F5   004A
        SDBD                                    ; 63F6   0001
        ADDI    #$6FD6, R2                      ; 63F7   02FA 00D6 006F
        MOVR    R2,     R4                      ; 63FA   0094
        SDBD                                    ; 63FB   0001
        MVI@    R4,     R3                      ; 63FC   02A3
        MVI     G_012A, R2                      ; 63FD   0282 012A
        SDBD                                    ; 63FF   0001
        ADDI    #$6FF0, R2                      ; 6400   02FA 00F0 006F
        MVI@    R2,     R2                      ; 6403   0292
        DECR    R2                              ; 6404   0012
        BMI     L_6412                          ; 6405   020B 000B

        ADDI    #$0107, R2                      ; 6407   02FA 0107
        MVI@    R2,     R2                      ; 6409   0292
        CMPI    #$0004, R2                      ; 640A   037A 0004
        BNEQ    L_6412                          ; 640C   020C 0004

        SDBD                                    ; 640E   0001
        MVII    #$6FB6, R3                      ; 640F   02BB 00B6 006F
L_6412:
        MVO     R3,     G_0338                  ; 6412   0243 0338
        PULR    R7                              ; 6414   02B7

L_6415:
        PSHR    R5                              ; 6415   0275
        MVI     G_0167, R2                      ; 6416   0282 0167
        DECR    R2                              ; 6418   0012
        BMI     L_6451                          ; 6419   020B 0036

        DECR    R2                              ; 641B   0012
        MOVR    R2,     R5                      ; 641C   0095
        ADD     G_0166, R2                      ; 641D   02C2 0166
        CMPI    #$0065, R2                      ; 641F   037A 0065
        BPL     L_6425                          ; 6421   0203 0002

        MVII    #$0004, R5                      ; 6423   02BD 0004
L_6425:
        CMPI    #$0069, R2                      ; 6425   037A 0069
        BLT     L_642C                          ; 6427   0205 0003

        MVII    #$0004, R5                      ; 6429   02BD 0004
        NEGR    R5                              ; 642B   0025
L_642C:
        SDBD                                    ; 642C   0001
        MVII    #$6FE3, R4                      ; 642D   02BC 00E3 006F
        MVI     G_0166, R2                      ; 6430   0282 0166
        ADDI    #$019C, R2                      ; 6432   02FA 019C
L_6434:
        MVI@    R4,     R1                      ; 6434   02A1
        TSTR    R1                              ; 6435   0089
        BEQ     L_644B                          ; 6436   0204 0013

        ADDR    R2,     R1                      ; 6438   00D1
        MVI@    R1,     R0                      ; 6439   0288
        SDBD                                    ; 643A   0001
        ANDI    #$07F8, R0                      ; 643B   03B8 00F8 0007
        SDBD                                    ; 643E   0001
        CMPI    #$0060, R0                      ; 643F   0378 0060 0000
        BNEQ    L_6434                          ; 6442   022C 000F

        MVI@    R1,     R3                      ; 6444   028B
        CLRR    R0                              ; 6445   01C0
        MVO@    R0,     R1                      ; 6446   0248
        ADDR    R5,     R1                      ; 6447   00E9
        MVO@    R3,     R1                      ; 6448   024B
        B       L_6434                          ; 6449   0220 0016

L_644B:
        MVO     R1,     G_0167                  ; 644B   0241 0167
        ADD     G_0166, R5                      ; 644D   02C5 0166
        MVO     R5,     G_0166                  ; 644F   0245 0166
L_6451:
        PULR    R7                              ; 6451   02B7

L_6452:
        PSHR    R5                              ; 6452   0275
        MVI     G_0172, R0                      ; 6453   0280 0172
        TSTR    R0                              ; 6455   0080
        BNEQ    L_64E8                          ; 6456   020C 0090

        MVII    #$010E, R4                      ; 6458   02BC 010E
        SDBD                                    ; 645A   0001
        MVI@    R4,     R2                      ; 645B   02A2
        SDBD                                    ; 645C   0001
        MVI@    R4,     R3                      ; 645D   02A3
        MVI     G_032D, R0                      ; 645E   0280 032D

        JSR     R5,     X_UNPK_BYTES            ; 6460   0004 0114 0357

        MOVR    R0,     R4                      ; 6463   0084
        SAR     R0,     2                       ; 6464   006C
        MVI     G_0115, R5                      ; 6465   0285 0115
L_6467:
        ADDR    R0,     R4                      ; 6467   00C4
        SUBI    #$0030, R5                      ; 6468   033D 0030
        BPL     L_6467                          ; 646A   0223 0004

        MOVR    R4,     R0                      ; 646C   00A0
        PSHR    R3                              ; 646D   0273
        PSHR    R0                              ; 646E   0270
        MOVR    R0,     R3                      ; 646F   0083
        SAR     R0,     1                       ; 6470   0068
        ADDR    R0,     R3                      ; 6471   00C3
        ADDR    R3,     R3                      ; 6472   00DB
        MVO     R3,     G_032F                  ; 6473   0243 032F
        PULR    R0                              ; 6475   02B0
        MOVR    R2,     R3                      ; 6476   0093
        SWAP    R3,     1                       ; 6477   0043
        ANDI    #$00FF, R3                      ; 6478   03BB 00FF
        MVI     G_0112, R5                      ; 647A   0285 0112
        TSTR    R5                              ; 647C   00AD
        BEQ     L_648D                          ; 647D   0204 000E

        SDBD                                    ; 647F   0001
        CMPI    #$002C, R3                      ; 6480   037B 002C 0000
        BEQ     L_6497                          ; 6483   0204 0012
        BNC     L_6497                          ; 6485   0209 0010

        ADDI    #$0016, R0                      ; 6487   02F8 0016
        SUBI    #$010E, R2                      ; 6489   033A 010E
        B       L_6497                          ; 648B   0200 000A

L_648D:
        SDBD                                    ; 648D   0001
        CMPI    #$0081, R3                      ; 648E   037B 0081 0000
        BPL     L_6497                          ; 6491   0203 0004

        SUBI    #$0016, R0                      ; 6493   0338 0016
        ADDI    #$010E, R2                      ; 6495   02FA 010E
L_6497:
        PULR    R3                              ; 6497   02B3
        ADDR    R0,     R0                      ; 6498   00C0
        MVI     G_0337, R5                      ; 6499   0285 0337
        SUBR    R0,     R5                      ; 649B   0105
        SUBR    R0,     R5                      ; 649C   0105
        MVO     R5,     G_0337                  ; 649D   0245 0337
        MVI     G_0334, R5                      ; 649F   0285 0334
        SUBR    R0,     R5                      ; 64A1   0105
        SAR     R0,     1                       ; 64A2   0068
        SUBR    R0,     R5                      ; 64A3   0105
        MVO     R5,     G_0334                  ; 64A4   0245 0334
        MVI     G_0336, R5                      ; 64A6   0285 0336
        ADDR    R0,     R5                      ; 64A8   00C5
        ADDR    R0,     R5                      ; 64A9   00C5
        ADDR    R0,     R5                      ; 64AA   00C5
        MVO     R5,     G_0336                  ; 64AB   0245 0336
        MVI     G_0333, R5                      ; 64AD   0285 0333
        SUBR    R0,     R5                      ; 64AF   0105
        SAR     R0,     1                       ; 64B0   0068
        SUBR    R0,     R5                      ; 64B1   0105
        MVO     R5,     G_0333                  ; 64B2   0245 0333
        MVI     G_0335, R5                      ; 64B4   0285 0335
        SUBR    R0,     R5                      ; 64B6   0105
        SAR     R0,     1                       ; 64B7   0068
        SUBR    R0,     R5                      ; 64B8   0105
        MVO     R5,     G_0335                  ; 64B9   0245 0335
        ADDR    R1,     R1                      ; 64BB   00C9
        ADDR    R1,     R1                      ; 64BC   00C9
        ADDR    R1,     R1                      ; 64BD   00C9
        ADDR    R1,     R3                      ; 64BE   00CB
        MVII    #$010E, R4                      ; 64BF   02BC 010E
        MVO@    R2,     R4                      ; 64C1   0262
        SWAP    R2,     1                       ; 64C2   0042
        ANDI    #$00FF, R2                      ; 64C3   03BA 00FF
        MOVR    R2,     R0                      ; 64C5   0090

        JSR     R5,     X_CLAMP                 ; 64C6   0004 0114 0270

        ADCR    R4                              ; 64C9   002C
        MOVR    R0,     R1                      ; 64CA   0081
        MVO@    R0,     R4                      ; 64CB   0260
        XORI    #$0300, R0                      ; 64CC   03F8 0300
        MVO     R0,     G_0318                  ; 64CE   0240 0318
        MVO@    R3,     R4                      ; 64D0   0263
        SWAP    R3,     1                       ; 64D1   0043
        ANDI    #$00FF, R2                      ; 64D2   03BA 00FF
        ANDI    #$007F, R3                      ; 64D4   03BB 007F
        MOVR    R3,     R0                      ; 64D6   0098

        JSR     R5,     X_CLAMP                 ; 64D7   0004 0114 0270

        INCR    R1                              ; 64DA   0009
        SWAP    R3,     1                       ; 64DB   0043
        MVO@    R0,     R4                      ; 64DC   0260
        MVI     G_0112, R1                      ; 64DD   0281 0112
        TSTR    R1                              ; 64DF   0089
        BEQ     L_64E6                          ; 64E0   0204 0004

        SDBD                                    ; 64E2   0001
        XORI    #$0400, R0                      ; 64E3   03F8 0000 0004
L_64E6:
        MVO     R0,     G_0319                  ; 64E6   0240 0319
L_64E8:
        PULR    R7                              ; 64E8   02B7

L_64E9:
        PSHR    R5                              ; 64E9   0275
        MVII    #$01DB, R4                      ; 64EA   02BC 01DB
L_64EC:
        MVI@    R4,     R3                      ; 64EC   02A3
        MOVR    R3,     R0                      ; 64ED   0098
        ANDI    #$0080, R0                      ; 64EE   03B8 0080
        BEQ     L_656F                          ; 64F0   0204 007D

        PSHR    R4                              ; 64F2   0274
        ADDI    #$0003, R4                      ; 64F3   02FC 0003
        MVI@    R4,     R2                      ; 64F5   02A2
        CLRR    R0                              ; 64F6   01C0
        ADDI    #$0200, R2                      ; 64F7   02FA 0200
        MVI@    R2,     R5                      ; 64F9   0295
        ANDI    #$0007, R5                      ; 64FA   03BD 0007
        CMPI    #$0006, R5                      ; 64FC   037D 0006
        BNEQ    L_6501                          ; 64FE   020C 0001

        MVO@    R0,     R2                      ; 6500   0250
L_6501:
        SUBI    #$0200, R2                      ; 6501   033A 0200
        ANDI    #$0010, R3                      ; 6503   03BB 0010
        BEQ     L_6510                          ; 6505   0204 0009

        INCR    R2                              ; 6507   000A

        JSR     R5,     L_6574                  ; 6508   0004 0164 0174

        TSTR    R0                              ; 650B   0080
        BEQ     L_6552                          ; 650C   0204 0044
        B       L_6517                          ; 650E   0200 0007

L_6510:
        JSR     R5,     L_6574                  ; 6510   0004 0164 0174

        TSTR    R0                              ; 6513   0080
        BEQ     L_6552                          ; 6514   0204 003C

        DECR    R2                              ; 6516   0012
L_6517:
        DECR    R4                              ; 6517   0014
        MVO@    R2,     R4                      ; 6518   0262
        ADDI    #$0200, R2                      ; 6519   02FA 0200
        MVI@    R2,     R3                      ; 651B   0293
        SDBD                                    ; 651C   0001
        ANDI    #$4000, R3                      ; 651D   03BB 0000 0040
        BEQ     L_6558                          ; 6520   0204 0036

        CLRR    R3                              ; 6522   01DB
        MVO@    R3,     R2                      ; 6523   0253
        SUBI    #$0200, R2                      ; 6524   033A 0200
        MVII    #$0001, R1                      ; 6526   02B9 0001
        MVO     R1,     G_017B                  ; 6528   0241 017B
        MVII    #$0032, R1                      ; 652A   02B9 0032

        JSR     R5,     L_51D2                  ; 652C   0004 0150 01D2

        MVII    #$01D4, R4                      ; 652F   02BC 01D4
L_6531:
        MVI@    R4,     R0                      ; 6531   02A0
        TSTR    R0                              ; 6532   0080
        BEQ     L_653B                          ; 6533   0204 0006

        CMPI    #$01D8, R4                      ; 6535   037C 01D8
        BNC     L_6531                          ; 6537   0229 0007
        B       L_6542                          ; 6539   0200 0007

L_653B:
        DECR    R4                              ; 653B   0014
        MVII    #$0001, R0                      ; 653C   02B8 0001
        MVO@    R0,     R4                      ; 653E   0260
        SUBI    #$0005, R4                      ; 653F   033C 0005
        MVO@    R2,     R4                      ; 6541   0262
L_6542:
        MVII    #$0180, R4                      ; 6542   02BC 0180
L_6544:
        MVI@    R4,     R0                      ; 6544   02A0
        CMPR    R0,     R2                      ; 6545   0142
        BEQ     L_654E                          ; 6546   0204 0006

        CMPI    #$0190, R4                      ; 6548   037C 0190
        BNC     L_6544                          ; 654A   0229 0007
        B       L_6552                          ; 654C   0200 0004

L_654E:
        ADDI    #$000F, R4                      ; 654E   02FC 000F
        CLRR    R0                              ; 6550   01C0
        MVO@    R0,     R4                      ; 6551   0260
L_6552:
        PULR    R4                              ; 6552   02B4
        DECR    R4                              ; 6553   0014
        CLRR    R0                              ; 6554   01C0
        MVO@    R0,     R4                      ; 6555   0260
        B       L_656F                          ; 6556   0200 0017

L_6558:
        PULR    R4                              ; 6558   02B4
        MVI@    R2,     R0                      ; 6559   0290
        SDBD                                    ; 655A   0001
        ANDI    #$8000, R0                      ; 655B   03B8 0000 0080
        BNEQ    L_656F                          ; 655E   020C 000F

        DECR    R4                              ; 6560   0014
        MOVR    R4,     R5                      ; 6561   00A5
        ADDI    #$0004, R5                      ; 6562   02FD 0004
        MVI@    R4,     R1                      ; 6564   02A1
        ANDI    #$0007, R1                      ; 6565   03B9 0007
        SLL     R1,     2                       ; 6567   004D
        SLL     R1,     1                       ; 6568   0049
        SDBD                                    ; 6569   0001
        ADDI    #$08E6, R1                      ; 656A   02F9 00E6 0008
        MVO@    R1,     R2                      ; 656D   0251
        MVO@    R2,     R5                      ; 656E   026A
L_656F:
        CMPI    #$01DF, R4                      ; 656F   037C 01DF
        BNC     L_64EC                          ; 6571   0229 0086
        PULR    R7                              ; 6573   02B7

L_6574:
        PSHR    R2                              ; 6574   0272
        PSHR    R4                              ; 6575   0274
        CLRR    R0                              ; 6576   01C0
        TSTR    R2                              ; 6577   0092
        BEQ     L_6586                          ; 6578   0204 000C

        MOVR    R2,     R4                      ; 657A   0094
        ANDI    #$0003, R4                      ; 657B   03BC 0003
        BNEQ    L_6585                          ; 657D   020C 0006

L_657F:
        SUBI    #$0014, R2                      ; 657F   033A 0014
        BEQ     L_6586                          ; 6581   0204 0003
        BPL     L_657F                          ; 6583   0223 0005

L_6585:
        INCR    R0                              ; 6585   0008
L_6586:
        PULR    R4                              ; 6586   02B4
        PULR    R2                              ; 6587   02B2
        MOVR    R5,     R7                      ; 6588   00AF

L_6589:
        PSHR    R5                              ; 6589   0275
        MVI     G_0135, R0                      ; 658A   0280 0135
        TSTR    R0                              ; 658C   0080
        BEQ     L_6665                          ; 658D   0204 00D6

        MVI     G_033A, R0                      ; 658F   0280 033A
        ANDI    #$0001, R0                      ; 6591   03B8 0001
        BEQ     L_6665                          ; 6593   0204 00D0

        MVI     G_0340, R0                      ; 6595   0280 0340
        SUB     G_032F, R0                      ; 6597   0300 032F
        ADDR    R0,     R0                      ; 6599   00C0
        ADDR    R0,     R0                      ; 659A   00C0
        ADDR    R0,     R0                      ; 659B   00C0
        ADD     G_033F, R0                      ; 659C   02C0 033F
        MVO     R0,     G_033F                  ; 659E   0240 033F
        SWAP    R0,     1                       ; 65A0   0040
        ADD     G_010F, R0                      ; 65A1   02C0 010F
        XORI    #$0300, R0                      ; 65A3   03F8 0300
        MVO     R0,     G_031B                  ; 65A5   0240 031B
        ANDI    #$00E0, R0                      ; 65A7   03B8 00E0
        SUBI    #$00C0, R0                      ; 65A9   0338 00C0
        BEQ     L_6662                          ; 65AB   0204 00B5

        SDBD                                    ; 65AD   0001
        MVII    #$09A7, R1                      ; 65AE   02B9 00A7 0009
        MVO     R1,     G_0327                  ; 65B1   0241 0327
        MVI     G_0135, R0                      ; 65B3   0280 0135
        ADDI    #$0004, R0                      ; 65B5   02F8 0004
        MVO     R0,     G_0135                  ; 65B7   0240 0135
        MOVR    R0,     R1                      ; 65B9   0081
        ANDI    #$007F, R1                      ; 65BA   03B9 007F
        CMPI    #$0054, R1                      ; 65BC   0379 0054
        BPL     L_65D7                          ; 65BE   0203 0017

        MOVR    R0,     R1                      ; 65C0   0081
        ANDI    #$0080, R1                      ; 65C1   03B9 0080
        SLL     R1,     2                       ; 65C3   004D
        SLL     R1,     1                       ; 65C4   0049
        ANDI    #$007F, R0                      ; 65C5   03B8 007F
        XORR    R1,     R0                      ; 65C7   01C8
        MVO     R0,     G_0321                  ; 65C8   0240 0321
        MVI     G_033A, R1                      ; 65CA   0281 033A
        SLL     R1,     1                       ; 65CC   0049
        ANDI    #$0018, R1                      ; 65CD   03B9 0018
        SDBD                                    ; 65CF   0001
        ADDI    #$67F1, R1                      ; 65D0   02F9 00F1 0067
        MVO     R1,     G_0341                  ; 65D3   0241 0341
        B       L_6696                          ; 65D5   0200 00BF

L_65D7:
        PSHR    R0                              ; 65D7   0270
        CMPI    #$0054, R1                      ; 65D8   0379 0054
        BNEQ    L_6634                          ; 65DA   020C 0058

        CLRR    R0                              ; 65DC   01C0
        MVO     R0,     G_0340                  ; 65DD   0240 0340
        CLRR    R0                              ; 65DF   01C0
        MVO     R0,     G_0170                  ; 65E0   0240 0170
        MVI     G_031B, R3                      ; 65E2   0283 031B
        SUBI    #$0004, R3                      ; 65E4   033B 0004
        ANDI    #$00FF, R3                      ; 65E6   03BB 00FF
        SLR     R3,     2                       ; 65E8   0067
        SLR     R3,     1                       ; 65E9   0063
        ADDI    #$02B4, R3                      ; 65EA   02FB 02B4
        MVI@    R3,     R3                      ; 65EC   029B
        SDBD                                    ; 65ED   0001
        CMPI    #$1894, R3                      ; 65EE   037B 0094 0018
        BEQ     L_65FB                          ; 65F1   0204 0008

        SDBD                                    ; 65F3   0001
        CMPI    #$189C, R3                      ; 65F4   037B 009C 0018
        BEQ     L_65FB                          ; 65F7   0204 0002
        B       L_6634                          ; 65F9   0200 0039

L_65FB:
        MVII    #$0359, R5                      ; 65FB   02BD 0359
        SDBD                                    ; 65FD   0001
        MVII    #$0FFF, R2                      ; 65FE   02BA 00FF 000F
        MVI     G_031B, R3                      ; 6601   0283 031B
        ADDI    #$0004, R3                      ; 6603   02FB 0004
        ANDI    #$00FF, R3                      ; 6605   03BB 00FF
        SLR     R3,     2                       ; 6607   0067
        SLR     R3,     1                       ; 6608   0063
        NEGR    R3                              ; 6609   0023
        SUB     G_0332, R3                      ; 660A   0303 0332
        MVII    #$0355, R4                      ; 660C   02BC 0355
L_660E:
        MVI@    R4,     R0                      ; 660E   02A0
        TSTR    R0                              ; 660F   0080
        BPL     L_661F                          ; 6610   0203 000D

        SDBD                                    ; 6612   0001
        ANDI    #$7FFF, R0                      ; 6613   03B8 00FF 007F
        ADDR    R3,     R0                      ; 6616   00D8
        BPL     L_661A                          ; 6617   0203 0001

        NEGR    R0                              ; 6619   0020
L_661A:
        CMPR    R2,     R0                      ; 661A   0150
        BPL     L_661F                          ; 661B   0203 0002

        MOVR    R4,     R5                      ; 661D   00A5
        MOVR    R0,     R2                      ; 661E   0082
L_661F:
        CMPI    #$0359, R4                      ; 661F   037C 0359
        BNC     L_660E                          ; 6621   0229 0014

        CLRR    R2                              ; 6623   01D2
        DECR    R5                              ; 6624   0015
        MVO@    R2,     R5                      ; 6625   026A
        INCR    R2                              ; 6626   000A
        MVO     R2,     G_0170                  ; 6627   0242 0170
        MVO     R2,     G_034B                  ; 6629   0242 034B
        PSHR    R1                              ; 662B   0271

        JSR     R5,     L_51D0                  ; 662C   0004 0150 01D0

        PULR    R1                              ; 662F   02B1
        MVII    #$0001, R2                      ; 6630   02BA 0001
        MVO     R2,     G_017B                  ; 6632   0242 017B
L_6634:
        PULR    R0                              ; 6634   02B0
        CMPI    #$0068, R1                      ; 6635   0379 0068
        BPL     L_6662                          ; 6637   0203 0029

        ANDI    #$0080, R0                      ; 6639   03B8 0080
        SLL     R0,     2                       ; 663B   004C
        SLL     R0,     1                       ; 663C   0048
        MVII    #$0054, R2                      ; 663D   02BA 0054
        XORR    R0,     R2                      ; 663F   01C2
        MVO     R2,     G_0321                  ; 6640   0242 0321
        MVI     G_0170, R5                      ; 6642   0285 0170
        TSTR    R5                              ; 6644   00AD
        BEQ     L_6657                          ; 6645   0204 0010

        SUBI    #$0008, R2                      ; 6647   033A 0008
        XORI    #$0200, R2                      ; 6649   03FA 0200
        MVO     R2,     G_0321                  ; 664B   0242 0321
        MVI     G_031B, R2                      ; 664D   0282 031B
        SUBI    #$0004, R2                      ; 664F   033A 0004
        SDBD                                    ; 6651   0001
        XORI    #$0400, R2                      ; 6652   03FA 0000 0004
        MVO     R2,     G_031B                  ; 6655   0242 031B
L_6657:
        SUBI    #$0054, R1                      ; 6657   0339 0054
        SLL     R1,     1                       ; 6659   0049
        SDBD                                    ; 665A   0001
        ADDI    #$6769, R1                      ; 665B   02F9 0069 0067
        MVO     R1,     G_0341                  ; 665E   0241 0341
        B       L_6696                          ; 6660   0200 0034

L_6662:
        CLRR    R0                              ; 6662   01C0
        MVO     R0,     G_0135                  ; 6663   0240 0135
L_6665:
        MVI     G_033A, R0                      ; 6665   0280 033A
        ANDI    #$0007, R0                      ; 6667   03B8 0007
        BNEQ    L_667A                          ; 6669   020C 000F

        MVI     G_0111, R1                      ; 666B   0281 0111
        SLR     R1,     2                       ; 666D   0065
        SLR     R1,     1                       ; 666E   0061
        MVO     R1,     G_0134                  ; 666F   0241 0134
        MVI     G_0330, R1                      ; 6671   0281 0330

        JSR     R5,     L_693F                  ; 6673   0004 0168 013F

        ADDI    #$0043, R0                      ; 6676   02F8 0043
        MVO     R0,     G_0133                  ; 6678   0240 0133
L_667A:
        MVI     G_0133, R0                      ; 667A   0280 0133
        XORI    #$0300, R0                      ; 667C   03F8 0300
        MVO     R0,     G_031B                  ; 667E   0240 031B
        MVI     G_0134, R0                      ; 6680   0280 0134
        SLR     R0,     1                       ; 6682   0060
        ADDI    #$0060, R0                      ; 6683   02F8 0060
        MVI     G_0112, R1                      ; 6685   0281 0112
        TSTR    R1                              ; 6687   0089
        BNEQ    L_668E                          ; 6688   020C 0004

        SDBD                                    ; 668A   0001
        XORI    #$0400, R0                      ; 668B   03F8 0000 0004
L_668E:
        MVO     R0,     G_0321                  ; 668E   0240 0321
        SDBD                                    ; 6690   0001
        MVII    #$180D, R0                      ; 6691   02B8 000D 0018
        MVO     R0,     G_0327                  ; 6694   0240 0327
L_6696:
        MVI     G_0129, R0                      ; 6696   0280 0129
        TSTR    R0                              ; 6698   0080
        BEQ     L_6768                          ; 6699   0204 00CD

        MVI     G_0175, R0                      ; 669B   0280 0175
        TSTR    R0                              ; 669D   0080
        BNEQ    L_6738                          ; 669E   020C 0098

        MVI     G_0347, R4                      ; 66A0   0284 0347
        MOVR    R4,     R3                      ; 66A2   00A3
        TSTR    R3                              ; 66A3   009B
        BPL     L_66A7                          ; 66A4   0203 0001

        NEGR    R3                              ; 66A6   0023
L_66A7:
        ADD     G_0127, R3                      ; 66A7   02C3 0127
        MOVR    R3,     R0                      ; 66A9   0098
        ANDI    #$000F, R0                      ; 66AA   03B8 000F
        MVO     R0,     G_0127                  ; 66AC   0240 0127
        SDBD                                    ; 66AE   0001
        ANDI    #$FFF0, R3                      ; 66AF   03BB 00F0 00FF
        BEQ     L_66BE                          ; 66B2   0204 000A

        SLR     R3,     2                       ; 66B4   0067
        SLR     R3,     2                       ; 66B5   0067
        TSTR    R4                              ; 66B6   00A4
        BPL     L_66BA                          ; 66B7   0203 0001

        NEGR    R3                              ; 66B9   0023
L_66BA:
        ADD     G_0345, R3                      ; 66BA   02C3 0345
        MVO     R3,     G_0345                  ; 66BC   0243 0345
L_66BE:
        MVI     G_0348, R4                      ; 66BE   0284 0348
        MOVR    R4,     R3                      ; 66C0   00A3
        TSTR    R3                              ; 66C1   009B
        BPL     L_66C5                          ; 66C2   0203 0001

        NEGR    R3                              ; 66C4   0023
L_66C5:
        ADD     G_0128, R3                      ; 66C5   02C3 0128
        MOVR    R3,     R0                      ; 66C7   0098
        ANDI    #$000F, R0                      ; 66C8   03B8 000F
        MVO     R0,     G_0128                  ; 66CA   0240 0128
        SDBD                                    ; 66CC   0001
        ANDI    #$FFF0, R3                      ; 66CD   03BB 00F0 00FF
        BEQ     L_66DC                          ; 66D0   0204 000A

        SLR     R3,     2                       ; 66D2   0067
        SLR     R3,     2                       ; 66D3   0067
        TSTR    R4                              ; 66D4   00A4
        BPL     L_66D8                          ; 66D5   0203 0001

        NEGR    R3                              ; 66D7   0023
L_66D8:
        ADD     G_0346, R3                      ; 66D8   02C3 0346
        MVO     R3,     G_0346                  ; 66DA   0243 0346
L_66DC:
        MVI     G_0330, R3                      ; 66DC   0283 0330
        MVI     G_0345, R4                      ; 66DE   0284 0345
        SUBR    R3,     R4                      ; 66E0   011C
        BMI     L_670D                          ; 66E1   020B 002A

        CMPI    #$00AA, R4                      ; 66E3   037C 00AA
        BPL     L_670D                          ; 66E5   0203 0026

        XORI    #$0300, R4                      ; 66E7   03FC 0300
        MVO     R4,     G_031C                  ; 66E9   0244 031C
        MVI     G_0346, R0                      ; 66EB   0280 0346
        XORI    #$0080, R0                      ; 66ED   03F8 0080
        MVO     R0,     G_0322                  ; 66EF   0240 0322
        MVI     G_0129, R0                      ; 66F1   0280 0129
        DECR    R0                              ; 66F3   0010
        BNEQ    L_6758                          ; 66F4   020C 0062

        SDBD                                    ; 66F6   0001
        MVII    #$09B7, R0                      ; 66F7   02B8 00B7 0009
        MVO     R0,     G_0328                  ; 66FA   0240 0328
        MVI     G_0322, R0                      ; 66FC   0280 0322
        SDBD                                    ; 66FE   0001
        ANDI    #$FF7F, R0                      ; 66FF   03B8 007F 00FF
        BMI     L_670D                          ; 6702   020B 0009

        ANDI    #$007F, R0                      ; 6704   03B8 007F
        MVI     G_0319, R1                      ; 6706   0281 0319
        ANDI    #$007F, R1                      ; 6708   03B9 007F
        CMPR    R1,     R0                      ; 670A   0148
        BPL     L_6768                          ; 670B   0203 005B

L_670D:
        MVII    #$001F, R0                      ; 670D   02B8 001F
        MVO     R0,     G_017D                  ; 670F   0240 017D
        SDBD                                    ; 6711   0001
        MVII    #$6000, R0                      ; 6712   02B8 0000 0060
        MVO     R0,     G_0353                  ; 6715   0240 0353
        MVI     G_0322, R0                      ; 6717   0280 0322
        MVI     G_033A, R1                      ; 6719   0281 033A
        SWAP    R1,     1                       ; 671B   0041
        SDBD                                    ; 671C   0001
        ANDI    #$0C00, R1                      ; 671D   03B9 0000 000C
        XORR    R1,     R0                      ; 6720   01C8
        MVO     R0,     G_0322                  ; 6721   0240 0322
        MVI     G_0328, R0                      ; 6723   0280 0328
        SDBD                                    ; 6725   0001
        ANDI    #$FFF8, R0                      ; 6726   03B8 00F8 00FF
        MVI     G_033A, R1                      ; 6729   0281 033A
        ANDI    #$0007, R1                      ; 672B   03B9 0007
        SDBD                                    ; 672D   0001
        ADDI    #$6791, R1                      ; 672E   02F9 0091 0067
        XOR@    R1,     R0                      ; 6731   03C8
        MVO     R0,     G_0328                  ; 6732   0240 0328
        MVII    #$0001, R1                      ; 6734   02B9 0001
        MVO     R1,     G_0175                  ; 6736   0241 0175
L_6738:
        MVI     G_0175, R1                      ; 6738   0281 0175
        INCR    R1                              ; 673A   0009
        MVO     R1,     G_0175                  ; 673B   0241 0175
        SLR     R1,     1                       ; 673D   0061
        SDBD                                    ; 673E   0001
        ADDI    #$6798, R1                      ; 673F   02F9 0098 0067
        MVI@    R1,     R0                      ; 6742   0288
        SLL     R0,     2                       ; 6743   004C
        BEQ     L_674F                          ; 6744   0204 0009

        SLL     R0,     2                       ; 6746   004C
        SDBD                                    ; 6747   0001
        ADDI    #$67A1, R0                      ; 6748   02F8 00A1 0067
        MVO     R0,     G_0342                  ; 674B   0240 0342
        B       L_6768                          ; 674D   0200 0019

L_674F:
        CLRR    R0                              ; 674F   01C0
        MVO     R0,     G_0175                  ; 6750   0240 0175
        MVO     R0,     G_031C                  ; 6752   0240 031C
        MVO     R0,     G_0129                  ; 6754   0240 0129
        B       L_6768                          ; 6756   0200 0010

L_6758:
        MVI     G_0342, R1                      ; 6758   0281 0342
        ADDI    #$0010, R1                      ; 675A   02F9 0010
        SDBD                                    ; 675C   0001
        CMPI    #$6811, R1                      ; 675D   0379 0011 0068
        BNEQ    L_6766                          ; 6760   020C 0004

        SDBD                                    ; 6762   0001
        MVII    #$6811, R1                      ; 6763   02B9 0011 0068
L_6766:
        MVO     R1,     G_0342                  ; 6766   0241 0342
L_6768:
        PULR    R7                              ; 6768   02B7

        DECLE   $0000,  $0010,  $0008,  $0060   ; 6769   0000 0010 0008 0060
        DECLE   $0018,  $0000,  $0000,  $0000   ; 676D   0018 0000 0000 0000
        DECLE   $0008,  $0004,  $0030,  $000C   ; 6771   0008 0004 0030 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6775   0000 0000 0000 0000
        DECLE   $0008,  $0044,  $0020,  $0000   ; 6779   0008 0044 0020 0000
        DECLE   $0018,  $0000,  $0000,  $0000   ; 677D   0018 0000 0000 0000
        DECLE   $0082,  $0020,  $0000,  $0000   ; 6781   0082 0020 0000 0000
        DECLE   $0024,  $0000,  $0000,  $0000   ; 6785   0024 0000 0000 0000
        DECLE   $0000,  $0040,  $0000,  $0000   ; 6789   0000 0040 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0080   ; 678D   0000 0001 0000 0080
        DECLE   $0006,  $0006,  $0007,  $0007   ; 6791   0006 0006 0007 0007
        DECLE   $0007,  $0005,  $0001,  $0003   ; 6795   0007 0005 0001 0003
        DECLE   $0002,  $0003,  $0004,  $0004   ; 6799   0002 0003 0004 0004
        DECLE   $0003,  $0002,  $0001,  $0000   ; 679D   0003 0002 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67A1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 67A5   0000 0000 0008 001C
        DECLE   $0008,  $0000,  $0000,  $0000   ; 67A9   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67AD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67B1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $001C   ; 67B5   0000 0000 000C 001C
        DECLE   $0018,  $0018,  $0000,  $0000   ; 67B9   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67BD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67C1   0000 0000 0000 0000
        DECLE   $0004,  $000C,  $003E,  $003E   ; 67C5   0004 000C 003E 003E
        DECLE   $003C,  $001C,  $0008,  $0000   ; 67C9   003C 001C 0008 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 67CD   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0014,  $003E   ; 67D1   0000 0004 0014 003E
        DECLE   $007E,  $007C,  $00FE,  $00FF   ; 67D5   007E 007C 00FE 00FF
        DECLE   $007F,  $007E,  $003C,  $0038   ; 67D9   007F 007E 003C 0038
        DECLE   $0028,  $0000,  $0000,  $0000   ; 67DD   0028 0000 0000 0000
        DECLE   $0004,  $0014,  $003E,  $007E   ; 67E1   0004 0014 003E 007E
        DECLE   $007C,  $00FE,  $00FF,  $007C   ; 67E5   007C 00FE 00FF 007C
        DECLE   $00FF,  $003E,  $007F,  $007E   ; 67E9   00FF 003E 007F 007E
        DECLE   $003C,  $0038,  $0028,  $0004   ; 67ED   003C 0038 0028 0004
        DECLE   $0000,  $0004,  $0008,  $007C   ; 67F1   0000 0004 0008 007C
        DECLE   $0008,  $0000,  $0000,  $0000   ; 67F5   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0078   ; 67F9   0000 0000 000C 0078
        DECLE   $000C,  $0000,  $0000,  $0000   ; 67FD   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $007C   ; 6801   0000 0000 0008 007C
        DECLE   $0008,  $0004,  $0000,  $0000   ; 6805   0008 0004 0000 0000
        DECLE   $0000,  $0004,  $000C,  $007C   ; 6809   0000 0004 000C 007C
        DECLE   $000C,  $0004,  $0000,  $0000   ; 680D   000C 0004 0000 0000
L_6811:
        PSHR    R5                              ; 6811   0275
        MVI     G_0349, R1                      ; 6812   0281 0349
        ANDI    #$0100, R1                      ; 6814   03B9 0100
        BEQ     L_6838                          ; 6816   0204 0020

        JSR     R5,     L_6DB8                  ; 6818   0004 016C 01B8

        ADDI    #$0200, R0                      ; 681B   02F8 0200
        MOVR    R0,     R4                      ; 681D   0084
        MVI@    R4,     R1                      ; 681E   02A1
        SLR     R1,     2                       ; 681F   0065
        SLR     R1,     1                       ; 6820   0061
        ANDI    #$00FF, R1                      ; 6821   03B9 00FF
        SDBD                                    ; 6823   0001
        SUBI    #$0024, R1                      ; 6824   0339 0024 0000
        BMI     L_685B                          ; 6827   020B 0032

        CMPI    #$000C, R1                      ; 6829   0379 000C
        BPL     L_685B                          ; 682B   0203 002E

        MVI     G_0114, R0                      ; 682D   0280 0114
        CMPI    #$002D, R0                      ; 682F   0378 002D
        BPL     L_6843                          ; 6831   0203 0010

        CLRR    R0                              ; 6833   01C0
        MVO     R0,     G_015E                  ; 6834   0240 015E
        B       L_6843                          ; 6836   0200 000B

L_6838:
        MVI     G_0175, R0                      ; 6838   0280 0175
        TSTR    R0                              ; 683A   0080
        BEQ     L_685B                          ; 683B   0204 001E

        MVI     G_0349, R1                      ; 683D   0281 0349
        ANDI    #$0008, R1                      ; 683F   03B9 0008
        BEQ     L_685B                          ; 6841   0204 0018

L_6843:
        MVI     G_0131, R5                      ; 6843   0285 0131
        DECR    R5                              ; 6845   0015
        BNEQ    L_688B                          ; 6846   020C 0043

        MVII    #$005A, R1                      ; 6848   02B9 005A
        MVO     R1,     G_0114                  ; 684A   0241 0114
        MVI     G_015E, R1                      ; 684C   0281 015E
        TSTR    R1                              ; 684E   0089
        BNEQ    L_685B                          ; 684F   020C 000A

        MVI     G_015F, R1                      ; 6851   0281 015F
        MVO     R1,     G_015E                  ; 6853   0241 015E
        DECR    R1                              ; 6855   0011
        BPL     L_6859                          ; 6856   0203 0001

        CLRR    R1                              ; 6858   01C9
L_6859:
        MVO     R1,     G_015F                  ; 6859   0241 015F
L_685B:
        CLRR    R3                              ; 685B   01DB
        MVI     G_0114, R1                      ; 685C   0281 0114
        TSTR    R1                              ; 685E   0089
        BEQ     L_6889                          ; 685F   0204 0028

        SDBD                                    ; 6861   0001
        MVII    #$086E, R5                      ; 6862   02BD 006E 0008
        DECR    R1                              ; 6865   0011
        BNEQ    L_686C                          ; 6866   020C 0004

        SDBD                                    ; 6868   0001
        MVII    #$186C, R5                      ; 6869   02BD 006C 0018
L_686C:
        MVO     R5,     G_031A                  ; 686C   0245 031A
        MVO     R1,     G_0114                  ; 686E   0241 0114
        MVI     G_033A, R3                      ; 6870   0283 033A
        ANDI    #$0007, R3                      ; 6872   03BB 0007
        SLL     R3,     1                       ; 6874   004B
        CMPI    #$0008, R3                      ; 6875   037B 0008
        BNC     L_687C                          ; 6877   0209 0003

        SUBI    #$000F, R3                      ; 6879   033B 000F
        NEGR    R3                              ; 687B   0023
L_687C:
        SUBI    #$0004, R3                      ; 687C   033B 0004
        MVI     G_0114, R0                      ; 687E   0280 0114
        SUBI    #$005A, R0                      ; 6880   0338 005A
        NEGR    R0                              ; 6882   0020
        ADDR    R3,     R3                      ; 6883   00DB
L_6884:
        SAR     R3,     1                       ; 6884   006B
        SUBI    #$0014, R0                      ; 6885   0338 0014
        BPL     L_6884                          ; 6887   0223 0004

L_6889:
        MVO     R3,     G_034D                  ; 6889   0243 034D
L_688B:
        PULR    R7                              ; 688B   02B7

L_688C:
        PSHR    R5                              ; 688C   0275
        MVI     G_012C, R0                      ; 688D   0280 012C
        CMPI    #$001D, R0                      ; 688F   0378 001D
        BEQ     L_6933                          ; 6891   0204 00A0

        CMPI    #$0018, R0                      ; 6893   0378 0018
        BEQ     L_690F                          ; 6895   0204 0078
        BPL     L_692D                          ; 6897   0203 0094

        CMPI    #$0010, R0                      ; 6899   0378 0010
        BPL     L_68D2                          ; 689B   0203 0035

        MVII    #$0190, R3                      ; 689D   02BB 0190
        ADDR    R0,     R3                      ; 689F   00C3
        MVI@    R3,     R4                      ; 68A0   029C
        MOVR    R4,     R1                      ; 68A1   00A1
        TSTR    R1                              ; 68A2   0089
        BEQ     L_692D                          ; 68A3   0204 0088

        ADDI    #$0010, R3                      ; 68A5   02FB 0010
        MVI@    R3,     R2                      ; 68A7   029A
        ADDI    #$0010, R3                      ; 68A8   02FB 0010
        MVI@    R3,     R1                      ; 68AA   0299
        SWAP    R1,     1                       ; 68AB   0041
        XORR    R2,     R1                      ; 68AC   01D1
        SUBI    #$0098, R1                      ; 68AD   0339 0098

        JSR     R5,     L_693F                  ; 68AF   0004 0168 013F

        MOVR    R0,     R5                      ; 68B2   0085
        ANDI    #$0018, R5                      ; 68B3   03BD 0018
        ANDI    #$000F, R4                      ; 68B5   03BC 000F
        MOVR    R4,     R1                      ; 68B7   00A1
        SLR     R1,     1                       ; 68B8   0061
        SDBD                                    ; 68B9   0001
        ADDI    #$6937, R1                      ; 68BA   02F9 0037 0069
        ADD@    R1,     R5                      ; 68BD   02CD
        MOVR    R0,     R1                      ; 68BE   0081
        ADD     G_012D, R5                      ; 68BF   02C5 012D
        SDBD                                    ; 68C1   0001
        ADDI    #$3810, R5                      ; 68C2   02FD 0010 0038
        MVO     R5,     G_033E                  ; 68C5   0245 033E
        ANDI    #$0007, R1                      ; 68C7   03B9 0007
        SDBD                                    ; 68C9   0001
        ADDI    #$51C8, R1                      ; 68CA   02F9 00C8 0051
        MVI@    R1,     R2                      ; 68CD   028A
        MVO     R2,     G_012E                  ; 68CE   0242 012E
        B       L_692D                          ; 68D0   0200 005B

L_68D2:
        ADDI    #$0345, R0                      ; 68D2   02F8 0345
        MOVR    R0,     R4                      ; 68D4   0084
        MVI@    R4,     R1                      ; 68D5   02A1
        MOVR    R1,     R0                      ; 68D6   0088
        SDBD                                    ; 68D7   0001
        ANDI    #$8000, R0                      ; 68D8   03B8 0000 0080
        BEQ     L_692D                          ; 68DB   0204 0050

        SDBD                                    ; 68DD   0001
        ANDI    #$7FFF, R1                      ; 68DE   03B9 00FF 007F
        SDBD                                    ; 68E1   0001
        SUBI    #$0E03, R1                      ; 68E2   0339 0003 000E
        CLRR    R0                              ; 68E5   01C0
L_68E6:
        ADDI    #$000A, R0                      ; 68E6   02F8 000A
        SUBI    #$0046, R1                      ; 68E8   0339 0046
        BPL     L_68E6                          ; 68EA   0223 0005

        SUBI    #$000A, R0                      ; 68EC   0338 000A
        ADDI    #$0046, R1                      ; 68EE   02F9 0046
        DECR    R0                              ; 68F0   0010
L_68F1:
        INCR    R0                              ; 68F1   0008
        SUBI    #$0007, R1                      ; 68F2   0339 0007
        BPL     L_68F1                          ; 68F4   0223 0004

        MOVR    R0,     R5                      ; 68F6   0085
        ANDI    #$0018, R5                      ; 68F7   03BD 0018
        ADDI    #$0007, R5                      ; 68F9   02FD 0007
        ADD     G_012D, R5                      ; 68FB   02C5 012D
        SDBD                                    ; 68FD   0001
        ADDI    #$3810, R5                      ; 68FE   02FD 0010 0038
        MVO     R5,     G_033E                  ; 6901   0245 033E
        MOVR    R0,     R1                      ; 6903   0081
        ANDI    #$0007, R1                      ; 6904   03B9 0007
        SDBD                                    ; 6906   0001
        ADDI    #$51C8, R1                      ; 6907   02F9 00C8 0051
        MVI@    R1,     R2                      ; 690A   028A
        MVO     R2,     G_012E                  ; 690B   0242 012E
        B       L_692D                          ; 690D   0200 001E

L_690F:
        MVII    #$02E4, R4                      ; 690F   02BC 02E4
        SDBD                                    ; 6911   0001
        MVII    #$0810, R0                      ; 6912   02B8 0010 0008
        ADD     G_012D, R0                      ; 6915   02C0 012D
        MVII    #$0004, R3                      ; 6917   02BB 0004
L_6919:
        SDBD                                    ; 6919   0001
        MVII    #$0005, R1                      ; 691A   02B9 0005 0000
        XORR    R0,     R1                      ; 691D   01C1
        MVO@    R1,     R4                      ; 691E   0261
        ADDI    #$0008, R0                      ; 691F   02F8 0008
        DECR    R3                              ; 6921   0013
        BNEQ    L_6919                          ; 6922   022C 000A

        MVI     G_012D, R0                      ; 6924   0280 012D
        XORI    #$0020, R0                      ; 6926   03F8 0020
        MVO     R0,     G_012D                  ; 6928   0240 012D
        CLRR    R0                              ; 692A   01C0
        MVO     R0,     G_012E                  ; 692B   0240 012E
L_692D:
        MVI     G_012C, R0                      ; 692D   0280 012C
        INCR    R0                              ; 692F   0008
        MVO     R0,     G_012C                  ; 6930   0240 012C
        PULR    R7                              ; 6932   02B7

L_6933:
        CLRR    R0                              ; 6933   01C0
        MVO     R0,     G_012C                  ; 6934   0240 012C
        PULR    R7                              ; 6936   02B7

        DECLE   $0000,  $0001,  $0001,  $0002   ; 6937   0000 0001 0001 0002
        DECLE   $0002,  $0003,  $0003,  $0004   ; 693B   0002 0003 0003 0004
L_693F:
        PSHR    R5                              ; 693F   0275
        SUBI    #$0051, R1                      ; 6940   0339 0051
        CLRR    R0                              ; 6942   01C0
L_6943:
        ADDI    #$000A, R0                      ; 6943   02F8 000A
        SUBI    #$021C, R1                      ; 6945   0339 021C
        BPL     L_6943                          ; 6947   0223 0005

        SUBI    #$000A, R0                      ; 6949   0338 000A
        ADDI    #$021C, R1                      ; 694B   02F9 021C
        DECR    R0                              ; 694D   0010
L_694E:
        INCR    R0                              ; 694E   0008
        SUBI    #$0036, R1                      ; 694F   0339 0036
        BPL     L_694E                          ; 6951   0223 0004
        PULR    R7                              ; 6953   02B7

L_6954:
        PSHR    R5                              ; 6954   0275
        MVII    #$0190, R4                      ; 6955   02BC 0190
L_6957:
        MOVR    R4,     R5                      ; 6957   00A5
        SUBI    #$0010, R5                      ; 6958   033D 0010
        MVI@    R5,     R1                      ; 695A   02A9
        CMPI    #$00FF, R1                      ; 695B   0379 00FF
        BEQ     L_6963                          ; 695D   0204 0004

        ADDI    #$0200, R1                      ; 695F   02F9 0200
        CLRR    R2                              ; 6961   01D2
        MVO@    R2,     R1                      ; 6962   024A
L_6963:
        MVI@    R4,     R0                      ; 6963   02A0
        ADDI    #$000F, R4                      ; 6964   02FC 000F
        MVI@    R4,     R1                      ; 6966   02A1
        ADDI    #$000F, R4                      ; 6967   02FC 000F
        MVI@    R4,     R2                      ; 6969   02A2
        SUBI    #$0031, R4                      ; 696A   033C 0031
        MOVR    R0,     R3                      ; 696C   0083
        TSTR    R3                              ; 696D   009B
        BEQ     L_69B8                          ; 696E   0204 0048

        SWAP    R2,     1                       ; 6970   0042
        XORR    R2,     R1                      ; 6971   01D1
        MVI     G_0330, R2                      ; 6972   0282 0330
        SUBR    R2,     R1                      ; 6974   0111
        BMI     L_69B8                          ; 6975   020B 0041

        CMPI    #$00A0, R1                      ; 6977   0379 00A0
        BPL     L_69B8                          ; 6979   0203 003D

        SLR     R1,     2                       ; 697B   0065
        MOVR    R1,     R3                      ; 697C   008B
        ANDI    #$0001, R3                      ; 697D   03BB 0001
        SLR     R1,     1                       ; 697F   0061
        MOVR    R0,     R2                      ; 6980   0082
        ANDI    #$000F, R2                      ; 6981   03BA 000F
        MOVR    R2,     R5                      ; 6983   0095
        ANDI    #$0001, R5                      ; 6984   03BD 0001
        ADDR    R5,     R5                      ; 6986   00ED
        ADDR    R5,     R3                      ; 6987   00EB
        SLR     R2,     1                       ; 6988   0062
        SLL     R2,     2                       ; 6989   004E
        MOVR    R2,     R5                      ; 698A   0095
        SLL     R2,     2                       ; 698B   004E
        ADDR    R5,     R2                      ; 698C   00EA
        ADDR    R1,     R2                      ; 698D   00CA
        MVO@    R2,     R4                      ; 698E   0262
        ADDI    #$0200, R2                      ; 698F   02FA 0200
        MOVR    R3,     R1                      ; 6991   0099
        SDBD                                    ; 6992   0001
        ADDI    #$0024, R1                      ; 6993   02F9 0024 0000
        MVI     G_017F, R3                      ; 6996   0283 017F
        INCR    R3                              ; 6998   000B
        ANDI    #$000F, R3                      ; 6999   03BB 000F
        MVO     R3,     G_017F                  ; 699B   0243 017F
        SLR     R3,     2                       ; 699D   0067
        SDBD                                    ; 699E   0001
        ADDI    #$69C2, R3                      ; 699F   02FB 00C2 0069
        ADD@    R3,     R1                      ; 69A2   02D9
        SLL     R1,     2                       ; 69A3   004D
        SLL     R1,     1                       ; 69A4   0049
        SDBD                                    ; 69A5   0001
        XORI    #$4800, R1                      ; 69A6   03F9 0000 0048
        SLR     R0,     2                       ; 69A9   0064
        SLR     R0,     2                       ; 69AA   0064
        SLR     R0,     2                       ; 69AB   0064
        ANDI    #$0003, R0                      ; 69AC   03B8 0003
        ADDR    R4,     R0                      ; 69AE   00E0
        ANDI    #$0007, R0                      ; 69AF   03B8 0007
        BNEQ    L_69B4                          ; 69B1   020C 0001

        INCR    R0                              ; 69B3   0008
L_69B4:
        XORR    R0,     R1                      ; 69B4   01C1
        MVO@    R1,     R2                      ; 69B5   0251
        B       L_69BB                          ; 69B6   0200 0003

L_69B8:
        MVII    #$00FF, R0                      ; 69B8   02B8 00FF
        MVO@    R0,     R4                      ; 69BA   0260
L_69BB:
        ADDI    #$0010, R4                      ; 69BB   02FC 0010
        CMPI    #$01A0, R4                      ; 69BD   037C 01A0
        BNC     L_6957                          ; 69BF   0229 0069
        PULR    R7                              ; 69C1   02B7

        DECLE   $0000,  $0004,  $0008,  $0004   ; 69C2   0000 0004 0008 0004
L_69C6:
        PSHR    R5                              ; 69C6   0275
        MVII    #$0190, R4                      ; 69C7   02BC 0190
L_69C9:
        MVI@    R4,     R0                      ; 69C9   02A0
        MOVR    R0,     R5                      ; 69CA   0085
        BEQ     L_6AA6                          ; 69CB   0204 00D9

        ADDI    #$000F, R4                      ; 69CD   02FC 000F
        MVI@    R4,     R1                      ; 69CF   02A1
        ADDI    #$000F, R4                      ; 69D0   02FC 000F
        MVI@    R4,     R2                      ; 69D2   02A2
        ADDI    #$000F, R4                      ; 69D3   02FC 000F
        MVI@    R4,     R3                      ; 69D5   02A3
        SWAP    R2,     1                       ; 69D6   0042
        XORR    R2,     R1                      ; 69D7   01D1
        ANDI    #$000F, R0                      ; 69D8   03B8 000F
        SUBI    #$000F, R0                      ; 69DA   0338 000F
        NEGR    R0                              ; 69DC   0020
        SLL     R0,     2                       ; 69DD   004C
        TSTR    R3                              ; 69DE   009B
        BEQ     L_6A2E                          ; 69DF   0204 004D

        PSHR    R5                              ; 69E1   0275
        MOVR    R5,     R2                      ; 69E2   00AA
        SLR     R2,     2                       ; 69E3   0066
        SLR     R2,     1                       ; 69E4   0062
        ANDI    #$0006, R2                      ; 69E5   03BA 0006
        SDBD                                    ; 69E7   0001
        ADDI    #$6AAB, R2                      ; 69E8   02FA 00AB 006A
        MOVR    R2,     R5                      ; 69EB   0095
        SDBD                                    ; 69EC   0001
        MVI@    R5,     R2                      ; 69ED   02AA
        PULR    R5                              ; 69EE   02B5
        SUBR    R1,     R2                      ; 69EF   010A
        BPL     L_69F3                          ; 69F0   0203 0001

        NEGR    R2                              ; 69F2   0022
L_69F3:
        CMPI    #$00C8, R2                      ; 69F3   037A 00C8
        BNC     L_69FC                          ; 69F5   0209 0005

        CLRR    R3                              ; 69F7   01DB
        DECR    R4                              ; 69F8   0014
        MVO@    R3,     R4                      ; 69F9   0263
        B       L_6A2E                          ; 69FA   0200 0032

L_69FC:
        MOVR    R0,     R5                      ; 69FC   0085
        MVI     G_0132, R0                      ; 69FD   0280 0132
        SLR     R0,     2                       ; 69FF   0064
        ADDI    #$0003, R0                      ; 6A00   02F8 0003
        MOVR    R3,     R2                      ; 6A02   009A
        ANDI    #$0040, R2                      ; 6A03   03BA 0040
        BNEQ    L_6A10                          ; 6A05   020C 0009

        MOVR    R3,     R2                      ; 6A07   009A
        ANDI    #$003F, R2                      ; 6A08   03BA 003F
        BNEQ    L_6A26                          ; 6A0A   020C 001A

        XORI    #$00C0, R5                      ; 6A0C   03FD 00C0
        B       L_6A18                          ; 6A0E   0200 0008

L_6A10:
        NEGR    R0                              ; 6A10   0020
        MOVR    R3,     R2                      ; 6A11   009A
        ANDI    #$003F, R2                      ; 6A12   03BA 003F
        BNEQ    L_6A26                          ; 6A14   020C 0010

        XORI    #$0080, R5                      ; 6A16   03FD 0080
L_6A18:
        DECR    R4                              ; 6A18   0014
        MVO@    R5,     R4                      ; 6A19   0265
        SUBI    #$0031, R4                      ; 6A1A   033C 0031
        MVI@    R4,     R2                      ; 6A1C   02A2
        INCR    R2                              ; 6A1D   000A
        DECR    R4                              ; 6A1E   0014
        MVO@    R2,     R4                      ; 6A1F   0262
        ANDI    #$000F, R2                      ; 6A20   03BA 000F
        BEQ     L_6A7D                          ; 6A22   0204 0059
        B       L_6AA6                          ; 6A24   0200 0080

L_6A26:
        DECR    R2                              ; 6A26   0012
        ANDI    #$00C0, R3                      ; 6A27   03BB 00C0
        XORR    R2,     R3                      ; 6A29   01D3
        DECR    R4                              ; 6A2A   0014
        MVO@    R3,     R4                      ; 6A2B   0263
        B       L_6A71                          ; 6A2C   0200 0043

L_6A2E:
        PSHR    R0                              ; 6A2E   0270
        PSHR    R4                              ; 6A2F   0274
        MOVR    R5,     R3                      ; 6A30   00AB
        ANDI    #$0030, R3                      ; 6A31   03BB 0030
        SLR     R3,     2                       ; 6A33   0067
        SLR     R3,     2                       ; 6A34   0067
        MOVR    R3,     R4                      ; 6A35   009C
        ADDR    R4,     R4                      ; 6A36   00E4
        SDBD                                    ; 6A37   0001
        ADDI    #$6AAB, R4                      ; 6A38   02FC 00AB 006A
        SDBD                                    ; 6A3B   0001
        MVI@    R4,     R2                      ; 6A3C   02A2
        MOVR    R2,     R5                      ; 6A3D   0095
        PULR    R4                              ; 6A3E   02B4
        PULR    R0                              ; 6A3F   02B0
        SUBR    R1,     R2                      ; 6A40   010A
        MOVR    R2,     R3                      ; 6A41   0093
        BPL     L_6A45                          ; 6A42   0203 0001

        NEGR    R3                              ; 6A44   0023
L_6A45:
        CMPI    #$000F, R3                      ; 6A45   037B 000F
        BPL     L_6A52                          ; 6A47   0203 0009

        MOVR    R5,     R1                      ; 6A49   00A9
        SLR     R0,     1                       ; 6A4A   0060
        XORI    #$0080, R0                      ; 6A4B   03F8 0080
        DECR    R4                              ; 6A4D   0014
        MVO@    R0,     R4                      ; 6A4E   0260
        CLRR    R0                              ; 6A4F   01C0
        B       L_6A71                          ; 6A50   0200 001F

L_6A52:
        MVI     G_0132, R0                      ; 6A52   0280 0132
        SLR     R0,     1                       ; 6A54   0060
        CMPI    #$0005, R0                      ; 6A55   0378 0005
        BNC     L_6A5B                          ; 6A57   0209 0002

        MVII    #$0005, R0                      ; 6A59   02B8 0005
L_6A5B:
        INCR    R0                              ; 6A5B   0008
        PSHR    R4                              ; 6A5C   0274
        PSHR    R1                              ; 6A5D   0271
        MVII    #$0107, R4                      ; 6A5E   02BC 0107
L_6A60:
        MVI@    R4,     R1                      ; 6A60   02A1
        CMPI    #$0004, R1                      ; 6A61   0379 0004
        BNC     L_6A67                          ; 6A63   0209 0002

        ADDI    #$0002, R0                      ; 6A65   02F8 0002
L_6A67:
        CMPI    #$010B, R4                      ; 6A67   037C 010B
        BNC     L_6A60                          ; 6A69   0229 000A

        PULR    R1                              ; 6A6B   02B1
        PULR    R4                              ; 6A6C   02B4
        TSTR    R2                              ; 6A6D   0092
        BPL     L_6A71                          ; 6A6E   0203 0001

        NEGR    R0                              ; 6A70   0020
L_6A71:
        ADDR    R0,     R1                      ; 6A71   00C1
        SUBI    #$0021, R4                      ; 6A72   033C 0021
        MVO@    R1,     R4                      ; 6A74   0261
        ADDI    #$000F, R4                      ; 6A75   02FC 000F
        SWAP    R1,     1                       ; 6A77   0041
        MVO@    R1,     R4                      ; 6A78   0261
        SUBI    #$0020, R4                      ; 6A79   033C 0020
        B       L_6AA6                          ; 6A7B   0200 0029

L_6A7D:
        PSHR    R4                              ; 6A7D   0274
        SDBD                                    ; 6A7E   0001
        MVII    #$6AAB, R4                      ; 6A7F   02BC 00AB 006A
L_6A82:
        SDBD                                    ; 6A82   0001
        MVI@    R4,     R5                      ; 6A83   02A5
        SUBR    R1,     R5                      ; 6A84   010D
        BPL     L_6A88                          ; 6A85   0203 0001

        NEGR    R5                              ; 6A87   0025
L_6A88:
        CMPI    #$0064, R5                      ; 6A88   037D 0064
        BNC     L_6A94                          ; 6A8A   0209 0008

        SDBD                                    ; 6A8C   0001
        CMPI    #$6AB3, R4                      ; 6A8D   037C 00B3 006A
        BNC     L_6A82                          ; 6A90   0229 000F
        B       L_6AA2                          ; 6A92   0200 000E

L_6A94:
        SDBD                                    ; 6A94   0001
        SUBI    #$6AAD, R4                      ; 6A95   033C 00AD 006A
        MOVR    R4,     R0                      ; 6A98   00A0
        SLR     R0,     1                       ; 6A99   0060

        JSR     R5,     L_6AC1                  ; 6A9A   0004 0168 02C1

        MVI     G_010C, R1                      ; 6A9D   0281 010C
        INCR    R1                              ; 6A9F   0009
        MVO     R1,     G_010C                  ; 6AA0   0241 010C
L_6AA2:
        PULR    R4                              ; 6AA2   02B4
        DECR    R4                              ; 6AA3   0014
        CLRR    R0                              ; 6AA4   01C0
        MVO@    R0,     R4                      ; 6AA5   0260
L_6AA6:
        CMPI    #$01A0, R4                      ; 6AA6   037C 01A0
        BNC     L_69C9                          ; 6AA8   0229 00E0
        PULR    R7                              ; 6AAA   02B7

        DECLE   $00BC,  $0001,  $006C,  $0003   ; 6AAB   00BC 0001 006C 0003
        DECLE   $001C,  $0005,  $00CC,  $0006   ; 6AAF   001C 0005 00CC 0006
        DECLE   $0020,  $000E,  $0056,  $000E   ; 6AB3   0020 000E 0056 000E
        DECLE   $008C,  $000E,  $00C2,  $000E   ; 6AB7   008C 000E 00C2 000E
        DECLE   $0010,  $0038,  $0000,  $0038   ; 6ABB   0010 0038 0000 0038
        DECLE   $0000,  $0000                   ; 6ABF   0000 0000
L_6AC1:
        PSHR    R5                              ; 6AC1   0275
        PSHR    R2                              ; 6AC2   0272
        MOVR    R0,     R2                      ; 6AC3   0082
        ADDI    #$0107, R2                      ; 6AC4   02FA 0107
        MVI@    R2,     R1                      ; 6AC6   0291
        SDBD                                    ; 6AC7   0001
        ADDI    #$6ACF, R1                      ; 6AC8   02F9 00CF 006A
        MVI@    R1,     R1                      ; 6ACB   0289
        MVO@    R1,     R2                      ; 6ACC   0251
        PULR    R2                              ; 6ACD   02B2
        PULR    R7                              ; 6ACE   02B7

        DECLE   $0001,  $0003,  $0003,  $0004   ; 6ACF   0001 0003 0003 0004
        DECLE   $0004,  $0004                   ; 6AD3   0004 0004
L_6AD5:
        PSHR    R5                              ; 6AD5   0275
        MVI     G_017B, R0                      ; 6AD6   0280 017B
        TSTR    R0                              ; 6AD8   0080
        BEQ     L_6AF4                          ; 6AD9   0204 0019

        ADDI    #$0002, R0                      ; 6ADB   02F8 0002
        CMPI    #$001F, R0                      ; 6ADD   0378 001F
        BNC     L_6AE6                          ; 6ADF   0209 0005

        CLRR    R0                              ; 6AE1   01C0
        MVO     R0,     G_017B                  ; 6AE2   0240 017B
        B       L_6AF2                          ; 6AE4   0200 000C

L_6AE6:
        MVO     R0,     G_017B                  ; 6AE6   0240 017B
        MVO     R0,     .PSG0.noise             ; 6AE8   0240 01F9
        CLRR    R0                              ; 6AEA   01C0
        MVO     R0,     .PSG0.envlp_lo          ; 6AEB   0240 01F3
        SWAP    R0,     1                       ; 6AED   0040
        MVO     R0,     .PSG0.envlp_hi          ; 6AEE   0240 01F7
        MVII    #$000F, R0                      ; 6AF0   02B8 000F
L_6AF2:
        MVO     R0,     .PSG0.chn_a_vol         ; 6AF2   0240 01FB
L_6AF4:
        MVI     G_0352, R0                      ; 6AF4   0280 0352
        TSTR    R0                              ; 6AF6   0080
        BEQ     L_6B11                          ; 6AF7   0204 0018

        ADDI    #$0046, R0                      ; 6AF9   02F8 0046
        SDBD                                    ; 6AFB   0001
        CMPI    #$0700, R0                      ; 6AFC   0378 0000 0007
        BNC     L_6B06                          ; 6AFF   0209 0005

        CLRR    R0                              ; 6B01   01C0
        MVO     R0,     G_0352                  ; 6B02   0240 0352
        B       L_6B0F                          ; 6B04   0200 0009

L_6B06:
        MVO     R0,     G_0352                  ; 6B06   0240 0352
        MVO     R0,     .PSG0.chn_b_lo          ; 6B08   0240 01F1
        SWAP    R0,     1                       ; 6B0A   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 6B0B   0240 01F5
        MVII    #$000E, R0                      ; 6B0D   02B8 000E
L_6B0F:
        MVO     R0,     .PSG0.chn_b_vol         ; 6B0F   0240 01FC
L_6B11:
        MVI     G_017D, R0                      ; 6B11   0280 017D
        TSTR    R0                              ; 6B13   0080
        BEQ     L_6B2A                          ; 6B14   0204 0014

        MVI     G_017D, R0                      ; 6B16   0280 017D
        MVO     R0,     .PSG0.noise             ; 6B18   0240 01F9
        MVII    #$0030, R1                      ; 6B1A   02B9 0030
        MVO     R1,     .PSG0.chn_a_vol         ; 6B1C   0241 01FB
        MVI     G_0353, R0                      ; 6B1E   0280 0353
        MVO     R0,     .PSG0.envlp_lo          ; 6B20   0240 01F3
        SWAP    R0,     1                       ; 6B22   0040
        MVO     R0,     .PSG0.envlp_hi          ; 6B23   0240 01F7
        CLRR    R0                              ; 6B25   01C0
        MVO     R0,     .PSG0.envelope          ; 6B26   0240 01FA
        MVO     R0,     G_017D                  ; 6B28   0240 017D
L_6B2A:
        MVI     G_017E, R2                      ; 6B2A   0282 017E
        TSTR    R2                              ; 6B2C   0092
        BEQ     L_6B4B                          ; 6B2D   0204 001C

        MVI     G_0354, R3                      ; 6B2F   0283 0354
        SUBI    #$000A, R3                      ; 6B31   033B 000A
        CMPI    #$000A, R3                      ; 6B33   037B 000A
        BNEQ    L_6B3E                          ; 6B35   020C 0007

        MVII    #$00FA, R3                      ; 6B37   02BB 00FA
        DECR    R2                              ; 6B39   0012
        MVO     R2,     G_017E                  ; 6B3A   0242 017E
        BEQ     L_6B40                          ; 6B3C   0204 0002

L_6B3E:
        MVII    #$000F, R2                      ; 6B3E   02BA 000F
L_6B40:
        MVO     R3,     G_0354                  ; 6B40   0243 0354
        MVO     R3,     .PSG0.chn_c_lo          ; 6B42   0243 01F2
        NOP                                     ; 6B44   0034
        MVII    #$0001, R3                      ; 6B45   02BB 0001
        MVO     R3,     .PSG0.chn_c_hi          ; 6B47   0243 01F6
        MVO     R2,     .PSG0.chn_c_vol         ; 6B49   0242 01FD
L_6B4B:
        MVI     G_017A, R1                      ; 6B4B   0281 017A
        TSTR    R1                              ; 6B4D   0089
        BEQ     L_6B78                          ; 6B4E   0204 0028

        INCR    R1                              ; 6B50   0009
        MVO     R1,     G_017A                  ; 6B51   0241 017A
        CMPI    #$0005, R1                      ; 6B53   0379 0005
        BEQ     L_6B6D                          ; 6B55   0204 0016

        CMPI    #$000F, R1                      ; 6B57   0379 000F
        BEQ     L_6B6D                          ; 6B59   0204 0012

        CLRR    R4                              ; 6B5B   01E4
        CMPI    #$000A, R1                      ; 6B5C   0379 000A
        BEQ     L_6B76                          ; 6B5E   0204 0016

        CMPI    #$0014, R1                      ; 6B60   0379 0014
        BEQ     L_6B76                          ; 6B62   0204 0012

        CMPI    #$0024, R1                      ; 6B64   0379 0024
        BLT     L_6B78                          ; 6B66   0205 0010

        CLRR    R1                              ; 6B68   01C9
        MVO     R1,     G_017A                  ; 6B69   0241 017A
        B       L_6B78                          ; 6B6B   0200 000B

L_6B6D:
        MVII    #$0180, R0                      ; 6B6D   02B8 0180
        MVO     R0,     .PSG0.chn_b_lo          ; 6B6F   0240 01F1
        SWAP    R0,     1                       ; 6B71   0040
        MVO     R0,     .PSG0.chn_b_hi          ; 6B72   0240 01F5
        MVII    #$000D, R4                      ; 6B74   02BC 000D
L_6B76:
        MVO     R4,     .PSG0.chn_b_vol         ; 6B76   0244 01FC
L_6B78:
        MVI     G_017C, R1                      ; 6B78   0281 017C
        TSTR    R1                              ; 6B7A   0089
        BEQ     L_6B99                          ; 6B7B   0204 001C

        INCR    R1                              ; 6B7D   0009
        MVII    #$000F, R5                      ; 6B7E   02BD 000F
        MVII    #$0002, R2                      ; 6B80   02BA 0002
        MVII    #$003C, R3                      ; 6B82   02BB 003C
        CMPI    #$001E, R1                      ; 6B84   0379 001E
        BPL     L_6B8A                          ; 6B86   0203 0002

        SUBI    #$001E, R3                      ; 6B88   033B 001E
L_6B8A:
        CMPI    #$003D, R1                      ; 6B8A   0379 003D
        BNC     L_6B90                          ; 6B8C   0209 0002

        CLRR    R5                              ; 6B8E   01ED
        CLRR    R1                              ; 6B8F   01C9
L_6B90:
        MVO     R5,     .PSG0.chn_c_vol         ; 6B90   0245 01FD
        MVO     R2,     .PSG0.chn_c_hi          ; 6B92   0242 01F6
        NOP                                     ; 6B94   0034
        MVO     R3,     .PSG0.chn_c_lo          ; 6B95   0243 01F2
        MVO     R1,     G_017C                  ; 6B97   0241 017C
L_6B99:
        PULR    R7                              ; 6B99   02B7

        TSTR    R4                              ; 6B9A   00A4
        SAR     R3,     1                       ; 6B9B   006B
        ADDR    R2,     R4                      ; 6B9C   00D4
        SAR     R3,     1                       ; 6B9D   006B
        MOVR    R1,     R5                      ; 6B9E   008D
        SAR     R1,     2                       ; 6B9F   006D
        SLL     R1,     2                       ; 6BA0   004D
        SAR     R0,     2                       ; 6BA1   006C
        SAR     R3,     2                       ; 6BA2   006F
        SAR     R1,     2                       ; 6BA3   006D
        PSHR    R5                              ; 6BA4   0275

        JSR     R5,     L_6BCD                  ; 6BA5   0004 0168 03CD

        TSTR    R0                              ; 6BA8   0080
        BMI     L_6BC9                          ; 6BA9   020B 001E

        MVI     G_0172, R5                      ; 6BAB   0285 0172
        TSTR    R5                              ; 6BAD   00AD
        BNEQ    L_6BCC                          ; 6BAE   020C 001C

        MOVR    R0,     R1                      ; 6BB0   0081
        MVII    #$0014, R0                      ; 6BB1   02B8 0014

        JSR     R5,     .EXEC.629               ; 6BB3   0004 0114 0229

        MVI     G_0131, R5                      ; 6BB6   0285 0131
        DECR    R5                              ; 6BB8   0015
        BNEQ    L_6BCC                          ; 6BB9   020C 0011

        MVO     R0,     G_032E                  ; 6BBB   0240 032E

        JSR     R5,     X_UNPK_BYTES            ; 6BBD   0004 0114 0357

        CLRR    R1                              ; 6BC0   01C9
        TSTR    R0                              ; 6BC1   0080
        BMI     L_6BC5                          ; 6BC2   020B 0001

        INCR    R1                              ; 6BC4   0009
L_6BC5:
        MVO     R1,     G_0112                  ; 6BC5   0241 0112
        B       L_6BCC                          ; 6BC7   0200 0003

L_6BC9:
        CLRR    R0                              ; 6BC9   01C0
        MVO     R0,     G_032E                  ; 6BCA   0240 032E
L_6BCC:
        PULR    R7                              ; 6BCC   02B7

L_6BCD:
        MVI     G_0131, R3                      ; 6BCD   0283 0131
        DECR    R3                              ; 6BCF   0013
        BNEQ    L_6BD3                          ; 6BD0   020C 0001
        MOVR    R5,     R7                      ; 6BD2   00AF
L_6BD3:
        PULR    R7                              ; 6BD3   02B7

        PSHR    R5                              ; 6BD4   0275
        MVI     G_0131, R3                      ; 6BD5   0283 0131
        CMPI    #$0001, R3                      ; 6BD7   037B 0001
        BEQ     L_6C24                          ; 6BD9   0204 0049

        CMPI    #$000A, R0                      ; 6BDB   0378 000A
        BEQ     L_6C0C                          ; 6BDD   0204 002D

        CMPI    #$0000, R3                      ; 6BDF   037B 0000
        BNEQ    L_6C24                          ; 6BE1   020C 0041

        CMPI    #$000B, R0                      ; 6BE3   0378 000B
        BEQ     L_6C14                          ; 6BE5   0204 002D

        MOVR    R0,     R4                      ; 6BE7   0084
        SDBD                                    ; 6BE8   0001
        ADDI    #$6C25, R4                      ; 6BE9   02FC 0025 006C
        MVI@    R4,     R3                      ; 6BEC   02A3
        TSTR    R3                              ; 6BED   009B
        BEQ     L_6C24                          ; 6BEE   0204 0034

        MVII    #$023C, R4                      ; 6BF0   02BC 023C
        CLRR    R1                              ; 6BF2   01C9
L_6BF3:
        MVO@    R1,     R4                      ; 6BF3   0261
        CMPI    #$028C, R4                      ; 6BF4   037C 028C
        BNC     L_6BF3                          ; 6BF6   0229 0004

        MVO     R3,     G_0132                  ; 6BF8   0243 0132
        MVII    #$0006, R3                      ; 6BFA   02BB 0006
        MOVR    R0,     R4                      ; 6BFC   0084
        SUBI    #$0004, R4                      ; 6BFD   033C 0004
        ADDR    R4,     R4                      ; 6BFF   00E4
        SDBD                                    ; 6C00   0001
        ADDI    #$6C2F, R4                      ; 6C01   02FC 002F 006C
        SDBD                                    ; 6C04   0001
        MVI@    R4,     R1                      ; 6C05   02A1
        MVII    #$0256, R4                      ; 6C06   02BC 0256

        JSR     R5,     X_PRINT_R1              ; 6C08   0004 0118 0067

        PULR    R7                              ; 6C0B   02B7

L_6C0C:
        CMPI    #$0002, R3                      ; 6C0C   037B 0002
        BNEQ    L_6C24                          ; 6C0E   020C 0014

        DIS                                     ; 6C10   0003
        J       .TITLECODE                      ; 6C11   0004 0350 001F

L_6C14:
        MVI     G_0132, R3                      ; 6C14   0283 0132
        TSTR    R3                              ; 6C16   009B
        BEQ     L_6C24                          ; 6C17   0204 000B

        MVII    #$0228, R4                      ; 6C19   02BC 0228
        MVII    #$003C, R0                      ; 6C1B   02B8 003C

        JSR     R5,     X_FILL_ZERO             ; 6C1D   0004 0114 0338

        MVII    #$0001, R0                      ; 6C20   02B8 0001
        MVO     R0,     G_0131                  ; 6C22   0240 0131
L_6C24:
        PULR    R7                              ; 6C24   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C25   0000 0000 0000 0000
        DECLE   $0001,  $0004,  $0007,  $0000   ; 6C29   0001 0004 0007 0000
        DECLE   $0000,  $0000,  $0035,  $006C   ; 6C2D   0000 0000 0035 006C
        DECLE   $003D,  $006C,  $0045,  $006C   ; 6C31   003D 006C 0045 006C
        DECLE   $0020,  $0043,  $0041,  $0044   ; 6C35   0020 0043 0041 0044
        DECLE   $0045,  $0054,  $0020,  $0000   ; 6C39   0045 0054 0020 0000
        DECLE   $0043,  $0041,  $0050,  $0054   ; 6C3D   0043 0041 0050 0054
        DECLE   $0041,  $0049,  $004E,  $0000   ; 6C41   0041 0049 004E 0000
        DECLE   $0041,  $0044,  $004D,  $0049   ; 6C45   0041 0044 004D 0049
        DECLE   $0052,  $0041,  $004C,  $0000   ; 6C49   0052 0041 004C 0000
L_6C4D:
        PSHR    R5                              ; 6C4D   0275

        JSR     R5,     L_6BCD                  ; 6C4E   0004 0168 03CD

        MVI     G_0172, R3                      ; 6C51   0283 0172
        ADDI    #$0200, R3                      ; 6C53   02FB 0200
        TSTR    R0                              ; 6C55   0080
        BEQ     L_6C6B                          ; 6C56   0204 0013
        BPL     L_6CDE                          ; 6C58   0203 0084

        CMPI    #$0200, R3                      ; 6C5A   037B 0200
        BEQ     L_6CA8                          ; 6C5C   0204 004A

        CLRR    R0                              ; 6C5E   01C0

        JSR     R5,     L_6D2F                  ; 6C5F   0004 016C 012F

        MVI     G_0351, R0                      ; 6C62   0280 0351
        MVO@    R0,     R3                      ; 6C64   0258
        CLRR    R0                              ; 6C65   01C0
        MVO     R0,     .PSG0.chn_c_vol         ; 6C66   0240 01FD
        MVO     R0,     G_0172                  ; 6C68   0240 0172
        PULR    R7                              ; 6C6A   02B7

L_6C6B:
        CMPI    #$0200, R3                      ; 6C6B   037B 0200
        BEQ     L_6CDE                          ; 6C6D   0204 006F

        MVI@    R3,     R0                      ; 6C6F   0298
        INCR    R0                              ; 6C70   0008
        ANDI    #$0007, R0                      ; 6C71   03B8 0007
        SDBD                                    ; 6C73   0001
        MVII    #$0858, R1                      ; 6C74   02B9 0058 0008
        ADDR    R0,     R1                      ; 6C77   00C1
        MVO@    R1,     R3                      ; 6C78   0259
        ADDI    #$0014, R3                      ; 6C79   02FB 0014
        MVI     G_0350, R1                      ; 6C7B   0281 0350
        ADDR    R1,     R0                      ; 6C7D   00C8

        JSR     R5,     L_6D2F                  ; 6C7E   0004 016C 012F

        MVO@    R0,     R3                      ; 6C81   0258
        MVI     G_0338, R1                      ; 6C82   0281 0338
        SDBD                                    ; 6C84   0001
        CMPI    #$6FC6, R1                      ; 6C85   0379 00C6 006F
        BNEQ    L_6CA9                          ; 6C88   020C 001F

        MVI     G_031D, R1                      ; 6C8A   0281 031D
        MVI     G_0318, R2                      ; 6C8C   0282 0318
        ANDI    #$00FF, R1                      ; 6C8E   03B9 00FF
        ANDI    #$00FF, R2                      ; 6C90   03BA 00FF
        SUBR    R1,     R2                      ; 6C92   010A
        BPL     L_6C96                          ; 6C93   0203 0001

        NEGR    R2                              ; 6C95   0022
L_6C96:
        CMPI    #$0006, R2                      ; 6C96   037A 0006
        BPL     L_6CA8                          ; 6C98   0203 000E

        MVI     G_0339, R1                      ; 6C9A   0281 0339
        ADDI    #$00C8, R1                      ; 6C9C   02F9 00C8
        SDBD                                    ; 6C9E   0001
        MVII    #$3E00, R2                      ; 6C9F   02BA 0000 003E
        CMPR    R2,     R1                      ; 6CA2   0151
        BLT     L_6CA6                          ; 6CA3   0205 0001

        MOVR    R2,     R1                      ; 6CA5   0091
L_6CA6:
        MVO     R1,     G_0339                  ; 6CA6   0241 0339
L_6CA8:
        PULR    R7                              ; 6CA8   02B7

L_6CA9:
        MVI     G_0339, R0                      ; 6CA9   0280 0339
        SUBI    #$0190, R0                      ; 6CAB   0338 0190
        SDBD                                    ; 6CAD   0001
        MVII    #$0400, R1                      ; 6CAE   02B9 0000 0004
        CMPR    R1,     R0                      ; 6CB1   0148
        BPL     L_6CB9                          ; 6CB2   0203 0005

        MOVR    R1,     R0                      ; 6CB4   0088
        MVO     R0,     G_0339                  ; 6CB5   0240 0339
        B       L_6CA8                          ; 6CB7   0220 0010

L_6CB9:
        MVO     R0,     G_0339                  ; 6CB9   0240 0339
        MVI     G_0160, R0                      ; 6CBB   0280 0160
        INCR    R0                              ; 6CBD   0008
        MVO     R0,     G_0160                  ; 6CBE   0240 0160
        CMPI    #$0014, R0                      ; 6CC0   0378 0014
        BNC     L_6CA8                          ; 6CC2   0229 001B

        MVI     G_012A, R2                      ; 6CC4   0282 012A
        SDBD                                    ; 6CC6   0001
        ADDI    #$6FF0, R2                      ; 6CC7   02FA 00F0 006F
        MVI@    R2,     R2                      ; 6CCA   0292
        DECR    R2                              ; 6CCB   0012
        BMI     L_6CA8                          ; 6CCC   022B 0025

        ADDI    #$0107, R2                      ; 6CCE   02FA 0107
        MVI@    R2,     R0                      ; 6CD0   0290
        CMPI    #$0003, R0                      ; 6CD1   0378 0003
        BPL     L_6CA8                          ; 6CD3   0223 002C

        MVO     R2,     G_033C                  ; 6CD5   0242 033C
        CLRR    R0                              ; 6CD7   01C0
        MVO@    R0,     R2                      ; 6CD8   0250
        MVII    #$01E0, R0                      ; 6CD9   02B8 01E0
        MVO     R0,     G_033D                  ; 6CDB   0240 033D
        PULR    R7                              ; 6CDD   02B7

L_6CDE:
        MVI     G_032D, R5                      ; 6CDE   0285 032D
        TSTR    R5                              ; 6CE0   00AD
        BNEQ    L_6CA8                          ; 6CE1   022C 003A

        MVI     G_032E, R5                      ; 6CE3   0285 032E
        TSTR    R5                              ; 6CE5   00AD
        BNEQ    L_6CA8                          ; 6CE6   022C 003F

        MVO     R5,     G_0160                  ; 6CE8   0245 0160

        JSR     R5,     L_6DB8                  ; 6CEA   0004 016C 01B8

        TSTR    R0                              ; 6CED   0080
        BEQ     L_6CA8                          ; 6CEE   0224 0047

        MVO     R0,     G_0172                  ; 6CF0   0240 0172
        MOVR    R0,     R3                      ; 6CF2   0083
        ADDI    #$0200, R3                      ; 6CF3   02FB 0200
        ADDI    #$0004, R2                      ; 6CF5   02FA 0004
        ANDI    #$0007, R2                      ; 6CF7   03BA 0007
        SLR     R2,     1                       ; 6CF9   0062
        SDBD                                    ; 6CFA   0001
        ADDI    #$6D64, R2                      ; 6CFB   02FA 0064 006D
        MVI@    R2,     R0                      ; 6CFE   0290
        SLL     R0,     2                       ; 6CFF   004C
        SLL     R0,     1                       ; 6D00   0048
        MVO     R0,     G_0350                  ; 6D01   0240 0350
        MVII    #$0001, R5                      ; 6D03   02BD 0001
        MVO     R5,     G_0106                  ; 6D05   0245 0106
        MVO     R1,     G_0173                  ; 6D07   0241 0173
        SDBD                                    ; 6D09   0001
        MVII    #$6D39, R1                      ; 6D0A   02B9 0039 006D

        JSR     R5,     L_6D68                  ; 6D0D   0004 016C 0168

        EIS                                     ; 6D10   0002
L_6D11:
        MVI     G_0106, R5                      ; 6D11   0285 0106
        TSTR    R5                              ; 6D13   00AD
        BNEQ    L_6D11                          ; 6D14   022C 0004

        SDBD                                    ; 6D16   0001
        MVII    #$0858, R1                      ; 6D17   02B9 0058 0008
        MVO@    R1,     R3                      ; 6D1A   0259
        ADDI    #$0014, R3                      ; 6D1B   02FB 0014

        JSR     R5,     L_6D2F                  ; 6D1D   0004 016C 012F

        MVI@    R3,     R1                      ; 6D20   0299
        MVO     R1,     G_0351                  ; 6D21   0241 0351
        MVO@    R0,     R3                      ; 6D23   0258
        MVII    #$000F, R1                      ; 6D24   02B9 000F
        MVO     R1,     .PSG0.chn_c_vol         ; 6D26   0241 01FD
        MVO     R1,     .PSG0.chn_c_lo          ; 6D28   0241 01F2
        MVII    #$000C, R1                      ; 6D2A   02B9 000C
        MVO     R1,     .PSG0.chn_c_hi          ; 6D2C   0241 01F6
        PULR    R7                              ; 6D2E   02B7

L_6D2F:
        CMPI    #$02A0, R3                      ; 6D2F   037B 02A0
        BPL     L_6D38                          ; 6D31   0203 0005

        MVO@    R0,     R3                      ; 6D33   0258
        ADDI    #$0014, R3                      ; 6D34   02FB 0014
        B       L_6D2F                          ; 6D36   0220 0008
L_6D38:
        MOVR    R5,     R7                      ; 6D38   00AF

        PSHR    R5                              ; 6D39   0275

        JSR     R5,     L_6DD5                  ; 6D3A   0004 016C 01D5

        MVI     G_0350, R5                      ; 6D3D   0285 0350
        SDBD                                    ; 6D3F   0001
        ADDI    #$3000, R5                      ; 6D40   02FD 0000 0030
        MVI@    R5,     R5                      ; 6D43   02AD
        MVI     G_0173, R1                      ; 6D44   0281 0173
        SDBD                                    ; 6D46   0001
        MVII    #$3858, R4                      ; 6D47   02BC 0058 0038
L_6D4A:
        DECR    R1                              ; 6D4A   0011
        BPL     L_6D50                          ; 6D4B   0203 0003

        MVO@    R5,     R4                      ; 6D4D   0265
        B       L_6D52                          ; 6D4E   0200 0002

L_6D50:
        CLRR    R2                              ; 6D50   01D2
        MVO@    R2,     R4                      ; 6D51   0262
L_6D52:
        SDBD                                    ; 6D52   0001
        CMPI    #$3860, R4                      ; 6D53   037C 0060 0038
        BNC     L_6D4A                          ; 6D56   0229 000D

        CLRR    R5                              ; 6D58   01ED
        MVO     R5,     G_0106                  ; 6D59   0245 0106
        SDBD                                    ; 6D5B   0001
        MVII    #$58FE, R1                      ; 6D5C   02B9 00FE 0058

        JSR     R5,     L_6D68                  ; 6D5F   0004 016C 0168

        EIS                                     ; 6D62   0002
        PULR    R7                              ; 6D63   02B7

        DECLE   $00BC,  $00BE,  $00BF           ; 6D64   00BC 00BE 00BF

        MOVR    R7,     R5                      ; 6D67   00BD
L_6D68:
        DIS                                     ; 6D68   0003
        MVO     R1,     .ISRVEC.0               ; 6D69   0241 0100
        SWAP    R1,     1                       ; 6D6B   0041
        MVO     R1,     .ISRVEC.1               ; 6D6C   0241 0101
        MOVR    R5,     R7                      ; 6D6E   00AF

        PSHR    R5                              ; 6D6F   0275

        JSR     R5,     L_6BCD                  ; 6D70   0004 0168 03CD

        MVI     G_0135, R0                      ; 6D73   0280 0135
        TSTR    R0                              ; 6D75   0080
        BNEQ    L_6D8C                          ; 6D76   020C 0014

        MVI     G_0319, R0                      ; 6D78   0280 0319
        ADDI    #$0004, R0                      ; 6D7A   02F8 0004
        ANDI    #$007C, R0                      ; 6D7C   03B8 007C
        MVI     G_0112, R1                      ; 6D7E   0281 0112
        SWAP    R1,     1                       ; 6D80   0041
        SLR     R1,     1                       ; 6D81   0061
        XORR    R1,     R0                      ; 6D82   01C8
        MVO     R0,     G_0135                  ; 6D83   0240 0135
        CLRR    R0                              ; 6D85   01C0
        MVO     R0,     G_033F                  ; 6D86   0240 033F
        MVI     G_032F, R0                      ; 6D88   0280 032F
        MVO     R0,     G_0340                  ; 6D8A   0240 0340
L_6D8C:
        PULR    R7                              ; 6D8C   02B7

        PSHR    R5                              ; 6D8D   0275

        JSR     R5,     L_6BCD                  ; 6D8E   0004 0168 03CD

        TSTR    R0                              ; 6D91   0080
        BMI     L_6DB7                          ; 6D92   020B 0023

        MVII    #$01DB, R4                      ; 6D94   02BC 01DB
L_6D96:
        MVI@    R4,     R0                      ; 6D96   02A0
        ANDI    #$0080, R0                      ; 6D97   03B8 0080
        BEQ     L_6DA1                          ; 6D99   0204 0006

        CMPI    #$01DF, R4                      ; 6D9B   037C 01DF
        BNC     L_6D96                          ; 6D9D   0229 0008
        B       L_6DB7                          ; 6D9F   0200 0016

L_6DA1:
        DECR    R4                              ; 6DA1   0014

        JSR     R5,     L_6DB8                  ; 6DA2   0004 016C 01B8

        MVI     G_0112, R2                      ; 6DA5   0282 0112
        SLL     R2,     2                       ; 6DA7   004E
        SLL     R2,     2                       ; 6DA8   004E
        XORR    R2,     R1                      ; 6DA9   01D1
        XORI    #$0080, R1                      ; 6DAA   03F9 0080
        MOVR    R4,     R5                      ; 6DAC   00A5
        ADDI    #$0004, R5                      ; 6DAD   02FD 0004
        DIS                                     ; 6DAF   0003
        MVO@    R1,     R4                      ; 6DB0   0261
        MVO@    R0,     R5                      ; 6DB1   0268
        EIS                                     ; 6DB2   0002
        MVII    #$01F4, R0                      ; 6DB3   02B8 01F4
        MVO     R0,     G_0352                  ; 6DB5   0240 0352
L_6DB7:
        PULR    R7                              ; 6DB7   02B7

L_6DB8:
        DIS                                     ; 6DB8   0003
        MVI     G_010F, R0                      ; 6DB9   0280 010F
        MVI     G_0111, R1                      ; 6DBB   0281 0111
        EIS                                     ; 6DBD   0002
        PSHR    R0                              ; 6DBE   0270
        ADDI    #$0004, R0                      ; 6DBF   02F8 0004
        SLR     R0,     2                       ; 6DC1   0064
        SLR     R0,     1                       ; 6DC2   0060
        PSHR    R1                              ; 6DC3   0271
        ADDI    #$0002, R1                      ; 6DC4   02F9 0002
        SLR     R1,     2                       ; 6DC6   0065
        SLR     R1,     1                       ; 6DC7   0061
        SLL     R1,     2                       ; 6DC8   004D
        ADDR    R1,     R0                      ; 6DC9   00C8
        SLL     R1,     2                       ; 6DCA   004D
        ADDR    R1,     R0                      ; 6DCB   00C8
        SUBI    #$0015, R0                      ; 6DCC   0338 0015
        PULR    R1                              ; 6DCE   02B1
        ADDI    #$0002, R1                      ; 6DCF   02F9 0002
        ANDI    #$0007, R1                      ; 6DD1   03B9 0007
        PULR    R2                              ; 6DD3   02B2
        MOVR    R5,     R7                      ; 6DD4   00AF

L_6DD5:
        MVI     G_0102, R1                      ; 6DD5   0281 0102
        CMPI    #$0080, R1                      ; 6DD7   0379 0080
        BEQ     L_6DE2                          ; 6DD9   0204 0007

        CMPI    #$0081, R1                      ; 6DDB   0379 0081
        BEQ     L_6DE2                          ; 6DDD   0204 0003

        MVO     R0,     .STIC.VIDEN             ; 6DDF   0240 0020
        MOVR    R5,     R7                      ; 6DE1   00AF
L_6DE2:
        PULR    R7                              ; 6DE2   02B7

L_6DE3:
        MVI     .PSG0.chan_enable,R0            ; 6DE3   0280 01F8
        ANDI    #$00C0, R0                      ; 6DE5   03B8 00C0
        XORI    #$0031, R0                      ; 6DE7   03F8 0031
        MVO     R0,     .PSG0.chan_enable       ; 6DE9   0240 01F8
        CLRR    R0                              ; 6DEB   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 6DEC   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 6DEE   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 6DF0   0240 01FD
L_6DF2:
        PSHR    R5                              ; 6DF2   0275

        JSR     R5,     L_5082                  ; 6DF3   0004 0150 0082
        JSR     R5,     L_6E8F                  ; 6DF6   0004 016C 028F

        MVII    #$02E3, R4                      ; 6DF9   02BC 02E3
        MVII    #$01DA, R0                      ; 6DFB   02B8 01DA
        MVO@    R0,     R4                      ; 6DFD   0260
        SDBD                                    ; 6DFE   0001
        MVII    #$0815, R0                      ; 6DFF   02B8 0015 0008
        MVII    #$0004, R3                      ; 6E02   02BB 0004
L_6E04:
        MVO@    R0,     R4                      ; 6E04   0260
        ADDI    #$0008, R0                      ; 6E05   02F8 0008
        DECR    R3                              ; 6E07   0013
        BNEQ    L_6E04                          ; 6E08   022C 0005

        MVII    #$01EA, R0                      ; 6E0A   02B8 01EA
        MVO@    R0,     R4                      ; 6E0C   0260
        MVII    #$03F2, R0                      ; 6E0D   02B8 03F2
        MVO     R0,     G_0330                  ; 6E0F   0240 0330
        MVO     R0,     G_012B                  ; 6E11   0240 012B
        MVO     R0,     G_034B                  ; 6E13   0240 034B
        SDBD                                    ; 6E15   0001
        MVII    #$0E68, R0                      ; 6E16   02B8 0068 000E
        MVO     R0,     G_0331                  ; 6E19   0240 0331
        SDBD                                    ; 6E1B   0001
        MVII    #$6FC6, R1                      ; 6E1C   02B9 00C6 006F
        MVO     R1,     G_0338                  ; 6E1F   0241 0338
        SDBD                                    ; 6E21   0001
        MVII    #$3E00, R0                      ; 6E22   02B8 0000 003E
        MVO     R0,     G_0339                  ; 6E25   0240 0339
        MVII    #$0050, R1                      ; 6E27   02B9 0050
        MVO     R1,     G_010F                  ; 6E29   0241 010F
        CLRR    R0                              ; 6E2B   01C0
        MVO     R0,     G_033E                  ; 6E2C   0240 033E
        MVO     R0,     G_012E                  ; 6E2E   0240 012E
        INCR    R0                              ; 6E30   0008
        MVO     R0,     G_0112                  ; 6E31   0240 0112
        MVII    #$0028, R1                      ; 6E33   02B9 0028
        MVO     R1,     G_0111                  ; 6E35   0241 0111
        SDBD                                    ; 6E37   0001
        MVII    #$186C, R1                      ; 6E38   02B9 006C 0018
        MVO     R1,     G_031A                  ; 6E3B   0241 031A
        SDBD                                    ; 6E3D   0001
        MVII    #$0671, R1                      ; 6E3E   02B9 0071 0006
        MVO     R1,     .STIC.A.1               ; 6E41   0241 0011
        MVII    #$0008, R1                      ; 6E43   02B9 0008
        MVO     R1,     G_0165                  ; 6E45   0241 0165
        MVII    #$0064, R1                      ; 6E47   02B9 0064
        MVO     R1,     G_0166                  ; 6E49   0241 0166
        SDBD                                    ; 6E4B   0001
        MVII    #$38E0, R4                      ; 6E4C   02BC 00E0 0038
        MVII    #$00FF, R1                      ; 6E4F   02B9 00FF
        MVII    #$0008, R3                      ; 6E51   02BB 0008
L_6E53:
        MVO@    R1,     R4                      ; 6E53   0261
        ADDI    #$0008, R4                      ; 6E54   02FC 0008
        DECR    R3                              ; 6E56   0013
        BNEQ    L_6E53                          ; 6E57   022C 0005

        MVII    #$02A4, R4                      ; 6E59   02BC 02A4

        JSR     R5,     L_6E82                  ; 6E5B   0004 016C 0282

        MVII    #$02AB, R4                      ; 6E5E   02BC 02AB

        JSR     R5,     L_6E82                  ; 6E60   0004 016C 0282
        JSR     R5,     L_6E82                  ; 6E63   0004 016C 0282

        MVII    #$02C8, R4                      ; 6E66   02BC 02C8
        MVII    #$0004, R5                      ; 6E68   02BD 0004
L_6E6A:
        SDBD                                    ; 6E6A   0001
        MVII    #$08A3, R1                      ; 6E6B   02B9 00A3 0008
        MVII    #$0005, R3                      ; 6E6E   02BB 0005
L_6E70:
        MVO@    R1,     R4                      ; 6E70   0261
        ADDI    #$0008, R1                      ; 6E71   02F9 0008
        DECR    R3                              ; 6E73   0013
        BNEQ    L_6E70                          ; 6E74   022C 0005

        DECR    R5                              ; 6E76   0015
        BNEQ    L_6E6A                          ; 6E77   022C 000E

        SDBD                                    ; 6E79   0001
        MVII    #$A000, R0                      ; 6E7A   02B8 0000 00A0
        MVO     R0,     .BTAB.A0                ; 6E7D   0240 02A0
        MVO     R0,     .BTAB.DC                ; 6E7F   0240 02DC
        PULR    R7                              ; 6E81   02B7

L_6E82:
        SDBD                                    ; 6E82   0001
        MVII    #$1873, R1                      ; 6E83   02B9 0073 0018
        MVII    #$0004, R2                      ; 6E86   02BA 0004
L_6E88:
        MVO@    R1,     R4                      ; 6E88   0261
        ADDI    #$0008, R1                      ; 6E89   02F9 0008
        DECR    R2                              ; 6E8B   0012
        BNEQ    L_6E88                          ; 6E8C   022C 0005
        MOVR    R5,     R7                      ; 6E8E   00AF

L_6E8F:
        PSHR    R5                              ; 6E8F   0275
        MVII    #$0060, R0                      ; 6E90   02B8 0060
        SDBD                                    ; 6E92   0001
        MVII    #$3920, R4                      ; 6E93   02BC 0020 0039

        JSR     R5,     X_FILL_ZERO             ; 6E96   0004 0114 0338

        MVI     G_0163, R3                      ; 6E99   0283 0163
        ANDI    #$0003, R3                      ; 6E9B   03BB 0003
        BNEQ    L_6EA0                          ; 6E9D   020C 0001

        INCR    R3                              ; 6E9F   000B
L_6EA0:
        DECR    R3                              ; 6EA0   0013
        SLL     R3,     2                       ; 6EA1   004F
        MOVR    R3,     R2                      ; 6EA2   009A
        ADDR    R2,     R3                      ; 6EA3   00D3
        ADDR    R2,     R3                      ; 6EA4   00D3
        SDBD                                    ; 6EA5   0001
        ADDI    #$6ECE, R3                      ; 6EA6   02FB 00CE 006E
        MOVR    R3,     R4                      ; 6EA9   009C
        SDBD                                    ; 6EAA   0001
        MVII    #$3920, R3                      ; 6EAB   02BB 0020 0039
        MVII    #$0003, R5                      ; 6EAE   02BD 0003
L_6EB0:
        PSHR    R3                              ; 6EB0   0273
        MVII    #$0004, R2                      ; 6EB1   02BA 0004
L_6EB3:
        PSHR    R3                              ; 6EB3   0273
        MVI@    R4,     R0                      ; 6EB4   02A0
        MOVR    R0,     R1                      ; 6EB5   0081
        SLR     R1,     2                       ; 6EB6   0065
        SLR     R1,     2                       ; 6EB7   0065
        MVO@    R0,     R3                      ; 6EB8   0258
        ADDI    #$0008, R3                      ; 6EB9   02FB 0008
        MVO@    R1,     R3                      ; 6EBB   0259
        ADDI    #$000C, R3                      ; 6EBC   02FB 000C
        MVO@    R0,     R3                      ; 6EBE   0258
        ADDI    #$0008, R3                      ; 6EBF   02FB 0008
        MVO@    R1,     R3                      ; 6EC1   0259
        PULR    R3                              ; 6EC2   02B3
        INCR    R3                              ; 6EC3   000B
        DECR    R2                              ; 6EC4   0012
        BNEQ    L_6EB3                          ; 6EC5   022C 0013

        PULR    R3                              ; 6EC7   02B3
        ADDI    #$0020, R3                      ; 6EC8   02FB 0020
        DECR    R5                              ; 6ECA   0015
        BNEQ    L_6EB0                          ; 6ECB   022C 001C
        PULR    R7                              ; 6ECD   02B7

        DECLE   $0060,  $0070,  $0070,  $0060   ; 6ECE   0060 0070 0070 0060
        DECLE   $0060,  $0090,  $0090,  $0060   ; 6ED2   0060 0090 0090 0060
        DECLE   $0060,  $00E0,  $00E0,  $0060   ; 6ED6   0060 00E0 00E0 0060
        DECLE   $0090,  $0060,  $0090,  $0060   ; 6EDA   0090 0060 0090 0060
        DECLE   $00F0,  $0060,  $00F0,  $0060   ; 6EDE   00F0 0060 00F0 0060
        DECLE   $0060,  $00F0,  $0060,  $00F0   ; 6EE2   0060 00F0 0060 00F0
        DECLE   $0090,  $0060,  $0060,  $0090   ; 6EE6   0090 0060 0060 0090
        DECLE   $0090,  $0060,  $0060,  $0090   ; 6EEA   0090 0060 0060 0090
        DECLE   $0060,  $00F0,  $00F0,  $0060   ; 6EEE   0060 00F0 00F0 0060
        DECLE   $0000,  $0001,  $0001,  $0000   ; 6EF2   0000 0001 0001 0000
        DECLE   $0001,  $0000,  $007E,  $00C3   ; 6EF6   0001 0000 007E 00C3
        DECLE   $009D,  $00A1,  $00A1,  $009D   ; 6EFA   009D 00A1 00A1 009D
        DECLE   $00C3,  $007E,  $0002,  $000C   ; 6EFE   00C3 007E 0002 000C
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6F02   0000 0000 0000 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F06   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $001F   ; 6F0A   0000 0001 0001 001F
        DECLE   $0000,  $003C,  $0000,  $0000   ; 6F0E   0000 003C 0000 0000
        DECLE   $0001,  $001B,  $0000,  $0000   ; 6F12   0001 001B 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6F16   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $0004,  $0030   ; 6F1A   00FF 00FF 0004 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1E   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0003,  $0007   ; 6F22   0000 0001 0003 0007
        DECLE   $000F,  $001F,  $001F,  $003F   ; 6F26   000F 001F 001F 003F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; 6F2A   007F 007F 00FF 00FF

        SETC                                    ; 6F2E   0007
        INCR    R7                              ; 6F2F   000F

        DECLE   $003F                           ; 6F30   003F
L_6F31:
        SARC    R3,     2                       ; 6F31   007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6F32   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6F36   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6F3A   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F42   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0005   ; 6F46   0000 0001 0001 0005
        DECLE   $0007,  $000F,  $001F,  $001F   ; 6F4A   0007 000F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4E   0000 0000 0000 0000
        DECLE   $0001                           ; 6F52   0001

        DIS                                     ; 6F53   0003
        DIS                                     ; 6F54   0003
        SWAP    R3,     1                       ; 6F55   0043
        SWAP    R3,     1                       ; 6F56   0043
        RLC     R3,     1                       ; 6F57   0053
        RLC     R3,     2                       ; 6F58   0057
        ADDR    R3,     R7                      ; 6F59   00DF
        ADDR    R3,     R7                      ; 6F5A   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $0080   ; 6F5B   00FF 00FF 00FF 0080
        DECLE   $0080,  $00C0,  $00C8,  $0068   ; 6F5F   0080 00C0 00C8 0068
        DECLE   $00E8,  $00FD,  $00DE,  $0000   ; 6F63   00E8 00FD 00DE 0000
        DECLE   $0000,  $0008,  $0008,  $000C   ; 6F67   0000 0008 0008 000C
        DECLE   $001A,  $00AE,  $00FF,  $0000   ; 6F6B   001A 00AE 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F6F   0000 0000 0000 0000
        DECLE   $003C,  $0042,  $007E,  $007E   ; 6F73   003C 0042 007E 007E
        DECLE   $0062,  $006E,  $0066,  $006E   ; 6F77   0062 006E 0066 006E
        DECLE   $0062,  $007E,  $003C,  $0000   ; 6F7B   0062 007E 003C 0000
        DECLE   $0004,  $0006,  $00FE,  $007E   ; 6F7F   0004 0006 00FE 007E
        DECLE   $003E,  $000C,  $0000,  $0000   ; 6F83   003E 000C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F87   0000 0000 0000 0000
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 6F8B   001F 003F 007F 00FF
        DECLE   $0000,  $00FF,  $00FF,  $0090   ; 6F8F   0000 00FF 00FF 0090
        DECLE   $0090,  $0080,  $0000,  $0000   ; 6F93   0090 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F97   0000 0000 0000 0000
        DECLE   $00F0,  $00E0,  $00D0,  $00B0   ; 6F9B   00F0 00E0 00D0 00B0
        DECLE   $0070,  $00D0,  $0080,  $0080   ; 6F9F   0070 00D0 0080 0080
        DECLE   $0080,  $0080,  $0080,  $003E   ; 6FA3   0080 0080 0080 003E
        DECLE   $006F,  $004E,  $006F,  $004E   ; 6FA7   006F 004E 006F 004E
        DECLE   $006F,  $003E,  $006F,  $0012   ; 6FAB   006F 003E 006F 0012
        DECLE   $0008,  $0012,  $0108,  $0092   ; 6FAF   0008 0012 0108 0092
        DECLE   $0208,  $0092,  $0308,  $0066   ; 6FB3   0208 0092 0308 0066
        DECLE   $006F,  $005E,  $006F,  $005E   ; 6FB7   006F 005E 006F 005E
        DECLE   $006F,  $0066,  $006F,  $0080   ; 6FBB   006F 0066 006F 0080
        DECLE   $000C,  $0080,  $010C,  $0000   ; 6FBF   000C 0080 010C 0000

        BNEQ    L_6FC5                          ; 6FC3   020C 0000

L_6FC5:
        SUB@    R1,     R4                      ; 6FC5   030C
        DECLE   $006E,  $006F,  $007E,  $006F   ; 6FC6   006E 006F 007E 006F
        DECLE   $0086,  $006F,  $0096,  $006F   ; 6FCA   0086 006F 0096 006F
        DECLE   $0016,  $00E5,  $0000,  $010B   ; 6FCE   0016 00E5 0000 010B
        DECLE   $0215,  $000A,  $0215,  $020A   ; 6FD2   0215 000A 0215 020A
        DECLE   $00A6,  $006F,  $00C6,  $006F   ; 6FD6   00A6 006F 00C6 006F
        DECLE   $0001,  $0000,  $0001,  $0000   ; 6FDA   0001 0000 0001 0000
        DECLE   $0001,  $0000,  $0001,  $0000   ; 6FDE   0001 0000 0001 0000
        DECLE   $0001,  $001A,  $001F,  $003D   ; 6FE2   0001 001A 001F 003D
        DECLE   $0042,  $0047,  $0058,  $005D   ; 6FE6   0042 0047 0058 005D
        DECLE   $0062,  $0070,  $0075,  $007B   ; 6FEA   0062 0070 0075 007B
        DECLE   $0080,  $0085,  $0000,  $0001   ; 6FEE   0080 0085 0000 0001
        DECLE   $0000,  $0002,  $0000           ; 6FF2   0000 0002 0000

        DIS                                     ; 6FF5   0003
        DECLE   $0000,  $0004,  $0000,  $0000   ; 6FF6   0000 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $501F       <entry> $6C11  
;;  $504C       $504F  
;;  $5081       $5089  
;;  $5082       $5077   $6DF3  
;;  $5087       $509B  
;;  $5095       $5099  
;;  $509D       $5051  
;;  $50EA       $50EA  
;;  $50EC       $50A3  
;;  $50F2       $5155  
;;  $510A       $50F5  
;;  $5144       $5108   $510D  
;;  $5146       $5147  
;;  $514E       $50F0   $516D   $5182  
;;  $5184       $514E   $5163  
;;  $518F       $517C  
;;  $51B2       $51A4  
;;  $51D0       $532C   $662C  
;;  $51D2       $652C  
;;  $51EB       $51E5  
;;  $51ED       $51DA  
;;  $51F2       $5166  
;;  $51F9       $5218  
;;  $5211       $520B  
;;  $5217       $51FB   $5205   $520F  
;;  $5223       $5220  
;;  $5226       $5157  
;;  $5233       $5239  
;;  $523D       $5243  
;;  $5249       $524F  
;;  $5253       $525A  
;;  $525E       $522A   $5256  
;;  $52A8       $52A2  
;;  $52B0       $52A6  
;;  $52B8       $52C2  
;;  $52C0       $52BB  
;;  $52C4       $52B4  
;;  $52D3       $52D6  
;;  $52F2       $52F3  
;;  $5301       $5342  
;;  $5333       $5334  
;;  $533D       $533E  
;;  $5340       $5304  
;;  $5346       $534E  
;;  $534A       $534B  
;;  $5350       $52DB  
;;  $535D       $535A  
;;  $536E       $5363   $536A  
;;  $5389       $539B  
;;  $5394       $538F  
;;  $539A       $5392  
;;  $539D       $538B  
;;  $53B8       $53B0  
;;  $53D1       $53D2  
;;  $53DC       $53EF  
;;  $53E7       $53ED  
;;  $53E9       $53EA  
;;  $53F1       $53E5  
;;  $53F7       $53FA  
;;  $5408       $540B  
;;  $5415       $522F   $5235   $523F   $525C  
;;  $5416       $52C4   $5378  
;;  $545A       $52E3   $53C2   $5467  
;;  $5469       $545E  
;;  $562B       $517F  
;;  $5638       $5641  
;;  $5643       $5634  
;;  $5644       $563D  
;;  $565F       $5662  
;;  $5675       $5672  
;;  $56A5       $56A2  
;;  $56C1       $562F   $56C7  
;;  $56C2       $515A  
;;  $56CF       $56FE  
;;  $56E1       $56FA  
;;  $56F9       $56EA  
;;  $56FC       $56D1   $56DD   $56F7  
;;  $5727       $5723   $5732  
;;  $5734       $5728   $572A  
;;  $573C       $5738  
;;  $5749       $5743  
;;  $574E       $5703   $570A   $5753  
;;  $574F       $515D  
;;  $576E       $576B  
;;  $5778       $5772  
;;  $5788       $5784  
;;  $578A       $5788  
;;  $578C       $5792  
;;  $5796       $578E  
;;  $57A3       $5794  
;;  $57A4       $572D  
;;  $57A8       $57AE  
;;  $57B2       $57AA   $57D2  
;;  $57CB       $57D6  
;;  $57D0       $57CD  
;;  $57DA       $57B0  
;;  $57DC       $518B  
;;  $57F7       $57E8  
;;  $5808       $57F1   $57F5   $5802  
;;  $580E       $57E0   $57FB  
;;  $5810       $5819  
;;  $5835       $5832  
;;  $5837       $5828  
;;  $583F       $5838  
;;  $5840       $5188   $524A  
;;  $5843       $5897  
;;  $5853       $5850  
;;  $5867       $5864  
;;  $586F       $586B  
;;  $5874       $5876  
;;  $587D       $587A  
;;  $5882       $587F  
;;  $5886       $5892  
;;  $5895       $5845  
;;  $589A       $5886   $5889   $588C  
;;  $58A5       $589E  
;;  $58AF       $58A7   $58AB  
;;  $595B       $5953  
;;  $5971       $594D   $5959  
;;  $5975       $5905   $597B  
;;  $597E       $590A  
;;  $5988       $5984  
;;  $599C       $598E  
;;  $59BE       $59BB  
;;  $59F0       $59C9   $59CD  
;;  $5A12       $5A21  
;;  $5A4D       $5A27   $5A2D  
;;  $5A5F       $5A35  
;;  $5A67       $5910  
;;  $5A79       $5A6C  
;;  $5A7F       $5A77  
;;  $5A83       $590D  
;;  $5AFB       $5B0C  
;;  $5B0F       $5A47   $5A4A   $5A74   $5A7F  
;;  $5B23       $5916  
;;  $5B37       $5B27  
;;  $5B38       $5B2D   $5B34  
;;  $5B4C       $5B55  
;;  $5B67       $5B3B  
;;  $5B70       $5B76  
;;  $5B89       $5B3F   $5B65  
;;  $5B8A       $5919  
;;  $5BB1       $5BB8  
;;  $5BBE       $5BF4  
;;  $5BDD       $5BC9   $5BCD  
;;  $5BF1       $5BE0   $5BE4  
;;  $5BF6       $5B9C  
;;  $5C05       $5BFA  
;;  $5C08       $5C03  
;;  $5C15       $5C11  
;;  $5C1D       $5C19  
;;  $5C1F       $5BFE  
;;  $5C20       $5C34  
;;  $5C2F       $5C24  
;;  $5C32       $5C2D  
;;  $5C36       $5C28  
;;  $5C3B       $5C8C  
;;  $5C4A       $5C44  
;;  $5C53       $5C4E  
;;  $5C5D       $5C87  
;;  $5C83       $5C62  
;;  $5C89       $5C3D   $5C60   $5C70   $5C81  
;;  $5C92       $5C37  
;;  $5DBC       $5DBA  
;;  $5DDC       $5DDA  
;;  $6035       $591C  
;;  $604B       $603F  
;;  $604C       $6043   $6049  
;;  $6066       $6062  
;;  $606C       $6068  
;;  $606D       $606B  
;;  $6075       $6071  
;;  $607B       $6077  
;;  $607C       $607A  
;;  $6081       $6053  
;;  $6082       $5160  
;;  $608C       $6093  
;;  $6095       $6086   $6088  
;;  $60AC       $608F   $6099   $609F  
;;  $60AD       $5925  
;;  $60C8       $60BE   $60C3  
;;  $60D0       $60B9   $60CC  
;;  $60D7       $60DB  
;;  $60DD       $60D8  
;;  $60E4       $60E9  
;;  $60EB       $60E6  
;;  $60EC       $5922  
;;  $6100       $60F0   $60F4   $60FB  
;;  $6103       $610D   $6112  
;;  $610F       $6104  
;;  $6114       $6108  
;;  $6126       $612B  
;;  $6146       $613B   $6141  
;;  $6165       $6152  
;;  $6177       $6156   $6163  
;;  $6197       $6182  
;;  $61BC       $61B7  
;;  $61C6       $61E4  
;;  $61CB       $61C8  
;;  $61DC       $61D4   $61D8  
;;  $61E8       $617D  
;;  $61EA       $6135  
;;  $61F0       $61E8  
;;  $61F3       $6185   $6195   $619B   $61E6   $61EE  
;;  $61F5       $6207  
;;  $6202       $61F8  
;;  $6205       $61FC  
;;  $621A       $6217  
;;  $621C       $620C   $6212  
;;  $622E       $6227  
;;  $6234       $623E  
;;  $6240       $6222   $622C  
;;  $6266       $626F   $6272   $62A6  
;;  $6291       $6280  
;;  $62A5       $629F  
;;  $62B8       $626C  
;;  $62C3       $62C1  
;;  $62D9       $62D7  
;;  $6301       $62FF  
;;  $631A       $6318  
;;  $633B       $6143   $61F0   $63E9  
;;  $6342       $6389  
;;  $6390       $592B  
;;  $6396       $639C  
;;  $63A5       $63A8  
;;  $63C9       $63B5  
;;  $63DD       $63C7   $63CB  
;;  $63EC       $63E4  
;;  $63ED       $62B5   $63E6  
;;  $6412       $6405   $640C  
;;  $6415       $5913  
;;  $6425       $6421  
;;  $642C       $6427  
;;  $6434       $6442   $6449  
;;  $644B       $6436  
;;  $6451       $6419  
;;  $6452       $591F  
;;  $6467       $646A  
;;  $648D       $647D  
;;  $6497       $6483   $6485   $648B   $6491  
;;  $64E6       $64E0  
;;  $64E8       $6456  
;;  $64E9       $5937  
;;  $64EC       $6571  
;;  $6501       $64FE  
;;  $6510       $6505  
;;  $6517       $650E  
;;  $6531       $6537  
;;  $653B       $6533  
;;  $6542       $6539  
;;  $6544       $654A  
;;  $654E       $6546  
;;  $6552       $650C   $6514   $654C  
;;  $6558       $6520  
;;  $656F       $64F0   $6556   $655E  
;;  $6574       $6508   $6510  
;;  $657F       $6583  
;;  $6585       $657D  
;;  $6586       $6578   $6581  
;;  $6589       $592E  
;;  $65D7       $65BE  
;;  $65FB       $65F1   $65F7  
;;  $660E       $6621  
;;  $661A       $6617  
;;  $661F       $6610   $661B  
;;  $6634       $65DA   $65F9  
;;  $6657       $6645  
;;  $6662       $65AB   $6637  
;;  $6665       $658D   $6593  
;;  $667A       $6669  
;;  $668E       $6688  
;;  $6696       $65D5   $6660  
;;  $66A7       $66A4  
;;  $66BA       $66B7  
;;  $66BE       $66B2  
;;  $66C5       $66C2  
;;  $66D8       $66D5  
;;  $66DC       $66D0  
;;  $670D       $66E1   $66E5   $6702  
;;  $6738       $669E  
;;  $674F       $6744  
;;  $6758       $66F4  
;;  $6766       $6760  
;;  $6768       $6699   $670B   $674D   $6756  
;;  $6811       $5931  
;;  $6838       $6816  
;;  $6843       $6831   $6836  
;;  $6859       $6856  
;;  $685B       $6827   $682B   $683B   $6841   $684F  
;;  $686C       $6866  
;;  $687C       $6877  
;;  $6884       $6887  
;;  $6889       $685F  
;;  $688B       $6846  
;;  $688C       $5928  
;;  $68D2       $689B  
;;  $68E6       $68EA  
;;  $68F1       $68F4  
;;  $690F       $6895  
;;  $6919       $6922  
;;  $692D       $6897   $68A3   $68D0   $68DB   $690D  
;;  $6933       $6891  
;;  $693F       $6673   $68AF  
;;  $6943       $6947  
;;  $694E       $6951  
;;  $6954       $5173  
;;  $6957       $69BF  
;;  $6963       $695D  
;;  $69B4       $69B1  
;;  $69B8       $696E   $6975   $6979  
;;  $69BB       $69B6  
;;  $69C6       $5176   $5179  
;;  $69C9       $6AA8  
;;  $69F3       $69F0  
;;  $69FC       $69F5  
;;  $6A10       $6A05  
;;  $6A18       $6A0E  
;;  $6A26       $6A0A   $6A14  
;;  $6A2E       $69DF   $69FA  
;;  $6A45       $6A42  
;;  $6A52       $6A47  
;;  $6A5B       $6A57  
;;  $6A60       $6A69  
;;  $6A67       $6A63  
;;  $6A71       $6A2C   $6A50   $6A6E  
;;  $6A7D       $6A22  
;;  $6A82       $6A90  
;;  $6A88       $6A85  
;;  $6A94       $6A8A  
;;  $6AA2       $6A92  
;;  $6AA6       $69CB   $6A24   $6A7B  
;;  $6AC1       $6A9A  
;;  $6AD5       $5934  
;;  $6AE6       $6ADF  
;;  $6AF2       $6AE4  
;;  $6AF4       $6AD9  
;;  $6B06       $6AFF  
;;  $6B0F       $6B04  
;;  $6B11       $6AF7  
;;  $6B2A       $6B14  
;;  $6B3E       $6B35  
;;  $6B40       $6B3C  
;;  $6B4B       $6B2D  
;;  $6B6D       $6B55   $6B59  
;;  $6B76       $6B5E   $6B62  
;;  $6B78       $6B4E   $6B66   $6B6B  
;;  $6B8A       $6B86  
;;  $6B90       $6B8C  
;;  $6B99       $6B7B  
;;  $6BC5       $6BC2  
;;  $6BC9       $6BA9  
;;  $6BCC       $6BAE   $6BB9   $6BC7  
;;  $6BCD       $6BA5   $6C4E   $6D70   $6D8E  
;;  $6BD3       $6BD0  
;;  $6BF3       $6BF6  
;;  $6C0C       $6BDD  
;;  $6C14       $6BE5  
;;  $6C24       $6BD9   $6BE1   $6BEE   $6C0E   $6C17  
;;  $6C4D       $60A5  
;;  $6C6B       $6C56  
;;  $6C96       $6C93  
;;  $6CA6       $6CA3  
;;  $6CA8       $6C5C   $6C98   $6CB7   $6CC2   $6CCC   $6CD3   $6CE1   $6CE6  
;;  $6CA8       $6CEE  
;;  $6CA9       $6C88  
;;  $6CB9       $6CB2  
;;  $6CDE       $6C58   $6C6D  
;;  $6D11       $6D14  
;;  $6D2F       $6C5F   $6C7E   $6D1D   $6D36  
;;  $6D38       $6D31  
;;  $6D4A       $6D56  
;;  $6D50       $6D4B  
;;  $6D52       $6D4E  
;;  $6D68       $5023   $507E   $50A9   $52CF   $52EA   $53C9   $5404   $5411  
;;  $6D68       $6D0D   $6D5F  
;;  $6D8C       $6D76  
;;  $6D96       $6D9D  
;;  $6DA1       $6D99  
;;  $6DB7       $6D92   $6D9F  
;;  $6DB8       $6818   $6CEA   $6DA2  
;;  $6DD5       $58FF   $6D3A  
;;  $6DE2       $6DD9   $6DDD  
;;  $6DE3       $50EC  
;;  $6DF2       $5433  
;;  $6E04       $6E08  
;;  $6E53       $6E57  
;;  $6E6A       $6E77  
;;  $6E70       $6E74  
;;  $6E82       $6E5B   $6E60   $6E63  
;;  $6E88       $6E8C  
;;  $6E8F       $6DF6  
;;  $6EA0       $6E9D  
;;  $6EB0       $6ECB  
;;  $6EB3       $6EC5  
;;  $6F31       $6F2F  
;;  $6FC5       $6FC3  
;; ======================================================================== ;;
