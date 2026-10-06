
        ORG     $5000
.HEADER:
        BIDECLE $501B           ; 5000  Ptr: MOB graphic images
        BIDECLE $5282           ; 5002  Ptr: EXEC timer table
        BIDECLE $528B           ; 5004  Ptr: Start of game
        BIDECLE $501B           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $526D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $527A           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0000   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190           ; 5018   01B0 01A0 0190
.GFX_LIST_501B:
        DECLE   $00E0,  $00D0,  $00A0,  $00D0   ; 501B  CART PIC #00
        DECLE   $00A8,  $00D0,  $00A8,  $00D0   ; 501F  
        DECLE   $00FF,  $007F,  $00FF,  $003F   ; 5023  CART PIC #01
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5027  
        DECLE   $003F,  $002B,  $0035,  $0001   ; 502B  CART PIC #02
        DECLE   $0000,  $0000,  $0040,  $00FF   ; 502F  
        DECLE   $0000,  $0000,  $00A5,  $00B4   ; 5033  CART PIC #03
        DECLE   $00BC,  $00AC,  $00A4,  $0000   ; 5037  
        DECLE   $00E0,  $00D0,  $00A0,  $00D0   ; 503B  CART PIC #04
        DECLE   $00A8,  $00D0,  $00E8,  $00FF   ; 503F  
        DECLE   $00AF,  $0057,  $00FB,  $000F   ; 5043  CART PIC #05
        DECLE   $0003,  $0001,  $0000,  $0000   ; 5047  
        DECLE   $003F,  $003F,  $003F,  $003F   ; 504B  CART PIC #06
        DECLE   $003F,  $007F,  $003F,  $00FF   ; 504F  
        DECLE   $00AB,  $0055,  $00EF,  $003A   ; 5053  CART PIC #07
        DECLE   $0008,  $0000,  $0000,  $0021   ; 5057  
        DECLE   $003F,  $002F,  $0037,  $003F   ; 505B  CART PIC #08
        DECLE   $0007,  $0003,  $0003,  $0007   ; 505F  
        DECLE   $00FA,  $00F7,  $00FF,  $00F6   ; 5063  CART PIC #09
        DECLE   $00FE,  $00F4,  $00E8,  $00D4   ; 5067  
        DECLE   $0071,  $0001,  $0000,  $0000   ; 506B  CART PIC #0A
        DECLE   $0030,  $0070,  $0050,  $00FF   ; 506F  
        DECLE   $000F,  $0003,  $0013,  $0023   ; 5073  CART PIC #0B
        DECLE   $0021,  $0051,  $0031,  $0051   ; 5077  
        DECLE   $00FE,  $00FF,  $00FB,  $00FD   ; 507B  CART PIC #0C
        DECLE   $00FA,  $00FD,  $00FA,  $00F5   ; 507F  
        DECLE   $00BF,  $005F,  $00AF,  $0077   ; 5083  CART PIC #0D
        DECLE   $009F,  $0027,  $0087,  $0007   ; 5087  
        DECLE   $0000,  $0000,  $00D4,  $0094   ; 508B  CART PIC #0E
        DECLE   $0094,  $009C,  $0088,  $0000   ; 508F  
        DECLE   $0021,  $0030,  $0030,  $0010   ; 5093  CART PIC #0F
        DECLE   $0021,  $0001,  $0003,  $0007   ; 5097  
        DECLE   $00E8,  $00D4,  $00A8,  $00D0   ; 509B  CART PIC #10
        DECLE   $00A8,  $00D0,  $00E2,  $00FF   ; 509F  
        DECLE   $00EB,  $00F5,  $00BF,  $00D0   ; 50A3  CART PIC #11
        DECLE   $00A0,  $00D0,  $00A0,  $00D0   ; 50A7  
        DECLE   $00EB,  $00F5,  $00DB,  $00EC   ; 50AB  CART PIC #12
        DECLE   $00D0,  $0068,  $0050,  $0029   ; 50AF  
        DECLE   $0030,  $0028,  $0010,  $0018   ; 50B3  CART PIC #13
        DECLE   $0010,  $0000,  $0000,  $0000   ; 50B7  
        DECLE   $0002,  $0041,  $0040,  $0060   ; 50BB  CART PIC #14
        DECLE   $0060,  $0050,  $0030,  $00FF   ; 50BF  
        DECLE   $00FD,  $00EE,  $00F7,  $00EA   ; 50C3  CART PIC #15
        DECLE   $00F4,  $00EA,  $00F4,  $00EA   ; 50C7  
        DECLE   $005F,  $00AF,  $00FF,  $000F   ; 50CB  CART PIC #16
        DECLE   $0007,  $0007,  $0007,  $0007   ; 50CF  
        DECLE   $00F5,  $00EA,  $00F4,  $00EA   ; 50D3  CART PIC #17
        DECLE   $00F4,  $00EA,  $00F4,  $00EA   ; 50D7  
        DECLE   $0007,  $000F,  $0007,  $0007   ; 50DB  CART PIC #18
        DECLE   $0007,  $0007,  $0007,  $000F   ; 50DF  
        DECLE   $00F5,  $00EA,  $00F4,  $00EA   ; 50E3  CART PIC #19
        DECLE   $00F4,  $00EA,  $00F4,  $00FF   ; 50E7  
        DECLE   $00E0,  $00D0,  $00A0,  $00D0   ; 50EB  CART PIC #1A
        DECLE   $00A8,  $00D0,  $00FC,  $00FF   ; 50EF  
        DECLE   $0030,  $0028,  $0010,  $0000   ; 50F3  CART PIC #1B
        DECLE   $0000,  $0001,  $0003,  $00FF   ; 50F7  
        DECLE   $0010,  $0028,  $0037,  $003F   ; 50FB  CART PIC #1C
        DECLE   $0021,  $0020,  $0020,  $0018   ; 50FF  
        DECLE   $00FA,  $00F5,  $00EB,  $00D4   ; 5103  CART PIC #1D
        DECLE   $00E8,  $00D0,  $00A8,  $00D0   ; 5107  
        DECLE   $0000,  $0000,  $00BB,  $00AA   ; 510B  CART PIC #1E
        DECLE   $00BB,  $008A,  $00BB,  $0000   ; 510F  
        DECLE   $0050,  $0068,  $0050,  $00E8   ; 5113  CART PIC #1F
        DECLE   $0051,  $0068,  $0051,  $0068   ; 5117  
        DECLE   $009F,  $008F,  $009F,  $00C7   ; 511B  CART PIC #20
        DECLE   $00CF,  $00C7,  $00E7,  $00E3   ; 511F  
        DECLE   $00E3,  $00E7,  $00E3,  $00C7   ; 5123  CART PIC #21
        DECLE   $00CF,  $00C7,  $00CF,  $00C7   ; 5127  
        DECLE   $0000,  $0000,  $00B8,  $0088   ; 512B  CART PIC #22
        DECLE   $0090,  $0090,  $0090,  $0000   ; 512F  
        DECLE   $0088,  $0030,  $00C1,  $0028   ; 5133  CART PIC #23
        DECLE   $0010,  $0001,  $00C3,  $00E3   ; 5137  
        DECLE   $000F,  $0003,  $00C1,  $0031   ; 513B  CART PIC #24
        DECLE   $0018,  $000C,  $00CE,  $00EE   ; 513F  
        DECLE   $00E1,  $00C0,  $0088,  $0092   ; 5143  CART PIC #25
        DECLE   $0024,  $0064,  $00C8,  $00DB   ; 5147  
        DECLE   $0000,  $007C,  $00C6,  $00BA   ; 514B  CART PIC #26
        DECLE   $00A2,  $00BA,  $00C6,  $007C   ; 514F  
        DECLE   $00FF,  $00FF,  $00FF,  $007B   ; 5153  CART PIC #27
        DECLE   $002D,  $00B4,  $00A4,  $00E9   ; 5157  
        DECLE   $00FF,  $0023,  $006F,  $0063   ; 515B  CART PIC #28
        DECLE   $007B,  $0063,  $00FF,  $00FF   ; 515F  
        DECLE   $00FF,  $005A,  $00CB,  $0043   ; 5163  CART PIC #29
        DECLE   $00D3,  $005B,  $00FF,  $00FF   ; 5167  
        DECLE   $004F,  $0057,  $00AB,  $00AB   ; 516B  CART PIC #2A
        DECLE   $00D7,  $00D7,  $00AF,  $00DF   ; 516F  
        DECLE   $00FF,  $0011,  $0055,  $0011   ; 5173  CART PIC #2B
        DECLE   $0073,  $0075,  $00FF,  $00FF   ; 5177  
        DECLE   $00FF,  $0022,  $006E,  $0022   ; 517B  CART PIC #2C
        DECLE   $007A,  $0022,  $00FF,  $00FF   ; 517F  
        DECLE   $0000,  $0028,  $0000,  $002A   ; 5183  CART PIC #2D
        DECLE   $0000,  $003C,  $0000,  $0000   ; 5187  
        DECLE   $0006,  $0000,  $0000,  $001E   ; 518B  CART PIC #2E
        DECLE   $0000,  $002C,  $0000,  $0018   ; 518F  
        DECLE   $0003,  $0000,  $0006,  $0008   ; 5193   0003 0000 0006 0008
        DECLE   $0250,  $0231,  $0242,  $004F   ; 5197   0250 0231 0242 004F
        DECLE   $0003,  $0294,  $02E4,  $0344   ; 519B   0003 0294 02E4 0344
        DECLE   $0364,  $001F,  $0003,  $0250   ; 519F   0364 001F 0003 0250
        DECLE   $0241,  $0250,  $0231,  $0242   ; 51A3   0241 0250 0231 0242
        DECLE   $001F,  $0250,  $0231,  $0242   ; 51A7   001F 0250 0231 0242
        DECLE   $004F,  $0003,  $02B5,  $02C5   ; 51AB   004F 0003 02B5 02C5
        DECLE   $0295,  $0285,  $002F,  $0003   ; 51AF   0295 0285 002F 0003
        DECLE   $0205,  $0003,  $0215,  $02A6   ; 51B3   0205 0003 0215 02A6
        DECLE   $001F,  $0003,  $0215           ; 51B7   001F 0003 0215

        SUBR    R2,     R7                      ; 51BA   0117
L_51BB:
        DECR    R7                              ; 51BB   0017
        SUBR    R2,     R7                      ; 51BC   0117

        RRC     R3,     2                       ; 51BD   0077
        ADDR    R0,     R7                      ; 51BE   00C7
        ADDR    R2,     R7                      ; 51BF   00D7
        SUBR    R2,     R7                      ; 51C0   0117

        RLC     R3,     2                       ; 51C1   0057
        SUBR    R2,     R7                      ; 51C2   0117
        SUBR    R4,     R7                      ; 51C3   0127

        CMPR    R2,     R7                      ; 51C4   0157
        CMPR    R4,     R7                      ; 51C5   0167
        SUBR    R2,     R7                      ; 51C6   0117
        SUBR    R4,     R7                      ; 51C7   0127

        DECLE   $01D7,  $0057,  $001F           ; 51C8   01D7 0057 001F

        DIS                                     ; 51CB   0003
        MVO     R0,     .BTAB.15                ; 51CC   0240 0215
        SETC                                    ; 51CE   0007
        SLR     R3,     2                       ; 51CF   0067
        SETC                                    ; 51D0   0007
        MOVR    R0,     R7                      ; 51D1   0087
        MOVR    R2,     R7                      ; 51D2   0097

        DECLE   $00B7,  $0007,  $00F7,  $0007   ; 51D3   00B7 0007 00F7 0007
        DECLE   $0137,  $0177,  $0187,  $0007   ; 51D7   0137 0177 0187 0007
        DECLE   $0137,  $0007,  $01C7,  $001F   ; 51DB   0137 0007 01C7 001F
        DECLE   $0003,  $0251,  $0242,  $0047   ; 51DF   0003 0251 0242 0047
        DECLE   $0027,  $0047,  $0027           ; 51E3   0027 0047 0027

        SUBR    R0,     R7                      ; 51E6   0107
        MOVR    R4,     R7                      ; 51E7   00A7

        DECLE   $0047,  $0147,  $0047,  $0147   ; 51E8   0047 0147 0047 0147
        DECLE   $0197,  $0187,  $0047,  $0147   ; 51EC   0197 0187 0047 0147
        DECLE   $01A7,  $01B7,  $001F           ; 51F0   01A7 01B7 001F

        DIS                                     ; 51F3   0003
        MVO@    R0,     R2                      ; 51F4   0250
        MVO@    R1,     R2                      ; 51F5   0251
        MVO     R2,     .STIC.C.7               ; 51F6   0242 001F
        DIS                                     ; 51F8   0003
        SUBR    R2,     R7                      ; 51F9   0117

        RRC     R3,     2                       ; 51FA   0077
        SUBR    R2,     R7                      ; 51FB   0117
        SUBR    R4,     R7                      ; 51FC   0127
        SUBR    R2,     R7                      ; 51FD   0117
        SUBR    R4,     R7                      ; 51FE   0127

        DECLE   $0003,  $0157,  $0167,  $0157   ; 51FF   0003 0157 0167 0157
        DECLE   $0167,  $0215,  $002F,  $0003   ; 5203   0167 0215 002F 0003
        DECLE   $0215,  $0003,  $0250,  $0231   ; 5207   0215 0003 0250 0231

        MVO     R2,     .STIC.X.7               ; 520B   0242 0007
        MOVR    R0,     R7                      ; 520D   0087

        DECLE   $0007,  $01F7,  $0007,  $0137   ; 520E   0007 01F7 0007 0137
        DECLE   $0003,  $0177,  $0187,  $0177   ; 5212   0003 0177 0187 0177
        DECLE   $0187,  $0215                   ; 5216   0187 0215

        ADCR    R7                              ; 5218   002F

        DIS                                     ; 5219   0003
L_521A:
        BLT     L_523B                          ; 521A   0205 001F

        DECLE   $0003,  $0215,  $02A6,  $0047   ; 521C   0003 0215 02A6 0047
        DECLE   $0067,  $01A7,  $01B7,  $0047   ; 5220   0067 01A7 01B7 0047
        DECLE   $0147,  $0003,  $0197,  $0187   ; 5224   0147 0003 0197 0187
        DECLE   $0197,  $0187,  $0205,  $002F   ; 5228   0197 0187 0205 002F
        DECLE   $0270,  $0215,  $001F,  $0003   ; 522C   0270 0215 001F 0003
        DECLE   $0205,  $00FF,  $0003,  $0215   ; 5230   0205 00FF 0003 0215
        DECLE   $001F,  $0003,  $0215           ; 5234   001F 0003 0215

        DIS                                     ; 5237   0003
        CMPI    #$02F8, R0                      ; 5238   0378 02F8
        SUB@    R5,     R0                      ; 523A   0328
L_523B:
        MVO@    R0,     R1                      ; 523B   0248
        DECLE   $0003,  $0378,  $0298,  $03A8   ; 523C   0003 0378 0298 03A8
        DECLE   $0218,  $0328,  $0248,  $0003   ; 5240   0218 0328 0248 0003
        DECLE   $0251,  $0232,  $0241,  $0205   ; 5244   0251 0232 0241 0205
        DECLE   $001F                           ; 5248   001F

        DIS                                     ; 5249   0003
        BLT     L_524F                          ; 524A   0205 0003

        ADD@    R3,     R0                      ; 524C   02D8
        MVO@    R0,     R3                      ; 524D   0258
        ADD@    R3,     R0                      ; 524E   02D8
L_524F:
        ADDI    #$0328, R0                      ; 524F   02F8 0328
        DECLE   $0398,  $001F,  $0003,  $0268   ; 5251   0398 001F 0003 0268
        DECLE   $0358,  $02E8,  $0003,  $02A6   ; 5255   0358 02E8 0003 02A6
        DECLE   $0205,  $0003,  $0215,  $001F   ; 5259   0205 0003 0215 001F
        DECLE   $0270,  $0215,  $003F,  $0270   ; 525D   0270 0215 003F 0270
        DECLE   $0269,  $01E9,  $0229,  $0039   ; 5261   0269 01E9 0229 0039
        DECLE   $00E9,  $001F,  $0270,  $0003   ; 5265   00E9 001F 0270 0003
        DECLE   $001F,  $0270,  $0215,  $0270   ; 5269   001F 0270 0215 0270
.GRAM_INIT_526D:
        DECLE   $002F           ; 526D  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 526E  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5270  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5272  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 5274  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 5276  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0300   ; 5278  #28-2E:  CART #28-2E ----

.TITLE:
        DECLE   $0057                           ; 527A  Cartridge year
        STRING  "!"                             ; 527B  Title string
        DECLE   $0000                           ; 527C  

.TITLECODE:
        MVII    #$0003, R0                      ; 527D   02B8 0003
        MVO     R0,     G_0103                  ; 527F   0240 0103
        PULR    R7                              ; 5281   02B7

.TIMER:
        DECLE   $0088,  $0052,  $0001,  $0000; 5282  Timer dispatch/interval
        BIDECLE $0000           ; 5286  End of timer table

L_5288:
        MVO     R6,     G_011E                  ; 5288   0246 011E
        MOVR    R5,     R7                      ; 528A   00AF

.START:
        PSHR    R5                              ; 528B   0275

        JSR     R5,     L_5380                  ; 528C   0004 0150 0380
        DECLE   $0200,  $02F0                   ; 528F   0200 02F0
        BIDECLE $5183,  $5197                   ; 5291   0083 0051 0097 0051

        SDBD                                    ; 5295   0001
        MVII    #$52EC, R0                      ; 5296   02B8 00EC 0052
        MVO     R0,     G_035D                  ; 5299   0240 035D
        PULR    R7                              ; 529B   02B7

L_529C:
        PSHR    R5                              ; 529C   0275
        MVII    #$0007, R3                      ; 529D   02BB 0007
        MVII    #$023D, R4                      ; 529F   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 52A1   0004 0118 007B
        STRING  " INTV Corporation "            ; 52A4  
        DECLE   $0000                           ; 52B6   0000

        MVII    #$0007, R3                      ; 52B7   02BB 0007
        MVII    #$0256, R4                      ; 52B9   02BC 0256

        JSR     R5,     X_PRINT_R5              ; 52BB   0004 0118 007B
        STRING  "presents"                      ; 52BE  
        DECLE   $0000                           ; 52C6   0000

        MVII    #$0007, R3                      ; 52C7   02BB 0007
        MVII    #$02C9, R4                      ; 52C9   02BC 02C9

        JSR     R5,     X_PRINT_R5              ; 52CB   0004 0118 007B
        STRING  "Copr [C] 1987 INTV"            ; 52CE  
        DECLE   $0000                           ; 52E0   0000

        PULR    R7                              ; 52E1   02B7

        DECLE   $0000,  $0000,  $0060,  $0053   ; 52E2   0000 0000 0060 0053
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52E6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FE,  $0052   ; 52EA   0000 0000 00FE 0052
        DECLE   $00FE,  $0052,  $00FE,  $0052   ; 52EE   00FE 0052 00FE 0052
        DECLE   $00FE,  $0052,  $00FE,  $0052   ; 52F2   00FE 0052 00FE 0052
        DECLE   $00B4,  $0058,  $0061,  $005D   ; 52F6   00B4 0058 0061 005D
        DECLE   $002B,  $0054,  $0037           ; 52FA   002B 0054 0037

        SLR     R2,     2                       ; 52FD   0066
        PSHR    R5                              ; 52FE   0275
        SDBD                                    ; 52FF   0001
        MVII    #$53A8, R0                      ; 5300   02B8 00A8 0053
        MVO     R0,     .ISRVEC.0               ; 5303   0240 0100
        SWAP    R0,     1                       ; 5305   0040
        MVO     R0,     .ISRVEC.1               ; 5306   0240 0101
L_5308:
        MVI     .PSG0.rgt_hand,R5               ; 5308   0285 01FE
        AND     .PSG0.lft_hand,R5               ; 530A   0385 01FF
        CMPI    #$00FF, R5                      ; 530C   037D 00FF
        BNEQ    L_5308                          ; 530E   022C 0007

        MVII    #$00F0, R0                      ; 5310   02B8 00F0
        MVII    #$0200, R4                      ; 5312   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5314   0004 0114 0338

        CLRR    R0                              ; 5317   01C0
        MVO     R0,     G_0105                  ; 5318   0240 0105
        MVII    #$0007, R3                      ; 531A   02BB 0007
        MVII    #$0215, R4                      ; 531C   02BC 0215

        JSR     R5,     X_PRINT_R5              ; 531E   0004 0118 007B
        STRING  "Select -"                      ; 5321  
        DECLE   $0000                           ; 5329   0000

        CLRR    R0                              ; 532A   01C0
        MVII    #$023E, R4                      ; 532B   02BC 023E
L_532D:
        PSHR    R4                              ; 532D   0274
        PSHR    R0                              ; 532E   0270
        INCR    R0                              ; 532F   0008
        MVII    #$0001, R1                      ; 5330   02B9 0001
        MVII    #$0007, R3                      ; 5332   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 5334   0004 0118 00C5

        INCR    R4                              ; 5337   000C

        JSR     R5,     X_PRINT_R5              ; 5338   0004 0118 007B
        STRING  ". "                            ; 533B   002E 0020
        DECLE   $0000                           ; 533D   0000

        PULR    R5                              ; 533E   02B5
        PSHR    R5                              ; 533F   0275
        ADDR    R5,     R5                      ; 5340   00ED
        SDBD                                    ; 5341   0001
        ADDI    #$52F6, R5                      ; 5342   02FD 00F6 0052
        SDBD                                    ; 5345   0001
        MVI@    R5,     R1                      ; 5346   02A9
        MOVR    R1,     R5                      ; 5347   008D
        SUBI    #$000A, R5                      ; 5348   033D 000A
        SDBD                                    ; 534A   0001
        MVI@    R5,     R1                      ; 534B   02A9
        INCR    R1                              ; 534C   0009

        JSR     R5,     X_PRINT_R1              ; 534D   0004 0118 0067

        PULR    R0                              ; 5350   02B0
        INCR    R0                              ; 5351   0008
        PULR    R4                              ; 5352   02B4
        ADDI    #$0028, R4                      ; 5353   02FC 0028
        CMPI    #$0004, R0                      ; 5355   0378 0004
        BNEQ    L_532D                          ; 5357   022C 002B

        SDBD                                    ; 5359   0001
        MVII    #$52E2, R0                      ; 535A   02B8 00E2 0052
        MVO     R0,     G_035D                  ; 535D   0240 035D
        PULR    R7                              ; 535F   02B7

        CMPI    #$0004, R0                      ; 5360   0378 0004
        BGT     L_537F                          ; 5362   020E 001B

        DECR    R0                              ; 5364   0010
        BMI     L_537F                          ; 5365   020B 0018

L_5367:
        MVI     .PSG0.rgt_hand,R5               ; 5367   0285 01FE
        AND     .PSG0.lft_hand,R5               ; 5369   0385 01FF
        CMPI    #$00FF, R5                      ; 536B   037D 00FF
        BNEQ    L_5367                          ; 536D   022C 0007

        MOVR    R0,     R5                      ; 536F   0085
        ADDR    R0,     R5                      ; 5370   00C5
        SDBD                                    ; 5371   0001
        ADDI    #$52F6, R5                      ; 5372   02FD 00F6 0052
        SDBD                                    ; 5375   0001
        MVI@    R5,     R0                      ; 5376   02A8
        MVO     R0,     G_02F0                  ; 5377   0240 02F0
        DIS                                     ; 5379   0003
        MVII    #$02F1, R6                      ; 537A   02BE 02F1
        J       .EXEC.041                       ; 537C   0004 0310 0041
L_537F:
        MOVR    R5,     R7                      ; 537F   00AF

L_5380:
        MVI@    R5,     R0                      ; 5380   02A8
        MVI@    R5,     R2                      ; 5381   02AA
        SDBD                                    ; 5382   0001
        MVI@    R5,     R3                      ; 5383   02AB
        SDBD                                    ; 5384   0001
        MVI@    R5,     R4                      ; 5385   02AC
        PSHR    R5                              ; 5386   0275
        MOVR    R0,     R5                      ; 5387   0085
L_5388:
        CLRR    R1                              ; 5388   01C9
L_5389:
        MVI@    R4,     R0                      ; 5389   02A0
        PSHR    R4                              ; 538A   0274
        MOVR    R0,     R4                      ; 538B   0084
        ANDI    #$000F, R4                      ; 538C   03BC 000F
        CMPI    #$000F, R4                      ; 538E   037C 000F
        BEQ     L_53A2                          ; 5390   0204 0010

        SAR     R0,     1                       ; 5392   0068
        ANDI    #$01F8, R0                      ; 5393   03B8 01F8
        ADDR    R4,     R4                      ; 5395   00E4
        ADDR    R3,     R4                      ; 5396   00DC
        SDBD                                    ; 5397   0001
        XOR@    R4,     R0                      ; 5398   03E0
L_5399:
        MVO@    R0,     R5                      ; 5399   0268
        DECR    R1                              ; 539A   0011
        BPL     L_5399                          ; 539B   0223 0003

        PULR    R4                              ; 539D   02B4
        CMPR    R2,     R5                      ; 539E   0155
        BNEQ    L_5388                          ; 539F   022C 0018
        PULR    R7                              ; 53A1   02B7

L_53A2:
        SLR     R0,     2                       ; 53A2   0064
        SLR     R0,     2                       ; 53A3   0064
        MOVR    R0,     R1                      ; 53A4   0081
        PULR    R4                              ; 53A5   02B4
        B       L_5389                          ; 53A6   0220 001E

        MVII    #$0021, R1                      ; 53A8   02B9 0021
        MVO@    R0,     R1                      ; 53AA   0248
        ADD     G_0105, R7                      ; 53AB   02C7 0105

        MVI@    R1,     R0                      ; 53AD   0288
        J       X_DEF_ISR                       ; 53AE   0004 0310 0126

        SUBI    #$0008, R6                      ; 53B1   033E 0008
        MVO     R1,     .ISRVEC.0               ; 53B3   0241 0100
        MVO     R2,     .ISRVEC.1               ; 53B5   0242 0101
        PULR    R7                              ; 53B7   02B7

L_53B8:
        PSHR    R5                              ; 53B8   0275
        MVI     .ISRVEC.0,R1                    ; 53B9   0281 0100
        MVI     .ISRVEC.1,R2                    ; 53BB   0282 0101
        SDBD                                    ; 53BD   0001
        MVII    #$53B1, R0                      ; 53BE   02B8 00B1 0053
        MVO     R0,     .ISRVEC.0               ; 53C1   0240 0100
        SWAP    R0,     1                       ; 53C3   0040
        MVO     R0,     .ISRVEC.1               ; 53C4   0240 0101
        EIS                                     ; 53C6   0002
L_53C7:
        DECR    R7                              ; 53C7   0017

L_53C8:
        PSHR    R5                              ; 53C8   0275

        JSR     R5,     L_53B8                  ; 53C9   0004 0150 03B8

        PULR    R5                              ; 53CC   02B5
        MVI@    R5,     R1                      ; 53CD   02A9
        SDBD                                    ; 53CE   0001
        MVI@    R5,     R4                      ; 53CF   02AC
        PSHR    R5                              ; 53D0   0275
        SDBD                                    ; 53D1   0001
        MVII    #$3800, R5                      ; 53D2   02BD 0000 0038
L_53D5:
        MVI@    R4,     R0                      ; 53D5   02A0
        MVO@    R0,     R5                      ; 53D6   0268
        MVI@    R4,     R0                      ; 53D7   02A0
        MVO@    R0,     R5                      ; 53D8   0268
        MVI@    R4,     R0                      ; 53D9   02A0
        MVO@    R0,     R5                      ; 53DA   0268
        MVI@    R4,     R0                      ; 53DB   02A0
        MVO@    R0,     R5                      ; 53DC   0268
        MVI@    R4,     R0                      ; 53DD   02A0
        MVO@    R0,     R5                      ; 53DE   0268
        MVI@    R4,     R0                      ; 53DF   02A0
        MVO@    R0,     R5                      ; 53E0   0268
        MVI@    R4,     R0                      ; 53E1   02A0
        MVO@    R0,     R5                      ; 53E2   0268
        MVI@    R4,     R0                      ; 53E3   02A0
        MVO@    R0,     R5                      ; 53E4   0268
        DECR    R1                              ; 53E5   0011
        BNEQ    L_53D5                          ; 53E6   022C 0012
        PULR    R7                              ; 53E8   02B7

L_53E9:
        PSHR    R5                              ; 53E9   0275
L_53EA:
        SDBD                                    ; 53EA   0001
        MVII    #$1906, R0                      ; 53EB   02B8 0006 0019
        MVO     R0,     G_035D                  ; 53EE   0240 035D

        JSR     R5,     X_READ_ROM_HDR          ; 53F0   0004 0110 00AB

        EIS                                     ; 53F3   0002
        MOVR    R5,     R1                      ; 53F4   00A9
L_53F5:
        MVI@    R1,     R0                      ; 53F5   0288
        TSTR    R0                              ; 53F6   0080
        BEQ     L_5400                          ; 53F7   0204 0007

        JSR     R5,     X_TIMER_STOP            ; 53F9   0004 0118 0038

        ADDI    #$0004, R1                      ; 53FC   02F9 0004
        B       L_53F5                          ; 53FE   0220 000A
L_5400:
        PULR    R7                              ; 5400   02B7

L_5401:
        PSHR    R5                              ; 5401   0275

L_5402:
        JSR     R5,     X_PLAY_SFX1             ; 5402   0004 0118 03BB
        DECLE   $03C9                           ; 5405  SFX data
        DECLE   $0040,  $0080                   ; 5406  SFX data
        DECLE   $0048,  $0081                   ; 5408  SFX data
        DECLE   $010C,  $0000                   ; 540A  SFX data
        DECLE   $000B                           ; 540C  SFX data
        DECLE   $03CF                           ; 540D  SFX end


        PULR    R7                              ; 540E   02B7

L_540F:
        MVI@    R5,     R3                      ; 540F   02AB
        MVI@    R5,     R4                      ; 5410   02AC
L_5411:
        MVI@    R5,     R0                      ; 5411   02A8
        MVO@    R0,     R4                      ; 5412   0260
        DECR    R3                              ; 5413   0013
        BNEQ    L_5411                          ; 5414   022C 0004
        MOVR    R5,     R7                      ; 5416   00AF

        DECLE   $00FF,  $0057,  $003A,  $0054   ; 5417   00FF 0057 003A 0054
        DECLE   $0061,  $0054,  $00FF           ; 541B   0061 0054 00FF

        RLC     R3,     2                       ; 541E   0057
        SWAP    R2,     2                       ; 541F   0046
        RLC     R0,     2                       ; 5420   0054
        ADCR    R3                              ; 5421   002B
        RLC     R0,     2                       ; 5422   0054
        ADDR    R1,     R7                      ; 5423   00CF

        DECLE   $0000,  $0001,  $0000,  $0000   ; 5424   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0057   ; 5428   0000 0000 0006 0057
        DECLE   $0043,  $0072,  $006F,  $0073   ; 542C   0043 0072 006F 0073
        DECLE   $0073,  $0077,  $006F,  $0072   ; 5430   0073 0077 006F 0072
        DECLE   $0064,  $0073,  $0000,  $0004   ; 5434   0064 0073 0000 0004
        DECLE   $0350,  $029C,  $0071,  $001A   ; 5438   0350 029C 0071 001A
        DECLE   $0001,  $0080,  $0061,  $0054   ; 543C   0001 0080 0061 0054
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5440   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $002B,  $0000   ; 5444   0000 0000 002B 0000
        DECLE   $003F,  $0030,  $0002,  $00A3   ; 5448   003F 0030 0002 00A3
        DECLE   $0390,  $00B3,  $0010,  $0003   ; 544C   0390 00B3 0010 0003
        DECLE   $03B0,  $0013,  $03B0,  $0023   ; 5450   03B0 0013 03B0 0023
        DECLE   $03B0,  $0033,  $00B0,  $027F   ; 5454   03B0 0033 00B0 027F
        DECLE   $0010,  $017D,  $0010,  $0001   ; 5458   0010 017D 0010 0001
        DECLE   $0010,  $003F                   ; 545C   0010 003F

        DECR    R0                              ; 545E   0010
        COMR    R3                              ; 545F   001B
        DECR    R0                              ; 5460   0010
        PSHR    R5                              ; 5461   0275
        MVI     G_0174, R1                      ; 5462   0281 0174
        INCR    R1                              ; 5464   0009
        ADDR    R7,     R1                      ; 5465   00F9
        ADD@    R1,     R7                      ; 5466   02CF

        DECLE   $0004                           ; 5467   0004

        RRC     R0,     1                       ; 5468   0070
        MOVR    R0,     R6                      ; 5469   0086
        MOVR    R0,     R6                      ; 546A   0086
        MVII    #$0214, R4                      ; 546B   02BC 0214
        MVII    #$000B, R2                      ; 546D   02BA 000B
L_546F:
        MVII    #$0006, R1                      ; 546F   02B9 0006
        SWAP    R1,     1                       ; 5471   0041
        MVO@    R1,     R4                      ; 5472   0261
        MVO@    R1,     R4                      ; 5473   0261
        MVII    #$0010, R0                      ; 5474   02B8 0010
        SDBD                                    ; 5476   0001
        MVII    #$1800, R1                      ; 5477   02B9 0000 0018

        JSR     R5,     X_FILL_MEM              ; 547A   0004 0114 0341

        MVII    #$0022, R1                      ; 547D   02B9 0022
        SWAP    R1,     1                       ; 547F   0041
        MVO@    R1,     R4                      ; 5480   0261
        MVO@    R1,     R4                      ; 5481   0261
        DECR    R2                              ; 5482   0012
        BNEQ    L_546F                          ; 5483   022C 0015

        MVII    #$0007, R2                      ; 5485   02BA 0007
        MVII    #$0228, R4                      ; 5487   02BC 0228
        SDBD                                    ; 5489   0001
        MVII    #$0E1F, R1                      ; 548A   02B9 001F 000E
        SDBD                                    ; 548D   0001
        MVII    #$2A1F, R3                      ; 548E   02BB 001F 002A
L_5491:
        MVO@    R1,     R4                      ; 5491   0261
        ADDI    #$0012, R4                      ; 5492   02FC 0012
        MVO@    R3,     R4                      ; 5494   0263
        ADDI    #$0008, R1                      ; 5495   02F9 0008
        ADDI    #$0008, R3                      ; 5497   02FB 0008
        DECR    R2                              ; 5499   0012
        BNEQ    L_5491                          ; 549A   022C 000A

        JSR     R5,     L_5507                  ; 549C   0004 0154 0107
        JSR     R5,     L_540F                  ; 549F   0004 0154 000F
        DECLE   $0007,  $0170,  $0081,  $0000   ; 54A2   0007 0170 0081 0000
        DECLE   $0006,  $0009,  $0001,  $0001   ; 54A6   0006 0009 0001 0001

        EIS                                     ; 54AA   0002
        SDBD                                    ; 54AB   0001
        MVII    #$54CD, R0                      ; 54AC   02B8 00CD 0054
        MVO     R0,     G_035D                  ; 54AF   0240 035D
        SDBD                                    ; 54B1   0001
        MVII    #$0600, R1                      ; 54B2   02B9 0000 0006
        MVII    #$0200, R4                      ; 54B5   02BC 0200
        MVII    #$0004, R0                      ; 54B7   02B8 0004

        JSR     R5,     X_FILL_MEM              ; 54B9   0004 0114 0341

        SDBD                                    ; 54BC   0001
        MVII    #$2200, R1                      ; 54BD   02B9 0000 0022
        MVII    #$0210, R4                      ; 54C0   02BC 0210

        JSR     R5,     X_FILL_MEM              ; 54C2   0004 0114 0341
        JSR     R5,     L_579F                  ; 54C5   0004 0154 039F
        JSR     R5,     L_5870                  ; 54C8   0004 0158 0070

        B       L_54EF                          ; 54CB   0200 0022

        DECLE   $00B2,  $0056,  $0095,  $0055   ; 54CD   00B2 0056 0095 0055
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54D1   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 54D5   0000 0000

        JSR     R5,     L_580F                  ; 54D7   0004 0158 000F

        MVII    #$0002, R0                      ; 54DA   02B8 0002
        MVO     R0,     G_0174                  ; 54DC   0240 0174
        PULR    R7                              ; 54DE   02B7

