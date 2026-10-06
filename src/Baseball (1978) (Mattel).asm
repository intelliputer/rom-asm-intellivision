
        ORG     $5000
.HEADER:
        BIDECLE $5DAB           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5034           ; 5004  Ptr: Start of game
        BIDECLE $50D7           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $50B2           ; 5008  Ptr: GRAM init sequence
        BIDECLE $502A           ; 500A  Ptr: Date/Title
        DECLE   $0002           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0008   ; 500F  Color Stack init (0, 1)
        DECLE   $0004,  $0008   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 501C  Timer dispatch/interval
        DECLE   $0048,  $0050,  $0002,  $0000; 5020  Timer dispatch/interval
        DECLE   $00AB,  $0050,  $0030,  $0080; 5024  Timer dispatch/interval
        BIDECLE $0000           ; 5028  End of timer table

.TITLE:
        DECLE   $004E                           ; 502A  Cartridge year
        STRING  "BASEBALL"                      ; 502B  Title string
        DECLE   $0000                           ; 5033  

.START:
        PSHR    R5                              ; 5034   0275

        JSR     R5,     L_5117                  ; 5035   0004 0150 0117

        MVII    #$0001, R0                      ; 5038   02B8 0001
        MVO     R0,     G_016B                  ; 503A   0240 016B
        MVII    #$0002, R0                      ; 503C   02B8 0002
        MVO     R0,     G_016A                  ; 503E   0240 016A
        MVII    #$000A, R0                      ; 5040   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5042   0004 011C 02D5

        J       L_5278                          ; 5045   0004 0350 0278

L_5048:
        PSHR    R5                              ; 5048   0275

        JSR     R5,     L_55E3                  ; 5049   0004 0154 01E3
        JSR     R5,     L_5B4D                  ; 504C   0004 0158 034D

L_504F:
        PSHR    R5                              ; 504F   0275
        MVI     G_016C, R0                      ; 5050   0280 016C
        COMR    R0                              ; 5052   0018
        ANDI    #$000E, R0                      ; 5053   03B8 000E
        BNEQ    L_507E                          ; 5055   020C 0027

        INCR    R0                              ; 5057   0008
        MVI     G_016D, R5                      ; 5058   0285 016D
        ANDI    #$000F, R5                      ; 505A   03BD 000F
        ADDI    #$016F, R5                      ; 505C   02FD 016F
        CMP@    R5,     R0                      ; 505E   0368
        MVII    #$016F, R5                      ; 505F   02BD 016F
        BNEQ    L_5064                          ; 5061   020C 0001

        INCR    R0                              ; 5063   0008
L_5064:
        CMP@    R5,     R0                      ; 5064   0368
        BEQ     L_506C                          ; 5065   0204 0005

        CMPI    #$0178, R5                      ; 5067   037D 0178
        BNEQ    L_5064                          ; 5069   022C 0006
        PULR    R7                              ; 506B   02B7

L_506C:
        PSHR    R0                              ; 506C   0270
        CLRR    R0                              ; 506D   01C0
        DECR    R5                              ; 506E   0015
        MVO@    R0,     R5                      ; 506F   0268
        MOVR    R5,     R0                      ; 5070   00A8
        SUBI    #$0170, R0                      ; 5071   0338 0170

        JSR     R5,     L_55A6                  ; 5073   0004 0154 01A6

        PULR    R0                              ; 5076   02B0
        PULR    R7                              ; 5077   02B7

L_5078:
        PSHR    R5                              ; 5078   0275
        MVI     G_016C, R0                      ; 5079   0280 016C
        COMR    R0                              ; 507B   0018
        ANDI    #$00F0, R0                      ; 507C   03B8 00F0
L_507E:
        CLRR    R5                              ; 507E   01ED
        INCR    R7                              ; 507F   000F

L_5080:
        INCR    R5                              ; 5080   000D
L_5081:
        SARC    R0,     1                       ; 5081   0078
        BC      L_5087                          ; 5082   0201 0003
        BNEQ    L_5080                          ; 5084   022C 0005

        DECR    R5                              ; 5086   0015
L_5087:
        MOVR    R5,     R0                      ; 5087   00A8

        JSR     R5,     X_CLR_BIT               ; 5088   0004 0114 02E6

        CMPR    R5,     R4                      ; 508B   016C
        PULR    R7                              ; 508C   02B7

L_508D:
        PSHR    R5                              ; 508D   0275
        PSHR    R1                              ; 508E   0271

        JSR     R5,     .EXEC.76C               ; 508F   0004 0114 036C
        JSR     R5,     X_SET_BIT               ; 5092   0004 0114 02DB

        CMPR    R5,     R4                      ; 5095   016C

        JSR     R5,     .EXEC.7AE               ; 5096   0004 0114 03AE

        PULR    R1                              ; 5099   02B1
        PULR    R7                              ; 509A   02B7

L_509B:
        PSHR    R5                              ; 509B   0275

        JSR     R5,     L_50AB                  ; 509C   0004 0150 00AB

        MOVR    R7,     R1                      ; 509F   00B9
        SUBI    #$007C, R1                      ; 50A0   0339 007C

        JSR     R5,     .EXEC.81E               ; 50A2   0004 0118 001E

        PULR    R5                              ; 50A5   02B5
        MVI@    R5,     R4                      ; 50A6   02AC
        CLRR    R3                              ; 50A7   01DB
        J       X_PRINT_R5                      ; 50A8   0004 0318 007B

L_50AB:
        MVII    #$022B, R4                      ; 50AB   02BC 022B
        MVII    #$000E, R0                      ; 50AD   02B8 000E
        J       X_FILL_ZERO                     ; 50AF   0004 0314 0338

.GRAM_INIT_50B2:
        DECLE   $0027           ; 50B2  # of GRAM cards to init
        DECLE   $02B9,  $01EE   ; 50B3  #00   :  Algo #1
        DECLE   $02F7,  $0396   ; 50B5  #01   :  Algo #1
        DECLE   $02F1,  $033B   ; 50B7  #02   :  Algo #2
        DECLE   $0039,  $01DE   ; 50B9  #03   :  Algo #1
        DECLE   $0077,  $03B6   ; 50BB  #04   :  Algo #1
        DECLE   $005D,  $00E6   ; 50BD  #05   :  Algo #1
        DECLE   $025B,  $014E   ; 50BF  #06   :  Algo #1
        DECLE   $035B,  $0146   ; 50C1  #07   :  Algo #1
        DECLE   $005B,  $014E   ; 50C3  #08   :  Algo #1
        DECLE   $015B,  $0146   ; 50C5  #09   :  Algo #1
        DECLE   $02EF,  $01DC   ; 50C7  #0A   :  4x4 tile
        DECLE   $0201,  $002A   ; 50C9  #0B   :  Algo #1
        DECLE   $0001,  $0280   ; 50CB  #0C-11:  CART #00-05 ----
        DECLE   $0201,  $03C0   ; 50CD  #12-19:  GRAM #00-07 X---
        DECLE   $0211,  $03C0   ; 50CF  #1A-21:  GRAM #08-0F X---
        DECLE   $0221,  $00C0   ; 50D1  #22-23:  GRAM #10-11 X---
        DECLE   $000D,  $0080   ; 50D3  #24-25:  CART #06-07 ----
        DECLE   $03FF,  $03FC   ; 50D5  #26   :  4x4 tile

.GFX_LIST_50D7:
        DECLE   $0000,  $0000,  $0003,  $000F   ; 50D7  CART PIC #00
        DECLE   $0077,  $0083,  $0000,  $0000   ; 50DB  
        DECLE   $0000,  $000F,  $007F,  $00FF   ; 50DF  CART PIC #01
        DECLE   $00FF,  $007F,  $003F,  $000F   ; 50E3  
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 50E7  CART PIC #02
        DECLE   $00F0,  $0030,  $0000,  $0000   ; 50EB  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50EF  CART PIC #03
        DECLE   $00C7,  $0037,  $000F,  $0003   ; 50F3  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50F7  CART PIC #04
        DECLE   $0000,  $0003,  $001C,  $00FF   ; 50FB  
        DECLE   $00FF,  $003F,  $000C,  $0003   ; 50FF  CART PIC #05
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5103  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5107  CART PIC #06
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 510B  
        DECLE   $0300,  $0300,  $0318,  $0324   ; 510F  CART PIC #07
        DECLE   $035A,  $033C,  $0324,  $0324   ; 5113  
L_5117:
        PSHR    R5                              ; 5117   0275
        MVII    #$0200, R4                      ; 5118   02BC 0200
        MVII    #$00F0, R0                      ; 511A   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 511C   0004 0114 0338
        JSR     R5,     L_5199                  ; 511F   0004 0150 0199
        DECLE   $0008                           ; 5122   0008
        BIDECLE $1800                           ; 5123   0000 0018
        DECLE   $0020,  $0099,  $0005,  $0000   ; 5125   0020 0099 0005 0000
        DECLE   $0018,  $0008,  $0018,  $0010   ; 5129   0018 0008 0018 0010
        DECLE   $0018,  $001F,  $0028,  $0067   ; 512D   0018 001F 0028 0067
        DECLE   $0008,  $0002,  $0000,  $0018   ; 5131   0008 0002 0000 0018
        DECLE   $0008,  $0018,  $0010,  $0018   ; 5135   0008 0018 0010 0018
        DECLE   $001F,  $0028,  $0027,  $0008   ; 5139   001F 0028 0027 0008
        DECLE   $002F,  $0008,  $0004,  $0008   ; 513D   002F 0008 0004 0008
        DECLE   $0024,  $0089,  $0000           ; 5141   0024 0089 0000

        SWAP    R3,     2                       ; 5144   0047
        ADCR    R0                              ; 5145   0028
        SLL     R3,     2                       ; 5146   004F
        INCR    R0                              ; 5147   0008
        MOVR    R0,     R7                      ; 5148   0087

        DECLE   $0008,  $0027,  $0008,  $002F   ; 5149   0008 0027 0008 002F
        DECLE   $0008,  $0004,  $0008,  $000C   ; 514D   0008 0004 0008 000C
        DECLE   $0008,  $0014,  $0008,  $0000   ; 5151   0008 0014 0008 0000
        DECLE   $00A0,  $0068,  $0018,  $0000   ; 5155   00A0 0068 0018 0000

        GSWD    R0                              ; 5159   0030
        RSWD    R0                              ; 515A   0038
        RSWD    R0                              ; 515B   0038
        COMR    R0                              ; 515C   0018
        MOVR    R1,     R7                      ; 515D   008F

        DECLE   $0028,  $004F,  $0008,  $0030   ; 515E   0028 004F 0008 0030
        DECLE   $0099,  $003C,  $0008,  $0034   ; 5162   0099 003C 0008 0034
        DECLE   $0089,  $0034,  $0089,  $0034   ; 5166   0089 0034 0089 0034
        DECLE   $0089,  $0054,  $0008,  $0002   ; 516A   0089 0054 0008 0002
        DECLE   $0030,  $0018,  $0038,  $0018   ; 516E   0030 0018 0038 0018
        DECLE   $0047,  $0028,  $004F,  $0008   ; 5172   0047 0028 004F 0008
        DECLE   $0034,  $0008,  $003C,  $0008   ; 5176   0034 0008 003C 0008
        DECLE   $0034,  $0089,  $005C,  $0008   ; 517A   0034 0089 005C 0008
        DECLE   $0004,  $0030,  $0018,  $0038   ; 517E   0004 0030 0018 0038
        DECLE   $0018,  $0047,  $0028,  $004F   ; 5182   0018 0047 0028 004F
        DECLE   $0008,  $0034,  $0008,  $0074   ; 5186   0008 0034 0008 0074
        DECLE   $0008,  $0006,  $0030,  $0018   ; 518A   0008 0006 0030 0018
        DECLE   $0038,  $0018,  $0047,  $0028   ; 518E   0038 0018 0047 0028
        DECLE   $007F,  $0008,  $0008,  $0030   ; 5192   007F 0008 0008 0030
        DECLE   $0018,  $0000                   ; 5196   0018 0000

        MOVR    R4,     R0                      ; 5198   00A0
L_5199:
        MVII    #$023C, R4                      ; 5199   02BC 023C
        MVII    #$0009, R3                      ; 519B   02BB 0009
L_519D:
        MVI@    R5,     R2                      ; 519D   02AA
        PSHR    R2                              ; 519E   0272
        ADDR    R2,     R4                      ; 519F   00D4
        SUBI    #$000A, R2                      ; 51A0   033A 000A
        PSHR    R2                              ; 51A2   0272
L_51A3:
        SDBD                                    ; 51A3   0001
        MVI@    R5,     R0                      ; 51A4   02A8
        MVO@    R0,     R4                      ; 51A5   0260
        INCR    R2                              ; 51A6   000A
        BNEQ    L_51A3                          ; 51A7   022C 0005

        CLRR    R1                              ; 51A9   01C9
        PULR    R2                              ; 51AA   02B2
        PSHR    R5                              ; 51AB   0275
        ADDI    #$0002, R5                      ; 51AC   02FD 0002
L_51AE:
        SUBI    #$0004, R5                      ; 51AE   033D 0004
        SDBD                                    ; 51B0   0001
        MVI@    R5,     R0                      ; 51B1   02A8
        SLLC    R0,     1                       ; 51B2   0058
        SLR     R0,     1                       ; 51B3   0060
        BC      L_51B8                          ; 51B4   0201 0002

        ADDI    #$0090, R0                      ; 51B6   02F8 0090
L_51B8:
        PSHR    R1                              ; 51B8   0271
        MOVR    R0,     R1                      ; 51B9   0081
        SDBD                                    ; 51BA   0001
        ANDI    #$2000, R1                      ; 51BB   03B9 0000 0020
        XORR    R1,     R0                      ; 51BE   01C8
        XOR@    R6,     R0                      ; 51BF   03F0
        MVO@    R0,     R4                      ; 51C0   0260
        INCR    R2                              ; 51C1   000A
        BNEQ    L_51AE                          ; 51C2   022C 0015

        PULR    R5                              ; 51C4   02B5
        ADD@    R6,     R4                      ; 51C5   02F4
        DECR    R3                              ; 51C6   0013
        BNEQ    L_519D                          ; 51C7   022C 002B
        INCR    R7                              ; 51C9   000F

L_51CA:
        PSHR    R5                              ; 51CA   0275
L_51CB:
        MVII    #$0002, R3                      ; 51CB   02BB 0002
        MVII    #$0204, R4                      ; 51CD   02BC 0204

        JSR     R5,     X_PRINT_R5              ; 51CF   0004 0118 007B
        STRING  "VSTR"                          ; 51D2   0056 0053 0054 0052
        DECLE   $0000                           ; 51D6   0000

        MVI     G_0165, R0                      ; 51D7   0280 0165
        MVII    #$0003, R1                      ; 51D9   02B9 0003
        MVII    #$0200, R4                      ; 51DB   02BC 0200

        JSR     R5,     X_PRNUM_RGT             ; 51DD   0004 0118 00C5

        SLR     R3,     1                       ; 51E0   0063
        MVII    #$020C, R4                      ; 51E1   02BC 020C

        JSR     R5,     X_PRINT_R5              ; 51E3   0004 0118 007B
        STRING  "HOME"                          ; 51E6   0048 004F 004D 0045
        DECLE   $0000                           ; 51EA   0000

        INCR    R4                              ; 51EB   000C
        MVI     G_0166, R0                      ; 51EC   0280 0166

        JSR     R5,     X_PRNUM_LFT             ; 51EE   0004 0118 009E

        CLRR    R3                              ; 51F1   01DB
        MVII    #$02C8, R4                      ; 51F2   02BC 02C8
        DECR    R1                              ; 51F4   0011
        MVI     G_0163, R0                      ; 51F5   0280 0163

        JSR     R5,     X_PRNUM_RGT             ; 51F7   0004 0118 00C5

        ADDI    #$0003, R4                      ; 51FA   02FC 0003

        JSR     R5,     X_PRINT_R5              ; 51FC   0004 0118 007B
        STRING  "Out"                           ; 51FF   004F 0075 0074
        DECLE   $0000                           ; 5202   0000

        ADDI    #$0008, R4                      ; 5203   02FC 0008

        JSR     R5,     X_PRINT_R5              ; 5205   0004 0118 007B
        STRING  "Ing"                           ; 5208   0049 006E 0067
        DECLE   $0000                           ; 520B   0000

        INCR    R4                              ; 520C   000C
        MVI     G_0164, R0                      ; 520D   0280 0164
        SLR     R0,     1                       ; 520F   0060
        INCR    R0                              ; 5210   0008

        JSR     R5,     X_PRNUM_LFT             ; 5211   0004 0118 009E

        MVII    #$02DC, R4                      ; 5214   02BC 02DC
        MVI     G_0162, R0                      ; 5216   0280 0162

        JSR     R5,     X_PRNUM_RGT             ; 5218   0004 0118 00C5

        ADDI    #$0003, R4                      ; 521B   02FC 0003

        JSR     R5,     X_PRINT_R5              ; 521D   0004 0118 007B
        STRING  "Ball"                          ; 5220   0042 0061 006C 006C
        DECLE   $0000                           ; 5224   0000

        ADDI    #$0006, R4                      ; 5225   02FC 0006

        JSR     R5,     X_PRINT_R5              ; 5227   0004 0118 007B
        STRING  "Strk"                          ; 522A   0053 0074 0072 006B
        DECLE   $0000                           ; 522E   0000

        INCR    R4                              ; 522F   000C
        MVI     G_0161, R0                      ; 5230   0280 0161

        JSR     R5,     X_PRNUM_LFT             ; 5232   0004 0118 009E

        PULR    R7                              ; 5235   02B7

L_5236:
        JSR     R5,     .EXEC.7AE               ; 5236   0004 0114 03AE
        JSR     R5,     .EXEC.766               ; 5239   0004 0114 0366
        JSR     R5,     X_POW2                  ; 523C   0004 0114 0345

        COMR    R0                              ; 523F   0018
        AND     G_015F, R0                      ; 5240   0380 015F
        MVO     R0,     G_015F                  ; 5242   0240 015F
        BNEQ    L_5415                          ; 5244   020C 01CF

        MVI     G_015D, R0                      ; 5246   0280 015D
        XORI    #$0001, R0                      ; 5248   03F8 0001
        MVO     R0,     G_015D                  ; 524A   0240 015D
        MVI     G_016A, R0                      ; 524C   0280 016A
        MVI     G_016B, R1                      ; 524E   0281 016B
        MVO     R0,     G_016B                  ; 5250   0240 016B
        MVO     R1,     G_016A                  ; 5252   0241 016A
        CLRR    R0                              ; 5254   01C0
        MVO     R0,     G_017D                  ; 5255   0240 017D
        MVO     R0,     G_017E                  ; 5257   0240 017E
        MVII    #$0178, R5                      ; 5259   02BD 0178
        MVO@    R0,     R5                      ; 525B   0268
        MVO@    R0,     R5                      ; 525C   0268
        MVO@    R0,     R5                      ; 525D   0268
        MVO@    R0,     R5                      ; 525E   0268
        MVII    #$0160, R5                      ; 525F   02BD 0160
        MVO@    R0,     R5                      ; 5261   0268
        MVO@    R0,     R5                      ; 5262   0268
        MVO@    R0,     R5                      ; 5263   0268
        MVO@    R0,     R5                      ; 5264   0268
        MVI@    R5,     R0                      ; 5265   02A8
        INCR    R0                              ; 5266   0008
        MVO     R0,     G_0164                  ; 5267   0240 0164
        CMPI    #$0011, R0                      ; 5269   0378 0011
        BLT     L_5278                          ; 526B   0205 000B

        MVI     G_0166, R1                      ; 526D   0281 0166
        CMP     G_0165, R1                      ; 526F   0341 0165
        BGT     L_5415                          ; 5271   020E 01A2
        BEQ     L_5278                          ; 5273   0204 0003

        RRC     R0,     1                       ; 5275   0070
        BNC     L_5415                          ; 5276   0209 019D

