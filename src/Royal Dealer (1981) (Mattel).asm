
        ORG     $5000
.HEADER:
        BIDECLE $5302           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $503C           ; 5004  Ptr: Start of game
        BIDECLE $5352           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $547A           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502E           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0002           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $000D,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0004,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $000D           ; 5013  Border color init

        DECLE   $0098,  $01F0,  $01E0,  $0098   ; 5014   0098 01F0 01E0 0098
        DECLE   $01D0,  $01C0,  $01B0,  $01A0   ; 5018   01D0 01C0 01B0 01A0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $00F7,  $0054,  $0005,  $0000; 5020  Timer dispatch/interval
        DECLE   $0046,  $005C,  $0009,  $0000; 5024  Timer dispatch/interval
        DECLE   $0021,  $0058,  $0004,  $0000; 5028  Timer dispatch/interval
        BIDECLE $0000           ; 502C  End of timer table

.TITLE:
        DECLE   $0051                           ; 502E  Cartridge year
        STRING  "Royal Dealer"                  ; 502F  Title string
        DECLE   $0000                           ; 503B  

.START:
        PSHR    R5                              ; 503C   0275
        MVII    #$0116, R4                      ; 503D   02BC 0116
        MVII    #$007C, R3                      ; 503F   02BB 007C
        MVO@    R3,     R4                      ; 5041   0263
        MVII    #$0030, R3                      ; 5042   02BB 0030
        MVO@    R3,     R4                      ; 5044   0263
        MVII    #$004A, R3                      ; 5045   02BB 004A
        MVO@    R3,     R4                      ; 5047   0263
        MVII    #$0020, R0                      ; 5048   02B8 0020
        MVO@    R0,     R4                      ; 504A   0260
        SLL     R0,     1                       ; 504B   0048
        MVII    #$031D, R4                      ; 504C   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 504E   0004 0114 0338

        MVII    #$015E, R4                      ; 5051   02BC 015E
        MVII    #$0078, R0                      ; 5053   02B8 0078

        JSR     R5,     X_FILL_ZERO             ; 5055   0004 0114 0338
        JSR     R5,     L_5D54                  ; 5058   0004 015C 0154

        ADDI    #$0004, R1                      ; 505B   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 505D   0004 0118 0038
        JSR     R5,     L_51C3                  ; 5060   0004 0150 01C3

        MVII    #$000D, R0                      ; 5063   02B8 000D
        MVO     R0,     .STIC.BORD              ; 5065   0240 002C
        MVO     R0,     G_0106                  ; 5067   0240 0106

        JSR     R5,     L_51DA                  ; 5069   0004 0150 01DA
        BIDECLE $3200                           ; 506C   0000 0032

        MVII    #$0218, R4                      ; 506E   02BC 0218
        SDBD                                    ; 5070   0001
        MVII    #$3207, R3                      ; 5071   02BB 0007 0032

        JSR     R5,     X_PRINT_R5              ; 5074   0004 0118 007B
        STRING  "ROYAL DEALER"                  ; 5077  
        DECLE   $0000                           ; 5083   0000

        MVII    #$023E, R4                      ; 5084   02BC 023E
        MOVR    R7,     R1                      ; 5086   00B9
        ADDI    #$00F8, R1                      ; 5087   02F9 00F8

L_5089:
        JSR     R5,     X_PRINT_R1              ; 5089   0004 0118 0067

        ADDI    #$0010, R1                      ; 508C   02F9 0010
        ADDI    #$0005, R4                      ; 508E   02FC 0005
        CMPI    #$027A, R4                      ; 5090   037C 027A
        BLE     L_5089                          ; 5092   0226 000A

        MVII    #$02B6, R4                      ; 5094   02BC 02B6

        JSR     R5,     X_PRINT_R5              ; 5096   0004 0118 007B
        STRING  "GAME:"                         ; 5099  
        DECLE   $0000                           ; 509E   0000
L_509F:
        CLRR    R2                              ; 509F   01D2
        SDBD                                    ; 50A0   0001
        MVII    #$3207, R3                      ; 50A1   02BB 0007 0032
        MVII    #$02C4, R1                      ; 50A4   02B9 02C4
        ADD     G_0164, R1                      ; 50A6   02C1 0164
        MVII    #$0001, R0                      ; 50A8   02B8 0001
        MOVR    R7,     R4                      ; 50AA   00BC
        ADDI    #$00B2, R4                      ; 50AB   02FC 00B2

        JSR     R5,     .EXEC.910               ; 50AD   0004 0118 0110

        TSTR    R0                              ; 50B0   0080
        BEQ     L_5122                          ; 50B1   0204 006F

        MVI     G_015E, R2                      ; 50B3   0282 015E
        TSTR    R2                              ; 50B5   0092
        BNEQ    L_50E2                          ; 50B6   020C 002A

        CMPI    #$0004, R0                      ; 50B8   0378 0004
        BGT     L_511D                          ; 50BA   020E 0061

L_50BC:
        MVO     R0,     G_015E                  ; 50BC   0240 015E
        CMPI    #$0003, R0                      ; 50BE   0378 0003
        BNEQ    L_50C6                          ; 50C0   020C 0004

        MVII    #$0002, R0                      ; 50C2   02B8 0002
        B       L_50F4                          ; 50C4   0200 002E

L_50C6:
        MVII    #$02CA, R4                      ; 50C6   02BC 02CA
        SDBD                                    ; 50C8   0001
        MVII    #$3207, R3                      ; 50C9   02BB 0007 0032

        JSR     R5,     X_PRINT_R5              ; 50CC   0004 0118 007B
        STRING  "# OPPONENTS:"                  ; 50CF  
        DECLE   $0000                           ; 50DB   0000

        MVII    #$0014, R2                      ; 50DC   02BA 0014
        MVO     R2,     G_0164                  ; 50DE   0242 0164
        B       L_509F                          ; 50E0   0220 0042

L_50E2:
        INCR    R0                              ; 50E2   0008
        CMPI    #$0005, R0                      ; 50E3   0378 0005
        BPL     L_511D                          ; 50E5   0203 0036

        CMPI    #$0002, R0                      ; 50E7   0378 0002
        BMI     L_511D                          ; 50E9   020B 0032

        MVI     G_015E, R5                      ; 50EB   0285 015E
        DECR    R5                              ; 50ED   0015
        BEQ     L_50F4                          ; 50EE   0204 0004

        CMPI    #$0003, R0                      ; 50F0   0378 0003
        BMI     L_511D                          ; 50F2   020B 0029

L_50F4:
        MVO     R0,     G_015F                  ; 50F4   0240 015F

        JSR     R5,     X_RAND2                 ; 50F6   0004 0114 029E

        MVO     R0,     G_0354                  ; 50F9   0240 0354
        MVO     R0,     G_0165                  ; 50FB   0240 0165

        JSR     R5,     .EXEC.A61               ; 50FD   0004 0118 0261

        DECR    R4                              ; 5100   0014

        JSR     R5,     L_51C3                  ; 5101   0004 0150 01C3

        MVII    #$0006, R0                      ; 5104   02B8 0006
        MVO     R0,     .STIC.BORD              ; 5106   0240 002C
        MVO     R0,     G_0106                  ; 5108   0240 0106
        INCR    R7                              ; 510A   000F

L_510B:
        PSHR    R5                              ; 510B   0275

L_510C:
        JSR     R5,     L_52CF                  ; 510C   0004 0150 02CF
        JSR     R5,     L_5148                  ; 510F   0004 0150 0148

        MVI     G_015E, R3                      ; 5112   0283 015E
        DECR    R3                              ; 5114   0013
        SLL     R3,     1                       ; 5115   004B
        SDBD                                    ; 5116   0001
        ADDI    #$5140, R3                      ; 5117   02FB 0040 0051
        MOVR    R3,     R4                      ; 511A   009C
        SDBD                                    ; 511B   0001
        MVI@    R4,     R7                      ; 511C   02A7

L_511D:
        JSR     R5,     X_PLAY_RAZZ2            ; 511D   0004 011C 02BD

        B       L_509F                          ; 5120   0220 0082

L_5122:
        TSTR    R2                              ; 5122   0092
        BNEQ    L_511D                          ; 5123   022C 0007

        INCR    R0                              ; 5125   0008
        MVII    #$02C4, R4                      ; 5126   02BC 02C4
        SDBD                                    ; 5128   0001
        MVII    #$3207, R3                      ; 5129   02BB 0007 0032
        ADD     G_0164, R4                      ; 512C   02C4 0164
        MOVR    R0,     R1                      ; 512E   0081
        MVI     G_015E, R2                      ; 512F   0282 015E
        CMPI    #$0001, R2                      ; 5131   037A 0001
        BEQ     L_5136                          ; 5133   0204 0001

        INCR    R0                              ; 5135   0008
L_5136:
        PSHR    R0                              ; 5136   0270

        JSR     R5,     X_PRNUM_RGT             ; 5137   0004 0118 00C5

        PULR    R0                              ; 513A   02B0
        TSTR    R2                              ; 513B   0092
        BEQ     L_50BC                          ; 513C   0224 0081
        B       L_50E2                          ; 513E   0220 005D

        INCR    R0                              ; 5140   0008
        SLLC    R0,     2                       ; 5141   005C
        RRC     R1,     1                       ; 5142   0071
        SLLC    R1,     2                       ; 5143   005D
        RRC     R1,     1                       ; 5144   0071
        SLLC    R1,     2                       ; 5145   005D
        MOVR    R7,     R2                      ; 5146   00BA
        SLR     R1,     1                       ; 5147   0061
L_5148:
        MOVR    R7,     R0                      ; 5148   00B8
        ADDI    #$0022, R0                      ; 5149   02F8 0022
        B       L_52FF                          ; 514B   0200 01B2

        DECLE   $0000,  $0000,  $0082,  $0067   ; 514D   0000 0000 0082 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5151   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0067,  $0060   ; 5155   0000 0000 0067 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5159   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00BF,  $0051   ; 515D   0000 0000 00BF 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5161   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5165   0000 0000 0000 0000
        DECLE   $0072,  $0058,  $0000,  $0000   ; 5169   0072 0058 0000 0000
        DECLE   $0067,  $0060,  $004C,  $0055   ; 516D   0067 0060 004C 0055
        DECLE   $000C,  $0056,  $00BB,  $0057   ; 5171   000C 0056 00BB 0057
        DECLE   $000B,  $0051,  $000B,  $0051   ; 5175   000B 0051 000B 0051
        DECLE   $000B,  $0051,  $000B,  $0051   ; 5179   000B 0051 000B 0051
        DECLE   $000B,  $0051,  $0043,  $0052   ; 517D   000B 0051 0043 0052
        DECLE   $0041,  $005A,  $0059,  $0020   ; 5181   0041 005A 0059 0020
        DECLE   $0045,  $0049,  $0047,  $0048   ; 5185   0045 0049 0047 0048
        DECLE   $0054,  $0053,  $0020,  $0020   ; 5189   0054 0053 0020 0020
        DECLE   $0031,  $0000,  $0052,  $0055   ; 518D   0031 0000 0052 0055
        DECLE   $004D,  $004D,  $0059,  $0020   ; 5191   004D 004D 0059 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5195   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5199   0020 0020 0020 0020
        DECLE   $0032,  $0000,  $0047,  $0049   ; 519D   0032 0000 0047 0049
        DECLE   $004E,  $0020,  $0052,  $0055   ; 51A1   004E 0020 0052 0055
        DECLE   $004D,  $004D,  $0059,  $0020   ; 51A5   004D 004D 0059 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 51A9   0020 0020 0020 0020
        DECLE   $0033,  $0000,  $0048,  $0045   ; 51AD   0033 0000 0048 0045
        DECLE   $0041,  $0052,  $0054,  $0053   ; 51B1   0041 0052 0054 0053
        DECLE   $0020,  $0020,  $0020,  $0020   ; 51B5   0020 0020 0020 0020
        DECLE   $0020,  $0020,  $0020,  $0020   ; 51B9   0020 0020 0020 0020
        DECLE   $0034,  $0000                   ; 51BD   0034 0000

        CLRR    R1                              ; 51BF   01C9
        J       .EXEC.94C                       ; 51C0   0004 0318 014C

L_51C3:
        PSHR    R5                              ; 51C3   0275
        MOVR    R7,     R0                      ; 51C4   00B8
        ADDI    #$000D, R0                      ; 51C5   02F8 000D
        MVII    #$0100, R4                      ; 51C7   02BC 0100
        MOVR    R4,     R5                      ; 51C9   00A5
        DIS                                     ; 51CA   0003
        SDBD                                    ; 51CB   0001
        MVI@    R4,     R1                      ; 51CC   02A1
        MVO@    R0,     R5                      ; 51CD   0268
        SWAP    R0,     1                       ; 51CE   0040
        MVO@    R0,     R5                      ; 51CF   0268
        EIS                                     ; 51D0   0002
L_51D1:
        DECR    R7                              ; 51D1   0017

        SUBI    #$0008, R6                      ; 51D2   033E 0008
        MVO     R1,     .ISRVEC.0               ; 51D4   0241 0100
        SWAP    R1,     1                       ; 51D6   0041
        MVO     R1,     .ISRVEC.1               ; 51D7   0241 0101
        PULR    R7                              ; 51D9   02B7

L_51DA:
        SDBD                                    ; 51DA   0001
        MVI@    R5,     R1                      ; 51DB   02A9
        MVII    #$00DC, R0                      ; 51DC   02B8 00DC
        MVII    #$0214, R4                      ; 51DE   02BC 0214
        J       X_FILL_MEM                      ; 51E0   0004 0314 0341

L_51E3:
        PSHR    R5                              ; 51E3   0275
L_51E4:
        SDBD                                    ; 51E4   0001
        MVII    #$2CC5, R1                      ; 51E5   02B9 00C5 002C
        MVO@    R1,     R4                      ; 51E8   0261
        MVII    #$0022, R1                      ; 51E9   02B9 0022
        SWAP    R1,     1                       ; 51EB   0041

        JSR     R5,     X_FILL_MEM              ; 51EC   0004 0114 0341

        SDBD                                    ; 51EF   0001
        MVII    #$2CCD, R1                      ; 51F0   02B9 00CD 002C
        MVO@    R1,     R4                      ; 51F3   0261
        ADDI    #$0011, R4                      ; 51F4   02FC 0011
        SUBR    R0,     R4                      ; 51F6   0104
        ADDI    #$0002, R0                      ; 51F7   02F8 0002
        CMPI    #$02C7, R4                      ; 51F9   037C 02C7
        BMI     L_51E4                          ; 51FB   022B 0018
        PULR    R7                              ; 51FD   02B7

L_51FE:
        PSHR    R5                              ; 51FE   0275
        MVII    #$0008, R0                      ; 51FF   02B8 0008
        MVII    #$0269, R4                      ; 5201   02BC 0269

        JSR     R5,     L_51E3                  ; 5203   0004 0150 01E3

        INCR    R7                              ; 5206   000F

L_5207:
        PSHR    R5                              ; 5207   0275
L_5208:
        MVII    #$02C9, R4                      ; 5208   02BC 02C9
        MVII    #$0012, R0                      ; 520A   02B8 0012
        MVII    #$0020, R1                      ; 520C   02B9 0020
        SWAP    R1,     1                       ; 520E   0041

        JSR     R5,     X_FILL_MEM              ; 520F   0004 0114 0341

        MVII    #$02DD, R4                      ; 5212   02BC 02DD

        JSR     R5,     .EXEC.742               ; 5214   0004 0114 0342

L_5217:
        PSHR    R5                              ; 5217   0275
        PSHR    R0                              ; 5218   0270
        PSHR    R1                              ; 5219   0271
        PSHR    R4                              ; 521A   0274
        MVII    #$02A2, R4                      ; 521B   02BC 02A2
        MVII    #$000E, R0                      ; 521D   02B8 000E

        JSR     R5,     L_51E3                  ; 521F   0004 0150 01E3

        MVII    #$0024, R0                      ; 5222   02B8 0024
        SWAP    R0,     1                       ; 5224   0040
        MVO     R0,     .BTAB.A1                ; 5225   0240 02A1
        MVO     R0,     .BTAB.B3                ; 5227   0240 02B3
        PULR    R4                              ; 5229   02B4
        PULR    R1                              ; 522A   02B1
        PULR    R0                              ; 522B   02B0
        PULR    R7                              ; 522C   02B7

L_522D:
        PSHR    R5                              ; 522D   0275
        MOVR    R1,     R5                      ; 522E   008D
L_522F:
        MVI@    R5,     R1                      ; 522F   02A9
        TSTR    R1                              ; 5230   0089
        BEQ     L_5238                          ; 5231   0204 0005

        SDBD                                    ; 5233   0001
        MVI@    R4,     R0                      ; 5234   02A0
        MVO@    R0,     R1                      ; 5235   0248
        B       L_522F                          ; 5236   0220 0008
L_5238:
        PULR    R7                              ; 5238   02B7

        DECLE   $0045,  $0090,  $00BA,  $0054   ; 5239   0045 0090 00BA 0054
        DECLE   $0000,  $0025,  $0000,  $0026   ; 523D   0000 0025 0000 0026
        DECLE   $0003,  $023F,  $0240,  $0253   ; 5241   0003 023F 0240 0253
        DECLE   $0254,  $0267,  $0268,  $027B   ; 5245   0254 0267 0268 027B
        DECLE   $027C,  $028F,  $0000           ; 5249   027C 028F 0000

        DIS                                     ; 524C   0003
        ADCR    R5                              ; 524D   002D
        INCR    R3                              ; 524E   000B
        ADCR    R5                              ; 524F   002D
        DECR    R3                              ; 5250   0013
        ADCR    R5                              ; 5251   002D
        COMR    R3                              ; 5252   001B
        ADCR    R5                              ; 5253   002D
        NEGR    R1                              ; 5254   0021
        ADCR    R5                              ; 5255   002D
        ADCR    R1                              ; 5256   0029
        ADCR    R5                              ; 5257   002D
        GSWD    R1                              ; 5258   0031
        ADCR    R5                              ; 5259   002D
        ADDR    R0,     R5                      ; 525A   00C5
        INCR    R2                              ; 525B   000A
        RSWD    R5                              ; 525C   003D
        ADCR    R5                              ; 525D   002D
L_525E:
        PSHR    R5                              ; 525E   0275
        MOVR    R7,     R1                      ; 525F   00B9
        ADDI    #$0025, R1                      ; 5260   02F9 0025
        MOVR    R7,     R4                      ; 5262   00BC
        ADDI    #$0029, R4                      ; 5263   02FC 0029

        JSR     R5,     L_522D                  ; 5265   0004 0150 022D

        MVII    #$034D, R4                      ; 5268   02BC 034D
        MOVR    R7,     R0                      ; 526A   00B8
        ADDI    #$0008, R0                      ; 526B   02F8 0008

        JSR     R5,     L_5964                  ; 526D   0004 0158 0164
        JSR     R5,     L_5965                  ; 5270   0004 0158 0165
        DECLE   $0053,  $0090,  $00BA,  $0054   ; 5273   0053 0090 00BA 0054
        DECLE   $0000,  $0054,  $0000           ; 5277   0000 0054 0000

        COMR    R6                              ; 527A   001E

        JSRD    R4,     .EXEC.090               ; 527B   0004 0012 0090
        DECLE   $00BA,  $0054,  $0000,  $0054   ; 527E   00BA 0054 0000 0054
        DECLE   $0000,  $0020,  $0001,  $0231   ; 5282   0000 0020 0001 0231
        DECLE   $0232,  $0245,  $0246,  $0259   ; 5286   0232 0245 0246 0259
        DECLE   $025A,  $0000                   ; 528A   025A 0000

        ADDR    R2,     R3                      ; 528C   00D3
        ADCR    R4                              ; 528D   002C
        ADDR    R3,     R3                      ; 528E   00DB
        ADCR    R4                              ; 528F   002C
        ADDR    R4,     R3                      ; 5290   00E3
        ADCR    R4                              ; 5291   002C
        ADDR    R5,     R3                      ; 5292   00EB
        ADCR    R4                              ; 5293   002C
        ADDR    R6,     R2                      ; 5294   00F2
        ADCR    R4                              ; 5295   002C
        ADDR    R7,     R2                      ; 5296   00FA
        ADCR    R4                              ; 5297   002C
L_5298:
        PSHR    R5                              ; 5298   0275
        MOVR    R7,     R1                      ; 5299   00B9
        ADDI    #$0019, R1                      ; 529A   02F9 0019
        MOVR    R7,     R4                      ; 529C   00BC
        ADDI    #$0020, R4                      ; 529D   02FC 0020

        JSR     R5,     L_522D                  ; 529F   0004 0150 022D

        MVII    #$0345, R4                      ; 52A2   02BC 0345
        MOVR    R7,     R0                      ; 52A4   00B8
        ADDI    #$0005, R0                      ; 52A5   02F8 0005

        JSR     R5,     L_5965                  ; 52A7   0004 0158 0165
        DECLE   $0045,  $0092,  $00BA,  $0054   ; 52AA   0045 0092 00BA 0054
        DECLE   $0000,  $0083,  $0000           ; 52AE   0000 0083 0000

        NEGR    R6                              ; 52B1   0026
        DIS                                     ; 52B2   0003
        MVO@    R3,     R1                      ; 52B3   024B
        MVO@    R4,     R1                      ; 52B4   024C
        MVO@    R7,     R3                      ; 52B5   025F
        MVO@    R0,     R4                      ; 52B6   0260
        PSHR    R3                              ; 52B7   0273
        PSHR    R4                              ; 52B8   0274
        MVI     .BTAB.88,R7                     ; 52B9   0287 0288

        DECLE   $029C,  $0000                   ; 52BB   029C 0000

        SWAP    R3,     1                       ; 52BD   0043
        ADCR    R5                              ; 52BE   002D
        SLL     R3,     1                       ; 52BF   004B
        ADCR    R5                              ; 52C0   002D
        SARC    R3,     1                       ; 52C1   007B
        ADCR    R5                              ; 52C2   002D
        RRC     R3,     1                       ; 52C3   0073
        ADCR    R5                              ; 52C4   002D
        RLC     R1,     2                       ; 52C5   0055
        ADCR    R5                              ; 52C6   002D
        SLLC    R1,     2                       ; 52C7   005D
        ADCR    R5                              ; 52C8   002D
        SLR     R1,     2                       ; 52C9   0065
        ADCR    R5                              ; 52CA   002D
        SAR     R1,     2                       ; 52CB   006D
        ADCR    R5                              ; 52CC   002D
        MOVR    R0,     R5                      ; 52CD   0085
        ADCR    R5                              ; 52CE   002D
L_52CF:
        PSHR    R5                              ; 52CF   0275

        JSR     R5,     L_51DA                  ; 52D0   0004 0150 01DA
        BIDECLE $2400                           ; 52D3   0000 0024

        JSR     R5,     L_51FE                  ; 52D5   0004 0150 01FE

        MVI     G_015F, R0                      ; 52D8   0280 015F
        SUBI    #$0004, R0                      ; 52DA   0338 0004
        NEGR    R0                              ; 52DC   0020
        MOVR    R0,     R1                      ; 52DD   0081
        SLL     R0,     1                       ; 52DE   0048
        ADDR    R1,     R0                      ; 52DF   00C8
        ADDR    R0,     R7                      ; 52E0   00C7

        JSR     R5,     L_5298                  ; 52E1   0004 0150 0298
        JSR     R5,     L_525E                  ; 52E4   0004 0150 025E

        SDBD                                    ; 52E7   0001
        MVII    #$5242, R1                      ; 52E8   02B9 0042 0052
        SDBD                                    ; 52EB   0001
        MVII    #$524C, R4                      ; 52EC   02BC 004C 0052

        JSR     R5,     L_522D                  ; 52EF   0004 0150 022D

        MVII    #$033D, R4                      ; 52F2   02BC 033D
        SDBD                                    ; 52F4   0001
        MVII    #$5239, R0                      ; 52F5   02B8 0039 0052

        JSR     R5,     L_5965                  ; 52F8   0004 0158 0165

L_52FB:
        SDBD                                    ; 52FB   0001
        MVII    #$1906, R0                      ; 52FC   02B8 0006 0019
L_52FF:
        MVO     R0,     G_035D                  ; 52FF   0240 035D
        MOVR    R5,     R7                      ; 5301   00AF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5302   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5306   00FF 00FF 00FF 00FF
        DECLE   $0024,  $0000,  $0000,  $0008   ; 530A   0024 0000 0000 0008
        DECLE   $0000,  $0008,  $0014,  $0008   ; 530E   0000 0008 0014 0008
        DECLE   $00FF                           ; 5312   00FF

        TSTR    R0                              ; 5313   0080
        MOVR    R3,     R7                      ; 5314   009F
        MOVR    R5,     R7                      ; 5315   00AF

        DECLE   $00B7,  $00BB,  $00BD,  $00BE   ; 5316   00B7 00BB 00BD 00BE
        DECLE   $00BE,  $00BD,  $00BB,  $00B7   ; 531A   00BE 00BD 00BB 00B7

        MOVR    R5,     R7                      ; 531E   00AF
        MOVR    R3,     R7                      ; 531F   009F

        DECLE   $0080,  $00FF,  $00FF,  $0001   ; 5320   0080 00FF 00FF 0001
        DECLE   $00F9,  $00F5,  $00ED,  $00DD   ; 5324   00F9 00F5 00ED 00DD
        DECLE   $00BD,  $007D,  $007D,  $00BD   ; 5328   00BD 007D 007D 00BD
        DECLE   $00DD,  $00ED,  $00F5,  $00F9   ; 532C   00DD 00ED 00F5 00F9
        DECLE   $0001,  $00FF,  $001B,  $0032   ; 5330   0001 00FF 001B 0032
        DECLE   $0012,  $0000,  $0004,  $0000   ; 5334   0012 0000 0004 0000
        DECLE   $0004,  $000A,  $0004,  $0040   ; 5338   0004 000A 0004 0040
        DECLE   $0044,  $0098,  $0030,  $0090   ; 533C   0044 0098 0030 0090
        DECLE   $0050,  $0008,  $0000,  $0000   ; 5340   0050 0008 0000 0000
        DECLE   $0000,  $0024,  $0042,  $0000   ; 5344   0000 0024 0042 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5348   0000 0000 0000 0000
        DECLE   $0000,  $0041,  $0002,  $0020   ; 534C   0000 0041 0002 0020
        DECLE   $0018,  $0000                   ; 5350   0018 0000
.GFX_LIST_5352:
        DECLE   $00FF,  $0080,  $0098,  $00A4   ; 5352  CART PIC #00
        DECLE   $00BC,  $00A4,  $00A4,  $0080   ; 5356  
        DECLE   $00FF,  $0080,  $00B0,  $0088   ; 535A  CART PIC #01
        DECLE   $0090,  $00A0,  $00B8,  $0080   ; 535E  
        DECLE   $00FF,  $0080,  $00B8,  $0088   ; 5362  CART PIC #02
        DECLE   $0090,  $0088,  $00B0,  $0080   ; 5366  
        DECLE   $00FF,  $0080,  $00A8,  $00A8   ; 536A  CART PIC #03
        DECLE   $00BC,  $0088,  $0088,  $0080   ; 536E  
        DECLE   $00FF,  $0080,  $00B8,  $00A0   ; 5372  CART PIC #04
        DECLE   $00B0,  $0088,  $00B0,  $0080   ; 5376  
        DECLE   $00FF,  $0080,  $0098,  $00A0   ; 537A  CART PIC #05
        DECLE   $00B8,  $00A4,  $0098,  $0080   ; 537E  
        DECLE   $00FF,  $0080,  $00BC,  $0084   ; 5382  CART PIC #06
        DECLE   $0088,  $0090,  $0090,  $0080   ; 5386  
        DECLE   $00FF,  $0080,  $0098,  $00A4   ; 538A  CART PIC #07
        DECLE   $0098,  $00A4,  $0098,  $0080   ; 538E  
        DECLE   $00FF,  $0080,  $0098,  $00A4   ; 5392  CART PIC #08
        DECLE   $009C,  $0084,  $0098,  $0080   ; 5396  
        DECLE   $00FF,  $0080,  $00A4,  $00AA   ; 539A  CART PIC #09
        DECLE   $00AA,  $00AA,  $00A4,  $0080   ; 539E  
        DECLE   $00FF,  $0080,  $008E,  $0084   ; 53A2  CART PIC #0A
        DECLE   $0084,  $00A4,  $0098,  $0080   ; 53A6  
        DECLE   $00FF,  $0080,  $0098,  $00A4   ; 53AA  CART PIC #0B
        DECLE   $00A4,  $00AC,  $009A,  $0080   ; 53AE  
        DECLE   $00FF,  $0080,  $00A4,  $00A8   ; 53B2  CART PIC #0C
        DECLE   $00B0,  $00A8,  $00A4,  $0080   ; 53B6  
        DECLE   $0080,  $0088,  $009C,  $00BE   ; 53BA  CART PIC #0D
        DECLE   $00B6,  $0088,  $0080,  $00FF   ; 53BE  
        DECLE   $0080,  $0094,  $00BE,  $00BE   ; 53C2  CART PIC #0E
        DECLE   $009C,  $0088,  $0080,  $00FF   ; 53C6  
        DECLE   $0080,  $0094,  $00B6,  $0088   ; 53CA  CART PIC #0F
        DECLE   $00B6,  $0094,  $0080,  $00FF   ; 53CE  
        DECLE   $0080,  $0088,  $009C,  $00BE   ; 53D2  CART PIC #10
        DECLE   $009C,  $0088,  $0080,  $00FF   ; 53D6  
        DECLE   $00FF,  $0080,  $009F,  $00AF   ; 53DA  CART PIC #11
        DECLE   $00B7,  $00BB,  $00BD,  $00BE   ; 53DE  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53E2  CART PIC #12
        DECLE   $0003,  $000F,  $001C,  $0018   ; 53E6  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53EA  CART PIC #13
        DECLE   $00E0,  $00F0,  $0038,  $001C   ; 53EE  
        DECLE   $0038,  $0030,  $0038,  $0018   ; 53F2  CART PIC #14
        DECLE   $000C,  $001C,  $0032,  $0060   ; 53F6  
        DECLE   $000E,  $0006,  $000C,  $0008   ; 53FA  CART PIC #15
        DECLE   $0030,  $0018,  $002C,  $0082   ; 53FE  
        DECLE   $0078,  $00EC,  $00DE,  $00EF   ; 5402  CART PIC #16
        DECLE   $00EF,  $00F7,  $007B,  $003D   ; 5406  
        DECLE   $0000,  $0000,  $0001,  $0007   ; 540A  CART PIC #17
        DECLE   $000F,  $001F,  $001E,  $003C   ; 540E  
        DECLE   $0000,  $0000,  $00C0,  $00E0   ; 5412  CART PIC #18
        DECLE   $00B0,  $0008,  $0000,  $0004   ; 5416  
        DECLE   $003C,  $003C,  $003C,  $0031   ; 541A  CART PIC #19
        DECLE   $003A,  $001C,  $0008,  $0010   ; 541E  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5422  CART PIC #1A
        DECLE   $0000,  $0080,  $0040,  $0020   ; 5426  
        DECLE   $001C,  $0027,  $0063,  $0063   ; 542A  CART PIC #1B
        DECLE   $0061,  $0071,  $0058,  $004C   ; 542E  
        DECLE   $0010,  $0058,  $00F8,  $00F8   ; 5432  CART PIC #1C
        DECLE   $00F3,  $00E5,  $00F9,  $0002   ; 5436  
        DECLE   $0047,  $004F,  $005F,  $005F   ; 543A  CART PIC #1D
        DECLE   $005F,  $004F,  $007F,  $007F   ; 543E  
        DECLE   $0041,  $0043,  $0047,  $004F   ; 5442  CART PIC #1E
        DECLE   $005F,  $007F,  $007F,  $00FF   ; 5446  
        DECLE   $0000,  $0000,  $0003,  $0007   ; 544A  CART PIC #1F
        DECLE   $000C,  $0008,  $0000,  $0010   ; 544E  
        DECLE   $0000,  $0000,  $00C0,  $00E0   ; 5452  CART PIC #20
        DECLE   $00F0,  $0078,  $0078,  $003C   ; 5456  
        DECLE   $0008,  $001A,  $001F,  $001F   ; 545A  CART PIC #21
        DECLE   $000F,  $0007,  $0007,  $000C   ; 545E  
        DECLE   $005C,  $0084,  $00C6,  $00E2   ; 5462  CART PIC #22
        DECLE   $00C6,  $008E,  $001A,  $0072   ; 5466  
        DECLE   $00E1,  $008F,  $002A,  $00F5   ; 546A  CART PIC #23
        DECLE   $00FA,  $00FD,  $00FF,  $00FF   ; 546E  
        DECLE   $00E2,  $0052,  $00AA,  $005A   ; 5472  CART PIC #24
        DECLE   $00AA,  $0052,  $00FE,  $00FE   ; 5476  