L_54DF:
        PSHR    R5                              ; 54DF   0275
        MVI     G_0174, R0                      ; 54E0   0280 0174
        CMPI    #$0002, R0                      ; 54E2   0378 0002
        BNEQ    L_54E9                          ; 54E4   020C 0003

        JSR     R5,     L_5829                  ; 54E6   0004 0158 0029

L_54E9:
        MVII    #$0001, R0                      ; 54E9   02B8 0001
        MVO     R0,     G_0174                  ; 54EB   0240 0174
        PULR    R7                              ; 54ED   02B7

L_54EE:
        PSHR    R5                              ; 54EE   0275
L_54EF:
        MVI     G_015D, R0                      ; 54EF   0280 015D
        MVII    #$0003, R1                      ; 54F1   02B9 0003
        SDBD                                    ; 54F3   0001
        MVII    #$0600, R3                      ; 54F4   02BB 0000 0006
        MVII    #$0200, R4                      ; 54F7   02BC 0200

        JSR     R5,     X_PRNUM_RGT             ; 54F9   0004 0118 00C5

        MVI     G_015E, R0                      ; 54FC   0280 015E
        SDBD                                    ; 54FE   0001
        MVII    #$2200, R3                      ; 54FF   02BB 0000 0022
        MVII    #$0211, R4                      ; 5502   02BC 0211
        J       .EXEC.89F                       ; 5504   0004 0318 009F

L_5507:
        PSHR    R5                              ; 5507   0275
        MVII    #$0229, R2                      ; 5508   02BA 0229
        MVII    #$0007, R1                      ; 550A   02B9 0007

L_550C:
        JSR     R5,     L_551A                  ; 550C   0004 0154 011A

        ADDI    #$0011, R2                      ; 550F   02FA 0011

        JSR     R5,     L_551A                  ; 5511   0004 0154 011A

        ADDI    #$0003, R2                      ; 5514   02FA 0003
        DECR    R1                              ; 5516   0011
        BNEQ    L_550C                          ; 5517   022C 000C
        PULR    R7                              ; 5519   02B7

L_551A:
        PSHR    R5                              ; 551A   0275
        MVI@    R2,     R0                      ; 551B   0290
        ANDI    #$01F8, R0                      ; 551C   03B8 01F8
        BNEQ    L_5531                          ; 551E   020C 0011

        JSR     R5,     L_5532                  ; 5520   0004 0154 0132

        ADDI    #$000C, R0                      ; 5523   02F8 000C
        SLL     R0,     2                       ; 5525   004C
        SLL     R0,     1                       ; 5526   0048
        XOR@    R2,     R0                      ; 5527   03D0
        SDBD                                    ; 5528   0001
        ANDI    #$F7FF, R0                      ; 5529   03B8 00FF 00F7
        SDBD                                    ; 552C   0001
        XORI    #$0800, R0                      ; 552D   03F8 0000 0008
        MVO@    R0,     R2                      ; 5530   0250
L_5531:
        PULR    R7                              ; 5531   02B7

L_5532:
        PSHR    R5                              ; 5532   0275
        MVII    #$003E, R0                      ; 5533   02B8 003E

        JSR     R5,     X_RAND2                 ; 5535   0004 0114 029E

        SDBD                                    ; 5538   0001
        MVII    #$5708, R4                      ; 5539   02BC 0008 0057
L_553C:
        CMP@    R4,     R0                      ; 553C   0360
        BPL     L_553C                          ; 553D   0223 0002

        SDBD                                    ; 553F   0001
        SUBI    #$5709, R4                      ; 5540   033C 0009 0057
        MOVR    R4,     R0                      ; 5543   00A0
        PULR    R7                              ; 5544   02B7

L_5545:
        MVII    #$0229, R1                      ; 5545   02B9 0229
        MVI     G_015F, R3                      ; 5547   0283 015F
        TSTR    R3                              ; 5549   009B
        BEQ     L_554E                          ; 554A   0204 0002

        ADDI    #$0011, R1                      ; 554C   02F9 0011
L_554E:
        DECR    R0                              ; 554E   0010
        BEQ     L_5555                          ; 554F   0204 0004

        ADDI    #$0014, R1                      ; 5551   02F9 0014
        B       L_554E                          ; 5553   0220 0006
L_5555:
        MOVR    R5,     R7                      ; 5555   00AF

L_5556:
        MVI     G_0170, R1                      ; 5556   0281 0170
        PSHR    R1                              ; 5558   0271
        ADDI    #$0200, R1                      ; 5559   02F9 0200
        MVI@    R1,     R0                      ; 555B   0288
        SWAP    R0,     1                       ; 555C   0040
        CMPI    #$0018, R0                      ; 555D   0378 0018
        BEQ     L_5574                          ; 555F   0204 0013

        MVI     G_0160, R1                      ; 5561   0281 0160
        CLRR    R0                              ; 5563   01C0
        DECR    R1                              ; 5564   0011
        BEQ     L_5569                          ; 5565   0204 0002

        MVII    #$000C, R0                      ; 5567   02B8 000C
L_5569:
        MVI     G_015F, R1                      ; 5569   0281 015F

        JSR     R5,     L_56C8                  ; 556B   0004 0154 02C8

        PULR    R0                              ; 556E   02B0
        CMP     G_0170, R0                      ; 556F   0340 0170
        BNEQ    L_5556                          ; 5571   022C 001C
        PULR    R7                              ; 5573   02B7

L_5574:
        PULR    R0                              ; 5574   02B0
        PULR    R7                              ; 5575   02B7

L_5576:
        JSR     R5,     L_54DF                  ; 5576   0004 0154 00DF
        JSR     R5,     L_5647                  ; 5579   0004 0154 0247

        MVII    #$0001, R0                      ; 557C   02B8 0001

        JSR     R5,     L_5545                  ; 557E   0004 0154 0145

        MVII    #$0007, R2                      ; 5581   02BA 0007
        MVII    #$0006, R0                      ; 5583   02B8 0006
        MVI     G_015F, R3                      ; 5585   0283 015F
        TSTR    R3                              ; 5587   009B
        BEQ     L_558C                          ; 5588   0204 0002

        MVII    #$0022, R0                      ; 558A   02B8 0022
L_558C:
        SWAP    R0,     1                       ; 558C   0040
L_558D:
        MVO@    R0,     R1                      ; 558D   0248
        ADDI    #$0014, R1                      ; 558E   02F9 0014
        DECR    R2                              ; 5590   0012
        BNEQ    L_558D                          ; 5591   022C 0005
        B       L_5695                          ; 5593   0200 0100

        PSHR    R5                              ; 5595   0275
        PSHR    R1                              ; 5596   0271
        PSHR    R0                              ; 5597   0270

        JSR     R5,     L_54DF                  ; 5598   0004 0154 00DF

        PULR    R0                              ; 559B   02B0
        PULR    R2                              ; 559C   02B2
        MVI     G_0175, R1                      ; 559D   0281 0175
        INCR    R1                              ; 559F   0009
        ADDR    R7,     R1                      ; 55A0   00F9
        ADD@    R1,     R7                      ; 55A1   02CF

        DECLE   $0036,  $0004                   ; 55A2   0036 0004

        NEGR    R3                              ; 55A4   0023
        ADDR    R2,     R0                      ; 55A5   00D0
        CMP     G_015F, R2                      ; 55A6   0342 015F
        BNEQ    L_55D8                          ; 55A8   020C 002E

        CMPI    #$000B, R0                      ; 55AA   0378 000B
        BEQ     L_5669                          ; 55AC   0204 00BB

        CMPI    #$0003, R0                      ; 55AE   0378 0003
        BEQ     L_5576                          ; 55B0   0224 003B

        CMPI    #$0001, R0                      ; 55B2   0378 0001
        BEQ     L_55BA                          ; 55B4   0204 0004

        CMPI    #$0002, R0                      ; 55B6   0378 0002
        BNEQ    L_55D8                          ; 55B8   020C 001E

L_55BA:
        MVO     R0,     G_0160                  ; 55BA   0240 0160
        MVII    #$0002, R0                      ; 55BC   02B8 0002
        MVO     R0,     G_0175                  ; 55BE   0240 0175

        JSR     R5,     L_5870                  ; 55C0   0004 0158 0070

        B       L_5556                          ; 55C3   0220 006E

        CMP     G_015F, R2                      ; 55C5   0342 015F
        BNEQ    L_55D8                          ; 55C7   020C 000F

        TSTR    R0                              ; 55C9   0080
        BEQ     L_55D8                          ; 55CA   0204 000C

        CMPI    #$0008, R0                      ; 55CC   0378 0008
        BMI     L_5617                          ; 55CE   020B 0047

        CMPI    #$000A, R0                      ; 55D0   0378 000A
        BEQ     L_55E2                          ; 55D2   0204 000E

        CMPI    #$000B, R0                      ; 55D4   0378 000B
        BEQ     L_565A                          ; 55D6   0204 0082
L_55D8:
        PULR    R7                              ; 55D8   02B7

L_55D9:
        MVII    #$0002, R0                      ; 55D9   02B8 0002
        MVO     R0,     G_0175                  ; 55DB   0240 0175

        JSR     R5,     L_5870                  ; 55DD   0004 0158 0070

        INCR    R7                              ; 55E0   000F

L_55E1:
        PSHR    R5                              ; 55E1   0275
L_55E2:
        MVII    #$0002, R0                      ; 55E2   02B8 0002
        MVO     R0,     G_0175                  ; 55E4   0240 0175
        MVI     G_0161, R1                      ; 55E6   0281 0161
        MOVR    R1,     R0                      ; 55E8   0088
        DECR    R0                              ; 55E9   0010
        BMI     L_5652                          ; 55EA   020B 0066

        MVO     R0,     G_0161                  ; 55EC   0240 0161
        SLL     R1,     1                       ; 55EE   0049
        ADDI    #$0160, R1                      ; 55EF   02F9 0160
        MVI@    R1,     R0                      ; 55F1   0288
        PSHR    R0                              ; 55F2   0270
        INCR    R1                              ; 55F3   0009
        MVI@    R1,     R2                      ; 55F4   028A
L_55F5:
        CMP     G_0170, R2                      ; 55F5   0342 0170
        BEQ     L_560A                          ; 55F7   0204 0011

        PSHR    R2                              ; 55F9   0272
        MVII    #$0004, R0                      ; 55FA   02B8 0004
        MVI     G_0160, R1                      ; 55FC   0281 0160
        CMPI    #$0001, R1                      ; 55FE   0379 0001
        BNEQ    L_5604                          ; 5600   020C 0002

        MVII    #$0008, R0                      ; 5602   02B8 0008

L_5604:
        JSR     R5,     L_56C8                  ; 5604   0004 0154 02C8

        PULR    R2                              ; 5607   02B2
        B       L_55F5                          ; 5608   0220 0014

L_560A:
        PULR    R0                              ; 560A   02B0

        JSR     R5,     L_5545                  ; 560B   0004 0154 0145

        ADDI    #$0200, R2                      ; 560E   02FA 0200
        MVI@    R2,     R0                      ; 5610   0290
        MVO@    R0,     R1                      ; 5611   0248
        MVII    #$0018, R0                      ; 5612   02B8 0018
        SWAP    R0,     1                       ; 5614   0040
        MVO@    R0,     R2                      ; 5615   0250
        PULR    R7                              ; 5616   02B7

L_5617:
        MVI     G_0170, R1                      ; 5617   0281 0170
        MVI     G_0161, R2                      ; 5619   0282 0161
        INCR    R2                              ; 561B   000A
        CMPI    #$0008, R2                      ; 561C   037A 0008
        BGE     L_5659                          ; 561E   020D 0039

        SLL     R2,     1                       ; 5620   004A
        ADDI    #$0160, R2                      ; 5621   02FA 0160
        MOVR    R2,     R4                      ; 5623   0094
        MVO@    R0,     R4                      ; 5624   0260
        MVO@    R1,     R4                      ; 5625   0261

        JSR     R5,     L_5545                  ; 5626   0004 0154 0145

        MVI     G_0170, R2                      ; 5629   0282 0170
        ADDI    #$0200, R2                      ; 562B   02FA 0200
        MVI@    R2,     R0                      ; 562D   0290
        SDBD                                    ; 562E   0001
        CMPI    #$1800, R0                      ; 562F   0378 0000 0018
        BNEQ    L_5659                          ; 5632   020C 0025

        MVI@    R1,     R0                      ; 5634   0288
        ANDI    #$01F8, R0                      ; 5635   03B8 01F8
        BEQ     L_5659                          ; 5637   0204 0020

        MVI@    R1,     R0                      ; 5639   0288
        MVO@    R0,     R2                      ; 563A   0250
        SDBD                                    ; 563B   0001
        ANDI    #$7607, R0                      ; 563C   03B8 0007 0076
        MVO@    R0,     R1                      ; 563F   0248
        MVI     G_0161, R0                      ; 5640   0280 0161
        INCR    R0                              ; 5642   0008
        MVO     R0,     G_0161                  ; 5643   0240 0161
        B       L_5556                          ; 5645   0220 00F0

L_5647:
        PSHR    R5                              ; 5647   0275
L_5648:
        MVI     G_0161, R0                      ; 5648   0280 0161
        TSTR    R0                              ; 564A   0080
        BEQ     L_5652                          ; 564B   0204 0005

        JSR     R5,     L_55E1                  ; 564D   0004 0154 01E1

        B       L_5648                          ; 5650   0220 0009

L_5652:
        MVII    #$0001, R0                      ; 5652   02B8 0001
        MVO     R0,     G_0175                  ; 5654   0240 0175

        JSR     R5,     L_5870                  ; 5656   0004 0158 0070

L_5659:
        PULR    R7                              ; 5659   02B7

L_565A:
        MVI     G_0161, R0                      ; 565A   0280 0161
        TSTR    R0                              ; 565C   0080
        BEQ     L_5669                          ; 565D   0204 000A

        JSR     R5,     L_57E0                  ; 565F   0004 0154 03E0

        BC      L_5669                          ; 5662   0201 0005

        JSR     R5,     X_PLAY_RAZZ2            ; 5664   0004 011C 02BD

        B       L_5648                          ; 5667   0220 0020

L_5669:
        MVII    #$0003, R0                      ; 5669   02B8 0003
        MVO     R0,     G_0175                  ; 566B   0240 0175

        JSR     R5,     L_5891                  ; 566D   0004 0158 0091

        B       L_5690                          ; 5670   0200 001E

        CMP     G_015F, R2                      ; 5672   0342 015F
        BNEQ    L_567F                          ; 5674   020C 0009

        TSTR    R0                              ; 5676   0080
        BEQ     L_55D8                          ; 5677   0224 00A0

        CMPI    #$000A, R0                      ; 5679   0378 000A
        BEQ     L_55D9                          ; 567B   0224 00A3
        B       L_5690                          ; 567D   0200 0011

L_567F:
        CMPI    #$000B, R0                      ; 567F   0378 000B
        BNEQ    L_5690                          ; 5681   020C 000D

        MVI     G_0161, R0                      ; 5683   0280 0161
        TSTR    R0                              ; 5685   0080
        BEQ     L_568E                          ; 5686   0204 0006

        JSR     R5,     L_5722                  ; 5688   0004 0154 0322
        JSR     R5,     L_57CA                  ; 568B   0004 0154 03CA

L_568E:
        B       L_5695                          ; 568E   0200 0005

L_5690:
        MVII    #$0003, R0                      ; 5690   02B8 0003
        MVO     R0,     G_0174                  ; 5692   0240 0174
        PULR    R7                              ; 5694   02B7

L_5695:
        JSR     R5,     L_54EE                  ; 5695   0004 0154 00EE
        JSR     R5,     L_5507                  ; 5698   0004 0154 0107

        CLRR    R0                              ; 569B   01C0
        MVO     R0,     G_0161                  ; 569C   0240 0161
        MVII    #$0001, R0                      ; 569E   02B8 0001
        MVO     R0,     G_0175                  ; 56A0   0240 0175
        MVI     G_015F, R0                      ; 56A2   0280 015F
        XORI    #$0001, R0                      ; 56A4   03F8 0001
        MVO     R0,     G_015F                  ; 56A6   0240 015F

        JSR     R5,     L_5870                  ; 56A8   0004 0158 0070

        MVI     G_0176, R0                      ; 56AB   0280 0176
        INCR    R0                              ; 56AD   0008
        MVO     R0,     G_0176                  ; 56AE   0240 0176
        B       L_57A0                          ; 56B0   0200 00EE

        PSHR    R5                              ; 56B2   0275
        MVI     G_0175, R5                      ; 56B3   0285 0175
        CMPI    #$0001, R5                      ; 56B5   037D 0001
        BNEQ    L_56EB                          ; 56B7   020C 0032

        CMP     G_015F, R1                      ; 56B9   0341 015F
        BNEQ    L_56EB                          ; 56BB   020C 002E

        TSTR    R0                              ; 56BD   0080
        BMI     L_56EB                          ; 56BE   020B 002B

        SLR     R0,     1                       ; 56C0   0060
        SLL     R0,     1                       ; 56C1   0048
        PSHR    R0                              ; 56C2   0270

        JSR     R5,     L_54DF                  ; 56C3   0004 0154 00DF

        PULR    R0                              ; 56C6   02B0
        INCR    R7                              ; 56C7   000F

L_56C8:
        PSHR    R5                              ; 56C8   0275
L_56C9:
        MOVR    R0,     R1                      ; 56C9   0081
        SLR     R1,     1                       ; 56CA   0061
        ADDR    R0,     R1                      ; 56CB   00C1
        MOVR    R1,     R4                      ; 56CC   008C
        SDBD                                    ; 56CD   0001
        ADDI    #$56EC, R4                      ; 56CE   02FC 00EC 0056
        MVI@    R4,     R0                      ; 56D1   02A0
        MVI@    R4,     R1                      ; 56D2   02A1
        MVI@    R4,     R2                      ; 56D3   02A2
        SUBI    #$0015, R0                      ; 56D4   0338 0015
        DECR    R1                              ; 56D6   0011
        DECR    R2                              ; 56D7   0012
        ADD     G_0170, R0                      ; 56D8   02C0 0170
        ADD     G_0172, R1                      ; 56DA   02C1 0172
        ADD     G_0173, R2                      ; 56DC   02C2 0173
        SDBD                                    ; 56DE   0001
        MVII    #$5704, R4                      ; 56DF   02BC 0004 0057

        JSR     R5,     L_5839                  ; 56E2   0004 0158 0039

        MVO     R0,     G_0170                  ; 56E5   0240 0170
        MVO     R1,     G_0172                  ; 56E7   0241 0172
        MVO     R2,     G_0173                  ; 56E9   0242 0173
L_56EB:
        PULR    R7                              ; 56EB   02B7

        DECLE   $0016,  $0001,  $0002,  $0002   ; 56EC   0016 0001 0002 0002
        DECLE   $0000,  $0002,  $0001,  $0000   ; 56F0   0000 0002 0001 0000
        DECLE   $0001,  $0000,  $0000,  $0000   ; 56F4   0001 0000 0000 0000
        DECLE   $0014,  $0001,  $0000,  $0028   ; 56F8   0014 0001 0000 0028
        DECLE   $0002,  $0000,  $0029,  $0002   ; 56FC   0002 0000 0029 0002
        DECLE   $0001,  $002A,  $0002,  $0002   ; 5700   0001 002A 0002 0002
        DECLE   $0000,  $000C,  $0001,  $0012   ; 5704   0000 000C 0001 0012
        DECLE   $0009,  $000B,  $000D,  $0011   ; 5708   0009 000B 000D 0011
        DECLE   $001D,  $001F,  $0022,  $0024   ; 570C   001D 001F 0022 0024
        DECLE   $002D,  $002E,  $002F,  $0033   ; 5710   002D 002E 002F 0033
        DECLE   $0035                           ; 5714   0035

        RSWD    R3                              ; 5715   003B
        SWAP    R3,     1                       ; 5716   0043
        SWAP    R1,     2                       ; 5717   0045
        SWAP    R2,     2                       ; 5718   0046
        SLL     R0,     2                       ; 5719   004C
        RLC     R0,     1                       ; 571A   0050
        RLC     R2,     2                       ; 571B   0056
        SLLC    R2,     1                       ; 571C   005A
        SLLC    R0,     2                       ; 571D   005C
        SLLC    R2,     2                       ; 571E   005E
        SLLC    R3,     2                       ; 571F   005F
        SLR     R1,     1                       ; 5720   0061
        SLR     R2,     1                       ; 5721   0062
L_5722:
        PSHR    R5                              ; 5722   0275
        MVI     G_0161, R0                      ; 5723   0280 0161
        DECR    R0                              ; 5725   0010
        BGT     L_5735                          ; 5726   020E 000D

        MVI     G_015D, R1                      ; 5728   0281 015D
        ADD     G_015E, R1                      ; 572A   02C1 015E
        BNEQ    L_5735                          ; 572C   020C 0007

        MVII    #$015D, R1                      ; 572E   02B9 015D
        ADD     G_015F, R1                      ; 5730   02C1 015F
        INCR    R0                              ; 5732   0008
        MVO@    R0,     R1                      ; 5733   0248
        PULR    R7                              ; 5734   02B7

L_5735:
        MVI     G_0163, R2                      ; 5735   0282 0163
        ADDI    #$0200, R2                      ; 5737   02FA 0200
        MVI     G_0160, R1                      ; 5739   0281 0160

        JSR     R5,     L_5755                  ; 573B   0004 0154 0355

        MVII    #$0163, R4                      ; 573E   02BC 0163
        MVI     G_0161, R3                      ; 5740   0283 0161
L_5742:
        MVI@    R4,     R2                      ; 5742   02A2
        MVI     G_0160, R1                      ; 5743   0281 0160
        XORI    #$0003, R1                      ; 5745   03F9 0003
        ADDI    #$0200, R2                      ; 5747   02FA 0200
        PSHR    R4                              ; 5749   0274
        PSHR    R3                              ; 574A   0273

        JSR     R5,     L_5755                  ; 574B   0004 0154 0355

        PULR    R3                              ; 574E   02B3
        PULR    R4                              ; 574F   02B4
        INCR    R4                              ; 5750   000C
        DECR    R3                              ; 5751   0013
        BNEQ    L_5742                          ; 5752   022C 0011
        PULR    R7                              ; 5754   02B7

L_5755:
        PSHR    R5                              ; 5755   0275
        MVII    #$0001, R3                      ; 5756   02BB 0001
        MOVR    R3,     R4                      ; 5758   009C
        DECR    R1                              ; 5759   0011
        BEQ     L_575E                          ; 575A   0204 0002

        MVII    #$0014, R3                      ; 575C   02BB 0014
L_575E:
        PSHR    R2                              ; 575E   0272

        JSR     R5,     L_5772                  ; 575F   0004 0154 0372

        PULR    R2                              ; 5762   02B2
        NEGR    R3                              ; 5763   0023

        JSR     R5,     L_5772                  ; 5764   0004 0154 0372

        CMPI    #$0001, R4                      ; 5767   037C 0001
        BEQ     L_5771                          ; 5769   0204 0006

        MVII    #$015D, R1                      ; 576B   02B9 015D
        ADD     G_015F, R1                      ; 576D   02C1 015F
        ADD@    R1,     R4                      ; 576F   02CC
        MVO@    R4,     R1                      ; 5770   024C
L_5771:
        PULR    R7                              ; 5771   02B7

L_5772:
        PSHR    R5                              ; 5772   0275
L_5773:
        ADDR    R3,     R2                      ; 5773   00DA
        CMPI    #$02F0, R2                      ; 5774   037A 02F0
        BGE     L_579E                          ; 5776   020D 0026

        CMPI    #$0214, R2                      ; 5778   037A 0214
        BLT     L_579E                          ; 577A   0205 0022

        MOVR    R2,     R1                      ; 577C   0091
        PSHR    R2                              ; 577D   0272
        SUBI    #$0200, R1                      ; 577E   0339 0200
        MVII    #$0014, R2                      ; 5780   02BA 0014

        JSR     R5,     X_DIV                   ; 5782   0004 011C 01FB

        PULR    R2                              ; 5785   02B2
        CMPI    #$0002, R1                      ; 5786   0379 0002
        BLT     L_579E                          ; 5788   0205 0014

        CMPI    #$0012, R1                      ; 578A   0379 0012
        BGE     L_579E                          ; 578C   020D 0010

        MVI@    R2,     R0                      ; 578E   0290
        SLR     R0,     2                       ; 578F   0064
        SLR     R0,     1                       ; 5790   0060
        ANDI    #$003F, R0                      ; 5791   03B8 003F
        SUBI    #$000C, R0                      ; 5793   0338 000C
        BMI     L_579E                          ; 5795   020B 0007

        CMPI    #$001A, R0                      ; 5797   0378 001A
        BGE     L_579E                          ; 5799   020D 0003

        INCR    R4                              ; 579B   000C
        B       L_5773                          ; 579C   0220 002A
L_579E:
        PULR    R7                              ; 579E   02B7

L_579F:
        PSHR    R5                              ; 579F   0275
L_57A0:
        MVI     G_0176, R0                      ; 57A0   0280 0176
        SLR     R0,     1                       ; 57A2   0060
        CMPI    #$0015, R0                      ; 57A3   0378 0015
        BEQ     L_57B2                          ; 57A5   0204 000B

        MVII    #$02DC, R4                      ; 57A7   02BC 02DC
        SDBD                                    ; 57A9   0001
        MVII    #$0601, R3                      ; 57AA   02BB 0001 0006
        MVII    #$0002, R1                      ; 57AD   02B9 0002
        J       .EXEC.8C6                       ; 57AF   0004 0318 00C6

L_57B2:
        MVII    #$0007, R3                      ; 57B2   02BB 0007
        MVII    #$0205, R4                      ; 57B4   02BC 0205

        JSR     R5,     X_PRINT_R5              ; 57B6   0004 0118 007B
        STRING  "GAME  OVER"                    ; 57B9  
        DECLE   $0000                           ; 57C3   0000

        JSR     R5,     L_53E9                  ; 57C4   0004 0150 03E9

        J       L_5402                          ; 57C7   0004 0354 0002

L_57CA:
        MVII    #$0163, R4                      ; 57CA   02BC 0163
        MVI     G_0161, R3                      ; 57CC   0283 0161
L_57CE:
        MVI@    R4,     R1                      ; 57CE   02A1
        ADDI    #$0200, R1                      ; 57CF   02F9 0200
        MVI@    R1,     R0                      ; 57D1   0288
        SDBD                                    ; 57D2   0001
        ANDI    #$C9FF, R0                      ; 57D3   03B8 00FF 00C9
        SDBD                                    ; 57D6   0001
        XORI    #$2400, R0                      ; 57D7   03F8 0000 0024
        MVO@    R0,     R1                      ; 57DA   0248
        INCR    R4                              ; 57DB   000C
        DECR    R3                              ; 57DC   0013
        BNEQ    L_57CE                          ; 57DD   022C 0010
        MOVR    R5,     R7                      ; 57DF   00AF

L_57E0:
        PSHR    R5                              ; 57E0   0275
        MVI     G_015D, R0                      ; 57E1   0280 015D
        ADD     G_015E, R0                      ; 57E3   02C0 015E
        BEQ     L_57FD                          ; 57E5   0204 0016

        MVII    #$015D, R1                      ; 57E7   02B9 015D
        ADD     G_015F, R1                      ; 57E9   02C1 015F
        MVI@    R1,     R0                      ; 57EB   0288
        PSHR    R0                              ; 57EC   0270
        CLRR    R0                              ; 57ED   01C0
        MVO@    R0,     R1                      ; 57EE   0248
        PSHR    R1                              ; 57EF   0271

        JSR     R5,     L_5722                  ; 57F0   0004 0154 0322

        PULR    R1                              ; 57F3   02B1
        MVI@    R1,     R0                      ; 57F4   0288
        PULR    R2                              ; 57F5   02B2
        MVO@    R2,     R1                      ; 57F6   024A
        CMP     G_0161, R0                      ; 57F7   0340 0161
        BGT     L_57FD                          ; 57F9   020E 0002

        CLRC                                    ; 57FB   0006
        PULR    R7                              ; 57FC   02B7

L_57FD:
        SETC                                    ; 57FD   0007
        PULR    R7                              ; 57FE   02B7

        DECLE   $00FF,  $0080,  $0080,  $0080   ; 57FF   00FF 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5803   0080 0080 0080 0080
        DECLE   $0000,  $007E,  $007E,  $007E   ; 5807   0000 007E 007E 007E
        DECLE   $007E,  $007E,  $007E,  $0000   ; 580B   007E 007E 007E 0000
L_580F:
        PSHR    R5                              ; 580F   0275
        MVI     G_0170, R1                      ; 5810   0281 0170
        ADDI    #$0200, R1                      ; 5812   02F9 0200
        MVI@    R1,     R0                      ; 5814   0288
        SWAP    R0,     1                       ; 5815   0040
        ANDI    #$0036, R0                      ; 5816   03B8 0036
        MVO     R0,     G_0171                  ; 5818   0240 0171
        MVI@    R1,     R0                      ; 581A   0288
        SDBD                                    ; 581B   0001
        ANDI    #$09FF, R0                      ; 581C   03B8 00FF 0009
        SDBD                                    ; 581F   0001
        XORI    #$2600, R0                      ; 5820   03F8 0000 0026
        MVO@    R0,     R1                      ; 5823   0248
        MVII    #$0002, R0                      ; 5824   02B8 0002
        MVO     R0,     G_0174                  ; 5826   0240 0174
        PULR    R7                              ; 5828   02B7

L_5829:
        PSHR    R5                              ; 5829   0275
        MVI     G_0170, R1                      ; 582A   0281 0170
        ADDI    #$0200, R1                      ; 582C   02F9 0200
        MVI     G_0171, R0                      ; 582E   0280 0171
        SWAP    R0,     1                       ; 5830   0040
        MVI@    R1,     R5                      ; 5831   028D
        SDBD                                    ; 5832   0001
        ANDI    #$09FF, R5                      ; 5833   03BD 00FF 0009
        XORR    R0,     R5                      ; 5836   01C5
        MVO@    R5,     R1                      ; 5837   024D
        PULR    R7                              ; 5838   02B7

L_5839:
        PSHR    R5                              ; 5839   0275
        CMP@    R4,     R1                      ; 583A   0361
        BEQ     L_5846                          ; 583B   0204 0009

        CMP@    R4,     R1                      ; 583D   0361
        BEQ     L_5846                          ; 583E   0204 0006

        CMP@    R4,     R2                      ; 5840   0362
        BEQ     L_5846                          ; 5841   0204 0003

        CMP@    R4,     R2                      ; 5843   0362
        BNEQ    L_5847                          ; 5844   020C 0001

L_5846:
        PULR    R0                              ; 5846   02B0
L_5847:
        PULR    R7                              ; 5847   02B7

        DECLE   $0003,  $0008,  $0005,  $0008   ; 5848   0003 0008 0005 0008
        DECLE   $0060,  $0058,  $0214,  $0058   ; 584C   0060 0058 0214 0058
        DECLE   $0058,  $0206,  $0061,  $0058   ; 5850   0058 0206 0061 0058
        DECLE   $0206,  $006A,  $0058,  $0207   ; 5854   0206 006A 0058 0207
        DECLE   $0023,  $0046,  $0048,  $0024   ; 5858   0023 0046 0048 0024
        DECLE   $0047,  $0048,  $0025,  $003B   ; 585C   0047 0048 0025 003B
        DECLE   $0000,  $0023,  $004A,  $0029   ; 5860   0000 0023 004A 0029
        DECLE   $0048,  $0048,  $002E,  $0048   ; 5864   0048 0048 002E 0048
        DECLE   $0030,  $0000,  $003A,  $0036   ; 5868   0030 0000 003A 0036
        DECLE   $0049,  $0048,  $0030,  $0000   ; 586C   0049 0048 0030 0000
L_5870:
        PSHR    R5                              ; 5870   0275
        MVII    #$0204, R4                      ; 5871   02BC 0204
        MVII    #$000C, R0                      ; 5873   02B8 000C

        JSR     R5,     X_FILL_ZERO             ; 5875   0004 0114 0338
        DECLE   $0284,  $015F,  $00E4,  $0001   ; 5878   0284 015F 00E4 0001

        ADDI    #$0048, R4                      ; 587C   02FC 0048
        SLLC    R0,     1                       ; 587E   0058
        SDBD                                    ; 587F   0001
        MVI@    R4,     R3                      ; 5880   02A3
        MVI     G_0175, R4                      ; 5881   0284 0175
        ADDR    R4,     R4                      ; 5883   00E4
        ADD     G_0175, R4                      ; 5884   02C4 0175
        SDBD                                    ; 5886   0001
        ADDI    #$584C, R4                      ; 5887   02FC 004C 0058
        SDBD                                    ; 588A   0001
        MVI@    R4,     R1                      ; 588B   02A1
        MVI@    R4,     R4                      ; 588C   02A4

        JSR     R5,     X_PRINT_R1              ; 588D   0004 0118 0067

        PULR    R7                              ; 5890   02B7

L_5891:
        PSHR    R5                              ; 5891   0275
        MVI     G_015F, R0                      ; 5892   0280 015F
        PSHR    R0                              ; 5894   0270
        XORI    #$0001, R0                      ; 5895   03F8 0001
        MVO     R0,     G_015F                  ; 5897   0240 015F

        JSR     R5,     L_5870                  ; 5899   0004 0158 0070

        PULR    R0                              ; 589C   02B0
        MVO     R0,     G_015F                  ; 589D   0240 015F
        PULR    R7                              ; 589F   02B7

        INCR    R0                              ; 58A0   0008
        GSWD    R2                              ; 58A1   0032
        RLC     R3,     2                       ; 58A2   0057
        SLLC    R1,     1                       ; 58A3   0059
        ADDR    R1,     R5                      ; 58A4   00CD
        SLLC    R0,     1                       ; 58A5   0058
        MOVR    R0,     R7                      ; 58A6   0087

        DECLE   $0059,  $0084,  $0059,  $00BC   ; 58A7   0059 0084 0059 00BC
        DECLE   $0058,  $00C0,  $0000,  $0000   ; 58AB   0058 00C0 0000 0000
        DECLE   $03DF,  $0001,  $0004,  $0002   ; 58AF   03DF 0001 0004 0002
        DECLE   $0004,  $01F0,  $01E0,  $01D0   ; 58B3   0004 01F0 01E0 01D0
        DECLE   $01C0,  $01B0,  $01A0,  $0190   ; 58B7   01C0 01B0 01A0 0190
        DECLE   $0180,  $0057,  $0057,  $006F   ; 58BB   0180 0057 0057 006F
        DECLE   $0072,  $0064,  $0020,  $0052   ; 58BF   0072 0064 0020 0052
        DECLE   $006F,  $0063,  $006B,  $0065   ; 58C3   006F 0063 006B 0065
        DECLE   $0074,  $0073,  $0000           ; 58C7   0074 0073 0000

        J       L_529C                          ; 58CA   0004 0350 029C

        PSHR    R5                              ; 58CD   0275
        MVII    #$00F0, R0                      ; 58CE   02B8 00F0
        MVII    #$0200, R4                      ; 58D0   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 58D2   0004 0114 0338
        JSR     R5,     L_64B1                  ; 58D5   0004 0164 00B1
        JSR     R5,     L_59E6                  ; 58D8   0004 0158 01E6

        SDBD                                    ; 58DB   0001
        MVII    #$2000, R0                      ; 58DC   02B8 0000 0020
        MVO     R0,     .BTAB.14                ; 58DF   0240 0214
        MVO     R0,     .BTAB.DC                ; 58E1   0240 02DC
        SDBD                                    ; 58E3   0001
        MVII    #$596D, R1                      ; 58E4   02B9 006D 0059
        MVII    #$0335, R2                      ; 58E7   02BA 0335

        JSR     R5,     X_INIT_MOB              ; 58E9   0004 0114 02B2

        MVII    #$0345, R2                      ; 58EC   02BA 0345

        JSR     R5,     X_INIT_MOB              ; 58EE   0004 0114 02B2

        MVII    #$0088, R0                      ; 58F1   02B8 0088
        SWAP    R0,     1                       ; 58F3   0040
        MVO     R0,     G_0347                  ; 58F4   0240 0347
        SDBD                                    ; 58F6   0001
        MVII    #$1042, R0                      ; 58F7   02B8 0042 0010
        MVO     R0,     G_0335                  ; 58FA   0240 0335
        SDBD                                    ; 58FC   0001
        MVII    #$1046, R0                      ; 58FD   02B8 0046 0010
        MVO     R0,     G_0345                  ; 5900   0240 0345
        MVII    #$0005, R0                      ; 5902   02B8 0005
        MVO     R0,     G_018F                  ; 5904   0240 018F
        MVII    #$0059, R0                      ; 5906   02B8 0059
        MVO     R0,     G_018E                  ; 5908   0240 018E
        MVII    #$02DE, R1                      ; 590A   02B9 02DE
