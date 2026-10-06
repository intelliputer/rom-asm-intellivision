
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
L_5804:
        ANDI    #$00FF, R2                      ; 5804   03BA 00FF
L_5806:
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

        DECLE   $02BE,  $034C,  $0001,  $02B8   ; 6000   02BE 034C 0001 02B8
        DECLE   $002E,  $0070,  $0240,  $0100   ; 6004   002E 0070 0240 0100
        DECLE   $0040,  $0240,  $0101,  $01DB   ; 6008   0040 0240 0101 01DB
        DECLE   $0243,  $0340,  $01DB,  $0243   ; 600C   0243 0340 01DB 0243
        DECLE   $0341,  $01DB,  $0243,  $034A   ; 6010   0341 01DB 0243 034A
        DECLE   $0281,  $01FE,  $0379,  $00BA   ; 6014   0281 01FE 0379 00BA
        DECLE   $020C,  $0003,  $0004           ; 6018   020C 0003 0004

        CMPI    #$02CE, R4                      ; 601B   037C 02CE
        SDBD                                    ; 601D   0001
        MVII    #$7043, R0                      ; 601E   02B8 0043 0070
        MVO     R0,     G_033E                  ; 6021   0240 033E
        EIS                                     ; 6023   0002
L_6024:
        CLRR    R0                              ; 6024   01C0
        MVO     R0,     G_033D                  ; 6025   0240 033D
L_6027:
        MVI     G_033D, R0                      ; 6027   0280 033D
        TSTR    R0                              ; 6029   0080
        BEQ     L_6027                          ; 602A   0224 0004
        MVI     G_033E, R7                      ; 602C   0287 033E

        MVI     G_033D, R0                      ; 602E   0280 033D
        INCR    R0                              ; 6030   0008
        MVO     R0,     G_033D                  ; 6031   0240 033D
        MVO     R0,     .STIC.VIDEN             ; 6033   0240 0020
        MVI     G_034A, R0                      ; 6035   0280 034A
        INCR    R0                              ; 6037   0008
        MVO     R0,     G_034A                  ; 6038   0240 034A
        PULR    R5                              ; 603A   02B5
        PULR    R4                              ; 603B   02B4
        PULR    R3                              ; 603C   02B3
        PULR    R2                              ; 603D   02B2
        PULR    R1                              ; 603E   02B1
        PULR    R0                              ; 603F   02B0
        RSWD    R0                              ; 6040   0038
        PULR    R0                              ; 6041   02B0
        PULR    R7                              ; 6042   02B7

        DECLE   $01C0,  $0240,  $033E,  $0280   ; 6043   01C0 0240 033E 0280
        DECLE   $0021,  $0004,  $0170,  $0051   ; 6047   0021 0004 0170 0051
        DECLE   $0004,  $0170,  $0071,  $0004   ; 604B   0004 0170 0071 0004

        CMPI    #$0299, R0                      ; 604F   0378 0299
        PSHR    R5                              ; 6051   0275
        CLRR    R0                              ; 6052   01C0
        MVO     R0,     .STIC.HDLY              ; 6053   0240 0030
        MVO     R0,     .STIC.VDLY              ; 6055   0240 0031
        MVO     R0,     .STIC.EDGE              ; 6057   0240 0032
        CLRR    R4                              ; 6059   01E4
        MVII    #$0008, R0                      ; 605A   02B8 0008
        MVII    #$000E, R1                      ; 605C   02B9 000E
        MVII    #$0028, R4                      ; 605E   02BC 0028
        MVO@    R0,     R4                      ; 6060   0260
        MVO@    R1,     R4                      ; 6061   0261
        MVO@    R0,     R4                      ; 6062   0260
        MVO@    R1,     R4                      ; 6063   0261
        MVII    #$0001, R0                      ; 6064   02B8 0001
        MVO@    R0,     R4                      ; 6066   0260
        CLRR    R0                              ; 6067   01C0
        CLRR    R4                              ; 6068   01E4
L_6069:
        MVO@    R0,     R4                      ; 6069   0260
        CMPI    #$0008, R4                      ; 606A   037C 0008
        BLT     L_6069                          ; 606C   0225 0004

        MVI     .STIC.MODE,R0                   ; 606E   0280 0021
        PULR    R7                              ; 6070   02B7

        PSHR    R5                              ; 6071   0275
        MVII    #$0200, R4                      ; 6072   02BC 0200
        CLRR    R0                              ; 6074   01C0
L_6075:
        MVO@    R0,     R4                      ; 6075   0260
        CMPI    #$02F0, R4                      ; 6076   037C 02F0
        BLT     L_6075                          ; 6078   0225 0004
        PULR    R7                              ; 607A   02B7

        PSHR    R5                              ; 607B   0275
        MVII    #$004B, R0                      ; 607C   02B8 004B
        MVO     R0,     G_033F                  ; 607E   0240 033F
        SDBD                                    ; 6080   0001
        MVII    #$7088, R0                      ; 6081   02B8 0088 0070
        MVO     R0,     G_033E                  ; 6084   0240 033E
        B       L_6024                          ; 6086   0220 0063

        DECLE   $0004,  $0170,  $02D5,  $0004   ; 6088   0004 0170 02D5 0004

        CMPR    R6,     R0                      ; 608C   0170
        SUBR    R5,     R7                      ; 608D   012F

        DECLE   $0005,  $0003,  $0000,  $0010   ; 608E   0005 0003 0000 0010
        DECLE   $0001,  $0000,  $0008,  $0038   ; 6092   0001 0000 0008 0038
        DECLE   $0001                           ; 6096   0001

        MVII    #$0108, R0                      ; 6097   02B8 0108
        MVO     R0,     .BTAB.14                ; 6099   0240 0214
        SDBD                                    ; 609B   0001
        MVII    #$70A3, R0                      ; 609C   02B8 00A3 0070
        MVO     R0,     G_033E                  ; 609F   0240 033E
        B       L_6024                          ; 60A1   0220 007E

        DECLE   $02B8,  $03FF,  $0240,  $0343   ; 60A3   02B8 03FF 0240 0343
        DECLE   $0004                           ; 60A7   0004

        CMPR    R6,     R0                      ; 60A8   0170
        SUBR    R1,     R5                      ; 60A9   010D
        SDBD                                    ; 60AA   0001
        MVII    #$70B2, R0                      ; 60AB   02B8 00B2 0070
        MVO     R0,     G_033E                  ; 60AE   0240 033E
        B       L_6024                          ; 60B0   0220 008D

        DECLE   $0004,  $0170,  $02D5,  $02B8   ; 60B2   0004 0170 02D5 02B8
        DECLE   $004D,  $0240,  $033F,  $02B8   ; 60B6   004D 0240 033F 02B8
        DECLE   $0001,  $0240,  $0348,  $02B8   ; 60BA   0001 0240 0348 02B8
        DECLE   $0100,  $0004,  $0170,  $0140   ; 60BE   0100 0004 0170 0140
        DECLE   $0000,  $0008,  $0004,  $0170   ; 60C2   0000 0008 0004 0170
        DECLE   $0234,  $0001,  $02BC,  $0018   ; 60C6   0234 0001 02BC 0018
        DECLE   $02A0,  $03B8,  $03FF,  $0080   ; 60CA   02A0 03B8 03FF 0080
        DECLE   $0204,  $0005,  $0004,  $017C   ; 60CE   0204 0005 0004 017C
        DECLE   $0129,  $000A,  $0071,  $037C   ; 60D2   0129 000A 0071 037C
        DECLE   $0020,  $0225,  $000E,  $0004   ; 60D6   0020 0225 000E 0004

        CMPR    R6,     R0                      ; 60DA   0170
        RRC     R1,     1                       ; 60DB   0071
        MVII    #$004D, R0                      ; 60DC   02B8 004D
        MVO     R0,     G_033F                  ; 60DE   0240 033F
        SDBD                                    ; 60E0   0001
        MVII    #$70E8, R0                      ; 60E1   02B8 00E8 0070
        MVO     R0,     G_033E                  ; 60E4   0240 033E
        B       L_6024                          ; 60E6   0220 00C3

        DECLE   $0004,  $0170,  $02D5,  $0004   ; 60E8   0004 0170 02D5 0004

        CMPR    R6,     R0                      ; 60EC   0170
        SUBR    R5,     R7                      ; 60ED   012F

        DECLE   $0020,  $0003,  $0010,  $0020   ; 60EE   0020 0003 0010 0020
        DECLE   $0000,  $0008,  $0008,  $0008   ; 60F2   0000 0008 0008 0008
        DECLE   $0001                           ; 60F6   0001

        MVII    #$0000, R0                      ; 60F7   02B8 0000
        MVO     R0,     .BTAB.14                ; 60F9   0240 0214
        SDBD                                    ; 60FB   0001
        MVII    #$7103, R0                      ; 60FC   02B8 0003 0071
        MVO     R0,     G_033E                  ; 60FF   0240 033E
        B       L_6024                          ; 6101   0220 00DE

        DECLE   $02B8,  $0000,  $0240,  $0343   ; 6103   02B8 0000 0240 0343
        DECLE   $0004,  $0170,  $010D,  $0004   ; 6107   0004 0170 010D 0004

        CMP@    R6,     R0                      ; 610B   0370
        ADD@    R3,     R7                      ; 610C   02DF

        PSHR    R5                              ; 610D   0275
        CLRR    R0                              ; 610E   01C0
        MVO     R0,     G_033E                  ; 610F   0240 033E
        MVII    #$0001, R2                      ; 6111   02BA 0001
        MVII    #$0018, R4                      ; 6113   02BC 0018
L_6115:
        MVI@    R4,     R0                      ; 6115   02A0
        DECLE   $03B8,  $03FF,  $001A,  $0190   ; 6116   03B8 03FF 001A 0190
        DECLE   $0281,  $0343,  $0191,  $0148   ; 611A   0281 0343 0191 0148
        DECLE   $0204,  $0005,  $0004           ; 611E   0204 0005 0004

        CMPR    R7,     R4                      ; 6121   017C
        SUBR    R5,     R1                      ; 6122   0129
        ADDR    R3,     R7                      ; 6123   00DF

        RRC     R2,     1                       ; 6124   0072
        COMR    R2                              ; 6125   001A
        SLL     R2,     1                       ; 6126   004A
        CMPI    #$0020, R4                      ; 6127   037C 0020
        BLT     L_6115                          ; 6129   0225 0015

        CLRC                                    ; 612B   0006
        PULR    R7                              ; 612C   02B7

        SETC                                    ; 612D   0007
        PULR    R7                              ; 612E   02B7

        CLRR    R4                              ; 612F   01E4
        MVII    #$0003, R0                      ; 6130   02B8 0003
L_6132:
        MVII    #$0008, R1                      ; 6132   02B9 0008
        SDBD                                    ; 6134   0001
        MVI@    R5,     R2                      ; 6135   02AA
        MVI@    R5,     R3                      ; 6136   02AB
L_6137:
        MVO@    R2,     R4                      ; 6137   0262
        ADDR    R3,     R2                      ; 6138   00DA
        DECR    R1                              ; 6139   0011
        BNEQ    L_6137                          ; 613A   022C 0004

        DECR    R0                              ; 613C   0010
        BNEQ    L_6132                          ; 613D   022C 000C
        MOVR    R5,     R7                      ; 613F   00AF

        MVI@    R5,     R4                      ; 6140   02AC
        MVI@    R5,     R1                      ; 6141   02A9
        PSHR    R5                              ; 6142   0275
L_6143:
        TSTR    R1                              ; 6143   0089
        BEQ     L_6154                          ; 6144   0204 000E

        MOVR    R0,     R3                      ; 6146   0083
        COMR    R3                              ; 6147   001B
        AND@    R4,     R3                      ; 6148   03A3
        DECR    R4                              ; 6149   0014
        MVI     G_0348, R5                      ; 614A   0285 0348
        TSTR    R5                              ; 614C   00AD
        BNEQ    L_6150                          ; 614D   020C 0001

        ADDR    R0,     R3                      ; 614F   00C3
L_6150:
        MVO@    R3,     R4                      ; 6150   0263
        DECR    R1                              ; 6151   0011
        B       L_6143                          ; 6152   0220 0010
L_6154:
        PULR    R7                              ; 6154   02B7

        DECLE   $0320,  $0120,  $0008,  $0008   ; 6155   0320 0120 0008 0008
        DECLE   $0240,  $0028,  $0000,  $0000   ; 6159   0240 0028 0000 0000
        DECLE   $0004,  $0320,  $0120,  $0008   ; 615D   0004 0320 0120 0008
        DECLE   $0008,  $0253,  $0028,  $0008   ; 6161   0008 0253 0028 0008
        DECLE   $0000,  $0002,  $0320,  $0120   ; 6165   0000 0002 0320 0120
        DECLE   $0080,  $0008,  $023F,  $0020   ; 6169   0080 0008 023F 0020
        DECLE   $0008,  $0000,  $0008,  $0320   ; 616D   0008 0000 0008 0320
        DECLE   $0120,  $0088,  $0008,  $023F   ; 6171   0120 0088 0008 023F
        DECLE   $0020,  $0008,  $0000,  $0004   ; 6175   0020 0008 0000 0004
        DECLE   $0320,  $0020,  $0008,  $0008   ; 6179   0320 0020 0008 0008
        DECLE   $023F,  $0028,  $0008,  $0000   ; 617D   023F 0028 0008 0000
        DECLE   $0001,  $0320,  $0120,  $0020   ; 6181   0001 0320 0120 0020
        DECLE   $0008,  $0253,  $0028,  $0008   ; 6185   0008 0253 0028 0008
        DECLE   $0080,  $0000,  $0000,  $0001   ; 6189   0080 0000 0000 0001
        DECLE   $02BC,  $0055,  $0071,  $0244   ; 618D   02BC 0055 0071 0244
        DECLE   $0343,  $02B8,  $0051,  $0240   ; 6191   0343 02B8 0051 0240
        DECLE   $033F,  $0004,  $0170,  $0071   ; 6195   033F 0004 0170 0071
        DECLE   $0004,  $0170,  $0234,  $0001   ; 6199   0004 0170 0234 0001
        DECLE   $0284,  $0343,  $02A0,  $01ED   ; 619D   0284 0343 02A0 01ED
        DECLE   $0268,  $02F8,  $0010,  $037D   ; 61A1   0268 02F8 0010 037D
        DECLE   $0008,  $0225,  $0006,  $02A0   ; 61A5   0008 0225 0006 02A0
        DECLE   $0268,  $037D,  $0010,  $0225   ; 61A9   0268 037D 0010 0225
        DECLE   $0004,  $0001,  $02A0,  $0268   ; 61AD   0004 0001 02A0 0268
        DECLE   $037D,  $0018,  $0225,  $0004   ; 61B1   037D 0018 0225 0004
        DECLE   $01C0,  $0268,  $037D,  $0021   ; 61B5   01C0 0268 037D 0021
        DECLE   $0225,  $0004,  $02BB,  $0008   ; 61B9   0225 0004 02BB 0008
        DECLE   $02A1,  $0241,  $0342,  $02A0   ; 61BD   02A1 0241 0342 02A0
        DECLE   $0001,  $02F8,  $0000,  $0008   ; 61C1   0001 02F8 0000 0008
        DECLE   $0248,  $02F9,  $0002,  $0013   ; 61C5   0248 02F9 0002 0013
        DECLE   $022C,  $0005,  $0244,  $0343   ; 61C9   022C 0005 0244 0343
        DECLE   $0004,  $0170,  $0234,  $0001   ; 61CD   0004 0170 0234 0001
        DECLE   $0284,  $0343,  $02BD,  $0018   ; 61D1   0284 0343 02BD 0018
        DECLE   $02A8,  $03B8,  $03FF,  $0080   ; 61D5   02A8 03B8 03FF 0080
        DECLE   $0204,  $0005,  $0004,  $017C   ; 61D9   0204 0005 0004 017C
        DECLE   $0129,  $0030,  $0072,  $037D   ; 61DD   0129 0030 0072 037D
        DECLE   $0020,  $0225,  $000E,  $0244   ; 61E1   0020 0225 000E 0244
        DECLE   $0343,  $0004,  $0170,  $0234   ; 61E5   0343 0004 0170 0234
        DECLE   $0001,  $0284,  $0343,  $02A5   ; 61E9   0001 0284 0343 02A5
        DECLE   $0001,  $02A1,  $0244,  $0343   ; 61ED   0001 02A1 0244 0343
        DECLE   $02BB,  $0008,  $02A8,  $01C8   ; 61F1   02BB 0008 02A8 01C8
        DECLE   $0015,  $0268,  $0013,  $022C   ; 61F5   0015 0268 0013 022C
        DECLE   $0006,  $02BD,  $0018,  $01C0   ; 61F9   0006 02BD 0018 01C0
        DECLE   $0268,  $037D,  $0021,  $0225   ; 61FD   0268 037D 0021 0225
        DECLE   $0004,  $0004,  $0170,  $0234   ; 6201   0004 0004 0170 0234
        DECLE   $0001,  $02BD,  $0018,  $02A8   ; 6205   0001 02BD 0018 02A8
        DECLE   $03B8,  $03FF,  $0378,  $0100   ; 6209   03B8 03FF 0378 0100
        DECLE   $0204,  $0005,  $0004,  $017C   ; 620D   0204 0005 0004 017C
        DECLE   $0129,  $0030,  $0072,  $037D   ; 6211   0129 0030 0072 037D
        DECLE   $0020,  $0225,  $000F,  $0281   ; 6215   0020 0225 000F 0281
        DECLE   $0342,  $02BB,  $0008,  $01C0   ; 6219   0342 02BB 0008 01C0
        DECLE   $0248,  $02F9,  $0002,  $0013   ; 621D   0248 02F9 0002 0013
        DECLE   $022C,  $0005,  $0284,  $0343   ; 6221   022C 0005 0284 0343
        DECLE   $0280,  $033F,  $0008,  $0240   ; 6225   0280 033F 0008 0240
        DECLE   $033F,  $0001,  $037C,  $008B   ; 6229   033F 0001 037C 008B
        DECLE   $0071,  $0225,  $0096,  $0004   ; 622D   0071 0225 0096 0004

        CMPR    R6,     R4                      ; 6231   0174
        MVO@    R1,     R3                      ; 6232   0259
        PULR    R7                              ; 6233   02B7

        MVI@    R5,     R0                      ; 6234   02A8
        PSHR    R5                              ; 6235   0275
        MVI     .PSG0.rgt_hand,R1               ; 6236   0281 01FE
        PSHR    R1                              ; 6238   0271
        MVI     .PSG0.lft_hand,R1               ; 6239   0281 01FF
        PSHR    R1                              ; 623B   0271
        PSHR    R0                              ; 623C   0270
