
        ORG     $5000
.HEADER:
        BIDECLE $57F9           ; 5000  Ptr: MOB graphic images
        BIDECLE $507B           ; 5002  Ptr: EXEC timer table
        BIDECLE $5368           ; 5004  Ptr: Start of game
        BIDECLE $50E7           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $52A7           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $009F           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0001           ; 500E  Color Stack / FGBG
        DECLE   $0008,  $0007   ; 500F  Color Stack init (0, 1)
        DECLE   $0007,  $0007   ; 5011  Color Stack init (2, 3)
        DECLE   $0005           ; 5013  Border color init

        DECLE   $01F8,  $01F0,  $01E8,  $01E0   ; 5014   01F8 01F0 01E8 01E0
        DECLE   $01D8,  $01D0,  $01C8,  $01C0   ; 5018   01D8 01D0 01C8 01C0
.TITLE:
        DECLE   $004F                           ; 501C  Cartridge year
        STRING  "ROULETTE"                      ; 501D  Title string
        DECLE   $0000                           ; 5025  

.TITLECODE:
        PSHR    R5                              ; 5026   0275
        MVI     .PSG0.rgt_hand,R0               ; 5027   0280 01FE
        CMPI    #$001E, R0                      ; 5029   0378 001E
        BNEQ    L_5079                          ; 502B   020C 004C

        MVI     .PSG0.lft_hand,R0               ; 502D   0280 01FF
        CMPI    #$005E, R0                      ; 502F   0378 005E
        BNEQ    L_5079                          ; 5031   020C 0046

        MVII    #$0007, R3                      ; 5033   02BB 0007
        MVII    #$023C, R4                      ; 5035   02BC 023C

        JSR     R5,     X_PRINT_R5              ; 5037   0004 0118 007B
        STRING  "        JOHN        "          ; 503A  
        DECLE   $0000                           ; 504E   0000

        MVII    #$0007, R3                      ; 504F   02BB 0007
        MVII    #$0292, R4                      ; 5051   02BC 0292

        JSR     R5,     X_PRINT_R5              ; 5053   0004 0118 007B
        STRING  "ETTELUOR"                      ; 5056  
        DECLE   $0000                           ; 505E   0000

        MVII    #$0007, R3                      ; 505F   02BB 0007
        MVII    #$02D0, R4                      ; 5061   02BC 02D0

        JSR     R5,     X_PRINT_R5              ; 5063   0004 0118 007B
        STRING  "2001"                          ; 5066   0032 0030 0030 0031
        DECLE   $0000                           ; 506A   0000

        MVII    #$0007, R3                      ; 506B   02BB 0007
        MVII    #$02D5, R4                      ; 506D   02BC 02D5

        JSR     R5,     X_PRINT_R5              ; 506F   0004 0118 007B
        STRING  " D E I"                        ; 5072  
        DECLE   $0000                           ; 5078   0000
L_5079:
        PULR    R5                              ; 5079   02B5
        MOVR    R5,     R7                      ; 507A   00AF

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 507B  Timer dispatch/interval
        DECLE   $0093,  $0050,  $0004,  $0000; 507F  Timer dispatch/interval
        DECLE   $0057,  $005A,  $0000,  $0000; 5083  Timer dispatch/interval
        DECLE   $0064,  $0059,  $0000,  $0000; 5087  Timer dispatch/interval
        DECLE   $00BA,  $005A,  $0001,  $0000; 508B  Timer dispatch/interval
        BIDECLE $0000           ; 508F  End of timer table

        DECLE   $0000,  $0000                   ; 5091   0000 0000
L_5093:
        PSHR    R5                              ; 5093   0275
        MVII    #$02DD, R4                      ; 5094   02BC 02DD
        SDBD                                    ; 5096   0001
        MVII    #$1000, R1                      ; 5097   02B9 0000 0010
        MVII    #$0190, R5                      ; 509A   02BD 0190
        MVII    #$0325, R3                      ; 509C   02BB 0325
L_509E:
        ADDI    #$0008, R3                      ; 509E   02FB 0008
        CMPI    #$0196, R5                      ; 50A0   037D 0196
        BEQ     L_50D5                          ; 50A2   0204 0031

        MVI@    R5,     R0                      ; 50A4   02A8
        TSTR    R0                              ; 50A5   0080
        BNEQ    L_50AC                          ; 50A6   020C 0004

        ADDI    #$0003, R4                      ; 50A8   02FC 0003
        B       L_509E                          ; 50AA   0220 000D

L_50AC:
        MVI@    R3,     R0                      ; 50AC   0298
        XORR    R1,     R0                      ; 50AD   01C8
        MVO@    R0,     R3                      ; 50AE   0258
        MVI     G_01A0, R0                      ; 50AF   0280 01A0
        TSTR    R0                              ; 50B1   0080
        BNEQ    L_50C4                          ; 50B2   020C 0010

        PSHR    R1                              ; 50B4   0271
        PSHR    R3                              ; 50B5   0273
        PSHR    R4                              ; 50B6   0274
        PSHR    R5                              ; 50B7   0275

        JSR     R5,     L_550D                  ; 50B8   0004 0154 010D
        JSR     R5,     L_552C                  ; 50BB   0004 0154 012C

        PULR    R5                              ; 50BE   02B5
        PULR    R4                              ; 50BF   02B4
        PULR    R3                              ; 50C0   02B3
        PULR    R1                              ; 50C1   02B1
        B       L_509E                          ; 50C2   0220 0025

L_50C4:
        PSHR    R1                              ; 50C4   0271
        PSHR    R3                              ; 50C5   0273
        PSHR    R5                              ; 50C6   0275
        MVII    #$0003, R0                      ; 50C7   02B8 0003
        SDBD                                    ; 50C9   0001
        MVII    #$2A06, R1                      ; 50CA   02B9 0006 002A

        JSR     R5,     X_FILL_MEM              ; 50CD   0004 0114 0341

        PULR    R5                              ; 50D0   02B5
        PULR    R3                              ; 50D1   02B3
        PULR    R1                              ; 50D2   02B1
        B       L_509E                          ; 50D3   0220 0036

L_50D5:
        MVI     G_01A0, R0                      ; 50D5   0280 01A0
        XORI    #$0001, R0                      ; 50D7   03F8 0001
        MVO     R0,     G_01A0                  ; 50D9   0240 01A0
        PULR    R7                              ; 50DB   02B7

        MVI     .PSG0.rgt_hand,R0               ; 50DC   0280 01FE
        COMR    R0                              ; 50DE   0018
        MVO     R0,     G_0124                  ; 50DF   0240 0124
        MVI     .PSG0.lft_hand,R0               ; 50E1   0280 01FF
        COMR    R0                              ; 50E3   0018
        MVO     R0,     G_0123                  ; 50E4   0240 0123
        MOVR    R5,     R7                      ; 50E6   00AF

.GFX_LIST_50E7:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50E7   0000 0000 0000 0000
        DECLE   $03FF,  $0000,  $0000,  $03FF   ; 50EB   03FF 0000 0000 03FF
        DECLE   $0001,  $0001,  $0003,  $0002   ; 50EF  CART PIC #01
        DECLE   $0006,  $0004,  $000C,  $0008   ; 50F3  
        DECLE   $0018,  $0010,  $0030,  $00E0   ; 50F7  CART PIC #02
        DECLE   $00C0,  $00E0,  $0030,  $0010   ; 50FB  
        DECLE   $0018,  $0008,  $000C,  $0004   ; 50FF  CART PIC #03
        DECLE   $0006,  $0002,  $0003,  $0001   ; 5103  
        DECLE   $00FF,  $0001,  $0001,  $0001   ; 5107  CART PIC #04
        DECLE   $0001,  $0001,  $0001,  $0001   ; 510B  
        DECLE   $0001,  $0001,  $0001,  $0001   ; 510F  CART PIC #05
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5113  
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5117  CART PIC #06
        DECLE   $0000,  $0000,  $0000,  $0000   ; 511B  
        DECLE   $0001,  $0000,  $0000,  $0000   ; 511F  CART PIC #07
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5123  
        DECLE   $0001,  $0001,  $0001,  $00FD   ; 5127  CART PIC #08
        DECLE   $0085,  $00FD,  $0001,  $0001   ; 512B  
        DECLE   $0001,  $00FD,  $0085,  $00FD   ; 512F  CART PIC #09
        DECLE   $0001,  $00FD,  $0085,  $00FD   ; 5133  
        DECLE   $00FF,  $0001,  $0001,  $007D   ; 5137  CART PIC #0A
        DECLE   $0045,  $0045,  $007D,  $0001   ; 513B  
        DECLE   $00FF,  $0001,  $0001,  $0005   ; 513F  CART PIC #0B
        DECLE   $007D,  $0045,  $0001,  $0001   ; 5143  
        DECLE   $00FF,  $0001,  $0001,  $0075   ; 5147  CART PIC #0C
        DECLE   $0055,  $0055,  $005D,  $0001   ; 514B  
        DECLE   $00FF,  $0001,  $0001,  $007D   ; 514F  CART PIC #0D
        DECLE   $0055,  $0055,  $0045,  $0001   ; 5153  
        DECLE   $00FF,  $0001,  $0001,  $007D   ; 5157  CART PIC #0E
        DECLE   $0009,  $0009,  $0079,  $0001   ; 515B  
        DECLE   $00FF,  $0001,  $0001,  $005D   ; 515F  CART PIC #0F
        DECLE   $0055,  $0055,  $0075,  $0001   ; 5163  
        DECLE   $00FF,  $0001,  $0001,  $005D   ; 5167  CART PIC #10
        DECLE   $0055,  $0055,  $007D,  $0001   ; 516B  
        DECLE   $00FF,  $0001,  $0001,  $0061   ; 516F  CART PIC #11
        DECLE   $0051,  $004D,  $0041,  $0001   ; 5173  
        DECLE   $00FF,  $0001,  $0001,  $006D   ; 5177  CART PIC #12
        DECLE   $0055,  $0055,  $006D,  $0001   ; 517B  
        DECLE   $00FF,  $0001,  $0001,  $007D   ; 517F  CART PIC #13
        DECLE   $0055,  $0055,  $0075,  $0001   ; 5183  
        DECLE   $00FF,  $0000,  $003E,  $0002   ; 5187  CART PIC #14
        DECLE   $003E,  $0020,  $003E,  $0000   ; 518B  
        DECLE   $0001,  $0005,  $007D,  $0045   ; 518F  CART PIC #15
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5193  
        DECLE   $0001,  $0075,  $0055,  $0055   ; 5197  CART PIC #16
        DECLE   $005D,  $0001,  $0001,  $0001   ; 519B  
        DECLE   $0001,  $007D,  $0055,  $0055   ; 519F  CART PIC #17
        DECLE   $0045,  $0001,  $0001,  $0001   ; 51A3  
        DECLE   $00FF,  $0000,  $001F,  $0000   ; 51A7  CART PIC #18
        DECLE   $000E,  $000A,  $000E,  $0000   ; 51AB  
        DECLE   $0008,  $000E,  $0008,  $0000   ; 51AF  CART PIC #19
        DECLE   $001D,  $0015,  $0017,  $0000   ; 51B3  
        DECLE   $00FF,  $0000,  $0018,  $0008   ; 51B7  CART PIC #1A
        DECLE   $0008,  $0008,  $003E,  $0000   ; 51BB  
        DECLE   $00FF,  $0001,  $00F9,  $0009   ; 51BF  CART PIC #1B
        DECLE   $00F9,  $0081,  $00F9,  $0001   ; 51C3  
        DECLE   $00FF,  $0000,  $003E,  $0002   ; 51C7  CART PIC #1C
        DECLE   $000E,  $0002,  $003E,  $0000   ; 51CB  
        DECLE   $00FF,  $0000,  $0000,  $0022   ; 51CF  CART PIC #1D
        DECLE   $0027,  $0052,  $00F3,  $0000   ; 51D3  
        DECLE   $00FF,  $0000,  $0001,  $0001   ; 51D7  CART PIC #1E
        DECLE   $00F7,  $0055,  $0057,  $0000   ; 51DB  
        DECLE   $00FF,  $0000,  $0001,  $0001   ; 51DF  CART PIC #1F
        DECLE   $00F7,  $0055,  $0047,  $0000   ; 51E3  
        DECLE   $00FF,  $0000,  $0004,  $0004   ; 51E7  CART PIC #20
        DECLE   $0004,  $0004,  $0004,  $0000   ; 51EB  
        DECLE   $00FF,  $0000,  $000B,  $000A   ; 51EF  CART PIC #21
        DECLE   $00C9,  $000A,  $000B,  $0000   ; 51F3  
        DECLE   $00FF,  $0001,  $00C1,  $0041   ; 51F7  CART PIC #22
        DECLE   $0081,  $0041,  $00C1,  $0001   ; 51FB  
        DECLE   $00FF,  $0000,  $007A,  $0042   ; 51FF  CART PIC #23
        DECLE   $0073,  $0041,  $0078,  $0000   ; 5203  
        DECLE   $00FF,  $0000,  $002F,  $0028   ; 5207  CART PIC #24
        DECLE   $006E,  $00C8,  $008F,  $0000   ; 520B  
        DECLE   $00FF,  $0001,  $0045,  $0065   ; 520F  CART PIC #25
        DECLE   $0055,  $004D,  $0045,  $0001   ; 5213  
        DECLE   $00FF,  $0000,  $001F,  $0011   ; 5217  CART PIC #26
        DECLE   $0011,  $0011,  $001F,  $0000   ; 521B  
        DECLE   $00FF,  $0000,  $0079,  $0045   ; 521F  CART PIC #27
        DECLE   $0045,  $0045,  $0079,  $0000   ; 5223  
        DECLE   $00FF,  $0001,  $00E1,  $0011   ; 5227  CART PIC #28
        DECLE   $0011,  $0011,  $00E1,  $0001   ; 522B  
        DECLE   $00FF,  $0000,  $005E,  $0052   ; 522F  CART PIC #29
        DECLE   $005E,  $0042,  $005E,  $0000   ; 5233  
        DECLE   $00FF,  $0000,  $0007,  $0000   ; 5237  CART PIC #2A
        DECLE   $0063,  $0000,  $0007,  $0000   ; 523B  
        DECLE   $00FF,  $0001,  $00BD,  $00A1   ; 523F  CART PIC #2B
        DECLE   $00BD,  $00A5,  $00BD,  $0001   ; 5243  
        DECLE   $0001,  $007D,  $0045,  $0045   ; 5247  CART PIC #2C
        DECLE   $007D,  $0001,  $0001,  $0001   ; 524B  
        DECLE   $00FF,  $0001,  $00F9,  $0089   ; 524F  CART PIC #2D
        DECLE   $0089,  $0089,  $00F9,  $0001   ; 5253  
        DECLE   $00FF,  $0001,  $0061,  $0021   ; 5257  CART PIC #2E
        DECLE   $0021,  $0021,  $00F9,  $0001   ; 525B  
        DECLE   $00FF,  $0001,  $00F9,  $0009   ; 525F  CART PIC #2F
        DECLE   $00F9,  $0081,  $00F9,  $0001   ; 5263  
        DECLE   $00FF,  $0001,  $00F9,  $0009   ; 5267  CART PIC #30
        DECLE   $0079,  $0009,  $00F9,  $0001   ; 526B  
        DECLE   $00FF,  $0001,  $0089,  $0089   ; 526F  CART PIC #31
        DECLE   $00F9,  $0009,  $0009,  $0001   ; 5273  
        DECLE   $00FF,  $0001,  $00F9,  $0081   ; 5277  CART PIC #32
        DECLE   $00F9,  $0009,  $00F9,  $0001   ; 527B  
        DECLE   $00FF,  $0001,  $00F9,  $0081   ; 527F  CART PIC #33
        DECLE   $00F9,  $0089,  $00F9,  $0001   ; 5283  
        DECLE   $00FF,  $0001,  $00F9,  $0009   ; 5287  CART PIC #34
        DECLE   $0011,  $0021,  $0021,  $0001   ; 528B  
        DECLE   $00FF,  $0001,  $00F9,  $0089   ; 528F  CART PIC #35
        DECLE   $0071,  $0089,  $00F9,  $0001   ; 5293  
        DECLE   $00FF,  $0001,  $00F9,  $0089   ; 5297  CART PIC #36
        DECLE   $00F9,  $0009,  $00F9,  $0001   ; 529B  
        DECLE   $00FF,  $0000,  $003E,  $0022   ; 529F  CART PIC #37
        DECLE   $0022,  $0022,  $003E,  $0000   ; 52A3  