L_590C:
        SDBD                                    ; 590C   0001
        MVII    #$0617, R0                      ; 590D   02B8 0017 0006
        MVO@    R0,     R1                      ; 5910   0248
        ADDI    #$0002, R1                      ; 5911   02F9 0002
        CMPI    #$02EC, R1                      ; 5913   0379 02EC
        BGT     L_591E                          ; 5915   020E 0007

        JSR     R5,     L_59B2                  ; 5917   0004 0158 01B2

        ADDI    #$0002, R1                      ; 591A   02F9 0002
        B       L_590C                          ; 591C   0220 0011

L_591E:
        SDBD                                    ; 591E   0001
        MVII    #$5A75, R0                      ; 591F   02B8 0075 005A
        MVO     R0,     G_035D                  ; 5922   0240 035D
        SDBD                                    ; 5924   0001
        MVII    #$5ADD, R1                      ; 5925   02B9 00DD 005A
        MVII    #$033D, R2                      ; 5928   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 592A   0004 0114 02B2

        MVII    #$034D, R2                      ; 592D   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 592F   0004 0114 02B2

        MVII    #$031D, R2                      ; 5932   02BA 031D

L_5934:
        JSR     R5,     X_INIT_MOB              ; 5934   0004 0114 02B2

        ADDI    #$0008, R2                      ; 5937   02FA 0008
        CMPI    #$032D, R2                      ; 5939   037A 032D
        BLE     L_5934                          ; 593B   0226 0008

        MVII    #$0001, R0                      ; 593D   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 593F   0004 0114 02CF

        INCR    R0                              ; 5942   0008

        JSR     R5,     .EXEC.6CF               ; 5943   0004 0114 02CF

        MVII    #$0008, R0                      ; 5946   02B8 0008
        SWAP    R0,     1                       ; 5948   0040
        MVO     R0,     G_0329                  ; 5949   0240 0329
        MVO     R0,     G_0331                  ; 594B   0240 0331
        MVII    #$0080, R0                      ; 594D   02B8 0080
        MVO     R0,     G_034D                  ; 594F   0240 034D
        MVO     R0,     G_033D                  ; 5951   0240 033D

        JSR     R5,     L_5B5E                  ; 5953   0004 0158 035E

        PULR    R7                              ; 5956   02B7

        DECLE   $0071,  $001A,  $0001           ; 5957   0071 001A 0001

        TSTR    R0                              ; 595A   0080
        MOVR    R0,     R7                      ; 595B   0087

        DECLE   $0059,  $0001,  $0000,  $00FC   ; 595C   0059 0001 0000 00FC
        DECLE   $0059,  $0001,  $0000,  $00CD   ; 5960   0059 0001 0000 00CD
        DECLE   $0059,  $0001,  $0000,  $004A   ; 5964   0059 0001 0000 004A
        DECLE   $005A,  $0014,  $0000,  $0000   ; 5968   005A 0014 0000 0000
        DECLE   $0000,  $0000,  $0000,  $007D   ; 596C   0000 0000 0000 007D
        DECLE   $0059,  $0000,  $0028,  $0000   ; 5970   0059 0000 0028 0000
        DECLE   $0058,  $0000,  $0000,  $0000   ; 5974   0058 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5978   0000 0000 0000 0000
        DECLE   $0000,  $0300,  $0000,  $0000   ; 597C   0000 0300 0000 0000
        DECLE   $0000,  $0003,  $00CA,  $0000   ; 5980   0000 0003 00CA 0000
        DECLE   $0002,  $0001                   ; 5984   0002 0001

        TSTR    R0                              ; 5986   0080
        MVII    #$011F, R2                      ; 5987   02BA 011F
        MVII    #$033A, R3                      ; 5989   02BB 033A
L_598B:
        MVI@    R3,     R4                      ; 598B   029C
        DECLE   $0001                           ; 598C   0001

        ANDI    #$000F, R4                      ; 598D   03BC 000F
        ADDR    R7,     R4                      ; 598F   00FC
        CLRR    R1                              ; 5990   01C9
        MVI@    R2,     R0                      ; 5991   0290
        ANDI    #$00C0, R0                      ; 5992   03B8 00C0
        BNEQ    L_59A7                          ; 5994   020C 0011

        MVI@    R2,     R0                      ; 5996   0290
        MVII    #$0078, R1                      ; 5997   02B9 0078
        CMPI    #$0004, R0                      ; 5999   0378 0004
        BLT     L_59A2                          ; 599B   0205 0005

        CMPI    #$000C, R0                      ; 599D   0378 000C
        BGE     L_59A2                          ; 599F   020D 0001

        NEGR    R1                              ; 59A1   0021
L_59A2:
        ANDI    #$00FF, R1                      ; 59A2   03B9 00FF
        SWAP    R1,     1                       ; 59A4   0041
        XORI    #$01F0, R4                      ; 59A5   03FC 01F0
L_59A7:
        MVO@    R4,     R3                      ; 59A7   025C
        DECR    R3                              ; 59A8   0013
        MVO@    R1,     R3                      ; 59A9   0259
        MVII    #$034A, R3                      ; 59AA   02BB 034A
        INCR    R2                              ; 59AC   000A
        CMPI    #$0120, R2                      ; 59AD   037A 0120
        BLE     L_598B                          ; 59AF   0226 0025
        MOVR    R5,     R7                      ; 59B1   00AF

L_59B2:
        PSHR    R5                              ; 59B2   0275
        MOVR    R1,     R2                      ; 59B3   008A
        SUBI    #$02E0, R2                      ; 59B4   033A 02E0
        SLR     R2,     2                       ; 59B6   0066
        ADDI    #$0187, R2                      ; 59B7   02FA 0187
L_59B9:
        MVI     G_018F, R0                      ; 59B9   0280 018F

        JSR     R5,     X_RAND2                 ; 59BB   0004 0114 029E

        CMP@    R2,     R0                      ; 59BE   0350
        BEQ     L_59B9                          ; 59BF   0224 0007

        MVO@    R0,     R2                      ; 59C1   0250
        MOVR    R0,     R2                      ; 59C2   0082
        SDBD                                    ; 59C3   0001
        ADDI    #$5C91, R2                      ; 59C4   02FA 0091 005C
        MVI@    R2,     R0                      ; 59C7   0290
        SLR     R0,     2                       ; 59C8   0064
        ADDI    #$0208, R0                      ; 59C9   02F8 0208
        MVO@    R0,     R1                      ; 59CB   0248
        PULR    R7                              ; 59CC   02B7

        MVI     G_018B, R0                      ; 59CD   0280 018B
        TSTR    R0                              ; 59CF   0080
        BEQ     L_59E5                          ; 59D0   0204 0013

        DECR    R0                              ; 59D2   0010
        MVO     R0,     G_018B                  ; 59D3   0240 018B
        MVI     .BTAB.00,R0                     ; 59D5   0280 0200
        SDBD                                    ; 59D7   0001
        XORI    #$2000, R0                      ; 59D8   03F8 0000 0020
        MVO     R0,     .BTAB.00                ; 59DB   0240 0200
        MVI     .BTAB.13,R0                     ; 59DD   0280 0213
        SDBD                                    ; 59DF   0001
        XORI    #$2000, R0                      ; 59E0   03F8 0000 0020
        MVO     R0,     .BTAB.13                ; 59E3   0240 0213
L_59E5:
        MOVR    R5,     R7                      ; 59E5   00AF

L_59E6:
        PSHR    R5                              ; 59E6   0275
        MVII    #$0201, R4                      ; 59E7   02BC 0201
        MVII    #$0003, R1                      ; 59E9   02B9 0003
        MVII    #$0002, R3                      ; 59EB   02BB 0002
        MVI     G_018C, R0                      ; 59ED   0280 018C

        JSR     R5,     X_PRNUM_RGT             ; 59EF   0004 0118 00C5

        MVII    #$0210, R4                      ; 59F2   02BC 0210
        MVII    #$0006, R3                      ; 59F4   02BB 0006
        MVI     G_018D, R0                      ; 59F6   0280 018D

        JSR     R5,     X_PRNUM_LFT             ; 59F8   0004 0118 009E

        PULR    R7                              ; 59FB   02B7

        PSHR    R5                              ; 59FC   0275
        MVII    #$0320, R1                      ; 59FD   02B9 0320

        JSR     R5,     L_60F2                  ; 59FF   0004 0160 00F2
        DECLE   $0000,  $0000                   ; 5A02   0000 0000

        SETC                                    ; 5A04   0007
        BNC     L_5A30                          ; 5A05   0209 0029

        MVI     G_018C, R0                      ; 5A07   0280 018C
        CMPI    #$0019, R0                      ; 5A09   0378 0019
        BEQ     L_5A13                          ; 5A0B   0204 0006

        MVI     G_018D, R0                      ; 5A0D   0280 018D
        CMPI    #$0019, R0                      ; 5A0F   0378 0019
        BNEQ    L_5A47                          ; 5A11   020C 0034

L_5A13:
        JSR     R5,     L_53E9                  ; 5A13   0004 0150 03E9
        JSR     R5,     .EXEC.7B3               ; 5A16   0004 0114 03B3

        MVII    #$0007, R3                      ; 5A19   02BB 0007
        MVII    #$0219, R4                      ; 5A1B   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 5A1D   0004 0118 007B
        STRING  "Game Over"                     ; 5A20  
        DECLE   $0000                           ; 5A29   0000

        MVII    #$000A, R0                      ; 5A2A   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5A2C   0004 011C 02D5

        PULR    R7                              ; 5A2F   02B7

L_5A30:
        DECR    R1                              ; 5A30   0011
        MVI     G_0321, R0                      ; 5A31   0280 0321
        TSTR    R0                              ; 5A33   0080
        BPL     L_5A3F                          ; 5A34   0203 0009

        JSR     R5,     L_60F2                  ; 5A36   0004 0160 00F2
        DECLE   $0000,  $00DC                   ; 5A39   0000 00DC

        ADDR    R6,     R0                      ; 5A3B   00F0
        BC      L_5A47                          ; 5A3C   0201 0009
L_5A3E:
        PULR    R7                              ; 5A3E   02B7

L_5A3F:
        JSR     R5,     L_60F2                  ; 5A3F   0004 0160 00F2
        DECLE   $0000,  $00A8                   ; 5A42   0000 00A8

        ADDR    R3,     R4                      ; 5A44   00DC
        BNC     L_5A3E                          ; 5A45   0229 0008

L_5A47:
        JSR     R5,     L_5B5F                  ; 5A47   0004 0158 035F

        PSHR    R5                              ; 5A4A   0275
        MVII    #$0192, R3                      ; 5A4B   02BB 0192
        MVI@    R3,     R0                      ; 5A4D   0298
        INCR    R0                              ; 5A4E   0008
        CMPI    #$003C, R0                      ; 5A4F   0378 003C
        BLT     L_5A5D                          ; 5A51   0205 000A

        CLRR    R0                              ; 5A53   01C0
        INCR    R3                              ; 5A54   000B
        MVI@    R3,     R1                      ; 5A55   0299
        CMPI    #$0063, R1                      ; 5A56   0379 0063
        BEQ     L_5A5D                          ; 5A58   0204 0003

        INCR    R1                              ; 5A5A   0009
        MVO@    R1,     R3                      ; 5A5B   0259
        DECR    R3                              ; 5A5C   0013
L_5A5D:
        MVO@    R0,     R3                      ; 5A5D   0258
        INCR    R7                              ; 5A5E   000F

        PSHR    R5                              ; 5A5F   0275
L_5A60:
        MVI     G_0193, R0                      ; 5A60   0280 0193
        MVII    #$0002, R1                      ; 5A62   02B9 0002
        MVII    #$0003, R3                      ; 5A64   02BB 0003
        MVII    #$0207, R4                      ; 5A66   02BC 0207

        JSR     R5,     X_PRNUM_RGT             ; 5A68   0004 0118 00C5

        MVII    #$00D3, R0                      ; 5A6B   02B8 00D3
        ADDR    R1,     R4                      ; 5A6D   00CC
        MVO@    R0,     R4                      ; 5A6E   0260
        MVI     G_0192, R0                      ; 5A6F   0280 0192

        JSR     R5,     X_PRNUM_ZRO             ; 5A71   0004 0118 00AD

        PULR    R7                              ; 5A74   02B7

        DECLE   $0000,  $0000                   ; 5A75   0000 0000

        SAR     R1,     1                       ; 5A77   0069
        SLLC    R0,     2                       ; 5A78   005C
        SARC    R3,     2                       ; 5A79   007F
        SLLC    R2,     1                       ; 5A7A   005A
        SARC    R3,     2                       ; 5A7B   007F
        SLLC    R2,     1                       ; 5A7C   005A
        SARC    R3,     2                       ; 5A7D   007F
        SLLC    R2,     1                       ; 5A7E   005A
        PSHR    R5                              ; 5A7F   0275
        DECR    R0                              ; 5A80   0010
        BNEQ    L_5ADC                          ; 5A81   020C 0059

        SLL     R1,     2                       ; 5A83   004D
        SLL     R1,     2                       ; 5A84   004D
        ADDI    #$0335, R1                      ; 5A85   02F9 0335
        MVI@    R1,     R0                      ; 5A87   0288
        ANDI    #$0008, R0                      ; 5A88   03B8 0008
        BNEQ    L_5B44                          ; 5A8A   020C 00B8

        ADDI    #$0002, R1                      ; 5A8C   02F9 0002
        MVI@    R1,     R0                      ; 5A8E   0288
        SWAP    R0,     1                       ; 5A8F   0040
        ANDI    #$00FF, R0                      ; 5A90   03B8 00FF
        MVII    #$02E0, R2                      ; 5A92   02BA 02E0
        MVII    #$001C, R3                      ; 5A94   02BB 001C
        MVII    #$0033, R4                      ; 5A96   02BC 0033
        MVII    #$0187, R5                      ; 5A98   02BD 0187
L_5A9A:
        CMPR    R3,     R0                      ; 5A9A   0158
        BLT     L_5ADC                          ; 5A9B   0205 003F

        CMPR    R4,     R0                      ; 5A9D   0160
        BLE     L_5AAC                          ; 5A9E   0206 000C

        INCR    R5                              ; 5AA0   000D
        ADDI    #$0004, R2                      ; 5AA1   02FA 0004
        ADDI    #$0020, R3                      ; 5AA3   02FB 0020
        ADDI    #$0020, R4                      ; 5AA5   02FC 0020
        CMPI    #$02EC, R2                      ; 5AA7   037A 02EC
        BLE     L_5A9A                          ; 5AA9   0226 0010
        PULR    R7                              ; 5AAB   02B7

L_5AAC:
        MVI@    R5,     R0                      ; 5AAC   02A8
        PSHR    R0                              ; 5AAD   0270
        MVI@    R2,     R3                      ; 5AAE   0293
        PSHR    R1                              ; 5AAF   0271
        MOVR    R2,     R1                      ; 5AB0   0091

        JSR     R5,     L_59B2                  ; 5AB1   0004 0158 01B2

        PULR    R1                              ; 5AB4   02B1
        SUBI    #$0002, R1                      ; 5AB5   0339 0002
        MVI@    R1,     R0                      ; 5AB7   0288
        XORI    #$0008, R0                      ; 5AB8   03F8 0008
        MVO@    R0,     R1                      ; 5ABA   0248
        ADDI    #$000F, R1                      ; 5ABB   02F9 000F
        PULR    R0                              ; 5ABD   02B0
        MVO@    R0,     R1                      ; 5ABE   0248
        SUBI    #$0006, R1                      ; 5ABF   0339 0006
        SLR     R3,     2                       ; 5AC1   0067
        SLR     R3,     1                       ; 5AC2   0063
        SUBI    #$0021, R3                      ; 5AC3   033B 0021
        MOVR    R3,     R0                      ; 5AC5   0098

        JSR     R5,     L_5B08                  ; 5AC6   0004 0158 0308

        SUBI    #$0005, R1                      ; 5AC9   0339 0005

        JSR     R5,     .EXEC.766               ; 5ACB   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5ACE   0004 0114 02CF

        MVI@    R1,     R0                      ; 5AD1   0288
        SDBD                                    ; 5AD2   0001
        XORI    #$1800, R0                      ; 5AD3   03F8 0000 0018
        MVO@    R0,     R1                      ; 5AD6   0248
        ADDI    #$0004, R1                      ; 5AD7   02F9 0004
        MVII    #$00FB, R0                      ; 5AD9   02B8 00FB
        MVO@    R0,     R1                      ; 5ADB   0248
L_5ADC:
        PULR    R7                              ; 5ADC   02B7

        DECLE   $0000,  $0000,  $00ED,  $005A   ; 5ADD   0000 0000 00ED 005A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5AE9   0000 0000 0000 0000
        DECLE   $001F,  $005B,  $0007,  $005B   ; 5AED   001F 005B 0007 005B
        DECLE   $0010,  $0000,  $0006,  $00B4   ; 5AF1   0010 0000 0006 00B4
        DECLE   $005B,  $00B4,  $015B,  $02B4   ; 5AF5   005B 00B4 015B 02B4
        DECLE   $005B,  $001F                   ; 5AF9   005B 001F

        SLLC    R3,     1                       ; 5AFB   005B
        SETC                                    ; 5AFC   0007
        SLLC    R3,     1                       ; 5AFD   005B
        INCR    R2                              ; 5AFE   000A
        DECR    R0                              ; 5AFF   0010
        CLRC                                    ; 5B00   0006
        MOVR    R6,     R4                      ; 5B01   00B4
        SLLC    R3,     1                       ; 5B02   005B
        MOVR    R6,     R4                      ; 5B03   00B4
        CMPR    R3,     R3                      ; 5B04   015B
        PULR    R4                              ; 5B05   02B4
        SLLC    R3,     1                       ; 5B06   005B
        MOVR    R5,     R7                      ; 5B07   00AF

L_5B08:
        ANDI    #$001F, R0                      ; 5B08   03B8 001F
        PSHR    R2                              ; 5B0A   0272
        SDBD                                    ; 5B0B   0001
        MVII    #$5AED, R2                      ; 5B0C   02BA 00ED 005A
        CMPI    #$0010, R0                      ; 5B0F   0378 0010
        BLT     L_5B19                          ; 5B11   0205 0006

        SDBD                                    ; 5B13   0001
        MVII    #$5AFA, R2                      ; 5B14   02BA 00FA 005A
        SUBI    #$0010, R0                      ; 5B17   0338 0010
L_5B19:
        MVO@    R2,     R1                      ; 5B19   024A
        ADDI    #$0004, R1                      ; 5B1A   02F9 0004
        MVO@    R0,     R1                      ; 5B1C   0248
        PULR    R2                              ; 5B1D   02B2
        MOVR    R5,     R7                      ; 5B1E   00AF

        PSHR    R5                              ; 5B1F   0275
        CMPI    #$0003, R0                      ; 5B20   0378 0003
        BLT     L_5B43                          ; 5B22   0205 001F
        INCR    R7                              ; 5B24   000F

L_5B25:
        PSHR    R5                              ; 5B25   0275
L_5B26:
        MVI     G_02F0, R0                      ; 5B26   0280 02F0
        SDBD                                    ; 5B28   0001
        CMPI    #$58B4, R0                      ; 5B29   0378 00B4 0058
        BNEQ    L_5B43                          ; 5B2C   020C 0015

        MVI@    R1,     R0                      ; 5B2E   0288
        SDBD                                    ; 5B2F   0001
        ANDI    #$E7F7, R0                      ; 5B30   03B8 00F7 00E7
        MVO@    R0,     R1                      ; 5B33   0248
        ADDI    #$0004, R1                      ; 5B34   02F9 0004
        CLRR    R0                              ; 5B36   01C0
        MVO@    R0,     R1                      ; 5B37   0248
        DECR    R1                              ; 5B38   0011
        MVO@    R0,     R1                      ; 5B39   0248
        DECR    R1                              ; 5B3A   0011
        MVO@    R0,     R1                      ; 5B3B   0248
        SUBI    #$000A, R1                      ; 5B3C   0339 000A
        MVII    #$0008, R0                      ; 5B3E   02B8 0008
        COMR    R0                              ; 5B40   0018
        AND@    R1,     R0                      ; 5B41   0388
        MVO@    R0,     R1                      ; 5B42   0248
L_5B43:
        PULR    R7                              ; 5B43   02B7

L_5B44:
        ADDI    #$0008, R1                      ; 5B44   02F9 0008
        MVI@    R1,     R0                      ; 5B46   0288
        ANDI    #$0008, R0                      ; 5B47   03B8 0008
        BNEQ    L_5B5D                          ; 5B49   020C 0012

        MVI@    R1,     R0                      ; 5B4B   0288
        XORI    #$0008, R0                      ; 5B4C   03F8 0008
        MVO@    R0,     R1                      ; 5B4E   0248

        JSR     R5,     .EXEC.766               ; 5B4F   0004 0114 0366
        JSR     R5,     .EXEC.6D5               ; 5B52   0004 0114 02D5

        ADDI    #$0004, R1                      ; 5B55   02F9 0004
        MVII    #$009C, R0                      ; 5B57   02B8 009C
        MVO@    R0,     R1                      ; 5B59   0248

        JSR     R5,     L_5C5D                  ; 5B5A   0004 015C 005D

L_5B5D:
        PULR    R7                              ; 5B5D   02B7

L_5B5E:
        PSHR    R5                              ; 5B5E   0275
L_5B5F:
        MVII    #$0003, R0                      ; 5B5F   02B8 0003
        MVO     R0,     G_0323                  ; 5B61   0240 0323
        MVI     G_018E, R0                      ; 5B63   0280 018E

        JSR     R5,     X_RAND2                 ; 5B65   0004 0114 029E

        MOVR    R0,     R2                      ; 5B68   0082
        MVO     R0,     G_0186                  ; 5B69   0240 0186
        SDBD                                    ; 5B6B   0001
        ADDI    #$5C9B, R2                      ; 5B6C   02FA 009B 005C
        MVI@    R2,     R0                      ; 5B6F   0290
        MVII    #$032E, R1                      ; 5B70   02B9 032E

        JSR     R5,     L_5B08                  ; 5B72   0004 0158 0308

        MVI@    R2,     R0                      ; 5B75   0290
        SLR     R0,     2                       ; 5B76   0064
        SLR     R0,     2                       ; 5B77   0064
        SLR     R0,     1                       ; 5B78   0060
        MVII    #$031E, R1                      ; 5B79   02B9 031E

        JSR     R5,     L_5B08                  ; 5B7B   0004 0158 0308

        MVII    #$003C, R0                      ; 5B7E   02B8 003C

        JSR     R5,     X_RAND2                 ; 5B80   0004 0114 029E

        ADDI    #$000A, R0                      ; 5B83   02F8 000A
        MOVR    R0,     R1                      ; 5B85   0081
        MVII    #$0008, R2                      ; 5B86   02BA 0008
        MVII    #$0001, R0                      ; 5B88   02B8 0001

        JSR     R5,     X_RAND1                 ; 5B8A   0004 0114 027D

        TSTR    R0                              ; 5B8D   0080
        BEQ     L_5B95                          ; 5B8E   0204 0005

        NEGR    R1                              ; 5B90   0021
        ANDI    #$00FF, R1                      ; 5B91   03B9 00FF
        MVII    #$0090, R2                      ; 5B93   02BA 0090
L_5B95:
        SWAP    R1,     1                       ; 5B95   0041
        SWAP    R2,     1                       ; 5B96   0042
        SDBD                                    ; 5B97   0001
        MVII    #$1880, R0                      ; 5B98   02B8 0080 0018
        MVO     R0,     G_031D                  ; 5B9B   0240 031D
        MVO     R0,     G_032D                  ; 5B9D   0240 032D
        SDBD                                    ; 5B9F   0001
        MVII    #$0880, R0                      ; 5BA0   02B8 0080 0008
        MVO     R0,     G_0325                  ; 5BA3   0240 0325
        MVII    #$0028, R0                      ; 5BA5   02B8 0028

        JSR     R5,     X_RAND2                 ; 5BA7   0004 0114 029E

        ADDI    #$0010, R0                      ; 5BAA   02F8 0010
        SWAP    R0,     1                       ; 5BAC   0040
        MVO     R0,     G_0320                  ; 5BAD   0240 0320
        MVO     R2,     G_031F                  ; 5BAF   0242 031F
        MVO     R1,     G_0321                  ; 5BB1   0241 0321
        PULR    R7                              ; 5BB3   02B7

        PSHR    R5                              ; 5BB4   0275
        MVI     G_0323, R5                      ; 5BB5   0285 0323
        TSTR    R5                              ; 5BB7   00AD
        BNEQ    L_5C43                          ; 5BB8   020C 0089

        CMPI    #$0003, R0                      ; 5BBA   0378 0003
        BLT     L_5C43                          ; 5BBC   0205 0085

        CMPI    #$0003, R3                      ; 5BBE   037B 0003
        BGE     L_5C43                          ; 5BC0   020D 0081

        ADDI    #$0007, R1                      ; 5BC2   02F9 0007
        MVI@    R1,     R2                      ; 5BC4   028A
        TSTR    R2                              ; 5BC5   0092
        BMI     L_5C43                          ; 5BC6   020B 007B

        MOVR    R2,     R0                      ; 5BC8   0090
        COMR    R0                              ; 5BC9   0018
        MVO@    R0,     R1                      ; 5BCA   0248
        MVI     G_0186, R3                      ; 5BCB   0283 0186
        SDBD                                    ; 5BCD   0001
        ADDI    #$5CF4, R3                      ; 5BCE   02FB 00F4 005C
        MVI@    R3,     R0                      ; 5BD1   0298

        JSR     R5,     L_5C97                  ; 5BD2   0004 015C 0097

        SLL     R0,     1                       ; 5BD5   0048
L_5BD6:
        DECR    R2                              ; 5BD6   0012
        BMI     L_5BDC                          ; 5BD7   020B 0003

        SLL     R0,     1                       ; 5BD9   0048
        B       L_5BD6                          ; 5BDA   0220 0005

L_5BDC:
        TSTR    R0                              ; 5BDC   0080
        BPL     L_5C2E                          ; 5BDD   0203 004F

        SUBI    #$000F, R1                      ; 5BDF   0339 000F
        MVI@    R1,     R0                      ; 5BE1   0288
        ANDI    #$0007, R0                      ; 5BE2   03B8 0007
        SDBD                                    ; 5BE4   0001
        XORI    #$1080, R0                      ; 5BE5   03F8 0080 0010
        MVO     R0,     G_031D                  ; 5BE8   0240 031D
        MVO     R0,     G_0325                  ; 5BEA   0240 0325
        MVO     R0,     G_032D                  ; 5BEC   0240 032D
        ADDI    #$0009, R1                      ; 5BEE   02F9 0009
        MVI@    R1,     R0                      ; 5BF0   0288
        MVO     R0,     G_0326                  ; 5BF1   0240 0326
        ADDI    #$0004, R1                      ; 5BF3   02F9 0004
        MVI@    R1,     R0                      ; 5BF5   0288
        MVO     R0,     G_032A                  ; 5BF6   0240 032A
        SUBI    #$0005, R1                      ; 5BF8   0339 0005
        PSHR    R1                              ; 5BFA   0271
        MVII    #$018C, R2                      ; 5BFB   02BA 018C
        CMPI    #$033D, R1                      ; 5BFD   0379 033D
        BEQ     L_5C02                          ; 5BFF   0204 0001

        INCR    R2                              ; 5C01   000A
L_5C02:
        MVI@    R2,     R0                      ; 5C02   0290
        INCR    R0                              ; 5C03   0008
        MVO@    R0,     R2                      ; 5C04   0250

        JSR     R5,     L_59E6                  ; 5C05   0004 0158 01E6

        PULR    R1                              ; 5C08   02B1

        JSR     R5,     L_5B25                  ; 5C09   0004 0158 0325

        CLRR    R0                              ; 5C0C   01C0
        MVO     R0,     G_0321                  ; 5C0D   0240 0321
        MVII    #$0006, R0                      ; 5C0F   02B8 0006
        MVO     R0,     G_018B                  ; 5C11   0240 018B
        MVII    #$004C, R0                      ; 5C13   02B8 004C
        SWAP    R0,     1                       ; 5C15   0040
        MVO     R0,     G_031F                  ; 5C16   0240 031F
        MVII    #$0018, R0                      ; 5C18   02B8 0018
        SWAP    R0,     1                       ; 5C1A   0040
        MVO     R0,     G_0320                  ; 5C1B   0240 0320

        JSR     R5,     L_6290                  ; 5C1D   0004 0160 0290

        MVII    #$0001, R0                      ; 5C20   02B8 0001

        JSR     R5,     .EXEC.41C               ; 5C22   0004 0114 001C
        JSR     R5,     .EXEC.A61               ; 5C25   0004 0118 0261

        COMR    R6                              ; 5C28   001E
        MVII    #$009C, R0                      ; 5C29   02B8 009C
        MVO     R0,     G_0321                  ; 5C2B   0240 0321
        PULR    R7                              ; 5C2D   02B7

L_5C2E:
        JSR     R5,     L_5C44                  ; 5C2E   0004 015C 0044

        MVII    #$0007, R0                      ; 5C31   02B8 0007

        JSR     R5,     X_RAND2                 ; 5C33   0004 0114 029E

        ADDI    #$0009, R0                      ; 5C36   02F8 0009
        PSHR    R1                              ; 5C38   0271
        MOVR    R0,     R1                      ; 5C39   0081
        MVII    #$0032, R0                      ; 5C3A   02B8 0032

        JSR     R5,     .EXEC.629               ; 5C3C   0004 0114 0229

        PULR    R2                              ; 5C3F   02B2
        SUBI    #$0003, R2                      ; 5C40   033A 0003
        MVO@    R0,     R2                      ; 5C42   0250
L_5C43:
        PULR    R7                              ; 5C43   02B7

L_5C44:
        PSHR    R5                              ; 5C44   0275

        JSR     R5,     X_PLAY_SFX1             ; 5C45   0004 0118 03BB
        DECLE   $0389                           ; 5C48  SFX data
        DECLE   $006C,  $0000                   ; 5C49  SFX data
        DECLE   $0050,  $0100                   ; 5C4B  SFX data
        DECLE   $0058,  $010C                   ; 5C4D  SFX data
        DECLE   $005B                           ; 5C4F  SFX data
        DECLE   $0044,  $0100                   ; 5C50  SFX data
        DECLE   $0001,  $03A0                   ; 5C52  SFX data
        DECLE   $0001,  $03B2                   ; 5C54  SFX data
        DECLE   $0001,  $03F1                   ; 5C56  SFX data
        DECLE   $000B                           ; 5C58  SFX data
        DECLE   $02EB                           ; 5C59  SFX data
        DECLE   $0001,  $0003                   ; 5C5A  SFX data
        DECLE   $03CF                           ; 5C5C  SFX end

L_5C5D:
        PSHR    R5                              ; 5C5D   0275

        JSR     R5,     X_PLAY_SFX1             ; 5C5E   0004 0118 03BB
        DECLE   $0079                           ; 5C61  SFX data
        DECLE   $00CC,  $0000                   ; 5C62  SFX data
        DECLE   $008D                           ; 5C64  SFX data
        DECLE   $0387                           ; 5C65  SFX data
        DECLE   $03B7                           ; 5C66  SFX data
        DECLE   $000B                           ; 5C67  SFX data
        DECLE   $03CF                           ; 5C68  SFX end


        MVII    #$0005, R2                      ; 5C69   02BA 0005
        SDBD                                    ; 5C6B   0001
        MVII    #$0059, R3                      ; 5C6C   02BB 0059 0000
        CMPI    #$0008, R0                      ; 5C6F   0378 0008
        BGE     L_5C8C                          ; 5C71   020D 0019

        MVII    #$0190, R4                      ; 5C73   02BC 0190
        SDBD                                    ; 5C75   0001
        MVI@    R4,     R1                      ; 5C76   02A1
        SLL     R1,     2                       ; 5C77   004D
        SLL     R1,     2                       ; 5C78   004D
        SLR     R1,     1                       ; 5C79   0061
        XORR    R1,     R0                      ; 5C7A   01C8
        SDBD                                    ; 5C7B   0001
        CMPI    #$4688, R0                      ; 5C7C   0378 0088 0046
        BNEQ    L_5C87                          ; 5C7F   020C 0006

        MVII    #$0006, R2                      ; 5C81   02BA 0006
        SDBD                                    ; 5C83   0001
        MVII    #$005B, R3                      ; 5C84   02BB 005B 0000
L_5C87:
        MVO     R0,     G_0190                  ; 5C87   0240 0190
        SWAP    R0,     1                       ; 5C89   0040
        MVO     R0,     G_0191                  ; 5C8A   0240 0191
L_5C8C:
        MVO     R2,     G_018F                  ; 5C8C   0242 018F
        MVO     R3,     G_018E                  ; 5C8E   0243 018E
        MOVR    R5,     R7                      ; 5C90   00AF

        DECLE   $0000                           ; 5C91   0000

        TSTR    R0                              ; 5C92   0080
        SUBR    R0,     R0                      ; 5C93   0100
        CLRR    R0                              ; 5C94   01C0
        MVI     G_0120, R0                      ; 5C95   0280 0120