L_623D:
        SDBD                                    ; 623D   0001
        MVII    #$7247, R1                      ; 623E   02B9 0047 0072
        MVO     R1,     G_033E                  ; 6241   0241 033E
        MVO     R0,     .STIC.VIDEN             ; 6243   0240 0020
        B       L_6024                          ; 6245   0220 0222

        DECLE   $02B0,  $0080,  $0204,  $0065   ; 6247   02B0 0080 0204 0065
        DECLE   $0010,  $0281,  $01FE,  $0282   ; 624B   0010 0281 01FE 0282
        DECLE   $01FF,  $008C,  $0095,  $0332   ; 624F   01FF 008C 0095 0332
        DECLE   $0331,  $0022,  $0021,  $0379   ; 6253   0331 0022 0021 0379
        DECLE   $0088,  $0204,  $004F,  $037A   ; 6257   0088 0204 004F 037A
        DECLE   $0088,  $0204,  $004B,  $037A   ; 625B   0088 0204 004B 037A
        DECLE   $0028,  $0204,  $004A,  $0379   ; 625F   0028 0204 004A 0379
        DECLE   $0028,  $0204,  $0046,  $0274   ; 6263   0028 0204 0046 0274
        DECLE   $0275,  $0270,  $0280,  $034A   ; 6267   0275 0270 0280 034A
        DECLE   $0378,  $003C,  $0205,  $000B   ; 626B   0378 003C 0205 000B
        DECLE   $0338,  $003C,  $0240,  $034A   ; 626F   0338 003C 0240 034A
        DECLE   $0281,  $0341,  $0004,  $0170   ; 6273   0281 0341 0004 0170
        DECLE   $02B4,  $0241,  $0341,  $0280   ; 6277   02B4 0241 0341 0280
        DECLE   $0341,  $0004                   ; 627B   0341 0004

        CMPR    R6,     R0                      ; 627D   0170
        MVI@    R1,     R7                      ; 627E   028F

        DECLE   $00ED,  $0002,  $02B8,  $00D2   ; 627F   00ED 0002 02B8 00D2
        DECLE   $0240,  $02EC,  $0280,  $0341   ; 6283   0240 02EC 0280 0341
        DECLE   $0040,  $0004                   ; 6287   0040 0004

        CMPR    R6,     R0                      ; 6289   0170
        MVI@    R1,     R7                      ; 628A   028F

        DECLE   $00EB,  $0001                   ; 628B   00EB 0001

        B       L_623D                          ; 628D   0220 0051

        MVI@    R5,     R1                      ; 628F   02A9
        ADDI    #$0200, R1                      ; 6290   02F9 0200
        MVI@    R5,     R3                      ; 6292   02AB
        PSHR    R5                              ; 6293   0275
L_6294:
        MOVR    R0,     R2                      ; 6294   0082
        MOVR    R3,     R5                      ; 6295   009D
L_6296:
        DECR    R5                              ; 6296   0015
        BEQ     L_629D                          ; 6297   0204 0004

        SLR     R2,     2                       ; 6299   0066
        SLR     R2,     2                       ; 629A   0066
        B       L_6296                          ; 629B   0220 0006

L_629D:
        ANDI    #$000F, R2                      ; 629D   03BA 000F
        SLL     R2,     2                       ; 629F   004E
        SLL     R2,     1                       ; 62A0   004A
        ADDI    #$0082, R2                      ; 62A1   02FA 0082
        MVO@    R2,     R1                      ; 62A3   024A
        INCR    R1                              ; 62A4   0009
        DECR    R3                              ; 62A5   0013
        BNEQ    L_6294                          ; 62A6   022C 0013
        PULR    R7                              ; 62A8   02B7

        CLRR    R0                              ; 62A9   01C0
L_62AA:
        SETC                                    ; 62AA   0007
        PULR    R7                              ; 62AB   02B7

        MVII    #$0001, R0                      ; 62AC   02B8 0001
        B       L_62AA                          ; 62AE   0220 0005

        CLRC                                    ; 62B0   0006
        PULR    R5                              ; 62B1   02B5
        PULR    R5                              ; 62B2   02B5
        PULR    R7                              ; 62B3   02B7

        SDBD                                    ; 62B4   0001
        MVII    #$2959, R4                      ; 62B5   02BC 0059 0029
        PSHR    R5                              ; 62B8   0275
        MVII    #$000F, R2                      ; 62B9   02BA 000F
        MVII    #$0001, R3                      ; 62BB   02BB 0001
L_62BD:
        PSHR    R2                              ; 62BD   0272
        ANDR    R1,     R2                      ; 62BE   018A
        ADDR    R3,     R2                      ; 62BF   00DA
        PULR    R5                              ; 62C0   02B5
        PSHR    R5                              ; 62C1   0275
        ANDR    R4,     R5                      ; 62C2   01A5
        PULR    R0                              ; 62C3   02B0
        COMR    R0                              ; 62C4   0018
        ANDR    R0,     R1                      ; 62C5   0181
        CMPR    R5,     R2                      ; 62C6   016A
        BGT     L_62CB                          ; 62C7   020E 0002

        CLRR    R3                              ; 62C9   01DB
        ADDR    R2,     R1                      ; 62CA   00D1
L_62CB:
        COMR    R0                              ; 62CB   0018
        MOVR    R0,     R2                      ; 62CC   0082
        SLL     R3,     2                       ; 62CD   004F
        SLLC    R3,     2                       ; 62CE   005F
        SLL     R2,     2                       ; 62CF   004E
        SLL     R2,     2                       ; 62D0   004E
        TSTR    R2                              ; 62D1   0092
        BNEQ    L_62BD                          ; 62D2   022C 0016
        PULR    R7                              ; 62D4   02B7

        PSHR    R5                              ; 62D5   0275
        MVII    #$0018, R4                      ; 62D6   02BC 0018
        CLRR    R0                              ; 62D8   01C0
L_62D9:
        MVO@    R0,     R4                      ; 62D9   0260
        CMPI    #$0020, R4                      ; 62DA   037C 0020
        BLT     L_62D9                          ; 62DC   0225 0004
        PULR    R7                              ; 62DE   02B7

        DECLE   $01C0,  $0240,  $0344,  $02B8   ; 62DF   01C0 0240 0344 02B8
        DECLE   $004E,  $0240,  $033F,  $0200   ; 62E3   004E 0240 033F 0200
        DECLE   $003B                           ; 62E7   003B

        MVII    #$0018, R1                      ; 62E8   02B9 0018
        MVI     G_0344, R2                      ; 62EA   0282 0344
        ADDR    R2,     R1                      ; 62EC   00D1
        MVI@    R1,     R0                      ; 62ED   0288
        CLRR    R5                              ; 62EE   01ED
        MVO@    R5,     R1                      ; 62EF   024D
        MVO     R0,     G_0346                  ; 62F0   0240 0346
        MVII    #$0001, R3                      ; 62F2   02BB 0001
        INCR    R2                              ; 62F4   000A
L_62F5:
        DECR    R2                              ; 62F5   0012
        BEQ     L_62FB                          ; 62F6   0204 0003

        SLL     R3,     1                       ; 62F8   004B
        B       L_62F5                          ; 62F9   0220 0005

L_62FB:
        XORI    #$00FF, R3                      ; 62FB   03FB 00FF
        DECLE   $0198,  $0158,  $0204,  $0005   ; 62FD   0198 0158 0204 0005
        DECLE   $0004,  $017C,  $0129,  $0002   ; 6301   0004 017C 0129 0002
        DECLE   $0079,  $0339,  $0010,  $0280   ; 6305   0079 0339 0010 0280
        DECLE   $0345,  $0008,  $0240,  $0345   ; 6309   0345 0008 0240 0345
        DECLE   $0338,  $0008,  $0080,  $020B   ; 630D   0338 0008 0080 020B
        DECLE   $0078,  $0204,  $005B,  $0010   ; 6311   0078 0204 005B 0010
        DECLE   $0204,  $0048,  $0280,  $0344   ; 6315   0204 0048 0280 0344
        DECLE   $0008,  $0240,  $0344,  $0378   ; 6319   0008 0240 0344 0378
        DECLE   $0008,  $020C,  $0003,  $0004   ; 631D   0008 020C 0003 0004
        DECLE   $0378,  $0102,  $0004,  $0170   ; 6321   0378 0102 0004 0170
        DECLE   $0234,  $0001,  $01E4,  $02B8   ; 6325   0234 0001 01E4 02B8
        DECLE   $0320,  $0260,  $0008,  $0378   ; 6329   0320 0260 0008 0378
        DECLE   $0328,  $0225,  $0005,  $02B8   ; 632D   0328 0225 0005 02B8
        DECLE   $0020,  $0260,  $037C,  $0010   ; 6331   0020 0260 037C 0010
        DECLE   $0225,  $0004,  $0001,  $02B8   ; 6335   0225 0004 0001 02B8
        DECLE   $0020,  $0008,  $0260,  $037C   ; 6339   0020 0008 0260 037C
        DECLE   $0018,  $0225,  $0004,  $01E4   ; 633D   0018 0225 0004 01E4
        DECLE   $02C4,  $0344,  $02B8,  $0320   ; 6341   02C4 0344 02B8 0320
        DECLE   $0260,  $02FC,  $0007,  $02B8   ; 6345   0260 02FC 0007 02B8
        DECLE   $0120,  $0260,  $02FC,  $0007   ; 6349   0120 0260 02FC 0007
        DECLE   $0001,  $02B8,  $000B,  $0008   ; 634D   0001 02B8 000B 0008
        DECLE   $0260,  $02FC,  $0007,  $01C0   ; 6351   0260 02FC 0007 01C0
        DECLE   $0260,  $01DB,  $0243,  $0345   ; 6355   0260 01DB 0243 0345
        DECLE   $0004,  $0170,  $0234,  $0001   ; 6359   0004 0170 0234 0001
        DECLE   $0220,  $0076,  $0282,  $0344   ; 635D   0220 0076 0282 0344
        DECLE   $03FA,  $0007,  $02FA,  $0008   ; 6361   03FA 0007 02FA 0008
        DECLE   $0290,  $0001,  $03B8,  $00F8   ; 6365   0290 0001 03B8 00F8
        DECLE   $000F,  $02F8,  $0007,  $0250   ; 6369   000F 02F8 0007 0250
        DECLE   $0220,  $0015                   ; 636D   0220 0015

        MVI     G_0344, R2                      ; 636F   0282 0344
        MVII    #$0020, R3                      ; 6371   02BB 0020
        MVII    #$0320, R0                      ; 6373   02B8 0320
        ADDR    R2,     R0                      ; 6375   00D0
        CLRR    R4                              ; 6376   01E4
        CMPR    R4,     R2                      ; 6377   0162
        BEQ     L_6387                          ; 6378   0204 000D

        MVO@    R0,     R4                      ; 637A   0260
        ADDI    #$0007, R4                      ; 637B   02FC 0007
        MVO@    R3,     R4                      ; 637D   0263
        INCR    R3                              ; 637E   000B
        SUBI    #$0008, R4                      ; 637F   033C 0008
L_6381:
        CMPI    #$0008, R4                      ; 6381   037C 0008
        DECLE   $022C,  $000D,  $0220,  $002D   ; 6383   022C 000D 0220 002D
L_6387:
        INCR    R4                              ; 6387   000C
        B       L_6381                          ; 6388   0220 0008

        MVII    #$0008, R4                      ; 638A   02BC 0008
        MVI     G_0344, R5                      ; 638C   0285 0344
        ADDI    #$0008, R5                      ; 638E   02FD 0008
        CMPR    R4,     R5                      ; 6390   0165
        BEQ     L_639D                          ; 6391   0204 000A

        MVI@    R4,     R0                      ; 6393   02A0
        INCR    R0                              ; 6394   0008
        DECR    R4                              ; 6395   0014
        MVO@    R0,     R4                      ; 6396   0260
L_6397:
        CMPI    #$0010, R4                      ; 6397   037C 0010
        DECLE   $0225,  $000A,  $0220,  $0043   ; 6399   0225 000A 0220 0043
L_639D:
        INCR    R4                              ; 639D   000C
        B       L_6397                          ; 639E   0220 0008

        DECLE   $0275,  $0004,  $0174,  $024A   ; 63A0   0275 0004 0174 024A
        DECLE   $0004,  $017C,  $01DC,  $0000   ; 63A4   0004 017C 01DC 0000
        DECLE   $0000,  $00BB,  $0074,  $02B8   ; 63A8   0000 00BB 0074 02B8
        DECLE   $0058,  $0240,  $033F,  $0004   ; 63AC   0058 0240 033F 0004
        DECLE   $0174,  $0105,  $0000,  $0004   ; 63B0   0174 0105 0000 0004
        DECLE   $0174,  $0143,  $003C,  $0004   ; 63B4   0174 0143 003C 0004
        DECLE   $0174,  $0153,  $0004,  $0174   ; 63B8   0174 0153 0004 0174
        DECLE   $0105,  $0001,  $0004,  $0174   ; 63BC   0105 0001 0004 0174
        DECLE   $0143,  $003C,  $0004,  $0174   ; 63C0   0143 003C 0004 0174
        DECLE   $0153,  $0004,  $0174,  $0105   ; 63C4   0153 0004 0174 0105
        DECLE   $0002,  $0004,  $0174,  $0143   ; 63C8   0002 0004 0174 0143
        DECLE   $003C,  $0004,  $0174,  $0153   ; 63CC   003C 0004 0174 0153
        DECLE   $0004,  $0174,  $00DE,  $0000   ; 63D0   0004 0174 00DE 0000
        DECLE   $0004,  $0174,  $0143,  $003C   ; 63D4   0004 0174 0143 003C
        DECLE   $0004,  $0174,  $0153,  $0004   ; 63D8   0004 0174 0153 0004
        DECLE   $0174,  $0163,  $0000,  $0004   ; 63DC   0174 0163 0000 0004
        DECLE   $0174,  $0143,  $0078,  $0004   ; 63E0   0174 0143 0078 0004
        DECLE   $0174,  $0163,  $0001,  $0004   ; 63E4   0174 0163 0001 0004
        DECLE   $0174,  $0143,  $0046,  $0004   ; 63E8   0174 0143 0046 0004
        DECLE   $0174,  $0163,  $0002,  $0004   ; 63EC   0174 0163 0002 0004
        DECLE   $0174,  $0143,  $0046,  $0220   ; 63F0   0174 0143 0046 0220
        DECLE   $0045,  $0004,  $0170,  $0071   ; 63F4   0045 0004 0170 0071
        DECLE   $02B8,  $005A,  $0240,  $033F   ; 63F8   02B8 005A 0240 033F
        DECLE   $0001,  $02BC,  $0045,  $0074   ; 63FC   0001 02BC 0045 0074
        DECLE   $02BD,  $026E,  $0001,  $02A0   ; 6400   02BD 026E 0001 02A0
        DECLE   $0268,  $0001,  $037C,  $0055   ; 6404   0268 0001 037C 0055
        DECLE   $0074,  $0225,  $0008,  $0004   ; 6408   0074 0225 0008 0004
        DECLE   $0170,  $0234,  $0001,  $0004   ; 640C   0170 0234 0001 0004

        CMPR    R6,     R0                      ; 6410   0170
        SUBR    R5,     R7                      ; 6411   012F

        DECLE   $0010,  $0003,  $0010,  $0020   ; 6412   0010 0003 0010 0020
        DECLE   $0001,  $0000,  $0008,  $0008   ; 6416   0001 0000 0008 0008
        DECLE   $0001,  $0004,  $0170,  $0234   ; 641A   0001 0004 0170 0234
        DECLE   $003C,  $0209,  $0008,  $0080   ; 641E   003C 0209 0008 0080
        DECLE   $0204,  $0032,  $0004,  $017C   ; 6422   0204 0032 0004 017C
        DECLE   $0129,  $0056,  $0074,  $02B8   ; 6426   0129 0056 0074 02B8
        DECLE   $0001,  $0240,  $0021,  $0004   ; 642A   0001 0240 0021 0004
        DECLE   $0170,  $0234,  $003C,  $0209   ; 642E   0170 0234 003C 0209
        DECLE   $0008,  $0080,  $0204,  $0020   ; 6432   0008 0080 0204 0020
        DECLE   $0004,  $017C,  $0129,  $0056   ; 6436   0004 017C 0129 0056
        DECLE   $0074,  $01C0,  $0280,  $0021   ; 643A   0074 01C0 0280 0021
        DECLE   $0220,  $0024,  $0004,  $017C   ; 643E   0220 0024 0004 017C
        DECLE   $0129,  $0056,  $0074,  $0069   ; 6442   0129 0056 0074 0069
        DECLE   $0031,  $0079,  $0031,  $0021   ; 6446   0031 0079 0031 0021
        DECLE   $0031,  $0029,  $0031,  $0000   ; 644A   0031 0029 0031 0000
        DECLE   $0000,  $00A1,  $0031,  $00B9   ; 644E   0000 00A1 0031 00B9
        DECLE   $0031,  $0079,  $0031,  $0000   ; 6452   0031 0079 0031 0000
        DECLE   $0004,  $0170,  $0071,  $02B8   ; 6456   0004 0170 0071 02B8
        DECLE   $0059,  $0240,  $033F,  $0004   ; 645A   0059 0240 033F 0004
        DECLE   $017C,  $01DF,  $003E,  $00BB   ; 645E   017C 01DF 003E 00BB
        DECLE   $0074,  $0004,  $0170,  $0234   ; 6462   0074 0004 0170 0234
        DECLE   $0001,  $0004                   ; 6466   0001 0004

        CMPR    R6,     R0                      ; 6468   0170
        SUBR    R5,     R7                      ; 6469   012F

        DECLE   $0030,  $0003,  $0008,  $0038   ; 646A   0030 0003 0008 0038
        DECLE   $0001,  $0000,  $0000,  $0000   ; 646E   0001 0000 0000 0000
        DECLE   $0000                           ; 6472   0000

        MVII    #$0010, R4                      ; 6473   02BC 0010
        MVII    #$0132, R0                      ; 6475   02B8 0132
        MVO@    R0,     R4                      ; 6477   0260
        MVII    #$01E2, R0                      ; 6478   02B8 01E2
        MVO@    R0,     R4                      ; 647A   0260
        MVII    #$0112, R0                      ; 647B   02B8 0112
        MVO@    R0,     R4                      ; 647D   0260
        INCR    R4                              ; 647E   000C
        MVII    #$01B5, R0                      ; 647F   02B8 01B5
        MVO@    R0,     R4                      ; 6481   0260
        MVII    #$014D, R0                      ; 6482   02B8 014D
        MVO@    R0,     R4                      ; 6484   0260
        MVII    #$019D, R0                      ; 6485   02B8 019D
        MVO@    R0,     R4                      ; 6487   0260
        MVII    #$027D, R4                      ; 6488   02BC 027D
        SDBD                                    ; 648A   0001
        MVII    #$0808, R0                      ; 648B   02B8 0008 0008
        MVO@    R0,     R4                      ; 648E   0260
        MVO@    R0,     R4                      ; 648F   0260
        MVO@    R0,     R4                      ; 6490   0260
        CLRR    R0                              ; 6491   01C0