.GRAM_INIT_52A7:
        DECLE   $0038           ; 52A7  # of GRAM cards to init
        DECLE   $0001,  $0004   ; 52A8  #00   :  4x4 tile
        DECLE   $0003,  $0380   ; 52AA  #01-08:  CART #01-08 ----
        DECLE   $0013,  $0380   ; 52AC  #09-10:  CART #09-10 ----
        DECLE   $0023,  $0380   ; 52AE  #11-18:  CART #11-18 ----
        DECLE   $0033,  $0380   ; 52B0  #19-20:  CART #19-20 ----
        DECLE   $0043,  $0380   ; 52B2  #21-28:  CART #21-28 ----
        DECLE   $0053,  $0380   ; 52B4  #29-30:  CART #29-30 ----
        DECLE   $0063,  $0300   ; 52B6  #31-37:  CART #31-37 ----

        DECLE   $0008,  $0020,  $006A,  $0083   ; 52B8   0008 0020 006A 0083
        DECLE   $009A,  $0062,  $007B,  $0092   ; 52BC   009A 0062 007B 0092
        DECLE   $005A,  $0073,  $008A,  $0052   ; 52C0   005A 0073 008A 0052
        DECLE   $006B,  $0082,  $00C0,  $0020   ; 52C4   006B 0082 00C0 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52C8   0000 0000 0000 0000
        DECLE   $0010,  $0048,  $002A,  $002B   ; 52CC   0010 0048 002A 002B
        DECLE   $002A,  $00AA,  $00AB,  $00AA   ; 52D0   002A 00AA 00AB 00AA
        DECLE   $00B2,  $00B3,  $00B2,  $00BA   ; 52D4   00B2 00B3 00B2 00BA
        DECLE   $00BB,  $00BA,  $00C8,  $0028   ; 52D8   00BB 00BA 00C8 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52DC   0000 0000 0000 0000
        DECLE   $0018,  $0028,  $0063,  $007A   ; 52E0   0018 0028 0063 007A
        DECLE   $0093,  $005B,  $0072,  $008B   ; 52E4   0093 005B 0072 008B
        DECLE   $0053,  $006A,  $0083,  $009B   ; 52E8   0053 006A 0083 009B
        DECLE   $0062,  $007B,  $00C0,  $0020   ; 52EC   0062 007B 00C0 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 52F0   0000 0000 0000 0000
        DECLE   $0008,  $0020,  $002B,  $002A   ; 52F4   0008 0020 002B 002A
        DECLE   $002B,  $00AB,  $00AA,  $00AB   ; 52F8   002B 00AB 00AA 00AB
        DECLE   $00B3,  $00B2,  $00B3,  $00B3   ; 52FC   00B3 00B2 00B3 00B3
        DECLE   $00BA,  $00BB,  $00C8,  $0028   ; 5300   00BA 00BB 00C8 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5304   0000 0000 0000 0000
        DECLE   $0010,  $0040,  $005A,  $0073   ; 5308   0010 0040 005A 0073
        DECLE   $008A,  $0053,  $006B,  $0082   ; 530C   008A 0053 006B 0082
        DECLE   $009A,  $0063,  $007A,  $0093   ; 5310   009A 0063 007A 0093
        DECLE   $005B,  $0072,  $00C0,  $0020   ; 5314   005B 0072 00C0 0020
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5318   0000 0000 0000 0000
        DECLE   $0018,  $0028,  $002A,  $002B   ; 531C   0018 0028 002A 002B
        DECLE   $002A,  $00AB,  $00AB,  $00AA   ; 5320   002A 00AB 00AB 00AA
        DECLE   $00AA,  $00B3,  $00B2,  $00B3   ; 5324   00AA 00B3 00B2 00B3
        DECLE   $00BB,  $00BA,  $00C8,  $0028   ; 5328   00BB 00BA 00C8 0028
        DECLE   $0000,  $0000,  $0000,  $0000   ; 532C   0000 0000 0000 0000
        DECLE   $0038,  $0020,  $00D0,  $00E8   ; 5330   0038 0020 00D0 00E8
        DECLE   $00D0,  $00D8,  $00A0,  $00F0   ; 5334   00D0 00D8 00A0 00F0
        DECLE   $00D0,  $00D8,  $00E0,  $00F8   ; 5338   00D0 00D8 00E0 00F8
        DECLE   $00D0,  $00D8,  $0030,  $0030   ; 533C   00D0 00D8 0030 0030
        DECLE   $0000,  $0000,  $0000,  $0028   ; 5340   0000 0000 0000 0028
        DECLE   $0100,  $0108,  $0110,  $0118   ; 5344   0100 0108 0110 0118
        DECLE   $0120,  $0128,  $0032,  $0022   ; 5348   0120 0128 0032 0022
        DECLE   $0033,  $0023,  $0130,  $0138   ; 534C   0033 0023 0130 0138
        DECLE   $0140,  $0148,  $0150,  $0158   ; 5350   0140 0148 0150 0158
        DECLE   $0000,  $0000,  $0000           ; 5354   0000 0000 0000

        RSWD    R0                              ; 5357   0038
        GSWD    R0                              ; 5358   0030
        GSWD    R0                              ; 5359   0030
        GSWD    R0                              ; 535A   0030
        GSWD    R0                              ; 535B   0030
        GSWD    R0                              ; 535C   0030
        GSWD    R0                              ; 535D   0030
        GSWD    R0                              ; 535E   0030
        GSWD    R0                              ; 535F   0030
        GSWD    R0                              ; 5360   0030
        GSWD    R0                              ; 5361   0030
        GSWD    R0                              ; 5362   0030
        GSWD    R0                              ; 5363   0030
        GSWD    R0                              ; 5364   0030
        GSWD    R0                              ; 5365   0030
        GSWD    R0                              ; 5366   0030
        GSWD    R0                              ; 5367   0030
.START:
        PSHR    R5                              ; 5368   0275
        SDBD                                    ; 5369   0001
        MVII    #$0093, R0                      ; 536A   02B8 0093 0000
        MVII    #$015D, R4                      ; 536D   02BC 015D

        JSR     R5,     X_FILL_ZERO             ; 536F   0004 0114 0338

        MVII    #$0002, R0                      ; 5372   02B8 0002
        MVO     R0,     G_0186                  ; 5374   0240 0186
        MVII    #$0005, R0                      ; 5376   02B8 0005
        MVO     R0,     G_0187                  ; 5378   0240 0187

        JSR     R5,     L_53F8                  ; 537A   0004 0150 03F8

        MVII    #$0216, R4                      ; 537D   02BC 0216
        SDBD                                    ; 537F   0001
        MVII    #$2207, R3                      ; 5380   02BB 0007 0022
        MVII    #$0004, R0                      ; 5383   02B8 0004

        JSR     R5,     L_57B2                  ; 5385   0004 0154 03B2

        SDBD                                    ; 5388   0001
        MVII    #$507F, R1                      ; 5389   02B9 007F 0050

        JSR     R5,     X_TIMER_STOP            ; 538C   0004 0118 0038

        ADDI    #$0004, R1                      ; 538F   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 5391   0004 0118 0038

        ADDI    #$0004, R1                      ; 5394   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 5396   0004 0118 0038

        ADDI    #$0004, R1                      ; 5399   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 539B   0004 0118 0038
        JSR     R5,     X_PRINT_R5              ; 539E   0004 0118 007B
        STRING  "STAKE:"                        ; 53A1  
        DECLE   $0000                           ; 53A7   0000

        MVII    #$023E, R4                      ; 53A8   02BC 023E
        SDBD                                    ; 53AA   0001
        MVII    #$2207, R3                      ; 53AB   02BB 0007 0022

        JSR     R5,     X_PRINT_R5              ; 53AE   0004 0118 007B
        STRING  "PLAYER 1"                      ; 53B1  
        DECLE   $0000                           ; 53B9   0000

        JSR     R5,     L_57C6                  ; 53BA   0004 0154 03C6

        MVII    #$0256, R1                      ; 53BD   02B9 0256
        CLRR    R2                              ; 53BF   01D2

        JSR     R5,     X_GETNUM                ; 53C0   0004 0118 00FF

        MVO     R0,     G_015E                  ; 53C3   0240 015E
        SWAP    R0,     1                       ; 53C5   0040
        MVO     R0,     G_015F                  ; 53C6   0240 015F
        TSTR    R0                              ; 53C8   0080
        BNEQ    L_53CE                          ; 53C9   020C 0003

        DECR    R0                              ; 53CB   0010
        MVO     R0,     G_0162                  ; 53CC   0240 0162
L_53CE:
        MVII    #$027A, R4                      ; 53CE   02BC 027A
        SDBD                                    ; 53D0   0001
        MVII    #$2207, R3                      ; 53D1   02BB 0007 0022

        JSR     R5,     X_PRINT_R5              ; 53D4   0004 0118 007B
        STRING  "PLAYER 2"                      ; 53D7  
        DECLE   $0000                           ; 53DF   0000

        JSR     R5,     L_57C6                  ; 53E0   0004 0154 03C6

        MVII    #$0292, R1                      ; 53E3   02B9 0292
        MVII    #$0001, R2                      ; 53E5   02BA 0001

        JSR     R5,     X_GETNUM                ; 53E7   0004 0118 00FF

        MVO     R0,     G_0160                  ; 53EA   0240 0160
        SWAP    R0,     1                       ; 53EC   0040
        MVO     R0,     G_0161                  ; 53ED   0240 0161
        TSTR    R0                              ; 53EF   0080
        BNEQ    L_53F5                          ; 53F0   020C 0003

        DECR    R0                              ; 53F2   0010
        MVO     R0,     G_0163                  ; 53F3   0240 0163
L_53F5:
        J       L_540F                          ; 53F5   0004 0354 000F

L_53F8:
        PSHR    R5                              ; 53F8   0275
        MVII    #$0200, R4                      ; 53F9   02BC 0200
        MVII    #$00F0, R0                      ; 53FB   02B8 00F0
        SDBD                                    ; 53FD   0001
        MVII    #$2A06, R1                      ; 53FE   02B9 0006 002A

        JSR     R5,     X_FILL_MEM              ; 5401   0004 0114 0341

        PULR    R7                              ; 5404   02B7

L_5405:
        PSHR    R5                              ; 5405   0275
        SDBD                                    ; 5406   0001
        MVII    #$004F, R0                      ; 5407   02B8 004F 0000
        MVII    #$01A1, R4                      ; 540A   02BC 01A1
        J       .EXEC.739                       ; 540C   0004 0314 0339

L_540F:
        DIS                                     ; 540F   0003
        MVII    #$000C, R0                      ; 5410   02B8 000C
        MVO     R0,     G_0115                  ; 5412   0240 0115

        JSR     R5,     L_53F8                  ; 5414   0004 0150 03F8

        SDBD                                    ; 5417   0001
        MVII    #$52B8, R5                      ; 5418   02BD 00B8 0052
        MVII    #$022A, R4                      ; 541B   02BC 022A
L_541D:
        MVI@    R5,     R0                      ; 541D   02A8
        MOVR    R0,     R1                      ; 541E   0081
        ANDI    #$01F8, R0                      ; 541F   03B8 01F8
        XORI    #$0006, R0                      ; 5421   03F8 0006
        ANDI    #$0007, R1                      ; 5423   03B9 0007
        SDBD                                    ; 5425   0001
        ADDI    #$57AE, R1                      ; 5426   02F9 00AE 0057
        MVI@    R1,     R1                      ; 5429   0289
        SWAP    R1,     1                       ; 542A   0041
        XORR    R1,     R0                      ; 542B   01C8
        MVO@    R0,     R4                      ; 542C   0260
        CMPI    #$02DA, R4                      ; 542D   037C 02DA
        BNEQ    L_541D                          ; 542F   022C 0013

        EIS                                     ; 5431   0002

        JSR     R5,     L_5405                  ; 5432   0004 0154 0005

        MVII    #$0038, R1                      ; 5435   02B9 0038
        MVII    #$0167, R4                      ; 5437   02BC 0167