L_5C97:
        SLL     R0,     2                       ; 5C97   004C
        SLL     R0,     2                       ; 5C98   004C
        SLL     R0,     1                       ; 5C99   0048
        MOVR    R5,     R7                      ; 5C9A   00AF

        DECLE   $0021,  $0023,  $0026,  $002C   ; 5C9B   0021 0023 0026 002C
        DECLE   $002D,  $0032,  $0033,  $0036   ; 5C9F   002D 0032 0033 0036
        DECLE   $0038,  $0041,  $0043,  $004D   ; 5CA3   0038 0041 0043 004D
        DECLE   $004F,  $0053,  $0056,  $0063   ; 5CA7   004F 0053 0056 0063
        DECLE   $0066,  $006C,  $006D,  $006F   ; 5CAB   0066 006C 006D 006F
        DECLE   $00AD,  $00B1,  $00B3,  $00B6   ; 5CAF   00AD 00B1 00B3 00B6
        DECLE   $00B7                           ; 5CB3   00B7

        MOVR    R7,     R1                      ; 5CB4   00B9
        ADDR    R1,     R4                      ; 5CB5   00CC
        ADDR    R1,     R5                      ; 5CB6   00CD
        ADDR    R4,     R1                      ; 5CB7   00E1
        ADDR    R4,     R3                      ; 5CB8   00E3
        ADDR    R4,     R6                      ; 5CB9   00E6
        ADDR    R5,     R4                      ; 5CBA   00EC
        ADDR    R5,     R7                      ; 5CBB   00EF

        DECLE   $00F2,  $00F3,  $00F8,  $0121   ; 5CBC   00F2 00F3 00F8 0121
        DECLE   $0126,  $0133,  $0146,  $0163   ; 5CC0   0126 0133 0146 0163
        DECLE   $0166,  $016F,  $0173,  $0176   ; 5CC4   0166 016F 0173 0176
        DECLE   $0183,  $018D,  $018F,  $0193   ; 5CC8   0183 018D 018F 0193
        DECLE   $0196,  $01A1,  $01AF,  $01B3   ; 5CCC   0196 01A1 01AF 01B3
        DECLE   $01B6,  $01E3,  $01E6,  $01ED   ; 5CD0   01B6 01E3 01E6 01ED
        DECLE   $01EF,  $01F3,  $01F6,  $0221   ; 5CD4   01EF 01F3 01F6 0221
        DECLE   $0223,  $0226,  $022C,  $022D   ; 5CD8   0223 0226 022C 022D
        DECLE   $0233,  $0236,  $0243,  $0246   ; 5CDC   0233 0236 0243 0246
        DECLE   $024C,  $024D,  $024F,  $0251   ; 5CE0   024C 024D 024F 0251
        DECLE   $0253,  $0256,  $0261,  $0266   ; 5CE4   0253 0256 0261 0266
        DECLE   $026D,  $026F,  $0271,  $0277   ; 5CE8   026D 026F 0271 0277
        DECLE   $02B6,  $02B3,  $02C3,  $02C6   ; 5CEC   02B6 02B3 02C3 02C6
        DECLE   $02CD,  $02D3,  $0313,  $0312   ; 5CF0   02CD 02D3 0313 0312
        DECLE   $00E3,  $03A4,  $03E5,  $0021   ; 5CF4   00E3 03A4 03E5 0021
        DECLE   $02A3,  $0021,  $03A4,  $0041   ; 5CF8   02A3 0021 03A4 0041
        DECLE   $0263,  $0263,  $0263,  $0242   ; 5CFC   0263 0263 0263 0242
        DECLE   $0263,  $0263,  $0242,  $02A3   ; 5D00   0263 0263 0242 02A3
        DECLE   $00E3,  $0282,  $01E4,  $0081   ; 5D04   00E3 0282 01E4 0081
        DECLE   $03A4,  $02E4,  $0282,  $0101   ; 5D08   03A4 02E4 0282 0101
        DECLE   $00C2,  $0101,  $0122,  $00A2   ; 5D0C   00C2 0101 0122 00A2
        DECLE   $0062,  $0282,  $0263,  $03A4   ; 5D10   0062 0282 0263 03A4
        DECLE   $00C2,  $0282,  $02E4,  $0302   ; 5D14   00C2 0282 02E4 0302
        DECLE   $0242,  $02E4,  $0163,  $0101   ; 5D18   0242 02E4 0163 0101
        DECLE   $0383,  $0364,  $0282,  $01C3   ; 5D1C   0383 0364 0282 01C3
        DECLE   $0242,  $02E4,  $0302,  $0242   ; 5D20   0242 02E4 0302 0242
        DECLE   $0302,  $0142,  $02E4,  $0282   ; 5D24   0302 0142 02E4 0282
        DECLE   $01E4,  $0142,  $0242,  $01A3   ; 5D28   01E4 0142 0242 01A3
        DECLE   $03A4,  $03E5,  $03E5,  $0343   ; 5D2C   03A4 03E5 03E5 0343
        DECLE   $00E3,  $01C3,  $02A3,  $02A3   ; 5D30   00E3 01C3 02A3 02A3
        DECLE   $0222,  $0263,  $0242,  $0242   ; 5D34   0222 0263 0242 0242
        DECLE   $0201,  $0021,  $00E3,  $02E4   ; 5D38   0201 0021 00E3 02E4
        DECLE   $0081,  $03C4,  $0343,  $0222   ; 5D3C   0081 03C4 0343 0222
        DECLE   $0263,  $03E5,  $02C3,  $0201   ; 5D40   0263 03E5 02C3 0201
        DECLE   $0201,  $0041,  $0302,  $0302   ; 5D44   0201 0041 0302 0302
        DECLE   $0282,  $00C2,  $0182,  $0101   ; 5D48   0282 00C2 0182 0101
        DECLE   $0101,  $0008,  $0032,  $0077   ; 5D4C   0101 0008 0032 0077
        DECLE   $005D,  $0093,  $005D,  $00B5   ; 5D50   005D 0093 005D 00B5
        DECLE   $005E,  $0091,  $005D,  $0069   ; 5D54   005E 0091 005D 0069
        DECLE   $005D,  $00C0,  $0000,  $0000   ; 5D58   005D 00C0 0000 0000
        DECLE   $0000,  $0003,  $0000,  $0000   ; 5D5C   0000 0003 0000 0000
        DECLE   $0004,  $01F0,  $01E0,  $01D0   ; 5D60   0004 01F0 01E0 01D0
        DECLE   $01C0,  $01B0,  $01A0,  $0190   ; 5D64   01C0 01B0 01A0 0190
        DECLE   $0180,  $0057,  $0057,  $006F   ; 5D68   0180 0057 0057 006F
        DECLE   $0072,  $0064,  $0020,  $0048   ; 5D6C   0072 0064 0020 0048
        DECLE   $0075,  $006E,  $0074,  $0000   ; 5D70   0075 006E 0074 0000
        DECLE   $0004,  $0350,  $029C,  $0071   ; 5D74   0004 0350 029C 0071
        DECLE   $001A,  $0001,  $0080,  $00B5   ; 5D78   001A 0001 0080 00B5
        DECLE   $005E,  $0001,  $0000,  $001D   ; 5D7C   005E 0001 0000 001D
        DECLE   $005F,  $0001,  $0000,  $00F1   ; 5D80   005F 0001 0000 00F1
        DECLE   $0014,  $0001,  $0000,  $00A6   ; 5D84   0014 0001 0000 00A6
        DECLE   $0062,  $0040,  $0000,  $0002   ; 5D88   0062 0040 0000 0002
        DECLE   $0061,  $0014,  $0000,  $0000   ; 5D8C   0061 0014 0000 0000
        DECLE   $0000,  $0001,  $0000           ; 5D90   0000 0001 0000

        PSHR    R5                              ; 5D93   0275
        SDBD                                    ; 5D94   0001
        MVII    #$5D8B, R1                      ; 5D95   02B9 008B 005D

        JSR     R5,     X_TIMER_STOP            ; 5D98   0004 0118 0038

        MVII    #$0200, R4                      ; 5D9B   02BC 0200
        MVII    #$00F0, R0                      ; 5D9D   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5D9F   0004 0114 0338

        DECR    R5                              ; 5DA2   0015
        MVO     R5,     G_0183                  ; 5DA3   0245 0183
L_5DA5:
        MVII    #$0007, R3                      ; 5DA5   02BB 0007
        MVII    #$0216, R4                      ; 5DA7   02BC 0216

        JSR     R5,     X_PRINT_R5              ; 5DA9   0004 0118 007B
        STRING  "# of players?"                 ; 5DAC  
        DECLE   $0000                           ; 5DB9   0000

        MVII    #$0001, R0                      ; 5DBA   02B8 0001
        MOVR    R4,     R1                      ; 5DBC   00A1
        INCR    R1                              ; 5DBD   0009
        CLRR    R2                              ; 5DBE   01D2

        JSR     R5,     X_GETNUM                ; 5DBF   0004 0118 00FF

        DECR    R0                              ; 5DC2   0010
        BMI     L_5DA5                          ; 5DC3   022B 001F

        CMPI    #$0001, R0                      ; 5DC5   0378 0001
        BGT     L_5DA5                          ; 5DC7   022E 0023

        MVO     R0,     G_0183                  ; 5DC9   0240 0183

L_5DCB:
        JSR     R5,     L_6612                  ; 5DCB   0004 0164 0212

        SDBD                                    ; 5DCE   0001
        MVII    #$2000, R0                      ; 5DCF   02B8 0000 0020
        MVO     R0,     .BTAB.A0                ; 5DD2   0240 02A0
        SDBD                                    ; 5DD4   0001
        MVII    #$5D8B, R1                      ; 5DD5   02B9 008B 005D

        JSR     R5,     X_TIMER_START           ; 5DD8   0004 0118 0044
        JSR     R5,     L_540F                  ; 5DDB   0004 0154 000F
        DECLE   $0008,  $0177,  $000F,  $00B5   ; 5DDE   0008 0177 000F 00B5
        DECLE   $00BF,  $0000,  $0000,  $0000   ; 5DE2   00BF 0000 0000 0000
        DECLE   $0003,  $0001                   ; 5DE6   0003 0001

        MOVR    R7,     R1                      ; 5DE8   00B9
        ADDI    #$00A0, R1                      ; 5DE9   02F9 00A0

        JSR     R5,     L_5E67                  ; 5DEB   0004 015C 0267
        DECLE   $031D,  $0001,  $0000,  $0325   ; 5DEE   031D 0001 0000 0325
        DECLE   $0001,  $0000                   ; 5DF2   0001 0000

        MVII    #$0001, R0                      ; 5DF4   02B8 0001

        JSR     R5,     .EXEC.6CF               ; 5DF6   0004 0114 02CF

        MOVR    R7,     R0                      ; 5DF9   00B8
        ADDI    #$009F, R0                      ; 5DFA   02F8 009F
        MVO     R0,     G_031E                  ; 5DFC   0240 031E
        MOVR    R7,     R0                      ; 5DFE   00B8
        ADDI    #$00A1, R0                      ; 5DFF   02F8 00A1
        MVO     R0,     G_0326                  ; 5E01   0240 0326
        MVII    #$0178, R2                      ; 5E03   02BA 0178
        MVII    #$017A, R3                      ; 5E05   02BB 017A

        JSR     R5,     L_6056                  ; 5E07   0004 0160 0056

        MVI     G_0183, R5                      ; 5E0A   0285 0183
        TSTR    R5                              ; 5E0C   00AD
        BEQ     L_5E2E                          ; 5E0D   0204 001F

        JSR     R5,     L_5E67                  ; 5E0F   0004 015C 0267
        DECLE   $033D,  $0007,  $0000,  $0345   ; 5E12   033D 0007 0000 0345
        DECLE   $0007,  $0000                   ; 5E16   0007 0000

        MVII    #$0005, R0                      ; 5E18   02B8 0005

        JSR     R5,     .EXEC.6CF               ; 5E1A   0004 0114 02CF

        MOVR    R7,     R0                      ; 5E1D   00B8
        ADDI    #$007B, R0                      ; 5E1E   02F8 007B
        MVO     R0,     G_033E                  ; 5E20   0240 033E
        MOVR    R7,     R0                      ; 5E22   00B8
        ADDI    #$007D, R0                      ; 5E23   02F8 007D
        MVO     R0,     G_0346                  ; 5E25   0240 0346
        MVII    #$0179, R2                      ; 5E27   02BA 0179
        MVII    #$017B, R3                      ; 5E29   02BB 017B

        JSR     R5,     L_6056                  ; 5E2B   0004 0160 0056

L_5E2E:
        MVII    #$0008, R0                      ; 5E2E   02B8 0008
        SWAP    R0,     1                       ; 5E30   0040
        MVO     R0,     G_0329                  ; 5E31   0240 0329
        MVO     R0,     G_0349                  ; 5E33   0240 0349
        MVII    #$0078, R0                      ; 5E35   02B8 0078
        SWAP    R0,     1                       ; 5E37   0040
        MVO     R0,     G_033F                  ; 5E38   0240 033F
        SDBD                                    ; 5E3A   0001
        MVII    #$5F77, R0                      ; 5E3B   02B8 0077 005F
        MVO     R0,     G_035D                  ; 5E3E   0240 035D

        JSR     R5,     L_5F5D                  ; 5E40   0004 015C 035D
        JSR     R5,     L_6102                  ; 5E43   0004 0160 0102

        MVI     G_0180, R0                      ; 5E46   0280 0180
        INCR    R0                              ; 5E48   0008
        MVO     R0,     G_0180                  ; 5E49   0240 0180
        MVII    #$0002, R1                      ; 5E4B   02B9 0002
        CLRR    R3                              ; 5E4D   01DB
        MVII    #$02AC, R4                      ; 5E4E   02BC 02AC

        JSR     R5,     X_PRNUM_LFT             ; 5E50   0004 0118 009E

        MVII    #$02A7, R4                      ; 5E53   02BC 02A7

        JSR     R5,     X_PRINT_R5              ; 5E55   0004 0118 007B
        STRING  "Turn:"                         ; 5E58  
        DECLE   $0000                           ; 5E5D   0000

        MOVR    R7,     R1                      ; 5E5E   00B9
        ADDI    #$0017, R1                      ; 5E5F   02F9 0017
        MVII    #$0355, R2                      ; 5E61   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 5E63   0004 0114 02B2

        PULR    R7                              ; 5E66   02B7

L_5E67:
        MVII    #$0002, R3                      ; 5E67   02BB 0002
        MOVR    R5,     R4                      ; 5E69   00AC
L_5E6A:
        MVI@    R4,     R2                      ; 5E6A   02A2

        JSR     R5,     X_INIT_MOB              ; 5E6B   0004 0114 02B2

        MVI@    R2,     R0                      ; 5E6E   0290
        SDBD                                    ; 5E6F   0001
        XOR@    R4,     R0                      ; 5E70   03E0
        MVO@    R0,     R2                      ; 5E71   0250
        DECR    R3                              ; 5E72   0013
        BNEQ    L_5E6A                          ; 5E73   022C 000A
        MOVR    R4,     R7                      ; 5E75   00A7

        DECLE   $00A0,  $0011,  $0082,  $005E   ; 5E76   00A0 0011 0082 005E
        DECLE   $0000,  $0058,  $0000,  $0050   ; 5E7A   0000 0058 0000 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E82   0000 0000 0000 0000
        DECLE   $0001,  $007F,  $0000,  $0060   ; 5E86   0001 007F 0000 0060
        DECLE   $0010,  $0000,  $0000,  $0000   ; 5E8A   0010 0000 0000 0000
        DECLE   $0028,  $0000,  $003C,  $0000   ; 5E8E   0028 0000 003C 0000
        DECLE   $0000,  $00F0,  $0003,  $0000   ; 5E92   0000 00F0 0003 0000
        DECLE   $0000,  $0000,  $0000,  $03DC   ; 5E96   0000 0000 0000 03DC
        DECLE   $0013,  $0000,  $0000,  $0002   ; 5E9A   0013 0000 0000 0002
        DECLE   $00CB,  $0000,  $03DC,  $0013   ; 5E9E   00CB 0000 03DC 0013
        DECLE   $0000,  $0000                   ; 5EA2   0000 0000

        EIS                                     ; 5EA4   0002
        ADDR    R1,     R7                      ; 5EA5   00CF

        DECLE   $0000,  $03DC,  $0013,  $0000   ; 5EA6   0000 03DC 0013 0000
        DECLE   $0000,  $0002,  $00D3,  $0000   ; 5EAA   0000 0002 00D3 0000
        DECLE   $03DC,  $0013,  $0000,  $0000   ; 5EAE   03DC 0013 0000 0000

        EIS                                     ; 5EB2   0002
        ADDR    R2,     R7                      ; 5EB3   00D7

        DECLE   $0000                           ; 5EB4   0000

        PSHR    R5                              ; 5EB5   0275
        MVI     G_0183, R0                      ; 5EB6   0280 0183
        SWAP    R0,     2                       ; 5EB8   0044
        BMI     L_5F1C                          ; 5EB9   020B 0061

        MVI     G_017C, R0                      ; 5EBB   0280 017C
        TSTR    R0                              ; 5EBD   0080
        BNEQ    L_5ED7                          ; 5EBE   020C 0017

        MVII    #$011F, R2                      ; 5EC0   02BA 011F
        MVII    #$031E, R3                      ; 5EC2   02BB 031E

        JSR     R5,     L_5ED8                  ; 5EC4   0004 015C 02D8

        INCR    R2                              ; 5EC7   000A
        MVII    #$033E, R3                      ; 5EC8   02BB 033E

        JSR     R5,     L_5ED8                  ; 5ECA   0004 015C 02D8

        MVII    #$032E, R1                      ; 5ECD   02B9 032E

        JSR     R5,     L_603C                  ; 5ECF   0004 0160 003C

        MVII    #$034E, R1                      ; 5ED2   02B9 034E

        JSR     R5,     L_603C                  ; 5ED4   0004 0160 003C

L_5ED7:
        PULR    R7                              ; 5ED7   02B7

L_5ED8:
        PSHR    R5                              ; 5ED8   0275
        SDBD                                    ; 5ED9   0001
        MVII    #$5E99, R4                      ; 5EDA   02BC 0099 005E
        MOVR    R4,     R5                      ; 5EDD   00A5
        ADDI    #$0007, R5                      ; 5EDE   02FD 0007
        MVI     G_017C, R0                      ; 5EE0   0280 017C
        TSTR    R0                              ; 5EE2   0080
        BNEQ    L_5F09                          ; 5EE3   020C 0024

        MVI@    R2,     R0                      ; 5EE5   0290
        ANDI    #$00C0, R0                      ; 5EE6   03B8 00C0
        BNEQ    L_5F09                          ; 5EE8   020C 001F

        MVI@    R2,     R1                      ; 5EEA   0291
        CMPI    #$0004, R1                      ; 5EEB   0379 0004
        BLE     L_5EF3                          ; 5EED   0206 0004

        CMPI    #$000C, R1                      ; 5EEF   0379 000C
        BLE     L_5EF7                          ; 5EF1   0206 0004

L_5EF3:
        ADDI    #$0015, R4                      ; 5EF3   02FC 0015
        ADDI    #$0007, R5                      ; 5EF5   02FD 0007
L_5EF7:
        PSHR    R3                              ; 5EF7   0273
        MVII    #$0019, R0                      ; 5EF8   02B8 0019
        PSHR    R5                              ; 5EFA   0275

        JSR     R5,     .EXEC.629               ; 5EFB   0004 0114 0229

        PULR    R5                              ; 5EFE   02B5
        ADDI    #$0004, R3                      ; 5EFF   02FB 0004
        MVI@    R3,     R1                      ; 5F01   0299
        ANDI    #$000F, R1                      ; 5F02   03B9 000F
        XORI    #$03F0, R1                      ; 5F04   03F9 03F0
        PULR    R3                              ; 5F06   02B3
        B       L_5F0F                          ; 5F07   0200 0006

L_5F09:
        CLRR    R0                              ; 5F09   01C0
        CLRR    R1                              ; 5F0A   01C9
        ADDI    #$0008, R3                      ; 5F0B   02FB 0008
        B       L_5F13                          ; 5F0D   0200 0004

L_5F0F:
        MVO@    R4,     R3                      ; 5F0F   025C
        ADDI    #$0008, R3                      ; 5F10   02FB 0008
        MVO@    R5,     R3                      ; 5F12   025D
L_5F13:
        ADDI    #$0004, R3                      ; 5F13   02FB 0004
        MVO@    R1,     R3                      ; 5F15   0259
        SUBI    #$0008, R3                      ; 5F16   033B 0008
        MVO@    R1,     R3                      ; 5F18   0259
        SUBI    #$0001, R3                      ; 5F19   033B 0001
        MVO@    R0,     R3                      ; 5F1B   0258
L_5F1C:
        PULR    R7                              ; 5F1C   02B7

        PSHR    R5                              ; 5F1D   0275
        MVI     G_0177, R0                      ; 5F1E   0280 0177
        DECR    R0                              ; 5F20   0010
        BMI     L_5F5C                          ; 5F21   020B 0039

        MVO     R0,     G_0177                  ; 5F23   0240 0177
L_5F25:
        MVII    #$0008, R0                      ; 5F25   02B8 0008

        JSR     R5,     X_RAND2                 ; 5F27   0004 0114 029E

        MOVR    R0,     R1                      ; 5F2A   0081
        MVII    #$0009, R0                      ; 5F2B   02B8 0009

        JSR     R5,     X_RAND2                 ; 5F2D   0004 0114 029E

        ADDR    R0,     R0                      ; 5F30   00C0
        INCR    R0                              ; 5F31   0008
        MOVR    R1,     R2                      ; 5F32   008A
        ANDI    #$0001, R2                      ; 5F33   03BA 0001
        BEQ     L_5F38                          ; 5F35   0204 0001

        INCR    R0                              ; 5F37   0008
L_5F38:
        SLL     R1,     2                       ; 5F38   004D
        PSHR    R1                              ; 5F39   0271
        SLL     R1,     2                       ; 5F3A   004D
        ADD@    R6,     R1                      ; 5F3B   02F1
        ADDR    R0,     R1                      ; 5F3C   00C1
        ADDI    #$0200, R1                      ; 5F3D   02F9 0200
        MVI@    R1,     R0                      ; 5F3F   0288
        SDBD                                    ; 5F40   0001
        ANDI    #$07F8, R0                      ; 5F41   03B8 00F8 0007
        BNEQ    L_5F25                          ; 5F44   022C 0020

        CMPI    #$0207, R1                      ; 5F46   0379 0207
        BEQ     L_5F25                          ; 5F48   0224 0024

        JSR     R5,     L_5532                  ; 5F4A   0004 0154 0132

        ADDI    #$0041, R0                      ; 5F4D   02F8 0041
        SLL     R0,     2                       ; 5F4F   004C
        ADDR    R0,     R0                      ; 5F50   00C0
        PSHR    R0                              ; 5F51   0270
L_5F52:
        MVII    #$0003, R0                      ; 5F52   02B8 0003

        JSR     R5,     X_RAND1                 ; 5F54   0004 0114 027D

        TSTR    R0                              ; 5F57   0080
        BEQ     L_5F52                          ; 5F58   0224 0007

        XOR@    R6,     R0                      ; 5F5A   03F0
        MVO@    R0,     R1                      ; 5F5B   0248
L_5F5C:
        PULR    R7                              ; 5F5C   02B7

L_5F5D:
        PSHR    R5                              ; 5F5D   0275
        MVI     G_0181, R0                      ; 5F5E   0280 0181
        MVII    #$0001, R3                      ; 5F60   02BB 0001
        MVII    #$0003, R1                      ; 5F62   02B9 0003
        MVII    #$02A1, R4                      ; 5F64   02BC 02A1

        JSR     R5,     X_PRNUM_RGT             ; 5F66   0004 0118 00C5

        MVI     G_0183, R0                      ; 5F69   0280 0183
        TSTR    R0                              ; 5F6B   0080
        BEQ     L_5F1C                          ; 5F6C   0224 0051

        MVI     G_0182, R0                      ; 5F6E   0280 0182
        MVII    #$0007, R3                      ; 5F70   02BB 0007
        MVII    #$02B0, R4                      ; 5F72   02BC 02B0
        J       .EXEC.89F                       ; 5F74   0004 0318 009F

        DECLE   $0000,  $0000                   ; 5F77   0000 0000

        SARC    R2,     2                       ; 5F79   007E
        SLR     R0,     1                       ; 5F7A   0060
        MOVR    R0,     R1                      ; 5F7B   0081
        SLLC    R3,     2                       ; 5F7C   005F
        MOVR    R0,     R1                      ; 5F7D   0081
        SLLC    R3,     2                       ; 5F7E   005F
        MOVR    R0,     R1                      ; 5F7F   0081
        SLLC    R3,     2                       ; 5F80   005F
        PSHR    R5                              ; 5F81   0275
        MOVR    R1,     R3                      ; 5F82   008B
        SLL     R1,     2                       ; 5F83   004D
        SLL     R1,     2                       ; 5F84   004D
        SLL     R1,     1                       ; 5F85   0049
        ADDI    #$0328, R1                      ; 5F86   02F9 0328
        MVI@    R1,     R2                      ; 5F88   028A
        SWAP    R2,     1                       ; 5F89   0042
        ANDI    #$00FF, R2                      ; 5F8A   03BA 00FF
        SUBI    #$0004, R2                      ; 5F8C   033A 0004
        SLR     R2,     1                       ; 5F8E   0062
        SLR     R2,     2                       ; 5F8F   0066
        SLL     R2,     2                       ; 5F90   004E
        PSHR    R2                              ; 5F91   0272
        SLL     R2,     2                       ; 5F92   004E
        ADD@    R6,     R2                      ; 5F93   02F2
        DECR    R1                              ; 5F94   0011
        MVI@    R1,     R0                      ; 5F95   0288
        SWAP    R0,     1                       ; 5F96   0040
        ANDI    #$00FF, R0                      ; 5F97   03B8 00FF
        SLR     R0,     2                       ; 5F99   0064
        SLR     R0,     1                       ; 5F9A   0060
        DECR    R0                              ; 5F9B   0010
        ADDR    R0,     R2                      ; 5F9C   00C2
        ADDI    #$0006, R1                      ; 5F9D   02F9 0006

        JSR     R5,     .EXEC.760               ; 5F9F   0004 0114 0360

        BNEQ    L_5FE8                          ; 5FA2   020C 0044

        CMPI    #$00A0, R2                      ; 5FA4   037A 00A0
        BGE     L_5FE7                          ; 5FA6   020D 003F

        ADDI    #$0200, R2                      ; 5FA8   02FA 0200
        MVI@    R2,     R0                      ; 5FAA   0290
        SLR     R0,     2                       ; 5FAB   0064
        SLR     R0,     1                       ; 5FAC   0060
        ANDI    #$01FF, R0                      ; 5FAD   03B8 01FF
        SUBI    #$0041, R0                      ; 5FAF   0338 0041
        BMI     L_5FE7                          ; 5FB1   020B 0034

        CMPI    #$001A, R0                      ; 5FB3   0378 001A
        BGE     L_5FE7                          ; 5FB5   020D 0030

        PSHR    R0                              ; 5FB7   0270
        CLRR    R0                              ; 5FB8   01C0
        MVO@    R0,     R2                      ; 5FB9   0250
        MVI     G_0177, R0                      ; 5FBA   0280 0177
        INCR    R0                              ; 5FBC   0008
        MVO     R0,     G_0177                  ; 5FBD   0240 0177
        MOVR    R1,     R2                      ; 5FBF   008A
        SDBD                                    ; 5FC0   0001
        MVII    #$5ADD, R1                      ; 5FC1   02B9 00DD 005A

        JSR     R5,     X_INIT_MOB              ; 5FC4   0004 0114 02B2

        SDBD                                    ; 5FC7   0001
        MVII    #$10A0, R0                      ; 5FC8   02B8 00A0 0010
        MOVR    R2,     R1                      ; 5FCB   0091
        SUBI    #$0008, R2                      ; 5FCC   033A 0008
        MVI@    R2,     R3                      ; 5FCE   0293
        ANDI    #$0007, R3                      ; 5FCF   03BB 0007
        XORR    R3,     R0                      ; 5FD1   01D8
        MVO@    R0,     R1                      ; 5FD2   0248

        JSR     R5,     .EXEC.766               ; 5FD3   0004 0114 0366
        JSR     R5,     .EXEC.6CF               ; 5FD6   0004 0114 02CF

        ADDI    #$0007, R1                      ; 5FD9   02F9 0007
        PULR    R0                              ; 5FDB   02B0
        MVO@    R0,     R1                      ; 5FDC   0248
        SUBI    #$0006, R1                      ; 5FDD   0339 0006
        PSHR    R1                              ; 5FDF   0271

        JSR     R5,     L_5B08                  ; 5FE0   0004 0158 0308

        PULR    R1                              ; 5FE3   02B1

        JSR     R5,     L_603C                  ; 5FE4   0004 0160 003C

L_5FE7:
        PULR    R7                              ; 5FE7   02B7

L_5FE8:
        ADDI    #$0002, R1                      ; 5FE8   02F9 0002
        ADDI    #$0178, R3                      ; 5FEA   02FB 0178
        MVI@    R3,     R0                      ; 5FEC   0298
        CMPI    #$00F0, R0                      ; 5FED   0378 00F0
        BGE     L_60CE                          ; 5FEF   020D 00DD

        CMPI    #$00B4, R2                      ; 5FF1   037A 00B4
        BLT     L_60CE                          ; 5FF3   0205 00D9

        MVI@    R1,     R0                      ; 5FF5   0288
        CLRR    R2                              ; 5FF6   01D2
        SDBD                                    ; 5FF7   0001
        CMPI    #$5400, R0                      ; 5FF8   0378 0000 0054
        BC      L_6003                          ; 5FFB   0201 0006

        CMPI    #$032F, R1                      ; 5FFD   0379 032F
        BEQ     L_6008                          ; 5FFF   0204 0007
        B       L_60CE                          ; 6001   0200 00CB

L_6003:
        CMPI    #$034F, R1                      ; 6003   0379 034F
        BNEQ    L_60CE                          ; 6005   020C 00C7

        INCR    R2                              ; 6007   000A
L_6008:
        MOVR    R2,     R3                      ; 6008   0093
        ADDI    #$0178, R2                      ; 6009   02FA 0178
        ADDI    #$017A, R3                      ; 600B   02FB 017A
        PSHR    R2                              ; 600D   0272
        MVI@    R2,     R2                      ; 600E   0292
        ADD@    R3,     R2                      ; 600F   02DA
        ADDI    #$0200, R2                      ; 6010   02FA 0200
        ADDI    #$0005, R1                      ; 6012   02F9 0005
        MVI@    R1,     R0                      ; 6014   0288
        SLL     R0,     2                       ; 6015   004C
        SLL     R0,     1                       ; 6016   0048
        SUBI    #$0007, R1                      ; 6017   0339 0007
        MVI@    R1,     R4                      ; 6019   028C
        ANDI    #$0007, R4                      ; 601A   03BC 0007
        XORR    R4,     R0                      ; 601C   01E0
        ADDI    #$0208, R0                      ; 601D   02F8 0208
        MVO@    R0,     R2                      ; 601F   0250
        PULR    R2                              ; 6020   02B2
        MVI@    R3,     R0                      ; 6021   0298
        INCR    R0                              ; 6022   0008
        CMPI    #$0008, R0                      ; 6023   0378 0008
        BLT     L_602C                          ; 6025   0205 0005

        MVI@    R2,     R4                      ; 6027   0294
        ADDI    #$0014, R4                      ; 6028   02FC 0014
        CLRR    R0                              ; 602A   01C0
        MVO@    R4,     R2                      ; 602B   0254
L_602C:
        MVO@    R0,     R3                      ; 602C   0258
        PSHR    R1                              ; 602D   0271

        JSR     R5,     L_6056                  ; 602E   0004 0160 0056

        PULR    R1                              ; 6031   02B1

        JSR     R5,     .EXEC.766               ; 6032   0004 0114 0366
        JSR     R5,     .EXEC.6D5               ; 6035   0004 0114 02D5
        JSR     R5,     .EXEC.7AE               ; 6038   0004 0114 03AE

        PULR    R7                              ; 603B   02B7

L_603C:
        MVI@    R1,     R0                      ; 603C   0288
        TSTR    R0                              ; 603D   0080
        BEQ     L_6055                          ; 603E   0204 0015

        MOVR    R1,     R2                      ; 6040   008A
        SUBI    #$0010, R2                      ; 6041   033A 0010
        SDBD                                    ; 6043   0001
        MVII    #$05FA, R3                      ; 6044   02BB 00FA 0005
        ADDI    #$0003, R1                      ; 6047   02F9 0003
        MVI@    R2,     R0                      ; 6049   0290
        SDBD                                    ; 604A   0001
        CMPI    #$5E99, R0                      ; 604B   0378 0099 005E
        BEQ     L_6054                          ; 604E   0204 0004

        SDBD                                    ; 6050   0001
        MVII    #$F3FA, R3                      ; 6051   02BB 00FA 00F3
L_6054:
        MVO@    R3,     R1                      ; 6054   024B
L_6055:
        MOVR    R5,     R7                      ; 6055   00AF

L_6056:
        PSHR    R5                              ; 6056   0275
L_6057:
        MVI@    R2,     R5                      ; 6057   0295
        CMPI    #$00F0, R5                      ; 6058   037D 00F0
        BGE     L_606B                          ; 605A   020D 000F

        ADD@    R3,     R5                      ; 605C   02DD
        ADDI    #$0200, R5                      ; 605D   02FD 0200
        MVII    #$0001, R0                      ; 605F   02B8 0001
        CMPI    #$0178, R2                      ; 6061   037A 0178
        BEQ     L_6067                          ; 6063   0204 0002

        MVII    #$0007, R0                      ; 6065   02B8 0007
L_6067:
        XORI    #$02F8, R0                      ; 6067   03F8 02F8
        MVO@    R0,     R5                      ; 6069   0268
        PULR    R7                              ; 606A   02B7

L_606B:
        MVI     G_0183, R5                      ; 606B   0285 0183
        TSTR    R5                              ; 606D   00AD
        BEQ     L_607B                          ; 606E   0204 000B

        SUBI    #$0178, R2                      ; 6070   033A 0178
        XORI    #$0001, R2                      ; 6072   03FA 0001
        ADDI    #$0178, R2                      ; 6074   02FA 0178
        MVI@    R2,     R0                      ; 6076   0290
        CMPI    #$00F0, R0                      ; 6077   0378 00F0
        BLT     L_5FE7                          ; 6079   0225 0093
L_607B:
        J       L_613F                          ; 607B   0004 0360 013F

        PSHR    R5                              ; 607E   0275
        MOVR    R1,     R2                      ; 607F   008A
        MOVR    R2,     R3                      ; 6080   0093
        ADDI    #$0178, R2                      ; 6081   02FA 0178
        ADDI    #$017A, R3                      ; 6083   02FB 017A
        CMPI    #$000B, R0                      ; 6085   0378 000B
        BNEQ    L_609D                          ; 6087   020C 0014

        MVI@    R3,     R1                      ; 6089   0299
        TSTR    R1                              ; 608A   0089
        BEQ     L_5FE7                          ; 608B   0224 00A5

        ADD@    R2,     R1                      ; 608D   02D1
        ADDI    #$0200, R1                      ; 608E   02F9 0200
        CLRR    R0                              ; 6090   01C0
        MVO@    R0,     R1                      ; 6091   0248
        MVO@    R0,     R3                      ; 6092   0258
        MVI@    R2,     R0                      ; 6093   0290
        ADDI    #$0014, R0                      ; 6094   02F8 0014
        MVO@    R0,     R2                      ; 6096   0250

        JSR     R5,     L_6056                  ; 6097   0004 0160 0056

        J       L_6355                          ; 609A   0004 0360 0355

L_609D:
        CMPI    #$000A, R0                      ; 609D   0378 000A
        BNEQ    L_5FE7                          ; 609F   022C 00B9

        MVI@    R2,     R1                      ; 60A1   0291
        ADD@    R3,     R1                      ; 60A2   02D9
        ADDI    #$0200, R1                      ; 60A3   02F9 0200
        CMPI    #$02B5, R1                      ; 60A5   0379 02B5
        BEQ     L_5FE7                          ; 60A7   0224 00C1

        CMPI    #$02BF, R1                      ; 60A9   0379 02BF
        BEQ     L_5FE7                          ; 60AB   0224 00C5

        CMPI    #$02F0, R1                      ; 60AD   0379 02F0
        BGE     L_60B3                          ; 60AF   020D 0002

        CLRR    R0                              ; 60B1   01C0
        MVO@    R0,     R1                      ; 60B2   0248
L_60B3:
        MVI@    R3,     R0                      ; 60B3   0298
        TSTR    R0                              ; 60B4   0080
        BNEQ    L_60C9                          ; 60B5   020C 0012

        SUBI    #$0014, R1                      ; 60B7   0339 0014
L_60B9:
        MVI@    R1,     R5                      ; 60B9   028D
        TSTR    R5                              ; 60BA   00AD
        BEQ     L_60C1                          ; 60BB   0204 0004

        INCR    R0                              ; 60BD   0008
        INCR    R1                              ; 60BE   0009
        B       L_60B9                          ; 60BF   0220 0007

L_60C1:
        MVI@    R2,     R5                      ; 60C1   0295
        SUBI    #$0014, R5                      ; 60C2   033D 0014
        MVO@    R5,     R2                      ; 60C4   0255
        CMPI    #$0008, R0                      ; 60C5   0378 0008
        BNEQ    L_60CA                          ; 60C7   020C 0001

L_60C9:
        DECR    R0                              ; 60C9   0010
L_60CA:
        MVO@    R0,     R3                      ; 60CA   0258
        J       L_6057                          ; 60CB   0004 0360 0057