L_6492:
        MVO     R0,     G_0348                  ; 6492   0240 0348
        DECLE   $0001,  $02B8,  $0000,  $0020   ; 6494   0001 02B8 0000 0020
        DECLE   $0004,  $0170,  $0140,  $0010   ; 6498   0004 0170 0140 0010
        DECLE   $0003,  $02B8,  $0200,  $0004   ; 649C   0003 02B8 0200 0004
        DECLE   $0170,  $0140,  $0004,  $0003   ; 64A0   0170 0140 0004 0003
        DECLE   $0004,  $0170,  $0234,  $003C   ; 64A4   0004 0170 0234 003C
        DECLE   $0209,  $0009,  $0080,  $0204   ; 64A8   0209 0009 0080 0204
        DECLE   $0005,  $0004                   ; 64AC   0005 0004

        CMPR    R7,     R4                      ; 64AE   017C
        SUBR    R5,     R1                      ; 64AF   0129
        MOVR    R6,     R2                      ; 64B0   00B2
        RRC     R0,     2                       ; 64B1   0074
        PULR    R7                              ; 64B2   02B7

        MVI     G_0348, R0                      ; 64B3   0280 0348
        XORI    #$0001, R0                      ; 64B5   03F8 0001
        MVO     R0,     G_0348                  ; 64B7   0240 0348
        B       L_6492                          ; 64B9   0220 0028

        DECLE   $0043,  $004C,  $0045,  $0041   ; 64BB   0043 004C 0045 0041
        DECLE   $0052,  $003D,  $004F,  $004B   ; 64BF   0052 003D 004F 004B
        DECLE   $002C,  $0045,  $004E,  $0054   ; 64C3   002C 0045 004E 0054
        DECLE   $0045,  $0052,  $003D,  $0042   ; 64C7   0045 0052 003D 0042
        DECLE   $0041,  $0044,  $0000           ; 64CB   0041 0044 0000

        MVI     .PSG0.rgt_hand,R2               ; 64CE   0282 01FE
        CMPI    #$0077, R2                      ; 64D0   037A 0077
        BEQ     L_64DC                          ; 64D2   0204 0008

        MVI     .PSG0.lft_hand,R2               ; 64D4   0282 01FF
        CMPI    #$0077, R2                      ; 64D6   037A 0077
        BEQ     L_64DC                          ; 64D8   0204 0002

        CLRC                                    ; 64DA   0006
        MOVR    R5,     R7                      ; 64DB   00AF

L_64DC:
        SETC                                    ; 64DC   0007
        MOVR    R5,     R7                      ; 64DD   00AF

        MVI@    R5,     R1                      ; 64DE   02A9
        SDBD                                    ; 64DF   0001
        ADDI    #$75B5, R1                      ; 64E0   02F9 00B5 0075
        MVI@    R1,     R0                      ; 64E3   0288
        SDBD                                    ; 64E4   0001
        SUBI    #$75B5, R1                      ; 64E5   0339 00B5 0075
        MVII    #$01F8, R2                      ; 64E8   02BA 01F8
        MVO@    R0,     R2                      ; 64EA   0250
        ADDI    #$01FB, R1                      ; 64EB   02F9 01FB
        MVII    #$000F, R0                      ; 64ED   02B8 000F
        MVO@    R0,     R1                      ; 64EF   0248
        CLRR    R0                              ; 64F0   01C0
L_64F1:
        INCR    R0                              ; 64F1   0008
        CMPI    #$0020, R0                      ; 64F2   0378 0020
        BEQ     L_6502                          ; 64F4   0204 000C

        MVII    #$01F9, R2                      ; 64F6   02BA 01F9
        MVO@    R0,     R2                      ; 64F8   0250
        SDBD                                    ; 64F9   0001
        MVII    #$0800, R3                      ; 64FA   02BB 0000 0008
L_64FD:
        DECR    R3                              ; 64FD   0013
        BNEQ    L_64FD                          ; 64FE   022C 0002
        B       L_64F1                          ; 6500   0220 0010

L_6502:
        CLRR    R0                              ; 6502   01C0
        MVO@    R0,     R1                      ; 6503   0248
        MOVR    R5,     R7                      ; 6504   00AF

        MVI@    R5,     R1                      ; 6505   02A9
        MOVR    R1,     R3                      ; 6506   008B
        SDBD                                    ; 6507   0001
        ADDI    #$75B8, R1                      ; 6508   02F9 00B8 0075
        MVI@    R1,     R0                      ; 650B   0288
        MVII    #$01F8, R2                      ; 650C   02BA 01F8
        MVO@    R0,     R2                      ; 650E   0250
        SDBD                                    ; 650F   0001
        SUBI    #$75B8, R1                      ; 6510   0339 00B8 0075
        ADDI    #$01FB, R1                      ; 6513   02F9 01FB
        MOVR    R1,     R4                      ; 6515   008C
        MVII    #$000F, R2                      ; 6516   02BA 000F
        MVO@    R2,     R1                      ; 6518   024A
        ADDI    #$01F0, R3                      ; 6519   02FB 01F0
        CLRR    R2                              ; 651B   01D2
        SETC                                    ; 651C   0007
L_651D:
        RLC     R2,     1                       ; 651D   0052
        MVO@    R2,     R3                      ; 651E   025A
        CMPI    #$0080, R2                      ; 651F   037A 0080
        BEQ     L_652C                          ; 6521   0204 0009

        SDBD                                    ; 6523   0001
        MVII    #$2000, R1                      ; 6524   02B9 0000 0020
L_6527:
        DECR    R1                              ; 6527   0011
        BNEQ    L_6527                          ; 6528   022C 0002
        B       L_651D                          ; 652A   0220 000E

L_652C:
        CLRR    R2                              ; 652C   01D2
        MVO@    R2,     R3                      ; 652D   025A
        ADDI    #$0004, R3                      ; 652E   02FB 0004
        SETC                                    ; 6530   0007
L_6531:
        RLC     R2,     1                       ; 6531   0052
        MVO@    R2,     R3                      ; 6532   025A
        CMPI    #$0010, R2                      ; 6533   037A 0010
        BEQ     L_6540                          ; 6535   0204 0009

        SDBD                                    ; 6537   0001
        MVII    #$2000, R1                      ; 6538   02B9 0000 0020
L_653B:
        DECR    R1                              ; 653B   0011
        BNEQ    L_653B                          ; 653C   022C 0002
        B       L_6531                          ; 653E   0220 000E

L_6540:
        CLRR    R0                              ; 6540   01C0
        MVO@    R0,     R4                      ; 6541   0260
        MOVR    R5,     R7                      ; 6542   00AF

        DECLE   $02A8,  $0275,  $0004,  $0170   ; 6543   02A8 0275 0004 0170
        DECLE   $0235                           ; 6547   0235

        BC      L_654B                          ; 6548   0201 0001
        PULR    R7                              ; 654A   02B7

L_654B:
        TSTR    R0                              ; 654B   0080
        DECLE   $0204,  $0013,  $0004           ; 654C   0204 0013 0004

        CMPR    R7,     R4                      ; 654F   017C
        SUBR    R5,     R1                      ; 6550   0129
        SLR     R1,     1                       ; 6551   0061
        RRC     R1,     2                       ; 6552   0075
        PSHR    R5                              ; 6553   0275
        CLRR    R5                              ; 6554   01ED
        MVII    #$01F0, R4                      ; 6555   02BC 01F0
L_6557:
        MVO@    R5,     R4                      ; 6557   0265
        CMPI    #$01FF, R4                      ; 6558   037C 01FF
        BNEQ    L_6557                          ; 655A   022C 0004

        COMR    R5                              ; 655C   001D
        MVII    #$01F8, R4                      ; 655D   02BC 01F8
        MVO@    R5,     R4                      ; 655F   0265
        PULR    R7                              ; 6560   02B7

        PULR    R5                              ; 6561   02B5
        PULR    R7                              ; 6562   02B7

        MVI@    R5,     R1                      ; 6563   02A9
        MOVR    R1,     R4                      ; 6564   008C
        SDBD                                    ; 6565   0001
        ADDI    #$75B8, R4                      ; 6566   02FC 00B8 0075
        TSTR    R1                              ; 6569   0089
        BEQ     L_657F                          ; 656A   0204 0013

        SUBI    #$0003, R4                      ; 656C   033C 0003
        MVI@    R4,     R2                      ; 656E   02A2
        MVII    #$01F8, R4                      ; 656F   02BC 01F8
        MVO@    R2,     R4                      ; 6571   0262
        PSHR    R5                              ; 6572   0275
        MVII    #$0010, R0                      ; 6573   02B8 0010
        MVII    #$01F9, R4                      ; 6575   02BC 01F9
        MVO@    R0,     R4                      ; 6577   0260
        INCR    R4                              ; 6578   000C
        ADDR    R1,     R4                      ; 6579   00CC
        MVII    #$00FF, R0                      ; 657A   02B8 00FF
        MVO@    R0,     R4                      ; 657C   0260
        B       L_658D                          ; 657D   0200 000E

L_657F:
        MVI@    R4,     R2                      ; 657F   02A2
        MVII    #$01F8, R4                      ; 6580   02BC 01F8
        MVO@    R2,     R4                      ; 6582   0262
        PSHR    R5                              ; 6583   0275
        MOVR    R1,     R3                      ; 6584   008B
        MVII    #$00FF, R0                      ; 6585   02B8 00FF
        ADDI    #$01F0, R3                      ; 6587   02FB 01F0
        MVO@    R0,     R3                      ; 6589   0258
        ADDI    #$000B, R3                      ; 658A   02FB 000B
        MVO@    R0,     R3                      ; 658C   0258
L_658D:
        SLL     R1,     1                       ; 658D   0049
        SDBD                                    ; 658E   0001
        ADDI    #$75AF, R1                      ; 658F   02F9 00AF 0075
        MOVR    R1,     R5                      ; 6592   008D
        SDBD                                    ; 6593   0001
        MVI@    R5,     R1                      ; 6594   02A9
        MOVR    R1,     R7                      ; 6595   008F

        MVII    #$01F3, R2                      ; 6596   02BA 01F3
        MVII    #$0010, R0                      ; 6598   02B8 0010
        MVO@    R0,     R2                      ; 659A   0250
        B       L_65AA                          ; 659B   0200 000D

        MVII    #$01F7, R2                      ; 659D   02BA 01F7
        MVII    #$0010, R0                      ; 659F   02B8 0010
        MVO@    R0,     R2                      ; 65A1   0250
        B       L_65AA                          ; 65A2   0200 0006

        MVII    #$01F3, R2                      ; 65A4   02BA 01F3
        MVO@    R0,     R2                      ; 65A6   0250
        MVII    #$01F7, R2                      ; 65A7   02BA 01F7
        MVO@    R0,     R2                      ; 65A9   0250
L_65AA:
        MVII    #$01FA, R2                      ; 65AA   02BA 01FA
        CLRR    R3                              ; 65AC   01DB
        MVO@    R3,     R2                      ; 65AD   0253
        PULR    R7                              ; 65AE   02B7

        DECLE   $00A4,  $0075,  $009D,  $0075   ; 65AF   00A4 0075 009D 0075
        DECLE   $0096,  $0075,  $0037,  $002F   ; 65B3   0096 0075 0037 002F
        DECLE   $001F,  $003E,  $003D,  $003B   ; 65B7   001F 003E 003D 003B
        DECLE   $0275,  $0001,  $02BC,  $0000   ; 65BB   0275 0001 02BC 0000
        DECLE   $0030,  $02B8,  $0041,  $0240   ; 65BF   0030 02B8 0041 0240
        DECLE   $033F,  $01C0,  $00A3,  $02FB   ; 65C3   033F 01C0 00A3 02FB
        DECLE   $0040,  $01D2,  $0242,  $033D   ; 65C7   0040 01D2 0242 033D
        DECLE   $0282,  $033D,  $0092,  $0224   ; 65CB   0282 033D 0092 0224
        DECLE   $0004,  $02E0,  $015C,  $022C   ; 65CF   0004 02E0 015C 022C
        DECLE   $0003,  $0001,  $037C,  $0000   ; 65D3   0003 0001 037C 0000
        DECLE   $0038,  $0225,  $0014,  $0001   ; 65D7   0038 0225 0014 0001
        DECLE   $0378,  $009B,  $00B8,  $0204   ; 65DB   0378 009B 00B8 0204
        DECLE   $0005,  $0004                   ; 65DF   0005 0004

        CMPR    R7,     R4                      ; 65E1   017C
        SUBR    R5,     R1                      ; 65E2   0129
        ADDR    R4,     R5                      ; 65E3   00E5
        RRC     R1,     2                       ; 65E4   0075
        PULR    R7                              ; 65E5   02B7

        PSHR    R5                              ; 65E6   0275
        MVII    #$004C, R0                      ; 65E7   02B8 004C
        MVO     R0,     G_033F                  ; 65E9   0240 033F
        SDBD                                    ; 65EB   0001
        MVII    #$2FFC, R3                      ; 65EC   02BB 00FC 002F
        MVII    #$00A8, R0                      ; 65EF   02B8 00A8
        CMPI    #$0028, R3                      ; 65F1   037B 0028
        BNEQ    L_65F7                          ; 65F3   020C 0002

        MVII    #$00CA, R0                      ; 65F5   02B8 00CA
L_65F7:
        SDBD                                    ; 65F7   0001
        DECLE   $02BD,  $00EB,  $0010,  $0368   ; 65F8   02BD 00EB 0010 0368
        DECLE   $020C,  $0047,  $0001,  $02BC   ; 65FC   020C 0047 0001 02BC
        DECLE   $0000,  $0010,  $02B8,  $0042   ; 6600   0000 0010 02B8 0042
        DECLE   $0240,  $033F,  $01C0,  $02E0   ; 6604   0240 033F 01C0 02E0
        DECLE   $0001,  $037C,  $0000,  $0018   ; 6608   0001 037C 0000 0018
        DECLE   $0225,  $0006,  $02AB,  $0001   ; 660C   0225 0006 02AB 0001
        DECLE   $0378,  $00A0,  $00DB,  $020C   ; 6610   0378 00A0 00DB 020C
        DECLE   $0030                           ; 6614   0030

        PULR    R7                              ; 6615   02B7

        PSHR    R5                              ; 6616   0275
        MVII    #$004D, R0                      ; 6617   02B8 004D
        MVO     R0,     G_033F                  ; 6619   0240 033F
        SDBD                                    ; 661B   0001
        MVII    #$2FFC, R5                      ; 661C   02BD 00FC 002F
        MVI@    R5,     R3                      ; 661F   02AB
        CLRR    R0                              ; 6620   01C0
        CMPI    #$0028, R3                      ; 6621   037B 0028
        BNEQ    L_6627                          ; 6623   020C 0002

        MVII    #$0028, R0                      ; 6625   02B8 0028
