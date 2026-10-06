
        ORG     $5000
.HEADER:
        BIDECLE $5EB3           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $50A0           ; 5004  Ptr: Start of game
        BIDECLE $51BD           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $524D           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5036           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $0008   ; 500F  Color Stack init (0, 1)
        DECLE   $000E,  $0000   ; 5011  Color Stack init (2, 3)
        DECLE   $0004           ; 5013  Border color init

        DECLE   $0198,  $01A0,  $01B0,  $01C0   ; 5014   0198 01A0 01B0 01C0
        DECLE   $01D0,  $01E0,  $01E8,  $01F0   ; 5018   01D0 01E0 01E8 01F0
.TIMER:
        DECLE   $003E,  $0050,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $0043,  $0050,  $0001,  $0000; 5020  Timer dispatch/interval
        DECLE   $0048,  $0050,  $0014,  $0080; 5024  Timer dispatch/interval
        DECLE   $0058,  $0050,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $0069,  $0050,  $0019,  $0000; 502C  Timer dispatch/interval
        DECLE   $006E,  $0050,  $0001,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

.TITLE:
        DECLE   $0050                           ; 5036  Cartridge year
        STRING  "TENNIS"                        ; 5037  Title string
        DECLE   $0000                           ; 503D  

L_503E:
        PSHR    R5                              ; 503E   0275

        JSR     R5,     L_5283                  ; 503F   0004 0150 0283

        PULR    R7                              ; 5042   02B7

L_5043:
        PSHR    R5                              ; 5043   0275

        JSR     R5,     L_53C0                  ; 5044   0004 0150 03C0

        PULR    R7                              ; 5047   02B7

L_5048:
        PSHR    R5                              ; 5048   0275
        MVI     G_01A2, R0                      ; 5049   0280 01A2
        MVO     R0,     G_019F                  ; 504B   0240 019F
        CLRR    R0                              ; 504D   01C0
        MVO     R0,     G_0344                  ; 504E   0240 0344
        MVO     R0,     G_034C                  ; 5050   0240 034C
        MVO     R0,     G_0354                  ; 5052   0240 0354

        JSR     R5,     .EXEC.60A               ; 5054   0004 0114 020A

        PULR    R7                              ; 5057   02B7

L_5058:
        PSHR    R5                              ; 5058   0275

        JSR     R5,     L_5416                  ; 5059   0004 0154 0016
        JSR     R5,     L_57CD                  ; 505C   0004 0154 03CD
        JSR     R5,     L_5826                  ; 505F   0004 0158 0026
        JSR     R5,     L_5C0D                  ; 5062   0004 015C 000D
        JSR     R5,     .EXEC.4F1               ; 5065   0004 0114 00F1

        PULR    R7                              ; 5068   02B7

L_5069:
        PSHR    R5                              ; 5069   0275

        JSR     R5,     L_5C35                  ; 506A   0004 015C 0035

        PULR    R7                              ; 506D   02B7

L_506E:
        PSHR    R5                              ; 506E   0275

        JSR     R5,     L_5C9A                  ; 506F   0004 015C 009A
        JSR     R5,     L_5CD4                  ; 5072   0004 015C 00D4

        PULR    R7                              ; 5075   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5076   0000 0000 0000 0000
        DECLE   $0001,  $0002,  $0000,  $0300   ; 507A   0001 0002 0000 0300
        DECLE   $0000,  $00B0,  $0052,  $0006   ; 507E   0000 00B0 0052 0006
        DECLE   $0006,  $0000,  $0300,  $0000   ; 5082   0006 0000 0300 0000
        DECLE   $00B0,  $0052,  $0002,  $0018   ; 5086   00B0 0052 0002 0018
        DECLE   $0000,  $0000,  $0000,  $0000   ; 508A   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $001C,  $0000   ; 508E   0000 0001 001C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5092   0000 0000 0000 0000
        DECLE   $0001,  $0005,  $0000,  $0000   ; 5096   0001 0005 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0001   ; 509A   0000 0000 0000 0001
        DECLE   $0000,  $0000                   ; 509E   0000 0000
.START:
        PSHR    R5                              ; 50A0   0275

        JSR     R5,     L_5122                  ; 50A1   0004 0150 0122

        MVII    #$0040, R0                      ; 50A4   02B8 0040
        MVII    #$031D, R4                      ; 50A6   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 50A8   0004 0114 0338

        SDBD                                    ; 50AB   0001
        MVII    #$50BD, R4                      ; 50AC   02BC 00BD 0050
L_50AF:
        MVI@    R4,     R5                      ; 50AF   02A5
        DECLE   $00AD,  $0204,  $0009,  $037D   ; 50B0   00AD 0204 0009 037D
        DECLE   $0200,  $0205,  $0001,  $0001   ; 50B4   0200 0205 0001 0001

        MVI@    R4,     R0                      ; 50B8   02A0
        MVO@    R0,     R5                      ; 50B9   0268
        B       L_50AF                          ; 50BA   0220 000C
        PULR    R7                              ; 50BC   02B7

        SUB@    R3,     R6                      ; 50BD   031E
        RRC     R2,     2                       ; 50BE   0076
        RLC     R0,     1                       ; 50BF   0050
        SUB@    R3,     R7                      ; 50C0   031F

        DECLE   $0000,  $0040,  $0320,  $0000   ; 50C1   0000 0040 0320 0000
        DECLE   $0030,  $035C,  $0000           ; 50C5   0030 035C 0000

        GSWD    R0                              ; 50C8   0030
        SUB@    R4,     R5                      ; 50C9   0325
        INCR    R0                              ; 50CA   0008
        INCR    R0                              ; 50CB   0008
        SUB@    R4,     R6                      ; 50CC   0326
        MOVR    R1,     R3                      ; 50CD   008B
        RLC     R0,     1                       ; 50CE   0050
        ANDR    R0,     R5                      ; 50CF   0185
        INCR    R0                              ; 50D0   0008
        SUB@    R5,     R5                      ; 50D1   032D
        ADDR    R0,     R2                      ; 50D2   00C2
        COMR    R0                              ; 50D3   0018
        SUB@    R5,     R6                      ; 50D4   032E
        SARC    R1,     2                       ; 50D5   007D
        RLC     R0,     1                       ; 50D6   0050
        SUB@    R5,     R7                      ; 50D7   032F

        DECLE   $0000,  $0018,  $0330,  $0000   ; 50D8   0000 0018 0330 0000

        SWAP    R2,     1                       ; 50DC   0042
        CMPR    R3,     R5                      ; 50DD   015D
        DECR    R0                              ; 50DE   0010
        SUB@    R6,     R5                      ; 50DF   0335
        INCR    R0                              ; 50E0   0008
        COMR    R0                              ; 50E1   0018
        SUB@    R6,     R6                      ; 50E2   0336
        MOVR    R1,     R3                      ; 50E3   008B
        RLC     R0,     1                       ; 50E4   0050
        CMPR    R4,     R5                      ; 50E5   0165
        COMR    R0                              ; 50E6   0018
        SUBI    #$00D5, R5                      ; 50E7   033D 00D5
        COMR    R0                              ; 50E9   0018
        SUBI    #$007D, R6                      ; 50EA   033E 007D
        RLC     R0,     1                       ; 50EC   0050
        SUBI    #$0000, R7                      ; 50ED   033F 0000

L_50EF:
        MOVR    R1,     R3                      ; 50EF   008B
        DECLE   $0340,  $0000,  $002E,  $016D   ; 50F0   0340 0000 002E 016D
        DECLE   $0020,  $0345,  $0008,  $0018   ; 50F4   0020 0345 0008 0018
        DECLE   $0346,  $008B,  $0050,  $0175   ; 50F8   0346 008B 0050 0175
        DECLE   $0028,  $034E,  $0092,  $0050   ; 50FC   0028 034E 0092 0050
        DECLE   $0355,  $00C4,  $0091,  $0356   ; 5100   0355 00C4 0091 0356
        DECLE   $0099,  $0050,  $0357,  $0000   ; 5104   0099 0050 0357 0000
        DECLE   $0058,  $0358,  $0000           ; 5108   0058 0358 0000

        ADCR    R0                              ; 510B   0028
        SUBR    R3,     R1                      ; 510C   0119
        DECR    R2                              ; 510D   0012
        SUBR    R3,     R0                      ; 510E   0118
        RLC     R3,     2                       ; 510F   0057
        SUBR    R2,     R7                      ; 5110   0117

        EIS                                     ; 5111   0002
        SUBR    R2,     R6                      ; 5112   0116
        MOVR    R4,     R5                      ; 5113   00A5
        CMP@    R3,     R5                      ; 5114   035D
        ADDR    R5,     R0                      ; 5115   00E8
        SLLC    R0,     2                       ; 5116   005C
        ANDR    R7,     R4                      ; 5117   01BC
        ADD@    R3,     R7                      ; 5118   02DF

        DECLE   $01BD,  $02EB,  $01BA,  $0001   ; 5119   01BD 02EB 01BA 0001
        DECLE   $019F,  $00FF,  $01A0,  $000E   ; 511D   019F 00FF 01A0 000E
        DECLE   $0000                           ; 5121   0000
L_5122:
        PSHR    R5                              ; 5122   0275
        MVII    #$00F0, R0                      ; 5123   02B8 00F0
        MVII    #$0200, R4                      ; 5125   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5127   0004 0114 0338

        MVII    #$0244, R4                      ; 512A   02BC 0244
        SDBD                                    ; 512C   0001
        MVII    #$517B, R2                      ; 512D   02BA 007B 0051
        SDBD                                    ; 5130   0001
        MVII    #$0807, R3                      ; 5131   02BB 0007 0008
L_5134:
        MVI@    R2,     R0                      ; 5134   0290
        ANDI    #$03E0, R0                      ; 5135   03B8 03E0
        SLR     R0,     2                       ; 5137   0064
        ADDR    R3,     R0                      ; 5138   00D8
        MVO@    R0,     R4                      ; 5139   0260
        MVI@    R2,     R0                      ; 513A   0290
        ANDI    #$001F, R0                      ; 513B   03B8 001F
        SLL     R0,     2                       ; 513D   004C
        SLL     R0,     1                       ; 513E   0048
        ADDR    R3,     R0                      ; 513F   00D8
        MVO@    R0,     R4                      ; 5140   0260
        INCR    R2                              ; 5141   000A
        CMPI    #$02C8, R4                      ; 5142   037C 02C8
        BLT     L_5134                          ; 5144   0225 0011

        SDBD                                    ; 5146   0001
        MVII    #$08DA, R0                      ; 5147   02B8 00DA 0008
        MVO     R0,     .BTAB.D1                ; 514A   0240 02D1
        MVII    #$0020, R0                      ; 514C   02B8 0020
        SWAP    R0,     1                       ; 514E   0040
        MVO     R0,     .BTAB.14                ; 514F   0240 0214
        MVO     R0,     .BTAB.3C                ; 5151   0240 023C
        SDBD                                    ; 5153   0001
        MVII    #$069A, R0                      ; 5154   02B8 009A 0006
        MVO     R0,     .BTAB.15                ; 5157   0240 0215
        MVO     R0,     .BTAB.26                ; 5159   0240 0226
        DECR    R0                              ; 515B   0010
        MVO     R0,     .BTAB.29                ; 515C   0240 0229
        MVO     R0,     .BTAB.3A                ; 515E   0240 023A
        SDBD                                    ; 5160   0001
        MVII    #$08E7, R0                      ; 5161   02B8 00E7 0008
        MVO     R0,     .BTAB.18                ; 5164   0240 0218
        MVO     R0,     .BTAB.2C                ; 5166   0240 022C
        MVII    #$0087, R0                      ; 5168   02B8 0087
        MVO     R0,     .BTAB.E0                ; 516A   0240 02E0
        MVO     R0,     .BTAB.EC                ; 516C   0240 02EC
        MVII    #$0204, R4                      ; 516E   02BC 0204
        SDBD                                    ; 5170   0001
        MVII    #$0933, R0                      ; 5171   02B8 0033 0009
        MVII    #$000B, R1                      ; 5174   02B9 000B
L_5176:
        MVO@    R0,     R4                      ; 5176   0260
        DECR    R1                              ; 5177   0011
        BNEQ    L_5176                          ; 5178   022C 0003
        PULR    R7                              ; 517A   02B7

        DECLE   $0006,  $0000,  $0000,  $0000   ; 517B   0006 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0202   ; 517F   0000 0000 0000 0202
        DECLE   $0047,  $0042,  $0045,  $0042   ; 5183   0047 0042 0045 0042
        DECLE   $0042,  $0202,  $0047,  $0000   ; 5187   0042 0202 0047 0000
        DECLE   $000F,  $0000                   ; 518B   000F 0000
L_518D:
        DECR    R7                              ; 518D   0017

        DECLE   $0000,  $0003,  $0000,  $0000   ; 518E   0000 0003 0000 0000
        DECLE   $01C0,  $0000,  $0300,  $0008   ; 5192   01C0 0000 0300 0008
        DECLE   $0000,  $0015,  $0021,  $0024   ; 5196   0000 0015 0021 0024
        DECLE   $0021,  $0021,  $0180,  $0000   ; 519A   0021 0021 0180 0000
        DECLE   $0220,  $0009,  $0000,  $000B   ; 519E   0220 0009 0000 000B
        DECLE   $0000,  $0003,  $0000,  $0000   ; 51A2   0000 0003 0000 0000
        DECLE   $0280,  $0000,  $0240,  $001A   ; 51A6   0280 0000 0240 001A
        DECLE   $0000,  $0014,  $0000,  $0003   ; 51AA   0000 0014 0000 0003
        DECLE   $0000,  $0000,  $0160,  $0000   ; 51AE   0000 0000 0160 0000
        DECLE   $0320,  $0141,  $0021,  $002D   ; 51B2   0320 0141 0021 002D
        DECLE   $0021,  $0024,  $0021,  $0021   ; 51B6   0021 0024 0021 0021
        DECLE   $02C1,  $0021,  $0033           ; 51BA   02C1 0021 0033
.GFX_LIST_51BD:
        DECLE   $0001,  $0001,  $0001,  $0001   ; 51BD  CART PIC #00
        DECLE   $0001,  $0001,  $0001,  $00FD   ; 51C1  
        DECLE   $0001,  $0001,  $0001,  $00FD   ; 51C5  CART PIC #01
        DECLE   $0001,  $0001,  $0001,  $0001   ; 51C9  
        DECLE   $0004,  $0004,  $0004,  $0004   ; 51CD  CART PIC #02
        DECLE   $0008,  $0008,  $0008,  $000F   ; 51D1  
        DECLE   $0001,  $0001,  $0001,  $0001   ; 51D5  CART PIC #03
        DECLE   $0002,  $0002,  $0002,  $0003   ; 51D9  
        DECLE   $0020,  $0020,  $0020,  $0020   ; 51DD  CART PIC #04
        DECLE   $0020,  $0020,  $0020,  $00FF   ; 51E1  
        DECLE   $0000,  $0018,  $0024,  $0024   ; 51E5  CART PIC #05
        DECLE   $0024,  $0024,  $0018,  $0000   ; 51E9  
        DECLE   $0000,  $0018,  $0008,  $0008   ; 51ED  CART PIC #06
        DECLE   $0008,  $0008,  $001C,  $0000   ; 51F1  
        DECLE   $0000,  $0018,  $0024,  $0004   ; 51F5  CART PIC #07
        DECLE   $0008,  $0010,  $003C,  $0000   ; 51F9  
        DECLE   $0000,  $0018,  $0024,  $0008   ; 51FD  CART PIC #08
        DECLE   $0004,  $0024,  $0018,  $0000   ; 5201  
        DECLE   $0000,  $0008,  $0018,  $0028   ; 5205  CART PIC #09
        DECLE   $0048,  $007C,  $0008,  $0000   ; 5209  
        DECLE   $0000,  $003C,  $0020,  $0038   ; 520D  CART PIC #0A
        DECLE   $0004,  $0004,  $0038,  $0000   ; 5211  
        DECLE   $0000,  $001C,  $0020,  $0038   ; 5215  CART PIC #0B
        DECLE   $0024,  $0024,  $0018,  $0000   ; 5219  
        DECLE   $0000,  $003C,  $0004,  $0004   ; 521D  CART PIC #0C
        DECLE   $0008,  $0010,  $0010,  $0000   ; 5221  
        DECLE   $0000,  $0018,  $0024,  $0018   ; 5225  CART PIC #0D
        DECLE   $0024,  $0024,  $0018,  $0000   ; 5229  
        DECLE   $0000,  $0018,  $0024,  $0024   ; 522D  CART PIC #0E
        DECLE   $001C,  $0004,  $0038,  $0000   ; 5231  
        DECLE   $0070,  $00A8,  $00F8,  $0070   ; 5235  CART PIC #0F
        DECLE   $000E,  $0015,  $001F,  $000E   ; 5239  
        DECLE   $00F0,  $0058,  $00F8,  $0070   ; 523D  CART PIC #10
        DECLE   $001E,  $000B,  $001F,  $000E   ; 5241  
        DECLE   $0078,  $00D0,  $00F8,  $0070   ; 5245  CART PIC #11
        DECLE   $000F,  $001A,  $001F,  $000E   ; 5249  
.GRAM_INIT_524D:
        DECLE   $002C           ; 524D  # of GRAM cards to init
        DECLE   $0001,  $0010   ; 524E  #00-00:  GROM #00-00 ----
        DECLE   $001F,  $0070   ; 5250  #01-01:  GROM #0F-0F ----
        DECLE   $001B,  $0070   ; 5252  #02-02:  GROM #0D-0D ----
        DECLE   $0003,  $0070   ; 5254  #03-03:  GROM #01-01 ----
        DECLE   $0001,  $0080   ; 5256  #04-05:  CART #00-01 ----
        DECLE   $0051,  $0002   ; 5258  #06   :  Algo #1
        DECLE   $0301,  $0199   ; 525A  #07   :  Algo #2
        DECLE   $0004           ; 525C  #08   :  CART #02    ----
        DECLE   $0053,  $0058   ; 525D  #09-09:  GROM #29-29 ---R
        DECLE   $0006           ; 525F  #0A   :  CART #03    ----
        DECLE   $0007,  $0070   ; 5260  #0B-0B:  GROM #03-03 ----
        DECLE   $0301,  $01E3   ; 5262  #0C   :  Algo #2
        DECLE   $0008           ; 5264  #0D   :  CART #04    ----
        DECLE   $0001,  $0012   ; 5265  #0E   :  Algo #1
        DECLE   $005B,  $0058   ; 5267  #0F-0F:  GROM #2D-2D ---R
        DECLE   $020F,  $01C0   ; 5269  #10-13:  GRAM #07-0A X---
        DECLE   $0217,  $0240   ; 526B  #14-18:  GRAM #0B-0F X---
        DECLE   $011F,  $0040   ; 526D  #19-19:  GRAM #0F-0F -Y--
        DECLE   $031F,  $0040   ; 526F  #1A-1A:  GRAM #0F-0F XY--
        DECLE   $0101,  $0224   ; 5271  #1B   :  4x4 tile
        DECLE   $000A           ; 5273  #1C   :  CART #05    ----
        DECLE   $000C           ; 5274  #1D   :  CART #06    ----
        DECLE   $000E           ; 5275  #1E   :  CART #07    ----
        DECLE   $0010           ; 5276  #1F   :  CART #08    ----
        DECLE   $0012           ; 5277  #20   :  CART #09    ----
        DECLE   $0014           ; 5278  #21   :  CART #0A    ----
        DECLE   $0016           ; 5279  #22   :  CART #0B    ----
        DECLE   $0018           ; 527A  #23   :  CART #0C    ----
        DECLE   $001A           ; 527B  #24   :  CART #0D    ----
        DECLE   $001C           ; 527C  #25   :  CART #0E    ----
        DECLE   $001E           ; 527D  #26   :  CART #0F    ----
        DECLE   $0020           ; 527E  #27   :  CART #10    ----
        DECLE   $0022           ; 527F  #28   :  CART #11    ----
        DECLE   $0024           ; 5280  #29   :  CART #12    ----
        DECLE   $0026           ; 5281  #2A   :  CART #13    ----
        DECLE   $0028           ; 5282  #2B   :  CART #14    ----