L_60CE:
        SUBI    #$0008, R1                      ; 60CE   0339 0008

        JSR     R5,     L_60F2                  ; 60D0   0004 0160 00F2
        DECLE   $0000,  $0050                   ; 60D3   0000 0050

        SLR     R0,     1                       ; 60D5   0060
        BNC     L_5FE7                          ; 60D6   0229 00F0

        INCR    R1                              ; 60D8   0009

        JSR     R5,     L_60F2                  ; 60D9   0004 0160 00F2
        DECLE   $0004,  $0040                   ; 60DC   0004 0040

        SLL     R0,     1                       ; 60DE   0048
        BNC     L_5FE7                          ; 60DF   0229 00F9

        ADDI    #$0005, R1                      ; 60E1   02F9 0005

        JSR     R5,     .EXEC.760               ; 60E3   0004 0114 0360

        BEQ     L_5FE7                          ; 60E6   0224 0100

        JSR     R5,     .EXEC.766               ; 60E8   0004 0114 0366
        JSR     R5,     .EXEC.6D5               ; 60EB   0004 0114 02D5
        JSR     R5,     .EXEC.7AE               ; 60EE   0004 0114 03AE

        PULR    R7                              ; 60F1   02B7

L_60F2:
        MVI@    R1,     R0                      ; 60F2   0288
        SWAP    R0,     1                       ; 60F3   0040
        ANDI    #$00FF, R0                      ; 60F4   03B8 00FF
        ADD@    R5,     R0                      ; 60F6   02E8
        CMP@    R5,     R0                      ; 60F7   0368
        BLT     L_60FF                          ; 60F8   0205 0005

        CMP@    R5,     R0                      ; 60FA   0368
        BGT     L_6100                          ; 60FB   020E 0003

        SETC                                    ; 60FD   0007
        MOVR    R5,     R7                      ; 60FE   00AF

L_60FF:
        INCR    R5                              ; 60FF   000D
L_6100:
        CLRC                                    ; 6100   0006
        MOVR    R5,     R7                      ; 6101   00AF

L_6102:
        PSHR    R5                              ; 6102   0275
        MVI     G_017C, R0                      ; 6103   0280 017C
        TSTR    R0                              ; 6105   0080
        BNEQ    L_613D                          ; 6106   020C 0035

        MVI     G_017D, R0                      ; 6108   0280 017D
        MVI     G_017E, R1                      ; 610A   0281 017E
        DECR    R1                              ; 610C   0011
        BNEQ    L_611B                          ; 610D   020C 000C

        TSTR    R0                              ; 610F   0080
        BNEQ    L_611B                          ; 6110   020C 0009

        PSHR    R0                              ; 6112   0270
        PSHR    R1                              ; 6113   0271

        JSR     R5,     L_613E                  ; 6114   0004 0160 013E

        PULR    R0                              ; 6117   02B0
        PULR    R1                              ; 6118   02B1
        B       L_6122                          ; 6119   0200 0007
L_611B:
        BPL     L_6120                          ; 611B   0203 0003

        DECR    R0                              ; 611D   0010
        MVII    #$003B, R1                      ; 611E   02B9 003B
L_6120:
        MVO     R0,     G_017D                  ; 6120   0240 017D
L_6122:
        MVO     R1,     G_017E                  ; 6122   0241 017E
        PSHR    R1                              ; 6124   0271
        MVII    #$0003, R3                      ; 6125   02BB 0003
        MVII    #$0001, R1                      ; 6127   02B9 0001
        MVII    #$0208, R4                      ; 6129   02BC 0208

        JSR     R5,     X_PRNUM_LFT             ; 612B   0004 0118 009E

        INCR    R4                              ; 612E   000C

        JSR     R5,     X_PRINT_R5              ; 612F   0004 0118 007B
        STRING  ":"                             ; 6132   003A
        DECLE   $0000                           ; 6133   0000

        MVII    #$0002, R1                      ; 6134   02B9 0002
        PULR    R0                              ; 6136   02B0

        JSR     R5,     X_PRNUM_ZRO             ; 6137   0004 0118 00AD
        JSR     R5,     .EXEC.607               ; 613A   0004 0114 0207

L_613D:
        PULR    R7                              ; 613D   02B7

L_613E:
        PSHR    R5                              ; 613E   0275
L_613F:
        MVII    #$0002, R0                      ; 613F   02B8 0002

        JSR     R5,     .EXEC.6D5               ; 6141   0004 0114 02D5

        MVII    #$0006, R0                      ; 6144   02B8 0006

        JSR     R5,     .EXEC.6D5               ; 6146   0004 0114 02D5

        CLRR    R0                              ; 6149   01C0
        MVII    #$031E, R3                      ; 614A   02BB 031E
L_614C:
        MVO@    R0,     R3                      ; 614C   0258
        ADDI    #$0008, R3                      ; 614D   02FB 0008
        CMPI    #$0356, R3                      ; 614F   037B 0356
        BLT     L_614C                          ; 6151   0225 0006

        MVII    #$0001, R0                      ; 6153   02B8 0001
        MVO     R0,     G_017C                  ; 6155   0240 017C
        MVII    #$000A, R0                      ; 6157   02B8 000A

        JSR     R5,     X_PLAY_RAZZ4            ; 6159   0004 011C 02C4

        MVII    #$0178, R2                      ; 615C   02BA 0178
        MVII    #$017A, R3                      ; 615E   02BB 017A
        MVI     G_0183, R4                      ; 6160   0284 0183
L_6162:
        MVI@    R2,     R1                      ; 6162   0291
        CMPI    #$00F0, R1                      ; 6163   0379 00F0
        BGE     L_616C                          ; 6165   020D 0005

        ADD@    R3,     R1                      ; 6167   02D9
        ADDI    #$0200, R1                      ; 6168   02F9 0200
        CLRR    R0                              ; 616A   01C0
        MVO@    R0,     R1                      ; 616B   0248
L_616C:
        INCR    R2                              ; 616C   000A
        INCR    R3                              ; 616D   000B
        DECR    R4                              ; 616E   0014
        BPL     L_6162                          ; 616F   0223 000E

        SDBD                                    ; 6171   0001
        MVII    #$1906, R0                      ; 6172   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6175   0240 035D

        JSR     R5,     .EXEC.A61               ; 6177   0004 0118 0261

        ADCR    R0                              ; 617A   0028
        SDBD                                    ; 617B   0001
        MVII    #$619A, R0                      ; 617C   02B8 009A 0061
        MVO     R0,     G_035D                  ; 617F   0240 035D
        MVII    #$00A9, R0                      ; 6181   02B8 00A9
        MVO     R0,     G_017F                  ; 6183   0240 017F

        JSR     R5,     L_6289                  ; 6185   0004 0160 0289

        MVII    #$0001, R1                      ; 6188   02B9 0001
        MVII    #$0007, R2                      ; 618A   02BA 0007
        MVO     R2,     G_0184                  ; 618C   0242 0184
        MVO     R1,     G_0185                  ; 618E   0241 0185
        MVI     G_0183, R0                      ; 6190   0280 0183
        TSTR    R0                              ; 6192   0080
        BNEQ    L_6197                          ; 6193   020C 0002

        MVO     R1,     G_0184                  ; 6195   0241 0184
L_6197:
        J       L_61EB                          ; 6197   0004 0360 01EB

        DECLE   $0000,  $0000,  $00A4,  $0061   ; 619A   0000 0000 00A4 0061
        DECLE   $0000,  $0000,  $0000,  $0000   ; 619E   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 61A2   0000 0000

        PSHR    R5                              ; 61A4   0275
        MVI     G_017F, R2                      ; 61A5   0282 017F
        SARC    R2,     1                       ; 61A7   007A
        MOVR    R1,     R3                      ; 61A8   008B
        ADCR    R3                              ; 61A9   002B
        CMPI    #$000A, R0                      ; 61AA   0378 000A
        BEQ     L_61CB                          ; 61AC   0204 001D

        CMPI    #$000B, R0                      ; 61AE   0378 000B
        BNEQ    L_613D                          ; 61B0   022C 0074

        MVI     G_0183, R5                      ; 61B2   0285 0183
        TSTR    R5                              ; 61B4   00AD
        BEQ     L_61BA                          ; 61B5   0204 0003

        DECR    R3                              ; 61B7   0013
        BEQ     L_613D                          ; 61B8   0224 007C

L_61BA:
        PSHR    R1                              ; 61BA   0271

        JSR     R5,     L_6271                  ; 61BB   0004 0160 0271

        PULR    R1                              ; 61BE   02B1
        XOR     G_0183, R1                      ; 61BF   03C1 0183
        ADDI    #$0181, R1                      ; 61C1   02F9 0181
        ADD@    R1,     R4                      ; 61C3   02CC
        MVO@    R4,     R1                      ; 61C4   024C

        JSR     R5,     L_61E2                  ; 61C5   0004 0160 01E2

        J       L_5402                          ; 61C8   0004 0354 0002

L_61CB:
        MVI     G_0183, R5                      ; 61CB   0285 0183
        TSTR    R5                              ; 61CD   00AD
        BEQ     L_61D3                          ; 61CE   0204 0003

        DECR    R3                              ; 61D0   0013
        BNEQ    L_613D                          ; 61D1   022C 0095

L_61D3:
        SLL     R1,     1                       ; 61D3   0049
        DECR    R1                              ; 61D4   0011
        MVI     G_017F, R2                      ; 61D5   0282 017F
        ADDI    #$0200, R2                      ; 61D7   02FA 0200
        MVII    #$0008, R3                      ; 61D9   02BB 0008
        CLRR    R0                              ; 61DB   01C0
L_61DC:
        ADDR    R1,     R2                      ; 61DC   00CA
        MVO@    R0,     R2                      ; 61DD   0250
        DECR    R3                              ; 61DE   0013
        BNEQ    L_61DC                          ; 61DF   022C 0004
        INCR    R7                              ; 61E1   000F

L_61E2:
        PSHR    R5                              ; 61E2   0275
L_61E3:
        MVI     G_017F, R1                      ; 61E3   0281 017F
        ADDI    #$0200, R1                      ; 61E5   02F9 0200
        CLRR    R0                              ; 61E7   01C0
        MVO@    R0,     R1                      ; 61E8   0248
        INCR    R7                              ; 61E9   000F

        PSHR    R5                              ; 61EA   0275
L_61EB:
        MVI     G_017F, R1                      ; 61EB   0281 017F
        ADDI    #$0014, R1                      ; 61ED   02F9 0014
        SDBD                                    ; 61EF   0001
        MVII    #$0852, R0                      ; 61F0   02B8 0052 0008
        CMPI    #$00FA, R1                      ; 61F3   0379 00FA
        BEQ     L_623B                          ; 61F5   0204 0044

        CMPI    #$00F9, R1                      ; 61F7   0379 00F9
        BNEQ    L_6205                          ; 61F9   020C 000A

        MVII    #$00BE, R1                      ; 61FB   02B9 00BE
        MVI     G_0184, R4                      ; 61FD   0284 0184
        MVI     G_0185, R5                      ; 61FF   0285 0185
        MVO     R5,     G_0184                  ; 6201   0245 0184
        MVO     R4,     G_0185                  ; 6203   0244 0185
L_6205:
        PSHR    R1                              ; 6205   0271
        SARC    R1,     1                       ; 6206   0079
        BC      L_620D                          ; 6207   0201 0004

        SDBD                                    ; 6209   0001
        MVII    #$085A, R0                      ; 620A   02B8 005A 0008
L_620D:
        PULR    R1                              ; 620D   02B1
        MVO     R1,     G_017F                  ; 620E   0241 017F
        PSHR    R0                              ; 6210   0270

        JSR     R5,     L_6271                  ; 6211   0004 0160 0271

        PULR    R0                              ; 6214   02B0
        TSTR    R4                              ; 6215   00A4
        BEQ     L_61EB                          ; 6216   0224 002C

        MVI     G_017F, R1                      ; 6218   0281 017F
        ADDI    #$0200, R1                      ; 621A   02F9 0200
        MVO@    R0,     R1                      ; 621C   0248
        MVI     G_0184, R3                      ; 621D   0283 0184
        MVII    #$02A3, R4                      ; 621F   02BC 02A3

        JSR     R5,     X_PRINT_R5              ; 6221   0004 0118 007B
        STRING  "OK? E=Yes"                     ; 6224  
        DECLE   $0000                           ; 622D   0000

        MVI     G_0185, R3                      ; 622E   0283 0185
        MVII    #$02AD, R4                      ; 6230   02BC 02AD

        JSR     R5,     X_PRINT_R5              ; 6232   0004 0118 007B
        STRING  "C=No"                          ; 6235   0043 003D 004E 006F
        DECLE   $0000                           ; 6239   0000

        PULR    R7                              ; 623A   02B7

L_623B:
        JSR     R5,     L_6289                  ; 623B   0004 0160 0289
        JSR     R5,     L_5F5D                  ; 623E   0004 015C 035D

        MVI     G_0180, R0                      ; 6241   0280 0180
        CMPI    #$0005, R0                      ; 6243   0378 0005
        BEQ     L_6254                          ; 6245   0204 000D

        SDBD                                    ; 6247   0001
        MVII    #$1906, R0                      ; 6248   02B8 0006 0019
        MVO     R0,     G_035D                  ; 624B   0240 035D

        JSR     R5,     .EXEC.A61               ; 624D   0004 0118 0261

        ADCR    R0                              ; 6250   0028
        J       L_5DCB                          ; 6251   0004 035C 01CB

L_6254:
        JSR     R5,     L_6289                  ; 6254   0004 0160 0289
        JSR     R5,     L_5F5D                  ; 6257   0004 015C 035D

        MVII    #$0007, R3                      ; 625A   02BB 0007
        MVII    #$02A6, R4                      ; 625C   02BC 02A6

        JSR     R5,     X_PRINT_R5              ; 625E   0004 0118 007B
        STRING  "Game Over"                     ; 6261  
        DECLE   $0000                           ; 626A   0000

        JSR     R5,     L_6354                  ; 626B   0004 0160 0354

        J       L_53EA                          ; 626E   0004 0350 03EA

L_6271:
        CLRR    R4                              ; 6271   01E4
        MVI     G_017F, R1                      ; 6272   0281 017F
        MVII    #$0001, R2                      ; 6274   02BA 0001
        MVII    #$0008, R3                      ; 6276   02BB 0008
        MOVR    R1,     R0                      ; 6278   0088
        SARC    R0,     1                       ; 6279   0078
        BNC     L_627D                          ; 627A   0209 0001

        NEGR    R2                              ; 627C   0022
L_627D:
        ADDI    #$0200, R1                      ; 627D   02F9 0200
L_627F:
        ADDR    R2,     R1                      ; 627F   00D1
        MVI@    R1,     R0                      ; 6280   0288
        TSTR    R0                              ; 6281   0080
        BEQ     L_6285                          ; 6282   0204 0001

        INCR    R4                              ; 6284   000C
L_6285:
        DECR    R3                              ; 6285   0013
        BNEQ    L_627F                          ; 6286   022C 0008
        MOVR    R5,     R7                      ; 6288   00AF

L_6289:
        MVII    #$02A1, R4                      ; 6289   02BC 02A1
        MVII    #$0013, R0                      ; 628B   02B8 0013
        J       X_FILL_ZERO                     ; 628D   0004 0314 0338

L_6290:
        PSHR    R5                              ; 6290   0275

        JSR     R5,     X_PLAY_SFX2             ; 6291   0004 0118 03BE
        DECLE   $0082                           ; 6294  SFX prio
        DECLE   $0389                           ; 6295  SFX data
        DECLE   $0054,  $0000                   ; 6296  SFX data
        DECLE   $03DB                           ; 6298  SFX data
        DECLE   $03DB                           ; 6299  SFX data
        DECLE   $0040,  $0080                   ; 629A  SFX data
        DECLE   $0048,  $0080                   ; 629C  SFX data
        DECLE   $021B                           ; 629E  SFX data
        DECLE   $021B                           ; 629F  SFX data
        DECLE   $010C,  $0000                   ; 62A0  SFX data
        DECLE   $000B                           ; 62A2  SFX data
        DECLE   $008F,  $003B                   ; 62A3  SFX data
        DECLE   $03CF                           ; 62A5  SFX end


        PSHR    R5                              ; 62A6   0275
        MVII    #$0007, R0                      ; 62A7   02B8 0007

        JSR     R5,     X_RAND2                 ; 62A9   0004 0114 029E

        CMPI    #$0003, R0                      ; 62AC   0378 0003
        BGT     L_6353                          ; 62AE   020E 00A3

        SDBD                                    ; 62B0   0001
        MVII    #$62B6, R1                      ; 62B1   02B9 00B6 0062
        ADDR    R0,     R1                      ; 62B4   00C1
        ADD@    R1,     R7                      ; 62B5   02CF

        DECLE   $0004                           ; 62B6   0004

        ADCR    R1                              ; 62B7   0029
        RLC     R0,     2                       ; 62B8   0054
        RRC     R0,     2                       ; 62B9   0074

        JSR     R5,     X_PLAY_SFX1             ; 62BA   0004 0118 03BB
        DECLE   $0389                           ; 62BD  SFX data
        DECLE   $0200,  $0048                   ; 62BE  SFX data
        DECLE   $0208,  $0049                   ; 62C0  SFX data
        DECLE   $0184,  $0020                   ; 62C2  SFX data
        DECLE   $019B                           ; 62C4  SFX data
        DECLE   $0001,  $000C                   ; 62C5  SFX data
        DECLE   $0001,  $000E                   ; 62C7  SFX data
        DECLE   $0001,  $0009                   ; 62C9  SFX data
        DECLE   $005E                           ; 62CB  SFX data
        DECLE   $00EB                           ; 62CC  SFX data
        DECLE   $0001,  $03F0                   ; 62CD  SFX data
        DECLE   $0001,  $03F2                   ; 62CF  SFX data
        DECLE   $0001,  $03F9                   ; 62D1  SFX data
        DECLE   $01EB                           ; 62D3  SFX data
        DECLE   $0001,  $0008                   ; 62D4  SFX data
        DECLE   $0001,  $000A                   ; 62D6  SFX data
        DECLE   $0001,  $0009                   ; 62D8  SFX data
        DECLE   $03BB                           ; 62DA  SFX data
        DECLE   $03AE                           ; 62DB  SFX data
        DECLE   $036B                           ; 62DC  SFX data
        DECLE   $03F9                           ; 62DD  SFX data
        DECLE   $02CF                           ; 62DE  SFX end


        JSR     R5,     X_PLAY_SFX1             ; 62DF   0004 0118 03BB
        DECLE   $02C0,  $0050                   ; 62E2  SFX data
        DECLE   $01DB                           ; 62E4  SFX data
        DECLE   $0001,  $03F8                   ; 62E5  SFX data
        DECLE   $0042                           ; 62E7  SFX data
        DECLE   $03E9                           ; 62E8  SFX data
        DECLE   $002B                           ; 62E9  SFX data
        DECLE   $02C8,  $0050                   ; 62EA  SFX data
        DECLE   $01DB                           ; 62EC  SFX data
        DECLE   $0001,  $03FA                   ; 62ED  SFX data
        DECLE   $004A                           ; 62EF  SFX data
        DECLE   $03C9                           ; 62F0  SFX data
        DECLE   $002B                           ; 62F1  SFX data
        DECLE   $02C4,  $0050                   ; 62F2  SFX data
        DECLE   $01DB                           ; 62F4  SFX data
        DECLE   $0001,  $03F9                   ; 62F5  SFX data
        DECLE   $0046                           ; 62F7  SFX data
        DECLE   $0389                           ; 62F8  SFX data
        DECLE   $002B                           ; 62F9  SFX data
        DECLE   $012B                           ; 62FA  SFX data
        DECLE   $0001,  $0008                   ; 62FB  SFX data
        DECLE   $03C2                           ; 62FD  SFX data
        DECLE   $002B                           ; 62FE  SFX data
        DECLE   $0001,  $000A                   ; 62FF  SFX data
        DECLE   $03CA                           ; 6301  SFX data
        DECLE   $002B                           ; 6302  SFX data
        DECLE   $0001,  $0009                   ; 6303  SFX data
        DECLE   $03C6                           ; 6305  SFX data
        DECLE   $002B                           ; 6306  SFX data
        DECLE   $03EB                           ; 6307  SFX data
        DECLE   $03F9                           ; 6308  SFX data
        DECLE   $02CF                           ; 6309  SFX end


        JSR     R5,     X_PLAY_SFX1             ; 630A   0004 0118 03BB
        DECLE   $0389                           ; 630D  SFX data
        DECLE   $03C0,  $0048                   ; 630E  SFX data
        DECLE   $03C8,  $004A                   ; 6310  SFX data
        DECLE   $0344,  $0028                   ; 6312  SFX data
        DECLE   $01DB                           ; 6314  SFX data
        DECLE   $004F,  $000A                   ; 6315  SFX data
        DECLE   $0001,  $03F0                   ; 6317  SFX data
        DECLE   $0001,  $03F2                   ; 6319  SFX data
        DECLE   $0001,  $03F9                   ; 631B  SFX data
        DECLE   $002B                           ; 631D  SFX data
        DECLE   $0001,  $0008                   ; 631E  SFX data
        DECLE   $0001,  $000A                   ; 6320  SFX data
        DECLE   $0001,  $0005                   ; 6322  SFX data
        DECLE   $0023,  $03C4                   ; 6324  SFX data
        DECLE   $030E                           ; 6326  SFX data
        DECLE   $00AB                           ; 6327  SFX data
        DECLE   $03F9                           ; 6328  SFX data
        DECLE   $02CF                           ; 6329  SFX end


        JSR     R5,     X_PLAY_SFX2             ; 632A   0004 0118 03BE
        DECLE   $0001                           ; 632D  SFX prio
        DECLE   $0240,  $02C0                   ; 632E  SFX data
        DECLE   $0248,  $02F0                   ; 6330  SFX data
        DECLE   $0244,  $0320                   ; 6332  SFX data
        DECLE   $025B                           ; 6334  SFX data
        DECLE   $0001,  $03D3                   ; 6335  SFX data
        DECLE   $004E                           ; 6337  SFX data
        DECLE   $031D                           ; 6338  SFX data
        DECLE   $0077,  $004E,  $0063           ; 6339  SFX data
        DECLE   $002B                           ; 633C  SFX data
        DECLE   $0309                           ; 633D  SFX data
        DECLE   $0023,  $03E4                   ; 633E  SFX data
        DECLE   $03FE                           ; 6340  SFX data
        DECLE   $0001,  $0043                   ; 6341  SFX data
        DECLE   $017B                           ; 6343  SFX data
        DECLE   $004F,  $0020                   ; 6344  SFX data
        DECLE   $0077,  $004E,  $0063           ; 6346  SFX data
        DECLE   $002B                           ; 6349  SFX data
        DECLE   $0309                           ; 634A  SFX data
        DECLE   $0023,  $03E4                   ; 634B  SFX data
        DECLE   $02CF                           ; 634D  SFX end

UC_634E:
        MVII    #$003F, R0                      ; 634E  SLIB UCALL target
        ADDI    #$0008, R3                      ; 6350   02FB 0008
        MVO@    R0,     R3                      ; 6352   0258
L_6353:
        PULR    R7                              ; 6353   02B7

L_6354:
        PSHR    R5                              ; 6354   0275

L_6355:
        JSR     R5,     X_PLAY_SFX2             ; 6355   0004 0118 03BE
        DECLE   $00FF                           ; 6358  SFX prio
        DECLE   $0077,  $0077,  $0063,  $0189   ; 6359   0077 0077 0063 0189
        DECLE   $004D,  $002C,  $0000           ; 635D   004D 002C 0000

        ANDR    R3,     R5                      ; 6360   019D
        RLC     R0,     1                       ; 6361   0050
        MVI@    R4,     R4                      ; 6362   02A4
        SWAP    R0,     2                       ; 6363   0044
        XOR@    R1,     R0                      ; 6364   03C8
        SLL     R0,     1                       ; 6365   0048
        XOR@    R2,     R0                      ; 6366   03D0
        INCR    R3                              ; 6367   000B
        ADDR    R5,     R3                      ; 6368   00EB
        RLC     R0,     1                       ; 6369   0050
        ADDR    R0,     R0                      ; 636A   00C0
        RLC     R0,     2                       ; 636B   0054
        ADDR    R1,     R0                      ; 636C   00C8
        SLLC    R0,     1                       ; 636D   0058
        ADDR    R2,     R0                      ; 636E   00D0
        INCR    R3                              ; 636F   000B
        SAR     R3,     1                       ; 6370   006B
        INCR    R3                              ; 6371   000B
        SWAP    R3,     1                       ; 6372   0043
        AND@    R6,     R4                      ; 6373   03B4
        XORI    #$002F, R1                      ; 6374   03F9 002F
        ADD@    R1,     R7                      ; 6376   02CF

        MVII    #$0005, R0                      ; 6377   02B8 0005
        MVO     R0,     G_0147                  ; 6379   0240 0147
        PULR    R7                              ; 637B   02B7

L_637C:
        PSHR    R5                              ; 637C   0275

        JSR     R5,     X_PLAY_SFX1             ; 637D   0004 0118 03BB
        DECLE   $002F                           ; 6380  SFX data
        DECLE   $01C9                           ; 6381  SFX data
        DECLE   $004D                           ; 6382  SFX data
        DECLE   $011D                           ; 6383  SFX data
        DECLE   $005D                           ; 6384  SFX data
        DECLE   $0380,  $00D7                   ; 6385  SFX data
        DECLE   $0388,  $00D8                   ; 6387  SFX data
        DECLE   $0315                           ; 6389  SFX data
        DECLE   $006B                           ; 638A  SFX data
        DECLE   $0235                           ; 638B  SFX data
        DECLE   $006B                           ; 638C  SFX data
        DECLE   $0380,  $00AA                   ; 638D  SFX data
        DECLE   $0388,  $00AB                   ; 638F  SFX data
        DECLE   $0315                           ; 6391  SFX data
        DECLE   $006B                           ; 6392  SFX data
        DECLE   $0235                           ; 6393  SFX data
        DECLE   $006B                           ; 6394  SFX data
        DECLE   $0380,  $008F                   ; 6395  SFX data
        DECLE   $0388,  $0090                   ; 6397  SFX data
        DECLE   $0315                           ; 6399  SFX data
        DECLE   $006B                           ; 639A  SFX data
        DECLE   $0235                           ; 639B  SFX data
        DECLE   $006B                           ; 639C  SFX data
        DECLE   $0380,  $006B                   ; 639D  SFX data
        DECLE   $0388,  $006C                   ; 639F  SFX data
        DECLE   $0315                           ; 63A1  SFX data
        DECLE   $006B                           ; 63A2  SFX data
        DECLE   $0235                           ; 63A3  SFX data
        DECLE   $0043,  $0004                   ; 63A4  SFX data
        DECLE   $02CF                           ; 63A6  SFX end

        DECLE   $0380,  $008F,  $0388,  $0090   ; 63A7   0380 008F 0388 0090
        DECLE   $0315,  $006B,  $0235           ; 63AB   0315 006B 0235

        SWAP    R3,     1                       ; 63AE   0043
        CMP@    R2,     R6                      ; 63AF   0356
        PSHR    R5                              ; 63B0   0275

L_63B1:
        JSR     R5,     X_PLAY_SFX1             ; 63B1   0004 0118 03BB
        DECLE   $0389                           ; 63B4  SFX data
        DECLE   $02D0,  $00B0                   ; 63B5  SFX data
        DECLE   $02D8,  $00B0                   ; 63B7  SFX data
        DECLE   $02D4,  $00B0                   ; 63B9  SFX data
        DECLE   $011B                           ; 63BB  SFX data
        DECLE   $0001,  $03F8                   ; 63BC  SFX data
        DECLE   $0001,  $000A                   ; 63BE  SFX data
        DECLE   $03CD                           ; 63C0  SFX data
        DECLE   $000F,  $03FF                   ; 63C1  SFX data
        DECLE   $008F,  $0027                   ; 63C3  SFX data
        DECLE   $02CF                           ; 63C5  SFX end

        DECLE   $001B,  $000E,  $0006,  $0006   ; 63C6   001B 000E 0006 0006
        DECLE   $0006,  $0006,  $000E,  $001D   ; 63CA   0006 0006 000E 001D
        DECLE   $003D,  $00DE,  $007D,  $00EA   ; 63CE   003D 00DE 007D 00EA
        DECLE   $00FD,  $006B,  $00B5,  $007A   ; 63D2   00FD 006B 00B5 007A
        DECLE   $00C0,  $00A0,  $00D0,  $00A8   ; 63D6   00C0 00A0 00D0 00A8
        DECLE   $0050,  $00A8,  $0050,  $00A0   ; 63DA   0050 00A8 0050 00A0
        DECLE   $001C,  $007B,  $00BF,  $007F   ; 63DE   001C 007B 00BF 007F
        DECLE   $00FF,  $00EF,  $0075,  $001E   ; 63E2   00FF 00EF 0075 001E
        DECLE   $0070,  $00EE,  $00F6,  $00FF   ; 63E6   0070 00EE 00F6 00FF
        DECLE   $00FE,  $00FF,  $00DE,  $00B8   ; 63EA   00FE 00FF 00DE 00B8
        DECLE   $0007,  $000D,  $0007,  $000B   ; 63EE   0007 000D 0007 000B
        DECLE   $001A,  $001A,  $000C,  $0002   ; 63F2   001A 001A 000C 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 63F6   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0075,  $00EB   ; 63FA   0000 0018 0075 00EB
        DECLE   $00A9,  $0010,  $0000,  $0000   ; 63FE   00A9 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6402   0000 0000 0000 0000

        ADDR    R2,     R7                      ; 6406   00D7

        SAR     R1,     2                       ; 6407   006D
        ADDR    R2,     R7                      ; 6408   00D7

        DECLE   $006B,  $007E,  $00BB,  $004C   ; 6409   006B 007E 00BB 004C
        DECLE   $0006,  $00EC,  $0078,  $0038   ; 640D   0006 00EC 0078 0038
        DECLE   $0038,  $0038,  $0038,  $003C   ; 6411   0038 0038 0038 003C
        DECLE   $004E,  $00F7,  $00EF,  $00F6   ; 6415   004E 00F7 00EF 00F6
        DECLE   $007F,  $00BE,  $00FF,  $00D6   ; 6419   007F 00BE 00FF 00D6
        DECLE   $00B9,  $0000,  $0000,  $0000   ; 641D   00B9 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 6421   0000 0000 0000 0081
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6425   00FF 00FF 00FF 0000

        SWAP    R2,     1                       ; 6429   0042
        ADDR    R4,     R7                      ; 642A   00E7

        MOVR    R4,     R5                      ; 642B   00A5
        ADDR    R4,     R7                      ; 642C   00E7

        DECLE   $0042,  $0000,  $0000,  $0000   ; 642D   0042 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 6431   0000 0000 0000 0081
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6435   00FF 00FF 00FF 0000
        DECLE   $0042,  $00C6,  $00A5,  $0063   ; 6439   0042 00C6 00A5 0063
        DECLE   $0042,  $0000,  $0000,  $0000   ; 643D   0042 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6441   0000 0000 0000 0000
        DECLE   $0081,  $00FF,  $00FF,  $00BD   ; 6445   0081 00FF 00FF 00BD
        DECLE   $0042,  $0063,  $00A5,  $00C6   ; 6449   0042 0063 00A5 00C6
        DECLE   $0042,  $0000,  $0000,  $0007   ; 644D   0042 0000 0000 0007
        DECLE   $0008,  $0005,  $0008,  $0005   ; 6451   0008 0005 0008 0005
        DECLE   $0008,  $0003,  $0008,  $0001   ; 6455   0008 0003 0008 0001
        DECLE   $0008,  $03CF,  $0000,  $0031   ; 6459   0008 03CF 0000 0031
        DECLE   $00A1,  $0041,  $003F,  $0000   ; 645D   00A1 0041 003F 0000
        DECLE   $0031,  $00A1,  $0041,  $002F   ; 6461   0031 00A1 0041 002F
        DECLE   $0000,  $0031,  $0041,  $005F   ; 6465   0000 0031 0041 005F
        DECLE   $0000,  $001F,  $0031,  $0041   ; 6469   0000 001F 0031 0041
        DECLE   $01EF,  $0000,  $0031,  $0041   ; 646D   01EF 0000 0031 0041
        DECLE   $006F,  $0000,  $0031,  $0041   ; 6471   006F 0000 0031 0041
        DECLE   $007F,  $0000                   ; 6475   007F 0000

        ADCR    R7                              ; 6477   002F

        GSWD    R1                              ; 6478   0031
L_6479:
        SWAP    R1,     1                       ; 6479   0041
        DECLE   $015F,  $0000,  $001F,  $0062   ; 647A   015F 0000 001F 0062
        DECLE   $002F,  $0000,  $001F,  $0062   ; 647E   002F 0000 001F 0062
        DECLE   $004F,  $0000,  $001F,  $0062   ; 6482   004F 0000 001F 0062
        DECLE   $001F,  $0000,  $0062,  $002F   ; 6486   001F 0000 0062 002F
        DECLE   $0000,  $001F,  $0082,  $0023   ; 648A   0000 001F 0082 0023
        DECLE   $0000,  $0052,  $001F,  $0012   ; 648E   0000 0052 001F 0012
        DECLE   $0022,  $0052,  $0012,  $0022   ; 6492   0022 0052 0012 0022
        DECLE   $0000,  $0082,  $0012,  $0022   ; 6496   0000 0082 0012 0022
        DECLE   $0052,  $0012,  $0022,  $002F   ; 649A   0052 0012 0022 002F
        DECLE   $0000,  $0094,  $002F,  $0000   ; 649E   0000 0094 002F 0000
        DECLE   $001F,  $0004,  $001F,  $0000   ; 64A2   001F 0004 001F 0000
        DECLE   $0004,  $002F,  $0000,  $0094   ; 64A6   0004 002F 0000 0094
        DECLE   $001F,  $0000,  $0004,  $001F   ; 64AA   001F 0000 0004 001F
        DECLE   $0000,  $013F                   ; 64AE   0000 013F

        RRC     R1,     2                       ; 64B0   0075
L_64B1:
        PSHR    R5                              ; 64B1   0275

        JSR     R5,     L_53C8                  ; 64B2   0004 0150 03C8

        DECR    R1                              ; 64B5   0011
        ADDR    R0,     R6                      ; 64B6   00C6
        SLR     R3,     1                       ; 64B7   0063

        JSR     R5,     L_5380                  ; 64B8   0004 0150 0380
        DECLE   $0200,  $02F0                   ; 64BB   0200 02F0
        BIDECLE $644E,  $645A                   ; 64BD   004E 0064 005A 0064

        PULR    R7                              ; 64C1   02B7

        SLR     R0,     1                       ; 64C2   0060
        RRC     R0,     1                       ; 64C3   0070
        SLR     R0,     1                       ; 64C4   0060
        RSWD    R0                              ; 64C5   0038
        GSWD    R0                              ; 64C6   0030
        RSWD    R0                              ; 64C7   0038
        COMR    R0                              ; 64C8   0018
        COMR    R4                              ; 64C9   001C
        COMR    R4                              ; 64CA   001C
        COMR    R0                              ; 64CB   0018
        COMR    R4                              ; 64CC   001C
        RSWD    R0                              ; 64CD   0038
        GSWD    R0                              ; 64CE   0030
        RSWD    R0                              ; 64CF   0038
        GSWD    R0                              ; 64D0   0030
        RSWD    R0                              ; 64D1   0038
        RRC     R3,     2                       ; 64D2   0077
        ADDR    R1,     R7                      ; 64D3   00CF

        RSWD    R6                              ; 64D4   003E
        ADDR    R2,     R7                      ; 64D5   00D7
        ADDR    R5,     R7                      ; 64D6   00EF

        ADDR    R7,     R6                      ; 64D7   00FE
        RSWD    R4                              ; 64D8   003C
        COMR    R4                              ; 64D9   001C
        ADDR    R6,     R0                      ; 64DA   00F0
        ADDR    R7,     R4                      ; 64DB   00FC
        RSWD    R6                              ; 64DC   003E
        ADDR    R1,     R6                      ; 64DD   00CE
        ADDR    R4,     R7                      ; 64DE   00E7

        DECLE   $00F3,  $0031,  $0011,  $001E   ; 64DF   00F3 0031 0011 001E
        DECLE   $003F,  $0077,  $006D,  $00DB   ; 64E3   003F 0077 006D 00DB
        DECLE   $009B,  $0037,  $0024,  $0000   ; 64E7   009B 0037 0024 0000
        DECLE   $0000,  $0000,  $0084,  $00D2   ; 64EB   0000 0000 0084 00D2
        DECLE   $004B,  $005B,  $0016,  $0000   ; 64EF   004B 005B 0016 0000
        DECLE   $0000,  $0000,  $0084,  $00D2   ; 64F3   0000 0000 0084 00D2
        DECLE   $004B,  $005B,  $0016,  $0003   ; 64F7   004B 005B 0016 0003
        DECLE   $000C,  $0010,  $001C,  $001F   ; 64FB   000C 0010 001C 001F
        DECLE   $001F                           ; 64FF   001F

        INCR    R7                              ; 6500   000F

        DIS                                     ; 6501   0003