L_5278:
        JSR     R5,     L_51CA                  ; 5278   0004 0150 01CA

        CLRR    R0                              ; 527B   01C0

        JSR     R5,     L_55A6                  ; 527C   0004 0154 01A6

        MVII    #$00FF, R0                      ; 527F   02B8 00FF
        MVO     R0,     G_015E                  ; 5281   0240 015E
        MVII    #$031D, R1                      ; 5283   02B9 031D
        SDBD                                    ; 5285   0001
        MVII    #$5698, R4                      ; 5286   02BC 0098 0056
L_5289:
        MOVR    R1,     R2                      ; 5289   008A
        SDBD                                    ; 528A   0001
        MVII    #$56CA, R1                      ; 528B   02B9 00CA 0056

        JSR     R5,     X_INIT_MOB              ; 528E   0004 0114 02B2

        MOVR    R2,     R1                      ; 5291   0091
        MVI@    R1,     R0                      ; 5292   0288
        XOR     G_016B, R0                      ; 5293   03C0 016B
        MVO@    R0,     R1                      ; 5295   0248
        MOVR    R1,     R5                      ; 5296   008D
        ADDI    #$0002, R5                      ; 5297   02FD 0002
        MVII    #$0036, R2                      ; 5299   02BA 0036
        MVI     G_015D, R3                      ; 529B   0283 015D
        TSTR    R3                              ; 529D   009B
        BEQ     L_52A2                          ; 529E   0204 0002

        MVII    #$0072, R2                      ; 52A0   02BA 0072
L_52A2:
        SWAP    R2,     1                       ; 52A2   0042
        MVO@    R2,     R5                      ; 52A3   026A
        MVII    #$005D, R2                      ; 52A4   02BA 005D
        SWAP    R2,     1                       ; 52A6   0042
        MVO@    R2,     R5                      ; 52A7   026A
        SDBD                                    ; 52A8   0001
        MVI@    R4,     R2                      ; 52A9   02A2
        MVII    #$0019, R3                      ; 52AA   02BB 0019

        JSR     R5,     .EXEC.9A8               ; 52AC   0004 0118 01A8

        ADDI    #$0008, R1                      ; 52AF   02F9 0008
        CMPI    #$035D, R1                      ; 52B1   0379 035D
        BNEQ    L_5289                          ; 52B3   022C 002B
        PULR    R7                              ; 52B5   02B7

L_52B6:
        JSR     R5,     .EXEC.7AE               ; 52B6   0004 0114 03AE
        JSR     R5,     .EXEC.766               ; 52B9   0004 0114 0366

        INCR    R0                              ; 52BC   0008

        JSR     R5,     L_55A6                  ; 52BD   0004 0154 01A6

        DECR    R0                              ; 52C0   0010

        JSR     R5,     X_POW2                  ; 52C1   0004 0114 0345

        COMR    R0                              ; 52C4   0018
        AND     G_015E, R0                      ; 52C5   0380 015E
        MVO     R0,     G_015E                  ; 52C7   0240 015E
        BNEQ    L_5415                          ; 52C9   020C 014A

        MVO     R0,     G_016C                  ; 52CB   0240 016C
        B       L_52E2                          ; 52CD   0200 0013

L_52CF:
        PSHR    R5                              ; 52CF   0275
        CLRR    R0                              ; 52D0   01C0
        MOVR    R7,     R1                      ; 52D1   00B9

        JSR     R5,     L_52F2                  ; 52D2   0004 0150 02F2

        MVI     G_016F, R0                      ; 52D5   0280 016F

        JSR     R5,     .EXEC.76C               ; 52D7   0004 0114 036C

        MVI@    R1,     R0                      ; 52DA   0288
        XOR     G_016B, R0                      ; 52DB   03C0 016B
        XORI    #$0010, R0                      ; 52DD   03F8 0010
        MVO@    R0,     R1                      ; 52DF   0248
        B       L_52E6                          ; 52E0   0200 0004

L_52E2:
        CLRR    R0                              ; 52E2   01C0

        JSR     R5,     L_5591                  ; 52E3   0004 0154 0191

L_52E6:
        MVII    #$00C0, R0                      ; 52E6   02B8 00C0
        MVO     R0,     G_016D                  ; 52E8   0240 016D
        MVII    #$0008, R0                      ; 52EA   02B8 0008
        B       L_52F7                          ; 52EC   0200 0009

        CMPI    #$0008, R0                      ; 52EE   0378 0008
        BEQ     L_53CC                          ; 52F0   0204 00DA

L_52F2:
        PSHR    R5                              ; 52F2   0275
        CMP     G_015D, R1                      ; 52F3   0341 015D
        BEQ     L_5415                          ; 52F5   0204 011E

L_52F7:
        MVI     G_016D, R1                      ; 52F7   0281 016D
        ANDI    #$00C0, R1                      ; 52F9   03B9 00C0
        BEQ     L_5415                          ; 52FB   0204 0118

        CMPI    #$0009, R0                      ; 52FD   0378 0009
        BGT     L_5415                          ; 52FF   020E 0114

        CMPI    #$0006, R0                      ; 5301   0378 0006
        BLT     L_5306                          ; 5303   0205 0001

        DECR    R0                              ; 5305   0010
L_5306:
        MVI     G_016D, R2                      ; 5306   0282 016D
        SWAP    R2,     1                       ; 5308   0042
        SLLC    R2,     2                       ; 5309   005E
        BNOV    L_531B                          ; 530A   020A 000F

        CMPI    #$0007, R0                      ; 530C   0378 0007
        BNEQ    L_531B                          ; 530E   020C 000B

        MVI     G_016C, R2                      ; 5310   0282 016C
        COMR    R2                              ; 5312   001A
        ANDI    #$00F0, R2                      ; 5313   03BA 00F0
        BNEQ    L_531B                          ; 5315   020C 0004

        XOR     G_0160, R2                      ; 5317   03C2 0160
        BEQ     L_5415                          ; 5319   0204 00FA

L_531B:
        JSR     R5,     L_5591                  ; 531B   0004 0154 0191

        BC      L_5328                          ; 531E   0201 0008

        MVI     G_016B, R4                      ; 5320   0284 016B
        COMR    R4                              ; 5322   001C
        AND@    R5,     R4                      ; 5323   03AC
        DECR    R5                              ; 5324   0015
        MVO@    R4,     R5                      ; 5325   026C
        B       L_5332                          ; 5326   0200 000A

L_5328:
        MVI     G_016D, R1                      ; 5328   0281 016D
        SWAP    R1,     1                       ; 532A   0041
        SLLC    R1,     2                       ; 532B   005D
        BNOV    L_5415                          ; 532C   020A 00E7

        CMPI    #$0007, R0                      ; 532E   0378 0007
        BNEQ    L_5415                          ; 5330   020C 00E3

L_5332:
        JSR     R5,     L_533F                  ; 5332   0004 0150 033F
        DECLE   $0000,  $0000,  $00F2,  $0052   ; 5335   0000 0000 00F2 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5339   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 533D   0000 0000
L_533F:
        MVO     R5,     G_035D                  ; 533F   0245 035D
        MVI     G_016D, R1                      ; 5341   0281 016D
        MOVR    R0,     R2                      ; 5343   0082
        XORI    #$0080, R2                      ; 5344   03FA 0080
        MVO     R2,     G_016D                  ; 5346   0242 016D
        SWAP    R1,     1                       ; 5348   0041
        SLLC    R1,     2                       ; 5349   005D
        SLR     R1,     2                       ; 534A   0065
        SWAP    R1,     1                       ; 534B   0041
        BC      L_5352                          ; 534C   0201 0004

        MVII    #$0007, R1                      ; 534E   02B9 0007
        B       L_5354                          ; 5350   0200 0002
L_5352:
        BNOV    L_535A                          ; 5352   020A 0006

L_5354:
        JSR     R5,     L_54EA                  ; 5354   0004 0154 00EA

        CMPR    R0,     R1                      ; 5357   0141
        BEQ     L_5415                          ; 5358   0204 00BB

L_535A:
        MOVR    R1,     R5                      ; 535A   008D
        ADDR    R5,     R5                      ; 535B   00ED
        SDBD                                    ; 535C   0001
        ADDI    #$5696, R5                      ; 535D   02FD 0096 0056
        SDBD                                    ; 5360   0001
        MVI@    R5,     R0                      ; 5361   02A8
        PSHR    R0                              ; 5362   0270
        ADDI    #$016F, R1                      ; 5363   02F9 016F
        MVI@    R1,     R0                      ; 5365   0288
        PSHR    R0                              ; 5366   0270

        JSR     R5,     .EXEC.76C               ; 5367   0004 0114 036C

        MOVR    R1,     R2                      ; 536A   008A
        ADDI    #$0002, R1                      ; 536B   02F9 0002
        MVI@    R1,     R3                      ; 536D   028B
        INCR    R1                              ; 536E   0009
        MVI@    R1,     R4                      ; 536F   028C
        SDBD                                    ; 5370   0001
        MVII    #$56CA, R1                      ; 5371   02B9 00CA 0056

        JSR     R5,     X_INIT_MOB              ; 5374   0004 0114 02B2

        MVI@    R2,     R5                      ; 5377   0295
        XOR     G_016B, R5                      ; 5378   03C5 016B
        MVO@    R5,     R2                      ; 537A   0255
        ADDI    #$0002, R2                      ; 537B   02FA 0002
        MVO@    R3,     R2                      ; 537D   0253
        INCR    R2                              ; 537E   000A
        MVO@    R4,     R2                      ; 537F   0254
        PULR    R0                              ; 5380   02B0
        PULR    R2                              ; 5381   02B2
        MVII    #$0017, R3                      ; 5382   02BB 0017

        JSR     R5,     .EXEC.9AE               ; 5384   0004 0118 01AE

        PSHR    R5                              ; 5387   0275
        MVI     G_016D, R2                      ; 5388   0282 016D
        SWAP    R2,     1                       ; 538A   0042
        SLLC    R2,     2                       ; 538B   005E
        SLR     R2,     2                       ; 538C   0066
        SWAP    R2,     1                       ; 538D   0042
        BNC     L_5415                          ; 538E   0209 0085
        BOV     L_5415                          ; 5390   0202 0083

        MOVR    R2,     R0                      ; 5392   0090
        ADDI    #$016F, R2                      ; 5393   02FA 016F
        CMP@    R2,     R3                      ; 5395   0353
        BNEQ    L_5415                          ; 5396   020C 007D

        MVI     G_016D, R0                      ; 5398   0280 016D
        XORI    #$0040, R0                      ; 539A   03F8 0040
        MVO     R0,     G_016D                  ; 539C   0240 016D

        JSR     R5,     .EXEC.7AE               ; 539E   0004 0114 03AE

        MOVR    R3,     R0                      ; 53A1   0098

        JSR     R5,     .EXEC.76C               ; 53A2   0004 0114 036C

        MVI@    R1,     R0                      ; 53A5   0288
        XORI    #$0010, R0                      ; 53A6   03F8 0010
        XOR     G_016B, R0                      ; 53A8   03C0 016B
        MVO@    R0,     R1                      ; 53AA   0248
        CLRR    R0                              ; 53AB   01C0
        MVO     R0,     G_017C                  ; 53AC   0240 017C

L_53AE:
        JSR     R5,     L_5F84                  ; 53AE   0004 015C 0384

        PSHR    R5                              ; 53B1   0275
        MVII    #$031D, R1                      ; 53B2   02B9 031D

        JSR     R5,     .EXEC.7AE               ; 53B4   0004 0114 03AE

        MVI     G_016D, R0                      ; 53B7   0280 016D
        ANDI    #$00BF, R0                      ; 53B9   03B8 00BF
        XORI    #$0040, R0                      ; 53BB   03F8 0040
        MVO     R0,     G_016D                  ; 53BD   0240 016D
        B       L_53AE                          ; 53BF   0220 0012

        MVII    #$031F, R4                      ; 53C1   02BC 031F
        SDBD                                    ; 53C3   0001
        MVII    #$5434, R0                      ; 53C4   02B8 0034 0054
        MVO@    R0,     R4                      ; 53C7   0260
        SWAP    R0,     1                       ; 53C8   0040
        MVO@    R0,     R4                      ; 53C9   0260
        CLRR    R0                              ; 53CA   01C0
        MVO@    R0,     R4                      ; 53CB   0260
L_53CC:
        MOVR    R5,     R7                      ; 53CC   00AF

        PSHR    R5                              ; 53CD   0275
        MVI     G_015F, R4                      ; 53CE   0284 015F
        TSTR    R4                              ; 53D0   00A4
        BNEQ    L_5236                          ; 53D1   022C 019C

        XOR     G_015E, R4                      ; 53D3   03C4 015E
        BNEQ    L_52B6                          ; 53D5   022C 0120

        CMPI    #$0004, R0                      ; 53D7   0378 0004
        BLT     L_53DE                          ; 53D9   0205 0003
        J       L_5D32                          ; 53DB   0004 035C 0132

L_53DE:
        MVII    #$016F, R4                      ; 53DE   02BC 016F
        CLRR    R1                              ; 53E0   01C9
        DECR    R1                              ; 53E1   0011
L_53E2:
        INCR    R1                              ; 53E2   0009
        CMP@    R4,     R0                      ; 53E3   0360
        BNEQ    L_53E2                          ; 53E4   022C 0003

        MVI     G_016D, R3                      ; 53E6   0283 016D
        MOVR    R3,     R5                      ; 53E8   009D
        ANDI    #$0020, R3                      ; 53E9   03BB 0020
        BEQ     L_5416                          ; 53EB   0204 0029

        ANDI    #$000F, R5                      ; 53ED   03BD 000F
        CMPR    R5,     R1                      ; 53EF   0169
        BNEQ    L_5416                          ; 53F0   020C 0024

        XOR     G_016D, R3                      ; 53F2   03C3 016D
        XORI    #$0080, R3                      ; 53F4   03FB 0080
        MVO     R3,     G_016D                  ; 53F6   0243 016D
        MOVR    R7,     R4                      ; 53F8   00BC
        ADDI    #$00EC, R4                      ; 53F9   02FC 00EC
        PSHR    R4                              ; 53FB   0274
L_53FC:
        CMP@    R4,     R1                      ; 53FC   0361
        BNEQ    L_53FC                          ; 53FD   022C 0002

        SUB@    R6,     R4                      ; 53FF   0334
        DECR    R4                              ; 5400   0014
        ADDR    R4,     R4                      ; 5401   00E4
        SDBD                                    ; 5402   0001
        ADDI    #$5683, R4                      ; 5403   02FC 0083 0056

        JSR     R5,     .EXEC.76C               ; 5406   0004 0114 036C

        ADDI    #$0003, R1                      ; 5409   02F9 0003
        MVI@    R4,     R2                      ; 540B   02A2
        SWAP    R2,     1                       ; 540C   0042
        MVO@    R2,     R1                      ; 540D   024A
        DECR    R1                              ; 540E   0011
        MVI@    R4,     R2                      ; 540F   02A2
        SWAP    R2,     1                       ; 5410   0042
        ADDI    #$0002, R1                      ; 5411   02F9 0002
        CLRR    R2                              ; 5413   01D2
        MVO@    R2,     R1                      ; 5414   024A
L_5415:
        PULR    R7                              ; 5415   02B7

L_5416:
        DECR    R4                              ; 5416   0014
        CLRR    R3                              ; 5417   01DB
        MVO@    R3,     R4                      ; 5418   0263

        JSR     R5,     L_508D                  ; 5419   0004 0150 008D

        MOVR    R1,     R0                      ; 541C   0088
        B       L_55A7                          ; 541D   0200 0188

        PSHR    R5                              ; 541F   0275
        MOVR    R1,     R2                      ; 5420   008A
        SDBD                                    ; 5421   0001
        MVII    #$5729, R1                      ; 5422   02B9 0029 0057

        JSR     R5,     X_INIT_MOB              ; 5425   0004 0114 02B2

L_5428:
        MVI     G_031E, R0                      ; 5428   0280 031E
        TSTR    R0                              ; 542A   0080
        BEQ     L_5433                          ; 542B   0204 0006

        JSR     R5,     .EXEC.A61               ; 542D   0004 0118 0261
        DECLE   $0001                           ; 5430   0001

        B       L_5428                          ; 5431   0220 000A

L_5433:
        MVI     G_0176, R0                      ; 5433   0280 0176

        JSR     R5,     .EXEC.76C               ; 5435   0004 0114 036C

        MVI@    R1,     R0                      ; 5438   0288
        XORI    #$0010, R0                      ; 5439   03F8 0010
        XOR     G_016B, R0                      ; 543B   03C0 016B
        MVO@    R0,     R1                      ; 543D   0248
        INCR    R1                              ; 543E   0009
        SDBD                                    ; 543F   0001
        MVII    #$5742, R0                      ; 5440   02B8 0042 0057
        MVO@    R0,     R1                      ; 5443   0248

L_5444:
        JSR     R5,     .EXEC.A61               ; 5444   0004 0118 0261

        CLRC                                    ; 5447   0006
        MVI     G_016F, R0                      ; 5448   0280 016F
        TSTR    R0                              ; 544A   0080
        BNEQ    L_5444                          ; 544B   022C 0008

        JSR     R5,     L_545A                  ; 544D   0004 0154 005A
        DECLE   $006D,  $0054,  $00EE,  $0052   ; 5450   006D 0054 00EE 0052
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5454   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5458   0000 0000
L_545A:
        MVO     R5,     G_035D                  ; 545A   0245 035D
        PULR    R7                              ; 545C   02B7

        DECLE   $0019,  $0015,  $000F,  $0009   ; 545D   0019 0015 000F 0009
        DECLE   $0001,  $01F9,  $01F3,  $01ED   ; 5461   0001 01F9 01F3 01ED
        DECLE   $01E9,  $01EE,  $01F4,  $01FA   ; 5465   01E9 01EE 01F4 01FA
        DECLE   $0000                           ; 5469   0000

        CLRC                                    ; 546A   0006
        INCR    R4                              ; 546B   000C
        DECR    R2                              ; 546C   0012
        PSHR    R5                              ; 546D   0275
        CMP     G_015D, R1                      ; 546E   0341 015D
        BEQ     L_5415                          ; 5470   0224 005C

        MOVR    R0,     R1                      ; 5472   0081
        BMI     L_5415                          ; 5473   022B 005F

        ADDR    R7,     R1                      ; 5475   00F9
        SUBI    #$0019, R1                      ; 5476   0339 0019
        MVI@    R1,     R0                      ; 5478   0288
        MVII    #$0025, R1                      ; 5479   02B9 0025
        SARC    R0,     1                       ; 547B   0078
        BNC     L_5480                          ; 547C   0209 0002

        MVII    #$0038, R1                      ; 547E   02B9 0038