L_5283:
        PSHR    R5                              ; 5283   0275
        CLRR    R1                              ; 5284   01C9

        JSR     R5,     L_5885                  ; 5285   0004 0158 0085
        JSR     R5,     L_529A                  ; 5288   0004 0150 029A
        JSR     R5,     L_58A0                  ; 528B   0004 0158 00A0

        MVII    #$0001, R1                      ; 528E   02B9 0001

        JSR     R5,     L_5885                  ; 5290   0004 0158 0085
        JSR     R5,     L_529A                  ; 5293   0004 0150 029A
        JSR     R5,     L_58A0                  ; 5296   0004 0158 00A0

        PULR    R7                              ; 5299   02B7

L_529A:
        PSHR    R5                              ; 529A   0275
        MVI     G_0193, R0                      ; 529B   0280 0193
        TSTR    R0                              ; 529D   0080
        BNEQ    L_52AF                          ; 529E   020C 000F

        MVI     G_01B3, R0                      ; 52A0   0280 01B3
        TSTR    R0                              ; 52A2   0080
        BNEQ    L_5348                          ; 52A3   020C 00A3

        MVI     G_01B1, R0                      ; 52A5   0280 01B1
        TSTR    R0                              ; 52A7   0080
        BNEQ    L_5307                          ; 52A8   020C 005D

        MVI     G_01B4, R0                      ; 52AA   0280 01B4
        TSTR    R0                              ; 52AC   0080
        BNEQ    L_52CC                          ; 52AD   020C 001D
L_52AF:
        PULR    R7                              ; 52AF   02B7

        PSHR    R5                              ; 52B0   0275
        MOVR    R0,     R1                      ; 52B1   0081
        SLR     R1,     2                       ; 52B2   0065

        JSR     R5,     L_5885                  ; 52B3   0004 0158 0085
        JSR     R5,     L_52BD                  ; 52B6   0004 0150 02BD
        JSR     R5,     L_58A0                  ; 52B9   0004 0158 00A0

        PULR    R7                              ; 52BC   02B7

L_52BD:
        PSHR    R5                              ; 52BD   0275
        MVI     G_0193, R0                      ; 52BE   0280 0193
        CMPI    #$0002, R0                      ; 52C0   0378 0002
        BLT     L_52E9                          ; 52C2   0205 0025
        BEQ     L_532D                          ; 52C4   0204 0067

        CMPI    #$0003, R0                      ; 52C6   0378 0003
        BEQ     L_5344                          ; 52C8   0204 007A
        B       L_5364                          ; 52CA   0200 0098

L_52CC:
        CMP     G_01A2, R1                      ; 52CC   0341 01A2
        BNEQ    L_52E8                          ; 52CE   020C 0018

        CLRR    R0                              ; 52D0   01C0
        MVO     R0,     G_01B4                  ; 52D1   0240 01B4
        MVII    #$0001, R0                      ; 52D3   02B8 0001
        MVO     R0,     G_0193                  ; 52D5   0240 0193
        MVI     G_01B5, R2                      ; 52D7   0282 01B5
        SWAP    R2,     1                       ; 52D9   0042
        XOR     G_01B6, R2                      ; 52DA   03C2 01B6
        MVII    #$0014, R3                      ; 52DC   02BB 0014

        JSR     R5,     L_53A7                  ; 52DE   0004 0150 03A7

        SUBI    #$0004, R1                      ; 52E1   0339 0004
        SDBD                                    ; 52E3   0001
        MVII    #$5084, R0                      ; 52E4   02B8 0084 0050
        MVO@    R0,     R1                      ; 52E7   0248
L_52E8:
        PULR    R7                              ; 52E8   02B7

L_52E9:
        JSR     R5,     L_53B3                  ; 52E9   0004 0150 03B3

        SUBI    #$0005, R4                      ; 52EC   033C 0005
        SDBD                                    ; 52EE   0001
        MVII    #$507D, R0                      ; 52EF   02B8 007D 0050
        MVO@    R0,     R4                      ; 52F2   0260
        MVI     G_01B5, R0                      ; 52F3   0280 01B5
        SWAP    R0,     1                       ; 52F5   0040
        MVO@    R0,     R4                      ; 52F6   0260
        MVI     G_01B6, R0                      ; 52F7   0280 01B6
        SWAP    R0,     1                       ; 52F9   0040
        MVO@    R0,     R4                      ; 52FA   0260
        MVII    #$0002, R0                      ; 52FB   02B8 0002
        MVO     R0,     G_01A1                  ; 52FD   0240 01A1
        SDBD                                    ; 52FF   0001
        MVII    #$5024, R1                      ; 5300   02B9 0024 0050

        JSR     R5,     X_TIMER_START           ; 5303   0004 0118 0044

        PULR    R7                              ; 5306   02B7

L_5307:
        MVII    #$0002, R0                      ; 5307   02B8 0002
        MVO     R0,     G_0193                  ; 5309   0240 0193
        SDBD                                    ; 530B   0001
        MVII    #$5710, R2                      ; 530C   02BA 0010 0057
        TSTR    R1                              ; 530F   0089
        BEQ     L_531F                          ; 5310   0204 000D

        XORI    #$0070, R2                      ; 5312   03FA 0070
        CLRR    R0                              ; 5314   01C0
        MVO     R0,     G_01B1                  ; 5315   0240 01B1
        MVI     G_01BC, R0                      ; 5317   0280 01BC
        MVI     G_01BD, R1                      ; 5319   0281 01BD
        MVO     R0,     G_01BD                  ; 531B   0240 01BD
        MVO     R1,     G_01BC                  ; 531D   0241 01BC
L_531F:
        MVI     G_0330, R0                      ; 531F   0280 0330
        CMP     G_0340, R0                      ; 5321   0340 0340
        BLE     L_5327                          ; 5323   0206 0002

        XORI    #$0070, R2                      ; 5325   03FA 0070
L_5327:
        MVII    #$0023, R3                      ; 5327   02BB 0023

        JSR     R5,     L_53A7                  ; 5329   0004 0150 03A7

        PULR    R7                              ; 532C   02B7

L_532D:
        MVII    #$0003, R0                      ; 532D   02B8 0003
        MVO     R0,     G_0193                  ; 532F   0240 0193
        SDBD                                    ; 5331   0001
        MVII    #$1842, R2                      ; 5332   02BA 0042 0018
        MVI     G_018E, R0                      ; 5335   0280 018E
        TSTR    R0                              ; 5337   0080
        BNEQ    L_533E                          ; 5338   020C 0004

        SDBD                                    ; 533A   0001
        MVII    #$8B2E, R2                      ; 533B   02BA 002E 008B
L_533E:
        MVII    #$0023, R3                      ; 533E   02BB 0023

        JSR     R5,     L_53A7                  ; 5340   0004 0150 03A7

        PULR    R7                              ; 5343   02B7

L_5344:
        JSR     R5,     L_53B3                  ; 5344   0004 0150 03B3

        PULR    R7                              ; 5347   02B7

L_5348:
        XORI    #$0001, R1                      ; 5348   03F9 0001
        MVO     R1,     G_01B3                  ; 534A   0241 01B3
        MVII    #$0004, R0                      ; 534C   02B8 0004
        MVO     R0,     G_0193                  ; 534E   0240 0193
        SLL     R1,     2                       ; 5350   004D
        ADDI    #$0050, R1                      ; 5351   02F9 0050
        MVII    #$004F, R2                      ; 5353   02BA 004F

        JSR     R5,     L_5955                  ; 5355   0004 0158 0155

        BNC     L_535C                          ; 5358   0209 0002

        MVII    #$0059, R2                      ; 535A   02BA 0059
L_535C:
        SWAP    R2,     1                       ; 535C   0042
        ADDR    R1,     R2                      ; 535D   00CA
        MVII    #$001E, R3                      ; 535E   02BB 001E

        JSR     R5,     L_53A7                  ; 5360   0004 0150 03A7

        PULR    R7                              ; 5363   02B7

L_5364:
        MVI     G_032C, R4                      ; 5364   0284 032C
        ADDI    #$0003, R4                      ; 5366   02FC 0003
        MVI@    R4,     R2                      ; 5368   02A2
        INCR    R4                              ; 5369   000C
        MVII    #$0000, R0                      ; 536A   02B8 0000
        MVO@    R0,     R4                      ; 536C   0260
        CLRR    R0                              ; 536D   01C0
        MVO     R0,     G_0196                  ; 536E   0240 0196
        MVII    #$00F0, R0                      ; 5370   02B8 00F0
        MVO     R0,     G_0116                  ; 5372   0240 0116
        SWAP    R2,     1                       ; 5374   0042
        ANDI    #$00FF, R2                      ; 5375   03BA 00FF
        SDBD                                    ; 5377   0001
        XORI    #$D000, R2                      ; 5378   03FA 0000 00D0
        MVII    #$001E, R3                      ; 537B   02BB 001E
        MVI     G_032C, R1                      ; 537D   0281 032C

        JSR     R5,     .EXEC.9A3               ; 537F   0004 0118 01A3

        MVII    #$0080, R3                      ; 5382   02BB 0080
        SWAP    R3,     1                       ; 5384   0043
        MVI     G_032C, R1                      ; 5385   0281 032C
        MVI@    R1,     R0                      ; 5387   0288
        XORR    R3,     R0                      ; 5388   01D8
        MVO@    R0,     R1                      ; 5389   0248
        MVI     G_032D, R0                      ; 538A   0280 032D
        MVI     G_033D, R1                      ; 538C   0281 033D
        MOVR    R1,     R2                      ; 538E   008A
        XORR    R0,     R2                      ; 538F   01C2
        BMI     L_53A6                          ; 5390   020B 0014

        XORR    R3,     R0                      ; 5392   01D8
        SDBD                                    ; 5393   0001
        ANDI    #$FDFF, R0                      ; 5394   03B8 00FF 00FD
        MVO     R0,     G_032D                  ; 5397   0240 032D
        XORR    R3,     R1                      ; 5399   01D9
        SDBD                                    ; 539A   0001
        ANDI    #$FDFF, R1                      ; 539B   03B9 00FF 00FD
        MVO     R1,     G_033D                  ; 539E   0241 033D
        MVII    #$03F0, R0                      ; 53A0   02B8 03F0
        MVO     R0,     G_0332                  ; 53A2   0240 0332
        MVO     R0,     G_0342                  ; 53A4   0240 0342
L_53A6:
        PULR    R7                              ; 53A6   02B7

L_53A7:
        PSHR    R5                              ; 53A7   0275
        MVI     G_032C, R1                      ; 53A8   0281 032C

        JSR     R5,     .EXEC.9A1               ; 53AA   0004 0118 01A1

        ADDI    #$0005, R1                      ; 53AD   02F9 0005
        MVII    #$03F0, R0                      ; 53AF   02B8 03F0
        MVO@    R0,     R1                      ; 53B1   0248
        PULR    R7                              ; 53B2   02B7

L_53B3:
        PSHR    R5                              ; 53B3   0275
        MVI     G_032C, R4                      ; 53B4   0284 032C
        ADDI    #$0004, R4                      ; 53B6   02FC 0004
        CLRR    R0                              ; 53B8   01C0
        MVO@    R0,     R4                      ; 53B9   0260
        MVO     R0,     G_0193                  ; 53BA   0240 0193
        MVII    #$0009, R0                      ; 53BC   02B8 0009
        MVO@    R0,     R4                      ; 53BE   0260
        PULR    R7                              ; 53BF   02B7

L_53C0:
        PSHR    R5                              ; 53C0   0275
        CLRR    R1                              ; 53C1   01C9

        JSR     R5,     L_5885                  ; 53C2   0004 0158 0085
        JSR     R5,     L_53D7                  ; 53C5   0004 0150 03D7
        JSR     R5,     L_58A0                  ; 53C8   0004 0158 00A0

        MVII    #$0001, R1                      ; 53CB   02B9 0001

        JSR     R5,     L_5885                  ; 53CD   0004 0158 0085
        JSR     R5,     L_53D7                  ; 53D0   0004 0150 03D7
        JSR     R5,     L_58A0                  ; 53D3   0004 0158 00A0

        PULR    R7                              ; 53D6   02B7

L_53D7:
        PSHR    R5                              ; 53D7   0275
        MVI     G_0194, R0                      ; 53D8   0280 0194
        TSTR    R0                              ; 53DA   0080
        BEQ     L_53E4                          ; 53DB   0204 0007

        MOVR    R0,     R2                      ; 53DD   0082
        ANDI    #$0020, R2                      ; 53DE   03BA 0020
        BNEQ    L_53FA                          ; 53E0   020C 0018
        BEQ     L_53E5                          ; 53E2   0204 0001
L_53E4:
        PULR    R7                              ; 53E4   02B7

L_53E5:
        MVI     G_0196, R3                      ; 53E5   0283 0196
        ANDI    #$0010, R0                      ; 53E7   03B8 0010
        BEQ     L_53EF                          ; 53E9   0204 0004

        ADDI    #$0018, R3                      ; 53EB   02FB 0018
        B       L_53F1                          ; 53ED   0200 0002

L_53EF:
        SUBI    #$0018, R3                      ; 53EF   033B 0018
L_53F1:
        ANDI    #$003F, R3                      ; 53F1   03BB 003F
        MVO     R3,     G_0196                  ; 53F3   0243 0196
        XORI    #$0028, R0                      ; 53F5   03F8 0028
        MVO     R0,     G_0194                  ; 53F7   0240 0194
        PULR    R7                              ; 53F9   02B7

L_53FA:
        MOVR    R0,     R2                      ; 53FA   0082
        ANDI    #$000F, R0                      ; 53FB   03B8 000F
        MVI     G_0196, R3                      ; 53FD   0283 0196
        ANDI    #$0010, R2                      ; 53FF   03BA 0010
        BEQ     L_5407                          ; 5401   0204 0004

        SUBI    #$0003, R3                      ; 5403   033B 0003
        B       L_5409                          ; 5405   0200 0002

L_5407:
        ADDI    #$0003, R3                      ; 5407   02FB 0003
L_5409:
        ANDI    #$003F, R3                      ; 5409   03BB 003F
        MVO     R3,     G_0196                  ; 540B   0243 0196
        DECR    R0                              ; 540D   0010
        BEQ     L_5413                          ; 540E   0204 0003

        ADDR    R2,     R0                      ; 5410   00D0
        XORI    #$0020, R0                      ; 5411   03F8 0020
L_5413:
        MVO     R0,     G_0194                  ; 5413   0240 0194
        PULR    R7                              ; 5415   02B7

L_5416:
        PSHR    R5                              ; 5416   0275
        MVI     G_019F, R1                      ; 5417   0281 019F
        SWAP    R1,     2                       ; 5419   0045
        BPL     L_54CA                          ; 541A   0203 00AE

        MVI     G_035C, R0                      ; 541C   0280 035C
        CLRR    R1                              ; 541E   01C9
        SDBD                                    ; 541F   0001
        CMPI    #$4000, R0                      ; 5420   0378 0000 0040
        BLT     L_5426                          ; 5423   0205 0001

        INCR    R1                              ; 5425   0009
L_5426:
        MOVR    R1,     R0                      ; 5426   0088
        XOR     G_019B, R0                      ; 5427   03C0 019B
        MVO     R1,     G_019B                  ; 5429   0241 019B
        MVI     G_019B, R1                      ; 542B   0281 019B
        ADD     G_01A0, R1                      ; 542D   02C1 01A0
        NEGR    R1                              ; 542F   0021
        ADD     G_0354, R1                      ; 5430   02C1 0354
        MVO     R1,     G_0354                  ; 5432   0241 0354
        ADD     G_033C, R1                      ; 5434   02C1 033C
        MVO     R1,     G_033C                  ; 5436   0241 033C
        BPL     L_5447                          ; 5438   0203 000D

        CLRR    R1                              ; 543A   01C9
        MVO     R1,     G_033C                  ; 543B   0241 033C

        JSR     R5,     L_553F                  ; 543D   0004 0154 013F
        JSR     R5,     L_54DF                  ; 5440   0004 0154 00DF
        DECLE   $000C                           ; 5443   000C

        NEGR    R2                              ; 5444   0022
        MVO     R2,     G_0354                  ; 5445   0242 0354
L_5447:
        MVI     G_035C, R0                      ; 5447   0280 035C
        SLR     R0,     1                       ; 5449   0060
        MVII    #$034C, R2                      ; 544A   02BA 034C
        MVI@    R2,     R1                      ; 544C   0291
        SLL     R1,     2                       ; 544D   004D
        ADDR    R0,     R1                      ; 544E   00C1

        JSR     R5,     L_54FD                  ; 544F   0004 0154 00FD
        BIDECLE $1000                           ; 5452   0000 0010

        BC      L_545B                          ; 5454   0201 0005

        JSR     R5,     L_54FD                  ; 5456   0004 0154 00FD
        BIDECLE $3400                           ; 5459   0000 0034
L_545B:
        SLL     R1,     1                       ; 545B   0049
        MVO     R1,     G_035C                  ; 545C   0241 035C
        BNC     L_5463                          ; 545E   0209 0003

        JSR     R5,     L_562C                  ; 5460   0004 0154 022C

L_5463:
        MVI     G_031F, R0                      ; 5463   0280 031F
        SLR     R0,     1                       ; 5465   0060
        MVII    #$0344, R2                      ; 5466   02BA 0344
        MVI@    R2,     R1                      ; 5468   0291
        SLL     R1,     2                       ; 5469   004D
        ADDR    R0,     R1                      ; 546A   00C1

        JSR     R5,     L_550F                  ; 546B   0004 0154 010F

        BNC     L_5475                          ; 546E   0209 0005

        JSR     R5,     L_562C                  ; 5470   0004 0154 022C

        B       L_54C4                          ; 5473   0200 004F