L_6627:
        SDBD                                    ; 6627   0001
        DECLE   $02BD,  $00FC,  $001F,  $0368   ; 6628   02BD 00FC 001F 0368
        DECLE   $020C,  $0017,  $0001,  $02BC   ; 662C   020C 0017 0001 02BC
        DECLE   $0000,  $0018,  $02B8,  $0043   ; 6630   0000 0018 02B8 0043
        DECLE   $0240,  $033F,  $01C0,  $02E0   ; 6634   0240 033F 01C0 02E0
        DECLE   $0001,  $037C,  $0000,  $0020   ; 6638   0001 037C 0000 0020
        DECLE   $0225,  $0006,  $0001,  $0378   ; 663C   0225 0006 0001 0378
        DECLE   $0037,  $00A5,  $020C,  $0001   ; 6640   0037 00A5 020C 0001
        DECLE   $02B7,  $0004,  $017C,  $0129   ; 6644   02B7 0004 017C 0129
        DECLE   $0044,  $0076,  $0275,  $0004   ; 6648   0044 0076 0275 0004
        DECLE   $017C,  $0199,  $0004,  $0170   ; 664C   017C 0199 0004 0170
        DECLE   $0071,  $0004,  $0170,  $0234   ; 6650   0071 0004 0170 0234
        DECLE   $0001,  $0004                   ; 6654   0001 0004

        CMPR    R6,     R0                      ; 6656   0170
        RLC     R1,     1                       ; 6657   0051
        PULR    R7                              ; 6658   02B7

        DECLE   $0275,  $0004,  $0174,  $02B5   ; 6659   0275 0004 0174 02B5
        DECLE   $0044,  $006A,  $0077,  $0004   ; 665D   0044 006A 0077 0004

        CMPR    R6,     R4                      ; 6661   0174
        PULR    R5                              ; 6662   02B5
        SWAP    R0,     2                       ; 6663   0044
        MOVR    R2,     R0                      ; 6664   0090
        RRC     R3,     2                       ; 6665   0077
        PULR    R7                              ; 6666   02B7

        DECLE   $0275,  $0004                   ; 6667   0275 0004

        CMPR    R6,     R4                      ; 6669   0174
        MVI@    R2,     R6                      ; 666A   0296
        SWAP    R3,     2                       ; 666B   0047
        ADDR    R0,     R2                      ; 666C   00C2
        RRC     R3,     2                       ; 666D   0077
        PULR    R7                              ; 666E   02B7

        DECLE   $0275,  $0004                   ; 666F   0275 0004

        CMPR    R6,     R4                      ; 6671   0174
        PULR    R5                              ; 6672   02B5
        SWAP    R1,     2                       ; 6673   0045
        ADDR    R2,     R2                      ; 6674   00D2
        RRC     R3,     2                       ; 6675   0077
        PULR    R7                              ; 6676   02B7

        DECLE   $0275,  $0004                   ; 6677   0275 0004

        CMPR    R6,     R4                      ; 6679   0174
        PULR    R5                              ; 667A   02B5
        SWAP    R2,     2                       ; 667B   0046
        ADDR    R6,     R6                      ; 667C   00F6
        RRC     R3,     2                       ; 667D   0077
        PULR    R7                              ; 667E   02B7

        DECLE   $0275,  $0004                   ; 667F   0275 0004

        CMPR    R6,     R4                      ; 6681   0174
        MVI@    R2,     R6                      ; 6682   0296
        SLL     R0,     1                       ; 6683   0048
        ADDR    R1,     R2                      ; 6684   00CA
        RRC     R3,     2                       ; 6685   0077
        PULR    R7                              ; 6686   02B7

        DECLE   $0275,  $0004                   ; 6687   0275 0004

        CMPR    R6,     R4                      ; 6689   0174
        MVI@    R2,     R6                      ; 668A   0296
        SLL     R2,     1                       ; 668B   004A
        COMR    R2                              ; 668C   001A
        SARC    R0,     1                       ; 668D   0078
        CLRR    R0                              ; 668E   01C0
        MVO     R0,     .PSG0.chn_a_vol         ; 668F   0240 01FB
        MVO     R0,     .PSG0.chn_b_vol         ; 6691   0240 01FC
        MVO     R0,     .PSG0.chn_c_vol         ; 6693   0240 01FD
        PULR    R7                              ; 6695   02B7

        DECLE   $02A8,  $0240,  $033F,  $0001   ; 6696   02A8 0240 033F 0001
        DECLE   $02AC,  $0275,  $0001,  $02B9   ; 669A   02AC 0275 0001 02B9
        DECLE   $0040,  $0078,  $0241,  $0342   ; 669E   0040 0078 0241 0342
        DECLE   $0004,  $0174,  $02EA,  $0004   ; 66A2   0004 0174 02EA 0004
        DECLE   $0174,  $0300,  $0201,  $000A   ; 66A6   0174 0300 0201 000A
        DECLE   $022C,  $0009,  $0004,  $0174   ; 66AA   022C 0009 0004 0174
        DECLE   $0330,  $0004                   ; 66AE   0330 0004

        CMPR    R6,     R4                      ; 66B0   0174
        CMP     .BTAB.2C,R4                     ; 66B1   0344 022C
L_66B3:
        DECR    R7                              ; 66B3   0017
        PULR    R7                              ; 66B4   02B7

        MVI@    R5,     R0                      ; 66B5   02A8
        MVO     R0,     G_033F                  ; 66B6   0240 033F
        SDBD                                    ; 66B8   0001
        MVI@    R5,     R4                      ; 66B9   02AC
        PSHR    R5                              ; 66BA   0275
L_66BB:
        SDBD                                    ; 66BB   0001
        DECLE   $02B9,  $0040,  $0078,  $0241   ; 66BC   02B9 0040 0078 0241
        DECLE   $0342,  $0004,  $0174,  $02E2   ; 66C0   0342 0004 0174 02E2
        DECLE   $0004,  $0174,  $02EA,  $0004   ; 66C4   0004 0174 02EA 0004
        DECLE   $0174,  $02E2,  $0004,  $0174   ; 66C8   0174 02E2 0004 0174
        DECLE   $0300,  $0201,  $0012,  $022C   ; 66CC   0300 0201 0012 022C
        DECLE   $000F,  $0004,  $0174,  $02E2   ; 66D0   000F 0004 0174 02E2
        DECLE   $0004,  $0174,  $0330,  $0004   ; 66D4   0004 0174 0330 0004
        DECLE   $0174,  $02E2,  $0004           ; 66D8   0174 02E2 0004

        CMPR    R6,     R4                      ; 66DB   0174
        CMP     .BTAB.01,R4                     ; 66DC   0344 0201
        EIS                                     ; 66DE   0002
        BNEQ    L_66BB                          ; 66DF   022C 0025
        PULR    R7                              ; 66E1   02B7

        DECLE   $0275,  $0274,  $0004,  $0170   ; 66E2   0275 0274 0004 0170
        DECLE   $0234,  $0001                   ; 66E6   0234 0001

        PULR    R4                              ; 66E8   02B4
        PULR    R7                              ; 66E9   02B7

        PSHR    R5                              ; 66EA   0275
        PSHR    R4                              ; 66EB   0274
        MVI     G_0342, R5                      ; 66EC   0285 0342
        SDBD                                    ; 66EE   0001
        MVI@    R5,     R0                      ; 66EF   02A8
        MVI@    R4,     R1                      ; 66F0   02A1
L_66F1:
        SDBD                                    ; 66F1   0001
        MVI@    R4,     R5                      ; 66F2   02A5
        SDBD                                    ; 66F3   0001
        MVI@    R4,     R3                      ; 66F4   02A3
        INCR    R4                              ; 66F5   000C
        INCR    R4                              ; 66F6   000C
L_66F7:
        MVO@    R0,     R5                      ; 66F7   0268
        DECR    R3                              ; 66F8   0013
        BNEQ    L_66F7                          ; 66F9   022C 0003

        DECR    R1                              ; 66FB   0011
        BNEQ    L_66F1                          ; 66FC   022C 000C

        PULR    R4                              ; 66FE   02B4
        PULR    R7                              ; 66FF   02B7

        PSHR    R5                              ; 6700   0275
        PSHR    R4                              ; 6701   0274
        MVI@    R4,     R1                      ; 6702   02A1
L_6703:
        PSHR    R1                              ; 6703   0271
        MVI     G_0342, R5                      ; 6704   0285 0342
        SDBD                                    ; 6706   0001
        MVI@    R5,     R0                      ; 6707   02A8
        SDBD                                    ; 6708   0001
        MVI@    R4,     R5                      ; 6709   02A5
        SDBD                                    ; 670A   0001
        MVI@    R4,     R3                      ; 670B   02A3
        SDBD                                    ; 670C   0001
        MVI@    R4,     R2                      ; 670D   02A2
        ANDR    R2,     R0                      ; 670E   0190
L_670F:
        MVI@    R5,     R1                      ; 670F   02A9
        ANDR    R2,     R1                      ; 6710   0191
        CMPR    R0,     R1                      ; 6711   0141
        BNEQ    L_6725                          ; 6712   020C 0011

        DECR    R3                              ; 6714   0013
        BNEQ    L_670F                          ; 6715   022C 0007

        PULR    R1                              ; 6717   02B1
        DECR    R1                              ; 6718   0011
        BNEQ    L_6703                          ; 6719   022C 0017

        MVI     G_0342, R4                      ; 671B   0284 0342
        SDBD                                    ; 671D   0001
        MVI@    R4,     R0                      ; 671E   02A0
        MVO     R4,     G_0342                  ; 671F   0244 0342
        TSTR    R0                              ; 6721   0080
        CLRC                                    ; 6722   0006
        PULR    R4                              ; 6723   02B4
        PULR    R7                              ; 6724   02B7

L_6725:
        PULR    R1                              ; 6725   02B1
        DECLE   $0004                           ; 6726   0004

        CMPR    R7,     R4                      ; 6727   017C
        SUBR    R5,     R1                      ; 6728   0129
        ADCR    R3                              ; 6729   002B
        RRC     R3,     2                       ; 672A   0077
        SETC                                    ; 672B   0007
        CLRR    R0                              ; 672C   01C0
        TSTR    R0                              ; 672D   0080
        PULR    R4                              ; 672E   02B4
        PULR    R7                              ; 672F   02B7

        PSHR    R5                              ; 6730   0275
        PSHR    R4                              ; 6731   0274
        MVI@    R4,     R1                      ; 6732   02A1
L_6733:
        SDBD                                    ; 6733   0001
        MVI@    R4,     R5                      ; 6734   02A5
        SDBD                                    ; 6735   0001
        MVI@    R4,     R3                      ; 6736   02A3
        INCR    R4                              ; 6737   000C
        INCR    R4                              ; 6738   000C
L_6739:
        MOVR    R5,     R0                      ; 6739   00A8
        COMR    R0                              ; 673A   0018
        MVO@    R0,     R5                      ; 673B   0268
        DECR    R3                              ; 673C   0013
        BNEQ    L_6739                          ; 673D   022C 0005

        DECR    R1                              ; 673F   0011
        BNEQ    L_6733                          ; 6740   022C 000E

        PULR    R4                              ; 6742   02B4
        PULR    R7                              ; 6743   02B7

        PSHR    R5                              ; 6744   0275
        MVI@    R4,     R1                      ; 6745   02A1
L_6746:
        PSHR    R1                              ; 6746   0271
        SDBD                                    ; 6747   0001
        MVI@    R4,     R5                      ; 6748   02A5
        SDBD                                    ; 6749   0001
        MVI@    R4,     R3                      ; 674A   02A3
        SDBD                                    ; 674B   0001
        MVI@    R4,     R2                      ; 674C   02A2
L_674D:
        MOVR    R5,     R1                      ; 674D   00A9
        MVI@    R5,     R0                      ; 674E   02A8
        COMR    R0                              ; 674F   0018
        ANDR    R2,     R0                      ; 6750   0190
        ANDR    R2,     R1                      ; 6751   0191
        CMPR    R1,     R0                      ; 6752   0148
        BNEQ    L_6761                          ; 6753   020C 000C

        DECR    R3                              ; 6755   0013
        BNEQ    L_674D                          ; 6756   022C 000A

        PULR    R1                              ; 6758   02B1
        DECR    R1                              ; 6759   0011
        BNEQ    L_6746                          ; 675A   022C 0015

        MOVR    R4,     R3                      ; 675C   00A3
        MVI@    R3,     R0                      ; 675D   0298
        TSTR    R0                              ; 675E   0080
        CLRC                                    ; 675F   0006
        PULR    R7                              ; 6760   02B7

L_6761:
        PULR    R1                              ; 6761   02B1
        DECLE   $0004                           ; 6762   0004

        CMPR    R7,     R4                      ; 6763   017C
        SUBR    R5,     R1                      ; 6764   0129
        SLR     R3,     2                       ; 6765   0067
        RRC     R3,     2                       ; 6766   0077
        PULR    R4                              ; 6767   02B4
        SETC                                    ; 6768   0007
        PULR    R7                              ; 6769   02B7

        DECLE   $0006,  $0000,  $0000,  $0008   ; 676A   0006 0000 0000 0008
        DECLE   $0000,  $00FF,  $0007,  $0008   ; 676E   0000 00FF 0007 0008
        DECLE   $0000,  $0008,  $0000,  $00FF   ; 6772   0000 0008 0000 00FF
        DECLE   $000F,  $0010,  $0000,  $0008   ; 6776   000F 0010 0000 0008
        DECLE   $0000,  $00FF,  $003F,  $0028   ; 677A   0000 00FF 003F 0028
        DECLE   $0000,  $0005,  $0000,  $000F   ; 677E   0000 0005 0000 000F
        DECLE   $0000,  $0030,  $0000,  $0002   ; 6782   0000 0030 0000 0002
        DECLE   $0000,  $0007,  $0000,  $0032   ; 6786   0000 0007 0000 0032
        DECLE   $0000,  $0001,  $0000,  $0003   ; 678A   0000 0001 0000 0003
        DECLE   $0000,  $0000,  $0008,  $0018   ; 678E   0000 0000 0008 0018
        DECLE   $0000,  $0001,  $0000,  $00FE   ; 6792   0000 0001 0000 00FE
        DECLE   $0003,  $0019,  $0000,  $0001   ; 6796   0003 0019 0000 0001
        DECLE   $0000,  $00FD,  $0003,  $001A   ; 679A   0000 00FD 0003 001A
        DECLE   $0000,  $0001,  $0000,  $00FB   ; 679E   0000 0001 0000 00FB
        DECLE   $0003,  $001B,  $0000,  $0001   ; 67A2   0003 001B 0000 0001
        DECLE   $0000,  $00F7,  $0003,  $001C   ; 67A6   0000 00F7 0003 001C
        DECLE   $0000,  $0001,  $0000,  $00EF   ; 67AA   0000 0001 0000 00EF
        DECLE   $0003,  $001D,  $0000,  $0001   ; 67AE   0003 001D 0000 0001
        DECLE   $0000,  $00DF,  $0003,  $001E   ; 67B2   0000 00DF 0003 001E
        DECLE   $0000,  $0001,  $0000,  $00BF   ; 67B6   0000 0001 0000 00BF
        DECLE   $0003,  $001F,  $0000,  $0001   ; 67BA   0003 001F 0000 0001
        DECLE   $0000,  $007F,  $0003,  $0000   ; 67BE   0000 007F 0003 0000
        DECLE   $0001,  $0000,  $0002,  $003D   ; 67C2   0001 0000 0002 003D
        DECLE   $0001,  $00FF,  $00FF,  $0000   ; 67C6   0001 00FF 00FF 0000
        DECLE   $0001,  $0002,  $0001,  $00EE   ; 67CA   0001 0002 0001 00EE
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 67CE   0000 00FF 0000 0000
        DECLE   $0001,  $0000,  $0038,  $0033   ; 67D2   0001 0000 0038 0033
        DECLE   $0000,  $00FF,  $0000,  $0001   ; 67D6   0000 00FF 0000 0001
        DECLE   $0033,  $0038,  $0033,  $0000   ; 67DA   0033 0038 0033 0000
        DECLE   $00FF,  $0000,  $0001,  $0066   ; 67DE   00FF 0000 0001 0066
        DECLE   $0038,  $0033,  $0000,  $00FF   ; 67E2   0038 0033 0000 00FF
        DECLE   $0000,  $0001,  $0099,  $0038   ; 67E6   0000 0001 0099 0038
        DECLE   $0033,  $0000,  $00FF,  $0000   ; 67EA   0033 0000 00FF 0000
        DECLE   $0001,  $00CC,  $0038,  $0034   ; 67EE   0001 00CC 0038 0034
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 67F2   0000 00FF 0000 0000
        DECLE   $0001,  $0000,  $0039,  $0033   ; 67F6   0001 0000 0039 0033
        DECLE   $0000,  $00FF,  $0000,  $0001   ; 67FA   0000 00FF 0000 0001
        DECLE   $0033,  $0039,  $0033,  $0000   ; 67FE   0033 0039 0033 0000
        DECLE   $00FF,  $0000,  $0001,  $0066   ; 6802   00FF 0000 0001 0066
        DECLE   $0039,  $0033,  $0000,  $00FF   ; 6806   0039 0033 0000 00FF
        DECLE   $0000,  $0001,  $0099,  $0039   ; 680A   0000 0001 0099 0039
        DECLE   $0033,  $0000,  $00FF,  $0000   ; 680E   0033 0000 00FF 0000
        DECLE   $0001,  $00CC,  $0039,  $0034   ; 6812   0001 00CC 0039 0034
        DECLE   $0000,  $00FF,  $0000,  $0000   ; 6816   0000 00FF 0000 0000
        DECLE   $0006,  $00F0,  $0001,  $0004   ; 681A   0006 00F0 0001 0004
        DECLE   $0000,  $00FF,  $0000,  $00F4   ; 681E   0000 00FF 0000 00F4
        DECLE   $0001,  $0003,  $0000,  $000F   ; 6822   0001 0003 0000 000F
        DECLE   $0000,  $00F7,  $0001,  $0002   ; 6826   0000 00F7 0001 0002
        DECLE   $0000,  $00FF,  $0000,  $00F9   ; 682A   0000 00FF 0000 00F9
        DECLE   $0001,  $0001,  $0000,  $001F   ; 682E   0001 0001 0000 001F
        DECLE   $0000,  $00FA,  $0001,  $0001   ; 6832   0000 00FA 0001 0001
        DECLE   $0000,  $000F,  $0000,  $00FB   ; 6836   0000 000F 0000 00FB
        DECLE   $0001,  $0003,  $0000,  $001F   ; 683A   0001 0003 0000 001F
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 683E   0000 0000 00FF 00FF
        DECLE   $00AA,  $00AA,  $0055,  $0055   ; 6842   00AA 00AA 0055 0055
        DECLE   $0000,  $0000,  $0275,  $0004   ; 6846   0000 0000 0275 0004

        CMPR    R6,     R0                      ; 684A   0170
        RRC     R1,     1                       ; 684B   0071
        SDBD                                    ; 684C   0001
        MVII    #$7867, R4                      ; 684D   02BC 0067 0078
        MVII    #$0057, R0                      ; 6850   02B8 0057
        MVO     R0,     G_033F                  ; 6852   0240 033F
        MVII    #$0200, R5                      ; 6854   02BD 0200