.GRAM_INIT_547A:
        DECLE   $0031           ; 547A  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 547B  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 547D  #08-0F:  CART #08-0F ----
        DECLE   $0020           ; 547F  #10   :  CART #10    ----
        DECLE   $0361,  $0181   ; 5480  #11   :  Algo #2
        DECLE   $0123,  $0040   ; 5482  #12-12:  GRAM #11-11 -Y--
        DECLE   $03FF,  $03FC   ; 5484  #13   :  4x4 tile
        DECLE   $0022           ; 5486  #14   :  CART #11    ----
        DECLE   $0122           ; 5487  #15   :  CART #11    -Y--
        DECLE   $0229,  $00C0   ; 5488  #16-17:  GRAM #14-15 X---
        DECLE   $0069,  $00B0   ; 548A  #18-19:  GROM #74-75 ----
        DECLE   $0025,  $0200   ; 548C  #1A-1E:  CART #12-16 ----
        DECLE   $022C           ; 548E  #1F   :  CART #16    X---
        DECLE   $002F,  $0380   ; 548F  #20-27:  CART #17-1E ----
        DECLE   $003F,  $0280   ; 5491  #28-2D:  CART #1F-24 ----
        DECLE   $0233,  $0080   ; 5493  #2E-2F:  CART #19-1A X---
        DECLE   $023C           ; 5495  #30   :  CART #1E    X---

        DECLE   $0031,  $0091,  $00BA,  $0054   ; 5496   0031 0091 00BA 0054
        DECLE   $0000,  $0058,  $0000,  $0058   ; 549A   0000 0058 0000 0058
        DECLE   $0000,  $00C4,  $0010,  $00C1   ; 549E   0000 00C4 0010 00C1
        DECLE   $0054,  $0000,  $0000,  $0000   ; 54A2   0054 0000 0000 0000
        DECLE   $0000,  $0000,  $00C4,  $0010   ; 54A6   0000 0000 00C4 0010
        DECLE   $00BA,  $0054,  $0000,  $0000   ; 54AA   00BA 0054 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0005   ; 54AE   0000 0000 0002 0005
        DECLE   $0031,  $00BA,  $0054,  $0000   ; 54B2   0031 00BA 0054 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54B6   0000 0000 0000 0000
        DECLE   $0200,  $0000,  $0000,  $0000   ; 54BA   0200 0000 0000 0000
        DECLE   $0005,  $0000,  $0000,  $0324   ; 54BE   0005 0000 0000 0324
        DECLE   $0057,  $007B,  $0057,  $0001   ; 54C2   0057 007B 0057 0001
        DECLE   $0002,  $0000                   ; 54C6   0002 0000
L_54C8:
        PSHR    R5                              ; 54C8   0275
        PSHR    R0                              ; 54C9   0270
        CLRR    R0                              ; 54CA   01C0

        JSR     R5,     .EXEC.772               ; 54CB   0004 0114 0372

        MOVR    R2,     R3                      ; 54CE   0093
        SUBI    #$0008, R2                      ; 54CF   033A 0008
        SLR     R2,     2                       ; 54D1   0066
        SLR     R2,     1                       ; 54D2   0062
L_54D3:
        PULR    R0                              ; 54D3   02B0
        PULR    R7                              ; 54D4   02B7

L_54D5:
        PSHR    R5                              ; 54D5   0275
        NEGR    R0                              ; 54D6   0020
        BPL     L_54D3                          ; 54D7   0223 0005

        JSR     R5,     L_54C8                  ; 54D9   0004 0154 00C8

        ADDI    #$02C8, R2                      ; 54DC   02FA 02C8
        MVI@    R2,     R0                      ; 54DE   0290
        MOVR    R0,     R5                      ; 54DF   0085
        SDBD                                    ; 54E0   0001
        ANDI    #$0800, R5                      ; 54E1   03BD 0000 0008
        BEQ     L_54F4                          ; 54E4   0204 000E

        SLR     R0,     2                       ; 54E6   0064
        SLR     R0,     1                       ; 54E7   0060
        ANDI    #$000F, R0                      ; 54E8   03B8 000F
        ADDI    #$0014, R2                      ; 54EA   02FA 0014
        MVI@    R2,     R1                      ; 54EC   0291
        SLR     R1,     2                       ; 54ED   0065
        SLR     R1,     1                       ; 54EE   0061
        ANDI    #$001F, R1                      ; 54EF   03B9 001F
        SUBI    #$000D, R1                      ; 54F1   0339 000D
        PULR    R7                              ; 54F3   02B7

L_54F4:
        PULR    R5                              ; 54F4   02B5
        B       L_5573                          ; 54F5   0200 007C

L_54F7:
        PSHR    R5                              ; 54F7   0275
        MVII    #$011F, R4                      ; 54F8   02BC 011F
L_54FA:
        CMPI    #$0121, R4                      ; 54FA   037C 0121
        BPL     L_5528                          ; 54FC   0203 002A

        MVI@    R4,     R1                      ; 54FE   02A1
        MOVR    R1,     R0                      ; 54FF   0088
        ANDI    #$00C0, R1                      ; 5500   03B9 00C0
        BNEQ    L_54FA                          ; 5502   022C 0009

        JSR     R5,     L_54C8                  ; 5504   0004 0154 00C8

        SDBD                                    ; 5507   0001
        MVII    #$9131, R1                      ; 5508   02B9 0031 0091
        ANDI    #$000C, R0                      ; 550B   03B8 000C
        BEQ     L_5529                          ; 550D   0204 001A

        XORI    #$000C, R0                      ; 550F   03F8 000C
        BEQ     L_5529                          ; 5511   0204 0016

        DECR    R2                              ; 5513   0012
        BMI     L_5528                          ; 5514   020B 0012

        ADDI    #$02C8, R2                      ; 5516   02FA 02C8
        MVI@    R2,     R2                      ; 5518   0292
        SWAP    R2,     1                       ; 5519   0042
        ANDI    #$0008, R2                      ; 551A   03BA 0008
        BEQ     L_5528                          ; 551C   0204 000A

        SUBI    #$0008, R3                      ; 551E   033B 0008
L_5520:
        SWAP    R3,     1                       ; 5520   0043
        MVO     R3,     G_031F                  ; 5521   0243 031F
        MVO     R1,     G_031D                  ; 5523   0241 031D

        JSR     R5,     .EXEC.607               ; 5525   0004 0114 0207

L_5528:
        PULR    R7                              ; 5528   02B7

L_5529:
        INCR    R2                              ; 5529   000A
        CMPI    #$0014, R2                      ; 552A   037A 0014
        BEQ     L_5528                          ; 552C   0224 0005

        ADDI    #$02C8, R2                      ; 552E   02FA 02C8
        MOVR    R2,     R4                      ; 5530   0094
        MVI@    R4,     R2                      ; 5531   02A2
        SDBD                                    ; 5532   0001
        CMPI    #$2E88, R2                      ; 5533   037A 0088 002E
        BPL     L_5528                          ; 5536   0223 000F

        SWAP    R2,     1                       ; 5538   0042
        ANDI    #$0008, R2                      ; 5539   03BA 0008
        BEQ     L_5528                          ; 553B   0224 0014

        ADDI    #$0008, R3                      ; 553D   02FB 0008
        MVI@    R4,     R2                      ; 553F   02A2
        SDBD                                    ; 5540   0001
        CMPI    #$2E88, R2                      ; 5541   037A 0088 002E
        BMI     L_5520                          ; 5544   022B 0025

        SDBD                                    ; 5546   0001
        XORI    #$2000, R1                      ; 5547   03F9 0000 0020
        B       L_5520                          ; 554A   0220 002B

        PSHR    R5                              ; 554C   0275
        MVI     G_0165, R2                      ; 554D   0282 0165
        TSTR    R2                              ; 554F   0092
        BNEQ    L_5528                          ; 5550   022C 0029

        JSR     R5,     L_54D5                  ; 5552   0004 0154 00D5

        MVI     G_015E, R5                      ; 5555   0285 015E
        CMPI    #$0004, R5                      ; 5557   037D 0004
        BEQ     L_559C                          ; 5559   0204 0041

        CMPI    #$0001, R5                      ; 555B   037D 0001
        BEQ     L_5562                          ; 555D   0204 0003
        J       L_6040                          ; 555F   0004 0360 0040

L_5562:
        MVI     G_01D7, R5                      ; 5562   0285 01D7
        TSTR    R5                              ; 5564   00AD
        BNEQ    L_5528                          ; 5565   022C 003E

        CMP     G_016F, R0                      ; 5567   0340 016F
        BEQ     L_5577                          ; 5569   0204 000C

        CMP     G_0170, R1                      ; 556B   0341 0170
        BEQ     L_5577                          ; 556D   0204 0008

        CMPI    #$0007, R0                      ; 556F   0378 0007
        BEQ     L_5577                          ; 5571   0204 0004

L_5573:
        JSR     R5,     X_PLAY_RAZZ2            ; 5573   0004 011C 02BD

        PULR    R7                              ; 5576   02B7

L_5577:
        JSR     R5,     L_5923                  ; 5577   0004 0158 0123
        JSR     R5,     L_568D                  ; 557A   0004 0154 028D

        MVI     G_016F, R0                      ; 557D   0280 016F
        CMPI    #$0007, R0                      ; 557F   0378 0007
        BEQ     L_558E                          ; 5581   0204 000B

L_5583:
        MVII    #$0001, R0                      ; 5583   02B8 0001
        MVO     R0,     G_0165                  ; 5585   0240 0165

        JSR     R5,     L_5D5B                  ; 5587   0004 015C 015B
        JSR     R5,     L_5148                  ; 558A   0004 0150 0148

        PULR    R7                              ; 558D   02B7

L_558E:
        MVII    #$0001, R0                      ; 558E   02B8 0001
        MVO     R0,     G_01D7                  ; 5590   0240 01D7
        SDBD                                    ; 5592   0001
        MVII    #$5155, R1                      ; 5593   02B9 0055 0051
        MVO     R1,     G_035D                  ; 5596   0241 035D

        JSR     R5,     .EXEC.607               ; 5598   0004 0114 0207

        PULR    R7                              ; 559B   02B7

L_559C:
        MVI     .BTAB.11,R5                     ; 559C   0285 0211
        TSTR    R5                              ; 559E   00AD
        BEQ     L_55A4                          ; 559F   0204 0003
        J       L_661F                          ; 55A1   0004 0364 021F

L_55A4:
        MVI     G_0323, R5                      ; 55A4   0285 0323
        TSTR    R5                              ; 55A6   00AD
        BNEQ    L_5528                          ; 55A7   022C 0080

        DECR    R0                              ; 55A9   0010
        BPL     L_55AE                          ; 55AA   0203 0002

        MVII    #$000C, R0                      ; 55AC   02B8 000C
L_55AE:
        MVI     G_01E5, R5                      ; 55AE   0285 01E5
        TSTR    R5                              ; 55B0   00AD
        BNEQ    L_55C9                          ; 55B1   020C 0016

        CMPI    #$0001, R1                      ; 55B3   0379 0001
        BNEQ    L_55C5                          ; 55B5   020C 000E

        MVI     G_01EF, R5                      ; 55B7   0285 01EF
        TSTR    R5                              ; 55B9   00AD
        BNEQ    L_55C5                          ; 55BA   020C 0009

        MVII    #$0183, R4                      ; 55BC   02BC 0183

        JSR     R5,     L_59CC                  ; 55BE   0004 0158 01CC

        CMP     G_016A, R3                      ; 55C1   0343 016A
        BNEQ    L_5573                          ; 55C3   022C 0051

L_55C5:
        MVO     R0,     G_016F                  ; 55C5   0240 016F
        MVO     R1,     G_0170                  ; 55C7   0241 0170
L_55C9:
        MVI     G_0170, R3                      ; 55C9   0283 0170
        MVII    #$0181, R4                      ; 55CB   02BC 0181
        CMPR    R3,     R1                      ; 55CD   0159
        BEQ     L_55E9                          ; 55CE   0204 0019

        MOVR    R4,     R5                      ; 55D0   00A5
        ADDR    R3,     R5                      ; 55D1   00DD
        ADDR    R3,     R5                      ; 55D2   00DD
        SDBD                                    ; 55D3   0001
        MVI@    R5,     R3                      ; 55D4   02AB
        TSTR    R3                              ; 55D5   009B
        BNEQ    L_5573                          ; 55D6   022C 0064

        MVI     G_016E, R5                      ; 55D8   0285 016E
        CMP     G_016A, R5                      ; 55DA   0345 016A
        BNEQ    L_55E9                          ; 55DC   020C 000B

        CMPI    #$0001, R1                      ; 55DE   0379 0001
        BEQ     L_5573                          ; 55E0   0224 006E

        TSTR    R1                              ; 55E2   0089
        BNEQ    L_55E9                          ; 55E3   020C 0004

        CMPI    #$000A, R0                      ; 55E5   0378 000A
        BEQ     L_5573                          ; 55E7   0224 0075

L_55E9:
        CMP     G_0170, R1                      ; 55E9   0341 0170
        BNEQ    L_55F7                          ; 55EB   020C 000A

        MVO     R0,     G_01E7                  ; 55ED   0240 01E7
        CMP     G_016F, R0                      ; 55EF   0340 016F
        BMI     L_55FB                          ; 55F1   020B 0008

        MVO     R0,     G_016F                  ; 55F3   0240 016F
        B       L_55FB                          ; 55F5   0200 0004

L_55F7:
        MVII    #$00FF, R5                      ; 55F7   02BD 00FF
        MVO     R5,     G_01E7                  ; 55F9   0245 01E7
L_55FB:
        MOVR    R1,     R2                      ; 55FB   008A
        MOVR    R0,     R1                      ; 55FC   0081
        MVII    #$003C, R3                      ; 55FD   02BB 003C
        MVO     R3,     G_0323                  ; 55FF   0243 0323
        MVI     G_016A, R5                      ; 5601   0285 016A
        DECR    R5                              ; 5603   0015
        BNEQ    L_5609                          ; 5604   020C 0003

        JSR     R5,     L_5953                  ; 5606   0004 0158 0153

L_5609:
        J       L_62CE                          ; 5609   0004 0360 02CE

        PSHR    R5                              ; 560C   0275
        MVI     G_0165, R2                      ; 560D   0282 0165
        TSTR    R2                              ; 560F   0092
        BNEQ    L_5528                          ; 5610   022C 00E9

        NEGR    R0                              ; 5612   0020
        BPL     L_5528                          ; 5613   0223 00EC

        MVI     G_015E, R5                      ; 5615   0285 015E
        CMPI    #$0004, R5                      ; 5617   037D 0004
        BEQ     L_5528                          ; 5619   0224 00F2

        CMPI    #$0001, R5                      ; 561B   037D 0001
        BEQ     L_5622                          ; 561D   0204 0003
        J       L_6051                          ; 561F   0004 0360 0051

L_5622:
        MVI     G_016A, R0                      ; 5622   0280 016A
        CMPI    #$000F, R0                      ; 5624   0378 000F
        BPL     L_5573                          ; 5626   0223 00B4

        JSR     R5,     L_52FB                  ; 5628   0004 0150 02FB
        JSR     R5,     L_5A0D                  ; 562B   0004 0158 020D
        JSR     R5,     L_5148                  ; 562E   0004 0150 0148

        PULR    R7                              ; 5631   02B7

L_5632:
        PSHR    R5                              ; 5632   0275
        MVII    #$0325, R4                      ; 5633   02BC 0325
        SDBD                                    ; 5635   0001
        MVII    #$549F, R0                      ; 5636   02B8 009F 0054
        MVII    #$0003, R2                      ; 5639   02BA 0003

L_563B:
        JSR     R5,     L_5964                  ; 563B   0004 0158 0164

        DECR    R2                              ; 563E   0012
        BNEQ    L_563B                          ; 563F   022C 0005

        MVII    #$00F8, R0                      ; 5641   02B8 00F8
        SWAP    R0,     1                       ; 5643   0040
        MVO     R0,     G_0339                  ; 5644   0240 0339
        MVII    #$0008, R0                      ; 5646   02B8 0008
        SWAP    R0,     1                       ; 5648   0040
        MVO     R0,     G_0331                  ; 5649   0240 0331
        MVII    #$0002, R0                      ; 564B   02B8 0002

        JSR     R5,     .EXEC.6CF               ; 564D   0004 0114 02CF

        INCR    R0                              ; 5650   0008

        JSR     R5,     .EXEC.6D0               ; 5651   0004 0114 02D0

L_5654:
        MVO     R5,     G_0324                  ; 5654   0245 0324

        JSR     R5,     L_5632                  ; 5656   0004 0154 0232

        MVII    #$0048, R1                      ; 5659   02B9 0048
        SWAP    R1,     1                       ; 565B   0041
L_565C:
        MVO     R1,     G_0327                  ; 565C   0241 0327
        MVII    #$0038, R1                      ; 565E   02B9 0038
        SWAP    R1,     1                       ; 5660   0041
        MVO     R1,     G_0328                  ; 5661   0241 0328
        MVII    #$0019, R0                      ; 5663   02B8 0019
        MVI     G_0165, R1                      ; 5665   0281 0165
        SLL     R1,     2                       ; 5667   004D
        NEGR    R1                              ; 5668   0021
        ADDI    #$000C, R1                      ; 5669   02F9 000C

        JSR     R5,     .EXEC.629               ; 566B   0004 0114 0229

        MVO     R0,     G_0329                  ; 566E   0240 0329
        PULR    R7                              ; 5670   02B7

L_5671:
        MVO     R5,     G_0324                  ; 5671   0245 0324
        MVI     G_016F, R1                      ; 5673   0281 016F
        MVI     G_0170, R2                      ; 5675   0282 0170
        SLL     R2,     2                       ; 5677   004E
        SLL     R2,     2                       ; 5678   004E
        ADDR    R1,     R2                      ; 5679   00CA
        MVO     R2,     G_0164                  ; 567A   0242 0164

        JSR     R5,     L_5B7A                  ; 567C   0004 0158 037A
        JSR     R5,     L_51C3                  ; 567F   0004 0150 01C3
        JSR     R5,     L_5632                  ; 5682   0004 0154 0232
        JSR     R5,     L_56C5                  ; 5685   0004 0154 02C5

        MVII    #$0058, R1                      ; 5688   02B9 0058
        SWAP    R1,     1                       ; 568A   0041
        B       L_565C                          ; 568B   0220 0030

L_568D:
        MVO     R5,     G_0324                  ; 568D   0245 0324

        JSR     R5,     L_5632                  ; 568F   0004 0154 0232

        MVI     G_0165, R1                      ; 5692   0281 0165
        DECR    R1                              ; 5694   0011
        BMI     L_56B3                          ; 5695   020B 001C

        SLL     R1,     1                       ; 5697   0049
        SDBD                                    ; 5698   0001
        ADDI    #$57B5, R1                      ; 5699   02F9 00B5 0057
        MVI@    R1,     R0                      ; 569C   0288
        INCR    R1                              ; 569D   0009
        MVI@    R1,     R2                      ; 569E   028A
        SWAP    R0,     1                       ; 569F   0040
        SWAP    R2,     1                       ; 56A0   0042
L_56A1:
        MVO     R0,     G_0327                  ; 56A1   0240 0327
        MVO     R2,     G_0328                  ; 56A3   0242 0328
        SDBD                                    ; 56A5   0001
        MVII    #$5838, R2                      ; 56A6   02BA 0038 0058
        MVII    #$0019, R3                      ; 56A9   02BB 0019
        MVII    #$0325, R1                      ; 56AB   02B9 0325

        JSR     R5,     .EXEC.9A1               ; 56AD   0004 0118 01A1
        JSR     R5,     L_5D23                  ; 56B0   0004 015C 0123
L_56B3:
        JSR     R5,     L_51C3                  ; 56B3   0004 0150 01C3
        JSR     R5,     L_56C5                  ; 56B6   0004 0154 02C5

        MVI     G_031F, R0                      ; 56B9   0280 031F
        SDBD                                    ; 56BB   0001
        ADDI    #$0800, R0                      ; 56BC   02F8 0000 0008
        MVI     G_0320, R2                      ; 56BF   0282 0320
        SUBI    #$0200, R2                      ; 56C1   033A 0200
        B       L_56A1                          ; 56C3   0220 0023

L_56C5:
        PSHR    R5                              ; 56C5   0275
        MVI     G_016F, R0                      ; 56C6   0280 016F
        SLL     R0,     2                       ; 56C8   004C
        SLL     R0,     1                       ; 56C9   0048
        SDBD                                    ; 56CA   0001
        MVII    #$3800, R4                      ; 56CB   02BC 0000 0038
        ADDR    R0,     R4                      ; 56CE   00C4
        MVII    #$0008, R0                      ; 56CF   02B8 0008
        SDBD                                    ; 56D1   0001
        MVII    #$39F0, R1                      ; 56D2   02B9 00F0 0039

        JSR     R5,     .EXEC.730               ; 56D5   0004 0114 0330

        MVO     R0,     .STIC.VIDEN             ; 56D8   0240 0020
        MOVR    R5,     R1                      ; 56DA   00A9
        MVI     G_0170, R0                      ; 56DB   0280 0170
        ADDI    #$000D, R0                      ; 56DD   02F8 000D
        SLL     R0,     2                       ; 56DF   004C
        SLL     R0,     1                       ; 56E0   0048
        MOVR    R0,     R4                      ; 56E1   0084
        SDBD                                    ; 56E2   0001
        ADDI    #$3800, R4                      ; 56E3   02FC 0000 0038
        MVII    #$0008, R0                      ; 56E6   02B8 0008

        JSR     R5,     .EXEC.730               ; 56E8   0004 0114 0330

        MVII    #$0010, R0                      ; 56EB   02B8 0010
        SDBD                                    ; 56ED   0001
        MVII    #$39E0, R1                      ; 56EE   02B9 00E0 0039
        SDBD                                    ; 56F1   0001
        MVII    #$3888, R4                      ; 56F2   02BC 0088 0038

        JSR     R5,     .EXEC.730               ; 56F5   0004 0114 0330

        MVI     G_0170, R2                      ; 56F8   0282 0170
        MVI     G_0325, R1                      ; 56FA   0281 0325
        XORI    #$0004, R1                      ; 56FC   03F9 0004
        ANDI    #$0001, R2                      ; 56FE   03BA 0001
        BEQ     L_5704                          ; 5700   0204 0002

        ADDI    #$0002, R1                      ; 5702   02F9 0002
L_5704:
        MVO     R1,     G_0325                  ; 5704   0241 0325
        MVO     R1,     G_032D                  ; 5706   0241 032D
        MVI     G_0335, R1                      ; 5708   0281 0335
        XORI    #$0002, R1                      ; 570A   03F9 0002
        MVO     R1,     G_0335                  ; 570C   0241 0335
        MVII    #$00FF, R0                      ; 570E   02B8 00FF
        MVO     R0,     G_0114                  ; 5710   0240 0114
        PULR    R7                              ; 5712   02B7

L_5713:
        PSHR    R5                              ; 5713   0275
        MVII    #$0017, R0                      ; 5714   02B8 0017
        MVII    #$0325, R4                      ; 5716   02BC 0325

        JSR     R5,     X_FILL_ZERO             ; 5718   0004 0114 0338

        MVII    #$0002, R0                      ; 571B   02B8 0002

        JSR     R5,     .EXEC.6D5               ; 571D   0004 0114 02D5

        INCR    R0                              ; 5720   0008

        JSR     R5,     .EXEC.6D6               ; 5721   0004 0114 02D6

        PSHR    R5                              ; 5724   0275

        JSR     R5,     L_5713                  ; 5725   0004 0154 0313
        JSR     R5,     L_67DF                  ; 5728   0004 0164 03DF
        JSR     R5,     L_5D29                  ; 572B   0004 015C 0129

        MVI     G_0165, R1                      ; 572E   0281 0165
        TSTR    R1                              ; 5730   0089
        BNEQ    L_5765                          ; 5731   020C 0032

        JSR     R5,     L_5B91                  ; 5733   0004 0158 0391
        JSR     R5,     .EXEC.A61               ; 5736   0004 0118 0261
        DECLE   $000F                           ; 5739   000F

        MVII    #$02C8, R4                      ; 573A   02BC 02C8
L_573C:
        MVI@    R4,     R0                      ; 573C   02A0
        SDBD                                    ; 573D   0001
        ANDI    #$0800, R0                      ; 573E   03B8 0000 0008
        BEQ     L_573C                          ; 5741   0224 0006

        MOVR    R4,     R3                      ; 5743   00A3
        SUBI    #$0002, R3                      ; 5744   033B 0002
        ADD     G_016A, R3                      ; 5746   02C3 016A
        MVI     .BTAB.A9,R1                     ; 5748   0281 02A9
        MVO@    R1,     R3                      ; 574A   0259
        SDBD                                    ; 574B   0001
        ANDI    #$2E07, R1                      ; 574C   03B9 0007 002E
        INCR    R3                              ; 574F   000B
        ADDI    #$0088, R1                      ; 5750   02F9 0088
        MVO@    R1,     R3                      ; 5752   0259
        ADDI    #$0014, R3                      ; 5753   02FB 0014
        ADDI    #$0008, R1                      ; 5755   02F9 0008
        MVO@    R1,     R3                      ; 5757   0259
        DECR    R3                              ; 5758   0013
        MVI     .BTAB.BD,R1                     ; 5759   0281 02BD
        MVO@    R1,     R3                      ; 575B   0259

        JSR     R5,     L_5217                  ; 575C   0004 0150 0217
L_575F:
        JSR     R5,     L_58C8                  ; 575F   0004 0158 00C8
        JSR     R5,     L_598D                  ; 5762   0004 0158 018D

L_5765:
        CLRR    R0                              ; 5765   01C0
        MVO     R0,     G_0114                  ; 5766   0240 0114

        JSR     R5,     L_5975                  ; 5768   0004 0158 0175

        MVI     G_015E, R5                      ; 576B   0285 015E
        DECR    R5                              ; 576D   0015
        BNEQ    L_5779                          ; 576E   020C 0009

        JSR     R5,     L_5D62                  ; 5770   0004 015C 0162

        TSTR    R0                              ; 5773   0080
        BNEQ    L_5779                          ; 5774   020C 0003
        J       L_5D0D                          ; 5776   0004 035C 010D