L_5475:
        MVI     G_035C, R3                      ; 5475   0283 035C
        SWAP    R3,     1                       ; 5477   0043
        ANDI    #$00FF, R3                      ; 5478   03BB 00FF
        CMPI    #$0029, R3                      ; 547A   037B 0029
        BLT     L_54C1                          ; 547C   0205 0043

        CMPI    #$005D, R3                      ; 547E   037B 005D
        BGT     L_54C1                          ; 5480   020E 003F

        MVI     G_033C, R3                      ; 5482   0283 033C
        SDBD                                    ; 5484   0001
        CMPI    #$0600, R3                      ; 5485   037B 0000 0006
        BGT     L_54C1                          ; 5488   020E 0037

        JSR     R5,     L_54FD                  ; 548A   0004 0154 00FD
        BIDECLE $2A00                           ; 548D   0000 002A
        DECLE   $0209,  $0030,  $0271,  $0004   ; 548F   0209 0030 0271 0004
        DECLE   $015C,  $029E                   ; 5493   015C 029E

        PULR    R1                              ; 5495   02B1
        MVI     G_033C, R3                      ; 5496   0283 033C
        SDBD                                    ; 5498   0001
        CMPI    #$0580, R3                      ; 5499   037B 0080 0005
        BLT     L_54C1                          ; 549C   0205 0023

        MVI     G_0344, R0                      ; 549E   0280 0344
        NEGR    R0                              ; 54A0   0020
        MVO     R0,     G_0344                  ; 54A1   0240 0344
        MVII    #$002A, R1                      ; 54A3   02B9 002A
        SWAP    R1,     1                       ; 54A5   0041
        MVI     G_0354, R0                      ; 54A6   0280 0354
        TSTR    R0                              ; 54A8   0080
        BPL     L_54AC                          ; 54A9   0203 0001

        NEGR    R0                              ; 54AB   0020
L_54AC:
        MVO     R0,     G_0354                  ; 54AC   0240 0354
        ADDI    #$0002, R3                      ; 54AE   02FB 0002
        MVO     R3,     G_033C                  ; 54B0   0243 033C
        MVII    #$0007, R0                      ; 54B2   02B8 0007

        JSR     R5,     X_RAND2                 ; 54B4   0004 0114 029E

        ADDI    #$0006, R0                      ; 54B7   02F8 0006
        MOVR    R0,     R4                      ; 54B9   0084

        JSR     R5,     L_54E0                  ; 54BA   0004 0154 00E0

        MVI     G_01A4, R0                      ; 54BD   0280 01A4
        MVO     R0,     G_01A7                  ; 54BF   0240 01A7
L_54C1:
        SLL     R1,     1                       ; 54C1   0049
        MVO     R1,     G_031F                  ; 54C2   0241 031F
L_54C4:
        MVI     G_035C, R0                      ; 54C4   0280 035C
        SUB     G_033C, R0                      ; 54C6   0300 033C
        MVO     R0,     G_0320                  ; 54C8   0240 0320
L_54CA:
        MVI     G_019C, R0                      ; 54CA   0280 019C
        SWAP    R0,     1                       ; 54CC   0040
        SDBD                                    ; 54CD   0001
        XORI    #$0806, R0                      ; 54CE   03F8 0006 0008
        MVO     R0,     G_031D                  ; 54D1   0240 031D
        MVII    #$0010, R0                      ; 54D3   02B8 0010
        MVO     R0,     G_019C                  ; 54D5   0240 019C
        MVI     G_019D, R0                      ; 54D7   0280 019D
        MVO     R0,     G_0322                  ; 54D9   0240 0322
        CLRR    R0                              ; 54DB   01C0
        MVO     R0,     G_019D                  ; 54DC   0240 019D
        PULR    R7                              ; 54DE   02B7

L_54DF:
        MVI@    R5,     R4                      ; 54DF   02AC
L_54E0:
        PSHR    R5                              ; 54E0   0275
        PSHR    R0                              ; 54E1   0270
        PSHR    R1                              ; 54E2   0271
        MVII    #$0344, R3                      ; 54E3   02BB 0344
L_54E5:
        MVI@    R3,     R0                      ; 54E5   0298
        MOVR    R4,     R1                      ; 54E6   00A1

        JSR     R5,     X_MPY                   ; 54E7   0004 011C 01DC

        SAR     R2,     2                       ; 54EA   006E
        SAR     R2,     2                       ; 54EB   006E
        BEQ     L_54F3                          ; 54EC   0204 0005

        DECR    R2                              ; 54EE   0012
        BPL     L_54F3                          ; 54EF   0203 0002

        ADDI    #$0002, R2                      ; 54F1   02FA 0002
L_54F3:
        MVO@    R2,     R3                      ; 54F3   025A
        ADDI    #$0008, R3                      ; 54F4   02FB 0008
        CMPI    #$0354, R3                      ; 54F6   037B 0354
        BLE     L_54E5                          ; 54F8   0226 0014

        PULR    R1                              ; 54FA   02B1
        PULR    R0                              ; 54FB   02B0
        PULR    R7                              ; 54FC   02B7

L_54FD:
        SDBD                                    ; 54FD   0001
        MVI@    R5,     R3                      ; 54FE   02AB
        PSHR    R5                              ; 54FF   0275

        JSR     R5,     L_5535                  ; 5500   0004 0154 0135

        BNC     L_550E                          ; 5503   0209 0009

        MOVR    R0,     R1                      ; 5505   0081
        MVI@    R2,     R5                      ; 5506   0295
        NEGR    R5                              ; 5507   0025
        MVO@    R5,     R2                      ; 5508   0255

        JSR     R5,     L_54DF                  ; 5509   0004 0154 00DF
        DECLE   $0008                           ; 550C   0008

        SETC                                    ; 550D   0007
L_550E:
        PULR    R7                              ; 550E   02B7

L_550F:
        PSHR    R5                              ; 550F   0275
        SDBD                                    ; 5510   0001
        MVII    #$7800, R3                      ; 5511   02BB 0000 0078

        JSR     R5,     L_5535                  ; 5514   0004 0154 0135

        BC      L_5522                          ; 5517   0201 0009

        SDBD                                    ; 5519   0001
        MVII    #$5C00, R3                      ; 551A   02BB 0000 005C

        JSR     R5,     L_5535                  ; 551D   0004 0154 0135

        BNC     L_5534                          ; 5520   0209 0012

L_5522:
        MVII    #$0054, R0                      ; 5522   02B8 0054
        SWAP    R0,     1                       ; 5524   0040
        MVO     R0,     G_031F                  ; 5525   0240 031F
        CLRR    R0                              ; 5527   01C0
        MVO     R0,     G_035C                  ; 5528   0240 035C
        MVO     R0,     G_033C                  ; 552A   0240 033C
        CLRR    R0                              ; 552C   01C0
        MVO     R0,     G_0344                  ; 552D   0240 0344
        MVO     R0,     G_034C                  ; 552F   0240 034C
        MVO     R0,     G_0354                  ; 5531   0240 0354
        SETC                                    ; 5533   0007
L_5534:
        PULR    R7                              ; 5534   02B7

L_5535:
        PSHR    R5                              ; 5535   0275
        PSHR    R0                              ; 5536   0270
        PSHR    R1                              ; 5537   0271
        SUBR    R3,     R0                      ; 5538   0118
        SUBR    R3,     R1                      ; 5539   0119
        XORR    R1,     R0                      ; 553A   01C8
        SLLC    R0,     1                       ; 553B   0058
        PULR    R1                              ; 553C   02B1
        PULR    R0                              ; 553D   02B0
        PULR    R7                              ; 553E   02B7

L_553F:
        PSHR    R5                              ; 553F   0275
        MVI     G_01A1, R0                      ; 5540   0280 01A1
        CMPI    #$0003, R0                      ; 5542   0378 0003
        BEQ     L_55F6                          ; 5544   0204 00B0

        MVI     G_01A8, R0                      ; 5546   0280 01A8
        TSTR    R0                              ; 5548   0080
        BEQ     L_55F5                          ; 5549   0204 00AA

        JSR     R5,     L_5E94                  ; 554B   0004 015C 0294

        MVI     G_01AA, R0                      ; 554E   0280 01AA
        INCR    R0                              ; 5550   0008
        MVO     R0,     G_01AA                  ; 5551   0240 01AA
        CMPI    #$0001, R0                      ; 5553   0378 0001
        BGT     L_55BC                          ; 5555   020E 0065

        MVI     G_01A4, R0                      ; 5557   0280 01A4
        TSTR    R0                              ; 5559   0080
        BEQ     L_5567                          ; 555A   0204 000B

        SDBD                                    ; 555C   0001
        MVII    #$561C, R4                      ; 555D   02BC 001C 0056
        MVI     G_01A6, R0                      ; 5560   0280 01A6
        PSHR    R0                              ; 5562   0270
        SLL     R0,     2                       ; 5563   004C
        ADDR    R0,     R4                      ; 5564   00C4
        B       L_5577                          ; 5565   0200 0010

L_5567:
        SDBD                                    ; 5567   0001
        MVII    #$5614, R4                      ; 5568   02BC 0014 0056
        MVI     G_01A9, R3                      ; 556B   0283 01A9

        JSR     R5,     L_594E                  ; 556D   0004 0158 014E

        CLRR    R0                              ; 5570   01C0
        RLC     R0,     1                       ; 5571   0050
        PSHR    R0                              ; 5572   0270
        SLL     R0,     2                       ; 5573   004C
        ADDR    R0,     R4                      ; 5574   00C4
        B       L_5577                          ; 5575   0200 0000

L_5577:
        PULR    R5                              ; 5577   02B5
        MVI@    R4,     R2                      ; 5578   02A2
        MVI@    R4,     R3                      ; 5579   02A3
        SWAP    R2,     1                       ; 557A   0042
        SWAP    R3,     1                       ; 557B   0043
        MVI     G_035C, R1                      ; 557C   0281 035C
        CMPR    R2,     R1                      ; 557E   0151
        BNC     L_55C0                          ; 557F   0209 003F

        CMPR    R3,     R1                      ; 5581   0159
        BC      L_55C0                          ; 5582   0201 003C

        MVI@    R4,     R2                      ; 5584   02A2
        MVI@    R4,     R3                      ; 5585   02A3
        SWAP    R2,     1                       ; 5586   0042
        SWAP    R3,     1                       ; 5587   0043
        MVI     G_031F, R0                      ; 5588   0280 031F
        CMPR    R2,     R0                      ; 558A   0150
        BNC     L_5592                          ; 558B   0209 0005

        CMPR    R3,     R0                      ; 558D   0158
        BC      L_5592                          ; 558E   0201 0002
        BNC     L_55E9                          ; 5590   0209 0057

L_5592:
        MOVR    R5,     R0                      ; 5592   00A8
        SDBD                                    ; 5593   0001
        SUBI    #$2C00, R1                      ; 5594   0339 0000 002C
        BPL     L_559A                          ; 5597   0203 0001

        CLRR    R1                              ; 5599   01C9
L_559A:
        SWAP    R1,     1                       ; 559A   0041
        ANDI    #$00FF, R1                      ; 559B   03B9 00FF
        SLR     R1,     2                       ; 559D   0065
        MVI     G_01A4, R4                      ; 559E   0284 01A4
        TSTR    R4                              ; 55A0   00A4
        BEQ     L_55A6                          ; 55A1   0204 0003

        INCR    R1                              ; 55A3   0009
        SLR     R1,     1                       ; 55A4   0061
        SLR     R0,     1                       ; 55A5   0060
L_55A6:
        SARC    R0,     1                       ; 55A6   0078
        MVI     G_031F, R0                      ; 55A7   0280 031F
        BNC     L_55B1                          ; 55A9   0209 0006

        XORI    #$00FF, R2                      ; 55AB   03FA 00FF
        SUBR    R0,     R2                      ; 55AD   0102
        MOVR    R2,     R0                      ; 55AE   0090
        B       L_55B4                          ; 55AF   0200 0003

L_55B1:
        SUBI    #$0100, R3                      ; 55B1   033B 0100
        SUBR    R3,     R0                      ; 55B3   0118
L_55B4:
        SWAP    R0,     1                       ; 55B4   0040
        ANDI    #$00FF, R0                      ; 55B5   03B8 00FF
        CMPR    R0,     R1                      ; 55B7   0141
        BC      L_55E9                          ; 55B8   0201 002F
        B       L_55C0                          ; 55BA   0200 0004

L_55BC:
        JSR     R5,     L_5636                  ; 55BC   0004 0154 0236

        PULR    R7                              ; 55BF   02B7

L_55C0:
        MVI     G_01A4, R0                      ; 55C0   0280 01A4
        TSTR    R0                              ; 55C2   0080
        BNEQ    L_55D3                          ; 55C3   020C 000E

        MVII    #$0005, R0                      ; 55C5   02B8 0005

        JSR     R5,     L_5668                  ; 55C7   0004 0154 0268

        MVII    #$0001, R0                      ; 55CA   02B8 0001

        JSR     R5,     X_PLAY_RAZZ4            ; 55CC   0004 011C 02C4
        JSR     R5,     L_5636                  ; 55CF   0004 0154 0236

        PULR    R7                              ; 55D2   02B7

L_55D3:
        MVII    #$0006, R0                      ; 55D3   02B8 0006

        JSR     R5,     L_5668                  ; 55D5   0004 0154 0268
        JSR     R5,     L_5EA9                  ; 55D8   0004 015C 02A9

        MVII    #$0001, R0                      ; 55DB   02B8 0001
        MVO     R0,     G_01AC                  ; 55DD   0240 01AC
        XOR     G_01AB, R0                      ; 55DF   03C0 01AB
        MVO     R0,     G_01AB                  ; 55E1   0240 01AB
        BNEQ    L_560C                          ; 55E3   020C 0027

        JSR     R5,     L_5636                  ; 55E5   0004 0154 0236

        PULR    R7                              ; 55E8   02B7

L_55E9:
        MVI     G_01A7, R0                      ; 55E9   0280 01A7
        TSTR    R0                              ; 55EB   0080
        BNEQ    L_5600                          ; 55EC   020C 0012

        MVI     G_01A9, R0                      ; 55EE   0280 01A9
        MVO     R0,     G_01B9                  ; 55F0   0240 01B9
        CLRR    R0                              ; 55F2   01C0
        MVO     R0,     G_01A4                  ; 55F3   0240 01A4
L_55F5:
        PULR    R7                              ; 55F5   02B7

L_55F6:
        MVII    #$0004, R0                      ; 55F6   02B8 0004
        MVO     R0,     G_01A1                  ; 55F8   0240 01A1
        MVII    #$0005, R0                      ; 55FA   02B8 0005
        MVO     R0,     G_01A5                  ; 55FC   0240 01A5
        B       L_5608                          ; 55FE   0200 0008

L_5600:
        MVII    #$0007, R0                      ; 5600   02B8 0007

        JSR     R5,     L_5668                  ; 5602   0004 0154 0268
        JSR     R5,     L_5EA9                  ; 5605   0004 015C 02A9

L_5608:
        MVII    #$0001, R0                      ; 5608   02B8 0001
        MVO     R0,     G_01AC                  ; 560A   0240 01AC
L_560C:
        CLRR    R0                              ; 560C   01C0
        COMR    R0                              ; 560D   0018
        MVO     R0,     G_01B9                  ; 560E   0240 01B9

        JSR     R5,     L_5636                  ; 5610   0004 0154 0236

        PULR    R7                              ; 5613   02B7

        DECLE   $002B,  $0058,  $0054,  $0095   ; 5614   002B 0058 0054 0095
        DECLE   $002B,  $0058,  $0014,  $0054   ; 5618   002B 0058 0014 0054
        DECLE   $003F,  $0058,  $0054,  $0076   ; 561C   003F 0058 0054 0076
        DECLE   $002B,  $0040,  $0054,  $0076   ; 5620   002B 0040 0054 0076
        DECLE   $003F                           ; 5624   003F

        SLLC    R0,     1                       ; 5625   0058
        GSWD    R3                              ; 5626   0033
        RLC     R0,     2                       ; 5627   0054
        ADCR    R3                              ; 5628   002B
        SWAP    R0,     1                       ; 5629   0040
        GSWD    R3                              ; 562A   0033
        RLC     R0,     2                       ; 562B   0054
L_562C:
        PSHR    R5                              ; 562C   0275
        MVI     G_01A8, R0                      ; 562D   0280 01A8
        TSTR    R0                              ; 562F   0080
        BEQ     L_5635                          ; 5630   0204 0003

        JSR     R5,     L_5636                  ; 5632   0004 0154 0236

L_5635:
        PULR    R7                              ; 5635   02B7

L_5636:
        PSHR    R5                              ; 5636   0275
        CLRR    R0                              ; 5637   01C0
        MVO     R0,     G_01A8                  ; 5638   0240 01A8
        MVI     G_01AC, R0                      ; 563A   0280 01AC
        TSTR    R0                              ; 563C   0080
        BNEQ    L_5642                          ; 563D   020C 0003

        CLRR    R0                              ; 563F   01C0
        MVO     R0,     G_01AB                  ; 5640   0240 01AB
L_5642:
        MVI     G_01AD, R0                      ; 5642   0280 01AD
        TSTR    R0                              ; 5644   0080
        BNEQ    L_564D                          ; 5645   020C 0006

        MVI     G_01AE, R0                      ; 5647   0280 01AE
        CMPI    #$0009, R0                      ; 5649   0378 0009
        BLT     L_5652                          ; 564B   0205 0005

L_564D:
        MVII    #$0003, R0                      ; 564D   02B8 0003

        JSR     R5,     X_PLAY_CHEER1           ; 564F   0004 011C 02D5
L_5652:
        JSR     R5,     L_5688                  ; 5652   0004 0154 0288

        CLRR    R0                              ; 5655   01C0
        MVO     R0,     G_01AC                  ; 5656   0240 01AC
        MVO     R0,     G_01A3                  ; 5658   0240 01A3
        MVO     R0,     G_01A4                  ; 565A   0240 01A4
        CLRR    R0                              ; 565C   01C0
        MVO     R0,     G_01A7                  ; 565D   0240 01A7
        MVO     R0,     G_01AD                  ; 565F   0240 01AD
        MVO     R0,     G_01AE                  ; 5661   0240 01AE
        MVII    #$000E, R0                      ; 5663   02B8 000E
        MVO     R0,     G_01A0                  ; 5665   0240 01A0
        PULR    R7                              ; 5667   02B7

L_5668:
        PSHR    R5                              ; 5668   0275
        MVI     G_01B7, R1                      ; 5669   0281 01B7
        TSTR    R1                              ; 566B   0089
        BEQ     L_5676                          ; 566C   0204 0008

        MOVR    R1,     R2                      ; 566E   008A
L_566F:
        SLL     R0,     2                       ; 566F   004C
        SLL     R0,     2                       ; 5670   004C
        DECR    R2                              ; 5671   0012
        BNEQ    L_566F                          ; 5672   022C 0004

        XOR     G_0324, R0                      ; 5674   03C0 0324
L_5676:
        MVO     R0,     G_0324                  ; 5676   0240 0324
        INCR    R1                              ; 5678   0009
        MVO     R1,     G_01B7                  ; 5679   0241 01B7
        CMPI    #$0001, R1                      ; 567B   0379 0001
        BNEQ    L_5687                          ; 567D   020C 0008

        MOVR    R1,     R0                      ; 567F   0088
        SDBD                                    ; 5680   0001
        MVII    #$502C, R1                      ; 5681   02B9 002C 0050

        JSR     R5,     .EXEC.831               ; 5684   0004 0118 0031

L_5687:
        PULR    R7                              ; 5687   02B7

L_5688:
        PSHR    R5                              ; 5688   0275

        JSR     R5,     L_5740                  ; 5689   0004 0154 0340
        DECLE   $0000                           ; 568C   0000

        SWAP    R0,     2                       ; 568D   0044
        BMI     L_56AB                          ; 568E   020B 001B
        B       L_5692                          ; 5690   0200 0000

