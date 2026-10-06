
        ORG     $5000
.HEADER:
        BIDECLE $9557           ; 5000  Ptr: MOB graphic images
        BIDECLE $5024           ; 5002  Ptr: EXEC timer table
        BIDECLE $5EC9           ; 5004  Ptr: Start of game
        BIDECLE $5000           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $500E           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TITLE:
        DECLE   $0057                           ; 501C  Cartridge year
        STRING  "Hoop!"                         ; 501D  Title string
        DECLE   $0000                           ; 5022  

.TITLECODE:
        PULR    R7                              ; 5023   02B7

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5024  Timer dispatch/interval
        DECLE   $0060,  $0050,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $00B8,  $0050,  $000A,  $0000; 502C  Timer dispatch/interval
        DECLE   $000D,  $0051,  $000A,  $0000; 5030  Timer dispatch/interval
        DECLE   $006A,  $0051,  $0003,  $0000; 5034  Timer dispatch/interval
        DECLE   $0084,  $0050,  $0001,  $0080; 5038  Timer dispatch/interval
        BIDECLE $0000           ; 503C  End of timer table

        DECLE   $0000,  $0000                   ; 503E   0000 0000
L_5040:
        PSHR    R5                              ; 5040   0275

        JSR     R5,     L_5058                  ; 5041   0004 0150 0058
        DECLE   $02B8,  $0020,  $0240,  $0119   ; 5044   02B8 0020 0240 0119
        DECLE   $02B8,  $0050,  $0240,  $0118   ; 5048   02B8 0050 0240 0118
        DECLE   $0240,  $0187,  $0004,  $0194   ; 504C   0240 0187 0004 0194
        DECLE   $0119,  $02B8,  $0003,  $0240   ; 5050   0119 02B8 0003 0240
        DECLE   $0172,  $0004                   ; 5054   0172 0004

        AND@    R5,     R4                      ; 5056   03AC
        ADCR    R1                              ; 5057   0029
L_5058:
        PSHR    R5                              ; 5058   0275
        MVII    #$0175, R4                      ; 5059   02BC 0175
        MVII    #$0070, R0                      ; 505B   02B8 0070
        J       .EXEC.739                       ; 505D   0004 0314 0339

L_5060:
        PSHR    R5                              ; 5060   0275

        JSR     R5,     L_5EE9                  ; 5061   0004 015C 02E9
        DECLE   $0004                           ; 5064   0004

        ANDR    R4,     R4                      ; 5065   01A4
        ANDR    R0,     R3                      ; 5066   0183
        MVI     G_0172, R0                      ; 5067   0280 0172
        CMPI    #$0003, R0                      ; 5069   0378 0003
        BNEQ    .TITLECODE                      ; 506B   022C 0049

        JSR     R5,     L_5716                  ; 506D   0004 0154 0316
        JSR     R5,     L_6887                  ; 5070   0004 0168 0087
        JSR     R5,     L_5987                  ; 5073   0004 0158 0187
        JSR     R5,     L_5377                  ; 5076   0004 0150 0377
        JSR     R5,     L_5385                  ; 5079   0004 0150 0385
        JSR     R5,     L_577E                  ; 507C   0004 0154 037E
        DECLE   $0004                           ; 507F   0004

        ANDR    R5,     R4                      ; 5080   01AC
        MVO@    R1,     R4                      ; 5081   0261
        PULR    R7                              ; 5082   02B7
L_5083:
        MOVR    R5,     R7                      ; 5083   00AF

L_5084:
        MVI     G_0172, R0                      ; 5084   0280 0172
        CMPI    #$0003, R0                      ; 5086   0378 0003
        BNEQ    L_5083                          ; 5088   022C 0006

        MVI     G_0324, R0                      ; 508A   0280 0324
        INCR    R0                              ; 508C   0008
        INCR    R7                              ; 508D   000F

L_508E:
        CLRR    R0                              ; 508E   01C0
L_508F:
        MVO     R0,     G_0324                  ; 508F   0240 0324
        MOVR    R7,     R1                      ; 5091   00B9
        SUBI    #$005A, R1                      ; 5092   0339 005A
        J       .EXEC.81E                       ; 5094   0004 0318 001E

L_5097:
        MOVR    R7,     R1                      ; 5097   00B9
        SUBI    #$0060, R1                      ; 5098   0339 0060
        J       X_TIMER_STOP                    ; 509A   0004 0318 0038

L_509D:
        PSHR    R5                              ; 509D   0275
        MOVR    R7,     R1                      ; 509E   00B9
        SUBI    #$0073, R1                      ; 509F   0339 0073

        JSR     R5,     X_TIMER_STOP            ; 50A1   0004 0118 0038

        PULR    R5                              ; 50A4   02B5
L_50A5:
        MOVR    R7,     R1                      ; 50A5   00B9
        SUBI    #$0076, R1                      ; 50A6   0339 0076
        J       X_TIMER_STOP                    ; 50A8   0004 0318 0038

L_50AB:
        PSHR    R5                              ; 50AB   0275
        MOVR    R7,     R1                      ; 50AC   00B9
        SUBI    #$0081, R1                      ; 50AD   0339 0081

        JSR     R5,     X_TIMER_START           ; 50AF   0004 0118 0044

        MOVR    R7,     R1                      ; 50B2   00B9
        SUBI    #$0083, R1                      ; 50B3   0339 0083
        J       .EXEC.81F                       ; 50B5   0004 0318 001F

L_50B8:
        MVI     G_0172, R0                      ; 50B8   0280 0172
        DECLE   $0378,  $0003,  $020C,  $006F   ; 50BA   0378 0003 020C 006F
        DECLE   $0275,  $0280,  $0177,  $0378   ; 50BE   0275 0280 0177 0378
        DECLE   $0001,  $0204,  $000C,  $0378   ; 50C2   0001 0204 000C 0378
        DECLE   $0010,  $0204,  $0008,  $0378   ; 50C6   0010 0204 0008 0378
        DECLE   $001F,  $0204,  $0004,  $0378   ; 50CA   001F 0204 0004 0378
        DECLE   $002E,  $020C,  $0003,  $0004   ; 50CE   002E 020C 0003 0004
        DECLE   $01A0,  $01FF                   ; 50D2   01A0 01FF

        PULR    R5                              ; 50D4   02B5
        MVII    #$0177, R4                      ; 50D5   02BC 0177
        MVI@    R4,     R1                      ; 50D7   02A1
        DECR    R4                              ; 50D8   0014
        SDBD                                    ; 50D9   0001
        MVI@    R4,     R0                      ; 50DA   02A0
        TSTR    R1                              ; 50DB   0089
        BNEQ    L_50E0                          ; 50DC   020C 0002

        SUBI    #$00C4, R0                      ; 50DE   0338 00C4
L_50E0:
        DECR    R0                              ; 50E0   0010
        BEQ     L_512E                          ; 50E1   0204 004B

        PSHR    R5                              ; 50E3   0275

        JSR     R5,     L_5122                  ; 50E4   0004 0150 0122

        INCR    R7                              ; 50E7   000F

L_50E8:
        PSHR    R5                              ; 50E8   0275
L_50E9:
        SDBD                                    ; 50E9   0001
        MVII    #$2000, R3                      ; 50EA   02BB 0000 0020
        MVII    #$022D, R4                      ; 50ED   02BC 022D
        MVII    #$0002, R1                      ; 50EF   02B9 0002
        MVI     G_0178, R0                      ; 50F1   0280 0178

        JSR     R5,     X_PRNUM_RGT             ; 50F3   0004 0118 00C5

        MVII    #$0000, R3                      ; 50F6   02BB 0000
        MVII    #$0230, R4                      ; 50F8   02BC 0230
        MVI     G_0177, R0                      ; 50FA   0280 0177
        INCR    R7                              ; 50FC   000F

L_50FD:
        PSHR    R5                              ; 50FD   0275
L_50FE:
        MVII    #$0002, R1                      ; 50FE   02B9 0002
        CMPI    #$000A, R0                      ; 5100   0378 000A
        BPL     L_5109                          ; 5102   0203 0005

        JSR     R5,     X_PRNUM_RGT             ; 5104   0004 0118 00C5

        DECR    R1                              ; 5107   0011
        CLRR    R0                              ; 5108   01C0

L_5109:
        JSR     R5,     X_PRNUM_RGT             ; 5109   0004 0118 00C5

        PULR    R7                              ; 510C   02B7

L_510D:
        MVI     G_0172, R0                      ; 510D   0280 0172
        CMPI    #$0003, R0                      ; 510F   0378 0003
        BNEQ    L_512D                          ; 5111   020C 001A

        MVI     G_0179, R0                      ; 5113   0280 0179
        DECR    R0                              ; 5115   0010
        MVO     R0,     G_0179                  ; 5116   0240 0179
        BEQ     L_513D                          ; 5118   0204 0023

L_511A:
        MVII    #$0000, R3                      ; 511A   02BB 0000
        MVII    #$0235, R4                      ; 511C   02BC 0235
        MVI     G_0179, R0                      ; 511E   0280 0179
        B       L_50FD                          ; 5120   0220 0024

L_5122:
        PSHR    R0                              ; 5122   0270
        ANDI    #$00FF, R0                      ; 5123   03B8 00FF
        MVO     R0,     G_0177                  ; 5125   0240 0177
        PULR    R0                              ; 5127   02B0
        SWAP    R0,     1                       ; 5128   0040
        ANDI    #$00FF, R0                      ; 5129   03B8 00FF
        MVO     R0,     G_0178                  ; 512B   0240 0178
L_512D:
        MOVR    R5,     R7                      ; 512D   00AF

L_512E:
        PSHR    R5                              ; 512E   0275

        JSR     R5,     L_5122                  ; 512F   0004 0150 0122
        JSR     R5,     L_50E8                  ; 5132   0004 0150 00E8

        MVII    #$0014, R0                      ; 5135   02B8 0014

        JSR     R5,     X_PLAY_RAZZ4            ; 5137   0004 011C 02C4
        DECLE   $0004                           ; 513A   0004

        AND@    R5,     R4                      ; 513B   03AC
        ADDR    R3,     R2                      ; 513C   00DA
L_513D:
        PSHR    R5                              ; 513D   0275

        JSR     R5,     L_511A                  ; 513E   0004 0150 011A

        MVII    #$000C, R0                      ; 5141   02B8 000C

        JSR     R5,     X_PLAY_RAZZ4            ; 5143   0004 011C 02C4
        DECLE   $0004                           ; 5146   0004

        AND@    R5,     R4                      ; 5147   03AC
        SUB@    R3,     R1                      ; 5148   0319
L_5149:
        MVI     G_017B, R1                      ; 5149   0281 017B
        ANDI    #$0001, R1                      ; 514B   03B9 0001
        ADDI    #$0175, R1                      ; 514D   02F9 0175
        MVI@    R1,     R0                      ; 514F   0288
        ADD     G_01E7, R0                      ; 5150   02C0 01E7
        MVO@    R0,     R1                      ; 5152   0248
L_5153:
        PSHR    R5                              ; 5153   0275
        MVII    #$0003, R1                      ; 5154   02B9 0003
        SDBD                                    ; 5156   0001
        MVII    #$2002, R3                      ; 5157   02BB 0002 0020
        MVII    #$0205, R4                      ; 515A   02BC 0205
        MVI     G_0175, R0                      ; 515C   0280 0175

        JSR     R5,     X_PRNUM_RGT             ; 515E   0004 0118 00C5

        MVII    #$0001, R3                      ; 5161   02BB 0001
        MVII    #$020C, R4                      ; 5163   02BC 020C
        MVI     G_0176, R0                      ; 5165   0280 0176
        J       .EXEC.89F                       ; 5167   0004 0318 009F

L_516A:
        MVI     G_0172, R0                      ; 516A   0280 0172
        CMPI    #$0003, R0                      ; 516C   0378 0003
        BNEQ    L_533E                          ; 516E   020C 01CE

        PSHR    R5                              ; 5170   0275
        MVI     G_017B, R0                      ; 5171   0280 017B
        ANDI    #$0010, R0                      ; 5173   03B8 0010
        BEQ     L_5198                          ; 5175   0204 0021

        JSR     R5,     L_5189                  ; 5177   0004 0150 0189
        JSR     R5,     L_551E                  ; 517A   0004 0154 011E

L_517D:
        ADDI    #$0010, R1                      ; 517D   02F9 0010
        PSHR    R1                              ; 517F   0271

        JSR     R5,     L_51AB                  ; 5180   0004 0150 01AB

        PULR    R1                              ; 5183   02B1
        CMPI    #$0345, R1                      ; 5184   0379 0345
        BMI     L_517D                          ; 5186   022B 000A
        PULR    R7                              ; 5188   02B7

L_5189:
        PSHR    R5                              ; 5189   0275

        JSR     R5,     L_5513                  ; 518A   0004 0154 0113

L_518D:
        ADDI    #$0010, R1                      ; 518D   02F9 0010
        PSHR    R1                              ; 518F   0271

        JSR     R5,     L_5261                  ; 5190   0004 0150 0261

        PULR    R1                              ; 5193   02B1
        CMPI    #$0345, R1                      ; 5194   0379 0345
        BMI     L_518D                          ; 5196   022B 000A
L_5198:
        PULR    R7                              ; 5198   02B7

        COMR    R6                              ; 5199   001E
        ADCR    R0                              ; 519A   0028
        GSWD    R0                              ; 519B   0030
        ADCR    R0                              ; 519C   0028
        SWAP    R2,     1                       ; 519D   0042
        ADCR    R0                              ; 519E   0028
L_519F:
        DECR    R7                              ; 519F   0017

        DECLE   $0038,  $002D,  $0038,  $003F   ; 51A0   0038 002D 0038 003F

        RSWD    R0                              ; 51A4   0038
        DECR    R0                              ; 51A5   0010
        SLL     R0,     1                       ; 51A6   0048
        NEGR    R6                              ; 51A7   0026
        SLL     R0,     1                       ; 51A8   0048
        RSWD    R3                              ; 51A9   003B
        SLL     R0,     1                       ; 51AA   0048
L_51AB:
        PSHR    R5                              ; 51AB   0275
        DECLE   $0004                           ; 51AC   0004

        ANDR    R5,     R4                      ; 51AD   01AC
        XORR    R4,     R6                      ; 51AE   01E6

        JSR     R5,     .EXEC.777               ; 51AF   0004 0114 0377
        JSR     R5,     .EXEC.766               ; 51B2   0004 0114 0366

        PSHR    R1                              ; 51B5   0271
        MVI     G_031E, R1                      ; 51B6   0281 031E
        SDBD                                    ; 51B8   0001
        CMPI    #$98D8, R1                      ; 51B9   0379 00D8 0098
        BEQ     L_52D6                          ; 51BC   0204 0118

        MVII    #$0185, R4                      ; 51BE   02BC 0185
        MVI@    R4,     R1                      ; 51C0   02A1
        CMPI    #$0005, R0                      ; 51C1   0378 0005
        BPL     L_51C8                          ; 51C3   0203 0003

        MVI@    R4,     R1                      ; 51C5   02A1
        SUBI    #$0002, R4                      ; 51C6   033C 0002
L_51C8:
        MVI@    R4,     R0                      ; 51C8   02A0
        B       L_5201                          ; 51C9   0200 0036

L_51CB:
        PSHR    R5                              ; 51CB   0275
        MVII    #$0009, R0                      ; 51CC   02B8 0009

        JSR     R5,     X_RAND2                 ; 51CE   0004 0114 029E

        MOVR    R0,     R1                      ; 51D1   0081
L_51D2:
        MVII    #$0009, R0                      ; 51D2   02B8 0009

        JSR     R5,     X_RAND2                 ; 51D4   0004 0114 029E

        CMPR    R0,     R1                      ; 51D7   0141
        BEQ     L_51D2                          ; 51D8   0224 0007

        MVO     R0,     G_0185                  ; 51DA   0240 0185
        MVO     R1,     G_0186                  ; 51DC   0241 0186
        PULR    R7                              ; 51DE   02B7

L_51DF:
        PSHR    R5                              ; 51DF   0275
        MOVR    R3,     R0                      ; 51E0   0098
        DECR    R0                              ; 51E1   0010
        SLR     R0,     2                       ; 51E2   0064
        MVII    #$0185, R1                      ; 51E3   02B9 0185
        MOVR    R1,     R2                      ; 51E5   008A
        ADDR    R0,     R1                      ; 51E6   00C1
        XORI    #$0001, R0                      ; 51E7   03F8 0001
        ADDR    R0,     R2                      ; 51E9   00C2
L_51EA:
        MVII    #$0009, R0                      ; 51EA   02B8 0009

        JSR     R5,     X_RAND2                 ; 51EC   0004 0114 029E

        CMP@    R1,     R0                      ; 51EF   0348
        BEQ     L_51EA                          ; 51F0   0224 0007

        CMP@    R2,     R0                      ; 51F2   0350
        BEQ     L_51EA                          ; 51F3   0224 000A

        MVO@    R0,     R1                      ; 51F5   0248
        PULR    R7                              ; 51F6   02B7

L_51F7:
        PULR    R1                              ; 51F7   02B1
L_51F8:
        MVII    #$0009, R0                      ; 51F8   02B8 0009

        JSR     R5,     X_RAND2                 ; 51FA   0004 0114 029E

        CMPR    R0,     R1                      ; 51FD   0141
        BEQ     L_51F8                          ; 51FE   0224 0007

        MVO@    R0,     R4                      ; 5200   0260
L_5201:
        DECR    R4                              ; 5201   0014
        PSHR    R1                              ; 5202   0271

        JSR     R5,     L_523C                  ; 5203   0004 0150 023C

        SUBR    R2,     R0                      ; 5206   0110
        SUBR    R3,     R1                      ; 5207   0119
        MOVR    R0,     R2                      ; 5208   0082
        BPL     L_520C                          ; 5209   0203 0001

        NEGR    R2                              ; 520B   0022
L_520C:
        MOVR    R1,     R3                      ; 520C   008B
        BPL     L_5210                          ; 520D   0203 0001

        NEGR    R3                              ; 520F   0023
L_5210:
        CMPI    #$0004, R2                      ; 5210   037A 0004
        BPL     L_5218                          ; 5212   0203 0004

        CMPI    #$0004, R3                      ; 5214   037B 0004
        BMI     L_5220                          ; 5216   020B 0008

L_5218:
        JSR     R5,     .EXEC.A2F               ; 5218   0004 0118 022F
        JSR     R5,     L_554B                  ; 521B   0004 0154 014B

        B       L_5235                          ; 521E   0200 0015

L_5220:
        MVI     G_017B, R0                      ; 5220   0280 017B
        ANDI    #$0004, R0                      ; 5222   03B8 0004
        BEQ     L_522C                          ; 5224   0204 0006

        MVI     G_0187, R0                      ; 5226   0280 0187
        CMP@    R4,     R0                      ; 5228   0360
        BEQ     L_5234                          ; 5229   0204 0009

        DECR    R4                              ; 522B   0014
L_522C:
        MVII    #$0003, R0                      ; 522C   02B8 0003

        JSR     R5,     X_RAND1                 ; 522E   0004 0114 027D

        TSTR    R0                              ; 5231   0080
        BEQ     L_51F7                          ; 5232   0224 003C

L_5234:
        CLRR    R0                              ; 5234   01C0
L_5235:
        PULR    R5                              ; 5235   02B5
        PULR    R1                              ; 5236   02B1
        MVII    #$0002, R4                      ; 5237   02BC 0002
        J       L_59B6                          ; 5239   0004 0358 01B6

L_523C:
        PSHR    R5                              ; 523C   0275
        PSHR    R2                              ; 523D   0272

        JSR     R5,     L_5B34                  ; 523E   0004 0158 0334

        TSTR    R2                              ; 5241   0092
        BEQ     L_5251                          ; 5242   0204 000D

        MOVR    R0,     R1                      ; 5244   0081
        MVII    #$0003, R2                      ; 5245   02BA 0003
        PSHR    R0                              ; 5247   0270

        JSR     R5,     X_DIV                   ; 5248   0004 011C 01FB

        PULR    R0                              ; 524B   02B0
        DECR    R1                              ; 524C   0011
        SLL     R1,     1                       ; 524D   0049
        SUBR    R1,     R0                      ; 524E   0108
        MVII    #$0001, R2                      ; 524F   02BA 0001
L_5251:
        MOVR    R7,     R1                      ; 5251   00B9
        SUBI    #$00B9, R1                      ; 5252   0339 00B9
        SLL     R0,     1                       ; 5254   0048
        ADDR    R0,     R1                      ; 5255   00C1
        MVI@    R1,     R0                      ; 5256   0288
        INCR    R1                              ; 5257   0009
        MVI@    R1,     R1                      ; 5258   0289
        TSTR    R2                              ; 5259   0092
        BEQ     L_525F                          ; 525A   0204 0003

        NEGR    R0                              ; 525C   0020
        ADDI    #$00A8, R0                      ; 525D   02F8 00A8
L_525F:
        PULR    R2                              ; 525F   02B2
        PULR    R7                              ; 5260   02B7

L_5261:
        PSHR    R5                              ; 5261   0275
        DECLE   $0288,  $03B8,  $0008,  $022C   ; 5262   0288 03B8 0008 022C
        DECLE   $00CE,  $0004                   ; 5266   00CE 0004

        ANDR    R5,     R4                      ; 5268   01AC
        XORR    R4,     R6                      ; 5269   01E6

        JSR     R5,     .EXEC.777               ; 526A   0004 0114 0377
        JSR     R5,     .EXEC.766               ; 526D   0004 0114 0366
        JSR     R5,     L_5332                  ; 5270   0004 0150 0332

        PSHR    R1                              ; 5273   0271
        MVI     G_017B, R5                      ; 5274   0285 017B
        ANDI    #$000C, R5                      ; 5276   03BD 000C
        XORI    #$0004, R5                      ; 5278   03FD 0004
        BEQ     L_52D6                          ; 527A   0204 005A

        JSR     R5,     L_533F                  ; 527C   0004 0150 033F

        BNC     L_531B                          ; 527F   0209 009A

        MVI     G_017F, R0                      ; 5281   0280 017F
        MVI     G_0180, R1                      ; 5283   0281 0180

        JSR     R5,     .EXEC.78C               ; 5285   0004 0114 038C

        CMPI    #$03B6, R2                      ; 5288   037A 03B6
        BPL     L_52D3                          ; 528A   0203 0047

        JSR     R5,     .EXEC.A2F               ; 528C   0004 0118 022F

        MVI     G_0181, R0                      ; 528F   0280 0181
        ADDI    #$0010, R1                      ; 5291   02F9 0010
        SUBR    R0,     R1                      ; 5293   0101
        ANDI    #$000F, R1                      ; 5294   03B9 000F
        BEQ     L_52B0                          ; 5296   0204 0018

        CMPI    #$000E, R1                      ; 5298   0379 000E
        BMI     L_529E                          ; 529A   020B 0002

        ADDI    #$0004, R0                      ; 529C   02F8 0004
L_529E:
        CMPI    #$0003, R1                      ; 529E   0379 0003
        BPL     L_52A4                          ; 52A0   0203 0002

        ADDI    #$000C, R0                      ; 52A2   02F8 000C
L_52A4:
        ANDI    #$000F, R0                      ; 52A4   03B8 000F
        MOVR    R0,     R1                      ; 52A6   0081

L_52A7:
        JSR     R5,     L_554B                  ; 52A7   0004 0154 014B

L_52AA:
        PULR    R1                              ; 52AA   02B1
L_52AB:
        MVII    #$0001, R4                      ; 52AB   02BC 0001
        J       L_59B6                          ; 52AD   0004 0358 01B6

L_52B0:
        CMPI    #$0064, R2                      ; 52B0   037A 0064
        BMI     L_52B8                          ; 52B2   020B 0004

        ADDI    #$0008, R0                      ; 52B4   02F8 0008
        B       L_52A4                          ; 52B6   0220 0013

L_52B8:
        MVI     G_017B, R0                      ; 52B8   0280 017B
        ANDI    #$0008, R0                      ; 52BA   03B8 0008
        BEQ     L_52D3                          ; 52BC   0204 0015

        PULR    R1                              ; 52BE   02B1

        JSR     R5,     .EXEC.766               ; 52BF   0004 0114 0366
        JSR     R5,     X_POW2                  ; 52C2   0004 0114 0345

        MVI     G_0184, R5                      ; 52C5   0285 0184
        MOVR    R5,     R4                      ; 52C7   00AC
        ANDR    R0,     R5                      ; 52C8   0185
        BNEQ    L_52D2                          ; 52C9   020C 0007

        XORR    R0,     R4                      ; 52CB   01C4
        MVO     R4,     G_0184                  ; 52CC   0244 0184

        JSR     R5,     L_552D                  ; 52CE   0004 0154 012D

        PULR    R7                              ; 52D1   02B7

L_52D2:
        PSHR    R1                              ; 52D2   0271
L_52D3:
        CLRR    R0                              ; 52D3   01C0
        B       L_52AA                          ; 52D4   0220 002B

L_52D6:
        MVI     G_031E, R0                      ; 52D6   0280 031E
        SDBD                                    ; 52D8   0001
        CMPI    #$98D8, R0                      ; 52D9   0378 00D8 0098
        BNEQ    L_52F6                          ; 52DC   020C 0018

        PULR    R1                              ; 52DE   02B1
        PSHR    R1                              ; 52DF   0271

        JSR     R5,     .EXEC.766               ; 52E0   0004 0114 0366
        DECLE   $0004,  $01A0,  $01EC,  $00A8   ; 52E3   0004 01A0 01EC 00A8
        DECLE   $0272,  $0004,  $01A0,  $0194   ; 52E7   0272 0004 01A0 0194
        DECLE   $0005                           ; 52EB   0005

        PULR    R2                              ; 52EC   02B2
        MVI@    R5,     R1                      ; 52ED   02A9
        MVII    #$000F, R0                      ; 52EE   02B8 000F

        JSR     R5,     X_RAND2                 ; 52F0   0004 0114 029E

        CMPR    R0,     R1                      ; 52F3   0141
        BLT     L_5309                          ; 52F4   0205 0013

L_52F6:
        MVI     G_031F, R0                      ; 52F6   0280 031F
        MVI     G_0320, R1                      ; 52F8   0281 0320
        SWAP    R0,     1                       ; 52FA   0040
        ANDI    #$00FF, R0                      ; 52FB   03B8 00FF
        SWAP    R1,     1                       ; 52FD   0041
        SUBI    #$0002, R1                      ; 52FE   0339 0002
        ANDI    #$00FF, R1                      ; 5300   03B9 00FF
        SUBR    R2,     R0                      ; 5302   0110
        SUBR    R3,     R1                      ; 5303   0119

        JSR     R5,     .EXEC.A2F               ; 5304   0004 0118 022F

        B       L_52A7                          ; 5307   0220 0061

L_5309:
        PULR    R1                              ; 5309   02B1
        PULR    R7                              ; 530A   02B7

        ADCR    R4                              ; 530B   002C
        ADCR    R0                              ; 530C   0028
        SWAP    R2,     2                       ; 530D   0046
        ADCR    R0                              ; 530E   0028
        ADCR    R4                              ; 530F   002C
        TSTR    R0                              ; 5310   0080
        SWAP    R2,     2                       ; 5311   0046
        TSTR    R0                              ; 5312   0080
        ADCR    R4                              ; 5313   002C
        RSWD    R0                              ; 5314   0038
        SWAP    R2,     2                       ; 5315   0046
        RSWD    R0                              ; 5316   0038
        ADCR    R4                              ; 5317   002C
        RRC     R0,     1                       ; 5318   0070
        SWAP    R2,     2                       ; 5319   0046
        RRC     R0,     1                       ; 531A   0070
L_531B:
        ADDR    R4,     R4                      ; 531B   00E4
        DECR    R0                              ; 531C   0010
        ANDI    #$0004, R0                      ; 531D   03B8 0004
        ADDR    R0,     R0                      ; 531F   00C0
        ADDR    R7,     R4                      ; 5320   00FC
        SUBI    #$0016, R4                      ; 5321   033C 0016
        ADDR    R0,     R4                      ; 5323   00C4
        SDBD                                    ; 5324   0001
        MVI@    R4,     R2                      ; 5325   02A2
        MVII    #$0018, R3                      ; 5326   02BB 0018
        PULR    R1                              ; 5328   02B1

        JSR     R5,     .EXEC.9A3               ; 5329   0004 0118 01A3

        MOVR    R1,     R5                      ; 532C   008D
        ADDI    #$0004, R5                      ; 532D   02FD 0004
        MVI@    R5,     R0                      ; 532F   02A8
        B       L_52AB                          ; 5330   0220 0086

L_5332:
        MVI     G_017A, R4                      ; 5332   0284 017A
        XOR     G_017B, R4                      ; 5334   03C4 017B
        PSHR    R0                              ; 5336   0270
        RRC     R0,     2                       ; 5337   0074
        MOVR    R4,     R0                      ; 5338   00A0
        RRC     R0,     1                       ; 5339   0070
        CLRR    R0                              ; 533A   01C0
        RLC     R0,     2                       ; 533B   0054
        MOVR    R0,     R4                      ; 533C   0084
        PULR    R0                              ; 533D   02B0
L_533E:
        MOVR    R5,     R7                      ; 533E   00AF

L_533F:
        PSHR    R5                              ; 533F   0275
        PSHR    R4                              ; 5340   0274

        JSR     R5,     L_5355                  ; 5341   0004 0150 0355

        CMP@    R4,     R2                      ; 5344   0362
        BLT     L_5352                          ; 5345   0205 000B

        CMP@    R4,     R3                      ; 5347   0363
        BLT     L_5352                          ; 5348   0205 0008

        CMP@    R4,     R2                      ; 534A   0362
        BGT     L_5352                          ; 534B   020E 0005

        CMP@    R4,     R3                      ; 534D   0363
        BGT     L_5352                          ; 534E   020E 0002

        SETC                                    ; 5350   0007
        INCR    R7                              ; 5351   000F

L_5352:
        CLRC                                    ; 5352   0006
L_5353:
        PULR    R4                              ; 5353   02B4
        PULR    R7                              ; 5354   02B7

L_5355:
        ADDR    R4,     R4                      ; 5355   00E4
        ADDR    R4,     R4                      ; 5356   00E4
        INCR    R4                              ; 5357   000C
        ADDR    R7,     R4                      ; 5358   00FC
        MOVR    R5,     R7                      ; 5359   00AF

        DECLE   $0016,  $0021,  $0050,  $0035   ; 535A   0016 0021 0050 0035
        DECLE   $0008,  $003A,  $0050,  $0050   ; 535E   0008 003A 0050 0050
        DECLE   $0058,  $0021,  $009A,  $0035   ; 5362   0058 0021 009A 0035

        SLLC    R0,     1                       ; 5366   0058
        RSWD    R2                              ; 5367   003A
        MOVR    R4,     R2                      ; 5368   00A2
        RLC     R0,     1                       ; 5369   0050
L_536A:
        PSHR    R5                              ; 536A   0275
        MVI     G_017B, R5                      ; 536B   0285 017B
        ANDI    #$002F, R5                      ; 536D   03BD 002F
        XORI    #$00C0, R5                      ; 536F   03FD 00C0
        MVO     R5,     G_017B                  ; 5371   0245 017B

        JSR     R5,     L_5568                  ; 5373   0004 0154 0168

        PULR    R7                              ; 5376   02B7

L_5377:
        PSHR    R5                              ; 5377   0275
        MVI     G_017B, R0                      ; 5378   0280 017B
        MOVR    R0,     R2                      ; 537A   0082
        ANDI    #$0080, R0                      ; 537B   03B8 0080
        BNEQ    L_55AC                          ; 537D   020C 022D

        JSR     R5,     L_551E                  ; 537F   0004 0154 011E

        CLRR    R4                              ; 5382   01E4
        B       L_5394                          ; 5383   0200 000F

L_5385:
        PSHR    R5                              ; 5385   0275
        MVI     G_017B, R0                      ; 5386   0280 017B
        MOVR    R0,     R2                      ; 5388   0082
        ANDI    #$0040, R0                      ; 5389   03B8 0040
        BNEQ    L_55AC                          ; 538B   020C 021F

        JSR     R5,     L_5513                  ; 538D   0004 0154 0113

        MVII    #$0001, R4                      ; 5390   02BC 0001
        XORI    #$0001, R2                      ; 5392   03FA 0001
L_5394:
        ANDI    #$0001, R2                      ; 5394   03BA 0001
        MOVR    R2,     R5                      ; 5396   0095
        ADDI    #$011F, R2                      ; 5397   02FA 011F
        ADDI    #$01EC, R5                      ; 5399   02FD 01EC
        MVI@    R5,     R5                      ; 539B   02AD
        TSTR    R5                              ; 539C   00AD
        BEQ     L_53A3                          ; 539D   0204 0004

        SUBI    #$011F, R2                      ; 539F   033A 011F
        ADDI    #$01EE, R2                      ; 53A1   02FA 01EE
L_53A3:
        PSHR    R1                              ; 53A3   0271
        MVI@    R2,     R1                      ; 53A4   0291
        MOVR    R1,     R0                      ; 53A5   0088
        ANDI    #$00C0, R0                      ; 53A6   03B8 00C0
        BNEQ    L_53AF                          ; 53A8   020C 0005

        MOVR    R4,     R3                      ; 53AA   00A3

        JSR     R5,     L_554C                  ; 53AB   0004 0154 014C

        INCR    R7                              ; 53AE   000F

L_53AF:
        CLRR    R0                              ; 53AF   01C0
L_53B0:
        PULR    R1                              ; 53B0   02B1

        JSR     R5,     L_59B5                  ; 53B1   0004 0158 01B5

        PULR    R7                              ; 53B4   02B7

        DECLE   $0004                           ; 53B5   0004

        MOVR    R5,     R0                      ; 53B6   00A8
        NEGR    R3                              ; 53B7   0023
L_53B8:
        PSHR    R5                              ; 53B8   0275
        CMPI    #$000A, R0                      ; 53B9   0378 000A
        BEQ     L_5423                          ; 53BB   0204 0066

        CMPI    #$000B, R0                      ; 53BD   0378 000B
        BEQ     L_5423                          ; 53BF   0204 0062

        DECR    R0                              ; 53C1   0010
        BMI     L_5423                          ; 53C2   020B 005F

        MOVR    R1,     R3                      ; 53C4   008B
        MOVR    R1,     R5                      ; 53C5   008D
        XOR     G_017B, R1                      ; 53C6   03C1 017B
        ANDI    #$0001, R1                      ; 53C8   03B9 0001
        BNEQ    L_5424                          ; 53CA   020C 0058

        JSR     R5,     L_5518                  ; 53CC   0004 0154 0118

        BNEQ    L_55AC                          ; 53CF   020C 01DB

        JSR     R5,     L_540D                  ; 53D1   0004 0154 000D

        MVI@    R1,     R5                      ; 53D4   028D
        SDBD                                    ; 53D5   0001
        ANDI    #$FDFF, R5                      ; 53D6   03BD 00FF 00FD
        TSTR    R3                              ; 53D9   009B
        BPL     L_53DE                          ; 53DA   0203 0002

        XORI    #$0200, R5                      ; 53DC   03FD 0200
L_53DE:
        MVO@    R5,     R1                      ; 53DE   024D
        MVO     R0,     G_0187                  ; 53DF   0240 0187
        MVI     G_017B, R5                      ; 53E1   0285 017B
        ANDI    #$00D1, R5                      ; 53E3   03BD 00D1
        XORI    #$0006, R5                      ; 53E5   03FD 0006
        MVO     R5,     G_017B                  ; 53E7   0245 017B
        ADDI    #$0010, R1                      ; 53E9   02F9 0010

        JSR     R5,     L_540D                  ; 53EB   0004 0154 000D

        PSHR    R2                              ; 53EE   0272
        ADDI    #$0010, R1                      ; 53EF   02F9 0010

        JSR     R5,     L_540D                  ; 53F1   0004 0154 000D

        MVII    #$0185, R3                      ; 53F4   02BB 0185
        CMP@    R6,     R2                      ; 53F6   0372
        BGE     L_53FA                          ; 53F7   020D 0001

        INCR    R3                              ; 53F9   000B
L_53FA:
        MVO@    R0,     R3                      ; 53FA   0258
        MOVR    R4,     R2                      ; 53FB   00A2
        ADDI    #$0305, R2                      ; 53FC   02FA 0305
        MVII    #$002D, R3                      ; 53FE   02BB 002D
        CLRR    R0                              ; 5400   01C0

        JSR     R5,     .EXEC.9B9               ; 5401   0004 0118 01B9
        JSR     R5,     L_508E                  ; 5404   0004 0150 008E

        SDBD                                    ; 5407   0001
        MVII    #$9980, R2                      ; 5408   02BA 0080 0099
        B       L_550D                          ; 540B   0200 0100

L_540D:
        PSHR    R5                              ; 540D   0275
        PSHR    R1                              ; 540E   0271
        PSHR    R0                              ; 540F   0270
        MOVR    R1,     R4                      ; 5410   008C
        ADDI    #$0002, R4                      ; 5411   02FC 0002

        JSR     R5,     L_523C                  ; 5413   0004 0150 023C

        MOVR    R0,     R2                      ; 5416   0082
        MOVR    R1,     R3                      ; 5417   008B

        JSR     R5,     X_PACK_BYTES            ; 5418   0004 0114 034F

        PSHR    R0                              ; 541B   0270

        JSR     R5,     .EXEC.7A3               ; 541C   0004 0114 03A3

        PULR    R4                              ; 541F   02B4
        PULR    R0                              ; 5420   02B0
        PULR    R1                              ; 5421   02B1
        PULR    R7                              ; 5422   02B7
L_5423:
        PULR    R7                              ; 5423   02B7

L_5424:
        COMR    R5                              ; 5424   001D
        ANDI    #$0001, R5                      ; 5425   03BD 0001
        INCR    R5                              ; 5427   000D
        MOVR    R5,     R0                      ; 5428   00A8
        MOVR    R5,     R3                      ; 5429   00AB
        PSHR    R5                              ; 542A   0275
        ADDI    #$0002, R0                      ; 542B   02F8 0002
        ADDI    #$0004, R3                      ; 542D   02FB 0004

        JSR     R5,     L_5956                  ; 542F   0004 0158 0156

        PULR    R0                              ; 5432   02B0
        MOVR    R0,     R3                      ; 5433   0083
        ADDI    #$0002, R3                      ; 5434   02FB 0002

        JSR     R5,     L_5956                  ; 5436   0004 0158 0156
        JSR     R5,     L_5588                  ; 5439   0004 0154 0188

        PULR    R7                              ; 543C   02B7

        DECLE   $0004                           ; 543D   0004

        MOVR    R5,     R0                      ; 543E   00A8
        NEGR    R3                              ; 543F   0023
L_5440:
        PSHR    R5                              ; 5440   0275
        DECR    R0                              ; 5441   0010
        BNEQ    L_55AC                          ; 5442   020C 0168

        MOVR    R1,     R2                      ; 5444   008A
        XOR     G_017B, R2                      ; 5445   03C2 017B
        ANDI    #$0001, R2                      ; 5447   03BA 0001
        BNEQ    L_545D                          ; 5449   020C 0012
        B       L_548E                          ; 544B   0200 0041

        DECLE   $0004                           ; 544D   0004

        MOVR    R5,     R0                      ; 544E   00A8
        NEGR    R3                              ; 544F   0023
L_5450:
        PSHR    R5                              ; 5450   0275
        DECR    R0                              ; 5451   0010
        BNEQ    L_55AC                          ; 5452   020C 0158

        MOVR    R1,     R2                      ; 5454   008A
        XOR     G_017B, R2                      ; 5455   03C2 017B
        ANDI    #$0001, R2                      ; 5457   03BA 0001
        BNEQ    L_545D                          ; 5459   020C 0002
        B       L_54CC                          ; 545B   0200 006F

L_545D:
        SLL     R1,     2                       ; 545D   004D
        SLL     R1,     1                       ; 545E   0049
        ADDI    #$0326, R1                      ; 545F   02F9 0326
        MVI@    R1,     R2                      ; 5461   028A
        SDBD                                    ; 5462   0001
        CMPI    #$98CF, R2                      ; 5463   037A 00CF 0098
        BEQ     L_55AC                          ; 5466   0204 0144

        JSR     R5,     L_5513                  ; 5468   0004 0154 0113

        MVI@    R1,     R0                      ; 546B   0288
        ANDI    #$0008, R0                      ; 546C   03B8 0008
        BNEQ    L_55AC                          ; 546E   020C 013C

        JSR     R5,     L_552D                  ; 5470   0004 0154 012D

        SUBI    #$0003, R1                      ; 5473   0339 0003
        MOVR    R1,     R4                      ; 5475   008C
        MVI     G_017F, R2                      ; 5476   0282 017F
        MVI     G_0180, R3                      ; 5478   0283 0180

        JSR     R5,     .EXEC.784               ; 547A   0004 0114 0384
        JSR     R5,     .EXEC.A2F               ; 547D   0004 0118 022F

        CMPI    #$00FA, R2                      ; 5480   037A 00FA
        RLC     R1,     1                       ; 5482   0051
        MVO     R1,     G_017C                  ; 5483   0241 017C
        MVI     G_0184, R0                      ; 5485   0280 0184
        ANDI    #$00FE, R0                      ; 5487   03B8 00FE
        XORI    #$0001, R0                      ; 5489   03F8 0001
        MVO     R0,     G_0184                  ; 548B   0240 0184
        PULR    R7                              ; 548D   02B7

L_548E:
        JSR     R5,     L_5518                  ; 548E   0004 0154 0118

        BNEQ    L_55AC                          ; 5491   020C 0119

        PSHR    R1                              ; 5493   0271
        MOVR    R1,     R4                      ; 5494   008C
        ADDI    #$0002, R4                      ; 5495   02FC 0002
        MVI     G_017F, R0                      ; 5497   0280 017F
        MVI     G_0180, R1                      ; 5499   0281 0180

        JSR     R5,     L_6BF4                  ; 549B   0004 0168 03F4

        MVII    #$0038, R3                      ; 549E   02BB 0038

        JSR     R5,     .EXEC.7A3               ; 54A0   0004 0114 03A3

        CMPI    #$0006, R2                      ; 54A3   037A 0006
        BGT     L_54AF                          ; 54A5   020E 0008

        SDBD                                    ; 54A7   0001
        MVII    #$995A, R2                      ; 54A8   02BA 005A 0099
        MVII    #$00D4, R3                      ; 54AB   02BB 00D4
        B       L_54B5                          ; 54AD   0200 0006

L_54AF:
        SDBD                                    ; 54AF   0001
        MVII    #$9947, R2                      ; 54B0   02BA 0047 0099
        MVII    #$00D6, R3                      ; 54B3   02BB 00D6
L_54B5:
        PULR    R1                              ; 54B5   02B1
        MVII    #$0016, R0                      ; 54B6   02B8 0016
        MVII    #$020F, R4                      ; 54B8   02BC 020F
        COMR    R4                              ; 54BA   001C

        JSR     R5,     L_5536                  ; 54BB   0004 0154 0136

        MVII    #$000D, R3                      ; 54BE   02BB 000D
        SDBD                                    ; 54C0   0001
        CMPI    #$995A, R2                      ; 54C1   037A 005A 0099
        BNEQ    L_54C8                          ; 54C4   020C 0002

        MVII    #$000A, R3                      ; 54C6   02BB 000A
L_54C8:
        MVII    #$0001, R4                      ; 54C8   02BC 0001
        B       L_54E0                          ; 54CA   0200 0014

L_54CC:
        JSR     R5,     L_5518                  ; 54CC   0004 0154 0118

        BNEQ    L_55AC                          ; 54CF   020C 00DB

        SDBD                                    ; 54D1   0001
        MVII    #$9934, R2                      ; 54D2   02BA 0034 0099
        CLRR    R3                              ; 54D5   01DB
        MVII    #$020F, R4                      ; 54D6   02BC 020F
        COMR    R4                              ; 54D8   001C

        JSR     R5,     L_553B                  ; 54D9   0004 0154 013B

        MVII    #$0002, R4                      ; 54DC   02BC 0002
        MVII    #$000A, R3                      ; 54DE   02BB 000A
L_54E0:
        MVO     R4,     G_0182                  ; 54E0   0244 0182
        INCR    R1                              ; 54E2   0009
        MVO@    R3,     R1                      ; 54E3   024B
        MVI     G_017B, R0                      ; 54E4   0280 017B
        ANDI    #$0057, R0                      ; 54E6   03B8 0057
        XORI    #$0088, R0                      ; 54E8   03F8 0088
        MVO     R0,     G_017B                  ; 54EA   0240 017B
        SUBI    #$0006, R1                      ; 54EC   0339 0006
        MVI@    R1,     R0                      ; 54EE   0288
        SDBD                                    ; 54EF   0001
        ANDI    #$FDFF, R0                      ; 54F0   03B8 00FF 00FD
        MOVR    R1,     R4                      ; 54F3   008C
        ADDI    #$0002, R4                      ; 54F4   02FC 0002
        MVI@    R4,     R3                      ; 54F6   02A3
        SWAP    R3,     1                       ; 54F7   0043
        ANDI    #$00FF, R3                      ; 54F8   03BB 00FF

        JSR     R5,     L_5B29                  ; 54FA   0004 0158 0329

        CMPR    R2,     R3                      ; 54FD   0153
        BMI     L_5502                          ; 54FE   020B 0002

        XORI    #$0200, R0                      ; 5500   03F8 0200
L_5502:
        MVO@    R0,     R1                      ; 5502   0248

        JSR     R5,     L_50A5                  ; 5503   0004 0150 00A5
        JSR     R5,     L_6B73                  ; 5506   0004 0168 0373

        SDBD                                    ; 5509   0001
        MVII    #$98FE, R2                      ; 550A   02BA 00FE 0098
L_550D:
        MVO     R2,     G_031E                  ; 550D   0242 031E
        CLRR    R2                              ; 550F   01D2
        MVO     R2,     G_0322                  ; 5510   0242 0322
        PULR    R7                              ; 5512   02B7

L_5513:
        PSHR    R5                              ; 5513   0275
        MVI     G_017B, R5                      ; 5514   0285 017B
        B       L_5523                          ; 5516   0200 000B

L_5518:
        MVI     G_017B, R2                      ; 5518   0282 017B
        ANDI    #$0008, R2                      ; 551A   03BA 0008
        BNEQ    L_55AC                          ; 551C   020C 008E

L_551E:
        PSHR    R5                              ; 551E   0275
        MVI     G_017B, R5                      ; 551F   0285 017B
        XORI    #$0001, R5                      ; 5521   03FD 0001
L_5523:
        MOVR    R5,     R1                      ; 5523   00A9
        ANDI    #$0001, R1                      ; 5524   03B9 0001
        SLL     R1,     2                       ; 5526   004D
        SLL     R1,     1                       ; 5527   0049
        ADDI    #$0325, R1                      ; 5528   02F9 0325
        ANDI    #$0002, R5                      ; 552A   03BD 0002
        PULR    R7                              ; 552C   02B7

L_552D:
        MVII    #$0018, R0                      ; 552D   02B8 0018
        SDBD                                    ; 552F   0001
        MVII    #$98CF, R2                      ; 5530   02BA 00CF 0098
        MVII    #$00D2, R3                      ; 5533   02BB 00D2
        CLRR    R4                              ; 5535   01E4
L_5536:
        PSHR    R5                              ; 5536   0275
        DECLE   $0004                           ; 5537   0004

        ANDR    R5,     R4                      ; 5538   01AC
        XORR    R3,     R1                      ; 5539   01D9
        PULR    R5                              ; 553A   02B5
L_553B:
        INCR    R1                              ; 553B   0009
        MVO@    R2,     R1                      ; 553C   024A
        ADDI    #$0003, R1                      ; 553D   02F9 0003
        MVO@    R3,     R1                      ; 553F   024B
        INCR    R1                              ; 5540   0009
        MVO@    R4,     R1                      ; 5541   024C
        MOVR    R5,     R7                      ; 5542   00AF

        NEGR    R0                              ; 5543   0020
        COMR    R4                              ; 5544   001C
        DECR    R4                              ; 5545   0014
        DECR    R0                              ; 5546   0010
        INCR    R6                              ; 5547   000E
        DECR    R0                              ; 5548   0010
        DECR    R4                              ; 5549   0014
        COMR    R4                              ; 554A   001C
L_554B:
        CLRR    R3                              ; 554B   01DB
L_554C:
        PSHR    R5                              ; 554C   0275
        MOVR    R1,     R5                      ; 554D   008D
        ANDI    #$0007, R5                      ; 554E   03BD 0007
        ADDR    R7,     R5                      ; 5550   00FD
        SUBI    #$000E, R5                      ; 5551   033D 000E
        MVI@    R5,     R0                      ; 5553   02A8
        TSTR    R3                              ; 5554   009B
        BEQ     L_555A                          ; 5555   0204 0003

        PSHR    R0                              ; 5557   0270
        SLR     R0,     2                       ; 5558   0064
        ADD@    R6,     R0                      ; 5559   02F0

L_555A:
        JSR     R5,     .EXEC.629               ; 555A   0004 0114 0229

        PULR    R7                              ; 555D   02B7

        DECLE   $0000,  $0000                   ; 555E   0000 0000

        MOVR    R6,     R5                      ; 5560   00B5
        RLC     R3,     1                       ; 5561   0053
        RSWD    R5                              ; 5562   003D
        RLC     R0,     2                       ; 5563   0054
        SLL     R1,     2                       ; 5564   004D
        RLC     R0,     2                       ; 5565   0054
        SLL     R1,     2                       ; 5566   004D
        RLC     R0,     2                       ; 5567   0054
L_5568:
        MVI     G_017B, R0                      ; 5568   0280 017B
        DECLE   $03B8,  $003F,  $03F8,  $00C0   ; 556A   03B8 003F 03F8 00C0
        DECLE   $0240,  $017B,  $0001,  $02B8   ; 556E   0240 017B 0001 02B8
        DECLE   $0006,  $0019,  $0240,  $035D   ; 5572   0006 0019 0240 035D
        DECLE   $0275,  $0004                   ; 5576   0275 0004

        ANDR    R5,     R0                      ; 5578   01A8
        COMR    R3                              ; 5579   001B
        PULR    R5                              ; 557A   02B5
        B       L_5594                          ; 557B   0200 0017

L_557D:
        MVI     G_017B, R0                      ; 557D   0280 017B
        ANDI    #$003F, R0                      ; 557F   03B8 003F
        MVO     R0,     G_017B                  ; 5581   0240 017B
        MOVR    R7,     R0                      ; 5583   00B8
        SUBI    #$0026, R0                      ; 5584   0338 0026
        MVO     R0,     G_035D                  ; 5586   0240 035D
L_5588:
        PSHR    R5                              ; 5588   0275

        JSR     R5,     L_5594                  ; 5589   0004 0154 0194

        MVII    #$0002, R5                      ; 558C   02BD 0002
        MVII    #$0015, R2                      ; 558E   02BA 0015
        MVII    #$0012, R3                      ; 5590   02BB 0012
        B       L_559B                          ; 5592   0200 0007

L_5594:
        PSHR    R5                              ; 5594   0275
        MVII    #$0006, R5                      ; 5595   02BD 0006
        MVII    #$0001, R2                      ; 5597   02BA 0001
        MVII    #$0002, R3                      ; 5599   02BB 0002
L_559B:
        MVII    #$0325, R1                      ; 559B   02B9 0325
L_559D:
        MVI@    R1,     R0                      ; 559D   0288
        SDBD                                    ; 559E   0001
        ANDI    #$FFE8, R0                      ; 559F   03B8 00E8 00FF
        XORR    R2,     R0                      ; 55A2   01D0
        MVO@    R0,     R1                      ; 55A3   0248
        ADDI    #$0008, R1                      ; 55A4   02F9 0008
        PSHR    R2                              ; 55A6   0272
        MOVR    R3,     R2                      ; 55A7   009A
        PULR    R3                              ; 55A8   02B3
        DECR    R5                              ; 55A9   0015
        BNEQ    L_559D                          ; 55AA   022C 000E
L_55AC:
        PULR    R7                              ; 55AC   02B7

        DECLE   $0064,  $00C8,  $012C,  $0190   ; 55AD   0064 00C8 012C 0190
        DECLE   $01F4,  $0354,  $035C,  $0000   ; 55B1   01F4 0354 035C 0000
        DECLE   $0000,  $00FA,  $0055,  $0000   ; 55B5   0000 00FA 0055 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55B9   0000 0000 0000 0000
        DECLE   $0000                           ; 55BD   0000
L_55BE:
        PSHR    R5                              ; 55BE   0275

        JSR     R5,     L_6648                  ; 55BF   0004 0164 0248
        JSR     R5,     .EXEC.7B3               ; 55C2   0004 0114 03B3

        MVII    #$0003, R0                      ; 55C5   02B8 0003
        MVO     R0,     G_0102                  ; 55C7   0240 0102

        JSR     R5,     L_5FB6                  ; 55C9   0004 015C 03B6

L_55CC:
        DECR    R7                              ; 55CC   0017

        RSWD    R0                              ; 55CD   0038
        MOVR    R2,     R1                      ; 55CE   0091

        JSR     R5,     L_5E9D                  ; 55CF   0004 015C 029D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 55D2   0000 0000 0000 0000

        CLRR    R0                              ; 55D6   01C0
        MVO     R0,     G_0171                  ; 55D7   0240 0171
        MVII    #$0208, R4                      ; 55D9   02BC 0208

        JSR     R5,     L_66A9                  ; 55DB   0004 0164 02A9

        MVII    #$0001, R0                      ; 55DE   02B8 0001
        MVO     R0,     G_0171                  ; 55E0   0240 0171
        MVII    #$0280, R4                      ; 55E2   02BC 0280

        JSR     R5,     L_66A9                  ; 55E4   0004 0164 02A9
        DECLE   $0004,  $0168,  $0042           ; 55E7   0004 0168 0042

        TSTR    R6                              ; 55EA   00B6
        RLC     R2,     2                       ; 55EB   0056
        MVII    #$0004, R0                      ; 55EC   02B8 0004
        MVO     R0,     G_0172                  ; 55EE   0240 0172
        SDBD                                    ; 55F0   0001
        MVII    #$55B4, R0                      ; 55F1   02B8 00B4 0055
        MVO     R0,     G_035D                  ; 55F4   0240 035D

        JSR     R5,     L_5691                  ; 55F6   0004 0154 0291

        PULR    R7                              ; 55F9   02B7

        PSHR    R5                              ; 55FA   0275
        MVO     R1,     G_0171                  ; 55FB   0241 0171
        TSTR    R0                              ; 55FD   0080
        BEQ     L_560D                          ; 55FE   0204 000D

        CMPI    #$0009, R0                      ; 5600   0378 0009
        BGT     L_560D                          ; 5602   020E 0009

        MOVR    R1,     R2                      ; 5604   008A
        ADDI    #$0185, R2                      ; 5605   02FA 0185
        MVI@    R2,     R5                      ; 5607   0295
        DECR    R5                              ; 5608   0015
        BMI     L_560E                          ; 5609   020B 0003
        BEQ     L_5674                          ; 560B   0204 0067
L_560D:
        PULR    R7                              ; 560D   02B7

L_560E:
        CMPI    #$0002, R0                      ; 560E   0378 0002
        BGT     L_560D                          ; 5610   022E 0004

        DECR    R0                              ; 5612   0010
        ADDI    #$01EC, R1                      ; 5613   02F9 01EC
        MVO@    R0,     R1                      ; 5615   0248
        MVII    #$0001, R0                      ; 5616   02B8 0001
        MVO@    R0,     R2                      ; 5618   0250

        JSR     R5,     L_5E5D                  ; 5619   0004 015C 025D
        DECLE   $0004                           ; 561C   0004

        ANDR    R4,     R0                      ; 561D   01A0
        ANDR    R7,     R6                      ; 561E   01BE
        ADDI    #$0014, R4                      ; 561F   02FC 0014
        MVII    #$0064, R0                      ; 5621   02B8 0064

        JSR     R5,     X_FILL_ZERO             ; 5623   0004 0114 0338

        MVII    #$0003, R3                      ; 5626   02BB 0003
        SUBI    #$005D, R4                      ; 5628   033C 005D

        JSR     R5,     X_PRINT_R5              ; 562A   0004 0118 007B
        STRING  "budget"                        ; 562D  
        DECLE   $0000                           ; 5633   0000

        JSR     R5,     L_5639                  ; 5634   0004 0154 0239
        DECLE   $0002,  $0001                   ; 5637   0002 0001
L_5639:
        ADD     G_0171, R5                      ; 5639   02C5 0171
        MVI@    R5,     R3                      ; 563B   02AB
        ADDI    #$001C, R4                      ; 563C   02FC 001C

        JSR     R5,     X_PRINT_R5              ; 563E   0004 0118 007B
        STRING  "1"                             ; 5641   0031
        DECLE   $0000                           ; 5642   0000

        PSHR    R3                              ; 5643   0273
        MVII    #$0003, R3                      ; 5644   02BB 0003
        INCR    R4                              ; 5646   000C

        JSR     R5,     X_PRINT_R5              ; 5647   0004 0118 007B
        STRING  "$1,000,000 -to-"               ; 564A  
        DECLE   $0000                           ; 5659   0000

        PULR    R3                              ; 565A   02B3
        ADDI    #$0003, R4                      ; 565B   02FC 0003

        JSR     R5,     X_PRINT_R5              ; 565D   0004 0118 007B
        STRING  "5"                             ; 5660   0035
        DECLE   $0000                           ; 5661   0000

        MVII    #$0003, R3                      ; 5662   02BB 0003
        INCR    R4                              ; 5664   000C

        JSR     R5,     X_PRINT_R5              ; 5665   0004 0118 007B
        STRING  "$5,000,000"                    ; 5668  
        DECLE   $0000                           ; 5672   0000

        PULR    R7                              ; 5673   02B7

L_5674:
        CMPI    #$0005, R0                      ; 5674   0378 0005
        BGT     L_560D                          ; 5676   022E 006A

        DECR    R0                              ; 5678   0010
        ADDI    #$0173, R1                      ; 5679   02F9 0173
        MVO@    R0,     R1                      ; 567B   0248
        MVII    #$0002, R0                      ; 567C   02B8 0002
        MVO@    R0,     R2                      ; 567E   0250

        JSR     R5,     L_5E5D                  ; 567F   0004 015C 025D

        MVI     G_0185, R0                      ; 5682   0280 0185
        ADD     G_0186, R0                      ; 5684   02C0 0186
        CMPI    #$0004, R0                      ; 5686   0378 0004
        BNEQ    L_568D                          ; 5688   020C 0003
        J       L_6920                          ; 568A   0004 0368 0120

L_568D:
        JSR     R5,     L_66CA                  ; 568D   0004 0164 02CA

        PULR    R7                              ; 5690   02B7

L_5691:
        PSHR    R5                              ; 5691   0275
        MVII    #$018B, R4                      ; 5692   02BC 018B
        MVII    #$003A, R0                      ; 5694   02B8 003A
        MVO@    R0,     R4                      ; 5696   0260
        DECR    R0                              ; 5697   0010
L_5698:
        MVO@    R0,     R4                      ; 5698   0260
        DECR    R0                              ; 5699   0010
        BPL     L_5698                          ; 569A   0223 0003

        JSR     R5,     L_6004                  ; 569C   0004 0160 0004
        DECLE   $018B                           ; 569F   018B

        MVII    #$0019, R0                      ; 56A0   02B8 0019
        MVO     R0,     G_018B                  ; 56A2   0240 018B
        MVII    #$01C6, R4                      ; 56A4   02BC 01C6
        MVII    #$0010, R0                      ; 56A6   02B8 0010
        MVO@    R0,     R4                      ; 56A8   0260
        DECR    R0                              ; 56A9   0010
L_56AA:
        MVII    #$003A, R1                      ; 56AA   02B9 003A
        ADDR    R0,     R1                      ; 56AC   00C1
        MVO@    R1,     R4                      ; 56AD   0261
        DECR    R0                              ; 56AE   0010
        BPL     L_56AA                          ; 56AF   0223 0006

        JSR     R5,     L_6004                  ; 56B1   0004 0160 0004
        DECLE   $01C6                           ; 56B4   01C6

        PULR    R7                              ; 56B5   02B7

        DECLE   $0003,  $021B,  $0073,  $0065   ; 56B6   0003 021B 0073 0065
        DECLE   $006C,  $0065,  $0063,  $0074   ; 56BA   006C 0065 0063 0074
        DECLE   $0000,  $023F,  $006C,  $0065   ; 56BE   0000 023F 006C 0065
        DECLE   $0066,  $0074,  $0020,  $0063   ; 56C2   0066 0074 0020 0063
        DECLE   $006F,  $006E,  $0074,  $0072   ; 56C6   006F 006E 0074 0072
        DECLE   $006F,  $006C,  $0073,  $0000   ; 56CA   006F 006C 0073 0000
        DECLE   $0253,  $0063,  $006F,  $006D   ; 56CE   0253 0063 006F 006D
        DECLE   $0070,  $0075,  $0074,  $0065   ; 56D2   0070 0075 0074 0065
        DECLE   $0072,  $0020,  $0070,  $006C   ; 56D6   0072 0020 0070 006C
        DECLE   $0061,  $0079,  $0065,  $0072   ; 56DA   0061 0079 0065 0072
        DECLE   $0000,  $0293,  $0073,  $0065   ; 56DE   0000 0293 0073 0065
        DECLE   $006C,  $0065,  $0063,  $0074   ; 56E2   006C 0065 0063 0074
        DECLE   $0000,  $02B7,  $0072,  $0069   ; 56E6   0000 02B7 0072 0069
        DECLE   $0067,  $0068,  $0074,  $0020   ; 56EA   0067 0068 0074 0020
        DECLE   $0063,  $006F,  $006E,  $0074   ; 56EE   0063 006F 006E 0074
        DECLE   $0072,  $006F,  $006C,  $0073   ; 56F2   0072 006F 006C 0073
        DECLE   $0000,  $02CB,  $0063,  $006F   ; 56F6   0000 02CB 0063 006F
        DECLE   $006D,  $0070,  $0075,  $0074   ; 56FA   006D 0070 0075 0074
        DECLE   $0065,  $0072,  $0020,  $0070   ; 56FE   0065 0072 0020 0070
        DECLE   $006C,  $0061,  $0079,  $0065   ; 5702   006C 0061 0079 0065
        DECLE   $0072,  $0001,  $0002,  $023D   ; 5706   0072 0001 0002 023D
        DECLE   $0031,  $0000,  $0251,  $0032   ; 570A   0031 0000 0251 0032
        DECLE   $0001,  $0001,  $02B5,  $0031   ; 570E   0001 0001 02B5 0031
        DECLE   $0000,  $02C9,  $0032,  $0000   ; 5712   0000 02C9 0032 0000
L_5716:
        PSHR    R5                              ; 5716   0275

        JSR     R5,     L_551E                  ; 5717   0004 0154 011E

        BNEQ    L_577D                          ; 571A   020C 0061

        CLRR    R0                              ; 571C   01C0
        MVO     R0,     G_0321                  ; 571D   0240 0321
        MVI     G_017B, R0                      ; 571F   0280 017B
        ANDI    #$0020, R0                      ; 5721   03B8 0020
        BEQ     L_573E                          ; 5723   0204 0019

        MVI     G_0322, R0                      ; 5725   0280 0322
        ANDI    #$000F, R0                      ; 5727   03B8 000F
        CMPI    #$0002, R0                      ; 5729   0378 0002
        BNEQ    L_5738                          ; 572B   020C 000B

        MVI     G_0183, R5                      ; 572D   0285 0183
        TSTR    R5                              ; 572F   00AD
        BNEQ    L_573B                          ; 5730   020C 0009

        JSR     R5,     L_5A9C                  ; 5732   0004 0158 029C

        MVII    #$0001, R5                      ; 5735   02BD 0001
        INCR    R7                              ; 5737   000F

L_5738:
        CLRR    R5                              ; 5738   01ED
L_5739:
        MVO     R5,     G_0183                  ; 5739   0245 0183
L_573B:
        COMR    R0                              ; 573B   0018
        XORI    #$000F, R0                      ; 573C   03F8 000F
L_573E:
        MVO     R0,     G_0322                  ; 573E   0240 0322
        MVI@    R1,     R3                      ; 5740   028B
        ADDI    #$0002, R1                      ; 5741   02F9 0002
        MVI@    R1,     R0                      ; 5743   0288
        SWAP    R0,     1                       ; 5744   0040
        ANDI    #$00FF, R0                      ; 5745   03B8 00FF
        PSHR    R0                              ; 5747   0270
        ANDI    #$0200, R3                      ; 5748   03BB 0200
        BNEQ    L_574E                          ; 574A   020C 0002

        ADDI    #$0007, R0                      ; 574C   02F8 0007
L_574E:
        DECR    R0                              ; 574E   0010
        INCR    R1                              ; 574F   0009
        MVI@    R1,     R1                      ; 5750   0289
        SWAP    R1,     1                       ; 5751   0041
        ANDI    #$00FF, R1                      ; 5752   03B9 00FF
        PSHR    R1                              ; 5754   0271
        MVI     G_017B, R4                      ; 5755   0284 017B
        ANDI    #$0008, R4                      ; 5757   03BC 0008
        SUBR    R4,     R1                      ; 5759   0121
        ADDI    #$0008, R1                      ; 575A   02F9 0008

        JSR     R5,     L_5B29                  ; 575C   0004 0158 0329

        SUBI    #$0003, R2                      ; 575F   033A 0003
        MVII    #$0040, R3                      ; 5761   02BB 0040
        SWAP    R0,     1                       ; 5763   0040
        MVO     R0,     G_031F                  ; 5764   0240 031F
        SWAP    R1,     1                       ; 5766   0041
        TSTR    R4                              ; 5767   00A4
        MVO     R1,     G_0320                  ; 5768   0241 0320
        PULR    R1                              ; 576A   02B1
        PULR    R0                              ; 576B   02B0
        BNEQ    L_577D                          ; 576C   020C 000F

        JSR     R5,     .EXEC.78C               ; 576E   0004 0114 038C

        MVII    #$017D, R5                      ; 5771   02BD 017D
        MVO@    R2,     R5                      ; 5773   026A
        SWAP    R2,     1                       ; 5774   0042
        MVO@    R2,     R5                      ; 5775   026A
        MVO@    R3,     R5                      ; 5776   026B
        MVO@    R4,     R5                      ; 5777   026C

        JSR     R5,     .EXEC.A2F               ; 5778   0004 0118 022F

        MVO     R1,     G_0181                  ; 577B   0241 0181
L_577D:
        PULR    R7                              ; 577D   02B7

L_577E:
        PSHR    R5                              ; 577E   0275
        MVII    #$0006, R3                      ; 577F   02BB 0006
        MVII    #$031D, R4                      ; 5781   02BC 031D
L_5783:
        ADDI    #$0008, R4                      ; 5783   02FC 0008
        PSHR    R4                              ; 5785   0274
        MVI@    R4,     R0                      ; 5786   02A0
        ANDI    #$0008, R0                      ; 5787   03B8 0008
        BNEQ    L_57C7                          ; 5789   020C 003C

        MVI@    R4,     R5                      ; 578B   02A5
        MVI@    R5,     R0                      ; 578C   02A8
        SWAP    R0,     1                       ; 578D   0040
        SARC    R0,     2                       ; 578E   007C
        BNC     L_57C7                          ; 578F   0209 0036
        BNOV    L_57C7                          ; 5791   020A 0034

        MVI@    R4,     R0                      ; 5793   02A0
        MVI@    R4,     R1                      ; 5794   02A1
        SWAP    R0,     1                       ; 5795   0040
        ANDI    #$00FF, R0                      ; 5796   03B8 00FF
        SWAP    R1,     1                       ; 5798   0041
        ANDI    #$00FF, R1                      ; 5799   03B9 00FF
        MVI@    R4,     R2                      ; 579B   02A2
        DECR    R4                              ; 579C   0014
        SUBI    #$0020, R1                      ; 579D   0339 0020
        BMI     L_57C7                          ; 579F   020B 0026

        SLR     R1,     1                       ; 57A1   0061
        CMPI    #$0020, R0                      ; 57A2   0378 0020
        BLE     L_57B4                          ; 57A4   0206 000E

        CMPI    #$0088, R0                      ; 57A6   0378 0088
        BLT     L_57C7                          ; 57A8   0205 001D

        ADDI    #$0088, R1                      ; 57AA   02F9 0088
        SUBR    R0,     R1                      ; 57AC   0101
        BGT     L_57C7                          ; 57AD   020E 0018

        TSTR    R2                              ; 57AF   0092
        BMI     L_57C2                          ; 57B0   020B 0010
        B       L_57BE                          ; 57B2   0200 000A

L_57B4:
        PSHR    R1                              ; 57B4   0271
        MVII    #$0020, R1                      ; 57B5   02B9 0020
        SUB@    R6,     R1                      ; 57B7   0331
        SUBR    R0,     R1                      ; 57B8   0101
        BLT     L_57C7                          ; 57B9   0205 000C

        TSTR    R2                              ; 57BB   0092
        BPL     L_57C2                          ; 57BC   0203 0004

L_57BE:
        ANDI    #$00FF, R2                      ; 57BE   03BA 00FF
        MVO@    R2,     R4                      ; 57C0   0262
        DECR    R4                              ; 57C1   0014
L_57C2:
        ADDR    R1,     R0                      ; 57C2   00C8
        SUBI    #$0002, R4                      ; 57C3   033C 0002
        SWAP    R0,     1                       ; 57C5   0040
        MVO@    R0,     R4                      ; 57C6   0260
L_57C7:
        PULR    R4                              ; 57C7   02B4
        DECR    R3                              ; 57C8   0013
        BNEQ    L_5783                          ; 57C9   022C 0047
        PULR    R7                              ; 57CB   02B7

        PSHR    R5                              ; 57CC   0275
        MVII    #$0302, R4                      ; 57CD   02BC 0302

        JSR     R5,     .EXEC.70F               ; 57CF   0004 0114 030F

        BNC     L_577D                          ; 57D2   0229 0056

        MOVR    R1,     R2                      ; 57D4   008A

        JSR     R5,     L_551E                  ; 57D5   0004 0154 011E

        BNEQ    L_577D                          ; 57D8   022C 005C

        CMPR    R1,     R2                      ; 57DA   014A
        BNEQ    L_577D                          ; 57DB   022C 005F

        JSR     R5,     .EXEC.766               ; 57DD   0004 0114 0366

        XORR    R3,     R0                      ; 57E0   01D8
        ANDI    #$0001, R0                      ; 57E1   03B8 0001
        BEQ     L_577D                          ; 57E3   0224 0067

        MVII    #$0004, R0                      ; 57E5   02B8 0004

        JSR     R5,     X_RAND1                 ; 57E7   0004 0114 027D
        DECLE   $0080,  $022C,  $006F,  $0280   ; 57EA   0080 022C 006F 0280
        DECLE   $01EA,  $0080,  $022C,  $0074   ; 57EE   01EA 0080 022C 0074
        DECLE   $0098,  $0004,  $01A0,  $01EC   ; 57F2   0098 0004 01A0 01EC
        DECLE   $00AC,  $00A0,  $0004           ; 57F6   00AC 00A0 0004

        ANDR    R4,     R0                      ; 57F9   01A0
        ANDR    R2,     R4                      ; 57FA   0194
        INCR    R0                              ; 57FB   0008
        MVI@    R5,     R0                      ; 57FC   02A8

        JSR     R5,     L_5AA5                  ; 57FD   0004 0158 02A5
        DECLE   $022E,  $0084,  $00A0,  $0004   ; 5800   022E 0084 00A0 0004
        DECLE   $01A0,  $0238,  $0006,  $0270   ; 5804   01A0 0238 0006 0270
        DECLE   $0004                           ; 5808   0004

        ANDR    R5,     R4                      ; 5809   01AC
        MVO@    R2,     R1                      ; 580A   024A
        MVI     G_01E7, R0                      ; 580B   0280 01E7
        TSTR    R0                              ; 580D   0080
        BEQ     L_5814                          ; 580E   0204 0004

        MVII    #$0003, R0                      ; 5810   02B8 0003
        B       L_5816                          ; 5812   0200 0002

L_5814:
        MVII    #$0005, R0                      ; 5814   02B8 0005
L_5816:
        MVO     R0,     G_01EA                  ; 5816   0240 01EA

        JSR     R5,     L_509D                  ; 5818   0004 0150 009D
        JSR     R5,     X_PLAY_WHST1            ; 581B   0004 011C 031B
        JSR     R5,     L_536A                  ; 581E   0004 0150 036A
        JSR     R5,     L_5AAE                  ; 5821   0004 0158 02AE
        DECLE   $02B0,  $0270,  $0004           ; 5824   02B0 0270 0004

        ANDR    R4,     R0                      ; 5827   01A0
        MVO@    R4,     R1                      ; 5828   024C
        CLRC                                    ; 5829   0006
        CMPI    #$0006, R0                      ; 582A   0378 0006
        PULR    R0                              ; 582C   02B0
        BLT     L_577D                          ; 582D   0225 00B1
        BEQ     L_583B                          ; 582F   0204 000A

        MVI     G_01EA, R0                      ; 5831   0280 01EA
        ADDI    #$0002, R0                      ; 5833   02F8 0002
        MVO     R0,     G_01EA                  ; 5835   0240 01EA
        MVII    #$0002, R0                      ; 5837   02B8 0002
        B       L_5840                          ; 5839   0200 0005

L_583B:
        JSR     R5,     L_5AC9                  ; 583B   0004 0158 02C9

        MVII    #$0081, R0                      ; 583E   02B8 0081
L_5840:
        MVO     R0,     G_01EB                  ; 5840   0240 01EB

        JSR     R5,     L_585B                  ; 5842   0004 0158 005B

        PULR    R7                              ; 5845   02B7

        DECLE   $0046,  $006F,  $0075,  $006C   ; 5846   0046 006F 0075 006C
        DECLE   $0065,  $0064,  $0020,  $004F   ; 584A   0065 0064 0020 004F
        DECLE   $0075,  $0074,  $0000,  $0054   ; 584E   0075 0074 0000 0054
        DECLE   $0065,  $0063,  $0068,  $006E   ; 5852   0065 0063 0068 006E
        DECLE   $0069,  $0063,  $0061,  $006C   ; 5856   0069 0063 0061 006C
        DECLE   $0000                           ; 585A   0000
L_585B:
        PSHR    R5                              ; 585B   0275
        MVI     G_01EB, R0                      ; 585C   0280 01EB
        TSTR    R0                              ; 585E   0080
        BEQ     L_5878                          ; 585F   0204 0017

        SDBD                                    ; 5861   0001
        MVII    #$2006, R3                      ; 5862   02BB 0006 0020
        MVII    #$0219, R4                      ; 5865   02BC 0219
        SDBD                                    ; 5867   0001
        MVII    #$5846, R1                      ; 5868   02B9 0046 0058
        ANDI    #$000F, R0                      ; 586B   03B8 000F
        CMPI    #$0001, R0                      ; 586D   0378 0001
        BEQ     L_5875                          ; 586F   0204 0004

        SDBD                                    ; 5871   0001
        MVII    #$5851, R1                      ; 5872   02B9 0051 0058

L_5875:
        JSR     R5,     X_PRINT_R1              ; 5875   0004 0118 0067

L_5878:
        PULR    R7                              ; 5878   02B7

        PSHR    R5                              ; 5879   0275
        MOVR    R0,     R5                      ; 587A   0085
        XORR    R3,     R5                      ; 587B   01DD
        ANDI    #$0001, R5                      ; 587C   03BD 0001
        BEQ     L_577D                          ; 587E   0224 0102

        MVII    #$0302, R4                      ; 5880   02BC 0302

        JSR     R5,     .EXEC.70F               ; 5882   0004 0114 030F

        BNC     L_577D                          ; 5885   0229 0109

        CMPI    #$0335, R1                      ; 5887   0379 0335
        BPL     L_5910                          ; 5889   0203 0085

        JSR     R5,     .EXEC.2CA               ; 588B   0004 0110 02CA

        MOVR    R1,     R2                      ; 588E   008A

        JSR     R5,     L_551E                  ; 588F   0004 0154 011E

        BNEQ    L_577D                          ; 5892   022C 0116

        CMPR    R1,     R2                      ; 5894   014A
        BNEQ    L_577D                          ; 5895   022C 0119

        JSR     R5,     .EXEC.766               ; 5897   0004 0114 0366

        XORR    R3,     R0                      ; 589A   01D8
        ANDI    #$0001, R0                      ; 589B   03B8 0001
        BEQ     L_577D                          ; 589D   0224 0121

        MVII    #$0004, R0                      ; 589F   02B8 0004

        JSR     R5,     X_RAND1                 ; 58A1   0004 0114 027D

        TSTR    R0                              ; 58A4   0080
        BNEQ    L_577D                          ; 58A5   022C 0129

        MVI     G_01EA, R0                      ; 58A7   0280 01EA
        TSTR    R0                              ; 58A9   0080
        BNEQ    L_577D                          ; 58AA   022C 012E

        MVII    #$0002, R0                      ; 58AC   02B8 0002

        JSR     R5,     X_RAND1                 ; 58AE   0004 0114 027D
        DECLE   $0010,  $022B,  $0136,  $0204   ; 58B1   0010 022B 0136 0204
        DECLE   $004E,  $0098,  $0004,  $01A0   ; 58B5   004E 0098 0004 01A0
        DECLE   $01EC,  $00AC,  $00A0,  $0004   ; 58B9   01EC 00AC 00A0 0004

        ANDR    R4,     R0                      ; 58BD   01A0
        ANDR    R2,     R4                      ; 58BE   0194
        INCR    R0                              ; 58BF   0008
        MVI@    R5,     R0                      ; 58C0   02A8

        JSR     R5,     L_5AA5                  ; 58C1   0004 0158 02A5
        DECLE   $022E,  $0148,  $00A0,  $0004   ; 58C4   022E 0148 00A0 0004
        DECLE   $01A0,  $0238,  $0006,  $0270   ; 58C8   01A0 0238 0006 0270
        DECLE   $0004                           ; 58CC   0004

        ANDR    R5,     R4                      ; 58CD   01AC
        MVO@    R2,     R1                      ; 58CE   024A
        MVII    #$0002, R0                      ; 58CF   02B8 0002
        MVO     R0,     G_01EA                  ; 58D1   0240 01EA

        JSR     R5,     L_509D                  ; 58D3   0004 0150 009D
        JSR     R5,     X_PLAY_WHST1            ; 58D6   0004 011C 031B
        JSR     R5,     L_536A                  ; 58D9   0004 0150 036A
        JSR     R5,     L_5AAE                  ; 58DC   0004 0158 02AE
        DECLE   $02B0,  $0270,  $0004,  $01A0   ; 58DF   02B0 0270 0004 01A0
        DECLE   $024C,  $0006,  $0378,  $0006   ; 58E3   024C 0006 0378 0006
        DECLE   $02B0,  $0205,  $0016           ; 58E7   02B0 0205 0016

        BEQ     L_58F6                          ; 58EA   0204 000A

        MVI     G_01EA, R0                      ; 58EC   0280 01EA
        ADDI    #$0002, R0                      ; 58EE   02F8 0002
        MVO     R0,     G_01EA                  ; 58F0   0240 01EA
        MVII    #$0002, R0                      ; 58F2   02B8 0002
        B       L_58FB                          ; 58F4   0200 0005

L_58F6:
        JSR     R5,     L_5AC9                  ; 58F6   0004 0158 02C9

        MVII    #$0081, R0                      ; 58F9   02B8 0081
L_58FB:
        MVO     R0,     G_01EB                  ; 58FB   0240 01EB

        JSR     R5,     L_585B                  ; 58FD   0004 0158 005B
        DECLE   $0004                           ; 5900   0004

        ANDR    R4,     R0                      ; 5901   01A0
        AND@    R2,     R2                      ; 5902   0392
        PULR    R7                              ; 5903   02B7

        MVII    #$0001, R0                      ; 5904   02B8 0001

        JSR     R5,     X_RAND1                 ; 5906   0004 0114 027D
        DECLE   $0080,  $0224,  $018E,  $0004   ; 5909   0080 0224 018E 0004

        ANDR    R5,     R4                      ; 590D   01AC
        XORR    R5,     R6                      ; 590E   01EE
        PULR    R7                              ; 590F   02B7

L_5910:
        MOVR    R1,     R2                      ; 5910   008A
        ADDI    #$0004, R2                      ; 5911   02FA 0004
        MVI@    R2,     R5                      ; 5913   0295
        TSTR    R5                              ; 5914   00AD
        BEQ     L_577D                          ; 5915   0224 0199

        PSHR    R2                              ; 5917   0272

        JSR     R5,     .EXEC.2CA               ; 5918   0004 0110 02CA

        PULR    R2                              ; 591B   02B2
        MVI@    R2,     R5                      ; 591C   0295
        TSTR    R5                              ; 591D   00AD
        BNEQ    L_577D                          ; 591E   022C 01A2

        MOVR    R3,     R0                      ; 5920   0098

        JSR     R5,     .EXEC.777               ; 5921   0004 0114 0377

        PSHR    R1                              ; 5924   0271
        PSHR    R2                              ; 5925   0272
        PSHR    R3                              ; 5926   0273

        JSR     R5,     .EXEC.772               ; 5927   0004 0114 0372

        SUB@    R6,     R3                      ; 592A   0333
        SUB@    R6,     R2                      ; 592B   0332
        PULR    R1                              ; 592C   02B1
        PSHR    R3                              ; 592D   0273
        PSHR    R2                              ; 592E   0272
        MOVR    R0,     R3                      ; 592F   0083
        MVII    #$0202, R4                      ; 5930   02BC 0202

        JSR     R5,     .EXEC.70F               ; 5932   0004 0114 030F

        CLRR    R0                              ; 5935   01C0
        RRC     R0,     1                       ; 5936   0070
        PSHR    R0                              ; 5937   0270
        MVII    #$0301, R4                      ; 5938   02BC 0301

        JSR     R5,     .EXEC.70F               ; 593A   0004 0114 030F

        PULR    R5                              ; 593D   02B5
        PULR    R2                              ; 593E   02B2
        PULR    R3                              ; 593F   02B3
        MVII    #$0019, R0                      ; 5940   02B8 0019
        BC      L_594E                          ; 5942   0201 000A

        TSTR    R5                              ; 5944   00AD
        BNEQ    L_594B                          ; 5945   020C 0004

        MOVR    R2,     R5                      ; 5947   0095
        XORR    R3,     R5                      ; 5948   01DD
        BMI     L_594E                          ; 5949   020B 0003

L_594B:
        MOVR    R3,     R2                      ; 594B   009A
        NEGR    R2                              ; 594C   0022
        SWAP    R0,     1                       ; 594D   0040
L_594E:
        TSTR    R2                              ; 594E   0092
        BMI     L_5952                          ; 594F   020B 0001

        NEGR    R0                              ; 5951   0020
L_5952:
        ADDI    #$0004, R1                      ; 5952   02F9 0004
        MVO@    R0,     R1                      ; 5954   0248
        PULR    R7                              ; 5955   02B7

L_5956:
        PSHR    R5                              ; 5956   0275
        CMPR    R0,     R3                      ; 5957   0143
        BEQ     L_5986                          ; 5958   0204 002C

        PSHR    R0                              ; 595A   0270
        PSHR    R3                              ; 595B   0273
        SARC    R0,     1                       ; 595C   0078
        SARC    R3,     1                       ; 595D   007B
        BC      L_5962                          ; 595E   0201 0002

        DECR    R0                              ; 5960   0010
        DECR    R3                              ; 5961   0013
L_5962:
        SDBD                                    ; 5962   0001
        MVII    #$A1B1, R1                      ; 5963   02B9 00B1 00A1
        ADCR    R1                              ; 5966   0029
        MVI@    R1,     R1                      ; 5967   0289
        INCR    R1                              ; 5968   0009
        MOVR    R1,     R2                      ; 5969   008A
        ADDR    R0,     R1                      ; 596A   00C1
        ADDR    R3,     R2                      ; 596B   00DA
        MVI@    R1,     R0                      ; 596C   0288
        MVI@    R2,     R3                      ; 596D   0293
        MVO@    R0,     R2                      ; 596E   0250
        MVO@    R3,     R1                      ; 596F   024B
        PULR    R3                              ; 5970   02B3
        PULR    R0                              ; 5971   02B0

        JSR     R5,     .EXEC.76C               ; 5972   0004 0114 036C

        MOVR    R1,     R2                      ; 5975   008A
        MOVR    R3,     R0                      ; 5976   0098

        JSR     R5,     .EXEC.76C               ; 5977   0004 0114 036C

        MOVR    R1,     R3                      ; 597A   008B
        MVII    #$0008, R4                      ; 597B   02BC 0008
L_597D:
        MVI@    R2,     R0                      ; 597D   0290
        MVI@    R3,     R1                      ; 597E   0299
        MVO@    R0,     R3                      ; 597F   0258
        MVO@    R1,     R2                      ; 5980   0251
        INCR    R2                              ; 5981   000A
        INCR    R3                              ; 5982   000B
        DECR    R4                              ; 5983   0014
        BNEQ    L_597D                          ; 5984   022C 0008
L_5986:
        PULR    R7                              ; 5986   02B7

L_5987:
        PSHR    R5                              ; 5987   0275
        CLRR    R4                              ; 5988   01E4
L_5989:
        MOVR    R4,     R0                      ; 5989   00A0

        JSR     R5,     .EXEC.76C               ; 598A   0004 0114 036C

        MOVR    R1,     R3                      ; 598D   008B
        MVI@    R3,     R0                      ; 598E   0298
        ANDI    #$0008, R0                      ; 598F   03B8 0008
        BEQ     L_59AF                          ; 5991   0204 001C

        ADDI    #$0004, R3                      ; 5993   02FB 0004
        MVI@    R3,     R0                      ; 5995   0298
        MOVR    R0,     R1                      ; 5996   0081
        SWAP    R0,     1                       ; 5997   0040
        ADDI    #$0004, R1                      ; 5998   02F9 0004

        JSR     R5,     X_PACK_BYTES            ; 599A   0004 0114 034F

        MVO@    R0,     R3                      ; 599D   0258
        ADDI    #$0003, R3                      ; 599E   02FB 0003
        MVI@    R3,     R0                      ; 59A0   0298
        DECR    R0                              ; 59A1   0010
        MVO@    R0,     R3                      ; 59A2   0258
        BNEQ    L_59AF                          ; 59A3   020C 000A

        SUBI    #$0007, R3                      ; 59A5   033B 0007
        MVI@    R3,     R0                      ; 59A7   0298
        XORI    #$0008, R0                      ; 59A8   03F8 0008
        MVO@    R0,     R3                      ; 59AA   0258
        CLRR    R0                              ; 59AB   01C0
        ADDI    #$0004, R3                      ; 59AC   02FB 0004
        MVO@    R0,     R3                      ; 59AE   0258
L_59AF:
        INCR    R4                              ; 59AF   000C
        CMPI    #$0007, R4                      ; 59B0   037C 0007
        BMI     L_5989                          ; 59B2   022B 002A
        PULR    R7                              ; 59B4   02B7

L_59B5:
        PSHR    R5                              ; 59B5   0275
L_59B6:
        MVI@    R1,     R3                      ; 59B6   028B
        ADDI    #$0004, R1                      ; 59B7   02F9 0004
        ANDI    #$0008, R3                      ; 59B9   03BB 0008
        BEQ     L_59C2                          ; 59BB   0204 0005

        CMPI    #$0001, R4                      ; 59BD   037C 0001
        BEQ     L_577D                          ; 59BF   0224 0243
        INCR    R7                              ; 59C1   000F

L_59C2:
        MVO@    R0,     R1                      ; 59C2   0248
L_59C3:
        MVI     G_017B, R2                      ; 59C3   0282 017B
        TSTR    R0                              ; 59C5   0080
        BEQ     L_5A0E                          ; 59C6   0204 0046

        SUBI    #$0004, R1                      ; 59C8   0339 0004
        DECR    R4                              ; 59CA   0014
        BNEQ    L_59DD                          ; 59CB   020C 0010

        JSR     R5,     L_5A5E                  ; 59CD   0004 0158 025E

        BPL     L_59FB                          ; 59D0   0203 0029

        JSR     R5,     L_5A8B                  ; 59D2   0004 0158 028B

        SDBD                                    ; 59D5   0001
        MVII    #$9905, R2                      ; 59D6   02BA 0005 0099
        MVII    #$0001, R3                      ; 59D9   02BB 0001
        B       L_5A04                          ; 59DB   0200 0027
L_59DD:
        BPL     L_59FB                          ; 59DD   0203 001C

        MOVR    R2,     R5                      ; 59DF   0095
        ANDI    #$0002, R5                      ; 59E0   03BD 0002
        BNEQ    L_59F0                          ; 59E2   020C 000C

        ANDI    #$00DF, R2                      ; 59E4   03BA 00DF
        XORI    #$0020, R2                      ; 59E6   03FA 0020
        MVO     R2,     G_017B                  ; 59E8   0242 017B
        SDBD                                    ; 59EA   0001
        MVII    #$98B6, R5                      ; 59EB   02BD 00B6 0098
        MVO     R5,     G_031E                  ; 59EE   0245 031E
L_59F0:
        MOVR    R2,     R5                      ; 59F0   0095
        ANDI    #$0008, R5                      ; 59F1   03BD 0008
        BEQ     L_59FB                          ; 59F3   0204 0006

        ANDI    #$00FB, R2                      ; 59F5   03BA 00FB
        XORI    #$0004, R2                      ; 59F7   03FA 0004
        MVO     R2,     G_017B                  ; 59F9   0242 017B

L_59FB:
        JSR     R5,     L_5A7E                  ; 59FB   0004 0158 027E

        SDBD                                    ; 59FE   0001
        MVII    #$996D, R2                      ; 59FF   02BA 006D 0099
        MVII    #$0007, R3                      ; 5A02   02BB 0007
L_5A04:
        INCR    R1                              ; 5A04   0009
        MVO@    R2,     R1                      ; 5A05   024A
        ADDI    #$0004, R1                      ; 5A06   02F9 0004
        AND@    R1,     R3                      ; 5A08   038B
        COMR    R3                              ; 5A09   001B
        XORI    #$000F, R3                      ; 5A0A   03FB 000F
        MVO@    R3,     R1                      ; 5A0C   024B
        PULR    R7                              ; 5A0D   02B7

L_5A0E:
        INCR    R4                              ; 5A0E   000C
        ADDR    R7,     R4                      ; 5A0F   00FC
        ADD@    R4,     R7                      ; 5A10   02E7

        DIS                                     ; 5A11   0003
        GSWD    R0                              ; 5A12   0030
        SWAP    R0,     1                       ; 5A13   0040
        MOVR    R2,     R5                      ; 5A14   0095
        ANDI    #$0020, R2                      ; 5A15   03BA 0020
        BNEQ    L_5A31                          ; 5A17   020C 0018

        MOVR    R5,     R2                      ; 5A19   00AA
        ANDI    #$0008, R5                      ; 5A1A   03BD 0008
        BNEQ    L_5A22                          ; 5A1C   020C 0004

        INCR    R1                              ; 5A1E   0009
        CLRR    R0                              ; 5A1F   01C0
        B       L_5A38                          ; 5A20   0200 0016

L_5A22:
        MOVR    R2,     R0                      ; 5A22   0090
        ANDI    #$0002, R0                      ; 5A23   03B8 0002
        BEQ     L_577D                          ; 5A25   0224 02A9

        ANDI    #$0004, R2                      ; 5A27   03BA 0004
        BNEQ    L_5A51                          ; 5A29   020C 0026

        INCR    R1                              ; 5A2B   0009
        MVI@    R1,     R0                      ; 5A2C   0288
        ANDI    #$000F, R0                      ; 5A2D   03B8 000F
        MVO@    R0,     R1                      ; 5A2F   0248
        PULR    R7                              ; 5A30   02B7

L_5A31:
        INCR    R1                              ; 5A31   0009
        MVI@    R1,     R0                      ; 5A32   0288
        ANDI    #$0003, R0                      ; 5A33   03B8 0003
        COMR    R0                              ; 5A35   0018
        XORI    #$000F, R0                      ; 5A36   03F8 000F
L_5A38:
        MVO@    R0,     R1                      ; 5A38   0248
        SDBD                                    ; 5A39   0001
        MVII    #$98AF, R2                      ; 5A3A   02BA 00AF 0098
        SUBI    #$0004, R1                      ; 5A3D   0339 0004
        MVO@    R2,     R1                      ; 5A3F   024A
        PULR    R7                              ; 5A40   02B7

        SUBI    #$0004, R1                      ; 5A41   0339 0004

        JSR     R5,     L_5A8B                  ; 5A43   0004 0158 028B

        SDBD                                    ; 5A46   0001
        MVII    #$9905, R2                      ; 5A47   02BA 0005 0099

        JSR     R5,     L_5A5E                  ; 5A4A   0004 0158 025E

        BMI     L_5A57                          ; 5A4D   020B 0008
        B       L_5A53                          ; 5A4F   0200 0002

L_5A51:
        SUBI    #$0004, R1                      ; 5A51   0339 0004
L_5A53:
        SDBD                                    ; 5A53   0001
        MVII    #$992D, R2                      ; 5A54   02BA 002D 0099
L_5A57:
        INCR    R1                              ; 5A57   0009
        MVO@    R2,     R1                      ; 5A58   024A
        ADDI    #$0004, R1                      ; 5A59   02F9 0004
        CLRR    R0                              ; 5A5B   01C0
        MVO@    R0,     R1                      ; 5A5C   0248
        PULR    R7                              ; 5A5D   02B7

L_5A5E:
        PSHR    R5                              ; 5A5E   0275
        ADDI    #$0002, R1                      ; 5A5F   02F9 0002
        MVI@    R1,     R5                      ; 5A61   028D
        SUB     G_031F, R5                      ; 5A62   0305 031F
        BPL     L_5A67                          ; 5A64   0203 0001

        NEGR    R5                              ; 5A66   0025
L_5A67:
        SUBI    #$0002, R1                      ; 5A67   0339 0002
        SDBD                                    ; 5A69   0001
        CMPI    #$1E00, R5                      ; 5A6A   037D 0000 001E
        BPL     L_577D                          ; 5A6D   0223 02F1

        ADDI    #$0003, R1                      ; 5A6F   02F9 0003
        MVI@    R1,     R5                      ; 5A71   028D
        SUB     G_0320, R5                      ; 5A72   0305 0320
        BPL     L_5A77                          ; 5A74   0203 0001

        NEGR    R5                              ; 5A76   0025
L_5A77:
        SUBI    #$0003, R1                      ; 5A77   0339 0003
        SDBD                                    ; 5A79   0001
        CMPI    #$1400, R5                      ; 5A7A   037D 0000 0014
        PULR    R7                              ; 5A7D   02B7

L_5A7E:
        PSHR    R5                              ; 5A7E   0275
        MVI@    R1,     R5                      ; 5A7F   028D
        SDBD                                    ; 5A80   0001
        ANDI    #$FDFF, R5                      ; 5A81   03BD 00FF 00FD
        TSTR    R0                              ; 5A84   0080
L_5A85:
        BPL     L_5A89                          ; 5A85   0203 0002

        XORI    #$0200, R5                      ; 5A87   03FD 0200
L_5A89:
        MVO@    R5,     R1                      ; 5A89   024D
        PULR    R7                              ; 5A8A   02B7

L_5A8B:
        PSHR    R5                              ; 5A8B   0275
        MVI@    R1,     R5                      ; 5A8C   028D
        SDBD                                    ; 5A8D   0001
        ANDI    #$FDFF, R5                      ; 5A8E   03BD 00FF 00FD
        MOVR    R1,     R3                      ; 5A91   008B
        ADDI    #$0002, R3                      ; 5A92   02FB 0002
        MVI@    R3,     R3                      ; 5A94   029B
        SLR     R3,     1                       ; 5A95   0063
        MVI     G_031F, R0                      ; 5A96   0280 031F
        SLR     R0,     1                       ; 5A98   0060
        SUBR    R3,     R0                      ; 5A99   0118
        B       L_5A85                          ; 5A9A   0220 0016

L_5A9C:
        PSHR    R5                              ; 5A9C   0275
        PSHR    R0                              ; 5A9D   0270
        PSHR    R1                              ; 5A9E   0271

        JSR     R5,     L_5DF8                  ; 5A9F   0004 015C 01F8

        PULR    R1                              ; 5AA2   02B1
        PULR    R0                              ; 5AA3   02B0
        PULR    R7                              ; 5AA4   02B7

L_5AA5:
        PSHR    R5                              ; 5AA5   0275
        PSHR    R0                              ; 5AA6   0270
        MVII    #$0060, R0                      ; 5AA7   02B8 0060

        JSR     R5,     X_RAND2                 ; 5AA9   0004 0114 029E

        CMP@    R6,     R0                      ; 5AAC   0370
        PULR    R7                              ; 5AAD   02B7

L_5AAE:
        MVII    #$0336, R4                      ; 5AAE   02BC 0336
        SDBD                                    ; 5AB0   0001
        MVII    #$992D, R1                      ; 5AB1   02B9 002D 0099
        CLRR    R0                              ; 5AB4   01C0
L_5AB5:
        MOVR    R4,     R2                      ; 5AB5   00A2
        DECR    R2                              ; 5AB6   0012
        MVI@    R2,     R3                      ; 5AB7   0293
        SDBD                                    ; 5AB8   0001
        ANDI    #$FFF7, R3                      ; 5AB9   03BB 00F7 00FF
        MVO@    R3,     R2                      ; 5ABC   0253
        MVO@    R1,     R4                      ; 5ABD   0261
        ADDI    #$0002, R4                      ; 5ABE   02FC 0002
        MVO@    R0,     R4                      ; 5AC0   0260
        MVO@    R0,     R4                      ; 5AC1   0260
        ADDI    #$0003, R4                      ; 5AC2   02FC 0003
        CMPI    #$0352, R4                      ; 5AC4   037C 0352
        BLE     L_5AB5                          ; 5AC6   0226 0012
        MOVR    R5,     R7                      ; 5AC8   00AF

L_5AC9:
        PSHR    R5                              ; 5AC9   0275
        DECLE   $0285,  $017B,  $03BD,  $0001   ; 5ACA   0285 017B 03BD 0001
        DECLE   $03FD,  $0001,  $0245,  $0171   ; 5ACE   03FD 0001 0245 0171
        DECLE   $0004                           ; 5AD2   0004

        ANDR    R4,     R0                      ; 5AD3   01A0
        ANDR    R6,     R3                      ; 5AD4   01B3
        MOVR    R5,     R4                      ; 5AD5   00AC

        JSR     R5,     L_5FE1                  ; 5AD6   0004 015C 03E1

        PULR    R7                              ; 5AD9   02B7

        PSHR    R5                              ; 5ADA   0275
        MVI     G_017B, R2                      ; 5ADB   0282 017B
        ANDI    #$007D, R2                      ; 5ADD   03BA 007D
        XORI    #$0002, R2                      ; 5ADF   03FA 0002
        MVO     R2,     G_017B                  ; 5AE1   0242 017B

        JSR     R5,     L_5B29                  ; 5AE3   0004 0158 0329

        MVII    #$031F, R4                      ; 5AE6   02BC 031F
        MVII    #$0034, R3                      ; 5AE8   02BB 0034

        JSR     R5,     .EXEC.784               ; 5AEA   0004 0114 0384

        PSHR    R0                              ; 5AED   0270
        PSHR    R1                              ; 5AEE   0271
        ADDI    #$0008, R1                      ; 5AEF   02F9 0008
        BPL     L_5AF4                          ; 5AF1   0203 0001

        NEGR    R1                              ; 5AF3   0021
L_5AF4:
        SLL     R1,     2                       ; 5AF4   004D
        SLR     R2,     1                       ; 5AF5   0062
        ADDR    R2,     R1                      ; 5AF6   00D1
        MVII    #$0028, R2                      ; 5AF7   02BA 0028
        SDBD                                    ; 5AF9   0001
        CMPI    #$0640, R1                      ; 5AFA   0379 0040 0006
        BPL     L_5B02                          ; 5AFD   0203 0003

        JSR     R5,     X_SQRT                  ; 5AFF   0004 011C 0223

L_5B02:
        MVO     R2,     G_0323                  ; 5B02   0242 0323
        INCR    R2                              ; 5B04   000A
        MOVR    R2,     R4                      ; 5B05   0094
        PULR    R1                              ; 5B06   02B1
        SLL     R1,     2                       ; 5B07   004D
        SLL     R1,     2                       ; 5B08   004D
        SLL     R1,     1                       ; 5B09   0049

        JSR     R5,     X_DIV                   ; 5B0A   0004 011C 01FB

        MOVR    R4,     R1                      ; 5B0D   00A1
        SLL     R1,     1                       ; 5B0E   0049
        SUBR    R1,     R0                      ; 5B0F   0108
        PULR    R1                              ; 5B10   02B1
        MOVR    R4,     R2                      ; 5B11   00A2
        PSHR    R0                              ; 5B12   0270
        SLL     R1,     2                       ; 5B13   004D
        SLL     R1,     2                       ; 5B14   004D
        SLL     R1,     1                       ; 5B15   0049

        JSR     R5,     X_DIV                   ; 5B16   0004 011C 01FB

        PULR    R1                              ; 5B19   02B1

        JSR     R5,     X_PACK_BYTES            ; 5B1A   0004 0114 034F
        DECLE   $0240,  $0321,  $00A0,  $02B9   ; 5B1D   0240 0321 00A0 02B9
        DECLE   $031D,  $0004                   ; 5B21   031D 0004

        ANDR    R5,     R4                      ; 5B23   01AC
        XORR    R3,     R1                      ; 5B24   01D9

        JSR     R5,     L_68F3                  ; 5B25   0004 0168 00F3

L_5B28:
        PULR    R7                              ; 5B28   02B7

L_5B29:
        PSHR    R5                              ; 5B29   0275

        JSR     R5,     L_5B34                  ; 5B2A   0004 0158 0334

        ADDI    #$0002, R2                      ; 5B2D   02FA 0002
        ADDR    R7,     R2                      ; 5B2F   00FA
        MVI@    R2,     R2                      ; 5B30   0292
        PULR    R7                              ; 5B31   02B7

        COMR    R2                              ; 5B32   001A
        MOVR    R2,     R4                      ; 5B33   0094
L_5B34:
        MVI     G_017B, R2                      ; 5B34   0282 017B
        XOR     G_017A, R2                      ; 5B36   03C2 017A
        ANDI    #$0001, R2                      ; 5B38   03BA 0001
        MOVR    R5,     R7                      ; 5B3A   00AF

        DECLE   $0275,  $01ED,  $0245,  $0184   ; 5B3B   0275 01ED 0245 0184
        DECLE   $0285,  $01E7,  $00AD,  $0204   ; 5B3F   0285 01E7 00AD 0204
        DECLE   $0079,  $0280,  $017B,  $03B8   ; 5B43   0079 0280 017B 03B8
        DECLE   $0001,  $03F8,  $0001,  $0008   ; 5B47   0001 03F8 0001 0008
        DECLE   $0004,  $01A0,  $01EC,  $00A8   ; 5B4B   0004 01A0 01EC 00A8
        DECLE   $0281,  $01E7,  $0379,  $0001   ; 5B4F   0281 01E7 0379 0001
        DECLE   $0204,  $0010,  $0379,  $0002   ; 5B53   0204 0010 0379 0002
        DECLE   $0204,  $0006,  $0004,  $01A0   ; 5B57   0204 0006 0004 01A0
        DECLE   $0238                           ; 5B5B   0238

        DIS                                     ; 5B5C   0003
        B       L_5B69                          ; 5B5D   0200 000A

        DECLE   $0004,  $01A0,  $0238,  $0001   ; 5B5F   0004 01A0 0238 0001
        DECLE   $0200,  $0004,  $0004,  $01A0   ; 5B63   0200 0004 0004 01A0
        DECLE   $0238,  $0005                   ; 5B67   0238 0005
L_5B69:
        MVII    #$0002, R0                      ; 5B69   02B8 0002

        JSR     R5,     X_PLAY_CHEER1           ; 5B6B   0004 011C 02D5
        JSR     R5,     L_5149                  ; 5B6E   0004 0150 0149

        MVI     G_01EA, R0                      ; 5B71   0280 01EA
        DECR    R0                              ; 5B73   0010
        BMI     L_5B7A                          ; 5B74   020B 0004

        MVO     R0,     G_01EA                  ; 5B76   0240 01EA
        BNEQ    L_5BA8                          ; 5B78   020C 002E

L_5B7A:
        MVI     G_01EB, R0                      ; 5B7A   0280 01EB
        CMPI    #$0002, R0                      ; 5B7C   0378 0002
        BNEQ    L_5B8A                          ; 5B7E   020C 000A

L_5B80:
        MVI     G_017B, R0                      ; 5B80   0280 017B
        DECLE   $03F8,  $0001,  $0240,  $017B   ; 5B82   03F8 0001 0240 017B
        DECLE   $02B5,  $0004                   ; 5B86   02B5 0004

        AND@    R5,     R4                      ; 5B88   03AC
        SUB@    R3,     R0                      ; 5B89   0318
L_5B8A:
        MVI     G_017B, R0                      ; 5B8A   0280 017B
        DECLE   $03B8,  $0008,  $02B5,  $0204   ; 5B8C   03B8 0008 02B5 0204
        DECLE   $0012,  $0280,  $017B,  $03B8   ; 5B90   0012 0280 017B 03B8
        DECLE   $0001,  $0204,  $0009           ; 5B94   0001 0204 0009

        PSHR    R5                              ; 5B97   0275
        MVII    #$0004, R0                      ; 5B98   02B8 0004
        MVII    #$0006, R3                      ; 5B9A   02BB 0006

        JSR     R5,     L_5956                  ; 5B9C   0004 0158 0156
        DECLE   $02B5,  $0004                   ; 5B9F   02B5 0004

        AND@    R5,     R4                      ; 5BA1   03AC
        SUB@    R3,     R0                      ; 5BA2   0318
L_5BA3:
        MVII    #$031D, R1                      ; 5BA3   02B9 031D
        J       .EXEC.7AE                       ; 5BA5   0004 0314 03AE

L_5BA8:
        CLRR    R0                              ; 5BA8   01C0
        DECLE   $0240,  $031E,  $0280,  $01EA   ; 5BA9   0240 031E 0280 01EA
        DECLE   $0378,  $0002,  $0204,  $0004   ; 5BAD   0378 0002 0204 0004
        DECLE   $0378,  $0004,  $020C,  $0004   ; 5BB1   0378 0004 020C 0004
        DECLE   $0004,  $0118,  $0261,  $001E   ; 5BB5   0004 0118 0261 001E
        DECLE   $0004                           ; 5BB9   0004

        ANDR    R4,     R0                      ; 5BBA   01A0
        AND@    R2,     R2                      ; 5BBB   0392
        PULR    R7                              ; 5BBC   02B7

        MVI     G_01EA, R0                      ; 5BBD   0280 01EA
        DECR    R0                              ; 5BBF   0010
        BMI     L_5BCB                          ; 5BC0   020B 0009

        MVO     R0,     G_01EA                  ; 5BC2   0240 01EA
        BEQ     L_5BCB                          ; 5BC4   0204 0005

        JSR     R5,     L_5E06                  ; 5BC6   0004 015C 0206

        B       L_5BA8                          ; 5BC9   0220 0022

L_5BCB:
        MVI     G_01EB, R0                      ; 5BCB   0280 01EB
        CMPI    #$0002, R0                      ; 5BCD   0378 0002
        BNEQ    L_5BD6                          ; 5BCF   020C 0005

        JSR     R5,     L_5E06                  ; 5BD1   0004 015C 0206

        B       L_5B80                          ; 5BD4   0220 0055

L_5BD6:
        MVI     G_0321, R0                      ; 5BD6   0280 0321
        PSHR    R0                              ; 5BD8   0270

        JSR     R5,     X_UNPK_BYTES            ; 5BD9   0004 0114 0357

        MVI     G_031F, R5                      ; 5BDC   0285 031F
        SDBD                                    ; 5BDE   0001
        SUBI    #$5800, R5                      ; 5BDF   033D 0000 0058
        XOR@    R6,     R5                      ; 5BE2   03F5
        BMI     L_5BE6                          ; 5BE3   020B 0001

        NEGR    R0                              ; 5BE5   0020

L_5BE6:
        JSR     R5,     X_PACK_BYTES            ; 5BE6   0004 0114 034F

        MVO     R0,     G_0321                  ; 5BE9   0240 0321
        MVII    #$0006, R0                      ; 5BEB   02B8 0006

        JSR     R5,     X_RAND2                 ; 5BED   0004 0114 029E

        ADDI    #$0004, R0                      ; 5BF0   02F8 0004
        MOVR    R0,     R3                      ; 5BF2   0083

        JSR     R5,     L_5CEC                  ; 5BF3   0004 015C 00EC
        JSR     R5,     L_5E06                  ; 5BF6   0004 015C 0206

        CLRR    R0                              ; 5BF9   01C0
        MVO     R0,     G_01EB                  ; 5BFA   0240 01EB
        CLRR    R0                              ; 5BFC   01C0
        MVO     R0,     G_0359                  ; 5BFD   0240 0359
        MVII    #$0177, R4                      ; 5BFF   02BC 0177
        SDBD                                    ; 5C01   0001
        MVI@    R4,     R0                      ; 5C02   02A0
        TSTR    R0                              ; 5C03   0080
        BEQ     L_5B28                          ; 5C04   0224 00DD

        MVI     G_017B, R0                      ; 5C06   0280 017B
        ANDI    #$00EF, R0                      ; 5C08   03B8 00EF
        XORI    #$0010, R0                      ; 5C0A   03F8 0010
        MVO     R0,     G_017B                  ; 5C0C   0240 017B
        SDBD                                    ; 5C0E   0001
        MVII    #$502C, R1                      ; 5C0F   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; 5C12   0004 0118 0044
        JSR     R5,     L_557D                  ; 5C15   0004 0154 017D

        PULR    R7                              ; 5C18   02B7

        PSHR    R5                              ; 5C19   0275

        JSR     R5,     L_5C57                  ; 5C1A   0004 015C 0057
        DECLE   $0280,  $0323,  $0378,  $000A   ; 5C1D   0280 0323 0378 000A
        DECLE   $0223,  $00FA,  $0098,  $0004   ; 5C21   0223 00FA 0098 0004
        DECLE   $01A0,  $01EC,  $00A8,  $0004   ; 5C25   01A0 01EC 00A8 0004
        DECLE   $01A0,  $0238,  $0007,  $0004   ; 5C29   01A0 0238 0007 0004

        ANDR    R5,     R4                      ; 5C2D   01AC
        XORR    R5,     R6                      ; 5C2E   01EE
        PULR    R7                              ; 5C2F   02B7

        PSHR    R5                              ; 5C30   0275

L_5C31:
        JSR     R5,     L_5C57                  ; 5C31   0004 015C 0057

        MOVR    R7,     R4                      ; 5C34   00BC
        XOR     G_017B, R0                      ; 5C35   03C0 017B
        ANDI    #$0001, R0                      ; 5C37   03B8 0001
        BEQ     L_5C48                          ; 5C39   0204 000D

        CLRR    R4                              ; 5C3B   01E4
        MVII    #$000A, R0                      ; 5C3C   02B8 000A

        JSR     R5,     X_RAND2                 ; 5C3E   0004 0114 029E

        ADDI    #$0006, R0                      ; 5C41   02F8 0006
        CMP     G_0324, R0                      ; 5C43   0340 0324
        BMI     L_5C4C                          ; 5C45   020B 0005

        CLRR    R3                              ; 5C47   01DB
L_5C48:
        CMPI    #$0003, R3                      ; 5C48   037B 0003
        BMI     L_5B28                          ; 5C4A   022B 0123

L_5C4C:
        JSR     R5,     L_51DF                  ; 5C4C   0004 0150 01DF
        DECLE   $0004                           ; 5C4F   0004

        ANDR    R5,     R4                      ; 5C50   01AC
        XORR    R6,     R1                      ; 5C51   01F1
        MVII    #$00FF, R0                      ; 5C52   02B8 00FF
        MVO     R0,     G_0187                  ; 5C54   0240 0187
        PULR    R7                              ; 5C56   02B7

L_5C57:
        PSHR    R5                              ; 5C57   0275
        MOVR    R3,     R0                      ; 5C58   0098

        JSR     R5,     .EXEC.772               ; 5C59   0004 0114 0372

        MVI     G_0320, R2                      ; 5C5C   0282 0320
        SWAP    R2,     1                       ; 5C5E   0042
        ANDI    #$00FF, R2                      ; 5C5F   03BA 00FF
        SUBR    R3,     R2                      ; 5C61   011A
        CMPI    #$000B, R2                      ; 5C62   037A 000B
        BMI     L_5C67                          ; 5C64   020B 0001

        PULR    R5                              ; 5C66   02B5
L_5C67:
        MOVR    R0,     R3                      ; 5C67   0083
        PULR    R7                              ; 5C68   02B7

        PSHR    R5                              ; 5C69   0275

L_5C6A:
        JSR     R5,     L_551E                  ; 5C6A   0004 0154 011E

        ADDI    #$0010, R1                      ; 5C6D   02F9 0010
        PSHR    R1                              ; 5C6F   0271

        JSR     R5,     .EXEC.777               ; 5C70   0004 0114 0377
        DECLE   $02FA,  $0003,  $02FB,  $0005   ; 5C73   02FA 0003 02FB 0005
        DECLE   $02BC,  $031F,  $0004           ; 5C77   02BC 031F 0004

        ANDR    R5,     R4                      ; 5C7A   01AC
        AND@    R5,     R3                      ; 5C7B   03AB
        PULR    R1                              ; 5C7C   02B1
        PSHR    R2                              ; 5C7D   0272
        ADDI    #$0010, R1                      ; 5C7E   02F9 0010

        JSR     R5,     .EXEC.777               ; 5C80   0004 0114 0377
        DECLE   $02FA,  $0003,  $02FB,  $0005   ; 5C83   02FA 0003 02FB 0005
        DECLE   $02BC,  $031F,  $0271,  $0004   ; 5C87   02BC 031F 0271 0004

        ANDR    R5,     R4                      ; 5C8B   01AC
        AND@    R5,     R3                      ; 5C8C   03AB
        PULR    R1                              ; 5C8D   02B1
        PULR    R3                              ; 5C8E   02B3
        CMPR    R3,     R2                      ; 5C8F   015A
        BLE     L_5C95                          ; 5C90   0206 0003

        SUBI    #$0010, R1                      ; 5C92   0339 0010
        MOVR    R3,     R2                      ; 5C94   009A
L_5C95:
        CMPI    #$0006, R2                      ; 5C95   037A 0006
        BLE     L_5CAD                          ; 5C97   0206 0014

        JSR     R5,     L_5097                  ; 5C99   0004 0150 0097
        DECLE   $02BB,  $000B,  $0243,  $0323   ; 5C9C   02BB 000B 0243 0323
        DECLE   $01C0,  $02B9,  $031D,  $0004   ; 5CA0   01C0 02B9 031D 0004

        ANDR    R5,     R4                      ; 5CA4   01AC
        XORR    R3,     R1                      ; 5CA5   01D9
        SDBD                                    ; 5CA6   0001
        MVII    #$98EB, R2                      ; 5CA7   02BA 00EB 0098
        MVO     R2,     G_031E                  ; 5CAA   0242 031E
        PULR    R7                              ; 5CAC   02B7

L_5CAD:
        JSR     R5,     .EXEC.766               ; 5CAD   0004 0114 0366

        MOVR    R0,     R3                      ; 5CB0   0083
        B       L_5C31                          ; 5CB1   0220 0081

        PSHR    R5                              ; 5CB3   0275

        JSR     R5,     .EXEC.772               ; 5CB4   0004 0114 0372

        CMPI    #$0060, R3                      ; 5CB7   037B 0060
        BPL     L_5CD6                          ; 5CB9   0203 001B

        SUBI    #$0030, R3                      ; 5CBB   033B 0030
        BMI     L_5CD6                          ; 5CBD   020B 0017

        SLR     R3,     1                       ; 5CBF   0063
        CMPI    #$0020, R2                      ; 5CC0   037A 0020
        BLE     L_5CCF                          ; 5CC2   0206 000B

        CMPI    #$0088, R2                      ; 5CC4   037A 0088
        BLT     L_5CE4                          ; 5CC6   0205 001C

        ADDI    #$0088, R3                      ; 5CC8   02FB 0088
        CMPR    R3,     R2                      ; 5CCA   015A
        BLE     L_5CE4                          ; 5CCB   0206 0017
        B       L_5CD6                          ; 5CCD   0200 0007

L_5CCF:
        PSHR    R3                              ; 5CCF   0273
        MVII    #$0020, R3                      ; 5CD0   02BB 0020
        SUB@    R6,     R3                      ; 5CD2   0333
        CMPR    R3,     R2                      ; 5CD3   015A
        BGE     L_5CE4                          ; 5CD4   020D 000E

L_5CD6:
        MVII    #$0177, R4                      ; 5CD6   02BC 0177
        DECLE   $0001,  $02A0,  $0080,  $0204   ; 5CD8   0001 02A0 0080 0204
        DECLE   $0007,  $0004                   ; 5CDC   0007 0004

        ANDR    R5,     R4                      ; 5CDE   01AC
        SUB@    R3,     R0                      ; 5CDF   0318

        JSR     R5,     X_PLAY_WHST1            ; 5CE0   0004 011C 031B

        PULR    R7                              ; 5CE3   02B7

L_5CE4:
        CLRR    R3                              ; 5CE4   01DB
        DECLE   $0285,  $0320,  $02FD,  $0100   ; 5CE5   0285 0320 02FD 0100
        DECLE   $0245,  $0358,  $000F           ; 5CE9   0245 0358 000F
L_5CEC:
        PSHR    R5                              ; 5CEC   0275
        DECLE   $0004,  $01A8,  $0000,  $017B   ; 5CED   0004 01A8 0000 017B
        DECLE   $0009,  $0006,  $0004           ; 5CF1   0009 0006 0004

        ANDR    R4,     R4                      ; 5CF4   01A4
        XORI    #$017B, R3                      ; 5CF5   03FB 017B
        INCR    R1                              ; 5CF7   0009
        CLRC                                    ; 5CF8   0006
        PSHR    R3                              ; 5CF9   0273

        JSR     R5,     L_5DF8                  ; 5CFA   0004 015C 01F8

        PULR    R3                              ; 5CFD   02B3
        MVI     G_017B, R0                      ; 5CFE   0280 017B
        ANDI    #$00F3, R0                      ; 5D00   03B8 00F3
        XORI    #$0004, R0                      ; 5D02   03F8 0004
        MVO     R0,     G_017B                  ; 5D04   0240 017B
        MVI     G_0321, R0                      ; 5D06   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 5D08   0004 0114 0357

        MVII    #$00D8, R1                      ; 5D0B   02B9 00D8
        SLR     R0,     1                       ; 5D0D   0060

        JSR     R5,     X_PACK_BYTES            ; 5D0E   0004 0114 034F
        DECLE   $0240,  $0321,  $02FB,  $0015   ; 5D11   0240 0321 02FB 0015
        DECLE   $0243,  $0323,  $01C0,  $02B9   ; 5D15   0243 0323 01C0 02B9
        DECLE   $031D,  $0004                   ; 5D19   031D 0004

        ANDR    R5,     R4                      ; 5D1B   01AC
        XORR    R3,     R1                      ; 5D1C   01D9
        SDBD                                    ; 5D1D   0001
        MVII    #$98D8, R2                      ; 5D1E   02BA 00D8 0098
L_5D21:
        MVO     R2,     G_031E                  ; 5D21   0242 031E
        PULR    R7                              ; 5D23   02B7

        PSHR    R5                              ; 5D24   0275
        MVI     G_017B, R0                      ; 5D25   0280 017B
        MOVR    R0,     R2                      ; 5D27   0082
        ANDI    #$0008, R0                      ; 5D28   03B8 0008
        BEQ     L_5B28                          ; 5D2A   0224 0203

        ANDI    #$0002, R2                      ; 5D2C   03BA 0002
        BEQ     L_5B28                          ; 5D2E   0224 0207

        CMPI    #$0335, R1                      ; 5D30   0379 0335
        BPL     L_5D46                          ; 5D32   0203 0012

        MVI     G_017C, R0                      ; 5D34   0280 017C
        SARC    R0,     1                       ; 5D36   0078
        BC      L_5B28                          ; 5D37   0221 0210

        ADDI    #$0008, R0                      ; 5D39   02F8 0008
        ANDI    #$000F, R0                      ; 5D3B   03B8 000F
        SUB     G_0181, R0                      ; 5D3D   0300 0181
        BPL     L_5D42                          ; 5D3F   0203 0001

        NEGR    R0                              ; 5D41   0020
L_5D42:
        CMPI    #$0002, R0                      ; 5D42   0378 0002
        BPL     L_5B28                          ; 5D44   0223 021D

L_5D46:
        JSR     R5,     L_5DD5                  ; 5D46   0004 015C 01D5
        DECLE   $01C0,  $0240,  $0321,  $0240   ; 5D49   01C0 0240 0321 0240
        DECLE   $0323,  $0240,  $0359,  $0280   ; 5D4D   0323 0240 0359 0280
        DECLE   $017B,  $03B8,  $005D,  $03F8   ; 5D51   017B 03B8 005D 03F8
        DECLE   $0081,  $0240,  $017B,  $02F9   ; 5D55   0081 0240 017B 02F9
        DECLE   $0006,  $02B8,  $0001,  $0248   ; 5D59   0006 02B8 0001 0248
        DECLE   $02B9,  $031D,  $0004           ; 5D5D   02B9 031D 0004

        ANDR    R5,     R4                      ; 5D60   01AC
        XORR    R4,     R6                      ; 5D61   01E6
        MVI     G_01EA, R2                      ; 5D62   0282 01EA
        TSTR    R2                              ; 5D64   0092
        BNEQ    L_5D6A                          ; 5D65   020C 0003

        JSR     R5,     L_5E1F                  ; 5D67   0004 015C 021F

L_5D6A:
        SDBD                                    ; 5D6A   0001
        MVII    #$98FE, R2                      ; 5D6B   02BA 00FE 0098
        B       L_5D21                          ; 5D6E   0220 004E

        PSHR    R5                              ; 5D70   0275
        MVI     G_0184, R0                      ; 5D71   0280 0184
        TSTR    R0                              ; 5D73   0080
        BEQ     L_5D95                          ; 5D74   0204 001F

        JSR     R5,     .EXEC.766               ; 5D76   0004 0114 0366

        MOVR    R0,     R3                      ; 5D79   0083

        JSR     R5,     L_551E                  ; 5D7A   0004 0154 011E

        PSHR    R1                              ; 5D7D   0271

        JSR     R5,     .EXEC.766               ; 5D7E   0004 0114 0366
        JSR     R5,     L_5956                  ; 5D81   0004 0158 0156
        JSR     R5,     L_5588                  ; 5D84   0004 0154 0188

        PULR    R1                              ; 5D87   02B1
        ADDI    #$0007, R1                      ; 5D88   02F9 0007
        MVI@    R1,     R0                      ; 5D8A   0288
        TSTR    R0                              ; 5D8B   0080
        BNEQ    L_5D8F                          ; 5D8C   020C 0001

        INCR    R0                              ; 5D8E   0008
L_5D8F:
        DECR    R1                              ; 5D8F   0011
        MVO@    R0,     R1                      ; 5D90   0248
        CLRR    R0                              ; 5D91   01C0
        MVO     R0,     G_0184                  ; 5D92   0240 0184
        PULR    R7                              ; 5D94   02B7

L_5D95:
        MVI     G_01EA, R0                      ; 5D95   0280 01EA
        TSTR    R0                              ; 5D97   0080
        BEQ     L_5DB2                          ; 5D98   0204 0018

        MVI     G_01EB, R0                      ; 5D9A   0280 01EB
        CMPI    #$0002, R0                      ; 5D9C   0378 0002
        BEQ     L_5DA4                          ; 5D9E   0204 0004

        MVII    #$0004, R0                      ; 5DA0   02B8 0004
        B       L_5DA6                          ; 5DA2   0200 0002

L_5DA4:
        MVII    #$0006, R0                      ; 5DA4   02B8 0006
L_5DA6:
        MVO     R0,     G_01EA                  ; 5DA6   0240 01EA
        MVI     G_017B, R0                      ; 5DA8   0280 017B
        ANDI    #$0077, R0                      ; 5DAA   03B8 0077
        XORI    #$0001, R0                      ; 5DAC   03F8 0001
        MVO     R0,     G_017B                  ; 5DAE   0240 017B
        B       L_5BA8                          ; 5DB0   0220 0209

L_5DB2:
        MVI     G_017B, R0                      ; 5DB2   0280 017B
        DECLE   $03B8,  $0077,  $0240,  $017B   ; 5DB4   03B8 0077 0240 017B
        DECLE   $0004                           ; 5DB8   0004

        ANDR    R5,     R4                      ; 5DB9   01AC
        SARC    R1,     1                       ; 5DBA   0079

        JSR     R5,     L_551E                  ; 5DBB   0004 0154 011E
        JSR     R5,     .EXEC.766               ; 5DBE   0004 0114 0366
        DECLE   $0004,  $01A0,  $01EC,  $00A8   ; 5DC1   0004 01A0 01EC 00A8
        DECLE   $0004,  $01AC,  $0233,  $0004   ; 5DC5   0004 01AC 0233 0004
        DECLE   $01A4,  $03FB,  $017B,  $0008   ; 5DC9   01A4 03FB 017B 0008
        DECLE   $0002,  $0004,  $01A8,  $0000   ; 5DCD   0002 0004 01A8 0000

        CMPR    R7,     R3                      ; 5DD1   017B
        SETC                                    ; 5DD2   0007
        INCR    R2                              ; 5DD3   000A
        PULR    R7                              ; 5DD4   02B7

L_5DD5:
        PSHR    R5                              ; 5DD5   0275

        JSR     R5,     .EXEC.766               ; 5DD6   0004 0114 0366
        DECLE   $0004,  $01A0,  $01EC,  $00A8   ; 5DD9   0004 01A0 01EC 00A8
        DECLE   $0004                           ; 5DDD   0004

        ANDR    R4,     R0                      ; 5DDE   01A0
        ANDR    R2,     R4                      ; 5DDF   0194
        SETC                                    ; 5DE0   0007
        MVI@    R5,     R0                      ; 5DE1   02A8
        MOVR    R0,     R3                      ; 5DE2   0083
        ANDI    #$00F0, R0                      ; 5DE3   03B8 00F0
        ANDI    #$000F, R3                      ; 5DE5   03BB 000F
        SLR     R0,     2                       ; 5DE7   0064
        PSHR    R0                              ; 5DE8   0270
        ADDR    R0,     R0                      ; 5DE9   00C0
        ADD@    R6,     R0                      ; 5DEA   02F0
        ADDR    R0,     R3                      ; 5DEB   00C3
        SUBI    #$0048, R3                      ; 5DEC   033B 0048
        MVII    #$0012, R0                      ; 5DEE   02B8 0012

        JSR     R5,     X_RAND2                 ; 5DF0   0004 0114 029E

        CMPR    R0,     R3                      ; 5DF3   0143
        BGE     L_5DF7                          ; 5DF4   020D 0001

        PULR    R5                              ; 5DF6   02B5
L_5DF7:
        PULR    R7                              ; 5DF7   02B7

L_5DF8:
        PSHR    R5                              ; 5DF8   0275

        JSR     R5,     X_PLAY_SFX1             ; 5DF9   0004 0118 03BB
        DECLE   $0048,  $0328                   ; 5DFC  SFX data
        DECLE   $001B                           ; 5DFE  SFX data
        DECLE   $0040,  $0340                   ; 5DFF  SFX data
        DECLE   $03C9                           ; 5E01  SFX data
        DECLE   $000C,  $0108                   ; 5E02  SFX data
        DECLE   $000B                           ; 5E04  SFX data
        DECLE   $03CF                           ; 5E05  SFX end

L_5E06:
        PSHR    R5                              ; 5E06   0275

        JSR     R5,     X_PLAY_SFX1             ; 5E07   0004 0118 03BB
        DECLE   $0389                           ; 5E0A  SFX data
        DECLE   $006C,  $0000                   ; 5E0B  SFX data
        DECLE   $0050,  $0100                   ; 5E0D  SFX data
        DECLE   $0058,  $010C                   ; 5E0F  SFX data
        DECLE   $005B                           ; 5E11  SFX data
        DECLE   $0044,  $0100                   ; 5E12  SFX data
        DECLE   $0001,  $03A0                   ; 5E14  SFX data
        DECLE   $0001,  $03B2                   ; 5E16  SFX data
        DECLE   $0001,  $03F1                   ; 5E18  SFX data
        DECLE   $000B                           ; 5E1A  SFX data
        DECLE   $02EB                           ; 5E1B  SFX data
        DECLE   $0001,  $0003                   ; 5E1C  SFX data
        DECLE   $03CF                           ; 5E1E  SFX end

L_5E1F:
        PSHR    R5                              ; 5E1F   0275
        MVI     G_017B, R0                      ; 5E20   0280 017B
        ANDI    #$0001, R0                      ; 5E22   03B8 0001

        JSR     R5,     X_PLAY_SFX1             ; 5E24   0004 0118 03BB
        DECLE   $0280,  $00C0                   ; 5E27  SFX data
        DECLE   $0003,  $0008                   ; 5E29  SFX data
        DECLE   $02C0,  $01C0                   ; 5E2B  SFX data
        DECLE   $03E9                           ; 5E2D  SFX data
        DECLE   $006B                           ; 5E2E  SFX data
        DECLE   $02CF                           ; 5E2F  SFX end

L_5E30:
        PSHR    R5                              ; 5E30   0275
        MVI     G_0171, R0                      ; 5E31   0280 0171

        JSR     R5,     X_PLAY_SFX1             ; 5E33   0004 0118 03BB
        DECLE   $0300,  $007F                   ; 5E36  SFX data
        DECLE   $0003,  $0008                   ; 5E38  SFX data
        DECLE   $0300,  $0100                   ; 5E3A  SFX data
        DECLE   $03E9                           ; 5E3C  SFX data
        DECLE   $006B                           ; 5E3D  SFX data
        DECLE   $02CF                           ; 5E3E  SFX end

L_5E3F:
        PSHR    R5                              ; 5E3F   0275
        MVI     G_0171, R0                      ; 5E40   0280 0171

        JSR     R5,     X_PLAY_SFX1             ; 5E42   0004 0118 03BB
        DECLE   $0300,  $008F                   ; 5E45  SFX data
        DECLE   $0003,  $0008                   ; 5E47  SFX data
        DECLE   $0300,  $011E                   ; 5E49  SFX data
        DECLE   $03E9                           ; 5E4B  SFX data
        DECLE   $006B                           ; 5E4C  SFX data
        DECLE   $02CF                           ; 5E4D  SFX end

L_5E4E:
        PSHR    R5                              ; 5E4E   0275
        MVI     G_0171, R0                      ; 5E4F   0280 0171

        JSR     R5,     X_PLAY_SFX1             ; 5E51   0004 0118 03BB
        DECLE   $0300,  $00BE                   ; 5E54  SFX data
        DECLE   $0003,  $0008                   ; 5E56  SFX data
        DECLE   $0300,  $017D                   ; 5E58  SFX data
        DECLE   $03E9                           ; 5E5A  SFX data
        DECLE   $006B                           ; 5E5B  SFX data
        DECLE   $02CF                           ; 5E5C  SFX end

L_5E5D:
        PSHR    R5                              ; 5E5D   0275
        MVI     G_0171, R0                      ; 5E5E   0280 0171

        JSR     R5,     X_PLAY_SFX1             ; 5E60   0004 0118 03BB
        DECLE   $0300,  $00D6                   ; 5E63  SFX data
        DECLE   $0003,  $03CC                   ; 5E65  SFX data
        DECLE   $0300,  $01AC                   ; 5E67  SFX data
        DECLE   $03E9                           ; 5E69  SFX data
        DECLE   $006B                           ; 5E6A  SFX data
        DECLE   $02CF                           ; 5E6B  SFX end

L_5E6C:
        PSHR    R5                              ; 5E6C   0275
        MVI     G_0171, R1                      ; 5E6D   0281 0171
        TSTR    R1                              ; 5E6F   0089
        BNEQ    L_5E80                          ; 5E70   020C 000E

        JSR     R5,     X_PLAY_SFX1             ; 5E72   0004 0118 03BB
        DECLE   $03C9                           ; 5E75  SFX data
        DECLE   $01DD                           ; 5E76  SFX data
        DECLE   $0300,  $0080                   ; 5E77  SFX data
        DECLE   $0308,  $0082                   ; 5E79  SFX data
        DECLE   $006B                           ; 5E7B  SFX data
        DECLE   $0035                           ; 5E7C  SFX data
        DECLE   $0043,  $03E2                   ; 5E7D  SFX data
        DECLE   $02CF                           ; 5E7F  SFX end

L_5E80:
        JSR     R5,     X_PLAY_SFX1             ; 5E80   0004 0118 03BB
        DECLE   $03C9                           ; 5E83  SFX data
        DECLE   $01DD                           ; 5E84  SFX data
        DECLE   $0300,  $00E8                   ; 5E85  SFX data
        DECLE   $0308,  $00EB                   ; 5E87  SFX data
        DECLE   $006B                           ; 5E89  SFX data
        DECLE   $0035                           ; 5E8A  SFX data
        DECLE   $0043,  $03E2                   ; 5E8B  SFX data
        DECLE   $02CF                           ; 5E8D  SFX end

L_5E8E:
        PSHR    R5                              ; 5E8E   0275

        JSR     R5,     X_PLAY_MUS2             ; 5E8F   0004 0118 035D
        DECLE   $015C                           ; 5E92  Note (short)
        DECLE   $01AC                           ; 5E93  Note (short)
        DECLE   $01EC                           ; 5E94  Note (short)
        DECLE   $021E                           ; 5E95  Note (short)
        DECLE   $01EC                           ; 5E96  Note (short)
        DECLE   $021D                           ; 5E97  Note (short)
        DECLE   $021D                           ; 5E98  Note (short)
        DECLE   $03F4,  $026E                   ; 5E99  Note (long)
        DECLE   $0000                           ; 5E9B  End of music

        PULR    R7                              ; 5E9C   02B7

L_5E9D:
        PSHR    R5                              ; 5E9D   0275

        JSR     R5,     L_5FA6                  ; 5E9E   0004 015C 03A6

        PULR    R5                              ; 5EA1   02B5
        MVII    #$0028, R4                      ; 5EA2   02BC 0028
        MVI@    R5,     R0                      ; 5EA4   02A8
        MVO@    R0,     R4                      ; 5EA5   0260
        MVI@    R5,     R0                      ; 5EA6   02A8
        MVO@    R0,     R4                      ; 5EA7   0260
        MVI@    R5,     R0                      ; 5EA8   02A8
        MVO@    R0,     R4                      ; 5EA9   0260
        MVI@    R5,     R0                      ; 5EAA   02A8
        MVO@    R0,     R4                      ; 5EAB   0260
        MVI     .STIC.MODE,R0                   ; 5EAC   0280 0021
        CLRR    R0                              ; 5EAE   01C0
        MVO     R0,     G_0105                  ; 5EAF   0240 0105
        MOVR    R5,     R7                      ; 5EB1   00AF

L_5EB2:
        MVI@    R5,     R3                      ; 5EB2   02AB
        TSTR    R3                              ; 5EB3   009B
        BEQ     L_5EBE                          ; 5EB4   0204 0008

        MVI@    R3,     R0                      ; 5EB6   0298
        SDBD                                    ; 5EB7   0001
        XORI    #$2000, R0                      ; 5EB8   03F8 0000 0020
        MVO@    R0,     R3                      ; 5EBB   0258
        B       L_5EB2                          ; 5EBC   0220 000B
L_5EBE:
        MOVR    R5,     R7                      ; 5EBE   00AF

        DECLE   $003E,  $005F,  $0035           ; 5EBF   003E 005F 0035

        SLLC    R3,     2                       ; 5EC2   005F
        RSWD    R6                              ; 5EC3   003E
        SLLC    R3,     2                       ; 5EC4   005F
        RSWD    R6                              ; 5EC5   003E
        SLLC    R3,     2                       ; 5EC6   005F
        RSWD    R6                              ; 5EC7   003E
        SLLC    R3,     2                       ; 5EC8   005F
.START:
        PSHR    R5                              ; 5EC9   0275
        MVII    #$0003, R0                      ; 5ECA   02B8 0003
        MVO     R0,     G_0103                  ; 5ECC   0240 0103
        MVII    #$0000, R0                      ; 5ECE   02B8 0000
        MVO     R0,     G_0172                  ; 5ED0   0240 0172
        SDBD                                    ; 5ED2   0001
        MVII    #$5F96, R0                      ; 5ED3   02B8 0096 005F
        MVO     R0,     .ISRVEC.0               ; 5ED6   0240 0100
        SWAP    R0,     1                       ; 5ED8   0040
        MVO     R0,     .ISRVEC.1               ; 5ED9   0240 0101

        JSR     R5,     L_6FD9                  ; 5EDB   0004 016C 03D9

L_5EDE:
        MVII    #$0008, R0                      ; 5EDE   02B8 0008
        MVO     R0,     G_0174                  ; 5EE0   0240 0174
        SDBD                                    ; 5EE2   0001
        MVII    #$5EBF, R0                      ; 5EE3   02B8 00BF 005E
        MVO     R0,     G_035D                  ; 5EE6   0240 035D
        PULR    R7                              ; 5EE8   02B7

L_5EE9:
        PSHR    R5                              ; 5EE9   0275
        MVI     G_0172, R0                      ; 5EEA   0280 0172
        CMPI    #$0000, R0                      ; 5EEC   0378 0000
        BNEQ    L_5F19                          ; 5EEE   020C 0029

        MVII    #$0019, R0                      ; 5EF0   02B8 0019
        MVO     R0,     G_011E                  ; 5EF2   0240 011E
        MVI     G_0174, R0                      ; 5EF4   0280 0174
        DECR    R0                              ; 5EF6   0010
        MVO     R0,     G_0174                  ; 5EF7   0240 0174
        BNEQ    L_5F19                          ; 5EF9   020C 001E

        MVI     G_0173, R5                      ; 5EFB   0285 0173
        CMPI    #$0004, R5                      ; 5EFD   037D 0004
        BEQ     L_5F1A                          ; 5EFF   0204 0019

        MOVR    R5,     R0                      ; 5F01   00A8
        INCR    R0                              ; 5F02   0008
        MVO     R0,     G_0173                  ; 5F03   0240 0173
        MVII    #$0019, R0                      ; 5F05   02B8 0019
        CMPI    #$0003, R5                      ; 5F07   037D 0003
        BNEQ    L_5F0D                          ; 5F09   020C 0002

        MVII    #$0096, R0                      ; 5F0B   02B8 0096
L_5F0D:
        MVO     R0,     G_0174                  ; 5F0D   0240 0174
        ADDR    R5,     R5                      ; 5F0F   00ED
        SDBD                                    ; 5F10   0001
        ADDI    #$5F4B, R5                      ; 5F11   02FD 004B 005F
        SDBD                                    ; 5F14   0001
        MVI@    R5,     R4                      ; 5F15   02AC

        JSR     R5,     L_6844                  ; 5F16   0004 0168 0044

L_5F19:
        PULR    R7                              ; 5F19   02B7

L_5F1A:
        MVII    #$0200, R3                      ; 5F1A   02BB 0200
L_5F1C:
        MVI@    R3,     R0                      ; 5F1C   0298
        SDBD                                    ; 5F1D   0001
        ANDI    #$0800, R0                      ; 5F1E   03B8 0000 0008
        BNEQ    L_5F29                          ; 5F21   020C 0006

        MVI@    R3,     R0                      ; 5F23   0298
        ANDI    #$01F8, R0                      ; 5F24   03B8 01F8
        BEQ     L_5F29                          ; 5F26   0204 0001

        MVO@    R0,     R3                      ; 5F28   0258
L_5F29:
        INCR    R3                              ; 5F29   000B
        CMPI    #$02F0, R3                      ; 5F2A   037B 02F0
        BNEQ    L_5F1C                          ; 5F2C   022C 0011

        CLRR    R0                              ; 5F2E   01C0
        MVO     R0,     .BTAB.DD                ; 5F2F   0240 02DD
        MVO     R0,     G_0173                  ; 5F31   0240 0173
        B       L_5EDE                          ; 5F33   0220 0056

        DECLE   $0080,  $020C,  $0006,  $0004   ; 5F35   0080 020C 0006 0004

        ANDR    R4,     R0                      ; 5F39   01A0
        XOR@    R1,     R4                      ; 5F3A   03CC
        J       X_RESET                         ; 5F3B   0004 0310 0000

        PSHR    R5                              ; 5F3E   0275
L_5F3F:
        MVI     .PSG0.rgt_hand,R5               ; 5F3F   0285 01FE
        AND     .PSG0.lft_hand,R5               ; 5F41   0385 01FF
        CMPI    #$00FF, R5                      ; 5F43   037D 00FF
        BNEQ    L_5F3F                          ; 5F45   022C 0007

        JSR     R5,     L_55BE                  ; 5F47   0004 0154 01BE

        PULR    R7                              ; 5F4A   02B7

        DECLE   $0053,  $005F,  $0064,  $005F   ; 5F4B   0053 005F 0064 005F
        DECLE   $0071,  $005F,  $0089,  $005F   ; 5F4F   0071 005F 0089 005F
        DECLE   $0003,  $0218,  $0049,  $004E   ; 5F53   0003 0218 0049 004E
        DECLE   $0054,  $0056,  $0000,  $022A   ; 5F57   0054 0056 0000 022A
        DECLE   $0050,  $0052,  $0045,  $0053   ; 5F5B   0050 0052 0045 0053
        DECLE   $0045,  $004E,  $0054,  $0053   ; 5F5F   0045 004E 0054 0053
        DECLE   $0002,  $0007,  $0253,  $0053   ; 5F63   0002 0007 0253 0053
        DECLE   $004C,  $0041,  $004D,  $0000   ; 5F67   004C 0041 004D 0000
        DECLE   $0269,  $0044,  $0055,  $004E   ; 5F6B   0269 0044 0055 004E
        DECLE   $004B,  $0002,  $0006,  $028D   ; 5F6F   004B 0002 0006 028D
        DECLE   $0053,  $0055,  $0050,  $0045   ; 5F73   0053 0055 0050 0045
        DECLE   $0052,  $0020,  $0050,  $0052   ; 5F77   0052 0020 0050 0052
        DECLE   $004F,  $0000,  $02A1,  $0042   ; 5F7B   004F 0000 02A1 0042
        DECLE   $0041,  $0053,  $004B,  $0045   ; 5F7F   0041 0053 004B 0045
        DECLE   $0054,  $0042,  $0041,  $004C   ; 5F83   0054 0042 0041 004C
        DECLE   $004C,  $0002,  $0003,  $02DD   ; 5F87   004C 0002 0003 02DD
        DECLE   $0140,  $0031,  $0039,  $0038   ; 5F8B   0140 0031 0039 0038
        DECLE   $0037                           ; 5F8F   0037

        NEGR    R0                              ; 5F90   0020
        SLL     R1,     1                       ; 5F91   0049
        SLL     R2,     2                       ; 5F92   004E
        RLC     R0,     2                       ; 5F93   0054
        RLC     R2,     2                       ; 5F94   0056
        EIS                                     ; 5F95   0002
        MVII    #$0021, R1                      ; 5F96   02B9 0021
        MVO@    R0,     R1                      ; 5F98   0248
        ADD     G_0105, R7                      ; 5F99   02C7 0105

        MVI@    R1,     R0                      ; 5F9B   0288
        J       X_DEF_ISR                       ; 5F9C   0004 0310 0126

        SUBI    #$0008, R6                      ; 5F9F   033E 0008
        MVO     R1,     .ISRVEC.0               ; 5FA1   0241 0100
        MVO     R2,     .ISRVEC.1               ; 5FA3   0242 0101
        PULR    R7                              ; 5FA5   02B7

L_5FA6:
        PSHR    R5                              ; 5FA6   0275
        MVI     .ISRVEC.0,R1                    ; 5FA7   0281 0100
        MVI     .ISRVEC.1,R2                    ; 5FA9   0282 0101
        SDBD                                    ; 5FAB   0001
        MVII    #$5F9F, R0                      ; 5FAC   02B8 009F 005F
        MVO     R0,     .ISRVEC.0               ; 5FAF   0240 0100
        SWAP    R0,     1                       ; 5FB1   0040
        MVO     R0,     .ISRVEC.1               ; 5FB2   0240 0101
        EIS                                     ; 5FB4   0002
L_5FB5:
        DECR    R7                              ; 5FB5   0017

L_5FB6:
        PSHR    R5                              ; 5FB6   0275

        JSR     R5,     L_5FA6                  ; 5FB7   0004 015C 03A6

        PULR    R5                              ; 5FBA   02B5
        MVI@    R5,     R1                      ; 5FBB   02A9
        SDBD                                    ; 5FBC   0001
        MVI@    R5,     R4                      ; 5FBD   02AC
        PSHR    R5                              ; 5FBE   0275
        SDBD                                    ; 5FBF   0001
        MVII    #$3800, R5                      ; 5FC0   02BD 0000 0038
L_5FC3:
        MVI@    R4,     R0                      ; 5FC3   02A0
        MVO@    R0,     R5                      ; 5FC4   0268
        MVI@    R4,     R0                      ; 5FC5   02A0
        MVO@    R0,     R5                      ; 5FC6   0268
        MVI@    R4,     R0                      ; 5FC7   02A0
        MVO@    R0,     R5                      ; 5FC8   0268
        MVI@    R4,     R0                      ; 5FC9   02A0
        MVO@    R0,     R5                      ; 5FCA   0268
        MVI@    R4,     R0                      ; 5FCB   02A0
        MVO@    R0,     R5                      ; 5FCC   0268
        MVI@    R4,     R0                      ; 5FCD   02A0
        MVO@    R0,     R5                      ; 5FCE   0268
        MVI@    R4,     R0                      ; 5FCF   02A0
        MVO@    R0,     R5                      ; 5FD0   0268
        MVI@    R4,     R0                      ; 5FD1   02A0
        MVO@    R0,     R5                      ; 5FD2   0268
        DECR    R1                              ; 5FD3   0011
        BNEQ    L_5FC3                          ; 5FD4   022C 0012
        PULR    R7                              ; 5FD6   02B7

L_5FD7:
        PSHR    R5                              ; 5FD7   0275
        PSHR    R3                              ; 5FD8   0273
        MOVR    R4,     R3                      ; 5FD9   00A3
        MVI@    R3,     R5                      ; 5FDA   029D
        INCR    R5                              ; 5FDB   000D
        MVO@    R5,     R3                      ; 5FDC   025D
        ADDR    R5,     R3                      ; 5FDD   00EB
        MVO@    R0,     R3                      ; 5FDE   0258
        PULR    R3                              ; 5FDF   02B3
        PULR    R7                              ; 5FE0   02B7

L_5FE1:
        PSHR    R5                              ; 5FE1   0275
        PSHR    R3                              ; 5FE2   0273
        MOVR    R4,     R3                      ; 5FE3   00A3
        MOVR    R3,     R5                      ; 5FE4   009D
        MVI@    R5,     R4                      ; 5FE5   02AC
L_5FE6:
        DECR    R4                              ; 5FE6   0014
        BMI     L_5FF4                          ; 5FE7   020B 000B

        CMP@    R5,     R0                      ; 5FE9   0368
        BNEQ    L_5FE6                          ; 5FEA   022C 0005

        MOVR    R3,     R4                      ; 5FEC   009C
        ADD@    R3,     R4                      ; 5FED   02DC
        MVI@    R4,     R4                      ; 5FEE   02A4
        DECR    R5                              ; 5FEF   0015
        MVO@    R4,     R5                      ; 5FF0   026C
        MVI@    R3,     R4                      ; 5FF1   029C
        DECR    R4                              ; 5FF2   0014
        MVO@    R4,     R3                      ; 5FF3   025C
L_5FF4:
        PULR    R3                              ; 5FF4   02B3
        PULR    R7                              ; 5FF5   02B7

L_5FF6:
        PSHR    R5                              ; 5FF6   0275
        PSHR    R4                              ; 5FF7   0274
        MVI@    R4,     R5                      ; 5FF8   02A5
L_5FF9:
        DECR    R5                              ; 5FF9   0015
        BMI     L_6001                          ; 5FFA   020B 0005

        CMP@    R4,     R0                      ; 5FFC   0360
        BNEQ    L_5FF9                          ; 5FFD   022C 0005

        CLRC                                    ; 5FFF   0006
        INCR    R7                              ; 6000   000F

L_6001:
        SETC                                    ; 6001   0007
L_6002:
        PULR    R4                              ; 6002   02B4
        PULR    R7                              ; 6003   02B7

L_6004:
        MVI@    R5,     R1                      ; 6004   02A9
        PSHR    R5                              ; 6005   0275
        MVI@    R1,     R0                      ; 6006   0288
        INCR    R1                              ; 6007   0009
        MOVR    R1,     R3                      ; 6008   008B
        ADDR    R0,     R3                      ; 6009   00C3
        DECR    R3                              ; 600A   0013
L_600B:
        PSHR    R0                              ; 600B   0270

        JSR     R5,     X_RAND2                 ; 600C   0004 0114 029E

        MOVR    R0,     R2                      ; 600F   0082
        ADDR    R1,     R2                      ; 6010   00CA
        MVI@    R2,     R4                      ; 6011   0294
        MVI@    R3,     R5                      ; 6012   029D
        MVO@    R5,     R2                      ; 6013   0255
        MVO@    R4,     R3                      ; 6014   025C
        PULR    R0                              ; 6015   02B0
        DECR    R3                              ; 6016   0013
        CMPR    R1,     R3                      ; 6017   014B
        BGE     L_600B                          ; 6018   022D 000E
        PULR    R7                              ; 601A   02B7

        DECLE   $0002,  $0000,  $0001,  $0000   ; 601B   0002 0000 0001 0000
        DECLE   $0002,  $0001,  $015D,  $0163   ; 601F   0002 0001 015D 0163
        DECLE   $0027,  $0060,  $002D,  $0060   ; 6023   0027 0060 002D 0060
        DECLE   $0002,  $0027,  $0028,  $0029   ; 6027   0002 0027 0028 0029
        DECLE   $002A,  $0000,  $0001,  $002B   ; 602B   002A 0000 0001 002B
        DECLE   $002C,  $002D,  $002E,  $0000   ; 602F   002C 002D 002E 0000
        DECLE   $0000,  $0000,  $006B,  $0060   ; 6033   0000 0000 006B 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6037   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 603B   0000 0000
L_603D:
        PSHR    R5                              ; 603D   0275

        JSR     R5,     L_5691                  ; 603E   0004 0154 0291
        DECLE   $0004                           ; 6041   0004

        ANDR    R2,     R0                      ; 6042   0190
        ADD@    R3,     R4                      ; 6043   02DC
        CLRR    R0                              ; 6044   01C0
        MVO     R0,     G_015D                  ; 6045   0240 015D
        MVO     R0,     G_0163                  ; 6047   0240 0163
        SDBD                                    ; 6049   0001
        MVII    #$55AD, R1                      ; 604A   02B9 00AD 0055
        PSHR    R1                              ; 604D   0271
        ADD     G_0173, R1                      ; 604E   02C1 0173
        MVI@    R1,     R0                      ; 6050   0288
        MVO     R0,     G_0354                  ; 6051   0240 0354
        PULR    R1                              ; 6053   02B1
        ADD     G_0174, R1                      ; 6054   02C1 0174
        MVI@    R1,     R0                      ; 6056   0288
        MVO     R0,     G_035C                  ; 6057   0240 035C
        MVII    #$0001, R0                      ; 6059   02B8 0001
        MVO     R0,     G_0172                  ; 605B   0240 0172
        MVII    #$0002, R0                      ; 605D   02B8 0002
        MVO     R0,     G_01E9                  ; 605F   0240 01E9

L_6061:
        JSR     R5,     L_6163                  ; 6061   0004 0160 0163

        SDBD                                    ; 6064   0001
        MVII    #$6033, R0                      ; 6065   02B8 0033 0060
        MVO     R0,     G_035D                  ; 6068   0240 035D
        PULR    R7                              ; 606A   02B7

L_606B:
        PSHR    R5                              ; 606B   0275
        CMP     G_01E7, R1                      ; 606C   0341 01E7
        BNEQ    L_60A1                          ; 606E   020C 0031

        CMPI    #$000B, R0                      ; 6070   0378 000B
        BEQ     L_60A2                          ; 6072   0204 002E

        CMPI    #$000A, R0                      ; 6074   0378 000A
        BNEQ    L_60A1                          ; 6076   020C 0029

        PSHR    R1                              ; 6078   0271

        JSR     R5,     L_5E3F                  ; 6079   0004 015C 023F

        PULR    R1                              ; 607C   02B1
        MVI     G_01E9, R5                      ; 607D   0285 01E9
        DECR    R5                              ; 607F   0015
        BEQ     L_6092                          ; 6080   0204 0010

        CMP     G_01E8, R1                      ; 6082   0341 01E8
        BNEQ    L_6092                          ; 6084   020C 000C

        XORI    #$0001, R1                      ; 6086   03F9 0001
        MVO     R1,     G_01E7                  ; 6088   0241 01E7

        JSR     R5,     L_61E0                  ; 608A   0004 0160 01E0
        JSR     R5,     L_61A4                  ; 608D   0004 0160 01A4
        DECLE   $0200,  $01A7                   ; 6090   0200 01A7
L_6092:
        JSR     R5,     L_663F                  ; 6092   0004 0164 023F
        JSR     R5,     L_61E0                  ; 6095   0004 0160 01E0

        MVII    #$0005, R4                      ; 6098   02BC 0005

L_609A:
        JSR     R5,     L_624C                  ; 609A   0004 0160 024C

        MVII    #$0002, R0                      ; 609D   02B8 0002
        MVO     R0,     G_01E7                  ; 609F   0240 01E7
L_60A1:
        PULR    R7                              ; 60A1   02B7

L_60A2:
        MVI     G_01E5, R1                      ; 60A2   0281 01E5
        DECLE   $02F9,  $018C,  $0288,  $0004   ; 60A4   02F9 018C 0288 0004

        ANDR    R4,     R0                      ; 60A8   01A0
        ANDR    R2,     R4                      ; 60A9   0194
        INCR    R2                              ; 60AA   000A
        SDBD                                    ; 60AB   0001
        MVII    #$55B2, R3                      ; 60AC   02BB 00B2 0055
        ADD     G_01E7, R3                      ; 60AF   02C3 01E7
        MVI@    R3,     R3                      ; 60B1   029B
        MVI@    R3,     R2                      ; 60B2   029A
        SUB@    R5,     R2                      ; 60B3   032A
        BMI     L_613B                          ; 60B4   020B 0085

        MVO@    R2,     R3                      ; 60B6   025A
        MVI     G_01E7, R4                      ; 60B7   0284 01E7
        SDBD                                    ; 60B9   0001
        ADDI    #$6021, R4                      ; 60BA   02FC 0021 0060
        MVI@    R4,     R4                      ; 60BD   02A4
        PSHR    R4                              ; 60BE   0274
        PSHR    R0                              ; 60BF   0270

        JSR     R5,     L_5FD7                  ; 60C0   0004 015C 03D7

        MVII    #$018B, R4                      ; 60C3   02BC 018B

        JSR     R5,     L_5FE1                  ; 60C5   0004 015C 03E1

        MVII    #$0001, R0                      ; 60C8   02B8 0001

        JSR     R5,     X_PLAY_CHEER1           ; 60CA   0004 011C 02D5
        JSR     R5,     L_663F                  ; 60CD   0004 0164 023F
        JSR     R5,     L_61E0                  ; 60D0   0004 0160 01E0
        DECLE   $0004,  $0168,  $0042           ; 60D3   0004 0168 0042

        ADDR    R0,     R4                      ; 60D6   00C4
        SLR     R2,     1                       ; 60D7   0062
        MVI     G_01E7, R0                      ; 60D8   0280 01E7
        MVII    #$021C, R4                      ; 60DA   02BC 021C

        JSR     R5,     L_6277                  ; 60DC   0004 0160 0277

        SDBD                                    ; 60DF   0001
        ANDI    #$F7FF, R3                      ; 60E0   03BB 00FF 00F7

        JSR     R5,     X_PRINT_R5              ; 60E3   0004 0118 007B
        STRING  ","                             ; 60E6   002C
        DECLE   $0000,  $02B0,  $0004,  $01A0   ; 60E7   0000 02B0 0004 01A0
        DECLE   $0194,  $0000,  $0001,  $02A9   ; 60EB   0194 0000 0001 02A9
        DECLE   $0004                           ; 60EF   0004

        ANDR    R4,     R0                      ; 60F0   01A0
        XORR    R6,     R5                      ; 60F1   01F5
        SARC    R0,     1                       ; 60F2   0078
        ADCR    R0                              ; 60F3   0028
        MVII    #$0232, R4                      ; 60F4   02BC 0232
        SUBR    R0,     R4                      ; 60F6   0104
        MVII    #$0003, R3                      ; 60F7   02BB 0003

        JSR     R5,     X_PRINT_R1              ; 60F9   0004 0118 0067
        JSR     R5,     X_PRINT_R5              ; 60FC   0004 0118 007B
        DECLE   $0021,  $0000                   ; 60FF   0021 0000

        SDBD                                    ; 6101   0001
        MVII    #$55B2, R2                      ; 6102   02BA 00B2 0055
        ADD     G_01E7, R2                      ; 6105   02C2 01E7
        MVI@    R2,     R2                      ; 6107   0292
        MVI@    R2,     R0                      ; 6108   0290
        MVII    #$0269, R4                      ; 6109   02BC 0269

        JSR     R5,     L_66FE                  ; 610B   0004 0164 02FE

        PULR    R4                              ; 610E   02B4
        MVI     G_01E7, R0                      ; 610F   0280 01E7
        MVI     G_01E9, R1                      ; 6111   0281 01E9
        DECR    R1                              ; 6113   0011
        BEQ     L_6118                          ; 6114   0204 0002

        XORI    #$0001, R0                      ; 6116   03F8 0001
L_6118:
        MVO     R0,     G_01E8                  ; 6118   0240 01E8
        MVI@    R4,     R0                      ; 611A   02A0
        CMPI    #$0005, R0                      ; 611B   0378 0005
        BNEQ    L_6124                          ; 611D   020C 0005

        MVI     G_01E9, R0                      ; 611F   0280 01E9
        DECR    R0                              ; 6121   0010
        MVO     R0,     G_01E9                  ; 6122   0240 01E9
L_6124:
        MVI     G_031D, R0                      ; 6124   0280 031D
        SDBD                                    ; 6126   0001
        ANDI    #$FFE8, R0                      ; 6127   03B8 00E8 00FF
        MVI     G_01E7, R5                      ; 612A   0285 01E7
        ADDR    R5,     R5                      ; 612C   00ED
        SDBD                                    ; 612D   0001
        ADDI    #$601B, R5                      ; 612E   02FD 001B 0060
        SDBD                                    ; 6131   0001
        XOR@    R5,     R0                      ; 6132   03E8
        MVO     R0,     G_031D                  ; 6133   0240 031D
        MVII    #$0001, R4                      ; 6135   02BC 0001
        ADD     G_01E7, R4                      ; 6137   02C4 01E7
        B       L_609A                          ; 6139   0220 00A0

L_613B:
        MVII    #$0007, R3                      ; 613B   02BB 0007
        MVII    #$0258, R4                      ; 613D   02BC 0258

        JSR     R5,     X_PRINT_R5              ; 613F   0004 0118 007B
        STRING  "can't afford"                  ; 6142  
        DECLE   $0000                           ; 614E   0000

        JSR     R5,     L_5E6C                  ; 614F   0004 015C 026C

        PULR    R7                              ; 6152   02B7
        ADDR    R0,     R7                      ; 6153   00C7

        DECLE   $0010,  $0093,  $0099,  $0000   ; 6154   0010 0093 0099 0000
        DECLE   $0000,  $0000,  $0056,  $0000   ; 6158   0000 0000 0056 0000
        DECLE   $0000,  $00F0,  $0003,  $0000   ; 615C   0000 00F0 0003 0000
        DECLE   $0000,  $0000,  $0000           ; 6160   0000 0000 0000
L_6163:
        PSHR    R5                              ; 6163   0275
L_6164:
        MVI     G_01E5, R1                      ; 6164   0281 01E5
        INCR    R1                              ; 6166   0009
        CMP     G_018B, R1                      ; 6167   0341 018B
        BLT     L_616C                          ; 6169   0205 0001

        CLRR    R1                              ; 616B   01C9
L_616C:
        MVO     R1,     G_01E5                  ; 616C   0241 01E5
        DECLE   $02F9,  $018C,  $0288,  $0281   ; 616E   02F9 018C 0288 0281
        DECLE   $0354,  $0341,  $035C,  $020D   ; 6172   0354 0341 035C 020D
        DECLE   $0002,  $0281,  $035C,  $0004   ; 6176   0002 0281 035C 0004

        ANDR    R4,     R0                      ; 617A   01A0
        ANDR    R2,     R4                      ; 617B   0194
        INCR    R2                              ; 617C   000A
        CMP@    R5,     R1                      ; 617D   0369
        BMI     L_6164                          ; 617E   022B 001B

        MVO     R0,     G_017F                  ; 6180   0240 017F
        CLRR    R1                              ; 6182   01C9
        MVO     R1,     G_0171                  ; 6183   0241 0171

        JSR     R5,     L_6515                  ; 6185   0004 0164 0115

        SDBD                                    ; 6188   0001
        MVII    #$6153, R1                      ; 6189   02B9 0053 0061
        MVII    #$031D, R2                      ; 618C   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 618E   0004 0114 02B2

        CLRR    R4                              ; 6191   01E4

        JSR     R5,     L_624C                  ; 6192   0004 0160 024C

        MVI     G_01E8, R0                      ; 6195   0280 01E8
        MVO     R0,     G_01E7                  ; 6197   0240 01E7

        JSR     R5,     L_61A4                  ; 6199   0004 0160 01A4

        PULR    R7                              ; 619C   02B7

        DECLE   $0021,  $0022,  $0023,  $0024   ; 619D   0021 0022 0023 0024
        DECLE   $0025,  $0026,  $0000           ; 61A1   0025 0026 0000
L_61A4:
        PSHR    R5                              ; 61A4   0275

        JSR     R5,     L_61AA                  ; 61A5   0004 0160 01AA

        ADD@    R1,     R0                      ; 61A8   02C8
        ADD@    R2,     R6                      ; 61A9   02D6
L_61AA:
        ADD     G_01E7, R5                      ; 61AA   02C5 01E7
        DECLE   $02AC,  $0001,  $02BD,  $001F   ; 61AC   02AC 0001 02BD 001F
        DECLE   $0060,  $02C5,  $01E7,  $02AB   ; 61B0   0060 02C5 01E7 02AB
        DECLE   $0001                           ; 61B4   0001

        XORI    #$0000, R3                      ; 61B5   03FB 0000
        INCR    R0                              ; 61B7   0008
        SDBD                                    ; 61B8   0001
        MVII    #$619D, R1                      ; 61B9   02B9 009D 0061

        JSR     R5,     L_628A                  ; 61BC   0004 0160 028A
        DECLE   $0280,  $017F,  $0004           ; 61BF   0280 017F 0004

        ANDR    R4,     R0                      ; 61C2   01A0
        ANDR    R2,     R4                      ; 61C3   0194
        INCR    R2                              ; 61C4   000A
        MVI@    R5,     R0                      ; 61C5   02A8
        MVII    #$0245, R4                      ; 61C6   02BC 0245

        JSR     R5,     L_66FE                  ; 61C8   0004 0164 02FE

        SDBD                                    ; 61CB   0001
        MVII    #$55B2, R3                      ; 61CC   02BB 00B2 0055
        ADD     G_01E7, R3                      ; 61CF   02C3 01E7
        MVI@    R3,     R3                      ; 61D1   029B
        MVI@    R3,     R0                      ; 61D2   0298
        SDBD                                    ; 61D3   0001
        MVII    #$601F, R3                      ; 61D4   02BB 001F 0060
        ADD     G_01E7, R3                      ; 61D7   02C3 01E7
        MVI@    R3,     R3                      ; 61D9   029B
        MVII    #$026D, R4                      ; 61DA   02BC 026D

        JSR     R5,     L_6700                  ; 61DC   0004 0164 0300

        PULR    R7                              ; 61DF   02B7

L_61E0:
        PSHR    R5                              ; 61E0   0275
        MVII    #$02C8, R4                      ; 61E1   02BC 02C8
        MVII    #$0006, R0                      ; 61E3   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 61E5   0004 0114 0338

        ADDI    #$0008, R4                      ; 61E8   02FC 0008
        MVII    #$0006, R0                      ; 61EA   02B8 0006

        JSR     R5,     X_FILL_ZERO             ; 61EC   0004 0114 0338

        MVII    #$0258, R4                      ; 61EF   02BC 0258
L_61F1:
        MVII    #$000C, R0                      ; 61F1   02B8 000C

        JSR     R5,     X_FILL_ZERO             ; 61F3   0004 0114 0338

        ADDI    #$0008, R4                      ; 61F6   02FC 0008
        CMPI    #$0280, R4                      ; 61F8   037C 0280
        BLT     L_61F1                          ; 61FA   0225 000A
        PULR    R7                              ; 61FC   02B7

        DECLE   $0275,  $01C0,  $0240,  $0321   ; 61FD   0275 01C0 0240 0321
        DECLE   $0240,  $0322,  $0001,  $02B8   ; 6201   0240 0322 0001 02B8
        DECLE   $009A,  $0099,  $0240,  $031E   ; 6205   009A 0099 0240 031E
        DECLE   $0284,  $01E6,  $00A4,  $0204   ; 6209   0284 01E6 00A4 0204
        DECLE   $002B                           ; 620D   002B

        CMPI    #$0003, R4                      ; 620E   037C 0003
        BLT     L_6233                          ; 6210   0205 0021

        JSR     R5,     L_6CD4                  ; 6212   0004 016C 00D4

        MVI     G_01E9, R0                      ; 6215   0280 01E9
        TSTR    R0                              ; 6217   0080
        BNEQ    L_6061                          ; 6218   022C 01B8

        JSR     R5,     L_6648                  ; 621A   0004 0164 0248
        JSR     R5,     .EXEC.7B3               ; 621D   0004 0114 03B3
        JSR     R5,     .EXEC.A61               ; 6220   0004 0118 0261

        EIS                                     ; 6223   0002

        JSR     R5,     L_67D5                  ; 6224   0004 0164 03D5
        DECLE   $0095,  $0062,  $0005           ; 6227   0095 0062 0005

        INCR    R4                              ; 622A   000C
        DIS                                     ; 622B   0003

        JSR     R5,     L_5058                  ; 622C   0004 0150 0058
        JSR     R5,     L_62F0                  ; 622F   0004 0160 02F0

        PULR    R7                              ; 6232   02B7

L_6233:
        ADDI    #$0002, R4                      ; 6233   02FC 0002

        JSR     R5,     L_624C                  ; 6235   0004 0160 024C

        PULR    R7                              ; 6238   02B7

        DECLE   $0004,  $01A8,  $0000,  $01E7   ; 6239   0004 01A8 0000 01E7
        DECLE   $0000                           ; 623D   0000

        RSWD    R4                              ; 623E   003C
        PULR    R7                              ; 623F   02B7

        RLC     R2,     2                       ; 6240   0056
        RLC     R0,     2                       ; 6241   0054
        SLL     R0,     2                       ; 6242   004C
        DECR    R0                              ; 6243   0010
        SLL     R0,     2                       ; 6244   004C
        MOVR    R3,     R0                      ; 6245   0098
        SWAP    R0,     1                       ; 6246   0040
        COMR    R0                              ; 6247   0018
        SWAP    R0,     1                       ; 6248   0040
        MOVR    R2,     R0                      ; 6249   0090
        RLC     R2,     2                       ; 624A   0056
        MOVR    R5,     R4                      ; 624B   00AC
L_624C:
        PSHR    R5                              ; 624C   0275
        MVO     R4,     G_01E6                  ; 624D   0244 01E6
        ADDR    R4,     R4                      ; 624F   00E4
        SDBD                                    ; 6250   0001
        ADDI    #$6240, R4                      ; 6251   02FC 0040 0062
        SDBD                                    ; 6254   0001
        MVI@    R4,     R2                      ; 6255   02A2
        MVII    #$002D, R3                      ; 6256   02BB 002D
        MVII    #$031D, R1                      ; 6258   02B9 031D

        JSR     R5,     .EXEC.9A1               ; 625A   0004 0118 01A1

        SDBD                                    ; 625D   0001
        MVII    #$9993, R0                      ; 625E   02B8 0093 0099
        MVO     R0,     G_031E                  ; 6261   0240 031E
        MVII    #$03F0, R0                      ; 6263   02B8 03F0
        MVO     R0,     G_0322                  ; 6265   0240 0322
        MVI     G_031D, R0                      ; 6267   0280 031D
        SDBD                                    ; 6269   0001
        ANDI    #$FDFF, R0                      ; 626A   03B8 00FF 00FD
        MVI     G_0321, R1                      ; 626D   0281 0321
        TSTR    R1                              ; 626F   0089
        BPL     L_6274                          ; 6270   0203 0002

        XORI    #$0200, R0                      ; 6272   03F8 0200
L_6274:
        MVO     R0,     G_031D                  ; 6274   0240 031D
        PULR    R7                              ; 6276   02B7

L_6277:
        PSHR    R5                              ; 6277   0275
        MOVR    R0,     R5                      ; 6278   0085
        ADDR    R5,     R5                      ; 6279   00ED
        SDBD                                    ; 627A   0001
        ADDI    #$6023, R5                      ; 627B   02FD 0023 0060
        SDBD                                    ; 627E   0001
        MVI@    R5,     R1                      ; 627F   02A9
        MVI@    R1,     R3                      ; 6280   028B
        SDBD                                    ; 6281   0001
        XORI    #$0800, R3                      ; 6282   03FB 0000 0008
        INCR    R1                              ; 6285   0009

        JSR     R5,     L_628A                  ; 6286   0004 0160 028A

        PULR    R7                              ; 6289   02B7

L_628A:
        PSHR    R5                              ; 628A   0275
        MOVR    R1,     R5                      ; 628B   008D
L_628C:
        MVI@    R5,     R0                      ; 628C   02A8
        ADDR    R0,     R0                      ; 628D   00C0
        BEQ     L_60A1                          ; 628E   0224 01EE

        SLL     R0,     2                       ; 6290   004C
        XORR    R3,     R0                      ; 6291   01D8
        MVO@    R0,     R4                      ; 6292   0260
        B       L_628C                          ; 6293   0220 0008

        DECLE   $0005,  $0217,  $0054,  $0065   ; 6295   0005 0217 0054 0065
        DECLE   $0061,  $006D,  $0073,  $0020   ; 6299   0061 006D 0073 0020
        DECLE   $0044,  $0072,  $0061,  $0066   ; 629D   0044 0072 0061 0066
        DECLE   $0074,  $0065,  $0064,  $0001   ; 62A1   0074 0065 0064 0001
        DECLE   $0003,  $0255,  $004E,  $006F   ; 62A5   0003 0255 004E 006F
        DECLE   $0077,  $0020,  $0073,  $0065   ; 62A9   0077 0020 0073 0065
        DECLE   $006C,  $0065,  $0063,  $0074   ; 62AD   006C 0065 0063 0074
        DECLE   $0000,  $027A,  $0073,  $0074   ; 62B1   0000 027A 0073 0074
        DECLE   $0061,  $0072,  $0074,  $0069   ; 62B5   0061 0072 0074 0069
        DECLE   $006E,  $0067,  $0020,  $0020   ; 62B9   006E 0067 0020 0020
        DECLE   $006C,  $0069,  $006E,  $0065   ; 62BD   006C 0069 006E 0065
        DECLE   $0075,  $0070,  $0002,  $0003   ; 62C1   0075 0070 0002 0003
        DECLE   $0203,  $0057,  $0065,  $006C   ; 62C5   0203 0057 0065 006C
        DECLE   $0063,  $006F,  $006D,  $0065   ; 62C9   0063 006F 006D 0065
        DECLE   $0020,  $0074,  $006F,  $0020   ; 62CD   0020 0074 006F 0020
        DECLE   $0074,  $0068,  $0065,  $0000   ; 62D1   0074 0068 0065 0000
        DECLE   $0253,  $0063,  $0061,  $0073   ; 62D5   0253 0063 0061 0073
        DECLE   $0068,  $0020,  $0072,  $0065   ; 62D9   0068 0020 0072 0065
        DECLE   $006D,  $0061,  $0069,  $006E   ; 62DD   006D 0061 0069 006E
        DECLE   $0069,  $006E,  $0067,  $003A   ; 62E1   0069 006E 0067 003A
        DECLE   $0002,  $00C2,  $0063,  $00FB   ; 62E5   0002 00C2 0063 00FB
        DECLE   $0063,  $0000,  $0000,  $0000   ; 62E9   0063 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 62ED   0000 0000 0000
L_62F0:
        PSHR    R5                              ; 62F0   0275

        JSR     R5,     L_66EC                  ; 62F1   0004 0164 02EC
        JSR     R5,     L_5E9D                  ; 62F4   0004 015C 029D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62F7   0000 0000 0000 0000

        JSR     R5,     L_5FB6                  ; 62FB   0004 015C 03B6

        COMR    R0                              ; 62FE   0018
        RSWD    R0                              ; 62FF   0038
        MOVR    R2,     R1                      ; 6300   0091
        CLRR    R0                              ; 6301   01C0
        MVO     R0,     G_0185                  ; 6302   0240 0185
        MVO     R0,     G_0186                  ; 6304   0240 0186
        INCR    R0                              ; 6306   0008
        MVO     R0,     G_01E5                  ; 6307   0240 01E5
        MVO     R0,     G_01E6                  ; 6309   0240 01E6
        MVII    #$0002, R0                      ; 630B   02B8 0002
        MVO     R0,     G_0172                  ; 630D   0240 0172
        CLRR    R0                              ; 630F   01C0
        MVO     R0,     G_0171                  ; 6310   0240 0171

        JSR     R5,     L_6359                  ; 6312   0004 0160 0359

        MVII    #$0001, R0                      ; 6315   02B8 0001
        MVO     R0,     G_0171                  ; 6317   0240 0171

        JSR     R5,     L_6359                  ; 6319   0004 0160 0359
        DECLE   $0001,  $02B8,  $00E6,  $0062   ; 631C   0001 02B8 00E6 0062
        DECLE   $0240,  $035D,  $0280,  $017A   ; 6320   0240 035D 0280 017A
        DECLE   $0080,  $0204,  $0022,  $0378   ; 6324   0080 0204 0022 0378
        DECLE   $00FF,  $0204,  $0017,  $02BC   ; 6328   00FF 0204 0017 02BC
        DECLE   $0177,  $0001,  $02A0,  $0080   ; 632C   0177 0001 02A0 0080
        DECLE   $020C,  $0017,  $0004,  $01A8   ; 6330   020C 0017 0004 01A8
        DECLE   $0000,  $0171,  $000B,  $001E   ; 6334   0000 0171 000B 001E
        DECLE   $01C0,  $0240,  $0171,  $0004   ; 6338   01C0 0240 0171 0004
        DECLE   $01A8,  $0000                   ; 633C   01A8 0000

        CMPR    R6,     R1                      ; 633E   0171
        INCR    R3                              ; 633F   000B
        COMR    R6                              ; 6340   001E
L_6341:
        PULR    R7                              ; 6341   02B7

        DECLE   $01C0,  $0240,  $0169,  $0240   ; 6342   01C0 0240 0169 0240
        DECLE   $016D,  $0220,  $0016,  $0004   ; 6346   016D 0220 0016 0004
        DECLE   $01A8,  $0000,  $0171,  $0001   ; 634A   01A8 0000 0171 0001
        DECLE   $001E,  $01C0,  $0240,  $0171   ; 634E   001E 01C0 0240 0171
        DECLE   $0004,  $01A8,  $0000,  $0171   ; 6352   0004 01A8 0000 0171
        DECLE   $0001                           ; 6356   0001

        DECR    R4                              ; 6357   0014
        PULR    R7                              ; 6358   02B7

L_6359:
        PSHR    R5                              ; 6359   0275

        JSR     R5,     L_6639                  ; 635A   0004 0164 0239

        INCR    R7                              ; 635D   000F

L_635E:
        PSHR    R5                              ; 635E   0275

L_635F:
        JSR     R5,     L_6676                  ; 635F   0004 0164 0276
        DECLE   $0004                           ; 6362   0004

        ANDR    R4,     R0                      ; 6363   01A0
        ANDR    R7,     R6                      ; 6364   01BE
        ADDI    #$0015, R4                      ; 6365   02FC 0015
        CLRR    R0                              ; 6367   01C0
L_6368:
        PSHR    R0                              ; 6368   0270
        DECLE   $0008,  $02BB,  $0003,  $0270   ; 6369   0008 02BB 0003 0270
        DECLE   $0004,  $01A0,  $01A8,  $00C5   ; 636D   0004 01A0 01A8 00C5
        DECLE   $02A8,  $0004                   ; 6371   02A8 0004

        ANDR    R4,     R0                      ; 6373   01A0
        MVO@    R4,     R1                      ; 6374   024C
        CLRC                                    ; 6375   0006
        CMPI    #$0006, R0                      ; 6376   0378 0006
        PULR    R0                              ; 6378   02B0
        BLT     L_637D                          ; 6379   0205 0002

        MVII    #$0004, R3                      ; 637B   02BB 0004
L_637D:
        MVII    #$01E5, R1                      ; 637D   02B9 01E5
        ADD     G_0171, R1                      ; 637F   02C1 0171
        CMP@    R1,     R0                      ; 6381   0348
        BNEQ    L_6386                          ; 6382   020C 0002

        MVII    #$0007, R3                      ; 6384   02BB 0007
L_6386:
        MVII    #$0001, R1                      ; 6386   02B9 0001
        PSHR    R4                              ; 6388   0274

        JSR     R5,     X_PRNUM_RGT             ; 6389   0004 0118 00C5
        DECLE   $02B4,  $0004,  $01A0,  $01A8   ; 638C   02B4 0004 01A0 01A8
        DECLE   $000D,  $02B0,  $0270,  $00C5   ; 6390   000D 02B0 0270 00C5
        DECLE   $02A8,  $0001,  $02B9,  $00BB   ; 6394   02A8 0001 02B9 00BB
        DECLE   $0018,  $0004                   ; 6398   0018 0004

        ANDR    R4,     R0                      ; 639A   01A0
        ANDR    R6,     R3                      ; 639B   01B3
        PSHR    R4                              ; 639C   0274
        MOVR    R5,     R4                      ; 639D   00AC

        JSR     R5,     L_5FF6                  ; 639E   0004 015C 03F6

        PULR    R4                              ; 63A1   02B4
        BNC     L_63A5                          ; 63A2   0209 0001

        CLRR    R1                              ; 63A4   01C9
L_63A5:
        DECR    R4                              ; 63A5   0014
        DECLE   $0261,  $0004,  $01A0,  $0194   ; 63A6   0261 0004 01A0 0194
        DECLE   $0000                           ; 63AA   0000

        SDBD                                    ; 63AB   0001
        MVI@    R5,     R1                      ; 63AC   02A9
        PSHR    R4                              ; 63AD   0274
        ADDI    #$0002, R4                      ; 63AE   02FC 0002

        JSR     R5,     X_PRINT_R1              ; 63B0   0004 0118 0067

        MOVR    R5,     R1                      ; 63B3   00A9
        INCR    R4                              ; 63B4   000C

        JSR     R5,     X_PRINT_R1              ; 63B5   0004 0118 0067

        PULR    R4                              ; 63B8   02B4
        ADDI    #$0014, R4                      ; 63B9   02FC 0014
        PULR    R0                              ; 63BB   02B0
        INCR    R0                              ; 63BC   0008
        CMPI    #$0005, R0                      ; 63BD   0378 0005
        BNEQ    L_6368                          ; 63BF   022C 0058
        PULR    R7                              ; 63C1   02B7

        DECLE   $0004                           ; 63C2   0004

        MOVR    R5,     R0                      ; 63C3   00A8
        NEGR    R3                              ; 63C4   0023
L_63C5:
        PSHR    R5                              ; 63C5   0275
        MVO     R1,     G_0171                  ; 63C6   0241 0171
        MVII    #$0185, R2                      ; 63C8   02BA 0185
        ADD     G_0171, R2                      ; 63CA   02C2 0171
        MVI@    R2,     R5                      ; 63CC   0295
        DECR    R5                              ; 63CD   0015
        BEQ     L_64D8                          ; 63CE   0204 0108
        BPL     L_6341                          ; 63D0   0223 0090

        ADDI    #$01E5, R1                      ; 63D2   02F9 01E5
        MVI@    R1,     R2                      ; 63D4   028A
        CMPI    #$0003, R0                      ; 63D5   0378 0003
        BLT     L_6341                          ; 63D7   0225 0097

        CMPI    #$0005, R0                      ; 63D9   0378 0005
        BGT     L_63E4                          ; 63DB   020E 0007

        DECR    R2                              ; 63DD   0012
        BGT     L_63F3                          ; 63DE   020E 0013

        MVII    #$0005, R2                      ; 63E0   02BA 0005
        B       L_63F3                          ; 63E2   0200 000F

L_63E4:
        CMPI    #$000B, R0                      ; 63E4   0378 000B
        BLT     L_6341                          ; 63E6   0225 00A6

        CMPI    #$000D, R0                      ; 63E8   0378 000D
        BGT     L_6341                          ; 63EA   022E 00AA

        INCR    R2                              ; 63EC   000A
        CMPI    #$0005, R2                      ; 63ED   037A 0005
        BLE     L_63F3                          ; 63EF   0206 0002

        MVII    #$0001, R2                      ; 63F1   02BA 0001
L_63F3:
        MVO@    R2,     R1                      ; 63F3   024A

        JSR     R5,     L_635E                  ; 63F4   0004 0160 035E
        JSR     R5,     L_5E30                  ; 63F7   0004 015C 0230

        PULR    R7                              ; 63FA   02B7

        DECLE   $0004                           ; 63FB   0004

        MOVR    R5,     R0                      ; 63FC   00A8
        NEGR    R3                              ; 63FD   0023
L_63FE:
        PSHR    R5                              ; 63FE   0275
        MVO     R1,     G_0171                  ; 63FF   0241 0171
        ADDI    #$01E5, R1                      ; 6401   02F9 01E5
        MVII    #$0185, R2                      ; 6403   02BA 0185
        ADD     G_0171, R2                      ; 6405   02C2 0171
        MVI@    R2,     R3                      ; 6407   0293
        INCR    R3                              ; 6408   000B
        ADDR    R7,     R3                      ; 6409   00FB
        ADD@    R3,     R7                      ; 640A   02DF

        DIS                                     ; 640B   0003
        ADDR    R1,     R5                      ; 640C   00CD
        ADDR    R1,     R5                      ; 640D   00CD
        CMPI    #$000A, R0                      ; 640E   0378 000A
        BEQ     L_64C6                          ; 6410   0204 00B4

        TSTR    R0                              ; 6412   0080
        BEQ     L_6425                          ; 6413   0204 0010

        CMPI    #$000B, R0                      ; 6415   0378 000B
        BEQ     L_6456                          ; 6417   0204 003D

        CMPI    #$0005, R0                      ; 6419   0378 0005
        BGT     L_6341                          ; 641B   022E 00DB

        MVO@    R0,     R1                      ; 641D   0248

L_641E:
        JSR     R5,     L_635E                  ; 641E   0004 0160 035E
        JSR     R5,     L_5E30                  ; 6421   0004 015C 0230

        PULR    R7                              ; 6424   02B7

L_6425:
        MVI     G_017A, R5                      ; 6425   0285 017A
        DECLE   $037D,  $00FF,  $0224,  $00E9   ; 6427   037D 00FF 0224 00E9
        DECLE   $0004,  $01A0,  $01A8,  $02CD   ; 642B   0004 01A0 01A8 02CD
        DECLE   $02A8,  $0004                   ; 642F   02A8 0004

        ANDR    R4,     R0                      ; 6431   01A0
        ANDR    R6,     R3                      ; 6432   01B3
        MOVR    R5,     R4                      ; 6433   00AC
        PSHR    R4                              ; 6434   0274

        JSR     R5,     L_5FF6                  ; 6435   0004 015C 03F6

        PULR    R4                              ; 6438   02B4
        BNC     L_644E                          ; 6439   0209 0013

        MOVR    R4,     R5                      ; 643B   00A5
        MVI@    R5,     R5                      ; 643C   02AD
        CMPI    #$0003, R5                      ; 643D   037D 0003
        BEQ     L_64E1                          ; 643F   0204 00A0

        JSR     R5,     L_674E                  ; 6441   0004 0164 034E

        BC      L_64E1                          ; 6444   0201 009B

        JSR     R5,     L_5FD7                  ; 6446   0004 015C 03D7
        JSR     R5,     L_5E4E                  ; 6449   0004 015C 024E

        B       L_641E                          ; 644C   0220 002F

L_644E:
        JSR     R5,     L_5FE1                  ; 644E   0004 015C 03E1
        JSR     R5,     L_5E4E                  ; 6451   0004 015C 024E

        B       L_641E                          ; 6454   0220 0037

L_6456:
        MVI     G_017A, R0                      ; 6456   0280 017A
        DECLE   $0378,  $00FF,  $0204,  $0008   ; 6458   0378 00FF 0204 0008
        DECLE   $0004                           ; 645C   0004

        ANDR    R4,     R0                      ; 645D   01A0
        ANDR    R6,     R3                      ; 645E   01B3
        MVI@    R5,     R5                      ; 645F   02AD
        CMPI    #$0003, R5                      ; 6460   037D 0003
        BNEQ    L_64E1                          ; 6462   020C 007D

        MVII    #$0002, R0                      ; 6464   02B8 0002
        MVO@    R0,     R2                      ; 6466   0250

        JSR     R5,     L_5E5D                  ; 6467   0004 015C 025D
        DECLE   $0280,  $0185,  $02C0,  $0186   ; 646A   0280 0185 02C0 0186
        DECLE   $0378,  $0004,  $020C,  $0050   ; 646E   0378 0004 020C 0050
        DECLE   $0280,  $017A,  $0080,  $0204   ; 6472   0280 017A 0080 0204
        DECLE   $0035,  $0378,  $00FF,  $0204   ; 6476   0035 0378 00FF 0204
        DECLE   $0040,  $0004                   ; 647A   0040 0004

        ANDR    R2,     R4                      ; 647C   0194
        SUBR    R3,     R1                      ; 647D   0119

        JSR     R5,     L_66E7                  ; 647E   0004 0164 02E7
        DECLE   $02B8,  $0003,  $0240,  $0172   ; 6481   02B8 0003 0240 0172
        DECLE   $0280,  $01EB,  $0080,  $0204   ; 6485   0280 01EB 0080 0204
        DECLE   $0004,  $0004                   ; 6489   0004 0004

        ANDR    R4,     R0                      ; 648B   01A0
        SUB@    R1,     R4                      ; 648C   030C
        PULR    R7                              ; 648D   02B7

        MVII    #$0177, R4                      ; 648E   02BC 0177
        SDBD                                    ; 6490   0001
        MVI@    R4,     R0                      ; 6491   02A0
        TSTR    R0                              ; 6492   0080
        BNEQ    L_649F                          ; 6493   020C 000A

        JSR     R5,     .EXEC.7B3               ; 6495   0004 0114 03B3
        JSR     R5,     L_5568                  ; 6498   0004 0154 0168
        DECLE   $0004                           ; 649B   0004

        ANDR    R5,     R4                      ; 649C   01AC
        SWAP    R0,     2                       ; 649D   0044
        PULR    R7                              ; 649E   02B7

L_649F:
        SDBD                                    ; 649F   0001
        DECLE   $02B8,  $0086,  $00AE,  $0240   ; 64A0   02B8 0086 00AE 0240
        DECLE   $035D,  $0004                   ; 64A4   035D 0004

        ANDR    R4,     R4                      ; 64A6   01A4
        XORI    #$017B, R3                      ; 64A7   03FB 017B

        JSR     R4,     .EXEC.6B7               ; 64A9   0004 0014 02B7
        JSR     R5,     L_5E8E                  ; 64AC   0004 015C 028E
        JSR     R5,     L_67D5                  ; 64AF   0004 0164 03D5

        ADDR    R0,     R1                      ; 64B2   00C1
        SLR     R3,     2                       ; 64B3   0067
        INCR    R0                              ; 64B4   0008
        CLRC                                    ; 64B5   0006
        EIS                                     ; 64B6   0002

        JSR     R5,     L_5040                  ; 64B7   0004 0150 0040

        PULR    R7                              ; 64BA   02B7

        CLRR    R0                              ; 64BB   01C0
        MVO     R0,     G_017A                  ; 64BC   0240 017A

        JSR     R5,     L_691F                  ; 64BE   0004 0168 011F

        PULR    R7                              ; 64C1   02B7

        JSR     R5,     L_66CA                  ; 64C2   0004 0164 02CA

        PULR    R7                              ; 64C5   02B7

L_64C6:
        MVII    #$0001, R5                      ; 64C6   02BD 0001
        MVO@    R5,     R2                      ; 64C8   0255

        JSR     R5,     L_6639                  ; 64C9   0004 0164 0239
        DECLE   $0004                           ; 64CC   0004

        ANDR    R4,     R0                      ; 64CD   01A0
        ANDR    R5,     R0                      ; 64CE   01A8
        ADD@    R1,     R5                      ; 64CF   02CD
        MVI@    R5,     R0                      ; 64D0   02A8

        JSR     R5,     L_6515                  ; 64D1   0004 0164 0115
        JSR     R5,     L_5E3F                  ; 64D4   0004 015C 023F

        PULR    R7                              ; 64D7   02B7

L_64D8:
        CLRR    R0                              ; 64D8   01C0
        MVO@    R0,     R2                      ; 64D9   0250

        JSR     R5,     L_6359                  ; 64DA   0004 0160 0359
        JSR     R5,     L_5E3F                  ; 64DD   0004 015C 023F

        PULR    R7                              ; 64E0   02B7

L_64E1:
        JSR     R5,     L_5E6C                  ; 64E1   0004 015C 026C

        PULR    R7                              ; 64E4   02B7

        COMR    R0                              ; 64E5   0018
        RLC     R0,     1                       ; 64E6   0050
        RRC     R0,     2                       ; 64E7   0074
        RRC     R3,     1                       ; 64E8   0073
        ADCR    R7                              ; 64E9   002F

        SWAP    R3,     2                       ; 64EA   0047
L_64EB:
        SLR     R1,     1                       ; 64EB   0061
        DECLE   $006D,  $0065,  $0000,  $002B   ; 64EC   006D 0065 0000 002B
        DECLE   $0025,  $0020,  $0032,  $002D   ; 64F0   0025 0020 0032 002D
        DECLE   $0070,  $0074,  $0000,  $003F   ; 64F4   0070 0074 0000 003F
        DECLE   $0025,  $0020,  $0033,  $002D   ; 64F8   0025 0020 0033 002D
        DECLE   $0070,  $0074,  $0000           ; 64FC   0070 0074 0000

        RLC     R0,     2                       ; 64FF   0054
        RLC     R2,     1                       ; 6500   0052
        SLR     R1,     2                       ; 6501   0065
        SLR     R2,     1                       ; 6502   0062
        ADCR    R7                              ; 6503   002F

        SWAP    R3,     2                       ; 6504   0047
L_6505:
        SLR     R1,     1                       ; 6505   0061
        DECLE   $006D,  $0065,  $0000           ; 6506   006D 0065 0000

        SAR     R0,     1                       ; 6509   0068
        SLL     R1,     2                       ; 650A   004D
        SAR     R1,     1                       ; 650B   0069
        SAR     R2,     2                       ; 650C   006E
        RRC     R3,     1                       ; 650D   0073
        ADCR    R7                              ; 650E   002F

        SWAP    R3,     2                       ; 650F   0047
L_6510:
        SLR     R1,     1                       ; 6510   0061
        DECLE   $006D,  $0065,  $0000,  $0000   ; 6511   006D 0065 0000 0000
L_6515:
        PSHR    R5                              ; 6515   0275
        MVO     R0,     G_017F                  ; 6516   0240 017F

        JSR     R5,     L_6639                  ; 6518   0004 0164 0239
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 651B   0280 017F 0004 01A0
        DECLE   $0194,  $0000,  $0001,  $02A9   ; 651F   0194 0000 0001 02A9
        DECLE   $02BB,  $0007,  $0004           ; 6523   02BB 0007 0004

        ANDR    R4,     R0                      ; 6526   01A0
        ANDR    R7,     R6                      ; 6527   01BE

        JSR     R5,     X_PRINT_R1              ; 6528   0004 0118 0067

        MOVR    R5,     R1                      ; 652B   00A9
        INCR    R4                              ; 652C   000C

        JSR     R5,     X_PRINT_R1              ; 652D   0004 0118 0067

        MVI     G_0171, R2                      ; 6530   0282 0171

        JSR     R5,     L_6847                  ; 6532   0004 0168 0047
        BIDECLE $6768                           ; 6535   0068 0067
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 6537   0280 017F 0004 01A0
        DECLE   $0194,  $0000,  $00A9,  $02BB   ; 653B   0194 0000 00A9 02BB
        DECLE   $0003,  $0004                   ; 653F   0003 0004

        ANDR    R4,     R0                      ; 6541   01A0
        ANDR    R7,     R6                      ; 6542   01BE

        JSR     R5,     L_6870                  ; 6543   0004 0168 0070
        BIDECLE $6795                           ; 6546   0095 0067
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 6548   0280 017F 0004 01A0
        DECLE   $0194,  $0006,  $02A8,  $0064   ; 654C   0194 0006 02A8 0064
        DECLE   $02B9,  $0002,  $0004           ; 6550   02B9 0002 0004

        ANDR    R4,     R0                      ; 6553   01A0
        ANDR    R7,     R6                      ; 6554   01BE
        ADDI    #$0037, R4                      ; 6555   02FC 0037

        JSR     R5,     X_PRNUM_RGT             ; 6557   0004 0118 00C5
        DECLE   $0280,  $017F,  $0004           ; 655A   0280 017F 0004

        ANDR    R4,     R0                      ; 655D   01A0
        ANDR    R2,     R4                      ; 655E   0194
        INCR    R0                              ; 655F   0008
        MVI@    R5,     R0                      ; 6560   02A8
        SLR     R0,     2                       ; 6561   0064
        SLR     R0,     2                       ; 6562   0064
        BNEQ    L_6566                          ; 6563   020C 0001

        INCR    R0                              ; 6565   0008
L_6566:
        MVII    #$0002, R1                      ; 6566   02B9 0002
        DECLE   $0004                           ; 6568   0004

        ANDR    R4,     R0                      ; 6569   01A0
        ANDR    R7,     R6                      ; 656A   01BE
        ADDI    #$0023, R4                      ; 656B   02FC 0023

        JSR     R5,     X_PRNUM_RGT             ; 656D   0004 0118 00C5
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 6570   0280 017F 0004 01A0
        DECLE   $0194,  $0007,  $02A8,  $0004   ; 6574   0194 0007 02A8 0004

        ANDR    R4,     R0                      ; 6578   01A0
        ANDR    R7,     R6                      ; 6579   01BE
        ADDI    #$000F, R4                      ; 657A   02FC 000F
        MOVR    R0,     R1                      ; 657C   0081
        ANDI    #$000F, R1                      ; 657D   03B9 000F
        PSHR    R1                              ; 657F   0271
        CMPI    #$000A, R1                      ; 6580   0379 000A
        BGE     L_6585                          ; 6582   020D 0001

        INCR    R4                              ; 6584   000C
L_6585:
        SLR     R0,     2                       ; 6585   0064
        SLR     R0,     2                       ; 6586   0064
        MVII    #$0001, R1                      ; 6587   02B9 0001
        MVII    #$0007, R3                      ; 6589   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 658B   0004 0118 00C5

        ADDR    R1,     R4                      ; 658E   00CC
        MVII    #$003F, R0                      ; 658F   02B8 003F
        MVO@    R0,     R4                      ; 6591   0260
        PULR    R0                              ; 6592   02B0
        CMPI    #$000A, R0                      ; 6593   0378 000A
        BLT     L_6598                          ; 6595   0205 0001

        INCR    R1                              ; 6597   0009

L_6598:
        JSR     R5,     X_PRNUM_RGT             ; 6598   0004 0118 00C5

        ADDR    R1,     R4                      ; 659B   00CC
        MVI     G_0172, R0                      ; 659C   0280 0172
        CMPI    #$0001, R0                      ; 659E   0378 0001
        BNEQ    L_65A8                          ; 65A0   020C 0006

        SDBD                                    ; 65A2   0001
        MVII    #$097F, R0                      ; 65A3   02B8 007F 0009
        MVO@    R0,     R4                      ; 65A6   0260
        PULR    R7                              ; 65A7   02B7

L_65A8:
        SDBD                                    ; 65A8   0001
        MVII    #$0847, R0                      ; 65A9   02B8 0047 0008
        MVO@    R0,     R4                      ; 65AC   0260
        MVI     G_0171, R2                      ; 65AD   0282 0171

        JSR     R5,     L_6847                  ; 65AF   0004 0168 0047
        BIDECLE $67A0                           ; 65B2   00A0 0067
        DECLE   $0280,  $017F,  $0004,  $00A0   ; 65B4   0280 017F 0004 00A0
        DECLE   $0254,  $00A1,  $02BB,  $0006   ; 65B8   0254 00A1 02BB 0006
        DECLE   $0004                           ; 65BC   0004

        ANDR    R4,     R0                      ; 65BD   01A0
        ANDR    R7,     R6                      ; 65BE   01BE

        JSR     R5,     L_6870                  ; 65BF   0004 0168 0070
        BIDECLE $67B0                           ; 65C2   00B0 0067
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 65C4   0280 017F 0004 01A0
        DECLE   $024C,  $0000,  $0081,  $0280   ; 65C8   024C 0000 0081 0280
        DECLE   $017F,  $0004                   ; 65CC   017F 0004

        ANDR    R4,     R0                      ; 65CE   01A0
        MVO@    R4,     R1                      ; 65CF   024C
        SDBD                                    ; 65D0   0001
        MVII    #$0406, R3                      ; 65D1   02BB 0006 0004
        ANDR    R4,     R0                      ; 65D4   01A0
        ANDR    R7,     R6                      ; 65D5   01BE
        PSHR    R4                              ; 65D6   0274
        ADDI    #$0044, R4                      ; 65D7   02FC 0044

        JSR     R5,     L_6737                  ; 65D9   0004 0164 0337
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 65DC   0280 017F 0004 01A0
        DECLE   $024C,  $0002,  $0081,  $0280   ; 65E0   024C 0002 0081 0280
        DECLE   $017F,  $0004                   ; 65E4   017F 0004

        ANDR    R4,     R0                      ; 65E6   01A0
        MVO@    R4,     R1                      ; 65E7   024C
        DIS                                     ; 65E8   0003
        PULR    R4                              ; 65E9   02B4
        PSHR    R4                              ; 65EA   0274
        ADDI    #$0058, R4                      ; 65EB   02FC 0058

        JSR     R5,     L_6737                  ; 65ED   0004 0164 0337
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 65F0   0280 017F 0004 01A0
        DECLE   $024C,  $0004,  $0081,  $0280   ; 65F4   024C 0004 0081 0280
        DECLE   $017F,  $0004,  $01A0,  $024C   ; 65F8   017F 0004 01A0 024C
        DECLE   $0005                           ; 65FC   0005

        PULR    R4                              ; 65FD   02B4
        PSHR    R4                              ; 65FE   0274
        ADDI    #$006C, R4                      ; 65FF   02FC 006C

        JSR     R5,     L_6737                  ; 6601   0004 0164 0337
        DECLE   $0280,  $017F,  $0004,  $01A0   ; 6604   0280 017F 0004 01A0
        DECLE   $024C,  $0005,  $0270,  $0280   ; 6608   024C 0005 0270 0280
        DECLE   $017F,  $0004,  $01A0,  $024C   ; 660C   017F 0004 01A0 024C
        DECLE   $0001,  $00C0,  $0270,  $0280   ; 6610   0001 00C0 0270 0280
        DECLE   $017F,  $0004                   ; 6614   017F 0004

        ANDR    R4,     R0                      ; 6616   01A0
        MVO@    R4,     R1                      ; 6617   024C
        DIS                                     ; 6618   0003
        PSHR    R0                              ; 6619   0270
        ADDR    R0,     R0                      ; 661A   00C0
        ADD@    R6,     R0                      ; 661B   02F0
        ADD@    R6,     R0                      ; 661C   02F0
        ADD@    R6,     R0                      ; 661D   02F0
        MVII    #$0003, R1                      ; 661E   02B9 0003
        MVII    #$0006, R3                      ; 6620   02BB 0006
        PULR    R4                              ; 6622   02B4
        PSHR    R4                              ; 6623   0274
        ADDI    #$001B, R4                      ; 6624   02FC 001B

        JSR     R5,     X_PRNUM_RGT             ; 6626   0004 0118 00C5
        DECLE   $0280,  $017F,  $0004           ; 6629   0280 017F 0004

        ANDR    R4,     R0                      ; 662C   01A0
        MVO@    R4,     R1                      ; 662D   024C
        INCR    R0                              ; 662E   0008
        SLR     R0,     2                       ; 662F   0064
        MVII    #$0002, R1                      ; 6630   02B9 0002
        PULR    R4                              ; 6632   02B4
        ADDI    #$003A, R4                      ; 6633   02FC 003A

        JSR     R5,     X_PRNUM_RGT             ; 6635   0004 0118 00C5

        PULR    R7                              ; 6638   02B7

L_6639:
        PSHR    R5                              ; 6639   0275
        DECLE   $0004                           ; 663A   0004

        ANDR    R4,     R0                      ; 663B   01A0
        ANDR    R7,     R6                      ; 663C   01BE
        B       L_6644                          ; 663D   0200 0005

L_663F:
        PSHR    R5                              ; 663F   0275
        MVII    #$0200, R4                      ; 6640   02BC 0200
        B       L_6644                          ; 6642   0200 0000

L_6644:
        MVII    #$0078, R0                      ; 6644   02B8 0078
        B       L_664D                          ; 6646   0200 0005

L_6648:
        PSHR    R5                              ; 6648   0275
        MVII    #$00F0, R0                      ; 6649   02B8 00F0
        MVII    #$0200, R4                      ; 664B   02BC 0200

L_664D:
        JSR     R5,     X_FILL_ZERO             ; 664D   0004 0114 0338

        PULR    R7                              ; 6650   02B7

        DECLE   $0055,  $0066,  $005B,  $0066   ; 6651   0055 0066 005B 0066
        DECLE   $0000,  $0001,  $0002,  $0003   ; 6655   0000 0001 0002 0003
        DECLE   $0016,  $0000,  $0004,  $0005   ; 6659   0016 0000 0004 0005
        DECLE   $0006,  $0007,  $0016,  $0000   ; 665D   0006 0007 0016 0000
        DECLE   $0002,  $0008,  $0001           ; 6661   0002 0008 0001

        INCR    R0                              ; 6664   0008
        INCR    R1                              ; 6665   0009
        INCR    R2                              ; 6666   000A
        INCR    R3                              ; 6667   000B
        INCR    R4                              ; 6668   000C
        INCR    R5                              ; 6669   000D
        INCR    R6                              ; 666A   000E
        DECR    R6                              ; 666B   0016
        INCR    R7                              ; 666C   000F

        DECR    R0                              ; 666D   0010
L_666E:
        DECR    R1                              ; 666E   0011
        DECLE   $0012,  $0016,  $0013,  $0014   ; 666F   0012 0016 0013 0014
        DECLE   $0015,  $0016,  $0000           ; 6673   0015 0016 0000
L_6676:
        PSHR    R5                              ; 6676   0275
        DECLE   $0004                           ; 6677   0004

        ANDR    R4,     R0                      ; 6678   01A0
        ANDR    R7,     R6                      ; 6679   01BE

        JSR     R5,     L_66A9                  ; 667A   0004 0164 02A9

        SDBD                                    ; 667D   0001
        XORI    #$0800, R3                      ; 667E   03FB 0000 0008
        MVI     G_017A, R5                      ; 6681   0285 017A
        CMPI    #$00FF, R5                      ; 6683   037D 00FF
        BEQ     L_668F                          ; 6685   0204 0008

        SDBD                                    ; 6687   0001
        MVII    #$6665, R1                      ; 6688   02B9 0065 0066

        JSR     R5,     L_628A                  ; 668B   0004 0160 028A

        PULR    R7                              ; 668E   02B7

L_668F:
        SDBD                                    ; 668F   0001
        MVII    #$6671, R1                      ; 6690   02B9 0071 0066
        ADDI    #$000B, R4                      ; 6693   02FC 000B

        JSR     R5,     L_628A                  ; 6695   0004 0160 028A

        MVII    #$0175, R5                      ; 6698   02BD 0175
        ADD     G_0171, R5                      ; 669A   02C5 0171
        MVI@    R5,     R0                      ; 669C   02A8
        MVII    #$0003, R1                      ; 669D   02B9 0003
        SDBD                                    ; 669F   0001
        ANDI    #$F7FF, R3                      ; 66A0   03BB 00FF 00F7
        SUBI    #$000C, R4                      ; 66A3   033C 000C

        JSR     R5,     X_PRNUM_RGT             ; 66A5   0004 0118 00C5

        PULR    R7                              ; 66A8   02B7

L_66A9:
        PSHR    R5                              ; 66A9   0275
        MVI     G_0171, R5                      ; 66AA   0285 0171
        ADDR    R5,     R5                      ; 66AC   00ED
        SDBD                                    ; 66AD   0001
        ADDI    #$6661, R5                      ; 66AE   02FD 0061 0066
        SDBD                                    ; 66B1   0001
        MVI@    R5,     R3                      ; 66B2   02AB
        MVI     G_0171, R5                      ; 66B3   0285 0171
        ADDR    R5,     R5                      ; 66B5   00ED
        SDBD                                    ; 66B6   0001
        ADDI    #$6651, R5                      ; 66B7   02FD 0051 0066
        SDBD                                    ; 66BA   0001
        MVI@    R5,     R1                      ; 66BB   02A9
        MVI@    R1,     R0                      ; 66BC   0288
        ADDR    R0,     R0                      ; 66BD   00C0
        SLL     R0,     2                       ; 66BE   004C
        XORR    R3,     R0                      ; 66BF   01D8
        MVO@    R0,     R4                      ; 66C0   0260
        INCR    R1                              ; 66C1   0009

        JSR     R5,     L_628A                  ; 66C2   0004 0160 028A

        SDBD                                    ; 66C5   0001
        ANDI    #$F7FF, R3                      ; 66C6   03BB 00FF 00F7
        PULR    R7                              ; 66C9   02B7

L_66CA:
        PSHR    R5                              ; 66CA   0275

        JSR     R5,     L_6639                  ; 66CB   0004 0164 0239
        DECLE   $0004                           ; 66CE   0004

        ANDR    R4,     R0                      ; 66CF   01A0
        ANDR    R7,     R6                      ; 66D0   01BE
        ADDI    #$002A, R4                      ; 66D1   02FC 002A

        JSR     R5,     L_66A9                  ; 66D3   0004 0164 02A9
        JSR     R5,     X_PRINT_R5              ; 66D6   0004 0118 007B
        STRING  "are ready..."                  ; 66D9  
        DECLE   $0000                           ; 66E5   0000

        PULR    R7                              ; 66E6   02B7

L_66E7:
        SDBD                                    ; 66E7   0001
        MVII    #$1000, R2                      ; 66E8   02BA 0000 0010
        INCR    R7                              ; 66EB   000F

L_66EC:
        CLRR    R2                              ; 66EC   01D2
L_66ED:
        SDBD                                    ; 66ED   0001
        MVII    #$EFFF, R1                      ; 66EE   02B9 00FF 00EF
        MVII    #$031D, R3                      ; 66F1   02BB 031D
L_66F3:
        MVI@    R3,     R0                      ; 66F3   0298
        ANDR    R1,     R0                      ; 66F4   0188
        XORR    R2,     R0                      ; 66F5   01D0
        MVO@    R0,     R3                      ; 66F6   0258
        ADDI    #$0008, R3                      ; 66F7   02FB 0008
        CMPI    #$035D, R3                      ; 66F9   037B 035D
        BNEQ    L_66F3                          ; 66FB   022C 0009
        MOVR    R5,     R7                      ; 66FD   00AF

L_66FE:
        MVII    #$0006, R3                      ; 66FE   02BB 0006
L_6700:
        PSHR    R5                              ; 6700   0275
        MVII    #$0020, R1                      ; 6701   02B9 0020
        XORR    R3,     R1                      ; 6703   01D9
        MVO@    R1,     R4                      ; 6704   0261
        CMPI    #$0064, R0                      ; 6705   0378 0064
        BLT     L_6722                          ; 6707   0205 0019

        MOVR    R0,     R1                      ; 6709   0081
        MVII    #$0064, R2                      ; 670A   02BA 0064

        JSR     R5,     X_DIV                   ; 670C   0004 011C 01FB

        PSHR    R1                              ; 670F   0271
        MVII    #$0001, R1                      ; 6710   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 6712   0004 0118 00C5

        INCR    R4                              ; 6715   000C
        MVII    #$0060, R1                      ; 6716   02B9 0060
        XORR    R3,     R1                      ; 6718   01D9
        MVO@    R1,     R4                      ; 6719   0261
        PULR    R0                              ; 671A   02B0
        MVII    #$0002, R1                      ; 671B   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 671D   0004 0118 00AD

        B       L_672C                          ; 6720   0200 000A

L_6722:
        MVII    #$0002, R1                      ; 6722   02B9 0002
        CMPI    #$000A, R0                      ; 6724   0378 000A
        BGE     L_6729                          ; 6726   020D 0001

        DECR    R1                              ; 6728   0011

L_6729:
        JSR     R5,     X_PRNUM_RGT             ; 6729   0004 0118 00C5

L_672C:
        ADDR    R1,     R4                      ; 672C   00CC

        JSR     R5,     X_PRINT_R5              ; 672D   0004 0118 007B
        STRING  "0,000"                         ; 6730  
        DECLE   $0000                           ; 6735   0000

        PULR    R7                              ; 6736   02B7

L_6737:
        PSHR    R5                              ; 6737   0275
        PSHR    R1                              ; 6738   0271
        MVII    #$0064, R1                      ; 6739   02B9 0064

        JSR     R5,     X_MPY                   ; 673B   0004 011C 01DC

        MOVR    R2,     R1                      ; 673E   0091
        PULR    R2                              ; 673F   02B2

        JSR     R5,     X_DIV                   ; 6740   0004 011C 01FB

        MVII    #$0003, R1                      ; 6743   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 6745   0004 0118 00C5

        ADDR    R1,     R4                      ; 6748   00CC
        MVII    #$0028, R0                      ; 6749   02B8 0028
        XORR    R3,     R0                      ; 674B   01D8
        MVO@    R0,     R4                      ; 674C   0260
        PULR    R7                              ; 674D   02B7

L_674E:
        PSHR    R5                              ; 674E   0275
        DECLE   $0274,  $0270,  $0004,  $01A0   ; 674F   0274 0270 0004 01A0
        DECLE   $024C,  $0006,  $0270,  $0004   ; 6753   024C 0006 0270 0004

        ANDR    R4,     R0                      ; 6757   01A0
        PULR    R1                              ; 6758   02B1
        PULR    R0                              ; 6759   02B0
        CMPI    #$0006, R0                      ; 675A   0378 0006
        PULR    R0                              ; 675C   02B0
        PULR    R4                              ; 675D   02B4
        BLT     L_6764                          ; 675E   0205 0004

        CMPI    #$0003, R1                      ; 6760   0379 0003
        BLT     L_6766                          ; 6762   0205 0002

L_6764:
        CLRC                                    ; 6764   0006
        PULR    R7                              ; 6765   02B7

L_6766:
        SETC                                    ; 6766   0007
        PULR    R7                              ; 6767   02B7

        DECLE   $0005,  $0214,  $0050,  $0074   ; 6768   0005 0214 0050 0074
        DECLE   $0073,  $0000,  $0228,  $0052   ; 676C   0073 0000 0228 0052
        DECLE   $0065,  $0062,  $0000,  $023C   ; 6770   0065 0062 0000 023C
        DECLE   $0032,  $0070,  $0074,  $0000   ; 6774   0032 0070 0074 0000
        DECLE   $0250,  $0033,  $0070,  $0074   ; 6778   0250 0033 0070 0074
        DECLE   $0000,  $0264,  $0046,  $0074   ; 677C   0000 0264 0046 0074
        DECLE   $0000,  $021F,  $0046,  $006F   ; 6780   0000 021F 0046 006F
        DECLE   $0075,  $0000,  $0233,  $004D   ; 6784   0075 0000 0233 004D
        DECLE   $0069,  $006E,  $0001,  $0003   ; 6788   0069 006E 0001 0003
        DECLE   $0242,  $0025,  $0000,  $0256   ; 678C   0242 0025 0000 0256
        DECLE   $0025,  $0000,  $026A,  $0025   ; 6790   0025 0000 026A 0025
        DECLE   $0002,  $0002,  $0018,  $0005   ; 6794   0002 0002 0018 0005
        DECLE   $002C,  $0003,  $0040,  $0004   ; 6798   002C 0003 0040 0004
        DECLE   $0054,  $0009,  $0068,  $00FF   ; 679C   0054 0009 0068 00FF
        DECLE   $0006,  $0225,  $002F,  $0000   ; 67A0   0006 0225 002F 0000
        DECLE   $0239,  $002F,  $0000,  $024B   ; 67A4   0239 002F 0000 024B
        DECLE   $002F,  $0000,  $025F,  $002F   ; 67A8   002F 0000 025F 002F
        DECLE   $0000                           ; 67AC   0000

        PSHR    R3                              ; 67AD   0273
        ADCR    R7                              ; 67AE   002F

        EIS                                     ; 67AF   0002
L_67B0:
        SETC                                    ; 67B0   0007
        DECLE   $0030,  $0001,  $0049,  $0000   ; 67B1   0030 0001 0049 0000
        DECLE   $004C,  $0003,  $005D,  $0002   ; 67B5   004C 0003 005D 0002
        DECLE   $0060,  $0005,  $0071,  $0004   ; 67B9   0060 0005 0071 0004
        DECLE   $0074,  $0006,  $0026,  $00FF   ; 67BD   0074 0006 0026 00FF
        DECLE   $0005,  $0230,  $0069,  $0074   ; 67C1   0005 0230 0069 0074
        DECLE   $0027,  $0073,  $0001           ; 67C5   0027 0073 0001

        CLRC                                    ; 67C8   0006
        MVO@    R1,     R5                      ; 67C9   0269
        SWAP    R3,     2                       ; 67CA   0047
        SWAP    R1,     1                       ; 67CB   0041
        SLL     R1,     2                       ; 67CC   004D
        SWAP    R1,     2                       ; 67CD   0045
        NEGR    R0                              ; 67CE   0020
        RLC     R0,     2                       ; 67CF   0054
        SLL     R1,     1                       ; 67D0   0049
        SLL     R1,     2                       ; 67D1   004D
        SWAP    R1,     2                       ; 67D2   0045
        NEGR    R1                              ; 67D3   0021
        EIS                                     ; 67D4   0002
L_67D5:
        PSHR    R5                              ; 67D5   0275

        JSR     R5,     .EXEC.7B3               ; 67D6   0004 0114 03B3
        JSR     R5,     L_6648                  ; 67D9   0004 0164 0248

        PULR    R5                              ; 67DC   02B5
        SDBD                                    ; 67DD   0001
        MVI@    R5,     R4                      ; 67DE   02AC
        MVI@    R5,     R1                      ; 67DF   02A9
        MVI@    R5,     R2                      ; 67E0   02AA
        MVI@    R5,     R3                      ; 67E1   02AB
        PSHR    R5                              ; 67E2   0275
L_67E3:
        PSHR    R1                              ; 67E3   0271
        PSHR    R2                              ; 67E4   0272
        NOP                                     ; 67E5   0034
        PSHR    R3                              ; 67E6   0273
        PSHR    R4                              ; 67E7   0274
        PULR    R4                              ; 67E8   02B4
        PSHR    R4                              ; 67E9   0274

        JSR     R5,     L_6844                  ; 67EA   0004 0168 0044

        PULR    R4                              ; 67ED   02B4
        PULR    R3                              ; 67EE   02B3
        PULR    R2                              ; 67EF   02B2
        PULR    R1                              ; 67F0   02B1
        MOVR    R2,     R0                      ; 67F1   0090

        JSR     R5,     L_6802                  ; 67F2   0004 0168 0002

        PSHR    R4                              ; 67F5   0274

        JSR     R5,     L_6648                  ; 67F6   0004 0164 0248

        PULR    R4                              ; 67F9   02B4
        MOVR    R3,     R0                      ; 67FA   0098

        JSR     R5,     L_6802                  ; 67FB   0004 0168 0002

        DECR    R1                              ; 67FE   0011
        BNEQ    L_67E3                          ; 67FF   022C 001D
        PULR    R7                              ; 6801   02B7

L_6802:
        PSHR    R5                              ; 6802   0275
L_6803:
        SDBD                                    ; 6803   0001
        MVII    #$07D0, R5                      ; 6804   02BD 00D0 0007
L_6807:
        DECR    R5                              ; 6807   0015
        BNEQ    L_6807                          ; 6808   022C 0002

        DECR    R0                              ; 680A   0010
        BNEQ    L_6803                          ; 680B   022C 0009
        PULR    R7                              ; 680D   02B7

L_680E:
        MVI@    R5,     R0                      ; 680E   02A8
        MVI@    R5,     R2                      ; 680F   02AA
        SDBD                                    ; 6810   0001
        MVI@    R5,     R3                      ; 6811   02AB
        SDBD                                    ; 6812   0001
        MVI@    R5,     R4                      ; 6813   02AC
        PSHR    R5                              ; 6814   0275
        MOVR    R0,     R5                      ; 6815   0085
L_6816:
        CLRR    R1                              ; 6816   01C9
L_6817:
        MVI@    R4,     R0                      ; 6817   02A0
        PSHR    R4                              ; 6818   0274
        MOVR    R0,     R4                      ; 6819   0084
        ANDI    #$000F, R4                      ; 681A   03BC 000F
        CMPI    #$000F, R4                      ; 681C   037C 000F
        BEQ     L_6830                          ; 681E   0204 0010

        SAR     R0,     1                       ; 6820   0068
        ANDI    #$01F8, R0                      ; 6821   03B8 01F8
        ADDR    R4,     R4                      ; 6823   00E4
        ADDR    R3,     R4                      ; 6824   00DC
        SDBD                                    ; 6825   0001
        XOR@    R4,     R0                      ; 6826   03E0
L_6827:
        MVO@    R0,     R5                      ; 6827   0268
        DECR    R1                              ; 6828   0011
        BPL     L_6827                          ; 6829   0223 0003

        PULR    R4                              ; 682B   02B4
        CMPR    R2,     R5                      ; 682C   0155
        BNEQ    L_6816                          ; 682D   022C 0018
L_682F:
        PULR    R7                              ; 682F   02B7

L_6830:
        SLR     R0,     2                       ; 6830   0064
        SLR     R0,     2                       ; 6831   0064
        MOVR    R0,     R1                      ; 6832   0081
        PULR    R4                              ; 6833   02B4
        B       L_6817                          ; 6834   0220 001E

L_6836:
        PSHR    R5                              ; 6836   0275
L_6837:
        MVI@    R4,     R1                      ; 6837   02A1
        TSTR    R1                              ; 6838   0089
        BEQ     L_682F                          ; 6839   0224 000B

        SDBD                                    ; 683B   0001
        MVI@    R4,     R0                      ; 683C   02A0
        MVO@    R0,     R1                      ; 683D   0248
        B       L_6837                          ; 683E   0220 0008

        DECLE   $0000,  $0078,  $0001           ; 6840   0000 0078 0001

        MVI@    R5,     R4                      ; 6843   02AC
L_6844:
        CLRR    R2                              ; 6844   01D2
        B       L_684E                          ; 6845   0200 0007

L_6847:
        SDBD                                    ; 6847   0001
        MVI@    R5,     R4                      ; 6848   02AC
        SDBD                                    ; 6849   0001
        ADDI    #$6840, R2                      ; 684A   02FA 0040 0068
        MVI@    R2,     R2                      ; 684D   0292
L_684E:
        PSHR    R5                              ; 684E   0275
L_684F:
        MVI@    R4,     R3                      ; 684F   02A3
        MOVR    R3,     R0                      ; 6850   0098
        ANDI    #$0007, R3                      ; 6851   03BB 0007
        ANDI    #$0008, R0                      ; 6853   03B8 0008
        BEQ     L_685B                          ; 6855   0204 0004

        SDBD                                    ; 6857   0001
        XORI    #$1000, R3                      ; 6858   03FB 0000 0010
L_685B:
        MVI@    R4,     R5                      ; 685B   02A5
        ADDR    R2,     R5                      ; 685C   00D5
L_685D:
        MVI@    R4,     R0                      ; 685D   02A0
        SUBI    #$0020, R0                      ; 685E   0338 0020
        BMI     L_6868                          ; 6860   020B 0006

        SLL     R0,     2                       ; 6862   004C
        SLL     R0,     1                       ; 6863   0048
        XORR    R3,     R0                      ; 6864   01D8
        MVO@    R0,     R5                      ; 6865   0268
        B       L_685D                          ; 6866   0220 000A

L_6868:
        ADDI    #$0020, R0                      ; 6868   02F8 0020
        BEQ     L_685B                          ; 686A   0224 0010

        DECR    R0                              ; 686C   0010
        BEQ     L_684F                          ; 686D   0224 001F
        PULR    R7                              ; 686F   02B7

L_6870:
        SDBD                                    ; 6870   0001
        MVI@    R5,     R2                      ; 6871   02AA
        PSHR    R5                              ; 6872   0275
L_6873:
        PSHR    R1                              ; 6873   0271
        PSHR    R4                              ; 6874   0274
        ADD@    R2,     R1                      ; 6875   02D1
        INCR    R2                              ; 6876   000A
        ADD@    R2,     R4                      ; 6877   02D4
        INCR    R2                              ; 6878   000A
        MVI@    R1,     R0                      ; 6879   0288
        MVII    #$0002, R1                      ; 687A   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 687C   0004 0118 00C5

        PULR    R4                              ; 687F   02B4
        PULR    R1                              ; 6880   02B1
        MVI@    R2,     R0                      ; 6881   0290
        CMPI    #$00FF, R0                      ; 6882   0378 00FF
        BNEQ    L_6873                          ; 6884   022C 0012
        PULR    R7                              ; 6886   02B7

L_6887:
        PSHR    R5                              ; 6887   0275
        MVI     G_031E, R0                      ; 6888   0280 031E
        MVI     G_0320, R1                      ; 688A   0281 0320
        MVI     G_0359, R2                      ; 688C   0282 0359
        TSTR    R0                              ; 688E   0080
        BEQ     L_68E5                          ; 688F   0204 0054

        SDBD                                    ; 6891   0001
        CMPI    #$98B6, R0                      ; 6892   0378 00B6 0098
        BEQ     L_68B2                          ; 6895   0204 001B

        SDBD                                    ; 6897   0001
        CMPI    #$98C4, R0                      ; 6898   0378 00C4 0098
        BEQ     L_68B7                          ; 689B   0204 001A

        SDBD                                    ; 689D   0001
        CMPI    #$98D8, R0                      ; 689E   0378 00D8 0098
        BEQ     L_68C3                          ; 68A1   0204 0020

        SDBD                                    ; 68A3   0001
        CMPI    #$98FE, R0                      ; 68A4   0378 00FE 0098
        BEQ     L_68C8                          ; 68A7   0204 001F

        SDBD                                    ; 68A9   0001
        CMPI    #$9980, R0                      ; 68AA   0378 0080 0099
        BEQ     L_68D0                          ; 68AD   0204 0021

        CLRR    R0                              ; 68AF   01C0
        B       L_68E5                          ; 68B0   0200 0033

L_68B2:
        ADDI    #$0100, R1                      ; 68B2   02F9 0100
        CLRR    R2                              ; 68B4   01D2
        B       L_68D3                          ; 68B5   0200 001C

L_68B7:
        MVI     G_0321, R3                      ; 68B7   0283 0321
        SWAP    R3,     1                       ; 68B9   0043
        ANDI    #$00FF, R3                      ; 68BA   03BB 00FF
        BNEQ    L_68D0                          ; 68BC   020C 0012

        MVII    #$0040, R1                      ; 68BE   02B9 0040
        SWAP    R1,     1                       ; 68C0   0041
        B       L_68D3                          ; 68C1   0200 0010

L_68C3:
        CLRR    R0                              ; 68C3   01C0
        MVO     R0,     G_0359                  ; 68C4   0240 0359
        B       L_68DD                          ; 68C6   0200 0015

L_68C8:
        MVI     G_017B, R3                      ; 68C8   0283 017B
        ANDI    #$0008, R3                      ; 68CA   03BB 0008
        BNEQ    L_68DD                          ; 68CC   020C 000F
        B       L_68B2                          ; 68CE   0220 001D

L_68D0:
        ADDI    #$0300, R1                      ; 68D0   02F9 0300
        CLRR    R2                              ; 68D2   01D2
L_68D3:
        MVO     R1,     G_0358                  ; 68D3   0241 0358
        MVO     R2,     G_0359                  ; 68D5   0242 0359
        SDBD                                    ; 68D7   0001
        MVII    #$1080, R0                      ; 68D8   02B8 0080 0010
        MVO     R0,     G_0355                  ; 68DB   0240 0355
L_68DD:
        MVI     G_031F, R0                      ; 68DD   0280 031F
        MVO     R0,     G_0357                  ; 68DF   0240 0357
        SDBD                                    ; 68E1   0001
        MVII    #$98BD, R0                      ; 68E2   02B8 00BD 0098
L_68E5:
        MVO     R0,     G_0356                  ; 68E5   0240 0356
        MVI     G_0358, R0                      ; 68E7   0280 0358
        SDBD                                    ; 68E9   0001
        MVII    #$5800, R1                      ; 68EA   02B9 0000 0058
        CMPR    R1,     R0                      ; 68ED   0148
        BLE     L_68F2                          ; 68EE   0206 0002

        MVO     R1,     G_0358                  ; 68F0   0241 0358
L_68F2:
        PULR    R7                              ; 68F2   02B7

L_68F3:
        PSHR    R5                              ; 68F3   0275
        MVI     G_0358, R0                      ; 68F4   0280 0358
        SWAP    R0,     1                       ; 68F6   0040
        ANDI    #$00FF, R0                      ; 68F7   03B8 00FF
        MVII    #$0040, R1                      ; 68F9   02B9 0040
        SUBR    R0,     R1                      ; 68FB   0101
        SLL     R1,     2                       ; 68FC   004D
        ADDR    R1,     R1                      ; 68FD   00C9
        SLL     R1,     2                       ; 68FE   004D
        MVI     G_0323, R2                      ; 68FF   0282 0323

        JSR     R5,     X_DIV                   ; 6901   0004 011C 01FB

        ANDI    #$00FF, R0                      ; 6904   03B8 00FF
        MVO     R0,     G_0359                  ; 6906   0240 0359
        PULR    R7                              ; 6908   02B7

        DECLE   $0000,  $0000,  $00B6,  $0098   ; 6909   0000 0000 00B6 0098
        DECLE   $00C4,  $0098,  $00D8,  $0098   ; 690D   00C4 0098 00D8 0098
        DECLE   $00FE,  $0098,  $0080,  $0099   ; 6911   00FE 0098 0080 0099
        DECLE   $0000,  $0000,  $0040,  $0069   ; 6915   0000 0000 0040 0069
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6919   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 691D   0000 0000
L_691F:
        PSHR    R5                              ; 691F   0275

L_6920:
        JSR     R5,     .EXEC.7B3               ; 6920   0004 0114 03B3
        JSR     R5,     L_5E9D                  ; 6923   0004 015C 029D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6926   0000 0000 0000 0000

        JSR     R5,     L_6648                  ; 692A   0004 0164 0248
        DECLE   $0004,  $0168,  $0042           ; 692D   0004 0168 0042

        MOVR    R0,     R7                      ; 6930   0087

        SAR     R1,     1                       ; 6931   0069
        CLRR    R0                              ; 6932   01C0
        MVO     R0,     G_0183                  ; 6933   0240 0183
        MVII    #$0004, R0                      ; 6935   02B8 0004
        MVO     R0,     G_0172                  ; 6937   0240 0172
        SDBD                                    ; 6939   0001
        MVII    #$6915, R0                      ; 693A   02B8 0015 0069
        MVO     R0,     G_035D                  ; 693D   0240 035D
        PULR    R7                              ; 693F   02B7

        PSHR    R5                              ; 6940   0275
        MVI     G_0183, R5                      ; 6941   0285 0183
        TSTR    R5                              ; 6943   00AD
        BNEQ    L_696C                          ; 6944   020C 0026

        DECR    R0                              ; 6946   0010
        BEQ     L_6950                          ; 6947   0204 0007

        DECR    R0                              ; 6949   0010
        BEQ     L_6957                          ; 694A   0204 000B

        DECR    R0                              ; 694C   0010
        BEQ     L_696C                          ; 694D   0204 001D
        PULR    R7                              ; 694F   02B7

L_6950:
        JSR     R5,     L_5E5D                  ; 6950   0004 015C 025D
        JSR     R5,     L_603D                  ; 6953   0004 0160 003D

        PULR    R7                              ; 6956   02B7

L_6957:
        JSR     R5,     L_5E5D                  ; 6957   0004 015C 025D
        DECLE   $0004                           ; 695A   0004

        ANDR    R4,     R0                      ; 695B   01A0
        SUBR    R5,     R2                      ; 695C   012A

        JSR     R5,     L_5058                  ; 695D   0004 0150 0058
        JSR     R5,     L_62F0                  ; 6960   0004 0160 02F0

        PULR    R7                              ; 6963   02B7

        ADDR    R3,     R4                      ; 6964   00DC
        SAR     R1,     1                       ; 6965   0069
        NEGR    R1                              ; 6966   0021
        SAR     R2,     1                       ; 6967   006A
        MOVR    R5,     R0                      ; 6968   00A8
        SAR     R2,     1                       ; 6969   006A
        ADCR    R1                              ; 696A   0029
        SAR     R3,     1                       ; 696B   006B

L_696C:
        JSR     R5,     L_6648                  ; 696C   0004 0164 0248
        JSR     R5,     L_5E5D                  ; 696F   0004 015C 025D
        DECLE   $0285,  $0183,  $037D,  $0004   ; 6972   0285 0183 037D 0004
        DECLE   $0224,  $004A                   ; 6976   0224 004A

        MOVR    R5,     R0                      ; 6978   00A8
        INCR    R0                              ; 6979   0008
        MVO     R0,     G_0183                  ; 697A   0240 0183
        ADDR    R5,     R5                      ; 697C   00ED
        SDBD                                    ; 697D   0001
        ADDI    #$6964, R5                      ; 697E   02FD 0064 0069
        SDBD                                    ; 6981   0001
        MVI@    R5,     R4                      ; 6982   02AC

        JSR     R5,     L_6844                  ; 6983   0004 0168 0044

        PULR    R7                              ; 6986   02B7

        DECLE   $0007,  $0215,  $0053,  $0020   ; 6987   0007 0215 0053 0020
        DECLE   $004C,  $0020,  $0041,  $0020   ; 698B   004C 0020 0041 0020
        DECLE   $004D,  $0020,  $0020,  $0020   ; 698F   004D 0020 0020 0020
        DECLE   $0020,  $0044,  $0020,  $0055   ; 6993   0020 0044 0020 0055
        DECLE   $0020,  $004E,  $0020,  $004B   ; 6997   0020 004E 0020 004B
        DECLE   $0001,  $0005,  $0243,  $0073   ; 699B   0001 0005 0243 0073
        DECLE   $0065,  $006C,  $0065,  $0063   ; 699F   0065 006C 0065 0063
        DECLE   $0074,  $0000,  $0265,  $0031   ; 69A3   0074 0000 0265 0031
        DECLE   $0000,  $0279,  $0032,  $0000   ; 69A7   0000 0279 0032 0000
        DECLE   $028D,  $0033,  $0001,  $0003   ; 69AB   028D 0033 0001 0003
        DECLE   $0267,  $0064,  $0072,  $0061   ; 69AF   0267 0064 0072 0061
        DECLE   $0066,  $0074,  $0020,  $0070   ; 69B3   0066 0074 0020 0070
        DECLE   $006C,  $0061,  $0079,  $0065   ; 69B7   006C 0061 0079 0065
        DECLE   $0072,  $0073,  $0000,  $027B   ; 69BB   0072 0073 0000 027B
        DECLE   $0070,  $006C,  $0061,  $0079   ; 69BF   0070 006C 0061 0079
        DECLE   $0020,  $0062,  $0061,  $006C   ; 69C3   0020 0062 0061 006C
        DECLE   $006C,  $0000,  $028F,  $0064   ; 69C7   006C 0000 028F 0064
        DECLE   $0065,  $0073,  $0063,  $0072   ; 69CB   0065 0073 0063 0072
        DECLE   $0069,  $0062,  $0065,  $0020   ; 69CF   0069 0062 0065 0020
        DECLE   $0063,  $006F,  $006E,  $0074   ; 69D3   0063 006F 006E 0074
        DECLE   $0072,  $006F,  $006C,  $0073   ; 69D7   0072 006F 006C 0073
        DECLE   $0002,  $0007,  $0201,  $0044   ; 69DB   0002 0007 0201 0044
        DECLE   $0072,  $0061,  $0066,  $0074   ; 69DF   0072 0061 0066 0074
        DECLE   $0069,  $006E,  $0067,  $003A   ; 69E3   0069 006E 0067 003A
        DECLE   $0001,  $0003,  $022A,  $0050   ; 69E7   0001 0003 022A 0050
        DECLE   $0075,  $0072,  $0063,  $0068   ; 69EB   0075 0072 0063 0068
        DECLE   $0061,  $0073,  $0065,  $0020   ; 69EF   0061 0073 0065 0020
        DECLE   $0070,  $006C,  $0061,  $0079   ; 69F3   0070 006C 0061 0079
        DECLE   $0065,  $0072,  $0000,  $0252   ; 69F7   0065 0072 0000 0252
        DECLE   $004E,  $006F,  $0074,  $0020   ; 69FB   004E 006F 0074 0020
        DECLE   $0069,  $006E,  $0074,  $0065   ; 69FF   0069 006E 0074 0065
        DECLE   $0072,  $0065,  $0073,  $0074   ; 6A03   0072 0065 0073 0074
        DECLE   $0065,  $0064,  $0001,  $0005   ; 6A07   0065 0064 0001 0005
        DECLE   $0240,  $0045,  $006E,  $0074   ; 6A0B   0240 0045 006E 0074
        DECLE   $0065,  $0072,  $0020,  $006B   ; 6A0F   0065 0072 0020 006B
        DECLE   $0065,  $0079,  $0000,  $0268   ; 6A13   0065 0079 0000 0268
        DECLE   $0043,  $006C,  $0065,  $0061   ; 6A17   0043 006C 0065 0061
        DECLE   $0072,  $0020,  $006B,  $0065   ; 6A1B   0072 0020 006B 0065
        DECLE   $0079,  $0002,  $0007,  $0201   ; 6A1F   0079 0002 0007 0201
        DECLE   $004D,  $0061,  $006E,  $0061   ; 6A23   004D 0061 006E 0061
        DECLE   $0067,  $0069,  $006E,  $0067   ; 6A27   0067 0069 006E 0067
        DECLE   $003A,  $0001,  $0003,  $022A   ; 6A2B   003A 0001 0003 022A
        DECLE   $0053,  $0065,  $006C,  $0065   ; 6A2F   0053 0065 006C 0065
        DECLE   $0063,  $0074,  $0020,  $0070   ; 6A33   0063 0074 0020 0070
        DECLE   $006C,  $0061,  $0079,  $0065   ; 6A37   006C 0061 0079 0065
        DECLE   $0072,  $0000,  $0252,  $0053   ; 6A3B   0072 0000 0252 0053
        DECLE   $0065,  $0065,  $0020,  $0070   ; 6A3F   0065 0065 0020 0070
        DECLE   $006C,  $0061,  $0079,  $0065   ; 6A43   006C 0061 0079 0065
        DECLE   $0072,  $0020,  $0073,  $0074   ; 6A47   0072 0020 0073 0074
        DECLE   $0061,  $0074,  $0073,  $0000   ; 6A4B   0061 0074 0073 0000
        DECLE   $027A                           ; 6A4F   027A

        RLC     R3,     1                       ; 6A50   0053
        RRC     R3,     2                       ; 6A51   0077
        SLR     R1,     1                       ; 6A52   0061
        RRC     R0,     1                       ; 6A53   0070
        NEGR    R0                              ; 6A54   0020
        RRC     R0,     1                       ; 6A55   0070
        SAR     R0,     2                       ; 6A56   006C
        SLR     R1,     1                       ; 6A57   0061
        SARC    R1,     1                       ; 6A58   0079
        SLR     R1,     2                       ; 6A59   0065
        RRC     R2,     1                       ; 6A5A   0072
        NEGR    R0                              ; 6A5B   0020
        SAR     R1,     1                       ; 6A5C   0069
        SAR     R2,     2                       ; 6A5D   006E
        ADCR    R7                              ; 6A5E   002F

        SAR     R3,     2                       ; 6A5F   006F
L_6A60:
        RRC     R1,     2                       ; 6A60   0075
        DECLE   $0074,  $0000,  $02A2,  $0044   ; 6A61   0074 0000 02A2 0044
        DECLE   $006F,  $006E,  $0065,  $0020   ; 6A65   006F 006E 0065 0020
        DECLE   $0028,  $0067,  $006F,  $0020   ; 6A69   0028 0067 006F 0020
        DECLE   $0074,  $006F,  $0020,  $0067   ; 6A6D   0074 006F 0020 0067
        DECLE   $0061,  $006D,  $0065,  $0029   ; 6A71   0061 006D 0065 0029
        DECLE   $0001,  $0005,  $0240,  $0057   ; 6A75   0001 0005 0240 0057
        DECLE   $0068,  $0065,  $0065,  $006C   ; 6A79   0068 0065 0065 006C
        DECLE   $002C,  $0020,  $0031,  $002D   ; 6A7D   002C 0020 0031 002D
        DECLE   $0035,  $0020,  $006B,  $0065   ; 6A81   0035 0020 006B 0065
        DECLE   $0079,  $0073,  $0000,  $0268   ; 6A85   0079 0073 0000 0268
        DECLE   $0043,  $006C,  $0065,  $0061   ; 6A89   0043 006C 0065 0061
        DECLE   $0072,  $0020,  $006B,  $0065   ; 6A8D   0072 0020 006B 0065
        DECLE   $0079,  $0000,  $0290,  $005A   ; 6A91   0079 0000 0290 005A
        DECLE   $0065,  $0072,  $006F,  $0020   ; 6A95   0065 0072 006F 0020
        DECLE   $006B,  $0065,  $0079,  $0000   ; 6A99   006B 0065 0079 0000
        DECLE   $02B8,  $0045,  $006E,  $0074   ; 6A9D   02B8 0045 006E 0074
        DECLE   $0065,  $0072,  $0020,  $006B   ; 6AA1   0065 0072 0020 006B
        DECLE   $0065,  $0079,  $0002,  $0007   ; 6AA5   0065 0079 0002 0007
        DECLE   $0201,  $004F,  $0066,  $0066   ; 6AA9   0201 004F 0066 0066
        DECLE   $0065,  $006E,  $0073,  $0065   ; 6AAD   0065 006E 0073 0065
        DECLE   $003A,  $0001,  $0003,  $022A   ; 6AB1   003A 0001 0003 022A
        DECLE   $0052,  $0075,  $006E,  $0000   ; 6AB5   0052 0075 006E 0000
        DECLE   $0252,  $0050,  $0061,  $0073   ; 6AB9   0252 0050 0061 0073
        DECLE   $0073,  $0020,  $0074,  $006F   ; 6ABD   0073 0020 0074 006F
        DECLE   $0020,  $007A,  $006F,  $006E   ; 6AC1   0020 007A 006F 006E
        DECLE   $0065,  $0000,  $027A,  $004A   ; 6AC5   0065 0000 027A 004A
        DECLE   $0075,  $006D,  $0070,  $0020   ; 6AC9   0075 006D 0070 0020
        DECLE   $0073,  $0068,  $006F,  $0074   ; 6ACD   0073 0068 006F 0074
        DECLE   $0000,  $02A2,  $0053,  $0065   ; 6AD1   0000 02A2 0053 0065
        DECLE   $0074,  $0020,  $0073,  $0068   ; 6AD5   0074 0020 0073 0068
        DECLE   $006F,  $0074,  $0000           ; 6AD9   006F 0074 0000

        ADD@    R1,     R2                      ; 6ADC   02CA
        RLC     R0,     2                       ; 6ADD   0054
        SAR     R1,     1                       ; 6ADE   0069
        SAR     R1,     2                       ; 6ADF   006D
        SLR     R1,     2                       ; 6AE0   0065
        SAR     R3,     2                       ; 6AE1   006F
        RRC     R1,     2                       ; 6AE2   0075
        RRC     R0,     2                       ; 6AE3   0074
        ADCR    R7                              ; 6AE4   002F

        RLC     R3,     1                       ; 6AE5   0053
L_6AE6:
        RRC     R1,     2                       ; 6AE6   0075
        DECLE   $0062,  $0073,  $0001,  $0005   ; 6AE7   0062 0073 0001 0005
        DECLE   $0240,  $0057,  $0068,  $0065   ; 6AEB   0240 0057 0068 0065
        DECLE   $0065,  $006C,  $0000,  $0268   ; 6AEF   0065 006C 0000 0268
        DECLE   $0031,  $002D,  $0039,  $0020   ; 6AF3   0031 002D 0039 0020
        DECLE   $006B,  $0065,  $0079,  $0073   ; 6AF7   006B 0065 0079 0073
        DECLE   $0000,  $0290,  $0055,  $0070   ; 6AFB   0000 0290 0055 0070
        DECLE   $0070,  $0065,  $0072,  $0020   ; 6AFF   0070 0065 0072 0020
        DECLE   $0073,  $0069,  $0064,  $0065   ; 6B03   0073 0069 0064 0065
        DECLE   $0020,  $006B,  $0065,  $0079   ; 6B07   0020 006B 0065 0079
        DECLE   $0073,  $0000,  $02B8,  $004C   ; 6B0B   0073 0000 02B8 004C
        DECLE   $006F,  $0077,  $0065,  $0072   ; 6B0F   006F 0077 0065 0072
        DECLE   $0020,  $0073,  $0069,  $0064   ; 6B13   0020 0073 0069 0064
        DECLE   $0065,  $0020,  $006B,  $0065   ; 6B17   0065 0020 006B 0065
        DECLE   $0079,  $0073,  $0000,  $02E0   ; 6B1B   0079 0073 0000 02E0
        DECLE   $0045,  $006E,  $0074,  $0065   ; 6B1F   0045 006E 0074 0065
        DECLE   $0072,  $0020,  $006B,  $0065   ; 6B23   0072 0020 006B 0065
        DECLE   $0079,  $0002,  $0007,  $0201   ; 6B27   0079 0002 0007 0201
        DECLE   $0044,  $0065,  $0066,  $0065   ; 6B2B   0044 0065 0066 0065
        DECLE   $006E,  $0073,  $0065,  $003A   ; 6B2F   006E 0073 0065 003A
        DECLE   $0001,  $0003,  $022A,  $0052   ; 6B33   0001 0003 022A 0052
        DECLE   $0075,  $006E,  $0000,  $0252   ; 6B37   0075 006E 0000 0252
        DECLE   $0053,  $0077,  $0069,  $0074   ; 6B3B   0053 0077 0069 0074
        DECLE   $0063,  $0068,  $0020,  $0070   ; 6B3F   0063 0068 0020 0070
        DECLE   $006C,  $0061,  $0079,  $0065   ; 6B43   006C 0061 0079 0065
        DECLE   $0072,  $0073,  $0000,  $027A   ; 6B47   0072 0073 0000 027A
        DECLE   $0042,  $006C,  $006F,  $0063   ; 6B4B   0042 006C 006F 0063
        DECLE   $006B,  $0020,  $0073,  $0068   ; 6B4F   006B 0020 0073 0068
        DECLE   $006F,  $0074,  $0001,  $0005   ; 6B53   006F 0074 0001 0005
        DECLE   $0240,  $0057,  $0068,  $0065   ; 6B57   0240 0057 0068 0065
        DECLE   $0065,  $006C,  $0000,  $0268   ; 6B5B   0065 006C 0000 0268
        DECLE   $0031,  $002D,  $0039,  $0020   ; 6B5F   0031 002D 0039 0020
        DECLE   $006B,  $0065,  $0079,  $0073   ; 6B63   006B 0065 0079 0073
        DECLE   $0000                           ; 6B67   0000

        MVI@    R2,     R0                      ; 6B68   0290
        RLC     R3,     1                       ; 6B69   0053
        SAR     R1,     1                       ; 6B6A   0069
        SLR     R0,     2                       ; 6B6B   0064
        SLR     R1,     2                       ; 6B6C   0065
        NEGR    R0                              ; 6B6D   0020
        SAR     R3,     1                       ; 6B6E   006B
        SLR     R1,     2                       ; 6B6F   0065
        SARC    R1,     1                       ; 6B70   0079
        RRC     R3,     1                       ; 6B71   0073
        EIS                                     ; 6B72   0002
L_6B73:
        PSHR    R5                              ; 6B73   0275

        JSR     R5,     L_551E                  ; 6B74   0004 0154 011E

        MOVR    R1,     R4                      ; 6B77   008C
        ADDI    #$0002, R4                      ; 6B78   02FC 0002
        MVI     G_017F, R0                      ; 6B7A   0280 017F
        MVI     G_0180, R1                      ; 6B7C   0281 0180

        JSR     R5,     L_6BF4                  ; 6B7E   0004 0168 03F4
        DECLE   $02BB,  $0038,  $0004,  $01AC   ; 6B81   02BB 0038 0004 01AC
        DECLE   $03AB,  $0093,  $0280,  $017B   ; 6B85   03AB 0093 0280 017B
        DECLE   $03B8,  $0001,  $03F8,  $0001   ; 6B89   03B8 0001 03F8 0001
        DECLE   $0008,  $0004                   ; 6B8D   0008 0004

        ANDR    R4,     R0                      ; 6B8F   01A0
        XORR    R5,     R4                      ; 6B90   01EC
        MOVR    R5,     R4                      ; 6B91   00AC
        MVI     G_0182, R0                      ; 6B92   0280 0182
        CMPI    #$0003, R0                      ; 6B94   0378 0003
        BNEQ    L_6B9C                          ; 6B96   020C 0004

        MVII    #$0001, R1                      ; 6B98   02B9 0001
        B       L_6BA3                          ; 6B9A   0200 0007

L_6B9C:
        MVI     G_017F, R0                      ; 6B9C   0280 017F
        MVI     G_0180, R1                      ; 6B9E   0281 0180

        JSR     R5,     L_6BFF                  ; 6BA0   0004 0168 03FF

L_6BA3:
        MVO     R1,     G_01E7                  ; 6BA3   0241 01E7
        MOVR    R4,     R0                      ; 6BA5   00A0

        JSR     R5,     L_6C26                  ; 6BA6   0004 016C 0026

        MOVR    R4,     R0                      ; 6BA9   00A0

        JSR     R5,     L_6C40                  ; 6BAA   0004 016C 0040
        JSR     R5,     L_6C5C                  ; 6BAD   0004 016C 005C

        MVI     G_01E7, R2                      ; 6BB0   0282 01E7
        CMPI    #$0003, R2                      ; 6BB2   037A 0003
        BNEQ    L_6BBE                          ; 6BB4   020C 0008

        MVI     G_0182, R2                      ; 6BB6   0282 0182
        CMPI    #$0002, R2                      ; 6BB8   037A 0002
        BNEQ    L_6BBE                          ; 6BBA   020C 0002

        ADDI    #$0005, R0                      ; 6BBC   02F8 0005
L_6BBE:
        MOVR    R0,     R1                      ; 6BBE   0081
        MVII    #$0064, R0                      ; 6BBF   02B8 0064

        JSR     R5,     X_RAND2                 ; 6BC1   0004 0114 029E

        CMPR    R1,     R0                      ; 6BC4   0148
        BLE     L_6BCA                          ; 6BC5   0206 0003

        CLRR    R0                              ; 6BC7   01C0
        MVO     R0,     G_01E7                  ; 6BC8   0240 01E7
L_6BCA:
        PULR    R7                              ; 6BCA   02B7

        DECLE   $002F,  $0033,  $0035,  $0037   ; 6BCB   002F 0033 0035 0037
        DECLE   $0039,  $003A,  $003B,  $003C   ; 6BCF   0039 003A 003B 003C
        DECLE   $003D,  $003E,  $003F,  $003F   ; 6BD3   003D 003E 003F 003F
        DECLE   $0040,  $0040,  $0041,  $0041   ; 6BD7   0040 0040 0041 0041
        DECLE   $0041,  $0042,  $0042,  $0042   ; 6BDB   0041 0042 0042 0042
        DECLE   $0042,  $0042,  $0041,  $0041   ; 6BDF   0042 0042 0041 0041
        DECLE   $0041,  $0040,  $0040,  $003F   ; 6BE3   0041 0040 0040 003F
        DECLE   $003F,  $003E,  $003E,  $003D   ; 6BE7   003F 003E 003E 003D
        DECLE   $003C,  $003B,  $003A,  $0039   ; 6BEB   003C 003B 003A 0039
        DECLE   $0037,  $0035                   ; 6BEF   0037 0035

        GSWD    R3                              ; 6BF1   0033
        GSWD    R0                              ; 6BF2   0030
        ADCR    R5                              ; 6BF3   002D
L_6BF4:
        PSHR    R5                              ; 6BF4   0275

        JSR     R5,     L_5B34                  ; 6BF5   0004 0158 0334

        ADDI    #$0002, R2                      ; 6BF8   02FA 0002
        ADDR    R7,     R2                      ; 6BFA   00FA
        MVI@    R2,     R2                      ; 6BFB   0292
        PULR    R7                              ; 6BFC   02B7

        COMR    R2                              ; 6BFD   001A
        MOVR    R1,     R6                      ; 6BFE   008E
L_6BFF:
        PSHR    R5                              ; 6BFF   0275
        CMPI    #$0024, R1                      ; 6C00   0379 0024
        BLT     L_6C20                          ; 6C02   0205 001C

        CMPI    #$004C, R1                      ; 6C04   0379 004C
        BGT     L_6C20                          ; 6C06   020E 0018

        SUBI    #$0024, R1                      ; 6C08   0339 0024
        SDBD                                    ; 6C0A   0001
        ADDI    #$6BCB, R1                      ; 6C0B   02F9 00CB 006B

        JSR     R5,     L_5B34                  ; 6C0E   0004 0158 0334

        TSTR    R2                              ; 6C11   0092
        BNEQ    L_6C19                          ; 6C12   020C 0005

        CMP@    R1,     R0                      ; 6C14   0348
        BGE     L_6C20                          ; 6C15   020D 0009
        B       L_6C23                          ; 6C17   0200 000A

L_6C19:
        MVI@    R1,     R2                      ; 6C19   028A
        NEGR    R2                              ; 6C1A   0022
        ADDI    #$00A8, R2                      ; 6C1B   02FA 00A8
        CMPR    R2,     R0                      ; 6C1D   0150
        BGE     L_6C23                          ; 6C1E   020D 0003

L_6C20:
        MVII    #$0003, R1                      ; 6C20   02B9 0003
        PULR    R7                              ; 6C22   02B7

L_6C23:
        MVII    #$0002, R1                      ; 6C23   02B9 0002
        PULR    R7                              ; 6C25   02B7

L_6C26:
        PSHR    R5                              ; 6C26   0275
        DECLE   $0379,  $0001,  $020C,  $0006   ; 6C27   0379 0001 020C 0006
        DECLE   $0004,  $01A0,  $0238,  $0004   ; 6C2B   0004 01A0 0238 0004
        DECLE   $0200,  $000E,  $0379,  $0002   ; 6C2F   0200 000E 0379 0002
        DECLE   $020C,  $0006,  $0004,  $01A0   ; 6C33   020C 0006 0004 01A0
        DECLE   $0238,  $0000,  $0200,  $0004   ; 6C37   0238 0000 0200 0004
        DECLE   $0004,  $01A0,  $0238           ; 6C3B   0004 01A0 0238

        EIS                                     ; 6C3E   0002
        PULR    R7                              ; 6C3F   02B7

L_6C40:
        PSHR    R5                              ; 6C40   0275
        DECLE   $0271,  $0379,  $0001,  $0204   ; 6C41   0271 0379 0001 0204
        DECLE   $0010,  $0379,  $0002,  $0204   ; 6C45   0010 0379 0002 0204
        DECLE   $0006,  $0004,  $01A0,  $0288   ; 6C49   0006 0004 01A0 0288
        DECLE   $0004,  $0200,  $000A,  $0004   ; 6C4D   0004 0200 000A 0004

        ANDR    R4,     R0                      ; 6C51   01A0
        MVI@    R1,     R0                      ; 6C52   0288
        DIS                                     ; 6C53   0003
        B       L_6C5A                          ; 6C54   0200 0004

        DECLE   $0004                           ; 6C56   0004

        ANDR    R4,     R0                      ; 6C57   01A0
        MVI@    R1,     R0                      ; 6C58   0288
        INCR    R1                              ; 6C59   0009
L_6C5A:
        PULR    R1                              ; 6C5A   02B1
        PULR    R7                              ; 6C5B   02B7

L_6C5C:
        CMPI    #$0002, R1                      ; 6C5C   0379 0002
        BLT     L_6C68                          ; 6C5E   0205 0008
        BEQ     L_6C85                          ; 6C60   0204 0023

        CMPI    #$001E, R3                      ; 6C62   037B 001E
        BGT     L_6C69                          ; 6C64   020E 0003

        ADDI    #$0005, R0                      ; 6C66   02F8 0005
L_6C68:
        MOVR    R5,     R7                      ; 6C68   00AF

L_6C69:
        CMPI    #$0029, R3                      ; 6C69   037B 0029
        BGT     L_6C70                          ; 6C6B   020E 0003

        ADDI    #$0000, R0                      ; 6C6D   02F8 0000
        MOVR    R5,     R7                      ; 6C6F   00AF

L_6C70:
        CMPI    #$003C, R3                      ; 6C70   037B 003C
        BGT     L_6C79                          ; 6C72   020E 0005

        SDBD                                    ; 6C74   0001
        ADDI    #$FFF6, R0                      ; 6C75   02F8 00F6 00FF
        MOVR    R5,     R7                      ; 6C78   00AF

L_6C79:
        CMPI    #$005A, R3                      ; 6C79   037B 005A
        BGT     L_6C82                          ; 6C7B   020E 0005

        SDBD                                    ; 6C7D   0001
        ADDI    #$FFEC, R0                      ; 6C7E   02F8 00EC 00FF
        MOVR    R5,     R7                      ; 6C81   00AF

L_6C82:
        MVII    #$0001, R0                      ; 6C82   02B8 0001
        MOVR    R5,     R7                      ; 6C84   00AF

L_6C85:
        CMPI    #$0006, R3                      ; 6C85   037B 0006
        BGT     L_6C8C                          ; 6C87   020E 0003

        ADDI    #$0011, R0                      ; 6C89   02F8 0011
        MOVR    R5,     R7                      ; 6C8B   00AF

L_6C8C:
        CMPI    #$000C, R3                      ; 6C8C   037B 000C
        BGT     L_6C93                          ; 6C8E   020E 0003

        ADDI    #$0007, R0                      ; 6C90   02F8 0007
        MOVR    R5,     R7                      ; 6C92   00AF

L_6C93:
        CMPI    #$0011, R3                      ; 6C93   037B 0011
        BGT     L_6C9A                          ; 6C95   020E 0003

        ADDI    #$0000, R0                      ; 6C97   02F8 0000
        MOVR    R5,     R7                      ; 6C99   00AF

L_6C9A:
        CMPI    #$001E, R3                      ; 6C9A   037B 001E
        BGT     L_6CA3                          ; 6C9C   020E 0005

        SDBD                                    ; 6C9E   0001
        ADDI    #$FFFB, R0                      ; 6C9F   02F8 00FB 00FF
        MOVR    R5,     R7                      ; 6CA2   00AF

L_6CA3:
        SDBD                                    ; 6CA3   0001
        ADDI    #$FFF6, R0                      ; 6CA4   02F8 00F6 00FF
        MOVR    R5,     R7                      ; 6CA7   00AF

L_6CA8:
        PSHR    R5                              ; 6CA8   0275
        PSHR    R0                              ; 6CA9   0270

        JSR     R5,     .EXEC.772               ; 6CAA   0004 0114 0372

        MOVR    R1,     R4                      ; 6CAD   008C
        ADDI    #$0002, R4                      ; 6CAE   02FC 0002
        MOVR    R2,     R0                      ; 6CB0   0090
        MOVR    R3,     R1                      ; 6CB1   0099

        JSR     R5,     L_6BF4                  ; 6CB2   0004 0168 03F4
        DECLE   $02BB,  $0038,  $0270,  $0271   ; 6CB5   02BB 0038 0270 0271
        DECLE   $0004                           ; 6CB9   0004

        ANDR    R5,     R4                      ; 6CBA   01AC
        AND@    R5,     R3                      ; 6CBB   03AB
        MOVR    R2,     R3                      ; 6CBC   0093
        PULR    R1                              ; 6CBD   02B1
        PULR    R0                              ; 6CBE   02B0

        JSR     R5,     L_6BFF                  ; 6CBF   0004 0168 03FF
        DECLE   $02B0,  $0004                   ; 6CC2   02B0 0004

        ANDR    R4,     R0                      ; 6CC4   01A0
        XORR    R5,     R4                      ; 6CC5   01EC
        MOVR    R5,     R0                      ; 6CC6   00A8

        JSR     R5,     L_6C40                  ; 6CC7   0004 016C 0040
        JSR     R5,     L_6C5C                  ; 6CCA   0004 016C 005C

        CMPI    #$0003, R1                      ; 6CCD   0379 0003
        BNEQ    L_6CD3                          ; 6CCF   020C 0002

        ADDI    #$0005, R0                      ; 6CD1   02F8 0005
L_6CD3:
        PULR    R7                              ; 6CD3   02B7

L_6CD4:
        PSHR    R5                              ; 6CD4   0275
        CLRR    R1                              ; 6CD5   01C9
        MVI     G_0354, R2                      ; 6CD6   0282 0354
        MVII    #$015D, R3                      ; 6CD8   02BB 015D

        JSR     R5,     L_6CE7                  ; 6CDA   0004 016C 00E7

        MVII    #$0001, R1                      ; 6CDD   02B9 0001
        MVI     G_035C, R2                      ; 6CDF   0282 035C
        MVII    #$0163, R3                      ; 6CE1   02BB 0163

        JSR     R5,     L_6CE7                  ; 6CE3   0004 016C 00E7

        PULR    R7                              ; 6CE6   02B7

L_6CE7:
        PSHR    R5                              ; 6CE7   0275
        MVO     R1,     G_0171                  ; 6CE8   0241 0171
        MVI@    R3,     R0                      ; 6CEA   0298
        CMPI    #$0005, R0                      ; 6CEB   0378 0005
        BEQ     L_6D42                          ; 6CED   0204 0053

        MVII    #$018B, R4                      ; 6CEF   02BC 018B
        MVI@    R4,     R1                      ; 6CF1   02A1
L_6CF2:
        MVI@    R4,     R0                      ; 6CF2   02A0
        DECLE   $0272,  $0004                   ; 6CF3   0272 0004

        ANDR    R4,     R0                      ; 6CF5   01A0
        ANDR    R2,     R4                      ; 6CF6   0194
        INCR    R2                              ; 6CF7   000A
        PULR    R2                              ; 6CF8   02B2
        CMP@    R5,     R2                      ; 6CF9   036A
        BGE     L_6D42                          ; 6CFA   020D 0046

        DECR    R1                              ; 6CFC   0011
        BNEQ    L_6CF2                          ; 6CFD   022C 000C

        PSHR    R3                              ; 6CFF   0273
        MVII    #$0003, R0                      ; 6D00   02B8 0003
        MVO     R0,     G_0102                  ; 6D02   0240 0102

        JSR     R5,     L_663F                  ; 6D04   0004 0164 023F

        MVI     G_0171, R0                      ; 6D07   0280 0171
        MVII    #$0208, R4                      ; 6D09   02BC 0208

        JSR     R5,     L_6277                  ; 6D0B   0004 0160 0277
        DECLE   $0004,  $0168,  $0042           ; 6D0E   0004 0168 0042

        SWAP    R3,     1                       ; 6D11   0043
        SAR     R1,     2                       ; 6D12   006D
        MVII    #$0003, R1                      ; 6D13   02B9 0003
        CLRR    R0                              ; 6D15   01C0
L_6D16:
        DECR    R0                              ; 6D16   0010
        BNEQ    L_6D16                          ; 6D17   022C 0002

        DECR    R1                              ; 6D19   0011
        BNEQ    L_6D16                          ; 6D1A   022C 0005

        PULR    R3                              ; 6D1C   02B3
L_6D1D:
        MVI     G_01C7, R0                      ; 6D1D   0280 01C7
        MVII    #$01C6, R4                      ; 6D1F   02BC 01C6

        JSR     R5,     L_5FE1                  ; 6D21   0004 015C 03E1

        MOVR    R3,     R4                      ; 6D24   009C

        JSR     R5,     L_5FD7                  ; 6D25   0004 015C 03D7

        MVI@    R3,     R0                      ; 6D28   0298
        CMPI    #$0005, R0                      ; 6D29   0378 0005
        BNEQ    L_6D1D                          ; 6D2B   022C 000F

        CLRR    R0                              ; 6D2D   01C0
        CMPI    #$015D, R3                      ; 6D2E   037B 015D
        BNEQ    L_6D37                          ; 6D30   020C 0005

        MVO     R0,     G_0354                  ; 6D32   0240 0354
        INCR    R0                              ; 6D34   0008
        B       L_6D39                          ; 6D35   0200 0002

L_6D37:
        MVO     R0,     G_035C                  ; 6D37   0240 035C
L_6D39:
        MVO     R0,     G_01E8                  ; 6D39   0240 01E8
        MVO     R0,     G_01E7                  ; 6D3B   0240 01E7
        MVI     G_01E9, R0                      ; 6D3D   0280 01E9
        DECR    R0                              ; 6D3F   0010
        MVO     R0,     G_01E9                  ; 6D40   0240 01E9
L_6D42:
        PULR    R7                              ; 6D42   02B7

        DECLE   $0003,  $0216,  $004E,  $006F   ; 6D43   0003 0216 004E 006F
        DECLE   $0020,  $0070,  $006C,  $0061   ; 6D47   0020 0070 006C 0061
        DECLE   $0079,  $0065,  $0072,  $0073   ; 6D4B   0079 0065 0072 0073
        DECLE   $0020,  $006C,  $0065,  $0066   ; 6D4F   0020 006C 0065 0066
        DECLE   $0074,  $0000,  $0228,  $0069   ; 6D53   0074 0000 0228 0069
        DECLE   $006E,  $0020,  $0079,  $006F   ; 6D57   006E 0020 0079 006F
        DECLE   $0075,  $0072,  $0020,  $0070   ; 6D5B   0075 0072 0020 0070
        DECLE   $0072,  $0069,  $0063,  $0065   ; 6D5F   0072 0069 0063 0065
        DECLE   $0020,  $0072,  $0061,  $006E   ; 6D63   0020 0072 0061 006E
        DECLE   $0067,  $0065,  $0000,  $0255   ; 6D67   0067 0065 0000 0255
        DECLE   $0066,  $0072,  $0065,  $0065   ; 6D6B   0066 0072 0065 0065
        DECLE   $0020,  $0061,  $0067,  $0065   ; 6D6F   0020 0061 0067 0065
        DECLE   $006E,  $0074,  $0073,  $0000   ; 6D73   006E 0074 0073 0000
        DECLE   $0265,  $0068,  $0061,  $0076   ; 6D77   0265 0068 0061 0076
        DECLE   $0065,  $0020,  $0062,  $0065   ; 6D7B   0065 0020 0062 0065
        DECLE   $0065,  $006E,  $0020,  $0061   ; 6D7F   0065 006E 0020 0061
        DECLE   $0073,  $0073,  $0069,  $0067   ; 6D83   0073 0073 0069 0067
        DECLE   $006E,  $0065,  $0064,  $0002   ; 6D87   006E 0065 0064 0002
        DECLE   $00FF,  $00F8,  $00E0,  $00C0   ; 6D8B   00FF 00F8 00E0 00C0
        DECLE   $0098,  $0004,  $0002,  $0002   ; 6D8F   0098 0004 0002 0002
        DECLE   $00FF                           ; 6D93   00FF

        MOVR    R3,     R7                      ; 6D94   009F
        MOVR    R0,     R7                      ; 6D95   0087

        DECLE   $0083,  $008D,  $0090,  $00A0   ; 6D96   0083 008D 0090 00A0
        DECLE   $00A0,  $00BF                   ; 6D9A   00A0 00BF

        MOVR    R4,     R0                      ; 6D9C   00A0
        MOVR    R4,     R1                      ; 6D9D   00A1
        MOVR    R2,     R1                      ; 6D9E   0091
        MOVR    R1,     R3                      ; 6D9F   008B
        MOVR    R0,     R7                      ; 6DA0   0087
        MOVR    R1,     R7                      ; 6DA1   008F

        DECLE   $00FF,  $00FE,  $0002,  $0002   ; 6DA2   00FF 00FE 0002 0002
        DECLE   $0084,  $00D8,  $00E0,  $00F8   ; 6DA6   0084 00D8 00E0 00F8
        DECLE   $00FF                           ; 6DAA   00FF

        INCR    R7                              ; 6DAB   000F

        SETC                                    ; 6DAC   0007
L_6DAD:
        DIS                                     ; 6DAD   0003
        DECLE   $0001,  $0000,  $0000,  $0000   ; 6DAE   0001 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FC,  $00F0   ; 6DB2   0000 00FF 00FC 00F0
        DECLE   $00E0,  $00C0,  $0080,  $0000   ; 6DB6   00E0 00C0 0080 0000
        DECLE   $0001,  $0003,  $0003,  $0000   ; 6DBA   0001 0003 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; 6DBE   0000 0000 0000 0080
        DECLE   $00E0,  $0003,  $0007,  $000F   ; 6DC2   00E0 0003 0007 000F
        DECLE   $001F,  $003F,  $007E,  $00FE   ; 6DC6   001F 003F 007E 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 6DCA   00FE 00FE 00FE 00FE
        DECLE   $003E,  $0007,  $0001,  $0000   ; 6DCE   003E 0007 0001 0000
        DECLE   $0000,  $00FF,  $0000,  $00E0   ; 6DD2   0000 00FF 0000 00E0
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6DD6   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $003F,  $003F,  $003F   ; 6DDA   00FF 003F 003F 003F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 6DDE   001F 001F 001F 001F

        INCR    R7                              ; 6DE2   000F

        ADDR    R7,     R0                      ; 6DE3   00F8
L_6DE4:
        ADDR    R7,     R0                      ; 6DE4   00F8
        DECLE   $00F8,  $0080,  $0000,  $0000   ; 6DE5   00F8 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE9   0000 0000 0000 0000
        DECLE   $0080,  $00E0,  $00F8,  $00F8   ; 6DED   0080 00E0 00F8 00F8
        DECLE   $00F8,  $00FC,  $0080,  $00E3   ; 6DF1   00F8 00FC 0080 00E3
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6DF5   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0080,  $0080   ; 6DF9   00FF 00FF 0080 0080
        DECLE   $0080,  $0040,  $0040,  $0040   ; 6DFD   0080 0040 0040 0040
        DECLE   $00A0,  $00A0,  $00D0,  $00EC   ; 6E01   00A0 00A0 00D0 00EC
        DECLE   $00F3,  $00FC,  $00FF,  $00FF   ; 6E05   00F3 00FC 00FF 00FF
        DECLE   $00FF,  $00FF,  $0099,  $0011   ; 6E09   00FF 00FF 0099 0011
        DECLE   $0011,  $0099,  $0088,  $0088   ; 6E0D   0011 0099 0088 0088
        DECLE   $00CC,  $00CC,  $00F8,  $00FE   ; 6E11   00CC 00CC 00F8 00FE
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6E15   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0084,  $0004   ; 6E19   00FF 00FF 0084 0004
        DECLE   $007F,  $007F,  $007F,  $003F   ; 6E1D   007F 007F 007F 003F
        DECLE   $003C,  $003F,  $007F,  $007F   ; 6E21   003C 003F 007F 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FC   ; 6E25   00FF 00FF 00FF 00FC
        DECLE   $004F,  $00FF,  $0040,  $00C0   ; 6E29   004F 00FF 0040 00C0
        DECLE   $0080,  $0040,  $00C0,  $00C0   ; 6E2D   0080 0040 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 6E31   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00A0   ; 6E35   00C0 00C0 00C0 00A0
        DECLE   $00E0,  $00A0,  $00B0,  $00D0   ; 6E39   00E0 00A0 00B0 00D0
        DECLE   $00D0,  $00D0,  $00D0,  $00B0   ; 6E3D   00D0 00D0 00D0 00B0
        DECLE   $0060,  $00E0,  $00FE,  $00FC   ; 6E41   0060 00E0 00FE 00FC
        DECLE   $00FC,  $00FC,  $00F8,  $00F8   ; 6E45   00FC 00FC 00F8 00F8
        DECLE   $00F8,  $00F0,  $00FF,  $00FF   ; 6E49   00F8 00F0 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6E4D   00FF 00FF 00FF 00FF
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6E51   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6E55   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $00F0,  $00F0   ; 6E59   00FF 00FE 00F0 00F0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 6E5D   00E0 00E0 00E0 00E0
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 6E61   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $00E0   ; 6E65   00C0 00C0 00C0 00E0
        DECLE   $00E0,  $00F8,  $003F,  $003F   ; 6E69   00E0 00F8 003F 003F
        DECLE   $007F,  $007F,  $007F,  $00FF   ; 6E6D   007F 007F 007F 00FF
        DECLE   $00FF,  $00FF,  $000F,  $000F   ; 6E71   00FF 00FF 000F 000F
        DECLE   $000F,  $000F,  $000F,  $001F   ; 6E75   000F 000F 000F 001F
        DECLE   $001F,  $001F,  $0001,  $0001   ; 6E79   001F 001F 0001 0001
        DECLE   $0001,  $0003,  $0003,  $0003   ; 6E7D   0001 0003 0003 0003
        DECLE   $0007,  $0007,  $000B,  $000B   ; 6E81   0007 0007 000B 000B
        DECLE   $0085,  $0005,  $0045,  $0005   ; 6E85   0085 0005 0045 0005
        DECLE   $0005,  $008B,  $003C,  $0066   ; 6E89   0005 008B 003C 0066
        DECLE   $00DB,  $0091,  $00DB,  $0066   ; 6E8D   00DB 0091 00DB 0066
        DECLE   $003C,  $0000,  $002F,  $0027   ; 6E91   003C 0000 002F 0027
L_6E95:
        DECR    R7                              ; 6E95   0017
L_6E96:
        DECR    R7                              ; 6E96   0017
L_6E97:
        DECR    R7                              ; 6E97   0017

        DECLE   $0013,  $000B,  $000B,  $007F   ; 6E98   0013 000B 000B 007F
        DECLE   $0007,  $0000,  $0000,  $0000   ; 6E9C   0007 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FE   ; 6EA0   0000 0000 0000 00FE
        DECLE   $00F0,  $000C,  $0002,  $0002   ; 6EA4   00F0 000C 0002 0002
        DECLE   $0001,  $0001,  $0001,  $00FC   ; 6EA8   0001 0001 0001 00FC
        DECLE   $00F8,  $00F8,  $00F8,  $00FC   ; 6EAC   00F8 00F8 00F8 00FC
        DECLE   $00FE,  $00FF,  $00FF,  $003D   ; 6EB0   00FE 00FF 00FF 003D
        DECLE   $003D,  $003D,  $007A,  $007A   ; 6EB4   003D 003D 007A 007A
        DECLE   $007A,  $00F4,  $00F4,  $00FF   ; 6EB8   007A 00F4 00F4 00FF
L_6EBC:
        DECR    R7                              ; 6EBC   0017

        DECLE   $000B,  $000B,  $000B,  $0085   ; 6EBD   000B 000B 000B 0085
        DECLE   $0005,  $000B,  $0004,  $0004   ; 6EC1   0005 000B 0004 0004
        DECLE   $0004,  $0008,  $0008,  $0008   ; 6EC5   0004 0008 0008 0008
        DECLE   $0010,  $0010,  $0010,  $0020   ; 6EC9   0010 0010 0010 0020
        DECLE   $0020,  $0020,  $0040,  $0040   ; 6ECD   0020 0020 0040 0040
        DECLE   $0040,  $0080,  $00C1,  $00FA   ; 6ED1   0040 0080 00C1 00FA
        DECLE   $00FC,  $00FE,  $00FE,  $00FF   ; 6ED5   00FC 00FE 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6ED9   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $007F,  $003F   ; 6EDD   00FF 00FF 007F 003F
        DECLE   $001F,  $001F,  $0007,  $00E0   ; 6EE1   001F 001F 0007 00E0
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6EE5   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0002   ; 6EE9   00FF 00FF 00FF 0002
        DECLE   $0001,  $0081,  $00FA,  $00FC   ; 6EED   0001 0081 00FA 00FC
        DECLE   $00FE,  $00FF,  $0080,  $0080   ; 6EF1   00FE 00FF 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 6EF5   0080 0080 0080 0080
        DECLE   $0040,  $0030,  $0000,  $0000   ; 6EF9   0040 0030 0000 0000
        DECLE   $0000,  $001C,  $0000,  $001E   ; 6EFD   0000 001C 0000 001E
        DECLE   $0000,  $0016,  $0006,  $001E   ; 6F01   0000 0016 0006 001E
        DECLE   $0006,  $0008,  $0006,  $0024   ; 6F05   0006 0008 0006 0024
        DECLE   $0007,  $001E,  $0006,  $002E   ; 6F09   0007 001E 0006 002E
        DECLE   $0000,  $002E,  $00BF,  $0000   ; 6F0D   0000 002E 00BF 0000
        DECLE   $0001                           ; 6F11   0001

        DECR    R1                              ; 6F12   0011
        SUBR    R3,     R7                      ; 6F13   011F

        DECLE   $0000,  $0031,  $0021,  $00FF   ; 6F14   0000 0031 0021 00FF
        DECLE   $0000                           ; 6F18   0000

        ANDR    R2,     R2                      ; 6F19   0192
        RLC     R2,     1                       ; 6F1A   0052
        RRC     R2,     1                       ; 6F1B   0072
        MOVR    R6,     R2                      ; 6F1C   00B2
        MOVR    R4,     R2                      ; 6F1D   00A2
        ADDR    R5,     R7                      ; 6F1E   00EF

        DECLE   $0000                           ; 6F1F   0000

        MVO     R2,     G_0062                  ; 6F20   0242 0062
        MOVR    R0,     R2                      ; 6F22   0082
        DIS                                     ; 6F23   0003
        SWAP    R2,     1                       ; 6F24   0042
        MVI@    R4,     R2                      ; 6F25   02A2
        ADDR    R5,     R7                      ; 6F26   00EF

        DECLE   $0000                           ; 6F27   0000

        SUBR    R2,     R2                      ; 6F28   0112
        ADDR    R0,     R2                      ; 6F29   00C2
        ADDR    R2,     R4                      ; 6F2A   00D4
        ADDR    R4,     R4                      ; 6F2B   00E4
        CLRR    R2                              ; 6F2C   01D2
        SUBR    R1,     R7                      ; 6F2D   010F

        DECLE   $0000                           ; 6F2E   0000

        SUBR    R0,     R5                      ; 6F2F   0105
        ADDR    R6,     R4                      ; 6F30   00F4
        CMPR    R0,     R5                      ; 6F31   0145
        SUBR    R1,     R7                      ; 6F32   010F

        DECLE   $0000                           ; 6F33   0000

        SUBR    R4,     R5                      ; 6F34   0125
        SUBR    R6,     R5                      ; 6F35   0135
        CMPR    R2,     R5                      ; 6F36   0155
        SUBR    R1,     R7                      ; 6F37   010F

        DECLE   $0000,  $0006,  $0185,  $0165   ; 6F38   0000 0006 0185 0165
        DECLE   $00FF,  $0000,  $0172,  $0272   ; 6F3C   00FF 0000 0172 0272
        DECLE   $0003,  $01C2,  $00FF,  $0000   ; 6F40   0003 01C2 00FF 0000

        ANDR    R4,     R2                      ; 6F44   01A2
        MVI     G_01E2, R2                      ; 6F45   0282 01E2
        SUBR    R1,     R7                      ; 6F47   010F

        DECLE   $0000,  $01B2,  $02D2,  $01E7   ; 6F48   0000 01B2 02D2 01E7
        DECLE   $0258,  $0229,  $0239,  $0219   ; 6F4C   0258 0229 0239 0219
        DECLE   $00DF,  $0000,  $02B9,  $0099   ; 6F50   00DF 0000 02B9 0099
        DECLE   $02C9,  $0269,  $0299,  $01F9   ; 6F54   02C9 0269 0299 01F9
        DECLE   $0000,  $0053,  $0030,  $00A1   ; 6F58   0000 0053 0030 00A1
        DECLE   $0099,  $0000,  $0065,  $0000   ; 6F5C   0099 0000 0065 0000
        DECLE   $0012,  $0000,  $0000,  $0000   ; 6F60   0012 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6F64   0000 0000 0000 0001
        DECLE   $0000,  $00D3,  $0010,  $00A8   ; 6F68   0000 00D3 0010 00A8
        DECLE   $0099,  $0000,  $0071,  $0000   ; 6F6C   0099 0000 0071 0000
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6F70   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6F74   0000 0000 0000 0001
        DECLE   $0000                           ; 6F78   0000

        SWAP    R0,     1                       ; 6F79   0040
        DECR    R0                              ; 6F7A   0010
        MOVR    R5,     R7                      ; 6F7B   00AF

        DECLE   $0099,  $0000,  $0070,  $0000   ; 6F7C   0099 0000 0070 0000
        DECLE   $0024,  $0000,  $0000,  $0000   ; 6F80   0024 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6F84   0000 0000 0000 0001
        DECLE   $0000,  $0040,  $0010,  $00B6   ; 6F88   0000 0040 0010 00B6
        DECLE   $0099,  $0000,  $0077,  $0000   ; 6F8C   0099 0000 0077 0000
        DECLE   $0023,  $0000,  $0000,  $0000   ; 6F90   0023 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6F94   0000 0000 0000 0001
        DECLE   $0000,  $00C0,  $0010,  $00BD   ; 6F98   0000 00C0 0010 00BD
        DECLE   $0099,  $0000,  $006E,  $0000   ; 6F9C   0099 0000 006E 0000
        DECLE   $0038,  $0000,  $0000,  $00E0   ; 6FA0   0038 0000 0000 00E0
        DECLE   $0001,  $0000,  $0000,  $0001   ; 6FA4   0001 0000 0000 0001
        DECLE   $0000,  $0040,  $0010,  $00C4   ; 6FA8   0000 0040 0010 00C4
        DECLE   $0099,  $0000,  $006F,  $0000   ; 6FAC   0099 0000 006F 0000
        DECLE   $001B,  $0000,  $0000,  $0000   ; 6FB0   001B 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6FB4   0000 0000 0000 0001
        DECLE   $0000,  $0046,  $0010,  $00CB   ; 6FB8   0000 0046 0010 00CB
        DECLE   $0099,  $0000,  $0073,  $0000   ; 6FBC   0099 0000 0073 0000
        DECLE   $005C,  $0000,  $0000,  $0000   ; 6FC0   005C 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6FC4   0000 0000 0000 0001
        DECLE   $0000,  $0046,  $0011,  $00D2   ; 6FC8   0000 0046 0011 00D2
        DECLE   $0099,  $0000,  $006E,  $0000   ; 6FCC   0099 0000 006E 0000
        DECLE   $002B,  $0000,  $0000,  $0000   ; 6FD0   002B 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 6FD4   0000 0000 0000 0001
        DECLE   $0000                           ; 6FD8   0000
L_6FD9:
        PSHR    R5                              ; 6FD9   0275

        JSR     R5,     L_5FB6                  ; 6FDA   0004 015C 03B6

        ADCR    R6                              ; 6FDD   002E
        MOVR    R1,     R3                      ; 6FDE   008B
        SAR     R1,     2                       ; 6FDF   006D

        JSR     R5,     L_680E                  ; 6FE0   0004 0168 000E
        DECLE   $0200,  $02F0                   ; 6FE3   0200 02F0
        BIDECLE $6EFB,  $6F0F                   ; 6FE5   00FB 006E 000F 006F

        MVII    #$0008, R0                      ; 6FE9   02B8 0008
        SDBD                                    ; 6FEB   0001
        MVII    #$6F59, R1                      ; 6FEC   02B9 0059 006F
        MVII    #$031D, R2                      ; 6FEF   02BA 031D

        JSR     R5,     X_INIT_MOBS             ; 6FF1   0004 0114 02B4

        PULR    R7                              ; 6FF4   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000
        DECLE   $0044,  $0044,  $00A8,  $00A8   ; D000   0044 0044 00A8 00A8
        DECLE   $0050,  $00A0,  $00A0,  $0040   ; D004   0050 00A0 00A0 0040
        DECLE   $0080,  $0080,  $0080,  $0080   ; D008   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $00FF   ; D00C   0080 0080 0080 00FF
        DECLE   $0001,  $0001,  $0001,  $0001   ; D010   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0001,  $00FF   ; D014   0001 0001 0001 00FF
        DECLE   $0002,  $00FF,  $0080,  $0080   ; D018   0002 00FF 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; D01C   0080 0080 0080 0080
        DECLE   $0040,  $00FF,  $0001,  $0001   ; D020   0040 00FF 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; D024   0001 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; D028   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; D02C   0000 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D030   0000 0000 0000 0000
        DECLE   $0006,  $00FC,  $0000,  $0000   ; D034   0006 00FC 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D038   0000 0000 0000 0000
        DECLE   $0060,  $003F,  $0000,  $0000   ; D03C   0060 003F 0000 0000
        DECLE   $00FF,  $0010,  $0010,  $0020   ; D040   00FF 0010 0010 0020
        DECLE   $0020,  $0020,  $0040,  $0040   ; D044   0020 0020 0040 0040
        DECLE   $00FF,  $0008,  $0008,  $0004   ; D048   00FF 0008 0008 0004
        DECLE   $0004,  $0004,  $0002,  $0002   ; D04C   0004 0004 0002 0002
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; D050   00FF 0000 00FF 0000
        DECLE   $00FF,  $0000,  $00FF,  $0000   ; D054   00FF 0000 00FF 0000
        DECLE   $00BF,  $00BF,  $00BF,  $00BF   ; D058   00BF 00BF 00BF 00BF
        DECLE   $00BF,  $00BF,  $00BF,  $00BF   ; D05C   00BF 00BF 00BF 00BF
        DECLE   $00FD,  $00FD,  $00FD,  $00FD   ; D060   00FD 00FD 00FD 00FD
        DECLE   $00FD,  $00FD,  $00FD,  $00FD   ; D064   00FD 00FD 00FD 00FD
        DECLE   $00BF,  $00BF,  $00BF,  $001F   ; D068   00BF 00BF 00BF 001F

        INCR    R7                              ; D06C   000F

        SETC                                    ; D06D   0007
L_D06E:
        DIS                                     ; D06E   0003
        DECLE   $0001,  $00FD,  $00FD,  $00FC   ; D06F   0001 00FD 00FD 00FC
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; D073   00F8 00F0 00E0 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; D077   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; D07B   0000 0000 0000 0003
        DECLE   $0002,  $0000,  $0000,  $0000   ; D07F   0002 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; D083   0000 0000 0000 00C0
        DECLE   $0040,  $0002,  $0002,  $0002   ; D087   0040 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; D08B   0002 0002 0002 0002
        DECLE   $0002,  $0040,  $0040,  $0040   ; D08F   0002 0040 0040 0040
        DECLE   $0040,  $0040,  $0040,  $0040   ; D093   0040 0040 0040 0040
        DECLE   $0040,  $000F,  $0000,  $000F   ; D097   0040 000F 0000 000F
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; D09B   0000 00FF 0000 00FF
        DECLE   $0000,  $00F0,  $0000,  $00F0   ; D09F   0000 00F0 0000 00F0
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; D0A3   0000 00FF 0000 00FF
        DECLE   $0000,  $006F,  $0000,  $000F   ; D0A7   0000 006F 0000 000F
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; D0AB   0000 00FF 0000 00FF
        DECLE   $0000,  $00F6,  $0000,  $00F0   ; D0AF   0000 00F6 0000 00F0
        DECLE   $0000,  $00FF,  $0000,  $00FF   ; D0B3   0000 00FF 0000 00FF
        DECLE   $0000,  $00FF,  $0002,  $0004   ; D0B7   0000 00FF 0002 0004
        DECLE   $0008,  $0010,  $0020,  $0040   ; D0BB   0008 0010 0020 0040
        DECLE   $0080,  $00FF,  $0040,  $0020   ; D0BF   0080 00FF 0040 0020
        DECLE   $0010,  $0008,  $0004,  $0002   ; D0C3   0010 0008 0004 0002
        DECLE   $0001,  $0000,  $00FF,  $0000   ; D0C7   0001 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0CB   0000 0000 0000 0000
        DECLE   $0000,  $0044,  $0044,  $002A   ; D0CF   0000 0044 0044 002A
        DECLE   $002A,  $0015,  $000A,  $000A   ; D0D3   002A 0015 000A 000A
        DECLE   $0005,  $00FF,  $0030,  $00FF   ; D0D7   0005 00FF 0030 00FF
        DECLE   $007C,  $007F,  $00FA,  $00FF   ; D0DB   007C 007F 00FA 00FF
        DECLE   $0048,  $00CC,  $0000,  $0000   ; D0DF   0048 00CC 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E3   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $0018,  $00FF   ; D0E7   0000 00FF 0018 00FF
        DECLE   $003C,  $00FF,  $007C,  $00FF   ; D0EB   003C 00FF 007C 00FF
        DECLE   $0044,  $00FF,  $0061,  $00FF   ; D0EF   0044 00FF 0061 00FF
        DECLE   $007B,  $00FF,  $00FD,  $00FF   ; D0F3   007B 00FF 00FD 00FF
        DECLE   $0052,  $00FF,  $0086,  $00FF   ; D0F7   0052 00FF 0086 00FF
        DECLE   $00CF,  $00FF,  $00DF,  $00FF   ; D0FB   00CF 00FF 00DF 00FF
        DECLE   $0049,  $00FF,  $00FF,  $00FF   ; D0FF   0049 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D103   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0038   ; D107   00FF 0000 0000 0038
        DECLE   $0022,  $0020,  $0022,  $0038   ; D10B   0022 0020 0022 0038
        DECLE   $0000,  $0000,  $0000,  $0012   ; D10F   0000 0000 0000 0012
        DECLE   $001A,  $001E,  $0016,  $0012   ; D113   001A 001E 0016 0012
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D117   0000 0000 0000 00E0
        DECLE   $00A0,  $00A0,  $00A0,  $00E0   ; D11B   00A0 00A0 00A0 00E0
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D11F   0000 0000 0000 00E0
        DECLE   $0088,  $00C0,  $0088,  $00E0   ; D123   0088 00C0 0088 00E0
        DECLE   $0000,  $0000,  $0000,  $00AE   ; D127   0000 0000 0000 00AE
        DECLE   $00A8,  $00EC,  $0048,  $004E   ; D12B   00A8 00EC 0048 004E
        DECLE   $0000,  $0000,  $0000,  $00E0   ; D12F   0000 0000 0000 00E0
        DECLE   $0080,  $00E0,  $0020,  $00E0   ; D133   0080 00E0 0020 00E0
        DECLE   $0000,  $00FF,  $0019,  $00FD   ; D137   0000 00FF 0019 00FD
        DECLE   $003F,  $00FF                   ; D13B   003F 00FF

        RRC     R3,     2                       ; D13D   0077
        ADDR    R6,     R3                      ; D13E   00F3
        ADDR    R6,     R3                      ; D13F   00F3
        ADDR    R0,     R0                      ; D140   00C0
        ADDR    R4,     R0                      ; D141   00E0
        ADDR    R4,     R0                      ; D142   00E0
        ADDR    R0,     R7                      ; D143   00C7

        COMR    R4                              ; D144   001C
        MOVR    R3,     R7                      ; D145   009F

        ADDR    R3,     R4                      ; D146   00DC
        ADDR    R1,     R7                      ; D147   00CF

        DECLE   $0001,  $0001,  $0001,  $008F   ; D148   0001 0001 0001 008F
        DECLE   $00DD,  $00BB,  $00BB,  $003F   ; D14C   00DD 00BB 00BB 003F

        ADDR    R4,     R0                      ; D150   00E0
        ADDR    R0,     R0                      ; D151   00C0
        ADDR    R0,     R0                      ; D152   00C0
        MOVR    R3,     R7                      ; D153   009F

        MOVR    R7,     R0                      ; D154   00B8
        MOVR    R3,     R6                      ; D155   009E
        MOVR    R0,     R7                      ; D156   0087

        DECLE   $007E,  $00FE,  $003C,  $003F   ; D157   007E 00FE 003C 003F
        DECLE   $003D,  $003D,  $003F,  $0000   ; D15B   003D 003D 003F 0000
        DECLE   $003F,  $001C,  $001D,  $009D   ; D15F   003F 001C 001D 009D
        DECLE   $00DD,  $00DD,  $009C,  $0000   ; D163   00DD 00DD 009C 0000
        DECLE   $00FF,  $0000                   ; D167   00FF 0000

        ADDR    R2,     R3                      ; D169   00D3
        ADDR    R2,     R6                      ; D16A   00D6
        ADDR    R2,     R7                      ; D16B   00D7
        ADDR    R2,     R7                      ; D16C   00D7

        DECLE   $00E3,  $0000,  $00FF,  $0000   ; D16D   00E3 0000 00FF 0000

        MOVR    R1,     R7                      ; D171   008F

        ADDR    R3,     R4                      ; D172   00DC
        ADDR    R1,     R6                      ; D173   00CE
        SETC                                    ; D174   0007
        ADDR    R0,     R7                      ; D175   00C7
        INCR    R7                              ; D176   000F

        ADDR    R7,     R6                      ; D177   00FE
L_D178:
        DECR    R2                              ; D178   0012
        DECLE   $0024,  $0048,  $0000,  $0000   ; D179   0024 0048 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D17D   0000 0000 0000 0000
        DECLE   $0000,  $0050,  $00FA,  $0050   ; D181   0000 0050 00FA 0050
        DECLE   $00FA,  $0050,  $0000,  $0000   ; D185   00FA 0050 0000 0000
        DECLE   $0000,  $00EE,  $0088,  $00EC   ; D189   0000 00EE 0088 00EC
        DECLE   $0028,  $00EE,  $0000,  $0000   ; D18D   0028 00EE 0000 0000
        DECLE   $0000,  $0080,  $0080,  $0080   ; D191   0000 0080 0080 0080
        DECLE   $0080,  $00E0,  $0000,  $0000   ; D195   0080 00E0 0000 0000
        DECLE   $0000,  $00E0,  $0088,  $0080   ; D199   0000 00E0 0088 0080
        DECLE   $0088,  $00E0,  $0000,  $0000   ; D19D   0088 00E0 0000 0000
        DECLE   $0000,  $00EE,  $0084,  $00E4   ; D1A1   0000 00EE 0084 00E4
        DECLE   $0024,  $00E4,  $0000,  $0000   ; D1A5   0024 00E4 0000 0000
        DECLE   $0000,  $00EE,  $00A4,  $00E4   ; D1A9   0000 00EE 00A4 00E4
        DECLE   $00A4,  $00A4,  $0000,  $0000   ; D1AD   00A4 00A4 0000 0000
        DECLE   $0000,  $00E0,  $00A8,  $00A0   ; D1B1   0000 00E0 00A8 00A0
        DECLE   $00A8,  $00E0,  $0000,  $0000   ; D1B5   00A8 00E0 0000 0000
        DECLE   $0000,  $00E9,  $004D,  $004B   ; D1B9   0000 00E9 004D 004B
        DECLE   $0049,  $00E9,  $0000,  $0000   ; D1BD   0049 00E9 0000 0000
        DECLE   $0000                           ; D1C1   0000
L_D1C2:
        DECR    R7                              ; D1C2   0017

        DECLE   $0015,  $0025,  $0045,  $0047   ; D1C3   0015 0025 0045 0047
        DECLE   $0000,  $0000,  $0000,  $0057   ; D1C7   0000 0000 0000 0057
        DECLE   $0052,  $0052,  $0052,  $0072   ; D1CB   0052 0052 0052 0072
        DECLE   $0000,  $0000,  $0000,  $00E1   ; D1CF   0000 0000 0000 00E1
        DECLE   $0089,  $00C1,  $0089,  $00E1   ; D1D3   0089 00C1 0089 00E1
        DECLE   $0000,  $0000,  $0000,  $009D   ; D1D7   0000 0000 0000 009D
        DECLE   $0055,  $0055,  $0055,  $009D   ; D1DB   0055 0055 0055 009D
        DECLE   $0000,  $0000,  $0000,  $002E   ; D1DF   0000 0000 0000 002E
        DECLE   $00A8,  $006C,  $0028,  $002E   ; D1E3   00A8 006C 0028 002E
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1E7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D1EB   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D1EF   0000 0000

        RSWD    R4                              ; D1F1   003C
        RRC     R2,     1                       ; D1F2   0072
        ADDR    R5,     R7                      ; D1F3   00EF

        DECLE   $007E,  $00A1,  $007E,  $003C   ; D1F4   007E 00A1 007E 003C
        DECLE   $0000,  $0000,  $0000,  $0008   ; D1F8   0000 0000 0000 0008
        DECLE   $0007,  $0008,  $0002,  $0008   ; D1FC   0007 0008 0002 0008
        DECLE   $0001,  $0008,  $0000,  $0002   ; D200   0001 0008 0000 0002
        DECLE   $0000,  $0006,  $0005,  $0006   ; D204   0000 0006 0005 0006
        DECLE   $0005,  $0008,  $0000,  $001A   ; D208   0005 0008 0000 001A
        DECLE   $0000,  $00F1,  $0051,  $0101   ; D20C   0000 00F1 0051 0101
        DECLE   $001F,  $0000,  $0131,  $01B1   ; D210   001F 0000 0131 01B1
        DECLE   $0032,  $001F,  $0192,  $0042   ; D214   0032 001F 0192 0042
        DECLE   $01D1,  $0141,  $001F,  $0000   ; D218   01D1 0141 001F 0000
        DECLE   $00F1,  $0051,  $0101,  $001F   ; D21C   00F1 0051 0101 001F
        DECLE   $0000,  $0111,  $00C3,  $0121   ; D220   0000 0111 00C3 0121
        DECLE   $0000,  $0131,  $01D1,  $01B1   ; D224   0000 0131 01D1 01B1
        DECLE   $0012,  $0073,  $0063,  $0022   ; D228   0012 0073 0063 0022
        DECLE   $01E1,  $01F1,  $0141,  $0209   ; D22C   01E1 01F1 0141 0209
        DECLE   $0111,  $00B4,  $0121,  $001F   ; D230   0111 00B4 0121 001F
        DECLE   $0000,  $0111,  $00E3,  $0121   ; D234   0000 0111 00E3 0121
        DECLE   $0131,  $01E1,  $01F1,  $00A1   ; D238   0131 01E1 01F1 00A1
        DECLE   $01B1,  $01A2,  $0002,  $01B1   ; D23C   01B1 01A2 0002 01B1
        DECLE   $01E1,  $01F1,  $01F5,  $0141   ; D240   01E1 01F1 01F5 0141
        DECLE   $0111,  $00D4,  $0121,  $0000   ; D244   0111 00D4 0121 0000
        DECLE   $001F,  $00C6,  $0000,  $0151   ; D248   001F 00C6 0000 0151
        DECLE   $001F,  $00A1,  $001F,  $01B1   ; D24C   001F 00A1 001F 01B1
        DECLE   $01D1,  $01B1,  $01E1,  $01F1   ; D250   01D1 01B1 01E1 01F1
        DECLE   $003F,  $00A1,  $0161,  $0000   ; D254   003F 00A1 0161 0000
        DECLE   $001F,  $00C6,  $005F,  $0000   ; D258   001F 00C6 005F 0000
        DECLE   $005F,  $01C1,  $007F,  $0000   ; D25C   005F 01C1 007F 0000

        ADDR    R0,     R7                      ; D260   00C7

        CMPR    R7,     R0                      ; D261   0178
        SLL     R3,     2                       ; D262   004F
        ADDR    R0,     R7                      ; D263   00C7

        DECLE   $0088,  $003F                   ; D264   0088 003F

        ADDR    R0,     R7                      ; D266   00C7

        MOVR    R3,     R0                      ; D267   0098
        SLL     R3,     2                       ; D268   004F
        ADDR    R0,     R7                      ; D269   00C7

        ANDR    R1,     R0                      ; D26A   0188
        ADDR    R0,     R7                      ; D26B   00C7

        DECLE   $0090,  $0010,  $00D9,  $0099   ; D26C   0090 0010 00D9 0099
        DECLE   $0000,  $0078,  $0000,  $0048   ; D270   0000 0078 0000 0048
        DECLE   $0000,  $0000,  $0000,  $0000   ; D274   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D278   0000 0000 0001 0000
        DECLE   $0060,  $0030,  $00E0,  $0099   ; D27C   0060 0030 00E0 0099
        DECLE   $0000,  $0050,  $0000,  $0048   ; D280   0000 0050 0000 0048
        DECLE   $0000,  $0000,  $0000,  $0000   ; D284   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; D288   0000 0000 0001 0000

        MOVR    R0,     R3                      ; D28C   0083
        DECR    R0                              ; D28D   0010
        ADDR    R4,     R7                      ; D28E   00E7

        DECLE   $0099,  $0000,  $0008,  $0000   ; D28F   0099 0000 0008 0000
        DECLE   $0050,  $0000,  $0000,  $0000   ; D293   0050 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D297   0000 0000 0000 0001
        DECLE   $0000,  $0067,  $0030,  $00EE   ; D29B   0000 0067 0030 00EE
        DECLE   $0099,  $0000,  $0050,  $0000   ; D29F   0099 0000 0050 0000
        DECLE   $0041,  $0000,  $0000,  $0000   ; D2A3   0041 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D2A7   0000 0000 0000 0001
        DECLE   $0000,  $0090,  $0010,  $00F5   ; D2AB   0000 0090 0010 00F5
        DECLE   $0099,  $0000,  $0028,  $0000   ; D2AF   0099 0000 0028 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; D2B3   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D2B7   0000 0000 0000 0001
        DECLE   $0000,  $0010,  $0011,  $00FC   ; D2BB   0000 0010 0011 00FC
        DECLE   $0099,  $0000,  $00A0,  $0000   ; D2BF   0099 0000 00A0 0000
        DECLE   $0040,  $0000,  $0000,  $0000   ; D2C3   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D2C7   0000 0000 0000 0001
        DECLE   $0000,  $0040,  $0010,  $0003   ; D2CB   0000 0040 0010 0003
        DECLE   $009A,  $0000,  $0073,  $0000   ; D2CF   009A 0000 0073 0000
        DECLE   $0051,  $0000,  $0000,  $0000   ; D2D3   0051 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D2D7   0000 0000 0000 0001
        DECLE   $0000                           ; D2DB   0000

        PSHR    R5                              ; D2DC   0275

        JSR     R5,     L_5E9D                  ; D2DD   0004 015C 029D
        DECLE   $0000                           ; D2E0   0000

        INCR    R0                              ; D2E1   0008
        DIS                                     ; D2E2   0003
        INCR    R0                              ; D2E3   0008

        JSR     R5,     L_5FB6                  ; D2E4   0004 015C 03B6
        DECLE   $0030,  $0000                   ; D2E7   0030 0000

        MOVR    R2,     R0                      ; D2E9   0090

        JSR     R5,     L_680E                  ; D2EA   0004 0168 000E
        DECLE   $0278,  $02F0                   ; D2ED   0278 02F0
        BIDECLE $91F8,  $920C                   ; D2EF   00F8 0091 000C 0092

        MVII    #$0007, R0                      ; D2F3   02B8 0007
        SDBD                                    ; D2F5   0001
        MVII    #$926C, R1                      ; D2F6   02B9 006C 0092
        MVII    #$0325, R2                      ; D2F9   02BA 0325

        JSR     R5,     X_INIT_MOBS             ; D2FB   0004 0114 02B4
        JSR     R5,     L_5EB2                  ; D2FE   0004 015C 02B2
        DECLE   $0278                           ; D301   0278

        MVI@    R1,     R6                      ; D302   028E
        MVI@    R1,     R7                      ; D303   028F

        MVI@    R3,     R3                      ; D304   029B
        MVI@    R3,     R4                      ; D305   029C
        MVI@    R3,     R5                      ; D306   029D
        MVI@    R3,     R6                      ; D307   029E
        MVI@    R3,     R7                      ; D308   029F

        MVI@    R4,     R0                      ; D309   02A0
        MVI@    R4,     R2                      ; D30A   02A2
        MVI@    R4,     R3                      ; D30B   02A3
        MVI@    R5,     R6                      ; D30C   02AE
        MVI@    R5,     R7                      ; D30D   02AF

        DECLE   $02B1,  $02B2,  $02B3,  $02B4   ; D30E   02B1 02B2 02B3 02B4
        DECLE   $02B5,  $0000,  $02B7,  $0088   ; D312   02B5 0000 02B7 0088
        DECLE   $0088,  $0048,  $0048,  $0028   ; D316   0088 0048 0048 0028
        DECLE   $0028,  $0018,  $0018,  $0080   ; D31A   0028 0018 0018 0080
        DECLE   $0080,  $0040,  $0040,  $0020   ; D31E   0080 0040 0040 0020
        DECLE   $0020,  $0010,  $0010,  $0018   ; D322   0020 0010 0010 0018
        DECLE   $0018,  $0028,  $0028,  $0048   ; D326   0018 0028 0028 0048
        DECLE   $0048,  $0088,  $0088,  $0018   ; D32A   0048 0088 0088 0018
        DECLE   $0018,  $0014,  $0014,  $0012   ; D32E   0018 0014 0014 0012
        DECLE   $0012,  $0011,  $0011,  $0080   ; D332   0012 0011 0011 0080
        DECLE   $0080,  $0040,  $0040,  $0020   ; D336   0080 0040 0040 0020
        DECLE   $0020,  $0010,  $0010,  $0011   ; D33A   0020 0010 0010 0011
        DECLE   $0011,  $0012,  $0012,  $0014   ; D33E   0011 0012 0012 0014
        DECLE   $0014,  $0018,  $0018,  $00FE   ; D342   0014 0018 0018 00FE
        DECLE   $001E,  $0046,  $0086,  $0002   ; D346   001E 0046 0086 0002
        DECLE   $0002,  $0001,  $0081,  $00FF   ; D34A   0002 0001 0081 00FF
        DECLE   $0000,  $0055,  $002A,  $0015   ; D34E   0000 0055 002A 0015
        DECLE   $000A,  $0015,  $002A,  $0010   ; D352   000A 0015 002A 0010
        DECLE   $0010,  $0020,  $0020,  $0040   ; D356   0010 0020 0020 0040
        DECLE   $0040,  $0080,  $00FF,  $0000   ; D35A   0040 0080 00FF 0000
        DECLE   $0000,  $0001,  $0002,  $0004   ; D35E   0000 0001 0002 0004
        DECLE   $0008,  $0030,  $00C0,  $0003   ; D362   0008 0030 00C0 0003
        DECLE   $001C,  $00E0,  $0000,  $0000   ; D366   001C 00E0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; D36A   0000 0000 0000 0008
        DECLE   $0010,  $0010,  $0010,  $0020   ; D36E   0010 0010 0010 0020
        DECLE   $0020,  $0040,  $0040,  $0020   ; D372   0020 0040 0040 0020
        DECLE   $0010,  $0010,  $0010,  $0008   ; D376   0010 0010 0010 0008
        DECLE   $0008,  $0008,  $0008,  $0000   ; D37A   0008 0008 0008 0000
        DECLE   $0000,  $0000,  $00C0,  $003C   ; D37E   0000 0000 00C0 003C
        DECLE   $0003,  $0000,  $0000,  $0000   ; D382   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0080   ; D386   0000 0000 0000 0080
        DECLE   $0040,  $0040,  $0020,  $0080   ; D38A   0040 0040 0020 0080
        DECLE   $0080,  $0000,  $0000,  $0000   ; D38E   0080 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; D392   0000 0000 0000 0010
        DECLE   $0010,  $0020,  $003F,  $0040   ; D396   0010 0020 003F 0040
        DECLE   $0040,  $0080,  $0080,  $0000   ; D39A   0040 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D39E   0000 0000 0000 0000
        DECLE   $0000,  $00C0,  $0030,  $0001   ; D3A2   0000 00C0 0030 0001
        DECLE   $0001,  $0002,  $0002,  $0004   ; D3A6   0001 0002 0002 0004
        DECLE   $0004,  $0008,  $0008,  $0008   ; D3AA   0004 0008 0008 0008
        DECLE   $0008,  $0008,  $0010,  $0010   ; D3AE   0008 0008 0010 0010
        DECLE   $0010,  $0010,  $00FF,  $00C0   ; D3B2   0010 0010 00FF 00C0
        DECLE   $0038,  $0007,  $0000,  $0000   ; D3B6   0038 0007 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3BA   0000 0000 0000 0000
        DECLE   $0000,  $0080,  $0040,  $0020   ; D3BE   0000 0080 0040 0020
        DECLE   $0010,  $000C,  $0003,  $0010   ; D3C2   0010 000C 0003 0010
        DECLE   $0008,  $0008,  $0008,  $0004   ; D3C6   0008 0008 0008 0004
        DECLE   $0004,  $0002,  $0002,  $0001   ; D3CA   0004 0002 0002 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; D3CE   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; D3D2   0000 0000 0000 0004
        DECLE   $0008,  $0008,  $0008,  $0010   ; D3D6   0008 0008 0008 0010
        DECLE   $0010,  $0010,  $0010,  $0000   ; D3DA   0010 0010 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D3DE   0000 0000 0000 0001
        DECLE   $0002,  $0002,  $0004,  $0000   ; D3E2   0002 0002 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D3E6   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $000C,  $0000   ; D3EA   0000 0003 000C 0000
        DECLE   $0000,  $0000,  $0003,  $003C   ; D3EE   0000 0000 0003 003C
        DECLE   $00C0,  $0000,  $0000,  $0010   ; D3F2   00C0 0000 0000 0010
        DECLE   $0010,  $0010,  $0008,  $0008   ; D3F6   0010 0010 0008 0008
        DECLE   $0008,  $0008,  $00FF,  $0001   ; D3FA   0008 0008 00FF 0001
        DECLE   $0001,  $0002,  $0002,  $0004   ; D3FE   0001 0002 0002 0004
        DECLE   $0004,  $0008,  $0008,  $0008   ; D402   0004 0008 0008 0008
        DECLE   $0008,  $0004,  $0004,  $0002   ; D406   0008 0004 0004 0002
        DECLE   $0002,  $0001,  $00FF,  $0008   ; D40A   0002 0001 00FF 0008
        DECLE   $0008,  $0004,  $00FC,  $0002   ; D40E   0008 0004 00FC 0002
        DECLE   $0002,  $0001,  $0001,  $007F   ; D412   0002 0001 0001 007F
        DECLE   $0078,  $0062,  $0061,  $0040   ; D416   0078 0062 0061 0040
        DECLE   $0040,  $0080,  $0081,  $00FF   ; D41A   0040 0080 0081 00FF
        DECLE   $0000,  $00AA,  $0054,  $00A8   ; D41E   0000 00AA 0054 00A8
        DECLE   $0050,  $00A8,  $0054,  $0007   ; D422   0050 00A8 0054 0007
        DECLE   $0018,  $0020,  $0040,  $0040   ; D426   0018 0020 0040 0040
        DECLE   $0080,  $0080,  $0080,  $0080   ; D42A   0080 0080 0080 0080
        DECLE   $0080,  $0040,  $0040,  $0020   ; D42E   0080 0040 0040 0020
        DECLE   $0018,  $0007,  $0001,  $00C0   ; D432   0018 0007 0001 00C0
        DECLE   $0030,  $0008,  $0004,  $0004   ; D436   0030 0008 0004 0004
        DECLE   $0002,  $0002,  $0002,  $0002   ; D43A   0002 0002 0002 0002
        DECLE   $0002,  $0004,  $0004,  $0008   ; D43E   0002 0004 0004 0008
        DECLE   $0030,  $00C0,  $0000,  $0004   ; D442   0030 00C0 0000 0004
        DECLE   $0004,  $0004,  $0004,  $0008   ; D446   0004 0004 0004 0008
        DECLE   $0008,  $0008,  $0008,  $0020   ; D44A   0008 0008 0008 0020
        DECLE   $0020,  $0020,  $0020,  $0010   ; D44E   0020 0020 0020 0010
        DECLE   $0010,  $0010,  $0010,  $0000   ; D452   0010 0010 0010 0000
        DECLE   $0000,  $003C,  $003C,  $003C   ; D456   0000 003C 003C 003C
        DECLE   $0000,  $0000,  $0000,  $00FE   ; D45A   0000 0000 0000 00FE
        DECLE   $001B,  $00FB,  $003F,  $00FE   ; D45E   001B 00FB 003F 00FE
        DECLE   $0077,  $00F7,  $0000,  $00F8   ; D462   0077 00F7 0000 00F8
        DECLE   $0078,  $007E,  $007B,  $007B   ; D466   0078 007E 007B 007B
        DECLE   $007F,  $007E,  $0000,  $0001   ; D46A   007F 007E 0000 0001
        DECLE   $0002,  $0000,  $0000,  $0002   ; D46E   0002 0000 0000 0002
        DECLE   $0002,  $0007,  $0008,  $0005   ; D472   0002 0007 0008 0005
        DECLE   $0006,  $0007,  $0006,  $0005   ; D476   0006 0007 0006 0005
        DECLE   $0008,  $0005,  $0004,  $001F   ; D47A   0008 0005 0004 001F
        DECLE   $01F0,  $00FF,  $0001,  $003F   ; D47E   01F0 00FF 0001 003F
        DECLE   $01F0,  $0001,  $01F2,  $00BF   ; D482   01F0 0001 01F2 00BF
        DECLE   $0001,  $01F0,  $0001,  $003F   ; D486   0001 01F0 0001 003F
        DECLE   $01F0,  $0001,  $0372,  $002F   ; D48A   01F0 0001 0372 002F
        DECLE   $0001,  $01A1,  $003F,  $0001   ; D48E   0001 01A1 003F 0001
        DECLE   $01A1,  $002F,  $0001,  $0360   ; D492   01A1 002F 0001 0360
        DECLE   $0001                           ; D496   0001

        ADCR    R7                              ; D497   002F

        XORR    R6,     R0                      ; D498   01F0
L_D499:
        CMP@    R6,     R0                      ; D499   0370
        DECLE   $00FF,  $0001,  $0360,  $01F0   ; D49A   00FF 0001 0360 01F0
        DECLE   $0370,  $0023,  $0001,  $00DF   ; D49E   0370 0023 0001 00DF
        DECLE   $00F4,  $0001,  $0033,  $0360   ; D4A2   00F4 0001 0033 0360
        DECLE   $0123,  $0035,  $01D6,  $001F   ; D4A6   0123 0035 01D6 001F
        DECLE   $00D4,  $00D6,  $0116,  $001F   ; D4AA   00D4 00D6 0116 001F
        DECLE   $0001,  $0014,  $002F,  $0001   ; D4AE   0001 0014 002F 0001
        DECLE   $01A6,  $01B6,  $001F,  $00D4   ; D4B2   01A6 01B6 001F 00D4
        DECLE   $0046,  $0025,  $0013,  $0025   ; D4B6   0046 0025 0013 0025
        DECLE   $0203,  $0213,  $001F,  $00F4   ; D4BA   0203 0213 001F 00F4
        DECLE   $0001,  $0397,  $00E6,  $0001   ; D4BE   0001 0397 00E6 0001
        DECLE   $0014,  $001F,  $0001,  $0196   ; D4C2   0014 001F 0001 0196
        DECLE   $0387,  $0001,  $001F,  $00F4   ; D4C6   0387 0001 001F 00F4
        DECLE   $0073,  $0063,  $0035,  $0053   ; D4CA   0073 0063 0035 0053
        DECLE   $01D6,  $001F,  $0001,  $0266   ; D4CE   01D6 001F 0001 0266
        DECLE   $0246,  $0001,  $00C6,  $0001   ; D4D2   0246 0001 00C6 0001
        DECLE   $0226,  $0246,  $0001,  $0186   ; D4D6   0226 0246 0001 0186
        DECLE   $0001,  $0226,  $0276,  $001F   ; D4DA   0001 0226 0276 001F
        DECLE   $0001,  $0046,  $0003,  $0001   ; D4DE   0001 0046 0003 0001
        DECLE   $0086,  $001F,  $00F4,  $0136   ; D4E2   0086 001F 00F4 0136
        DECLE   $0256,  $0001,  $00B6,  $0001   ; D4E6   0256 0001 00B6 0001
        DECLE   $0236,  $0256,  $0001,  $0166   ; D4EA   0236 0256 0001 0166
        DECLE   $0001,  $0236,  $01C6,  $001F   ; D4EE   0001 0236 01C6 001F
        DECLE   $00F4,  $01E6,  $0001,  $01D6   ; D4F2   00F4 01E6 0001 01D6
        DECLE   $004F,  $0001,  $0096,  $00F6   ; D4F6   004F 0001 0096 00F6
        DECLE   $0001,  $0014,  $001F,  $0001   ; D4FA   0001 0014 001F 0001
        DECLE   $0176,  $0156,  $004F,  $0001   ; D4FE   0176 0156 004F 0001
        DECLE   $0046,  $0106,  $003F,  $00D4   ; D502   0046 0106 003F 00D4
        DECLE   $00A6,  $002F,  $0001,  $0014   ; D506   00A6 002F 0001 0014
        DECLE   $003F,  $0001,  $0146,  $003F   ; D50A   003F 0001 0146 003F
        DECLE   $00D4,  $01F6,  $013F,  $00C4   ; D50E   00D4 01F6 013F 00C4
        DECLE   $0203,  $004A,  $0009,  $0210   ; D512   0203 004A 0009 0210
        DECLE   $0051,  $0009,  $0000           ; D516   0051 0009 0000

        PSHR    R5                              ; D519   0275

        JSR     R5,     L_5E9D                  ; D51A   0004 015C 029D

        INCR    R5                              ; D51D   000D
        INCR    R0                              ; D51E   0008
        INCR    R5                              ; D51F   000D
        DIS                                     ; D520   0003

        JSR     R5,     L_5FB6                  ; D521   0004 015C 03B6

        ADCR    R3                              ; D524   002B
        DECR    R5                              ; D525   0015
        MOVR    R2,     R3                      ; D526   0093

        JSR     R5,     L_680E                  ; D527   0004 0168 000E
        DECLE   $0200,  $02F0                   ; D52A   0200 02F0
        BIDECLE $946D,  $947D                   ; D52C   006D 0094 007D 0094

        SDBD                                    ; D530   0001
        MVII    #$9512, R4                      ; D531   02BC 0012 0095

        JSR     R5,     L_6836                  ; D534   0004 0168 0036
        JSR     R5,     L_5EB2                  ; D537   0004 015C 02B2
        DECLE   $0205,  $020F,  $0212,  $0213   ; D53A   0205 020F 0212 0213
        DECLE   $0219,  $0223,  $022B,  $022C   ; D53E   0219 0223 022B 022C
        DECLE   $022D,  $0237,  $0238,  $0239   ; D542   022D 0237 0238 0239
        DECLE   $023A,  $023B,  $023C,  $0000   ; D546   023A 023B 023C 0000

        JSR     R5,     L_5153                  ; D54A   0004 0150 0153
        JSR     R5,     L_50E8                  ; D54D   0004 0150 00E8
        JSR     R5,     L_511A                  ; D550   0004 0150 011A
        DECLE   $0004                           ; D553   0004

        ANDR    R5,     R4                      ; D554   01AC
        MOVR    R0,     R5                      ; D555   0085
        PULR    R7                              ; D556   02B7

        DECLE   $0000,  $0000,  $0006,  $0006   ; D557   0000 0000 0006 0006
        DECLE   $000C,  $000C,  $000C,  $0000   ; D55B   000C 000C 000C 0000
        DECLE   $000C,  $000C,  $000C,  $003C   ; D55F   000C 000C 000C 003C
        DECLE   $0028,  $0028,  $0008,  $000C   ; D563   0028 0028 0008 000C
        DECLE   $0000,  $0000,  $000C,  $000C   ; D567   0000 0000 000C 000C
        DECLE   $0038,  $0038,  $003C,  $0000   ; D56B   0038 0038 003C 0000
        DECLE   $001C,  $003E,  $0022,  $002E   ; D56F   001C 003E 0022 002E
        DECLE   $0028,  $0020,  $0020,  $0010   ; D573   0028 0020 0020 0010
        DECLE   $0000,  $0000                   ; D577   0000 0000

        CLRC                                    ; D579   0006
        CLRC                                    ; D57A   0006
        COMR    R4                              ; D57B   001C
        RSWD    R4                              ; D57C   003C
        ADCR    R7                              ; D57D   002F

        NEGR    R0                              ; D57E   0020
L_D57F:
        COMR    R4                              ; D57F   001C
        DECLE   $003F,  $0021,  $0027,  $0024   ; D580   003F 0021 0027 0024
        DECLE   $0044,  $0040,  $0040,  $0000   ; D584   0044 0040 0040 0000
        DECLE   $0000,  $000C,  $000C,  $0078   ; D588   0000 000C 000C 0078
        DECLE   $0058,  $005F,  $0000,  $0018   ; D58C   0058 005F 0000 0018
        DECLE   $003F,  $0021,  $0062,  $0042   ; D590   003F 0021 0062 0042
        DECLE   $00C0,  $0080,  $0080,  $0000   ; D594   00C0 0080 0080 0000
        DECLE   $0000                           ; D598   0000

        INCR    R4                              ; D599   000C
        INCR    R4                              ; D59A   000C
        ADDR    R7,     R0                      ; D59B   00F8
        MOVR    R3,     R7                      ; D59C   009F

        DECLE   $0018,  $0000,  $0018,  $003F   ; D59D   0018 0000 0018 003F
        DECLE   $0021,  $0061,  $0040,  $00C0   ; D5A1   0021 0061 0040 00C0
        DECLE   $0080,  $0000,  $0000,  $0000   ; D5A5   0080 0000 0000 0000
        DECLE   $000C,  $000C,  $0078,  $0058   ; D5A9   000C 000C 0078 0058
        DECLE   $005F,  $0000,  $0018,  $003C   ; D5AD   005F 0000 0018 003C
        DECLE   $0024,  $0066,  $00C2,  $0082   ; D5B1   0024 0066 00C2 0082
        DECLE   $0003,  $0000,  $0000,  $0000   ; D5B5   0003 0000 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0078   ; D5B9   000C 000C 0038 0078
        DECLE   $005E,  $0040,  $0038,  $003C   ; D5BD   005E 0040 0038 003C
        DECLE   $0024,  $00E4,  $0084,  $0084   ; D5C1   0024 00E4 0084 0084
        DECLE   $0004,  $0006,  $0000,  $0000   ; D5C5   0004 0006 0000 0000
        DECLE   $000C,  $000C,  $0038,  $0038   ; D5C9   000C 000C 0038 0038
        DECLE   $003C,  $0000,  $0018,  $0018   ; D5CD   003C 0000 0018 0018
        DECLE   $0018,  $0078,  $0048,  $0048   ; D5D1   0018 0078 0048 0048
        DECLE   $0008,  $000C,  $0000,  $0000   ; D5D5   0008 000C 0000 0000
        DECLE   $0018,  $0018,  $0078,  $0074   ; D5D9   0018 0018 0078 0074
        DECLE   $00B3,  $0080,  $0038,  $0038   ; D5DD   00B3 0080 0038 0038
        DECLE   $0024,  $0014,  $0012,  $0012   ; D5E1   0024 0014 0012 0012
        DECLE   $0024,  $0036,  $0040,  $00A0   ; D5E5   0024 0036 0040 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; D5E9   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5ED   0000 0000 0000 0000
        DECLE   $0000,  $0040,  $00A0,  $0040   ; D5F1   0000 0040 00A0 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; D5F5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0040   ; D5F9   0000 0000 0000 0040
        DECLE   $00A0,  $0040,  $0000,  $0000   ; D5FD   00A0 0040 0000 0000
        DECLE   $0040,  $00A0,  $0040,  $0000   ; D601   0040 00A0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D605   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D609   0000 0000 0000 0000
        DECLE   $0000,  $00E0,  $0000,  $0001   ; D60D   0000 00E0 0000 0001
        DECLE   $0099,  $0099,  $00F2,  $0034   ; D611   0099 0099 00F2 0034
        DECLE   $0030,  $0000,  $0038,  $0024   ; D615   0030 0000 0038 0024
        DECLE   $0012,  $0011,  $0011,  $0022   ; D619   0012 0011 0011 0022
        DECLE   $0044,  $0066,  $0000,  $0001   ; D61D   0044 0066 0000 0001
        DECLE   $0099,  $0099,  $00F2,  $0034   ; D621   0099 0099 00F2 0034
        DECLE   $0030,  $0000,  $0038,  $0028   ; D625   0030 0000 0038 0028
        DECLE   $0014,  $0014,  $0014,  $0028   ; D629   0014 0014 0014 0028
        DECLE   $0048,  $006C,  $0000,  $0000   ; D62D   0048 006C 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; D631   0000 0006 000E 0018
        DECLE   $0038,  $000E,  $0030,  $0030   ; D635   0038 000E 0030 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; D639   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D63D   0010 0018 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; D641   0000 0006 000E 0018
        DECLE   $0038,  $0008,  $0036,  $0030   ; D645   0038 0008 0036 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; D649   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D64D   0010 0018 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; D651   0000 0006 000E 0018
        DECLE   $0038,  $0008,  $0036,  $0032   ; D655   0038 0008 0036 0032
        DECLE   $0010,  $0008,  $0008,  $0010   ; D659   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D65D   0010 0018 0000 0000
        DECLE   $0000,  $0006,  $000E,  $0018   ; D661   0000 0006 000E 0018
        DECLE   $0038,  $0008,  $0036,  $0030   ; D665   0038 0008 0036 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; D669   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D66D   0010 0018 0000 0000
        DECLE   $0018,  $0018,  $0031,  $003A   ; D671   0018 0018 0031 003A
        DECLE   $0034,  $0000,  $0030,  $0030   ; D675   0034 0000 0030 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; D679   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D67D   0010 0018 0000 0000
        DECLE   $0030,  $0032,  $0022,  $003C   ; D681   0030 0032 0022 003C
        DECLE   $0030,  $0000,  $0030,  $0030   ; D685   0030 0000 0030 0030
        DECLE   $0010,  $0008,  $0008,  $0010   ; D689   0010 0008 0008 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D68D   0010 0018 0000 0000
        DECLE   $0064,  $0064,  $003C,  $0030   ; D691   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; D695   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0020,  $0020   ; D699   0010 0010 0020 0020
        DECLE   $0020,  $0030,  $0000,  $0008   ; D69D   0020 0030 0000 0008
        DECLE   $0064,  $0062,  $003C,  $0030   ; D6A1   0064 0062 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; D6A5   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; D6A9   0010 0010 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0006   ; D6AD   0010 0018 0000 0006
        DECLE   $0064,  $0064,  $003C,  $0030   ; D6B1   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; D6B5   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; D6B9   0010 0010 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D6BD   0010 0018 0000 0000
        DECLE   $0018,  $0018,  $0031,  $003A   ; D6C1   0018 0018 0031 003A
        DECLE   $0034,  $0000,  $0030,  $0030   ; D6C5   0034 0000 0030 0030
        DECLE   $0008,  $0004,  $0004,  $0008   ; D6C9   0008 0004 0004 0008
        DECLE   $001C,  $0000,  $0000,  $0000   ; D6CD   001C 0000 0000 0000
        DECLE   $0030,  $0032,  $0032,  $003C   ; D6D1   0030 0032 0032 003C
        DECLE   $0030,  $0000,  $0030,  $0030   ; D6D5   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0020   ; D6D9   0010 0010 0010 0020
        DECLE   $0020,  $0010,  $0000,  $0000   ; D6DD   0020 0010 0000 0000
        DECLE   $0064,  $0064,  $003C,  $0030   ; D6E1   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $003C   ; D6E5   0030 0000 0030 003C
        DECLE   $0006,  $0004,  $0008,  $0008   ; D6E9   0006 0004 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0008   ; D6ED   0000 0000 0000 0008
        DECLE   $0064,  $0062,  $003C,  $0030   ; D6F1   0064 0062 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0018   ; D6F5   0030 0000 0030 0018
        DECLE   $000C,  $0004,  $003C,  $0020   ; D6F9   000C 0004 003C 0020
        DECLE   $0000,  $0000,  $0000,  $0006   ; D6FD   0000 0000 0000 0006
        DECLE   $0064,  $0064,  $003C,  $0030   ; D701   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; D705   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0008,  $0008   ; D709   0010 0010 0008 0008
        DECLE   $0006,  $0000,  $0000,  $0006   ; D70D   0006 0000 0000 0006
        DECLE   $0064,  $0064,  $003C,  $0030   ; D711   0064 0064 003C 0030
        DECLE   $0030,  $0000,  $0030,  $0030   ; D715   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0010   ; D719   0010 0010 0010 0010
        DECLE   $0010,  $0018,  $0000,  $0000   ; D71D   0010 0018 0000 0000
        DECLE   $0018,  $0018,  $0031,  $003A   ; D721   0018 0018 0031 003A
        DECLE   $0034,  $0000,  $0030,  $0030   ; D725   0034 0000 0030 0030
        DECLE   $0008,  $0004,  $0004,  $0008   ; D729   0008 0004 0004 0008
        DECLE   $001C,  $0000,  $0000,  $0000   ; D72D   001C 0000 0000 0000
        DECLE   $0030,  $0032,  $0024,  $0038   ; D731   0030 0032 0024 0038
        DECLE   $0030,  $0000,  $0030,  $0030   ; D735   0030 0000 0030 0030
        DECLE   $0010,  $0010,  $0010,  $0020   ; D739   0010 0010 0010 0020
        DECLE   $0020,  $0010,  $0000,  $0010   ; D73D   0020 0010 0000 0010
        DECLE   $0068,  $0064,  $0038,  $0030   ; D741   0068 0064 0038 0030
        DECLE   $0030,  $0000,  $0030,  $0018   ; D745   0030 0000 0030 0018
        DECLE   $000C,  $0004,  $0008,  $0010   ; D749   000C 0004 0008 0010
        DECLE   $0008,  $0000,  $0020,  $0010   ; D74D   0008 0000 0020 0010
        DECLE   $0068,  $0068,  $0030,  $0030   ; D751   0068 0068 0030 0030
        DECLE   $0030,  $0000,  $0030,  $0018   ; D755   0030 0000 0030 0018
        DECLE   $000C,  $0004,  $0038,  $0020   ; D759   000C 0004 0038 0020
        DECLE   $0000,  $0000,  $0000,  $0003   ; D75D   0000 0000 0000 0003
        DECLE   $0064,  $0068,  $0030,  $0030   ; D761   0064 0068 0030 0030
        DECLE   $0030,  $0000                   ; D765   0030 0000

        GSWD    R0                              ; D767   0030
        COMR    R0                              ; D768   0018
        INCR    R4                              ; D769   000C

        JSR     R4,     .EXEC.C28               ; D76A   0004 001C 0028
        DECLE   $0024,  $0000,  $0000,  $0000   ; D76D   0024 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D771   0000 0000 0000 0000
        DECLE   $0018,  $00DB,  $00A4,  $003C   ; D775   0018 00DB 00A4 003C
        DECLE   $0000,  $007E,  $0086,  $0062   ; D779   0000 007E 0086 0062
        DECLE   $0012,  $0063,  $0000,  $0000   ; D77D   0012 0063 0000 0000
        DECLE   $0000,  $0018,  $0019,  $007F   ; D781   0000 0018 0019 007F
        DECLE   $0058,  $0058,  $0000,  $001C   ; D785   0058 0058 0000 001C
        DECLE   $0014,  $0022,  $0022,  $0022   ; D789   0014 0022 0022 0022
        DECLE   $0024,  $0066,  $0000,  $0000   ; D78D   0024 0066 0000 0000
        DECLE   $001A,  $0002,  $003C,  $0058   ; D791   001A 0002 003C 0058
        DECLE   $0058,  $0000,  $0038,  $0024   ; D795   0058 0000 0038 0024
        DECLE   $0024,  $0024,  $0024,  $0028   ; D799   0024 0024 0024 0028
        DECLE   $0008,  $000C,  $0001           ; D79D   0008 000C 0001

        EIS                                     ; D7A0   0002
        EIS                                     ; D7A1   0002
        COMR    R2                              ; D7A2   001A

        JSR     R4,     .EXEC.C2C               ; D7A3   0004 001C 002C
        DECLE   $0044,  $0088,  $003C,  $0024   ; D7A6   0044 0088 003C 0024
        DECLE   $0024,  $0064,  $0008,  $0008   ; D7AA   0024 0064 0008 0008
        DECLE   $000C,  $0021,  $0021,  $005A   ; D7AE   000C 0021 0021 005A
        DECLE   $005C,  $0038,  $0018,  $0018   ; D7B2   005C 0038 0018 0018
        DECLE   $0000,  $0018,  $0018,  $0028   ; D7B6   0000 0018 0018 0028
        DECLE   $0028,  $0028,  $0050,  $0050   ; D7BA   0028 0028 0050 0050
        DECLE   $0028,  $0048,  $0084,  $00B4   ; D7BE   0028 0048 0084 00B4
        DECLE   $00B4,  $00FC,  $0030,  $0030   ; D7C2   00B4 00FC 0030 0030
        DECLE   $0000,  $0038,  $0028,  $0024   ; D7C6   0000 0038 0028 0024
        DECLE   $0022,  $0022,  $0024,  $0024   ; D7CA   0022 0022 0024 0024
        DECLE   $0026,  $0000,  $0080,  $00B0   ; D7CE   0026 0000 0080 00B0
        DECLE   $00B0,  $00FC,  $0032,  $0031   ; D7D2   00B0 00FC 0032 0031
        DECLE   $0000,  $0038,  $0028,  $0024   ; D7D6   0000 0038 0028 0024
        DECLE   $0022,  $0022,  $0024,  $0024   ; D7DA   0022 0022 0024 0024
        DECLE   $0026,  $0000,  $0000,  $0000   ; D7DE   0026 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D7E2   0000 0000 0000 0000
        DECLE   $0000,  $0010,  $0019,  $003B   ; D7E6   0000 0010 0019 003B
        DECLE   $003F                           ; D7EA   003F

        SARC    R2,     2                       ; D7EB   007E
        SARC    R0,     2                       ; D7EC   007C
        ADDR    R7,     R0                      ; D7ED   00F8
        ADDR    R6,     R0                      ; D7EE   00F0
        GSWD    R0                              ; D7EF   0030
        RSWD    R0                              ; D7F0   0038
        SLL     R0,     2                       ; D7F1   004C
        RRC     R0,     2                       ; D7F2   0074
        RSWD    R4                              ; D7F3   003C
        COMR    R6                              ; D7F4   001E
        COMR    R6                              ; D7F5   001E
        COMR    R6                              ; D7F6   001E
        COMR    R6                              ; D7F7   001E
        INCR    R6                              ; D7F8   000E
        INCR    R7                              ; D7F9   000F

        SETC                                    ; D7FA   0007
L_D7FB:
        SETC                                    ; D7FB   0007
        INCR    R7                              ; D7FC   000F
        INCR    R7                              ; D7FD   000F
L_D7FE:
        INCR    R7                              ; D7FE   000F

L_D7FF:
        DECR    R0                              ; D7FF   0010
L_D800:
        ADDR    R4,     R0                      ; D800   00E0
        DECLE   $00C0,  $0080,  $0080,  $0080   ; D801   00C0 0080 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; D805   0000 0000 0000 0000
        DECLE   $00A2,  $0080,  $0041,  $0063   ; D809   00A2 0080 0041 0063
        DECLE   $003E,  $001C,  $00E0,  $0080   ; D80D   003E 001C 00E0 0080
        DECLE   $0040,  $0040,  $0000,  $0020   ; D811   0040 0040 0000 0020
        DECLE   $0020,  $0000,  $0000,  $0008   ; D815   0020 0000 0000 0008
        DECLE   $0000,  $0004,  $0000,  $0000   ; D819   0000 0004 0000 0000
        DECLE   $0002,  $0000,  $0040,  $0000   ; D81D   0002 0000 0040 0000
        DECLE   $0020,  $0000,  $0010,  $0004   ; D821   0020 0000 0010 0004
        DECLE   $0000,  $0020,  $0020,  $0040   ; D825   0000 0020 0020 0040
        DECLE   $0040,  $0080,  $0080,  $0000   ; D829   0040 0080 0080 0000
        DECLE   $0040,  $003F,  $0024,  $0004   ; D82D   0040 003F 0024 0004

        MOVR    R0,     R4                      ; D831   0084

        JSR     R4,     L_DC04                  ; D832   0004 00DC 0004
        DECLE   $00DC,  $0094,  $0004,  $0002   ; D835   00DC 0094 0004 0002
        DECLE   $0062,  $0002,  $0002,  $00E2   ; D839   0062 0002 0002 00E2
        DECLE   $0001,  $0041,  $0000,  $0000   ; D83D   0001 0041 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D841   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0080,  $0080   ; D845   0000 0000 0080 0080
        DECLE   $00FD,  $00FD,  $0000,  $0000   ; D849   00FD 00FD 0000 0000
        DECLE   $0000,  $0000,  $0040,  $00C0   ; D84D   0000 0000 0040 00C0
        DECLE   $00C0,  $00C0,  $00C0,  $0040   ; D851   00C0 00C0 00C0 0040
        DECLE   $0060,  $0020,  $0010,  $0000   ; D855   0060 0020 0010 0000
        DECLE   $0020,  $0060,  $00E0,  $00C0   ; D859   0020 0060 00E0 00C0
        DECLE   $007F,  $0000,  $0000           ; D85D   007F 0000 0000

        ADDR    R4,     R7                      ; D860   00E7

        DECLE   $0000,  $00C3,  $0000,  $0083   ; D861   0000 00C3 0000 0083
        DECLE   $0000,  $00BB,  $00FF,  $00FF   ; D865   0000 00BB 00FF 00FF
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; D869   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; D86D   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; D871   0000 0000 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $00FF   ; D875   0000 0000 0000 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D879   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0081   ; D87D   00FF 00FF 00FF 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; D881   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; D885   0081 0081 0081 0081
        DECLE   $00FF,  $0081,  $00FF,  $00FF   ; D889   00FF 0081 00FF 00FF
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; D88D   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D891   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D895   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; D899   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0018,  $0018   ; D89D   00FF 00FF 0018 0018
        DECLE   $003C,  $003C,  $003E,  $003E   ; D8A1   003C 003C 003E 003E
        DECLE   $001E,  $0016,  $003D,  $006C   ; D8A5   001E 0016 003D 006C
        DECLE   $004C,  $0044,  $0044,  $0044   ; D8A9   004C 0044 0044 0044
        DECLE   $00CC,  $00CC,  $0100,  $0000   ; D8AD   00CC 00CC 0100 0000
        DECLE   $0000,  $0000,  $0004,  $001B   ; D8B1   0000 0000 0004 001B
        DECLE   $0000,  $0100,  $0000,  $0000   ; D8B5   0000 0100 0000 0000
        DECLE   $0000,  $0004,  $0012,  $0000   ; D8B9   0000 0004 0012 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; D8BD   0100 0000 0000 0000
        DECLE   $0001,  $0016,  $0000,  $0100   ; D8C1   0001 0016 0000 0100
        DECLE   $0000,  $0000,  $0000,  $0001   ; D8C5   0000 0000 0000 0001
        DECLE   $0012,  $0004,  $00EE,  $01AD   ; D8C9   0012 0004 00EE 01AD
        DECLE   $02EE,  $00AD,  $0100,  $0000   ; D8CD   02EE 00AD 0100 0000
        DECLE   $0070,  $005D,  $0001,  $004B   ; D8D1   0070 005D 0001 004B
        DECLE   $0002,  $0024,  $005D,  $0100   ; D8D5   0002 0024 005D 0100
        DECLE   $0000,  $00B3,  $005C,  $0001   ; D8D9   0000 00B3 005C 0001
        DECLE   $0012,  $000C,  $0019,  $015C   ; D8DD   0012 000C 0019 015C
        DECLE   $0219,  $005C,  $0219,  $015C   ; D8E1   0219 005C 0219 015C
        DECLE   $0119,  $005C,  $0119,  $015C   ; D8E5   0119 005C 0119 015C
        DECLE   $0319,  $005C,  $0100,  $0000   ; D8E9   0319 005C 0100 0000
        DECLE   $00B3,  $005C,  $0001,  $0012   ; D8ED   00B3 005C 0001 0012
        DECLE   $000C,  $0019,  $015C,  $0219   ; D8F1   000C 0019 015C 0219
        DECLE   $005C,  $0219,  $015C,  $0119   ; D8F5   005C 0219 015C 0119
        DECLE   $005C,  $0119,  $015C,  $0319   ; D8F9   005C 0119 015C 0319
        DECLE   $005C,  $0100,  $0000,  $003B   ; D8FD   005C 0100 0000 003B
        DECLE   $005B,  $0001,  $0012,  $0000   ; D901   005B 0001 0012 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; D905   0300 0000 0000 0000

        EIS                                     ; D909   0002
L_D90A:
        DECR    R7                              ; D90A   0017

        DECLE   $000C,  $0079,  $0158,  $0279   ; D90B   000C 0079 0158 0279
        DECLE   $0058,  $0279,  $0158,  $0179   ; D90F   0058 0279 0158 0179
        DECLE   $0058,  $0179,  $0158,  $0379   ; D913   0058 0179 0158 0379
        DECLE   $0058,  $0300,  $0000,  $00C3   ; D917   0058 0300 0000 00C3
        DECLE   $00AD,  $0004,  $0043,  $0000   ; D91B   00AD 0004 0043 0000
        DECLE   $0100,  $0000,  $0000,  $0000   ; D91F   0100 0000 0000 0000
        DECLE   $0002,  $004D,  $0000,  $0100   ; D923   0002 004D 0000 0100
        DECLE   $0000,  $0035,  $00AD,  $0008   ; D927   0000 0035 00AD 0008
        DECLE   $0000,  $0000,  $0100,  $0000   ; D92B   0000 0000 0100 0000
        DECLE   $0000,  $0000,  $0001,  $0010   ; D92F   0000 0000 0001 0010
        DECLE   $0000,  $0100,  $0000,  $00DA   ; D933   0000 0100 0000 00DA
        DECLE   $005A,  $0005,  $0023,  $000C   ; D937   005A 0005 0023 000C
        DECLE   $00CC,  $0157,  $02CC,  $0057   ; D93B   00CC 0157 02CC 0057
        DECLE   $02CC,  $0157,  $01CC,  $0057   ; D93F   02CC 0157 01CC 0057
        DECLE   $01CC,  $0157,  $03CC,  $0057   ; D943   01CC 0157 03CC 0057
        DECLE   $0100,  $0000,  $00DA,  $005A   ; D947   0100 0000 00DA 005A
        DECLE   $0006,  $002D,  $000C,  $00CC   ; D94B   0006 002D 000C 00CC
        DECLE   $0157,  $02CC,  $0057,  $02CC   ; D94F   0157 02CC 0057 02CC
        DECLE   $0157,  $01CC,  $0057,  $01CC   ; D953   0157 01CC 0057 01CC
        DECLE   $0157,  $03CC,  $0057,  $0100   ; D957   0157 03CC 0057 0100
        DECLE   $0000,  $00DA,  $005A,  $0005   ; D95B   0000 00DA 005A 0005
        DECLE   $0039,  $000C,  $00CC,  $0157   ; D95F   0039 000C 00CC 0157
        DECLE   $02CC,  $0057,  $02CC,  $0157   ; D963   02CC 0057 02CC 0157
        DECLE   $01CC,  $0057,  $01CC,  $0157   ; D967   01CC 0057 01CC 0157
        DECLE   $03CC,  $0057,  $0300,  $0000   ; D96B   03CC 0057 0300 0000
        DECLE   $0000,  $0000,  $0008,  $0000   ; D96F   0000 0000 0008 0000
        DECLE   $000C,  $0079,  $0158,  $0279   ; D973   000C 0079 0158 0279
        DECLE   $0058,  $0279,  $0158,  $0179   ; D977   0058 0279 0158 0179
        DECLE   $0058,  $0179,  $0158,  $0379   ; D97B   0058 0179 0158 0379
        DECLE   $0058,  $0100,  $0000,  $0069   ; D97F   0058 0100 0000 0069
        DECLE   $005C,  $0001,  $0012,  $000C   ; D983   005C 0001 0012 000C
        DECLE   $0030,  $015C,  $0230,  $005C   ; D987   0030 015C 0230 005C
        DECLE   $0230,  $015C,  $0130,  $005C   ; D98B   0230 015C 0130 005C
        DECLE   $0130,  $015C,  $0330,  $005C   ; D98F   0130 015C 0330 005C
        DECLE   $0000,  $0000,  $00FD,  $0061   ; D993   0000 0000 00FD 0061
        DECLE   $0008,  $0000,  $0000,  $0000   ; D997   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D99B   0000 0000 0000 0001
        DECLE   $0010,  $0000,  $0000,  $0000   ; D99F   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0051   ; D9A3   0000 0000 0001 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9A7   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0053,  $0000   ; D9AB   0000 0001 0053 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9AF   0000 0000 0000 0000
        DECLE   $0001,  $0055,  $0000,  $0000   ; D9B3   0001 0055 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D9B7   0000 0000 0000 0001
        DECLE   $0057,  $0000,  $0000,  $0000   ; D9BB   0057 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0059   ; D9BF   0000 0000 0001 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9C3   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $005B,  $0000   ; D9C7   0000 0001 005B 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9CB   0000 0000 0000 0000
        DECLE   $0001,  $005D,  $0000,  $0000   ; D9CF   0001 005D 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D9D3   0000 0000 0000 0001
        DECLE   $005F,  $0000,  $0000,  $0000   ; D9D7   005F 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0061   ; D9DB   0000 0000 0001 0061
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9DF   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0062,  $0000   ; D9E3   0000 0001 0062 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9E7   0000 0000 0000 0000
        DECLE   $0001,  $0064,  $0000,  $0000   ; D9EB   0001 0064 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; D9EF   0000 0000 0000 0001
        DECLE   $0065,  $0000,  $0000,  $0000   ; D9F3   0065 0000 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0067   ; D9F7   0000 0000 0001 0067
        DECLE   $0000,  $0000,  $0000,  $0000   ; D9FB   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0067,  $0000   ; D9FF   0000 0001 0067 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; DA03   0000 0000 0000 0000
        DECLE   $0001,  $0069,  $0000,  $004C   ; DA07   0001 0069 0000 004C
        DECLE   $0065,  $0067,  $0073,  $0000   ; DA0B   0065 0067 0073 0000
        DECLE   $0052,  $006F,  $0062,  $0069   ; DA0F   0052 006F 0062 0069
        DECLE   $006E,  $0073,  $006F,  $006E   ; DA13   006E 0073 006F 006E
        DECLE   $0000,  $0042,  $0069,  $0067   ; DA17   0000 0042 0069 0067
        DECLE   $0020,  $0041,  $006C,  $0000   ; DA1B   0020 0041 006C 0000
        DECLE   $0043,  $006F,  $006F,  $0070   ; DA1F   0043 006F 006F 0070
        DECLE   $0065,  $0072,  $0000,  $0053   ; DA23   0065 0072 0000 0053
        DECLE   $0074,  $0069,  $006C,  $0074   ; DA27   0074 0069 006C 0074
        DECLE   $0000,  $0043,  $0068,  $0061   ; DA2B   0000 0043 0068 0061
        DECLE   $006D,  $0062,  $0065,  $0072   ; DA2F   006D 0062 0065 0072
        DECLE   $0073,  $0000,  $0042,  $0065   ; DA33   0073 0000 0042 0065
        DECLE   $0061,  $006E,  $0070,  $006F   ; DA37   0061 006E 0070 006F
        DECLE   $006C,  $0065,  $0000,  $0042   ; DA3B   006C 0065 0000 0042
        DECLE   $006F,  $0077,  $0065,  $006E   ; DA3F   006F 0077 0065 006E
        DECLE   $0000,  $0054,  $006F,  $006F   ; DA43   0000 0054 006F 006F
        DECLE   $0074,  $0068,  $0070,  $0069   ; DA47   0074 0068 0070 0069
        DECLE   $0063,  $006B,  $0000,  $0047   ; DA4B   0063 006B 0000 0047
        DECLE   $0072,  $0065,  $0065,  $006E   ; DA4F   0072 0065 0065 006E
        DECLE   $0000,  $0054,  $0068,  $0075   ; DA53   0000 0054 0068 0075
        DECLE   $006E,  $0064,  $0065,  $0072   ; DA57   006E 0064 0065 0072
        DECLE   $0000,  $0044,  $0075,  $006E   ; DA5B   0000 0044 0075 006E
        DECLE   $006B,  $0073,  $0000,  $0042   ; DA5F   006B 0073 0000 0042
        DECLE   $0069,  $0067,  $0066,  $006F   ; DA63   0069 0067 0066 006F
        DECLE   $006F,  $0074,  $0000,  $0042   ; DA67   006F 0074 0000 0042
        DECLE   $0061,  $006B,  $0065,  $0072   ; DA6B   0061 006B 0065 0072
        DECLE   $0000,  $0042,  $006F,  $0061   ; DA6F   0000 0042 006F 0061
        DECLE   $0072,  $0064,  $0073,  $0000   ; DA73   0072 0064 0073 0000
        DECLE   $004D,  $006F,  $0073,  $0065   ; DA77   004D 006F 0073 0065
        DECLE   $0072,  $0000,  $0046,  $006C   ; DA7B   0072 0000 0046 006C
        DECLE   $0061,  $0067,  $0070,  $006F   ; DA7F   0061 0067 0070 006F
        DECLE   $006C,  $0065,  $0000,  $0044   ; DA83   006C 0065 0000 0044
        DECLE   $0061,  $0076,  $0069,  $0073   ; DA87   0061 0076 0069 0073
        DECLE   $0000,  $0054,  $0069,  $006E   ; DA8B   0000 0054 0069 006E
        DECLE   $0079,  $0000,  $0044,  $006F   ; DA8F   0079 0000 0044 006F
        DECLE   $006E,  $0061,  $006C,  $0064   ; DA93   006E 0061 006C 0064
        DECLE   $0073,  $006F,  $006E,  $0000   ; DA97   0073 006F 006E 0000
        DECLE   $0057,  $0068,  $006F,  $0070   ; DA9B   0057 0068 006F 0070
        DECLE   $0070,  $0065,  $0072,  $0000   ; DA9F   0070 0065 0072 0000
        DECLE   $0044,  $006F,  $0072,  $0066   ; DAA3   0044 006F 0072 0066
        DECLE   $006D,  $0061,  $006E,  $0000   ; DAA7   006D 0061 006E 0000
        DECLE   $0054,  $0072,  $0065,  $0065   ; DAAB   0054 0072 0065 0065
        DECLE   $0000,  $0041,  $0064,  $0061   ; DAAF   0000 0041 0064 0061
        DECLE   $006D,  $0073,  $0000,  $0042   ; DAB3   006D 0073 0000 0042
        DECLE   $0061,  $0072,  $0072,  $0065   ; DAB7   0061 0072 0072 0065
        DECLE   $006C,  $0000,  $0053,  $006D   ; DABB   006C 0000 0053 006D
        DECLE   $0069,  $0074,  $0068,  $0000   ; DABF   0069 0074 0068 0000
        DECLE   $004C,  $0061,  $0072,  $0072   ; DAC3   004C 0061 0072 0072
        DECLE   $0079,  $0000,  $0048,  $0061   ; DAC7   0079 0000 0048 0061
        DECLE   $0077,  $006B,  $0000,  $004D   ; DACB   0077 006B 0000 004D
        DECLE   $0069,  $0067,  $0068,  $0074   ; DACF   0069 0067 0068 0074
        DECLE   $0079,  $0020,  $004A,  $006F   ; DAD3   0079 0020 004A 006F
        DECLE   $0065,  $0000,  $004C,  $0065   ; DAD7   0065 0000 004C 0065
        DECLE   $0065,  $0000,  $0050,  $0072   ; DADB   0065 0000 0050 0072
        DECLE   $006F,  $0066,  $0065,  $0073   ; DADF   006F 0066 0065 0073
        DECLE   $0073,  $006F,  $0072,  $0000   ; DAE3   0073 006F 0072 0000
        DECLE   $0051,  $002E,  $0000,  $0044   ; DAE7   0051 002E 0000 0044
        DECLE   $0061,  $0076,  $0065,  $0000   ; DAEB   0061 0076 0065 0000
        DECLE   $0057,  $0069,  $006C,  $006C   ; DAEF   0057 0069 006C 006C
        DECLE   $0069,  $0061,  $006D,  $0073   ; DAF3   0069 0061 006D 0073
        DECLE   $0000,  $004C,  $0075,  $0072   ; DAF7   0000 004C 0075 0072
        DECLE   $0063,  $0068,  $0000,  $0042   ; DAFB   0063 0068 0000 0042
        DECLE   $0075,  $0074,  $006C,  $0065   ; DAFF   0075 0074 006C 0065
        DECLE   $0072,  $0073,  $0000,  $0044   ; DB03   0072 0073 0000 0044
        DECLE   $0065,  $0076,  $006F,  $006E   ; DB07   0065 0076 006F 006E
        DECLE   $0000,  $0042,  $0065,  $0072   ; DB0B   0000 0042 0065 0072
        DECLE   $0072,  $0079,  $0000,  $0042   ; DB0F   0072 0079 0000 0042
        DECLE   $0075,  $0063,  $006B,  $0000   ; DB13   0075 0063 006B 0000
        DECLE   $0042,  $006C,  $0061,  $007A   ; DB17   0042 006C 0061 007A
        DECLE   $0065,  $0072,  $0000,  $004D   ; DB1B   0065 0072 0000 004D
        DECLE   $006F,  $006A,  $0069,  $0071   ; DB1F   006F 006A 0069 0071
        DECLE   $0075,  $0065,  $0000,  $0042   ; DB23   0075 0065 0000 0042
        DECLE   $0075,  $0072,  $006E,  $0000   ; DB27   0075 0072 006E 0000
        DECLE   $0053,  $0061,  $0074,  $0063   ; DB2B   0053 0061 0074 0063
        DECLE   $0068,  $0000,  $0048,  $0061   ; DB2F   0068 0000 0048 0061
        DECLE   $0077,  $006B,  $0069,  $006E   ; DB33   0077 006B 0069 006E
        DECLE   $0073,  $0000,  $0027,  $0043   ; DB37   0073 0000 0027 0043
        DECLE   $006F,  $0070,  $0074,  $0065   ; DB3B   006F 0070 0074 0065
        DECLE   $0072,  $0000,  $0057,  $0061   ; DB3F   0072 0000 0057 0061
        DECLE   $0074,  $006B,  $0069,  $006E   ; DB43   0074 006B 0069 006E
        DECLE   $0073,  $0000,  $0048,  $0061   ; DB47   0073 0000 0048 0061
        DECLE   $0063,  $006B,  $0065,  $0072   ; DB4B   0063 006B 0065 0072
        DECLE   $0000,  $0054,  $0068,  $006F   ; DB4F   0000 0054 0068 006F
        DECLE   $006D,  $0061,  $0073,  $0000   ; DB53   006D 0061 0073 0000
        DECLE   $0053,  $0074,  $0072,  $0065   ; DB57   0053 0074 0072 0065
        DECLE   $0074,  $0063,  $0068,  $0000   ; DB5B   0074 0063 0068 0000
        DECLE   $004D,  $0061,  $0072,  $0078   ; DB5F   004D 0061 0072 0078
        DECLE   $0000,  $0053,  $006C,  $0061   ; DB63   0000 0053 006C 0061
        DECLE   $006D,  $006D,  $0065,  $0072   ; DB67   006D 006D 0065 0072
        DECLE   $0000,  $0053,  $006D,  $0069   ; DB6B   0000 0053 006D 0069
        DECLE   $0074,  $0068,  $0000,  $004E   ; DB6F   0074 0068 0000 004E
        DECLE   $0061,  $0069,  $006C,  $0073   ; DB73   0061 0069 006C 0073
        DECLE   $0000,  $004C,  $0075,  $0063   ; DB77   0000 004C 0075 0063
        DECLE   $0061,  $0073,  $0000,  $0043   ; DB7B   0061 0073 0000 0043
        DECLE   $0061,  $006C,  $0076,  $0069   ; DB7F   0061 006C 0076 0069
        DECLE   $006E,  $0000,  $0043,  $006F   ; DB83   006E 0000 0043 006F
        DECLE   $006F,  $006C,  $0065,  $0072   ; DB87   006F 006C 0065 0072
        DECLE   $0000,  $0052,  $0065,  $0078   ; DB8B   0000 0052 0065 0078
        DECLE   $0000,  $004B,  $0069,  $006E   ; DB8F   0000 004B 0069 006E
        DECLE   $0067,  $0000,  $0052,  $006F   ; DB93   0067 0000 0052 006F
        DECLE   $0062,  $0065,  $0072,  $0074   ; DB97   0062 0065 0072 0074
        DECLE   $0000,  $0049,  $0072,  $0076   ; DB9B   0000 0049 0072 0076
        DECLE   $0069,  $006E,  $0067,  $0073   ; DB9F   0069 006E 0067 0073
        DECLE   $0000,  $004A,  $0065,  $0066   ; DBA3   0000 004A 0065 0066
        DECLE   $0066,  $0072,  $0065,  $0079   ; DBA7   0066 0072 0065 0079
        DECLE   $0000,  $004D,  $0061,  $0072   ; DBAB   0000 004D 0061 0072
        DECLE   $0074,  $0069,  $006E,  $0073   ; DBAF   0074 0069 006E 0073
        DECLE   $0000,  $0054,  $002D,  $0042   ; DBB3   0000 0054 002D 0042
        DECLE   $006F,  $006E,  $0065,  $0000   ; DBB7   006F 006E 0065 0000
        DECLE   $004B,  $0065,  $006C,  $006C   ; DBBB   004B 0065 006C 006C
        DECLE   $0079,  $0000,  $0054,  $0075   ; DBBF   0079 0000 0054 0075
        DECLE   $0067,  $0062,  $006F,  $0061   ; DBC3   0067 0062 006F 0061
        DECLE   $0074,  $0000,  $0054,  $0075   ; DBC7   0074 0000 0054 0075
        DECLE   $0063,  $006B,  $0065,  $0072   ; DBCB   0063 006B 0065 0072
        DECLE   $0000,  $004A,  $0069,  $006D   ; DBCF   0000 004A 0069 006D
        DECLE   $006D,  $0069,  $0065,  $0000   ; DBD3   006D 0069 0065 0000
        DECLE   $004A,  $0061,  $006D,  $006D   ; DBD7   004A 0061 006D 006D
        DECLE   $0065,  $0072,  $0000,  $0052   ; DBDB   0065 0072 0000 0052
        DECLE   $0065,  $0062,  $006F,  $0075   ; DBDF   0065 0062 006F 0075
        DECLE   $006E,  $0064,  $0000,  $004F   ; DBE3   006E 0064 0000 004F
        DECLE   $0027,  $0052,  $0069,  $006C   ; DBE7   0027 0052 0069 006C
        DECLE   $0065,  $0079,  $0000,  $0054   ; DBEB   0065 0079 0000 0054
        DECLE   $0061,  $006E,  $006B,  $0000   ; DBEF   0061 006E 006B 0000
        DECLE   $0052,  $006F,  $006C,  $006C   ; DBF3   0052 006F 006C 006C
        DECLE   $0069,  $006E,  $0073,  $0000   ; DBF7   0069 006E 0073 0000
        DECLE   $0048,  $006F,  $0075,  $0064   ; DBFB   0048 006F 0075 0064
        DECLE   $0069,  $006E,  $0069,  $0000   ; DBFF   0069 006E 0069 0000

        RLC     R3,     2                       ; DC03   0057
L_DC04:
        SLR     R1,     1                       ; DC04   0061
        DECLE   $0074,  $0074,  $0073,  $0000   ; DC05   0074 0074 0073 0000
        DECLE   $0041,  $0063,  $0065,  $0000   ; DC09   0041 0063 0065 0000
        DECLE   $004D,  $0061,  $0076,  $0065   ; DC0D   004D 0061 0076 0065
        DECLE   $0072,  $0069,  $0063,  $006B   ; DC11   0072 0069 0063 006B
        DECLE   $0000,  $0042,  $0075,  $006C   ; DC15   0000 0042 0075 006C
        DECLE   $006C,  $0000,  $0050,  $0069   ; DC19   006C 0000 0050 0069
        DECLE   $0073,  $0074,  $006F,  $006E   ; DC1D   0073 0074 006F 006E
        DECLE   $0000,  $0053,  $0074,  $0065   ; DC21   0000 0053 0074 0065
        DECLE   $0076,  $0065,  $0000,  $0043   ; DC25   0076 0065 0000 0043
        DECLE   $006F,  $0075,  $0073,  $0065   ; DC29   006F 0075 0073 0065
        DECLE   $0079,  $0000,  $0053,  $0070   ; DC2D   0079 0000 0053 0070
        DECLE   $0075,  $0064,  $0000,  $0042   ; DC31   0075 0064 0000 0042
        DECLE   $0061,  $0062,  $0063,  $006F   ; DC35   0061 0062 0063 006F
        DECLE   $0063,  $006B,  $0000,  $0046   ; DC39   0063 006B 0000 0046
        DECLE   $006C,  $0061,  $0073,  $0068   ; DC3D   006C 0061 0073 0068
        DECLE   $0000,  $0046,  $006C,  $006F   ; DC41   0000 0046 006C 006F
        DECLE   $006F,  $0064,  $0000,  $0042   ; DC45   006F 0064 0000 0042
        DECLE   $006F,  $006D,  $0062,  $0065   ; DC49   006F 006D 0062 0065
        DECLE   $0072,  $0000,  $004D,  $0063   ; DC4D   0072 0000 004D 0063
        DECLE   $0043,  $0072,  $0061,  $0079   ; DC51   0043 0072 0061 0079
        DECLE   $0000,  $004B,  $0079,  $006C   ; DC55   0000 004B 0079 006C
        DECLE   $0065,  $0000,  $0053,  $0074   ; DC59   0065 0000 0053 0074
        DECLE   $0065,  $0076,  $0065,  $006E   ; DC5D   0065 0076 0065 006E
        DECLE   $0073,  $0000,  $0047,  $0061   ; DC61   0073 0000 0047 0061
        DECLE   $0072,  $0072,  $0069,  $0063   ; DC65   0072 0072 0069 0063
        DECLE   $006B,  $0000,  $0048,  $0069   ; DC69   006B 0000 0048 0069
        DECLE   $0067,  $0067,  $0069,  $006E   ; DC6D   0067 0067 0069 006E
        DECLE   $0073,  $0000,  $004D,  $0061   ; DC71   0073 0000 004D 0061
        DECLE   $0075,  $0072,  $0069,  $0063   ; DC75   0075 0072 0069 0063
        DECLE   $0065,  $0000,  $004D,  $0065   ; DC79   0065 0000 004D 0065
        DECLE   $006E,  $0064,  $006F,  $007A   ; DC7D   006E 0064 006F 007A
        DECLE   $0061,  $0000,  $0053,  $0075   ; DC81   0061 0000 0053 0075
        DECLE   $006D,  $006F,  $0000,  $0059   ; DC85   006D 006F 0000 0059
        DECLE   $0061,  $006D,  $0061,  $0075   ; DC89   0061 006D 0061 0075
        DECLE   $0063,  $0068,  $0069,  $0000   ; DC8D   0063 0068 0069 0000
        DECLE   $0052,  $0075,  $0073,  $0073   ; DC91   0052 0075 0073 0073
        DECLE   $0065,  $006C,  $006C,  $0000   ; DC95   0065 006C 006C 0000
        DECLE   $0045,  $0064,  $0077,  $0061   ; DC99   0045 0064 0077 0061
        DECLE   $0072,  $0064,  $0073,  $0000   ; DC9D   0072 0064 0073 0000
        DECLE   $004D,  $0069,  $0063,  $0072   ; DCA1   004D 0069 0063 0072
        DECLE   $006F,  $0000,  $004D,  $0063   ; DCA5   006F 0000 004D 0063
        DECLE   $0047,  $0065,  $0065,  $0000   ; DCA9   0047 0065 0065 0000
        DECLE   $0052,  $0069,  $0063,  $006B   ; DCAD   0052 0069 0063 006B
        DECLE   $0079,  $0000,  $0053,  $0068   ; DCB1   0079 0000 0053 0068
        DECLE   $0061,  $0063,  $006B,  $0000   ; DCB5   0061 0063 006B 0000
        DECLE   $0050,  $0065,  $0065,  $0057   ; DCB9   0050 0065 0065 0057
        DECLE   $0065,  $0065,  $0000,  $0050   ; DCBD   0065 0065 0000 0050
        DECLE   $0061,  $0072,  $006B,  $0065   ; DCC1   0061 0072 006B 0065
        DECLE   $0072,  $0000,  $004A,  $0075   ; DCC5   0072 0000 004A 0075
        DECLE   $0064,  $0067,  $0065,  $0000   ; DCC9   0064 0067 0065 0000
        DECLE   $0057,  $0061,  $0072,  $0072   ; DCCD   0057 0061 0072 0072
        DECLE   $0065,  $006E,  $0073,  $0000   ; DCD1   0065 006E 0073 0000
        DECLE   $0049,  $0063,  $0065,  $0020   ; DCD5   0049 0063 0065 0020
        DECLE   $0042,  $0075,  $0063,  $006B   ; DCD9   0042 0075 0063 006B
        DECLE   $0065,  $0074,  $0000,  $0057   ; DCDD   0065 0074 0000 0057
        DECLE   $006F,  $006F,  $0064,  $0000   ; DCE1   006F 006F 0064 0000
        DECLE   $0053,  $0068,  $006F,  $0072   ; DCE5   0053 0068 006F 0072
        DECLE   $0074,  $0079,  $0000,  $004D   ; DCE9   0074 0079 0000 004D
        DECLE   $0061,  $006C,  $006F,  $006E   ; DCED   0061 006C 006F 006E
        DECLE   $0065,  $0000,  $0044,  $0072   ; DCF1   0065 0000 0044 0072
        DECLE   $0069,  $0062,  $0062,  $006C   ; DCF5   0069 0062 0062 006C
        DECLE   $0065,  $0073,  $0000,  $004D   ; DCF9   0065 0073 0000 004D
        DECLE   $0063,  $0043,  $006F,  $0079   ; DCFD   0063 0043 006F 0079
        DECLE   $0000,  $0057,  $0069,  $006D   ; DD01   0000 0057 0069 006D
        DECLE   $0070,  $0000,  $0053,  $0061   ; DD05   0070 0000 0053 0061
        DECLE   $006E,  $0064,  $0065,  $0072   ; DD09   006E 0064 0065 0072
        DECLE   $0073,  $0000,  $0044,  $0075   ; DD0D   0073 0000 0044 0075
        DECLE   $0073,  $0074,  $0079,  $0000   ; DD11   0073 0074 0079 0000
        DECLE   $0052,  $0061,  $0067,  $0067   ; DD15   0052 0061 0067 0067
        DECLE   $0000,  $004C,  $0065,  $0065   ; DD19   0000 004C 0065 0065
        DECLE   $0000,  $0053,  $0061,  $006D   ; DD1D   0000 0053 0061 006D
        DECLE   $006D,  $006F,  $006E,  $0000   ; DD21   006D 006F 006E 0000
        DECLE   $0053,  $0063,  $006F,  $0074   ; DD25   0053 0063 006F 0074
        DECLE   $0074,  $0000,  $0053,  $0068   ; DD29   0074 0000 0053 0068
        DECLE   $0069,  $0070,  $0073,  $006B   ; DD2D   0069 0070 0073 006B
        DECLE   $0079,  $0000,  $0044,  $0075   ; DD31   0079 0000 0044 0075
        DECLE   $006E,  $0063,  $0061,  $006E   ; DD35   006E 0063 0061 006E
        DECLE   $0000,  $0050,  $0065,  $006F   ; DD39   0000 0050 0065 006F
        DECLE   $0070,  $006C,  $0065,  $0073   ; DD3D   0070 006C 0065 0073
        DECLE   $0000,  $004E,  $0069,  $0063   ; DD41   0000 004E 0069 0063
        DECLE   $006B,  $0000,  $0048,  $006F   ; DD45   006B 0000 0048 006F
        DECLE   $006F,  $006B,  $0065,  $0072   ; DD49   006F 006B 0065 0072
        DECLE   $0000,  $0057,  $0069,  $006E   ; DD4D   0000 0057 0069 006E
        DECLE   $0073,  $0074,  $006F,  $006E   ; DD51   0073 0074 006F 006E
        DECLE   $0000,  $004B,  $0065,  $0079   ; DD55   0000 004B 0065 0079
        DECLE   $0073,  $0000,  $0052,  $006F   ; DD59   0073 0000 0052 006F
        DECLE   $0063,  $006B,  $0079,  $0000   ; DD5D   0063 006B 0079 0000
        DECLE   $0043,  $0068,  $0061,  $006E   ; DD61   0043 0068 0061 006E
        DECLE   $0064,  $006C,  $0065,  $0072   ; DD65   0064 006C 0065 0072
        DECLE   $0000,  $0046,  $006F,  $0077   ; DD69   0000 0046 006F 0077
        DECLE   $006C,  $0065,  $0072,  $0000   ; DD6D   006C 0065 0072 0000
        DECLE   $0042,  $0072,  $006F,  $0077   ; DD71   0042 0072 006F 0077
        DECLE   $006E,  $0000,  $0052,  $002E   ; DD75   006E 0000 0052 002E
        DECLE   $0043,  $002E,  $0000,  $0047   ; DD79   0043 002E 0000 0047
        DECLE   $006F,  $006F,  $0064,  $0072   ; DD7D   006F 006F 0064 0072
        DECLE   $0069,  $0063,  $0068,  $0000   ; DD81   0069 0063 0068 0000
        DECLE   $004B,  $0069,  $0072,  $0062   ; DD85   004B 0069 0072 0062
        DECLE   $0079,  $0000,  $0048,  $006F   ; DD89   0079 0000 0048 006F
        DECLE   $006F,  $0076,  $0065,  $0072   ; DD8D   006F 0076 0065 0072
        DECLE   $0000,  $0044,  $0075,  $006B   ; DD91   0000 0044 0075 006B
        DECLE   $0065,  $0000,  $0044,  $0061   ; DD95   0065 0000 0044 0061
        DECLE   $0076,  $0069,  $0073,  $0000   ; DD99   0076 0069 0073 0000
        DECLE   $004C,  $0075,  $0067,  $0020   ; DD9D   004C 0075 0067 0020
        DECLE   $004E,  $0075,  $0074,  $0000   ; DDA1   004E 0075 0074 0000
        DECLE   $0042,  $0061,  $0078,  $0074   ; DDA5   0042 0061 0078 0074
        DECLE   $0065,  $0072,  $0000,  $0057   ; DDA9   0065 0072 0000 0057
        DECLE   $0068,  $0065,  $0065,  $006C   ; DDAD   0068 0065 0065 006C
        DECLE   $0073,  $0000,  $0042,  $0061   ; DDB1   0073 0000 0042 0061
        DECLE   $0072,  $006E,  $0065,  $0073   ; DDB5   0072 006E 0065 0073
        DECLE   $0000,  $0045,  $0064,  $0064   ; DDB9   0000 0045 0064 0064
        DECLE   $0069,  $0065,  $0000,  $0057   ; DDBD   0069 0065 0000 0057
        DECLE   $0068,  $0069,  $0073,  $0074   ; DDC1   0068 0069 0073 0074
        DECLE   $006C,  $0065,  $0072,  $0000   ; DDC5   006C 0065 0072 0000
        DECLE   $004F,  $0073,  $0063,  $0061   ; DDC9   004F 0073 0063 0061
        DECLE   $0072,  $0000,  $0050,  $0065   ; DDCD   0072 0000 0050 0065
        DECLE   $0065,  $006C,  $0065,  $0000   ; DDD1   0065 006C 0065 0000
        DECLE   $0054,  $0075,  $0072,  $0062   ; DDD5   0054 0075 0072 0062
        DECLE   $006F,  $0000,  $0057,  $0069   ; DDD9   006F 0000 0057 0069
        DECLE   $006C,  $0073,  $006F,  $006E   ; DDDD   006C 0073 006F 006E
        DECLE   $0000,  $0044,  $0065,  $0072   ; DDE1   0000 0044 0065 0072
        DECLE   $0065,  $006B,  $0000,  $0041   ; DDE5   0065 006B 0000 0041
        DECLE   $006E,  $0064,  $0072,  $0065   ; DDE9   006E 0064 0072 0065
        DECLE   $0077,  $0073,  $0000,  $0054   ; DDED   0077 0073 0000 0054
        DECLE   $0065,  $0072,  $0072,  $0079   ; DDF1   0065 0072 0072 0079
        DECLE   $0000,  $0053,  $0074,  $006F   ; DDF5   0000 0053 0074 006F
        DECLE   $0075,  $0074,  $0000,  $000A   ; DDF9   0075 0074 0000 000A
        DECLE   $009A,  $0011,  $0035,  $0016   ; DDFD   009A 0011 0035 0016
        DECLE   $000C,  $008C,  $006B,  $0034   ; DE01   000C 008C 006B 0034
        DECLE   $0056,  $00C0,  $0018,  $009A   ; DE05   0056 00C0 0018 009A
        DECLE   $000C,  $002E,  $0021,  $0007   ; DE09   000C 002E 0021 0007
        DECLE   $0080,  $006B,  $002B,  $0054   ; DE0D   0080 006B 002B 0054
        DECLE   $00B5,  $0026,  $009A,  $0013   ; DE11   00B5 0026 009A 0013
        DECLE   $0036,  $000C,  $000A,  $008C   ; DE15   0036 000C 000A 008C
        DECLE   $0070,  $0038,  $004A,  $00A3   ; DE19   0070 0038 004A 00A3
        DECLE   $0035                           ; DE1D   0035

        MOVR    R3,     R2                      ; DE1E   009A
        DECR    R5                              ; DE1F   0015
        RSWD    R1                              ; DE20   0039
        INCR    R6                              ; DE21   000E
        SETC                                    ; DE22   0007
        TSTR    R0                              ; DE23   0080
        RRC     R2,     1                       ; DE24   0072
        ADCR    R2                              ; DE25   002A
        SLL     R0,     1                       ; DE26   0048
        MOVR    R2,     R7                      ; DE27   0097

        DECLE   $0044,  $009A,  $0015,  $0034   ; DE28   0044 009A 0015 0034
        DECLE   $0019,  $000B,  $0080,  $0074   ; DE2C   0019 000B 0080 0074
        DECLE   $0042,  $0042,  $007C,  $0054   ; DE30   0042 0042 007C 0054
        DECLE   $009A,  $0010,  $003B,  $001A   ; DE34   009A 0010 003B 001A
        DECLE   $0007,  $0078,  $006B,  $0051   ; DE38   0007 0078 006B 0051
        DECLE   $0049,  $0065,  $0062,  $009A   ; DE3C   0049 0065 0062 009A
        DECLE   $0013,  $0031,  $0015,  $0007   ; DE40   0013 0031 0015 0007
        DECLE   $006C,  $0069,  $0024,  $0055   ; DE44   006C 0069 0024 0055
        DECLE   $0058,  $0070,  $009A,  $0016   ; DE48   0058 0070 009A 0016
        DECLE   $0030,  $0008,  $000D,  $0090   ; DE4C   0030 0008 000D 0090
        DECLE   $006A,  $002A,  $004B,  $0048   ; DE50   006A 002A 004B 0048
        DECLE   $007D,  $009A,  $000B,  $003B   ; DE54   007D 009A 000B 003B
        DECLE   $0004,  $0008,  $0078,  $0072   ; DE58   0004 0008 0078 0072
        DECLE   $0029,  $004C,  $0032,  $008C   ; DE5C   0029 004C 0032 008C
        DECLE   $009A,  $0006,  $002E,  $0005   ; DE60   009A 0006 002E 0005

        SETC                                    ; DE64   0007
        SAR     R0,     1                       ; DE65   0068
        RRC     R0,     2                       ; DE66   0074
        SWAP    R1,     1                       ; DE67   0041
        RSWD    R3                              ; DE68   003B
        ADCR    R7                              ; DE69   002F

        TSTR    R3                              ; DE6A   009B
L_DE6B:
        MOVR    R3,     R2                      ; DE6B   009A
        DECLE   $0009,  $002E,  $000B,  $0005   ; DE6C   0009 002E 000B 0005
        DECLE   $0050,  $0069,  $002C,  $0052   ; DE70   0050 0069 002C 0052
        DECLE   $001F,  $00AB,  $009A,  $0008   ; DE74   001F 00AB 009A 0008
        DECLE   $0033,  $0008,  $0007,  $0078   ; DE78   0033 0008 0007 0078
        DECLE   $0071,  $0042,  $003E,  $001A   ; DE7C   0071 0042 003E 001A
        DECLE   $00B6,  $009A,  $001D,  $0038   ; DE80   00B6 009A 001D 0038
        DECLE   $0024,  $0004,  $008C,  $0068   ; DE84   0024 0004 008C 0068
        DECLE   $0026,  $0055,  $00DA,  $00C3   ; DE88   0026 0055 00DA 00C3
        DECLE   $009A,  $0018,  $0031,  $001D   ; DE8C   009A 0018 0031 001D
        DECLE   $000A,  $0098,  $0069,  $0027   ; DE90   000A 0098 0069 0027

        SLLC    R0,     1                       ; DE94   0058
        ADDR    R1,     R4                      ; DE95   00CC
        ADDR    R1,     R6                      ; DE96   00CE
        MOVR    R3,     R2                      ; DE97   009A
L_DE98:
        DECR    R7                              ; DE98   0017

        DECLE   $0030,  $0025,  $0007,  $0090   ; DE99   0030 0025 0007 0090
        DECLE   $0068,  $0032,  $004D,  $00BD   ; DE9D   0068 0032 004D 00BD
        DECLE   $00DD,  $009A,  $0016,  $0033   ; DEA1   00DD 009A 0016 0033
        DECLE   $0021,  $0006,  $0088,  $0067   ; DEA5   0021 0006 0088 0067
        DECLE   $002D,  $004B,  $00AE,  $00EA   ; DEA9   002D 004B 00AE 00EA
        DECLE   $009A,  $001D,  $0034,  $001B   ; DEAD   009A 001D 0034 001B
        DECLE   $0005,  $0090,  $0066,  $0031   ; DEB1   0005 0090 0066 0031
        DECLE   $004B,  $009D,  $00F8,  $009A   ; DEB5   004B 009D 00F8 009A
        DECLE   $0012,  $0037                   ; DEB9   0012 0037

        COMR    R6                              ; DEBB   001E
        SETC                                    ; DEBC   0007
        SARC    R0,     2                       ; DEBD   007C
        SAR     R2,     1                       ; DEBE   006A
        ADCR    R7                              ; DEBF   002F

        SLL     R0,     2                       ; DEC0   004C
L_DEC1:
        MOVR    R0,     R3                      ; DEC1   0083
        DECLE   $0006,  $009B,  $0016,  $002F   ; DEC2   0006 009B 0016 002F
        DECLE   $001E,  $0005                   ; DEC6   001E 0005

        MOVR    R2,     R4                      ; DEC8   0094
        SLR     R3,     2                       ; DEC9   0067
        GSWD    R3                              ; DECA   0033
        SLL     R3,     2                       ; DECB   004F
        SARC    R0,     1                       ; DECC   0078
        DECR    R2                              ; DECD   0012
        TSTR    R3                              ; DECE   009B
        INCR    R7                              ; DECF   000F

        DECLE   $0035                           ; DED0   0035
L_DED1:
        INCR    R5                              ; DED1   000D
        DECLE   $000C,  $0094,  $0069,  $003A   ; DED2   000C 0094 0069 003A
        DECLE   $0039,  $0066,  $001E,  $009B   ; DED6   0039 0066 001E 009B
        DECLE   $0014,  $0033,  $0018,  $0002   ; DEDA   0014 0033 0018 0002
        DECLE   $0080,  $0065,  $0029,  $0056   ; DEDE   0080 0065 0029 0056
        DECLE   $005F,  $002B,  $009B,  $000E   ; DEE2   005F 002B 009B 000E
        DECLE   $002F,  $0019,  $0005,  $0078   ; DEE6   002F 0019 0005 0078
        DECLE   $0068,  $003C,  $0042,  $005D   ; DEEA   0068 003C 0042 005D
        DECLE   $0039,  $009B,  $0007,  $0034   ; DEEE   0039 009B 0007 0034
        DECLE   $000D,  $0006,  $0054,  $0068   ; DEF2   000D 0006 0054 0068
        DECLE   $0038,  $0043,  $0056,  $0049   ; DEF6   0038 0043 0056 0049
        DECLE   $009B,  $000A,  $0032,  $001F   ; DEFA   009B 000A 0032 001F
        DECLE   $0005,  $0054,  $006A,  $0042   ; DEFE   0005 0054 006A 0042
        DECLE   $0048,  $0052,  $0057,  $009B   ; DF02   0048 0052 0057 009B
        DECLE   $000C,  $0031,  $0012,  $000A   ; DF06   000C 0031 0012 000A
        DECLE   $0088,  $0069,  $0036           ; DF0A   0088 0069 0036

        SLL     R1,     1                       ; DF0D   0049
        SLL     R0,     2                       ; DF0E   004C
        SLR     R0,     2                       ; DF0F   0064
        TSTR    R3                              ; DF10   009B
        INCR    R0                              ; DF11   0008
        NOP                                     ; DF12   0034
        INCR    R5                              ; DF13   000D

        JSR     R4,     L_5C6A                  ; DF14   0004 005C 006A

        ADCR    R2                              ; DF17   002A
        SLL     R2,     2                       ; DF18   004E
        SWAP    R2,     2                       ; DF19   0046
        RRC     R2,     1                       ; DF1A   0072
        TSTR    R3                              ; DF1B   009B
        INCR    R7                              ; DF1C   000F

        GSWD    R1                              ; DF1D   0031
L_DF1E:
        INCR    R6                              ; DF1E   000E
        DECLE   $0009,  $0078,  $006A,  $0032   ; DF1F   0009 0078 006A 0032
        DECLE   $004C,  $0043,  $007E,  $009B   ; DF23   004C 0043 007E 009B
        DECLE   $0010,  $003A,  $000C,  $0006   ; DF27   0010 003A 000C 0006
        DECLE   $0084,  $0068,  $002C,  $004F   ; DF2B   0084 0068 002C 004F
        DECLE   $003E,  $008C,  $009B,  $001A   ; DF2F   003E 008C 009B 001A
        DECLE   $0039,  $000B,  $0005,  $0088   ; DF33   0039 000B 0005 0088
        DECLE   $0066,  $003C,  $004D,  $0034   ; DF37   0066 003C 004D 0034
        DECLE   $0095,  $009B,  $0008,  $0033   ; DF3B   0095 009B 0008 0033
        DECLE   $000B,  $0005                   ; DF3F   000B 0005

        SLR     R0,     1                       ; DF41   0060
        SAR     R1,     1                       ; DF42   0069
        NEGR    R6                              ; DF43   0026
        SLL     R3,     1                       ; DF44   004B
        ADCR    R7                              ; DF45   002F

        TSTR    R4                              ; DF46   00A4
L_DF47:
        TSTR    R3                              ; DF47   009B
        DECR    R5                              ; DF48   0015
        ADCR    R7                              ; DF49   002F

        INCR    R4                              ; DF4A   000C
L_DF4B:
        SETC                                    ; DF4B   0007
        DECLE   $0090,  $0067,  $0026,  $004D   ; DF4C   0090 0067 0026 004D
        DECLE   $002D,  $00B4,  $009B,  $0012   ; DF50   002D 00B4 009B 0012
        DECLE   $0031,  $000A,  $000A,  $008C   ; DF54   0031 000A 000A 008C
        DECLE   $0069,  $0030,  $004D,  $002A   ; DF58   0069 0030 004D 002A
        DECLE   $00C1,  $009B,  $000B,  $002B   ; DF5C   00C1 009B 000B 002B
        DECLE   $000F                           ; DF60   000F

        JSR     R4,     L_5C67                  ; DF61   0004 005C 0067

        ADCR    R1                              ; DF64   0029
        SLL     R2,     2                       ; DF65   004E
        NEGR    R4                              ; DF66   0024
        ADDR    R2,     R0                      ; DF67   00D0
        TSTR    R3                              ; DF68   009B
        INCR    R7                              ; DF69   000F

        RSWD    R0                              ; DF6A   0038
L_DF6B:
        INCR    R1                              ; DF6B   0009
        DECLE   $0007,  $0074,  $0068,  $003D   ; DF6C   0007 0074 0068 003D
        DECLE   $0043,  $001E,  $00DE,  $009B   ; DF70   0043 001E 00DE 009B
        DECLE   $0007,  $0038,  $0008,  $0009   ; DF74   0007 0038 0008 0009
        DECLE   $006C,  $0068,  $003A,  $0038   ; DF78   006C 0068 003A 0038
        DECLE   $001B,  $00EE,  $009B,  $0009   ; DF7C   001B 00EE 009B 0009
        DECLE   $0032,  $0009,  $0009,  $0080   ; DF80   0032 0009 0009 0080
        DECLE   $0069,  $004A,  $0041,  $0018   ; DF84   0069 004A 0041 0018
        DECLE   $00FB,  $009B,  $0011,  $0038   ; DF88   00FB 009B 0011 0038
        DECLE   $0014,  $0007,  $0098,  $0069   ; DF8C   0014 0007 0098 0069
        DECLE   $0028,  $0051,  $00D1,  $0009   ; DF90   0028 0051 00D1 0009
        DECLE   $009C,  $0014,  $0031,  $0024   ; DF94   009C 0014 0031 0024
        DECLE   $0004,  $0080,  $0063,  $0027   ; DF98   0004 0080 0063 0027
        DECLE   $0045,  $00C9,  $0016,  $009C   ; DF9C   0045 00C9 0016 009C
        DECLE   $0015,  $0030,  $001F,  $0005   ; DFA0   0015 0030 001F 0005

        MOVR    R1,     R4                      ; DFA4   008C
        SLR     R1,     1                       ; DFA5   0061
        GSWD    R3                              ; DFA6   0033
        RLC     R1,     1                       ; DFA7   0051
        MOVR    R5,     R7                      ; DFA8   00AF

        DECLE   $0022,  $009C,  $000C,  $0037   ; DFA9   0022 009C 000C 0037

        NEGR    R5                              ; DFAD   0025
        EIS                                     ; DFAE   0002
        MOVR    R0,     R4                      ; DFAF   0084
        SLR     R1,     1                       ; DFB0   0061
        ADCR    R1                              ; DFB1   0029
        SLL     R1,     1                       ; DFB2   0049
        MOVR    R1,     R4                      ; DFB3   008C
        ADCR    R7                              ; DFB4   002F

        MOVR    R3,     R4                      ; DFB5   009C
L_DFB6:
        INCR    R3                              ; DFB6   000B
        DECLE   $0034,  $0023,  $0002,  $0068   ; DFB7   0034 0023 0002 0068
        DECLE   $0058,  $002A,  $004C,  $007B   ; DFBB   0058 002A 004C 007B
        DECLE   $003C,  $009C,  $0014,  $0031   ; DFBF   003C 009C 0014 0031
        DECLE   $001C,  $0006,  $0098,  $0063   ; DFC3   001C 0006 0098 0063
        DECLE   $0029,  $0054,  $006C,  $0048   ; DFC7   0029 0054 006C 0048
        DECLE   $009C,  $000B,  $0035,  $0020   ; DFCB   009C 000B 0035 0020
        DECLE   $0002,  $007C,  $0061,  $0023   ; DFCF   0002 007C 0061 0023
        DECLE   $0056,  $0061,  $0056,  $009C   ; DFD3   0056 0061 0056 009C
        DECLE   $0009,  $0031,  $0021,  $0003   ; DFD7   0009 0031 0021 0003
        DECLE   $0074,  $0067,  $0034,  $0053   ; DFDB   0074 0067 0034 0053
        DECLE   $005E,  $0063,  $009C,  $0015   ; DFDF   005E 0063 009C 0015
        DECLE   $002E,  $0022,  $0004,  $0090   ; DFE3   002E 0022 0004 0090
        DECLE   $0061,  $003F                   ; DFE7   0061 003F

        SLL     R1,     1                       ; DFE9   0049
        RLC     R0,     2                       ; DFEA   0054
        RRC     R3,     1                       ; DFEB   0073
        MOVR    R3,     R4                      ; DFEC   009C
        INCR    R4                              ; DFED   000C
        ADCR    R4                              ; DFEE   002C
        NEGR    R0                              ; DFEF   0020
        EIS                                     ; DFF0   0002
        SLR     R0,     1                       ; DFF1   0060
        SLR     R0,     2                       ; DFF2   0064
        NEGR    R0                              ; DFF3   0020
        RLC     R2,     1                       ; DFF4   0052
        RLC     R1,     1                       ; DFF5   0051
        MOVR    R0,     R3                      ; DFF6   0083
        MOVR    R3,     R4                      ; DFF7   009C
        DECR    R3                              ; DFF8   0013
        GSWD    R2                              ; DFF9   0032
        COMR    R1                              ; DFFA   0019
        EIS                                     ; DFFB   0002
        SARC    R0,     2                       ; DFFC   007C
        SLR     R0,     2                       ; DFFD   0064
        ADCR    R1                              ; DFFE   0029
        RSWD    R4                              ; DFFF   003C

        ORG     $F000
        DECLE   $004A,  $0091,  $009C,  $0016   ; F000   004A 0091 009C 0016
        DECLE   $0036,  $0011,  $0004           ; F004   0036 0011 0004

        MOVR    R2,     R4                      ; F007   0094
        SLR     R2,     2                       ; F008   0066
        COMR    R1                              ; F009   0019
        RLC     R1,     1                       ; F00A   0051
        SWAP    R0,     2                       ; F00B   0044
        MOVR    R4,     R1                      ; F00C   00A1
        MOVR    R3,     R4                      ; F00D   009C
        DECR    R1                              ; F00E   0011
        ADCR    R6                              ; F00F   002E
        COMR    R0                              ; F010   0018
        EIS                                     ; F011   0002
        MOVR    R2,     R4                      ; F012   0094
        SLR     R1,     1                       ; F013   0061
        NEGR    R3                              ; F014   0023
        SLL     R0,     2                       ; F015   004C
        RSWD    R3                              ; F016   003B
        TSTR    R5                              ; F017   00AD
        MOVR    R3,     R4                      ; F018   009C
        INCR    R5                              ; F019   000D
        ADCR    R3                              ; F01A   002B
        DECR    R1                              ; F01B   0011
        DIS                                     ; F01C   0003
        MOVR    R0,     R4                      ; F01D   0084
        SLR     R1,     2                       ; F01E   0065
        GSWD    R2                              ; F01F   0032
        RLC     R1,     2                       ; F020   0055
        GSWD    R2                              ; F021   0032
        MOVR    R7,     R1                      ; F022   00B9
        MOVR    R3,     R4                      ; F023   009C
        INCR    R1                              ; F024   0009
        ADCR    R6                              ; F025   002E
        DECR    R3                              ; F026   0013
        EIS                                     ; F027   0002
        SLLC    R0,     2                       ; F028   005C
        SLR     R2,     1                       ; F029   0062
        RSWD    R0                              ; F02A   0038
        SLL     R2,     2                       ; F02B   004E
        ADCR    R3                              ; F02C   002B
        ADDR    R0,     R7                      ; F02D   00C7

        DECLE   $009C,  $0007,  $0032,  $0025   ; F02E   009C 0007 0032 0025
        DECLE   $0001,  $004C,  $0062,  $001A   ; F032   0001 004C 0062 001A
        DECLE   $004B,  $0027,  $00D5,  $009C   ; F036   004B 0027 00D5 009C
        DECLE   $0008,  $0034,  $0010,  $0005   ; F03A   0008 0034 0010 0005
        DECLE   $006C,  $0065,  $003C,  $0040   ; F03E   006C 0065 003C 0040
        DECLE   $0021,  $00E5,  $009C,  $000D   ; F042   0021 00E5 009C 000D
        DECLE   $0030,  $000E,  $0003,  $0088   ; F046   0030 000E 0003 0088
        DECLE   $0060,  $001E,  $0052,  $001E   ; F04A   0060 001E 0052 001E
        DECLE   $00F3,  $009C,  $0010,  $002E   ; F04E   00F3 009C 0010 002E
        DECLE   $0011,  $0003,  $0084,  $0062   ; F052   0011 0003 0084 0062
        DECLE   $0032,  $0051,  $001C,  $0002   ; F056   0032 0051 001C 0002
        DECLE   $009D,  $000A,  $002C,  $000E   ; F05A   009D 000A 002C 000E
        DECLE   $0001,  $006C,  $0061,  $002A   ; F05E   0001 006C 0061 002A
        DECLE   $004E,  $001A,  $000F,  $009D   ; F062   004E 001A 000F 009D
        DECLE   $0005                           ; F066   0005

        ADCR    R7                              ; F067   002F

        INCR    R0                              ; F068   0008
L_F069:
        SETC                                    ; F069   0007
        DECLE   $0084,  $0063,  $002E,  $0049   ; F06A   0084 0063 002E 0049
        DECLE   $0016,  $001A,  $009D,  $0005   ; F06E   0016 001A 009D 0005
        DECLE   $002B,  $0019,  $0002,  $0048   ; F072   002B 0019 0002 0048
        DECLE   $0066,  $0033,  $0050,  $0011   ; F076   0066 0033 0050 0011
        DECLE   $0025,  $009D,  $000C,  $0030   ; F07A   0025 009D 000C 0030
        DECLE   $0013,  $0007,  $0074,  $006B   ; F07E   0013 0007 0074 006B
        DECLE   $003B,  $004B,  $0000,  $0033   ; F082   003B 004B 0000 0033
        DECLE   $009D,  $0009,  $002E,  $0009   ; F086   009D 0009 002E 0009
        DECLE   $0005,  $0050,  $0073,  $0030   ; F08A   0005 0050 0073 0030
        DECLE   $0050,  $0000,  $0042,  $009D   ; F08E   0050 0000 0042 009D
        DECLE   $000C,  $002B,  $000B,  $0005   ; F092   000C 002B 000B 0005
        DECLE   $0054,  $006A,  $003D,  $0046   ; F096   0054 006A 003D 0046
        DECLE   $0000,  $004E,  $009D,  $000C   ; F09A   0000 004E 009D 000C
        DECLE   $0031,  $001A,  $0005,  $0030   ; F09E   0031 001A 0005 0030
        DECLE   $0067,  $0035,  $0054,  $0000   ; F0A2   0067 0035 0054 0000
        DECLE   $005B,  $009D,  $0005,  $0029   ; F0A6   005B 009D 0005 0029
        DECLE   $0008,  $0001,  $0054,  $0069   ; F0AA   0008 0001 0054 0069
        DECLE   $004B,  $003E,  $0000,  $006A   ; F0AE   004B 003E 0000 006A
        DECLE   $009D,  $000D,  $002F,  $0020   ; F0B2   009D 000D 002F 0020
        DECLE   $0005,  $0098,  $0068,  $0058   ; F0B6   0005 0098 0068 0058
        DECLE   $004E,  $0000,  $0077,  $009D   ; F0BA   004E 0000 0077 009D
        DECLE   $0007,  $0026,  $0009,  $000B   ; F0BE   0007 0026 0009 000B
        DECLE   $0090,  $0064,  $0053,  $0044   ; F0C2   0090 0064 0053 0044
        DECLE   $0000,  $0085,  $009D,  $0005   ; F0C6   0000 0085 009D 0005
        DECLE   $0025,  $000E,  $000C,  $0084   ; F0CA   0025 000E 000C 0084
        DECLE   $0067,  $0022,  $0046,  $0000   ; F0CE   0067 0022 0046 0000
        DECLE   $0092,  $009D,  $000F,  $002F   ; F0D2   0092 009D 000F 002F
        DECLE   $001F,  $0006,  $0080,  $0064   ; F0D6   001F 0006 0080 0064
        DECLE   $003A,  $004E,  $0000,  $009D   ; F0DA   003A 004E 0000 009D
        DECLE   $009D,  $000B,  $0027           ; F0DE   009D 000B 0027
L_F0E1:
        DECR    R7                              ; F0E1   0017

        DECLE   $0002,  $00A0,  $0063,  $0027   ; F0E2   0002 00A0 0063 0027
        DECLE   $0048,  $0000,  $00AC,  $009D   ; F0E6   0048 0000 00AC 009D
        DECLE   $0009,  $002E,  $0013,  $0002   ; F0EA   0009 002E 0013 0002
        DECLE   $007C,  $0062,  $0025,  $005B   ; F0EE   007C 0062 0025 005B
        DECLE   $0000,  $00BA,  $009D,  $000D   ; F0F2   0000 00BA 009D 000D
        DECLE   $0033,  $000B,  $0005,  $0078   ; F0F6   0033 000B 0005 0078
        DECLE   $0066,  $002A,  $0044,  $0000   ; F0FA   0066 002A 0044 0000
        DECLE   $00C9,  $009D,  $000B,  $0026   ; F0FE   00C9 009D 000B 0026
        DECLE   $0021,  $0001,  $0074,  $0063   ; F102   0021 0001 0074 0063
        DECLE   $003A,  $004F,  $0000,  $00D5   ; F106   003A 004F 0000 00D5
        DECLE   $009D,  $0011,  $0030,  $001C   ; F10A   009D 0011 0030 001C
        DECLE   $0005,  $0090,  $0065,  $002A   ; F10E   0005 0090 0065 002A
        DECLE   $0050,  $0000,  $00E2,  $009D   ; F112   0050 0000 00E2 009D
        DECLE   $0009,  $002B,  $0013,  $0001   ; F116   0009 002B 0013 0001
        DECLE   $0080,  $005B,  $000F,  $0051   ; F11A   0080 005B 000F 0051
        DECLE   $0000,  $00F0,  $009D,  $000C   ; F11E   0000 00F0 009D 000C
        DECLE   $002E,  $0016,  $0004,  $0094   ; F122   002E 0016 0004 0094
        DECLE   $0060,  $0014,  $004E,  $0000   ; F126   0060 0014 004E 0000

        PSHR    R5                              ; F12A   0275
        MVI     G_015D, R0                      ; F12B   0280 015D
        TSTR    R0                              ; F12D   0080
        BNEQ    L_F18A                          ; F12E   020C 005A

L_F130:
        MVI     G_015D, R0                      ; F130   0280 015D
        DECLE   $0378,  $0005,  $0204,  $0055   ; F132   0378 0005 0204 0055
        DECLE   $0281,  $0174,  $02BC,  $0163   ; F136   0281 0174 02BC 0163
        DECLE   $0004,  $01A0,  $0150,  $0281   ; F13A   0004 01A0 0150 0281
        DECLE   $0173,  $02BC,  $015D,  $0004   ; F13E   0173 02BC 015D 0004
        DECLE   $01A0,  $0150,  $01C0,  $0240   ; F142   01A0 0150 01C0 0240
        DECLE   $0188,  $02BC,  $0188,  $02B9   ; F146   0188 02BC 0188 02B9
        DECLE   $0258,  $0004                   ; F14A   0258 0004

        ANDR    R4,     R0                      ; F14C   01A0
        CMPR    R2,     R0                      ; F14D   0150
        B       L_F130                          ; F14E   0220 001F

        PSHR    R5                              ; F150   0275
        PSHR    R4                              ; F151   0274
        SDBD                                    ; F152   0001
        ADDI    #$55AD, R1                      ; F153   02F9 00AD 0055
        MVI@    R1,     R1                      ; F156   0289
        SLR     R1,     1                       ; F157   0061
        MVII    #$018B, R5                      ; F158   02BD 018B
        MVI@    R5,     R4                      ; F15A   02AC
        CLRR    R2                              ; F15B   01D2
        DECR    R2                              ; F15C   0012
        CLRR    R3                              ; F15D   01DB
L_F15E:
        MVI@    R5,     R0                      ; F15E   02A8
        DECLE   $0275,  $0272,  $0004           ; F15F   0275 0272 0004

        ANDR    R4,     R0                      ; F162   01A0
        ANDR    R2,     R4                      ; F163   0194
        INCR    R2                              ; F164   000A
        PULR    R2                              ; F165   02B2
        CMP@    R5,     R1                      ; F166   0369
        BLT     L_F170                          ; F167   0205 0007

        DECR    R5                              ; F169   0015
        CMP@    R5,     R3                      ; F16A   036B
        BGT     L_F170                          ; F16B   020E 0003

        DECR    R5                              ; F16D   0015
        MVI@    R5,     R3                      ; F16E   02AB
        MOVR    R0,     R2                      ; F16F   0082
L_F170:
        PULR    R5                              ; F170   02B5
        DECR    R4                              ; F171   0014
        BNEQ    L_F15E                          ; F172   022C 0015

        MVII    #$018B, R4                      ; F174   02BC 018B
        MOVR    R2,     R0                      ; F176   0090
        BPL     L_F183                          ; F177   0203 000A

        MVII    #$01C6, R4                      ; F179   02BC 01C6
        MVI@    R4,     R0                      ; F17B   02A0

        JSR     R5,     X_RAND2                 ; F17C   0004 0114 029E

        ADDR    R0,     R4                      ; F17F   00C4
        MVI@    R4,     R0                      ; F180   02A0
        MVII    #$01C6, R4                      ; F181   02BC 01C6

L_F183:
        JSR     R5,     L_5FE1                  ; F183   0004 015C 03E1

        PULR    R4                              ; F186   02B4

        JSR     R5,     L_5FD7                  ; F187   0004 015C 03D7

L_F18A:
        PULR    R7                              ; F18A   02B7

        JSR     R5,     L_6004                  ; F18B   0004 0160 0004
        DECLE   $015D                           ; F18E   015D

        JSR     R5,     L_6004                  ; F18F   0004 0160 0004
        DECLE   $0163                           ; F192   0163

        PULR    R7                              ; F193   02B7

        PSHR    R5                              ; F194   0275
        PSHR    R0                              ; F195   0270
        MOVR    R0,     R2                      ; F196   0082
        SLL     R2,     2                       ; F197   004E
        PSHR    R2                              ; F198   0272
        ADDR    R2,     R2                      ; F199   00D2
        ADD@    R6,     R2                      ; F19A   02F2
        SUBR    R0,     R2                      ; F19B   0102
        SDBD                                    ; F19C   0001
        ADDI    #$9DFC, R2                      ; F19D   02FA 00FC 009D
        PULR    R0                              ; F1A0   02B0
        PULR    R5                              ; F1A1   02B5
        ADD@    R5,     R2                      ; F1A2   02EA
        PSHR    R5                              ; F1A3   0275
        MOVR    R2,     R5                      ; F1A4   0095
        PULR    R7                              ; F1A5   02B7

        CMPR    R3,     R5                      ; F1A6   015D
        CMPR    R4,     R3                      ; F1A7   0163
        PSHR    R5                              ; F1A8   0275
        SDBD                                    ; F1A9   0001
        MVII    #$A1A6, R5                      ; F1AA   02BD 00A6 00A1
        ADD     G_0171, R5                      ; F1AD   02C5 0171
        MVI@    R5,     R5                      ; F1AF   02AD
        PULR    R7                              ; F1B0   02B7

        CMPR    R5,     R1                      ; F1B1   0169
        CMPR    R5,     R5                      ; F1B2   016D
        PSHR    R5                              ; F1B3   0275
        SDBD                                    ; F1B4   0001
        MVII    #$A1B1, R5                      ; F1B5   02BD 00B1 00A1
        ADD     G_0171, R5                      ; F1B8   02C5 0171
        MVI@    R5,     R5                      ; F1BA   02AD
        PULR    R7                              ; F1BB   02B7
        B       L_F436                          ; F1BC   0200 0278

        PSHR    R5                              ; F1BE   0275
        SDBD                                    ; F1BF   0001
        MVII    #$A1BC, R4                      ; F1C0   02BC 00BC 00A1
        ADD     G_0171, R4                      ; F1C3   02C4 0171
        MVI@    R4,     R4                      ; F1C5   02A4
        PULR    R7                              ; F1C6   02B7

        PSHR    R5                              ; F1C7   0275
        SDBD                                    ; F1C8   0001
        ADDI    #$A1A6, R2                      ; F1C9   02FA 00A6 00A1
        MVI@    R2,     R5                      ; F1CC   0295
        INCR    R5                              ; F1CD   000D
        CMP@    R5,     R0                      ; F1CE   0368
        BEQ     L_F1E4                          ; F1CF   0204 0013

        CMP@    R5,     R0                      ; F1D1   0368
        BEQ     L_F1E4                          ; F1D2   0204 0010

        CMP@    R5,     R0                      ; F1D4   0368
        BEQ     L_F1E4                          ; F1D5   0204 000D

        CMP@    R5,     R0                      ; F1D7   0368
        BEQ     L_F1E4                          ; F1D8   0204 000A

        CMP@    R5,     R0                      ; F1DA   0368
        BEQ     L_F1E4                          ; F1DB   0204 0007

L_F1DD:
        MVI     .BTAB.DC,R0                     ; F1DD   0280 02DC
        INCR    R0                              ; F1DF   0008
        MVO     R0,     G_00DC                  ; F1E0   0240 00DC
        B       L_F1DD                          ; F1E2   0220 0006

L_F1E4:
        SUB@    R2,     R5                      ; F1E4   0315
        PULR    R7                              ; F1E5   02B7

        CMPR    R5,     R6                      ; F1E6   016E
        CMPR    R5,     R2                      ; F1E7   016A
        CMPR    R5,     R7                      ; F1E8   016F
        CMPR    R5,     R3                      ; F1E9   016B
        CMPR    R6,     R0                      ; F1EA   0170
        CMPR    R5,     R4                      ; F1EB   016C
        PSHR    R5                              ; F1EC   0275
        MOVR    R0,     R5                      ; F1ED   0085
        SDBD                                    ; F1EE   0001
        ADDI    #$A1E5, R5                      ; F1EF   02FD 00E5 00A1
        MVI@    R5,     R5                      ; F1F2   02AD
        MVI@    R5,     R5                      ; F1F3   02AD
        PULR    R7                              ; F1F4   02B7

        PSHR    R5                              ; F1F5   0275
        MOVR    R1,     R5                      ; F1F6   008D
L_F1F7:
        MVI@    R5,     R0                      ; F1F7   02A8
        TSTR    R0                              ; F1F8   0080
        BNEQ    L_F1F7                          ; F1F9   022C 0003

        SUBR    R1,     R5                      ; F1FB   010D
        DECR    R5                              ; F1FC   0015
        MOVR    R5,     R0                      ; F1FD   00A8
        PULR    R7                              ; F1FE   02B7

        DECLE   $0275,  $02BA,  $0193,  $02BB   ; F1FF   0275 02BA 0193 02BB
        DECLE   $016A,  $02BC,  $015E,  $0004   ; F203   016A 02BC 015E 0004
        DECLE   $01A0,  $0211,  $02BB,  $016E   ; F207   01A0 0211 02BB 016E
        DECLE   $02BC,  $0164,  $0004,  $01A0   ; F20B   02BC 0164 0004 01A0
        DECLE   $0211                           ; F20F   0211

        PULR    R7                              ; F210   02B7

        PSHR    R5                              ; F211   0275
        MVII    #$0005, R1                      ; F212   02B9 0005
L_F214:
        MVI@    R4,     R0                      ; F214   02A0
        MOVR    R3,     R5                      ; F215   009D
        CMP@    R5,     R0                      ; F216   0368
        BEQ     L_F22B                          ; F217   0204 0012

        CMP@    R5,     R0                      ; F219   0368
        BEQ     L_F22B                          ; F21A   0204 000F

        CMP@    R5,     R0                      ; F21C   0368
        BEQ     L_F22B                          ; F21D   0204 000C

        MVI     G_0177, R0                      ; F21F   0280 0177
        CMPI    #$0001, R0                      ; F221   0378 0001
        BEQ     L_F232                          ; F223   0204 000D

        MVI@    R2,     R0                      ; F225   0290
        DECR    R0                              ; F226   0010
        BMI     L_F232                          ; F227   020B 0009
        B       L_F231                          ; F229   0200 0006

L_F22B:
        MVI@    R2,     R0                      ; F22B   0290
        CMPI    #$00FF, R0                      ; F22C   0378 00FF
        BEQ     L_F232                          ; F22E   0204 0002

        INCR    R0                              ; F230   0008
L_F231:
        MVO@    R0,     R2                      ; F231   0250
L_F232:
        ADDI    #$0009, R2                      ; F232   02FA 0009
        DECR    R1                              ; F234   0011
        BNEQ    L_F214                          ; F235   022C 0022
        PULR    R7                              ; F237   02B7

        PSHR    R1                              ; F238   0271
        MVII    #$0001, R1                      ; F239   02B9 0001
        B       L_F241                          ; F23B   0200 0004

        PSHR    R1                              ; F23D   0271
        MVII    #$0001, R1                      ; F23E   02B9 0001
        NEGR    R1                              ; F240   0021
L_F241:
        PSHR    R4                              ; F241   0274
        DECLE   $0004                           ; F242   0004

        MOVR    R4,     R0                      ; F243   00A0
        MVO@    R4,     R2                      ; F244   0254
        ADD@    R5,     R4                      ; F245   02EC
        ADD@    R4,     R1                      ; F246   02E1
        DECR    R4                              ; F247   0014
        MVO@    R1,     R4                      ; F248   0261
        PULR    R4                              ; F249   02B4
        PULR    R1                              ; F24A   02B1
        MOVR    R5,     R7                      ; F24B   00AF

        DECLE   $0274,  $0004                   ; F24C   0274 0004

        MOVR    R4,     R0                      ; F24E   00A0
        MVO@    R4,     R2                      ; F24F   0254
        ADD@    R5,     R4                      ; F250   02EC
        MVI@    R4,     R0                      ; F251   02A0
        PULR    R4                              ; F252   02B4
        MOVR    R5,     R7                      ; F253   00AF

        PSHR    R4                              ; F254   0274
        MVII    #$015E, R4                      ; F255   02BC 015E
        CMP@    R4,     R0                      ; F257   0360
        BEQ     L_F27E                          ; F258   0204 0024

        CMP@    R4,     R0                      ; F25A   0360
        BEQ     L_F27E                          ; F25B   0204 0021

        CMP@    R4,     R0                      ; F25D   0360
        BEQ     L_F27E                          ; F25E   0204 001E

        CMP@    R4,     R0                      ; F260   0360
        BEQ     L_F27E                          ; F261   0204 001B

        CMP@    R4,     R0                      ; F263   0360
        BEQ     L_F27E                          ; F264   0204 0018

        INCR    R4                              ; F266   000C
        CMP@    R4,     R0                      ; F267   0360
        BEQ     L_F27D                          ; F268   0204 0013

        CMP@    R4,     R0                      ; F26A   0360
        BEQ     L_F27D                          ; F26B   0204 0010

        CMP@    R4,     R0                      ; F26D   0360
        BEQ     L_F27D                          ; F26E   0204 000D

        CMP@    R4,     R0                      ; F270   0360
        BEQ     L_F27D                          ; F271   0204 000A

        CMP@    R4,     R0                      ; F273   0360
        BEQ     L_F27D                          ; F274   0204 0007

L_F276:
        MVI     .BTAB.E6,R0                     ; F276   0280 02E6
        INCR    R0                              ; F278   0008
        MVO     R0,     .BTAB.E6                ; F279   0240 02E6
        B       L_F276                          ; F27B   0220 0006

L_F27D:
        DECR    R4                              ; F27D   0014
L_F27E:
        SUBI    #$015F, R4                      ; F27E   033C 015F
        PSHR    R4                              ; F280   0274
        ADDR    R4,     R4                      ; F281   00E4
        ADDR    R4,     R4                      ; F282   00E4
        ADDR    R4,     R4                      ; F283   00E4
        ADD@    R6,     R4                      ; F284   02F4
        ADDI    #$018B, R4                      ; F285   02FC 018B
        PULR    R7                              ; F287   02B7

        DECLE   $00AC,  $0004,  $01A0,  $0194   ; F288   00AC 0004 01A0 0194
        DECLE   $0000,  $02E5,  $0274,  $0272   ; F28C   0000 02E5 0274 0272
        DECLE   $0273,  $02A9,  $0004,  $01A0   ; F290   0273 02A9 0004 01A0
        DECLE   $0194,  $0006,  $02AA,  $0093   ; F294   0194 0006 02AA 0093
        DECLE   $0094,  $0067,  $011A,  $0004   ; F298   0094 0067 011A 0004

        ANDR    R4,     R0                      ; F29C   01A0
        MVO@    R4,     R1                      ; F29D   024C
        INCR    R0                              ; F29E   0008
        CMPR    R4,     R0                      ; F29F   0160
        BLE     L_F2A3                          ; F2A0   0206 0001

        MOVR    R4,     R0                      ; F2A2   00A0
L_F2A3:
        MOVR    R1,     R4                      ; F2A3   008C
        SUBR    R2,     R0                      ; F2A4   0110
        BMI     L_F2AD                          ; F2A5   020B 0006

        SLR     R1,     1                       ; F2A7   0061
        SUBR    R0,     R4                      ; F2A8   0104
        CMPR    R1,     R4                      ; F2A9   014C
        BGE     L_F2AD                          ; F2AA   020D 0001

        MOVR    R1,     R4                      ; F2AC   008C
L_F2AD:
        MOVR    R4,     R0                      ; F2AD   00A0
        PULR    R3                              ; F2AE   02B3
        PULR    R2                              ; F2AF   02B2
        PULR    R7                              ; F2B0   02B7

        DECLE   $0275,  $01C9,  $02BA,  $0005   ; F2B1   0275 01C9 02BA 0005
        DECLE   $0004                           ; F2B5   0004

        ANDR    R4,     R0                      ; F2B6   01A0
        ANDR    R5,     R0                      ; F2B7   01A8
        MOVR    R5,     R4                      ; F2B8   00AC
        INCR    R4                              ; F2B9   000C
L_F2BA:
        MVI@    R4,     R0                      ; F2BA   02A0
        DECLE   $0004                           ; F2BB   0004

        ANDR    R4,     R0                      ; F2BC   01A0
        MVO@    R4,     R1                      ; F2BD   024C
        CLRC                                    ; F2BE   0006
        CMPI    #$0006, R0                      ; F2BF   0378 0006
        BLT     L_F2C4                          ; F2C1   0205 0001

        INCR    R1                              ; F2C3   0009
L_F2C4:
        DECR    R2                              ; F2C4   0012
        BNEQ    L_F2BA                          ; F2C5   022C 000C

        CMPI    #$0003, R1                      ; F2C7   0379 0003
        PULR    R7                              ; F2C9   02B7

        SWAP    R1,     1                       ; F2CA   0041
        DECR    R3                              ; F2CB   0013
        RSWD    R1                              ; F2CC   0039
        ADCR    R3                              ; F2CD   002B
        ADCR    R7                              ; F2CE   002F

        NEGR    R1                              ; F2CF   0021
L_F2D0:
        SWAP    R1,     1                       ; F2D0   0041
        DECLE   $001F                           ; F2D1   001F

        SLL     R0,     1                       ; F2D2   0048
        SLR     R2,     2                       ; F2D3   0066
        RSWD    R1                              ; F2D4   0039
        SARC    R0,     1                       ; F2D5   0078
        SWAP    R1,     1                       ; F2D6   0041
        DECR    R3                              ; F2D7   0013
        SWAP    R1,     1                       ; F2D8   0041
        MOVR    R2,     R5                      ; F2D9   0095
        RSWD    R1                              ; F2DA   0039
        SARC    R3,     1                       ; F2DB   007B
        ADCR    R7                              ; F2DC   002F
        MOVR    R0,     R7                      ; F2DD   0087

L_F2DE:
        SWAP    R1,     1                       ; F2DE   0041
        TSTR    R1                              ; F2DF   0089
        SLL     R0,     1                       ; F2E0   0048
        SWAP    R2,     1                       ; F2E1   0042
        RSWD    R1                              ; F2E2   0039
        GSWD    R0                              ; F2E3   0030
        SWAP    R1,     1                       ; F2E4   0041
        MOVR    R2,     R5                      ; F2E5   0095
        SWAP    R1,     1                       ; F2E6   0041
        SAR     R2,     2                       ; F2E7   006E
        RSWD    R1                              ; F2E8   0039
        ADCR    R3                              ; F2E9   002B
        ADCR    R7                              ; F2EA   002F

        SLR     R0,     1                       ; F2EB   0060
L_F2EC:
        SWAP    R1,     1                       ; F2EC   0041
        SLLC    R0,     1                       ; F2ED   0058
        SLL     R0,     1                       ; F2EE   0048
        SLR     R2,     2                       ; F2EF   0066
        RSWD    R1                              ; F2F0   0039
        SARC    R0,     1                       ; F2F1   0078
        SWAP    R1,     1                       ; F2F2   0041
        SAR     R2,     2                       ; F2F3   006E
        SWAP    R1,     1                       ; F2F4   0041
        DECR    R4                              ; F2F5   0014
        RSWD    R1                              ; F2F6   0039
        SARC    R3,     1                       ; F2F7   007B
        ADCR    R7                              ; F2F8   002F

        SWAP    R2,     2                       ; F2F9   0046
L_F2FA:
        SWAP    R1,     1                       ; F2FA   0041
        DECLE   $0050,  $0048,  $0039,  $0039   ; F2FB   0050 0048 0039 0039
        DECLE   $0030,  $0041,  $0014,  $0000   ; F2FF   0030 0041 0014 0000
        DECLE   $0000,  $0000,  $0000,  $006E   ; F303   0000 0000 0000 006E
        DECLE   $00A3,  $006E,  $00A3,  $006E   ; F307   00A3 006E 00A3 006E
        DECLE   $00A3,  $0275,  $0280,  $01EB   ; F30B   00A3 0275 0280 01EB
        DECLE   $03B8,  $0080,  $0204,  $0010   ; F30F   03B8 0080 0204 0010

        MVI     G_01EB, R0                      ; F313   0280 01EB
        SDBD                                    ; F315   0001
        ANDI    #$FF7F, R0                      ; F316   03B8 007F 00FF
        MVO     R0,     G_01EB                  ; F319   0240 01EB

        JSR     R5,     .EXEC.A61               ; F31B   0004 0118 0261

        COMR    R6                              ; F31E   001E

        JSR     R5,     L_62F0                  ; F31F   0004 0160 02F0

        PULR    R7                              ; F322   02B7

        DECLE   $0004                           ; F323   0004

        ANDR    R5,     R4                      ; F324   01AC
        MOVR    R0,     R5                      ; F325   0085
        MVI     G_017B, R0                      ; F326   0280 017B
        ANDI    #$0001, R0                      ; F328   03B8 0001
        XORI    #$00E0, R0                      ; F32A   03F8 00E0
        MVO     R0,     G_017B                  ; F32C   0240 017B
        SDBD                                    ; F32E   0001
        MVII    #$98B6, R0                      ; F32F   02B8 00B6 0098
        MVO     R0,     G_031E                  ; F332   0240 031E

        JSR     R5,     L_551E                  ; F334   0004 0154 011E

        SDBD                                    ; F337   0001
        MVII    #$98AF, R0                      ; F338   02B8 00AF 0098
        INCR    R1                              ; F33B   0009
        MVO@    R0,     R1                      ; F33C   0248
        INCR    R1                              ; F33D   0009
        MVI@    R1,     R0                      ; F33E   0288
        SWAP    R0,     1                       ; F33F   0040
        ANDI    #$00FF, R0                      ; F340   03B8 00FF
        SUBI    #$0002, R1                      ; F342   0339 0002
        MVI@    R1,     R3                      ; F344   028B
        SDBD                                    ; F345   0001
        ANDI    #$FDFF, R3                      ; F346   03BB 00FF 00FD

        JSR     R5,     L_5B29                  ; F349   0004 0158 0329

        CMPR    R2,     R0                      ; F34C   0150
        BMI     L_F351                          ; F34D   020B 0002

        XORI    #$0200, R3                      ; F34F   03FB 0200
L_F351:
        MVO@    R3,     R1                      ; F351   024B
        CLRR    R0                              ; F352   01C0
        MOVR    R0,     R4                      ; F353   0084

        JSR     R5,     L_59B5                  ; F354   0004 0158 01B5
        JSR     R5,     L_5716                  ; F357   0004 0154 0316
        DECLE   $0004,  $01AC,  $0233,  $0004   ; F35A   0004 01AC 0233 0004
        DECLE   $01A8,  $0000                   ; F35E   01A8 0000

        CMPR    R7,     R3                      ; F360   017B
        CLRC                                    ; F361   0006
        ADCR    R0                              ; F362   0028

        JSR     R5,     L_5588                  ; F363   0004 0154 0188
        DECLE   $02B5,  $00B8,  $0338,  $0066   ; F366   02B5 00B8 0338 0066
        DECLE   $0004                           ; F36A   0004

        AND@    R5,     R4                      ; F36B   03AC
        MOVR    R6,     R2                      ; F36C   00B2
L_F36D:
        PULR    R7                              ; F36D   02B7

        XOR     G_017B, R1                      ; F36E   03C1 017B
        ANDI    #$0001, R1                      ; F370   03B9 0001
        BNEQ    L_F391                          ; F372   020C 001D

        PSHR    R5                              ; F374   0275

        JSR     R5,     L_5518                  ; F375   0004 0154 0118

        BNEQ    L_F36D                          ; F378   022C 000C

        MVI     G_01EA, R0                      ; F37A   0280 01EA
        DECR    R0                              ; F37C   0010
        MVO     R0,     G_01EA                  ; F37D   0240 01EA
        SDBD                                    ; F37F   0001
        MVII    #$9934, R2                      ; F380   02BA 0034 0099
        CLRR    R3                              ; F383   01DB
        MVII    #$020F, R4                      ; F384   02BC 020F
        COMR    R4                              ; F386   001C

        JSR     R5,     L_553B                  ; F387   0004 0154 013B

        MVII    #$0003, R4                      ; F38A   02BC 0003
        MVII    #$000A, R3                      ; F38C   02BB 000A
        J       L_54E0                          ; F38E   0004 0354 00E0
L_F391:
        MOVR    R5,     R7                      ; F391   00AF

        DECLE   $0275,  $02B9,  $031D,  $0004   ; F392   0275 02B9 031D 0004

        ANDR    R5,     R4                      ; F396   01AC
        XORR    R4,     R6                      ; F397   01E6
        CLRR    R0                              ; F398   01C0
        MVO     R0,     G_031E                  ; F399   0240 031E
        MVII    #$0321, R5                      ; F39B   02BD 0321
        MVO@    R0,     R5                      ; F39D   0268
        MVI     G_017B, R1                      ; F39E   0281 017B
        MVO@    R0,     R5                      ; F3A0   0268
        MVO@    R0,     R5                      ; F3A1   0268
        DECR    R0                              ; F3A2   0010
        MVO     R0,     G_0187                  ; F3A3   0240 0187
        MOVR    R1,     R2                      ; F3A5   008A
        MVO     R2,     G_017B                  ; F3A6   0242 017B
        XOR     G_017A, R1                      ; F3A8   03C1 017A
        ANDI    #$0001, R1                      ; F3AA   03B9 0001
        ANDI    #$0001, R2                      ; F3AC   03BA 0001
        MVI     G_01EB, R0                      ; F3AE   0280 01EB
        ANDI    #$000F, R0                      ; F3B0   03B8 000F
        CMPI    #$0001, R0                      ; F3B2   0378 0001
        BGT     L_F3BB                          ; F3B4   020E 0005

        MOVR    R7,     R4                      ; F3B6   00BC
        SUBI    #$00ED, R4                      ; F3B7   033C 00ED
        B       L_F3BE                          ; F3B9   0200 0003

L_F3BB:
        MOVR    R7,     R4                      ; F3BB   00BC
        SUBI    #$00D6, R4                      ; F3BC   033C 00D6
L_F3BE:
        MOVR    R7,     R0                      ; F3BE   00B8
        SUBI    #$00B3, R0                      ; F3BF   0338 00B3
        TSTR    R1                              ; F3C1   0089
        BEQ     L_F3C6                          ; F3C2   0204 0002

        ADDI    #$000E, R4                      ; F3C4   02FC 000E
L_F3C6:
        SLL     R2,     1                       ; F3C6   004A
        DECLE   $00D4,  $02B5,  $0004           ; F3C7   00D4 02B5 0004

        AND@    R5,     R4                      ; F3CA   03AC
        ADDR    R7,     R2                      ; F3CB   00FA
        PSHR    R5                              ; F3CC   0275
        SDBD                                    ; F3CD   0001
        MVII    #$A45A, R0                      ; F3CE   02B8 005A 00A4
        MVO     R0,     G_031D                  ; F3D1   0240 031D
        CLRR    R0                              ; F3D3   01C0
        MVO     R0,     G_0102                  ; F3D4   0240 0102
        MVO     R0,     G_0103                  ; F3D6   0240 0103

        JSR     R5,     L_5E9D                  ; F3D8   0004 015C 029D
        DECLE   $0000,  $0000,  $0000,  $0000   ; F3DB   0000 0000 0000 0000

        JSR     R5,     L_6648                  ; F3DF   0004 0164 0248

        SDBD                                    ; F3E2   0001
        MVII    #$A400, R0                      ; F3E3   02B8 0000 00A4
        MVO     R0,     .ISRVEC.0               ; F3E6   0240 0100
        SWAP    R0,     1                       ; F3E8   0040
        MVO     R0,     .ISRVEC.1               ; F3E9   0240 0101
        EIS                                     ; F3EB   0002
L_F3EC:
        INCR    R0                              ; F3EC   0008
        B       L_F3EC                          ; F3ED   0220 0002

L_F3EF:
        MVI     .PSG0.rgt_hand,R0               ; F3EF   0280 01FE
        AND     .PSG0.lft_hand,R0               ; F3F1   0380 01FF
        CMPI    #$00FF, R0                      ; F3F3   0378 00FF
        BEQ     L_F3EF                          ; F3F5   0224 0007

L_F3F7:
        MVI     .PSG0.rgt_hand,R0               ; F3F7   0280 01FE
        AND     .PSG0.lft_hand,R0               ; F3F9   0380 01FF
        CMPI    #$00FF, R0                      ; F3FB   0378 00FF
        BNEQ    L_F3F7                          ; F3FD   022C 0007
        PULR    R7                              ; F3FF   02B7

        PSHR    R5                              ; F400   0275
        MVII    #$0002, R0                      ; F401   02B8 0002
        MVO     R0,     .STIC.EDGE              ; F403   0240 0032
        MVO     R0,     .STIC.VIDEN             ; F405   0240 0020
        MVI     .STIC.MODE,R0                   ; F407   0280 0021
        CLRR    R0                              ; F409   01C0
        CLRR    R5                              ; F40A   01ED
L_F40B:
        MVO@    R0,     R5                      ; F40B   0268
        CMPI    #$0018, R5                      ; F40C   037D 0018
        BNEQ    L_F40B                          ; F40E   022C 0004

        MVI     G_0102, R0                      ; F410   0280 0102
        DECR    R0                              ; F412   0010
        MVO     R0,     G_0102                  ; F413   0240 0102
        BPL     L_F459                          ; F415   0203 0042

        MVII    #$0001, R0                      ; F417   02B8 0001
        MVO     R0,     G_0102                  ; F419   0240 0102
        MVI     G_0103, R0                      ; F41B   0280 0103
        DECR    R0                              ; F41D   0010
        MVO     R0,     G_0103                  ; F41E   0240 0103
        MVO     R0,     .STIC.VDLY              ; F420   0240 0031
        BPL     L_F459                          ; F422   0203 0035

        MVII    #$0007, R0                      ; F424   02B8 0007
        MVO     R0,     G_0103                  ; F426   0240 0103
        MVII    #$0214, R4                      ; F428   02BC 0214
        MVII    #$0200, R5                      ; F42A   02BD 0200
        MVII    #$000B, R2                      ; F42C   02BA 000B
L_F42E:
        MVII    #$0014, R3                      ; F42E   02BB 0014
L_F430:
        MVI@    R4,     R0                      ; F430   02A0
        MVO@    R0,     R5                      ; F431   0268
        DECR    R3                              ; F432   0013
        BNEQ    L_F430                          ; F433   022C 0004

        DECR    R2                              ; F435   0012
L_F436:
        BNEQ    L_F42E                          ; F436   022C 0009

        CLRR    R0                              ; F438   01C0
        MVII    #$0014, R3                      ; F439   02BB 0014
L_F43B:
        MVO@    R0,     R5                      ; F43B   0268
        DECR    R3                              ; F43C   0013
        BNEQ    L_F43B                          ; F43D   022C 0003

        MVI     G_031D, R5                      ; F43F   0285 031D
        MVI@    R5,     R4                      ; F441   02AC
        CMPI    #$0001, R4                      ; F442   037C 0001
        BLT     L_F457                          ; F444   0205 0011
        BEQ     L_F454                          ; F446   0204 000C

        MVI@    R5,     R3                      ; F448   02AB
L_F449:
        MVI@    R5,     R0                      ; F449   02A8
        SUBI    #$0020, R0                      ; F44A   0338 0020
        BMI     L_F457                          ; F44C   020B 0009

        SLL     R0,     2                       ; F44E   004C
        SLL     R0,     1                       ; F44F   0048
        XORR    R3,     R0                      ; F450   01D8
        MVO@    R0,     R4                      ; F451   0260
        B       L_F449                          ; F452   0220 000A

L_F454:
        SDBD                                    ; F454   0001
        MVI@    R5,     R0                      ; F455   02A8
        MOVR    R0,     R5                      ; F456   0085
L_F457:
        MVO     R5,     G_031D                  ; F457   0245 031D
L_F459:
        PULR    R7                              ; F459   02B7

        DECLE   $0000,  $02E3,  $0007,  $0053   ; F45A   0000 02E3 0007 0053
        DECLE   $004C,  $0041,  $004D,  $0000   ; F45E   004C 0041 004D 0000
        DECLE   $02E5,  $0007,  $0044,  $0055   ; F462   02E5 0007 0044 0055
        DECLE   $004E,  $004B,  $0000,  $0000   ; F466   004E 004B 0000 0000
        DECLE   $02E1,  $0003,  $0053,  $0075   ; F46A   02E1 0003 0053 0075
        DECLE   $0070,  $0065,  $0072,  $0020   ; F46E   0070 0065 0072 0020
        DECLE   $0050,  $0072,  $006F,  $0000   ; F472   0050 0072 006F 0000
        DECLE   $02E1,  $0003,  $0042,  $0061   ; F476   02E1 0003 0042 0061
        DECLE   $0073,  $006B,  $0065,  $0074   ; F47A   0073 006B 0065 0074
        DECLE   $0062,  $0061,  $006C,  $006C   ; F47E   0062 0061 006C 006C
        DECLE   $0000,  $0000,  $0000,  $0000   ; F482   0000 0000 0000 0000
        DECLE   $02DD,  $0005,  $0050,  $0072   ; F486   02DD 0005 0050 0072
        DECLE   $006F,  $0067,  $0072,  $0061   ; F48A   006F 0067 0072 0061
        DECLE   $006D,  $006D,  $0065,  $0064   ; F48E   006D 006D 0065 0064
        DECLE   $0020,  $0061,  $006E,  $0064   ; F492   0020 0061 006E 0064
        DECLE   $0000,  $02DD,  $0005,  $0044   ; F496   0000 02DD 0005 0044
        DECLE   $0065,  $0073,  $0069,  $0067   ; F49A   0065 0073 0069 0067
        DECLE   $006E,  $0065,  $0064,  $0020   ; F49E   006E 0065 0064 0020
        DECLE   $0062,  $0079,  $003A,  $0000   ; F4A2   0062 0079 003A 0000
        DECLE   $0000,  $02E1,  $0006,  $0053   ; F4A6   0000 02E1 0006 0053
        DECLE   $0074,  $0065,  $0076,  $0065   ; F4AA   0074 0065 0076 0065
        DECLE   $0020,  $0045,  $0074,  $0074   ; F4AE   0020 0045 0074 0074
        DECLE   $0069,  $006E,  $0067,  $0065   ; F4B2   0069 006E 0067 0065
        DECLE   $0072,  $0000,  $02E4,  $0006   ; F4B6   0072 0000 02E4 0006
        DECLE   $0044,  $0061,  $0076,  $0065   ; F4BA   0044 0061 0076 0065
        DECLE   $0020,  $0057,  $0061,  $0072   ; F4BE   0020 0057 0061 0072
        DECLE   $0068,  $006F,  $006C,  $0000   ; F4C2   0068 006F 006C 0000
        DECLE   $0000,  $0000,  $02DD,  $0005   ; F4C6   0000 0000 02DD 0005
        DECLE   $0047,  $0072,  $0061,  $0070   ; F4CA   0047 0072 0061 0070
        DECLE   $0068,  $0069,  $0063,  $0073   ; F4CE   0068 0069 0063 0073
        DECLE   $0020,  $0042,  $0079,  $003A   ; F4D2   0020 0042 0079 003A
        DECLE   $0000,  $0000,  $02E1,  $0006   ; F4D6   0000 0000 02E1 0006
        DECLE   $0043,  $006F,  $006E,  $006E   ; F4DA   0043 006F 006E 006E
        DECLE   $0069,  $0065,  $0020,  $0047   ; F4DE   0069 0065 0020 0047
        DECLE   $006F,  $006C,  $0064,  $006D   ; F4E2   006F 006C 0064 006D
        DECLE   $0061,  $006E,  $0000,  $0000   ; F4E6   0061 006E 0000 0000
        DECLE   $0000,  $02DD,  $0005,  $0050   ; F4EA   0000 02DD 0005 0050
        DECLE   $0072,  $006F,  $0064,  $0075   ; F4EE   0072 006F 0064 0075
        DECLE   $0063,  $0065,  $0064,  $0020   ; F4F2   0063 0065 0064 0020
        DECLE   $0042,  $0079,  $003A,  $0000   ; F4F6   0042 0079 003A 0000
        DECLE   $0000,  $02E4,  $0006,  $0044   ; F4FA   0000 02E4 0006 0044
        DECLE   $0061,  $0076,  $0065,  $0020   ; F4FE   0061 0076 0065 0020
        DECLE   $0057,  $0061,  $0072,  $0068   ; F502   0057 0061 0072 0068
        DECLE   $006F,  $006C,  $0000,  $02DD   ; F506   006F 006C 0000 02DD
        DECLE   $0005,  $0066,  $006F,  $0072   ; F50A   0005 0066 006F 0072
        DECLE   $0000,  $02E5,  $0006,  $0049   ; F50E   0000 02E5 0006 0049
        DECLE   $004E,  $0054,  $0056,  $0020   ; F512   004E 0054 0056 0020
        DECLE   $0043,  $006F,  $0072,  $0070   ; F516   0043 006F 0072 0070
        DECLE   $002E,  $0000,  $0000,  $0000   ; F51A   002E 0000 0000 0000
        DECLE   $0000,  $02E3,  $0007,  $0053   ; F51E   0000 02E3 0007 0053
        DECLE   $004C,  $0041,  $004D,  $0000   ; F522   004C 0041 004D 0000
        DECLE   $02E5,  $0007,  $0044,  $0055   ; F526   02E5 0007 0044 0055
        DECLE   $004E,  $004B,  $0000,  $0000   ; F52A   004E 004B 0000 0000
        DECLE   $02E1,  $0003,  $0053,  $0075   ; F52E   02E1 0003 0053 0075
        DECLE   $0070,  $0065,  $0072,  $0020   ; F532   0070 0065 0072 0020
        DECLE   $0050,  $0072,  $006F,  $0000   ; F536   0050 0072 006F 0000
        DECLE   $02E1,  $0003,  $0042,  $0061   ; F53A   02E1 0003 0042 0061
        DECLE   $0073,  $006B,  $0065,  $0074   ; F53E   0073 006B 0065 0074
        DECLE   $0062,  $0061,  $006C,  $006C   ; F542   0062 0061 006C 006C
        DECLE   $0000,  $0000,  $02DD,  $0003   ; F546   0000 0000 02DD 0003
        DECLE   $0043,  $006F,  $0070,  $0079   ; F54A   0043 006F 0070 0079
        DECLE   $0072,  $0069,  $0067,  $0068   ; F54E   0072 0069 0067 0068
        DECLE   $0074,  $0020,  $0028,  $0063   ; F552   0074 0020 0028 0063
        DECLE   $0029,  $0020,  $0031,  $0039   ; F556   0029 0020 0031 0039
        DECLE   $0038,  $0037,  $0000,  $02E1   ; F55A   0038 0037 0000 02E1
        DECLE   $0003,  $0049,  $004E,  $0054   ; F55E   0003 0049 004E 0054
        DECLE   $0056,  $0020,  $0043,  $006F   ; F562   0056 0020 0043 006F
        DECLE   $0072,  $0070,  $002E,  $0000   ; F566   0072 0070 002E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F56A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F56E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; F572   0000 0000 0000 0000
        DECLE   $0001,  $005A,  $00A4,  $000F   ; F576   0001 005A 00A4 000F
        DECLE   $000F,  $0000,  $0000,  $0001   ; F57A   000F 0000 0000 0001
        DECLE   $0001,  $0001,  $0002,  $0002   ; F57E   0001 0001 0002 0002
        DECLE   $0002,  $0275,  $0280,  $01EC   ; F582   0002 0275 0280 01EC
        DECLE   $0080,  $0204,  $0004,  $01C9   ; F586   0080 0204 0004 01C9
        DECLE   $0004,  $01A4,  $0198,  $0280   ; F58A   0004 01A4 0198 0280
        DECLE   $01ED,  $0080,  $0204,  $0005   ; F58E   01ED 0080 0204 0005
        DECLE   $02B9,  $0001,  $0004           ; F592   02B9 0001 0004

        ANDR    R4,     R4                      ; F595   01A4
        ANDR    R3,     R0                      ; F596   0198
L_F597:
        PULR    R7                              ; F597   02B7

        PSHR    R5                              ; F598   0275
        MVO     R1,     G_0171                  ; F599   0241 0171
        MVII    #$0131, R3                      ; F59B   02BB 0131
        ADDR    R1,     R3                      ; F59D   00CB
        MVI@    R3,     R0                      ; F59E   0298
        DECR    R0                              ; F59F   0010
        BMI     L_F597                          ; F5A0   022B 000A

        MVO@    R0,     R3                      ; F5A2   0258
        BNEQ    L_F597                          ; F5A3   022C 000D

        MVII    #$0019, R5                      ; F5A5   02BD 0019
        MVO     R5,     G_011E                  ; F5A7   0245 011E
        ADDI    #$0002, R3                      ; F5A9   02FB 0002
        MVI@    R3,     R2                      ; F5AB   029A
        INCR    R2                              ; F5AC   000A
        ADDR    R7,     R2                      ; F5AD   00FA
        ADD@    R2,     R7                      ; F5AE   02D7

        DECLE   $0015,  $0021,  $0024,  $0044   ; F5AF   0015 0021 0024 0044
        DECLE   $00AC,  $00BD,  $00CB,  $00D6   ; F5B3   00AC 00BD 00CB 00D6
        DECLE   $01C0,  $021F                   ; F5B7   01C0 021F

        SUBR    R3,     R4                      ; F5B9   011C
        SAR     R0,     2                       ; F5BA   006C
        SARC    R2,     1                       ; F5BB   007A
        MOVR    R1,     R0                      ; F5BC   0088
        MOVR    R2,     R6                      ; F5BD   0096
        SUBR    R1,     R4                      ; F5BE   010C
        DECR    R1                              ; F5BF   0011
        MVII    #$000A, R0                      ; F5C0   02B8 000A
        B       L_F5CC                          ; F5C2   0200 0008

        DECLE   $0004,  $01A8,  $0000,  $0171   ; F5C4   0004 01A8 0000 0171
        DECLE   $0010,  $000F                   ; F5C8   0010 000F

        MVII    #$000B, R0                      ; F5CA   02B8 000B

L_F5CC:
        JSR     R5,     L_606B                  ; F5CC   0004 0160 006B

        PULR    R7                              ; F5CF   02B7

        DECLE   $0004,  $01A8,  $0065,  $0004   ; F5D0   0004 01A8 0065 0004
        DECLE   $01A8,  $004C,  $0201,  $0008   ; F5D4   01A8 004C 0201 0008

        MVII    #$000B, R0                      ; F5D8   02B8 000B
        MVI     G_0171, R1                      ; F5DA   0281 0171

        JSR     R5,     L_63FE                  ; F5DC   0004 0160 03FE

        PULR    R7                              ; F5DF   02B7

        DECLE   $0004,  $01A0,  $01A8,  $0281   ; F5E0   0004 01A0 01A8 0281
        DECLE   $0171,  $02F9,  $01E5,  $02CD   ; F5E4   0171 02F9 01E5 02CD
        DECLE   $02A8,  $0004,  $01A8,  $0037   ; F5E8   02A8 0004 01A8 0037
        DECLE   $0209,  $0013,  $0004           ; F5EC   0209 0013 0004

        ANDR    R5,     R0                      ; F5EF   01A8
        ADCR    R4                              ; F5F0   002C
        BNC     L_F60E                          ; F5F1   0209 001B

L_F5F3:
        MVII    #$000C, R0                      ; F5F3   02B8 000C
        MVI     G_0171, R1                      ; F5F5   0281 0171

        JSR     R5,     L_63C5                  ; F5F7   0004 0160 03C5
        DECLE   $0004,  $01A8,  $0000,  $0171   ; F5FA   0004 01A8 0000 0171
        DECLE   $0002,  $0004                   ; F5FE   0002 0004

        PULR    R7                              ; F600   02B7

        DECLE   $0004,  $01A8,  $002C,  $0229   ; F601   0004 01A8 002C 0229
        DECLE   $0012,  $0004                   ; F605   0012 0004

        ANDR    R4,     R0                      ; F607   01A0
        ANDR    R6,     R3                      ; F608   01B3
        MVI@    R5,     R5                      ; F609   02AD
        CMPI    #$0003, R5                      ; F60A   037D 0003
        BEQ     L_F5F3                          ; F60C   0224 001A

L_F60E:
        CLRR    R0                              ; F60E   01C0
        MVI     G_0171, R1                      ; F60F   0281 0171

        JSR     R5,     L_63FE                  ; F611   0004 0160 03FE
        DECLE   $0004,  $01A8,  $0000           ; F614   0004 01A8 0000

        CMPR    R6,     R1                      ; F617   0171
        EIS                                     ; F618   0002
        COMR    R1                              ; F619   0019
        PULR    R7                              ; F61A   02B7

        MVII    #$000A, R0                      ; F61B   02B8 000A
        MVI     G_0171, R1                      ; F61D   0281 0171

        JSR     R5,     L_63FE                  ; F61F   0004 0160 03FE
        DECLE   $0004,  $01A8,  $0000           ; F622   0004 01A8 0000

        CMPR    R6,     R1                      ; F625   0171
        INCR    R4                              ; F626   000C
        RLC     R0,     1                       ; F627   0050
        PULR    R7                              ; F628   02B7

        MVII    #$000A, R0                      ; F629   02B8 000A
        MVI     G_0171, R1                      ; F62B   0281 0171

        JSR     R5,     L_63FE                  ; F62D   0004 0160 03FE
        DECLE   $0004,  $01A8,  $0000           ; F630   0004 01A8 0000

        CMPR    R6,     R1                      ; F633   0171
        INCR    R5                              ; F634   000D
        INCR    R7                              ; F635   000F
        PULR    R7                              ; F636   02B7

L_F637:
        MVII    #$000C, R0                      ; F637   02B8 000C
        MVI     G_0171, R1                      ; F639   0281 0171

        JSR     R5,     L_63C5                  ; F63B   0004 0160 03C5
        DECLE   $0004,  $01A8,  $0000           ; F63E   0004 01A8 0000

        CMPR    R6,     R1                      ; F641   0171
        INCR    R6                              ; F642   000E
        INCR    R7                              ; F643   000F
        PULR    R7                              ; F644   02B7

L_F645:
        MVI     G_0171, R1                      ; F645   0281 0171
        DECLE   $02F9,  $01E5,  $0288,  $0010   ; F647   02F9 01E5 0288 0010
        DECLE   $022C,  $0031,  $0280,  $017A   ; F64B   022C 0031 0280 017A
        DECLE   $0378,  $00FF,  $022C,  $0082   ; F64F   0378 00FF 022C 0082

        MVII    #$000B, R0                      ; F653   02B8 000B
        MVI     G_0171, R1                      ; F655   0281 0171

        JSR     R5,     L_63FE                  ; F657   0004 0160 03FE

        PULR    R7                              ; F65A   02B7

        DECLE   $0004,  $01A8,  $0065,  $0004   ; F65B   0004 01A8 0065 0004

        ANDR    R5,     R0                      ; F65F   01A8
        SLL     R0,     2                       ; F660   004C
        CLRR    R0                              ; F661   01C0
        BNC     L_F666                          ; F662   0209 0002

        MVII    #$000B, R0                      ; F664   02B8 000B
L_F666:
        MVI     G_0171, R1                      ; F666   0281 0171
        DECLE   $0004                           ; F668   0004

        ANDR    R5,     R4                      ; F669   01AC
        MVI@    R5,     R7                      ; F66A   02AF
        PULR    R7                              ; F66B   02B7

        DECLE   $0280,  $01EC,  $0080,  $0224   ; F66C   0280 01EC 0080 0224
        DECLE   $00D9,  $0280,  $01ED,  $0080   ; F670   00D9 0280 01ED 0080
        DECLE   $0224,  $00DE,  $0004           ; F674   0224 00DE 0004

        ANDR    R5,     R4                      ; F677   01AC
        ANDR    R2,     R1                      ; F678   0191
        PULR    R7                              ; F679   02B7

        DECLE   $0281,  $0171,  $0004,  $01A0   ; F67A   0281 0171 0004 01A0
        DECLE   $036E,  $02B9,  $00C0,  $0004   ; F67E   036E 02B9 00C0 0004

        ANDR    R4,     R4                      ; F682   01A4
        XOR@    R6,     R4                      ; F683   03F4
        PULR    R7                              ; F684   02B7

L_F685:
        MVI     G_017B, R0                      ; F685   0280 017B
        DECLE   $03B8,  $0002,  $020C,  $0143   ; F687   03B8 0002 020C 0143
        DECLE   $0280,  $017B,  $03C0,  $0171   ; F68B   0280 017B 03C0 0171
        DECLE   $03B8,  $0001,  $020C,  $00DC   ; F68F   03B8 0001 020C 00DC
        DECLE   $0004,  $01A8,  $0144,  $0378   ; F693   0004 01A8 0144 0378
        DECLE   $0002,  $0206,  $00A2,  $0004   ; F697   0002 0206 00A2 0004
        DECLE   $01A8,  $0123,  $0272,  $0004   ; F69B   01A8 0123 0272 0004
        DECLE   $01A8,  $00E5,  $0270,  $0271   ; F69F   01A8 00E5 0270 0271
        DECLE   $0004,  $01A8,  $012B,  $02B1   ; F6A3   0004 01A8 012B 02B1
        DECLE   $02B0,  $02B3,  $015A,  $020E   ; F6A7   02B0 02B3 015A 020E
        DECLE   $003E,  $037B,  $0028,  $020E   ; F6AB   003E 037B 0028 020E
        DECLE   $006B,  $0271,  $0273,  $0004   ; F6AF   006B 0271 0273 0004

        ANDR    R5,     R4                      ; F6B3   01AC
        CMP@    R1,     R2                      ; F6B4   034A
        PULR    R3                              ; F6B5   02B3
        PULR    R1                              ; F6B6   02B1
        CMPI    #$0032, R0                      ; F6B7   0378 0032
        BGE     L_F73C                          ; F6B9   020D 0081

        CLRR    R0                              ; F6BB   01C0
        MVO     R0,     G_0135                  ; F6BC   0240 0135
        MVII    #$0001, R0                      ; F6BE   02B8 0001

        JSR     R5,     X_RAND1                 ; F6C0   0004 0114 027D
        DECLE   $0080,  $0204,  $0005,  $02B9   ; F6C3   0080 0204 0005 02B9
        DECLE   $00C0,  $0004,  $01A4,  $03F4   ; F6C7   00C0 0004 01A4 03F4
        DECLE   $0004,  $01A8,  $0178,  $0378   ; F6CB   0004 01A8 0178 0378
        DECLE   $00FE,  $0204,  $0096,  $0378   ; F6CF   00FE 0204 0096 0378
        DECLE   $00FF,  $020C,  $0086,  $0004   ; F6D3   00FF 020C 0086 0004
        DECLE   $01A8,  $00E5,  $0004           ; F6D7   01A8 00E5 0004

        ANDR    R5,     R0                      ; F6DA   01A8
        MVO@    R6,     R5                      ; F6DB   026E
        B       L_F6F3                          ; F6DC   0200 0015

        DECLE   $02B9,  $00C0,  $0004,  $01A4   ; F6DE   02B9 00C0 0004 01A4
        DECLE   $03F4,  $0004,  $01A8,  $0000   ; F6E2   03F4 0004 01A8 0000

        CMPR    R6,     R1                      ; F6E6   0171
        SETC                                    ; F6E7   0007
        EIS                                     ; F6E8   0002
        PULR    R7                              ; F6E9   02B7

        CMPI    #$0010, R3                      ; F6EA   037B 0010
        BLT     L_F73C                          ; F6EC   0205 004E

        JSR     R5,     L_5B29                  ; F6EE   0004 0158 0329

        MVII    #$0034, R3                      ; F6F1   02BB 0034
L_F6F3:
        MVI     G_0171, R0                      ; F6F3   0280 0171
        DECLE   $03F8,  $0001,  $0008,  $0004   ; F6F5   03F8 0001 0008 0004
        DECLE   $01A4,  $0302,  $0004,  $01A8   ; F6F9   01A4 0302 0004 01A8
        DECLE   $0000                           ; F6FD   0000

        CMPR    R6,     R1                      ; F6FE   0171
        SETC                                    ; F6FF   0007
        INCR    R0                              ; F700   0008
        PULR    R7                              ; F701   02B7

        PSHR    R5                              ; F702   0275

        JSR     R5,     .EXEC.76C               ; F703   0004 0114 036C

        MOVR    R1,     R4                      ; F706   008C
        ADDI    #$0002, R4                      ; F707   02FC 0002
        MOVR    R2,     R0                      ; F709   0090
        MVI@    R4,     R2                      ; F70A   02A2
        SWAP    R2,     1                       ; F70B   0042
        ANDI    #$00FF, R2                      ; F70C   03BA 00FF
        SUBR    R2,     R0                      ; F70E   0110
        MOVR    R3,     R1                      ; F70F   0099
        MVI@    R4,     R2                      ; F710   02A2
        SWAP    R2,     1                       ; F711   0042
        ANDI    #$00FF, R2                      ; F712   03BA 00FF
        SUBR    R2,     R1                      ; F714   0111

        JSR     R5,     .EXEC.A2F               ; F715   0004 0118 022F
        DECLE   $0004                           ; F718   0004

        AND@    R4,     R4                      ; F719   03A4
        XOR@    R6,     R5                      ; F71A   03F5
        MVII    #$000A, R0                      ; F71B   02B8 000A

        JSR     R5,     X_RAND2                 ; F71D   0004 0114 029E
        DECLE   $0001,  $02B9,  $0079,  $00A5   ; F720   0001 02B9 0079 00A5
        DECLE   $00C1,  $0289,  $0285,  $017B   ; F724   00C1 0289 0285 017B
        DECLE   $03C5,  $017A,  $03BD,  $0001   ; F728   03C5 017A 03BD 0001
        DECLE   $020C,  $0004,  $02F9,  $0008   ; F72C   020C 0004 02F9 0008
        DECLE   $03B9,  $000F,  $0004,  $01A4   ; F730   03B9 000F 0004 01A4
        DECLE   $03F4,  $0004,  $01A8,  $0000   ; F734   03F4 0004 01A8 0000

        CMPR    R6,     R1                      ; F738   0171
        INCR    R7                              ; F739   000F

        EIS                                     ; F73A   0002
L_F73B:
        PULR    R7                              ; F73B   02B7

L_F73C:
        MVI     G_017B, R0                      ; F73C   0280 017B
        ANDI    #$0001, R0                      ; F73E   03B8 0001
        XORI    #$0001, R0                      ; F740   03F8 0001
        INCR    R0                              ; F742   0008

        JSR     R5,     L_6CA8                  ; F743   0004 016C 00A8

        CMPI    #$0002, R1                      ; F746   0379 0002
        MVII    #$0001, R0                      ; F748   02B8 0001
        MVI     G_0171, R1                      ; F74A   0281 0171
        BNEQ    L_F753                          ; F74C   020C 0005

        JSR     R5,     L_5440                  ; F74E   0004 0154 0040

        B       L_F756                          ; F751   0200 0003

L_F753:
        JSR     R5,     L_5450                  ; F753   0004 0154 0050

L_F756:
        MVII    #$00C0, R1                      ; F756   02B9 00C0
        DECLE   $0004                           ; F758   0004

        ANDR    R4,     R4                      ; F759   01A4
        XOR@    R6,     R4                      ; F75A   03F4
        PULR    R7                              ; F75B   02B7

        INCR    R0                              ; F75C   0008
        MVI     G_0171, R1                      ; F75D   0281 0171

        JSR     R5,     L_53B8                  ; F75F   0004 0150 03B8
        DECLE   $02B9,  $00C0,  $0004           ; F762   02B9 00C0 0004

        ANDR    R4,     R4                      ; F765   01A4
        XOR@    R6,     R4                      ; F766   03F4
        PULR    R7                              ; F767   02B7

        DECLE   $0004,  $01A8,  $0000,  $0171   ; F768   0004 01A8 0000 0171
        DECLE   $000A,  $0001                   ; F76C   000A 0001

        PULR    R7                              ; F76E   02B7

L_F76F:
        MVI     G_0187, R0                      ; F76F   0280 0187
        DECLE   $0378,  $0008,  $0205,  $0020   ; F771   0378 0008 0205 0020
        DECLE   $0280,  $017B,  $03B8,  $0002   ; F775   0280 017B 03B8 0002
        DECLE   $020C,  $0053,  $0280,  $017B   ; F779   020C 0053 0280 017B
        DECLE   $03C0,  $0171,  $03B8,  $0001   ; F77D   03C0 0171 03B8 0001
        DECLE   $0224,  $00FD,  $0004,  $01A8   ; F781   0224 00FD 0004 01A8
        DECLE   $0394,  $0209,  $0038,  $0004   ; F785   0394 0209 0038 0004
        DECLE   $01A8,  $02E1,  $0004,  $01A4   ; F789   01A8 02E1 0004 01A4
        DECLE   $03F4,  $0004,  $01A8,  $0000   ; F78D   03F4 0004 01A8 0000

        CMPR    R6,     R1                      ; F791   0171
        INCR    R0                              ; F792   0008
        DIS                                     ; F793   0003
        PULR    R7                              ; F794   02B7

        JSR     R5,     L_523C                  ; F795   0004 0150 023C

        PSHR    R0                              ; F798   0270
        PSHR    R1                              ; F799   0271
        MOVR    R0,     R2                      ; F79A   0082
        MOVR    R1,     R3                      ; F79B   008B

        JSR     R5,     L_5513                  ; F79C   0004 0154 0113
        DECLE   $008C,  $02FC,  $0002,  $0004   ; F79F   008C 02FC 0002 0004

        ANDR    R5,     R4                      ; F7A3   01AC
        AND@    R5,     R3                      ; F7A4   03AB
        CMPI    #$0007, R2                      ; F7A5   037A 0007
        BGT     L_F7B1                          ; F7A7   020E 0008

        SUBI    #$0002, R6                      ; F7A9   033E 0002
        CLRR    R0                              ; F7AB   01C0

        JSR     R5,     .EXEC.772               ; F7AC   0004 0114 0372

        PSHR    R2                              ; F7AF   0272
        PSHR    R3                              ; F7B0   0273

L_F7B1:
        JSR     R5,     L_5513                  ; F7B1   0004 0154 0113
        JSR     R5,     .EXEC.777               ; F7B4   0004 0114 0377

        PULR    R1                              ; F7B7   02B1
        PULR    R0                              ; F7B8   02B0
        SUBR    R2,     R0                      ; F7B9   0110
        SUBR    R3,     R1                      ; F7BA   0119

        JSR     R5,     .EXEC.A2F               ; F7BB   0004 0118 022F
        DECLE   $0220,  $0034                   ; F7BE   0220 0034

        MVII    #$0001, R0                      ; F7C0   02B8 0001
        MVI     G_0171, R1                      ; F7C2   0281 0171

        JSR     R5,     L_5440                  ; F7C4   0004 0154 0040
        DECLE   $02B9,  $00C0,  $0004,  $01A4   ; F7C7   02B9 00C0 0004 01A4
        DECLE   $03F4,  $0220,  $003F           ; F7CB   03F4 0220 003F

        MVI     G_017B, R0                      ; F7CE   0280 017B
        ANDI    #$0002, R0                      ; F7D0   03B8 0002
        BNEQ    L_F7DE                          ; F7D2   020C 000A

        MVI     G_017B, R0                      ; F7D4   0280 017B
        XOR     G_0171, R0                      ; F7D6   03C0 0171
        ANDI    #$0001, R0                      ; F7D8   03B8 0001
        BEQ     L_F685                          ; F7DA   0224 0156
        B       L_F76F                          ; F7DC   0220 006E

L_F7DE:
        MVII    #$0007, R0                      ; F7DE   02B8 0007

        JSR     R5,     .EXEC.772               ; F7E0   0004 0114 0372
        DECLE   $033B,  $000F,  $0280,  $017B   ; F7E3   033B 000F 0280 017B
        DECLE   $03B8,  $0001,  $0008,  $0004   ; F7E7   03B8 0001 0008 0004
        DECLE   $01A4,  $0302,  $0004,  $01A8   ; F7EB   01A4 0302 0004 01A8
        DECLE   $0000                           ; F7EF   0000

        CMPR    R6,     R1                      ; F7F0   0171
        INCR    R1                              ; F7F1   0009
        CLRC                                    ; F7F2   0006
        PULR    R7                              ; F7F3   02B7

        PSHR    R5                              ; F7F4   0275
        MVII    #$01EE, R5                      ; F7F5   02BD 01EE
        ADD     G_0171, R5                      ; F7F7   02C5 0171
        MVO@    R1,     R5                      ; F7F9   0269
        PULR    R7                              ; F7FA   02B7

        PSHR    R0                              ; F7FB   0270
        MVII    #$0001, R0                      ; F7FC   02B8 0001
        B       L_F802                          ; F7FE   0200 0002

        PSHR    R0                              ; F800   0270
        CLRR    R0                              ; F801   01C0
L_F802:
        PSHR    R1                              ; F802   0271
        PSHR    R2                              ; F803   0272
        MVI@    R5,     R1                      ; F804   02A9
        MVI@    R1,     R1                      ; F805   0289
        ANDI    #$0001, R1                      ; F806   03B9 0001
        XORR    R0,     R1                      ; F808   01C1
        MOVR    R1,     R2                      ; F809   008A
        ADDI    #$0133, R1                      ; F80A   02F9 0133
        ADDI    #$0173, R2                      ; F80C   02FA 0173
        MVI@    R5,     R0                      ; F80E   02A8
        MVO@    R0,     R1                      ; F80F   0248
        SUBI    #$0002, R1                      ; F810   0339 0002
        MVI@    R5,     R0                      ; F812   02A8
        ADDI    #$0004, R0                      ; F813   02F8 0004
        SUB@    R2,     R0                      ; F815   0310
        MVO@    R0,     R1                      ; F816   0248
        PULR    R2                              ; F817   02B2
        PULR    R1                              ; F818   02B1
        PULR    R0                              ; F819   02B0
L_F81A:
        MOVR    R5,     R7                      ; F81A   00AF

        PSHR    R0                              ; F81B   0270
        CLRR    R0                              ; F81C   01C0
        MVO     R0,     G_0131                  ; F81D   0240 0131
        MVO     R0,     G_0132                  ; F81F   0240 0132
        PULR    R0                              ; F821   02B0
        MOVR    R5,     R7                      ; F822   00AF

        PSHR    R1                              ; F823   0271
        ADDI    #$01EC, R1                      ; F824   02F9 01EC
        MVI@    R1,     R1                      ; F826   0289
        TSTR    R1                              ; F827   0089
        PULR    R1                              ; F828   02B1
        BNEQ    L_F81A                          ; F829   022C 0010
        MOVR    R4,     R7                      ; F82B   00A7

        DECLE   $0275,  $0274,  $0004           ; F82C   0275 0274 0004

        ANDR    R4,     R0                      ; F82F   01A0
        ANDR    R6,     R3                      ; F830   01B3
        MOVR    R5,     R4                      ; F831   00AC

        JSR     R5,     L_5FF6                  ; F832   0004 015C 03F6

        PULR    R4                              ; F835   02B4
L_F836:
        PULR    R7                              ; F836   02B7

        PSHR    R5                              ; F837   0275
        MVI     G_0171, R5                      ; F838   0285 0171
        ADDR    R5,     R5                      ; F83A   00ED
        ADD     G_0171, R5                      ; F83B   02C5 0171
        ADDI    #$0135, R5                      ; F83D   02FD 0135
        CMP@    R5,     R0                      ; F83F   0368
        BEQ     L_F84A                          ; F840   0204 0008

        CMP@    R5,     R0                      ; F842   0368
        BEQ     L_F84A                          ; F843   0204 0005

        CMP@    R5,     R0                      ; F845   0368
        BEQ     L_F84A                          ; F846   0204 0002

        SETC                                    ; F848   0007
        PULR    R7                              ; F849   02B7

L_F84A:
        CLRC                                    ; F84A   0006
        PULR    R7                              ; F84B   02B7

        PSHR    R5                              ; F84C   0275
        MVI     G_0171, R4                      ; F84D   0284 0171
        ADDR    R4,     R4                      ; F84F   00E4
        ADD     G_0171, R4                      ; F850   02C4 0171
        ADDI    #$0135, R4                      ; F852   02FC 0135
        MVII    #$0003, R3                      ; F854   02BB 0003
L_F856:
        MVI@    R4,     R0                      ; F856   02A0
        DECLE   $0004                           ; F857   0004

        ANDR    R5,     R0                      ; F858   01A8
        ADCR    R4                              ; F859   002C
        BC      L_F836                          ; F85A   0221 0025

        DECR    R3                              ; F85C   0013
        BNEQ    L_F856                          ; F85D   022C 0008

        CLRC                                    ; F85F   0006
        PULR    R7                              ; F860   02B7

        DECLE   $0006,  $0004,  $0003,  $0001   ; F861   0006 0004 0003 0001

        PSHR    R5                              ; F865   0275
        MVII    #$0355, R4                      ; F866   02BC 0355
        MVII    #$0008, R0                      ; F868   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; F86A   0004 0114 0338
        DECLE   $0004                           ; F86D   0004

        ANDR    R4,     R0                      ; F86E   01A0
        ANDR    R5,     R0                      ; F86F   01A8
        INCR    R5                              ; F870   000D
        MVII    #$0005, R4                      ; F871   02BC 0005
L_F873:
        PSHR    R4                              ; F873   0274
        DECLE   $02A8,  $0275,  $0270,  $0004   ; F874   02A8 0275 0270 0004
        DECLE   $01A0,  $0288,  $0003,  $0083   ; F878   01A0 0288 0003 0083
        DECLE   $02B0,  $0270,  $0004,  $01A0   ; F87C   02B0 0270 0004 01A0
        DECLE   $0288,  $0004,  $00C3,  $02B0   ; F880   0288 0004 00C3 02B0
        DECLE   $0270,  $0004                   ; F884   0270 0004

        ANDR    R4,     R0                      ; F886   01A0
        MVO@    R4,     R1                      ; F887   024C
        CLRC                                    ; F888   0006

        JSR     R5,     X_CLAMP                 ; F889   0004 0114 0270
        DECLE   $0000                           ; F88C   0000

        CLRC                                    ; F88D   0006
        MOVR    R0,     R1                      ; F88E   0081
        MVI     G_017A, R0                      ; F88F   0280 017A
        DECR    R0                              ; F891   0010

        JSR     R5,     X_CLAMP                 ; F892   0004 0114 0270
        DECLE   $0000                           ; F895   0000

        DIS                                     ; F896   0003
        MOVR    R0,     R2                      ; F897   0082
        SDBD                                    ; F898   0001
        ADDI    #$A861, R2                      ; F899   02FA 0061 00A8
        MVI@    R2,     R0                      ; F89C   0290

        JSR     R5,     X_MPY                   ; F89D   0004 011C 01DC

        SUBR    R2,     R3                      ; F8A0   0113
        BPL     L_F8A4                          ; F8A1   0203 0001

        CLRR    R3                              ; F8A3   01DB
L_F8A4:
        PULR    R0                              ; F8A4   02B0
        DECLE   $0270,  $0004                   ; F8A5   0270 0004

        ANDR    R5,     R0                      ; F8A7   01A8
        ADCR    R4                              ; F8A8   002C
        BC      L_F8AD                          ; F8A9   0201 0002

        ADDI    #$0004, R3                      ; F8AB   02FB 0004
L_F8AD:
        SWAP    R3,     1                       ; F8AD   0043
        PULR    R0                              ; F8AE   02B0
        ADDR    R3,     R0                      ; F8AF   00D8
        MVII    #$0357, R2                      ; F8B0   02BA 0357
L_F8B2:
        CMP@    R2,     R0                      ; F8B2   0350
        BLE     L_F8B8                          ; F8B3   0206 0003

        MVI@    R2,     R3                      ; F8B5   0293
        MVO@    R0,     R2                      ; F8B6   0250
        MOVR    R3,     R0                      ; F8B7   0098
L_F8B8:
        INCR    R2                              ; F8B8   000A
        CMPI    #$035C, R2                      ; F8B9   037A 035C
        BNEQ    L_F8B2                          ; F8BB   022C 000A

        PULR    R5                              ; F8BD   02B5
        PULR    R4                              ; F8BE   02B4
        DECR    R4                              ; F8BF   0014
        BNEQ    L_F873                          ; F8C0   022C 004E

        MVI     G_0171, R4                      ; F8C2   0284 0171
        ADDR    R4,     R4                      ; F8C4   00E4
        ADD     G_0171, R4                      ; F8C5   02C4 0171
        ADDI    #$0135, R4                      ; F8C7   02FC 0135
        MVII    #$0003, R1                      ; F8C9   02B9 0003
        MVII    #$0357, R5                      ; F8CB   02BD 0357
L_F8CD:
        PSHR    R1                              ; F8CD   0271
        MVI@    R5,     R0                      ; F8CE   02A8
        ANDI    #$00FF, R0                      ; F8CF   03B8 00FF
        PSHR    R5                              ; F8D1   0275

        JSR     R5,     L_674E                  ; F8D2   0004 0164 034E

        PULR    R5                              ; F8D5   02B5
        PULR    R1                              ; F8D6   02B1
        BC      L_F8CD                          ; F8D7   0221 000B

        MVO@    R0,     R4                      ; F8D9   0260
        DECR    R1                              ; F8DA   0011
        BNEQ    L_F8CD                          ; F8DB   022C 000F

        MVII    #$0355, R4                      ; F8DD   02BC 0355
        MVII    #$0008, R0                      ; F8DF   02B8 0008

        JSR     R5,     X_FILL_ZERO             ; F8E1   0004 0114 0338

        PULR    R7                              ; F8E4   02B7

        DECLE   $0275,  $0004                   ; F8E5   0275 0004

        ANDR    R5,     R0                      ; F8E7   01A8
        CMPR    R2,     R5                      ; F8E8   0155
        INCR    R7                              ; F8E9   000F

        PSHR    R5                              ; F8EA   0275

L_F8EB:
        JSR     R5,     .EXEC.772               ; F8EB   0004 0114 0372

        INCR    R7                              ; F8EE   000F

        PSHR    R5                              ; F8EF   0275
L_F8F0:
        MVI     G_017B, R0                      ; F8F0   0280 017B
        ANDI    #$0001, R0                      ; F8F2   03B8 0001
        INCR    R0                              ; F8F4   0008

        JSR     R5,     .EXEC.76C               ; F8F5   0004 0114 036C

        MOVR    R1,     R4                      ; F8F8   008C
        SDBD                                    ; F8F9   0001
        MVII    #$7FFF, R0                      ; F8FA   02B8 00FF 007F
        MVO     R0,     G_035C                  ; F8FD   0240 035C
L_F8FF:
        PSHR    R2                              ; F8FF   0272
        DECLE   $0273,  $0274,  $02FC,  $0002   ; F900   0273 0274 02FC 0002
        DECLE   $0004                           ; F904   0004

        ANDR    R5,     R4                      ; F905   01AC
        AND@    R5,     R3                      ; F906   03AB
        PULR    R4                              ; F907   02B4
        PULR    R3                              ; F908   02B3
        CMP     G_035C, R2                      ; F909   0342 035C
        BGE     L_F915                          ; F90B   020D 0008

        MVO     R2,     G_035C                  ; F90D   0242 035C
        MOVR    R4,     R2                      ; F90F   00A2
        MVO     R2,     G_0188                  ; F910   0242 0188
        SWAP    R2,     1                       ; F912   0042
        MVO     R2,     G_0189                  ; F913   0242 0189
L_F915:
        PULR    R2                              ; F915   02B2
        ADDI    #$0010, R4                      ; F916   02FC 0010
        CMPI    #$0355, R4                      ; F918   037C 0355
        BLT     L_F8FF                          ; F91A   0225 001C

        MVI     G_035C, R0                      ; F91C   0280 035C
        MVII    #$0188, R5                      ; F91E   02BD 0188
        SDBD                                    ; F920   0001
        MVI@    R5,     R1                      ; F921   02A9
        PULR    R7                              ; F922   02B7

        DECLE   $0275,  $0004                   ; F923   0275 0004

        ANDR    R5,     R0                      ; F925   01A8
        CMPR    R2,     R5                      ; F926   0155

        JSR     R5,     .EXEC.76C               ; F927   0004 0114 036C

        INCR    R7                              ; F92A   000F

        PSHR    R5                              ; F92B   0275

L_F92C:
        JSR     R5,     L_5B29                  ; F92C   0004 0158 0329

        MVII    #$0034, R3                      ; F92F   02BB 0034
L_F931:
        MOVR    R1,     R4                      ; F931   008C
        DECLE   $02FC,  $0002,  $0004           ; F932   02FC 0002 0004

        ANDR    R5,     R4                      ; F935   01AC
        AND@    R5,     R3                      ; F936   03AB
        PULR    R7                              ; F937   02B7

        PSHR    R5                              ; F938   0275

        JSR     R5,     .EXEC.772               ; F939   0004 0114 0372
        DECLE   $0004                           ; F93C   0004

        ANDR    R5,     R0                      ; F93D   01A8
        CMPR    R2,     R5                      ; F93E   0155

        JSR     R5,     .EXEC.76C               ; F93F   0004 0114 036C

        B       L_F931                          ; F942   0220 0012

        PSHR    R5                              ; F944   0275
        MVII    #$0177, R5                      ; F945   02BD 0177
        SDBD                                    ; F947   0001
        MVI@    R5,     R0                      ; F948   02A8
        CMPI    #$0003, R0                      ; F949   0378 0003
        BGT     L_F94E                          ; F94B   020E 0001

        DECR    R0                              ; F94D   0010
L_F94E:
        CMP     G_0179, R0                      ; F94E   0340 0179
        BLE     L_F954                          ; F950   0206 0002

        MVI     G_0179, R0                      ; F952   0280 0179
L_F954:
        PULR    R7                              ; F954   02B7

        MVI     G_017B, R0                      ; F955   0280 017B
        ANDI    #$0001, R0                      ; F957   03B8 0001
        XORI    #$0001, R0                      ; F959   03F8 0001
        INCR    R0                              ; F95B   0008
        MOVR    R5,     R7                      ; F95C   00AF

        DECLE   $0275,  $0004                   ; F95D   0275 0004

        ANDR    R5,     R0                      ; F95F   01A8
        CMPR    R2,     R5                      ; F960   0155
        ADDI    #$0002, R0                      ; F961   02F8 0002
        PULR    R7                              ; F963   02B7

        DECLE   $0003,  $0006,  $0000,  $0004   ; F964   0003 0006 0000 0004
        DECLE   $0001,  $0007,  $0005,  $0002   ; F968   0001 0007 0005 0002
        DECLE   $0008,  $00FF,  $0005,  $0002   ; F96C   0008 00FF 0005 0002
        DECLE   $0008,  $0004,  $0001,  $0007   ; F970   0008 0004 0001 0007
        DECLE   $0003,  $0006,  $0000,  $00FF   ; F974   0003 0006 0000 00FF

        PSHR    R5                              ; F978   0275
        MVI     G_017B, R5                      ; F979   0285 017B
        XOR     G_017A, R5                      ; F97B   03C5 017A
        ANDI    #$0001, R5                      ; F97D   03BD 0001
        ADDR    R5,     R5                      ; F97F   00ED
        PSHR    R5                              ; F980   0275
        ADDR    R5,     R5                      ; F981   00ED
        ADDR    R5,     R5                      ; F982   00ED
        ADD@    R6,     R5                      ; F983   02F5
        SDBD                                    ; F984   0001
        ADDI    #$A964, R5                      ; F985   02FD 0064 00A9
        ADD     G_0135, R5                      ; F988   02C5 0135
        MVI@    R5,     R0                      ; F98A   02A8
        MVO     R0,     G_0139                  ; F98B   0240 0139
        CMPI    #$00FF, R0                      ; F98D   0378 00FF
        BEQ     L_FA36                          ; F98F   0204 00A5

        JSR     R5,     L_523C                  ; F991   0004 0150 023C
        DECLE   $0240,  $0136,  $0241,  $0137   ; F994   0240 0136 0241 0137
        DECLE   $0082,  $008B,  $0004           ; F998   0082 008B 0004

        ANDR    R5,     R0                      ; F99B   01A8
        CMPR    R2,     R5                      ; F99C   0155

        JSR     R5,     .EXEC.76C               ; F99D   0004 0114 036C
        DECLE   $008C,  $02FC,  $0002,  $0004   ; F9A0   008C 02FC 0002 0004
        DECLE   $01AC,  $03AB,  $037A,  $000E   ; F9A4   01AC 03AB 037A 000E
        DECLE   $0205,  $008D,  $0272,  $0004   ; F9A8   0205 008D 0272 0004

        ANDR    R5,     R0                      ; F9AC   01A8
        CMPR    R3,     R5                      ; F9AD   015D

        JSR     R5,     .EXEC.76C               ; F9AE   0004 0114 036C
        DECLE   $008C,  $02FC,  $0002,  $0282   ; F9B1   008C 02FC 0002 0282
        DECLE   $0136,  $0283,  $0137,  $0004   ; F9B5   0136 0283 0137 0004
        DECLE   $01AC,  $03AB,  $0272,  $0004   ; F9B9   01AC 03AB 0272 0004

        ANDR    R5,     R0                      ; F9BD   01A8
        CMPR    R3,     R5                      ; F9BE   015D
        ADDI    #$0002, R0                      ; F9BF   02F8 0002

        JSR     R5,     .EXEC.76C               ; F9C1   0004 0114 036C
        DECLE   $008C,  $02FC,  $0002,  $0282   ; F9C4   008C 02FC 0002 0282
        DECLE   $0136,  $0283,  $0137,  $0004   ; F9C8   0136 0283 0137 0004
        DECLE   $01AC,  $03AB,  $02B1,  $02B3   ; F9CC   01AC 03AB 02B1 02B3
        DECLE   $0004                           ; F9D0   0004

        ANDR    R5,     R0                      ; F9D1   01A8
        CMPR    R3,     R5                      ; F9D2   015D
        CMPR    R1,     R2                      ; F9D3   014A
        BGE     L_F9D9                          ; F9D4   020D 0003

        ADDI    #$0002, R0                      ; F9D6   02F8 0002
        MOVR    R2,     R1                      ; F9D8   0091
L_F9D9:
        CMPI    #$0014, R1                      ; F9D9   0379 0014
        DECLE   $020E,  $005A,  $008D,  $00ED   ; F9DB   020E 005A 008D 00ED
        DECLE   $015D,  $020E,  $0055,  $0270   ; F9DF   015D 020E 0055 0270
        DECLE   $0271,  $0282,  $0136,  $0283   ; F9E3   0271 0282 0136 0283
        DECLE   $0137,  $0004                   ; F9E7   0137 0004

        ANDR    R5,     R0                      ; F9E9   01A8
        ADDR    R5,     R7                      ; F9EA   00EF

        DECLE   $02B2,  $02B3,  $0142,  $020E   ; F9EB   02B2 02B3 0142 020E
        DECLE   $0047,  $0004                   ; F9EF   0047 0004

        ANDR    R5,     R0                      ; F9F1   01A8
        CMPR    R2,     R5                      ; F9F2   0155

        JSR     R5,     .EXEC.772               ; F9F3   0004 0114 0372

        MVI     G_0136, R0                      ; F9F6   0280 0136
        MVI     G_0137, R1                      ; F9F8   0281 0137
        MVO     R2,     G_0136                  ; F9FA   0242 0136
        MVO     R3,     G_0137                  ; F9FC   0243 0137
        SUBR    R2,     R0                      ; F9FE   0110
        SUBR    R3,     R1                      ; F9FF   0119

        JSR     R5,     .EXEC.A2F               ; FA00   0004 0118 022F

        MVO     R1,     G_0138                  ; FA03   0241 0138
        MVI     G_017B, R0                      ; FA05   0280 017B
        ANDI    #$0001, R0                      ; FA07   03B8 0001
        INCR    R0                              ; FA09   0008
L_FA0A:
        PSHR    R0                              ; FA0A   0270

        JSR     R5,     .EXEC.772               ; FA0B   0004 0114 0372

        SUB     G_0136, R2                      ; FA0E   0302 0136
        SUB     G_0137, R3                      ; FA10   0303 0137
        MOVR    R2,     R0                      ; FA12   0090
        MOVR    R3,     R1                      ; FA13   0099

        JSR     R5,     .EXEC.A2F               ; FA14   0004 0118 022F

        PULR    R0                              ; FA17   02B0
        SUB     G_0138, R1                      ; FA18   0301 0138
        BPL     L_FA1D                          ; FA1A   0203 0001

        NEGR    R1                              ; FA1C   0021
L_FA1D:
        CMPI    #$0001, R1                      ; FA1D   0379 0001
        BLE     L_FA25                          ; FA1F   0206 0004

        CMPI    #$000F, R1                      ; FA21   0379 000F
        BNEQ    L_FA2E                          ; FA23   020C 0009

L_FA25:
        PSHR    R0                              ; FA25   0270
        DECLE   $0004                           ; FA26   0004

        ANDR    R5,     R0                      ; FA27   01A8
        SUBR    R7,     R0                      ; FA28   0138
        PULR    R0                              ; FA29   02B0
        CMPI    #$0011, R2                      ; FA2A   037A 0011
        BGT     L_FA37                          ; FA2C   020E 0009

L_FA2E:
        ADDI    #$0002, R0                      ; FA2E   02F8 0002
        CMPI    #$0007, R0                      ; FA30   0378 0007
        BLT     L_FA0A                          ; FA32   0225 0029

        MVI     G_0139, R0                      ; FA34   0280 0139
L_FA36:
        PULR    R7                              ; FA36   02B7

L_FA37:
        MVI     G_0135, R0                      ; FA37   0280 0135
        INCR    R0                              ; FA39   0008
        MVO     R0,     G_0135                  ; FA3A   0240 0135
        MVII    #$00FE, R0                      ; FA3C   02B8 00FE
        PULR    R7                              ; FA3E   02B7

        PSHR    R5                              ; FA3F   0275

        JSR     R5,     .EXEC.777               ; FA40   0004 0114 0377

        MVII    #$0050, R0                      ; FA43   02B8 0050
        SUBR    R3,     R0                      ; FA45   0118
        SLR     R0,     1                       ; FA46   0060
        SUBI    #$0004, R0                      ; FA47   0338 0004
        NEGR    R0                              ; FA49   0020
        ADDI    #$0050, R0                      ; FA4A   02F8 0050
        SUBI    #$0020, R3                      ; FA4C   033B 0020
        SLR     R3,     1                       ; FA4E   0063
        ADDI    #$001C, R3                      ; FA4F   02FB 001C
        PULR    R7                              ; FA51   02B7

        DECLE   $0275,  $0272,  $0273,  $008C   ; FA52   0275 0272 0273 008C
        DECLE   $02FC,  $0002,  $0004,  $01AC   ; FA56   02FC 0002 0004 01AC
        DECLE   $03AB,  $0090,  $02B3,  $02B2   ; FA5A   03AB 0090 02B3 02B2
        DECLE   $0270,  $0004                   ; FA5E   0270 0004

        ANDR    R5,     R0                      ; FA60   01A8
        CMPR    R2,     R5                      ; FA61   0155

        JSR     R5,     .EXEC.76C               ; FA62   0004 0114 036C
        DECLE   $008C,  $02FC,  $0002,  $0004   ; FA65   008C 02FC 0002 0004

        ANDR    R5,     R4                      ; FA69   01AC
        AND@    R5,     R3                      ; FA6A   03AB
        NEGR    R2                              ; FA6B   0022
        ADD@    R6,     R2                      ; FA6C   02F2
        PULR    R7                              ; FA6D   02B7

        DECLE   $0275,  $0004,  $01A8,  $023F   ; FA6E   0275 0004 01A8 023F
        DECLE   $037B,  $0024,  $0205,  $0025   ; FA72   037B 0024 0205 0025
        DECLE   $0378,  $004C,  $020E,  $0022   ; FA76   0378 004C 020E 0022
        DECLE   $0242,  $0136,  $0243,  $0137   ; FA7A   0242 0136 0243 0137
        DECLE   $0034,  $0240,  $0138,  $0271   ; FA7E   0034 0240 0138 0271
        DECLE   $0004,  $01A8,  $0252,  $02B1   ; FA82   0004 01A8 0252 02B1
        DECLE   $0272,  $0282,  $0136,  $0283   ; FA86   0272 0282 0136 0283
        DECLE   $0138,  $0004                   ; FA8A   0138 0004

        ANDR    R5,     R0                      ; FA8C   01A8
        MVO@    R2,     R2                      ; FA8D   0252
        MOVR    R2,     R1                      ; FA8E   0091
        PULR    R0                              ; FA8F   02B0
        MVI     G_0136, R2                      ; FA90   0282 0136
        MVI     G_0137, R3                      ; FA92   0283 0137
        CMPR    R0,     R1                      ; FA94   0141
        BLE     L_FA9A                          ; FA95   0206 0003

        MVI     G_0138, R3                      ; FA97   0283 0138
        MOVR    R1,     R0                      ; FA99   0088
L_FA9A:
        PULR    R7                              ; FA9A   02B7

        DECLE   $0083,  $0272,  $0273,  $0004   ; FA9B   0083 0272 0273 0004

        ANDR    R5,     R0                      ; FA9F   01A8
        MVO@    R2,     R2                      ; FAA0   0252
        MOVR    R2,     R0                      ; FAA1   0090
        PULR    R3                              ; FAA2   02B3
        PULR    R2                              ; FAA3   02B2
        PULR    R7                              ; FAA4   02B7

        PSHR    R5                              ; FAA5   0275

        JSR     R5,     .EXEC.772               ; FAA6   0004 0114 0372

        MVI     G_017B, R4                      ; FAA9   0284 017B
        XOR     G_017A, R4                      ; FAAB   03C4 017A
        ANDI    #$0001, R4                      ; FAAD   03BC 0001
        MVI     G_017B, R0                      ; FAAF   0280 017B
        ANDI    #$0001, R0                      ; FAB1   03B8 0001
        INCR    R0                              ; FAB3   0008

        JSR     R5,     .EXEC.76C               ; FAB4   0004 0114 036C

        ADDI    #$0003, R1                      ; FAB7   02F9 0003
L_FAB9:
        MVI@    R1,     R0                      ; FAB9   0288
        SWAP    R0,     1                       ; FABA   0040
        ANDI    #$00FF, R0                      ; FABB   03B8 00FF
        SUBR    R3,     R0                      ; FABD   0118
        BPL     L_FAC1                          ; FABE   0203 0001

        NEGR    R0                              ; FAC0   0020
L_FAC1:
        CMPI    #$0004, R0                      ; FAC1   0378 0004
        BGT     L_FAD6                          ; FAC3   020E 0011

        MOVR    R0,     R5                      ; FAC5   0085
        DECR    R1                              ; FAC6   0011
        MVI@    R1,     R0                      ; FAC7   0288
        INCR    R1                              ; FAC8   0009
        SWAP    R0,     1                       ; FAC9   0040
        ANDI    #$00FF, R0                      ; FACA   03B8 00FF
        SUBR    R2,     R0                      ; FACC   0110
        ADDR    R4,     R7                      ; FACD   00E7

        NEGR    R0                              ; FACE   0020
        TSTR    R0                              ; FACF   0080
        BMI     L_FAD6                          ; FAD0   020B 0004

        CMPI    #$000E, R0                      ; FAD2   0378 000E
        BLT     L_FADE                          ; FAD4   0205 0008

L_FAD6:
        ADDI    #$0010, R1                      ; FAD6   02F9 0010
        CMPI    #$0355, R1                      ; FAD8   0379 0355
        BLT     L_FAB9                          ; FADA   0225 0022

        CLRC                                    ; FADC   0006
        PULR    R7                              ; FADD   02B7

L_FADE:
        ADDR    R5,     R0                      ; FADE   00E8
        SETC                                    ; FADF   0007
        PULR    R7                              ; FAE0   02B7

        DECLE   $0275,  $0004                   ; FAE1   0275 0004

        ANDR    R5,     R0                      ; FAE3   01A8
        CMP@    R5,     R6                      ; FAE4   036E
        BNC     L_FAF7                          ; FAE5   0209 0010

        JSR     R5,     L_551E                  ; FAE7   0004 0154 011E
        JSR     R5,     .EXEC.777               ; FAEA   0004 0114 0377

        MVII    #$0003, R0                      ; FAED   02B8 0003
        CMPI    #$0038, R3                      ; FAEF   037B 0038
        BLT     L_FAF4                          ; FAF1   0205 0001

        NEGR    R0                              ; FAF3   0020
L_FAF4:
        ADDR    R0,     R2                      ; FAF4   00C2
        B       L_FB26                          ; FAF5   0200 002F

L_FAF7:
        JSR     R5,     L_551E                  ; FAF7   0004 0154 011E
        JSR     R5,     .EXEC.777               ; FAFA   0004 0114 0377

        MVII    #$0038, R0                      ; FAFD   02B8 0038
        SUBR    R3,     R0                      ; FAFF   0118
        BPL     L_FB03                          ; FB00   0203 0001

        NEGR    R0                              ; FB02   0020
L_FB03:
        SLR     R0,     2                       ; FB03   0064
        SLR     R0,     1                       ; FB04   0060
        CMPI    #$0038, R3                      ; FB05   037B 0038
        BLT     L_FB0A                          ; FB07   0205 0001

        NEGR    R0                              ; FB09   0020
L_FB0A:
        ADDR    R0,     R3                      ; FB0A   00C3
        DECLE   $0004                           ; FB0B   0004

        ANDR    R5,     R0                      ; FB0C   01A8
        AND@    R1,     R3                      ; FB0D   038B
        BNEQ    L_FB1C                          ; FB0E   020C 000C

        CMPI    #$003C, R2                      ; FB10   037A 003C
        BGT     L_FB18                          ; FB12   020E 0004

        SUBI    #$0003, R2                      ; FB14   033A 0003
        B       L_FB26                          ; FB16   0200 000E

L_FB18:
        MVII    #$003C, R2                      ; FB18   02BA 003C
        B       L_FB26                          ; FB1A   0200 000A

L_FB1C:
        CMPI    #$0074, R2                      ; FB1C   037A 0074
        BLT     L_FB24                          ; FB1E   0205 0004

        ADDI    #$0003, R2                      ; FB20   02FA 0003
        B       L_FB26                          ; FB22   0200 0002

L_FB24:
        MVII    #$0074, R2                      ; FB24   02BA 0074
L_FB26:
        MOVR    R2,     R0                      ; FB26   0090

        JSR     R5,     X_CLAMP                 ; FB27   0004 0114 0270

        DECR    R0                              ; FB2A   0010
        MOVR    R3,     R6                      ; FB2B   009E
        MOVR    R0,     R2                      ; FB2C   0082

        JSR     R5,     L_5513                  ; FB2D   0004 0154 0113
        DECLE   $0271,  $0272,  $0034,  $0273   ; FB30   0271 0272 0034 0273
        DECLE   $008C,  $02FC,  $0002,  $0004   ; FB34   008C 02FC 0002 0004
        DECLE   $01AC,  $03AB,  $037A,  $000E   ; FB38   01AC 03AB 037A 000E
        DECLE   $02B3,  $02B2,  $02B1,  $020E   ; FB3C   02B3 02B2 02B1 020E
        DECLE   $0013,  $0271,  $02F9,  $0002   ; FB40   0013 0271 02F9 0002
        DECLE   $0289,  $0041,  $03B9,  $00FF   ; FB44   0289 0041 03B9 00FF
        DECLE   $0021,  $00D1,  $0004           ; FB48   0021 00D1 0004

        ANDR    R5,     R0                      ; FB4B   01A8
        AND@    R1,     R3                      ; FB4C   038B
        BNEQ    L_FB50                          ; FB4D   020C 0001

        NEGR    R1                              ; FB4F   0021
L_FB50:
        TSTR    R1                              ; FB50   0089
        PULR    R1                              ; FB51   02B1
        BMI     L_FB67                          ; FB52   020B 0013

        ADDI    #$0002, R1                      ; FB54   02F9 0002
        MVI@    R1,     R0                      ; FB56   0288
        SWAP    R0,     1                       ; FB57   0040
        ANDI    #$00FF, R0                      ; FB58   03B8 00FF
        SUBR    R0,     R2                      ; FB5A   0102
        MOVR    R2,     R0                      ; FB5B   0090
        INCR    R1                              ; FB5C   0009
        MVI@    R1,     R1                      ; FB5D   0289
        SWAP    R1,     1                       ; FB5E   0041
        ANDI    #$00FF, R1                      ; FB5F   03B9 00FF
        SUBR    R1,     R3                      ; FB61   010B
        MOVR    R3,     R1                      ; FB62   0099

        JSR     R5,     .EXEC.A2F               ; FB63   0004 0118 022F

        PULR    R7                              ; FB66   02B7

L_FB67:
        MVII    #$00C0, R1                      ; FB67   02B9 00C0
        PULR    R7                              ; FB69   02B7

        DECLE   $0008,  $0000,  $00F8,  $00FF   ; FB6A   0008 0000 00F8 00FF

        PSHR    R5                              ; FB6E   0275

        JSR     R5,     L_551E                  ; FB6F   0004 0154 011E
        JSR     R5,     .EXEC.777               ; FB72   0004 0114 0377
        DECLE   $0004                           ; FB75   0004

        ANDR    R5,     R0                      ; FB76   01A8
        AND@    R1,     R3                      ; FB77   038B
        SDBD                                    ; FB78   0001
        ADDI    #$AB6A, R5                      ; FB79   02FD 006A 00AB
        SDBD                                    ; FB7C   0001
        ADD@    R5,     R2                      ; FB7D   02EA
        SWAP    R2,     1                       ; FB7E   0042
        ADDR    R3,     R2                      ; FB7F   00DA
        SDBD                                    ; FB80   0001
        MVII    #$0403, R4                      ; FB81   02BC 0003 0004

        JSR     R5,     L_5513                  ; FB84   0004 0154 0113
        JSR     R5,     .EXEC.6F7               ; FB87   0004 0114 02F7

        PULR    R7                              ; FB8A   02B7

        PSHR    R5                              ; FB8B   0275
        MVI     G_017B, R5                      ; FB8C   0285 017B
        XOR     G_017A, R5                      ; FB8E   03C5 017A
        ANDI    #$0001, R5                      ; FB90   03BD 0001
        ADDR    R5,     R5                      ; FB92   00ED
        PULR    R7                              ; FB93   02B7

        PSHR    R5                              ; FB94   0275
        MVI     G_017B, R0                      ; FB95   0280 017B
        ANDI    #$0008, R0                      ; FB97   03B8 0008
        BEQ     L_FBAC                          ; FB99   0204 0011

        JSR     R5,     L_5513                  ; FB9B   0004 0154 0113
        JSR     R5,     .EXEC.777               ; FB9E   0004 0114 0377
        DECLE   $02BC,  $031F,  $0004           ; FBA1   02BC 031F 0004

        ANDR    R5,     R4                      ; FBA4   01AC
        AND@    R5,     R3                      ; FBA5   03AB
        CMPI    #$000C, R2                      ; FBA6   037A 000C
        BGT     L_FBAC                          ; FBA8   020E 0002

        CLRC                                    ; FBAA   0006
        PULR    R7                              ; FBAB   02B7

L_FBAC:
        SETC                                    ; FBAC   0007
        PULR    R7                              ; FBAD   02B7

        DECLE   $0010,  $0088,  $0010,  $0020   ; FBAE   0010 0088 0010 0020
        DECLE   $0010,  $0088,  $0010,  $0020   ; FBB2   0010 0088 0010 0020
        DECLE   $0010,  $0088,  $0010,  $0020   ; FBB6   0010 0088 0010 0020
        DECLE   $002C,  $0046,  $002C,  $0062   ; FBBA   002C 0046 002C 0062
        DECLE   $0038,  $004F,  $0038,  $0059   ; FBBE   0038 004F 0038 0059
        DECLE   $0044,  $0062,  $0044,  $0046   ; FBC2   0044 0062 0044 0046
        DECLE   $002C,  $0062,  $002C,  $0046   ; FBC6   002C 0062 002C 0046
        DECLE   $0038,  $0059,  $0038,  $004F   ; FBCA   0038 0059 0038 004F
        DECLE   $0044,  $0046,  $0044,  $0062   ; FBCE   0044 0046 0044 0062
        DECLE   $0039,  $007F,  $003F           ; FBD2   0039 007F 003F

        ADCR    R0                              ; FBD5   0028
        SWAP    R1,     2                       ; FBD6   0045
        MOVR    R0,     R7                      ; FBD7   0087

        DECLE   $0044,  $0008,  $002C,  $0078   ; FBD8   0044 0008 002C 0078
        DECLE   $0039,  $006A,  $0039,  $007F   ; FBDC   0039 006A 0039 007F
        DECLE   $0039,  $0029,  $003F,  $0080   ; FBE0   0039 0029 003F 0080
        DECLE   $0045,  $0023,  $0044,  $00A0   ; FBE4   0045 0023 0044 00A0
        DECLE   $002C,  $0030,  $0039,  $003E   ; FBE8   002C 0030 0039 003E
        DECLE   $0039,  $0029,  $00C1,  $0018   ; FBEC   0039 0029 00C1 0018
        DECLE   $0000,  $0000,  $0000,  $0088   ; FBF0   0000 0000 0000 0088
        DECLE   $0000,  $0010,  $0000,  $0000   ; FBF4   0000 0010 0000 0000
        DECLE   $00F0,  $0003,  $0000,  $0000   ; FBF8   00F0 0003 0000 0000
        DECLE   $0000,  $0000,  $00C2,  $0018   ; FBFC   0000 0000 00C2 0018
        DECLE   $0000,  $0000,  $0000,  $0020   ; FC00   0000 0000 0000 0020
        DECLE   $0000,  $0010,  $0000,  $0000   ; FC04   0000 0010 0000 0000
        DECLE   $00F0,  $0003,  $0000,  $0000   ; FC08   00F0 0003 0000 0000
        DECLE   $0000,  $0000,  $009B,  $0018   ; FC0C   0000 0000 009B 0018
        DECLE   $00C4,  $0098,  $0000,  $0056   ; FC10   00C4 0098 0000 0056
        DECLE   $0000,  $0037,  $00D3,  $0000   ; FC14   0000 0037 00D3 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC18   0000 0000 0000 0000
        DECLE   $0034,  $0000                   ; FC1C   0034 0000

        MOVR    R1,     R6                      ; FC1E   008E
        TSTR    R5                              ; FC1F   00AD
        MOVR    R1,     R6                      ; FC20   008E
        TSTR    R5                              ; FC21   00AD
        MOVR    R1,     R6                      ; FC22   008E
        TSTR    R5                              ; FC23   00AD
        MOVR    R1,     R6                      ; FC24   008E
        TSTR    R5                              ; FC25   00AD
        MOVR    R1,     R6                      ; FC26   008E
        TSTR    R5                              ; FC27   00AD
        PSHR    R5                              ; FC28   0275

        JSR     R5,     L_5568                  ; FC29   0004 0154 0168
        JSR     R5,     L_5BA3                  ; FC2C   0004 0158 03A3

        MVI     G_017A, R1                      ; FC2F   0281 017A
        INCR    R1                              ; FC31   0009
        MVO     R1,     G_017A                  ; FC32   0241 017A
        CMPI    #$0005, R1                      ; FC34   0379 0005
        BPL     L_FC69                          ; FC36   0203 0031

        DECR    R1                              ; FC38   0011
        BEQ     L_FC45                          ; FC39   0204 000A

        MVII    #$0019, R0                      ; FC3B   02B8 0019

        JSR     R5,     .EXEC.A62               ; FC3D   0004 0118 0262
        JSR     R5,     L_62F0                  ; FC40   0004 0160 02F0

        PULR    R7                              ; FC43   02B7

        PSHR    R5                              ; FC44   0275
L_FC45:
        MVII    #$000C, R0                      ; FC45   02B8 000C
L_FC47:
        SWAP    R0,     1                       ; FC47   0040

        JSR     R5,     L_5122                  ; FC48   0004 0150 0122
        JSR     R5,     L_50E8                  ; FC4B   0004 0150 00E8
        DECLE   $0004                           ; FC4E   0004

        ANDR    R5,     R4                      ; FC4F   01AC
        SARC    R1,     1                       ; FC50   0079

        JSR     R5,     L_509D                  ; FC51   0004 0150 009D
        DECLE   $0004                           ; FC54   0004

        ANDR    R5,     R4                      ; FC55   01AC
        MOVR    R0,     R5                      ; FC56   0085
        MVII    #$00C2, R0                      ; FC57   02B8 00C2
        MVO     R0,     G_017B                  ; FC59   0240 017B
        MVII    #$0007, R0                      ; FC5B   02B8 0007

        JSR     R5,     X_PLAY_CHEER1           ; FC5D   0004 011C 02D5

        MVII    #$0019, R0                      ; FC60   02B8 0019

        JSR     R5,     .EXEC.A62               ; FC62   0004 0118 0262
        DECLE   $0004                           ; FC65   0004

        ANDR    R5,     R4                      ; FC66   01AC
        MOVR    R6,     R5                      ; FC67   00B5
        PULR    R7                              ; FC68   02B7

L_FC69:
        MVI     G_0175, R0                      ; FC69   0280 0175
        CMP     G_0176, R0                      ; FC6B   0340 0176
        MVII    #$0005, R0                      ; FC6D   02B8 0005
        BEQ     L_FC47                          ; FC6F   0224 0029

        MVII    #$00FF, R0                      ; FC71   02B8 00FF
        MVO     R0,     G_017A                  ; FC73   0240 017A

        JSR     R5,     L_62F0                  ; FC75   0004 0160 02F0

        PULR    R7                              ; FC78   02B7

        PSHR    R5                              ; FC79   0275
        MVII    #$0018, R0                      ; FC7A   02B8 0018
        MVO     R0,     G_0179                  ; FC7C   0240 0179

        JSR     R5,     L_511A                  ; FC7E   0004 0150 011A
        JSR     R5,     L_50AB                  ; FC81   0004 0150 00AB

        PULR    R7                              ; FC84   02B7

        PSHR    R5                              ; FC85   0275
        MVII    #$0219, R4                      ; FC86   02BC 0219
        SDBD                                    ; FC88   0001
        MVII    #$2000, R0                      ; FC89   02B8 0000 0020
        MVO@    R0,     R4                      ; FC8C   0260
        MVII    #$0009, R0                      ; FC8D   02B8 0009

        JSR     R5,     X_FILL_ZERO             ; FC8F   0004 0114 0338

        MVI     G_017A, R0                      ; FC92   0280 017A

        JSR     R5,     X_CLAMP                 ; FC94   0004 0114 0270
        DECLE   $0001,  $0005                   ; FC97   0001 0005

        SDBD                                    ; FC99   0001
        MVII    #$0946, R3                      ; FC9A   02BB 0046 0009
        MVII    #$021C, R4                      ; FC9D   02BC 021C
L_FC9F:
        MVO@    R3,     R4                      ; FC9F   0263
        DECR    R0                              ; FCA0   0010
        BNEQ    L_FC9F                          ; FCA1   022C 0003
        PULR    R7                              ; FCA3   02B7

        DECLE   $0275,  $0004,  $01A8,  $0000   ; FCA4   0275 0004 01A8 0000
        DECLE   $017B,  $0005                   ; FCA8   017B 0005

        COMR    R6                              ; FCAA   001E

        JSR     R5,     L_51CB                  ; FCAB   0004 0150 01CB

        PULR    R5                              ; FCAE   02B5
        MOVR    R7,     R0                      ; FCAF   00B8
        SUBI    #$0092, R0                      ; FCB0   0338 0092
L_FCB2:
        MVO     R0,     G_035D                  ; FCB2   0240 035D
L_FCB4:
        MOVR    R5,     R7                      ; FCB4   00AF

        PSHR    R5                              ; FCB5   0275
        MVII    #$0325, R2                      ; FCB6   02BA 0325
        MOVR    R7,     R1                      ; FCB8   00B9
        SUBI    #$00CB, R1                      ; FCB9   0339 00CB
        MVII    #$0003, R3                      ; FCBB   02BB 0003
L_FCBD:
        MVII    #$0002, R0                      ; FCBD   02B8 0002

        JSR     R5,     X_INIT_MOBS             ; FCBF   0004 0114 02B4

        ADDI    #$0010, R2                      ; FCC2   02FA 0010
        DECR    R3                              ; FCC4   0013
        BNEQ    L_FCBD                          ; FCC5   022C 0009

        MOVR    R7,     R4                      ; FCC7   00BC
        SUBI    #$010E, R4                      ; FCC8   033C 010E
        MVI     G_017A, R5                      ; FCCA   0285 017A
        ANDI    #$0001, R5                      ; FCCC   03BD 0001
        BEQ     L_FCD2                          ; FCCE   0204 0002

        ADDI    #$000C, R4                      ; FCD0   02FC 000C
L_FCD2:
        MOVR    R7,     R0                      ; FCD2   00B8
        DECLE   $0338,  $002F,  $0004           ; FCD3   0338 002F 0004

        ANDR    R5,     R4                      ; FCD6   01AC
        ADDR    R7,     R2                      ; FCD7   00FA
        PULR    R7                              ; FCD8   02B7

        PSHR    R5                              ; FCD9   0275

        JSR     R5,     L_509D                  ; FCDA   0004 0150 009D
        DECLE   $00BC,  $033C,  $0130,  $00B8   ; FCDD   00BC 033C 0130 00B8
        DECLE   $0338,  $00B9,  $0004           ; FCE1   0338 00B9 0004

        ANDR    R5,     R4                      ; FCE4   01AC
        ADDR    R7,     R2                      ; FCE5   00FA
        MVI     G_017B, R0                      ; FCE6   0280 017B
        MOVR    R0,     R2                      ; FCE8   0082
        ANDI    #$000A, R0                      ; FCE9   03B8 000A
        XORI    #$000A, R0                      ; FCEB   03F8 000A
        BEQ     L_FCF2                          ; FCED   0204 0003

        JSR     R5,     L_5BA3                  ; FCEF   0004 0158 03A3

L_FCF2:
        ANDI    #$0025, R2                      ; FCF2   03BA 0025
        XORI    #$00C2, R2                      ; FCF4   03FA 00C2
        MVO     R2,     G_017B                  ; FCF6   0242 017B
        B       L_FE2F                          ; FCF8   0200 0135

L_FCFA:
        PSHR    R5                              ; FCFA   0275
        MVO     R0,     G_0188                  ; FCFB   0240 0188
        SWAP    R0,     1                       ; FCFD   0040
        MVII    #$0325, R1                      ; FCFE   02B9 0325
        MVO     R0,     G_0189                  ; FD00   0240 0189
        MVII    #$0001, R0                      ; FD02   02B8 0001
L_FD04:
        MOVR    R1,     R5                      ; FD04   008D
        MVI@    R5,     R3                      ; FD05   02AB
        SDBD                                    ; FD06   0001
        MVII    #$9926, R1                      ; FD07   02B9 0026 0099
        MVO@    R1,     R5                      ; FD0A   0269
        SDBD                                    ; FD0B   0001
        ANDI    #$FDF7, R3                      ; FD0C   03BB 00F7 00FD
        SDBD                                    ; FD0F   0001
        MVI@    R4,     R2                      ; FD10   02A2
        CMP@    R5,     R2                      ; FD11   036A
        BC      L_FD16                          ; FD12   0201 0002

        XORI    #$0200, R3                      ; FD14   03FB 0200
L_FD16:
        SUBI    #$0003, R5                      ; FD16   033D 0003
        MVO@    R3,     R5                      ; FD18   026B
        MVII    #$0020, R3                      ; FD19   02BB 0020

        JSR     R5,     .EXEC.9AD               ; FD1B   0004 0118 01AD

        ADDI    #$0005, R1                      ; FD1E   02F9 0005
        MVII    #$000F, R2                      ; FD20   02BA 000F
        COMR    R2                              ; FD22   001A
        MVO@    R2,     R1                      ; FD23   024A
        ADDI    #$0003, R1                      ; FD24   02F9 0003
        INCR    R0                              ; FD26   0008
        CMPI    #$0007, R0                      ; FD27   0378 0007
        BMI     L_FD04                          ; FD29   022B 0026

        DECR    R0                              ; FD2B   0010
        MVO     R0,     G_018A                  ; FD2C   0240 018A

        JSR     R5,     L_536A                  ; FD2E   0004 0150 036A
        JSR     R5,     L_509D                  ; FD31   0004 0150 009D

        PULR    R7                              ; FD34   02B7

        PSHR    R5                              ; FD35   0275
        PSHR    R0                              ; FD36   0270
        ADDI    #$0004, R1                      ; FD37   02F9 0004
        CLRR    R0                              ; FD39   01C0
        MVO@    R0,     R1                      ; FD3A   0248
        SUBI    #$0004, R1                      ; FD3B   0339 0004
        MOVR    R1,     R4                      ; FD3D   008C
        MVI@    R4,     R5                      ; FD3E   02A5
        SDBD                                    ; FD3F   0001
        ANDI    #$F5FF, R5                      ; FD40   03BD 00FF 00F5
        SDBD                                    ; FD43   0001
        XORI    #$0800, R5                      ; FD44   03FD 0000 0008
        SDBD                                    ; FD47   0001
        MVII    #$992D, R0                      ; FD48   02B8 002D 0099
        MVO@    R0,     R4                      ; FD4B   0260
        ADDI    #$0005, R4                      ; FD4C   02FC 0005
        MVI@    R4,     R0                      ; FD4E   02A0
        MOVR    R0,     R2                      ; FD4F   0082
        ANDI    #$00FF, R2                      ; FD50   03BA 00FF
        XORR    R2,     R0                      ; FD52   01D0
        SWAP    R2,     1                       ; FD53   0042
        SUBI    #$0006, R4                      ; FD54   033C 0006
        MVO@    R0,     R4                      ; FD56   0260
        MVO@    R2,     R4                      ; FD57   0262
        CLRR    R2                              ; FD58   01D2
        MVO@    R2,     R4                      ; FD59   0262
        MVO@    R2,     R4                      ; FD5A   0262
        SWAP    R0,     1                       ; FD5B   0040
        SUBI    #$0054, R0                      ; FD5C   0338 0054
        BMI     L_FD62                          ; FD5E   020B 0002

        XORI    #$0200, R5                      ; FD60   03FD 0200
L_FD62:
        MVII    #$0177, R4                      ; FD62   02BC 0177
        SDBD                                    ; FD64   0001
        MVI@    R4,     R0                      ; FD65   02A0
        TSTR    R0                              ; FD66   0080
        BNEQ    L_FD6A                          ; FD67   020C 0001

        CLRR    R5                              ; FD69   01ED
L_FD6A:
        MVO@    R5,     R1                      ; FD6A   024D
        PULR    R2                              ; FD6B   02B2
        MVII    #$0188, R5                      ; FD6C   02BD 0188
        SDBD                                    ; FD6E   0001
        MVI@    R5,     R0                      ; FD6F   02A8
        PULR    R5                              ; FD70   02B5
        MVI     G_018A, R1                      ; FD71   0281 018A
        DECR    R1                              ; FD73   0011
        MVO     R1,     G_018A                  ; FD74   0241 018A
        BEQ     L_FD8D                          ; FD76   0204 0015

        SDBD                                    ; FD78   0001
        CMPI    #$AE90, R0                      ; FD79   0378 0090 00AE
        BNEQ    L_FCB4                          ; FD7C   022C 00C9

        MVI     G_0172, R3                      ; FD7E   0283 0172
        CMPI    #$0003, R3                      ; FD80   037B 0003
        BNEQ    L_FCB4                          ; FD82   022C 00CF

        MVI     G_017B, R1                      ; FD84   0281 017B
        ANDI    #$0001, R1                      ; FD86   03B9 0001
        ADDI    #$0003, R1                      ; FD88   02F9 0003
        CMPR    R1,     R2                      ; FD8A   014A
        BNEQ    L_FCB4                          ; FD8B   022C 00D8
L_FD8D:
        MOVR    R0,     R7                      ; FD8D   0087

        DECLE   $0004                           ; FD8E   0004

        MOVR    R5,     R0                      ; FD8F   00A8
        NEGR    R3                              ; FD90   0023
        PSHR    R5                              ; FD91   0275

        JSR     R5,     L_5568                  ; FD92   0004 0154 0168

        MVII    #$031D, R2                      ; FD95   02BA 031D
        SDBD                                    ; FD97   0001
        MVII    #$AC0E, R1                      ; FD98   02B9 000E 00AC

        JSR     R5,     X_INIT_MOB              ; FD9B   0004 0114 02B2

        SDBD                                    ; FD9E   0001
        MVII    #$9918, R2                      ; FD9F   02BA 0018 0099
        MVO     R2,     G_0336                  ; FDA2   0242 0336
        MVO     R2,     G_033E                  ; FDA4   0242 033E
        MVII    #$0006, R0                      ; FDA6   02B8 0006

        JSR     R5,     .EXEC.A62               ; FDA8   0004 0118 0262

        MVII    #$0017, R0                      ; FDAB   02B8 0017
        MVI     G_0336, R2                      ; FDAD   0282 0336
        MVII    #$00D3, R3                      ; FDAF   02BB 00D3
        MVII    #$030F, R4                      ; FDB1   02BC 030F
        COMR    R4                              ; FDB3   001C
        MVII    #$0335, R1                      ; FDB4   02B9 0335

        JSR     R5,     L_5536                  ; FDB6   0004 0154 0136

        MVII    #$033D, R1                      ; FDB9   02B9 033D

        JSR     R5,     L_5536                  ; FDBB   0004 0154 0136

        MVII    #$000A, R0                      ; FDBE   02B8 000A
        MVO     R0,     G_033B                  ; FDC0   0240 033B
        PULR    R7                              ; FDC2   02B7

        PSHR    R5                              ; FDC3   0275
        MVII    #$0001, R0                      ; FDC4   02B8 0001

        JSR     R5,     X_RAND1                 ; FDC6   0004 0114 027D

        MVII    #$003C, R2                      ; FDC9   02BA 003C
        SWAP    R2,     1                       ; FDCB   0042
        TSTR    R0                              ; FDCC   0080
        BEQ     L_FDD0                          ; FDCD   0204 0001

        NEGR    R2                              ; FDCF   0022
L_FDD0:
        MVO     R2,     G_0321                  ; FDD0   0242 0321
        MVII    #$0003, R0                      ; FDD2   02B8 0003
        MVO     R0,     G_033A                  ; FDD4   0240 033A
        MVO     R0,     G_0342                  ; FDD6   0240 0342
        PULR    R7                              ; FDD8   02B7

        DECLE   $0275,  $02F9,  $0007,  $0248   ; FDD9   0275 02F9 0007 0248
        DECLE   $0339,  $0007,  $0004           ; FDDD   0339 0007 0004

        ANDR    R5,     R4                      ; FDE0   01AC
        XORR    R4,     R6                      ; FDE1   01E6
        XORI    #$0008, R5                      ; FDE2   03FD 0008
        MVO@    R5,     R1                      ; FDE4   024D
        PULR    R7                              ; FDE5   02B7

        PSHR    R5                              ; FDE6   0275
        MVI@    R1,     R5                      ; FDE7   028D
        SDBD                                    ; FDE8   0001
        ANDI    #$FFF7, R5                      ; FDE9   03BD 00F7 00FF
        MVO@    R5,     R1                      ; FDEC   024D
        PULR    R7                              ; FDED   02B7

        DECLE   $01E4,  $0244,  $018A,  $0275   ; FDEE   01E4 0244 018A 0275
        DECLE   $0274,  $0098,  $03B8,  $0001   ; FDF2   0274 0098 03B8 0001
        DECLE   $03F8,  $0010,  $0240,  $017B   ; FDF6   03F8 0010 0240 017B
        DECLE   $0001,  $02B8,  $00FE,  $0098   ; FDFA   0001 02B8 00FE 0098
        DECLE   $0240,  $031E,  $02B9,  $031D   ; FDFE   0240 031E 02B9 031D
        DECLE   $0004                           ; FE02   0004

        ANDR    R5,     R4                      ; FE03   01AC
        XORR    R4,     R6                      ; FE04   01E6
        CLRR    R0                              ; FE05   01C0
        MVO     R0,     G_0323                  ; FE06   0240 0323
        MVO     R0,     G_0321                  ; FE08   0240 0321

        JSR     R5,     L_551E                  ; FE0A   0004 0154 011E
        JSR     R5,     .EXEC.766               ; FE0D   0004 0114 0366
        JSR     R5,     L_5956                  ; FE10   0004 0158 0156
        JSR     R5,     L_557D                  ; FE13   0004 0154 017D
        JSR     R5,     L_5E1F                  ; FE16   0004 015C 021F
        DECLE   $0004,  $01A8,  $0000,  $017B   ; FE19   0004 01A8 0000 017B
        DECLE   $0007,  $0002,  $0004,  $01A4   ; FE1D   0007 0002 0004 01A4
        DECLE   $03FB,  $017B,  $0008,  $0002   ; FE21   03FB 017B 0008 0002
        DECLE   $02B0,  $0080,  $020C,  $0003   ; FE25   02B0 0080 020C 0003
        DECLE   $0004,  $01AC,  $0079,  $0004   ; FE29   0004 01AC 0079 0004
        DECLE   $01AC,  $0233                   ; FE2D   01AC 0233
L_FE2F:
        JSR     R5,     L_5097                  ; FE2F   0004 0150 0097

        PULR    R7                              ; FE32   02B7

        DECLE   $0275,  $0280,  $017B,  $03B8   ; FE33   0275 0280 017B 03B8
        DECLE   $0001,  $03F8,  $0001,  $0008   ; FE37   0001 03F8 0001 0008
        DECLE   $0283,  $017B,  $03BB,  $0001   ; FE3B   0283 017B 03BB 0001
        DECLE   $0001,  $02FB,  $001F,  $0060   ; FE3F   0001 02FB 001F 0060
        DECLE   $029B,  $0004,  $01A0,  $01EC   ; FE43   029B 0004 01A0 01EC
        DECLE   $00A8,  $0200,  $0002,  $0275   ; FE47   00A8 0200 0002 0275
        DECLE   $01DB,  $0004,  $01A0,  $0194   ; FE4B   01DB 0004 01A0 0194
        DECLE   $0000,  $0001,  $02A9,  $0004   ; FE4F   0000 0001 02A9 0004
        DECLE   $01A0,  $01F5,  $0078,  $0028   ; FE53   01A0 01F5 0078 0028
        DECLE   $0004                           ; FE57   0004

        ANDR    R5,     R4                      ; FE58   01AC
        MVO@    R5,     R5                      ; FE59   026D
        MVII    #$0246, R4                      ; FE5A   02BC 0246
        SUBR    R0,     R4                      ; FE5C   0104

        JSR     R5,     X_PRINT_R1              ; FE5D   0004 0118 0067

        PULR    R7                              ; FE60   02B7

        MVI     G_017B, R4                      ; FE61   0284 017B
        ANDI    #$0008, R4                      ; FE63   03BC 0008
        BNEQ    L_FCB4                          ; FE65   022C 01B2

        MVI     G_017B, R4                      ; FE67   0284 017B
        ANDI    #$0002, R4                      ; FE69   03BC 0002
        BEQ     L_FCB4                          ; FE6B   0224 01B8

        PSHR    R5                              ; FE6D   0275
        CLRR    R4                              ; FE6E   01E4
        MVII    #$023E, R5                      ; FE6F   02BD 023E
        MVO@    R4,     R5                      ; FE71   026C
        MVO@    R4,     R5                      ; FE72   026C
        MVO@    R4,     R5                      ; FE73   026C
        NOP                                     ; FE74   0034
        MVO@    R4,     R5                      ; FE75   026C
        MVO@    R4,     R5                      ; FE76   026C
        MVO@    R4,     R5                      ; FE77   026C
        NOP                                     ; FE78   0034
        MVO@    R4,     R5                      ; FE79   026C
        MVO@    R4,     R5                      ; FE7A   026C
        MVO@    R4,     R5                      ; FE7B   026C
        NOP                                     ; FE7C   0034
        MVO@    R4,     R5                      ; FE7D   026C
        MVO@    R4,     R5                      ; FE7E   026C
        MVO@    R4,     R5                      ; FE7F   026C
        NOP                                     ; FE80   0034
        MVO@    R4,     R5                      ; FE81   026C
        MVO@    R4,     R5                      ; FE82   026C
        MVO@    R4,     R5                      ; FE83   026C
        NOP                                     ; FE84   0034
        PULR    R7                              ; FE85   02B7

        DECLE   $00AB,  $00AE,  $00AC,  $00AE   ; FE86   00AB 00AE 00AC 00AE
        DECLE   $00AB,  $00AE,  $00AB,  $00AE   ; FE8A   00AB 00AE 00AB 00AE
        DECLE   $00AB,  $00AE,  $0280,  $031E   ; FE8E   00AB 00AE 0280 031E
        DECLE   $0080,  $022C,  $01E0,  $0280   ; FE92   0080 022C 01E0 0280
        DECLE   $0172,  $0378,  $0003,  $022C   ; FE96   0172 0378 0003 022C
        DECLE   $01E6,  $0275,  $0004,  $01A4   ; FE9A   01E6 0275 0004 01A4
        DECLE   $03FB,  $017B,  $0004,  $000F   ; FE9E   03FB 017B 0004 000F

        JSR     R5,     L_51CB                  ; FEA2   0004 0150 01CB

        PULR    R5                              ; FEA5   02B5
        MOVR    R7,     R0                      ; FEA6   00B8
        SUBI    #$0021, R0                      ; FEA7   0338 0021
        B       L_FCB2                          ; FEA9   0220 01F8

        DECLE   $01C0,  $0004                   ; FEAB   01C0 0004

        MOVR    R5,     R0                      ; FEAD   00A8
        NEGR    R3                              ; FEAE   0023
        XOR     G_017B, R1                      ; FEAF   03C1 017B
        ANDI    #$0001, R1                      ; FEB1   03B9 0001
        BEQ     L_FCB4                          ; FEB3   0224 0200

        CMPI    #$000B, R0                      ; FEB5   0378 000B
        BNEQ    L_FEBC                          ; FEB7   020C 0003
        J       L_62F0                          ; FEB9   0004 0360 02F0

L_FEBC:
        PSHR    R5                              ; FEBC   0275

        JSR     R5,     L_5568                  ; FEBD   0004 0154 0168

        MVI     G_017B, R0                      ; FEC0   0280 017B
        ANDI    #$0001, R0                      ; FEC2   03B8 0001
        BNEQ    L_FECD                          ; FEC4   020C 0007

        MVII    #$0002, R0                      ; FEC6   02B8 0002
        MVII    #$0006, R3                      ; FEC8   02BB 0006

        JSR     R5,     L_5956                  ; FECA   0004 0158 0156
L_FECD:
        JSR     R5,     L_5513                  ; FECD   0004 0154 0113

        PSHR    R1                              ; FED0   0271
        ADDI    #$0004, R1                      ; FED1   02F9 0004
        MVI@    R1,     R5                      ; FED3   028D
        PULR    R1                              ; FED4   02B1
        TSTR    R5                              ; FED5   00AD
        BNEQ    L_FEDC                          ; FED6   020C 0004

        MVI@    R1,     R5                      ; FED8   028D
        XORI    #$0200, R5                      ; FED9   03FD 0200
        MVO@    R5,     R1                      ; FEDB   024D
L_FEDC:
        ADDI    #$0012, R1                      ; FEDC   02F9 0012
        MOVR    R1,     R4                      ; FEDE   008C
        MVII    #$031F, R5                      ; FEDF   02BD 031F
        MVI@    R4,     R0                      ; FEE1   02A0
        ADDI    #$0300, R0                      ; FEE2   02F8 0300
        MVO@    R0,     R5                      ; FEE4   0268
        MVI@    R4,     R2                      ; FEE5   02A2
        MVO@    R2,     R5                      ; FEE6   026A
        MVII    #$003C, R3                      ; FEE7   02BB 003C
        SWAP    R0,     1                       ; FEE9   0040
        CMPI    #$0054, R0                      ; FEEA   0378 0054
        BMI     L_FEEF                          ; FEEC   020B 0001

        NEGR    R3                              ; FEEE   0023
L_FEEF:
        MVO     R3,     G_017F                  ; FEEF   0243 017F
        DECLE   $0001,  $02BA,  $00C4,  $0098   ; FEF1   0001 02BA 00C4 0098
        DECLE   $0242,  $031E,  $0011,  $0001   ; FEF5   0242 031E 0011 0001
        DECLE   $02BA,  $001F,  $0099,  $024A   ; FEF9   02BA 001F 0099 024A
        DECLE   $0339,  $0319,  $0241,  $0180   ; FEFD   0339 0319 0241 0180
        DECLE   $02B9,  $031D,  $0004           ; FF01   02B9 031D 0004

        ANDR    R5,     R4                      ; FF04   01AC
        XORR    R4,     R6                      ; FF05   01E6
        MVII    #$0006, R0                      ; FF06   02B8 0006

        JSR     R5,     .EXEC.A62               ; FF08   0004 0118 0262

        MVI     G_017F, R0                      ; FF0B   0280 017F
        SWAP    R0,     1                       ; FF0D   0040
        MVO     R0,     G_0321                  ; FF0E   0240 0321
        MVI     G_0180, R1                      ; FF10   0281 0180
        ADDI    #$031D, R1                      ; FF12   02F9 031D
        MVII    #$0001, R0                      ; FF14   02B8 0001
        MVO@    R0,     R1                      ; FF16   0248
        PULR    R7                              ; FF17   02B7

        DECLE   $0275,  $02B9,  $031D,  $0004   ; FF18   0275 02B9 031D 0004

        ANDR    R5,     R4                      ; FF1C   01AC
        XORR    R4,     R6                      ; FF1D   01E6
        CLRR    R0                              ; FF1E   01C0
        MVO     R0,     G_01EB                  ; FF1F   0240 01EB
        MVO     R0,     G_031E                  ; FF21   0240 031E
        MVII    #$0321, R5                      ; FF23   02BD 0321
        MVO@    R0,     R5                      ; FF25   0268
        MVI     G_017B, R1                      ; FF26   0281 017B
        MVO@    R0,     R5                      ; FF28   0268
        MVO@    R0,     R5                      ; FF29   0268
        DECR    R0                              ; FF2A   0010
        MVO     R0,     G_0187                  ; FF2B   0240 0187
        MOVR    R1,     R2                      ; FF2D   008A
        ANDI    #$00FD, R2                      ; FF2E   03BA 00FD
        XORI    #$0002, R2                      ; FF30   03FA 0002
        MVO     R2,     G_017B                  ; FF32   0242 017B
        XOR     G_017A, R1                      ; FF34   03C1 017A
        ANDI    #$0001, R1                      ; FF36   03B9 0001
        ANDI    #$0001, R2                      ; FF38   03BA 0001
        MOVR    R7,     R0                      ; FF3A   00B8
        SUBI    #$00AB, R0                      ; FF3B   0338 00AB
        MOVR    R7,     R4                      ; FF3D   00BC
        SUBI    #$036A, R4                      ; FF3E   033C 036A
        TSTR    R1                              ; FF40   0089
        BEQ     L_FF45                          ; FF41   0204 0002

        ADDI    #$000E, R4                      ; FF43   02FC 000E
L_FF45:
        SLL     R2,     1                       ; FF45   004A
        SUBR    R2,     R4                      ; FF46   0114
        PULR    R5                              ; FF47   02B5
        B       L_FCFA                          ; FF48   0220 024F

        PSHR    R5                              ; FF4A   0275
        MVI     G_017B, R0                      ; FF4B   0280 017B
        XORI    #$0001, R0                      ; FF4D   03F8 0001
        ANDI    #$0001, R0                      ; FF4F   03B8 0001
        INCR    R0                              ; FF51   0008

        JSR     R5,     L_6CA8                  ; FF52   0004 016C 00A8

        MVI     G_0175, R2                      ; FF55   0282 0175
        MVI     G_0176, R3                      ; FF57   0283 0176
        MVI     G_017B, R5                      ; FF59   0285 017B
        ANDI    #$0001, R5                      ; FF5B   03BD 0001
        BEQ     L_FF62                          ; FF5D   0204 0003

        PSHR    R2                              ; FF5F   0272
        MOVR    R3,     R2                      ; FF60   009A
        PULR    R3                              ; FF61   02B3
L_FF62:
        SUBI    #$0006, R2                      ; FF62   033A 0006
        SUBR    R3,     R2                      ; FF64   011A
        MVII    #$000C, R5                      ; FF65   02BD 000C
        CMPR    R5,     R2                      ; FF67   016A
        BLE     L_FF6B                          ; FF68   0206 0001

        MOVR    R5,     R2                      ; FF6A   00AA
L_FF6B:
        NEGR    R5                              ; FF6B   0025
        CMPR    R5,     R2                      ; FF6C   016A
        BGE     L_FF70                          ; FF6D   020D 0001

        MOVR    R5,     R2                      ; FF6F   00AA
L_FF70:
        MVII    #$0005, R5                      ; FF70   02BD 0005
        DECR    R5                              ; FF72   0015
        CMPI    #$0003, R5                      ; FF73   037D 0003
        BLE     L_FF79                          ; FF75   0206 0002

        MVII    #$0003, R5                      ; FF77   02BD 0003
L_FF79:
        ADDR    R5,     R7                      ; FF79   00EF

        CLRR    R2                              ; FF7A   01D2
        SAR     R2,     1                       ; FF7B   006A
        INCR    R7                              ; FF7C   000F

        ADDR    R2,     R2                      ; FF7D   00D2
L_FF7E:
        SUBR    R2,     R0                      ; FF7E   0110
        CMPI    #$0003, R1                      ; FF7F   0379 0003
        BNEQ    L_FF8D                          ; FF81   020C 000A

        ADDI    #$000A, R0                      ; FF83   02F8 000A
        SDBD                                    ; FF85   0001
        CMPI    #$FFF4, R2                      ; FF86   037A 00F4 00FF
        BGT     L_FF8D                          ; FF89   020E 0002

        ADDI    #$000A, R0                      ; FF8B   02F8 000A
L_FF8D:
        MVI     G_0177, R1                      ; FF8D   0281 0177
        SUB     G_0179, R1                      ; FF8F   0301 0179
        BMI     L_FF97                          ; FF91   020B 0004

        CMPI    #$0006, R1                      ; FF93   0379 0006
        BGT     L_FF99                          ; FF95   020E 0002

L_FF97:
        SUBI    #$0014, R0                      ; FF97   0338 0014
L_FF99:
        PSHR    R0                              ; FF99   0270
        DECLE   $0280,  $017B,  $03F8,  $0001   ; FF9A   0280 017B 03F8 0001
        DECLE   $03B8,  $0001,  $0008,  $0004   ; FF9E   03B8 0001 0008 0004

        ANDR    R5,     R0                      ; FFA2   01A8
        MVI@    R4,     R5                      ; FFA3   02A5
        PULR    R0                              ; FFA4   02B0
        BNC     L_FFAA                          ; FFA5   0209 0003

        SUBI    #$001E, R0                      ; FFA7   0338 001E
        ADDR    R5,     R0                      ; FFA9   00E8
L_FFAA:
        PULR    R7                              ; FFAA   02B7

        PSHR    R5                              ; FFAB   0275
        MVI@    R4,     R0                      ; FFAC   02A0
        MVI@    R4,     R1                      ; FFAD   02A1
        SWAP    R0,     1                       ; FFAE   0040
        SWAP    R1,     1                       ; FFAF   0041
        ANDI    #$00FF, R0                      ; FFB0   03B8 00FF
        ANDI    #$00FF, R1                      ; FFB2   03B9 00FF
        SUBR    R0,     R2                      ; FFB4   0102
        BGE     L_FFB8                          ; FFB5   020D 0001

        NEGR    R2                              ; FFB7   0022
L_FFB8:
        SUBR    R1,     R3                      ; FFB8   010B
        BGE     L_FFBC                          ; FFB9   020D 0001

        NEGR    R3                              ; FFBB   0023
L_FFBC:
        CMPR    R2,     R3                      ; FFBC   0153
        BMI     L_FFC1                          ; FFBD   020B 0002

        SLR     R2,     2                       ; FFBF   0066
        INCR    R7                              ; FFC0   000F

L_FFC1:
        SLR     R3,     2                       ; FFC1   0067
L_FFC2:
        ADDR    R2,     R3                      ; FFC2   00D3
        MOVR    R3,     R2                      ; FFC3   009A
        PULR    R7                              ; FFC4   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; FFFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5023       <entry> $506B  
;;  $5040       $64B7  
;;  $5058       $5041   $622C   $695D  
;;  $5060       <entry>
;;  $5083       $5088  
;;  $5084       <entry>
;;  $508E       $5404  
;;  $508F       $508D  
;;  $5097       $5C99   $FE2F  
;;  $509D       $5818   $58D3   $FC51   $FCDA   $FD31  
;;  $50A5       $5503  
;;  $50AB       $FC81  
;;  $50B8       <entry>
;;  $50E0       $50DC  
;;  $50E8       $5132   $D54D   $FC4B  
;;  $50E9       $50E7  
;;  $50FD       $5120  
;;  $50FE       $50FC  
;;  $5109       $5102  
;;  $510D       <entry>
;;  $511A       $513E   $D550   $FC7E  
;;  $5122       $50E4   $512F   $FC48  
;;  $512D       $5111  
;;  $512E       $50E1  
;;  $513D       $5118  
;;  $5149       $5B6E  
;;  $5153       $D54A  
;;  $516A       <entry>
;;  $517D       $5186  
;;  $5189       $5177  
;;  $518D       $5196  
;;  $5198       $5175  
;;  $519F       $519F  
;;  $51AB       $5180  
;;  $51C8       $51C3  
;;  $51CB       $FCAB   $FEA2  
;;  $51D2       $51D8  
;;  $51DF       $5C4C  
;;  $51EA       $51F0   $51F3  
;;  $51F7       $5232  
;;  $51F8       $51FE  
;;  $5201       $51C9  
;;  $520C       $5209  
;;  $5210       $520D  
;;  $5218       $5212  
;;  $5220       $5216  
;;  $522C       $5224  
;;  $5234       $5229  
;;  $5235       $521E  
;;  $523C       $5203   $5413   $F795   $F991  
;;  $5251       $5242  
;;  $525F       $525A  
;;  $5261       $5190  
;;  $529E       $529A  
;;  $52A4       $52A0   $52B6  
;;  $52A7       $5307  
;;  $52AA       $52D4  
;;  $52AB       $5330  
;;  $52B0       $5296  
;;  $52B8       $52B2  
;;  $52D2       $52C9  
;;  $52D3       $528A   $52BC  
;;  $52D6       $51BC   $527A  
;;  $52F6       $52DC  
;;  $5309       $52F4  
;;  $531B       $527F  
;;  $5332       $5270  
;;  $533E       $516E  
;;  $533F       $527C  
;;  $5352       $5345   $5348   $534B   $534E  
;;  $5353       $5351  
;;  $5355       $5341  
;;  $536A       $581E   $58D9   $FD2E  
;;  $5377       $5076  
;;  $5385       $5079  
;;  $5394       $5383  
;;  $53A3       $539D  
;;  $53AF       $53A8  
;;  $53B0       $53AE  
;;  $53B8       $F75F  
;;  $53DE       $53DA  
;;  $53FA       $53F7  
;;  $540D       $53D1   $53EB   $53F1  
;;  $5423       $53BB   $53BF   $53C2  
;;  $5424       $53CA  
;;  $5440       $F74E   $F7C4  
;;  $5450       $F753  
;;  $545D       $5449   $5459  
;;  $548E       $544B  
;;  $54AF       $54A5  
;;  $54B5       $54AD  
;;  $54C8       $54C4  
;;  $54CC       $545B  
;;  $54E0       $54CA   $F38E  
;;  $5502       $54FE  
;;  $550D       $540B  
;;  $5513       $518A   $538D   $5468   $F79C   $F7B1   $FB2D   $FB84   $FB9B  
;;  $5513       $FECD  
;;  $5518       $53CC   $548E   $54CC   $F375  
;;  $551E       $517A   $537F   $5717   $57D5   $588F   $5C6A   $5D7A   $5DBB  
;;  $551E       $6B74   $F334   $FAE7   $FAF7   $FB6F   $FE0A  
;;  $5523       $5516  
;;  $552D       $52CE   $5470  
;;  $5536       $54BB   $FDB6   $FDBB  
;;  $553B       $54D9   $F387  
;;  $554B       $521B   $52A7  
;;  $554C       $53AB  
;;  $555A       $5555  
;;  $5568       $5373   $6498   $FC29   $FD92   $FEBD  
;;  $557D       $5C15   $FE13  
;;  $5588       $5439   $5D84   $F363  
;;  $5594       $557B   $5589  
;;  $559B       $5592  
;;  $559D       $55AA  
;;  $55AC       $537D   $538B   $53CF   $5442   $5452   $5466   $546E   $5491  
;;  $55AC       $54CF   $551C  
;;  $55BE       $5F47  
;;  $55CC       $55CC  
;;  $560D       $55FE   $5602   $5610   $5676  
;;  $560E       $5609  
;;  $5639       $5634  
;;  $5674       $560B  
;;  $568D       $5688  
;;  $5691       $55F6   $603E  
;;  $5698       $569A  
;;  $56AA       $56AF  
;;  $5716       $506D   $F357  
;;  $5738       $572B  
;;  $5739       $5737  
;;  $573B       $5730  
;;  $573E       $5723  
;;  $574E       $574A  
;;  $577D       $571A   $576C   $57D2   $57D8   $57DB   $57E3   $582D   $587E  
;;  $577D       $5885   $5892   $5895   $589D   $58A5   $58AA   $5915   $591E  
;;  $577D       $59BF   $5A25   $5A6D  
;;  $577E       $507C  
;;  $5783       $57C9  
;;  $57B4       $57A4  
;;  $57BE       $57B2  
;;  $57C2       $57B0   $57BC  
;;  $57C7       $5789   $578F   $5791   $579F   $57A8   $57AD   $57B9  
;;  $5814       $580E  
;;  $5816       $5812  
;;  $583B       $582F  
;;  $5840       $5839  
;;  $585B       $5842   $58FD  
;;  $5875       $586F  
;;  $5878       $585F  
;;  $58F6       $58EA  
;;  $58FB       $58F4  
;;  $5910       $5889  
;;  $594B       $5945  
;;  $594E       $5942   $5949  
;;  $5952       $594F  
;;  $5956       $542F   $5436   $5B9C   $5D81   $FE10   $FECA  
;;  $5962       $595E  
;;  $597D       $5984  
;;  $5986       $5958  
;;  $5987       $5073  
;;  $5989       $59B2  
;;  $59AF       $5991   $59A3  
;;  $59B5       $53B1   $F354  
;;  $59B6       $5239   $52AD  
;;  $59C2       $59BB  
;;  $59C3       $59C1  
;;  $59DD       $59CB  
;;  $59F0       $59E2  
;;  $59FB       $59D0   $59DD   $59F3  
;;  $5A04       $59DB  
;;  $5A0E       $59C6  
;;  $5A22       $5A1C  
;;  $5A31       $5A17  
;;  $5A38       $5A20  
;;  $5A51       $5A29  
;;  $5A53       $5A4F  
;;  $5A57       $5A4D  
;;  $5A5E       $59CD   $5A4A  
;;  $5A67       $5A64  
;;  $5A77       $5A74  
;;  $5A7E       $59FB  
;;  $5A85       $5A9A  
;;  $5A89       $5A85  
;;  $5A8B       $59D2   $5A43  
;;  $5A9C       $5732  
;;  $5AA5       $57FD   $58C1  
;;  $5AAE       $5821   $58DC  
;;  $5AB5       $5AC6  
;;  $5AC9       $583B   $58F6  
;;  $5AF4       $5AF1  
;;  $5B02       $5AFD  
;;  $5B28       $5C04   $5C4A   $5D2A   $5D2E   $5D37   $5D44  
;;  $5B29       $54FA   $575C   $5AE3   $F349   $F6EE   $F92C  
;;  $5B34       $523E   $5B2A   $6BF5   $6C0E  
;;  $5B69       $5B5D  
;;  $5B7A       $5B74  
;;  $5B80       $5BD4  
;;  $5B8A       $5B7E  
;;  $5BA3       $FC2C   $FCEF  
;;  $5BA8       $5B78   $5BC9   $5DB0  
;;  $5BCB       $5BC0   $5BC4  
;;  $5BD6       $5BCF  
;;  $5BE6       $5BE3  
;;  $5C31       $5CB1  
;;  $5C48       $5C39  
;;  $5C4C       $5C45  
;;  $5C57       $5C1A   $5C31  
;;  $5C67       $5C64   $DF61  
;;  $5C6A       $DF14  
;;  $5C95       $5C90  
;;  $5CAD       $5C97  
;;  $5CCF       $5CC2  
;;  $5CD6       $5CB9   $5CBD   $5CCD  
;;  $5CE4       $5CC6   $5CCB   $5CD4  
;;  $5CEC       $5BF3  
;;  $5D21       $5D6E  
;;  $5D42       $5D3F  
;;  $5D46       $5D32  
;;  $5D6A       $5D65  
;;  $5D8F       $5D8C  
;;  $5D95       $5D74  
;;  $5DA4       $5D9E  
;;  $5DA6       $5DA2  
;;  $5DB2       $5D98  
;;  $5DD5       $5D46  
;;  $5DF7       $5DF4  
;;  $5DF8       $5A9F   $5CFA  
;;  $5E06       $5BC6   $5BD1   $5BF6  
;;  $5E1F       $5D67   $FE16  
;;  $5E30       $63F7   $6421  
;;  $5E3F       $6079   $64D4   $64DD  
;;  $5E4E       $6449   $6451  
;;  $5E5D       $5619   $567F   $6467   $6950   $6957   $696F  
;;  $5E6C       $614F   $64E1  
;;  $5E80       $5E70  
;;  $5E8E       $64AC  
;;  $5E9D       $55CF   $62F4   $6923   $D2DD   $D51A   $F3D8  
;;  $5EB2       $5EBC   $D2FE   $D537  
;;  $5EBE       $5EB4  
;;  $5EC9       <entry>
;;  $5EDE       $5F33  
;;  $5EE9       $5061  
;;  $5F0D       $5F09  
;;  $5F19       $5EEE   $5EF9  
;;  $5F1A       $5EFF  
;;  $5F1C       $5F2C  
;;  $5F29       $5F21   $5F26  
;;  $5F3F       $5F45  
;;  $5FA6       $5E9E   $5FB7  
;;  $5FB5       $5FB5  
;;  $5FB6       $55C9   $62FB   $6FDA   $D2E4   $D521  
;;  $5FC3       $5FD4  
;;  $5FD7       $60C0   $6446   $6D25   $F187  
;;  $5FE1       $5AD6   $60C5   $644E   $6D21   $F183  
;;  $5FE6       $5FEA  
;;  $5FF4       $5FE7  
;;  $5FF6       $639E   $6435   $F832  
;;  $5FF9       $5FFD  
;;  $6001       $5FFA  
;;  $6002       $6000  
;;  $6004       $569C   $56B1   $F18B   $F18F  
;;  $600B       $6018  
;;  $603D       $6953  
;;  $6061       $6218  
;;  $606B       $F5CC  
;;  $6092       $6080   $6084  
;;  $609A       $6139  
;;  $60A1       $606E   $6076   $628E  
;;  $60A2       $6072  
;;  $6118       $6114  
;;  $6124       $611D  
;;  $613B       $60B4  
;;  $6163       $6061  
;;  $6164       $617E  
;;  $616C       $6169  
;;  $61A4       $608D   $6199  
;;  $61AA       $61A5  
;;  $61E0       $608A   $6095   $60D0  
;;  $61F1       $61FA  
;;  $6233       $6210  
;;  $624C       $609A   $6192   $6235  
;;  $6274       $6270  
;;  $6277       $60DC   $6D0B  
;;  $628A       $61BC   $6286   $668B   $6695   $66C2  
;;  $628C       $6293  
;;  $62F0       $622F   $6960   $F31F   $FC40   $FC75   $FEB9  
;;  $6341       $63D0   $63D7   $63E6   $63EA   $641B  
;;  $6359       $6312   $6319   $64DA  
;;  $635E       $63F4   $641E  
;;  $635F       $635D  
;;  $6368       $63BF  
;;  $637D       $6379  
;;  $6386       $6382  
;;  $63A5       $63A2  
;;  $63C5       $F5F7   $F63B  
;;  $63E4       $63DB  
;;  $63F3       $63DE   $63E2   $63EF  
;;  $63FE       $F5DC   $F611   $F61F   $F62D   $F657  
;;  $641E       $644C   $6454  
;;  $6425       $6413  
;;  $644E       $6439  
;;  $6456       $6417  
;;  $649F       $6493  
;;  $64C6       $6410  
;;  $64D8       $63CE  
;;  $64E1       $643F   $6444   $6462  
;;  $64EB       $64E9  
;;  $6505       $6503  
;;  $6510       $650E  
;;  $6515       $6185   $64D1  
;;  $6566       $6563  
;;  $6585       $6582  
;;  $6598       $6595  
;;  $65A8       $65A0  
;;  $6639       $635A   $64C9   $6518   $66CB  
;;  $663F       $6092   $60CD   $6D04  
;;  $6644       $663D   $6642  
;;  $6648       $55BF   $621A   $67D9   $67F6   $692A   $696C   $F3DF  
;;  $664D       $6646  
;;  $666E       $666C  
;;  $6676       $635F  
;;  $668F       $6685  
;;  $66A9       $55DB   $55E4   $667A   $66D3  
;;  $66CA       $568D   $64C2  
;;  $66E7       $647E  
;;  $66EC       $62F1  
;;  $66ED       $66EB  
;;  $66F3       $66FB  
;;  $66FE       $610B   $61C8  
;;  $6700       $61DC  
;;  $6722       $6707  
;;  $6729       $6726  
;;  $672C       $6720  
;;  $6737       $65D9   $65ED   $6601  
;;  $674E       $6441   $F8D2  
;;  $6764       $675E  
;;  $6766       $6762  
;;  $67B0       $67AE  
;;  $67D5       $6224   $64AF  
;;  $67E3       $67FF  
;;  $6802       $67F2   $67FB  
;;  $6803       $680B  
;;  $6807       $6808  
;;  $680E       $6FE0   $D2EA   $D527  
;;  $6816       $682D  
;;  $6817       $6834  
;;  $6827       $6829  
;;  $682F       $6839  
;;  $6830       $681E  
;;  $6836       $D534  
;;  $6837       $683E  
;;  $6844       $5F16   $67EA   $6983  
;;  $6847       $6532   $65AF  
;;  $684E       $6845  
;;  $684F       $686D  
;;  $685B       $6855   $686A  
;;  $685D       $6866  
;;  $6868       $6860  
;;  $6870       $6543   $65BF  
;;  $6873       $6884  
;;  $6887       $5070  
;;  $68B2       $6895   $68CE  
;;  $68B7       $689B  
;;  $68C3       $68A1  
;;  $68C8       $68A7  
;;  $68D0       $68AD   $68BC  
;;  $68D3       $68B5   $68C1  
;;  $68DD       $68C6   $68CC  
;;  $68E5       $688F   $68B0  
;;  $68F2       $68EE  
;;  $68F3       $5B25  
;;  $691F       $64BE  
;;  $6920       $568A  
;;  $6950       $6947  
;;  $6957       $694A  
;;  $696C       $6944   $694D  
;;  $6A60       $6A5E  
;;  $6AE6       $6AE4  
;;  $6B73       $5506  
;;  $6B9C       $6B96  
;;  $6BA3       $6B9A  
;;  $6BBE       $6BB4   $6BBA  
;;  $6BCA       $6BC5  
;;  $6BF4       $549B   $6B7E   $6CB2  
;;  $6BFF       $6BA0   $6CBF  
;;  $6C19       $6C12  
;;  $6C20       $6C02   $6C06   $6C15  
;;  $6C23       $6C17   $6C1E  
;;  $6C26       $6BA6  
;;  $6C40       $6BAA   $6CC7  
;;  $6C5A       $6C54  
;;  $6C5C       $6BAD   $6CCA  
;;  $6C68       $6C5E  
;;  $6C69       $6C64  
;;  $6C70       $6C6B  
;;  $6C79       $6C72  
;;  $6C82       $6C7B  
;;  $6C85       $6C60  
;;  $6C8C       $6C87  
;;  $6C93       $6C8E  
;;  $6C9A       $6C95  
;;  $6CA3       $6C9C  
;;  $6CA8       $F743   $FF52  
;;  $6CD3       $6CCF  
;;  $6CD4       $6212  
;;  $6CE7       $6CDA   $6CE3  
;;  $6CF2       $6CFD  
;;  $6D16       $6D17   $6D1A  
;;  $6D1D       $6D2B  
;;  $6D37       $6D30  
;;  $6D39       $6D35  
;;  $6D42       $6CED   $6CFA  
;;  $6DAD       $6DAB  
;;  $6DE4       $6DE2  
;;  $6E95       $6E95  
;;  $6E96       $6E96  
;;  $6E97       $6E97  
;;  $6EBC       $6EBC  
;;  $6FD9       $5EDB  
;;  $D06E       $D06C  
;;  $D178       $D176  
;;  $D1C2       $D1C2  
;;  $D499       $D497  
;;  $D57F       $D57D  
;;  $D7FB       $D7F9  
;;  $D7FE       $D7FC  
;;  $D7FF       $D7FD  
;;  $D800       $D7FE  
;;  $D90A       $D90A  
;;  $DC04       $D832  
;;  $DE6B       $DE69  
;;  $DE98       $DE98  
;;  $DEC1       $DEBF  
;;  $DED1       $DECF  
;;  $DF1E       $DF1C  
;;  $DF47       $DF45  
;;  $DF4B       $DF49  
;;  $DF6B       $DF69  
;;  $DFB6       $DFB4  
;;  $F069       $F067  
;;  $F0E1       $F0E1  
;;  $F130       $F14E  
;;  $F15E       $F172  
;;  $F170       $F167   $F16B  
;;  $F183       $F177  
;;  $F18A       $F12E  
;;  $F1DD       $F1E2  
;;  $F1E4       $F1CF   $F1D2   $F1D5   $F1D8   $F1DB  
;;  $F1F7       $F1F9  
;;  $F214       $F235  
;;  $F22B       $F217   $F21A   $F21D  
;;  $F231       $F229  
;;  $F232       $F223   $F227   $F22E  
;;  $F241       $F23B  
;;  $F276       $F27B  
;;  $F27D       $F268   $F26B   $F26E   $F271   $F274  
;;  $F27E       $F258   $F25B   $F25E   $F261   $F264  
;;  $F2A3       $F2A0  
;;  $F2AD       $F2A5   $F2AA  
;;  $F2BA       $F2C5  
;;  $F2C4       $F2C1  
;;  $F2D0       $F2CE  
;;  $F2DE       $F2DC  
;;  $F2EC       $F2EA  
;;  $F2FA       $F2F8  
;;  $F351       $F34D  
;;  $F36D       $F378  
;;  $F391       $F372  
;;  $F3BB       $F3B4  
;;  $F3BE       $F3B9  
;;  $F3C6       $F3C2  
;;  $F3EC       $F3ED  
;;  $F3EF       $F3F5  
;;  $F3F7       $F3FD  
;;  $F40B       $F40E  
;;  $F42E       $F436  
;;  $F430       $F433  
;;  $F436       $F1BC  
;;  $F43B       $F43D  
;;  $F449       $F452  
;;  $F454       $F446  
;;  $F457       $F444   $F44C  
;;  $F459       $F415   $F422  
;;  $F597       $F5A0   $F5A3  
;;  $F5CC       $F5C2  
;;  $F5F3       $F60C  
;;  $F60E       $F5F1  
;;  $F637       $F635  
;;  $F645       $F643  
;;  $F666       $F662  
;;  $F685       $F7DA  
;;  $F6F3       $F6DC  
;;  $F73B       $F739  
;;  $F73C       $F6B9   $F6EC  
;;  $F753       $F74C  
;;  $F756       $F751  
;;  $F76F       $F7DC  
;;  $F7B1       $F7A7  
;;  $F7DE       $F7D2  
;;  $F802       $F7FE  
;;  $F81A       $F829  
;;  $F836       $F85A  
;;  $F84A       $F840   $F843   $F846  
;;  $F856       $F85D  
;;  $F873       $F8C0  
;;  $F8A4       $F8A1  
;;  $F8AD       $F8A9  
;;  $F8B2       $F8BB  
;;  $F8B8       $F8B3  
;;  $F8CD       $F8D7   $F8DB  
;;  $F8EB       $F8E9  
;;  $F8F0       $F8EE  
;;  $F8FF       $F91A  
;;  $F915       $F90B  
;;  $F92C       $F92A  
;;  $F931       $F942  
;;  $F94E       $F94B  
;;  $F954       $F950  
;;  $F9D9       $F9D4  
;;  $FA0A       $FA32  
;;  $FA1D       $FA1A  
;;  $FA25       $FA1F  
;;  $FA2E       $FA23  
;;  $FA36       $F98F  
;;  $FA37       $FA2C  
;;  $FA9A       $FA95  
;;  $FAB9       $FADA  
;;  $FAC1       $FABE  
;;  $FAD6       $FAC3   $FAD0  
;;  $FADE       $FAD4  
;;  $FAF4       $FAF1  
;;  $FAF7       $FAE5  
;;  $FB03       $FB00  
;;  $FB0A       $FB07  
;;  $FB18       $FB12  
;;  $FB1C       $FB0E  
;;  $FB24       $FB1E  
;;  $FB26       $FAF5   $FB16   $FB1A   $FB22  
;;  $FB50       $FB4D  
;;  $FB67       $FB52  
;;  $FBAC       $FB99   $FBA8  
;;  $FC45       $FC39  
;;  $FC47       $FC6F  
;;  $FC69       $FC36  
;;  $FC9F       $FCA1  
;;  $FCB2       $FEA9  
;;  $FCB4       $FD7C   $FD82   $FD8B   $FE65   $FE6B   $FEB3  
;;  $FCBD       $FCC5  
;;  $FCD2       $FCCE  
;;  $FCF2       $FCED  
;;  $FCFA       $FF48  
;;  $FD04       $FD29  
;;  $FD16       $FD12  
;;  $FD62       $FD5E  
;;  $FD6A       $FD67  
;;  $FD8D       $FD76  
;;  $FDD0       $FDCD  
;;  $FE2F       $FCF8  
;;  $FEBC       $FEB7  
;;  $FECD       $FEC4  
;;  $FEDC       $FED6  
;;  $FEEF       $FEEC  
;;  $FF45       $FF41  
;;  $FF62       $FF5D  
;;  $FF6B       $FF68  
;;  $FF70       $FF6D  
;;  $FF79       $FF75  
;;  $FF7E       $FF7C  
;;  $FF8D       $FF81   $FF89  
;;  $FF97       $FF91  
;;  $FF99       $FF95  
;;  $FFAA       $FFA5  
;;  $FFB8       $FFB5  
;;  $FFBC       $FFB9  
;;  $FFC1       $FFBD  
;;  $FFC2       $FFC0  
;; ======================================================================== ;;