L_5439:
        MVO@    R1,     R4                      ; 5439   0261
        INCR    R1                              ; 543A   0009
        CMPI    #$003B, R1                      ; 543B   0379 003B
        BNEQ    L_5440                          ; 543D   020C 0001

        INCR    R4                              ; 543F   000C
L_5440:
        CMPI    #$003E, R1                      ; 5440   0379 003E
        BNEQ    L_5439                          ; 5442   022C 000A

        MVII    #$0001, R1                      ; 5444   02B9 0001
        MVO     R1,     G_01A2                  ; 5446   0241 01A2
        MVO     R1,     G_01A1                  ; 5448   0241 01A1
        MVII    #$0014, R0                      ; 544A   02B8 0014
L_544C:
        PSHR    R0                              ; 544C   0270

        JSR     R5,     L_5A5C                  ; 544D   0004 0158 025C

        PULR    R0                              ; 5450   02B0
        DECR    R0                              ; 5451   0010
        BNEQ    L_544C                          ; 5452   022C 0007

        SDBD                                    ; 5454   0001
        MVII    #$57A4, R0                      ; 5455   02B8 00A4 0057
        MVO     R0,     G_035D                  ; 5458   0240 035D
        NOP                                     ; 545A   0034

        JSR     R5,     L_5561                  ; 545B   0004 0154 0161
L_545E:
        JSR     R5,     L_55B5                  ; 545E   0004 0154 01B5

        SDBD                                    ; 5461   0001
        MVII    #$507F, R1                      ; 5462   02B9 007F 0050

        JSR     R5,     X_TIMER_STOP            ; 5465   0004 0118 0038

        ADDI    #$0004, R1                      ; 5468   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 546A   0004 0118 0038

        ADDI    #$0004, R1                      ; 546D   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 546F   0004 0118 0038

        ADDI    #$0004, R1                      ; 5472   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 5474   0004 0118 0038

        MVII    #$01A6, R4                      ; 5477   02BC 01A6
        CLRR    R1                              ; 5479   01C9
        MVO@    R1,     R4                      ; 547A   0261
        MVO@    R1,     R4                      ; 547B   0261
        MVII    #$0001, R0                      ; 547C   02B8 0001
        MVO     R0,     G_01A0                  ; 547E   0240 01A0

        JSR     R5,     L_54FD                  ; 5480   0004 0154 00FD
        JSR     R5,     L_551C                  ; 5483   0004 0154 011C

        MVI     G_0186, R0                      ; 5486   0280 0186
        CMPI    #$0001, R0                      ; 5488   0378 0001
        BEQ     L_548F                          ; 548A   0204 0003

        JSR     R5,     L_5499                  ; 548C   0004 0154 0099

L_548F:
        MVI     G_0187, R0                      ; 548F   0280 0187
        CMPI    #$0004, R0                      ; 5491   0378 0004
        BEQ     L_5498                          ; 5493   0204 0003

        JSR     R5,     L_5499                  ; 5495   0004 0154 0099

L_5498:
        PULR    R7                              ; 5498   02B7

L_5499:
        PSHR    R5                              ; 5499   0275
        MVII    #$02D7, R4                      ; 549A   02BC 02D7
        MOVR    R0,     R1                      ; 549C   0081
        ADDR    R0,     R0                      ; 549D   00C0
        ADDR    R1,     R0                      ; 549E   00C8
        ADDR    R0,     R4                      ; 549F   00C4
        MVII    #$0003, R1                      ; 54A0   02B9 0003
L_54A2:
        MVI@    R4,     R0                      ; 54A2   02A0
        DECR    R4                              ; 54A3   0014
        SDBD                                    ; 54A4   0001
        ANDI    #$EFF8, R0                      ; 54A5   03B8 00F8 00EF
        MVO@    R0,     R4                      ; 54A8   0260
        DECR    R1                              ; 54A9   0011
        BNEQ    L_54A2                          ; 54AA   022C 0009
        PULR    R7                              ; 54AC   02B7

        PSHR    R5                              ; 54AD   0275
L_54AE:
        MVII    #$000A, R0                      ; 54AE   02B8 000A
        MVII    #$02E6, R4                      ; 54B0   02BC 02E6
        SDBD                                    ; 54B2   0001
        MVII    #$2A06, R1                      ; 54B3   02B9 0006 002A

        JSR     R5,     X_FILL_MEM              ; 54B6   0004 0114 0341

        SDBD                                    ; 54B9   0001
        MVII    #$2207, R3                      ; 54BA   02BB 0007 0022
        MVII    #$0004, R1                      ; 54BD   02B9 0004
        MVII    #$0160, R4                      ; 54BF   02BC 0160
        SDBD                                    ; 54C1   0001
        MVI@    R4,     R0                      ; 54C2   02A0
        MVII    #$02E7, R4                      ; 54C3   02BC 02E7

        JSR     R5,     X_PRNUM_RGT             ; 54C5   0004 0118 00C5

        MVII    #$02EC, R4                      ; 54C8   02BC 02EC
        MVII    #$0003, R1                      ; 54CA   02B9 0003
        MVII    #$0171, R5                      ; 54CC   02BD 0171
        MVI@    R5,     R0                      ; 54CE   02A8
        ADD@    R5,     R0                      ; 54CF   02E8
        ADD@    R5,     R0                      ; 54D0   02E8

        JSR     R5,     X_PRNUM_RGT             ; 54D1   0004 0118 00C5

        PULR    R7                              ; 54D4   02B7

        PSHR    R5                              ; 54D5   0275
L_54D6:
        MVII    #$000A, R0                      ; 54D6   02B8 000A
        MVII    #$02DC, R4                      ; 54D8   02BC 02DC
        SDBD                                    ; 54DA   0001
        MVII    #$2A06, R1                      ; 54DB   02B9 0006 002A

        JSR     R5,     X_FILL_MEM              ; 54DE   0004 0114 0341

        SDBD                                    ; 54E1   0001
        MVII    #$2201, R3                      ; 54E2   02BB 0001 0022
        MVII    #$0004, R1                      ; 54E5   02B9 0004
        MVII    #$015E, R4                      ; 54E7   02BC 015E
        SDBD                                    ; 54E9   0001
        MVI@    R4,     R0                      ; 54EA   02A0
        MVII    #$02DD, R4                      ; 54EB   02BC 02DD

        JSR     R5,     X_PRNUM_RGT             ; 54ED   0004 0118 00C5

        MVII    #$02E2, R4                      ; 54F0   02BC 02E2
        MVII    #$0003, R1                      ; 54F2   02B9 0003
        MVII    #$016E, R5                      ; 54F4   02BD 016E
        MVI@    R5,     R0                      ; 54F6   02A8
        ADD@    R5,     R0                      ; 54F7   02E8
        ADD@    R5,     R0                      ; 54F8   02E8

        JSR     R5,     X_PRNUM_RGT             ; 54F9   0004 0118 00C5

        PULR    R7                              ; 54FC   02B7

L_54FD:
        PSHR    R5                              ; 54FD   0275
        MVII    #$000A, R0                      ; 54FE   02B8 000A
        MVII    #$02DC, R4                      ; 5500   02BC 02DC
        SDBD                                    ; 5502   0001
        MVII    #$2A06, R1                      ; 5503   02B9 0006 002A

        JSR     R5,     X_FILL_MEM              ; 5506   0004 0114 0341
        JSR     R5,     L_550D                  ; 5509   0004 0154 010D

        PULR    R7                              ; 550C   02B7

L_550D:
        PSHR    R5                              ; 550D   0275
        SDBD                                    ; 550E   0001
        MVII    #$2201, R3                      ; 550F   02BB 0001 0022
        MVII    #$0002, R1                      ; 5512   02B9 0002
        MVII    #$016E, R2                      ; 5514   02BA 016E
        MVII    #$02DD, R4                      ; 5516   02BC 02DD

        JSR     R5,     L_553B                  ; 5518   0004 0154 013B

        PULR    R7                              ; 551B   02B7

L_551C:
        PSHR    R5                              ; 551C   0275
        MVII    #$000A, R0                      ; 551D   02B8 000A
        MVII    #$02E6, R4                      ; 551F   02BC 02E6
        SDBD                                    ; 5521   0001
        MVII    #$2A06, R1                      ; 5522   02B9 0006 002A

        JSR     R5,     X_FILL_MEM              ; 5525   0004 0114 0341
        JSR     R5,     L_552C                  ; 5528   0004 0154 012C

        PULR    R7                              ; 552B   02B7

L_552C:
        PSHR    R5                              ; 552C   0275
        MVII    #$0002, R1                      ; 552D   02B9 0002
        MVII    #$02E7, R4                      ; 552F   02BC 02E7
        MVII    #$0171, R2                      ; 5531   02BA 0171
        SDBD                                    ; 5533   0001
        MVII    #$2207, R3                      ; 5534   02BB 0007 0022

        JSR     R5,     L_553B                  ; 5537   0004 0154 013B

        PULR    R7                              ; 553A   02B7

L_553B:
        PSHR    R5                              ; 553B   0275
        MOVR    R2,     R5                      ; 553C   0095
        MVII    #$0003, R2                      ; 553D   02BA 0003
L_553F:
        MVI@    R5,     R0                      ; 553F   02A8
        PSHR    R5                              ; 5540   0275

        JSR     R5,     X_PRNUM_RGT             ; 5541   0004 0118 00C5

        PULR    R5                              ; 5544   02B5
        ADDI    #$0003, R4                      ; 5545   02FC 0003
        DECR    R2                              ; 5547   0012
        BNEQ    L_553F                          ; 5548   022C 000A

        MOVR    R5,     R2                      ; 554A   00AA
        PULR    R7                              ; 554B   02B7

L_554C:
        PSHR    R5                              ; 554C   0275

        JSR     R5,     L_57E6                  ; 554D   0004 0154 03E6

        MVI     G_0164, R1                      ; 5550   0281 0164
        MOVR    R1,     R2                      ; 5552   008A
        MOVR    R1,     R5                      ; 5553   008D
        ADDI    #$01A8, R5                      ; 5554   02FD 01A8
        MVI@    R5,     R0                      ; 5556   02A8
        SLL     R1,     1                       ; 5557   0049
        ADDR    R2,     R1                      ; 5558   00D1
        ADDI    #$0167, R1                      ; 5559   02F9 0167
        MOVR    R1,     R2                      ; 555B   008A
        SDBD                                    ; 555C   0001
        ADDI    #$0007, R2                      ; 555D   02FA 0007 0000
        PULR    R7                              ; 5560   02B7

L_5561:
        PSHR    R5                              ; 5561   0275
        SDBD                                    ; 5562   0001
        MVII    #$5821, R1                      ; 5563   02B9 0021 0058
        MVII    #$031D, R2                      ; 5566   02BA 031D

        JSR     R5,     X_INIT_MOB              ; 5568   0004 0114 02B2

        MVII    #$0003, R3                      ; 556B   02BB 0003
        SDBD                                    ; 556D   0001
        MVII    #$2D00, R4                      ; 556E   02BC 0000 002D
        SDBD                                    ; 5571   0001
        MVII    #$5851, R1                      ; 5572   02B9 0051 0058
        MVII    #$032D, R2                      ; 5575   02BA 032D

        JSR     R5,     X_INIT_MOB              ; 5577   0004 0114 02B2

        MVI@    R2,     R1                      ; 557A   0291
        XORI    #$0010, R1                      ; 557B   03F9 0010
        MVO@    R1,     R2                      ; 557D   0251
        SDBD                                    ; 557E   0001
        MVII    #$5851, R1                      ; 557F   02B9 0051 0058
        MVII    #$0335, R2                      ; 5582   02BA 0335

        JSR     R5,     X_INIT_MOB              ; 5584   0004 0114 02B2

        ADDR    R3,     R2                      ; 5587   00DA
        MVO@    R4,     R2                      ; 5588   0254
        MVII    #$033D, R2                      ; 5589   02BA 033D

        JSR     R5,     X_INIT_MOB              ; 558B   0004 0114 02B2

        ADDR    R3,     R2                      ; 558E   00DA
        SDBD                                    ; 558F   0001
        MVII    #$3D00, R0                      ; 5590   02B8 0000 003D
        MVO@    R0,     R2                      ; 5593   0250
        SDBD                                    ; 5594   0001
        MVII    #$5861, R1                      ; 5595   02B9 0061 0058
        MVII    #$0345, R2                      ; 5598   02BA 0345

        JSR     R5,     X_INIT_MOB              ; 559A   0004 0114 02B2

        MVI@    R2,     R5                      ; 559D   0295
        XORI    #$0017, R5                      ; 559E   03FD 0017
        MVO@    R5,     R2                      ; 55A0   0255
        MVII    #$034D, R2                      ; 55A1   02BA 034D

        JSR     R5,     X_INIT_MOB              ; 55A3   0004 0114 02B2

        ADDR    R3,     R2                      ; 55A6   00DA
        MVO@    R4,     R2                      ; 55A7   0254
        MVII    #$0355, R2                      ; 55A8   02BA 0355

        JSR     R5,     X_INIT_MOB              ; 55AA   0004 0114 02B2

        ADDR    R3,     R2                      ; 55AD   00DA
        SDBD                                    ; 55AE   0001
        MVII    #$3D00, R0                      ; 55AF   02B8 0000 003D
        MVO@    R0,     R2                      ; 55B2   0250
        B       L_55B6                          ; 55B3   0200 0001

L_55B5:
        PSHR    R5                              ; 55B5   0275
L_55B6:
        MVII    #$032E, R1                      ; 55B6   02B9 032E
        MVI     G_0162, R0                      ; 55B8   0280 0162
        TSTR    R0                              ; 55BA   0080
        BEQ     L_55BF                          ; 55BB   0204 0002

        MVII    #$016E, R4                      ; 55BD   02BC 016E