L_6502:
        ADDR    R0,     R0                      ; 6502   00C0
        DECLE   $0030,  $0008,  $0038,  $00F8   ; 6503   0030 0008 0038 00F8
        DECLE   $00F8,  $00F0,  $00C0,  $00B0   ; 6507   00F8 00F0 00C0 00B0
        DECLE   $00A8,  $0054,  $0054,  $0028   ; 650B   00A8 0054 0054 0028
        DECLE   $0028,  $0050,  $0020,  $0000   ; 650F   0028 0050 0020 0000
        DECLE   $0020,  $0060,  $00FF,  $0060   ; 6513   0020 0060 00FF 0060
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6517   0020 0000 0000 0000
        DECLE   $0004,  $0006,  $00FF,  $0006   ; 651B   0004 0006 00FF 0006
        DECLE   $0004,  $0000,  $0000,  $001C   ; 651F   0004 0000 0000 001C
        DECLE   $001C,  $0034,  $0022,  $0036   ; 6523   001C 0034 0022 0036
        DECLE   $001F                           ; 6527   001F

        SETC                                    ; 6528   0007
        SETC                                    ; 6529   0007
        INCR    R7                              ; 652A   000F
        INCR    R7                              ; 652B   000F

L_652C:
        INCR    R4                              ; 652C   000C
L_652D:
        CLRC                                    ; 652D   0006
        DECLE   $0006,  $0002,  $0007,  $0005   ; 652E   0006 0002 0007 0005
        DECLE   $001C,  $001C,  $0034,  $0022   ; 6532   001C 001C 0034 0022
        DECLE   $0036,  $001F                   ; 6536   0036 001F

        SETC                                    ; 6538   0007
        SETC                                    ; 6539   0007
        INCR    R7                              ; 653A   000F
        INCR    R7                              ; 653B   000F

L_653C:
        COMR    R4                              ; 653C   001C
L_653D:
        COMR    R4                              ; 653D   001C
        DECLE   $0030,  $0020,  $0070,  $0050   ; 653E   0030 0020 0070 0050
        DECLE   $0006,  $0009,  $0009,  $0009   ; 6542   0006 0009 0009 0009
        DECLE   $000A,  $0008,  $00C8,  $00FC   ; 6546   000A 0008 00C8 00FC
        DECLE   $00FE,  $00FE,  $00FE,  $00FC   ; 654A   00FE 00FE 00FE 00FC
        DECLE   $0078,  $0018,  $0038,  $0078   ; 654E   0078 0018 0038 0078
        DECLE   $0006,  $0009,  $0009,  $0009   ; 6552   0006 0009 0009 0009
        DECLE   $000A,  $0008,  $00C8,  $00FC   ; 6556   000A 0008 00C8 00FC
        DECLE   $00FE,  $00FE,  $00FE,  $003C   ; 655A   00FE 00FE 00FE 003C
        DECLE   $000E,  $0006,  $0002,  $0002   ; 655E   000E 0006 0002 0002
        DECLE   $0038,  $0038,  $002C,  $0044   ; 6562   0038 0038 002C 0044
        DECLE   $006C,  $00F8,  $00E0,  $00E0   ; 6566   006C 00F8 00E0 00E0
        DECLE   $00F0,  $00F0,  $0030,  $0060   ; 656A   00F0 00F0 0030 0060
        DECLE   $0060,  $0040,  $00E0,  $00A0   ; 656E   0060 0040 00E0 00A0
        DECLE   $0038,  $0038,  $002C,  $0044   ; 6572   0038 0038 002C 0044
        DECLE   $006C,  $00F8,  $00E0,  $00E0   ; 6576   006C 00F8 00E0 00E0
        DECLE   $00F0,  $00F0,  $0038,  $0038   ; 657A   00F0 00F0 0038 0038
        DECLE   $000C,  $0004,  $000E,  $000A   ; 657E   000C 0004 000E 000A
        DECLE   $0060,  $0090,  $0090,  $0090   ; 6582   0060 0090 0090 0090
        DECLE   $0050,  $0010,  $0013,  $003F   ; 6586   0050 0010 0013 003F
        DECLE   $007F,  $007F,  $007F,  $003F   ; 658A   007F 007F 007F 003F
        DECLE   $001E,  $0018,  $001C,  $001E   ; 658E   001E 0018 001C 001E
        DECLE   $0060,  $0090,  $0090,  $0090   ; 6592   0060 0090 0090 0090
        DECLE   $0050,  $0010,  $0013,  $003F   ; 6596   0050 0010 0013 003F
        DECLE   $007F,  $007F,  $007F,  $003C   ; 659A   007F 007F 007F 003C
        DECLE   $0070,  $0060,  $0040,  $0040   ; 659E   0070 0060 0040 0040
        DECLE   $0004,  $0008,  $0005,  $0008   ; 65A2   0004 0008 0005 0008
        DECLE   $0006,  $0018,  $0000,  $0000   ; 65A6   0006 0018 0000 0000
        DECLE   $0003,  $0018,  $0006,  $0008   ; 65AA   0003 0018 0006 0008
        DECLE   $0000,  $0008,  $0000           ; 65AE   0000 0008 0000

        COMR    R0                              ; 65B1   0018
        SWAP    R0,     1                       ; 65B2   0040
        NEGR    R1                              ; 65B3   0021
        GSWD    R2                              ; 65B4   0032
        MOVR    R5,     R7                      ; 65B5   00AF

        DECLE   $0003,  $0040,  $0032,  $0040   ; 65B6   0003 0040 0032 0040
        DECLE   $0021,  $0032,  $0003,  $0040   ; 65BA   0021 0032 0003 0040
        DECLE   $0021,  $0032,  $00BF,  $0003   ; 65BE   0021 0032 00BF 0003
        DECLE   $0004,  $0003,  $0014,  $0095   ; 65C2   0004 0003 0014 0095
        DECLE   $001F,  $0003,  $0014,  $003F   ; 65C6   001F 0003 0014 003F
        DECLE   $0003,  $0040,  $0021,  $0032   ; 65CA   0003 0040 0021 0032
        DECLE   $004F,  $0003,  $0050,  $0014   ; 65CE   004F 0003 0050 0014
        DECLE   $0051,  $0014,  $0062,  $0003   ; 65D2   0051 0014 0062 0003
        DECLE   $0036,  $0014,  $004F,  $0003   ; 65D6   0036 0014 004F 0003
        DECLE   $0014,  $00BF,  $0003,  $0040   ; 65DA   0014 00BF 0003 0040
        DECLE   $0032,  $003F                   ; 65DE   0032 003F

        DIS                                     ; 65E0   0003
        RLC     R1,     1                       ; 65E1   0051
        DECR    R4                              ; 65E2   0014
        RLC     R1,     1                       ; 65E3   0051
        RLC     R0,     1                       ; 65E4   0050
        MOVR    R3,     R7                      ; 65E5   009F

        DIS                                     ; 65E6   0003
        SWAP    R0,     1                       ; 65E7   0040
        SWAP    R1,     1                       ; 65E8   0041
        GSWD    R2                              ; 65E9   0032
        MOVR    R1,     R7                      ; 65EA   008F

        DIS                                     ; 65EB   0003
        SWAP    R1,     1                       ; 65EC   0041
        GSWD    R2                              ; 65ED   0032
        SLLC    R3,     2                       ; 65EE   005F
        DIS                                     ; 65EF   0003
        DECR    R4                              ; 65F0   0014
        MOVR    R2,     R5                      ; 65F1   0095
        MOVR    R3,     R7                      ; 65F2   009F

        DECLE   $0003,  $0014,  $003F,  $0003   ; 65F3   0003 0014 003F 0003
        DECLE   $0040,  $0021,  $0032,  $0004   ; 65F7   0040 0021 0032 0004
        DECLE   $0050,  $001F,  $0051,  $0062   ; 65FB   0050 001F 0051 0062
        DECLE   $001F                           ; 65FF   001F

        RLC     R1,     1                       ; 6600   0051
        RLC     R0,     1                       ; 6601   0050
        RLC     R1,     1                       ; 6602   0051
        RRC     R3,     2                       ; 6603   0077
        MOVR    R0,     R7                      ; 6604   0087

        DECLE   $0051,  $0014,  $0051,  $0062   ; 6605   0051 0014 0051 0062
        DECLE   $0051,  $0062,  $0050,  $0014   ; 6609   0051 0062 0050 0014
        DECLE   $0050,  $03FF,  $0003,  $00FF   ; 660D   0050 03FF 0003 00FF

        DIS                                     ; 6611   0003
L_6612:
        PSHR    R5                              ; 6612   0275

        JSR     R5,     L_53C8                  ; 6613   0004 0150 03C8

        COMR    R4                              ; 6616   001C
        ADDR    R0,     R2                      ; 6617   00C2
        SLR     R0,     2                       ; 6618   0064

        JSR     R5,     L_5380                  ; 6619   0004 0150 0380
        DECLE   $0200,  $02F0                   ; 661C   0200 02F0
        BIDECLE $65A2,  $65B2                   ; 661E   00A2 0065 00B2 0065

        PULR    R7                              ; 6622   02B7

        DECLE   $0063,  $006A,  $004C,  $0066   ; 6623   0063 006A 004C 0066
        DECLE   $00E6,  $0066,  $002B,  $006C   ; 6627   00E6 0066 002B 006C
        DECLE   $005B,  $006C,  $003D,  $0066   ; 662B   005B 006C 003D 0066
        DECLE   $00C2,  $0000,  $0000,  $0000   ; 662F   00C2 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6633   0000 0000 0000 0000
        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 6637   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0057,  $004D   ; 663B   01B0 01A0 0057 004D
        DECLE   $0065,  $006D,  $006F,  $0072   ; 663F   0065 006D 006F 0072
        DECLE   $0079,  $0020,  $0046,  $0075   ; 6643   0079 0020 0046 0075
        DECLE   $006E,  $0000,  $0004,  $0350   ; 6647   006E 0000 0004 0350
        DECLE   $029C,  $0071,  $001A,  $0001   ; 664B   029C 0071 001A 0001
        DECLE   $0080,  $005A,  $0066,  $0001   ; 664F   0080 005A 0066 0001
        DECLE   $0000,  $0022,  $006E,  $0014   ; 6653   0000 0022 006E 0014
        DECLE   $0000,  $0000,  $0000           ; 6657   0000 0000 0000

        PSHR    R5                              ; 665A   0275

        JSR     R5,     L_69A9                  ; 665B   0004 0168 01A9
        JSR     R5,     L_6F78                  ; 665E   0004 016C 0378

        PULR    R7                              ; 6661   02B7

        DECLE   $0005,  $0005,  $0004,  $0005   ; 6662   0005 0005 0004 0005
        DECLE   $0005,  $0002,  $0006,  $0005   ; 6666   0005 0002 0006 0005
        DECLE   $0004,  $0006,  $0005,  $0002   ; 666A   0004 0006 0005 0002
        DECLE   $0007,  $0005,  $0004,  $0007   ; 666E   0007 0005 0004 0007
        DECLE   $0005,  $0002,  $0006,  $0006   ; 6672   0005 0002 0006 0006
        DECLE   $0004,  $0006,  $0006,  $0002   ; 6676   0004 0006 0006 0002
        DECLE   $0007,  $0006,  $0004,  $0007   ; 667A   0007 0006 0004 0007
        DECLE   $0006,  $0002,  $0008,  $0006   ; 667E   0006 0002 0008 0006
        DECLE   $0004,  $0008,  $0006,  $0002   ; 6682   0004 0008 0006 0002
        DECLE   $0007,  $0007,  $0006,  $0007   ; 6686   0007 0007 0006 0007
        DECLE   $0007,  $0004,  $0007,  $0007   ; 668A   0007 0004 0007 0007
        DECLE   $0002,  $0008,  $0007,  $0006   ; 668E   0002 0008 0007 0006
        DECLE   $0008,  $0007,  $0004,  $0008   ; 6692   0008 0007 0004 0008
        DECLE   $0007,  $0002,  $0009,  $0007   ; 6696   0007 0002 0009 0007
        DECLE   $0006,  $0009,  $0007,  $0004   ; 669A   0006 0009 0007 0004
        DECLE   $0009,  $0007,  $0002,  $0008   ; 669E   0009 0007 0002 0008
        DECLE   $0008,  $0006,  $0008,  $0008   ; 66A2   0008 0006 0008 0008
        DECLE   $0004,  $0008,  $0008,  $0002   ; 66A6   0004 0008 0008 0002
        DECLE   $0009,  $0008,  $0008,  $0009   ; 66AA   0009 0008 0008 0009
        DECLE   $0008,  $0006,  $0009,  $0008   ; 66AE   0008 0006 0009 0008
        DECLE   $0004,  $0009,  $0008,  $0002   ; 66B2   0004 0009 0008 0002
        DECLE   $000A,  $0008,  $0008,  $000A   ; 66B6   000A 0008 0008 000A
        DECLE   $0008,  $0006,  $000A,  $0008   ; 66BA   0008 0006 000A 0008
        DECLE   $0004,  $000A,  $0008,  $0002   ; 66BE   0004 000A 0008 0002
        DECLE   $000B,  $0008,  $0008,  $000B   ; 66C2   000B 0008 0008 000B
        DECLE   $0008,  $0006,  $000B,  $0008   ; 66C6   0008 0006 000B 0008
        DECLE   $0004,  $000B,  $0008,  $0002   ; 66CA   0004 000B 0008 0002
        DECLE   $000C,  $0008,  $0008,  $000C   ; 66CE   000C 0008 0008 000C
        DECLE   $0008,  $0006,  $000C,  $0008   ; 66D2   0008 0006 000C 0008
        DECLE   $0004,  $000C,  $0008,  $0002   ; 66D6   0004 000C 0008 0002
        DECLE   $000C,  $0009,  $0008,  $000C   ; 66DA   000C 0009 0008 000C
        DECLE   $0009,  $0006,  $000C,  $0009   ; 66DE   0009 0006 000C 0009
        DECLE   $0004                           ; 66E2   0004

        INCR    R4                              ; 66E3   000C
        INCR    R1                              ; 66E4   0009
        EIS                                     ; 66E5   0002
        PSHR    R5                              ; 66E6   0275
        SDBD                                    ; 66E7   0001
        MVII    #$53A8, R0                      ; 66E8   02B8 00A8 0053
        MVO     R0,     .ISRVEC.0               ; 66EB   0240 0100
        SWAP    R0,     1                       ; 66ED   0040
        MVO     R0,     .ISRVEC.1               ; 66EE   0240 0101

        JSR     R5,     L_6F4B                  ; 66F0   0004 016C 034B
L_66F3:
        JSR     R5,     L_6FCE                  ; 66F3   0004 016C 03CE
        BIDECLE $682B                           ; 66F6   002B 0068

        MVII    #$0002, R0                      ; 66F8   02B8 0002
        MOVR    R5,     R1                      ; 66FA   00A9
        ADDI    #$0002, R1                      ; 66FB   02F9 0002
        CLRR    R2                              ; 66FD   01D2
        MVII    #$0007, R3                      ; 66FE   02BB 0007

        JSR     R5,     X_GETNUM                ; 6700   0004 0118 00FF

        DECR    R0                              ; 6703   0010
        BMI     L_66F3                          ; 6704   022B 0012

        CMPI    #$002C, R0                      ; 6706   0378 002C
        BGE     L_66F3                          ; 6708   022D 0016

        MVO     R0,     G_015D                  ; 670A   0240 015D

L_670C:
        JSR     R5,     L_6FCE                  ; 670C   0004 016C 03CE
        BIDECLE $683B                           ; 670F   003B 0068

        MVII    #$0001, R0                      ; 6711   02B8 0001
        MOVR    R5,     R1                      ; 6713   00A9
        CLRR    R2                              ; 6714   01D2
        MVII    #$0007, R3                      ; 6715   02BB 0007

        JSR     R5,     X_GETNUM                ; 6717   0004 0118 00FF

        DECR    R0                              ; 671A   0010
        BMI     L_670C                          ; 671B   022B 0010

        CMPI    #$0001, R0                      ; 671D   0378 0001
        BGT     L_670C                          ; 671F   022E 0014

        MVO     R0,     G_015E                  ; 6721   0240 015E
        TSTR    R0                              ; 6723   0080
        BEQ     L_673E                          ; 6724   0204 0018

L_6726:
        JSR     R5,     L_6FCE                  ; 6726   0004 016C 03CE
        BIDECLE $684E                           ; 6729   004E 0068

        MVII    #$0001, R0                      ; 672B   02B8 0001
        MVII    #$026D, R1                      ; 672D   02B9 026D
        CLRR    R2                              ; 672F   01D2
        MVII    #$0007, R3                      ; 6730   02BB 0007

        JSR     R5,     X_GETNUM                ; 6732   0004 0118 00FF

        DECR    R0                              ; 6735   0010
        BMI     L_6726                          ; 6736   022B 0011

        CMPI    #$0001, R0                      ; 6738   0378 0001
        BGT     L_6726                          ; 673A   022E 0015

        MVO     R0,     G_015F                  ; 673C   0240 015F
L_673E:
        MVI     G_015D, R4                      ; 673E   0284 015D
        ADDR    R4,     R4                      ; 6740   00E4
        ADD     G_015D, R4                      ; 6741   02C4 015D
        SDBD                                    ; 6743   0001
        ADDI    #$6662, R4                      ; 6744   02FC 0062 0066
        MVI@    R4,     R0                      ; 6747   02A0
        MVO     R0,     G_0178                  ; 6748   0240 0178
        MVI@    R4,     R0                      ; 674A   02A0
        MVO     R0,     G_0179                  ; 674B   0240 0179
        MVI@    R4,     R0                      ; 674D   02A0
        MVO     R0,     G_017A                  ; 674E   0240 017A
        MVI     G_0179, R0                      ; 6750   0280 0179
        SLR     R0,     1                       ; 6752   0060
        ADCR    R0                              ; 6753   0028
        MVII    #$0006, R1                      ; 6754   02B9 0006
        SUBR    R0,     R1                      ; 6756   0101
        MVII    #$0014, R0                      ; 6757   02B8 0014

        JSR     R5,     X_MPY                   ; 6759   0004 011C 01DC

        MVI     G_0178, R0                      ; 675C   0280 0178
        SLR     R0,     1                       ; 675E   0060
        ADCR    R0                              ; 675F   0028
        MVII    #$000A, R1                      ; 6760   02B9 000A
        SUBR    R0,     R1                      ; 6762   0101
        ADDR    R1,     R2                      ; 6763   00CA
        MVO     R2,     G_0160                  ; 6764   0242 0160
        MVI     G_0179, R0                      ; 6766   0280 0179
        MVI     G_0178, R1                      ; 6768   0281 0178

        JSR     R5,     X_MPY                   ; 676A   0004 011C 01DC

        MVII    #$017B, R4                      ; 676D   02BC 017B
        MVO@    R2,     R4                      ; 676F   0262
        CLRR    R0                              ; 6770   01C0
L_6771:
        MVI     G_017A, R1                      ; 6771   0281 017A
        SUBR    R1,     R2                      ; 6773   010A
        MVI     G_0177, R5                      ; 6774   0285 0177
        ADDR    R1,     R5                      ; 6776   00CD
        MVO     R5,     G_0177                  ; 6777   0245 0177
L_6779:
        MVO@    R0,     R4                      ; 6779   0260
        DECR    R1                              ; 677A   0011
        BNEQ    L_6779                          ; 677B   022C 0003

        INCR    R0                              ; 677D   0008
        CMPI    #$0034, R0                      ; 677E   0378 0034
        BEQ     L_6786                          ; 6780   0204 0004

        CMP     G_017A, R2                      ; 6782   0342 017A
        BGT     L_6771                          ; 6784   022E 0014

L_6786:
        MVII    #$00FF, R0                      ; 6786   02B8 00FF
L_6788:
        MVO@    R0,     R4                      ; 6788   0260
        DECR    R2                              ; 6789   0012
        BNEQ    L_6788                          ; 678A   022C 0003

        JSR     R5,     L_68DA                  ; 678C   0004 0168 00DA
        DECLE   $017B                           ; 678F   017B

        JSR     R5,     L_6FAE                  ; 6790   0004 016C 03AE
        DECLE   $0200,  $02EF                   ; 6793   0200 02EF

        MVI     G_0160, R4                      ; 6795   0284 0160
        ADDI    #$0200, R4                      ; 6797   02FC 0200
        MVI     G_0179, R3                      ; 6799   0283 0179
L_679B:
        PSHR    R4                              ; 679B   0274
        MVI     G_0178, R2                      ; 679C   0282 0178
L_679E:
        MOVR    R4,     R0                      ; 679E   00A0
        SUBI    #$0200, R0                      ; 679F   0338 0200
        MVO     R0,     G_016A                  ; 67A1   0240 016A
        MOVR    R4,     R0                      ; 67A3   00A0

        JSR     R5,     L_6933                  ; 67A4   0004 0168 0133

        MVO@    R0,     R4                      ; 67A7   0260
        DECR    R2                              ; 67A8   0012
        BNEQ    L_679E                          ; 67A9   022C 000C

        PULR    R4                              ; 67AB   02B4
        ADDI    #$0014, R4                      ; 67AC   02FC 0014
        DECR    R3                              ; 67AE   0013
        BNEQ    L_679B                          ; 67AF   022C 0015

        MVI     G_0160, R0                      ; 67B1   0280 0160

        JSR     R5,     L_68FB                  ; 67B3   0004 0168 00FB

        MVO     R0,     G_0117                  ; 67B6   0240 0117
        MVO     R1,     G_0119                  ; 67B8   0241 0119
        ADDI    #$0004, R0                      ; 67BA   02F8 0004
        SWAP    R0,     1                       ; 67BC   0040
        MVO     R0,     G_031F                  ; 67BD   0240 031F
        ADDI    #$0006, R1                      ; 67BF   02F9 0006
        SWAP    R1,     1                       ; 67C1   0041
        MVO     R1,     G_0320                  ; 67C2   0241 0320
        MVI     G_016A, R0                      ; 67C4   0280 016A

        JSR     R5,     L_68FB                  ; 67C6   0004 0168 00FB

        ADDI    #$0004, R0                      ; 67C9   02F8 0004
        SWAP    R0,     1                       ; 67CB   0040
        MVO     R0,     G_0327                  ; 67CC   0240 0327
        ADDI    #$0006, R1                      ; 67CE   02F9 0006
        SWAP    R1,     1                       ; 67D0   0041
        MVO     R1,     G_0328                  ; 67D1   0241 0328
        MVI     G_016A, R0                      ; 67D3   0280 016A

        JSR     R5,     L_68FB                  ; 67D5   0004 0168 00FB

        ADDI    #$0007, R0                      ; 67D8   02F8 0007
        ADDI    #$0007, R1                      ; 67DA   02F9 0007
        MVO     R0,     G_0116                  ; 67DC   0240 0116
        MVO     R1,     G_0118                  ; 67DE   0241 0118
        CLRR    R1                              ; 67E0   01C9

        JSR     R5,     L_6CAC                  ; 67E1   0004 016C 00AC

        MVII    #$0001, R1                      ; 67E4   02B9 0001

        JSR     R5,     L_6CAC                  ; 67E6   0004 016C 00AC
        JSR     R5,     L_6FCE                  ; 67E9   0004 016C 03CE
        BIDECLE $6884                           ; 67EC   0084 0068

        JSR     R5,     .EXEC.A61               ; 67EE   0004 0118 0261

        ADCR    R0                              ; 67F1   0028

        JSR     R5,     L_6FAE                  ; 67F2   0004 016C 03AE
        DECLE   $0200,  $0214                   ; 67F5   0200 0214

        JSR     R5,     L_6FCE                  ; 67F7   0004 016C 03CE
        BIDECLE $6893                           ; 67FA   0093 0068

        JSR     R5,     L_5401                  ; 67FC   0004 0154 0001

        CLRR    R0                              ; 67FF   01C0
        MVII    #$0173, R4                      ; 6800   02BC 0173
        MVO@    R0,     R4                      ; 6802   0260
        MVO@    R0,     R4                      ; 6803   0260
        MVO@    R0,     R4                      ; 6804   0260
        MVO@    R0,     R4                      ; 6805   0260
        SDBD                                    ; 6806   0001
        MVII    #$6966, R0                      ; 6807   02B8 0066 0069
        MVO     R0,     G_035D                  ; 680A   0240 035D

        JSR     R5,     .EXEC.A61               ; 680C   0004 0118 0261

        COMR    R6                              ; 680F   001E

        JSR     R5,     L_6FAE                  ; 6810   0004 016C 03AE
        DECLE   $0208,  $020C                   ; 6813   0208 020C

        CLRR    R0                              ; 6815   01C0

        JSR     R5,     L_6E0F                  ; 6816   0004 016C 020F

        MVI     G_015E, R0                      ; 6819   0280 015E
        TSTR    R0                              ; 681B   0080
        BEQ     L_6823                          ; 681C   0204 0005

        MVII    #$0001, R0                      ; 681E   02B8 0001

        JSR     R5,     L_6E0F                  ; 6820   0004 016C 020F

L_6823:
        PULR    R7                              ; 6823   02B7

        MVII    #$00F0, R0                      ; 6824   02B8 00F0
        MVII    #$0200, R4                      ; 6826   02BC 0200
        J       X_FILL_ZERO                     ; 6828   0004 0314 0338

        DECLE   $0003,  $0215,  $004C,  $0065   ; 682B   0003 0215 004C 0065
        DECLE   $0076,  $0065,  $006C,  $0020   ; 682F   0076 0065 006C 0020
        DECLE   $005B,  $0031,  $002D,  $0034   ; 6833   005B 0031 002D 0034
        DECLE   $0034,  $005D,  $003F,  $0002   ; 6837   0034 005D 003F 0002
        DECLE   $0003,  $023D,  $0031,  $0020   ; 683B   0003 023D 0031 0020
        DECLE   $006F,  $0072,  $0020,  $0032   ; 683F   006F 0072 0020 0032
        DECLE   $0020,  $0070,  $006C,  $0061   ; 6843   0020 0070 006C 0061
        DECLE   $0079,  $0065,  $0072,  $0073   ; 6847   0079 0065 0072 0073
        DECLE   $003F,  $0020,  $0002,  $0003   ; 684B   003F 0020 0002 0003
        DECLE   $0265,  $0053,  $0065,  $006C   ; 684F   0265 0053 0065 006C
        DECLE   $0065,  $0063,  $0074,  $003A   ; 6853   0065 0063 0074 003A
        DECLE   $0000,  $027B,  $0031,  $0020   ; 6857   0000 027B 0031 0020
        DECLE   $002D,  $0020,  $0074,  $0061   ; 685B   002D 0020 0074 0061
        DECLE   $006B,  $0065,  $0020,  $0074   ; 685F   006B 0065 0020 0074
        DECLE   $0075,  $0072,  $006E,  $0073   ; 6863   0075 0072 006E 0073
        DECLE   $0000,  $028F,  $0032,  $0020   ; 6867   0000 028F 0032 0020
        DECLE   $002D,  $0020,  $0070,  $006C   ; 686B   002D 0020 0070 006C
        DECLE   $0061,  $0079,  $0020,  $0061   ; 686F   0061 0079 0020 0061
        DECLE   $0074,  $0020,  $0074,  $0068   ; 6873   0074 0020 0074 0068
        DECLE   $0065,  $0000                   ; 6877   0065 0000

        MVI@    R4,     R7                      ; 6879   02A7

        RRC     R3,     1                       ; 687A   0073
        SLR     R1,     1                       ; 687B   0061
        SAR     R1,     2                       ; 687C   006D
        SLR     R1,     2                       ; 687D   0065
        NEGR    R0                              ; 687E   0020
        RRC     R0,     2                       ; 687F   0074
        SAR     R1,     1                       ; 6880   0069
        SAR     R1,     2                       ; 6881   006D
        SLR     R1,     2                       ; 6882   0065
        EIS                                     ; 6883   0002
        CLRC                                    ; 6884   0006
        BEQ     L_68CE                          ; 6885   0204 0047

        SLR     R1,     2                       ; 6887   0065
        RRC     R0,     2                       ; 6888   0074
        NEGR    R0                              ; 6889   0020
        RLC     R2,     1                       ; 688A   0052
        SLR     R1,     2                       ; 688B   0065
        SLR     R1,     1                       ; 688C   0061
        SLR     R0,     2                       ; 688D   0064
        SARC    R1,     1                       ; 688E   0079
        ADCR    R6                              ; 688F   002E
        ADCR    R6                              ; 6890   002E
        ADCR    R6                              ; 6891   002E
        EIS                                     ; 6892   0002
        SETC                                    ; 6893   0007
        SKIP                                    ; 6894   0208
        SWAP    R3,     2                       ; 6895   0047
        SAR     R3,     2                       ; 6896   006F
        NEGR    R1                              ; 6897   0021
        NEGR    R1                              ; 6898   0021
        EIS                                     ; 6899   0002
        PSHR    R4                              ; 689A   0274
        MVI@    R5,     R4                      ; 689B   02AC
        PSHR    R0                              ; 689C   0270
        PSHR    R1                              ; 689D   0271
        PSHR    R3                              ; 689E   0273
        PSHR    R5                              ; 689F   0275
        MVII    #$0003, R1                      ; 68A0   02B9 0003
        MVII    #$0007, R3                      ; 68A2   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 68A4   0004 0118 00C5

        PULR    R5                              ; 68A7   02B5
        PULR    R3                              ; 68A8   02B3
        PULR    R1                              ; 68A9   02B1
        PULR    R0                              ; 68AA   02B0
        PULR    R4                              ; 68AB   02B4
        MOVR    R5,     R7                      ; 68AC   00AF

L_68AD:
        PSHR    R5                              ; 68AD   0275
        PSHR    R3                              ; 68AE   0273
        MOVR    R4,     R3                      ; 68AF   00A3
        MVI@    R3,     R5                      ; 68B0   029D
        INCR    R5                              ; 68B1   000D
        MVO@    R5,     R3                      ; 68B2   025D
        ADDR    R5,     R3                      ; 68B3   00EB
        MVO@    R0,     R3                      ; 68B4   0258
        PULR    R3                              ; 68B5   02B3
        PULR    R7                              ; 68B6   02B7

        PSHR    R5                              ; 68B7   0275
        PSHR    R3                              ; 68B8   0273
        MOVR    R4,     R3                      ; 68B9   00A3
        MOVR    R3,     R5                      ; 68BA   009D
        MVI@    R5,     R4                      ; 68BB   02AC
L_68BC:
        DECR    R4                              ; 68BC   0014
        BMI     L_68CA                          ; 68BD   020B 000B

        CMP@    R5,     R0                      ; 68BF   0368
        BNEQ    L_68BC                          ; 68C0   022C 0005

        MOVR    R3,     R4                      ; 68C2   009C
        ADD@    R3,     R4                      ; 68C3   02DC
        MVI@    R4,     R4                      ; 68C4   02A4
        DECR    R5                              ; 68C5   0015
        MVO@    R4,     R5                      ; 68C6   026C
        MVI@    R3,     R4                      ; 68C7   029C
        DECR    R4                              ; 68C8   0014
        MVO@    R4,     R3                      ; 68C9   025C
L_68CA:
        PULR    R3                              ; 68CA   02B3
        PULR    R7                              ; 68CB   02B7

        PSHR    R5                              ; 68CC   0275
        PSHR    R4                              ; 68CD   0274
L_68CE:
        MVI@    R4,     R5                      ; 68CE   02A5
L_68CF:
        DECR    R5                              ; 68CF   0015
        BMI     L_68D7                          ; 68D0   020B 0005

        CMP@    R4,     R0                      ; 68D2   0360
        BNEQ    L_68CF                          ; 68D3   022C 0005

        CLRC                                    ; 68D5   0006
        INCR    R7                              ; 68D6   000F

L_68D7:
        SETC                                    ; 68D7   0007
L_68D8:
        PULR    R4                              ; 68D8   02B4
        PULR    R7                              ; 68D9   02B7

L_68DA:
        MVI@    R5,     R1                      ; 68DA   02A9
        PSHR    R5                              ; 68DB   0275
        MVI@    R1,     R0                      ; 68DC   0288
        INCR    R1                              ; 68DD   0009
        MOVR    R1,     R3                      ; 68DE   008B
        ADDR    R0,     R3                      ; 68DF   00C3
        DECR    R3                              ; 68E0   0013
L_68E1:
        PSHR    R0                              ; 68E1   0270

        JSR     R5,     X_RAND2                 ; 68E2   0004 0114 029E

        MOVR    R0,     R2                      ; 68E5   0082
        ADDR    R1,     R2                      ; 68E6   00CA
        MVI@    R2,     R4                      ; 68E7   0294
        MVI@    R3,     R5                      ; 68E8   029D
        MVO@    R5,     R2                      ; 68E9   0255
        MVO@    R4,     R3                      ; 68EA   025C
        PULR    R0                              ; 68EB   02B0
        DECR    R3                              ; 68EC   0013
        CMPR    R1,     R3                      ; 68ED   014B
        BGE     L_68E1                          ; 68EE   022D 000E
        PULR    R7                              ; 68F0   02B7

L_68F1:
        CLRR    R1                              ; 68F1   01C9
        INCR    R7                              ; 68F2   000F

L_68F3:
        INCR    R1                              ; 68F3   0009
L_68F4:
        SUBI    #$0014, R0                      ; 68F4   0338 0014
        BPL     L_68F3                          ; 68F6   0223 0004

        ADDI    #$0014, R0                      ; 68F8   02F8 0014
        MOVR    R5,     R7                      ; 68FA   00AF

L_68FB:
        PSHR    R5                              ; 68FB   0275

        JSR     R5,     L_68F1                  ; 68FC   0004 0168 00F1

        INCR    R7                              ; 68FF   000F

        PSHR    R5                              ; 6900   0275
L_6901:
        SLL     R0,     2                       ; 6901   004C
        SLL     R0,     1                       ; 6902   0048
        ADDI    #$0008, R0                      ; 6903   02F8 0008
        SLL     R1,     2                       ; 6905   004D
        SLL     R1,     1                       ; 6906   0049
        ADDI    #$0008, R1                      ; 6907   02F9 0008
        PULR    R7                              ; 6909   02B7

L_690A:
        PSHR    R5                              ; 690A   0275
        PSHR    R2                              ; 690B   0272
        PSHR    R3                              ; 690C   0273

        JSR     R5,     .EXEC.772               ; 690D   0004 0114 0372

        SUBI    #$0008, R2                      ; 6910   033A 0008
        BPL     L_6915                          ; 6912   0203 0001

        CLRR    R2                              ; 6914   01D2
L_6915:
        SLR     R2,     2                       ; 6915   0066
        SLR     R2,     1                       ; 6916   0062
        SUBI    #$0008, R3                      ; 6917   033B 0008
        BPL     L_691C                          ; 6919   0203 0001

        CLRR    R3                              ; 691B   01DB
L_691C:
        SLR     R3,     2                       ; 691C   0067
        SLR     R3,     1                       ; 691D   0063
        MOVR    R2,     R0                      ; 691E   0090
        MOVR    R3,     R1                      ; 691F   0099
        PULR    R3                              ; 6920   02B3
        PULR    R2                              ; 6921   02B2
        PULR    R7                              ; 6922   02B7

L_6923:
        PSHR    R5                              ; 6923   0275

        JSR     R5,     L_690A                  ; 6924   0004 0168 010A

        INCR    R7                              ; 6927   000F

        PSHR    R5                              ; 6928   0275
