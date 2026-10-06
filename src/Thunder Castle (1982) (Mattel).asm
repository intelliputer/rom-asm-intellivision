
        ORG     $5000
.HEADER:
        BIDECLE $62B6           ; 5000  Ptr: MOB graphic images
        BIDECLE $509B           ; 5002  Ptr: EXEC timer table
        BIDECLE $50DD           ; 5004  Ptr: Start of game
        BIDECLE $D4C6           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $D954           ; 5008  Ptr: GRAM init sequence
        BIDECLE $50D0           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0006,  $0061   ; 5018   01B0 01A0 0006 0061
        DECLE   $009B,  $0050,  $00DD,  $0050   ; 501C   009B 0050 00DD 0050
        DECLE   $00C6,  $00D4,  $0054,  $00D9   ; 5020   00C6 00D4 0054 00D9
        DECLE   $00D0,  $0050,  $0080,  $0000   ; 5024   00D0 0050 0080 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5028   0001 0000 0000 0000
        DECLE   $0000,  $0000                   ; 502C   0000 0000

        XORR    R6,     R0                      ; 502E   01F0
        XORR    R4,     R0                      ; 502F   01E0
        XORR    R2,     R0                      ; 5030   01D0
        CLRR    R0                              ; 5031   01C0
        ANDR    R6,     R0                      ; 5032   01B0
        ANDR    R4,     R0                      ; 5033   01A0
        ANDR    R2,     R0                      ; 5034   0190
        ANDR    R0,     R0                      ; 5035   0180
        TSTR    R6                              ; 5036   00B6
        SLR     R2,     1                       ; 5037   0062
        MOVR    R4,     R7                      ; 5038   00A7

        DECLE   $0050,  $0000,  $0000,  $003E   ; 5039   0050 0000 0000 003E
        DECLE   $00D2,  $0000,  $0000,  $00D0   ; 503D   00D2 0000 0000 00D0
        DECLE   $0050,  $0080,  $0000,  $0001   ; 5041   0050 0080 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5045   0000 0000 0000 0000
        DECLE   $0000                           ; 5049   0000

        XORR    R6,     R0                      ; 504A   01F0
        XORR    R4,     R0                      ; 504B   01E0
        XORR    R2,     R0                      ; 504C   01D0
        CLRR    R0                              ; 504D   01C0
        ANDR    R6,     R0                      ; 504E   01B0
        ANDR    R4,     R0                      ; 504F   01A0
        ANDR    R2,     R0                      ; 5050   0190
        ANDR    R0,     R0                      ; 5051   0180
        NEGR    R6                              ; 5052   0026
        SAR     R0,     1                       ; 5053   0068
        MOVR    R4,     R7                      ; 5054   00A7

        DECLE   $0050,  $0000,  $0000,  $003E   ; 5055   0050 0000 0000 003E
        DECLE   $00D2,  $0000,  $0000,  $00D0   ; 5059   00D2 0000 0000 00D0
        DECLE   $0050,  $0080,  $0000,  $0001   ; 505D   0050 0080 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5061   0000 0000 0000 0000
        DECLE   $0000,  $01F0,  $01E0,  $01D0   ; 5065   0000 01F0 01E0 01D0
        DECLE   $01C0,  $01B0,  $01A0,  $0190   ; 5069   01C0 01B0 01A0 0190
        DECLE   $0180,  $0062,  $0079,  $0020   ; 506D   0180 0062 0079 0020
        DECLE   $0043,  $006F,  $006E,  $006E   ; 5071   0043 006F 006E 006E
        DECLE   $0069,  $0065,  $0020,  $0047   ; 5075   0069 0065 0020 0047
        DECLE   $006F,  $006C,  $0064,  $006D   ; 5079   006F 006C 0064 006D
        DECLE   $0061,  $006E,  $0020,  $0026   ; 507D   0061 006E 0020 0026
        DECLE   $0020,  $0044,  $0061,  $0076   ; 5081   0020 0044 0061 0076
        DECLE   $0065,  $0020,  $0057,  $0061   ; 5085   0065 0020 0057 0061
        DECLE   $0072,  $0068,  $006F,  $006C   ; 5089   0072 0068 006F 006C
        DECLE   $002E,  $0050,  $004A,  $0050   ; 508D   002E 0050 004A 0050
        DECLE   $002E,  $0050,  $0066,  $0050   ; 5091   002E 0050 0066 0050
        DECLE   $002E,  $0050,  $0066,  $0050   ; 5095   002E 0050 0066 0050
        DECLE   $0014,  $0050                   ; 5099   0014 0050
.TIMER:
        DECLE   $00D0,  $0051,  $0001,  $0000; 509B  Timer dispatch/interval
        DECLE   $0077,  $0059,  $0004,  $0000; 509F  Timer dispatch/interval
        BIDECLE $0000           ; 50A3  End of timer table

        DECLE   $0000,  $0000,  $00B7,  $0050   ; 50A5   0000 0000 00B7 0050
        DECLE   $0001,  $0000,  $00C5,  $0050   ; 50A9   0001 0000 00C5 0050
        DECLE   $0004,  $0000,  $0003,  $00D1   ; 50AD   0004 0000 0003 00D1
        DECLE   $0030,  $0080,  $0000,  $0000   ; 50B1   0030 0080 0000 0000
        DECLE   $0000,  $0000                   ; 50B5   0000 0000

        PSHR    R5                              ; 50B7   0275

        JSR     R5,     L_F5A6                  ; 50B8   0004 01F4 01A6
        JSR     R5,     L_54A1                  ; 50BB   0004 0154 00A1
        JSR     R5,     L_5C28                  ; 50BE   0004 015C 0028
        JSR     R5,     L_51D0                  ; 50C1   0004 0150 01D0

        PULR    R7                              ; 50C4   02B7

        PSHR    R5                              ; 50C5   0275

        JSR     R5,     L_5977                  ; 50C6   0004 0158 0177
        JSR     R5,     L_5777                  ; 50C9   0004 0154 0377
        JSR     R5,     L_5A5F                  ; 50CC   0004 0158 025F

        PULR    R7                              ; 50CF   02B7

.TITLE:
        DECLE   $0052                           ; 50D0  Cartridge year
        DECLE   $0000                           ; 50D1  

.TITLECODE:
        PULR    R7                              ; 50D2   02B7

L_50D3:
        JSR     R5,     L_525B                  ; 50D3   0004 0150 025B
        JSR     R5,     L_533C                  ; 50D6   0004 0150 033C
        JSR     R5,     .EXEC.E38               ; 50D9   0004 011C 0238

        INCR    R7                              ; 50DC   000F

.START:
        PSHR    R5                              ; 50DD   0275
L_50DE:
        CLRR    R0                              ; 50DE   01C0
        MVO     R0,     .STIC.BORD              ; 50DF   0240 002C
        MVO     R0,     .STIC.CS.0              ; 50E1   0240 0028
        MVII    #$0003, R0                      ; 50E3   02B8 0003
        MVO     R0,     G_0103                  ; 50E5   0240 0103

        JSR     R5,     L_514E                  ; 50E7   0004 0150 014E

        SDBD                                    ; 50EA   0001
        MVII    #$527A, R0                      ; 50EB   02B8 007A 0052
        MVO     R0,     .ISRVEC.0               ; 50EE   0240 0100
        SWAP    R0,     1                       ; 50F0   0040
        MVO     R0,     .ISRVEC.1               ; 50F1   0240 0101
        MVI     G_0315, R0                      ; 50F3   0280 0315
        INCR    R0                              ; 50F5   0008
        ANDI    #$0003, R0                      ; 50F6   03B8 0003
        MVO     R0,     G_0315                  ; 50F8   0240 0315
        MVII    #$0118, R0                      ; 50FA   02B8 0118
        MVO     R0,     G_0316                  ; 50FC   0240 0316

        JSR     R5,     L_FCD7                  ; 50FE   0004 01FC 00D7

        MVII    #$0006, R0                      ; 5101   02B8 0006
        SDBD                                    ; 5103   0001
        MVII    #$DAB6, R1                      ; 5104   02B9 00B6 00DA

        JSR     R5,     L_53E4                  ; 5107   0004 0150 03E4

        MVII    #$0321, R4                      ; 510A   02BC 0321
L_510C:
        MVI@    R5,     R0                      ; 510C   02A8
        SWAP    R0,     1                       ; 510D   0040
        MVO@    R0,     R4                      ; 510E   0260
        ADDI    #$0007, R4                      ; 510F   02FC 0007
        CMPI    #$034D, R4                      ; 5111   037C 034D
        BLT     L_510C                          ; 5113   0225 0008

        MVII    #$007E, R0                      ; 5115   02B8 007E
        MVO     R0,     G_011A                  ; 5117   0240 011A
        MVI     G_0102, R0                      ; 5119   0280 0102
        ANDI    #$007F, R0                      ; 511B   03B8 007F
        MVO     R0,     G_0102                  ; 511D   0240 0102
        EIS                                     ; 511F   0002
        PULR    R7                              ; 5120   02B7

        SDBD                                    ; 5121   0001
        MVII    #$108F, R4                      ; 5122   02BC 008F 0010
        MVII    #$02F1, R5                      ; 5125   02BD 02F1
        MVO@    R4,     R5                      ; 5127   026C
        MOVR    R5,     R6                      ; 5128   00AE
        MVI     G_015E, R0                      ; 5129   0280 015E
        CMPI    #$0006, R0                      ; 512B   0378 0006
        BEQ     L_513F                          ; 512D   0204 0010

        JSR     R5,     .EXEC.A83               ; 512F   0004 0118 0283
        JSR     R5,     L_533C                  ; 5132   0004 0150 033C

        MVII    #$0200, R4                      ; 5135   02BC 0200
        MVII    #$00F0, R0                      ; 5137   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5139   0004 0114 0338
        JSR     R5,     L_514E                  ; 513C   0004 0150 014E

L_513F:
        CLRR    R0                              ; 513F   01C0
        MVO     R0,     G_0316                  ; 5140   0240 0316
        SDBD                                    ; 5142   0001
        MVII    #$DE34, R0                      ; 5143   02B8 0034 00DE
        MVO     R0,     G_035D                  ; 5146   0240 035D
        EIS                                     ; 5148   0002

        JSR     R5,     L_D000                  ; 5149   0004 01D0 0000

        B       L_524D                          ; 514C   0200 00FF

L_514E:
        PSHR    R5                              ; 514E   0275
        MVII    #$0006, R0                      ; 514F   02B8 0006
        MVO     R0,     G_015E                  ; 5151   0240 015E
        MVII    #$00FF, R0                      ; 5153   02B8 00FF
        MVO     R0,     G_016A                  ; 5155   0240 016A
        SDBD                                    ; 5157   0001
        MVII    #$5178, R5                      ; 5158   02BD 0078 0051
L_515B:
        MVI@    R5,     R4                      ; 515B   02AC
        TSTR    R4                              ; 515C   00A4
        BEQ     L_516B                          ; 515D   0204 000C

L_515F:
        MVI@    R5,     R0                      ; 515F   02A8
        CMPI    #$002F, R0                      ; 5160   0378 002F
        BEQ     L_515B                          ; 5162   0224 0008

        SDBD                                    ; 5164   0001
        XORI    #$0806, R0                      ; 5165   03F8 0006 0008
        MVO@    R0,     R4                      ; 5168   0260
        B       L_515F                          ; 5169   0220 000B

L_516B:
        SDBD                                    ; 516B   0001
        MVII    #$089F, R0                      ; 516C   02B8 009F 0008
        MVO     R0,     .BTAB.CE                ; 516F   0240 02CE
        SDBD                                    ; 5171   0001
        MVII    #$0527, R0                      ; 5172   02B8 0027 0005
        MVO     R0,     .BTAB.25                ; 5175   0240 0225
        PULR    R7                              ; 5177   02B7

        DECLE   $027E,  $0038,  $0048,  $0000   ; 5178   027E 0038 0048 0000

        RRC     R0,     1                       ; 517C   0070
        SWAP    R0,     1                       ; 517D   0040
        DECR    R0                              ; 517E   0010
        RLC     R0,     1                       ; 517F   0050
        MOVR    R2,     R0                      ; 5180   0090
        ADCR    R7                              ; 5181   002F

        MVI@    R2,     R2                      ; 5182   0292
L_5183:
        COMR    R0                              ; 5183   0018
        GSWD    R0                              ; 5184   0030
        ADCR    R7                              ; 5185   002F

        MVI@    R2,     R4                      ; 5186   0294
L_5187:
        NEGR    R0                              ; 5187   0020
        ADCR    R0                              ; 5188   0028
        SLLC    R0,     1                       ; 5189   0058
        TSTR    R0                              ; 518A   0080
        MOVR    R1,     R0                      ; 518B   0088
        SARC    R0,     1                       ; 518C   0078
        INCR    R0                              ; 518D   0008
        ADCR    R7                              ; 518E   002F

        MVI@    R5,     R0                      ; 518F   02A8
L_5190:
        SAR     R0,     1                       ; 5190   0068
        DECLE   $0060,  $002F,  $0000           ; 5191   0060 002F 0000
L_5194:
        PSHR    R5                              ; 5194   0275

        JSR     R5,     L_53DB                  ; 5195   0004 0150 03DB
        JSR     R5,     .EXEC.A83               ; 5198   0004 0118 0283
        JSR     R5,     L_5326                  ; 519B   0004 0150 0326
        JSR     R5,     L_525B                  ; 519E   0004 0150 025B
        JSR     R5,     L_546F                  ; 51A1   0004 0154 006F
        JSR     R5,     L_FCA3                  ; 51A4   0004 01FC 00A3

        MVI     G_015E, R0                      ; 51A7   0280 015E
        ANDI    #$0001, R0                      ; 51A9   03B8 0001
        BNEQ    L_51B6                          ; 51AB   020C 0009

        JSR     R5,     L_5340                  ; 51AD   0004 0150 0340

        MVII    #$00AA, R0                      ; 51B0   02B8 00AA
        MVO     R0,     G_015D                  ; 51B2   0240 015D
        B       L_51CC                          ; 51B4   0200 0016

L_51B6:
        JSR     R5,     L_5365                  ; 51B6   0004 0150 0365
        JSR     R5,     L_5E3D                  ; 51B9   0004 015C 023D
        JSR     R5,     L_5D79                  ; 51BC   0004 015C 0179
        JSR     R5,     L_F5F6                  ; 51BF   0004 01F4 01F6
        JSR     R5,     L_5C90                  ; 51C2   0004 015C 0090

        CLRR    R0                              ; 51C5   01C0
        MVO     R0,     G_015D                  ; 51C6   0240 015D
        MVII    #$004B, R0                      ; 51C8   02B8 004B
        MVO     R0,     G_0166                  ; 51CA   0240 0166

L_51CC:
        JSR     R5,     .EXEC.7FE               ; 51CC   0004 0114 03FE

        PULR    R7                              ; 51CF   02B7

L_51D0:
        PSHR    R5                              ; 51D0   0275
        MVI     G_0316, R0                      ; 51D1   0280 0316
        DECR    R0                              ; 51D3   0010
        BMI     L_5208                          ; 51D4   020B 0032

        MVO     R0,     G_0316                  ; 51D6   0240 0316
        MVO     R6,     G_011E                  ; 51D8   0246 011E
        MVI     .PSG0.rgt_hand,R5               ; 51DA   0285 01FE
        AND     .PSG0.lft_hand,R5               ; 51DC   0385 01FF
        CMPI    #$00FF, R5                      ; 51DE   037D 00FF
        BNEQ    L_51E8                          ; 51E0   020C 0006

        SDBD                                    ; 51E2   0001
        MVII    #$DE2A, R5                      ; 51E3   02BD 002A 00DE
        MVO     R5,     G_035D                  ; 51E6   0245 035D
L_51E8:
        TSTR    R0                              ; 51E8   0080
        BNEQ    L_5205                          ; 51E9   020C 001A

        MVI     G_015E, R0                      ; 51EB   0280 015E
        CMPI    #$0005, R0                      ; 51ED   0378 0005
        BEQ     L_50D3                          ; 51EF   0224 011D

        MVO     R6,     G_0316                  ; 51F1   0246 0316
        MVI     G_0315, R0                      ; 51F3   0280 0315
        MVO     R0,     G_0162                  ; 51F5   0240 0162

        JSR     R5,     L_5194                  ; 51F7   0004 0150 0194

        MVI     G_015E, R1                      ; 51FA   0281 015E
        ANDI    #$0001, R1                      ; 51FC   03B9 0001
        SDBD                                    ; 51FE   0001
        ADDI    #$5206, R1                      ; 51FF   02F9 0006 0052
        MVI@    R1,     R0                      ; 5202   0288
        MVO     R0,     G_0316                  ; 5203   0240 0316
L_5205:
        PULR    R7                              ; 5205   02B7

        ADDR    R1,     R0                      ; 5206   00C8
        CMPR    R3,     R6                      ; 5207   015E
L_5208:
        MVI     G_0166, R0                      ; 5208   0280 0166
        DECR    R0                              ; 520A   0010
        BMI     L_5218                          ; 520B   020B 000B

        MVO     R0,     G_0166                  ; 520D   0240 0166
        BNEQ    L_5218                          ; 520F   020C 0007

        MVII    #$000C, R0                      ; 5211   02B8 000C
        MVO     R0,     G_016A                  ; 5213   0240 016A

        JSR     R5,     L_F6F9                  ; 5215   0004 01F4 02F9

L_5218:
        MVI     G_0165, R0                      ; 5218   0280 0165
        DECR    R0                              ; 521A   0010
        BMI     L_5227                          ; 521B   020B 000A

        MVO     R0,     G_0165                  ; 521D   0240 0165
        BNEQ    L_5227                          ; 521F   020C 0006

        MVI     G_0172, R0                      ; 5221   0280 0172
        SUBI    #$0003, R0                      ; 5223   0338 0003
        MVO     R0,     G_0172                  ; 5225   0240 0172
L_5227:
        MVI     G_015D, R0                      ; 5227   0280 015D
        DECR    R0                              ; 5229   0010
        BMI     L_523E                          ; 522A   020B 0012

        MVO     R0,     G_015D                  ; 522C   0240 015D
        BEQ     L_523F                          ; 522E   0204 000F

        MVI     G_015E, R5                      ; 5230   0285 015E
        ANDI    #$0001, R5                      ; 5232   03BD 0001
        BNEQ    L_523E                          ; 5234   020C 0008

        CMPI    #$0064, R0                      ; 5236   0378 0064
        BNEQ    L_523E                          ; 5238   020C 0004

        MVII    #$0001, R0                      ; 523A   02B8 0001
        MVO     R0,     G_01C6                  ; 523C   0240 01C6
L_523E:
        PULR    R7                              ; 523E   02B7

L_523F:
        MVI     G_015E, R5                      ; 523F   0285 015E
        ANDI    #$0001, R5                      ; 5241   03BD 0001
        BEQ     L_5257                          ; 5243   0204 0012

        MVI     G_0160, R5                      ; 5245   0285 0160
        TSTR    R5                              ; 5247   00AD
        BNEQ    L_5257                          ; 5248   020C 000D

        JSR     R5,     L_D07B                  ; 524A   0004 01D0 007B

L_524D:
        MVI     G_015E, R0                      ; 524D   0280 015E
        SUBI    #$0002, R0                      ; 524F   0338 0002
        BPL     L_5255                          ; 5251   0203 0002

        MVII    #$0005, R0                      ; 5253   02B8 0005
L_5255:
        MVO     R0,     G_015E                  ; 5255   0240 015E

L_5257:
        JSR     R5,     L_5194                  ; 5257   0004 0150 0194

        PULR    R7                              ; 525A   02B7

L_525B:
        JSR     R4,     L_5271                  ; 525B   0004 0050 0271
        DECLE   $0181,  $0186,  $018E,  $0184   ; 525E   0181 0186 018E 0184
        DECLE   $018B,  $016A,  $0171,  $0166   ; 5262   018B 016A 0171 0166
        DECLE   $0195,  $0146,  $01C6,  $01C7   ; 5266   0195 0146 01C6 01C7
        DECLE   $015F,  $0160,  $011A,  $018D   ; 526A   015F 0160 011A 018D
        DECLE   $01C8,  $01C9,  $0000           ; 526E   01C8 01C9 0000
L_5271:
        CLRR    R0                              ; 5271   01C0
L_5272:
        MVI@    R4,     R1                      ; 5272   02A1
        TSTR    R1                              ; 5273   0089
        BEQ     L_5279                          ; 5274   0204 0003

        MVO@    R0,     R1                      ; 5276   0248
        B       L_5272                          ; 5277   0220 0006
L_5279:
        MOVR    R5,     R7                      ; 5279   00AF

        PSHR    R5                              ; 527A   0275
        MVI     G_0102, R1                      ; 527B   0281 0102
        SWAP    R1,     1                       ; 527D   0041
        SWAP    R1,     1                       ; 527E   0041
        BPL     L_5284                          ; 527F   0203 0003
        J       .EXEC.0BE                       ; 5281   0004 0310 00BE

L_5284:
        CLRR    R0                              ; 5284   01C0
        MVO     R0,     .STIC.BORD              ; 5285   0240 002C
        MVI     G_0169, R0                      ; 5287   0280 0169
        TSTR    R0                              ; 5289   0080
        BEQ     L_52B1                          ; 528A   0204 0025

        DIS                                     ; 528C   0003
        CLRR    R4                              ; 528D   01E4
        MVO     R4,     G_0112                  ; 528E   0244 0112
        MVO     R4,     G_0113                  ; 5290   0244 0113
        MVII    #$0010, R0                      ; 5292   02B8 0010

        JSR     R5,     X_FILL_ZERO             ; 5294   0004 0114 0338

        MVI     G_015E, R0                      ; 5297   0280 015E
        SLL     R0,     1                       ; 5299   0048
        SDBD                                    ; 529A   0001
        MVII    #$508D, R4                      ; 529B   02BC 008D 0050
        ADDR    R0,     R4                      ; 529E   00C4
        SDBD                                    ; 529F   0001
        MVI@    R4,     R5                      ; 52A0   02A5
        MVO     R5,     G_02F0                  ; 52A1   0245 02F0
        SDBD                                    ; 52A3   0001
        MVII    #$D9B5, R4                      ; 52A4   02BC 00B5 00D9
        ADDR    R0,     R4                      ; 52A7   00C4
        SDBD                                    ; 52A8   0001
        MVI@    R4,     R5                      ; 52A9   02A5

        JSRD    R4,     X_NEW_GRAM_INIT         ; 52AA   0004 001E 0335

        CLRR    R0                              ; 52AD   01C0
        MVO     R0,     G_0169                  ; 52AE   0240 0169
        PULR    R7                              ; 52B0   02B7

L_52B1:
        JSR     R5,     L_D1FB                  ; 52B1   0004 01D0 01FB
        JSR     R5,     L_5789                  ; 52B4   0004 0154 0389
        JSR     R5,     L_5AEE                  ; 52B7   0004 0158 02EE
        JSR     R5,     L_5A3B                  ; 52BA   0004 0158 023B

        MVI     G_016A, R1                      ; 52BD   0281 016A
        CMPI    #$00FF, R1                      ; 52BF   0379 00FF
        BNEQ    L_52C7                          ; 52C1   020C 0004

        MVI     .STIC.MODE,R1                   ; 52C3   0281 0021
        B       L_52DB                          ; 52C5   0200 0014

L_52C7:
        MVO     R1,     .STIC.MODE              ; 52C7   0241 0021
        DECR    R1                              ; 52C9   0011
        BMI     L_52D3                          ; 52CA   020B 0007

        MVO     R1,     G_016A                  ; 52CC   0241 016A
        ANDI    #$0002, R1                      ; 52CE   03B9 0002
        SLR     R1,     1                       ; 52D0   0061
        BNEQ    L_52D4                          ; 52D1   020C 0001

L_52D3:
        CLRR    R1                              ; 52D3   01C9
L_52D4:
        SDBD                                    ; 52D4   0001
        ADDI    #$5324, R1                      ; 52D5   02F9 0024 0053
        MVI@    R1,     R0                      ; 52D8   0288
        MVO     R0,     .STIC.BORD              ; 52D9   0240 002C

L_52DB:
        JSR     R5,     X_DEF_ISR               ; 52DB   0004 0110 0126
        JSR     R5,     L_5C6F                  ; 52DE   0004 015C 006F
        JSR     R5,     L_DE74                  ; 52E1   0004 01DC 0274

        MVII    #$01FF, R1                      ; 52E4   02B9 01FF
        SUB     G_01AF, R1                      ; 52E6   0301 01AF
        MVI@    R1,     R0                      ; 52E8   0288
        MVI     G_01AE, R5                      ; 52E9   0285 01AE
        TSTR    R5                              ; 52EB   00AD
        BNEQ    L_52F0                          ; 52EC   020C 0002

        AND     .PSG0.rgt_hand,R0               ; 52EE   0380 01FE
L_52F0:
        ANDI    #$001F, R0                      ; 52F0   03B8 001F
        CLRR    R1                              ; 52F2   01C9
        SDBD                                    ; 52F3   0001
        MVII    #$5317, R4                      ; 52F4   02BC 0017 0053
        CMP@    R4,     R0                      ; 52F7   0360
        BEQ     L_5309                          ; 52F8   0204 000F

L_52FA:
        INCR    R1                              ; 52FA   0009
        CMP@    R4,     R0                      ; 52FB   0360
        BEQ     L_5309                          ; 52FC   0204 000B

        CMP@    R4,     R0                      ; 52FE   0360
        BEQ     L_5309                          ; 52FF   0204 0008

        CMP@    R4,     R0                      ; 5301   0360
        BEQ     L_5309                          ; 5302   0204 0005

        CMPI    #$0004, R1                      ; 5304   0379 0004
        BLT     L_52FA                          ; 5306   0225 000D
        PULR    R7                              ; 5308   02B7

L_5309:
        CMP     G_016B, R1                      ; 5309   0341 016B
        BNEQ    L_5310                          ; 530B   020C 0003

L_530D:
        MVO     R1,     G_016F                  ; 530D   0241 016F
        PULR    R7                              ; 530F   02B7

L_5310:
        CMP     G_016F, R1                      ; 5310   0341 016F
        BNEQ    L_530D                          ; 5312   022C 0006

        MVO     R1,     G_016B                  ; 5314   0241 016B
        PULR    R7                              ; 5316   02B7

        DECLE   $001F                           ; 5317   001F

        INCR    R5                              ; 5318   000D
        COMR    R5                              ; 5319   001D
        COMR    R1                              ; 531A   0019
        INCR    R6                              ; 531B   000E
        COMR    R6                              ; 531C   001E
        COMR    R4                              ; 531D   001C
        SETC                                    ; 531E   0007
L_531F:
        DECR    R7                              ; 531F   0017

        DECLE   $0016,  $000B,  $001B,  $0013   ; 5320   0016 000B 001B 0013
        DECLE   $0000                           ; 5324   0000

        SETC                                    ; 5325   0007
L_5326:
        MVI     G_015E, R0                      ; 5326   0280 015E
        INCR    R0                              ; 5328   0008
        CMPI    #$0006, R0                      ; 5329   0378 0006
        BLT     L_532E                          ; 532B   0205 0001

        CLRR    R0                              ; 532D   01C0
L_532E:
        PSHR    R5                              ; 532E   0275
        MVO     R0,     G_015E                  ; 532F   0240 015E

        JSR     R5,     L_53DB                  ; 5331   0004 0150 03DB

        MVO     R6,     G_0169                  ; 5334   0246 0169
L_5336:
        MVI     G_0169, R0                      ; 5336   0280 0169
        TSTR    R0                              ; 5338   0080
        BNEQ    L_5336                          ; 5339   022C 0004
        PULR    R7                              ; 533B   02B7

L_533C:
        MVII    #$0006, R0                      ; 533C   02B8 0006
        B       L_532E                          ; 533E   0220 0011

L_5340:
        PSHR    R5                              ; 5340   0275

        JSR     R5,     L_53DB                  ; 5341   0004 0150 03DB

        SDBD                                    ; 5344   0001
        MVII    #$F5A0, R4                      ; 5345   02BC 00A0 00F5
        ADD     G_015E, R4                      ; 5348   02C4 015E
        SDBD                                    ; 534A   0001
        MVI@    R4,     R5                      ; 534B   02A5
        MVII    #$0200, R4                      ; 534C   02BC 0200
L_534E:
        SDBD                                    ; 534E   0001
        MVI@    R5,     R0                      ; 534F   02A8
        MVO@    R0,     R4                      ; 5350   0260
        CMPI    #$02F0, R4                      ; 5351   037C 02F0
        BNEQ    L_534E                          ; 5353   022C 0006

        MVI     G_015E, R0                      ; 5355   0280 015E
        MOVR    R0,     R4                      ; 5357   0084
        SLR     R0,     1                       ; 5358   0060
        ADDR    R0,     R4                      ; 5359   00C4
        SDBD                                    ; 535A   0001
        ADDI    #$D9C3, R4                      ; 535B   02FC 00C3 00D9
        SDBD                                    ; 535E   0001
        MVI@    R4,     R1                      ; 535F   02A1
        MVI@    R4,     R0                      ; 5360   02A0

        JSR     R5,     L_53E4                  ; 5361   0004 0150 03E4

        PULR    R7                              ; 5364   02B7

L_5365:
        PSHR    R5                              ; 5365   0275
        MVI     G_015E, R0                      ; 5366   0280 015E
        DECR    R0                              ; 5368   0010
        SDBD                                    ; 5369   0001
        MVII    #$FBFB, R4                      ; 536A   02BC 00FB 00FB
        ADDR    R0,     R4                      ; 536D   00C4
        SDBD                                    ; 536E   0001
        MVI@    R4,     R2                      ; 536F   02A2
        SDBD                                    ; 5370   0001
        MVII    #$FC01, R4                      ; 5371   02BC 0001 00FC
        PSHR    R0                              ; 5374   0270
        SLL     R0,     1                       ; 5375   0048
        ADD@    R6,     R0                      ; 5376   02F0
        ADDR    R0,     R4                      ; 5377   00C4
        MVI     G_0162, R0                      ; 5378   0280 0162
        CMPI    #$0003, R0                      ; 537A   0378 0003
        BNEQ    L_538D                          ; 537C   020C 000F

        MVI     G_015E, R1                      ; 537E   0281 015E
        SLR     R1,     1                       ; 5380   0061
        SDBD                                    ; 5381   0001
        ADDI    #$5458, R1                      ; 5382   02F9 0058 0054
        MVI@    R1,     R5                      ; 5385   028D
        MVO     R5,     G_0182                  ; 5386   0245 0182

        JSR     R5,     X_RAND2                 ; 5388   0004 0114 029E

        MVO     R0,     G_0162                  ; 538B   0240 0162
L_538D:
        MVO     R0,     G_0161                  ; 538D   0240 0161
        SLL     R0,     1                       ; 538F   0048
        ADDR    R0,     R4                      ; 5390   00C4
        SDBD                                    ; 5391   0001
        MVI@    R4,     R0                      ; 5392   02A0
        MOVR    R0,     R4                      ; 5393   0084
        MVII    #$0200, R3                      ; 5394   02BB 0200
L_5396:
        MVI@    R4,     R0                      ; 5396   02A0
L_5397:
        MOVR    R0,     R1                      ; 5397   0081
        ANDI    #$001F, R1                      ; 5398   03B9 001F
        MOVR    R2,     R5                      ; 539A   0095
L_539B:
        CMP@    R5,     R1                      ; 539B   0369
        BGE     L_53A1                          ; 539C   020D 0003

        INCR    R5                              ; 539E   000D
        B       L_539B                          ; 539F   0220 0005

L_53A1:
        CMPI    #$001F, R1                      ; 53A1   0379 001F
        BNEQ    L_53A8                          ; 53A3   020C 0003

        CLRR    R1                              ; 53A5   01C9
        B       L_53AD                          ; 53A6   0200 0005

L_53A8:
        SLL     R1,     2                       ; 53A8   004D
        SLL     R1,     1                       ; 53A9   0049
        SWAP    R1,     1                       ; 53AA   0041
        XOR@    R5,     R1                      ; 53AB   03E9
        SWAP    R1,     1                       ; 53AC   0041
L_53AD:
        MVO@    R1,     R3                      ; 53AD   0259
        INCR    R3                              ; 53AE   000B
        CMPI    #$02F0, R3                      ; 53AF   037B 02F0
        BEQ     L_53BD                          ; 53B1   0204 000A

        MOVR    R3,     R1                      ; 53B3   0099
        ANDI    #$0001, R1                      ; 53B4   03B9 0001
        BEQ     L_5396                          ; 53B6   0224 0021

        SLR     R0,     2                       ; 53B8   0064
        SLR     R0,     2                       ; 53B9   0064
        SLR     R0,     1                       ; 53BA   0060
        B       L_5397                          ; 53BB   0220 0025

L_53BD:
        MOVR    R4,     R0                      ; 53BD   00A0
        MVO     R0,     G_01DC                  ; 53BE   0240 01DC
        SWAP    R0,     1                       ; 53C0   0040
        MVO     R0,     G_01DD                  ; 53C1   0240 01DD

        JSR     R5,     L_53FC                  ; 53C3   0004 0150 03FC
        JSR     R5,     L_5432                  ; 53C6   0004 0154 0032
        JSR     R5,     L_543F                  ; 53C9   0004 0154 003F
        JSR     R5,     L_60BA                  ; 53CC   0004 0160 00BA
        JSR     R5,     L_545B                  ; 53CF   0004 0154 005B

        MVI     G_0316, R0                      ; 53D2   0280 0316
        TSTR    R0                              ; 53D4   0080
        BNEQ    L_53DA                          ; 53D5   020C 0003

        JSR     R5,     L_FD4C                  ; 53D7   0004 01FC 014C

L_53DA:
        PULR    R7                              ; 53DA   02B7

L_53DB:
        PSHR    R5                              ; 53DB   0275
        MVII    #$031D, R4                      ; 53DC   02BC 031D
        MVII    #$0040, R0                      ; 53DE   02B8 0040

        JSR     R5,     X_FILL_ZERO             ; 53E0   0004 0114 0338

        PULR    R7                              ; 53E3   02B7

L_53E4:
        PSHR    R5                              ; 53E4   0275
        MOVR    R1,     R5                      ; 53E5   008D
        MVII    #$031D, R4                      ; 53E6   02BC 031D
L_53E8:
        SDBD                                    ; 53E8   0001
        MVI@    R5,     R1                      ; 53E9   02A9
        MVO@    R1,     R4                      ; 53EA   0261
        SDBD                                    ; 53EB   0001
        MVI@    R5,     R1                      ; 53EC   02A9
        MVO@    R1,     R4                      ; 53ED   0261
        SDBD                                    ; 53EE   0001
        MVI@    R5,     R1                      ; 53EF   02A9
        MVO@    R1,     R4                      ; 53F0   0261
        SWAP    R1,     1                       ; 53F1   0041
        MVO@    R1,     R4                      ; 53F2   0261
        INCR    R4                              ; 53F3   000C
        MVI@    R5,     R1                      ; 53F4   02A9
        MVO@    R1,     R4                      ; 53F5   0261
        ADDI    #$0002, R4                      ; 53F6   02FC 0002
        DECR    R0                              ; 53F8   0010
        BNEQ    L_53E8                          ; 53F9   022C 0012
        PULR    R7                              ; 53FB   02B7

L_53FC:
        PSHR    R5                              ; 53FC   0275
        MVI     G_015E, R3                      ; 53FD   0283 015E
        DECR    R3                              ; 53FF   0013
        SLL     R3,     1                       ; 5400   004B
        PSHR    R3                              ; 5401   0273
        SLL     R3,     1                       ; 5402   004B
        SLL     R3,     2                       ; 5403   004F
        ADD@    R6,     R3                      ; 5404   02F3
        MVI     G_0161, R0                      ; 5405   0280 0161
        SLL     R0,     2                       ; 5407   004C
        PSHR    R0                              ; 5408   0270
        SLL     R0,     1                       ; 5409   0048
        ADD@    R6,     R0                      ; 540A   02F0
        ADDR    R0,     R3                      ; 540B   00C3
        MVI     G_0163, R0                      ; 540C   0280 0163
        CMPI    #$0003, R0                      ; 540E   0378 0003
        BLT     L_5417                          ; 5410   0205 0005

        JSR     R5,     X_RAND2                 ; 5412   0004 0114 029E

        MVO     R0,     G_0163                  ; 5415   0240 0163
L_5417:
        SLL     R0,     2                       ; 5417   004C
        ADDR    R0,     R3                      ; 5418   00C3
        SDBD                                    ; 5419   0001
        ADDI    #$FC31, R3                      ; 541A   02FB 0031 00FC
        MVII    #$031F, R4                      ; 541D   02BC 031F
L_541F:
        MVI@    R3,     R1                      ; 541F   0299
        TSTR    R1                              ; 5420   0089
        BEQ     L_5431                          ; 5421   0204 000E

        INCR    R3                              ; 5423   000B

        JSR     R5,     L_547A                  ; 5424   0004 0154 007A

        SWAP    R0,     1                       ; 5427   0040
        MVO@    R0,     R4                      ; 5428   0260
        SWAP    R1,     1                       ; 5429   0041
        MVO@    R1,     R4                      ; 542A   0261
        ADDI    #$000E, R4                      ; 542B   02FC 000E
        CMPI    #$0355, R4                      ; 542D   037C 0355
        BLT     L_541F                          ; 542F   0225 0011
L_5431:
        PULR    R7                              ; 5431   02B7

L_5432:
        PSHR    R5                              ; 5432   0275
        MVI     G_015E, R0                      ; 5433   0280 015E
        DECR    R0                              ; 5435   0010
        BNEQ    L_5431                          ; 5436   022C 0006

        MVII    #$0001, R0                      ; 5438   02B8 0001
        MVO     R0,     G_0164                  ; 543A   0240 0164
        J       L_56D8                          ; 543C   0004 0354 02D8

L_543F:
        PSHR    R5                              ; 543F   0275
        MVII    #$031D, R1                      ; 5440   02B9 031D
        MVI     G_015E, R3                      ; 5442   0283 015E
        DECR    R3                              ; 5444   0013
        SLL     R3,     1                       ; 5445   004B
        SDBD                                    ; 5446   0001
        ADDI    #$DA4A, R3                      ; 5447   02FB 004A 00DA
L_544A:
        SDBD                                    ; 544A   0001
        MVII    #$DA56, R4                      ; 544B   02BC 0056 00DA
        ADD@    R3,     R4                      ; 544E   02DC
        INCR    R3                              ; 544F   000B

        JSR     R5,     L_548A                  ; 5450   0004 0154 008A

        CMPI    #$035D, R1                      ; 5453   0379 035D
        BNEQ    L_544A                          ; 5455   022C 000C
        PULR    R7                              ; 5457   02B7

        DIS                                     ; 5458   0003
        CLRC                                    ; 5459   0006
        INCR    R1                              ; 545A   0009
L_545B:
        PSHR    R5                              ; 545B   0275
        MVI     G_01AF, R1                      ; 545C   0281 01AF
        SDBD                                    ; 545E   0001
        ADDI    #$DB0A, R1                      ; 545F   02F9 000A 00DB
        MVI     G_0325, R0                      ; 5462   0280 0325
        XOR@    R1,     R0                      ; 5464   03C8
        MVO     R0,     G_0325                  ; 5465   0240 0325
        ADDI    #$0004, R1                      ; 5467   02F9 0004
        MVI     G_031D, R0                      ; 5469   0280 031D
        XOR@    R1,     R0                      ; 546B   03C8
        MVO     R0,     G_031D                  ; 546C   0240 031D
        PULR    R7                              ; 546E   02B7

L_546F:
        PSHR    R5                              ; 546F   0275
        MVI     G_015E, R1                      ; 5470   0281 015E
        SDBD                                    ; 5472   0001
        ADDI    #$FC9D, R1                      ; 5473   02F9 009D 00FC
        MVI@    R1,     R0                      ; 5476   0288
        MVO     R0,     G_0170                  ; 5477   0240 0170
        PULR    R7                              ; 5479   02B7

L_547A:
        PSHR    R5                              ; 547A   0275
        MVII    #$0014, R2                      ; 547B   02BA 0014

        JSR     R5,     X_DIV                   ; 547D   0004 011C 01FB

        INCR    R0                              ; 5480   0008
        SLL     R0,     2                       ; 5481   004C
        SLL     R0,     1                       ; 5482   0048
        INCR    R1                              ; 5483   0009
        SLL     R1,     2                       ; 5484   004D
        SLL     R1,     1                       ; 5485   0049
        PSHR    R0                              ; 5486   0270
        MOVR    R1,     R0                      ; 5487   0088
        PULR    R1                              ; 5488   02B1
        PULR    R7                              ; 5489   02B7

L_548A:
        PSHR    R5                              ; 548A   0275
        MVII    #$0001, R2                      ; 548B   02BA 0001
L_548D:
        SDBD                                    ; 548D   0001
        MVI@    R4,     R0                      ; 548E   02A0
        MVO@    R0,     R1                      ; 548F   0248
        INCR    R1                              ; 5490   0009
        SDBD                                    ; 5491   0001
        MVI@    R4,     R0                      ; 5492   02A0
        MVO@    R0,     R1                      ; 5493   0248
        ADDI    #$0004, R1                      ; 5494   02F9 0004
        MVI@    R4,     R0                      ; 5496   02A0
        MVO@    R0,     R1                      ; 5497   0248
        INCR    R1                              ; 5498   0009
        MVI@    R4,     R0                      ; 5499   02A0
        MVO@    R0,     R1                      ; 549A   0248
        ADDI    #$0002, R1                      ; 549B   02F9 0002
        DECR    R2                              ; 549D   0012
        BEQ     L_548D                          ; 549E   0224 0012
        PULR    R7                              ; 54A0   02B7

L_54A1:
        PSHR    R5                              ; 54A1   0275
        CLRR    R0                              ; 54A2   01C0
        MVII    #$0176, R3                      ; 54A3   02BB 0176
        MVII    #$016B, R4                      ; 54A5   02BC 016B
L_54A7:
        MVO     R0,     G_011B                  ; 54A7   0240 011B
        PSHR    R3                              ; 54A9   0273

        JSR     R5,     L_5624                  ; 54AA   0004 0154 0224

        MVO     R3,     G_017A                  ; 54AD   0243 017A
        PULR    R3                              ; 54AF   02B3
        MVO     R1,     G_031B                  ; 54B0   0241 031B

        JSR     R5,     X_POW2                  ; 54B2   0004 0114 0345

        MVO     R0,     G_011C                  ; 54B5   0240 011C
        MVI@    R4,     R5                      ; 54B7   02A5
        MVO     R5,     G_0164                  ; 54B8   0245 0164
        INCR    R1                              ; 54BA   0009
        MVI@    R1,     R5                      ; 54BB   028D
        SDBD                                    ; 54BC   0001
        CMPI    #$DCB4, R5                      ; 54BD   037D 00B4 00DC
        BGE     L_5521                          ; 54C0   020D 005F

        TSTR    R5                              ; 54C2   00AD
        BEQ     L_5521                          ; 54C3   0204 005C

        MVII    #$0001, R5                      ; 54C5   02BD 0001
        MVI@    R3,     R2                      ; 54C7   029A
        DECR    R2                              ; 54C8   0012
        BPL     L_54D9                          ; 54C9   0203 000E

        SUBI    #$0004, R3                      ; 54CB   033B 0004
        MVI@    R3,     R2                      ; 54CD   029A
        ADDI    #$0004, R3                      ; 54CE   02FB 0004
        CMPI    #$0007, R2                      ; 54D0   037A 0007
        BLE     L_5520                          ; 54D2   0206 004C

        PSHR    R2                              ; 54D4   0272
        MVII    #$0010, R2                      ; 54D5   02BA 0010
        SUB@    R6,     R2                      ; 54D7   0332
        INCR    R5                              ; 54D8   000D
L_54D9:
        PSHR    R2                              ; 54D9   0272
        PSHR    R3                              ; 54DA   0273
        PSHR    R4                              ; 54DB   0274
        MVO     R5,     G_0167                  ; 54DC   0245 0167
        MVI     G_015D, R5                      ; 54DE   0285 015D
        ADD     G_015F, R5                      ; 54E0   02C5 015F
        BNEQ    L_5517                          ; 54E2   020C 0033

        MVI     G_011B, R4                      ; 54E4   0284 011B
        TSTR    R4                              ; 54E6   00A4
        BEQ     L_54EE                          ; 54E7   0204 0005

        MVI     G_0166, R5                      ; 54E9   0285 0166
        TSTR    R5                              ; 54EB   00AD
        BNEQ    L_550F                          ; 54EC   020C 0021

L_54EE:
        MVI     G_017A, R5                      ; 54EE   0285 017A
        ADDI    #$0200, R5                      ; 54F0   02FD 0200
        MVI@    R5,     R0                      ; 54F2   02A8
        RLC     R0,     2                       ; 54F3   0054
        BNOV    L_5514                          ; 54F4   020A 001E

        TSTR    R4                              ; 54F6   00A4
        BNEQ    L_550A                          ; 54F7   020C 0011

        MVI     G_0181, R5                      ; 54F9   0285 0181
        TSTR    R5                              ; 54FB   00AD
        BNEQ    L_5514                          ; 54FC   020C 0016

        MVI     G_018D, R5                      ; 54FE   0285 018D
        CMPI    #$000A, R5                      ; 5500   037D 000A
        BLT     L_550F                          ; 5502   0205 000B

        MVII    #$000B, R5                      ; 5504   02BD 000B
        MVO     R5,     G_018D                  ; 5506   0245 018D
        B       L_5514                          ; 5508   0200 000A

L_550A:
        MVI     G_015E, R5                      ; 550A   0285 015E
        DECR    R5                              ; 550C   0015
        BEQ     L_5514                          ; 550D   0204 0005

L_550F:
        CLRR    R5                              ; 550F   01ED
        MVO     R5,     G_0164                  ; 5510   0245 0164
        B       L_5517                          ; 5512   0200 0003

L_5514:
        JSR     R5,     L_554B                  ; 5514   0004 0154 014B
L_5517:
        JSR     R5,     L_574D                  ; 5517   0004 0154 034D
        JSR     R5,     L_5636                  ; 551A   0004 0154 0236

        PULR    R4                              ; 551D   02B4
        PULR    R3                              ; 551E   02B3
        PULR    R2                              ; 551F   02B2
L_5520:
        MVO@    R2,     R3                      ; 5520   025A
L_5521:
        MVI     G_011B, R0                      ; 5521   0280 011B
        ADDI    #$0002, R0                      ; 5523   02F8 0002
        CMPI    #$0008, R0                      ; 5525   0378 0008
        BEQ     L_5539                          ; 5527   0204 0010

        CMPI    #$0004, R0                      ; 5529   0378 0004
        BNEQ    L_5532                          ; 552B   020C 0005

        MVI     G_015E, R5                      ; 552D   0285 015E
        DECR    R5                              ; 552F   0015
        BEQ     L_553A                          ; 5530   0204 0008

L_5532:
        MVI     G_031B, R1                      ; 5532   0281 031B
        ADDI    #$0010, R1                      ; 5534   02F9 0010
        INCR    R3                              ; 5536   000B
        B       L_54A7                          ; 5537   0220 0091
L_5539:
        PULR    R7                              ; 5539   02B7

L_553A:
        MVII    #$032F, R4                      ; 553A   02BC 032F
        MVII    #$017B, R5                      ; 553C   02BD 017B
L_553E:
        MVI@    R4,     R0                      ; 553E   02A0
        SWAP    R0,     1                       ; 553F   0040
        MVO@    R0,     R5                      ; 5540   0268
        MVI@    R4,     R0                      ; 5541   02A0
        SWAP    R0,     1                       ; 5542   0040
        MVO@    R0,     R5                      ; 5543   0268
        ADDI    #$0006, R4                      ; 5544   02FC 0006
        CMPI    #$0345, R4                      ; 5546   037C 0345
        BLT     L_553E                          ; 5548   0225 000B
        PULR    R7                              ; 554A   02B7

L_554B:
        PSHR    R5                              ; 554B   0275
        MVI     G_0164, R5                      ; 554C   0285 0164
        ADD     G_011B, R5                      ; 554E   02C5 011B
        BEQ     L_55B7                          ; 5550   0204 0065

        MVI     G_031B, R3                      ; 5552   0283 031B
        ADDI    #$0004, R3                      ; 5554   02FB 0004
        MVI@    R3,     R0                      ; 5556   0298
        DECR    R0                              ; 5557   0010
        BMI     L_55B8                          ; 5558   020B 005E

        MOVR    R0,     R2                      ; 555A   0082
        ANDI    #$0001, R2                      ; 555B   03BA 0001
        ADD     G_031B, R2                      ; 555D   02C2 031B
        ADDI    #$0002, R2                      ; 555F   02FA 0002
        MVI@    R2,     R1                      ; 5561   0291
        SWAP    R1,     1                       ; 5562   0041
        MOVR    R1,     R5                      ; 5563   008D
        MVI     G_0167, R3                      ; 5564   0283 0167
        ANDI    #$0002, R0                      ; 5566   03B8 0002
        BEQ     L_556B                          ; 5568   0204 0001

        NEGR    R3                              ; 556A   0023
L_556B:
        ADDR    R3,     R1                      ; 556B   00D9
        MOVR    R1,     R4                      ; 556C   008C
        ANDI    #$0007, R4                      ; 556D   03BC 0007
        BEQ     L_5582                          ; 556F   0204 0011

        MOVR    R1,     R4                      ; 5571   008C
        ANDI    #$00F8, R4                      ; 5572   03BC 00F8
        ANDI    #$00F8, R5                      ; 5574   03BD 00F8
        CMPR    R4,     R5                      ; 5576   0165
        BNEQ    L_5582                          ; 5577   020C 0009

        MVI     G_011C, R5                      ; 5579   0285 011C
        COMR    R5                              ; 557B   001D
        AND     G_0171, R5                      ; 557C   0385 0171
        MVO     R5,     G_0171                  ; 557E   0245 0171
        B       L_5594                          ; 5580   0200 0012

L_5582:
        MVI     G_011C, R5                      ; 5582   0285 011C
        AND     G_0171, R5                      ; 5584   0385 0171
        BNEQ    L_5594                          ; 5586   020C 000C

        MVI     G_011C, R5                      ; 5588   0285 011C
        XOR     G_0171, R5                      ; 558A   03C5 0171
        MVO     R5,     G_0171                  ; 558C   0245 0171

        JSR     R5,     L_5B31                  ; 558E   0004 0158 0331
        JSR     R5,     L_55C4                  ; 5591   0004 0154 01C4

L_5594:
        SWAP    R1,     1                       ; 5594   0041
        MVO@    R1,     R2                      ; 5595   0251

        JSR     R5,     L_574D                  ; 5596   0004 0154 034D

        MVI     G_031B, R2                      ; 5599   0282 031B
        ADDI    #$0004, R2                      ; 559B   02FA 0004
        MVI@    R2,     R3                      ; 559D   0293
        DECR    R3                              ; 559E   0013
        BMI     L_55B7                          ; 559F   020B 0016

        SDBD                                    ; 55A1   0001
        ADDI    #$5618, R3                      ; 55A2   02FB 0018 0056
        MVI@    R3,     R0                      ; 55A5   0298
        CMP     G_0164, R0                      ; 55A6   0340 0164
        BNEQ    L_55B7                          ; 55A8   020C 000D

        MVI     G_0171, R5                      ; 55AA   0285 0171
        AND     G_011C, R5                      ; 55AC   0385 011C
        BEQ     L_55B6                          ; 55AE   0204 0006

        JSR     R5,     L_55E5                  ; 55B0   0004 0154 01E5

        BNC     L_55B6                          ; 55B3   0209 0001

        CLRR    R0                              ; 55B5   01C0
L_55B6:
        MVO@    R0,     R2                      ; 55B6   0250
L_55B7:
        PULR    R7                              ; 55B7   02B7

L_55B8:
        MVI     G_011B, R0                      ; 55B8   0280 011B
        TSTR    R0                              ; 55BA   0080
        BEQ     L_55C0                          ; 55BB   0204 0003

        JSR     R5,     L_5B31                  ; 55BD   0004 0158 0331
L_55C0:
        JSR     R5,     L_55C4                  ; 55C0   0004 0154 01C4

        PULR    R7                              ; 55C3   02B7

L_55C4:
        PSHR    R5                              ; 55C4   0275
        PSHR    R2                              ; 55C5   0272
        MVI     G_031B, R2                      ; 55C6   0282 031B
        ADDI    #$0004, R2                      ; 55C8   02FA 0004
        MVI     G_0164, R0                      ; 55CA   0280 0164
        CMP@    R2,     R0                      ; 55CC   0350
        BEQ     L_55D4                          ; 55CD   0204 0005

        JSR     R5,     L_55E5                  ; 55CF   0004 0154 01E5

        BNC     L_55DE                          ; 55D2   0209 000A

L_55D4:
        MVI@    R2,     R0                      ; 55D4   0290

        JSR     R5,     L_55E5                  ; 55D5   0004 0154 01E5

        BC      L_55DD                          ; 55D8   0201 0003

        TSTR    R0                              ; 55DA   0080
        BNEQ    L_55E3                          ; 55DB   020C 0006

L_55DD:
        CLRR    R0                              ; 55DD   01C0
L_55DE:
        ADDI    #$0004, R1                      ; 55DE   02F9 0004
        ANDI    #$00F8, R1                      ; 55E0   03B9 00F8
        MVO@    R0,     R2                      ; 55E2   0250
L_55E3:
        PULR    R2                              ; 55E3   02B2
        PULR    R7                              ; 55E4   02B7

L_55E5:
        TSTR    R0                              ; 55E5   0080
        BEQ     L_5613                          ; 55E6   0204 002B

        MVI     G_017A, R3                      ; 55E8   0283 017A
        ADDI    #$0200, R3                      ; 55EA   02FB 0200
        SDBD                                    ; 55EC   0001
        MVII    #$561A, R4                      ; 55ED   02BC 001A 0056
        ADDR    R0,     R4                      ; 55F0   00C4
        ADDR    R0,     R4                      ; 55F1   00C4
        SDBD                                    ; 55F2   0001
        ADD@    R4,     R3                      ; 55F3   02E3
        CMPI    #$0200, R3                      ; 55F4   037B 0200
        BLT     L_5616                          ; 55F6   0205 001E

        CMPI    #$02EF, R3                      ; 55F8   037B 02EF
        BGT     L_5616                          ; 55FA   020E 001A

        MVI@    R3,     R3                      ; 55FC   029B
        RLC     R3,     1                       ; 55FD   0053
        BNC     L_5614                          ; 55FE   0209 0014

        MVI     G_011B, R4                      ; 5600   0284 011B
        TSTR    R4                              ; 5602   00A4
        BNEQ    L_5610                          ; 5603   020C 000B

        MVI     G_018D, R4                      ; 5605   0284 018D
        CMPI    #$000A, R4                      ; 5607   037C 000A
        BNEQ    L_5610                          ; 5609   020C 0005

        INCR    R4                              ; 560B   000C
        MVO     R4,     G_018D                  ; 560C   0244 018D
        B       L_5614                          ; 560E   0200 0004

L_5610:
        RLC     R3,     1                       ; 5610   0053
        BNC     L_5616                          ; 5611   0209 0003

L_5613:
        CLRR    R0                              ; 5613   01C0
L_5614:
        CLRC                                    ; 5614   0006
        INCR    R7                              ; 5615   000F

L_5616:
        SETC                                    ; 5616   0007
L_5617:
        MOVR    R5,     R7                      ; 5617   00AF

        DECLE   $0003,  $0004,  $0001,  $0002   ; 5618   0003 0004 0001 0002
        DECLE   $0001,  $0000,  $0014,  $0000   ; 561C   0001 0000 0014 0000
        DECLE   $00FF,  $00FF,  $00EC,  $00FF   ; 5620   00FF 00FF 00EC 00FF
L_5624:
        PSHR    R5                              ; 5624   0275

        JSR     R5,     .EXEC.772               ; 5625   0004 0114 0372

        SUBI    #$0005, R2                      ; 5628   033A 0005
        SLR     R2,     2                       ; 562A   0066
        SLR     R2,     1                       ; 562B   0062
        SUBI    #$0005, R3                      ; 562C   033B 0005
        SLR     R3,     2                       ; 562E   0067
        SLR     R3,     1                       ; 562F   0063
        SLL     R3,     2                       ; 5630   004F
        PSHR    R3                              ; 5631   0273
        SLL     R3,     2                       ; 5632   004F
        ADD@    R6,     R3                      ; 5633   02F3
        ADDR    R2,     R3                      ; 5634   00D3
        PULR    R7                              ; 5635   02B7

L_5636:
        PSHR    R5                              ; 5636   0275
        MVI     G_015E, R5                      ; 5637   0285 015E
        DECR    R5                              ; 5639   0015
        BNEQ    L_5642                          ; 563A   020C 0006

        MVI     G_011B, R5                      ; 563C   0285 011B
        CMPI    #$0002, R5                      ; 563E   037D 0002
        BEQ     L_56D8                          ; 5640   0204 0096

L_5642:
        MVI     G_031B, R2                      ; 5642   0282 031B
        ADDI    #$0005, R2                      ; 5644   02FA 0005
        MVI     G_0164, R0                      ; 5646   0280 0164
        TSTR    R0                              ; 5648   0080
        BEQ     L_5660                          ; 5649   0204 0015

        MVI     G_015E, R3                      ; 564B   0283 015E
        DECR    R3                              ; 564D   0013
        SLL     R3,     1                       ; 564E   004B
        PSHR    R3                              ; 564F   0273
        MVI     G_011B, R3                      ; 5650   0283 011B
        SLR     R3,     1                       ; 5652   0063
        ADD@    R6,     R3                      ; 5653   02F3
        SDBD                                    ; 5654   0001
        ADDI    #$56CC, R3                      ; 5655   02FB 00CC 0056
        MVI@    R2,     R0                      ; 5658   0290
        SDBD                                    ; 5659   0001
        ANDI    #$FC0F, R0                      ; 565A   03B8 000F 00FC
        XOR@    R3,     R0                      ; 565D   03D8
        INCR    R7                              ; 565E   000F

        CLRR    R0                              ; 565F   01C0
L_5660:
        MVO@    R0,     R2                      ; 5660   0250
        ADDI    #$0008, R2                      ; 5661   02FA 0008
        MVO@    R0,     R2                      ; 5663   0250
        MVI     G_031B, R2                      ; 5664   0282 031B
        ADDI    #$0004, R2                      ; 5666   02FA 0004
        MVI@    R2,     R2                      ; 5668   0292
        DECR    R2                              ; 5669   0012
        BPL     L_5671                          ; 566A   0203 0005

        MVI     G_0164, R2                      ; 566C   0282 0164
        DECR    R2                              ; 566E   0012
        BMI     L_56CB                          ; 566F   020B 005A

L_5671:
        MVI     G_015E, R1                      ; 5671   0281 015E
        DECR    R1                              ; 5673   0011
        SLL     R1,     1                       ; 5674   0049
        SDBD                                    ; 5675   0001
        ADDI    #$DD32, R1                      ; 5676   02F9 0032 00DD
        MVI     G_011B, R3                      ; 5679   0283 011B
        SLR     R3,     1                       ; 567B   0063
        ADDR    R3,     R1                      ; 567C   00D9
        SDBD                                    ; 567D   0001
        MVII    #$DD3E, R4                      ; 567E   02BC 003E 00DD
        ADD@    R1,     R4                      ; 5681   02CC
        MOVR    R2,     R5                      ; 5682   0095
        ANDI    #$0001, R2                      ; 5683   03BA 0001
        SLL     R2,     2                       ; 5685   004E
        ADDR    R2,     R4                      ; 5686   00D4
        SDBD                                    ; 5687   0001
        MVI@    R4,     R0                      ; 5688   02A0
        SDBD                                    ; 5689   0001
        MVI@    R4,     R1                      ; 568A   02A1
        MVI     G_031B, R4                      ; 568B   0284 031B
        MVI@    R4,     R2                      ; 568D   02A2
        SDBD                                    ; 568E   0001
        ANDI    #$FDFF, R2                      ; 568F   03BA 00FF 00FD
        ADDI    #$0007, R4                      ; 5692   02FC 0007
        MVI@    R4,     R3                      ; 5694   02A3
        SDBD                                    ; 5695   0001
        ANDI    #$FDFF, R3                      ; 5696   03BB 00FF 00FD
        CMPI    #$0001, R5                      ; 5699   037D 0001
        BLE     L_56AE                          ; 569B   0206 0011

        XORI    #$0200, R2                      ; 569D   03FA 0200
        XORI    #$0200, R3                      ; 569F   03FB 0200
        PSHR    R0                              ; 56A1   0270
        MOVR    R1,     R0                      ; 56A2   0088
        PULR    R1                              ; 56A3   02B1
        MOVR    R2,     R5                      ; 56A4   0095
        ANDI    #$0008, R5                      ; 56A5   03BD 0008
        BNEQ    L_56B3                          ; 56A7   020C 000A

L_56A9:
        PSHR    R2                              ; 56A9   0272
        MOVR    R3,     R2                      ; 56AA   009A
        PULR    R3                              ; 56AB   02B3
        B       L_56B3                          ; 56AC   0200 0005

L_56AE:
        MOVR    R2,     R5                      ; 56AE   0095
        ANDI    #$0008, R5                      ; 56AF   03BD 0008
        BNEQ    L_56A9                          ; 56B1   022C 0009

L_56B3:
        MVI     G_015E, R5                      ; 56B3   0285 015E
        CMPI    #$0003, R5                      ; 56B5   037D 0003
        BNEQ    L_56C3                          ; 56B7   020C 000A

        MVI     G_011B, R5                      ; 56B9   0285 011B
        CMPI    #$0006, R5                      ; 56BB   037D 0006
        BNEQ    L_56C3                          ; 56BD   020C 0004

        XORI    #$0200, R2                      ; 56BF   03FA 0200
        XORI    #$0200, R3                      ; 56C1   03FB 0200
L_56C3:
        MVI     G_031B, R4                      ; 56C3   0284 031B
        MVO@    R2,     R4                      ; 56C5   0262
        MVO@    R0,     R4                      ; 56C6   0260
        ADDI    #$0006, R4                      ; 56C7   02FC 0006
        MVO@    R3,     R4                      ; 56C9   0263
        MVO@    R1,     R4                      ; 56CA   0261
L_56CB:
        PULR    R7                              ; 56CB   02B7

        DECLE   $0260,  $0000,  $0000,  $0000   ; 56CC   0260 0000 0000 0000

        MVI     G_0300, R0                      ; 56D0   0280 0300
        SUB     G_03F0, R0                      ; 56D2   0300 03F0
        MVI@    R4,     R0                      ; 56D4   02A0
        AND@    R4,     R0                      ; 56D5   03A0
        AND@    R4,     R0                      ; 56D6   03A0
        AND@    R4,     R0                      ; 56D7   03A0
L_56D8:
        MVI     G_034A, R0                      ; 56D8   0280 034A
        INCR    R0                              ; 56DA   0008
        ANDI    #$0003, R0                      ; 56DB   03B8 0003
        MVO     R0,     G_034A                  ; 56DD   0240 034A
        MVI     G_0164, R5                      ; 56DF   0285 0164
        TSTR    R5                              ; 56E1   00AD
        BEQ     L_56FD                          ; 56E2   0204 0019

        MVI     G_0184, R5                      ; 56E4   0285 0184
        INCR    R5                              ; 56E6   000D
        ANDI    #$0001, R5                      ; 56E7   03BD 0001
        MVO     R5,     G_0184                  ; 56E9   0245 0184
        BEQ     L_56FD                          ; 56EB   0204 0010

        MVI     G_0332, R0                      ; 56ED   0280 0332
        INCR    R0                              ; 56EF   0008
        CMPI    #$0006, R0                      ; 56F0   0378 0006
        BLT     L_56F5                          ; 56F2   0205 0001

        CLRR    R0                              ; 56F4   01C0
L_56F5:
        MVO     R0,     G_0332                  ; 56F5   0240 0332
        MVO     R0,     G_033A                  ; 56F7   0240 033A
        MVO     R0,     G_0342                  ; 56F9   0240 0342
        INCR    R7                              ; 56FB   000F

L_56FC:
        PSHR    R5                              ; 56FC   0275
L_56FD:
        MVI     G_0164, R1                      ; 56FD   0281 0164
        DECR    R1                              ; 56FF   0011
        BMI     L_574C                          ; 5700   020B 004A

        MOVR    R1,     R3                      ; 5702   008B
        MVI     G_01AA, R0                      ; 5703   0280 01AA
        MVI     G_0183, R2                      ; 5705   0282 0183
        TSTR    R2                              ; 5707   0092
        BEQ     L_570F                          ; 5708   0204 0005

        DECR    R0                              ; 570A   0010
        BPL     L_570F                          ; 570B   0203 0002

        MVII    #$0002, R0                      ; 570D   02B8 0002
L_570F:
        SLL     R0,     2                       ; 570F   004C
        SLL     R0,     2                       ; 5710   004C
        SLL     R1,     2                       ; 5711   004D
        ADDR    R1,     R0                      ; 5712   00C8
        MOVR    R0,     R4                      ; 5713   0084
        SDBD                                    ; 5714   0001
        ADDI    #$DDBA, R4                      ; 5715   02FC 00BA 00DD
        SLL     R1,     2                       ; 5718   004D
        MOVR    R1,     R5                      ; 5719   008D
        SDBD                                    ; 571A   0001
        ADDI    #$DDEA, R5                      ; 571B   02FD 00EA 00DD
        MVII    #$032D, R2                      ; 571E   02BA 032D
        ANDI    #$0002, R3                      ; 5720   03BB 0002
        SWAP    R3,     1                       ; 5722   0043
L_5723:
        MVI@    R2,     R0                      ; 5723   0290
        SDBD                                    ; 5724   0001
        ANDI    #$F9E8, R0                      ; 5725   03B8 00E8 00F9
        XOR@    R4,     R0                      ; 5728   03E0
        XORR    R3,     R0                      ; 5729   01D8
        MVI     G_0164, R1                      ; 572A   0281 0164
        CMPI    #$0004, R1                      ; 572C   0379 0004
        BNEQ    L_5738                          ; 572E   020C 0008

        CMPI    #$0335, R2                      ; 5730   037A 0335
        BNEQ    L_5738                          ; 5732   020C 0004

        SDBD                                    ; 5734   0001
        XORI    #$0400, R0                      ; 5735   03F8 0000 0004
L_5738:
        MVO@    R0,     R2                      ; 5738   0250
        INCR    R2                              ; 5739   000A
        SDBD                                    ; 573A   0001
        MVI@    R5,     R0                      ; 573B   02A8
        MVO@    R0,     R2                      ; 573C   0250
        ADDI    #$0003, R2                      ; 573D   02FA 0003
        SDBD                                    ; 573F   0001
        MVI@    R5,     R0                      ; 5740   02A8
        CMPI    #$0003, R0                      ; 5741   0378 0003
        BEQ     L_5746                          ; 5743   0204 0001

        MVO@    R0,     R2                      ; 5745   0250
L_5746:
        ADDI    #$0004, R2                      ; 5746   02FA 0004
        CMPI    #$034D, R2                      ; 5748   037A 034D
        BNEQ    L_5723                          ; 574A   022C 0028
L_574C:
        PULR    R7                              ; 574C   02B7

L_574D:
        PSHR    R5                              ; 574D   0275
        MVI     G_031B, R4                      ; 574E   0284 031B
        ADDI    #$0002, R4                      ; 5750   02FC 0002
        MVI     G_011C, R0                      ; 5752   0280 011C
L_5754:
        SLL     R0,     1                       ; 5754   0048
        AND     G_0170, R0                      ; 5755   0380 0170
        BEQ     L_574C                          ; 5757   0224 000C

        MVI@    R4,     R1                      ; 5759   02A1
        MVI@    R4,     R2                      ; 575A   02A2
        ADDI    #$0008, R4                      ; 575B   02FC 0008
        MVI@    R4,     R3                      ; 575D   02A3
        MOVR    R3,     R5                      ; 575E   009D
        SDBD                                    ; 575F   0001
        ANDI    #$FF00, R5                      ; 5760   03BD 0000 00FF
        ANDI    #$00FF, R3                      ; 5763   03BB 00FF
        SWAP    R3,     1                       ; 5765   0043
        ADDR    R5,     R1                      ; 5766   00E9
        ADDR    R3,     R2                      ; 5767   00DA
        SUBI    #$0003, R4                      ; 5768   033C 0003
        MVO@    R1,     R4                      ; 576A   0261
        MVO@    R2,     R4                      ; 576B   0262
        SUBI    #$0002, R4                      ; 576C   033C 0002
        B       L_5754                          ; 576E   0220 001B

L_5770:
        PSHR    R5                              ; 5770   0275
        MVII    #$032F, R4                      ; 5771   02BC 032F
        MVII    #$0004, R0                      ; 5773   02B8 0004
        B       L_5754                          ; 5775   0220 0022

L_5777:
        PSHR    R5                              ; 5777   0275
        MVI     G_0181, R1                      ; 5778   0281 0181
        DECR    R1                              ; 577A   0011
        BMI     L_5788                          ; 577B   020B 000B
        BEQ     L_5788                          ; 577D   0204 0009

        MVO     R1,     G_0181                  ; 577F   0241 0181
        CMPI    #$0001, R1                      ; 5781   0379 0001
        BNEQ    L_5788                          ; 5783   020C 0003

        JSR     R5,     L_F63E                  ; 5785   0004 01F4 023E

L_5788:
        PULR    R7                              ; 5788   02B7

L_5789:
        PSHR    R5                              ; 5789   0275
        MVI     G_0181, R0                      ; 578A   0280 0181
        TSTR    R0                              ; 578C   0080
        BEQ     L_579E                          ; 578D   0204 000F

        MVII    #$0010, R1                      ; 578F   02B9 0010
        MVI     G_031E, R5                      ; 5791   0285 031E
        SDBD                                    ; 5793   0001
        CMPI    #$DB7A, R5                      ; 5794   037D 007A 00DB
        BGE     L_579A                          ; 5797   020D 0001

        INCR    R1                              ; 5799   0009
L_579A:
        MVI@    R1,     R0                      ; 579A   0288
        XORI    #$0004, R0                      ; 579B   03F8 0004
        MVO@    R0,     R1                      ; 579D   0248
L_579E:
        MVII    #$0001, R5                      ; 579E   02BD 0001
        MVII    #$0005, R4                      ; 57A0   02BC 0005
        MVII    #$0016, R3                      ; 57A2   02BB 0016
        MVI     G_015E, R2                      ; 57A4   0282 015E
        DECR    R2                              ; 57A6   0012
        BEQ     L_57C0                          ; 57A7   0204 0017

        CMPI    #$0002, R2                      ; 57A9   037A 0002
        BNEQ    L_57BF                          ; 57AB   020C 0012

        DECR    R5                              ; 57AD   0015
        MVII    #$0001, R4                      ; 57AE   02BC 0001
        MVI     G_0356, R2                      ; 57B0   0282 0356
        SDBD                                    ; 57B2   0001
        CMPI    #$DBF7, R2                      ; 57B3   037A 00F7 00DB
        BGE     L_57B9                          ; 57B6   020D 0001

L_57B8:
        INCR    R3                              ; 57B8   000B
L_57B9:
        MVI@    R3,     R2                      ; 57B9   029A
        XORR    R4,     R2                      ; 57BA   01E2
        MVO@    R2,     R3                      ; 57BB   025A
        DECR    R5                              ; 57BC   0015
        BEQ     L_57B8                          ; 57BD   0224 0006
L_57BF:
        PULR    R7                              ; 57BF   02B7

L_57C0:
        MVI     G_019E, R0                      ; 57C0   0280 019E
        ANDI    #$0001, R0                      ; 57C2   03B8 0001
        BNEQ    L_57BF                          ; 57C4   022C 0006
        B       L_57B9                          ; 57C6   0220 000E

        PSHR    R5                              ; 57C8   0275
        CMPI    #$0006, R3                      ; 57C9   037B 0006
        BLT     L_580D                          ; 57CB   0205 0040

        MVI     G_015E, R4                      ; 57CD   0284 015E
        CMPI    #$0005, R4                      ; 57CF   037C 0005
        BEQ     L_580D                          ; 57D1   0204 003A

        MVI     G_0316, R5                      ; 57D3   0285 0316
        TSTR    R5                              ; 57D5   00AD
        BNEQ    L_58B3                          ; 57D6   020C 00DB

        JSR     R5,     L_591C                  ; 57D8   0004 0158 011C

        DECR    R4                              ; 57DB   0014
        BEQ     L_57E4                          ; 57DC   0204 0006

        MVII    #$000F, R0                      ; 57DE   02B8 000F
        MVO     R0,     G_0175                  ; 57E0   0240 0175
        B       L_5809                          ; 57E2   0200 0025

L_57E4:
        MOVR    R3,     R0                      ; 57E4   0098

        JSR     R5,     .EXEC.76C               ; 57E5   0004 0114 036C

        ADDI    #$0002, R1                      ; 57E8   02F9 0002
        MOVR    R1,     R5                      ; 57EA   008D
        MVI     G_0161, R1                      ; 57EB   0281 0161
        SLL     R1,     2                       ; 57ED   004D
        SUBI    #$0006, R0                      ; 57EE   0338 0006
        ADDR    R0,     R1                      ; 57F0   00C1
        ADDR    R0,     R1                      ; 57F1   00C1
        SDBD                                    ; 57F2   0001
        ADDI    #$6FC4, R1                      ; 57F3   02F9 00C4 006F
        MOVR    R1,     R4                      ; 57F6   008C
        MVI@    R4,     R0                      ; 57F7   02A0
        SWAP    R0,     1                       ; 57F8   0040
        MVO@    R0,     R5                      ; 57F9   0268
        MVI@    R4,     R0                      ; 57FA   02A0
        SWAP    R0,     1                       ; 57FB   0040
        MVO@    R0,     R5                      ; 57FC   0268
        CLRR    R0                              ; 57FD   01C0
        MVO@    R0,     R5                      ; 57FE   0268
        INCR    R5                              ; 57FF   000D
L_5800:
        MVI     G_01A8, R0                      ; 5800   0280 01A8
        SLR     R0,     2                       ; 5802   0064
        MVO@    R0,     R5                      ; 5803   0268
        MVI     G_035E, R0                      ; 5804   0280 035E
        ANDI    #$0003, R0                      ; 5806   03B8 0003
        MVO@    R0,     R5                      ; 5808   0268

L_5809:
        JSR     R5,     L_FCA9                  ; 5809   0004 01FC 00A9

        PULR    R7                              ; 580C   02B7

L_580D:
        SDBD                                    ; 580D   0001
        MVII    #$DCB4, R4                      ; 580E   02BC 00B4 00DC
        INCR    R1                              ; 5811   0009
        CMP@    R1,     R4                      ; 5812   034C
        BLE     L_58B3                          ; 5813   0206 009E

        MOVR    R3,     R0                      ; 5815   0098

        JSR     R5,     .EXEC.76C               ; 5816   0004 0114 036C

        INCR    R1                              ; 5819   0009
        CMP@    R1,     R4                      ; 581A   034C
        BLE     L_58B3                          ; 581B   0206 0096

        DECR    R1                              ; 581D   0011
        PSHR    R3                              ; 581E   0273
        CLRR    R3                              ; 581F   01DB
        MVII    #$0303, R4                      ; 5820   02BC 0303

        JSR     R5,     .EXEC.70F               ; 5822   0004 0114 030F

        PULR    R3                              ; 5825   02B3
        BNC     L_58B3                          ; 5826   0209 008B

        CLRR    R5                              ; 5828   01ED
        MVO     R5,     G_0167                  ; 5829   0245 0167
        MVI     G_0181, R0                      ; 582B   0280 0181
        TSTR    R0                              ; 582D   0080
        BEQ     L_5874                          ; 582E   0204 0044

        MVI     G_015E, R5                      ; 5830   0285 015E
        DECR    R5                              ; 5832   0015
        BNEQ    L_5837                          ; 5833   020C 0002

        MVII    #$0002, R3                      ; 5835   02BB 0002
L_5837:
        MOVR    R3,     R2                      ; 5837   009A
        SLR     R2,     1                       ; 5838   0062
        ADDI    #$01A9, R2                      ; 5839   02FA 01A9
        MVI@    R2,     R5                      ; 583B   0295
        INCR    R5                              ; 583C   000D
        MVO@    R5,     R2                      ; 583D   0255
        ADDI    #$0002, R5                      ; 583E   02FD 0002
        MVO     R5,     G_0167                  ; 5840   0245 0167
        MVI     G_0182, R5                      ; 5842   0285 0182
        DECR    R5                              ; 5844   0015
        MVO     R5,     G_0182                  ; 5845   0245 0182
        BNEQ    L_5871                          ; 5847   020C 0028

        MVO     R6,     G_015F                  ; 5849   0246 015F
        MVO     R6,     G_0160                  ; 584B   0246 0160
        MVO     R5,     G_01AA                  ; 584D   0245 01AA
        NOP                                     ; 584F   0034
        MVO     R5,     G_01AB                  ; 5850   0245 01AB
        MVO     R5,     G_01AC                  ; 5852   0245 01AC
        MVO     R5,     G_0166                  ; 5854   0245 0166
        MVII    #$0003, R5                      ; 5856   02BD 0003
        MVO     R5,     G_0162                  ; 5858   0245 0162
        MVI     G_015E, R5                      ; 585A   0285 015E
        CMPI    #$0005, R5                      ; 585C   037D 0005
        BNEQ    L_586A                          ; 585E   020C 000A

        MVI     G_019E, R0                      ; 5860   0280 019E
        INCR    R0                              ; 5862   0008

        JSR     R5,     X_CLAMP                 ; 5863   0004 0114 0270
        DECLE   $0000                           ; 5866   0000

        DIS                                     ; 5867   0003
        MVO     R0,     G_019E                  ; 5868   0240 019E
L_586A:
        MVII    #$00B4, R0                      ; 586A   02B8 00B4
        MVO     R0,     G_015D                  ; 586C   0240 015D
        CLRR    R0                              ; 586E   01C0
        MVO     R0,     G_0181                  ; 586F   0240 0181
L_5871:
        MOVR    R3,     R0                      ; 5871   0098
        B       L_58A2                          ; 5872   0200 002E

L_5874:
        MVI     G_0166, R5                      ; 5874   0285 0166
        TSTR    R5                              ; 5876   00AD
        BNEQ    L_58B3                          ; 5877   020C 003A

        MVII    #$008C, R0                      ; 5879   02B8 008C
        MVO     R0,     G_015D                  ; 587B   0240 015D
        MVI     G_015E, R0                      ; 587D   0280 015E
        DECR    R0                              ; 587F   0010
        BEQ     L_588B                          ; 5880   0204 0009

        MVII    #$0002, R0                      ; 5882   02B8 0002
        MVO     R0,     G_0331                  ; 5884   0240 0331
        MVO     R0,     G_0341                  ; 5886   0240 0341
        MVO     R0,     G_0351                  ; 5888   0240 0351
        CLRR    R0                              ; 588A   01C0
L_588B:
        MVII    #$016C, R5                      ; 588B   02BD 016C
        MVO     R0,     G_01C8                  ; 588D   0240 01C8
        MVO@    R0,     R5                      ; 588F   0268
        NOP                                     ; 5890   0034
        MVO@    R0,     R5                      ; 5891   0268
        MVO@    R0,     R5                      ; 5892   0268
        MVO     R0,     G_0166                  ; 5893   0240 0166
        MVI     G_0194, R0                      ; 5895   0280 0194
        DECR    R0                              ; 5897   0010
        MVO     R0,     G_0194                  ; 5898   0240 0194
        BNEQ    L_589F                          ; 589A   020C 0003

        JSR     R5,     L_D0BB                  ; 589C   0004 01D0 00BB

L_589F:
        CLRR    R0                              ; 589F   01C0
        MVO     R6,     G_015F                  ; 58A0   0246 015F

L_58A2:
        JSR     R5,     L_58B4                  ; 58A2   0004 0158 00B4
        JSR     R5,     L_FCB0                  ; 58A5   0004 01FC 00B0

        MVI     G_0167, R0                      ; 58A8   0280 0167
        TSTR    R0                              ; 58AA   0080
        BEQ     L_58B3                          ; 58AB   0204 0006

        JSR     R5,     L_5D9A                  ; 58AD   0004 015C 019A
        JSR     R5,     L_F72C                  ; 58B0   0004 01F4 032C

L_58B3:
        PULR    R7                              ; 58B3   02B7

L_58B4:
        PSHR    R5                              ; 58B4   0275
        SLR     R0,     1                       ; 58B5   0060
        MOVR    R0,     R3                      ; 58B6   0083
        SLL     R0,     1                       ; 58B7   0048

        JSR     R5,     .EXEC.76C               ; 58B8   0004 0114 036C

        INCR    R1                              ; 58BB   0009
        MVI@    R1,     R5                      ; 58BC   028D
        SDBD                                    ; 58BD   0001
        CMPI    #$DB7A, R5                      ; 58BE   037D 007A 00DB
        BGE     L_58CC                          ; 58C1   020D 0009

        DECR    R1                              ; 58C3   0011
        MOVR    R1,     R2                      ; 58C4   008A
        ADDI    #$0008, R2                      ; 58C5   02FA 0008
        MVI@    R1,     R4                      ; 58C7   028C
        MVI@    R2,     R5                      ; 58C8   0295
        MVO@    R5,     R1                      ; 58C9   024D
        MVO@    R4,     R2                      ; 58CA   0254
        INCR    R1                              ; 58CB   0009
L_58CC:
        MVI     G_015E, R2                      ; 58CC   0282 015E
        DECR    R2                              ; 58CE   0012
        SLL     R2,     1                       ; 58CF   004A
        ADDR    R3,     R2                      ; 58D0   00DA
        SDBD                                    ; 58D1   0001
        ADDI    #$DD66, R2                      ; 58D2   02FA 0066 00DD
        MVI@    R2,     R4                      ; 58D5   0294
        SDBD                                    ; 58D6   0001
        ADDI    #$DD72, R4                      ; 58D7   02FC 0072 00DD
        CLRR    R2                              ; 58DA   01D2
        MVI     G_015E, R3                      ; 58DB   0283 015E
        DECR    R3                              ; 58DD   0013
        BNEQ    L_5904                          ; 58DE   020C 0024

        TSTR    R0                              ; 58E0   0080
        BEQ     L_5904                          ; 58E1   0204 0021

        MVI     G_0331, R3                      ; 58E3   0283 0331
        TSTR    R3                              ; 58E5   009B
        BNEQ    L_58E9                          ; 58E6   020C 0001

        INCR    R3                              ; 58E8   000B
L_58E9:
        MVO     R3,     G_0164                  ; 58E9   0243 0164
        PSHR    R4                              ; 58EB   0274
        PSHR    R3                              ; 58EC   0273
        MVO     R6,     G_0183                  ; 58ED   0246 0183

        JSR     R5,     L_56FC                  ; 58EF   0004 0154 02FC
        JSR     R5,     L_5770                  ; 58F2   0004 0154 0370

        CLRR    R5                              ; 58F5   01ED
        MVO     R5,     G_0183                  ; 58F6   0245 0183
        PULR    R3                              ; 58F8   02B3
        PULR    R4                              ; 58F9   02B4
        MVII    #$0001, R2                      ; 58FA   02BA 0001
        MVII    #$032E, R1                      ; 58FC   02B9 032E
        DECR    R3                              ; 58FE   0013
        SLL     R3,     2                       ; 58FF   004F
        PSHR    R3                              ; 5900   0273
        SLL     R3,     1                       ; 5901   004B
        ADD@    R6,     R3                      ; 5902   02F3
        ADDR    R3,     R4                      ; 5903   00DC
L_5904:
        SDBD                                    ; 5904   0001
        MVI@    R4,     R5                      ; 5905   02A5
        MVO@    R5,     R1                      ; 5906   024D
        ADDI    #$0004, R1                      ; 5907   02F9 0004
        MVI@    R4,     R3                      ; 5909   02A3
        MVO@    R3,     R1                      ; 590A   024B
        INCR    R1                              ; 590B   0009
        MVI@    R4,     R5                      ; 590C   02A5
        MVO@    R5,     R1                      ; 590D   024D
        ADDI    #$0003, R1                      ; 590E   02F9 0003
        SDBD                                    ; 5910   0001
        MVI@    R4,     R5                      ; 5911   02A5
        MVO@    R5,     R1                      ; 5912   024D
        ADDI    #$0004, R1                      ; 5913   02F9 0004
        MVO@    R3,     R1                      ; 5915   024B
        ADDI    #$0004, R1                      ; 5916   02F9 0004
        DECR    R2                              ; 5918   0012
        BEQ     L_5904                          ; 5919   0224 0016
        PULR    R7                              ; 591B   02B7

L_591C:
        PSHR    R5                              ; 591C   0275
        MVI     G_0316, R5                      ; 591D   0285 0316
        ADD     G_015F, R5                      ; 591F   02C5 015F
        ADD     G_015D, R5                      ; 5921   02C5 015D
        BNEQ    L_592D                          ; 5923   020C 0008

        MVI     G_01A6, R5                      ; 5925   0285 01A6
        CMP     G_0181, R5                      ; 5927   0345 0181
        BLE     L_592D                          ; 5929   0206 0002

        MVO     R5,     G_0181                  ; 592B   0245 0181
L_592D:
        PULR    R7                              ; 592D   02B7

        PSHR    R5                              ; 592E   0275
        SDBD                                    ; 592F   0001
        MVII    #$DAF2, R4                      ; 5930   02BC 00F2 00DA

        JSR     R5,     L_548A                  ; 5933   0004 0154 008A

        PULR    R7                              ; 5936   02B7

        PSHR    R5                              ; 5937   0275
        SDBD                                    ; 5938   0001
        MVII    #$DAE6, R4                      ; 5939   02BC 00E6 00DA

        JSR     R5,     L_548A                  ; 593C   0004 0154 008A

        PULR    R7                              ; 593F   02B7

        PSHR    R5                              ; 5940   0275
        MVII    #$032D, R1                      ; 5941   02B9 032D
        MVII    #$0002, R0                      ; 5943   02B8 0002
        MOVR    R1,     R2                      ; 5945   008A
        ADDI    #$0005, R2                      ; 5946   02FA 0005
        MVI@    R2,     R5                      ; 5948   0295
        ANDI    #$03F0, R5                      ; 5949   03BD 03F0
        BNEQ    L_5950                          ; 594B   020C 0003
        J       L_6001                          ; 594D   0004 0360 0001

L_5950:
        MOVR    R6,     R3                      ; 5950   00B3
        B       L_595D                          ; 5951   0200 000A

        PSHR    R5                              ; 5953   0275
        MOVR    R1,     R2                      ; 5954   008A
        ADDI    #$0005, R2                      ; 5955   02FA 0005
        MVI@    R2,     R0                      ; 5957   0290
        ANDI    #$03F0, R0                      ; 5958   03B8 03F0
        BEQ     L_596F                          ; 595A   0204 0013

        CLRR    R3                              ; 595C   01DB
L_595D:
        MVI@    R2,     R0                      ; 595D   0290
        ANDI    #$000F, R0                      ; 595E   03B8 000F
        MVO@    R0,     R2                      ; 5960   0250
        INCR    R2                              ; 5961   000A
        MVII    #$003C, R5                      ; 5962   02BD 003C
        MVO@    R5,     R2                      ; 5964   0255
        ADDI    #$0007, R2                      ; 5965   02FA 0007
        MVO@    R0,     R2                      ; 5967   0250
        TSTR    R3                              ; 5968   009B
        BEQ     L_596E                          ; 5969   0204 0003

        ADDI    #$0008, R2                      ; 596B   02FA 0008
        MVO@    R0,     R2                      ; 596D   0250
L_596E:
        PULR    R7                              ; 596E   02B7

L_596F:
        SDBD                                    ; 596F   0001
        MVII    #$DAFE, R4                      ; 5970   02BC 00FE 00DA

        JSR     R5,     L_548A                  ; 5973   0004 0154 008A

        PULR    R7                              ; 5976   02B7

L_5977:
        PSHR    R5                              ; 5977   0275
        MVI     G_015E, R1                      ; 5978   0281 015E
        INCR    R1                              ; 597A   0009
        ADDR    R7,     R1                      ; 597B   00F9
        ADD@    R1,     R7                      ; 597C   02CF

        DECLE   $0007,  $000B,  $001F,  $001F   ; 597D   0007 000B 001F 001F
        DECLE   $001F,  $002C,  $001F           ; 5981   001F 002C 001F

        MVII    #$0003, R0                      ; 5984   02B8 0003
        B       L_598A                          ; 5986   0200 0002

        MVI     G_0161, R0                      ; 5988   0280 0161
L_598A:
        PSHR    R0                              ; 598A   0270
        SLL     R0,     1                       ; 598B   0048
        ADD@    R6,     R0                      ; 598C   02F0
        SDBD                                    ; 598D   0001
        MVII    #$599D, R4                      ; 598E   02BC 009D 0059
        ADDR    R0,     R4                      ; 5991   00C4
        MVII    #$0003, R5                      ; 5992   02BD 0003
L_5994:
        MVI@    R4,     R3                      ; 5994   02A3
        MVI@    R3,     R0                      ; 5995   0298
        XORI    #$0008, R0                      ; 5996   03F8 0008
        MVO@    R0,     R3                      ; 5998   0258
        DECR    R5                              ; 5999   0015
        BNEQ    L_5994                          ; 599A   022C 0007
L_599C:
        PULR    R7                              ; 599C   02B7

        DECLE   $0202,  $0215,  $0217           ; 599D   0202 0215 0217

        MVI     .BTAB.6D,R0                     ; 59A0   0280 026D
        MVI     .BTAB.9A,R2                     ; 59A2   0282 029A
        MVI     .BTAB.9C,R7                     ; 59A4   0287 029C

        DECLE   $023F                           ; 59A6   023F

        MVO@    R2,     R2                      ; 59A7   0252
        MVO@    R4,     R2                      ; 59A8   0254
        MVI     G_0184, R5                      ; 59A9   0285 0184
        XORI    #$0002, R5                      ; 59AB   03FD 0002
        MVO     R5,     G_0184                  ; 59AD   0245 0184
        MVI     G_0161, R0                      ; 59AF   0280 0161
        SLL     R0,     2                       ; 59B1   004C
        ADDR    R0,     R5                      ; 59B2   00C5
        SDBD                                    ; 59B3   0001
        ADDI    #$59D6, R5                      ; 59B4   02FD 00D6 0059
        SDBD                                    ; 59B7   0001
        MVI@    R5,     R4                      ; 59B8   02AC
L_59B9:
        MVI@    R4,     R3                      ; 59B9   02A3
        TSTR    R3                              ; 59BA   009B
        BEQ     L_59CA                          ; 59BB   0204 000D

        MVI@    R3,     R0                      ; 59BD   0298
        MOVR    R0,     R1                      ; 59BE   0081
        ANDI    #$0007, R1                      ; 59BF   03B9 0007
        CMPI    #$0006, R1                      ; 59C1   0379 0006
        BEQ     L_59B9                          ; 59C3   0224 000B

        XORI    #$0008, R0                      ; 59C5   03F8 0008
        MVO@    R0,     R3                      ; 59C7   0258
        B       L_59B9                          ; 59C8   0220 0010

L_59CA:
        MVI     G_018E, R1                      ; 59CA   0281 018E
        TSTR    R1                              ; 59CC   0089
        BEQ     L_59D5                          ; 59CD   0204 0006

        ADDI    #$0200, R1                      ; 59CF   02F9 0200
        MVI@    R1,     R0                      ; 59D1   0288
        XORI    #$0008, R0                      ; 59D2   03F8 0008
        MVO@    R0,     R1                      ; 59D4   0248
L_59D5:
        PULR    R7                              ; 59D5   02B7

        ADDR    R4,     R2                      ; 59D6   00E2
        SLLC    R1,     1                       ; 59D7   0059
        ADDR    R6,     R1                      ; 59D8   00F1
        SLLC    R1,     1                       ; 59D9   0059
        EIS                                     ; 59DA   0002
        SLLC    R2,     1                       ; 59DB   005A
        INCR    R7                              ; 59DC   000F

        SLLC    R2,     1                       ; 59DD   005A
L_59DE:
        COMR    R5                              ; 59DE   001D
        DECLE   $005A,  $002C,  $005A,  $0215   ; 59DF   005A 002C 005A 0215
        DECLE   $0234,  $0236,  $0264,  $0271   ; 59E3   0234 0236 0264 0271
        DECLE   $029A,  $0203,  $0209,  $020F   ; 59E7   029A 0203 0209 020F
        DECLE   $02B8,  $0294,  $02B4,  $02EE   ; 59EB   02B8 0294 02B4 02EE
        DECLE   $02EA,  $0000,  $0225           ; 59EF   02EA 0000 0225

        MVO@    R1,     R2                      ; 59F2   0251
        MVO@    R1,     R4                      ; 59F3   0261
        MVO@    R2,     R4                      ; 59F4   0262
        MVI@    R1,     R6                      ; 59F5   028E
        MVI@    R1,     R4                      ; 59F6   028C
        B       L_5BFF                          ; 59F7   0200 0206

        DECLE   $0212                           ; 59F9   0212

        BNEQ    L_5C94                          ; 59FA   020C 0298

        MVI@    R3,     R4                      ; 59FC   029C
        ADD@    R3,     R4                      ; 59FD   02DC
        ADD@    R4,     R3                      ; 59FE   02E3
        ADD@    R4,     R7                      ; 59FF   02E7

        DECLE   $02EC,  $0000,  $0229,  $022D   ; 5A00   02EC 0000 0229 022D
        DECLE   $0233,  $0239,  $0253,  $026E   ; 5A04   0233 0239 0253 026E
        DECLE   $0285,  $02A4,  $02B0,  $02DA   ; 5A08   0285 02A4 02B0 02DA
        DECLE   $02E4,  $028A,  $0000,  $022B   ; 5A0C   02E4 028A 0000 022B
        DECLE   $0237,  $023C,  $0264,  $0269   ; 5A10   0237 023C 0264 0269
        DECLE   $0274,  $027A,  $02A8,  $028C   ; 5A14   0274 027A 02A8 028C
        DECLE   $0231                           ; 5A18   0231

        ADD@    R2,     R6                      ; 5A19   02D6
        ADD@    R3,     R5                      ; 5A1A   02DD
        ADD@    R4,     R7                      ; 5A1B   02E7

        DECLE   $0000,  $0200,  $0203,  $0209   ; 5A1C   0000 0200 0203 0209
        DECLE   $020F,  $0230,  $0248,  $0254   ; 5A20   020F 0230 0248 0254
        DECLE   $0262,  $0278,  $0296,  $029A   ; 5A24   0262 0278 0296 029A
        DECLE   $029B,  $02B6,  $02E3,  $0000   ; 5A28   029B 02B6 02E3 0000
        DECLE   $0206,  $020C,  $0212,  $022D   ; 5A2C   0206 020C 0212 022D
        DECLE   $023C,  $0258,  $0273,  $0298   ; 5A30   023C 0258 0273 0298
        DECLE   $029C,  $02B1,  $02B4,  $02DD   ; 5A34   029C 02B1 02B4 02DD
        DECLE   $02E0,  $02E9,  $0000           ; 5A38   02E0 02E9 0000
L_5A3B:
        PSHR    R5                              ; 5A3B   0275
        MVI     G_015E, R1                      ; 5A3C   0281 015E
        CMPI    #$0004, R1                      ; 5A3E   0379 0004
        BNEQ    L_599C                          ; 5A40   022C 00A5

        MVI     G_035E, R0                      ; 5A42   0280 035E
        AND     G_0102, R0                      ; 5A44   0380 0102
        ANDI    #$0001, R0                      ; 5A46   03B8 0001
        BEQ     L_599C                          ; 5A48   0224 00AD

        MVI     G_0184, R1                      ; 5A4A   0281 0184
        INCR    R1                              ; 5A4C   0009
        ANDI    #$0003, R1                      ; 5A4D   03B9 0003
        MVO     R1,     G_0184                  ; 5A4F   0241 0184
        SLL     R1,     2                       ; 5A51   004D
        SLL     R1,     1                       ; 5A52   0049
        MOVR    R1,     R4                      ; 5A53   008C
        SDBD                                    ; 5A54   0001
        ADDI    #$D846, R4                      ; 5A55   02FC 0046 00D8
        SDBD                                    ; 5A58   0001
        MVII    #$3828, R5                      ; 5A59   02BD 0028 0038
        J       .EXEC.1E6                       ; 5A5C   0004 0310 01E6

L_5A5F:
        PSHR    R5                              ; 5A5F   0275
        MVI     G_0185, R0                      ; 5A60   0280 0185
        DECR    R0                              ; 5A62   0010
        BMI     L_5AED                          ; 5A63   020B 0088
        BNEQ    L_5AEB                          ; 5A65   020C 0084
        INCR    R7                              ; 5A67   000F

L_5A68:
        PSHR    R5                              ; 5A68   0275
L_5A69:
        MVI     G_0186, R1                      ; 5A69   0281 0186
        TSTR    R1                              ; 5A6B   0089
        BNEQ    L_5ABA                          ; 5A6C   020C 004C

        MVI     G_015F, R5                      ; 5A6E   0285 015F
        ADD     G_0316, R5                      ; 5A70   02C5 0316
        BNEQ    L_5AED                          ; 5A72   020C 0079

        MVI     G_018C, R2                      ; 5A74   0282 018C
        TSTR    R2                              ; 5A76   0092
        BEQ     L_5A82                          ; 5A77   0204 0009

        MVI     G_0187, R1                      ; 5A79   0281 0187
        ADDR    R2,     R1                      ; 5A7B   00D1
        ANDI    #$0003, R1                      ; 5A7C   03B9 0003
        MVO     R1,     G_0187                  ; 5A7E   0241 0187
        B       L_5A88                          ; 5A80   0200 0006

L_5A82:
        MVII    #$0004, R0                      ; 5A82   02B8 0004

        JSR     R5,     X_RAND2                 ; 5A84   0004 0114 029E

        MOVR    R0,     R1                      ; 5A87   0081
L_5A88:
        MVI     G_015E, R0                      ; 5A88   0280 015E
        DECR    R0                              ; 5A8A   0010
        SLL     R0,     1                       ; 5A8B   0048
        TSTR    R2                              ; 5A8C   0092
        BNEQ    L_5AA1                          ; 5A8D   020C 0012

        MOVR    R0,     R2                      ; 5A8F   0082
        SLL     R2,     1                       ; 5A90   004A
        ADDR    R2,     R0                      ; 5A91   00D0
        MVI     G_0161, R2                      ; 5A92   0282 0161
        SLL     R2,     2                       ; 5A94   004E
        ADDR    R2,     R0                      ; 5A95   00D0
        ADDR    R0,     R1                      ; 5A96   00C1
        SDBD                                    ; 5A97   0001
        ADDI    #$6FA0, R1                      ; 5A98   02F9 00A0 006F
        CLRR    R2                              ; 5A9B   01D2
        INCR    R2                              ; 5A9C   000A
        MVO     R2,     G_018C                  ; 5A9D   0242 018C
        B       L_5AA9                          ; 5A9F   0200 0008

L_5AA1:
        ADDR    R0,     R1                      ; 5AA1   00C1
        SDBD                                    ; 5AA2   0001
        ADDI    #$5B25, R1                      ; 5AA3   02F9 0025 005B
        CLRR    R2                              ; 5AA6   01D2
        MVO     R2,     G_018C                  ; 5AA7   0242 018C
L_5AA9:
        MVI@    R1,     R2                      ; 5AA9   028A
        MVO     R2,     G_0186                  ; 5AAA   0242 0186
        ADDI    #$0200, R2                      ; 5AAC   02FA 0200
        SDBD                                    ; 5AAE   0001
        MVII    #$0956, R0                      ; 5AAF   02B8 0056 0009
        MVO@    R0,     R2                      ; 5AB2   0250

        JSR     R5,     L_F66A                  ; 5AB3   0004 01F4 026A

        MVI     G_01A3, R1                      ; 5AB6   0281 01A3
        B       L_5AE5                          ; 5AB8   0200 002B

L_5ABA:
        ADDI    #$0200, R1                      ; 5ABA   02F9 0200
        CLRR    R0                              ; 5ABC   01C0
        MVO@    R0,     R1                      ; 5ABD   0248
        MVO     R0,     G_0186                  ; 5ABE   0240 0186
L_5AC0:
        MVI     G_018A, R0                      ; 5AC0   0280 018A
        ADD     G_0188, R0                      ; 5AC2   02C0 0188
        SDBD                                    ; 5AC4   0001
        CMPI    #$0009, R0                      ; 5AC5   0378 0009 0000
        BLT     L_5ACE                          ; 5AC8   0205 0004

        SDBD                                    ; 5ACA   0001
        SUBI    #$0009, R0                      ; 5ACB   0338 0009 0000
L_5ACE:
        MVO     R0,     G_0188                  ; 5ACE   0240 0188
        CMPI    #$0006, R0                      ; 5AD0   0378 0006
        BNEQ    L_5AE0                          ; 5AD2   020C 000C

        MVI     G_018B, R5                      ; 5AD4   0285 018B
        ANDI    #$0080, R5                      ; 5AD6   03BD 0080
        BNEQ    L_5AC0                          ; 5AD8   022C 0019

        MVI     G_035E, R5                      ; 5ADA   0285 035E
        ANDI    #$0040, R5                      ; 5ADC   03BD 0040
        BNEQ    L_5AC0                          ; 5ADE   022C 001F

L_5AE0:
        INCR    R0                              ; 5AE0   0008
        MVO     R0,     G_0189                  ; 5AE1   0240 0189
        MVI     G_01A4, R1                      ; 5AE3   0281 01A4
L_5AE5:
        MVI     G_01A5, R0                      ; 5AE5   0280 01A5

        JSR     R5,     X_RAND2                 ; 5AE7   0004 0114 029E

        ADDR    R1,     R0                      ; 5AEA   00C8
L_5AEB:
        MVO     R0,     G_0185                  ; 5AEB   0240 0185
L_5AED:
        PULR    R7                              ; 5AED   02B7

L_5AEE:
        PSHR    R5                              ; 5AEE   0275
        MVI     G_0189, R0                      ; 5AEF   0280 0189
        DECR    R0                              ; 5AF1   0010
        BMI     L_5B05                          ; 5AF2   020B 0011

        SLL     R0,     2                       ; 5AF4   004C
        SLL     R0,     1                       ; 5AF5   0048
        SDBD                                    ; 5AF6   0001
        ADDI    #$D40E, R0                      ; 5AF7   02F8 000E 00D4
        MOVR    R0,     R4                      ; 5AFA   0084
        SDBD                                    ; 5AFB   0001
        MVII    #$3950, R5                      ; 5AFC   02BD 0050 0039
        CLRR    R1                              ; 5AFF   01C9
        MVO     R1,     G_0189                  ; 5B00   0241 0189
        J       .EXEC.1E6                       ; 5B02   0004 0310 01E6

L_5B05:
        MVI     G_015E, R0                      ; 5B05   0280 015E
        DECR    R0                              ; 5B07   0010
        BNEQ    L_5AED                          ; 5B08   022C 001C

        MVII    #$0002, R3                      ; 5B0A   02BB 0002
        MVII    #$017B, R4                      ; 5B0C   02BC 017B
L_5B0E:
        MVI@    R3,     R0                      ; 5B0E   0298
        SDBD                                    ; 5B0F   0001
        ANDI    #$FF00, R0                      ; 5B10   03B8 0000 00FF
        ADD@    R4,     R0                      ; 5B13   02E0
        MVO@    R0,     R3                      ; 5B14   0258
        ADDI    #$0008, R3                      ; 5B15   02FB 0008
        MVI@    R3,     R0                      ; 5B17   0298
        SDBD                                    ; 5B18   0001
        ANDI    #$FF80, R0                      ; 5B19   03B8 0080 00FF
        ADD@    R4,     R0                      ; 5B1C   02E0
        MVO@    R0,     R3                      ; 5B1D   0258
        SUBI    #$0007, R3                      ; 5B1E   033B 0007
        CMPI    #$0005, R3                      ; 5B20   037B 0005
        BNEQ    L_5B0E                          ; 5B22   022C 0015
        PULR    R7                              ; 5B24   02B7

        SLR     R2,     2                       ; 5B25   0066
        SARC    R3,     2                       ; 5B26   007F
        SETC                                    ; 5B27   0007
        SLL     R2,     2                       ; 5B28   004E
        SLR     R1,     2                       ; 5B29   0065
        ADDR    R1,     R6                      ; 5B2A   00CE
        TSTR    R0                              ; 5B2B   0080
        SLR     R0,     1                       ; 5B2C   0060
        SWAP    R0,     1                       ; 5B2D   0040
        MOVR    R7,     R3                      ; 5B2E   00BB
        MOVR    R0,     R1                      ; 5B2F   0081
        MOVR    R3,     R6                      ; 5B30   009E
L_5B31:
        PSHR    R5                              ; 5B31   0275
        PSHR    R1                              ; 5B32   0271
        PSHR    R2                              ; 5B33   0272
        MVI     G_017A, R3                      ; 5B34   0283 017A
        MVI     G_011B, R0                      ; 5B36   0280 011B
        TSTR    R0                              ; 5B38   0080
        BNEQ    L_5BA8                          ; 5B39   020C 006D

        MVI     G_018D, R5                      ; 5B3B   0285 018D
        SUBI    #$000B, R5                      ; 5B3D   033D 000B
        BNEQ    L_5B4A                          ; 5B3F   020C 0009

        MOVR    R3,     R4                      ; 5B41   009C
        ADDI    #$0200, R4                      ; 5B42   02FC 0200
        MVI@    R4,     R0                      ; 5B44   02A0
        RLC     R0,     2                       ; 5B45   0054
        BOV     L_5B4A                          ; 5B46   0202 0002

        MVO     R5,     G_018D                  ; 5B48   0245 018D
L_5B4A:
        CMP     G_0186, R3                      ; 5B4A   0343 0186
        BNEQ    L_5B98                          ; 5B4C   020C 004A

        PSHR    R3                              ; 5B4E   0273
        MVI     G_0188, R0                      ; 5B4F   0280 0188
        CMPI    #$0004, R0                      ; 5B51   0378 0004
        BNEQ    L_5B5F                          ; 5B53   020C 000A

        JSR     R5,     L_F6A4                  ; 5B55   0004 01F4 02A4

        MVII    #$0005, R0                      ; 5B58   02B8 0005

        JSR     R5,     L_5D9A                  ; 5B5A   0004 015C 019A

        B       L_5B94                          ; 5B5D   0200 0035

L_5B5F:
        CMPI    #$0006, R0                      ; 5B5F   0378 0006
        BNEQ    L_5B6E                          ; 5B61   020C 000B

        JSR     R5,     L_5DC5                  ; 5B63   0004 015C 01C5

        MVI     G_018B, R5                      ; 5B66   0285 018B
        XORI    #$0080, R5                      ; 5B68   03FD 0080
        MVO     R5,     G_018B                  ; 5B6A   0245 018B
        B       L_5B94                          ; 5B6C   0200 0026

L_5B6E:
        CMPI    #$0001, R0                      ; 5B6E   0378 0001
        BNEQ    L_5B7F                          ; 5B70   020C 000D

        JSR     R5,     L_F6BB                  ; 5B72   0004 01F4 02BB

        MVII    #$0192, R4                      ; 5B75   02BC 0192
        SDBD                                    ; 5B77   0001
        MVI@    R4,     R0                      ; 5B78   02A0
        SLR     R0,     1                       ; 5B79   0060

        JSR     R5,     L_5D94                  ; 5B7A   0004 015C 0194

        B       L_5B94                          ; 5B7D   0200 0015

L_5B7F:
        INCR    R0                              ; 5B7F   0008
        MVO     R0,     G_018D                  ; 5B80   0240 018D

        JSR     R5,     L_F687                  ; 5B82   0004 01F4 0287

        MVI     G_018B, R0                      ; 5B85   0280 018B
        INCR    R0                              ; 5B87   0008
        MVO     R0,     G_018B                  ; 5B88   0240 018B
        ANDI    #$007F, R0                      ; 5B8A   03B8 007F

        JSR     R5,     X_CLAMP                 ; 5B8C   0004 0114 0270
        DECLE   $0000                           ; 5B8F   0000

        DIS                                     ; 5B90   0003

        JSR     R5,     L_5D9A                  ; 5B91   0004 015C 019A
L_5B94:
        JSR     R5,     L_5A68                  ; 5B94   0004 0158 0268

        PULR    R3                              ; 5B97   02B3
L_5B98:
        CMP     G_018E, R3                      ; 5B98   0343 018E
        BNEQ    L_5BA5                          ; 5B9A   020C 0009

        JSR     R5,     L_5C37                  ; 5B9C   0004 015C 0037
        JSR     R5,     L_591C                  ; 5B9F   0004 0158 011C
        JSR     R5,     L_FCA9                  ; 5BA2   0004 01FC 00A9

L_5BA5:
        PULR    R2                              ; 5BA5   02B2
        PULR    R1                              ; 5BA6   02B1
        PULR    R7                              ; 5BA7   02B7

L_5BA8:
        JSR     R5,     L_5F17                  ; 5BA8   0004 015C 0317

        B       L_5BA5                          ; 5BAB   0220 0007

        PSHR    R5                              ; 5BAD   0275
        MOVR    R1,     R2                      ; 5BAE   008A
        ADDI    #$0005, R1                      ; 5BAF   02F9 0005
        MVI@    R1,     R4                      ; 5BB1   028C
        SDBD                                    ; 5BB2   0001
        ANDI    #$FC0F, R4                      ; 5BB3   03BC 000F 00FC
        ADDI    #$0007, R2                      ; 5BB6   02FA 0007
        MVI@    R2,     R5                      ; 5BB8   0295
        ANDI    #$0080, R5                      ; 5BB9   03BD 0080
        BNEQ    L_5BD2                          ; 5BBB   020C 0015

        MVI@    R2,     R0                      ; 5BBD   0290
        XORI    #$0080, R0                      ; 5BBE   03F8 0080
        MVO@    R0,     R2                      ; 5BC0   0250
        DECR    R2                              ; 5BC1   0012
        MVI     G_01A7, R0                      ; 5BC2   0280 01A7

        JSR     R5,     X_RAND2                 ; 5BC4   0004 0114 029E

        ADD     G_01A8, R0                      ; 5BC7   02C0 01A8
        MVO@    R0,     R2                      ; 5BC9   0250
        DECR    R2                              ; 5BCA   0012
        XORI    #$03F0, R4                      ; 5BCB   03FC 03F0
        MVO@    R4,     R2                      ; 5BCD   0254
        DECR    R2                              ; 5BCE   0012
        CLRR    R0                              ; 5BCF   01C0
        MVO@    R0,     R2                      ; 5BD0   0250
        PULR    R7                              ; 5BD1   02B7

L_5BD2:
        XORI    #$01E0, R4                      ; 5BD2   03FC 01E0
        MVO@    R4,     R1                      ; 5BD4   024C
        MVI     G_0161, R0                      ; 5BD5   0280 0161
        SLL     R0,     1                       ; 5BD7   0048
        MOVR    R0,     R4                      ; 5BD8   0084
        SDBD                                    ; 5BD9   0001
        ADDI    #$5D07, R4                      ; 5BDA   02FC 0007 005D
        SDBD                                    ; 5BDD   0001
        MVI@    R4,     R5                      ; 5BDE   02A5
        MVI@    R2,     R0                      ; 5BDF   0290
        ANDI    #$007F, R0                      ; 5BE0   03B8 007F
        SLL     R0,     2                       ; 5BE2   004C
        ADDR    R0,     R5                      ; 5BE3   00C5
        SDBD                                    ; 5BE4   0001
        MVI@    R5,     R4                      ; 5BE5   02AC
        MVI     G_035E, R0                      ; 5BE6   0280 035E
        ANDI    #$0001, R0                      ; 5BE8   03B8 0001
        ADDR    R0,     R5                      ; 5BEA   00C5
        MVI@    R5,     R0                      ; 5BEB   02A8
        MVO@    R0,     R2                      ; 5BEC   0250
        MVI     G_01A7, R0                      ; 5BED   0280 01A7

        JSR     R5,     X_RAND2                 ; 5BEF   0004 0114 029E

        ADD     G_01A9, R0                      ; 5BF2   02C0 01A9
        MOVR    R0,     R3                      ; 5BF4   0083
        MOVR    R4,     R2                      ; 5BF5   00A2
        MVI     G_031B, R1                      ; 5BF6   0281 031B

        JSR     R5,     .EXEC.9A1               ; 5BF8   0004 0118 01A1

        PULR    R7                              ; 5BFB   02B7

        PSHR    R5                              ; 5BFC   0275
        ADDI    #$0007, R1                      ; 5BFD   02F9 0007
L_5BFF:
        MVI@    R1,     R0                      ; 5BFF   0288
        ANDI    #$0080, R0                      ; 5C00   03B8 0080
        BNEQ    L_5C17                          ; 5C02   020C 0013

        MVI     G_0175, R0                      ; 5C04   0280 0175
        MVO     R0,     G_0191                  ; 5C06   0240 0191
        CLRR    R1                              ; 5C08   01C9
        MVO     R1,     G_0175                  ; 5C09   0241 0175
        MVO     R1,     G_0179                  ; 5C0B   0241 0179
        MVI     G_01A8, R0                      ; 5C0D   0280 01A8
        MVII    #$0080, R5                      ; 5C0F   02BD 0080
        MVO     R1,     G_0352                  ; 5C11   0241 0352
        MVO     R1,     G_035A                  ; 5C13   0241 035A
        B       L_5C23                          ; 5C15   0200 000C

L_5C17:
        MVI     G_0191, R0                      ; 5C17   0280 0191
        CMP     G_01A7, R0                      ; 5C19   0340 01A7
        BLE     L_5C1E                          ; 5C1B   0206 0001

        DECR    R0                              ; 5C1D   0010
L_5C1E:
        MVO     R0,     G_0175                  ; 5C1E   0240 0175
        MVI     G_01A9, R0                      ; 5C20   0280 01A9
        CLRR    R5                              ; 5C22   01ED
L_5C23:
        MVO     R0,     G_0353                  ; 5C23   0240 0353
        MVO     R5,     G_0354                  ; 5C25   0245 0354
        PULR    R7                              ; 5C27   02B7

L_5C28:
        PSHR    R5                              ; 5C28   0275
        MVI     G_015E, R0                      ; 5C29   0280 015E
        CMPI    #$0005, R0                      ; 5C2B   0378 0005
        BNEQ    L_5C6E                          ; 5C2D   020C 003F

        MVI     G_018F, R0                      ; 5C2F   0280 018F
        DECR    R0                              ; 5C31   0010
        BMI     L_5C6E                          ; 5C32   020B 003A
        BNEQ    L_5C6C                          ; 5C34   020C 0036
        INCR    R7                              ; 5C36   000F

L_5C37:
        PSHR    R5                              ; 5C37   0275
L_5C38:
        MVI     G_018E, R1                      ; 5C38   0281 018E
        TSTR    R1                              ; 5C3A   0089
        BEQ     L_5C47                          ; 5C3B   0204 000A

        ADDI    #$0200, R1                      ; 5C3D   02F9 0200
        CLRR    R0                              ; 5C3F   01C0
        MVO@    R0,     R1                      ; 5C40   0248
        MVO     R0,     G_018E                  ; 5C41   0240 018E
        MVI     G_01A9, R1                      ; 5C43   0281 01A9
        B       L_5C66                          ; 5C45   0200 001F

L_5C47:
        MVI     G_015F, R5                      ; 5C47   0285 015F
        TSTR    R5                              ; 5C49   00AD
        BNEQ    L_5C6E                          ; 5C4A   020C 0022

        MVII    #$0008, R0                      ; 5C4C   02B8 0008

        JSR     R5,     X_RAND2                 ; 5C4E   0004 0114 029E

        MVI     G_0161, R1                      ; 5C51   0281 0161
        SLL     R1,     2                       ; 5C53   004D
        SLL     R1,     1                       ; 5C54   0049
        ADDR    R0,     R1                      ; 5C55   00C1
        SDBD                                    ; 5C56   0001
        ADDI    #$6F7A, R1                      ; 5C57   02F9 007A 006F
        MVI@    R1,     R2                      ; 5C5A   028A
        SDBD                                    ; 5C5B   0001
        MVII    #$0C50, R0                      ; 5C5C   02B8 0050 000C
        MVO@    R0,     R2                      ; 5C5F   0250
        SUBI    #$0200, R2                      ; 5C60   033A 0200
        MVO     R2,     G_018E                  ; 5C62   0242 018E
        MVI     G_01A8, R1                      ; 5C64   0281 01A8
L_5C66:
        MVI     G_01A7, R0                      ; 5C66   0280 01A7

        JSR     R5,     X_RAND2                 ; 5C68   0004 0114 029E

        ADDR    R1,     R0                      ; 5C6B   00C8
L_5C6C:
        MVO     R0,     G_018F                  ; 5C6C   0240 018F
L_5C6E:
        PULR    R7                              ; 5C6E   02B7

L_5C6F:
        PSHR    R5                              ; 5C6F   0275
        MVI     G_018E, R1                      ; 5C70   0281 018E
        TSTR    R1                              ; 5C72   0089
        BEQ     L_5C8F                          ; 5C73   0204 001A

        ADDI    #$0200, R1                      ; 5C75   02F9 0200
        MVI     G_0190, R2                      ; 5C77   0282 0190
        INCR    R2                              ; 5C79   000A
        CMPI    #$0007, R2                      ; 5C7A   037A 0007
        BNEQ    L_5C7F                          ; 5C7C   020C 0001

        CLRR    R2                              ; 5C7E   01D2
L_5C7F:
        MVO     R2,     G_0190                  ; 5C7F   0242 0190
        SDBD                                    ; 5C81   0001
        MVII    #$6F92, R4                      ; 5C82   02BC 0092 006F
        SLL     R2,     1                       ; 5C85   004A
        ADDR    R2,     R4                      ; 5C86   00D4
        MVI@    R1,     R5                      ; 5C87   028D
        SDBD                                    ; 5C88   0001
        ANDI    #$C9FF, R5                      ; 5C89   03BD 00FF 00C9
        SDBD                                    ; 5C8C   0001
        XOR@    R4,     R5                      ; 5C8D   03E5
        MVO@    R5,     R1                      ; 5C8E   024D
L_5C8F:
        PULR    R7                              ; 5C8F   02B7

L_5C90:
        PSHR    R5                              ; 5C90   0275
        MVI     G_015E, R1                      ; 5C91   0281 015E
        SLR     R1,     1                       ; 5C93   0061
L_5C94:
        INCR    R1                              ; 5C94   0009
        ADDR    R7,     R1                      ; 5C95   00F9
        ADD@    R1,     R7                      ; 5C96   02CF

        DIS                                     ; 5C97   0003
        RSWD    R2                              ; 5C98   003A
        SAR     R2,     1                       ; 5C99   006A
        SDBD                                    ; 5C9A   0001
        MVII    #$DA9E, R4                      ; 5C9B   02BC 009E 00DA
        MVII    #$034D, R1                      ; 5C9E   02B9 034D

        JSR     R5,     L_548A                  ; 5CA0   0004 0154 008A

        MVI     G_035E, R0                      ; 5CA3   0280 035E
        MOVR    R0,     R1                      ; 5CA5   0081
        ANDI    #$0001, R0                      ; 5CA6   03B8 0001
        MVO     R0,     G_0354                  ; 5CA8   0240 0354
        SLR     R1,     1                       ; 5CAA   0061
        ANDI    #$0001, R1                      ; 5CAB   03B9 0001
        ADDI    #$0002, R1                      ; 5CAD   02F9 0002
        MVO     R1,     G_035C                  ; 5CAF   0241 035C
        MVI     G_01A8, R0                      ; 5CB1   0280 01A8
        MVO     R0,     G_0353                  ; 5CB3   0240 0353
        MVO     R0,     G_035B                  ; 5CB5   0240 035B
        MVI     G_019E, R0                      ; 5CB7   0280 019E
        MOVR    R0,     R1                      ; 5CB9   0081
        ANDI    #$0002, R0                      ; 5CBA   03B8 0002
        BEQ     L_5CC1                          ; 5CBC   0204 0003

        CLRR    R0                              ; 5CBE   01C0
        MVO     R0,     G_0356                  ; 5CBF   0240 0356
L_5CC1:
        ANDI    #$0001, R1                      ; 5CC1   03B9 0001
        BEQ     L_5CE2                          ; 5CC3   0204 001D

        MVI     G_034D, R0                      ; 5CC5   0280 034D
        SDBD                                    ; 5CC7   0001
        ANDI    #$FFE8, R0                      ; 5CC8   03B8 00E8 00FF
        MVO     R0,     G_034D                  ; 5CCB   0240 034D
        MVO     R0,     G_0355                  ; 5CCD   0240 0355
        B       L_5CE2                          ; 5CCF   0200 0011

        SDBD                                    ; 5CD1   0001
        MVII    #$DAAA, R4                      ; 5CD2   02BC 00AA 00DA
        MVII    #$034D, R1                      ; 5CD5   02B9 034D

        JSR     R5,     L_548A                  ; 5CD7   0004 0154 008A

        MVI     G_01A7, R0                      ; 5CDA   0280 01A7
        MVO     R0,     G_0175                  ; 5CDC   0240 0175
        MVI     G_01A8, R0                      ; 5CDE   0280 01A8
        MVO     R0,     G_0353                  ; 5CE0   0240 0353
L_5CE2:
        MVI     G_015E, R1                      ; 5CE2   0281 015E
        DECR    R1                              ; 5CE4   0011
        SLL     R1,     1                       ; 5CE5   0049
        PSHR    R1                              ; 5CE6   0271
        SLL     R1,     1                       ; 5CE7   0049
        ADD@    R6,     R1                      ; 5CE8   02F1
        MVI     G_0161, R0                      ; 5CE9   0280 0161
        SLL     R0,     2                       ; 5CEB   004C
        ADDR    R0,     R1                      ; 5CEC   00C1
        SDBD                                    ; 5CED   0001
        ADDI    #$6FC4, R1                      ; 5CEE   02F9 00C4 006F
        MOVR    R1,     R4                      ; 5CF1   008C
        MVII    #$034F, R5                      ; 5CF2   02BD 034F
L_5CF4:
        MVI@    R4,     R0                      ; 5CF4   02A0
        SWAP    R0,     1                       ; 5CF5   0040
        MVO@    R0,     R5                      ; 5CF6   0268
        MVI@    R4,     R0                      ; 5CF7   02A0
        SWAP    R0,     1                       ; 5CF8   0040
        MVO@    R0,     R5                      ; 5CF9   0268
        ADDI    #$0006, R5                      ; 5CFA   02FD 0006
        CMPI    #$035D, R5                      ; 5CFC   037D 035D
        BLT     L_5CF4                          ; 5CFE   0225 000B
        PULR    R7                              ; 5D00   02B7

        MVI     G_01A9, R0                      ; 5D01   0280 01A9
        SLL     R0,     1                       ; 5D03   0048
        MVO     R0,     G_018F                  ; 5D04   0240 018F
        PULR    R7                              ; 5D06   02B7

        DECLE   $000D,  $005D,  $0029,  $005D   ; 5D07   000D 005D 0029 005D
        DECLE   $0059,  $005D,  $0050,  $0098   ; 5D0B   0059 005D 0050 0098
        DECLE   $0005,  $0002,  $0060,  $0078   ; 5D0F   0005 0002 0060 0078
        DECLE   $0003,  $0004,  $0008,  $0040   ; 5D13   0003 0004 0008 0040
        DECLE   $0004,  $0005,  $0060,  $0020   ; 5D17   0004 0005 0060 0020
        DECLE   $0000,  $0006,  $0038,  $0010   ; 5D1B   0000 0006 0038 0010
        DECLE   $0003,  $0000,  $0038,  $0050   ; 5D1F   0003 0000 0038 0050
        DECLE   $0006,  $0001,  $0008,  $0088   ; 5D23   0006 0001 0008 0088
        DECLE   $0000,  $0001,  $0048,  $0010   ; 5D27   0000 0001 0048 0010
        DECLE   $0002,  $0005,  $0030,  $0098   ; 5D2B   0002 0005 0030 0098
        DECLE   $0000,  $0003,  $0048,  $0098   ; 5D2F   0000 0003 0048 0098
        DECLE   $0004,  $0005,  $0020,  $0098   ; 5D33   0004 0005 0020 0098
        DECLE   $0004,  $000B,  $0030,  $0028   ; 5D37   0004 000B 0030 0028
        DECLE   $0001,  $000A,  $0018,  $0018   ; 5D3B   0001 000A 0018 0018
        DECLE   $0006,  $0000                   ; 5D3F   0006 0000

        INCR    R0                              ; 5D41   0008
        SWAP    R0,     1                       ; 5D42   0040
        SETC                                    ; 5D43   0007
        SETC                                    ; 5D44   0007
        NEGR    R0                              ; 5D45   0020
        RLC     R0,     1                       ; 5D46   0050
        INCR    R0                              ; 5D47   0008
        INCR    R0                              ; 5D48   0008
        INCR    R0                              ; 5D49   0008
        SLR     R0,     1                       ; 5D4A   0060
        INCR    R1                              ; 5D4B   0009
        INCR    R1                              ; 5D4C   0009
        NEGR    R0                              ; 5D4D   0020
        SARC    R0,     1                       ; 5D4E   0078
        INCR    R2                              ; 5D4F   000A
        INCR    R2                              ; 5D50   000A
        INCR    R0                              ; 5D51   0008
        MOVR    R2,     R7                      ; 5D52   0097

        DECLE   $0003,  $0002,  $0059,  $0088   ; 5D53   0003 0002 0059 0088
        DECLE   $0000,  $0002,  $0018,  $0090   ; 5D57   0000 0002 0018 0090
        DECLE   $0005,  $0007,  $0050,  $0098   ; 5D5B   0005 0007 0050 0098
        DECLE   $0002,  $0000,  $0060,  $0018   ; 5D5F   0002 0000 0060 0018
        DECLE   $0003,  $0000,  $0008,  $0050   ; 5D63   0003 0000 0008 0050
        DECLE   $0001,  $0004,  $0060,  $0048   ; 5D67   0001 0004 0060 0048
        DECLE   $0002,  $0001,  $0048,  $0010   ; 5D6B   0002 0001 0048 0010
        DECLE   $0003,  $0006,  $0050,  $0020   ; 5D6F   0003 0006 0050 0020
        DECLE   $0001,  $0005                   ; 5D73   0001 0005
L_5D75:
        DECR    R7                              ; 5D75   0017

        DECLE   $006B,  $0000,  $0004           ; 5D76   006B 0000 0004
L_5D79:
        PSHR    R5                              ; 5D79   0275
        MVI     G_01AF, R1                      ; 5D7A   0281 01AF
        SDBD                                    ; 5D7C   0001
        ADDI    #$6FE2, R1                      ; 5D7D   02F9 00E2 006F
        MVI@    R1,     R0                      ; 5D80   0288
        XORI    #$0089, R0                      ; 5D81   03F8 0089
        SWAP    R0,     1                       ; 5D83   0040
        MVI     G_015E, R1                      ; 5D84   0281 015E
        DECR    R1                              ; 5D86   0011
        SDBD                                    ; 5D87   0001
        ADDI    #$6FDC, R1                      ; 5D88   02F9 00DC 006F
        MVI@    R1,     R4                      ; 5D8B   028C
        ADDI    #$0004, R4                      ; 5D8C   02FC 0004
        MVO@    R0,     R4                      ; 5D8E   0260
        MVO@    R0,     R4                      ; 5D8F   0260

        JSR     R5,     L_5DD5                  ; 5D90   0004 015C 01D5

        PULR    R7                              ; 5D93   02B7

L_5D94:
        PSHR    R5                              ; 5D94   0275

        JSR     R5,     L_5E1B                  ; 5D95   0004 015C 021B

        NEGR    R0                              ; 5D98   0020
        INCR    R7                              ; 5D99   000F

L_5D9A:
        PSHR    R5                              ; 5D9A   0275
L_5D9B:
        MVII    #$0192, R5                      ; 5D9B   02BD 0192
        MOVR    R5,     R4                      ; 5D9D   00AC
        SDBD                                    ; 5D9E   0001
        MVI@    R5,     R1                      ; 5D9F   02A9
        SDBD                                    ; 5DA0   0001
        MVII    #$6FE4, R5                      ; 5DA1   02BD 00E4 006F
L_5DA4:
        MVI@    R5,     R2                      ; 5DA4   02AA
        TSTR    R2                              ; 5DA5   0092
        BEQ     L_5DAB                          ; 5DA6   0204 0003

        CMPR    R1,     R2                      ; 5DA8   014A
        BLE     L_5DA4                          ; 5DA9   0226 0006

L_5DAB:
        ADDR    R1,     R0                      ; 5DAB   00C8
        BPL     L_5DAF                          ; 5DAC   0203 0001

        CLRR    R0                              ; 5DAE   01C0
L_5DAF:
        SDBD                                    ; 5DAF   0001
        MVII    #$270F, R5                      ; 5DB0   02BD 000F 0027
        CMPR    R0,     R5                      ; 5DB3   0145
        BGE     L_5DB7                          ; 5DB4   020D 0001

        MOVR    R5,     R0                      ; 5DB6   00A8
L_5DB7:
        MVO@    R0,     R4                      ; 5DB7   0260
        SWAP    R0,     1                       ; 5DB8   0040
        MVO@    R0,     R4                      ; 5DB9   0260
        SWAP    R0,     1                       ; 5DBA   0040
        TSTR    R2                              ; 5DBB   0092
        BEQ     L_5DC1                          ; 5DBC   0204 0003

        CMPR    R0,     R2                      ; 5DBE   0142
        BLE     L_5DC6                          ; 5DBF   0206 0005

L_5DC1:
        JSR     R5,     L_5D79                  ; 5DC1   0004 015C 0179

        PULR    R7                              ; 5DC4   02B7

L_5DC5:
        PSHR    R5                              ; 5DC5   0275
L_5DC6:
        MVI     G_0194, R0                      ; 5DC6   0280 0194
        INCR    R0                              ; 5DC8   0008

        JSR     R5,     X_CLAMP                 ; 5DC9   0004 0114 0270
        DECLE   $0000                           ; 5DCC   0000

        INCR    R2                              ; 5DCD   000A
        MVO     R0,     G_0194                  ; 5DCE   0240 0194

        JSR     R5,     L_F6CE                  ; 5DD0   0004 01F4 02CE

        B       L_5DC1                          ; 5DD3   0220 0013

L_5DD5:
        PSHR    R5                              ; 5DD5   0275
        MVI     G_015E, R1                      ; 5DD6   0281 015E
        DECR    R1                              ; 5DD8   0011
        SDBD                                    ; 5DD9   0001
        ADDI    #$6FDC, R1                      ; 5DDA   02F9 00DC 006F
        MVI@    R1,     R4                      ; 5DDD   028C
        MVII    #$0195, R3                      ; 5DDE   02BB 0195
        MVI@    R3,     R0                      ; 5DE0   0298
        TSTR    R0                              ; 5DE1   0080
        BNEQ    L_5DF4                          ; 5DE2   020C 0010

        PSHR    R4                              ; 5DE4   0274
        MOVR    R4,     R0                      ; 5DE5   00A0
        SUBI    #$0200, R0                      ; 5DE6   0338 0200
        MOVR    R3,     R5                      ; 5DE8   009D
        MVO@    R0,     R5                      ; 5DE9   0268
        MVII    #$0004, R3                      ; 5DEA   02BB 0004
L_5DEC:
        MVI@    R4,     R0                      ; 5DEC   02A0
        MVO@    R0,     R5                      ; 5DED   0268
        SWAP    R0,     1                       ; 5DEE   0040
        MVO@    R0,     R5                      ; 5DEF   0268
        DECR    R3                              ; 5DF0   0013
        BNEQ    L_5DEC                          ; 5DF1   022C 0006

        PULR    R4                              ; 5DF3   02B4
L_5DF4:
        MVI     G_01AF, R1                      ; 5DF4   0281 01AF
        SDBD                                    ; 5DF6   0001
        ADDI    #$6FE2, R1                      ; 5DF7   02F9 00E2 006F
        MVI@    R1,     R3                      ; 5DFA   028B
        SWAP    R3,     1                       ; 5DFB   0043
        SDBD                                    ; 5DFC   0001
        XORI    #$8980, R3                      ; 5DFD   03FB 0080 0089
        PSHR    R3                              ; 5E00   0273
        MVII    #$0004, R1                      ; 5E01   02B9 0004
        MVII    #$0192, R5                      ; 5E03   02BD 0192
        SDBD                                    ; 5E05   0001
        MVI@    R5,     R0                      ; 5E06   02A8

        JSR     R5,     L_5E2A                  ; 5E07   0004 015C 022A

        MVI     G_015E, R1                      ; 5E0A   0281 015E
        SDBD                                    ; 5E0C   0001
        ADDI    #$6FDC, R1                      ; 5E0D   02F9 00DC 006F
        MVI@    R1,     R4                      ; 5E10   028C
        PULR    R3                              ; 5E11   02B3
        MVII    #$0001, R1                      ; 5E12   02B9 0001
        MVI     G_0194, R0                      ; 5E14   0280 0194
        DECR    R0                              ; 5E16   0010

        JSR     R5,     L_5E2A                  ; 5E17   0004 015C 022A

        PULR    R7                              ; 5E1A   02B7

L_5E1B:
        PSHR    R5                              ; 5E1B   0275
        MVII    #$0195, R4                      ; 5E1C   02BC 0195
        MVI@    R4,     R5                      ; 5E1E   02A5
        ADDI    #$0200, R5                      ; 5E1F   02FD 0200
        MVII    #$0004, R3                      ; 5E21   02BB 0004
L_5E23:
        SDBD                                    ; 5E23   0001
        MVI@    R4,     R2                      ; 5E24   02A2
        MVO@    R2,     R5                      ; 5E25   026A
        DECR    R3                              ; 5E26   0013
        BNEQ    L_5E23                          ; 5E27   022C 0005
        PULR    R7                              ; 5E29   02B7

L_5E2A:
        PSHR    R5                              ; 5E2A   0275
        SDBD                                    ; 5E2B   0001
        ADDI    #$1899, R1                      ; 5E2C   02F9 0099 0018
L_5E2F:
        CMP@    R1,     R0                      ; 5E2F   0348
        BGE     L_5E3A                          ; 5E30   020D 0008

        MVI@    R1,     R5                      ; 5E32   028D
        DECR    R5                              ; 5E33   0015
        BEQ     L_5E3A                          ; 5E34   0204 0004

        DECR    R1                              ; 5E36   0011
        INCR    R4                              ; 5E37   000C
        B       L_5E2F                          ; 5E38   0220 000A
L_5E3A:
        J       .EXEC.8EA                       ; 5E3A   0004 0318 00EA

L_5E3D:
        PSHR    R5                              ; 5E3D   0275
        MVI     G_019E, R2                      ; 5E3E   0282 019E
        SDBD                                    ; 5E40   0001
        MVII    #$5E7B, R4                      ; 5E41   02BC 007B 005E
L_5E44:
        DECR    R2                              ; 5E44   0012
        BMI     L_5E4D                          ; 5E45   020B 0006

        SDBD                                    ; 5E47   0001
        ADDI    #$0027, R4                      ; 5E48   02FC 0027 0000
        B       L_5E44                          ; 5E4B   0220 0008

L_5E4D:
        SDBD                                    ; 5E4D   0001
        MVII    #$000D, R0                      ; 5E4E   02B8 000D 0000
        MVI     G_015E, R1                      ; 5E51   0281 015E
        SLR     R1,     1                       ; 5E53   0061

        JSR     R5,     X_MPY                   ; 5E54   0004 011C 01DC

        ADDR    R2,     R4                      ; 5E57   00D4
        SDBD                                    ; 5E58   0001
        MVII    #$000B, R0                      ; 5E59   02B8 000B 0000
        MVII    #$019F, R1                      ; 5E5C   02B9 019F

        JSR     R5,     .EXEC.730               ; 5E5E   0004 0114 0330

        MVII    #$0172, R5                      ; 5E61   02BD 0172
        MVI@    R4,     R0                      ; 5E63   02A0
        MVO@    R0,     R5                      ; 5E64   0268
        MVI@    R4,     R3                      ; 5E65   02A3
        MVII    #$01AA, R4                      ; 5E66   02BC 01AA
L_5E68:
        MOVR    R3,     R2                      ; 5E68   009A
        MVI@    R4,     R1                      ; 5E69   02A1
        INCR    R1                              ; 5E6A   0009
        ADDR    R7,     R1                      ; 5E6B   00F9
        ADD@    R1,     R7                      ; 5E6C   02CF

        DECLE   $0008,  $0006,  $0004           ; 5E6D   0008 0006 0004

        INCR    R0                              ; 5E70   0008
        ADDI    #$0002, R2                      ; 5E71   02FA 0002
        ADDI    #$0002, R2                      ; 5E73   02FA 0002
        MVO@    R2,     R5                      ; 5E75   026A
        CMPI    #$01AD, R4                      ; 5E76   037C 01AD
        BNEQ    L_5E68                          ; 5E78   022C 0011
        PULR    R7                              ; 5E7A   02B7

        DECLE   $0046,  $0046,  $0005,  $0005   ; 5E7B   0046 0046 0005 0005

        GSWD    R2                              ; 5E7F   0032
        GSWD    R2                              ; 5E80   0032
        INCR    R7                              ; 5E81   000F

        ADCR    R0                              ; 5E82   0028
L_5E83:
        INCR    R2                              ; 5E83   000A
        SLR     R0,     2                       ; 5E84   0064
        INCR    R7                              ; 5E85   000F

        DECLE   $0005                           ; 5E86   0005
L_5E87:
        EIS                                     ; 5E87   0002
        DECLE   $003C,  $0032,  $0007,  $0001   ; 5E88   003C 0032 0007 0001
        DECLE   $0032,  $0028,  $000A,  $0028   ; 5E8C   0032 0028 000A 0028
        DECLE   $0003,  $0014,  $0032,  $0006   ; 5E90   0003 0014 0032 0006
        DECLE   $0003,  $003C,  $0032,  $0008   ; 5E94   0003 003C 0032 0008
        DECLE   $0003,  $0032,  $001E,  $000A   ; 5E98   0003 0032 001E 000A
        DECLE   $0028,  $000A,  $0064,  $000A   ; 5E9C   0028 000A 0064 000A
        DECLE   $0008,  $0005,  $003C,  $0032   ; 5EA0   0008 0005 003C 0032
        DECLE   $0005,  $0005                   ; 5EA4   0005 0005

        COMR    R6                              ; 5EA6   001E
        GSWD    R2                              ; 5EA7   0032
        INCR    R7                              ; 5EA8   000F

        COMR    R6                              ; 5EA9   001E
L_5EAA:
        INCR    R2                              ; 5EAA   000A
        DECLE   $0053,  $0016,  $0007,  $0005   ; 5EAB   0053 0016 0007 0005
        DECLE   $0032,  $0032,  $0007,  $0001   ; 5EAF   0032 0032 0007 0001

        ADCR    R0                              ; 5EB3   0028
        ADCR    R0                              ; 5EB4   0028
        INCR    R2                              ; 5EB5   000A
        COMR    R6                              ; 5EB6   001E
        DIS                                     ; 5EB7   0003
        INCR    R7                              ; 5EB8   000F

        GSWD    R2                              ; 5EB9   0032
L_5EBA:
        INCR    R0                              ; 5EBA   0008
        DECLE   $0005,  $0032,  $0032,  $0008   ; 5EBB   0005 0032 0032 0008
        DECLE   $0003,  $0028,  $001E,  $000A   ; 5EBF   0003 0028 001E 000A
        DECLE   $001E,  $000A,  $0064,  $000A   ; 5EC3   001E 000A 0064 000A
        DECLE   $000A,  $0008,  $0028,  $003C   ; 5EC7   000A 0008 0028 003C
        DECLE   $0005,  $0005                   ; 5ECB   0005 0005

        DECR    R4                              ; 5ECD   0014
        GSWD    R2                              ; 5ECE   0032
        INCR    R7                              ; 5ECF   000F

        DECR    R4                              ; 5ED0   0014
L_5ED1:
        COMR    R6                              ; 5ED1   001E
        DECLE   $0032,  $001E,  $000A,  $0009   ; 5ED2   0032 001E 000A 0009
        DECLE   $0028,  $0028,  $0007,  $0001   ; 5ED6   0028 0028 0007 0001
        DECLE   $001E,  $0028,  $000A,  $0019   ; 5EDA   001E 0028 000A 0019
        DECLE   $0003,  $000A,  $003C,  $000B   ; 5EDE   0003 000A 003C 000B
        DECLE   $000A,  $0028,  $0028,  $0008   ; 5EE2   000A 0028 0028 0008
        DECLE   $0003,  $001E,  $001E,  $000A   ; 5EE6   0003 001E 001E 000A
        DECLE   $0019,  $000A,  $005A,  $000C   ; 5EEA   0019 000A 005A 000C
        DECLE   $000D,  $000C,  $001C,  $0055   ; 5EEE   000D 000C 001C 0055
        DECLE   $0002,  $0005                   ; 5EF2   0002 0005

        INCR    R2                              ; 5EF4   000A
        SWAP    R1,     1                       ; 5EF5   0041
        INCR    R7                              ; 5EF6   000F
        INCR    R7                              ; 5EF7   000F

L_5EF8:
        INCR    R2                              ; 5EF8   000A
L_5EF9:
        ADCR    R0                              ; 5EF9   0028
        DECLE   $0014,  $000A,  $000A,  $001E   ; 5EFA   0014 000A 000A 001E
        DECLE   $003C,  $0003,  $0001,  $0014   ; 5EFE   003C 0003 0001 0014
        DECLE   $0028,  $000A,  $0014,  $0003   ; 5F02   0028 000A 0014 0003
        DECLE   $000A,  $0046,  $000B,  $000B   ; 5F06   000A 0046 000B 000B
        DECLE   $001E,  $003C,  $0004           ; 5F0A   001E 003C 0004

        DIS                                     ; 5F0D   0003
        COMR    R1                              ; 5F0E   0019
        COMR    R6                              ; 5F0F   001E
        INCR    R2                              ; 5F10   000A
        DECR    R4                              ; 5F11   0014
        INCR    R2                              ; 5F12   000A
        RLC     R1,     2                       ; 5F13   0055
        INCR    R7                              ; 5F14   000F

        INCR    R5                              ; 5F15   000D
L_5F16:
        INCR    R5                              ; 5F16   000D
L_5F17:
        PSHR    R5                              ; 5F17   0275
        MVII    #$00FF, R5                      ; 5F18   02BD 00FF
        MVO     R5,     G_0168                  ; 5F1A   0245 0168
        MVI     G_0164, R0                      ; 5F1C   0280 0164
        TSTR    R0                              ; 5F1E   0080
        BNEQ    L_5F26                          ; 5F1F   020C 0005

        MVI     G_031B, R5                      ; 5F21   0285 031B
        ADDI    #$0004, R5                      ; 5F23   02FD 0004
        MVI@    R5,     R0                      ; 5F25   02A8
L_5F26:
        SLL     R0,     2                       ; 5F26   004C
        MOVR    R0,     R4                      ; 5F27   0084
        SDBD                                    ; 5F28   0001
        ADDI    #$5FBE, R4                      ; 5F29   02FC 00BE 005F
        MVI     G_011B, R0                      ; 5F2C   0280 011B
        SUBI    #$0002, R0                      ; 5F2E   0338 0002
        SLL     R0,     1                       ; 5F30   0048
        PSHR    R0                              ; 5F31   0270
        SLL     R0,     2                       ; 5F32   004C
        ADD@    R6,     R0                      ; 5F33   02F0
        ADDR    R0,     R4                      ; 5F34   00C4
        MVII    #$0003, R0                      ; 5F35   02B8 0003
        MVI     G_015E, R2                      ; 5F37   0282 015E
        CMPR    R0,     R2                      ; 5F39   0142
        BNEQ    L_5F42                          ; 5F3A   020C 0006

        MVI     G_011B, R2                      ; 5F3C   0282 011B
        CMPI    #$0006, R2                      ; 5F3E   037A 0006
        BEQ     L_5F47                          ; 5F40   0204 0005

L_5F42:
        MVI     G_0181, R2                      ; 5F42   0282 0181
        TSTR    R2                              ; 5F44   0092
        BEQ     L_5F48                          ; 5F45   0204 0001

L_5F47:
        INCR    R0                              ; 5F47   0008
L_5F48:
        MVI     G_017A, R2                      ; 5F48   0282 017A
        ADDI    #$0200, R2                      ; 5F4A   02FA 0200
        MVI@    R4,     R1                      ; 5F4C   02A1
        MOVR    R1,     R5                      ; 5F4D   008D
        ADDR    R1,     R5                      ; 5F4E   00CD
        SDBD                                    ; 5F4F   0001
        ADDI    #$561C, R5                      ; 5F50   02FD 001C 0056
        SDBD                                    ; 5F53   0001
        ADD@    R5,     R2                      ; 5F54   02EA
        CMPI    #$0200, R2                      ; 5F55   037A 0200
        BLT     L_5FA5                          ; 5F57   0205 004C

        CMPI    #$02EF, R2                      ; 5F59   037A 02EF
        BGT     L_5FA5                          ; 5F5B   020E 0048

        MVI@    R2,     R2                      ; 5F5D   0292
        SWAP    R2,     1                       ; 5F5E   0042
        MOVR    R2,     R5                      ; 5F5F   0095
        ANDI    #$0040, R5                      ; 5F60   03BD 0040
        BNEQ    L_5F70                          ; 5F62   020C 000C

        ANDI    #$0080, R2                      ; 5F64   03BA 0080
        BNEQ    L_5FA5                          ; 5F66   020C 003D

        MVI     G_0168, R2                      ; 5F68   0282 0168
        CMPI    #$00FF, R2                      ; 5F6A   037A 00FF
        BNEQ    L_5F70                          ; 5F6C   020C 0002

        MVO     R1,     G_0168                  ; 5F6E   0241 0168
L_5F70:
        MOVR    R1,     R2                      ; 5F70   008A
        ANDI    #$0001, R2                      ; 5F71   03BA 0001
        MOVR    R2,     R3                      ; 5F73   0093
        ADDI    #$031F, R2                      ; 5F74   02FA 031F
        MVI@    R2,     R2                      ; 5F76   0292
        SWAP    R2,     1                       ; 5F77   0042
        ANDI    #$00FF, R2                      ; 5F78   03BA 00FF
        ADD     G_031B, R3                      ; 5F7A   02C3 031B
        ADDI    #$0002, R3                      ; 5F7C   02FB 0002
        MVI@    R3,     R3                      ; 5F7E   029B
        SWAP    R3,     1                       ; 5F7F   0043
        ANDI    #$00FF, R3                      ; 5F80   03BB 00FF
        PSHR    R2                              ; 5F82   0272
        MVI     G_0181, R2                      ; 5F83   0282 0181
        TSTR    R2                              ; 5F85   0092
        BEQ     L_5F8C                          ; 5F86   0204 0004

L_5F88:
        MOVR    R3,     R2                      ; 5F88   009A
        PULR    R3                              ; 5F89   02B3
        B       L_5F99                          ; 5F8A   0200 000D

L_5F8C:
        MVI     G_015E, R2                      ; 5F8C   0282 015E
        CMPI    #$0003, R2                      ; 5F8E   037A 0003
        BNEQ    L_5F98                          ; 5F90   020C 0006

        MVI     G_011B, R2                      ; 5F92   0282 011B
        CMPI    #$0006, R2                      ; 5F94   037A 0006
        BEQ     L_5F88                          ; 5F96   0224 000F

L_5F98:
        PULR    R2                              ; 5F98   02B2
L_5F99:
        CMPI    #$0001, R1                      ; 5F99   0379 0001
        BGT     L_5FA2                          ; 5F9B   020E 0005

        CMPR    R2,     R3                      ; 5F9D   0153
        BLT     L_5FAF                          ; 5F9E   0205 000F
        B       L_5FA5                          ; 5FA0   0200 0003

L_5FA2:
        CMPR    R2,     R3                      ; 5FA2   0153
        BGT     L_5FAF                          ; 5FA3   020E 000A

L_5FA5:
        DECR    R0                              ; 5FA5   0010
        BNEQ    L_5F48                          ; 5FA6   022C 005F

        MVI     G_0168, R1                      ; 5FA8   0281 0168
        CMPI    #$00FF, R1                      ; 5FAA   0379 00FF
        BNEQ    L_5FAF                          ; 5FAC   020C 0001

        MVI@    R4,     R1                      ; 5FAE   02A1
L_5FAF:
        TSTR    R5                              ; 5FAF   00AD
        BEQ     L_5FB4                          ; 5FB0   0204 0002

        CLRR    R1                              ; 5FB2   01C9
        INCR    R7                              ; 5FB3   000F

L_5FB4:
        INCR    R1                              ; 5FB4   0009
L_5FB5:
        MVO     R1,     G_0164                  ; 5FB5   0241 0164
        MVI     G_011B, R3                      ; 5FB7   0283 011B
        SLR     R3,     1                       ; 5FB9   0063
        ADDI    #$016B, R3                      ; 5FBA   02FB 016B
        MVO@    R1,     R3                      ; 5FBC   0259
        PULR    R7                              ; 5FBD   02B7

        DECLE   $0003,  $0002,  $0001,  $0000   ; 5FBE   0003 0002 0001 0000
        DECLE   $0001,  $0003,  $0000,  $0002   ; 5FC2   0001 0003 0000 0002
        DECLE   $0002,  $0000,  $0001,  $0003   ; 5FC6   0002 0000 0001 0003
        DECLE   $0003,  $0001,  $0002,  $0000   ; 5FCA   0003 0001 0002 0000
        DECLE   $0000,  $0002,  $0003,  $0001   ; 5FCE   0000 0002 0003 0001
        DECLE   $0000,  $0001,  $0002,  $0003   ; 5FD2   0000 0001 0002 0003
        DECLE   $0000,  $0001,  $0003,  $0002   ; 5FD6   0000 0001 0003 0002
        DECLE   $0001,  $0002,  $0000,  $0003   ; 5FDA   0001 0002 0000 0003
        DECLE   $0002,  $0003,  $0001,  $0000   ; 5FDE   0002 0003 0001 0000
        DECLE   $0003,  $0000,  $0002,  $0001   ; 5FE2   0003 0000 0002 0001
        DECLE   $0002,  $0001,  $0000,  $0003   ; 5FE6   0002 0001 0000 0003
        DECLE   $0003,  $0001,  $0000,  $0002   ; 5FEA   0003 0001 0000 0002
        DECLE   $0000,  $0002,  $0001,  $0003   ; 5FEE   0000 0002 0001 0003
        DECLE   $0001,  $0003,  $0002,  $0000   ; 5FF2   0001 0003 0002 0000
        DECLE   $0002,  $0000,  $0003,  $0001   ; 5FF6   0002 0000 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFA   0000 0000 0000 0000
        DECLE   $0000                           ; 5FFE   0000

        RLC     R0,     1                       ; 5FFF   0050
L_6000:
        PSHR    R5                              ; 6000   0275
L_6001:
        MVI     G_015F, R5                      ; 6001   0285 015F
        TSTR    R5                              ; 6003   00AD
        BNEQ    L_6022                          ; 6004   020C 001C

        MOVR    R1,     R2                      ; 6006   008A
        ADDI    #$0002, R2                      ; 6007   02FA 0002
        MVI@    R2,     R5                      ; 6009   0295
        CMPI    #$00B8, R5                      ; 600A   037D 00B8
        BEQ     L_6023                          ; 600C   0204 0015

        MVII    #$00B8, R5                      ; 600E   02BD 00B8
        MVO@    R5,     R2                      ; 6010   0255
        ADDI    #$0008, R2                      ; 6011   02FA 0008
        MVO@    R5,     R2                      ; 6013   0255
        MVI     G_015E, R0                      ; 6014   0280 015E
        DECR    R0                              ; 6016   0010
        BNEQ    L_601D                          ; 6017   020C 0004

        MVO     R5,     G_033F                  ; 6019   0245 033F
        MVO     R5,     G_0347                  ; 601B   0245 0347
L_601D:
        MVII    #$0028, R0                      ; 601D   02B8 0028
        ADDI    #$0006, R1                      ; 601F   02F9 0006
        MVO@    R0,     R1                      ; 6021   0248
L_6022:
        PULR    R7                              ; 6022   02B7

L_6023:
        MVO     R0,     G_01AD                  ; 6023   0240 01AD
        MVO     R1,     G_0317                  ; 6025   0241 0317
        MOVR    R0,     R2                      ; 6027   0082
        SUBI    #$0002, R2                      ; 6028   033A 0002
        SLR     R2,     1                       ; 602A   0062
        MOVR    R2,     R1                      ; 602B   0091
        ADDI    #$01AA, R2                      ; 602C   02FA 01AA
        MVI@    R2,     R3                      ; 602E   0293
        CMPI    #$0003, R3                      ; 602F   037B 0003
        BEQ     L_60A3                          ; 6031   0204 0070

        ADDI    #$0173, R1                      ; 6033   02F9 0173
        MVI@    R1,     R0                      ; 6035   0288
        ADDI    #$0002, R0                      ; 6036   02F8 0002
        CMPI    #$000F, R0                      ; 6038   0378 000F
        BLE     L_603E                          ; 603A   0206 0002

        MVII    #$000F, R0                      ; 603C   02B8 000F
L_603E:
        MVO@    R0,     R1                      ; 603E   0248
        MVII    #$000C, R0                      ; 603F   02B8 000C
        MVO     R0,     G_016A                  ; 6041   0240 016A
        MVI     G_015E, R0                      ; 6043   0280 015E
        DECR    R0                              ; 6045   0010
        PSHR    R0                              ; 6046   0270
        SLL     R0,     1                       ; 6047   0048
        ADD@    R6,     R0                      ; 6048   02F0
        MOVR    R0,     R4                      ; 6049   0084
        SDBD                                    ; 604A   0001
        ADDI    #$60A8, R4                      ; 604B   02FC 00A8 0060
        MVI     G_0161, R0                      ; 604E   0280 0161
        ADDR    R0,     R4                      ; 6050   00C4
        ADDR    R0,     R4                      ; 6051   00C4
        MVI     G_0317, R5                      ; 6052   0285 0317
        ADDI    #$0002, R5                      ; 6054   02FD 0002
        MVI@    R4,     R0                      ; 6056   02A0
        SWAP    R0,     1                       ; 6057   0040
        MVO@    R0,     R5                      ; 6058   0268
        MVI@    R4,     R1                      ; 6059   02A1
        SWAP    R1,     1                       ; 605A   0041
        MVO@    R1,     R5                      ; 605B   0269
        ADDI    #$0006, R5                      ; 605C   02FD 0006
        MVO@    R0,     R5                      ; 605E   0268
        MVO@    R1,     R5                      ; 605F   0269
        MVI     G_015E, R2                      ; 6060   0282 015E
        DECR    R2                              ; 6062   0012
        SLL     R2,     1                       ; 6063   004A
        SDBD                                    ; 6064   0001
        ADDI    #$DA4A, R2                      ; 6065   02FA 004A 00DA
        MVI     G_01AD, R0                      ; 6068   0280 01AD
        SLR     R0,     1                       ; 606A   0060
        ADDR    R0,     R2                      ; 606B   00C2
        SDBD                                    ; 606C   0001
        MVII    #$DA56, R4                      ; 606D   02BC 0056 00DA
        ADD@    R2,     R4                      ; 6070   02D4
        MVI     G_0317, R1                      ; 6071   0281 0317

        JSR     R5,     L_548A                  ; 6073   0004 0154 008A

        MVI     G_011C, R0                      ; 6076   0280 011C
        COMR    R0                              ; 6078   0018
        AND     G_0171, R0                      ; 6079   0380 0171
        MVO     R0,     G_0171                  ; 607B   0240 0171
        MVI     G_015E, R5                      ; 607D   0285 015E
        CMPI    #$0005, R5                      ; 607F   037D 0005
        BNEQ    L_6089                          ; 6081   020C 0006

        CMPI    #$0001, R3                      ; 6083   037B 0001
        BNEQ    L_6089                          ; 6085   020C 0002

        MVII    #$0003, R3                      ; 6087   02BB 0003
L_6089:
        SUBI    #$0008, R1                      ; 6089   0339 0008
        MVI@    R1,     R5                      ; 608B   028D
        SDBD                                    ; 608C   0001
        ANDI    #$FFE8, R5                      ; 608D   03BD 00E8 00FF
        SDBD                                    ; 6090   0001
        ADDI    #$60A4, R3                      ; 6091   02FB 00A4 0060
        XOR@    R3,     R5                      ; 6094   03DD
        MVO@    R5,     R1                      ; 6095   024D
        MVI     G_015E, R5                      ; 6096   0285 015E
        DECR    R5                              ; 6098   0015
        BNEQ    L_60A0                          ; 6099   020C 0005

        ADDI    #$0008, R1                      ; 609B   02F9 0008

        JSR     R5,     L_548A                  ; 609D   0004 0154 008A
L_60A0:
        JSR     R5,     L_F717                  ; 60A0   0004 01F4 0317

L_60A3:
        PULR    R7                              ; 60A3   02B7

        DECLE   $0005                           ; 60A4   0005

        CLRC                                    ; 60A5   0006
        EIS                                     ; 60A6   0002
        DECR    R2                              ; 60A7   0012
        COMR    R0                              ; 60A8   0018
        GSWD    R0                              ; 60A9   0030
        RLC     R0,     1                       ; 60AA   0050
        SLLC    R0,     1                       ; 60AB   0058
        TSTR    R0                              ; 60AC   0080
        SLLC    R0,     1                       ; 60AD   0058
        RRC     R0,     1                       ; 60AE   0070
        INCR    R0                              ; 60AF   0008
        DECR    R0                              ; 60B0   0010
        GSWD    R0                              ; 60B1   0030
        MOVR    R1,     R0                      ; 60B2   0088
        RSWD    R0                              ; 60B3   0038
        TSTR    R0                              ; 60B4   0080
        NEGR    R0                              ; 60B5   0020
        MOVR    R1,     R0                      ; 60B6   0088
        DECR    R0                              ; 60B7   0010
        SLR     R0,     1                       ; 60B8   0060
        RSWD    R0                              ; 60B9   0038
L_60BA:
        PSHR    R5                              ; 60BA   0275
        MVII    #$032D, R3                      ; 60BB   02BB 032D
        CLRR    R4                              ; 60BD   01E4
        MVII    #$0008, R5                      ; 60BE   02BD 0008
        MVI     G_015E, R1                      ; 60C0   0281 015E
        DECR    R1                              ; 60C2   0011
        BEQ     L_60C8                          ; 60C3   0204 0003

        ADDR    R5,     R3                      ; 60C5   00EB
        INCR    R4                              ; 60C6   000C
        ADDR    R5,     R5                      ; 60C7   00ED
L_60C8:
        MVII    #$0003, R0                      ; 60C8   02B8 0003
        CMPI    #$0002, R1                      ; 60CA   0379 0002
        BNEQ    L_60CF                          ; 60CC   020C 0001

        DECR    R0                              ; 60CE   0010
L_60CF:
        MVII    #$01AA, R2                      ; 60CF   02BA 01AA
L_60D1:
        MVI     G_015E, R1                      ; 60D1   0281 015E
        CMPI    #$0005, R1                      ; 60D3   0379 0005
        BNEQ    L_60DF                          ; 60D5   020C 0008

        MVI@    R2,     R1                      ; 60D7   0291
        DECR    R1                              ; 60D8   0011
        BNEQ    L_60DF                          ; 60D9   020C 0004

        MVII    #$0003, R1                      ; 60DB   02B9 0003
        B       L_60E4                          ; 60DD   0200 0005

L_60DF:
        MVI@    R2,     R1                      ; 60DF   0291
        CMPI    #$0003, R1                      ; 60E0   0379 0003
        BEQ     L_60F7                          ; 60E2   0204 0013

L_60E4:
        SDBD                                    ; 60E4   0001
        ADDI    #$60A4, R1                      ; 60E5   02F9 00A4 0060
        PSHR    R0                              ; 60E8   0270
        MVI@    R3,     R0                      ; 60E9   0298
        SDBD                                    ; 60EA   0001
        ANDI    #$FFE8, R0                      ; 60EB   03B8 00E8 00FF
        XOR@    R1,     R0                      ; 60EE   03C8
        MVO@    R0,     R3                      ; 60EF   0258
        PULR    R0                              ; 60F0   02B0
L_60F1:
        ADDR    R4,     R2                      ; 60F1   00E2
        ADDR    R5,     R3                      ; 60F2   00EB
        DECR    R0                              ; 60F3   0010
        BNEQ    L_60D1                          ; 60F4   022C 0024
        PULR    R7                              ; 60F6   02B7

L_60F7:
        PSHR    R0                              ; 60F7   0270
        PSHR    R4                              ; 60F8   0274
        PSHR    R5                              ; 60F9   0275
        MOVR    R3,     R4                      ; 60FA   009C
        SUBI    #$0008, R4                      ; 60FB   033C 0008
        MOVR    R5,     R0                      ; 60FD   00A8

        JSR     R5,     X_FILL_ZERO             ; 60FE   0004 0114 0338

        PULR    R5                              ; 6101   02B5
        PULR    R4                              ; 6102   02B4
        PULR    R0                              ; 6103   02B0
        B       L_60F1                          ; 6104   0220 0014

        DECLE   $0080,  $00C0,  $00C0,  $00E0   ; 6106   0080 00C0 00C0 00E0
        DECLE   $00F0,  $00F0,  $0078,  $0078   ; 610A   00F0 00F0 0078 0078
        DECLE   $007C,  $003E,  $0007,  $0003   ; 610E   007C 003E 0007 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6112   0000 0000 0000 0000
        DECLE   $0080,  $00C0,  $00C0,  $00E0   ; 6116   0080 00C0 00C0 00E0
        DECLE   $00F0,  $00F0,  $0078,  $0078   ; 611A   00F0 00F0 0078 0078
        DECLE   $007C,  $003E,  $0007,  $0003   ; 611E   007C 003E 0007 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6122   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0080   ; 6126   0000 0000 0080 0080
        DECLE   $0080,  $00C0,  $0040,  $0060   ; 612A   0080 00C0 0040 0060
        DECLE   $0070,  $003C,  $0006,  $0003   ; 612E   0070 003C 0006 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6132   0000 0000 0000 0000
        DECLE   $007E,  $0066,  $0000,  $0054   ; 6136   007E 0066 0000 0054
        DECLE   $0010,  $0010,  $0010,  $0008   ; 613A   0010 0010 0010 0008
        DECLE   $0008,  $0008,  $0008,  $0004   ; 613E   0008 0008 0008 0004
        DECLE   $0002,  $0012,  $0012,  $000C   ; 6142   0002 0012 0012 000C
        DECLE   $007E,  $0066,  $0000,  $002A   ; 6146   007E 0066 0000 002A
        DECLE   $0008,  $0008,  $0008,  $0010   ; 614A   0008 0008 0008 0010
        DECLE   $0010,  $0010,  $0010,  $0008   ; 614E   0010 0010 0010 0008
        DECLE   $0004,  $0004                   ; 6152   0004 0004

        SWAP    R0,     2                       ; 6154   0044
        RSWD    R0                              ; 6155   0038
        MOVR    R0,     R1                      ; 6156   0081
        ADDR    R0,     R3                      ; 6157   00C3
        ADDR    R0,     R3                      ; 6158   00C3
        ADDR    R4,     R7                      ; 6159   00E7

        DECLE   $007E,  $007E,  $005A,  $005A   ; 615A   007E 007E 005A 005A
        DECLE   $007E,  $007E,  $00BD,  $003C   ; 615E   007E 007E 00BD 003C
        DECLE   $0099,  $0018,  $0022,  $00C1   ; 6162   0099 0018 0022 00C1
        DECLE   $0000                           ; 6166   0000

        MOVR    R0,     R1                      ; 6167   0081
        ADDR    R0,     R3                      ; 6168   00C3
        ADDR    R0,     R3                      ; 6169   00C3
        ADDR    R4,     R7                      ; 616A   00E7

        DECLE   $007E,  $007E,  $007E,  $007E   ; 616B   007E 007E 007E 007E
        DECLE   $007E,  $007E,  $00BD,  $003C   ; 616F   007E 007E 00BD 003C
        DECLE   $0099,  $0018,  $0000,  $0077   ; 6173   0099 0018 0000 0077
        DECLE   $0045,  $0077,  $0000,  $0049   ; 6177   0045 0077 0000 0049
        DECLE   $006D,  $005B,  $0049,  $0077   ; 617B   006D 005B 0049 0077
        DECLE   $0024,  $0026,  $0074,  $0007   ; 617F   0024 0026 0074 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6183   0000 0000 0000 0000
        DECLE   $0000,  $0081,  $0042,  $0024   ; 6187   0000 0081 0042 0024
        DECLE   $0000,  $00FF,  $0000,  $0018   ; 618B   0000 00FF 0000 0018
        DECLE   $0024,  $0042,  $0081,  $0000   ; 618F   0024 0042 0081 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6193   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0081,  $0042   ; 6197   0000 0000 0081 0042
        DECLE   $0024,  $0081,  $007E,  $0000   ; 619B   0024 0081 007E 0000
        DECLE   $0018,  $0024,  $0042,  $0081   ; 619F   0018 0024 0042 0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61A3   0000 0000 0000 0000
        DECLE   $0004,  $0000,  $0004,  $0000   ; 61A7   0004 0000 0004 0000
        DECLE   $0000,  $0040,  $0080,  $0080   ; 61AB   0000 0040 0080 0080
        DECLE   $0062,  $0014,  $0000,  $0000   ; 61AF   0062 0014 0000 0000
        DECLE   $0008,  $0022,  $0049,  $0000   ; 61B3   0008 0022 0049 0000
        DECLE   $0004,  $0000,  $0004,  $0000   ; 61B7   0004 0000 0004 0000
        DECLE   $0000,  $0040,  $0080,  $0080   ; 61BB   0000 0040 0080 0080
        DECLE   $0062,  $0014,  $0000,  $0008   ; 61BF   0062 0014 0000 0008
        DECLE   $0022,  $0049,  $0000           ; 61C3   0022 0049 0000

        EIS                                     ; 61C6   0002
        DIS                                     ; 61C7   0003
        DIS                                     ; 61C8   0003
        DIS                                     ; 61C9   0003
        EIS                                     ; 61CA   0002
        DIS                                     ; 61CB   0003
        DIS                                     ; 61CC   0003
        DIS                                     ; 61CD   0003
        EIS                                     ; 61CE   0002
        DIS                                     ; 61CF   0003
        DIS                                     ; 61D0   0003
        DIS                                     ; 61D1   0003
        ADDR    R0,     R2                      ; 61D2   00C2
        ADDR    R0,     R3                      ; 61D3   00C3
        ADDR    R0,     R3                      ; 61D4   00C3
        ADDR    R0,     R2                      ; 61D5   00C2
        NEGR    R2                              ; 61D6   0022
        MOVR    R3,     R1                      ; 61D7   0099
        RRC     R0,     2                       ; 61D8   0074
        ADDR    R7,     R6                      ; 61D9   00FE
        SLLC    R2,     2                       ; 61DA   005E
        INCR    R7                              ; 61DB   000F

        SETC                                    ; 61DC   0007
L_61DD:
        NEGR    R1                              ; 61DD   0021
        DECLE   $0058,  $0016,  $008C,  $0020   ; 61DE   0058 0016 008C 0020
        DECLE   $0002,  $0014,  $0000,  $0000   ; 61E2   0002 0014 0000 0000
        DECLE   $0004                           ; 61E6   0004

        NEGR    R2                              ; 61E7   0022
        MOVR    R3,     R1                      ; 61E8   0099
        RRC     R0,     2                       ; 61E9   0074
        ADDR    R7,     R6                      ; 61EA   00FE
        SLLC    R2,     2                       ; 61EB   005E
        INCR    R7                              ; 61EC   000F

        DECLE   $0027                           ; 61ED   0027
L_61EE:
        SLLC    R3,     1                       ; 61EE   005B
        DECLE   $0016,  $008C,  $0020,  $0002   ; 61EF   0016 008C 0020 0002
        DECLE   $0014,  $0000,  $0000,  $0028   ; 61F3   0014 0000 0000 0028
        DECLE   $0040,  $008D,  $0016,  $003F   ; 61F7   0040 008D 0016 003F
        DECLE   $0039,  $00F0,  $00E5,  $00D8   ; 61FB   0039 00F0 00E5 00D8
        DECLE   $00EA,  $00B8,  $00C2,  $00B4   ; 61FF   00EA 00B8 00C2 00B4
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6203   0000 0000 0000 0080
        DECLE   $0028,  $0040,  $008D,  $0016   ; 6207   0028 0040 008D 0016
        DECLE   $00BF,  $0039,  $00F1,  $00FC   ; 620B   00BF 0039 00F1 00FC
        DECLE   $00EB,  $00B8,  $00C2,  $00B4   ; 620F   00EB 00B8 00C2 00B4
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6213   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6217   0000 0000 0000 0000
        DECLE   $0040,  $0000,  $0010,  $0080   ; 621B   0040 0000 0010 0080
        DECLE   $0024,  $0001,  $0040,  $0000   ; 621F   0024 0001 0040 0000
        DECLE   $0001,  $0000,  $0000,  $0030   ; 6223   0001 0000 0000 0030
        DECLE   $0002,  $0005                   ; 6227   0002 0005

        SLL     R0,     1                       ; 6229   0048
        INCR    R1                              ; 622A   0009
        MOVR    R2,     R4                      ; 622B   0094
L_622C:
        DECR    R7                              ; 622C   0017

        SLR     R1,     1                       ; 622D   0061
        MOVR    R1,     R7                      ; 622E   008F

        DECLE   $00B0,  $0000,  $0088,  $0020   ; 622F   00B0 0000 0088 0020
        DECLE   $0008,  $0040,  $0010,  $0020   ; 6233   0008 0040 0010 0020
        DECLE   $0000,  $0008,  $0000,  $0024   ; 6237   0000 0008 0000 0024
        DECLE   $0010,  $000A,  $000A,  $0004   ; 623B   0010 000A 000A 0004
        DECLE   $0030,  $004C,  $006E,  $001D   ; 623F   0030 004C 006E 001D
        DECLE   $000E,  $0001,  $0022,  $0020   ; 6243   000E 0001 0022 0020
        DECLE   $0000,  $0008,  $0000,  $0000   ; 6247   0000 0008 0000 0000
        DECLE   $0050,  $0008,  $0004,  $0000   ; 624B   0050 0008 0004 0000
        DECLE   $0038,  $0046,  $0063,  $0013   ; 624F   0038 0046 0063 0013
        DECLE   $000E,  $0001,  $0022,  $0020   ; 6253   000E 0001 0022 0020
        DECLE   $0000,  $0008,  $0000,  $0024   ; 6257   0000 0008 0000 0024
        DECLE   $0010,  $000A,  $000A,  $0004   ; 625B   0010 000A 000A 0004
        DECLE   $0030,  $004C,  $006E,  $001D   ; 625F   0030 004C 006E 001D
        DECLE   $000E,  $0001,  $0022,  $0020   ; 6263   000E 0001 0022 0020
        DECLE   $0000,  $0008,  $0000,  $0004   ; 6267   0000 0008 0000 0004
        DECLE   $0010,  $000A,  $000A,  $0006   ; 626B   0010 000A 000A 0006
        DECLE   $0032,  $005C,  $007E,  $0039   ; 626F   0032 005C 007E 0039
        DECLE   $000E,  $0001,  $0022,  $0008   ; 6273   000E 0001 0022 0008
        DECLE   $0004,  $0000,  $0001,  $0000   ; 6277   0004 0000 0001 0000
        DECLE   $0013,  $000E,  $0004,  $0000   ; 627B   0013 000E 0004 0000
        DECLE   $0010,  $002C,  $0020,  $0040   ; 627F   0010 002C 0020 0040
        DECLE   $0040,  $0080,  $0000,  $0080   ; 6283   0040 0080 0000 0080
        DECLE   $00C0,  $00E0,  $00F0,  $00F0   ; 6287   00C0 00E0 00F0 00F0
        DECLE   $00F8,  $00F8,  $00FC,  $00FE   ; 628B   00F8 00F8 00FC 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00E0   ; 628F   00FE 00FE 00FE 00E0
        DECLE   $0080,  $0080,  $0080,  $0000   ; 6293   0080 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 6297   0000 0000 0000 0003
        DECLE   $0080,  $0089,  $00C4,  $0060   ; 629B   0080 0089 00C4 0060
        DECLE   $0031,  $0008,  $0000,  $0004   ; 629F   0031 0008 0000 0004

        EIS                                     ; 62A3   0002
        EIS                                     ; 62A4   0002

        JSR     R4,     L_6800                  ; 62A5   0004 0068 0000
        DECLE   $0002,  $0047,  $0009,  $0000   ; 62A8   0002 0047 0009 0000
        DECLE   $0000,  $0008,  $0000,  $0000   ; 62AC   0000 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62B4   0000 0000 0000 0000
        DECLE   $0041,  $0041,  $0063,  $0036   ; 62B8   0041 0041 0063 0036
        DECLE   $003E,  $001C,  $0008,  $0014   ; 62BC   003E 001C 0008 0014
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0063   ; 62C8   0000 0000 0000 0063
        DECLE   $0036,  $001C,  $001C,  $0008   ; 62CC   0036 001C 001C 0008
        DECLE   $0014,  $0000,  $0000,  $0000   ; 62D0   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62D8   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $0077,  $005D   ; 62DC   0000 0022 0077 005D
        DECLE   $0008,  $0014,  $0000,  $0000   ; 62E0   0008 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0014,  $0014   ; 62EC   0000 0000 0014 0014
        DECLE   $003E,  $002A,  $0022,  $0041   ; 62F0   003E 002A 0022 0041
        DECLE   $0041,  $0000,  $0000,  $0000   ; 62F4   0041 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62F8   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $0077,  $005D   ; 62FC   0000 0022 0077 005D
        DECLE   $0008,  $0014,  $0000,  $0000   ; 6300   0008 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6304   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0063   ; 6308   0000 0000 0000 0063
        DECLE   $0036,  $001C,  $001C,  $0008   ; 630C   0036 001C 001C 0008
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6310   0014 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6314   0000 0000

        MOVR    R6,     R5                      ; 6316   00B5
        SARC    R3,     2                       ; 6317   007F
        ADDR    R1,     R2                      ; 6318   00CA
        ADDR    R1,     R7                      ; 6319   00CF

        DECLE   $00E3,  $00F1,  $0078,  $00BC   ; 631A   00E3 00F1 0078 00BC
        DECLE   $001E,  $00AE,  $0086,  $00C6   ; 631E   001E 00AE 0086 00C6
        DECLE   $00EE,  $00FE,  $00FC,  $0078   ; 6322   00EE 00FE 00FC 0078
        DECLE   $002A,  $001F                   ; 6326   002A 001F

        MOVR    R6,     R5                      ; 6328   00B5
        SARC    R3,     2                       ; 6329   007F
        SAR     R3,     2                       ; 632A   006F
        SLR     R2,     2                       ; 632B   0066
        RRC     R2,     2                       ; 632C   0076
        MOVR    R7,     R0                      ; 632D   00B8
        COMR    R4                              ; 632E   001C
        ADCR    R6                              ; 632F   002E
        SETC                                    ; 6330   0007
L_6331:
        DECR    R7                              ; 6331   0017
        MOVR    R1,     R7                      ; 6332   008F

        DECLE   $00FF,  $00FF                   ; 6333   00FF 00FF

        ADDR    R7,     R6                      ; 6335   00FE
        SLR     R0,     1                       ; 6336   0060
        ADDR    R6,     R5                      ; 6337   00F5
        ADDR    R3,     R7                      ; 6338   00DF

        MOVR    R1,     R2                      ; 6339   008A
        MOVR    R1,     R7                      ; 633A   008F

        DECLE   $0083,  $00C1,  $00F0,  $0078   ; 633B   0083 00C1 00F0 0078
        DECLE   $003C,  $005C,  $001C,  $00BC   ; 633F   003C 005C 001C 00BC
        DECLE   $00FC,  $00F8,  $00F0,  $0020   ; 6343   00FC 00F8 00F0 0020
        DECLE   $00C0,  $00E4,  $003C,  $0018   ; 6347   00C0 00E4 003C 0018
        DECLE   $001C,  $0086,  $00C2,  $00E0   ; 634B   001C 0086 00C2 00E0
        DECLE   $0070,  $0038,  $00B8,  $00F8   ; 634F   0070 0038 00B8 00F8
        DECLE   $00F8,  $00F0,  $0060,  $0010   ; 6353   00F8 00F0 0060 0010
        DECLE   $00C0,  $00EA,  $00FE,  $009E   ; 6357   00C0 00EA 00FE 009E
        DECLE   $008E,  $00C6,  $00E2,  $00F0   ; 635B   008E 00C6 00E2 00F0
        DECLE   $0078,  $00FC,  $00DC,  $00CC   ; 635F   0078 00FC 00DC 00CC
        DECLE   $00EC,  $00FC,  $0078,  $0088   ; 6363   00EC 00FC 0078 0088
        DECLE   $0072,  $00FE,  $00CC,  $008E   ; 6367   0072 00FE 00CC 008E
        DECLE   $00C3,  $00E1,  $00F0,  $00F8   ; 636B   00C3 00E1 00F0 00F8
        DECLE   $00BC,  $00DC,  $00DC,  $00FC   ; 636F   00BC 00DC 00DC 00FC
        DECLE   $00FC,  $00F8,  $0070,  $0040   ; 6373   00FC 00F8 0070 0040
        DECLE   $0010,  $00E0,  $00FA,  $008E   ; 6377   0010 00E0 00FA 008E
        DECLE   $008C,  $00C6,  $00E3,  $0071   ; 637B   008C 00C6 00E3 0071
        DECLE   $0038,  $001C,  $008E,  $00CE   ; 637F   0038 001C 008E 00CE
        DECLE   $00CE,  $00FE,  $007C,  $0000   ; 6383   00CE 00FE 007C 0000
        DECLE   $0040,  $0010,  $00E0,  $00FA   ; 6387   0040 0010 00E0 00FA
        DECLE   $009E,  $008C,  $00CE,  $00E3   ; 638B   009E 008C 00CE 00E3
        DECLE   $0071,  $0038,  $001C,  $008E   ; 638F   0071 0038 001C 008E
        DECLE   $00CE,  $00FE,  $00FC,  $0000   ; 6393   00CE 00FE 00FC 0000
        DECLE   $0000,  $0000,  $0000,  $0090   ; 6397   0000 0000 0000 0090
        DECLE   $0000                           ; 639B   0000

        ADDR    R6,     R2                      ; 639C   00F2
        MOVR    R7,     R6                      ; 639D   00BE
        MOVR    R1,     R4                      ; 639E   008C
        ADDR    R4,     R6                      ; 639F   00E6
        SARC    R3,     1                       ; 63A0   007B
        RSWD    R5                              ; 63A1   003D
        MOVR    R1,     R6                      ; 63A2   008E
        ADDR    R0,     R7                      ; 63A3   00C7

        DECLE   $00FF,  $003E,  $0000,  $0000   ; 63A4   00FF 003E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63A8   0000 0000 0000 0000
        DECLE   $0020,  $00C0,  $00F2,  $00DE   ; 63AC   0020 00C0 00F2 00DE
        DECLE   $00EC,  $00FE,  $00BF,  $00DF   ; 63B0   00EC 00FE 00BF 00DF
        DECLE   $00FF,  $007E,  $0000,  $0000   ; 63B4   00FF 007E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0020   ; 63BC   0000 0000 0080 0020
        DECLE   $00C4,  $00FE,  $00FC,  $00FE   ; 63C0   00C4 00FE 00FC 00FE
        DECLE   $00FF,  $00FD,  $0000,  $0000   ; 63C4   00FF 00FD 0000 0000
        DECLE   $0002,  $0000,  $0000,  $000A   ; 63C8   0002 0000 0000 000A
        DECLE   $0020,  $000E,  $005F,  $003F   ; 63CC   0020 000E 005F 003F
        DECLE   $00B3,  $0061,  $00C1,  $0080   ; 63D0   00B3 0061 00C1 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 63D8   0000 0000 0000 0001
        DECLE   $0000                           ; 63DC   0000

        NEGR    R0                              ; 63DD   0020
        MOVR    R0,     R4                      ; 63DE   0084
        SARC    R1,     1                       ; 63DF   0079
        ADDR    R7,     R6                      ; 63E0   00FE
        ADDR    R1,     R7                      ; 63E1   00CF

        DECLE   $0067,  $0063,  $00C1,  $0000   ; 63E2   0067 0063 00C1 0000
        DECLE   $0002,  $0000,  $0001,  $0005   ; 63E6   0002 0000 0001 0005
        DECLE   $0001,  $0001,  $0009,  $0022   ; 63EA   0001 0001 0009 0022
        DECLE   $001C,  $00BE,  $007F,  $0067   ; 63EE   001C 00BE 007F 0067
        DECLE   $0043,  $00C1,  $0081,  $0000   ; 63F2   0043 00C1 0081 0000
        DECLE   $0001,  $0000,  $0005,  $0003   ; 63F6   0001 0000 0005 0003
        DECLE   $000B,  $0003,  $0013,  $000D   ; 63FA   000B 0003 0013 000D
        DECLE   $001E,  $005F,  $003B,  $00B3   ; 63FE   001E 005F 003B 00B3
        DECLE   $0071,  $00E1,  $0080,  $0000   ; 6402   0071 00E1 0080 0000
        DECLE   $0001,  $0000,  $0005,  $0001   ; 6406   0001 0000 0005 0001
        DECLE   $0001,  $0005                   ; 640A   0001 0005

        DIS                                     ; 640C   0003
L_640D:
        DECR    R7                              ; 640D   0017
        INCR    R7                              ; 640E   000F

        INCR    R6                              ; 640F   000E
L_6410:
        ADCR    R4                              ; 6410   002C
        DECLE   $001D,  $0099,  $0071,  $00C0   ; 6411   001D 0099 0071 00C0
        DECLE   $0000,  $0000,  $0002,  $0000   ; 6415   0000 0000 0002 0000
        DECLE   $0001,  $0001,  $0015,  $0001   ; 6419   0001 0001 0015 0001
        DECLE   $002E,  $001F,  $005B,  $0039   ; 641D   002E 001F 005B 0039
        DECLE   $0031,  $00B0,  $0060,  $00C0   ; 6421   0031 00B0 0060 00C0
        DECLE   $0000,  $0000,  $0002,  $0000   ; 6425   0000 0000 0002 0000
        DECLE   $0001,  $0005,  $0001,  $0009   ; 6429   0001 0005 0001 0009
        DECLE   $0022,  $001C,  $00BE,  $0077   ; 642D   0022 001C 00BE 0077
        DECLE   $0063,  $0061,  $00E1,  $00C0   ; 6431   0063 0061 00E1 00C0
        DECLE   $0080,  $0000,  $0000,  $0002   ; 6435   0080 0000 0000 0002
        DECLE   $0000,  $0005,  $0001,  $0001   ; 6439   0000 0005 0001 0001
        DECLE   $0015,  $0040,  $003C,  $007E   ; 643D   0015 0040 003C 007E
        DECLE   $007F,  $0077,  $0033,  $0071   ; 6441   007F 0077 0033 0071
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 6445   00E0 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0080   ; 6449   0000 0000 0002 0080
        DECLE   $0005,  $0021,  $008D,  $005F   ; 644D   0005 0021 008D 005F
        DECLE   $007F,  $00B3,  $0039,  $001C   ; 6451   007F 00B3 0039 001C
        DECLE   $00FC,  $0000,  $0000,  $0000   ; 6455   00FC 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6459   0000 0000 0000 0000
        DECLE   $0002,  $0009,  $0041,  $001F   ; 645D   0002 0009 0041 001F
        DECLE   $00BF,  $00FF,  $00FB,  $007D   ; 6461   00BF 00FF 00FB 007D
        DECLE   $00FC,  $0000,  $0000,  $0000   ; 6465   00FC 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6469   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0023   ; 646D   0000 0000 0004 0023
        DECLE   $001F,  $003F,  $007F,  $00FF   ; 6471   001F 003F 007F 00FF
        DECLE   $00FD,  $0000,  $0000,  $0041   ; 6475   00FD 0000 0000 0041
        DECLE   $001C,  $0022,  $0041,  $0041   ; 6479   001C 0022 0041 0041
        DECLE   $0041,  $0041,  $0041,  $0052   ; 647D   0041 0041 0041 0052
        DECLE   $004C,  $0040,  $0020,  $0013   ; 6481   004C 0040 0020 0013
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6485   000C 0000 0000 0000
        DECLE   $0082,  $0038,  $0044,  $0082   ; 6489   0082 0038 0044 0082
        DECLE   $0082,  $0082,  $0082,  $0084   ; 648D   0082 0082 0082 0084
        DECLE   $0080,  $0080,  $0040,  $0021   ; 6491   0080 0080 0040 0021
        DECLE   $001E,  $0000,  $0000,  $0000   ; 6495   001E 0000 0000 0000
        DECLE   $0020,  $0000,  $009E,  $0021   ; 6499   0020 0000 009E 0021
        DECLE   $0040,  $0080,  $0080,  $0080   ; 649D   0040 0080 0080 0080
        DECLE   $0080,  $0040,  $0030,  $000F   ; 64A1   0080 0040 0030 000F
        DECLE   $0000,  $0000,  $0000,  $0002   ; 64A5   0000 0000 0000 0002
        DECLE   $0012,  $0004,  $0098,  $0020   ; 64A9   0012 0004 0098 0020
        DECLE   $0040,  $0040,  $0040,  $0040   ; 64AD   0040 0040 0040 0040
        DECLE   $0040,  $0020,  $0018,  $0007   ; 64B1   0040 0020 0018 0007
        DECLE   $0000,  $000C,  $0012,  $0001   ; 64B5   0000 000C 0012 0001
        DECLE   $0001,  $0002,  $004C,  $0011   ; 64B9   0001 0002 004C 0011
        DECLE   $0020,  $0020,  $0020,  $0020   ; 64BD   0020 0020 0020 0020
        DECLE   $0010,  $000C,  $0006,  $0003   ; 64C1   0010 000C 0006 0003
        DECLE   $0000,  $0039,  $0044,  $0082   ; 64C5   0000 0039 0044 0082
        DECLE   $0082,  $0082,  $0082,  $0044   ; 64C9   0082 0082 0082 0044
        DECLE   $0008,  $0008,  $0010,  $0010   ; 64CD   0008 0008 0010 0010
        DECLE   $0010,  $0010,  $000C,  $0007   ; 64D1   0010 0010 000C 0007
        DECLE   $0000,  $0000,  $0000,  $0000   ; 64D5   0000 0000 0000 0000
        DECLE   $0000,  $001C,  $0022,  $0041   ; 64D9   0000 001C 0022 0041
        DECLE   $0041,  $0041,  $0002,  $000C   ; 64DD   0041 0041 0002 000C
        DECLE   $0010,  $0000,  $0010,  $0009   ; 64E1   0010 0000 0010 0009
        DECLE   $0007,  $0000,  $0000,  $0000   ; 64E5   0007 0000 0000 0000
        DECLE   $0000,  $0022,  $0000,  $001C   ; 64E9   0000 0022 0000 001C
        DECLE   $0022,  $0041,  $0001,  $0001   ; 64ED   0022 0041 0001 0001
        DECLE   $000E,  $0010,  $0010,  $0008   ; 64F1   000E 0010 0010 0008
        DECLE   $0007,  $0000,  $0000,  $0000   ; 64F5   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 64F9   0000 0000 0000 0008
        DECLE   $0000,  $0007,  $0008,  $0010   ; 64FD   0000 0007 0008 0010
        DECLE   $0010,  $0000,  $0003,  $0004   ; 6501   0010 0000 0003 0004
        DECLE   $0003,  $0000,  $0000,  $0000   ; 6505   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6509   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0007   ; 650D   0000 0000 0008 0007
        DECLE   $0008,  $0010,  $0001,  $0013   ; 6511   0008 0010 0001 0013
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6515   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6519   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 651D   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0005,  $0083   ; 6521   0001 0000 0005 0083
        DECLE   $0057,  $0000,  $0000,  $0000   ; 6525   0057 0000 0000 0000
        DECLE   $0000,  $0004,  $0002,  $0000   ; 6529   0000 0004 0002 0000
        DECLE   $0002,  $0084,  $0040,  $0010   ; 652D   0002 0084 0040 0010
        DECLE   $0040,  $0014,  $0000,  $0004   ; 6531   0040 0014 0000 0004
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6535   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6539   0000 0000 0000 0000
        DECLE   $0000,  $0042,  $0028,  $0002   ; 653D   0000 0042 0028 0002
        DECLE   $0008,  $0000,  $0000,  $0002   ; 6541   0008 0000 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6545   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0001,  $0000   ; 6549   0000 0002 0001 0000
        DECLE   $0081,  $0022,  $0008,  $0014   ; 654D   0081 0022 0008 0014
        DECLE   $0001,  $0008,  $0004,  $0004   ; 6551   0001 0008 0004 0004
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6555   0008 0000 0000 0000
        DECLE   $0004,  $0001,  $0000,  $0001   ; 6559   0004 0001 0000 0001
        DECLE   $0020,  $008A,  $0004,  $0001   ; 655D   0020 008A 0004 0001
        DECLE   $0002,  $0000                   ; 6561   0002 0000

        NEGR    R2                              ; 6563   0022

        JSRE    R4,     X_RESET                 ; 6564   0004 0011 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 6567   0000 0000 0000 0010
        DECLE   $0038,  $0038,  $002C,  $0074   ; 656B   0038 0038 002C 0074
        DECLE   $007C,  $0074,  $006C,  $007C   ; 656F   007C 0074 006C 007C
        DECLE   $006C,  $0076,  $003E,  $0000   ; 6573   006C 0076 003E 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6577   0000 0000 0000 0008
        DECLE   $000C,  $001E,  $001E,  $0016   ; 657B   000C 001E 001E 0016
        DECLE   $003E,  $0036,  $002E,  $003E   ; 657F   003E 0036 002E 003E
        DECLE   $002E,  $0036,  $001E,  $0000   ; 6583   002E 0036 001E 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6587   0000 0000 0000 0008
        DECLE   $001C,  $001C,  $001E,  $0036   ; 658B   001C 001C 001E 0036
        DECLE   $003E,  $0036,  $003E,  $002E   ; 658F   003E 0036 003E 002E
        DECLE   $003E,  $002E,  $003C,  $0000   ; 6593   003E 002E 003C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6597   0000 0000 0000 0000
        DECLE   $0010,  $0038,  $0028,  $003C   ; 659B   0010 0038 0028 003C
        DECLE   $002C,  $0034,  $003C,  $0036   ; 659F   002C 0034 003C 0036
        DECLE   $003E,  $0036,  $001E,  $0000   ; 65A3   003E 0036 001E 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 65A7   0000 0000 0000 0010
        DECLE   $0038,  $0038,  $0028,  $0078   ; 65AB   0038 0038 0028 0078
        DECLE   $006C,  $007C,  $006E,  $0076   ; 65AF   006C 007C 006E 0076
        DECLE   $003E,  $0036,  $001E,  $0000   ; 65B3   003E 0036 001E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65B7   0000 0000 0000 0000
        DECLE   $0030,  $0078,  $0068,  $0078   ; 65BB   0030 0078 0068 0078
        DECLE   $0068,  $007C,  $006C,  $0074   ; 65BF   0068 007C 006C 0074
        DECLE   $007C,  $0074,  $003C,  $0000   ; 65C3   007C 0074 003C 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 65C7   0000 0000 0008 001C
        DECLE   $0014,  $001E,  $0016,  $003E   ; 65CB   0014 001E 0016 003E
        DECLE   $003A,  $003E,  $003A,  $003E   ; 65CF   003A 003E 003A 003E
        DECLE   $0036,  $006E,  $0074,  $0000   ; 65D3   0036 006E 0074 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 65D7   0000 0000 0000 0004
        DECLE   $000E,  $000E,  $001B,  $001D   ; 65DB   000E 000E 001B 001D
        DECLE   $003F,  $003D,  $003B,  $0037   ; 65DF   003F 003D 003B 0037
        DECLE   $003F,  $002E,  $0034,  $0000   ; 65E3   003F 002E 0034 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65E7   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $000F,  $001D   ; 65EB   0000 0002 000F 001D
        DECLE   $003F,  $003D,  $007B,  $0077   ; 65EF   003F 003D 007B 0077
        DECLE   $007F,  $006F,  $0036,  $0000   ; 65F3   007F 006F 0036 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 65F7   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $000A,  $001F   ; 65FB   0000 0004 000A 001F
        DECLE   $001B,  $0037,  $003F,  $0077   ; 65FF   001B 0037 003F 0077
        DECLE   $007F,  $006F,  $0036,  $0000   ; 6603   007F 006F 0036 0000
        DECLE   $0000,  $0000,  $0004,  $0000   ; 6607   0000 0000 0004 0000
        DECLE   $0015,  $000E,  $001B,  $003D   ; 660B   0015 000E 001B 003D
        DECLE   $003F,  $003D,  $007B,  $007F   ; 660F   003F 003D 007B 007F
        DECLE   $00F3,  $00AE,  $00B3,  $0050   ; 6613   00F3 00AE 00B3 0050
        DECLE   $0078,  $007A,  $007C,  $006C   ; 6617   0078 007A 007C 006C
        DECLE   $004C,  $000C,  $001C,  $001C   ; 661B   004C 000C 001C 001C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 661F   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $0040   ; 6623   003C 003C 0018 0040
        DECLE   $007A,  $003C,  $006D,  $00CE   ; 6627   007A 003C 006D 00CE
        DECLE   $008E,  $000E,  $001E,  $001E   ; 662B   008E 000E 001E 001E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 662F   001E 001E 001E 001E
        DECLE   $001E,  $001E,  $000C,  $0050   ; 6633   001E 001E 000C 0050
        DECLE   $0078,  $007A,  $007C,  $006C   ; 6637   0078 007A 007C 006C
        DECLE   $004C,  $000D,  $001E,  $001E   ; 663B   004C 000D 001E 001E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 663F   001E 001E 001E 001E
        DECLE   $001E,  $001E,  $000C,  $0054   ; 6643   001E 001E 000C 0054
        DECLE   $003C,  $003C,  $003C,  $002C   ; 6647   003C 003C 003C 002C
        DECLE   $00B4,  $0030,  $0038,  $003C   ; 664B   00B4 0030 0038 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 664F   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $0000   ; 6653   003C 003C 0018 0000
        DECLE   $002A,  $001E,  $001C,  $0056   ; 6657   002A 001E 001C 0056
        DECLE   $0033,  $0031,  $0030,  $0038   ; 665B   0033 0031 0030 0038
        DECLE   $0038,  $003C,  $003C,  $003C   ; 665F   0038 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $002A   ; 6663   003C 003C 0018 002A
        DECLE   $001E,  $005E,  $003E,  $0036   ; 6667   001E 005E 003E 0036
        DECLE   $00B2,  $0078,  $0078,  $0078   ; 666B   00B2 0078 0078 0078
        DECLE   $0078,  $0078,  $0078,  $0078   ; 666F   0078 0078 0078 0078
        DECLE   $0078,  $0078,  $0030,  $0044   ; 6673   0078 0078 0030 0044
        DECLE   $0078,  $003A,  $006C,  $00CC   ; 6677   0078 003A 006C 00CC
        DECLE   $008D,  $000E,  $001E,  $001E   ; 667B   008D 000E 001E 001E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 667F   001E 001E 001E 001E
        DECLE   $001E,  $001E,  $000C,  $0012   ; 6683   001E 001E 000C 0012
        DECLE   $000C,  $005D,  $0076,  $0026   ; 6687   000C 005D 0076 0026
        DECLE   $0066,  $00CE,  $008E,  $000E   ; 668B   0066 00CE 008E 000E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 668F   001E 001E 001E 001E
        DECLE   $001E,  $001E,  $001C,  $0000   ; 6693   001E 001E 001C 0000

        JSR     R4,     .EXEC.00D               ; 6697   0004 0010 000D
        DECLE   $005E,  $007F,  $0027           ; 669A   005E 007F 0027

        SLR     R3,     2                       ; 669D   0067
        ADDR    R1,     R7                      ; 669E   00CF
        MOVR    R1,     R7                      ; 669F   008F

        DECLE   $000F,  $001F,  $001F,  $001F   ; 66A0   000F 001F 001F 001F
        DECLE   $001F,  $000E,  $0000,  $0000   ; 66A4   001F 000E 0000 0000
        DECLE   $0000,  $0004,  $0010,  $0005   ; 66A8   0000 0004 0010 0005
        DECLE   $005E,  $007F,  $0027           ; 66AC   005E 007F 0027

        SLR     R3,     2                       ; 66AF   0067
        ADDR    R1,     R7                      ; 66B0   00CF
        MOVR    R1,     R7                      ; 66B1   008F

        DECLE   $001F,  $001F,  $001F,  $001F   ; 66B2   001F 001F 001F 001F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66B6   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0000           ; 66BA   0000 0004 0000

        DECR    R5                              ; 66BD   0015
        INCR    R6                              ; 66BE   000E
        INCR    R7                              ; 66BF   000F

        SLLC    R3,     2                       ; 66C0   005F
L_66C1:
        SARC    R3,     2                       ; 66C1   007F
        DECLE   $003F,  $006F,  $00DE,  $00BE   ; 66C2   003F 006F 00DE 00BE
        DECLE   $0000,  $0000,  $0000,  $0020   ; 66C6   0000 0000 0000 0020
        DECLE   $0040,  $0080,  $0092,  $008C   ; 66CA   0040 0080 0092 008C
        DECLE   $005E,  $0032,  $0023,  $0031   ; 66CE   005E 0032 0023 0031
        DECLE   $00BB,  $007E,  $0074,  $0078   ; 66D2   00BB 007E 0074 0078
        DECLE   $0000,  $0000,  $0000,  $0000   ; 66D6   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $004D,  $009E   ; 66DA   0000 0010 004D 009E
        DECLE   $0093,  $00B1,  $00B1,  $00B1   ; 66DE   0093 00B1 00B1 00B1
        DECLE   $007B,  $003E,  $003D,  $005C   ; 66E2   007B 003E 003D 005C
        DECLE   $0000,  $0000,  $0000,  $0012   ; 66E6   0000 0000 0000 0012
        DECLE   $000C,  $001E,  $0033,  $0021   ; 66EA   000C 001E 0033 0021
        DECLE   $00A1,  $0031,  $00B1,  $0071   ; 66EE   00A1 0031 00B1 0071
        DECLE   $003B,  $003E,  $001D,  $001E   ; 66F2   003B 003E 001D 001E
        DECLE   $00B8,  $0044,  $00C2,  $0082   ; 66F6   00B8 0044 00C2 0082
        DECLE   $0082,  $0082,  $0082,  $00C4   ; 66FA   0082 0082 0082 00C4
        DECLE   $00D4,  $00E0,  $0060,  $0070   ; 66FE   00D4 00E0 0060 0070
        DECLE   $0070,  $0074,  $0078,  $0078   ; 6702   0070 0074 0078 0078
        DECLE   $0000,  $00B8,  $0044,  $0042   ; 6706   0000 00B8 0044 0042
        DECLE   $0062,  $0070,  $00B0,  $0018   ; 670A   0062 0070 00B0 0018
        DECLE   $001C,  $002D,  $000E,  $005E   ; 670E   001C 002D 000E 005E
        DECLE   $003E,  $003C,  $007C,  $0078   ; 6712   003E 003C 007C 0078
        DECLE   $0000,  $0000,  $0000,  $0030   ; 6716   0000 0000 0000 0030
        DECLE   $0048,  $0084,  $0080,  $0084   ; 671A   0048 0084 0080 0084
        DECLE   $00C8,  $007C,  $003D,  $000E   ; 671E   00C8 007C 003D 000E
        DECLE   $000E,  $002E,  $001E,  $001E   ; 6722   000E 002E 001E 001E
        DECLE   $0000,  $0000,  $0000,  $0012   ; 6726   0000 0000 0000 0012
        DECLE   $000C,  $0052,  $0031,  $0021   ; 672A   000C 0052 0031 0021
        DECLE   $0021,  $0031,  $0031,  $0031   ; 672E   0021 0031 0031 0031
        DECLE   $003A,  $005C,  $001C,  $001E   ; 6732   003A 005C 001C 001E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6736   0000 0000 0000 0000
        DECLE   $0000,  $0022,  $001C,  $00A2   ; 673A   0000 0022 001C 00A2
        DECLE   $0041,  $0041,  $0042,  $0060   ; 673E   0041 0041 0042 0060
        DECLE   $0078,  $0078,  $00BC,  $001C   ; 6742   0078 0078 00BC 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6746   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 674A   0000 0000 0000 0020
        DECLE   $0018,  $00A4,  $0042,  $0080   ; 674E   0018 00A4 0042 0080
        DECLE   $0080,  $00C0,  $00F2,  $007C   ; 6752   0080 00C0 00F2 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6756   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 675A   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0006,  $00B9   ; 675E   0000 0008 0006 00B9
        DECLE   $0040,  $00C0,  $00F2,  $007C   ; 6762   0040 00C0 00F2 007C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6766   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 676E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $004C,  $00B2   ; 6772   0000 0000 004C 00B2
        DECLE   $002C,  $0006,  $0054,  $0002   ; 6776   002C 0006 0054 0002
        DECLE   $0012,  $0032,  $0032,  $0022   ; 677A   0012 0032 0032 0022
        DECLE   $0022,  $0042,  $0042,  $0042   ; 677E   0022 0042 0042 0042
        DECLE   $0042,  $0040,  $00C0,  $0026   ; 6782   0042 0040 00C0 0026
        DECLE   $0019,  $0004,  $0002,  $0002   ; 6786   0019 0004 0002 0002
        DECLE   $0002,  $0001,  $0001,  $0011   ; 678A   0002 0001 0001 0011
        DECLE   $0001,  $0021,  $0021,  $0021   ; 678E   0001 0021 0021 0021
        DECLE   $0021,  $0060,  $0000,  $0003   ; 6792   0021 0060 0000 0003
        DECLE   $002E,  $0006,  $0055,  $0007   ; 6796   002E 0006 0055 0007
        DECLE   $0007,  $0003,  $0012,  $0031   ; 679A   0007 0003 0012 0031
        DECLE   $0021,  $0021,  $0021,  $0021   ; 679E   0021 0021 0021 0021
        DECLE   $0021,  $0020,  $0000,  $0063   ; 67A2   0021 0020 0000 0063
        DECLE   $0028,  $0040,  $0054,  $0040   ; 67A6   0028 0040 0054 0040
        DECLE   $0050,  $0048,  $0048,  $0040   ; 67AA   0050 0048 0048 0040
        DECLE   $0040,  $0040,  $0040,  $0040   ; 67AE   0040 0040 0040 0040
        DECLE   $0040,  $0000,  $0000,  $00C3   ; 67B2   0040 0000 0000 00C3
        DECLE   $0078,  $0050,  $0060,  $0068   ; 67B6   0078 0050 0060 0068
        DECLE   $0028,  $0048,  $0048,  $004C   ; 67BA   0028 0048 0048 004C
        DECLE   $0046,  $0046,  $0042,  $0042   ; 67BE   0046 0046 0042 0042
        DECLE   $0042,  $0003,  $0000,  $00C0   ; 67C2   0042 0003 0000 00C0
        DECLE   $0014,  $0020,  $002A,  $0040   ; 67C6   0014 0020 002A 0040
        DECLE   $0048,  $004C,  $00CC,  $0084   ; 67CA   0048 004C 00CC 0084
        DECLE   $0084,  $0084,  $0084,  $0084   ; 67CE   0084 0084 0084 0084
        DECLE   $0084,  $0084,  $0000,  $00C6   ; 67D2   0084 0084 0000 00C6
        DECLE   $003A,  $0006,  $0004,  $0013   ; 67D6   003A 0006 0004 0013
        DECLE   $0013,  $0012,  $0011,  $0011   ; 67DA   0013 0012 0011 0011
        DECLE   $0001,  $0021,  $0021,  $0021   ; 67DE   0001 0021 0021 0021
        DECLE   $0021,  $0020,  $0000,  $0033   ; 67E2   0021 0020 0000 0033
        DECLE   $000C,  $0013,  $0002,  $0009   ; 67E6   000C 0013 0002 0009
        DECLE   $0019,  $0019,  $0011,  $0011   ; 67EA   0019 0019 0011 0011
        DECLE   $0011,  $0021,  $0021,  $0021   ; 67EE   0011 0021 0021 0021
        DECLE   $0021,  $0021,  $0020,  $0063   ; 67F2   0021 0021 0020 0063
        DECLE   $003E,  $005A,  $000F,  $0002   ; 67F6   003E 005A 000F 0002
        DECLE   $0001,  $0001                   ; 67FA   0001 0001

        COMR    R0                              ; 67FC   0018
        COMR    R0                              ; 67FD   0018
        DECR    R0                              ; 67FE   0010
        DECR    R0                              ; 67FF   0010
L_6800:
        DECR    R0                              ; 6800   0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6801   0000 0000 0000 0000
        DECLE   $0031,  $009E,  $002E,  $000F   ; 6805   0031 009E 002E 000F
        DECLE   $001B,  $000F,  $001A,  $0001   ; 6809   001B 000F 001A 0001
        DECLE   $0000,  $0018,  $0018,  $0010   ; 680D   0000 0018 0018 0010
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6811   0010 0000 0000 0000
        DECLE   $0031,  $0080,  $004C,  $005E   ; 6815   0031 0080 004C 005E
        DECLE   $007E,  $00B6,  $000B,  $001F   ; 6819   007E 00B6 000B 001F
        DECLE   $002A,  $0031,  $0071,  $0020   ; 681D   002A 0031 0071 0020
        DECLE   $0000,  $0000,  $0010,  $0021   ; 6821   0000 0000 0010 0021
        DECLE   $0021,  $0008,  $0040,  $0020   ; 6825   0021 0008 0040 0020
        DECLE   $0010,  $000E,  $000E,  $000E   ; 6829   0010 000E 000E 000E
        DECLE   $000E,  $000E,  $000E,  $000E   ; 682D   000E 000E 000E 000E
        DECLE   $000E,  $0006,  $0002,  $0000   ; 6831   000E 0006 0002 0000
        DECLE   $0000,  $0000,  $0080,  $0040   ; 6835   0000 0000 0080 0040
        DECLE   $0020,  $0010,  $0007,  $0007   ; 6839   0020 0010 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 683D   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0007,  $0003   ; 6841   0007 0007 0007 0003
        DECLE   $0000,  $0011,  $0021,  $0001   ; 6845   0000 0011 0021 0001
        DECLE   $0001,  $003D,  $003D,  $003D   ; 6849   0001 003D 003D 003D
        DECLE   $003C,  $003C,  $003C,  $003C   ; 684D   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $0000   ; 6851   003C 003C 0018 0000
        DECLE   $0000,  $0010,  $0020,  $0000   ; 6855   0000 0010 0020 0000
        DECLE   $0001,  $003E,  $003C,  $003C   ; 6859   0001 003E 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 685D   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $0018,  $0000   ; 6861   003C 003C 0018 0000
        DECLE   $0000,  $0010,  $0020,  $0000   ; 6865   0000 0010 0020 0000
        DECLE   $0000,  $001E,  $001E,  $005F   ; 6869   0000 001E 001E 005F
        DECLE   $001E,  $001E,  $001E,  $001E   ; 686D   001E 001E 001E 001E
        DECLE   $001E,  $001E,  $000C,  $0000   ; 6871   001E 001E 000C 0000
        DECLE   $0000,  $0002,  $0004,  $0008   ; 6875   0000 0002 0004 0008
        DECLE   $0010,  $0020,  $004E,  $000E   ; 6879   0010 0020 004E 000E
        DECLE   $000E,  $000E,  $000E,  $000E   ; 687D   000E 000E 000E 000E
        DECLE   $000E,  $000E,  $000E,  $0006   ; 6881   000E 000E 000E 0006
        DECLE   $0002,  $0002,  $0006,  $0004   ; 6885   0002 0002 0006 0004
        DECLE   $0006,  $000C,  $001C,  $001E   ; 6889   0006 000C 001C 001E
        DECLE   $001E,  $000C,  $001C,  $001C   ; 688D   001E 000C 001C 001C
        DECLE   $0034,  $0064,  $0044,  $0044   ; 6891   0034 0064 0044 0044
        DECLE   $0006,  $0001,  $0003,  $0002   ; 6895   0006 0001 0003 0002
        DECLE   $0003,  $0006,  $000E,  $000E   ; 6899   0003 0006 000E 000E
        DECLE   $000E,  $000E,  $0006,  $0006   ; 689D   000E 000E 0006 0006
        DECLE   $001E,  $001E,  $0014,  $0014   ; 68A1   001E 001E 0014 0014
        DECLE   $0006,  $0004,  $000C,  $0008   ; 68A5   0006 0004 000C 0008
        DECLE   $000C,  $0018,  $0018,  $003F   ; 68A9   000C 0018 0018 003F
        DECLE   $003E,  $0018,  $0038,  $003C   ; 68AD   003E 0018 0038 003C
        DECLE   $002C,  $0024,  $002C,  $0028   ; 68B1   002C 0024 002C 0028
        DECLE   $0030,  $0004,  $000C,  $0008   ; 68B5   0030 0004 000C 0008
        DECLE   $000C,  $0018,  $0038,  $0078   ; 68B9   000C 0018 0038 0078
        DECLE   $0078,  $0038,  $001C,  $003E   ; 68BD   0078 0038 001C 003E
        DECLE   $0036,  $006C,  $0068,  $0048   ; 68C1   0036 006C 0068 0048
        DECLE   $0040,  $0004,  $000C,  $0008   ; 68C5   0040 0004 000C 0008
        DECLE   $007C,  $0078,  $0058,  $0020   ; 68C9   007C 0078 0058 0020
        DECLE   $0038,  $0018,  $001F,  $003F   ; 68CD   0038 0018 001F 003F
        DECLE   $0031,  $0062,  $00E2,  $0082   ; 68D1   0031 0062 00E2 0082
        DECLE   $0080,  $0000,  $0004,  $000C   ; 68D5   0080 0000 0004 000C
        DECLE   $0008,  $000C,  $0018,  $0078   ; 68D9   0008 000C 0018 0078
        DECLE   $0038,  $0018,  $001C,  $003E   ; 68DD   0038 0018 001C 003E
        DECLE   $0036,  $0062,  $00C2,  $0083   ; 68E1   0036 0062 00C2 0083
        DECLE   $0080,  $0002,  $0006,  $0004   ; 68E5   0080 0002 0006 0004
        DECLE   $0006,  $000C,  $001C,  $001E   ; 68E9   0006 000C 001C 001E
        DECLE   $001E,  $001C,  $000C,  $001C   ; 68ED   001E 001C 000C 001C
        DECLE   $001C,  $0034,  $0064,  $0044   ; 68F1   001C 0034 0064 0044
        DECLE   $0046,  $0000,  $0000,  $0002   ; 68F5   0046 0000 0000 0002
        DECLE   $0006,  $0004,  $000E,  $000C   ; 68F9   0006 0004 000E 000C
        DECLE   $001C,  $001C,  $001C,  $001C   ; 68FD   001C 001C 001C 001C
        DECLE   $001C,  $0034,  $0034,  $0024   ; 6901   001C 0034 0034 0024
        DECLE   $0026,  $0000,  $0000,  $0000   ; 6905   0026 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 6909   0000 0000 0001 0003
        DECLE   $0002,  $0007,  $000E,  $000E   ; 690D   0002 0007 000E 000E
        DECLE   $001E,  $001E,  $003E,  $003E   ; 6911   001E 001E 003E 003E
        DECLE   $0073,  $0000,  $0000,  $0000   ; 6915   0073 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6919   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0003,  $000E   ; 691D   0000 0001 0003 000E
        DECLE   $001F,  $003E,  $0036,  $0072   ; 6921   001F 003E 0036 0072
        DECLE   $00F1,  $0000,  $0000,  $0000   ; 6925   00F1 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6929   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 692D   0000 0000 0000 0001
        DECLE   $001F,  $003E,  $003F,  $0076   ; 6931   001F 003E 003F 0076
        DECLE   $00F3,  $0000,  $0000,  $0000   ; 6935   00F3 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6939   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 693D   0000 0000 0000 0000
        DECLE   $0000,  $0038,  $007C,  $00FE   ; 6941   0000 0038 007C 00FE
        DECLE   $00FD,  $0008,  $0010,  $0000   ; 6945   00FD 0008 0010 0000
        DECLE   $0040,  $0020,  $0010,  $0006   ; 6949   0040 0020 0010 0006
        DECLE   $0006,  $0006,  $0006,  $0006   ; 694D   0006 0006 0006 0006
        DECLE   $0006,  $0006,  $0006,  $0006   ; 6951   0006 0006 0006 0006
        DECLE   $0002,  $0000,  $0000,  $0008   ; 6955   0002 0000 0000 0008
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6959   0010 0000 0000 0000
        DECLE   $0061,  $0003,  $0006,  $000C   ; 695D   0061 0003 0006 000C
        DECLE   $0018,  $0030,  $0020,  $0000   ; 6961   0018 0030 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6965   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0008   ; 6969   0000 0000 0004 0008
        DECLE   $0000,  $0000,  $0000,  $0071   ; 696D   0000 0000 0000 0071
        DECLE   $0003,  $0006,  $000C,  $0018   ; 6971   0003 0006 000C 0018
        DECLE   $0030,  $0000,  $0000,  $0000   ; 6975   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6979   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0008,  $0000   ; 697D   0000 0004 0008 0000
        DECLE   $0000,  $00C0,  $0000,  $000F   ; 6981   0000 00C0 0000 000F
        DECLE   $003C,  $0000,  $0000,  $0000   ; 6985   003C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6989   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0004   ; 698D   0000 0000 0002 0004
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 6991   0000 0000 0000 00C0
        DECLE   $003E,  $0000,  $0000,  $0000   ; 6995   003E 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6999   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 699D   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0001,  $0000   ; 69A1   0000 0002 0001 0000
        DECLE   $0078,  $0014,  $0000,  $001C   ; 69A5   0078 0014 0000 001C
        DECLE   $0014,  $0007,  $0007,  $0007   ; 69A9   0014 0007 0007 0007
        DECLE   $000F                           ; 69AD   000F
L_69AE:
        DECR    R7                              ; 69AE   0017

        DECLE   $0027,  $0007,  $0007,  $0007   ; 69AF   0027 0007 0007 0007
        DECLE   $0003,  $0000,  $0000,  $0048   ; 69B3   0003 0000 0000 0048
        DECLE   $0054,  $0040,  $005C,  $0054   ; 69B7   0054 0040 005C 0054
        DECLE   $0040,  $0043,  $0043,  $0043   ; 69BB   0040 0043 0043 0043
        DECLE   $0003,  $0003,  $0003,  $0003   ; 69BF   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0001,  $0014   ; 69C3   0003 0003 0001 0014
        DECLE   $0000,  $009C,  $0054,  $0023   ; 69C7   0000 009C 0054 0023
        DECLE   $0013,  $000B,  $0003,  $0003   ; 69CB   0013 000B 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 69CF   0003 0003 0003 0003
        DECLE   $0001,  $0000,  $0000,  $0014   ; 69D3   0001 0000 0000 0014
        DECLE   $0000,  $001C,  $0014,  $0001   ; 69D7   0000 001C 0014 0001
        DECLE   $0001,  $0001,  $00F9,  $0001   ; 69DB   0001 0001 00F9 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 69DF   0001 0001 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0008   ; 69E3   0001 0000 0000 0008
        DECLE   $0014,  $0000,  $001C,  $0014   ; 69E7   0014 0000 001C 0014
        DECLE   $0001,  $0001,  $0001,  $0001   ; 69EB   0001 0001 0001 0001
        DECLE   $0009,  $0011,  $0021,  $0041   ; 69EF   0009 0011 0021 0041
        DECLE   $0081,  $0001,  $0000,  $0014   ; 69F3   0081 0001 0000 0014
        DECLE   $0000                           ; 69F7   0000

        COMR    R4                              ; 69F8   001C
L_69F9:
        DECR    R7                              ; 69F9   0017

        SETC                                    ; 69FA   0007
        MOVR    R0,     R7                      ; 69FB   0087

        DECLE   $0047,  $0027,  $0037,  $0007   ; 69FC   0047 0027 0037 0007
        DECLE   $0007,  $0007,  $0003,  $0000   ; 6A00   0007 0007 0003 0000
        DECLE   $0000,  $0000,  $0008,  $001C   ; 6A04   0000 0000 0008 001C
        DECLE   $001C,  $0008,  $001C,  $001E   ; 6A08   001C 0008 001C 001E
        DECLE   $001E,  $003E,  $003E,  $003E   ; 6A0C   001E 003E 003E 003E
        DECLE   $0014,  $0014,  $0000,  $0010   ; 6A10   0014 0014 0000 0010
        DECLE   $0010,  $0010,  $0000,  $0008   ; 6A14   0010 0010 0000 0008
        DECLE   $001C,  $001C,  $0008,  $001C   ; 6A18   001C 001C 0008 001C
        DECLE   $001E,  $003E,  $007E,  $001E   ; 6A1C   001E 003E 007E 001E
        DECLE   $001C,  $0014,  $0014,  $0000   ; 6A20   001C 0014 0014 0000
        DECLE   $0014,  $0010,  $0008,  $001C   ; 6A24   0014 0010 0008 001C
        DECLE   $001C,  $0008,  $001C,  $003E   ; 6A28   001C 0008 001C 003E
        DECLE   $003E,  $003E,  $001C,  $001C   ; 6A2C   003E 003E 001C 001C
        DECLE   $0014,  $0014,  $0000,  $0014   ; 6A30   0014 0014 0000 0014
        DECLE   $0004,  $0004,  $0008,  $001C   ; 6A34   0004 0004 0008 001C
        DECLE   $001C,  $0008,  $001C,  $001E   ; 6A38   001C 0008 001C 001E
        DECLE   $001E,  $001C,  $001C,  $001C   ; 6A3C   001E 001C 001C 001C
        DECLE   $0014,  $0014,  $0000,  $0004   ; 6A40   0014 0014 0000 0004
        DECLE   $0004,  $0004,  $0000,  $0008   ; 6A44   0004 0004 0000 0008
        DECLE   $001C,  $001C,  $0008,  $001C   ; 6A48   001C 001C 0008 001C
        DECLE   $001E,  $001E,  $001E,  $001C   ; 6A4C   001E 001E 001E 001C
        DECLE   $001C,  $0014,  $0014,  $0000   ; 6A50   001C 0014 0014 0000
        DECLE   $0014,  $0004,  $0008,  $001C   ; 6A54   0014 0004 0008 001C
        DECLE   $001C,  $0008,  $001C,  $001E   ; 6A58   001C 0008 001C 001E
        DECLE   $001E,  $001E,  $001E,  $003C   ; 6A5C   001E 001E 001E 003C
        DECLE   $0014,  $0014,  $0000,  $0014   ; 6A60   0014 0014 0000 0014
        DECLE   $0010,  $0010,  $0004,  $0040   ; 6A64   0010 0010 0004 0040
        DECLE   $0010,  $0004,  $0000,  $0014   ; 6A68   0010 0004 0000 0014
        DECLE   $0000,  $0000,  $0020,  $0010   ; 6A6C   0000 0000 0020 0010
        DECLE   $0004,  $0020,  $0000,  $0010   ; 6A70   0004 0020 0000 0010
        DECLE   $0000,  $0000,  $0010,  $0000   ; 6A74   0000 0000 0010 0000
        DECLE   $0040,  $0008,  $0000,  $0022   ; 6A78   0040 0008 0000 0022
        DECLE   $0000,  $0008,  $0080,  $0000   ; 6A7C   0000 0008 0080 0000
        DECLE   $0020,  $0008,  $0000,  $0000   ; 6A80   0020 0008 0000 0000
        DECLE   $0082,  $0000,  $0080,  $0000   ; 6A84   0082 0000 0080 0000
        DECLE   $0000,  $0020,  $0002,  $0000   ; 6A88   0000 0020 0002 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; 6A8C   0000 0002 0000 0000
        DECLE   $0040,  $0020,  $0004,  $0080   ; 6A90   0040 0020 0004 0080
        DECLE   $0001,  $0000,  $0001,  $0000   ; 6A94   0001 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A98   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0040   ; 6A9C   0000 0008 0000 0040
        DECLE   $0000,  $0002,  $0010,  $0000   ; 6AA0   0000 0002 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 6AAC   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 6ABC   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; 6ACC   0000 0000 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AD8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ADC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0000   ; 6AE4   0000 0000 0004 0000
        DECLE   $0004,  $0000,  $0002,  $0001   ; 6AE8   0004 0000 0002 0001
        DECLE   $0000,  $0021,  $0020,  $006D   ; 6AEC   0000 0021 0020 006D
        DECLE   $00FE,  $003E,  $003E,  $0067   ; 6AF0   00FE 003E 003E 0067
        DECLE   $0041,  $0008,  $0000,  $0000   ; 6AF4   0041 0008 0000 0000
        DECLE   $0000,  $0010,  $0008,  $0004   ; 6AF8   0000 0010 0008 0004
        DECLE   $0000,  $0002,  $0020,  $0022   ; 6AFC   0000 0002 0020 0022
        DECLE   $006C,  $00FE,  $003E,  $003E   ; 6B00   006C 00FE 003E 003E
        DECLE   $0066,  $0092,  $0000,  $0000   ; 6B04   0066 0092 0000 0000
        DECLE   $0000,  $0008,  $0012,  $0000   ; 6B08   0000 0008 0012 0000
        DECLE   $0000,  $0021,  $0020,  $006D   ; 6B0C   0000 0021 0020 006D
        DECLE   $00FE,  $003E,  $003E,  $0036   ; 6B10   00FE 003E 003E 0036
        DECLE   $0000,  $0024,  $0000,  $0000   ; 6B14   0000 0024 0000 0000
        DECLE   $0000,  $0004,  $0000,  $0002   ; 6B18   0000 0004 0000 0002
        DECLE   $0000,  $0002,  $0020,  $0022   ; 6B1C   0000 0002 0020 0022
        DECLE   $006C,  $00FE,  $003E,  $003E   ; 6B20   006C 00FE 003E 003E
        DECLE   $0026,  $0012,  $0000,  $0000   ; 6B24   0026 0012 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B2C   0000 0000 0000 0000
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6B30   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B3C   0000 0000 0000 0000
        DECLE   $0000,  $0014,  $0000,  $0000   ; 6B40   0000 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B4C   0000 0000 0000 0000
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6B50   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B64   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0010,  $0008   ; 6B68   0000 0010 0010 0008
        DECLE   $0008,  $0022,  $0022,  $001C   ; 6B6C   0008 0022 0022 001C
        DECLE   $001C,  $001C,  $0008,  $0010   ; 6B70   001C 001C 0008 0010
        DECLE   $0014,  $0004,  $0000,  $0000   ; 6B74   0014 0004 0000 0000
        DECLE   $0050,  $0008,  $0004,  $0004   ; 6B78   0050 0008 0004 0004
        DECLE   $0008,  $0000,  $0022,  $0022   ; 6B7C   0008 0000 0022 0022
        DECLE   $001C,  $001C,  $001C,  $0028   ; 6B80   001C 001C 001C 0028
        DECLE   $0004,  $0004,  $0000,  $0000   ; 6B84   0004 0004 0000 0000
        DECLE   $0008,  $0014,  $0004,  $0004   ; 6B88   0008 0014 0004 0004
        DECLE   $0008,  $0022,  $0022,  $001C   ; 6B8C   0008 0022 0022 001C
        DECLE   $001C,  $001C,  $0008,  $0002   ; 6B90   001C 001C 0008 0002
        DECLE   $0012,  $0010,  $0000,  $000A   ; 6B94   0012 0010 0000 000A
        DECLE   $0010,  $0010,  $0008,  $0008   ; 6B98   0010 0010 0008 0008
        DECLE   $0008,  $0000,  $0022,  $0022   ; 6B9C   0008 0000 0022 0022
        DECLE   $001C,  $001C,  $001C,  $000A   ; 6BA0   001C 001C 001C 000A
        DECLE   $0010,  $0010,  $0070,  $00B8   ; 6BA4   0010 0010 0070 00B8
        DECLE   $003C,  $0030,  $0030,  $0038   ; 6BA8   003C 0030 0030 0038
        DECLE   $003C,  $003E,  $003E,  $003A   ; 6BAC   003C 003E 003E 003A
        DECLE   $0038,  $003C,  $003C,  $003C   ; 6BB0   0038 003C 003C 003C
        DECLE   $007C,  $00BC,  $0038,  $007C   ; 6BB4   007C 00BC 0038 007C
        DECLE   $00B0,  $0030,  $0030,  $0038   ; 6BB8   00B0 0030 0030 0038
        DECLE   $003C,  $003C,  $0038,  $0038   ; 6BBC   003C 003C 0038 0038
        DECLE   $003C,  $003C,  $003C,  $003C   ; 6BC0   003C 003C 003C 003C
        DECLE   $007C,  $00FE,  $0070,  $00B8   ; 6BC4   007C 00FE 0070 00B8
        DECLE   $003C,  $0030,  $0030,  $0030   ; 6BC8   003C 0030 0030 0030
        DECLE   $0070,  $00F0,  $00E8,  $0078   ; 6BCC   0070 00F0 00E8 0078
        DECLE   $0038,  $003C,  $003C,  $003C   ; 6BD0   0038 003C 003C 003C
        DECLE   $007C,  $007E,  $0038,  $007C   ; 6BD4   007C 007E 0038 007C
        DECLE   $00B0,  $0030,  $0030,  $003E   ; 6BD8   00B0 0030 0030 003E
        DECLE   $003E,  $003E,  $0038,  $0038   ; 6BDC   003E 003E 0038 0038
        DECLE   $0038,  $0038,  $003C,  $003C   ; 6BE0   0038 0038 003C 003C
        DECLE   $003C,  $007C,  $0000,  $0003   ; 6BE4   003C 007C 0000 0003
        DECLE   $0001,  $0009,  $000D,  $0005   ; 6BE8   0001 0009 000D 0005
        DECLE   $0005,  $0004,  $0005,  $0005   ; 6BEC   0005 0004 0005 0005
        DECLE   $0005,  $0005,  $0005,  $0005   ; 6BF0   0005 0005 0005 0005
        DECLE   $0001,  $0001,  $0000,  $0000   ; 6BF4   0001 0001 0000 0000

        INCR    R0                              ; 6BF8   0008
        INCR    R4                              ; 6BF9   000C
        INCR    R7                              ; 6BFA   000F

        DECLE   $0005                           ; 6BFB   0005
L_6BFC:
        SETC                                    ; 6BFC   0007
        DECLE   $0006,  $0004,  $0004,  $0008   ; 6BFD   0006 0004 0004 0008
        DECLE   $0008,  $0010,  $0010,  $0020   ; 6C01   0008 0010 0010 0020
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6C05   0020 0000 0000 0000
        DECLE   $0008,  $000C,  $000C,  $000C   ; 6C09   0008 000C 000C 000C
        DECLE   $000C,  $0014,  $0014,  $0024   ; 6C0D   000C 0014 0014 0024
        DECLE   $0024,  $0044,  $0048,  $0080   ; 6C11   0024 0044 0048 0080
        DECLE   $0080,  $0003,  $0001,  $0009   ; 6C15   0080 0003 0001 0009
        DECLE   $000D,  $000D,  $0000,  $0001   ; 6C19   000D 000D 0000 0001
        DECLE   $0001,  $0005,  $0005,  $0005   ; 6C1D   0001 0005 0005 0005
        DECLE   $0005,  $0001,  $0001,  $0000   ; 6C21   0005 0001 0001 0000
        DECLE   $0000,  $000E,  $001D,  $003E   ; 6C25   0000 000E 001D 003E
        DECLE   $003E,  $003E,  $007E,  $007F   ; 6C29   003E 003E 007E 007F
        DECLE   $007F,  $003F,  $003F,  $003D   ; 6C2D   007F 003F 003F 003D
        DECLE   $003E,  $003E,  $003E,  $007E   ; 6C31   003E 003E 003E 007E
        DECLE   $00FF,  $0001,  $000E,  $001C   ; 6C35   00FF 0001 000E 001C
        DECLE   $003E,  $003E,  $003E,  $007E   ; 6C39   003E 003E 003E 007E
        DECLE   $007F,  $007F,  $003F,  $003D   ; 6C3D   007F 007F 003F 003D
        DECLE   $003F                           ; 6C41   003F

        RSWD    R6                              ; 6C42   003E
        RSWD    R6                              ; 6C43   003E
        SARC    R2,     2                       ; 6C44   007E
        SAR     R3,     2                       ; 6C45   006F
        INCR    R7                              ; 6C46   000F

        COMR    R4                              ; 6C47   001C
L_6C48:
        RSWD    R6                              ; 6C48   003E
        DECLE   $003E,  $003E,  $003E,  $003F   ; 6C49   003E 003E 003E 003F
        DECLE   $007D,  $007F,  $007F,  $003E   ; 6C4D   007D 007F 007F 003E
        DECLE   $003E,  $003E,  $003E,  $007E   ; 6C51   003E 003E 003E 007E
        DECLE   $006F,  $0001,  $000E,  $001C   ; 6C55   006F 0001 000E 001C
        DECLE   $003C,  $003E,  $003E,  $003E   ; 6C59   003C 003E 003E 003E
        DECLE   $003F,  $007F,  $007D,  $007E   ; 6C5D   003F 007F 007D 007E
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6C61   003F 003F 003F 003F
        DECLE   $007B,  $000C,  $001E,  $003F   ; 6C65   007B 000C 001E 003F
        DECLE   $003E,  $003E,  $003E,  $003E   ; 6C69   003E 003E 003E 003E
        DECLE   $003E,  $001E,  $003E,  $003E   ; 6C6D   003E 001E 003E 003E
        DECLE   $003F,  $003F,  $003F,  $007F   ; 6C71   003F 003F 003F 007F
        DECLE   $00FF,  $001C,  $003E,  $005E   ; 6C75   00FF 001C 003E 005E
        DECLE   $001E,  $001E,  $001E,  $001E   ; 6C79   001E 001E 001E 001E
        DECLE   $001F,  $003F,  $003F,  $003F   ; 6C7D   001F 003F 003F 003F
        DECLE   $003F,  $003E,  $007E,  $007E   ; 6C81   003F 003E 007E 007E
        DECLE   $00FF,  $000E,  $001D,  $003C   ; 6C85   00FF 000E 001D 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 6C89   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003C   ; 6C8D   003C 003C 003C 003C
        DECLE   $003C,  $003C,  $003C,  $003E   ; 6C91   003C 003C 003C 003E
        DECLE   $007F,  $0001,  $000E,  $001C   ; 6C95   007F 0001 000E 001C
        DECLE   $003C,  $003E,  $003E,  $003E   ; 6C99   003C 003E 003E 003E
        DECLE   $003F,  $007F,  $007D,  $007E   ; 6C9D   003F 007F 007D 007E
        DECLE   $003E,  $003E,  $003E,  $003E   ; 6CA1   003E 003E 003E 003E
        DECLE   $007F,  $00C0,  $0080,  $0080   ; 6CA5   007F 00C0 0080 0080
        DECLE   $00AA,  $00BE,  $001C,  $009C   ; 6CA9   00AA 00BE 001C 009C
        DECLE   $009C,  $008C,  $008C,  $0084   ; 6CAD   009C 008C 008C 0084
        DECLE   $0084,  $0084,  $0080,  $0080   ; 6CB1   0084 0084 0080 0080
        DECLE   $0000,  $0000,  $00C0,  $0080   ; 6CB5   0000 0000 00C0 0080
        DECLE   $0080,  $00AA,  $00BE,  $001C   ; 6CB9   0080 00AA 00BE 001C
        DECLE   $009C,  $008C,  $008C,  $008C   ; 6CBD   009C 008C 008C 008C
        DECLE   $008C,  $0088,  $0088,  $0080   ; 6CC1   008C 0088 0088 0080
        DECLE   $0080,  $0000,  $0000,  $00C0   ; 6CC5   0080 0000 0000 00C0
        DECLE   $00AA,  $00BE,  $009C,  $009C   ; 6CC9   00AA 00BE 009C 009C
        DECLE   $001C,  $009C,  $008C,  $0086   ; 6CCD   001C 009C 008C 0086
        DECLE   $0082,  $0082,  $0080,  $0080   ; 6CD1   0082 0082 0080 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; 6CD5   0080 0000 0000 0000
        DECLE   $00C0,  $00AA,  $00BE,  $009C   ; 6CD9   00C0 00AA 00BE 009C
        DECLE   $009C,  $000C,  $008C,  $0086   ; 6CDD   009C 000C 008C 0086
        DECLE   $0083,  $0081,  $0081,  $0080   ; 6CE1   0083 0081 0081 0080
        DECLE   $0080,  $0038,  $0020,  $0020   ; 6CE5   0080 0038 0020 0020
        DECLE   $002A,  $002F,  $002F,  $0027   ; 6CE9   002A 002F 002F 0027
        DECLE   $0027,  $0003,  $0023,  $0023   ; 6CED   0027 0003 0023 0023
        DECLE   $0022,  $0026,  $0024,  $0028   ; 6CF1   0022 0026 0024 0028
        DECLE   $0000,  $0000,  $0003,  $0001   ; 6CF5   0000 0000 0003 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6CF9   0001 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CFD   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 6D01   0000 0001 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6D05   0001 0000 0000 0000
        DECLE   $0010,  $0030,  $0030,  $0030   ; 6D09   0010 0030 0030 0030
        DECLE   $0030,  $0030,  $0030,  $0020   ; 6D0D   0030 0030 0030 0020
        DECLE   $0020,  $0020,  $0020,  $0000   ; 6D11   0020 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D15   0000 0000 0000 0000
        DECLE   $00C0,  $00AA,  $00BE,  $009C   ; 6D19   00C0 00AA 00BE 009C
        DECLE   $009C,  $000C,  $008C,  $0088   ; 6D1D   009C 000C 008C 0088
        DECLE   $0098,  $0090,  $00A0,  $0080   ; 6D21   0098 0090 00A0 0080
        DECLE   $0080,  $0000,  $0000,  $0001   ; 6D25   0080 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D29   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $0002,  $0077   ; 6D2D   0000 0003 0002 0077
        DECLE   $0002,  $0003,  $0000,  $0000   ; 6D31   0002 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0002   ; 6D3D   0000 0000 0003 0002
        DECLE   $0077,  $0002,  $0003,  $0000   ; 6D41   0077 0002 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D45   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6D49   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0004   ; 6D4D   0000 0000 0006 0004
        DECLE   $00EE,  $0004                   ; 6D51   00EE 0004
L_6D53:
        CLRC                                    ; 6D53   0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D54   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 6D58   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0004   ; 6D5C   0000 0000 0006 0004
        DECLE   $00EE,  $0004,  $0006,  $0000   ; 6D60   00EE 0004 0006 0000
        DECLE   $0000,  $0000,  $0004           ; 6D64   0000 0000 0004

        NEGR    R6                              ; 6D67   0026
        RLC     R2,     2                       ; 6D68   0056
        SWAP    R3,     2                       ; 6D69   0047
        NEGR    R6                              ; 6D6A   0026
        NEGR    R4                              ; 6D6B   0024
        SLL     R0,     2                       ; 6D6C   004C
        SLL     R0,     2                       ; 6D6D   004C
        SLL     R0,     2                       ; 6D6E   004C
        ADCR    R4                              ; 6D6F   002C
        COMR    R4                              ; 6D70   001C
        COMR    R4                              ; 6D71   001C
        COMR    R4                              ; 6D72   001C
        NOP                                     ; 6D73   0034
        SLR     R0,     2                       ; 6D74   0064
        SLR     R2,     2                       ; 6D75   0066
        SWAP    R0,     1                       ; 6D76   0040
        TSTR    R4                              ; 6D77   00A4
        NEGR    R6                              ; 6D78   0026
        SWAP    R2,     2                       ; 6D79   0046
        SWAP    R3,     2                       ; 6D7A   0047
        MOVR    R0,     R6                      ; 6D7B   0086
        MOVR    R1,     R4                      ; 6D7C   008C
        MOVR    R3,     R0                      ; 6D7D   0098
        MOVR    R7,     R0                      ; 6D7E   00B8
        SARC    R0,     1                       ; 6D7F   0078
        RSWD    R0                              ; 6D80   0038
        RSWD    R0                              ; 6D81   0038
        RSWD    R0                              ; 6D82   0038
        COMR    R0                              ; 6D83   0018
        COMR    R0                              ; 6D84   0018
        COMR    R4                              ; 6D85   001C
        SWAP    R0,     1                       ; 6D86   0040
        NEGR    R4                              ; 6D87   0024
        NEGR    R6                              ; 6D88   0026
        SWAP    R2,     2                       ; 6D89   0046
        MOVR    R0,     R7                      ; 6D8A   0087

        DECLE   $0086,  $008C,  $0098,  $00B8   ; 6D8B   0086 008C 0098 00B8
        DECLE   $0078,  $0078,  $0038,  $0018   ; 6D8F   0078 0078 0038 0018
        DECLE   $0018,  $0030,  $0038,  $0008   ; 6D93   0018 0030 0038 0008
        DECLE   $002C,  $004C,  $004E,  $008C   ; 6D97   002C 004C 004E 008C
        DECLE   $0088,  $0098,  $0058,  $0038   ; 6D9B   0088 0098 0058 0038
        DECLE   $0038,  $0038,  $0038,  $0038   ; 6D9F   0038 0038 0038 0038
        DECLE   $0064,  $0046,  $0060,  $0000   ; 6DA3   0064 0046 0060 0000
        DECLE   $0000,  $0000,  $000A,  $0000   ; 6DA7   0000 0000 000A 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 6DAB   0000 0000 0000 0003
        DECLE   $0002,  $0077,  $0002,  $0003   ; 6DAF   0002 0077 0002 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000A   ; 6DB7   0000 0000 0000 000A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBB   0000 0000 0000 0000
        DECLE   $0003,  $0002,  $0077,  $0002   ; 6DBF   0003 0002 0077 0002
        DECLE   $0003,  $0000,  $0000,  $0000   ; 6DC3   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCB   0000 0000 0000 0000
        DECLE   $0006,  $0004,  $00EE,  $0004   ; 6DCF   0006 0004 00EE 0004
        DECLE   $0006,  $0000,  $0000,  $0000   ; 6DD3   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $000A,  $0000   ; 6DD7   0000 0000 000A 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 6DDB   0000 0000 0000 0006
        DECLE   $0004,  $00EE,  $0004,  $0006   ; 6DDF   0004 00EE 0004 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE7   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6DEB   0001 0000 0000 0000
        DECLE   $0003,  $0002,  $0077,  $0002   ; 6DEF   0003 0002 0077 0002
        DECLE   $0003,  $0000,  $0000,  $0000   ; 6DF3   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 6DFB   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0006,  $0004   ; 6DFF   0000 0000 0006 0004
        DECLE   $00EE,  $0004,  $0006,  $0000   ; 6E03   00EE 0004 0006 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E07   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0B   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 6E0F   0000 0001 0000 0000
        DECLE   $0000,  $0006,  $00EE,  $0000   ; 6E13   0000 0006 00EE 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E17   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $00CE,  $0011   ; 6E23   0000 0001 00CE 0011
        DECLE   $005B,  $008E,  $008E,  $008E   ; 6E27   005B 008E 008E 008E
        DECLE   $0084,  $0044,  $004E,  $002E   ; 6E2B   0084 0044 004E 002E
        DECLE   $002E,  $002E,  $001E,  $000E   ; 6E2F   002E 002E 001E 000E
        DECLE   $000A,  $0002,  $0002,  $0000   ; 6E33   000A 0002 0002 0000
        DECLE   $0011,  $009B,  $008E,  $004E   ; 6E37   0011 009B 008E 004E
        DECLE   $004E,  $0044,  $0044,  $002E   ; 6E3B   004E 0044 0044 002E
        DECLE   $002E,  $002E,  $001E,  $000E   ; 6E3F   002E 002E 001E 000E
        DECLE   $000A,  $000A,  $0008,  $0080   ; 6E43   000A 000A 0008 0080
        DECLE   $0051,  $005B,  $004E,  $008E   ; 6E47   0051 005B 004E 008E
        DECLE   $008E,  $0084,  $004E,  $004E   ; 6E4B   008E 0084 004E 004E
        DECLE   $002E,  $002E,  $001E,  $000E   ; 6E4F   002E 002E 001E 000E
        DECLE   $000A,  $0008,  $0008,  $0011   ; 6E53   000A 0008 0008 0011
        DECLE   $001B,  $004E,  $008E,  $008E   ; 6E57   001B 004E 008E 008E
        DECLE   $0084,  $008E,  $008E,  $004E   ; 6E5B   0084 008E 008E 004E
        DECLE   $002E,  $002E,  $001E,  $000E   ; 6E5F   002E 002E 001E 000E
        DECLE   $000A,  $000A,  $0002,  $0000   ; 6E63   000A 000A 0002 0000
        DECLE   $0000,  $0000,  $0004,  $0026   ; 6E67   0000 0000 0004 0026
        DECLE   $0056,  $0047,  $0086,  $008C   ; 6E6B   0056 0047 0086 008C
        DECLE   $0098,  $00B8,  $0078,  $0038   ; 6E6F   0098 00B8 0078 0038
        DECLE   $0038,  $0048,  $006C,  $0000   ; 6E73   0038 0048 006C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E77   0000 0000 0000 0000
        DECLE   $0004,  $0006,  $0026,  $0047   ; 6E7B   0004 0006 0026 0047
        DECLE   $0046,  $008C,  $0098,  $00B8   ; 6E7F   0046 008C 0098 00B8
        DECLE   $0078,  $0078,  $00CC,  $0000   ; 6E83   0078 0078 00CC 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E87   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6E8B   0000 0000 0000 0004

        CLRC                                    ; 6E8F   0006
        SWAP    R2,     2                       ; 6E90   0046
        MOVR    R4,     R7                      ; 6E91   00A7

        DECLE   $0026,  $003C,  $007E,  $00FF   ; 6E92   0026 003C 007E 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E9E   0000 0000 0000 0000
        DECLE   $0044,  $00B6,  $007E,  $007F   ; 6EA2   0044 00B6 007E 007F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EAA   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0000,  $0001   ; 6EAE   0000 0008 0000 0001
        DECLE   $0002,  $0000,  $0028,  $0068   ; 6EB2   0002 0000 0028 0068
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EBE   0000 0000 0000 0000
        DECLE   $0080,  $0008,  $0044,  $0093   ; 6EC2   0080 0008 0044 0093
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ECA   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0000,  $0010   ; 6ECE   0000 0002 0000 0010
        DECLE   $0000,  $0080,  $0024,  $0046   ; 6ED2   0000 0080 0024 0046
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6ED6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EDA   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0000,  $0000   ; 6EDE   0000 0002 0000 0000
        DECLE   $0008,  $0000,  $0042,  $0094   ; 6EE2   0008 0000 0042 0094
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6EEE   0000 0000 0000 0004
        DECLE   $0010,  $0000,  $0014,  $008A   ; 6EF2   0010 0000 0014 008A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6EFA   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0000,  $0001   ; 6EFE   0000 0020 0000 0001
        DECLE   $0004,  $0020,  $0011,  $0048   ; 6F02   0004 0020 0011 0048
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F06   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0E   0000 0000 0000 0000
        DECLE   $0008,  $0020,  $0008,  $00B1   ; 6F12   0008 0020 0008 00B1
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F16   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6F1E   0000 0000 0000 0080
        DECLE   $0000,  $0004,  $0010,  $0023   ; 6F22   0000 0004 0010 0023
        DECLE   $00C4,  $00CC,  $011C,  $018C   ; 6F26   00C4 00CC 011C 018C
        DECLE   $00CD,  $00FE,  $00FF,  $00ED   ; 6F2A   00CD 00FE 00FF 00ED
        DECLE   $0002,  $00AD,  $0003,  $01A4   ; 6F2E   0002 00AD 0003 01A4
        DECLE   $03A7                           ; 6F32   03A7

        ANDR    R4,     R2                      ; 6F33   01A2
        AND@    R4,     R5                      ; 6F34   03A5
        ANDR    R4,     R0                      ; 6F35   01A0
        AND@    R4,     R4                      ; 6F36   03A4
        ANDR    R4,     R0                      ; 6F37   01A0
        AND@    R4,     R4                      ; 6F38   03A4
        SUBR    R4,     R7                      ; 6F39   0127

        AND@    R4,     R2                      ; 6F3A   03A2
        SUBR    R4,     R4                      ; 6F3B   0124
L_6F3C:
        AND@    R4,     R0                      ; 6F3C   03A0
        SUBR    R4,     R4                      ; 6F3D   0124
        AND@    R4,     R0                      ; 6F3E   03A0
        SUBR    R4,     R7                      ; 6F3F   0127

        AND@    R4,     R2                      ; 6F40   03A2
        XORR    R2,     R0                      ; 6F41   01D0
        AND     G_0385, R4                      ; 6F42   0384 0385
        AND     G_0385, R4                      ; 6F44   0384 0385
        AND@    R2,     R4                      ; 6F46   0394
        SUBR    R4,     R7                      ; 6F47   0127

        AND@    R4,     R2                      ; 6F48   03A2
        SUBR    R4,     R7                      ; 6F49   0127

        DECLE   $03A2,  $01ED,  $001C,  $034F   ; 6F4A   03A2 01ED 001C 034F
        DECLE   $002F,  $019F,  $01A4,  $03A7   ; 6F4E   002F 019F 01A4 03A7
        DECLE   $01A2,  $03A5,  $01A0,  $01A4   ; 6F52   01A2 03A5 01A0 01A4
        DECLE   $0150,  $00DD,  $01A2,  $03A5   ; 6F56   0150 00DD 01A2 03A5
        DECLE   $01A4,  $01A7,  $02A4,  $01ED   ; 6F5A   01A4 01A7 02A4 01ED
        DECLE   $03F7,  $01A4,  $01A7           ; 6F5E   03F7 01A4 01A7

        ADDR    R3,     R1                      ; 6F61   00D9
        ADDR    R3,     R5                      ; 6F62   00DD
        ANDR    R4,     R2                      ; 6F63   01A2
        AND@    R4,     R5                      ; 6F64   03A5
        ANDR    R4,     R0                      ; 6F65   01A0
        ANDR    R4,     R4                      ; 6F66   01A4
        MVI@    R4,     R4                      ; 6F67   02A4
        ANDR    R4,     R2                      ; 6F68   01A2
        ANDR    R4,     R5                      ; 6F69   01A5
        ADDR    R2,     R5                      ; 6F6A   00D5
        ADDR    R3,     R5                      ; 6F6B   00DD
        ANDR    R4,     R0                      ; 6F6C   01A0
        AND@    R4,     R4                      ; 6F6D   03A4
        SUBR    R5,     R3                      ; 6F6E   012B
        ANDR    R4,     R2                      ; 6F6F   01A2
        MVI@    R4,     R7                      ; 6F70   02A7

        ANDR    R5,     R5                      ; 6F71   01AD
        DECR    R4                              ; 6F72   0014
        SUBR    R4,     R4                      ; 6F73   0124
        ANDR    R4,     R0                      ; 6F74   01A0
        MVI@    R4,     R0                      ; 6F75   02A0
        BUSC    L_6D53                          ; 6F76   0227 0224
        B       L_6F3C                          ; 6F78   0220 003D

        DECLE   $0245,  $024B,  $026A,  $0284   ; 6F7A   0245 024B 026A 0284
        DECLE   $028F,  $02C1,  $02CB,  $02B2   ; 6F7E   028F 02C1 02CB 02B2
        DECLE   $0268,  $0259,  $020D,  $0287   ; 6F82   0268 0259 020D 0287
        DECLE   $02AA,  $02C1,  $02B7,  $02B2   ; 6F86   02AA 02C1 02B7 02B2
        DECLE   $0266,  $02B9,  $0245,  $0261   ; 6F8A   0266 02B9 0245 0261
        DECLE   $02C1,  $026F,  $0236,  $022C   ; 6F8E   02C1 026F 0236 022C
        DECLE   $0000,  $0004,  $0000,  $0016   ; 6F92   0000 0004 0000 0016
        DECLE   $0000,  $0004,  $0000,  $0036   ; 6F96   0000 0004 0000 0036
        DECLE   $0000,  $0004,  $0000,  $0016   ; 6F9A   0000 0004 0000 0016
        DECLE   $0000                           ; 6F9E   0000

        DECR    R4                              ; 6F9F   0014
        ADDR    R1,     R1                      ; 6FA0   00C9
        MOVR    R6,     R2                      ; 6FA1   00B2
        DECR    R0                              ; 6FA2   0010
        MOVR    R2,     R5                      ; 6FA3   0095
        MOVR    R6,     R2                      ; 6FA4   00B2
        MOVR    R1,     R2                      ; 6FA5   008A
        ADDR    R2,     R1                      ; 6FA6   00D1
        TSTR    R4                              ; 6FA7   00A4
        MOVR    R4,     R5                      ; 6FA8   00A5
        RRC     R0,     1                       ; 6FA9   0070
        ADDR    R3,     R2                      ; 6FAA   00DA
        MOVR    R1,     R5                      ; 6FAB   008D
        ADDR    R0,     R2                      ; 6FAC   00C2
        INCR    R5                              ; 6FAD   000D
        SWAP    R3,     2                       ; 6FAE   0047
        MOVR    R1,     R2                      ; 6FAF   008A
        ADDR    R2,     R4                      ; 6FB0   00D4
        MOVR    R0,     R7                      ; 6FB1   0087

        DECLE   $000D,  $0045,  $00DA,  $00D1   ; 6FB2   000D 0045 00DA 00D1
        DECLE   $0036,  $002C,  $0046,  $005C   ; 6FB6   0036 002C 0046 005C
        DECLE   $00BF,  $00C9,  $00D5,  $0010   ; 6FBA   00BF 00C9 00D5 0010
        DECLE   $008D,  $0081,  $00C6,  $004E   ; 6FBE   008D 0081 00C6 004E
        DECLE   $00BF,  $006D,  $0078,  $0000   ; 6FC2   00BF 006D 0078 0000
        DECLE   $0000,  $0038,  $00A8,  $0020   ; 6FC6   0000 0038 00A8 0020
        DECLE   $0020,  $0068,  $00A8,  $0058   ; 6FCA   0020 0068 00A8 0058
        DECLE   $0098,  $0068,  $0058,  $0038   ; 6FCE   0098 0068 0058 0038
        DECLE   $0058,  $0038,  $0028,  $0038   ; 6FD2   0058 0038 0028 0038
        DECLE   $0028,  $0038,  $0070,  $0038   ; 6FD6   0028 0038 0070 0038
        DECLE   $0070,  $0038,  $0231,  $023A   ; 6FDA   0070 0038 0231 023A
        DECLE   $0219,  $0226,  $0218,  $0222   ; 6FDE   0219 0226 0218 0222
        DECLE   $0006,  $0016,  $0028,  $0050   ; 6FE2   0006 0016 0028 0050
        DECLE   $0096,  $00FA,  $01F4,  $03E8   ; 6FE6   0096 00FA 01F4 03E8
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFA   0000 0000 0000 0000
        DECLE   $0000                           ; 6FFE   0000

        SLR     R0,     1                       ; 6FFF   0060

        ORG     $D000
L_D000:
        PSHR    R5                              ; D000   0275
        CLRR    R0                              ; D001   01C0
        MVO     R0,     G_018E                  ; D002   0240 018E

        JSR     R5,     L_53DB                  ; D004   0004 0150 03DB

        MVII    #$0200, R4                      ; D007   02BC 0200
        MVII    #$0078, R0                      ; D009   02B8 0078

        JSR     R5,     X_FILL_ZERO             ; D00B   0004 0114 0338

        MVII    #$01B0, R4                      ; D00E   02BC 01B0
        MVII    #$0016, R0                      ; D010   02B8 0016

        JSR     R5,     X_FILL_ZERO             ; D012   0004 0114 0338

        MVII    #$0003, R0                      ; D015   02B8 0003
        MVO     R0,     G_0102                  ; D017   0240 0102
        SDBD                                    ; D019   0001
        MVII    #$D127, R5                      ; D01A   02BD 0027 00D1
L_D01D:
        MVI@    R5,     R4                      ; D01D   02AC
        TSTR    R4                              ; D01E   00A4
        BEQ     L_D028                          ; D01F   0204 0007

        MVI@    R5,     R3                      ; D021   02AB
        MOVR    R5,     R1                      ; D022   00A9

        JSR     R5,     X_PRINT_R1              ; D023   0004 0118 0067

        B       L_D01D                          ; D026   0220 000A

L_D028:
        MVII    #$0002, R0                      ; D028   02B8 0002

        JSR     R5,     X_RAND1                 ; D02A   0004 0114 027D
        JSR     R5,     .EXEC.4F1               ; D02D   0004 0114 00F1

        MVI     .PSG0.rgt_hand,R0               ; D030   0280 01FE
        AND     .PSG0.lft_hand,R0               ; D032   0380 01FF
        MVII    #$0003, R1                      ; D034   02B9 0003
        SDBD                                    ; D036   0001
        MVII    #$D077, R4                      ; D037   02BC 0077 00D0
L_D03A:
        CMP@    R4,     R0                      ; D03A   0360
        BEQ     L_D042                          ; D03B   0204 0005

        DECR    R1                              ; D03D   0011
        BMI     L_D028                          ; D03E   022B 0017
        B       L_D03A                          ; D040   0220 0007

L_D042:
        CLRR    R2                              ; D042   01D2
        TSTR    R1                              ; D043   0089
        BEQ     L_D04F                          ; D044   0204 0009

        CMPI    #$0003, R1                      ; D046   0379 0003
        BEQ     L_D055                          ; D048   0204 000B

        MOVR    R1,     R2                      ; D04A   008A
        SLL     R2,     2                       ; D04B   004E
        SLL     R2,     1                       ; D04C   004A
        ADDI    #$0086, R2                      ; D04D   02FA 0086
L_D04F:
        MVO     R1,     G_01AE                  ; D04F   0241 01AE
        MVO     R2,     .BTAB.E6                ; D051   0242 02E6
        B       L_D028                          ; D053   0220 002C

L_D055:
        MVI     G_01AE, R0                      ; D055   0280 01AE
        DECR    R0                              ; D057   0010
        BMI     L_D028                          ; D058   022B 0031

        MVO     R0,     G_01AE                  ; D05A   0240 01AE
        MVII    #$01FE, R2                      ; D05C   02BA 01FE
        MVII    #$01FF, R3                      ; D05E   02BB 01FF

        JSR     R5,     .EXEC.4B7               ; D060   0004 0114 00B7

        MVII    #$01B0, R4                      ; D063   02BC 01B0
        MVII    #$0004, R5                      ; D065   02BD 0004
        MVII    #$0004, R0                      ; D067   02B8 0004
        MVII    #$0003, R1                      ; D069   02B9 0003
L_D06B:
        MVO@    R0,     R4                      ; D06B   0260
        MVO@    R1,     R4                      ; D06C   0261
        MVO@    R1,     R4                      ; D06D   0261
        SDBD                                    ; D06E   0001
        ADDI    #$0008, R4                      ; D06F   02FC 0008 0000
        DECR    R5                              ; D072   0015
        BNEQ    L_D06B                          ; D073   022C 0009
        B       L_D08F                          ; D075   0200 0018
        ADDR    R2,     R7                      ; D077   00D7

        MOVR    R7,     R6                      ; D078   00BE
        SARC    R2,     2                       ; D079   007E
        RRC     R3,     2                       ; D07A   0077
L_D07B:
        PSHR    R5                              ; D07B   0275

L_D07C:
        JSR     R5,     L_D09E                  ; D07C   0004 01D0 009E

L_D07F:
        MVI@    R4,     R2                      ; D07F   02A2
        MVI@    R2,     R0                      ; D080   0290
        MVO@    R0,     R5                      ; D081   0268
        DECR    R3                              ; D082   0013
        BNEQ    L_D07F                          ; D083   022C 0005

        MVI     G_01AF, R0                      ; D085   0280 01AF
        INCR    R0                              ; D087   0008
        CMP     G_01AE, R0                      ; D088   0340 01AE
        BLE     L_D08D                          ; D08A   0206 0001

        CLRR    R0                              ; D08C   01C0
L_D08D:
        MVO     R0,     G_01AF                  ; D08D   0240 01AF

L_D08F:
        JSR     R5,     L_D09E                  ; D08F   0004 01D0 009E

L_D092:
        MVI@    R5,     R0                      ; D092   02A8
        MVI@    R4,     R2                      ; D093   02A2
        MVO@    R0,     R2                      ; D094   0250
        DECR    R3                              ; D095   0013
        BNEQ    L_D092                          ; D096   022C 0005

        MVI     G_0194, R0                      ; D098   0280 0194
        TSTR    R0                              ; D09A   0080
        BEQ     L_D07C                          ; D09B   0224 0020
        PULR    R7                              ; D09D   02B7

L_D09E:
        PSHR    R5                              ; D09E   0275
        SDBD                                    ; D09F   0001
        MVII    #$000B, R3                      ; D0A0   02BB 000B 0000
        SDBD                                    ; D0A3   0001
        MVII    #$D0B0, R4                      ; D0A4   02BC 00B0 00D0
        MVII    #$01B0, R5                      ; D0A7   02BD 01B0
        MVI     G_01AF, R2                      ; D0A9   0282 01AF
        TSTR    R2                              ; D0AB   0092
        BEQ     L_D0AF                          ; D0AC   0204 0001

        ADDR    R3,     R5                      ; D0AE   00DD
L_D0AF:
        PULR    R7                              ; D0AF   02B7

        ANDR    R2,     R4                      ; D0B0   0194
        CMPR    R4,     R2                      ; D0B1   0162
        CMPR    R4,     R3                      ; D0B2   0163
        CMPR    R3,     R6                      ; D0B3   015E
        ANDR    R3,     R6                      ; D0B4   019E
        ANDR    R2,     R2                      ; D0B5   0192
        ANDR    R2,     R3                      ; D0B6   0193
        ANDR    R5,     R2                      ; D0B7   01AA
        ANDR    R5,     R3                      ; D0B8   01AB
        ANDR    R5,     R4                      ; D0B9   01AC
        ANDR    R0,     R2                      ; D0BA   0182
L_D0BB:
        PSHR    R5                              ; D0BB   0275
        MVI     G_015E, R0                      ; D0BC   0280 015E
        MOVR    R0,     R1                      ; D0BE   0081
        SLR     R1,     1                       ; D0BF   0061
        SDBD                                    ; D0C0   0001
        ADDI    #$D124, R1                      ; D0C1   02F9 0024 00D1
        MVI@    R1,     R5                      ; D0C4   028D
        SDBD                                    ; D0C5   0001
        MVII    #$08D6, R4                      ; D0C6   02BC 00D6 0008
        DECR    R0                              ; D0C9   0010
        BNEQ    L_D0CE                          ; D0CA   020C 0002

        ADDI    #$0090, R4                      ; D0CC   02FC 0090
L_D0CE:
        MVII    #$0004, R3                      ; D0CE   02BB 0004
L_D0D0:
        MVO@    R4,     R5                      ; D0D0   026C
        ADDI    #$0008, R4                      ; D0D1   02FC 0008
        DECR    R3                              ; D0D3   0013
        BNEQ    L_D0D0                          ; D0D4   022C 0005

        MVI     G_01AE, R0                      ; D0D6   0280 01AE
        MVII    #$01B0, R2                      ; D0D8   02BA 01B0
L_D0DA:
        ADD@    R2,     R3                      ; D0DA   02D3
        ADDI    #$000B, R2                      ; D0DB   02FA 000B
        DECR    R0                              ; D0DD   0010
        BPL     L_D0DA                          ; D0DE   0223 0005

        DECR    R3                              ; D0E0   0013
        BNEQ    L_D123                          ; D0E1   020C 0040

        MVO     R3,     G_015D                  ; D0E3   0243 015D
        MVO     R6,     G_015F                  ; D0E5   0246 015F
        SDBD                                    ; D0E7   0001
        MVII    #$DE3E, R0                      ; D0E8   02B8 003E 00DE
        MVO     R0,     G_035D                  ; D0EB   0240 035D

        JSR     R5,     L_FCD7                  ; D0ED   0004 01FC 00D7

        MVI     G_01AE, R0                      ; D0F0   0280 01AE
        DECR    R0                              ; D0F2   0010
        BMI     L_D123                          ; D0F3   020B 002E

        JSR     R5,     L_D09E                  ; D0F5   0004 01D0 009E

        ADDI    #$0005, R5                      ; D0F8   02FD 0005
        MVII    #$0192, R4                      ; D0FA   02BC 0192
        SDBD                                    ; D0FC   0001
        MVI@    R4,     R0                      ; D0FD   02A0
        MVO@    R0,     R5                      ; D0FE   0268
        SWAP    R0,     1                       ; D0FF   0040
        MVO@    R0,     R5                      ; D100   0268
        B       L_D11C                          ; D101   0200 0019

        PSHR    R5                              ; D103   0275
        MVI     G_01AF, R0                      ; D104   0280 01AF
        XORI    #$0001, R0                      ; D106   03F8 0001
        MVO     R0,     G_01AF                  ; D108   0240 01AF

        JSR     R5,     L_D09E                  ; D10A   0004 01D0 009E

        ADDI    #$0005, R5                      ; D10D   02FD 0005
        SDBD                                    ; D10F   0001
        MVI@    R5,     R0                      ; D110   02A8
        MVO     R0,     G_0192                  ; D111   0240 0192
        SWAP    R0,     1                       ; D113   0040
        MVO     R0,     G_0193                  ; D114   0240 0193

        JSR     R5,     L_5E1B                  ; D116   0004 015C 021B
        JSR     R5,     L_5D79                  ; D119   0004 015C 0179

L_D11C:
        SDBD                                    ; D11C   0001
        MVII    #$50AF, R1                      ; D11D   02B9 00AF 0050

        JSR     R5,     X_TIMER_START           ; D120   0004 0118 0044

L_D123:
        PULR    R7                              ; D123   02B7

        DECLE   $0247,  $02CA,  $02C2,  $0229   ; D124   0247 02CA 02C2 0229
        DECLE   $0003,  $0048,  $0065,  $0072   ; D128   0003 0048 0065 0072
        DECLE   $0065,  $0020,  $0062,  $0065   ; D12C   0065 0020 0062 0065
        DECLE   $0067,  $0079,  $006E,  $006E   ; D130   0067 0079 006E 006E
        DECLE   $0065,  $0074,  $0068,  $0020   ; D134   0065 0074 0068 0020
        DECLE   $0074,  $0068,  $0065,  $0000   ; D138   0074 0068 0065 0000
        DECLE   $0240,  $0003,  $0074,  $0061   ; D13C   0240 0003 0074 0061
        DECLE   $006C,  $0065,  $0073,  $0020   ; D140   006C 0065 0073 0020
        DECLE   $006F,  $0066,  $0020,  $0074   ; D144   006F 0066 0020 0074
        DECLE   $0068,  $0065,  $0000,  $0255   ; D148   0068 0065 0000 0255
        DECLE   $0003,  $006B,  $006E,  $0069   ; D14C   0003 006B 006E 0069
        DECLE   $0067,  $0068,  $0074,  $0073   ; D150   0067 0068 0074 0073
        DECLE   $0020,  $006F,  $0066,  $0000   ; D154   0020 006F 0066 0000
        DECLE   $029B,  $0006,  $002E,  $002E   ; D158   029B 0006 002E 002E
        DECLE   $002E,  $0000,  $02C9,  $0003   ; D15C   002E 0000 02C9 0003
        DECLE   $0020,  $0048,  $006F,  $0077   ; D160   0020 0048 006F 0077
        DECLE   $0020,  $006D,  $0061,  $006E   ; D164   0020 006D 0061 006E
        DECLE   $0079,  $0020,  $0070,  $006C   ; D168   0079 0020 0070 006C
        DECLE   $0061,  $0079,  $0065,  $0072   ; D16C   0061 0079 0065 0072
        DECLE   $0073,  $003F,  $0000,  $0000   ; D170   0073 003F 0000 0000

        PSHR    R5                              ; D174   0275
        MVI     G_01AE, R5                      ; D175   0285 01AE
        TSTR    R5                              ; D177   00AD
        BEQ     L_D17E                          ; D178   0204 0004

        CMP     G_01AF, R1                      ; D17A   0341 01AF
        BNEQ    L_D199                          ; D17C   020C 001B

L_D17E:
        MVI     G_015F, R0                      ; D17E   0280 015F
        TSTR    R0                              ; D180   0080
        BNEQ    L_D199                          ; D181   020C 0016

        MVI     G_018D, R1                      ; D183   0281 018D
        DECR    R1                              ; D185   0011
        BMI     L_D199                          ; D186   020B 0011

        INCR    R1                              ; D188   0009
        ADDR    R7,     R1                      ; D189   00F9
        ADD@    R1,     R7                      ; D18A   02CF

        NEGR    R0                              ; D18B   0020
        INCR    R6                              ; D18C   000E
        INCR    R7                              ; D18D   000F

        SLLC    R3,     1                       ; D18E   005B
L_D18F:
        INCR    R6                              ; D18F   000E
L_D190:
        DECR    R7                              ; D190   0017

        INCR    R6                              ; D191   000E
        SWAP    R2,     2                       ; D192   0046
        SAR     R0,     1                       ; D193   0068
        INCR    R6                              ; D194   000E
        INCR    R6                              ; D195   000E
L_D196:
        CLRR    R0                              ; D196   01C0
        MVO     R0,     G_018D                  ; D197   0240 018D
L_D199:
        PULR    R7                              ; D199   02B7

        JSR     R5,     L_591C                  ; D19A   0004 0158 011C
        JSR     R5,     L_FCA9                  ; D19D   0004 01FC 00A9

        B       L_D196                          ; D1A0   0220 000B

        MVII    #$003C, R0                      ; D1A2   02B8 003C
        MVO     R0,     G_0166                  ; D1A4   0240 0166

        JSR     R5,     L_FD4C                  ; D1A6   0004 01FC 014C

        B       L_D196                          ; D1A9   0220 0014

L_D1AB:
        MVII    #$00B4, R0                      ; D1AB   02B8 00B4

        JSR     R5,     X_RAND2                 ; D1AD   0004 0114 029E

        ADDI    #$0028, R0                      ; D1B0   02F8 0028
        MOVR    R0,     R1                      ; D1B2   0081
        MOVR    R0,     R2                      ; D1B3   0082
        ADDI    #$0200, R2                      ; D1B4   02FA 0200
        MVI@    R2,     R0                      ; D1B6   0290
        SWAP    R0,     1                       ; D1B7   0040
        ANDI    #$0080, R0                      ; D1B8   03B8 0080
        BNEQ    L_D1AB                          ; D1BA   022C 0010

        JSR     R5,     L_547A                  ; D1BC   0004 0154 007A

        SWAP    R0,     1                       ; D1BF   0040
        SWAP    R1,     1                       ; D1C0   0041
        MVII    #$031F, R4                      ; D1C1   02BC 031F
        MVO@    R0,     R4                      ; D1C3   0260
        MVO@    R1,     R4                      ; D1C4   0261
        ADDI    #$0006, R4                      ; D1C5   02FC 0006
        MVO@    R0,     R4                      ; D1C7   0260
        MVO@    R1,     R4                      ; D1C8   0261
        CLRR    R0                              ; D1C9   01C0
        MVO     R0,     G_0321                  ; D1CA   0240 0321

        JSR     R5,     L_F6E3                  ; D1CC   0004 01F4 02E3

        B       L_D196                          ; D1CF   0220 003A

        MVII    #$003C, R0                      ; D1D1   02B8 003C
        MVO     R0,     G_0165                  ; D1D3   0240 0165
        MVI     G_0172, R0                      ; D1D5   0280 0172
        ADDI    #$0003, R0                      ; D1D7   02F8 0003
        CMPI    #$000F, R0                      ; D1D9   0378 000F
        BLE     L_D1DF                          ; D1DB   0206 0002

        MVII    #$000F, R0                      ; D1DD   02B8 000F
L_D1DF:
        MVO     R0,     G_0172                  ; D1DF   0240 0172

        JSR     R5,     L_F74A                  ; D1E1   0004 01F4 034A

        B       L_D196                          ; D1E4   0220 004F

        MVI     G_0181, R0                      ; D1E6   0280 0181
        TSTR    R0                              ; D1E8   0080
        BEQ     L_D199                          ; D1E9   0224 0051

        SLL     R0,     1                       ; D1EB   0048
        MVO     R0,     G_0181                  ; D1EC   0240 0181

        JSR     R5,     L_F76A                  ; D1EE   0004 01F4 036A

        B       L_D196                          ; D1F1   0220 005C

        MVII    #$000A, R0                      ; D1F3   02B8 000A
        MVO     R0,     G_018D                  ; D1F5   0240 018D

        JSR     R5,     L_F75A                  ; D1F7   0004 01F4 035A

        PULR    R7                              ; D1FA   02B7

L_D1FB:
        PSHR    R5                              ; D1FB   0275
        MVI     G_01C6, R0                      ; D1FC   0280 01C6
        DECR    R0                              ; D1FE   0010
        BMI     L_D237                          ; D1FF   020B 0036

        MOVR    R0,     R3                      ; D201   0083
        SLL     R3,     2                       ; D202   004F
        SLL     R3,     1                       ; D203   004B
        ADD     G_01C7, R3                      ; D204   02C3 01C7
        MVI     G_015E, R4                      ; D206   0284 015E
        SDBD                                    ; D208   0001
        ADDI    #$D238, R4                      ; D209   02FC 0038 00D2
        SDBD                                    ; D20C   0001
        ADD@    R4,     R3                      ; D20D   02E3
        MVI     G_01AF, R1                      ; D20E   0281 01AF
        TSTR    R1                              ; D210   0089
        BEQ     L_D215                          ; D211   0204 0002

        MVII    #$0013, R1                      ; D213   02B9 0013
L_D215:
        ADDR    R0,     R1                      ; D215   00C1
        SDBD                                    ; D216   0001
        ADDI    #$D92E, R1                      ; D217   02F9 002E 00D9
        MVI@    R1,     R2                      ; D21A   028A
        SDBD                                    ; D21B   0001
        ADDI    #$D866, R2                      ; D21C   02FA 0066 00D8
        ADD     G_01C7, R2                      ; D21F   02C2 01C7
        MVI@    R2,     R5                      ; D221   0295
        MVO@    R5,     R3                      ; D222   025D
        ADDI    #$0002, R0                      ; D223   02F8 0002
        CMPI    #$0013, R0                      ; D225   0378 0013
        BLE     L_D235                          ; D227   0206 000C

        MVII    #$0001, R0                      ; D229   02B8 0001
        MVI     G_01C7, R1                      ; D22B   0281 01C7
        INCR    R1                              ; D22D   0009
        ANDI    #$0007, R1                      ; D22E   03B9 0007
        MVO     R1,     G_01C7                  ; D230   0241 01C7
        BNEQ    L_D235                          ; D232   020C 0001

        CLRR    R0                              ; D234   01C0
L_D235:
        MVO     R0,     G_01C6                  ; D235   0240 01C6
L_D237:
        PULR    R7                              ; D237   02B7

        DECLE   $0028,  $0039,  $00D8,  $0038   ; D238   0028 0039 00D8 0038
        DECLE   $00E0,  $0038,  $0000,  $0000   ; D23C   00E0 0038 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D240   0000 0000 0000 0000
        DECLE   $0002,  $0094,  $0090,  $0002   ; D244   0002 0094 0090 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; D248   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D24C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D250   0000 0000 0000 0001
        DECLE   $002A,  $0044,  $0000,  $0000   ; D254   002A 0044 0000 0000
        DECLE   $0001,  $0004,  $0002,  $0011   ; D258   0001 0004 0002 0011
        DECLE   $002A,  $0054,  $0001,  $0002   ; D25C   002A 0054 0001 0002
        DECLE   $0009,  $0004,  $000A,  $0051   ; D260   0009 0004 000A 0051
        DECLE   $00AA,  $0054,  $0005,  $0082   ; D264   00AA 0054 0005 0082
        DECLE   $0009,  $0044,  $008A,  $0051   ; D268   0009 0044 008A 0051
        DECLE   $00AA,  $0054,  $0008,  $0014   ; D26C   00AA 0054 0008 0014
        DECLE   $00AA,  $0055,  $00AB,  $0052   ; D270   00AA 0055 00AB 0052
        DECLE   $006D,  $0092,  $0002,  $0045   ; D274   006D 0092 0002 0045
        DECLE   $00AA,  $005D,  $0067,  $00BA   ; D278   00AA 005D 0067 00BA
        DECLE   $0055,  $0022,  $0010,  $002A   ; D27C   0055 0022 0010 002A
        DECLE   $0054,  $00AA,  $0055,  $00B6   ; D280   0054 00AA 0055 00B6
        DECLE   $005A,  $0085,  $0040,  $0080   ; D284   005A 0085 0040 0080
        DECLE   $0040,  $00A8,  $0050,  $002A   ; D288   0040 00A8 0050 002A
        DECLE   $0055,  $002A,  $00AA,  $00FE   ; D28C   0055 002A 00AA 00FE
        DECLE   $00EE,  $00D6,  $00BA,  $00EE   ; D290   00EE 00D6 00BA 00EE
        DECLE   $00C6,  $0092,  $0054,  $007C   ; D294   00C6 0092 0054 007C
        DECLE   $006D,  $0055,  $006D,  $007D   ; D298   006D 0055 006D 007D
        DECLE   $00AA,  $00AA,  $00BA,  $00FE   ; D29C   00AA 00AA 00BA 00FE
        DECLE   $0055,  $0055,  $00FF,  $00FF   ; D2A0   0055 0055 00FF 00FF
        DECLE   $00AA,  $00AA,  $0054,  $007C   ; D2A4   00AA 00AA 0054 007C
        DECLE   $006C,  $0054,  $006C,  $007C   ; D2A8   006C 0054 006C 007C
        DECLE   $00AA,  $00AA,  $0000,  $0000   ; D2AC   00AA 00AA 0000 0000

        INCR    R2                              ; D2B0   000A
        INCR    R2                              ; D2B1   000A
        INCR    R7                              ; D2B2   000F
        INCR    R7                              ; D2B3   000F

L_D2B4:
        SETC                                    ; D2B4   0007
L_D2B5:
        DIS                                     ; D2B5   0003
        DECLE   $00FF,  $00FF                   ; D2B6   00FF 00FF

        ADDR    R2,     R7                      ; D2B8   00D7

        MOVR    R5,     R3                      ; D2B9   00AB
        ADDR    R7,     R6                      ; D2BA   00FE
        ADDR    R2,     R7                      ; D2BB   00D7
        ADDR    R2,     R7                      ; D2BC   00D7
        ADDR    R2,     R7                      ; D2BD   00D7

        DECLE   $00FF,  $00D7,  $00BB,  $006D   ; D2BE   00FF 00D7 00BB 006D
        DECLE   $00C6,  $0083,  $0001,  $0049   ; D2C2   00C6 0083 0001 0049
        DECLE   $00FE,  $00FE,  $00D6,  $00AA   ; D2C6   00FE 00FE 00D6 00AA
        DECLE   $00FF                           ; D2CA   00FF

        ADDR    R2,     R7                      ; D2CB   00D7
        ADDR    R2,     R7                      ; D2CC   00D7
        ADDR    R2,     R7                      ; D2CD   00D7

        DECLE   $0000,  $0000,  $00A0,  $00A0   ; D2CE   0000 0000 00A0 00A0
        DECLE   $00E0,  $00E0,  $00C0,  $0080   ; D2D2   00E0 00E0 00C0 0080
        DECLE   $0003,  $0003,  $0003,  $0003   ; D2D6   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0000   ; D2DA   0003 0003 0003 0000
        DECLE   $00B5,  $0049,  $0003,  $0049   ; D2DE   00B5 0049 0003 0049
        DECLE   $00B5,  $0049,  $0001,  $0000   ; D2E2   00B5 0049 0001 0000

        ADDR    R2,     R7                      ; D2E6   00D7
        ADDR    R2,     R7                      ; D2E7   00D7

        DECLE   $00FF                           ; D2E8   00FF

        MOVR    R5,     R3                      ; D2E9   00AB
        ADDR    R2,     R7                      ; D2EA   00D7

        DECLE   $00FF,  $00FF,  $0000,  $0080   ; D2EB   00FF 00FF 0000 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; D2EF   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0000,  $0054   ; D2F3   0080 0080 0000 0054
        DECLE   $0054,  $0074,  $0038,  $0038   ; D2F7   0054 0074 0038 0038
        DECLE   $007C,  $00D6,  $0000,  $0044   ; D2FB   007C 00D6 0000 0044
        DECLE   $0044,  $0028,  $0038,  $0030   ; D2FF   0044 0028 0038 0030
        DECLE   $0038,  $006E,  $0000,  $00AA   ; D303   0038 006E 0000 00AA
        DECLE   $00AA,  $00AA,  $00CA,  $004A   ; D307   00AA 00AA 00CA 004A
        DECLE   $006A,  $00FB,  $0000,  $0000   ; D30B   006A 00FB 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D30F   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0002,  $0000   ; D313   0000 0001 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D317   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0015   ; D31B   0000 0000 0080 0015
        DECLE   $001A,  $0010,  $0028,  $0054   ; D31F   001A 0010 0028 0054
        DECLE   $00AA,  $0055,  $00AA,  $001A   ; D323   00AA 0055 00AA 001A
        DECLE   $0015,  $0010,  $0028,  $0054   ; D327   0015 0010 0028 0054
        DECLE   $00AA,  $0055,  $00AA,  $0000   ; D32B   00AA 0055 00AA 0000
        DECLE   $0000,  $001A,  $0014,  $0010   ; D32F   0000 001A 0014 0010
        DECLE   $0028,  $0054,  $00AA,  $0000   ; D333   0028 0054 00AA 0000
        DECLE   $0000,  $0014,  $001A,  $0010   ; D337   0000 0014 001A 0010
        DECLE   $0028,  $0054,  $00AA,  $00FF   ; D33B   0028 0054 00AA 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D33F   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $003C,  $003C,  $00FF   ; D343   00FF 003C 003C 00FF
        DECLE   $00FF,  $00FF,  $007E,  $007E   ; D347   00FF 00FF 007E 007E
        DECLE   $00FF,  $0024,  $0024,  $00FF   ; D34B   00FF 0024 0024 00FF
        DECLE   $00FF,  $00FF,  $0042,  $0042   ; D34F   00FF 00FF 0042 0042
        DECLE   $00FF,  $0024,  $0024,  $0024   ; D353   00FF 0024 0024 0024
        DECLE   $0024,  $00FF,  $0042,  $0042   ; D357   0024 00FF 0042 0042
        DECLE   $00FF,  $0024,  $0024,  $0066   ; D35B   00FF 0024 0024 0066
        DECLE   $0066,  $00FF,  $0042,  $0042   ; D35F   0066 00FF 0042 0042
        DECLE   $00FF,  $0024,  $0024,  $0024   ; D363   00FF 0024 0024 0024
        DECLE   $003C,  $00FF,  $007E,  $007E   ; D367   003C 00FF 007E 007E
        DECLE   $00FF,  $007E,  $0042,  $0055   ; D36B   00FF 007E 0042 0055
        DECLE   $0055,  $0055,  $0055,  $0055   ; D36F   0055 0055 0055 0055
        DECLE   $0055,  $0055,  $0055,  $0024   ; D373   0055 0055 0055 0024
        DECLE   $0027,  $00FD,  $001D,  $0015   ; D377   0027 00FD 001D 0015
        DECLE   $00F5,  $0055,  $0055,  $0024   ; D37B   00F5 0055 0055 0024
        DECLE   $0064,  $005F,  $005C,  $0054   ; D37F   0064 005F 005C 0054
        DECLE   $0057,  $0055,  $0055,  $0000   ; D383   0057 0055 0055 0000
        DECLE   $0055,  $0000,  $0055,  $0055   ; D387   0055 0000 0055 0055
        DECLE   $0055,  $0055,  $0055,  $0081   ; D38B   0055 0055 0055 0081
        DECLE   $0000,  $0066,  $0066,  $0000   ; D38F   0000 0066 0066 0000
        DECLE   $00BD,  $00BD,  $00C3,  $0081   ; D393   00BD 00BD 00C3 0081
        DECLE   $0000,  $0066,  $0066,  $0000   ; D397   0000 0066 0066 0000
        DECLE   $00BD,  $00C3,  $00FF,  $0000   ; D39B   00BD 00C3 00FF 0000
        DECLE   $0003,  $0007,  $000F,  $000F   ; D39F   0003 0007 000F 000F
        DECLE   $001F,  $001F,  $003F,  $0000   ; D3A3   001F 001F 003F 0000
        DECLE   $0000,  $0038,  $0031,  $0023   ; D3A7   0000 0038 0031 0023
        DECLE   $0007,  $000F,  $001F,  $003F   ; D3AB   0007 000F 001F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; D3AF   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $00FC   ; D3B3   003F 003F 003F 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; D3B7   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $0000   ; D3BB   00FC 00FC 00FC 0000
        DECLE   $0000,  $001C,  $008C,  $00C4   ; D3BF   0000 001C 008C 00C4
        DECLE   $00E0,  $00F0,  $00F8,  $0000   ; D3C3   00E0 00F0 00F8 0000
        DECLE   $00C0,  $00E0,  $00F0,  $00F0   ; D3C7   00C0 00E0 00F0 00F0
        DECLE   $00F8,  $00F8,  $00FC,  $0000   ; D3CB   00F8 00F8 00FC 0000
        DECLE   $0000,  $0066,  $00FF,  $00FF   ; D3CF   0000 0066 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FB   ; D3D3   00FF 00FF 00FF 00FB
        DECLE   $00FB,  $00F5,  $00F5,  $00ED   ; D3D7   00FB 00F5 00F5 00ED
        DECLE   $00ED,  $00F3,  $00FF,  $00F8   ; D3DB   00ED 00F3 00FF 00F8
        DECLE   $00F8,  $00FB,  $00EB,  $00F3   ; D3DF   00F8 00FB 00EB 00F3
        DECLE   $00F3,  $00F3,  $00FB,  $00AA   ; D3E3   00F3 00F3 00FB 00AA
        DECLE   $0055,  $00AA,  $0055,  $00AA   ; D3E7   0055 00AA 0055 00AA
        DECLE   $0055,  $00AA,  $0055,  $00FF   ; D3EB   0055 00AA 0055 00FF
        DECLE   $007F,  $00BF                   ; D3EF   007F 00BF

        SLLC    R3,     2                       ; D3F1   005F
        MOVR    R5,     R7                      ; D3F2   00AF

        DECLE   $0057,  $00AB,  $0055,  $00FE   ; D3F3   0057 00AB 0055 00FE
        DECLE   $00FD,  $00FA,  $00F5,  $00EA   ; D3F7   00FD 00FA 00F5 00EA
        DECLE   $00D5,  $00AA,  $0055,  $00BB   ; D3FB   00D5 00AA 0055 00BB
        DECLE   $00FF,  $00FB,  $00FF,  $00FF   ; D3FF   00FF 00FB 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00BB   ; D403   00FF 00FF 00FF 00BB
        DECLE   $00FB,  $00FF,  $00FB,  $00FF   ; D407   00FB 00FF 00FB 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; D40B   00FF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; D40F   0000 0000 0000 0018
        DECLE   $0024,  $0024,  $0018,  $0000   ; D413   0024 0024 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D417   0000 0000 0000 0000
        DECLE   $00FE,  $00AA,  $00AA,  $0000   ; D41B   00FE 00AA 00AA 0000
        DECLE   $007C,  $007C,  $007C,  $0038   ; D41F   007C 007C 007C 0038
        DECLE   $0010,  $0010,  $0038,  $0000   ; D423   0010 0010 0038 0000
        DECLE   $0000,  $0000,  $0040,  $00A1   ; D427   0000 0000 0040 00A1
        DECLE   $007F,  $003E,  $001C,  $0000   ; D42B   007F 003E 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; D42F   0000 0000 0000 0010
        DECLE   $0028,  $0054,  $00AA,  $0000   ; D433   0028 0054 00AA 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; D437   0000 0000 0000 0008
        DECLE   $005D,  $007F,  $007F,  $0000   ; D43B   005D 007F 007F 0000
        DECLE   $0000,  $000C,  $000C,  $004C   ; D43F   0000 000C 000C 004C
        DECLE   $00AC,  $00AC,  $007F,  $0054   ; D443   00AC 00AC 007F 0054
        DECLE   $0082,  $0051,  $000A,  $0004   ; D447   0082 0051 000A 0004
        DECLE   $000E,  $0004,  $0004,  $0010   ; D44B   000E 0004 0004 0010
        DECLE   $0028,  $0044,  $0028,  $0010   ; D44F   0028 0044 0028 0010
        DECLE   $0010,  $0018,  $001C,  $0000   ; D453   0010 0018 001C 0000
        DECLE   $007E,  $0076,  $0076,  $0076   ; D457   007E 0076 0076 0076
        DECLE   $0076,  $007E,  $0000,  $0000   ; D45B   0076 007E 0000 0000
        DECLE   $007C,  $003C,  $003C,  $003C   ; D45F   007C 003C 003C 003C
        DECLE   $003C,  $007E,  $0000,  $0000   ; D463   003C 007E 0000 0000
        DECLE   $007E,  $004E,  $000E,  $007E   ; D467   007E 004E 000E 007E
        DECLE   $0070,  $007E,  $0000,  $0000   ; D46B   0070 007E 0000 0000
        DECLE   $007E,  $004E,  $001C,  $000E   ; D46F   007E 004E 001C 000E
        DECLE   $004E,  $007E,  $0000,  $0000   ; D473   004E 007E 0000 0000
        DECLE   $001C,  $003C,  $005C,  $007E   ; D477   001C 003C 005C 007E
        DECLE   $001C,  $003E,  $0000,  $0000   ; D47B   001C 003E 0000 0000
        DECLE   $007E,  $0070,  $007E,  $000E   ; D47F   007E 0070 007E 000E
        DECLE   $004E,  $007E,  $0000,  $0000   ; D483   004E 007E 0000 0000
        DECLE   $007E,  $0070,  $007E,  $0076   ; D487   007E 0070 007E 0076
        DECLE   $0076,  $007E,  $0000,  $0000   ; D48B   0076 007E 0000 0000
        DECLE   $007E,  $004E,  $001C,  $0038   ; D48F   007E 004E 001C 0038
        DECLE   $0038,  $0038,  $0000,  $0000   ; D493   0038 0038 0000 0000
        DECLE   $007E,  $0076,  $003C,  $0076   ; D497   007E 0076 003C 0076
        DECLE   $0076,  $007E,  $0000,  $0000   ; D49B   0076 007E 0000 0000
        DECLE   $007E,  $004E,  $004E,  $007E   ; D49F   007E 004E 004E 007E
        DECLE   $000E,  $007E,  $0000,  $0000   ; D4A3   000E 007E 0000 0000
        DECLE   $0000,  $0002,  $000A,  $00EA   ; D4A7   0000 0002 000A 00EA
        DECLE   $004E,  $004A,  $0000,  $0000   ; D4AB   004E 004A 0000 0000

        INCR    R7                              ; D4AF   000F

        ADDR    R4,     R6                      ; D4B0   00E6
L_D4B1:
        MOVR    R0,     R7                      ; D4B1   0087

        ADDR    R0,     R6                      ; D4B2   00C6
        MOVR    R0,     R6                      ; D4B3   0086
        ADDR    R5,     R7                      ; D4B4   00EF

        DECLE   $0000,  $0000                   ; D4B5   0000 0000

        ADDR    R3,     R4                      ; D4B7   00DC
        SLL     R2,     2                       ; D4B8   004E
        INCR    R7                              ; D4B9   000F

        INCR    R5                              ; D4BA   000D
L_D4BB:
        SLL     R0,     2                       ; D4BB   004C
        DECLE   $00DC,  $0000,  $0000,  $0000   ; D4BC   00DC 0000 0000 0000
        DECLE   $00C0,  $00DE,  $00CD,  $00CD   ; D4C0   00C0 00DE 00CD 00CD
        DECLE   $00DE,  $0000                   ; D4C4   00DE 0000
.GFX_LIST_D4C6:
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D4C6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; D4CA   00FF 00FF 00FF 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D4CE   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FD   ; D4D2   00FF 00FF 00FE 00FD
        DECLE   $002A,  $005D,  $00F6,  $00FF   ; D4D6   002A 005D 00F6 00FF
        DECLE   $00FF,  $00FF,  $006E,  $00D5   ; D4DA   00FF 00FF 006E 00D5
        DECLE   $0090,  $00D2,  $00B0,  $0086   ; D4DE   0090 00D2 00B0 0086
        DECLE   $00D0,  $00C4,  $00D0,  $00F6   ; D4E2   00D0 00C4 00D0 00F6
        DECLE   $0055,  $0001,  $0011,  $0029   ; D4E6   0055 0001 0011 0029
        DECLE   $0045,  $0011,  $0039,  $006D   ; D4EA   0045 0011 0039 006D
        DECLE   $00AB,  $0083,  $0092,  $00AA   ; D4EE   00AB 0083 0092 00AA
        DECLE   $0092,  $0082,  $0055,  $0055   ; D4F2   0092 0082 0055 0055
        DECLE   $0045,  $0001,  $00AA,  $00AA   ; D4F6   0045 0001 00AA 00AA
        DECLE   $0000,  $0000,  $0055,  $0055   ; D4FA   0000 0000 0055 0055
        DECLE   $00AB,  $0083,  $0093,  $00AB   ; D4FE   00AB 0083 0093 00AB
        DECLE   $0093,  $0083,  $0055,  $0055   ; D502   0093 0083 0055 0055
        DECLE   $00FF,  $00FF,  $00F5,  $00F5   ; D506   00FF 00FF 00F5 00F5
        DECLE   $00F0,  $00F0,  $00F8,  $00FC   ; D50A   00F0 00F0 00F8 00FC
        DECLE   $0001,  $0001,  $0029,  $0055   ; D50E   0001 0001 0029 0055
        DECLE   $0000,  $0028,  $0028,  $0028   ; D512   0000 0028 0028 0028
        DECLE   $00FF,  $00FF,  $005F,  $005F   ; D516   00FF 00FF 005F 005F
        DECLE   $001F,  $001F,  $003F,  $007F   ; D51A   001F 001F 003F 007F
        DECLE   $0000,  $0000,  $0028,  $0054   ; D51E   0000 0000 0028 0054
        DECLE   $0001,  $0028,  $0028,  $0028   ; D522   0001 0028 0028 0028
        DECLE   $0000,  $0028,  $0044,  $0092   ; D526   0000 0028 0044 0092
        DECLE   $0039,  $007C,  $00FE,  $00B6   ; D52A   0039 007C 00FE 00B6
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D52E   00FF 00FF 00FF 00FF
        DECLE   $007F,  $00BF                   ; D532   007F 00BF

        ADCR    R7                              ; D534   002F

        MOVR    R5,     R3                      ; D535   00AB
L_D536:
        RLC     R0,     1                       ; D536   0050
        ADDR    R5,     R2                      ; D537   00EA
        ADDR    R7,     R4                      ; D538   00FC
        ADDR    R5,     R2                      ; D539   00EA
        ADDR    R3,     R7                      ; D53A   00DF

        DECLE   $00FD,  $00FF,  $00FF,  $00FF   ; D53B   00FD 00FF 00FF 00FF
        DECLE   $00FB,  $00FE,  $00FD,  $00F4   ; D53F   00FB 00FE 00FD 00F4
        DECLE   $00BA,  $00E4,  $00D0,  $00A8   ; D543   00BA 00E4 00D0 00A8
        DECLE   $00C0,  $0060,  $00D0,  $00E0   ; D547   00C0 0060 00D0 00E0
        DECLE   $00C0,  $0060,  $00C8,  $0060   ; D54B   00C0 0060 00C8 0060
        DECLE   $0090,  $0081,  $006A,  $0090   ; D54F   0090 0081 006A 0090
        DECLE   $0099,  $006D,  $000B,  $00BA   ; D553   0099 006D 000B 00BA
        DECLE   $00EC,  $00E8,  $00A2,  $0080   ; D557   00EC 00E8 00A2 0080
        DECLE   $0028,  $0080,  $0000,  $00FF   ; D55B   0028 0080 0000 00FF
        DECLE   $00FD,  $00FA,  $00EC,  $00F8   ; D55F   00FD 00FA 00EC 00F8
        DECLE   $00F0,  $00F2,  $00E0,  $00FF   ; D563   00F0 00F2 00E0 00FF
        DECLE   $00FF                           ; D567   00FF

        ADDR    R7,     R3                      ; D568   00FB
        ADDR    R5,     R7                      ; D569   00EF

        DECLE   $00B7,  $0092,  $0010,  $0082   ; D56A   00B7 0092 0010 0082
        DECLE   $0000,  $0080,  $0080,  $0080   ; D56E   0000 0080 0080 0080
        DECLE   $00C0,  $00C0,  $00F0,  $00FC   ; D572   00C0 00C0 00F0 00FC
        DECLE   $0000,  $0000,  $0080,  $0040   ; D576   0000 0000 0080 0040
        DECLE   $00A0,  $0088,  $00E0,  $00FA   ; D57A   00A0 0088 00E0 00FA
        DECLE   $00FF                           ; D57E   00FF

        SARC    R3,     2                       ; D57F   007F
        TSTR    R5                              ; D580   00AD
        RSWD    R3                              ; D581   003B
        SLLC    R3,     2                       ; D582   005F
L_D583:
        DECR    R7                              ; D583   0017
        INCR    R7                              ; D584   000F

        NEGR    R5                              ; D585   0025
L_D586:
        ADDR    R5,     R0                      ; D586   00E8
        DECLE   $00E0,  $00B0,  $00E0,  $00E8   ; D587   00E0 00B0 00E0 00E8
        DECLE   $00F0,  $00F0,  $00F8,  $0048   ; D58B   00F0 00F0 00F8 0048
        DECLE   $00B5,  $00DE,  $00FF           ; D58F   00B5 00DE 00FF

        ADDR    R5,     R7                      ; D592   00EF
        ADDR    R2,     R7                      ; D593   00D7

        DECLE   $007D,  $00FF,  $0003,  $000E   ; D594   007D 00FF 0003 000E
        DECLE   $003C,  $0078,  $0058,  $00F8   ; D598   003C 0078 0058 00F8
        DECLE   $00BC,  $00EE,  $007F,  $00BE   ; D59C   00BC 00EE 007F 00BE
        DECLE   $00EB,  $00FF,  $00F7,  $00EB   ; D5A0   00EB 00FF 00F7 00EB
        DECLE   $00BE,  $00FF,  $00FF,  $00FF   ; D5A4   00BE 00FF 00FF 00FF

        ADDR    R4,     R5                      ; D5A8   00E5
        ADDR    R5,     R3                      ; D5A9   00EB
        ADDR    R5,     R7                      ; D5AA   00EF
        ADDR    R2,     R7                      ; D5AB   00D7

        DECLE   $00AB,  $0055,  $00FF,  $00FF   ; D5AC   00AB 0055 00FF 00FF

        ADDR    R5,     R3                      ; D5B0   00EB
        ADDR    R4,     R5                      ; D5B1   00E5
        ADDR    R5,     R7                      ; D5B2   00EF
        ADDR    R2,     R7                      ; D5B3   00D7

        MOVR    R5,     R3                      ; D5B4   00AB
        RLC     R1,     2                       ; D5B5   0055
        ADDR    R5,     R2                      ; D5B6   00EA
        ADDR    R4,     R5                      ; D5B7   00E5
        ADDR    R5,     R7                      ; D5B8   00EF
        ADDR    R2,     R7                      ; D5B9   00D7

        MOVR    R5,     R3                      ; D5BA   00AB
        RLC     R1,     2                       ; D5BB   0055
        MOVR    R5,     R2                      ; D5BC   00AA
        RLC     R1,     2                       ; D5BD   0055
        ADDR    R4,     R5                      ; D5BE   00E5
        ADDR    R5,     R2                      ; D5BF   00EA
        ADDR    R5,     R7                      ; D5C0   00EF
        ADDR    R2,     R7                      ; D5C1   00D7

        DECLE   $00AB,  $0055,  $00AA,  $0055   ; D5C2   00AB 0055 00AA 0055
        DECLE   $00FF,  $00FF                   ; D5C6   00FF 00FF

        ADDR    R1,     R7                      ; D5C8   00CF
        MOVR    R0,     R7                      ; D5C9   0087
        ADDR    R0,     R7                      ; D5CA   00C7

        DECLE   $00F3,  $00FF,  $00FF,  $003F   ; D5CB   00F3 00FF 00FF 003F
        DECLE   $000D,  $002B,  $0007,  $0002   ; D5CF   000D 002B 0007 0002
        DECLE   $0003,  $0005,  $0000,  $00F4   ; D5D3   0003 0005 0000 00F4
        DECLE   $00F9,  $00FC,  $00FC,  $00FA   ; D5D7   00F9 00FC 00FC 00FA
        DECLE   $00FE,  $00FD,  $00FE,  $00FF   ; D5DB   00FE 00FD 00FE 00FF
        DECLE   $005E,  $003D,  $00B7,  $007F   ; D5DF   005E 003D 00B7 007F
        DECLE   $002B,  $005D,  $00BF,  $0000   ; D5E3   002B 005D 00BF 0000
        DECLE   $0040,  $0080,  $00C8,  $00B0   ; D5E7   0040 0080 00C8 00B0
        DECLE   $00F9,  $00EC,  $00BE,  $0024   ; D5EB   00F9 00EC 00BE 0024
        DECLE   $0024,  $00FF,  $0042,  $0042   ; D5EF   0024 00FF 0042 0042
        DECLE   $00FF,  $0024,  $0024,  $0024   ; D5F3   00FF 0024 0024 0024
        DECLE   $003C,  $00FF,  $007E,  $007E   ; D5F7   003C 00FF 007E 007E
        DECLE   $00FF,  $007E,  $0042,  $0000   ; D5FB   00FF 007E 0042 0000
        DECLE   $0000,  $0066,  $00FF,  $00FF   ; D5FF   0000 0066 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D603   00FF 00FF 00FF 00FF
        DECLE   $007F,  $00BF                   ; D607   007F 00BF

        SLLC    R3,     2                       ; D609   005F
        MOVR    R5,     R7                      ; D60A   00AF

        DECLE   $0057,  $00AB,  $0055,  $00FE   ; D60B   0057 00AB 0055 00FE
        DECLE   $00FD,  $00FA,  $00F5,  $00EA   ; D60F   00FD 00FA 00F5 00EA
        DECLE   $00D5,  $00AA,  $0055,  $00BD   ; D613   00D5 00AA 0055 00BD
        DECLE   $00C3,  $0001                   ; D617   00C3 0001

        EIS                                     ; D619   0002

        JSR     R4,     .EXEC.424               ; D61A   0004 0014 0024
        DECLE   $0022,  $0080,  $007F,  $00FE   ; D61D   0022 0080 007F 00FE
        DECLE   $00FD,  $00FF,  $00FF,  $00FF   ; D621   00FD 00FF 00FF 00FF
        DECLE   $00FF,  $00F0,  $00F0,  $00F0   ; D625   00FF 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; D629   00F0 00F0 00F0 00F0
        DECLE   $00F0,  $0024,  $007C,  $00E4   ; D62D   00F0 0024 007C 00E4
        DECLE   $00BA,  $00BC,  $00A4,  $00AC   ; D631   00BA 00BC 00A4 00AC
        DECLE   $00BA,  $00FF,  $00FF,  $00FF   ; D635   00BA 00FF 00FF 00FF
        DECLE   $00FE,  $00FC,  $00F8,  $00F0   ; D639   00FE 00FC 00F8 00F0
        DECLE   $00E0,  $00C0,  $00F0,  $00F0   ; D63D   00E0 00C0 00F0 00F0
        DECLE   $00F8,  $00F8,  $00FC,  $00FE   ; D641   00F8 00F8 00FC 00FE
        DECLE   $00FE,  $0084,  $00B4,  $00A2   ; D645   00FE 0084 00B4 00A2
        DECLE   $00B9,  $00B9,  $00A1,  $00AD   ; D649   00B9 00B9 00A1 00AD
        DECLE   $00B9,  $00FF,  $00FF,  $00F8   ; D64D   00B9 00FF 00FF 00F8
        DECLE   $00E2,  $00CA,  $0086,  $009C   ; D651   00E2 00CA 0086 009C
        DECLE   $00E1,  $00FF,  $00FF,  $001F   ; D655   00E1 00FF 00FF 001F
        DECLE   $0047,  $0053,  $0063,  $0039   ; D659   0047 0053 0063 0039
        DECLE   $0081,  $00C0,  $0020,  $0020   ; D65D   0081 00C0 0020 0020
        DECLE   $00D0,  $0091,  $0095,  $00CD   ; D661   00D0 0091 0095 00CD
        DECLE   $00F2,  $0000                   ; D665   00F2 0000

        TSTR    R0                              ; D667   0080
        ADDR    R0,     R0                      ; D668   00C0
        ADDR    R6,     R0                      ; D669   00F0
        ADDR    R7,     R0                      ; D66A   00F8
        SARC    R1,     1                       ; D66B   0079
        GSWD    R1                              ; D66C   0031
        ADDR    R0,     R7                      ; D66D   00C7

        DECLE   $0025,  $0019,  $0003,  $000F   ; D66E   0025 0019 0003 000F
        DECLE   $0006,  $0000,  $0000,  $0001   ; D672   0006 0000 0000 0001
        DECLE   $0001,  $0000,  $0002,  $0001   ; D676   0001 0000 0002 0001
        DECLE   $0003,  $0001,  $0005,  $0003   ; D67A   0003 0001 0005 0003
        DECLE   $0080,  $0000,  $0040,  $0080   ; D67E   0080 0000 0040 0080
        DECLE   $00C0,  $0080,  $0040,  $0000   ; D682   00C0 0080 0040 0000
        DECLE   $0080,  $00C0,  $00C0,  $00F0   ; D686   0080 00C0 00C0 00F0
        DECLE   $00F0,  $00F8,  $00F8,  $00FE   ; D68A   00F0 00F8 00F8 00FE
        DECLE   $00FF,  $00FC,  $00F8,  $00F8   ; D68E   00FF 00FC 00F8 00F8
        DECLE   $00F8,  $00F0,  $0080,  $0000   ; D692   00F8 00F0 0080 0000
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; D696   00F3 00F3 00F3 00F3
        DECLE   $00F3,  $00F3,  $00F3,  $00F3   ; D69A   00F3 00F3 00F3 00F3
        DECLE   $0000                           ; D69E   0000

        INCR    R7                              ; D69F   000F

        ADDR    R5,     R6                      ; D6A0   00EE
L_D6A1:
        ADDR    R3,     R5                      ; D6A1   00DD
        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; D6A2   00BF 00FF 00FF 00FF
        DECLE   $0001                           ; D6A6   0001

        DIS                                     ; D6A7   0003
        SETC                                    ; D6A8   0007
        SETC                                    ; D6A9   0007
        INCR    R7                              ; D6AA   000F

        DECLE   $001F                           ; D6AB   001F
L_D6AC:
        SARC    R3,     2                       ; D6AC   007F
        DECLE   $00FF                           ; D6AD   00FF

        ADDR    R4,     R3                      ; D6AE   00E3
        ADDR    R4,     R7                      ; D6AF   00E7

        DECLE   $00E6,  $00C6,  $00C6,  $00CE   ; D6B0   00E6 00C6 00C6 00CE
        DECLE   $0098,  $0098,  $0081,  $00B9   ; D6B4   0098 0098 0081 00B9
        DECLE   $00A1,  $00BB,  $00B9,  $00A1   ; D6B8   00A1 00BB 00B9 00A1
        DECLE   $00AD,  $00B9,  $00FF,  $00FF   ; D6BC   00AD 00B9 00FF 00FF

        DECR    R0                              ; D6C0   0010
        MOVR    R5,     R3                      ; D6C1   00AB
        MOVR    R5,     R1                      ; D6C2   00A9
        ADDR    R5,     R7                      ; D6C3   00EF

        DECLE   $0000,  $00FF                   ; D6C4   0000 00FF
        DECLE   $0009,  $0089,  $0089,  $0081   ; D6C6  CART PIC #40
        DECLE   $0089,  $0089,  $0009,  $00FF   ; D6CA  
        DECLE   $0080,  $00C6,  $00C5,  $00C1   ; D6CE  CART PIC #41
        DECLE   $00C5,  $00C6,  $0080,  $00FF   ; D6D2  
        DECLE   $0003,  $0089,  $0089,  $0089   ; D6D6  CART PIC #42
        DECLE   $0089,  $0089,  $0003,  $00FF   ; D6DA  
        DECLE   $00FA,  $00FA,  $00FA,  $00FA   ; D6DE  CART PIC #43
        DECLE   $00FA,  $00F4,  $00E8,  $00FF   ; D6E2  
        DECLE   $00E0,  $00D3,  $00A7,  $0046   ; D6E6  CART PIC #44
        DECLE   $0044,  $0045,  $0044,  $0046   ; D6EA  
        DECLE   $0003,  $00F9,  $00FC,  $007E   ; D6EE  CART PIC #45
        DECLE   $00FE,  $00FE,  $00FC,  $0079   ; D6F2  
        DECLE   $003F,  $003F,  $003F,  $003F   ; D6F6  CART PIC #46
        DECLE   $003F,  $001F,  $000F,  $00FF   ; D6FA  
        DECLE   $0000,  $0034,  $007A,  $007A   ; D6FE  CART PIC #47
        DECLE   $00FA,  $00FA,  $00FA,  $00FA   ; D702  
        DECLE   $0019,  $0089,  $0081,  $0081   ; D706  CART PIC #48
        DECLE   $0091,  $0099,  $000D,  $00FF   ; D70A  
        DECLE   $0001,  $0019,  $003D,  $003D   ; D70E  CART PIC #49
        DECLE   $003F,  $003F,  $003F,  $003F   ; D712  
        DECLE   $0001,  $008D,  $008B,  $0083   ; D716  CART PIC #4A
        DECLE   $008B,  $008D,  $0001,  $00FF   ; D71A  
        DECLE   $00E0,  $00C0,  $00C4,  $00C4   ; D71E  CART PIC #4B
        DECLE   $00C0,  $00C4,  $0084,  $00FF   ; D722  
        DECLE   $0003,  $00FF,  $00FE,  $00FE   ; D726  CART PIC #4C
        DECLE   $00FC,  $00F9,  $0003,  $00FF   ; D72A  
        DECLE   $0047,  $0047,  $0047,  $0047   ; D72E  CART PIC #4D
        DECLE   $00A7,  $00D3,  $00E0,  $00FF   ; D732  
        DECLE   $0009,  $0089,  $0089,  $0089   ; D736  CART PIC #4E
        DECLE   $0089,  $0089,  $00C3,  $00FF   ; D73A  
        DECLE   $0083,  $00C7,  $00C7,  $00C7   ; D73E  CART PIC #4F
        DECLE   $00C7,  $00C6,  $0080,  $00FF   ; D742  
        DECLE   $0080,  $008C,  $008F,  $0080   ; D746  CART PIC #50
        DECLE   $00F8,  $0098,  $0080,  $00FF   ; D74A  
        DECLE   $0080,  $00A2,  $00E3,  $00E3   ; D74E  CART PIC #51
        DECLE   $00E3,  $00E3,  $00C1,  $00FF   ; D752  
        DECLE   $0003,  $0089,  $0089,  $0083   ; D756  CART PIC #52
        DECLE   $0089,  $0089,  $0008,  $00FF   ; D75A  
        DECLE   $003A,  $0080,  $00E0,  $0056   ; D75E   003A 0080 00E0 0056
        DECLE   $0053,  $00E0,  $0080,  $0075   ; D762   0053 00E0 0080 0075
        DECLE   $00CE,  $00F6,  $00FB,  $007C   ; D766   00CE 00F6 00FB 007C
        DECLE   $00FE,  $00FF,  $00BF           ; D76A   00FE 00FF 00BF

        SARC    R1,     2                       ; D76D   007D
        MOVR    R0,     R7                      ; D76E   0087

        DECLE   $0031,  $0036,  $0006,  $0006   ; D76F   0031 0036 0006 0006
        DECLE   $0036                           ; D773   0036

        GSWD    R1                              ; D774   0031
        MOVR    R0,     R7                      ; D775   0087

        DECLE   $00FF,  $007F,  $007F,  $00B6   ; D776   00FF 007F 007F 00B6
        DECLE   $0025,  $0090,  $0000,  $0000   ; D77A   0025 0090 0000 0000

        DIS                                     ; D77E   0003
        SETC                                    ; D77F   0007
        DIS                                     ; D780   0003
        INCR    R7                              ; D781   000F

        CLRC                                    ; D782   0006
L_D783:
        INCR    R6                              ; D783   000E
        DECLE   $0006,  $000E,  $0000,  $0000   ; D784   0006 000E 0000 0000
        DECLE   $0004,  $0002,  $0080,  $0008   ; D788   0004 0002 0080 0008
        DECLE   $0045,  $002A,  $0000,  $0000   ; D78C   0045 002A 0000 0000
        DECLE   $0000,  $0000,  $0000           ; D790   0000 0000 0000

        ADDR    R4,     R0                      ; D793   00E0
        ADDR    R7,     R0                      ; D794   00F8
        ADDR    R1,     R6                      ; D795   00CE
        INCR    R7                              ; D796   000F

        COMR    R6                              ; D797   001E
L_D798:
        COMR    R4                              ; D798   001C
        DECLE   $001C,  $001C,  $001C,  $001C   ; D799   001C 001C 001C 001C
        DECLE   $001C,  $003E,  $003E,  $003F   ; D79D   001C 003E 003E 003F
        DECLE   $007F,  $007F,  $00FF,  $00FF   ; D7A1   007F 007F 00FF 00FF
        DECLE   $007F,  $0024,  $0024,  $00FF   ; D7A5   007F 0024 0024 00FF
        DECLE   $0042,  $0042,  $00FF,  $0024   ; D7A9   0042 0042 00FF 0024
        DECLE   $0024,  $0024,  $0027,  $00FD   ; D7AD   0024 0024 0027 00FD
        DECLE   $001D,  $0015,  $00F5,  $0055   ; D7B1   001D 0015 00F5 0055
        DECLE   $0055,  $0024,  $0064,  $005F   ; D7B5   0055 0024 0064 005F
        DECLE   $005C,  $0054,  $0057,  $0055   ; D7B9   005C 0054 0057 0055
        DECLE   $0055,  $0081,  $0000,  $0066   ; D7BD   0055 0081 0000 0066
        DECLE   $0066,  $0000,  $00BD,  $00BD   ; D7C1   0066 0000 00BD 00BD
        DECLE   $00C3,  $0000,  $0055,  $0000   ; D7C5   00C3 0000 0055 0000
        DECLE   $0055,  $0055,  $0055,  $0055   ; D7C9   0055 0055 0055 0055
        DECLE   $0055,  $0055,  $0055,  $0055   ; D7CD   0055 0055 0055 0055
        DECLE   $0055,  $0055,  $0055,  $0055   ; D7D1   0055 0055 0055 0055
        DECLE   $0055,  $003E,  $0007,  $0000   ; D7D5   0055 003E 0007 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; D7DD   0000 0000 0000 0080
        DECLE   $00F0,  $00FC,  $00FE,  $00FF   ; D7E1   00F0 00FC 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00DA   ; D7E5   00FF 00FF 00FF 00DA
        DECLE   $0070,  $00E0,  $00C0,  $0000   ; D7E9   0070 00E0 00C0 0000
        DECLE   $0080,  $0015,  $002A,  $0055   ; D7ED   0080 0015 002A 0055
        DECLE   $00AA,  $0054,  $00A8,  $0049   ; D7F1   00AA 0054 00A8 0049
        DECLE   $0084,  $0000,  $0000,  $0000   ; D7F5   0084 0000 0000 0000
        DECLE   $0000,  $0060,  $0010,  $0090   ; D7F9   0000 0060 0010 0090
        DECLE   $0060,  $0000,  $0000,  $00FF   ; D7FD   0060 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D801   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00EE,  $0000,  $0000   ; D805   00FF 00EE 0000 0000
        DECLE   $00B7,  $0065,  $0000,  $0000   ; D809   00B7 0065 0000 0000
        DECLE   $00D7,  $00C0,  $00F0,  $00F8   ; D80D   00D7 00C0 00F0 00F8
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; D811   00FF 00FF 00FF 007F
        DECLE   $007F,  $003F,  $001F,  $001F   ; D815   007F 003F 001F 001F
        DECLE   $001F,  $000F,  $0007,  $000F   ; D819   001F 000F 0007 000F
        DECLE   $001F,  $0000,  $0000           ; D81D   001F 0000 0000

        SWAP    R0,     1                       ; D820   0040
        DECR    R1                              ; D821   0011
        INCR    R7                              ; D822   000F

        SETC                                    ; D823   0007
L_D824:
        DIS                                     ; D824   0003
        DECLE   $0000,  $003F,  $00FF,  $007F   ; D825   0000 003F 00FF 007F
        DECLE   $001F,  $0003,  $0000,  $0000   ; D829   001F 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D82D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0007   ; D831   0000 0000 0000 0007
        DECLE   $00FF,  $0010,  $0010,  $0057   ; D835   00FF 0010 0010 0057
        DECLE   $0074,  $0076,  $0056,  $0010   ; D839   0074 0076 0056 0010
        DECLE   $0010                           ; D83D   0010
        DECLE   $007E,  $00C3,  $00BD,  $00A5   ; D83E  CART PIC #6F
        DECLE   $00A1,  $00BD,  $00C3,  $007E   ; D842  
        DECLE   $0000,  $0000,  $0004,  $0002   ; D846   0000 0000 0004 0002
        DECLE   $0080,  $0008,  $0005,  $002A   ; D84A   0080 0008 0005 002A
        DECLE   $0000,  $0001,  $0002,  $0000   ; D84E   0000 0001 0002 0000
        DECLE   $0041,  $0010,  $000A,  $0054   ; D852   0041 0010 000A 0054
        DECLE   $0000,  $0008,  $0000,  $0040   ; D856   0000 0008 0000 0040
        DECLE   $0010,  $0002,  $0014,  $0009   ; D85A   0010 0002 0014 0009
        DECLE   $0000,  $0000,  $0000,  $0021   ; D85E   0000 0000 0000 0021
        DECLE   $0000                           ; D862   0000

        SWAP    R0,     2                       ; D863   0044
        NEGR    R2                              ; D864   0022
        DECR    R4                              ; D865   0014
        NEGR    R1                              ; D866   0021
        ADDR    R2,     R0                      ; D867   00D0
        ADDR    R5,     R0                      ; D868   00E8
        ADDR    R5,     R0                      ; D869   00E8
        ADDR    R5,     R0                      ; D86A   00E8
        ADDR    R5,     R0                      ; D86B   00E8
        ADDR    R5,     R0                      ; D86C   00E8
        ADDR    R5,     R0                      ; D86D   00E8
        ADDR    R4,     R0                      ; D86E   00E0
        ADDR    R0,     R3                      ; D86F   00C3
        ADDR    R0,     R7                      ; D870   00C7
        ADDR    R0,     R7                      ; D871   00C7
        MOVR    R0,     R7                      ; D872   0087
        INCR    R7                              ; D873   000F

        DECLE   $003F                           ; D874   003F
L_D875:
        INCR    R7                              ; D875   000F

        ADDR    R5,     R0                      ; D876   00E8
L_D877:
        ADDR    R5,     R0                      ; D877   00E8
        DECLE   $00E8,  $00E8,  $00E8,  $00D1   ; D878   00E8 00E8 00E8 00D1
        DECLE   $0023,  $00FF                   ; D87C   0023 00FF

        SETC                                    ; D87E   0007
        MOVR    R0,     R7                      ; D87F   0087
        ADDR    R0,     R7                      ; D880   00C7
        ADDR    R0,     R7                      ; D881   00C7
        ADDR    R0,     R7                      ; D882   00C7

        DECLE   $00C3,  $00E0,  $00FF,  $0020   ; D883   00C3 00E0 00FF 0020
        DECLE   $00D0,  $00E8,  $00E8,  $00E8   ; D887   00D0 00E8 00E8 00E8
        DECLE   $00E8,  $00E8,  $00E8,  $0000   ; D88B   00E8 00E8 00E8 0000
        DECLE   $007C,  $00FE,  $00FF,  $00FF   ; D88F   007C 00FE 00FF 00FF
        DECLE   $00FF,  $00E7,  $0007,  $00E8   ; D893   00FF 00E7 0007 00E8
        DECLE   $00E8,  $00E8,  $00E8,  $00E8   ; D897   00E8 00E8 00E8 00E8
        DECLE   $00D1,  $0023,  $00FF,  $00E7   ; D89B   00D1 0023 00FF 00E7
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D89F   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00A0   ; D8A3   00FF 00FF 00FF 00A0
        DECLE   $0043,  $0047,  $0047,  $0047   ; D8A7   0043 0047 0047 0047
        DECLE   $0047,  $0043,  $00A0,  $0003   ; D8AB   0047 0043 00A0 0003
        DECLE   $00F9,  $00FC,  $00FC,  $00B9   ; D8AF   00F9 00FC 00FC 00B9
        DECLE   $00C3,  $00FF,  $0001,  $00FF   ; D8B3   00C3 00FF 0001 00FF
        DECLE   $00FF,  $009F,  $003F,  $003F   ; D8B7   00FF 009F 003F 003F
        DECLE   $009F,  $00C0,  $00FF,  $00D0   ; D8BB   009F 00C0 00FF 00D0
        DECLE   $00E8,  $00E8,  $00E8,  $00E8   ; D8BF   00E8 00E8 00E8 00E8
        DECLE   $00D0,  $0001,  $00FF           ; D8C3   00D0 0001 00FF

        ADDR    R0,     R1                      ; D8C6   00C1
        MOVR    R1,     R4                      ; D8C7   008C
        MOVR    R1,     R4                      ; D8C8   008C
        MOVR    R1,     R7                      ; D8C9   008F

        DECLE   $008C,  $008C,  $00C1,  $00FF   ; D8CA   008C 008C 00C1 00FF
        DECLE   $0081,  $00C4,  $00C4,  $00C4   ; D8CE   0081 00C4 00C4 00C4
        DECLE   $00C4,  $00C4,  $0081,  $00FF   ; D8D2   00C4 00C4 0081 00FF
        DECLE   $0080,  $00C6,  $00C5,  $00C1   ; D8D6   0080 00C6 00C5 00C1
        DECLE   $00C5,  $00C6,  $0080,  $00FF   ; D8DA   00C5 00C6 0080 00FF

        ADDR    R0,     R1                      ; D8DE   00C1
        MOVR    R1,     R4                      ; D8DF   008C
        MOVR    R1,     R4                      ; D8E0   008C
        MOVR    R1,     R7                      ; D8E1   008F

        DECLE   $0088,  $008C,  $00C1,  $00FF   ; D8E2   0088 008C 00C1 00FF
        DECLE   $0084,  $00C4,  $00C4,  $00C0   ; D8E6   0084 00C4 00C4 00C0
        DECLE   $00C4,  $00C4,  $0084,  $00FF   ; D8EA   00C4 00C4 0084 00FF
        DECLE   $00C1,  $00E3,  $00E3,  $00E3   ; D8EE   00C1 00E3 00E3 00E3
        DECLE   $00E3,  $00E3,  $00C1,  $00FF   ; D8F2   00E3 00E3 00C1 00FF

        MOVR    R0,     R2                      ; D8F6   0082
        ADDR    R0,     R7                      ; D8F7   00C7
        ADDR    R0,     R7                      ; D8F8   00C7
        ADDR    R0,     R7                      ; D8F9   00C7
        ADDR    R0,     R7                      ; D8FA   00C7
        ADDR    R0,     R7                      ; D8FB   00C7

        DECLE   $0082,  $00FF,  $008C,  $00C4   ; D8FC   0082 00FF 008C 00C4
        DECLE   $00C0,  $00C0,  $00C8,  $00CC   ; D900   00C0 00C0 00C8 00CC
        DECLE   $0086,  $00FF,  $00C1,  $0084   ; D904   0086 00FF 00C1 0084
        DECLE   $008C,  $008C,  $008C,  $008C   ; D908   008C 008C 008C 008C
        DECLE   $00C1,  $00FF,  $0003,  $0019   ; D90C   00C1 00FF 0003 0019
        DECLE   $0019,  $0003,  $0011,  $0019   ; D910   0019 0003 0011 0019
        DECLE   $0018,  $00FF                   ; D914   0018 00FF

        TSTR    R0                              ; D916   0080
        MOVR    R1,     R4                      ; D917   008C
        MOVR    R1,     R7                      ; D918   008F

        DECLE   $0080,  $00F8,  $0098,  $0080   ; D919   0080 00F8 0098 0080
        DECLE   $00FF,  $0080,  $00A2,  $00E3   ; D91D   00FF 0080 00A2 00E3
        DECLE   $00E3,  $00E3,  $00E3,  $00C1   ; D921   00E3 00E3 00E3 00C1
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D925   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D929   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0090,  $00B8,  $00B8   ; D92D   00FF 0090 00B8 00B8
        DECLE   $0030,  $0000,  $0008,  $0038   ; D931   0030 0000 0008 0038
        DECLE   $0020,  $00B0,  $0028,  $00C0   ; D935   0020 00B0 0028 00C0
        DECLE   $0098,  $0018,  $0010,  $00A8   ; D939   0098 0018 0010 00A8
        DECLE   $0080,  $0088,  $0078,  $00C0   ; D93D   0080 0088 0078 00C0
        DECLE   $0070,  $00B8,  $0098,  $0050   ; D941   0070 00B8 0098 0050
        DECLE   $0000,  $0008,  $0058,  $0040   ; D945   0000 0008 0058 0040
        DECLE   $00A0,  $0048,  $0068,  $0098   ; D949   00A0 0048 0068 0098
        DECLE   $0018,  $0010,  $0060,  $0080   ; D94D   0018 0010 0060 0080
        DECLE   $0088,  $0078,  $00C0           ; D951   0088 0078 00C0
.GRAM_INIT_D954:
        DECLE   $0014           ; D954  # of GRAM cards to init
        DECLE   $0081,  $03A0   ; D955  #00-07:  CART #40-47 --I-
        DECLE   $0091,  $03A0   ; D957  #08-0F:  CART #48-4F --I-
        DECLE   $00A1,  $0120   ; D959  #10-12:  CART #50-52 --I-
        DECLE   $005F,  $0020   ; D95B  #13-13:  CART #6F-6F ----

        DECLE   $0038,  $0001,  $0380,  $0011   ; D95D   0038 0001 0380 0011
        DECLE   $0300,  $001F,  $0380,  $002F   ; D961   0300 001F 0380 002F
        DECLE   $0300,  $003D,  $0300,  $0001   ; D965   0300 003D 0300 0001
        DECLE   $03A0,  $0011,  $03A0,  $0021   ; D969   03A0 0011 03A0 0021
        DECLE   $0120,  $002E,  $004B,  $0380   ; D96D   0120 002E 004B 0380
        DECLE   $005B,  $0180,  $0063,  $0380   ; D971   005B 0180 0063 0380
        DECLE   $0073,  $0300,  $0001,  $03A0   ; D975   0073 0300 0001 03A0
        DECLE   $0011,  $03A0,  $0021,  $0120   ; D979   0011 03A0 0021 0120
        DECLE   $002F,  $0027,  $03A0,  $0037   ; D97D   002F 0027 03A0 0037
        DECLE   $01A0,  $003F                   ; D981   01A0 003F

        AND@    R4,     R0                      ; D983   03A0
        SLL     R3,     2                       ; D984   004F
        AND@    R4,     R0                      ; D985   03A0
        SDBD                                    ; D986   0001
        AND@    R4,     R0                      ; D987   03A0
        DECR    R1                              ; D988   0011
        AND@    R4,     R0                      ; D989   03A0
        NEGR    R1                              ; D98A   0021
        SUBR    R4,     R0                      ; D98B   0120
        GSWD    R0                              ; D98C   0030
        MOVR    R0,     R1                      ; D98D   0081
        AND     G_0091, R0                      ; D98E   0380 0091
        TSTR    R0                              ; D990   0080
        MOVR    R2,     R5                      ; D991   0095
        AND     G_00A4, R0                      ; D992   0380 00A4
        MOVR    R4,     R7                      ; D994   00A7

        SUB     G_00B5, R0                      ; D995   0300 00B5
        MVI     G_0087, R0                      ; D997   0280 0087
        AND@    R4,     R0                      ; D999   03A0
        MOVR    R2,     R7                      ; D99A   0097

        MOVR    R4,     R0                      ; D99B   00A0
        RRC     R1,     2                       ; D99C   0075
        TSTR    R0                              ; D99D   0080
        COMR    R3                              ; D99E   001B
        ANDR    R4,     R0                      ; D99F   01A0
        ADCR    R5                              ; D9A0   002D
        SWAP    R1,     1                       ; D9A1   0041
        AND     G_0051, R0                      ; D9A2   0380 0051
        SUBR    R0,     R0                      ; D9A4   0100
        RLC     R3,     2                       ; D9A5   0057
        AND     G_0067, R0                      ; D9A6   0380 0067
        SUBR    R0,     R0                      ; D9A8   0100
        SAR     R1,     2                       ; D9A9   006D
        TSTR    R0                              ; D9AA   0080
        RRC     R1,     1                       ; D9AB   0071
        TSTR    R0                              ; D9AC   0080
        COMR    R3                              ; D9AD   001B
        MVI@    R4,     R0                      ; D9AE   02A0
        MOVR    R0,     R7                      ; D9AF   0087

        AND@    R4,     R0                      ; D9B0   03A0
        MOVR    R2,     R7                      ; D9B1   0097

        MOVR    R4,     R0                      ; D9B2   00A0
        SARC    R3,     1                       ; D9B3   007B
        SUBR    R0,     R0                      ; D9B4   0100
        SLLC    R1,     2                       ; D9B5   005D
        ADDR    R3,     R1                      ; D9B6   00D9
        MOVR    R1,     R4                      ; D9B7   008C
        ADDR    R3,     R1                      ; D9B8   00D9
        SAR     R2,     2                       ; D9B9   006E
        ADDR    R3,     R1                      ; D9BA   00D9
        MOVR    R4,     R0                      ; D9BB   00A0
        ADDR    R3,     R1                      ; D9BC   00D9
        SARC    R1,     2                       ; D9BD   007D
        ADDR    R3,     R1                      ; D9BE   00D9
        MOVR    R4,     R0                      ; D9BF   00A0
        ADDR    R3,     R1                      ; D9C0   00D9
        RLC     R0,     2                       ; D9C1   0054
        ADDR    R3,     R1                      ; D9C2   00D9
        ADDR    R1,     R4                      ; D9C3   00CC
        ADDR    R3,     R1                      ; D9C4   00D9
        DIS                                     ; D9C5   0003
        ADDR    R4,     R1                      ; D9C6   00E1
        ADDR    R3,     R1                      ; D9C7   00D9
        INCR    R0                              ; D9C8   0008
        COMR    R1                              ; D9C9   0019
        ADDR    R3,     R2                      ; D9CA   00DA
        SETC                                    ; D9CB   0007
        SWAP    R0,     1                       ; D9CC   0040
        DECR    R0                              ; D9CD   0010
        MOVR    R4,     R6                      ; D9CE   00A6
        ADDR    R3,     R4                      ; D9CF   00DC
        COMR    R4                              ; D9D0   001C
        MOVR    R2,     R5                      ; D9D1   0095
        GSWD    R0                              ; D9D2   0030
        RLC     R3,     1                       ; D9D3   0053
        GSWD    R0                              ; D9D4   0030
        TSTR    R5                              ; D9D5   00AD
        ADDR    R3,     R4                      ; D9D6   00DC
        INCR    R6                              ; D9D7   000E
        INCR    R0                              ; D9D8   0008
        SUB@    R4,     R0                      ; D9D9   0320
        RLC     R3,     1                       ; D9DA   0053
        GSWD    R0                              ; D9DB   0030
        TSTR    R5                              ; D9DC   00AD
        ADDR    R3,     R4                      ; D9DD   00DC
        COMR    R0                              ; D9DE   0018
        SLL     R0,     1                       ; D9DF   0048
        XORR    R4,     R0                      ; D9E0   01E0
        SWAP    R2,     2                       ; D9E1   0046
        DECR    R0                              ; D9E2   0010
        RSWD    R5                              ; D9E3   003D
        ADDR    R3,     R4                      ; D9E4   00DC
L_D9E5:
        DECR    R7                              ; D9E5   0017

        DECLE   $0069,  $0150,  $0046,  $0010   ; D9E6   0069 0150 0046 0010
        DECLE   $0044,  $00DC,  $000B,  $0069   ; D9EA   0044 00DC 000B 0069
        DECLE   $0150,  $0047,  $0010,  $004B   ; D9EE   0150 0047 0010 004B
        DECLE   $00DC,  $0018,  $0060,  $0000   ; D9F2   00DC 0018 0060 0000

        SWAP    R2,     2                       ; D9F6   0046
        GSWD    R0                              ; D9F7   0030
        RLC     R2,     1                       ; D9F8   0052
        ADDR    R3,     R4                      ; D9F9   00DC
        INCR    R5                              ; D9FA   000D
        SLR     R1,     2                       ; D9FB   0065
        CMPR    R2,     R0                      ; D9FC   0150
        SWAP    R0,     1                       ; D9FD   0040
        DECR    R0                              ; D9FE   0010
        SLLC    R1,     1                       ; D9FF   0059
        ADDR    R3,     R4                      ; DA00   00DC
        NEGR    R6                              ; DA01   0026
        GSWD    R0                              ; DA02   0030
        DECR    R0                              ; DA03   0010
        ADDR    R0,     R7                      ; DA04   00C7

        DECLE   $0030,  $0060,  $00DC,  $0043   ; DA05   0030 0060 00DC 0043
        DECLE   $006C,  $0000,  $0040,  $0010   ; DA09   006C 0000 0040 0010
        DECLE   $0067,  $00DC,  $0020,  $002C   ; DA0D   0067 00DC 0020 002C
        DECLE   $0020,  $0040,  $0010,  $006E   ; DA11   0020 0040 0010 006E
        DECLE   $00DC,  $0020,  $0035           ; DA15   00DC 0020 0035

        DECR    R0                              ; DA18   0010
        SWAP    R0,     1                       ; DA19   0040
        DECR    R0                              ; DA1A   0010
        RRC     R1,     2                       ; DA1B   0075
        ADDR    R3,     R4                      ; DA1C   00DC
L_DA1D:
        DECR    R7                              ; DA1D   0017

        DECLE   $0056,  $0000,  $0040,  $0010   ; DA1E   0056 0000 0040 0010
        DECLE   $007C,  $00DC,  $001B,  $004A   ; DA22   007C 00DC 001B 004A
        DECLE   $0000,  $0040,  $0010,  $0083   ; DA26   0000 0040 0010 0083
        DECLE   $00DC,  $0013,  $0049,  $0050   ; DA2A   00DC 0013 0049 0050
        DECLE   $0040,  $0010,  $008A,  $00DC   ; DA2E   0040 0010 008A 00DC
        DECLE   $0018,  $003A,  $0000,  $0042   ; DA32   0018 003A 0000 0042
        DECLE   $0030,  $0091,  $00DC,  $0018   ; DA36   0030 0091 00DC 0018
        DECLE   $0050,  $0000,  $0040,  $0010   ; DA3A   0050 0000 0040 0010
        DECLE   $0098,  $00DC,  $0010,  $0039   ; DA3E   0098 00DC 0010 0039
        DECLE   $0000                           ; DA42   0000

        SWAP    R0,     1                       ; DA43   0040
        GSWD    R0                              ; DA44   0030
        MOVR    R3,     R7                      ; DA45   009F

        DECLE   $00DC,  $0010,  $002A,  $0000   ; DA46   00DC 0010 002A 0000
        DECLE   $0000,  $0030,  $003C,  $0048   ; DA4A   0000 0030 003C 0048
        DECLE   $000C,  $0018,  $0018,  $0054   ; DA4E   000C 0018 0018 0054
        DECLE   $000C,  $0024,  $0024,  $0024   ; DA52   000C 0024 0024 0024
        DECLE   $0040,  $0098,  $008D,  $00DB   ; DA56   0040 0098 008D 00DB
        DECLE   $0000,  $0000,  $0048,  $0098   ; DA5A   0000 0000 0048 0098
        DECLE   $0025,  $00DB,  $0000,  $0000   ; DA5E   0025 00DB 0000 0000
        DECLE   $0040,  $0098,  $00B3,  $00DB   ; DA62   0040 0098 00B3 00DB
        DECLE   $0000,  $0000,  $0048,  $0098   ; DA66   0000 0000 0048 0098
        DECLE   $004B,  $00DB,  $0000,  $0000   ; DA6A   004B 00DB 0000 0000
        DECLE   $0047,  $0098,  $00C6,  $00DB   ; DA6E   0047 0098 00C6 00DB
        DECLE   $0000,  $0000,  $004C,  $0098   ; DA72   0000 0000 004C 0098
        DECLE   $005E,  $00DB,  $0000,  $0000   ; DA76   005E 00DB 0000 0000
        DECLE   $0046,  $0098,  $00D4,  $00DB   ; DA7A   0046 0098 00D4 00DB
        DECLE   $0000,  $0000,  $004C,  $0098   ; DA7E   0000 0000 004C 0098
        DECLE   $0073,  $00DB,  $0000,  $0000   ; DA82   0073 00DB 0000 0000
        DECLE   $0056,  $0098,  $0005,  $00DC   ; DA86   0056 0098 0005 00DC
        DECLE   $0000,  $0000,  $0056,  $0098   ; DA8A   0000 0000 0056 0098
        DECLE   $000C,  $00DC,  $0000,  $0000   ; DA8E   000C 00DC 0000 0000
        DECLE   $0056,  $0098,  $0013,  $00DC   ; DA92   0056 0098 0013 00DC
        DECLE   $0000,  $0000,  $0042,  $0090   ; DA96   0000 0000 0042 0090
        DECLE   $0036,  $00DC,  $0000,  $0000   ; DA9A   0036 00DC 0000 0000
        DECLE   $0045,  $0018,  $00E2,  $00DB   ; DA9E   0045 0018 00E2 00DB
        DECLE   $0000,  $0000,  $0045,  $0018   ; DAA2   0000 0000 0045 0018
        DECLE   $00E2,  $00DB,  $0000,  $0000   ; DAA6   00E2 00DB 0000 0000
        DECLE   $0046,  $0098,  $00F7,  $00DB   ; DAAA   0046 0098 00F7 00DB
        DECLE   $0000,  $0000,  $005B,  $0098   ; DAAE   0000 0000 005B 0098
        DECLE   $00E9,  $00DB,  $0000,  $0000   ; DAB2   00E9 00DB 0000 0000
        DECLE   $0062,  $0010,  $007A,  $00DB   ; DAB6   0062 0010 007A 00DB
        DECLE   $003C,  $0000,  $0300,  $006B   ; DABA   003C 0000 0300 006B
        DECLE   $0010,  $0012,  $00DB,  $0000   ; DABE   0010 0012 00DB 0000
        DECLE   $0000,  $0300,  $0076,  $0010   ; DAC2   0000 0300 0076 0010
        DECLE   $0005,  $00DC,  $0000,  $0000   ; DAC6   0005 00DC 0000 0000
        DECLE   $01E0,  $0076,  $0010,  $000C   ; DACA   01E0 0076 0010 000C
        DECLE   $00DC,  $0000,  $0000,  $01E0   ; DACE   00DC 0000 0000 01E0
        DECLE   $0076,  $0010,  $0013,  $00DC   ; DAD2   0076 0010 0013 00DC
        DECLE   $0000,  $0000,  $01E0,  $0062   ; DAD6   0000 0000 01E0 0062
        DECLE   $0010,  $0036,  $00DC,  $0000   ; DADA   0010 0036 00DC 0000
        DECLE   $0000,  $03C0,  $0019,  $0000   ; DADE   0000 03C0 0019 0000

        ADDR    R6,     R0                      ; DAE2   00F0
        ADDR    R7,     R0                      ; DAE3   00F8
        ADDR    R7,     R0                      ; DAE4   00F8
L_DAE5:
        DECR    R7                              ; DAE5   0017

        DECLE   $0047,  $0090,  $00F3,  $00DC   ; DAE6   0047 0090 00F3 00DC
        DECLE   $03F0,  $0032,  $0050,  $0090   ; DAEA   03F0 0032 0050 0090
        DECLE   $00F3,  $00DC,  $0380,  $0000   ; DAEE   00F3 00DC 0380 0000
        DECLE   $0042,  $0090,  $00FA,  $00DC   ; DAF2   0042 0090 00FA 00DC
        DECLE   $03F0,  $0032,  $0052,  $0090   ; DAF6   03F0 0032 0052 0090
        DECLE   $0001,  $00DD,  $0370,  $0000   ; DAFA   0001 00DD 0370 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DAFE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB02   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB06   0000 0000 0000 0000
        DECLE   $0003,  $0013,  $0005,  $0010   ; DB0A   0003 0013 0005 0010
        DECLE   $0002,  $0006,  $0002,  $0006   ; DB0E   0002 0006 0002 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB12   0000 0000 0000 0000
        DECLE   $0006,  $00BA,  $000C,  $02C8   ; DB16   0006 00BA 000C 02C8
        DECLE   $0057,  $02C8,  $0157,  $01C8   ; DB1A   0057 02C8 0157 01C8
        DECLE   $0057,  $01C8,  $0157,  $03C8   ; DB1E   0057 01C8 0157 03C8
        DECLE   $0057,  $03C8,  $0157,  $0000   ; DB22   0057 03C8 0157 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; DB26   0000 0000 0000 0006
        DECLE   $00EA,  $000C,  $02C8,  $0057   ; DB2A   00EA 000C 02C8 0057
        DECLE   $02C8,  $0157,  $01C8,  $0057   ; DB2E   02C8 0157 01C8 0057
        DECLE   $01C8,  $0157,  $03C8,  $0057   ; DB32   01C8 0157 03C8 0057
        DECLE   $03C8,  $0157,  $0000,  $0000   ; DB36   03C8 0157 0000 0000
        DECLE   $0000,  $0000,  $0006,  $000C   ; DB3A   0000 0000 0006 000C
        DECLE   $000C,  $02C8,  $0057,  $02C8   ; DB3E   000C 02C8 0057 02C8
        DECLE   $0157,  $01C8,  $0057,  $01C8   ; DB42   0157 01C8 0057 01C8
        DECLE   $0157,  $03C8,  $0057,  $03C8   ; DB46   0157 03C8 0057 03C8
        DECLE   $0157,  $0000,  $0000,  $0000   ; DB4A   0157 0000 0000 0000
        DECLE   $0000,  $0006,  $003C,  $000C   ; DB4E   0000 0006 003C 000C
        DECLE   $02C8,  $0057,  $02C8,  $0157   ; DB52   02C8 0057 02C8 0157
        DECLE   $01C8,  $0057,  $01C8,  $0157   ; DB56   01C8 0057 01C8 0157
        DECLE   $03C8,  $0057,  $03C8,  $0157   ; DB5A   03C8 0057 03C8 0157
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB5E   0000 0000 0000 0000
        DECLE   $0004,  $0080,  $0000,  $0000   ; DB62   0004 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; DB66   0000 0000 0000 0004
        DECLE   $0070,  $0000,  $0000,  $0000   ; DB6A   0070 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $00A8   ; DB6E   0000 0000 0004 00A8
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB72   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $00C0,  $0000   ; DB76   0000 0004 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DB7A   0000 0000 0000 0000
        DECLE   $0006,  $00AE,  $000C,  $02C8   ; DB7E   0006 00AE 000C 02C8
        DECLE   $0057,  $02C8,  $0157,  $01C8   ; DB82   0057 02C8 0157 01C8
        DECLE   $0057,  $01C8,  $0157,  $03C8   ; DB86   0057 01C8 0157 03C8
        DECLE   $0057,  $03C8,  $0157,  $0000   ; DB8A   0057 03C8 0157 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; DB8E   0000 0000 0000 0006
        DECLE   $00DE,  $000C,  $02C8,  $0057   ; DB92   00DE 000C 02C8 0057
        DECLE   $02C8,  $0157,  $01C8,  $0057   ; DB96   02C8 0157 01C8 0057
        DECLE   $01C8,  $0157,  $03C8,  $0057   ; DB9A   01C8 0157 03C8 0057
        DECLE   $03C8,  $0157,  $0000,  $0000   ; DB9E   03C8 0157 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0000   ; DBA2   0000 0000 0006 0000
        DECLE   $000C,  $02C8,  $0057,  $02C8   ; DBA6   000C 02C8 0057 02C8
        DECLE   $0157,  $01C8,  $0057,  $01C8   ; DBAA   0157 01C8 0057 01C8
        DECLE   $0157,  $03C8,  $0057,  $03C8   ; DBAE   0157 03C8 0057 03C8
        DECLE   $0157,  $0000,  $0000,  $0000   ; DBB2   0157 0000 0000 0000
        DECLE   $0000,  $0006,  $0030,  $000C   ; DBB6   0000 0006 0030 000C
        DECLE   $02C8,  $0057,  $02C8,  $0157   ; DBBA   02C8 0057 02C8 0157
        DECLE   $01C8,  $0057,  $01C8,  $0157   ; DBBE   01C8 0057 01C8 0157
        DECLE   $03C8,  $0057,  $03C8,  $0157   ; DBC2   03C8 0057 03C8 0157
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBC6   0000 0000 0000 0000
        DECLE   $0004,  $0090,  $0000,  $0000   ; DBCA   0004 0090 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; DBCE   0000 0000 0000 0004
        DECLE   $0078,  $0000,  $0000,  $0000   ; DBD2   0078 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $00B0   ; DBD6   0000 0000 0004 00B0
        DECLE   $0000,  $0000,  $0000,  $0000   ; DBDA   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $00A0,  $0000   ; DBDE   0000 0004 00A0 0000
        DECLE   $0000,  $0000,  $00AD,  $005B   ; DBE2   0000 0000 00AD 005B
        DECLE   $0006,  $0000,  $0000,  $0000   ; DBE6   0006 0000 0000 0000
        DECLE   $0000                           ; DBEA   0000

        ADDR    R7,     R4                      ; DBEB   00FC
        SLLC    R3,     1                       ; DBEC   005B

        JSR     R4,     L_6800                  ; DBED   0004 0068 0000
        DECLE   $0000,  $0000                   ; DBF0   0000 0000

        ADDR    R7,     R4                      ; DBF2   00FC
        SLLC    R3,     1                       ; DBF3   005B

        JSR     R4,     L_5800                  ; DBF4   0004 0058 0000
        DECLE   $0000,  $0000                   ; DBF7   0000 0000

        ADDR    R7,     R4                      ; DBF9   00FC
        SLLC    R3,     1                       ; DBFA   005B

        JSR     R4,     L_6000                  ; DBFB   0004 0060 0000
        DECLE   $0000,  $0000,  $00FC,  $005B   ; DBFE   0000 0000 00FC 005B
        DECLE   $0004,  $0050,  $0000,  $0000   ; DC02   0004 0050 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; DC06   0000 0000 0000 0006
        DECLE   $000C,  $0000,  $0000,  $0000   ; DC0A   000C 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0022   ; DC0E   0000 0000 0006 0022
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC12   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0038,  $0000   ; DC16   0000 0006 0038 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC1A   0000 0000 0000 0000
        DECLE   $0006,  $006C,  $0000,  $0000   ; DC1E   0006 006C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; DC22   0000 0000 0000 0006
        DECLE   $0098,  $0000,  $0000,  $0000   ; DC26   0098 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0082   ; DC2A   0000 0000 0006 0082
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC2E   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0056,  $0000   ; DC32   0000 0006 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC36   0000 0000 0000 0000
        DECLE   $0004,  $004E,  $0000,  $0000   ; DC3A   0004 004E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; DC3E   0000 0000 0000 0002
        DECLE   $0006,  $0000,  $0000,  $0000   ; DC42   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $000A   ; DC46   0000 0000 0002 000A
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC4A   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $000E,  $0000   ; DC4E   0000 0001 000E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC52   0000 0000 0000 0000
        DECLE   $0002,  $0010,  $0000,  $0000   ; DC56   0002 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; DC5A   0000 0000 0000 0002
        DECLE   $0014,  $0000,  $0000,  $0000   ; DC5E   0014 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0018   ; DC62   0000 0000 0001 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC66   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $001A,  $0000   ; DC6A   0000 0002 001A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC6E   0000 0000 0000 0000
        DECLE   $0002,  $001E,  $0000,  $0000   ; DC72   0002 001E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; DC76   0000 0000 0000 0001
        DECLE   $0022,  $0000,  $0000,  $0000   ; DC7A   0022 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0024   ; DC7E   0000 0000 0001 0024
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC82   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0026,  $0000   ; DC86   0000 0004 0026 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC8A   0000 0000 0000 0000
        DECLE   $0001,  $002E,  $0000,  $0000   ; DC8E   0001 002E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; DC92   0000 0000 0000 0001
        DECLE   $0030,  $0000,  $0000,  $0000   ; DC96   0030 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0032   ; DC9A   0000 0000 0001 0032
        DECLE   $0000,  $0000,  $0000,  $0000   ; DC9E   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0034,  $0000   ; DCA2   0000 0001 0034 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCA6   0000 0000 0000 0000
        DECLE   $0003,  $0000,  $0000,  $0000   ; DCAA   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; DCAE   0000 0000 0000 0006
        DECLE   $0036,  $0000,  $0000,  $0000   ; DCB2   0036 0000 0000 0000
        DECLE   $0000,  $0000,  $0005,  $008E   ; DCB6   0000 0000 0005 008E
        DECLE   $0000,  $0000,  $0000,  $0040   ; DCBA   0000 0000 0000 0040
        DECLE   $0059,  $0005,  $0062,  $0000   ; DCBE   0059 0005 0062 0000
        DECLE   $0000,  $0000,  $0040,  $0059   ; DCC2   0000 0000 0040 0059
        DECLE   $0005,  $00A4,  $0000,  $0000   ; DCC6   0005 00A4 0000 0000
        DECLE   $0000,  $0053,  $0059,  $0006   ; DCCA   0000 0053 0059 0006
        DECLE   $00D2,  $0000,  $0000,  $0000   ; DCCE   00D2 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $00C6   ; DCD2   0000 0000 0006 00C6
        DECLE   $0000,  $0000,  $0000,  $0053   ; DCD6   0000 0000 0000 0053
        DECLE   $0059,  $0006,  $0024,  $0000   ; DCDA   0059 0006 0024 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCDE   0000 0000 0000 0000
        DECLE   $0006,  $0018,  $0000,  $0000   ; DCE2   0006 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; DCE6   0000 0000 0000 0004
        DECLE   $0088,  $0000,  $0000,  $0000   ; DCEA   0088 0000 0000 0000
        DECLE   $0037,  $0059,  $0004,  $0098   ; DCEE   0037 0059 0004 0098
        DECLE   $0000,  $0000,  $0000,  $0000   ; DCF2   0000 0000 0000 0000
        DECLE   $0060,  $0004,  $0048,  $0000   ; DCF6   0060 0004 0048 0000
        DECLE   $0000,  $0000,  $0000           ; DCFA   0000 0000 0000

        SLR     R0,     1                       ; DCFD   0060

        JSR     R4,     L_D000                  ; DCFE   0004 00D0 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; DD01   0000 0000 0000 0060
        DECLE   $0004,  $00D8,  $0000,  $0000   ; DD05   0004 00D8 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; DD09   0000 0000 0000 0004
        DECLE   $00C8,  $0000,  $0000,  $0000   ; DD0D   00C8 0000 0000 0000
        DECLE   $002E,  $0059,  $0004,  $00B8   ; DD11   002E 0059 0004 00B8
        DECLE   $0000,  $0000,  $0000,  $0040   ; DD15   0000 0000 0000 0040
        DECLE   $0059,  $0005,  $0018,  $0000   ; DD19   0059 0005 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD1D   0000 0000 0000 0000
        DECLE   $0005,  $002E,  $0000,  $0000   ; DD21   0005 002E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0005   ; DD25   0000 0000 0000 0005
        DECLE   $0044,  $0000,  $0000,  $0000   ; DD29   0044 0000 0000 0000
        DECLE   $0000,  $0000,  $0005,  $0078   ; DD2D   0000 0000 0005 0078
        DECLE   $0000,  $0000,  $0000,  $0000   ; DD31   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0010,  $0010   ; DD35   0000 0008 0010 0010
        DECLE   $0018,  $0008,  $0020,  $0020   ; DD39   0018 0008 0020 0020
        DECLE   $0020,  $007A,  $00DB,  $0012   ; DD3D   0020 007A 00DB 0012
        DECLE   $00DB,  $008D,  $00DB,  $0025   ; DD41   00DB 008D 00DB 0025
        DECLE   $00DB,  $00A0,  $00DB,  $0038   ; DD45   00DB 00A0 00DB 0038
        DECLE   $00DB,  $00B3,  $00DB,  $004B   ; DD49   00DB 00B3 00DB 004B
        DECLE   $00DB,  $00CD,  $00DB,  $0065   ; DD4D   00DB 00CD 00DB 0065
        DECLE   $00DB,  $00C6,  $00DB,  $005E   ; DD51   00DB 00C6 00DB 005E
        DECLE   $00DB,  $00FE,  $00DB,  $00F0   ; DD55   00DB 00FE 00DB 00F0
        DECLE   $00DB,  $00F7,  $00DB,  $00E9   ; DD59   00DB 00F7 00DB 00E9
        DECLE   $00DB,  $00DB,  $00DB,  $006C   ; DD5D   00DB 00DB 00DB 006C
        DECLE   $00DB,  $00D4,  $00DB,  $0073   ; DD61   00DB 00D4 00DB 0073
        DECLE   $00DB,  $0000,  $0018,  $0030   ; DD65   00DB 0000 0018 0030
        DECLE   $0000,  $0006,  $000C,  $000C   ; DD69   0000 0006 000C 000C
        DECLE   $0000                           ; DD6D   0000

        CLRC                                    ; DD6E   0006
        DECR    R2                              ; DD6F   0012
        DECR    R2                              ; DD70   0012
        DECR    R2                              ; DD71   0012
        ADDR    R1,     R1                      ; DD72   00C9
        ADDR    R3,     R4                      ; DD73   00DC
        MOVR    R2,     R0                      ; DD74   0090
        GSWD    R2                              ; DD75   0032
        ADDR    R2,     R0                      ; DD76   00D0
        ADDR    R3,     R4                      ; DD77   00DC
        ADDR    R2,     R7                      ; DD78   00D7

        ADDR    R3,     R4                      ; DD79   00DC
        MOVR    R2,     R0                      ; DD7A   0090
        GSWD    R2                              ; DD7B   0032
        ADDR    R3,     R6                      ; DD7C   00DE
        ADDR    R3,     R4                      ; DD7D   00DC
        ADDR    R5,     R4                      ; DD7E   00EC
        ADDR    R3,     R4                      ; DD7F   00DC
        XOR@    R6,     R0                      ; DD80   03F0
        COMR    R6                              ; DD81   001E
        ADDR    R4,     R5                      ; DD82   00E5
        ADDR    R3,     R4                      ; DD83   00DC
        INCR    R7                              ; DD84   000F

        ADDR    R3,     R5                      ; DD85   00DD
L_DD86:
        MOVR    R2,     R0                      ; DD86   0090
        DECLE   $001E,  $0008,  $00DD,  $0016   ; DD87   001E 0008 00DD 0016
        DECLE   $00DD,  $0090,  $0028,  $001D   ; DD8B   00DD 0090 0028 001D
        DECLE   $00DD,  $0024,  $00DD,  $0090   ; DD8F   00DD 0024 00DD 0090
        DECLE   $0000,  $0000,  $0000,  $00C2   ; DD93   0000 0000 0000 00C2
        DECLE   $00DC,  $0090,  $0028,  $002B   ; DD97   00DC 0090 0028 002B
        DECLE   $00DD,  $00B4,  $00DC,  $0090   ; DD9B   00DD 00B4 00DC 0090
        DECLE   $0000,  $0000,  $0000,  $0016   ; DD9F   0000 0000 0000 0016
        DECLE   $00DD,  $0090,  $0028,  $001D   ; DDA3   00DD 0090 0028 001D
        DECLE   $00DD,  $0024,  $00DD,  $0090   ; DDA7   00DD 0024 00DD 0090
        DECLE   $0000,  $0000,  $0000,  $00BB   ; DDAB   0000 0000 0000 00BB
        DECLE   $00DC,  $0090,  $0028,  $00B4   ; DDAF   00DC 0090 0028 00B4
        DECLE   $00DC,  $002B,  $00DD,  $0090   ; DDB3   00DC 002B 00DD 0090
        DECLE   $0000,  $0000,  $0000           ; DDB7   0000 0000 0000

        DECR    R6                              ; DDBA   0016
        DECR    R6                              ; DDBB   0016
        DECR    R6                              ; DDBC   0016
        EIS                                     ; DDBD   0002

        JSRD    R4,     .EXEC.404               ; DDBE   0004 0016 0004
        DECLE   $0002,  $0016,  $0016,  $0016   ; DDC1   0002 0016 0016 0016
        DECLE   $0002,  $0016,  $0016,  $0004   ; DDC5   0002 0016 0016 0004
        DECLE   $0002,  $0006,  $0006,  $0006   ; DDC9   0002 0006 0006 0006
        DECLE   $0002,  $0012,  $0006,  $0012   ; DDCD   0002 0012 0006 0012
        DECLE   $0002,  $0006,  $0006,  $0006   ; DDD1   0002 0006 0006 0006
        DECLE   $0002,  $0006,  $0006,  $0012   ; DDD5   0002 0006 0006 0012
        DECLE   $0002,  $0002,  $0002,  $0002   ; DDD9   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0012,  $0002   ; DDDD   0002 0002 0012 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; DDE1   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0012   ; DDE5   0002 0002 0002 0012
        DECLE   $0002,  $0005,  $00DC,  $0003   ; DDE9   0002 0005 00DC 0003
        DECLE   $0000,  $000C,  $00DC,  $0000   ; DDED   0000 000C 00DC 0000
        DECLE   $00F8,  $0013,  $00DC,  $0000   ; DDF1   00F8 0013 00DC 0000
        DECLE   $00F8,  $0036,  $00DC,  $0000   ; DDF5   00F8 0036 00DC 0000
L_DDF9:
        DECR    R7                              ; DDF9   0017

        DECLE   $0021,  $00DC,  $0003,  $0000   ; DDFA   0021 00DC 0003 0000
        DECLE   $001A,  $00DC,  $0000,  $0000   ; DDFE   001A 00DC 0000 0000
        DECLE   $0028,  $00DC,  $00F9,  $0000   ; DE02   0028 00DC 00F9 0000
        DECLE   $0036,  $00DC,  $0007,  $0000   ; DE06   0036 00DC 0007 0000
        DECLE   $0005,  $00DC,  $0003,  $0000   ; DE0A   0005 00DC 0003 0000
        DECLE   $000C,  $00DC,  $0000,  $0008   ; DE0E   000C 00DC 0000 0008
        DECLE   $0013,  $00DC,  $0000,  $0008   ; DE12   0013 00DC 0000 0008
        DECLE   $0036,  $00DC,  $0000           ; DE16   0036 00DC 0000

        ADDR    R5,     R1                      ; DE19   00E9
        ADCR    R7                              ; DE1A   002F

        ADDR    R3,     R4                      ; DE1B   00DC
L_DE1C:
        DIS                                     ; DE1C   0003
        DECLE   $0000,  $0028,  $00DC,  $0007   ; DE1D   0000 0028 00DC 0007
        DECLE   $0000,  $001A,  $00DC,  $00F9   ; DE21   0000 001A 00DC 00F9
        DECLE   $0000,  $0036,  $00DC,  $00FD   ; DE25   0000 0036 00DC 00FD
        DECLE   $0000,  $0021,  $0051,  $0021   ; DE29   0000 0021 0051 0021
        DECLE   $0051,  $0021,  $0051,  $0021   ; DE2D   0051 0021 0051 0021
        DECLE   $0051,  $0021,  $0051,  $0000   ; DE31   0051 0021 0051 0000
        DECLE   $0000,  $0000,  $0000,  $0074   ; DE35   0000 0000 0000 0074
        DECLE   $00D1,  $0074,  $00D1,  $0074   ; DE39   00D1 0074 00D1 0074
        DECLE   $00D1,  $0000,  $0000,  $0021   ; DE3D   00D1 0000 0000 0021
        DECLE   $0051,  $0000,  $0000,  $0000   ; DE41   0051 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; DE45   0000 0000 0000

        MVII    #$0080, R0                      ; DE48   02B8 0080
        INCR    R7                              ; DE4A   000F

L_DE4B:
        MVI@    R5,     R0                      ; DE4B   02A8
L_DE4C:
        CMP     G_01C8, R0                      ; DE4C   0340 01C8
        BLT     L_DE6F                          ; DE4E   0205 001F
        BGT     L_DE56                          ; DE50   020E 0004

        MOVR    R0,     R1                      ; DE52   0081
        RRC     R1,     1                       ; DE53   0071
        BC      L_DE6F                          ; DE54   0201 0019

L_DE56:
        MVO     R0,     G_01C8                  ; DE56   0240 01C8
        CLRR    R0                              ; DE58   01C0
        MVO     R0,     G_01C9                  ; DE59   0240 01C9
        MVII    #$01FB, R4                      ; DE5B   02BC 01FB
        MVO@    R0,     R4                      ; DE5D   0260
        MVO@    R0,     R4                      ; DE5E   0260
        MVO@    R0,     R4                      ; DE5F   0260
        MVO     R5,     G_0318                  ; DE60   0245 0318
        MVII    #$01CC, R4                      ; DE62   02BC 01CC
        MVII    #$000D, R0                      ; DE64   02B8 000D

        JSR     R5,     X_FILL_ZERO             ; DE66   0004 0114 0338

        MVII    #$0001, R0                      ; DE69   02B8 0001
        MVO     R0,     G_01D2                  ; DE6B   0240 01D2
        MVO     R0,     G_01C9                  ; DE6D   0240 01C9
L_DE6F:
        PULR    R7                              ; DE6F   02B7

        CLRR    R0                              ; DE70   01C0
        MVO     R0,     G_01C9                  ; DE71   0240 01C9
        PULR    R7                              ; DE73   02B7

L_DE74:
        PSHR    R5                              ; DE74   0275
        MVI     G_01C9, R0                      ; DE75   0280 01C9
        DECR    R0                              ; DE77   0010
        BMI     L_DED0                          ; DE78   020B 0056
        BEQ     L_DED1                          ; DE7A   0204 0055

        MVO     R0,     G_01C9                  ; DE7C   0240 01C9
        CMP     G_01CB, R0                      ; DE7E   0340 01CB
        BNEQ    L_DE9B                          ; DE80   020C 0019

        CLRR    R0                              ; DE82   01C0
        MVI     G_0146, R5                      ; DE83   0285 0146
L_DE85:
        MVII    #$01CE, R3                      ; DE85   02BB 01CE
        ADDR    R0,     R3                      ; DE87   00C3
        MVI@    R3,     R1                      ; DE88   0299
        DECR    R1                              ; DE89   0011
        BMI     L_DE96                          ; DE8A   020B 000A

        MVO@    R1,     R3                      ; DE8C   0259
        BNEQ    L_DE96                          ; DE8D   020C 0007

        TSTR    R5                              ; DE8F   00AD
        BNEQ    L_DE96                          ; DE90   020C 0004

        MOVR    R0,     R2                      ; DE92   0082
        ADDI    #$01FB, R2                      ; DE93   02FA 01FB
        MVO@    R1,     R2                      ; DE95   0251
L_DE96:
        INCR    R0                              ; DE96   0008
        CMPI    #$0003, R0                      ; DE97   0378 0003
        BNEQ    L_DE85                          ; DE99   022C 0015

L_DE9B:
        MVI     G_0146, R5                      ; DE9B   0285 0146
        TSTR    R5                              ; DE9D   00AD
        BNEQ    L_DED0                          ; DE9E   020C 0030

        MVII    #$0038, R5                      ; DEA0   02BD 0038
        MVO     R5,     .PSG0.chan_enable       ; DEA2   0245 01F8
        MVII    #$01FB, R2                      ; DEA4   02BA 01FB
        MVII    #$01D6, R3                      ; DEA6   02BB 01D6
        MVII    #$01D9, R4                      ; DEA8   02BC 01D9
        MVII    #$01CE, R5                      ; DEAA   02BD 01CE
L_DEAC:
        SDBD                                    ; DEAC   0001
        MVII    #$DFC7, R1                      ; DEAD   02B9 00C7 00DF
        ADD@    R4,     R1                      ; DEB0   02E1
        ADD@    R3,     R1                      ; DEB1   02D9
        MVI@    R5,     R0                      ; DEB2   02A8
        TSTR    R0                              ; DEB3   0080
        BEQ     L_DECA                          ; DEB4   0204 0014

        MVI@    R1,     R0                      ; DEB6   0288
        TSTR    R0                              ; DEB7   0080
        BEQ     L_DECA                          ; DEB8   0204 0010

        CMPI    #$00FF, R0                      ; DEBA   0378 00FF
        BNEQ    L_DEC4                          ; DEBC   020C 0006

        CLRR    R0                              ; DEBE   01C0
        MVO@    R0,     R3                      ; DEBF   0258
        DECR    R4                              ; DEC0   0014
        DECR    R5                              ; DEC1   0015
        B       L_DEAC                          ; DEC2   0220 0017

L_DEC4:
        ADD     G_01CA, R0                      ; DEC4   02C0 01CA
        MVI@    R3,     R1                      ; DEC6   0299
        INCR    R1                              ; DEC7   0009
        MVO@    R1,     R3                      ; DEC8   0259
        MVO@    R0,     R2                      ; DEC9   0250
L_DECA:
        INCR    R2                              ; DECA   000A
        INCR    R3                              ; DECB   000B
        CMPI    #$01FE, R2                      ; DECC   037A 01FE
        BNEQ    L_DEAC                          ; DECE   022C 0023
L_DED0:
        PULR    R7                              ; DED0   02B7

L_DED1:
        MVI     G_01D1, R0                      ; DED1   0280 01D1
        ADDI    #$0000, R0                      ; DED3   02F8 0000
        MVO     R0,     G_01C9                  ; DED5   0240 01C9
        MVI     G_01D2, R0                      ; DED7   0280 01D2
        DECR    R0                              ; DED9   0010
        MVO     R0,     G_01D2                  ; DEDA   0240 01D2
        BNEQ    L_DE9B                          ; DEDC   022C 0042

L_DEDE:
        MVI     G_0318, R4                      ; DEDE   0284 0318
        MVI@    R4,     R0                      ; DEE0   02A0
        MVO     R4,     G_0318                  ; DEE1   0244 0318
        MOVR    R0,     R5                      ; DEE3   0085
        ANDI    #$000F, R5                      ; DEE4   03BD 000F
        CMPI    #$000B, R5                      ; DEE6   037D 000B
        BGT     L_DF4C                          ; DEE8   020E 0062

        MOVR    R0,     R1                      ; DEEA   0081
        ANDI    #$0200, R1                      ; DEEB   03B9 0200
        PSHR    R1                              ; DEED   0271
        MOVR    R0,     R1                      ; DEEE   0081
        SLL     R1,     1                       ; DEEF   0049
        SWAP    R1,     1                       ; DEF0   0041
        ANDI    #$0003, R1                      ; DEF1   03B9 0003
        MOVR    R1,     R4                      ; DEF3   008C
        SLR     R0,     2                       ; DEF4   0064
        SLR     R0,     2                       ; DEF5   0064
        ANDI    #$0007, R0                      ; DEF6   03B8 0007
        INCR    R0                              ; DEF8   0008
        PSHR    R0                              ; DEF9   0270
        MVI     G_0146, R0                      ; DEFA   0280 0146
        TSTR    R0                              ; DEFC   0080
        BNEQ    L_DF43                          ; DEFD   020C 0044

        ADDR    R5,     R5                      ; DEFF   00ED
        SDBD                                    ; DF00   0001
        ADDI    #$1ADC, R5                      ; DF01   02FD 00DC 001A
        SDBD                                    ; DF04   0001
        MVI@    R5,     R0                      ; DF05   02A8
        MVII    #$01CE, R5                      ; DF06   02BD 01CE
        CLRR    R1                              ; DF08   01C9
        MVII    #$0001, R3                      ; DF09   02BB 0001
L_DF0B:
        MVI@    R5,     R2                      ; DF0B   02AA
        TSTR    R2                              ; DF0C   0092
        BEQ     L_DF13                          ; DF0D   0204 0004

        INCR    R1                              ; DF0F   0009
        SLL     R3,     1                       ; DF10   004B
        B       L_DF0B                          ; DF11   0220 0007

L_DF13:
        MVII    #$01D3, R2                      ; DF13   02BA 01D3
        ADDR    R1,     R2                      ; DF15   00CA
        ADD@    R2,     R4                      ; DF16   02D4
L_DF17:
        SARC    R0,     1                       ; DF17   0078
        DECR    R4                              ; DF18   0014
        BPL     L_DF17                          ; DF19   0223 0003

        RLC     R0,     1                       ; DF1B   0050
        CLRR    R2                              ; DF1C   01D2
L_DF1D:
        AND     G_01CC, R3                      ; DF1D   0383 01CC
        BEQ     L_DF25                          ; DF1F   0204 0004

        INCR    R2                              ; DF21   000A
        SLL     R3,     1                       ; DF22   004B
        B       L_DF1D                          ; DF23   0220 0007

L_DF25:
        MVII    #$01F0, R4                      ; DF25   02BC 01F0
        MVII    #$01F4, R5                      ; DF27   02BD 01F4
        ADDR    R1,     R4                      ; DF29   00CC
        ADDR    R1,     R5                      ; DF2A   00CD
        MOVR    R2,     R3                      ; DF2B   0093
L_DF2C:
        MVO@    R0,     R4                      ; DF2C   0260
        SWAP    R0,     1                       ; DF2D   0040
        MVO@    R0,     R5                      ; DF2E   0268
        SWAP    R0,     1                       ; DF2F   0040
        ADD     G_01CD, R0                      ; DF30   02C0 01CD
        DECR    R3                              ; DF32   0013
        BPL     L_DF2C                          ; DF33   0223 0008

        MVII    #$01CE, R4                      ; DF35   02BC 01CE
        MVII    #$01D6, R5                      ; DF37   02BD 01D6
        ADDR    R1,     R4                      ; DF39   00CC
        ADDR    R1,     R5                      ; DF3A   00CD
        PULR    R0                              ; DF3B   02B0
        CLRR    R3                              ; DF3C   01DB
L_DF3D:
        MVO@    R0,     R4                      ; DF3D   0260
        MVO@    R3,     R5                      ; DF3E   026B
        DECR    R2                              ; DF3F   0012
        BPL     L_DF3D                          ; DF40   0223 0004
        INCR    R7                              ; DF42   000F

L_DF43:
        PULR    R0                              ; DF43   02B0
L_DF44:
        PULR    R3                              ; DF44   02B3
        TSTR    R3                              ; DF45   009B
        BEQ     L_DEDE                          ; DF46   0224 0069

        MVO     R0,     G_01D2                  ; DF48   0240 01D2
        B       L_DE9B                          ; DF4A   0220 00B0

L_DF4C:
        SLR     R0,     2                       ; DF4C   0064
        SLR     R0,     2                       ; DF4D   0064
        MOVR    R0,     R1                      ; DF4E   0081
        SLR     R1,     2                       ; DF4F   0065
        SLR     R1,     1                       ; DF50   0061
        SUBI    #$000C, R5                      ; DF51   033D 000C
        INCR    R5                              ; DF53   000D
        ADDR    R7,     R5                      ; DF54   00FD
        ADD@    R5,     R7                      ; DF55   02EF

        DECLE   $0004                           ; DF56   0004

        INCR    R3                              ; DF57   000B
        RLC     R1,     1                       ; DF58   0051
        RLC     R1,     2                       ; DF59   0055
        ANDI    #$0007, R0                      ; DF5A   03B8 0007
        ADDI    #$01C9, R1                      ; DF5C   02F9 01C9
        MVO@    R0,     R1                      ; DF5E   0248
        B       L_DEDE                          ; DF5F   0220 0082

        MOVR    R0,     R3                      ; DF61   0083
        ANDI    #$0003, R3                      ; DF62   03BB 0003
        SLR     R0,     2                       ; DF64   0064
        INCR    R3                              ; DF65   000B
        ADDR    R7,     R3                      ; DF66   00FB
        ADD@    R3,     R7                      ; DF67   02DF

        DECLE   $0004                           ; DF68   0004

        INCR    R4                              ; DF69   000C
        DECR    R0                              ; DF6A   0010
        RSWD    R0                              ; DF6B   0038
        MVO     R0,     G_01D1                  ; DF6C   0240 01D1
        ADDI    #$0000, R0                      ; DF6E   02F8 0000
        MVO     R0,     G_01C9                  ; DF70   0240 01C9
        B       L_DEDE                          ; DF72   0220 0095

        MVO     R0,     G_01D2                  ; DF74   0240 01D2
        B       L_DE9B                          ; DF76   0220 00DC

        MOVR    R0,     R3                      ; DF78   0083
        ANDI    #$0003, R3                      ; DF79   03BB 0003
        SLR     R0,     2                       ; DF7B   0064
        ADDI    #$0159, R3                      ; DF7C   02FB 0159
        MVI     G_0318, R5                      ; DF7E   0285 0318
        MVI@    R5,     R1                      ; DF80   02A9
        MVO     R5,     G_0318                  ; DF81   0245 0318
        SARC    R0,     1                       ; DF83   0078
        BC      L_DF89                          ; DF84   0201 0003

        MVO@    R1,     R3                      ; DF86   0259
        B       L_DEDE                          ; DF87   0220 00AA

L_DF89:
        MVI@    R3,     R0                      ; DF89   0298
        DECR    R0                              ; DF8A   0010
        BMI     L_DF90                          ; DF8B   020B 0003

        MVO@    R0,     R3                      ; DF8D   0258
        BEQ     L_DEDE                          ; DF8E   0224 00B1

L_DF90:
        MOVR    R1,     R0                      ; DF90   0088
        ANDI    #$0200, R1                      ; DF91   03B9 0200
        BEQ     L_DF99                          ; DF93   0204 0004

        SDBD                                    ; DF95   0001
        XORI    #$FC00, R0                      ; DF96   03F8 0000 00FC
L_DF99:
        NEGR    R0                              ; DF99   0020
        ADD     G_0318, R0                      ; DF9A   02C0 0318
        MVO     R0,     G_0318                  ; DF9C   0240 0318
        B       L_DEDE                          ; DF9E   0220 00C1

        CLRR    R0                              ; DFA0   01C0
        MVO     R0,     G_01C9                  ; DFA1   0240 01C9
        MVO     R0,     G_01C8                  ; DFA3   0240 01C8
        B       L_DED0                          ; DFA5   0220 00D6

        MVII    #$01D2, R3                      ; DFA7   02BB 01D2
        B       L_DFB2                          ; DFA9   0200 0007

        SDBD                                    ; DFAB   0001
        ADDI    #$DFBD, R1                      ; DFAC   02F9 00BD 00DF
        MVI@    R1,     R1                      ; DFAF   0289
        MVII    #$01D8, R3                      ; DFB0   02BB 01D8
L_DFB2:
        ANDI    #$0007, R0                      ; DFB2   03B8 0007
L_DFB4:
        INCR    R3                              ; DFB4   000B
        SARC    R0,     1                       ; DFB5   0078
        BNC     L_DFB9                          ; DFB6   0209 0001

        MVO@    R1,     R3                      ; DFB8   0259
L_DFB9:
        BNEQ    L_DFB4                          ; DFB9   022C 0006
        B       L_DEDE                          ; DFBB   0220 00DE

        DECLE   $0000,  $0004                   ; DFBD   0000 0004

        INCR    R1                              ; DFBF   0009
        INCR    R6                              ; DFC0   000E
        DECR    R6                              ; DFC1   0016
        COMR    R0                              ; DFC2   0018
        COMR    R5                              ; DFC3   001D
        ADCR    R2                              ; DFC4   002A
        ADCR    R7                              ; DFC5   002F

        GSWD    R2                              ; DFC6   0032
L_DFC7:
        INCR    R3                              ; DFC7   000B
        DECLE   $000A,  $0009,  $0000,  $000B   ; DFC8   000A 0009 0000 000B
        DECLE   $000A,  $0009,  $0001,  $0000   ; DFCC   000A 0009 0001 0000
        DECLE   $0008,  $0009,  $000A,  $000B   ; DFD0   0008 0009 000A 000B
        DECLE   $0000,  $0008,  $0009,  $000A   ; DFD4   0000 0008 0009 000A
        DECLE   $000B,  $000B,  $000B,  $0001   ; DFD8   000B 000B 000B 0001
        DECLE   $0000,  $000B,  $0000,  $000B   ; DFDC   0000 000B 0000 000B
        DECLE   $000B,  $000B,  $0001,  $0000   ; DFE0   000B 000B 0001 0000
        DECLE   $000B,  $000B,  $000A,  $000A   ; DFE4   000B 000B 000A 000A
        DECLE   $0009,  $0009,  $0008,  $0008   ; DFE8   0009 0009 0008 0008
        DECLE   $0007,  $0007,  $0006,  $0006   ; DFEC   0007 0007 0006 0006
        DECLE   $0000,  $000B,  $000B,  $000A   ; DFF0   0000 000B 000B 000A
        DECLE   $000A,  $00FF,  $000B,  $0009   ; DFF4   000A 00FF 000B 0009
        DECLE   $00FF,  $000B,  $000A,  $0009   ; DFF8   00FF 000B 000A 0009
        DECLE   $000A,  $00FF,  $0000           ; DFFC   000A 00FF 0000

        ADDR    R2,     R0                      ; DFFF   00D0

        ORG     $F000
        DECLE   $0060,  $002D,  $0070,  $002D   ; F000   0060 002D 0070 002D
        DECLE   $0028,  $002D,  $0098,  $002D   ; F004   0028 002D 0098 002D
        DECLE   $0068,  $002D,  $0038,  $002D   ; F008   0068 002D 0038 002D
        DECLE   $0078,  $002D,  $00B8,  $002D   ; F00C   0078 002D 00B8 002D
        DECLE   $0000,  $0008,  $0048,  $002D   ; F010   0000 0008 0048 002D
        DECLE   $0050,  $002D,  $0080,  $002D   ; F014   0050 002D 0080 002D
        DECLE   $00A8,  $002D,  $00B0,  $002D   ; F018   00A8 002D 00B0 002D
        DECLE   $00A0,  $002D,  $0030,  $002D   ; F01C   00A0 002D 0030 002D
        DECLE   $0008,  $0028,  $00D4,  $0008   ; F020   0008 0028 00D4 0008
        DECLE   $00D4,  $0008,  $0000,  $0008   ; F024   00D4 0008 0000 0008
        DECLE   $0040,  $002D,  $0058,  $002D   ; F028   0040 002D 0058 002D
        DECLE   $0078,  $0028,  $00A0,  $0028   ; F02C   0078 0028 00A0 0028
        DECLE   $00A0,  $0028,  $00A0,  $0028   ; F030   00A0 0028 00A0 0028
        DECLE   $0000,  $0028,  $0000,  $0028   ; F034   0000 0028 0000 0028
        DECLE   $0000,  $0008,  $0090,  $002D   ; F038   0000 0008 0090 002D
        DECLE   $0088,  $002D,  $0000,  $0000   ; F03C   0088 002D 0000 0000
        DECLE   $0000,  $0008,  $0078,  $0028   ; F040   0000 0008 0078 0028
        DECLE   $00CC,  $0008,  $00CC,  $0008   ; F044   00CC 0008 00CC 0008
        DECLE   $00CC,  $0008,  $0074,  $0029   ; F048   00CC 0008 0074 0029
        DECLE   $0074,  $0008,  $0000,  $0008   ; F04C   0074 0008 0000 0008
        DECLE   $0078,  $0028,  $00CC,  $0008   ; F050   0078 0028 00CC 0008
        DECLE   $00A4,  $0008,  $00A4,  $0008   ; F054   00A4 0008 00A4 0008
        DECLE   $00A4,  $0008,  $00A4,  $0008   ; F058   00A4 0008 00A4 0008
        DECLE   $0074,  $0008,  $00B4,  $0008   ; F05C   0074 0008 00B4 0008
        DECLE   $0000,  $0028,  $0000,  $0008   ; F060   0000 0028 0000 0008
        DECLE   $0000,  $0008,  $0000,  $0008   ; F064   0000 0008 0000 0008
        DECLE   $0000,  $0008,  $001C,  $0009   ; F068   0000 0008 001C 0009
        DECLE   $009C,  $0008,  $0070,  $0028   ; F06C   009C 0008 0070 0028
        DECLE   $00DC,  $0008,  $0074,  $0029   ; F070   00DC 0008 0074 0029
        DECLE   $0074,  $0029,  $0000,  $0008   ; F074   0074 0029 0000 0008
        DECLE   $00DC,  $0008,  $0094,  $0008   ; F078   00DC 0008 0094 0008
        DECLE   $0008,  $001E,  $00F0,  $001E   ; F07C   0008 001E 00F0 001E
        DECLE   $0000,  $001E,  $0008,  $0028   ; F080   0000 001E 0008 0028
        DECLE   $000C,  $0009,  $0014,  $0009   ; F084   000C 0009 0014 0009
        DECLE   $0000,  $0028,  $0000,  $0008   ; F088   0000 0028 0000 0008
        DECLE   $0078,  $0028,  $00A0,  $0028   ; F08C   0078 0028 00A0 0028
        DECLE   $0008,  $0028,  $001C,  $0009   ; F090   0008 0028 001C 0009
        DECLE   $00C4,  $0008,  $0000,  $0008   ; F094   00C4 0008 0000 0008
        DECLE   $00A4,  $0008,  $006C,  $0008   ; F098   00A4 0008 006C 0008
        DECLE   $0074,  $0029,  $00AC,  $0008   ; F09C   0074 0029 00AC 0008
        DECLE   $0094,  $0008,  $0008,  $0028   ; F0A0   0094 0008 0008 0028
        DECLE   $00E0,  $001E,  $0020,  $000E   ; F0A4   00E0 001E 0020 000E
        DECLE   $00E0,  $001E,  $0090,  $0028   ; F0A8   00E0 001E 0090 0028
        DECLE   $0074,  $0008,  $0080,  $0028   ; F0AC   0074 0008 0080 0028
        DECLE   $00B4,  $0008,  $0078,  $0028   ; F0B0   00B4 0008 0078 0028
        DECLE   $0094,  $0008,  $0070,  $0028   ; F0B4   0094 0008 0070 0028
        DECLE   $0094,  $0008,  $00BC,  $0008   ; F0B8   0094 0008 00BC 0008
        DECLE   $0014,  $0009,  $0000,  $0008   ; F0BC   0014 0009 0000 0008
        DECLE   $0000,  $0008,  $0070,  $0028   ; F0C0   0000 0008 0070 0028
        DECLE   $006C,  $0008,  $0004,  $0009   ; F0C4   006C 0008 0004 0009
        DECLE   $0078,  $0028,  $00CC,  $0008   ; F0C8   0078 0028 00CC 0008
        DECLE   $002C,  $000E,  $0030,  $000E   ; F0CC   002C 000E 0030 000E
        DECLE   $003C,  $000E,  $0094,  $0008   ; F0D0   003C 000E 0094 0008
        DECLE   $0070,  $0028,  $0080,  $0028   ; F0D4   0070 0028 0080 0028
        DECLE   $00A4,  $0008,  $0094,  $0008   ; F0D8   00A4 0008 0094 0008
        DECLE   $0000,  $0008,  $0000,  $0000   ; F0DC   0000 0008 0000 0000
        DECLE   $0000,  $0008,  $000C,  $0009   ; F0E0   0000 0008 000C 0009
        DECLE   $00DC,  $0008,  $0024,  $0009   ; F0E4   00DC 0008 0024 0009
        DECLE   $0000,  $0008,  $0000,  $0008   ; F0E8   0000 0008 0000 0008
        DECLE   $0070,  $0028,  $0070,  $0028   ; F0EC   0070 0028 0070 0028
        DECLE   $001C,  $0009,  $0044,  $000E   ; F0F0   001C 0009 0044 000E
        DECLE   $0058,  $000E,  $0060,  $000E   ; F0F4   0058 000E 0060 000E
        DECLE   $0048,  $000E,  $0050,  $000E   ; F0F8   0048 000E 0050 000E
        DECLE   $0078,  $0028,  $007C,  $0008   ; F0FC   0078 0028 007C 0008
        DECLE   $0008,  $0028,  $0008,  $0028   ; F100   0008 0028 0008 0028
        DECLE   $0008,  $0028,  $0000,  $0008   ; F104   0008 0028 0000 0008
        DECLE   $0000,  $0008,  $0000,  $0000   ; F108   0000 0008 0000 0000
        DECLE   $000C,  $0009,  $00DC,  $0008   ; F10C   000C 0009 00DC 0008
        DECLE   $0074,  $0008,  $00B4,  $0008   ; F110   0074 0008 00B4 0008
        DECLE   $0000,  $0008,  $0000,  $0008   ; F114   0000 0008 0000 0008
        DECLE   $00BC,  $0008,  $006C,  $0008   ; F118   00BC 0008 006C 0008
        DECLE   $0014,  $000E,  $0014,  $0008   ; F11C   0014 000E 0014 0008
        DECLE   $0014,  $000E,  $0014,  $0008   ; F120   0014 000E 0014 0008
        DECLE   $007C,  $0008,  $0078,  $0028   ; F124   007C 0008 0078 0028
        DECLE   $0090,  $0028,  $00CC,  $0008   ; F128   0090 0028 00CC 0008
        DECLE   $00CC,  $0008,  $0024,  $0009   ; F12C   00CC 0008 0024 0009
        DECLE   $0000,  $0028,  $0000,  $0008   ; F130   0000 0028 0000 0008
        DECLE   $0000,  $0008,  $000C,  $0009   ; F134   0000 0008 000C 0009
        DECLE   $00DC,  $0008,  $005C,  $0029   ; F138   00DC 0008 005C 0029
        DECLE   $0024,  $0009,  $0000,  $0008   ; F13C   0024 0009 0000 0008
        DECLE   $0024,  $0009,  $0070,  $0028   ; F140   0024 0009 0070 0028
        DECLE   $0070,  $0028,  $0070,  $0028   ; F144   0070 0028 0070 0028
        DECLE   $0094,  $0008,  $0094,  $0008   ; F148   0094 0008 0094 0008
        DECLE   $0078,  $0028,  $0090,  $0028   ; F14C   0078 0028 0090 0028
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F150   00DC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F154   00DC 0008 00DC 0008
        DECLE   $00B8,  $0028,  $0000,  $0000   ; F158   00B8 0028 0000 0000
        DECLE   $0000,  $0008,  $0008,  $0028   ; F15C   0000 0008 0008 0028
        DECLE   $001C,  $0009,  $00DC,  $0008   ; F160   001C 0009 00DC 0008
        DECLE   $0074,  $0029,  $0008,  $0029   ; F164   0074 0029 0008 0029
        DECLE   $00DC,  $0008,  $0074,  $0008   ; F168   00DC 0008 0074 0008
        DECLE   $00B4,  $0008,  $0000,  $0028   ; F16C   00B4 0008 0000 0028
        DECLE   $0008,  $0028,  $0078,  $0028   ; F170   0008 0028 0078 0028
        DECLE   $0090,  $0028,  $00DC,  $0008   ; F174   0090 0028 00DC 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F178   00DC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F17C   00DC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $00B8,  $0028   ; F180   00DC 0008 00B8 0028
        DECLE   $0008,  $0028,  $0078,  $0028   ; F184   0008 0028 0078 0028
        DECLE   $00DC,  $0008,  $005C,  $0029   ; F188   00DC 0008 005C 0029
        DECLE   $0074,  $0029,  $0014,  $0009   ; F18C   0074 0029 0014 0009
        DECLE   $0088,  $0028,  $00DC,  $0008   ; F190   0088 0028 00DC 0008
        DECLE   $00DC,  $0008,  $00CC,  $0008   ; F194   00DC 0008 00CC 0008
        DECLE   $00CC,  $0008,  $00DC,  $0008   ; F198   00CC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $0094,  $0008   ; F19C   00DC 0008 0094 0008
        DECLE   $0070,  $0028,  $0070,  $0028   ; F1A0   0070 0028 0070 0028
        DECLE   $006C,  $0008,  $00DC,  $0008   ; F1A4   006C 0008 00DC 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F1A8   00DC 0008 00DC 0008
        DECLE   $00CC,  $0008,  $00DC,  $0008   ; F1AC   00CC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F1B0   00DC 0008 00DC 0008
        DECLE   $0074,  $0029,  $0074,  $0029   ; F1B4   0074 0029 0074 0029
        DECLE   $0070,  $0028,  $0018,  $0028   ; F1B8   0070 0028 0018 0028
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F1BC   00DC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $007C,  $0008   ; F1C0   00DC 0008 007C 0008
        DECLE   $0094,  $0008,  $0000,  $0008   ; F1C4   0094 0008 0000 0008
        DECLE   $0000,  $0008,  $0000,  $0008   ; F1C8   0000 0008 0000 0008
        DECLE   $0070,  $0028,  $006C,  $0008   ; F1CC   0070 0028 006C 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F1D0   00DC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $00DC,  $0008   ; F1D4   00DC 0008 00DC 0008
        DECLE   $00DC,  $0008,  $0074,  $0029   ; F1D8   00DC 0008 0074 0029
        DECLE   $0074,  $0029,  $007C,  $0008   ; F1DC   0074 0029 007C 0008
        DECLE   $0010,  $001D,  $0020,  $001D   ; F1E0   0010 001D 0020 001D
        DECLE   $00D8,  $001C,  $0048,  $001D   ; F1E4   00D8 001C 0048 001D
        DECLE   $0018,  $001D,  $00E8,  $001C   ; F1E8   0018 001D 00E8 001C
        DECLE   $0028,  $001D,  $0068,  $001D   ; F1EC   0028 001D 0068 001D
        DECLE   $0000,  $0000,  $00F8,  $001C   ; F1F0   0000 0000 00F8 001C
        DECLE   $0000,  $001D,  $0030,  $001D   ; F1F4   0000 001D 0030 001D
        DECLE   $0058,  $001D,  $0060,  $001D   ; F1F8   0058 001D 0060 001D
        DECLE   $0050,  $001D,  $00E0,  $001C   ; F1FC   0050 001D 00E0 001C
        DECLE   $0020,  $001C,  $0018,  $001C   ; F200   0020 001C 0018 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; F204   0000 0000 0000 0000
        DECLE   $00F0,  $001C,  $0008,  $001D   ; F208   00F0 001C 0008 001D
        DECLE   $00BE,  $0008,  $0006,  $002C   ; F20C   00BE 0008 0006 002C
        DECLE   $0006,  $002C,  $0056,  $0008   ; F210   0006 002C 0056 0008
        DECLE   $0058,  $0009,  $0058,  $0009   ; F214   0058 0009 0058 0009
        DECLE   $0000,  $0000,  $0040,  $001D   ; F218   0000 0000 0040 001D
        DECLE   $0038,  $001D,  $0060,  $002E   ; F21C   0038 001D 0060 002E
        DECLE   $00D0,  $002E,  $0068,  $002E   ; F220   00D0 002E 0068 002E
        DECLE   $0000,  $0000,  $0000,  $0000   ; F224   0000 0000 0000 0000
        DECLE   $0000,  $000E,  $0000,  $000E   ; F228   0000 000E 0000 000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; F22C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00BE,  $0008   ; F230   0000 0000 00BE 0008
        DECLE   $0006,  $002C,  $0006,  $002C   ; F234   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F238   0006 002C 0006 002C
        DECLE   $009E,  $0008,  $0020,  $001C   ; F23C   009E 0008 0020 001C
        DECLE   $0018,  $001C,  $0000,  $0000   ; F240   0018 001C 0000 0000
        DECLE   $0000,  $0000,  $0058,  $0009   ; F244   0000 0000 0058 0009
        DECLE   $0000,  $0000,  $00C8,  $002E   ; F248   0000 0000 00C8 002E
        DECLE   $0000,  $0000,  $0000,  $0000   ; F24C   0000 0000 0000 0000
        DECLE   $0008,  $000E,  $0000,  $000E   ; F250   0008 000E 0000 000E
        DECLE   $0018,  $001C,  $0000,  $0000   ; F254   0018 001C 0000 0000
        DECLE   $00B6,  $0008,  $0006,  $002C   ; F258   00B6 0008 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F25C   0006 002C 0006 002C
        DECLE   $00A6,  $002E,  $0007,  $002E   ; F260   00A6 002E 0007 002E
        DECLE   $0086,  $002E,  $0000,  $000E   ; F264   0086 002E 0000 000E
        DECLE   $0008,  $000E,  $0000,  $0000   ; F268   0008 000E 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F26C   0000 0000 0000 0000
        DECLE   $0020,  $001C,  $00C8,  $002E   ; F270   0020 001C 00C8 002E
        DECLE   $0018,  $001C,  $0000,  $0000   ; F274   0018 001C 0000 0000
        DECLE   $0000,  $000E,  $0000,  $000E   ; F278   0000 000E 0000 000E
        DECLE   $0000,  $000E,  $0000,  $0000   ; F27C   0000 000E 0000 0000
        DECLE   $0006,  $002C,  $0006,  $002C   ; F280   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $00A6,  $002E   ; F284   0006 002C 00A6 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F288   0007 002E 0007 002E
        DECLE   $0086,  $002E,  $0000,  $000E   ; F28C   0086 002E 0000 000E
        DECLE   $0000,  $000E,  $0018,  $001C   ; F290   0000 000E 0018 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; F294   0000 0000 0000 0000
        DECLE   $0000,  $000E,  $00C8,  $002E   ; F298   0000 000E 00C8 002E
        DECLE   $0000,  $000E,  $0020,  $001C   ; F29C   0000 000E 0020 001C
        DECLE   $0000,  $000E,  $0000,  $000E   ; F2A0   0000 000E 0000 000E
        DECLE   $0008,  $000E,  $0018,  $001C   ; F2A4   0008 000E 0018 001C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F2A8   0006 002C 0006 002C
        DECLE   $00A6,  $002E,  $0007,  $002E   ; F2AC   00A6 002E 0007 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F2B0   0007 002E 0007 002E
        DECLE   $008E,  $002E,  $0000,  $000E   ; F2B4   008E 002E 0000 000E
        DECLE   $0000,  $000E,  $0008,  $000E   ; F2B8   0000 000E 0008 000E
        DECLE   $0000,  $0000,  $0020,  $001C   ; F2BC   0000 0000 0020 001C
        DECLE   $0008,  $000E,  $00C8,  $002E   ; F2C0   0008 000E 00C8 002E
        DECLE   $0000,  $000E,  $0008,  $000E   ; F2C4   0000 000E 0008 000E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F2C8   0000 000E 0000 000E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F2CC   0000 000E 0000 000E
        DECLE   $0006,  $002C,  $007E,  $002E   ; F2D0   0006 002C 007E 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F2D4   0007 002E 0007 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F2D8   0007 002E 0007 002E
        DECLE   $0086,  $002E,  $0056,  $0008   ; F2DC   0086 002E 0056 0008
        DECLE   $0000,  $000E,  $0000,  $000E   ; F2E0   0000 000E 0000 000E
        DECLE   $0000,  $0000,  $0000,  $000E   ; F2E4   0000 0000 0000 000E
        DECLE   $0000,  $000E,  $00C8,  $002E   ; F2E8   0000 000E 00C8 002E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F2EC   0000 000E 0000 000E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F2F0   0000 000E 0000 000E
        DECLE   $0010,  $001E,  $0010,  $001E   ; F2F4   0010 001E 0010 001E
        DECLE   $0006,  $002C,  $0006,  $002C   ; F2F8   0006 002C 0006 002C
        DECLE   $0076,  $002E,  $0007,  $002E   ; F2FC   0076 002E 0007 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F300   0007 002E 0007 002E
        DECLE   $008E,  $002E,  $0006,  $002C   ; F304   008E 002E 0006 002C
        DECLE   $009E,  $0008,  $0000,  $000E   ; F308   009E 0008 0000 000E
        DECLE   $0008,  $000E,  $0000,  $000E   ; F30C   0008 000E 0000 000E
        DECLE   $0048,  $002E,  $0028,  $002E   ; F310   0048 002E 0028 002E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F314   0000 000E 0000 000E
        DECLE   $0000,  $000E,  $0010,  $001E   ; F318   0000 000E 0010 001E
        DECLE   $0000,  $0000,  $0000,  $000E   ; F31C   0000 0000 0000 000E
        DECLE   $0006,  $002C,  $0006,  $002C   ; F320   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0096,  $002E   ; F324   0006 002C 0096 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F328   0007 002E 0007 002E
        DECLE   $0086,  $002E,  $0006,  $002C   ; F32C   0086 002E 0006 002C
        DECLE   $0006,  $002C,  $0036,  $0008   ; F330   0006 002C 0036 0008
        DECLE   $00B6,  $0008,  $0006,  $002C   ; F334   00B6 0008 0006 002C
        DECLE   $003E,  $002E,  $0040,  $002E   ; F338   003E 002E 0040 002E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F33C   0000 000E 0000 000E
        DECLE   $0010,  $001E,  $0000,  $0000   ; F340   0010 001E 0000 0000
        DECLE   $0000,  $000E,  $0000,  $000E   ; F344   0000 000E 0000 000E
        DECLE   $0006,  $002C,  $0006,  $002C   ; F348   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $007E,  $002E   ; F34C   0006 002C 007E 002E
        DECLE   $0007,  $002E,  $0007,  $002E   ; F350   0007 002E 0007 002E
        DECLE   $008E,  $002E,  $0006,  $002C   ; F354   008E 002E 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F358   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F35C   0006 002C 0006 002C
        DECLE   $00AE,  $0008,  $0058,  $002E   ; F360   00AE 0008 0058 002E
        DECLE   $0000,  $000E,  $0010,  $001E   ; F364   0000 000E 0010 001E
        DECLE   $0000,  $0000,  $0000,  $000E   ; F368   0000 0000 0000 000E
        DECLE   $0008,  $000E,  $0000,  $000E   ; F36C   0008 000E 0000 000E
        DECLE   $0006,  $002C,  $0006,  $002C   ; F370   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F374   0006 002C 0006 002C
        DECLE   $0096,  $002E,  $0007,  $002E   ; F378   0096 002E 0007 002E
        DECLE   $0086,  $002E,  $0006,  $002C   ; F37C   0086 002E 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F380   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F384   0006 002C 0006 002C
        DECLE   $00AE,  $0008,  $00C8,  $002E   ; F388   00AE 0008 00C8 002E
        DECLE   $0010,  $001E,  $0000,  $0000   ; F38C   0010 001E 0000 0000
        DECLE   $0000,  $000E,  $0000,  $000E   ; F390   0000 000E 0000 000E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F394   0000 000E 0000 000E
        DECLE   $0006,  $002C,  $0006,  $002C   ; F398   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F39C   0006 002C 0006 002C
        DECLE   $007E,  $002E,  $008E,  $002E   ; F3A0   007E 002E 008E 002E
        DECLE   $007E,  $002E,  $0077,  $002C   ; F3A4   007E 002E 0077 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F3A8   0006 002C 0006 002C
        DECLE   $0006,  $002C,  $0006,  $002C   ; F3AC   0006 002C 0006 002C
        DECLE   $00C6,  $0008,  $00C8,  $002E   ; F3B0   00C6 0008 00C8 002E
        DECLE   $0000,  $0000,  $0000,  $000E   ; F3B4   0000 0000 0000 000E
        DECLE   $0000,  $000E,  $0000,  $000E   ; F3B8   0000 000E 0000 000E
        DECLE   $0008,  $000E,  $0000,  $000E   ; F3BC   0008 000E 0000 000E
        DECLE   $0018,  $002D,  $0028,  $002D   ; F3C0   0018 002D 0028 002D
        DECLE   $00E0,  $002C,  $0050,  $002D   ; F3C4   00E0 002C 0050 002D
        DECLE   $0020,  $002D,  $00F0,  $002C   ; F3C8   0020 002D 00F0 002C
        DECLE   $0030,  $002D,  $0070,  $002D   ; F3CC   0030 002D 0070 002D
        DECLE   $0070,  $0009,  $0000,  $002D   ; F3D0   0070 0009 0000 002D
        DECLE   $0008,  $002D,  $0038,  $002D   ; F3D4   0008 002D 0038 002D
        DECLE   $0060,  $002D,  $0068,  $002D   ; F3D8   0060 002D 0068 002D
        DECLE   $0058,  $002D,  $00E8,  $002C   ; F3DC   0058 002D 00E8 002C
        DECLE   $0070,  $0009,  $0048,  $0018   ; F3E0   0070 0009 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F3E4   0048 0018 0048 0018
        DECLE   $00F8,  $002C,  $0010,  $002D   ; F3E8   00F8 002C 0010 002D
        DECLE   $0070,  $0009,  $0070,  $0009   ; F3EC   0070 0009 0070 0009
        DECLE   $007A,  $0008,  $00CA,  $0008   ; F3F0   007A 0008 00CA 0008
        DECLE   $00B2,  $0008,  $00A2,  $0008   ; F3F4   00B2 0008 00A2 0008
        DECLE   $0082,  $0008,  $0048,  $002D   ; F3F8   0082 0008 0048 002D
        DECLE   $0040,  $002D,  $0070,  $0009   ; F3FC   0040 002D 0070 0009
        DECLE   $0070,  $0009,  $0070,  $0009   ; F400   0070 0009 0070 0009
        DECLE   $0048,  $0018,  $0048,  $0018   ; F404   0048 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F408   0048 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F40C   0048 0018 0048 0018
        DECLE   $0070,  $0009,  $00D2,  $0008   ; F410   0070 0009 00D2 0008
        DECLE   $00D2,  $0008,  $0088,  $000C   ; F414   00D2 0008 0088 000C
        DECLE   $0012,  $0018,  $0082,  $0008   ; F418   0012 0018 0082 0008
        DECLE   $00BA,  $0008,  $009E,  $000C   ; F41C   00BA 0008 009E 000C
        DECLE   $007E,  $000C,  $0070,  $0009   ; F420   007E 000C 0070 0009
        DECLE   $0070,  $0009,  $0070,  $0009   ; F424   0070 0009 0070 0009
        DECLE   $002A,  $0008,  $0048,  $0018   ; F428   002A 0008 0048 0018
        DECLE   $0050,  $0018,  $0070,  $0018   ; F42C   0050 0018 0070 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F430   0070 0018 0070 0018
        DECLE   $0058,  $0018,  $0048,  $0018   ; F434   0058 0018 0048 0018
        DECLE   $00CA,  $0008,  $0030,  $000C   ; F438   00CA 0008 0030 000C
        DECLE   $00C0,  $000C,  $0012,  $0018   ; F43C   00C0 000C 0012 0018
        DECLE   $0062,  $0018,  $0002,  $000C   ; F440   0062 0018 0002 000C
        DECLE   $0002,  $000C,  $008A,  $0008   ; F444   0002 000C 008A 0008
        DECLE   $001A,  $0008,  $0070,  $0009   ; F448   001A 0008 0070 0009
        DECLE   $0070,  $0009,  $0070,  $0009   ; F44C   0070 0009 0070 0009
        DECLE   $0048,  $0018,  $0048,  $0018   ; F450   0048 0018 0048 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F454   0070 0018 0070 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F458   0070 0018 0070 0018
        DECLE   $0070,  $0018,  $0048,  $0018   ; F45C   0070 0018 0048 0018
        DECLE   $0070,  $0009,  $0070,  $0009   ; F460   0070 0009 0070 0009
        DECLE   $0080,  $000C,  $00D0,  $000C   ; F464   0080 000C 00D0 000C
        DECLE   $0042,  $0008,  $0002,  $000C   ; F468   0042 0008 0002 000C
        DECLE   $0002,  $000C,  $0082,  $0008   ; F46C   0002 000C 0082 0008
        DECLE   $0070,  $0009,  $0070,  $0009   ; F470   0070 0009 0070 0009
        DECLE   $002A,  $0008,  $0048,  $0018   ; F474   002A 0008 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F478   0048 0018 0048 0018
        DECLE   $0068,  $0018,  $0068,  $0018   ; F47C   0068 0018 0068 0018
        DECLE   $0068,  $0018,  $0068,  $0018   ; F480   0068 0018 0068 0018
        DECLE   $0068,  $0018,  $0048,  $0018   ; F484   0068 0018 0048 0018
        DECLE   $0070,  $0009,  $0070,  $0009   ; F488   0070 0009 0070 0009
        DECLE   $0070,  $0009,  $0088,  $000C   ; F48C   0070 0009 0088 000C
        DECLE   $0002,  $000C,  $0002,  $000C   ; F490   0002 000C 0002 000C
        DECLE   $008A,  $0008,  $0042,  $0008   ; F494   008A 0008 0042 0008
        DECLE   $0070,  $0009,  $002A,  $0008   ; F498   0070 0009 002A 0008
        DECLE   $0048,  $0018,  $0048,  $0018   ; F49C   0048 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4A0   0048 0018 0048 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F4A4   0070 0018 0070 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F4A8   0070 0018 0070 0018
        DECLE   $0070,  $0018,  $0048,  $0018   ; F4AC   0070 0018 0048 0018
        DECLE   $0070,  $0009,  $0070,  $0009   ; F4B0   0070 0009 0070 0009
        DECLE   $0022,  $0008,  $0030,  $000C   ; F4B4   0022 0008 0030 000C
        DECLE   $00C0,  $000C,  $0030,  $000C   ; F4B8   00C0 000C 0030 000C
        DECLE   $0082,  $0008,  $00BA,  $0008   ; F4BC   0082 0008 00BA 0008
        DECLE   $0070,  $0009,  $0048,  $0018   ; F4C0   0070 0009 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4C4   0048 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4C8   0048 0018 0048 0018
        DECLE   $0068,  $0018,  $0068,  $0018   ; F4CC   0068 0018 0068 0018
        DECLE   $0068,  $0018,  $0068,  $0018   ; F4D0   0068 0018 0068 0018
        DECLE   $0068,  $0018,  $0048,  $0018   ; F4D4   0068 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4D8   0048 0018 0048 0018
        DECLE   $0022,  $0008,  $0048,  $0018   ; F4DC   0022 0008 0048 0018
        DECLE   $0080,  $000C,  $0082,  $0008   ; F4E0   0080 000C 0082 0008
        DECLE   $00CA,  $0008,  $000A,  $0008   ; F4E4   00CA 0008 000A 0008
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4E8   0048 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4EC   0048 0018 0048 0018
        DECLE   $0048,  $0018,  $0048,  $0018   ; F4F0   0048 0018 0048 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F4F4   0070 0018 0070 0018
        DECLE   $0070,  $0018,  $0070,  $0018   ; F4F8   0070 0018 0070 0018
        DECLE   $0070,  $0018,  $0048,  $0018   ; F4FC   0070 0018 0048 0018
        DECLE   $0070,  $0009,  $0070,  $0009   ; F500   0070 0009 0070 0009
        DECLE   $0022,  $0008,  $0070,  $0009   ; F504   0022 0008 0070 0009
        DECLE   $0070,  $0009,  $00BA,  $0008   ; F508   0070 0009 00BA 0008
        DECLE   $00B8,  $000C,  $0042,  $0008   ; F50C   00B8 000C 0042 0008
        DECLE   $0032,  $0008,  $002A,  $0008   ; F510   0032 0008 002A 0008
        DECLE   $0006,  $0008,  $00AE,  $0008   ; F514   0006 0008 00AE 0008
        DECLE   $00AE,  $0008,  $0000,  $0000   ; F518   00AE 0008 0000 0000
        DECLE   $002A,  $0008,  $0010,  $0018   ; F51C   002A 0008 0010 0018
        DECLE   $0060,  $0018,  $0010,  $0018   ; F520   0060 0018 0010 0018
        DECLE   $002A,  $0008,  $0070,  $0009   ; F524   002A 0008 0070 0009
        DECLE   $007E,  $0008,  $00A0,  $002C   ; F528   007E 0008 00A0 002C
        DECLE   $0022,  $0008,  $00A0,  $002C   ; F52C   0022 0008 00A0 002C
        DECLE   $0022,  $0008,  $008A,  $0008   ; F530   0022 0008 008A 0008
        DECLE   $007E,  $0008,  $00BA,  $0008   ; F534   007E 0008 00BA 0008
        DECLE   $001A,  $0008,  $00A0,  $002C   ; F538   001A 0008 00A0 002C
        DECLE   $0006,  $0008,  $00AE,  $0008   ; F53C   0006 0008 00AE 0008
        DECLE   $00AE,  $0008,  $002A,  $0008   ; F540   00AE 0008 002A 0008
        DECLE   $0010,  $0018,  $00D8,  $0018   ; F544   0010 0018 00D8 0018
        DECLE   $0010,  $0018,  $0010,  $0018   ; F548   0010 0018 0010 0018
        DECLE   $00D8,  $0018,  $002A,  $0008   ; F54C   00D8 0018 002A 0008
        DECLE   $0060,  $0018,  $002A,  $0008   ; F550   0060 0018 002A 0008
        DECLE   $0092,  $0008,  $0070,  $0009   ; F554   0092 0008 0070 0009
        DECLE   $003A,  $0008,  $0070,  $0009   ; F558   003A 0008 0070 0009
        DECLE   $0070,  $0009,  $003A,  $0008   ; F55C   0070 0009 003A 0008
        DECLE   $0070,  $0009,  $0070,  $0009   ; F560   0070 0009 0070 0009
        DECLE   $0070,  $0009,  $002A,  $0008   ; F564   0070 0009 002A 0008
        DECLE   $0060,  $0018,  $0010,  $0018   ; F568   0060 0018 0010 0018
        DECLE   $0010,  $0018,  $0010,  $0018   ; F56C   0010 0018 0010 0018
        DECLE   $0060,  $0018,  $0010,  $0018   ; F570   0060 0018 0010 0018
        DECLE   $0060,  $0018,  $0010,  $0018   ; F574   0060 0018 0010 0018
        DECLE   $00D8,  $0018,  $0010,  $0018   ; F578   00D8 0018 0010 0018
        DECLE   $0060,  $0018,  $0060,  $0018   ; F57C   0060 0018 0060 0018
        DECLE   $0042,  $0008,  $0082,  $0008   ; F580   0042 0008 0082 0008
        DECLE   $0032,  $0008,  $0042,  $0008   ; F584   0032 0008 0042 0008
        DECLE   $0082,  $0008,  $0032,  $0008   ; F588   0082 0008 0032 0008
        DECLE   $002A,  $0008,  $0060,  $0018   ; F58C   002A 0008 0060 0018
        DECLE   $0010,  $0018,  $0010,  $0018   ; F590   0010 0018 0010 0018
        DECLE   $0060,  $0018,  $0010,  $0018   ; F594   0060 0018 0010 0018
        DECLE   $0060,  $0018,  $0010,  $0018   ; F598   0060 0018 0010 0018
        DECLE   $00D8,  $0018,  $0010,  $0018   ; F59C   00D8 0018 0010 0018
        DECLE   $0000                           ; F5A0   0000

        ADDR    R6,     R0                      ; F5A1   00F0
        ADDR    R4,     R0                      ; F5A2   00E0
        ADDR    R6,     R1                      ; F5A3   00F1
        ADDR    R0,     R0                      ; F5A4   00C0
        ADDR    R6,     R3                      ; F5A5   00F3
L_F5A6:
        PSHR    R5                              ; F5A6   0275
        MVII    #$01DC, R5                      ; F5A7   02BD 01DC
        SDBD                                    ; F5A9   0001
        MVI@    R5,     R4                      ; F5AA   02AC
        MOVR    R5,     R3                      ; F5AB   00AB
L_F5AC:
        MVI@    R4,     R2                      ; F5AC   02A2
        TSTR    R2                              ; F5AD   0092
        BEQ     L_F5BB                          ; F5AE   0204 000B

        MVI@    R3,     R0                      ; F5B0   0298
        DECR    R0                              ; F5B1   0010
        BEQ     L_F5BC                          ; F5B2   0204 0008
        BMI     L_F5B7                          ; F5B4   020B 0001

L_F5B6:
        MVO@    R0,     R3                      ; F5B6   0258
L_F5B7:
        ADDI    #$0002, R3                      ; F5B7   02FB 0002
        B       L_F5AC                          ; F5B9   0220 000E
L_F5BB:
        PULR    R7                              ; F5BB   02B7

L_F5BC:
        MVI     G_01A1, R0                      ; F5BC   0280 01A1
        INCR    R3                              ; F5BE   000B
        MVI@    R3,     R1                      ; F5BF   0299
        MOVR    R1,     R5                      ; F5C0   008D
        ANDI    #$0080, R5                      ; F5C1   03BD 0080
        BNEQ    L_F5D0                          ; F5C3   020C 000B

        INCR    R1                              ; F5C5   0009
        CMPI    #$0004, R1                      ; F5C6   0379 0004
        BNEQ    L_F5D8                          ; F5C8   020C 000E

        XORI    #$0080, R1                      ; F5CA   03F9 0080
        MVI     G_01A0, R0                      ; F5CC   0280 01A0
        B       L_F5D8                          ; F5CE   0200 0008

L_F5D0:
        DECR    R1                              ; F5D0   0011
        CMPI    #$0080, R1                      ; F5D1   0379 0080
        BNEQ    L_F5D8                          ; F5D3   020C 0003

        MVI     G_019F, R0                      ; F5D5   0280 019F
        CLRR    R1                              ; F5D7   01C9
L_F5D8:
        MVO@    R1,     R3                      ; F5D8   0259
        DECR    R3                              ; F5D9   0013
        ANDI    #$000F, R1                      ; F5DA   03B9 000F
        SLL     R1,     1                       ; F5DC   0049
        PSHR    R1                              ; F5DD   0271
        MVI     G_015E, R1                      ; F5DE   0281 015E
        DECR    R1                              ; F5E0   0011
        PSHR    R1                              ; F5E1   0271
        SLL     R1,     2                       ; F5E2   004D
        ADD@    R6,     R1                      ; F5E3   02F1
        ADD@    R6,     R1                      ; F5E4   02F1
        SDBD                                    ; F5E5   0001
        ADDI    #$FC13, R1                      ; F5E6   02F9 0013 00FC
        MOVR    R1,     R5                      ; F5E9   008D
        SDBD                                    ; F5EA   0001
        MVI@    R5,     R1                      ; F5EB   02A9
        MVO@    R1,     R2                      ; F5EC   0251
        PSHR    R0                              ; F5ED   0270
        MVI     G_01A2, R0                      ; F5EE   0280 01A2

        JSR     R5,     X_RAND2                 ; F5F0   0004 0114 029E

        ADD@    R6,     R0                      ; F5F3   02F0
        B       L_F5B6                          ; F5F4   0220 003F

L_F5F6:
        PSHR    R5                              ; F5F6   0275
        MVI     G_019E, R0                      ; F5F7   0280 019E
        DECR    R0                              ; F5F9   0010
        SLL     R0,     1                       ; F5FA   0048
        MOVR    R0,     R4                      ; F5FB   0084
        SLL     R0,     1                       ; F5FC   0048
        ADDR    R0,     R4                      ; F5FD   00C4
        SDBD                                    ; F5FE   0001
        ADDI    #$F62C, R4                      ; F5FF   02FC 002C 00F6
        MVII    #$01DE, R5                      ; F602   02BD 01DE
        MVII    #$0006, R0                      ; F604   02B8 0006
        CLRR    R2                              ; F606   01D2
L_F607:
        MVI@    R4,     R1                      ; F607   02A1
        MVO@    R1,     R5                      ; F608   0269
        MVO@    R2,     R5                      ; F609   026A
        DECR    R0                              ; F60A   0010
        BNEQ    L_F607                          ; F60B   022C 0005

        MVI     G_01A4, R0                      ; F60D   0280 01A4
        MVO     R0,     G_0185                  ; F60F   0240 0185
        MVI     G_035E, R0                      ; F611   0280 035E
        ANDI    #$0007, R0                      ; F613   03B8 0007
        MVO     R0,     G_0188                  ; F615   0240 0188
        INCR    R0                              ; F617   0008
        MVO     R0,     G_0189                  ; F618   0240 0189
        MVII    #$0004, R0                      ; F61A   02B8 0004

        JSR     R5,     X_RAND2                 ; F61C   0004 0114 029E
        DECLE   $0081,  $0001                   ; F61F   0081 0001

        ADDI    #$0028, R1                      ; F621   02F9 0028
        ADDR    R6,     R6                      ; F623   00F6
        MVI@    R1,     R0                      ; F624   0288
        MVO     R0,     G_018A                  ; F625   0240 018A
        PULR    R7                              ; F627   02B7

        DECLE   $0002,  $0004,  $0005,  $0007   ; F628   0002 0004 0005 0007
        DECLE   $0004                           ; F62C   0004

        INCR    R2                              ; F62D   000A
        DECR    R4                              ; F62E   0014
        COMR    R0                              ; F62F   0018
        NEGR    R3                              ; F630   0023
        INCR    R7                              ; F631   000F

        DECR    R4                              ; F632   0014
L_F633:
        RSWD    R4                              ; F633   003C
        DECLE   $0064,  $008C,  $00B4,  $00DC   ; F634   0064 008C 00B4 00DC
        DECLE   $0005                           ; F638   0005

        INCR    R2                              ; F639   000A
        DECR    R4                              ; F63A   0014
        ADCR    R0                              ; F63B   0028
        RLC     R0,     1                       ; F63C   0050
        MOVR    R4,     R0                      ; F63D   00A0
L_F63E:
        PSHR    R5                              ; F63E   0275

        JSR     R5,     X_PLAY_SFX2             ; F63F   0004 0118 03BE
        DECLE   $0095                           ; F642  SFX prio
        DECLE   $0389                           ; F643  SFX data
        DECLE   $002F                           ; F644  SFX data
        DECLE   $029D                           ; F645  SFX data
        DECLE   $0380,  $00B4                   ; F646  SFX data
        DECLE   $0388,  $00B1                   ; F648  SFX data
        DECLE   $0384,  $00AB                   ; F64A  SFX data
        DECLE   $012B                           ; F64C  SFX data
        DECLE   $0001,  $03E3                   ; F64D  SFX data
        DECLE   $026B                           ; F64F  SFX data
        DECLE   $0003,  $03D0                   ; F650  SFX data
        DECLE   $00CF                           ; F652  SFX end

L_F653:
        MVI     G_0182, R0                      ; F653   0280 0182
        TSTR    R0                              ; F655   0080
        BNEQ    L_F65C                          ; F656   020C 0004

        JSR     R5,     L_FCB4                  ; F658   0004 01FC 00B4

        PULR    R7                              ; F65B   02B7

L_F65C:
        MVI     G_0181, R0                      ; F65C   0280 0181
        DECR    R0                              ; F65E   0010
        BNEQ    L_F669                          ; F65F   020C 0008

        MVO     R0,     G_0181                  ; F661   0240 0181
L_F663:
        CLRR    R0                              ; F663   01C0
        MVO     R0,     G_01C8                  ; F664   0240 01C8

        JSR     R5,     L_FCA3                  ; F666   0004 01FC 00A3

L_F669:
        PULR    R7                              ; F669   02B7

L_F66A:
        PSHR    R5                              ; F66A   0275

        JSR     R5,     X_PLAY_SFX2             ; F66B   0004 0118 03BE
        DECLE   $008C                           ; F66E  SFX prio
        DECLE   $002F                           ; F66F  SFX data
        DECLE   $0035                           ; F670  SFX data
        DECLE   $0389                           ; F671  SFX data
        DECLE   $00BC,  $02E0                   ; F672  SFX data
        DECLE   $000B                           ; F674  SFX data
        DECLE   $021D                           ; F675  SFX data
        DECLE   $0040,  $00C8                   ; F676  SFX data
        DECLE   $0001,  $03EC                   ; F678  SFX data
        DECLE   $01EB                           ; F67A  SFX data
        DECLE   $0048,  $00B4                   ; F67B  SFX data
        DECLE   $0001,  $03EE                   ; F67D  SFX data
        DECLE   $01EB                           ; F67F  SFX data
        DECLE   $0044,  $00A0                   ; F680  SFX data
        DECLE   $0001,  $03ED                   ; F682  SFX data
        DECLE   $0103,  $03C0                   ; F684  SFX data
        DECLE   $02CF                           ; F686  SFX end

L_F687:
        PSHR    R5                              ; F687   0275

        JSR     R5,     X_PLAY_SFX2             ; F688   0004 0118 03BE
        DECLE   $008C                           ; F68B  SFX prio
        DECLE   $002F                           ; F68C  SFX data
        DECLE   $0035                           ; F68D  SFX data
        DECLE   $0389                           ; F68E  SFX data
        DECLE   $019D                           ; F68F  SFX data
        DECLE   $008C,  $0328                   ; F690  SFX data
        DECLE   $000B                           ; F692  SFX data
        DECLE   $0040,  $0064                   ; F693  SFX data
        DECLE   $0001,  $0014                   ; F695  SFX data
        DECLE   $012B                           ; F697  SFX data
        DECLE   $0048,  $005D                   ; F698  SFX data
        DECLE   $0001,  $0016                   ; F69A  SFX data
        DECLE   $012B                           ; F69C  SFX data
        DECLE   $0044,  $0058                   ; F69D  SFX data
        DECLE   $0001,  $0015                   ; F69F  SFX data
        DECLE   $0143,  $03C0                   ; F6A1  SFX data
        DECLE   $02CF                           ; F6A3  SFX end

L_F6A4:
        PSHR    R5                              ; F6A4   0275

        JSR     R5,     X_PLAY_SFX2             ; F6A5   0004 0118 03BE
        DECLE   $008C                           ; F6A8  SFX prio
        DECLE   $002F                           ; F6A9  SFX data
        DECLE   $0035                           ; F6AA  SFX data
        DECLE   $0389                           ; F6AB  SFX data
        DECLE   $031D                           ; F6AC  SFX data
        DECLE   $03C0,  $0153                   ; F6AD  SFX data
        DECLE   $03A2                           ; F6AF  SFX data
        DECLE   $00AB                           ; F6B0  SFX data
        DECLE   $03C8,  $008F                   ; F6B1  SFX data
        DECLE   $03AA                           ; F6B3  SFX data
        DECLE   $00AB                           ; F6B4  SFX data
        DECLE   $03C4,  $0035                   ; F6B5  SFX data
        DECLE   $03A6                           ; F6B7  SFX data
        DECLE   $0063,  $03CC                   ; F6B8  SFX data
        DECLE   $02CF                           ; F6BA  SFX end

L_F6BB:
        PSHR    R5                              ; F6BB   0275

        JSR     R5,     X_PLAY_SFX2             ; F6BC   0004 0118 03BE
        DECLE   $008C                           ; F6BF  SFX prio
        DECLE   $002F                           ; F6C0  SFX data
        DECLE   $0389                           ; F6C1  SFX data
        DECLE   $0380,  $00C8                   ; F6C2  SFX data
        DECLE   $0388,  $00D2                   ; F6C4  SFX data
        DECLE   $0384,  $00B4                   ; F6C6  SFX data
        DECLE   $00F1,  $0017                   ; F6C8  SFX data
        DECLE   $01DE                           ; F6CA  SFX data
        DECLE   $008F,  $001D                   ; F6CB  SFX data
        DECLE   $02CF                           ; F6CD  SFX end

L_F6CE:
        PSHR    R5                              ; F6CE   0275

        JSR     R5,     X_PLAY_SFX2             ; F6CF   0004 0118 03BE
        DECLE   $008E                           ; F6D2  SFX prio
        DECLE   $0389                           ; F6D3  SFX data
        DECLE   $039D                           ; F6D4  SFX data
        DECLE   $009C,  $0310                   ; F6D5  SFX data
        DECLE   $000B                           ; F6D7  SFX data
        DECLE   $0040,  $0096                   ; F6D8  SFX data
        DECLE   $0048,  $0098                   ; F6DA  SFX data
        DECLE   $0044,  $009A                   ; F6DC  SFX data
        DECLE   $0001,  $03D3                   ; F6DE  SFX data
        DECLE   $0143,  $03D8                   ; F6E0  SFX data
        DECLE   $02CF                           ; F6E2  SFX end

L_F6E3:
        PSHR    R5                              ; F6E3   0275

        JSR     R5,     X_PLAY_SFX2             ; F6E4   0004 0118 03BE
        DECLE   $008C                           ; F6E7  SFX prio
        DECLE   $012F                           ; F6E8  SFX data
        DECLE   $0389                           ; F6E9  SFX data
        DECLE   $004C,  $0388                   ; F6EA  SFX data
        DECLE   $03C0,  $004B                   ; F6EC  SFX data
        DECLE   $03C8,  $0082                   ; F6EE  SFX data
        DECLE   $0004,  $00B4                   ; F6F0  SFX data
        DECLE   $03B7                           ; F6F2  SFX data
        DECLE   $000B                           ; F6F3  SFX data
        DECLE   $0141,  $03FB                   ; F6F4  SFX data
        DECLE   $008F,  $001D                   ; F6F6  SFX data
        DECLE   $02CF                           ; F6F8  SFX end

L_F6F9:
        PSHR    R5                              ; F6F9   0275

        JSR     R5,     X_PLAY_SFX2             ; F6FA   0004 0118 03BE
        DECLE   $0091                           ; F6FD  SFX prio
        DECLE   $002F                           ; F6FE  SFX data
        DECLE   $0079                           ; F6FF  SFX data
        DECLE   $00ED                           ; F700  SFX data
        DECLE   $03B7                           ; F701  SFX data
        DECLE   $000C,  $0190                   ; F702  SFX data
        DECLE   $020B                           ; F704  SFX data
        DECLE   $02EB                           ; F705  SFX data
        DECLE   $011C,  $0250                   ; F706  SFX data
        DECLE   $03CD                           ; F708  SFX data
        DECLE   $008F,  $0063                   ; F709  SFX data
        DECLE   $0035                           ; F70B  SFX data
        DECLE   $0389                           ; F70C  SFX data
        DECLE   $00CF                           ; F70D  SFX end


        MVI     G_0181, R0                      ; F70E   0280 0181
        DECR    R0                              ; F710   0010
        BMI     L_F663                          ; F711   022B 00AF

        JSR     R5,     L_FCA9                  ; F713   0004 01FC 00A9

        PULR    R7                              ; F716   02B7

L_F717:
        PSHR    R5                              ; F717   0275

        JSR     R5,     X_PLAY_SFX2             ; F718   0004 0118 03BE
        DECLE   $008C                           ; F71B  SFX prio
        DECLE   $002F                           ; F71C  SFX data
        DECLE   $0079                           ; F71D  SFX data
        DECLE   $00ED                           ; F71E  SFX data
        DECLE   $03B7                           ; F71F  SFX data
        DECLE   $000C,  $0190                   ; F720  SFX data
        DECLE   $020B                           ; F722  SFX data
        DECLE   $022B                           ; F723  SFX data
        DECLE   $011C,  $0250                   ; F724  SFX data
        DECLE   $03CD                           ; F726  SFX data
        DECLE   $008F,  $0063                   ; F727  SFX data
        DECLE   $0035                           ; F729  SFX data
        DECLE   $0389                           ; F72A  SFX data
        DECLE   $02CF                           ; F72B  SFX end

L_F72C:
        PSHR    R5                              ; F72C   0275

        JSR     R5,     X_PLAY_SFX2             ; F72D   0004 0118 03BE
        DECLE   $00B4                           ; F730  SFX prio
        DECLE   $002F                           ; F731  SFX data
        DECLE   $002D                           ; F732  SFX data
        DECLE   $0079                           ; F733  SFX data
        DECLE   $0035                           ; F734  SFX data
        DECLE   $008E                           ; F735  SFX data
        DECLE   $008F,  $0013                   ; F736  SFX data
        DECLE   $0389                           ; F738  SFX data
        DECLE   $0040,  $0064                   ; F739  SFX data
        DECLE   $0048,  $00DC                   ; F73B  SFX data
        DECLE   $0044,  $00E6                   ; F73D  SFX data
        DECLE   $01E1,  $002B                   ; F73F  SFX data
        DECLE   $003C,  $03A0                   ; F741  SFX data
        DECLE   $000B                           ; F743  SFX data
        DECLE   $000B                           ; F744  SFX data
        DECLE   $008F,  $0015                   ; F745  SFX data
        DECLE   $00CF                           ; F747  SFX end


        B       L_F653                          ; F748   0220 00F6

L_F74A:
        PSHR    R5                              ; F74A   0275

        JSR     R5,     X_PLAY_SFX2             ; F74B   0004 0118 03BE
        DECLE   $008C                           ; F74E  SFX prio
        DECLE   $03E9                           ; F74F  SFX data
        DECLE   $0380,  $0384                   ; F750  SFX data
        DECLE   $0001,  $0360                   ; F752  SFX data
        DECLE   $03EB                           ; F754  SFX data
        DECLE   $0001,  $00B4                   ; F755  SFX data
        DECLE   $008F,  $001D                   ; F757  SFX data
        DECLE   $02CF                           ; F759  SFX end

L_F75A:
        PSHR    R5                              ; F75A   0275

        JSR     R5,     X_PLAY_SFX2             ; F75B   0004 0118 03BE
        DECLE   $008C                           ; F75E  SFX prio
        DECLE   $0079                           ; F75F  SFX data
        DECLE   $000C,  $0258                   ; F760  SFX data
        DECLE   $03B7                           ; F762  SFX data
        DECLE   $03CD                           ; F763  SFX data
        DECLE   $000B                           ; F764  SFX data
        DECLE   $00AB                           ; F765  SFX data
        DECLE   $010D                           ; F766  SFX data
        DECLE   $000B                           ; F767  SFX data
        DECLE   $00AB                           ; F768  SFX data
        DECLE   $02CF                           ; F769  SFX end

L_F76A:
        PSHR    R5                              ; F76A   0275

        JSR     R5,     X_PLAY_SFX2             ; F76B   0004 0118 03BE
        DECLE   $008C                           ; F76E  SFX prio
        DECLE   $03E9                           ; F76F  SFX data
        DECLE   $0380,  $0078                   ; F770  SFX data
        DECLE   $0001,  $03E0                   ; F772  SFX data
        DECLE   $036B                           ; F774  SFX data
        DECLE   $02CF                           ; F775  SFX end

        DECLE   $035F,  $037C,  $011F,  $0024   ; F776   035F 037C 011F 0024
        DECLE   $0021,  $0021,  $0021,  $0021   ; F77A   0021 0021 0021 0021
        DECLE   $0081,  $0126,  $03DF           ; F77E   0081 0126 03DF

        XOR@    R1,     R2                      ; F781   03CA
        ADDR    R0,     R4                      ; F782   00C4
        XOR@    R5,     R1                      ; F783   03E9
        SUBR    R4,     R4                      ; F784   0124
        ADDR    R4,     R6                      ; F785   00E6
        SUBR    R1,     R1                      ; F786   0109
        ADDR    R0,     R7                      ; F787   00C7
        MOVR    R3,     R7                      ; F788   009F
        SUBR    R0,     R7                      ; F789   0107

        CMPR    R7,     R7                      ; F78A   017F
        ANDR    R5,     R4                      ; F78B   01AC
L_F78C:
        SUB@    R1,     R1                      ; F78C   0309
        XOR@    R4,     R4                      ; F78D   03E4
        ADD@    R5,     R1                      ; F78E   02E9
        SUBI    #$0317, R0                      ; F78F   0338 0317
        SUB@    R6,     R7                      ; F791   0337

        DECLE   $013F,  $0317,  $01EE,  $0230   ; F792   013F 0317 01EE 0230
        DECLE   $0092,  $03E7,  $03FF,  $03FF   ; F796   0092 03E7 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $013F   ; F79A   03FF 03FF 03FF 013F
        DECLE   $02B3,  $02B4,  $0096,  $03F7   ; F79E   02B3 02B4 0096 03F7

        TSTR    R1                              ; F7A2   0089
        SUBR    R0,     R7                      ; F7A3   0107

        ADDR    R4,     R6                      ; F7A4   00E6
        SUBR    R0,     R7                      ; F7A5   0107

        ADDR    R1,     R0                      ; F7A6   00C8
        MOVR    R3,     R7                      ; F7A7   009F

        DECLE   $0088,  $013F                   ; F7A8   0088 013F

        SUBR    R4,     R6                      ; F7AA   0126
        XOR@    R4,     R4                      ; F7AB   03E4
        XOR@    R4,     R6                      ; F7AC   03E6
        SUB@    R6,     R7                      ; F7AD   0337
        SUB@    R2,     R7                      ; F7AE   0317

L_F7AF:
        ADDI    #$0338, R1                      ; F7AF   02F9 0338
        DECLE   $013F,  $03E4,  $03FF,  $03FF   ; F7B1   013F 03E4 03FF 03FF
        DECLE   $03FF,  $03F8,  $03FF,  $03FF   ; F7B5   03FF 03F8 03FF 03FF
        DECLE   $03FF,  $03FF                   ; F7B9   03FF 03FF

        ADDR    R3,     R7                      ; F7BB   00DF

        XOR@    R5,     R1                      ; F7BC   03E9
        TSTR    R1                              ; F7BD   0089
        SUBR    R4,     R7                      ; F7BE   0127

        DECLE   $00E8,  $03E6,  $0084,  $00C9   ; F7BF   00E8 03E6 0084 00C9
        DECLE   $00C8,  $0124,  $0304,  $03E4   ; F7C3   00C8 0124 0304 03E4
        DECLE   $03FF,  $03FF,  $03FF,  $03E4   ; F7C7   03FF 03FF 03FF 03E4
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; F7CB   03FF 03FF 03FF 03FF
        DECLE   $013F                           ; F7CF   013F

        XOR@    R5,     R0                      ; F7D0   03E8
        ADDR    R4,     R6                      ; F7D1   00E6
        SUBR    R0,     R7                      ; F7D2   0107

        XOR@    R5,     R1                      ; F7D3   03E9
        SUBR    R0,     R6                      ; F7D4   0106
        ADDR    R0,     R6                      ; F7D5   00C6
        ADDR    R0,     R7                      ; F7D6   00C7

        ADDR    R1,     R0                      ; F7D7   00C8
        SUBR    R4,     R7                      ; F7D8   0127
        MOVR    R3,     R7                      ; F7D9   009F

        DECLE   $03F8,  $02F8,  $0319,  $03E4   ; F7DA   03F8 02F8 0319 03E4
        DECLE   $02E9,  $0338,  $02F8,  $0319   ; F7DE   02E9 0338 02F8 0319
        DECLE   $0137,  $013F,  $0009,  $0000   ; F7E2   0137 013F 0009 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F7E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; F7EA   0000 0000 0000 0080
        DECLE   $0259,  $029E,  $028D,  $0238   ; F7EE   0259 029E 028D 0238
        DECLE   $02A8,  $0293,  $0000           ; F7F2   02A8 0293 0000

        ADDR    R4,     R4                      ; F7F5   00E4
        ADDR    R4,     R4                      ; F7F6   00E4
        ADDR    R5,     R1                      ; F7F7   00E9
        XOR@    R5,     R1                      ; F7F8   03E9
        NEGR    R1                              ; F7F9   0021
        NEGR    R1                              ; F7FA   0021
        NEGR    R1                              ; F7FB   0021
        NEGR    R1                              ; F7FC   0021
        NEGR    R1                              ; F7FD   0021
        SUBR    R4,     R7                      ; F7FE   0127

        SUB@    R5,     R1                      ; F7FF   0329
        ADDI    #$02F9, R0                      ; F800   02F8 02F9
        XOR@    R4,     R4                      ; F802   03E4
        SUBR    R4,     R4                      ; F803   0124
        ADDR    R4,     R7                      ; F804   00E7

        MOVR    R0,     R6                      ; F805   0086
        SUBR    R1,     R1                      ; F806   0109
        XOR@    R5,     R1                      ; F807   03E9
        MOVR    R3,     R0                      ; F808   0098
        ADDR    R0,     R7                      ; F809   00C7

        DECLE   $03FF,  $03FF,  $03FF           ; F80A   03FF 03FF 03FF

        SUB@    R5,     R1                      ; F80D   0329
        ADDI    #$0319, R0                      ; F80E   02F8 0319
        ADDI    #$03E4, R1                      ; F810   02F9 03E4
        ADDR    R7,     R1                      ; F812   00F9
        SUBR    R4,     R6                      ; F813   0126
        MOVR    R3,     R7                      ; F814   009F
        SUBR    R0,     R7                      ; F815   0107

        DECLE   $03E9,  $03FF,  $03FF,  $03FF   ; F816   03E9 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $009F,  $0098   ; F81A   03FF 03FF 009F 0098
        DECLE   $013F                           ; F81E   013F

        ADDR    R3,     R1                      ; F81F   00D9
        XORI    #$0127, R0                      ; F820   03F8 0127
        SUBR    R4,     R7                      ; F822   0127
        MOVR    R3,     R7                      ; F823   009F
        ADDR    R4,     R7                      ; F824   00E7

        DECLE   $0128,  $013F,  $00E6,  $03FF   ; F825   0128 013F 00E6 03FF
        DECLE   $02FF,  $03E4,  $0398,  $00FB   ; F829   02FF 03E4 0398 00FB
        DECLE   $013F                           ; F82D   013F

        SUB@    R3,     R1                      ; F82E   0319
        MOVR    R2,     R7                      ; F82F   0097
        MOVR    R3,     R7                      ; F830   009F
        ADD@    R4,     R7                      ; F831   02E7

        DECLE   $0089,  $03FF,  $03FF,  $015E   ; F832   0089 03FF 03FF 015E
        DECLE   $02FE,  $03FF,  $03FF,  $03FF   ; F836   02FE 03FF 03FF 03FF
        DECLE   $00FF,  $03E9,  $03FF,  $013F   ; F83A   00FF 03E9 03FF 013F
        DECLE   $0088,  $018B,  $012D,  $013F   ; F83E   0088 018B 012D 013F
        DECLE   $0104,  $0109,  $02E4,  $03E7   ; F842   0104 0109 02E4 03E7
        DECLE   $0126,  $03E0,  $01DF,  $020F   ; F846   0126 03E0 01DF 020F
        DECLE   $0251,  $03FF,  $03FF,  $03FF   ; F84A   0251 03FF 03FF 03FF
        DECLE   $013F                           ; F84E   013F

        XOR@    R5,     R1                      ; F84F   03E9
        MOVR    R3,     R0                      ; F850   0098
        SUBR    R4,     R7                      ; F851   0127

        DECLE   $027F                           ; F852   027F

        MVI@    R2,     R5                      ; F853   0295
        SUBR    R2,     R5                      ; F854   0115
        MOVR    R3,     R7                      ; F855   009F

        SUBR    R1,     R0                      ; F856   0108
        SUBR    R4,     R6                      ; F857   0126
        MOVR    R3,     R7                      ; F858   009F

        XORI    #$0109, R1                      ; F859   03F9 0109
        MOVR    R2,     R7                      ; F85B   0097

        DECLE   $013F,  $03E4,  $0309,  $013F   ; F85C   013F 03E4 0309 013F

        ADDI    #$0099, R0                      ; F860   02F8 0099
        ADDR    R3,     R7                      ; F862   00DF

        DECLE   $0009,  $0000,  $0000,  $0000   ; F863   0009 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F867   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $022F,  $024D   ; F86B   0000 0080 022F 024D
        DECLE   $025C,  $0290,  $02AD,  $02CE   ; F86F   025C 0290 02AD 02CE
        DECLE   $0000                           ; F873   0000

        ADDR    R4,     R4                      ; F874   00E4
        ADDR    R4,     R4                      ; F875   00E4
        ADDR    R5,     R1                      ; F876   00E9
        XOR@    R5,     R1                      ; F877   03E9
        NEGR    R1                              ; F878   0021
        NEGR    R1                              ; F879   0021
        NEGR    R1                              ; F87A   0021
        NEGR    R1                              ; F87B   0021
        NEGR    R1                              ; F87C   0021
        SUBR    R4,     R4                      ; F87D   0124
        SUB@    R5,     R1                      ; F87E   0329
        ADDI    #$02F9, R0                      ; F87F   02F8 02F9
        XOR@    R4,     R4                      ; F881   03E4
        SUBR    R4,     R4                      ; F882   0124
        ADDR    R4,     R7                      ; F883   00E7

        TSTR    R1                              ; F884   0089
        SUBR    R0,     R7                      ; F885   0107

        XOR@    R5,     R1                      ; F886   03E9
        ADDR    R5,     R0                      ; F887   00E8
        SUBR    R4,     R7                      ; F888   0127

        DECLE   $03FF,  $03FF,  $03FF           ; F889   03FF 03FF 03FF

        SUB@    R5,     R1                      ; F88C   0329
        ADDI    #$0319, R0                      ; F88D   02F8 0319
        ADDI    #$03E4, R1                      ; F88F   02F9 03E4
        MOVR    R3,     R0                      ; F891   0098
        MOVR    R2,     R7                      ; F892   0097
        MOVR    R3,     R7                      ; F893   009F
        SUBR    R0,     R7                      ; F894   0107

        DECLE   $03E9,  $03FF,  $03FF,  $03FF   ; F895   03E9 03FF 03FF 03FF
        DECLE   $03FF,  $03FF                   ; F899   03FF 03FF

        SUBR    R3,     R7                      ; F89B   011F

        SUB     G_013F, R4                      ; F89C   0304 013F
        ADDI    #$03E4, R1                      ; F89E   02F9 03E4
        ADDR    R4,     R4                      ; F8A0   00E4
        SUBR    R4,     R7                      ; F8A1   0127
        MOVR    R3,     R7                      ; F8A2   009F

        ADDR    R5,     R1                      ; F8A3   00E9
        SUBR    R5,     R0                      ; F8A4   0128
        ADDI    #$0126, R7                      ; F8A5   02FF 0126

        DECLE   $03FF,  $03FF,  $03E9,  $02E9   ; F8A7   03FF 03FF 03E9 02E9
        DECLE   $0098,  $03FF,  $03FF,  $03FF   ; F8AB   0098 03FF 03FF 03FF
        DECLE   $013F,  $0317,  $0089,  $03E9   ; F8AF   013F 0317 0089 03E9
        DECLE   $03E7,  $03FF,  $03FF           ; F8B3   03E7 03FF 03FF

        MOVR    R3,     R7                      ; F8B6   009F

        AND@    R1,     R0                      ; F8B7   0388
        TSTR    R1                              ; F8B8   0089
        MOVR    R3,     R7                      ; F8B9   009F

        DECLE   $03E4,  $001F,  $03FF           ; F8BA   03E4 001F 03FF

        SUBR    R7,     R0                      ; F8BD   0138
        SUBR    R4,     R4                      ; F8BE   0124
        SUBR    R4,     R6                      ; F8BF   0126
        ADDR    R3,     R7                      ; F8C0   00DF

        CMPR    R3,     R6                      ; F8C1   015E
        SUBR    R3,     R6                      ; F8C2   011E
        SUBR    R3,     R7                      ; F8C3   011F

        DECLE   $03E9,  $00E4,  $03E9,  $03FF   ; F8C4   03E9 00E4 03E9 03FF
        DECLE   $03FF,  $03FF                   ; F8C8   03FF 03FF

        MOVR    R3,     R7                      ; F8CA   009F

        ANDR    R1,     R3                      ; F8CB   018B
        SUBR    R5,     R5                      ; F8CC   012D
        SUB@    R3,     R7                      ; F8CD   031F

        DECLE   $03E7                           ; F8CE   03E7

        ADD@    R5,     R1                      ; F8CF   02E9
        SUBR    R7,     R0                      ; F8D0   0138
        SUBR    R5,     R0                      ; F8D1   0128
        MOVR    R3,     R7                      ; F8D2   009F

        DECLE   $0126,  $01DF                   ; F8D3   0126 01DF

        BESC    L_FB28                          ; F8D5   020F 0251
        MOVR    R3,     R7                      ; F8D7   009F

        DECLE   $03E7,  $0104,  $0329,  $0098   ; F8D8   03E7 0104 0329 0098
        DECLE   $013F,  $0097,  $027F,  $0295   ; F8DC   013F 0097 027F 0295
        DECLE   $02D5,  $00FF,  $0018,  $0000   ; F8E0   02D5 00FF 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F8E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $02E0   ; F8E8   0000 0000 0000 02E0
        DECLE   $021B                           ; F8EC   021B

        MVO@    R4,     R1                      ; F8ED   024C
        MVO@    R4,     R3                      ; F8EE   025C
        MVI@    R1,     R6                      ; F8EF   028E
        MVI@    R3,     R0                      ; F8F0   0298
        MVI@    R4,     R7                      ; F8F1   02A7

        DECLE   $0000,  $02FF,  $02F6,  $02B5   ; F8F2   0000 02FF 02F6 02B5
        DECLE   $02B5,  $02B5,  $02B5,  $03F6   ; F8F6   02B5 02B5 02B5 03F6
        DECLE   $03FF,  $02FF,  $03F6,  $019F   ; F8FA   03FF 02FF 03F6 019F

        RRC     R1,     1                       ; F8FE   0071
        SLR     R3,     1                       ; F8FF   0063
        SLR     R1,     2                       ; F900   0065
        SLR     R1,     2                       ; F901   0065
        SLR     R1,     2                       ; F902   0065
        XOR@    R4,     R3                      ; F903   03E3
        ADD@    R2,     R7                      ; F904   02D7

        DECLE   $007F,  $03E3,  $01D7,  $006F   ; F905   007F 03E3 01D7 006F
        DECLE   $024D,  $0252,  $0252,  $0212   ; F909   024D 0252 0252 0212
        DECLE   $03E3,  $022C,  $00BF,  $02C3   ; F90D   03E3 022C 00BF 02C3
        DECLE   $03E4,  $03FF,  $03FF,  $03FF   ; F911   03E4 03FF 03FF 03FF
        DECLE   $03FF,  $03FF,  $03E3,  $01EE   ; F915   03FF 03FF 03E3 01EE
        DECLE   $021F,  $0065,  $03E5,  $0084   ; F919   021F 0065 03E5 0084
        DECLE   $024D,  $0252,  $0212,  $03E4   ; F91D   024D 0252 0212 03E4
        DECLE   $03FF,  $0084,  $03FF,  $0070   ; F921   03FF 0084 03FF 0070
        DECLE   $03E3,  $03FF,  $03FF,  $03FF   ; F925   03E3 03FF 03FF 03FF

        MOVR    R3,     R7                      ; F929   009F

        MOVR    R0,     R5                      ; F92A   0085
        MOVR    R3,     R7                      ; F92B   009F

        SLR     R3,     1                       ; F92C   0063
        XOR@    R4,     R4                      ; F92D   03E4
        SLR     R0,     2                       ; F92E   0064
        MOVR    R0,     R3                      ; F92F   0083
        MOVR    R3,     R7                      ; F930   009F

        DECLE   $024D,  $0090,  $03FF,  $03FF   ; F931   024D 0090 03FF 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $007F   ; F935   03FF 03FF 03FF 007F
        DECLE   $01A5,  $00BF,  $03FF           ; F939   01A5 00BF 03FF

        SARC    R3,     2                       ; F93C   007F
        MOVR    R0,     R4                      ; F93D   0084
        MOVR    R3,     R7                      ; F93E   009F

        MOVR    R0,     R4                      ; F93F   0084
        MOVR    R3,     R7                      ; F940   009F

        DECLE   $0084,  $007F,  $03E3,  $03FF   ; F941   0084 007F 03E3 03FF
        DECLE   $009F,  $00BF,  $024D,  $025F   ; F945   009F 00BF 024D 025F
        DECLE   $00B0,  $03FF,  $00BF,  $007F   ; F949   00B0 03FF 00BF 007F
        DECLE   $03E3,  $0084,  $00A4,  $03FF   ; F94D   03E3 0084 00A4 03FF
        DECLE   $03FF,  $03FF,  $03FF,  $009F   ; F951   03FF 03FF 03FF 009F
        DECLE   $007F,  $007F,  $03E5,  $03FF   ; F955   007F 007F 03E5 03FF
        DECLE   $03FF,  $009F,  $0084,  $0084   ; F959   03FF 009F 0084 0084
        DECLE   $0084,  $00A4,  $03FF           ; F95D   0084 00A4 03FF

        SARC    R3,     2                       ; F960   007F
        MOVR    R0,     R3                      ; F961   0083
        MOVR    R0,     R4                      ; F962   0084
        MOVR    R0,     R4                      ; F963   0084
        TSTR    R4                              ; F964   00A4
        MVO@    R5,     R1                      ; F965   024D
        MOVR    R6,     R0                      ; F966   00B0
        SLR     R3,     1                       ; F967   0063
        SLR     R3,     1                       ; F968   0063
        MOVR    R0,     R4                      ; F969   0084
        SLR     R0,     2                       ; F96A   0064
        MVO@    R6,     R4                      ; F96B   0266
        MVI     .BTAB.BA,R2                     ; F96C   0282 02BA
        MVI@    R5,     R6                      ; F96E   02AE
        ADD     .STIC.X.0,R6                    ; F96F   02C6 0000
        XOR@    R6,     R6                      ; F971   03F6
        MOVR    R3,     R7                      ; F972   009F
        PULR    R7                              ; F973   02B7

        DECLE   $0096,  $02E4,  $02D5,  $03E4   ; F974   0096 02E4 02D5 03E4
        DECLE   $03FF,  $02FF,  $0075,  $03E5   ; F978   03FF 02FF 0075 03E5
        DECLE   $00B7                           ; F97C   00B7

        SLR     R3,     1                       ; F97D   0063
        SLR     R3,     1                       ; F97E   0063
        SLR     R3,     1                       ; F97F   0063
        SLR     R3,     1                       ; F980   0063
        XOR@    R4,     R3                      ; F981   03E3
        ADD@    R2,     R7                      ; F982   02D7

        DECLE   $007F,  $0063,  $02C3,  $0065   ; F983   007F 0063 02C3 0065
        DECLE   $024D,  $00B0,  $01A5,  $0212   ; F987   024D 00B0 01A5 0212
        DECLE   $03E5,  $0065,  $00BF,  $0065   ; F98B   03E5 0065 00BF 0065
        DECLE   $0063,  $0063,  $03FF,  $007F   ; F98F   0063 0063 03FF 007F
        DECLE   $03E3,  $03FF,  $03FF,  $03FF   ; F993   03E3 03FF 03FF 03FF
        DECLE   $021F,  $0063,  $01A5,  $0212   ; F997   021F 0063 01A5 0212
        DECLE   $009F,  $03FF,  $03FF,  $02C4   ; F99B   009F 03FF 03FF 02C4
        DECLE   $02FF,  $0084,  $03FF,  $0065   ; F99F   02FF 0084 03FF 0065
        DECLE   $03E3,  $03FF,  $00BF,  $009F   ; F9A3   03E3 03FF 00BF 009F
        DECLE   $0084,  $0223,  $019F           ; F9A7   0084 0223 019F

        SLR     R3,     1                       ; F9AA   0063
        XOR@    R4,     R4                      ; F9AB   03E4
        RRC     R0,     1                       ; F9AC   0070
        XOR@    R4,     R3                      ; F9AD   03E3
        ADD@    R2,     R7                      ; F9AE   02D7

        DECLE   $03FF,  $03FF,  $00BF,  $01E3   ; F9AF   03FF 03FF 00BF 01E3
        DECLE   $01DF,  $03E3,  $03FF,  $007F   ; F9B3   01DF 03E3 03FF 007F
        DECLE   $03E5,  $022C,  $009F,  $0084   ; F9B7   03E5 022C 009F 0084
        DECLE   $021F,  $01E3,  $01DF           ; F9BB   021F 01E3 01DF

        XOR@    R4,     R3                      ; F9BE   03E3
        ADD@    R2,     R7                      ; F9BF   02D7

        DECLE   $007F,  $03E3,  $01EE,  $03FF   ; F9C0   007F 03E3 01EE 03FF
        DECLE   $007F,  $03FF,  $0083,  $01DF   ; F9C4   007F 03FF 0083 01DF

        XOR@    R4,     R3                      ; F9C8   03E3
        SLR     R1,     2                       ; F9C9   0065
        SARC    R3,     2                       ; F9CA   007F
        XOR@    R4,     R3                      ; F9CB   03E3
        MOVR    R0,     R4                      ; F9CC   0084
L_F9CD:
        MOVR    R3,     R7                      ; F9CD   009F

        DECLE   $00BF,  $03E4,  $03FF,  $009F   ; F9CE   00BF 03E4 03FF 009F
        DECLE   $03E3,  $00A3,  $007F,  $03E5   ; F9D2   03E3 00A3 007F 03E5
        DECLE   $03FF,  $00BF,  $03FF,  $03FF   ; F9D6   03FF 00BF 03FF 03FF
        DECLE   $0084,  $03FF,  $03FF,  $03FF   ; F9DA   0084 03FF 03FF 03FF
        DECLE   $007F,  $01A3,  $0252,  $0070   ; F9DE   007F 01A3 0252 0070
        DECLE   $0084,  $0084,  $0063,  $024D   ; F9E2   0084 0084 0063 024D
        DECLE   $0252,  $0252,  $0070,  $02A4   ; F9E6   0252 0252 0070 02A4
        DECLE   $0275,  $02BD,  $02C0,  $0249   ; F9EA   0275 02BD 02C0 0249
        DECLE   $0000,  $02D5,  $03FF,  $02B7   ; F9EE   0000 02D5 03FF 02B7
        DECLE   $02B5,  $02B5,  $02D5,  $03FF   ; F9F2   02B5 02B5 02D5 03FF

        PULR    R7                              ; F9F6   02B7

        PULR    R5                              ; F9F7   02B5
        XOR@    R4,     R3                      ; F9F8   03E3
        SLR     R1,     2                       ; F9F9   0065
        PULR    R7                              ; F9FA   02B7

        DECLE   $0063,  $0063,  $0063,  $0063   ; F9FB   0063 0063 0063 0063
        DECLE   $02D5,  $0065,  $0065,  $02C3   ; F9FF   02D5 0065 0065 02C3
        DECLE   $0063,  $00A3,  $03FF,  $03FF   ; FA03   0063 00A3 03FF 03FF
        DECLE   $021F,  $0065,  $00A3,  $03FF   ; FA07   021F 0065 00A3 03FF
        DECLE   $03FF,  $007F,  $0063,  $03FF   ; FA0B   03FF 007F 0063 03FF
        DECLE   $01BF,  $0212,  $03FF,  $021F   ; FA0F   01BF 0212 03FF 021F

        SLR     R3,     1                       ; FA13   0063
        MOVR    R3,     R7                      ; FA14   009F

        MOVR    R0,     R4                      ; FA15   0084
        SARC    R3,     2                       ; FA16   007F
        ANDR    R4,     R5                      ; FA17   01A5
        MOVR    R3,     R7                      ; FA18   009F

        DECLE   $024D,  $0252,  $0090,  $03FF   ; FA19   024D 0252 0090 03FF
        DECLE   $03FF,  $03FF,  $007F,  $007F   ; FA1D   03FF 03FF 007F 007F
        DECLE   $03E3,  $00BF,  $03FF,  $03FF   ; FA21   03E3 00BF 03FF 03FF
        DECLE   $00BF                           ; FA25   00BF

        XOR@    R4,     R4                      ; FA26   03E4
        XOR@    R4,     R4                      ; FA27   03E4
        ADD@    R2,     R7                      ; FA28   02D7

        DECLE   $00BF                           ; FA29   00BF

        SARC    R3,     2                       ; FA2A   007F
        XOR@    R4,     R3                      ; FA2B   03E3
        SLR     R0,     2                       ; FA2C   0064
        MOVR    R3,     R7                      ; FA2D   009F

        DECLE   $0084,  $03FF,  $03FF,  $03E3   ; FA2E   0084 03FF 03FF 03E3
        DECLE   $022C,  $03FF,  $007F,  $03E5   ; FA32   022C 03FF 007F 03E5
        DECLE   $03FF,  $03FF                   ; FA36   03FF 03FF

        MOVR    R6,     R0                      ; FA38   00B0
        MOVR    R0,     R4                      ; FA39   0084
        MOVR    R0,     R4                      ; FA3A   0084
        XOR@    R4,     R5                      ; FA3B   03E5
        XORR    R5,     R6                      ; FA3C   01EE
        MOVR    R3,     R7                      ; FA3D   009F

        DECLE   $007F,  $03E3,  $0084,  $03E4   ; FA3E   007F 03E3 0084 03E4
        DECLE   $03FF,  $03FF,  $03FF,  $03FF   ; FA42   03FF 03FF 03FF 03FF

        XORR    R5,     R6                      ; FA46   01EE
        SARC    R3,     2                       ; FA47   007F
        SARC    R3,     2                       ; FA48   007F
        XOR@    R4,     R3                      ; FA49   03E3
        MVO@    R5,     R1                      ; FA4A   024D
        MOVR    R2,     R0                      ; FA4B   0090
        ADDI    #$03F6, R7                      ; FA4C   02FF 03F6

        DECLE   $0084,  $03E4,  $0084,  $00BF   ; FA4E   0084 03E4 0084 00BF
L_FA52:
        SARC    R3,     2                       ; FA52   007F
        DECLE   $03E5,  $03FF,  $03FF,  $019F   ; FA53   03E5 03FF 03FF 019F
        DECLE   $03F1,  $03FF,  $03FF,  $03FF   ; FA57   03F1 03FF 03FF 03FF
        DECLE   $03FF,  $007F,  $0083,  $024D   ; FA5B   03FF 007F 0083 024D
        DECLE   $0212                           ; FA5F   0212

        XORR    R0,     R4                      ; FA60   01C4
        MOVR    R1,     R7                      ; FA61   008F

        DECLE   $01A4,  $0252,  $0252,  $0090   ; FA62   01A4 0252 0252 0090
        DECLE   $0064,  $0279,  $025B,  $027C   ; FA66   0064 0279 025B 027C
        DECLE   $0299,  $0274,  $0000           ; FA6A   0299 0274 0000

        MOVR    R1,     R2                      ; FA6D   008A
        CMPR    R0,     R4                      ; FA6E   0144
        MOVR    R0,     R4                      ; FA6F   0084
        MOVR    R1,     R2                      ; FA70   008A
        CMPR    R0,     R4                      ; FA71   0144
        MOVR    R0,     R4                      ; FA72   0084
        MOVR    R1,     R2                      ; FA73   008A
        CMPR    R0,     R4                      ; FA74   0144
        MOVR    R0,     R4                      ; FA75   0084
        MOVR    R1,     R2                      ; FA76   008A
        CMPR    R0,     R3                      ; FA77   0143
        SLR     R3,     1                       ; FA78   0063
        SLR     R3,     1                       ; FA79   0063
        SLR     R3,     1                       ; FA7A   0063
        SLR     R3,     1                       ; FA7B   0063
        SLR     R3,     1                       ; FA7C   0063
        SLR     R3,     1                       ; FA7D   0063
        MVI     G_0150, R3                      ; FA7E   0283 0150
        SLR     R3,     1                       ; FA80   0063
        ADDR    R0,     R7                      ; FA81   00C7

        ANDR    R5,     R0                      ; FA82   01A8
        SUB@    R3,     R7                      ; FA83   031F

        DECLE   $033F,  $0338                   ; FA84   033F 0338

        RRC     R0,     1                       ; FA86   0070
        SAR     R2,     1                       ; FA87   006A
        MVO@    R2,     R5                      ; FA88   026A
        ADDR    R5,     R7                      ; FA89   00EF

        SAR     R0,     1                       ; FA8A   0068
        SUBR    R5,     R1                      ; FA8B   0129
        XOR@    R5,     R1                      ; FA8C   03E9
        MOVR    R3,     R7                      ; FA8D   009F

        MOVR    R0,     R4                      ; FA8E   0084
        XOR@    R4,     R4                      ; FA8F   03E4
        SARC    R3,     2                       ; FA90   007F
        XORI    #$03F9, R0                      ; FA91   03F8 03F9
        SUBR    R5,     R7                      ; FA93   012F

        SAR     R1,     1                       ; FA94   0069
        CMPR    R0,     R3                      ; FA95   0143
        XOR@    R4,     R3                      ; FA96   03E3
        ANDR    R4,     R4                      ; FA97   01A4
        MVO@    R2,     R2                      ; FA98   0252
        MOVR    R2,     R0                      ; FA99   0090
        SUB@    R3,     R7                      ; FA9A   031F
        MOVR    R3,     R7                      ; FA9B   009F

        DECLE   $03E4,  $0143,  $006A,  $032A   ; FA9C   03E4 0143 006A 032A
        DECLE   $03F8,  $03F8,  $03FF           ; FAA0   03F8 03F8 03FF

        SUB@    R3,     R7                      ; FAA3   031F

        XOR@    R4,     R4                      ; FAA4   03E4
        CMPR    R0,     R4                      ; FAA5   0144
        XORI    #$033F, R0                      ; FAA6   03F8 033F
        SARC    R0,     1                       ; FAA8   0078
        XOR@    R4,     R3                      ; FAA9   03E3
        MOVR    R0,     R4                      ; FAAA   0084
        XOR@    R4,     R4                      ; FAAB   03E4
        MOVR    R0,     R4                      ; FAAC   0084
        XOR@    R4,     R4                      ; FAAD   03E4
        XORI    #$033F, R0                      ; FAAE   03F8 033F
        MOVR    R3,     R7                      ; FAB0   009F

        MOVR    R0,     R4                      ; FAB1   0084
        SARC    R3,     2                       ; FAB2   007F
        XOR@    R5,     R2                      ; FAB3   03EA
        XOR@    R5,     R2                      ; FAB4   03EA
        XORI    #$031F, R0                      ; FAB5   03F8 031F
        MOVR    R1,     R2                      ; FAB7   008A
        MOVR    R3,     R7                      ; FAB8   009F

        MOVR    R1,     R2                      ; FAB9   008A
        SAR     R2,     1                       ; FABA   006A
        SAR     R2,     1                       ; FABB   006A
        SARC    R3,     2                       ; FABC   007F
        XOR@    R4,     R3                      ; FABD   03E3
        XORI    #$0084, R1                      ; FABE   03F9 0084
        XOR@    R4,     R4                      ; FAC0   03E4
        XORI    #$031F, R1                      ; FAC1   03F9 031F
        ANDR    R4,     R3                      ; FAC3   01A3
        MVO@    R2,     R2                      ; FAC4   0252
        RRC     R0,     1                       ; FAC5   0070
        SARC    R3,     2                       ; FAC6   007F
        XOR@    R5,     R2                      ; FAC7   03EA
        MOVR    R0,     R4                      ; FAC8   0084
        SAR     R2,     1                       ; FAC9   006A
        XORI    #$0084, R0                      ; FACA   03F8 0084
        XOR@    R4,     R4                      ; FACC   03E4
        XORI    #$03FF, R1                      ; FACD   03F9 03FF
        SUBI    #$007F, R7                      ; FACF   033F 007F

        DECLE   $03E3,  $03FF                   ; FAD1   03E3 03FF

        XORI    #$009F, R1                      ; FAD3   03F9 009F
        ADDR    R0,     R7                      ; FAD5   00C7

        DECLE   $0088,  $0084,  $0084,  $0084   ; FAD6   0088 0084 0084 0084
        DECLE   $0064,  $01AA,  $0252,  $0252   ; FADA   0064 01AA 0252 0252
        DECLE   $0150,  $0129,  $0149,  $0063   ; FADE   0150 0129 0149 0063
        DECLE   $006A,  $006A,  $006A,  $0279   ; FAE2   006A 006A 006A 0279
        DECLE   $02AA,  $026F,  $028A,  $027D   ; FAE6   02AA 026F 028A 027D
        DECLE   $0000                           ; FAEA   0000

        XOR@    R4,     R4                      ; FAEB   03E4
        MOVR    R0,     R4                      ; FAEC   0084
        MOVR    R3,     R7                      ; FAED   009F

        XOR@    R4,     R4                      ; FAEE   03E4
        MOVR    R0,     R4                      ; FAEF   0084
        MOVR    R3,     R7                      ; FAF0   009F

        DECLE   $03E4,  $03FF,  $029F,  $0070   ; FAF1   03E4 03FF 029F 0070
        DECLE   $0063,  $0063,  $0063,  $0063   ; FAF5   0063 0063 0063 0063
        DECLE   $0063,  $0063,  $03E3,  $0063   ; FAF9   0063 0063 03E3 0063
        DECLE   $027F                           ; FAFD   027F

        SAR     R3,     2                       ; FAFE   006F
        CMPR    R0,     R3                      ; FAFF   0143
        CMPR    R0,     R3                      ; FB00   0143
        CMPR    R0,     R3                      ; FB01   0143
        ADDR    R0,     R7                      ; FB02   00C7

        DECLE   $0148,  $0143,  $03E3,  $0143   ; FB03   0148 0143 03E3 0143
        DECLE   $015F,  $006F,  $03EA,  $0318   ; FB07   015F 006F 03EA 0318
        DECLE   $007F,  $0129,  $03E9,  $0338   ; FB0B   007F 0129 03E9 0338
        DECLE   $03E3,  $03E3,  $01BF           ; FB0F   03E3 03E3 01BF

        RRC     R2,     1                       ; FB12   0072
        XOR@    R4,     R3                      ; FB13   03E3
        CMPR    R0,     R4                      ; FB14   0144
        SARC    R3,     2                       ; FB15   007F
        SUB@    R3,     R0                      ; FB16   0318
        XORI    #$03E4, R0                      ; FB17   03F8 03E4
        XORI    #$03F8, R0                      ; FB19   03F8 03F8
        ADDR    R4,     R4                      ; FB1B   00E4
        SAR     R0,     1                       ; FB1C   0068
        XOR@    R5,     R2                      ; FB1D   03EA
        SLR     R3,     1                       ; FB1E   0063
        CMPR    R3,     R7                      ; FB1F   015F
        MOVR    R3,     R7                      ; FB20   009F

        MOVR    R0,     R4                      ; FB21   0084
        XOR@    R5,     R2                      ; FB22   03EA
        MOVR    R0,     R4                      ; FB23   0084
        XOR@    R4,     R4                      ; FB24   03E4
        SUBR    R5,     R2                      ; FB25   012A
        SAR     R1,     1                       ; FB26   0069
        XOR@    R4,     R3                      ; FB27   03E3
L_FB28:
        SAR     R2,     1                       ; FB28   006A
        DECLE   $033F,  $031F,  $03F8,  $03E3   ; FB29   033F 031F 03F8 03E3
        DECLE   $0143,  $03FF                   ; FB2D   0143 03FF

        XORI    #$006A, R0                      ; FB2F   03F8 006A
        XOR@    R5,     R2                      ; FB31   03EA
        XORI    #$0084, R0                      ; FB32   03F8 0084
        MOVR    R3,     R7                      ; FB34   009F

        XOR@    R4,     R4                      ; FB35   03E4
        XORI    #$033F, R0                      ; FB36   03F8 033F
        MOVR    R3,     R7                      ; FB38   009F

        XOR@    R4,     R4                      ; FB39   03E4
        SARC    R3,     2                       ; FB3A   007F
        MOVR    R0,     R3                      ; FB3B   0083
        XOR@    R4,     R4                      ; FB3C   03E4
        SAR     R2,     1                       ; FB3D   006A
        SARC    R3,     2                       ; FB3E   007F
        MOVR    R1,     R2                      ; FB3F   008A
        MOVR    R3,     R7                      ; FB40   009F

        XOR@    R4,     R4                      ; FB41   03E4
        SLR     R0,     2                       ; FB42   0064
        MOVR    R1,     R2                      ; FB43   008A
        SARC    R3,     2                       ; FB44   007F
        ADDR    R0,     R7                      ; FB45   00C7

        XOR@    R5,     R0                      ; FB46   03E8
        XORI    #$03FF, R1                      ; FB47   03F9 03FF
        MVO@    R5,     R1                      ; FB49   024D
        MVO@    R7,     R3                      ; FB4A   025F
        XOR@    R6,     R0                      ; FB4B   03F0
        XORI    #$03F9, R1                      ; FB4C   03F9 03F9
L_FB4E:
        SARC    R3,     2                       ; FB4E   007F
        DECLE   $0129,  $0089,  $0084,  $03E4   ; FB4F   0129 0089 0084 03E4
        DECLE   $03FF,  $03FF,  $03FF,  $01AA   ; FB53   03FF 03FF 03FF 01AA
        DECLE   $0212                           ; FB57   0212

        SAR     R2,     1                       ; FB58   006A
        CMPR    R0,     R3                      ; FB59   0143
        ANDR    R4,     R3                      ; FB5A   01A3
        MVO@    R2,     R2                      ; FB5B   0252
        MOVR    R2,     R0                      ; FB5C   0090
        MOVR    R1,     R2                      ; FB5D   008A
        CMPR    R0,     R4                      ; FB5E   0144
        MOVR    R0,     R4                      ; FB5F   0084
        MVO@    R5,     R1                      ; FB60   024D
        MVO@    R2,     R2                      ; FB61   0252
        RRC     R0,     1                       ; FB62   0070
        MVII    #$027E, R2                      ; FB63   02BA 027E
        MVI@    R2,     R7                      ; FB65   0297

        DECLE   $0273,  $025B,  $0000,  $008A   ; FB66   0273 025B 0000 008A
        DECLE   $0144,  $0084,  $008A,  $0144   ; FB6A   0144 0084 008A 0144
        DECLE   $0084,  $008A,  $0144,  $0084   ; FB6E   0084 008A 0144 0084
        DECLE   $008A,  $0063,  $0063,  $0063   ; FB72   008A 0063 0063 0063
        DECLE   $0063,  $0063,  $0063,  $0063   ; FB76   0063 0063 0063 0063
        DECLE   $0323,  $03FF                   ; FB7A   0323 03FF

        SARC    R1,     1                       ; FB7C   0079
        SUB     G_031F, R3                      ; FB7D   0303 031F
        CMPR    R3,     R7                      ; FB7F   015F
        SLR     R3,     1                       ; FB80   0063
        XOR@    R5,     R2                      ; FB81   03EA
        SUB@    R3,     R7                      ; FB82   031F

        SUB     G_03FF, R3                      ; FB83   0303 03FF
        MOVR    R0,     R4                      ; FB85   0084
        SARC    R3,     2                       ; FB86   007F
        XOR@    R5,     R2                      ; FB87   03EA
        MOVR    R0,     R4                      ; FB88   0084
        SUBI    #$03FF, R7                      ; FB89   033F 03FF

        XORI    #$03E4, R1                      ; FB8B   03F9 03E4
        XOR@    R5,     R2                      ; FB8D   03EA
        XOR@    R4,     R4                      ; FB8E   03E4
        SUB@    R3,     R0                      ; FB8F   0318
        SARC    R3,     2                       ; FB90   007F
        XOR@    R4,     R3                      ; FB91   03E3
        SARC    R0,     1                       ; FB92   0078
        MOVR    R1,     R2                      ; FB93   008A
        MOVR    R3,     R7                      ; FB94   009F

        MOVR    R1,     R2                      ; FB95   008A
        XOR@    R4,     R3                      ; FB96   03E3
        XORI    #$009F, R1                      ; FB97   03F9 009F
        XOR@    R4,     R4                      ; FB99   03E4
        SAR     R2,     1                       ; FB9A   006A
        MOVR    R0,     R3                      ; FB9B   0083
        SUB@    R3,     R7                      ; FB9C   031F

        DECLE   $024D,  $025F,  $03F0,  $03F9   ; FB9D   024D 025F 03F0 03F9
        DECLE   $0214,  $015F,  $03E3,  $0063   ; FBA1   0214 015F 03E3 0063
        DECLE   $006A,  $03E4,  $03FF,  $03FF   ; FBA5   006A 03E4 03FF 03FF
        DECLE   $03FF                           ; FBA9   03FF

        XOR@    R4,     R4                      ; FBAA   03E4
        XORR    R6,     R3                      ; FBAB   01F3
        SUBI    #$03FF, R7                      ; FBAC   033F 03FF

        DECLE   $0070,  $03E3,  $03F9,  $0084   ; FBAE   0070 03E3 03F9 0084
        DECLE   $03E4,  $0084,  $03EA,  $01EA   ; FBB2   03E4 0084 03EA 01EA
        DECLE   $014A,  $03EA,  $007F,  $03E3   ; FBB6   014A 03EA 007F 03E3
        DECLE   $01A4,  $0212,  $03E3,  $0318   ; FBBA   01A4 0212 03E3 0318
        DECLE   $03F9,  $024D,  $0252,  $0150   ; FBBE   03F9 024D 0252 0150
        DECLE   $007F,  $03EA,  $03EA,  $03FF   ; FBC2   007F 03EA 03EA 03FF
        DECLE   $03F8,  $0084,  $03E4,  $03FF   ; FBC6   03F8 0084 03E4 03FF
        DECLE   $03FF                           ; FBCA   03FF

        SUBI    #$007F, R7                      ; FBCB   033F 007F

        XOR@    R4,     R3                      ; FBCD   03E3
        XORI    #$00E4, R1                      ; FBCE   03F9 00E4
        MOVR    R1,     R0                      ; FBD0   0088
        ADDR    R0,     R7                      ; FBD1   00C7

        MOVR    R1,     R0                      ; FBD2   0088
        MOVR    R0,     R4                      ; FBD3   0084
        SUBR    R0,     R7                      ; FBD4   0107

        DECLE   $00E4,  $0068,  $0143,  $0084   ; FBD5   00E4 0068 0143 0084
        DECLE   $012A,  $0149,  $0129,  $0069   ; FBD9   012A 0149 0129 0069
        DECLE   $0143,  $0129,  $0123,  $0069   ; FBDD   0143 0129 0123 0069
        DECLE   $0242,  $028F,  $027F,  $025D   ; FBE1   0242 028F 027F 025D
        DECLE   $0275,  $0000                   ; FBE5   0275 0000
L_FBE7:
        DECR    R7                              ; FBE7   0017

        DECLE   $009E,  $000A,  $008E,  $0002   ; FBE8   009E 000A 008E 0002
        DECLE   $00A8,  $0000,  $0028,  $0015   ; FBEC   00A8 0000 0028 0015
        DECLE   $009C,  $000C,  $009E,  $0000   ; FBF0   009C 000C 009E 0000
        DECLE   $008E,  $0018,  $000C,  $000C   ; FBF4   008E 0018 000C 000C
        DECLE   $00A8,  $0000                   ; FBF8   00A8 0000

        MOVR    R3,     R0                      ; FBFA   0098
        ADDR    R4,     R7                      ; FBFB   00E7

        ADDR    R7,     R3                      ; FBFC   00FB
        ADDR    R5,     R7                      ; FBFD   00EF

        DECLE   $00FB,  $00F5,  $00FB,  $0076   ; FBFE   00FB 00F5 00FB 0076
        DECLE   $00F7,  $00F5,  $00F7           ; FC02   00F7 00F5 00F7

        RRC     R0,     2                       ; FC05   0074
        ADDR    R7,     R0                      ; FC06   00F8
        ADDR    R6,     R3                      ; FC07   00F3
        ADDR    R7,     R0                      ; FC08   00F8
        RRC     R1,     1                       ; FC09   0071
        ADDR    R7,     R1                      ; FC0A   00F9
        ADDR    R5,     R7                      ; FC0B   00EF

        DECLE   $00F9,  $006D,  $00FA,  $00EB   ; FC0C   00F9 006D 00FA 00EB
        DECLE   $00FA,  $0069,  $00FB,  $0000   ; FC10   00FA 0069 00FB 0000
        DECLE   $0000,  $0010,  $0028,  $0018   ; FC14   0000 0010 0028 0018
        DECLE   $0028,  $0020,  $00E8,  $0028   ; FC18   0028 0020 00E8 0028
        DECLE   $00E8,  $0000,  $0000,  $0000   ; FC1C   00E8 0000 0000 0000
        DECLE   $000E,  $0008,  $000E,  $0010   ; FC20   000E 0008 000E 0010
        DECLE   $00CE,  $0020,  $00CE,  $0000   ; FC24   00CE 0020 00CE 0000
        DECLE   $0000,  $0000                   ; FC28   0000 0000

        COMR    R0                              ; FC2A   0018
        INCR    R0                              ; FC2B   0008
        COMR    R0                              ; FC2C   0018
        DECR    R0                              ; FC2D   0010
        ADDR    R3,     R0                      ; FC2E   00D8
        NEGR    R0                              ; FC2F   0020
        ADDR    R3,     R0                      ; FC30   00D8
        MOVR    R4,     R7                      ; FC31   00A7

        DECLE   $0007,  $004E,  $0066,  $00DA   ; FC32   0007 004E 0066 00DA
        DECLE   $0066,  $004E,  $0066,  $00E3   ; FC36   0066 004E 0066 00E3
        DECLE   $0047,  $004E,  $0066,  $007F   ; FC3A   0047 004E 0066 007F
        DECLE   $0011,  $004E,  $0066,  $002A   ; FC3E   0011 004E 0066 002A
        DECLE   $00D1,  $004E,  $0066,  $00A6   ; FC42   00D1 004E 0066 00A6
        DECLE   $0048,  $004E,  $0066,  $00D0   ; FC46   0048 004E 0066 00D0
        DECLE   $000B,  $004E,  $0066,  $0066   ; FC4A   000B 004E 0066 0066
        DECLE   $00EB,  $004E,  $0066,  $00DA   ; FC4E   00EB 004E 0066 00DA
        DECLE   $0081,  $004E,  $0066,  $0060   ; FC52   0081 004E 0066 0060
        DECLE   $0080,  $00CE,  $0065,  $00D8   ; FC56   0080 00CE 0065 00D8
        DECLE   $003D,  $00C9,  $0065,  $003E   ; FC5A   003D 00C9 0065 003E
        DECLE   $00C2,  $0060,  $0065,  $00DA   ; FC5E   00C2 0060 0065 00DA
        DECLE   $0065,  $0042,  $0065,  $000F   ; FC62   0065 0042 0065 000F
        DECLE   $00BE,  $00BF                   ; FC66   00BE 00BF

        SLR     R1,     2                       ; FC68   0065
        SWAP    R1,     1                       ; FC69   0041
        MOVR    R1,     R2                      ; FC6A   008A
        ADDR    R2,     R1                      ; FC6B   00D1
        SLR     R1,     2                       ; FC6C   0065
        ADCR    R6                              ; FC6D   002E
        RSWD    R2                              ; FC6E   003A
        ADDR    R3,     R2                      ; FC6F   00DA
        SLR     R1,     2                       ; FC70   0065
        ADDR    R1,     R3                      ; FC71   00CB
        ADCR    R6                              ; FC72   002E
        SLLC    R3,     2                       ; FC73   005F
        SLR     R1,     2                       ; FC74   0065
        MOVR    R0,     R1                      ; FC75   0081
        ADDR    R1,     R1                      ; FC76   00C9
        ADDR    R3,     R1                      ; FC77   00D9
        SLR     R1,     2                       ; FC78   0065
        ADDR    R1,     R1                      ; FC79   00C9
        GSWD    R1                              ; FC7A   0031
        SLLC    R3,     1                       ; FC7B   005B
        SLL     R3,     1                       ; FC7C   004B
        MOVR    R3,     R6                      ; FC7D   009E
        MOVR    R4,     R2                      ; FC7E   00A2
        SLR     R2,     2                       ; FC7F   0066
        SWAP    R1,     2                       ; FC80   0045
        ADCR    R7                              ; FC81   002F

        ADDR    R0,     R3                      ; FC82   00C3
L_FC83:
        MOVR    R3,     R6                      ; FC83   009E
        MOVR    R5,     R3                      ; FC84   00AB
        ADDR    R0,     R4                      ; FC85   00C4
        RSWD    R5                              ; FC86   003D
        MOVR    R1,     R5                      ; FC87   008D
        RLC     R2,     2                       ; FC88   0056
        INCR    R6                              ; FC89   000E
        MOVR    R1,     R7                      ; FC8A   008F

        DECLE   $00A6,  $003F,  $0058,  $00C6   ; FC8B   00A6 003F 0058 00C6
        DECLE   $009D,  $00C3,  $00B9,  $0023   ; FC8F   009D 00C3 00B9 0023
        DECLE   $0026,  $004E,  $002A,  $00AB   ; FC93   0026 004E 002A 00AB
        DECLE   $0072,  $009D,  $0025,  $00B9   ; FC97   0072 009D 0025 00B9
        DECLE   $008D,  $00C9,  $0000,  $003A   ; FC9B   008D 00C9 0000 003A
        DECLE   $0000,  $00AA,  $0000           ; FC9F   0000 00AA 0000

        MOVR    R5,     R2                      ; FCA2   00AA
L_FCA3:
        MVI     G_015E, R0                      ; FCA3   0280 015E
        ANDI    #$0001, R0                      ; FCA5   03B8 0001
        B       L_FCBD                          ; FCA7   0200 0014

L_FCA9:
        MVI     G_015E, R0                      ; FCA9   0280 015E
        SLR     R0,     1                       ; FCAB   0060
        ADDI    #$0002, R0                      ; FCAC   02F8 0002
        B       L_FCBD                          ; FCAE   0200 000D

L_FCB0:
        MVII    #$0005, R0                      ; FCB0   02B8 0005
        B       L_FCB6                          ; FCB2   0200 0002

L_FCB4:
        MVII    #$0006, R0                      ; FCB4   02B8 0006
L_FCB6:
        CLRR    R4                              ; FCB6   01E4
        MVO     R4,     G_0149                  ; FCB7   0244 0149
        MVO     R4,     G_0145                  ; FCB9   0244 0145
        MVO     R4,     G_0146                  ; FCBB   0244 0146
L_FCBD:
        PSHR    R5                              ; FCBD   0275
        SDBD                                    ; FCBE   0001
        MVII    #$FCC9, R4                      ; FCBF   02BC 00C9 00FC
        ADDR    R0,     R4                      ; FCC2   00C4
        ADDR    R0,     R4                      ; FCC3   00C4
        SDBD                                    ; FCC4   0001
        MVI@    R4,     R5                      ; FCC5   02A5
        J       L_DE4B                          ; FCC6   0004 03DC 024B

        DECLE   $0090,  $00FD,  $00A3,  $00FD   ; FCC9   0090 00FD 00A3 00FD
        DECLE   $0061,  $00FD,  $00FD,  $00FE   ; FCCD   0061 00FD 00FD 00FE
        DECLE   $005E,  $00FF                   ; FCD1   005E 00FF

        MOVR    R7,     R5                      ; FCD3   00BD
        ADDR    R7,     R6                      ; FCD4   00FE
        NEGR    R6                              ; FCD5   0026
        SAR     R3,     2                       ; FCD6   006F
L_FCD7:
        PSHR    R5                              ; FCD7   0275

        JSR     R5,     L_DE4B                  ; FCD8   0004 01DC 024B
        DECLE   $012C,  $020D,  $037F,  $00FE   ; FCDB   012C 020D 037F 00FE
        DECLE   $00CC,  $015C,  $0132,  $00B9   ; FCDF   00CC 015C 0132 00B9
        DECLE   $0232                           ; FCE3   0232

        SUBR    R6,     R5                      ; FCE4   0135
        SUBR    R6,     R2                      ; FCE5   0132
        PULR    R2                              ; FCE6   02B2
        SUBR    R7,     R1                      ; FCE7   0139
        SUBR    R6,     R4                      ; FCE8   0134
        PULR    R0                              ; FCE9   02B0
        RSWD    R2                              ; FCEA   003A
        SUBR    R2,     R5                      ; FCEB   0115
        AND@    R2,     R2                      ; FCEC   0392
        SUBR    R0,     R7                      ; FCED   0107

        DECLE   $0384,  $0109,  $0385,  $0037   ; FCEE   0384 0109 0385 0037
        DECLE   $011A,  $0387,  $0385,  $0117   ; FCF2   011A 0387 0385 0117
        DECLE   $0384,  $0382,  $0039,  $0134   ; FCF6   0384 0382 0039 0134
        DECLE   $03B1,  $0062,  $0132,  $0399   ; FCFA   03B1 0062 0132 0399
        DECLE   $0382,  $0385,  $0135,  $0389   ; FCFE   0382 0385 0135 0389
        DECLE   $0385,  $0392,  $0037,  $0137   ; FD02   0385 0392 0037 0137
        DECLE   $03BA,  $0064,  $0130,  $0397   ; FD06   03BA 0064 0130 0397
        DECLE   $0380,  $0384,  $0134,  $0387   ; FD0A   0380 0384 0134 0387
        DECLE   $0384,  $0390,  $0035,  $0135   ; FD0E   0384 0390 0035 0135
        DECLE   $03B9,  $0062,  $00BA,  $0395   ; FD12   03B9 0062 00BA 0395
        DECLE   $030A,  $0382,  $0132,  $0385   ; FD16   030A 0382 0132 0385
        DECLE   $0382,  $031A,  $0034,  $0134   ; FD1A   0382 031A 0034 0134
        DECLE   $03B7,  $0061,  $00B9,  $0394   ; FD1E   03B7 0061 00B9 0394
        DECLE   $0309,  $0381,  $0131,  $0384   ; FD22   0309 0381 0131 0384
        DECLE   $0381,  $0319,  $0032,  $0132   ; FD26   0381 0319 0032 0132
        DECLE   $03B5,  $0037                   ; FD2A   03B5 0037

        SUBR    R3,     R2                      ; FD2C   011A
        AND     G_0385, R4                      ; FD2D   0384 0385
        SUBR    R2,     R7                      ; FD2F   0117

        AND     G_0382, R4                      ; FD30   0384 0382
        RSWD    R1                              ; FD32   0039
        SUBR    R2,     R4                      ; FD33   0114
        AND@    R2,     R1                      ; FD34   0391
        SUBR    R2,     R1                      ; FD35   0111
        AND@    R2,     R5                      ; FD36   0395
        RSWD    R2                              ; FD37   003A
        SUBR    R6,     R2                      ; FD38   0132
        AND     G_0385, R4                      ; FD39   0384 0385
        AND     G_0382, R4                      ; FD3B   0384 0382
        SAR     R1,     1                       ; FD3D   0069
        SUBR    R2,     R7                      ; FD3E   0117

        SUB@    R3,     R1                      ; FD3F   0319
        SUBR    R2,     R5                      ; FD40   0115
        AND@    R2,     R2                      ; FD41   0392
        SUBR    R2,     R4                      ; FD42   0114
        AND     G_0382, R1                      ; FD43   0381 0382
        SUBR    R2,     R7                      ; FD45   0117

        AND     G_0382, R4                      ; FD46   0384 0382
        GSWD    R2                              ; FD48   0032
        SUBR    R6,     R5                      ; FD49   0135
        AND@    R6,     R2                      ; FD4A   03B2
        RSWD    R5                              ; FD4B   003D
L_FD4C:
        PSHR    R5                              ; FD4C   0275

        JSR     R5,     L_DE4B                  ; FD4D   0004 01DC 024B
        DECLE   $008C,  $018D,  $00CC,  $011C   ; FD50   008C 018D 00CC 011C
        DECLE   $01BC,  $023C,  $00FE,  $00ED   ; FD54   01BC 023C 00FE 00ED
        DECLE   $0000,  $017F,  $0202,  $0201   ; FD58   0000 017F 0202 0201
        DECLE   $0203,  $0201,  $0205,  $01ED   ; FD5C   0203 0201 0205 01ED
        DECLE   $0007,  $0095,  $020D,  $018C   ; FD60   0007 0095 020D 018C
        DECLE   $00CC,  $014C,  $017E,  $00AD   ; FD64   00CC 014C 017E 00AD
        DECLE   $0002,  $00ED,  $0003,  $007F   ; FD68   0002 00ED 0003 007F
        DECLE   $0019,  $0094,  $0311,  $0019   ; FD6C   0019 0094 0311 0019
        DECLE   $0094,  $0301,  $0301,  $00B2   ; FD70   0094 0301 0301 00B2
        DECLE   $00B9,  $0311,  $029B,  $0019   ; FD74   00B9 0311 029B 0019
        DECLE   $0094,  $0311,  $0019,  $0094   ; FD78   0094 0311 0019 0094
        DECLE   $0311,  $01ED,  $03F5,  $0032   ; FD7C   0311 01ED 03F5 0032
        DECLE   $00B6,  $0301,  $028B,  $0289   ; FD80   00B6 0301 028B 0289
        DECLE   $028B,  $00FE,  $01AD,  $001F   ; FD84   028B 00FE 01AD 001F
        DECLE   $01AD,  $0024,  $0032,  $00B6   ; FD88   01AD 0024 0032 00B6
        DECLE   $0324,  $0302,  $01ED,  $0024   ; FD8C   0324 0302 01ED 0024
        DECLE   $008C,  $038D,  $007E,  $017F   ; FD90   008C 038D 007E 017F
        DECLE   $00BC,  $011C,  $019C,  $025C   ; FD94   00BC 011C 019C 025C
        DECLE   $025B,  $02B1,  $0292,  $025B   ; FD98   025B 02B1 0292 025B
        DECLE   $0219,  $0216,  $0217,  $0232   ; FD9C   0219 0216 0217 0232
        DECLE   $0211                           ; FDA0   0211

        PSHR    R6                              ; FDA1   0276
        RSWD    R5                              ; FDA2   003D
        MOVR    R1,     R4                      ; FDA3   008C
        ANDR    R1,     R4                      ; FDA4   018C
        ADDR    R7,     R6                      ; FDA5   00FE
        XORR    R1,     R5                      ; FDA6   01CD
        CMPR    R7,     R7                      ; FDA7   017F
        MOVR    R1,     R4                      ; FDA8   008C
        TSTR    R5                              ; FDA9   00AD
        EIS                                     ; FDAA   0002
        ADDR    R5,     R5                      ; FDAB   00ED
        EIS                                     ; FDAC   0002
        RSWD    R3                              ; FDAD   003B
        SUBR    R0,     R2                      ; FDAE   0102
        SUB     G_0102, R6                      ; FDAF   0306 0102
        SUB     .ISRVEC.1,R6                    ; FDB1   0306 0101
        SUB     .ISRVEC.1,R5                    ; FDB3   0305 0101
        SUB     G_0102, R5                      ; FDB5   0305 0102
        SUB     G_0102, R6                      ; FDB7   0306 0102
        SUB     .STIC.C.3,R6                    ; FDB9   0306 001B
        MOVR    R1,     R3                      ; FDBB   008B
        SUB     G_008B, R2                      ; FDBC   0302 008B
        SUB     .STIC.C.3,R2                    ; FDBE   0302 001B
        SUBR    R0,     R1                      ; FDC0   0101
        SUB     .ISRVEC.1,R4                    ; FDC1   0304 0101
        SUB     .STIC.C.3,R4                    ; FDC3   0304 001B
        SUBR    R0,     R2                      ; FDC5   0102
        SUB     G_0102, R6                      ; FDC6   0306 0102
        SUB     G_003B, R6                      ; FDC8   0306 003B
        SUBR    R0,     R4                      ; FDCA   0104
        SUB     G_0104, R7                      ; FDCB   0307 0104
        SUB     G_0103, R7                      ; FDCD   0307 0103

        SUB     G_0103, R6                      ; FDCF   0306 0103
        SUB     G_0104, R6                      ; FDD1   0306 0104
        SUB     G_0104, R7                      ; FDD3   0307 0104
        SUB     .STIC.C.3,R7                    ; FDD5   0307 001B

        SUBR    R0,     R1                      ; FDD7   0101
        SUB@    R1,     R2                      ; FDD8   030A
        SUBR    R0,     R1                      ; FDD9   0101
        SUB@    R1,     R2                      ; FDDA   030A
        COMR    R3                              ; FDDB   001B
        SUBR    R0,     R2                      ; FDDC   0102
        SUB@    R1,     R3                      ; FDDD   030B
        SUBR    R0,     R2                      ; FDDE   0102
        SUB@    R1,     R3                      ; FDDF   030B
L_FDE0:
        DECR    R7                              ; FDE0   0017

        SUBR    R0,     R4                      ; FDE1   0104
        AND     G_0104, R1                      ; FDE2   0381 0104
        AND     G_01ED, R1                      ; FDE4   0381 01ED
        RSWD    R2                              ; FDE6   003A
        ADDR    R5,     R5                      ; FDE7   00ED
        EIS                                     ; FDE8   0002
        SLLC    R3,     1                       ; FDE9   005B
        CLRR    R6                              ; FDEA   01F6
        SUB     G_0306, R6                      ; FDEB   0306 0306
        SUB     G_0305, R5                      ; FDED   0305 0305
        SUB     G_0306, R6                      ; FDEF   0306 0306
        COMR    R3                              ; FDF1   001B
        SUB     G_035C, R2                      ; FDF2   0302 035C
        SUB     .STIC.C.3,R2                    ; FDF4   0302 001B
        SUB     G_0304, R4                      ; FDF6   0304 0304
        COMR    R3                              ; FDF8   001B
        SUB     G_0306, R6                      ; FDF9   0306 0306
        SLLC    R3,     1                       ; FDFB   005B
        CMPR    R3,     R3                      ; FDFC   015B
        SUB     G_0307, R7                      ; FDFD   0307 0307

        SUB     G_0306, R6                      ; FDFF   0306 0306
        SUB     G_0307, R7                      ; FE01   0307 0307

        COMR    R3                              ; FE03   001B
        SUBR    R3,     R2                      ; FE04   011A
        AND     G_0381, R1                      ; FE05   0381 0381
        COMR    R3                              ; FE07   001B
        SUBR    R3,     R3                      ; FE08   011B
        SUB@    R1,     R3                      ; FE09   030B
        SUB@    R1,     R3                      ; FE0A   030B
L_FE0B:
        DECR    R7                              ; FE0B   0017

        ANDR    R2,     R1                      ; FE0C   0191
        SUB@    R1,     R3                      ; FE0D   030B
        SUB@    R1,     R3                      ; FE0E   030B
        CLRR    R5                              ; FE0F   01ED
        ADCR    R0                              ; FE10   0028
        ANDR    R5,     R5                      ; FE11   01AD
        XORI    #$01AD, R6                      ; FE12   03FE 01AD
        AND@    R6,     R5                      ; FE14   03B5
        RLC     R2,     1                       ; FE15   0052
        XORR    R6,     R2                      ; FE16   01F2
        SUB@    R1,     R1                      ; FE17   0309
        SUB@    R1,     R1                      ; FE18   0309
        SUB@    R1,     R0                      ; FE19   0308
        SUB@    R1,     R0                      ; FE1A   0308
        SUB@    R1,     R1                      ; FE1B   0309
        SUB@    R1,     R1                      ; FE1C   0309
        TSTR    R2                              ; FE1D   0092
        SUB     G_035C, R6                      ; FE1E   0306 035C
        SUB     G_0092, R6                      ; FE20   0306 0092
        SUB     G_0307, R7                      ; FE22   0307 0307

        TSTR    R2                              ; FE24   0092
        SUB@    R1,     R1                      ; FE25   0309
        SUB@    R1,     R1                      ; FE26   0309
        ADDR    R2,     R7                      ; FE27   00D7

        ANDR    R6,     R4                      ; FE28   01B4
        SUB@    R1,     R3                      ; FE29   030B
        SUB@    R1,     R3                      ; FE2A   030B
        AND     G_0381, R1                      ; FE2B   0381 0381
        XORR    R2,     R5                      ; FE2D   01D5
        AND     G_0382, R2                      ; FE2E   0382 0382
        MOVR    R2,     R7                      ; FE30   0097

        AND     G_0381, R1                      ; FE31   0381 0381
        MOVR    R2,     R7                      ; FE33   0097

        AND     G_0382, R2                      ; FE34   0382 0382
        MOVR    R3,     R0                      ; FE36   0098
        ANDR    R2,     R4                      ; FE37   0194
        SUB@    R1,     R3                      ; FE38   030B
        SUB@    R1,     R3                      ; FE39   030B
        ADDR    R3,     R1                      ; FE3A   00D9
        ANDR    R6,     R2                      ; FE3B   01B2
        SUB     G_0307, R7                      ; FE3C   0307 0307

        SUB     G_0306, R6                      ; FE3E   0306 0306
        XORR    R6,     R1                      ; FE40   01F1
        SUB     G_0307, R7                      ; FE41   0307 0307

        COMR    R1                              ; FE43   0019
L_FE44:
        SUB     G_0304, R4                      ; FE44   0304 0304
        COMR    R1                              ; FE46   0019
        SUB     G_0306, R6                      ; FE47   0306 0306
        COMR    R1                              ; FE49   0019
        SUB     G_0307, R7                      ; FE4A   0307 0307

        DECLE   $0092,  $0192,  $0316,  $009D   ; FE4C   0092 0192 0316 009D
        DECLE   $038D,  $0036                   ; FE50   038D 0036

        SUBR    R6,     R4                      ; FE52   0134
        SUB@    R4,     R7                      ; FE53   0327

        SUB     G_00A6, R6                      ; FE54   0306 00A6
        CMPR    R2,     R4                      ; FE56   0154
        SUB@    R2,     R7                      ; FE57   0317

        DECLE   $0136,  $005D,  $0206,  $0206   ; FE58   0136 005D 0206 0206
        DECLE   $0206                           ; FE5C   0206

        XORR    R1,     R5                      ; FE5D   01CD
        CLRR    R5                              ; FE5E   01ED
        SARC    R1,     1                       ; FE5F   0079
        ADDR    R5,     R5                      ; FE60   00ED
        DIS                                     ; FE61   0003
        AND@    R1,     R5                      ; FE62   038D
        NEGR    R2                              ; FE63   0022
        XORR    R6,     R2                      ; FE64   01F2
        MVI@    R3,     R1                      ; FE65   0299
        MOVR    R5,     R3                      ; FE66   00AB
        SLLC    R1,     2                       ; FE67   005D
        MVI     .BTAB.82,R2                     ; FE68   0282 0282
        MOVR    R0,     R6                      ; FE6A   0086
        SUB     G_00A7, R0                      ; FE6B   0300 00A7
        CMP@    R3,     R4                      ; FE6D   035C
        SUB@    R2,     R0                      ; FE6E   0310
        MOVR    R5,     R3                      ; FE6F   00AB
        SLLC    R1,     2                       ; FE70   005D
        MVI     .BTAB.87,R7                     ; FE71   0287 0287

        MOVR    R0,     R4                      ; FE73   0084
        ANDR    R0,     R4                      ; FE74   0184
        SUB     G_00A4, R2                      ; FE75   0302 00A4
        ANDR    R6,     R4                      ; FE77   01B4
        SUB@    R2,     R2                      ; FE78   0312
        SUBR    R2,     R1                      ; FE79   0111
        SLLC    R1,     2                       ; FE7A   005D
        MVI@    R1,     R1                      ; FE7B   0289
        CLRR    R5                              ; FE7C   01ED
        XORI    #$01ED, R6                      ; FE7D   03FE 01ED
        XOR@    R5,     R1                      ; FE7F   03E9
        MOVR    R0,     R6                      ; FE80   0086
        ANDR    R2,     R6                      ; FE81   0196
        SUB@    R2,     R4                      ; FE82   0314
        MOVR    R4,     R6                      ; FE83   00A6
        ANDR    R2,     R6                      ; FE84   0196
        SUB@    R2,     R4                      ; FE85   0314
        SUBR    R6,     R4                      ; FE86   0134
        SUBR    R4,     R7                      ; FE87   0127

        DECLE   $005D,  $0206,  $0206           ; FE88   005D 0206 0206

        CLRC                                    ; FE8B   0006
        SUB     G_0026, R6                      ; FE8C   0306 0026
        CMPR    R2,     R4                      ; FE8E   0154
        SUB@    R2,     R7                      ; FE8F   0317

        DECLE   $0136,  $005D,  $0206,  $0206   ; FE90   0136 005D 0206 0206
        DECLE   $0206                           ; FE94   0206

        CLRR    R5                              ; FE95   01ED
        NOP                                     ; FE96   0034
        MVI@    R1,     R1                      ; FE97   0289
        MOVR    R0,     R6                      ; FE98   0086
        ANDR    R0,     R4                      ; FE99   0184
        SUB     G_00A6, R4                      ; FE9A   0304 00A6
        XORR    R0,     R6                      ; FE9C   01C6
        SUB@    R2,     R4                      ; FE9D   0314
        SUBR    R4,     R2                      ; FE9E   0122
        SLLC    R1,     2                       ; FE9F   005D
        MVI@    R1,     R3                      ; FEA0   028B
        MVI@    R1,     R3                      ; FEA1   028B
        MOVR    R0,     R6                      ; FEA2   0086
        ANDR    R0,     R6                      ; FEA3   0186
        SUB     G_00A6, R4                      ; FEA4   0304 00A6
        ANDR    R6,     R6                      ; FEA6   01B6
        SUB@    R2,     R4                      ; FEA7   0314
        SUBR    R4,     R2                      ; FEA8   0122
        SLLC    R1,     2                       ; FEA9   005D
        MVI@    R1,     R3                      ; FEAA   028B
        MVI@    R1,     R3                      ; FEAB   028B
        MOVR    R0,     R6                      ; FEAC   0086
        ANDR    R0,     R1                      ; FEAD   0181
        SUB@    R1,     R2                      ; FEAE   030A
        XORR    R6,     R1                      ; FEAF   01F1
        CMPR    R7,     R2                      ; FEB0   017A
        MVI@    R4,     R6                      ; FEB1   02A6
        MVI     .BTAB.96,R6                     ; FEB2   0286 0296
        ADD@    R5,     R4                      ; FEB4   02EC
        CMP@    R5,     R4                      ; FEB5   036C
        SLLC    R1,     2                       ; FEB6   005D
        MVI     .BTAB.96,R6                     ; FEB7   0286 0296
        MVI     .BTAB.86,R6                     ; FEB9   0286 0286
        CLRR    R5                              ; FEBB   01ED
        SUBR    R2,     R7                      ; FEBC   0117

        DECR    R4                              ; FEBD   0014
        SUBR    R1,     R5                      ; FEBE   010D
        ADDR    R5,     R6                      ; FEBF   00EE
        SUBR    R3,     R6                      ; FEC0   011E
        SUBR    R3,     R7                      ; FEC1   011F
        ADCR    R7                              ; FEC2   002F

        CMP@    R1,     R7                      ; FEC3   034F
L_FEC4:
        ADDR    R1,     R4                      ; FEC4   00CC
        DECLE   $018C,  $012C,  $00ED,  $0003   ; FEC5   018C 012C 00ED 0003
        DECLE   $01A9,  $01A9,  $0299,  $0099   ; FEC9   01A9 01A9 0299 0099
        DECLE   $005D,  $0109,  $0309,  $0119   ; FECD   005D 0109 0309 0119
        DECLE   $0119,  $0299,  $0192,  $0192   ; FED1   0119 0299 0192 0192
        DECLE   $0299,  $0194,  $0194,  $0299   ; FED5   0299 0194 0194 0299
        DECLE   $0195,  $0195,  $0299,  $01ED   ; FED9   0195 0195 0299 01ED
        DECLE   $0015,  $018D,  $0199,  $0199   ; FEDD   0015 018D 0199 0199
        DECLE   $0319,  $0119,  $0119,  $0299   ; FEE1   0319 0119 0119 0299
        DECLE   $0192,  $0192,  $0312,  $0112   ; FEE5   0192 0192 0312 0112
        DECLE   $0112,  $0292,  $0119,  $0119   ; FEE9   0112 0292 0119 0119
        DECLE   $0299,  $0099,  $0099,  $0219   ; FEED   0299 0099 0099 0219
        DECLE   $0199,  $0199,  $0319,  $0119   ; FEF1   0199 0199 0319 0119
        DECLE   $0119,  $0299,  $007E,  $01BC   ; FEF5   0119 0299 007E 01BC
        DECLE   $021C                           ; FEF9   021C

        SUB@    R1,     R5                      ; FEFA   030D
        ADD@    R6,     R2                      ; FEFB   02F2
        RSWD    R5                              ; FEFC   003D
        MOVR    R2,     R5                      ; FEFD   0095
        ANDR    R1,     R5                      ; FEFE   018D
        ADDR    R7,     R6                      ; FEFF   00FE
        ADDR    R1,     R4                      ; FF00   00CC
        ANDR    R1,     R4                      ; FF01   018C
        SUBR    R5,     R4                      ; FF02   012C
        SUB@    R3,     R7                      ; FF03   031F
        ADCR    R7                              ; FF04   002F

        CMPR    R1,     R7                      ; FF05   014F
L_FF06:
        MOVR    R2,     R7                      ; FF06   0097

        TSTR    R3                              ; FF07   009B
        SUB@    R2,     R7                      ; FF08   0317

        MOVR    R3,     R5                      ; FF09   009D
L_FF0A:
        DECR    R7                              ; FF0A   0017

        TSTR    R3                              ; FF0B   009B
        SUB@    R3,     R3                      ; FF0C   031B
        MOVR    R3,     R5                      ; FF0D   009D
        ADDR    R2,     R7                      ; FF0E   00D7

        ADDR    R3,     R3                      ; FF0F   00DB
        XOR@    R2,     R2                      ; FF10   03D2
        MOVR    R2,     R7                      ; FF11   0097

        DECLE   $011B,  $0392,  $00ED,  $0002   ; FF12   011B 0392 00ED 0002
        DECLE   $0037                           ; FF16   0037

        SUBR    R3,     R3                      ; FF17   011B
        AND@    R2,     R2                      ; FF18   0392
        SUBR    R1,     R1                      ; FF19   0109
        AND     G_010B, R0                      ; FF1A   0380 010B
        AND     G_0090, R2                      ; FF1C   0382 0090
        ANDR    R2,     R0                      ; FF1E   0190
        AND@    R2,     R4                      ; FF1F   0394
        MOVR    R2,     R0                      ; FF20   0090
        SUBR    R3,     R1                      ; FF21   0119
        AND@    R2,     R0                      ; FF22   0390
        CLRR    R5                              ; FF23   01ED
        INCR    R7                              ; FF24   000F

        DECLE   $0037                           ; FF25   0037
L_FF26:
        MOVR    R0,     R7                      ; FF26   0087

        DECLE   $0192,  $005D,  $028A,  $0101   ; FF27   0192 005D 028A 0101
        DECLE   $0381,  $0102,  $0382,  $0035   ; FF2B   0381 0102 0382 0035
        DECLE   $0103,  $0197,  $005D,  $0305   ; FF2F   0103 0197 005D 0305
        DECLE   $0107,  $0385,  $0109,  $0383   ; FF33   0107 0385 0109 0383
        DECLE   $001A,  $015A,  $0382,  $0385   ; FF37   001A 015A 0382 0385
        DECLE   $0090,  $0383,  $0380,  $0092   ; FF3B   0090 0383 0380 0092
        DECLE   $030A,  $0382,  $0092,  $0119   ; FF3F   030A 0382 0092 0119
        DECLE   $0380,  $0309,  $00B7           ; FF43   0380 0309 00B7

        CMPR    R6,     R7                      ; FF46   0177
        SUB     G_0306, R7                      ; FF47   0307 0306
        SUB     G_0309, R7                      ; FF49   0307 0309

        MOVR    R2,     R3                      ; FF4B   0093
        SUB@    R1,     R2                      ; FF4C   030A
        SUB@    R1,     R1                      ; FF4D   0309
        COMR    R1                              ; FF4E   0019
        SUB@    R1,     R2                      ; FF4F   030A
        AND     G_0092, R0                      ; FF50   0380 0092
        SUBR    R2,     R6                      ; FF52   0116
        AND@    R2,     R2                      ; FF53   0392
        TSTR    R2                              ; FF54   0092
        SUBR    R2,     R7                      ; FF55   0117

        AND     G_0384, R1                      ; FF56   0381 0384
        TSTR    R2                              ; FF58   0092
        SUBR    R2,     R6                      ; FF59   0116
        AND@    R2,     R2                      ; FF5A   0392
        MOVR    R3,     R5                      ; FF5B   009D
        CLRR    R5                              ; FF5C   01ED
        SLLC    R3,     1                       ; FF5D   005B
        MOVR    R2,     R5                      ; FF5E   0095
        SUBR    R5,     R4                      ; FF5F   012C
        ADDR    R1,     R4                      ; FF60   00CC
        ANDR    R1,     R4                      ; FF61   018C
        CMPR    R1,     R5                      ; FF62   014D
        ADDR    R7,     R6                      ; FF63   00FE
        SUBR    R3,     R7                      ; FF64   011F
        ADCR    R7                              ; FF65   002F
        ADDR    R1,     R7                      ; FF66   00CF

L_FF67:
        SAR     R1,     2                       ; FF67   006D
        DECLE   $0003,  $00ED,  $0004           ; FF68   0003 00ED 0004

        TSTR    R5                              ; FF6B   00AD
        DIS                                     ; FF6C   0003
        XORR    R6,     R2                      ; FF6D   01F2
        XORR    R6,     R2                      ; FF6E   01F2
        SUB@    R2,     R2                      ; FF6F   0312
        SUB@    R2,     R1                      ; FF70   0311
        SUB@    R2,     R2                      ; FF71   0312
        MVI@    R3,     R3                      ; FF72   029B
        ANDR    R6,     R4                      ; FF73   01B4
        ANDR    R6,     R2                      ; FF74   01B2
        MVI@    R3,     R1                      ; FF75   0299
        MVI@    R2,     R7                      ; FF76   0297

        DECLE   $01D6,  $01D2,  $0296,  $0294   ; FF77   01D6 01D2 0296 0294
        DECLE   $0292,  $0187,  $0184,  $0090   ; FF7B   0292 0187 0184 0090
        DECLE   $005D,  $0189,  $0386,  $01ED   ; FF7F   005D 0189 0386 01ED
        DECLE   $03FE,  $01ED,  $03D9,  $0197   ; FF83   03FE 01ED 03D9 0197
        DECLE   $0192,  $021B,  $0197           ; FF87   0192 021B 0197

        ANDR    R2,     R4                      ; FF8A   0194
        MVI@    R2,     R1                      ; FF8B   0291
        ANDR    R2,     R6                      ; FF8C   0196
        ANDR    R2,     R2                      ; FF8D   0192
        MVI@    R2,     R2                      ; FF8E   0292
        ANDR    R2,     R6                      ; FF8F   0196
        ANDR    R2,     R2                      ; FF90   0192
        MVI@    R2,     R6                      ; FF91   0296
        ANDR    R5,     R5                      ; FF92   01AD
        XORI    #$01AD, R6                      ; FF93   03FE 01AD
        XOR@    R6,     R5                      ; FF95   03F5
        ANDR    R6,     R4                      ; FF96   01B4
        ANDR    R2,     R1                      ; FF97   0191
        MVI@    R3,     R1                      ; FF98   0299
        SUBR    R2,     R7                      ; FF99   0117

        DECLE   $0311,  $01F2,  $0176,  $0312   ; FF9A   0311 01F2 0176 0312
        DECLE   $0311,  $01AD,  $0030,  $0194   ; FF9E   0311 01AD 0030 0194
        DECLE   $0191,  $0299,  $009D,  $016D   ; FFA2   0191 0299 009D 016D
        DECLE   $03FE,  $016D,  $0046,  $037F   ; FFA6   03FE 016D 0046 037F
        DECLE   $007E,  $016D,  $0042,  $019B   ; FFAA   007E 016D 0042 019B
        DECLE   $0112,  $021B,  $019B,  $0192   ; FFAE   0112 021B 019B 0192
        DECLE   $0217,  $009E,  $0191,  $0119   ; FFB2   0217 009E 0191 0119
        DECLE   $0219,  $0191,  $0199,  $0299   ; FFB6   0219 0191 0199 0299
        DECLE   $01B2,  $01B6,  $02B2,  $01ED   ; FFBA   01B2 01B6 02B2 01ED
        DECLE   $005C,  $0000,  $0000,  $0000   ; FFBE   005C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFEE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFFA   0000 0000 0000 0000
        DECLE   $0000                           ; FFFE   0000

        ADDR    R6,     R0                      ; FFFF   00F0
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $50D2       <entry>
;;  $50D3       $51EF  
;;  $50DD       <entry>
;;  $50DE       $50DC  
;;  $510C       $5113  
;;  $513F       $512D  
;;  $514E       $50E7   $513C  
;;  $515B       $5162  
;;  $515F       $5169  
;;  $516B       $515D  
;;  $5183       $5181  
;;  $5187       $5185  
;;  $5190       $518E  
;;  $5194       $51F7   $5257  
;;  $51B6       $51AB  
;;  $51CC       $51B4  
;;  $51D0       <entry> $50C1  
;;  $51E8       $51E0  
;;  $5205       $51E9  
;;  $5208       $51D4  
;;  $5218       $520B   $520F  
;;  $5227       $521B   $521F  
;;  $523E       $522A   $5234   $5238  
;;  $523F       $522E  
;;  $524D       $514C  
;;  $5255       $5251  
;;  $5257       $5243   $5248  
;;  $525B       $50D3   $519E  
;;  $5271       $525B  
;;  $5272       $5277  
;;  $5279       $5274  
;;  $5284       $527F  
;;  $52B1       $528A  
;;  $52C7       $52C1  
;;  $52D3       $52CA  
;;  $52D4       $52D1  
;;  $52DB       $52C5  
;;  $52F0       $52EC  
;;  $52FA       $5306  
;;  $5309       $52F8   $52FC   $52FF   $5302  
;;  $530D       $5312  
;;  $5310       $530B  
;;  $531F       $531F  
;;  $5326       $519B  
;;  $532E       $532B   $533E  
;;  $5336       $5339  
;;  $533C       $50D6   $5132  
;;  $5340       $51AD  
;;  $534E       $5353  
;;  $5365       $51B6  
;;  $538D       $537C  
;;  $5396       $53B6  
;;  $5397       $53BB  
;;  $539B       $539F  
;;  $53A1       $539C  
;;  $53A8       $53A3  
;;  $53AD       $53A6  
;;  $53BD       $53B1  
;;  $53DA       $53D5  
;;  $53DB       $5195   $5331   $5341   $D004  
;;  $53E4       $5107   $5361  
;;  $53E8       $53F9  
;;  $53FC       $53C3  
;;  $5417       $5410  
;;  $541F       $542F  
;;  $5431       $5421   $5436  
;;  $5432       $53C6  
;;  $543F       $53C9  
;;  $544A       $5455  
;;  $545B       $53CF  
;;  $546F       $51A1  
;;  $547A       $5424   $D1BC  
;;  $548A       $5450   $5933   $593C   $5973   $5CA0   $5CD7   $6073   $609D  
;;  $548D       $549E  
;;  $54A1       $50BB  
;;  $54A7       $5537  
;;  $54D9       $54C9  
;;  $54EE       $54E7  
;;  $550A       $54F7  
;;  $550F       $54EC   $5502  
;;  $5514       $54F4   $54FC   $5508   $550D  
;;  $5517       $54E2   $5512  
;;  $5520       $54D2  
;;  $5521       $54C0   $54C3  
;;  $5532       $552B  
;;  $5539       $5527  
;;  $553A       $5530  
;;  $553E       $5548  
;;  $554B       $5514  
;;  $556B       $5568  
;;  $5582       $556F   $5577  
;;  $5594       $5580   $5586  
;;  $55B6       $55AE   $55B3  
;;  $55B7       $5550   $559F   $55A8  
;;  $55B8       $5558  
;;  $55C0       $55BB  
;;  $55C4       $5591   $55C0  
;;  $55D4       $55CD  
;;  $55DD       $55D8  
;;  $55DE       $55D2  
;;  $55E3       $55DB  
;;  $55E5       $55B0   $55CF   $55D5  
;;  $5610       $5603   $5609  
;;  $5613       $55E6  
;;  $5614       $55FE   $560E  
;;  $5616       $55F6   $55FA   $5611  
;;  $5617       $5615  
;;  $5624       $54AA  
;;  $5636       $551A  
;;  $5642       $563A  
;;  $5660       $5649   $565E  
;;  $5671       $566A  
;;  $56A9       $56B1  
;;  $56AE       $569B  
;;  $56B3       $56A7   $56AC  
;;  $56C3       $56B7   $56BD  
;;  $56CB       $566F  
;;  $56D8       $543C   $5640  
;;  $56F5       $56F2  
;;  $56FC       $58EF  
;;  $56FD       $56E2   $56EB   $56FB  
;;  $570F       $5708   $570B  
;;  $5723       $574A  
;;  $5738       $572E   $5732  
;;  $5746       $5743  
;;  $574C       $5700   $5757  
;;  $574D       $5517   $5596  
;;  $5754       $576E   $5775  
;;  $5770       $58F2  
;;  $5777       $50C9  
;;  $5788       $577B   $577D   $5783  
;;  $5789       $52B4  
;;  $579A       $5797  
;;  $579E       $578D  
;;  $57B8       $57BD  
;;  $57B9       $57B6   $57C6  
;;  $57BF       $57AB   $57C4  
;;  $57C0       $57A7  
;;  $57E4       $57DC  
;;  $5800       $DBF4  
;;  $5809       $57E2  
;;  $580D       $57CB   $57D1  
;;  $5837       $5833  
;;  $586A       $585E  
;;  $5871       $5847  
;;  $5874       $582E  
;;  $588B       $5880  
;;  $589F       $589A  
;;  $58A2       $5872  
;;  $58B3       $57D6   $5813   $581B   $5826   $5877   $58AB  
;;  $58B4       $58A2  
;;  $58CC       $58C1  
;;  $58E9       $58E6  
;;  $5904       $58DE   $58E1   $5919  
;;  $591C       $57D8   $5B9F   $D19A  
;;  $592D       $5923   $5929  
;;  $5950       $594B  
;;  $595D       $5951  
;;  $596E       $5969  
;;  $596F       $595A  
;;  $5977       <entry> $50C6  
;;  $598A       $5986  
;;  $5994       $599A  
;;  $599C       $5A40   $5A48  
;;  $59B9       $59C3   $59C8  
;;  $59CA       $59BB  
;;  $59D5       $59CD  
;;  $59DE       $59DC  
;;  $5A3B       $52BA  
;;  $5A5F       $50CC  
;;  $5A68       $5B94  
;;  $5A69       $5A67  
;;  $5A82       $5A77  
;;  $5A88       $5A80  
;;  $5AA1       $5A8D  
;;  $5AA9       $5A9F  
;;  $5ABA       $5A6C  
;;  $5AC0       $5AD8   $5ADE  
;;  $5ACE       $5AC8  
;;  $5AE0       $5AD2  
;;  $5AE5       $5AB8  
;;  $5AEB       $5A65  
;;  $5AED       $5A63   $5A72   $5B08  
;;  $5AEE       $52B7  
;;  $5B05       $5AF2  
;;  $5B0E       $5B22  
;;  $5B31       $558E   $55BD  
;;  $5B4A       $5B3F   $5B46  
;;  $5B5F       $5B53  
;;  $5B6E       $5B61  
;;  $5B7F       $5B70  
;;  $5B94       $5B5D   $5B6C   $5B7D  
;;  $5B98       $5B4C  
;;  $5BA5       $5B9A   $5BAB  
;;  $5BA8       $5B39  
;;  $5BD2       $5BBB  
;;  $5BFF       $59F7  
;;  $5C17       $5C02  
;;  $5C1E       $5C1B  
;;  $5C23       $5C15  
;;  $5C28       $50BE  
;;  $5C37       $5B9C  
;;  $5C38       $5C36  
;;  $5C47       $5C3B  
;;  $5C66       $5C45  
;;  $5C6C       $5C34  
;;  $5C6E       $5C2D   $5C32   $5C4A  
;;  $5C6F       $52DE  
;;  $5C7F       $5C7C  
;;  $5C8F       $5C73  
;;  $5C90       $51C2  
;;  $5C94       $59FA  
;;  $5CC1       $5CBC  
;;  $5CE2       $5CC3   $5CCF  
;;  $5CF4       $5CFE  
;;  $5D75       $5D75  
;;  $5D79       $51BC   $5DC1   $D119  
;;  $5D94       $5B7A  
;;  $5D9A       $58AD   $5B5A   $5B91  
;;  $5D9B       $5D99  
;;  $5DA4       $5DA9  
;;  $5DAB       $5DA6  
;;  $5DAF       $5DAC  
;;  $5DB7       $5DB4  
;;  $5DC1       $5DBC   $5DD3  
;;  $5DC5       $5B63  
;;  $5DC6       $5DBF  
;;  $5DD5       $5D90  
;;  $5DEC       $5DF1  
;;  $5DF4       $5DE2  
;;  $5E1B       $5D95   $D116  
;;  $5E23       $5E27  
;;  $5E2A       $5E07   $5E17  
;;  $5E2F       $5E38  
;;  $5E3A       $5E30   $5E34  
;;  $5E3D       $51B9  
;;  $5E44       $5E4B  
;;  $5E4D       $5E45  
;;  $5E68       $5E78  
;;  $5E83       $5E81  
;;  $5E87       $5E85  
;;  $5EAA       $5EA8  
;;  $5EBA       $5EB8  
;;  $5ED1       $5ECF  
;;  $5EF8       $5EF6  
;;  $5EF9       $5EF7  
;;  $5F16       $5F14  
;;  $5F17       $5BA8  
;;  $5F26       $5F1F  
;;  $5F42       $5F3A  
;;  $5F47       $5F40  
;;  $5F48       $5F45   $5FA6  
;;  $5F70       $5F62   $5F6C  
;;  $5F88       $5F96  
;;  $5F8C       $5F86  
;;  $5F98       $5F90  
;;  $5F99       $5F8A  
;;  $5FA2       $5F9B  
;;  $5FA5       $5F57   $5F5B   $5F66   $5FA0  
;;  $5FAF       $5F9E   $5FA3   $5FAC  
;;  $5FB4       $5FB0  
;;  $5FB5       $5FB3  
;;  $6000       $DBFB  
;;  $6001       $594D  
;;  $601D       $6017  
;;  $6022       $6004  
;;  $6023       $600C  
;;  $603E       $603A  
;;  $6089       $6081   $6085  
;;  $60A0       $6099  
;;  $60A3       $6031  
;;  $60BA       $53CC  
;;  $60C8       $60C3  
;;  $60CF       $60CC  
;;  $60D1       $60F4  
;;  $60DF       $60D5   $60D9  
;;  $60E4       $60DD  
;;  $60F1       $6104  
;;  $60F7       $60E2  
;;  $61DD       $61DB  
;;  $61EE       $61EC  
;;  $622C       $622C  
;;  $6331       $6331  
;;  $640D       $640D  
;;  $6410       $640E  
;;  $66C1       $66BF  
;;  $6800       $62A5   $DBED  
;;  $69AE       $69AE  
;;  $69F9       $69F9  
;;  $6BFC       $6BFA  
;;  $6C48       $6C46  
;;  $6D53       $6F76  
;;  $6F3C       $6F78  
;;  $D000       $5149   $DCFE  
;;  $D01D       $D026  
;;  $D028       $D01F   $D03E   $D053   $D058  
;;  $D03A       $D040  
;;  $D042       $D03B  
;;  $D04F       $D044  
;;  $D055       $D048  
;;  $D06B       $D073  
;;  $D07B       $524A  
;;  $D07C       $D09B  
;;  $D07F       $D083  
;;  $D08D       $D08A  
;;  $D08F       $D075  
;;  $D092       $D096  
;;  $D09E       $D07C   $D08F   $D0F5   $D10A  
;;  $D0AF       $D0AC  
;;  $D0BB       $589C  
;;  $D0CE       $D0CA  
;;  $D0D0       $D0D4  
;;  $D0DA       $D0DE  
;;  $D11C       $D101  
;;  $D123       $D0E1   $D0F3  
;;  $D17E       $D178  
;;  $D18F       $D18D  
;;  $D190       $D190  
;;  $D196       $D1A0   $D1A9   $D1CF   $D1E4   $D1F1  
;;  $D199       $D17C   $D181   $D186   $D1E9  
;;  $D1AB       $D1BA  
;;  $D1DF       $D1DB  
;;  $D1FB       $52B1  
;;  $D215       $D211  
;;  $D235       $D227   $D232  
;;  $D237       $D1FF  
;;  $D2B4       $D2B2  
;;  $D2B5       $D2B3  
;;  $D4B1       $D4AF  
;;  $D4BB       $D4B9  
;;  $D536       $D534  
;;  $D583       $D583  
;;  $D586       $D584  
;;  $D6A1       $D69F  
;;  $D6AC       $D6AA  
;;  $D783       $D781  
;;  $D798       $D796  
;;  $D824       $D822  
;;  $D875       $D873  
;;  $D877       $D875  
;;  $D9E5       $D9E5  
;;  $DA1D       $DA1D  
;;  $DAE5       $DAE5  
;;  $DD86       $DD84  
;;  $DDF9       $DDF9  
;;  $DE1C       $DE1A  
;;  $DE4B       $FCC6   $FCD8   $FD4D  
;;  $DE4C       $DE4A  
;;  $DE56       $DE50  
;;  $DE6F       $DE4E   $DE54  
;;  $DE74       $52E1  
;;  $DE85       $DE99  
;;  $DE96       $DE8A   $DE8D   $DE90  
;;  $DE9B       $DE80   $DEDC   $DF4A   $DF76  
;;  $DEAC       $DEC2   $DECE  
;;  $DEC4       $DEBC  
;;  $DECA       $DEB4   $DEB8  
;;  $DED0       $DE78   $DE9E   $DFA5  
;;  $DED1       $DE7A  
;;  $DEDE       $DF46   $DF5F   $DF72   $DF87   $DF8E   $DF9E   $DFBB  
;;  $DF0B       $DF11  
;;  $DF13       $DF0D  
;;  $DF17       $DF19  
;;  $DF1D       $DF23  
;;  $DF25       $DF1F  
;;  $DF2C       $DF33  
;;  $DF3D       $DF40  
;;  $DF43       $DEFD  
;;  $DF44       $DF42  
;;  $DF4C       $DEE8  
;;  $DF89       $DF84  
;;  $DF90       $DF8B  
;;  $DF99       $DF93  
;;  $DFB2       $DFA9  
;;  $DFB4       $DFB9  
;;  $DFB9       $DFB6  
;;  $DFC7       $DFC5  
;;  $F5A6       $50B8  
;;  $F5AC       $F5B9  
;;  $F5B6       $F5F4  
;;  $F5B7       $F5B4  
;;  $F5BB       $F5AE  
;;  $F5BC       $F5B2  
;;  $F5D0       $F5C3  
;;  $F5D8       $F5C8   $F5CE   $F5D3  
;;  $F5F6       $51BF  
;;  $F607       $F60B  
;;  $F633       $F631  
;;  $F63E       $5785  
;;  $F653       $F748  
;;  $F65C       $F656  
;;  $F663       $F711  
;;  $F669       $F65F  
;;  $F66A       $5AB3  
;;  $F687       $5B82  
;;  $F6A4       $5B55  
;;  $F6BB       $5B72  
;;  $F6CE       $5DD0  
;;  $F6E3       $D1CC  
;;  $F6F9       $5215  
;;  $F717       $60A0  
;;  $F72C       $58B0  
;;  $F74A       $D1E1  
;;  $F75A       $D1F7  
;;  $F76A       $D1EE  
;;  $F78C       $FB89  
;;  $F7AF       $FBAC  
;;  $F9CD       $F8A5  
;;  $FA52       $FACF  
;;  $FB28       $F8D5  
;;  $FB4E       $FBCB  
;;  $FBE7       $FBE7  
;;  $FC83       $FC81  
;;  $FCA3       $51A4   $F666  
;;  $FCA9       $5809   $5BA2   $D19D   $F713  
;;  $FCB0       $58A5  
;;  $FCB4       $F658  
;;  $FCB6       $FCB2  
;;  $FCBD       $FCA7   $FCAE  
;;  $FCD7       $50FE   $D0ED  
;;  $FD4C       $53D7   $D1A6  
;;  $FDE0       $FDE0  
;;  $FE0B       $FE0B  
;;  $FE44       $FA4C  
;;  $FEC4       $FEC2  
;;  $FF06       $FF04  
;;  $FF0A       $FF0A  
;;  $FF26       $FF24  
;;  $FF67       $FF65  
;; ======================================================================== ;;