L_55BF:
        BEQ     L_55C4                          ; 55BF   0204 0003

        JSR     R5,     L_55D3                  ; 55C1   0004 0154 01D3

L_55C4:
        MVII    #$0346, R1                      ; 55C4   02B9 0346
        MVI     G_0163, R0                      ; 55C6   0280 0163
        TSTR    R0                              ; 55C8   0080
        BEQ     L_55CD                          ; 55C9   0204 0002

        MVII    #$0171, R4                      ; 55CB   02BC 0171
L_55CD:
        BEQ     L_55D2                          ; 55CD   0204 0003

        JSR     R5,     L_55D3                  ; 55CF   0004 0154 01D3

L_55D2:
        PULR    R7                              ; 55D2   02B7

L_55D3:
        MVII    #$0003, R0                      ; 55D3   02B8 0003
        CLRR    R2                              ; 55D5   01D2
L_55D6:
        MVO@    R2,     R1                      ; 55D6   024A
        ADDI    #$0008, R1                      ; 55D7   02F9 0008
        DECR    R0                              ; 55D9   0010
        MVO@    R2,     R4                      ; 55DA   0262
        BNEQ    L_55D6                          ; 55DB   022C 0006
        MOVR    R5,     R7                      ; 55DD   00AF

L_55DE:
        PSHR    R5                              ; 55DE   0275
        TSTR    R1                              ; 55DF   0089
        BNEQ    L_55FB                          ; 55E0   020C 0019

        MVI     G_0186, R0                      ; 55E2   0280 0186
        CMPI    #$0001, R0                      ; 55E4   0378 0001
        BEQ     L_55EB                          ; 55E6   0204 0003

        JSR     R5,     L_5614                  ; 55E8   0004 0154 0214

L_55EB:
        INCR    R0                              ; 55EB   0008
        CMPI    #$0005, R0                      ; 55EC   0378 0005
        BEQ     L_55F6                          ; 55EE   0204 0006

        MVO     R0,     G_0186                  ; 55F0   0240 0186

        JSR     R5,     L_5614                  ; 55F2   0004 0154 0214

        PULR    R7                              ; 55F5   02B7

L_55F6:
        MVII    #$0001, R0                      ; 55F6   02B8 0001
        MVO     R0,     G_0186                  ; 55F8   0240 0186
        PULR    R7                              ; 55FA   02B7

L_55FB:
        MVI     G_0187, R0                      ; 55FB   0280 0187
        CMPI    #$0004, R0                      ; 55FD   0378 0004
        BEQ     L_5604                          ; 55FF   0204 0003

        JSR     R5,     L_561D                  ; 5601   0004 0154 021D

L_5604:
        INCR    R0                              ; 5604   0008
        CMPI    #$0008, R0                      ; 5605   0378 0008
        BEQ     L_560F                          ; 5607   0204 0006

        MVO     R0,     G_0187                  ; 5609   0240 0187

        JSR     R5,     L_561D                  ; 560B   0004 0154 021D

        PULR    R7                              ; 560E   02B7

L_560F:
        MVII    #$0004, R0                      ; 560F   02B8 0004
        MVO     R0,     G_0187                  ; 5611   0240 0187
        PULR    R7                              ; 5613   02B7

L_5614:
        PSHR    R5                              ; 5614   0275

        JSR     R5,     .EXEC.76C               ; 5615   0004 0114 036C

        MVI@    R1,     R2                      ; 5618   028A
        XORI    #$0010, R2                      ; 5619   03FA 0010
        MVO@    R2,     R1                      ; 561B   024A
        PULR    R7                              ; 561C   02B7

L_561D:
        PSHR    R5                              ; 561D   0275

        JSR     R5,     .EXEC.76C               ; 561E   0004 0114 036C

        MVI@    R1,     R2                      ; 5621   028A
        XORI    #$0017, R2                      ; 5622   03FA 0017
        MVO@    R2,     R1                      ; 5624   024A
        PULR    R7                              ; 5625   02B7

        PSHR    R5                              ; 5626   0275

        JSR     R5,     L_56C4                  ; 5627   0004 0154 02C4

        TSTR    R0                              ; 562A   0080
        BPL     L_564A                          ; 562B   0203 001D

        MVII    #$0123, R3                      ; 562D   02BB 0123
        ADDR    R1,     R3                      ; 562F   00CB
        MVI@    R3,     R3                      ; 5630   029B
        TSTR    R3                              ; 5631   009B
        BEQ     L_563F                          ; 5632   0204 000B

        ANDI    #$00E0, R3                      ; 5634   03BB 00E0
        BNEQ    L_563F                          ; 5636   020C 0007

        MVII    #$011F, R3                      ; 5638   02BB 011F
        ADDR    R1,     R3                      ; 563A   00CB
        MVII    #$0010, R2                      ; 563B   02BA 0010
        MVO@    R2,     R3                      ; 563D   025A
        PULR    R7                              ; 563E   02B7

L_563F:
        TSTR    R1                              ; 563F   0089
        BEQ     L_5646                          ; 5640   0204 0004

        MVI     G_0187, R0                      ; 5642   0280 0187
        B       L_566E                          ; 5644   0200 0028

L_5646:
        MVI     G_0186, R0                      ; 5646   0280 0186
        B       L_566E                          ; 5648   0200 0024

L_564A:
        TSTR    R1                              ; 564A   0089
        PSHR    R0                              ; 564B   0270
        BEQ     L_5656                          ; 564C   0204 0008

        MVI     G_0187, R0                      ; 564E   0280 0187
        CMPI    #$0004, R0                      ; 5650   0378 0004
        BEQ     L_566C                          ; 5652   0204 0018
        B       L_565E                          ; 5654   0200 0008

L_5656:
        MVI     G_0186, R0                      ; 5656   0280 0186
        CMPI    #$0001, R0                      ; 5658   0378 0001
        BEQ     L_566C                          ; 565A   0204 0010
        B       L_565E                          ; 565C   0200 0000

L_565E:
        JSR     R5,     .EXEC.76C               ; 565E   0004 0114 036C

        MOVR    R1,     R4                      ; 5661   008C
        ADDI    #$0004, R4                      ; 5662   02FC 0004
        PULR    R1                              ; 5664   02B1
        MVII    #$0014, R0                      ; 5665   02B8 0014

        JSR     R5,     .EXEC.629               ; 5667   0004 0114 0229

        MVO@    R0,     R4                      ; 566A   0260
        PULR    R7                              ; 566B   02B7

L_566C:
        PULR    R0                              ; 566C   02B0
        PULR    R7                              ; 566D   02B7

L_566E:
        JSR     R5,     .EXEC.76C               ; 566E   0004 0114 036C

        ADDI    #$0004, R1                      ; 5671   02F9 0004
        CLRR    R0                              ; 5673   01C0
        MVO@    R0,     R1                      ; 5674   0248
        MOVR    R1,     R0                      ; 5675   0088
        SUBI    #$0002, R0                      ; 5676   0338 0002
        MVII    #$00FF, R3                      ; 5678   02BB 00FF
        MVO     R3,     G_0184                  ; 567A   0243 0184
        PSHR    R0                              ; 567C   0270
        CLRR    R3                              ; 567D   01DB
        MVO     R3,     G_0182                  ; 567E   0243 0182
L_5680:
        MVII    #$0001, R2                      ; 5680   02BA 0001

        JSR     R5,     L_5B33                  ; 5682   0004 0158 0333

        SWAP    R0,     1                       ; 5685   0040
        SWAP    R1,     1                       ; 5686   0041
        PULR    R4                              ; 5687   02B4
        PSHR    R4                              ; 5688   0274
        MVI@    R4,     R2                      ; 5689   02A2
        MVI@    R4,     R3                      ; 568A   02A3
        SWAP    R2,     1                       ; 568B   0042
        ANDI    #$00FF, R2                      ; 568C   03BA 00FF
        SWAP    R3,     1                       ; 568E   0043
        ANDI    #$00FF, R3                      ; 568F   03BB 00FF
        SUBR    R2,     R0                      ; 5691   0110
        BPL     L_5695                          ; 5692   0203 0001

        NEGR    R0                              ; 5694   0020
L_5695:
        SUBR    R3,     R1                      ; 5695   0119
        BPL     L_5699                          ; 5696   0203 0001

        NEGR    R1                              ; 5698   0021
L_5699:
        ADDR    R1,     R0                      ; 5699   00C8
        CMP     G_0184, R0                      ; 569A   0340 0184
        BMI     L_56BC                          ; 569C   020B 001E

        MVI     G_0182, R3                      ; 569E   0283 0182
L_56A0:
        INCR    R3                              ; 56A0   000B
        MVO     R3,     G_0182                  ; 56A1   0243 0182
        CMPI    #$00A4, R3                      ; 56A3   037B 00A4
        BNEQ    L_5680                          ; 56A5   022C 0026

        MVI     G_0183, R3                      ; 56A7   0283 0183
        MVI     G_0164, R1                      ; 56A9   0281 0164
        ADDI    #$0186, R1                      ; 56AB   02F9 0186
        MVI@    R1,     R2                      ; 56AD   028A
        ADD     G_0164, R2                      ; 56AE   02C2 0164
        ADDI    #$0165, R2                      ; 56B0   02FA 0165
        MVO@    R3,     R2                      ; 56B2   0253
        MVII    #$0001, R2                      ; 56B3   02BA 0001

        JSR     R5,     L_5B33                  ; 56B5   0004 0158 0333

        PULR    R4                              ; 56B8   02B4
        MVO@    R0,     R4                      ; 56B9   0260
        MVO@    R1,     R4                      ; 56BA   0261
        PULR    R7                              ; 56BB   02B7

L_56BC:
        MVO     R0,     G_0184                  ; 56BC   0240 0184
        MVI     G_0182, R3                      ; 56BE   0283 0182
        MVO     R3,     G_0183                  ; 56C0   0243 0183
        B       L_56A0                          ; 56C2   0220 0023

L_56C4:
        MVI     G_0165, R2                      ; 56C4   0282 0165
        TSTR    R2                              ; 56C6   0092
        BNEQ    L_55D2                          ; 56C7   022C 00F6

        MVO     R1,     G_0164                  ; 56C9   0241 0164
        MOVR    R1,     R2                      ; 56CB   008A
        ADDI    #$01AA, R2                      ; 56CC   02FA 01AA
        MVI@    R2,     R2                      ; 56CE   0292
        TSTR    R2                              ; 56CF   0092
        BNEQ    L_55D2                          ; 56D0   022C 00FF

        MVII    #$01A8, R2                      ; 56D2   02BA 01A8
        ADD     G_0164, R2                      ; 56D4   02C2 0164
        MVI@    R2,     R2                      ; 56D6   0292
        CMPI    #$0004, R2                      ; 56D7   037A 0004
        BEQ     L_55D2                          ; 56D9   0224 0108
        MOVR    R5,     R7                      ; 56DB   00AF

        PSHR    R5                              ; 56DC   0275

        JSR     R5,     L_56C4                  ; 56DD   0004 0154 02C4

        PSHR    R0                              ; 56E0   0270

        JSR     R5,     L_554C                  ; 56E1   0004 0154 014C

        CMPI    #$00FF, R0                      ; 56E4   0378 00FF
        BNEQ    L_56EC                          ; 56E6   020C 0004

        SDBD                                    ; 56E8   0001
        XORI    #$FF00, R0                      ; 56E9   03F8 0000 00FF
L_56EC:
        ADDR    R0,     R1                      ; 56EC   00C1
        ADDR    R0,     R2                      ; 56ED   00C2
        PULR    R5                              ; 56EE   02B5
        MVI     G_0164, R3                      ; 56EF   0283 0164
        B       L_56F3                          ; 56F1   0200 0000

L_56F3:
        CMPI    #$000B, R5                      ; 56F3   037D 000B
        BEQ     L_5739                          ; 56F5   0204 0042

        CMPI    #$000A, R5                      ; 56F7   037D 000A
        BNEQ    L_56FE                          ; 56F9   020C 0003

        CLRR    R0                              ; 56FB   01C0
        B       L_571D                          ; 56FC   0200 001F

L_56FE:
        MVI@    R2,     R0                      ; 56FE   0290
        PSHR    R3                              ; 56FF   0273
        PSHR    R2                              ; 5700   0272
        MVI     G_0164, R2                      ; 5701   0282 0164
        ADDI    #$01A6, R2                      ; 5703   02FA 01A6
        MVI@    R2,     R3                      ; 5705   0293
        TSTR    R3                              ; 5706   009B
        BNEQ    L_570A                          ; 5707   020C 0001

        CLRR    R0                              ; 5709   01C0
L_570A:
        MVI     G_0164, R2                      ; 570A   0282 0164
        ADDI    #$01A6, R2                      ; 570C   02FA 01A6
        MVII    #$0001, R3                      ; 570E   02BB 0001
        MVO@    R3,     R2                      ; 5710   0253
        PULR    R2                              ; 5711   02B2
        PULR    R3                              ; 5712   02B3
        SLL     R0,     1                       ; 5713   0048
        MOVR    R0,     R1                      ; 5714   0081
        SLL     R0,     2                       ; 5715   004C
        ADDR    R1,     R0                      ; 5716   00C8
        ADDR    R5,     R0                      ; 5717   00E8

        JSR     R5,     X_CLAMP                 ; 5718   0004 0114 0270
        DECLE   $0000                           ; 571B   0000

        SLR     R3,     1                       ; 571C   0063
L_571D:
        MVO@    R0,     R2                      ; 571D   0250
        MVII    #$0022, R3                      ; 571E   02BB 0022
        SWAP    R3,     1                       ; 5720   0043
        MVII    #$02DD, R4                      ; 5721   02BC 02DD
        MVI     G_0164, R5                      ; 5723   0285 0164
        TSTR    R5                              ; 5725   00AD
        BEQ     L_572A                          ; 5726   0204 0002

        MVII    #$02E7, R4                      ; 5728   02BC 02E7
L_572A:
        MVII    #$01A8, R2                      ; 572A   02BA 01A8
        BEQ     L_572F                          ; 572C   0204 0001

        INCR    R2                              ; 572E   000A