L_5779:
        MVI     G_0324, R7                      ; 5779   0287 0324

        PSHR    R5                              ; 577B   0275

        JSR     R5,     L_5713                  ; 577C   0004 0154 0313
        JSR     R5,     L_5B6E                  ; 577F   0004 0158 036E
        JSR     R5,     L_67DF                  ; 5782   0004 0164 03DF

        MVI     G_0165, R1                      ; 5785   0281 0165
        TSTR    R1                              ; 5787   0089
        BNEQ    L_5765                          ; 5788   022C 0024

        CLRR    R0                              ; 578A   01C0
        MVO     R0,     G_0114                  ; 578B   0240 0114
        MVI     G_0166, R1                      ; 578D   0281 0166
        CMPI    #$0013, R1                      ; 578F   0379 0013
        BEQ     L_575F                          ; 5791   0224 0033

        ADDI    #$02C8, R1                      ; 5793   02F9 02C8
        MOVR    R1,     R0                      ; 5795   0088
        NEGR    R0                              ; 5796   0020
        ADDI    #$02DA, R0                      ; 5797   02F8 02DA
        MOVR    R1,     R4                      ; 5799   008C
        INCR    R4                              ; 579A   000C
        PSHR    R0                              ; 579B   0270
        PSHR    R1                              ; 579C   0271
        PSHR    R4                              ; 579D   0274

        JSR     R5,     .EXEC.730               ; 579E   0004 0114 0330

        PULR    R4                              ; 57A1   02B4
        PULR    R1                              ; 57A2   02B1
        PULR    R0                              ; 57A3   02B0
        ADDI    #$0014, R1                      ; 57A4   02F9 0014
        ADDI    #$0014, R4                      ; 57A6   02FC 0014

        JSR     R5,     .EXEC.730               ; 57A8   0004 0114 0330

        MVI     G_016A, R5                      ; 57AB   0285 016A
        TSTR    R5                              ; 57AD   00AD
        BEQ     L_5765                          ; 57AE   0224 004A

        JSR     R5,     L_5953                  ; 57B0   0004 0158 0153

        B       L_575F                          ; 57B3   0220 0055

        GSWD    R0                              ; 57B5   0030
        RSWD    R0                              ; 57B6   0038
        SLLC    R0,     1                       ; 57B7   0058
        ADCR    R0                              ; 57B8   0028
        SARC    R3,     1                       ; 57B9   007B
        RSWD    R0                              ; 57BA   0038
        PSHR    R5                              ; 57BB   0275
        MVI     G_015E, R5                      ; 57BC   0285 015E
        CMPI    #$0004, R5                      ; 57BE   037D 0004
        BEQ     L_5528                          ; 57C0   0224 0299

        MVI     G_016A, R5                      ; 57C2   0285 016A
        DECR    R5                              ; 57C4   0015
        BEQ     L_5528                          ; 57C5   0224 029E

        JSR     R5,     L_54D5                  ; 57C7   0004 0154 00D5

        SLL     R1,     2                       ; 57CA   004D
        SLL     R1,     2                       ; 57CB   004D
        ADDR    R1,     R0                      ; 57CC   00C8
        MVO     R0,     G_0168                  ; 57CD   0240 0168
        MOVR    R2,     R3                      ; 57CF   0093
        MVI@    R2,     R4                      ; 57D0   0294
        SUBI    #$0028, R3                      ; 57D1   033B 0028
        MVO@    R4,     R3                      ; 57D3   025C
        INCR    R3                              ; 57D4   000B
        SDBD                                    ; 57D5   0001
        ANDI    #$2E07, R4                      ; 57D6   03BC 0007 002E
        ADDI    #$0090, R4                      ; 57D9   02FC 0090
        MVO@    R4,     R3                      ; 57DB   025C
        MVII    #$0020, R0                      ; 57DC   02B8 0020
        SWAP    R0,     1                       ; 57DE   0040
        MVO@    R0,     R2                      ; 57DF   0250
        SUBI    #$0014, R2                      ; 57E0   033A 0014
        SUBI    #$0015, R3                      ; 57E2   033B 0015
        MVI@    R2,     R5                      ; 57E4   0295
        MVO@    R5,     R3                      ; 57E5   025D
        INCR    R3                              ; 57E6   000B
        SUBI    #$0008, R4                      ; 57E7   033C 0008
        MVO@    R4,     R3                      ; 57E9   025C
        MVO@    R0,     R2                      ; 57EA   0250
        MOVR    R2,     R1                      ; 57EB   0091
        SUBI    #$02C8, R2                      ; 57EC   033A 02C8
        MVO     R2,     G_0166                  ; 57EE   0242 0166
        MOVR    R1,     R2                      ; 57F0   008A
        INCR    R1                              ; 57F1   0009
        MVI@    R1,     R5                      ; 57F2   028D
        SDBD                                    ; 57F3   0001
        CMPI    #$2E88, R5                      ; 57F4   037D 0088 002E
        BMI     L_580C                          ; 57F7   020B 0013

        MVO@    R0,     R1                      ; 57F9   0248
        ADDI    #$0014, R1                      ; 57FA   02F9 0014
        MVO@    R0,     R1                      ; 57FC   0248
        DECR    R1                              ; 57FD   0011
        DECR    R2                              ; 57FE   0012
        MVI@    R2,     R0                      ; 57FF   0290
        SDBD                                    ; 5800   0001
        ANDI    #$2E07, R0                      ; 5801   03B8 0007 002E
        ADDI    #$0090, R0                      ; 5804   02F8 0090
        MVO@    R0,     R1                      ; 5806   0248
        SUBI    #$0014, R1                      ; 5807   0339 0014
        SUBI    #$0008, R0                      ; 5809   0338 0008
        MVO@    R0,     R1                      ; 580B   0248
L_580C:
        SDBD                                    ; 580C   0001
        MVII    #$5161, R0                      ; 580D   02B8 0061 0051
        MVO     R0,     G_035D                  ; 5810   0240 035D
        SDBD                                    ; 5812   0001
        MVII    #$5028, R1                      ; 5813   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 5816   0004 0118 0044
        JSR     R5,     L_5953                  ; 5819   0004 0158 0153

        SUBI    #$0008, R1                      ; 581C   0339 0008

        JSR     R5,     .EXEC.839               ; 581E   0004 0118 0039

L_5821:
        PSHR    R5                              ; 5821   0275
        MVII    #$0014, R3                      ; 5822   02BB 0014
        MVI     G_0166, R1                      ; 5824   0281 0166
        MOVR    R1,     R2                      ; 5826   008A
        ADDI    #$02C8, R2                      ; 5827   02FA 02C8
        MVI     G_011F, R0                      ; 5829   0280 011F
        CMPI    #$0010, R0                      ; 582B   0378 0010
        BMI     L_5835                          ; 582D   020B 0006

        MVI     G_0120, R0                      ; 582F   0280 0120
        CMPI    #$0010, R0                      ; 5831   0378 0010
        BPL     L_5528                          ; 5833   0223 030C

L_5835:
        ANDI    #$000C, R0                      ; 5835   03B8 000C
        BEQ     L_583D                          ; 5837   0204 0004

        XORI    #$000C, R0                      ; 5839   03F8 000C
        BNEQ    L_583F                          ; 583B   020C 0002

L_583D:
        INCR    R1                              ; 583D   0009
        INCR    R7                              ; 583E   000F

L_583F:
        DECR    R1                              ; 583F   0011
L_5840:
        MOVR    R1,     R0                      ; 5840   0088
        DECLE   $02F9,  $02C8,  $028D,  $00AC   ; 5841   02F9 02C8 028D 00AC
        DECLE   $0001,  $03BC,  $0000,  $0008   ; 5845   0001 03BC 0000 0008
        DECLE   $0224,  $0322,  $0240,  $0166   ; 5849   0224 0322 0240 0166
        DECLE   $0255,  $00D9,  $028D,  $00DA   ; 584D   0255 00D9 028D 00DA
        DECLE   $0255,  $0001                   ; 5851   0255 0001

        MVII    #$0000, R4                      ; 5853   02BC 0000
        NEGR    R0                              ; 5855   0020
        MOVR    R1,     R2                      ; 5856   008A
        INCR    R2                              ; 5857   000A
        MVI@    R2,     R0                      ; 5858   0290
        SDBD                                    ; 5859   0001
        CMPI    #$2E88, R0                      ; 585A   0378 0088 002E
        BMI     L_5866                          ; 585D   020B 0007

        MVO@    R0,     R1                      ; 585F   0248
        SUBI    #$0015, R2                      ; 5860   033A 0015
        SUBI    #$0008, R0                      ; 5862   0338 0008
        MVO@    R0,     R2                      ; 5864   0250
        INCR    R1                              ; 5865   0009
L_5866:
        MVO@    R4,     R1                      ; 5866   024C
        SUBR    R3,     R1                      ; 5867   0119
        MVO@    R4,     R1                      ; 5868   024C

        JSR     R5,     L_5975                  ; 5869   0004 0158 0175
        JSR     R5,     L_5217                  ; 586C   0004 0150 0217
        JSR     R5,     L_5B9E                  ; 586F   0004 0158 039E

        PSHR    R5                              ; 5872   0275
        NEGR    R0                              ; 5873   0020
        BPL     L_5528                          ; 5874   0223 034D

        JSR     R5,     L_5148                  ; 5876   0004 0150 0148

        MVI     G_0166, R2                      ; 5879   0282 0166
        ADDI    #$02C8, R2                      ; 587B   02FA 02C8
        MVI     G_0168, R1                      ; 587D   0281 0168
        MOVR    R1,     R0                      ; 587F   0088
        ANDI    #$000F, R1                      ; 5880   03B9 000F
        SLR     R0,     2                       ; 5882   0064
        SLR     R0,     2                       ; 5883   0064
        SLL     R1,     2                       ; 5884   004D
        SLL     R1,     1                       ; 5885   0049
        MOVR    R0,     R5                      ; 5886   0085
        ANDI    #$0001, R5                      ; 5887   03BD 0001
        BEQ     L_588D                          ; 5889   0204 0002

        ADDI    #$0002, R1                      ; 588B   02F9 0002
L_588D:
        SDBD                                    ; 588D   0001
        ADDI    #$2E00, R1                      ; 588E   02F9 0000 002E
        MVO@    R1,     R2                      ; 5891   0251
        SDBD                                    ; 5892   0001
        ANDI    #$2E02, R1                      ; 5893   03B9 0002 002E
        ADDI    #$000D, R0                      ; 5896   02F8 000D
        SLL     R0,     2                       ; 5898   004C
        SLL     R0,     1                       ; 5899   0048
        XORR    R0,     R1                      ; 589A   01C1
        ADDI    #$0014, R2                      ; 589B   02FA 0014
        MVO@    R1,     R2                      ; 589D   0251
        INCR    R2                              ; 589E   000A
        MVI@    R2,     R0                      ; 589F   0290
        SDBD                                    ; 58A0   0001
        ANDI    #$0800, R0                      ; 58A1   03B8 0000 0008
        BNEQ    L_58B2                          ; 58A4   020C 000C

        SDBD                                    ; 58A6   0001
        ANDI    #$2E07, R1                      ; 58A7   03B9 0007 002E
        ADDI    #$0090, R1                      ; 58AA   02F9 0090
        MVO@    R1,     R2                      ; 58AC   0251
        SUBI    #$0014, R2                      ; 58AD   033A 0014
        SUBI    #$0008, R1                      ; 58AF   0339 0008
        MVO@    R1,     R2                      ; 58B1   0251
L_58B2:
        SDBD                                    ; 58B2   0001
        MVII    #$5028, R1                      ; 58B3   02B9 0028 0050

        JSR     R5,     X_TIMER_STOP            ; 58B6   0004 0118 0038

        SUBI    #$0008, R1                      ; 58B9   0339 0008

        JSR     R5,     X_TIMER_START           ; 58BB   0004 0118 0044
        JSR     R5,     L_5217                  ; 58BE   0004 0150 0217
        JSR     R5,     L_598D                  ; 58C1   0004 0158 018D
        JSR     R5,     L_5953                  ; 58C4   0004 0158 0153

L_58C7:
        PULR    R7                              ; 58C7   02B7

L_58C8:
        PSHR    R5                              ; 58C8   0275
        MVII    #$02C8, R4                      ; 58C9   02BC 02C8
L_58CB:
        MVI@    R4,     R0                      ; 58CB   02A0
        SWAP    R0,     1                       ; 58CC   0040
        ANDI    #$0008, R0                      ; 58CD   03B8 0008
        BEQ     L_58CB                          ; 58CF   0224 0005

        DECR    R4                              ; 58D1   0014
        MVI     G_016A, R1                      ; 58D2   0281 016A
        MOVR    R1,     R0                      ; 58D4   0088
        SLR     R1,     1                       ; 58D5   0061
        NEGR    R1                              ; 58D6   0021
        ADDI    #$02D1, R1                      ; 58D7   02F9 02D1
        CMPR    R1,     R4                      ; 58D9   014C
        BEQ     L_58C7                          ; 58DA   0224 0014
        BPL     L_5901                          ; 58DC   0203 0023

        MOVR    R1,     R2                      ; 58DE   008A
        MOVR    R4,     R3                      ; 58DF   00A3

        JSR     R5,     L_58F3                  ; 58E0   0004 0158 00F3
        DECLE   $0001                           ; 58E3   0001

        MVII    #$0000, R5                      ; 58E4   02BD 0000
        NEGR    R0                              ; 58E6   0020
        MVO@    R5,     R1                      ; 58E7   024D
        PSHR    R5                              ; 58E8   0275
        ADDI    #$0014, R3                      ; 58E9   02FB 0014
        ADDI    #$0014, R2                      ; 58EB   02FA 0014

        JSR     R5,     L_58F3                  ; 58ED   0004 0158 00F3

        PULR    R5                              ; 58F0   02B5
        MVO@    R5,     R1                      ; 58F1   024D
        PULR    R7                              ; 58F2   02B7

L_58F3:
        PSHR    R3                              ; 58F3   0273
        ADD     G_016A, R3                      ; 58F4   02C3 016A
        MOVR    R3,     R1                      ; 58F6   0099
        DECR    R3                              ; 58F7   0013
L_58F8:
        MVI@    R3,     R4                      ; 58F8   029C
        MVO@    R4,     R1                      ; 58F9   024C
        DECR    R1                              ; 58FA   0011
        DECR    R3                              ; 58FB   0013
        CMPR    R2,     R1                      ; 58FC   0151
        BPL     L_58F8                          ; 58FD   0223 0006

        PULR    R3                              ; 58FF   02B3
        MOVR    R5,     R7                      ; 5900   00AF

L_5901:
        INCR    R0                              ; 5901   0008
        PSHR    R0                              ; 5902   0270
        PSHR    R4                              ; 5903   0274
        PSHR    R1                              ; 5904   0271

        JSR     R5,     .EXEC.730               ; 5905   0004 0114 0330

        PULR    R1                              ; 5908   02B1
        PULR    R4                              ; 5909   02B4
        PULR    R0                              ; 590A   02B0
        ADDI    #$0014, R1                      ; 590B   02F9 0014
        ADDI    #$0014, R4                      ; 590D   02FC 0014

        JSR     R5,     .EXEC.730               ; 590F   0004 0114 0330

        MVI     G_016A, R1                      ; 5912   0281 016A
        SLR     R1,     1                       ; 5914   0061
        NEGR    R1                              ; 5915   0021
        ADDI    #$02D1, R1                      ; 5916   02F9 02D1
        ADD     G_016A, R1                      ; 5918   02C1 016A
        MVII    #$0020, R0                      ; 591A   02B8 0020
        SWAP    R0,     1                       ; 591C   0040
        INCR    R1                              ; 591D   0009
        MVO@    R0,     R1                      ; 591E   0248
        ADDI    #$0014, R1                      ; 591F   02F9 0014
        MVO@    R0,     R1                      ; 5921   0248
        PULR    R7                              ; 5922   02B7

L_5923:
        PSHR    R5                              ; 5923   0275

        JSR     R5,     L_5953                  ; 5924   0004 0158 0153

        SDBD                                    ; 5927   0001
        MVII    #$2000, R5                      ; 5928   02BD 0000 0020
        MVO@    R5,     R2                      ; 592B   0255
        SUBI    #$0014, R2                      ; 592C   033A 0014
        MVO@    R5,     R2                      ; 592E   0255
        INCR    R2                              ; 592F   000A
        MVI@    R2,     R3                      ; 5930   0293
        SDBD                                    ; 5931   0001
        CMPI    #$2E88, R3                      ; 5932   037B 0088 002E
        BMI     L_593D                          ; 5935   020B 0006

        MVO@    R5,     R2                      ; 5937   0255
        ADDI    #$0014, R2                      ; 5938   02FA 0014
        MVO@    R5,     R2                      ; 593A   0255
        SUBI    #$0014, R2                      ; 593B   033A 0014
L_593D:
        DECR    R2                              ; 593D   0012
        SUBI    #$02C8, R2                      ; 593E   033A 02C8
        MVO     R2,     G_0166                  ; 5940   0242 0166
        MVO     R0,     G_016F                  ; 5942   0240 016F
        MVO     R1,     G_0170                  ; 5944   0241 0170

        JSR     R5,     L_5FFF                  ; 5946   0004 015C 03FF
        JSR     R5,     L_6014                  ; 5949   0004 0160 0014
        JSR     R5,     L_5975                  ; 594C   0004 0158 0175
        JSR     R5,     L_52FB                  ; 594F   0004 0150 02FB

        PULR    R7                              ; 5952   02B7

L_5953:
        MVI     G_031D, R3                      ; 5953   0283 031D
        SDBD                                    ; 5955   0001
        XORI    #$1000, R3                      ; 5956   03FB 0000 0010
        MVO     R3,     G_031D                  ; 5959   0243 031D
        MOVR    R5,     R7                      ; 595B   00AF

L_595C:
        PSHR    R5                              ; 595C   0275
L_595D:
        MVII    #$031D, R4                      ; 595D   02BC 031D
        SDBD                                    ; 595F   0001
        MVII    #$5496, R0                      ; 5960   02B8 0096 0054
        INCR    R7                              ; 5963   000F

L_5964:
        PSHR    R5                              ; 5964   0275
L_5965:
        MOVR    R0,     R5                      ; 5965   0085
        MVII    #$0004, R0                      ; 5966   02B8 0004
L_5968:
        SDBD                                    ; 5968   0001
        MVI@    R5,     R1                      ; 5969   02A9
        MVO@    R1,     R4                      ; 596A   0261
        DECR    R0                              ; 596B   0010
        BNEQ    L_5968                          ; 596C   022C 0005

        MVI@    R5,     R0                      ; 596E   02A8
        INCR    R4                              ; 596F   000C
        MVO@    R0,     R4                      ; 5970   0260
        MOVR    R5,     R0                      ; 5971   00A8
        ADDI    #$0002, R4                      ; 5972   02FC 0002
        PULR    R7                              ; 5974   02B7

L_5975:
        PSHR    R5                              ; 5975   0275

        JSR     R5,     L_59A4                  ; 5976   0004 0158 01A4

        SDBD                                    ; 5979   0001
        CMPI    #$2E88, R0                      ; 597A   0378 0088 002E
        BPL     L_59A3                          ; 597D   0203 0024

        INCR    R2                              ; 597F   000A
        SDBD                                    ; 5980   0001
        ANDI    #$2E07, R0                      ; 5981   03B8 0007 002E
        XORI    #$0088, R0                      ; 5984   03F8 0088
        MVO@    R0,     R2                      ; 5986   0250
        ADDI    #$0014, R2                      ; 5987   02FA 0014
        ADDI    #$0008, R0                      ; 5989   02F8 0008
        MVO@    R0,     R2                      ; 598B   0250
        INCR    R7                              ; 598C   000F

L_598D:
        PSHR    R5                              ; 598D   0275

L_598E:
        JSR     R5,     L_59A4                  ; 598E   0004 0158 01A4

        SUBI    #$02C8, R2                      ; 5991   033A 02C8
        SLL     R2,     2                       ; 5993   004E
        SLL     R2,     1                       ; 5994   004A
        SWAP    R2,     1                       ; 5995   0042
        MVO     R2,     G_031F                  ; 5996   0242 031F
        MVI     G_031D, R1                      ; 5998   0281 031D
        MVII    #$0020, R0                      ; 599A   02B8 0020
        SWAP    R0,     1                       ; 599C   0040
        COMR    R0                              ; 599D   0018
        ANDR    R0,     R1                      ; 599E   0181
        COMR    R0                              ; 599F   0018
        XORR    R0,     R1                      ; 59A0   01C1
        MVO     R1,     G_031D                  ; 59A1   0241 031D
L_59A3:
        PULR    R7                              ; 59A3   02B7

L_59A4:
        MVII    #$02DA, R2                      ; 59A4   02BA 02DA
        INCR    R7                              ; 59A6   000F

L_59A7:
        DECR    R2                              ; 59A7   0012
L_59A8:
        CMPI    #$02C8, R2                      ; 59A8   037A 02C8
        BEQ     L_59A3                          ; 59AA   0224 0008

        MVI@    R2,     R0                      ; 59AC   0290
        MOVR    R0,     R1                      ; 59AD   0081
        SWAP    R1,     1                       ; 59AE   0041
        ANDI    #$0008, R1                      ; 59AF   03B9 0008
        BEQ     L_59A7                          ; 59B1   0224 000B
        MOVR    R5,     R7                      ; 59B3   00AF

L_59B4:
        PSHR    R5                              ; 59B4   0275
        MVII    #$0171, R4                      ; 59B5   02BC 0171
        MVII    #$00FF, R1                      ; 59B7   02B9 00FF
        MVII    #$001F, R0                      ; 59B9   02B8 001F
        MVII    #$0004, R5                      ; 59BB   02BD 0004
L_59BD:
        MVO@    R1,     R4                      ; 59BD   0261
        MVO@    R0,     R4                      ; 59BE   0260
        DECR    R5                              ; 59BF   0015
        BNEQ    L_59BD                          ; 59C0   022C 0004

        MVII    #$0028, R0                      ; 59C2   02B8 0028

        JSR     R5,     X_FILL_ZERO             ; 59C4   0004 0114 0338

        MVII    #$0034, R0                      ; 59C7   02B8 0034
        MVO     R0,     G_0169                  ; 59C9   0240 0169
        PULR    R7                              ; 59CB   02B7

L_59CC:
        PSHR    R1                              ; 59CC   0271
        SDBD                                    ; 59CD   0001
        MVI@    R4,     R1                      ; 59CE   02A1
        INCR    R7                              ; 59CF   000F

L_59D0:
        PSHR    R1                              ; 59D0   0271
L_59D1:
        CLRR    R3                              ; 59D1   01DB
L_59D2:
        SARC    R1,     1                       ; 59D2   0079
        ADCR    R3                              ; 59D3   002B
        CLRC                                    ; 59D4   0006
        TSTR    R1                              ; 59D5   0089
        BNEQ    L_59D2                          ; 59D6   022C 0005

        PULR    R1                              ; 59D8   02B1
        MOVR    R5,     R7                      ; 59D9   00AF

L_59DA:
        PSHR    R5                              ; 59DA   0275
        PSHR    R3                              ; 59DB   0273
        PSHR    R4                              ; 59DC   0274
        MVI     G_0169, R0                      ; 59DD   0280 0169
        DECR    R0                              ; 59DF   0010
        MVO     R0,     G_0169                  ; 59E0   0240 0169
        INCR    R0                              ; 59E2   0008

        JSR     R5,     X_RAND2                 ; 59E3   0004 0114 029E

        INCR    R0                              ; 59E6   0008
        MVII    #$0171, R5                      ; 59E7   02BD 0171
        CLRR    R3                              ; 59E9   01DB
L_59EA:
        CLRR    R1                              ; 59EA   01C9
        SDBD                                    ; 59EB   0001
        MVI@    R5,     R2                      ; 59EC   02AA
L_59ED:
        SARC    R2,     1                       ; 59ED   007A
        ADCR    R3                              ; 59EE   002B
        CMPR    R0,     R3                      ; 59EF   0143
        BEQ     L_59F9                          ; 59F0   0204 0007

        INCR    R1                              ; 59F2   0009
        CMPI    #$000D, R1                      ; 59F3   0379 000D
        BEQ     L_59EA                          ; 59F5   0224 000C
        B       L_59ED                          ; 59F7   0220 000B

L_59F9:
        SUBI    #$0002, R5                      ; 59F9   033D 0002
        MOVR    R5,     R2                      ; 59FB   00AA
        SDBD                                    ; 59FC   0001
        MVI@    R5,     R3                      ; 59FD   02AB
        MOVR    R1,     R0                      ; 59FE   0088

        JSR     R5,     X_POW2                  ; 59FF   0004 0114 0345

        XORR    R0,     R3                      ; 5A02   01C3
        MOVR    R2,     R5                      ; 5A03   0095
        MVO@    R3,     R5                      ; 5A04   026B
        SWAP    R3,     1                       ; 5A05   0043
        MVO@    R3,     R5                      ; 5A06   026B
        SUBI    #$0171, R2                      ; 5A07   033A 0171
        SLR     R2,     1                       ; 5A09   0062
        PULR    R4                              ; 5A0A   02B4
        PULR    R3                              ; 5A0B   02B3
L_5A0C:
        PULR    R7                              ; 5A0C   02B7

L_5A0D:
        MVO     R5,     .BTAB.13                ; 5A0D   0245 0213

        JSR     R5,     L_59DA                  ; 5A0F   0004 0158 01DA

        MOVR    R2,     R3                      ; 5A12   0093
        SLL     R3,     2                       ; 5A13   004F
        SLL     R3,     2                       ; 5A14   004F
        ADDR    R1,     R3                      ; 5A15   00CB
        MVO     R3,     G_0164                  ; 5A16   0243 0164
        MVII    #$0205, R5                      ; 5A18   02BD 0205
        MVO@    R0,     R5                      ; 5A1A   0268
        MVO@    R1,     R5                      ; 5A1B   0269
        MVO@    R2,     R5                      ; 5A1C   026A
        MVI     G_0169, R0                      ; 5A1D   0280 0169
        MVO@    R3,     R5                      ; 5A1F   026B
        MVO@    R4,     R5                      ; 5A20   026C
        TSTR    R0                              ; 5A21   0080
        BNEQ    L_5A29                          ; 5A22   020C 0005

        MVII    #$0280, R4                      ; 5A24   02BC 0280

        JSR     R5,     L_5B87                  ; 5A26   0004 0158 0387
L_5A29:
        JSR     R5,     L_5654                  ; 5A29   0004 0154 0254

        MVI     G_0169, R0                      ; 5A2C   0280 0169
        TSTR    R0                              ; 5A2E   0080
        BNEQ    L_5A70                          ; 5A2F   020C 003F

        MVII    #$0008, R0                      ; 5A31   02B8 0008
        MOVR    R0,     R2                      ; 5A33   0082
        MVII    #$0171, R1                      ; 5A34   02B9 0171
        MVII    #$0179, R4                      ; 5A36   02BC 0179

        JSR     R5,     .EXEC.730               ; 5A38   0004 0114 0330

        SUBR    R2,     R4                      ; 5A3B   0114
        MOVR    R2,     R0                      ; 5A3C   0090

        JSR     R5,     X_FILL_ZERO             ; 5A3D   0004 0114 0338

        MVI     G_016F, R0                      ; 5A40   0280 016F

        JSR     R5,     X_POW2                  ; 5A42   0004 0114 0345

        MVII    #$0171, R1                      ; 5A45   02B9 0171
        MOVR    R1,     R4                      ; 5A47   008C
        MVII    #$0179, R5                      ; 5A48   02BD 0179
        MVI     G_0170, R2                      ; 5A4A   0282 0170
        SLL     R2,     1                       ; 5A4C   004A
        ADDR    R2,     R4                      ; 5A4D   00D4
        ADDR    R2,     R5                      ; 5A4E   00D5
        MVO@    R0,     R5                      ; 5A4F   0268
        SWAP    R0,     1                       ; 5A50   0040
        MVO@    R0,     R5                      ; 5A51   0268
        SWAP    R0,     1                       ; 5A52   0040
        MOVR    R4,     R5                      ; 5A53   00A5
        SDBD                                    ; 5A54   0001
        XOR@    R4,     R0                      ; 5A55   03E0
        MVO@    R0,     R5                      ; 5A56   0268
        SWAP    R0,     1                       ; 5A57   0040
        MVO@    R0,     R5                      ; 5A58   0268
        CLRR    R0                              ; 5A59   01C0
        MVII    #$0171, R4                      ; 5A5A   02BC 0171

L_5A5C:
        JSR     R5,     L_59CC                  ; 5A5C   0004 0158 01CC

        ADDR    R3,     R0                      ; 5A5F   00D8
        CMPI    #$0179, R4                      ; 5A60   037C 0179
        BMI     L_5A5C                          ; 5A62   022B 0007

        MVO     R0,     G_0169                  ; 5A64   0240 0169

        JSR     R5,     L_67B9                  ; 5A66   0004 0164 03B9
        JSR     R5,     L_5B1E                  ; 5A69   0004 0158 031E

        MVII    #$00FF, R0                      ; 5A6C   02B8 00FF
        MVO     R0,     G_01D6                  ; 5A6E   0240 01D6
L_5A70:
        MVII    #$0205, R5                      ; 5A70   02BD 0205
        MVI@    R5,     R0                      ; 5A72   02A8
        MVI@    R5,     R1                      ; 5A73   02A9
        MVI@    R5,     R2                      ; 5A74   02AA
        MVI@    R5,     R3                      ; 5A75   02AB
        MVI@    R5,     R4                      ; 5A76   02AC
        PSHR    R1                              ; 5A77   0271

        JSR     R5,     L_6008                  ; 5A78   0004 0160 0008

        PULR    R1                              ; 5A7B   02B1
        MVI     .BTAB.13,R7                     ; 5A7C   0287 0213

L_5A7E:
        PSHR    R5                              ; 5A7E   0275
        MVI     G_015F, R0                      ; 5A7F   0280 015F
        PSHR    R0                              ; 5A81   0270
        MVII    #$0181, R4                      ; 5A82   02BC 0181
L_5A84:
        MVI     G_016E, R3                      ; 5A84   0283 016E

L_5A86:
        JSR     R5,     L_59DA                  ; 5A86   0004 0158 01DA

        MOVR    R4,     R5                      ; 5A89   00A5
        SLL     R2,     1                       ; 5A8A   004A
        ADDR    R2,     R5                      ; 5A8B   00D5
        SDBD                                    ; 5A8C   0001
        XOR@    R5,     R0                      ; 5A8D   03E8
        SUBI    #$0002, R5                      ; 5A8E   033D 0002
        MVO@    R0,     R5                      ; 5A90   0268
        SWAP    R0,     1                       ; 5A91   0040
        MVO@    R0,     R5                      ; 5A92   0268
        DECR    R3                              ; 5A93   0013
        BNEQ    L_5A86                          ; 5A94   022C 000F

        PULR    R0                              ; 5A96   02B0
        DECR    R0                              ; 5A97   0010
        BEQ     L_5A0C                          ; 5A98   0224 008D

        PSHR    R0                              ; 5A9A   0270
        ADDI    #$0008, R4                      ; 5A9B   02FC 0008
        B       L_5A84                          ; 5A9D   0220 001A

L_5A9F:
        PSHR    R5                              ; 5A9F   0275

        JSR     R5,     L_5207                  ; 5AA0   0004 0150 0207

        MVI     G_016A, R3                      ; 5AA3   0283 016A
        SLR     R3,     1                       ; 5AA5   0063
        NEGR    R3                              ; 5AA6   0023
        ADDI    #$02D1, R3                      ; 5AA7   02FB 02D1
        MVII    #$0181, R4                      ; 5AA9   02BC 0181
        INCR    R7                              ; 5AAB   000F

L_5AAC:
        PSHR    R5                              ; 5AAC   0275
L_5AAD:
        CLRR    R0                              ; 5AAD   01C0
        PSHR    R3                              ; 5AAE   0273
L_5AAF:
        CLRR    R1                              ; 5AAF   01C9
        MVI     G_015E, R5                      ; 5AB0   0285 015E
        CMPI    #$0004, R5                      ; 5AB2   037D 0004
        BNEQ    L_5AB7                          ; 5AB4   020C 0001

        INCR    R1                              ; 5AB6   0009
L_5AB7:
        SDBD                                    ; 5AB7   0001
        MVI@    R4,     R2                      ; 5AB8   02A2

        JSR     R5,     L_5ADD                  ; 5AB9   0004 0158 02DD

        CMPI    #$0004, R0                      ; 5ABC   0378 0004
        BNEQ    L_5AAF                          ; 5ABE   022C 0010

        MVO     R3,     G_033C                  ; 5AC0   0243 033C
        B       L_5AC6                          ; 5AC2   0200 0002

L_5AC4:
        PSHR    R5                              ; 5AC4   0275
        PSHR    R3                              ; 5AC5   0273