L_6929:
        SLL     R1,     2                       ; 6929   004D
        ADDR    R1,     R0                      ; 692A   00C8
        SLL     R1,     2                       ; 692B   004D
        ADDR    R1,     R0                      ; 692C   00C8
        MOVR    R0,     R1                      ; 692D   0081
        PULR    R7                              ; 692E   02B7

        DECLE   $0000,  $0018,  $0001           ; 692F   0000 0018 0001

        COMR    R0                              ; 6932   0018
L_6933:
        PSHR    R5                              ; 6933   0275
        SUBI    #$0200, R0                      ; 6934   0338 0200
        PSHR    R1                              ; 6936   0271

        JSR     R5,     L_68F1                  ; 6937   0004 0168 00F1

        XORR    R0,     R1                      ; 693A   01C1
        ANDI    #$0001, R1                      ; 693B   03B9 0001
        MOVR    R1,     R5                      ; 693D   008D
        ADDR    R5,     R5                      ; 693E   00ED
        SDBD                                    ; 693F   0001
        ADDI    #$692F, R5                      ; 6940   02FD 002F 0069
        SDBD                                    ; 6943   0001
        MVI@    R5,     R0                      ; 6944   02A8
        PULR    R1                              ; 6945   02B1
        PULR    R7                              ; 6946   02B7

L_6947:
        SUBI    #$0200, R0                      ; 6947   0338 0200
        PSHR    R5                              ; 6949   0275
        PSHR    R1                              ; 694A   0271
        PSHR    R2                              ; 694B   0272
        SUB     G_0160, R0                      ; 694C   0300 0160

        JSR     R5,     L_68F1                  ; 694E   0004 0168 00F1

        PSHR    R0                              ; 6951   0270
        MVI     G_0178, R0                      ; 6952   0280 0178

        JSR     R5,     X_MPY                   ; 6954   0004 011C 01DC

        ADD@    R6,     R2                      ; 6957   02F2
        ADDI    #$017C, R2                      ; 6958   02FA 017C
        MVI@    R2,     R0                      ; 695A   0290
        PULR    R2                              ; 695B   02B2
        PULR    R1                              ; 695C   02B1
        PULR    R7                              ; 695D   02B7

L_695E:
        PSHR    R5                              ; 695E   0275
        MOVR    R1,     R5                      ; 695F   008D
        ADDR    R1,     R5                      ; 6960   00CD
        ADDR    R1,     R5                      ; 6961   00CD
        ADDI    #$0164, R5                      ; 6962   02FD 0164
        MOVR    R5,     R4                      ; 6964   00AC
        PULR    R7                              ; 6965   02B7

        DECLE   $0070,  $0069,  $0000,  $0000   ; 6966   0070 0069 0000 0000

        ADDR    R3,     R4                      ; 696A   00DC
        SAR     R1,     1                       ; 696B   0069
        ADDR    R3,     R4                      ; 696C   00DC
        SAR     R1,     1                       ; 696D   0069
        ADDR    R3,     R4                      ; 696E   00DC
        SAR     R1,     1                       ; 696F   0069
        PSHR    R5                              ; 6970   0275

        JSR     R5,     L_6A57                  ; 6971   0004 0168 0257

        TSTR    R0                              ; 6974   0080
        BMI     L_6988                          ; 6975   020B 0011

        PSHR    R1                              ; 6977   0271
        MOVR    R0,     R1                      ; 6978   0081
        MVII    #$001F, R0                      ; 6979   02B8 001F

        JSR     R5,     .EXEC.629               ; 697B   0004 0114 0229

        PULR    R1                              ; 697E   02B1
        PSHR    R0                              ; 697F   0270
        MOVR    R1,     R0                      ; 6980   0088

        JSR     R5,     .EXEC.76C               ; 6981   0004 0114 036C

        ADDI    #$0004, R1                      ; 6984   02F9 0004
        PULR    R0                              ; 6986   02B0
        MVO@    R0,     R1                      ; 6987   0248
L_6988:
        PULR    R7                              ; 6988   02B7

        DECLE   $0000,  $0000,  $0000,  $0007   ; 6989   0000 0000 0000 0007
        DECLE   $0000,  $0000,  $000B,  $0008   ; 698D   0000 0000 000B 0008
        DECLE   $0000,  $0003,  $0000,  $0004   ; 6991   0000 0003 0000 0004

        INCR    R7                              ; 6995   000F

        DECR    R0                              ; 6996   0010
L_6997:
        INCR    R4                              ; 6997   000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6998   0000 0000 0000 0000
        DECLE   $0006,  $0000,  $0000,  $000A   ; 699C   0006 0000 0000 000A
        DECLE   $0009,  $0000,  $0002,  $0000   ; 69A0   0009 0000 0002 0000
        DECLE   $0005,  $000E,  $0001,  $000D   ; 69A4   0005 000E 0001 000D
        DECLE   $0000                           ; 69A8   0000
L_69A9:
        PSHR    R5                              ; 69A9   0275
        CLRR    R1                              ; 69AA   01C9

        JSR     R5,     L_69B1                  ; 69AB   0004 0168 01B1

        MVII    #$0001, R1                      ; 69AE   02B9 0001
        INCR    R7                              ; 69B0   000F

L_69B1:
        PSHR    R5                              ; 69B1   0275
L_69B2:
        MVII    #$01FF, R2                      ; 69B2   02BA 01FF
        SUBR    R1,     R2                      ; 69B4   010A
        MVI@    R2,     R2                      ; 69B5   0292
        ANDI    #$001F, R2                      ; 69B6   03BA 001F
        SDBD                                    ; 69B8   0001
        ADDI    #$6989, R2                      ; 69B9   02FA 0089 0069
        MVI@    R2,     R2                      ; 69BC   0292
        TSTR    R2                              ; 69BD   0092
        BNEQ    L_6988                          ; 69BE   022C 0037

        MOVR    R1,     R0                      ; 69C0   0088

        JSR     R5,     .EXEC.772               ; 69C1   0004 0114 0372

        ANDI    #$00F8, R2                      ; 69C4   03BA 00F8
        ANDI    #$00F8, R3                      ; 69C6   03BB 00F8
        ADDI    #$0004, R2                      ; 69C8   02FA 0004
        ADDI    #$0006, R3                      ; 69CA   02FB 0006
        SWAP    R2,     1                       ; 69CC   0042
        XORR    R3,     R2                      ; 69CD   01DA
        MVII    #$000A, R3                      ; 69CE   02BB 000A

        JSR     R5,     .EXEC.9AD               ; 69D0   0004 0118 01AD

        PULR    R7                              ; 69D3   02B7

        TSTR    R0                              ; 69D4   0080
        DECR    R0                              ; 69D5   0010
        TSTR    R0                              ; 69D6   0080
        DECR    R2                              ; 69D7   0012
        TSTR    R0                              ; 69D8   0080
        DECR    R4                              ; 69D9   0014
        TSTR    R0                              ; 69DA   0080
        DECR    R6                              ; 69DB   0016
        PSHR    R5                              ; 69DC   0275
        MVO     R1,     G_016A                  ; 69DD   0241 016A

        JSR     R5,     L_6A57                  ; 69DF   0004 0168 0257

        DECR    R0                              ; 69E2   0010
        BMI     L_6988                          ; 69E3   022B 005C

        MOVR    R1,     R0                      ; 69E5   0088

        JSR     R5,     L_6923                  ; 69E6   0004 0168 0123

        MVO     R1,     G_016B                  ; 69E9   0241 016B
        ADDI    #$0200, R1                      ; 69EB   02F9 0200
        MVI@    R1,     R0                      ; 69ED   0288
        SDBD                                    ; 69EE   0001
        ANDI    #$09F8, R0                      ; 69EF   03B8 00F8 0009
        SDBD                                    ; 69F2   0001
        CMPI    #$0800, R0                      ; 69F3   0378 0000 0008
        BNEQ    L_6988                          ; 69F6   022C 006F

        PSHR    R1                              ; 69F8   0271
        MVI     G_016A, R1                      ; 69F9   0281 016A

        JSR     R5,     L_695E                  ; 69FB   0004 0168 015E

        PULR    R1                              ; 69FE   02B1
        MVI@    R5,     R3                      ; 69FF   02AB
        CMPI    #$0002, R3                      ; 6A00   037B 0002
        BGE     L_6988                          ; 6A02   022D 007B

        MOVR    R1,     R0                      ; 6A04   0088

        JSR     R5,     L_6947                  ; 6A05   0004 0168 0147
        JSR     R5,     L_68AD                  ; 6A08   0004 0168 00AD

        MVO     R0,     G_016C                  ; 6A0B   0240 016C
        MVI@    R1,     R2                      ; 6A0D   028A
        ADDI    #$0008, R2                      ; 6A0E   02FA 0008
        MVO@    R2,     R1                      ; 6A10   024A
        MVI     G_016A, R0                      ; 6A11   0280 016A
        ADDR    R0,     R0                      ; 6A13   00C0
        ADDI    #$0002, R0                      ; 6A14   02F8 0002
        ADDR    R3,     R0                      ; 6A16   00D8

        JSR     R5,     .EXEC.76C               ; 6A17   0004 0114 036C

        MOVR    R1,     R4                      ; 6A1A   008C
        MOVR    R2,     R3                      ; 6A1B   0093
        ANDI    #$0007, R3                      ; 6A1C   03BB 0007
        SWAP    R2,     1                       ; 6A1E   0042
        ANDI    #$0010, R2                      ; 6A1F   03BA 0010
        XORR    R2,     R3                      ; 6A21   01D3
        MVII    #$0002, R0                      ; 6A22   02B8 0002

        JSR     R5,     X_RAND1                 ; 6A24   0004 0114 027D

        MOVR    R0,     R5                      ; 6A27   0085
        ADDR    R0,     R5                      ; 6A28   00C5
        SDBD                                    ; 6A29   0001
        ADDI    #$69D4, R5                      ; 6A2A   02FD 00D4 0069
        SDBD                                    ; 6A2D   0001
        XOR@    R5,     R3                      ; 6A2E   03EB
        MVO@    R3,     R4                      ; 6A2F   0263
        MVII    #$0007, R0                      ; 6A30   02B8 0007

        JSR     R5,     X_RAND2                 ; 6A32   0004 0114 029E

        MOVR    R0,     R5                      ; 6A35   0085
        ADDR    R0,     R5                      ; 6A36   00C5
        SDBD                                    ; 6A37   0001
        ADDI    #$6C96, R5                      ; 6A38   02FD 0096 006C
        SDBD                                    ; 6A3B   0001
        MVI@    R5,     R0                      ; 6A3C   02A8
        MVO@    R0,     R4                      ; 6A3D   0260
        MVI     G_016B, R0                      ; 6A3E   0280 016B

        JSR     R5,     L_68FB                  ; 6A40   0004 0168 00FB

        SWAP    R0,     1                       ; 6A43   0040
        MVO@    R0,     R4                      ; 6A44   0260
        SWAP    R1,     1                       ; 6A45   0041
        NOP                                     ; 6A46   0034
        MVO@    R1,     R4                      ; 6A47   0261
        CLRR    R0                              ; 6A48   01C0
        MVO@    R0,     R4                      ; 6A49   0260
        MVO@    R0,     R4                      ; 6A4A   0260
        MVII    #$0002, R0                      ; 6A4B   02B8 0002
        MVO@    R0,     R4                      ; 6A4D   0260
        MVI     G_016B, R0                      ; 6A4E   0280 016B
        SWAP    R0,     1                       ; 6A50   0040
        XOR     G_016C, R0                      ; 6A51   03C0 016C
        MVO@    R0,     R4                      ; 6A53   0260
        J       L_63B1                          ; 6A54   0004 0360 03B1

L_6A57:
        PSHR    R5                              ; 6A57   0275
        MVI     G_015F, R5                      ; 6A58   0285 015F
        TSTR    R5                              ; 6A5A   00AD
        BNEQ    L_6988                          ; 6A5B   022C 00D4

        CMP     G_0163, R1                      ; 6A5D   0341 0163
        BEQ     L_6988                          ; 6A5F   0224 00D8

        PULR    R5                              ; 6A61   02B5
        PULR    R7                              ; 6A62   02B7

        DECLE   $00E0,  $00C0,  $00A0,  $0010   ; 6A63   00E0 00C0 00A0 0010
        DECLE   $0008,  $0004,  $0003,  $0002   ; 6A67   0008 0004 0003 0002
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A6B   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6A6F   00FF 00FF 00FF 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A73   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6A77   00FF 00FF 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A7B   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6A7F   00FF 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6A83   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A87   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6A8B   00FF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A8F   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $0000,  $0000   ; 6A93   00FF 00FF 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A97   0000 0000 0000 0000
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 6A9B   00FF 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A9F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA3   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA7   0000 0000 0000 0000
        DECLE   $007F,  $007F,  $007F,  $007F   ; 6AAB   007F 007F 007F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 6AAF   007F 007F 007F 007F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6AB3   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 6AB7   003F 003F 003F 003F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 6ABB   001F 001F 001F 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 6ABF   001F 001F 001F 001F

        INCR    R7                              ; 6AC3   000F
        INCR    R7                              ; 6AC4   000F
L_6AC5:
        INCR    R7                              ; 6AC5   000F
L_6AC6:
        INCR    R7                              ; 6AC6   000F
L_6AC7:
        INCR    R7                              ; 6AC7   000F
L_6AC8:
        INCR    R7                              ; 6AC8   000F
L_6AC9:
        INCR    R7                              ; 6AC9   000F
L_6ACA:
        INCR    R7                              ; 6ACA   000F

L_6ACB:
        SETC                                    ; 6ACB   0007
L_6ACC:
        SETC                                    ; 6ACC   0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 6ACD   0007 0007 0007 0007
        DECLE   $0007,  $0007,  $0003,  $0003   ; 6AD1   0007 0007 0003 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 6AD5   0003 0003 0003 0003
        DECLE   $0003,  $0003,  $0001,  $0001   ; 6AD9   0003 0003 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 6ADD   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 6AE1   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007F,  $00FF   ; 6AE9   0000 0000 007F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6AED   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $003F,  $007F   ; 6AF1   00FF 00FE 003F 007F
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6AF5   00FF 00FF 00FF 00FF
        DECLE   $00FE,  $00FC,  $001F,  $003F   ; 6AF9   00FE 00FC 001F 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FE   ; 6AFD   007F 00FF 00FF 00FE
        DECLE   $00FC,  $00F8,  $000F,  $001F   ; 6B01   00FC 00F8 000F 001F
        DECLE   $003F                           ; 6B05   003F

        SARC    R3,     2                       ; 6B06   007F
        ADDR    R7,     R6                      ; 6B07   00FE
        ADDR    R7,     R4                      ; 6B08   00FC
        ADDR    R7,     R0                      ; 6B09   00F8
        ADDR    R6,     R0                      ; 6B0A   00F0
        SETC                                    ; 6B0B   0007
        INCR    R7                              ; 6B0C   000F

        DECLE   $001F                           ; 6B0D   001F
L_6B0E:
        RSWD    R6                              ; 6B0E   003E
        DECLE   $007C,  $00F8,  $00F0,  $00E0   ; 6B0F   007C 00F8 00F0 00E0
        DECLE   $0003,  $0007,  $000E,  $001C   ; 6B13   0003 0007 000E 001C
        DECLE   $0038,  $0070,  $00E0,  $00C0   ; 6B17   0038 0070 00E0 00C0
        DECLE   $0001,  $0002,  $0004,  $0008   ; 6B1B   0001 0002 0004 0008
        DECLE   $0010,  $0020,  $0040,  $0080   ; 6B1F   0010 0020 0040 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B27   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF           ; 6B2B   00FF 00FF 00FF

        ADDR    R4,     R7                      ; 6B2E   00E7
        ADDR    R4,     R7                      ; 6B2F   00E7

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6B30   00FF 00FF 00FF 00FF
        DECLE   $00FF                           ; 6B34   00FF

        ADDR    R4,     R7                      ; 6B35   00E7

        ADDR    R0,     R3                      ; 6B36   00C3
        ADDR    R0,     R3                      ; 6B37   00C3
        ADDR    R4,     R7                      ; 6B38   00E7

        DECLE   $00FF,  $00FF,  $00FF           ; 6B39   00FF 00FF 00FF

        ADDR    R4,     R7                      ; 6B3C   00E7

        ADDR    R0,     R3                      ; 6B3D   00C3
        MOVR    R0,     R1                      ; 6B3E   0081
        MOVR    R0,     R1                      ; 6B3F   0081
        ADDR    R0,     R3                      ; 6B40   00C3
        ADDR    R4,     R7                      ; 6B41   00E7

        DECLE   $00FF,  $00E7,  $00C3,  $0081   ; 6B42   00FF 00E7 00C3 0081
        DECLE   $0000,  $0000                   ; 6B46   0000 0000

        MOVR    R0,     R1                      ; 6B48   0081
        ADDR    R0,     R3                      ; 6B49   00C3
        ADDR    R4,     R7                      ; 6B4A   00E7

        DECLE   $00C3,  $0081,  $0000,  $0000   ; 6B4B   00C3 0081 0000 0000
        DECLE   $0000,  $0000,  $0081,  $00C3   ; 6B4F   0000 0000 0081 00C3
        DECLE   $0081,  $0000,  $0000,  $0000   ; 6B53   0081 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0081   ; 6B57   0000 0000 0000 0081
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B5F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B63   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B67   0000 0000 0000 0000
        DECLE   $00FE,  $00FD,  $00FB,  $00F7   ; 6B6B   00FE 00FD 00FB 00F7

        ADDR    R5,     R7                      ; 6B6F   00EF
        ADDR    R3,     R7                      ; 6B70   00DF

        DECLE   $00BF                           ; 6B71   00BF

        SARC    R3,     2                       ; 6B72   007F
        ADDR    R7,     R4                      ; 6B73   00FC
        ADDR    R7,     R0                      ; 6B74   00F8
        ADDR    R6,     R1                      ; 6B75   00F1
        ADDR    R4,     R3                      ; 6B76   00E3
        ADDR    R0,     R7                      ; 6B77   00C7
        MOVR    R1,     R7                      ; 6B78   008F

        DECLE   $001F,  $003F                   ; 6B79   001F 003F

        ADDR    R7,     R0                      ; 6B7B   00F8
        ADDR    R6,     R0                      ; 6B7C   00F0
        ADDR    R4,     R0                      ; 6B7D   00E0
        ADDR    R0,     R1                      ; 6B7E   00C1
        MOVR    R0,     R3                      ; 6B7F   0083
        SETC                                    ; 6B80   0007
        INCR    R7                              ; 6B81   000F

        DECLE   $001F                           ; 6B82   001F
L_6B83:
        ADDR    R6,     R0                      ; 6B83   00F0
        DECLE   $00E0,  $00C0,  $0080,  $0001   ; 6B84   00E0 00C0 0080 0001

        DIS                                     ; 6B88   0003
        SETC                                    ; 6B89   0007
        INCR    R7                              ; 6B8A   000F

        ADDR    R4,     R0                      ; 6B8B   00E0
L_6B8C:
        ADDR    R0,     R0                      ; 6B8C   00C0
        DECLE   $0080,  $0000,  $0000,  $0001   ; 6B8D   0080 0000 0000 0001
        DECLE   $0003,  $0007,  $00C0,  $0080   ; 6B91   0003 0007 00C0 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B95   0000 0000 0000 0000
        DECLE   $0001,  $0003,  $0080,  $0000   ; 6B99   0001 0003 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B9D   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0000,  $0000   ; 6BA1   0000 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $007E,  $00FF   ; 6BA9   0000 0000 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BAD   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $007E,  $003C,  $007E   ; 6BB1   00FF 007E 003C 007E
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BB5   00FF 00FF 00FF 00FF
        DECLE   $007E,  $003C,  $0018,  $003C   ; 6BB9   007E 003C 0018 003C
        DECLE   $007E,  $00FF,  $00FF,  $007E   ; 6BBD   007E 00FF 00FF 007E
        DECLE   $003C,  $0018,  $0000,  $0018   ; 6BC1   003C 0018 0000 0018
        DECLE   $003C,  $007E,  $007E,  $003C   ; 6BC5   003C 007E 007E 003C
        DECLE   $0018,  $0000,  $0000,  $0000   ; 6BC9   0018 0000 0000 0000
        DECLE   $0018,  $003C,  $003C,  $0018   ; 6BCD   0018 003C 003C 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD1   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0000   ; 6BD5   0000 0018 0018 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BE5   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6BE9   0000 0000

        ADDR    R3,     R7                      ; 6BEB   00DF
        ADDR    R3,     R7                      ; 6BEC   00DF
        ADDR    R3,     R7                      ; 6BED   00DF
        ADDR    R5,     R7                      ; 6BEE   00EF

        DECLE   $00F7                           ; 6BEF   00F7

        ADDR    R7,     R3                      ; 6BF0   00FB
        ADDR    R7,     R3                      ; 6BF1   00FB
        ADDR    R7,     R3                      ; 6BF2   00FB
        ADDR    R1,     R7                      ; 6BF3   00CF
        ADDR    R1,     R7                      ; 6BF4   00CF
        ADDR    R3,     R7                      ; 6BF5   00DF
        ADDR    R5,     R7                      ; 6BF6   00EF

        DECLE   $00F7                           ; 6BF7   00F7

        ADDR    R7,     R3                      ; 6BF8   00FB
        ADDR    R6,     R3                      ; 6BF9   00F3
        ADDR    R6,     R3                      ; 6BFA   00F3
        ADDR    R0,     R3                      ; 6BFB   00C3
        ADDR    R0,     R7                      ; 6BFC   00C7
        ADDR    R1,     R7                      ; 6BFD   00CF
        ADDR    R5,     R7                      ; 6BFE   00EF

        DECLE   $00F7                           ; 6BFF   00F7

        ADDR    R6,     R3                      ; 6C00   00F3
        ADDR    R4,     R3                      ; 6C01   00E3
        ADDR    R0,     R3                      ; 6C02   00C3
        ADDR    R0,     R0                      ; 6C03   00C0
        ADDR    R0,     R3                      ; 6C04   00C3
        ADDR    R0,     R7                      ; 6C05   00C7
        ADDR    R5,     R7                      ; 6C06   00EF

        DECLE   $00F7                           ; 6C07   00F7

        ADDR    R4,     R3                      ; 6C08   00E3
        ADDR    R0,     R3                      ; 6C09   00C3
        DIS                                     ; 6C0A   0003
        ADDR    R0,     R0                      ; 6C0B   00C0
        ADDR    R0,     R0                      ; 6C0C   00C0
        ADDR    R0,     R6                      ; 6C0D   00C6
        ADDR    R5,     R7                      ; 6C0E   00EF

        DECLE   $00F7,  $0063,  $0003,  $0003   ; 6C0F   00F7 0063 0003 0003
        DECLE   $00C0,  $00C0,  $00C0,  $00EE   ; 6C13   00C0 00C0 00C0 00EE
        DECLE   $0077,  $0003,  $0003,  $0003   ; 6C17   0077 0003 0003 0003
        DECLE   $0040,  $0040,  $0040,  $006C   ; 6C1B   0040 0040 0040 006C
        DECLE   $0036,  $0002,  $0002,  $0002   ; 6C1F   0036 0002 0002 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C23   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C27   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C2B   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C2F   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C33   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C37   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0040,  $0000   ; 6C3B   0000 0000 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C3F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C43   0000 0000 0000 0000
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6C47   0010 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C4B   0000 0000 0000 0000
        DECLE   $0000,  $0004,  $0000,  $0000   ; 6C4F   0000 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C53   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C57   0000 0000 0000 0000
        DECLE   $0006,  $0001,  $0280,  $0300   ; 6C5B   0006 0001 0280 0300
        DECLE   $0000,  $00D0,  $006D,  $0001   ; 6C5F   0000 00D0 006D 0001
        DECLE   $0000,  $0000                   ; 6C63   0000 0000

        B       L_6C67                          ; 6C65   0200 0000

L_6C67:
        ADDR    R3,     R4                      ; 6C67   00DC
        DECLE   $006C,  $0008,  $0001,  $0000   ; 6C68   006C 0008 0001 0000

        B       L_6C6E                          ; 6C6C   0200 0000

L_6C6E:
        ADDR    R3,     R4                      ; 6C6E   00DC
        DECLE   $006C,  $0008,  $0009,  $0000   ; 6C6F   006C 0008 0009 0000

        B       L_6C75                          ; 6C73   0200 0000

L_6C75:
        ADDR    R3,     R4                      ; 6C75   00DC
        DECLE   $006C,  $0008,  $0011,  $0000   ; 6C76   006C 0008 0011 0000

        B       L_6C7C                          ; 6C7A   0200 0000

L_6C7C:
        ADDR    R3,     R4                      ; 6C7C   00DC
        DECLE   $006C,  $0008,  $0019,  $0000   ; 6C7D   006C 0008 0019 0000

        B       L_6C83                          ; 6C81   0200 0000

L_6C83:
        ADDR    R3,     R4                      ; 6C83   00DC
        DECLE   $006C,  $0008,  $0021,  $0000   ; 6C84   006C 0008 0021 0000

        B       L_6C8A                          ; 6C88   0200 0000

L_6C8A:
        ADDR    R3,     R4                      ; 6C8A   00DC
        DECLE   $006C,  $0008,  $0029,  $0000   ; 6C8B   006C 0008 0029 0000

        B       L_6C91                          ; 6C8F   0200 0000

L_6C91:
        ADDR    R3,     R4                      ; 6C91   00DC
        DECLE   $006C,  $0008,  $0031,  $0000   ; 6C92   006C 0008 0031 0000

        SLR     R1,     2                       ; 6C96   0065
        SAR     R0,     2                       ; 6C97   006C
        SAR     R0,     2                       ; 6C98   006C
        SAR     R0,     2                       ; 6C99   006C
        RRC     R3,     1                       ; 6C9A   0073
        SAR     R0,     2                       ; 6C9B   006C
        SARC    R2,     1                       ; 6C9C   007A
        SAR     R0,     2                       ; 6C9D   006C
        MOVR    R0,     R1                      ; 6C9E   0081
        SAR     R0,     2                       ; 6C9F   006C
        MOVR    R1,     R7                      ; 6CA0   008F

        SAR     R0,     2                       ; 6CA1   006C
        MOVR    R1,     R7                      ; 6CA2   008F

        DECLE   $006C,  $0082,  $0010,  $0081   ; 6CA3   006C 0082 0010 0081
        DECLE   $0010,  $0002,  $0000,  $0001   ; 6CA7   0010 0002 0000 0001
        DECLE   $0000                           ; 6CAB   0000
L_6CAC:
        PSHR    R5                              ; 6CAC   0275

        JSR     R5,     L_6A57                  ; 6CAD   0004 0168 0257

        MOVR    R1,     R4                      ; 6CB0   008C
        MOVR    R1,     R0                      ; 6CB1   0088

        JSR     R5,     .EXEC.76C               ; 6CB2   0004 0114 036C

        ADDR    R4,     R4                      ; 6CB5   00E4
        SDBD                                    ; 6CB6   0001
        ADDI    #$6CA4, R4                      ; 6CB7   02FC 00A4 006C
        SDBD                                    ; 6CBA   0001
        MVI@    R4,     R0                      ; 6CBB   02A0
        MOVR    R1,     R4                      ; 6CBC   008C
        MVO@    R0,     R4                      ; 6CBD   0260
        SDBD                                    ; 6CBE   0001
        MVII    #$6C5E, R0                      ; 6CBF   02B8 005E 006C
        MVO@    R0,     R4                      ; 6CC2   0260
        ADDI    #$0002, R4                      ; 6CC3   02FC 0002
        CLRR    R0                              ; 6CC5   01C0
        MVO@    R0,     R4                      ; 6CC6   0260
        MVO@    R0,     R4                      ; 6CC7   0260
        MVO@    R0,     R4                      ; 6CC8   0260
        NOP                                     ; 6CC9   0034
        MVO@    R0,     R4                      ; 6CCA   0260
        PULR    R7                              ; 6CCB   02B7

L_6CCC:
        PSHR    R5                              ; 6CCC   0275
        PSHR    R1                              ; 6CCD   0271
        MOVR    R1,     R0                      ; 6CCE   0088

        JSR     R5,     .EXEC.76C               ; 6CCF   0004 0114 036C

        CLRR    R0                              ; 6CD2   01C0
        MVO@    R0,     R1                      ; 6CD3   0248
        INCR    R1                              ; 6CD4   0009
        MVO@    R0,     R1                      ; 6CD5   0248
        PULR    R1                              ; 6CD6   02B1
        PULR    R7                              ; 6CD7   02B7

L_6CD8:
        JSR     R5,     L_6E4A                  ; 6CD8   0004 016C 024A

        PULR    R7                              ; 6CDB   02B7

        PSHR    R5                              ; 6CDC   0275
        CLRR    R5                              ; 6CDD   01ED
        MVI@    R1,     R2                      ; 6CDE   028A
        ANDI    #$0008, R2                      ; 6CDF   03BA 0008
        BEQ     L_6CE5                          ; 6CE1   0204 0002

        ADDI    #$0002, R5                      ; 6CE3   02FD 0002
L_6CE5:
        MVI@    R1,     R2                      ; 6CE5   028A
        SDBD                                    ; 6CE6   0001
        ANDI    #$4000, R2                      ; 6CE7   03BA 0000 0040
        BEQ     L_6CEE                          ; 6CEA   0204 0002

        ADDI    #$0004, R5                      ; 6CEC   02FD 0004
L_6CEE:
        ADDR    R5,     R7                      ; 6CEE   00EF
        B       L_6D47                          ; 6CEF   0200 0056
        B       L_6D7A                          ; 6CF1   0200 0087

        MVI@    R1,     R4                      ; 6CF3   028C
        ADDI    #$0005, R1                      ; 6CF4   02F9 0005
        MVI@    R1,     R5                      ; 6CF6   028D
        DECR    R5                              ; 6CF7   0015
        BPL     L_6D82                          ; 6CF8   0203 0088

        MOVR    R0,     R3                      ; 6CFA   0083
        ADDI    #$0002, R1                      ; 6CFB   02F9 0002
        MVI@    R1,     R2                      ; 6CFD   028A
        SWAP    R2,     1                       ; 6CFE   0042
        ANDI    #$00FF, R2                      ; 6CFF   03BA 00FF
        ADDI    #$0200, R2                      ; 6D01   02FA 0200
        MOVR    R2,     R0                      ; 6D03   0090

        JSR     R5,     L_6933                  ; 6D04   0004 0168 0133

        ANDI    #$0017, R4                      ; 6D07   03BC 0017
        BNEQ    L_6D13                          ; 6D09   020C 0008

        MVI     G_0177, R5                      ; 6D0B   0285 0177
        DECR    R5                              ; 6D0D   0015
        MVO     R5,     G_0177                  ; 6D0E   0245 0177

        JSR     R5,     L_6F5E                  ; 6D10   0004 016C 035E

L_6D13:
        MVO@    R0,     R2                      ; 6D13   0250
        SUBI    #$0006, R1                      ; 6D14   0339 0006
        CLRR    R5                              ; 6D16   01ED
        MVO@    R5,     R1                      ; 6D17   024D
        DECR    R1                              ; 6D18   0011
        MVO@    R5,     R1                      ; 6D19   024D
        SARC    R3,     1                       ; 6D1A   007B
        BC      L_6D46                          ; 6D1B   0201 0029

        MOVR    R3,     R1                      ; 6D1D   0099
        SLR     R1,     1                       ; 6D1E   0061
        PSHR    R4                              ; 6D1F   0274

        JSR     R5,     L_695E                  ; 6D20   0004 0168 015E

        PULR    R4                              ; 6D23   02B4
        CLRR    R0                              ; 6D24   01C0
        MVO@    R0,     R5                      ; 6D25   0268
        MVI     G_0177, R0                      ; 6D26   0280 0177
        DECR    R0                              ; 6D28   0010
        BLE     L_6CD8                          ; 6D29   0226 0052

        MVI     G_015F, R0                      ; 6D2B   0280 015F
        TSTR    R0                              ; 6D2D   0080
        BNEQ    L_6D43                          ; 6D2E   020C 0013

        MVI     G_015E, R0                      ; 6D30   0280 015E
        TSTR    R0                              ; 6D32   0080
        BEQ     L_6D43                          ; 6D33   0204 000E

        TSTR    R4                              ; 6D35   00A4
        BEQ     L_6D43                          ; 6D36   0204 000B

        MVI     G_0163, R0                      ; 6D38   0280 0163
        XORI    #$0001, R0                      ; 6D3A   03F8 0001
        MVO     R0,     G_0163                  ; 6D3C   0240 0163

        JSR     R5,     L_6CCC                  ; 6D3E   0004 016C 00CC

        XORI    #$0001, R1                      ; 6D41   03F9 0001

L_6D43:
        JSR     R5,     L_6CAC                  ; 6D43   0004 016C 00AC

L_6D46:
        PULR    R7                              ; 6D46   02B7

L_6D47:
        MVI@    R1,     R5                      ; 6D47   028D
        XORI    #$0008, R5                      ; 6D48   03FD 0008
        MVO@    R5,     R1                      ; 6D4A   024D
        ADDI    #$0007, R1                      ; 6D4B   02F9 0007
        MVI@    R1,     R2                      ; 6D4D   028A
        MOVR    R2,     R3                      ; 6D4E   0093
        ANDI    #$00FF, R2                      ; 6D4F   03BA 00FF
        SWAP    R3,     1                       ; 6D51   0043
        ANDI    #$00FF, R3                      ; 6D52   03BB 00FF
        ADDI    #$0200, R3                      ; 6D54   02FB 0200
        ADDI    #$0041, R2                      ; 6D56   02FA 0041
        CMPI    #$005B, R2                      ; 6D58   037A 005B
        BLT     L_6D6A                          ; 6D5A   0205 000E

        SUBI    #$003A, R2                      ; 6D5C   033A 003A
        CMPI    #$003B, R2                      ; 6D5E   037A 003B
        BLT     L_6D6A                          ; 6D60   0205 0008

        PSHR    R0                              ; 6D62   0270

        JSR     R5,     L_6F5E                  ; 6D63   0004 016C 035E

        MOVR    R0,     R2                      ; 6D66   0082
        PULR    R0                              ; 6D67   02B0
        B       L_6D76                          ; 6D68   0200 000C

L_6D6A:
        SLL     R2,     2                       ; 6D6A   004E
        SLL     R2,     1                       ; 6D6B   004A
        PSHR    R0                              ; 6D6C   0270
        SLR     R0,     2                       ; 6D6D   0064
        ADDR    R0,     R0                      ; 6D6E   00C0
        MOVR    R0,     R5                      ; 6D6F   0085
        SDBD                                    ; 6D70   0001
        ADDI    #$6CA8, R5                      ; 6D71   02FD 00A8 006C
        SDBD                                    ; 6D74   0001
        XOR@    R5,     R2                      ; 6D75   03EA
L_6D76:
        MVO@    R2,     R3                      ; 6D76   025A
        PULR    R0                              ; 6D77   02B0
        SUBI    #$0007, R1                      ; 6D78   0339 0007
L_6D7A:
        ADDI    #$0005, R1                      ; 6D7A   02F9 0005
        MVI@    R1,     R5                      ; 6D7C   028D
        INCR    R5                              ; 6D7D   000D
        CMPI    #$0008, R5                      ; 6D7E   037D 0008
        BEQ     L_6D88                          ; 6D80   0204 0006

L_6D82:
        MVO@    R5,     R1                      ; 6D82   024D
        INCR    R1                              ; 6D83   0009
        MVII    #$0002, R0                      ; 6D84   02B8 0002
        MVO@    R0,     R1                      ; 6D86   0248
        PULR    R7                              ; 6D87   02B7