L_572F:
        MVI@    R2,     R2                      ; 572F   0292
        MOVR    R2,     R1                      ; 5730   0091
        SLL     R2,     1                       ; 5731   004A
        ADDR    R1,     R2                      ; 5732   00CA
        ADDR    R2,     R4                      ; 5733   00D4
        MVII    #$0002, R1                      ; 5734   02B9 0002
        J       .EXEC.8C6                       ; 5736   0004 0318 00C6

L_5739:
        CLRR    R0                              ; 5739   01C0
        ADDI    #$01A6, R3                      ; 573A   02FB 01A6
        MVO@    R0,     R3                      ; 573C   0258
        SDBD                                    ; 573D   0001
        ADDI    #$0002, R3                      ; 573E   02FB 0002 0000
        MVI@    R3,     R1                      ; 5741   0299
        INCR    R1                              ; 5742   0009
        CMPI    #$0003, R1                      ; 5743   0379 0003
        BNEQ    L_574B                          ; 5745   020C 0004

        SDBD                                    ; 5747   0001
        MVII    #$FFFF, R1                      ; 5748   02B9 00FF 00FF
L_574B:
        MVO@    R1,     R3                      ; 574B   0259
        MVI     G_0164, R1                      ; 574C   0281 0164
        PSHR    R3                              ; 574E   0273
        PSHR    R2                              ; 574F   0272
        MOVR    R1,     R3                      ; 5750   008B
        MOVR    R3,     R2                      ; 5751   009A
        SLL     R3,     1                       ; 5752   004B
        ADDR    R2,     R3                      ; 5753   00D3
        ADDI    #$0171, R3                      ; 5754   02FB 0171
        PULR    R2                              ; 5756   02B2
        INCR    R2                              ; 5757   000A
        CMPR    R3,     R2                      ; 5758   015A
        BNEQ    L_5762                          ; 5759   020C 0007

        MVI     G_0164, R3                      ; 575B   0283 0164
        MOVR    R3,     R2                      ; 575D   009A
        SLL     R3,     1                       ; 575E   004B
        ADDR    R3,     R2                      ; 575F   00DA
        ADDI    #$016D, R2                      ; 5760   02FA 016D
L_5762:
        PSHR    R2                              ; 5762   0272

        JSR     R5,     L_55DE                  ; 5763   0004 0154 01DE

        PSHR    R0                              ; 5766   0270
        MVI     G_0164, R0                      ; 5767   0280 0164
        TSTR    R0                              ; 5769   0080
        PULR    R0                              ; 576A   02B0
        BNEQ    L_5772                          ; 576B   020C 0005

        JSR     R5,     L_54FD                  ; 576D   0004 0154 00FD

        B       L_5775                          ; 5770   0200 0003

L_5772:
        JSR     R5,     L_551C                  ; 5772   0004 0154 011C

L_5775:
        PULR    R2                              ; 5775   02B2
        PULR    R3                              ; 5776   02B3
        MVI@    R2,     R0                      ; 5777   0290
        B       L_571D                          ; 5778   0220 005C

        PSHR    R5                              ; 577A   0275
        TSTR    R1                              ; 577B   0089
        BNEQ    L_5791                          ; 577C   020C 0013

        TSTR    R0                              ; 577E   0080
        BMI     L_5784                          ; 577F   020B 0003
        BNEQ    L_54D6                          ; 5781   022C 02AC
        PULR    R7                              ; 5783   02B7

L_5784:
        JSR     R5,     L_54FD                  ; 5784   0004 0154 00FD

        MVI     G_0186, R0                      ; 5787   0280 0186
        CMPI    #$0001, R0                      ; 5789   0378 0001
        BEQ     L_5790                          ; 578B   0204 0003

        JSR     R5,     L_5499                  ; 578D   0004 0154 0099

L_5790:
        PULR    R7                              ; 5790   02B7

L_5791:
        TSTR    R0                              ; 5791   0080
        BMI     L_5797                          ; 5792   020B 0003
        BNEQ    L_54AE                          ; 5794   022C 02E7
        PULR    R7                              ; 5796   02B7

L_5797:
        JSR     R5,     L_551C                  ; 5797   0004 0154 011C

        MVI     G_0187, R0                      ; 579A   0280 0187
        CMPI    #$0004, R0                      ; 579C   0378 0004
        BEQ     L_57A3                          ; 579E   0204 0003

        JSR     R5,     L_5499                  ; 57A0   0004 0154 0099

L_57A3:
        PULR    R7                              ; 57A3   02B7

        NEGR    R6                              ; 57A4   0026
        RLC     R2,     2                       ; 57A5   0056
        ADDR    R3,     R4                      ; 57A6   00DC
        RLC     R2,     2                       ; 57A7   0056
        SARC    R2,     1                       ; 57A8   007A
        RLC     R3,     2                       ; 57A9   0057
        ADDR    R2,     R6                      ; 57AA   00D6
        SLLC    R0,     1                       ; 57AB   0058
        ADDR    R2,     R6                      ; 57AC   00D6
        SLLC    R0,     1                       ; 57AD   0058
        ADCR    R2                              ; 57AE   002A
        INCR    R2                              ; 57AF   000A
        INCR    R4                              ; 57B0   000C
        INCR    R0                              ; 57B1   0008
L_57B2:
        PSHR    R5                              ; 57B2   0275
        MVII    #$0177, R5                      ; 57B3   02BD 0177
        MVO@    R0,     R5                      ; 57B5   0268
        SWAP    R0,     1                       ; 57B6   0040
        MVO@    R0,     R5                      ; 57B7   0268
        MVO@    R1,     R5                      ; 57B8   0269
        SWAP    R1,     1                       ; 57B9   0041
        MVO@    R1,     R5                      ; 57BA   0269
        MVO@    R2,     R5                      ; 57BB   026A
        SWAP    R2,     1                       ; 57BC   0042
        MVO@    R2,     R5                      ; 57BD   026A
        MVO@    R3,     R5                      ; 57BE   026B
        SWAP    R3,     1                       ; 57BF   0043
        MVO@    R3,     R5                      ; 57C0   026B
        MOVR    R4,     R0                      ; 57C1   00A0
        MVO@    R0,     R5                      ; 57C2   0268
        SWAP    R0,     1                       ; 57C3   0040
        MVO@    R0,     R5                      ; 57C4   0268
        INCR    R7                              ; 57C5   000F

L_57C6:
        PSHR    R5                              ; 57C6   0275
L_57C7:
        MVII    #$0177, R5                      ; 57C7   02BD 0177
        SDBD                                    ; 57C9   0001
        MVI@    R5,     R0                      ; 57CA   02A8
        SDBD                                    ; 57CB   0001
        MVI@    R5,     R1                      ; 57CC   02A9
        SDBD                                    ; 57CD   0001
        MVI@    R5,     R2                      ; 57CE   02AA
        SDBD                                    ; 57CF   0001
        MVI@    R5,     R3                      ; 57D0   02AB
        SDBD                                    ; 57D1   0001
        MVI@    R5,     R4                      ; 57D2   02AC
        PULR    R7                              ; 57D3   02B7

        PSHR    R5                              ; 57D4   0275

        JSR     R5,     .EXEC.76C               ; 57D5   0004 0114 036C

        SDBD                                    ; 57D8   0001
        MVII    #$8000, R3                      ; 57D9   02BB 0000 0080
        XOR@    R1,     R3                      ; 57DC   03CB
        MVO@    R3,     R1                      ; 57DD   024B
        ADDI    #$0006, R1                      ; 57DE   02F9 0006
        MVII    #$0080, R3                      ; 57E0   02BB 0080
        SWAP    R3,     1                       ; 57E2   0043
        XOR@    R1,     R3                      ; 57E3   03CB
        MVO@    R3,     R1                      ; 57E4   024B
        PULR    R7                              ; 57E5   02B7

L_57E6:
        MVI     G_0164, R1                      ; 57E6   0281 0164
        MOVR    R1,     R0                      ; 57E8   0088
        SLL     R0,     1                       ; 57E9   0048
        SDBD                                    ; 57EA   0001
        ADDI    #$0174, R1                      ; 57EB   02F9 0074 0001
        SDBD                                    ; 57EE   0001
        ADDI    #$015E, R0                      ; 57EF   02F8 005E 0001
        MOVR    R0,     R4                      ; 57F2   0084
        MVI@    R1,     R0                      ; 57F3   0288
        SDBD                                    ; 57F4   0001
        MVI@    R4,     R3                      ; 57F5   02A3
        SUBI    #$0002, R4                      ; 57F6   033C 0002
        MOVR    R5,     R7                      ; 57F8   00AF

        DECLE   $001C,  $003E,  $0063,  $0063   ; 57F9   001C 003E 0063 0063
        DECLE   $003E,  $001C,  $0000,  $0000   ; 57FD   003E 001C 0000 0000
        DECLE   $0000,  $001C,  $003E,  $007F   ; 5801   0000 001C 003E 007F
        DECLE   $007F,  $003E,  $001C,  $0000   ; 5805   007F 003E 001C 0000
        DECLE   $0000,  $001C,  $003E,  $0063   ; 5809   0000 001C 003E 0063
        DECLE   $0063,  $003E,  $001C,  $0000   ; 580D   0063 003E 001C 0000
        DECLE   $001C,  $003E,  $007F,  $007F   ; 5811   001C 003E 007F 007F
        DECLE   $003E,  $001C,  $0000,  $0000   ; 5815   003E 001C 0000 0000
        DECLE   $003C,  $007E,  $00FF,  $00FF   ; 5819   003C 007E 00FF 00FF
        DECLE   $00FF,  $007E,  $003C,  $0000   ; 581D   00FF 007E 003C 0000
        DECLE   $00B0,  $0010,  $008D,  $0058   ; 5821   00B0 0010 008D 0058
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5825   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5829   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 582D   0000 0000 0000 0000
        DECLE   $0091,  $0010,  $0071,  $0058   ; 5831   0091 0010 0071 0058
        DECLE   $0000,  $000C,  $0000,  $001D   ; 5835   0000 000C 0000 001D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5839   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 583D   0000 0000 0000 0000
        DECLE   $0090,  $0010,  $0078,  $0058   ; 5841   0090 0010 0078 0058
        DECLE   $0000,  $009B,  $0000,  $001D   ; 5845   0000 009B 0000 001D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5849   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 584D   0000 0000 0000 0000
        DECLE   $0081,  $0010,  $007F,  $0058   ; 5851   0081 0010 007F 0058
        DECLE   $0000,  $000C,  $0000,  $001D   ; 5855   0000 000C 0000 001D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5859   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 585D   0000 0000 0000 0000
        DECLE   $0087,  $0010,  $0086,  $0058   ; 5861   0087 0010 0086 0058
        DECLE   $0000,  $009B,  $0000,  $001D   ; 5865   0000 009B 0000 001D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5869   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 586D   0000 0000 0000 0000
        DECLE   $0300,  $0000,  $0000,  $0000   ; 5871   0300 0000 0000 0000
        DECLE   $0001,  $0000,  $0000,  $0300   ; 5875   0001 0000 0000 0300
        DECLE   $0000,  $0000,  $0000,  $0001   ; 5879   0000 0000 0000 0001
        DECLE   $0002,  $0000,  $0300,  $0000   ; 587D   0002 0000 0300 0000
        DECLE   $0000,  $0000,  $0001,  $0003   ; 5881   0000 0000 0001 0003
        DECLE   $0000,  $0300,  $0000,  $0000   ; 5885   0000 0300 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0000   ; 5889   0000 0001 0001 0000
        DECLE   $03AF,  $0058,  $0000,  $0000   ; 588D   03AF 0058 0000 0000
        DECLE   $0001,  $0004,  $0000           ; 5891   0001 0004 0000
L_5894:
        PSHR    R5                              ; 5894   0275
        MVII    #$007F, R0                      ; 5895   02B8 007F
        NEGR    R0                              ; 5897   0020
        CLRR    R1                              ; 5898   01C9

        JSR     R5,     X_PACK_BYTES            ; 5899   0004 0114 034F

        MVO     R0,     G_0321                  ; 589C   0240 0321
        MVII    #$0097, R0                      ; 589E   02B8 0097

        JSR     R5,     X_RAND2                 ; 58A0   0004 0114 029E

        ADDI    #$0008, R0                      ; 58A3   02F8 0008
        SWAP    R0,     1                       ; 58A5   0040
        SDBD                                    ; 58A6   0001
        MVII    #$1000, R1                      ; 58A7   02B9 0000 0010
        MVII    #$031F, R4                      ; 58AA   02BC 031F
        MVO@    R0,     R4                      ; 58AC   0260
        MVO@    R1,     R4                      ; 58AD   0261
        PULR    R7                              ; 58AE   02B7

        PSHR    R5                              ; 58AF   0275
        MVI     G_01A2, R0                      ; 58B0   0280 01A2
        CMPI    #$000A, R0                      ; 58B2   0378 000A
        BEQ     L_59CD                          ; 58B4   0204 0117

        CMPI    #$0009, R0                      ; 58B6   0378 0009
        BNEQ    L_58CC                          ; 58B8   020C 0012

        MVI     G_0321, R0                      ; 58BA   0280 0321
        MOVR    R0,     R1                      ; 58BC   0081
        SDBD                                    ; 58BD   0001
        ANDI    #$FF00, R0                      ; 58BE   03B8 0000 00FF
        ANDI    #$00FF, R1                      ; 58C1   03B9 00FF
        COMR    R0                              ; 58C3   0018
        SDBD                                    ; 58C4   0001
        ANDI    #$FF00, R0                      ; 58C5   03B8 0000 00FF
        XORR    R1,     R0                      ; 58C8   01C8
        MVO     R0,     G_0321                  ; 58C9   0240 0321
        PULR    R7                              ; 58CB   02B7