L_5AC6:
        MOVR    R3,     R2                      ; 5AC6   009A
        DECR    R2                              ; 5AC7   0012
        MVI@    R2,     R2                      ; 5AC8   0292
        SDBD                                    ; 5AC9   0001
        CMPI    #$2E00, R2                      ; 5ACA   037A 0000 002E
        BMI     L_5ADB                          ; 5ACD   020B 000C

        SDBD                                    ; 5ACF   0001
        ANDI    #$2E07, R2                      ; 5AD0   03BA 0007 002E
        ADDI    #$0088, R2                      ; 5AD3   02FA 0088
        MVO@    R2,     R3                      ; 5AD5   025A
        ADDI    #$0014, R3                      ; 5AD6   02FB 0014
        ADDI    #$0008, R2                      ; 5AD8   02FA 0008
        MVO@    R2,     R3                      ; 5ADA   025A
L_5ADB:
        PULR    R3                              ; 5ADB   02B3
        PULR    R7                              ; 5ADC   02B7

L_5ADD:
        PSHR    R5                              ; 5ADD   0275
L_5ADE:
        SARC    R2,     1                       ; 5ADE   007A
        BC      L_5AE7                          ; 5ADF   0201 0006

L_5AE1:
        INCR    R1                              ; 5AE1   0009
        TSTR    R2                              ; 5AE2   0092
        BNEQ    L_5ADE                          ; 5AE3   022C 0006

        INCR    R0                              ; 5AE5   0008
        PULR    R7                              ; 5AE6   02B7

L_5AE7:
        PSHR    R0                              ; 5AE7   0270
        PSHR    R1                              ; 5AE8   0271
        CMPI    #$000D, R1                      ; 5AE9   0379 000D
        BNEQ    L_5AEE                          ; 5AEB   020C 0001

        CLRR    R1                              ; 5AED   01C9

L_5AEE:
        JSR     R5,     L_5BD5                  ; 5AEE   0004 0158 03D5

        MVO@    R1,     R3                      ; 5AF1   0259
        ADDI    #$0014, R3                      ; 5AF2   02FB 0014

        JSR     R5,     L_5BC7                  ; 5AF4   0004 0158 03C7

        MVO@    R1,     R3                      ; 5AF7   0259
        SUBI    #$0013, R3                      ; 5AF8   033B 0013
        PULR    R1                              ; 5AFA   02B1
        PULR    R0                              ; 5AFB   02B0
        B       L_5AE1                          ; 5AFC   0220 001C

L_5AFE:
        PSHR    R5                              ; 5AFE   0275
        CLRR    R0                              ; 5AFF   01C0
L_5B00:
        CLRR    R1                              ; 5B00   01C9
        MVI@    R4,     R2                      ; 5B01   02A2

        JSR     R5,     L_5ADD                  ; 5B02   0004 0158 02DD

        CMPI    #$0004, R0                      ; 5B05   0378 0004
        BNEQ    L_5B00                          ; 5B07   022C 0008

        MVO     R3,     G_033C                  ; 5B09   0243 033C
        PULR    R7                              ; 5B0B   02B7

L_5B0C:
        PSHR    R5                              ; 5B0C   0275
        MVI     G_015F, R0                      ; 5B0D   0280 015F
        MVII    #$0181, R4                      ; 5B0F   02BC 0181
        MVII    #$0228, R3                      ; 5B11   02BB 0228
L_5B13:
        PSHR    R0                              ; 5B13   0270

        JSR     R5,     L_5AAC                  ; 5B14   0004 0158 02AC

        PULR    R0                              ; 5B17   02B0
        ADDI    #$0028, R3                      ; 5B18   02FB 0028
        DECR    R0                              ; 5B1A   0010
        BNEQ    L_5B13                          ; 5B1B   022C 0009
        PULR    R7                              ; 5B1D   02B7

L_5B1E:
        MVII    #$0280, R4                      ; 5B1E   02BC 0280
        MVII    #$0008, R0                      ; 5B20   02B8 0008
        SDBD                                    ; 5B22   0001
        MVII    #$2AA4, R3                      ; 5B23   02BB 00A4 002A
        MVO@    R3,     R4                      ; 5B26   0263
        ADDR    R0,     R3                      ; 5B27   00C3
        ADDR    R0,     R3                      ; 5B28   00C3
        MVO@    R3,     R4                      ; 5B29   0263
        ADDI    #$0012, R4                      ; 5B2A   02FC 0012
        SUBR    R0,     R3                      ; 5B2C   0103
        MVO@    R3,     R4                      ; 5B2D   0263
        ADDR    R0,     R3                      ; 5B2E   00C3
        ADDR    R0,     R3                      ; 5B2F   00C3
        MVO@    R3,     R4                      ; 5B30   0263
        MOVR    R5,     R7                      ; 5B31   00AF

L_5B32:
        PSHR    R5                              ; 5B32   0275

        JSR     R5,     L_5B1E                  ; 5B33   0004 0158 031E
L_5B36:
        JSR     R5,     L_59DA                  ; 5B36   0004 0158 01DA

        MVI     G_015E, R5                      ; 5B39   0285 015E
        DECR    R5                              ; 5B3B   0015
        BNEQ    L_5B42                          ; 5B3C   020C 0004

        CMPI    #$0007, R1                      ; 5B3E   0379 0007
        BEQ     L_5B36                          ; 5B40   0224 000B

L_5B42:
        MVO     R1,     G_016F                  ; 5B42   0241 016F
        MVO     R2,     G_0170                  ; 5B44   0242 0170
        SLL     R2,     1                       ; 5B46   004A
        MOVR    R2,     R4                      ; 5B47   0094
        SLR     R2,     1                       ; 5B48   0062
        ADDI    #$0179, R4                      ; 5B49   02FC 0179
        MVO@    R0,     R4                      ; 5B4B   0260
        SWAP    R0,     1                       ; 5B4C   0040
        MVO@    R0,     R4                      ; 5B4D   0260
L_5B4E:
        MVII    #$0282, R4                      ; 5B4E   02BC 0282
L_5B50:
        MOVR    R2,     R0                      ; 5B50   0090

        JSR     R5,     L_5BD5                  ; 5B51   0004 0158 03D5

        MVO@    R1,     R4                      ; 5B54   0261
        SDBD                                    ; 5B55   0001
        ANDI    #$2E07, R1                      ; 5B56   03B9 0007 002E
        ADDI    #$0090, R1                      ; 5B59   02F9 0090
        ADDI    #$0014, R4                      ; 5B5B   02FC 0014
        MVO@    R1,     R4                      ; 5B5D   0261

        JSR     R5,     L_5BC7                  ; 5B5E   0004 0158 03C7

        SUBI    #$0002, R4                      ; 5B61   033C 0002
        MVO@    R1,     R4                      ; 5B63   0261
        SDBD                                    ; 5B64   0001
        ANDI    #$2E07, R1                      ; 5B65   03B9 0007 002E
        ADDI    #$0088, R1                      ; 5B68   02F9 0088
        SUBI    #$0014, R4                      ; 5B6A   033C 0014
        MVO@    R1,     R4                      ; 5B6C   0261
        PULR    R7                              ; 5B6D   02B7

L_5B6E:
        PSHR    R5                              ; 5B6E   0275
        MVII    #$0022, R1                      ; 5B6F   02B9 0022
        SWAP    R1,     1                       ; 5B71   0041
        MVO     R1,     .BTAB.84                ; 5B72   0241 0284
        MVI     G_016F, R1                      ; 5B74   0281 016F
        MVI     G_0170, R2                      ; 5B76   0282 0170
        B       L_5B4E                          ; 5B78   0220 002B

L_5B7A:
        PSHR    R5                              ; 5B7A   0275
        MVII    #$0282, R4                      ; 5B7B   02BC 0282
        MVI     G_01D6, R1                      ; 5B7D   0281 01D6
        CMPI    #$00FF, R1                      ; 5B7F   0379 00FF
        BNEQ    L_5B96                          ; 5B81   020C 0013

        JSR     R5,     L_5B87                  ; 5B83   0004 0158 0387

        PULR    R7                              ; 5B86   02B7

L_5B87:
        MVII    #$0022, R1                      ; 5B87   02B9 0022
        SWAP    R1,     1                       ; 5B89   0041
        MVO@    R1,     R4                      ; 5B8A   0261
        MVO@    R1,     R4                      ; 5B8B   0261
        ADDI    #$0012, R4                      ; 5B8C   02FC 0012
        MVO@    R1,     R4                      ; 5B8E   0261
        MVO@    R1,     R4                      ; 5B8F   0261
        MOVR    R5,     R7                      ; 5B90   00AF

L_5B91:
        PSHR    R5                              ; 5B91   0275
        MVII    #$02A9, R4                      ; 5B92   02BC 02A9
        MVI     G_0164, R1                      ; 5B94   0281 0164
L_5B96:
        MOVR    R1,     R2                      ; 5B96   008A
        ANDI    #$000F, R1                      ; 5B97   03B9 000F
        SLR     R2,     2                       ; 5B99   0066
        SLR     R2,     2                       ; 5B9A   0066
        B       L_5B50                          ; 5B9B   0220 004C

        PSHR    R5                              ; 5B9D   0275
L_5B9E:
        MVI     G_0166, R4                      ; 5B9E   0284 0166
        ADDI    #$02A0, R4                      ; 5BA0   02FC 02A0
        MVI     G_0168, R1                      ; 5BA2   0281 0168
        CMPI    #$02B3, R4                      ; 5BA4   037C 02B3
        BNEQ    L_5B96                          ; 5BA6   022C 0011

        MOVR    R1,     R2                      ; 5BA8   008A
        ANDI    #$000F, R1                      ; 5BA9   03B9 000F
        SLR     R2,     2                       ; 5BAB   0066
        SLR     R2,     2                       ; 5BAC   0066
        SLL     R1,     2                       ; 5BAD   004D
        SLL     R1,     1                       ; 5BAE   0049
        CMPI    #$0002, R2                      ; 5BAF   037A 0002
        BMI     L_5BB5                          ; 5BB1   020B 0002

        ADDI    #$0002, R1                      ; 5BB3   02F9 0002
L_5BB5:
        SDBD                                    ; 5BB5   0001
        ADDI    #$2E00, R1                      ; 5BB6   02F9 0000 002E
        MVO@    R1,     R4                      ; 5BB9   0261
        ADDI    #$0013, R4                      ; 5BBA   02FC 0013
        SDBD                                    ; 5BBC   0001
        ANDI    #$2E07, R1                      ; 5BBD   03B9 0007 002E
        ADDI    #$000D, R2                      ; 5BC0   02FA 000D
        SLL     R2,     2                       ; 5BC2   004E
        SLL     R2,     1                       ; 5BC3   004A
        ADDR    R1,     R2                      ; 5BC4   00CA
        MVO@    R2,     R4                      ; 5BC5   0262
        PULR    R7                              ; 5BC6   02B7

L_5BC7:
        MOVR    R0,     R1                      ; 5BC7   0081
        ADDR    R7,     R1                      ; 5BC8   00F9
        ADDI    #$0008, R1                      ; 5BC9   02F9 0008
        MVI@    R1,     R1                      ; 5BCB   0289
        SDBD                                    ; 5BCC   0001
        ADDI    #$2E00, R1                      ; 5BCD   02F9 0000 002E
        MOVR    R5,     R7                      ; 5BD0   00AF

        SAR     R0,     1                       ; 5BD1   0068
        RRC     R2,     1                       ; 5BD2   0072
        SARC    R0,     1                       ; 5BD3   0078
        MOVR    R0,     R2                      ; 5BD4   0082
L_5BD5:
        SLL     R1,     2                       ; 5BD5   004D
        SLL     R1,     1                       ; 5BD6   0049
        PSHR    R0                              ; 5BD7   0270
        ANDI    #$0001, R0                      ; 5BD8   03B8 0001
        PULR    R0                              ; 5BDA   02B0
        BEQ     L_5BDF                          ; 5BDB   0204 0002

        ADDI    #$0002, R1                      ; 5BDD   02F9 0002
L_5BDF:
        SDBD                                    ; 5BDF   0001
        ADDI    #$2E00, R1                      ; 5BE0   02F9 0000 002E
        MOVR    R5,     R7                      ; 5BE3   00AF

L_5BE4:
        PSHR    R5                              ; 5BE4   0275
        MOVR    R7,     R5                      ; 5BE5   00BD
        ADDI    #$000D, R5                      ; 5BE6   02FD 000D
        ADD     G_0165, R5                      ; 5BE8   02C5 0165
        MVI@    R5,     R4                      ; 5BEA   02AC
        INCR    R1                              ; 5BEB   0009
        CMPI    #$000D, R1                      ; 5BEC   0379 000D
        BNEQ    L_5B50                          ; 5BEE   022C 009F

        CLRR    R1                              ; 5BF0   01C9
        B       L_5B50                          ; 5BF1   0220 00A2

        DECLE   $02A9,  $027E                   ; 5BF3   02A9 027E

        MVO@    R5,     R5                      ; 5BF5   026D
        MVI     .BTAB.75,R4                     ; 5BF6   0284 0275
        MVI     G_015F, R0                      ; 5BF8   0280 015F
        SDBD                                    ; 5BFA   0001
        MVII    #$5BF3, R5                      ; 5BFB   02BD 00F3 005B
L_5BFE:
        MVI@    R5,     R4                      ; 5BFE   02AC
        PSHR    R5                              ; 5BFF   0275

        JSR     R5,     L_5B87                  ; 5C00   0004 0158 0387

        PULR    R5                              ; 5C03   02B5
        DECR    R0                              ; 5C04   0010
        BNEQ    L_5BFE                          ; 5C05   022C 0008
        PULR    R7                              ; 5C07   02B7

        MVI     G_015F, R1                      ; 5C08   0281 015F
        MVII    #$0005, R0                      ; 5C0A   02B8 0005
        CMPI    #$0002, R1                      ; 5C0C   0379 0002
        BNEQ    L_5C12                          ; 5C0E   020C 0002

        ADDI    #$0002, R0                      ; 5C10   02F8 0002
L_5C12:
        MVO     R0,     G_016E                  ; 5C12   0240 016E
        MVII    #$016A, R4                      ; 5C14   02BC 016A
        MVO@    R0,     R4                      ; 5C16   0260
        MVO@    R0,     R4                      ; 5C17   0260
        MVO@    R0,     R4                      ; 5C18   0260
        MVO@    R0,     R4                      ; 5C19   0260

        JSR     R5,     L_59B4                  ; 5C1A   0004 0158 01B4
        JSR     R5,     L_5A7E                  ; 5C1D   0004 0158 027E
        JSR     R5,     L_67B9                  ; 5C20   0004 0164 03B9
        JSR     R5,     L_6448                  ; 5C23   0004 0164 0048
        JSR     R5,     L_5D30                  ; 5C26   0004 015C 0130
        JSR     R5,     L_5A9F                  ; 5C29   0004 0158 029F
        JSR     R5,     L_5B32                  ; 5C2C   0004 0158 0332
        JSR     R5,     L_5D5B                  ; 5C2F   0004 015C 015B
        JSR     R5,     L_595C                  ; 5C32   0004 0158 015C

L_5C35:
        MVI     G_0165, R0                      ; 5C35   0280 0165
        INCR    R0                              ; 5C37   0008
        CMP     G_015F, R0                      ; 5C38   0340 015F
        BMI     L_5C43                          ; 5C3A   020B 0007

        JSR     R5,     L_5D54                  ; 5C3C   0004 015C 0154
        JSR     R5,     L_67F4                  ; 5C3F   0004 0164 03F4

        CLRR    R0                              ; 5C42   01C0
L_5C43:
        MVO     R0,     G_0165                  ; 5C43   0240 0165
L_5C45:
        PULR    R7                              ; 5C45   02B7

L_5C46:
        PSHR    R5                              ; 5C46   0275

        JSR     R5,     L_5D54                  ; 5C47   0004 015C 0154

        MVI     G_0170, R2                      ; 5C4A   0282 0170

        JSR     R5,     L_66A8                  ; 5C4C   0004 0164 02A8
        JSR     R5,     L_59CC                  ; 5C4F   0004 0158 01CC

        MVO     R3,     G_01A1                  ; 5C52   0243 01A1
        MVI     G_016F, R0                      ; 5C54   0280 016F

        JSR     R5,     X_POW2                  ; 5C56   0004 0114 0345
        JSR     R5,     L_66A7                  ; 5C59   0004 0164 02A7

        CLRR    R1                              ; 5C5C   01C9
L_5C5D:
        SDBD                                    ; 5C5D   0001
        MVI@    R4,     R2                      ; 5C5E   02A2
        ANDR    R0,     R2                      ; 5C5F   0182
        BNEQ    L_5CF8                          ; 5C60   020C 0096

L_5C62:
        INCR    R1                              ; 5C62   0009
        CMPI    #$0004, R1                      ; 5C63   0379 0004
        BNEQ    L_5C5D                          ; 5C65   022C 0009

        MVI     G_0170, R2                      ; 5C67   0282 0170

        JSR     R5,     L_66A8                  ; 5C69   0004 0164 02A8

        SDBD                                    ; 5C6C   0001
        MVI@    R4,     R1                      ; 5C6D   02A1
        TSTR    R1                              ; 5C6E   0089
        BEQ     L_5CBA                          ; 5C6F   0204 0049

        CLRR    R0                              ; 5C71   01C0
L_5C72:
        SARC    R1,     1                       ; 5C72   0079
        BC      L_5C78                          ; 5C73   0201 0003

L_5C75:
        INCR    R0                              ; 5C75   0008
        B       L_5C72                          ; 5C76   0220 0005

L_5C78:
        CMPI    #$0007, R0                      ; 5C78   0378 0007
        BEQ     L_5C8B                          ; 5C7A   0204 000F

L_5C7C:
        JSR     R5,     L_5D68                  ; 5C7C   0004 015C 0168
        JSR     R5,     .EXEC.A61               ; 5C7F   0004 0118 0261

        INCR    R2                              ; 5C82   000A

        JSR     R5,     L_568D                  ; 5C83   0004 0154 028D
L_5C86:
        JSR     R5,     L_5D5B                  ; 5C86   0004 015C 015B

        B       L_5C35                          ; 5C89   0220 0055

L_5C8B:
        TSTR    R1                              ; 5C8B   0089
        BNEQ    L_5C75                          ; 5C8C   022C 0018

L_5C8E:
        JSR     R5,     L_5D68                  ; 5C8E   0004 015C 0168
        JSR     R5,     .EXEC.A61               ; 5C91   0004 0118 0261

        INCR    R2                              ; 5C94   000A

        JSR     R5,     L_568D                  ; 5C95   0004 0154 028D
        JSR     R5,     L_66A7                  ; 5C98   0004 0164 02A7

        CLRR    R0                              ; 5C9B   01C0
        MVO     R0,     G_0170                  ; 5C9C   0240 0170

        JSR     R5,     L_59CC                  ; 5C9E   0004 0158 01CC

L_5CA1:
        MOVR    R3,     R1                      ; 5CA1   0099
L_5CA2:
        INCR    R0                              ; 5CA2   0008
        CMPI    #$0004, R0                      ; 5CA3   0378 0004
        BEQ     L_5CB1                          ; 5CA5   0204 000A

        JSR     R5,     L_59CC                  ; 5CA7   0004 0158 01CC

        CMPR    R1,     R3                      ; 5CAA   014B
        BMI     L_5CA2                          ; 5CAB   022B 000A

        MVO     R0,     G_0170                  ; 5CAD   0240 0170
        B       L_5CA1                          ; 5CAF   0220 000F

L_5CB1:
        MVI     G_0170, R0                      ; 5CB1   0280 0170

        JSR     R5,     L_5BC7                  ; 5CB3   0004 0158 03C7

        MVO     R1,     .BTAB.84                ; 5CB6   0241 0284
        B       L_5C86                          ; 5CB8   0220 0033

L_5CBA:
        JSR     R5,     L_66A7                  ; 5CBA   0004 0164 02A7

        CLRR    R0                              ; 5CBD   01C0
        INCR    R7                              ; 5CBE   000F

L_5CBF:
        INCR    R0                              ; 5CBF   0008
L_5CC0:
        CMPI    #$0004, R0                      ; 5CC0   0378 0004
        BEQ     L_5CD0                          ; 5CC2   0204 000C

        SDBD                                    ; 5CC4   0001
        MVI@    R4,     R3                      ; 5CC5   02A3
        ANDI    #$0080, R3                      ; 5CC6   03BB 0080
        BEQ     L_5CBF                          ; 5CC8   0224 000A

        MVO     R0,     G_0170                  ; 5CCA   0240 0170
        MVII    #$0007, R0                      ; 5CCC   02B8 0007
        B       L_5C8E                          ; 5CCE   0220 0041

L_5CD0:
        MVII    #$016A, R1                      ; 5CD0   02B9 016A
        ADD     G_0165, R1                      ; 5CD2   02C1 0165
        MVI@    R1,     R0                      ; 5CD4   0288
        CMPI    #$000F, R0                      ; 5CD5   0378 000F
        BMI     L_5CDE                          ; 5CD7   020B 0005

        JSR     R5,     X_PLAY_RAZZ2            ; 5CD9   0004 011C 02BD

        B       L_5C86                          ; 5CDC   0220 0057

L_5CDE:
        JSR     R5,     L_5A0D                  ; 5CDE   0004 0158 020D

        CMP     G_016F, R1                      ; 5CE1   0341 016F
        BEQ     L_5CED                          ; 5CE3   0204 0008

        CMP     G_0170, R2                      ; 5CE5   0342 0170
        BEQ     L_5CED                          ; 5CE7   0204 0004

        CMPI    #$0007, R1                      ; 5CE9   0379 0007
        BNEQ    L_5CD0                          ; 5CEB   022C 001C

L_5CED:
        MVO     R1,     G_016F                  ; 5CED   0241 016F
        MVO     R2,     G_0170                  ; 5CEF   0242 0170
        MOVR    R1,     R0                      ; 5CF1   0088
L_5CF2:
        CMPI    #$0007, R0                      ; 5CF2   0378 0007
        BNEQ    L_5C7C                          ; 5CF4   022C 0079
        B       L_5C8E                          ; 5CF6   0220 0069

L_5CF8:
        MVI     G_016F, R5                      ; 5CF8   0285 016F
        CMPI    #$0007, R5                      ; 5CFA   037D 0007
        BEQ     L_5C62                          ; 5CFC   0224 009B

        SUBI    #$0002, R4                      ; 5CFE   033C 0002

        JSR     R5,     L_59CC                  ; 5D00   0004 0158 01CC

        CMP     G_01A1, R3                      ; 5D03   0343 01A1
        BMI     L_5C62                          ; 5D05   022B 00A4

        MVO     R1,     G_0170                  ; 5D07   0241 0170
        MVI     G_016F, R0                      ; 5D09   0280 016F
        B       L_5CF2                          ; 5D0B   0220 001A

L_5D0D:
        JSR     R5,     L_5D54                  ; 5D0D   0004 015C 0154
        JSR     R5,     L_52FB                  ; 5D10   0004 0150 02FB
        JSR     R5,     .EXEC.A61               ; 5D13   0004 0118 0261

        COMR    R1                              ; 5D16   0019

        JSR     R5,     L_66A7                  ; 5D17   0004 0164 02A7

        MVII    #$0008, R0                      ; 5D1A   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; 5D1C   0004 0114 0338

        J       L_66B2                          ; 5D1F   0004 0364 02B2

L_5D22:
        PSHR    R5                              ; 5D22   0275

L_5D23:
        JSR     R5,     L_5D62                  ; 5D23   0004 015C 0162

        DECR    R0                              ; 5D26   0010
        B       L_5D2E                          ; 5D27   0200 0005

L_5D29:
        PSHR    R5                              ; 5D29   0275

        JSR     R5,     L_5D62                  ; 5D2A   0004 015C 0162

        INCR    R0                              ; 5D2D   0008
L_5D2E:
        MVO@    R0,     R1                      ; 5D2E   0248
        INCR    R7                              ; 5D2F   000F

L_5D30:
        PSHR    R5                              ; 5D30   0275
L_5D31:
        MVI     G_015E, R5                      ; 5D31   0285 015E
        DECR    R5                              ; 5D33   0015
        BNEQ    L_5C45                          ; 5D34   022C 00F0

        MVII    #$016B, R2                      ; 5D36   02BA 016B
        MVII    #$0002, R1                      ; 5D38   02B9 0002
        SDBD                                    ; 5D3A   0001
        MVII    #$2407, R3                      ; 5D3B   02BB 0007 0024
L_5D3E:
        MOVR    R2,     R5                      ; 5D3E   0095
        MVI@    R2,     R0                      ; 5D3F   0290
        SDBD                                    ; 5D40   0001
        ADDI    #$5BE6, R5                      ; 5D41   02FD 00E6 005B
        MVI@    R5,     R4                      ; 5D44   02AC

        JSR     R5,     X_PRNUM_RGT             ; 5D45   0004 0118 00C5

        INCR    R2                              ; 5D48   000A
        MVI     G_015F, R5                      ; 5D49   0285 015F
        ADDI    #$016A, R5                      ; 5D4B   02FD 016A
        CMPR    R5,     R2                      ; 5D4D   016A
        BMI     L_5D3E                          ; 5D4E   022B 0011
        PULR    R7                              ; 5D50   02B7

        DECLE   $022B,  $0233,  $0238           ; 5D51   022B 0233 0238
L_5D54:
        SDBD                                    ; 5D54   0001
        MVII    #$5024, R1                      ; 5D55   02B9 0024 0050
        J       X_TIMER_STOP                    ; 5D58   0004 0318 0038

L_5D5B:
        SDBD                                    ; 5D5B   0001
        MVII    #$5024, R1                      ; 5D5C   02B9 0024 0050
        J       X_TIMER_START                   ; 5D5F   0004 0318 0044

L_5D62:
        MVII    #$016A, R1                      ; 5D62   02B9 016A
        ADD     G_0165, R1                      ; 5D64   02C1 0165
        MVI@    R1,     R0                      ; 5D66   0288
        MOVR    R5,     R7                      ; 5D67   00AF

L_5D68:
        PSHR    R5                              ; 5D68   0275
        MVO     R0,     G_016F                  ; 5D69   0240 016F

        JSR     R5,     L_6014                  ; 5D6B   0004 0160 0014
        JSR     R5,     L_6000                  ; 5D6E   0004 0160 0000

        MVI     G_015F, R1                      ; 5D71   0281 015F
        MVII    #$0007, R0                      ; 5D73   02B8 0007
        CMPI    #$0002, R1                      ; 5D75   0379 0002
        BNEQ    L_5D7B                          ; 5D77   020C 0002

        MVII    #$000A, R0                      ; 5D79   02B8 000A
L_5D7B:
        MVO     R0,     G_016E                  ; 5D7B   0240 016E
        MVO     R0,     G_016A                  ; 5D7D   0240 016A

        JSR     R5,     L_59B4                  ; 5D7F   0004 0158 01B4
        JSR     R5,     L_5A7E                  ; 5D82   0004 0158 027E
        JSR     R5,     L_6448                  ; 5D85   0004 0164 0048
        JSR     R5,     L_67B9                  ; 5D88   0004 0164 03B9
        JSR     R5,     L_5A9F                  ; 5D8B   0004 0158 029F
        JSR     R5,     L_5B32                  ; 5D8E   0004 0158 0332

        MVII    #$00FF, R0                      ; 5D91   02B8 00FF
        MVO     R0,     G_01D6                  ; 5D93   0240 01D6

        JSR     R5,     L_595C                  ; 5D95   0004 0158 015C
L_5D98:
        JSR     R5,     .EXEC.A61               ; 5D98   0004 0118 0261

        INCR    R2                              ; 5D9B   000A
        MVI     G_0165, R0                      ; 5D9C   0280 0165
        INCR    R0                              ; 5D9E   0008
        CMP     G_015F, R0                      ; 5D9F   0340 015F
        BMI     L_5DA9                          ; 5DA1   020B 0006

        JSR     R5,     L_67F4                  ; 5DA3   0004 0164 03F4

        CLRR    R0                              ; 5DA6   01C0
        MVO     R0,     G_01D7                  ; 5DA7   0240 01D7
L_5DA9:
        MVO     R0,     G_0165                  ; 5DA9   0240 0165
        BNEQ    L_5DAE                          ; 5DAB   020C 0001
        PULR    R7                              ; 5DAD   02B7

L_5DAE:
        JSR     R5,     L_5FFF                  ; 5DAE   0004 015C 03FF
        JSR     R5,     L_5F2D                  ; 5DB1   0004 015C 032D
        JSR     R5,     L_5E17                  ; 5DB4   0004 015C 0217

        MVII    #$000D, R0                      ; 5DB7   02B8 000D
        MVI     G_0170, R1                      ; 5DB9   0281 0170

        JSR     R5,     X_MPY                   ; 5DBB   0004 011C 01DC

        ADD     G_016F, R2                      ; 5DBE   02C2 016F
        ADDI    #$01A2, R2                      ; 5DC0   02FA 01A2
        MVI@    R2,     R0                      ; 5DC2   0290
        CMPR    R3,     R0                      ; 5DC3   0158
        BEQ     L_5DCE                          ; 5DC4   0204 0008

L_5DC6:
        JSR     R5,     L_5671                  ; 5DC6   0004 0154 0271
        JSR     R5,     L_6014                  ; 5DC9   0004 0160 0014

        B       L_5DE9                          ; 5DCC   0200 001B

L_5DCE:
        CMPI    #$0003, R3                      ; 5DCE   037B 0003
        BMI     L_5DDD                          ; 5DD0   020B 000B

        DECR    R1                              ; 5DD2   0011
        BEQ     L_5DDD                          ; 5DD3   0204 0008

        MVII    #$0003, R0                      ; 5DD5   02B8 0003

        JSR     R5,     X_RAND2                 ; 5DD7   0004 0114 029E

        TSTR    R0                              ; 5DDA   0080
        BEQ     L_5DC6                          ; 5DDB   0224 0016

L_5DDD:
        JSR     R5,     L_5FFF                  ; 5DDD   0004 015C 03FF
        JSR     R5,     L_6037                  ; 5DE0   0004 0160 0037
        JSR     R5,     L_5A0D                  ; 5DE3   0004 0158 020D
        JSR     R5,     L_5F2D                  ; 5DE6   0004 015C 032D
L_5DE9:
        JSR     R5,     .EXEC.A61               ; 5DE9   0004 0118 0261

        INCR    R4                              ; 5DEC   000C

        JSR     R5,     L_5E17                  ; 5DED   0004 015C 0217
        JSR     R5,     X_RAND2                 ; 5DF0   0004 0114 029E

        MVII    #$01A2, R1                      ; 5DF3   02B9 01A2
        INCR    R7                              ; 5DF5   000F