L_5480:
        SWAP    R0,     1                       ; 5480   0040
        XORR    R1,     R0                      ; 5481   01C8
        MVO     R0,     G_031D                  ; 5482   0240 031D

        JSR     R5,     L_5491                  ; 5484   0004 0154 0091
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5487   0000 0000 0000 0000

        ADDR    R0,     R4                      ; 548B   00C4
        RLC     R3,     2                       ; 548C   0057
        ADDR    R4,     R4                      ; 548D   00E4
        RLC     R3,     2                       ; 548E   0057
        ADDR    R4,     R4                      ; 548F   00E4
        RLC     R3,     2                       ; 5490   0057
L_5491:
        MVO     R5,     G_035D                  ; 5491   0245 035D
        MVI     G_0176, R0                      ; 5493   0280 0176

        JSR     R5,     .EXEC.76C               ; 5495   0004 0114 036C

        ADDI    #$0005, R1                      ; 5498   02F9 0005
        MVII    #$0200, R0                      ; 549A   02B8 0200
        MVO@    R0,     R1                      ; 549C   0248
        INCR    R1                              ; 549D   0009
        MVII    #$0010, R0                      ; 549E   02B8 0010
        MVO@    R0,     R1                      ; 54A0   0248
        PULR    R7                              ; 54A1   02B7

        PSHR    R5                              ; 54A2   0275
        MOVR    R1,     R2                      ; 54A3   008A
        SDBD                                    ; 54A4   0001
        MVII    #$56CA, R1                      ; 54A5   02B9 00CA 0056

        JSR     R5,     X_INIT_MOB              ; 54A8   0004 0114 02B2

        MVI@    R2,     R5                      ; 54AB   0295
        XOR     G_016B, R5                      ; 54AC   03C5 016B
        MVO@    R5,     R2                      ; 54AE   0255
        MOVR    R2,     R1                      ; 54AF   0091
        MVII    #$0054, R0                      ; 54B0   02B8 0054
        SWAP    R0,     1                       ; 54B2   0040
        ADDI    #$0002, R2                      ; 54B3   02FA 0002
        MVO@    R0,     R2                      ; 54B5   0250
        MVII    #$0034, R0                      ; 54B6   02B8 0034
        SWAP    R0,     1                       ; 54B8   0040
        INCR    R2                              ; 54B9   000A
        MVO@    R0,     R2                      ; 54BA   0250
        SDBD                                    ; 54BB   0001
        MVII    #$56A4, R5                      ; 54BC   02BD 00A4 0056
        SDBD                                    ; 54BF   0001
        MVI@    R5,     R2                      ; 54C0   02AA
        MVII    #$0017, R3                      ; 54C1   02BB 0017

        JSR     R5,     .EXEC.9A8               ; 54C3   0004 0118 01A8

        SDBD                                    ; 54C6   0001
        MVII    #$56A8, R1                      ; 54C7   02B9 00A8 0056
        MVII    #$031D, R2                      ; 54CA   02BA 031D
        MVI@    R2,     R3                      ; 54CC   0293

        JSR     R5,     X_INIT_MOB              ; 54CD   0004 0114 02B2

        MVO     R3,     G_0321                  ; 54D0   0243 0321

        JSR     R5,     L_5FB0                  ; 54D2   0004 015C 03B0
L_54D5:
        JSR     R5,     .EXEC.A61               ; 54D5   0004 0118 0261
        DECLE   $0001                           ; 54D8   0001

        MVI     G_0320, R0                      ; 54D9   0280 0320
        SWAP    R0,     1                       ; 54DB   0040
        ANDI    #$00FF, R0                      ; 54DC   03B8 00FF
        CMPI    #$0058, R0                      ; 54DE   0378 0058
        BLT     L_54D5                          ; 54E0   0225 000C
        J       L_57ED                          ; 54E2   0004 0354 03ED

        DECLE   $0008,  $0005,  $0006,  $0000   ; 54E5   0008 0005 0006 0000

        SETC                                    ; 54E9   0007
L_54EA:
        PSHR    R5                              ; 54EA   0275
        MOVR    R0,     R3                      ; 54EB   0083
        MOVR    R1,     R4                      ; 54EC   008C
        SDBD                                    ; 54ED   0001
        MVII    #$56A8, R1                      ; 54EE   02B9 00A8 0056
        MVII    #$031D, R2                      ; 54F1   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 54F3   0004 0114 02B2

        MOVR    R4,     R1                      ; 54F6   00A1
        ADDI    #$016F, R1                      ; 54F7   02F9 016F
        MVI@    R1,     R0                      ; 54F9   0288

        JSR     R5,     .EXEC.76C               ; 54FA   0004 0114 036C

        MVI@    R1,     R0                      ; 54FD   0288
        XORI    #$0010, R0                      ; 54FE   03F8 0010
        XOR     G_016B, R0                      ; 5500   03C0 016B
        MVO@    R0,     R1                      ; 5502   0248
        ADDI    #$0002, R1                      ; 5503   02F9 0002
        MVI@    R1,     R0                      ; 5505   0288
        MVO     R0,     G_031F                  ; 5506   0240 031F
        INCR    R1                              ; 5508   0009
        MVI@    R1,     R0                      ; 5509   0288
        MVO     R0,     G_0320                  ; 550A   0240 0320
        MOVR    R3,     R5                      ; 550C   009D
        ADDR    R5,     R5                      ; 550D   00ED
        SDBD                                    ; 550E   0001
        ADDI    #$5696, R5                      ; 550F   02FD 0096 0056
        SDBD                                    ; 5512   0001
        MVI@    R5,     R2                      ; 5513   02AA
        MOVR    R7,     R5                      ; 5514   00BD
        SUBI    #$0030, R5                      ; 5515   033D 0030
L_5517:
        CMP@    R5,     R3                      ; 5517   036B
        BEQ     L_5522                          ; 5518   0204 0008

        SDBD                                    ; 551A   0001
        CMPI    #$54EA, R5                      ; 551B   037D 00EA 0054
        BNEQ    L_5517                          ; 551E   022C 0008
        B       L_5540                          ; 5520   0200 001E

L_5522:
        SUBR    R7,     R5                      ; 5522   013D
        ADDI    #$003D, R5                      ; 5523   02FD 003D
        ADDR    R5,     R5                      ; 5525   00ED
        SDBD                                    ; 5526   0001
        ADDI    #$5683, R5                      ; 5527   02FD 0083 0056
        SDBD                                    ; 552A   0001
        MVI@    R5,     R2                      ; 552B   02AA
        PSHR    R2                              ; 552C   0272
        PSHR    R3                              ; 552D   0273
        ADDI    #$016F, R3                      ; 552E   02FB 016F
        MVI@    R3,     R0                      ; 5530   0298
        MVII    #$002D, R3                      ; 5531   02BB 002D

        JSR     R5,     .EXEC.9AD               ; 5533   0004 0118 01AD

        MVI     G_016D, R0                      ; 5536   0280 016D
        ANDI    #$005F, R0                      ; 5538   03B8 005F
        XORI    #$0020, R0                      ; 553A   03F8 0020
        MVO     R0,     G_016D                  ; 553C   0240 016D
        PULR    R3                              ; 553E   02B3
        PULR    R2                              ; 553F   02B2
L_5540:
        CLRR    R0                              ; 5540   01C0
        PSHR    R3                              ; 5541   0273
        CMPI    #$0005, R3                      ; 5542   037B 0005
        BEQ     L_5551                          ; 5544   0204 000B

        MVI     G_0320, R3                      ; 5546   0283 0320
        SWAP    R3,     1                       ; 5548   0043
        ANDI    #$00FF, R3                      ; 5549   03BB 00FF
        CMPI    #$001C, R3                      ; 554B   037B 001C
        MVII    #$002D, R3                      ; 554D   02BB 002D
        BGT     L_5553                          ; 554F   020E 0002

L_5551:
        MVII    #$0021, R3                      ; 5551   02BB 0021

L_5553:
        JSR     R5,     .EXEC.9AD               ; 5553   0004 0118 01AD

        PULR    R3                              ; 5556   02B3
        CMPI    #$0007, R3                      ; 5557   037B 0007
        BNEQ    L_558E                          ; 5559   020C 0033

        MVI     G_0180, R0                      ; 555B   0280 0180
        TSTR    R0                              ; 555D   0080
        BNEQ    L_558E                          ; 555E   020C 002E

        MVO     R3,     G_016D                  ; 5560   0243 016D
        MVI     G_0176, R0                      ; 5562   0280 0176

        JSR     R5,     .EXEC.76C               ; 5564   0004 0114 036C

        INCR    R1                              ; 5567   0009
        SDBD                                    ; 5568   0001
        MVII    #$5719, R0                      ; 5569   02B8 0019 0057
        MVO@    R0,     R1                      ; 556C   0248
        INCR    R1                              ; 556D   0009
        MVI@    R1,     R0                      ; 556E   0288
        SWAP    R0,     1                       ; 556F   0040
        ANDI    #$00FF, R0                      ; 5570   03B8 00FF
        SUBI    #$0002, R1                      ; 5572   0339 0002
        MVII    #$0200, R2                      ; 5574   02BA 0200
        COMR    R2                              ; 5576   001A
        AND@    R1,     R2                      ; 5577   038A
        CMPI    #$0054, R0                      ; 5578   0378 0054
        BLT     L_557E                          ; 557A   0205 0002

        XORI    #$0200, R2                      ; 557C   03FA 0200
L_557E:
        MVO@    R2,     R1                      ; 557E   024A
        SDBD                                    ; 557F   0001
        MVII    #$56C3, R0                      ; 5580   02B8 00C3 0056
        MVO     R0,     G_031E                  ; 5583   0240 031E
        SDBD                                    ; 5585   0001
        MVII    #$1906, R0                      ; 5586   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5589   0240 035D

        JSR     R5,     L_5760                  ; 558B   0004 0154 0360

L_558E:
        MOVR    R3,     R0                      ; 558E   0098
        MOVR    R4,     R1                      ; 558F   00A1
        PULR    R7                              ; 5590   02B7

L_5591:
        PSHR    R5                              ; 5591   0275
        MOVR    R0,     R1                      ; 5592   0081
        ADDI    #$016F, R1                      ; 5593   02F9 016F
        MVI@    R1,     R2                      ; 5595   028A
        TSTR    R2                              ; 5596   0092
        SETC                                    ; 5597   0007
        BNEQ    L_5415                          ; 5598   022C 0184

        JSR     R5,     L_55A2                  ; 559A   0004 0154 01A2
        JSR     R5,     L_55B7                  ; 559D   0004 0154 01B7

        CLRC                                    ; 55A0   0006
        PULR    R7                              ; 55A1   02B7

L_55A2:
        PSHR    R5                              ; 55A2   0275
        CLRR    R5                              ; 55A3   01ED
        B       L_55AD                          ; 55A4   0200 0007

L_55A6:
        PSHR    R5                              ; 55A6   0275
L_55A7:
        SDBD                                    ; 55A7   0001
        MVII    #$0928, R5                      ; 55A8   02BD 0028 0009
        XOR     G_016B, R5                      ; 55AB   03C5 016B
L_55AD:
        PSHR    R1                              ; 55AD   0271
        MOVR    R0,     R1                      ; 55AE   0081
        SDBD                                    ; 55AF   0001
        ADDI    #$568D, R1                      ; 55B0   02F9 008D 0056
        MVI@    R1,     R1                      ; 55B3   0289
        MVO@    R5,     R1                      ; 55B4   024D
        PULR    R1                              ; 55B5   02B1
        PULR    R7                              ; 55B6   02B7

L_55B7:
        PSHR    R5                              ; 55B7   0275
        MOVR    R0,     R3                      ; 55B8   0083

        JSR     R5,     L_504F                  ; 55B9   0004 0150 004F

        INCR    R7                              ; 55BC   000F

L_55BD:
        PSHR    R5                              ; 55BD   0275

L_55BE:
        JSR     R5,     .EXEC.76C               ; 55BE   0004 0114 036C

        MOVR    R3,     R2                      ; 55C1   009A
        ADDI    #$016F, R2                      ; 55C2   02FA 016F
        MVO@    R0,     R2                      ; 55C4   0250
        MOVR    R1,     R2                      ; 55C5   008A
        SDBD                                    ; 55C6   0001
        MVII    #$56CA, R1                      ; 55C7   02B9 00CA 0056

        JSR     R5,     X_INIT_MOB              ; 55CA   0004 0114 02B2

        MVI@    R2,     R5                      ; 55CD   0295
        XOR     G_016B, R5                      ; 55CE   03C5 016B
        MVO@    R5,     R2                      ; 55D0   0255
        MOVR    R2,     R5                      ; 55D1   0095
        MOVR    R3,     R0                      ; 55D2   0098
        ADDR    R3,     R3                      ; 55D3   00DB
        SDBD                                    ; 55D4   0001
        ADDI    #$5696, R3                      ; 55D5   02FB 0096 0056
        MVI@    R3,     R1                      ; 55D8   0299
        SWAP    R1,     1                       ; 55D9   0041
        INCR    R3                              ; 55DA   000B
        MVI@    R3,     R3                      ; 55DB   029B
        SWAP    R3,     1                       ; 55DC   0043
        ADDI    #$0002, R2                      ; 55DD   02FA 0002
        MVO@    R3,     R2                      ; 55DF   0253
        INCR    R2                              ; 55E0   000A
        MVO@    R1,     R2                      ; 55E1   0251
        PULR    R7                              ; 55E2   02B7

L_55E3:
        PSHR    R5                              ; 55E3   0275
        MVI     G_016D, R1                      ; 55E4   0281 016D
        SWAP    R1,     1                       ; 55E6   0041
        SLLC    R1,     2                       ; 55E7   005D
        SLR     R1,     2                       ; 55E8   0065
        SWAP    R1,     1                       ; 55E9   0041
        BNC     L_561A                          ; 55EA   0209 002E

        ADDI    #$016F, R1                      ; 55EC   02F9 016F
        MVI@    R1,     R0                      ; 55EE   0288
        ANDI    #$0003, R0                      ; 55EF   03B8 0003

        JSR     R5,     .EXEC.76C               ; 55F1   0004 0114 036C

        MOVR    R1,     R2                      ; 55F4   008A
        ADDI    #$0003, R2                      ; 55F5   02FA 0003
        MVI     G_015D, R1                      ; 55F7   0281 015D
        XORI    #$0001, R1                      ; 55F9   03F9 0001
        ADDI    #$011F, R1                      ; 55FB   02F9 011F
        MVI@    R1,     R1                      ; 55FD   0289
        SWAP    R1,     1                       ; 55FE   0041
        SLLC    R1,     2                       ; 55FF   005D
        SLR     R1,     2                       ; 5600   0065
        SWAP    R1,     1                       ; 5601   0041
        BC      L_561A                          ; 5602   0201 0016
        BOV     L_5616                          ; 5604   0202 0010

        MVI@    R2,     R0                      ; 5606   0290
        SWAP    R0,     1                       ; 5607   0040
        ANDI    #$00FF, R0                      ; 5608   03B8 00FF
        CMPI    #$001C, R0                      ; 560A   0378 001C
        MVII    #$0011, R0                      ; 560C   02B8 0011
        BGT     L_5612                          ; 560E   020E 0002

        MVII    #$000B, R0                      ; 5610   02B8 000B

L_5612:
        JSR     R5,     .EXEC.629               ; 5612   0004 0114 0229

        INCR    R7                              ; 5615   000F

L_5616:
        CLRR    R0                              ; 5616   01C0
L_5617:
        ADDI    #$0001, R2                      ; 5617   02FA 0001
        MVO@    R0,     R2                      ; 5619   0250
L_561A:
        MVII    #$0007, R0                      ; 561A   02B8 0007
L_561C:
        PSHR    R0                              ; 561C   0270

        JSR     R5,     L_5625                  ; 561D   0004 0154 0225

        PULR    R0                              ; 5620   02B0
        DECR    R0                              ; 5621   0010
        BPL     L_561C                          ; 5622   0223 0007
L_5624:
        PULR    R7                              ; 5624   02B7

L_5625:
        PSHR    R5                              ; 5625   0275

        JSR     R5,     .EXEC.76C               ; 5626   0004 0114 036C

        INCR    R1                              ; 5629   0009
        MVI@    R1,     R3                      ; 562A   028B
        MVII    #$0006, R2                      ; 562B   02BA 0006

        JSR     R5,     L_563C                  ; 562D   0004 0154 023C
        BIDECLE $5712                           ; 5630   0012 0057

        ADDR    R6,     R6                      ; 5632   00F6
        RLC     R2,     2                       ; 5633   0056
        ADDR    R3,     R2                      ; 5634   00DA
        RLC     R2,     2                       ; 5635   0056
        ADDR    R7,     R5                      ; 5636   00FD
        RLC     R2,     2                       ; 5637   0056
        ADDR    R7,     R5                      ; 5638   00FD
        RLC     R2,     2                       ; 5639   0056
        ADDR    R4,     R1                      ; 563A   00E1
        RLC     R2,     2                       ; 563B   0056
L_563C:
        MOVR    R5,     R4                      ; 563C   00AC
L_563D:
        SDBD                                    ; 563D   0001
        CMP@    R5,     R3                      ; 563E   036B
        BEQ     L_5645                          ; 563F   0204 0004

        DECR    R2                              ; 5641   0012
        BNEQ    L_563D                          ; 5642   022C 0006
        PULR    R7                              ; 5644   02B7

L_5645:
        CMPI    #$0004, R2                      ; 5645   037A 0004
        BGE     L_564B                          ; 5647   020D 0002

        ADDI    #$0006, R4                      ; 5649   02FC 0006
L_564B:
        ADDI    #$0003, R1                      ; 564B   02F9 0003
        MVI@    R1,     R0                      ; 564D   0288
        MOVR    R0,     R5                      ; 564E   0085
        MOVR    R0,     R2                      ; 564F   0082
        BEQ     L_5674                          ; 5650   0204 0022

        ANDI    #$00FF, R2                      ; 5652   03BA 00FF
        XORR    R2,     R0                      ; 5654   01D0
        BPL     L_5658                          ; 5655   0203 0001

        NEGR    R0                              ; 5657   0020
L_5658:
        SWAP    R2,     1                       ; 5658   0042
        TSTR    R2                              ; 5659   0092
        BPL     L_565D                          ; 565A   0203 0001

        NEGR    R2                              ; 565C   0022
L_565D:
        SLR     R2,     1                       ; 565D   0062
        CMPR    R2,     R0                      ; 565E   0150
        SDBD                                    ; 565F   0001
        MVI@    R4,     R2                      ; 5660   02A2
        BLT     L_5678                          ; 5661   0205 0015

        SDBD                                    ; 5663   0001
        MVI@    R4,     R2                      ; 5664   02A2
        SUBI    #$0004, R1                      ; 5665   0339 0004
        MVII    #$0200, R0                      ; 5667   02B8 0200
        COMR    R0                              ; 5669   0018
        AND@    R1,     R0                      ; 566A   0388
        TSTR    R5                              ; 566B   00AD
        BPL     L_5670                          ; 566C   0203 0002

        XORI    #$0200, R0                      ; 566E   03F8 0200
L_5670:
        MVO@    R0,     R1                      ; 5670   0248
        INCR    R1                              ; 5671   0009
        MVO@    R2,     R1                      ; 5672   024A
        PULR    R7                              ; 5673   02B7

L_5674:
        ADDI    #$0004, R4                      ; 5674   02FC 0004
        SDBD                                    ; 5676   0001
        MVI@    R4,     R2                      ; 5677   02A2