L_6856:
        CLRR    R1                              ; 6856   01C9
        DECLE   $0001,  $02A0,  $0001,  $037C   ; 6857   0001 02A0 0001 037C
        DECLE   $0077,  $0078,  $0204,  $0018   ; 685B   0077 0078 0204 0018
L_685F:
        MVO@    R0,     R5                      ; 685F   0268
        INCR    R1                              ; 6860   0009
        CMPI    #$000A, R1                      ; 6861   0379 000A
        BLT     L_685F                          ; 6863   0225 0005
        B       L_6856                          ; 6865   0220 0010

        DECLE   $0000,  $0010,  $0049,  $0012   ; 6867   0000 0010 0049 0012
        DECLE   $0092,  $0014,  $00DB,  $0016   ; 686B   0092 0014 00DB 0016
        DECLE   $0024,  $0031,  $006D,  $0033   ; 686F   0024 0031 006D 0033
        DECLE   $00B6,  $0035,  $00FF,  $0037   ; 6873   00B6 0035 00FF 0037
        DECLE   $0004,  $0170,  $0234,  $0001   ; 6877   0004 0170 0234 0001
        DECLE   $02B8,  $0000,  $02BC,  $0028   ; 687B   02B8 0000 02BC 0028
        DECLE   $0260,  $0008,  $037C,  $002D   ; 687F   0260 0008 037C 002D
        DECLE   $0225,  $0005,  $02BC,  $0264   ; 6883   0225 0005 02BC 0264
        DECLE   $0001,  $02B8,  $0008,  $0021   ; 6887   0001 02B8 0008 0021
        DECLE   $0260,  $02FC,  $0008,  $02F8   ; 688B   0260 02FC 0008 02F8
        DECLE   $0008,  $037C,  $02A0,  $0225   ; 688F   0008 037C 02A0 0225
        DECLE   $0008,  $02BC,  $00C8,  $0004   ; 6893   0008 02BC 00C8 0004
        DECLE   $017C,  $01DC,  $0006,  $00C8   ; 6897   017C 01DC 0006 00C8
        DECLE   $00BB,  $0074,  $0004,  $0170   ; 689B   00BB 0074 0004 0170
        DECLE   $0234,  $0001,  $0004           ; 689F   0234 0001 0004

        CMPR    R6,     R0                      ; 68A2   0170
        SUBR    R5,     R7                      ; 68A3   012F

        DECLE   $0020,  $0003,  $0004,  $0020   ; 68A4   0020 0003 0004 0020
        DECLE   $0001,  $0004,  $0008,  $0008   ; 68A8   0001 0004 0008 0008
        DECLE   $0001,  $0004,  $0170,  $0234   ; 68AC   0001 0004 0170 0234
        DECLE   $003C,  $0229,  $0066,  $0080   ; 68B0   003C 0229 0066 0080
        DECLE   $020C,  $0003,  $0004,  $0370   ; 68B4   020C 0003 0004 0370
        DECLE   $03F5,  $0004,  $017C,  $0129   ; 68B8   03F5 0004 017C 0129
        DECLE   $00F5,  $0073,  $0004           ; 68BC   00F5 0073 0004

        CMPR    R6,     R4                      ; 68BF   0174
        MVO@    R2,     R1                      ; 68C0   024A
        MVII    #$02B4, R4                      ; 68C1   02BC 02B4
        SDBD                                    ; 68C3   0001
        MVII    #$78DA, R5                      ; 68C4   02BD 00DA 0078
        SDBD                                    ; 68C7   0001
        MVI@    R5,     R0                      ; 68C8   02A8
        MVO@    R0,     R4                      ; 68C9   0260
        SDBD                                    ; 68CA   0001
        CMPI    #$7902, R5                      ; 68CB   037D 0002 0079
        BLT     L_68D4                          ; 68CE   0205 0004

        SDBD                                    ; 68D0   0001
        MVII    #$78DA, R5                      ; 68D1   02BD 00DA 0078
L_68D4:
        CMPI    #$02F0, R4                      ; 68D4   037C 02F0
        DECLE   $0225,  $0010,  $0200,  $014A   ; 68D6   0225 0010 0200 014A

        INCR    R7                              ; 68DA   000F

        INCR    R0                              ; 68DB   0008
L_68DC:
        INCR    R7                              ; 68DC   000F

        INCR    R0                              ; 68DD   0008
L_68DE:
        INCR    R0                              ; 68DE   0008
        INCR    R0                              ; 68DF   0008
        INCR    R1                              ; 68E0   0009
        INCR    R0                              ; 68E1   0008
        INCR    R2                              ; 68E2   000A
        INCR    R0                              ; 68E3   0008
        INCR    R3                              ; 68E4   000B
        INCR    R0                              ; 68E5   0008
        INCR    R4                              ; 68E6   000C
        INCR    R0                              ; 68E7   0008
        INCR    R5                              ; 68E8   000D
        INCR    R0                              ; 68E9   0008
        INCR    R6                              ; 68EA   000E
        INCR    R0                              ; 68EB   0008
        INCR    R7                              ; 68EC   000F

        INCR    R0                              ; 68ED   0008
L_68EE:
        INCR    R0                              ; 68EE   0008
        COMR    R0                              ; 68EF   0018
        INCR    R1                              ; 68F0   0009
        COMR    R0                              ; 68F1   0018
        INCR    R2                              ; 68F2   000A
        COMR    R0                              ; 68F3   0018
        INCR    R3                              ; 68F4   000B
        COMR    R0                              ; 68F5   0018
        INCR    R4                              ; 68F6   000C
        COMR    R0                              ; 68F7   0018
        INCR    R5                              ; 68F8   000D
        COMR    R0                              ; 68F9   0018
        INCR    R6                              ; 68FA   000E
        COMR    R0                              ; 68FB   0018
        INCR    R7                              ; 68FC   000F

        COMR    R0                              ; 68FD   0018
L_68FE:
        INCR    R7                              ; 68FE   000F

        INCR    R0                              ; 68FF   0008
L_6900:
        INCR    R7                              ; 6900   000F

        INCR    R0                              ; 6901   0008
L_6902:
        MVII    #$004F, R0                      ; 6902   02B8 004F
        DECLE   $0240,  $033F,  $0004,  $0170   ; 6904   0240 033F 0004 0170
        DECLE   $0234,  $0001,  $01E4,  $02B8   ; 6908   0234 0001 01E4 02B8
        DECLE   $0320,  $0260,  $02F8,  $0004   ; 690C   0320 0260 02F8 0004
        DECLE   $0260,  $0338,  $0004,  $0260   ; 6910   0260 0338 0004 0260
        DECLE   $02F8,  $0004,  $0260,  $01C0   ; 6914   02F8 0004 0260 01C0
        DECLE   $0260,  $0260,  $0260,  $0260   ; 6918   0260 0260 0260 0260
        DECLE   $02B8,  $0020,  $0260,  $0260   ; 691C   02B8 0020 0260 0260
        DECLE   $02F8,  $0004,  $0260,  $0260   ; 6920   02F8 0004 0260 0260
        DECLE   $02FC,  $0004,  $0001,  $02B8   ; 6924   02FC 0004 0001 02B8
        DECLE   $0022,  $0008,  $0260,  $0260   ; 6928   0022 0008 0260 0260
        DECLE   $0260,  $0260,  $02FC,  $0004   ; 692C   0260 0260 02FC 0004
        DECLE   $0274,  $0004,  $0170,  $0234   ; 6930   0274 0004 0170 0234
        DECLE   $0001                           ; 6934   0001

        PULR    R4                              ; 6935   02B4
        CLRR    R0                              ; 6936   01C0
        MVO@    R0,     R4                      ; 6937   0260
        MVO@    R0,     R4                      ; 6938   0260
        MVO@    R0,     R4                      ; 6939   0260
        MVO@    R0,     R4                      ; 693A   0260
        SDBD                                    ; 693B   0001
        MVII    #$7971, R4                      ; 693C   02BC 0071 0079
L_693F:
        MVII    #$023F, R1                      ; 693F   02B9 023F
        DECLE   $0001,  $02A0,  $0248,  $0274   ; 6941   0001 02A0 0248 0274
        DECLE   $0004,  $0170,  $0234,  $0001   ; 6945   0004 0170 0234 0001

        PULR    R4                              ; 6949   02B4
        CLRR    R1                              ; 694A   01C9
        MVI@    R4,     R3                      ; 694B   02A3
        MVII    #$0018, R5                      ; 694C   02BD 0018
L_694E:
        MVI@    R5,     R0                      ; 694E   02A8
        DECLE   $01D2,  $0015,  $026A,  $03B8   ; 694F   01D2 0015 026A 03B8
        DECLE   $0100,  $0080,  $020C,  $0015   ; 6953   0100 0080 020C 0015
        DECLE   $014B,  $0204,  $000D           ; 6957   014B 0204 000D

        INCR    R1                              ; 695A   0009
        CMPI    #$0004, R1                      ; 695B   0379 0004
        BLT     L_694E                          ; 695D   0225 0010

        SDBD                                    ; 695F   0001
        CMPI    #$797D, R4                      ; 6960   037C 007D 0079
        BLT     L_693F                          ; 6963   0225 0025
        B       L_697D                          ; 6965   0200 0016

        DECLE   $0004,  $017C,  $0129,  $007D   ; 6967   0004 017C 0129 007D
        DECLE   $0079,  $014B,  $022C,  $0007   ; 696B   0079 014B 022C 0007
        DECLE   $0220,  $0016,  $00F8,  $0037   ; 696F   0220 0016 00F8 0037
        DECLE   $0000,  $00C7,  $0037,  $0001   ; 6973   0000 00C7 0037 0001
        DECLE   $003F,  $0036,  $0002,  $00FF   ; 6977   003F 0036 0002 00FF

        DECR    R1                              ; 697B   0011
        DIS                                     ; 697C   0003
L_697D:
        MVII    #$0050, R0                      ; 697D   02B8 0050
        DECLE   $0240,  $033F,  $0004,  $0170   ; 697F   0240 033F 0004 0170
        DECLE   $0234,  $0001,  $02BC,  $0000   ; 6983   0234 0001 02BC 0000
        DECLE   $02B8,  $0309,  $0260,  $0010   ; 6987   02B8 0309 0260 0010
        DECLE   $0260,  $0260,  $0008,  $0260   ; 698B   0260 0260 0008 0260
        DECLE   $02B8,  $039F,  $0260,  $0260   ; 698F   02B8 039F 0260 0260
        DECLE   $0008,  $0260,  $0260,  $02B8   ; 6993   0008 0260 0260 02B8
        DECLE   $0108,  $0260,  $0260,  $0008   ; 6997   0108 0260 0260 0008
        DECLE   $0260,  $0260,  $02B8,  $0064   ; 699B   0260 0260 02B8 0064
        DECLE   $0260,  $0008,  $0260,  $0010   ; 699F   0260 0008 0260 0010
        DECLE   $0260,  $0008,  $0260,  $0001   ; 69A3   0260 0008 0260 0001
        DECLE   $02B8,  $0020,  $0008,  $0260   ; 69A7   02B8 0020 0008 0260
        DECLE   $0260,  $0260,  $0260,  $0001   ; 69AB   0260 0260 0260 0001
        DECLE   $02B8,  $0028,  $0008,  $0260   ; 69AF   02B8 0028 0008 0260
        DECLE   $0260,  $0260,  $0260,  $01C0   ; 69B3   0260 0260 0260 01C0
        DECLE   $0260,  $0260,  $0260,  $0260   ; 69B7   0260 0260 0260 0260
        DECLE   $0260,  $0260,  $0260,  $0260   ; 69BB   0260 0260 0260 0260
        DECLE   $0240,  $0032,  $0240,  $0030   ; 69BF   0240 0032 0240 0030
        DECLE   $0240,  $0031,  $0004,  $0170   ; 69C3   0240 0031 0004 0170
        DECLE   $0234,  $0001,  $02BC,  $0018   ; 69C7   0234 0001 02BC 0018
        DECLE   $02B9,  $00E0,  $02A0,  $03B8   ; 69CB   02B9 00E0 02A0 03B8
        DECLE   $0200,  $0079,  $0080,  $020C   ; 69CF   0200 0079 0080 020C
        DECLE   $0039,  $0201,  $0039           ; 69D3   0039 0201 0039
L_69D6:
        CLRR    R0                              ; 69D6   01C0
        DECLE   $0014,  $0260,  $037C,  $0020   ; 69D7   0014 0260 037C 0020
        DECLE   $0225,  $000F,  $01E4,  $02A0   ; 69DB   0225 000F 01E4 02A0
        DECLE   $0010,  $0014,  $0260,  $037C   ; 69DF   0010 0014 0260 037C
        DECLE   $0010,  $0225,  $0007,  $0004   ; 69E3   0010 0225 0007 0004
        DECLE   $0170,  $0234,  $0001,  $02BC   ; 69E7   0170 0234 0001 02BC
        DECLE   $0018,  $02B9,  $0007,  $02A0   ; 69EB   0018 02B9 0007 02A0
        DECLE   $03B8,  $0200,  $0079,  $0080   ; 69EF   03B8 0200 0079 0080
        DECLE   $0204,  $0021,  $0209,  $0018   ; 69F3   0204 0021 0209 0018
        DECLE   $01C0,  $0014,  $0260,  $037C   ; 69F7   01C0 0014 0260 037C
        DECLE   $0020,  $0225,  $000F,  $0280   ; 69FB   0020 0225 000F 0280
        DECLE   $0030,  $0008,  $0240,  $0030   ; 69FF   0030 0008 0240 0030
        DECLE   $0240,  $0031,  $03B8,  $0007   ; 6A03   0240 0031 03B8 0007
        DECLE   $0080,  $022C,  $0044,  $0004   ; 6A07   0080 022C 0044 0004
        DECLE   $0370,  $018C,  $0221,  $0038   ; 6A0B   0370 018C 0221 0038
        DECLE   $0004                           ; 6A0F   0004

        CMPR    R7,     R4                      ; 6A10   017C
        SUBR    R5,     R1                      ; 6A11   0129
        MOVR    R1,     R4                      ; 6A12   008C
        RRC     R1,     1                       ; 6A13   0071
        B       L_69D6                          ; 6A14   0220 003F

        DECLE   $0229,  $0020,  $033C,  $0019   ; 6A16   0229 0020 033C 0019
        DECLE   $02A0,  $02FC,  $0018,  $03B8   ; 6A1A   02A0 02FC 0018 03B8
        DECLE   $00FF,  $0080,  $0224,  $002A   ; 6A1E   00FF 0080 0224 002A
        DECLE   $0220,  $0014,  $0004,  $017C   ; 6A22   0220 0014 0004 017C
        DECLE   $01DF,  $0001,  $0060,  $007B   ; 6A26   01DF 0001 0060 007B
        DECLE   $0004,  $017C,  $01DF,  $00A0   ; 6A2A   0004 017C 01DF 00A0
        DECLE   $0074,  $007B,  $0004,  $0170   ; 6A2E   0074 007B 0004 0170
        DECLE   $0234,  $0001,  $02B9,  $01FF   ; 6A32   0234 0001 02B9 01FF
        DECLE   $0004                           ; 6A36   0004

        CMPR    R7,     R4                      ; 6A37   017C
        MOVR    R2,     R7                      ; 6A38   0097

        DECLE   $02B9,  $01FE,  $0004           ; 6A39   02B9 01FE 0004

        CMPR    R7,     R4                      ; 6A3C   017C
        MOVR    R2,     R7                      ; 6A3D   0097

        DECLE   $01C0,  $0270,  $0001,  $02BC   ; 6A3E   01C0 0270 0001 02BC
        DECLE   $0079,  $007B,  $02BD,  $0218   ; 6A42   0079 007B 02BD 0218
        DECLE   $0275,  $02B9,  $01FE,  $0004   ; 6A46   0275 02B9 01FE 0004
        DECLE   $017C,  $005B,  $0201,  $0040   ; 6A4A   017C 005B 0201 0040
        DECLE   $02B5,  $0268,  $02FD,  $0006   ; 6A4E   02B5 0268 02FD 0006
        DECLE   $0275,  $02B9,  $01FF,  $0014   ; 6A52   0275 02B9 01FF 0014
        DECLE   $0014,  $0004                   ; 6A56   0014 0004

        CMPR    R7,     R4                      ; 6A58   017C
        SLLC    R3,     1                       ; 6A59   005B
        BC      L_6A8E                          ; 6A5A   0201 0032

        PULR    R5                              ; 6A5C   02B5
        MVO@    R0,     R5                      ; 6A5D   0268
        SUBI    #$0007, R5                      ; 6A5E   033D 0007
        INCR    R2                              ; 6A60   000A
        PULR    R1                              ; 6A61   02B1
        INCR    R1                              ; 6A62   0009
        CMPI    #$0005, R1                      ; 6A63   0379 0005
        BNEQ    L_6A6A                          ; 6A65   020C 0003

        CLRR    R1                              ; 6A67   01C9
        ADDI    #$000F, R5                      ; 6A68   02FD 000F