L_5DF6:
        INCR    R1                              ; 5DF6   0009
L_5DF7:
        MVI@    R1,     R2                      ; 5DF7   028A
        CMPR    R2,     R3                      ; 5DF8   0153
        BNEQ    L_5DF6                          ; 5DF9   022C 0004

        DECR    R0                              ; 5DFB   0010
        BPL     L_5DF6                          ; 5DFC   0223 0007

        SUBI    #$01A2, R1                      ; 5DFE   0339 01A2
        MVII    #$000D, R2                      ; 5E00   02BA 000D

        JSR     R5,     X_DIV                   ; 5E02   0004 011C 01FB

        MVO     R0,     G_0170                  ; 5E05   0240 0170
        MVO     R1,     G_016F                  ; 5E07   0241 016F

        JSR     R5,     L_6014                  ; 5E09   0004 0160 0014
        JSR     R5,     L_5FFF                  ; 5E0C   0004 015C 03FF
        JSR     R5,     L_568D                  ; 5E0F   0004 0154 028D
        JSR     R5,     L_5E8F                  ; 5E12   0004 015C 028F

        B       L_5D98                          ; 5E15   0220 007E

L_5E17:
        MVII    #$01A2, R4                      ; 5E17   02BC 01A2
        MVII    #$00FF, R3                      ; 5E19   02BB 00FF
L_5E1B:
        CMPI    #$01D6, R4                      ; 5E1B   037C 01D6
        BEQ     L_5E2D                          ; 5E1D   0204 000E

        MVI@    R4,     R2                      ; 5E1F   02A2
        TSTR    R2                              ; 5E20   0092
        BEQ     L_5E1B                          ; 5E21   0224 0007

        CMPR    R2,     R3                      ; 5E23   0153
        BMI     L_5E1B                          ; 5E24   022B 000A
        BEQ     L_5E2A                          ; 5E26   0204 0002

        MOVR    R2,     R3                      ; 5E28   0093
        CLRR    R0                              ; 5E29   01C0
L_5E2A:
        INCR    R0                              ; 5E2A   0008
        B       L_5E1B                          ; 5E2B   0220 0011
L_5E2D:
        MOVR    R5,     R7                      ; 5E2D   00AF
        B       L_6031                          ; 5E2E   0200 0201
        BOV     L_6032                          ; 5E30   0202 0200
        BOV     L_6037                          ; 5E32   0202 0203
        B       L_6037                          ; 5E34   0200 0201
        BPL     L_6039                          ; 5E36   0203 0201
        BOV     L_603D                          ; 5E38   0202 0203

L_5E3A:
        PSHR    R5                              ; 5E3A   0275

        JSR     R5,     L_5E4A                  ; 5E3B   0004 015C 024A

        MVII    #$0200, R3                      ; 5E3E   02BB 0200
        COMR    R0                              ; 5E40   0018
L_5E41:
        MVI@    R3,     R1                      ; 5E41   0299
        ANDR    R0,     R1                      ; 5E42   0181
        MVO@    R1,     R3                      ; 5E43   0259
        INCR    R3                              ; 5E44   000B
        CMPI    #$0204, R3                      ; 5E45   037B 0204
        BNEQ    L_5E41                          ; 5E47   022C 0007
L_5E49:
        PULR    R7                              ; 5E49   02B7

L_5E4A:
        MVII    #$0200, R4                      ; 5E4A   02BC 0200
        CLRR    R2                              ; 5E4C   01D2
        MVO     R2,     .BTAB.04                ; 5E4D   0242 0204
        MVI@    R4,     R0                      ; 5E4F   02A0
        AND@    R4,     R0                      ; 5E50   03A0
        AND@    R4,     R0                      ; 5E51   03A0
        AND@    R4,     R0                      ; 5E52   03A0
        SDBD                                    ; 5E53   0001
        MVII    #$5E2E, R4                      ; 5E54   02BC 002E 005E
L_5E57:
        MVI     .BTAB.04,R1                     ; 5E57   0281 0204
        COMR    R1                              ; 5E59   0019
        ANDR    R1,     R0                      ; 5E5A   0188
        COMR    R1                              ; 5E5B   0019
        XORR    R1,     R0                      ; 5E5C   01C8
        MVO     R0,     .BTAB.04                ; 5E5D   0240 0204
        INCR    R2                              ; 5E5F   000A
        CMPI    #$0005, R2                      ; 5E60   037A 0005
        BEQ     L_5E6C                          ; 5E62   0204 0008

        MVI@    R4,     R1                      ; 5E64   02A1
        MVI@    R1,     R0                      ; 5E65   0288
        MVI@    R4,     R1                      ; 5E66   02A1
        AND@    R1,     R0                      ; 5E67   0388
        MVI@    R4,     R1                      ; 5E68   02A1
        AND@    R1,     R0                      ; 5E69   0388
        B       L_5E57                          ; 5E6A   0220 0014

L_5E6C:
        MVI     .BTAB.04,R0                     ; 5E6C   0280 0204
        MOVR    R5,     R7                      ; 5E6E   00AF

L_5E6F:
        PSHR    R5                              ; 5E6F   0275
        MVII    #$0200, R3                      ; 5E70   02BB 0200

L_5E72:
        JSR     R5,     L_5E7E                  ; 5E72   0004 015C 027E

        COMR    R4                              ; 5E75   001C
        ANDR    R4,     R1                      ; 5E76   01A1
        MVO@    R1,     R3                      ; 5E77   0259
        INCR    R3                              ; 5E78   000B
        CMPI    #$0204, R3                      ; 5E79   037B 0204
        BNEQ    L_5E72                          ; 5E7B   022C 000A
        PULR    R7                              ; 5E7D   02B7

L_5E7E:
        CLRR    R4                              ; 5E7E   01E4
        MVI@    R3,     R1                      ; 5E7F   0299
        MVII    #$0007, R2                      ; 5E80   02BA 0007
L_5E82:
        MOVR    R1,     R0                      ; 5E82   0088
        ANDR    R2,     R0                      ; 5E83   0190
        CMPR    R2,     R0                      ; 5E84   0150
        BNEQ    L_5E8B                          ; 5E85   020C 0004

        COMR    R0                              ; 5E87   0018
        ANDR    R0,     R4                      ; 5E88   0184
        COMR    R0                              ; 5E89   0018
        XORR    R0,     R4                      ; 5E8A   01C4
L_5E8B:
        SLL     R2,     1                       ; 5E8B   004A
        BPL     L_5E82                          ; 5E8C   0223 000B
        MOVR    R5,     R7                      ; 5E8E   00AF

L_5E8F:
        PSHR    R5                              ; 5E8F   0275

        JSR     R5,     L_5F10                  ; 5E90   0004 015C 0310

        CLRR    R0                              ; 5E93   01C0
        MVO     R0,     G_01A2                  ; 5E94   0240 01A2

        JSR     R5,     L_5E3A                  ; 5E96   0004 015C 023A
        JSR     R5,     L_5E6F                  ; 5E99   0004 015C 026F
        JSR     R5,     L_5F1A                  ; 5E9C   0004 015C 031A
        JSR     R5,     L_5F10                  ; 5E9F   0004 015C 0310

        MVII    #$0001, R0                      ; 5EA2   02B8 0001
        MVO     R0,     G_01A2                  ; 5EA4   0240 01A2

        JSR     R5,     L_5E6F                  ; 5EA6   0004 015C 026F
        JSR     R5,     L_5E3A                  ; 5EA9   0004 015C 023A
        JSR     R5,     L_5F1A                  ; 5EAC   0004 015C 031A
        JSR     R5,     L_5F10                  ; 5EAF   0004 015C 0310

        MVII    #$0200, R4                      ; 5EB2   02BC 0200
        MVI@    R4,     R0                      ; 5EB4   02A0
        AND@    R4,     R0                      ; 5EB5   03A0
        AND@    R4,     R0                      ; 5EB6   03A0
        AND@    R4,     R0                      ; 5EB7   03A0
        SDBD                                    ; 5EB8   0001
        ANDI    #$0FFE, R0                      ; 5EB9   03B8 00FE 000F
        TSTR    R0                              ; 5EBC   0080
        BEQ     L_5E49                          ; 5EBD   0224 0075

        MOVR    R0,     R1                      ; 5EBF   0081

        JSR     R5,     L_59D0                  ; 5EC0   0004 0158 01D0

        DECR    R3                              ; 5EC3   0013
        BNEQ    L_5E49                          ; 5EC4   022C 007C

        MVO     R0,     .BTAB.06                ; 5EC6   0240 0206
        MOVR    R0,     R1                      ; 5EC8   0081
        SAR     R0,     1                       ; 5EC9   0068
        XORR    R0,     R1                      ; 5ECA   01C1
        SLL     R0,     2                       ; 5ECB   004C
        XORR    R0,     R1                      ; 5ECC   01C1
        MVII    #$0200, R4                      ; 5ECD   02BC 0200
        CLRR    R3                              ; 5ECF   01DB
L_5ED0:
        CMPI    #$0204, R4                      ; 5ED0   037C 0204
        BEQ     L_5EE6                          ; 5ED2   0204 0012

        MVI@    R4,     R2                      ; 5ED4   02A2
        ANDR    R1,     R2                      ; 5ED5   018A
        CMPR    R1,     R2                      ; 5ED6   014A
        BEQ     L_5ED0                          ; 5ED7   0224 0008

        CMP     .BTAB.06,R2                     ; 5ED9   0342 0206
        BEQ     L_5ED0                          ; 5EDB   0224 000C

        MOVR    R4,     R0                      ; 5EDD   00A0
        SUBI    #$0201, R0                      ; 5EDE   0338 0201

        JSR     R5,     X_POW2                  ; 5EE0   0004 0114 0345

        XORR    R0,     R3                      ; 5EE3   01C3
        B       L_5ED0                          ; 5EE4   0220 0015

L_5EE6:
        MOVR    R3,     R1                      ; 5EE6   0099

        JSR     R5,     L_59D0                  ; 5EE7   0004 0158 01D0

        DECR    R3                              ; 5EEA   0013
        BNEQ    L_5E49                          ; 5EEB   022C 00A3

L_5EED:
        INCR    R3                              ; 5EED   000B
        SARC    R1,     1                       ; 5EEE   0079
        BNC     L_5EED                          ; 5EEF   0229 0003

        ADDI    #$01FF, R3                      ; 5EF1   02FB 01FF
        MVO     R3,     .BTAB.07                ; 5EF3   0243 0207
        MVII    #$0002, R5                      ; 5EF5   02BD 0002
        MVO     R5,     G_01A2                  ; 5EF7   0245 01A2

        JSR     R5,     L_5F09                  ; 5EF9   0004 015C 0309
        JSR     R5,     L_5E6F                  ; 5EFC   0004 015C 026F
        JSR     R5,     L_5F09                  ; 5EFF   0004 015C 0309
        JSR     R5,     L_5E3A                  ; 5F02   0004 015C 023A
        JSR     R5,     L_5F1A                  ; 5F05   0004 015C 031A

        PULR    R7                              ; 5F08   02B7

L_5F09:
        MVI     .BTAB.07,R3                     ; 5F09   0283 0207
        MVI@    R3,     R1                      ; 5F0B   0299
        XOR     .BTAB.06,R1                     ; 5F0C   03C1 0206
        MVO@    R1,     R3                      ; 5F0E   0259
        MOVR    R5,     R7                      ; 5F0F   00AF

L_5F10:
        PSHR    R5                              ; 5F10   0275

        JSR     R5,     L_66A7                  ; 5F11   0004 0164 02A7

        MOVR    R3,     R0                      ; 5F14   0098
        MVII    #$0200, R4                      ; 5F15   02BC 0200

        JSR     R5,     L_5965                  ; 5F17   0004 0158 0165

L_5F1A:
        MVII    #$0200, R4                      ; 5F1A   02BC 0200
L_5F1C:
        MVI@    R4,     R0                      ; 5F1C   02A0
        TSTR    R0                              ; 5F1D   0080
        BNEQ    L_5F2C                          ; 5F1E   020C 000C

        CMPI    #$0204, R4                      ; 5F20   037C 0204
        BMI     L_5F1C                          ; 5F22   022B 0007

        PULR    R5                              ; 5F24   02B5

        JSR     R5,     .EXEC.A61               ; 5F25   0004 0118 0261
        DECLE   $000F                           ; 5F28   000F

        J       L_66B2                          ; 5F29   0004 0364 02B2
L_5F2C:
        MOVR    R5,     R7                      ; 5F2C   00AF

L_5F2D:
        PSHR    R5                              ; 5F2D   0275

        JSR     R5,     L_66A7                  ; 5F2E   0004 0164 02A7

        MVII    #$0034, R0                      ; 5F31   02B8 0034
        MVII    #$01A2, R2                      ; 5F33   02BA 01A2
        MOVR    R2,     R4                      ; 5F35   0094

        JSR     R5,     X_FILL_ZERO             ; 5F36   0004 0114 0338

        MOVR    R3,     R4                      ; 5F39   009C
        MVII    #$0001, R3                      ; 5F3A   02BB 0001
L_5F3C:
        CMPI    #$01D6, R2                      ; 5F3C   037A 01D6
        BEQ     L_5F4F                          ; 5F3E   0204 000F

        CLRR    R0                              ; 5F40   01C0
        SDBD                                    ; 5F41   0001
        MVI@    R4,     R1                      ; 5F42   02A1
L_5F43:
        SARC    R1,     1                       ; 5F43   0079
        BNC     L_5F47                          ; 5F44   0209 0001

        MVO@    R3,     R2                      ; 5F46   0253
L_5F47:
        INCR    R0                              ; 5F47   0008
        INCR    R2                              ; 5F48   000A
        CMPI    #$000D, R0                      ; 5F49   0378 000D
        BNEQ    L_5F43                          ; 5F4B   022C 0009
        B       L_5F3C                          ; 5F4D   0220 0012

L_5F4F:
        JSR     R5,     L_5F10                  ; 5F4F   0004 015C 0310
        JSR     R5,     L_5E4A                  ; 5F52   0004 015C 024A

        CLRR    R1                              ; 5F55   01C9
        INCR    R7                              ; 5F56   000F

L_5F57:
        INCR    R1                              ; 5F57   0009
L_5F58:
        TSTR    R0                              ; 5F58   0080
        BEQ     L_5F6F                          ; 5F59   0204 0014

        SARC    R0,     1                       ; 5F5B   0078
        BNC     L_5F57                          ; 5F5C   0229 0006

        MOVR    R1,     R2                      ; 5F5E   008A
        ADDI    #$01A2, R2                      ; 5F5F   02FA 01A2
L_5F61:
        MVI@    R2,     R3                      ; 5F61   0293
        TSTR    R3                              ; 5F62   009B
        BEQ     L_5F67                          ; 5F63   0204 0002

        INCR    R3                              ; 5F65   000B
        MVO@    R3,     R2                      ; 5F66   0253
L_5F67:
        ADDI    #$000D, R2                      ; 5F67   02FA 000D
        CMPI    #$01D6, R2                      ; 5F69   037A 01D6
        BMI     L_5F61                          ; 5F6B   022B 000B
        B       L_5F57                          ; 5F6D   0220 0017

L_5F6F:
        JSR     R5,     L_5F10                  ; 5F6F   0004 015C 0310

        CLRR    R1                              ; 5F72   01C9
        MVII    #$0200, R3                      ; 5F73   02BB 0200
L_5F75:
        PSHR    R3                              ; 5F75   0273
        PSHR    R1                              ; 5F76   0271

        JSR     R5,     L_5E7E                  ; 5F77   0004 015C 027E

        MOVR    R4,     R0                      ; 5F7A   00A0
        CLRR    R3                              ; 5F7B   01DB
        INCR    R7                              ; 5F7C   000F

L_5F7D:
        INCR    R3                              ; 5F7D   000B
L_5F7E:
        TSTR    R0                              ; 5F7E   0080
        BEQ     L_5F90                          ; 5F7F   0204 000F

        SARC    R0,     1                       ; 5F81   0078
        BNC     L_5F7D                          ; 5F82   0229 0006

        PULR    R1                              ; 5F84   02B1
        PSHR    R1                              ; 5F85   0271
        PSHR    R0                              ; 5F86   0270

        JSR     R5,     L_6023                  ; 5F87   0004 0160 0023

        ADDI    #$0002, R0                      ; 5F8A   02F8 0002
        MVO@    R0,     R2                      ; 5F8C   0250
        PULR    R0                              ; 5F8D   02B0
        B       L_5F7D                          ; 5F8E   0220 0012

L_5F90:
        PULR    R1                              ; 5F90   02B1
        INCR    R1                              ; 5F91   0009
        PULR    R3                              ; 5F92   02B3
        INCR    R3                              ; 5F93   000B
        CMPI    #$0004, R1                      ; 5F94   0379 0004
        BMI     L_5F75                          ; 5F96   022B 0022

        MVII    #$01A2, R3                      ; 5F98   02BB 01A2
L_5F9A:
        CLRR    R2                              ; 5F9A   01D2
L_5F9B:
        MOVR    R3,     R1                      ; 5F9B   0099
        ADDR    R2,     R1                      ; 5F9C   00D1
        MVI@    R1,     R0                      ; 5F9D   0288
        DECR    R1                              ; 5F9E   0011
        DECR    R2                              ; 5F9F   0012
        BMI     L_5FA5                          ; 5FA0   020B 0003

        JSR     R5,     L_602E                  ; 5FA2   0004 0160 002E

L_5FA5:
        ADDI    #$0002, R1                      ; 5FA5   02F9 0002
        ADDI    #$0002, R2                      ; 5FA7   02FA 0002
        CMPI    #$000D, R2                      ; 5FA9   037A 000D
        BEQ     L_5FB0                          ; 5FAB   0204 0003

        JSR     R5,     L_602E                  ; 5FAD   0004 0160 002E

L_5FB0:
        DECR    R1                              ; 5FB0   0011
        MVO@    R0,     R1                      ; 5FB1   0248
        CMPI    #$000D, R2                      ; 5FB2   037A 000D
        BMI     L_5F9B                          ; 5FB4   022B 001A

        ADDR    R2,     R3                      ; 5FB6   00D3
        CMPI    #$01D6, R3                      ; 5FB7   037B 01D6
        BMI     L_5F9A                          ; 5FB9   022B 0020

        JSR     R5,     L_5F10                  ; 5FBB   0004 015C 0310

        SDBD                                    ; 5FBE   0001
        MVII    #$5FF9, R4                      ; 5FBF   02BC 00F9 005F
L_5FC2:
        MVI@    R4,     R1                      ; 5FC2   02A1
        PSHR    R4                              ; 5FC3   0274
        MOVR    R1,     R2                      ; 5FC4   008A
        ANDI    #$0003, R1                      ; 5FC5   03B9 0003
        SLR     R2,     2                       ; 5FC7   0066
        PSHR    R1                              ; 5FC8   0271
        PSHR    R2                              ; 5FC9   0272
        ADDI    #$0200, R1                      ; 5FCA   02F9 0200
        ADDI    #$0200, R2                      ; 5FCC   02FA 0200
        MVI@    R2,     R0                      ; 5FCE   0290
        MVI@    R1,     R1                      ; 5FCF   0289
        ANDR    R1,     R0                      ; 5FD0   0188
        BEQ     L_5FEF                          ; 5FD1   0204 001C

        CLRR    R3                              ; 5FD3   01DB
        INCR    R7                              ; 5FD4   000F

L_5FD5:
        INCR    R3                              ; 5FD5   000B
L_5FD6:
        TSTR    R0                              ; 5FD6   0080
        BEQ     L_5FEF                          ; 5FD7   0204 0016

        SARC    R0,     1                       ; 5FD9   0078
        BNC     L_5FD5                          ; 5FDA   0229 0006

        PULR    R1                              ; 5FDC   02B1
        PULR    R4                              ; 5FDD   02B4
        PSHR    R4                              ; 5FDE   0274
        PSHR    R1                              ; 5FDF   0271
        PSHR    R0                              ; 5FE0   0270

        JSR     R5,     L_6023                  ; 5FE1   0004 0160 0023

        INCR    R0                              ; 5FE4   0008
        MVO@    R0,     R2                      ; 5FE5   0250
        MOVR    R4,     R1                      ; 5FE6   00A1

        JSR     R5,     L_6023                  ; 5FE7   0004 0160 0023

        INCR    R0                              ; 5FEA   0008
        MVO@    R0,     R2                      ; 5FEB   0250
        PULR    R0                              ; 5FEC   02B0
        B       L_5FD5                          ; 5FED   0220 0019

L_5FEF:
        PULR    R2                              ; 5FEF   02B2
        PULR    R1                              ; 5FF0   02B1
        PULR    R4                              ; 5FF1   02B4
        SDBD                                    ; 5FF2   0001
        CMPI    #$5FFF, R4                      ; 5FF3   037C 00FF 005F
        BNEQ    L_5FC2                          ; 5FF6   022C 0035
        PULR    R7                              ; 5FF8   02B7

        DECLE   $0001                           ; 5FF9   0001

        EIS                                     ; 5FFA   0002
        DIS                                     ; 5FFB   0003
        CLRC                                    ; 5FFC   0006
        SETC                                    ; 5FFD   0007
        INCR    R3                              ; 5FFE   000B
L_5FFF:
        PSHR    R5                              ; 5FFF   0275
L_6000:
        MVI     G_016F, R0                      ; 6000   0280 016F
        MVI     G_0170, R2                      ; 6002   0282 0170

        JSR     R5,     X_POW2                  ; 6004   0004 0114 0345

        INCR    R7                              ; 6007   000F

L_6008:
        PSHR    R5                              ; 6008   0275

L_6009:
        JSR     R5,     L_66A8                  ; 6009   0004 0164 02A8

L_600C:
        SDBD                                    ; 600C   0001
        MVI@    R4,     R1                      ; 600D   02A1
        XORR    R0,     R1                      ; 600E   01C1
        MOVR    R3,     R4                      ; 600F   009C
        MVO@    R1,     R4                      ; 6010   0261
        SWAP    R1,     1                       ; 6011   0041
        MVO@    R1,     R4                      ; 6012   0261
        PULR    R7                              ; 6013   02B7

L_6014:
        PSHR    R5                              ; 6014   0275
        MVI     G_016F, R0                      ; 6015   0280 016F

        JSR     R5,     X_POW2                  ; 6017   0004 0114 0345

        MVII    #$0179, R4                      ; 601A   02BC 0179
        ADD     G_0170, R4                      ; 601C   02C4 0170
        ADD     G_0170, R4                      ; 601E   02C4 0170
        MOVR    R4,     R3                      ; 6020   00A3
        B       L_600C                          ; 6021   0220 0016

L_6023:
        PSHR    R5                              ; 6023   0275
        MVII    #$000D, R0                      ; 6024   02B8 000D

        JSR     R5,     X_MPY                   ; 6026   0004 011C 01DC

        ADDI    #$01A2, R2                      ; 6029   02FA 01A2
        ADDR    R3,     R2                      ; 602B   00DA
        MVI@    R2,     R0                      ; 602C   0290
        PULR    R7                              ; 602D   02B7

L_602E:
        TSTR    R0                              ; 602E   0080
        BEQ     L_6036                          ; 602F   0204 0005

L_6031:
        MVI@    R1,     R4                      ; 6031   028C
L_6032:
        TSTR    R4                              ; 6032   00A4
        BEQ     L_6036                          ; 6033   0204 0001

        INCR    R0                              ; 6035   0008
L_6036:
        MOVR    R5,     R7                      ; 6036   00AF

L_6037:
        MVI     G_0170, R2                      ; 6037   0282 0170
L_6039:
        SLL     R2,     2                       ; 6039   004E
        SLL     R2,     2                       ; 603A   004E
        ADD     G_016F, R2                      ; 603B   02C2 016F
L_603D:
        MVO     R2,     G_01D6                  ; 603D   0242 01D6
        MOVR    R5,     R7                      ; 603F   00AF

L_6040:
        MVI     G_01D7, R5                      ; 6040   0285 01D7
        TSTR    R5                              ; 6042   00AD
        BEQ     L_6066                          ; 6043   0204 0021

        JSR     R5,     L_5923                  ; 6045   0004 0158 0123
        JSR     R5,     L_568D                  ; 6048   0004 0154 028D
        JSR     R5,     L_5148                  ; 604B   0004 0150 0148

        J       L_5D98                          ; 604E   0004 035C 0198

L_6051:
        MVI     G_01D7, R2                      ; 6051   0282 01D7
        TSTR    R2                              ; 6053   0092
        BNEQ    L_6066                          ; 6054   020C 0010

        JSR     R5,     L_52FB                  ; 6056   0004 0150 02FB
        JSR     R5,     L_6037                  ; 6059   0004 0160 0037
        JSR     R5,     L_5A0D                  ; 605C   0004 0158 020D

L_605F:
        MVII    #$0001, R0                      ; 605F   02B8 0001
        MVO     R0,     G_01D7                  ; 6061   0240 01D7

        JSR     R5,     L_5148                  ; 6063   0004 0150 0148

L_6066:
        PULR    R7                              ; 6066   02B7

        PSHR    R5                              ; 6067   0275
        MVI     G_015E, R3                      ; 6068   0283 015E
        MVI     G_01D7, R1                      ; 606A   0281 01D7
        CMPI    #$0001, R3                      ; 606C   037B 0001
        BEQ     L_60A0                          ; 606E   0204 0030

        CMPI    #$0004, R3                      ; 6070   037B 0004
        BPL     L_6066                          ; 6072   0223 000D

        TSTR    R1                              ; 6074   0089
        BNEQ    L_6089                          ; 6075   020C 0012

        CMPI    #$0001, R0                      ; 6077   0378 0001
        BNEQ    L_6066                          ; 6079   022C 0014

        JSR     R5,     L_6014                  ; 607B   0004 0160 0014
        JSR     R5,     L_5FFF                  ; 607E   0004 015C 03FF
        JSR     R5,     L_52FB                  ; 6081   0004 0150 02FB
        JSR     R5,     L_5671                  ; 6084   0004 0154 0271

        B       L_605F                          ; 6087   0220 0029

L_6089:
        CMPI    #$0003, R0                      ; 6089   0378 0003
        BNEQ    L_6066                          ; 608B   022C 0026

        JSR     R5,     L_54D5                  ; 608D   0004 0154 00D5
        JSR     R5,     L_5923                  ; 6090   0004 0158 0123
        JSR     R5,     L_568D                  ; 6093   0004 0154 028D
        JSR     R5,     L_5E8F                  ; 6096   0004 015C 028F

        MVII    #$0005, R0                      ; 6099   02B8 0005
        MVO     R0,     G_0165                  ; 609B   0240 0165
        J       L_66B2                          ; 609D   0004 0364 02B2

L_60A0:
        TSTR    R1                              ; 60A0   0089
        BEQ     L_60DE                          ; 60A1   0204 003B

        CMPI    #$0002, R1                      ; 60A3   0379 0002
        BEQ     L_60C0                          ; 60A5   0204 0019

L_60A7:
        TSTR    R0                              ; 60A7   0080
        BEQ     L_60B4                          ; 60A8   0204 000A

        SARC    R0,     1                       ; 60AA   0078
        BNC     L_60DB                          ; 60AB   0209 002E

        DECR    R0                              ; 60AD   0010
        BLE     L_60DB                          ; 60AE   0206 002B

        CMPI    #$0004, R0                      ; 60B0   0378 0004
        BPL     L_60DB                          ; 60B2   0203 0027

L_60B4:
        MVO     R0,     G_0170                  ; 60B4   0240 0170

        JSR     R5,     L_5BC7                  ; 60B6   0004 0158 03C7

        MVO     R1,     .BTAB.84                ; 60B9   0241 0284
        MVII    #$0002, R0                      ; 60BB   02B8 0002
        MVO     R0,     G_01D7                  ; 60BD   0240 01D7
        PULR    R7                              ; 60BF   02B7

L_60C0:
        CMPI    #$000B, R0                      ; 60C0   0378 000B
        BEQ     L_60D2                          ; 60C2   0204 000E

        DECR    R1                              ; 60C4   0011
        MVO     R1,     G_01D7                  ; 60C5   0241 01D7
        CMPI    #$000A, R0                      ; 60C7   0378 000A
        BNEQ    L_60A7                          ; 60C9   022C 0023

        SDBD                                    ; 60CB   0001
        MVII    #$2200, R0                      ; 60CC   02B8 0000 0022
        MVO     R0,     .BTAB.84                ; 60CF   0240 0284
        PULR    R7                              ; 60D1   02B7

L_60D2:
        CLRR    R0                              ; 60D2   01C0
        MVO     R0,     G_01D7                  ; 60D3   0240 01D7

        JSR     R5,     .EXEC.607               ; 60D5   0004 0114 0207

        J       L_5583                          ; 60D8   0004 0354 0183
L_60DB:
        J       L_5573                          ; 60DB   0004 0354 0173

L_60DE:
        CMPI    #$0008, R0                      ; 60DE   0378 0008
        BNEQ    L_6066                          ; 60E0   022C 007B

        MVI     G_016A, R5                      ; 60E2   0285 016A
        CMPI    #$000F, R5                      ; 60E4   037D 000F
        BNEQ    L_60DB                          ; 60E6   022C 000C

        MVII    #$0181, R4                      ; 60E8   02BC 0181
        ADD     G_0170, R4                      ; 60EA   02C4 0170
        ADD     G_0170, R4                      ; 60EC   02C4 0170
        SDBD                                    ; 60EE   0001
        MVI@    R4,     R0                      ; 60EF   02A0
        TSTR    R0                              ; 60F0   0080
        BNEQ    L_60DB                          ; 60F1   022C 0017

        MVI     G_016F, R0                      ; 60F3   0280 016F

        JSR     R5,     X_POW2                  ; 60F5   0004 0114 0345

        MVII    #$0080, R1                      ; 60F8   02B9 0080
        COMR    R1                              ; 60FA   0019
        ANDR    R1,     R0                      ; 60FB   0188
        COMR    R1                              ; 60FC   0019
        XORR    R1,     R0                      ; 60FD   01C8
        MVII    #$0181, R5                      ; 60FE   02BD 0181
L_6100:
        SDBD                                    ; 6100   0001
        MVI@    R5,     R1                      ; 6101   02A9
        ANDR    R0,     R1                      ; 6102   0181
        BNEQ    L_60DB                          ; 6103   022C 0029

        CMPI    #$0189, R5                      ; 6105   037D 0189
        BMI     L_6100                          ; 6107   022B 0008

        JSR     R5,     .EXEC.607               ; 6109   0004 0114 0207

        J       L_5583                          ; 610C   0004 0354 0183