L_5678:
        CMPR    R2,     R3                      ; 5678   0153
        BEQ     L_5624                          ; 5679   0224 0056

        INCR    R1                              ; 567B   0009
        MVII    #$03F0, R0                      ; 567C   02B8 03F0
        MVO@    R0,     R1                      ; 567E   0248
        SUBI    #$0004, R1                      ; 567F   0339 0004
        MVO@    R2,     R1                      ; 5681   024A
        PULR    R7                              ; 5682   02B7

        DECLE   $0038,  $0090,  $0024,  $0054   ; 5683   0038 0090 0024 0054
        DECLE   $0038,  $0018,  $0054,  $0054   ; 5687   0038 0018 0054 0054
        DECLE   $0034,  $0054,  $02E6,  $022A   ; 568B   0034 0054 02E6 022A
        DECLE   $021C,  $0239                   ; 568F   021C 0239

        MVO@    R4,     R2                      ; 5691   0254
        MVO@    R0,     R1                      ; 5692   0248
        MVO@    R5,     R4                      ; 5693   0265
        MVI     .BTAB.76,R3                     ; 5694   0283 0276
        SLR     R0,     1                       ; 5696   0060
        SLLC    R0,     1                       ; 5697   0058
        COMR    R0                              ; 5698   0018
        COMR    R0                              ; 5699   0018
        DECR    R0                              ; 569A   0010
        SLL     R0,     1                       ; 569B   0048
        COMR    R0                              ; 569C   0018
        MOVR    R2,     R0                      ; 569D   0090
        ADCR    R0                              ; 569E   0028
        ADCR    R0                              ; 569F   0028
        NEGR    R0                              ; 56A0   0020
        SAR     R0,     1                       ; 56A1   0068
        GSWD    R0                              ; 56A2   0030
        DECR    R0                              ; 56A3   0010
        RSWD    R0                              ; 56A4   0038
        SLR     R0,     1                       ; 56A5   0060
        GSWD    R0                              ; 56A6   0030
        MOVR    R3,     R0                      ; 56A7   0098
        MOVR    R0,     R7                      ; 56A8   0087

        DECLE   $0018,  $00B6,  $0056,  $0000   ; 56A9   0018 00B6 0056 0000
        DECLE   $0054,  $0000,  $0034,  $0030   ; 56AD   0054 0000 0034 0030
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56B1   0000 0000 0000 0000
        DECLE   $0000,  $037C,  $005A,  $002C   ; 56B5   0000 037C 005A 002C
        DECLE   $0059,  $0001,  $0000           ; 56B9   0059 0001 0000

        CLRC                                    ; 56BC   0006
        MOVR    R0,     R7                      ; 56BD   0087

        CMPR    R2,     R3                      ; 56BE   0153
        MVI     G_0053, R7                      ; 56BF   0287 0053
        MVI     G_0153, R7                      ; 56C1   0287 0153

        DECLE   $037C,  $005A,  $00C1,  $0053   ; 56C3   037C 005A 00C1 0053
        DECLE   $0001,  $0000,  $0000,  $0040   ; 56C7   0001 0000 0000 0040
        DECLE   $0018,  $00DA,  $0056,  $0000   ; 56CB   0018 00DA 0056 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 56CF   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $0003,  $0000   ; 56D3   0000 00F0 0003 0000
        DECLE   $0000,  $0000,  $0000,  $0300   ; 56D7   0000 0000 0000 0300
        DECLE   $0000,  $00CD,  $0053,  $0001   ; 56DB   0000 00CD 0053 0001
        DECLE   $0001,  $0000,  $0000,  $0000   ; 56DF   0001 0000 0000 0000
        DECLE   $0076,  $005C,  $0001,  $0001   ; 56E3   0076 005C 0001 0001
        DECLE   $000E,  $001C,  $015D,  $021C   ; 56E7   000E 001C 015D 021C
        DECLE   $005D,  $021C,  $015D,  $01B2   ; 56EB   005D 021C 015D 01B2
        DECLE   $005C,  $01B2,  $015C,  $03B2   ; 56EF   005C 01B2 015C 03B2
        DECLE   $005C,  $03B2,  $015C,  $0300   ; 56F3   005C 03B2 015C 0300
        DECLE   $0000,  $00CD,  $0053,  $0008   ; 56F7   0000 00CD 0053 0008
        DECLE   $000B,  $0000,  $0000,  $0000   ; 56FB   000B 0000 0000 0000
        DECLE   $0076,  $005C,  $0008,  $000B   ; 56FF   0076 005C 0008 000B
        DECLE   $000E,  $001C,  $015D,  $021C   ; 5703   000E 001C 015D 021C
        DECLE   $005D,  $021C,  $015D,  $01B2   ; 5707   005D 021C 015D 01B2
        DECLE   $005C,  $01B2,  $015C,  $03B2   ; 570B   005C 01B2 015C 03B2
        DECLE   $005C,  $03B2,  $015C,  $0300   ; 570F   005C 03B2 015C 0300
        DECLE   $0000,  $00CD,  $0053,  $0004   ; 5713   0000 00CD 0053 0004
        DECLE   $0003,  $0000,  $0300,  $0000   ; 5717   0003 0000 0300 0000
        DECLE   $001F,  $0054,  $0008,  $000B   ; 571B   001F 0054 0008 000B
        DECLE   $0002,  $00B1,  $0053,  $0300   ; 571F   0002 00B1 0053 0300
        DECLE   $0000,  $00B6,  $0057,  $0008   ; 5723   0000 00B6 0057 0008
        DECLE   $000B,  $0000,  $0040,  $0018   ; 5727   000B 0000 0040 0018
        DECLE   $0039,  $0057,  $0000,  $0054   ; 572B   0039 0057 0000 0054
        DECLE   $0000,  $0034,  $0000,  $0000   ; 572F   0000 0034 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5733   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; 5737   0000 0000 0300 0000
        DECLE   $00A2,  $0054,  $0008,  $001B   ; 573B   00A2 0054 0008 001B
        DECLE   $0002,  $00B1,  $0053,  $0300   ; 573F   0002 00B1 0053 0300
        DECLE   $0000,  $00A2,  $0054,  $0008   ; 5743   0000 00A2 0054 0008
        DECLE   $001B,  $0000,  $0040,  $0018   ; 5747   001B 0000 0040 0018
        DECLE   $0059,  $0057,  $0000,  $004E   ; 574B   0059 0057 0000 004E
        DECLE   $0000,  $0057,  $0000,  $0000   ; 574F   0000 0057 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5753   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; 5757   0000 0000 0300 0000
        DECLE   $00E5,  $0059,  $0008,  $002B   ; 575B   00E5 0059 0008 002B
        DECLE   $0000                           ; 575F   0000
L_5760:
        PSHR    R5                              ; 5760   0275

        JSR     R5,     L_5A12                  ; 5761   0004 0158 0212

        MVI     G_0180, R0                      ; 5764   0280 0180
        TSTR    R0                              ; 5766   0080
        BNEQ    L_57B5                          ; 5767   020C 004C

        MVI     G_0160, R0                      ; 5769   0280 0160

        JSR     R5,     .EXEC.76C               ; 576B   0004 0114 036C

        TSTR    R0                              ; 576E   0080
        BNEQ    L_57B7                          ; 576F   020C 0046

        PSHR    R3                              ; 5771   0273
        PSHR    R4                              ; 5772   0274
        CLRR    R0                              ; 5773   01C0
        MVO     R0,     G_0161                  ; 5774   0240 0161
        MVO     R0,     G_0162                  ; 5776   0240 0162

        JSR     R5,     L_51CA                  ; 5778   0004 0150 01CA
        JSR     R5,     L_5078                  ; 577B   0004 0150 0078

        MVO     R0,     G_0160                  ; 577E   0240 0160

        JSR     R5,     .EXEC.76C               ; 5780   0004 0114 036C

        MOVR    R1,     R2                      ; 5783   008A
        SDBD                                    ; 5784   0001
        MVII    #$56CA, R1                      ; 5785   02B9 00CA 0056

        JSR     R5,     X_INIT_MOB              ; 5788   0004 0114 02B2

        MVI@    R2,     R1                      ; 578B   0291
        XOR     G_016A, R1                      ; 578C   03C1 016A
        MVII    #$0036, R3                      ; 578E   02BB 0036
        MVI     G_015D, R4                      ; 5790   0284 015D
        TSTR    R4                              ; 5792   00A4
        BNEQ    L_5799                          ; 5793   020C 0004

        MVII    #$0072, R3                      ; 5795   02BB 0072
        XORI    #$0200, R1                      ; 5797   03F9 0200
L_5799:
        MVO@    R1,     R2                      ; 5799   0251
        INCR    R2                              ; 579A   000A
        SDBD                                    ; 579B   0001
        MVII    #$5722, R1                      ; 579C   02B9 0022 0057
        MVO@    R1,     R2                      ; 579F   0251
        INCR    R2                              ; 57A0   000A
        SWAP    R3,     1                       ; 57A1   0043
        MVO@    R3,     R2                      ; 57A2   0253
        INCR    R2                              ; 57A3   000A
        MVII    #$0059, R3                      ; 57A4   02BB 0059
        SWAP    R3,     1                       ; 57A6   0043
        MVO@    R3,     R2                      ; 57A7   0253
        SDBD                                    ; 57A8   0001
        MVII    #$5158, R2                      ; 57A9   02BA 0058 0051
        MVI     G_0160, R0                      ; 57AC   0280 0160
        MVII    #$001E, R3                      ; 57AE   02BB 001E

        JSR     R5,     .EXEC.9AD               ; 57B0   0004 0118 01AD

        PULR    R4                              ; 57B3   02B4
        PULR    R3                              ; 57B4   02B3
L_57B5:
        PULR    R7                              ; 57B5   02B7

        PSHR    R5                              ; 57B6   0275
L_57B7:
        MOVR    R1,     R2                      ; 57B7   008A
        SDBD                                    ; 57B8   0001
        MVII    #$5749, R1                      ; 57B9   02B9 0049 0057

        JSR     R5,     X_INIT_MOB              ; 57BC   0004 0114 02B2

        MVI@    R2,     R0                      ; 57BF   0290
        XOR     G_016A, R0                      ; 57C0   03C0 016A
        MVO@    R0,     R2                      ; 57C2   0250
        PULR    R7                              ; 57C3   02B7

L_57C4:
        PSHR    R5                              ; 57C4   0275
        CMP     G_015D, R1                      ; 57C5   0341 015D
        BNEQ    L_57B5                          ; 57C7   022C 0013

        SDBD                                    ; 57C9   0001
        MVII    #$1906, R0                      ; 57CA   02B8 0006 0019
        MVO     R0,     G_035D                  ; 57CD   0240 035D

        JSR     R5,     L_5F8E                  ; 57CF   0004 015C 038E

        MVI     G_0160, R0                      ; 57D2   0280 0160

        JSR     R5,     .EXEC.76C               ; 57D4   0004 0114 036C

        ADDI    #$0005, R1                      ; 57D7   02F9 0005
        MVII    #$03F0, R0                      ; 57D9   02B8 03F0
        MVO@    R0,     R1                      ; 57DB   0248
        INCR    R1                              ; 57DC   0009
        MVII    #$0008, R0                      ; 57DD   02B8 0008
        CLRR    R2                              ; 57DF   01D2
L_57E0:
        MVO@    R0,     R1                      ; 57E0   0248
        MVO     R2,     G_0182                  ; 57E1   0242 0182
        PULR    R7                              ; 57E3   02B7

        PSHR    R5                              ; 57E4   0275

        JSR     R5,     L_57C4                  ; 57E5   0004 0154 03C4

        MVII    #$0005, R0                      ; 57E8   02B8 0005
        MOVR    R0,     R2                      ; 57EA   0082
        B       L_57E0                          ; 57EB   0220 000C

L_57ED:
        MVI     G_0160, R0                      ; 57ED   0280 0160

        JSR     R5,     .EXEC.76C               ; 57EF   0004 0114 036C

        ADDI    #$0005, R1                      ; 57F2   02F9 0005
        MVI@    R1,     R0                      ; 57F4   0288
        ANDI    #$000F, R0                      ; 57F5   03B8 000F
        MVII    #$0002, R5                      ; 57F7   02BD 0002
        MVII    #$0051, R3                      ; 57F9   02BB 0051
        MVII    #$0057, R4                      ; 57FB   02BC 0057
        BEQ     L_5801                          ; 57FD   0204 0002

        SUBR    R5,     R3                      ; 57FF   012B
        ADDR    R5,     R4                      ; 5800   00EC
L_5801:
        MVI     G_031F, R2                      ; 5801   0282 031F
        SWAP    R2,     1                       ; 5803   0042
        ANDI    #$00FF, R2                      ; 5804   03BA 00FF
        CMPR    R3,     R2                      ; 5806   015A
        BLT     L_585A                          ; 5807   0205 0051

        CMPR    R4,     R2                      ; 5809   0162
        BGT     L_585A                          ; 580A   020E 004E

        DECR    R5                              ; 580C   0015
        CMPI    #$0007, R0                      ; 580D   0378 0007
        BEQ     L_585A                          ; 580F   0204 0049

        SUBI    #$0002, R0                      ; 5811   0338 0002
        BLT     L_585A                          ; 5813   0205 0045

        SUBI    #$0004, R0                      ; 5815   0338 0004
        NEGR    R0                              ; 5817   0020
        MVII    #$0021, R1                      ; 5818   02B9 0021

        JSR     R5,     X_MPY                   ; 581A   0004 011C 01DC

        MVII    #$0021, R0                      ; 581D   02B8 0021

        JSR     R5,     X_RAND2                 ; 581F   0004 0114 029E

        ADDR    R0,     R2                      ; 5822   00C2
        MVI     G_0182, R0                      ; 5823   0280 0182
        TSTR    R0                              ; 5825   0080
        MVII    #$004A, R0                      ; 5826   02B8 004A
        MVII    #$0014, R3                      ; 5828   02BB 0014
        MVII    #$001F, R4                      ; 582A   02BC 001F
        BEQ     L_5839                          ; 582C   0204 000B

        MVII    #$00A7, R0                      ; 582E   02B8 00A7

        JSR     R5,     X_RAND2                 ; 5830   0004 0114 029E

        MOVR    R0,     R2                      ; 5833   0082
        MOVR    R3,     R0                      ; 5834   0098
        MOVR    R3,     R4                      ; 5835   009C
        SLR     R3,     1                       ; 5836   0063
        B       L_583C                          ; 5837   0200 0003

L_5839:
        JSR     R5,     X_RAND2                 ; 5839   0004 0114 029E

L_583C:
        SWAP    R2,     1                       ; 583C   0042
        XORR    R0,     R2                      ; 583D   01C2
        MVO     R3,     G_0323                  ; 583E   0243 0323
        MOVR    R4,     R0                      ; 5840   00A0

        JSR     R5,     X_RAND2                 ; 5841   0004 0114 029E

        ADDR    R0,     R3                      ; 5844   00C3
        MVO     R3,     G_017C                  ; 5845   0243 017C
        MVII    #$031D, R1                      ; 5847   02B9 031D

        JSR     R5,     .EXEC.9A3               ; 5849   0004 0118 01A3
        JSR     R5,     L_59F2                  ; 584C   0004 0158 01F2

        MVII    #$00FF, R0                      ; 584F   02B8 00FF
        MVO     R0,     G_0167                  ; 5851   0240 0167

        JSR     R5,     L_5905                  ; 5853   0004 0158 0105
        JSR     R5,     L_5F9C                  ; 5856   0004 015C 039C

        CLRR    R5                              ; 5859   01ED
L_585A:
        MVO     R5,     G_0181                  ; 585A   0245 0181
        PULR    R7                              ; 585C   02B7

L_585D:
        MVI     G_0181, R0                      ; 585D   0280 0181
        CLRR    R1                              ; 585F   01C9
        MVO     R1,     G_0181                  ; 5860   0241 0181
        DECR    R0                              ; 5862   0010
        BMI     L_57B5                          ; 5863   022B 00AF

        PSHR    R0                              ; 5865   0270

        JSR     R5,     L_591D                  ; 5866   0004 0158 011D

        PULR    R0                              ; 5869   02B0
        TSTR    R0                              ; 586A   0080
        BNEQ    L_588A                          ; 586B   020C 001D

L_586D:
        JSR     R5,     L_509B                  ; 586D   0004 0150 009B
        DECLE   $022F,  $0053,  $0054,  $0052   ; 5870   022F 0053 0054 0052
        DECLE   $0049,  $004B,  $0045,  $0000   ; 5874   0049 004B 0045 0000
L_5878:
        MVI     G_0161, R2                      ; 5878   0282 0161
        INCR    R2                              ; 587A   000A
        MVO     R2,     G_0161                  ; 587B   0242 0161

        JSR     R5,     L_51CA                  ; 587D   0004 0150 01CA

        CMPI    #$0003, R2                      ; 5880   037A 0003
        BNEQ    L_57B5                          ; 5882   022C 00CE

        JSR     R5,     L_59F2                  ; 5884   0004 0158 01F2

        J       L_5CB7                          ; 5887   0004 035C 00B7

L_588A:
        MVI     G_0160, R0                      ; 588A   0280 0160

        JSR     R5,     .EXEC.76C               ; 588C   0004 0114 036C

        ADDI    #$0005, R1                      ; 588F   02F9 0005
        MVI@    R1,     R0                      ; 5891   0288
        ANDI    #$000F, R0                      ; 5892   03B8 000F
        BNEQ    L_586D                          ; 5894   022C 0028

        JSR     R5,     L_509B                  ; 5896   0004 0150 009B
        DECLE   $0230,  $0042,  $0041,  $004C   ; 5899   0230 0042 0041 004C
        DECLE   $004C,  $0000                   ; 589D   004C 0000

        MVI     G_0162, R2                      ; 589F   0282 0162
        INCR    R2                              ; 58A1   000A
        MVO     R2,     G_0162                  ; 58A2   0242 0162

        JSR     R5,     L_51CA                  ; 58A4   0004 0150 01CA

        SUBI    #$0004, R2                      ; 58A7   033A 0004
        BNEQ    L_57B5                          ; 58A9   022C 00F5

        MVO     R2,     G_031E                  ; 58AB   0242 031E
        MVII    #$0001, R0                      ; 58AD   02B8 0001

        JSR     R5,     X_PLAY_CHEER1           ; 58AF   0004 011C 02D5
        JSR     R5,     L_509B                  ; 58B2   0004 0150 009B
        DECLE   $0230,  $0057,  $0041,  $004C   ; 58B5   0230 0057 0041 004C
        DECLE   $004B,  $0000                   ; 58B9   004B 0000

        JSR     R5,     L_59F2                  ; 58BB   0004 0158 01F2
        JSR     R5,     .EXEC.766               ; 58BE   0004 0114 0366

        MVO     R0,     G_017D                  ; 58C1   0240 017D

        JSR     R5,     L_5B2F                  ; 58C3   0004 0158 032F

        MVII    #$0002, R5                      ; 58C6   02BD 0002
        MVO     R5,     G_0183                  ; 58C8   0245 0183
        CLRR    R4                              ; 58CA   01E4
L_58CB:
        CLRR    R5                              ; 58CB   01ED
        MVO     R5,     G_0184                  ; 58CC   0245 0184
        MVII    #$0178, R5                      ; 58CE   02BD 0178