L_6A6A:
        PSHR    R1                              ; 6A6A   0271
        DECLE   $0001,  $037C,  $00A1,  $007B   ; 6A6B   0001 037C 00A1 007B
        DECLE   $0225,  $002A,  $02B1,  $02BD   ; 6A6F   0225 002A 02B1 02BD
        DECLE   $027D,  $0001,  $02B8,  $0038   ; 6A73   027D 0001 02B8 0038
        DECLE   $0008,  $01D2,  $0268,  $02FD   ; 6A77   0008 01D2 0268 02FD
        DECLE   $0006,  $0268,  $02F8,  $0008   ; 6A7B   0006 0268 02F8 0008
        DECLE   $033D,  $0007,  $000A,  $037A   ; 6A7F   033D 0007 000A 037A
        DECLE   $0003,  $0225,  $000C,  $02FD   ; 6A83   0003 0225 000C 02FD
        DECLE   $0011,  $037D,  $02B6,  $0225   ; 6A87   0011 037D 02B6 0225
        DECLE   $0013,  $0220,  $005D           ; 6A8B   0013 0220 005D
L_6A8E:
        MVII    #$034C, R6                      ; 6A8E   02BE 034C
        SDBD                                    ; 6A90   0001
        MVII    #$7FFA, R4                      ; 6A91   02BC 00FA 007F
        MOVR    R4,     R0                      ; 6A94   00A0
        ADDI    #$0002, R0                      ; 6A95   02F8 0002
        B       L_6AB0                          ; 6A97   0200 0017

        DECLE   $0004,  $017C,  $0199,  $0001   ; 6A99   0004 017C 0199 0001
        DECLE   $02B8,  $00E8,  $007F,  $0240   ; 6A9D   02B8 00E8 007F 0240
        DECLE   $034B,  $0284,  $034B,  $00A4   ; 6AA1   034B 0284 034B 00A4
        DECLE   $0204,  $0015,  $00A0,  $02F8   ; 6AA5   0204 0015 00A0 02F8
        DECLE   $0002,  $0001,  $0378,  $00FA   ; 6AA9   0002 0001 0378 00FA
        DECLE   $007F,  $0224,  $01F1           ; 6AAD   007F 0224 01F1
L_6AB0:
        MVO     R0,     G_034B                  ; 6AB0   0240 034B
        DECLE   $0001,  $02A0,  $0080,  $0204   ; 6AB2   0001 02A0 0080 0204
        DECLE   $0307                           ; 6AB6   0307

        SDBD                                    ; 6AB7   0001
        MVII    #$7AA2, R5                      ; 6AB8   02BD 00A2 007A
        MOVR    R0,     R7                      ; 6ABB   0087

L_6ABC:
        MVII    #$034C, R6                      ; 6ABC   02BE 034C
        DECLE   $0004,  $0174,  $024A,  $01DB   ; 6ABE   0004 0174 024A 01DB
        DECLE   $0243,  $0340,  $01E4,  $0001   ; 6AC2   0243 0340 01E4 0001
        DECLE   $02B8,  $0056,  $007F,  $00A1   ; 6AC6   02B8 0056 007F 00A1
        DECLE   $02F9,  $0014,  $0271,  $0004   ; 6ACA   02F9 0014 0271 0004
        DECLE   $017C,  $01E2,  $02B4,  $0081   ; 6ACE   017C 01E2 02B4 0081
        DECLE   $0289,  $0089,  $022C,  $000C   ; 6AD2   0289 0089 022C 000C
        DECLE   $0004,  $0178,  $02EC,  $0080   ; 6AD6   0004 0178 02EC 0080
        DECLE   $020C,  $0003,  $0004           ; 6ADA   020C 0003 0004

        CMPI    #$00BE, R0                      ; 6ADD   0378 00BE
        MVII    #$0101, R2                      ; 6ADF   02BA 0101
        MVO     R2,     .BTAB.E8                ; 6AE1   0242 02E8
        SLL     R0,     1                       ; 6AE3   0048
        MOVR    R0,     R4                      ; 6AE4   0084
        SDBD                                    ; 6AE5   0001
        ADDI    #$7FE6, R4                      ; 6AE6   02FC 00E6 007F
        CLRR    R0                              ; 6AE9   01C0
        B       L_6AB0                          ; 6AEA   0220 003B

        PSHR    R5                              ; 6AEC   0275
        CLRR    R4                              ; 6AED   01E4
        CLRR    R0                              ; 6AEE   01C0
L_6AEF:
        SDBD                                    ; 6AEF   0001
        MVII    #$FFFF, R2                      ; 6AF0   02BA 00FF 00FF
        CLRR    R4                              ; 6AF3   01E4
L_6AF4:
        PSHR    R2                              ; 6AF4   0272
        DECLE   $0270,  $0004                   ; 6AF5   0270 0004

        CMPR    R6,     R4                      ; 6AF7   0174
        ADD@    R4,     R2                      ; 6AF8   02E2
        PULR    R0                              ; 6AF9   02B0
        PULR    R2                              ; 6AFA   02B2
        SDBD                                    ; 6AFB   0001
        MVII    #$7B0F, R5                      ; 6AFC   02BD 000F 007B
        MVI     .PSG0.rgt_hand,R1               ; 6AFF   0281 01FE
        COMR    R1                              ; 6B01   0019
        ANDI    #$00FF, R1                      ; 6B02   03B9 00FF
L_6B04:
        CMP@    R5,     R1                      ; 6B04   0369
        BEQ     L_6B1F                          ; 6B05   0204 0018

        SDBD                                    ; 6B07   0001
        CMPI    #$7B1F, R5                      ; 6B08   037D 001F 007B
        BLT     L_6B04                          ; 6B0B   0225 0008
        B       L_6AF4                          ; 6B0D   0220 001A

        DECLE   $0048,  $0081,  $0041,  $0021   ; 6B0F   0048 0081 0041 0021
        DECLE   $0082,  $0042,  $0022,  $0084   ; 6B13   0082 0042 0022 0084
        DECLE   $0044,  $0024,  $0088,  $0028   ; 6B17   0044 0024 0088 0028
        DECLE   $00A0,  $0060,  $00C0,  $0000   ; 6B1B   00A0 0060 00C0 0000
L_6B1F:
        CMPR    R1,     R2                      ; 6B1F   014A
        BEQ     L_6B25                          ; 6B20   0204 0003

        MOVR    R1,     R2                      ; 6B22   008A
        B       L_6AF4                          ; 6B23   0220 0030

L_6B25:
        SDBD                                    ; 6B25   0001
        DECLE   $033D,  $0010,  $007B,  $037D   ; 6B26   033D 0010 007B 037D
        DECLE   $000F,  $0204,  $002B,  $00A4   ; 6B2A   000F 0204 002B 00A4
        DECLE   $0224,  $003B,  $01E4,  $037D   ; 6B2E   0224 003B 01E4 037D
        DECLE   $000A,  $0204,  $0012,  $037D   ; 6B32   000A 0204 0012 037D
        DECLE   $000B,  $0204,  $0011,  $037D   ; 6B36   000B 0204 0011 037D
        DECLE   $0009,  $022E,  $0048,  $004C   ; 6B3A   0009 022E 0048 004C
        DECLE   $004C,  $00E8,  $0004           ; 6B3E   004C 00E8 0004

        CMPR    R6,     R0                      ; 6B41   0170
        MVI@    R1,     R7                      ; 6B42   028F

        ADDR    R4,     R4                      ; 6B43   00E4
        EIS                                     ; 6B44   0002
        B       L_6AEF                          ; 6B45   0220 0057

L_6B47:
        CLRR    R0                              ; 6B47   01C0
        DECLE   $0220,  $0009                   ; 6B48   0220 0009

        MOVR    R0,     R1                      ; 6B4A   0081
        ANDI    #$000F, R0                      ; 6B4B   03B8 000F
        ANDI    #$00F0, R1                      ; 6B4D   03B9 00F0
        BEQ     L_6B53                          ; 6B4F   0204 0002

        ADDI    #$000A, R0                      ; 6B51   02F8 000A
L_6B53:
        CMPI    #$000B, R0                      ; 6B53   0378 000B
        BGT     L_6B47                          ; 6B55   022E 000F
        PULR    R7                              ; 6B57   02B7

        MVII    #$0001, R4                      ; 6B58   02BC 0001
        SDBD                                    ; 6B5A   0001
        MVII    #$FFFF, R2                      ; 6B5B   02BA 00FF 00FF
        B       L_6AF4                          ; 6B5E   0220 006B

        DECLE   $001B,  $0007,  $0031,  $0020   ; 6B60   001B 0007 0031 0020
        DECLE   $0026,  $0020,  $0039,  $0020   ; 6B64   0026 0020 0039 0020
        DECLE   $0054,  $004F,  $0020,  $0043   ; 6B68   0054 004F 0020 0043
        DECLE   $004F,  $004E,  $0054,  $0049   ; 6B6C   004F 004E 0054 0049
        DECLE   $004E,  $0055,  $0045,  $0000   ; 6B70   004E 0055 0045 0000
        DECLE   $001B,  $0002,  $0056,  $0033   ; 6B74   001B 0002 0056 0033
        DECLE   $0000,  $0000,  $0000,  $008E   ; 6B78   0000 0000 0000 008E
        DECLE   $0020,  $0096,  $0000,  $009E   ; 6B7C   0020 0096 0000 009E
        DECLE   $0000,  $0000,  $0020,  $0036   ; 6B80   0000 0000 0020 0036
        DECLE   $0001,  $00A6,  $0020,  $00AE   ; 6B84   0001 00A6 0020 00AE
        DECLE   $0000,  $00B6,  $0000,  $0036   ; 6B88   0000 00B6 0000 0036
        DECLE   $0021,  $0066,  $0001,  $00BE   ; 6B8C   0021 0066 0001 00BE
        DECLE   $0020,  $00C6,  $0000,  $00CE   ; 6B90   0020 00C6 0000 00CE
        DECLE   $0000,  $0096,  $0021,  $0000   ; 6B94   0000 0096 0021 0000
        DECLE   $0000,  $001E,  $0021,  $0086   ; 6B98   0000 001E 0021 0086
        DECLE   $0000,  $002E,  $0001,  $0000   ; 6B9C   0000 002E 0001 0000
        DECLE   $0020,  $0000,  $0000,  $0000   ; 6BA0   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $00FF   ; 6BA8   0000 0000 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BAC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0055,  $00AA   ; 6BB0   00FF 00FF 0055 00AA
        DECLE   $0055,  $00AA,  $0055,  $00AA   ; 6BB4   0055 00AA 0055 00AA
        DECLE   $0055,  $00AA,  $00AA,  $0055   ; 6BB8   0055 00AA 00AA 0055
        DECLE   $00AA,  $0055,  $00AA,  $0055   ; 6BBC   00AA 0055 00AA 0055
        DECLE   $00AA,  $0055,  $0080,  $0000   ; 6BC0   00AA 0055 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BCC   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $00FF,  $00FF   ; 6BD0   0001 0001 00FF 00FF
        DECLE   $00FF,  $00EF,  $00FF,  $00FF   ; 6BD4   00FF 00EF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $0003   ; 6BD8   00FF 00FF 0000 0003
        DECLE   $0007,  $000F,  $001F,  $003F   ; 6BDC   0007 000F 001F 003F
        DECLE   $007F,  $007F,  $007E,  $00FF   ; 6BE0   007F 007F 007E 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BE4   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $0000,  $00C0   ; 6BE8   00FF 00FF 0000 00C0
        DECLE   $00E0,  $00F0,  $00F8,  $00FC   ; 6BEC   00E0 00F0 00F8 00FC
        DECLE   $00FE,  $00FE,  $007F,  $00FF   ; 6BF0   00FE 00FE 007F 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BF4   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BF8   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6BFC   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FE,  $00FF   ; 6C00   00FF 00FF 00FE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C04   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FE,  $007F,  $007F   ; 6C08   00FF 00FE 007F 007F
        DECLE   $003F,  $001F                   ; 6C0C   003F 001F

        INCR    R7                              ; 6C0E   000F

        SETC                                    ; 6C0F   0007
L_6C10:
        DIS                                     ; 6C10   0003
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6C11   0000 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6C15   00FF 00FF 00FF 00FF
        DECLE   $007E,  $00FE,  $00FE,  $00FC   ; 6C19   007E 00FE 00FE 00FC
        DECLE   $00F8,  $00F0,  $00E0,  $00C0   ; 6C1D   00F8 00F0 00E0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C21   0000 0000 0000 0000
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 6C25   0000 00FF 00FF 00FF
        DECLE   $00FF,  $000F,  $000F,  $000F   ; 6C29   00FF 000F 000F 000F
        DECLE   $000F,  $000F,  $000F,  $000F   ; 6C2D   000F 000F 000F 000F
        DECLE   $000F,  $0000,  $0004,  $0002   ; 6C31   000F 0000 0004 0002
        DECLE   $00FF,  $0002,  $0004,  $0000   ; 6C35   00FF 0002 0004 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C39   0000 0000 0000 0000
        DECLE   $0004,  $0003,  $000D,  $0030   ; 6C3D   0004 0003 000D 0030
        DECLE   $00C0,  $0000,  $000E,  $0006   ; 6C41   00C0 0000 000E 0006
        DECLE   $000A,  $0010,  $0020,  $0040   ; 6C45   000A 0010 0020 0040
        DECLE   $0000,  $0010,  $0070,  $0028   ; 6C49   0000 0010 0070 0028
        DECLE   $0020,  $0040,  $0040,  $0080   ; 6C4D   0020 0040 0040 0080
        DECLE   $0080,  $0008,  $001C,  $002A   ; 6C51   0080 0008 001C 002A
        DECLE   $0008,  $0008,  $0008,  $0008   ; 6C55   0008 0008 0008 0008
        DECLE   $0008,  $0000                   ; 6C59   0008 0000

        PSHR    R5                              ; 6C5B   0275
        CLRR    R3                              ; 6C5C   01DB
        MOVR    R4,     R2                      ; 6C5D   00A2
        SDBD                                    ; 6C5E   0001
        SUBI    #$7B79, R2                      ; 6C5F   033A 0079 007B
        SLR     R2,     1                       ; 6C62   0062
        SDBD                                    ; 6C63   0001
        ADDI    #$7C83, R2                      ; 6C64   02FA 0083 007C
        MVI@    R2,     R0                      ; 6C67   0290
        MOVR    R0,     R5                      ; 6C68   0085
        MVI@    R1,     R1                      ; 6C69   0289
        CMPI    #$005A, R1                      ; 6C6A   0379 005A
        BEQ     L_6C81                          ; 6C6C   0204 0013

        CMPI    #$00BA, R1                      ; 6C6E   0379 00BA
        BEQ     L_6ECE                          ; 6C70   0204 025C

        CMPI    #$007A, R1                      ; 6C72   0379 007A
        BEQ     L_6ABC                          ; 6C74   0224 01B9

        COMR    R1                              ; 6C76   0019
        ANDR    R1,     R0                      ; 6C77   0188
        CMPR    R0,     R5                      ; 6C78   0145
        SDBD                                    ; 6C79   0001
        MVI@    R4,     R0                      ; 6C7A   02A0
        BNEQ    L_6C7F                          ; 6C7B   020C 0002

        XORI    #$0001, R0                      ; 6C7D   03F8 0001
L_6C7F:
        CLRC                                    ; 6C7F   0006
        PULR    R7                              ; 6C80   02B7

L_6C81:
        SETC                                    ; 6C81   0007
        PULR    R7                              ; 6C82   02B7

        DECLE   $03FF,  $0081,  $0041,  $0021   ; 6C83   03FF 0081 0041 0021
        DECLE   $03FF,  $00A0,  $0082,  $0042   ; 6C87   03FF 00A0 0082 0042
        DECLE   $0022,  $00A0,  $0060,  $0084   ; 6C8B   0022 00A0 0060 0084
        DECLE   $0044,  $0024,  $00C0,  $03FF   ; 6C8F   0044 0024 00C0 03FF
        DECLE   $0088,  $0048,  $0028,  $03FF   ; 6C93   0088 0048 0028 03FF

        PSHR    R5                              ; 6C97   0275
        MVI@    R1,     R0                      ; 6C98   0288
        ANDI    #$001F, R0                      ; 6C99   03B8 001F
        SDBD                                    ; 6C9B   0001
        MVII    #$7CE9, R4                      ; 6C9C   02BC 00E9 007C
L_6C9F:
        CMP@    R4,     R0                      ; 6C9F   0360
        BEQ     L_6CAF                          ; 6CA0   0204 000D

L_6CA2:
        ADDI    #$0003, R4                      ; 6CA2   02FC 0003
        SDBD                                    ; 6CA4   0001
        CMPI    #$7D29, R4                      ; 6CA5   037C 0029 007D
        BLT     L_6C9F                          ; 6CA8   0225 000A

        SUBI    #$01FE, R1                      ; 6CAA   0339 01FE
        CLRR    R0                              ; 6CAC   01C0
        MVO@    R0,     R1                      ; 6CAD   0248
        PULR    R7                              ; 6CAE   02B7