L_5692:
        MVI@    R3,     R1                      ; 5692   0299
        MVI@    R2,     R0                      ; 5693   0290

        JSR     R5,     X_EXT_SIGN_LO           ; 5694   0004 0114 0268

        INCR    R0                              ; 5697   0008
        MVO@    R0,     R2                      ; 5698   0250
        BMI     L_56AF                          ; 5699   020B 0014
        BEQ     L_56D3                          ; 569B   0204 0036

        MVI     G_01C4, R5                      ; 569D   0285 01C4
        TSTR    R5                              ; 569F   00AD
        BNEQ    L_56C1                          ; 56A0   020C 001F

        CMPI    #$0003, R0                      ; 56A2   0378 0003
        BGT     L_56D3                          ; 56A4   020E 002D
        BLT     L_56AB                          ; 56A6   0205 0003

        CMPR    R1,     R0                      ; 56A8   0148
        BEQ     L_56BB                          ; 56A9   0204 0010

L_56AB:
        JSR     R5,     L_5755                  ; 56AB   0004 0154 0355

        PULR    R7                              ; 56AE   02B7

L_56AF:
        DECR    R1                              ; 56AF   0011
        MVO@    R1,     R3                      ; 56B0   0259
        ANDI    #$0001, R1                      ; 56B1   03B9 0001
        BEQ     L_56AB                          ; 56B3   0224 0009

        CLRR    R0                              ; 56B5   01C0

        JSR     R5,     L_5668                  ; 56B6   0004 0154 0268

        B       L_56AB                          ; 56B9   0220 000F

L_56BB:
        NEGR    R0                              ; 56BB   0020
        INCR    R0                              ; 56BC   0008
        MVO@    R0,     R2                      ; 56BD   0250
        MVO@    R0,     R3                      ; 56BE   0258
        B       L_56AB                          ; 56BF   0220 0015

L_56C1:
        SUBR    R1,     R0                      ; 56C1   0108
        CMPI    #$0002, R0                      ; 56C2   0378 0002
        BLT     L_56CB                          ; 56C4   0205 0005

        ADDR    R0,     R1                      ; 56C6   00C1
        CMPI    #$0007, R1                      ; 56C7   0379 0007
        BGE     L_56D3                          ; 56C9   020D 0008

L_56CB:
        ANDI    #$0001, R0                      ; 56CB   03B8 0001
        XOR     G_01A2, R0                      ; 56CD   03C0 01A2
        MVO     R0,     G_01A2                  ; 56CF   0240 01A2
        B       L_56AB                          ; 56D1   0220 0027

L_56D3:
        CLRR    R0                              ; 56D3   01C0
        MVO@    R0,     R2                      ; 56D4   0250
        MVO@    R0,     R3                      ; 56D5   0258

        JSR     R5,     L_5755                  ; 56D6   0004 0154 0355

        B       L_56DB                          ; 56D9   0200 0000

L_56DB:
        MVII    #$0004, R0                      ; 56DB   02B8 0004

        JSR     R5,     X_PLAY_CHEER1           ; 56DD   0004 011C 02D5

        MVII    #$0003, R0                      ; 56E0   02B8 0003

        JSR     R5,     L_5668                  ; 56E2   0004 0154 0268

        MVI     G_01A2, R0                      ; 56E5   0280 01A2
        XORI    #$0001, R0                      ; 56E7   03F8 0001
        MVO     R0,     G_01A2                  ; 56E9   0240 01A2

        JSR     R5,     L_5740                  ; 56EB   0004 0154 0340
        DECLE   $0002                           ; 56EE   0002

        MVI@    R2,     R0                      ; 56EF   0290
        INCR    R0                              ; 56F0   0008
        MVO@    R0,     R2                      ; 56F1   0250

        JSR     R5,     L_579C                  ; 56F2   0004 0154 039C

        MVI@    R2,     R0                      ; 56F5   0290
        MVI@    R3,     R4                      ; 56F6   029C
        XORR    R0,     R4                      ; 56F7   01C4
        ANDI    #$0001, R4                      ; 56F8   03BC 0001
        MVO     R4,     G_01B1                  ; 56FA   0244 01B1
        CMPI    #$0006, R0                      ; 56FC   0378 0006
        BGT     L_570B                          ; 56FE   020E 000B
        BLT     L_570A                          ; 5700   0205 0008

        SUB@    R3,     R0                      ; 5702   0318
        DECR    R0                              ; 5703   0010
        BEQ     L_570A                          ; 5704   0204 0004
        BPL     L_570B                          ; 5706   0203 0003

        MVO     R0,     G_01C4                  ; 5708   0240 01C4
L_570A:
        PULR    R7                              ; 570A   02B7

L_570B:
        CLRR    R0                              ; 570B   01C0
        MVO@    R0,     R2                      ; 570C   0250
        MVO@    R0,     R3                      ; 570D   0258
        MVO     R0,     G_01C4                  ; 570E   0240 01C4
        B       L_5712                          ; 5710   0200 0000

L_5712:
        MVII    #$0002, R0                      ; 5712   02B8 0002

        JSR     R5,     L_5668                  ; 5714   0004 0154 0268
        JSR     R5,     L_5740                  ; 5717   0004 0154 0340
        DECLE   $0004                           ; 571A   0004

        MVI@    R2,     R0                      ; 571B   0290
        INCR    R0                              ; 571C   0008
        MVO@    R0,     R2                      ; 571D   0250
        CMPI    #$0003, R0                      ; 571E   0378 0003
        BGE     L_572B                          ; 5720   020D 0009

        MVI     G_01BA, R0                      ; 5722   0280 01BA
        INCR    R0                              ; 5724   0008
        MVO     R0,     G_01BA                  ; 5725   0240 01BA

        JSR     R5,     L_579C                  ; 5727   0004 0154 039C

        PULR    R7                              ; 572A   02B7

L_572B:
        MVII    #$000C, R0                      ; 572B   02B8 000C

        JSR     R5,     X_PLAY_CHEER1           ; 572D   0004 011C 02D5

        MVII    #$0001, R0                      ; 5730   02B8 0001

        JSR     R5,     L_5668                  ; 5732   0004 0154 0268

        MVII    #$0001, R0                      ; 5735   02B8 0001
        MVO     R0,     G_01B3                  ; 5737   0240 01B3
        SDBD                                    ; 5739   0001
        MVII    #$1906, R0                      ; 573A   02B8 0006 0019
        MVO     R0,     G_035D                  ; 573D   0240 035D
        PULR    R7                              ; 573F   02B7

L_5740:
        MVII    #$01BE, R2                      ; 5740   02BA 01BE
        ADD@    R5,     R2                      ; 5742   02EA
        PSHR    R5                              ; 5743   0275
        MOVR    R2,     R3                      ; 5744   0093
        INCR    R3                              ; 5745   000B
        MVII    #$0002, R1                      ; 5746   02B9 0002
        MVI     G_01B9, R0                      ; 5748   0280 01B9
        TSTR    R0                              ; 574A   0080
        BEQ     L_5752                          ; 574B   0204 0005

        XORR    R2,     R3                      ; 574D   01D3
        XORR    R3,     R2                      ; 574E   01DA
        XORR    R2,     R3                      ; 574F   01D3
        MVII    #$0001, R1                      ; 5750   02B9 0001
L_5752:
        MVO     R1,     G_01B8                  ; 5752   0241 01B8
        PULR    R7                              ; 5754   02B7

L_5755:
        PSHR    R5                              ; 5755   0275
        MVI     G_01BE, R0                      ; 5756   0280 01BE
        MVI     G_01BC, R4                      ; 5758   0284 01BC

        JSR     R5,     L_5770                  ; 575A   0004 0154 0370

        MVI     G_01BF, R0                      ; 575D   0280 01BF
        MVI     G_01BD, R4                      ; 575F   0284 01BD

        JSR     R5,     L_5770                  ; 5761   0004 0154 0370

        SDBD                                    ; 5764   0001
        CMPI    #$FFFC, R0                      ; 5765   0378 00FC 00FF
        BNEQ    L_576F                          ; 5768   020C 0005

        MVII    #$0004, R0                      ; 576A   02B8 0004

        JSR     R5,     L_5668                  ; 576C   0004 0154 0268

L_576F:
        PULR    R7                              ; 576F   02B7

L_5770:
        PSHR    R5                              ; 5770   0275
        ADDI    #$0200, R4                      ; 5771   02FC 0200
        MVI     G_01C4, R5                      ; 5773   0285 01C4
        TSTR    R5                              ; 5775   00AD
        BNEQ    L_5786                          ; 5776   020C 000E

        JSR     R5,     X_EXT_SIGN_LO           ; 5778   0004 0114 0268

        SLL     R0,     1                       ; 577B   0048
        SDBD                                    ; 577C   0001
        MVII    #$5794, R5                      ; 577D   02BD 0094 0057
        ADDR    R0,     R5                      ; 5780   00C5
        MVI@    R5,     R1                      ; 5781   02A9
        MVO@    R1,     R4                      ; 5782   0261
        MVI@    R5,     R1                      ; 5783   02A9
        MVO@    R1,     R4                      ; 5784   0261
        PULR    R7                              ; 5785   02B7

L_5786:
        MVII    #$0002, R1                      ; 5786   02B9 0002
        MVII    #$0007, R3                      ; 5788   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 578A   0004 0118 00C5

        PULR    R7                              ; 578D   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 578E   0000 0000 0000 0000

        SUBR    R1,     R7                      ; 5792   010F
        SUBR    R4,     R7                      ; 5793   0127

        DECLE   $0000                           ; 5794   0000

        MOVR    R0,     R7                      ; 5795   0087
        MOVR    R1,     R7                      ; 5796   008F
        MOVR    R5,     R7                      ; 5797   00AF
        MOVR    R3,     R7                      ; 5798   009F
        MOVR    R0,     R7                      ; 5799   0087
        MOVR    R4,     R7                      ; 579A   00A7
        MOVR    R0,     R7                      ; 579B   0087

L_579C:
        PSHR    R5                              ; 579C   0275
        MVII    #$0214, R4                      ; 579D   02BC 0214
        MVI     G_01BA, R0                      ; 579F   0280 01BA
        ADDR    R0,     R4                      ; 57A1   00C4
        SLL     R0,     1                       ; 57A2   0048
        ADDR    R0,     R4                      ; 57A3   00C4
        MVI     G_01C0, R1                      ; 57A4   0281 01C0

        JSR     R5,     L_57B5                  ; 57A6   0004 0154 03B5

        MVO@    R0,     R4                      ; 57A9   0260
        MVO@    R1,     R4                      ; 57AA   0261
        ADDI    #$0012, R4                      ; 57AB   02FC 0012
        MVI     G_01C1, R1                      ; 57AD   0281 01C1

        JSR     R5,     L_57B5                  ; 57AF   0004 0154 03B5

        MVO@    R0,     R4                      ; 57B2   0260
        MVO@    R1,     R4                      ; 57B3   0261
        PULR    R7                              ; 57B4   02B7

L_57B5:
        PSHR    R5                              ; 57B5   0275
        PSHR    R2                              ; 57B6   0272
        MVII    #$000A, R2                      ; 57B7   02BA 000A

        JSR     R5,     X_DIV                   ; 57B9   0004 011C 01FB

        TSTR    R0                              ; 57BC   0080
        BEQ     L_57C5                          ; 57BD   0204 0006

        SLL     R0,     2                       ; 57BF   004C
        SLL     R0,     1                       ; 57C0   0048
        SDBD                                    ; 57C1   0001
        ADDI    #$08E7, R0                      ; 57C2   02F8 00E7 0008
L_57C5:
        SLL     R1,     2                       ; 57C5   004D
        SLL     R1,     1                       ; 57C6   0049
        SDBD                                    ; 57C7   0001
        ADDI    #$08E7, R1                      ; 57C8   02F9 00E7 0008
        PULR    R2                              ; 57CB   02B2
        PULR    R7                              ; 57CC   02B7

L_57CD:
        PSHR    R5                              ; 57CD   0275
        SDBD                                    ; 57CE   0001
        MVII    #$8004, R4                      ; 57CF   02BC 0004 0080
        MVI     G_019F, R3                      ; 57D2   0283 019F
        SWAP    R3,     2                       ; 57D4   0047
        BPL     L_5802                          ; 57D5   0203 002B

        MVI     G_035C, R3                      ; 57D7   0283 035C
        MVO     R3,     G_0350                  ; 57D9   0243 0350
        MVI     G_033C, R2                      ; 57DB   0282 033C
        SAR     R2,     1                       ; 57DD   006A
        ADD     G_031F, R2                      ; 57DE   02C2 031F
        MVO     R2,     G_034F                  ; 57E0   0242 034F

        JSR     R5,     L_5809                  ; 57E2   0004 0158 0009

        BC      L_5805                          ; 57E5   0201 001E

        SUBI    #$0300, R2                      ; 57E7   033A 0300
        SDBD                                    ; 57E9   0001
        SUBI    #$0600, R3                      ; 57EA   033B 0000 0006

        JSR     R5,     L_5809                  ; 57ED   0004 0158 0009

        BNC     L_57FE                          ; 57F0   0209 000C

        MVO     R2,     G_034F                  ; 57F2   0242 034F
        MVO     R3,     G_0350                  ; 57F4   0243 0350
        MVI     G_033C, R1                      ; 57F6   0281 033C
        SDBD                                    ; 57F8   0001
        CMPI    #$0600, R1                      ; 57F9   0379 0000 0006
        BLE     L_5802                          ; 57FC   0206 0004

L_57FE:
        SDBD                                    ; 57FE   0001
        XORI    #$1000, R4                      ; 57FF   03FC 0000 0010
L_5802:
        MVO     R4,     G_034D                  ; 5802   0244 034D
        PULR    R7                              ; 5804   02B7

L_5805:
        XORI    #$0020, R4                      ; 5805   03FC 0020
        B       L_57FE                          ; 5807   0220 000A

L_5809:
        PSHR    R5                              ; 5809   0275
        SDBD                                    ; 580A   0001
        CMPI    #$5300, R2                      ; 580B   037A 0000 0053
        BLT     L_5824                          ; 580E   0205 0014

        SDBD                                    ; 5810   0001
        CMPI    #$5500, R2                      ; 5811   037A 0000 0055
        BGT     L_5824                          ; 5814   020E 000E

        SDBD                                    ; 5816   0001
        CMPI    #$2400, R3                      ; 5817   037B 0000 0024
        BLT     L_5824                          ; 581A   0205 0008

        SDBD                                    ; 581C   0001
        CMPI    #$5700, R3                      ; 581D   037B 0000 0057
        BGT     L_5824                          ; 5820   020E 0002

        SETC                                    ; 5822   0007
        PULR    R7                              ; 5823   02B7

L_5824:
        CLRC                                    ; 5824   0006
        PULR    R7                              ; 5825   02B7

L_5826:
        PSHR    R5                              ; 5826   0275
        CLRR    R1                              ; 5827   01C9

        JSR     R5,     L_5885                  ; 5828   0004 0158 0085

        MVI     G_011F, R0                      ; 582B   0280 011F

        JSR     R5,     L_58AB                  ; 582D   0004 0158 00AB
        JSR     R5,     L_587D                  ; 5830   0004 0158 007D
        JSR     R5,     L_5875                  ; 5833   0004 0158 0075
        JSR     R5,     L_58A0                  ; 5836   0004 0158 00A0

        MVII    #$0001, R1                      ; 5839   02B9 0001

        JSR     R5,     L_5885                  ; 583B   0004 0158 0085

        MVI     G_0120, R0                      ; 583E   0280 0120

        JSR     R5,     L_58AB                  ; 5840   0004 0158 00AB
        JSR     R5,     L_587D                  ; 5843   0004 0158 007D
        JSR     R5,     L_5875                  ; 5846   0004 0158 0075
        JSR     R5,     L_58A0                  ; 5849   0004 0158 00A0

        MVII    #$0002, R1                      ; 584C   02B9 0002
        MVO     R1,     G_0199                  ; 584E   0241 0199
        MVII    #$015D, R4                      ; 5850   02BC 015D
        CLRR    R0                              ; 5852   01C0
        MVI     G_01A9, R1                      ; 5853   0281 01A9
        TSTR    R1                              ; 5855   0089
        BNEQ    L_585A                          ; 5856   020C 0002

        XORI    #$0010, R0                      ; 5858   03F8 0010
L_585A:
        SLL     R1,     2                       ; 585A   004D
        SLL     R1,     2                       ; 585B   004D
        ADDI    #$0164, R1                      ; 585C   02F9 0164
        MVI@    R1,     R2                      ; 585E   028A
        TSTR    R2                              ; 585F   0092
        BEQ     L_5864                          ; 5860   0204 0002

        XORI    #$0010, R0                      ; 5862   03F8 0010
L_5864:
        ADDR    R0,     R4                      ; 5864   00C4
        MVII    #$017D, R3                      ; 5865   02BB 017D

        JSR     R5,     L_588D                  ; 5867   0004 0158 008D

        MVII    #$0008, R0                      ; 586A   02B8 0008
        MVO     R0,     G_0195                  ; 586C   0240 0195

        JSR     R5,     L_5B5E                  ; 586E   0004 0158 035E
        JSR     R5,     L_58A0                  ; 5871   0004 0158 00A0

        PULR    R7                              ; 5874   02B7

L_5875:
        PSHR    R5                              ; 5875   0275

        JSR     R5,     L_5A0E                  ; 5876   0004 0158 020E
        JSR     R5,     L_5B5E                  ; 5879   0004 0158 035E

        PULR    R7                              ; 587C   02B7

L_587D:
        PSHR    R5                              ; 587D   0275

        JSR     R5,     L_58BC                  ; 587E   0004 0158 00BC
        JSR     R5,     L_5974                  ; 5881   0004 0158 0174

        PULR    R7                              ; 5884   02B7

L_5885:
        MVO     R1,     G_0199                  ; 5885   0241 0199
        MVII    #$015D, R3                      ; 5887   02BB 015D
        SLL     R1,     2                       ; 5889   004D
        SLL     R1,     2                       ; 588A   004D
        ADDR    R1,     R3                      ; 588B   00CB
        MOVR    R3,     R4                      ; 588C   009C
L_588D:
        PSHR    R5                              ; 588D   0275
        MVO     R3,     G_0334                  ; 588E   0243 0334
        MVII    #$018D, R1                      ; 5890   02B9 018D
        MOVR    R1,     R3                      ; 5892   008B
        MVII    #$000C, R0                      ; 5893   02B8 000C

        JSR     R5,     .EXEC.730               ; 5895   0004 0114 0330

        MVI@    R3,     R3                      ; 5898   029B
        ADDI    #$031D, R3                      ; 5899   02FB 031D
        MVO     R3,     G_032C                  ; 589B   0243 032C
        MVI     G_0199, R1                      ; 589D   0281 0199
        PULR    R7                              ; 589F   02B7

L_58A0:
        MVI     G_0334, R1                      ; 58A0   0281 0334
        PSHR    R5                              ; 58A2   0275
        MVII    #$018D, R4                      ; 58A3   02BC 018D
        MVII    #$000C, R0                      ; 58A5   02B8 000C

        JSR     R5,     .EXEC.730               ; 58A7   0004 0114 0330

        PULR    R7                              ; 58AA   02B7