L_610F:
        JSR     R5,     L_5F10                  ; 610F   0004 015C 0310

        MVI     G_01A2, R0                      ; 6112   0280 01A2
        TSTR    R0                              ; 6114   0080
        BNEQ    L_618B                          ; 6115   020C 0074

        JSR     R5,     L_5E3A                  ; 6117   0004 015C 023A

L_611A:
        PSHR    R0                              ; 611A   0270
        MVI     G_0165, R0                      ; 611B   0280 0165
        MVII    #$0028, R1                      ; 611D   02B9 0028

        JSR     R5,     X_MPY                   ; 611F   0004 011C 01DC

        ADDI    #$0228, R2                      ; 6122   02FA 0228
        MOVR    R2,     R3                      ; 6124   0093
        MVII    #$0200, R4                      ; 6125   02BC 0200

        JSR     R5,     L_5AFE                  ; 6127   0004 0158 02FE
        JSR     R5,     L_66A7                  ; 612A   0004 0164 02A7

        MVII    #$0200, R2                      ; 612D   02BA 0200
L_612F:
        SDBD                                    ; 612F   0001
        MVI@    R4,     R0                      ; 6130   02A0
        MVI@    R2,     R1                      ; 6131   0291
        XORR    R1,     R0                      ; 6132   01C8
        MVO@    R0,     R2                      ; 6133   0250
        INCR    R2                              ; 6134   000A
        CMPI    #$0204, R2                      ; 6135   037A 0204
        BNEQ    L_612F                          ; 6137   022C 0009

        PULR    R3                              ; 6139   02B3
        CLRR    R1                              ; 613A   01C9
        INCR    R7                              ; 613B   000F

L_613C:
        INCR    R1                              ; 613C   0009
L_613D:
        CMPI    #$000D, R1                      ; 613D   0379 000D
        BEQ     L_616B                          ; 613F   0204 002A

        SARC    R3,     1                       ; 6141   007B
        BC      L_613C                          ; 6142   0221 0007

        MOVR    R1,     R0                      ; 6144   0088

        JSR     R5,     X_POW2                  ; 6145   0004 0114 0345

        CLRR    R2                              ; 6148   01D2
        INCR    R7                              ; 6149   000F

L_614A:
        INCR    R2                              ; 614A   000A
L_614B:
        CMPI    #$0004, R2                      ; 614B   037A 0004
        BEQ     L_613C                          ; 614D   0224 0012

        MOVR    R2,     R4                      ; 614F   0094
        ADDI    #$0200, R4                      ; 6150   02FC 0200
        MVI@    R4,     R5                      ; 6152   02A5
        ANDR    R0,     R5                      ; 6153   0185
        BEQ     L_614A                          ; 6154   0224 000B

        PSHR    R0                              ; 6156   0270
        MOVR    R2,     R0                      ; 6157   0090
        PSHR    R1                              ; 6158   0271
        MVI     G_033C, R4                      ; 6159   0284 033C

        JSR     R5,     L_5BD5                  ; 615B   0004 0158 03D5

        MVO@    R1,     R4                      ; 615E   0261
        MVO     R4,     G_033C                  ; 615F   0244 033C
        ADDI    #$0013, R4                      ; 6161   02FC 0013

        JSR     R5,     L_5BC7                  ; 6163   0004 0158 03C7

        MVO@    R1,     R4                      ; 6166   0261
        PULR    R1                              ; 6167   02B1
        PULR    R0                              ; 6168   02B0
        B       L_614A                          ; 6169   0220 0020

L_616B:
        MVI     G_033C, R3                      ; 616B   0283 033C

        JSR     R5,     L_5AC4                  ; 616D   0004 0158 02C4

        MOVR    R3,     R4                      ; 6170   009C
        ADDI    #$0002, R4                      ; 6171   02FC 0002
        SDBD                                    ; 6173   0001
        MVII    #$646D, R3                      ; 6174   02BB 006D 0064
        ADD     G_0165, R3                      ; 6177   02C3 0165
        MVI@    R3,     R3                      ; 6179   029B
        SDBD                                    ; 617A   0001
        ADDI    #$2400, R3                      ; 617B   02FB 0000 0024

        JSR     R5,     X_PRINT_R5              ; 617E   0004 0118 007B
        STRING  "GIN!"                          ; 6181   0047 0049 004E 0021
        DECLE   $0000                           ; 6185   0000

        MVII    #$0014, R0                      ; 6186   02B8 0014
        J       L_66CF                          ; 6188   0004 0364 02CF

L_618B:
        DECR    R0                              ; 618B   0010
        BEQ     L_6199                          ; 618C   0204 000B

        JSR     R5,     L_5F09                  ; 618E   0004 015C 0309
        JSR     R5,     L_5E6F                  ; 6191   0004 015C 026F
        JSR     R5,     L_5F09                  ; 6194   0004 015C 0309

        B       L_619C                          ; 6197   0200 0003

L_6199:
        JSR     R5,     L_5E6F                  ; 6199   0004 015C 026F

L_619C:
        MVII    #$0200, R4                      ; 619C   02BC 0200
        MVI@    R4,     R0                      ; 619E   02A0
L_619F:
        MVI@    R4,     R1                      ; 619F   02A1
        COMR    R1                              ; 61A0   0019
        ANDR    R1,     R0                      ; 61A1   0188
        COMR    R1                              ; 61A2   0019
        XORR    R1,     R0                      ; 61A3   01C8
        CMPI    #$0204, R4                      ; 61A4   037C 0204
        BNEQ    L_619F                          ; 61A6   022C 0008

        COMR    R0                              ; 61A8   0018

        JSR     R5,     L_66A7                  ; 61A9   0004 0164 02A7

        MVII    #$0200, R3                      ; 61AC   02BB 0200
L_61AE:
        SDBD                                    ; 61AE   0001
        MVI@    R4,     R1                      ; 61AF   02A1
        MVI@    R3,     R2                      ; 61B0   029A
        XORR    R2,     R1                      ; 61B1   01D1
        MVO@    R1,     R3                      ; 61B2   0259
        INCR    R3                              ; 61B3   000B
        CMPI    #$0204, R3                      ; 61B4   037B 0204
        BNEQ    L_61AE                          ; 61B6   022C 0009
        B       L_611A                          ; 61B8   0220 009F

        MVII    #$0001, R0                      ; 61BA   02B8 0001
        MVO     R0,     .BTAB.12                ; 61BC   0240 0212

L_61BE:
        JSR     R5,     L_59B4                  ; 61BE   0004 0158 01B4

        MVII    #$000D, R0                      ; 61C1   02B8 000D
        MVII    #$017C, R4                      ; 61C3   02BC 017C
        MVO@    R0,     R4                      ; 61C5   0260
        MVO@    R0,     R4                      ; 61C6   0260
        MVO@    R0,     R4                      ; 61C7   0260
        MVO@    R0,     R4                      ; 61C8   0260
        MVII    #$01EB, R4                      ; 61C9   02BC 01EB
        MVII    #$0160, R2                      ; 61CB   02BA 0160
L_61CD:
        MVI@    R2,     R0                      ; 61CD   0290
        MVI@    R4,     R1                      ; 61CE   02A1
        CMPI    #$001A, R1                      ; 61CF   0379 001A
        BEQ     L_61DC                          ; 61D1   0204 0009

        ADDR    R1,     R0                      ; 61D3   00C8
        MVO@    R0,     R2                      ; 61D4   0250
        INCR    R2                              ; 61D5   000A
        CMPI    #$0164, R2                      ; 61D6   037A 0164
        BNEQ    L_61CD                          ; 61D8   022C 000C
        B       L_61EF                          ; 61DA   0200 0013

L_61DC:
        SUBR    R1,     R0                      ; 61DC   0108
        MVO@    R0,     R2                      ; 61DD   0250
        MVII    #$0160, R2                      ; 61DE   02BA 0160
L_61E0:
        MVI@    R2,     R0                      ; 61E0   0290
        ADDR    R1,     R0                      ; 61E1   00C8
        MVO@    R0,     R2                      ; 61E2   0250
        INCR    R2                              ; 61E3   000A
        CMPI    #$0164, R2                      ; 61E4   037A 0164
        BNEQ    L_61E0                          ; 61E6   022C 0007

        JSR     R5,     X_PLAY_CHEER1           ; 61E8   0004 011C 02D5
        JSR     R5,     .EXEC.A61               ; 61EB   0004 0118 0261

        GSWD    R2                              ; 61EE   0032

L_61EF:
        JSR     R5,     L_6448                  ; 61EF   0004 0164 0048
        JSR     R5,     L_6728                  ; 61F2   0004 0164 0328

        MVI     G_015F, R2                      ; 61F5   0282 015F
        MVII    #$0034, R1                      ; 61F7   02B9 0034

        JSR     R5,     X_DIV                   ; 61F9   0004 011C 01FB

        MVO     R0,     G_016E                  ; 61FC   0240 016E
        MVO     R0,     G_016A                  ; 61FE   0240 016A
        MVO     R1,     G_016F                  ; 6200   0241 016F
        MVII    #$0002, R0                      ; 6202   02B8 0002
        MVO     R0,     G_0170                  ; 6204   0240 0170
        DECR    R0                              ; 6206   0010
        MVO     R0,     G_01D7                  ; 6207   0240 01D7
        MVO     R0,     G_01D8                  ; 6209   0240 01D8
        TSTR    R1                              ; 620B   0089
        BEQ     L_6217                          ; 620C   0204 0009

        MVI     G_0175, R5                      ; 620E   0285 0175
        XORR    R0,     R5                      ; 6210   01C5
        MVO     R5,     G_0175                  ; 6211   0245 0175
        MVII    #$0033, R0                      ; 6213   02B8 0033
        MVO     R0,     G_0169                  ; 6215   0240 0169

L_6217:
        JSR     R5,     L_5A7E                  ; 6217   0004 0158 027E
        JSR     R5,     L_67B9                  ; 621A   0004 0164 03B9
        JSR     R5,     L_657C                  ; 621D   0004 0164 017C
        JSR     R5,     L_6570                  ; 6220   0004 0164 0170
        JSR     R5,     L_6595                  ; 6223   0004 0164 0195

L_6226:
        CLRR    R0                              ; 6226   01C0
        MVO     R0,     .BTAB.00                ; 6227   0240 0200
        MVI     G_016F, R0                      ; 6229   0280 016F

        JSR     R5,     X_POW2                  ; 622B   0004 0114 0345

        MVII    #$0185, R2                      ; 622E   02BA 0185
        CLRR    R1                              ; 6230   01C9
L_6231:
        MVI@    R2,     R3                      ; 6231   0293
        ANDR    R0,     R3                      ; 6232   0183
        BNEQ    L_623A                          ; 6233   020C 0005

        INCR    R1                              ; 6235   0009
        ADDI    #$0008, R2                      ; 6236   02FA 0008
        B       L_6231                          ; 6238   0220 0008

L_623A:
        MVO     R1,     G_0165                  ; 623A   0241 0165
        MVII    #$000B, R0                      ; 623C   02B8 000B
        MVII    #$01E5, R4                      ; 623E   02BC 01E5

        JSR     R5,     X_FILL_ZERO             ; 6240   0004 0114 0338

        MVI     G_016F, R1                      ; 6243   0281 016F
        MVII    #$0002, R2                      ; 6245   02BA 0002
        B       L_62CE                          ; 6247   0200 0085

L_6249:
        MVI     G_01E5, R0                      ; 6249   0280 01E5
        INCR    R0                              ; 624B   0008
        MVO     R0,     G_01E5                  ; 624C   0240 01E5
        CMP     G_015F, R0                      ; 624E   0340 015F
        BEQ     L_62E1                          ; 6250   0204 008F

        MVI     G_0165, R0                      ; 6252   0280 0165
        INCR    R0                              ; 6254   0008
        CMP     G_015F, R0                      ; 6255   0340 015F
        BNEQ    L_625D                          ; 6257   020C 0004

        JSR     R5,     L_67F4                  ; 6259   0004 0164 03F4

        CLRR    R0                              ; 625C   01C0
L_625D:
        MVO     R0,     G_0165                  ; 625D   0240 0165
        BEQ     L_6447                          ; 625F   0204 01E6

        JSR     R5,     L_6492                  ; 6261   0004 0164 0092
        JSR     R5,     .EXEC.A61               ; 6264   0004 0118 0261

        COMR    R6                              ; 6267   001E
        MVI     G_0170, R2                      ; 6268   0282 0170

        JSR     R5,     L_66A8                  ; 626A   0004 0164 02A8

        CLRR    R0                              ; 626D   01C0
        SDBD                                    ; 626E   0001
        MVI@    R4,     R1                      ; 626F   02A1
        TSTR    R1                              ; 6270   0089
        BEQ     L_63CA                          ; 6271   0204 0157

        MVI     .BTAB.03,R4                     ; 6273   0284 0203
        TSTR    R4                              ; 6275   00A4
        BNEQ    L_63AB                          ; 6276   020C 0133

        MVI     G_01E5, R4                      ; 6278   0284 01E5
        INCR    R4                              ; 627A   000C
        CMP     G_015F, R4                      ; 627B   0344 015F
        BEQ     L_63A3                          ; 627D   0204 0124

        CMPI    #$0002, R2                      ; 627F   037A 0002
        BMI     L_628A                          ; 6281   020B 0007

        MOVR    R2,     R3                      ; 6283   0093
        ADDI    #$01D5, R3                      ; 6284   02FB 01D5
        MVI@    R3,     R3                      ; 6286   029B
        TSTR    R3                              ; 6287   009B
        BNEQ    L_63A3                          ; 6288   020C 0119

L_628A:
        TSTR    R2                              ; 628A   0092
        BNEQ    L_62A0                          ; 628B   020C 0013

        MOVR    R1,     R4                      ; 628D   008C
        SDBD                                    ; 628E   0001
        ANDI    #$0400, R4                      ; 628F   03BC 0000 0004
        BEQ     L_62A0                          ; 6292   0204 000C

        MVI     G_016F, R4                      ; 6294   0284 016F
        CMPI    #$000A, R4                      ; 6296   037C 000A
        BPL     L_63C6                          ; 6298   0203 012C

        SDBD                                    ; 629A   0001
        XORI    #$0400, R1                      ; 629B   03F9 0000 0004
        BEQ     L_63C6                          ; 629E   0204 0126

L_62A0:
        MVII    #$00FF, R4                      ; 62A0   02BC 00FF
        INCR    R7                              ; 62A2   000F

L_62A3:
        INCR    R0                              ; 62A3   0008
L_62A4:
        SARC    R1,     1                       ; 62A4   0079
        BNC     L_62A3                          ; 62A5   0229 0003

        MVI     .BTAB.02,R5                     ; 62A7   0285 0202
        TSTR    R5                              ; 62A9   00AD
        BEQ     L_62AF                          ; 62AA   0204 0003

        MOVR    R0,     R4                      ; 62AC   0084
        B       L_62C8                          ; 62AD   0200 0019

L_62AF:
        CMP     G_016F, R0                      ; 62AF   0340 016F
        BPL     L_62B7                          ; 62B1   0203 0004

        MOVR    R0,     R4                      ; 62B3   0084
        TSTR    R1                              ; 62B4   0089
        BNEQ    L_62A3                          ; 62B5   022C 0013

L_62B7:
        CMPI    #$00FF, R4                      ; 62B7   037C 00FF
        BNEQ    L_62C8                          ; 62B9   020C 000D

        MVI     G_01E5, R5                      ; 62BB   0285 01E5
        INCR    R5                              ; 62BD   000D
        CMP     G_015F, R5                      ; 62BE   0345 015F
        BNEQ    L_62C5                          ; 62C0   020C 0003

        TSTR    R1                              ; 62C2   0089
        BNEQ    L_62A3                          ; 62C3   022C 0021

L_62C5:
        MOVR    R0,     R4                      ; 62C5   0084
        MVO     R0,     G_016F                  ; 62C6   0240 016F
L_62C8:
        MOVR    R4,     R1                      ; 62C8   00A1
        MVII    #$01E7, R3                      ; 62C9   02BB 01E7
        ADD     G_0165, R3                      ; 62CB   02C3 0165
        MVO@    R1,     R3                      ; 62CD   0259

L_62CE:
        JSR     R5,     L_6419                  ; 62CE   0004 0164 0019
        JSR     R5,     L_5BE4                  ; 62D1   0004 0158 03E4

        MVI     G_0165, R0                      ; 62D4   0280 0165
        TSTR    R0                              ; 62D6   0080
        BNEQ    L_6249                          ; 62D7   022C 008F

        JSR     R5,     L_5A9F                  ; 62D9   0004 0158 029F
        JSR     R5,     L_598D                  ; 62DC   0004 0158 018D

        B       L_6249                          ; 62DF   0220 0097

L_62E1:
        JSR     R5,     .EXEC.A61               ; 62E1   0004 0118 0261

        COMR    R6                              ; 62E4   001E
        CLRR    R1                              ; 62E5   01C9
        MVI     G_0170, R2                      ; 62E6   0282 0170
        MOVR    R2,     R3                      ; 62E8   0093
        CMPI    #$0002, R2                      ; 62E9   037A 0002
        BMI     L_62F0                          ; 62EB   020B 0003

        ADDI    #$01D5, R3                      ; 62ED   02FB 01D5
        MVO@    R1,     R3                      ; 62EF   0259
L_62F0:
        MVII    #$01E7, R4                      ; 62F0   02BC 01E7
        CLRR    R2                              ; 62F2   01D2
        MVI@    R4,     R0                      ; 62F3   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 62F4   0004 0114 0268

        MOVR    R0,     R3                      ; 62F7   0083
L_62F8:
        INCR    R2                              ; 62F8   000A
        CMP     G_015F, R2                      ; 62F9   0342 015F
        BEQ     L_6308                          ; 62FB   0204 000B

        MVI@    R4,     R0                      ; 62FD   02A0

        JSR     R5,     X_EXT_SIGN_LO           ; 62FE   0004 0114 0268

        CMPR    R3,     R0                      ; 6301   0158
        BMI     L_62F8                          ; 6302   022B 000B

        MOVR    R0,     R3                      ; 6304   0083
        MOVR    R2,     R1                      ; 6305   0091
        B       L_62F8                          ; 6306   0220 000F

L_6308:
        MOVR    R1,     R3                      ; 6308   008B
        ADDI    #$01EB, R1                      ; 6309   02F9 01EB
        MVI@    R1,     R0                      ; 630B   0288
        ADD     G_01E6, R0                      ; 630C   02C0 01E6
        MVO@    R0,     R1                      ; 630E   0248
        MVII    #$0006, R0                      ; 630F   02B8 0006
        MVII    #$01E5, R4                      ; 6311   02BC 01E5

        JSR     R5,     X_FILL_ZERO             ; 6313   0004 0114 0338
        DECLE   $0004,  $0158,  $03F7           ; 6316   0004 0158 03F7

        MVI     G_016A, R0                      ; 6319   0280 016A
        DECR    R0                              ; 631B   0010
        MVO     R0,     G_016A                  ; 631C   0240 016A
        BEQ     L_61BE                          ; 631E   0224 0161

        MVO     R3,     G_0165                  ; 6320   0243 0165
        TSTR    R3                              ; 6322   009B
        BEQ     L_6447                          ; 6323   0204 0122

        JSR     R5,     L_6492                  ; 6325   0004 0164 0092

        CLRR    R1                              ; 6328   01C9

        JSR     R5,     L_66A7                  ; 6329   0004 0164 02A7

        MVO     R1,     G_01E6                  ; 632C   0241 01E6
        MVII    #$00FF, R3                      ; 632E   02BB 00FF
        MVO     R3,     G_0179                  ; 6330   0243 0179

        JSR     R5,     L_59CC                  ; 6332   0004 0158 01CC

        MOVR    R3,     R0                      ; 6335   0098

        JSR     R5,     L_59CC                  ; 6336   0004 0158 01CC

        ADDR    R3,     R0                      ; 6339   00D8
        SUBI    #$0004, R4                      ; 633A   033C 0004
        CMP     G_016A, R0                      ; 633C   0340 016A
        BEQ     L_634E                          ; 633E   0204 000E

        CMPI    #$0005, R3                      ; 6340   037B 0005
        BPL     L_634E                          ; 6342   0203 000A

        SDBD                                    ; 6344   0001
        MVI@    R4,     R3                      ; 6345   02A3
        SDBD                                    ; 6346   0001
        ANDI    #$1C00, R3                      ; 6347   03BB 0000 001C
        BNEQ    L_634F                          ; 634A   020C 0003

        SUBI    #$0002, R4                      ; 634C   033C 0002
L_634E:
        INCR    R7                              ; 634E   000F

L_634F:
        INCR    R1                              ; 634F   0009
L_6350:
        CMPI    #$0004, R1                      ; 6350   0379 0004
        BEQ     L_6386                          ; 6352   0204 0032

        CMPI    #$0001, R1                      ; 6354   0379 0001
        BNEQ    L_6366                          ; 6356   020C 000E

        JSR     R5,     L_59CC                  ; 6358   0004 0158 01CC

        CMP     G_016A, R3                      ; 635B   0343 016A
        BEQ     L_6364                          ; 635D   0204 0005

        MVI     G_01EF, R3                      ; 635F   0283 01EF
        TSTR    R3                              ; 6361   009B
        BEQ     L_634F                          ; 6362   0224 0014

L_6364:
        SUBI    #$0002, R4                      ; 6364   033C 0002
L_6366:
        SDBD                                    ; 6366   0001
        MVI@    R4,     R3                      ; 6367   02A3
        CLRR    R0                              ; 6368   01C0
        INCR    R7                              ; 6369   000F

L_636A:
        INCR    R0                              ; 636A   0008
L_636B:
        TSTR    R3                              ; 636B   009B
        BEQ     L_634F                          ; 636C   0224 001E

        SARC    R3,     1                       ; 636E   007B
        BNC     L_636A                          ; 636F   0229 0006

        JSR     R5,     L_6471                  ; 6371   0004 0164 0071

        PSHR    R2                              ; 6374   0272

        JSR     R5,     L_6480                  ; 6375   0004 0164 0080

        PULR    R5                              ; 6378   02B5
        SUBR    R2,     R5                      ; 6379   0115
        CMP     G_0179, R5                      ; 637A   0345 0179
        BPL     L_636A                          ; 637C   0223 0013

        MVO     R5,     G_0179                  ; 637E   0245 0179
        MVO     R1,     G_0170                  ; 6380   0241 0170
        MVO     R0,     G_016F                  ; 6382   0240 016F
        B       L_636A                          ; 6384   0220 001B

L_6386:
        MVI     G_016F, R1                      ; 6386   0281 016F
        MVI     G_0170, R2                      ; 6388   0282 0170
        CMPI    #$0003, R2                      ; 638A   037A 0003
        BNEQ    L_6393                          ; 638C   020C 0005

        MVI     G_01D8, R5                      ; 638E   0285 01D8
        TSTR    R5                              ; 6390   00AD
        BNEQ    L_639A                          ; 6391   020C 0007

L_6393:
        MVII    #$01E7, R4                      ; 6393   02BC 01E7
        ADD     G_0165, R4                      ; 6395   02C4 0165
        MVO@    R1,     R4                      ; 6397   0261
        B       L_62CE                          ; 6398   0220 00CB

L_639A:
        MVII    #$0010, R4                      ; 639A   02BC 0010
        MVO     R4,     G_016F                  ; 639C   0244 016F

        JSR     R5,     L_66A8                  ; 639E   0004 0164 02A8

        SDBD                                    ; 63A1   0001
        MVI@    R4,     R1                      ; 63A2   02A1
L_63A3:
        MVI     G_01E6, R4                      ; 63A3   0284 01E6
        TSTR    R4                              ; 63A5   00A4
        BNEQ    L_62A0                          ; 63A6   022C 0107

        TSTR    R2                              ; 63A8   0092
        BEQ     L_63B3                          ; 63A9   0204 0008

L_63AB:
        MVII    #$0010, R4                      ; 63AB   02BC 0010
L_63AD:
        DECR    R4                              ; 63AD   0014
        SLLC    R1,     1                       ; 63AE   0059
        BNC     L_63AD                          ; 63AF   0229 0003
        B       L_62C8                          ; 63B1   0220 00EA

L_63B3:
        MOVR    R1,     R4                      ; 63B3   008C
        SDBD                                    ; 63B4   0001
        ANDI    #$0400, R4                      ; 63B5   03BC 0000 0004
        BEQ     L_63AB                          ; 63B8   0224 000E

        MVI     G_016F, R4                      ; 63BA   0284 016F
        CMPI    #$000A, R4                      ; 63BC   037C 000A
        BPL     L_63C6                          ; 63BE   0203 0006

        SDBD                                    ; 63C0   0001
        XORI    #$0400, R1                      ; 63C1   03F9 0000 0004
        BNEQ    L_63AB                          ; 63C4   022C 001A

L_63C6:
        MVII    #$000A, R0                      ; 63C6   02B8 000A
        B       L_62C5                          ; 63C8   0220 0104

L_63CA:
        SUBR    R2,     R3                      ; 63CA   0113
        SUBR    R2,     R3                      ; 63CB   0113
        MOVR    R3,     R4                      ; 63CC   009C

        JSR     R5,     L_6531                  ; 63CD   0004 0164 0131

        MVI     G_0170, R3                      ; 63D0   0283 0170
        ADDI    #$017C, R3                      ; 63D2   02FB 017C
        MVI@    R3,     R4                      ; 63D4   029C
        CMPI    #$000F, R4                      ; 63D5   037C 000F
        BPL     L_63DC                          ; 63D7   0203 0003

        ADDI    #$0010, R4                      ; 63D9   02FC 0010
        MVO@    R4,     R3                      ; 63DB   025C
L_63DC:
        MVII    #$00FF, R3                      ; 63DC   02BB 00FF
        MVII    #$01E7, R4                      ; 63DE   02BC 01E7
        ADD     G_0165, R4                      ; 63E0   02C4 0165
        MVO@    R3,     R4                      ; 63E2   0263
        B       L_62CE                          ; 63E3   0220 0116

        DECR    R5                              ; 63E5   0015
        DECR    R5                              ; 63E6   0015
        DECR    R6                              ; 63E7   0016
L_63E8:
        DECR    R7                              ; 63E8   0017

        DECLE   $0018,  $001E,  $001F,  $0020   ; 63E9   0018 001E 001F 0020
        DECLE   $0023,  $0028,  $0064,  $0062   ; 63ED   0023 0028 0064 0062
        DECLE   $0063,  $001E,  $001F,  $0020   ; 63F1   0063 001E 001F 0020
        DECLE   $0021,  $0022,  $0028,  $0029   ; 63F5   0021 0022 0028 0029
        DECLE   $002A,  $0034,  $003B,  $0042   ; 63F9   002A 0034 003B 0042
        DECLE   $0044,  $0046,  $0019,  $001A   ; 63FD   0044 0046 0019 001A
        DECLE   $001B,  $001C,  $001D,  $0023   ; 6401   001B 001C 001D 0023
        DECLE   $0024,  $0028,  $0032,  $003C   ; 6405   0024 0028 0032 003C
        DECLE   $003E,  $003F                   ; 6409   003E 003F

        SWAP    R0,     1                       ; 640B   0040
        COMR    R2                              ; 640C   001A
        COMR    R3                              ; 640D   001B
        COMR    R4                              ; 640E   001C
        COMR    R5                              ; 640F   001D
        COMR    R6                              ; 6410   001E
        NEGR    R4                              ; 6411   0024
        NEGR    R5                              ; 6412   0025
        ADCR    R1                              ; 6413   0029
        GSWD    R3                              ; 6414   0033
        RSWD    R5                              ; 6415   003D
        SWAP    R1,     1                       ; 6416   0041
        SWAP    R3,     1                       ; 6417   0043
        SWAP    R1,     2                       ; 6418   0045
L_6419:
        PSHR    R5                              ; 6419   0275
        MOVR    R2,     R3                      ; 641A   0093
        ADDI    #$017C, R3                      ; 641B   02FB 017C
        MVI@    R3,     R0                      ; 641D   0298
        DECR    R0                              ; 641E   0010
        MVO@    R0,     R3                      ; 641F   0258

        JSR     R5,     L_66A8                  ; 6420   0004 0164 02A8

        MOVR    R1,     R0                      ; 6423   0088

        JSR     R5,     X_POW2                  ; 6424   0004 0114 0345

        SDBD                                    ; 6427   0001
        MVI@    R4,     R5                      ; 6428   02A5
        XORR    R5,     R0                      ; 6429   01E8
        MOVR    R3,     R4                      ; 642A   009C
        MVO@    R0,     R4                      ; 642B   0260
        SWAP    R0,     1                       ; 642C   0040
        MVO@    R0,     R4                      ; 642D   0260
        MVI     G_01E6, R0                      ; 642E   0280 01E6
        CMPI    #$0001, R2                      ; 6430   037A 0001
        BNEQ    L_6435                          ; 6432   020C 0001

        INCR    R0                              ; 6434   0008
L_6435:
        TSTR    R2                              ; 6435   0092
        BNEQ    L_6440                          ; 6436   020C 0008

        CMPI    #$000A, R1                      ; 6438   0379 000A
        BNEQ    L_6440                          ; 643A   020C 0004

        ADDI    #$000D, R0                      ; 643C   02F8 000D
        MVO     R0,     .BTAB.00                ; 643E   0240 0200
L_6440:
        MVO     R0,     G_01E6                  ; 6440   0240 01E6
        TSTR    R0                              ; 6442   0080
        BEQ     L_6447                          ; 6443   0204 0002

        MVO     R0,     G_01EF                  ; 6445   0240 01EF
L_6447:
        PULR    R7                              ; 6447   02B7

L_6448:
        PSHR    R5                              ; 6448   0275
        MVII    #$0003, R1                      ; 6449   02B9 0003
        CLRR    R2                              ; 644B   01D2
L_644C:
        MOVR    R2,     R5                      ; 644C   0095
        ADDI    #$0160, R5                      ; 644D   02FD 0160
        MVI@    R5,     R0                      ; 644F   02A8
        MOVR    R2,     R3                      ; 6450   0093
        SDBD                                    ; 6451   0001
        ADDI    #$646D, R3                      ; 6452   02FB 006D 0064
        MVI@    R3,     R3                      ; 6455   029B
        SDBD                                    ; 6456   0001
        ADDI    #$2400, R3                      ; 6457   02FB 0000 0024
        MOVR    R2,     R5                      ; 645A   0095
        SDBD                                    ; 645B   0001
        ADDI    #$6469, R5                      ; 645C   02FD 0069 0064
        MVI@    R5,     R4                      ; 645F   02AC

        JSR     R5,     X_PRNUM_RGT             ; 6460   0004 0118 00C5

        INCR    R2                              ; 6463   000A
        CMP     G_015F, R2                      ; 6464   0342 015F
        BNEQ    L_644C                          ; 6466   022C 001B
        PULR    R7                              ; 6468   02B7

        DECLE   $0214,  $0218,  $021F,  $0223   ; 6469   0214 0218 021F 0223
        DECLE   $0007,  $0001,  $0002,  $0005   ; 646D   0007 0001 0002 0005