L_58D0:
        MVI@    R5,     R0                      ; 58D0   02A8
        MOVR    R0,     R1                      ; 58D1   0081
        ANDI    #$0007, R0                      ; 58D2   03B8 0007
        BEQ     L_58F3                          ; 58D4   0204 001D

        MOVR    R1,     R2                      ; 58D6   008A
        ANDI    #$0020, R2                      ; 58D7   03BA 0020
        BNEQ    L_58F3                          ; 58D9   020C 0018

        ANDI    #$0018, R1                      ; 58DB   03B9 0018
        SLR     R1,     2                       ; 58DD   0065
        CMPR    R4,     R1                      ; 58DE   0161
        BNEQ    L_58F3                          ; 58DF   020C 0012

        PSHR    R5                              ; 58E1   0275
        SDBD                                    ; 58E2   0001
        ADDI    #$5681, R1                      ; 58E3   02F9 0081 0056
        ADD     G_0183, R1                      ; 58E6   02C1 0183
        MOVR    R1,     R5                      ; 58E8   008D
        SDBD                                    ; 58E9   0001
        MVI@    R5,     R2                      ; 58EA   02AA
        MVII    #$000E, R3                      ; 58EB   02BB 000E
        MVO     R3,     G_0184                  ; 58ED   0243 0184

        JSR     R5,     .EXEC.9AD               ; 58EF   0004 0118 01AD

        PULR    R5                              ; 58F2   02B5
L_58F3:
        CMPI    #$017C, R5                      ; 58F3   037D 017C
        BNEQ    L_58D0                          ; 58F5   022C 0026

        MVI     G_0184, R5                      ; 58F7   0285 0184
        TSTR    R5                              ; 58F9   00AD
        BNEQ    L_58FE                          ; 58FA   020C 0002

        MVO     R5,     G_0183                  ; 58FC   0245 0183
L_58FE:
        ADDI    #$0002, R4                      ; 58FE   02FC 0002
        CMPI    #$0008, R4                      ; 5900   037C 0008
        BNEQ    L_58CB                          ; 5902   022C 0038
        PULR    R7                              ; 5904   02B7

L_5905:
        PSHR    R5                              ; 5905   0275
        CLRR    R0                              ; 5906   01C0

        JSR     R5,     L_5591                  ; 5907   0004 0154 0191

        BC      L_5912                          ; 590A   0201 0006

        MVI     G_016B, R0                      ; 590C   0280 016B
        COMR    R0                              ; 590E   0018
        AND@    R5,     R0                      ; 590F   03A8
        DECR    R5                              ; 5910   0015
        MVO@    R0,     R5                      ; 5911   0268
L_5912:
        MVII    #$0080, R0                      ; 5912   02B8 0080
        MVO     R0,     G_016D                  ; 5914   0240 016D
        SDBD                                    ; 5916   0001
        MVII    #$5335, R0                      ; 5917   02B8 0035 0053
        MVO     R0,     G_035D                  ; 591A   0240 035D
        PULR    R7                              ; 591C   02B7

L_591D:
        PSHR    R5                              ; 591D   0275

        JSR     R5,     L_5905                  ; 591E   0004 0158 0105

        MVI     G_016F, R0                      ; 5921   0280 016F

        JSR     R5,     .EXEC.76C               ; 5923   0004 0114 036C

        ADDI    #$0002, R1                      ; 5926   02F9 0002
        MVI     G_031F, R0                      ; 5928   0280 031F
        MVO@    R0,     R1                      ; 592A   0248
        PULR    R7                              ; 592B   02B7

        PSHR    R5                              ; 592C   0275
        MVII    #$0004, R0                      ; 592D   02B8 0004
        MVO     R0,     G_0323                  ; 592F   0240 0323
        MVI     G_0321, R0                      ; 5931   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 5933   0004 0114 0357

        MOVR    R0,     R2                      ; 5936   0082
        BMI     L_593B                          ; 5937   020B 0002

        ADDI    #$000F, R2                      ; 5939   02FA 000F
L_593B:
        SAR     R2,     2                       ; 593B   006E
        SAR     R2,     2                       ; 593C   006E
        SUBR    R2,     R0                      ; 593D   0110
        MOVR    R1,     R2                      ; 593E   008A
        SAR     R2,     2                       ; 593F   006E
        SAR     R2,     2                       ; 5940   006E
        SUBR    R2,     R1                      ; 5941   0111
        BNEQ    L_5945                          ; 5942   020C 0001

        CLRR    R0                              ; 5944   01C0

L_5945:
        JSR     R5,     X_PACK_BYTES            ; 5945   0004 0114 034F

        MVO     R0,     G_0321                  ; 5948   0240 0321
        CLRR    R0                              ; 594A   01C0

        JSR     R5,     .EXEC.772               ; 594B   0004 0114 0372

        SUBI    #$0054, R2                      ; 594E   033A 0054
        BMI     L_5953                          ; 5950   020B 0001

        NEGR    R2                              ; 5952   0022
L_5953:
        SUBI    #$005C, R3                      ; 5953   033B 005C
        ADDR    R3,     R3                      ; 5955   00DB
        CMPR    R2,     R3                      ; 5956   0153
        BLE     L_57B5                          ; 5957   0226 01A3
        J       L_5AC4                          ; 5959   0004 0358 02C4

L_595C:
        PSHR    R5                              ; 595C   0275
        PSHR    R0                              ; 595D   0270

        JSR     R5,     L_5FC0                  ; 595E   0004 015C 03C0
        JSR     R5,     L_509B                  ; 5961   0004 0150 009B
        DECLE   $022E,  $0059,  $0045,  $0052   ; 5964   022E 0059 0045 0052
        DECLE   $0020,  $004F,  $0055,  $0054   ; 5968   0020 004F 0055 0054
        DECLE   $0021,  $0000                   ; 596C   0021 0000

        MVI     G_0163, R2                      ; 596E   0282 0163
        INCR    R2                              ; 5970   000A
        MVO     R2,     G_0163                  ; 5971   0242 0163

        JSR     R5,     L_51CA                  ; 5973   0004 0150 01CA

        PULR    R0                              ; 5976   02B0
        SUBI    #$0003, R2                      ; 5977   033A 0003
        BNEQ    L_57B5                          ; 5979   022C 01C5

        MVO     R0,     G_0180                  ; 597B   0240 0180
        MVII    #$033E, R5                      ; 597D   02BD 033E
L_597F:
        MVI@    R5,     R1                      ; 597F   02A9
        ADDI    #$0007, R5                      ; 5980   02FD 0007
        SDBD                                    ; 5982   0001
        CMPI    #$56FD, R1                      ; 5983   0379 00FD 0056
        BNEQ    L_598F                          ; 5986   020C 0007

        SUBI    #$0005, R5                      ; 5988   033D 0005
        MVO@    R2,     R5                      ; 598A   026A
        INCR    R5                              ; 598B   000D
        MVO@    R2,     R5                      ; 598C   026A
        ADDI    #$0002, R5                      ; 598D   02FD 0002
L_598F:
        CMPI    #$035E, R5                      ; 598F   037D 035E
        BNEQ    L_597F                          ; 5991   022C 0013

        JSR     R5,     L_5B2F                  ; 5993   0004 0158 032F
        JSR     R5,     L_509B                  ; 5996   0004 0150 009B
        DECLE   $022D,  $0054,  $0048,  $0049   ; 5999   022D 0054 0048 0049
        DECLE   $0052,  $0044,  $0020,  $004F   ; 599D   0052 0044 0020 004F
        DECLE   $0055,  $0054,  $0000           ; 59A1   0055 0054 0000

        PULR    R7                              ; 59A4   02B7

L_59A5:
        SDBD                                    ; 59A5   0001
        MVII    #$1906, R0                      ; 59A6   02B8 0006 0019
        MVO     R0,     G_035D                  ; 59A9   0240 035D
        CLRR    R0                              ; 59AB   01C0
        MVO     R0,     G_016D                  ; 59AC   0240 016D
        MVO     R0,     G_016E                  ; 59AE   0240 016E
        MVO     R0,     G_0146                  ; 59B0   0240 0146

        JSR     R5,     L_55A2                  ; 59B2   0004 0154 01A2

        MVII    #$00FF, R0                      ; 59B5   02B8 00FF
        MVO     R0,     G_015F                  ; 59B7   0240 015F
        MVII    #$0007, R0                      ; 59B9   02B8 0007
L_59BB:
        PSHR    R0                              ; 59BB   0270
        INCR    R0                              ; 59BC   0008

        JSR     R5,     L_55A2                  ; 59BD   0004 0154 01A2

        MOVR    R0,     R3                      ; 59C0   0083
        DECR    R0                              ; 59C1   0010

        JSR     R5,     L_55BD                  ; 59C2   0004 0154 01BD

        PULR    R0                              ; 59C5   02B0
        MVII    #$0036, R2                      ; 59C6   02BA 0036
        MVI     G_015D, R1                      ; 59C8   0281 015D
        TSTR    R1                              ; 59CA   0089
        BEQ     L_59CF                          ; 59CB   0204 0002

        MVII    #$0072, R2                      ; 59CD   02BA 0072
L_59CF:
        SWAP    R2,     1                       ; 59CF   0042
        ADDI    #$005D, R2                      ; 59D0   02FA 005D
        MVII    #$0019, R3                      ; 59D2   02BB 0019

        JSR     R5,     .EXEC.9AD               ; 59D4   0004 0118 01AD

        DECR    R0                              ; 59D7   0010
        BPL     L_59BB                          ; 59D8   0223 001E

        MVII    #$0009, R0                      ; 59DA   02B8 0009
        MVII    #$016F, R4                      ; 59DC   02BC 016F

        JSR     R5,     X_FILL_ZERO             ; 59DE   0004 0114 0338

        SLL     R0,     1                       ; 59E1   0048
        J       X_PLAY_CHEER2                   ; 59E2   0004 031C 02D6

        ADDI    #$0005, R1                      ; 59E5   02F9 0005
        MVII    #$0007, R0                      ; 59E7   02B8 0007
        MVI     G_0182, R2                      ; 59E9   0282 0182
        TSTR    R2                              ; 59EB   0092
        BEQ     L_59F0                          ; 59EC   0204 0002

        MVII    #$0004, R0                      ; 59EE   02B8 0004
L_59F0:
        MVO@    R0,     R1                      ; 59F0   0248
        MOVR    R5,     R7                      ; 59F1   00AF

L_59F2:
        PSHR    R5                              ; 59F2   0275
        MVI     G_0160, R0                      ; 59F3   0280 0160

        JSR     R5,     L_5D9F                  ; 59F5   0004 015C 019F

        CLRR    R2                              ; 59F8   01D2
        MVO     R2,     G_0160                  ; 59F9   0242 0160
        MVO@    R0,     R5                      ; 59FB   0268

        JSR     R5,     .EXEC.76C               ; 59FC   0004 0114 036C

        INCR    R1                              ; 59FF   0009
        SDBD                                    ; 5A00   0001
        MVII    #$56FD, R0                      ; 5A01   02B8 00FD 0056
        MVO@    R0,     R1                      ; 5A04   0248
        ADDI    #$0004, R1                      ; 5A05   02F9 0004
        MVII    #$03F0, R0                      ; 5A07   02B8 03F0
        MVO@    R0,     R1                      ; 5A09   0248
        INCR    R1                              ; 5A0A   0009
        MVO@    R2,     R1                      ; 5A0B   024A

        JSR     R5,     L_5A12                  ; 5A0C   0004 0158 0212

        SUBI    #$0006, R1                      ; 5A0F   0339 0006
        PULR    R7                              ; 5A11   02B7

L_5A12:
        PSHR    R5                              ; 5A12   0275

        JSR     R5,     .EXEC.7C1               ; 5A13   0004 0114 03C1

        MVII    #$0178, R4                      ; 5A16   02BC 0178
        MVI     G_017E, R2                      ; 5A18   0282 017E
        ADD     G_017D, R2                      ; 5A1A   02C2 017D
        BNEQ    L_57B5                          ; 5A1C   022C 0268

        MVI     G_0180, R3                      ; 5A1E   0283 0180
        DECR    R3                              ; 5A20   0013
        BPL     L_57B5                          ; 5A21   0223 026D

L_5A23:
        MVI@    R4,     R0                      ; 5A23   02A0
        MOVR    R0,     R1                      ; 5A24   0081
        ANDI    #$0007, R0                      ; 5A25   03B8 0007
        BEQ     L_5A5B                          ; 5A27   0204 0032

        CMP     G_0160, R0                      ; 5A29   0340 0160
        BEQ     L_5A5B                          ; 5A2B   0204 002E

        ANDI    #$0038, R1                      ; 5A2D   03B9 0038
        SLR     R1,     2                       ; 5A2F   0065
        SLR     R1,     1                       ; 5A30   0061
        CMPI    #$0004, R1                      ; 5A31   0379 0004
        BGE     L_5A5B                          ; 5A33   020D 0026

        CMPR    R1,     R3                      ; 5A35   014B
        BGT     L_5A5B                          ; 5A36   020E 0023
        BNEQ    L_5A59                          ; 5A38   020C 001F

        PSHR    R1                              ; 5A3A   0271

        JSR     R5,     .EXEC.76C               ; 5A3B   0004 0114 036C

        ADDI    #$0003, R1                      ; 5A3E   02F9 0003
        MVI@    R1,     R1                      ; 5A40   0289
        PSHR    R1                              ; 5A41   0271
        PSHR    R0                              ; 5A42   0270
        MOVR    R2,     R0                      ; 5A43   0090

        JSR     R5,     .EXEC.76C               ; 5A44   0004 0114 036C

        PULR    R0                              ; 5A47   02B0
        ADDI    #$0003, R1                      ; 5A48   02F9 0003
        MVI@    R1,     R1                      ; 5A4A   0289
        CMP@    R6,     R1                      ; 5A4B   0371
        PULR    R1                              ; 5A4C   02B1
        BLT     L_5A55                          ; 5A4D   0205 0006

        CMPI    #$0001, R1                      ; 5A4F   0379 0001
        BGT     L_5A5B                          ; 5A51   020E 0008
        B       L_5A59                          ; 5A53   0200 0004

L_5A55:
        CMPI    #$0001, R1                      ; 5A55   0379 0001
        BLE     L_5A5B                          ; 5A57   0206 0002

L_5A59:
        MOVR    R1,     R3                      ; 5A59   008B
        MOVR    R0,     R2                      ; 5A5A   0082
L_5A5B:
        CMPI    #$017C, R4                      ; 5A5B   037C 017C
        BNEQ    L_5A23                          ; 5A5D   022C 003B

        CMP     G_016E, R2                      ; 5A5F   0342 016E
        BEQ     L_57B5                          ; 5A61   0224 02AD

        MOVR    R2,     R0                      ; 5A63   0090
        BEQ     L_5A72                          ; 5A64   0204 000C

        JSR     R5,     .EXEC.76C               ; 5A66   0004 0114 036C

        TSTR    R3                              ; 5A69   009B
        BEQ     L_5A72                          ; 5A6A   0204 0006

        JSR     R5,     L_5D65                  ; 5A6C   0004 015C 0165

        BPL     L_5A72                          ; 5A6F   0203 0001

        CLRR    R2                              ; 5A71   01D2
L_5A72:
        MVO     R2,     G_016E                  ; 5A72   0242 016E
        TSTR    R2                              ; 5A74   0092
        BEQ     L_57B5                          ; 5A75   0224 02C1

        MVI@    R1,     R0                      ; 5A77   0288
        XORI    #$0010, R0                      ; 5A78   03F8 0010
        MVO@    R0,     R1                      ; 5A7A   0248
        PULR    R7                              ; 5A7B   02B7

        PSHR    R5                              ; 5A7C   0275
        MVI     G_017C, R3                      ; 5A7D   0283 017C
        TSTR    R3                              ; 5A7F   009B
        BNEQ    L_5A87                          ; 5A80   020C 0005

        MVO     R3,     G_0321                  ; 5A82   0243 0321
        J       L_585D                          ; 5A84   0004 0358 005D

L_5A87:
        CLRR    R0                              ; 5A87   01C0
        MVO     R0,     G_017C                  ; 5A88   0240 017C
        MVII    #$0037, R0                      ; 5A8A   02B8 0037
        SWAP    R0,     1                       ; 5A8C   0040
        CMP     G_0320, R0                      ; 5A8D   0340 0320
        BLE     L_5AC4                          ; 5A8F   0206 0033

        MVII    #$0008, R0                      ; 5A91   02B8 0008

        JSR     R5,     X_RAND1                 ; 5A93   0004 0114 027D

        CMPR    R3,     R0                      ; 5A96   0158
        BLE     L_5AA7                          ; 5A97   0206 000E

        SUBI    #$0003, R2                      ; 5A99   033A 0003
        BEQ     L_5AA2                          ; 5A9B   0204 0005

        MVII    #$00FF, R2                      ; 5A9D   02BA 00FF
        SWAP    R2,     1                       ; 5A9F   0042
        XOR     G_0321, R2                      ; 5AA0   03C2 0321
L_5AA2:
        MVO     R2,     G_0321                  ; 5AA2   0242 0321
        J       L_5FEA                          ; 5AA4   0004 035C 03EA

L_5AA7:
        JSR     R5,     L_509B                  ; 5AA7   0004 0150 009B
        DECLE   $022E,  $0048,  $004F,  $004D   ; 5AAA   022E 0048 004F 004D
        DECLE   $0045,  $0020,  $0052,  $0055   ; 5AAE   0045 0020 0052 0055
        DECLE   $004E,  $0000                   ; 5AB2   004E 0000

        MVII    #$000A, R0                      ; 5AB4   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5AB6   0004 011C 02D5

        CLRR    R0                              ; 5AB9   01C0
        MVO     R0,     G_031E                  ; 5ABA   0240 031E
        DECR    R0                              ; 5ABC   0010
        MVO     R0,     G_017E                  ; 5ABD   0240 017E

        JSR     R5,     L_5B2F                  ; 5ABF   0004 0158 032F

        B       L_5C4A                          ; 5AC2   0200 0186

L_5AC4:
        MVI     G_017C, R0                      ; 5AC4   0280 017C
        TSTR    R0                              ; 5AC6   0080
        BEQ     L_5CB1                          ; 5AC7   0204 01E8

        JSR     R5,     X_STOP_SFX              ; 5AC9   0004 011C 02B4
        JSR     R5,     L_509B                  ; 5ACC   0004 0150 009B
        DECLE   $022D,  $0046,  $004F,  $0055   ; 5ACF   022D 0046 004F 0055
        DECLE   $004C,  $0020,  $0042,  $0041   ; 5AD3   004C 0020 0042 0041
        DECLE   $004C,  $004C,  $0021,  $0000   ; 5AD7   004C 004C 0021 0000

        CLRR    R0                              ; 5ADB   01C0
        MVO     R0,     G_031E                  ; 5ADC   0240 031E
        MVO     R0,     G_017C                  ; 5ADE   0240 017C
        MVII    #$0178, R4                      ; 5AE0   02BC 0178
L_5AE2:
        MVI@    R4,     R2                      ; 5AE2   02A2
        MOVR    R2,     R1                      ; 5AE3   0091
        ANDI    #$0007, R2                      ; 5AE4   03BA 0007
        BEQ     L_5B1F                          ; 5AE6   0204 0037

        CMP     G_016E, R2                      ; 5AE8   0342 016E
        BNEQ    L_5AF4                          ; 5AEA   020C 0008

        MOVR    R2,     R0                      ; 5AEC   0090
        PSHR    R1                              ; 5AED   0271

        JSR     R5,     L_5D60                  ; 5AEE   0004 015C 0160

        PULR    R1                              ; 5AF1   02B1
        BPL     L_5B1F                          ; 5AF2   0203 002B

