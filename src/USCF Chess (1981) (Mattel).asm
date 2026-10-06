
        ORG     $5000
.HEADER:
        BIDECLE $5120           ; 5000  Ptr: MOB graphic images
        BIDECLE $5026           ; 5002  Ptr: EXEC timer table
        BIDECLE $5047           ; 5004  Ptr: Start of game
        BIDECLE $5130           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5016           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5036           ; 500A  Ptr: Date/Title
        DECLE   $001E           ; 500C  Key-click / flags
        DECLE   $0001           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0003,  $000A   ; 500F  Color Stack init (0, 1)
        DECLE   $0003,  $000A   ; 5011  Color Stack init (2, 3)
        DECLE   $000B           ; 5013  Border color init

        DECLE   $01F0,  $01E8                   ; 5014   01F0 01E8
.GRAM_INIT_5016:
        DECLE   $0017           ; 5016  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5017  #00-07:  CART #00-07 ----
        DECLE   $0010           ; 5019  #08   :  CART #08    ----
        DECLE   $003F,  $0030   ; 501A  #09-09:  GROM #5F-5F ----
        DECLE   $0001,  $0340   ; 501C  #0A-10:  GRAM #00-06 ----
        DECLE   $0203,  $0040   ; 501E  #11-11:  GRAM #01-01 X---
        DECLE   $0005,  $00C0   ; 5020  #12-13:  GRAM #02-03 ----
        DECLE   $0209,  $0040   ; 5022  #14-14:  GRAM #04-04 X---
        DECLE   $000B,  $00C0   ; 5024  #15-16:  GRAM #05-06 ----

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5026  Timer dispatch/interval
        DECLE   $00FA,  $0062,  $0001,  $0000; 502A  Timer dispatch/interval
        DECLE   $00CB,  $006E,  $0006,  $0000; 502E  Timer dispatch/interval
        BIDECLE $0000           ; 5032  End of timer table

        DECLE   $0000,  $0000                   ; 5034   0000 0000
.TITLE:
        DECLE   $0051                           ; 5036  Cartridge year
        STRING  "CHESS"                         ; 5037  Title string
        DECLE   $0000                           ; 503C  


        ADDR    R4,     R1                      ; 503D   00E1
        RLC     R0,     1                       ; 503E   0050
        NEGR    R3                              ; 503F   0023
        SAR     R0,     2                       ; 5040   006C
        MOVR    R5,     R7                      ; 5041   00AF

        RLC     R1,     1                       ; 5042   0051
        SLLC    R1,     2                       ; 5043   005D
        SAR     R1,     2                       ; 5044   006D
        MOVR    R3,     R5                      ; 5045   009D
        SAR     R1,     2                       ; 5046   006D
.START:
        PSHR    R5                              ; 5047   0275

        JSR     R5,     L_6000                  ; 5048   0004 0160 0000

        CLRR    R0                              ; 504B   01C0
        MVO     R0,     G_0334                  ; 504C   0240 0334
        INCR    R0                              ; 504E   0008
        SDBD                                    ; 504F   0001
        MVII    #$D11E, R4                      ; 5050   02BC 001E 00D1
        MVO@    R0,     R4                      ; 5053   0260
        SDBD                                    ; 5054   0001
        MVII    #$503D, R0                      ; 5055   02B8 003D 0050
        MVO     R0,     G_035D                  ; 5058   0240 035D
        MVII    #$0040, R0                      ; 505A   02B8 0040
        MVO     R0,     G_0117                  ; 505C   0240 0117
        MVII    #$0078, R0                      ; 505E   02B8 0078
        MVO     R0,     G_0116                  ; 5060   0240 0116
        MVII    #$0018, R0                      ; 5062   02B8 0018
        MVO     R0,     G_0119                  ; 5064   0240 0119
        MVII    #$0050, R0                      ; 5066   02B8 0050
        MVO     R0,     G_0118                  ; 5068   0240 0118

L_506A:
        JSR     R5,     L_6CB0                  ; 506A   0004 016C 00B0

        MVII    #$0001, R0                      ; 506D   02B8 0001
        MVO     R0,     G_0168                  ; 506F   0240 0168
        MVII    #$0200, R4                      ; 5071   02BC 0200
        MVII    #$00F0, R0                      ; 5073   02B8 00F0
        SDBD                                    ; 5075   0001
        MVII    #$16DB, R1                      ; 5076   02B9 00DB 0016

        JSR     R5,     X_FILL_MEM              ; 5079   0004 0114 0341

        MVII    #$000A, R0                      ; 507C   02B8 000A
        SDBD                                    ; 507E   0001
        MVII    #$184B, R1                      ; 507F   02B9 004B 0018
        MVII    #$021A, R4                      ; 5082   02BC 021A

        JSR     R5,     X_FILL_MEM              ; 5084   0004 0114 0341

        MVII    #$000A, R0                      ; 5087   02B8 000A
        MVII    #$02CE, R4                      ; 5089   02BC 02CE

        JSR     R5,     X_FILL_MEM              ; 508B   0004 0114 0341

        CLRR    R2                              ; 508E   01D2
        MOVR    R1,     R3                      ; 508F   008B
L_5090:
        MVII    #$0237, R4                      ; 5090   02BC 0237
        ADDR    R2,     R4                      ; 5092   00D4
        MVO@    R3,     R4                      ; 5093   0263
        SUBI    #$000A, R4                      ; 5094   033C 000A
        MVO@    R3,     R4                      ; 5096   0263
        MVII    #$0008, R1                      ; 5097   02B9 0008
        SWAP    R1,     1                       ; 5099   0041
        MVO@    R1,     R4                      ; 509A   0261
        MVII    #$0028, R1                      ; 509B   02B9 0028
        SWAP    R1,     1                       ; 509D   0041
        MVII    #$0007, R0                      ; 509E   02B8 0007

        JSR     R5,     X_FILL_MEM              ; 50A0   0004 0114 0341

        ADDI    #$0014, R2                      ; 50A3   02FA 0014
        CMPI    #$008C, R2                      ; 50A5   037A 008C
        BLE     L_5090                          ; 50A7   0226 0018

        MOVR    R7,     R1                      ; 50A9   00B9
        ADDI    #$005F, R1                      ; 50AA   02F9 005F
        MVII    #$031D, R2                      ; 50AC   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 50AE   0004 0114 02B2

        MOVR    R7,     R4                      ; 50B1   00BC
        ADDI    #$001B, R4                      ; 50B2   02FC 001B
L_50B4:
        MVI@    R4,     R0                      ; 50B4   02A0
        TSTR    R0                              ; 50B5   0080
        BNEQ    L_50BB                          ; 50B6   020C 0003
        J       L_6320                          ; 50B8   0004 0360 0320

L_50BB:
        MVO     R0,     G_0197                  ; 50BB   0240 0197

        JSR     R5,     L_6D47                  ; 50BD   0004 016C 0147
        JSR     R5,     L_6EBB                  ; 50C0   0004 016C 02BB

        MVI@    R2,     R3                      ; 50C3   0293
        SDBD                                    ; 50C4   0001
        ANDI    #$FF7F, R3                      ; 50C5   03BB 007F 00FF
        XORI    #$0080, R3                      ; 50C8   03FB 0080
        MVO@    R3,     R2                      ; 50CA   0253
        B       L_50B4                          ; 50CB   0220 0018

        DECLE   $0057,  $0067,  $0050,  $0060   ; 50CD   0057 0067 0050 0060
        DECLE   $0000                           ; 50D1   0000
L_50D2:
        PSHR    R5                              ; 50D2   0275
        MVII    #$031D, R1                      ; 50D3   02B9 031D

        JSR     R5,     .EXEC.777               ; 50D5   0004 0114 0377

        SLR     R2,     2                       ; 50D8   0066
        SLR     R2,     1                       ; 50D9   0062
        SLR     R3,     2                       ; 50DA   0067
        SLR     R3,     1                       ; 50DB   0063
        MVO     R2,     G_0165                  ; 50DC   0242 0165
        MVO     R3,     G_0166                  ; 50DE   0243 0166
        PULR    R7                              ; 50E0   02B7

L_50E1:
        PSHR    R5                              ; 50E1   0275
        MOVR    R0,     R2                      ; 50E2   0082
        MVII    #$000A, R0                      ; 50E3   02B8 000A
        SDBD                                    ; 50E5   0001
        MVII    #$184B, R1                      ; 50E6   02B9 004B 0018
        MVII    #$02CE, R4                      ; 50E9   02BC 02CE

        JSR     R5,     X_FILL_MEM              ; 50EB   0004 0114 0341

        SDBD                                    ; 50EE   0001
        MVII    #$16DB, R1                      ; 50EF   02B9 00DB 0016
        MVII    #$0004, R0                      ; 50F2   02B8 0004

        JSR     R5,     X_FILL_MEM              ; 50F4   0004 0114 0341

        TSTR    R2                              ; 50F7   0092
        BMI     L_5106                          ; 50F8   020B 000C

        MVII    #$0023, R0                      ; 50FA   02B8 0023
        MOVR    R2,     R1                      ; 50FC   0091

        JSR     R5,     .EXEC.629               ; 50FD   0004 0114 0229

        CLRR    R3                              ; 5100   01DB
        MVO     R3,     G_0324                  ; 5101   0243 0324
        MVO     R0,     G_0321                  ; 5103   0240 0321
        PULR    R7                              ; 5105   02B7
L_5106:
        J       L_5210                          ; 5106   0004 0350 0210

        DECLE   $0081,  $0010,  $0019,  $0051   ; 5109   0081 0010 0019 0051
        DECLE   $0000,  $0050,  $0000,  $0040   ; 510D   0000 0050 0000 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5111   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5115   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $0029,  $0052   ; 5119   0300 0000 0029 0052
        DECLE   $0001,  $0000,  $0000,  $00C3   ; 511D   0001 0000 0000 00C3
        DECLE   $0081,  $0000,  $0000,  $0000   ; 5121   0081 0000 0000 0000
        DECLE   $0000,  $0081,  $00C3,  $0080   ; 5125   0000 0081 00C3 0080
        DECLE   $0010,  $0070,  $0051,  $0000   ; 5129   0010 0070 0051 0000
        DECLE   $0000,  $0000,  $0000           ; 512D   0000 0000 0000
.GFX_LIST_5130:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5130  CART PIC #00
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5134  
        DECLE   $0004,  $0014,  $0022,  $0036   ; 5138  CART PIC #01
        DECLE   $001C,  $0008,  $003E,  $0000   ; 513C  
        DECLE   $0000,  $002A,  $003E,  $002A   ; 5140  CART PIC #02
        DECLE   $0014,  $001C,  $003E,  $0000   ; 5144  
        DECLE   $002A,  $005D,  $002A,  $001C   ; 5148  CART PIC #03
        DECLE   $0008,  $001C,  $003E,  $0000   ; 514C  
        DECLE   $0008,  $0036,  $003E,  $0038   ; 5150  CART PIC #04
        DECLE   $0038,  $0018,  $003E,  $0000   ; 5154  
        DECLE   $0008,  $001C,  $0008,  $0022   ; 5158  CART PIC #05
        DECLE   $003E,  $0008,  $003E,  $0000   ; 515C  
        DECLE   $0000,  $0000,  $0008,  $0000   ; 5160  CART PIC #06
        DECLE   $0008,  $0008,  $001C,  $0000   ; 5164  
        DECLE   $0000,  $00AE,  $00A8,  $00AE   ; 5168  CART PIC #07
        DECLE   $00A2,  $004E,  $0000,  $0000   ; 516C  
        DECLE   $0300,  $0000,  $0070,  $006E   ; 5170  CART PIC #08
        DECLE   $0001,  $0002,  $0000,  $0275   ; 5174  

        JSR     R5,     L_6EAD                  ; 5178   0004 016C 02AD

        MVI     G_016A, R2                      ; 517B   0282 016A
        SDBD                                    ; 517D   0001
        MVII    #$D0FA, R4                      ; 517E   02BC 00FA 00D0
        MVO@    R2,     R4                      ; 5181   0262
        MVI     G_0169, R2                      ; 5182   0282 0169
        MVO@    R2,     R4                      ; 5184   0262
        MVI     G_0190, R2                      ; 5185   0282 0190
        MVO@    R2,     R4                      ; 5187   0262
        CLRR    R0                              ; 5188   01C0
        MVO     R0,     G_0192                  ; 5189   0240 0192
        MVO     R0,     G_0190                  ; 518B   0240 0190

        JSR     R5,     L_6044                  ; 518D   0004 0160 0044

        BNC     L_519D                          ; 5190   0209 000B

        JSR     R5,     L_6D72                  ; 5192   0004 016C 0172
        JSR     R5,     X_PLAY_RAZZ2            ; 5195   0004 011C 02BD

        MVII    #$00FF, R3                      ; 5198   02BB 00FF
        MVO     R3,     .BTAB.D0                ; 519A   0243 02D0
        PULR    R7                              ; 519C   02B7

L_519D:
        JSR     R5,     L_6135                  ; 519D   0004 0160 0135
        JSR     R5,     L_61A7                  ; 51A0   0004 0160 01A7

        BC      L_51A9                          ; 51A3   0201 0004

        MVII    #$0007, R0                      ; 51A5   02B8 0007
        MVO     R0,     G_016F                  ; 51A7   0240 016F

L_51A9:
        JSR     R5,     L_631F                  ; 51A9   0004 0160 031F

        J       L_52B5                          ; 51AC   0004 0350 02B5

        PSHR    R5                              ; 51AF   0275
        CMPI    #$0001, R0                      ; 51B0   0378 0001
        BNEQ    L_51DB                          ; 51B2   020C 0027

        MVI     G_016F, R0                      ; 51B4   0280 016F
        TSTR    R0                              ; 51B6   0080
        BNEQ    L_51DB                          ; 51B7   020C 0022

        JSR     R5,     L_6FBA                  ; 51B9   0004 016C 03BA
        JSR     R5,     L_50D2                  ; 51BC   0004 0150 00D2
        JSR     R5,     L_6E7D                  ; 51BF   0004 016C 027D
        JSR     R5,     L_6EBB                  ; 51C2   0004 016C 02BB

        MVI     G_0326, R0                      ; 51C5   0280 0326
        TSTR    R0                              ; 51C7   0080
        BNEQ    L_5251                          ; 51C8   020C 0087

        MVO     R0,     G_018E                  ; 51CA   0240 018E
        MVI@    R2,     R1                      ; 51CC   0291
        ANDI    #$0038, R1                      ; 51CD   03B9 0038
        BEQ     L_51DB                          ; 51CF   0204 000A

        MVI     G_0197, R0                      ; 51D1   0280 0197
        MVO     R0,     G_016A                  ; 51D3   0240 016A

        JSR     R5,     L_51DC                  ; 51D5   0004 0150 01DC
        JSR     R5,     .EXEC.6CF               ; 51D8   0004 0114 02CF

L_51DB:
        PULR    R7                              ; 51DB   02B7

L_51DC:
        PSHR    R5                              ; 51DC   0275
        PSHR    R2                              ; 51DD   0272
        SDBD                                    ; 51DE   0001
        MVII    #$5128, R1                      ; 51DF   02B9 0028 0051
        MVII    #$0325, R2                      ; 51E2   02BA 0325

        JSR     R5,     X_INIT_MOB              ; 51E4   0004 0114 02B2

        PULR    R2                              ; 51E7   02B2
        MVI@    R2,     R1                      ; 51E8   0291
        MOVR    R1,     R5                      ; 51E9   008D
        ANDI    #$0007, R5                      ; 51EA   03BD 0007
        MVI     G_0325, R3                      ; 51EC   0283 0325
        SDBD                                    ; 51EE   0001
        MVII    #$1080, R3                      ; 51EF   02BB 0080 0010
        SLR     R1,     2                       ; 51F2   0065
        SLR     R1,     1                       ; 51F3   0061
        MOVR    R1,     R4                      ; 51F4   008C
        ANDI    #$0010, R4                      ; 51F5   03BC 0010
        BEQ     L_51FB                          ; 51F7   0204 0002

        XORI    #$0200, R3                      ; 51F9   03FB 0200
L_51FB:
        ANDI    #$0007, R1                      ; 51FB   03B9 0007
        XORR    R5,     R3                      ; 51FD   01EB
        MVO     R3,     G_0325                  ; 51FE   0243 0325
        MVO     R1,     G_032A                  ; 5200   0241 032A
        MVI@    R2,     R1                      ; 5202   0291
        SDBD                                    ; 5203   0001
        ANDI    #$3F00, R1                      ; 5204   03B9 0000 003F
        MVO@    R1,     R2                      ; 5207   0251
        MVII    #$0001, R0                      ; 5208   02B8 0001

        JSR     R5,     .EXEC.41C               ; 520A   0004 0114 001C

        MVII    #$0001, R0                      ; 520D   02B8 0001
        PULR    R7                              ; 520F   02B7

L_5210:
        MVI     G_0320, R0                      ; 5210   0280 0320

        JSR     R5,     L_5245                  ; 5212   0004 0150 0245

        MOVR    R0,     R1                      ; 5215   0081
        MVI     G_031F, R0                      ; 5216   0280 031F

        JSR     R5,     L_5245                  ; 5218   0004 0150 0245
        JSR     R5,     X_PACK_BYTES            ; 521B   0004 0114 034F

        MOVR    R0,     R2                      ; 521E   0082
        MVII    #$000A, R3                      ; 521F   02BB 000A
        MVII    #$031D, R1                      ; 5221   02B9 031D
        MVO     R3,     G_0324                  ; 5223   0243 0324

        JSR     R5,     .EXEC.9A1               ; 5225   0004 0118 01A1

        PULR    R7                              ; 5228   02B7

        PSHR    R5                              ; 5229   0275
        MVI     G_0324, R0                      ; 522A   0280 0324
        TSTR    R0                              ; 522C   0080
        BEQ     L_5244                          ; 522D   0204 0015

        MVI     G_031F, R0                      ; 522F   0280 031F

        JSR     R5,     L_5245                  ; 5231   0004 0150 0245

        SWAP    R0,     1                       ; 5234   0040
        MVO     R0,     G_031F                  ; 5235   0240 031F
        MVI     G_0320, R0                      ; 5237   0280 0320

        JSR     R5,     L_5245                  ; 5239   0004 0150 0245

        SWAP    R0,     1                       ; 523C   0040
        MVO     R0,     G_0320                  ; 523D   0240 0320
        CLRR    R2                              ; 523F   01D2
        MVO     R2,     G_0321                  ; 5240   0242 0321
        MVO     R2,     G_0324                  ; 5242   0242 0324
L_5244:
        PULR    R7                              ; 5244   02B7

L_5245:
        PSHR    R5                              ; 5245   0275
        SWAP    R0,     1                       ; 5246   0040
        MOVR    R0,     R4                      ; 5247   0084
        ANDI    #$0004, R4                      ; 5248   03BC 0004
        BEQ     L_524E                          ; 524A   0204 0002

        ADDI    #$0008, R0                      ; 524C   02F8 0008
L_524E:
        ANDI    #$00F8, R0                      ; 524E   03B8 00F8
        PULR    R7                              ; 5250   02B7

L_5251:
        MVI     G_0197, R0                      ; 5251   0280 0197
        MVO     R0,     G_0169                  ; 5253   0240 0169

        JSR     R5,     L_525D                  ; 5255   0004 0150 025D

        MVII    #$0002, R0                      ; 5258   02B8 0002
        MVO     R0,     G_0168                  ; 525A   0240 0168
        PULR    R7                              ; 525C   02B7

L_525D:
        PSHR    R5                              ; 525D   0275
L_525E:
        MVI     G_032A, R3                      ; 525E   0283 032A
        SLL     R3,     2                       ; 5260   004F
        SLL     R3,     1                       ; 5261   004B
        MVI     G_0325, R1                      ; 5262   0281 0325
        MOVR    R1,     R4                      ; 5264   008C
        ANDI    #$0200, R4                      ; 5265   03BC 0200
        BEQ     L_526B                          ; 5267   0204 0002

        XORI    #$0080, R3                      ; 5269   03FB 0080
L_526B:
        ANDI    #$0006, R1                      ; 526B   03B9 0006
        MVI@    R2,     R0                      ; 526D   0290
        SDBD                                    ; 526E   0001
        ANDI    #$FF00, R0                      ; 526F   03B8 0000 00FF
        TSTR    R1                              ; 5272   0089
        BEQ     L_5277                          ; 5273   0204 0002

        XORI    #$0007, R0                      ; 5275   03F8 0007
L_5277:
        XORR    R3,     R0                      ; 5277   01D8
        MVO@    R0,     R2                      ; 5278   0250
        MVO     R2,     G_016B                  ; 5279   0242 016B
        MVII    #$0325, R1                      ; 527B   02B9 0325

        JSR     R5,     .EXEC.7AE               ; 527D   0004 0114 03AE

        PULR    R7                              ; 5280   02B7

L_5281:
        MVI     G_0326, R0                      ; 5281   0280 0326
        TSTR    R0                              ; 5283   0080
        BEQ     L_5287                          ; 5284   0204 0001
        PULR    R7                              ; 5286   02B7

L_5287:
        JSR     R5,     L_6135                  ; 5287   0004 0160 0135
        JSR     R5,     L_61A7                  ; 528A   0004 0160 01A7

        BC      L_5293                          ; 528D   0201 0004

        MVII    #$0007, R0                      ; 528F   02B8 0007
        MVO     R0,     G_016F                  ; 5291   0240 016F

L_5293:
        JSR     R5,     L_631F                  ; 5293   0004 0160 031F
        JSR     R5,     L_52B4                  ; 5296   0004 0150 02B4

        SDBD                                    ; 5299   0001
        MVII    #$D308, R3                      ; 529A   02BB 0008 00D3
        MVI@    R3,     R0                      ; 529D   0298
        INCR    R0                              ; 529E   0008
        MVO@    R0,     R3                      ; 529F   0258
        MVI     G_0168, R0                      ; 52A0   0280 0168
        CMPI    #$0001, R0                      ; 52A2   0378 0001
        BEQ     L_52B1                          ; 52A4   0204 000B

        MVI     G_015D, R0                      ; 52A6   0280 015D
        CMPI    #$0002, R0                      ; 52A8   0378 0002
        BNEQ    L_52AF                          ; 52AA   020C 0003

        SLL     R0,     1                       ; 52AC   0048
        B       L_52B1                          ; 52AD   0200 0002

L_52AF:
        MVII    #$0001, R0                      ; 52AF   02B8 0001
L_52B1:
        MVO     R0,     G_0168                  ; 52B1   0240 0168
        PULR    R7                              ; 52B3   02B7

L_52B4:
        PSHR    R5                              ; 52B4   0275
L_52B5:
        SDBD                                    ; 52B5   0001
        MVII    #$D0FD, R2                      ; 52B6   02BA 00FD 00D0
        MVI@    R2,     R3                      ; 52B9   0293
        TSTR    R3                              ; 52BA   009B
        BEQ     L_52BE                          ; 52BB   0204 0001

        DECR    R3                              ; 52BD   0013
L_52BE:
        MVII    #$02D0, R4                      ; 52BE   02BC 02D0
        SDBD                                    ; 52C0   0001
        MVII    #$D0A6, R2                      ; 52C1   02BA 00A6 00D0
        MVI@    R2,     R0                      ; 52C4   0290
        MOVR    R0,     R2                      ; 52C5   0082
        ANDI    #$0080, R0                      ; 52C6   03B8 0080
        BEQ     L_52D0                          ; 52C8   0204 0006

        MVII    #$0001, R5                      ; 52CA   02BD 0001
        MVO     R5,     G_018E                  ; 52CC   0245 018E
        MVO     R5,     G_0168                  ; 52CE   0245 0168
L_52D0:
        MOVR    R2,     R0                      ; 52D0   0090
        CMPI    #$00C0, R0                      ; 52D1   0378 00C0
        BNEQ    L_52F0                          ; 52D3   020C 001B

        JSR     R5,     X_PRINT_R5              ; 52D5   0004 0118 007B
        STRING  "CHECKMATE!"                    ; 52D8  
        DECLE   $0000                           ; 52E2   0000

        MVI     G_019C, R2                      ; 52E3   0282 019C
        XORR    R2,     R3                      ; 52E5   01D3
        BNEQ    L_52EB                          ; 52E6   020C 0003
L_52E8:
        J       L_6FE0                          ; 52E8   0004 036C 03E0

L_52EB:
        MVII    #$000F, R0                      ; 52EB   02B8 000F
        J       X_PLAY_CHEER2                   ; 52ED   0004 031C 02D6

L_52F0:
        ANDI    #$0080, R2                      ; 52F0   03BA 0080
        CMPI    #$0080, R2                      ; 52F2   037A 0080
        BNEQ    L_5306                          ; 52F4   020C 0010

        JSR     R5,     X_PRINT_R5              ; 52F6   0004 0118 007B
        STRING  "STALEMATE!"                    ; 52F9  
        DECLE   $0000                           ; 5303   0000

        B       L_52E8                          ; 5304   0220 001D

L_5306:
        ANDI    #$0040, R0                      ; 5306   03B8 0040
        CMPI    #$0040, R0                      ; 5308   0378 0040
        BNEQ    L_5318                          ; 530A   020C 000C

        JSR     R5,     X_PRINT_R5              ; 530C   0004 0118 007B
        STRING  "CHECK"                         ; 530F  
        DECLE   $0000                           ; 5314   0000

        JSR     R5,     L_6FD1                  ; 5315   0004 016C 03D1

L_5318:
        PULR    R7                              ; 5318   02B7

        PSHR    R5                              ; 5319   0275
        MVI     G_0102, R0                      ; 531A   0280 0102
        MVII    #$0032, R1                      ; 531C   02B9 0032
        MVO     R1,     G_011E                  ; 531E   0241 011E
        MVI     .PSG0.lft_hand,R1               ; 5320   0281 01FF
        MVI     .PSG0.rgt_hand,R2               ; 5322   0282 01FE
        ANDR    R1,     R2                      ; 5324   018A
        CMPI    #$003F, R2                      ; 5325   037A 003F
        BNEQ    L_532E                          ; 5327   020C 0005

        SDBD                                    ; 5329   0001
        MVII    #$D30D, R4                      ; 532A   02BC 000D 00D3
        MVO@    R2,     R4                      ; 532D   0262
L_532E:
        CMPI    #$00FF, R2                      ; 532E   037A 00FF
        BEQ     L_534F                          ; 5330   0204 001D

        CLRR    R2                              ; 5332   01D2
        MVO     R2,     G_0334                  ; 5333   0242 0334
        CMPI    #$0081, R0                      ; 5335   0378 0081
        BNEQ    L_534F                          ; 5337   020C 0016

        MVI     G_0170, R0                      ; 5339   0280 0170
        CMPI    #$001E, R0                      ; 533B   0378 001E
        BEQ     L_5348                          ; 533D   0204 0009

        INCR    R0                              ; 533F   0008
        MVO     R0,     G_0170                  ; 5340   0240 0170
        MVII    #$00DE, R0                      ; 5342   02B8 00DE
        MVO     R0,     G_0334                  ; 5344   0240 0334
        B       L_534F                          ; 5346   0200 0007

L_5348:
        CLRR    R0                              ; 5348   01C0
        MVO     R0,     G_0170                  ; 5349   0240 0170
        MVII    #$00A0, R0                      ; 534B   02B8 00A0
        MVO     R0,     G_0102                  ; 534D   0240 0102
L_534F:
        CMPI    #$00A0, R0                      ; 534F   0378 00A0
        BNEQ    L_535A                          ; 5351   020C 0007

        CLRR    R0                              ; 5353   01C0
        MVO     R0,     G_0334                  ; 5354   0240 0334
        MVO     R0,     G_018E                  ; 5356   0240 018E
        B       L_53F3                          ; 5358   0200 0099

L_535A:
        CMPI    #$0080, R0                      ; 535A   0378 0080
        BNEQ    L_536B                          ; 535C   020C 000D

        MVII    #$00DE, R0                      ; 535E   02B8 00DE
        MVO     R0,     G_0334                  ; 5360   0240 0334
        MVI     G_016E, R1                      ; 5362   0281 016E
        TSTR    R1                              ; 5364   0089
        BNEQ    L_53F3                          ; 5365   020C 008C

        MVO     R0,     G_018E                  ; 5367   0240 018E
        B       L_53F3                          ; 5369   0200 0088

L_536B:
        MVII    #$0172, R2                      ; 536B   02BA 0172
        SDBD                                    ; 536D   0001
        MVII    #$D0FD, R3                      ; 536E   02BB 00FD 00D0
        MVI@    R3,     R0                      ; 5371   0298
        TSTR    R0                              ; 5372   0080
        BEQ     L_5376                          ; 5373   0204 0001

        INCR    R2                              ; 5375   000A
L_5376:
        MVI@    R2,     R0                      ; 5376   0290
        INCR    R0                              ; 5377   0008
        MVO@    R0,     R2                      ; 5378   0250
        CMPI    #$003C, R0                      ; 5379   0378 003C
        BNEQ    L_53F3                          ; 537B   020C 0076

        CLRR    R0                              ; 537D   01C0
        MVO@    R0,     R2                      ; 537E   0250
        INCR    R2                              ; 537F   000A
        INCR    R2                              ; 5380   000A
        MVI@    R2,     R1                      ; 5381   0291
        MVI     G_018E, R0                      ; 5382   0280 018E
        TSTR    R0                              ; 5384   0080
        BNEQ    L_5388                          ; 5385   020C 0001

        INCR    R1                              ; 5387   0009
L_5388:
        MVO@    R1,     R2                      ; 5388   0251
        CMPI    #$003C, R1                      ; 5389   0379 003C
        BNEQ    L_539F                          ; 538B   020C 0012

        CLRR    R1                              ; 538D   01C9
        MVO@    R1,     R2                      ; 538E   0251
        INCR    R2                              ; 538F   000A
        INCR    R2                              ; 5390   000A
        MVI@    R2,     R4                      ; 5391   0294
        INCR    R4                              ; 5392   000C
        MVO@    R4,     R2                      ; 5393   0254
        CMPI    #$003C, R4                      ; 5394   037C 003C
        BNEQ    L_539F                          ; 5396   020C 0007

        CLRR    R4                              ; 5398   01E4
        MVO@    R4,     R2                      ; 5399   0254
        INCR    R2                              ; 539A   000A
        INCR    R2                              ; 539B   000A
        MVI@    R2,     R5                      ; 539C   0295
        INCR    R5                              ; 539D   000D
        MVO@    R5,     R2                      ; 539E   0255
L_539F:
        MVI     G_0334, R0                      ; 539F   0280 0334
        CMPI    #$00DE, R0                      ; 53A1   0378 00DE
        BGE     L_53AC                          ; 53A3   020D 0007

        INCR    R0                              ; 53A5   0008
        MVO     R0,     G_0334                  ; 53A6   0240 0334
        MVO     R0,     .STIC.VIDEN             ; 53A8   0240 0020
        B       L_53B7                          ; 53AA   0200 000B

L_53AC:
        MVI     G_0102, R0                      ; 53AC   0280 0102
        CMPI    #$0081, R0                      ; 53AE   0378 0081
        BNEQ    L_53B3                          ; 53B0   020C 0001
        PULR    R7                              ; 53B2   02B7

L_53B3:
        MVII    #$0080, R0                      ; 53B3   02B8 0080
        MVO     R0,     G_0102                  ; 53B5   0240 0102
L_53B7:
        MVI     G_0193, R0                      ; 53B7   0280 0193
        CMPI    #$0002, R0                      ; 53B9   0378 0002
        BNEQ    L_53BE                          ; 53BB   020C 0001
        PULR    R7                              ; 53BD   02B7

L_53BE:
        MVII    #$02E7, R4                      ; 53BE   02BC 02E7
        CLRR    R3                              ; 53C0   01DB
        MVII    #$0001, R2                      ; 53C1   02BA 0001
        MVO     R2,     G_0171                  ; 53C3   0242 0171

        JSR     R5,     L_53D0                  ; 53C5   0004 0150 03D0

        MVII    #$02DE, R4                      ; 53C8   02BC 02DE
        MVII    #$0007, R3                      ; 53CA   02BB 0007
        CLRR    R2                              ; 53CC   01D2
        MVO     R2,     G_0171                  ; 53CD   0242 0171
        INCR    R7                              ; 53CF   000F

L_53D0:
        PSHR    R5                              ; 53D0   0275
L_53D1:
        MVII    #$0002, R1                      ; 53D1   02B9 0002
        MVII    #$0178, R0                      ; 53D3   02B8 0178
        MVI     G_0171, R2                      ; 53D5   0282 0171
        ADDR    R0,     R2                      ; 53D7   00C2
        MVI@    R2,     R0                      ; 53D8   0290

        JSR     R5,     X_PRNUM_RGT             ; 53D9   0004 0118 00C5

        MVII    #$00D4, R5                      ; 53DC   02BD 00D4
        ADDI    #$0002, R4                      ; 53DE   02FC 0002
        MVO@    R5,     R4                      ; 53E0   0265
        DECR    R2                              ; 53E1   0012
        DECR    R2                              ; 53E2   0012
        MVI@    R2,     R0                      ; 53E3   0290

        JSR     R5,     X_PRNUM_ZRO             ; 53E4   0004 0118 00AD

        DECR    R2                              ; 53E7   0012
        DECR    R2                              ; 53E8   0012
        ADDI    #$0002, R4                      ; 53E9   02FC 0002
        MVII    #$00D4, R5                      ; 53EB   02BD 00D4
        MVO@    R5,     R4                      ; 53ED   0265
        MVI@    R2,     R0                      ; 53EE   0290

        JSR     R5,     X_PRNUM_ZRO             ; 53EF   0004 0118 00AD

        PULR    R7                              ; 53F2   02B7

L_53F3:
        JSR     R5,     X_DEF_ISR               ; 53F3   0004 0110 0126

        PULR    R7                              ; 53F6   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 53F7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53FB   0000 0000 0000 0000
        DECLE   $0000                           ; 53FF   0000
L_5400:
        PULR    R2                              ; 5400   02B2
        INCR    R2                              ; 5401   000A
        B       L_5406                          ; 5402   0200 0002

L_5404:
        PSHR    R5                              ; 5404   0275
        CLRR    R2                              ; 5405   01D2
L_5406:
        MOVR    R1,     R3                      ; 5406   008B
        ADDI    #$0105, R3                      ; 5407   02FB 0105
        ADD@    R3,     R2                      ; 5409   02DA
        MVO@    R2,     R3                      ; 540A   025A
        SDBD                                    ; 540B   0001
        ADDI    #$5EE3, R2                      ; 540C   02FA 00E3 005E
        SDBD                                    ; 540F   0001
        MVII    #$5400, R0                      ; 5410   02B8 0000 0054
        ADD@    R2,     R0                      ; 5413   02D0
        CLRR    R2                              ; 5414   01D2
        PSHR    R2                              ; 5415   0272
        MOVR    R0,     R7                      ; 5416   0087

L_5417:
        PULR    R0                              ; 5417   02B0
L_5418:
        MOVR    R1,     R3                      ; 5418   008B
        ADDI    #$0105, R3                      ; 5419   02FB 0105
        ADD@    R3,     R0                      ; 541B   02D8
        MVO@    R0,     R3                      ; 541C   0258
        MOVR    R1,     R3                      ; 541D   008B
        ADDI    #$0102, R3                      ; 541E   02FB 0102
        MVI@    R3,     R0                      ; 5420   0298
        MOVR    R1,     R2                      ; 5421   008A
        ADDI    #$0103, R2                      ; 5422   02FA 0103
        MVI@    R2,     R5                      ; 5424   0295
        ANDI    #$003F, R5                      ; 5425   03BD 003F
        DECR    R5                              ; 5427   0015
        BNEQ    L_542D                          ; 5428   020C 0003

        ADDI    #$0080, R0                      ; 542A   02F8 0080
        MVO@    R0,     R3                      ; 542C   0258
L_542D:
        RSWD    R0                              ; 542D   0038
        CLRC                                    ; 542E   0006
        PULR    R7                              ; 542F   02B7

        SETC                                    ; 5430   0007
        PULR    R0                              ; 5431   02B0
        PULR    R7                              ; 5432   02B7

        PULR    R0                              ; 5433   02B0
        INCR    R0                              ; 5434   0008
        PSHR    R0                              ; 5435   0270

        JSR     R5,     L_54A8                  ; 5436   0004 0154 00A8
L_5439:
        JSR     R5,     L_54B9                  ; 5439   0004 0154 00B9

        BC      L_5400                          ; 543C   0221 003D

        JSR     R5,     L_54F4                  ; 543E   0004 0154 00F4
        JSR     R5,     L_54FC                  ; 5441   0004 0154 00FC

        BC      L_5439                          ; 5444   0221 000C
        B       L_5417                          ; 5446   0220 0030

        PULR    R0                              ; 5448   02B0
        INCR    R0                              ; 5449   0008
        PSHR    R0                              ; 544A   0270

        JSR     R5,     L_54A8                  ; 544B   0004 0154 00A8
L_544E:
        JSR     R5,     L_54B9                  ; 544E   0004 0154 00B9

        BC      L_5400                          ; 5451   0221 0052

        JSR     R5,     L_54F4                  ; 5453   0004 0154 00F4

        BC      L_544E                          ; 5456   0221 0009

        JSR     R5,     L_5508                  ; 5458   0004 0154 0108

        BC      L_544E                          ; 545B   0221 000E
        B       L_5417                          ; 545D   0220 0047

        PULR    R0                              ; 545F   02B0
        MOVR    R1,     R3                      ; 5460   008B
        ADDI    #$0103, R3                      ; 5461   02FB 0103
        MVO@    R0,     R3                      ; 5463   0258
        INCR    R0                              ; 5464   0008
        PSHR    R0                              ; 5465   0270
        MVII    #$0078, R0                      ; 5466   02B8 0078
L_5468:
        DECR    R0                              ; 5468   0010
        BMI     L_5400                          ; 5469   022B 006A

        ANDI    #$0077, R0                      ; 546B   03B8 0077
        MOVR    R0,     R3                      ; 546D   0083
        ADDR    R1,     R3                      ; 546E   00CB
        MVI@    R3,     R2                      ; 546F   029A
        TSTR    R2                              ; 5470   0092
        BNEQ    L_5468                          ; 5471   022C 000A

        JSR     R5,     L_54DA                  ; 5473   0004 0154 00DA
        JSR     R5,     L_5641                  ; 5476   0004 0154 0241

        GSWD    R2                              ; 5479   0032
        MOVR    R1,     R3                      ; 547A   008B
        ADDI    #$0101, R3                      ; 547B   02FB 0101
        MVI@    R3,     R0                      ; 547D   0298
        RSWD    R2                              ; 547E   003A
        BC      L_5468                          ; 547F   0221 0018
        B       L_5417                          ; 5481   0220 006B

        PULR    R0                              ; 5483   02B0
        INCR    R0                              ; 5484   0008
        PSHR    R0                              ; 5485   0270
        MOVR    R1,     R2                      ; 5486   008A
        ADDI    #$0082, R2                      ; 5487   02FA 0082
        SDBD                                    ; 5489   0001
        MVII    #$5F0C, R3                      ; 548A   02BB 000C 005F
        ADD@    R2,     R3                      ; 548D   02D3
        MVII    #$0070, R0                      ; 548E   02B8 0070
        ADD@    R3,     R0                      ; 5490   02D8

L_5491:
        JSR     R5,     L_552E                  ; 5491   0004 0154 012E

        BC      L_549D                          ; 5494   0201 0007
        B       L_5417                          ; 5496   0220 0080

        JSR     R5,     L_556B                  ; 5498   0004 0154 016B

        BNC     L_5417                          ; 549B   0229 0085

L_549D:
        MOVR    R1,     R3                      ; 549D   008B
        ADDI    #$0101, R3                      ; 549E   02FB 0101
        MVI@    R3,     R0                      ; 54A0   0298
        SUBI    #$0010, R0                      ; 54A1   0338 0010
        MVO@    R0,     R3                      ; 54A3   0258
        BPL     L_5491                          ; 54A4   0223 0014
        B       L_5400                          ; 54A6   0220 00A7

L_54A8:
        MVII    #$0040, R0                      ; 54A8   02B8 0040
        MOVR    R1,     R4                      ; 54AA   008C
        ADDI    #$0102, R4                      ; 54AB   02FC 0102
        MVO@    R0,     R4                      ; 54AD   0260
        MOVR    R1,     R3                      ; 54AE   008B
        ADDI    #$0083, R3                      ; 54AF   02FB 0083
        MVII    #$0040, R0                      ; 54B1   02B8 0040
        XOR@    R3,     R0                      ; 54B3   03D8
        MOVR    R1,     R4                      ; 54B4   008C
        ADDI    #$0103, R4                      ; 54B5   02FC 0103
        MVO@    R0,     R4                      ; 54B7   0260
        MOVR    R5,     R7                      ; 54B8   00AF

L_54B9:
        MOVR    R1,     R2                      ; 54B9   008A
        ADDI    #$0103, R2                      ; 54BA   02FA 0103
        MVI@    R2,     R0                      ; 54BC   0290
L_54BD:
        INCR    R0                              ; 54BD   0008
        MOVR    R0,     R3                      ; 54BE   0083
        ADDR    R1,     R3                      ; 54BF   00CB
        ADDI    #$029F, R3                      ; 54C0   02FB 029F
        MVI@    R3,     R4                      ; 54C2   029C
        TSTR    R4                              ; 54C3   00A4
        BEQ     L_54D8                          ; 54C4   0204 0012

        ANDI    #$0080, R4                      ; 54C6   03BC 0080
        BNEQ    L_54BD                          ; 54C8   022C 000C

        MVO@    R0,     R2                      ; 54CA   0250
        SUBI    #$0010, R3                      ; 54CB   033B 0010
        MOVR    R1,     R2                      ; 54CD   008A
        ADDI    #$0101, R2                      ; 54CE   02FA 0101
        MVI@    R3,     R0                      ; 54D0   0298
        MVO@    R0,     R2                      ; 54D1   0250
        MOVR    R1,     R2                      ; 54D2   008A
        ADDI    #$00F1, R2                      ; 54D3   02FA 00F1
        MVO@    R0,     R2                      ; 54D5   0250
        CLRC                                    ; 54D6   0006
        MOVR    R5,     R7                      ; 54D7   00AF

L_54D8:
        SETC                                    ; 54D8   0007
        MOVR    R5,     R7                      ; 54D9   00AF

L_54DA:
        MOVR    R1,     R2                      ; 54DA   008A
        ADDI    #$0101, R2                      ; 54DB   02FA 0101
        MVO@    R0,     R2                      ; 54DD   0250
        MOVR    R1,     R2                      ; 54DE   008A
        ADDI    #$00F1, R2                      ; 54DF   02FA 00F1
        MVO@    R0,     R2                      ; 54E1   0250
        B       L_54F4                          ; 54E2   0200 0010

L_54E4:
        MOVR    R1,     R2                      ; 54E4   008A
        ADDI    #$0101, R2                      ; 54E5   02FA 0101
        MVO@    R0,     R2                      ; 54E7   0250
        MOVR    R1,     R2                      ; 54E8   008A
        ADDI    #$00F1, R2                      ; 54E9   02FA 00F1
        MVO@    R0,     R2                      ; 54EB   0250
        MOVR    R1,     R2                      ; 54EC   008A
        ADDI    #$0103, R2                      ; 54ED   02FA 0103
        MVO@    R3,     R2                      ; 54EF   0253
        MVII    #$0040, R0                      ; 54F0   02B8 0040
        DECR    R2                              ; 54F2   0012
        MVO@    R0,     R2                      ; 54F3   0250
L_54F4:
        MVII    #$0003, R4                      ; 54F4   02BC 0003
        MOVR    R1,     R3                      ; 54F6   008B
        ADDI    #$0104, R3                      ; 54F7   02FB 0104
        MVO@    R4,     R3                      ; 54F9   025C
        CLRC                                    ; 54FA   0006
        MOVR    R5,     R7                      ; 54FB   00AF

L_54FC:
        PSHR    R5                              ; 54FC   0275

L_54FD:
        JSR     R5,     L_56A9                  ; 54FD   0004 0154 02A9

        BC      L_5507                          ; 5500   0201 0005

        JSR     R5,     L_5515                  ; 5502   0004 0154 0115

        BC      L_54FD                          ; 5505   0221 0009
L_5507:
        PULR    R7                              ; 5507   02B7

L_5508:
        PSHR    R5                              ; 5508   0275

L_5509:
        JSR     R5,     L_56A9                  ; 5509   0004 0154 02A9

        BC      L_5514                          ; 550C   0201 0006

        JSR     R5,     L_5515                  ; 550E   0004 0154 0115

        BNC     L_5509                          ; 5511   0229 0009

        CLRC                                    ; 5513   0006
L_5514:
        PULR    R7                              ; 5514   02B7

L_5515:
        PSHR    R5                              ; 5515   0275

        JSR     R5,     L_6406                  ; 5516   0004 0164 0006

        MOVR    R1,     R3                      ; 5519   008B
        ADDI    #$02FA, R3                      ; 551A   02FB 02FA
        MVI@    R3,     R0                      ; 551C   0298
        CMPI    #$0080, R0                      ; 551D   0378 0080
        BEQ     L_552C                          ; 551F   0204 000B

        GSWD    R0                              ; 5521   0030
        MOVR    R1,     R3                      ; 5522   008B
        ADDI    #$0082, R3                      ; 5523   02FB 0082
        SLR     R0,     1                       ; 5525   0060
        XOR@    R3,     R0                      ; 5526   03D8
        XORI    #$0008, R0                      ; 5527   03F8 0008
        SLL     R0,     1                       ; 5529   0048
        RSWD    R0                              ; 552A   0038
        PULR    R7                              ; 552B   02B7

L_552C:
        SETC                                    ; 552C   0007
        PULR    R7                              ; 552D   02B7

L_552E:
        PSHR    R5                              ; 552E   0275
        MOVR    R1,     R2                      ; 552F   008A
        ADDI    #$0101, R2                      ; 5530   02FA 0101
        MVO@    R0,     R2                      ; 5532   0250
        MOVR    R1,     R2                      ; 5533   008A
        ADDI    #$00F1, R2                      ; 5534   02FA 00F1
        MVO@    R0,     R2                      ; 5536   0250
        MOVR    R0,     R3                      ; 5537   0083
        ADDR    R1,     R3                      ; 5538   00CB
        MVI@    R3,     R4                      ; 5539   029C
        MOVR    R1,     R2                      ; 553A   008A
        ADDI    #$0103, R2                      ; 553B   02FA 0103
        MVO@    R4,     R2                      ; 553D   0254
        TSTR    R4                              ; 553E   00A4
        BEQ     L_5561                          ; 553F   0204 0020

        MOVR    R1,     R2                      ; 5541   008A
        ADDI    #$0083, R2                      ; 5542   02FA 0083
        XOR@    R2,     R4                      ; 5544   03D4
        RSWD    R4                              ; 5545   003C
        BNEQ    L_5584                          ; 5546   020C 003C

        JSR     R5,     L_558A                  ; 5548   0004 0154 018A

        MVII    #$0001, R2                      ; 554B   02BA 0001
        BNC     L_5555                          ; 554D   0209 0006

L_554F:
        JSR     R5,     L_5586                  ; 554F   0004 0154 0186

        BC      L_5584                          ; 5552   0201 0030

        CLRR    R2                              ; 5554   01D2
L_5555:
        MVII    #$0063, R0                      ; 5555   02B8 0063
L_5557:
        MOVR    R1,     R3                      ; 5557   008B
        ADDI    #$0104, R3                      ; 5558   02FB 0104
        MVO@    R2,     R3                      ; 555A   025A
L_555B:
        MOVR    R1,     R3                      ; 555B   008B
        ADDI    #$0102, R3                      ; 555C   02FB 0102
        MVO@    R0,     R3                      ; 555E   0258
        CLRC                                    ; 555F   0006
        PULR    R7                              ; 5560   02B7

L_5561:
        JSR     R5,     L_55C0                  ; 5561   0004 0154 01C0

        BC      L_5584                          ; 5564   0201 001E

        CLRR    R2                              ; 5566   01D2
        MVII    #$002B, R0                      ; 5567   02B8 002B
        B       L_5557                          ; 5569   0220 0013

L_556B:
        PSHR    R5                              ; 556B   0275
        MOVR    R1,     R3                      ; 556C   008B
        ADDI    #$0102, R3                      ; 556D   02FB 0102
        MVI@    R3,     R0                      ; 556F   0298
        ANDI    #$0007, R0                      ; 5570   03B8 0007
        MOVR    R0,     R2                      ; 5572   0082
        XOR@    R3,     R0                      ; 5573   03D8
        SDBD                                    ; 5574   0001
        ADDI    #$5EC3, R2                      ; 5575   02FA 00C3 005E
        MVI@    R2,     R4                      ; 5578   0294
        XORR    R4,     R0                      ; 5579   01E0
        TSTR    R4                              ; 557A   00A4
        BNEQ    L_555B                          ; 557B   022C 0021

        MOVR    R1,     R3                      ; 557D   008B
        ADDI    #$0104, R3                      ; 557E   02FB 0104
        MVI@    R3,     R0                      ; 5580   0298
        TSTR    R0                              ; 5581   0080
        BNEQ    L_554F                          ; 5582   022C 0034

L_5584:
        SETC                                    ; 5584   0007
        PULR    R7                              ; 5585   02B7

L_5586:
        MVII    #$0001, R0                      ; 5586   02B8 0001
        B       L_55C6                          ; 5588   0200 003C

L_558A:
        CLRR    R0                              ; 558A   01C0
        B       L_55C6                          ; 558B   0200 0039

L_558D:
        MOVR    R1,     R3                      ; 558D   008B
        ADDI    #$0082, R3                      ; 558E   02FB 0082
        MOVR    R1,     R2                      ; 5590   008A
        ADDI    #$0101, R2                      ; 5591   02FA 0101
        MVI@    R2,     R0                      ; 5593   0290
        ANDI    #$0007, R0                      ; 5594   03B8 0007
        SDBD                                    ; 5596   0001
        MVII    #$5F0D, R4                      ; 5597   02BC 000D 005F
        ADD@    R3,     R4                      ; 559A   02DC
        CMP@    R4,     R0                      ; 559B   0360
        BNEQ    L_55B3                          ; 559C   020C 0015

        SDBD                                    ; 559E   0001
        MVII    #$5F0E, R4                      ; 559F   02BC 000E 005F
        ADD@    R3,     R4                      ; 55A2   02DC
        MVI@    R2,     R0                      ; 55A3   0290
        SUB@    R4,     R0                      ; 55A4   0320
        ANDI    #$00FF, R0                      ; 55A5   03B8 00FF
        MOVR    R0,     R4                      ; 55A7   0084
        ADDR    R1,     R4                      ; 55A8   00CC
        MVI@    R4,     R0                      ; 55A9   02A0
        TSTR    R0                              ; 55AA   0080
        BNEQ    L_55B3                          ; 55AB   020C 0006

        MVII    #$0004, R2                      ; 55AD   02BA 0004
        MVII    #$0003, R0                      ; 55AF   02B8 0003
        B       L_55C2                          ; 55B1   0200 000F

L_55B3:
        MVI@    R2,     R0                      ; 55B3   0290
        ANDI    #$0007, R0                      ; 55B4   03B8 0007
        SDBD                                    ; 55B6   0001
        MVII    #$5F0C, R4                      ; 55B7   02BC 000C 005F
        ADD@    R3,     R4                      ; 55BA   02DC
        CMP@    R4,     R0                      ; 55BB   0360
        BEQ     L_55D1                          ; 55BC   0204 0013

        MVII    #$0008, R2                      ; 55BE   02BA 0008
L_55C0:
        MVII    #$0002, R0                      ; 55C0   02B8 0002
L_55C2:
        MOVR    R1,     R4                      ; 55C2   008C
        ADDI    #$0102, R4                      ; 55C3   02FC 0102
        MVO@    R2,     R4                      ; 55C5   0262
L_55C6:
        MOVR    R1,     R3                      ; 55C6   008B
        ADDI    #$0101, R3                      ; 55C7   02FB 0101
        MVI@    R3,     R2                      ; 55C9   029A
        PSHR    R5                              ; 55CA   0275

        JSR     R5,     L_5611                  ; 55CB   0004 0154 0211

        BNC     L_569B                          ; 55CE   0209 00CB

L_55D0:
        PULR    R5                              ; 55D0   02B5
L_55D1:
        SETC                                    ; 55D1   0007
        MOVR    R5,     R7                      ; 55D2   00AF

L_55D3:
        MOVR    R1,     R4                      ; 55D3   008C
        ADDI    #$0083, R4                      ; 55D4   02FC 0083
        MOVR    R1,     R3                      ; 55D6   008B
        ADDI    #$0290, R3                      ; 55D7   02FB 0290
        ADD@    R4,     R3                      ; 55D9   02E3
        MVI@    R3,     R2                      ; 55DA   029A
L_55DB:
        PSHR    R5                              ; 55DB   0275

        JSR     R5,     L_62B8                  ; 55DC   0004 0160 02B8
        JSR     R5,     L_55F0                  ; 55DF   0004 0154 01F0
        JSR     R5,     L_62B8                  ; 55E2   0004 0160 02B8

        PULR    R7                              ; 55E5   02B7

L_55E6:
        MOVR    R1,     R4                      ; 55E6   008C
        ADDI    #$0083, R4                      ; 55E7   02FC 0083
        MVI@    R4,     R3                      ; 55E9   02A3
        XORI    #$0040, R3                      ; 55EA   03FB 0040
        ADDR    R1,     R3                      ; 55EC   00CB
        ADDI    #$0290, R3                      ; 55ED   02FB 0290
        MVI@    R3,     R2                      ; 55EF   029A
L_55F0:
        PSHR    R5                              ; 55F0   0275
        MOVR    R1,     R3                      ; 55F1   008B
        ADDI    #$0082, R3                      ; 55F2   02FB 0082
        PSHR    R2                              ; 55F4   0272
        ADD@    R3,     R2                      ; 55F5   02DA
        ADDR    R1,     R2                      ; 55F6   00CA
        ADDI    #$0200, R2                      ; 55F7   02FA 0200
        MVI@    R2,     R0                      ; 55F9   0290
        MOVR    R1,     R4                      ; 55FA   008C
        ADDI    #$02B3, R4                      ; 55FB   02FC 02B3
        MOVR    R1,     R3                      ; 55FD   008B
        ADDI    #$0083, R3                      ; 55FE   02FB 0083
        ADD@    R3,     R4                      ; 5600   02DC
        AND@    R4,     R0                      ; 5601   03A0
        PULR    R2                              ; 5602   02B2
        BNEQ    L_563D                          ; 5603   020C 0038

        CLRR    R0                              ; 5605   01C0

        JSR     R5,     L_5611                  ; 5606   0004 0154 0211

        BNC     L_563D                          ; 5609   0209 0032

        MVII    #$0001, R0                      ; 560B   02B8 0001

        JSR     R5,     L_5611                  ; 560D   0004 0154 0211

        PULR    R7                              ; 5610   02B7

L_5611:
        PSHR    R5                              ; 5611   0275
        MOVR    R1,     R3                      ; 5612   008B
        ADDI    #$0082, R3                      ; 5613   02FB 0082
        SDBD                                    ; 5615   0001
        MVII    #$5F08, R4                      ; 5616   02BC 0008 005F
        ADD@    R3,     R4                      ; 5619   02DC
        ADDR    R0,     R4                      ; 561A   00C4
        MVI@    R4,     R0                      ; 561B   02A0
        SWAP    R0,     1                       ; 561C   0040
        TSTR    R0                              ; 561D   0080
        BPL     L_5622                          ; 561E   0203 0002

        ADDI    #$00FF, R0                      ; 5620   02F8 00FF
L_5622:
        SWAP    R0,     1                       ; 5622   0040
        ADDR    R2,     R0                      ; 5623   00D0
        MOVR    R0,     R5                      ; 5624   0085
        ANDI    #$0088, R0                      ; 5625   03B8 0088
        BNEQ    L_563F                          ; 5627   020C 0016

        ADDR    R1,     R5                      ; 5629   00CD
        MVI@    R5,     R4                      ; 562A   02AC
        MOVR    R4,     R0                      ; 562B   00A0
        BEQ     L_563F                          ; 562C   0204 0011

        INCR    R3                              ; 562E   000B
        XOR@    R3,     R0                      ; 562F   03D8
        ANDI    #$0040, R0                      ; 5630   03B8 0040
        BNEQ    L_563F                          ; 5632   020C 000B

        MOVR    R4,     R3                      ; 5634   00A3
        ADDR    R1,     R4                      ; 5635   00CC
        ADDI    #$029F, R4                      ; 5636   02FC 029F
        MVII    #$0006, R0                      ; 5638   02B8 0006
        CMP@    R4,     R0                      ; 563A   0360
        BNEQ    L_563F                          ; 563B   020C 0002

L_563D:
        CLRC                                    ; 563D   0006
        PULR    R7                              ; 563E   02B7

L_563F:
        SETC                                    ; 563F   0007
        PULR    R7                              ; 5640   02B7

L_5641:
        MOVR    R1,     R4                      ; 5641   008C
        ADDI    #$0104, R4                      ; 5642   02FC 0104
        MVI@    R4,     R0                      ; 5644   02A0
        DECR    R0                              ; 5645   0010
        BMI     L_5672                          ; 5646   020B 002A
        BEQ     L_5651                          ; 5648   0204 0007

        PSHR    R5                              ; 564A   0275

        JSR     R5,     L_558D                  ; 564B   0004 0154 018D

        PULR    R5                              ; 564E   02B5
        BNC     L_56D6                          ; 564F   0209 0085

L_5651:
        CLRR    R0                              ; 5651   01C0
        MOVR    R1,     R4                      ; 5652   008C
        ADDI    #$0102, R4                      ; 5653   02FC 0102
        MVO@    R0,     R4                      ; 5655   0260
L_5656:
        CLRR    R0                              ; 5656   01C0
        MOVR    R1,     R4                      ; 5657   008C
        ADDI    #$0104, R4                      ; 5658   02FC 0104
        MVO@    R0,     R4                      ; 565A   0260
        MOVR    R1,     R4                      ; 565B   008C
        ADDI    #$02B2, R4                      ; 565C   02FC 02B2
        MOVR    R1,     R3                      ; 565E   008B
        ADDI    #$0083, R3                      ; 565F   02FB 0083
        MOVR    R1,     R2                      ; 5661   008A
        ADDI    #$02B4, R2                      ; 5662   02FA 02B4
        ADD@    R3,     R2                      ; 5664   02DA
        ADD@    R3,     R4                      ; 5665   02DC
        MVI@    R2,     R3                      ; 5666   0293
        ANDI    #$0080, R3                      ; 5667   03BB 0080
        SLL     R3,     1                       ; 5669   004B
        SWAP    R3,     1                       ; 566A   0043
        SUBR    R3,     R4                      ; 566B   011C
        MVI@    R4,     R3                      ; 566C   02A3
        MOVR    R1,     R4                      ; 566D   008C
        ADDI    #$00F0, R4                      ; 566E   02FC 00F0
        INCR    R3                              ; 5670   000B
        MVO@    R3,     R4                      ; 5671   0263
L_5672:
        PSHR    R5                              ; 5672   0275
        MOVR    R1,     R4                      ; 5673   008C
        ADDI    #$0101, R4                      ; 5674   02FC 0101
        MOVR    R1,     R3                      ; 5676   008B
        ADDI    #$0082, R3                      ; 5677   02FB 0082
        MOVR    R1,     R2                      ; 5679   008A
        ADDI    #$0200, R2                      ; 567A   02FA 0200
        ADD@    R3,     R2                      ; 567C   02DA
        ADD@    R4,     R2                      ; 567D   02E2
        MOVR    R1,     R4                      ; 567E   008C
        ADDI    #$02B3, R4                      ; 567F   02FC 02B3
        MOVR    R1,     R3                      ; 5681   008B
        ADDI    #$0083, R3                      ; 5682   02FB 0083
        ADD@    R3,     R4                      ; 5684   02DC
        MVI@    R4,     R0                      ; 5685   02A0
        AND@    R2,     R0                      ; 5686   0390
        BEQ     L_55D0                          ; 5687   0224 00B8

        MOVR    R1,     R4                      ; 5689   008C
        ADDI    #$00F0, R4                      ; 568A   02FC 00F0
        MVI@    R4,     R3                      ; 568C   02A3
L_568D:
        DECR    R3                              ; 568D   0013
        MOVR    R3,     R5                      ; 568E   009D
        ANDI    #$003F, R5                      ; 568F   03BD 003F
        BEQ     L_55D0                          ; 5691   0224 00C2

        MOVR    R1,     R4                      ; 5693   008C
        ADDI    #$027F, R4                      ; 5694   02FC 027F
        ADDR    R3,     R4                      ; 5696   00DC
        MVI@    R4,     R5                      ; 5697   02A5
        ANDR    R0,     R5                      ; 5698   0185
        BEQ     L_568D                          ; 5699   0224 000D

L_569B:
        MOVR    R1,     R4                      ; 569B   008C
        ADDI    #$00F0, R4                      ; 569C   02FC 00F0
        MVO@    R3,     R4                      ; 569E   0263
        ADDR    R1,     R3                      ; 569F   00CB
        ADDI    #$028F, R3                      ; 56A0   02FB 028F
        MVI@    R3,     R0                      ; 56A2   0298
        MOVR    R1,     R3                      ; 56A3   008B
        ADDI    #$0100, R3                      ; 56A4   02FB 0100
        MVO@    R0,     R3                      ; 56A6   0258
        CLRC                                    ; 56A7   0006
        PULR    R7                              ; 56A8   02B7

L_56A9:
        MOVR    R1,     R4                      ; 56A9   008C
        ADDI    #$0104, R4                      ; 56AA   02FC 0104
        MVI@    R4,     R0                      ; 56AC   02A0
        DECR    R0                              ; 56AD   0010
        BMI     L_5672                          ; 56AE   022B 003D

        DECR    R0                              ; 56B0   0010
        BMI     L_5656                          ; 56B1   022B 005C
        BEQ     L_56CF                          ; 56B3   0204 001A

        MOVR    R1,     R3                      ; 56B5   008B
        ADDI    #$0101, R3                      ; 56B6   02FB 0101
        MVI@    R3,     R0                      ; 56B8   0298
        ANDI    #$0007, R0                      ; 56B9   03B8 0007
        MOVR    R1,     R3                      ; 56BB   008B
        ADDI    #$0082, R3                      ; 56BC   02FB 0082
        SDBD                                    ; 56BE   0001
        MVII    #$5F0C, R4                      ; 56BF   02BC 000C 005F
        ADD@    R3,     R4                      ; 56C2   02DC
        CMP@    R4,     R0                      ; 56C3   0360
        BEQ     L_5656                          ; 56C4   0224 006F

        PSHR    R5                              ; 56C6   0275

        JSR     R5,     L_558A                  ; 56C7   0004 0154 018A

        MVII    #$0002, R0                      ; 56CA   02B8 0002
        BNC     L_56D9                          ; 56CC   0209 000B

        PULR    R5                              ; 56CE   02B5
L_56CF:
        PSHR    R5                              ; 56CF   0275

        JSR     R5,     L_5586                  ; 56D0   0004 0154 0186

        PULR    R5                              ; 56D3   02B5
        BC      L_5656                          ; 56D4   0221 007F

L_56D6:
        PSHR    R5                              ; 56D6   0275
        MVII    #$0001, R0                      ; 56D7   02B8 0001
L_56D9:
        MOVR    R1,     R4                      ; 56D9   008C
        ADDI    #$0104, R4                      ; 56DA   02FC 0104
        MVO@    R0,     R4                      ; 56DC   0260
        CLRC                                    ; 56DD   0006
        PULR    R7                              ; 56DE   02B7

        MOVR    R1,     R3                      ; 56DF   008B
        ADDI    #$0082, R3                      ; 56E0   02FB 0082
        SDBD                                    ; 56E2   0001
        MVII    #$5E9E, R4                      ; 56E3   02BC 009E 005E
        ADD@    R3,     R4                      ; 56E6   02DC
        MVI@    R4,     R2                      ; 56E7   02A2
        ADDR    R1,     R2                      ; 56E8   00CA
        MVI@    R2,     R5                      ; 56E9   0295
        TSTR    R5                              ; 56EA   00AD
        BNEQ    L_5768                          ; 56EB   020C 007B

        MVII    #$0010, R4                      ; 56ED   02BC 0010
        B       L_56F6                          ; 56EF   0200 0005

        MVII    #$0000, R4                      ; 56F1   02BC 0000
        MOVR    R1,     R3                      ; 56F3   008B
        ADDI    #$0082, R3                      ; 56F4   02FB 0082
L_56F6:
        ADD@    R3,     R4                      ; 56F6   02DC
        SDBD                                    ; 56F7   0001
        ADDI    #$5E87, R4                      ; 56F8   02FC 0087 005E
        MOVR    R1,     R2                      ; 56FB   008A
        ADDI    #$011F, R2                      ; 56FC   02FA 011F
        MVI@    R2,     R0                      ; 56FE   0290
        AND@    R4,     R0                      ; 56FF   03A0
        BNEQ    L_5768                          ; 5700   020C 0066

        MOVR    R1,     R3                      ; 5702   008B
        ADDI    #$0081, R3                      ; 5703   02FB 0081
        MVI@    R3,     R5                      ; 5705   029D
L_5706:
        TSTR    R5                              ; 5706   00AD
        BEQ     L_5721                          ; 5707   0204 0018

        MVI@    R4,     R0                      ; 5709   02A0
        MOVR    R1,     R3                      ; 570A   008B
        ADDI    #$0131, R3                      ; 570B   02FB 0131
        ADDR    R5,     R3                      ; 570D   00EB
        CMP@    R3,     R0                      ; 570E   0358
        BEQ     L_5768                          ; 570F   0204 0057

        DECR    R3                              ; 5711   0013
        CMP@    R3,     R0                      ; 5712   0358
        BEQ     L_5768                          ; 5713   0204 0053

        ADDI    #$0003, R4                      ; 5715   02FC 0003
        MVI@    R4,     R0                      ; 5717   02A0
        CMP@    R3,     R0                      ; 5718   0358
        BEQ     L_5768                          ; 5719   0204 004D

        SUBI    #$0005, R4                      ; 571B   033C 0005
        SUBI    #$0010, R5                      ; 571D   033D 0010
        B       L_5706                          ; 571F   0220 001A

L_5721:
        INCR    R4                              ; 5721   000C
        MVI@    R4,     R2                      ; 5722   02A2
        INCR    R4                              ; 5723   000C
        PSHR    R4                              ; 5724   0274
        PSHR    R2                              ; 5725   0272
        ADDR    R1,     R2                      ; 5726   00CA
        MVI@    R2,     R0                      ; 5727   0290
        TSTR    R0                              ; 5728   0080
        BNEQ    L_5766                          ; 5729   020C 003B

        MVI@    R4,     R2                      ; 572B   02A2
        ADDR    R1,     R2                      ; 572C   00CA
        MVI@    R2,     R0                      ; 572D   0290
        TSTR    R0                              ; 572E   0080
        BNEQ    L_5766                          ; 572F   020C 0035

        SUBR    R1,     R2                      ; 5731   010A

        JSR     R5,     L_55DB                  ; 5732   0004 0154 01DB

        BNC     L_5766                          ; 5735   0209 002F

        PULR    R2                              ; 5737   02B2

        JSR     R5,     L_55DB                  ; 5738   0004 0154 01DB

        BNC     L_5767                          ; 573B   0209 002A

        JSR     R5,     L_55D3                  ; 573D   0004 0154 01D3

        BNC     L_5767                          ; 5740   0209 0025

        PULR    R4                              ; 5742   02B4
        MOVR    R1,     R3                      ; 5743   008B
        ADDI    #$00F1, R3                      ; 5744   02FB 00F1
        MVI@    R4,     R0                      ; 5746   02A0
        MVO@    R0,     R3                      ; 5747   0258
        ADDI    #$0010, R3                      ; 5748   02FB 0010
        MVO@    R0,     R3                      ; 574A   0258
        DECR    R3                              ; 574B   0013
        MVI@    R4,     R2                      ; 574C   02A2
        MVO@    R2,     R3                      ; 574D   025A
        MVI@    R4,     R0                      ; 574E   02A0
L_574F:
        MOVR    R1,     R3                      ; 574F   008B
        ADDI    #$0102, R3                      ; 5750   02FB 0102
        MVO@    R0,     R3                      ; 5752   0258
        ADDR    R1,     R2                      ; 5753   00CA
        MVI@    R2,     R0                      ; 5754   0290
        MOVR    R1,     R3                      ; 5755   008B
        ADDI    #$00F0, R3                      ; 5756   02FB 00F0
        MVO@    R0,     R3                      ; 5758   0258
        INCR    R3                              ; 5759   000B
        MVI@    R3,     R2                      ; 575A   029A
        ADDR    R1,     R2                      ; 575B   00CA
        MVI@    R2,     R0                      ; 575C   0290
        MOVR    R1,     R3                      ; 575D   008B
        ADDI    #$0103, R3                      ; 575E   02FB 0103
        MVO@    R0,     R3                      ; 5760   0258
        PULR    R0                              ; 5761   02B0
        INCR    R0                              ; 5762   0008
        J       L_5418                          ; 5763   0004 0354 0018

L_5766:
        PULR    R4                              ; 5766   02B4
L_5767:
        PULR    R2                              ; 5767   02B2
L_5768:
        J       L_5400                          ; 5768   0004 0354 0000

        SDBD                                    ; 576B   0001
        MVII    #$FFF0, R0                      ; 576C   02B8 00F0 00FF
        B       L_5773                          ; 576F   0200 0002

        MVII    #$0010, R0                      ; 5771   02B8 0010
L_5773:
        MOVR    R1,     R3                      ; 5773   008B
        ADDI    #$0122, R3                      ; 5774   02FB 0122
        MOVR    R1,     R4                      ; 5776   008C
        ADDI    #$0081, R4                      ; 5777   02FC 0081
        ADD@    R4,     R3                      ; 5779   02E3
        MVII    #$0004, R2                      ; 577A   02BA 0004
        AND@    R3,     R2                      ; 577C   039A
        BEQ     L_5768                          ; 577D   0224 0016

        DECR    R3                              ; 577F   0013
        MOVR    R1,     R4                      ; 5780   008C
        ADDI    #$00F1, R4                      ; 5781   02FC 00F1
        MVI@    R3,     R2                      ; 5783   029A
        MVO@    R2,     R4                      ; 5784   0262
        ADDR    R0,     R2                      ; 5785   00C2
        MOVR    R2,     R0                      ; 5786   0090
        ANDI    #$0088, R0                      ; 5787   03B8 0088
        BNEQ    L_5768                          ; 5789   022C 0022

        ADDR    R1,     R2                      ; 578B   00CA
        MVI@    R2,     R0                      ; 578C   0290
        TSTR    R0                              ; 578D   0080
        BEQ     L_5768                          ; 578E   0224 0027

        MOVR    R1,     R3                      ; 5790   008B
        ADDI    #$0083, R3                      ; 5791   02FB 0083
        MVI@    R3,     R5                      ; 5793   029D
        XORR    R0,     R5                      ; 5794   01C5
        ANDI    #$0040, R5                      ; 5795   03BD 0040
        BNEQ    L_5768                          ; 5797   022C 0030

        MOVR    R1,     R5                      ; 5799   008D
        ADDI    #$029F, R5                      ; 579A   02FD 029F
        ADDR    R0,     R5                      ; 579C   00C5
        MVII    #$0006, R0                      ; 579D   02B8 0006
        CMP@    R5,     R0                      ; 579F   0368
        BNEQ    L_5768                          ; 57A0   022C 0039

        SUBR    R1,     R2                      ; 57A2   010A
        MOVR    R1,     R3                      ; 57A3   008B
        ADDI    #$0100, R3                      ; 57A4   02FB 0100
        MVO@    R2,     R3                      ; 57A6   025A
        MOVR    R1,     R4                      ; 57A7   008C
        ADDI    #$0082, R4                      ; 57A8   02FC 0082
        MVI@    R4,     R5                      ; 57AA   02A5
        SDBD                                    ; 57AB   0001
        ADDI    #$5F0E, R5                      ; 57AC   02FD 000E 005F
        MOVR    R1,     R4                      ; 57AF   008C
        ADDI    #$00F1, R4                      ; 57B0   02FC 00F1
        MVI@    R4,     R0                      ; 57B2   02A0
        ADD@    R5,     R0                      ; 57B3   02E8
        ANDI    #$0077, R0                      ; 57B4   03B8 0077
        INCR    R3                              ; 57B6   000B
        MVO@    R0,     R3                      ; 57B7   0258
        MVII    #$0050, R0                      ; 57B8   02B8 0050
        B       L_574F                          ; 57BA   0220 006C
        B       L_586B                          ; 57BC   0200 00AD
        B       L_5899                          ; 57BE   0200 00D9

        PULR    R0                              ; 57C0   02B0
        INCR    R0                              ; 57C1   0008
        PSHR    R0                              ; 57C2   0270

        JSR     R5,     L_5838                  ; 57C3   0004 0158 0038

        BC      L_5835                          ; 57C6   0201 006D

        JSR     R5,     L_54E4                  ; 57C8   0004 0154 00E4

        BC      L_5835                          ; 57CB   0201 0068

        JSR     R5,     L_56A9                  ; 57CD   0004 0154 02A9

        BC      L_5835                          ; 57D0   0201 0063

        JSR     R5,     L_5515                  ; 57D2   0004 0154 0115

        BNC     L_5835                          ; 57D5   0209 005E
        J       L_5417                          ; 57D7   0004 0354 0017
        B       L_581F                          ; 57DA   0200 0043

        PULR    R0                              ; 57DC   02B0
        INCR    R0                              ; 57DD   0008
        PSHR    R0                              ; 57DE   0270

        JSR     R5,     L_5838                  ; 57DF   0004 0158 0038

        BC      L_5835                          ; 57E2   0201 0051

        ADDR    R1,     R3                      ; 57E4   00CB
        ADDI    #$029F, R3                      ; 57E5   02FB 029F
        MVI@    R3,     R5                      ; 57E7   029D
        CMPI    #$0004, R5                      ; 57E8   037D 0004
        BC      L_5835                          ; 57EA   0201 0049

        MOVR    R1,     R2                      ; 57EC   008A
        ADDI    #$0101, R2                      ; 57ED   02FA 0101
        MVO@    R0,     R2                      ; 57EF   0250
        CLRR    R0                              ; 57F0   01C0
        MOVR    R1,     R2                      ; 57F1   008A
        ADDI    #$0103, R2                      ; 57F2   02FA 0103
        MVO@    R0,     R2                      ; 57F4   0250
L_57F5:
        MOVR    R1,     R4                      ; 57F5   008C
        ADDI    #$0081, R4                      ; 57F6   02FC 0081
        MOVR    R1,     R5                      ; 57F8   008D
        ADDI    #$014C, R5                      ; 57F9   02FD 014C
        ADD@    R4,     R5                      ; 57FB   02E5
        MVI@    R5,     R2                      ; 57FC   02AA
        SUB@    R5,     R2                      ; 57FD   032A
        MVII    #$0080, R5                      ; 57FE   02BD 0080
        ANDR    R2,     R5                      ; 5800   0195
        BEQ     L_5804                          ; 5801   0204 0001

        NEGR    R2                              ; 5803   0022
L_5804:
        SDBD                                    ; 5804   0001
        ADDI    #$5F2A, R2                      ; 5805   02FA 002A 005F
        MVI@    R2,     R0                      ; 5808   0290
        TSTR    R5                              ; 5809   00AD
        BNEQ    L_580D                          ; 580A   020C 0001

        NEGR    R0                              ; 580C   0020
L_580D:
        MOVR    R1,     R2                      ; 580D   008A
        ADDI    #$0101, R2                      ; 580E   02FA 0101
        ADD@    R2,     R0                      ; 5810   02D0
        MOVR    R0,     R3                      ; 5811   0083
        ANDI    #$0088, R0                      ; 5812   03B8 0088
        BNEQ    L_5835                          ; 5814   020C 001F

        MOVR    R3,     R0                      ; 5816   0098
        ADDR    R1,     R3                      ; 5817   00CB
        MVI@    R3,     R5                      ; 5818   029D
        TSTR    R5                              ; 5819   00AD
        BNEQ    L_5835                          ; 581A   020C 0019

        JSR     R5,     L_54DA                  ; 581C   0004 0154 00DA
L_581F:
        JSR     R5,     L_5641                  ; 581F   0004 0154 0241

        BC      L_57F5                          ; 5822   0221 002E

        MOVR    R1,     R3                      ; 5824   008B
        ADDI    #$0081, R3                      ; 5825   02FB 0081
        MOVR    R1,     R5                      ; 5827   008D
        ADDI    #$0100, R5                      ; 5828   02FD 0100
        MOVR    R1,     R4                      ; 582A   008C
        ADDI    #$014D, R4                      ; 582B   02FC 014D
        ADD@    R3,     R4                      ; 582D   02DC
        MVI@    R4,     R0                      ; 582E   02A0
        CMP@    R5,     R0                      ; 582F   0368
        BEQ     L_581F                          ; 5830   0224 0012
        J       L_5417                          ; 5832   0004 0354 0017
L_5835:
        J       L_5400                          ; 5835   0004 0354 0000

L_5838:
        MOVR    R1,     R3                      ; 5838   008B
        ADDI    #$0081, R3                      ; 5839   02FB 0081
        MVI@    R3,     R3                      ; 583B   029B
        CMPI    #$0080, R3                      ; 583C   037B 0080
        BEQ     L_5869                          ; 583E   0204 0029

        ADDR    R1,     R3                      ; 5840   00CB
        ADDI    #$014D, R3                      ; 5841   02FB 014D
        MVI@    R3,     R2                      ; 5843   029A
        CMPI    #$00FF, R2                      ; 5844   037A 00FF
        BEQ     L_5869                          ; 5846   0204 0021

        ADDR    R1,     R2                      ; 5848   00CA
        MVI@    R2,     R0                      ; 5849   0290
        TSTR    R0                              ; 584A   0080
        BEQ     L_5869                          ; 584B   0204 001C

        MOVR    R1,     R2                      ; 584D   008A
        ADDI    #$0083, R2                      ; 584E   02FA 0083
        XOR@    R2,     R0                      ; 5850   03D0
        ANDI    #$0040, R0                      ; 5851   03B8 0040
        BNEQ    L_5869                          ; 5853   020C 0014

        DECR    R3                              ; 5855   0013
        MVI@    R3,     R2                      ; 5856   029A
        ADDR    R1,     R2                      ; 5857   00CA
        MVI@    R2,     R0                      ; 5858   0290
        TSTR    R0                              ; 5859   0080
        BEQ     L_5869                          ; 585A   0204 000D

        MOVR    R0,     R4                      ; 585C   0084
        MOVR    R0,     R3                      ; 585D   0083
        MOVR    R2,     R0                      ; 585E   0090
        MOVR    R1,     R2                      ; 585F   008A
        ADDI    #$0083, R2                      ; 5860   02FA 0083
        XOR@    R2,     R4                      ; 5862   03D4
        ANDI    #$0040, R4                      ; 5863   03BC 0040
        BEQ     L_5869                          ; 5865   0204 0002

        CLRC                                    ; 5867   0006
        MOVR    R5,     R7                      ; 5868   00AF

L_5869:
        SETC                                    ; 5869   0007
        MOVR    R5,     R7                      ; 586A   00AF

L_586B:
        PULR    R0                              ; 586B   02B0
        INCR    R0                              ; 586C   0008
        PSHR    R0                              ; 586D   0270

        JSR     R5,     L_5838                  ; 586E   0004 0158 0038

        BC      L_5835                          ; 5871   0221 003D

        MOVR    R1,     R3                      ; 5873   008B
        ADDI    #$0081, R3                      ; 5874   02FB 0081
        MOVR    R1,     R4                      ; 5876   008C
        ADDI    #$014D, R4                      ; 5877   02FC 014D
        ADD@    R3,     R4                      ; 5879   02DC
        MVI@    R4,     R2                      ; 587A   02A2
        MOVR    R1,     R5                      ; 587B   008D
        ADDI    #$0100, R5                      ; 587C   02FD 0100
        MVO@    R2,     R5                      ; 587E   026A
        ADDR    R1,     R2                      ; 587F   00CA
        MVI@    R2,     R0                      ; 5880   0290
        MOVR    R1,     R5                      ; 5881   008D
        ADDI    #$00F0, R5                      ; 5882   02FD 00F0
        MVO@    R0,     R5                      ; 5884   0268
        CLRR    R5                              ; 5885   01ED
        MOVR    R1,     R3                      ; 5886   008B
        ADDI    #$0104, R3                      ; 5887   02FB 0104
        MVO@    R5,     R3                      ; 5889   025D
        MOVR    R1,     R2                      ; 588A   008A
        ADDI    #$029F, R2                      ; 588B   02FA 029F
        ADDR    R0,     R2                      ; 588D   00C2
        MVI@    R2,     R0                      ; 588E   0290
        CMPI    #$0006, R0                      ; 588F   0378 0006
        BEQ     L_58FC                          ; 5891   0204 0069

        MVII    #$0078, R0                      ; 5893   02B8 0078
        MOVR    R1,     R2                      ; 5895   008A
        ADDI    #$0101, R2                      ; 5896   02FA 0101
        MVO@    R0,     R2                      ; 5898   0250
L_5899:
        MOVR    R1,     R3                      ; 5899   008B
        ADDI    #$0104, R3                      ; 589A   02FB 0104
        MVI@    R3,     R0                      ; 589C   0298
        TSTR    R0                              ; 589D   0080
        BEQ     L_58AB                          ; 589E   0204 000B

        DECR    R0                              ; 58A0   0010
        BEQ     L_5918                          ; 58A1   0204 0075

        DECR    R0                              ; 58A3   0010
        BEQ     L_5923                          ; 58A4   0204 007D

        DECR    R0                              ; 58A6   0010
        BEQ     L_5931                          ; 58A7   0204 0088
        B       L_5835                          ; 58A9   0220 0075

L_58AB:
        MOVR    R1,     R3                      ; 58AB   008B
        ADDI    #$027F, R3                      ; 58AC   02FB 027F
        MOVR    R1,     R2                      ; 58AE   008A
        ADDI    #$00F0, R2                      ; 58AF   02FA 00F0
        ADD@    R2,     R3                      ; 58B1   02D3
        MVI@    R3,     R0                      ; 58B2   0298
        MOVR    R1,     R2                      ; 58B3   008A
        ADDI    #$0101, R2                      ; 58B4   02FA 0101
        MVI@    R2,     R2                      ; 58B6   0292
L_58B7:
        DECR    R2                              ; 58B7   0012
        BMI     L_5835                          ; 58B8   022B 0084

        ANDI    #$0077, R2                      ; 58BA   03BA 0077
        MOVR    R2,     R5                      ; 58BC   0095
        MOVR    R1,     R3                      ; 58BD   008B
        ADDI    #$0082, R3                      ; 58BE   02FB 0082
        ADD@    R3,     R5                      ; 58C0   02DD
        ADDR    R1,     R5                      ; 58C1   00CD
        ADDI    #$0200, R5                      ; 58C2   02FD 0200
        MVI@    R5,     R4                      ; 58C4   02AC
        ANDR    R0,     R4                      ; 58C5   0184
        BEQ     L_58B7                          ; 58C6   0224 0010

        ADDR    R1,     R2                      ; 58C8   00CA
        MVI@    R2,     R5                      ; 58C9   0295
        SUBR    R1,     R2                      ; 58CA   010A
        TSTR    R5                              ; 58CB   00AD
        BEQ     L_58D9                          ; 58CC   0204 000B

        PSHR    R5                              ; 58CE   0275
        INCR    R3                              ; 58CF   000B
        XOR@    R3,     R5                      ; 58D0   03DD
        ANDI    #$0040, R5                      ; 58D1   03BD 0040
        PULR    R5                              ; 58D3   02B5
        BEQ     L_58B7                          ; 58D4   0224 001E

        MOVR    R5,     R0                      ; 58D6   00A8
L_58D7:
        MVII    #$0040, R5                      ; 58D7   02BD 0040
L_58D9:
        MOVR    R1,     R3                      ; 58D9   008B
        ADDI    #$0102, R3                      ; 58DA   02FB 0102
        MVO@    R5,     R3                      ; 58DC   025D
        TSTR    R5                              ; 58DD   00AD
        BNEQ    L_58E1                          ; 58DE   020C 0001

        CLRR    R0                              ; 58E0   01C0
L_58E1:
        MOVR    R1,     R3                      ; 58E1   008B
        ADDI    #$0103, R3                      ; 58E2   02FB 0103
        MVO@    R0,     R3                      ; 58E4   0258
        ANDI    #$00FF, R2                      ; 58E5   03BA 00FF
        MOVR    R1,     R3                      ; 58E7   008B
        ADDI    #$00F1, R3                      ; 58E8   02FB 00F1
        MVO@    R2,     R3                      ; 58EA   025A
        MOVR    R1,     R3                      ; 58EB   008B
        ADDI    #$0101, R3                      ; 58EC   02FB 0101
        MVO@    R2,     R3                      ; 58EE   025A
        MOVR    R1,     R3                      ; 58EF   008B
        ADDI    #$0081, R3                      ; 58F0   02FB 0081
        MOVR    R1,     R4                      ; 58F2   008C
        ADDI    #$014C, R4                      ; 58F3   02FC 014C
        ADD@    R3,     R4                      ; 58F5   02DC
        CMP@    R4,     R2                      ; 58F6   0362
        BEQ     L_5899                          ; 58F7   0224 005F
        J       L_5417                          ; 58F9   0004 0354 0017

L_58FC:
        MOVR    R1,     R3                      ; 58FC   008B
        ADDI    #$0082, R3                      ; 58FD   02FB 0082
        MOVR    R1,     R2                      ; 58FF   008A
        ADDI    #$0100, R2                      ; 5900   02FA 0100
        MVI@    R2,     R0                      ; 5902   0290
        ANDI    #$0007, R0                      ; 5903   03B8 0007
        SDBD                                    ; 5905   0001
        MVII    #$5E8E, R4                      ; 5906   02BC 008E 005E
        ADD@    R3,     R4                      ; 5909   02DC
        CMP@    R4,     R0                      ; 590A   0360
        BEQ     L_5835                          ; 590B   0224 00D7

        MOVR    R1,     R3                      ; 590D   008B
        ADDI    #$0104, R3                      ; 590E   02FB 0104
        MVI@    R3,     R0                      ; 5910   0298
        INCR    R0                              ; 5911   0008
        MVO@    R0,     R3                      ; 5912   0258

        JSR     R5,     L_5962                  ; 5913   0004 0158 0162

        BNC     L_58D7                          ; 5916   0229 0040

L_5918:
        MOVR    R1,     R3                      ; 5918   008B
        ADDI    #$0104, R3                      ; 5919   02FB 0104
        MVI@    R3,     R0                      ; 591B   0298
        INCR    R0                              ; 591C   0008
        MVO@    R0,     R3                      ; 591D   0258

        JSR     R5,     L_5966                  ; 591E   0004 0158 0166

        BNC     L_58D7                          ; 5921   0229 004B

L_5923:
        MOVR    R1,     R3                      ; 5923   008B
        ADDI    #$0104, R3                      ; 5924   02FB 0104
        MVI@    R3,     R0                      ; 5926   0298
        INCR    R0                              ; 5927   0008
        MVO@    R0,     R3                      ; 5928   0258
        MOVR    R1,     R3                      ; 5929   008B
        ADDI    #$0100, R3                      ; 592A   02FB 0100
        MVI@    R3,     R2                      ; 592C   029A
        MVII    #$0008, R0                      ; 592D   02B8 0008
        B       L_594E                          ; 592F   0200 001D

L_5931:
        MOVR    R1,     R3                      ; 5931   008B
        ADDI    #$0104, R3                      ; 5932   02FB 0104
        MVI@    R3,     R0                      ; 5934   0298
        INCR    R0                              ; 5935   0008
        MVO@    R0,     R3                      ; 5936   0258
        MOVR    R1,     R3                      ; 5937   008B
        ADDI    #$0100, R3                      ; 5938   02FB 0100
        MVI@    R3,     R2                      ; 593A   029A
        MOVR    R1,     R3                      ; 593B   008B
        ADDI    #$0082, R3                      ; 593C   02FB 0082
        SDBD                                    ; 593E   0001
        MVII    #$5F0F, R4                      ; 593F   02BC 000F 005F
        ADD@    R3,     R4                      ; 5942   02DC
        ANDI    #$0007, R2                      ; 5943   03BA 0007
        CMP@    R4,     R2                      ; 5945   0362
        BNEQ    L_5835                          ; 5946   022C 0112

        MVII    #$0004, R0                      ; 5948   02B8 0004
        MOVR    R1,     R3                      ; 594A   008B
        ADDI    #$0101, R3                      ; 594B   02FB 0101
        MVI@    R3,     R2                      ; 594D   029A
L_594E:
        MOVR    R1,     R3                      ; 594E   008B
        ADDI    #$0102, R3                      ; 594F   02FB 0102
        MVO@    R0,     R3                      ; 5951   0258
        MOVR    R1,     R3                      ; 5952   008B
        ADDI    #$0082, R3                      ; 5953   02FB 0082
        SDBD                                    ; 5955   0001
        MVII    #$5F0E, R4                      ; 5956   02BC 000E 005F
        ADD@    R3,     R4                      ; 5959   02DC
        ADD@    R4,     R2                      ; 595A   02E2
        ADDR    R1,     R2                      ; 595B   00CA
        MVI@    R2,     R0                      ; 595C   0290
        TSTR    R0                              ; 595D   0080
        BNEQ    L_5835                          ; 595E   022C 012A
        B       L_58E1                          ; 5960   0220 0080

L_5962:
        MVII    #$0001, R0                      ; 5962   02B8 0001
        B       L_5967                          ; 5964   0200 0001

L_5966:
        CLRR    R0                              ; 5966   01C0
L_5967:
        MOVR    R1,     R3                      ; 5967   008B
        ADDI    #$0082, R3                      ; 5968   02FB 0082
        ADD@    R3,     R0                      ; 596A   02D8
        MOVR    R1,     R2                      ; 596B   008A
        ADDI    #$0100, R2                      ; 596C   02FA 0100
        SDBD                                    ; 596E   0001
        MVII    #$5F08, R4                      ; 596F   02BC 0008 005F
        ADDR    R0,     R4                      ; 5972   00C4
        MVI@    R4,     R0                      ; 5973   02A0
        ADD@    R2,     R0                      ; 5974   02D0
        MOVR    R0,     R2                      ; 5975   0082
        ANDI    #$0088, R0                      ; 5976   03B8 0088
        BNEQ    L_5988                          ; 5978   020C 000E

        ADDR    R1,     R2                      ; 597A   00CA
        MVI@    R2,     R0                      ; 597B   0290
        TSTR    R0                              ; 597C   0080
        BEQ     L_5988                          ; 597D   0204 0009

        INCR    R3                              ; 597F   000B
        MOVR    R0,     R4                      ; 5980   0084
        XOR@    R3,     R4                      ; 5981   03DC
        ANDI    #$0040, R4                      ; 5982   03BC 0040
        BEQ     L_5988                          ; 5984   0204 0002

        CLRC                                    ; 5986   0006
        MOVR    R5,     R7                      ; 5987   00AF

L_5988:
        SETC                                    ; 5988   0007
        MOVR    R5,     R7                      ; 5989   00AF

L_598A:
        JSR     R5,     L_6A61                  ; 598A   0004 0168 0261
L_598D:
        JSR     R5,     L_5404                  ; 598D   0004 0154 0004

        BC      L_5A85                          ; 5990   0201 00F3

        JSR     R5,     L_62A9                  ; 5992   0004 0160 02A9

        MOVR    R1,     R3                      ; 5995   008B
        ADDI    #$030D, R3                      ; 5996   02FB 030D
        MVI@    R3,     R5                      ; 5998   029D
        TSTR    R5                              ; 5999   00AD
        BNEQ    L_5A79                          ; 599A   020C 00DD

        JSR     R5,     L_6AA7                  ; 599C   0004 0168 02A7

        PSHR    R0                              ; 599F   0270

        JSR     R5,     L_5D07                  ; 59A0   0004 015C 0107

        ADD@    R6,     R0                      ; 59A3   02F0
        MOVR    R1,     R4                      ; 59A4   008C
        ADDI    #$0108, R4                      ; 59A5   02FC 0108
        MVO@    R0,     R4                      ; 59A7   0260
        SWAP    R0,     1                       ; 59A8   0040
        MVO@    R0,     R4                      ; 59A9   0260
        SWAP    R0,     1                       ; 59AA   0040
        MOVR    R1,     R4                      ; 59AB   008C
        ADDI    #$00F8, R4                      ; 59AC   02FC 00F8
        SDBD                                    ; 59AE   0001
        ADD@    R4,     R0                      ; 59AF   02E0
        MOVR    R1,     R4                      ; 59B0   008C
        ADDI    #$00F6, R4                      ; 59B1   02FC 00F6
        MVO@    R0,     R4                      ; 59B3   0260
        SWAP    R0,     1                       ; 59B4   0040
        MVO@    R0,     R4                      ; 59B5   0260

        JSR     R5,     L_6A30                  ; 59B6   0004 0168 0230
        JSR     R5,     L_55E6                  ; 59B9   0004 0154 01E6

        BNC     L_598A                          ; 59BC   0229 0033

        MOVR    R1,     R3                      ; 59BE   008B
        ADDI    #$0080, R3                      ; 59BF   02FB 0080
        MVI@    R3,     R0                      ; 59C1   0298
        CMPI    #$0001, R0                      ; 59C2   0378 0001
        BNEQ    L_59E0                          ; 59C4   020C 001A

        JSR     R5,     L_61A7                  ; 59C6   0004 0160 01A7

        BC      L_59E0                          ; 59C9   0201 0015
        BNEQ    L_5ABB                          ; 59CB   020C 00EE

        JSR     R5,     L_59D6                  ; 59CD   0004 0158 01D6
        JSR     R5,     L_6A61                  ; 59D0   0004 0168 0261

        J       L_6292                          ; 59D3   0004 0360 0292

L_59D6:
        PSHR    R5                              ; 59D6   0275
        MOVR    R1,     R4                      ; 59D7   008C
        ADDI    #$0100, R4                      ; 59D8   02FC 0100
        MOVR    R1,     R5                      ; 59DA   008D
        ADDI    #$00FA, R5                      ; 59DB   02FD 00FA
        J       L_6A29                          ; 59DD   0004 0368 0229

L_59E0:
        MOVR    R1,     R3                      ; 59E0   008B
        ADDI    #$012B, R3                      ; 59E1   02FB 012B
        MOVR    R1,     R2                      ; 59E3   008A
        ADDI    #$0081, R2                      ; 59E4   02FA 0081
        ADD@    R2,     R3                      ; 59E6   02D3
        MVI@    R3,     R0                      ; 59E7   0298
        INCR    R0                              ; 59E8   0008
        MVO@    R0,     R3                      ; 59E9   0258
        MOVR    R1,     R3                      ; 59EA   008B
        ADDI    #$0080, R3                      ; 59EB   02FB 0080
        MVI@    R3,     R5                      ; 59ED   029D
        CMPI    #$0009, R5                      ; 59EE   037D 0009
        BC      L_5ADC                          ; 59F0   0201 00EA

        CLRR    R0                              ; 59F2   01C0
        ADDI    #$00BB, R3                      ; 59F3   02FB 00BB
        ADD@    R2,     R3                      ; 59F5   02D3
        MVO@    R0,     R3                      ; 59F6   0258

        JSR     R5,     L_55D3                  ; 59F7   0004 0154 01D3

        BNC     L_5A62                          ; 59FA   0209 0066

        MOVR    R1,     R3                      ; 59FC   008B
        ADDI    #$0080, R3                      ; 59FD   02FB 0080
        MVI@    R3,     R5                      ; 59FF   029D
        DECR    R5                              ; 5A00   0015
        MOVR    R1,     R4                      ; 5A01   008C
        ADDI    #$00FE, R4                      ; 5A02   02FC 00FE
        SUB@    R4,     R5                      ; 5A04   0325
        BNC     L_5A62                          ; 5A05   0209 005B

        MOVR    R1,     R2                      ; 5A07   008A
        ADDI    #$0081, R2                      ; 5A08   02FA 0081
        ADDI    #$00BB, R3                      ; 5A0A   02FB 00BB
        ADD@    R2,     R3                      ; 5A0C   02D3
        MVI@    R3,     R0                      ; 5A0D   0298
        INCR    R0                              ; 5A0E   0008
        MVO@    R0,     R3                      ; 5A0F   0258
        SUB@    R4,     R5                      ; 5A10   0325
        BC      L_5A21                          ; 5A11   0201 000E

        JSR     R5,     L_5B28                  ; 5A13   0004 0158 0328

        BNEQ    L_5A62                          ; 5A16   020C 004A

        JSR     R5,     L_5B33                  ; 5A18   0004 0158 0333

        SDBD                                    ; 5A1B   0001
        MVII    #$000D, R5                      ; 5A1C   02BD 000D 0000
        B       L_5A3F                          ; 5A1F   0200 001E

L_5A21:
        MOVR    R1,     R5                      ; 5A21   008D
        ADDI    #$00FE, R5                      ; 5A22   02FD 00FE
        MVI@    R5,     R0                      ; 5A24   02A8
        ADD@    R5,     R0                      ; 5A25   02E8
        ADDI    #$0002, R0                      ; 5A26   02F8 0002
        MOVR    R1,     R3                      ; 5A28   008B
        ADDI    #$0080, R3                      ; 5A29   02FB 0080
        CMP@    R3,     R0                      ; 5A2B   0358
        BNC     L_5A3A                          ; 5A2C   0209 000C

        ADDI    #$0014, R3                      ; 5A2E   02FB 0014
        MVI@    R3,     R0                      ; 5A30   0298
        CMPI    #$000C, R0                      ; 5A31   0378 000C
        BNC     L_5A3A                          ; 5A33   0209 0005

        JSR     R5,     L_5B28                  ; 5A35   0004 0158 0328

        BEQ     L_5A3A                          ; 5A38   0204 0000

L_5A3A:
        SDBD                                    ; 5A3A   0001
        MVII    #$001A, R5                      ; 5A3B   02BD 001A 0000
        CLRR    R0                              ; 5A3E   01C0
L_5A3F:
        MOVR    R1,     R4                      ; 5A3F   008C
        ADDI    #$00F8, R4                      ; 5A40   02FC 00F8
        SDBD                                    ; 5A42   0001
        ADD@    R4,     R0                      ; 5A43   02E0
        SUBI    #$0004, R4                      ; 5A44   033C 0004
        MVO@    R0,     R4                      ; 5A46   0260
        SWAP    R0,     1                       ; 5A47   0040
        MVO@    R0,     R4                      ; 5A48   0260
        SWAP    R0,     1                       ; 5A49   0040
        MOVR    R1,     R3                      ; 5A4A   008B
        ADDI    #$0081, R3                      ; 5A4B   02FB 0081
        MOVR    R1,     R4                      ; 5A4D   008C
        ADDI    #$0126, R4                      ; 5A4E   02FC 0126
        ADD@    R3,     R4                      ; 5A50   02DC
        SDBD                                    ; 5A51   0001
        CMP@    R4,     R0                      ; 5A52   0360
        BEQ     L_598A                          ; 5A53   0224 00CA

        PSHR    R0                              ; 5A55   0270
        GSWD    R0                              ; 5A56   0030
        SLR     R0,     1                       ; 5A57   0060
        ADDI    #$0001, R3                      ; 5A58   02FB 0001
        XOR@    R3,     R0                      ; 5A5A   03D8
        SLL     R0,     1                       ; 5A5B   0048
        RSWD    R0                              ; 5A5C   0038
        PULR    R0                              ; 5A5D   02B0
        BC      L_598A                          ; 5A5E   0221 00D5
        B       L_5A6C                          ; 5A60   0200 000A

L_5A62:
        CLRR    R5                              ; 5A62   01ED
        MOVR    R1,     R3                      ; 5A63   008B
        ADDI    #$0081, R3                      ; 5A64   02FB 0081
        MOVR    R1,     R4                      ; 5A66   008C
        ADDI    #$0116, R4                      ; 5A67   02FC 0116
        ADD@    R3,     R4                      ; 5A69   02DC
        SDBD                                    ; 5A6A   0001
        MVI@    R4,     R0                      ; 5A6B   02A0
L_5A6C:
        MOVR    R1,     R3                      ; 5A6C   008B
        ADDI    #$0105, R3                      ; 5A6D   02FB 0105
        MVO@    R5,     R3                      ; 5A6F   025D
        MOVR    R1,     R4                      ; 5A70   008C
        ADDI    #$0106, R4                      ; 5A71   02FC 0106
        MVO@    R0,     R4                      ; 5A73   0260
        SWAP    R0,     1                       ; 5A74   0040
        MVO@    R0,     R4                      ; 5A75   0260
        SWAP    R0,     1                       ; 5A76   0040
        B       L_598D                          ; 5A77   0220 00EB

L_5A79:
        MOVR    R1,     R3                      ; 5A79   008B
        ADDI    #$0080, R3                      ; 5A7A   02FB 0080
        MVI@    R3,     R0                      ; 5A7C   0298
        TSTR    R0                              ; 5A7D   0080
        BEQ     L_5A8C                          ; 5A7E   0204 000C

        JSR     R5,     L_6A61                  ; 5A80   0004 0168 0261

        B       L_5A79                          ; 5A83   0220 000B

L_5A85:
        MOVR    R1,     R3                      ; 5A85   008B
        ADDI    #$0080, R3                      ; 5A86   02FB 0080
        MVI@    R3,     R0                      ; 5A88   0298
        TSTR    R0                              ; 5A89   0080
        BNEQ    L_5A9F                          ; 5A8A   020C 0013

L_5A8C:
        JSR     R5,     L_6B17                  ; 5A8C   0004 0168 0317

        J       L_624C                          ; 5A8F   0004 0360 024C

L_5A92:
        SDBD                                    ; 5A92   0001
        MVII    #$0400, R0                      ; 5A93   02B8 0000 0004
        MOVR    R1,     R4                      ; 5A96   008C
        ADDI    #$00A2, R4                      ; 5A97   02FC 00A2
        SDBD                                    ; 5A99   0001
        SUB@    R4,     R0                      ; 5A9A   0320
        SLL     R0,     2                       ; 5A9B   004C
        SLL     R0,     2                       ; 5A9C   004C
        SLL     R0,     1                       ; 5A9D   0048
        MOVR    R5,     R7                      ; 5A9E   00AF

L_5A9F:
        MOVR    R1,     R4                      ; 5A9F   008C
        ADDI    #$0081, R4                      ; 5AA0   02FC 0081
        MOVR    R1,     R3                      ; 5AA2   008B
        ADDI    #$013B, R3                      ; 5AA3   02FB 013B
        ADD@    R4,     R3                      ; 5AA5   02E3
        MVI@    R3,     R0                      ; 5AA6   0298
        TSTR    R0                              ; 5AA7   0080
        BNEQ    L_5AC3                          ; 5AA8   020C 0019

        JSR     R5,     L_55D3                  ; 5AAA   0004 0154 01D3

        GSWD    R0                              ; 5AAD   0030
        PSHR    R0                              ; 5AAE   0270

        JSR     R5,     L_6A61                  ; 5AAF   0004 0168 0261

        PULR    R0                              ; 5AB2   02B0
        RSWD    R0                              ; 5AB3   0038
        BC      L_5ABE                          ; 5AB4   0201 0008

        JSR     R5,     L_5B42                  ; 5AB6   0004 0158 0342

        B       L_5ACD                          ; 5AB9   0200 0012

L_5ABB:
        JSR     R5,     L_6A61                  ; 5ABB   0004 0168 0261
L_5ABE:
        JSR     R5,     L_5A92                  ; 5ABE   0004 0158 0292

        B       L_5ACD                          ; 5AC1   0200 000A

L_5AC3:
        MOVR    R1,     R4                      ; 5AC3   008C
        ADDI    #$0106, R4                      ; 5AC4   02FC 0106
        SDBD                                    ; 5AC6   0001
        MVI@    R4,     R0                      ; 5AC7   02A0
        PSHR    R0                              ; 5AC8   0270

        JSR     R5,     L_6A61                  ; 5AC9   0004 0168 0261

        PULR    R0                              ; 5ACC   02B0
L_5ACD:
        MOVR    R1,     R4                      ; 5ACD   008C
        ADDI    #$00F6, R4                      ; 5ACE   02FC 00F6
        MVO@    R0,     R4                      ; 5AD0   0260
        SWAP    R0,     1                       ; 5AD1   0040
        MVO@    R0,     R4                      ; 5AD2   0260
        MOVR    R1,     R3                      ; 5AD3   008B
        ADDI    #$0080, R3                      ; 5AD4   02FB 0080
        CLRR    R0                              ; 5AD6   01C0
        CMP@    R3,     R0                      ; 5AD7   0358
        BEQ     L_5B05                          ; 5AD8   0204 002B
        B       L_5AEC                          ; 5ADA   0200 0010

L_5ADC:
        MOVR    R1,     R4                      ; 5ADC   008C
        ADDI    #$00F8, R4                      ; 5ADD   02FC 00F8
        SDBD                                    ; 5ADF   0001
        MVI@    R4,     R0                      ; 5AE0   02A0
        PSHR    R0                              ; 5AE1   0270

        JSR     R5,     L_6A61                  ; 5AE2   0004 0168 0261

        PULR    R0                              ; 5AE5   02B0
        MOVR    R1,     R4                      ; 5AE6   008C
        ADDI    #$00F6, R4                      ; 5AE7   02FC 00F6
        MVO@    R0,     R4                      ; 5AE9   0260
        SWAP    R0,     1                       ; 5AEA   0040
        MVO@    R0,     R4                      ; 5AEB   0260
L_5AEC:
        MOVR    R1,     R5                      ; 5AEC   008D
        ADDI    #$00F6, R5                      ; 5AED   02FD 00F6
        SDBD                                    ; 5AEF   0001
        MVI@    R5,     R0                      ; 5AF0   02A8
        MOVR    R1,     R5                      ; 5AF1   008D
        ADDI    #$0126, R5                      ; 5AF2   02FD 0126
        MOVR    R1,     R3                      ; 5AF4   008B
        ADDI    #$0081, R3                      ; 5AF5   02FB 0081
        ADD@    R3,     R5                      ; 5AF7   02DD
        SDBD                                    ; 5AF8   0001
        CMP@    R5,     R0                      ; 5AF9   0368
        BEQ     L_598A                          ; 5AFA   0224 0171

        GSWD    R0                              ; 5AFC   0030
        SLR     R0,     1                       ; 5AFD   0060
        ADDI    #$0001, R3                      ; 5AFE   02FB 0001
        XOR@    R3,     R0                      ; 5B00   03D8
        SLL     R0,     1                       ; 5B01   0048
        RSWD    R0                              ; 5B02   0038
        BC      L_598A                          ; 5B03   0221 017A

L_5B05:
        MOVR    R1,     R5                      ; 5B05   008D
        ADDI    #$00F6, R5                      ; 5B06   02FD 00F6
        MOVR    R1,     R4                      ; 5B08   008C
        ADDI    #$0106, R4                      ; 5B09   02FC 0106
        SDBD                                    ; 5B0B   0001
        MVI@    R5,     R0                      ; 5B0C   02A8
        SDBD                                    ; 5B0D   0001
        CMP@    R4,     R0                      ; 5B0E   0360
        BEQ     L_598D                          ; 5B0F   0224 0183

        PSHR    R0                              ; 5B11   0270
        GSWD    R0                              ; 5B12   0030
        SLR     R0,     1                       ; 5B13   0060
        MOVR    R1,     R4                      ; 5B14   008C
        ADDI    #$0082, R4                      ; 5B15   02FC 0082
        XOR@    R4,     R0                      ; 5B17   03E0
        SLL     R0,     1                       ; 5B18   0048
        RSWD    R0                              ; 5B19   0038
        PULR    R0                              ; 5B1A   02B0
        BNC     L_598D                          ; 5B1B   0229 018F

        MOVR    R1,     R4                      ; 5B1D   008C
        ADDI    #$0106, R4                      ; 5B1E   02FC 0106
        MVO@    R0,     R4                      ; 5B20   0260
        SWAP    R0,     1                       ; 5B21   0040
        MVO@    R0,     R4                      ; 5B22   0260

        JSR     R5,     L_6A1B                  ; 5B23   0004 0168 021B

        B       L_598D                          ; 5B26   0220 019A

L_5B28:
        PSHR    R5                              ; 5B28   0275

        JSR     R5,     L_6B48                  ; 5B29   0004 0168 0348

        MOVR    R1,     R3                      ; 5B2C   008B
        ADDI    #$0090, R3                      ; 5B2D   02FB 0090
        MVII    #$0020, R0                      ; 5B2F   02B8 0020
        AND@    R3,     R0                      ; 5B31   0398
        PULR    R7                              ; 5B32   02B7

L_5B33:
        MOVR    R1,     R3                      ; 5B33   008B
        ADDI    #$0092, R3                      ; 5B34   02FB 0092
        MVI@    R3,     R0                      ; 5B36   0298
        SWAP    R0,     1                       ; 5B37   0040
        TSTR    R0                              ; 5B38   0080
        BPL     L_5B3D                          ; 5B39   0203 0002

        ADDI    #$00FF, R0                      ; 5B3B   02F8 00FF
L_5B3D:
        SWAP    R0,     1                       ; 5B3D   0040
        SLL     R0,     2                       ; 5B3E   004C
        SLL     R0,     2                       ; 5B3F   004C
        SLL     R0,     1                       ; 5B40   0048
        MOVR    R5,     R7                      ; 5B41   00AF

L_5B42:
        MOVR    R1,     R3                      ; 5B42   008B
        ADDI    #$0082, R3                      ; 5B43   02FB 0082
        MVI@    R3,     R2                      ; 5B45   029A
        SUBI    #$0002, R3                      ; 5B46   033B 0002
        MVI@    R3,     R0                      ; 5B48   0298
        INCR    R0                              ; 5B49   0008
        INCR    R0                              ; 5B4A   0008
        TSTR    R2                              ; 5B4B   0092
        BNEQ    L_5B4F                          ; 5B4C   020C 0001

        COMR    R0                              ; 5B4E   0018
L_5B4F:
        MOVR    R5,     R7                      ; 5B4F   00AF

L_5B50:
        PSHR    R5                              ; 5B50   0275
        MVII    #$00D0, R1                      ; 5B51   02B9 00D0
        SWAP    R1,     1                       ; 5B53   0041

        JSR     R5,     L_6AEF                  ; 5B54   0004 0168 02EF

        MOVR    R1,     R3                      ; 5B57   008B
        ADDI    #$011E, R3                      ; 5B58   02FB 011E
        MOVR    R1,     R2                      ; 5B5A   008A
        ADDI    #$0082, R2                      ; 5B5B   02FA 0082
        MVI@    R3,     R5                      ; 5B5D   029D
        CMPI    #$0008, R5                      ; 5B5E   037D 0008
        BNEQ    L_5B70                          ; 5B60   020C 000E

        MVI@    R2,     R0                      ; 5B62   0290
        SLL     R0,     2                       ; 5B63   004C
        TSTR    R0                              ; 5B64   0080
        BNEQ    L_5B6A                          ; 5B65   020C 0003

        MVII    #$00FB, R0                      ; 5B67   02B8 00FB
        SWAP    R0,     1                       ; 5B69   0040
L_5B6A:
        MOVR    R1,     R5                      ; 5B6A   008D
        ADDI    #$0106, R5                      ; 5B6B   02FD 0106
        MVO@    R0,     R5                      ; 5B6D   0268
        SWAP    R0,     1                       ; 5B6E   0040
        MVO@    R0,     R5                      ; 5B6F   0268
L_5B70:
        CLRR    R0                              ; 5B70   01C0
        MOVR    R1,     R3                      ; 5B71   008B
        ADDI    #$013B, R3                      ; 5B72   02FB 013B
        MVO@    R0,     R3                      ; 5B74   0258
        MOVR    R1,     R4                      ; 5B75   008C
        ADDI    #$00F8, R4                      ; 5B76   02FC 00F8
        MVO@    R0,     R4                      ; 5B78   0260
        MVII    #$0080, R0                      ; 5B79   02B8 0080
        MVO@    R0,     R4                      ; 5B7B   0260
        SUBI    #$00B6, R3                      ; 5B7C   033B 00B6
        MVII    #$00FF, R0                      ; 5B7E   02B8 00FF
        MVO@    R0,     R3                      ; 5B80   0258
        PULR    R7                              ; 5B81   02B7

L_5B82:
        MOVR    R1,     R3                      ; 5B82   008B
        ADDI    #$0095, R3                      ; 5B83   02FB 0095
        SUB@    R3,     R0                      ; 5B85   0318
        PSHR    R0                              ; 5B86   0270
        ANDI    #$000F, R0                      ; 5B87   03B8 000F
        CMPI    #$0008, R0                      ; 5B89   0378 0008
        BNC     L_5B90                          ; 5B8B   0209 0003

        XORI    #$000F, R0                      ; 5B8D   03F8 000F
        INCR    R0                              ; 5B8F   0008
L_5B90:
        MOVR    R0,     R3                      ; 5B90   0083
        PULR    R0                              ; 5B91   02B0
        ADDI    #$0008, R0                      ; 5B92   02F8 0008
        SLR     R0,     2                       ; 5B94   0064
        SLR     R0,     2                       ; 5B95   0064
        ANDI    #$000F, R0                      ; 5B96   03B8 000F
        CMPI    #$0008, R0                      ; 5B98   0378 0008
        BNC     L_5B9F                          ; 5B9A   0209 0003

        XORI    #$000F, R0                      ; 5B9C   03F8 000F
        INCR    R0                              ; 5B9E   0008
L_5B9F:
        MOVR    R5,     R7                      ; 5B9F   00AF

L_5BA0:
        PSHR    R5                              ; 5BA0   0275
L_5BA1:
        SDBD                                    ; 5BA1   0001
        MVII    #$5FAA, R2                      ; 5BA2   02BA 00AA 005F
        MOVR    R2,     R4                      ; 5BA5   0094
        ADDI    #$0008, R4                      ; 5BA6   02FC 0008

        JSR     R5,     L_5B82                  ; 5BA8   0004 0158 0382

        ADDR    R0,     R2                      ; 5BAB   00C2
        MVI@    R2,     R0                      ; 5BAC   0290
        ADDR    R3,     R4                      ; 5BAD   00DC
        ADD@    R4,     R0                      ; 5BAE   02E0
        ANDI    #$00FF, R0                      ; 5BAF   03B8 00FF
        SWAP    R0,     1                       ; 5BB1   0040
        TSTR    R0                              ; 5BB2   0080
        BPL     L_5BB7                          ; 5BB3   0203 0002

        ADDI    #$00FF, R0                      ; 5BB5   02F8 00FF
L_5BB7:
        SWAP    R0,     1                       ; 5BB7   0040
        MOVR    R1,     R3                      ; 5BB8   008B
        ADDI    #$0096, R3                      ; 5BB9   02FB 0096
        MOVR    R1,     R4                      ; 5BBB   008C
        ADDI    #$0094, R4                      ; 5BBC   02FC 0094
        SDBD                                    ; 5BBE   0001
        MVII    #$5FB9, R5                      ; 5BBF   02BD 00B9 005F
        ADD@    R3,     R5                      ; 5BC2   02DD
        ADD@    R4,     R5                      ; 5BC3   02E5
        MVI@    R5,     R2                      ; 5BC4   02AA
        TSTR    R2                              ; 5BC5   0092
        BEQ     L_5BED                          ; 5BC6   0204 0025

        CLRR    R3                              ; 5BC8   01DB
        MVII    #$0080, R4                      ; 5BC9   02BC 0080
        ANDR    R2,     R4                      ; 5BCB   0194
        BEQ     L_5BD1                          ; 5BCC   0204 0003

        NEGR    R2                              ; 5BCE   0022
        ANDI    #$00FF, R2                      ; 5BCF   03BA 00FF
L_5BD1:
        ADDR    R0,     R3                      ; 5BD1   00C3
        DECR    R2                              ; 5BD2   0012
        BNEQ    L_5BD1                          ; 5BD3   022C 0003

        TSTR    R4                              ; 5BD5   00A4
        BEQ     L_5BD9                          ; 5BD6   0204 0001

        NEGR    R3                              ; 5BD8   0023
L_5BD9:
        MOVR    R3,     R0                      ; 5BD9   0098
        B       L_5BE4                          ; 5BDA   0200 0008

L_5BDC:
        SWAP    R0,     1                       ; 5BDC   0040
        TSTR    R0                              ; 5BDD   0080
        BPL     L_5BE2                          ; 5BDE   0203 0002

        ADDI    #$00FF, R0                      ; 5BE0   02F8 00FF
L_5BE2:
        SWAP    R0,     1                       ; 5BE2   0040
L_5BE3:
        PSHR    R5                              ; 5BE3   0275
L_5BE4:
        MOVR    R1,     R4                      ; 5BE4   008C
        ADDI    #$00A0, R4                      ; 5BE5   02FC 00A0
        MOVR    R4,     R5                      ; 5BE7   00A5
        SDBD                                    ; 5BE8   0001
        ADD@    R4,     R0                      ; 5BE9   02E0
        MVO@    R0,     R5                      ; 5BEA   0268
        SWAP    R0,     1                       ; 5BEB   0040
        MVO@    R0,     R5                      ; 5BEC   0268
L_5BED:
        PULR    R7                              ; 5BED   02B7

L_5BEE:
        PSHR    R5                              ; 5BEE   0275
        MOVR    R1,     R5                      ; 5BEF   008D
        ADDI    #$0095, R5                      ; 5BF0   02FD 0095
        MVO@    R0,     R5                      ; 5BF2   0268
        MOVR    R1,     R4                      ; 5BF3   008C
        ADDI    #$029F, R4                      ; 5BF4   02FC 029F
        MOVR    R0,     R3                      ; 5BF6   0083
        ADDR    R1,     R3                      ; 5BF7   00CB
        ADD@    R3,     R4                      ; 5BF8   02DC
        MVI@    R4,     R0                      ; 5BF9   02A0
        MVO@    R0,     R5                      ; 5BFA   0268
        MOVR    R1,     R3                      ; 5BFB   008B
        ADDI    #$0095, R3                      ; 5BFC   02FB 0095
        MOVR    R1,     R2                      ; 5BFE   008A
        ADDI    #$0082, R2                      ; 5BFF   02FA 0082
        SDBD                                    ; 5C01   0001
        MVII    #$5FD2, R4                      ; 5C02   02BC 00D2 005F
        SDBD                                    ; 5C05   0001
        MVII    #$5FD9, R5                      ; 5C06   02BD 00D9 005F
        ADD@    R2,     R4                      ; 5C09   02D4
        MVI@    R3,     R0                      ; 5C0A   0298
        CLRR    R3                              ; 5C0B   01DB
        CMP@    R4,     R0                      ; 5C0C   0360
        BEQ     L_5C14                          ; 5C0D   0204 0005

        CMP@    R4,     R0                      ; 5C0F   0360
        BNEQ    L_5C27                          ; 5C10   020C 0015

        MVII    #$0010, R3                      ; 5C12   02BB 0010
L_5C14:
        ADD@    R2,     R5                      ; 5C14   02D5
        ADD@    R5,     R3                      ; 5C15   02EB
        ADDR    R1,     R3                      ; 5C16   00CB
        MVI@    R3,     R2                      ; 5C17   029A
        TSTR    R2                              ; 5C18   0092
        BEQ     L_5C3D                          ; 5C19   0204 0022

        ADDR    R1,     R2                      ; 5C1B   00CA
        ADDI    #$029F, R2                      ; 5C1C   02FA 029F
        MVI@    R2,     R0                      ; 5C1E   0290
        CMPI    #$0006, R0                      ; 5C1F   0378 0006
        BNEQ    L_5C3D                          ; 5C21   020C 001A

        MVII    #$00DF, R0                      ; 5C23   02B8 00DF
        B       L_5C3A                          ; 5C25   0200 0013

L_5C27:
        CMP@    R4,     R0                      ; 5C27   0360
        BNEQ    L_5C3D                          ; 5C28   020C 0013

        MVI@    R4,     R3                      ; 5C2A   02A3
        ADDR    R1,     R3                      ; 5C2B   00CB
        MVI@    R3,     R2                      ; 5C2C   029A
        TSTR    R2                              ; 5C2D   0092
        BEQ     L_5C3D                          ; 5C2E   0204 000D

        ADDR    R1,     R2                      ; 5C30   00CA
        ADDI    #$029F, R2                      ; 5C31   02FA 029F
        MVI@    R2,     R0                      ; 5C33   0290
        CMPI    #$0001, R0                      ; 5C34   0378 0001
        BNEQ    L_5C3D                          ; 5C36   020C 0005

        MVII    #$00EC, R0                      ; 5C38   02B8 00EC

L_5C3A:
        JSR     R5,     L_5BDC                  ; 5C3A   0004 0158 03DC

L_5C3D:
        MOVR    R1,     R3                      ; 5C3D   008B
        ADDI    #$0096, R3                      ; 5C3E   02FB 0096
        MVI@    R3,     R0                      ; 5C40   0298
        CMPI    #$0006, R0                      ; 5C41   0378 0006
        BEQ     L_5CA1                          ; 5C43   0204 005C

        CMPI    #$0005, R0                      ; 5C45   0378 0005
        BEQ     L_5C89                          ; 5C47   0204 0040

        CMPI    #$0002, R0                      ; 5C49   0378 0002
        BNEQ    L_5C6A                          ; 5C4B   020C 001D

        MOVR    R1,     R3                      ; 5C4D   008B
        ADDI    #$0095, R3                      ; 5C4E   02FB 0095
        MVI@    R3,     R2                      ; 5C50   029A
        SUBI    #$0013, R3                      ; 5C51   033B 0013
        MVI@    R3,     R3                      ; 5C53   029B

        JSR     R5,     L_5E25                  ; 5C54   0004 015C 0225

        BC      L_5C64                          ; 5C57   0201 000B

        MVII    #$00FB, R0                      ; 5C59   02B8 00FB
        BNEQ    L_5C66                          ; 5C5B   020C 0009

        JSR     R5,     L_5E58                  ; 5C5D   0004 015C 0258

        MVII    #$0005, R0                      ; 5C60   02B8 0005
        BC      L_5C66                          ; 5C62   0201 0002

L_5C64:
        MVII    #$0011, R0                      ; 5C64   02B8 0011

L_5C66:
        JSR     R5,     L_5BDC                  ; 5C66   0004 0158 03DC

        PULR    R7                              ; 5C69   02B7

L_5C6A:
        MOVR    R1,     R3                      ; 5C6A   008B
        ADDI    #$0095, R3                      ; 5C6B   02FB 0095
        MVI@    R3,     R2                      ; 5C6D   029A
        SUBI    #$0013, R3                      ; 5C6E   033B 0013
        MVI@    R3,     R3                      ; 5C70   029B
        ANDI    #$0007, R2                      ; 5C71   03BA 0007
        SDBD                                    ; 5C73   0001
        MVII    #$5FD7, R5                      ; 5C74   02BD 00D7 005F
        ADDR    R3,     R5                      ; 5C77   00DD
        CMP@    R5,     R2                      ; 5C78   036A
        BNEQ    L_5C89                          ; 5C79   020C 000E

        MVII    #$00F8, R0                      ; 5C7B   02B8 00F8
        MOVR    R1,     R3                      ; 5C7D   008B
        ADDI    #$0096, R3                      ; 5C7E   02FB 0096
        MVI@    R3,     R2                      ; 5C80   029A
        DECR    R2                              ; 5C81   0012
        BNEQ    L_5C86                          ; 5C82   020C 0002

        MVII    #$00F5, R0                      ; 5C84   02B8 00F5

L_5C86:
        JSR     R5,     L_5BDC                  ; 5C86   0004 0158 03DC

L_5C89:
        SDBD                                    ; 5C89   0001
        MVII    #$5FD6, R4                      ; 5C8A   02BC 00D6 005F
        MOVR    R1,     R3                      ; 5C8D   008B
        ADDI    #$0082, R3                      ; 5C8E   02FB 0082
        MVI@    R3,     R3                      ; 5C90   029B
        ADDR    R3,     R4                      ; 5C91   00DC
        MVI@    R4,     R0                      ; 5C92   02A0
        MOVR    R1,     R5                      ; 5C93   008D
        ADDI    #$0096, R5                      ; 5C94   02FD 0096
        MVI@    R5,     R2                      ; 5C96   02AA
        DECR    R2                              ; 5C97   0012
        BEQ     L_5BA1                          ; 5C98   0224 00F8

        MOVR    R1,     R2                      ; 5C9A   008A
        ADDI    #$00E2, R2                      ; 5C9B   02FA 00E2
        ADDR    R3,     R2                      ; 5C9D   00DA
        MVI@    R2,     R0                      ; 5C9E   0290
        B       L_5BA1                          ; 5C9F   0220 00FF

L_5CA1:
        MOVR    R1,     R3                      ; 5CA1   008B
        ADDI    #$0082, R3                      ; 5CA2   02FB 0082
        MVI@    R3,     R4                      ; 5CA4   029C
        XORI    #$0008, R4                      ; 5CA5   03FC 0008
        MOVR    R4,     R3                      ; 5CA7   00A3
        MOVR    R1,     R2                      ; 5CA8   008A
        ADDI    #$0095, R2                      ; 5CA9   02FA 0095
        MVI@    R2,     R2                      ; 5CAB   0292
        ANDI    #$0070, R2                      ; 5CAC   03BA 0070
        SDBD                                    ; 5CAE   0001
        ADDI    #$5FD7, R4                      ; 5CAF   02FC 00D7 005F
        XOR@    R4,     R2                      ; 5CB2   03E2

L_5CB3:
        JSR     R5,     L_5E25                  ; 5CB3   0004 015C 0225

        BC      L_5CBC                          ; 5CB6   0201 0004
        BEQ     L_5CB3                          ; 5CB8   0224 0006
        B       L_5D06                          ; 5CBA   0200 004A

L_5CBC:
        MOVR    R1,     R2                      ; 5CBC   008A
        ADDI    #$0095, R2                      ; 5CBD   02FA 0095
        MVI@    R2,     R2                      ; 5CBF   0292
        PSHR    R2                              ; 5CC0   0272
        SDBD                                    ; 5CC1   0001
        MVII    #$5F0E, R4                      ; 5CC2   02BC 000E 005F
        ADDR    R3,     R4                      ; 5CC5   00DC
        SUB@    R4,     R2                      ; 5CC6   0322
        ANDI    #$00FF, R2                      ; 5CC7   03BA 00FF

        JSR     R5,     L_5E58                  ; 5CC9   0004 015C 0258

        PULR    R2                              ; 5CCC   02B2
        BC      L_5CDF                          ; 5CCD   0201 0010

        PSHR    R2                              ; 5CCF   0272
        XORI    #$0008, R3                      ; 5CD0   03FB 0008

        JSR     R5,     L_5E25                  ; 5CD2   0004 015C 0225

        MVII    #$00FB, R0                      ; 5CD5   02B8 00FB
        BC      L_5CDB                          ; 5CD7   0201 0002

        SUBI    #$0005, R0                      ; 5CD9   0338 0005

L_5CDB:
        JSR     R5,     L_5BDC                  ; 5CDB   0004 0158 03DC

        PULR    R2                              ; 5CDE   02B2
L_5CDF:
        MOVR    R1,     R3                      ; 5CDF   008B
        ADDI    #$0082, R3                      ; 5CE0   02FB 0082
        MVI@    R3,     R3                      ; 5CE2   029B

        JSR     R5,     L_5E4E                  ; 5CE3   0004 015C 024E

        BC      L_5D06                          ; 5CE6   0201 001E

        MVII    #$000F, R0                      ; 5CE8   02B8 000F
        MOVR    R1,     R4                      ; 5CEA   008C
        ADDI    #$0094, R4                      ; 5CEB   02FC 0094
        MVI@    R4,     R5                      ; 5CED   02A5
        CMPI    #$000C, R5                      ; 5CEE   037D 000C
        BNEQ    L_5CF4                          ; 5CF0   020C 0002

        MVII    #$0023, R0                      ; 5CF2   02B8 0023

L_5CF4:
        JSR     R5,     L_5BE3                  ; 5CF4   0004 0158 03E3

        MOVR    R1,     R2                      ; 5CF7   008A
        ADDI    #$0095, R2                      ; 5CF8   02FA 0095
        MVI@    R2,     R0                      ; 5CFA   0290
        ANDI    #$0070, R0                      ; 5CFB   03B8 0070
        SDBD                                    ; 5CFD   0001
        MVII    #$5F0C, R5                      ; 5CFE   02BD 000C 005F
        ADDR    R3,     R5                      ; 5D01   00DD
        XOR@    R5,     R0                      ; 5D02   03E8

        JSR     R5,     L_5BA0                  ; 5D03   0004 0158 03A0

L_5D06:
        PULR    R7                              ; 5D06   02B7

L_5D07:
        PSHR    R5                              ; 5D07   0275
        MOVR    R1,     R3                      ; 5D08   008B
        ADDI    #$00A7, R3                      ; 5D09   02FB 00A7
        MVI@    R3,     R0                      ; 5D0B   0298
        RRC     R0,     1                       ; 5D0C   0070
        ADD@    R3,     R0                      ; 5D0D   02D8
        MVO@    R0,     R3                      ; 5D0E   0258
        ANDI    #$0003, R0                      ; 5D0F   03B8 0003
        MOVR    R1,     R4                      ; 5D11   008C
        ADDI    #$00A0, R4                      ; 5D12   02FC 00A0
        MVO@    R0,     R4                      ; 5D14   0260
        SWAP    R0,     1                       ; 5D15   0040
        MVO@    R0,     R4                      ; 5D16   0260
        MOVR    R1,     R3                      ; 5D17   008B
        ADDI    #$0101, R3                      ; 5D18   02FB 0101
        MVI@    R3,     R0                      ; 5D1A   0298
        ADDI    #$0020, R3                      ; 5D1B   02FB 0020
        MOVR    R1,     R2                      ; 5D1D   008A
        ADDI    #$0081, R2                      ; 5D1E   02FA 0081
        ADD@    R2,     R3                      ; 5D20   02D3
        CMP@    R3,     R0                      ; 5D21   0358
        BEQ     L_5D45                          ; 5D22   0204 0021

        MVII    #$00E8, R0                      ; 5D24   02B8 00E8

        JSR     R5,     L_5BDC                  ; 5D26   0004 0158 03DC

        MOVR    R1,     R3                      ; 5D29   008B
        ADDI    #$0100, R3                      ; 5D2A   02FB 0100
        MVI@    R3,     R0                      ; 5D2C   0298
        MOVR    R1,     R3                      ; 5D2D   008B
        ADDI    #$0111, R3                      ; 5D2E   02FB 0111
        ADD@    R2,     R3                      ; 5D30   02D3
        CMP@    R3,     R0                      ; 5D31   0358
        BNEQ    L_5D45                          ; 5D32   020C 0011

        MOVR    R1,     R3                      ; 5D34   008B
        ADDI    #$00F0, R3                      ; 5D35   02FB 00F0
        MOVR    R1,     R4                      ; 5D37   008C
        ADDI    #$029F, R4                      ; 5D38   02FC 029F
        ADD@    R3,     R4                      ; 5D3A   02DC
        MVII    #$0006, R0                      ; 5D3B   02B8 0006
        CMP@    R4,     R0                      ; 5D3D   0360
        BEQ     L_5D45                          ; 5D3E   0204 0005

        MVII    #$00E4, R0                      ; 5D40   02B8 00E4

        JSR     R5,     L_5BDC                  ; 5D42   0004 0158 03DC

L_5D45:
        MOVR    R1,     R3                      ; 5D45   008B
        ADDI    #$0102, R3                      ; 5D46   02FB 0102
        MVI@    R3,     R0                      ; 5D48   0298
        RSWD    R0                              ; 5D49   0038
        BNOV    L_5D5B                          ; 5D4A   020A 000F

        ANDI    #$0007, R0                      ; 5D4C   03B8 0007
        CMPI    #$0003, R0                      ; 5D4E   0378 0003
        BNEQ    L_5DA6                          ; 5D50   020C 0054

        MVI@    R2,     R0                      ; 5D52   0290
        CMPI    #$0020, R0                      ; 5D53   0378 0020
        BC      L_5DE7                          ; 5D55   0201 0090

        MVII    #$0040, R0                      ; 5D57   02B8 0040
        B       L_5DE4                          ; 5D59   0200 0089

L_5D5B:
        MOVR    R1,     R3                      ; 5D5B   008B
        ADDI    #$0094, R3                      ; 5D5C   02FB 0094
        MVI@    R3,     R0                      ; 5D5E   0298
        CMPI    #$0007, R0                      ; 5D5F   0378 0007
        BC      L_5DA6                          ; 5D61   0201 0043

        MOVR    R1,     R3                      ; 5D63   008B
        ADDI    #$0102, R3                      ; 5D64   02FB 0102
        MVI@    R3,     R0                      ; 5D66   0298
        ANDI    #$0003, R0                      ; 5D67   03B8 0003
        BEQ     L_5D6F                          ; 5D69   0204 0004

        MVII    #$0014, R0                      ; 5D6B   02B8 0014
        B       L_5DA3                          ; 5D6D   0200 0034

L_5D6F:
        MVI@    R3,     R0                      ; 5D6F   0298
        ANDI    #$000C, R0                      ; 5D70   03B8 000C
        BNEQ    L_5D81                          ; 5D72   020C 000D

        MOVR    R1,     R3                      ; 5D74   008B
        ADDI    #$00F0, R3                      ; 5D75   02FB 00F0
        MVI@    R3,     R0                      ; 5D77   0298
        ANDI    #$003F, R0                      ; 5D78   03B8 003F
        DECR    R0                              ; 5D7A   0010
        BNEQ    L_5DA6                          ; 5D7B   020C 0029

        MVII    #$00DC, R0                      ; 5D7D   02B8 00DC
        B       L_5DA3                          ; 5D7F   0200 0022

L_5D81:
        MOVR    R1,     R3                      ; 5D81   008B
        ADDI    #$0082, R3                      ; 5D82   02FB 0082
        MVI@    R3,     R0                      ; 5D84   0298
        TSTR    R0                              ; 5D85   0080
        BEQ     L_5D89                          ; 5D86   0204 0001

        DECR    R0                              ; 5D88   0010
L_5D89:
        SDBD                                    ; 5D89   0001
        MVII    #$5DFD, R4                      ; 5D8A   02BC 00FD 005D
        B       L_5D91                          ; 5D8D   0200 0002

L_5D8F:
        INCR    R4                              ; 5D8F   000C
L_5D90:
        INCR    R4                              ; 5D90   000C
L_5D91:
        MVI@    R4,     R2                      ; 5D91   02A2
        CMPI    #$00FF, R2                      ; 5D92   037A 00FF
        BEQ     L_5DA6                          ; 5D94   0204 0010

        XORR    R0,     R2                      ; 5D96   01C2
        MOVR    R1,     R5                      ; 5D97   008D
        ADDI    #$0100, R5                      ; 5D98   02FD 0100
        CMP@    R5,     R2                      ; 5D9A   036A
        BNEQ    L_5D8F                          ; 5D9B   022C 000D

        MVI@    R4,     R2                      ; 5D9D   02A2
        XORR    R0,     R2                      ; 5D9E   01C2
        CMP@    R5,     R2                      ; 5D9F   036A
        BNEQ    L_5D90                          ; 5DA0   022C 0011

        MVI@    R4,     R0                      ; 5DA2   02A0

L_5DA3:
        JSR     R5,     L_5BDC                  ; 5DA3   0004 0158 03DC

L_5DA6:
        MOVR    R1,     R3                      ; 5DA6   008B
        ADDI    #$0102, R3                      ; 5DA7   02FB 0102
        MVI@    R3,     R0                      ; 5DA9   0298
        ANDI    #$0040, R0                      ; 5DAA   03B8 0040
        BEQ     L_5DBB                          ; 5DAC   0204 000D

        JSR     R5,     L_62B8                  ; 5DAE   0004 0160 02B8

        MOVR    R1,     R3                      ; 5DB1   008B
        ADDI    #$0101, R3                      ; 5DB2   02FB 0101
        MVI@    R3,     R0                      ; 5DB4   0298

        JSR     R5,     L_5BEE                  ; 5DB5   0004 0158 03EE
        JSR     R5,     L_62B8                  ; 5DB8   0004 0160 02B8

L_5DBB:
        MOVR    R1,     R4                      ; 5DBB   008C
        ADDI    #$00A0, R4                      ; 5DBC   02FC 00A0
        SDBD                                    ; 5DBE   0001
        MVI@    R4,     R0                      ; 5DBF   02A0
        PSHR    R0                              ; 5DC0   0270
        SUBI    #$0002, R4                      ; 5DC1   033C 0002
        CLRR    R0                              ; 5DC3   01C0
        MVO@    R0,     R4                      ; 5DC4   0260
        MVO@    R0,     R4                      ; 5DC5   0260
        MOVR    R1,     R3                      ; 5DC6   008B
        ADDI    #$0100, R3                      ; 5DC7   02FB 0100
        MVI@    R3,     R0                      ; 5DC9   0298

        JSR     R5,     L_5BEE                  ; 5DCA   0004 0158 03EE

        MOVR    R1,     R4                      ; 5DCD   008C
        ADDI    #$00A0, R4                      ; 5DCE   02FC 00A0
        MOVR    R4,     R5                      ; 5DD0   00A5
        SDBD                                    ; 5DD1   0001
        MVI@    R4,     R0                      ; 5DD2   02A0
        NEGR    R0                              ; 5DD3   0020
        ADD@    R6,     R0                      ; 5DD4   02F0
        MVO@    R0,     R5                      ; 5DD5   0268
        SWAP    R0,     1                       ; 5DD6   0040
        MVO@    R0,     R5                      ; 5DD7   0268

        JSR     R5,     L_68B5                  ; 5DD8   0004 0168 00B5

        MOVR    R1,     R3                      ; 5DDB   008B
        ADDI    #$0101, R3                      ; 5DDC   02FB 0101
        MVI@    R3,     R0                      ; 5DDE   0298

        JSR     R5,     L_5BEE                  ; 5DDF   0004 0158 03EE

        B       L_5DEA                          ; 5DE2   0200 0006

L_5DE4:
        JSR     R5,     L_5BE3                  ; 5DE4   0004 0158 03E3
L_5DE7:
        JSR     R5,     L_68B5                  ; 5DE7   0004 0168 00B5

L_5DEA:
        MOVR    R1,     R3                      ; 5DEA   008B
        ADDI    #$0082, R3                      ; 5DEB   02FB 0082
        MVI@    R3,     R2                      ; 5DED   029A
        MOVR    R1,     R4                      ; 5DEE   008C
        ADDI    #$00A0, R4                      ; 5DEF   02FC 00A0
        MOVR    R4,     R5                      ; 5DF1   00A5
        SDBD                                    ; 5DF2   0001
        MVI@    R4,     R0                      ; 5DF3   02A0
        TSTR    R2                              ; 5DF4   0092
        BEQ     L_5DFC                          ; 5DF5   0204 0005

        NEGR    R0                              ; 5DF7   0020
        MVO@    R0,     R5                      ; 5DF8   0268
        SWAP    R0,     1                       ; 5DF9   0040
        MVO@    R0,     R5                      ; 5DFA   0268
        SWAP    R0,     1                       ; 5DFB   0040
L_5DFC:
        PULR    R7                              ; 5DFC   02B7

        DECLE   $0041,  $0043,  $000C,  $0031   ; 5DFD   0041 0043 000C 0031
        DECLE   $0033,  $0020,  $0041,  $0042   ; 5E01   0033 0020 0041 0042
        DECLE   $00F9,  $0031,  $0032,  $0018   ; 5E05   00F9 0031 0032 0018
        DECLE   $0042,  $0043,  $000A,  $0032   ; 5E09   0042 0043 000A 0032
        DECLE   $0033,  $000A,  $0043,  $0034   ; 5E0D   0033 000A 0043 0034
        DECLE   $000A,  $0023,  $0034,  $000A   ; 5E11   000A 0023 0034 000A
        DECLE   $0021,  $0022,  $0006,  $0071   ; 5E15   0021 0022 0006 0071
        DECLE   $0073,  $00F6,  $0072,  $0073   ; 5E19   0073 00F6 0072 0073
        DECLE   $00F6,  $0061,  $0063,  $00F6   ; 5E1D   00F6 0061 0063 00F6
        DECLE   $0062,  $0063,  $00F6,  $00FF   ; 5E21   0062 0063 00F6 00FF
L_5E25:
        PSHR    R5                              ; 5E25   0275
L_5E26:
        SDBD                                    ; 5E26   0001
        MVII    #$5F0E, R4                      ; 5E27   02BC 000E 005F
        ADDR    R3,     R4                      ; 5E2A   00DC
        ADD@    R4,     R2                      ; 5E2B   02E2
        ANDI    #$00FF, R2                      ; 5E2C   03BA 00FF
        MOVR    R2,     R0                      ; 5E2E   0090
        ANDI    #$0088, R0                      ; 5E2F   03B8 0088
        BNEQ    L_5E4C                          ; 5E31   020C 0019

        MOVR    R2,     R5                      ; 5E33   0095
        ADDR    R1,     R5                      ; 5E34   00CD
        MVI@    R5,     R4                      ; 5E35   02AC
        TSTR    R4                              ; 5E36   00A4
        BEQ     L_5E26                          ; 5E37   0224 0012

        ADDI    #$029F, R4                      ; 5E39   02FC 029F
        ADDR    R1,     R4                      ; 5E3B   00CC
        MVI@    R4,     R0                      ; 5E3C   02A0
        CMPI    #$0006, R0                      ; 5E3D   0378 0006
        BNEQ    L_5E26                          ; 5E3F   022C 001A

        ANDI    #$0040, R4                      ; 5E41   03BC 0040
        SLL     R3,     2                       ; 5E43   004F
        SLL     R3,     1                       ; 5E44   004B
        XORR    R3,     R4                      ; 5E45   01DC
        SLR     R3,     1                       ; 5E46   0063
        SLR     R3,     2                       ; 5E47   0067
        XORI    #$0080, R4                      ; 5E48   03FC 0080
        RSWD    R4                              ; 5E4A   003C
        PULR    R7                              ; 5E4B   02B7

L_5E4C:
        SETC                                    ; 5E4C   0007
        PULR    R7                              ; 5E4D   02B7

L_5E4E:
        PSHR    R5                              ; 5E4E   0275
        PSHR    R2                              ; 5E4F   0272

        JSR     R5,     L_5E25                  ; 5E50   0004 015C 0225

        PULR    R2                              ; 5E53   02B2
        BC      L_5E61                          ; 5E54   0201 000B

        SETC                                    ; 5E56   0007
        PULR    R7                              ; 5E57   02B7

L_5E58:
        SDBD                                    ; 5E58   0001
        MVII    #$5F0E, R4                      ; 5E59   02BC 000E 005F
        ADDR    R3,     R4                      ; 5E5C   00DC
        SUB@    R4,     R2                      ; 5E5D   0322
        ANDI    #$00FF, R2                      ; 5E5E   03BA 00FF
        PSHR    R5                              ; 5E60   0275
L_5E61:
        PSHR    R2                              ; 5E61   0272
        ADDI    #$0010, R2                      ; 5E62   02FA 0010

L_5E64:
        JSR     R5,     L_5E25                  ; 5E64   0004 015C 0225

        BC      L_5E6D                          ; 5E67   0201 0004
        BNEQ    L_5E64                          ; 5E69   022C 0006
        B       L_5E78                          ; 5E6B   0200 000B

L_5E6D:
        PULR    R2                              ; 5E6D   02B2
        PSHR    R2                              ; 5E6E   0272
        SUBI    #$0010, R2                      ; 5E6F   033A 0010

L_5E71:
        JSR     R5,     L_5E25                  ; 5E71   0004 015C 0225

        BC      L_5E7B                          ; 5E74   0201 0005
        BNEQ    L_5E71                          ; 5E76   022C 0006

L_5E78:
        SETC                                    ; 5E78   0007
        B       L_5E7C                          ; 5E79   0200 0001

L_5E7B:
        CLRC                                    ; 5E7B   0006
L_5E7C:
        PULR    R2                              ; 5E7C   02B2
        PULR    R7                              ; 5E7D   02B7

        DECLE   $0002,  $0004,  $0001,  $0003   ; 5E7E   0002 0004 0001 0003
        DECLE   $0005,  $0001,  $0004,  $0002   ; 5E82   0005 0001 0004 0002
        DECLE   $0000,  $0040,  $0070,  $0050   ; 5E86   0000 0040 0070 0050
        DECLE   $0070,  $0060,  $0040,  $0001   ; 5E8A   0070 0060 0040 0001
        DECLE   $0006,  $0010,  $0077,  $0057   ; 5E8E   0006 0010 0077 0057
        DECLE   $0077,  $0067,  $0047,  $0001   ; 5E92   0077 0067 0047 0001
        DECLE   $0001,  $0080,  $0000,  $0030   ; 5E96   0001 0080 0000 0030
        DECLE   $0000,  $0020,  $0040,  $0002   ; 5E9A   0000 0020 0040 0002
        DECLE   $0010,  $0020,  $0007,  $0037   ; 5E9E   0010 0020 0007 0037
        DECLE   $0007,  $0027                   ; 5EA2   0007 0027

        SWAP    R3,     2                       ; 5EA4   0047
        EIS                                     ; 5EA5   0002
L_5EA6:
        DECR    R7                              ; 5EA6   0017

        DECLE   $0005                           ; 5EA7   0005

        INCR    R6                              ; 5EA8   000E
        INCR    R2                              ; 5EA9   000A
        DECR    R3                              ; 5EAA   0013
        INCR    R2                              ; 5EAB   000A
        DECR    R1                              ; 5EAC   0011
        INCR    R7                              ; 5EAD   000F
        ADDR    R5,     R7                      ; 5EAE   00EF

L_5EAF:
        ADDR    R6,     R1                      ; 5EAF   00F1
        DECLE   $0000                           ; 5EB0   0000

        DECR    R1                              ; 5EB1   0011
        INCR    R7                              ; 5EB2   000F
        ADDR    R5,     R7                      ; 5EB3   00EF

L_5EB4:
        ADDR    R6,     R1                      ; 5EB4   00F1
        DECLE   $0001,  $0010,  $00FF,  $00F0   ; 5EB5   0001 0010 00FF 00F0
        DECLE   $0000,  $00F2,  $00E1,  $0012   ; 5EB9   0000 00F2 00E1 0012
        DECLE   $0021,  $001F                   ; 5EBD   0021 001F

        INCR    R6                              ; 5EBF   000E
        ADDR    R3,     R7                      ; 5EC0   00DF

        DECLE   $00EE,  $0000,  $0003,  $0000   ; 5EC1   00EE 0000 0003 0000
        DECLE   $0001,  $0004,  $0002,  $000B   ; 5EC5   0001 0004 0002 000B
        DECLE   $0013,  $0028,  $000B,  $0000   ; 5EC9   0013 0028 000B 0000
        DECLE   $0000,  $0000,  $0000,  $00F5   ; 5ECD   0000 0000 0000 00F5
        DECLE   $00ED,  $00D8,  $00F5,  $0000   ; 5ED1   00ED 00D8 00F5 0000
        DECLE   $00F0,  $00E8,  $00D3,  $00F0   ; 5ED5   00F0 00E8 00D3 00F0
        DECLE   $0000,  $00FB,  $0000,  $0000   ; 5ED9   0000 00FB 0000 0000
        DECLE   $0010,  $0018,  $002D,  $0010   ; 5EDD   0010 0018 002D 0010
        DECLE   $0000,  $0005                   ; 5EE1   0000 0005

        MOVR    R0,     R3                      ; 5EE3   0083
        MOVR    R3,     R0                      ; 5EE4   0098
        GSWD    R3                              ; 5EE5   0033
        SWAP    R1,     1                       ; 5EE6   0041
        CMP@    R5,     R3                      ; 5EE7   036B
        CMP@    R6,     R1                      ; 5EE8   0371
        SLL     R0,     1                       ; 5EE9   0048
        SLLC    R0,     1                       ; 5EEA   0058
        SLLC    R3,     2                       ; 5EEB   005F
        RRC     R2,     2                       ; 5EEC   0076
        ADD@    R6,     R1                      ; 5EED   02F1
        ADD@    R3,     R7                      ; 5EEE   02DF

        GSWD    R0                              ; 5EEF   0030
        MOVR    R0,     R3                      ; 5EF0   0083
        MOVR    R3,     R0                      ; 5EF1   0098
        GSWD    R3                              ; 5EF2   0033
        SWAP    R1,     1                       ; 5EF3   0041
        CMP@    R5,     R3                      ; 5EF4   036B
        CMP@    R6,     R1                      ; 5EF5   0371
        XOR@    R3,     R4                      ; 5EF6   03DC
        XOR@    R3,     R2                      ; 5EF7   03DA
        ANDI    #$03BE, R4                      ; 5EF8   03BC 03BE
        SLL     R0,     1                       ; 5EFA   0048
        SLLC    R0,     1                       ; 5EFB   0058
        GSWD    R0                              ; 5EFC   0030
        MOVR    R0,     R3                      ; 5EFD   0083
        MOVR    R3,     R0                      ; 5EFE   0098
        GSWD    R3                              ; 5EFF   0033
        SWAP    R1,     1                       ; 5F00   0041
        XOR     G_03CD, R0                      ; 5F01   03C0 03CD
        XOR@    R3,     R4                      ; 5F03   03DC
        XOR@    R3,     R2                      ; 5F04   03DA
        ANDI    #$03BE, R4                      ; 5F05   03BC 03BE
        GSWD    R0                              ; 5F07   0030
        ADDR    R5,     R7                      ; 5F08   00EF
        INCR    R7                              ; 5F09   000F

        DECLE   $00FF                           ; 5F0A   00FF
L_5F0B:
        ADDR    R7,     R6                      ; 5F0B   00FE
        DECLE   $0007,  $0003,  $0001,  $0001   ; 5F0C   0007 0003 0001 0001
        DECLE   $00F1,  $0011,  $0001,  $0002   ; 5F10   00F1 0011 0001 0002
        DECLE   $0000,  $0004,  $00FF,  $0006   ; 5F14   0000 0004 00FF 0006
        DECLE   $0005,  $0002,  $0002,  $000D   ; 5F18   0005 0002 0002 000D
        DECLE   $000A,  $000A,  $0040,  $0070   ; 5F1C   000A 000A 0040 0070
        DECLE   $0000,  $0047,  $0077,  $0007   ; 5F20   0000 0047 0077 0007
        DECLE   $00C0,  $0040,  $0080,  $0030   ; 5F24   00C0 0040 0080 0030
        DECLE   $0010,  $0020,  $0000,  $0001   ; 5F28   0010 0020 0000 0001
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5F2C   0001 0001 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5F30   0001 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F34   0000 0000 0000 0000
        DECLE   $0000                           ; 5F38   0000

        INCR    R7                              ; 5F39   000F

        DECR    R0                              ; 5F3A   0010
L_5F3B:
        DECR    R1                              ; 5F3B   0011
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F40   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F44   0000 0000 0000 0000
        DECLE   $000F,  $0000,  $0010,  $0000   ; 5F48   000F 0000 0010 0000
        DECLE   $0011,  $0000,  $0000,  $0000   ; 5F4C   0011 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000F   ; 5F54   0000 0000 0000 000F
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5F58   0000 0000 0010 0000
        DECLE   $0000,  $0011,  $0000,  $0000   ; 5F5C   0000 0011 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F60   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000F,  $0000   ; 5F64   0000 0000 000F 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5F68   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0011,  $0000   ; 5F6C   0000 0000 0011 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F70   0000 0000 0000 0000
        DECLE   $0000,  $000F,  $0000,  $0000   ; 5F74   0000 000F 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5F78   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0011   ; 5F7C   0000 0000 0000 0011
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F80   0000 0000 0000 0000
        DECLE   $000F,  $0000,  $0000,  $0000   ; 5F84   000F 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5F88   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8C   0000 0000 0000 0000
        DECLE   $0011,  $0000,  $0000,  $000F   ; 5F90   0011 0000 0000 000F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0010,  $0000   ; 5F98   0000 0000 0010 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9C   0000 0000 0000 0000
        DECLE   $0000,  $0011,  $0000,  $0000   ; 5FA0   0000 0011 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0003   ; 5FA8   0000 0000 0004 0003
        DECLE   $0001,  $00FE,  $00FD,  $00FC   ; 5FAC   0001 00FE 00FD 00FC
        DECLE   $00FB,  $00FA,  $0005,  $0003   ; 5FB0   00FB 00FA 0005 0003
        DECLE   $0000,  $00FD,  $00FC,  $00FB   ; 5FB4   0000 00FD 00FC 00FB
        DECLE   $00FA,  $00F9,  $0002,  $0000   ; 5FB8   00FA 00F9 0002 0000
        DECLE   $00FE,  $0003,  $00FF,  $0001   ; 5FBC   00FE 0003 00FF 0001
        DECLE   $0002,  $0000,  $0001,  $0003   ; 5FC0   0002 0000 0001 0003
        DECLE   $00FF,  $0000,  $0001,  $0000   ; 5FC4   00FF 0000 0001 0000
        DECLE   $0003,  $0003,  $0003,  $0008   ; 5FC8   0003 0003 0003 0008
        DECLE   $0001,  $0000,  $0002,  $0001   ; 5FCC   0001 0000 0002 0001
        DECLE   $0008,  $0004,  $0032,  $0042   ; 5FD0   0008 0004 0032 0042
        DECLE   $0041,  $0050,  $0034,  $0000   ; 5FD4   0041 0050 0034 0000
        DECLE   $00F0,  $0031,  $0035,  $0045   ; 5FD8   00F0 0031 0035 0045
        DECLE   $0046,  $0057,  $0033,  $0007   ; 5FDC   0046 0057 0033 0007
        DECLE   $0010,  $0036,  $0000,  $0000   ; 5FE0   0010 0036 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
L_6000:
        MVII    #$00D0, R1                      ; 6000   02B9 00D0
        SWAP    R1,     1                       ; 6002   0041
        MOVR    R1,     R4                      ; 6003   008C
        ADDI    #$011E, R4                      ; 6004   02FC 011E
        CLRR    R0                              ; 6006   01C0
        INCR    R0                              ; 6007   0008
        MVO@    R0,     R4                      ; 6008   0260
L_6009:
        PSHR    R5                              ; 6009   0275

        JSR     R5,     L_62C7                  ; 600A   0004 0160 02C7

        PULR    R5                              ; 600D   02B5
L_600E:
        PSHR    R5                              ; 600E   0275

        JSR     R5,     L_6202                  ; 600F   0004 0160 0202

        BC      L_6174                          ; 6012   0201 0160

        MOVR    R1,     R4                      ; 6014   008C
        ADDI    #$011E, R4                      ; 6015   02FC 011E
        MVI@    R4,     R0                      ; 6017   02A0
        PSHR    R0                              ; 6018   0270
        ADDI    #$0300, R1                      ; 6019   02F9 0300

        JSR     R5,     L_629D                  ; 601B   0004 0160 029D

        SUBI    #$0200, R1                      ; 601E   0339 0200

        JSR     R5,     L_629D                  ; 6020   0004 0160 029D

        SUBI    #$0100, R1                      ; 6023   0339 0100

        JSR     R5,     L_615B                  ; 6025   0004 0160 015B

        MOVR    R1,     R4                      ; 6028   008C
        ADDI    #$011E, R4                      ; 6029   02FC 011E
        PULR    R0                              ; 602B   02B0
        MVO@    R0,     R4                      ; 602C   0260
        PULR    R7                              ; 602D   02B7

        CLRR    R0                              ; 602E   01C0
        MVII    #$00D0, R1                      ; 602F   02B9 00D0
        SWAP    R1,     1                       ; 6031   0041
        MOVR    R1,     R4                      ; 6032   008C
        ADDI    #$0080, R4                      ; 6033   02FC 0080
        MVO@    R0,     R4                      ; 6035   0260
        MVO@    R0,     R4                      ; 6036   0260
        MOVR    R5,     R7                      ; 6037   00AF

L_6038:
        PSHR    R5                              ; 6038   0275

        JSR     R5,     L_6202                  ; 6039   0004 0160 0202

        BC      L_6174                          ; 603C   0201 0136

        JSR     R5,     L_621F                  ; 603E   0004 0160 021F

        BC      L_6174                          ; 6041   0201 0131

        PULR    R5                              ; 6043   02B5
L_6044:
        PSHR    R5                              ; 6044   0275

        JSR     R5,     L_6202                  ; 6045   0004 0160 0202

        BC      L_6174                          ; 6048   0201 012A

        MOVR    R1,     R3                      ; 604A   008B
        ADDI    #$00FC, R3                      ; 604B   02FB 00FC
        MVI@    R3,     R0                      ; 604D   0298
        ANDI    #$0020, R0                      ; 604E   03B8 0020
        MVII    #$0000, R0                      ; 6050   02B8 0000
        BEQ     L_6057                          ; 6052   0204 0003

        MVI@    R3,     R0                      ; 6054   0298
        ANDI    #$0027, R0                      ; 6055   03B8 0027
L_6057:
        MVO@    R0,     R3                      ; 6057   0258
        MOVR    R1,     R4                      ; 6058   008C
        ADDI    #$0084, R4                      ; 6059   02FC 0084
        MOVR    R1,     R5                      ; 605B   008D
        ADDI    #$00FA, R5                      ; 605C   02FD 00FA
        MVII    #$0003, R3                      ; 605E   02BB 0003
L_6060:
        MVI@    R5,     R0                      ; 6060   02A8
        MVO@    R0,     R4                      ; 6061   0260
        DECR    R3                              ; 6062   0013
        BNEQ    L_6060                          ; 6063   022C 0004

        JSR     R5,     L_6108                  ; 6065   0004 0160 0108

L_6068:
        BC      L_6174                          ; 6068   0201 010A

        MOVR    R1,     R4                      ; 606A   008C
        ADDI    #$00FB, R4                      ; 606B   02FC 00FB
        MOVR    R1,     R5                      ; 606D   008D
        ADDI    #$0085, R5                      ; 606E   02FD 0085
        MVI@    R4,     R0                      ; 6070   02A0
        CMP@    R5,     R0                      ; 6071   0368
        BNEQ    L_607D                          ; 6072   020C 0009

        MVI@    R5,     R0                      ; 6074   02A8
        TSTR    R0                              ; 6075   0080
        BEQ     L_6082                          ; 6076   0204 000A

        XOR@    R4,     R0                      ; 6078   03E0
        ANDI    #$0027, R0                      ; 6079   03B8 0027
        BEQ     L_6082                          ; 607B   0204 0005

L_607D:
        JSR     R5,     L_612F                  ; 607D   0004 0160 012F

        B       L_6068                          ; 6080   0220 0019

L_6082:
        CLRC                                    ; 6082   0006
        PULR    R7                              ; 6083   02B7

L_6084:
        PSHR    R5                              ; 6084   0275
        MVII    #$00D0, R1                      ; 6085   02B9 00D0
        SWAP    R1,     1                       ; 6087   0041
        MOVR    R1,     R3                      ; 6088   008B
        ADDI    #$0309, R3                      ; 6089   02FB 0309
        SUB@    R3,     R0                      ; 608B   0318
        NEGR    R0                              ; 608C   0020
        BMI     L_6173                          ; 608D   020B 00E4

        MVI@    R3,     R2                      ; 608F   029A
        CLRR    R4                              ; 6090   01E4
        MVO@    R4,     R3                      ; 6091   025C
        INCR    R3                              ; 6092   000B
        MVO@    R0,     R3                      ; 6093   0258
        SARC    R2,     1                       ; 6094   007A
        BNC     L_60A2                          ; 6095   0209 000B

        JSR     R5,     L_62B8                  ; 6097   0004 0160 02B8

        MOVR    R1,     R3                      ; 609A   008B
        ADDI    #$0082, R3                      ; 609B   02FB 0082
        MOVR    R1,     R4                      ; 609D   008C
        ADDI    #$00FD, R4                      ; 609E   02FC 00FD
        MVI@    R3,     R0                      ; 60A0   0298
        MVO@    R0,     R4                      ; 60A1   0260

L_60A2:
        JSR     R5,     L_614D                  ; 60A2   0004 0160 014D
        JSR     R5,     L_65C2                  ; 60A5   0004 0164 01C2

L_60A8:
        MOVR    R1,     R3                      ; 60A8   008B
        ADDI    #$0309, R3                      ; 60A9   02FB 0309
        MVI@    R3,     R0                      ; 60AB   0298
        INCR    R3                              ; 60AC   000B
        CMP@    R3,     R0                      ; 60AD   0358
        BEQ     L_60B7                          ; 60AE   0204 0007

        JSR     R5,     L_60B9                  ; 60B0   0004 0160 00B9

        BC      L_6174                          ; 60B3   0201 00BF
        B       L_60A8                          ; 60B5   0220 000E

L_60B7:
        CLRC                                    ; 60B7   0006
        PULR    R7                              ; 60B8   02B7

L_60B9:
        PSHR    R5                              ; 60B9   0275

        JSR     R5,     L_6202                  ; 60BA   0004 0160 0202

        BC      L_6174                          ; 60BD   0201 00B5

        MOVR    R1,     R3                      ; 60BF   008B
        ADDI    #$0309, R3                      ; 60C0   02FB 0309
        MVI@    R3,     R0                      ; 60C2   0298
        MOVR    R1,     R3                      ; 60C3   008B
        ADDI    #$030B, R3                      ; 60C4   02FB 030B
        CMP@    R3,     R0                      ; 60C6   0358
        BC      L_6174                          ; 60C7   0201 00AB

        JSR     R5,     L_6175                  ; 60C9   0004 0160 0175

        BC      L_6174                          ; 60CC   0201 00A6

        PULR    R5                              ; 60CE   02B5
L_60CF:
        PSHR    R5                              ; 60CF   0275

        JSR     R5,     L_68B5                  ; 60D0   0004 0168 00B5
        JSR     R5,     L_62B8                  ; 60D3   0004 0160 02B8
        JSR     R5,     L_666C                  ; 60D6   0004 0164 026C

        MOVR    R1,     R4                      ; 60D9   008C
        ADDI    #$0120, R4                      ; 60DA   02FC 0120
        MVII    #$0010, R0                      ; 60DC   02B8 0010
        NEGR    R0                              ; 60DE   0020

        JSR     R5,     L_6A10                  ; 60DF   0004 0168 0210

        MOVR    R1,     R4                      ; 60E2   008C
        ADDI    #$0100, R4                      ; 60E3   02FC 0100
        MVII    #$0020, R0                      ; 60E5   02B8 0020

        JSR     R5,     L_6A10                  ; 60E7   0004 0168 0210

        CLRR    R5                              ; 60EA   01ED
        MOVR    R1,     R2                      ; 60EB   008A
        ADDI    #$00A4, R2                      ; 60EC   02FA 00A4
        MOVR    R1,     R3                      ; 60EE   008B
        ADDI    #$0102, R3                      ; 60EF   02FB 0102
        MVII    #$007C, R0                      ; 60F1   02B8 007C
        AND@    R3,     R0                      ; 60F3   0398
        BNEQ    L_60F8                          ; 60F4   020C 0002

        MVI@    R2,     R5                      ; 60F6   0295
        INCR    R5                              ; 60F7   000D
L_60F8:
        MVO@    R5,     R2                      ; 60F8   0255
        MOVR    R1,     R3                      ; 60F9   008B
        ADDI    #$0082, R3                      ; 60FA   02FB 0082
        MOVR    R1,     R4                      ; 60FC   008C
        ADDI    #$00FD, R4                      ; 60FD   02FC 00FD
        MVI@    R3,     R0                      ; 60FF   0298
        MVO@    R0,     R4                      ; 6100   0260
        MOVR    R1,     R3                      ; 6101   008B
        ADDI    #$0309, R3                      ; 6102   02FB 0309
        MVI@    R3,     R0                      ; 6104   0298
        INCR    R0                              ; 6105   0008
        MVO@    R0,     R3                      ; 6106   0258
        PULR    R7                              ; 6107   02B7

L_6108:
        PSHR    R5                              ; 6108   0275

        JSR     R5,     L_6B34                  ; 6109   0004 0168 0334
L_610C:
        JSR     R5,     L_5404                  ; 610C   0004 0154 0004

        BC      L_6174                          ; 610F   0201 0063

        JSR     R5,     L_6B41                  ; 6111   0004 0168 0341
        JSR     R5,     L_6191                  ; 6114   0004 0160 0191

        BC      L_610C                          ; 6117   0221 000C

        MOVR    R1,     R3                      ; 6119   008B
        ADDI    #$00FA, R3                      ; 611A   02FB 00FA
        MVI@    R3,     R0                      ; 611C   0298
        MOVR    R1,     R3                      ; 611D   008B
        ADDI    #$0100, R3                      ; 611E   02FB 0100
        CMP@    R3,     R0                      ; 6120   0358
        BNEQ    L_610C                          ; 6121   022C 0016

        MOVR    R1,     R4                      ; 6123   008C
        ADDI    #$0101, R4                      ; 6124   02FC 0101
        MOVR    R1,     R5                      ; 6126   008D
        ADDI    #$00FB, R5                      ; 6127   02FD 00FB
        MVI@    R4,     R0                      ; 6129   02A0
        MVO@    R0,     R5                      ; 612A   0268
        MVI@    R4,     R0                      ; 612B   02A0
        MVO@    R0,     R5                      ; 612C   0268
        CLRC                                    ; 612D   0006
        PULR    R7                              ; 612E   02B7

L_612F:
        PSHR    R5                              ; 612F   0275
        MVII    #$00D0, R1                      ; 6130   02B9 00D0
        SWAP    R1,     1                       ; 6132   0041
        B       L_610C                          ; 6133   0220 0028

L_6135:
        PSHR    R5                              ; 6135   0275

        JSR     R5,     L_6202                  ; 6136   0004 0160 0202

        BC      L_6174                          ; 6139   0201 0039

        JSR     R5,     L_60CF                  ; 613B   0004 0160 00CF

        MOVR    R1,     R3                      ; 613E   008B
        ADDI    #$030B, R3                      ; 613F   02FB 030B
        MVO@    R0,     R3                      ; 6141   0258
        MOVR    R1,     R3                      ; 6142   008B
        ADDI    #$037F, R3                      ; 6143   02FB 037F
        ADDR    R0,     R3                      ; 6145   00C3
        MOVR    R1,     R4                      ; 6146   008C
        ADDI    #$030C, R4                      ; 6147   02FC 030C
        MVI@    R4,     R0                      ; 6149   02A0
        MVO@    R0,     R3                      ; 614A   0258
        CLRC                                    ; 614B   0006
        PULR    R7                              ; 614C   02B7

L_614D:
        PSHR    R5                              ; 614D   0275
        MOVR    R1,     R3                      ; 614E   008B
        ADDI    #$011F, R3                      ; 614F   02FB 011F
        CLRR    R0                              ; 6151   01C0
        MVO@    R0,     R3                      ; 6152   0258
        MOVR    R1,     R4                      ; 6153   008C
        ADDI    #$0008, R4                      ; 6154   02FC 0008
        MOVR    R1,     R5                      ; 6156   008D
        ADDI    #$0300, R5                      ; 6157   02FD 0300
        B       L_6162                          ; 6159   0200 0007

L_615B:
        PSHR    R5                              ; 615B   0275
        MOVR    R1,     R5                      ; 615C   008D
        ADDI    #$0008, R5                      ; 615D   02FD 0008
        MOVR    R1,     R4                      ; 615F   008C
        ADDI    #$0300, R4                      ; 6160   02FC 0300
L_6162:
        MVII    #$0078, R3                      ; 6162   02BB 0078
L_6164:
        DECR    R3                              ; 6164   0013
        BMI     L_6174                          ; 6165   020B 000D

        ANDI    #$0077, R3                      ; 6167   03BB 0077
        PSHR    R4                              ; 6169   0274
        PSHR    R5                              ; 616A   0275
        ADDR    R3,     R4                      ; 616B   00DC
        ADDR    R3,     R5                      ; 616C   00DD
        MVI@    R5,     R0                      ; 616D   02A8
        MVO@    R0,     R4                      ; 616E   0260
        PULR    R5                              ; 616F   02B5
        PULR    R4                              ; 6170   02B4
        B       L_6164                          ; 6171   0220 000E

L_6173:
        SETC                                    ; 6173   0007
L_6174:
        PULR    R7                              ; 6174   02B7

L_6175:
        PSHR    R5                              ; 6175   0275

        JSR     R5,     L_6B34                  ; 6176   0004 0168 0334
L_6179:
        JSR     R5,     L_5404                  ; 6179   0004 0154 0004

        BC      L_6190                          ; 617C   0201 0012

        JSR     R5,     L_6B41                  ; 617E   0004 0168 0341

        MOVR    R1,     R2                      ; 6181   008A
        ADDI    #$0380, R2                      ; 6182   02FA 0380
        MOVR    R1,     R3                      ; 6184   008B
        ADDI    #$0309, R3                      ; 6185   02FB 0309
        ADD@    R3,     R2                      ; 6187   02DA
        MVI@    R2,     R0                      ; 6188   0290
        MOVR    R1,     R3                      ; 6189   008B
        ADDI    #$030C, R3                      ; 618A   02FB 030C
        CMP@    R3,     R0                      ; 618C   0358
        BNEQ    L_6179                          ; 618D   022C 0015

        CLRC                                    ; 618F   0006
L_6190:
        PULR    R7                              ; 6190   02B7

L_6191:
        PSHR    R5                              ; 6191   0275

        JSR     R5,     L_68B5                  ; 6192   0004 0168 00B5
        JSR     R5,     L_55D3                  ; 6195   0004 0154 01D3

        MVII    #$0000, R0                      ; 6198   02B8 0000
        ADCR    R0                              ; 619A   0028
        PSHR    R0                              ; 619B   0270

        JSR     R5,     L_68F2                  ; 619C   0004 0168 00F2

        PULR    R0                              ; 619F   02B0
        TSTR    R0                              ; 61A0   0080
        BEQ     L_61A5                          ; 61A1   0204 0002

        CLRC                                    ; 61A3   0006
        PULR    R7                              ; 61A4   02B7

L_61A5:
        SETC                                    ; 61A5   0007
        PULR    R7                              ; 61A6   02B7

L_61A7:
        PSHR    R5                              ; 61A7   0275
        MVII    #$00D0, R1                      ; 61A8   02B9 00D0
        SWAP    R1,     1                       ; 61AA   0041
        MOVR    R1,     R3                      ; 61AB   008B
        ADDI    #$00A6, R3                      ; 61AC   02FB 00A6
        CLRR    R0                              ; 61AE   01C0
        MVO@    R0,     R3                      ; 61AF   0258

        JSR     R5,     L_55E6                  ; 61B0   0004 0154 01E6

        BC      L_61B9                          ; 61B3   0201 0004

        MVII    #$0040, R0                      ; 61B5   02B8 0040
        B       L_61EF                          ; 61B7   0200 0036

L_61B9:
        JSR     R5,     L_55D3                  ; 61B9   0004 0154 01D3

        BC      L_61C4                          ; 61BC   0201 0006

        MOVR    R1,     R3                      ; 61BE   008B
        ADDI    #$00A6, R3                      ; 61BF   02FB 00A6
        MVII    #$0040, R0                      ; 61C1   02B8 0040
        MVO@    R0,     R3                      ; 61C3   0258
L_61C4:
        MOVR    R1,     R4                      ; 61C4   008C
        ADDI    #$0100, R4                      ; 61C5   02FC 0100
        MVII    #$00B0, R0                      ; 61C7   02B8 00B0

        JSR     R5,     L_6A10                  ; 61C9   0004 0168 0210

        MOVR    R1,     R3                      ; 61CC   008B
        ADDI    #$0105, R3                      ; 61CD   02FB 0105
        CLRR    R0                              ; 61CF   01C0
        MVO@    R0,     R3                      ; 61D0   0258

L_61D1:
        JSR     R5,     L_5404                  ; 61D1   0004 0154 0004

        BC      L_61ED                          ; 61D4   0201 0017

        JSR     R5,     L_6191                  ; 61D6   0004 0160 0191

        BNC     L_61DD                          ; 61D9   0209 0002
        B       L_61D1                          ; 61DB   0220 000B

L_61DD:
        MOVR    R1,     R3                      ; 61DD   008B
        ADDI    #$00A4, R3                      ; 61DE   02FB 00A4
        MVII    #$0032, R0                      ; 61E0   02B8 0032
        CMP@    R3,     R0                      ; 61E2   0358
        BNEQ    L_61E9                          ; 61E3   020C 0004

        MVII    #$0088, R0                      ; 61E5   02B8 0088
        B       L_61EF                          ; 61E7   0200 0006

L_61E9:
        MVII    #$0010, R0                      ; 61E9   02B8 0010
        B       L_61EF                          ; 61EB   0200 0002

L_61ED:
        MVII    #$0080, R0                      ; 61ED   02B8 0080
L_61EF:
        MOVR    R1,     R3                      ; 61EF   008B
        ADDI    #$00A6, R3                      ; 61F0   02FB 00A6
        XOR@    R3,     R0                      ; 61F2   03D8
        MVO@    R0,     R3                      ; 61F3   0258
        PSHR    R0                              ; 61F4   0270
        MOVR    R1,     R4                      ; 61F5   008C
        ADDI    #$01B0, R4                      ; 61F6   02FC 01B0
        MOVR    R1,     R0                      ; 61F8   0088
        ADDI    #$0100, R0                      ; 61F9   02F8 0100
        SUBR    R4,     R0                      ; 61FB   0120

        JSR     R5,     L_6A10                  ; 61FC   0004 0168 0210

        PULR    R0                              ; 61FF   02B0
        RSWD    R0                              ; 6200   0038
        PULR    R7                              ; 6201   02B7

L_6202:
        PSHR    R5                              ; 6202   0275
        MVII    #$00D0, R1                      ; 6203   02B9 00D0
        SWAP    R1,     1                       ; 6205   0041
        MOVR    R1,     R3                      ; 6206   008B
        ADDI    #$00FD, R3                      ; 6207   02FB 00FD
        MVI@    R3,     R0                      ; 6209   0298
        MOVR    R1,     R2                      ; 620A   008A
        ADDI    #$0082, R2                      ; 620B   02FA 0082
        CMP@    R2,     R0                      ; 620D   0350
        BEQ     L_621B                          ; 620E   0204 000B

        JSR     R5,     L_62B8                  ; 6210   0004 0160 02B8

        MOVR    R1,     R3                      ; 6213   008B
        ADDI    #$00FD, R3                      ; 6214   02FB 00FD
        MOVR    R1,     R2                      ; 6216   008A
        ADDI    #$0082, R2                      ; 6217   02FA 0082
        MVI@    R2,     R0                      ; 6219   0290
        MVO@    R0,     R3                      ; 621A   0258

L_621B:
        JSR     R5,     L_6590                  ; 621B   0004 0164 0190

        PULR    R7                              ; 621E   02B7

L_621F:
        PSHR    R5                              ; 621F   0275
        CLRR    R0                              ; 6220   01C0
        MOVR    R1,     R4                      ; 6221   008C
        ADDI    #$010E, R4                      ; 6222   02FC 010E
        MVO@    R0,     R4                      ; 6224   0260
        MVO@    R0,     R4                      ; 6225   0260
        MOVR    R1,     R3                      ; 6226   008B
        ADDI    #$00FF, R3                      ; 6227   02FB 00FF
        SDBD                                    ; 6229   0001
        MVII    #$62E9, R4                      ; 622A   02BC 00E9 0062
        MOVR    R1,     R2                      ; 622D   008A
        ADDI    #$011E, R2                      ; 622E   02FA 011E
        ADD@    R2,     R4                      ; 6230   02D4
        MVI@    R4,     R5                      ; 6231   02A5
        MVO@    R5,     R3                      ; 6232   025D
        SUBI    #$000D, R3                      ; 6233   033B 000D
        ADDI    #$0007, R4                      ; 6235   02FC 0007
        MVI@    R4,     R5                      ; 6237   02A5
        MOVR    R1,     R2                      ; 6238   008A
        ADDI    #$0094, R2                      ; 6239   02FA 0094
        MVI@    R2,     R4                      ; 623B   0294
        CMPI    #$000C, R4                      ; 623C   037C 000C
        BNC     L_6241                          ; 623E   0209 0001

        INCR    R5                              ; 6240   000D
L_6241:
        MVO@    R5,     R3                      ; 6241   025D
        MOVR    R1,     R3                      ; 6242   008B
        ADDI    #$00FE, R3                      ; 6243   02FB 00FE
L_6245:
        MVO@    R0,     R3                      ; 6245   0258

        JSR     R5,     L_5B50                  ; 6246   0004 0158 0350

        J       L_598D                          ; 6249   0004 0358 018D

L_624C:
        GSWD    R3                              ; 624C   0033
        MOVR    R1,     R5                      ; 624D   008D
        ADDI    #$011E, R5                      ; 624E   02FD 011E
        MOVR    R1,     R2                      ; 6250   008A
        ADDI    #$030D, R2                      ; 6251   02FA 030D
        MVI@    R5,     R0                      ; 6253   02A8
        MVI@    R2,     R4                      ; 6254   0294
        CMPI    #$0008, R0                      ; 6255   0378 0008
        MVII    #$0000, R0                      ; 6257   02B8 0000
        MVO@    R0,     R2                      ; 6259   0250
        BEQ     L_626C                          ; 625A   0204 0010

        RSWD    R3                              ; 625C   003B
        BC      L_6292                          ; 625D   0201 0033

        TSTR    R4                              ; 625F   00A4
        BEQ     L_627C                          ; 6260   0204 001A

        MOVR    R1,     R3                      ; 6262   008B
        ADDI    #$00FE, R3                      ; 6263   02FB 00FE
        MVI@    R3,     R0                      ; 6265   0298
        TSTR    R0                              ; 6266   0080
        SETC                                    ; 6267   0007
        BEQ     L_6292                          ; 6268   0204 0028
        B       L_6291                          ; 626A   0200 0025

L_626C:
        MOVR    R1,     R3                      ; 626C   008B
        ADDI    #$0085, R3                      ; 626D   02FB 0085
        MVI@    R3,     R0                      ; 626F   0298
        CMPI    #$00FF, R0                      ; 6270   0378 00FF
        BEQ     L_6279                          ; 6272   0204 0005

        JSR     R5,     L_6293                  ; 6274   0004 0160 0293

        B       L_6291                          ; 6277   0200 0018

L_6279:
        TSTR    R4                              ; 6279   00A4
        BNEQ    L_6292                          ; 627A   020C 0016

L_627C:
        JSR     R5,     L_6293                  ; 627C   0004 0160 0293

        MOVR    R1,     R3                      ; 627F   008B
        ADDI    #$013B, R3                      ; 6280   02FB 013B
        MVI@    R3,     R0                      ; 6282   0298
        DECR    R0                              ; 6283   0010
        BEQ     L_6292                          ; 6284   0204 000C

        MOVR    R1,     R3                      ; 6286   008B
        ADDI    #$00FE, R3                      ; 6287   02FB 00FE
        MVI@    R3,     R0                      ; 6289   0298
        MOVR    R1,     R4                      ; 628A   008C
        ADDI    #$00F2, R4                      ; 628B   02FC 00F2
        CMP@    R4,     R0                      ; 628D   0360
        INCR    R0                              ; 628E   0008
        BNC     L_6245                          ; 628F   0229 004B

L_6291:
        CLRC                                    ; 6291   0006
L_6292:
        PULR    R7                              ; 6292   02B7

L_6293:
        PSHR    R5                              ; 6293   0275
        MOVR    R1,     R4                      ; 6294   008C
        ADDI    #$0084, R4                      ; 6295   02FC 0084
        MOVR    R1,     R5                      ; 6297   008D
        ADDI    #$00FA, R5                      ; 6298   02FD 00FA
        J       L_6A29                          ; 629A   0004 0368 0229

L_629D:
        MVII    #$0100, R2                      ; 629D   02BA 0100
        CLRR    R0                              ; 629F   01C0
L_62A0:
        DECR    R2                              ; 62A0   0012
        BMI     L_62A8                          ; 62A1   020B 0005

        MOVR    R2,     R3                      ; 62A3   0093
        ADDR    R1,     R3                      ; 62A4   00CB
        MVO@    R0,     R3                      ; 62A5   0258
        B       L_62A0                          ; 62A6   0220 0007
L_62A8:
        MOVR    R5,     R7                      ; 62A8   00AF

L_62A9:
        PSHR    R5                              ; 62A9   0275
        PSHR    R0                              ; 62AA   0270
        MOVR    R1,     R5                      ; 62AB   008D
        ADDI    #$010E, R5                      ; 62AC   02FD 010E
        SDBD                                    ; 62AE   0001
        MVI@    R5,     R0                      ; 62AF   02A8
        INCR    R0                              ; 62B0   0008
        SUBI    #$0002, R5                      ; 62B1   033D 0002
        MVO@    R0,     R5                      ; 62B3   0268
        SWAP    R0,     1                       ; 62B4   0040
        MVO@    R0,     R5                      ; 62B5   0268
        PULR    R0                              ; 62B6   02B0
        PULR    R7                              ; 62B7   02B7

L_62B8:
        PSHR    R5                              ; 62B8   0275
        GSWD    R0                              ; 62B9   0030
        MOVR    R1,     R4                      ; 62BA   008C
        ADDI    #$0082, R4                      ; 62BB   02FC 0082
        MVII    #$0008, R3                      ; 62BD   02BB 0008
        XOR@    R4,     R3                      ; 62BF   03E3
        DECR    R4                              ; 62C0   0014
        MVO@    R3,     R4                      ; 62C1   0263
        SLL     R3,     1                       ; 62C2   004B
        SLL     R3,     2                       ; 62C3   004F
        MVO@    R3,     R4                      ; 62C4   0263
        RSWD    R0                              ; 62C5   0038
        PULR    R7                              ; 62C6   02B7

L_62C7:
        PSHR    R5                              ; 62C7   0275
        MVII    #$00D0, R1                      ; 62C8   02B9 00D0
        SWAP    R1,     1                       ; 62CA   0041

        JSR     R5,     L_629D                  ; 62CB   0004 0160 029D

        SDBD                                    ; 62CE   0001
        MVII    #$5E7E, R4                      ; 62CF   02BC 007E 005E
        MOVR    R1,     R5                      ; 62D2   008D
        ADDI    #$0008, R5                      ; 62D3   02FD 0008
L_62D5:
        MVI@    R4,     R2                      ; 62D5   02A2
        TSTR    R2                              ; 62D6   0092
        BEQ     L_62E9                          ; 62D7   0204 0010

        MVO@    R2,     R5                      ; 62D9   026A
        MVII    #$0006, R0                      ; 62DA   02B8 0006
        MVO@    R0,     R5                      ; 62DC   0268
        ADDI    #$0004, R5                      ; 62DD   02FD 0004
        MVII    #$000E, R0                      ; 62DF   02B8 000E
        MVO@    R0,     R5                      ; 62E1   0268
        ADDI    #$0008, R2                      ; 62E2   02FA 0008
        MVO@    R2,     R5                      ; 62E4   026A
        ADDI    #$0008, R5                      ; 62E5   02FD 0008
        B       L_62D5                          ; 62E7   0220 0013
L_62E9:
        PULR    R7                              ; 62E9   02B7

        DECLE   $0000,  $0001,  $0000,  $0001   ; 62EA   0000 0001 0000 0001
        DECLE   $0002,  $0001,  $0001,  $0001   ; 62EE   0002 0001 0001 0001
        DECLE   $0000,  $0000,  $0001,  $0001   ; 62F2   0000 0000 0001 0001
        DECLE   $0001                           ; 62F6   0001

        EIS                                     ; 62F7   0002
        DIS                                     ; 62F8   0003
        INCR    R0                              ; 62F9   0008
L_62FA:
        PSHR    R5                              ; 62FA   0275
        SDBD                                    ; 62FB   0001
        MVII    #$5319, R1                      ; 62FC   02B9 0019 0053
        MVO     R1,     .ISRVEC.0               ; 62FF   0241 0100
        SWAP    R1,     1                       ; 6301   0041
        MVO     R1,     .ISRVEC.1               ; 6302   0241 0101
        MVI     G_0168, R3                      ; 6304   0283 0168
        SUBI    #$0002, R3                      ; 6306   033B 0002
        BMI     L_631E                          ; 6308   020B 0014

        CMPI    #$0004, R3                      ; 630A   037B 0004
        BGE     L_631E                          ; 630C   020D 0010

        MOVR    R3,     R1                      ; 630E   0099
        SLL     R3,     1                       ; 630F   004B
        ADDR    R1,     R3                      ; 6310   00CB
        ADDR    R3,     R7                      ; 6311   00DF
        J       L_6C01                          ; 6312   0004 036C 0001
        J       L_6DAA                          ; 6315   0004 036C 01AA
        J       L_6DAA                          ; 6318   0004 036C 01AA

        JSR     R5,     L_5281                  ; 631B   0004 0150 0281

L_631E:
        PULR    R7                              ; 631E   02B7

L_631F:
        PSHR    R5                              ; 631F   0275
L_6320:
        MVI     G_018D, R0                      ; 6320   0280 018D
        MVO     R0,     G_017B                  ; 6322   0240 017B
        CLRR    R1                              ; 6324   01C9
        MVII    #$0011, R0                      ; 6325   02B8 0011
        MVII    #$017D, R4                      ; 6327   02BC 017D

        JSR     R5,     X_FILL_MEM              ; 6329   0004 0114 0341

        MVI     G_0197, R0                      ; 632C   0280 0197
        PSHR    R0                              ; 632E   0270
        CLRR    R0                              ; 632F   01C0
L_6330:
        MVO     R0,     G_017A                  ; 6330   0240 017A

        JSR     R5,     L_6352                  ; 6332   0004 0160 0352

        MVI     G_017A, R0                      ; 6335   0280 017A
        INCR    R0                              ; 6337   0008
        MOVR    R0,     R2                      ; 6338   0082
        ANDI    #$0008, R2                      ; 6339   03BA 0008
        BEQ     L_6330                          ; 633B   0224 000C

        ADDI    #$0008, R0                      ; 633D   02F8 0008
        MOVR    R0,     R2                      ; 633F   0082
        ANDI    #$0080, R2                      ; 6340   03BA 0080
        BEQ     L_6330                          ; 6342   0224 0013

        PULR    R0                              ; 6344   02B0
        MVO     R0,     G_0197                  ; 6345   0240 0197
        MVI     G_018D, R0                      ; 6347   0280 018D
        MVI     G_017B, R1                      ; 6349   0281 017B
        CMPR    R0,     R1                      ; 634B   0141
        BEQ     L_6351                          ; 634C   0204 0003

        JSR     R5,     L_6382                  ; 634E   0004 0160 0382

L_6351:
        PULR    R7                              ; 6351   02B7

L_6352:
        PSHR    R5                              ; 6352   0275
        MVI     G_016D, R2                      ; 6353   0282 016D
        XORR    R2,     R0                      ; 6355   01D0
        MVO     R0,     G_0197                  ; 6356   0240 0197

        JSR     R5,     L_6D47                  ; 6358   0004 016C 0147
        JSR     R5,     L_6EBB                  ; 635B   0004 016C 02BB

        MVI     G_017A, R3                      ; 635E   0283 017A
        SDBD                                    ; 6360   0001
        MVII    #$D008, R4                      ; 6361   02BC 0008 00D0
        ADDR    R4,     R3                      ; 6364   00E3
        MVI@    R3,     R1                      ; 6365   0299
        MVI@    R2,     R3                      ; 6366   0293
        MOVR    R1,     R0                      ; 6367   0088

        JSR     R5,     L_6E98                  ; 6368   0004 016C 0298

        CLRR    R5                              ; 636B   01ED
        ANDI    #$0007, R0                      ; 636C   03B8 0007
        BEQ     L_6372                          ; 636E   0204 0002

        XORI    #$0080, R5                      ; 6370   03FD 0080
L_6372:
        SLL     R0,     2                       ; 6372   004C
        SLL     R0,     1                       ; 6373   0048
        ANDI    #$0008, R1                      ; 6374   03B9 0008
        BNEQ    L_637A                          ; 6376   020C 0002

        ADDI    #$0007, R0                      ; 6378   02F8 0007
L_637A:
        MVII    #$00F8, R1                      ; 637A   02B9 00F8
        SWAP    R1,     1                       ; 637C   0041
        XORR    R5,     R1                      ; 637D   01E9
        ANDR    R1,     R3                      ; 637E   018B
        XORR    R0,     R3                      ; 637F   01C3
        MVO@    R3,     R2                      ; 6380   0253
        PULR    R7                              ; 6381   02B7

L_6382:
        PSHR    R5                              ; 6382   0275
        MVI     .BTAB.01,R1                     ; 6383   0281 0201
        MVII    #$02B7, R4                      ; 6385   02BC 02B7
        MVO@    R1,     R4                      ; 6387   0261
        MVO@    R1,     R4                      ; 6388   0261
        ADDI    #$000C, R4                      ; 6389   02FC 000C
        MVO@    R1,     R4                      ; 638B   0261
        MVO@    R1,     R4                      ; 638C   0261
        CLRR    R1                              ; 638D   01C9
        MVO     R1,     G_017C                  ; 638E   0241 017C
        MVI     G_017B, R0                      ; 6390   0280 017B
        TSTR    R0                              ; 6392   0080
        BEQ     L_6398                          ; 6393   0204 0003

        JSR     R5,     L_6F96                  ; 6395   0004 016C 0396

L_6398:
        MVI     G_017C, R1                      ; 6398   0281 017C
        INCR    R1                              ; 639A   0009
        MVO     R1,     G_017C                  ; 639B   0241 017C
        CMPI    #$000E, R1                      ; 639D   0379 000E
        BGT     L_63FE                          ; 639F   020E 005D

        MOVR    R1,     R4                      ; 63A1   008C
        ANDI    #$0007, R4                      ; 63A2   03BC 0007
        BEQ     L_6398                          ; 63A4   0224 000D

        CMPI    #$0007, R4                      ; 63A6   037C 0007
        BEQ     L_6398                          ; 63A8   0224 0011

        CMPI    #$0001, R4                      ; 63AA   037C 0001
        BEQ     L_63B4                          ; 63AC   0204 0006

        CMPI    #$0006, R4                      ; 63AE   037C 0006
        BEQ     L_63B4                          ; 63B0   0204 0002
        B       L_63CB                          ; 63B2   0200 0017

L_63B4:
        MVII    #$02B8, R2                      ; 63B4   02BA 02B8
        CMPI    #$0007, R1                      ; 63B6   0379 0007
        BLT     L_63C4                          ; 63B8   0205 000A

        CMPI    #$0006, R4                      ; 63BA   037C 0006
        BNEQ    L_63BF                          ; 63BC   020C 0001

        DECR    R2                              ; 63BE   0012
L_63BF:
        CLRR    R5                              ; 63BF   01ED
        ADDI    #$000E, R2                      ; 63C0   02FA 000E
        B       L_63CB                          ; 63C2   0200 0007

L_63C4:
        CMPI    #$0006, R4                      ; 63C4   037C 0006
        BNEQ    L_63C9                          ; 63C6   020C 0001

        DECR    R2                              ; 63C8   0012
L_63C9:
        MVII    #$0007, R5                      ; 63C9   02BD 0007
L_63CB:
        CMPI    #$0003, R4                      ; 63CB   037C 0003
        BNEQ    L_63D3                          ; 63CD   020C 0004

        MVII    #$0001, R0                      ; 63CF   02B8 0001
        B       L_63E5                          ; 63D1   0200 0012

L_63D3:
        CMPI    #$0006, R4                      ; 63D3   037C 0006
        BNEQ    L_63DB                          ; 63D5   020C 0004

        MVII    #$0008, R0                      ; 63D7   02B8 0008
        B       L_63E5                          ; 63D9   0200 000A

L_63DB:
        CMPI    #$0005, R4                      ; 63DB   037C 0005
        BNEQ    L_63E3                          ; 63DD   020C 0004

        MVII    #$0001, R0                      ; 63DF   02B8 0001
        B       L_63E5                          ; 63E1   0200 0002

L_63E3:
        MVII    #$0002, R0                      ; 63E3   02B8 0002
L_63E5:
        MVII    #$017C, R3                      ; 63E5   02BB 017C
        ADDR    R1,     R3                      ; 63E7   00CB
        MVI@    R3,     R1                      ; 63E8   0299
        SUBR    R1,     R0                      ; 63E9   0108
        MOVR    R0,     R1                      ; 63EA   0081
L_63EB:
        BLE     L_6398                          ; 63EB   0226 0054

        MOVR    R4,     R0                      ; 63ED   00A0
        SLL     R0,     2                       ; 63EE   004C
        SLL     R0,     1                       ; 63EF   0048
        XORR    R5,     R0                      ; 63F0   01E8
        SDBD                                    ; 63F1   0001
        XORI    #$0800, R0                      ; 63F2   03F8 0000 0008
        MVO@    R0,     R2                      ; 63F5   0250
        SUBI    #$0014, R2                      ; 63F6   033A 0014
        MVI     .BTAB.01,R3                     ; 63F8   0283 0201
        MVO@    R3,     R2                      ; 63FA   0253
        DECR    R1                              ; 63FB   0011
        B       L_63EB                          ; 63FC   0220 0012
L_63FE:
        PULR    R7                              ; 63FE   02B7

        DECLE   $0000                           ; 63FF   0000
L_6400:
        MVI@    R3,     R2                      ; 6400   029A
        MVO@    R2,     R4                      ; 6401   0262
        ADDR    R1,     R2                      ; 6402   00CA
        MVI@    R2,     R0                      ; 6403   0290
        MVO@    R0,     R4                      ; 6404   0260
        MOVR    R5,     R7                      ; 6405   00AF

L_6406:
        PSHR    R5                              ; 6406   0275
        MOVR    R1,     R4                      ; 6407   008C
        ADDI    #$02F5, R4                      ; 6408   02FC 02F5
        MOVR    R1,     R3                      ; 640A   008B
        ADDI    #$0100, R3                      ; 640B   02FB 0100

        JSR     R5,     L_6400                  ; 640D   0004 0164 0000

        INCR    R3                              ; 6410   000B

        JSR     R5,     L_6400                  ; 6411   0004 0164 0000

        SUBI    #$007F, R3                      ; 6414   033B 007F
        MVI@    R3,     R0                      ; 6416   0298
        MVO@    R0,     R4                      ; 6417   0260
        MVII    #$0080, R2                      ; 6418   02BA 0080
        MVO@    R2,     R4                      ; 641A   0262
        CLRR    R2                              ; 641B   01D2
        SUBI    #$0040, R4                      ; 641C   033C 0040
        MVO@    R2,     R4                      ; 641E   0262
        MVII    #$0003, R5                      ; 641F   02BD 0003
        MVO@    R5,     R4                      ; 6421   0265
        MOVR    R1,     R3                      ; 6422   008B
        ADDI    #$0200, R3                      ; 6423   02FB 0200
        MOVR    R1,     R5                      ; 6425   008D
        ADDI    #$0101, R5                      ; 6426   02FD 0101
        ADD@    R5,     R3                      ; 6428   02EB
        MVI@    R3,     R5                      ; 6429   029D
        MVO@    R5,     R4                      ; 642A   0265
        ADDI    #$003D, R4                      ; 642B   02FC 003D
        DECR    R2                              ; 642D   0012
        MVO@    R2,     R4                      ; 642E   0262
        MVII    #$0003, R5                      ; 642F   02BD 0003
        MVO@    R5,     R4                      ; 6431   0265
        ADDI    #$0008, R3                      ; 6432   02FB 0008
        MVI@    R3,     R5                      ; 6434   029D
        MVO@    R5,     R4                      ; 6435   0265
        MOVR    R4,     R5                      ; 6436   00A5
        SUBI    #$0006, R5                      ; 6437   033D 0006
        MVI@    R5,     R3                      ; 6439   02AB
        ADDR    R1,     R3                      ; 643A   00CB
        ADDI    #$029F, R3                      ; 643B   02FB 029F
        MVI@    R3,     R0                      ; 643D   0298
        MVO@    R0,     R4                      ; 643E   0260
        MOVR    R1,     R5                      ; 643F   008D
        ADDI    #$02BE, R5                      ; 6440   02FD 02BE
        MOVR    R1,     R4                      ; 6442   008C
        ADDI    #$0104, R4                      ; 6443   02FC 0104
        MVI@    R4,     R0                      ; 6445   02A0
        MVO@    R0,     R5                      ; 6446   0268

        JSR     R5,     L_64FE                  ; 6447   0004 0164 00FE
L_644A:
        JSR     R5,     L_62B8                  ; 644A   0004 0160 02B8

        MOVR    R1,     R4                      ; 644D   008C
        ADDI    #$02FF, R4                      ; 644E   02FC 02FF
        MVII    #$0005, R0                      ; 6450   02B8 0005
        CMP@    R4,     R0                      ; 6452   0360
        BEQ     L_6471                          ; 6453   0204 001C

        MOVR    R1,     R3                      ; 6455   008B
        ADDI    #$0082, R3                      ; 6456   02FB 0082
        MVI@    R3,     R3                      ; 6458   029B
        SLL     R3,     1                       ; 6459   004B
        MOVR    R3,     R4                      ; 645A   009C
        SLL     R3,     2                       ; 645B   004F
        ADDR    R1,     R3                      ; 645C   00CB
        ADDI    #$02BB, R3                      ; 645D   02FB 02BB
        MOVR    R1,     R2                      ; 645F   008A
        ADDI    #$02FA, R2                      ; 6460   02FA 02FA
        MVI@    R2,     R5                      ; 6462   0295
        CMP@    R3,     R5                      ; 6463   035D
        BEQ     L_646C                          ; 6464   0204 0006

        GSWD    R0                              ; 6466   0030
        XORR    R4,     R0                      ; 6467   01E0
        RSWD    R0                              ; 6468   0038
        BNC     L_646C                          ; 6469   0209 0001

        MVO@    R5,     R3                      ; 646B   025D

L_646C:
        JSR     R5,     L_64B2                  ; 646C   0004 0164 00B2

        BNC     L_644A                          ; 646F   0229 0026

L_6471:
        MOVR    R1,     R3                      ; 6471   008B
        ADDI    #$0082, R3                      ; 6472   02FB 0082
        MVI@    R3,     R3                      ; 6474   029B
        SLL     R3,     1                       ; 6475   004B
        SLL     R3,     2                       ; 6476   004F
        ADDR    R1,     R3                      ; 6477   00CB
        ADDI    #$02BB, R3                      ; 6478   02FB 02BB
        MVI@    R3,     R0                      ; 647A   0298
        MOVR    R1,     R3                      ; 647B   008B
        ADDI    #$02FA, R3                      ; 647C   02FB 02FA
        MVO@    R0,     R3                      ; 647E   0258
        MOVR    R3,     R4                      ; 647F   009C
        SUBI    #$0005, R4                      ; 6480   033C 0005
        MVI@    R4,     R0                      ; 6482   02A0
        MOVR    R1,     R3                      ; 6483   008B
        ADDI    #$0100, R3                      ; 6484   02FB 0100
        MVO@    R0,     R3                      ; 6486   0258
        MVI@    R4,     R0                      ; 6487   02A0
        SUBI    #$0010, R3                      ; 6488   033B 0010
        MVO@    R0,     R3                      ; 648A   0258
        MOVR    R1,     R4                      ; 648B   008C
        ADDI    #$02BE, R4                      ; 648C   02FC 02BE
        MOVR    R1,     R3                      ; 648E   008B
        ADDI    #$0104, R3                      ; 648F   02FB 0104
        MVI@    R4,     R0                      ; 6491   02A0
        MVO@    R0,     R3                      ; 6492   0258
        SUBI    #$0082, R3                      ; 6493   033B 0082
        MOVR    R1,     R4                      ; 6495   008C
        ADDI    #$02F9, R4                      ; 6496   02FC 02F9
        MVI@    R4,     R0                      ; 6498   02A0
        MVO@    R0,     R3                      ; 6499   0258
        SLL     R0,     1                       ; 649A   0048
        SLL     R0,     2                       ; 649B   004C
        INCR    R3                              ; 649C   000B
        MVO@    R0,     R3                      ; 649D   0258
        MOVR    R1,     R2                      ; 649E   008A
        ADDI    #$0200, R2                      ; 649F   02FA 0200
        MOVR    R1,     R4                      ; 64A1   008C
        ADDI    #$0101, R4                      ; 64A2   02FC 0101
        ADD@    R4,     R2                      ; 64A4   02E2
        MOVR    R1,     R4                      ; 64A5   008C
        ADDI    #$02BD, R4                      ; 64A6   02FC 02BD
        MVI@    R4,     R0                      ; 64A8   02A0
        MVO@    R0,     R2                      ; 64A9   0250
        ADDI    #$0008, R2                      ; 64AA   02FA 0008
        ADDI    #$003F, R4                      ; 64AC   02FC 003F
        MVI@    R4,     R0                      ; 64AE   02A0
        MVO@    R0,     R2                      ; 64AF   0250
L_64B0:
        SETC                                    ; 64B0   0007
        PULR    R7                              ; 64B1   02B7

L_64B2:
        PSHR    R5                              ; 64B2   0275
L_64B3:
        MOVR    R1,     R3                      ; 64B3   008B
        ADDI    #$0082, R3                      ; 64B4   02FB 0082
        MVI@    R3,     R3                      ; 64B6   029B
        SLL     R3,     2                       ; 64B7   004F
        SLL     R3,     1                       ; 64B8   004B
        ADDR    R1,     R3                      ; 64B9   00CB
        ADDI    #$02BC, R3                      ; 64BA   02FB 02BC
        MVI@    R3,     R0                      ; 64BC   0298
        DECR    R0                              ; 64BD   0010
        BMI     L_650A                          ; 64BE   020B 004A
        BEQ     L_64CC                          ; 64C0   0204 000A

        PSHR    R3                              ; 64C2   0273

        JSR     R5,     L_558A                  ; 64C3   0004 0154 018A

        MVII    #$0001, R0                      ; 64C6   02B8 0001
        PULR    R3                              ; 64C8   02B3
        MVO@    R0,     R3                      ; 64C9   0258
        BNC     L_64D5                          ; 64CA   0209 0009

L_64CC:
        PSHR    R3                              ; 64CC   0273

        JSR     R5,     L_5586                  ; 64CD   0004 0154 0186

        PULR    R3                              ; 64D0   02B3
        CLRR    R0                              ; 64D1   01C0
        MVO@    R0,     R3                      ; 64D2   0258
        BC      L_650A                          ; 64D3   0201 0035

L_64D5:
        MOVR    R1,     R2                      ; 64D5   008A
        ADDI    #$0100, R2                      ; 64D6   02FA 0100
        MOVR    R1,     R4                      ; 64D8   008C
        ADDI    #$02F5, R4                      ; 64D9   02FC 02F5
        MVI@    R4,     R0                      ; 64DB   02A0
        CMP@    R2,     R0                      ; 64DC   0350
        BEQ     L_64B3                          ; 64DD   0224 002B

        MOVR    R1,     R2                      ; 64DF   008A
        ADDI    #$0101, R2                      ; 64E0   02FA 0101
        MVI@    R2,     R0                      ; 64E2   0290
        ANDI    #$0007, R0                      ; 64E3   03B8 0007
        BEQ     L_64EB                          ; 64E5   0204 0004

        CMPI    #$0007, R0                      ; 64E7   0378 0007
        BNEQ    L_650F                          ; 64E9   020C 0024

L_64EB:
        MVII    #$0003, R0                      ; 64EB   02B8 0003
L_64ED:
        MOVR    R1,     R3                      ; 64ED   008B
        ADDI    #$0082, R3                      ; 64EE   02FB 0082
        MOVR    R0,     R2                      ; 64F0   0082
        ADD@    R3,     R2                      ; 64F1   02DA
        SDBD                                    ; 64F2   0001
        ADDI    #$5EC7, R2                      ; 64F3   02FA 00C7 005E
        MVI@    R2,     R5                      ; 64F6   0295
        MOVR    R1,     R2                      ; 64F7   008A
        ADDI    #$02FA, R2                      ; 64F8   02FA 02FA
        ADD@    R2,     R5                      ; 64FA   02D5
        MVO@    R5,     R2                      ; 64FB   0255
        B       L_6519                          ; 64FC   0200 001B

L_64FE:
        PSHR    R5                              ; 64FE   0275
        MOVR    R1,     R3                      ; 64FF   008B
        ADDI    #$0102, R3                      ; 6500   02FB 0102
        MVI@    R3,     R0                      ; 6502   0298
        RSWD    R0                              ; 6503   0038
        BNOV    L_650F                          ; 6504   020A 0009

        ANDI    #$0007, R0                      ; 6506   03B8 0007
        B       L_64ED                          ; 6508   0220 001C

L_650A:
        JSR     R5,     L_5656                  ; 650A   0004 0154 0256

        BC      L_64B0                          ; 650D   0221 005E

L_650F:
        MOVR    R1,     R2                      ; 650F   008A
        ADDI    #$0100, R2                      ; 6510   02FA 0100
        MOVR    R1,     R3                      ; 6512   008B
        ADD@    R2,     R3                      ; 6513   02D3
        MOVR    R1,     R2                      ; 6514   008A
        ADDI    #$029F, R2                      ; 6515   02FA 029F
        ADD@    R3,     R2                      ; 6517   02DA
        MVI@    R2,     R0                      ; 6518   0290
L_6519:
        MOVR    R1,     R4                      ; 6519   008C
        ADDI    #$02FE, R4                      ; 651A   02FC 02FE
        MVI@    R4,     R2                      ; 651C   02A2
        MVO@    R2,     R4                      ; 651D   0262
        TSTR    R2                              ; 651E   0092
        BEQ     L_6533                          ; 651F   0204 0012

        ADDI    #$0008, R2                      ; 6521   02FA 0008
        MOVR    R1,     R4                      ; 6523   008C
        ADDI    #$0082, R4                      ; 6524   02FC 0082
        XOR@    R4,     R2                      ; 6526   03E2
        SDBD                                    ; 6527   0001
        ADDI    #$5ED4, R2                      ; 6528   02FA 00D4 005E
        MOVR    R1,     R3                      ; 652B   008B
        ADDI    #$02FA, R3                      ; 652C   02FB 02FA
        MVI@    R2,     R5                      ; 652E   0295
        ADD@    R3,     R5                      ; 652F   02DD
        ANDI    #$00FF, R5                      ; 6530   03BD 00FF
        MVO@    R5,     R3                      ; 6532   025D
L_6533:
        MOVR    R1,     R4                      ; 6533   008C
        ADDI    #$02FE, R4                      ; 6534   02FC 02FE
        MVO@    R0,     R4                      ; 6536   0260
        MOVR    R1,     R4                      ; 6537   008C
        ADDI    #$0082, R4                      ; 6538   02FC 0082
        MVI@    R4,     R3                      ; 653A   02A3
        ADDR    R1,     R3                      ; 653B   00CB
        ADDI    #$0200, R3                      ; 653C   02FB 0200
        ADDI    #$007D, R4                      ; 653E   02FC 007D
        MVI@    R4,     R2                      ; 6540   02A2
        PSHR    R4                              ; 6541   0274
        ADD@    R4,     R3                      ; 6542   02E3
        ADDR    R1,     R2                      ; 6543   00CA
        MOVR    R1,     R4                      ; 6544   008C
        ADDI    #$027F, R4                      ; 6545   02FC 027F
        ADD@    R2,     R4                      ; 6547   02D4
        MVI@    R4,     R0                      ; 6548   02A0
        XOR@    R3,     R0                      ; 6549   03D8
        MVO@    R0,     R3                      ; 654A   0258
        MOVR    R2,     R3                      ; 654B   0093
        SUBR    R1,     R2                      ; 654C   010A
        PULR    R5                              ; 654D   02B5
        SUB@    R5,     R2                      ; 654E   032A
        MVII    #$0080, R5                      ; 654F   02BD 0080
        ANDR    R2,     R5                      ; 6551   0195
        BEQ     L_6555                          ; 6552   0204 0001

        NEGR    R2                              ; 6554   0022
L_6555:
        SDBD                                    ; 6555   0001
        ADDI    #$5F2A, R2                      ; 6556   02FA 002A 005F
        MVI@    R2,     R0                      ; 6559   0290
        TSTR    R0                              ; 655A   0080
        BEQ     L_658E                          ; 655B   0204 0031

        TSTR    R5                              ; 655D   00AD
        BEQ     L_6561                          ; 655E   0204 0001

        NEGR    R0                              ; 6560   0020
L_6561:
        ADDR    R0,     R3                      ; 6561   00C3
        MOVR    R3,     R4                      ; 6562   009C
        ANDI    #$0088, R4                      ; 6563   03BC 0088
        BNEQ    L_658E                          ; 6565   020C 0027

        MVI@    R3,     R5                      ; 6567   029D
        TSTR    R5                              ; 6568   00AD
        BEQ     L_6561                          ; 6569   0224 0009

        ADDR    R1,     R5                      ; 656B   00CD
        ADDI    #$029F, R5                      ; 656C   02FD 029F
        MVI@    R5,     R0                      ; 656E   02A8
        CMPI    #$0004, R0                      ; 656F   0378 0004
        BC      L_658E                          ; 6571   0201 001B

        MOVR    R1,     R4                      ; 6573   008C
        ADDI    #$0200, R4                      ; 6574   02FC 0200
        MOVR    R1,     R2                      ; 6576   008A
        ADDI    #$0100, R2                      ; 6577   02FA 0100
        ADD@    R2,     R4                      ; 6579   02D4
        MVI@    R3,     R3                      ; 657A   029B
        SLR     R3,     2                       ; 657B   0067
        SLR     R3,     1                       ; 657C   0063
        ANDI    #$0008, R3                      ; 657D   03BB 0008
        ADDR    R3,     R4                      ; 657F   00DC
        SUBI    #$0021, R5                      ; 6580   033D 0021
        MVI@    R5,     R0                      ; 6582   02A8
        AND@    R4,     R0                      ; 6583   03A0
        BEQ     L_658E                          ; 6584   0204 0008

        INCR    R2                              ; 6586   000A
        MVI@    R2,     R2                      ; 6587   0292
        ADDR    R1,     R2                      ; 6588   00CA
        ADDI    #$0200, R2                      ; 6589   02FA 0200
        ADDR    R3,     R2                      ; 658B   00DA
        XOR@    R2,     R0                      ; 658C   03D0
        MVO@    R0,     R2                      ; 658D   0250
L_658E:
        CLRC                                    ; 658E   0006
        PULR    R7                              ; 658F   02B7

L_6590:
        PSHR    R5                              ; 6590   0275

        JSR     R5,     L_65C2                  ; 6591   0004 0164 01C2

        BC      L_666A                          ; 6594   0201 00D4

        MVII    #$0005, R0                      ; 6596   02B8 0005
L_6598:
        SDBD                                    ; 6598   0001
        MVII    #$5F18, R2                      ; 6599   02BA 0018 005F
        ADDR    R0,     R2                      ; 659C   00C2
        MOVR    R2,     R3                      ; 659D   0093
        ADDI    #$0006, R3                      ; 659E   02FB 0006
        MOVR    R1,     R4                      ; 65A0   008C
        ADDI    #$0008, R4                      ; 65A1   02FC 0008
        ADD@    R3,     R4                      ; 65A3   02DC
        MVI@    R4,     R5                      ; 65A4   02A5
        CMP@    R2,     R5                      ; 65A5   0355
        BEQ     L_65B2                          ; 65A6   0204 000A

        ADDI    #$000C, R2                      ; 65A8   02FA 000C
        MOVR    R1,     R3                      ; 65AA   008B
        ADDI    #$011F, R3                      ; 65AB   02FB 011F
        MVI@    R2,     R5                      ; 65AD   0295
        COMR    R5                              ; 65AE   001D
        AND@    R3,     R5                      ; 65AF   039D
        XOR@    R2,     R5                      ; 65B0   03D5
        MVO@    R5,     R3                      ; 65B1   025D
L_65B2:
        DECR    R0                              ; 65B2   0010
        BPL     L_6598                          ; 65B3   0223 001C

        JSR     R5,     L_677F                  ; 65B5   0004 0164 037F
        JSR     R5,     L_61A7                  ; 65B8   0004 0160 01A7

        BNC     L_666A                          ; 65BB   0209 00AD

        JSR     R5,     L_668C                  ; 65BD   0004 0164 028C

        CLRC                                    ; 65C0   0006
        PULR    R7                              ; 65C1   02B7

L_65C2:
        PSHR    R5                              ; 65C2   0275
        ADDI    #$0200, R1                      ; 65C3   02F9 0200

        JSR     R5,     L_629D                  ; 65C5   0004 0160 029D

        SUBI    #$0200, R1                      ; 65C8   0339 0200
        MVII    #$0080, R0                      ; 65CA   02B8 0080
        CLRR    R4                              ; 65CC   01E4
L_65CD:
        DECR    R0                              ; 65CD   0010
        BMI     L_65D7                          ; 65CE   020B 0007

        ANDI    #$0077, R0                      ; 65D0   03B8 0077
        MOVR    R1,     R2                      ; 65D2   008A
        ADDR    R0,     R2                      ; 65D3   00C2
        MVO@    R4,     R2                      ; 65D4   0254
        B       L_65CD                          ; 65D5   0220 0009

L_65D7:
        CLRR    R0                              ; 65D7   01C0

        JSR     R5,     L_65E1                  ; 65D8   0004 0164 01E1

        MVII    #$0040, R0                      ; 65DB   02B8 0040

        JSR     R5,     L_65E1                  ; 65DD   0004 0164 01E1

        PULR    R7                              ; 65E0   02B7

L_65E1:
        PSHR    R5                              ; 65E1   0275
        MOVR    R1,     R3                      ; 65E2   008B
        ADDI    #$02B1, R3                      ; 65E3   02FB 02B1
        ADDR    R0,     R3                      ; 65E5   00C3
        MVO@    R0,     R3                      ; 65E6   0258
        MVII    #$0005, R2                      ; 65E7   02BA 0005

        JSR     R5,     L_6629                  ; 65E9   0004 0164 0229

        MVI@    R3,     R5                      ; 65EC   029D
        SUBR    R0,     R5                      ; 65ED   0105
        CMPI    #$0001, R5                      ; 65EE   037D 0001
        BNEQ    L_6669                          ; 65F0   020C 0077

        MVII    #$0003, R2                      ; 65F2   02BA 0003

        JSR     R5,     L_6629                  ; 65F4   0004 0164 0229

        MVII    #$0002, R2                      ; 65F7   02BA 0002

        JSR     R5,     L_6629                  ; 65F9   0004 0164 0229

        MVII    #$0001, R2                      ; 65FC   02BA 0001

        JSR     R5,     L_6629                  ; 65FE   0004 0164 0229

        MVII    #$0004, R2                      ; 6601   02BA 0004

        JSR     R5,     L_6629                  ; 6603   0004 0164 0229

        MVI@    R3,     R2                      ; 6606   029A
        PSHR    R2                              ; 6607   0272
        INCR    R3                              ; 6608   000B
        MVO@    R2,     R3                      ; 6609   025A
        MVII    #$0006, R2                      ; 660A   02BA 0006

        JSR     R5,     L_6629                  ; 660C   0004 0164 0229

        MVI@    R3,     R5                      ; 660F   029D
        INCR    R3                              ; 6610   000B
        MVO@    R4,     R3                      ; 6611   025C
        INCR    R3                              ; 6612   000B
        MVO@    R4,     R3                      ; 6613   025C
        PULR    R2                              ; 6614   02B2
        SUBR    R2,     R5                      ; 6615   0115
        CMPI    #$0009, R5                      ; 6616   037D 0009
        BC      L_6669                          ; 6618   0201 004F

        MOVR    R3,     R4                      ; 661A   009C
        MVII    #$0080, R3                      ; 661B   02BB 0080
        SUBI    #$0034, R4                      ; 661D   033C 0034
L_661F:
        MVO@    R3,     R4                      ; 661F   0263
        SLR     R3,     1                       ; 6620   0063
        DECR    R2                              ; 6621   0012
        CMPR    R0,     R2                      ; 6622   0142
        BMI     L_6668                          ; 6623   020B 0043
        BNEQ    L_661F                          ; 6625   022C 0007

        CLRC                                    ; 6627   0006
        PULR    R7                              ; 6628   02B7

L_6629:
        PSHR    R5                              ; 6629   0275
        MOVR    R0,     R5                      ; 662A   0085
        SLR     R0,     2                       ; 662B   0064
        SLR     R0,     1                       ; 662C   0060
        PSHR    R3                              ; 662D   0273
        ADDR    R2,     R0                      ; 662E   00D0
        MVII    #$0080, R4                      ; 662F   02BC 0080
L_6631:
        DECR    R4                              ; 6631   0014
        BMI     L_6663                          ; 6632   020B 002F

        ANDI    #$0077, R4                      ; 6634   03BC 0077
        MOVR    R4,     R3                      ; 6636   00A3
        ADDR    R1,     R3                      ; 6637   00CB
        ADDI    #$0008, R3                      ; 6638   02FB 0008
        CMP@    R3,     R0                      ; 663A   0358
        BNEQ    L_6631                          ; 663B   022C 000B

        CMPI    #$0006, R2                      ; 663D   037A 0006
        BNEQ    L_6649                          ; 663F   020C 0008

        ANDI    #$0007, R3                      ; 6641   03BB 0007
        BEQ     L_6666                          ; 6643   0204 0021

        CMPI    #$0007, R3                      ; 6645   037B 0007
        BEQ     L_6666                          ; 6647   0204 001D

L_6649:
        PULR    R3                              ; 6649   02B3
        MVI@    R3,     R0                      ; 664A   0298
        ANDI    #$0010, R0                      ; 664B   03B8 0010
        BNEQ    L_6667                          ; 664D   020C 0018

        MVI@    R3,     R0                      ; 664F   0298
        INCR    R0                              ; 6650   0008
        MVO@    R0,     R3                      ; 6651   0258
        PSHR    R3                              ; 6652   0273
        MOVR    R0,     R3                      ; 6653   0083
        ADDR    R1,     R3                      ; 6654   00CB
        ADDI    #$029F, R3                      ; 6655   02FB 029F
        MVO@    R2,     R3                      ; 6657   025A
        SUBI    #$0010, R3                      ; 6658   033B 0010
        MVO@    R4,     R3                      ; 665A   025C
        MOVR    R4,     R3                      ; 665B   00A3
        ADDR    R1,     R3                      ; 665C   00CB
        MVO@    R0,     R3                      ; 665D   0258
        ADDI    #$0008, R3                      ; 665E   02FB 0008
        MVI@    R3,     R0                      ; 6660   0298
        B       L_6631                          ; 6661   0220 0031

L_6663:
        MOVR    R5,     R0                      ; 6663   00A8
        PULR    R3                              ; 6664   02B3
        PULR    R7                              ; 6665   02B7

L_6666:
        PULR    R5                              ; 6666   02B5
L_6667:
        PULR    R5                              ; 6667   02B5
L_6668:
        PULR    R5                              ; 6668   02B5
L_6669:
        PULR    R5                              ; 6669   02B5
L_666A:
        SETC                                    ; 666A   0007
        PULR    R7                              ; 666B   02B7

L_666C:
        PSHR    R5                              ; 666C   0275
        MVII    #$0080, R4                      ; 666D   02BC 0080
L_666F:
        DECR    R4                              ; 666F   0014
        BMI     L_668B                          ; 6670   020B 0019

        ANDI    #$0077, R4                      ; 6672   03BC 0077
        MOVR    R4,     R3                      ; 6674   00A3
        ADDR    R1,     R3                      ; 6675   00CB
        MOVR    R3,     R2                      ; 6676   009A
        ADDI    #$0008, R2                      ; 6677   02FA 0008
        CLRR    R5                              ; 6679   01ED
        MVI@    R3,     R0                      ; 667A   0298
        TSTR    R0                              ; 667B   0080
        BEQ     L_6688                          ; 667C   0204 000A

        RSWD    R0                              ; 667E   0038
        BNEQ    L_6683                          ; 667F   020C 0002

        MVII    #$0008, R5                      ; 6681   02BD 0008
L_6683:
        MOVR    R1,     R3                      ; 6683   008B
        ADDI    #$029F, R3                      ; 6684   02FB 029F
        ADDR    R0,     R3                      ; 6686   00C3
        XOR@    R3,     R5                      ; 6687   03DD
L_6688:
        MVO@    R5,     R2                      ; 6688   0255
        B       L_666F                          ; 6689   0220 001B
L_668B:
        PULR    R7                              ; 668B   02B7

L_668C:
        PSHR    R5                              ; 668C   0275
        MVII    #$0040, R3                      ; 668D   02BB 0040

        JSR     R5,     L_6720                  ; 668F   0004 0164 0320

        PSHR    R0                              ; 6692   0270
        CLRR    R3                              ; 6693   01DB

        JSR     R5,     L_6720                  ; 6694   0004 0164 0320

        SUB@    R6,     R0                      ; 6697   0330
        MOVR    R1,     R4                      ; 6698   008C
        ADDI    #$00A2, R4                      ; 6699   02FC 00A2
        MVO@    R0,     R4                      ; 669B   0260
        SWAP    R0,     1                       ; 669C   0040
        MVO@    R0,     R4                      ; 669D   0260
        MOVR    R1,     R3                      ; 669E   008B
        ADDI    #$00E2, R3                      ; 669F   02FB 00E2
        MVII    #$0034, R0                      ; 66A1   02B8 0034
        MVO@    R0,     R3                      ; 66A3   0258
        ADDI    #$0008, R3                      ; 66A4   02FB 0008
        DECR    R0                              ; 66A6   0010
        MVO@    R0,     R3                      ; 66A7   0258
        MVII    #$0029, R5                      ; 66A8   02BD 0029
        MOVR    R1,     R4                      ; 66AA   008C
        ADDI    #$00E0, R4                      ; 66AB   02FC 00E0
        SDBD                                    ; 66AD   0001
        MVI@    R4,     R0                      ; 66AE   02A0
        ADDI    #$0006, R4                      ; 66AF   02FC 0006
        SDBD                                    ; 66B1   0001
        SUB@    R4,     R0                      ; 66B2   0320
        BNC     L_66C9                          ; 66B3   0209 0014

        CMPI    #$0018, R0                      ; 66B5   0378 0018
        BNC     L_66E1                          ; 66B7   0209 0028

        SUBI    #$0002, R4                      ; 66B9   033C 0002
        SDBD                                    ; 66BB   0001
        CMP@    R4,     R5                      ; 66BC   0365
        BNC     L_66E1                          ; 66BD   0209 0022

        MOVR    R1,     R3                      ; 66BF   008B
        ADDI    #$02D0, R3                      ; 66C0   02FB 02D0
        MVI@    R3,     R2                      ; 66C2   029A
        MOVR    R1,     R3                      ; 66C3   008B
        ADDI    #$00E2, R3                      ; 66C4   02FB 00E2
        MVO@    R2,     R3                      ; 66C6   025A
        B       L_66DD                          ; 66C7   0200 0014

L_66C9:
        NEGR    R0                              ; 66C9   0020
        CMPI    #$0018, R0                      ; 66CA   0378 0018
        BNC     L_66E1                          ; 66CC   0209 0013

        MOVR    R1,     R4                      ; 66CE   008C
        ADDI    #$00E0, R4                      ; 66CF   02FC 00E0
        SDBD                                    ; 66D1   0001
        CMP@    R4,     R5                      ; 66D2   0365
        BNC     L_66E1                          ; 66D3   0209 000C

        MOVR    R1,     R3                      ; 66D5   008B
        ADDI    #$0290, R3                      ; 66D6   02FB 0290
        MVI@    R3,     R2                      ; 66D8   029A
        MOVR    R1,     R3                      ; 66D9   008B
        ADDI    #$00EA, R3                      ; 66DA   02FB 00EA
        MVO@    R2,     R3                      ; 66DC   025A
L_66DD:
        MVII    #$0012, R0                      ; 66DD   02B8 0012
        B       L_671A                          ; 66DF   0200 0039

L_66E1:
        MVII    #$0041, R3                      ; 66E1   02BB 0041
        MVII    #$0006, R0                      ; 66E3   02B8 0006
        MOVR    R1,     R4                      ; 66E5   008C
        ADDI    #$00E0, R4                      ; 66E6   02FC 00E0
        SDBD                                    ; 66E8   0001
        CMP@    R4,     R3                      ; 66E9   0363
        BNC     L_6710                          ; 66EA   0209 0024

        ADDI    #$0006, R4                      ; 66EC   02FC 0006
        SDBD                                    ; 66EE   0001
        CMP@    R4,     R3                      ; 66EF   0363
        BNC     L_6710                          ; 66F0   0209 001E

        MOVR    R1,     R3                      ; 66F2   008B
        ADDI    #$00E3, R3                      ; 66F3   02FB 00E3
        MVI@    R3,     R2                      ; 66F5   029A
        ANDI    #$0080, R2                      ; 66F6   03BA 0080
        BNEQ    L_66FF                          ; 66F8   020C 0005

        MVI@    R3,     R2                      ; 66FA   029A
        MOVR    R1,     R3                      ; 66FB   008B
        ADDI    #$00EA, R3                      ; 66FC   02FB 00EA
        MVO@    R2,     R3                      ; 66FE   025A
L_66FF:
        MOVR    R1,     R3                      ; 66FF   008B
        ADDI    #$00EB, R3                      ; 6700   02FB 00EB
        MVI@    R3,     R2                      ; 6702   029A
        ANDI    #$0080, R2                      ; 6703   03BA 0080
        MVI@    R3,     R2                      ; 6705   029A
        BNEQ    L_670C                          ; 6706   020C 0004

        MOVR    R1,     R3                      ; 6708   008B
        ADDI    #$00E2, R3                      ; 6709   02FB 00E2
        MVO@    R2,     R3                      ; 670B   025A
L_670C:
        MVII    #$000C, R0                      ; 670C   02B8 000C
        B       L_671A                          ; 670E   0200 000A

L_6710:
        MOVR    R1,     R4                      ; 6710   008C
        ADDI    #$0309, R4                      ; 6711   02FC 0309
        MVI@    R4,     R5                      ; 6713   02A5
        CMPI    #$0010, R5                      ; 6714   037D 0010
        BC      L_671A                          ; 6716   0201 0002

        MVII    #$0000, R0                      ; 6718   02B8 0000
L_671A:
        MOVR    R1,     R3                      ; 671A   008B
        ADDI    #$0094, R3                      ; 671B   02FB 0094
        MVO@    R0,     R3                      ; 671D   0258
        CLRC                                    ; 671E   0006
        PULR    R7                              ; 671F   02B7

L_6720:
        PSHR    R5                              ; 6720   0275
        MOVR    R1,     R4                      ; 6721   008C
        ADDI    #$02B1, R4                      ; 6722   02FC 02B1
        ADDR    R3,     R4                      ; 6724   00DC
        MOVR    R1,     R2                      ; 6725   008A
        ADDI    #$00B0, R2                      ; 6726   02FA 00B0
        MVO@    R3,     R2                      ; 6728   0253
        SLR     R3,     1                       ; 6729   0063
        SLR     R3,     2                       ; 672A   0067
        MOVR    R1,     R5                      ; 672B   008D
        ADDI    #$00E3, R5                      ; 672C   02FD 00E3
        ADDR    R3,     R5                      ; 672E   00DD
        MVII    #$00FF, R0                      ; 672F   02B8 00FF
        MVO@    R0,     R5                      ; 6731   0268
        CLRR    R0                              ; 6732   01C0
        MVO@    R0,     R5                      ; 6733   0268
        MOVR    R1,     R5                      ; 6734   008D
        ADDI    #$0290, R5                      ; 6735   02FD 0290
        MVI@    R4,     R2                      ; 6737   02A2
        ADDR    R2,     R5                      ; 6738   00D5
        NEGR    R2                              ; 6739   0022
        ADD@    R4,     R2                      ; 673A   02E2
        MOVR    R2,     R4                      ; 673B   0094
        BEQ     L_6760                          ; 673C   0204 0022

L_673E:
        ADDI    #$0005, R0                      ; 673E   02F8 0005
        PSHR    R4                              ; 6740   0274
        PSHR    R0                              ; 6741   0270
        MVI@    R5,     R2                      ; 6742   02AA
        PSHR    R5                              ; 6743   0275

        JSR     R5,     L_5E4E                  ; 6744   0004 015C 024E

        PULR    R5                              ; 6747   02B5
        BC      L_675B                          ; 6748   0201 0011

        SDBD                                    ; 674A   0001
        MVII    #$5F0E, R4                      ; 674B   02BC 000E 005F
        ADDR    R3,     R4                      ; 674E   00DC
        ADD@    R4,     R2                      ; 674F   02E2
        ANDI    #$00FF, R2                      ; 6750   03BA 00FF
        MOVR    R1,     R4                      ; 6752   008C
        ADDI    #$00E3, R4                      ; 6753   02FC 00E3
        ADDR    R3,     R4                      ; 6755   00DC
        MVO@    R2,     R4                      ; 6756   0262
        MVI@    R4,     R0                      ; 6757   02A0
        INCR    R0                              ; 6758   0008
        DECR    R4                              ; 6759   0014
        MVO@    R0,     R4                      ; 675A   0260
L_675B:
        PULR    R0                              ; 675B   02B0
        PULR    R4                              ; 675C   02B4
        DECR    R4                              ; 675D   0014
        BNEQ    L_673E                          ; 675E   022C 0021

L_6760:
        MOVR    R1,     R4                      ; 6760   008C
        ADDI    #$02A1, R4                      ; 6761   02FC 02A1
        MOVR    R1,     R2                      ; 6763   008A
        ADDI    #$00B0, R2                      ; 6764   02FA 00B0
        ADD@    R2,     R4                      ; 6766   02D4
L_6767:
        MVI@    R4,     R2                      ; 6767   02A2
        CMPI    #$0006, R2                      ; 6768   037A 0006
        BEQ     L_6776                          ; 676A   0204 000A

        TSTR    R2                              ; 676C   0092
        BEQ     L_6776                          ; 676D   0204 0007

        SDBD                                    ; 676F   0001
        ADDI    #$5EDC, R2                      ; 6770   02FA 00DC 005E
        ADD@    R2,     R0                      ; 6773   02D0
        B       L_6767                          ; 6774   0220 000E

L_6776:
        MOVR    R1,     R4                      ; 6776   008C
        ADDI    #$00E0, R4                      ; 6777   02FC 00E0
        ADDR    R3,     R4                      ; 6779   00DC
        MVO@    R0,     R4                      ; 677A   0260
        SWAP    R0,     1                       ; 677B   0040
        MVO@    R0,     R4                      ; 677C   0260
        SWAP    R0,     1                       ; 677D   0040
        PULR    R7                              ; 677E   02B7

L_677F:
        PSHR    R5                              ; 677F   0275
        CLRR    R0                              ; 6780   01C0

        JSR     R5,     L_6788                  ; 6781   0004 0164 0388

        MVII    #$0040, R0                      ; 6784   02B8 0040
        B       L_678F                          ; 6786   0200 0007

L_6788:
        PSHR    R5                              ; 6788   0275
        B       L_678F                          ; 6789   0200 0004

L_678B:
        MOVR    R1,     R3                      ; 678B   008B
        ADDI    #$02B9, R3                      ; 678C   02FB 02B9
        MVI@    R3,     R0                      ; 678E   0298
L_678F:
        MOVR    R1,     R4                      ; 678F   008C
        ADDI    #$02A0, R4                      ; 6790   02FC 02A0
        ADDR    R0,     R4                      ; 6792   00C4
        MVI@    R4,     R5                      ; 6793   02A5
        CMPI    #$0006, R5                      ; 6794   037D 0006
        BEQ     L_67A3                          ; 6796   0204 000B

        TSTR    R5                              ; 6798   00AD
        BEQ     L_67A3                          ; 6799   0204 0008

        SUBI    #$0011, R4                      ; 679B   033C 0011
        MVI@    R4,     R2                      ; 679D   02A2

        JSR     R5,     L_67AF                  ; 679E   0004 0164 03AF

        B       L_678B                          ; 67A1   0220 0017
L_67A3:
        PULR    R7                              ; 67A3   02B7

L_67A4:
        MOVR    R1,     R4                      ; 67A4   008C
        ADDI    #$0100, R4                      ; 67A5   02FC 0100
        B       L_67AC                          ; 67A7   0200 0003

L_67A9:
        MOVR    R1,     R4                      ; 67A9   008C
        ADDI    #$0101, R4                      ; 67AA   02FC 0101
L_67AC:
        MVI@    R4,     R2                      ; 67AC   02A2
        B       L_67B4                          ; 67AD   0200 0005

L_67AF:
        CLRR    R3                              ; 67AF   01DB
        DECR    R3                              ; 67B0   0013
        B       L_67B4                          ; 67B1   0200 0001

L_67B3:
        CLRR    R3                              ; 67B3   01DB
L_67B4:
        PSHR    R5                              ; 67B4   0275
        MOVR    R2,     R4                      ; 67B5   0094
        ADDR    R1,     R2                      ; 67B6   00CA
        MOVR    R1,     R5                      ; 67B7   008D
        ADDI    #$02B5, R5                      ; 67B8   02FD 02B5
        MVII    #$0040, R0                      ; 67BA   02B8 0040
        AND@    R2,     R0                      ; 67BC   0390
        SLR     R0,     2                       ; 67BD   0064
        SLR     R0,     1                       ; 67BE   0060
        MVO@    R0,     R5                      ; 67BF   0268
        MVO@    R4,     R5                      ; 67C0   026C
        MOVR    R1,     R4                      ; 67C1   008C
        ADDI    #$029F, R4                      ; 67C2   02FC 029F
        ADD@    R2,     R4                      ; 67C4   02D4
        MVI@    R4,     R0                      ; 67C5   02A0
        MVO@    R0,     R5                      ; 67C6   0268
        MVO@    R3,     R5                      ; 67C7   026B
        MVI@    R2,     R3                      ; 67C8   0293
        MVO@    R3,     R5                      ; 67C9   026B
        SDBD                                    ; 67CA   0001
        MVII    #$5EA7, R5                      ; 67CB   02BD 00A7 005E
        PSHR    R5                              ; 67CE   0275
        DECR    R5                              ; 67CF   0015
        ADDR    R0,     R5                      ; 67D0   00C5
        MVI@    R5,     R4                      ; 67D1   02AC
        ADD@    R6,     R4                      ; 67D2   02F4
L_67D3:
        MVI@    R4,     R0                      ; 67D3   02A0
        TSTR    R0                              ; 67D4   0080
        BEQ     L_680F                          ; 67D5   0204 0038

        SWAP    R0,     1                       ; 67D7   0040
        TSTR    R0                              ; 67D8   0080
        BPL     L_67DD                          ; 67D9   0203 0002

        ADDI    #$00FF, R0                      ; 67DB   02F8 00FF
L_67DD:
        SWAP    R0,     1                       ; 67DD   0040
        MOVR    R1,     R5                      ; 67DE   008D
        ADDI    #$02B7, R5                      ; 67DF   02FD 02B7
        MVI@    R5,     R3                      ; 67E1   02AB
        CMPI    #$0004, R3                      ; 67E2   037B 0004
        BNC     L_67F3                          ; 67E4   0209 000D

        SUBI    #$0002, R5                      ; 67E6   033D 0002
        ADD@    R5,     R0                      ; 67E8   02E8
        MOVR    R0,     R2                      ; 67E9   0082
        ANDI    #$0088, R0                      ; 67EA   03B8 0088
        BNEQ    L_67D3                          ; 67EC   022C 001A

        JSR     R5,     L_6810                  ; 67EE   0004 0168 0010

        B       L_67D3                          ; 67F1   0220 001F

L_67F3:
        JSR     R5,     L_67F8                  ; 67F3   0004 0164 03F8

        B       L_67D3                          ; 67F6   0220 0024

L_67F8:
        PSHR    R5                              ; 67F8   0275
        MOVR    R1,     R5                      ; 67F9   008D
        ADDI    #$02B6, R5                      ; 67FA   02FD 02B6
        MVI@    R5,     R2                      ; 67FC   02AA
L_67FD:
        ADDR    R0,     R2                      ; 67FD   00C2
        MOVR    R2,     R3                      ; 67FE   0093
        ANDI    #$0088, R3                      ; 67FF   03BB 0088
        BNEQ    L_680F                          ; 6801   020C 000C

        PSHR    R0                              ; 6803   0270

        JSR     R5,     L_6810                  ; 6804   0004 0168 0010

        PULR    R0                              ; 6807   02B0
        PSHR    R2                              ; 6808   0272
        ADDR    R1,     R2                      ; 6809   00CA
        MVI@    R2,     R5                      ; 680A   0295
        PULR    R2                              ; 680B   02B2
        TSTR    R5                              ; 680C   00AD
        BEQ     L_67FD                          ; 680D   0224 0011
L_680F:
        PULR    R7                              ; 680F   02B7

L_6810:
        PSHR    R5                              ; 6810   0275
        PSHR    R4                              ; 6811   0274
        MOVR    R1,     R5                      ; 6812   008D
        ADDI    #$02B5, R5                      ; 6813   02FD 02B5
        MOVR    R1,     R3                      ; 6815   008B
        ADDI    #$0200, R3                      ; 6816   02FB 0200
        ADDR    R2,     R3                      ; 6818   00D3
        ADD@    R5,     R3                      ; 6819   02EB
        MVI@    R3,     R5                      ; 681A   029D
        PSHR    R3                              ; 681B   0273
        MOVR    R1,     R4                      ; 681C   008C
        ADDI    #$02B9, R4                      ; 681D   02FC 02B9
        MOVR    R4,     R3                      ; 681F   00A3
        SUBI    #$003A, R3                      ; 6820   033B 003A
        ADD@    R4,     R3                      ; 6822   02E3
        MVI@    R3,     R0                      ; 6823   0298
        COMR    R0                              ; 6824   0018
        ANDR    R0,     R5                      ; 6825   0185
        SUBI    #$0002, R4                      ; 6826   033C 0002
        MVI@    R4,     R0                      ; 6828   02A0
        AND@    R3,     R0                      ; 6829   0398
        XORR    R0,     R5                      ; 682A   01C5
        PULR    R3                              ; 682B   02B3
        MVO@    R5,     R3                      ; 682C   025D
        PULR    R4                              ; 682D   02B4
        PULR    R7                              ; 682E   02B7

L_682F:
        MOVR    R1,     R4                      ; 682F   008C
        ADDI    #$0100, R4                      ; 6830   02FC 0100
        MVI@    R4,     R2                      ; 6832   02A2
        B       L_6846                          ; 6833   0200 0011

L_6835:
        MOVR    R1,     R3                      ; 6835   008B
        ADDI    #$0102, R3                      ; 6836   02FB 0102
        MVI@    R3,     R2                      ; 6838   029A
        RSWD    R2                              ; 6839   003A
        BEQ     L_6840                          ; 683A   0204 0004

        DECR    R3                              ; 683C   0013
        MVI@    R3,     R2                      ; 683D   029A
        B       L_6846                          ; 683E   0200 0006
L_6840:
        MOVR    R5,     R7                      ; 6840   00AF

L_6841:
        CLRR    R0                              ; 6841   01C0
        B       L_6846                          ; 6842   0200 0002

L_6844:
        CLRR    R0                              ; 6844   01C0
        DECR    R0                              ; 6845   0010
L_6846:
        PSHR    R5                              ; 6846   0275
        MOVR    R1,     R5                      ; 6847   008D
        ADDI    #$02B5, R5                      ; 6848   02FD 02B5
        CLRR    R3                              ; 684A   01DB
        MVO@    R3,     R5                      ; 684B   026B
        MVO@    R2,     R5                      ; 684C   026A
        INCR    R5                              ; 684D   000D
        MVO@    R0,     R5                      ; 684E   0268

        JSR     R5,     L_685D                  ; 684F   0004 0168 005D

        MOVR    R1,     R5                      ; 6852   008D
        ADDI    #$02B5, R5                      ; 6853   02FD 02B5
        MVII    #$0008, R3                      ; 6855   02BB 0008
        MVO@    R3,     R5                      ; 6857   026B
        MVI@    R5,     R2                      ; 6858   02AA

        JSR     R5,     L_685D                  ; 6859   0004 0168 005D

        PULR    R7                              ; 685C   02B7

L_685D:
        PSHR    R5                              ; 685D   0275
        MOVR    R1,     R5                      ; 685E   008D
        ADDI    #$0200, R5                      ; 685F   02FD 0200
        ADDR    R2,     R5                      ; 6861   00D5
        ADDR    R3,     R5                      ; 6862   00DD
        MVI@    R5,     R0                      ; 6863   02A8
        SLL     R3,     2                       ; 6864   004F
        SLL     R3,     1                       ; 6865   004B
        ADDR    R1,     R3                      ; 6866   00CB
        ADDI    #$02B3, R3                      ; 6867   02FB 02B3
        AND@    R3,     R0                      ; 6869   0398
        BEQ     L_68B4                          ; 686A   0204 0048

        MOVR    R3,     R4                      ; 686C   009C
        SUBI    #$0001, R4                      ; 686D   033C 0001
        INCR    R3                              ; 686F   000B
        MVII    #$0080, R2                      ; 6870   02BA 0080
        AND@    R3,     R2                      ; 6872   039A
        SLL     R2,     1                       ; 6873   004A
        SWAP    R2,     1                       ; 6874   0042
        SUBR    R2,     R4                      ; 6875   0114
        MVI@    R4,     R2                      ; 6876   02A2
        MOVR    R1,     R3                      ; 6877   008B
        ADDI    #$02B9, R3                      ; 6878   02FB 02B9
        MOVR    R3,     R4                      ; 687A   009C
        MVO@    R2,     R4                      ; 687B   0262
        MVO@    R0,     R4                      ; 687C   0260
L_687D:
        MOVR    R3,     R4                      ; 687D   009C
        SUBI    #$003A, R3                      ; 687E   033B 003A
        ADD@    R4,     R3                      ; 6880   02E3
        MVI@    R3,     R0                      ; 6881   0298
        AND@    R4,     R0                      ; 6882   03A0
        BEQ     L_68AA                          ; 6883   0204 0025

        ADDI    #$0020, R3                      ; 6885   02FB 0020
        MVI@    R3,     R2                      ; 6887   029A
        CMPI    #$0004, R2                      ; 6888   037A 0004
        BC      L_68AA                          ; 688A   0201 001E

        MOVR    R1,     R5                      ; 688C   008D
        ADDI    #$02B6, R5                      ; 688D   02FD 02B6
        MVI@    R5,     R4                      ; 688F   02AC
        MVO@    R2,     R5                      ; 6890   026A
        MOVR    R4,     R2                      ; 6891   00A2
        SUBI    #$0010, R3                      ; 6892   033B 0010
        SUB@    R3,     R4                      ; 6894   031C
        MVII    #$0080, R3                      ; 6895   02BB 0080
        ANDR    R4,     R3                      ; 6897   01A3
        BEQ     L_689B                          ; 6898   0204 0001

        NEGR    R4                              ; 689A   0024
L_689B:
        SDBD                                    ; 689B   0001
        ADDI    #$5F2A, R4                      ; 689C   02FC 002A 005F
        MVI@    R4,     R0                      ; 689F   02A0
        TSTR    R0                              ; 68A0   0080
        BEQ     L_68AA                          ; 68A1   0204 0007

        TSTR    R3                              ; 68A3   009B
        BEQ     L_68A7                          ; 68A4   0204 0001

        NEGR    R0                              ; 68A6   0020

L_68A7:
        JSR     R5,     L_67F8                  ; 68A7   0004 0164 03F8

L_68AA:
        MOVR    R1,     R3                      ; 68AA   008B
        ADDI    #$02B9, R3                      ; 68AB   02FB 02B9
        MVI@    R3,     R0                      ; 68AD   0298
        DECR    R0                              ; 68AE   0010
        MVO@    R0,     R3                      ; 68AF   0258
        ANDI    #$003F, R0                      ; 68B0   03B8 003F
        BNEQ    L_687D                          ; 68B2   022C 0036
L_68B4:
        PULR    R7                              ; 68B4   02B7

L_68B5:
        PSHR    R5                              ; 68B5   0275
        CLRR    R3                              ; 68B6   01DB

        JSR     R5,     L_67A4                  ; 68B7   0004 0164 03A4

        MOVR    R1,     R2                      ; 68BA   008A
        ADDI    #$0102, R2                      ; 68BB   02FA 0102
        MVI@    R2,     R0                      ; 68BD   0290
        RSWD    R0                              ; 68BE   0038
        BNC     L_68C6                          ; 68BF   0209 0005

        JSR     R5,     L_69F7                  ; 68C1   0004 0168 01F7

        B       L_68DD                          ; 68C4   0200 0017
L_68C6:
        BOV     L_68DD                          ; 68C6   0202 0015

        ANDI    #$0003, R0                      ; 68C8   03B8 0003
        BEQ     L_68DD                          ; 68CA   0204 0011

        DECR    R0                              ; 68CC   0010
        BEQ     L_68D1                          ; 68CD   0204 0002

        MVII    #$0010, R0                      ; 68CF   02B8 0010
L_68D1:
        MOVR    R1,     R3                      ; 68D1   008B
        ADDI    #$0082, R3                      ; 68D2   02FB 0082
        MVI@    R3,     R5                      ; 68D4   029D
        ADDI    #$009E, R3                      ; 68D5   02FB 009E
        MVO@    R5,     R3                      ; 68D7   025D

        JSR     R5,     L_69C6                  ; 68D8   0004 0168 01C6

        B       L_68E7                          ; 68DB   0200 000A

L_68DD:
        CLRR    R0                              ; 68DD   01C0

        JSR     R5,     L_6835                  ; 68DE   0004 0168 0035
        JSR     R5,     L_6941                  ; 68E1   0004 0168 0141
        JSR     R5,     L_6958                  ; 68E4   0004 0168 0158

L_68E7:
        CLRR    R0                              ; 68E7   01C0
        DECR    R0                              ; 68E8   0010

        JSR     R5,     L_682F                  ; 68E9   0004 0168 002F

        CLRR    R3                              ; 68EC   01DB
        DECR    R3                              ; 68ED   0013

        JSR     R5,     L_67A9                  ; 68EE   0004 0164 03A9

        PULR    R7                              ; 68F1   02B7

L_68F2:
        PSHR    R5                              ; 68F2   0275
        CLRR    R3                              ; 68F3   01DB

        JSR     R5,     L_67A9                  ; 68F4   0004 0164 03A9

        MOVR    R1,     R3                      ; 68F7   008B
        ADDI    #$0102, R3                      ; 68F8   02FB 0102
        MVI@    R3,     R0                      ; 68FA   0298
        RSWD    R0                              ; 68FB   0038
        BNC     L_6903                          ; 68FC   0209 0005

        JSR     R5,     L_69F7                  ; 68FE   0004 0168 01F7

        B       L_691B                          ; 6901   0200 0018
L_6903:
        BOV     L_691B                          ; 6903   0202 0016

        ANDI    #$0003, R0                      ; 6905   03B8 0003
        BEQ     L_691B                          ; 6907   0204 0012

        DECR    R0                              ; 6909   0010
        BEQ     L_690E                          ; 690A   0204 0002

        MVII    #$0010, R0                      ; 690C   02B8 0010
L_690E:
        INCR    R0                              ; 690E   0008
        MOVR    R1,     R3                      ; 690F   008B
        ADDI    #$0082, R3                      ; 6910   02FB 0082
        MVI@    R3,     R5                      ; 6912   029D
        ADDI    #$009E, R3                      ; 6913   02FB 009E
        MVO@    R5,     R3                      ; 6915   025D

        JSR     R5,     L_69C6                  ; 6916   0004 0168 01C6

        B       L_691E                          ; 6919   0200 0003

L_691B:
        JSR     R5,     L_6958                  ; 691B   0004 0168 0158

L_691E:
        MOVR    R1,     R2                      ; 691E   008A
        ADDI    #$0101, R2                      ; 691F   02FA 0101
        MOVR    R1,     R3                      ; 6921   008B
        ADD@    R2,     R3                      ; 6922   02D3
        MVI@    R3,     R4                      ; 6923   029C
        INCR    R2                              ; 6924   000A
        MVI@    R2,     R0                      ; 6925   0290
        RSWD    R0                              ; 6926   0038
        BNC     L_692C                          ; 6927   0209 0003

        CLRR    R0                              ; 6929   01C0
        B       L_692E                          ; 692A   0200 0002

L_692C:
        INCR    R2                              ; 692C   000A
        MVI@    R2,     R0                      ; 692D   0290
L_692E:
        MVO@    R0,     R3                      ; 692E   0258

        JSR     R5,     L_694C                  ; 692F   0004 0168 014C

        CLRR    R0                              ; 6932   01C0

        JSR     R5,     L_682F                  ; 6933   0004 0168 002F

        CLRR    R0                              ; 6936   01C0
        DECR    R0                              ; 6937   0010

        JSR     R5,     L_6835                  ; 6938   0004 0168 0035

        CLRR    R3                              ; 693B   01DB
        DECR    R3                              ; 693C   0013

        JSR     R5,     L_67A4                  ; 693D   0004 0164 03A4

        PULR    R7                              ; 6940   02B7

L_6941:
        MOVR    R1,     R2                      ; 6941   008A
        ADDI    #$0100, R2                      ; 6942   02FA 0100
        MOVR    R1,     R3                      ; 6944   008B
        ADD@    R2,     R3                      ; 6945   02D3
        MVI@    R3,     R4                      ; 6946   029C
        CLRR    R0                              ; 6947   01C0
        MVO@    R0,     R3                      ; 6948   0258
        INCR    R2                              ; 6949   000A
        B       L_694F                          ; 694A   0200 0003

L_694C:
        MOVR    R1,     R2                      ; 694C   008A
        ADDI    #$0100, R2                      ; 694D   02FA 0100
L_694F:
        MOVR    R1,     R3                      ; 694F   008B
        ADD@    R2,     R3                      ; 6950   02D3
        MVO@    R4,     R3                      ; 6951   025C
        ADDR    R1,     R4                      ; 6952   00CC
        ADDI    #$028F, R4                      ; 6953   02FC 028F
        SUBR    R1,     R3                      ; 6955   010B
        MVO@    R3,     R4                      ; 6956   0263
        MOVR    R5,     R7                      ; 6957   00AF

L_6958:
        PSHR    R5                              ; 6958   0275
        MOVR    R1,     R3                      ; 6959   008B
        ADDI    #$0102, R3                      ; 695A   02FB 0102
        MVI@    R3,     R0                      ; 695C   0298
        RSWD    R0                              ; 695D   0038
        BNEQ    L_6978                          ; 695E   020C 0018

        MOVR    R1,     R2                      ; 6960   008A
        ADDI    #$0103, R2                      ; 6961   02FA 0103
        MOVR    R1,     R4                      ; 6963   008C
        ADDI    #$027F, R4                      ; 6964   02FC 027F
        ADD@    R2,     R4                      ; 6966   02D4
        MVI@    R4,     R5                      ; 6967   02A5
        MVII    #$0040, R3                      ; 6968   02BB 0040
        AND@    R2,     R3                      ; 696A   0393
        ADDR    R1,     R3                      ; 696B   00CB
        ADDI    #$02B3, R3                      ; 696C   02FB 02B3
        XOR@    R3,     R5                      ; 696E   03DD
        MVO@    R5,     R3                      ; 696F   025D
        MOVR    R4,     R3                      ; 6970   00A3
        ADDI    #$001F, R3                      ; 6971   02FB 001F
        MVI@    R3,     R5                      ; 6973   029D
        XORI    #$0080, R5                      ; 6974   03FD 0080
        MVO@    R5,     R3                      ; 6976   025D
        RSWD    R0                              ; 6977   0038
L_6978:
        BNOV    L_69C5                          ; 6978   020A 004B

        ANDI    #$0007, R0                      ; 697A   03B8 0007
        MOVR    R1,     R2                      ; 697C   008A
        ADDI    #$0101, R2                      ; 697D   02FA 0101
        MOVR    R1,     R3                      ; 697F   008B
        ADD@    R2,     R3                      ; 6980   02D3
        MOVR    R1,     R2                      ; 6981   008A
        ADDI    #$029F, R2                      ; 6982   02FA 029F
        ADD@    R3,     R2                      ; 6984   02DA
        PSHR    R2                              ; 6985   0272
        CMP@    R2,     R0                      ; 6986   0350
        BEQ     L_69A8                          ; 6987   0204 001F

        MVO@    R0,     R2                      ; 6989   0250
        MVII    #$0040, R2                      ; 698A   02BA 0040
        AND@    R3,     R2                      ; 698C   039A
        ADDR    R1,     R2                      ; 698D   00CA
        ADDI    #$02B4, R2                      ; 698E   02FA 02B4
        MVI@    R2,     R0                      ; 6990   0290
        RSWD    R0                              ; 6991   0038
        BPL     L_6999                          ; 6992   0203 0005

        MOVR    R1,     R4                      ; 6994   008C
        ADDI    #$0080, R4                      ; 6995   02FC 0080
        MVI@    R4,     R0                      ; 6997   02A0
        MVO@    R0,     R2                      ; 6998   0250
L_6999:
        SUBI    #$0003, R2                      ; 6999   033A 0003
        MVI@    R2,     R0                      ; 699B   0290
        ANDI    #$003F, R0                      ; 699C   03B8 003F
        MVII    #$0080, R3                      ; 699E   02BB 0080
L_69A0:
        SLR     R3,     1                       ; 69A0   0063
        DECR    R0                              ; 69A1   0010
        BNEQ    L_69A0                          ; 69A2   022C 0003

        MVI@    R2,     R0                      ; 69A4   0290
        INCR    R0                              ; 69A5   0008
        B       L_69C0                          ; 69A6   0200 0018

L_69A8:
        MVII    #$0006, R0                      ; 69A8   02B8 0006
        MVO@    R0,     R2                      ; 69AA   0250
        MVII    #$0040, R2                      ; 69AB   02BA 0040
        AND@    R3,     R2                      ; 69AD   039A
        ADDR    R1,     R2                      ; 69AE   00CA
        ADDI    #$02B4, R2                      ; 69AF   02FA 02B4
        MVI@    R2,     R0                      ; 69B1   0290
        MOVR    R1,     R4                      ; 69B2   008C
        ADDI    #$0080, R4                      ; 69B3   02FC 0080
        CMP@    R4,     R0                      ; 69B5   0360
        BNEQ    L_69BB                          ; 69B6   020C 0003

        CLRR    R0                              ; 69B8   01C0
        DECR    R0                              ; 69B9   0010
        MVO@    R0,     R2                      ; 69BA   0250
L_69BB:
        SUBI    #$0003, R2                      ; 69BB   033A 0003
        MVI@    R2,     R0                      ; 69BD   0290
        DECR    R0                              ; 69BE   0010
        CLRR    R3                              ; 69BF   01DB
L_69C0:
        MVO@    R0,     R2                      ; 69C0   0250
        PULR    R2                              ; 69C1   02B2
        SUBI    #$0020, R2                      ; 69C2   033A 0020
        MVO@    R3,     R2                      ; 69C4   0253
L_69C5:
        PULR    R7                              ; 69C5   02B7

L_69C6:
        PSHR    R5                              ; 69C6   0275
        SDBD                                    ; 69C7   0001
        MVII    #$5E88, R3                      ; 69C8   02BB 0088 005E
        ADDR    R0,     R3                      ; 69CB   00C3
        MOVR    R1,     R5                      ; 69CC   008D
        ADDI    #$0120, R5                      ; 69CD   02FD 0120
        ADD@    R5,     R3                      ; 69CF   02EB
        MVI@    R3,     R2                      ; 69D0   029A
        PSHR    R3                              ; 69D1   0273

        JSR     R5,     L_67B3                  ; 69D2   0004 0164 03B3

        PULR    R3                              ; 69D5   02B3
        MVI@    R3,     R2                      ; 69D6   029A
        ADDR    R1,     R2                      ; 69D7   00CA
        CLRR    R0                              ; 69D8   01C0
        MVI@    R2,     R4                      ; 69D9   0294
        MVO@    R0,     R2                      ; 69DA   0250
        INCR    R3                              ; 69DB   000B
        MVI@    R3,     R2                      ; 69DC   029A
        ADDR    R1,     R2                      ; 69DD   00CA
        MVO@    R4,     R2                      ; 69DE   0254
        MOVR    R1,     R3                      ; 69DF   008B
        ADDI    #$028F, R3                      ; 69E0   02FB 028F
        ADDR    R4,     R3                      ; 69E2   00E3
        SUBR    R1,     R2                      ; 69E3   010A
        MVO@    R2,     R3                      ; 69E4   025A
        MOVR    R1,     R3                      ; 69E5   008B
        ADDI    #$0101, R3                      ; 69E6   02FB 0101
        MVI@    R3,     R3                      ; 69E8   029B
        ADDR    R1,     R3                      ; 69E9   00CB
        MVI@    R3,     R0                      ; 69EA   0298
        TSTR    R0                              ; 69EB   0080
        BNEQ    L_69F3                          ; 69EC   020C 0005

        PSHR    R2                              ; 69EE   0272

        JSR     R5,     L_6941                  ; 69EF   0004 0168 0141

        PULR    R2                              ; 69F2   02B2

L_69F3:
        JSR     R5,     L_67AF                  ; 69F3   0004 0164 03AF

        PULR    R7                              ; 69F6   02B7

L_69F7:
        PSHR    R5                              ; 69F7   0275
        MOVR    R1,     R2                      ; 69F8   008A
        ADDI    #$0103, R2                      ; 69F9   02FA 0103
        MOVR    R1,     R3                      ; 69FB   008B
        ADDI    #$028F, R3                      ; 69FC   02FB 028F
        MVI@    R2,     R0                      ; 69FE   0290
        ADD@    R2,     R3                      ; 69FF   02D3
        MVI@    R3,     R2                      ; 6A00   029A
        ADDR    R1,     R2                      ; 6A01   00CA
        XOR@    R2,     R0                      ; 6A02   03D0
        MVO@    R0,     R2                      ; 6A03   0250
        SUBR    R1,     R2                      ; 6A04   010A
        TSTR    R0                              ; 6A05   0080
        BEQ     L_6A0C                          ; 6A06   0204 0004

        JSR     R5,     L_6841                  ; 6A08   0004 0168 0041

        PULR    R7                              ; 6A0B   02B7

L_6A0C:
        JSR     R5,     L_6844                  ; 6A0C   0004 0168 0044

        PULR    R7                              ; 6A0F   02B7

L_6A10:
        PSHR    R5                              ; 6A10   0275
        MOVR    R4,     R5                      ; 6A11   00A5
        ADDR    R0,     R5                      ; 6A12   00C5
        MVII    #$000A, R0                      ; 6A13   02B8 000A
L_6A15:
        MVI@    R4,     R2                      ; 6A15   02A2
        MVO@    R2,     R5                      ; 6A16   026A
        DECR    R0                              ; 6A17   0010
        BNEQ    L_6A15                          ; 6A18   022C 0004
        PULR    R7                              ; 6A1A   02B7

L_6A1B:
        PSHR    R5                              ; 6A1B   0275
        MOVR    R1,     R3                      ; 6A1C   008B
        ADDI    #$0080, R3                      ; 6A1D   02FB 0080
        MVI@    R3,     R0                      ; 6A1F   0298
        TSTR    R0                              ; 6A20   0080
        BNEQ    L_6A2F                          ; 6A21   020C 000C

        MOVR    R1,     R4                      ; 6A23   008C
        ADDI    #$0100, R4                      ; 6A24   02FC 0100
        MOVR    R1,     R5                      ; 6A26   008D
        ADDI    #$0084, R5                      ; 6A27   02FD 0084
L_6A29:
        MVI@    R4,     R0                      ; 6A29   02A0
        MVO@    R0,     R5                      ; 6A2A   0268
        MVI@    R4,     R0                      ; 6A2B   02A0
        MVO@    R0,     R5                      ; 6A2C   0268
        MVI@    R4,     R0                      ; 6A2D   02A0
        MVO@    R0,     R5                      ; 6A2E   0268
L_6A2F:
        PULR    R7                              ; 6A2F   02B7

L_6A30:
        PSHR    R5                              ; 6A30   0275
        MOVR    R1,     R5                      ; 6A31   008D
        ADDI    #$00F6, R5                      ; 6A32   02FD 00F6
        SDBD                                    ; 6A34   0001
        MVI@    R5,     R0                      ; 6A35   02A8
        MVO@    R0,     R5                      ; 6A36   0268
        SWAP    R0,     1                       ; 6A37   0040
        MVO@    R0,     R5                      ; 6A38   0268
        MVII    #$00FF, R0                      ; 6A39   02B8 00FF
        MOVR    R1,     R3                      ; 6A3B   008B
        ADDI    #$0081, R3                      ; 6A3C   02FB 0081
        MOVR    R1,     R4                      ; 6A3E   008C
        ADDI    #$015D, R4                      ; 6A3F   02FC 015D
        ADD@    R3,     R4                      ; 6A41   02DC
        MVO@    R0,     R4                      ; 6A42   0260
        MOVR    R1,     R4                      ; 6A43   008C
        ADDI    #$0100, R4                      ; 6A44   02FC 0100
        MVII    #$0030, R0                      ; 6A46   02B8 0030
        MOVR    R1,     R3                      ; 6A48   008B
        ADDI    #$0081, R3                      ; 6A49   02FB 0081
        ADD@    R3,     R0                      ; 6A4B   02D8

        JSR     R5,     L_6A10                  ; 6A4C   0004 0168 0210
        JSR     R5,     L_62B8                  ; 6A4F   0004 0160 02B8

        MOVR    R1,     R3                      ; 6A52   008B
        ADDI    #$0080, R3                      ; 6A53   02FB 0080
        MVI@    R3,     R0                      ; 6A55   0298
        INCR    R0                              ; 6A56   0008
        MVO@    R0,     R3                      ; 6A57   0258
        INCR    R3                              ; 6A58   000B
        MVI@    R3,     R0                      ; 6A59   0298
        ADDI    #$0010, R0                      ; 6A5A   02F8 0010
        MVO@    R0,     R3                      ; 6A5C   0258

        JSR     R5,     L_6B07                  ; 6A5D   0004 0168 0307

        PULR    R7                              ; 6A60   02B7

L_6A61:
        PSHR    R5                              ; 6A61   0275
        MOVR    R1,     R3                      ; 6A62   008B
        ADDI    #$0080, R3                      ; 6A63   02FB 0080
        MVI@    R3,     R0                      ; 6A65   0298
        DECR    R0                              ; 6A66   0010
        BMI     L_6AA5                          ; 6A67   020B 003C

        MVO@    R0,     R3                      ; 6A69   0258
        INCR    R3                              ; 6A6A   000B
        MVI@    R3,     R0                      ; 6A6B   0298
        SUBI    #$0010, R0                      ; 6A6C   0338 0010
        MVO@    R0,     R3                      ; 6A6E   0258
        MOVR    R1,     R4                      ; 6A6F   008C
        ADDI    #$0130, R4                      ; 6A70   02FC 0130
        ADDR    R0,     R4                      ; 6A72   00C4
        MOVR    R1,     R0                      ; 6A73   0088
        ADDI    #$0100, R0                      ; 6A74   02F8 0100
        SUBR    R4,     R0                      ; 6A76   0120

        JSR     R5,     L_6A10                  ; 6A77   0004 0168 0210
        JSR     R5,     L_62B8                  ; 6A7A   0004 0160 02B8
        JSR     R5,     L_68F2                  ; 6A7D   0004 0168 00F2

        MOVR    R1,     R5                      ; 6A80   008D
        ADDI    #$00F8, R5                      ; 6A81   02FD 00F8
        SDBD                                    ; 6A83   0001
        MVI@    R5,     R0                      ; 6A84   02A8
        MOVR    R1,     R4                      ; 6A85   008C
        ADDI    #$0108, R4                      ; 6A86   02FC 0108
        SDBD                                    ; 6A88   0001
        SUB@    R4,     R0                      ; 6A89   0320
        SUBI    #$0002, R5                      ; 6A8A   033D 0002
        MVO@    R0,     R5                      ; 6A8C   0268
        SWAP    R0,     1                       ; 6A8D   0040
        MVO@    R0,     R5                      ; 6A8E   0268
        MOVR    R1,     R3                      ; 6A8F   008B
        ADDI    #$0100, R3                      ; 6A90   02FB 0100
        MVI@    R3,     R3                      ; 6A92   029B
        ADDR    R1,     R3                      ; 6A93   00CB
        MVI@    R3,     R0                      ; 6A94   0298
        MOVR    R1,     R3                      ; 6A95   008B
        ADDI    #$00F0, R3                      ; 6A96   02FB 00F0
        MVO@    R0,     R3                      ; 6A98   0258
        INCR    R3                              ; 6A99   000B
        MOVR    R1,     R2                      ; 6A9A   008A
        ADDI    #$0103, R2                      ; 6A9B   02FA 0103
        MOVR    R1,     R4                      ; 6A9D   008C
        ADDI    #$028F, R4                      ; 6A9E   02FC 028F
        ADD@    R2,     R4                      ; 6AA0   02D4
        MVI@    R4,     R0                      ; 6AA1   02A0
        MVO@    R0,     R3                      ; 6AA2   0258
        CLRC                                    ; 6AA3   0006
        PULR    R7                              ; 6AA4   02B7

L_6AA5:
        SETC                                    ; 6AA5   0007
        PULR    R7                              ; 6AA6   02B7

L_6AA7:
        MOVR    R1,     R3                      ; 6AA7   008B
        ADDI    #$0102, R3                      ; 6AA8   02FB 0102
        MVI@    R3,     R0                      ; 6AAA   0298
        RSWD    R0                              ; 6AAB   0038
        BOV     L_6AB2                          ; 6AAC   0202 0004
        BEQ     L_6AD7                          ; 6AAE   0204 0027

        CLRR    R0                              ; 6AB0   01C0
        MOVR    R5,     R7                      ; 6AB1   00AF
L_6AB2:
        BNEQ    L_6AC0                          ; 6AB2   020C 000C

        PSHR    R5                              ; 6AB4   0275
        PSHR    R0                              ; 6AB5   0270

        JSR     R5,     L_6AD7                  ; 6AB6   0004 0168 02D7

        MOVR    R0,     R2                      ; 6AB9   0082
        PULR    R0                              ; 6ABA   02B0

        JSR     R5,     L_6AC0                  ; 6ABB   0004 0168 02C0

        ADDR    R2,     R0                      ; 6ABE   00D0
        PULR    R7                              ; 6ABF   02B7

L_6AC0:
        ANDI    #$0007, R0                      ; 6AC0   03B8 0007
        MOVR    R0,     R4                      ; 6AC2   0084
        MOVR    R1,     R3                      ; 6AC3   008B
        ADDI    #$0082, R3                      ; 6AC4   02FB 0082
        ADD@    R3,     R4                      ; 6AC6   02DC
        SDBD                                    ; 6AC7   0001
        ADDI    #$5EC7, R4                      ; 6AC8   02FC 00C7 005E
        MVI@    R4,     R0                      ; 6ACB   02A0
L_6ACC:
        SWAP    R0,     1                       ; 6ACC   0040
        TSTR    R0                              ; 6ACD   0080
        BPL     L_6AD2                          ; 6ACE   0203 0002

        ADDI    #$00FF, R0                      ; 6AD0   02F8 00FF
L_6AD2:
        SWAP    R0,     1                       ; 6AD2   0040
        SLL     R0,     2                       ; 6AD3   004C
        SLL     R0,     2                       ; 6AD4   004C
        SLL     R0,     1                       ; 6AD5   0048
        MOVR    R5,     R7                      ; 6AD6   00AF

L_6AD7:
        MOVR    R1,     R3                      ; 6AD7   008B
        ADDI    #$0082, R3                      ; 6AD8   02FB 0082
        MVI@    R3,     R0                      ; 6ADA   0298
        XORI    #$0008, R0                      ; 6ADB   03F8 0008
        MOVR    R1,     R3                      ; 6ADD   008B
        ADDI    #$0103, R3                      ; 6ADE   02FB 0103
        MVI@    R3,     R2                      ; 6AE0   029A
        ADDR    R1,     R2                      ; 6AE1   00CA
        ADDI    #$029F, R2                      ; 6AE2   02FA 029F
        MVI@    R2,     R2                      ; 6AE4   0292
        ANDI    #$0007, R2                      ; 6AE5   03BA 0007
        ADDR    R0,     R2                      ; 6AE7   00C2
        SDBD                                    ; 6AE8   0001
        ADDI    #$5ED4, R2                      ; 6AE9   02FA 00D4 005E
        MVI@    R2,     R0                      ; 6AEC   0290
        B       L_6ACC                          ; 6AED   0220 0022

L_6AEF:
        MOVR    R1,     R3                      ; 6AEF   008B
        ADDI    #$0105, R3                      ; 6AF0   02FB 0105
        CLRR    R0                              ; 6AF2   01C0
        MVO@    R0,     R3                      ; 6AF3   0258
        MOVR    R1,     R3                      ; 6AF4   008B
        ADDI    #$0082, R3                      ; 6AF5   02FB 0082
        MVI@    R3,     R0                      ; 6AF7   0298
        SLR     R0,     1                       ; 6AF8   0060
        SLR     R0,     2                       ; 6AF9   0064
        NEGR    R0                              ; 6AFA   0020
        MOVR    R1,     R4                      ; 6AFB   008C
        ADDI    #$0106, R4                      ; 6AFC   02FC 0106
        MVO@    R0,     R4                      ; 6AFE   0260
        MVO@    R0,     R4                      ; 6AFF   0260
        MOVR    R1,     R4                      ; 6B00   008C
        ADDI    #$0126, R4                      ; 6B01   02FC 0126
        COMR    R0                              ; 6B03   0018
        MVO@    R0,     R4                      ; 6B04   0260
        MVO@    R0,     R4                      ; 6B05   0260
        MOVR    R5,     R7                      ; 6B06   00AF

L_6B07:
        MOVR    R1,     R3                      ; 6B07   008B
        ADDI    #$0081, R3                      ; 6B08   02FB 0081
        MOVR    R1,     R4                      ; 6B0A   008C
        ADDI    #$0116, R4                      ; 6B0B   02FC 0116
        ADD@    R3,     R4                      ; 6B0D   02DC
        SDBD                                    ; 6B0E   0001
        MVI@    R4,     R0                      ; 6B0F   02A0
        MOVR    R1,     R4                      ; 6B10   008C
        ADDI    #$0106, R4                      ; 6B11   02FC 0106
        MVO@    R0,     R4                      ; 6B13   0260
        SWAP    R0,     1                       ; 6B14   0040
        MVO@    R0,     R4                      ; 6B15   0260
        MOVR    R5,     R7                      ; 6B16   00AF

L_6B17:
        PSHR    R5                              ; 6B17   0275

        JSR     R5,     L_6B34                  ; 6B18   0004 0168 0334
L_6B1B:
        JSR     R5,     L_5404                  ; 6B1B   0004 0154 0004

        BC      L_6B33                          ; 6B1E   0201 0013

        JSR     R5,     L_6B41                  ; 6B20   0004 0168 0341

        MOVR    R1,     R4                      ; 6B23   008C
        ADDI    #$0100, R4                      ; 6B24   02FC 0100
        MOVR    R1,     R5                      ; 6B26   008D
        ADDI    #$0084, R5                      ; 6B27   02FD 0084
        MVII    #$0003, R3                      ; 6B29   02BB 0003
L_6B2B:
        MVI@    R4,     R0                      ; 6B2B   02A0
        CMP@    R5,     R0                      ; 6B2C   0368
        BNEQ    L_6B1B                          ; 6B2D   022C 0013

        DECR    R3                              ; 6B2F   0013
        BNEQ    L_6B2B                          ; 6B30   022C 0006

        CLRC                                    ; 6B32   0006
L_6B33:
        PULR    R7                              ; 6B33   02B7

L_6B34:
        MVII    #$00D0, R1                      ; 6B34   02B9 00D0
        SWAP    R1,     1                       ; 6B36   0041
        MOVR    R1,     R3                      ; 6B37   008B
        ADDI    #$0105, R3                      ; 6B38   02FB 0105
        CLRR    R0                              ; 6B3A   01C0
        MVO@    R0,     R3                      ; 6B3B   0258
        MOVR    R1,     R3                      ; 6B3C   008B
        ADDI    #$030C, R3                      ; 6B3D   02FB 030C
        MVO@    R0,     R3                      ; 6B3F   0258
        MOVR    R5,     R7                      ; 6B40   00AF

L_6B41:
        MOVR    R1,     R3                      ; 6B41   008B
        ADDI    #$030C, R3                      ; 6B42   02FB 030C
        MVI@    R3,     R0                      ; 6B44   0298
        INCR    R0                              ; 6B45   0008
        MVO@    R0,     R3                      ; 6B46   0258
        MOVR    R5,     R7                      ; 6B47   00AF

L_6B48:
        PSHR    R5                              ; 6B48   0275
        CLRR    R0                              ; 6B49   01C0
        MOVR    R1,     R4                      ; 6B4A   008C
        ADDI    #$0090, R4                      ; 6B4B   02FC 0090
        MVO@    R0,     R4                      ; 6B4D   0260
        MVO@    R0,     R4                      ; 6B4E   0260
        MVO@    R0,     R4                      ; 6B4F   0260
        MVO@    R0,     R4                      ; 6B50   0260
        MOVR    R1,     R3                      ; 6B51   008B
        ADDI    #$0081, R3                      ; 6B52   02FB 0081
        MVI@    R3,     R2                      ; 6B54   029A
        CMPI    #$0080, R2                      ; 6B55   037A 0080
        BEQ     L_6BFC                          ; 6B57   0204 00A3

        MVII    #$00FF, R5                      ; 6B59   02BD 00FF
        ADDR    R1,     R2                      ; 6B5B   00CA
        ADDI    #$014D, R2                      ; 6B5C   02FA 014D
        MVO@    R5,     R2                      ; 6B5E   0255

        JSR     R5,     L_62B8                  ; 6B5F   0004 0160 02B8
        JSR     R5,     L_55E6                  ; 6B62   0004 0154 01E6

        BNC     L_6BD8                          ; 6B65   0209 0071

        MOVR    R1,     R4                      ; 6B67   008C
        ADDI    #$0082, R4                      ; 6B68   02FC 0082
        SDBD                                    ; 6B6A   0001
        MVII    #$5F0C, R3                      ; 6B6B   02BB 000C 005F
        ADD@    R4,     R3                      ; 6B6E   02E3
        MVII    #$0070, R0                      ; 6B6F   02B8 0070
        ADD@    R3,     R0                      ; 6B71   02D8

L_6B72:
        JSR     R5,     L_552E                  ; 6B72   0004 0154 012E

        BNC     L_6BE0                          ; 6B75   0209 0069

        MOVR    R1,     R3                      ; 6B77   008B
        ADDI    #$0101, R3                      ; 6B78   02FB 0101
        MVI@    R3,     R0                      ; 6B7A   0298
        SUBI    #$0010, R0                      ; 6B7B   0338 0010
        MVO@    R0,     R3                      ; 6B7D   0258
        BPL     L_6B72                          ; 6B7E   0223 000D

        JSR     R5,     L_54A8                  ; 6B80   0004 0154 00A8
L_6B83:
        JSR     R5,     L_54B9                  ; 6B83   0004 0154 00B9

        BC      L_6BE6                          ; 6B86   0201 005E

        JSR     R5,     L_54F4                  ; 6B88   0004 0154 00F4
        JSR     R5,     L_54FC                  ; 6B8B   0004 0154 00FC

        BC      L_6B83                          ; 6B8E   0221 000C

        MOVR    R1,     R3                      ; 6B90   008B
        ADDI    #$02FA, R3                      ; 6B91   02FB 02FA
        MVI@    R3,     R0                      ; 6B93   0298
        CMPI    #$0086, R0                      ; 6B94   0378 0086
        BC      L_6B9C                          ; 6B96   0201 0004

        CMPI    #$007A, R0                      ; 6B98   0378 007A
        BC      L_6B83                          ; 6B9A   0221 0018

L_6B9C:
        MOVR    R1,     R3                      ; 6B9C   008B
        ADDI    #$0093, R3                      ; 6B9D   02FB 0093
        MVI@    R3,     R0                      ; 6B9F   0298
        INCR    R0                              ; 6BA0   0008
        MVO@    R0,     R3                      ; 6BA1   0258
L_6BA2:
        MOVR    R1,     R4                      ; 6BA2   008C
        ADDI    #$02FA, R4                      ; 6BA3   02FC 02FA
        MVI@    R4,     R0                      ; 6BA5   02A0
        XORI    #$0080, R0                      ; 6BA6   03F8 0080
        MOVR    R1,     R2                      ; 6BA8   008A
        ADDI    #$0091, R2                      ; 6BA9   02FA 0091
        SUB@    R2,     R0                      ; 6BAB   0310
        BEQ     L_6BD1                          ; 6BAC   0204 0023

        MOVR    R1,     R3                      ; 6BAE   008B
        ADDI    #$0083, R3                      ; 6BAF   02FB 0083
        ADD@    R3,     R0                      ; 6BB1   02D8
        ADD@    R3,     R0                      ; 6BB2   02D8
        ANDI    #$0080, R0                      ; 6BB3   03B8 0080
        BNEQ    L_6BD1                          ; 6BB5   020C 001A

        MOVR    R1,     R3                      ; 6BB7   008B
        ADDI    #$0081, R3                      ; 6BB8   02FB 0081
        MOVR    R1,     R5                      ; 6BBA   008D
        ADDI    #$0100, R5                      ; 6BBB   02FD 0100
        MOVR    R1,     R4                      ; 6BBD   008C
        ADDI    #$014C, R4                      ; 6BBE   02FC 014C
        ADD@    R3,     R4                      ; 6BC0   02DC
        MVI@    R5,     R0                      ; 6BC1   02A8
        MVO@    R0,     R4                      ; 6BC2   0260
        MVI@    R5,     R0                      ; 6BC3   02A8
        MVO@    R0,     R4                      ; 6BC4   0260
        MOVR    R1,     R4                      ; 6BC5   008C
        ADDI    #$02FA, R4                      ; 6BC6   02FC 02FA
        MVI@    R4,     R0                      ; 6BC8   02A0
        MOVR    R1,     R3                      ; 6BC9   008B
        ADDI    #$0091, R3                      ; 6BCA   02FB 0091
        XORI    #$0080, R0                      ; 6BCC   03F8 0080
        MVO@    R0,     R3                      ; 6BCE   0258
        INCR    R3                              ; 6BCF   000B
        MVO@    R0,     R3                      ; 6BD0   0258

L_6BD1:
        JSR     R5,     L_54FC                  ; 6BD1   0004 0154 00FC

        BNC     L_6BA2                          ; 6BD4   0229 0033
        B       L_6B83                          ; 6BD6   0220 0054

L_6BD8:
        MVII    #$0080, R0                      ; 6BD8   02B8 0080
L_6BDA:
        MOVR    R1,     R3                      ; 6BDA   008B
        ADDI    #$0090, R3                      ; 6BDB   02FB 0090
        MVO@    R0,     R3                      ; 6BDD   0258
        B       L_6BFC                          ; 6BDE   0200 001C

L_6BE0:
        MOVR    R1,     R3                      ; 6BE0   008B
        ADDI    #$0102, R3                      ; 6BE1   02FB 0102
        MVI@    R3,     R0                      ; 6BE3   0298
        B       L_6BDA                          ; 6BE4   0220 000B

L_6BE6:
        MOVR    R1,     R3                      ; 6BE6   008B
        ADDI    #$0093, R3                      ; 6BE7   02FB 0093
        MVI@    R3,     R0                      ; 6BE9   0298
        TSTR    R0                              ; 6BEA   0080
        BEQ     L_6BFC                          ; 6BEB   0204 000F

        MOVR    R1,     R3                      ; 6BED   008B
        ADDI    #$0082, R3                      ; 6BEE   02FB 0082
        MVI@    R3,     R3                      ; 6BF0   029B
        TSTR    R3                              ; 6BF1   009B
        BEQ     L_6BF5                          ; 6BF2   0204 0001

        NEGR    R0                              ; 6BF4   0020
L_6BF5:
        MOVR    R1,     R3                      ; 6BF5   008B
        ADDI    #$0092, R3                      ; 6BF6   02FB 0092
        ADD@    R3,     R0                      ; 6BF8   02D8
        ANDI    #$00FF, R0                      ; 6BF9   03B8 00FF
        MVO@    R0,     R3                      ; 6BFB   0258

L_6BFC:
        JSR     R5,     L_62B8                  ; 6BFC   0004 0160 02B8

        PULR    R7                              ; 6BFF   02B7

        PSHR    R5                              ; 6C00   0275
L_6C01:
        MVI     G_016B, R2                      ; 6C01   0282 016B
        MVII    #$0002, R1                      ; 6C03   02B9 0002
        SWAP    R1,     1                       ; 6C05   0041
        ADDR    R1,     R2                      ; 6C06   00CA
        MVI@    R2,     R3                      ; 6C07   0293
        MVI     G_0169, R1                      ; 6C08   0281 0169
        ANDI    #$000F, R1                      ; 6C0A   03B9 000F
        CMPI    #$0007, R1                      ; 6C0C   0379 0007
        BEQ     L_6C15                          ; 6C0E   0204 0005

        TSTR    R1                              ; 6C10   0089
        BEQ     L_6C15                          ; 6C11   0204 0002
        B       L_6C1E                          ; 6C13   0200 0009

L_6C15:
        ANDI    #$0038, R3                      ; 6C15   03BB 0038
        CMPI    #$0030, R3                      ; 6C17   037B 0030
        BNEQ    L_6C1E                          ; 6C19   020C 0003

        MVO     R3,     G_0192                  ; 6C1B   0243 0192
        PULR    R7                              ; 6C1D   02B7

L_6C1E:
        MVII    #$0003, R0                      ; 6C1E   02B8 0003
        MVO     R0,     G_0168                  ; 6C20   0240 0168
L_6C22:
        PULR    R7                              ; 6C22   02B7

        PSHR    R5                              ; 6C23   0275
        MVO     R1,     G_0196                  ; 6C24   0241 0196
        MVO     R0,     G_0199                  ; 6C26   0240 0199
        CLRR    R0                              ; 6C28   01C0
        MVO     R0,     G_016F                  ; 6C29   0240 016F
        MVI     G_0199, R3                      ; 6C2B   0283 0199
        CMPI    #$0007, R3                      ; 6C2D   037B 0007
        BGE     L_6C52                          ; 6C2F   020D 0021

        MVI     G_0191, R4                      ; 6C31   0284 0191
        TSTR    R4                              ; 6C33   00A4
        BNEQ    L_6D11                          ; 6C34   020C 00DB

        MVI     G_0199, R3                      ; 6C36   0283 0199
        CMPI    #$0005, R3                      ; 6C38   037B 0005
        BGE     L_6C52                          ; 6C3A   020D 0016

        MVI     G_0192, R4                      ; 6C3C   0284 0192
        TSTR    R4                              ; 6C3E   00A4
        BEQ     L_6C22                          ; 6C3F   0224 001E

        MVI     G_0168, R4                      ; 6C41   0284 0168
        CMPI    #$0002, R4                      ; 6C43   037C 0002
        BNEQ    L_6C22                          ; 6C45   022C 0024

        MVI     G_0199, R4                      ; 6C47   0284 0199
        ADDI    #$0020, R4                      ; 6C49   02FC 0020
        MVO     R4,     G_0190                  ; 6C4B   0244 0190
        MVII    #$0003, R0                      ; 6C4D   02B8 0003
        MVO     R0,     G_0168                  ; 6C4F   0240 0168
        PULR    R7                              ; 6C51   02B7

L_6C52:
        SUBI    #$0007, R3                      ; 6C52   033B 0007
        INCR    R3                              ; 6C54   000B
        ADDR    R7,     R3                      ; 6C55   00FB
        ADD@    R3,     R7                      ; 6C56   02DF

        DECLE   $0005                           ; 6C57   0005

        MOVR    R0,     R6                      ; 6C58   0086
        ADCR    R6                              ; 6C59   002E
        ADDR    R3,     R5                      ; 6C5A   00DD
        RRC     R1,     2                       ; 6C5B   0075
        MVI     G_0196, R1                      ; 6C5C   0281 0196
        TSTR    R1                              ; 6C5E   0089
        BNEQ    L_6C6A                          ; 6C5F   020C 0009

        MVI     G_016D, R4                      ; 6C61   0284 016D
        XORI    #$0077, R4                      ; 6C63   03FC 0077
        MVO     R4,     G_016D                  ; 6C65   0244 016D
L_6C67:
        J       L_6320                          ; 6C67   0004 0360 0320

L_6C6A:
        MVO     R0,     G_016D                  ; 6C6A   0240 016D
        MVI     G_0191, R1                      ; 6C6C   0281 0191
        TSTR    R1                              ; 6C6E   0089
        BEQ     L_6CFD                          ; 6C6F   0204 008C

        MVO     R0,     G_018E                  ; 6C71   0240 018E

        JSR     R5,     L_600E                  ; 6C73   0004 0160 000E

        BNC     L_6C81                          ; 6C76   0209 0009

        JSR     R5,     X_PLAY_RAZZ2            ; 6C78   0004 011C 02BD

        MVII    #$02D0, R4                      ; 6C7B   02BC 02D0
        MVII    #$00FE, R1                      ; 6C7D   02B9 00FE
        MVO@    R1,     R4                      ; 6C7F   0261
        PULR    R7                              ; 6C80   02B7

L_6C81:
        CLRR    R0                              ; 6C81   01C0
        MVO     R0,     G_0191                  ; 6C82   0240 0191
        PULR    R7                              ; 6C84   02B7

        MVI     G_0196, R0                      ; 6C85   0280 0196
        TSTR    R0                              ; 6C87   0080
        BEQ     L_6CA8                          ; 6C88   0204 001E

        JSR     R5,     L_6084                  ; 6C8A   0004 0160 0084
        JSR     R5,     L_6FAA                  ; 6C8D   0004 016C 03AA

        SDBD                                    ; 6C90   0001
        MVII    #$D308, R3                      ; 6C91   02BB 0008 00D3
        MVI@    R3,     R0                      ; 6C94   0298
        DECR    R0                              ; 6C95   0010
        MVO@    R0,     R3                      ; 6C96   0258
L_6C97:
        B       L_6C67                          ; 6C97   0220 0031

L_6C99:
        JSR     R5,     L_60B9                  ; 6C99   0004 0160 00B9
        JSR     R5,     L_6FAA                  ; 6C9C   0004 016C 03AA

        SDBD                                    ; 6C9F   0001
        MVII    #$D308, R3                      ; 6CA0   02BB 0008 00D3
        MVI@    R3,     R0                      ; 6CA3   0298
        INCR    R0                              ; 6CA4   0008
        MVO@    R0,     R3                      ; 6CA5   0258
        B       L_6C97                          ; 6CA6   0220 0010

L_6CA8:
        MVO     R0,     G_018D                  ; 6CA8   0240 018D

        JSR     R5,     L_6009                  ; 6CAA   0004 0160 0009

        J       L_506A                          ; 6CAD   0004 0350 006A

L_6CB0:
        PSHR    R5                              ; 6CB0   0275
        CLRR    R1                              ; 6CB1   01C9
        MVII    #$000C, R0                      ; 6CB2   02B8 000C
        MVII    #$016E, R4                      ; 6CB4   02BC 016E

        JSR     R5,     X_FILL_MEM              ; 6CB6   0004 0114 0341
        JSR     R5,     L_6CC1                  ; 6CB9   0004 016C 00C1

        MVII    #$0001, R0                      ; 6CBC   02B8 0001
        MVO     R0,     G_018E                  ; 6CBE   0240 018E
        PULR    R7                              ; 6CC0   02B7

L_6CC1:
        PSHR    R5                              ; 6CC1   0275
        MVII    #$0014, R0                      ; 6CC2   02B8 0014
        MVI     .BTAB.00,R1                     ; 6CC4   0281 0200
        MVII    #$02DC, R4                      ; 6CC6   02BC 02DC

        JSR     R5,     X_FILL_MEM              ; 6CC8   0004 0114 0341

        PULR    R7                              ; 6CCB   02B7

        MVI     G_0196, R0                      ; 6CCC   0280 0196
        TSTR    R0                              ; 6CCE   0080
        BNEQ    L_6C99                          ; 6CCF   022C 0037

        MVI     G_015D, R4                      ; 6CD1   0284 015D
        INCR    R4                              ; 6CD3   000C
        MVO     R4,     G_015D                  ; 6CD4   0244 015D
        CMPI    #$0003, R4                      ; 6CD6   037C 0003
        BNEQ    L_6CDC                          ; 6CD8   020C 0002

        MVO     R0,     G_015D                  ; 6CDA   0240 015D
L_6CDC:
        PULR    R7                              ; 6CDC   02B7

        MVI     G_0196, R4                      ; 6CDD   0284 0196
        TSTR    R4                              ; 6CDF   00A4
        BNEQ    L_6CEF                          ; 6CE0   020C 000D

        MVI     G_018F, R0                      ; 6CE2   0280 018F
        XORI    #$0001, R0                      ; 6CE4   03F8 0001
        MVO     R0,     G_018F                  ; 6CE6   0240 018F
        MVI     G_019C, R1                      ; 6CE8   0281 019C
        XORI    #$0007, R1                      ; 6CEA   03F9 0007
        MVO     R1,     G_019C                  ; 6CEC   0241 019C
        PULR    R7                              ; 6CEE   02B7

L_6CEF:
        JSR     R5,     L_6CC1                  ; 6CEF   0004 016C 00C1

        MVI     G_0193, R0                      ; 6CF2   0280 0193
        INCR    R0                              ; 6CF4   0008
        CMPI    #$0003, R0                      ; 6CF5   0378 0003
        BNEQ    L_6CFA                          ; 6CF7   020C 0001

        CLRR    R0                              ; 6CF9   01C0
L_6CFA:
        MVO     R0,     G_0193                  ; 6CFA   0240 0193
        PULR    R7                              ; 6CFC   02B7

L_6CFD:
        JSR     R5,     L_6202                  ; 6CFD   0004 0160 0202
        JSR     R5,     L_6CB0                  ; 6D00   0004 016C 00B0

        MVII    #$0001, R0                      ; 6D03   02B8 0001
        MVO     R0,     G_0191                  ; 6D05   0240 0191
        DECR    R0                              ; 6D07   0010
        MVO     R0,     G_0192                  ; 6D08   0240 0192
        SDBD                                    ; 6D0A   0001
        MVII    #$D308, R4                      ; 6D0B   02BC 0008 00D3
        MVO@    R0,     R4                      ; 6D0E   0260
        B       L_6C67                          ; 6D0F   0220 00A9

L_6D11:
        JSR     R5,     L_50D2                  ; 6D11   0004 0150 00D2
        JSR     R5,     L_6E7D                  ; 6D14   0004 016C 027D
        JSR     R5,     L_6EBB                  ; 6D17   0004 016C 02BB

        MVI     G_0199, R1                      ; 6D1A   0281 0199
        MOVR    R1,     R5                      ; 6D1C   008D
        SLL     R1,     2                       ; 6D1D   004D
        SLL     R1,     1                       ; 6D1E   0049
        MVI@    R2,     R0                      ; 6D1F   0290
        ANDI    #$0038, R0                      ; 6D20   03B8 0038
        CMPR    R0,     R1                      ; 6D22   0141
        BNEQ    L_6D27                          ; 6D23   020C 0002

        ADDI    #$0008, R5                      ; 6D25   02FD 0008
L_6D27:
        SDBD                                    ; 6D27   0001
        MVII    #$D008, R4                      ; 6D28   02BC 0008 00D0
        MVI     G_0197, R0                      ; 6D2B   0280 0197
        ADDR    R0,     R4                      ; 6D2D   00C4
        MVO@    R5,     R4                      ; 6D2E   0265
        CLRR    R0                              ; 6D2F   01C0
        MVO     R0,     G_018D                  ; 6D30   0240 018D
        B       L_6C97                          ; 6D32   0220 009C

        MVI     G_0196, R0                      ; 6D34   0280 0196
        TSTR    R0                              ; 6D36   0080
        BNEQ    L_6D3C                          ; 6D37   020C 0003
        J       L_6D8F                          ; 6D39   0004 036C 018F

L_6D3C:
        MVII    #$0080, R0                      ; 6D3C   02B8 0080
        SDBD                                    ; 6D3E   0001
        MVII    #$D008, R4                      ; 6D3F   02BC 0008 00D0

        JSR     R5,     X_FILL_ZERO             ; 6D42   0004 0114 0338

        B       L_6C67                          ; 6D45   0220 00DF

L_6D47:
        PSHR    R5                              ; 6D47   0275
        MVI     G_0197, R2                      ; 6D48   0282 0197
        MOVR    R2,     R3                      ; 6D4A   0093
        ANDI    #$0007, R3                      ; 6D4B   03BB 0007
        COMR    R3                              ; 6D4D   001B
        ANDI    #$0007, R3                      ; 6D4E   03BB 0007
        ADDI    #$0003, R3                      ; 6D50   02FB 0003
        MVO     R3,     G_0166                  ; 6D52   0243 0166
        ANDI    #$0070, R2                      ; 6D54   03BA 0070
        SLR     R2,     2                       ; 6D56   0066
        SLR     R2,     2                       ; 6D57   0066
        ADDI    #$0008, R2                      ; 6D58   02FA 0008
        MVO     R2,     G_0165                  ; 6D5A   0242 0165
L_6D5C:
        PULR    R7                              ; 6D5C   02B7

        PSHR    R5                              ; 6D5D   0275
        CMPI    #$0001, R0                      ; 6D5E   0378 0001
        BNEQ    L_6D5C                          ; 6D60   022C 0005

        MVI     G_0326, R0                      ; 6D62   0280 0326
        TSTR    R0                              ; 6D64   0080
        BEQ     L_6D5C                          ; 6D65   0224 000A

        MVI     G_016A, R0                      ; 6D67   0280 016A
        MVO     R0,     G_0197                  ; 6D69   0240 0197
        MVII    #$0001, R0                      ; 6D6B   02B8 0001

        JSR     R5,     .EXEC.6D5               ; 6D6D   0004 0114 02D5

        B       L_6E51                          ; 6D70   0200 00DF

L_6D72:
        PSHR    R5                              ; 6D72   0275

        JSR     R5,     L_6EAD                  ; 6D73   0004 016C 02AD

        MVI     G_0169, R0                      ; 6D76   0280 0169
        MVO     R0,     G_0197                  ; 6D78   0240 0197
        MVI     G_016A, R0                      ; 6D7A   0280 016A
        MVO     R0,     G_0198                  ; 6D7C   0240 0198

        JSR     R5,     L_6E35                  ; 6D7E   0004 016C 0235

        SDBD                                    ; 6D81   0001
        MVII    #$D308, R2                      ; 6D82   02BA 0008 00D3
        MVI@    R2,     R3                      ; 6D85   0293
        DECR    R3                              ; 6D86   0013
        MVO@    R3,     R2                      ; 6D87   0253
        MVII    #$0001, R0                      ; 6D88   02B8 0001
        MVO     R0,     G_0168                  ; 6D8A   0240 0168
        J       L_6320                          ; 6D8C   0004 0360 0320

L_6D8F:
        SDBD                                    ; 6D8F   0001
        MVII    #$D11E, R3                      ; 6D90   02BB 001E 00D1
        MVI@    R3,     R0                      ; 6D93   0298
        INCR    R0                              ; 6D94   0008
        CMPI    #$0009, R0                      ; 6D95   0378 0009
        BNEQ    L_6D9B                          ; 6D97   020C 0002

        CLRR    R0                              ; 6D99   01C0
        INCR    R0                              ; 6D9A   0008
L_6D9B:
        MVO@    R0,     R3                      ; 6D9B   0258
        PULR    R7                              ; 6D9C   02B7

        PSHR    R5                              ; 6D9D   0275
        CMPI    #$0001, R0                      ; 6D9E   0378 0001
        BNEQ    L_6D5C                          ; 6DA0   022C 0045

        MVI     .BTAB.01,R0                     ; 6DA2   0280 0201
        MVO     R0,     .BTAB.26                ; 6DA4   0240 0226

        JSR     R5,     .EXEC.A61               ; 6DA6   0004 0118 0261

        ADCR    R0                              ; 6DA9   0028
L_6DAA:
        CLRR    R0                              ; 6DAA   01C0
        DECLE   $0001,  $02BC,  $000D,  $00D3   ; 6DAB   0001 02BC 000D 00D3
        DECLE   $0260,  $0280,  $0168,  $0378   ; 6DAF   0260 0280 0168 0378
        DECLE   $0003,  $020C,  $000A,  $0001   ; 6DB3   0003 020C 000A 0001
        DECLE   $02BB,  $0008,  $00D3,  $0298   ; 6DB7   02BB 0008 00D3 0298
        DECLE   $0008,  $0258,  $0004,  $0150   ; 6DBB   0008 0258 0004 0150
        DECLE   $0177                           ; 6DBF   0177

        MVI     G_0168, R0                      ; 6DC0   0280 0168
        CMPI    #$0001, R0                      ; 6DC2   0378 0001
        BEQ     L_6D5C                          ; 6DC4   0224 0069

        MVI     G_015D, R1                      ; 6DC6   0281 015D
        CMPI    #$0001, R1                      ; 6DC8   0379 0001
        BNEQ    L_6DCF                          ; 6DCA   020C 0003

        MVO     R1,     G_0168                  ; 6DCC   0241 0168
        PULR    R7                              ; 6DCE   02B7

L_6DCF:
        MVII    #$0006, R0                      ; 6DCF   02B8 0006
        MVO     R0,     G_0168                  ; 6DD1   0240 0168

        JSR     R5,     L_6ECB                  ; 6DD3   0004 016C 02CB
        JSR     R5,     .EXEC.A61               ; 6DD6   0004 0118 0261
        DECLE   $0004                           ; 6DD9   0004

        MVII    #$0001, R0                      ; 6DDA   02B8 0001
        MVO     R0,     G_016E                  ; 6DDC   0240 016E

        JSR     R5,     L_6038                  ; 6DDE   0004 0160 0038

        GSWD    R3                              ; 6DE1   0033
        MVII    #$00A0, R1                      ; 6DE2   02B9 00A0
        MVO     R1,     G_0102                  ; 6DE4   0241 0102
        MVO     R1,     G_016E                  ; 6DE6   0241 016E
        RSWD    R3                              ; 6DE8   003B
        BNC     L_6DF9                          ; 6DE9   0209 000E

        JSR     R5,     X_PLAY_RAZZ2            ; 6DEB   0004 011C 02BD

        MVII    #$0146, R0                      ; 6DEE   02B8 0146
        MVO     R0,     .BTAB.26                ; 6DF0   0240 0226
        INCR    R0                              ; 6DF2   0008
        MVO     R0,     G_018E                  ; 6DF3   0240 018E
L_6DF5:
        INCR    R0                              ; 6DF5   0008
        BNEQ    L_6DF5                          ; 6DF6   022C 0002
        PULR    R7                              ; 6DF8   02B7

L_6DF9:
        MVI     G_0193, R0                      ; 6DF9   0280 0193
        CMPI    #$0001, R0                      ; 6DFB   0378 0001
        BNEQ    L_6E0E                          ; 6DFD   020C 000F

        MVII    #$00A0, R0                      ; 6DFF   02B8 00A0
        MVO     R0,     G_0102                  ; 6E01   0240 0102

        JSR     R5,     L_6FAA                  ; 6E03   0004 016C 03AA
        JSR     R5,     .EXEC.A61               ; 6E06   0004 0118 0261

        COMR    R6                              ; 6E09   001E
        MVII    #$0080, R0                      ; 6E0A   02B8 0080
        MVO     R0,     G_0102                  ; 6E0C   0240 0102
L_6E0E:
        SDBD                                    ; 6E0E   0001
        MVII    #$D0FA, R4                      ; 6E0F   02BC 00FA 00D0
        MVI@    R4,     R3                      ; 6E12   02A3
        MVO     R3,     G_016A                  ; 6E13   0243 016A
        MVI@    R4,     R3                      ; 6E15   02A3
        MVO     R3,     G_0169                  ; 6E16   0243 0169

        JSR     R5,     L_6EAD                  ; 6E18   0004 016C 02AD
        JSR     R5,     L_6FAA                  ; 6E1B   0004 016C 03AA
        JSR     R5,     .EXEC.A61               ; 6E1E   0004 0118 0261

        NEGR    R3                              ; 6E21   0023
        MVII    #$00F0, R0                      ; 6E22   02B8 00F0
        SWAP    R0,     1                       ; 6E24   0040

        JSR     R5,     L_50E1                  ; 6E25   0004 0150 00E1

        MVI     G_0169, R0                      ; 6E28   0280 0169
        MVO     R0,     G_0198                  ; 6E2A   0240 0198
        MVI     G_016A, R0                      ; 6E2C   0280 016A
        MVO     R0,     G_0197                  ; 6E2E   0240 0197
        MVII    #$0005, R0                      ; 6E30   02B8 0005
        MVO     R0,     G_0168                  ; 6E32   0240 0168
        INCR    R7                              ; 6E34   000F

L_6E35:
        PSHR    R5                              ; 6E35   0275

L_6E36:
        JSR     R5,     L_6D47                  ; 6E36   0004 016C 0147
        JSR     R5,     L_6EBB                  ; 6E39   0004 016C 02BB
        JSR     R5,     L_51DC                  ; 6E3C   0004 0150 01DC
        JSR     R5,     L_6E62                  ; 6E3F   0004 016C 0262

        MVO     R3,     G_0328                  ; 6E42   0243 0328
        MVO     R2,     G_0327                  ; 6E44   0242 0327

        JSR     R5,     L_6FBA                  ; 6E46   0004 016C 03BA
        JSR     R5,     .EXEC.A61               ; 6E49   0004 0118 0261

        DECR    R4                              ; 6E4C   0014
        MVI     G_0198, R0                      ; 6E4D   0280 0198
        MVO     R0,     G_0197                  ; 6E4F   0240 0197

L_6E51:
        JSR     R5,     L_6D47                  ; 6E51   0004 016C 0147
        JSR     R5,     L_6E62                  ; 6E54   0004 016C 0262
        JSR     R5,     X_PACK_BYTES            ; 6E57   0004 0114 034F

        MOVR    R0,     R2                      ; 6E5A   0082
        MVII    #$0015, R3                      ; 6E5B   02BB 0015
        MVII    #$0325, R1                      ; 6E5D   02B9 0325
        J       .EXEC.9A9                       ; 6E5F   0004 0318 01A9

L_6E62:
        PSHR    R5                              ; 6E62   0275
        MVI     G_0166, R1                      ; 6E63   0281 0166
        SLL     R1,     2                       ; 6E65   004D
        SLL     R1,     1                       ; 6E66   0049
        MOVR    R1,     R3                      ; 6E67   008B
        SWAP    R3,     1                       ; 6E68   0043
        MVI     G_0165, R0                      ; 6E69   0280 0165
        SLL     R0,     2                       ; 6E6B   004C
        SLL     R0,     1                       ; 6E6C   0048
        MOVR    R0,     R2                      ; 6E6D   0082
        SWAP    R2,     1                       ; 6E6E   0042
        PULR    R7                              ; 6E6F   02B7

        PSHR    R5                              ; 6E70   0275

        JSR     R5,     L_6FBA                  ; 6E71   0004 016C 03BA
        JSR     R5,     L_6D47                  ; 6E74   0004 016C 0147
        JSR     R5,     L_6EBB                  ; 6E77   0004 016C 02BB

        J       L_525E                          ; 6E7A   0004 0350 025E

L_6E7D:
        PSHR    R5                              ; 6E7D   0275
        MVI     G_0166, R2                      ; 6E7E   0282 0166
        SUBI    #$0003, R2                      ; 6E80   033A 0003
        COMR    R2                              ; 6E82   001A
        ANDI    #$0007, R2                      ; 6E83   03BA 0007
        MVI     G_0165, R3                      ; 6E85   0283 0165
        SUBI    #$0008, R3                      ; 6E87   033B 0008
        SLL     R3,     2                       ; 6E89   004F
        SLL     R3,     2                       ; 6E8A   004F
        ADDR    R2,     R3                      ; 6E8B   00D3
        MVO     R3,     G_0197                  ; 6E8C   0243 0197
        PULR    R7                              ; 6E8E   02B7

        SWAP    R3,     1                       ; 6E8F   0043
        RSWD    R0                              ; 6E90   0038
        GSWD    R1                              ; 6E91   0031
        SLL     R1,     2                       ; 6E92   004D
        SWAP    R1,     1                       ; 6E93   0041
        RLC     R0,     2                       ; 6E94   0054
        RLC     R0,     2                       ; 6E95   0054
        SWAP    R1,     2                       ; 6E96   0045
        SLL     R0,     2                       ; 6E97   004C
L_6E98:
        PSHR    R5                              ; 6E98   0275

        JSR     R5,     .EXEC.7C1               ; 6E99   0004 0114 03C1

        MOVR    R1,     R3                      ; 6E9C   008B
        ANDI    #$0007, R1                      ; 6E9D   03B9 0007
        BEQ     L_6EAC                          ; 6E9F   0204 000B

        MVII    #$017C, R2                      ; 6EA1   02BA 017C
        ADDR    R3,     R2                      ; 6EA3   00DA
        MVI@    R2,     R3                      ; 6EA4   0293
        INCR    R3                              ; 6EA5   000B
        MVO@    R3,     R2                      ; 6EA6   0253
        MVI     G_018D, R3                      ; 6EA7   0283 018D
        INCR    R3                              ; 6EA9   000B
        MVO     R3,     G_018D                  ; 6EAA   0243 018D
L_6EAC:
        PULR    R7                              ; 6EAC   02B7

L_6EAD:
        PSHR    R5                              ; 6EAD   0275
        MVI     G_016D, R0                      ; 6EAE   0280 016D
        MVI     G_016A, R1                      ; 6EB0   0281 016A
        MVI     G_0169, R2                      ; 6EB2   0282 0169
        XORR    R0,     R1                      ; 6EB4   01C1
        XORR    R0,     R2                      ; 6EB5   01C2
        MVO     R1,     G_016A                  ; 6EB6   0241 016A
        MVO     R2,     G_0169                  ; 6EB8   0242 0169
        PULR    R7                              ; 6EBA   02B7

L_6EBB:
        PSHR    R5                              ; 6EBB   0275
        MVI     G_0166, R0                      ; 6EBC   0280 0166
        DECR    R0                              ; 6EBE   0010
        MVII    #$0014, R1                      ; 6EBF   02B9 0014

        JSR     R5,     X_MPY                   ; 6EC1   0004 011C 01DC

        MVI     G_0165, R0                      ; 6EC4   0280 0165
        DECR    R0                              ; 6EC6   0010
        ADDR    R0,     R2                      ; 6EC7   00C2
        ADDI    #$0200, R2                      ; 6EC8   02FA 0200
        PULR    R7                              ; 6ECA   02B7

L_6ECB:
        PSHR    R5                              ; 6ECB   0275
        MVI     G_0325, R1                      ; 6ECC   0281 0325
        XORI    #$0001, R1                      ; 6ECE   03F9 0001
        MVO     R1,     G_0325                  ; 6ED0   0241 0325
        MVII    #$0202, R4                      ; 6ED2   02BC 0202
        MVI     G_015D, R1                      ; 6ED4   0281 015D
        MOVR    R1,     R5                      ; 6ED6   008D
        ANDI    #$0002, R1                      ; 6ED7   03B9 0002
        BNEQ    L_6EDF                          ; 6ED9   020C 0004

        MVII    #$0187, R2                      ; 6EDB   02BA 0187
        B       L_6EE1                          ; 6EDD   0200 0002

L_6EDF:
        MVII    #$011F, R2                      ; 6EDF   02BA 011F
L_6EE1:
        MVI     G_019C, R3                      ; 6EE1   0283 019C
        XORR    R3,     R2                      ; 6EE3   01DA
        MVO@    R2,     R4                      ; 6EE4   0262
        SDBD                                    ; 6EE5   0001
        MVII    #$083E, R2                      ; 6EE6   02BA 003E 0008
        MVO@    R2,     R4                      ; 6EE9   0262
        ANDI    #$0001, R5                      ; 6EEA   03BD 0001
        BEQ     L_6EF2                          ; 6EEC   0204 0004

        MVII    #$0180, R2                      ; 6EEE   02BA 0180
        B       L_6EF4                          ; 6EF0   0200 0002

L_6EF2:
        MVII    #$0118, R2                      ; 6EF2   02BA 0118
L_6EF4:
        XORR    R3,     R2                      ; 6EF4   01DA
        MVO@    R2,     R4                      ; 6EF5   0262
        SDBD                                    ; 6EF6   0001
        MVII    #$D11E, R3                      ; 6EF7   02BB 001E 00D1
        MVI@    R3,     R0                      ; 6EFA   0298
        MVII    #$0001, R1                      ; 6EFB   02B9 0001
        MVII    #$0225, R4                      ; 6EFD   02BC 0225
        CLRR    R3                              ; 6EFF   01DB

        JSR     R5,     X_PRNUM_RGT             ; 6F00   0004 0118 00C5

        SDBD                                    ; 6F03   0001
        MVII    #$D308, R2                      ; 6F04   02BA 0008 00D3
        MVI@    R2,     R0                      ; 6F07   0290
        CMPI    #$00FF, R0                      ; 6F08   0378 00FF
        BNEQ    L_6F0E                          ; 6F0A   020C 0002

        INCR    R0                              ; 6F0C   0008
        MVO@    R0,     R2                      ; 6F0D   0250
L_6F0E:
        SLR     R0,     1                       ; 6F0E   0060
        ADDI    #$0001, R0                      ; 6F0F   02F8 0001
        MVII    #$0003, R1                      ; 6F11   02B9 0003
        MVII    #$0216, R4                      ; 6F13   02BC 0216

        JSR     R5,     X_PRNUM_RGT             ; 6F15   0004 0118 00C5

        MVI     G_0191, R0                      ; 6F18   0280 0191
        TSTR    R0                              ; 6F1A   0080
        BEQ     L_6F24                          ; 6F1B   0204 0007

        MVII    #$0006, R3                      ; 6F1D   02BB 0006
        MOVR    R7,     R1                      ; 6F1F   00B9
        ADDI    #$0063, R1                      ; 6F20   02F9 0063
        B       L_6F31                          ; 6F22   0200 000D

L_6F24:
        SDBD                                    ; 6F24   0001
        MVII    #$D0FD, R3                      ; 6F25   02BB 00FD 00D0
        MVI@    R3,     R0                      ; 6F28   0298
        TSTR    R0                              ; 6F29   0080
        BNEQ    L_6F7D                          ; 6F2A   020C 0051

        MVII    #$0007, R3                      ; 6F2C   02BB 0007
        MOVR    R7,     R1                      ; 6F2E   00B9
        ADDI    #$0060, R1                      ; 6F2F   02F9 0060
L_6F31:
        MVII    #$0208, R4                      ; 6F31   02BC 0208
        MOVR    R3,     R2                      ; 6F33   009A

        JSR     R5,     X_PRINT_R1              ; 6F34   0004 0118 0067

        MVI     G_018F, R3                      ; 6F37   0283 018F
        TSTR    R3                              ; 6F39   009B
        BNEQ    L_6F5E                          ; 6F3A   020C 0022

        MVI     G_031D, R3                      ; 6F3C   0283 031D
        SWAP    R3,     1                       ; 6F3E   0043
        SDBD                                    ; 6F3F   0001
        ANDI    #$FFEF, R3                      ; 6F40   03BB 00EF 00FF
        MVI     G_0168, R1                      ; 6F43   0281 0168
        CMPI    #$0003, R1                      ; 6F45   0379 0003
        BGT     L_6F52                          ; 6F47   020E 0009

        XORI    #$0010, R3                      ; 6F49   03FB 0010
        MVI     G_016F, R5                      ; 6F4B   0285 016F
        TSTR    R5                              ; 6F4D   00AD
        BNEQ    L_6F52                          ; 6F4E   020C 0002

        XORI    #$0007, R2                      ; 6F50   03FA 0007
L_6F52:
        SWAP    R3,     1                       ; 6F52   0043
        MVO     R3,     G_031D                  ; 6F53   0243 031D
        MVI     G_019C, R0                      ; 6F55   0280 019C
        CMPR    R0,     R2                      ; 6F57   0142
        BEQ     L_6F5E                          ; 6F58   0204 0004

        XORI    #$0007, R0                      ; 6F5A   03F8 0007
        MVO     R0,     G_019C                  ; 6F5C   0240 019C
L_6F5E:
        MVI     G_018F, R0                      ; 6F5E   0280 018F
        TSTR    R0                              ; 6F60   0080
        BEQ     L_6F79                          ; 6F61   0204 0016

        MVI     G_015D, R0                      ; 6F63   0280 015D
        ANDI    #$0001, R0                      ; 6F65   03B8 0001
        BNEQ    L_6F79                          ; 6F67   020C 0010

        MVI     G_0168, R0                      ; 6F69   0280 0168
        CMPI    #$0006, R0                      ; 6F6B   0378 0006
        BNEQ    L_6F75                          ; 6F6D   020C 0006

        MVII    #$0001, R0                      ; 6F6F   02B8 0001
        MVO     R0,     G_0168                  ; 6F71   0240 0168
        B       L_6F79                          ; 6F73   0200 0004

L_6F75:
        XORI    #$0005, R0                      ; 6F75   03F8 0005
        MVO     R0,     G_0168                  ; 6F77   0240 0168
L_6F79:
        CLRR    R0                              ; 6F79   01C0
        MVO     R0,     G_018F                  ; 6F7A   0240 018F
        PULR    R7                              ; 6F7C   02B7

L_6F7D:
        CLRR    R3                              ; 6F7D   01DB
        MOVR    R7,     R1                      ; 6F7E   00B9
        ADDI    #$000A, R1                      ; 6F7F   02F9 000A
        B       L_6F31                          ; 6F81   0220 0051

        DECLE   $0053,  $0045,  $0054,  $0055   ; 6F83   0053 0045 0054 0055
        DECLE   $0050,  $0000,  $0042,  $004C   ; 6F87   0050 0000 0042 004C
        DECLE   $0041,  $0043,  $004B,  $0000   ; 6F8B   0041 0043 004B 0000
        DECLE   $0057,  $0048,  $0049,  $0054   ; 6F8F   0057 0048 0049 0054
        DECLE   $0045,  $0000                   ; 6F93   0045 0000

        PULR    R7                              ; 6F95   02B7

L_6F96:
        PSHR    R5                              ; 6F96   0275

        JSR     R5,     X_PLAY_SFX1             ; 6F97   0004 0118 03BB
        DECLE   $03C9                           ; 6F9A  SFX data
        DECLE   $0040,  $0100                   ; 6F9B  SFX data
        DECLE   $0048,  $00C0                   ; 6F9D  SFX data
        DECLE   $03DB                           ; 6F9F  SFX data
        DECLE   $00F1,  $003E                   ; 6FA0  SFX data
        DECLE   $0061,  $0014                   ; 6FA2  SFX data
        DECLE   $010C,  $0000                   ; 6FA4  SFX data
        DECLE   $000B                           ; 6FA6  SFX data
        DECLE   $008F,  $0077                   ; 6FA7  SFX data
        DECLE   $02CF                           ; 6FA9  SFX end

L_6FAA:
        PSHR    R5                              ; 6FAA   0275

        JSR     R5,     X_PLAY_SFX1             ; 6FAB   0004 0118 03BB
        DECLE   $0050,  $0000                   ; 6FAE  SFX data
        DECLE   $0048,  $0200                   ; 6FB0  SFX data
        DECLE   $0044,  $01F4                   ; 6FB2  SFX data
        DECLE   $00DB                           ; 6FB4  SFX data
        DECLE   $0389                           ; 6FB5  SFX data
        DECLE   $006C,  $0000                   ; 6FB6  SFX data
        DECLE   $000B                           ; 6FB8  SFX data
        DECLE   $03CF                           ; 6FB9  SFX end

L_6FBA:
        PSHR    R5                              ; 6FBA   0275

        JSR     R5,     .EXEC.7C1               ; 6FBB   0004 0114 03C1
        JSR     R5,     X_PLAY_SFX1             ; 6FBE   0004 0118 03BB
        DECLE   $0040,  $0043                   ; 6FC1  SFX data
        DECLE   $0048,  $00C0                   ; 6FC3  SFX data
        DECLE   $0044,  $0203                   ; 6FC5  SFX data
        DECLE   $03DB                           ; 6FC7  SFX data
        DECLE   $0389                           ; 6FC8  SFX data
        DECLE   $0031,  $03B1                   ; 6FC9  SFX data
        DECLE   $001C,  $0000                   ; 6FCB  SFX data
        DECLE   $000B                           ; 6FCD  SFX data
        DECLE   $008F,  $003B                   ; 6FCE  SFX data
        DECLE   $03CF                           ; 6FD0  SFX end

L_6FD1:
        PSHR    R5                              ; 6FD1   0275

        JSR     R5,     X_PLAY_SFX1             ; 6FD2   0004 0118 03BB
        DECLE   $0048,  $0340                   ; 6FD5  SFX data
        DECLE   $0359                           ; 6FD7  SFX data
        DECLE   $01DB                           ; 6FD8  SFX data
        DECLE   $00AD                           ; 6FD9  SFX data
        DECLE   $000C,  $0300                   ; 6FDA  SFX data
        DECLE   $01B7                           ; 6FDC  SFX data
        DECLE   $000B                           ; 6FDD  SFX data
        DECLE   $03CF                           ; 6FDE  SFX end


        PSHR    R5                              ; 6FDF   0275

L_6FE0:
        JSR     R5,     X_PLAY_SFX1             ; 6FE0   0004 0118 03BB
        DECLE   $0040,  $0140                   ; 6FE3  SFX data
        DECLE   $0048,  $0243                   ; 6FE5  SFX data
        DECLE   $0054,  $0085                   ; 6FE7  SFX data
        DECLE   $0389                           ; 6FE9  SFX data
        DECLE   $00A1,  $003C                   ; 6FEA  SFX data
        DECLE   $0071,  $03C6                   ; 6FEC  SFX data
        DECLE   $00E1,  $034D                   ; 6FEE  SFX data
        DECLE   $03FC,  $03ED                   ; 6FF0  SFX data
        DECLE   $000B                           ; 6FF2  SFX data
        DECLE   $008F,  $0077                   ; 6FF3  SFX data
        DECLE   $03CF                           ; 6FF5  SFX end


        PULR    R7                              ; 6FF6   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 6FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5047       <entry>
;;  $506A       $6CAD  
;;  $5090       $50A7  
;;  $50B4       $50CB  
;;  $50BB       $50B6  
;;  $50D2       $51BC   $6D11  
;;  $50E1       $6E25  
;;  $5106       $50F8  
;;  $519D       $5190  
;;  $51A9       $51A3  
;;  $51DB       $51B2   $51B7   $51CF  
;;  $51DC       $51D5   $6E3C  
;;  $51FB       $51F7  
;;  $5210       $5106  
;;  $5244       $522D  
;;  $5245       $5212   $5218   $5231   $5239  
;;  $524E       $524A  
;;  $5251       $51C8  
;;  $525D       $5255  
;;  $525E       $6E7A  
;;  $526B       $5267  
;;  $5277       $5273  
;;  $5281       $631B  
;;  $5287       $5284  
;;  $5293       $528D  
;;  $52AF       $52AA  
;;  $52B1       $52A4   $52AD  
;;  $52B4       $5296  
;;  $52B5       $51AC  
;;  $52BE       $52BB  
;;  $52D0       $52C8  
;;  $52E8       $5304  
;;  $52EB       $52E6  
;;  $52F0       $52D3  
;;  $5306       $52F4  
;;  $5318       $530A  
;;  $532E       $5327  
;;  $5348       $533D  
;;  $534F       $5330   $5337   $5346  
;;  $535A       $5351  
;;  $536B       $535C  
;;  $5376       $5373  
;;  $5388       $5385  
;;  $539F       $538B   $5396  
;;  $53AC       $53A3  
;;  $53B3       $53B0  
;;  $53B7       $53AA  
;;  $53BE       $53BB  
;;  $53D0       $53C5  
;;  $53D1       $53CF  
;;  $53F3       $5358   $5365   $5369   $537B  
;;  $5400       $543C   $5451   $5469   $54A6   $5768   $5835  
;;  $5404       $598D   $610C   $6179   $61D1   $6B1B  
;;  $5406       $5402  
;;  $5417       $5446   $545D   $5481   $5496   $549B   $57D7   $5832   $58F9  
;;  $5418       $5763  
;;  $542D       $5428  
;;  $5439       $5444  
;;  $544E       $5456   $545B  
;;  $5468       $5471   $547F  
;;  $5491       $54A4  
;;  $549D       $5494  
;;  $54A8       $5436   $544B   $6B80  
;;  $54B9       $5439   $544E   $6B83  
;;  $54BD       $54C8  
;;  $54D8       $54C4  
;;  $54DA       $5473   $581C  
;;  $54E4       $57C8  
;;  $54F4       $543E   $5453   $54E2   $6B88  
;;  $54FC       $5441   $6B8B   $6BD1  
;;  $54FD       $5505  
;;  $5507       $5500  
;;  $5508       $5458  
;;  $5509       $5511  
;;  $5514       $550C  
;;  $5515       $5502   $550E   $57D2  
;;  $552C       $551F  
;;  $552E       $5491   $6B72  
;;  $554F       $5582  
;;  $5555       $554D  
;;  $5557       $5569  
;;  $555B       $557B  
;;  $5561       $553F  
;;  $556B       $5498  
;;  $5584       $5546   $5552   $5564  
;;  $5586       $554F   $56D0   $64CD  
;;  $558A       $5548   $56C7   $64C3  
;;  $558D       $564B  
;;  $55B3       $559C   $55AB  
;;  $55C0       $5561  
;;  $55C2       $55B1  
;;  $55C6       $5588   $558B  
;;  $55D0       $5687   $5691  
;;  $55D1       $55BC  
;;  $55D3       $573D   $59F7   $5AAA   $6195   $61B9  
;;  $55DB       $5732   $5738  
;;  $55E6       $59B9   $61B0   $6B62  
;;  $55F0       $55DF  
;;  $5611       $55CB   $5606   $560D  
;;  $5622       $561E  
;;  $563D       $5603   $5609  
;;  $563F       $5627   $562C   $5632   $563B  
;;  $5641       $5476   $581F  
;;  $5651       $5648  
;;  $5656       $56B1   $56C4   $56D4   $650A  
;;  $5672       $5646   $56AE  
;;  $568D       $5699  
;;  $569B       $55CE  
;;  $56A9       $54FD   $5509   $57CD  
;;  $56CF       $56B3  
;;  $56D6       $564F  
;;  $56D9       $56CC  
;;  $56F6       $56EF  
;;  $5706       $571F  
;;  $5721       $5707  
;;  $574F       $57BA  
;;  $5766       $5729   $572F   $5735  
;;  $5767       $573B   $5740  
;;  $5768       $56EB   $5700   $570F   $5713   $5719   $577D   $5789   $578E  
;;  $5768       $5797   $57A0  
;;  $5773       $576F  
;;  $57F5       $5822  
;;  $5804       $5801  
;;  $580D       $580A  
;;  $581F       $57DA   $5830  
;;  $5835       $57C6   $57CB   $57D0   $57D5   $57E2   $57EA   $5814   $581A  
;;  $5835       $5871   $58A9   $58B8   $590B   $5946   $595E  
;;  $5838       $57C3   $57DF   $586E  
;;  $5869       $583E   $5846   $584B   $5853   $585A   $5865  
;;  $586B       $57BC  
;;  $5899       $57BE   $58F7  
;;  $58AB       $589E  
;;  $58B7       $58C6   $58D4  
;;  $58D7       $5916   $5921  
;;  $58D9       $58CC  
;;  $58E1       $58DE   $5960  
;;  $58FC       $5891  
;;  $5918       $58A1  
;;  $5923       $58A4  
;;  $5931       $58A7  
;;  $594E       $592F  
;;  $5962       $5913  
;;  $5966       $591E  
;;  $5967       $5964  
;;  $5988       $5978   $597D   $5984  
;;  $598A       $59BC   $5A53   $5A5E   $5AFA   $5B03  
;;  $598D       $5A77   $5B0F   $5B1B   $5B26   $6249  
;;  $59D6       $59CD  
;;  $59E0       $59C4   $59C9  
;;  $5A21       $5A11  
;;  $5A3A       $5A2C   $5A33   $5A38  
;;  $5A3F       $5A1F  
;;  $5A62       $59FA   $5A05   $5A16  
;;  $5A6C       $5A60  
;;  $5A79       $599A   $5A83  
;;  $5A85       $5990  
;;  $5A8C       $5A7E  
;;  $5A92       $5ABE  
;;  $5A9F       $5A8A  
;;  $5ABB       $59CB  
;;  $5ABE       $5AB4  
;;  $5AC3       $5AA8  
;;  $5ACD       $5AB9   $5AC1  
;;  $5ADC       $59F0  
;;  $5AEC       $5ADA  
;;  $5B05       $5AD8  
;;  $5B28       $5A13   $5A35  
;;  $5B33       $5A18  
;;  $5B3D       $5B39  
;;  $5B42       $5AB6  
;;  $5B4F       $5B4C  
;;  $5B50       $6246  
;;  $5B6A       $5B65  
;;  $5B70       $5B60  
;;  $5B82       $5BA8  
;;  $5B90       $5B8B  
;;  $5B9F       $5B9A  
;;  $5BA0       $5D03  
;;  $5BA1       $5C98   $5C9F  
;;  $5BB7       $5BB3  
;;  $5BD1       $5BCC   $5BD3  
;;  $5BD9       $5BD6  
;;  $5BDC       $5C3A   $5C66   $5C86   $5CDB   $5D26   $5D42   $5DA3  
;;  $5BE2       $5BDE  
;;  $5BE3       $5CF4   $5DE4  
;;  $5BE4       $5BDA  
;;  $5BED       $5BC6  
;;  $5BEE       $5DB5   $5DCA   $5DDF  
;;  $5C14       $5C0D  
;;  $5C27       $5C10  
;;  $5C3A       $5C25  
;;  $5C3D       $5C19   $5C21   $5C28   $5C2E   $5C36  
;;  $5C64       $5C57  
;;  $5C66       $5C5B   $5C62  
;;  $5C6A       $5C4B  
;;  $5C86       $5C82  
;;  $5C89       $5C47   $5C79  
;;  $5CA1       $5C43  
;;  $5CB3       $5CB8  
;;  $5CBC       $5CB6  
;;  $5CDB       $5CD7  
;;  $5CDF       $5CCD  
;;  $5CF4       $5CF0  
;;  $5D06       $5CBA   $5CE6  
;;  $5D07       $59A0  
;;  $5D45       $5D22   $5D32   $5D3E  
;;  $5D5B       $5D4A  
;;  $5D6F       $5D69  
;;  $5D81       $5D72  
;;  $5D89       $5D86  
;;  $5D8F       $5D9B  
;;  $5D90       $5DA0  
;;  $5D91       $5D8D  
;;  $5DA3       $5D6D   $5D7F  
;;  $5DA6       $5D50   $5D61   $5D7B   $5D94  
;;  $5DBB       $5DAC  
;;  $5DE4       $5D59  
;;  $5DE7       $5D55  
;;  $5DEA       $5DE2  
;;  $5DFC       $5DF5  
;;  $5E25       $5C54   $5CB3   $5CD2   $5E50   $5E64   $5E71  
;;  $5E26       $5E37   $5E3F  
;;  $5E4C       $5E31  
;;  $5E4E       $5CE3   $6744  
;;  $5E58       $5C5D   $5CC9  
;;  $5E61       $5E54  
;;  $5E64       $5E69  
;;  $5E6D       $5E67  
;;  $5E71       $5E76  
;;  $5E78       $5E6B  
;;  $5E7B       $5E74  
;;  $5E7C       $5E79  
;;  $5EA6       $5EA6  
;;  $5EAF       $5EAD  
;;  $5EB4       $5EB2  
;;  $5F0B       $5F09  
;;  $5F3B       $5F39  
;;  $6000       $5048  
;;  $6009       $6CAA  
;;  $600E       $6C73  
;;  $6038       $6DDE  
;;  $6044       $518D  
;;  $6057       $6052  
;;  $6060       $6063  
;;  $6068       $6080  
;;  $607D       $6072  
;;  $6082       $6076   $607B  
;;  $6084       $6C8A  
;;  $60A2       $6095  
;;  $60A8       $60B5  
;;  $60B7       $60AE  
;;  $60B9       $60B0   $6C99  
;;  $60CF       $613B  
;;  $60F8       $60F4  
;;  $6108       $6065  
;;  $610C       $6117   $6121   $6133  
;;  $612F       $607D  
;;  $6135       $519D   $5287  
;;  $614D       $60A2  
;;  $615B       $6025  
;;  $6162       $6159  
;;  $6164       $6171  
;;  $6173       $608D  
;;  $6174       $6012   $603C   $6041   $6048   $6068   $60B3   $60BD   $60C7  
;;  $6174       $60CC   $610F   $6139   $6165  
;;  $6175       $60C9  
;;  $6179       $618D  
;;  $6190       $617C  
;;  $6191       $6114   $61D6  
;;  $61A5       $61A1  
;;  $61A7       $51A0   $528A   $59C6   $65B8  
;;  $61B9       $61B3  
;;  $61C4       $61BC  
;;  $61D1       $61DB  
;;  $61DD       $61D9  
;;  $61E9       $61E3  
;;  $61ED       $61D4  
;;  $61EF       $61B7   $61E7   $61EB  
;;  $6202       $600F   $6039   $6045   $60BA   $6136   $6CFD  
;;  $621B       $620E  
;;  $621F       $603E  
;;  $6241       $623E  
;;  $6245       $628F  
;;  $624C       $5A8F  
;;  $626C       $625A  
;;  $6279       $6272  
;;  $627C       $6260  
;;  $6291       $626A   $6277  
;;  $6292       $59D3   $625D   $6268   $627A   $6284  
;;  $6293       $6274   $627C  
;;  $629D       $601B   $6020   $62CB   $65C5  
;;  $62A0       $62A6  
;;  $62A8       $62A1  
;;  $62A9       $5992  
;;  $62B8       $55DC   $55E2   $5DAE   $5DB8   $6097   $60D3   $6210   $644A  
;;  $62B8       $6A4F   $6A7A   $6B5F   $6BFC  
;;  $62C7       $600A  
;;  $62D5       $62E7  
;;  $62E9       $62D7  
;;  $62FA       <entry>
;;  $631E       $6308   $630C  
;;  $631F       $51A9   $5293  
;;  $6320       $50B8   $6C67   $6D8C  
;;  $6330       $633B   $6342  
;;  $6351       $634C  
;;  $6352       $6332  
;;  $6372       $636E  
;;  $637A       $6376  
;;  $6382       $634E  
;;  $6398       $6393   $63A4   $63A8   $63EB  
;;  $63B4       $63AC   $63B0  
;;  $63BF       $63BC  
;;  $63C4       $63B8  
;;  $63C9       $63C6  
;;  $63CB       $63B2   $63C2  
;;  $63D3       $63CD  
;;  $63DB       $63D5  
;;  $63E3       $63DD  
;;  $63E5       $63D1   $63D9   $63E1  
;;  $63EB       $63FC  
;;  $63FE       $639F  
;;  $6400       $640D   $6411  
;;  $6406       $5516  
;;  $644A       $646F  
;;  $646C       $6464   $6469  
;;  $6471       $6453  
;;  $64B0       $650D  
;;  $64B2       $646C  
;;  $64B3       $64DD  
;;  $64CC       $64C0  
;;  $64D5       $64CA  
;;  $64EB       $64E5  
;;  $64ED       $6508  
;;  $64FE       $6447  
;;  $650A       $64BE   $64D3  
;;  $650F       $64E9   $6504  
;;  $6519       $64FC  
;;  $6533       $651F  
;;  $6555       $6552  
;;  $6561       $655E   $6569  
;;  $658E       $655B   $6565   $6571   $6584  
;;  $6590       $621B  
;;  $6598       $65B3  
;;  $65B2       $65A6  
;;  $65C2       $60A5   $6591  
;;  $65CD       $65D5  
;;  $65D7       $65CE  
;;  $65E1       $65D8   $65DD  
;;  $661F       $6625  
;;  $6629       $65E9   $65F4   $65F9   $65FE   $6603   $660C  
;;  $6631       $663B   $6661  
;;  $6649       $663F  
;;  $6663       $6632  
;;  $6666       $6643   $6647  
;;  $6667       $664D  
;;  $6668       $6623  
;;  $6669       $65F0   $6618  
;;  $666A       $6594   $65BB  
;;  $666C       $60D6  
;;  $666F       $6689  
;;  $6683       $667F  
;;  $6688       $667C  
;;  $668B       $6670  
;;  $668C       $65BD  
;;  $66C9       $66B3  
;;  $66DD       $66C7  
;;  $66E1       $66B7   $66BD   $66CC   $66D3  
;;  $66FF       $66F8  
;;  $670C       $6706  
;;  $6710       $66EA   $66F0  
;;  $671A       $66DF   $670E   $6716  
;;  $6720       $668F   $6694  
;;  $673E       $675E  
;;  $675B       $6748  
;;  $6760       $673C  
;;  $6767       $6774  
;;  $6776       $676A   $676D  
;;  $677F       $65B5  
;;  $6788       $6781  
;;  $678B       $67A1  
;;  $678F       $6786   $6789  
;;  $67A3       $6796   $6799  
;;  $67A4       $68B7   $693D  
;;  $67A9       $68EE   $68F4  
;;  $67AC       $67A7  
;;  $67AF       $679E   $69F3  
;;  $67B3       $69D2  
;;  $67B4       $67AD   $67B1  
;;  $67D3       $67EC   $67F1   $67F6  
;;  $67DD       $67D9  
;;  $67F3       $67E4  
;;  $67F8       $67F3   $68A7  
;;  $67FD       $680D  
;;  $680F       $67D5   $6801  
;;  $6810       $67EE   $6804  
;;  $682F       $68E9   $6933  
;;  $6835       $68DE   $6938  
;;  $6840       $683A  
;;  $6841       $6A08  
;;  $6844       $6A0C  
;;  $6846       $6833   $683E   $6842  
;;  $685D       $684F   $6859  
;;  $687D       $68B2  
;;  $689B       $6898  
;;  $68A7       $68A4  
;;  $68AA       $6883   $688A   $68A1  
;;  $68B4       $686A  
;;  $68B5       $5DD8   $5DE7   $60D0   $6192  
;;  $68C6       $68BF  
;;  $68D1       $68CD  
;;  $68DD       $68C4   $68C6   $68CA  
;;  $68E7       $68DB  
;;  $68F2       $619C   $6A7D  
;;  $6903       $68FC  
;;  $690E       $690A  
;;  $691B       $6901   $6903   $6907  
;;  $691E       $6919  
;;  $692C       $6927  
;;  $692E       $692A  
;;  $6941       $68E1   $69EF  
;;  $694C       $692F  
;;  $694F       $694A  
;;  $6958       $68E4   $691B  
;;  $6978       $695E  
;;  $6999       $6992  
;;  $69A0       $69A2  
;;  $69A8       $6987  
;;  $69BB       $69B6  
;;  $69C0       $69A6  
;;  $69C5       $6978  
;;  $69C6       $68D8   $6916  
;;  $69F3       $69EC  
;;  $69F7       $68C1   $68FE  
;;  $6A0C       $6A06  
;;  $6A10       $60DF   $60E7   $61C9   $61FC   $6A4C   $6A77  
;;  $6A15       $6A18  
;;  $6A1B       $5B23  
;;  $6A29       $59DD   $629A  
;;  $6A2F       $6A21  
;;  $6A30       $59B6  
;;  $6A61       $598A   $59D0   $5A80   $5AAF   $5ABB   $5AC9   $5AE2  
;;  $6AA5       $6A67  
;;  $6AA7       $599C  
;;  $6AB2       $6AAC  
;;  $6AC0       $6AB2   $6ABB  
;;  $6ACC       $6AED  
;;  $6AD2       $6ACE  
;;  $6AD7       $6AAE   $6AB6  
;;  $6AEF       $5B54  
;;  $6B07       $6A5D  
;;  $6B17       $5A8C  
;;  $6B1B       $6B2D  
;;  $6B2B       $6B30  
;;  $6B33       $6B1E  
;;  $6B34       $6109   $6176   $6B18  
;;  $6B41       $6111   $617E   $6B20  
;;  $6B48       $5B29  
;;  $6B72       $6B7E  
;;  $6B83       $6B8E   $6B9A   $6BD6  
;;  $6B9C       $6B96  
;;  $6BA2       $6BD4  
;;  $6BD1       $6BAC   $6BB5  
;;  $6BD8       $6B65  
;;  $6BDA       $6BE4  
;;  $6BE0       $6B75  
;;  $6BE6       $6B86  
;;  $6BF5       $6BF2  
;;  $6BFC       $6B57   $6BDE   $6BEB  
;;  $6C01       $6312  
;;  $6C15       $6C0E   $6C11  
;;  $6C1E       $6C13   $6C19  
;;  $6C22       $6C3F   $6C45  
;;  $6C52       $6C2F   $6C3A  
;;  $6C67       $6C97   $6D0F   $6D45  
;;  $6C6A       $6C5F  
;;  $6C81       $6C76  
;;  $6C97       $6CA6   $6D32  
;;  $6C99       $6CCF  
;;  $6CA8       $6C88  
;;  $6CB0       $506A   $6D00  
;;  $6CC1       $6CB9   $6CEF  
;;  $6CDC       $6CD8  
;;  $6CEF       $6CE0  
;;  $6CFA       $6CF7  
;;  $6CFD       $6C6F  
;;  $6D11       $6C34  
;;  $6D27       $6D23  
;;  $6D3C       $6D37  
;;  $6D47       $50BD   $6358   $6E36   $6E51   $6E74  
;;  $6D5C       $6D60   $6D65   $6DA0   $6DC4  
;;  $6D72       $5192  
;;  $6D8F       $6D39  
;;  $6D9B       $6D97  
;;  $6DAA       $6315   $6318  
;;  $6DCF       $6DCA  
;;  $6DF5       $6DF6  
;;  $6DF9       $6DE9  
;;  $6E0E       $6DFD  
;;  $6E35       $6D7E  
;;  $6E36       $6E34  
;;  $6E51       $6D70  
;;  $6E62       $6E3F   $6E54  
;;  $6E7D       $51BF   $6D14  
;;  $6E98       $6368  
;;  $6EAC       $6E9F  
;;  $6EAD       $5178   $6D73   $6E18  
;;  $6EBB       $50C0   $51C2   $635B   $6D17   $6E39   $6E77  
;;  $6ECB       <entry> $6DD3  
;;  $6EDF       $6ED9  
;;  $6EE1       $6EDD  
;;  $6EF2       $6EEC  
;;  $6EF4       $6EF0  
;;  $6F0E       $6F0A  
;;  $6F24       $6F1B  
;;  $6F31       $6F22   $6F81  
;;  $6F52       $6F47   $6F4E  
;;  $6F5E       $6F3A   $6F58  
;;  $6F75       $6F6D  
;;  $6F79       $6F61   $6F67   $6F73  
;;  $6F7D       $6F2A  
;;  $6F96       $6395  
;;  $6FAA       $6C8D   $6C9C   $6E03   $6E1B  
;;  $6FBA       $51B9   $6E46   $6E71  
;;  $6FD1       $5315  
;;  $6FE0       $52E8  
;; ======================================================================== ;;