L_6D88:
        SUBI    #$0005, R1                      ; 6D88   0339 0005
        MVI@    R1,     R5                      ; 6D8A   028D
        SDBD                                    ; 6D8B   0001
        ANDI    #$FFF7, R5                      ; 6D8C   03BD 00F7 00FF
        SDBD                                    ; 6D8F   0001
        XORI    #$4000, R5                      ; 6D90   03FD 0000 0040
        MVO@    R5,     R1                      ; 6D93   024D
        SARC    R0,     1                       ; 6D94   0078
        BNC     L_6D46                          ; 6D95   0229 0050

        SLR     R0,     1                       ; 6D97   0060
        PSHR    R1                              ; 6D98   0271
        MOVR    R0,     R1                      ; 6D99   0081

        JSR     R5,     L_695E                  ; 6D9A   0004 0168 015E

        PULR    R1                              ; 6D9D   02B1
        INCR    R5                              ; 6D9E   000D
        MVI@    R5,     R4                      ; 6D9F   02AC
        CMP@    R5,     R4                      ; 6DA0   036C
        BNEQ    L_6DC1                          ; 6DA1   020C 001E

        CMPI    #$00FF, R4                      ; 6DA3   037C 00FF
        BEQ     L_6DC1                          ; 6DA5   0204 001A

        JSR     R5,     L_6DE8                  ; 6DA7   0004 016C 01E8

        MVI@    R1,     R2                      ; 6DAA   028A
        SDBD                                    ; 6DAB   0001
        ANDI    #$FFE8, R2                      ; 6DAC   03BA 00E8 00FF
        MVO@    R2,     R1                      ; 6DAF   024A
        SUBI    #$0008, R1                      ; 6DB0   0339 0008
        MVI@    R1,     R2                      ; 6DB2   028A
        SDBD                                    ; 6DB3   0001
        ANDI    #$FFE8, R2                      ; 6DB4   03BA 00E8 00FF
        MVO@    R2,     R1                      ; 6DB7   024A
        ADDI    #$0008, R1                      ; 6DB8   02F9 0008
        PSHR    R1                              ; 6DBA   0271

        JSR     R5,     L_637C                  ; 6DBB   0004 0160 037C

        PULR    R1                              ; 6DBE   02B1
        B       L_6DC1                          ; 6DBF   0200 0000

L_6DC1:
        ADDI    #$0006, R1                      ; 6DC1   02F9 0006
        MVII    #$000F, R5                      ; 6DC3   02BD 000F
        MVO@    R5,     R1                      ; 6DC5   024D
        SUBI    #$0008, R1                      ; 6DC6   0339 0008
        MVO@    R5,     R1                      ; 6DC8   024D

        JSR     R5,     L_6DF3                  ; 6DC9   0004 016C 01F3
        JSR     R5,     L_6E0F                  ; 6DCC   0004 016C 020F

        PULR    R7                              ; 6DCF   02B7

        MOVR    R0,     R2                      ; 6DD0   0082
        ADDI    #$013B, R2                      ; 6DD1   02FA 013B
        CLRR    R4                              ; 6DD3   01E4
        MVO@    R4,     R2                      ; 6DD4   0254
        ADDI    #$0007, R1                      ; 6DD5   02F9 0007
        MVI@    R1,     R2                      ; 6DD7   028A
        MOVR    R2,     R3                      ; 6DD8   0093
        SDBD                                    ; 6DD9   0001
        ANDI    #$FF00, R2                      ; 6DDA   03BA 0000 00FF
        ANDI    #$00FF, R3                      ; 6DDD   03BB 00FF
        SWAP    R3,     1                       ; 6DDF   0043
        SUBI    #$0005, R1                      ; 6DE0   0339 0005
        MOVR    R1,     R4                      ; 6DE2   008C
        MVO@    R2,     R4                      ; 6DE3   0262
        MVO@    R3,     R4                      ; 6DE4   0263
        CLRR    R2                              ; 6DE5   01D2
        MVO@    R2,     R4                      ; 6DE6   0262
        MOVR    R5,     R7                      ; 6DE7   00AF

L_6DE8:
        PSHR    R5                              ; 6DE8   0275
        PSHR    R4                              ; 6DE9   0274
        MOVR    R0,     R5                      ; 6DEA   0085
        ADDI    #$016D, R5                      ; 6DEB   02FD 016D
        MVI@    R5,     R4                      ; 6DED   02AC
        INCR    R4                              ; 6DEE   000C
        DECR    R5                              ; 6DEF   0015
        MVO@    R4,     R5                      ; 6DF0   026C
        PULR    R4                              ; 6DF1   02B4
        PULR    R7                              ; 6DF2   02B7

L_6DF3:
        PSHR    R5                              ; 6DF3   0275
        PSHR    R3                              ; 6DF4   0273
        MOVR    R0,     R5                      ; 6DF5   0085
        ADDR    R5,     R5                      ; 6DF6   00ED
        ADDI    #$016F, R5                      ; 6DF7   02FD 016F
        SDBD                                    ; 6DF9   0001
        MVI@    R5,     R3                      ; 6DFA   02AB
        CMPI    #$03E7, R3                      ; 6DFB   037B 03E7
        BGE     L_6E05                          ; 6DFD   020D 0006

        INCR    R3                              ; 6DFF   000B
        SUBI    #$0002, R5                      ; 6E00   033D 0002
        MVO@    R3,     R5                      ; 6E02   026B
        SWAP    R3,     1                       ; 6E03   0043
        MVO@    R3,     R5                      ; 6E04   026B
L_6E05:
        PULR    R3                              ; 6E05   02B3
        PULR    R7                              ; 6E06   02B7

        DECLE   $0002,  $0000,  $016D,  $0202   ; 6E07   0002 0000 016D 0202
        DECLE   $0001,  $0000,  $016E,  $020F   ; 6E0B   0001 0000 016E 020F
L_6E0F:
        PSHR    R5                              ; 6E0F   0275
        MOVR    R0,     R5                      ; 6E10   0085
        ADDR    R5,     R5                      ; 6E11   00ED
        ADDR    R5,     R5                      ; 6E12   00ED
        SDBD                                    ; 6E13   0001
        ADDI    #$6E07, R5                      ; 6E14   02FD 0007 006E
        SDBD                                    ; 6E17   0001
        MVI@    R5,     R3                      ; 6E18   02AB
        MVI@    R5,     R4                      ; 6E19   02AC
        MVI@    R4,     R0                      ; 6E1A   02A0
        MVI@    R5,     R4                      ; 6E1B   02AC
        MVII    #$0003, R1                      ; 6E1C   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 6E1E   0004 0118 00C5

        PULR    R7                              ; 6E21   02B7

        PSHR    R5                              ; 6E22   0275
        MVI     G_0163, R0                      ; 6E23   0280 0163

        JSR     R5,     L_6E33                  ; 6E25   0004 016C 0233

        MVI     G_015F, R5                      ; 6E28   0285 015F
        TSTR    R5                              ; 6E2A   00AD
        BEQ     L_6E32                          ; 6E2B   0204 0005

        XORI    #$0001, R0                      ; 6E2D   03F8 0001

        JSR     R5,     L_6E33                  ; 6E2F   0004 016C 0233

L_6E32:
        PULR    R7                              ; 6E32   02B7

L_6E33:
        PSHR    R5                              ; 6E33   0275
        MOVR    R0,     R3                      ; 6E34   0083
        ADDR    R3,     R3                      ; 6E35   00DB
        ADDI    #$0173, R3                      ; 6E36   02FB 0173
        MVI@    R3,     R1                      ; 6E38   0299
        INCR    R1                              ; 6E39   0009
        CMPI    #$003C, R1                      ; 6E3A   0379 003C
        BLT     L_6E48                          ; 6E3C   0205 000A

        CLRR    R1                              ; 6E3E   01C9
        INCR    R3                              ; 6E3F   000B
        MVI@    R3,     R2                      ; 6E40   029A
        CMPI    #$0063, R2                      ; 6E41   037A 0063
        BGE     L_6E48                          ; 6E43   020D 0003

        INCR    R2                              ; 6E45   000A
        MVO@    R2,     R3                      ; 6E46   025A
        DECR    R3                              ; 6E47   0013
L_6E48:
        MVO@    R1,     R3                      ; 6E48   0259
        PULR    R7                              ; 6E49   02B7

L_6E4A:
        PSHR    R5                              ; 6E4A   0275
        SDBD                                    ; 6E4B   0001
        MVII    #$1906, R0                      ; 6E4C   02B8 0006 0019
        MVO     R0,     G_035D                  ; 6E4F   0240 035D

        JSR     R5,     L_5401                  ; 6E51   0004 0154 0001
        JSR     R5,     L_6FAE                  ; 6E54   0004 016C 03AE
        DECLE   $0200,  $02EF                   ; 6E57   0200 02EF

        CLRR    R1                              ; 6E59   01C9

        JSR     R5,     L_6CCC                  ; 6E5A   0004 016C 00CC

        INCR    R1                              ; 6E5D   0009

        JSR     R5,     L_6CCC                  ; 6E5E   0004 016C 00CC
        JSR     R5,     L_6FCE                  ; 6E61   0004 016C 03CE
        BIDECLE $6F0C                           ; 6E64   000C 006F

        CLRR    R1                              ; 6E66   01C9
        MVII    #$025A, R4                      ; 6E67   02BC 025A
        MVI     G_015E, R5                      ; 6E69   0285 015E
        TSTR    R5                              ; 6E6B   00AD
        BNEQ    L_6E70                          ; 6E6C   020C 0002

        MVII    #$025E, R4                      ; 6E6E   02BC 025E

L_6E70:
        JSR     R5,     L_6E7E                  ; 6E70   0004 016C 027E

        MVI     G_015E, R1                      ; 6E73   0281 015E
        TSTR    R1                              ; 6E75   0089
        BEQ     L_6E7D                          ; 6E76   0204 0005

        MVII    #$0260, R4                      ; 6E78   02BC 0260

        JSR     R5,     L_6E7E                  ; 6E7A   0004 016C 027E

L_6E7D:
        PULR    R7                              ; 6E7D   02B7

L_6E7E:
        PSHR    R5                              ; 6E7E   0275
        MVO     R1,     G_016A                  ; 6E7F   0241 016A
        MOVR    R1,     R5                      ; 6E81   008D
        ADDI    #$016D, R1                      ; 6E82   02F9 016D
        MVI@    R1,     R0                      ; 6E84   0288
        PSHR    R0                              ; 6E85   0270
        MVII    #$0003, R1                      ; 6E86   02B9 0003
        ADDR    R5,     R5                      ; 6E88   00ED
        SDBD                                    ; 6E89   0001
        ADDI    #$6CA8, R5                      ; 6E8A   02FD 00A8 006C
        SDBD                                    ; 6E8D   0001
        MVI@    R5,     R3                      ; 6E8E   02AB
        PSHR    R4                              ; 6E8F   0274

        JSR     R5,     X_PRNUM_RGT             ; 6E90   0004 0118 00C5

        MVI     G_016A, R5                      ; 6E93   0285 016A
        ADDR    R5,     R5                      ; 6E95   00ED
        ADDI    #$016F, R5                      ; 6E96   02FD 016F
        SDBD                                    ; 6E98   0001
        MVI@    R5,     R0                      ; 6E99   02A8
        PULR    R4                              ; 6E9A   02B4
        PSHR    R0                              ; 6E9B   0270
        ADDI    #$0014, R4                      ; 6E9C   02FC 0014
        PSHR    R4                              ; 6E9E   0274

        JSR     R5,     X_PRNUM_RGT             ; 6E9F   0004 0118 00C5

        PULR    R4                              ; 6EA2   02B4
        ADDI    #$0014, R4                      ; 6EA3   02FC 0014
        PULR    R1                              ; 6EA5   02B1
        PULR    R0                              ; 6EA6   02B0
        PSHR    R4                              ; 6EA7   0274

        JSR     R5,     L_6EF5                  ; 6EA8   0004 016C 02F5

        PULR    R4                              ; 6EAB   02B4
        ADDI    #$0014, R4                      ; 6EAC   02FC 0014
        PSHR    R4                              ; 6EAE   0274
        INCR    R4                              ; 6EAF   000C
        MVI     G_016A, R5                      ; 6EB0   0285 016A
        ADDR    R5,     R5                      ; 6EB2   00ED
        ADDI    #$0173, R5                      ; 6EB3   02FD 0173
        MVI@    R5,     R0                      ; 6EB5   02A8
        PSHR    R0                              ; 6EB6   0270
        PSHR    R5                              ; 6EB7   0275
        MVII    #$0002, R1                      ; 6EB8   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 6EBA   0004 0118 00AD

        SUBI    #$0003, R4                      ; 6EBD   033C 0003
        PULR    R5                              ; 6EBF   02B5
        MVI@    R5,     R0                      ; 6EC0   02A8
        PSHR    R0                              ; 6EC1   0270

        JSR     R5,     X_PRNUM_RGT             ; 6EC2   0004 0118 00C5

        ADDI    #$0002, R4                      ; 6EC5   02FC 0002
        MVII    #$00D0, R0                      ; 6EC7   02B8 00D0
        XORR    R3,     R0                      ; 6EC9   01D8
        MVO@    R0,     R4                      ; 6ECA   0260
        PULR    R0                              ; 6ECB   02B0
        MVII    #$003C, R1                      ; 6ECC   02B9 003C

        JSR     R5,     X_MPY                   ; 6ECE   0004 011C 01DC

        ADD@    R6,     R2                      ; 6ED1   02F2
        MOVR    R2,     R1                      ; 6ED2   0091
        MVII    #$016D, R2                      ; 6ED3   02BA 016D
        ADD     G_016A, R2                      ; 6ED5   02C2 016A
        MVI@    R2,     R2                      ; 6ED7   0292

        JSR     R5,     X_DIVR                  ; 6ED8   0004 011C 01F8

        MOVR    R0,     R1                      ; 6EDB   0081
        MVII    #$003C, R2                      ; 6EDC   02BA 003C

        JSR     R5,     X_DIV                   ; 6EDE   0004 011C 01FB

        PULR    R4                              ; 6EE1   02B4
        ADDI    #$0012, R4                      ; 6EE2   02FC 0012
        PSHR    R1                              ; 6EE4   0271
        MVII    #$0002, R1                      ; 6EE5   02B9 0002

        JSR     R5,     X_PRNUM_RGT             ; 6EE7   0004 0118 00C5

        ADDI    #$0002, R4                      ; 6EEA   02FC 0002
        MVII    #$00D0, R0                      ; 6EEC   02B8 00D0
        XORR    R3,     R0                      ; 6EEE   01D8
        MVO@    R0,     R4                      ; 6EEF   0260
        PULR    R0                              ; 6EF0   02B0

        JSR     R5,     X_PRNUM_ZRO             ; 6EF1   0004 0118 00AD

        PULR    R7                              ; 6EF4   02B7

L_6EF5:
        PSHR    R5                              ; 6EF5   0275
        PSHR    R1                              ; 6EF6   0271
        MVII    #$0064, R1                      ; 6EF7   02B9 0064

        JSR     R5,     X_MPY                   ; 6EF9   0004 011C 01DC

        MOVR    R2,     R1                      ; 6EFC   0091
        PULR    R2                              ; 6EFD   02B2

        JSR     R5,     X_DIV                   ; 6EFE   0004 011C 01FB

        MVII    #$0003, R1                      ; 6F01   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 6F03   0004 0118 00C5

        ADDR    R1,     R4                      ; 6F06   00CC
        MVII    #$0028, R0                      ; 6F07   02B8 0028
        XORR    R3,     R0                      ; 6F09   01D8
        MVO@    R0,     R4                      ; 6F0A   0260
        PULR    R7                              ; 6F0B   02B7

        DECLE   $0007,  $021A,  $0047,  $0061   ; 6F0C   0007 021A 0047 0061
        DECLE   $006D,  $0065,  $0020,  $004F   ; 6F10   006D 0065 0020 004F
        DECLE   $0076,  $0065,  $0072,  $0001   ; 6F14   0076 0065 0072 0001
        DECLE   $0003,  $0250,  $0053,  $0063   ; 6F18   0003 0250 0053 0063
        DECLE   $006F,  $0072,  $0065,  $0000   ; 6F1C   006F 0072 0065 0000
        DECLE   $0264,  $0054,  $0075,  $0072   ; 6F20   0264 0054 0075 0072
        DECLE   $006E,  $0073,  $0000,  $0278   ; 6F24   006E 0073 0000 0278
        DECLE   $0025,  $0020,  $0052,  $0069   ; 6F28   0025 0020 0052 0069
        DECLE   $0067,  $0068,  $0074,  $0000   ; 6F2C   0067 0068 0074 0000
        DECLE   $028C,  $0054,  $0069,  $006D   ; 6F30   028C 0054 0069 006D
        DECLE   $0065,  $0000,  $02A0,  $0041   ; 6F34   0065 0000 02A0 0041
        DECLE   $0076,  $0067,  $0020,  $0074   ; 6F38   0076 0067 0020 0074
        DECLE   $0069,  $006D,  $0065,  $0000   ; 6F3C   0069 006D 0065 0000

        PULR    R5                              ; 6F40   02B5
        RRC     R0,     1                       ; 6F41   0070
        SLR     R1,     2                       ; 6F42   0065
        RRC     R2,     1                       ; 6F43   0072
        NEGR    R0                              ; 6F44   0020
        RRC     R3,     1                       ; 6F45   0073
        SLR     R3,     1                       ; 6F46   0063
        SAR     R3,     2                       ; 6F47   006F
        RRC     R2,     1                       ; 6F48   0072
        SLR     R1,     2                       ; 6F49   0065
        EIS                                     ; 6F4A   0002
L_6F4B:
        PSHR    R5                              ; 6F4B   0275

        JSR     R5,     L_6FAE                  ; 6F4C   0004 016C 03AE
        DECLE   $0200,  $02EF                   ; 6F4F   0200 02EF

        PULR    R7                              ; 6F51   02B7

        DECLE   $0000,  $0018,  $0007,  $0008   ; 6F52   0000 0018 0007 0008
        DECLE   $0006,  $0008,  $0003,  $0008   ; 6F56   0006 0008 0003 0008
        DECLE   $0000,  $0008,  $0000           ; 6F5A   0000 0008 0000

        INCR    R0                              ; 6F5D   0008
L_6F5E:
        PSHR    R5                              ; 6F5E   0275
        MVII    #$0006, R0                      ; 6F5F   02B8 0006

        JSR     R5,     X_RAND2                 ; 6F61   0004 0114 029E

        MOVR    R0,     R5                      ; 6F64   0085
        ADDR    R5,     R5                      ; 6F65   00ED
        SDBD                                    ; 6F66   0001
        ADDI    #$6F52, R5                      ; 6F67   02FD 0052 006F
        SDBD                                    ; 6F6A   0001
        MVI@    R5,     R0                      ; 6F6B   02A8
        PSHR    R0                              ; 6F6C   0270
        MVII    #$0004, R0                      ; 6F6D   02B8 0004

        JSR     R5,     X_RAND2                 ; 6F6F   0004 0114 029E

        ADDI    #$0002, R0                      ; 6F72   02F8 0002
        SLL     R0,     2                       ; 6F74   004C
        SLL     R0,     1                       ; 6F75   0048
        ADD@    R6,     R0                      ; 6F76   02F0
        PULR    R7                              ; 6F77   02B7

L_6F78:
        PSHR    R5                              ; 6F78   0275
        MVII    #$0005, R3                      ; 6F79   02BB 0005
L_6F7B:
        MVII    #$00F0, R0                      ; 6F7B   02B8 00F0

        JSR     R5,     X_RAND2                 ; 6F7D   0004 0114 029E

        MOVR    R0,     R1                      ; 6F80   0081
        ADDI    #$0200, R1                      ; 6F81   02F9 0200
        MVI@    R1,     R0                      ; 6F83   0288
        MOVR    R0,     R2                      ; 6F84   0082
        SDBD                                    ; 6F85   0001
        ANDI    #$0800, R2                      ; 6F86   03BA 0000 0008
        BEQ     L_6FAA                          ; 6F89   0204 001F

        SLR     R0,     2                       ; 6F8B   0064
        SLR     R0,     1                       ; 6F8C   0060
        ANDI    #$00FF, R0                      ; 6F8D   03B8 00FF
        CMPI    #$0002, R0                      ; 6F8F   0378 0002
        BLT     L_6FAA                          ; 6F91   0205 0017

        CMPI    #$0006, R0                      ; 6F93   0378 0006
        BGT     L_6FAA                          ; 6F95   020E 0013

        MVI@    R1,     R2                      ; 6F97   028A
        SDBD                                    ; 6F98   0001
        ANDI    #$E7F8, R2                      ; 6F99   03BA 00F8 00E7
        MVII    #$0006, R0                      ; 6F9C   02B8 0006

        JSR     R5,     X_RAND2                 ; 6F9E   0004 0114 029E

        MOVR    R0,     R5                      ; 6FA1   0085
        ADDR    R5,     R5                      ; 6FA2   00ED
        SDBD                                    ; 6FA3   0001
        ADDI    #$6F52, R5                      ; 6FA4   02FD 0052 006F
        SDBD                                    ; 6FA7   0001
        XOR@    R5,     R2                      ; 6FA8   03EA
        MVO@    R2,     R1                      ; 6FA9   024A
L_6FAA:
        DECR    R3                              ; 6FAA   0013
        BNEQ    L_6F7B                          ; 6FAB   022C 0031
        PULR    R7                              ; 6FAD   02B7

L_6FAE:
        MVI@    R5,     R4                      ; 6FAE   02AC
        MVI@    R5,     R3                      ; 6FAF   02AB
        PSHR    R5                              ; 6FB0   0275
L_6FB1:
        MVI@    R4,     R0                      ; 6FB1   02A0
        MOVR    R0,     R1                      ; 6FB2   0081
        SDBD                                    ; 6FB3   0001
        ANDI    #$0800, R1                      ; 6FB4   03B9 0000 0008
        BEQ     L_6FC5                          ; 6FB7   0204 000C

        SLR     R0,     2                       ; 6FB9   0064
        SLR     R0,     1                       ; 6FBA   0060
        ANDI    #$00FF, R0                      ; 6FBB   03B8 00FF
        CMPI    #$0002, R0                      ; 6FBD   0378 0002
        BLT     L_6FC5                          ; 6FBF   0205 0004

        CMPI    #$0006, R0                      ; 6FC1   0378 0006
        BLE     L_6FCA                          ; 6FC3   0206 0005

L_6FC5:
        JSR     R5,     L_6F5E                  ; 6FC5   0004 016C 035E

        DECR    R4                              ; 6FC8   0014
        MVO@    R0,     R4                      ; 6FC9   0260
L_6FCA:
        CMPR    R3,     R4                      ; 6FCA   015C
        BLE     L_6FB1                          ; 6FCB   0226 001B
        PULR    R7                              ; 6FCD   02B7

L_6FCE:
        SDBD                                    ; 6FCE   0001
        MVI@    R5,     R4                      ; 6FCF   02AC
        PSHR    R5                              ; 6FD0   0275
L_6FD1:
        MVI@    R4,     R3                      ; 6FD1   02A3
        MOVR    R3,     R0                      ; 6FD2   0098
        ANDI    #$0007, R3                      ; 6FD3   03BB 0007
        ANDI    #$0008, R0                      ; 6FD5   03B8 0008
        BEQ     L_6FDD                          ; 6FD7   0204 0004

        SDBD                                    ; 6FD9   0001
        XORI    #$1000, R3                      ; 6FDA   03FB 0000 0010
L_6FDD:
        MVI@    R4,     R5                      ; 6FDD   02A5
L_6FDE:
        MVI@    R4,     R0                      ; 6FDE   02A0
        SUBI    #$0020, R0                      ; 6FDF   0338 0020
        BMI     L_6FE9                          ; 6FE1   020B 0006

        SLL     R0,     2                       ; 6FE3   004C
        SLL     R0,     1                       ; 6FE4   0048
        XORR    R3,     R0                      ; 6FE5   01D8
        MVO@    R0,     R5                      ; 6FE6   0268
        B       L_6FDE                          ; 6FE7   0220 000A

L_6FE9:
        ADDI    #$0020, R0                      ; 6FE9   02F8 0020
        BEQ     L_6FDD                          ; 6FEB   0224 000F

        DECR    R0                              ; 6FED   0010
        BEQ     L_6FD1                          ; 6FEE   0224 001E
        PULR    R7                              ; 6FF0   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $51BB       $51BB  
;;  $521A       $5218  
;;  $523B       $521A  
;;  $524F       $524A  
;;  $527D       <entry>
;;  $5288       <entry>
;;  $528B       <entry>
;;  $529C       $58CA  
;;  $5308       $530E  
;;  $532D       $5357  
;;  $5367       $536D  
;;  $537F       $5362   $5365  
;;  $5380       $528C   $64B8   $6619  
;;  $5388       $539F  
;;  $5389       $53A6  
;;  $5399       $539B  
;;  $53A2       $5390  
;;  $53B8       $53C9  
;;  $53C7       $53C7  
;;  $53C8       $64B2   $6613  
;;  $53D5       $53E6  
;;  $53E9       $57C4   $5A13  
;;  $53EA       $626E  
;;  $53F5       $53FE  
;;  $5400       $53F7  
;;  $5401       $67FC   $6E51  
;;  $5402       $57C7   $61C8  
;;  $540F       $549F   $5DDB  
;;  $5411       $5414  
;;  $546F       $5483  
;;  $5491       $549A  
;;  $54DF       $5576   $5598   $56C3  
;;  $54E9       $54E4  
;;  $54EE       $5695  
;;  $54EF       $54CB  
;;  $5507       $549C   $5698  
;;  $550C       $5517  
;;  $551A       $550C   $5511  
;;  $5531       $551E  
;;  $5532       $5520   $5F4A  
;;  $553C       $553D  
;;  $5545       $557E   $560B   $5626  
;;  $554E       $554A   $5553  
;;  $5555       $554F  
;;  $5556       $5571   $55C3   $5645  
;;  $5569       $5565  
;;  $5574       $555F  
;;  $5576       $55B0  
;;  $558C       $5588  
;;  $558D       $5591  
;;  $55BA       $55B4  
;;  $55D8       $55A8   $55B8   $55C7   $55CA   $5677  
;;  $55D9       $567B  
;;  $55E1       $564D  
;;  $55E2       $55D2   $55E0  
;;  $55F5       $5608  
;;  $5604       $5600  
;;  $560A       $55F7  
;;  $5617       $55CE  
;;  $5647       $5579  
;;  $5648       $5650   $5667  
;;  $5652       $55EA   $564B  
;;  $5659       $561E   $5632   $5637  
;;  $565A       $55D6  
;;  $5669       $55AC   $565D   $5662  
;;  $567F       $5674  
;;  $568E       $5686  
;;  $5690       $5670   $567D   $5681  
;;  $5695       $5593   $568E  
;;  $56C8       $556B   $5604  
;;  $56C9       $56C7  
;;  $56EB       $56B7   $56BB   $56BE  
;;  $5722       $5688   $57F0  
;;  $5735       $5726   $572C  
;;  $5742       $5752  
;;  $5755       $573B   $574B  
;;  $575E       $575A  
;;  $5771       $5769  
;;  $5772       $575F   $5764  
;;  $5773       $579C  
;;  $579E       $5776   $577A   $5788   $578C   $5795   $5799  
;;  $579F       $54C5  
;;  $57A0       $56B0  
;;  $57B2       $57A5  
;;  $57CA       $568B  
;;  $57CE       $57DD  
;;  $57E0       $565F  
;;  $57FD       $57E5   $57F9  
;;  $580F       $54D7  
;;  $5829       $54E6  
;;  $5839       $56E2  
;;  $5846       $583B   $583E   $5841  
;;  $5847       $5844  
;;  $5870       $54C8   $55C0   $55DD   $5656   $56A8   $5899  
;;  $5891       $566D  
;;  $590C       $591C  
;;  $591E       $5915  
;;  $5934       $593B  
;;  $598B       $59AF  
;;  $59A2       $599B   $599F  
;;  $59A7       $5994  
;;  $59B2       $5917   $5AB1  
;;  $59B9       $59BF  
;;  $59E5       $59D0  
;;  $59E6       $58D8   $5C05  
;;  $5A13       $5A0B  
;;  $5A30       $5A05  
;;  $5A3E       $5A45  
;;  $5A3F       $5A34  
;;  $5A47       $5A11   $5A3C  
;;  $5A5D       $5A51   $5A58  
;;  $5A60       $5A5E  
;;  $5A9A       $5AA9  
;;  $5AAC       $5A9E  
;;  $5ADC       $5A81   $5A9B  
;;  $5B08       $5AC6   $5B72   $5B7B   $5FE0  
;;  $5B19       $5B11  
;;  $5B25       $5C09  
;;  $5B26       $5B24  
;;  $5B43       $5B22   $5B2C  
;;  $5B44       $5A8A  
;;  $5B5D       $5B49  
;;  $5B5E       $5953  
;;  $5B5F       $5A47  
;;  $5B95       $5B8E  
;;  $5BD6       $5BDA  
;;  $5BDC       $5BD7  
;;  $5C02       $5BFF  
;;  $5C2E       $5BDD  
;;  $5C43       $5BB8   $5BBC   $5BC0   $5BC6  
;;  $5C44       $5C2E  
;;  $5C5D       $5B5A  
;;  $5C87       $5C7F  
;;  $5C8C       $5C71  
;;  $5C97       $5BD2  
;;  $5DA5       $5DC3   $5DC7  
;;  $5DCB       $6251  
;;  $5E2E       $5E0D  
;;  $5E67       $5DEB   $5E0F  
;;  $5E6A       $5E73  
;;  $5ED7       $5EBE  
;;  $5ED8       $5EC4   $5ECA  
;;  $5EF3       $5EED  
;;  $5EF7       $5EF1  
;;  $5F09       $5EE3   $5EE8  
;;  $5F0F       $5F07  
;;  $5F13       $5F0D  
;;  $5F1C       $5EB9   $5F6C  
;;  $5F25       $5F44   $5F48  
;;  $5F38       $5F35  
;;  $5F52       $5F58  
;;  $5F5C       $5F21  
;;  $5F5D       $5E40   $623E   $6257  
;;  $5FE7       $5FA6   $5FB1   $5FB5   $6079   $608B   $609F   $60A7   $60AB  
;;  $5FE7       $60D6   $60DF   $60E6  
;;  $5FE8       $5FA2  
;;  $6003       $5FFB  
;;  $6008       $5FFF  
;;  $602C       $6025  
;;  $603C       $5ECF   $5ED4   $5FE4  
;;  $6054       $604E  
;;  $6055       $603E  
;;  $6056       $5E07   $5E2B   $602E   $6097  
;;  $6057       $60CB  
;;  $6067       $6063  
;;  $606B       $605A  
;;  $607B       $606E  
;;  $609D       $6087  
;;  $60B3       $60AF  
;;  $60B9       $60BF  
;;  $60C1       $60BB  
;;  $60C9       $60B5  
;;  $60CA       $60C7  
;;  $60CE       $5FEF   $5FF3   $6001   $6005  
;;  $60F2       $59FF   $5A36   $5A3F   $60D0   $60D9  
;;  $60FF       $60F8  
;;  $6100       $60FB  
;;  $6102       $5E43  
;;  $611B       $610D   $6110  
;;  $6120       $611B  
;;  $6122       $6119  
;;  $613D       $6106   $61B0   $61B8   $61D1  
;;  $613E       $6114  
;;  $613F       $607B  
;;  $614C       $6151  
;;  $6162       $616F  
;;  $616C       $6165  
;;  $6197       $6193  
;;  $61BA       $61B5  
;;  $61CB       $61AC  
;;  $61D3       $61CE  
;;  $61DC       $61DF  
;;  $61E2       $61C5  
;;  $61E3       $61E1  
;;  $61EB       $6197   $61E9   $6216  
;;  $6205       $61F9  
;;  $620D       $6207  
;;  $623B       $61F5  
;;  $6254       $6245  
;;  $6271       $61BB   $6211  
;;  $627D       $627A  
;;  $627F       $6286  
;;  $6285       $6282  
;;  $6289       $6185   $623B   $6254  
;;  $6290       $5C1D  
;;  $634E       <entry>
;;  $6353       $62AE  
;;  $6354       $626B  
;;  $6355       $609A  
;;  $637C       $6DBB  
;;  $63B1       $6A54  
;;  $6479       $6477  
;;  $64B1       $58D5  
;;  $6502       $6500  
;;  $652C       $652A  
;;  $652D       $652B  
;;  $653C       $653A  
;;  $653D       $653B  
;;  $6612       $5DCB  
;;  $66F3       $6704   $6708  
;;  $670C       $671B   $671F  
;;  $6726       $6736   $673A  
;;  $673E       $6724  
;;  $6771       $6784  
;;  $6779       $677B  
;;  $6786       $6780  
;;  $6788       $678A  
;;  $679B       $67AF  
;;  $679E       $67A9  
;;  $6823       $681C  
;;  $68AD       $6A08  
;;  $68BC       $68C0  
;;  $68CA       $68BD  
;;  $68CE       $6885  
;;  $68CF       $68D3  
;;  $68D7       $68D0  
;;  $68D8       $68D6  
;;  $68DA       $678C  
;;  $68E1       $68EE  
;;  $68F1       $68FC   $6937   $694E  
;;  $68F3       $68F6  
;;  $68F4       $68F2  
;;  $68FB       $67B3   $67C6   $67D5   $6A40  
;;  $6901       $68FF  
;;  $690A       $6924  
;;  $6915       $6912  
;;  $691C       $6919  
;;  $6923       $69E6  
;;  $6929       $6927  
;;  $6933       $67A4   $6D04  
;;  $6947       $6A05  
;;  $695E       $69FB   $6D20   $6D9A  
;;  $6988       $6975   $69BE   $69E3   $69F6   $6A02   $6A5B   $6A5F  
;;  $6997       $6995  
;;  $69A9       $665B  
;;  $69B1       $69AB  
;;  $69B2       $69B0  
;;  $6A57       $6971   $69DF   $6CAD  
;;  $6AC5       $6AC3  
;;  $6AC6       $6AC4  
;;  $6AC7       $6AC5  
;;  $6AC8       $6AC6  
;;  $6AC9       $6AC7  
;;  $6ACA       $6AC8  
;;  $6ACB       $6AC9  
;;  $6ACC       $6ACA  
;;  $6B0E       $6B0C  
;;  $6B83       $6B81  
;;  $6B8C       $6B8A  
;;  $6C67       $6C65  
;;  $6C6E       $6C6C  
;;  $6C75       $6C73  
;;  $6C7C       $6C7A  
;;  $6C83       $6C81  
;;  $6C8A       $6C88  
;;  $6C91       $6C8F  
;;  $6CAC       $67E1   $67E6   $6D43  
;;  $6CCC       $6D3E   $6E5A   $6E5E  
;;  $6CD8       $6D29  
;;  $6CE5       $6CE1  
;;  $6CEE       $6CEA  
;;  $6D13       $6D09  
;;  $6D43       $6D2E   $6D33   $6D36  
;;  $6D46       $6D1B   $6D95  
;;  $6D47       $6CEF  
;;  $6D6A       $6D5A   $6D60  
;;  $6D76       $6D68  
;;  $6D7A       $6CF1  
;;  $6D82       $6CF8  
;;  $6D88       $6D80  
;;  $6DC1       $6DA1   $6DA5   $6DBF  
;;  $6DE8       $6DA7  
;;  $6DF3       $6DC9  
;;  $6E05       $6DFD  
;;  $6E0F       $6816   $6820   $6DCC  
;;  $6E32       $6E2B  
;;  $6E33       $6E25   $6E2F  
;;  $6E48       $6E3C   $6E43  
;;  $6E4A       $6CD8  
;;  $6E70       $6E6C  
;;  $6E7D       $6E76  
;;  $6E7E       $6E70   $6E7A  
;;  $6EF5       $6EA8  
;;  $6F4B       $66F0  
;;  $6F5E       $6D10   $6D63   $6FC5  
;;  $6F78       $665E  
;;  $6F7B       $6FAB  
;;  $6FAA       $6F89   $6F91   $6F95  
;;  $6FAE       $6790   $67F2   $6810   $6E54   $6F4C  
;;  $6FB1       $6FCB  
;;  $6FC5       $6FB7   $6FBF  
;;  $6FCA       $6FC3  
;;  $6FCE       $66F3   $670C   $6726   $67E9   $67F7   $6E61  
;;  $6FD1       $6FEE  
;;  $6FDD       $6FD7   $6FEB  
;;  $6FDE       $6FE7  
;;  $6FE9       $6FE1  
;; ======================================================================== ;;