L_5AF4:
        SLR     R1,     2                       ; 5AF4   0065
        SLR     R1,     1                       ; 5AF5   0061
        ANDI    #$0007, R1                      ; 5AF6   03B9 0007
        CMPI    #$0004, R1                      ; 5AF8   0379 0004
        BGE     L_5B1F                          ; 5AFA   020D 0023

        MOVR    R2,     R0                      ; 5AFC   0090
        CLRR    R2                              ; 5AFD   01D2
        DECR    R1                              ; 5AFE   0011
        BPL     L_5B12                          ; 5AFF   0203 0011

        MVO     R0,     G_0160                  ; 5B01   0240 0160
        MVO     R0,     G_017F                  ; 5B03   0240 017F

        JSR     R5,     L_5D9F                  ; 5B05   0004 015C 019F

        CLRR    R0                              ; 5B08   01C0
        MVO@    R0,     R5                      ; 5B09   0268
        ANDI    #$0003, R1                      ; 5B0A   03B9 0003
        MVI     G_0160, R0                      ; 5B0C   0280 0160
        SDBD                                    ; 5B0E   0001
        MVII    #$FD04, R2                      ; 5B0F   02BA 0004 00FD
L_5B12:
        MOVR    R1,     R5                      ; 5B12   008D
        ADDR    R5,     R5                      ; 5B13   00ED
        SDBD                                    ; 5B14   0001
        ADDI    #$5683, R5                      ; 5B15   02FD 0083 0056
        SDBD                                    ; 5B18   0001
        ADD@    R5,     R2                      ; 5B19   02EA
        MVII    #$0014, R3                      ; 5B1A   02BB 0014

        JSR     R5,     .EXEC.9AD               ; 5B1C   0004 0118 01AD

L_5B1F:
        CMPI    #$017C, R4                      ; 5B1F   037C 017C
        BNEQ    L_5AE2                          ; 5B21   022C 0040

        JSR     R5,     L_5B2F                  ; 5B23   0004 0158 032F

        MVI     G_0161, R0                      ; 5B26   0280 0161
        CMPI    #$0002, R0                      ; 5B28   0378 0002
        BEQ     L_5CB1                          ; 5B2A   0204 0185
        J       L_5878                          ; 5B2C   0004 0358 0078

L_5B2F:
        PSHR    R5                              ; 5B2F   0275
        CLRR    R0                              ; 5B30   01C0
        MVO     R0,     G_0167                  ; 5B31   0240 0167
        XOR     G_016E, R0                      ; 5B33   03C0 016E
        BEQ     L_5CB1                          ; 5B35   0204 017A

        JSR     R5,     .EXEC.76C               ; 5B37   0004 0114 036C

        MVII    #$0010, R5                      ; 5B3A   02BD 0010
        COMR    R5                              ; 5B3C   001D
        AND@    R1,     R5                      ; 5B3D   038D
        MVO@    R5,     R1                      ; 5B3E   024D
        CLRR    R5                              ; 5B3F   01ED
        MVO     R5,     G_016E                  ; 5B40   0245 016E
        PSHR    R0                              ; 5B42   0270

        JSR     R5,     L_5D65                  ; 5B43   0004 015C 0165

        BMI     L_5B4B                          ; 5B46   020B 0003

        JSR     R5,     L_5C76                  ; 5B48   0004 015C 0076

L_5B4B:
        PULR    R0                              ; 5B4B   02B0
        PULR    R7                              ; 5B4C   02B7

L_5B4D:
        MVI     G_016E, R0                      ; 5B4D   0280 016E
        TSTR    R0                              ; 5B4F   0080
        BEQ     L_5BAA                          ; 5B50   0204 0058

        MVI     G_015D, R1                      ; 5B52   0281 015D
        ADDI    #$011F, R1                      ; 5B54   02F9 011F
        MVI@    R1,     R0                      ; 5B56   0288
        SWAP    R0,     1                       ; 5B57   0040
        SLLC    R0,     2                       ; 5B58   005C
        SLR     R0,     2                       ; 5B59   0064
        SWAP    R0,     1                       ; 5B5A   0040
        BC      L_5B95                          ; 5B5B   0201 0038
        BOV     L_5B95                          ; 5B5D   0202 0036

        CLRR    R4                              ; 5B5F   01E4
        CMPI    #$0004, R0                      ; 5B60   0378 0004
        BLT     L_5B6D                          ; 5B62   0205 0009
        BEQ     L_5B95                          ; 5B64   0204 002F

        CMPI    #$000C, R0                      ; 5B66   0378 000C
        BGT     L_5B6D                          ; 5B68   020E 0003
        BEQ     L_5B95                          ; 5B6A   0204 0029

        DECR    R4                              ; 5B6C   0014
L_5B6D:
        MVI     G_016E, R0                      ; 5B6D   0280 016E

        JSR     R5,     L_5D9F                  ; 5B6F   0004 015C 019F

        MVI@    R5,     R0                      ; 5B72   02A8
        SLR     R0,     2                       ; 5B73   0064
        SLR     R0,     1                       ; 5B74   0060
        ANDI    #$0003, R0                      ; 5B75   03B8 0003
        ADDR    R0,     R4                      ; 5B77   00C4
        BMI     L_5B95                          ; 5B78   020B 001B

        ADDR    R4,     R4                      ; 5B7A   00E4
        SDBD                                    ; 5B7B   0001
        ADDI    #$5683, R4                      ; 5B7C   02FC 0083 0056
        MVI     G_016E, R0                      ; 5B7F   0280 016E
        SDBD                                    ; 5B81   0001
        MVI@    R4,     R2                      ; 5B82   02A2
        MVII    #$000E, R3                      ; 5B83   02BB 000E

        JSR     R5,     .EXEC.9AD               ; 5B85   0004 0118 01AD

        MVI     G_0167, R0                      ; 5B88   0280 0167
        TSTR    R0                              ; 5B8A   0080
        BEQ     L_5BAA                          ; 5B8B   0204 001D

        JSR     R5,     L_5C49                  ; 5B8D   0004 015C 0049

        CLRR    R0                              ; 5B90   01C0
        MVO     R0,     G_0167                  ; 5B91   0240 0167
        B       L_5BAA                          ; 5B93   0200 0015

L_5B95:
        MVI     G_016E, R0                      ; 5B95   0280 016E

        JSR     R5,     .EXEC.76C               ; 5B97   0004 0114 036C

        MOVR    R1,     R2                      ; 5B9A   008A
        ADDI    #$0004, R2                      ; 5B9B   02FA 0004
        CLRR    R5                              ; 5B9D   01ED
        MVO@    R5,     R2                      ; 5B9E   0255
        ADDI    #$0002, R2                      ; 5B9F   02FA 0002
        MVO@    R5,     R2                      ; 5BA1   0255

        JSR     R5,     L_5D65                  ; 5BA2   0004 015C 0165

        BMI     L_5BAA                          ; 5BA5   020B 0003

        JSR     R5,     L_5C76                  ; 5BA7   0004 015C 0076

L_5BAA:
        MVI     G_016D, R1                      ; 5BAA   0281 016D
        SWAP    R1,     1                       ; 5BAC   0041
        SLLC    R1,     2                       ; 5BAD   005D
        SLR     R1,     2                       ; 5BAE   0065
        SWAP    R1,     1                       ; 5BAF   0041
        BNC     L_5BBC                          ; 5BB0   0209 000A
        BNOV    L_5BBC                          ; 5BB2   020A 0008

        ADDI    #$016F, R1                      ; 5BB4   02F9 016F
        MVI@    R1,     R0                      ; 5BB6   0288

        JSR     R5,     L_5D60                  ; 5BB7   0004 015C 0160

        BPL     L_5BBE                          ; 5BBA   0203 0002

L_5BBC:
        MVII    #$00FF, R0                      ; 5BBC   02B8 00FF
L_5BBE:
        MVO     R0,     G_0168                  ; 5BBE   0240 0168
        CLRR    R0                              ; 5BC0   01C0
        MVO     R0,     G_0169                  ; 5BC1   0240 0169
        MVII    #$0178, R4                      ; 5BC3   02BC 0178
L_5BC5:
        MVI@    R4,     R0                      ; 5BC5   02A0
        PSHR    R4                              ; 5BC6   0274

        JSR     R5,     L_5BD0                  ; 5BC7   0004 0158 03D0

        PULR    R4                              ; 5BCA   02B4
        CMPI    #$017C, R4                      ; 5BCB   037C 017C
        BNEQ    L_5BC5                          ; 5BCD   022C 0009
        PULR    R7                              ; 5BCF   02B7

L_5BD0:
        PSHR    R5                              ; 5BD0   0275
        MOVR    R0,     R2                      ; 5BD1   0082
        ANDI    #$0007, R0                      ; 5BD2   03B8 0007
        BEQ     L_5CB1                          ; 5BD4   0204 00DB

        MOVR    R2,     R1                      ; 5BD6   0091
        ANDI    #$0020, R1                      ; 5BD7   03B9 0020
        BNEQ    L_5CB1                          ; 5BD9   020C 00D6

        JSR     R5,     L_5D60                  ; 5BDB   0004 015C 0160

        BMI     L_5BFF                          ; 5BDE   020B 001F

        PSHR    R0                              ; 5BE0   0270

        JSR     R5,     X_POW2                  ; 5BE1   0004 0114 0345

        MOVR    R0,     R3                      ; 5BE4   0083
        AND     G_0169, R0                      ; 5BE5   0380 0169
        PULR    R0                              ; 5BE7   02B0
        BNEQ    L_5C35                          ; 5BE8   020C 004B

        XOR     G_0169, R3                      ; 5BEA   03C3 0169
        MVO     R3,     G_0169                  ; 5BEC   0243 0169
        CMP     G_0168, R0                      ; 5BEE   0340 0168
        BNEQ    L_5BF9                          ; 5BF0   020C 0007

        MOVR    R2,     R5                      ; 5BF2   0095
        ANDI    #$0040, R5                      ; 5BF3   03BD 0040
        BEQ     L_5CB7                          ; 5BF5   0204 00C0
        B       L_5C03                          ; 5BF7   0200 000A

L_5BF9:
        ANDI    #$00BF, R2                      ; 5BF9   03BA 00BF
        XORI    #$0040, R2                      ; 5BFB   03FA 0040
        B       L_5C01                          ; 5BFD   0200 0002

L_5BFF:
        ANDI    #$00BF, R2                      ; 5BFF   03BA 00BF
L_5C01:
        DECR    R4                              ; 5C01   0014
        MVO@    R2,     R4                      ; 5C02   0262
L_5C03:
        SLR     R2,     2                       ; 5C03   0066
        SLR     R2,     1                       ; 5C04   0062
        ANDI    #$0003, R2                      ; 5C05   03BA 0003
        CMP     G_0168, R2                      ; 5C07   0342 0168
        BNEQ    L_5CB1                          ; 5C09   020C 00A6

        DECR    R2                              ; 5C0B   0012
        BMI     L_5CB7                          ; 5C0C   020B 00A9

        MVII    #$0178, R4                      ; 5C0E   02BC 0178
L_5C10:
        MVI@    R4,     R0                      ; 5C10   02A0
        MOVR    R0,     R3                      ; 5C11   0083
        ANDI    #$0007, R0                      ; 5C12   03B8 0007
        BEQ     L_5C30                          ; 5C14   0204 001A

        PSHR    R1                              ; 5C16   0271

        JSR     R5,     .EXEC.76C               ; 5C17   0004 0114 036C

        PULR    R5                              ; 5C1A   02B5
        CMPR    R5,     R1                      ; 5C1B   0169
        BEQ     L_5C30                          ; 5C1C   0204 0012

        PSHR    R5                              ; 5C1E   0275

        JSR     R5,     L_5D65                  ; 5C1F   0004 015C 0165

        PULR    R1                              ; 5C22   02B1
        CMPR    R2,     R0                      ; 5C23   0150
        BEQ     L_5CB7                          ; 5C24   0204 0091

        TSTR    R0                              ; 5C26   0080
        BPL     L_5C30                          ; 5C27   0203 0007

        SLR     R3,     2                       ; 5C29   0067
        SLR     R3,     1                       ; 5C2A   0063
        ANDI    #$0007, R3                      ; 5C2B   03BB 0007
        CMPR    R3,     R2                      ; 5C2D   015A
        BEQ     L_5CB7                          ; 5C2E   0204 0087

L_5C30:
        CMPI    #$017C, R4                      ; 5C30   037C 017C
        BNEQ    L_5C10                          ; 5C32   022C 0023
        PULR    R7                              ; 5C34   02B7

L_5C35:
        ANDI    #$0040, R2                      ; 5C35   03BA 0040
        BEQ     L_5CB7                          ; 5C37   0204 007E

        MVII    #$0178, R4                      ; 5C39   02BC 0178
        MOVR    R0,     R2                      ; 5C3B   0082
L_5C3C:
        MVI@    R4,     R0                      ; 5C3C   02A0
        ANDI    #$0007, R0                      ; 5C3D   03B8 0007
        BEQ     L_5C3C                          ; 5C3F   0224 0004

        JSR     R5,     L_5D60                  ; 5C41   0004 015C 0160

        CMPR    R0,     R2                      ; 5C44   0142
        BEQ     L_5CB7                          ; 5C45   0204 0070
        B       L_5C3C                          ; 5C47   0220 000C

L_5C49:
        PSHR    R5                              ; 5C49   0275
L_5C4A:
        MVII    #$0178, R4                      ; 5C4A   02BC 0178
L_5C4C:
        MVI@    R4,     R1                      ; 5C4C   02A1
        MOVR    R1,     R0                      ; 5C4D   0088
        ANDI    #$0007, R0                      ; 5C4E   03B8 0007
        BEQ     L_5C71                          ; 5C50   0204 001F

        CMP     G_016E, R0                      ; 5C52   0340 016E
        BEQ     L_5C71                          ; 5C54   0204 001B

        MOVR    R1,     R2                      ; 5C56   008A
        ANDI    #$0020, R2                      ; 5C57   03BA 0020
        BNEQ    L_5C71                          ; 5C59   020C 0016

        ANDI    #$0018, R1                      ; 5C5B   03B9 0018
        SLR     R1,     2                       ; 5C5D   0065
        SDBD                                    ; 5C5E   0001
        ADDI    #$5683, R1                      ; 5C5F   02F9 0083 0056
        MOVR    R1,     R5                      ; 5C62   008D
        SDBD                                    ; 5C63   0001
        MVI@    R5,     R2                      ; 5C64   02AA
        MVII    #$000E, R3                      ; 5C65   02BB 000E
        MVI     G_017E, R5                      ; 5C67   0285 017E
        TSTR    R5                              ; 5C69   00AD
        BEQ     L_5C6E                          ; 5C6A   0204 0002

        MVII    #$001E, R3                      ; 5C6C   02BB 001E

L_5C6E:
        JSR     R5,     .EXEC.9AD               ; 5C6E   0004 0118 01AD

L_5C71:
        CMPI    #$017C, R4                      ; 5C71   037C 017C
        BNEQ    L_5C4C                          ; 5C73   022C 0028
        PULR    R7                              ; 5C75   02B7

L_5C76:
        PSHR    R5                              ; 5C76   0275

        JSR     R5,     .EXEC.766               ; 5C77   0004 0114 0366

        PSHR    R0                              ; 5C7A   0270
        CMP     G_017D, R0                      ; 5C7B   0340 017D
        BEQ     L_5C83                          ; 5C7D   0204 0004

        CMP     G_017F, R0                      ; 5C7F   0340 017F
        BNEQ    L_5C8D                          ; 5C81   020C 000A

L_5C83:
        PSHR    R1                              ; 5C83   0271
        CLRR    R5                              ; 5C84   01ED
        MVO     R5,     G_017F                  ; 5C85   0245 017F
        MVO     R5,     G_017D                  ; 5C87   0245 017D

        JSR     R5,     L_52CF                  ; 5C89   0004 0150 02CF

        PULR    R1                              ; 5C8C   02B1

L_5C8D:
        JSR     R5,     L_5A12                  ; 5C8D   0004 0158 0212

        PULR    R0                              ; 5C90   02B0
        MOVR    R1,     R2                      ; 5C91   008A
        ADDI    #$0004, R2                      ; 5C92   02FA 0004
        CLRR    R5                              ; 5C94   01ED
        MVO@    R5,     R2                      ; 5C95   0255

        JSR     R5,     L_5D9F                  ; 5C96   0004 015C 019F

        MOVR    R5,     R2                      ; 5C99   00AA

        JSR     R5,     L_5D65                  ; 5C9A   0004 015C 0165

        BMI     L_5CB1                          ; 5C9D   020B 0012

        CMPI    #$0003, R0                      ; 5C9F   0378 0003
        BEQ     L_5CC3                          ; 5CA1   0204 0020

        MOVR    R0,     R3                      ; 5CA3   0083
        INCR    R0                              ; 5CA4   0008
        SLL     R0,     2                       ; 5CA5   004C
        SLL     R0,     1                       ; 5CA6   0048
        MVI@    R2,     R5                      ; 5CA7   0295
        ANDI    #$0067, R5                      ; 5CA8   03BD 0067
        XORR    R0,     R5                      ; 5CAA   01C5
        MVO@    R5,     R2                      ; 5CAB   0255
        MVI     G_017E, R0                      ; 5CAC   0280 017E
        TSTR    R0                              ; 5CAE   0080
        BNEQ    L_5C4A                          ; 5CAF   022C 0066
L_5CB1:
        PULR    R7                              ; 5CB1   02B7

        PSHR    R5                              ; 5CB2   0275
        CMP     G_016E, R3                      ; 5CB3   0343 016E
        BNEQ    L_5CB1                          ; 5CB5   022C 0005

L_5CB7:
        MVI     G_0180, R0                      ; 5CB7   0280 0180
        TSTR    R0                              ; 5CB9   0080
        BNEQ    L_5CB1                          ; 5CBA   022C 000A

        JSR     R5,     L_5CEC                  ; 5CBC   0004 015C 00EC
        JSR     R5,     L_595C                  ; 5CBF   0004 0158 015C

        PULR    R7                              ; 5CC2   02B7

L_5CC3:
        JSR     R5,     L_5CEC                  ; 5CC3   0004 015C 00EC

        MVI     G_015D, R1                      ; 5CC6   0281 015D
        ADDI    #$0165, R1                      ; 5CC8   02F9 0165
        MVI@    R1,     R2                      ; 5CCA   028A
        INCR    R2                              ; 5CCB   000A
        MVO@    R2,     R1                      ; 5CCC   024A

        JSR     R5,     L_51CA                  ; 5CCD   0004 0150 01CA

        MVI     G_0164, R0                      ; 5CD0   0280 0164
        SARC    R0,     1                       ; 5CD2   0078
        BNC     L_5CDD                          ; 5CD3   0209 0008

        CMPI    #$0008, R0                      ; 5CD5   0378 0008
        BLT     L_5CDD                          ; 5CD7   0205 0004

        CMP     G_0165, R2                      ; 5CD9   0342 0165
        BGT     L_5D5D                          ; 5CDB   020E 0080

L_5CDD:
        MVII    #$0002, R0                      ; 5CDD   02B8 0002

        JSR     R5,     X_PLAY_CHEER1           ; 5CDF   0004 011C 02D5

        MVII    #$0080, R0                      ; 5CE2   02B8 0080
        CMP     G_0146, R0                      ; 5CE4   0340 0146
        BNEQ    L_5CB1                          ; 5CE6   022C 0036

        INCR    R0                              ; 5CE8   0008
        MVO     R0,     G_0146                  ; 5CE9   0240 0146
        PULR    R7                              ; 5CEB   02B7