L_58AB:
        PSHR    R5                              ; 58AB   0275
        CLRR    R3                              ; 58AC   01DB
        COMR    R3                              ; 58AD   001B
        MVO     R3,     G_019A                  ; 58AE   0243 019A
        MOVR    R0,     R1                      ; 58B0   0081
        ANDI    #$0040, R1                      ; 58B1   03B9 0040
        BNEQ    L_58BB                          ; 58B3   020C 0006

        CMPI    #$000F, R0                      ; 58B5   0378 000F
        BGT     L_58BB                          ; 58B7   020E 0002

        MVO     R0,     G_019A                  ; 58B9   0240 019A
L_58BB:
        PULR    R7                              ; 58BB   02B7

L_58BC:
        PSHR    R5                              ; 58BC   0275
        MVI     G_0193, R0                      ; 58BD   0280 0193
        TSTR    R0                              ; 58BF   0080
        BNEQ    L_594D                          ; 58C0   020C 008B

        MVI     G_01A2, R0                      ; 58C2   0280 01A2
        CMP     G_0199, R0                      ; 58C4   0340 0199
        BNEQ    L_58CE                          ; 58C6   020C 0006

        MVI     G_01A1, R0                      ; 58C8   0280 01A1
        CMPI    #$0001, R0                      ; 58CA   0378 0001
        BGE     L_5940                          ; 58CC   020D 0072

L_58CE:
        MVI     G_019A, R1                      ; 58CE   0281 019A
        SWAP    R1,     2                       ; 58D0   0045
        BMI     L_58E0                          ; 58D1   020B 000D

        JSR     R5,     .EXEC.628               ; 58D3   0004 0114 0228

        GSWD    R2                              ; 58D6   0032

        JSR     R5,     X_UNPK_BYTES            ; 58D7   0004 0114 0357

        SAR     R1,     1                       ; 58DA   0069

        JSR     R5,     X_PACK_BYTES            ; 58DB   0004 0114 034F

        B       L_58E1                          ; 58DE   0200 0001

L_58E0:
        CLRR    R0                              ; 58E0   01C0
L_58E1:
        MVI     G_032C, R2                      ; 58E1   0282 032C
        ADDI    #$0004, R2                      ; 58E3   02FA 0004
        MVO@    R0,     R2                      ; 58E5   0250
        MVI     G_032C, R2                      ; 58E6   0282 032C
        MVI@    R2,     R1                      ; 58E8   0291
        SDBD                                    ; 58E9   0001
        ANDI    #$FDFF, R1                      ; 58EA   03B9 00FF 00FD
        CLRR    R0                              ; 58ED   01C0

        JSR     R5,     L_5955                  ; 58EE   0004 0158 0155

        BNC     L_5903                          ; 58F1   0209 0010

        XORI    #$0200, R1                      ; 58F3   03F9 0200
        MVII    #$0020, R0                      ; 58F5   02B8 0020
        MVI     G_019A, R3                      ; 58F7   0283 019A
        SWAP    R3,     2                       ; 58F9   0047
        BMI     L_5903                          ; 58FA   020B 0007

        SUBI    #$0008, R3                      ; 58FC   033B 0008
        NEGR    R3                              ; 58FE   0023
        ANDI    #$000F, R3                      ; 58FF   03BB 000F
        MVO     R3,     G_019A                  ; 5901   0243 019A
L_5903:
        MVO@    R1,     R2                      ; 5903   0251
        MVO     R0,     G_018E                  ; 5904   0240 018E
        MVI     G_0194, R1                      ; 5906   0281 0194
        TSTR    R1                              ; 5908   0089
        BNEQ    L_590D                          ; 5909   020C 0002

        MVO     R0,     G_0196                  ; 590B   0240 0196
L_590D:
        MVI     G_019A, R0                      ; 590D   0280 019A
        SWAP    R0,     2                       ; 590F   0044
        BMI     L_5938                          ; 5910   020B 0026

        CMPI    #$0008, R0                      ; 5912   0378 0008
        BLE     L_5919                          ; 5914   0206 0003

        NEGR    R0                              ; 5916   0020
        ADDI    #$0010, R0                      ; 5917   02F8 0010
L_5919:
        CMPI    #$0004, R0                      ; 5919   0378 0004
        BGT     L_592D                          ; 591B   020E 0010
        BEQ     L_591F                          ; 591D   0204 0000

L_591F:
        MVI     G_018F, R1                      ; 591F   0281 018F
        INCR    R1                              ; 5921   0009
        CMPI    #$0006, R1                      ; 5922   0379 0006
        BLT     L_5927                          ; 5924   0205 0001

        CLRR    R1                              ; 5926   01C9
L_5927:
        MVO     R1,     G_018F                  ; 5927   0241 018F
        ADDI    #$0000, R1                      ; 5929   02F9 0000
        B       L_593D                          ; 592B   0200 0010

L_592D:
        MVI     G_018F, R1                      ; 592D   0281 018F
        INCR    R1                              ; 592F   0009
        ANDI    #$0001, R1                      ; 5930   03B9 0001
        MVO     R1,     G_018F                  ; 5932   0241 018F
        ADDI    #$0009, R1                      ; 5934   02F9 0009
        B       L_593D                          ; 5936   0200 0005

L_5938:
        CLRR    R1                              ; 5938   01C9
        MVO     R1,     G_018F                  ; 5939   0241 018F
        MVII    #$0009, R1                      ; 593B   02B9 0009
L_593D:
        ADDI    #$0005, R2                      ; 593D   02FA 0005
        MVO@    R1,     R2                      ; 593F   0251
L_5940:
        MVI     G_032C, R1                      ; 5940   0281 032C
        SDBD                                    ; 5942   0001
        MVII    #$5434, R2                      ; 5943   02BA 0034 0054
        SDBD                                    ; 5946   0001
        MVII    #$0628, R4                      ; 5947   02BC 0028 0006

        JSR     R5,     .EXEC.2AE               ; 594A   0004 0110 02AE

L_594D:
        PULR    R7                              ; 594D   02B7

L_594E:
        PSHR    R5                              ; 594E   0275
        SLL     R3,     2                       ; 594F   004F
        SLL     R3,     2                       ; 5950   004F
        ADDI    #$032D, R3                      ; 5951   02FB 032D
        B       L_5958                          ; 5953   0200 0003

L_5955:
        PSHR    R5                              ; 5955   0275
        MVI     G_032C, R3                      ; 5956   0283 032C
L_5958:
        ADDI    #$0002, R3                      ; 5958   02FB 0002

        JSR     R5,     L_595F                  ; 595A   0004 0158 015F
        DECLE   $0052                           ; 595D   0052

        PULR    R7                              ; 595E   02B7

L_595F:
        MVI@    R3,     R3                      ; 595F   029B
        SWAP    R3,     1                       ; 5960   0043
        ANDI    #$00FF, R3                      ; 5961   03BB 00FF
        SUB@    R5,     R3                      ; 5963   032B
        PSHR    R5                              ; 5964   0275
        BPL     L_5969                          ; 5965   0203 0002

        COMR    R3                              ; 5967   001B
        INCR    R3                              ; 5968   000B
L_5969:
        PULR    R7                              ; 5969   02B7

L_596A:
        PSHR    R5                              ; 596A   0275
        MVI     G_032C, R3                      ; 596B   0283 032C
        ADDI    #$0003, R3                      ; 596D   02FB 0003

        JSR     R5,     L_595F                  ; 596F   0004 0158 015F
        DECLE   $0031                           ; 5972   0031

        PULR    R7                              ; 5973   02B7

L_5974:
        PSHR    R5                              ; 5974   0275
        MVI     G_019F, R1                      ; 5975   0281 019F
        CMP     G_0199, R1                      ; 5977   0341 0199
        BNEQ    L_599D                          ; 5979   020C 0022

        MVII    #$0300, R1                      ; 597B   02B9 0300
        MVI     G_018E, R0                      ; 597D   0280 018E
        TSTR    R0                              ; 597F   0080
        BEQ     L_5983                          ; 5980   0204 0001

        NEGR    R1                              ; 5982   0021
L_5983:
        MVI     G_032C, R4                      ; 5983   0284 032C
        ADDI    #$0002, R4                      ; 5985   02FC 0002
        MVI@    R4,     R2                      ; 5987   02A2
        MVI@    R4,     R3                      ; 5988   02A3
        MVI@    R4,     R5                      ; 5989   02A5
        ADDR    R1,     R2                      ; 598A   00CA
        SDBD                                    ; 598B   0001
        ADDI    #$0E00, R3                      ; 598C   02FB 0000 000E
        MVO     R3,     G_035C                  ; 598F   0243 035C
        SDBD                                    ; 5991   0001
        MVII    #$0900, R0                      ; 5992   02B8 0000 0009
        MVO     R0,     G_033C                  ; 5995   0240 033C
        SUBR    R0,     R3                      ; 5997   0103
        MVII    #$031F, R4                      ; 5998   02BC 031F
        MVO@    R2,     R4                      ; 599A   0262
        MVO@    R3,     R4                      ; 599B   0263
        MVO@    R5,     R4                      ; 599C   0265
L_599D:
        MVI     G_032C, R4                      ; 599D   0284 032C
        MVI@    R4,     R5                      ; 599F   02A5
        MVI@    R4,     R1                      ; 59A0   02A1
        MVI@    R4,     R2                      ; 59A1   02A2
        MVI@    R4,     R3                      ; 59A2   02A3
        MOVR    R3,     R0                      ; 59A3   0098
        SDBD                                    ; 59A4   0001
        ADDI    #$0F00, R0                      ; 59A5   02F8 0000 000F
        CMP     G_035C, R0                      ; 59A8   0340 035C
        BLT     L_5A0D                          ; 59AA   0205 0061

        SUB     G_0320, R3                      ; 59AC   0303 0320
        NEGR    R3                              ; 59AE   0023
        BMI     L_5A0D                          ; 59AF   020B 005C

        SWAP    R3,     1                       ; 59B1   0043
        ANDI    #$00FF, R3                      ; 59B2   03BB 00FF
        SUB     G_031F, R2                      ; 59B4   0302 031F
        SDBD                                    ; 59B6   0001
        ADDI    #$0400, R2                      ; 59B7   02FA 0000 0004
        BMI     L_5A0D                          ; 59BA   020B 0051

        SDBD                                    ; 59BC   0001
        CMPI    #$0800, R2                      ; 59BD   037A 0000 0008
        BGT     L_5A0D                          ; 59C0   020E 004B

        SWAP    R2,     1                       ; 59C2   0042
        ANDI    #$00FF, R2                      ; 59C3   03BA 00FF
        ANDI    #$0200, R5                      ; 59C5   03BD 0200
        BEQ     L_59CC                          ; 59C7   0204 0003

        SUBI    #$0008, R2                      ; 59C9   033A 0008
        NEGR    R2                              ; 59CB   0022
L_59CC:
        MOVR    R2,     R5                      ; 59CC   0095
        MVII    #$0100, R0                      ; 59CD   02B8 0100
        BEQ     L_59D7                          ; 59CF   0204 0006

        XORI    #$0080, R0                      ; 59D1   03F8 0080
L_59D3:
        SLL     R0,     1                       ; 59D3   0048
        DECR    R2                              ; 59D4   0012
        BNEQ    L_59D3                          ; 59D5   022C 0003

L_59D7:
        SWAP    R0,     1                       ; 59D7   0040
        INCR    R4                              ; 59D8   000C
        MVI@    R4,     R2                      ; 59D9   02A2
        ANDI    #$000F, R2                      ; 59DA   03BA 000F
        SLL     R2,     2                       ; 59DC   004E
        SLL     R2,     2                       ; 59DD   004E
        ADDI    #$0005, R1                      ; 59DE   02F9 0005
        MVI@    R1,     R1                      ; 59E0   0289
        SLL     R1,     2                       ; 59E1   004D
        SLL     R1,     1                       ; 59E2   0049
        SDBD                                    ; 59E3   0001
        ADDI    #$5EB3, R1                      ; 59E4   02F9 00B3 005E
        ADDR    R2,     R1                      ; 59E7   00D1
        ADDR    R3,     R1                      ; 59E8   00D9
        MVI@    R1,     R2                      ; 59E9   028A
        TSTR    R2                              ; 59EA   0092
        BNEQ    L_59F3                          ; 59EB   020C 0006

        CMPI    #$0002, R3                      ; 59ED   037B 0002
        BLT     L_59F3                          ; 59EF   0205 0002

        MVII    #$0018, R2                      ; 59F1   02BA 0018
L_59F3:
        ANDR    R2,     R0                      ; 59F3   0190
        BEQ     L_5A0D                          ; 59F4   0204 0017

        CLRR    R1                              ; 59F6   01C9
L_59F7:
        SARC    R0,     1                       ; 59F7   0078
        INCR    R1                              ; 59F8   0009
        BNC     L_59F7                          ; 59F9   0229 0003

        TSTR    R0                              ; 59FB   0080
        BNEQ    L_5A0A                          ; 59FC   020C 000C

        CMPR    R5,     R1                      ; 59FE   0169
        BEQ     L_5A05                          ; 59FF   0204 0004

        MVII    #$0001, R1                      ; 5A01   02B9 0001
        B       L_5A07                          ; 5A03   0200 0002

L_5A05:
        MVII    #$0002, R1                      ; 5A05   02B9 0002
L_5A07:
        MVO     R1,     G_019D                  ; 5A07   0241 019D
        PULR    R7                              ; 5A09   02B7

L_5A0A:
        CLRR    R0                              ; 5A0A   01C0
        MVO     R0,     G_019C                  ; 5A0B   0240 019C
L_5A0D:
        PULR    R7                              ; 5A0D   02B7

L_5A0E:
        PSHR    R5                              ; 5A0E   0275
        DECLE   $0280,  $01A8,  $0080,  $0204   ; 5A0F   0280 01A8 0080 0204
        DECLE   $011E,  $0280,  $01A9,  $0340   ; 5A13   011E 0280 01A9 0340
        DECLE   $0199,  $0204,  $0118,  $0280   ; 5A17   0199 0204 0118 0280
        DECLE   $033C,  $0378,  $0200,  $0205   ; 5A1B   033C 0378 0200 0205
        DECLE   $0112,  $0001                   ; 5A1F   0112 0001

        CMPI    #$0000, R0                      ; 5A21   0378 0000
        INCR    R6                              ; 5A23   000E
        BGT     L_5B32                          ; 5A24   020E 010C

        MVI     G_032C, R1                      ; 5A26   0281 032C

        JSR     R5,     .EXEC.777               ; 5A28   0004 0114 0377

        PSHR    R2                              ; 5A2B   0272
        ADDI    #$0004, R2                      ; 5A2C   02FA 0004
        ADDI    #$000E, R3                      ; 5A2E   02FB 000E
        SWAP    R2,     1                       ; 5A30   0042
        XORR    R3,     R2                      ; 5A31   01DA
        MVII    #$031D, R1                      ; 5A32   02B9 031D
        MVII    #$0306, R4                      ; 5A34   02BC 0306

        JSR     R5,     L_5B3D                  ; 5A36   0004 0158 033D

        PULR    R2                              ; 5A39   02B2
        BNC     L_5B32                          ; 5A3A   0209 00F6

        MVI     G_0194, R0                      ; 5A3C   0280 0194
        MOVR    R0,     R3                      ; 5A3E   0083
        ANDI    #$0020, R3                      ; 5A3F   03BB 0020
        BEQ     L_5B32                          ; 5A41   0204 00EF

        ADDI    #$0002, R1                      ; 5A43   02F9 0002
        MVI@    R1,     R1                      ; 5A45   0289
        SWAP    R1,     1                       ; 5A46   0041
        ANDI    #$00FF, R1                      ; 5A47   03B9 00FF
        ADDI    #$0004, R1                      ; 5A49   02F9 0004
        DECR    R2                              ; 5A4B   0012
        SUBR    R2,     R1                      ; 5A4C   0111
        BMI     L_5B32                          ; 5A4D   020B 00E3

        JSR     R5,     L_5955                  ; 5A4F   0004 0158 0155

        BC      L_5A57                          ; 5A52   0201 0003

        NEGR    R1                              ; 5A54   0021
        ADDI    #$000A, R1                      ; 5A55   02F9 000A
L_5A57:
        ANDI    #$000F, R0                      ; 5A57   03B8 000F
        CMPR    R0,     R1                      ; 5A59   0141
        BLT     L_5B32                          ; 5A5A   0205 00D6

        JSR     R5,     L_5E7E                  ; 5A5C   0004 015C 027E

        MVI     G_01AE, R0                      ; 5A5F   0280 01AE
        INCR    R0                              ; 5A61   0008
        MVO     R0,     G_01AE                  ; 5A62   0240 01AE
        SDBD                                    ; 5A64   0001
        MVII    #$0800, R1                      ; 5A65   02B9 0000 0008
        MVI     G_0198, R0                      ; 5A68   0280 0198
        TSTR    R0                              ; 5A6A   0080
        BEQ     L_5A71                          ; 5A6B   0204 0004

        SDBD                                    ; 5A6D   0001
        MVII    #$1800, R1                      ; 5A6E   02B9 0000 0018
L_5A71:
        MVI     G_033C, R3                      ; 5A71   0283 033C
        CMPR    R3,     R1                      ; 5A73   0159
        BC      L_5A77                          ; 5A74   0201 0001

        MOVR    R3,     R1                      ; 5A76   0099
L_5A77:
        ADDI    #$0200, R1                      ; 5A77   02F9 0200

        JSR     R5,     X_SQRT                  ; 5A79   0004 011C 0223

        SLR     R2,     1                       ; 5A7C   0062
        MVO     R2,     G_01AF                  ; 5A7D   0242 01AF
        SUBR    R3,     R1                      ; 5A7F   0119

        JSR     R5,     X_SQRT                  ; 5A80   0004 011C 0223

        SLR     R2,     1                       ; 5A83   0062
        MVO     R2,     G_01B0                  ; 5A84   0242 01B0
        MVI     G_0194, R0                      ; 5A86   0280 0194
        MOVR    R0,     R1                      ; 5A88   0081
        ANDI    #$0007, R1                      ; 5A89   03B9 0007
        SDBD                                    ; 5A8B   0001
        MVII    #$5B4E, R4                      ; 5A8C   02BC 004E 005B
        ADDR    R1,     R4                      ; 5A8F   00CC
        ADDR    R1,     R4                      ; 5A90   00CC
        MVI@    R4,     R2                      ; 5A91   02A2
        MVI@    R4,     R1                      ; 5A92   02A1
        ADDI    #$0024, R1                      ; 5A93   02F9 0024

        JSR     R5,     L_596A                  ; 5A95   0004 0158 016A

        SLR     R3,     2                       ; 5A98   0067
        SLR     R3,     1                       ; 5A99   0063
        BC      L_5A9D                          ; 5A9A   0201 0001

        NEGR    R3                              ; 5A9C   0023
L_5A9D:
        ADDR    R3,     R1                      ; 5A9D   00D9

        JSR     R5,     L_5955                  ; 5A9E   0004 0158 0155

        MOVR    R1,     R3                      ; 5AA1   008B
        CLRR    R1                              ; 5AA2   01C9
        RLC     R1,     1                       ; 5AA3   0051
        TSTR    R1                              ; 5AA4   0089
        BEQ     L_5AA8                          ; 5AA5   0204 0001

        NEGR    R2                              ; 5AA7   0022