L_6CAF:
        MVI@    R1,     R2                      ; 6CAF   028A
        ANDI    #$00E0, R2                      ; 6CB0   03BA 00E0
        CMPI    #$00E0, R2                      ; 6CB2   037A 00E0
        BEQ     L_6CC4                          ; 6CB4   0204 000E

        CMPI    #$0040, R2                      ; 6CB6   037A 0040
        BEQ     L_6CC4                          ; 6CB8   0204 000A

        CMPI    #$0080, R2                      ; 6CBA   037A 0080
        BEQ     L_6CC4                          ; 6CBC   0204 0006

        CMPI    #$0020, R2                      ; 6CBE   037A 0020
        BEQ     L_6CC4                          ; 6CC0   0204 0002
        B       L_6CA2                          ; 6CC2   0220 0021

L_6CC4:
        SUBI    #$01FE, R1                      ; 6CC4   0339 01FE
        MVI@    R4,     R0                      ; 6CC6   02A0
        ADDI    #$0300, R0                      ; 6CC7   02F8 0300
        MOVR    R1,     R2                      ; 6CC9   008A
        SARC    R2,     1                       ; 6CCA   007A
        BNC     L_6CCF                          ; 6CCB   0209 0002

        ADDI    #$0038, R0                      ; 6CCD   02F8 0038
L_6CCF:
        MVO@    R0,     R1                      ; 6CCF   0248
        MVI@    R4,     R0                      ; 6CD0   02A0
        MOVR    R4,     R2                      ; 6CD1   00A2
        SDBD                                    ; 6CD2   0001
        SUBI    #$7CE9, R2                      ; 6CD3   033A 00E9 007C
        ANDI    #$0030, R2                      ; 6CD6   03BA 0030
        SLR     R2,     2                       ; 6CD8   0066
        SWAP    R2,     1                       ; 6CD9   0042
        MVI@    R4,     R3                      ; 6CDA   02A3
        ADDI    #$0008, R1                      ; 6CDB   02F9 0008
        ADDR    R2,     R0                      ; 6CDD   00D0
        ADDI    #$0100, R0                      ; 6CDE   02F8 0100
        MVO@    R0,     R1                      ; 6CE0   0248
        ADDI    #$0008, R1                      ; 6CE1   02F9 0008
        SDBD                                    ; 6CE3   0001
        ADDI    #$0896, R3                      ; 6CE4   02FB 0096 0008
        MVO@    R3,     R1                      ; 6CE7   024B
        PULR    R7                              ; 6CE8   02B7

        DECLE   $001D,  $0040,  $0040,  $0000   ; 6CE9   001D 0040 0040 0000
        DECLE   $0019,  $003F                   ; 6CED   0019 003F

        RSWD    R3                              ; 6CEF   003B
        INCR    R0                              ; 6CF0   0008
        INCR    R1                              ; 6CF1   0009
        RSWD    R6                              ; 6CF2   003E
        RSWD    R3                              ; 6CF3   003B
        DECR    R0                              ; 6CF4   0010
        INCR    R3                              ; 6CF5   000B
        RSWD    R5                              ; 6CF6   003D
        RSWD    R1                              ; 6CF7   0039
        COMR    R0                              ; 6CF8   0018
        COMR    R3                              ; 6CF9   001B
        RSWD    R0                              ; 6CFA   0038
        RSWD    R0                              ; 6CFB   0038
        NEGR    R0                              ; 6CFC   0020
        DECR    R3                              ; 6CFD   0013
        GSWD    R3                              ; 6CFE   0033
        RSWD    R1                              ; 6CFF   0039
        COMR    R0                              ; 6D00   0018
        DIS                                     ; 6D01   0003
        GSWD    R3                              ; 6D02   0033
        RSWD    R3                              ; 6D03   003B
        DECR    R0                              ; 6D04   0010
        SETC                                    ; 6D05   0007
        GSWD    R1                              ; 6D06   0031
        RSWD    R3                              ; 6D07   003B
        INCR    R0                              ; 6D08   0008
        COMR    R6                              ; 6D09   001E
        RSWD    R0                              ; 6D0A   0038
        SLL     R0,     1                       ; 6D0B   0048
        NEGR    R0                              ; 6D0C   0020
        COMR    R4                              ; 6D0D   001C
        RSWD    R5                              ; 6D0E   003D
        SWAP    R3,     2                       ; 6D0F   0047
        COMR    R0                              ; 6D10   0018
        INCR    R4                              ; 6D11   000C
        RSWD    R5                              ; 6D12   003D
        SWAP    R1,     2                       ; 6D13   0045
        DECR    R0                              ; 6D14   0010
        INCR    R5                              ; 6D15   000D
        SWAP    R0,     1                       ; 6D16   0040
        SWAP    R1,     2                       ; 6D17   0045
        INCR    R0                              ; 6D18   0008
L_6D19:
        DECR    R7                              ; 6D19   0017

        DECLE   $0030,  $0040,  $0000           ; 6D1A   0030 0040 0000

        DECR    R6                              ; 6D1D   0016
        GSWD    R0                              ; 6D1E   0030
        SWAP    R1,     2                       ; 6D1F   0045
        INCR    R0                              ; 6D20   0008
        CLRC                                    ; 6D21   0006
        GSWD    R3                              ; 6D22   0033
        SWAP    R1,     2                       ; 6D23   0045
        DECR    R0                              ; 6D24   0010
        INCR    R6                              ; 6D25   000E
        NOP                                     ; 6D26   0034
        SWAP    R3,     2                       ; 6D27   0047
        COMR    R0                              ; 6D28   0018
        CLRR    R0                              ; 6D29   01C0
        MVO     R0,     G_033E                  ; 6D2A   0240 033E
        SDBD                                    ; 6D2C   0001
        MVI@    R5,     R0                      ; 6D2D   02A8
        PSHR    R0                              ; 6D2E   0270
        MVI     G_033F, R3                      ; 6D2F   0283 033F
        SDBD                                    ; 6D31   0001
        MVII    #$7E9A, R4                      ; 6D32   02BC 009A 007E
L_6D35:
        CMP@    R4,     R3                      ; 6D35   0363
        BEQ     L_6D3F                          ; 6D36   0204 0007

        INCR    R4                              ; 6D38   000C
        SDBD                                    ; 6D39   0001
        CMPI    #$7ECE, R4                      ; 6D3A   037C 00CE 007E
        BLT     L_6D35                          ; 6D3D   0225 0009

L_6D3F:
        MVI@    R4,     R3                      ; 6D3F   02A3
        DECLE   $0004                           ; 6D40   0004

        CMPR    R7,     R4                      ; 6D41   017C
        CMPR    R6,     R5                      ; 6D42   0175
        MOVR    R1,     R5                      ; 6D43   008D
        AND     G_0340, R5                      ; 6D44   0385 0340
        TSTR    R5                              ; 6D46   00AD
        BEQ     L_6D57                          ; 6D47   0204 000E

        MVI     .PSG0.rgt_hand,R5               ; 6D49   0285 01FE
        CMPI    #$00B7, R5                      ; 6D4B   037D 00B7
        BEQ     L_6D57                          ; 6D4D   0204 0008

        MVI     .PSG0.lft_hand,R5               ; 6D4F   0285 01FF
        CMPI    #$00B7, R5                      ; 6D51   037D 00B7
        BEQ     L_6D57                          ; 6D53   0204 0002
        B       L_6D74                          ; 6D55   0200 001D

L_6D57:
        PSHR    R1                              ; 6D57   0271
        DECLE   $02B1,  $008B,  $0019,  $0381   ; 6D58   02B1 008B 0019 0381
        DECLE   $0340,  $00D9,  $0241,  $0340   ; 6D5C   0340 00D9 0241 0340
        DECLE   $0004,  $017C,  $01DF           ; 6D60   0004 017C 01DF

        SARC    R2,     1                       ; 6D63   007A
        MOVR    R0,     R7                      ; 6D64   0087

        DECLE   $007D,  $0280,  $033F,  $0338   ; 6D65   007D 0280 033F 0338
        DECLE   $0020,  $004C,  $0048,  $02F8   ; 6D69   0020 004C 0048 02F8
        DECLE   $0002,  $0240,  $028A,  $0004   ; 6D6D   0002 0240 028A 0004
        DECLE   $0170,  $0234                   ; 6D71   0170 0234

        SARC    R0,     1                       ; 6D73   0078
L_6D74:
        PULR    R7                              ; 6D74   02B7

        CLRR    R0                              ; 6D75   01C0
        MVII    #$0001, R1                      ; 6D76   02B9 0001
L_6D78:
        TSTR    R3                              ; 6D78   009B
        BEQ     L_6D86                          ; 6D79   0204 000B

        INCR    R0                              ; 6D7B   0008
        CMPI    #$000A, R0                      ; 6D7C   0378 000A
        BNEQ    L_6D82                          ; 6D7E   020C 0002

        MVII    #$0010, R0                      ; 6D80   02B8 0010
L_6D82:
        SLL     R1,     1                       ; 6D82   0049
        DECR    R3                              ; 6D83   0013
        B       L_6D78                          ; 6D84   0220 000D
L_6D86:
        MOVR    R5,     R7                      ; 6D86   00AF

        DECLE   $001B,  $0006,  $0046,  $0041   ; 6D87   001B 0006 0046 0041
        DECLE   $0049,  $004C,  $0055,  $0052   ; 6D8B   0049 004C 0055 0052
        DECLE   $0045,  $0020,  $0041,  $0054   ; 6D8F   0045 0020 0041 0054
        DECLE   $0020,  $0054,  $0045,  $0053   ; 6D93   0020 0054 0045 0053
        DECLE   $0054,  $0000                   ; 6D97   0054 0000

        SDBD                                    ; 6D99   0001
        MVII    #$7BA2, R4                      ; 6D9A   02BC 00A2 007B
        SDBD                                    ; 6D9D   0001
        MVII    #$7C5A, R3                      ; 6D9E   02BB 005A 007C
        PSHR    R5                              ; 6DA1   0275
        SDBD                                    ; 6DA2   0001
        MVII    #$3800, R5                      ; 6DA3   02BD 0000 0038
L_6DA6:
        PSHR    R5                              ; 6DA6   0275
        DECLE   $0274,  $0273,  $0004,  $0170   ; 6DA7   0274 0273 0004 0170
        DECLE   $0234,  $0001                   ; 6DAB   0234 0001

        PULR    R3                              ; 6DAD   02B3
        PULR    R4                              ; 6DAE   02B4
        PULR    R5                              ; 6DAF   02B5
L_6DB0:
        MVI@    R4,     R0                      ; 6DB0   02A0
        MVO@    R0,     R5                      ; 6DB1   0268
        CMPR    R3,     R4                      ; 6DB2   015C
        BGE     L_6DBD                          ; 6DB3   020D 0008

        MVII    #$001F, R0                      ; 6DB5   02B8 001F
        ANDR    R5,     R0                      ; 6DB7   01A8
        TSTR    R0                              ; 6DB8   0080
        BNEQ    L_6DB0                          ; 6DB9   022C 000A
        B       L_6DA6                          ; 6DBB   0220 0016
L_6DBD:
        PULR    R7                              ; 6DBD   02B7

        DECLE   $0004,  $0170,  $0071,  $0280   ; 6DBE   0004 0170 0071 0280
        DECLE   $0340,  $0080,  $020C,  $003A   ; 6DC2   0340 0080 020C 003A

        MVII    #$02F1, R6                      ; 6DC6   02BE 02F1

        JSRD    R5,     .EXEC.A83               ; 6DC8   0004 011A 0283

        MVII    #$0026, R0                      ; 6DCB   02B8 0026
        MVO     R0,     .ISRVEC.0               ; 6DCD   0240 0100
        MVII    #$0011, R0                      ; 6DCF   02B8 0011
        MVO     R0,     .ISRVEC.1               ; 6DD1   0240 0101
        SDBD                                    ; 6DD3   0001
        MVII    #$5014, R0                      ; 6DD4   02B8 0014 0050
        MVO     R0,     G_02F0                  ; 6DD7   0240 02F0
        J       .EXEC.041                       ; 6DD9   0004 0310 0041

        MVI@    R5,     R0                      ; 6DDC   02A8
        MVO     R0,     G_0347                  ; 6DDD   0240 0347
        MVI@    R5,     R4                      ; 6DDF   02AC
        SDBD                                    ; 6DE0   0001
        MVI@    R5,     R0                      ; 6DE1   02A8
        PSHR    R5                              ; 6DE2   0275
        MOVR    R0,     R5                      ; 6DE3   0085
        ADDI    #$0200, R4                      ; 6DE4   02FC 0200
L_6DE6:
        MVI@    R5,     R0                      ; 6DE6   02A8
        TSTR    R0                              ; 6DE7   0080
        BEQ     L_6DFE                          ; 6DE8   0204 0014

        CMPI    #$001B, R0                      ; 6DEA   0378 001B
        BEQ     L_6DF7                          ; 6DEC   0204 0009

        SUBI    #$0020, R0                      ; 6DEE   0338 0020
        SLL     R0,     2                       ; 6DF0   004C
        SLL     R0,     1                       ; 6DF1   0048
        ADD     G_0347, R0                      ; 6DF2   02C0 0347
        MVO@    R0,     R4                      ; 6DF4   0260
        B       L_6DE6                          ; 6DF5   0220 0010

L_6DF7:
        MVI@    R5,     R0                      ; 6DF7   02A8
        ANDI    #$0007, R0                      ; 6DF8   03B8 0007
        MVO     R0,     G_0347                  ; 6DFA   0240 0347
        B       L_6DE6                          ; 6DFC   0220 0017

L_6DFE:
        MOVR    R5,     R0                      ; 6DFE   00A8
        PULR    R7                              ; 6DFF   02B7

        DECLE   $0004,  $0170,  $0234,  $0001   ; 6E00   0004 0170 0234 0001
        DECLE   $02B8,  $0001,  $0240,  $0021   ; 6E04   02B8 0001 0240 0021
        DECLE   $01E4,  $01C0,  $0260,  $037C   ; 6E08   01E4 01C0 0260 037C
        DECLE   $0008,  $0225,  $0004,  $0004   ; 6E0C   0008 0225 0004 0004
        DECLE   $017C,  $01DF                   ; 6E10   017C 01DF

        ADDR    R1,     R0                      ; 6E12   00C8
        ADCR    R2                              ; 6E13   002A
        SARC    R2,     2                       ; 6E14   007E
L_6E15:
        CLRR    R1                              ; 6E15   01C9
        DECLE   $0004,  $017C,  $0235,  $0004   ; 6E16   0004 017C 0235 0004
        DECLE   $0170,  $0234,  $003C,  $0001   ; 6E1A   0170 0234 003C 0001
        DECLE   $02B9,  $0000,  $0004,  $0004   ; 6E1E   02B9 0000 0004 0004
        DECLE   $017C,  $0235,  $0004,  $0170   ; 6E22   017C 0235 0004 0170
        DECLE   $0234                           ; 6E26   0234

        RSWD    R4                              ; 6E27   003C
        B       L_6E15                          ; 6E28   0220 0014

        DECLE   $001B,  $0002,  $0046,  $0041   ; 6E2A   001B 0002 0046 0041
        DECLE   $0049,  $004C,  $0055,  $0052   ; 6E2E   0049 004C 0055 0052
        DECLE   $0045,  $0021,  $0000           ; 6E32   0045 0021 0000

        PSHR    R5                              ; 6E35   0275
        SDBD                                    ; 6E36   0001
        MVII    #$7E80, R4                      ; 6E37   02BC 0080 007E
L_6E3A:
        MVI@    R4,     R5                      ; 6E3A   02A5
        DECLE   $00AD,  $0204,  $0039,  $02FD   ; 6E3B   00AD 0204 0039 02FD
        DECLE   $0200,  $02A3,  $0271,  $0275   ; 6E3F   0200 02A3 0271 0275
        DECLE   $0004                           ; 6E43   0004

        CMPR    R7,     R4                      ; 6E44   017C
        CMPR    R6,     R5                      ; 6E45   0175
        PULR    R5                              ; 6E46   02B5
        PULR    R3                              ; 6E47   02B3
        AND     G_0340, R1                      ; 6E48   0381 0340
        TSTR    R1                              ; 6E4A   0089
        BEQ     L_6E57                          ; 6E4B   0204 000A

        TSTR    R3                              ; 6E4D   009B
        BNEQ    L_6E53                          ; 6E4E   020C 0003

        CLRR    R1                              ; 6E50   01C9
        B       L_6E57                          ; 6E51   0200 0004

L_6E53:
        SDBD                                    ; 6E53   0001
        MVII    #$0600, R1                      ; 6E54   02B9 0000 0006
L_6E57:
        MVII    #$0200, R2                      ; 6E57   02BA 0200
        XORR    R1,     R2                      ; 6E59   01CA
        MVO@    R2,     R5                      ; 6E5A   026A
        MVII    #$03AE, R2                      ; 6E5B   02BA 03AE
        XORR    R1,     R2                      ; 6E5D   01CA
        MVO@    R2,     R5                      ; 6E5E   026A
        PSHR    R0                              ; 6E5F   0270
        SLR     R0,     1                       ; 6E60   0060
        ANDI    #$0078, R0                      ; 6E61   03B8 0078
        ADDI    #$0286, R0                      ; 6E63   02F8 0286
        XORR    R1,     R0                      ; 6E65   01C8
        MVO@    R0,     R5                      ; 6E66   0268
        PULR    R0                              ; 6E67   02B0
        SLL     R0,     2                       ; 6E68   004C
        SLL     R0,     1                       ; 6E69   0048
        ANDI    #$0078, R0                      ; 6E6A   03B8 0078
        ADDI    #$0286, R0                      ; 6E6C   02F8 0286
        XORR    R1,     R0                      ; 6E6E   01C8
        MVO@    R0,     R5                      ; 6E6F   0268
        MVII    #$0200, R0                      ; 6E70   02B8 0200
        XORR    R1,     R0                      ; 6E72   01C8
        MVO@    R0,     R5                      ; 6E73   0268
        MOVR    R3,     R1                      ; 6E74   0099
        B       L_6E3A                          ; 6E75   0220 003C
        PULR    R7                              ; 6E77   02B7

        PSHR    R0                              ; 6E78   0270
        PSHR    R1                              ; 6E79   0271
        PSHR    R2                              ; 6E7A   0272
        PSHR    R3                              ; 6E7B   0273
        PSHR    R4                              ; 6E7C   0274
        PSHR    R5                              ; 6E7D   0275