L_58CC:
        MVI     G_031F, R1                      ; 58CC   0281 031F
        NEGR    R1                              ; 58CE   0021
        SDBD                                    ; 58CF   0001
        ADDI    #$A700, R1                      ; 58D0   02F9 0000 00A7
        MVO     R1,     G_031F                  ; 58D3   0241 031F
        PULR    R7                              ; 58D5   02B7

        PSHR    R5                              ; 58D6   0275

        JSR     R5,     L_56C4                  ; 58D7   0004 0154 02C4

        ADDI    #$01AA, R1                      ; 58DA   02F9 01AA
        MVII    #$0001, R0                      ; 58DC   02B8 0001
        MVO@    R0,     R1                      ; 58DE   0248
        MVI     G_0162, R0                      ; 58DF   0280 0162
        TSTR    R0                              ; 58E1   0080
        BEQ     L_58E6                          ; 58E2   0204 0002

        MVO     R0,     G_01AA                  ; 58E4   0240 01AA
L_58E6:
        MVI     G_0163, R0                      ; 58E6   0280 0163
        TSTR    R0                              ; 58E8   0080
        BEQ     L_58ED                          ; 58E9   0204 0002

        MVO     R0,     G_01AB                  ; 58EB   0240 01AB
L_58ED:
        MVII    #$01AA, R4                      ; 58ED   02BC 01AA
        MOVR    R4,     R5                      ; 58EF   00A5
        MVI@    R4,     R0                      ; 58F0   02A0
        TSTR    R0                              ; 58F1   0080
        BEQ     L_5AB9                          ; 58F2   0204 01C5

        MVI@    R4,     R0                      ; 58F4   02A0
        TSTR    R0                              ; 58F5   0080
        BEQ     L_5AB9                          ; 58F6   0204 01C1

        CLRR    R0                              ; 58F8   01C0
        MVO@    R0,     R5                      ; 58F9   0268
        MVO@    R0,     R5                      ; 58FA   0268

        JSR     R5,     L_5894                  ; 58FB   0004 0158 0094

        MVII    #$015E, R4                      ; 58FE   02BC 015E
        SDBD                                    ; 5900   0001
        MVI@    R4,     R3                      ; 5901   02A3
        MVII    #$019A, R5                      ; 5902   02BD 019A
        MVO@    R3,     R5                      ; 5904   026B
        SWAP    R3,     1                       ; 5905   0043
        MVO@    R3,     R5                      ; 5906   026B
        SWAP    R3,     1                       ; 5907   0043
        MVII    #$016E, R2                      ; 5908   02BA 016E
        MVII    #$0006, R0                      ; 590A   02B8 0006
L_590C:
        SUBI    #$0002, R4                      ; 590C   033C 0002
        SUB@    R2,     R3                      ; 590E   0313
        BPL     L_5914                          ; 590F   0203 0003

        ADD@    R2,     R3                      ; 5911   02D3
        MVO@    R3,     R2                      ; 5912   0253
        CLRR    R3                              ; 5913   01DB
L_5914:
        MVO@    R3,     R4                      ; 5914   0263
        SWAP    R3,     1                       ; 5915   0043
        MVO@    R3,     R4                      ; 5916   0263
        SWAP    R3,     1                       ; 5917   0043
        INCR    R2                              ; 5918   000A
        CMPI    #$0004, R0                      ; 5919   0378 0004
        BNEQ    L_5923                          ; 591B   020C 0006

        SDBD                                    ; 591D   0001
        MVI@    R4,     R3                      ; 591E   02A3
        MVO@    R3,     R5                      ; 591F   026B
        SWAP    R3,     1                       ; 5920   0043
        MVO@    R3,     R5                      ; 5921   026B
        SWAP    R3,     1                       ; 5922   0043
L_5923:
        DECR    R0                              ; 5923   0010
        BNEQ    L_590C                          ; 5924   022C 0019

        JSR     R5,     L_54FD                  ; 5926   0004 0154 00FD
        JSR     R5,     L_551C                  ; 5929   0004 0154 011C
        JSR     R5,     L_5A57                  ; 592C   0004 0158 0257

        SDBD                                    ; 592F   0001
        MVII    #$FFFF, R0                      ; 5930   02B8 00FF 00FF
        MVO     R0,     G_0165                  ; 5933   0240 0165
        MVII    #$0026, R0                      ; 5935   02B8 0026

        JSR     R5,     X_RAND2                 ; 5937   0004 0114 029E

        ADDI    #$000A, R0                      ; 593A   02F8 000A
        SDBD                                    ; 593C   0001
        MVII    #$5087, R1                      ; 593D   02B9 0087 0050

        JSR     R5,     .EXEC.831               ; 5940   0004 0118 0031

        PULR    R7                              ; 5943   02B7

L_5944:
        MOVR    R5,     R1                      ; 5944   00A9
        MVII    #$015E, R4                      ; 5945   02BC 015E
        MVII    #$0162, R2                      ; 5947   02BA 0162
        MVII    #$0002, R0                      ; 5949   02B8 0002
L_594B:
        MOVR    R4,     R5                      ; 594B   00A5
        SDBD                                    ; 594C   0001
        MVI@    R4,     R3                      ; 594D   02A3
        SDBD                                    ; 594E   0001
        CMPI    #$270F, R3                      ; 594F   037B 000F 0027
        BMI     L_5958                          ; 5952   020B 0004

        SDBD                                    ; 5954   0001
        MVII    #$270F, R3                      ; 5955   02BB 000F 0027
L_5958:
        TSTR    R3                              ; 5958   009B
        BNEQ    L_595C                          ; 5959   020C 0001

        MVO@    R0,     R2                      ; 595B   0250
L_595C:
        MVO@    R3,     R5                      ; 595C   026B
        SWAP    R3,     1                       ; 595D   0043
        MVO@    R3,     R5                      ; 595E   026B
        INCR    R2                              ; 595F   000A
        DECR    R0                              ; 5960   0010
        BNEQ    L_594B                          ; 5961   022C 0017
        MOVR    R1,     R7                      ; 5963   008F

L_5964:
        PSHR    R5                              ; 5964   0275
        MVI     G_01A2, R0                      ; 5965   0280 01A2
        INCR    R0                              ; 5967   0008
        MVO     R0,     G_01A2                  ; 5968   0240 01A2
        CMPI    #$000A, R0                      ; 596A   0378 000A
        BEQ     L_598E                          ; 596C   0204 0020

        CMPI    #$0009, R0                      ; 596E   0378 0009
        BNEQ    L_5979                          ; 5970   020C 0007

        SDBD                                    ; 5972   0001
        MVII    #$508B, R1                      ; 5973   02B9 008B 0050

        JSR     R5,     X_TIMER_START           ; 5976   0004 0118 0044

L_5979:
        MVI     G_0321, R0                      ; 5979   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 597B   0004 0114 0357

        ADDI    #$0007, R0                      ; 597E   02F8 0007

        JSR     R5,     X_PACK_BYTES            ; 5980   0004 0114 034F

        MVO     R0,     G_0321                  ; 5983   0240 0321
        MVII    #$0014, R0                      ; 5985   02B8 0014
        SDBD                                    ; 5987   0001
        MVII    #$5087, R1                      ; 5988   02B9 0087 0050
        J       .EXEC.832                       ; 598B   0004 0318 0032

L_598E:
        MVI     G_031F, R0                      ; 598E   0280 031F
        SWAP    R0,     1                       ; 5990   0040
        MVI     G_0181, R1                      ; 5991   0281 0181
        SUBI    #$0004, R0                      ; 5993   0338 0004
        ANDI    #$00F0, R0                      ; 5995   03B8 00F0
        ADDI    #$000C, R0                      ; 5997   02F8 000C
        TSTR    R1                              ; 5999   0089
        BEQ     L_59AC                          ; 599A   0204 0010

        SUBI    #$0008, R0                      ; 599C   0338 0008
        CMPI    #$0004, R0                      ; 599E   0378 0004
        BGT     L_59A6                          ; 59A0   020E 0004

        MVII    #$0014, R0                      ; 59A2   02B8 0014
        B       L_59AC                          ; 59A4   0200 0006

L_59A6:
        CMPI    #$009C, R0                      ; 59A6   0378 009C
        BLT     L_59AC                          ; 59A8   0205 0002

        MVII    #$008C, R0                      ; 59AA   02B8 008C
L_59AC:
        MVII    #$0009, R2                      ; 59AC   02BA 0009
        MVO     R0,     G_01AC                  ; 59AE   0240 01AC
        MVO     R2,     G_01AD                  ; 59B0   0242 01AD
        SWAP    R0,     1                       ; 59B2   0040
        XORR    R0,     R2                      ; 59B3   01C2
        MVII    #$0032, R3                      ; 59B4   02BB 0032
        MVII    #$031D, R1                      ; 59B6   02B9 031D

        JSR     R5,     .EXEC.9A8               ; 59B8   0004 0118 01A8

        SDBD                                    ; 59BB   0001
        MVII    #$5083, R1                      ; 59BC   02B9 0083 0050

        JSR     R5,     X_TIMER_STOP            ; 59BF   0004 0118 0038

        ADDI    #$0004, R1                      ; 59C2   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 59C4   0004 0118 0038

        ADDI    #$0004, R1                      ; 59C7   02F9 0004

        JSR     R5,     X_TIMER_STOP            ; 59C9   0004 0118 0038

        PULR    R7                              ; 59CC   02B7

L_59CD:
        MVII    #$0001, R0                      ; 59CD   02B8 0001
        MVO     R0,     G_01A2                  ; 59CF   0240 01A2
        MVI     G_01AC, R0                      ; 59D1   0280 01AC
        SWAP    R0,     1                       ; 59D3   0040
        MVO     R0,     G_031F                  ; 59D4   0240 031F
        SWAP    R0,     1                       ; 59D6   0040
        SLR     R0,     2                       ; 59D7   0064
        SLR     R0,     2                       ; 59D8   0064
        MVI     G_01A1, R1                      ; 59D9   0281 01A1
        SUBR    R0,     R1                      ; 59DB   0101
        BPL     L_59E0                          ; 59DC   0203 0002

        ADDI    #$0026, R1                      ; 59DE   02F9 0026
L_59E0:
        SDBD                                    ; 59E0   0001
        ADDI    #$5AE7, R1                      ; 59E1   02F9 00E7 005A
        MVI@    R1,     R1                      ; 59E4   0289
        MVO     R1,     G_01A3                  ; 59E5   0241 01A3
        CLRR    R0                              ; 59E7   01C0
        MVO     R0,     G_0164                  ; 59E8   0240 0164

        JSR     R5,     L_554C                  ; 59EA   0004 0154 014C

        MVII    #$0196, R4                      ; 59ED   02BC 0196
        MVII    #$0006, R0                      ; 59EF   02B8 0006
        MVII    #$0190, R5                      ; 59F1   02BD 0190
        PSHR    R5                              ; 59F3   0275

L_59F4:
        JSR     R5,     L_57B2                  ; 59F4   0004 0154 03B2

        MVI     G_01A3, R2                      ; 59F7   0282 01A3
        MVI@    R1,     R3                      ; 59F9   028B

        JSR     R5,     L_5B33                  ; 59FA   0004 0158 0333

        PULR    R5                              ; 59FD   02B5
        MVO@    R2,     R5                      ; 59FE   026A
        PSHR    R5                              ; 59FF   0275
        PSHR    R2                              ; 5A00   0272

        JSR     R5,     L_57C6                  ; 5A01   0004 0154 03C6

        MVI@    R2,     R0                      ; 5A04   0290
        PULR    R1                              ; 5A05   02B1

        JSR     R5,     X_MPY                   ; 5A06   0004 011C 01DC

        ADDR    R2,     R3                      ; 5A09   00D3
        PSHR    R3                              ; 5A0A   0273
        MVO@    R3,     R4                      ; 5A0B   0263
        SWAP    R3,     1                       ; 5A0C   0043
        MVO@    R3,     R4                      ; 5A0D   0263

        JSR     R5,     L_57C6                  ; 5A0E   0004 0154 03C6

        PULR    R3                              ; 5A11   02B3
        INCR    R1                              ; 5A12   0009
        INCR    R2                              ; 5A13   000A
        CMPI    #$0004, R0                      ; 5A14   0378 0004
        BNEQ    L_5A1F                          ; 5A16   020C 0007

        INCR    R1                              ; 5A18   0009
        MVII    #$0198, R4                      ; 5A19   02BC 0198
        MVII    #$0160, R5                      ; 5A1B   02BD 0160
        SDBD                                    ; 5A1D   0001
        MVI@    R5,     R3                      ; 5A1E   02AB
L_5A1F:
        DECR    R0                              ; 5A1F   0010
        BNEQ    L_59F4                          ; 5A20   022C 002D

        JSR     R5,     L_5944                  ; 5A22   0004 0158 0144

        PULR    R5                              ; 5A25   02B5
        CLRR    R0                              ; 5A26   01C0
        MVO     R0,     G_0321                  ; 5A27   0240 0321
        SDBD                                    ; 5A29   0001
        MVII    #$507F, R1                      ; 5A2A   02B9 007F 0050

        JSR     R5,     X_TIMER_START           ; 5A2D   0004 0118 0044
        JSR     R5,     L_5C93                  ; 5A30   0004 015C 0093

        MVII    #$0031, R0                      ; 5A33   02B8 0031

        JSR     R5,     .EXEC.A62               ; 5A35   0004 0118 0262

        SDBD                                    ; 5A38   0001
        MVII    #$507F, R1                      ; 5A39   02B9 007F 0050

        JSR     R5,     X_TIMER_STOP            ; 5A3C   0004 0118 0038

        MVII    #$0196, R4                      ; 5A3F   02BC 0196
        MVII    #$015E, R5                      ; 5A41   02BD 015E
        SDBD                                    ; 5A43   0001
        MVI@    R4,     R0                      ; 5A44   02A0
        MVO@    R0,     R5                      ; 5A45   0268
        SWAP    R0,     1                       ; 5A46   0040
        MVO@    R0,     R5                      ; 5A47   0268
        SDBD                                    ; 5A48   0001
        MVI@    R4,     R0                      ; 5A49   02A0
        MVO@    R0,     R5                      ; 5A4A   0268
        SWAP    R0,     1                       ; 5A4B   0040
        MVO@    R0,     R5                      ; 5A4C   0268
        MVII    #$0001, R0                      ; 5A4D   02B8 0001
        MVO     R0,     G_01A0                  ; 5A4F   0240 01A0
        CLRR    R0                              ; 5A51   01C0
        MVO     R0,     G_0165                  ; 5A52   0240 0165
        J       L_545E                          ; 5A54   0004 0354 005E