L_5AA8:
        ADDI    #$0054, R2                      ; 5AA8   02FA 0054
        MVII    #$0320, R1                      ; 5AAA   02B9 0320
        MVI@    R1,     R4                      ; 5AAC   028C
        PSHR    R4                              ; 5AAD   0274
        PSHR    R3                              ; 5AAE   0273
        PSHR    R2                              ; 5AAF   0272
        MVI     G_035C, R0                      ; 5AB0   0280 035C
        MVO@    R0,     R1                      ; 5AB2   0248
        MVII    #$031F, R4                      ; 5AB3   02BC 031F

        JSR     R5,     .EXEC.7A3               ; 5AB5   0004 0114 03A3

        MOVR    R2,     R1                      ; 5AB8   0091
        SLL     R1,     2                       ; 5AB9   004D
        SLL     R1,     2                       ; 5ABA   004D
        SLL     R1,     1                       ; 5ABB   0049
        PSHR    R1                              ; 5ABC   0271
        MVI     G_01AF, R2                      ; 5ABD   0282 01AF
        ADD     G_01B0, R2                      ; 5ABF   02C2 01B0

        JSR     R5,     X_DIV                   ; 5AC1   0004 011C 01FB

        PULR    R1                              ; 5AC4   02B1
        MVII    #$0050, R2                      ; 5AC5   02BA 0050
        CMPR    R0,     R2                      ; 5AC7   0142
        BLE     L_5AE0                          ; 5AC8   0206 0016

        MVI     G_0198, R3                      ; 5ACA   0283 0198
        TSTR    R3                              ; 5ACC   009B
        BNEQ    L_5AE0                          ; 5ACD   020C 0011

        JSR     R5,     X_DIV                   ; 5ACF   0004 011C 01FB

        MOVR    R0,     R3                      ; 5AD2   0083
        MOVR    R0,     R2                      ; 5AD3   0082
        SLL     R2,     2                       ; 5AD4   004E
        MVI     G_033C, R1                      ; 5AD5   0281 033C

        JSR     R5,     X_DIV                   ; 5AD7   0004 011C 01FB

        SUBR    R0,     R3                      ; 5ADA   0103
        SAR     R3,     1                       ; 5ADB   006B
        MVO     R3,     G_01B0                  ; 5ADC   0243 01B0
        MVII    #$0050, R0                      ; 5ADE   02B8 0050
L_5AE0:
        MOVR    R0,     R3                      ; 5AE0   0083
        PULR    R2                              ; 5AE1   02B2
        SWAP    R2,     1                       ; 5AE2   0042
        XOR@    R6,     R2                      ; 5AE3   03F2
        PULR    R4                              ; 5AE4   02B4
        SAR     R3,     1                       ; 5AE5   006B
        CMPI    #$003F, R3                      ; 5AE6   037B 003F
        BLE     L_5AEC                          ; 5AE8   0206 0002

        MVII    #$003F, R3                      ; 5AEA   02BB 003F

L_5AEC:
        JSR     R5,     L_5E5E                  ; 5AEC   0004 015C 025E

        MVO     R0,     G_0344                  ; 5AEF   0240 0344
        MVO     R1,     G_034C                  ; 5AF1   0241 034C
        MVI     G_01B0, R0                      ; 5AF3   0280 01B0

        JSR     R5,     X_EXT_SIGN_LO           ; 5AF5   0004 0114 0268

        SLL     R0,     2                       ; 5AF8   004C
        SLL     R0,     1                       ; 5AF9   0048
        MVO     R0,     G_0354                  ; 5AFA   0240 0354
        MVI     G_0199, R0                      ; 5AFC   0280 0199
        MVO     R0,     G_01A9                  ; 5AFE   0240 01A9
        XORI    #$0001, R0                      ; 5B00   03F8 0001
        MVO     R0,     G_01B9                  ; 5B02   0240 01B9
        MVI     G_01AD, R0                      ; 5B04   0280 01AD
        MVII    #$001C, R1                      ; 5B06   02B9 001C
        MVI     G_0198, R2                      ; 5B08   0282 0198
        TSTR    R2                              ; 5B0A   0092
        BEQ     L_5B13                          ; 5B0B   0204 0006

        MVII    #$0001, R2                      ; 5B0D   02BA 0001
        MVO     R2,     G_01AD                  ; 5B0F   0242 01AD
        B       L_5B1A                          ; 5B11   0200 0007

L_5B13:
        SARC    R0,     1                       ; 5B13   0078
        BNC     L_5B1F                          ; 5B14   0209 0009

        MVII    #$0002, R2                      ; 5B16   02BA 0002
        MVO     R2,     G_01AD                  ; 5B18   0242 01AD
L_5B1A:
        SLL     R1,     1                       ; 5B1A   0049

        JSR     R5,     L_54DF                  ; 5B1B   0004 0154 00DF
        DECLE   $0016                           ; 5B1E   0016
L_5B1F:
        JSR     R5,     L_54DF                  ; 5B1F   0004 0154 00DF
        DECLE   $0020                           ; 5B22   0020

        MVO     R1,     G_01A0                  ; 5B23   0241 01A0
        MVI     G_01A7, R0                      ; 5B25   0280 01A7
        TSTR    R0                              ; 5B27   0080
        BNEQ    L_5B3A                          ; 5B28   020C 0010

        MVI     G_01A4, R0                      ; 5B2A   0280 01A4
        TSTR    R0                              ; 5B2C   0080
        BNEQ    L_5B33                          ; 5B2D   020C 0004

        CLRR    R0                              ; 5B2F   01C0
        MVO     R0,     G_01AA                  ; 5B30   0240 01AA
L_5B32:
        PULR    R7                              ; 5B32   02B7

L_5B33:
        CLRR    R0                              ; 5B33   01C0
        MVO     R0,     G_01A8                  ; 5B34   0240 01A8

        JSR     R5,     L_5636                  ; 5B36   0004 0154 0236

        PULR    R7                              ; 5B39   02B7
L_5B3A:
        J       L_5600                          ; 5B3A   0004 0354 0200

L_5B3D:
        PSHR    R5                              ; 5B3D   0275
        PSHR    R2                              ; 5B3E   0272
        MVI     G_031F, R2                      ; 5B3F   0282 031F
        SWAP    R2,     1                       ; 5B41   0042
        ANDI    #$00FF, R2                      ; 5B42   03BA 00FF
        ADDI    #$0004, R2                      ; 5B44   02FA 0004
        MVI     G_035C, R3                      ; 5B46   0283 035C
        SWAP    R3,     1                       ; 5B48   0043
        ANDI    #$00FF, R3                      ; 5B49   03BB 00FF
        J       .EXEC.6FC                       ; 5B4B   0004 0314 02FC

        DECLE   $000E,  $0038,  $001E,  $0004   ; 5B4E   000E 0038 001E 0004

        ADCR    R2                              ; 5B52   002A
        INCR    R2                              ; 5B53   000A
        ADCR    R4                              ; 5B54   002C
        DECR    R4                              ; 5B55   0014
        GSWD    R0                              ; 5B56   0030
        COMR    R0                              ; 5B57   0018
        ADCR    R4                              ; 5B58   002C
        NEGR    R4                              ; 5B59   0024
        ADCR    R2                              ; 5B5A   002A
        ADCR    R6                              ; 5B5B   002E
        DECR    R6                              ; 5B5C   0016
        NOP                                     ; 5B5D   0034
L_5B5E:
        PSHR    R5                              ; 5B5E   0275
        MVI     G_0199, R0                      ; 5B5F   0280 0199
        CMP     G_01A2, R0                      ; 5B61   0340 01A2
        BNEQ    L_5B88                          ; 5B63   020C 0023

        MVI     G_01A1, R0                      ; 5B65   0280 01A1
        CMPI    #$0003, R0                      ; 5B67   0378 0003
        BLT     L_5B88                          ; 5B69   0205 001D

        CLRR    R1                              ; 5B6B   01C9

        JSR     R5,     L_5955                  ; 5B6C   0004 0158 0155

        CLRR    R5                              ; 5B6F   01ED
        BNC     L_5B76                          ; 5B70   0209 0004

        XORI    #$0001, R1                      ; 5B72   03F9 0001
        XORI    #$0200, R5                      ; 5B74   03FD 0200
L_5B76:
        MVI     G_0195, R3                      ; 5B76   0283 0195
        ADDI    #$0322, R3                      ; 5B78   02FB 0322
        MVI@    R3,     R0                      ; 5B7A   0298
        PSHR    R0                              ; 5B7B   0270
        ANDI    #$000F, R0                      ; 5B7C   03B8 000F
        CMPI    #$000A, R0                      ; 5B7E   0378 000A
        BGE     L_5BA5                          ; 5B80   020D 0023

        XORI    #$0001, R1                      ; 5B82   03F9 0001
        XORI    #$0200, R5                      ; 5B84   03FD 0200
        B       L_5BA5                          ; 5B86   0200 001D

L_5B88:
        CLRR    R1                              ; 5B88   01C9
        CLRR    R5                              ; 5B89   01ED
        MVI     G_0196, R0                      ; 5B8A   0280 0196
        CMPI    #$0020, R0                      ; 5B8C   0378 0020
        BLE     L_5B99                          ; 5B8E   0206 0009

        ADDI    #$0002, R1                      ; 5B90   02F9 0002
        SDBD                                    ; 5B92   0001
        ADDI    #$0400, R5                      ; 5B93   02FD 0000 0004
        NEGR    R0                              ; 5B96   0020
        ADDI    #$0040, R0                      ; 5B97   02F8 0040
L_5B99:
        CMPI    #$0010, R0                      ; 5B99   0378 0010
        BLE     L_5BA3                          ; 5B9B   0206 0006

        INCR    R1                              ; 5B9D   0009
        ADDI    #$0200, R5                      ; 5B9E   02FD 0200
        NEGR    R0                              ; 5BA0   0020
        ADDI    #$0020, R0                      ; 5BA1   02F8 0020
L_5BA3:
        SAR     R0,     1                       ; 5BA3   0068
        PSHR    R0                              ; 5BA4   0270
L_5BA5:
        SDBD                                    ; 5BA5   0001
        MVII    #$5BF3, R4                      ; 5BA6   02BC 00F3 005B
        ADDR    R0,     R4                      ; 5BA9   00C4
        ADDR    R0,     R4                      ; 5BAA   00C4
        MVI@    R4,     R2                      ; 5BAB   02A2
        MVI@    R4,     R3                      ; 5BAC   02A3
        SWAP    R2,     1                       ; 5BAD   0042
        SAR     R2,     1                       ; 5BAE   006A
        SWAP    R3,     1                       ; 5BAF   0043
        SAR     R3,     1                       ; 5BB0   006B
        SARC    R1,     1                       ; 5BB1   0079
        BNC     L_5BB5                          ; 5BB2   0209 0001

        NEGR    R2                              ; 5BB4   0022
L_5BB5:
        MVO     R1,     G_0197                  ; 5BB5   0241 0197
        SARC    R1,     1                       ; 5BB7   0079
        BC      L_5BBB                          ; 5BB8   0201 0001

        NEGR    R3                              ; 5BBA   0023
L_5BBB:
        MVI     G_018D, R4                      ; 5BBB   0284 018D
        ADDI    #$031F, R4                      ; 5BBD   02FC 031F
        ADD@    R4,     R2                      ; 5BBF   02E2
        ADD@    R4,     R3                      ; 5BC0   02E3
        SDBD                                    ; 5BC1   0001
        ADDI    #$0400, R3                      ; 5BC2   02FB 0000 0004
        SUBI    #$0080, R2                      ; 5BC5   033A 0080
        MVI     G_0195, R1                      ; 5BC7   0281 0195
        ADDI    #$031D, R1                      ; 5BC9   02F9 031D
        MVI@    R1,     R0                      ; 5BCB   0288
        SDBD                                    ; 5BCC   0001
        ANDI    #$F9FF, R0                      ; 5BCD   03B8 00FF 00F9
        XORR    R5,     R0                      ; 5BD0   01E8
        MVO@    R0,     R1                      ; 5BD1   0248
        MVI@    R4,     R0                      ; 5BD2   02A0
        MOVR    R1,     R4                      ; 5BD3   008C
        ADDI    #$0002, R4                      ; 5BD4   02FC 0002
        MVO@    R2,     R4                      ; 5BD6   0262
        MVO@    R3,     R4                      ; 5BD7   0263
        MVO@    R0,     R4                      ; 5BD8   0260
        PULR    R0                              ; 5BD9   02B0
        MVO@    R0,     R4                      ; 5BDA   0260
        MVI     G_0195, R1                      ; 5BDB   0281 0195
        ADDI    #$031D, R1                      ; 5BDD   02F9 031D
        MVI@    R1,     R0                      ; 5BDF   0288
        SDBD                                    ; 5BE0   0001
        MVII    #$EFFF, R3                      ; 5BE1   02BB 00FF 00EF
        ANDR    R3,     R0                      ; 5BE4   0198
        COMR    R3                              ; 5BE5   001B
        MVI     G_0197, R2                      ; 5BE6   0282 0197
        TSTR    R2                              ; 5BE8   0092
        BEQ     L_5BEC                          ; 5BE9   0204 0001

        XORR    R3,     R0                      ; 5BEB   01D8
L_5BEC:
        CMPI    #$0325, R1                      ; 5BEC   0379 0325
        BEQ     L_5BF1                          ; 5BEE   0204 0001

        XORR    R3,     R0                      ; 5BF0   01D8
L_5BF1:
        MVO@    R0,     R1                      ; 5BF1   0248
        PULR    R7                              ; 5BF2   02B7

        DECLE   $000B,  $0000,  $000C,  $0001   ; 5BF3   000B 0000 000C 0001
        DECLE   $000C,  $0002,  $000A,  $0002   ; 5BF7   000C 0002 000A 0002
        DECLE   $000A,  $0002,  $0008,  $0002   ; 5BFB   000A 0002 0008 0002
        DECLE   $0008,  $0002,  $0007,  $0002   ; 5BFF   0008 0002 0007 0002
        DECLE   $0006,  $0002,  $000C,  $000E   ; 5C03   0006 0002 000C 000E
        DECLE   $000A,  $0010,  $000C,  $000A   ; 5C07   000A 0010 000C 000A
        DECLE   $000C,  $0000                   ; 5C0B   000C 0000
L_5C0D:
        PSHR    R5                              ; 5C0D   0275
        MVI     G_031F, R0                      ; 5C0E   0280 031F
        SDBD                                    ; 5C10   0001
        CMPI    #$3000, R0                      ; 5C11   0378 0000 0030
        BNC     L_5C2F                          ; 5C14   0209 0019

        SDBD                                    ; 5C16   0001
        CMPI    #$7000, R0                      ; 5C17   0378 0000 0070
        BC      L_5C29                          ; 5C1A   0201 000D

        SDBD                                    ; 5C1C   0001
        MVII    #$0933, R0                      ; 5C1D   02B8 0033 0009
L_5C20:
        MVII    #$0204, R4                      ; 5C20   02BC 0204
        MVII    #$000B, R1                      ; 5C22   02B9 000B
L_5C24:
        MVO@    R0,     R4                      ; 5C24   0260
        DECR    R1                              ; 5C25   0011
        BNEQ    L_5C24                          ; 5C26   022C 0003
        PULR    R7                              ; 5C28   02B7

L_5C29:
        SDBD                                    ; 5C29   0001
        MVII    #$0943, R0                      ; 5C2A   02B8 0043 0009
        B       L_5C20                          ; 5C2D   0220 000E

L_5C2F:
        SDBD                                    ; 5C2F   0001
        MVII    #$093B, R0                      ; 5C30   02B8 003B 0009
        B       L_5C20                          ; 5C33   0220 0014

L_5C35:
        PSHR    R5                              ; 5C35   0275
        MVI     G_01B7, R0                      ; 5C36   0280 01B7
        TSTR    R0                              ; 5C38   0080
        BEQ     L_5C3E                          ; 5C39   0204 0003

        DECR    R0                              ; 5C3B   0010
        MVO     R0,     G_01B7                  ; 5C3C   0240 01B7
L_5C3E:
        MVII    #$0007, R3                      ; 5C3E   02BB 0007
        MVI     G_0324, R0                      ; 5C40   0280 0324
        MOVR    R0,     R1                      ; 5C42   0081
        ANDI    #$000F, R0                      ; 5C43   03B8 000F
        CMPI    #$0004, R0                      ; 5C45   0378 0004
        BGE     L_5C4B                          ; 5C47   020D 0002

        MVI     G_01B8, R3                      ; 5C49   0283 01B8
L_5C4B:
        BEQ     L_5C55                          ; 5C4B   0204 0008

        CMPI    #$0001, R0                      ; 5C4D   0378 0001
        BEQ     L_5C55                          ; 5C4F   0204 0004

        SAR     R1,     2                       ; 5C51   006D
        SAR     R1,     2                       ; 5C52   006D
        MVO     R1,     G_0324                  ; 5C53   0241 0324
L_5C55:
        SDBD                                    ; 5C55   0001
        MVII    #$5C6A, R1                      ; 5C56   02B9 006A 005C
        SLL     R0,     1                       ; 5C59   0048
        ADDR    R0,     R1                      ; 5C5A   00C1
        SLL     R0,     1                       ; 5C5B   0048
        ADDR    R0,     R1                      ; 5C5C   00C1
        MVII    #$02E4, R4                      ; 5C5D   02BC 02E4

        JSR     R5,     X_PRINT_R1              ; 5C5F   0004 0118 0067

        SDBD                                    ; 5C62   0001
        MVII    #$502C, R1                      ; 5C63   02B9 002C 0050

        JSR     R5,     .EXEC.81E               ; 5C66   0004 0118 001E

        PULR    R7                              ; 5C69   02B7

        DECLE   $0020,  $0020,  $0020,  $0020   ; 5C6A   0020 0020 0020 0020
        DECLE   $0020,  $0000,  $004D,  $0041   ; 5C6E   0020 0000 004D 0041
        DECLE   $0054,  $0043,  $0048,  $0000   ; 5C72   0054 0043 0048 0000
        DECLE   $0020,  $0053,  $0045,  $0054   ; 5C76   0020 0053 0045 0054
        DECLE   $0020,  $0000,  $0020,  $0047   ; 5C7A   0020 0000 0020 0047
        DECLE   $0041,  $004D,  $0045,  $0000   ; 5C7E   0041 004D 0045 0000
        DECLE   $0044,  $0045,  $0055,  $0043   ; 5C82   0044 0045 0055 0043
        DECLE   $0045,  $0000,  $0020,  $004F   ; 5C86   0045 0000 0020 004F
        DECLE   $0055,  $0054,  $0021,  $0000   ; 5C8A   0055 0054 0021 0000
        DECLE   $0046,  $0041,  $0055,  $004C   ; 5C8E   0046 0041 0055 004C
        DECLE   $0054,  $0000,  $0020,  $004C   ; 5C92   0054 0000 0020 004C
        DECLE   $0045,  $0054,  $0020,  $0000   ; 5C96   0045 0054 0020 0000