L_6471:
        PSHR    R5                              ; 6471   0275
        PSHR    R1                              ; 6472   0271
        PSHR    R0                              ; 6473   0270
        MVII    #$000D, R0                      ; 6474   02B8 000D

        JSR     R5,     X_MPY                   ; 6476   0004 011C 01DC

        PULR    R0                              ; 6479   02B0
        PULR    R1                              ; 647A   02B1
        ADDR    R0,     R2                      ; 647B   00C2
        ADDI    #$01A3, R2                      ; 647C   02FA 01A3
        MVI@    R2,     R2                      ; 647E   0292
        PULR    R7                              ; 647F   02B7

L_6480:
        MVI     G_016A, R2                      ; 6480   0282 016A
        CMPI    #$0006, R2                      ; 6482   037A 0006
        BPL     L_6488                          ; 6484   0203 0002

        CLRR    R2                              ; 6486   01D2
        MOVR    R5,     R7                      ; 6487   00AF

L_6488:
        MVI     G_0165, R2                      ; 6488   0282 0165
        SLL     R2,     2                       ; 648A   004E
        SUBI    #$0004, R2                      ; 648B   033A 0004
        ADDR    R1,     R2                      ; 648D   00CA
        ADDI    #$01D9, R2                      ; 648E   02FA 01D9
        MVI@    R2,     R2                      ; 6490   0292
        MOVR    R5,     R7                      ; 6491   00AF

L_6492:
        PSHR    R5                              ; 6492   0275

        JSR     R5,     L_6570                  ; 6493   0004 0164 0170

        MVI     .BTAB.00,R0                     ; 6496   0280 0200
        BEQ     L_64A1                          ; 6498   0204 0007

        MVII    #$0043, R3                      ; 649A   02BB 0043
        MVO     R3,     G_01AE                  ; 649C   0243 01AE
        INCR    R3                              ; 649E   000B
        MVO     R3,     G_01AF                  ; 649F   0243 01AF
L_64A1:
        CLRR    R2                              ; 64A1   01D2
        CLRR    R0                              ; 64A2   01C0
        MVO     R0,     .BTAB.02                ; 64A3   0240 0202
        MVO     R0,     .BTAB.03                ; 64A5   0240 0203
        MVII    #$01EB, R4                      ; 64A7   02BC 01EB
L_64A9:
        MVI@    R4,     R1                      ; 64A9   02A1
        TSTR    R1                              ; 64AA   0089
        BEQ     L_64AF                          ; 64AB   0204 0002

        INCR    R0                              ; 64AD   0008
        ADDR    R1,     R2                      ; 64AE   00CA
L_64AF:
        CMPI    #$01EF, R4                      ; 64AF   037C 01EF
        BNEQ    L_64A9                          ; 64B1   022C 0009

        CMPI    #$0001, R0                      ; 64B3   0378 0001
        BNEQ    L_64F4                          ; 64B5   020C 003D

        CMPI    #$0003, R2                      ; 64B7   037A 0003
        BMI     L_64F4                          ; 64B9   020B 0039

        CMP     G_01EB, R2                      ; 64BB   0342 01EB
        BEQ     L_64CD                          ; 64BD   0204 000E

        CMPI    #$0006, R2                      ; 64BF   037A 0006
        BMI     L_64F4                          ; 64C1   020B 0031

        MVI     G_0165, R3                      ; 64C3   0283 0165
        ADDI    #$01EB, R3                      ; 64C5   02FB 01EB
        MVI@    R3,     R3                      ; 64C7   029B
        CMPR    R2,     R3                      ; 64C8   0153
        BNEQ    L_64F4                          ; 64C9   020C 0029

        MVO     R2,     .BTAB.03                ; 64CB   0242 0203
L_64CD:
        MVO     R2,     .BTAB.02                ; 64CD   0242 0202
        MVII    #$01A3, R3                      ; 64CF   02BB 01A3
L_64D1:
        PSHR    R3                              ; 64D1   0273
        MVII    #$0006, R0                      ; 64D2   02B8 0006
        MOVR    R3,     R2                      ; 64D4   009A
        ADDI    #$000C, R2                      ; 64D5   02FA 000C
L_64D7:
        MVI@    R2,     R1                      ; 64D7   0291
        MVI@    R3,     R4                      ; 64D8   029C
        MVO@    R4,     R2                      ; 64D9   0254
        MVO@    R1,     R3                      ; 64DA   0259
        INCR    R3                              ; 64DB   000B
        DECR    R2                              ; 64DC   0012
        DECR    R0                              ; 64DD   0010
        BNEQ    L_64D7                          ; 64DE   022C 0008

        PULR    R3                              ; 64E0   02B3
        ADDI    #$000D, R3                      ; 64E1   02FB 000D
        CMPI    #$01D7, R3                      ; 64E3   037B 01D7
        BNEQ    L_64D1                          ; 64E5   022C 0015

        MVI     .BTAB.03,R2                     ; 64E7   0282 0203
        BNEQ    L_6447                          ; 64E9   022C 00A3

        MVII    #$0066, R3                      ; 64EB   02BB 0066
        MVII    #$01AD, R4                      ; 64ED   02BC 01AD
        MVO@    R3,     R4                      ; 64EF   0263
        DECR    R3                              ; 64F0   0013
        MVO@    R3,     R4                      ; 64F1   0263
        MVO@    R3,     R4                      ; 64F2   0263
        PULR    R7                              ; 64F3   02B7

L_64F4:
        MVI     G_01E5, R3                      ; 64F4   0283 01E5
        TSTR    R3                              ; 64F6   009B
        BNEQ    L_6447                          ; 64F7   022C 00B1

        JSR     R5,     L_66A7                  ; 64F9   0004 0164 02A7

        CLRR    R0                              ; 64FC   01C0
        MVII    #$017C, R2                      ; 64FD   02BA 017C

L_64FF:
        JSR     R5,     L_59CC                  ; 64FF   0004 0158 01CC

        MVI@    R2,     R1                      ; 6502   0291
        ANDI    #$000F, R1                      ; 6503   03B9 000F
        CMPR    R1,     R3                      ; 6505   014B
        BNEQ    L_650B                          ; 6506   020C 0003

        JSR     R5,     L_651A                  ; 6508   0004 0164 011A

L_650B:
        MVI@    R2,     R1                      ; 650B   0291
        CMPI    #$0010, R1                      ; 650C   0379 0010
        BMI     L_6513                          ; 650E   020B 0003

        JSR     R5,     L_651A                  ; 6510   0004 0164 011A

L_6513:
        INCR    R2                              ; 6513   000A
        INCR    R0                              ; 6514   0008
        CMPI    #$0004, R0                      ; 6515   0378 0004
        BNEQ    L_64FF                          ; 6517   022C 0019
        PULR    R7                              ; 6519   02B7

L_651A:
        PSHR    R5                              ; 651A   0275
        PSHR    R0                              ; 651B   0270
        PSHR    R2                              ; 651C   0272
        MVII    #$000D, R1                      ; 651D   02B9 000D

        JSR     R5,     X_MPY                   ; 651F   0004 011C 01DC

        ADDI    #$01A3, R2                      ; 6522   02FA 01A3
        MVII    #$000D, R1                      ; 6524   02B9 000D
L_6526:
        MVI@    R2,     R0                      ; 6526   0290
        ADDI    #$000D, R0                      ; 6527   02F8 000D
        MVO@    R0,     R2                      ; 6529   0250
        INCR    R2                              ; 652A   000A
        DECR    R1                              ; 652B   0011
        BNEQ    L_6526                          ; 652C   022C 0007

        PULR    R2                              ; 652E   02B2
        PULR    R0                              ; 652F   02B0
        PULR    R7                              ; 6530   02B7

L_6531:
        PSHR    R5                              ; 6531   0275
        CLRR    R1                              ; 6532   01C9
        MVO     R1,     G_0179                  ; 6533   0241 0179
        INCR    R7                              ; 6535   000F

L_6536:
        INCR    R1                              ; 6536   0009
L_6537:
        CMPI    #$0004, R1                      ; 6537   0379 0004
        BEQ     L_656B                          ; 6539   0204 0030

        SDBD                                    ; 653B   0001
        MVI@    R4,     R3                      ; 653C   02A3
        CLRR    R0                              ; 653D   01C0
        INCR    R7                              ; 653E   000F

L_653F:
        INCR    R0                              ; 653F   0008
L_6540:
        TSTR    R3                              ; 6540   009B
        BEQ     L_6536                          ; 6541   0224 000C

        SARC    R3,     1                       ; 6543   007B
        BNC     L_653F                          ; 6544   0229 0006

        JSR     R5,     L_6471                  ; 6546   0004 0164 0071

        PSHR    R2                              ; 6549   0272

        JSR     R5,     L_6480                  ; 654A   0004 0164 0080

        PULR    R5                              ; 654D   02B5
        ADDR    R5,     R2                      ; 654E   00EA
        CMP     G_0179, R2                      ; 654F   0342 0179
        BMI     L_653F                          ; 6551   022B 0013

        MVI     G_01D7, R5                      ; 6553   0285 01D7
        TSTR    R5                              ; 6555   00AD
        BEQ     L_6563                          ; 6556   0204 000B

        CMPI    #$0001, R1                      ; 6558   0379 0001
        BEQ     L_6536                          ; 655A   0224 0025

        TSTR    R1                              ; 655C   0089
        BNEQ    L_6563                          ; 655D   020C 0004

        CMPI    #$000A, R0                      ; 655F   0378 000A
        BEQ     L_653F                          ; 6561   0224 0023

L_6563:
        MVO     R2,     G_0179                  ; 6563   0242 0179
        MVO     R1,     G_017A                  ; 6565   0241 017A
        MVO     R0,     G_017B                  ; 6567   0240 017B
        B       L_653F                          ; 6569   0220 002B

L_656B:
        MVI     G_017A, R2                      ; 656B   0282 017A
        MVI     G_017B, R1                      ; 656D   0281 017B
        PULR    R7                              ; 656F   02B7

L_6570:
        PSHR    R5                              ; 6570   0275
        MVII    #$0034, R0                      ; 6571   02B8 0034
        SDBD                                    ; 6573   0001
        MVII    #$63E5, R4                      ; 6574   02BC 00E5 0063
        MVII    #$01A3, R1                      ; 6577   02B9 01A3

        JSR     R5,     .EXEC.731               ; 6579   0004 0114 0331

L_657C:
        PSHR    R5                              ; 657C   0275
        MVII    #$01D9, R1                      ; 657D   02B9 01D9
        MVII    #$0189, R4                      ; 657F   02BC 0189

L_6581:
        JSR     R5,     L_59CC                  ; 6581   0004 0158 01CC

        MVII    #$0014, R0                      ; 6584   02B8 0014
        DECR    R3                              ; 6586   0013
        BEQ     L_658E                          ; 6587   0204 0005

        SLR     R0,     1                       ; 6589   0060
        DECR    R3                              ; 658A   0013
        BEQ     L_658E                          ; 658B   0204 0001

        CLRR    R0                              ; 658D   01C0
L_658E:
        MVO@    R0,     R1                      ; 658E   0248
        INCR    R1                              ; 658F   0009
        CMPI    #$01E5, R1                      ; 6590   0379 01E5
        BNEQ    L_6581                          ; 6592   022C 0012
        PULR    R7                              ; 6594   02B7

L_6595:
        MVI     .BTAB.12,R0                     ; 6595   0280 0212
        TSTR    R0                              ; 6597   0080
        BEQ     L_6677                          ; 6598   0204 00DD

        MVII    #$02BE, R4                      ; 659A   02BC 02BE
        SDBD                                    ; 659C   0001
        MVII    #$2207, R3                      ; 659D   02BB 0007 0022
        DECR    R0                              ; 65A0   0010
        SLL     R0,     1                       ; 65A1   0048
        MOVR    R0,     R1                      ; 65A2   0081
        SLL     R1,     1                       ; 65A3   0049
        ADDR    R0,     R1                      ; 65A4   00C1
        SDBD                                    ; 65A5   0001
        ADDI    #$6694, R1                      ; 65A6   02F9 0094 0066

        JSR     R5,     X_PRINT_R1              ; 65A9   0004 0118 0067

        MVII    #$02B9, R4                      ; 65AC   02BC 02B9

        JSR     R5,     X_PRINT_R5              ; 65AE   0004 0118 007B
        STRING  "PASS "                         ; 65B1  
        DECLE   $0000                           ; 65B6   0000

        MVII    #$0010, R0                      ; 65B7   02B8 0010
        MVII    #$0200, R4                      ; 65B9   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 65BB   0004 0114 0338

        CLRR    R1                              ; 65BE   01C9
L_65BF:
        INCR    R1                              ; 65BF   0009
        CMP     G_015F, R1                      ; 65C0   0341 015F
        BEQ     L_65EC                          ; 65C2   0204 0028

        MVO     R1,     G_0165                  ; 65C4   0241 0165

        JSR     R5,     L_6604                  ; 65C6   0004 0164 0204
        JSR     R5,     L_6604                  ; 65C9   0004 0164 0204

        MVII    #$0001, R2                      ; 65CC   02BA 0001

        JSR     R5,     L_66A8                  ; 65CE   0004 0164 02A8

        SDBD                                    ; 65D1   0001
        MVI@    R4,     R1                      ; 65D2   02A1
        TSTR    R1                              ; 65D3   0089
        BEQ     L_65FD                          ; 65D4   0204 0027

        CLRR    R0                              ; 65D6   01C0
        INCR    R7                              ; 65D7   000F

L_65D8:
        INCR    R0                              ; 65D8   0008
L_65D9:
        SARC    R1,     1                       ; 65D9   0079
        BNC     L_65D8                          ; 65DA   0229 0003

        JSR     R5,     X_POW2                  ; 65DC   0004 0114 0345
        JSR     R5,     L_6008                  ; 65DF   0004 0160 0008

        MVI     G_0165, R1                      ; 65E2   0281 0165
        MOVR    R1,     R2                      ; 65E4   008A
        SLL     R2,     2                       ; 65E5   004E
        ADDI    #$0201, R2                      ; 65E6   02FA 0201
        ADD@    R2,     R0                      ; 65E8   02D0
        MVO@    R0,     R2                      ; 65E9   0250
        B       L_65BF                          ; 65EA   0220 002C

L_65EC:
        CLRR    R0                              ; 65EC   01C0
        MVO     R0,     G_0165                  ; 65ED   0240 0165
        MVII    #$0003, R0                      ; 65EF   02B8 0003
        MVO     R0,     .BTAB.11                ; 65F1   0240 0211

        JSR     R5,     .EXEC.A61               ; 65F3   0004 0118 0261

        DECR    R4                              ; 65F6   0014

        JSR     R5,     L_5A9F                  ; 65F7   0004 0158 029F
        JSR     R5,     L_595D                  ; 65FA   0004 0158 015D
L_65FD:
        JSR     R5,     L_6604                  ; 65FD   0004 0164 0204

        MVI     G_0165, R1                      ; 6600   0281 0165
        B       L_65BF                          ; 6602   0220 0044

L_6604:
        PSHR    R5                              ; 6604   0275

        JSR     R5,     L_66A7                  ; 6605   0004 0164 02A7
        JSR     R5,     L_6531                  ; 6608   0004 0164 0131

        MOVR    R1,     R0                      ; 660B   0088

        JSR     R5,     L_6610                  ; 660C   0004 0164 0210

L_660F:
        PSHR    R5                              ; 660F   0275

L_6610:
        JSR     R5,     X_POW2                  ; 6610   0004 0114 0345
        JSR     R5,     L_6008                  ; 6613   0004 0160 0008

        MVI     G_0165, R3                      ; 6616   0283 0165
        SLL     R3,     2                       ; 6618   004F
        ADDI    #$0200, R3                      ; 6619   02FB 0200
        ADDR    R3,     R2                      ; 661B   00DA
        ADD@    R2,     R0                      ; 661C   02D0
        MVO@    R0,     R2                      ; 661D   0250
L_661E:
        PULR    R7                              ; 661E   02B7

L_661F:
        DECR    R5                              ; 661F   0015
        MVO     R5,     .BTAB.11                ; 6620   0245 0211
        MOVR    R1,     R2                      ; 6622   008A
        DECR    R0                              ; 6623   0010
        BPL     L_6628                          ; 6624   0203 0002

        MVII    #$000C, R0                      ; 6626   02B8 000C

L_6628:
        JSR     R5,     L_660F                  ; 6628   0004 0164 020F
        JSR     R5,     L_5D22                  ; 662B   0004 015C 0122
        JSR     R5,     L_5A9F                  ; 662E   0004 0158 029F
        JSR     R5,     L_598D                  ; 6631   0004 0158 018D

        MVI     .BTAB.11,R3                     ; 6634   0283 0211
        TSTR    R3                              ; 6636   009B
        BNEQ    L_661E                          ; 6637   022C 001A

        MVI     G_016A, R0                      ; 6639   0280 016A
        ADDI    #$0003, R0                      ; 663B   02F8 0003
        MVO     R0,     G_016A                  ; 663D   0240 016A

L_663F:
        JSR     R5,     L_66A7                  ; 663F   0004 0164 02A7

        MVI     .BTAB.12,R1                     ; 6642   0281 0212
        SDBD                                    ; 6644   0001
        ADDI    #$6690, R1                      ; 6645   02F9 0090 0066
        MVI@    R1,     R0                      ; 6648   0288

        JSR     R5,     X_EXT_SIGN_LO           ; 6649   0004 0114 0268

        ADD     G_0165, R0                      ; 664C   02C0 0165
        BPL     L_6653                          ; 664E   0203 0003

        MVI     G_015F, R0                      ; 6650   0280 015F
        DECR    R0                              ; 6652   0010
L_6653:
        CMP     G_015F, R0                      ; 6653   0340 015F
        BNEQ    L_6658                          ; 6655   020C 0001

        CLRR    R0                              ; 6657   01C0
L_6658:
        ANDI    #$0003, R0                      ; 6658   03B8 0003
        SLL     R0,     2                       ; 665A   004C
        ADDI    #$0200, R0                      ; 665B   02F8 0200
        MOVR    R0,     R5                      ; 665D   0085
        MVII    #$0004, R2                      ; 665E   02BA 0004
L_6660:
        SDBD                                    ; 6660   0001
        MVI@    R4,     R0                      ; 6661   02A0
        ADD@    R5,     R0                      ; 6662   02E8
        SUBI    #$0002, R4                      ; 6663   033C 0002
        MVO@    R0,     R4                      ; 6665   0260
        SWAP    R0,     1                       ; 6666   0040
        MVO@    R0,     R4                      ; 6667   0260
        DECR    R2                              ; 6668   0012
        BNEQ    L_6660                          ; 6669   022C 000A

        MVI     G_0165, R0                      ; 666B   0280 0165
        INCR    R0                              ; 666D   0008
        MVO     R0,     G_0165                  ; 666E   0240 0165
        CMP     G_015F, R0                      ; 6670   0340 015F
        BNEQ    L_663F                          ; 6672   022C 0034

        JSR     R5,     L_657C                  ; 6674   0004 0164 017C

L_6677:
        MVI     .BTAB.12,R0                     ; 6677   0280 0212
        INCR    R0                              ; 6679   0008
        CMP     G_015F, R0                      ; 667A   0340 015F
        BMI     L_667F                          ; 667C   020B 0001

        CLRR    R0                              ; 667E   01C0
L_667F:
        MVO     R0,     .BTAB.12                ; 667F   0240 0212

        JSR     R5,     L_5217                  ; 6681   0004 0150 0217
        JSR     R5,     L_5A9F                  ; 6684   0004 0158 029F
        JSR     R5,     L_595C                  ; 6687   0004 0158 015C
        JSR     R5,     L_598D                  ; 668A   0004 0158 018D

        J       L_6226                          ; 668D   0004 0360 0226

        DECLE   $0000,  $00FF,  $0001,  $0002   ; 6690   0000 00FF 0001 0002
        DECLE   $004C,  $0045,  $0046,  $0054   ; 6694   004C 0045 0046 0054
        DECLE   $0020,  $0000,  $0052,  $0049   ; 6698   0020 0000 0052 0049
        DECLE   $0047,  $0048,  $0054,  $0000   ; 669C   0047 0048 0054 0000
        DECLE   $0041,  $0043,  $0052,  $004F   ; 66A0   0041 0043 0052 004F
        DECLE   $0053,  $0053,  $0000           ; 66A4   0053 0053 0000
L_66A7:
        CLRR    R2                              ; 66A7   01D2
L_66A8:
        MVI     G_0165, R3                      ; 66A8   0283 0165
        SLL     R3,     2                       ; 66AA   004F
        SLL     R3,     1                       ; 66AB   004B
        ADDI    #$0181, R3                      ; 66AC   02FB 0181
        ADDR    R2,     R3                      ; 66AE   00D3
        ADDR    R2,     R3                      ; 66AF   00D3
        MOVR    R3,     R4                      ; 66B0   009C
        MOVR    R5,     R7                      ; 66B1   00AF

L_66B2:
        JSR     R5,     L_51DA                  ; 66B2   0004 0150 01DA
        BIDECLE $2400                           ; 66B5   0000 0024

        JSR     R5,     .EXEC.7B3               ; 66B7   0004 0114 03B3
        JSR     R5,     L_52FB                  ; 66BA   0004 0150 02FB
        JSR     R5,     L_5B0C                  ; 66BD   0004 0158 030C

        MVI     G_015E, R1                      ; 66C0   0281 015E
        DECR    R1                              ; 66C2   0011
        BNEQ    L_6703                          ; 66C3   020C 003E

        MVII    #$0014, R0                      ; 66C5   02B8 0014
        MVII    #$016A, R4                      ; 66C7   02BC 016A
        MVI     G_015F, R1                      ; 66C9   0281 015F
L_66CB:
        ADD@    R4,     R0                      ; 66CB   02E0
        DECR    R1                              ; 66CC   0011
        BNEQ    L_66CB                          ; 66CD   022C 0003

L_66CF:
        MVII    #$0160, R1                      ; 66CF   02B9 0160
        ADD     G_0165, R1                      ; 66D1   02C1 0165
        ADD@    R1,     R0                      ; 66D3   02C8
        MVO@    R0,     R1                      ; 66D4   0248

L_66D5:
        JSR     R5,     L_6448                  ; 66D5   0004 0164 0048
        JSR     R5,     L_6728                  ; 66D8   0004 0164 0328

        MVI     G_0165, R0                      ; 66DB   0280 0165
        TSTR    R0                              ; 66DD   0080
        BNEQ    L_671B                          ; 66DE   020C 003B

        JSR     R5,     X_PLAY_MUS1             ; 66E0   0004 0118 0327
        DECLE   $010A                           ; 66E3  Note (short)
        DECLE   $00F8                           ; 66E4  Note (short)
        DECLE   $00EE                           ; 66E5  Note (short)
        DECLE   $023A                           ; 66E6  Note (short)
        DECLE   $0218                           ; 66E7  Note (short)
        DECLE   $01FE                           ; 66E8  Note (short)
        DECLE   $01AE                           ; 66E9  Note (short)
        DECLE   $01FD                           ; 66EA  Note (short)
        DECLE   $0000                           ; 66EB  End of music
L_66EC:
        JSR     R5,     .EXEC.A61               ; 66EC   0004 0118 0261

        INCR    R2                              ; 66EF   000A
        SDBD                                    ; 66F0   0001
        MVII    #$5175, R2                      ; 66F1   02BA 0075 0051
        MVO     R2,     G_035D                  ; 66F4   0242 035D
        MVI     G_0354, R0                      ; 66F6   0280 0354
        INCR    R0                              ; 66F8   0008
        CMP     G_015F, R0                      ; 66F9   0340 015F
        BNEQ    L_66FE                          ; 66FB   020C 0001

        CLRR    R0                              ; 66FD   01C0
L_66FE:
        MVO     R0,     G_0354                  ; 66FE   0240 0354
        MVO     R0,     G_0165                  ; 6700   0240 0165
        PULR    R7                              ; 6702   02B7

L_6703:
        MOVR    R1,     R3                      ; 6703   008B
        MVI     G_0165, R1                      ; 6704   0281 0165
        CMPI    #$0004, R1                      ; 6706   0379 0004
        BPL     L_670D                          ; 6708   0203 0003
        J       L_610F                          ; 670A   0004 0360 010F

L_670D:
        MVII    #$0161, R1                      ; 670D   02B9 0161
        MVII    #$0014, R0                      ; 670F   02B8 0014
L_6711:
        MVI@    R1,     R2                      ; 6711   028A
        ADDR    R0,     R2                      ; 6712   00C2
        MVO@    R2,     R1                      ; 6713   024A
        INCR    R1                              ; 6714   0009
        CMPI    #$0164, R1                      ; 6715   0379 0164
        BNEQ    L_6711                          ; 6717   022C 0007
        B       L_66D5                          ; 6719   0220 0045

L_671B:
        JSR     R5,     X_PLAY_MUS1             ; 671B   0004 0118 0327
        DECLE   $0182                           ; 671E  Note (short)
        DECLE   $01A2                           ; 671F  Note (short)
        DECLE   $0182                           ; 6720  Note (short)
        DECLE   $01D2                           ; 6721  Note (short)
        DECLE   $01F2                           ; 6722  Note (short)
        DECLE   $0212                           ; 6723  Note (short)
        DECLE   $01F3                           ; 6724  Note (short)
        DECLE   $0000                           ; 6725  End of music

        B       L_66EC                          ; 6726   0220 003B

L_6728:
        MVII    #$0160, R4                      ; 6728   02BC 0160
L_672A:
        MVI@    R4,     R0                      ; 672A   02A0
        CMPI    #$0064, R0                      ; 672B   0378 0064
        BPL     L_6734                          ; 672D   0203 0005

        CMPI    #$0164, R4                      ; 672F   037C 0164
        BMI     L_672A                          ; 6731   022B 0008
L_6733:
        MOVR    R5,     R7                      ; 6733   00AF

L_6734:
        MVI     G_0160, R0                      ; 6734   0280 0160
        MVI     G_015E, R1                      ; 6736   0281 015E
        CMPI    #$0004, R1                      ; 6738   0379 0004
        BEQ     L_677C                          ; 673A   0204 0040

        CMPI    #$0064, R0                      ; 673C   0378 0064
        BPL     L_6790                          ; 673E   0203 0050

L_6740:
        JSR     R5,     X_PLAY_MUS2             ; 6740   0004 0118 035D
        DECLE   $0077                           ; 6743  Note (short)
        DECLE   $0047                           ; 6744  Note (short)
        DECLE   $03F4,  $0097                   ; 6745  Note (long)
        DECLE   $0000                           ; 6747  End of music

        JSR     R5,     X_PLAY_SFX1             ; 6748   0004 0118 03BB
        DECLE   $0079                           ; 674B  SFX data
        DECLE   $03B7                           ; 674C  SFX data
        DECLE   $008D                           ; 674D  SFX data
        DECLE   $020B                           ; 674E  SFX data
        DECLE   $000C,  $0070                   ; 674F  SFX data
        DECLE   $016B                           ; 6751  SFX data
        DECLE   $000C,  $0068                   ; 6752  SFX data
        DECLE   $016B                           ; 6754  SFX data
        DECLE   $000C,  $0060                   ; 6755  SFX data
        DECLE   $016B                           ; 6757  SFX data
        DECLE   $000C,  $0058                   ; 6758  SFX data
        DECLE   $02EB                           ; 675A  SFX data
        DECLE   $01CF                           ; 675B  SFX end


        JSR     R5,     X_STOP_SFX              ; 675C   0004 011C 02B4
L_675F:
        JSR     R5,     .EXEC.A61               ; 675F   0004 0118 0261

        ADCR    R0                              ; 6762   0028

        JSR     R5,     L_52CF                  ; 6763   0004 0150 02CF
        JSR     R5,     L_6448                  ; 6766   0004 0164 0048

        SDBD                                    ; 6769   0001
        MVII    #$514D, R0                      ; 676A   02B8 004D 0051
        MVO     R0,     G_035D                  ; 676D   0240 035D
        MVII    #$0004, R0                      ; 676F   02B8 0004
        MVII    #$0160, R4                      ; 6771   02BC 0160

        JSR     R5,     X_FILL_ZERO             ; 6773   0004 0114 0338

        MVII    #$01EB, R4                      ; 6776   02BC 01EB

        JSR     R5,     X_FILL_ZERO             ; 6778   0004 0114 0338

        PULR    R7                              ; 677B   02B7

L_677C:
        CMPI    #$0064, R0                      ; 677C   0378 0064
        BPL     L_6740                          ; 677E   0223 003F
        B       L_6790                          ; 6780   0200 000E

        CMPI    #$000A, R0                      ; 6782   0378 000A
        BEQ     L_678D                          ; 6784   0204 0007

        CMPI    #$000B, R0                      ; 6786   0378 000B
        BNEQ    L_6733                          ; 6788   022C 0056
        J       L_510B                          ; 678A   0004 0350 010B
L_678D:
        J       .START                          ; 678D   0004 0350 003C

L_6790:
        JSR     R5,     X_PLAY_MUS1             ; 6790   0004 0118 0327
        DECLE   $01A7                           ; 6793  Note (short)
        DECLE   $01E4                           ; 6794  Note (short)
        DECLE   $01F4                           ; 6795  Note (short)
        DECLE   $0216                           ; 6796  Note (short)
        DECLE   $01E6                           ; 6797  Note (short)
        DECLE   $01C6                           ; 6798  Note (short)
        DECLE   $01A6                           ; 6799  Note (short)
        DECLE   $021E                           ; 679A  Note (short)
        DECLE   $01E6                           ; 679B  Note (short)
        DECLE   $01C6                           ; 679C  Note (short)
        DECLE   $01E6                           ; 679D  Note (short)
        DECLE   $01A6                           ; 679E  Note (short)
        DECLE   $01C7                           ; 679F  Note (short)
        DECLE   $0157                           ; 67A0  Note (short)
        DECLE   $01A7                           ; 67A1  Note (short)
        DECLE   $01E4                           ; 67A2  Note (short)
        DECLE   $01F4                           ; 67A3  Note (short)
        DECLE   $0216                           ; 67A4  Note (short)
        DECLE   $01E6                           ; 67A5  Note (short)
        DECLE   $01C6                           ; 67A6  Note (short)
        DECLE   $01A6                           ; 67A7  Note (short)
        DECLE   $0216                           ; 67A8  Note (short)
        DECLE   $01E6                           ; 67A9  Note (short)
        DECLE   $01C4                           ; 67AA  Note (short)
        DECLE   $01A4                           ; 67AB  Note (short)
        DECLE   $01C4                           ; 67AC  Note (short)
        DECLE   $01F4                           ; 67AD  Note (short)
        DECLE   $01E4                           ; 67AE  Note (short)
        DECLE   $01C4                           ; 67AF  Note (short)
        DECLE   $03F4,  $01A7                   ; 67B0  Note (long)
        DECLE   $0000                           ; 67B2  End of music

        JSR     R5,     X_PLAY_SFX1             ; 67B3   0004 0118 03BB
        DECLE   $01CF                           ; 67B6  SFX end


        B       L_675F                          ; 67B7   0220 0059