L_5A57:
        MVII    #$00FA, R0                      ; 5A57   02B8 00FA
L_5A59:
        DECR    R0                              ; 5A59   0010
        BNEQ    L_5A59                          ; 5A5A   022C 0002

L_5A5C:
        PSHR    R5                              ; 5A5C   0275

        JSR     R5,     .EXEC.60A               ; 5A5D   0004 0114 020A

        MVII    #$0212, R4                      ; 5A60   02BC 0212
        MVII    #$0013, R0                      ; 5A62   02B8 0013
L_5A64:
        MVI@    R4,     R1                      ; 5A64   02A1
        MVO@    R1,     R4                      ; 5A65   0261
        SUBI    #$0003, R4                      ; 5A66   033C 0003
        DECR    R0                              ; 5A68   0010
        BNEQ    L_5A64                          ; 5A69   022C 0006

        INCR    R4                              ; 5A6B   000C
        PSHR    R4                              ; 5A6C   0274
        MVII    #$01A1, R2                      ; 5A6D   02BA 01A1
        MVI@    R2,     R1                      ; 5A6F   0291
        MVII    #$0181, R3                      ; 5A70   02BB 0181
        MVI@    R3,     R5                      ; 5A72   029D
        COMR    R5                              ; 5A73   001D
        MOVR    R5,     R4                      ; 5A74   00AC
        ANDI    #$0001, R4                      ; 5A75   03BC 0001
        MVO@    R5,     R3                      ; 5A77   025D
        BEQ     L_5A7B                          ; 5A78   0204 0001

        INCR    R1                              ; 5A7A   0009
L_5A7B:
        CMPI    #$0026, R1                      ; 5A7B   0379 0026
        BNEQ    L_5A80                          ; 5A7D   020C 0001

        CLRR    R1                              ; 5A7F   01C9
L_5A80:
        MVO@    R1,     R2                      ; 5A80   0251
        SDBD                                    ; 5A81   0001
        ADDI    #$5AE7, R1                      ; 5A82   02F9 00E7 005A
        MVI@    R1,     R1                      ; 5A85   0289
        SDBD                                    ; 5A86   0001
        ADDI    #$5B0C, R1                      ; 5A87   02F9 000C 005B
        MVI@    R1,     R1                      ; 5A8A   0289
        MOVR    R1,     R2                      ; 5A8B   008A
        ANDI    #$0003, R2                      ; 5A8C   03BA 0003
        SDBD                                    ; 5A8E   0001
        ADDI    #$57AE, R2                      ; 5A8F   02FA 00AE 0057
        MVI@    R2,     R0                      ; 5A92   0290
        SWAP    R0,     1                       ; 5A93   0040
        XORI    #$0007, R0                      ; 5A94   03F8 0007
        TSTR    R4                              ; 5A96   00A4
        BEQ     L_5AA4                          ; 5A97   0204 000B

        MOVR    R1,     R2                      ; 5A99   008A
        SLR     R2,     2                       ; 5A9A   0066
        ANDI    #$03F8, R2                      ; 5A9B   03BA 03F8
        ADDI    #$0118, R2                      ; 5A9D   02FA 0118
        XORR    R0,     R2                      ; 5A9F   01C2
        PULR    R3                              ; 5AA0   02B3
        MVO@    R2,     R3                      ; 5AA1   025A
        B       L_5AB0                          ; 5AA2   0200 000C

L_5AA4:
        MOVR    R1,     R2                      ; 5AA4   008A
        ANDI    #$001C, R2                      ; 5AA5   03BA 001C
        SLR     R2,     2                       ; 5AA7   0066
        SDBD                                    ; 5AA8   0001
        ADDI    #$5AE2, R2                      ; 5AA9   02FA 00E2 005A
        MVI@    R2,     R2                      ; 5AAC   0292
        XORR    R0,     R2                      ; 5AAD   01C2
        PULR    R3                              ; 5AAE   02B3
        MVO@    R2,     R3                      ; 5AAF   025A
L_5AB0:
        SDBD                                    ; 5AB0   0001
        MVII    #$5083, R1                      ; 5AB1   02B9 0083 0050
        MVI     G_01A2, R0                      ; 5AB4   0280 01A2

        JSR     R5,     .EXEC.831               ; 5AB6   0004 0118 0031

L_5AB9:
        PULR    R7                              ; 5AB9   02B7

L_5ABA:
        PSHR    R5                              ; 5ABA   0275
        MVI     G_0321, R0                      ; 5ABB   0280 0321

        JSR     R5,     X_UNPK_BYTES            ; 5ABD   0004 0114 0357

        SUBI    #$0020, R1                      ; 5AC0   0339 0020
        SDBD                                    ; 5AC2   0001
        CMPI    #$FFA0, R1                      ; 5AC3   0379 00A0 00FF
        BNEQ    L_5ADC                          ; 5AC6   020C 0014

        JSR     R5,     L_5CB2                  ; 5AC8   0004 015C 00B2

        MVII    #$0040, R1                      ; 5ACB   02B9 0040
        MVII    #$0040, R0                      ; 5ACD   02B8 0040

        JSR     R5,     X_RAND2                 ; 5ACF   0004 0114 029E

        CMPI    #$001F, R0                      ; 5AD2   0378 001F
        BLE     L_5ADA                          ; 5AD4   0206 0004

        ADDI    #$0040, R0                      ; 5AD6   02F8 0040
        B       L_5ADC                          ; 5AD8   0200 0002

L_5ADA:
        SUBI    #$007F, R0                      ; 5ADA   0338 007F

L_5ADC:
        JSR     R5,     X_PACK_BYTES            ; 5ADC   0004 0114 034F

        MVO     R0,     G_0321                  ; 5ADF   0240 0321
        PULR    R7                              ; 5AE1   02B7

        GSWD    R0                              ; 5AE2   0030
        ADDR    R2,     R0                      ; 5AE3   00D0
        MOVR    R4,     R0                      ; 5AE4   00A0
        ADDR    R4,     R0                      ; 5AE5   00E0
        ANDR    R7,     R0                      ; 5AE6   01B8
        EIS                                     ; 5AE7   0002
        INCR    R6                              ; 5AE8   000E
        NEGR    R3                              ; 5AE9   0023
L_5AEA:
        DECR    R7                              ; 5AEA   0017

        JSR     R4,     .EXEC.021               ; 5AEB   0004 0010 0021
        DECLE   $0015,  $0006,  $0012,  $001F   ; 5AEE   0015 0006 0012 001F
        DECLE   $0013,  $0008,  $000C,  $001D   ; 5AF2   0013 0008 000C 001D
        DECLE   $0019,  $000A,  $001B,  $0026   ; 5AF6   0019 000A 001B 0026
        DECLE   $0001                           ; 5AFA   0001

        INCR    R5                              ; 5AFB   000D
        NEGR    R4                              ; 5AFC   0024
        COMR    R0                              ; 5AFD   0018
        DIS                                     ; 5AFE   0003
        INCR    R7                              ; 5AFF   000F

        NEGR    R2                              ; 5B00   0022
L_5B01:
        DECR    R6                              ; 5B01   0016
        DECLE   $0005,  $0011,  $0020,  $0014   ; 5B02   0005 0011 0020 0014
        DECLE   $0007,  $000B,  $001E,  $001A   ; 5B06   0007 000B 001E 001A
        DECLE   $0009,  $001C,  $0025,  $0162   ; 5B0A   0009 001C 0025 0162
        DECLE   $0183,  $01A2,  $01C3,  $01E2   ; 5B0E   0183 01A2 01C3 01E2
        DECLE   $0203,  $0222,  $0243,  $0262   ; 5B12   0203 0222 0243 0262
        DECLE   $0147,  $0167,  $0186,  $01A7   ; 5B16   0147 0167 0186 01A7
        DECLE   $01C6,  $01E7,  $0206,  $0227   ; 5B1A   01C6 01E7 0206 0227
        DECLE   $0246,  $0266,  $014B,  $016A   ; 5B1E   0246 0266 014B 016A
        DECLE   $018B,  $01AA,  $01CB,  $01EA   ; 5B22   018B 01AA 01CB 01EA
        DECLE   $020B,  $022A,  $024B,  $026B   ; 5B26   020B 022A 024B 026B
        DECLE   $014E,  $016F,  $018E,  $01AF   ; 5B2A   014E 016F 018E 01AF
        DECLE   $01CE,  $01EF                   ; 5B2E   01CE 01EF

        BGT     L_5C72                          ; 5B30   020E 0140

        CMPR    R2,     R0                      ; 5B32   0150
L_5B33:
        PSHR    R5                              ; 5B33   0275
        MVO     R2,     G_01A4                  ; 5B34   0242 01A4
        CMPI    #$0024, R3                      ; 5B36   037B 0024
        BGE     L_5B57                          ; 5B38   020D 001D

        CLRR    R4                              ; 5B3A   01E4
        DECR    R2                              ; 5B3B   0012
        CMPR    R2,     R3                      ; 5B3C   0153
        BNEQ    L_5B41                          ; 5B3D   020C 0002

        MVII    #$0023, R4                      ; 5B3F   02BC 0023
L_5B41:
        MOVR    R3,     R1                      ; 5B41   0099
        MVII    #$0003, R2                      ; 5B42   02BA 0003

        JSR     R5,     X_DIV                   ; 5B44   0004 011C 01FB

        SLL     R0,     2                       ; 5B47   004C
        SLL     R0,     1                       ; 5B48   0048
        ADDI    #$0027, R0                      ; 5B49   02F8 0027
        MVII    #$0002, R3                      ; 5B4B   02BB 0002
        SUBR    R1,     R3                      ; 5B4D   010B
        MOVR    R3,     R1                      ; 5B4E   0099
        SLL     R1,     2                       ; 5B4F   004D
        SLL     R1,     2                       ; 5B50   004D
        ADDI    #$001D, R1                      ; 5B51   02F9 001D
        MOVR    R4,     R2                      ; 5B53   00A2
L_5B54:
        SWAP    R0,     1                       ; 5B54   0040
        SWAP    R1,     1                       ; 5B55   0041
        PULR    R7                              ; 5B56   02B7

L_5B57:
        CMPI    #$003E, R3                      ; 5B57   037B 003E
        BPL     L_5C64                          ; 5B59   0203 0109

        MOVR    R3,     R2                      ; 5B5B   009A
        SLL     R3,     2                       ; 5B5C   004F
        SLL     R2,     1                       ; 5B5D   004A
        ADDR    R3,     R2                      ; 5B5E   00DA
        SDBD                                    ; 5B5F   0001
        ADDI    #$5AC3, R2                      ; 5B60   02FA 00C3 005A
        MOVR    R2,     R4                      ; 5B63   0094
        CLRR    R0                              ; 5B64   01C0
L_5B65:
        MVI@    R4,     R1                      ; 5B65   02A1
        SLL     R1,     2                       ; 5B66   004D
        SLL     R1,     2                       ; 5B67   004D
        SLL     R1,     2                       ; 5B68   004D
        MVII    #$000A, R3                      ; 5B69   02BB 000A
L_5B6B:
        INCR    R0                              ; 5B6B   0008
        SLLC    R1,     1                       ; 5B6C   0059
        BNC     L_5B79                          ; 5B6D   0209 000A

        CMP     G_01A4, R0                      ; 5B6F   0340 01A4
        BNEQ    L_5B79                          ; 5B71   020C 0006

        ADDI    #$0004, R2                      ; 5B73   02FA 0004
        MOVR    R2,     R4                      ; 5B75   0094
        MVI@    R4,     R2                      ; 5B76   02A2
        B       L_5B82                          ; 5B77   0200 0009

L_5B79:
        DECR    R3                              ; 5B79   0013
        BNEQ    L_5B6B                          ; 5B7A   022C 0010

        CMPI    #$0027, R0                      ; 5B7C   0378 0027
        BMI     L_5B65                          ; 5B7E   022B 001A

        CLRR    R2                              ; 5B80   01D2
        INCR    R4                              ; 5B81   000C
L_5B82:
        MVI@    R4,     R0                      ; 5B82   02A0
        MOVR    R0,     R1                      ; 5B83   0081
        ANDI    #$03E0, R0                      ; 5B84   03B8 03E0
        ANDI    #$001F, R1                      ; 5B86   03B9 001F
        SLL     R1,     2                       ; 5B88   004D
        INCR    R1                              ; 5B89   0009
        SWAP    R1,     1                       ; 5B8A   0041
        ADDI    #$00F8, R0                      ; 5B8B   02F8 00F8
        SLL     R0,     2                       ; 5B8D   004C
        SLL     R0,     1                       ; 5B8E   0048
        SLL     R0,     2                       ; 5B8F   004C
        SDBD                                    ; 5B90   0001
        CMPI    #$9700, R0                      ; 5B91   0378 0000 0097
        BNEQ    L_5B9A                          ; 5B94   020C 0004

        SDBD                                    ; 5B96   0001
        MVII    #$0C00, R0                      ; 5B97   02B8 0000 000C