L_5C9A:
        PSHR    R5                              ; 5C9A   0275
        MVI     G_01A1, R0                      ; 5C9B   0280 01A1
        CMPI    #$0004, R0                      ; 5C9D   0378 0004
        BLT     L_5CC1                          ; 5C9F   0205 0020

        MVI     G_01A5, R0                      ; 5CA1   0280 01A5
        DECR    R0                              ; 5CA3   0010
        MVO     R0,     G_01A5                  ; 5CA4   0240 01A5
        BEQ     L_5CC2                          ; 5CA6   0204 001A

        SARC    R0,     1                       ; 5CA8   0078
        BNC     L_5CC1                          ; 5CA9   0209 0016

        MVI     G_01A2, R1                      ; 5CAB   0281 01A2
        SLL     R1,     2                       ; 5CAD   004D
        SLL     R1,     2                       ; 5CAE   004D
        ADDI    #$0332, R1                      ; 5CAF   02F9 0332
        MVI@    R1,     R2                      ; 5CB1   028A
        INCR    R2                              ; 5CB2   000A
        MVO@    R2,     R1                      ; 5CB3   024A
        ADDI    #$0008, R1                      ; 5CB4   02F9 0008
        MVI@    R1,     R2                      ; 5CB6   028A
        INCR    R2                              ; 5CB7   000A
        MVO@    R2,     R1                      ; 5CB8   024A
        MVI     G_01A2, R0                      ; 5CB9   0280 01A2
        SLL     R0,     1                       ; 5CBB   0048
        ADDI    #$0004, R0                      ; 5CBC   02F8 0004

        JSR     R5,     .EXEC.41C               ; 5CBE   0004 0114 001C

L_5CC1:
        PULR    R7                              ; 5CC1   02B7

L_5CC2:
        MVI     G_01A2, R2                      ; 5CC2   0282 01A2
        SLL     R2,     2                       ; 5CC4   004E
        SLL     R2,     2                       ; 5CC5   004E
        ADDI    #$0332, R2                      ; 5CC6   02FA 0332
        MVII    #$0009, R0                      ; 5CC8   02B8 0009
        MVO@    R0,     R2                      ; 5CCA   0250
        ADDI    #$0008, R2                      ; 5CCB   02FA 0008
        MVII    #$0000, R0                      ; 5CCD   02B8 0000
        MVO@    R0,     R2                      ; 5CCF   0250
        CLRR    R0                              ; 5CD0   01C0
        MVO     R0,     G_01A1                  ; 5CD1   0240 01A1
        PULR    R7                              ; 5CD3   02B7

L_5CD4:
        PSHR    R5                              ; 5CD4   0275
        MVII    #$0006, R0                      ; 5CD5   02B8 0006
        MVI     G_0164, R1                      ; 5CD7   0281 0164
        TSTR    R1                              ; 5CD9   0089
        BNEQ    L_5CE4                          ; 5CDA   020C 0008

        MVII    #$0004, R0                      ; 5CDC   02B8 0004
        MVI     G_0174, R1                      ; 5CDE   0281 0174
        TSTR    R1                              ; 5CE0   0089
        BNEQ    L_5CE4                          ; 5CE1   020C 0001
        PULR    R7                              ; 5CE3   02B7

L_5CE4:
        JSR     R5,     .EXEC.41C               ; 5CE4   0004 0114 001C

        PULR    R7                              ; 5CE7   02B7

        DECLE   $0000,  $0000                   ; 5CE8   0000 0000

        ADDR    R6,     R2                      ; 5CEA   00F2
        SLLC    R0,     2                       ; 5CEB   005C
        RLC     R0,     1                       ; 5CEC   0050
        SLLC    R1,     2                       ; 5CED   005D
        SLL     R1,     2                       ; 5CEE   004D
        SLLC    R1,     2                       ; 5CEF   005D
        SLL     R1,     2                       ; 5CF0   004D
        SLLC    R1,     2                       ; 5CF1   005D
        PSHR    R5                              ; 5CF2   0275
        PSHR    R0                              ; 5CF3   0270

        JSR     R5,     L_5885                  ; 5CF4   0004 0158 0085

        PULR    R0                              ; 5CF7   02B0
        CMP     G_01A2, R1                      ; 5CF8   0341 01A2
        BNEQ    L_5D41                          ; 5CFA   020C 0045

        MVI     G_0193, R2                      ; 5CFC   0282 0193
        CMPI    #$0002, R2                      ; 5CFE   037A 0002
        BGE     L_5D41                          ; 5D00   020D 003F

        MVI     G_01A1, R2                      ; 5D02   0282 01A1
        CMPI    #$0004, R2                      ; 5D04   037A 0004
        BGE     L_5D41                          ; 5D06   020D 0039

        TSTR    R2                              ; 5D08   0092
        BNEQ    L_5D10                          ; 5D09   020C 0005

        MVI     G_01A3, R3                      ; 5D0B   0283 01A3
        TSTR    R3                              ; 5D0D   009B
        BNEQ    L_5D41                          ; 5D0E   020C 0031

L_5D10:
        CMPI    #$0003, R0                      ; 5D10   0378 0003
        BGT     L_5D41                          ; 5D12   020E 002D

        CMPI    #$0001, R0                      ; 5D14   0378 0001
        BLT     L_5D41                          ; 5D16   0205 0029

        MVO     R0,     G_01A3                  ; 5D18   0240 01A3
        TSTR    R2                              ; 5D1A   0092
        BNEQ    L_5D41                          ; 5D1B   020C 0024

        CLRR    R0                              ; 5D1D   01C0

        JSR     R5,     L_5955                  ; 5D1E   0004 0158 0155

        BNC     L_5D25                          ; 5D21   0209 0002

        ADDI    #$0004, R0                      ; 5D23   02F8 0004
L_5D25:
        MVI     G_01BE, R2                      ; 5D25   0282 01BE
        SWAP    R2,     2                       ; 5D27   0046
        BMI     L_5D2C                          ; 5D28   020B 0002

        XOR     G_01BF, R2                      ; 5D2A   03C2 01BF
L_5D2C:
        ANDI    #$0001, R2                      ; 5D2C   03BA 0001
        SDBD                                    ; 5D2E   0001
        MVII    #$5D45, R4                      ; 5D2F   02BC 0045 005D
        ADDR    R0,     R4                      ; 5D32   00C4
        ADDR    R2,     R4                      ; 5D33   00D4
        ADDR    R2,     R4                      ; 5D34   00D4
        MVI@    R4,     R2                      ; 5D35   02A2
        MVI@    R4,     R3                      ; 5D36   02A3
        MVO     R2,     G_01B5                  ; 5D37   0242 01B5
        MVO     R3,     G_01B6                  ; 5D39   0243 01B6
        MVII    #$0001, R0                      ; 5D3B   02B8 0001
        MVO     R0,     G_01A1                  ; 5D3D   0240 01A1
        MVO     R0,     G_01B4                  ; 5D3F   0240 01B4

L_5D41:
        JSR     R5,     L_58A0                  ; 5D41   0004 0158 00A0

        PULR    R7                              ; 5D44   02B7

        INCR    R1                              ; 5D45   0009
        SWAP    R0,     1                       ; 5D46   0040
        INCR    R7                              ; 5D47   000F

        ADCR    R1                              ; 5D48   0029
L_5D49:
        MOVR    R3,     R1                      ; 5D49   0099
        ADCR    R1                              ; 5D4A   0029
        MOVR    R4,     R0                      ; 5D4B   00A0
        SWAP    R0,     1                       ; 5D4C   0040
        MVII    #$0001, R2                      ; 5D4D   02BA 0001
        INCR    R7                              ; 5D4F   000F

        CLRR    R2                              ; 5D50   01D2
L_5D51:
        PSHR    R5                              ; 5D51   0275
        DECR    R0                              ; 5D52   0010
        BMI     L_5E5D                          ; 5D53   020B 0108

        JSR     R5,     L_5885                  ; 5D55   0004 0158 0085

        MVO     R2,     G_0198                  ; 5D58   0242 0198
        CMP     G_01A2, R1                      ; 5D5A   0341 01A2
        BNEQ    L_5E27                          ; 5D5C   020C 00C9

        MVI     G_01A1, R0                      ; 5D5E   0280 01A1
        TSTR    R0                              ; 5D60   0080
        BEQ     L_5E27                          ; 5D61   0204 00C4

        CMPI    #$0002, R0                      ; 5D63   0378 0002
        BEQ     L_5D6D                          ; 5D65   0204 0006

        CMPI    #$0003, R0                      ; 5D67   0378 0003
        BEQ     L_5D92                          ; 5D69   0204 0027
        B       L_5E5A                          ; 5D6B   0200 00ED

L_5D6D:
        CMP     G_019F, R1                      ; 5D6D   0341 019F
        BNEQ    L_5D90                          ; 5D6F   020C 001F

        MVI     G_032C, R2                      ; 5D71   0282 032C
        ADDI    #$0005, R2                      ; 5D73   02FA 0005
        MVII    #$0006, R0                      ; 5D75   02B8 0006
        MVO@    R0,     R2                      ; 5D77   0250
        ADDI    #$0008, R2                      ; 5D78   02FA 0008
        MVII    #$0009, R0                      ; 5D7A   02B8 0009
        MVO@    R0,     R2                      ; 5D7C   0250
        CLRR    R2                              ; 5D7D   01D2
        COMR    R2                              ; 5D7E   001A
        MVO     R2,     G_019F                  ; 5D7F   0242 019F
        MVII    #$0123, R0                      ; 5D81   02B8 0123
        MVO     R0,     G_0354                  ; 5D83   0240 0354
        MVII    #$0003, R0                      ; 5D85   02B8 0003
        MVO     R0,     G_01A1                  ; 5D87   0240 01A1
        MOVR    R1,     R0                      ; 5D89   0088
        SLL     R0,     1                       ; 5D8A   0048
        ADDI    #$0004, R0                      ; 5D8B   02F8 0004

        JSR     R5,     .EXEC.41C               ; 5D8D   0004 0114 001C

L_5D90:
        B       L_5E5A                          ; 5D90   0200 00C8

L_5D92:
        MVI     G_032C, R2                      ; 5D92   0282 032C
        ADDI    #$0005, R2                      ; 5D94   02FA 0005
        MVII    #$0007, R0                      ; 5D96   02B8 0007
        MVO@    R0,     R2                      ; 5D98   0250
        ADDI    #$0008, R2                      ; 5D99   02FA 0008
        MVII    #$000A, R0                      ; 5D9B   02B8 000A
        MVO@    R0,     R2                      ; 5D9D   0250
        MVI     G_033C, R0                      ; 5D9E   0280 033C
        SDBD                                    ; 5DA0   0001
        CMPI    #$1300, R0                      ; 5DA1   0378 0000 0013
        BGT     L_5DFC                          ; 5DA4   020E 0056

        SDBD                                    ; 5DA6   0001
        CMPI    #$0E00, R0                      ; 5DA7   0378 0000 000E
        BLT     L_5DFC                          ; 5DAA   0205 0050

        JSR     R5,     L_5E7E                  ; 5DAC   0004 015C 027E

        CLRR    R0                              ; 5DAF   01C0

        JSR     R5,     L_596A                  ; 5DB0   0004 0158 016A

        BNC     L_5DB6                          ; 5DB3   0209 0001

        INCR    R0                              ; 5DB5   0008

L_5DB6:
        JSR     R5,     L_5955                  ; 5DB6   0004 0158 0155

        BNC     L_5DBD                          ; 5DB9   0209 0002

        XORI    #$0002, R0                      ; 5DBB   03F8 0002
L_5DBD:
        MVO     R0,     G_01A6                  ; 5DBD   0240 01A6
        PSHR    R1                              ; 5DBF   0271
        MVI     G_01A3, R1                      ; 5DC0   0281 01A3
        SDBD                                    ; 5DC2   0001
        MVII    #$5E1F, R4                      ; 5DC3   02BC 001F 005E
        ADDR    R1,     R4                      ; 5DC6   00CC
        ADDR    R1,     R4                      ; 5DC7   00CC
        MVI@    R4,     R2                      ; 5DC8   02A2
        MVI@    R4,     R3                      ; 5DC9   02A3
        SARC    R0,     1                       ; 5DCA   0078
        BNC     L_5DD1                          ; 5DCB   0209 0004

        NEGR    R3                              ; 5DCD   0023
        SLL     R1,     1                       ; 5DCE   0049
        DECR    R1                              ; 5DCF   0011
        SUBR    R1,     R2                      ; 5DD0   010A
L_5DD1:
        SARC    R0,     1                       ; 5DD1   0078
        BNC     L_5DD5                          ; 5DD2   0209 0001

        NEGR    R2                              ; 5DD4   0022
L_5DD5:
        ADDI    #$0054, R2                      ; 5DD5   02FA 0054
        ADDI    #$003F, R3                      ; 5DD7   02FB 003F
        SWAP    R2,     1                       ; 5DD9   0042
        XORR    R3,     R2                      ; 5DDA   01DA
        MVII    #$003F, R3                      ; 5DDB   02BB 003F
        MVI     G_0320, R4                      ; 5DDD   0284 0320

        JSR     R5,     L_5E5E                  ; 5DDF   0004 015C 025E

        MVO     R0,     G_0344                  ; 5DE2   0240 0344
        MVO     R1,     G_034C                  ; 5DE4   0241 034C
        MVI     G_033C, R0                      ; 5DE6   0280 033C
        SAR     R0,     2                       ; 5DE8   006C
        SAR     R0,     2                       ; 5DE9   006C
        SUBI    #$0140, R0                      ; 5DEA   0338 0140
        MVO     R0,     G_0354                  ; 5DEC   0240 0354
        PULR    R1                              ; 5DEE   02B1
        MVI     G_0198, R0                      ; 5DEF   0280 0198
        TSTR    R0                              ; 5DF1   0080
        BEQ     L_5DFC                          ; 5DF2   0204 0008

        JSR     R5,     L_54DF                  ; 5DF4   0004 0154 00DF
        DECLE   $000A                           ; 5DF7   000A

        MVII    #$0028, R0                      ; 5DF8   02B8 0028
        MVO     R0,     G_0354                  ; 5DFA   0240 0354

L_5DFC:
        JSR     R5,     L_54DF                  ; 5DFC   0004 0154 00DF
        DECLE   $0017                           ; 5DFF   0017

        MVII    #$0004, R0                      ; 5E00   02B8 0004
        MVO     R0,     G_01A1                  ; 5E02   0240 01A1
        MVII    #$0005, R0                      ; 5E04   02B8 0005
        MVO     R0,     G_01A5                  ; 5E06   0240 01A5
        MVII    #$0001, R0                      ; 5E08   02B8 0001
        MVO     R0,     G_01A8                  ; 5E0A   0240 01A8
        MVO     R0,     G_01A4                  ; 5E0C   0240 01A4
        XORR    R1,     R0                      ; 5E0E   01C8
        MVO     R0,     G_01B9                  ; 5E0F   0240 01B9
        CLRR    R0                              ; 5E11   01C0
        MVO     R0,     G_01AA                  ; 5E12   0240 01AA
        MOVR    R1,     R0                      ; 5E14   0088
        MVO     R0,     G_01A9                  ; 5E15   0240 01A9
        SLL     R0,     1                       ; 5E17   0048
        ADDI    #$0004, R0                      ; 5E18   02F8 0004

        JSR     R5,     .EXEC.41C               ; 5E1A   0004 0114 001C

        B       L_5E5A                          ; 5E1D   0200 003B

        DECLE   $0000,  $0000,  $0021,  $0004   ; 5E1F   0000 0000 0021 0004

        NEGR    R2                              ; 5E23   0022
        INCR    R4                              ; 5E24   000C
        NEGR    R3                              ; 5E25   0023
        DECR    R2                              ; 5E26   0012
L_5E27:
        MVI     G_0194, R0                      ; 5E27   0280 0194
        TSTR    R0                              ; 5E29   0080
        BNEQ    L_5E5A                          ; 5E2A   020C 002E

        CMP     G_01A9, R1                      ; 5E2C   0341 01A9
        BEQ     L_5E5A                          ; 5E2E   0204 002A

        MVI     G_01A8, R0                      ; 5E30   0280 01A8
        TSTR    R0                              ; 5E32   0080
        BEQ     L_5E5A                          ; 5E33   0204 0025

        JSR     R5,     L_5E72                  ; 5E35   0004 015C 0272

        MVI     G_032C, R2                      ; 5E38   0282 032C
        ADDI    #$0003, R2                      ; 5E3A   02FA 0003
        MVI@    R2,     R0                      ; 5E3C   0290
        SDBD                                    ; 5E3D   0001
        ADDI    #$0E00, R0                      ; 5E3E   02F8 0000 000E
        CLRR    R2                              ; 5E41   01D2
        CMP     G_035C, R0                      ; 5E42   0340 035C
        BLT     L_5E47                          ; 5E44   0205 0001

        COMR    R2                              ; 5E46   001A

L_5E47:
        JSR     R5,     L_5955                  ; 5E47   0004 0158 0155

        BNC     L_5E4D                          ; 5E4A   0209 0001

        COMR    R2                              ; 5E4C   001A
L_5E4D:
        TSTR    R2                              ; 5E4D   0092
        BMI     L_5E56                          ; 5E4E   020B 0006
        B       L_5E52                          ; 5E50   0200 0000

L_5E52:
        MVII    #$0008, R0                      ; 5E52   02B8 0008
        B       L_5E58                          ; 5E54   0200 0002

L_5E56:
        MVII    #$0018, R0                      ; 5E56   02B8 0018
L_5E58:
        MVO     R0,     G_0194                  ; 5E58   0240 0194

L_5E5A:
        JSR     R5,     L_58A0                  ; 5E5A   0004 0158 00A0

L_5E5D:
        PULR    R7                              ; 5E5D   02B7

L_5E5E:
        PSHR    R5                              ; 5E5E   0275
        MVI     G_035C, R0                      ; 5E5F   0280 035C
        MVO     R0,     G_0320                  ; 5E61   0240 0320
        CLRR    R0                              ; 5E63   01C0

        JSR     R5,     .EXEC.9BB               ; 5E64   0004 0118 01BB

        MVO     R4,     G_0320                  ; 5E67   0244 0320
        ADDI    #$0004, R1                      ; 5E69   02F9 0004
        MVI@    R1,     R0                      ; 5E6B   0288
        CLRR    R2                              ; 5E6C   01D2
        MVO@    R2,     R1                      ; 5E6D   024A

        JSR     R5,     X_UNPK_BYTES            ; 5E6E   0004 0114 0357

        PULR    R7                              ; 5E71   02B7

L_5E72:
        PSHR    R5                              ; 5E72   0275

        JSR     R5,     X_PLAY_SFX1             ; 5E73   0004 0118 03BB
        DECLE   $0079                           ; 5E76  SFX data
        DECLE   $00CD                           ; 5E77  SFX data
        DECLE   $0035                           ; 5E78  SFX data
        DECLE   $005E                           ; 5E79  SFX data
        DECLE   $02EB                           ; 5E7A  SFX data
        DECLE   $03BE                           ; 5E7B  SFX data
        DECLE   $02EB                           ; 5E7C  SFX data
        DECLE   $03CF                           ; 5E7D  SFX end

L_5E7E:
        PSHR    R5                              ; 5E7E   0275

        JSR     R5,     X_PLAY_SFX1             ; 5E7F   0004 0118 03BB
        DECLE   $0040,  $0100                   ; 5E82  SFX data
        DECLE   $0048,  $0180                   ; 5E84  SFX data
        DECLE   $0044,  $01C0                   ; 5E86  SFX data
        DECLE   $000C,  $0200                   ; 5E88  SFX data
        DECLE   $0309                           ; 5E8A  SFX data
        DECLE   $03ED                           ; 5E8B  SFX data
        DECLE   $000B                           ; 5E8C  SFX data
        DECLE   $03EB                           ; 5E8D  SFX data
        DECLE   $0035                           ; 5E8E  SFX data
        DECLE   $03CF                           ; 5E8F  SFX end