L_67B9:
        MVO     R5,     G_033C                  ; 67B9   0245 033C

        JSR     R5,     X_PLAY_SFX1             ; 67BB   0004 0118 03BB
        DECLE   $015D                           ; 67BE  SFX data
        DECLE   $004F,  $000D                   ; 67BF  SFX data
        DECLE   $0335                           ; 67C1  SFX data
        DECLE   $01ED                           ; 67C2  SFX data
        DECLE   $000F,  $03FE                   ; 67C3  SFX data
        DECLE   $0077,  $00EE,  $0067           ; 67C5  SFX data
        DECLE   $002B                           ; 67C8  SFX data
        DECLE   $0079                           ; 67C9  SFX data
        DECLE   $0023,  $03E4                   ; 67CA  SFX data
        DECLE   $0035                           ; 67CC  SFX data
        DECLE   $01EB                           ; 67CD  SFX data
        DECLE   $02B5                           ; 67CE  SFX data
        DECLE   $018D                           ; 67CF  SFX data
        DECLE   $004F,  $0008                   ; 67D0  SFX data
        DECLE   $0077,  $00EE,  $0067           ; 67D2  SFX data
        DECLE   $002B                           ; 67D5  SFX data
        DECLE   $0079                           ; 67D6  SFX data
        DECLE   $0023,  $03E4                   ; 67D7  SFX data
        DECLE   $0035                           ; 67D9  SFX data
        DECLE   $0203,  $038E                   ; 67DA  SFX data
        DECLE   $01CF                           ; 67DC  SFX end


        MVI     G_033C, R7                      ; 67DD   0287 033C

L_67DF:
        MVO     R5,     G_033C                  ; 67DF   0245 033C

        JSR     R5,     X_PLAY_SFX1             ; 67E1   0004 0118 03BB
        DECLE   $0079                           ; 67E4  SFX data
        DECLE   $03B7                           ; 67E5  SFX data
        DECLE   $000C,  $0080                   ; 67E6  SFX data
        DECLE   $010D                           ; 67E8  SFX data
        DECLE   $010B                           ; 67E9  SFX data
        DECLE   $01AB                           ; 67EA  SFX data
        DECLE   $01CF                           ; 67EB  SFX end


        MVI     G_033C, R7                      ; 67EC   0287 033C

UC_67EE:
        MVII    #$0037, R0                      ; 67EE  SLIB UCALL target
        ADDI    #$0008, R3                      ; 67F0   02FB 0008
        MVO@    R0,     R3                      ; 67F2   0258
        PULR    R7                              ; 67F3   02B7

L_67F4:
        PSHR    R5                              ; 67F4   0275

        JSR     R5,     X_PLAY_SFX1             ; 67F5   0004 0118 03BB
        DECLE   $03E9                           ; 67F8  SFX data
        DECLE   $0040,  $0200                   ; 67F9  SFX data
        DECLE   $002C,  $0000                   ; 67FB  SFX data
        DECLE   $000B                           ; 67FD  SFX data
        DECLE   $03CF                           ; 67FE  SFX end

        DECLE   $0000,  $FFFF,  $FFFF,  $FFFF   ; 67FF   0000 FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6803   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6807   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 680B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 680F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6813   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6817   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 681B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 681F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6823   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6827   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 682B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 682F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6833   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6837   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 683B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 683F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6843   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6847   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 684B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 684F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6853   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6857   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 685B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 685F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6863   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6867   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 686B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 686F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6873   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6877   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 687B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 687F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6883   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6887   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 688B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 688F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6893   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6897   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 689B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 689F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68A3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68A7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68AB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68AF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68B3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68B7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 68BB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68BF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68C3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68C7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 68CB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68CF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68D3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 68D7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 68DB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68DF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68E3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68E7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 68EB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68EF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68F3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 68F7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 68FB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 68FF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6903   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6907   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 690B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 690F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6913   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6917   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 691B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 691F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6923   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6927   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 692B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 692F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6933   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6937   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 693B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 693F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6943   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6947   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 694B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 694F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6953   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6957   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 695B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 695F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6963   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6967   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 696B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 696F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6973   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6977   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 697B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 697F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6983   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6987   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 698B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 698F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6993   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6997   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 699B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 699F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69A3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 69A7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 69AB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69AF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69B3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 69B7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 69BB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69BF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69C3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 69C7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 69CB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69CF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69D3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 69D7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 69DB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69DF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69E3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69E7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 69EB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69EF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69F3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69F7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 69FB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 69FF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A03   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A07   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A0B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A0F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A13   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A17   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A1B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A1F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A23   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A27   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A2B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A2F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A33   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A37   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A3B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A3F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A43   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A47   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A4B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A4F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A53   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A57   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A5B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A5F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A63   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A67   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A6B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A6F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A73   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A77   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A7B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A7F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A83   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A87   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A8B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A8F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A93   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6A97   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6A9B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6A9F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AA3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6AA7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6AAB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AAF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AB3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6AB7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6ABB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ABF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AC3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6AC7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6ACB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ACF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AD3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6AD7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6ADB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6ADF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AE3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AE7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6AEB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AEF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AF3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6AF7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6AFB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6AFF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B03   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6B07   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6B0B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B0F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B13   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6B17   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6B1B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B1F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B23   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6B27   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6B2B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B2F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B33   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6B37   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6B3B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B3F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B43   FFFF FFFF FFFF FFFF
        DECLE   $FF7F,  $FFFF,  $FFFF,  $FF7B   ; 6B47   FF7F FFFF FFFF FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6B4B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B4F   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B53   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7B   ; 6B57   FF7F FF7F FF7F FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6B5B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B5F   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B63   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7B   ; 6B67   FF7F FF7F FF7F FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6B6B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B6F   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6B73   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7B   ; 6B77   FF7F FF7F FF7F FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6B7B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FFFF,  $FFFF,  $FFFF   ; 6B7F   FF7F FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B83   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6B87   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6B8B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6B8F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFBF   ; 6B93   FFFF FFFF FFFF FFBF
        DECLE   $FFBF,  $FFBF,  $FFFF,  $FFBB   ; 6B97   FFBF FFBF FFFF FFBB
        DECLE   $FFBB,  $FFBF,  $FFBF,  $FFBF   ; 6B9B   FFBB FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6B9F   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BA3   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBB   ; 6BA7   FFBF FFBF FFBF FFBB
        DECLE   $FFBB,  $FFBF,  $FFBF,  $FFBF   ; 6BAB   FFBB FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BAF   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6BB3   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBB   ; 6BB7   FFBF FFBF FFBF FFBB
        DECLE   $FFBB,  $FFBF,  $FFBF,  $FFBF   ; 6BBB   FFBB FFBF FFBF FFBF
        DECLE   $FFBF,  $FFFF,  $FFFF,  $FFFF   ; 6BBF   FFBF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BC3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6BC7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6BCB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BCF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BD3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6BD7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6BDB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BDF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BE3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6BE7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6BEB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BEF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BF3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6BF7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6BFB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6BFF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C03   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C07   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C0B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C0F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C13   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C17   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C1B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C1F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C23   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C27   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C2B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C2F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C33   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C37   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C3B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C3F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C43   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C47   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C4B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C4F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C53   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C57   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C5B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C5F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C63   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C67   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C6B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C6F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C73   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C77   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6C7B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C7F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C83   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C87   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C8B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C8F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C93   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C97   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C9B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6C9F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CA3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CA7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CAB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CAF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CB3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CB7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CBB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CBF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CC3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CC7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CCB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CCF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CD3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CD7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CDB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CDF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CE3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CE7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6CEB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CEF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CF3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CF7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CFB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6CFF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D03   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D07   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D0B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D0F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D13   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D17   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D1B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D1F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D23   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D27   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D2B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D2F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D33   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D37   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D3B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D3F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D43   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D47   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D4B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D4F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D53   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D57   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D5B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D5F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D63   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6D67   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D6B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D6F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D73   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D77   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D7B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D7F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D83   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D87   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D8B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D8F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D93   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D97   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6D9B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6D9F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DA3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DA7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6DAB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DAF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DB3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6DB7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6DBB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DBF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DC3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DC7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6DCB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DCF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DD3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6DD7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6DDB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DDF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DE3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6DE7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6DEB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DEF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DF3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6DF7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6DFB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6DFF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E03   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E07   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E0B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E0F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E13   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E17   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E1B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E1F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E23   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E27   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E2B   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E2F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E33   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6E37   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E3B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E3F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E43   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E47   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E4B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E4F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E53   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFDB   ; 6E57   FFFF FFFF FFFF FFDB
        DECLE   $FFDB,  $FFDF,  $FFDF,  $FFDF   ; 6E5B   FFDB FFDF FFDF FFDF
        DECLE   $FFDF,  $FFFF,  $FFFF,  $FFFF   ; 6E5F   FFDF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E63   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E67   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E6B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E6F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E73   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E77   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E7B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E7F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E83   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E87   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E8B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E8F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E93   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E97   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6E9B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6E9F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EA3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6EA7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6EAB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EAF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EB3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EB7   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EBB   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EBF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EC3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EC7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6ECB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFDF   ; 6ECF   FFFF FFFF FFFF FFDF
        DECLE   $FFDF,  $FFFF,  $FFDF,  $FFDF   ; 6ED3   FFDF FFFF FFDF FFDF
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6ED7   FFDF FFDF FFDF FFDF
        DECLE   $FFDB,  $FFDF,  $FFDF,  $FFDF   ; 6EDB   FFDB FFDF FFDF FFDF
        DECLE   $FFDF,  $FFFF,  $FFFF,  $FFFF   ; 6EDF   FFDF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EE3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EE7   FFFF FFFF FFFF FFFF
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6EEB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EEF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EF3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6EF7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6EFB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6EFF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F03   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6F07   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6F0B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F0F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F13   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6F17   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6F1B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F1F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F23   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6F27   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6F2B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F2F   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6F33   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6F37   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6F3B   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FF7F,  $FF7F,  $FF7F   ; 6F3F   FFFF FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F43   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7B   ; 6F47   FF7F FF7F FF7F FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6F4B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF5F,  $FF5F   ; 6F4F   FF7F FF7F FF5F FF5F
        DECLE   $FF5F,  $FF5F,  $FF5F,  $FF5F   ; 6F53   FF5F FF5F FF5F FF5F
        DECLE   $FF5F,  $FF5F,  $FF5F,  $FF5B   ; 6F57   FF5F FF5F FF5F FF5B
        DECLE   $FF5B,  $FF5F,  $FF5F,  $FF5F   ; 6F5B   FF5B FF5F FF5F FF5F
        DECLE   $FF5F,  $FF7F,  $FF7F,  $FF7F   ; 6F5F   FF5F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F63   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7B   ; 6F67   FF7F FF7F FF7F FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6F6B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F6F   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7F   ; 6F73   FF7F FF7F FF7F FF7F
        DECLE   $FF7F,  $FF7F,  $FF7F,  $FF7B   ; 6F77   FF7F FF7F FF7F FF7B
        DECLE   $FF7B,  $FF7F,  $FF7F,  $FF7F   ; 6F7B   FF7B FF7F FF7F FF7F
        DECLE   $FF7F,  $FFBF,  $FFBF,  $FFBF   ; 6F7F   FF7F FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F83   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBB   ; 6F87   FFBF FFBF FFBF FFBB
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F8B   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F8F   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6F93   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBB   ; 6F97   FFBF FFBF FFBF FFBB
        DECLE   $FFBB,  $FFBF,  $FFBF,  $FFBF   ; 6F9B   FFBB FFBF FFBF FFBF
        DECLE   $FF9F,  $FFBF,  $FFBF,  $FFBF   ; 6F9F   FF9F FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FA3   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBB   ; 6FA7   FFBF FFBF FFBF FFBB
        DECLE   $FFBB,  $FFBF,  $FFBF,  $FFBF   ; 6FAB   FFBB FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FAF   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBF   ; 6FB3   FFBF FFBF FFBF FFBF
        DECLE   $FFBF,  $FFBF,  $FFBF,  $FFBB   ; 6FB7   FFBF FFBF FFBF FFBB
        DECLE   $FFBB,  $FFBF,  $FFBF,  $FFBF   ; 6FBB   FFBB FFBF FFBF FFBF
        DECLE   $FFBF,  $FFFF,  $FFFF,  $FFFF   ; 6FBF   FFBF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FC3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6FC7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6FCB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFDF,  $FFDF,  $FFDF   ; 6FCF   FFFF FFDF FFDF FFDF
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDF   ; 6FD3   FFDF FFDF FFDF FFDF
        DECLE   $FFDF,  $FFDF,  $FFDF,  $FFDB   ; 6FD7   FFDF FFDF FFDF FFDB
        DECLE   $FFDB,  $FFDF,  $FFDF,  $FFDF   ; 6FDB   FFDB FFDF FFDF FFDF
        DECLE   $FFDF,  $FFFF,  $FFFF,  $FFFF   ; 6FDF   FFDF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FE3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6FE7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6FEB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FEF   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFF   ; 6FF3   FFFF FFFF FFFF FFFF
        DECLE   $FFFF,  $FFFF,  $FFFF,  $FFFB   ; 6FF7   FFFF FFFF FFFF FFFB
        DECLE   $FFFB,  $FFFF,  $FFFF,  $FFFF   ; 6FFB   FFFB FFFF FFFF FFFF
        DECLE   $FFFF                           ; 6FFF   FFFF
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $503C       <entry> $678D  
;;  $5089       $5092  
;;  $509F       $50E0   $5120  
;;  $50BC       $513C  
;;  $50C6       $50C0  
;;  $50E2       $50B6   $513E  
;;  $50F4       $50C4   $50EE  
;;  $510B       $678A  
;;  $510C       $510A  
;;  $511D       $50BA   $50E5   $50E9   $50F2   $5123  
;;  $5122       $50B1  
;;  $5136       $5133  
;;  $5148       $510F   $558A   $562E   $5876   $604B   $6063  
;;  $51C3       $5060   $5101   $567F   $56B3  
;;  $51D1       $51D1  
;;  $51DA       $5069   $52D0   $66B2  
;;  $51E3       $5203   $521F  
;;  $51E4       $51FB  
;;  $51FE       $52D5  
;;  $5207       $5AA0  
;;  $5208       $5206  
;;  $5217       $575C   $586C   $58BE   $6681  
;;  $522D       $5265   $529F   $52EF  
;;  $522F       $5236  
;;  $5238       $5231  
;;  $525E       $52E4  
;;  $5298       $52E1  
;;  $52CF       $510C   $6763  
;;  $52FB       $5628   $594F   $5D10   $6056   $6081   $66BA  
;;  $52FF       $514B  
;;  $54C8       $54D9   $5504  
;;  $54D3       $54D7  
;;  $54D5       $5552   $57C7   $608D  
;;  $54F4       $54E4  
;;  $54F7       <entry>
;;  $54FA       $5502  
;;  $5520       $5544   $554A  
;;  $5528       $54FC   $5514   $551C   $552C   $5536   $553B   $5550   $5565  
;;  $5528       $55A7   $5610   $5613   $5619   $57C0   $57C5   $5833   $5874  
;;  $5529       $550D   $5511  
;;  $5562       $555D  
;;  $5573       $54F5   $55C3   $55D6   $55E0   $55E7   $5626   $60DB  
;;  $5577       $5569   $556D   $5571  
;;  $5583       $60D8   $610C  
;;  $558E       $5581  
;;  $559C       $5559  
;;  $55A4       $559F  
;;  $55AE       $55AA  
;;  $55C5       $55B5   $55BA  
;;  $55C9       $55B1  
;;  $55E9       $55CE   $55DC   $55E3  
;;  $55F7       $55EB  
;;  $55FB       $55F1   $55F5  
;;  $5609       $5604  
;;  $5622       $561D  
;;  $5632       $5656   $5682   $568F  
;;  $563B       $563F  
;;  $5654       $5A29  
;;  $565C       $568B  
;;  $5671       $5DC6   $6084  
;;  $568D       $557A   $5C83   $5C95   $5E0F   $6048   $6093  
;;  $56A1       $56C3  
;;  $56B3       $5695  
;;  $56C5       $5685   $56B6  
;;  $5704       $5700  
;;  $5713       $5725   $577C  
;;  $573C       $5741  
;;  $575F       $5791   $57B3  
;;  $5765       $5731   $5788   $57AE  
;;  $5779       $576E   $5774  
;;  $580C       $57F7  
;;  $5821       <entry>
;;  $5835       $582D  
;;  $583D       $5837  
;;  $583F       $583B  
;;  $5840       $583E  
;;  $5866       $585D  
;;  $588D       $5889  
;;  $58B2       $58A4  
;;  $58C7       $58DA  
;;  $58C8       $575F  
;;  $58CB       $58CF  
;;  $58F3       $58E0   $58ED  
;;  $58F8       $58FD  
;;  $5901       $58DC  
;;  $5923       $5577   $6045   $6090  
;;  $593D       $5935  
;;  $5953       $5606   $57B0   $5819   $58C4   $5924  
;;  $595C       $5C32   $5D95   $6687  
;;  $595D       $65FA  
;;  $5964       $526D   $563B  
;;  $5965       $5270   $52A7   $52F8   $5963   $5F17  
;;  $5968       $596C  
;;  $5975       $5768   $5869   $594C  
;;  $598D       $5762   $58C1   $62DC   $6631   $668A  
;;  $598E       $598C  
;;  $59A3       $597D   $59AA  
;;  $59A4       $5976   $598E  
;;  $59A7       $59B1  
;;  $59A8       $59A6  
;;  $59B4       $5C1A   $5D7F   $61BE  
;;  $59BD       $59C0  
;;  $59CC       $55BE   $5A5C   $5C4F   $5C9E   $5CA7   $5D00   $6332   $6336  
;;  $59CC       $6358   $64FF   $6581  
;;  $59D0       $5EC0   $5EE7  
;;  $59D1       $59CF  
;;  $59D2       $59D6  
;;  $59DA       $5A0F   $5A86   $5B36  
;;  $59EA       $59F5  
;;  $59ED       $59F7  
;;  $59F9       $59F0  
;;  $5A0C       $5A98  
;;  $5A0D       $562B   $5CDE   $5DE3   $605C  
;;  $5A29       $5A22  
;;  $5A5C       $5A62  
;;  $5A70       $5A2F  
;;  $5A7E       $5C1D   $5D82   $6217  
;;  $5A84       $5A9D  
;;  $5A86       $5A94  
;;  $5A9F       $5C29   $5D8B   $62D9   $65F7   $662E   $6684  
;;  $5AAC       $5B14  
;;  $5AAD       $5AAB  
;;  $5AAF       $5ABE  
;;  $5AB7       $5AB4  
;;  $5AC4       $616D  
;;  $5AC6       $5AC2  
;;  $5ADB       $5ACD  
;;  $5ADD       $5AB9   $5B02  
;;  $5ADE       $5AE3  
;;  $5AE1       $5AFC  
;;  $5AE7       $5ADF  
;;  $5AEE       $5AEB  
;;  $5AFE       $6127  
;;  $5B00       $5B07  
;;  $5B0C       $66BD  
;;  $5B13       $5B1B  
;;  $5B1E       $5A69   $5B33  
;;  $5B32       $5C2C   $5D8E  
;;  $5B36       $5B40  
;;  $5B42       $5B3C  
;;  $5B4E       $5B78  
;;  $5B50       $5B9B   $5BEE   $5BF1  
;;  $5B6E       $577F  
;;  $5B7A       $567C  
;;  $5B87       $5A26   $5B83   $5C00  
;;  $5B91       $5733  
;;  $5B96       $5B81   $5BA6  
;;  $5B9E       $586F  
;;  $5BB5       $5BB1  
;;  $5BC7       $5AF4   $5B5E   $5CB3   $60B6   $6163  
;;  $5BD5       $5AEE   $5B51   $615B  
;;  $5BDF       $5BDB  
;;  $5BE4       $62D1  
;;  $5BFE       $5C05  
;;  $5C12       $5C0E  
;;  $5C35       $5C89  
;;  $5C43       $5C3A  
;;  $5C45       $5D34  
;;  $5C46       <entry>
;;  $5C5D       $5C65  
;;  $5C62       $5CFC   $5D05  
;;  $5C72       $5C76  
;;  $5C75       $5C8C  
;;  $5C78       $5C73  
;;  $5C7C       $5CF4  
;;  $5C86       $5CB8   $5CDC  
;;  $5C8B       $5C7A  
;;  $5C8E       $5CCE   $5CF6  
;;  $5CA1       $5CAF  
;;  $5CA2       $5CAB  
;;  $5CB1       $5CA5  
;;  $5CBA       $5C6F  
;;  $5CBF       $5CC8  
;;  $5CC0       $5CBE  
;;  $5CD0       $5CC2   $5CEB  
;;  $5CDE       $5CD7  
;;  $5CED       $5CE3   $5CE7  
;;  $5CF2       $5D0B  
;;  $5CF8       $5C60  
;;  $5D0D       $5776  
;;  $5D22       $662B  
;;  $5D23       $56B0  
;;  $5D29       $572B  
;;  $5D2E       $5D27  
;;  $5D30       $5C26  
;;  $5D31       $5D2F  
;;  $5D3E       $5D4E  
;;  $5D54       $5058   $5C3C   $5C47   $5D0D  
;;  $5D5B       $5587   $5C2F   $5C86  
;;  $5D62       $5770   $5D23   $5D2A  
;;  $5D68       $5C7C   $5C8E  
;;  $5D7B       $5D77  
;;  $5D98       $5E15   $604E  
;;  $5DA9       $5DA1  
;;  $5DAE       $5DAB  
;;  $5DC6       $5DDB  
;;  $5DCE       $5DC4  
;;  $5DDD       $5DD0   $5DD3  
;;  $5DE9       $5DCC  
;;  $5DF6       $5DF9   $5DFC  
;;  $5DF7       $5DF5  
;;  $5E17       $5DB4   $5DED  
;;  $5E1B       $5E21   $5E24   $5E2B  
;;  $5E2A       $5E26  
;;  $5E2D       $5E1D  
;;  $5E3A       $5E96   $5EA9   $5F02   $6117  
;;  $5E41       $5E47  
;;  $5E49       $5EBD   $5EC4   $5EEB  
;;  $5E4A       $5E3B   $5F52  
;;  $5E57       $5E6A  
;;  $5E6C       $5E62  
;;  $5E6F       $5E99   $5EA6   $5EFC   $6191   $6199  
;;  $5E72       $5E7B  
;;  $5E7E       $5E72   $5F77  
;;  $5E82       $5E8C  
;;  $5E8B       $5E85  
;;  $5E8F       $5E12   $6096  
;;  $5ED0       $5ED7   $5EDB   $5EE4  
;;  $5EE6       $5ED2  
;;  $5EED       $5EEF  
;;  $5F09       $5EF9   $5EFF   $618E   $6194  
;;  $5F10       $5E90   $5E9F   $5EAF   $5F4F   $5F6F   $5FBB   $610F  
;;  $5F1A       $5E9C   $5EAC   $5F05  
;;  $5F1C       $5F22  
;;  $5F2C       $5F1E  
;;  $5F2D       $5DB1   $5DE6  
;;  $5F3C       $5F4D  
;;  $5F43       $5F4B  
;;  $5F47       $5F44  
;;  $5F4F       $5F3E  
;;  $5F57       $5F5C   $5F6D  
;;  $5F58       $5F56  
;;  $5F61       $5F6B  
;;  $5F67       $5F63  
;;  $5F6F       $5F59  
;;  $5F75       $5F96  
;;  $5F7D       $5F82   $5F8E  
;;  $5F7E       $5F7C  
;;  $5F90       $5F7F  
;;  $5F9A       $5FB9  
;;  $5F9B       $5FB4  
;;  $5FA5       $5FA0  
;;  $5FB0       $5FAB  
;;  $5FC2       $5FF6  
;;  $5FD5       $5FDA   $5FED  
;;  $5FD6       $5FD4  
;;  $5FEF       $5FD1   $5FD7  
;;  $5FFF       $5946   $5DAE   $5DDD   $5E0C   $607E  
;;  $6000       $5D6E  
;;  $6008       $5A78   $65DF   $6613  
;;  $6009       $6007  
;;  $600C       $6021  
;;  $6014       $5949   $5D6B   $5DC9   $5E09   $607B  
;;  $6023       $5F87   $5FE1   $5FE7  
;;  $602E       $5FA2   $5FAD  
;;  $6031       $5E2E  
;;  $6032       $5E30  
;;  $6036       $602F   $6033  
;;  $6037       $5DE0   $5E32   $5E34   $6059  
;;  $6039       $5E36  
;;  $603D       $5E38  
;;  $6040       $555F  
;;  $6051       $561F  
;;  $605F       $6087  
;;  $6066       $6043   $6054   $6072   $6079   $608B   $60E0  
;;  $6089       $6075  
;;  $60A0       $606E  
;;  $60A7       $60C9  
;;  $60B4       $60A8  
;;  $60C0       $60A5  
;;  $60D2       $60C2  
;;  $60DB       $60AB   $60AE   $60B2   $60E6   $60F1   $6103  
;;  $60DE       $60A1  
;;  $6100       $6107  
;;  $610F       $670A  
;;  $611A       $61B8  
;;  $612F       $6137  
;;  $613C       $6142   $614D  
;;  $613D       $613B  
;;  $614A       $6154   $6169  
;;  $614B       $6149  
;;  $616B       $613F  
;;  $618B       $6115  
;;  $6199       $618C  
;;  $619C       $6197  
;;  $619F       $61A6  
;;  $61AE       $61B6  
;;  $61BE       $631E  
;;  $61CD       $61D8  
;;  $61DC       $61D1  
;;  $61E0       $61E6  
;;  $61EF       $61DA  
;;  $6217       $620C  
;;  $6226       $668D  
;;  $6231       $6238  
;;  $623A       $6233  
;;  $6249       $62D7   $62DF  
;;  $625D       $6257  
;;  $628A       $6281  
;;  $62A0       $628B   $6292   $63A6  
;;  $62A3       $62A5   $62B5   $62C3  
;;  $62A4       $62A2  
;;  $62AF       $62AA  
;;  $62B7       $62B1  
;;  $62C5       $62C0   $63C8  
;;  $62C8       $62AD   $62B9   $63B1  
;;  $62CE       $5609   $6247   $6398   $63E3  
;;  $62E1       $6250  
;;  $62F0       $62EB  
;;  $62F8       $6302   $6306  
;;  $6308       $62FB  
;;  $634E       $633E   $6342  
;;  $634F       $634A   $6362   $636C  
;;  $6350       $634E  
;;  $6364       $635D  
;;  $6366       $6356  
;;  $636A       $636F   $637C   $6384  
;;  $636B       $6369  
;;  $6386       $6352  
;;  $6393       $638C  
;;  $639A       $6391  
;;  $63A3       $627D   $6288  
;;  $63AB       $6276   $63B8   $63C4  
;;  $63AD       $63AF  
;;  $63B3       $63A9  
;;  $63C6       $6298   $629E   $63BE  
;;  $63CA       $6271  
;;  $63DC       $63D7  
;;  $63E8       $63E8  
;;  $6419       $62CE  
;;  $6435       $6432  
;;  $6440       $6436   $643A  
;;  $6447       $625F   $6323   $6443   $64E9   $64F7  
;;  $6448       $5C23   $5D85   $61EF   $66D5   $6766  
;;  $644C       $6466  
;;  $6471       $6371   $6546  
;;  $6480       $6375   $654A  
;;  $6488       $6484  
;;  $6492       $6261   $6325  
;;  $64A1       $6498  
;;  $64A9       $64B1  
;;  $64AF       $64AB  
;;  $64CD       $64BD  
;;  $64D1       $64E5  
;;  $64D7       $64DE  
;;  $64F4       $64B5   $64B9   $64C1   $64C9  
;;  $64FF       $6517  
;;  $650B       $6506  
;;  $6513       $650E  
;;  $651A       $6508   $6510  
;;  $6526       $652C  
;;  $6531       $63CD   $6608  
;;  $6536       $6541   $655A  
;;  $6537       $6535  
;;  $653F       $6544   $6551   $6561   $6569  
;;  $6540       $653E  
;;  $6563       $6556   $655D  
;;  $656B       $6539  
;;  $6570       $6220   $6493  
;;  $657C       $621D   $6674  
;;  $6581       $6592  
;;  $658E       $6587   $658B  
;;  $6595       $6223  
;;  $65BF       $65EA   $6602  
;;  $65D8       $65DA  
;;  $65D9       $65D7  
;;  $65EC       $65C2  
;;  $65FD       $65D4  
;;  $6604       $65C6   $65C9   $65FD  
;;  $660F       $6628  
;;  $6610       $660C  
;;  $661E       $6637  
;;  $661F       $55A1  
;;  $6628       $6624  
;;  $663F       $6672  
;;  $6653       $664E  
;;  $6658       $6655  
;;  $6660       $6669  
;;  $6677       $6598  
;;  $667F       $667C  
;;  $66A7       $5C59   $5C98   $5CBA   $5D17   $5F11   $5F2E   $612A   $61A9  
;;  $66A7       $6329   $64F9   $6605   $663F  
;;  $66A8       $5C4C   $5C69   $6009   $626A   $639E   $6420   $65CE  
;;  $66B2       $5D1F   $5F29   $609D  
;;  $66CB       $66CD  
;;  $66CF       $6188  
;;  $66D5       $6719  
;;  $66EC       $6726  
;;  $66FE       $66FB  
;;  $6703       $66C3  
;;  $670D       $6708  
;;  $6711       $6717  
;;  $671B       $66DE  
;;  $6728       $61F2   $66D8  
;;  $672A       $6731  
;;  $6733       $6788  
;;  $6734       $672D  
;;  $6740       $677E  
;;  $675F       $67B7  
;;  $677C       $673A  
;;  $678D       $6784  
;;  $6790       $673E   $6780  
;;  $67B9       $5A66   $5C20   $5D88   $621A  
;;  $67DF       $5728   $5782  
;;  $67EE       <entry>
;;  $67F4       $5C3F   $5DA3   $6259  
;; ======================================================================== ;;