L_5B9A:
        PULR    R7                              ; 5B9A   02B7

        DECLE   $0000,  $0000,  $0000,  $0008   ; 5B9B   0000 0000 0000 0008
        DECLE   $0024,  $000E,  $0000,  $0000   ; 5B9F   0024 000E 0000 0000
        DECLE   $0000,  $0004,  $0024,  $0008   ; 5BA3   0000 0004 0024 0008
        DECLE   $03FF,  $0300,  $0000,  $0000   ; 5BA7   03FF 0300 0000 0000
        DECLE   $0003,  $00B2,  $0000,  $00FF   ; 5BAB   0003 00B2 0000 00FF
        DECLE   $03C0,  $0000,  $0003,  $01B2   ; 5BAF   03C0 0000 0003 01B2
        DECLE   $0000,  $0000,  $003F,  $03F0   ; 5BB3   0000 0000 003F 03F0
        DECLE   $0003,  $02B2,  $0092,  $0124   ; 5BB7   0003 02B2 0092 0124
        DECLE   $0249,  $0090,  $0003,  $0367   ; 5BBB   0249 0090 0003 0367
        DECLE   $0124,  $0249,  $0092,  $0120   ; 5BBF   0124 0249 0092 0120
        DECLE   $0003,  $036B,  $0249,  $0092   ; 5BC3   0003 036B 0249 0092
        DECLE   $0124,  $0240,  $0003,  $036F   ; 5BC7   0124 0240 0003 036F
        DECLE   $03FF,  $03FC,  $0000,  $0000   ; 5BCB   03FF 03FC 0000 0000
        DECLE   $0002,  $0014,  $0155,  $0155   ; 5BCF   0002 0014 0155 0155
        DECLE   $0155,  $0150,  $0002,  $00D4   ; 5BD3   0155 0150 0002 00D4
        DECLE   $02AA,  $0156,  $02A9,  $0150   ; 5BD7   02AA 0156 02A9 0150
        DECLE   $0002,  $0174,  $0155,  $02A9   ; 5BDB   0002 0174 0155 02A9
        DECLE   $0156,  $02A0,  $0002,  $01F4   ; 5BDF   0156 02A0 0002 01F4
        DECLE   $02AA,  $02AA,  $02AA,  $02A0   ; 5BE3   02AA 02AA 02AA 02A0
        DECLE   $0002,  $0294,  $0000,  $0003   ; 5BE7   0002 0294 0000 0003
        DECLE   $03FF,  $03F0,  $0002,  $0354   ; 5BEB   03FF 03F0 0002 0354
        DECLE   $0000,  $0000,  $0000,  $000C   ; 5BEF   0000 0000 0000 000C
        DECLE   $0012,  $000B,  $0380,  $0000   ; 5BF3   0012 000B 0380 0000
        DECLE   $0000,  $000C,  $0007,  $0025   ; 5BF7   0000 000C 0007 0025
        DECLE   $0080,  $0000,  $0000,  $0004   ; 5BFB   0080 0000 0000 0004
        DECLE   $0012,  $0027,  $0100,  $0000   ; 5BFF   0012 0027 0100 0000
        DECLE   $0000,  $0004,  $0012,  $002A   ; 5C03   0000 0004 0012 002A
        DECLE   $0100,  $0000,  $0000,  $0008   ; 5C07   0100 0000 0000 0008
        DECLE   $0012,  $002C,  $0200,  $0000   ; 5C0B   0012 002C 0200 0000
        DECLE   $0000,  $0008,  $0012,  $002F   ; 5C0F   0000 0008 0012 002F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C13   0000 0000 0000 0000
        DECLE   $0001,  $03C7,  $0000,  $0000   ; 5C17   0001 03C7 0000 0000
        DECLE   $0000,  $0000,  $0001,  $03CB   ; 5C1B   0000 0000 0001 03CB
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C1F   0000 0000 0000 0000
        DECLE   $0001,  $03CF,  $0000,  $0000   ; 5C23   0001 03CF 0000 0000
        DECLE   $0000,  $0000,  $0001,  $03E7   ; 5C27   0000 0000 0001 03E7
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C2B   0000 0000 0000 0000
        DECLE   $0001,  $03EB,  $0000,  $0000   ; 5C2F   0001 03EB 0000 0000
        DECLE   $0000,  $0000,  $0001,  $03EF   ; 5C33   0000 0000 0001 03EF

        RSWD    R6                              ; 5C37   003E
        TSTR    R5                              ; 5C38   00AD
        CLRC                                    ; 5C39   0006
        DECR    R5                              ; 5C3A   0015
        XOR@    R6,     R6                      ; 5C3B   03F6
        SLL     R1,     1                       ; 5C3C   0049
        MOVR    R5,     R7                      ; 5C3D   00AF

        DECLE   $0012,  $001D,  $0244,  $0054   ; 5C3E   0012 001D 0244 0054
        DECLE   $00AE,  $0012,  $002D,  $0244   ; 5C42   00AE 0012 002D 0244
        DECLE   $005F,  $00AD,  $0012,  $003D   ; 5C46   005F 00AD 0012 003D
        DECLE   $0244,  $006A,  $009E,  $0012   ; 5C4A   0244 006A 009E 0012
        DECLE   $0025,  $0302,  $0076,  $009D   ; 5C4E   0025 0302 0076 009D
        DECLE   $0012,  $0035,  $0302,  $0082   ; 5C52   0012 0035 0302 0082
        DECLE   $009D,  $000C,  $0015,  $0383   ; 5C56   009D 000C 0015 0383
        DECLE   $008E,  $00AE,  $0009,  $0025   ; 5C5A   008E 00AE 0009 0025
        DECLE   $0365,  $0099,  $00AD,  $0009   ; 5C5E   0365 0099 00AD 0009
        DECLE   $0035                           ; 5C62   0035

        CMP@    R4,     R5                      ; 5C63   0365
L_5C64:
        SDBD                                    ; 5C64   0001
        MVII    #$5C65, R5                      ; 5C65   02BD 0065 005C
L_5C68:
        SUBI    #$0006, R5                      ; 5C68   033D 0006
        CMP@    R5,     R3                      ; 5C6A   036B
        BMI     L_5C68                          ; 5C6B   022B 0004

        DECR    R5                              ; 5C6D   0015
        SUB@    R5,     R3                      ; 5C6E   032B
        MVI@    R5,     R0                      ; 5C6F   02A8
        MOVR    R0,     R1                      ; 5C70   0081
        SLR     R0,     2                       ; 5C71   0064
L_5C72:
        ANDI    #$0003, R1                      ; 5C72   03B9 0003
        MOVR    R3,     R4                      ; 5C74   009C
        SLL     R3,     1                       ; 5C75   004B
        ADDR    R3,     R4                      ; 5C76   00DC
        ADDR    R1,     R4                      ; 5C77   00CC
        SLL     R3,     2                       ; 5C78   004F
        ADDR    R3,     R0                      ; 5C79   00D8
        MVI@    R5,     R2                      ; 5C7A   02AA
        MVI@    R5,     R1                      ; 5C7B   02A9
        MVI@    R5,     R3                      ; 5C7C   02AB
        MOVR    R3,     R5                      ; 5C7D   009D
        ANDI    #$0007, R5                      ; 5C7E   03BD 0007
        ANDI    #$03F8, R3                      ; 5C80   03BB 03F8
        SLL     R3,     2                       ; 5C82   004F
        SLL     R3,     2                       ; 5C83   004F
        SLL     R3,     2                       ; 5C84   004F
L_5C85:
        SLLC    R3,     1                       ; 5C85   005B
        BNC     L_5C8C                          ; 5C86   0209 0004

        CMP     G_01A4, R4                      ; 5C88   0344 01A4
        BEQ     L_5B54                          ; 5C8A   0224 0137

L_5C8C:
        INCR    R4                              ; 5C8C   000C
        DECR    R5                              ; 5C8D   0015
        BNEQ    L_5C85                          ; 5C8E   022C 000A

        CLRR    R2                              ; 5C90   01D2
        B       L_5B54                          ; 5C91   0220 013E

L_5C93:
        PSHR    R5                              ; 5C93   0275

        JSR     R5,     X_PLAY_SFX1             ; 5C94   0004 0118 03BB
        DECLE   $0389                           ; 5C97  SFX data
        DECLE   $0044,  $0038                   ; 5C98  SFX data
        DECLE   $009B                           ; 5C9A  SFX data
        DECLE   $0040,  $0018                   ; 5C9B  SFX data
        DECLE   $0048,  $0010                   ; 5C9D  SFX data
        DECLE   $004C,  $0000                   ; 5C9F  SFX data
        DECLE   $000B                           ; 5CA1  SFX data
        DECLE   $0057,  $0020                   ; 5CA2  SFX data
        DECLE   $001C,  $0200                   ; 5CA4  SFX data
        DECLE   $0048,  $0020                   ; 5CA6  SFX data
        DECLE   $000B                           ; 5CA8  SFX data
        DECLE   $01AB                           ; 5CA9  SFX data
        DECLE   $000B                           ; 5CAA  SFX data
        DECLE   $012B                           ; 5CAB  SFX data
        DECLE   $000B                           ; 5CAC  SFX data
        DECLE   $00AB                           ; 5CAD  SFX data
        DECLE   $000B                           ; 5CAE  SFX data
        DECLE   $006B                           ; 5CAF  SFX data
        DECLE   $000B                           ; 5CB0  SFX data
        DECLE   $03CF                           ; 5CB1  SFX end

L_5CB2:
        PSHR    R5                              ; 5CB2   0275

        JSR     R5,     X_PLAY_SFX1             ; 5CB3   0004 0118 03BB
        DECLE   $0389                           ; 5CB6  SFX data
        DECLE   $0040,  $0020                   ; 5CB7  SFX data
        DECLE   $0058,  $0000                   ; 5CB9  SFX data
        DECLE   $0054,  $0100                   ; 5CBB  SFX data
        DECLE   $000C,  $0100                   ; 5CBD  SFX data
        DECLE   $000B                           ; 5CBF  SFX data
        DECLE   $03CF                           ; 5CC0  SFX end

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ECD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EFD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F01   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F05   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F11   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F15   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F19   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F21   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F25   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F29   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F31   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F35   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F39   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F41   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F45   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F49   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F4D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F51   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F59   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F5D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F61   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F69   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F6D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F71   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F75   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F79   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F7D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F85   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F89   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F8D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F91   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F95   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F99   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FAD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 5FFD   0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5026       <entry>
;;  $5079       $502B   $5031  
;;  $5093       <entry>
;;  $509E       $50AA   $50C2   $50D3  
;;  $50AC       $50A6  
;;  $50C4       $50B2  
;;  $50D5       $50A2  
;;  $5368       <entry>
;;  $53CE       $53C9  
;;  $53F5       $53F0  
;;  $53F8       $537A   $5414  
;;  $5405       $5432  
;;  $540F       $53F5  
;;  $541D       $542F  
;;  $5439       $5442  
;;  $5440       $543D  
;;  $544C       $5452  
;;  $545E       $5A54  
;;  $548F       $548A  
;;  $5498       $5493  
;;  $5499       $548C   $5495   $578D   $57A0  
;;  $54A2       $54AA  
;;  $54AE       $5794  
;;  $54D6       $5781  
;;  $54FD       $5480   $576D   $5784   $5926  
;;  $550D       $50B8   $5509  
;;  $551C       $5483   $5772   $5797   $5929  
;;  $552C       $50BB   $5528  
;;  $553B       $5518   $5537  
;;  $553F       $5548  
;;  $554C       $56E1   $59EA  
;;  $5561       $545B  
;;  $55B5       $545E  
;;  $55B6       $55B3  
;;  $55BF       $55BB  
;;  $55C4       $55BF  
;;  $55CD       $55C9  
;;  $55D2       $55CD   $56C7   $56D0   $56D9  
;;  $55D3       $55C1   $55CF  
;;  $55D6       $55DB  
;;  $55DE       $5763  
;;  $55EB       $55E6  
;;  $55F6       $55EE  
;;  $55FB       $55E0  
;;  $5604       $55FF  
;;  $560F       $5607  
;;  $5614       $55E8   $55F2  
;;  $561D       $5601   $560B  
;;  $563F       $5632   $5636  
;;  $5646       $5640  
;;  $564A       $562B  
;;  $5656       $564C  
;;  $565E       $5654   $565C  
;;  $566C       $5652   $565A  
;;  $566E       $5644   $5648  
;;  $5680       $56A5  
;;  $5695       $5692  
;;  $5699       $5696  
;;  $56A0       $56C2  
;;  $56BC       $569C  
;;  $56C4       $5627   $56DD   $58D7  
;;  $56EC       $56E6  
;;  $56F3       $56F1  
;;  $56FE       $56F9  
;;  $570A       $5707  
;;  $571D       $56FC   $5778  
;;  $572A       $5726  
;;  $572F       $572C  
;;  $5739       $56F5  
;;  $574B       $5745  
;;  $5762       $5759  
;;  $5772       $576B  
;;  $5775       $5770  
;;  $5784       $577F  
;;  $5790       $578B  
;;  $5791       $577C  
;;  $5797       $5792  
;;  $57A3       $579E  
;;  $57B2       $5385   $59F4  
;;  $57C6       $53BA   $53E0   $5A01   $5A0E  
;;  $57C7       $57C5  
;;  $57E6       $554D  
;;  $5894       $58FB  
;;  $58CC       $58B8  
;;  $58E6       $58E2  
;;  $58ED       $58E9  
;;  $590C       $5924  
;;  $5914       $590F  
;;  $5923       $591B  
;;  $5944       $5A22  
;;  $594B       $5961  
;;  $5958       $5952  
;;  $595C       $5959  
;;  $5964       <entry>
;;  $5979       $5970  
;;  $598E       $596C  
;;  $59A6       $59A0  
;;  $59AC       $599A   $59A4   $59A8  
;;  $59CD       $58B4  
;;  $59E0       $59DC  
;;  $59F4       $5A20  
;;  $5A1F       $5A16  
;;  $5A57       <entry> $592C  
;;  $5A59       $5A5A  
;;  $5A5C       $544D  
;;  $5A64       $5A69  
;;  $5A7B       $5A78  
;;  $5A80       $5A7D  
;;  $5AA4       $5A97  
;;  $5AB0       $5AA2  
;;  $5AB9       $58F2   $58F6  
;;  $5ABA       <entry>
;;  $5ADA       $5AD4  
;;  $5ADC       $5AC6   $5AD8  
;;  $5AEA       $5AEA  
;;  $5B01       $5AFF  
;;  $5B33       $5682   $56B5   $59FA  
;;  $5B41       $5B3D  
;;  $5B54       $5C8A   $5C91  
;;  $5B57       $5B38  
;;  $5B65       $5B7E  
;;  $5B6B       $5B7A  
;;  $5B79       $5B6D   $5B71  
;;  $5B82       $5B77  
;;  $5B9A       $5B94  
;;  $5C64       $5B59  
;;  $5C68       $5C6B  
;;  $5C72       $5B30  
;;  $5C85       $5C8E  
;;  $5C8C       $5C86  
;;  $5C93       $5A30  
;;  $5CB2       $5AC8  
;; ======================================================================== ;;