UC_5E90:
        MOVR    R7,     R4                      ; 5E90  SLIB UCALL target
        SUBI    #$0007, R4                      ; 5E91   033C 0007
        PULR    R7                              ; 5E93   02B7

L_5E94:
        PSHR    R5                              ; 5E94   0275

        JSR     R5,     X_PLAY_SFX1             ; 5E95   0004 0118 03BB
        DECLE   $03B7                           ; 5E98  SFX data
        DECLE   $000C,  $0100                   ; 5E99  SFX data
        DECLE   $0077,  $0090,  $005E           ; 5E9B  SFX data
        DECLE   $0275                           ; 5E9E  SFX data
        DECLE   $0004,  $0118                   ; 5E9F  SFX data
        DECLE   $03BB                           ; 5EA1  SFX data
        DECLE   $0079                           ; 5EA2  SFX data
        DECLE   $03B7                           ; 5EA3  SFX data
        DECLE   $000C,  $0080                   ; 5EA4  SFX data
        DECLE   $010D                           ; 5EA6  SFX data
        DECLE   $010B                           ; 5EA7  SFX data
        DECLE   $03CF                           ; 5EA8  SFX end

L_5EA9:
        PSHR    R5                              ; 5EA9   0275

        JSR     R5,     X_PLAY_SFX1             ; 5EAA   0004 0118 03BB
        DECLE   $03E9                           ; 5EAD  SFX data
        DECLE   $0300,  $0060                   ; 5EAE  SFX data
        DECLE   $03E2                           ; 5EB0  SFX data
        DECLE   $03EB                           ; 5EB1  SFX data
        DECLE   $02CF                           ; 5EB2  SFX end

        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5EB3   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5EB7   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $00E0,  $00E0,  $00E0   ; 5EBB   00E0 00E0 00E0 00E0
        DECLE   $00E0,  $0000,  $0000,  $0000   ; 5EBF   00E0 0000 0000 0000
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5EC3   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC7   0000 0000 0000 0000
        DECLE   $0008,  $0008,  $0000,  $0000   ; 5ECB   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECF   0000 0000 0000 0000
        DECLE   $0010,  $0010,  $0000,  $0000   ; 5ED3   0010 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED7   0000 0000 0000 0000
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5EDB   0018 0018 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDF   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0006   ; 5EE3   0000 0000 0006 0006
        DECLE   $000C,  $001C,  $001E,  $0000   ; 5EE7   000C 001C 001E 0000
        DECLE   $0018,  $0018,  $0008,  $0038   ; 5EEB   0018 0018 0008 0038
        DECLE   $0028,  $0008,  $0008,  $000C   ; 5EEF   0028 0008 0008 000C
        DECLE   $0000,  $0000,  $0006,  $0006   ; 5EF3   0000 0000 0006 0006
        DECLE   $001C,  $001C,  $001E,  $0000   ; 5EF7   001C 001C 001E 0000
        DECLE   $000E,  $001F                   ; 5EFB   000E 001F

        DECR    R1                              ; 5EFD   0011
L_5EFE:
        DECR    R7                              ; 5EFE   0017

        DECLE   $0014,  $0010,  $0010,  $0008   ; 5EFF   0014 0010 0010 0008
        DECLE   $0000,  $0000,  $0006,  $0006   ; 5F03   0000 0000 0006 0006
        DECLE   $001C,  $003C,  $002E,  $0020   ; 5F07   001C 003C 002E 0020
        DECLE   $001C,  $003F,  $0021,  $0021   ; 5F0B   001C 003F 0021 0021
        DECLE   $0023,  $0024,  $0044,  $0040   ; 5F0F   0023 0024 0044 0040
        DECLE   $0000,  $0000,  $000C,  $000C   ; 5F13   0000 0000 000C 000C
        DECLE   $0078,  $0058,  $005E,  $0000   ; 5F17   0078 0058 005E 0000
        DECLE   $0038,  $003E,  $0022,  $0064   ; 5F1B   0038 003E 0022 0064
        DECLE   $0044,  $00C6,  $0080,  $0000   ; 5F1F   0044 00C6 0080 0000
        DECLE   $0000,  $0000,  $0006,  $0006   ; 5F23   0000 0000 0006 0006
        DECLE   $001C,  $003C,  $007E,  $0040   ; 5F27   001C 003C 007E 0040
        DECLE   $0038,  $003C,  $0024,  $0026   ; 5F2B   0038 003C 0024 0026
        DECLE   $00C2,  $0082,  $0003,  $0000   ; 5F2F   00C2 0082 0003 0000
        DECLE   $0000,  $0000,  $0006,  $0006   ; 5F33   0000 0000 0006 0006
        DECLE   $000C,  $001C,  $003E,  $0020   ; 5F37   000C 001C 003E 0020
        DECLE   $003C,  $001E,  $0012,  $0012   ; 5F3B   003C 001E 0012 0012
        DECLE   $0072,  $0042,  $0002,  $0003   ; 5F3F   0072 0042 0002 0003
        DECLE   $0080,  $0059,  $0079,  $0026   ; 5F43   0080 0059 0079 0026
        DECLE   $0018,  $0018,  $0000           ; 5F47   0018 0018 0000

        INCR    R4                              ; 5F4A   000C
        COMR    R6                              ; 5F4B   001E
        DECR    R2                              ; 5F4C   0012
        DECR    R1                              ; 5F4D   0011
        DECR    R2                              ; 5F4E   0012
        DECR    R2                              ; 5F4F   0012
        GSWD    R2                              ; 5F50   0032
        SWAP    R2,     2                       ; 5F51   0046
        SLR     R0,     2                       ; 5F52   0064

        JSR     R4,     .EXEC.C18               ; 5F53   0004 001C 0018
        DECLE   $0000,  $0018,  $0038,  $0078   ; 5F56   0000 0018 0038 0078
        DECLE   $000C,  $0072,  $0030,  $0018   ; 5F5A   000C 0072 0030 0018
        DECLE   $0010,  $0030,  $0050,  $0050   ; 5F5E   0010 0030 0050 0050
        DECLE   $0018,  $0000,  $0018,  $001B   ; 5F62   0018 0000 0018 001B
        DECLE   $000C,  $0030,  $0070,  $0070   ; 5F66   000C 0030 0070 0070
        DECLE   $0080,  $00B0,  $0030,  $0078   ; 5F6A   0080 00B0 0030 0078
        DECLE   $0018,  $00F0,  $0090,  $0020   ; 5F6E   0018 00F0 0090 0020
        DECLE   $0030,  $0000,  $0000,  $0006   ; 5F72   0030 0000 0000 0006
        DECLE   $0006,  $0008,  $0018,  $001E   ; 5F76   0006 0008 0018 001E
        DECLE   $0038,  $0000,  $0038,  $001C   ; 5F7A   0038 0000 0038 001C
        DECLE   $0006,  $0006,  $000C,  $0010   ; 5F7E   0006 0006 000C 0010
        DECLE   $0018,  $0000,  $0000,  $0006   ; 5F82   0018 0000 0000 0006
        DECLE   $0006,  $0008,  $0018,  $001E   ; 5F86   0006 0008 0018 001E
        DECLE   $0038,  $0000,  $0038,  $001C   ; 5F8A   0038 0000 0038 001C
        DECLE   $000A,  $0012,  $0032,  $0022   ; 5F8E   000A 0012 0032 0022
        DECLE   $0033,  $0000,  $0000,  $000E   ; 5F92   0033 0000 0000 000E
        DECLE   $0011,  $00F1,  $00F1,  $0011   ; 5F96   0011 00F1 00F1 0011
        DECLE   $000E,  $0000,  $0000,  $000E   ; 5F9A   000E 0000 0000 000E
        DECLE   $0011,  $0011,  $00F1,  $00D1   ; 5F9E   0011 0011 00F1 00D1
        DECLE   $000E,  $0000,  $0000,  $0006   ; 5FA2   000E 0000 0000 0006
        DECLE   $0009,  $0011,  $0031,  $00F1   ; 5FA6   0009 0011 0031 00F1
        DECLE   $008E,  $0000,  $000E,  $0012   ; 5FAA   008E 0000 000E 0012
        DECLE   $0012,  $0012,  $0032,  $00CC   ; 5FAE   0012 0012 0032 00CC
        DECLE   $0080,  $0000,  $0018,  $0024   ; 5FB2   0080 0000 0018 0024
        DECLE   $0024,  $0024,  $0024,  $0058   ; 5FB6   0024 0024 0024 0058
        DECLE   $0080,  $0000,  $0018,  $0028   ; 5FBA   0080 0000 0018 0028
        DECLE   $0028,  $0028,  $0030,  $0040   ; 5FBE   0028 0028 0030 0040
        DECLE   $0080,  $0020,  $0060,  $0060   ; 5FC2   0080 0020 0060 0060
        DECLE   $0060,  $0060,  $00C0,  $0080   ; 5FC6   0060 0060 00C0 0080
        DECLE   $0080,  $0060,  $0060,  $0060   ; 5FCA   0080 0060 0060 0060
        DECLE   $0060,  $0040,  $0080,  $0080   ; 5FCE   0060 0040 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5FD2   0080 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5FD6   0080 0080 0080 0080
        DECLE   $0080,  $0006,  $000A,  $0012   ; 5FDA   0080 0006 000A 0012
        DECLE   $0014,  $0018,  $0020,  $0040   ; 5FDE   0014 0018 0020 0040
        DECLE   $0000,  $0080,  $0080,  $0080   ; 5FE2   0000 0080 0080 0080
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5FE6   0080 0080 0080 0080
        DECLE   $0080,  $0006,  $000A,  $0012   ; 5FEA   0080 0006 000A 0012
        DECLE   $0014,  $0018,  $0020,  $0040   ; 5FEE   0014 0018 0020 0040
        DECLE   $0000,  $0000,  $0000           ; 5FF2   0000 0000 0000

        INCR    R6                              ; 5FF5   000E
        DECR    R1                              ; 5FF6   0011
        ADDR    R6,     R1                      ; 5FF7   00F1
        ADDR    R6,     R1                      ; 5FF8   00F1
        DECR    R1                              ; 5FF9   0011
        INCR    R6                              ; 5FFA   000E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFB   0000 0000 0000 0000
        DECLE   $0000                           ; 5FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $503E       <entry>
;;  $5043       <entry>
;;  $5048       <entry>
;;  $5058       <entry>
;;  $5069       <entry>
;;  $506E       <entry>
;;  $50A0       <entry>
;;  $50AF       $50BA  
;;  $50EF       $50ED  
;;  $5122       $50A1  
;;  $5134       $5144  
;;  $5176       $5178  
;;  $518D       $518D  
;;  $5283       $503F  
;;  $529A       $5288   $5293  
;;  $52AF       $529E  
;;  $52BD       $52B6  
;;  $52CC       $52AD  
;;  $52E8       $52CE  
;;  $52E9       $52C2  
;;  $5307       $52A8  
;;  $531F       $5310  
;;  $5327       $5323  
;;  $532D       $52C4  
;;  $533E       $5338  
;;  $5344       $52C8  
;;  $5348       $52A3  
;;  $535C       $5358  
;;  $5364       $52CA  
;;  $53A6       $5390  
;;  $53A7       $52DE   $5329   $5340   $5360  
;;  $53B3       $52E9   $5344  
;;  $53C0       $5044  
;;  $53D7       $53C5   $53D0  
;;  $53E4       $53DB  
;;  $53E5       $53E2  
;;  $53EF       $53E9  
;;  $53F1       $53ED  
;;  $53FA       $53E0  
;;  $5407       $5401  
;;  $5409       $5405  
;;  $5413       $540E  
;;  $5416       $5059  
;;  $5426       $5423  
;;  $5447       $5438  
;;  $545B       $5454  
;;  $5463       $545E  
;;  $5475       $546E  
;;  $54AC       $54A9  
;;  $54C1       $547C   $5480   $5488   $549C  
;;  $54C4       $5473  
;;  $54CA       $541A  
;;  $54DF       $5440   $5509   $5B1B   $5B1F   $5DF4   $5DFC  
;;  $54E0       $54BA  
;;  $54E5       $54F8  
;;  $54F3       $54EC   $54EF  
;;  $54FD       $544F   $5456   $548A  
;;  $550E       $5503  
;;  $550F       $546B  
;;  $5522       $5517  
;;  $5534       $5520  
;;  $5535       $5500   $5514   $551D  
;;  $553F       $543D  
;;  $5567       $555A  
;;  $5577       $5565   $5575  
;;  $5592       $558B   $558E  
;;  $559A       $5597  
;;  $55A6       $55A1  
;;  $55B1       $55A9  
;;  $55B4       $55AF  
;;  $55BC       $5555  
;;  $55C0       $557F   $5582   $55BA  
;;  $55D3       $55C3  
;;  $55E9       $5590   $55B8  
;;  $55F5       $5549  
;;  $55F6       $5544  
;;  $5600       $55EC   $5B3A  
;;  $5608       $55FE  
;;  $560C       $55E3  
;;  $562C       $5460   $5470  
;;  $5635       $5630  
;;  $5636       $55BC   $55CF   $55E5   $5610   $5632   $5B36  
;;  $5642       $563D  
;;  $564D       $5645  
;;  $5652       $564B  
;;  $5668       $55C7   $55D5   $5602   $56B6   $56E2   $5714   $5732   $576C  
;;  $566F       $5672  
;;  $5676       $566C  
;;  $5687       $567D  
;;  $5688       $5652  
;;  $5692       $5690  
;;  $56AB       $568E   $56A6   $56B3   $56B9   $56BF   $56D1  
;;  $56AF       $5699  
;;  $56BB       $56A9  
;;  $56C1       $56A0  
;;  $56CB       $56C4  
;;  $56D3       $569B   $56A4   $56C9  
;;  $56DB       $56D9  
;;  $570A       $5700   $5704  
;;  $570B       $56FE   $5706  
;;  $5712       $5710  
;;  $572B       $5720  
;;  $5740       $5689   $56EB   $5717  
;;  $5752       $574B  
;;  $5755       $56AB   $56D6  
;;  $576F       $5768  
;;  $5770       $575A   $5761  
;;  $5786       $5776  
;;  $579C       $56F2   $5727  
;;  $57B5       $57A6   $57AF  
;;  $57C5       $57BD  
;;  $57CD       $505C  
;;  $57FE       $57F0   $5807  
;;  $5802       $57D5   $57FC  
;;  $5805       $57E5  
;;  $5809       $57E2   $57ED  
;;  $5824       $580E   $5814   $581A   $5820  
;;  $5826       $505F  
;;  $585A       $5856  
;;  $5864       $5860  
;;  $5875       $5833   $5846  
;;  $587D       $5830   $5843  
;;  $5885       $5285   $5290   $52B3   $53C2   $53CD   $5828   $583B   $5CF4  
;;  $5885       $5D55  
;;  $588D       $5867  
;;  $58A0       $528B   $5296   $52B9   $53C8   $53D3   $5836   $5849   $5871  
;;  $58A0       $5D41   $5E5A  
;;  $58AB       $582D   $5840  
;;  $58BB       $58B3   $58B7  
;;  $58BC       $587E  
;;  $58CE       $58C6  
;;  $58E0       $58D1  
;;  $58E1       $58DE  
;;  $5903       $58F1   $58FA  
;;  $590D       $5909  
;;  $5919       $5914  
;;  $591F       $591D  
;;  $5927       $5924  
;;  $592D       $591B  
;;  $5938       $5910  
;;  $593D       $592B   $5936  
;;  $5940       $58CC  
;;  $594D       $58C0  
;;  $594E       $556D  
;;  $5955       $5355   $58EE   $5A4F   $5A9E   $5B6C   $5D1E   $5DB6   $5E47  
;;  $5958       $5953  
;;  $595F       $595A   $596F  
;;  $5969       $5965  
;;  $596A       $5A95   $5DB0  
;;  $5974       $5881  
;;  $5983       $5980  
;;  $599D       $5979  
;;  $59CC       $59C7  
;;  $59D3       $59D5  
;;  $59D7       $59CF  
;;  $59F3       $59EB   $59EF  
;;  $59F7       $59F9  
;;  $5A05       $59FF  
;;  $5A07       $5A03  
;;  $5A0A       $59FC  
;;  $5A0D       $59AA   $59AF   $59BA   $59C0   $59F4  
;;  $5A0E       $5876  
;;  $5A57       $5A52  
;;  $5A71       $5A6B  
;;  $5A77       $5A74  
;;  $5A9D       $5A9A  
;;  $5AA8       $5AA5  
;;  $5AE0       $5AC8   $5ACD  
;;  $5AEC       $5AE8  
;;  $5B13       $5B0B  
;;  $5B1A       $5B11  
;;  $5B1F       $5B14  
;;  $5B32       $5A24   $5A3A   $5A41   $5A4D   $5A5A  
;;  $5B33       $5B2D  
;;  $5B3A       $5B28  
;;  $5B3D       $5A36  
;;  $5B5E       $586E   $5879  
;;  $5B76       $5B70  
;;  $5B88       $5B63   $5B69  
;;  $5B99       $5B8E  
;;  $5BA3       $5B9B  
;;  $5BA5       $5B80   $5B86  
;;  $5BB5       $5BB2  
;;  $5BBB       $5BB8  
;;  $5BEC       $5BE9  
;;  $5BF1       $5BEE  
;;  $5C0D       $5062  
;;  $5C20       $5C2D   $5C33  
;;  $5C24       $5C26  
;;  $5C29       $5C1A  
;;  $5C2F       $5C14  
;;  $5C35       $506A  
;;  $5C3E       $5C39  
;;  $5C4B       $5C47  
;;  $5C55       $5C4B   $5C4F  
;;  $5C9A       $506F  
;;  $5CC1       $5C9F   $5CA9  
;;  $5CC2       $5CA6  
;;  $5CD4       $5072  
;;  $5CE4       $5CDA   $5CE1  
;;  $5D10       $5D09  
;;  $5D25       $5D21  
;;  $5D2C       $5D28  
;;  $5D41       $5CFA   $5D00   $5D06   $5D0E   $5D12   $5D16   $5D1B  
;;  $5D49       $5D47  
;;  $5D51       $5D4F  
;;  $5D6D       $5D65  
;;  $5D90       $5D6F  
;;  $5D92       $5D69  
;;  $5DB6       $5DB3  
;;  $5DBD       $5DB9  
;;  $5DD1       $5DCB  
;;  $5DD5       $5DD2  
;;  $5DFC       $5DA4   $5DAA   $5DF2  
;;  $5E27       $5D5C   $5D61  
;;  $5E47       $5E44  
;;  $5E4D       $5E4A  
;;  $5E52       $5E50  
;;  $5E56       $5E4E  
;;  $5E58       $5E54  
;;  $5E5A       $5D6B   $5D90   $5E1D   $5E2A   $5E2E   $5E33  
;;  $5E5D       $5D53  
;;  $5E5E       $5AEC   $5DDF  
;;  $5E72       $5E35  
;;  $5E7E       $5A5C   $5DAC  
;;  $5E90       <entry>
;;  $5E94       $554B  
;;  $5EA9       $55D8   $5605  
;;  $5EFE       $5EFE  
;; ======================================================================== ;;