L_5CEC:
        PSHR    R5                              ; 5CEC   0275

        JSR     R5,     L_5D9A                  ; 5CED   0004 015C 019A

        BC      L_5CB1                          ; 5CF0   0221 0040

        MOVR    R5,     R2                      ; 5CF2   00AA
        MVI@    R2,     R3                      ; 5CF3   0293
        ANDI    #$00DF, R3                      ; 5CF4   03BB 00DF
        XORI    #$0020, R3                      ; 5CF6   03FB 0020
        MVO@    R3,     R2                      ; 5CF8   0253
        SUB     G_016E, R0                      ; 5CF9   0300 016E
        BNEQ    L_5D04                          ; 5CFB   020C 0007

        MVO     R0,     G_016E                  ; 5CFD   0240 016E
        MVII    #$0010, R0                      ; 5CFF   02B8 0010
        COMR    R0                              ; 5D01   0018
        AND@    R1,     R0                      ; 5D02   0388
        MVO@    R0,     R1                      ; 5D03   0248
L_5D04:
        INCR    R1                              ; 5D04   0009
        SDBD                                    ; 5D05   0001
        MVII    #$56F6, R0                      ; 5D06   02B8 00F6 0056
        MVO@    R0,     R1                      ; 5D09   0248
        DECR    R1                              ; 5D0A   0011
        MVII    #$0036, R2                      ; 5D0B   02BA 0036
        MVI     G_015D, R5                      ; 5D0D   0285 015D
        TSTR    R5                              ; 5D0F   00AD
        BNEQ    L_5D14                          ; 5D10   020C 0002

        MVII    #$0072, R2                      ; 5D12   02BA 0072
L_5D14:
        SWAP    R2,     1                       ; 5D14   0042
        ADDI    #$005E, R2                      ; 5D15   02FA 005E
        MVII    #$0012, R3                      ; 5D17   02BB 0012

        JSR     R5,     .EXEC.9A9               ; 5D19   0004 0118 01A9

        PSHR    R5                              ; 5D1C   0275

        JSR     R5,     L_5D65                  ; 5D1D   0004 015C 0165

        BPL     L_5CB1                          ; 5D20   0223 0070

        MVI     G_016D, R2                      ; 5D22   0282 016D
        SWAP    R2,     1                       ; 5D24   0042
        SLLC    R2,     2                       ; 5D25   005E
        SLR     R2,     2                       ; 5D26   0066
        SWAP    R2,     1                       ; 5D27   0042
        BNC     L_5CB1                          ; 5D28   0229 0078
        BNOV    L_5CB1                          ; 5D2A   022A 007A

        ADDI    #$016F, R2                      ; 5D2C   02FA 016F
        CMP@    R2,     R3                      ; 5D2E   0353
        BEQ     L_5CB7                          ; 5D2F   0224 0079
        PULR    R7                              ; 5D31   02B7

L_5D32:
        JSR     R5,     .EXEC.766               ; 5D32   0004 0114 0366

        PSHR    R0                              ; 5D35   0270

        JSR     R5,     L_5D9F                  ; 5D36   0004 015C 019F

        CLRR    R1                              ; 5D39   01C9
        MVO@    R1,     R5                      ; 5D3A   0269

        JSR     R5,     L_508D                  ; 5D3B   0004 0150 008D

        MVI     G_0160, R0                      ; 5D3E   0280 0160

        JSR     R5,     X_POW2                  ; 5D40   0004 0114 0345

        XOR     G_016C, R0                      ; 5D43   03C0 016C
        ANDI    #$00F0, R0                      ; 5D45   03B8 00F0
        BNEQ    L_5D53                          ; 5D47   020C 000A

        XOR     G_017E, R0                      ; 5D49   03C0 017E
        BEQ     L_5D53                          ; 5D4B   0204 0006

        CLRR    R0                              ; 5D4D   01C0
        MVO     R0,     G_017E                  ; 5D4E   0240 017E

        JSR     R5,     L_52CF                  ; 5D50   0004 0150 02CF
L_5D53:
        JSR     R5,     L_5A12                  ; 5D53   0004 0158 0212

        PULR    R0                              ; 5D56   02B0
        SUB     G_0180, R0                      ; 5D57   0300 0180
        BNEQ    L_5CB1                          ; 5D59   022C 00A9

        MVO     R0,     G_0180                  ; 5D5B   0240 0180
L_5D5D:
        J       L_59A5                          ; 5D5D   0004 0358 01A5

L_5D60:
        PSHR    R5                              ; 5D60   0275

        JSR     R5,     .EXEC.76C               ; 5D61   0004 0114 036C

        INCR    R7                              ; 5D64   000F

L_5D65:
        PSHR    R5                              ; 5D65   0275

L_5D66:
        JSR     R5,     .EXEC.7C1               ; 5D66   0004 0114 03C1

        SDBD                                    ; 5D69   0001
        MVII    #$5683, R4                      ; 5D6A   02BC 0083 0056
L_5D6D:
        SDBD                                    ; 5D6D   0001
        MVI@    R4,     R2                      ; 5D6E   02A2
        PSHR    R4                              ; 5D6F   0274
        MVII    #$0202, R4                      ; 5D70   02BC 0202
        ADDR    R4,     R4                      ; 5D72   00E4

        JSR     R5,     .EXEC.6F7               ; 5D73   0004 0114 02F7

        PULR    R4                              ; 5D76   02B4
        BC      L_5D82                          ; 5D77   0201 0009

        SDBD                                    ; 5D79   0001
        CMPI    #$568B, R4                      ; 5D7A   037C 008B 0056
        BNEQ    L_5D6D                          ; 5D7D   022C 0011

L_5D7F:
        CLRR    R0                              ; 5D7F   01C0
        DECR    R0                              ; 5D80   0010
        PULR    R7                              ; 5D81   02B7

L_5D82:
        MOVR    R4,     R2                      ; 5D82   00A2
        SDBD                                    ; 5D83   0001
        SUBI    #$5685, R2                      ; 5D84   033A 0085 0056
        SLR     R2,     1                       ; 5D87   0062
        CMPI    #$0003, R2                      ; 5D88   037A 0003
        BNEQ    L_5D98                          ; 5D8A   020C 000C

        CMPI    #$033D, R1                      ; 5D8C   0379 033D
        BLT     L_5D98                          ; 5D8E   0205 0008

        JSR     R5,     L_5D9A                  ; 5D90   0004 015C 019A

        MVI@    R5,     R1                      ; 5D93   02A9
        ANDI    #$0018, R1                      ; 5D94   03B9 0018
        BEQ     L_5D7F                          ; 5D96   0224 0018

L_5D98:
        MOVR    R2,     R0                      ; 5D98   0090
        PULR    R7                              ; 5D99   02B7

L_5D9A:
        PSHR    R5                              ; 5D9A   0275

        JSR     R5,     .EXEC.766               ; 5D9B   0004 0114 0366

        INCR    R7                              ; 5D9E   000F

L_5D9F:
        PSHR    R5                              ; 5D9F   0275
L_5DA0:
        MOVR    R0,     R5                      ; 5DA0   0085
        ADDI    #$0174, R5                      ; 5DA1   02FD 0174
        PSHR    R0                              ; 5DA3   0270
        MVI@    R5,     R0                      ; 5DA4   02A8
        DECR    R5                              ; 5DA5   0015
        COMR    R0                              ; 5DA6   0018
        SLR     R0,     2                       ; 5DA7   0064
        RRC     R0,     1                       ; 5DA8   0070
        PULR    R0                              ; 5DA9   02B0
        PULR    R7                              ; 5DAA   02B7

        DECLE   $0000,  $0000,  $0000,  $0018   ; 5DAB   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 5DAF   0018 0000 0000 0000
        DECLE   $0300,  $0300,  $0300,  $0300   ; 5DB3   0300 0300 0300 0300
        DECLE   $0318,  $0318,  $0324,  $0324   ; 5DB7   0318 0318 0324 0324
        DECLE   $035A,  $035A,  $033C,  $033C   ; 5DBB   035A 035A 033C 033C
        DECLE   $0324,  $0324,  $0300,  $0324   ; 5DBF   0324 0324 0300 0324
        DECLE   $0018,  $0018,  $0000,  $007C   ; 5DC3   0018 0018 0000 007C
        DECLE   $007C,  $005A,  $001A,  $0000   ; 5DC7   007C 005A 001A 0000
        DECLE   $001A,  $0018,  $0018,  $0010   ; 5DCB   001A 0018 0018 0010
        DECLE   $0010,  $0010,  $0000,  $0010   ; 5DCF   0010 0010 0000 0010
        DECLE   $0018,  $0018,  $0000,  $003C   ; 5DD3   0018 0018 0000 003C
        DECLE   $007E,  $005A,  $005A,  $0000   ; 5DD7   007E 005A 005A 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5DDB   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5DDF   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0000,  $003C   ; 5DE3   0018 0018 0000 003C
        DECLE   $007E,  $005A,  $005A,  $0000   ; 5DE7   007E 005A 005A 0000
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5DEB   0018 0018 0018 0018
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5DEF   0018 0018 0000 0000
        DECLE   $0018,  $0018,  $0000,  $003E   ; 5DF3   0018 0018 0000 003E
        DECLE   $003E,  $005A,  $0058,  $0000   ; 5DF7   003E 005A 0058 0000
        DECLE   $0058,  $0018,  $0018,  $0008   ; 5DFB   0058 0018 0018 0008
        DECLE   $0008,  $0008,  $0000,  $0008   ; 5DFF   0008 0008 0000 0008
        DECLE   $030C,  $030E,  $0300,  $030C   ; 5E03   030C 030E 0300 030C
        DECLE   $030C,  $030C,  $030C,  $030E   ; 5E07   030C 030C 030C 030E
        DECLE   $030C,  $030C,  $030C,  $033C   ; 5E0B   030C 030C 030C 033C
        DECLE   $0328,  $0328,  $0308,  $030C   ; 5E0F   0328 0328 0308 030C
        DECLE   $0306,  $0307,  $0300,  $030C   ; 5E13   0306 0307 0300 030C
        DECLE   $031C,  $031C,  $031E,  $0318   ; 5E17   031C 031C 031E 0318
        DECLE   $031C,  $033E,  $0322,  $032E   ; 5E1B   031C 033E 0322 032E
        DECLE   $0328,  $0320,  $0320,  $0310   ; 5E1F   0328 0320 0320 0310
        DECLE   $0306,  $0307,  $0300,  $031C   ; 5E23   0306 0307 0300 031C
        DECLE   $033C,  $032E,  $032C,  $0300   ; 5E27   033C 032E 032C 0300
        DECLE   $031C,  $033F,  $0321,  $0327   ; 5E2B   031C 033F 0321 0327
        DECLE   $0324,  $0344,  $0340,  $0340   ; 5E2F   0324 0344 0340 0340
        DECLE   $030C,  $030E,  $0300,  $0378   ; 5E33   030C 030E 0300 0378
        DECLE   $0358,  $035F,  $0318,  $0300   ; 5E37   0358 035F 0318 0300
        DECLE   $0318,  $033F,  $0321,  $0362   ; 5E3B   0318 033F 0321 0362
        DECLE   $0342,  $03C0,  $0380,  $0380   ; 5E3F   0342 03C0 0380 0380
        DECLE   $030C,  $030E,  $0370,  $0358   ; 5E43   030C 030E 0370 0358
        DECLE   $035F,  $0318,  $0318,  $0300   ; 5E47   035F 0318 0318 0300
        DECLE   $0318,  $033F,  $0321           ; 5E4B   0318 033F 0321

        CMP@    R4,     R1                      ; 5E4E   0361
        CMP     G_03C0, R1                      ; 5E4F   0341 03C0
        AND     G_0300, R0                      ; 5E51   0380 0300
        SUB@    R1,     R4                      ; 5E53   030C
        SUB@    R1,     R6                      ; 5E54   030E
        SUB     G_0378, R0                      ; 5E55   0300 0378
        CMP@    R3,     R0                      ; 5E57   0358
        CMP@    R3,     R7                      ; 5E58   035F
        SUB@    R3,     R0                      ; 5E59   0318
        SUB     G_0318, R0                      ; 5E5A   0300 0318
        SUBI    #$0324, R4                      ; 5E5C   033C 0324
        CMP@    R4,     R6                      ; 5E5E   0366
        XOR     G_0382, R2                      ; 5E5F   03C2 0382
        SUB     G_0300, R3                      ; 5E61   0303 0300
        SUB     G_0307, R6                      ; 5E63   0306 0307
        SUB     G_031C, R0                      ; 5E65   0300 031C
        SUBI    #$032E, R4                      ; 5E67   033C 032E
        SUB@    R5,     R4                      ; 5E69   032C
        SUB     G_0338, R0                      ; 5E6A   0300 0338
        SUBI    #$0324, R4                      ; 5E6C   033C 0324
        XOR@    R4,     R4                      ; 5E6E   03E4
        AND     G_0384, R4                      ; 5E6F   0384 0384
        SUB     G_0306, R4                      ; 5E71   0304 0306
        SUB     G_0307, R6                      ; 5E73   0306 0307
        SUB     G_030C, R0                      ; 5E75   0300 030C
        SUB@    R3,     R4                      ; 5E77   031C
        SUB@    R3,     R4                      ; 5E78   031C
        SUB@    R3,     R6                      ; 5E79   031E
        SUB@    R3,     R0                      ; 5E7A   0318
        SUB@    R3,     R0                      ; 5E7B   0318
        SUB@    R3,     R0                      ; 5E7C   0318
        SUB@    R3,     R0                      ; 5E7D   0318
        CMPI    #$0348, R0                      ; 5E7E   0378 0348
        CMP@    R1,     R0                      ; 5E80   0348
        SUB@    R1,     R0                      ; 5E81   0308
        SUB@    R1,     R4                      ; 5E82   030C
        SUB     G_0318, R0                      ; 5E83   0300 0318
        SUB@    R3,     R0                      ; 5E85   0318
        SUB@    R4,     R4                      ; 5E86   0324
        SUBI    #$035A, R4                      ; 5E87   033C 035A
        CMP@    R3,     R2                      ; 5E89   035A
        SUB@    R4,     R4                      ; 5E8A   0324
        SUB@    R3,     R4                      ; 5E8B   031C
        SUB@    R3,     R0                      ; 5E8C   0318
        SUB@    R3,     R0                      ; 5E8D   0318
        SUB@    R3,     R0                      ; 5E8E   0318
        SUB@    R3,     R0                      ; 5E8F   0318
        SUB@    R3,     R0                      ; 5E90   0318
        SUB     G_033C, R0                      ; 5E91   0300 033C
        SUB     G_0300, R0                      ; 5E93   0300 0300
        SUB@    R3,     R0                      ; 5E95   0318
        SUB@    R3,     R0                      ; 5E96   0318
        SUB     G_031E, R4                      ; 5E97   0304 031E
        SUBI    #$0324, R2                      ; 5E99   033A 0324
        SUBI    #$0338, R4                      ; 5E9B   033C 0338
        SUB@    R3,     R0                      ; 5E9D   0318
        SUBI    #$0318, R0                      ; 5E9E   0338 0318
        SUB@    R2,     R0                      ; 5EA0   0310
        SUB@    R3,     R0                      ; 5EA1   0318
        SUBI    #$0318, R0                      ; 5EA2   0338 0318
        SUBI    #$0300, R0                      ; 5EA4   0338 0300
        SUB@    R3,     R0                      ; 5EA6   0318
        SUB@    R3,     R0                      ; 5EA7   0318
        CMP@    R3,     R0                      ; 5EA8   0358
        XORI    #$03C8, R0                      ; 5EA9   03F8 03C8
        SUB@    R3,     R0                      ; 5EAB   0318
        SUBI    #$0328, R0                      ; 5EAC   0338 0328
        SUB@    R5,     R0                      ; 5EAE   0328
        CMP@    R5,     R0                      ; 5EAF   0368
        SUB@    R1,     R0                      ; 5EB0   0308
        SUB@    R1,     R0                      ; 5EB1   0308
        SUB@    R3,     R0                      ; 5EB2   0318
        SUB@    R3,     R0                      ; 5EB3   0318
        SUBI    #$0340, R0                      ; 5EB4   0338 0340
        CMP@    R3,     R0                      ; 5EB6   0358
        CMP@    R3,     R0                      ; 5EB7   0358
        SUBI    #$0318, R0                      ; 5EB8   0338 0318
        SUB     G_0378, R0                      ; 5EBA   0300 0378
        CMP@    R1,     R0                      ; 5EBC   0348
        CMP@    R1,     R0                      ; 5EBD   0348
        XOR@    R1,     R0                      ; 5EBE   03C8
        SUB@    R1,     R4                      ; 5EBF   030C
        SUB     G_0304, R4                      ; 5EC0   0304 0304
        SUB     G_0358, R4                      ; 5EC2   0304 0358
        SUB@    R3,     R0                      ; 5EC4   0318
        CMP     G_034C, R0                      ; 5EC5   0340 034C
        CMPI    #$031A, R4                      ; 5EC7   037C 031A
        SUB@    R3,     R2                      ; 5EC9   031A
        SUB     G_031A, R0                      ; 5ECA   0300 031A
        SUB@    R3,     R0                      ; 5ECC   0318
        SUB@    R3,     R0                      ; 5ECD   0318
        SUB@    R3,     R0                      ; 5ECE   0318
        SUB@    R1,     R0                      ; 5ECF   0308
        SUB@    R1,     R0                      ; 5ED0   0308
        SUB@    R1,     R0                      ; 5ED1   0308
        SUB@    R1,     R0                      ; 5ED2   0308
        SUB     G_0318, R0                      ; 5ED3   0300 0318
        AND@    R3,     R0                      ; 5ED5   0398
        SUB     G_03BE, R0                      ; 5ED6   0300 03BE
        XORI    #$031A, R2                      ; 5ED8   03FA 031A
        SUB@    R3,     R2                      ; 5EDA   031A
        SUB@    R3,     R0                      ; 5EDB   0318
        SUB@    R3,     R0                      ; 5EDC   0318
        SUB@    R3,     R0                      ; 5EDD   0318
        SUB@    R3,     R0                      ; 5EDE   0318
        SUB@    R3,     R0                      ; 5EDF   0318
        SUB@    R3,     R0                      ; 5EE0   0318
        SUB     G_0300, R0                      ; 5EE1   0300 0300
        SUB     G_0300, R0                      ; 5EE3   0300 0300
        SUB@    R3,     R0                      ; 5EE5   0318
        SUB@    R3,     R0                      ; 5EE6   0318
        SUB     G_03BD, R7                      ; 5EE7   0307 03BD

        CMP@    R3,     R2                      ; 5EE9   035A
        AND@    R3,     R0                      ; 5EEA   0398
        SUBI    #$0338, R0                      ; 5EEB   0338 0338
        SUBI    #$0338, R0                      ; 5EED   0338 0338
        SUB@    R6,     R0                      ; 5EEF   0330
        SUB@    R6,     R0                      ; 5EF0   0330
        SUB@    R6,     R0                      ; 5EF1   0330
        SUB@    R6,     R0                      ; 5EF2   0330
        SUB     G_0300, R0                      ; 5EF3   0300 0300
        SUB     G_0319, R0                      ; 5EF5   0300 0319
        SUB@    R3,     R3                      ; 5EF7   031B
        SUB     G_033C, R6                      ; 5EF8   0306 033C
        SUBI    #$03A8, R0                      ; 5EFA   0338 03A8
        SUBI    #$0308, R0                      ; 5EFC   0338 0308
        SUBI    #$0330, R0                      ; 5EFE   0338 0330
        SUB@    R6,     R0                      ; 5F00   0330
        SUB@    R6,     R0                      ; 5F01   0330
        SUB@    R6,     R0                      ; 5F02   0330
        AND@    R6,     R0                      ; 5F03   03B0
        ANDI    #$0380, R0                      ; 5F04   03B8 0380
        AND@    R6,     R0                      ; 5F06   03B0
        ANDI    #$0388, R0                      ; 5F07   03B8 0388
        CMPI    #$0300, R0                      ; 5F09   0378 0300
        SUB@    R6,     R0                      ; 5F0B   0330
        SUB@    R6,     R0                      ; 5F0C   0330
        SUB@    R6,     R0                      ; 5F0D   0330
        SUB@    R6,     R0                      ; 5F0E   0330
        SUB@    R6,     R0                      ; 5F0F   0330
        SUB@    R6,     R0                      ; 5F10   0330
        SUB     G_0378, R0                      ; 5F11   0300 0378
        SUB@    R6,     R0                      ; 5F13   0330
        SUBI    #$0380, R0                      ; 5F14   0338 0380
        AND@    R6,     R0                      ; 5F16   03B0
        CMPI    #$0358, R0                      ; 5F17   0378 0358
        SUB@    R5,     R0                      ; 5F19   0328
        SUBI    #$0300, R0                      ; 5F1A   0338 0300
        SUB@    R6,     R0                      ; 5F1C   0330
        SUB@    R6,     R0                      ; 5F1D   0330
        CMP@    R4,     R0                      ; 5F1E   0360
        CMP@    R4,     R0                      ; 5F1F   0360
        XOR@    R4,     R0                      ; 5F20   03E0
        SUB@    R4,     R0                      ; 5F21   0320
        CMP@    R4,     R0                      ; 5F22   0360
        SUB@    R6,     R0                      ; 5F23   0330
        SUBI    #$0380, R0                      ; 5F24   0338 0380
        CMP@    R2,     R0                      ; 5F26   0350
        SUB@    R4,     R0                      ; 5F27   0320
        CMP@    R2,     R0                      ; 5F28   0350
        CMP@    R1,     R0                      ; 5F29   0348
        CMP@    R6,     R0                      ; 5F2A   0370
        SUB     G_0330, R0                      ; 5F2B   0300 0330
        SUB@    R6,     R0                      ; 5F2D   0330
        SUB@    R6,     R0                      ; 5F2E   0330
        SUB@    R6,     R0                      ; 5F2F   0330
        SUBI    #$0340, R0                      ; 5F30   0338 0340
        CMP     G_0330, R0                      ; 5F32   0340 0330
        SUBI    #$0300, R0                      ; 5F34   0338 0300
        SUB@    R6,     R0                      ; 5F36   0330
        SUBI    #$0338, R0                      ; 5F37   0338 0338
        SUB     G_03F8, R4                      ; 5F39   0304 03F8
        SUB     G_0330, R0                      ; 5F3B   0300 0330
        SUBI    #$0328, R0                      ; 5F3D   0338 0328
        SUB@    R5,     R0                      ; 5F3F   0328
        SUB@    R5,     R4                      ; 5F40   032C
        CMP     G_0340, R0                      ; 5F41   0340 0340
        SUB@    R6,     R0                      ; 5F43   0330
        SUBI    #$0300, R0                      ; 5F44   0338 0300
        SUB@    R6,     R0                      ; 5F46   0330
        CMP@    R6,     R0                      ; 5F47   0370
        CMP@    R6,     R0                      ; 5F48   0370
        CMP     G_037E, R0                      ; 5F49   0340 037E
        SUB     G_033C, R0                      ; 5F4B   0300 033C
        SUBI    #$0324, R4                      ; 5F4D   033C 0324
        SUB@    R4,     R6                      ; 5F4F   0326
        SUB@    R4,     R0                      ; 5F50   0320
        CMP     G_0340, R0                      ; 5F51   0340 0340
        SUB@    R6,     R0                      ; 5F53   0330
        SUBI    #$0300, R0                      ; 5F54   0338 0300
        SUB@    R6,     R1                      ; 5F56   0331
        CMP@    R6,     R2                      ; 5F57   0372
        CMPI    #$0368, R4                      ; 5F58   037C 0368
        CMP@    R6,     R0                      ; 5F5A   0370
        SUB     G_0330, R0                      ; 5F5B   0300 0330
        SUBI    #$0324, R4                      ; 5F5D   033C 0324
        CMP     G_0346, R4                      ; 5F5F   0344 0346
        AND     G_0380, R0                      ; 5F61   0380 0380
        SUB@    R6,     R4                      ; 5F63   0334
        SUBI    #$0304, R4                      ; 5F64   033C 0304
        SUB@    R6,     R4                      ; 5F66   0334
        CMP@    R6,     R4                      ; 5F67   0374
        CMP@    R4,     R4                      ; 5F68   0364
        SUBI    #$0330, R4                      ; 5F69   033C 0330
        SUB     G_0330, R0                      ; 5F6B   0300 0330
        SUBI    #$0322, R6                      ; 5F6D   033E 0322
        SUB@    R4,     R2                      ; 5F6F   0322
        XOR@    R4,     R3                      ; 5F70   03E3
        AND     G_0380, R0                      ; 5F71   0380 0380
        SUB     G_0300, R0                      ; 5F73   0300 0300
        AND@    R3,     R0                      ; 5F75   0398
        CMP@    R3,     R4                      ; 5F76   035C
        SUB@    R4,     R0                      ; 5F77   0320
        SUB@    R3,     R4                      ; 5F78   031C
        SUB@    R3,     R2                      ; 5F79   031A
        SUB@    R3,     R4                      ; 5F7A   031C
        SUB@    R3,     R0                      ; 5F7B   0318
        SUB     G_0318, R0                      ; 5F7C   0300 0318
        SUB@    R3,     R4                      ; 5F7E   031C
        SUB@    R2,     R4                      ; 5F7F   0314
        XOR@    R6,     R6                      ; 5F80   03F6
        AND     G_0383, R2                      ; 5F81   0382 0383
        PSHR    R5                              ; 5F83   0275