L_6E7E:
        B       L_6E7E                          ; 6E7E   0220 0001

        DECLE   $0002,  $0007,  $0008,  $0005   ; 6E80   0002 0007 0008 0005
        DECLE   $002A,  $0008,  $0030,  $0004   ; 6E84   002A 0008 0030 0004
        DECLE   $0051,  $0006,  $0057,  $0002   ; 6E88   0051 0006 0057 0002
        DECLE   $005D,  $0001                   ; 6E8C   005D 0001

        SARC    R2,     1                       ; 6E8E   007A
        INCR    R4                              ; 6E8F   000C
        TSTR    R0                              ; 6E90   0080
        DIS                                     ; 6E91   0003
        MOVR    R0,     R6                      ; 6E92   0086
        INCR    R1                              ; 6E93   0009
        MOVR    R5,     R1                      ; 6E94   00A9
        INCR    R6                              ; 6E95   000E
        MOVR    R5,     R7                      ; 6E96   00AF

        DECLE   $000F,  $0000,  $0000,  $0041   ; 6E97   000F 0000 0000 0041
        DECLE   $0005,  $0042,  $0009,  $0043   ; 6E9B   0005 0042 0009 0043
        DECLE   $0003,  $0044,  $0004,  $0045   ; 6E9F   0003 0044 0004 0045
        DECLE   $0008,  $0046,  $0007,  $0047   ; 6EA3   0008 0046 0007 0047
        DECLE   $0002,  $0048,  $000C,  $0049   ; 6EA7   0002 0048 000C 0049
        DECLE   $0004,  $004A,  $0006,  $004B   ; 6EAB   0004 004A 0006 004B
        DECLE   $0004,  $004C,  $0009,  $004D   ; 6EAF   0004 004C 0009 004D
        DECLE   $0003,  $004E,  $0004,  $004F   ; 6EB3   0003 004E 0004 004F
        DECLE   $0004,  $0050,  $0004,  $0051   ; 6EB7   0004 0050 0004 0051
        DECLE   $0004,  $0052,  $0004,  $0053   ; 6EBB   0004 0052 0004 0053
        DECLE   $0004,  $0054,  $0004,  $0055   ; 6EBF   0004 0054 0004 0055
        DECLE   $0004,  $0056,  $0004           ; 6EC3   0004 0056 0004

        RLC     R3,     2                       ; 6EC6   0057

        JSR     R4,     L_5806                  ; 6EC7   0004 0058 0006

        SLLC    R1,     1                       ; 6ECA   0059

        JSRD    R4,     L_5804                  ; 6ECB   0004 005A 0004

L_6ECE:
        MVII    #$034C, R6                      ; 6ECE   02BE 034C
        DECLE   $0002,  $0004,  $0170,  $0071   ; 6ED0   0002 0004 0170 0071
        DECLE   $0004,  $0170,  $0234,  $0001   ; 6ED4   0004 0170 0234 0001
L_6ED8:
        SDBD                                    ; 6ED8   0001
        DECLE   $02BC,  $0000,  $0050,  $0004   ; 6ED9   02BC 0000 0050 0004
        DECLE   $017C,  $02FE,  $0004,  $017C   ; 6EDD   017C 02FE 0004 017C
        DECLE   $030D,  $0048,  $0001,  $0004   ; 6EE1   030D 0048 0001 0004
        DECLE   $017C,  $01DF,  $0028,  $002C   ; 6EE5   017C 01DF 0028 002C
        DECLE   $007F,  $0001,  $02BC,  $0000   ; 6EE9   007F 0001 02BC 0000
        DECLE   $0058,  $0004,  $017C,  $02FE   ; 6EED   0058 0004 017C 02FE
        DECLE   $0004,  $017C,  $030D,  $0084   ; 6EF1   0004 017C 030D 0084
        DECLE   $0002,  $0004,  $017C,  $01DF   ; 6EF5   0002 0004 017C 01DF

        SLR     R0,     2                       ; 6EF9   0064
        SWAP    R1,     1                       ; 6EFA   0041
        SARC    R3,     2                       ; 6EFB   007F
        B       L_6ED8                          ; 6EFC   0220 0025

        CLRR    R0                              ; 6EFE   01C0
        CLRR    R1                              ; 6EFF   01C9
        MOVR    R4,     R3                      ; 6F00   00A3
        SDBD                                    ; 6F01   0001
        ADDI    #$0800, R3                      ; 6F02   02FB 0000 0008
L_6F05:
        ADD@    R4,     R0                      ; 6F05   02E0
        BNC     L_6F09                          ; 6F06   0209 0001

        INCR    R1                              ; 6F08   0009
L_6F09:
        CMPR    R4,     R3                      ; 6F09   0163
        BNEQ    L_6F05                          ; 6F0A   022C 0006
        MOVR    R5,     R7                      ; 6F0C   00AF

        MVI@    R5,     R2                      ; 6F0D   02AA
        ADDI    #$0200, R2                      ; 6F0E   02FA 0200
        MVI@    R5,     R3                      ; 6F10   02AB
        PSHR    R5                              ; 6F11   0275
        MOVR    R3,     R5                      ; 6F12   009D
        MVII    #$000B, R4                      ; 6F13   02BC 000B
L_6F15:
        MOVR    R0,     R3                      ; 6F15   0083
        ANDI    #$0007, R3                      ; 6F16   03BB 0007
        ADDI    #$0010, R3                      ; 6F18   02FB 0010
        SLL     R3,     2                       ; 6F1A   004F
        SLL     R3,     1                       ; 6F1B   004B
        ADDR    R5,     R3                      ; 6F1C   00EB
        MVO@    R3,     R2                      ; 6F1D   0253
        DECR    R2                              ; 6F1E   0012
        CLRC                                    ; 6F1F   0006
        RRC     R1,     1                       ; 6F20   0071
        RRC     R0,     1                       ; 6F21   0070
        CLRC                                    ; 6F22   0006
        RRC     R1,     1                       ; 6F23   0071
        RRC     R0,     1                       ; 6F24   0070
        CLRC                                    ; 6F25   0006
        RRC     R1,     1                       ; 6F26   0071
        RRC     R0,     1                       ; 6F27   0070
        DECR    R4                              ; 6F28   0014
        BNEQ    L_6F15                          ; 6F29   022C 0015
        PULR    R7                              ; 6F2B   02B7

        DECLE   $001B,  $0001,  $0043,  $0041   ; 6F2C   001B 0001 0043 0041
        DECLE   $0052,  $0054,  $0020,  $0043   ; 6F30   0052 0054 0020 0043
        DECLE   $0048,  $0045,  $0043,  $004B   ; 6F34   0048 0045 0043 004B
        DECLE   $0053,  $0055,  $004D,  $0020   ; 6F38   0053 0055 004D 0020
        DECLE   $004C,  $004F,  $0020,  $003D   ; 6F3C   004C 004F 0020 003D
        DECLE   $0000,  $001B,  $0002,  $0043   ; 6F40   0000 001B 0002 0043
        DECLE   $0041,  $0052,  $0054,  $0020   ; 6F44   0041 0052 0054 0020
        DECLE   $0043,  $0048,  $0045,  $0043   ; 6F48   0043 0048 0045 0043
        DECLE   $004B,  $0053,  $0055,  $004D   ; 6F4C   004B 0053 0055 004D
        DECLE   $0020,  $0048,  $0049,  $0020   ; 6F50   0020 0048 0049 0020
        DECLE   $003D,  $0000,  $001B,  $0000   ; 6F54   003D 0000 001B 0000
        DECLE   $0031,  $002E,  $0020,  $0038   ; 6F58   0031 002E 0020 0038
        DECLE   $0039,  $0030,  $0030,  $0020   ; 6F5C   0039 0030 0030 0020
        DECLE   $0041,  $0055,  $0054,  $004F   ; 6F60   0041 0055 0054 004F
        DECLE   $0000,  $0032,  $002E,  $0020   ; 6F64   0000 0032 002E 0020
        DECLE   $0039,  $0036,  $0030,  $0030   ; 6F68   0039 0036 0030 0030
        DECLE   $0000,  $0033,  $002E,  $0020   ; 6F6C   0000 0033 002E 0020
        DECLE   $0038,  $0039,  $0031,  $0034   ; 6F70   0038 0039 0031 0034
        DECLE   $0020,  $004D,  $0045,  $004D   ; 6F74   0020 004D 0045 004D
        DECLE   $004F,  $0052,  $0059,  $0000   ; 6F78   004F 0052 0059 0000
        DECLE   $0034,  $002E,  $0020,  $0039   ; 6F7C   0034 002E 0020 0039
        DECLE   $0035,  $0030,  $0032,  $0000   ; 6F80   0035 0030 0032 0000
        DECLE   $0035,  $002E,  $0020,  $0039   ; 6F84   0035 002E 0020 0039
        DECLE   $0035,  $0030,  $0034,  $0000   ; 6F88   0035 0030 0034 0000
        DECLE   $0036,  $002E,  $0020,  $0047   ; 6F8C   0036 002E 0020 0047
        DECLE   $0052,  $004F,  $004D,  $0000   ; 6F90   0052 004F 004D 0000
        DECLE   $0037,  $002E,  $0020,  $0047   ; 6F94   0037 002E 0020 0047
        DECLE   $0052,  $0041,  $004D,  $0020   ; 6F98   0052 0041 004D 0020
        DECLE   $004C,  $004F,  $0057,  $0045   ; 6F9C   004C 004F 0057 0045
        DECLE   $0052,  $0000,  $0038,  $002E   ; 6FA0   0052 0000 0038 002E
        DECLE   $0020,  $0047,  $0052,  $0041   ; 6FA4   0020 0047 0052 0041
        DECLE   $004D,  $0020,  $0055,  $0050   ; 6FA8   004D 0020 0055 0050
        DECLE   $0050,  $0045,  $0052,  $0000   ; 6FAC   0050 0045 0052 0000
        DECLE   $0039,  $002E,  $0020,  $0053   ; 6FB0   0039 002E 0020 0053
        DECLE   $0043,  $0052,  $0041,  $0054   ; 6FB4   0043 0052 0041 0054
        DECLE   $0043,  $0048,  $0050,  $0041   ; 6FB8   0043 0048 0050 0041
        DECLE   $0044,  $0000,  $0031,  $0030   ; 6FBC   0044 0000 0031 0030
        DECLE   $002E,  $0020,  $0053,  $004F   ; 6FC0   002E 0020 0053 004F
        DECLE   $0055,  $004E,  $0044,  $0000   ; 6FC4   0055 004E 0044 0000
        DECLE   $0031,  $0031,  $002E,  $0020   ; 6FC8   0031 0031 002E 0020
        DECLE   $0053,  $0054,  $0049,  $0043   ; 6FCC   0053 0054 0049 0043
        DECLE   $0020,  $0056,  $0049,  $0053   ; 6FD0   0020 0056 0049 0053
        DECLE   $0049,  $0042,  $004C,  $0045   ; 6FD4   0049 0042 004C 0045
        DECLE   $0000,  $001B,  $0004,  $0053   ; 6FD8   0000 001B 0004 0053
        DECLE   $0045,  $004C,  $0045,  $0043   ; 6FDC   0045 004C 0045 0043
        DECLE   $0054,  $003A,  $0028,  $0020   ; 6FE0   0054 003A 0028 0020
        DECLE   $0020,  $0029,  $0000,  $0000   ; 6FE4   0020 0029 0000 0000

        SARC    R3,     1                       ; 6FE8   007B
        RRC     R0,     1                       ; 6FE9   0070
        SLR     R3,     2                       ; 6FEA   0067
        RRC     R2,     2                       ; 6FEB   0076
        MOVR    R0,     R7                      ; 6FEC   0087

        RRC     R2,     2                       ; 6FED   0076
        ADDR    R4,     R6                      ; 6FEE   00E6
        RRC     R1,     2                       ; 6FEF   0075
        DECR    R6                              ; 6FF0   0016
        RRC     R2,     2                       ; 6FF1   0076
        MOVR    R7,     R3                      ; 6FF2   00BB
        RRC     R1,     2                       ; 6FF3   0075
        SAR     R3,     2                       ; 6FF4   006F
        RRC     R2,     2                       ; 6FF5   0076
        RRC     R3,     2                       ; 6FF6   0077
        RRC     R2,     2                       ; 6FF7   0076
        SARC    R3,     2                       ; 6FF8   007F
        RRC     R2,     2                       ; 6FF9   0076
        MOVR    R4,     R0                      ; 6FFA   00A0
        RRC     R3,     1                       ; 6FFB   0073
        SLL     R0,     1                       ; 6FFC   0048
        SARC    R0,     1                       ; 6FFD   0078
        DECLE   $0000,  $0000                   ; 6FFE   0000 0000

        ORG     $D000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D000   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D004   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D008   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D00C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D010   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D014   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D018   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D01C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D020   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D024   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D028   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D02C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D030   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D034   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D038   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D03C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D040   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D044   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D048   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D04C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D050   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D054   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D058   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D05C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D060   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D064   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D068   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D06C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D070   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D074   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D078   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D07C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D080   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D084   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D088   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D08C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D090   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D094   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D098   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D09C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0A8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0B8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0BC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0C8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0CC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0D8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0DC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0E8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0EC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0F8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D0FC   0000 0000 0000 0000
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
;;  $5804       $6ECB  
;;  $5806       $6EC7  
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
;;  $6024       $6086   $60A1   $60B0   $60E6   $6101   $6245  
;;  $6027       $602A  
;;  $6069       $606C  
;;  $6075       $6078  
;;  $6115       $6129  
;;  $6132       $613D  
;;  $6137       $613A  
;;  $6143       $6152  
;;  $6150       $614D  
;;  $6154       $6144  
;;  $623D       $628D  
;;  $6294       $62A6  
;;  $6296       $629B  
;;  $629D       $6297  
;;  $62AA       $62AE  
;;  $62BD       $62D2  
;;  $62CB       $62C7  
;;  $62D9       $62DC  
;;  $62F5       $62F9  
;;  $62FB       $62F6  
;;  $6381       $6388  
;;  $6387       $6378  
;;  $6397       $639E  
;;  $639D       $6391  
;;  $6492       $64B9  
;;  $64DC       $64D2   $64D8  
;;  $64F1       $6500  
;;  $64FD       $64FE  
;;  $6502       $64F4  
;;  $651D       $652A  
;;  $6527       $6528  
;;  $652C       $6521  
;;  $6531       $653E  
;;  $653B       $653C  
;;  $6540       $6535  
;;  $654B       $6548  
;;  $6557       $655A  
;;  $657F       $656A  
;;  $658D       $657D  
;;  $65AA       $659B   $65A2  
;;  $65F7       $65F3  
;;  $6627       $6623  
;;  $66B3       $66B3  
;;  $66BB       $66DF  
;;  $66F1       $66FC  
;;  $66F7       $66F9  
;;  $6703       $6719  
;;  $670F       $6715  
;;  $6725       $6712  
;;  $6733       $6740  
;;  $6739       $673D  
;;  $6746       $675A  
;;  $674D       $6756  
;;  $6761       $6753  
;;  $6856       $6865  
;;  $685F       $6863  
;;  $68D4       $68CE  
;;  $68DC       $68DA  
;;  $68DE       $68DC  
;;  $68EE       $68EC  
;;  $68FE       $68FC  
;;  $6900       $68FE  
;;  $6902       $6900  
;;  $693F       $6963  
;;  $694E       $695D  
;;  $697D       $6965  
;;  $69D6       $6A14  
;;  $6A6A       $6A65  
;;  $6A8E       $6A5A  
;;  $6AB0       $6A97   $6AEA  
;;  $6ABC       $6C74  
;;  $6AEF       $6B45  
;;  $6AF4       $6B0D   $6B23   $6B5E  
;;  $6B04       $6B0B  
;;  $6B1F       $6B05  
;;  $6B25       $6B20  
;;  $6B47       $6B55  
;;  $6B53       $6B4F  
;;  $6C10       $6C0E  
;;  $6C7F       $6C7B  
;;  $6C81       $6C6C  
;;  $6C9F       $6CA8  
;;  $6CA2       $6CC2  
;;  $6CAF       $6CA0  
;;  $6CC4       $6CB4   $6CB8   $6CBC   $6CC0  
;;  $6CCF       $6CCB  
;;  $6D19       $6D19  
;;  $6D35       $6D3D  
;;  $6D3F       $6D36  
;;  $6D57       $6D47   $6D4D   $6D53  
;;  $6D74       $6D55  
;;  $6D78       $6D84  
;;  $6D82       $6D7E  
;;  $6D86       $6D79  
;;  $6DA6       $6DBB  
;;  $6DB0       $6DB9  
;;  $6DBD       $6DB3  
;;  $6DE6       $6DF5   $6DFC  
;;  $6DF7       $6DEC  
;;  $6DFE       $6DE8  
;;  $6E15       $6E28  
;;  $6E3A       $6E75  
;;  $6E53       $6E4E  
;;  $6E57       $6E4B   $6E51  
;;  $6E7E       $6E7E  
;;  $6ECE       $6C70  
;;  $6ED8       $6EFC  
;;  $6F05       $6F0A  
;;  $6F09       $6F06  
;;  $6F15       $6F29  
;; ======================================================================== ;;