L_5F84:
        JSR     R5,     X_PLAY_SFX1             ; 5F84   0004 0118 03BB
        DECLE   $0079                           ; 5F87  SFX data
        DECLE   $03B7                           ; 5F88  SFX data
        DECLE   $000C,  $0080                   ; 5F89  SFX data
        DECLE   $010D                           ; 5F8B  SFX data
        DECLE   $010B                           ; 5F8C  SFX data
        DECLE   $03CF                           ; 5F8D  SFX end

L_5F8E:
        PSHR    R5                              ; 5F8E   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F8F   0004 0118 03BB
        DECLE   $0079                           ; 5F92  SFX data
        DECLE   $001C,  $0000                   ; 5F93  SFX data
        DECLE   $010D                           ; 5F95  SFX data
        DECLE   $0035                           ; 5F96  SFX data
        DECLE   $006E                           ; 5F97  SFX data
        DECLE   $02EB                           ; 5F98  SFX data
        DECLE   $03AE                           ; 5F99  SFX data
        DECLE   $02EB                           ; 5F9A  SFX data
        DECLE   $03CF                           ; 5F9B  SFX end

L_5F9C:
        PSHR    R5                              ; 5F9C   0275

        JSR     R5,     X_PLAY_SFX1             ; 5F9D   0004 0118 03BB
        DECLE   $010D                           ; 5FA0  SFX data
        DECLE   $03B7                           ; 5FA1  SFX data
        DECLE   $000B                           ; 5FA2  SFX data
        DECLE   $01EB                           ; 5FA3  SFX data
        DECLE   $000C,  $0080                   ; 5FA4  SFX data
        DECLE   $03E9                           ; 5FA6  SFX data
        DECLE   $02C0,  $0040                   ; 5FA7  SFX data
        DECLE   $0001,  $0004                   ; 5FA9  SFX data
        DECLE   $004F,  $000A                   ; 5FAB  SFX data
        DECLE   $0303,  $03F8                   ; 5FAD  SFX data
        DECLE   $02CF                           ; 5FAF  SFX end

L_5FB0:
        PSHR    R5                              ; 5FB0   0275
        CLRR    R0                              ; 5FB1   01C0
        MVO     R0,     G_0146                  ; 5FB2   0240 0146

        JSR     R5,     X_PLAY_SFX1             ; 5FB4   0004 0118 03BB
        DECLE   $03E9                           ; 5FB7  SFX data
        DECLE   $0340,  $0340                   ; 5FB8  SFX data
        DECLE   $0001,  $03F0                   ; 5FBA  SFX data
        DECLE   $031D                           ; 5FBC  SFX data
        DECLE   $0303,  $03F8                   ; 5FBD  SFX data
        DECLE   $02CF                           ; 5FBF  SFX end

L_5FC0:
        PSHR    R5                              ; 5FC0   0275

        JSR     R5,     X_PLAY_SFX2             ; 5FC1   0004 0118 03BE
        DECLE   $0081                           ; 5FC4  SFX prio
        DECLE   $03C9                           ; 5FC5  SFX data
        DECLE   $000C,  $0078                   ; 5FC6  SFX data
        DECLE   $0035                           ; 5FC8  SFX data
        DECLE   $008F,  $0017                   ; 5FC9  SFX data
        DECLE   $020B                           ; 5FCB  SFX data
        DECLE   $0040,  $01A0                   ; 5FCC  SFX data
        DECLE   $0048,  $0040                   ; 5FCE  SFX data
        DECLE   $0001,  $03C0                   ; 5FD0  SFX data
        DECLE   $0001,  $0012                   ; 5FD2  SFX data
        DECLE   $02AB                           ; 5FD4  SFX data
        DECLE   $0001,  $0003                   ; 5FD5  SFX data
        DECLE   $000C,  $007C                   ; 5FD7  SFX data
        DECLE   $036B                           ; 5FD9  SFX data
        DECLE   $000C,  $0074                   ; 5FDA  SFX data
        DECLE   $0001,  $03C0                   ; 5FDC  SFX data
        DECLE   $0001,  $0012                   ; 5FDE  SFX data
        DECLE   $012B                           ; 5FE0  SFX data
        DECLE   $0001,  $0060                   ; 5FE1  SFX data
        DECLE   $0001,  $000E                   ; 5FE3  SFX data
        DECLE   $016B                           ; 5FE5  SFX data
        DECLE   $000C,  $00A0                   ; 5FE6  SFX data
        DECLE   $016B                           ; 5FE8  SFX data
        DECLE   $02CF                           ; 5FE9  SFX end

L_5FEA:
        JSR     R5,     X_PLAY_SFX1             ; 5FEA   0004 0118 03BB
        DECLE   $0389                           ; 5FED  SFX data
        DECLE   $006C,  $0000                   ; 5FEE  SFX data
        DECLE   $0050,  $0100                   ; 5FF0  SFX data
        DECLE   $0058,  $010C                   ; 5FF2  SFX data
        DECLE   $005B                           ; 5FF4  SFX data
        DECLE   $0044,  $0100                   ; 5FF5  SFX data
        DECLE   $0001,  $03A0                   ; 5FF7  SFX data
        DECLE   $0001,  $03B2                   ; 5FF9  SFX data
        DECLE   $0001,  $03F1                   ; 5FFB  SFX data
        DECLE   $000B                           ; 5FFD  SFX data
        DECLE   $02EB                           ; 5FFE  SFX data
        DECLE   $03CF                           ; 5FFF  SFX end

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5034       <entry>
;;  $5048       <entry>
;;  $504F       $55B9  
;;  $5064       $5061   $5069  
;;  $506C       $5065  
;;  $5078       $577B  
;;  $507E       $5055  
;;  $5080       $5084  
;;  $5081       $507F  
;;  $5087       $5082  
;;  $508D       $5419   $5D3B  
;;  $509B       $586D   $5896   $58B2   $5961   $5996   $5AA7   $5ACC  
;;  $50AB       <entry> $509C  
;;  $5117       $5035  
;;  $5199       $511F  
;;  $519D       $51C7  
;;  $51A3       $51A7  
;;  $51AE       $51C2  
;;  $51B8       $51B4  
;;  $51CA       $5278   $5778   $587D   $58A4   $5973   $5CCD  
;;  $51CB       $51C9  
;;  $5236       $53D1  
;;  $5278       $5045   $526B   $5273  
;;  $5289       $52B3  
;;  $52A2       $529E  
;;  $52B6       $53D5  
;;  $52CF       $5C89   $5D50  
;;  $52E2       $52CD  
;;  $52E6       $52E0  
;;  $52F2       $52D2  
;;  $52F7       $52EC  
;;  $5306       $5303  
;;  $531B       $530A   $530E   $5315  
;;  $5328       $531E  
;;  $5332       $5326  
;;  $533F       $5332  
;;  $5352       $534C  
;;  $5354       $5350  
;;  $535A       $5352  
;;  $53AE       $53BF  
;;  $53CC       $52F0  
;;  $53DE       $53D9  
;;  $53E2       $53E4  
;;  $53FC       $53FD  
;;  $5415       $5244   $5271   $5276   $52C9   $52F5   $52FB   $52FF   $5319  
;;  $5415       $532C   $5330   $5358   $538E   $5390   $5396   $5470   $5473  
;;  $5415       $5598  
;;  $5416       $53EB   $53F0  
;;  $5428       $5431  
;;  $5433       $542B  
;;  $5444       $544B  
;;  $545A       $544D  
;;  $5480       $547C  
;;  $5491       $5484  
;;  $54D5       $54E0  
;;  $54EA       $5354  
;;  $5517       $551E  
;;  $5522       $5518  
;;  $5540       $5520  
;;  $5551       $5544  
;;  $5553       $554F  
;;  $557E       $557A  
;;  $558E       $5559   $555E  
;;  $5591       $52E3   $531B   $5907  
;;  $55A2       $559A   $59B2   $59BD  
;;  $55A6       $5073   $527C   $52BD  
;;  $55A7       $541D  
;;  $55AD       $55A4  
;;  $55B7       $559D  
;;  $55BD       $59C2  
;;  $55BE       $55BC  
;;  $55E3       $5049  
;;  $5612       $560E  
;;  $5616       $5604  
;;  $5617       $5615  
;;  $561A       $55EA   $5602  
;;  $561C       $5622  
;;  $5624       $5679  
;;  $5625       $561D  
;;  $563C       $562D  
;;  $563D       $5642  
;;  $5645       $563F  
;;  $564B       $5647  
;;  $5658       $5655  
;;  $565D       $565A  
;;  $5670       $566C  
;;  $5674       $5650  
;;  $5678       $5661  
;;  $5760       $558B  
;;  $5799       $5793  
;;  $57B5       $5767   $57C7   $5863   $5882   $58A9   $5957   $5979   $5A1C  
;;  $57B5       $5A21   $5A61   $5A75  
;;  $57B7       $576F  
;;  $57C4       $57E5  
;;  $57E0       $57EB  
;;  $57ED       $54E2  
;;  $5801       $57FD  
;;  $5839       $582C  
;;  $583C       $5837  
;;  $585A       $5807   $580A   $580F   $5813  
;;  $585D       $5A84  
;;  $586D       $5894  
;;  $5878       $5B2C  
;;  $588A       $586B  
;;  $58CB       $5902  
;;  $58D0       $58F5  
;;  $58F3       $58D4   $58D9   $58DF  
;;  $58FE       $58FA  
;;  $5905       $5853   $591E  
;;  $5912       $590A  
;;  $591D       $5866  
;;  $593B       $5937  
;;  $5945       $5942  
;;  $5953       $5950  
;;  $595C       $5CBF  
;;  $597F       $5991  
;;  $598F       $5986  
;;  $59A5       $5D5D  
;;  $59BB       $59D8  
;;  $59CF       $59CB  
;;  $59F0       $59EC  
;;  $59F2       $584C   $5884   $58BB  
;;  $5A12       $5761   $5A0C   $5C8D   $5D53  
;;  $5A23       $5A5D  
;;  $5A55       $5A4D  
;;  $5A59       $5A38   $5A53  
;;  $5A5B       $5A27   $5A2B   $5A33   $5A36   $5A51   $5A57  
;;  $5A72       $5A64   $5A6A   $5A6F  
;;  $5A87       $5A80  
;;  $5AA2       $5A9B  
;;  $5AA7       $5A97  
;;  $5AC4       $5959   $5A8F  
;;  $5AE2       $5B21  
;;  $5AF4       $5AEA  
;;  $5B12       $5AFF  
;;  $5B1F       $5AE6   $5AF2   $5AFA  
;;  $5B2F       $58C3   $5993   $5ABF   $5B23  
;;  $5B4B       $5B46  
;;  $5B4D       $504C  
;;  $5B6D       $5B62   $5B68  
;;  $5B95       $5B5B   $5B5D   $5B64   $5B6A   $5B78  
;;  $5BAA       $5B50   $5B8B   $5B93   $5BA5  
;;  $5BBC       $5BB0   $5BB2  
;;  $5BBE       $5BBA  
;;  $5BC5       $5BCD  
;;  $5BD0       $5BC7  
;;  $5BF9       $5BF0  
;;  $5BFF       $5BDE  
;;  $5C01       $5BFD  
;;  $5C03       $5BF7  
;;  $5C10       $5C32  
;;  $5C30       $5C14   $5C1C   $5C27  
;;  $5C35       $5BE8  
;;  $5C3C       $5C3F   $5C47  
;;  $5C49       $5B8D  
;;  $5C4A       $5AC2   $5CAF  
;;  $5C4C       $5C73  
;;  $5C6E       $5C6A  
;;  $5C71       $5C50   $5C54   $5C59  
;;  $5C76       $5B48   $5BA7  
;;  $5C83       $5C7D  
;;  $5C8D       $5C81  
;;  $5CB1       $5AC7   $5B2A   $5B35   $5BD4   $5BD9   $5C09   $5C9D   $5CB5  
;;  $5CB1       $5CBA   $5CE6   $5CF0   $5D20   $5D28   $5D2A   $5D59  
;;  $5CB7       $5887   $5BF5   $5C0C   $5C24   $5C2E   $5C37   $5C45   $5D2F  
;;  $5CC3       $5CA1  
;;  $5CDD       $5CD3   $5CD7  
;;  $5CEC       $5CBC   $5CC3  
;;  $5D04       $5CFB  
;;  $5D14       $5D10  
;;  $5D32       $53DB  
;;  $5D53       $5D47   $5D4B  
;;  $5D5D       $5CDB  
;;  $5D60       $5AEE   $5BB7   $5BDB   $5C41  
;;  $5D65       $5A6C   $5B43   $5BA2   $5C1F   $5C9A   $5D1D  
;;  $5D66       $5D64  
;;  $5D6D       $5D7D  
;;  $5D7F       $5D96  
;;  $5D82       $5D77  
;;  $5D98       $5D8A   $5D8E  
;;  $5D9A       $5CED   $5D90  
;;  $5D9F       $59F5   $5B05   $5B6F   $5C96   $5D36  
;;  $5DA0       $5D9E  
;;  $5F84       $53AE  
;;  $5F8E       $57CF  
;;  $5F9C       $5856  
;;  $5FB0       $54D2  
;;  $5FC0       $595E  
;;  $5FEA       $5AA4  
;; ======================================================================== ;;
