
        ORG     $5000
.HEADER:
        BIDECLE $688A           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5200           ; 5004  Ptr: Start of game
        BIDECLE $5EBD           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $62CD           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5048           ; 500A  Ptr: Date/Title
        DECLE   $00C0           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $000E   ; 500F  Color Stack init (0, 1)
        DECLE   $0000,  $000E   ; 5011  Color Stack init (2, 3)
        DECLE   $0005           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $0072,  $0050,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $004B,  $00D5,  $0011,  $0000; 5020  Timer dispatch/interval
        DECLE   $0082,  $0050,  $000A,  $0000; 5024  Timer dispatch/interval
        DECLE   $0096,  $0050,  $00E8,  $0003; 5028  Timer dispatch/interval
        DECLE   $00B4,  $0050,  $0032,  $0080; 502C  Timer dispatch/interval
        DECLE   $00E8,  $00D3,  $0028,  $0080; 5030  Timer dispatch/interval
        DECLE   $0053,  $00D3,  $0028,  $0080; 5034  Timer dispatch/interval
        DECLE   $00E9,  $0058,  $0044,  $0080; 5038  Timer dispatch/interval
        DECLE   $00E2,  $00D3,  $0028,  $0080; 503C  Timer dispatch/interval
        DECLE   $0078,  $00E7,  $0011,  $0080; 5040  Timer dispatch/interval
        BIDECLE $0000           ; 5044  End of timer table

        DECLE   $0000,  $0000                   ; 5046   0000 0000
.TITLE:
        DECLE   $0055                           ; 5048  Cartridge year
        STRING  "CHAMPIONSHIP"                  ; 5049  Title string
        DECLE   $0000                           ; 5055  

.TITLECODE:
        PSHR    R5                              ; 5056   0275
        MVII    #$0007, R3                      ; 5057   02BB 0007
        MVII    #$023D, R4                      ; 5059   02BC 023D

        JSR     R5,     X_PRINT_R5              ; 505B   0004 0118 007B
        STRING  "    NICE IDEAS  "              ; 505E  
        DECLE   $0000,  $0004                   ; 506E   0000 0004

        XOR@    R5,     R4                      ; 5070   03EC
        SUB@    R2,     R0                      ; 5071   0310
L_5072:
        PSHR    R5                              ; 5072   0275
        MVI     G_017E, R0                      ; 5073   0280 017E
        TSTR    R0                              ; 5075   0080
        BNEQ    L_507E                          ; 5076   020C 0006

        JSR     R5,     L_55D6                  ; 5078   0004 0154 01D6
        JSR     R5,     L_D6BD                  ; 507B   0004 01D4 02BD
L_507E:
        JSR     R5,     L_D635                  ; 507E   0004 01D4 0235

        PULR    R7                              ; 5081   02B7

L_5082:
        PSHR    R5                              ; 5082   0275
        MVI     G_0191, R0                      ; 5083   0280 0191
        XORI    #$0001, R0                      ; 5085   03F8 0001
        MVO     R0,     G_0191                  ; 5087   0240 0191
        TSTR    R0                              ; 5089   0080
        BEQ     L_5090                          ; 508A   0204 0004

        JSR     R5,     L_666C                  ; 508C   0004 0164 026C

        PULR    R7                              ; 508F   02B7

L_5090:
        MVI     G_0180, R2                      ; 5090   0282 0180

        JSR     R5,     L_5372                  ; 5092   0004 0150 0372

        PULR    R7                              ; 5095   02B7

L_5096:
        MVI     G_0198, R0                      ; 5096   0280 0198
        CMPI    #$0002, R0                      ; 5098   0378 0002
        BNEQ    L_50A4                          ; 509A   020C 0008

        MVII    #$00FF, R0                      ; 509C   02B8 00FF
        MVO     R0,     G_011D                  ; 509E   0240 011D
        MVII    #$0019, R0                      ; 50A0   02B8 0019
        MVO     R0,     G_011E                  ; 50A2   0240 011E
L_50A4:
        MVI     G_01D7, R0                      ; 50A4   0280 01D7
        INCR    R0                              ; 50A6   0008
        CMPI    #$003C, R0                      ; 50A7   0378 003C
        BLT     L_50B1                          ; 50A9   0205 0006

        MVI     G_01D6, R0                      ; 50AB   0280 01D6
        INCR    R0                              ; 50AD   0008
        MVO     R0,     G_01D6                  ; 50AE   0240 01D6
        CLRR    R0                              ; 50B0   01C0
L_50B1:
        MVO     R0,     G_01D7                  ; 50B1   0240 01D7
        MOVR    R5,     R7                      ; 50B3   00AF

L_50B4:
        PSHR    R5                              ; 50B4   0275
        MVI     G_0102, R0                      ; 50B5   0280 0102
L_50B7:
        CMP     G_0102, R0                      ; 50B7   0340 0102
        BEQ     L_50B7                          ; 50B9   0224 0003

        JSR     R5,     L_5C2C                  ; 50BB   0004 015C 002C

        SDBD                                    ; 50BE   0001
        MVII    #$5020, R1                      ; 50BF   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 50C2   0004 0118 0044

        MVII    #$0001, R2                      ; 50C5   02BA 0001
        SDBD                                    ; 50C7   0001
        MVII    #$1000, R0                      ; 50C8   02B8 0000 0010

L_50CB:
        JSR     R5,     L_5AD5                  ; 50CB   0004 0158 02D5

        INCR    R2                              ; 50CE   000A
        CMP     G_0180, R2                      ; 50CF   0342 0180
        BLT     L_50CB                          ; 50D1   0225 0007

        MVII    #$01D2, R4                      ; 50D3   02BC 01D2
        MVII    #$0003, R1                      ; 50D5   02B9 0003
        MVI     G_0189, R0                      ; 50D7   0280 0189
        TSTR    R0                              ; 50D9   0080
        BNEQ    L_5104                          ; 50DA   020C 0028

        CMP@    R4,     R1                      ; 50DC   0361
        BEQ     L_50E7                          ; 50DD   0204 0008

        CMP@    R4,     R1                      ; 50DF   0361
        BEQ     L_50E7                          ; 50E0   0204 0005

        JSR     R5,     L_D353                  ; 50E2   0004 01D0 0353

        B       L_5113                          ; 50E5   0200 002C

L_50E7:
        MVI     G_0198, R0                      ; 50E7   0280 0198
        CMPI    #$0002, R0                      ; 50E9   0378 0002
        BNEQ    L_50FE                          ; 50EB   020C 0011

        JSR     R5,     L_D353                  ; 50ED   0004 01D0 0353

        MVII    #$01D0, R4                      ; 50F0   02BC 01D0
        CLRR    R0                              ; 50F2   01C0
        MVO@    R0,     R4                      ; 50F3   0260
        MVO@    R0,     R4                      ; 50F4   0260
        MVO@    R0,     R4                      ; 50F5   0260
        MVO@    R0,     R4                      ; 50F6   0260
        MVO     R0,     G_035C                  ; 50F7   0240 035C
        INCR    R0                              ; 50F9   0008
        MVO     R0,     G_01A7                  ; 50FA   0240 01A7
        MVO     R0,     G_01D5                  ; 50FC   0240 01D5
L_50FE:
        SDBD                                    ; 50FE   0001
        MVII    #$511B, R0                      ; 50FF   02B8 001B 0051
        B       L_5111                          ; 5102   0200 000D

L_5104:
        CLRR    R0                              ; 5104   01C0
        MVO     R0,     G_0189                  ; 5105   0240 0189
        CMP@    R4,     R1                      ; 5107   0361
        BEQ     L_50E7                          ; 5108   0224 0022

        CMP@    R4,     R1                      ; 510A   0361
        BEQ     L_50E7                          ; 510B   0224 0025

        SDBD                                    ; 510D   0001
        MVII    #$52D0, R0                      ; 510E   02B8 00D0 0052
L_5111:
        MVO     R0,     G_035D                  ; 5111   0240 035D
L_5113:
        SDBD                                    ; 5113   0001
        MVII    #$501C, R1                      ; 5114   02B9 001C 0050

        JSR     R5,     X_TIMER_START           ; 5117   0004 0118 0044

        PULR    R7                              ; 511A   02B7

        DECLE   $0000,  $0000,  $0089,  $0064   ; 511B   0000 0000 0089 0064
        DECLE   $0000,  $0000,  $0000,  $0000   ; 511F   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0300,  $0000   ; 5123   0000 0000 0300 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 5127   0000 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $00BD   ; 512B   0000 0000 0000 00BD
        DECLE   $00E1,  $0001,  $0002,  $0008   ; 512F   00E1 0001 0002 0008
        DECLE   $02DD,  $00E8,  $02DD,  $01E8   ; 5133   02DD 00E8 02DD 01E8
        DECLE   $03DD,  $00E8,  $03DD,  $01E8   ; 5137   03DD 00E8 03DD 01E8
        DECLE   $0000,  $0000,  $0070,  $00E1   ; 513B   0000 0000 0070 00E1
        DECLE   $0001,  $0004,  $0008,  $020A   ; 513F   0001 0004 0008 020A
        DECLE   $00D7,  $020A,  $01D7           ; 5143   00D7 020A 01D7

        SUB@    R1,     R2                      ; 5146   030A
        ADDR    R2,     R7                      ; 5147   00D7

        DECLE   $030A,  $01D7,  $0100,  $0000   ; 5148   030A 01D7 0100 0000
        DECLE   $0029,  $00E0,  $0008,  $0006   ; 514C   0029 00E0 0008 0006
        DECLE   $0000,  $0100,  $0000,  $0029   ; 5150   0000 0100 0000 0029
        DECLE   $00E0,  $0008,  $00BA,  $0000   ; 5154   00E0 0008 00BA 0000
        DECLE   $0100,  $0000,  $0098,  $0054   ; 5158   0100 0000 0098 0054
        DECLE   $0001,  $0016,  $0000,  $0100   ; 515C   0001 0016 0000 0100
        DECLE   $0000,  $0098,  $0054,  $0001   ; 5160   0000 0098 0054 0001
        DECLE   $0018,  $0000,  $0100,  $0000   ; 5164   0018 0000 0100 0000
        DECLE   $0098,  $0054,  $0001,  $001A   ; 5168   0098 0054 0001 001A
        DECLE   $0000,  $0100,  $0000,  $0029   ; 516C   0000 0100 0000 0029
        DECLE   $00E0,  $0007,  $001C,  $0000   ; 5170   00E0 0007 001C 0000
        DECLE   $0100,  $0000,  $0029,  $00E0   ; 5174   0100 0000 0029 00E0
        DECLE   $0007,  $002A,  $0000,  $0100   ; 5178   0007 002A 0000 0100
        DECLE   $0000,  $0029,  $00E0,  $0007   ; 517C   0000 0029 00E0 0007
        DECLE   $0038,  $0000,  $0100,  $0000   ; 5180   0038 0000 0100 0000
        DECLE   $0029,  $00E0,  $0005,  $0046   ; 5184   0029 00E0 0005 0046
        DECLE   $0000,  $0100,  $0000,  $0029   ; 5188   0000 0100 0000 0029
        DECLE   $00E0,  $0005,  $0050,  $0000   ; 518C   00E0 0005 0050 0000
        DECLE   $0100,  $0000,  $0029,  $00E0   ; 5190   0100 0000 0029 00E0
        DECLE   $0005,  $005A,  $0000,  $0100   ; 5194   0005 005A 0000 0100
        DECLE   $0000,  $0029,  $00E0,  $0008   ; 5198   0000 0029 00E0 0008
        DECLE   $0064,  $0000,  $0100,  $0000   ; 519C   0064 0000 0100 0000
        DECLE   $0029,  $00E0,  $0008,  $00CA   ; 51A0   0029 00E0 0008 00CA
        DECLE   $0000,  $0100,  $0000,  $0098   ; 51A4   0000 0100 0000 0098
        DECLE   $0054,  $0005,  $006A,  $0000   ; 51A8   0054 0005 006A 0000
        DECLE   $0100,  $0000,  $0098,  $0054   ; 51AC   0100 0000 0098 0054
        DECLE   $0005,  $0074,  $0000,  $0100   ; 51B0   0005 0074 0000 0100
        DECLE   $0000,  $0098,  $0054,  $0005   ; 51B4   0000 0098 0054 0005
        DECLE   $007E,  $0000,  $0100,  $0000   ; 51B8   007E 0000 0100 0000
        DECLE   $0098,  $0054,  $0005,  $006A   ; 51BC   0098 0054 0005 006A
        DECLE   $0000,  $0100,  $0000,  $0098   ; 51C0   0000 0100 0000 0098
        DECLE   $0054,  $0005,  $0074,  $0000   ; 51C4   0054 0005 0074 0000
        DECLE   $0100,  $0000,  $0098,  $0054   ; 51C8   0100 0000 0098 0054
        DECLE   $0005,  $007E,  $0000,  $0300   ; 51CC   0005 007E 0000 0300
        DECLE   $0000,  $0028,  $00E1,  $0008   ; 51D0   0000 0028 00E1 0008
        DECLE   $0088,  $0000,  $0300,  $0000   ; 51D4   0088 0000 0300 0000
        DECLE   $0028,  $00E1,  $0008,  $00D0   ; 51D8   0028 00E1 0008 00D0
        DECLE   $0000,  $0300,  $0000,  $0028   ; 51DC   0000 0300 0000 0028
        DECLE   $00E1,  $0007,  $009A,  $0000   ; 51E0   00E1 0007 009A 0000
        DECLE   $0300,  $0000,  $0028,  $00E1   ; 51E4   0300 0000 0028 00E1
        DECLE   $0005,  $00A8,  $0000,  $0300   ; 51E8   0005 00A8 0000 0300
        DECLE   $0000,  $0028,  $00E1,  $0008   ; 51EC   0000 0028 00E1 0008
        DECLE   $00B2,  $0000,  $0300,  $0000   ; 51F0   00B2 0000 0300 0000
        DECLE   $0028,  $00E1,  $0008,  $00E2   ; 51F4   0028 00E1 0008 00E2
        DECLE   $0000,  $0300,  $0000,  $0000   ; 51F8   0000 0300 0000 0000
        DECLE   $0000,  $0001,  $00A4,  $0000   ; 51FC   0000 0001 00A4 0000
.START:
        PSHR    R5                              ; 5200   0275
        MVII    #$000A, R2                      ; 5201   02BA 000A
        SDBD                                    ; 5203   0001
        MVII    #$501C, R1                      ; 5204   02B9 001C 0050

L_5207:
        JSR     R5,     X_TIMER_STOP            ; 5207   0004 0118 0038

        ADDI    #$0004, R1                      ; 520A   02F9 0004
        DECR    R2                              ; 520C   0012
        BNEQ    L_5207                          ; 520D   022C 0007

        SDBD                                    ; 520F   0001
        MVII    #$52D0, R0                      ; 5210   02B8 00D0 0052
        MVO     R0,     G_035D                  ; 5213   0240 035D
        MVII    #$015D, R4                      ; 5215   02BC 015D
        MVII    #$0093, R0                      ; 5217   02B8 0093

        JSR     R5,     X_FILL_ZERO             ; 5219   0004 0114 0338

        MVI     G_0103, R0                      ; 521C   0280 0103
        NEGR    R0                              ; 521E   0020
        ADDI    #$0007, R0                      ; 521F   02F8 0007
        MVO     R0,     G_01C8                  ; 5221   0240 01C8
        MVII    #$0003, R0                      ; 5223   02B8 0003
        MVO     R0,     G_0103                  ; 5225   0240 0103
        MVII    #$0002, R0                      ; 5227   02B8 0002
        MVO     R0,     G_0115                  ; 5229   0240 0115
        MVII    #$017F, R4                      ; 522B   02BC 017F
        MVII    #$0002, R0                      ; 522D   02B8 0002
        MVII    #$0001, R1                      ; 522F   02B9 0001

        JSR     R5,     X_FILL_MEM              ; 5231   0004 0114 0341

        MVII    #$0004, R0                      ; 5234   02B8 0004

        JSR     R5,     L_52CA                  ; 5236   0004 0150 02CA

        MVII    #$0004, R0                      ; 5239   02B8 0004
        MVII    #$0001, R1                      ; 523B   02B9 0001

        JSR     R5,     L_52CA                  ; 523D   0004 0150 02CA

        MVII    #$0040, R0                      ; 5240   02B8 0040
        MVII    #$031D, R4                      ; 5242   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 5244   0004 0114 0338

        SDBD                                    ; 5247   0001
        MVII    #$52DA, R4                      ; 5248   02BC 00DA 0052

        JSR     R5,     L_52BB                  ; 524B   0004 0150 02BB

        SDBD                                    ; 524E   0001
        MVII    #$52B6, R1                      ; 524F   02B9 00B6 0052
        ADD     G_01C8, R1                      ; 5252   02C1 01C8
        MVI@    R1,     R0                      ; 5254   0288
        MOVR    R0,     R1                      ; 5255   0081
        INCR    R1                              ; 5256   0009

        JSR     R5,     X_MPY                   ; 5257   0004 011C 01DC

        SDBD                                    ; 525A   0001
        MVII    #$2200, R1                      ; 525B   02B9 0000 0022

        JSR     R5,     X_DIV                   ; 525E   0004 011C 01FB

        TSTR    R0                              ; 5261   0080
        BNEQ    L_5265                          ; 5262   020C 0001

        INCR    R0                              ; 5264   0008
L_5265:
        MVO     R0,     G_01B1                  ; 5265   0240 01B1
        MOVR    R0,     R2                      ; 5267   0082
        SDBD                                    ; 5268   0001
        MVII    #$0800, R1                      ; 5269   02B9 0000 0008

        JSR     R5,     X_DIV                   ; 526C   0004 011C 01FB

        MVII    #$0008, R1                      ; 526F   02B9 0008

        JSR     R5,     X_MPY                   ; 5271   0004 011C 01DC

        INCR    R2                              ; 5274   000A
        MOVR    R2,     R1                      ; 5275   0091

        JSR     R5,     X_SQRT                  ; 5276   0004 011C 0223

        INCR    R2                              ; 5279   000A
        SLR     R2,     1                       ; 527A   0062
        MVO     R2,     G_01E3                  ; 527B   0242 01E3
        MVII    #$017A, R1                      ; 527D   02B9 017A

        JSR     R5,     X_DIV                   ; 527F   0004 011C 01FB

        CMPI    #$0040, R0                      ; 5282   0378 0040
        BLT     L_5288                          ; 5284   0205 0002

        MVII    #$003F, R0                      ; 5286   02B8 003F
L_5288:
        MVO     R0,     G_01E4                  ; 5288   0240 01E4
        MVI     G_01B1, R0                      ; 528A   0280 01B1
        MVI     G_01E3, R1                      ; 528C   0281 01E3

        JSR     R5,     X_MPY                   ; 528E   0004 011C 01DC

        SLR     R2,     2                       ; 5291   0066
        MVO     R2,     G_01E5                  ; 5292   0242 01E5
        SDBD                                    ; 5294   0001
        MVII    #$FFBE, R1                      ; 5295   02B9 00BE 00FF
        MVI     G_01E3, R2                      ; 5298   0282 01E3

        JSR     R5,     X_DIV                   ; 529A   0004 011C 01FB

        TSTR    R0                              ; 529D   0080
        BNEQ    L_52A4                          ; 529E   020C 0004

        SDBD                                    ; 52A0   0001
        MVII    #$FFFF, R0                      ; 52A1   02B8 00FF 00FF
L_52A4:
        MVO     R0,     G_01E6                  ; 52A4   0240 01E6
        MVII    #$002E, R1                      ; 52A6   02B9 002E
        MVI     G_01E3, R2                      ; 52A8   0282 01E3

        JSR     R5,     X_DIV                   ; 52AA   0004 011C 01FB

        TSTR    R0                              ; 52AD   0080
        BNEQ    L_52B1                          ; 52AE   020C 0001

        INCR    R0                              ; 52B0   0008
L_52B1:
        MVO     R0,     G_01E7                  ; 52B1   0240 01E7

        JSR     R5,     L_5BC0                  ; 52B3   0004 0158 03C0

        PULR    R7                              ; 52B6   02B7

        COMR    R1                              ; 52B7   0019
        DECR    R5                              ; 52B8   0015
        DECR    R1                              ; 52B9   0011
        INCR    R5                              ; 52BA   000D
L_52BB:
        PSHR    R5                              ; 52BB   0275
L_52BC:
        MVI@    R4,     R5                      ; 52BC   02A5
        DECLE   $00AD,  $0204,  $0009,  $037D   ; 52BD   00AD 0204 0009 037D
        DECLE   $0200,  $0205,  $0001,  $0001   ; 52C1   0200 0205 0001 0001

        MVI@    R4,     R0                      ; 52C5   02A0
        MVO@    R0,     R5                      ; 52C6   0268
        B       L_52BC                          ; 52C7   0220 000C
        PULR    R7                              ; 52C9   02B7

L_52CA:
        MVO@    R1,     R4                      ; 52CA   0261
        INCR    R1                              ; 52CB   0009
        DECR    R0                              ; 52CC   0010
        BNEQ    L_52CA                          ; 52CD   022C 0004
        MOVR    R5,     R7                      ; 52CF   00AF

        DECLE   $0000,  $00D0,  $0089,  $0064   ; 52D0   0000 00D0 0089 0064
        DECLE   $002B,  $00DD,  $0030,  $00DD   ; 52D4   002B 00DD 0030 00DD
        DECLE   $0035                           ; 52D8   0035

        ADDR    R3,     R5                      ; 52D9   00DD
        SUB@    R5,     R5                      ; 52DA   032D
        ADDR    R4,     R1                      ; 52DB   00E1
        COMR    R0                              ; 52DC   0018
        SUB@    R5,     R6                      ; 52DD   032E
        SLLC    R0,     1                       ; 52DE   0058
        RLC     R1,     1                       ; 52DF   0051
        SUB@    R5,     R7                      ; 52E0   032F

        DECLE   $0000,  $000F,  $0330,  $0000   ; 52E1   0000 000F 0330 0000

        SAR     R0,     1                       ; 52E5   0068
        SUBI    #$00C0, R5                      ; 52E6   033D 00C0
        NEGR    R0                              ; 52E8   0020
        SUBI    #$0025, R6                      ; 52E9   033E 0025
        RLC     R1,     1                       ; 52EB   0051
        SUBI    #$0000, R7                      ; 52EC   033F 0000

L_52EE:
        SLL     R0,     1                       ; 52EE   0048
        CMP     .STIC.X.0,R0                    ; 52EF   0340 0000
        COMR    R0                              ; 52F1   0018
        SUB@    R6,     R5                      ; 52F2   0335
        ADDR    R4,     R2                      ; 52F3   00E2
        COMR    R0                              ; 52F4   0018
        SUB@    R6,     R6                      ; 52F5   0336
        SLLC    R0,     1                       ; 52F6   0058
        RLC     R1,     1                       ; 52F7   0051
        SUB@    R6,     R7                      ; 52F8   0337

        DECLE   $0000,  $000F,  $0338,  $0000   ; 52F9   0000 000F 0338 0000
        DECLE   $0068,  $0345,  $00C0,  $0020   ; 52FD   0068 0345 00C0 0020
        DECLE   $0346,  $0025,  $0051,  $0347   ; 5301   0346 0025 0051 0347
        DECLE   $0000,  $0068,  $0348,  $0000   ; 5305   0000 0068 0348 0000
        DECLE   $0028,  $034D,  $00F4,  $0018   ; 5309   0028 034D 00F4 0018
        DECLE   $034E,  $0058,  $0051,  $034F   ; 530D   034E 0058 0051 034F
        DECLE   $0000,  $000F,  $0350,  $0000   ; 5311   0000 000F 0350 0000
        DECLE   $0068,  $0355,  $00F7,  $0018   ; 5315   0068 0355 00F7 0018
        DECLE   $0356,  $0058,  $0051,  $0357   ; 5319   0356 0058 0051 0357
        DECLE   $0000,  $000F,  $0358,  $0000   ; 531D   0000 000F 0358 0000

        SAR     R0,     1                       ; 5321   0068
        SUB@    R3,     R5                      ; 5322   031D
        ADDR    R0,     R0                      ; 5323   00C0
        NEGR    R0                              ; 5324   0020
        SUB@    R3,     R6                      ; 5325   031E
        NEGR    R5                              ; 5326   0025
        RLC     R1,     1                       ; 5327   0051
        SUB@    R3,     R7                      ; 5328   031F

        DECLE   $0000,  $0048,  $0320,  $0000   ; 5329   0000 0048 0320 0000

        SWAP    R0,     1                       ; 532D   0040
        SUB@    R4,     R5                      ; 532E   0325
        ADDR    R0,     R0                      ; 532F   00C0
        NEGR    R0                              ; 5330   0020
        SUB@    R4,     R6                      ; 5331   0326
        NEGR    R5                              ; 5332   0025
        RLC     R1,     1                       ; 5333   0051
        SUB@    R4,     R7                      ; 5334   0327

        DECLE   $0000,  $0068,  $0328,  $0000   ; 5335   0000 0068 0328 0000
        DECLE   $0050,  $016E,  $0020,  $015D   ; 5339   0050 016E 0020 015D
        DECLE   $0002,  $015E,  $0003,  $015F   ; 533D   0002 015E 0003 015F
        DECLE   $0006,  $0160,  $0007,  $01AA   ; 5341   0006 0160 0007 01AA
        DECLE   $0001,  $01AB,  $0002,  $01AE   ; 5345   0001 01AB 0002 01AE
        DECLE   $0003,  $01AF,  $0004,  $0000   ; 5349   0003 01AF 0004 0000
        DECLE   $033D,  $0040,  $0000,  $033E   ; 534D   033D 0040 0000 033E
        DECLE   $00D6,  $0051,  $0345,  $0040   ; 5351   00D6 0051 0345 0040
        DECLE   $0000                           ; 5355   0000

        CMP     G_00D6, R6                      ; 5356   0346 00D6
        RLC     R1,     1                       ; 5358   0051
        SUB@    R3,     R6                      ; 5359   031E
        ADCR    R4                              ; 535A   002C
        RLC     R1,     1                       ; 535B   0051
        SUB@    R3,     R7                      ; 535C   031F

        DECLE   $0000,  $0000,  $0320,  $0000   ; 535D   0000 0000 0320 0000
        DECLE   $0000,  $01BA,  $0001,  $01A7   ; 5361   0000 01BA 0001 01A7
        DECLE   $0001,  $01D5,  $0001,  $01C3   ; 5365   0001 01D5 0001 01C3
        DECLE   $0000,  $016B,  $0001,  $0189   ; 5369   0000 016B 0001 0189
        DECLE   $0000,  $0326,  $003B,  $0051   ; 536D   0000 0326 003B 0051
        DECLE   $0000                           ; 5371   0000
L_5372:
        PSHR    R5                              ; 5372   0275
        SDBD                                    ; 5373   0001
        MVII    #$1000, R0                      ; 5374   02B8 0000 0010

        JSR     R5,     L_5AD5                  ; 5377   0004 0158 02D5

        MOVR    R2,     R0                      ; 537A   0090
        MVII    #$0007, R3                      ; 537B   02BB 0007
        MVII    #$0208, R4                      ; 537D   02BC 0208
        MVII    #$0001, R1                      ; 537F   02B9 0001

        JSR     R5,     X_PRNUM_RGT             ; 5381   0004 0118 00C5

        MVII    #$0201, R4                      ; 5384   02BC 0201

        JSR     R5,     X_PRINT_R5              ; 5386   0004 0118 007B
        STRING  "PLAYER"                        ; 5389  
        DECLE   $0000                           ; 538F   0000

        MVII    #$0007, R3                      ; 5390   02BB 0007
        MVII    #$020A, R4                      ; 5392   02BC 020A

        JSR     R5,     X_PRINT_R5              ; 5394   0004 0118 007B
        STRING  "POSITION ?"                    ; 5397  
        DECLE   $0000                           ; 53A1   0000

        JSR     R5,     L_53A6                  ; 53A2   0004 0150 03A6

        PULR    R7                              ; 53A5   02B7

L_53A6:
        PSHR    R5                              ; 53A6   0275
        SDBD                                    ; 53A7   0001
        MVII    #$53D1, R4                      ; 53A8   02BC 00D1 0053
        ADDR    R2,     R4                      ; 53AB   00D4
        MVI@    R4,     R3                      ; 53AC   02A3
        MVII    #$0000, R2                      ; 53AD   02BA 0000
L_53AF:
        MVII    #$0185, R4                      ; 53AF   02BC 0185
        ADDR    R2,     R4                      ; 53B1   00D4
        MVI@    R4,     R0                      ; 53B2   02A0
        TSTR    R0                              ; 53B3   0080
        BEQ     L_53CC                          ; 53B4   0204 0016

        SDBD                                    ; 53B6   0001
        MVII    #$53D6, R4                      ; 53B7   02BC 00D6 0053
        ADDR    R2,     R4                      ; 53BA   00D4
        MVI@    R4,     R0                      ; 53BB   02A0

        JSR     R5,     .EXEC.76C               ; 53BC   0004 0114 036C

        ADDI    #$0000, R1                      ; 53BF   02F9 0000
        MVI@    R1,     R0                      ; 53C1   0288
        SDBD                                    ; 53C2   0001
        ANDI    #$FFE0, R0                      ; 53C3   03B8 00E0 00FF
        XORR    R3,     R0                      ; 53C6   01D8
        SDBD                                    ; 53C7   0001
        XORI    #$1000, R0                      ; 53C8   03F8 0000 0010
        MVO@    R0,     R1                      ; 53CB   0248
L_53CC:
        INCR    R2                              ; 53CC   000A
        CMPI    #$0004, R2                      ; 53CD   037A 0004
        BNEQ    L_53AF                          ; 53CF   022C 0021
        PULR    R7                              ; 53D1   02B7

        DECLE   $0001                           ; 53D2   0001

        EIS                                     ; 53D3   0002
        DECR    R4                              ; 53D4   0014
L_53D5:
        DECR    R7                              ; 53D5   0017

        DECLE   $0004,  $0005,  $0000,  $0001   ; 53D6   0004 0005 0000 0001
L_53DA:
        PSHR    R5                              ; 53DA   0275
        PSHR    R0                              ; 53DB   0270
        MVII    #$0179, R4                      ; 53DC   02BC 0179
        ADDR    R2,     R4                      ; 53DE   00D4
        CLRR    R0                              ; 53DF   01C0
        MVO@    R0,     R4                      ; 53E0   0260
        MVII    #$016E, R4                      ; 53E1   02BC 016E
        ADDR    R2,     R4                      ; 53E3   00D4
        INCR    R0                              ; 53E4   0008
        MVO@    R0,     R4                      ; 53E5   0260

        JSR     R5,     L_D181                  ; 53E6   0004 01D0 0181

        PULR    R0                              ; 53E9   02B0
        SDBD                                    ; 53EA   0001
        MVII    #$5478, R4                      ; 53EB   02BC 0078 0054
        ADDR    R0,     R4                      ; 53EE   00C4
        ADDR    R0,     R4                      ; 53EF   00C4
        MVI@    R4,     R0                      ; 53F0   02A0
        PSHR    R0                              ; 53F1   0270
        MVI@    R4,     R0                      ; 53F2   02A0
        CMP     G_01B8, R2                      ; 53F3   0342 01B8
        PULR    R2                              ; 53F5   02B2
        BNEQ    L_53FC                          ; 53F6   020C 0004

        MVO     R2,     G_01BC                  ; 53F8   0242 01BC
        MVO     R0,     G_01BD                  ; 53FA   0240 01BD

L_53FC:
        JSR     R5,     L_5573                  ; 53FC   0004 0154 0173

        PULR    R7                              ; 53FF   02B7

L_5400:
        MOVR    R1,     R4                      ; 5400   008C

        JSR     R5,     L_5564                  ; 5401   0004 0154 0164

        SDBD                                    ; 5404   0001
        MVII    #$5158, R3                      ; 5405   02BB 0058 0051

        JSR     R5,     L_D0C9                  ; 5408   0004 01D0 00C9

        CMP     G_01B8, R2                      ; 540B   0342 01B8
        BNEQ    L_5419                          ; 540D   020C 000A

        INCR    R1                              ; 540F   0009
        MOVR    R1,     R4                      ; 5410   008C
        MVII    #$01BC, R5                      ; 5411   02BD 01BC
        MVI@    R5,     R0                      ; 5413   02A8
        SWAP    R0,     1                       ; 5414   0040
        MVO@    R0,     R4                      ; 5415   0260
        MVI@    R5,     R0                      ; 5416   02A8
        SWAP    R0,     1                       ; 5417   0040
        MVO@    R0,     R4                      ; 5418   0260
L_5419:
        MVII    #$016F, R4                      ; 5419   02BC 016F
L_541B:
        MVI@    R4,     R0                      ; 541B   02A0
        TSTR    R0                              ; 541C   0080
        BNEQ    L_5451                          ; 541D   020C 0032

        CMPI    #$0173, R4                      ; 541F   037C 0173
        BNEQ    L_541B                          ; 5421   022C 0007

        MVII    #$0001, R0                      ; 5423   02B8 0001
        MVO     R0,     G_01A9                  ; 5425   0240 01A9

        JSR     R5,     L_D4ED                  ; 5427   0004 01D4 00ED

        TSTR    R0                              ; 542A   0080
        BNEQ    L_5434                          ; 542B   020C 0007

        MVII    #$0002, R0                      ; 542D   02B8 0002
        MVO     R0,     G_01A9                  ; 542F   0240 01A9

        JSR     R5,     L_D4ED                  ; 5431   0004 01D4 00ED

L_5434:
        MVO     R0,     G_01ED                  ; 5434   0240 01ED

        JSR     R5,     L_587F                  ; 5436   0004 0158 007F

        MVII    #$0002, R2                      ; 5439   02BA 0002

        JSR     R5,     L_5A6D                  ; 543B   0004 0158 026D

        MVI     G_01B8, R1                      ; 543E   0281 01B8
        MVII    #$018C, R3                      ; 5440   02BB 018C
        ADDR    R1,     R3                      ; 5442   00CB
        MVI@    R3,     R0                      ; 5443   0298
        TSTR    R0                              ; 5444   0080
        BEQ     L_5451                          ; 5445   0204 000A

        SDBD                                    ; 5447   0001
        MVII    #$5040, R1                      ; 5448   02B9 0040 0050

        JSR     R5,     X_TIMER_START           ; 544B   0004 0118 0044
        JSR     R5,     .EXEC.81E               ; 544E   0004 0118 001E

L_5451:
        PULR    R7                              ; 5451   02B7

L_5452:
        MOVR    R1,     R4                      ; 5452   008C

        JSR     R5,     L_5564                  ; 5453   0004 0154 0164

        SDBD                                    ; 5456   0001
        MVII    #$5158, R3                      ; 5457   02BB 0058 0051

        JSR     R5,     L_D0C9                  ; 545A   0004 01D0 00C9

        MVI     G_0195, R1                      ; 545D   0281 0195
        TSTR    R1                              ; 545F   0089
        BEQ     L_5477                          ; 5460   0204 0015

        CMP     G_0199, R2                      ; 5462   0342 0199
        BNEQ    L_5477                          ; 5464   020C 0011

        MVI     G_0194, R0                      ; 5466   0280 0194
        SUBR    R1,     R0                      ; 5468   0108
        BPL     L_5471                          ; 5469   0203 0006

        NEGR    R0                              ; 546B   0020
        CMPI    #$0003, R0                      ; 546C   0378 0003
        BGT     L_5474                          ; 546E   020E 0004

        CLRR    R0                              ; 5470   01C0
L_5471:
        INCR    R0                              ; 5471   0008
        MVO     R0,     G_0196                  ; 5472   0240 0196
L_5474:
        CLRR    R0                              ; 5474   01C0
        MVO     R0,     G_0195                  ; 5475   0240 0195
L_5477:
        PULR    R7                              ; 5477   02B7

        DECLE   $0066,  $0053,  $0048,  $003A   ; 5478   0066 0053 0048 003A
        DECLE   $0072,  $0056,  $0048,  $0042   ; 547C   0072 0056 0048 0042
        DECLE   $0052,  $0053,  $0070,  $003A   ; 5480   0052 0053 0070 003A
        DECLE   $0046,  $0056,  $0070,  $0042   ; 5484   0046 0056 0070 0042
        DECLE   $0054,  $0011,  $006C,  $0027   ; 5488   0054 0011 006C 0027
        DECLE   $004C,  $000E,  $006C,  $001F   ; 548C   004C 000E 006C 001F
        DECLE   $0064,  $0011,  $004C,  $0027   ; 5490   0064 0011 004C 0027
        DECLE   $006C,  $000E,  $004C,  $001F   ; 5494   006C 000E 004C 001F

        PSHR    R5                              ; 5498   0275

        JSR     R5,     L_556E                  ; 5499   0004 0154 016E

        MVII    #$016E, R3                      ; 549C   02BB 016E
        ADDR    R2,     R3                      ; 549E   00D3
        MVI@    R3,     R3                      ; 549F   029B
        CMPI    #$0001, R3                      ; 54A0   037B 0001
        BEQ     L_5400                          ; 54A2   0224 00A3

        CMPI    #$0002, R3                      ; 54A4   037B 0002
        BEQ     L_551E                          ; 54A6   0204 0076

        CMPI    #$0003, R3                      ; 54A8   037B 0003
        BEQ     L_5558                          ; 54AA   0204 00AC

        CMPI    #$0005, R3                      ; 54AC   037B 0005
        BEQ     L_5452                          ; 54AE   0224 005D
        PULR    R7                              ; 54B0   02B7

L_54B1:
        PSHR    R5                              ; 54B1   0275
        PSHR    R1                              ; 54B2   0271
        MOVR    R1,     R2                      ; 54B3   008A
        ANDI    #$0007, R2                      ; 54B4   03BA 0007
        ANDI    #$0080, R1                      ; 54B6   03B9 0080
        BEQ     L_54BE                          ; 54B8   0204 0004

        SUBI    #$0002, R0                      ; 54BA   0338 0002
        MVO     R2,     G_01B8                  ; 54BC   0242 01B8
L_54BE:
        MVI     G_01A8, R1                      ; 54BE   0281 01A8
        ANDI    #$0001, R1                      ; 54C0   03B9 0001
        SLL     R1,     2                       ; 54C2   004D
        ADDR    R1,     R0                      ; 54C3   00C8
        PSHR    R0                              ; 54C4   0270

        JSR     R5,     L_53DA                  ; 54C5   0004 0150 03DA

        PULR    R0                              ; 54C8   02B0
        INCR    R0                              ; 54C9   0008
        PULR    R2                              ; 54CA   02B2
        ANDI    #$0038, R2                      ; 54CB   03BA 0038
        BEQ     L_54D4                          ; 54CD   0204 0005

        SLR     R2,     2                       ; 54CF   0066
        SLR     R2,     1                       ; 54D0   0062

        JSR     R5,     L_53DA                  ; 54D1   0004 0150 03DA

L_54D4:
        PULR    R7                              ; 54D4   02B7

L_54D5:
        PSHR    R5                              ; 54D5   0275
        MVI     G_0174, R0                      ; 54D6   0280 0174
        MOVR    R0,     R2                      ; 54D8   0082
        MVII    #$0004, R1                      ; 54D9   02B9 0004
        MVI     G_01D4, R3                      ; 54DB   0283 01D4
        TSTR    R3                              ; 54DD   009B
        BEQ     L_54E1                          ; 54DE   0204 0001

        DECR    R1                              ; 54E0   0011
L_54E1:
        ANDI    #$0080, R0                      ; 54E1   03B8 0080
        BNEQ    L_54EF                          ; 54E3   020C 000A

        MVI     G_0173, R2                      ; 54E5   0282 0173
        MVII    #$0001, R1                      ; 54E7   02B9 0001
        MVI     G_01D4, R3                      ; 54E9   0283 01D4
        TSTR    R3                              ; 54EB   009B
        BEQ     L_54EF                          ; 54EC   0204 0001

        INCR    R1                              ; 54EE   0009
L_54EF:
        ANDI    #$0007, R2                      ; 54EF   03BA 0007
        MVO     R2,     G_01B8                  ; 54F1   0242 01B8
        MVO     R1,     G_01BA                  ; 54F3   0241 01BA
        MVII    #$0001, R2                      ; 54F5   02BA 0001
L_54F7:
        PSHR    R2                              ; 54F7   0272
        MVII    #$0024, R4                      ; 54F8   02BC 0024
        MVII    #$002B, R0                      ; 54FA   02B8 002B

        JSR     R5,     L_5506                  ; 54FC   0004 0154 0106

        PULR    R2                              ; 54FF   02B2
        INCR    R2                              ; 5500   000A
        CMP     G_0180, R2                      ; 5501   0342 0180
        BLT     L_54F7                          ; 5503   0225 000D
        PULR    R7                              ; 5505   02B7

L_5506:
        PSHR    R5                              ; 5506   0275
        PSHR    R0                              ; 5507   0270
        PSHR    R4                              ; 5508   0274
        MVII    #$0002, R0                      ; 5509   02B8 0002
L_550B:
        MVII    #$016E, R4                      ; 550B   02BC 016E
        ADDR    R2,     R4                      ; 550D   00D4
        MVO@    R0,     R4                      ; 550E   0260
        MVII    #$0179, R4                      ; 550F   02BC 0179
        ADDR    R2,     R4                      ; 5511   00D4
        CLRR    R0                              ; 5512   01C0
        MVO@    R0,     R4                      ; 5513   0260

        JSR     R5,     L_D181                  ; 5514   0004 01D0 0181

        PULR    R2                              ; 5517   02B2
        PULR    R0                              ; 5518   02B0

        JSR     R5,     L_5573                  ; 5519   0004 0154 0173

        PULR    R7                              ; 551C   02B7

L_551D:
        PSHR    R5                              ; 551D   0275
L_551E:
        MVII    #$0000, R0                      ; 551E   02B8 0000
        MVI     G_0173, R1                      ; 5520   0281 0173
        ANDI    #$0007, R1                      ; 5522   03B9 0007
        CMPR    R2,     R1                      ; 5524   0151
        BEQ     L_5531                          ; 5525   0204 000A

        MVI     G_0173, R1                      ; 5527   0281 0173
        ANDI    #$0038, R1                      ; 5529   03B9 0038
        SLR     R1,     2                       ; 552B   0065
        SLR     R1,     1                       ; 552C   0061
        CMPR    R2,     R1                      ; 552D   0151
        BNEQ    L_553B                          ; 552E   020C 000B

        INCR    R0                              ; 5530   0008
L_5531:
        MVI     G_0173, R1                      ; 5531   0281 0173
        ANDI    #$0080, R1                      ; 5533   03B9 0080
        BNEQ    L_554D                          ; 5535   020C 0016

        ADDI    #$0002, R0                      ; 5537   02F8 0002
        B       L_554D                          ; 5539   0200 0012

L_553B:
        MVII    #$0008, R0                      ; 553B   02B8 0008
        MVI     G_0174, R1                      ; 553D   0281 0174
        ANDI    #$0007, R1                      ; 553F   03B9 0007
        CMPR    R2,     R1                      ; 5541   0151
        BEQ     L_5545                          ; 5542   0204 0001

        INCR    R0                              ; 5544   0008
L_5545:
        MVI     G_0174, R1                      ; 5545   0281 0174
        ANDI    #$0080, R1                      ; 5547   03B9 0080
        BNEQ    L_554D                          ; 5549   020C 0002

        ADDI    #$0002, R0                      ; 554B   02F8 0002
L_554D:
        MVI     G_01D4, R1                      ; 554D   0281 01D4
        TSTR    R1                              ; 554F   0089
        BEQ     L_5554                          ; 5550   0204 0002

        ADDI    #$0004, R0                      ; 5552   02F8 0004

L_5554:
        JSR     R5,     L_53DA                  ; 5554   0004 0150 03DA

        PULR    R7                              ; 5557   02B7

L_5558:
        MOVR    R1,     R4                      ; 5558   008C

        JSR     R5,     L_5564                  ; 5559   0004 0154 0164

        SDBD                                    ; 555C   0001
        MVII    #$5158, R3                      ; 555D   02BB 0058 0051

        JSR     R5,     L_D0C9                  ; 5560   0004 01D0 00C9

        PULR    R7                              ; 5563   02B7

L_5564:
        ADDI    #$0004, R4                      ; 5564   02FC 0004
        CLRR    R1                              ; 5566   01C9
        MVO@    R1,     R4                      ; 5567   0261
        MVO@    R1,     R4                      ; 5568   0261
        MVII    #$016E, R4                      ; 5569   02BC 016E
        ADDR    R2,     R4                      ; 556B   00D4
        MVO@    R1,     R4                      ; 556C   0261
        MOVR    R5,     R7                      ; 556D   00AF

L_556E:
        MVII    #$01A8, R3                      ; 556E   02BB 01A8
        ADDR    R0,     R3                      ; 5570   00C3
        MVI@    R3,     R2                      ; 5571   029A
        MOVR    R5,     R7                      ; 5572   00AF

L_5573:
        PSHR    R5                              ; 5573   0275
        PSHR    R0                              ; 5574   0270
        PSHR    R2                              ; 5575   0272

        JSR     R5,     .EXEC.766               ; 5576   0004 0114 0366
        JSR     R5,     L_556E                  ; 5579   0004 0154 016E
        JSR     R5,     L_645D                  ; 557C   0004 0164 005D

        MOVR    R0,     R3                      ; 557F   0083
        PSHR    R3                              ; 5580   0273
        SDBD                                    ; 5581   0001
        MVII    #$51BA, R3                      ; 5582   02BB 00BA 0051

        JSR     R5,     L_D0C9                  ; 5585   0004 01D0 00C9

        PULR    R3                              ; 5588   02B3
        PULR    R2                              ; 5589   02B2
        SDBD                                    ; 558A   0001
        SUBI    #$FFFF, R1                      ; 558B   0339 00FF 00FF
        MVI@    R1,     R0                      ; 558E   0288
        SWAP    R0,     1                       ; 558F   0040
        ANDI    #$00FF, R0                      ; 5590   03B8 00FF
        ADDR    R0,     R2                      ; 5592   00C2
        SLR     R2,     1                       ; 5593   0062
        PULR    R0                              ; 5594   02B0
        PSHR    R3                              ; 5595   0273
        SWAP    R2,     1                       ; 5596   0042
        XORR    R0,     R2                      ; 5597   01C2
        INCR    R1                              ; 5598   0009
        SWAP    R0,     1                       ; 5599   0040
        SDBD                                    ; 559A   0001
        MVII    #$2D00, R3                      ; 559B   02BB 0000 002D
        CMP@    R1,     R3                      ; 559E   034B
        BLE     L_55AE                          ; 559F   0206 000D

        CMP@    R1,     R0                      ; 55A1   0348
        BGE     L_55B6                          ; 55A2   020D 0012

        SUB@    R1,     R0                      ; 55A4   0308
        NEGR    R0                              ; 55A5   0020
        CMPI    #$0100, R0                      ; 55A6   0378 0100
        BLE     L_55B6                          ; 55A8   0206 000C

L_55AA:
        MVII    #$0200, R0                      ; 55AA   02B8 0200
        B       L_55B7                          ; 55AC   0200 0009

L_55AE:
        CMP@    R1,     R0                      ; 55AE   0348
        BLE     L_55AA                          ; 55AF   0226 0006

        SUB@    R1,     R0                      ; 55B1   0308
        CMPI    #$0100, R0                      ; 55B2   0378 0100
        BLE     L_55AA                          ; 55B4   0226 000B

L_55B6:
        CLRR    R0                              ; 55B6   01C0
L_55B7:
        SUBI    #$0003, R1                      ; 55B7   0339 0003
        MVI@    R1,     R3                      ; 55B9   028B
        SDBD                                    ; 55BA   0001
        ANDI    #$FDFF, R3                      ; 55BB   03BB 00FF 00FD
        XORR    R0,     R3                      ; 55BE   01C3
        MVO@    R3,     R1                      ; 55BF   024B
        PULR    R3                              ; 55C0   02B3

        JSR     R5,     .EXEC.9A1               ; 55C1   0004 0118 01A1

        ADDI    #$0004, R1                      ; 55C4   02F9 0004
        PSHR    R1                              ; 55C6   0271
        MVI@    R1,     R0                      ; 55C7   0288

        JSR     R5,     X_UNPK_BYTES            ; 55C8   0004 0114 0357

        ADDR    R0,     R0                      ; 55CB   00C0

        JSR     R5,     X_PACK_BYTES            ; 55CC   0004 0114 034F

        PULR    R1                              ; 55CF   02B1
        MVO@    R0,     R1                      ; 55D0   0248
        INCR    R1                              ; 55D1   0009
        MVII    #$01F0, R0                      ; 55D2   02B8 01F0
        MVO@    R0,     R1                      ; 55D4   0248
        PULR    R7                              ; 55D5   02B7

L_55D6:
        PSHR    R5                              ; 55D6   0275
        MVI     G_01C0, R1                      ; 55D7   0281 01C0
        SWAP    R1,     2                       ; 55D9   0045
        BPL     L_573F                          ; 55DA   0203 0163

        MVI     G_034C, R0                      ; 55DC   0280 034C
        SLR     R0,     2                       ; 55DE   0064
        MVII    #$0334, R2                      ; 55DF   02BA 0334
        MVI@    R2,     R1                      ; 55E1   0291
        SLL     R1,     2                       ; 55E2   004D
        ADDR    R0,     R1                      ; 55E3   00C1

        JSR     R5,     L_5766                  ; 55E4   0004 0154 0366
        BIDECLE $0280                           ; 55E7   0080 0002

        MVII    #$0281, R3                      ; 55E9   02BB 0281
        BC      L_55F8                          ; 55EB   0201 000B

        JSR     R5,     L_5766                  ; 55ED   0004 0154 0366
        BIDECLE $2A40                           ; 55F0   0040 002A

        SDBD                                    ; 55F2   0001
        MVII    #$2A3F, R3                      ; 55F3   02BB 003F 002A
        BNC     L_5624                          ; 55F6   0209 002C

L_55F8:
        MVII    #$0002, R4                      ; 55F8   02BC 0002
        MVO     R4,     G_0175                  ; 55FA   0244 0175
        SLL     R3,     2                       ; 55FC   004F
        MVO     R3,     G_034C                  ; 55FD   0243 034C
        SLR     R3,     2                       ; 55FF   0067

        JSR     R5,     L_57D8                  ; 5600   0004 0154 03D8
        JSR     R5,     L_57EA                  ; 5603   0004 0154 03EA

        MVI     G_0354, R0                      ; 5606   0280 0354
        SLR     R0,     2                       ; 5608   0064
        MVII    #$033C, R3                      ; 5609   02BB 033C
        MVI@    R3,     R1                      ; 560B   0299
        SLL     R1,     2                       ; 560C   004D
        SLL     R1,     1                       ; 560D   0049
        PSHR    R0                              ; 560E   0270
        MOVR    R2,     R0                      ; 560F   0090

        JSR     R5,     X_MPY                   ; 5610   0004 011C 01DC

        MOVR    R2,     R1                      ; 5613   0091
        MVII    #$000A, R2                      ; 5614   02BA 000A

        JSR     R5,     X_DIV                   ; 5616   0004 011C 01FB

        MOVR    R0,     R2                      ; 5619   0082
        PULR    R0                              ; 561A   02B0
        ADDR    R0,     R2                      ; 561B   00C2
        SLL     R2,     2                       ; 561C   004E
        MVO     R2,     G_0354                  ; 561D   0242 0354

        JSR     R5,     L_D84F                  ; 561F   0004 01D8 004F

        B       L_566A                          ; 5622   0200 0046

L_5624:
        PSHR    R0                              ; 5624   0270
        SLL     R1,     2                       ; 5625   004D
        MVO     R1,     G_034C                  ; 5626   0241 034C
        MVI     G_0354, R0                      ; 5628   0280 0354
        SLR     R0,     2                       ; 562A   0064
        MVII    #$033C, R2                      ; 562B   02BA 033C
        MVI@    R2,     R1                      ; 562D   0291
        SLL     R1,     2                       ; 562E   004D
        SLL     R1,     1                       ; 562F   0049
        ADDR    R0,     R1                      ; 5630   00C1

        JSR     R5,     L_5766                  ; 5631   0004 0154 0366
        BIDECLE $0000                           ; 5634   0000 0000

        MVII    #$0001, R3                      ; 5636   02BB 0001
        BC      L_5645                          ; 5638   0201 000B

        JSR     R5,     L_5766                  ; 563A   0004 0154 0366
        BIDECLE $3F80                           ; 563D   0080 003F

        SDBD                                    ; 563F   0001
        MVII    #$3F7F, R3                      ; 5640   02BB 007F 003F
        BNC     L_566F                          ; 5643   0209 002A

L_5645:
        MVII    #$0001, R4                      ; 5645   02BC 0001
        MVO     R4,     G_0175                  ; 5647   0244 0175
        SLL     R3,     2                       ; 5649   004F
        MVO     R3,     G_0354                  ; 564A   0243 0354
        SLR     R3,     2                       ; 564C   0067

        JSR     R5,     L_57D8                  ; 564D   0004 0154 03D8

        PULR    R3                              ; 5650   02B3

        JSR     R5,     L_57EA                  ; 5651   0004 0154 03EA

        MVII    #$0334, R4                      ; 5654   02BC 0334
        MVI@    R4,     R1                      ; 5656   02A1
        SLL     R1,     2                       ; 5657   004D
        MOVR    R2,     R0                      ; 5658   0090

        JSR     R5,     X_MPY                   ; 5659   0004 011C 01DC

        MOVR    R2,     R1                      ; 565C   0091
        MVII    #$000A, R2                      ; 565D   02BA 000A

        JSR     R5,     X_DIV                   ; 565F   0004 011C 01FB

        MOVR    R0,     R2                      ; 5662   0082
        ADDR    R3,     R2                      ; 5663   00DA
        SLL     R2,     2                       ; 5664   004E
        MVO     R2,     G_034C                  ; 5665   0242 034C

        JSR     R5,     L_D84F                  ; 5667   0004 01D8 004F
L_566A:
        JSR     R5,     L_5804                  ; 566A   0004 0158 0004

        B       L_56E9                          ; 566D   0200 007A

L_566F:
        CLRR    R4                              ; 566F   01E4
        MVO     R4,     G_0175                  ; 5670   0244 0175
        PULR    R2                              ; 5672   02B2
        SLL     R1,     2                       ; 5673   004D
        MVO     R1,     G_0354                  ; 5674   0241 0354
        MVI     G_0344, R1                      ; 5676   0281 0344
        SUB     G_01B1, R1                      ; 5678   0301 01B1
        MVO     R1,     G_0344                  ; 567A   0241 0344
        ADD     G_032C, R1                      ; 567C   02C1 032C
        MVO     R1,     G_032C                  ; 567E   0241 032C

        JSR     R5,     L_5804                  ; 5680   0004 0158 0004

        MVI     G_0354, R1                      ; 5683   0281 0354
        SLR     R1,     2                       ; 5685   0065
        MVII    #$033C, R2                      ; 5686   02BA 033C
        MVI     G_034C, R3                      ; 5688   0283 034C
        SWAP    R3,     1                       ; 568A   0043
        ANDI    #$00FF, R3                      ; 568B   03BB 00FF
        CMPI    #$001D, R3                      ; 568D   037B 001D
        BLT     L_56E9                          ; 568F   0205 0058

        CMPI    #$0097, R3                      ; 5691   037B 0097
        BGT     L_56E9                          ; 5693   020E 0054

        MVI     G_032C, R3                      ; 5695   0283 032C
        SDBD                                    ; 5697   0001
        CMPI    #$0600, R3                      ; 5698   037B 0000 0006
        BGT     L_56E9                          ; 569B   020E 004C

        JSR     R5,     L_5766                  ; 569D   0004 0154 0366
        BIDECLE $1F40                           ; 56A0   0040 001F

        BNC     L_56E9                          ; 56A2   0209 0045

L_56A4:
        PSHR    R0                              ; 56A4   0270
        DECLE   $0271,  $0004,  $01D4,  $0337   ; 56A5   0271 0004 01D4 0337

        PULR    R1                              ; 56A9   02B1
        PULR    R0                              ; 56AA   02B0
        MVII    #$0006, R4                      ; 56AB   02BC 0006
        CMPR    R1,     R0                      ; 56AD   0148
        SDBD                                    ; 56AE   0001
        MVII    #$1F41, R1                      ; 56AF   02B9 0041 001F
        BGE     L_56B8                          ; 56B2   020D 0004

        SDBD                                    ; 56B4   0001
        MVII    #$1F3F, R1                      ; 56B5   02B9 003F 001F
L_56B8:
        MVI     G_032C, R3                      ; 56B8   0283 032C
        SDBD                                    ; 56BA   0001
        CMPI    #$0580, R3                      ; 56BB   037B 0080 0005
        BLT     L_56E3                          ; 56BE   0205 0023

        MVI     G_016B, R0                      ; 56C0   0280 016B
        ANDI    #$0001, R0                      ; 56C2   03B8 0001
        MVO     R0,     G_01BB                  ; 56C4   0240 01BB
        MVI     G_033C, R0                      ; 56C6   0280 033C
        NEGR    R0                              ; 56C8   0020
        MVO     R0,     G_033C                  ; 56C9   0240 033C
        SDBD                                    ; 56CB   0001
        MVII    #$1F40, R1                      ; 56CC   02B9 0040 001F
        MVI     G_0344, R0                      ; 56CF   0280 0344
        TSTR    R0                              ; 56D1   0080
        BPL     L_56D5                          ; 56D2   0203 0001

        NEGR    R0                              ; 56D4   0020
L_56D5:
        MVO     R0,     G_0344                  ; 56D5   0240 0344
        ADDI    #$0002, R3                      ; 56D7   02FB 0002
        MVO     R3,     G_032C                  ; 56D9   0243 032C
        MVII    #$0007, R0                      ; 56DB   02B8 0007

        JSR     R5,     X_RAND2                 ; 56DD   0004 0114 029E

        ADDI    #$0006, R0                      ; 56E0   02F8 0006
        MOVR    R0,     R4                      ; 56E2   0084

L_56E3:
        JSR     R5,     L_5740                  ; 56E3   0004 0154 0340

        SLL     R1,     2                       ; 56E6   004D
        MVO     R1,     G_0354                  ; 56E7   0241 0354
L_56E9:
        MVI     G_0175, R2                      ; 56E9   0282 0175
        TSTR    R2                              ; 56EB   0092
        BEQ     L_5700                          ; 56EC   0204 0012

        SDBD                                    ; 56EE   0001
        MVII    #$1700, R1                      ; 56EF   02B9 0000 0017
        CMPI    #$0001, R2                      ; 56F2   037A 0001
        BNEQ    L_56FA                          ; 56F4   020C 0004

        SDBD                                    ; 56F6   0001
        MVII    #$0700, R1                      ; 56F7   02B9 0000 0007
L_56FA:
        CMP     G_032C, R1                      ; 56FA   0341 032C
        BGE     L_5700                          ; 56FC   020D 0002

        MVO     R1,     G_032C                  ; 56FE   0241 032C
L_5700:
        MVI     G_0354, R1                      ; 5700   0281 0354
        MVI     G_032C, R3                      ; 5702   0283 032C

        JSR     R5,     L_5781                  ; 5704   0004 0154 0381

        MVO     R3,     G_0320                  ; 5707   0243 0320
        MVI     G_0354, R1                      ; 5709   0281 0354
        MVI     G_034C, R3                      ; 570B   0283 034C

        JSR     R5,     L_57A4                  ; 570D   0004 0154 03A4

        MVO     R3,     G_031F                  ; 5710   0243 031F
        MVI     G_0107, R4                      ; 5712   0284 0107
        MVI     G_031F, R2                      ; 5714   0282 031F
        MVI     G_0320, R3                      ; 5716   0283 0320

        JSR     R5,     L_589C                  ; 5718   0004 0158 009C

        BC      L_5720                          ; 571B   0201 0003

        CLRR    R0                              ; 571D   01C0
        MVO     R0,     G_01BE                  ; 571E   0240 01BE
L_5720:
        MVI     G_01BE, R0                      ; 5720   0280 01BE
        SWAP    R0,     1                       ; 5722   0040
        SDBD                                    ; 5723   0001
        XORI    #$0840, R0                      ; 5724   03F8 0040 0008
        XOR     G_019A, R0                      ; 5727   03C0 019A

        JSR     R5,     L_D6EE                  ; 5729   0004 01D4 02EE

        BNC     L_5739                          ; 572C   0209 000B

        MVI     G_0354, R1                      ; 572E   0281 0354
        SWAP    R1,     1                       ; 5730   0041
        ANDI    #$00FF, R1                      ; 5731   03B9 00FF
        CMPI    #$007D, R1                      ; 5733   0379 007D
        BGT     L_5739                          ; 5735   020E 0002

        XORI    #$0020, R0                      ; 5737   03F8 0020
L_5739:
        MVO     R0,     G_031D                  ; 5739   0240 031D
        MVII    #$0010, R0                      ; 573B   02B8 0010
        MVO     R0,     G_01BE                  ; 573D   0240 01BE
L_573F:
        PULR    R7                              ; 573F   02B7

L_5740:
        PSHR    R5                              ; 5740   0275
        PSHR    R3                              ; 5741   0273
        PSHR    R0                              ; 5742   0270
        PSHR    R1                              ; 5743   0271
        MVII    #$0334, R3                      ; 5744   02BB 0334

L_5746:
        JSR     R5,     L_5753                  ; 5746   0004 0154 0353

        ADDI    #$0008, R3                      ; 5749   02FB 0008
        CMPI    #$0344, R3                      ; 574B   037B 0344
        BLE     L_5746                          ; 574D   0226 0008

        PULR    R1                              ; 574F   02B1
        PULR    R0                              ; 5750   02B0
        PULR    R3                              ; 5751   02B3
        PULR    R7                              ; 5752   02B7

L_5753:
        PSHR    R5                              ; 5753   0275
        MVI@    R3,     R0                      ; 5754   0298
        MOVR    R4,     R1                      ; 5755   00A1
        MVII    #$0010, R2                      ; 5756   02BA 0010

        JSR     R5,     L_57CB                  ; 5758   0004 0154 03CB

        TSTR    R0                              ; 575B   0080
        BEQ     L_5763                          ; 575C   0204 0005

        DECR    R0                              ; 575E   0010
        BPL     L_5763                          ; 575F   0203 0002

        ADDI    #$0002, R0                      ; 5761   02F8 0002
L_5763:
        MVO@    R0,     R3                      ; 5763   0258
        MOVR    R0,     R2                      ; 5764   0082
        PULR    R7                              ; 5765   02B7

L_5766:
        SDBD                                    ; 5766   0001
        MVI@    R5,     R3                      ; 5767   02AB
        PSHR    R5                              ; 5768   0275

        JSR     R5,     L_5778                  ; 5769   0004 0154 0378

        BNC     L_5777                          ; 576C   0209 0009

        MVI@    R2,     R5                      ; 576E   0295
        NEGR    R5                              ; 576F   0025
        MVO@    R5,     R2                      ; 5770   0255
        MVI     G_019D, R4                      ; 5771   0284 019D

        JSR     R5,     L_5740                  ; 5773   0004 0154 0340

        SETC                                    ; 5776   0007
L_5777:
        PULR    R7                              ; 5777   02B7

L_5778:
        PSHR    R0                              ; 5778   0270
        PSHR    R1                              ; 5779   0271
        SUBR    R3,     R0                      ; 577A   0118
        SUBR    R3,     R1                      ; 577B   0119
        XORR    R1,     R0                      ; 577C   01C8
        SLLC    R0,     1                       ; 577D   0058
        PULR    R1                              ; 577E   02B1
        PULR    R0                              ; 577F   02B0
        MOVR    R5,     R7                      ; 5780   00AF

L_5781:
        PSHR    R5                              ; 5781   0275
        SWAP    R1,     1                       ; 5782   0041
        ANDI    #$00FF, R1                      ; 5783   03B9 00FF
        SUBI    #$007D, R1                      ; 5785   0339 007D
        MVII    #$003D, R4                      ; 5787   02BC 003D
        MVII    #$002E, R0                      ; 5789   02B8 002E
        MVII    #$007D, R2                      ; 578B   02BA 007D

        JSR     R5,     L_57CB                  ; 578D   0004 0154 03CB

        ADDR    R0,     R4                      ; 5790   00C4
        SWAP    R3,     1                       ; 5791   0043
        ANDI    #$00FF, R3                      ; 5792   03BB 00FF
        MOVR    R3,     R0                      ; 5794   0098
        MVII    #$0199, R1                      ; 5795   02B9 0199
        MVII    #$01B9, R2                      ; 5797   02BA 01B9

        JSR     R5,     L_57CB                  ; 5799   0004 0154 03CB

        SUBR    R0,     R4                      ; 579C   0104
        MOVR    R4,     R3                      ; 579D   00A3
        SWAP    R3,     1                       ; 579E   0043
        SDBD                                    ; 579F   0001
        ANDI    #$FF00, R3                      ; 57A0   03BB 0000 00FF
        PULR    R7                              ; 57A3   02B7

L_57A4:
        PSHR    R5                              ; 57A4   0275
        SWAP    R1,     1                       ; 57A5   0041
        ANDI    #$00FF, R1                      ; 57A6   03B9 00FF
        SUBI    #$007D, R1                      ; 57A8   0339 007D
        SWAP    R3,     1                       ; 57AA   0043
        ANDI    #$00FF, R3                      ; 57AB   03BB 00FF
        SUBI    #$005A, R3                      ; 57AD   033B 005A
        MVII    #$0060, R4                      ; 57AF   02BC 0060
        SLL     R1,     1                       ; 57B1   0049
        MOVR    R1,     R0                      ; 57B2   0088
        MOVR    R3,     R1                      ; 57B3   0099
        SDBD                                    ; 57B4   0001
        MVII    #$0531, R2                      ; 57B5   02BA 0031 0005

        JSR     R5,     L_57CB                  ; 57B8   0004 0154 03CB

        ADDR    R0,     R4                      ; 57BB   00C4
        MVII    #$0158, R0                      ; 57BC   02B8 0158
        MVII    #$0191, R2                      ; 57BE   02BA 0191

        JSR     R5,     L_57CB                  ; 57C0   0004 0154 03CB

        ADDR    R0,     R4                      ; 57C3   00C4
        MOVR    R4,     R3                      ; 57C4   00A3
        SWAP    R3,     1                       ; 57C5   0043
        SDBD                                    ; 57C6   0001
        ANDI    #$FF00, R3                      ; 57C7   03BB 0000 00FF
        PULR    R7                              ; 57CA   02B7

L_57CB:
        PSHR    R5                              ; 57CB   0275
        PSHR    R1                              ; 57CC   0271
        PSHR    R2                              ; 57CD   0272

        JSR     R5,     X_MPY                   ; 57CE   0004 011C 01DC

        MOVR    R2,     R1                      ; 57D1   0091
        PULR    R2                              ; 57D2   02B2

        JSR     R5,     X_DIV                   ; 57D3   0004 011C 01FB

        PULR    R1                              ; 57D6   02B1
        PULR    R7                              ; 57D7   02B7

L_57D8:
        PSHR    R5                              ; 57D8   0275
        MOVR    R1,     R2                      ; 57D9   008A
        SUBR    R0,     R2                      ; 57DA   0102
        PSHR    R2                              ; 57DB   0272
        MOVR    R3,     R1                      ; 57DC   0099
        SUBR    R0,     R1                      ; 57DD   0101
        MVII    #$000A, R0                      ; 57DE   02B8 000A

        JSR     R5,     X_MPY                   ; 57E0   0004 011C 01DC

        MOVR    R2,     R1                      ; 57E3   0091
        PULR    R2                              ; 57E4   02B2

        JSR     R5,     X_DIV                   ; 57E5   0004 011C 01FB

        MOVR    R0,     R2                      ; 57E8   0082
        PULR    R7                              ; 57E9   02B7

L_57EA:
        PSHR    R5                              ; 57EA   0275
        MVI     G_01B1, R1                      ; 57EB   0281 01B1
        PSHR    R2                              ; 57ED   0272

        JSR     R5,     X_MPY                   ; 57EE   0004 011C 01DC

        MOVR    R2,     R1                      ; 57F1   0091
        MVII    #$000A, R2                      ; 57F2   02BA 000A

        JSR     R5,     X_DIV                   ; 57F4   0004 011C 01FB

        MOVR    R0,     R2                      ; 57F7   0082
        MVI     G_0344, R0                      ; 57F8   0280 0344
        SUBR    R2,     R0                      ; 57FA   0110
        MVO     R0,     G_0344                  ; 57FB   0240 0344
        PULR    R2                              ; 57FD   02B2
        MVI     G_032C, R1                      ; 57FE   0281 032C
        ADDR    R1,     R0                      ; 5800   00C8
        MVO     R0,     G_032C                  ; 5801   0240 032C
        PULR    R7                              ; 5803   02B7

L_5804:
        PSHR    R5                              ; 5804   0275
        PSHR    R0                              ; 5805   0270
        MVI     G_032C, R0                      ; 5806   0280 032C
        MOVR    R0,     R1                      ; 5808   0081
        ADD     G_0344, R1                      ; 5809   02C1 0344
        SUB     G_01B1, R1                      ; 580B   0301 01B1
        BPL     L_587D                          ; 580D   0203 006E

        MVI     G_0175, R0                      ; 580F   0280 0175
        TSTR    R0                              ; 5811   0080
        BNEQ    L_5868                          ; 5812   020C 0054

        CLRR    R3                              ; 5814   01DB

        JSR     R5,     L_57D8                  ; 5815   0004 0154 03D8

        SUBI    #$000A, R0                      ; 5818   0338 000A
        PSHR    R0                              ; 581A   0270
        MVI     G_0334, R1                      ; 581B   0281 0334
        SLL     R1,     2                       ; 581D   004D

        JSR     R5,     X_MPY                   ; 581E   0004 011C 01DC

        MOVR    R2,     R1                      ; 5821   0091
        MVII    #$000A, R2                      ; 5822   02BA 000A

        JSR     R5,     X_DIV                   ; 5824   0004 011C 01FB

        MVI     G_034C, R1                      ; 5827   0281 034C
        SLR     R1,     2                       ; 5829   0065
        ADDR    R1,     R0                      ; 582A   00C8
        SLL     R0,     2                       ; 582B   004C
        MVO     R0,     G_034C                  ; 582C   0240 034C
        PULR    R0                              ; 582E   02B0
        MVI     G_033C, R1                      ; 582F   0281 033C
        SLL     R1,     2                       ; 5831   004D
        SLL     R1,     1                       ; 5832   0049

        JSR     R5,     X_MPY                   ; 5833   0004 011C 01DC

        MOVR    R2,     R1                      ; 5836   0091
        MVII    #$000A, R2                      ; 5837   02BA 000A

        JSR     R5,     X_DIV                   ; 5839   0004 011C 01FB

        MVI     G_0354, R1                      ; 583C   0281 0354
        SLR     R1,     2                       ; 583E   0065
        ADDR    R0,     R1                      ; 583F   00C1
        MOVR    R1,     R0                      ; 5840   0088
        SLL     R0,     2                       ; 5841   004C
        MVO     R0,     G_0354                  ; 5842   0240 0354
        PULR    R0                              ; 5844   02B0
        PSHR    R0                              ; 5845   0270
        MVII    #$033C, R2                      ; 5846   02BA 033C
        MVI     G_034C, R3                      ; 5848   0283 034C
        SWAP    R3,     1                       ; 584A   0043
        ANDI    #$00FF, R3                      ; 584B   03BB 00FF
        CMPI    #$001D, R3                      ; 584D   037B 001D
        BLT     L_5868                          ; 584F   0205 0017

        CMPI    #$0097, R3                      ; 5851   037B 0097
        BGT     L_5868                          ; 5853   020E 0013

        MVI     G_032C, R3                      ; 5855   0283 032C
        SDBD                                    ; 5857   0001
        CMPI    #$0600, R3                      ; 5858   037B 0000 0006
        BGT     L_5868                          ; 585B   020E 000B

        JSR     R5,     L_5766                  ; 585D   0004 0154 0366
        BIDECLE $1F40                           ; 5860   0040 001F

        BNC     L_5868                          ; 5862   0209 0004

        PULR    R0                              ; 5864   02B0
        PULR    R5                              ; 5865   02B5
        B       L_56A4                          ; 5866   0220 01C3

L_5868:
        CLRR    R0                              ; 5868   01C0
        MVO     R0,     G_032C                  ; 5869   0240 032C

        JSR     R5,     L_D74C                  ; 586B   0004 01D4 034C

        MVI     G_019C, R4                      ; 586E   0284 019C

        JSR     R5,     L_5740                  ; 5870   0004 0154 0340

        NEGR    R2                              ; 5873   0022
        MVO     R2,     G_0344                  ; 5874   0242 0344
        CMP     G_01B1, R2                      ; 5876   0342 01B1
        BGT     L_587D                          ; 5878   020E 0003

        JSR     R5,     L_587F                  ; 587A   0004 0158 007F

L_587D:
        PULR    R0                              ; 587D   02B0
        PULR    R7                              ; 587E   02B7

L_587F:
        CLRR    R2                              ; 587F   01D2
        MVO     R2,     G_0199                  ; 5880   0242 0199
        MVO     R2,     G_01C0                  ; 5882   0242 01C0
        MVII    #$032C, R1                      ; 5884   02B9 032C
L_5886:
        MVO@    R2,     R1                      ; 5886   024A
        ADDI    #$0008, R1                      ; 5887   02F9 0008
        CMPI    #$034C, R1                      ; 5889   0379 034C
        BNEQ    L_5886                          ; 588B   022C 0006

        MVII    #$018D, R1                      ; 588D   02B9 018D
        ADDI    #$0002, R2                      ; 588F   02FA 0002
L_5891:
        MVI@    R1,     R0                      ; 5891   0288
        TSTR    R0                              ; 5892   0080
        BEQ     L_5896                          ; 5893   0204 0001

        MVO@    R2,     R1                      ; 5895   024A
L_5896:
        INCR    R1                              ; 5896   0009
        CMPI    #$0191, R1                      ; 5897   0379 0191
        BNEQ    L_5891                          ; 5899   022C 0009
        MOVR    R5,     R7                      ; 589B   00AF

L_589C:
        PSHR    R5                              ; 589C   0275
        PSHR    R2                              ; 589D   0272
        SDBD                                    ; 589E   0001
        CMPI    #$0700, R2                      ; 589F   037A 0000 0007
        BNC     L_58DE                          ; 58A2   0209 003A

        SDBD                                    ; 58A4   0001
        CMPI    #$A800, R2                      ; 58A5   037A 0000 00A8
        BC      L_58DE                          ; 58A8   0201 0034

        PSHR    R3                              ; 58AA   0273
        MVII    #$0001, R2                      ; 58AB   02BA 0001
L_58AD:
        PSHR    R2                              ; 58AD   0272

        JSR     R5,     L_D181                  ; 58AE   0004 01D0 0181

        MVII    #$0001, R3                      ; 58B1   02BB 0001
        TSTR    R0                              ; 58B3   0080
        BEQ     L_58BA                          ; 58B4   0204 0004

L_58B6:
        SLL     R3,     1                       ; 58B6   004B
        DECR    R0                              ; 58B7   0010
        BNEQ    L_58B6                          ; 58B8   022C 0003

L_58BA:
        ANDR    R4,     R3                      ; 58BA   01A3
        BEQ     L_58CB                          ; 58BB   0204 000E

        ADDI    #$0003, R1                      ; 58BD   02F9 0003
        MVI@    R1,     R0                      ; 58BF   0288

        JSR     R5,     L_D6A8                  ; 58C0   0004 01D4 02A8

        MVI     G_0354, R1                      ; 58C3   0281 0354
        SWAP    R1,     1                       ; 58C5   0041
        ANDI    #$00FF, R1                      ; 58C6   03B9 00FF
        CMPR    R1,     R2                      ; 58C8   014A
        BGT     L_58E4                          ; 58C9   020E 0019

L_58CB:
        PULR    R2                              ; 58CB   02B2
        INCR    R2                              ; 58CC   000A
        CMP     G_0180, R2                      ; 58CD   0342 0180
        BLT     L_58AD                          ; 58CF   0225 0023

        PULR    R3                              ; 58D1   02B3
        SDBD                                    ; 58D2   0001
        CMPI    #$0700, R3                      ; 58D3   037B 0000 0007
        BLT     L_58DE                          ; 58D6   0205 0006

        SDBD                                    ; 58D8   0001
        CMPI    #$6800, R3                      ; 58D9   037B 0000 0068
        BLT     L_58E1                          ; 58DC   0205 0003

L_58DE:
        CLRC                                    ; 58DE   0006
        B       L_58E7                          ; 58DF   0200 0006

L_58E1:
        SETC                                    ; 58E1   0007
        B       L_58E7                          ; 58E2   0200 0003

L_58E4:
        PULR    R2                              ; 58E4   02B2
        CLRC                                    ; 58E5   0006
        PULR    R3                              ; 58E6   02B3
L_58E7:
        PULR    R2                              ; 58E7   02B2
        PULR    R7                              ; 58E8   02B7

L_58E9:
        PSHR    R5                              ; 58E9   0275
        SDBD                                    ; 58EA   0001
        MVII    #$501C, R1                      ; 58EB   02B9 001C 0050

        JSR     R5,     X_TIMER_STOP            ; 58EE   0004 0118 0038

        SDBD                                    ; 58F1   0001
        MVII    #$5020, R1                      ; 58F2   02B9 0020 0050

        JSR     R5,     X_TIMER_STOP            ; 58F5   0004 0118 0038

        MVI     G_0102, R0                      ; 58F8   0280 0102
L_58FA:
        CMP     G_0102, R0                      ; 58FA   0340 0102
        BEQ     L_58FA                          ; 58FC   0224 0003

        CLRR    R0                              ; 58FE   01C0
        MVO     R0,     G_01A6                  ; 58FF   0240 01A6
        MVI     .ISRVEC.0,R0                    ; 5901   0280 0100
        MVO     R0,     G_01A4                  ; 5903   0240 01A4
        MVI     .ISRVEC.1,R0                    ; 5905   0280 0101
        MVO     R0,     G_01A5                  ; 5907   0240 01A5
        MVII    #$0091, R0                      ; 5909   02B8 0091
        MVII    #$00E9, R1                      ; 590B   02B9 00E9
        MVO     R0,     .ISRVEC.0               ; 590D   0240 0100
        MVO     R1,     .ISRVEC.1               ; 590F   0241 0101
L_5911:
        MVI     G_01A6, R0                      ; 5911   0280 01A6
        TSTR    R0                              ; 5913   0080
        BEQ     L_5911                          ; 5914   0224 0004

        MVII    #$0007, R1                      ; 5916   02B9 0007
        MVII    #$031D, R2                      ; 5918   02BA 031D
        MVII    #$0180, R3                      ; 591A   02BB 0180
L_591C:
        ADDI    #$0001, R2                      ; 591C   02FA 0001
        MVI@    R2,     R0                      ; 591E   0290
        ADDI    #$0004, R2                      ; 591F   02FA 0004
        MVO@    R3,     R2                      ; 5921   0253
        ADDI    #$0002, R2                      ; 5922   02FA 0002
        MVO@    R0,     R2                      ; 5924   0250
        ADDI    #$0001, R2                      ; 5925   02FA 0001
        DECR    R1                              ; 5927   0011
        BNEQ    L_591C                          ; 5928   022C 000D

        SDBD                                    ; 592A   0001
        MVII    #$EC8F, R0                      ; 592B   02B8 008F 00EC
        MVII    #$031E, R1                      ; 592E   02B9 031E
        MVO@    R0,     R1                      ; 5930   0248
        ADDI    #$0008, R1                      ; 5931   02F9 0008
        SDBD                                    ; 5933   0001
        MVII    #$EC96, R0                      ; 5934   02B8 0096 00EC
        MVO@    R0,     R1                      ; 5937   0248
        ADDI    #$0008, R1                      ; 5938   02F9 0008
        SDBD                                    ; 593A   0001
        MVII    #$EC9D, R0                      ; 593B   02B8 009D 00EC
        MVO@    R0,     R1                      ; 593E   0248
        ADDI    #$0008, R1                      ; 593F   02F9 0008
        SDBD                                    ; 5941   0001
        MVII    #$ECA4, R0                      ; 5942   02B8 00A4 00EC
        MVO@    R0,     R1                      ; 5945   0248
        ADDI    #$0008, R1                      ; 5946   02F9 0008
        SDBD                                    ; 5948   0001
        MVII    #$ECAB, R0                      ; 5949   02B8 00AB 00EC
        MVO@    R0,     R1                      ; 594C   0248
        ADDI    #$0008, R1                      ; 594D   02F9 0008
        SDBD                                    ; 594F   0001
        MVII    #$ECB2, R0                      ; 5950   02B8 00B2 00EC
        MVO@    R0,     R1                      ; 5953   0248
        ADDI    #$0008, R1                      ; 5954   02F9 0008
        SDBD                                    ; 5956   0001
        MVII    #$ECB9, R0                      ; 5957   02B8 00B9 00EC
        MVO@    R0,     R1                      ; 595A   0248
        CLRR    R2                              ; 595B   01D2
        MVO     R2,     G_01C0                  ; 595C   0242 01C0
        MVO     R2,     G_031F                  ; 595E   0242 031F
        MVO     R2,     G_0320                  ; 5960   0242 0320
        MVII    #$0008, R2                      ; 5962   02BA 0008

        JSR     R5,     L_5A6D                  ; 5964   0004 0158 026D

        MVII    #$031F, R1                      ; 5967   02B9 031F
        MVI@    R1,     R0                      ; 5969   0288
        SWAP    R0,     1                       ; 596A   0040
        ANDI    #$00FF, R0                      ; 596B   03B8 00FF
        SDBD                                    ; 596D   0001
        MVII    #$7C00, R2                      ; 596E   02BA 0000 007C
        XORR    R2,     R0                      ; 5971   01D0
        MVO@    R0,     R1                      ; 5972   0248
        INCR    R1                              ; 5973   0009
        MVI@    R1,     R0                      ; 5974   0288
        SWAP    R0,     1                       ; 5975   0040
        ANDI    #$00FF, R0                      ; 5976   03B8 00FF
        SDBD                                    ; 5978   0001
        MVII    #$4E00, R2                      ; 5979   02BA 0000 004E
        XORR    R2,     R0                      ; 597C   01D0
        MVO@    R0,     R1                      ; 597D   0248
        MVII    #$034F, R1                      ; 597E   02B9 034F
        MVI@    R1,     R0                      ; 5980   0288
        SWAP    R0,     1                       ; 5981   0040
        ANDI    #$00FF, R0                      ; 5982   03B8 00FF
        SDBD                                    ; 5984   0001
        MVII    #$8B00, R2                      ; 5985   02BA 0000 008B
        XORR    R2,     R0                      ; 5988   01D0
        MVO@    R0,     R1                      ; 5989   0248
        INCR    R1                              ; 598A   0009
        MVI@    R1,     R0                      ; 598B   0288
        SWAP    R0,     1                       ; 598C   0040
        ANDI    #$00FF, R0                      ; 598D   03B8 00FF
        SDBD                                    ; 598F   0001
        MVII    #$5000, R2                      ; 5990   02BA 0000 0050
        XORR    R2,     R0                      ; 5993   01D0
        MVO@    R0,     R1                      ; 5994   0248
        MVII    #$031D, R1                      ; 5995   02B9 031D
        MVI@    R1,     R0                      ; 5997   0288
        MVO     R0,     G_0318                  ; 5998   0240 0318
        MVII    #$034D, R1                      ; 599A   02B9 034D
        MVI@    R1,     R0                      ; 599C   0288
        MVO     R0,     G_0317                  ; 599D   0240 0317
        MVII    #$0232, R4                      ; 599F   02BC 0232
        MVII    #$01CA, R3                      ; 59A1   02BB 01CA

        JSR     R5,     L_5A4E                  ; 59A3   0004 0158 024E

        MVII    #$025A, R4                      ; 59A6   02BC 025A

        JSR     R5,     L_5A4E                  ; 59A8   0004 0158 024E

        MVI     G_01D5, R2                      ; 59AB   0282 01D5
        CMPI    #$0001, R2                      ; 59AD   037A 0001
        BEQ     L_59BB                          ; 59AF   0204 000A

        MVII    #$0001, R2                      ; 59B1   02BA 0001

L_59B3:
        JSR     R5,     L_5A2F                  ; 59B3   0004 0158 022F

        INCR    R2                              ; 59B6   000A
        CMP     G_01D5, R2                      ; 59B7   0342 01D5
        BLT     L_59B3                          ; 59B9   0225 0007

L_59BB:
        MVII    #$0238, R4                      ; 59BB   02BC 0238
        MVI     G_01D0, R0                      ; 59BD   0280 01D0
        MVII    #$0001, R1                      ; 59BF   02B9 0001
        MVII    #$0007, R3                      ; 59C1   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 59C3   0004 0118 00C5

        ADDI    #$0028, R4                      ; 59C6   02FC 0028
        MVI     G_01D1, R0                      ; 59C8   0280 01D1

        JSR     R5,     X_PRNUM_RGT             ; 59CA   0004 0118 00C5

        MVI     G_01D2, R0                      ; 59CD   0280 01D2
        MVII    #$0001, R1                      ; 59CF   02B9 0001
        MVII    #$0007, R3                      ; 59D1   02BB 0007
        MVII    #$0235, R4                      ; 59D3   02BC 0235

        JSR     R5,     X_PRNUM_RGT             ; 59D5   0004 0118 00C5

        MVI     G_01D3, R0                      ; 59D8   0280 01D3
        MVII    #$0001, R1                      ; 59DA   02B9 0001
        MVII    #$0007, R3                      ; 59DC   02BB 0007
        MVII    #$025D, R4                      ; 59DE   02BC 025D

        JSR     R5,     X_PRNUM_RGT             ; 59E0   0004 0118 00C5

        CLRR    R2                              ; 59E3   01D2
        MVI     G_01D2, R0                      ; 59E4   0280 01D2
        MVI     G_01D3, R1                      ; 59E6   0281 01D3
        ADDR    R0,     R2                      ; 59E8   00C2
        ADDR    R1,     R2                      ; 59E9   00CA
        CMPI    #$0005, R2                      ; 59EA   037A 0005
        BEQ     L_5A05                          ; 59EC   0204 0017

        SUB     G_01D2, R1                      ; 59EE   0301 01D2
        CMPI    #$0003, R1                      ; 59F0   0379 0003
        BEQ     L_5A0C                          ; 59F2   0204 0018

        SUB     G_01D3, R0                      ; 59F4   0300 01D3
        CMPI    #$0003, R0                      ; 59F6   0378 0003
        BEQ     L_5A08                          ; 59F8   0204 000E

L_59FA:
        SDBD                                    ; 59FA   0001
        MVII    #$502C, R1                      ; 59FB   02B9 002C 0050

        JSR     R5,     X_TIMER_START           ; 59FE   0004 0118 0044
        JSR     R5,     .EXEC.81E               ; 5A01   0004 0118 001E

        PULR    R7                              ; 5A04   02B7

L_5A05:
        CMPR    R0,     R1                      ; 5A05   0141
        BGT     L_5A0C                          ; 5A06   020E 0004

L_5A08:
        MVII    #$01CA, R3                      ; 5A08   02BB 01CA
        B       L_5A0E                          ; 5A0A   0200 0002

L_5A0C:
        MVII    #$01CC, R3                      ; 5A0C   02BB 01CC
L_5A0E:
        MVII    #$031D, R1                      ; 5A0E   02B9 031D

        JSR     R5,     L_5A1C                  ; 5A10   0004 0158 021C

        BEQ     L_59FA                          ; 5A13   0224 001A

        MVII    #$034D, R1                      ; 5A15   02B9 034D

        JSR     R5,     L_5A1C                  ; 5A17   0004 0158 021C

        B       L_59FA                          ; 5A1A   0220 0021

L_5A1C:
        PSHR    R5                              ; 5A1C   0275
        MVI@    R3,     R2                      ; 5A1D   029A
        ANDI    #$0017, R2                      ; 5A1E   03BA 0017
        SDBD                                    ; 5A20   0001
        MVII    #$10C0, R0                      ; 5A21   02B8 00C0 0010
        XORR    R2,     R0                      ; 5A24   01D0
        MVO@    R0,     R1                      ; 5A25   0248
        MVI@    R3,     R2                      ; 5A26   029A
        INCR    R3                              ; 5A27   000B
        MVI@    R3,     R0                      ; 5A28   0298
        CMPR    R2,     R0                      ; 5A29   0150
        PULR    R7                              ; 5A2A   02B7

        ADCR    R2                              ; 5A2B   002A
        ADCR    R4                              ; 5A2C   002C
        ADCR    R6                              ; 5A2D   002E
        GSWD    R0                              ; 5A2E   0030
L_5A2F:
        PSHR    R5                              ; 5A2F   0275
        PSHR    R2                              ; 5A30   0272
        SDBD                                    ; 5A31   0001
        MVII    #$5A2A, R3                      ; 5A32   02BB 002A 005A
        ADDR    R2,     R3                      ; 5A35   00D3
        MVI@    R3,     R4                      ; 5A36   029C
        ADDI    #$0200, R4                      ; 5A37   02FC 0200
        DECR    R2                              ; 5A39   0012
        SLL     R2,     1                       ; 5A3A   004A
        ADDI    #$01D8, R2                      ; 5A3B   02FA 01D8
        MVI@    R2,     R0                      ; 5A3D   0290
        MVII    #$0001, R1                      ; 5A3E   02B9 0001
        MVII    #$0007, R3                      ; 5A40   02BB 0007

        JSR     R5,     X_PRNUM_RGT             ; 5A42   0004 0118 00C5

        ADDI    #$0028, R4                      ; 5A45   02FC 0028
        INCR    R2                              ; 5A47   000A
        MVI@    R2,     R0                      ; 5A48   0290

        JSR     R5,     X_PRNUM_RGT             ; 5A49   0004 0118 00C5

        PULR    R2                              ; 5A4C   02B2
        PULR    R7                              ; 5A4D   02B7

L_5A4E:
        PSHR    R5                              ; 5A4E   0275

        JSR     R5,     L_5A56                  ; 5A4F   0004 0158 0256
        JSR     R5,     L_5A56                  ; 5A52   0004 0158 0256

        PULR    R7                              ; 5A55   02B7

L_5A56:
        MVI@    R3,     R2                      ; 5A56   029A
        ANDI    #$0010, R2                      ; 5A57   03BA 0010
        SAR     R2,     1                       ; 5A59   006A
        MVI@    R3,     R1                      ; 5A5A   0299
        ANDI    #$0004, R1                      ; 5A5B   03B9 0004
        SLL     R1,     2                       ; 5A5D   004D
        XORR    R1,     R2                      ; 5A5E   01CA
        MVI@    R3,     R1                      ; 5A5F   0299
        ANDI    #$0003, R1                      ; 5A60   03B9 0003
        XORR    R1,     R2                      ; 5A62   01CA
        SWAP    R2,     1                       ; 5A63   0042
        SLL     R2,     1                       ; 5A64   004A
        SDBD                                    ; 5A65   0001
        MVII    #$0848, R0                      ; 5A66   02B8 0048 0008
        ADDR    R2,     R0                      ; 5A69   00D0
        MVO@    R0,     R4                      ; 5A6A   0260
        INCR    R3                              ; 5A6B   000B
        MOVR    R5,     R7                      ; 5A6C   00AF

L_5A6D:
        MVII    #$031D, R3                      ; 5A6D   02BB 031D
L_5A6F:
        MVI@    R3,     R0                      ; 5A6F   0298
        SDBD                                    ; 5A70   0001
        ANDI    #$EFFF, R0                      ; 5A71   03B8 00FF 00EF
        MVO@    R0,     R3                      ; 5A74   0258
        ADDI    #$0008, R3                      ; 5A75   02FB 0008
        DECR    R2                              ; 5A77   0012
        BNEQ    L_5A6F                          ; 5A78   022C 000A
        MOVR    R5,     R7                      ; 5A7A   00AF

L_5A7B:
        PSHR    R5                              ; 5A7B   0275
        MVII    #$0164, R1                      ; 5A7C   02B9 0164
        ADDR    R2,     R1                      ; 5A7E   00D1
        MVI@    R1,     R1                      ; 5A7F   0289
        ADDR    R1,     R1                      ; 5A80   00C9
        PULR    R7                              ; 5A81   02B7

L_5A82:
        PSHR    R5                              ; 5A82   0275
        MVII    #$033D, R1                      ; 5A83   02B9 033D
        MVI     G_016C, R0                      ; 5A85   0280 016C
        CMPR    R0,     R2                      ; 5A87   0142
        BEQ     L_5A8C                          ; 5A88   0204 0002

        MVII    #$0345, R1                      ; 5A8A   02B9 0345
L_5A8C:
        PULR    R7                              ; 5A8C   02B7

L_5A8D:
        PSHR    R5                              ; 5A8D   0275
        PSHR    R1                              ; 5A8E   0271
        PSHR    R0                              ; 5A8F   0270

        JSR     R5,     L_D181                  ; 5A90   0004 01D0 0181

        ADDI    #$0004, R1                      ; 5A93   02F9 0004
        PULR    R0                              ; 5A95   02B0
        MVO@    R0,     R1                      ; 5A96   0248
        PULR    R1                              ; 5A97   02B1
        PULR    R7                              ; 5A98   02B7

L_5A99:
        PSHR    R5                              ; 5A99   0275
        PSHR    R1                              ; 5A9A   0271
        PSHR    R0                              ; 5A9B   0270

        JSR     R5,     L_D181                  ; 5A9C   0004 01D0 0181

L_5A9F:
        ADDI    #$0005, R1                      ; 5A9F   02F9 0005
        PULR    R0                              ; 5AA1   02B0
        MVO@    R0,     R1                      ; 5AA2   0248
        PULR    R1                              ; 5AA3   02B1
        PULR    R7                              ; 5AA4   02B7

L_5AA5:
        PSHR    R5                              ; 5AA5   0275
        PSHR    R1                              ; 5AA6   0271
        PSHR    R0                              ; 5AA7   0270

        JSR     R5,     L_5A82                  ; 5AA8   0004 0158 0282

        B       L_5A9F                          ; 5AAB   0220 000D

L_5AAD:
        PSHR    R5                              ; 5AAD   0275

        JSR     R5,     L_D171                  ; 5AAE   0004 01D0 0171

        MVII    #$0200, R0                      ; 5AB1   02B8 0200
        BLE     L_5ABC                          ; 5AB3   0206 0007

        JSR     R5,     L_5AE8                  ; 5AB5   0004 0158 02E8
L_5AB8:
        JSR     R5,     L_5ACD                  ; 5AB8   0004 0158 02CD

        PULR    R7                              ; 5ABB   02B7

L_5ABC:
        JSR     R5,     L_5AFF                  ; 5ABC   0004 0158 02FF

        B       L_5AB8                          ; 5ABF   0220 0008

        PSHR    R5                              ; 5AC1   0275
        PSHR    R0                              ; 5AC2   0270
        PSHR    R1                              ; 5AC3   0271

        JSR     R5,     L_D181                  ; 5AC4   0004 01D0 0181

L_5AC7:
        ADDI    #$0001, R1                      ; 5AC7   02F9 0001
        MVO@    R3,     R1                      ; 5AC9   024B
        PULR    R1                              ; 5ACA   02B1
        PULR    R0                              ; 5ACB   02B0
        PULR    R7                              ; 5ACC   02B7

L_5ACD:
        PSHR    R5                              ; 5ACD   0275
        PSHR    R0                              ; 5ACE   0270
        PSHR    R1                              ; 5ACF   0271

        JSR     R5,     L_5A82                  ; 5AD0   0004 0158 0282

        B       L_5AC7                          ; 5AD3   0220 000D

L_5AD5:
        PSHR    R5                              ; 5AD5   0275
        PSHR    R1                              ; 5AD6   0271
        PSHR    R0                              ; 5AD7   0270

        JSR     R5,     L_D181                  ; 5AD8   0004 01D0 0181

L_5ADB:
        ADDI    #$0000, R1                      ; 5ADB   02F9 0000
        PULR    R0                              ; 5ADD   02B0
        PSHR    R3                              ; 5ADE   0273
        COMR    R0                              ; 5ADF   0018
        MVI@    R1,     R3                      ; 5AE0   028B
        ANDR    R0,     R3                      ; 5AE1   0183
        COMR    R0                              ; 5AE2   0018
        XORR    R0,     R3                      ; 5AE3   01C3
        MVO@    R3,     R1                      ; 5AE4   024B
        PULR    R3                              ; 5AE5   02B3
        PULR    R1                              ; 5AE6   02B1
        PULR    R7                              ; 5AE7   02B7

L_5AE8:
        PSHR    R5                              ; 5AE8   0275
        PSHR    R1                              ; 5AE9   0271
        PSHR    R0                              ; 5AEA   0270

        JSR     R5,     L_5A82                  ; 5AEB   0004 0158 0282

        B       L_5ADB                          ; 5AEE   0220 0014

        PSHR    R5                              ; 5AF0   0275
        PSHR    R1                              ; 5AF1   0271
        PSHR    R0                              ; 5AF2   0270

        JSR     R5,     L_D181                  ; 5AF3   0004 01D0 0181

L_5AF6:
        PULR    R0                              ; 5AF6   02B0
        PSHR    R3                              ; 5AF7   0273
        COMR    R0                              ; 5AF8   0018
        MVI@    R1,     R3                      ; 5AF9   028B
        ANDR    R0,     R3                      ; 5AFA   0183
        MVO@    R3,     R1                      ; 5AFB   024B
        PULR    R3                              ; 5AFC   02B3
        PULR    R1                              ; 5AFD   02B1
        PULR    R7                              ; 5AFE   02B7

L_5AFF:
        PSHR    R5                              ; 5AFF   0275
        PSHR    R1                              ; 5B00   0271
        PSHR    R0                              ; 5B01   0270

        JSR     R5,     L_5A82                  ; 5B02   0004 0158 0282

        B       L_5AF6                          ; 5B05   0220 0010

L_5B07:
        PSHR    R5                              ; 5B07   0275
        PSHR    R1                              ; 5B08   0271
        MVI     G_016E, R0                      ; 5B09   0280 016E
        MVII    #$0164, R1                      ; 5B0B   02B9 0164
        ADDR    R2,     R1                      ; 5B0D   00D1
        MVI@    R1,     R1                      ; 5B0E   0289
        CMPI    #$0004, R1                      ; 5B0F   0379 0004
        BEQ     L_5B4A                          ; 5B11   0204 0037

        CMPI    #$0005, R1                      ; 5B13   0379 0005
        BEQ     L_5B4A                          ; 5B15   0204 0033

        TSTR    R1                              ; 5B17   0089
        BEQ     L_5B29                          ; 5B18   0204 000F

        CMPI    #$0003, R1                      ; 5B1A   0379 0003
        BEQ     L_5B4E                          ; 5B1C   0204 0030

        PSHR    R2                              ; 5B1E   0272
        MVII    #$0007, R1                      ; 5B1F   02B9 0007
        MVII    #$0004, R2                      ; 5B21   02BA 0004

        JSR     R5,     L_57CB                  ; 5B23   0004 0154 03CB

        PULR    R2                              ; 5B26   02B2
        B       L_5B3F                          ; 5B27   0200 0016

L_5B29:
        MVII    #$0160, R1                      ; 5B29   02B9 0160
        ADDR    R2,     R1                      ; 5B2B   00D1
        MVI@    R1,     R1                      ; 5B2C   0289
        ANDI    #$0004, R1                      ; 5B2D   03B9 0004
        BEQ     L_5B3F                          ; 5B2F   0204 000E

        JSR     R5,     L_DCA3                  ; 5B31   0004 01DC 00A3

        BNEQ    L_5B3F                          ; 5B34   020C 0009

        PSHR    R2                              ; 5B36   0272
        MVII    #$0003, R1                      ; 5B37   02B9 0003
        MVII    #$0002, R2                      ; 5B39   02BA 0002

        JSR     R5,     L_57CB                  ; 5B3B   0004 0154 03CB

        PULR    R2                              ; 5B3E   02B2
L_5B3F:
        PULR    R1                              ; 5B3F   02B1
        TSTR    R0                              ; 5B40   0080
        CMPI    #$003F, R0                      ; 5B41   0378 003F
        BGT     L_5B46                          ; 5B43   020E 0001
L_5B45:
        PULR    R7                              ; 5B45   02B7

L_5B46:
        MVII    #$003F, R0                      ; 5B46   02B8 003F
        B       L_5B45                          ; 5B48   0220 0004

L_5B4A:
        MVI     G_01E4, R0                      ; 5B4A   0280 01E4
        B       L_5B3F                          ; 5B4C   0220 000E

L_5B4E:
        PSHR    R2                              ; 5B4E   0272
        MVII    #$0003, R1                      ; 5B4F   02B9 0003
        MVII    #$0004, R2                      ; 5B51   02BA 0004

        JSR     R5,     L_57CB                  ; 5B53   0004 0154 03CB

        PULR    R2                              ; 5B56   02B2
        B       L_5B29                          ; 5B57   0220 002F

L_5B59:
        PSHR    R5                              ; 5B59   0275
        PSHR    R3                              ; 5B5A   0273
        PSHR    R4                              ; 5B5B   0274
        PSHR    R1                              ; 5B5C   0271
        MOVR    R0,     R4                      ; 5B5D   0084

        JSR     R5,     L_5A7B                  ; 5B5E   0004 0158 027B

        SAR     R1,     1                       ; 5B61   0069
        BEQ     L_5B7F                          ; 5B62   0204 001B

        ADDI    #$0002, R4                      ; 5B64   02FC 0002
        DECR    R1                              ; 5B66   0011
        BEQ     L_5B7F                          ; 5B67   0204 0016

        ADDI    #$0002, R4                      ; 5B69   02FC 0002
        DECR    R1                              ; 5B6B   0011
        BEQ     L_5B7F                          ; 5B6C   0204 0011

        ADDI    #$0002, R4                      ; 5B6E   02FC 0002
        DECR    R1                              ; 5B70   0011
        BEQ     L_5B7F                          ; 5B71   0204 000C

        ADDI    #$0002, R4                      ; 5B73   02FC 0002
        DECR    R1                              ; 5B75   0011
        BEQ     L_5B7F                          ; 5B76   0204 0007

        ADDI    #$0002, R4                      ; 5B78   02FC 0002
        DECR    R1                              ; 5B7A   0011
        BEQ     L_5B7F                          ; 5B7B   0204 0002
L_5B7D:
        BNEQ    L_5B7D                          ; 5B7D   022C 0001

L_5B7F:
        SDBD                                    ; 5B7F   0001
        MVI@    R4,     R3                      ; 5B80   02A3

        JSR     R5,     L_D181                  ; 5B81   0004 01D0 0181

        ADDI    #$0005, R1                      ; 5B84   02F9 0005
        MVI@    R1,     R1                      ; 5B86   0289
        ANDI    #$000F, R1                      ; 5B87   03B9 000F
        ADDR    R1,     R3                      ; 5B89   00CB
        ADDR    R1,     R3                      ; 5B8A   00CB
        ADDR    R1,     R3                      ; 5B8B   00CB
        PULR    R1                              ; 5B8C   02B1
        ADDR    R1,     R3                      ; 5B8D   00CB
        MVI@    R3,     R0                      ; 5B8E   0298
        PULR    R4                              ; 5B8F   02B4
        PULR    R3                              ; 5B90   02B3
        PULR    R7                              ; 5B91   02B7

L_5B92:
        PSHR    R5                              ; 5B92   0275
        PSHR    R1                              ; 5B93   0271
        CLRR    R3                              ; 5B94   01DB
        MVI     G_016C, R1                      ; 5B95   0281 016C
        CMPR    R2,     R1                      ; 5B97   0151
        BEQ     L_5B9B                          ; 5B98   0204 0001

        INCR    R3                              ; 5B9A   000B
L_5B9B:
        PULR    R1                              ; 5B9B   02B1
        PULR    R7                              ; 5B9C   02B7

L_5B9D:
        PSHR    R5                              ; 5B9D   0275
        MOVR    R1,     R5                      ; 5B9E   008D
        CLRR    R3                              ; 5B9F   01DB
L_5BA0:
        INCR    R3                              ; 5BA0   000B
        MVII    #$0175, R1                      ; 5BA1   02B9 0175
        ADDR    R3,     R1                      ; 5BA3   00D9
        MVI@    R1,     R1                      ; 5BA4   0289
        CMPR    R1,     R2                      ; 5BA5   014A
        BNEQ    L_5BA0                          ; 5BA6   022C 0007

        MOVR    R5,     R1                      ; 5BA8   00A9
        PULR    R7                              ; 5BA9   02B7

L_5BAA:
        PSHR    R5                              ; 5BAA   0275
        PSHR    R1                              ; 5BAB   0271
        PSHR    R2                              ; 5BAC   0272
        SDBD                                    ; 5BAD   0001
        MVII    #$5BBB, R1                      ; 5BAE   02B9 00BB 005B
        ADD     G_01C8, R1                      ; 5BB1   02C1 01C8
        MVI@    R1,     R1                      ; 5BB3   0289
        MVII    #$0008, R2                      ; 5BB4   02BA 0008

        JSR     R5,     L_57CB                  ; 5BB6   0004 0154 03CB

        PULR    R2                              ; 5BB9   02B2
        PULR    R1                              ; 5BBA   02B1
        PULR    R7                              ; 5BBB   02B7

        INCR    R0                              ; 5BBC   0008
        INCR    R0                              ; 5BBD   0008
        INCR    R1                              ; 5BBE   0009
        INCR    R2                              ; 5BBF   000A
L_5BC0:
        PSHR    R5                              ; 5BC0   0275
        MVII    #$0200, R4                      ; 5BC1   02BC 0200
        MVII    #$00F0, R0                      ; 5BC3   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5BC5   0004 0114 0338

        MVII    #$0007, R3                      ; 5BC8   02BB 0007
        MVII    #$0219, R4                      ; 5BCA   02BC 0219

        JSR     R5,     X_PRINT_R5              ; 5BCC   0004 0118 007B
        STRING  "LOCATION ?"                    ; 5BCF  
        DECLE   $0000                           ; 5BD9   0000

        MVII    #$0007, R3                      ; 5BDA   02BB 0007
        MVII    #$0250, R4                      ; 5BDC   02BC 0250

        JSR     R5,     X_PRINT_R5              ; 5BDE   0004 0118 007B
        STRING  "FLUSHING MEADOW   1"           ; 5BE1  
        DECLE   $0000                           ; 5BF4   0000

        MVII    #$0007, R3                      ; 5BF5   02BB 0007
        MVII    #$028C, R4                      ; 5BF7   02BC 028C

        JSR     R5,     X_PRINT_R5              ; 5BF9   0004 0118 007B
        STRING  "ROLAND GARROS     2"           ; 5BFC  
        DECLE   $0000                           ; 5C0F   0000

        MVII    #$0007, R3                      ; 5C10   02BB 0007
        MVII    #$02C8, R4                      ; 5C12   02BC 02C8

        JSR     R5,     X_PRINT_R5              ; 5C14   0004 0118 007B
        STRING  "WIMBLEDON         3"           ; 5C17  
        DECLE   $0000                           ; 5C2A   0000

        PULR    R7                              ; 5C2B   02B7

L_5C2C:
        PSHR    R5                              ; 5C2C   0275
        MVI     G_0102, R0                      ; 5C2D   0280 0102
L_5C2F:
        CMP     G_0102, R0                      ; 5C2F   0340 0102
        BEQ     L_5C2F                          ; 5C31   0224 0003

        CLRR    R0                              ; 5C33   01C0
        MVO     R0,     G_01A6                  ; 5C34   0240 01A6
        MVI     .ISRVEC.0,R0                    ; 5C36   0280 0100
        MVO     R0,     G_01A4                  ; 5C38   0240 01A4
        MVI     .ISRVEC.1,R1                    ; 5C3A   0281 0101
        MVO     R1,     G_01A5                  ; 5C3C   0241 01A5
        MVII    #$00DA, R0                      ; 5C3E   02B8 00DA
        MVII    #$0062, R1                      ; 5C40   02B9 0062
        MVO     R0,     .ISRVEC.0               ; 5C42   0240 0100
        MVO     R1,     .ISRVEC.1               ; 5C44   0241 0101
L_5C46:
        MVI     G_01A6, R0                      ; 5C46   0280 01A6
        TSTR    R0                              ; 5C48   0080
        BEQ     L_5C46                          ; 5C49   0224 0004

        MVI     G_017E, R0                      ; 5C4B   0280 017E
        TSTR    R0                              ; 5C4D   0080
        BNEQ    L_5C7D                          ; 5C4E   020C 002D

        MVI     G_017F, R0                      ; 5C50   0280 017F
        TSTR    R0                              ; 5C52   0080
        BNEQ    L_5C7D                          ; 5C53   020C 0028

        MVII    #$0007, R1                      ; 5C55   02B9 0007
        MVII    #$031D, R2                      ; 5C57   02BA 031D
        CLRR    R3                              ; 5C59   01DB
L_5C5A:
        ADDI    #$0007, R2                      ; 5C5A   02FA 0007
        MVI@    R2,     R0                      ; 5C5C   0290
        MVO@    R3,     R2                      ; 5C5D   0253
        SUBI    #$0002, R2                      ; 5C5E   033A 0002
        MVO@    R3,     R2                      ; 5C60   0253
        SUBI    #$0004, R2                      ; 5C61   033A 0004
        MVO@    R0,     R2                      ; 5C63   0250
        ADDI    #$0007, R2                      ; 5C64   02FA 0007
        DECR    R1                              ; 5C66   0011
        BNEQ    L_5C5A                          ; 5C67   022C 000E

        MVII    #$031F, R1                      ; 5C69   02B9 031F

        JSR     R5,     L_5CA5                  ; 5C6B   0004 015C 00A5

        MVII    #$034F, R1                      ; 5C6E   02B9 034F

        JSR     R5,     L_5CA5                  ; 5C70   0004 015C 00A5

        MVI     G_0318, R0                      ; 5C73   0280 0318
        MVII    #$031D, R1                      ; 5C75   02B9 031D
        MVO@    R0,     R1                      ; 5C77   0248
        MVI     G_0317, R0                      ; 5C78   0280 0317
        MVII    #$034D, R1                      ; 5C7A   02B9 034D
        MVO@    R0,     R1                      ; 5C7C   0248

L_5C7D:
        JSR     R5,     L_5CB2                  ; 5C7D   0004 015C 00B2
        JSR     R5,     L_5D62                  ; 5C80   0004 015C 0162
        JSR     R5,     L_5D96                  ; 5C83   0004 015C 0196
        JSR     R5,     L_5DC6                  ; 5C86   0004 015C 01C6
        JSR     R5,     L_5DF3                  ; 5C89   0004 015C 01F3
        JSR     R5,     L_5E1B                  ; 5C8C   0004 015C 021B
        JSR     R5,     L_5E3A                  ; 5C8F   0004 015C 023A
        JSR     R5,     L_5E51                  ; 5C92   0004 015C 0251
        JSR     R5,     L_5E68                  ; 5C95   0004 015C 0268
        JSR     R5,     L_5E7F                  ; 5C98   0004 015C 027F
        JSR     R5,     L_5E8A                  ; 5C9B   0004 015C 028A
        JSR     R5,     L_5E97                  ; 5C9E   0004 015C 0297
        JSR     R5,     L_5EAB                  ; 5CA1   0004 015C 02AB

        PULR    R7                              ; 5CA4   02B7

L_5CA5:
        PSHR    R5                              ; 5CA5   0275
        MVI@    R1,     R0                      ; 5CA6   0288
        ANDI    #$00FF, R0                      ; 5CA7   03B8 00FF
        SWAP    R0,     1                       ; 5CA9   0040
        MVO@    R0,     R1                      ; 5CAA   0248
        INCR    R1                              ; 5CAB   0009
        MVI@    R1,     R0                      ; 5CAC   0288
        ANDI    #$00FF, R0                      ; 5CAD   03B8 00FF
        SWAP    R0,     1                       ; 5CAF   0040
        MVO@    R0,     R1                      ; 5CB0   0248
        PULR    R7                              ; 5CB1   02B7

L_5CB2:
        PSHR    R5                              ; 5CB2   0275
        MVII    #$0258, R4                      ; 5CB3   02BC 0258
        SDBD                                    ; 5CB5   0001
        MVII    #$0677, R1                      ; 5CB6   02B9 0077 0006
        MVII    #$0006, R0                      ; 5CB9   02B8 0006

        JSR     R5,     X_FILL_MEM              ; 5CBB   0004 0114 0341

        MVII    #$026E, R4                      ; 5CBE   02BC 026E
        SDBD                                    ; 5CC0   0001
        MVII    #$060F, R1                      ; 5CC1   02B9 000F 0006
        MVO@    R1,     R4                      ; 5CC4   0261
        ADDI    #$0027, R4                      ; 5CC5   02FC 0027
        MVO@    R1,     R4                      ; 5CC7   0261
        ADDI    #$0013, R4                      ; 5CC8   02FC 0013
        MVO@    R1,     R4                      ; 5CCA   0261
        MVII    #$02BA, R4                      ; 5CCB   02BC 02BA
        SDBD                                    ; 5CCD   0001
        MVII    #$0667, R1                      ; 5CCE   02B9 0067 0006
        MVII    #$000A, R0                      ; 5CD1   02B8 000A

        JSR     R5,     X_FILL_MEM              ; 5CD3   0004 0114 0341

        ADDI    #$000A, R4                      ; 5CD6   02FC 000A
        SDBD                                    ; 5CD8   0001
        MVII    #$067F, R1                      ; 5CD9   02B9 007F 0006
        MVII    #$000A, R0                      ; 5CDC   02B8 000A

        JSR     R5,     X_FILL_MEM              ; 5CDE   0004 0114 0341

        SDBD                                    ; 5CE1   0001
        MVII    #$5D06, R2                      ; 5CE2   02BA 0006 005D
        MVII    #$0241, R4                      ; 5CE5   02BC 0241
        MVII    #$0003, R3                      ; 5CE7   02BB 0003
L_5CE9:
        MVII    #$0006, R1                      ; 5CE9   02B9 0006

        JSR     R5,     L_5D3D                  ; 5CEB   0004 015C 013D

        DECR    R3                              ; 5CEE   0013
        BEQ     L_5CF5                          ; 5CEF   0204 0004

        ADDI    #$0008, R4                      ; 5CF1   02FC 0008
        B       L_5CE9                          ; 5CF3   0220 000B

L_5CF5:
        ADDI    #$0007, R4                      ; 5CF5   02FC 0007
        MVII    #$0005, R3                      ; 5CF7   02BB 0005
L_5CF9:
        MVII    #$0007, R1                      ; 5CF9   02B9 0007

        JSR     R5,     L_5D3D                  ; 5CFB   0004 015C 013D

        DECR    R3                              ; 5CFE   0013
        BEQ     L_5D05                          ; 5CFF   0204 0004

        ADDI    #$0006, R4                      ; 5D01   02FC 0006
        B       L_5CF9                          ; 5D03   0220 000B
L_5D05:
        PULR    R7                              ; 5D05   02B7

        DECLE   $003E,  $0040,  $0000,  $0000   ; 5D06   003E 0040 0000 0000
        DECLE   $0003,  $03E4,  $00A6,  $00E0   ; 5D0A   0003 03E4 00A6 00E0
        DECLE   $0008,  $0000,  $0009,  $014B   ; 5D0E   0008 0000 0009 014B
        DECLE   $018D,  $0000,  $0000,  $0000   ; 5D12   018D 0000 0000 0000
        DECLE   $0000,  $01CF,  $0211           ; 5D16   0000 01CF 0211

        MVO@    R3,     R2                      ; 5D19   0253
        PSHR    R3                              ; 5D1A   0273
        MVI@    R2,     R3                      ; 5D1B   0293
        PSHR    R3                              ; 5D1C   0273
        PSHR    R5                              ; 5D1D   0275
        ADD@    R2,     R7                      ; 5D1E   02D7

        DECLE   $003E,  $0300,  $0000,  $0000   ; 5D1F   003E 0300 0000 0000
        DECLE   $0000,  $0019,  $03E4,  $00A0   ; 5D23   0000 0019 03E4 00A0
        DECLE   $0040,  $0000,  $0000,  $0000   ; 5D27   0040 0000 0000 0000
        DECLE   $0003,  $000B,  $0186,  $0000   ; 5D2B   0003 000B 0186 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D2F   0000 0000 0000 0000
        DECLE   $014F,  $035C,  $0000,  $0000   ; 5D33   014F 035C 0000 0000
        DECLE   $0000,  $0000,  $0000,  $03BB   ; 5D37   0000 0000 0000 03BB
        DECLE   $0000,  $0000                   ; 5D3B   0000 0000
L_5D3D:
        MVI@    R2,     R0                      ; 5D3D   0290
        ANDI    #$03E0, R0                      ; 5D3E   03B8 03E0
        BNEQ    L_5D45                          ; 5D40   020C 0003

        INCR    R4                              ; 5D42   000C
        B       L_5D4D                          ; 5D43   0200 0008

L_5D45:
        SUBI    #$0020, R0                      ; 5D45   0338 0020
        SLR     R0,     2                       ; 5D47   0064
        SDBD                                    ; 5D48   0001
        ADDI    #$0807, R0                      ; 5D49   02F8 0007 0008
        MVO@    R0,     R4                      ; 5D4C   0260
L_5D4D:
        MVI@    R2,     R0                      ; 5D4D   0290
        ANDI    #$001F, R0                      ; 5D4E   03B8 001F
        BNEQ    L_5D55                          ; 5D50   020C 0003

        INCR    R4                              ; 5D52   000C
        B       L_5D5D                          ; 5D53   0200 0008

L_5D55:
        DECR    R0                              ; 5D55   0010
        SLL     R0,     2                       ; 5D56   004C
        SLL     R0,     1                       ; 5D57   0048
        SDBD                                    ; 5D58   0001
        ADDI    #$0807, R0                      ; 5D59   02F8 0007 0008
        MVO@    R0,     R4                      ; 5D5C   0260
L_5D5D:
        INCR    R2                              ; 5D5D   000A
        DECR    R1                              ; 5D5E   0011
        BNEQ    L_5D3D                          ; 5D5F   022C 0023
        MOVR    R5,     R7                      ; 5D61   00AF

L_5D62:
        PSHR    R5                              ; 5D62   0275
        MVII    #$0200, R4                      ; 5D63   02BC 0200
        SDBD                                    ; 5D65   0001
        MVII    #$0904, R0                      ; 5D66   02B8 0004 0009
        MVO@    R0,     R4                      ; 5D69   0260
        MVI     G_017E, R0                      ; 5D6A   0280 017E
        TSTR    R0                              ; 5D6C   0080
        BNEQ    L_5D95                          ; 5D6D   020C 0026

        SDBD                                    ; 5D6F   0001
        MVII    #$090C, R0                      ; 5D70   02B8 000C 0009
        MVO@    R0,     R4                      ; 5D73   0260
        MVO@    R0,     R4                      ; 5D74   0260
        SDBD                                    ; 5D75   0001
        MVII    #$0914, R0                      ; 5D76   02B8 0014 0009
        MVO@    R0,     R4                      ; 5D79   0260
        MVII    #$02F8, R1                      ; 5D7A   02B9 02F8
        MVII    #$0005, R0                      ; 5D7C   02B8 0005

        JSR     R5,     X_FILL_MEM              ; 5D7E   0004 0114 0341

        SDBD                                    ; 5D81   0001
        MVII    #$22F8, R0                      ; 5D82   02B8 00F8 0022
        MVO@    R0,     R4                      ; 5D85   0260
        MVII    #$0008, R0                      ; 5D86   02B8 0008

        JSR     R5,     X_FILL_MEM              ; 5D88   0004 0114 0341

        SDBD                                    ; 5D8B   0001
        MVII    #$28FC, R0                      ; 5D8C   02B8 00FC 0028
        MVO@    R0,     R4                      ; 5D8F   0260
        SDBD                                    ; 5D90   0001
        MVII    #$0924, R0                      ; 5D91   02B8 0024 0009
        MVO@    R0,     R4                      ; 5D94   0260
L_5D95:
        PULR    R7                              ; 5D95   02B7

L_5D96:
        PSHR    R5                              ; 5D96   0275
        MVII    #$0214, R4                      ; 5D97   02BC 0214
        SDBD                                    ; 5D99   0001
        MVII    #$090C, R0                      ; 5D9A   02B8 000C 0009
        MVO@    R0,     R4                      ; 5D9D   0260
        SDBD                                    ; 5D9E   0001
        MVII    #$0904, R0                      ; 5D9F   02B8 0004 0009
        MVO@    R0,     R4                      ; 5DA2   0260
        SDBD                                    ; 5DA3   0001
        MVII    #$0924, R0                      ; 5DA4   02B8 0024 0009
        MVO@    R0,     R4                      ; 5DA7   0260
        SDBD                                    ; 5DA8   0001
        MVII    #$092C, R0                      ; 5DA9   02B8 002C 0009
        MVO@    R0,     R4                      ; 5DAC   0260
        SDBD                                    ; 5DAD   0001
        MVII    #$2664, R0                      ; 5DAE   02B8 0064 0026
        MVO@    R0,     R4                      ; 5DB1   0260
        SDBD                                    ; 5DB2   0001
        MVII    #$0664, R1                      ; 5DB3   02B9 0064 0006
        MVII    #$000D, R0                      ; 5DB6   02B8 000D

        JSR     R5,     X_FILL_MEM              ; 5DB8   0004 0114 0341

        SDBD                                    ; 5DBB   0001
        MVII    #$2934, R0                      ; 5DBC   02B8 0034 0029
        MVO@    R0,     R4                      ; 5DBF   0260
        SDBD                                    ; 5DC0   0001
        MVII    #$090C, R0                      ; 5DC1   02B8 000C 0009
        MVO@    R0,     R4                      ; 5DC4   0260
        PULR    R7                              ; 5DC5   02B7

L_5DC6:
        PSHR    R5                              ; 5DC6   0275
        SDBD                                    ; 5DC7   0001
        MVII    #$090C, R0                      ; 5DC8   02B8 000C 0009
        MVO@    R0,     R4                      ; 5DCB   0260
        SDBD                                    ; 5DCC   0001
        MVII    #$0904, R0                      ; 5DCD   02B8 0004 0009
        MVO@    R0,     R4                      ; 5DD0   0260
        SDBD                                    ; 5DD1   0001
        MVII    #$093C, R0                      ; 5DD2   02B8 003C 0009
        MVO@    R0,     R4                      ; 5DD5   0260
        SDBD                                    ; 5DD6   0001
        MVII    #$245C, R0                      ; 5DD7   02B8 005C 0024
        MVO@    R0,     R4                      ; 5DDA   0260
        ADDI    #$0002, R4                      ; 5DDB   02FC 0002
        SDBD                                    ; 5DDD   0001
        MVII    #$067F, R1                      ; 5DDE   02B9 007F 0006
        MVII    #$000A, R0                      ; 5DE1   02B8 000A

        JSR     R5,     X_FILL_MEM              ; 5DE3   0004 0114 0341

        ADDI    #$0002, R4                      ; 5DE6   02FC 0002
        SDBD                                    ; 5DE8   0001
        MVII    #$0454, R0                      ; 5DE9   02B8 0054 0004
        MVO@    R0,     R4                      ; 5DEC   0260
        SDBD                                    ; 5DED   0001
        MVII    #$2944, R0                      ; 5DEE   02B8 0044 0029
        MVO@    R0,     R4                      ; 5DF1   0260
        PULR    R7                              ; 5DF2   02B7

L_5DF3:
        SDBD                                    ; 5DF3   0001
        MVII    #$0924, R0                      ; 5DF4   02B8 0024 0009
        MVO@    R0,     R4                      ; 5DF7   0260
        SDBD                                    ; 5DF8   0001
        MVII    #$090C, R0                      ; 5DF9   02B8 000C 0009
        MVO@    R0,     R4                      ; 5DFC   0260
        SDBD                                    ; 5DFD   0001
        MVII    #$094C, R0                      ; 5DFE   02B8 004C 0009
        MVO@    R0,     R4                      ; 5E01   0260
        SDBD                                    ; 5E02   0001
        MVII    #$247C, R0                      ; 5E03   02B8 007C 0024
        MVO@    R0,     R4                      ; 5E06   0260
        ADDI    #$0006, R4                      ; 5E07   02FC 0006
        SDBD                                    ; 5E09   0001
        MVII    #$091F, R0                      ; 5E0A   02B8 001F 0009
        MVO@    R0,     R4                      ; 5E0D   0260
        ADDI    #$0007, R4                      ; 5E0E   02FC 0007
        SDBD                                    ; 5E10   0001
        MVII    #$0474, R0                      ; 5E11   02B8 0074 0004
        MVO@    R0,     R4                      ; 5E14   0260
        SDBD                                    ; 5E15   0001
        MVII    #$28FC, R0                      ; 5E16   02B8 00FC 0028
        MVO@    R0,     R4                      ; 5E19   0260
        MOVR    R5,     R7                      ; 5E1A   00AF

L_5E1B:
        MVII    #$0082, R0                      ; 5E1B   02B8 0082
        MVO@    R0,     R4                      ; 5E1D   0260
        SDBD                                    ; 5E1E   0001
        MVII    #$0924, R0                      ; 5E1F   02B8 0024 0009
        MVO@    R0,     R4                      ; 5E22   0260
        SDBD                                    ; 5E23   0001
        MVII    #$092C, R0                      ; 5E24   02B8 002C 0009
        MVO@    R0,     R4                      ; 5E27   0260
        SDBD                                    ; 5E28   0001
        MVII    #$249C, R0                      ; 5E29   02B8 009C 0024
        MVO@    R0,     R4                      ; 5E2C   0260
        ADDI    #$000E, R4                      ; 5E2D   02FC 000E
        SDBD                                    ; 5E2F   0001
        MVII    #$0494, R0                      ; 5E30   02B8 0094 0004
        MVO@    R0,     R4                      ; 5E33   0260
        SDBD                                    ; 5E34   0001
        MVII    #$2934, R0                      ; 5E35   02B8 0034 0029
        MVO@    R0,     R4                      ; 5E38   0260
        MOVR    R5,     R7                      ; 5E39   00AF

L_5E3A:
        SDBD                                    ; 5E3A   0001
        MVII    #$090C, R0                      ; 5E3B   02B8 000C 0009
        MVO@    R0,     R4                      ; 5E3E   0260
        SDBD                                    ; 5E3F   0001
        MVII    #$093C, R0                      ; 5E40   02B8 003C 0009
        MVO@    R0,     R4                      ; 5E43   0260
        SDBD                                    ; 5E44   0001
        MVII    #$245C, R0                      ; 5E45   02B8 005C 0024
        MVO@    R0,     R4                      ; 5E48   0260
        ADDI    #$0010, R4                      ; 5E49   02FC 0010
        SDBD                                    ; 5E4B   0001
        MVII    #$0454, R0                      ; 5E4C   02B8 0054 0004
        MVO@    R0,     R4                      ; 5E4F   0260
        MOVR    R5,     R7                      ; 5E50   00AF

L_5E51:
        SDBD                                    ; 5E51   0001
        MVII    #$2924, R0                      ; 5E52   02B8 0024 0029
        MVO@    R0,     R4                      ; 5E55   0260
        SDBD                                    ; 5E56   0001
        MVII    #$094C, R0                      ; 5E57   02B8 004C 0009
        MVO@    R0,     R4                      ; 5E5A   0260
        SDBD                                    ; 5E5B   0001
        MVII    #$247C, R0                      ; 5E5C   02B8 007C 0024
        MVO@    R0,     R4                      ; 5E5F   0260
        ADDI    #$0010, R4                      ; 5E60   02FC 0010
        SDBD                                    ; 5E62   0001
        MVII    #$0474, R0                      ; 5E63   02B8 0074 0004
        MVO@    R0,     R4                      ; 5E66   0260
        MOVR    R5,     R7                      ; 5E67   00AF

L_5E68:
        SDBD                                    ; 5E68   0001
        MVII    #$2082, R0                      ; 5E69   02B8 0082 0020
        MVO@    R0,     R4                      ; 5E6C   0260
        SDBD                                    ; 5E6D   0001
        MVII    #$092C, R0                      ; 5E6E   02B8 002C 0009
        MVO@    R0,     R4                      ; 5E71   0260
        SDBD                                    ; 5E72   0001
        MVII    #$249C, R0                      ; 5E73   02B8 009C 0024
        MVO@    R0,     R4                      ; 5E76   0260
        ADDI    #$0010, R4                      ; 5E77   02FC 0010
        SDBD                                    ; 5E79   0001
        MVII    #$0494, R0                      ; 5E7A   02B8 0094 0004
        MVO@    R0,     R4                      ; 5E7D   0260
        MOVR    R5,     R7                      ; 5E7E   00AF

L_5E7F:
        SDBD                                    ; 5E7F   0001
        MVII    #$293C, R0                      ; 5E80   02B8 003C 0029
        MVO@    R0,     R4                      ; 5E83   0260
        SDBD                                    ; 5E84   0001
        MVII    #$245C, R0                      ; 5E85   02B8 005C 0024
        MVO@    R0,     R4                      ; 5E88   0260
        MOVR    R5,     R7                      ; 5E89   00AF

L_5E8A:
        MVII    #$02B4, R4                      ; 5E8A   02BC 02B4
        SDBD                                    ; 5E8C   0001
        MVII    #$294C, R0                      ; 5E8D   02B8 004C 0029
        MVO@    R0,     R4                      ; 5E90   0260
        SDBD                                    ; 5E91   0001
        MVII    #$247C, R0                      ; 5E92   02B8 007C 0024
        MVO@    R0,     R4                      ; 5E95   0260
        MOVR    R5,     R7                      ; 5E96   00AF

L_5E97:
        MVII    #$02C8, R4                      ; 5E97   02BC 02C8
        SDBD                                    ; 5E99   0001
        MVII    #$292C, R0                      ; 5E9A   02B8 002C 0029
        MVO@    R0,     R4                      ; 5E9D   0260
        SDBD                                    ; 5E9E   0001
        MVII    #$249C, R0                      ; 5E9F   02B8 009C 0024
        MVO@    R0,     R4                      ; 5EA2   0260
        ADDI    #$0008, R4                      ; 5EA3   02FC 0008
        SDBD                                    ; 5EA5   0001
        MVII    #$0967, R0                      ; 5EA6   02B8 0067 0009
        MVO@    R0,     R4                      ; 5EA9   0260
        MOVR    R5,     R7                      ; 5EAA   00AF

L_5EAB:
        PSHR    R5                              ; 5EAB   0275
        MVII    #$02DC, R4                      ; 5EAC   02BC 02DC
        SDBD                                    ; 5EAE   0001
        MVII    #$095C, R0                      ; 5EAF   02B8 005C 0009
        MVO@    R0,     R4                      ; 5EB2   0260
        SDBD                                    ; 5EB3   0001
        MVII    #$067C, R1                      ; 5EB4   02B9 007C 0006
        MVII    #$0013, R0                      ; 5EB7   02B8 0013

        JSR     R5,     X_FILL_MEM              ; 5EB9   0004 0114 0341

        PULR    R7                              ; 5EBC   02B7

.GFX_LIST_5EBD:
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EBD  CART PIC #00
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5EC1  
        DECLE   $0040,  $0040,  $0040,  $0040   ; 5EC5  CART PIC #01
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5EC9  
        DECLE   $0002,  $0002,  $0002,  $0002   ; 5ECD  CART PIC #02
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5ED1  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ED5  CART PIC #03
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5ED9  
        DECLE   $0002,  $0002,  $0002,  $0002   ; 5EDD  CART PIC #04
        DECLE   $0004,  $0004,  $0004,  $0004   ; 5EE1  
        DECLE   $0000,  $0001,  $0001,  $0001   ; 5EE5  CART PIC #05
        DECLE   $0001,  $0001,  $0002,  $0002   ; 5EE9  
        DECLE   $0080,  $0000,  $0000,  $0000   ; 5EED  CART PIC #06
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5EF1  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EF5  CART PIC #07
        DECLE   $00FF,  $0001,  $0001,  $0001   ; 5EF9  
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5EFD  CART PIC #08
        DECLE   $00FF,  $0000,  $0000,  $0000   ; 5F01  
        DECLE   $0000,  $0080,  $0080,  $0080   ; 5F05  CART PIC #09
        DECLE   $0080,  $0080,  $0040,  $0040   ; 5F09  
        DECLE   $0040,  $0040,  $0040,  $0040   ; 5F0D  CART PIC #0A
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5F11  
        DECLE   $0008,  $0008,  $0008,  $0008   ; 5F15  CART PIC #0B
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5F19  
        DECLE   $0002,  $0002,  $0002,  $0004   ; 5F1D  CART PIC #0C
        DECLE   $0004,  $0004,  $0004,  $0004   ; 5F21  
        DECLE   $0040,  $0040,  $0040,  $0020   ; 5F25  CART PIC #0D
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5F29  
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5F2D  CART PIC #0E
        DECLE   $0008,  $0008,  $0008,  $0008   ; 5F31  
        DECLE   $000F,  $000A,  $000D,  $000A   ; 5F35  CART PIC #0F
        DECLE   $000D,  $000A,  $0000,  $0000   ; 5F39  
        DECLE   $00FF,  $00AA,  $0055,  $00AA   ; 5F3D  CART PIC #10
        DECLE   $0055,  $00AA,  $0040,  $0040   ; 5F41  
        DECLE   $00FF,  $00AA,  $0055,  $00AA   ; 5F45  CART PIC #11
        DECLE   $0055,  $00AA,  $0010,  $0010   ; 5F49  
        DECLE   $00FF,  $00AA,  $0055,  $00AA   ; 5F4D  CART PIC #12
        DECLE   $0055,  $00AA,  $0000,  $0000   ; 5F51  
        DECLE   $00FF,  $00AA,  $0055,  $00AA   ; 5F55  CART PIC #13
        DECLE   $0055,  $00AA,  $0001,  $0001   ; 5F59  
        DECLE   $00FF,  $00AA,  $0055,  $00AA   ; 5F5D  CART PIC #14
        DECLE   $0055,  $00AA,  $0008,  $0008   ; 5F61  
        DECLE   $00FF,  $00AA,  $0055,  $00AA   ; 5F65  CART PIC #15
        DECLE   $0055,  $00AA,  $0002,  $0002   ; 5F69  
        DECLE   $00F0,  $00B0,  $0050,  $00B0   ; 5F6D  CART PIC #16
        DECLE   $0050,  $00B0,  $0000,  $0000   ; 5F71  
        DECLE   $0010,  $0010,  $0020,  $0020   ; 5F75  CART PIC #17
        DECLE   $0020,  $0020,  $0020,  $0040   ; 5F79  
        DECLE   $0008,  $0008,  $0004,  $0004   ; 5F7D  CART PIC #18
        DECLE   $0004,  $0004,  $0004,  $0002   ; 5F81  
        DECLE   $0020,  $0020,  $0020,  $0020   ; 5F85  CART PIC #19
        DECLE   $0040,  $0040,  $0040,  $007F   ; 5F89  
        DECLE   $0004,  $0004,  $0004,  $0004   ; 5F8D  CART PIC #1A
        DECLE   $0002,  $0002,  $0002,  $00FE   ; 5F91  
        DECLE   $0002,  $0002,  $0002,  $0004   ; 5F95  CART PIC #1B
        DECLE   $0004,  $0004,  $0004,  $00FF   ; 5F99  
        DECLE   $0040,  $0040,  $0040,  $0020   ; 5F9D  CART PIC #1C
        DECLE   $0020,  $0020,  $0020,  $00FF   ; 5FA1  
        DECLE   $0080,  $0080,  $0080,  $0080   ; 5FA5  CART PIC #1D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FA9  
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5FAD  CART PIC #1E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FB1  
        DECLE   $00E1,  $00F1,  $00F0,  $00F0   ; 5FB5  CART PIC #1F
        DECLE   $00FB,  $00FB,  $00F8,  $00FC   ; 5FB9  
        DECLE   $0041,  $00B2,  $0030,  $0005   ; 5FBD  CART PIC #20
        DECLE   $004E,  $0006,  $00C8,  $00C1   ; 5FC1  
        DECLE   $0003,  $0063,  $0068,  $0001   ; 5FC5  CART PIC #21
        DECLE   $002C,  $000D,  $0032,  $0030   ; 5FC9  
        DECLE   $0067,  $006F,  $000F,  $000F   ; 5FCD  CART PIC #22
        DECLE   $005F,  $001F,  $001F,  $003F   ; 5FD1  
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5FD5  CART PIC #23
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD9  
        DECLE   $0096,  $0006,  $0000,  $00B0   ; 5FDD  CART PIC #24
        DECLE   $0032,  $0004,  $00C0,  $00C8   ; 5FE1  
        DECLE   $003F,  $003F,  $007F,  $007F   ; 5FE5  CART PIC #25
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5FE9  
        DECLE   $00FC,  $00FC,  $00FE,  $00FE   ; 5FED  CART PIC #26
        DECLE   $00FE,  $00FF,  $00FF,  $00FF   ; 5FF1  
        DECLE   $0035,  $00B1,  $00A1,  $0013   ; 5FF5  CART PIC #27
        DECLE   $0063,  $0063,  $0017,  $0087   ; 5FF9  
        DECLE   $0080,  $00AC,  $008C,  $00C0   ; 5FFD  CART PIC #28
        DECLE   $00C8,  $00C3,  $00E3,  $00E4   ; 6001  
        DECLE   $00A7,  $000F,  $00CF,  $00CF   ; 6005  CART PIC #29
        DECLE   $001F,  $005F,  $001F,  $00BF   ; 6009  
        DECLE   $0000,  $00FF,  $00FF,  $00FF   ; 600D  CART PIC #2A
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 6011  
        DECLE   $00FF,  $00FF,  $00FF,  $00FE   ; 6015  CART PIC #2B
        DECLE   $00FE,  $00FE,  $00FC,  $00FF   ; 6019  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 601D  CART PIC #2C
        DECLE   $0000,  $0000,  $0001,  $00FF   ; 6021  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6025  CART PIC #2D
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6029  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 602D  CART PIC #2E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6031  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6035  CART PIC #2F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6039  
        DECLE   $0000,  $00F0,  $0048,  $004A   ; 603D   0000 00F0 0048 004A
        DECLE   $0073,  $0042,  $00E2,  $0000   ; 6041   0073 0042 00E2 0000
        DECLE   $0000,  $0000,  $0000,  $0091   ; 6045   0000 0000 0000 0091
        DECLE   $0029,  $0021,  $0010,  $0000   ; 6049   0029 0021 0010 0000
        DECLE   $0000,  $0008,  $0000,  $0048   ; 604D   0000 0008 0000 0048
        DECLE   $0049,  $0049,  $0088,  $0000   ; 6051   0049 0049 0088 0000
        DECLE   $0000,  $0000,  $0000,  $008A   ; 6055   0000 0000 0000 008A
        DECLE   $004A,  $004A,  $008E,  $0000   ; 6059   004A 004A 008E 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 605D   0000 0000 0000 0060
        DECLE   $0040,  $0020,  $0060,  $0000   ; 6061   0040 0020 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 6065   0000 0000 0000 0018
        DECLE   $0011,  $0009,  $0018,  $0000   ; 6069   0011 0009 0018 0000
        DECLE   $0000,  $0000,  $0008,  $008C   ; 606D   0000 0000 0008 008C
        DECLE   $0048,  $0008,  $0084,  $0000   ; 6071   0048 0008 0084 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 6075   0000 0000 0000 00C0
        DECLE   $0080,  $0040,  $00C0,  $0000   ; 6079   0080 0040 00C0 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 607D   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6081   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6085   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6089   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 608D   0000 0000 0000 0006
        DECLE   $0005,  $0005,  $0002,  $0006   ; 6091   0005 0005 0002 0006
        DECLE   $0000,  $0000,  $0000,  $0021   ; 6095   0000 0000 0000 0021
        DECLE   $0012,  $0052,  $005A,  $0000   ; 6099   0012 0052 005A 0000
        DECLE   $0000,  $0000,  $0000,  $0044   ; 609D   0000 0000 0000 0044
        DECLE   $00AA,  $00A8,  $00A6,  $0000   ; 60A1   00AA 00A8 00A6 0000
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 60A5   0000 0000 0000 00C0
        DECLE   $0080,  $0040,  $00C0,  $0000   ; 60A9   0080 0040 00C0 0000
        DECLE   $0002,  $0004,  $0000,  $0000   ; 60AD   0002 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60B1   0000 0000 0000 0000
        DECLE   $0033,  $0042,  $0032,  $0012   ; 60B5   0033 0042 0032 0012
        DECLE   $0062,  $0000,  $0000,  $0000   ; 60B9   0062 0000 0000 0000
        DECLE   $0089,  $0049,  $0049,  $0049   ; 60BD   0089 0049 0049 0049
        DECLE   $0049,  $0000,  $0000,  $0000   ; 60C1   0049 0000 0000 0000
        DECLE   $00C3,  $0024,  $0024,  $0024   ; 60C5   00C3 0024 0024 0024
        DECLE   $0023,  $0001,  $0003,  $0000   ; 60C9   0023 0001 0003 0000
        DECLE   $0000,  $0080,  $0080,  $0080   ; 60CD   0000 0080 0080 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60D1   0000 0000 0000 0000
        DECLE   $0011,  $0011,  $0011,  $0011   ; 60D5   0011 0011 0011 0011
        DECLE   $0011,  $0000,  $0000,  $0000   ; 60D9   0011 0000 0000 0000
        DECLE   $0011,  $0012,  $0012,  $0012   ; 60DD   0011 0012 0012 0012
        DECLE   $0011,  $0000,  $0000,  $0000   ; 60E1   0011 0000 0000 0000
        DECLE   $008C,  $0042,  $008E,  $0012   ; 60E5   008C 0042 008E 0012
        DECLE   $008E,  $0000,  $0000,  $0000   ; 60E9   008E 0000 0000 0000
        DECLE   $0038,  $0049,  $0049,  $0049   ; 60ED   0038 0049 0049 0049
        DECLE   $0038,  $0000,  $0000,  $0000   ; 60F1   0038 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60F5   0000 0000 0000 0000
        DECLE   $0003,  $0004,  $0008,  $0008   ; 60F9   0003 0004 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 60FD   0000 0000 0000 0000
        DECLE   $0002,  $0002,  $0002,  $0002   ; 6101   0002 0002 0002 0002
        DECLE   $0049,  $0049,  $0049,  $0049   ; 6105   0049 0049 0049 0049
        DECLE   $0046,  $0000,  $0000,  $0000   ; 6109   0046 0000 0000 0000
        DECLE   $000E,  $0008,  $0008,  $0008   ; 610D   000E 0008 0008 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6111   0008 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6115   0000 0000 0000 0000
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6119   0040 0040 0040 0040
        DECLE   $0000,  $0000,  $0000,  $0000   ; 611D   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0008,  $0000   ; 6121   0000 0008 0008 0000
        DECLE   $00C4,  $0024,  $0024,  $0024   ; 6125   00C4 0024 0024 0024
        DECLE   $00C3,  $0000,  $0000,  $0000   ; 6129   00C3 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 612D   0000 0000 0000 0000
        DECLE   $0000,  $0016,  $0019,  $0011   ; 6131   0000 0016 0019 0011
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6135   0000 0000 0000 0000
        DECLE   $0000,  $0060,  $0090,  $0010   ; 6139   0000 0060 0090 0010
        DECLE   $0000,  $0000,  $0000,  $0000   ; 613D   0000 0000 0000 0000
        DECLE   $0000,  $0008,  $0008,  $0008   ; 6141   0000 0008 0008 0008
        DECLE   $0090,  $0090,  $0090,  $0090   ; 6145   0090 0090 0090 0090
        DECLE   $0060,  $0000,  $0000,  $0000   ; 6149   0060 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 614D   00FF 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6151   00FF 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $00C0,  $0000   ; 6155   0000 0000 00C0 0000
        DECLE   $0038,  $0000,  $0007,  $0000   ; 6159   0038 0000 0007 0000
        DECLE   $000E,  $0000,  $0001,  $0000   ; 615D   000E 0000 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6161   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6165   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $0000   ; 6169   0000 0000 00E0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 616D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00FF,  $0000   ; 6171   0000 0000 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6175   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00FF   ; 6179   0000 0000 0000 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 617D   0000 0000 0000 0000
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6181   00FF 00FF 00FF 00FF
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6185   0040 0040 0040 0040
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6189   0040 0040 0040 0040
        DECLE   $0002,  $0002,  $0002,  $0002   ; 618D   0002 0002 0002 0002
        DECLE   $0002,  $0002,  $0002,  $0002   ; 6191   0002 0002 0002 0002
        DECLE   $0040,  $0040,  $0040,  $0040   ; 6195   0040 0040 0040 0040
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 6199   00FF 00FF 00FF 00FF
        DECLE   $0023,  $0024,  $0024,  $0024   ; 619D   0023 0024 0024 0024
        DECLE   $0013,  $0000,  $0000,  $0000   ; 61A1   0013 0000 0000 0000
        DECLE   $008E,  $0049,  $0048,  $0048   ; 61A5   008E 0049 0048 0048
        DECLE   $0048,  $0000,  $0000,  $0000   ; 61A9   0048 0000 0000 0000

        INCR    R4                              ; 61AD   000C
        DECR    R1                              ; 61AE   0011
        MOVR    R4,     R1                      ; 61AF   00A1
        MOVR    R4,     R1                      ; 61B0   00A1
        MOVR    R3,     R7                      ; 61B1   009F

        DECLE   $0000,  $0000,  $0000,  $0001   ; 61B2   0000 0000 0000 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61B6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0021   ; 61BA   0000 0000 0000 0021
        DECLE   $0021,  $0021,  $0011,  $000F   ; 61BE   0021 0021 0011 000F
        DECLE   $0000,  $0000,  $0000,  $001C   ; 61C2   0000 0000 0000 001C
        DECLE   $0024,  $0024,  $0024,  $0034   ; 61C6   0024 0024 0024 0034
        DECLE   $0000,  $0000,  $0000,  $0066   ; 61CA   0000 0000 0000 0066
        DECLE   $0088,  $0088,  $0088,  $0088   ; 61CE   0088 0088 0088 0088
        DECLE   $0000,  $0000,  $0000,  $0071   ; 61D2   0000 0000 0000 0071
        DECLE   $008A,  $0089,  $0088,  $0071   ; 61D6   008A 0089 0088 0071
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61DA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61DE   0000 0000 0000 0000
        DECLE   $000E,  $0009,  $000A,  $0000   ; 61E2   000E 0009 000A 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61E6   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $000E   ; 61EA   0000 0001 0001 000E
        DECLE   $0011,  $0091,  $0051,  $002E   ; 61EE   0011 0091 0051 002E
        DECLE   $0000,  $0000,  $0000,  $000A   ; 61F2   0000 0000 0000 000A
        DECLE   $0009,  $0008,  $0008,  $0008   ; 61F6   0009 0008 0008 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61FA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 61FE   0000 0000 0000 0000
        DECLE   $0000,  $0020,  $0020,  $0000   ; 6202   0000 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 6206   0000 0000 0000 0006
        DECLE   $000A,  $0012,  $0022,  $0000   ; 620A   000A 0012 0022 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 620E   0000 0000 0000 000C
        DECLE   $0014,  $0024,  $0044,  $0000   ; 6212   0014 0024 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6216   0000 0000 0000 0000
        DECLE   $001E,  $0020,  $0020,  $0000   ; 621A   001E 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 621E   0000 0000 0000 0008
        DECLE   $0008,  $0010,  $00F0,  $0000   ; 6222   0008 0010 00F0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6226   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C6,  $0080   ; 622A   0000 0000 00C6 0080
        DECLE   $0000,  $0080,  $0040,  $00C0   ; 622E   0000 0080 0040 00C0
        DECLE   $0000,  $0000,  $0000,  $0022   ; 6232   0000 0000 0000 0022
        DECLE   $0022,  $0044,  $00A4,  $001C   ; 6236   0022 0044 00A4 001C
        DECLE   $0000,  $0000,  $0000,  $0049   ; 623A   0000 0000 0000 0049
        DECLE   $0049,  $0092,  $0092,  $0021   ; 623E   0049 0092 0092 0021
        DECLE   $0000,  $0000,  $0000,  $0024   ; 6242   0000 0000 0000 0024
        DECLE   $0028,  $0033,  $0054,  $0098   ; 6246   0028 0033 0054 0098
        DECLE   $0000,  $0000,  $0000,  $0048   ; 624A   0000 0000 0000 0048
        DECLE   $0050,  $00A0,  $0011,  $000E   ; 624E   0050 00A0 0011 000E
        DECLE   $0000,  $0000,  $0000,  $0088   ; 6252   0000 0000 0000 0088
        DECLE   $0091,  $0061,  $0045,  $0038   ; 6256   0091 0061 0045 0038
        DECLE   $0000,  $0000,  $0000,  $0091   ; 625A   0000 0000 0000 0091
        DECLE   $0012,  $0022,  $0022,  $00C9   ; 625E   0012 0022 0022 00C9
        DECLE   $0000,  $0000,  $0000,  $0029   ; 6262   0000 0000 0000 0029
        DECLE   $0050,  $0021,  $0021,  $00C2   ; 6266   0050 0021 0021 00C2
        DECLE   $0000,  $0000,  $0000,  $0050   ; 626A   0000 0000 0000 0050
        DECLE   $0090,  $0010,  $0009,  $0006   ; 626E   0090 0010 0009 0006
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6272   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6276   0000 0000 0000 0000
        DECLE   $000F,  $0031,  $0001,  $0000   ; 627A   000F 0031 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 627E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00B6,  $0011   ; 6282   0000 0000 00B6 0011
        DECLE   $0022,  $0022,  $0054,  $0088   ; 6286   0022 0022 0054 0088
        DECLE   $0000,  $0000,  $0000,  $0002   ; 628A   0000 0000 0000 0002
        DECLE   $0002,  $0001,  $0001,  $0000   ; 628E   0002 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6292   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6296   0000 0000 0000 0000
        DECLE   $0030,  $0040,  $0090,  $0000   ; 629A   0030 0040 0090 0000
        DECLE   $0000,  $0000,  $0000,  $0006   ; 629E   0000 0000 0000 0006
        DECLE   $000A,  $0012,  $0022,  $0000   ; 62A2   000A 0012 0022 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 62A6   0000 0000 0000 000C
        DECLE   $0014,  $0024,  $0044,  $0000   ; 62AA   0014 0024 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62AE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0070,  $0000   ; 62B2   0000 0000 0070 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 62B6   0000 0000 0000 0008
        DECLE   $0008,  $0010,  $00F0,  $0000   ; 62BA   0008 0010 00F0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62BE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C6,  $0000   ; 62C2   0000 0000 00C6 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 62C6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0030           ; 62CA   0000 0000 0030
.GRAM_INIT_62CD:
        DECLE   $0030           ; 62CD  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 62CE  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 62D0  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 62D2  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 62D4  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 62D6  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 62D8  #28-2F:  CART #28-2F ----


        PSHR    R5                              ; 62DA   0275
        SDBD                                    ; 62DB   0001
        MVII    #$5014, R0                      ; 62DC   02B8 0014 0050
        MVO     R0,     G_02F0                  ; 62DF   0240 02F0
        SDBD                                    ; 62E1   0001
        MVII    #$62CD, R5                      ; 62E2   02BD 00CD 0062

        JSRD    R4,     X_NEW_GRAM_INIT         ; 62E5   0004 001E 0335

        MVII    #$0200, R4                      ; 62E8   02BC 0200
        MVII    #$00F0, R0                      ; 62EA   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 62EC   0004 0114 0338

        CLRR    R0                              ; 62EF   01C0
        CLRR    R1                              ; 62F0   01C9
L_62F1:
        MVO@    R0,     R1                      ; 62F1   0248
        INCR    R1                              ; 62F2   0009
        CMPI    #$0008, R1                      ; 62F3   0379 0008
        BNEQ    L_62F1                          ; 62F5   022C 0005

        MVII    #$0001, R0                      ; 62F7   02B8 0001
        MVO     R0,     G_01A6                  ; 62F9   0240 01A6
        MVI     G_01A4, R0                      ; 62FB   0280 01A4
        MVI     G_01A5, R1                      ; 62FD   0281 01A5
        MVO     R0,     .ISRVEC.0               ; 62FF   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6301   0241 0101
        MVII    #$0021, R1                      ; 6303   02B9 0021
        MVI@    R1,     R0                      ; 6305   0288
        DECR    R1                              ; 6306   0011
        MVO@    R0,     R1                      ; 6307   0248
        PULR    R5                              ; 6308   02B5
        EIS                                     ; 6309   0002
        J       X_PLAY_NOTE                     ; 630A   0004 0318 02BD

L_630D:
        PSHR    R5                              ; 630D   0275

        JSR     R5,     L_6336                  ; 630E   0004 0160 0336

        MVII    #$0179, R1                      ; 6311   02B9 0179
        ADDR    R2,     R1                      ; 6313   00D1
        MVI@    R1,     R0                      ; 6314   0288
        SLL     R0,     1                       ; 6315   0048
        ADD@    R1,     R0                      ; 6316   02C8
        ADDR    R0,     R7                      ; 6317   00C7
        J       L_6327                          ; 6318   0004 0360 0327
        J       L_D0A6                          ; 631B   0004 03D0 00A6
        J       L_D0B1                          ; 631E   0004 03D0 00B1
        J       L_D0B9                          ; 6321   0004 03D0 00B9
        J       L_D0C1                          ; 6324   0004 03D0 00C1

L_6327:
        MVII    #$016E, R1                      ; 6327   02B9 016E
        ADDR    R2,     R1                      ; 6329   00D1
        MVI@    R1,     R0                      ; 632A   0288
        TSTR    R0                              ; 632B   0080
        BEQ     L_6335                          ; 632C   0204 0007

        SDBD                                    ; 632E   0001
        MVII    #$51BA, R3                      ; 632F   02BB 00BA 0051

        JSR     R5,     L_D0C9                  ; 6332   0004 01D0 00C9

L_6335:
        PULR    R7                              ; 6335   02B7

L_6336:
        PSHR    R5                              ; 6336   0275
        MVII    #$0179, R1                      ; 6337   02B9 0179
        ADDR    R2,     R1                      ; 6339   00D1
        MVI@    R1,     R0                      ; 633A   0288
        TSTR    R0                              ; 633B   0080
        BEQ     L_6400                          ; 633C   0204 00C2

        JSR     R5,     L_642A                  ; 633E   0004 0164 002A

        PSHR    R2                              ; 6341   0272

        JSR     R5,     L_D181                  ; 6342   0004 01D0 0181

        MVI     G_017E, R0                      ; 6345   0280 017E
        TSTR    R0                              ; 6347   0080
        BNEQ    L_6401                          ; 6348   020C 00B7

        MVII    #$019F, R3                      ; 634A   02BB 019F
        ADDR    R2,     R3                      ; 634C   00D3
        MVI@    R3,     R3                      ; 634D   029B
        PSHR    R1                              ; 634E   0271

        JSR     R5,     L_6482                  ; 634F   0004 0164 0082

        CMPI    #$0005, R0                      ; 6352   0378 0005
        BGE     L_635C                          ; 6354   020D 0006

        SDBD                                    ; 6356   0001
        MVII    #$0500, R0                      ; 6357   02B8 0000 0005
        B       L_6378                          ; 635A   0200 001C

L_635C:
        CMPI    #$0029, R0                      ; 635C   0378 0029
        BLE     L_6391                          ; 635E   0206 0031

        CMPI    #$002F, R0                      ; 6360   0378 002F
        BGT     L_6370                          ; 6362   020E 000C

        SDBD                                    ; 6364   0001
        MVII    #$2A00, R0                      ; 6365   02B8 0000 002A
        MVO@    R0,     R1                      ; 6368   0248
        SWAP    R0,     1                       ; 6369   0040
        CMPI    #$0008, R3                      ; 636A   037B 0008
        BGT     L_63EA                          ; 636C   020E 007C
        B       L_6391                          ; 636E   0200 0021

L_6370:
        CMPI    #$0033, R0                      ; 6370   0378 0033
        DECLE   $020D,  $000F,  $0001           ; 6372   020D 000F 0001

        MVII    #$0000, R0                      ; 6375   02B8 0000
        GSWD    R3                              ; 6377   0033
L_6378:
        MVO@    R0,     R1                      ; 6378   0248
        SWAP    R0,     1                       ; 6379   0040
        CMPI    #$0008, R3                      ; 637A   037B 0008
        BGE     L_6391                          ; 637C   020D 0013

        TSTR    R3                              ; 637E   009B
        BEQ     L_6391                          ; 637F   0204 0010
        B       L_63EA                          ; 6381   0200 0067

        CMPI    #$0058, R0                      ; 6383   0378 0058
        BLE     L_6391                          ; 6385   0206 000A

        SDBD                                    ; 6387   0001
        MVII    #$5900, R0                      ; 6388   02B8 0000 0059
        MVO@    R0,     R1                      ; 638B   0248
        SWAP    R0,     1                       ; 638C   0040
        CMPI    #$0008, R3                      ; 638D   037B 0008
        BGT     L_63EA                          ; 638F   020E 0059

L_6391:
        PSHR    R0                              ; 6391   0270
        CMPI    #$0015, R0                      ; 6392   0378 0015
        BGE     L_639A                          ; 6394   020D 0004

        MVII    #$0028, R0                      ; 6396   02B8 0028
        B       L_63A6                          ; 6398   0200 000C

L_639A:
        PSHR    R1                              ; 639A   0271
        MVII    #$0005, R1                      ; 639B   02B9 0005
        MVII    #$0012, R2                      ; 639D   02BA 0012

        JSR     R5,     L_57CB                  ; 639F   0004 0154 03CB

        NEGR    R0                              ; 63A2   0020
        ADDI    #$002B, R0                      ; 63A3   02F8 002B
        PULR    R1                              ; 63A5   02B1
L_63A6:
        DECR    R1                              ; 63A6   0011
        MVI@    R1,     R2                      ; 63A7   028A
        SWAP    R2,     1                       ; 63A8   0042
        ANDI    #$00FF, R2                      ; 63A9   03BA 00FF
        CMPR    R0,     R2                      ; 63AB   0142
        BGE     L_63BD                          ; 63AC   020D 000F

        ANDI    #$00FF, R0                      ; 63AE   03B8 00FF
        SWAP    R0,     1                       ; 63B0   0040
        MVO@    R0,     R1                      ; 63B1   0248
        PULR    R0                              ; 63B2   02B0
        CMPI    #$000B, R3                      ; 63B3   037B 000B
        BGE     L_63FE                          ; 63B5   020D 0047

        CMPI    #$0003, R3                      ; 63B7   037B 0003
        BLE     L_63FE                          ; 63B9   0206 0043
        B       L_63EA                          ; 63BB   0200 002D

L_63BD:
        PULR    R0                              ; 63BD   02B0
        CMPI    #$0015, R0                      ; 63BE   0378 0015
        BGE     L_63C6                          ; 63C0   020D 0004

        MVII    #$0090, R0                      ; 63C2   02B8 0090
        B       L_63DB                          ; 63C4   0200 0015

L_63C6:
        CMPI    #$0045, R0                      ; 63C6   0378 0045
        BLT     L_63CE                          ; 63C8   0205 0004

        MVII    #$00A0, R0                      ; 63CA   02B8 00A0
        B       L_63DB                          ; 63CC   0200 000D

L_63CE:
        PSHR    R2                              ; 63CE   0272
        PSHR    R1                              ; 63CF   0271
        MVII    #$0005, R1                      ; 63D0   02B9 0005
        MVII    #$0012, R2                      ; 63D2   02BA 0012

        JSR     R5,     L_57CB                  ; 63D4   0004 0154 03CB

        PULR    R1                              ; 63D7   02B1
        PULR    R2                              ; 63D8   02B2
        ADDI    #$008C, R0                      ; 63D9   02F8 008C
L_63DB:
        CMPR    R0,     R2                      ; 63DB   0142
        BLE     L_63FE                          ; 63DC   0206 0020

        ANDI    #$00FF, R0                      ; 63DE   03B8 00FF
        SWAP    R0,     1                       ; 63E0   0040
        MVO@    R0,     R1                      ; 63E1   0248
        CMPI    #$000D, R3                      ; 63E2   037B 000D
        BGT     L_63EA                          ; 63E4   020E 0004

        CMPI    #$0005, R3                      ; 63E6   037B 0005
        BGE     L_63FE                          ; 63E8   020D 0014

L_63EA:
        PULR    R1                              ; 63EA   02B1
        ADDI    #$0004, R1                      ; 63EB   02F9 0004
        CLRR    R0                              ; 63ED   01C0
        MVO@    R0,     R1                      ; 63EE   0248
        INCR    R1                              ; 63EF   0009
        MVO@    R0,     R1                      ; 63F0   0248
        PULR    R2                              ; 63F1   02B2
        MVII    #$0179, R1                      ; 63F2   02B9 0179
        ADDR    R2,     R1                      ; 63F4   00D1
        MVO@    R0,     R1                      ; 63F5   0248
        SDBD                                    ; 63F6   0001
        MVII    #$5158, R3                      ; 63F7   02BB 0058 0051

        JSR     R5,     L_D0C9                  ; 63FA   0004 01D0 00C9

        PULR    R7                              ; 63FD   02B7

L_63FE:
        PULR    R1                              ; 63FE   02B1
        PULR    R2                              ; 63FF   02B2
L_6400:
        PULR    R7                              ; 6400   02B7

L_6401:
        SDBD                                    ; 6401   0001
        MVII    #$5C2E, R2                      ; 6402   02BA 002E 005C
        SDBD                                    ; 6405   0001
        MVII    #$3604, R4                      ; 6406   02BC 0004 0036

        JSR     R5,     .EXEC.2AE               ; 6409   0004 0110 02AE

        SDBD                                    ; 640C   0001
        MVII    #$5802, R2                      ; 640D   02BA 0002 0058
        SDBD                                    ; 6410   0001
        MVII    #$5004, R4                      ; 6411   02BC 0004 0050

        JSR     R5,     .EXEC.2AE               ; 6414   0004 0110 02AE

        SDBD                                    ; 6417   0001
        MVII    #$5858, R2                      ; 6418   02BA 0058 0058
        SDBD                                    ; 641B   0001
        MVII    #$5004, R4                      ; 641C   02BC 0004 0050

        JSR     R5,     .EXEC.2AE               ; 641F   0004 0110 02AE

        PULR    R2                              ; 6422   02B2
        PSHR    R2                              ; 6423   0272
        PSHR    R1                              ; 6424   0271

        JSR     R5,     L_6482                  ; 6425   0004 0164 0082

        B       L_6391                          ; 6428   0220 0098

L_642A:
        PSHR    R5                              ; 642A   0275
        PSHR    R2                              ; 642B   0272
        MVII    #$01B1, R4                      ; 642C   02BC 01B1
        ADDR    R2,     R4                      ; 642E   00D4
        MVI@    R4,     R3                      ; 642F   02A3

        JSR     R5,     L_645D                  ; 6430   0004 0164 005D

        MVO     R0,     G_01B6                  ; 6433   0240 01B6
        TSTR    R3                              ; 6435   009B
        BEQ     L_6455                          ; 6436   0204 001D

        ADDI    #$0004, R1                      ; 6438   02F9 0004
        PSHR    R1                              ; 643A   0271
        MVI@    R1,     R0                      ; 643B   0288

        JSR     R5,     X_UNPK_BYTES            ; 643C   0004 0114 0357

        PSHR    R1                              ; 643F   0271
        MVI     G_01B6, R1                      ; 6440   0281 01B6
        MOVR    R3,     R2                      ; 6442   009A

        JSR     R5,     L_57CB                  ; 6443   0004 0154 03CB

        PULR    R1                              ; 6446   02B1
        PSHR    R0                              ; 6447   0270
        MVI     G_01B6, R0                      ; 6448   0280 01B6
        MOVR    R3,     R2                      ; 644A   009A

        JSR     R5,     L_57CB                  ; 644B   0004 0154 03CB

        MOVR    R0,     R1                      ; 644E   0081
        PULR    R0                              ; 644F   02B0

        JSR     R5,     X_PACK_BYTES            ; 6450   0004 0114 034F

        PULR    R1                              ; 6453   02B1
        MVO@    R0,     R1                      ; 6454   0248
L_6455:
        PULR    R2                              ; 6455   02B2
        MVII    #$01B1, R4                      ; 6456   02BC 01B1
        ADDR    R2,     R4                      ; 6458   00D4
        MVI     G_01B6, R0                      ; 6459   0280 01B6
        MVO@    R0,     R4                      ; 645B   0260
        PULR    R7                              ; 645C   02B7

L_645D:
        PSHR    R5                              ; 645D   0275
        PSHR    R2                              ; 645E   0272

        JSR     R5,     L_D181                  ; 645F   0004 01D0 0181

        PSHR    R1                              ; 6462   0271

        JSR     R5,     L_6482                  ; 6463   0004 0164 0082

        SLR     R0,     1                       ; 6466   0060
        ADDI    #$0050, R0                      ; 6467   02F8 0050
        MVII    #$016E, R1                      ; 6469   02B9 016E
        ADDR    R2,     R1                      ; 646B   00D1
        MVI@    R1,     R1                      ; 646C   0289
        TSTR    R1                              ; 646D   0089
        BEQ     L_6478                          ; 646E   0204 0008

        CMPI    #$0005, R1                      ; 6470   0379 0005
        BEQ     L_6478                          ; 6472   0204 0004

        MVII    #$000D, R1                      ; 6474   02B9 000D
        B       L_647A                          ; 6476   0200 0002

L_6478:
        MVII    #$0018, R1                      ; 6478   02B9 0018
L_647A:
        MVII    #$0080, R2                      ; 647A   02BA 0080

        JSR     R5,     L_57CB                  ; 647C   0004 0154 03CB

        PULR    R1                              ; 647F   02B1
        PULR    R2                              ; 6480   02B2
        PULR    R7                              ; 6481   02B7

L_6482:
        ADDI    #$0003, R1                      ; 6482   02F9 0003
        MVI@    R1,     R0                      ; 6484   0288
        SWAP    R0,     1                       ; 6485   0040
        ANDI    #$00FF, R0                      ; 6486   03B8 00FF
        MOVR    R5,     R7                      ; 6488   00AF

        PSHR    R5                              ; 6489   0275
        INCR    R1                              ; 648A   0009
        MVI     G_017E, R2                      ; 648B   0282 017E
        TSTR    R2                              ; 648D   0092
        BEQ     L_659C                          ; 648E   0204 010C

        CMPI    #$000A, R0                      ; 6490   0378 000A
        BEQ     L_64B5                          ; 6492   0204 0021

        CMPI    #$0000, R0                      ; 6494   0378 0000
        BEQ     L_64A3                          ; 6496   0204 000B

        MVII    #$0004, R3                      ; 6498   02BB 0004
        MVII    #$0181, R4                      ; 649A   02BC 0181
L_649C:
        CMP@    R4,     R1                      ; 649C   0361
        BEQ     L_650E                          ; 649D   0204 006F

        DECR    R3                              ; 649F   0013
        BNEQ    L_649C                          ; 64A0   022C 0005
        PULR    R7                              ; 64A2   02B7

L_64A3:
        CMPI    #$0001, R2                      ; 64A3   037A 0001
        BNEQ    L_6665                          ; 64A5   020C 01BE

        MVI     G_0180, R2                      ; 64A7   0282 0180
        CMPI    #$0003, R2                      ; 64A9   037A 0003
        BLT     L_6665                          ; 64AB   0205 01B8

        CMPI    #$0004, R2                      ; 64AD   037A 0004
        BEQ     L_6665                          ; 64AF   0204 01B4

        MVII    #$0004, R0                      ; 64B1   02B8 0004
        B       L_64D8                          ; 64B3   0200 0023

L_64B5:
        CMPI    #$0001, R2                      ; 64B5   037A 0001
        BNEQ    L_6665                          ; 64B7   020C 01AC

        MVI     G_0180, R0                      ; 64B9   0280 0180
        CMPI    #$0003, R0                      ; 64BB   0378 0003
        BGT     L_6665                          ; 64BD   020E 01A6
        BNEQ    L_64D5                          ; 64BF   020C 0014

        MVI     G_0189, R2                      ; 64C1   0282 0189
        CMPI    #$0003, R2                      ; 64C3   037A 0003
        BLT     L_64CF                          ; 64C5   0205 0008

        MVI     G_018A, R2                      ; 64C7   0282 018A
        CMPI    #$0003, R2                      ; 64C9   037A 0003
        BGE     L_6665                          ; 64CB   020D 0198
        B       L_64D5                          ; 64CD   0200 0006

L_64CF:
        MVI     G_018A, R2                      ; 64CF   0282 018A
        CMPI    #$0003, R2                      ; 64D1   037A 0003
        BLT     L_6665                          ; 64D3   0205 0190

L_64D5:
        SUBI    #$0003, R0                      ; 64D5   0338 0003
        NEGR    R0                              ; 64D7   0020
L_64D8:
        MVO     R0,     G_0198                  ; 64D8   0240 0198
        SDBD                                    ; 64DA   0001
        MVII    #$5024, R1                      ; 64DB   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 64DE   0004 0118 0038

        SDBD                                    ; 64E1   0001
        MVII    #$501C, R1                      ; 64E2   02B9 001C 0050

        JSR     R5,     X_TIMER_STOP            ; 64E5   0004 0118 0038
        JSR     R5,     L_669F                  ; 64E8   0004 0164 029F

        MVI     G_0102, R0                      ; 64EB   0280 0102
L_64ED:
        CMP     G_0102, R0                      ; 64ED   0340 0102
        BEQ     L_64ED                          ; 64EF   0224 0003

        JSR     R5,     L_666C                  ; 64F1   0004 0164 026C
        JSR     R5,     L_6792                  ; 64F4   0004 0164 0392

        CLRR    R0                              ; 64F7   01C0
        MVO     R0,     G_017E                  ; 64F8   0240 017E

        JSR     R5,     L_5D62                  ; 64FA   0004 015C 0162

        SDBD                                    ; 64FD   0001
        MVII    #$534D, R4                      ; 64FE   02BC 004D 0053

        JSR     R5,     L_52BB                  ; 6501   0004 0150 02BB
        DECLE   $0280,  $016E,  $02BB,  $0004   ; 6504   0280 016E 02BB 0004
        DECLE   $0004,  $01E0,  $022A           ; 6508   0004 01E0 022A

        MVO     R0,     G_0186                  ; 650B   0240 0186
        PULR    R7                              ; 650D   02B7

L_650E:
        CMPI    #$000B, R0                      ; 650E   0378 000B
        BNEQ    L_6665                          ; 6510   020C 0153

        CMPI    #$0002, R2                      ; 6512   037A 0002
        BNEQ    L_6665                          ; 6514   020C 014F

        MVI     G_0180, R2                      ; 6516   0282 0180

        JSR     R5,     L_D181                  ; 6518   0004 01D0 0181

        ADDI    #$0002, R1                      ; 651B   02F9 0002
        MVI@    R1,     R2                      ; 651D   028A
        INCR    R1                              ; 651E   0009
        MVI@    R1,     R3                      ; 651F   028B
        SWAP    R2,     1                       ; 6520   0042
        SWAP    R3,     1                       ; 6521   0043
        ANDI    #$00FF, R2                      ; 6522   03BA 00FF
        ANDI    #$00FF, R3                      ; 6524   03BB 00FF
        CMPI    #$0044, R2                      ; 6526   037A 0044
        BLT     L_6665                          ; 6528   0205 013B

        CMPI    #$0054, R2                      ; 652A   037A 0054
        BLE     L_654E                          ; 652C   0206 0020

        CMPI    #$0064, R2                      ; 652E   037A 0064
        BLT     L_6665                          ; 6530   0205 0133

        CMPI    #$0074, R2                      ; 6532   037A 0074
        BGT     L_6665                          ; 6534   020E 012F

        CMPI    #$0022, R3                      ; 6536   037B 0022
        BLT     L_6665                          ; 6538   0205 012B

        CMPI    #$002E, R3                      ; 653A   037B 002E
        BGT     L_6542                          ; 653C   020E 0004

        MVII    #$0002, R2                      ; 653E   02BA 0002
        B       L_6564                          ; 6540   0200 0022

L_6542:
        CMPI    #$004A, R3                      ; 6542   037B 004A
        BLT     L_6665                          ; 6544   0205 011F

        CMPI    #$0056, R3                      ; 6546   037B 0056
        BGT     L_6665                          ; 6548   020E 011B

        MVII    #$0004, R2                      ; 654A   02BA 0004
        B       L_6564                          ; 654C   0200 0016

L_654E:
        CMPI    #$0012, R3                      ; 654E   037B 0012
        BLT     L_6665                          ; 6550   0205 0113

        CMPI    #$001E, R3                      ; 6552   037B 001E
        BGT     L_655A                          ; 6554   020E 0004

        MVII    #$0001, R2                      ; 6556   02BA 0001
        B       L_6564                          ; 6558   0200 000A

L_655A:
        CMPI    #$003A, R3                      ; 655A   037B 003A
        BLT     L_6665                          ; 655C   0205 0107

        CMPI    #$0046, R3                      ; 655E   037B 0046
        BGT     L_6665                          ; 6560   020E 0103

        MVII    #$0003, R2                      ; 6562   02BA 0003
L_6564:
        MVII    #$0185, R4                      ; 6564   02BC 0185
        MVII    #$0004, R3                      ; 6566   02BB 0004
L_6568:
        CMP@    R4,     R2                      ; 6568   0362
        BEQ     L_6570                          ; 6569   0204 0005

        DECR    R3                              ; 656B   0013
        BNEQ    L_6568                          ; 656C   022C 0005
        B       L_6665                          ; 656E   0200 00F5

L_6570:
        MVI     G_0180, R0                      ; 6570   0280 0180
        MVII    #$0188, R4                      ; 6572   02BC 0188
        ADDR    R0,     R4                      ; 6574   00C4
        MVO@    R2,     R4                      ; 6575   0262
        MVII    #$0184, R4                      ; 6576   02BC 0184
        ADDR    R2,     R4                      ; 6578   00D4
        CLRR    R0                              ; 6579   01C0
        MVO@    R0,     R4                      ; 657A   0260

        JSR     R5,     L_6676                  ; 657B   0004 0164 0276

        MVII    #$0004, R3                      ; 657E   02BB 0004
        MVII    #$018D, R5                      ; 6580   02BD 018D
        MVII    #$0181, R4                      ; 6582   02BC 0181
L_6584:
        MVI@    R5,     R2                      ; 6584   02AA
        MVO@    R2,     R4                      ; 6585   0262
        DECR    R3                              ; 6586   0013
        BNEQ    L_6584                          ; 6587   022C 0004

        MVI     G_0180, R2                      ; 6589   0282 0180
        INCR    R2                              ; 658B   000A
        MVO     R2,     G_0180                  ; 658C   0242 0180
        CMPI    #$0005, R2                      ; 658E   037A 0005
        MVII    #$0000, R0                      ; 6590   02B8 0000
        BEQ     L_64D8                          ; 6592   0224 00BB

        INCR    R0                              ; 6594   0008
        MVO     R0,     G_017E                  ; 6595   0240 017E

        JSR     R5,     L_5372                  ; 6597   0004 0150 0372

        B       L_65FC                          ; 659A   0200 0060

L_659C:
        CMPI    #$0008, R0                      ; 659C   0378 0008
        BGT     L_6665                          ; 659E   020E 00C5
        BEQ     L_6605                          ; 65A0   0204 0063

        CMPI    #$0004, R0                      ; 65A2   0378 0004
        BGE     L_6665                          ; 65A4   020D 00BF

        CMPI    #$0000, R0                      ; 65A6   0378 0000
        BEQ     L_6665                          ; 65A8   0204 00BB

        MVI     G_017F, R2                      ; 65AA   0282 017F
        TSTR    R2                              ; 65AC   0092
        BEQ     L_664F                          ; 65AD   0204 00A0

        CLRR    R2                              ; 65AF   01D2
        MVO     R2,     G_017F                  ; 65B0   0242 017F
        INCR    R2                              ; 65B2   000A
        MVO     R2,     G_017E                  ; 65B3   0242 017E
        DECR    R0                              ; 65B5   0010
        MVII    #$0006, R1                      ; 65B6   02B9 0006
        MVII    #$019A, R4                      ; 65B8   02BC 019A
        SDBD                                    ; 65BA   0001
        MVII    #$6878, R3                      ; 65BB   02BB 0078 0068
        ADDR    R0,     R3                      ; 65BE   00C3
L_65BF:
        MVI@    R3,     R2                      ; 65BF   029A
        MVO@    R2,     R4                      ; 65C0   0262
        ADDI    #$0003, R3                      ; 65C1   02FB 0003
        DECR    R1                              ; 65C3   0011
        BNEQ    L_65BF                          ; 65C4   022C 0006

        ADDI    #$0008, R2                      ; 65C6   02FA 0008
        CLRR    R0                              ; 65C8   01C0
        MVO     R0,     G_01A6                  ; 65C9   0240 01A6
        MVI     .ISRVEC.0,R0                    ; 65CB   0280 0100
        MVO     R0,     G_01A4                  ; 65CD   0240 01A4
        MVI     .ISRVEC.1,R0                    ; 65CF   0280 0101
        MVO     R0,     G_01A5                  ; 65D1   0240 01A5
        MVII    #$0089, R0                      ; 65D3   02B8 0089
        MVII    #$0066, R1                      ; 65D5   02B9 0066
        MVO     R0,     .ISRVEC.0               ; 65D7   0240 0100
        MVO     R1,     .ISRVEC.1               ; 65D9   0241 0101
L_65DB:
        MVI     G_01A6, R0                      ; 65DB   0280 01A6
        TSTR    R0                              ; 65DD   0080
        BEQ     L_65DB                          ; 65DE   0224 0004

        MVI     G_0102, R0                      ; 65E0   0280 0102
L_65E2:
        CMP     G_0102, R0                      ; 65E2   0340 0102
        BEQ     L_65E2                          ; 65E4   0224 0003

        SDBD                                    ; 65E6   0001
        MVII    #$501C, R1                      ; 65E7   02B9 001C 0050

        JSR     R5,     X_TIMER_START           ; 65EA   0004 0118 0044
        JSR     R5,     L_5C2C                  ; 65ED   0004 015C 002C

        SDBD                                    ; 65F0   0001
        MVII    #$5024, R1                      ; 65F1   02B9 0024 0050

        JSR     R5,     X_TIMER_START           ; 65F4   0004 0118 0044

        MVII    #$0001, R2                      ; 65F7   02BA 0001

        JSR     R5,     L_5372                  ; 65F9   0004 0150 0372
L_65FC:
        JSR     R5,     L_685C                  ; 65FC   0004 0168 005C

        MVII    #$0003, R0                      ; 65FF   02B8 0003

        JSR     R5,     X_PLAY_CHEER1           ; 6601   0004 011C 02D5

        PULR    R7                              ; 6604   02B7

L_6605:
        MVI     G_017F, R0                      ; 6605   0280 017F
        TSTR    R0                              ; 6607   0080
        BNEQ    L_6665                          ; 6608   020C 005B

        INCR    R0                              ; 660A   0008
        MVO     R0,     G_0189                  ; 660B   0240 0189
        MVI     G_01C0, R0                      ; 660D   0280 01C0
        TSTR    R0                              ; 660F   0080
        BNEQ    L_666B                          ; 6610   020C 0059

        MVI     G_01C1, R0                      ; 6612   0280 01C1
        TSTR    R0                              ; 6614   0080
        BNEQ    L_666B                          ; 6615   020C 0054

        MVI     G_01CE, R0                      ; 6617   0280 01CE
        TSTR    R0                              ; 6619   0080
        BNEQ    L_666B                          ; 661A   020C 004F

        MVI     G_01CF, R0                      ; 661C   0280 01CF
        TSTR    R0                              ; 661E   0080
        BNEQ    L_666B                          ; 661F   020C 004A

        MVII    #$0004, R2                      ; 6621   02BA 0004
L_6623:
        MVII    #$016E, R4                      ; 6623   02BC 016E
        ADDR    R2,     R4                      ; 6625   00D4
        MVI@    R4,     R0                      ; 6626   02A0
        TSTR    R0                              ; 6627   0080
        BNEQ    L_666B                          ; 6628   020C 0041

        DECR    R2                              ; 662A   0012
        BNEQ    L_6623                          ; 662B   022C 0009

        SDBD                                    ; 662D   0001
        MVII    #$1906, R0                      ; 662E   02B8 0006 0019
        MVII    #$01D2, R4                      ; 6631   02BC 01D2
        MVII    #$0003, R1                      ; 6633   02B9 0003
        CMP@    R4,     R1                      ; 6635   0361
        BEQ     L_663F                          ; 6636   0204 0007

        CMP@    R4,     R1                      ; 6638   0361
        BEQ     L_663F                          ; 6639   0204 0004

        SDBD                                    ; 663B   0001
        MVII    #$6645, R0                      ; 663C   02B8 0045 0066
L_663F:
        MVO     R0,     G_035D                  ; 663F   0240 035D

        JSR     R5,     L_58E9                  ; 6641   0004 0158 00E9

        PULR    R7                              ; 6644   02B7

        DECLE   $0000,  $00D0,  $0000,  $0000   ; 6645   0000 00D0 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6649   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 664D   0000 0000
L_664F:
        MVII    #$0175, R2                      ; 664F   02BA 0175
        ADDR    R1,     R2                      ; 6651   00CA
        MVI@    R2,     R2                      ; 6652   0292
        CMP     G_01B8, R2                      ; 6653   0342 01B8
        BNEQ    L_6665                          ; 6655   020C 000E

        CLRR    R1                              ; 6657   01C9
        CMPI    #$0003, R0                      ; 6658   0378 0003
        BEQ     L_6662                          ; 665A   0204 0006

        INCR    R1                              ; 665C   0009
        CMPI    #$0002, R0                      ; 665D   0378 0002
        BEQ     L_6662                          ; 665F   0204 0001

        INCR    R1                              ; 6661   0009
L_6662:
        MVO     R1,     G_01B9                  ; 6662   0241 01B9
        PULR    R7                              ; 6664   02B7

L_6665:
        MVII    #$0002, R0                      ; 6665   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; 6667   0004 011C 02C4

        PULR    R7                              ; 666A   02B7
L_666B:
        PULR    R7                              ; 666B   02B7

L_666C:
        PSHR    R5                              ; 666C   0275
        MVII    #$0004, R2                      ; 666D   02BA 0004

L_666F:
        JSR     R5,     L_6676                  ; 666F   0004 0164 0276

        DECR    R2                              ; 6672   0012
        BNEQ    L_666F                          ; 6673   022C 0005
        PULR    R7                              ; 6675   02B7

L_6676:
        PSHR    R5                              ; 6676   0275
        SDBD                                    ; 6677   0001
        MVII    #$53D5, R4                      ; 6678   02BC 00D5 0053
        ADDR    R2,     R4                      ; 667B   00D4
        MVI@    R4,     R0                      ; 667C   02A0

        JSR     R5,     .EXEC.76C               ; 667D   0004 0114 036C

        ADDI    #$0000, R1                      ; 6680   02F9 0000
        MVI@    R1,     R0                      ; 6682   0288
        SDBD                                    ; 6683   0001
        ANDI    #$EFFF, R0                      ; 6684   03B8 00FF 00EF
        MVO@    R0,     R1                      ; 6687   0248
        PULR    R7                              ; 6688   02B7

        PSHR    R5                              ; 6689   0275
        MVO     R2,     .STIC.CS.1              ; 668A   0242 0029
        MVO     R2,     .STIC.CS.3              ; 668C   0242 002B
        MVII    #$0001, R0                      ; 668E   02B8 0001
        MVO     R0,     G_01A6                  ; 6690   0240 01A6
        MVI     G_01A4, R0                      ; 6692   0280 01A4
        MVI     G_01A5, R1                      ; 6694   0281 01A5
        MVO     R0,     .ISRVEC.0               ; 6696   0240 0100
        MVO     R1,     .ISRVEC.1               ; 6698   0241 0101
        PULR    R5                              ; 669A   02B5
        MVII    #$01A4, R4                      ; 669B   02BC 01A4
        SDBD                                    ; 669D   0001
        MVI@    R4,     R7                      ; 669E   02A7

L_669F:
        PSHR    R5                              ; 669F   0275
        MVII    #$018D, R4                      ; 66A0   02BC 018D
        CLRR    R0                              ; 66A2   01C0
        MVO@    R0,     R4                      ; 66A3   0260
        MVO@    R0,     R4                      ; 66A4   0260
        MVO@    R0,     R4                      ; 66A5   0260
        MVO@    R0,     R4                      ; 66A6   0260
        MVII    #$0189, R4                      ; 66A7   02BC 0189
        MVI     G_0180, R0                      ; 66A9   0280 0180
        CMPI    #$0002, R0                      ; 66AB   0378 0002
        BGT     L_66DB                          ; 66AD   020E 002C
        BEQ     L_66BB                          ; 66AF   0204 000A

        INCR    R0                              ; 66B1   0008
        MVO     R0,     G_018D                  ; 66B2   0240 018D
        MVO     R0,     G_018E                  ; 66B4   0240 018E
        INCR    R0                              ; 66B6   0008
        MVO     R0,     G_0180                  ; 66B7   0240 0180
        B       L_66C5                          ; 66B9   0200 000A

L_66BB:
        MVO     R0,     G_018E                  ; 66BB   0240 018E
        INCR    R0                              ; 66BD   0008
        MVO     R0,     G_0180                  ; 66BE   0240 0180
        MVI@    R4,     R0                      ; 66C0   02A0
        CMPI    #$0003, R0                      ; 66C1   0378 0003
        BLT     L_66CD                          ; 66C3   0205 0008

L_66C5:
        MVII    #$0000, R2                      ; 66C5   02BA 0000
L_66C7:
        MVII    #$0081, R0                      ; 66C7   02B8 0081
        MVII    #$0002, R3                      ; 66C9   02BB 0002
        B       L_6776                          ; 66CB   0200 00A9

L_66CD:
        MVII    #$0001, R2                      ; 66CD   02BA 0001
L_66CF:
        MVII    #$0082, R0                      ; 66CF   02B8 0082
        MVII    #$0001, R3                      ; 66D1   02BB 0001
        B       L_6776                          ; 66D3   0200 00A1

L_66D5:
        MVII    #$008A, R0                      ; 66D5   02B8 008A
        MVII    #$0023, R3                      ; 66D7   02BB 0023
        B       L_6776                          ; 66D9   0200 009B

L_66DB:
        CMPI    #$0003, R0                      ; 66DB   0378 0003
        BGT     L_677E                          ; 66DD   020E 009F

        MVI@    R4,     R0                      ; 66DF   02A0
        CMPI    #$0003, R0                      ; 66E0   0378 0003
        BLT     L_672D                          ; 66E2   0205 0049

        MVI@    R4,     R0                      ; 66E4   02A0
        CMPI    #$0003, R0                      ; 66E5   0378 0003
        BGE     L_6712                          ; 66E7   020D 0029

        MVII    #$0002, R2                      ; 66E9   02BA 0002
        MVI     G_0198, R0                      ; 66EB   0280 0198
        TSTR    R0                              ; 66ED   0080
        BEQ     L_66C7                          ; 66EE   0224 0028

        MVO     R2,     G_018F                  ; 66F0   0242 018F
        MVO     R2,     G_0190                  ; 66F2   0242 0190
        MVI     G_0189, R0                      ; 66F4   0280 0189
        CMPI    #$0003, R0                      ; 66F6   0378 0003
        BEQ     L_66FE                          ; 66F8   0204 0004

        MVII    #$0099, R0                      ; 66FA   02B8 0099
        B       L_6700                          ; 66FC   0200 0002

L_66FE:
        MVII    #$008B, R0                      ; 66FE   02B8 008B
L_6700:
        MVI     G_018A, R1                      ; 6700   0281 018A
        CMPI    #$0001, R1                      ; 6702   0379 0001
        BEQ     L_670A                          ; 6704   0204 0004

        MVII    #$0014, R3                      ; 6706   02BB 0014
        B       L_670C                          ; 6708   0200 0002

L_670A:
        MVII    #$0022, R3                      ; 670A   02BB 0022
L_670C:
        MVII    #$0005, R2                      ; 670C   02BA 0005
        MVO     R2,     G_0180                  ; 670E   0242 0180
        B       L_6776                          ; 6710   0200 0064

L_6712:
        MVII    #$0002, R0                      ; 6712   02B8 0002
        MVO     R0,     G_018F                  ; 6714   0240 018F
        MVO     R0,     G_0190                  ; 6716   0240 0190
        INCR    R0                              ; 6718   0008
        MVO     R0,     G_0198                  ; 6719   0240 0198
        MVII    #$0005, R0                      ; 671B   02B8 0005
        MVO     R0,     G_0180                  ; 671D   0240 0180
        MVII    #$0003, R2                      ; 671F   02BA 0003
        MVI     G_0189, R0                      ; 6721   0280 0189
        CMPI    #$0003, R0                      ; 6723   0378 0003
        BEQ     L_66D5                          ; 6725   0224 0051

        MVII    #$0091, R0                      ; 6727   02B8 0091
        MVII    #$0023, R3                      ; 6729   02BB 0023
        B       L_6776                          ; 672B   0200 0049

L_672D:
        MVI@    R4,     R0                      ; 672D   02A0
        CMPI    #$0003, R0                      ; 672E   0378 0003
        BLT     L_675B                          ; 6730   0205 0029

        MVII    #$0002, R2                      ; 6732   02BA 0002
        MVI     G_0198, R0                      ; 6734   0280 0198
        TSTR    R0                              ; 6736   0080
        BEQ     L_66CF                          ; 6737   0224 0069

        MVO     R2,     G_018F                  ; 6739   0242 018F
        MVO     R2,     G_0190                  ; 673B   0242 0190
        MVI     G_0189, R0                      ; 673D   0280 0189
        CMPI    #$0001, R0                      ; 673F   0378 0001
        BEQ     L_6747                          ; 6741   0204 0004

        MVII    #$000C, R3                      ; 6743   02BB 000C
        B       L_6749                          ; 6745   0200 0002

L_6747:
        MVII    #$0021, R3                      ; 6747   02BB 0021
L_6749:
        MVI     G_018A, R1                      ; 6749   0281 018A
        CMPI    #$0003, R1                      ; 674B   0379 0003
        BEQ     L_6753                          ; 674D   0204 0004

        MVII    #$009A, R0                      ; 674F   02B8 009A
        B       L_6755                          ; 6751   0200 0002

L_6753:
        MVII    #$0093, R0                      ; 6753   02B8 0093
L_6755:
        MVII    #$0005, R2                      ; 6755   02BA 0005
        MVO     R2,     G_0180                  ; 6757   0242 0180
        B       L_6776                          ; 6759   0200 001B

L_675B:
        MVII    #$0002, R0                      ; 675B   02B8 0002
        MVO     R0,     G_018F                  ; 675D   0240 018F
        MVO     R0,     G_0190                  ; 675F   0240 0190
        INCR    R0                              ; 6761   0008
        MVO     R0,     G_0198                  ; 6762   0240 0198
        MVII    #$0005, R0                      ; 6764   02B8 0005
        MVO     R0,     G_0180                  ; 6766   0240 0180
        MVII    #$0004, R2                      ; 6768   02BA 0004
        MVII    #$00A3, R0                      ; 676A   02B8 00A3
        MVII    #$000A, R3                      ; 676C   02BB 000A
        MVI     G_0189, R1                      ; 676E   0281 0189
        CMPI    #$0001, R1                      ; 6770   0379 0001
        BNEQ    L_6776                          ; 6772   020C 0002

        MVII    #$0011, R3                      ; 6774   02BB 0011
L_6776:
        MVO     R0,     G_0173                  ; 6776   0240 0173
        XORI    #$0040, R3                      ; 6778   03FB 0040
        MVO     R3,     G_0174                  ; 677A   0243 0174
        B       L_6783                          ; 677C   0200 0005

L_677E:
        JSR     R5,     L_6820                  ; 677E   0004 0168 0020

        MVII    #$0004, R2                      ; 6781   02BA 0004
L_6783:
        MVO     R2,     G_0197                  ; 6783   0242 0197
        MVI     G_0173, R2                      ; 6785   0282 0173
        MVII    #$01CA, R4                      ; 6787   02BC 01CA

        JSR     R5,     L_6808                  ; 6789   0004 0168 0008

        MVI     G_0174, R2                      ; 678C   0282 0174

        JSR     R5,     L_6808                  ; 678E   0004 0168 0008

        PULR    R7                              ; 6791   02B7

L_6792:
        PSHR    R5                              ; 6792   0275
        MVI     G_0174, R0                      ; 6793   0280 0174
        MOVR    R0,     R2                      ; 6795   0082
        ANDI    #$0080, R0                      ; 6796   03B8 0080
        BNEQ    L_679C                          ; 6798   020C 0002

        MVI     G_0173, R2                      ; 679A   0282 0173
L_679C:
        ANDI    #$0007, R2                      ; 679C   03BA 0007
        MVO     R2,     G_01B8                  ; 679E   0242 01B8

        JSR     R5,     L_D443                  ; 67A0   0004 01D4 0043

        MVI     G_0197, R0                      ; 67A3   0280 0197
        SLL     R0,     1                       ; 67A5   0048
        ADDR    R0,     R7                      ; 67A6   00C7
        B       L_67E4                          ; 67A7   0200 003B
        B       L_67DD                          ; 67A9   0200 0032
        B       L_67DA                          ; 67AB   0200 002D
        B       L_67C6                          ; 67AD   0200 0017
        B       L_67B8                          ; 67AF   0200 0007

        MVII    #$0003, R2                      ; 67B1   02BA 0003

        JSR     R5,     L_551D                  ; 67B3   0004 0154 011D

        B       L_67CF                          ; 67B6   0200 0017

L_67B8:
        MVII    #$0001, R2                      ; 67B8   02BA 0001
L_67BA:
        PSHR    R2                              ; 67BA   0272

        JSR     R5,     L_551D                  ; 67BB   0004 0154 011D

        PULR    R2                              ; 67BE   02B2
        INCR    R2                              ; 67BF   000A
        CMP     G_0180, R2                      ; 67C0   0342 0180
        BLT     L_67BA                          ; 67C2   0225 0009
        B       L_67F2                          ; 67C4   0200 002C

L_67C6:
        MVII    #$0003, R2                      ; 67C6   02BA 0003
        MVII    #$002B, R0                      ; 67C8   02B8 002B
        MVII    #$0024, R4                      ; 67CA   02BC 0024

        JSR     R5,     L_5506                  ; 67CC   0004 0154 0106

L_67CF:
        MVII    #$0004, R2                      ; 67CF   02BA 0004
        MVII    #$002B, R0                      ; 67D1   02B8 002B
        MVII    #$0024, R4                      ; 67D3   02BC 0024

        JSR     R5,     L_5506                  ; 67D5   0004 0154 0106

        B       L_67DD                          ; 67D8   0200 0003

L_67DA:
        JSR     R5,     L_686A                  ; 67DA   0004 0168 006A

L_67DD:
        MVII    #$0002, R2                      ; 67DD   02BA 0002

        JSR     R5,     L_551D                  ; 67DF   0004 0154 011D

        B       L_67ED                          ; 67E2   0200 0009

L_67E4:
        MVII    #$0002, R2                      ; 67E4   02BA 0002
        MVII    #$002B, R0                      ; 67E6   02B8 002B
        MVII    #$0024, R4                      ; 67E8   02BC 0024

        JSR     R5,     L_5506                  ; 67EA   0004 0154 0106

L_67ED:
        MVII    #$0001, R2                      ; 67ED   02BA 0001

        JSR     R5,     L_551D                  ; 67EF   0004 0154 011D

L_67F2:
        SDBD                                    ; 67F2   0001
        MVII    #$5020, R1                      ; 67F3   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 67F6   0004 0118 0044

        SDBD                                    ; 67F9   0001
        MVII    #$5028, R1                      ; 67FA   02B9 0028 0050

        JSR     R5,     X_TIMER_START           ; 67FD   0004 0118 0044

        SDBD                                    ; 6800   0001
        MVII    #$501C, R1                      ; 6801   02B9 001C 0050

        JSR     R5,     X_TIMER_START           ; 6804   0004 0118 0044

        PULR    R7                              ; 6807   02B7

L_6808:
        MOVR    R2,     R0                      ; 6808   0090
        ANDI    #$0007, R0                      ; 6809   03B8 0007
        SDBD                                    ; 680B   0001
        MVII    #$53D1, R1                      ; 680C   02B9 00D1 0053
        ADDR    R0,     R1                      ; 680F   00C1
        MVI@    R1,     R0                      ; 6810   0288
        MVO@    R0,     R4                      ; 6811   0260
        ANDI    #$0038, R2                      ; 6812   03BA 0038
        BEQ     L_681D                          ; 6814   0204 0007

        SLR     R2,     2                       ; 6816   0066
        SLR     R2,     1                       ; 6817   0062
        SDBD                                    ; 6818   0001
        MVII    #$53D1, R1                      ; 6819   02B9 00D1 0053
        ADDR    R2,     R1                      ; 681C   00D1
L_681D:
        MVI@    R1,     R0                      ; 681D   0288
        MVO@    R0,     R4                      ; 681E   0260
        MOVR    R5,     R7                      ; 681F   00AF

L_6820:
        MVII    #$0040, R0                      ; 6820   02B8 0040
        MVO     R0,     G_0174                  ; 6822   0240 0174
        MVII    #$0001, R0                      ; 6824   02B8 0001
        MVII    #$0189, R4                      ; 6826   02BC 0189
L_6828:
        MVII    #$0174, R1                      ; 6828   02B9 0174
        MVI@    R4,     R2                      ; 682A   02A2
        CMPI    #$0001, R2                      ; 682B   037A 0001
        BNEQ    L_6835                          ; 682D   020C 0006

        MOVR    R0,     R2                      ; 682F   0082
L_6830:
        MVI@    R1,     R3                      ; 6830   028B
        XORR    R2,     R3                      ; 6831   01D3
        MVO@    R3,     R1                      ; 6832   024B
        B       L_6849                          ; 6833   0200 0014

L_6835:
        CMPI    #$0002, R2                      ; 6835   037A 0002
        BNEQ    L_683E                          ; 6837   020C 0005

L_6839:
        MOVR    R0,     R2                      ; 6839   0082
        SLL     R2,     2                       ; 683A   004E
        SLL     R2,     1                       ; 683B   004A
        B       L_6830                          ; 683C   0220 000D

L_683E:
        MVII    #$0173, R1                      ; 683E   02B9 0173
        CMPI    #$0003, R2                      ; 6840   037A 0003
        BEQ     L_6839                          ; 6842   0224 000A

        MOVR    R0,     R2                      ; 6844   0082
        XORI    #$0080, R2                      ; 6845   03FA 0080
        B       L_6830                          ; 6847   0220 0018

L_6849:
        INCR    R0                              ; 6849   0008
        CMPI    #$0005, R0                      ; 684A   0378 0005
        BNEQ    L_6828                          ; 684C   022C 0025
        MOVR    R5,     R7                      ; 684E   00AF

        PSHR    R5                              ; 684F   0275

        JSR     R5,     L_D181                  ; 6850   0004 01D0 0181

        ADDI    #$0000, R1                      ; 6853   02F9 0000
        MVI@    R1,     R0                      ; 6855   0288
        SDBD                                    ; 6856   0001
        XORI    #$1000, R0                      ; 6857   03F8 0000 0010
        MVO@    R0,     R1                      ; 685A   0248
        PULR    R7                              ; 685B   02B7

L_685C:
        PSHR    R5                              ; 685C   0275
        MVI     G_0180, R2                      ; 685D   0282 0180
        MVII    #$0050, R0                      ; 685F   02B8 0050
        MVII    #$001C, R4                      ; 6861   02BC 001C
        PSHR    R0                              ; 6863   0270
        PSHR    R4                              ; 6864   0274
        MVII    #$0003, R0                      ; 6865   02B8 0003
        J       L_550B                          ; 6867   0004 0354 010B

L_686A:
        PSHR    R5                              ; 686A   0275
        MVII    #$0003, R2                      ; 686B   02BA 0003
        MVII    #$0068, R0                      ; 686D   02B8 0068
        MVII    #$000F, R4                      ; 686F   02BC 000F
        PSHR    R0                              ; 6871   0270
        PSHR    R4                              ; 6872   0274
        MVII    #$0003, R0                      ; 6873   02B8 0003
        J       L_550B                          ; 6875   0004 0354 010B

        DECLE   $0006,  $0006,  $0006,  $0004   ; 6878   0006 0006 0006 0004
        DECLE   $0004,  $0004,  $000C,  $000C   ; 687C   0004 0004 000C 000C
        DECLE   $000C,  $0008,  $0008,  $0008   ; 6880   000C 0008 0008 0008
        DECLE   $0000,  $0002,  $0004,  $0000   ; 6884   0000 0002 0004 0000
        DECLE   $0002,  $0006,  $00FF,  $0081   ; 6888   0002 0006 00FF 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 688C   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6890   0081 0081 0081 0081
        DECLE   $0081,  $0081,  $0081,  $0081   ; 6894   0081 0081 0081 0081
        DECLE   $0081,  $00FF,  $00C0,  $00C0   ; 6898   0081 00FF 00C0 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 689C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68A4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00C0,  $0000   ; 68A8   0000 0000 00C0 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68AC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 68B8   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003C   ; 68BC   0000 0018 0018 003C
        DECLE   $003C,  $005C,  $0082,  $000C   ; 68C0   003C 005C 0082 000C
        DECLE   $0014,  $0014,  $0014,  $0014   ; 68C4   0014 0014 0014 0014
        DECLE   $0010,  $0014,  $0000,  $0000   ; 68C8   0010 0014 0000 0000
        DECLE   $0000,  $000C,  $000C,  $003D   ; 68CC   0000 000C 000C 003D
        DECLE   $005E,  $001C,  $0000,  $000C   ; 68D0   005E 001C 0000 000C
        DECLE   $0014,  $0014,  $0014,  $0014   ; 68D4   0014 0014 0014 0014
        DECLE   $0010,  $0014,  $0000,  $0000   ; 68D8   0010 0014 0000 0000
        DECLE   $0001,  $000D,  $000E,  $007E   ; 68DC   0001 000D 000E 007E
        DECLE   $001C,  $001C,  $0000,  $000C   ; 68E0   001C 001C 0000 000C
        DECLE   $0014,  $0014,  $0014,  $0014   ; 68E4   0014 0014 0014 0014
        DECLE   $0010,  $0014,  $0001,  $0001   ; 68E8   0010 0014 0001 0001
        DECLE   $0002,  $004E,  $004C,  $003C   ; 68EC   0002 004E 004C 003C
        DECLE   $001C,  $001C,  $0000,  $000C   ; 68F0   001C 001C 0000 000C
        DECLE   $0014,  $0014,  $0014,  $0012   ; 68F4   0014 0014 0014 0012
        DECLE   $0012,  $0006,  $0000,  $0000   ; 68F8   0012 0006 0000 0000
        DECLE   $0000,  $002D,  $002E,  $003C   ; 68FC   0000 002D 002E 003C
        DECLE   $001C,  $001C,  $0000,  $001C   ; 6900   001C 001C 0000 001C
        DECLE   $0014,  $0014,  $000C,  $0014   ; 6904   0014 0014 000C 0014
        DECLE   $0014,  $0004,  $0000,  $0000   ; 6908   0014 0004 0000 0000
        DECLE   $0010,  $002C,  $002C,  $003E   ; 690C   0010 002C 002C 003E
        DECLE   $001D,  $001D,  $0000,  $0018   ; 6910   001D 001D 0000 0018
        DECLE   $0014,  $0014,  $0014,  $0018   ; 6914   0014 0014 0014 0018
        DECLE   $0000,  $0008,  $0020,  $0020   ; 6918   0000 0008 0020 0020
        DECLE   $0020,  $002C,  $001C,  $001C   ; 691C   0020 002C 001C 001C
        DECLE   $001E,  $001E,  $0000,  $0018   ; 6920   001E 001E 0000 0018
        DECLE   $0014,  $0014,  $001C,  $0018   ; 6924   0014 0014 001C 0018
        DECLE   $0000,  $0008,  $0000,  $0000   ; 6928   0000 0008 0000 0000
        DECLE   $0000,  $002C,  $003C,  $001C   ; 692C   0000 002C 003C 001C
        DECLE   $001E,  $001E,  $0000,  $0018   ; 6930   001E 001E 0000 0018
        DECLE   $0014,  $0014,  $0014,  $0018   ; 6934   0014 0014 0014 0018
        DECLE   $0018,  $0010,  $0000,  $0000   ; 6938   0018 0010 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001C   ; 693C   0000 0018 0018 001C
        DECLE   $003F,  $00AD,  $00E1,  $009C   ; 6940   003F 00AD 00E1 009C
        DECLE   $0016,  $0012,  $0012,  $0002   ; 6944   0016 0012 0012 0002
        DECLE   $0012,  $0000,  $0000,  $0000   ; 6948   0012 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001C   ; 694C   0000 0018 0018 001C
        DECLE   $003F,  $00AD,  $00E1,  $009C   ; 6950   003F 00AD 00E1 009C
        DECLE   $0016,  $0012,  $0012,  $0002   ; 6954   0016 0012 0012 0002
        DECLE   $0012,  $0000,  $0000,  $0000   ; 6958   0012 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001C   ; 695C   0000 0018 0018 001C
        DECLE   $003F,  $00AD,  $00E1,  $009C   ; 6960   003F 00AD 00E1 009C
        DECLE   $0016,  $0012,  $0012,  $0002   ; 6964   0016 0012 0012 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6968   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $00D8,  $005C   ; 696C   0000 0018 00D8 005C
        DECLE   $007E,  $000E,  $0002,  $001C   ; 6970   007E 000E 0002 001C
        DECLE   $0014,  $0014,  $0018,  $0008   ; 6974   0014 0014 0018 0008
        DECLE   $0008,  $0008,  $0000,  $0000   ; 6978   0008 0008 0000 0000
        DECLE   $0000,  $0058,  $0058,  $005C   ; 697C   0000 0058 0058 005C
        DECLE   $003C,  $000C,  $0000,  $0018   ; 6980   003C 000C 0000 0018
        DECLE   $0014,  $0018,  $0018,  $0008   ; 6984   0014 0018 0018 0008
        DECLE   $0008,  $0008,  $0000,  $0000   ; 6988   0008 0008 0000 0000
        DECLE   $0000,  $0018,  $0018,  $00DC   ; 698C   0000 0018 0018 00DC
        DECLE   $007E,  $000C,  $0000,  $001C   ; 6990   007E 000C 0000 001C
        DECLE   $0014,  $0014,  $0014,  $000C   ; 6994   0014 0014 0014 000C
        DECLE   $000C,  $0004,  $0000,  $0000   ; 6998   000C 0004 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 699C   0000 0018 0018 001E
        DECLE   $003D,  $002D,  $0020,  $005C   ; 69A0   003D 002D 0020 005C
        DECLE   $0014,  $0014,  $0014,  $000C   ; 69A4   0014 0014 0014 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; 69A8   000C 0006 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 69AC   0000 0018 0018 0018
        DECLE   $001C,  $000C,  $0002,  $001D   ; 69B0   001C 000C 0002 001D
        DECLE   $0014,  $0014,  $000C,  $000C   ; 69B4   0014 0014 000C 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; 69B8   000C 0006 0000 0000
        DECLE   $0000,  $001A,  $001A,  $001A   ; 69BC   0000 001A 001A 001A
        DECLE   $000C,  $000C,  $0000,  $0018   ; 69C0   000C 000C 0000 0018
        DECLE   $0014,  $0014,  $0014,  $001C   ; 69C4   0014 0014 0014 001C
        DECLE   $000C,  $000E,  $0000,  $0000   ; 69C8   000C 000E 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 69CC   0000 0018 0018 0018
        DECLE   $001C,  $000C,  $0002,  $001D   ; 69D0   001C 000C 0002 001D
        DECLE   $0014,  $0014,  $000C,  $000C   ; 69D4   0014 0014 000C 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; 69D8   000C 0006 0000 0000
        DECLE   $0000,  $0018,  $00D8,  $005C   ; 69DC   0000 0018 00D8 005C
        DECLE   $007E,  $000E,  $0002,  $001C   ; 69E0   007E 000E 0002 001C
        DECLE   $0014,  $0014,  $0018,  $0008   ; 69E4   0014 0014 0018 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 69E8   0008 0000 0000 0000
        DECLE   $0000,  $0058,  $0058,  $005C   ; 69EC   0000 0058 0058 005C
        DECLE   $003C,  $000C,  $0000,  $0018   ; 69F0   003C 000C 0000 0018
        DECLE   $0014,  $0018,  $0018,  $0008   ; 69F4   0014 0018 0018 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 69F8   0008 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $00DC   ; 69FC   0000 0018 0018 00DC
        DECLE   $007E,  $000C,  $0000,  $001C   ; 6A00   007E 000C 0000 001C
        DECLE   $0014,  $0014,  $0014,  $000C   ; 6A04   0014 0014 0014 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6A08   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6A0C   0000 0018 0018 001E
        DECLE   $003D,  $002D,  $0020,  $005C   ; 6A10   003D 002D 0020 005C
        DECLE   $0014,  $0014,  $0014,  $000C   ; 6A14   0014 0014 0014 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6A18   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6A1C   0000 0018 0018 0018
        DECLE   $001C,  $000C,  $0002,  $001D   ; 6A20   001C 000C 0002 001D
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6A24   0014 0014 000C 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6A28   000C 0000 0000 0000
        DECLE   $0000,  $001A,  $001A,  $001A   ; 6A2C   0000 001A 001A 001A
        DECLE   $000C,  $000C,  $0000,  $0018   ; 6A30   000C 000C 0000 0018
        DECLE   $0014,  $0014,  $0014,  $001C   ; 6A34   0014 0014 0014 001C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6A38   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6A3C   0000 0018 0018 0018
        DECLE   $001C,  $000C,  $0002,  $001D   ; 6A40   001C 000C 0002 001D
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6A44   0014 0014 000C 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6A48   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $00D8,  $005C   ; 6A4C   0000 0018 00D8 005C
        DECLE   $007E,  $000E,  $0002,  $001C   ; 6A50   007E 000E 0002 001C
        DECLE   $0014,  $0014,  $0018,  $0008   ; 6A54   0014 0014 0018 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A58   0000 0000 0000 0000
        DECLE   $0000,  $0058,  $0058,  $005C   ; 6A5C   0000 0058 0058 005C
        DECLE   $003C,  $000C,  $0000,  $0018   ; 6A60   003C 000C 0000 0018
        DECLE   $0014,  $0018,  $0018,  $0008   ; 6A64   0014 0018 0018 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A68   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $00DC   ; 6A6C   0000 0018 0018 00DC
        DECLE   $007E,  $000C,  $0000,  $001C   ; 6A70   007E 000C 0000 001C
        DECLE   $0014,  $0014,  $0014,  $000C   ; 6A74   0014 0014 0014 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A78   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6A7C   0000 0018 0018 001E
        DECLE   $003D,  $002D,  $0020,  $005C   ; 6A80   003D 002D 0020 005C
        DECLE   $0014,  $0014,  $0014,  $000C   ; 6A84   0014 0014 0014 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A88   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6A8C   0000 0018 0018 0018
        DECLE   $001C,  $000C,  $0002,  $001D   ; 6A90   001C 000C 0002 001D
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6A94   0014 0014 000C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6A98   0000 0000 0000 0000
        DECLE   $0000,  $001A,  $001A,  $001A   ; 6A9C   0000 001A 001A 001A
        DECLE   $000C,  $000C,  $0000,  $0018   ; 6AA0   000C 000C 0000 0018
        DECLE   $0014,  $0014,  $0014,  $001C   ; 6AA4   0014 0014 0014 001C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AA8   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6AAC   0000 0018 0018 0018
        DECLE   $001C,  $000C,  $0002,  $001D   ; 6AB0   001C 000C 0002 001D
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6AB4   0014 0014 000C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6AB8   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6ABC   0000 0018 0018 001E
        DECLE   $003D,  $002D,  $0038,  $001C   ; 6AC0   003D 002D 0038 001C
        DECLE   $001C,  $0014,  $0014,  $000C   ; 6AC4   001C 0014 0014 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; 6AC8   000C 0006 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6ACC   0000 0018 0018 0018
        DECLE   $003D,  $003E,  $0000,  $001C   ; 6AD0   003D 003E 0000 001C
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6AD4   0014 0014 000C 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; 6AD8   000C 0006 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6ADC   0000 0018 0018 0018
        DECLE   $0038,  $003F,  $0000,  $0018   ; 6AE0   0038 003F 0000 0018
        DECLE   $001C,  $0014,  $000C,  $000C   ; 6AE4   001C 0014 000C 000C
        DECLE   $0004,  $0006,  $0000,  $0000   ; 6AE8   0004 0006 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6AEC   0000 0018 0018 0018
        DECLE   $001C,  $001C,  $0002,  $001D   ; 6AF0   001C 001C 0002 001D
        DECLE   $0014,  $0014,  $001C,  $0004   ; 6AF4   0014 0014 001C 0004
        DECLE   $000C,  $000E,  $0000,  $0000   ; 6AF8   000C 000E 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001C   ; 6AFC   0000 0018 0018 001C
        DECLE   $003E,  $002D,  $0021,  $005C   ; 6B00   003E 002D 0021 005C
        DECLE   $0054,  $0054,  $0014,  $000C   ; 6B04   0054 0054 0014 000C
        DECLE   $000C,  $0006,  $0000,  $0000   ; 6B08   000C 0006 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6B0C   0000 0018 0018 001E
        DECLE   $003D,  $002D,  $0038,  $001C   ; 6B10   003D 002D 0038 001C
        DECLE   $001C,  $0014,  $0014,  $000C   ; 6B14   001C 0014 0014 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6B18   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6B1C   0000 0018 0018 0018
        DECLE   $003D,  $003E,  $0000,  $001C   ; 6B20   003D 003E 0000 001C
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6B24   0014 0014 000C 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6B28   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6B2C   0000 0018 0018 0018
        DECLE   $0038,  $003F,  $0000,  $0018   ; 6B30   0038 003F 0000 0018
        DECLE   $001C,  $0014,  $000C,  $000C   ; 6B34   001C 0014 000C 000C
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6B38   0004 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6B3C   0000 0018 0018 0018
        DECLE   $001C,  $001C,  $0002,  $001D   ; 6B40   001C 001C 0002 001D
        DECLE   $0014,  $0014,  $001C,  $0004   ; 6B44   0014 0014 001C 0004
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6B48   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001C   ; 6B4C   0000 0018 0018 001C
        DECLE   $003E,  $002D,  $0021,  $005C   ; 6B50   003E 002D 0021 005C
        DECLE   $0054,  $0054,  $0014,  $000C   ; 6B54   0054 0054 0014 000C
        DECLE   $000C,  $0000,  $0000,  $0000   ; 6B58   000C 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6B5C   0000 0018 0018 001E
        DECLE   $003D,  $002D,  $0038,  $001C   ; 6B60   003D 002D 0038 001C
        DECLE   $001C,  $0014,  $0014,  $000C   ; 6B64   001C 0014 0014 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B68   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6B6C   0000 0018 0018 0018
        DECLE   $003D,  $003E,  $0000,  $001C   ; 6B70   003D 003E 0000 001C
        DECLE   $0014,  $0014,  $000C,  $000C   ; 6B74   0014 0014 000C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B78   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6B7C   0000 0018 0018 0018
        DECLE   $0038,  $003F,  $0000,  $0018   ; 6B80   0038 003F 0000 0018
        DECLE   $001C,  $0014,  $000C,  $000C   ; 6B84   001C 0014 000C 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B88   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $0018   ; 6B8C   0000 0018 0018 0018
        DECLE   $001C,  $001C,  $0002,  $001D   ; 6B90   001C 001C 0002 001D
        DECLE   $0014,  $0014,  $001C,  $0004   ; 6B94   0014 0014 001C 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6B98   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001C   ; 6B9C   0000 0018 0018 001C
        DECLE   $003E,  $002D,  $0021,  $005C   ; 6BA0   003E 002D 0021 005C
        DECLE   $0054,  $0054,  $0014,  $000C   ; 6BA4   0054 0054 0014 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6BA8   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003D   ; 6BAC   0000 0018 0018 003D
        DECLE   $00BE,  $00DC,  $0080,  $000C   ; 6BB0   00BE 00DC 0080 000C
        DECLE   $0012,  $0012,  $0012,  $0012   ; 6BB4   0012 0012 0012 0012
        DECLE   $0002,  $0012,  $0000,  $0000   ; 6BB8   0002 0012 0000 0000
        DECLE   $0000,  $0019,  $0099,  $007E   ; 6BBC   0000 0019 0099 007E
        DECLE   $001C,  $001C,  $0000,  $000C   ; 6BC0   001C 001C 0000 000C
        DECLE   $0012,  $0012,  $0012,  $0012   ; 6BC4   0012 0012 0012 0012
        DECLE   $0002,  $0012,  $0000,  $0001   ; 6BC8   0002 0012 0000 0001
        DECLE   $000D,  $008E,  $007E,  $001C   ; 6BCC   000D 008E 007E 001C
        DECLE   $001C,  $001C,  $0000,  $000E   ; 6BD0   001C 001C 0000 000E
        DECLE   $0012,  $0012,  $0012,  $0012   ; 6BD4   0012 0012 0012 0012
        DECLE   $0010,  $0012,  $0000,  $0000   ; 6BD8   0010 0012 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003E   ; 6BDC   0000 0018 0018 003E
        DECLE   $002D,  $00ED,  $0080,  $009E   ; 6BE0   002D 00ED 0080 009E
        DECLE   $0012,  $0012,  $0016,  $0014   ; 6BE4   0012 0012 0016 0014
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6BE8   0010 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6BEC   0000 0018 0018 001E
        DECLE   $003D,  $00AD,  $00C1,  $009E   ; 6BF0   003D 00AD 00C1 009E
        DECLE   $0012,  $0012,  $001A,  $000A   ; 6BF4   0012 0012 001A 000A
        DECLE   $000A,  $0002,  $0000,  $0000   ; 6BF8   000A 0002 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6BFC   0000 0018 0018 001E
        DECLE   $003E,  $00AD,  $00A1,  $00DE   ; 6C00   003E 00AD 00A1 00DE
        DECLE   $0012,  $001A,  $000E,  $000C   ; 6C04   0012 001A 000E 000C
        DECLE   $0004,  $0006,  $0000,  $0000   ; 6C08   0004 0006 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6C0C   0000 0018 0018 001E
        DECLE   $00BD,  $00AD,  $00C2,  $001E   ; 6C10   00BD 00AD 00C2 001E
        DECLE   $0012,  $0012,  $0012,  $0016   ; 6C14   0012 0012 0012 0016
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6C18   0014 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003E   ; 6C1C   0000 0018 0018 003E
        DECLE   $00AD,  $00CD,  $0081,  $001E   ; 6C20   00AD 00CD 0081 001E
        DECLE   $0012,  $0016,  $0014,  $0008   ; 6C24   0012 0016 0014 0008
        DECLE   $0008,  $0018,  $0000,  $0000   ; 6C28   0008 0018 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003E   ; 6C2C   0000 0018 0018 003E
        DECLE   $002D,  $00ED,  $0080,  $009E   ; 6C30   002D 00ED 0080 009E
        DECLE   $0012,  $0012,  $0016,  $0014   ; 6C34   0012 0012 0016 0014
        DECLE   $0010,  $0000,  $0000,  $0000   ; 6C38   0010 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6C3C   0000 0018 0018 001E
        DECLE   $003D,  $00AD,  $00C1,  $009E   ; 6C40   003D 00AD 00C1 009E
        DECLE   $0012,  $0012,  $001A,  $000A   ; 6C44   0012 0012 001A 000A
        DECLE   $000A,  $0000,  $0000,  $0000   ; 6C48   000A 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6C4C   0000 0018 0018 001E
        DECLE   $003E,  $00AD,  $00A1,  $00DE   ; 6C50   003E 00AD 00A1 00DE
        DECLE   $0012,  $001A,  $000E,  $000C   ; 6C54   0012 001A 000E 000C
        DECLE   $0004,  $0000,  $0000,  $0000   ; 6C58   0004 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6C5C   0000 0018 0018 001E
        DECLE   $00BD,  $00AD,  $00C2,  $001E   ; 6C60   00BD 00AD 00C2 001E
        DECLE   $0012,  $0012,  $0012,  $0016   ; 6C64   0012 0012 0012 0016
        DECLE   $0014,  $0000,  $0000,  $0000   ; 6C68   0014 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003E   ; 6C6C   0000 0018 0018 003E
        DECLE   $00AD,  $00CD,  $0081,  $001E   ; 6C70   00AD 00CD 0081 001E
        DECLE   $0012,  $0016,  $0014,  $0008   ; 6C74   0012 0016 0014 0008
        DECLE   $0008,  $0000,  $0000,  $0000   ; 6C78   0008 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003E   ; 6C7C   0000 0018 0018 003E
        DECLE   $002D,  $00ED,  $0080,  $009E   ; 6C80   002D 00ED 0080 009E
        DECLE   $0012,  $0012,  $0016,  $0014   ; 6C84   0012 0012 0016 0014
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C88   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6C8C   0000 0018 0018 001E
        DECLE   $003D,  $00AD,  $00C1,  $009E   ; 6C90   003D 00AD 00C1 009E
        DECLE   $0012,  $0012,  $001A,  $000A   ; 6C94   0012 0012 001A 000A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6C98   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6C9C   0000 0018 0018 001E
        DECLE   $003E,  $00AD,  $00A1,  $00DE   ; 6CA0   003E 00AD 00A1 00DE
        DECLE   $0012,  $001A,  $000E,  $000C   ; 6CA4   0012 001A 000E 000C
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CA8   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $001E   ; 6CAC   0000 0018 0018 001E
        DECLE   $00BD,  $00AD,  $00C2,  $001E   ; 6CB0   00BD 00AD 00C2 001E
        DECLE   $0012,  $0012,  $0012,  $0016   ; 6CB4   0012 0012 0012 0016
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CB8   0000 0000 0000 0000
        DECLE   $0000,  $0018,  $0018,  $003E   ; 6CBC   0000 0018 0018 003E
        DECLE   $00AD,  $00CD,  $0081,  $001E   ; 6CC0   00AD 00CD 0081 001E
        DECLE   $0012,  $0016,  $0014,  $0008   ; 6CC4   0012 0016 0014 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0058   ; 6CD4   0000 0000 0020 0058
        DECLE   $0050,  $0020,  $0000,  $0000   ; 6CD8   0050 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CDC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; 6CE0   0000 0000 0000 0030
        DECLE   $004C,  $0030,  $0000,  $0000   ; 6CE4   004C 0030 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CE8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $0050   ; 6CEC   0000 0000 0060 0050
        DECLE   $0050,  $0030,  $0018,  $0004   ; 6CF0   0050 0030 0018 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6CF8   0000 0000 0000 0000
        DECLE   $0000,  $000C,  $0014,  $0018   ; 6CFC   0000 000C 0014 0018
        DECLE   $0020,  $0040,  $0000,  $0000   ; 6D00   0020 0040 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D04   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D08   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000C   ; 6D0C   0000 0000 0000 000C
        DECLE   $000C,  $0010,  $0000,  $0000   ; 6D10   000C 0010 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; 6D1C   0000 0000 0000 0004
        DECLE   $000C,  $0004,  $0000,  $0000   ; 6D20   000C 0004 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0020,  $0050   ; 6D28   0000 0000 0020 0050
        DECLE   $0050,  $0020,  $0020,  $0000   ; 6D2C   0050 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D30   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D34   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 6D3C   0000 0000 0000 0020
        DECLE   $0050,  $0020,  $0000,  $0000   ; 6D40   0050 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D44   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0030   ; 6D5C   0000 0000 0000 0030
        DECLE   $0028,  $0030,  $0018,  $0008   ; 6D60   0028 0030 0018 0008
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0005   ; 6D68   0000 0000 0002 0005
        DECLE   $0005,  $0005,  $0005,  $0002   ; 6D6C   0005 0005 0005 0002
        DECLE   $0002,  $0002,  $0000,  $0000   ; 6D70   0002 0002 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D78   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0060   ; 6D7C   0000 0000 0000 0060
        DECLE   $0050,  $0050,  $0030,  $0008   ; 6D80   0050 0050 0030 0008
        DECLE   $0008,  $0008,  $0000,  $0000   ; 6D84   0008 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D88   0000 0000 0000 0000
        DECLE   $0018,  $0024,  $0023,  $0024   ; 6D8C   0018 0024 0023 0024
        DECLE   $0018,  $0000,  $0000,  $0000   ; 6D90   0018 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6D9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DBC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DD4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $000C,  $0012   ; 6DD8   0000 0000 000C 0012
        DECLE   $0012,  $001C,  $0020,  $0000   ; 6DDC   0012 001C 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE0   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DE8   0000 0000 0000 0000
        DECLE   $0006,  $0009,  $0009,  $0019   ; 6DEC   0006 0009 0009 0019
        DECLE   $0016,  $0000,  $0000,  $0000   ; 6DF0   0016 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DF8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6DFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E00   0000 0000 0000 0000
        DECLE   $0020,  $0018,  $000C,  $000A   ; 6E04   0020 0018 000C 000A
        DECLE   $000A,  $0006,  $0000,  $0000   ; 6E08   000A 0006 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E10   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E14   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E20   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E24   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0020   ; 6E30   0000 0000 0000 0020
        DECLE   $0050,  $0020,  $0020,  $0000   ; 6E34   0050 0020 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E3C   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $000A,  $000C   ; 6E40   0000 0006 000A 000C
        DECLE   $0010,  $0020,  $0000,  $0000   ; 6E44   0010 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E4C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E50   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6E58   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0078   ; 6E5C   0000 0030 0030 0078
        DECLE   $0078,  $007C,  $0060,  $0038   ; 6E60   0078 007C 0060 0038
        DECLE   $0028,  $0028,  $0018,  $0018   ; 6E64   0028 0028 0018 0018
        DECLE   $0018,  $0020,  $0000,  $0000   ; 6E68   0018 0020 0000 0000
        DECLE   $0000,  $0030,  $0034,  $007C   ; 6E6C   0000 0030 0034 007C
        DECLE   $0078,  $0078,  $0080,  $0018   ; 6E70   0078 0078 0080 0018
        DECLE   $0028,  $0028,  $0028,  $0018   ; 6E74   0028 0028 0028 0018
        DECLE   $0018,  $0020,  $0000,  $0008   ; 6E78   0018 0020 0000 0008
        DECLE   $0008,  $0038,  $0038,  $0078   ; 6E7C   0008 0038 0038 0078
        DECLE   $00F8,  $0070,  $0000,  $0018   ; 6E80   00F8 0070 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0018   ; 6E84   0028 0028 0028 0018
        DECLE   $0018,  $0020,  $0008,  $0008   ; 6E88   0018 0020 0008 0008
        DECLE   $0008,  $0038,  $0078,  $00C8   ; 6E8C   0008 0038 0078 00C8
        DECLE   $00D0,  $0020,  $0000,  $0018   ; 6E90   00D0 0020 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0020   ; 6E94   0028 0028 0028 0020
        DECLE   $0028,  $0020,  $0008,  $0008   ; 6E98   0028 0020 0008 0008
        DECLE   $0048,  $0098,  $00C0,  $0050   ; 6E9C   0048 0098 00C0 0050
        DECLE   $0020,  $0030,  $0000,  $0018   ; 6EA0   0020 0030 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0020   ; 6EA4   0028 0028 0028 0020
        DECLE   $0028,  $0020,  $0000,  $0040   ; 6EA8   0028 0020 0000 0040
        DECLE   $0080,  $0014,  $003C,  $0078   ; 6EAC   0080 0014 003C 0078
        DECLE   $0038,  $0030,  $0000,  $0018   ; 6EB0   0038 0030 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0028   ; 6EB4   0028 0028 0028 0028
        DECLE   $0008,  $0020,  $0000,  $0040   ; 6EB8   0008 0020 0000 0040
        DECLE   $0040,  $0070,  $0074,  $007C   ; 6EBC   0040 0070 0074 007C
        DECLE   $0038,  $0038,  $0000,  $0018   ; 6EC0   0038 0038 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0008   ; 6EC4   0028 0028 0028 0008
        DECLE   $0028,  $0008,  $0000,  $0040   ; 6EC8   0028 0008 0000 0040
        DECLE   $0040,  $0070,  $0074,  $003C   ; 6ECC   0040 0070 0074 003C
        DECLE   $0038,  $0038,  $0000,  $0018   ; 6ED0   0038 0038 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0008   ; 6ED4   0028 0028 0028 0008
        DECLE   $0028,  $0008,  $0000,  $0000   ; 6ED8   0028 0008 0000 0000
        DECLE   $0000,  $0000,  $0030,  $0030   ; 6EDC   0000 0000 0030 0030
        DECLE   $0078,  $00FC,  $00BA,  $0080   ; 6EE0   0078 00FC 00BA 0080
        DECLE   $0038,  $0028,  $0028,  $0028   ; 6EE4   0038 0028 0028 0028
        DECLE   $0008,  $0028,  $0000,  $0000   ; 6EE8   0008 0028 0000 0000
        DECLE   $0000,  $0030,  $0030,  $0078   ; 6EEC   0000 0030 0030 0078
        DECLE   $007E,  $007C,  $00C0,  $0038   ; 6EF0   007E 007C 00C0 0038
        DECLE   $0028,  $0028,  $0028,  $0028   ; 6EF4   0028 0028 0028 0028
        DECLE   $0008,  $0028,  $0000,  $0008   ; 6EF8   0008 0028 0000 0008
        DECLE   $0008,  $0038,  $0038,  $0078   ; 6EFC   0008 0038 0038 0078
        DECLE   $00F8,  $0070,  $0000,  $0018   ; 6F00   00F8 0070 0000 0018
        DECLE   $0028,  $0028,  $0028,  $0018   ; 6F04   0028 0028 0028 0018
        DECLE   $0018,  $0020,  $0000,  $0000   ; 6F08   0018 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F0C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F10   0000 0000 0000 0000
        DECLE   $0040,  $00A0,  $0040,  $0000   ; 6F14   0040 00A0 0040 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F18   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F1C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F20   0000 0000 0000 0000
        DECLE   $0080,  $00C0,  $0080,  $0000   ; 6F24   0080 00C0 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F28   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0040   ; 6F30   0000 0000 0040 0040
        DECLE   $0040,  $0000,  $0000,  $0000   ; 6F34   0040 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F38   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F3C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0006,  $0005   ; 6F40   0000 0000 0006 0005
        DECLE   $0003,  $0000,  $0000,  $0000   ; 6F44   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F4C   0000 0000 0000 0000
        DECLE   $0004,  $0007,  $0005,  $0003   ; 6F50   0004 0007 0005 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F54   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F58   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6F5C   0000 0000 0000 0008
        DECLE   $0014,  $0008,  $0000,  $0000   ; 6F60   0014 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F64   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0014   ; 6F68   0000 0000 0008 0014
        DECLE   $0014,  $0008,  $0000,  $0000   ; 6F6C   0014 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F70   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F74   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; 6F78   0000 0000 0000 0008
        DECLE   $0014,  $0008,  $0000,  $0000   ; 6F7C   0014 0008 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F80   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F84   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F88   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F8C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F90   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F98   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6F9C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA0   0000 0000 0000 0000
        DECLE   $0000,  $0001,  $0003,  $0001   ; 6FA4   0000 0001 0003 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FA8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FAC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB0   0000 0000 0000 0000
        DECLE   $0001,  $0003,  $0001,  $0000   ; 6FB4   0001 0003 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FBC   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 6FC0   0000 0000

        EIS                                     ; 6FC2   0002
        EIS                                     ; 6FC3   0002
        EIS                                     ; 6FC4   0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FC9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FCD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FD9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FDD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FE9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FED   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 6FF9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000           ; 6FFD   0000 0000 0000

        ORG     $D000
L_D000:
        PSHR    R5                              ; D000   0275
        INCR    R1                              ; D001   0009
        MVI     G_017E, R2                      ; D002   0282 017E
        TSTR    R2                              ; D004   0092
        BEQ     L_D039                          ; D005   0204 0032

        MVII    #$0004, R3                      ; D007   02BB 0004
        MVII    #$0181, R4                      ; D009   02BC 0181
L_D00B:
        CMP@    R4,     R1                      ; D00B   0361
        BEQ     L_D012                          ; D00C   0204 0004

        DECR    R3                              ; D00E   0013
        BNEQ    L_D00B                          ; D00F   022C 0005
        PULR    R7                              ; D011   02B7

L_D012:
        CMPI    #$0002, R2                      ; D012   037A 0002
        BEQ     L_D039                          ; D014   0204 0023

        MVII    #$0002, R2                      ; D016   02BA 0002
        MVO     R2,     G_017E                  ; D018   0242 017E
        MVII    #$0004, R3                      ; D01A   02BB 0004
        MVII    #$0181, R5                      ; D01C   02BD 0181
        MVII    #$018D, R4                      ; D01E   02BC 018D
L_D020:
        MVI@    R5,     R2                      ; D020   02AA
        MVO@    R2,     R4                      ; D021   0262
        DECR    R3                              ; D022   0013
        BNEQ    L_D020                          ; D023   022C 0004

        MVII    #$018C, R4                      ; D025   02BC 018C
        ADDR    R1,     R4                      ; D027   00CC
        MVO@    R3,     R4                      ; D028   0263
        MVII    #$0181, R4                      ; D029   02BC 0181
        MVO@    R1,     R4                      ; D02B   0261
        PSHR    R0                              ; D02C   0270
        MVII    #$0003, R0                      ; D02D   02B8 0003

        JSR     R5,     X_FILL_ZERO             ; D02F   0004 0114 0338

        PULR    R0                              ; D032   02B0
        MVII    #$0175, R4                      ; D033   02BC 0175
        ADDR    R1,     R4                      ; D035   00CC
        MVI     G_0180, R2                      ; D036   0282 0180
        MVO@    R2,     R4                      ; D038   0262
L_D039:
        MVII    #$0175, R4                      ; D039   02BC 0175
        ADDR    R1,     R4                      ; D03B   00CC
        MVI@    R4,     R2                      ; D03C   02A2
        TSTR    R2                              ; D03D   0092
        BEQ     L_D081                          ; D03E   0204 0041

        MVII    #$016E, R3                      ; D040   02BB 016E
        ADDR    R2,     R3                      ; D042   00D3
        MVI@    R3,     R3                      ; D043   029B
        TSTR    R3                              ; D044   009B
        BNEQ    L_D081                          ; D045   020C 003A

        MVII    #$0160, R3                      ; D047   02BB 0160
        ADDR    R2,     R3                      ; D049   00D3
        MVI@    R3,     R3                      ; D04A   029B
        ANDI    #$0003, R3                      ; D04B   03BB 0003
        BNEQ    L_D081                          ; D04D   020C 0032

        MOVR    R0,     R3                      ; D04F   0083
        TSTR    R0                              ; D050   0080
        BMI     L_D06E                          ; D051   020B 001B

        MVII    #$019F, R1                      ; D053   02B9 019F
        ADDR    R2,     R1                      ; D055   00D1
        MVO@    R3,     R1                      ; D056   024B

        JSR     R5,     L_D168                  ; D057   0004 01D0 0168

        BNEQ    L_D061                          ; D05A   020C 0005

        MVII    #$01F0, R0                      ; D05C   02B8 01F0

        JSR     R5,     L_5A99                  ; D05E   0004 0158 0299
L_D061:
        JSR     R5,     L_645D                  ; D061   0004 0164 005D
        JSR     R5,     L_D082                  ; D064   0004 01D0 0082
        JSR     R5,     L_D092                  ; D067   0004 01D0 0092
        JSR     R5,     L_6336                  ; D06A   0004 0160 0336

        PULR    R7                              ; D06D   02B7

L_D06E:
        CLRR    R0                              ; D06E   01C0
        MVII    #$0179, R1                      ; D06F   02B9 0179
        ADDR    R2,     R1                      ; D071   00D1
        MVO@    R0,     R1                      ; D072   0248

        JSR     R5,     L_D082                  ; D073   0004 01D0 0082

        SDBD                                    ; D076   0001
        MVII    #$5158, R3                      ; D077   02BB 0058 0051

        JSR     R5,     L_D0C9                  ; D07A   0004 01D0 00C9

        ADDI    #$0004, R1                      ; D07D   02F9 0004
        CLRR    R0                              ; D07F   01C0
        MVO@    R0,     R1                      ; D080   0248
L_D081:
        PULR    R7                              ; D081   02B7

L_D082:
        PSHR    R5                              ; D082   0275
        MOVR    R3,     R1                      ; D083   0099

        JSR     R5,     .EXEC.629               ; D084   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; D087   0004 0114 0357

        ADDR    R0,     R0                      ; D08A   00C0

        JSR     R5,     X_PACK_BYTES            ; D08B   0004 0114 034F
        JSR     R5,     L_5A8D                  ; D08E   0004 0158 028D

        PULR    R7                              ; D091   02B7

L_D092:
        PSHR    R5                              ; D092   0275
        MVII    #$0179, R1                      ; D093   02B9 0179
        ADDR    R2,     R1                      ; D095   00D1
        CMPI    #$000F, R3                      ; D096   037B 000F
        BEQ     L_D0A6                          ; D098   0204 000C

        CMPI    #$0009, R3                      ; D09A   037B 0009
        BGT     L_D0C1                          ; D09C   020E 0023

        CMPI    #$0006, R3                      ; D09E   037B 0006
        BGT     L_D0B9                          ; D0A0   020E 0017

        CMPI    #$0001, R3                      ; D0A2   037B 0001
        BGT     L_D0B1                          ; D0A4   020E 000B

L_D0A6:
        MVII    #$0001, R0                      ; D0A6   02B8 0001
        SDBD                                    ; D0A8   0001
        MVII    #$51BA, R3                      ; D0A9   02BB 00BA 0051
L_D0AC:
        MVO@    R0,     R1                      ; D0AC   0248

        JSR     R5,     L_D0C9                  ; D0AD   0004 01D0 00C9

        PULR    R7                              ; D0B0   02B7

L_D0B1:
        MVII    #$0002, R0                      ; D0B1   02B8 0002
        SDBD                                    ; D0B3   0001
        MVII    #$51BA, R3                      ; D0B4   02BB 00BA 0051
        B       L_D0AC                          ; D0B7   0220 000C

L_D0B9:
        MVII    #$0003, R0                      ; D0B9   02B8 0003
        SDBD                                    ; D0BB   0001
        MVII    #$51BA, R3                      ; D0BC   02BB 00BA 0051
        B       L_D0AC                          ; D0BF   0220 0014

L_D0C1:
        MVII    #$0004, R0                      ; D0C1   02B8 0004
        SDBD                                    ; D0C3   0001
        MVII    #$51A5, R3                      ; D0C4   02BB 00A5 0051
        B       L_D0AC                          ; D0C7   0220 001C

L_D0C9:
        PSHR    R5                              ; D0C9   0275
        PSHR    R2                              ; D0CA   0272

        JSR     R5,     L_D181                  ; D0CB   0004 01D0 0181

        MVII    #$016E, R4                      ; D0CE   02BC 016E
        ADDR    R2,     R4                      ; D0D0   00D4
        MVI@    R4,     R0                      ; D0D1   02A0
        CMPI    #$0001, R0                      ; D0D2   0378 0001
        BEQ     L_D0DA                          ; D0D4   0204 0004

        CMPI    #$0005, R0                      ; D0D6   0378 0005
        BNEQ    L_D0E7                          ; D0D8   020C 000D

L_D0DA:
        ADDI    #$0006, R1                      ; D0DA   02F9 0006
        MVI@    R1,     R0                      ; D0DC   0288
        SUBI    #$0006, R1                      ; D0DD   0339 0006
        CMPI    #$0001, R0                      ; D0DF   0378 0001
        BGT     L_D0E7                          ; D0E1   020E 0004

        SDBD                                    ; D0E3   0001
        MVII    #$5158, R3                      ; D0E4   02BB 0058 0051
L_D0E7:
        ADDI    #$0003, R1                      ; D0E7   02F9 0003
        MVI@    R1,     R0                      ; D0E9   0288
        CLRR    R2                              ; D0EA   01D2
        SDBD                                    ; D0EB   0001
        CMPI    #$51A5, R3                      ; D0EC   037B 00A5 0051
        BEQ     L_D0F3                          ; D0EF   0204 0002

        MVII    #$0200, R2                      ; D0F1   02BA 0200
L_D0F3:
        SDBD                                    ; D0F3   0001
        CMPI    #$2D00, R0                      ; D0F4   0378 0000 002D
        BGT     L_D13F                          ; D0F7   020E 0046

        SDBD                                    ; D0F9   0001
        ADDI    #$2600, R2                      ; D0FA   02FA 0000 0026
        SUBR    R2,     R0                      ; D0FD   0110
        BMI     L_D122                          ; D0FE   020B 0022

        JSR     R5,     L_D15C                  ; D100   0004 01D0 015C

        MVII    #$0020, R4                      ; D103   02BC 0020
        DECR    R1                              ; D105   0011
        MVI@    R1,     R2                      ; D106   028A
        SDBD                                    ; D107   0001
        ANDI    #$FF00, R2                      ; D108   03BA 0000 00FF
        SWAP    R2,     1                       ; D10B   0042
        CMPI    #$0024, R2                      ; D10C   037A 0024
        BLE     L_D122                          ; D10E   0206 0012

        CMPI    #$002B, R2                      ; D110   037A 002B
        BLT     L_D123                          ; D112   0205 000F

        CMPI    #$0093, R2                      ; D114   037A 0093
        BGE     L_D122                          ; D116   020D 000A

        CMPI    #$008D, R2                      ; D118   037A 008D
        BGT     L_D123                          ; D11A   020E 0007

        MVII    #$0007, R1                      ; D11C   02B9 0007

        JSR     R5,     X_MPY                   ; D11E   0004 011C 01DC

        ADDR    R2,     R3                      ; D121   00D3
L_D122:
        CLRR    R4                              ; D122   01E4
L_D123:
        PULR    R2                              ; D123   02B2

L_D124:
        JSR     R5,     L_D181                  ; D124   0004 01D0 0181

        MVI@    R1,     R0                      ; D127   0288
        PSHR    R1                              ; D128   0271
        MVII    #$016E, R1                      ; D129   02B9 016E
        ADDR    R2,     R1                      ; D12B   00D1
        MVI@    R1,     R1                      ; D12C   0289
        TSTR    R1                              ; D12D   0089
        PULR    R1                              ; D12E   02B1
        BNEQ    L_D135                          ; D12F   020C 0004

        SDBD                                    ; D131   0001
        ANDI    #$FDFF, R0                      ; D132   03B8 00FF 00FD
L_D135:
        SDBD                                    ; D135   0001
        ANDI    #$FFDF, R0                      ; D136   03B8 00DF 00FF
        XORR    R4,     R0                      ; D139   01E0
        MVO@    R0,     R1                      ; D13A   0248
        ADDI    #$0001, R1                      ; D13B   02F9 0001
        MVO@    R3,     R1                      ; D13D   024B
        PULR    R7                              ; D13E   02B7

L_D13F:
        SDBD                                    ; D13F   0001
        ADDI    #$5500, R2                      ; D140   02FA 0000 0055
        SUBR    R2,     R0                      ; D143   0110
        BMI     L_D14F                          ; D144   020B 0009

        JSR     R5,     L_D15C                  ; D146   0004 01D0 015C

        MVII    #$0007, R1                      ; D149   02B9 0007

        JSR     R5,     X_MPY                   ; D14B   0004 011C 01DC

        ADDR    R2,     R3                      ; D14E   00D3
L_D14F:
        CLRR    R4                              ; D14F   01E4
        PULR    R2                              ; D150   02B2
        MVII    #$016E, R1                      ; D151   02B9 016E
        ADDR    R2,     R1                      ; D153   00D1
        MVI@    R1,     R1                      ; D154   0289
        TSTR    R1                              ; D155   0089
        BNEQ    L_D124                          ; D156   022C 0033

        MVII    #$0200, R4                      ; D158   02BC 0200
        B       L_D124                          ; D15A   0220 0037

L_D15C:
        SDBD                                    ; D15C   0001
        ANDI    #$FF00, R0                      ; D15D   03B8 0000 00FF
        SWAP    R0,     1                       ; D160   0040
        CMPI    #$0002, R0                      ; D161   0378 0002
        BLE     L_D167                          ; D163   0206 0002

        MVII    #$0002, R0                      ; D165   02B8 0002
L_D167:
        MOVR    R5,     R7                      ; D167   00AF

L_D168:
        PSHR    R5                              ; D168   0275

        JSR     R5,     L_D181                  ; D169   0004 01D0 0181

        ADDI    #$0004, R1                      ; D16C   02F9 0004
        MVI@    R1,     R1                      ; D16E   0289
        TSTR    R1                              ; D16F   0089
        PULR    R7                              ; D170   02B7

L_D171:
        PSHR    R5                              ; D171   0275
        PSHR    R0                              ; D172   0270
        PSHR    R1                              ; D173   0271

        JSR     R5,     L_D181                  ; D174   0004 01D0 0181

        ADDI    #$0003, R1                      ; D177   02F9 0003
        MVI@    R1,     R1                      ; D179   0289
        SDBD                                    ; D17A   0001
        CMPI    #$2D00, R1                      ; D17B   0379 0000 002D
        PULR    R1                              ; D17E   02B1
        PULR    R0                              ; D17F   02B0
        PULR    R7                              ; D180   02B7

L_D181:
        PSHR    R5                              ; D181   0275
        MVII    #$015C, R1                      ; D182   02B9 015C
        ADDR    R2,     R1                      ; D184   00D1
        MVI@    R1,     R0                      ; D185   0288

        JSR     R5,     .EXEC.76C               ; D186   0004 0114 036C

        PULR    R7                              ; D189   02B7

        PSHR    R5                              ; D18A   0275
        MVII    #$0000, R0                      ; D18B   02B8 0000

        JSR     R5,     .EXEC.9BB               ; D18D   0004 0118 01BB

        ADDI    #$0004, R1                      ; D190   02F9 0004
        MVI@    R1,     R0                      ; D192   0288
        CLRR    R2                              ; D193   01D2
        MVO@    R2,     R1                      ; D194   024A

        JSR     R5,     X_UNPK_BYTES            ; D195   0004 0114 0357

        PULR    R7                              ; D198   02B7

L_D199:
        PSHR    R5                              ; D199   0275

        JSR     R5,     L_D298                  ; D19A   0004 01D0 0298
        DECLE   $0000                           ; D19D   0000

        MVI     G_01A9, R0                      ; D19E   0280 01A9
        SWAP    R0,     2                       ; D1A0   0044
        BPL     L_D1A9                          ; D1A1   0203 0006

        SDBD                                    ; D1A3   0001
        MVII    #$503C, R1                      ; D1A4   02B9 003C 0050
        B       L_D1C9                          ; D1A7   0200 0020

L_D1A9:
        MVI@    R3,     R1                      ; D1A9   0299
        MVI@    R2,     R0                      ; D1AA   0290

        JSR     R5,     X_EXT_SIGN_LO           ; D1AB   0004 0114 0268

        INCR    R0                              ; D1AE   0008
        MVO@    R0,     R2                      ; D1AF   0250
        BMI     L_D1E3                          ; D1B0   020B 0031
        BEQ     L_D20E                          ; D1B2   0204 005A

        MVI     G_01D4, R5                      ; D1B4   0285 01D4
        TSTR    R5                              ; D1B6   00AD
        BNEQ    L_D1ED                          ; D1B7   020C 0034

        CMPI    #$0003, R0                      ; D1B9   0378 0003
        BGT     L_D20E                          ; D1BB   020E 0051
        BLT     L_D1C2                          ; D1BD   0205 0003

        CMPR    R1,     R0                      ; D1BF   0148
        BEQ     L_D1E7                          ; D1C0   0204 0025

L_D1C2:
        JSR     R5,     L_D2C1                  ; D1C2   0004 01D0 02C1

        SDBD                                    ; D1C5   0001
        MVII    #$5030, R1                      ; D1C6   02B9 0030 0050
L_D1C9:
        SDBD                                    ; D1C9   0001
        MVII    #$6645, R0                      ; D1CA   02B8 0045 0066
L_D1CD:
        MVO     R0,     G_035D                  ; D1CD   0240 035D

        JSR     R5,     X_TIMER_START           ; D1CF   0004 0118 0044
        JSR     R5,     .EXEC.81E               ; D1D2   0004 0118 001E

        MVI     G_016B, R0                      ; D1D5   0280 016B
        SDBD                                    ; D1D7   0001
        ANDI    #$FFF7, R0                      ; D1D8   03B8 00F7 00FF
        XORI    #$0008, R0                      ; D1DB   03F8 0008
        MVO     R0,     G_016B                  ; D1DD   0240 016B

        JSR     R5,     L_D4D6                  ; D1DF   0004 01D4 00D6

        PULR    R7                              ; D1E2   02B7

L_D1E3:
        DECR    R1                              ; D1E3   0011
        MVO@    R1,     R3                      ; D1E4   0259
        B       L_D1C2                          ; D1E5   0220 0024

L_D1E7:
        NEGR    R0                              ; D1E7   0020
        INCR    R0                              ; D1E8   0008
        MVO@    R0,     R2                      ; D1E9   0250
        MVO@    R0,     R3                      ; D1EA   0258
        B       L_D1C2                          ; D1EB   0220 002A

L_D1ED:
        SUBR    R1,     R0                      ; D1ED   0108
        CMPI    #$0002, R0                      ; D1EE   0378 0002
        BLT     L_D1C2                          ; D1F0   0225 002F

        ADDR    R0,     R1                      ; D1F2   00C1
        CMPI    #$0007, R1                      ; D1F3   0379 0007
        BLT     L_D1C2                          ; D1F5   0225 0034

        MVII    #$0002, R0                      ; D1F7   02B8 0002
        MVO     R0,     G_01D4                  ; D1F9   0240 01D4

        JSR     R5,     L_D344                  ; D1FB   0004 01D0 0344

        CMP     G_01B7, R0                      ; D1FE   0340 01B7
        BNEQ    L_D20E                          ; D200   020C 000C

        MVI     G_0173, R0                      ; D202   0280 0173
        XORI    #$0080, R0                      ; D204   03F8 0080
        MVO     R0,     G_0173                  ; D206   0240 0173
        MVI     G_0174, R0                      ; D208   0280 0174
        XORI    #$0080, R0                      ; D20A   03F8 0080
        MVO     R0,     G_0174                  ; D20C   0240 0174
L_D20E:
        CLRR    R0                              ; D20E   01C0
        MVO@    R0,     R2                      ; D20F   0250
        MVO@    R0,     R3                      ; D210   0258

        JSR     R5,     L_D2C1                  ; D211   0004 01D0 02C1

        MVII    #$0004, R0                      ; D214   02B8 0004

        JSR     R5,     X_PLAY_CHEER1           ; D216   0004 011C 02D5

        MVII    #$0003, R0                      ; D219   02B8 0003

        JSR     R5,     L_D88C                  ; D21B   0004 01D8 008C
        JSR     R5,     L_D2A8                  ; D21E   0004 01D0 02A8
        DECLE   $0002                           ; D221   0002

        MVI@    R2,     R0                      ; D222   0290
        INCR    R0                              ; D223   0008
        MVO@    R0,     R2                      ; D224   0250
        CMPI    #$0006, R0                      ; D225   0378 0006
        BGT     L_D252                          ; D227   020E 0029
        BLT     L_D23E                          ; D229   0205 0013

        SUB@    R3,     R0                      ; D22B   0318
        DECR    R0                              ; D22C   0010
        BEQ     L_D23E                          ; D22D   0204 000F
        BPL     L_D252                          ; D22F   0203 0021

        MVII    #$0001, R0                      ; D231   02B8 0001
        MVO     R0,     G_01D4                  ; D233   0240 01D4
        INCR    R0                              ; D235   0008

        JSR     R5,     L_D88C                  ; D236   0004 01D8 008C
        JSR     R5,     L_D344                  ; D239   0004 01D0 0344

        MVO     R0,     G_01B7                  ; D23C   0240 01B7
L_D23E:
        MVI     G_0189, R0                      ; D23E   0280 0189
        TSTR    R0                              ; D240   0080
        BEQ     L_D24C                          ; D241   0204 0009

        CLRR    R0                              ; D243   01C0
        MVO     R0,     G_0189                  ; D244   0240 0189
        SDBD                                    ; D246   0001
        MVII    #$5038, R1                      ; D247   02B9 0038 0050
        B       L_D1C9                          ; D24A   0220 0082

L_D24C:
        SDBD                                    ; D24C   0001
        MVII    #$5034, R1                      ; D24D   02B9 0034 0050
        B       L_D1C9                          ; D250   0220 0088

L_D252:
        CLRR    R0                              ; D252   01C0
        MVO     R0,     G_0189                  ; D253   0240 0189
        MVII    #$0002, R0                      ; D255   02B8 0002

        JSR     R5,     L_D88C                  ; D257   0004 01D8 008C
        JSR     R5,     L_D2A8                  ; D25A   0004 01D0 02A8
        DECLE   $0004                           ; D25D   0004

        MVI@    R2,     R0                      ; D25E   0290
        INCR    R0                              ; D25F   0008
        MVO@    R0,     R2                      ; D260   0250
        CMPI    #$0003, R0                      ; D261   0378 0003
        BGE     L_D27E                          ; D263   020D 0019

        MVI     G_01D5, R1                      ; D265   0281 01D5
        DECR    R1                              ; D267   0011
        SLL     R1,     1                       ; D268   0049
        MVII    #$01D8, R4                      ; D269   02BC 01D8
        ADDR    R1,     R4                      ; D26B   00CC
        MVI     G_01D0, R1                      ; D26C   0281 01D0
        MVO@    R1,     R4                      ; D26E   0261
        MVI     G_01D1, R1                      ; D26F   0281 01D1
        MVO@    R1,     R4                      ; D271   0261
        CLRR    R0                              ; D272   01C0
        MVO     R0,     G_01D0                  ; D273   0240 01D0
        MVO     R0,     G_01D1                  ; D275   0240 01D1
        MVI     G_01D5, R1                      ; D277   0281 01D5
        INCR    R1                              ; D279   0009
        MVO     R1,     G_01D5                  ; D27A   0241 01D5
        B       L_D292                          ; D27C   0200 0014

L_D27E:
        MVII    #$000C, R0                      ; D27E   02B8 000C

        JSR     R5,     X_PLAY_CHEER1           ; D280   0004 011C 02D5

        MVII    #$0001, R0                      ; D283   02B8 0001

        JSR     R5,     L_D88C                  ; D285   0004 01D8 008C

        SDBD                                    ; D288   0001
        MVII    #$5038, R1                      ; D289   02B9 0038 0050
        SDBD                                    ; D28C   0001
        MVII    #$1906, R0                      ; D28D   02B8 0006 0019
        B       L_D1CD                          ; D290   0220 00C4

L_D292:
        SDBD                                    ; D292   0001
        MVII    #$5038, R1                      ; D293   02B9 0038 0050
        B       L_D1C9                          ; D296   0220 00CE

L_D298:
        MVII    #$01CE, R2                      ; D298   02BA 01CE
        ADD@    R5,     R2                      ; D29A   02EA
        PSHR    R5                              ; D29B   0275
        MOVR    R2,     R3                      ; D29C   0093
        INCR    R3                              ; D29D   000B
        MVI     G_01A9, R0                      ; D29E   0280 01A9
        ANDI    #$0002, R0                      ; D2A0   03B8 0002
        BEQ     L_D2A7                          ; D2A2   0204 0003

        XORR    R2,     R3                      ; D2A4   01D3
        XORR    R3,     R2                      ; D2A5   01DA
        XORR    R2,     R3                      ; D2A6   01D3
L_D2A7:
        PULR    R7                              ; D2A7   02B7

L_D2A8:
        MVII    #$01CE, R2                      ; D2A8   02BA 01CE
        ADD@    R5,     R2                      ; D2AA   02EA
        PSHR    R5                              ; D2AB   0275
        MOVR    R2,     R3                      ; D2AC   0093
        INCR    R3                              ; D2AD   000B
        MVI     G_01A9, R0                      ; D2AE   0280 01A9
        ANDI    #$0002, R0                      ; D2B0   03B8 0002
        BNEQ    L_D2B7                          ; D2B2   020C 0003

        XORR    R2,     R3                      ; D2B4   01D3
        XORR    R3,     R2                      ; D2B5   01DA
        XORR    R2,     R3                      ; D2B6   01D3
L_D2B7:
        MVI     G_0173, R0                      ; D2B7   0280 0173
        ANDI    #$0040, R0                      ; D2B9   03B8 0040
        BNEQ    L_D2C0                          ; D2BB   020C 0003

        XORR    R2,     R3                      ; D2BD   01D3
        XORR    R3,     R2                      ; D2BE   01DA
        XORR    R2,     R3                      ; D2BF   01D3
L_D2C0:
        PULR    R7                              ; D2C0   02B7

L_D2C1:
        PSHR    R5                              ; D2C1   0275
        MVII    #$028D, R4                      ; D2C2   02BC 028D
        SDBD                                    ; D2C4   0001
        MVII    #$092C, R0                      ; D2C5   02B8 002C 0009
        MVO@    R0,     R4                      ; D2C8   0260
        SUBI    #$0002, R4                      ; D2C9   033C 0002
        MVI     G_01CE, R0                      ; D2CB   0280 01CE
        SDBD                                    ; D2CD   0001
        MVII    #$2000, R1                      ; D2CE   02B9 0000 0020
        SDBD                                    ; D2D1   0001
        MVII    #$2002, R3                      ; D2D2   02BB 0002 0020
        MVII    #$0008, R2                      ; D2D5   02BA 0008

        JSR     R5,     L_D2F8                  ; D2D7   0004 01D0 02F8

        MVII    #$0251, R4                      ; D2DA   02BC 0251
        SDBD                                    ; D2DC   0001
        MVII    #$0924, R0                      ; D2DD   02B8 0024 0009
        MVO@    R0,     R4                      ; D2E0   0260
        SUBI    #$0002, R4                      ; D2E1   033C 0002
        MVI     G_01CF, R0                      ; D2E3   0280 01CF
        CLRR    R1                              ; D2E5   01C9
        CLRR    R2                              ; D2E6   01D2
        MVII    #$0002, R3                      ; D2E7   02BB 0002

        JSR     R5,     L_D2F8                  ; D2E9   0004 01D0 02F8

        SDBD                                    ; D2EC   0001
        CMPI    #$FFFC, R0                      ; D2ED   0378 00FC 00FF
        BNEQ    L_D2F7                          ; D2F0   020C 0005

        MVII    #$0004, R0                      ; D2F2   02B8 0004

        JSR     R5,     L_D88C                  ; D2F4   0004 01D8 008C

L_D2F7:
        PULR    R7                              ; D2F7   02B7

L_D2F8:
        PSHR    R5                              ; D2F8   0275
        MVI     G_01D4, R5                      ; D2F9   0285 01D4
        TSTR    R5                              ; D2FB   00AD
        BNEQ    L_D31D                          ; D2FC   020C 001F

        JSR     R5,     X_EXT_SIGN_LO           ; D2FE   0004 0114 0268

        SLL     R0,     1                       ; D301   0048
        SDBD                                    ; D302   0001
        MVII    #$D334, R5                      ; D303   02BD 0034 00D3
        ADDR    R0,     R5                      ; D306   00C5
        ADDR    R0,     R5                      ; D307   00C5
        SDBD                                    ; D308   0001
        MVI@    R5,     R3                      ; D309   02AB
        ADDR    R3,     R1                      ; D30A   00D9
        MVO@    R1,     R4                      ; D30B   0261
        SDBD                                    ; D30C   0001
        MVI@    R5,     R1                      ; D30D   02A9
        CMPI    #$0000, R0                      ; D30E   0378 0000
        BEQ     L_D31A                          ; D310   0204 0008

        SDBD                                    ; D312   0001
        CMPI    #$FFFA, R0                      ; D313   0378 00FA 00FF
        BEQ     L_D31A                          ; D316   0204 0002

L_D318:
        MVO@    R1,     R4                      ; D318   0261
        PULR    R7                              ; D319   02B7

L_D31A:
        ADDR    R2,     R1                      ; D31A   00D1
        B       L_D318                          ; D31B   0220 0004

L_D31D:
        MVII    #$0001, R1                      ; D31D   02B9 0001
        CMPI    #$000A, R0                      ; D31F   0378 000A
        BLT     L_D324                          ; D321   0205 0001

        INCR    R1                              ; D323   0009

L_D324:
        JSR     R5,     X_PRNUM_RGT             ; D324   0004 0118 00C5

        PULR    R7                              ; D327   02B7

        DECLE   $0024,  $0009,  $0024,  $0009   ; D328   0024 0009 0024 0009
        DECLE   $00A2,  $0000,  $0082,  $0000   ; D32C   00A2 0000 0082 0000
        DECLE   $000A,  $0001,  $0022,  $0001   ; D330   000A 0001 0022 0001
        DECLE   $0082,  $0000,  $0024,  $0009   ; D334   0082 0000 0024 0009
        DECLE   $008A,  $0000,  $00AA,  $0000   ; D338   008A 0000 00AA 0000
        DECLE   $009A,  $0000,  $0082,  $0000   ; D33C   009A 0000 0082 0000
        DECLE   $00A2,  $0000,  $0082,  $0000   ; D340   00A2 0000 0082 0000
L_D344:
        MVI     G_0173, R0                      ; D344   0280 0173
        ANDI    #$0080, R0                      ; D346   03B8 0080
        BNEQ    L_D34E                          ; D348   020C 0004

        MVI     G_0173, R0                      ; D34A   0280 0173
        B       L_D350                          ; D34C   0200 0002

L_D34E:
        MVI     G_0174, R0                      ; D34E   0280 0174
L_D350:
        ANDI    #$0040, R0                      ; D350   03B8 0040
        MOVR    R5,     R7                      ; D352   00AF

L_D353:
        PSHR    R5                              ; D353   0275

        JSR     R5,     L_D3C7                  ; D354   0004 01D0 03C7

        MVI     G_01D4, R1                      ; D357   0281 01D4
        CMPI    #$0002, R1                      ; D359   0379 0002
        BNEQ    L_D362                          ; D35B   020C 0005

        CLRR    R0                              ; D35D   01C0
        MVO     R0,     G_01D4                  ; D35E   0240 01D4
        B       L_D36B                          ; D360   0200 0009

L_D362:
        MVI     G_01A8, R0                      ; D362   0280 01A8
        ANDI    #$0001, R0                      ; D364   03B8 0001
        BEQ     L_D36B                          ; D366   0204 0003

        JSR     R5,     L_D535                  ; D368   0004 01D4 0135

L_D36B:
        CLRR    R0                              ; D36B   01C0
        MVO     R0,     G_01A8                  ; D36C   0240 01A8
        MVI     G_01A7, R0                      ; D36E   0280 01A7
        MOVR    R0,     R1                      ; D370   0081
        DECR    R1                              ; D371   0011
        INCR    R0                              ; D372   0008
        MVO     R0,     G_01A7                  ; D373   0240 01A7
        ANDI    #$0001, R0                      ; D375   03B8 0001
        BNEQ    L_D3A2                          ; D377   020C 0029

        MVII    #$0004, R2                      ; D379   02BA 0004

        JSR     R5,     X_DIV                   ; D37B   0004 011C 01FB

        TSTR    R1                              ; D37E   0089
        BEQ     L_D38E                          ; D37F   0204 000D

        MVI     G_0173, R2                      ; D381   0282 0173

        JSR     R5,     L_D432                  ; D383   0004 01D4 0032

        MOVR    R1,     R0                      ; D386   0088
        MVI     G_0174, R2                      ; D387   0282 0174

        JSR     R5,     L_D432                  ; D389   0004 01D4 0032

        B       L_D392                          ; D38C   0200 0004

L_D38E:
        MVI     G_0173, R0                      ; D38E   0280 0173
        MVI     G_0174, R1                      ; D390   0281 0174
L_D392:
        XORI    #$0080, R0                      ; D392   03F8 0080
        XORI    #$0080, R1                      ; D394   03F9 0080
L_D396:
        MVO     R0,     G_0174                  ; D396   0240 0174
        MVO     R1,     G_0173                  ; D398   0241 0173

        JSR     R5,     L_D443                  ; D39A   0004 01D4 0043
        JSR     R5,     L_54D5                  ; D39D   0004 0154 00D5

        B       L_D3C0                          ; D3A0   0200 001E

L_D3A2:
        MVII    #$0004, R4                      ; D3A2   02BC 0004
        MVI     G_0173, R0                      ; D3A4   0280 0173
        ANDI    #$0080, R0                      ; D3A6   03B8 0080
        BNEQ    L_D3AC                          ; D3A8   020C 0002

        MVII    #$0001, R4                      ; D3AA   02BC 0001
L_D3AC:
        MVO     R4,     G_01BA                  ; D3AC   0244 01BA
        MVI     G_0173, R1                      ; D3AE   0281 0173
        XORI    #$0080, R1                      ; D3B0   03F9 0080
        MVO     R1,     G_0173                  ; D3B2   0241 0173
        MVI     G_0174, R2                      ; D3B4   0282 0174
        XORI    #$0080, R2                      ; D3B6   03FA 0080

        JSR     R5,     L_D432                  ; D3B8   0004 01D4 0032

        MVO     R1,     G_0174                  ; D3BB   0241 0174

L_D3BD:
        JSR     R5,     L_D3D2                  ; D3BD   0004 01D0 03D2

L_D3C0:
        SDBD                                    ; D3C0   0001
        MVII    #$52D0, R0                      ; D3C1   02B8 00D0 0052
        MVO     R0,     G_035D                  ; D3C4   0240 035D
        PULR    R7                              ; D3C6   02B7

L_D3C7:
        MVI     G_016B, R1                      ; D3C7   0281 016B
        SDBD                                    ; D3C9   0001
        ANDI    #$FFF6, R1                      ; D3CA   03B9 00F6 00FF
        XORI    #$0001, R1                      ; D3CD   03F9 0001
        MVO     R1,     G_016B                  ; D3CF   0241 016B
        MOVR    R5,     R7                      ; D3D1   00AF

L_D3D2:
        PSHR    R5                              ; D3D2   0275
        MVI     G_0173, R1                      ; D3D3   0281 0173
        MVII    #$0002, R0                      ; D3D5   02B8 0002

        JSR     R5,     L_54B1                  ; D3D7   0004 0154 00B1

        MVI     G_0174, R1                      ; D3DA   0281 0174
        MVII    #$000A, R0                      ; D3DC   02B8 000A

        JSR     R5,     L_54B1                  ; D3DE   0004 0154 00B1

        PULR    R7                              ; D3E1   02B7

L_D3E2:
        PSHR    R5                              ; D3E2   0275

        JSR     R5,     L_D3C7                  ; D3E3   0004 01D0 03C7

        B       L_D3BD                          ; D3E6   0220 002A

L_D3E8:
        PSHR    R5                              ; D3E8   0275

        JSR     R5,     L_D3C7                  ; D3E9   0004 01D0 03C7

        MVI     G_01A8, R0                      ; D3EC   0280 01A8
        INCR    R0                              ; D3EE   0008
        MVO     R0,     G_01A8                  ; D3EF   0240 01A8
        MVI     G_01D4, R1                      ; D3F1   0281 01D4
        TSTR    R1                              ; D3F3   0089
        BEQ     L_D41F                          ; D3F4   0204 0029

        CMPI    #$0001, R0                      ; D3F6   0378 0001
        BNEQ    L_D3FE                          ; D3F8   020C 0004

        MVII    #$0002, R0                      ; D3FA   02B8 0002
        MVO     R0,     G_01A8                  ; D3FC   0240 01A8
L_D3FE:
        CMPI    #$0007, R0                      ; D3FE   0378 0007
        BLT     L_D41B                          ; D400   0205 0019
        BNEQ    L_D415                          ; D402   020C 0011

        MVII    #$01CE, R2                      ; D404   02BA 01CE
        MVII    #$01CF, R3                      ; D406   02BB 01CF
        MVI@    R2,     R0                      ; D408   0290
        MVI@    R3,     R1                      ; D409   0299
        MVO@    R1,     R2                      ; D40A   0251
        MVO@    R0,     R3                      ; D40B   0258

        JSR     R5,     L_D2C1                  ; D40C   0004 01D0 02C1

        MVI     G_0173, R0                      ; D40F   0280 0173
        MVI     G_0174, R1                      ; D411   0281 0174
        B       L_D396                          ; D413   0220 007E

L_D415:
        MVII    #$0002, R0                      ; D415   02B8 0002
        MVO     R0,     G_01A8                  ; D417   0240 01A8
        B       L_D3A2                          ; D419   0220 0078

L_D41B:
        ANDI    #$0001, R0                      ; D41B   03B8 0001
        BEQ     L_D3A2                          ; D41D   0224 007C

L_D41F:
        MVI     G_01BA, R1                      ; D41F   0281 01BA
        SDBD                                    ; D421   0001
        MVII    #$D42D, R4                      ; D422   02BC 002D 00D4
        ADDR    R1,     R4                      ; D425   00CC
        MVI@    R4,     R1                      ; D426   02A1
        MVO     R1,     G_01BA                  ; D427   0241 01BA

        JSR     R5,     L_D535                  ; D429   0004 01D4 0135

        B       L_D3BD                          ; D42C   0220 0070

        DECLE   $0002,  $0001,  $0004           ; D42E   0002 0001 0004

        DIS                                     ; D431   0003
L_D432:
        MOVR    R2,     R3                      ; D432   0093
        ANDI    #$0007, R3                      ; D433   03BB 0007
        SLL     R3,     2                       ; D435   004F
        SLL     R3,     1                       ; D436   004B
        MOVR    R2,     R1                      ; D437   0091
        ANDI    #$0038, R1                      ; D438   03B9 0038
        BEQ     L_D441                          ; D43A   0204 0005

        SLR     R1,     2                       ; D43C   0065
        SLR     R1,     1                       ; D43D   0061
        ANDI    #$00C0, R2                      ; D43E   03BA 00C0
        XORR    R3,     R2                      ; D440   01DA
L_D441:
        XORR    R2,     R1                      ; D441   01D1
        MOVR    R5,     R7                      ; D442   00AF

L_D443:
        PSHR    R5                              ; D443   0275
        MVI     G_017E, R0                      ; D444   0280 017E
        TSTR    R0                              ; D446   0080
        BEQ     L_D47E                          ; D447   0204 0035

        MVII    #$0000, R0                      ; D449   02B8 0000
        MVO     R0,     G_01B0                  ; D44B   0240 01B0
        MVII    #$0002, R0                      ; D44D   02B8 0002

        JSR     R5,     L_D48D                  ; D44F   0004 01D4 008D

        BC      L_D462                          ; D452   0201 000E

        MVII    #$0006, R0                      ; D454   02B8 0006

        JSR     R5,     L_D48D                  ; D456   0004 01D4 008D

        BC      L_D45D                          ; D459   0201 0002

        MVII    #$0007, R0                      ; D45B   02B8 0007
L_D45D:
        MVII    #$0002, R1                      ; D45D   02B9 0002

        JSR     R5,     L_D4A5                  ; D45F   0004 01D4 00A5

L_D462:
        MVII    #$0003, R0                      ; D462   02B8 0003

        JSR     R5,     L_D48D                  ; D464   0004 01D4 008D

        BC      L_D47D                          ; D467   0201 0014

        MVI     G_01B0, R0                      ; D469   0280 01B0
        CMPI    #$0006, R0                      ; D46B   0378 0006
        BEQ     L_D476                          ; D46D   0204 0007

        MVII    #$0006, R0                      ; D46F   02B8 0006

        JSR     R5,     L_D48D                  ; D471   0004 01D4 008D

        BC      L_D478                          ; D474   0201 0002

L_D476:
        MVII    #$0007, R0                      ; D476   02B8 0007
L_D478:
        MVII    #$0003, R1                      ; D478   02B9 0003

        JSR     R5,     L_D4A5                  ; D47A   0004 01D4 00A5

L_D47D:
        PULR    R7                              ; D47D   02B7

L_D47E:
        MVII    #$0002, R0                      ; D47E   02B8 0002
        MVII    #$0006, R1                      ; D480   02B9 0006

        JSR     R5,     L_D4A5                  ; D482   0004 01D4 00A5

        MVII    #$0003, R0                      ; D485   02B8 0003
        MVII    #$0007, R1                      ; D487   02B9 0007

        JSR     R5,     L_D4A5                  ; D489   0004 01D4 00A5

        PULR    R7                              ; D48C   02B7

L_D48D:
        PSHR    R5                              ; D48D   0275

        JSR     R5,     L_556E                  ; D48E   0004 0154 016E

        MVI     G_0173, R1                      ; D491   0281 0173
        ANDI    #$0007, R1                      ; D493   03B9 0007
        CMPR    R2,     R1                      ; D495   0151
        BEQ     L_D4A1                          ; D496   0204 0009

        MVI     G_0173, R1                      ; D498   0281 0173
        ANDI    #$0038, R1                      ; D49A   03B9 0038
        SLR     R1,     2                       ; D49C   0065
        SLR     R1,     1                       ; D49D   0061
        CMPR    R2,     R1                      ; D49E   0151
        BNEQ    L_D4A3                          ; D49F   020C 0002

L_D4A1:
        SETC                                    ; D4A1   0007
        PULR    R7                              ; D4A2   02B7

L_D4A3:
        CLRC                                    ; D4A3   0006
        PULR    R7                              ; D4A4   02B7

L_D4A5:
        PSHR    R5                              ; D4A5   0275
        MVO     R0,     G_01B0                  ; D4A6   0240 01B0

        JSR     R5,     L_556E                  ; D4A8   0004 0154 016E

        PSHR    R2                              ; D4AB   0272
        PSHR    R3                              ; D4AC   0273
        MOVR    R1,     R0                      ; D4AD   0088

        JSR     R5,     L_556E                  ; D4AE   0004 0154 016E

        MOVR    R2,     R1                      ; D4B1   0091
        MOVR    R3,     R4                      ; D4B2   009C
        PULR    R3                              ; D4B3   02B3
        PULR    R2                              ; D4B4   02B2
        MVO@    R1,     R3                      ; D4B5   0259
        MVO@    R2,     R4                      ; D4B6   0262
        MVII    #$015C, R3                      ; D4B7   02BB 015C
        MOVR    R3,     R4                      ; D4B9   009C
        ADDR    R2,     R3                      ; D4BA   00D3
        ADDR    R1,     R4                      ; D4BB   00CC
        MVI@    R3,     R0                      ; D4BC   0298
        MVI@    R4,     R1                      ; D4BD   02A1
        DECR    R4                              ; D4BE   0014
        MVO@    R1,     R3                      ; D4BF   0259
        MVO@    R0,     R4                      ; D4C0   0260
        SLL     R1,     2                       ; D4C1   004D
        SLL     R1,     1                       ; D4C2   0049
        SLL     R0,     2                       ; D4C3   004C
        SLL     R0,     1                       ; D4C4   0048
        ADDI    #$031D, R1                      ; D4C5   02F9 031D
        ADDI    #$031D, R0                      ; D4C7   02F8 031D
        MOVR    R0,     R2                      ; D4C9   0082
        MVII    #$0007, R4                      ; D4CA   02BC 0007
L_D4CC:
        MVI@    R2,     R0                      ; D4CC   0290
        MVI@    R1,     R3                      ; D4CD   028B
        MVO@    R3,     R2                      ; D4CE   0253
        MVO@    R0,     R1                      ; D4CF   0248
        INCR    R1                              ; D4D0   0009
        INCR    R2                              ; D4D1   000A
        DECR    R4                              ; D4D2   0014
        BNEQ    L_D4CC                          ; D4D3   022C 0008
        PULR    R7                              ; D4D5   02B7

L_D4D6:
        PSHR    R5                              ; D4D6   0275
        DECLE   $02BA,  $0001,  $0004           ; D4D7   02BA 0001 0004

        XORR    R4,     R0                      ; D4DA   01E0
        ADCR    R7                              ; D4DB   002F

        INCR    R2                              ; D4DC   000A
L_D4DD:
        CMP     G_0180, R2                      ; D4DD   0342 0180
        DECLE   $0225,  $0007                   ; D4DF   0225 0007

        MVII    #$0008, R2                      ; D4E1   02BA 0008
        CLRR    R0                              ; D4E3   01C0
        MVII    #$0323, R4                      ; D4E4   02BC 0323
L_D4E6:
        MVO@    R0,     R4                      ; D4E6   0260
        ADDI    #$0007, R4                      ; D4E7   02FC 0007
        DECR    R2                              ; D4E9   0012
        BNEQ    L_D4E6                          ; D4EA   022C 0005
        PULR    R7                              ; D4EC   02B7

L_D4ED:
        PSHR    R5                              ; D4ED   0275

        JSR     R5,     L_D298                  ; D4EE   0004 01D0 0298
        DECLE   $0000                           ; D4F1   0000

        MVI@    R3,     R1                      ; D4F2   0299
        MVI@    R2,     R0                      ; D4F3   0290

        JSR     R5,     X_EXT_SIGN_LO           ; D4F4   0004 0114 0268

        INCR    R0                              ; D4F7   0008
        BMI     L_D505                          ; D4F8   020B 000B
        BEQ     L_D511                          ; D4FA   0204 0015

        MVI     G_01D4, R5                      ; D4FC   0285 01D4
        TSTR    R5                              ; D4FE   00AD
        BNEQ    L_D507                          ; D4FF   020C 0006

        CMPI    #$0003, R0                      ; D501   0378 0003
        BGT     L_D511                          ; D503   020E 000C

L_D505:
        CLRR    R0                              ; D505   01C0
        PULR    R7                              ; D506   02B7

L_D507:
        SUBR    R1,     R0                      ; D507   0108
        CMPI    #$0002, R0                      ; D508   0378 0002
        BLT     L_D505                          ; D50A   0225 0006

        ADDR    R0,     R1                      ; D50C   00C1
        CMPI    #$0007, R1                      ; D50D   0379 0007
        BLT     L_D505                          ; D50F   0225 000B

L_D511:
        JSR     R5,     L_D2A8                  ; D511   0004 01D0 02A8
        DECLE   $0002                           ; D514   0002

        MVI@    R2,     R0                      ; D515   0290
        INCR    R0                              ; D516   0008
        CMPI    #$0006, R0                      ; D517   0378 0006
        BGT     L_D525                          ; D519   020E 000A
        BLT     L_D505                          ; D51B   0225 0017

        SUB@    R3,     R0                      ; D51D   0318
        DECR    R0                              ; D51E   0010
        BEQ     L_D505                          ; D51F   0224 001B
        BPL     L_D525                          ; D521   0203 0002
        B       L_D505                          ; D523   0220 001F

L_D525:
        JSR     R5,     L_D2A8                  ; D525   0004 01D0 02A8
        DECLE   $0004                           ; D528   0004

        MVI@    R2,     R0                      ; D529   0290
        INCR    R0                              ; D52A   0008
        CMPI    #$0003, R0                      ; D52B   0378 0003
        BGE     L_D532                          ; D52D   020D 0003

        MVII    #$0003, R0                      ; D52F   02B8 0003
        PULR    R7                              ; D531   02B7

L_D532:
        MVII    #$0004, R0                      ; D532   02B8 0004
        PULR    R7                              ; D534   02B7

L_D535:
        PSHR    R5                              ; D535   0275
        MVI     G_0173, R1                      ; D536   0281 0173
        MOVR    R1,     R2                      ; D538   008A
        ANDI    #$0080, R1                      ; D539   03B9 0080
        BNEQ    L_D543                          ; D53B   020C 0006

        JSR     R5,     L_D432                  ; D53D   0004 01D4 0032

        MVO     R1,     G_0173                  ; D540   0241 0173
        PULR    R7                              ; D542   02B7

L_D543:
        MVI     G_0174, R2                      ; D543   0282 0174

        JSR     R5,     L_D432                  ; D545   0004 01D4 0032

        MVO     R1,     G_0174                  ; D548   0241 0174
        PULR    R7                              ; D54A   02B7

L_D54B:
        PSHR    R5                              ; D54B   0275
        MVII    #$0002, R3                      ; D54C   02BB 0002
        MVI     G_01ED, R0                      ; D54E   0280 01ED
        TSTR    R0                              ; D550   0080
        BEQ     L_D563                          ; D551   0204 0010

        SDBD                                    ; D553   0001
        MVII    #$D60D, R1                      ; D554   02B9 000D 00D6
        DECR    R0                              ; D557   0010
        SLL     R0,     1                       ; D558   0048
        ADDR    R0,     R1                      ; D559   00C1
        SLL     R0,     2                       ; D55A   004C
        ADDR    R0,     R1                      ; D55B   00C1
        CLRR    R0                              ; D55C   01C0
        MVO     R0,     G_01ED                  ; D55D   0240 01ED
        MVII    #$0200, R4                      ; D55F   02BC 0200
        B       L_D5CE                          ; D561   0200 006B

L_D563:
        MVI     G_01C9, R0                      ; D563   0280 01C9
        TSTR    R0                              ; D565   0080
        BEQ     L_D56B                          ; D566   0204 0003

        DECR    R0                              ; D568   0010
        MVO     R0,     G_01C9                  ; D569   0240 01C9
L_D56B:
        MVI     G_035C, R0                      ; D56B   0280 035C
        MOVR    R0,     R1                      ; D56D   0081
        ANDI    #$000F, R0                      ; D56E   03B8 000F
        CMPI    #$0001, R0                      ; D570   0378 0001
        BEQ     L_D593                          ; D572   0204 001F

        SAR     R1,     2                       ; D574   006D
        SAR     R1,     2                       ; D575   006D
        MVO     R1,     G_035C                  ; D576   0241 035C
        MVI     G_01C7, R1                      ; D578   0281 01C7
        CMPI    #$0001, R1                      ; D57A   0379 0001
        BGT     L_D593                          ; D57C   020E 0015

        CMPI    #$0006, R0                      ; D57E   0378 0006
        BLT     L_D593                          ; D580   0205 0011

        MVI     G_01C4, R1                      ; D582   0281 01C4
        TSTR    R1                              ; D584   0089
        BEQ     L_D58B                          ; D585   0204 0004

        MVII    #$0002, R1                      ; D587   02B9 0002
        B       L_D591                          ; D589   0200 0006

L_D58B:
        CMPI    #$0006, R0                      ; D58B   0378 0006
        BEQ     L_D593                          ; D58D   0204 0004

        MVII    #$0001, R1                      ; D58F   02B9 0001
L_D591:
        MVO     R1,     G_01ED                  ; D591   0241 01ED
L_D593:
        MVII    #$0203, R4                      ; D593   02BC 0203
        SDBD                                    ; D595   0001
        MVII    #$0914, R1                      ; D596   02B9 0014 0009
        MVO@    R1,     R4                      ; D599   0261
        MVII    #$02F8, R1                      ; D59A   02B9 02F8
        MVO@    R1,     R4                      ; D59C   0261
        MVO@    R1,     R4                      ; D59D   0261
        MVO@    R1,     R4                      ; D59E   0261
        MVO@    R1,     R4                      ; D59F   0261
        MVO@    R1,     R4                      ; D5A0   0261
        SDBD                                    ; D5A1   0001
        MVII    #$D5D9, R1                      ; D5A2   02B9 00D9 00D5
        MVII    #$0200, R4                      ; D5A5   02BC 0200
        TSTR    R0                              ; D5A7   0080
        BNEQ    L_D5B7                          ; D5A8   020C 000D

        SDBD                                    ; D5AA   0001
        MVII    #$0904, R0                      ; D5AB   02B8 0004 0009
        MVO@    R0,     R4                      ; D5AE   0260
        SDBD                                    ; D5AF   0001
        MVII    #$090C, R0                      ; D5B0   02B8 000C 0009
        MVO@    R0,     R4                      ; D5B3   0260
        MVO@    R0,     R4                      ; D5B4   0260
        B       L_D5D1                          ; D5B5   0200 001A

L_D5B7:
        DECR    R0                              ; D5B7   0010
        CMPI    #$0001, R0                      ; D5B8   0378 0001
        BNEQ    L_D5CA                          ; D5BA   020C 000E

        MVI     G_01D0, R2                      ; D5BC   0282 01D0
        CMPI    #$0006, R2                      ; D5BE   037A 0006
        BNEQ    L_D5CA                          ; D5C0   020C 0008

        MVI     G_01D1, R2                      ; D5C2   0282 01D1
        CMPI    #$0006, R2                      ; D5C4   037A 0006
        BNEQ    L_D5CA                          ; D5C6   020C 0002

        MVII    #$0007, R0                      ; D5C8   02B8 0007
L_D5CA:
        SLL     R0,     1                       ; D5CA   0048
        ADDR    R0,     R1                      ; D5CB   00C1
        SLL     R0,     1                       ; D5CC   0048
        ADDR    R0,     R1                      ; D5CD   00C1

L_D5CE:
        JSR     R5,     X_PRINT_R1              ; D5CE   0004 0118 0067

L_D5D1:
        SDBD                                    ; D5D1   0001
        MVII    #$5020, R1                      ; D5D2   02B9 0020 0050

        JSR     R5,     .EXEC.81E               ; D5D5   0004 0118 001E

        PULR    R7                              ; D5D8   02B7

        DECLE   $004D,  $0041,  $0054,  $0043   ; D5D9   004D 0041 0054 0043
        DECLE   $0048,  $0000,  $0053,  $0045   ; D5DD   0048 0000 0053 0045
        DECLE   $0054,  $0020,  $0000,  $0000   ; D5E1   0054 0020 0000 0000
        DECLE   $0047,  $0041,  $004D,  $0045   ; D5E5   0047 0041 004D 0045
        DECLE   $0000,  $0000,  $0044,  $0045   ; D5E9   0000 0000 0044 0045
        DECLE   $0055,  $0043,  $0045,  $0000   ; D5ED   0055 0043 0045 0000
        DECLE   $004F,  $0055,  $0054,  $0021   ; D5F1   004F 0055 0054 0021
        DECLE   $0000,  $0000,  $0046,  $0041   ; D5F5   0000 0000 0046 0041
        DECLE   $0055,  $004C,  $0054,  $0000   ; D5F9   0055 004C 0054 0000
        DECLE   $004C,  $0045,  $0054,  $0020   ; D5FD   004C 0045 0054 0020
        DECLE   $0000,  $0000,  $0054,  $0049   ; D601   0000 0000 0054 0049
        DECLE   $0045,  $002D,  $0042,  $0052   ; D605   0045 002D 0042 0052
        DECLE   $0045,  $0041,  $004B,  $0000   ; D609   0045 0041 004B 0000
        DECLE   $0031,  $0053,  $0054,  $0020   ; D60D   0031 0053 0054 0020
        DECLE   $0053,  $0045,  $0052,  $0056   ; D611   0053 0045 0052 0056
        DECLE   $0045,  $0000,  $0032,  $004E   ; D615   0045 0000 0032 004E
        DECLE   $0044,  $0020,  $0053,  $0045   ; D619   0044 0020 0053 0045
        DECLE   $0052,  $0056,  $0045,  $0000   ; D61D   0052 0056 0045 0000
        DECLE   $0053,  $0045,  $0054,  $0020   ; D621   0053 0045 0054 0020
        DECLE   $0050,  $0054,  $002E,  $0000   ; D625   0050 0054 002E 0000
        DECLE   $0000,  $0000,  $004D,  $0041   ; D629   0000 0000 004D 0041
        DECLE   $0054,  $0043,  $0048,  $0020   ; D62D   0054 0043 0048 0020
        DECLE   $0050,  $0054,  $002E,  $0000   ; D631   0050 0054 002E 0000
L_D635:
        PSHR    R5                              ; D635   0275
        MVII    #$0001, R2                      ; D636   02BA 0001

L_D638:
        JSR     R5,     L_630D                  ; D638   0004 0160 030D
        JSR     R5,     L_D951                  ; D63B   0004 01D8 0151

        INCR    R2                              ; D63E   000A
        CMP     G_0180, R2                      ; D63F   0342 0180
        BLT     L_D638                          ; D641   0225 000A
        BNEQ    L_D64A                          ; D643   020C 0005

        MVI     G_017E, R0                      ; D645   0280 017E
        TSTR    R0                              ; D647   0080
        BNEQ    L_D638                          ; D648   022C 0011

L_D64A:
        MVI     G_0198, R0                      ; D64A   0280 0198
        SLL     R0,     1                       ; D64C   0048
        ADDR    R0,     R7                      ; D64D   00C7
        B       L_D686                          ; D64E   0200 0036
        B       L_D681                          ; D650   0200 002F
        B       L_D67C                          ; D652   0200 0028
        B       L_D661                          ; D654   0200 000B

        DECLE   $02BA,  $0003,  $0004,  $01E0   ; D656   02BA 0003 0004 01E0
        DECLE   $024F,  $02BA,  $0004,  $0004   ; D65A   024F 02BA 0004 0004

        XORR    R4,     R0                      ; D65E   01E0
        MVO@    R7,     R1                      ; D65F   024F
        PULR    R7                              ; D660   02B7

L_D661:
        MVI     G_0199, R2                      ; D661   0282 0199
        DECLE   $0092,  $020C,  $0012,  $0282   ; D663   0092 020C 0012 0282
        DECLE   $0173,  $03BA,  $0007,  $037A   ; D667   0173 03BA 0007 037A
        DECLE   $0003,  $0204,  $000A,  $0282   ; D66B   0003 0204 000A 0282
        DECLE   $0174,  $03BA,  $0007,  $037A   ; D66F   0174 03BA 0007 037A
        DECLE   $0003,  $0204,  $0002,  $02BA   ; D673   0003 0204 0002 02BA
        DECLE   $0004,  $0004                   ; D677   0004 0004

        XORR    R4,     R0                      ; D679   01E0
        MVO@    R7,     R1                      ; D67A   024F
        PULR    R7                              ; D67B   02B7

L_D67C:
        MVII    #$0001, R2                      ; D67C   02BA 0001
        DECLE   $0004                           ; D67E   0004

        XORR    R4,     R0                      ; D67F   01E0
        MVO@    R7,     R1                      ; D680   024F
L_D681:
        MVII    #$0002, R2                      ; D681   02BA 0002
        DECLE   $0004                           ; D683   0004

        XORR    R4,     R0                      ; D684   01E0
        MVO@    R7,     R1                      ; D685   024F
L_D686:
        PULR    R7                              ; D686   02B7

L_D687:
        PSHR    R5                              ; D687   0275
        SWAP    R0,     1                       ; D688   0040
        ANDI    #$00FF, R0                      ; D689   03B8 00FF
        SUBI    #$0060, R0                      ; D68B   0338 0060
        SUBI    #$007D, R1                      ; D68D   0339 007D
        PSHR    R1                              ; D68F   0271
        MVII    #$0155, R1                      ; D690   02B9 0155

        JSR     R5,     X_MPY                   ; D692   0004 011C 01DC

        MOVR    R2,     R3                      ; D695   0093
        PULR    R1                              ; D696   02B1
        MVII    #$003A, R0                      ; D697   02B8 003A
        MVII    #$007D, R2                      ; D699   02BA 007D

        JSR     R5,     L_57CB                  ; D69B   0004 0154 03CB

        ADDI    #$0123, R0                      ; D69E   02F8 0123
        MOVR    R3,     R1                      ; D6A0   0099
        MOVR    R0,     R2                      ; D6A1   0082

        JSR     R5,     X_DIV                   ; D6A2   0004 011C 01FB

        ADDI    #$005A, R0                      ; D6A5   02F8 005A
        PULR    R7                              ; D6A7   02B7

L_D6A8:
        PSHR    R5                              ; D6A8   0275
        SDBD                                    ; D6A9   0001
        ADDI    #$1000, R0                      ; D6AA   02F8 0000 0010
        SWAP    R0,     1                       ; D6AD   0040
        ANDI    #$00FF, R0                      ; D6AE   03B8 00FF
        SUBI    #$003D, R0                      ; D6B0   0338 003D
        MVII    #$007D, R1                      ; D6B2   02B9 007D
        MVII    #$002E, R2                      ; D6B4   02BA 002E

        JSR     R5,     L_57CB                  ; D6B6   0004 0154 03CB

        ADDI    #$007D, R0                      ; D6B9   02F8 007D
        MOVR    R0,     R2                      ; D6BB   0082
        PULR    R7                              ; D6BC   02B7

L_D6BD:
        PSHR    R5                              ; D6BD   0275
        SDBD                                    ; D6BE   0001
        MVII    #$8840, R4                      ; D6BF   02BC 0040 0088
        XOR     G_019B, R4                      ; D6C2   03C4 019B
        MVI     G_01C0, R0                      ; D6C4   0280 01C0
        SWAP    R0,     2                       ; D6C6   0044
        BPL     L_D6E7                          ; D6C7   0203 001E

        PSHR    R4                              ; D6C9   0274
        MVI     G_0354, R1                      ; D6CA   0281 0354
        CLRR    R3                              ; D6CC   01DB

        JSR     R5,     L_5781                  ; D6CD   0004 0154 0381

        MVO     R3,     G_0328                  ; D6D0   0243 0328
        MVI     G_031F, R2                      ; D6D2   0282 031F
        MVO     R2,     G_0327                  ; D6D4   0242 0327
        MVI     G_0108, R4                      ; D6D6   0284 0108

        JSR     R5,     L_589C                  ; D6D8   0004 0158 009C

        PULR    R4                              ; D6DB   02B4
        BNC     L_D6E7                          ; D6DC   0209 0009

        JSR     R5,     L_D6EE                  ; D6DE   0004 01D4 02EE

        BC      L_D6EA                          ; D6E1   0201 0007

L_D6E3:
        SDBD                                    ; D6E3   0001
        XORI    #$1000, R4                      ; D6E4   03FC 0000 0010
L_D6E7:
        MVO     R4,     G_0325                  ; D6E7   0244 0325
        PULR    R7                              ; D6E9   02B7

L_D6EA:
        XORI    #$0020, R4                      ; D6EA   03FC 0020
        B       L_D6E3                          ; D6EC   0220 000A

L_D6EE:
        SDBD                                    ; D6EE   0001
        CMPI    #$2C00, R2                      ; D6EF   037A 0000 002C
        BNC     L_D708                          ; D6F2   0209 0014

        SDBD                                    ; D6F4   0001
        CMPI    #$9500, R2                      ; D6F5   037A 0000 0095
        BC      L_D708                          ; D6F8   0201 000E

        SDBD                                    ; D6FA   0001
        CMPI    #$3800, R3                      ; D6FB   037B 0000 0038
        BNC     L_D708                          ; D6FE   0209 0008

        SDBD                                    ; D700   0001
        CMPI    #$3E00, R3                      ; D701   037B 0000 003E
        BC      L_D708                          ; D704   0201 0002

        SETC                                    ; D706   0007
        MOVR    R5,     R7                      ; D707   00AF

L_D708:
        CLRC                                    ; D708   0006
        MOVR    R5,     R7                      ; D709   00AF
        MOVR    R5,     R7                      ; D70A   00AF

L_D70B:
        PSHR    R5                              ; D70B   0275

        JSR     R5,     X_PLAY_SFX1             ; D70C   0004 0118 03BB
        DECLE   $0079                           ; D70F  SFX data
        DECLE   $00CD                           ; D710  SFX data
        DECLE   $0035                           ; D711  SFX data
        DECLE   $005E                           ; D712  SFX data
        DECLE   $02EB                           ; D713  SFX data
        DECLE   $03BE                           ; D714  SFX data
        DECLE   $02EB                           ; D715  SFX data
        DECLE   $03CF                           ; D716  SFX end

L_D717:
        PSHR    R5                              ; D717   0275

        JSR     R5,     X_PLAY_SFX1             ; D718   0004 0118 03BB
        DECLE   $0040,  $0100                   ; D71B  SFX data
        DECLE   $0048,  $0180                   ; D71D  SFX data
        DECLE   $0044,  $01C0                   ; D71F  SFX data
        DECLE   $000C,  $0200                   ; D721  SFX data
        DECLE   $0309                           ; D723  SFX data
        DECLE   $03ED                           ; D724  SFX data
        DECLE   $000B                           ; D725  SFX data
        DECLE   $03EB                           ; D726  SFX data
        DECLE   $0035                           ; D727  SFX data
        DECLE   $03CF                           ; D728  SFX end

UC_D729:
        MOVR    R7,     R4                      ; D729  SLIB UCALL target
        SUBI    #$0007, R4                      ; D72A   033C 0007
        PULR    R7                              ; D72C   02B7

L_D72D:
        PSHR    R5                              ; D72D   0275

        JSR     R5,     X_PLAY_SFX1             ; D72E   0004 0118 03BB
        DECLE   $03B7                           ; D731  SFX data
        DECLE   $000C,  $0100                   ; D732  SFX data
        DECLE   $0077,  $0029,  $00D7           ; D734  SFX data
        DECLE   $0275                           ; D737  SFX data
        DECLE   $0004,  $0118                   ; D738  SFX data
        DECLE   $03BB                           ; D73A  SFX data
        DECLE   $0079                           ; D73B  SFX data
        DECLE   $03B7                           ; D73C  SFX data
        DECLE   $000C,  $0080                   ; D73D  SFX data
        DECLE   $010D                           ; D73F  SFX data
        DECLE   $010B                           ; D740  SFX data
        DECLE   $03CF                           ; D741  SFX end

L_D742:
        PSHR    R5                              ; D742   0275

        JSR     R5,     X_PLAY_SFX1             ; D743   0004 0118 03BB
        DECLE   $03E9                           ; D746  SFX data
        DECLE   $0300,  $0060                   ; D747  SFX data
        DECLE   $03E2                           ; D749  SFX data
        DECLE   $03EB                           ; D74A  SFX data
        DECLE   $02CF                           ; D74B  SFX end

L_D74C:
        PSHR    R5                              ; D74C   0275
        MVI     G_016B, R0                      ; D74D   0280 016B
        ANDI    #$0004, R0                      ; D74F   03B8 0004
        BNEQ    L_D77B                          ; D751   020C 0028

        MVI     G_01C1, R0                      ; D753   0280 01C1
        CMPI    #$0002, R0                      ; D755   0378 0002
        BNEQ    L_D78E                          ; D757   020C 0035

        JSR     R5,     L_D72D                  ; D759   0004 01D4 032D

        MVI     G_01C3, R0                      ; D75C   0280 01C3
        INCR    R0                              ; D75E   0008
        MVO     R0,     G_01C3                  ; D75F   0240 01C3
        CMPI    #$0001, R0                      ; D761   0378 0001
        BGT     L_D78B                          ; D763   020E 0026

        JSR     R5,     L_D78F                  ; D765   0004 01D4 038F

        BC      L_D76B                          ; D768   0201 0001
        PULR    R7                              ; D76A   02B7

L_D76B:
        CLRR    R0                              ; D76B   01C0
        MVO     R0,     G_01B8                  ; D76C   0240 01B8
        MVI     G_01C2, R0                      ; D76E   0280 01C2
        MVO     R0,     G_01A9                  ; D770   0240 01A9
        MVI     G_016B, R0                      ; D772   0280 016B
        SDBD                                    ; D774   0001
        ANDI    #$FFFE, R0                      ; D775   03B8 00FE 00FF
        MVO     R0,     G_016B                  ; D778   0240 016B
        PULR    R7                              ; D77A   02B7

L_D77B:
        MVI     G_01C1, R0                      ; D77B   0280 01C1
        TSTR    R0                              ; D77D   0080
        BEQ     L_D783                          ; D77E   0204 0003

        JSR     R5,     L_D8AC                  ; D780   0004 01D8 00AC

L_D783:
        MVII    #$0001, R0                      ; D783   02B8 0001
        MVO     R0,     G_01C5                  ; D785   0240 01C5
        CLRR    R0                              ; D787   01C0
        COMR    R0                              ; D788   0018
        MVO     R0,     G_01A9                  ; D789   0240 01A9

L_D78B:
        JSR     R5,     L_D84F                  ; D78B   0004 01D8 004F

L_D78E:
        PULR    R7                              ; D78E   02B7

L_D78F:
        PSHR    R5                              ; D78F   0275

        JSR     R5,     L_D80E                  ; D790   0004 01D8 000E

        MVI@    R4,     R2                      ; D793   02A2
        MVI@    R4,     R3                      ; D794   02A3
        SWAP    R2,     1                       ; D795   0042
        SWAP    R3,     1                       ; D796   0043
        MVI     G_0354, R0                      ; D797   0280 0354
        CMPR    R2,     R0                      ; D799   0150
        BC      L_D7A3                          ; D79A   0201 0007

        MVI     G_01C2, R0                      ; D79C   0280 01C2
        DECR    R0                              ; D79E   0010
        BNEQ    L_D7E5                          ; D79F   020C 0044
        B       L_D7B9                          ; D7A1   0200 0016

L_D7A3:
        CMPR    R3,     R0                      ; D7A3   0158
        BNC     L_D7AD                          ; D7A4   0209 0007

        MVI     G_01C2, R0                      ; D7A6   0280 01C2
        DECR    R0                              ; D7A8   0010
        BEQ     L_D7E5                          ; D7A9   0204 003A
        B       L_D7B9                          ; D7AB   0200 000C

L_D7AD:
        MVI@    R4,     R2                      ; D7AD   02A2
        MVI@    R4,     R3                      ; D7AE   02A3
        SWAP    R2,     1                       ; D7AF   0042
        SWAP    R3,     1                       ; D7B0   0043
        MVI     G_034C, R0                      ; D7B1   0280 034C
        CMPR    R2,     R0                      ; D7B3   0150
        BNC     L_D7B9                          ; D7B4   0209 0003

        CMPR    R3,     R0                      ; D7B6   0158
        BNC     L_D7F5                          ; D7B7   0209 003C

L_D7B9:
        MVI     G_016B, R0                      ; D7B9   0280 016B
        ANDI    #$0001, R0                      ; D7BB   03B8 0001
        BNEQ    L_D7D1                          ; D7BD   020C 0012

        MVII    #$0005, R0                      ; D7BF   02B8 0005

        JSR     R5,     L_D88C                  ; D7C1   0004 01D8 008C

        MVII    #$0001, R0                      ; D7C4   02B8 0001

        JSR     R5,     X_PLAY_RAZZ4            ; D7C6   0004 011C 02C4
        JSR     R5,     L_587F                  ; D7C9   0004 0158 007F
L_D7CC:
        JSR     R5,     L_D84F                  ; D7CC   0004 01D8 004F

        CLRC                                    ; D7CF   0006
        PULR    R7                              ; D7D0   02B7

L_D7D1:
        MVII    #$0006, R0                      ; D7D1   02B8 0006

        JSR     R5,     L_D88C                  ; D7D3   0004 01D8 008C
        JSR     R5,     L_D742                  ; D7D6   0004 01D4 0342

L_D7D9:
        MVII    #$0001, R0                      ; D7D9   02B8 0001
        MVO     R0,     G_01C5                  ; D7DB   0240 01C5
        XOR     G_01C4, R0                      ; D7DD   03C0 01C4
        MVO     R0,     G_01C4                  ; D7DF   0240 01C4
        BEQ     L_D7CC                          ; D7E1   0224 0016
        B       L_D808                          ; D7E3   0200 0023

L_D7E5:
        MVII    #$0006, R0                      ; D7E5   02B8 0006

        JSR     R5,     L_D88C                  ; D7E7   0004 01D8 008C
        JSR     R5,     L_D742                  ; D7EA   0004 01D4 0342

        MVI     G_016B, R0                      ; D7ED   0280 016B
        ANDI    #$0001, R0                      ; D7EF   03B8 0001
        BNEQ    L_D7D9                          ; D7F1   022C 0019
        B       L_D7CC                          ; D7F3   0220 0028

L_D7F5:
        MVI     G_01BB, R0                      ; D7F5   0280 01BB
        TSTR    R0                              ; D7F7   0080
        BNEQ    L_D7FC                          ; D7F8   020C 0002

        SETC                                    ; D7FA   0007
        PULR    R7                              ; D7FB   02B7

L_D7FC:
        MVII    #$0007, R0                      ; D7FC   02B8 0007

        JSR     R5,     L_D88C                  ; D7FE   0004 01D8 008C
        JSR     R5,     L_D742                  ; D801   0004 01D4 0342

        MVII    #$0001, R0                      ; D804   02B8 0001
        MVO     R0,     G_01C5                  ; D806   0240 01C5
L_D808:
        CLRR    R0                              ; D808   01C0
        COMR    R0                              ; D809   0018
        MVO     R0,     G_01A9                  ; D80A   0240 01A9
        B       L_D7CC                          ; D80C   0220 0041

L_D80E:
        MVI     G_016B, R0                      ; D80E   0280 016B
        ANDI    #$0001, R0                      ; D810   03B8 0001
        BEQ     L_D81E                          ; D812   0204 000A

        SDBD                                    ; D814   0001
        MVII    #$D83F, R4                      ; D815   02BC 003F 00D8
        MVI     G_01BA, R0                      ; D818   0280 01BA
        DECR    R0                              ; D81A   0010
        SLL     R0,     2                       ; D81B   004C
        ADDR    R0,     R4                      ; D81C   00C4
        MOVR    R5,     R7                      ; D81D   00AF

L_D81E:
        SDBD                                    ; D81E   0001
        MVII    #$D82F, R4                      ; D81F   02BC 002F 00D8
        MVI     G_01C2, R0                      ; D822   0280 01C2
        DECR    R0                              ; D824   0010
        SLL     R0,     2                       ; D825   004C
        SLL     R0,     1                       ; D826   0048
        ADDR    R0,     R4                      ; D827   00C4
        MVI     G_0180, R0                      ; D828   0280 0180
        SUBI    #$0003, R0                      ; D82A   0338 0003
        SLL     R0,     1                       ; D82C   0048
        ADDR    R0,     R4                      ; D82D   00C4
        MOVR    R5,     R7                      ; D82E   00AF

        ADCR    R3                              ; D82F   002B
        SARC    R1,     2                       ; D830   007D
        GSWD    R0                              ; D831   0030
        MOVR    R0,     R4                      ; D832   0084
        ADCR    R3                              ; D833   002B
        SARC    R1,     2                       ; D834   007D
        NEGR    R6                              ; D835   0026
        MOVR    R1,     R6                      ; D836   008E
        SARC    R1,     2                       ; D837   007D
        ADDR    R3,     R4                      ; D838   00DC
        ADCR    R6                              ; D839   002E
        MOVR    R0,     R6                      ; D83A   0086
        SARC    R1,     2                       ; D83B   007D
        ADDR    R3,     R4                      ; D83C   00DC
        NEGR    R4                              ; D83D   0024
        MOVR    R2,     R0                      ; D83E   0090
        SLL     R1,     2                       ; D83F   004D
        SARC    R1,     2                       ; D840   007D
        GSWD    R0                              ; D841   0030
        SLLC    R1,     1                       ; D842   0059
        SLL     R1,     2                       ; D843   004D
        SARC    R1,     2                       ; D844   007D
        SLLC    R1,     1                       ; D845   0059
        MOVR    R0,     R4                      ; D846   0084
        SARC    R1,     2                       ; D847   007D
        MOVR    R6,     R1                      ; D848   00B1
        ADCR    R6                              ; D849   002E
        SLLC    R1,     1                       ; D84A   0059
        SARC    R1,     2                       ; D84B   007D
        MOVR    R6,     R1                      ; D84C   00B1
        SLLC    R1,     1                       ; D84D   0059
        MOVR    R0,     R6                      ; D84E   0086
L_D84F:
        PSHR    R5                              ; D84F   0275
        MVI     G_01C1, R0                      ; D850   0280 01C1
        TSTR    R0                              ; D852   0080
        BEQ     L_D858                          ; D853   0204 0003

        JSR     R5,     L_D859                  ; D855   0004 01D8 0059

L_D858:
        PULR    R7                              ; D858   02B7

L_D859:
        PSHR    R5                              ; D859   0275
        CLRR    R0                              ; D85A   01C0
        MVO     R0,     G_01C1                  ; D85B   0240 01C1
        MVI     G_01C5, R0                      ; D85D   0280 01C5
        TSTR    R0                              ; D85F   0080
        BNEQ    L_D865                          ; D860   020C 0003

        CLRR    R0                              ; D862   01C0
        MVO     R0,     G_01C4                  ; D863   0240 01C4
L_D865:
        MVI     G_01C6, R0                      ; D865   0280 01C6
        TSTR    R0                              ; D867   0080
        BNEQ    L_D870                          ; D868   020C 0006

        MVI     G_01C7, R0                      ; D86A   0280 01C7
        CMPI    #$0007, R0                      ; D86C   0378 0007
        BLT     L_D875                          ; D86E   0205 0005

L_D870:
        MVII    #$0003, R0                      ; D870   02B8 0003

        JSR     R5,     X_PLAY_CHEER1           ; D872   0004 011C 02D5
L_D875:
        JSR     R5,     L_D199                  ; D875   0004 01D0 0199

        CLRR    R0                              ; D878   01C0
        MVO     R0,     G_01C5                  ; D879   0240 01C5
        MVO     R0,     G_01BB                  ; D87B   0240 01BB
        MVO     R0,     G_01C6                  ; D87D   0240 01C6
        MVO     R0,     G_01C7                  ; D87F   0240 01C7
        MVI     G_016B, R0                      ; D881   0280 016B
        SDBD                                    ; D883   0001
        ANDI    #$FFFE, R0                      ; D884   03B8 00FE 00FF
        XORI    #$0001, R0                      ; D887   03F8 0001
        MVO     R0,     G_016B                  ; D889   0240 016B
        PULR    R7                              ; D88B   02B7

L_D88C:
        PSHR    R5                              ; D88C   0275
        MVI     G_01C9, R1                      ; D88D   0281 01C9
        TSTR    R1                              ; D88F   0089
        BEQ     L_D89A                          ; D890   0204 0008

        MOVR    R1,     R2                      ; D892   008A
L_D893:
        SLL     R0,     2                       ; D893   004C
        SLL     R0,     2                       ; D894   004C
        DECR    R2                              ; D895   0012
        BNEQ    L_D893                          ; D896   022C 0004

        XOR     G_035C, R0                      ; D898   03C0 035C
L_D89A:
        MVO     R0,     G_035C                  ; D89A   0240 035C
        INCR    R1                              ; D89C   0009
        MVO     R1,     G_01C9                  ; D89D   0241 01C9
        CMPI    #$0001, R1                      ; D89F   0379 0001
        BNEQ    L_D8AB                          ; D8A1   020C 0008

        MOVR    R1,     R0                      ; D8A3   0088
        SDBD                                    ; D8A4   0001
        MVII    #$5020, R1                      ; D8A5   02B9 0020 0050

        JSR     R5,     .EXEC.831               ; D8A8   0004 0118 0031

L_D8AB:
        PULR    R7                              ; D8AB   02B7

L_D8AC:
        PSHR    R5                              ; D8AC   0275
        MVI     G_01B8, R2                      ; D8AD   0282 01B8
        MVII    #$0160, R1                      ; D8AF   02B9 0160
        ADDR    R2,     R1                      ; D8B1   00D1
        J       L_DE0E                          ; D8B2   0004 03DC 020E

        DECLE   $00C1,  $00D8,  $00D6,  $00D8   ; D8B5   00C1 00D8 00D6 00D8
        DECLE   $00D6,  $00D8,  $00EE,  $00D8   ; D8B9   00D6 00D8 00EE 00D8
        DECLE   $00FD,  $00D8,  $00FD,  $00D8   ; D8BD   00FD 00D8 00FD 00D8
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8C1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $00D6   ; D8C5   0000 0000 001C 00D6
        DECLE   $01E7,  $003B,  $00D6,  $0141   ; D8C9   01E7 003B 00D6 0141
        DECLE   $005A,  $00D6,  $0141,  $0000   ; D8CD   005A 00D6 0141 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8D1   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8D5   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8D9   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8DD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8E1   0000 0000 0000 0000
        DECLE   $0054,  $00B5,  $0125,  $0054   ; D8E5   0054 00B5 0125 0054
        DECLE   $00B5,  $0145,  $0054,  $00B5   ; D8E9   00B5 0145 0054 00B5
        DECLE   $0125,  $0000,  $0000,  $0000   ; D8ED   0125 0000 0000 0000
        DECLE   $0100,  $00D6,  $01E7,  $00F1   ; D8F1   0100 00D6 01E7 00F1
        DECLE   $00D6,  $0141,  $00D2,  $00D6   ; D8F5   00D6 0141 00D2 00D6
        DECLE   $0141,  $0000,  $0000,  $0000   ; D8F9   0141 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D8FD   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D901   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D905   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; D909   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; D90D   0000 0000

        GSWD    R3                              ; D90F   0033
        MOVR    R6,     R5                      ; D910   00B5
        CMPR    R0,     R7                      ; D911   0147
        GSWD    R3                              ; D912   0033
        MOVR    R6,     R5                      ; D913   00B5
        SUBR    R4,     R7                      ; D914   0127

        DECLE   $004F,  $0035,  $004F,  $0044   ; D915   004F 0035 004F 0044
        DECLE   $004F,  $0050,  $004F,  $0080   ; D919   004F 0050 004F 0080
        DECLE   $004F,  $0070,  $004F,  $0064   ; D91D   004F 0070 004F 0064
        DECLE   $00B1,  $0035                   ; D921   00B1 0035

        MOVR    R6,     R1                      ; D923   00B1
        SWAP    R0,     2                       ; D924   0044
        MOVR    R6,     R1                      ; D925   00B1
        RLC     R0,     1                       ; D926   0050
        MOVR    R6,     R1                      ; D927   00B1
        TSTR    R0                              ; D928   0080
        MOVR    R6,     R1                      ; D929   00B1
        RRC     R0,     1                       ; D92A   0070
        MOVR    R6,     R1                      ; D92B   00B1
        SLR     R0,     2                       ; D92C   0064
        SUBR    R0,     R0                      ; D92D   0100
        ANDR    R4,     R0                      ; D92E   01A0
        MVO@    R0,     R2                      ; D92F   0250
        SUB     G_004F, R0                      ; D930   0300 004F
        MOVR    R1,     R0                      ; D932   0088
        SLL     R3,     2                       ; D933   004F
        SARC    R1,     2                       ; D934   007D
        SLL     R3,     2                       ; D935   004F
        RRC     R2,     1                       ; D936   0072
        SLL     R3,     2                       ; D937   004F
        SLR     R0,     2                       ; D938   0064
        SLL     R3,     2                       ; D939   004F
        SLLC    R0,     1                       ; D93A   0058
        SLL     R3,     2                       ; D93B   004F
        SLL     R0,     2                       ; D93C   004C
        SLL     R3,     2                       ; D93D   004F
        RSWD    R3                              ; D93E   003B
        SLL     R3,     2                       ; D93F   004F
        ADCR    R4                              ; D940   002C
        MOVR    R6,     R1                      ; D941   00B1
        ADCR    R4                              ; D942   002C
        MOVR    R6,     R1                      ; D943   00B1
        RSWD    R3                              ; D944   003B
        MOVR    R6,     R1                      ; D945   00B1
        SLL     R0,     2                       ; D946   004C
        MOVR    R6,     R1                      ; D947   00B1
        SLLC    R0,     1                       ; D948   0058
        MOVR    R6,     R1                      ; D949   00B1
        SLR     R0,     2                       ; D94A   0064
        MOVR    R6,     R1                      ; D94B   00B1
        RRC     R2,     1                       ; D94C   0072
        MOVR    R6,     R1                      ; D94D   00B1
        SARC    R1,     2                       ; D94E   007D
        MOVR    R6,     R1                      ; D94F   00B1
        MOVR    R1,     R0                      ; D950   0088
L_D951:
        PSHR    R5                              ; D951   0275
        MVII    #$0160, R1                      ; D952   02B9 0160
        ADDR    R2,     R1                      ; D954   00D1
        MVI@    R1,     R0                      ; D955   0288
        ANDI    #$0012, R0                      ; D956   03B8 0012
        CMPI    #$0002, R0                      ; D958   0378 0002
        BNEQ    L_D9DA                          ; D95A   020C 007E

        PSHR    R1                              ; D95C   0271

        JSR     R5,     L_DAF4                  ; D95D   0004 01D8 02F4

        PULR    R1                              ; D960   02B1
        TSTR    R0                              ; D961   0080
        BEQ     L_D9DA                          ; D962   0204 0076

        MVI     G_01C1, R0                      ; D964   0280 01C1
        TSTR    R0                              ; D966   0080
        BEQ     L_D9DA                          ; D967   0204 0071

        MVI     G_0180, R0                      ; D969   0280 0180
        CMPI    #$0005, R0                      ; D96B   0378 0005
        BNEQ    L_D99D                          ; D96D   020C 002E

        MVI     G_01C7, R0                      ; D96F   0280 01C7
        CMPI    #$0001, R0                      ; D971   0378 0001
        BNEQ    L_D99D                          ; D973   020C 0028

        MVI     G_0174, R0                      ; D975   0280 0174

        JSR     R5,     L_D171                  ; D977   0004 01D0 0171

        BLE     L_D97E                          ; D97A   0206 0002

        MVI     G_0173, R0                      ; D97C   0280 0173
L_D97E:
        ANDI    #$0007, R0                      ; D97E   03B8 0007
        CMPR    R0,     R2                      ; D980   0142
        BEQ     L_D99D                          ; D981   0204 001A

        PSHR    R1                              ; D983   0271
        PSHR    R2                              ; D984   0272

        JSR     R5,     L_D78F                  ; D985   0004 01D4 038F

        BNC     L_D98E                          ; D988   0209 0004

        MVI     G_01C2, R0                      ; D98A   0280 01C2
        MVO     R0,     G_01A9                  ; D98C   0240 01A9
L_D98E:
        MVII    #$0006, R0                      ; D98E   02B8 0006

        JSR     R5,     L_D88C                  ; D990   0004 01D8 008C
        JSR     R5,     L_D742                  ; D993   0004 01D4 0342
        JSR     R5,     L_D84F                  ; D996   0004 01D8 004F

        PULR    R2                              ; D999   02B2
        PULR    R1                              ; D99A   02B1
        B       L_D9DA                          ; D99B   0200 003D

L_D99D:
        MVI@    R1,     R0                      ; D99D   0288
        XORI    #$0010, R0                      ; D99E   03F8 0010
        MVO@    R0,     R1                      ; D9A0   0248
        ANDI    #$0008, R0                      ; D9A1   03B8 0008
        MVO     R0,     G_01C6                  ; D9A3   0240 01C6
        PSHR    R1                              ; D9A5   0271
        MVII    #$0164, R1                      ; D9A6   02B9 0164
        ADDR    R2,     R1                      ; D9A8   00D1
        MVI@    R1,     R0                      ; D9A9   0288
        MVO     R0,     G_01EC                  ; D9AA   0240 01EC
        PULR    R1                              ; D9AC   02B1
        MVI     G_01C7, R0                      ; D9AD   0280 01C7
        INCR    R0                              ; D9AF   0008
        MVO     R0,     G_01C7                  ; D9B0   0240 01C7
        MVI     G_016B, R0                      ; D9B2   0280 016B
        XORI    #$0002, R0                      ; D9B4   03F8 0002
        MVO     R0,     G_016B                  ; D9B6   0240 016B
        MVI     G_01B8, R1                      ; D9B8   0281 01B8
        SUBR    R2,     R1                      ; D9BA   0111
        BNEQ    L_D9DB                          ; D9BB   020C 001E

        MOVR    R0,     R1                      ; D9BD   0081
        ANDI    #$0001, R0                      ; D9BE   03B8 0001
        BEQ     L_D9FC                          ; D9C0   0204 003A

        JSR     R5,     L_DAB5                  ; D9C2   0004 01D8 02B5

L_D9C5:
        MVII    #$0002, R1                      ; D9C5   02B9 0002

        JSR     R5,     L_D171                  ; D9C7   0004 01D0 0171

        BLE     L_D9CD                          ; D9CA   0206 0001

        DECR    R1                              ; D9CC   0011
L_D9CD:
        MVO     R1,     G_01C2                  ; D9CD   0241 01C2
        CLRR    R1                              ; D9CF   01C9
        MVO     R1,     G_01C3                  ; D9D0   0241 01C3

        JSR     R5,     L_DBF4                  ; D9D2   0004 01D8 03F4

        BNEQ    L_DA11                          ; D9D5   020C 003A

        JSR     R5,     L_D717                  ; D9D7   0004 01D4 0317

L_D9DA:
        PULR    R7                              ; D9DA   02B7

L_D9DB:
        ANDI    #$0001, R0                      ; D9DB   03B8 0001
        BEQ     L_D9FC                          ; D9DD   0204 001D

        PSHR    R2                              ; D9DF   0272

        JSR     R5,     L_D78F                  ; D9E0   0004 01D4 038F

        PULR    R2                              ; D9E3   02B2
        BNC     L_D9F7                          ; D9E4   0209 0011

        PSHR    R2                              ; D9E6   0272
        MVI     G_01C2, R0                      ; D9E7   0280 01C2
        MVO     R0,     G_01A9                  ; D9E9   0240 01A9
        MVII    #$0006, R0                      ; D9EB   02B8 0006

        JSR     R5,     L_D88C                  ; D9ED   0004 01D8 008C
        JSR     R5,     L_D742                  ; D9F0   0004 01D4 0342
        JSR     R5,     L_D84F                  ; D9F3   0004 01D8 004F

        PULR    R2                              ; D9F6   02B2

L_D9F7:
        JSR     R5,     L_DA26                  ; D9F7   0004 01D8 0226

        B       L_D9C5                          ; D9FA   0220 0036

L_D9FC:
        MVI     G_01C3, R1                      ; D9FC   0281 01C3
        TSTR    R1                              ; D9FE   0089
        BNEQ    L_D9F7                          ; D9FF   022C 0009

        MVO     R1,     G_01B8                  ; DA01   0241 01B8
        MVI     G_01C2, R1                      ; DA03   0281 01C2
        MVO     R1,     G_01A9                  ; DA05   0241 01A9
        MVI     G_016B, R1                      ; DA07   0281 016B
        SDBD                                    ; DA09   0001
        ANDI    #$FFFE, R1                      ; DA0A   03B9 00FE 00FF
        MVO     R1,     G_016B                  ; DA0D   0241 016B
        B       L_D9F7                          ; DA0F   0220 0019

L_DA11:
        NOP                                     ; DA11   0034

        JSR     R5,     L_5B92                  ; DA12   0004 0158 0392

        MVII    #$0010, R1                      ; DA15   02B9 0010
        RRC     R3,     1                       ; DA17   0073
        BNC     L_DA1B                          ; DA18   0209 0001

        SLL     R1,     1                       ; DA1A   0049
L_DA1B:
        COMR    R1                              ; DA1B   0019
        MVI     G_0169, R3                      ; DA1C   0283 0169
        ANDR    R1,     R3                      ; DA1E   018B
        MVO     R3,     G_0169                  ; DA1F   0243 0169

        JSR     R5,     L_D717                  ; DA21   0004 01D4 0317

        B       L_D9DA                          ; DA24   0220 004B

L_DA26:
        PSHR    R5                              ; DA26   0275

        JSR     R5,     L_DCA3                  ; DA27   0004 01DC 00A3
        DECLE   $020C,  $0015,  $0004           ; DA2A   020C 0015 0004

        XORR    R5,     R0                      ; DA2D   01E8
        CMPR    R2,     R0                      ; DA2E   0150

        JSR     R5,     L_DA56                  ; DA2F   0004 01D8 0256

L_DA32:
        PSHR    R2                              ; DA32   0272
        SDBD                                    ; DA33   0001
        MVII    #$0A00, R0                      ; DA34   02B8 0000 000A
        SWAP    R0,     1                       ; DA37   0040
        MVO     R0,     G_01EB                  ; DA38   0240 01EB

        JSR     R5,     L_DC2A                  ; DA3A   0004 01DC 002A

        PULR    R2                              ; DA3D   02B2
        PULR    R7                              ; DA3E   02B7

        DECLE   $0220,  $0014                   ; DA3F   0220 0014

        MOVR    R2,     R1                      ; DA41   0091
        DECR    R1                              ; DA42   0011
        MOVR    R1,     R0                      ; DA43   0088
        SLR     R1,     1                       ; DA44   0061
        ADDI    #$01E8, R1                      ; DA45   02F9 01E8
        MVI@    R1,     R1                      ; DA47   0289
        SARC    R0,     1                       ; DA48   0078
        BC      L_DA52                          ; DA49   0201 0007

L_DA4B:
        ANDI    #$000F, R1                      ; DA4B   03B9 000F

        JSR     R5,     L_DA56                  ; DA4D   0004 01D8 0256

        B       L_DA32                          ; DA50   0220 001F

L_DA52:
        SLR     R1,     2                       ; DA52   0065
        SLR     R1,     2                       ; DA53   0065
        B       L_DA4B                          ; DA54   0220 000A

L_DA56:
        PSHR    R5                              ; DA56   0275
        MVII    #$000F, R0                      ; DA57   02B8 000F

        JSR     R5,     L_D171                  ; DA59   0004 01D0 0171

        BLE     L_DA64                          ; DA5C   0206 0006

        CMPI    #$0008, R1                      ; DA5E   0379 0008
        BNC     L_DA6A                          ; DA60   0209 0008
        B       L_DA68                          ; DA62   0200 0004

L_DA64:
        CMPI    #$0008, R1                      ; DA64   0379 0008
        BC      L_DA6A                          ; DA66   0201 0002

L_DA68:
        SUBR    R1,     R0                      ; DA68   0108
        MOVR    R0,     R1                      ; DA69   0081
L_DA6A:
        PSHR    R2                              ; DA6A   0272
        ADDR    R1,     R1                      ; DA6B   00C9
        SDBD                                    ; DA6C   0001
        ADDI    #$D931, R1                      ; DA6D   02F9 0031 00D9
        MOVR    R1,     R4                      ; DA70   008C
        SDBD                                    ; DA71   0001
        MVI@    R4,     R1                      ; DA72   02A1
        MVII    #$0028, R0                      ; DA73   02B8 0028

        JSR     R5,     L_DA8A                  ; DA75   0004 01D8 028A
        JSR     R5,     L_DC7C                  ; DA78   0004 01DC 007C
        JSR     R5,     L_5BAA                  ; DA7B   0004 0158 03AA
        DECLE   $0083,  $008A,  $0004           ; DA7E   0083 008A 0004

        XORR    R5,     R0                      ; DA81   01E8
        MOVR    R2,     R1                      ; DA82   0091
        SLL     R0,     1                       ; DA83   0048
        MVO     R0,     G_0334                  ; DA84   0240 0334
        MVO     R1,     G_033C                  ; DA86   0241 033C
        PULR    R2                              ; DA88   02B2
        PULR    R7                              ; DA89   02B7

L_DA8A:
        PSHR    R5                              ; DA8A   0275
        PSHR    R2                              ; DA8B   0272
        PSHR    R1                              ; DA8C   0271
        PSHR    R0                              ; DA8D   0270
        MVI     G_0354, R1                      ; DA8E   0281 0354
        SWAP    R1,     1                       ; DA90   0041
        ANDI    #$00FF, R1                      ; DA91   03B9 00FF
        SDBD                                    ; DA93   0001
        MVII    #$7D00, R0                      ; DA94   02B8 0000 007D
        SWAP    R0,     1                       ; DA97   0040
        ANDI    #$00FF, R0                      ; DA98   03B8 00FF

        JSR     R5,     L_D171                  ; DA9A   0004 01D0 0171

        BLE     L_DAA2                          ; DA9D   0206 0003

        XORR    R0,     R1                      ; DA9F   01C1
        XORR    R1,     R0                      ; DAA0   01C8
        XORR    R0,     R1                      ; DAA1   01C1
L_DAA2:
        SUBR    R1,     R0                      ; DAA2   0108
        SLR     R0,     2                       ; DAA3   0064
        ADDI    #$0050, R0                      ; DAA4   02F8 0050
        MOVR    R0,     R1                      ; DAA6   0081
        SDBD                                    ; DAA7   0001
        MVII    #$7D00, R2                      ; DAA8   02BA 0000 007D
        SWAP    R2,     1                       ; DAAB   0042
        ANDI    #$00FF, R2                      ; DAAC   03BA 00FF
        PULR    R0                              ; DAAE   02B0

        JSR     R5,     L_57CB                  ; DAAF   0004 0154 03CB

        PULR    R1                              ; DAB2   02B1
        PULR    R2                              ; DAB3   02B2
        PULR    R7                              ; DAB4   02B7

L_DAB5:
        PSHR    R5                              ; DAB5   0275
        MVII    #$0030, R0                      ; DAB6   02B8 0030

        JSR     R5,     L_DC7C                  ; DAB8   0004 01DC 007C
        JSR     R5,     L_5BAA                  ; DABB   0004 0158 03AA

        PSHR    R0                              ; DABE   0270

        JSR     R5,     L_DAE0                  ; DABF   0004 01D8 02E0
        DECLE   $008A,  $02B3,  $0004           ; DAC2   008A 02B3 0004

        XORR    R5,     R0                      ; DAC5   01E8
        MOVR    R2,     R1                      ; DAC6   0091
        SLL     R0,     1                       ; DAC7   0048
        MVO     R0,     G_0334                  ; DAC8   0240 0334
        MVO     R1,     G_033C                  ; DACA   0241 033C
        MVI     G_01B8, R2                      ; DACC   0282 01B8
        MVI     G_01E2, R0                      ; DACE   0280 01E2
        ADDR    R0,     R0                      ; DAD0   00C0
        ADDI    #$0004, R0                      ; DAD1   02F8 0004

        JSR     R5,     L_DB40                  ; DAD3   0004 01D8 0340

        BEQ     L_DADA                          ; DAD6   0204 0002

        SUBI    #$0002, R0                      ; DAD8   0338 0002
L_DADA:
        MVO     R0,     G_01EB                  ; DADA   0240 01EB

        JSR     R5,     L_DC2A                  ; DADC   0004 01DC 002A

        PULR    R7                              ; DADF   02B7

L_DAE0:
        PSHR    R5                              ; DAE0   0275
        MVI     G_01BA, R1                      ; DAE1   0281 01BA
        DECR    R1                              ; DAE3   0011
        SLL     R1,     1                       ; DAE4   0049
        MOVR    R1,     R0                      ; DAE5   0088
        SLL     R1,     1                       ; DAE6   0049
        ADDR    R0,     R1                      ; DAE7   00C1
        ADD     G_01B9, R1                      ; DAE8   02C1 01B9
        ADD     G_01B9, R1                      ; DAEA   02C1 01B9
        SDBD                                    ; DAEC   0001
        ADDI    #$D915, R1                      ; DAED   02F9 0015 00D9
        MOVR    R1,     R4                      ; DAF0   008C
        SDBD                                    ; DAF1   0001
        MVI@    R4,     R1                      ; DAF2   02A1
        PULR    R7                              ; DAF3   02B7

L_DAF4:
        PSHR    R5                              ; DAF4   0275

        JSR     R5,     L_DBA1                  ; DAF5   0004 01D8 03A1

        PSHR    R1                              ; DAF8   0271
        MVI     G_034C, R1                      ; DAF9   0281 034C
        SWAP    R1,     1                       ; DAFB   0041
        ANDI    #$00FF, R1                      ; DAFC   03B9 00FF
        MOVR    R1,     R4                      ; DAFE   008C
        MOVR    R0,     R3                      ; DAFF   0083
        CLRR    R1                              ; DB00   01C9

        JSR     R5,     L_DB54                  ; DB01   0004 01D8 0354
        JSR     R5,     L_DB7C                  ; DB04   0004 01D8 037C
        JSR     R5,     L_DBBE                  ; DB07   0004 01D8 03BE

        MVO     R0,     G_01E0                  ; DB0A   0240 01E0
        TSTR    R0                              ; DB0C   0080
        PULR    R3                              ; DB0D   02B3
        BEQ     L_DB3D                          ; DB0E   0204 002D

        MVI     G_0354, R1                      ; DB10   0281 0354
        SWAP    R1,     1                       ; DB12   0041
        ANDI    #$00FF, R1                      ; DB13   03B9 00FF
        MOVR    R1,     R4                      ; DB15   008C
        MVII    #$0001, R1                      ; DB16   02B9 0001

        JSR     R5,     L_DB54                  ; DB18   0004 01D8 0354
        JSR     R5,     L_DB7C                  ; DB1B   0004 01D8 037C
        JSR     R5,     L_DBBE                  ; DB1E   0004 01D8 03BE

        MVO     R0,     G_01E1                  ; DB21   0240 01E1
        TSTR    R0                              ; DB23   0080
        BEQ     L_DB3D                          ; DB24   0204 0017

        MVI     G_032C, R1                      ; DB26   0281 032C
        SWAP    R1,     1                       ; DB28   0041
        ANDI    #$00FF, R1                      ; DB29   03B9 00FF
        MOVR    R1,     R4                      ; DB2B   008C
        CLRR    R3                              ; DB2C   01DB
        MVII    #$0002, R1                      ; DB2D   02B9 0002

        JSR     R5,     L_DB54                  ; DB2F   0004 01D8 0354
        JSR     R5,     L_DBBE                  ; DB32   0004 01D8 03BE

        MVO     R0,     G_01E2                  ; DB35   0240 01E2
        TSTR    R0                              ; DB37   0080
        BEQ     L_DB3D                          ; DB38   0204 0003

        MVII    #$0001, R0                      ; DB3A   02B8 0001
L_DB3C:
        PULR    R7                              ; DB3C   02B7

L_DB3D:
        CLRR    R0                              ; DB3D   01C0
        B       L_DB3C                          ; DB3E   0220 0003

L_DB40:
        PSHR    R5                              ; DB40   0275
        PSHR    R1                              ; DB41   0271
        MVII    #$0160, R1                      ; DB42   02B9 0160
        ADDR    R2,     R1                      ; DB44   00D1
        MVI@    R1,     R1                      ; DB45   0289
        ANDI    #$0004, R1                      ; DB46   03B9 0004
        PULR    R1                              ; DB48   02B1
        PULR    R7                              ; DB49   02B7

L_DB4A:
        PSHR    R5                              ; DB4A   0275
        PSHR    R1                              ; DB4B   0271
        MVII    #$0160, R1                      ; DB4C   02B9 0160
        ADDR    R2,     R1                      ; DB4E   00D1
        MVI@    R1,     R1                      ; DB4F   0289
        ANDI    #$0008, R1                      ; DB50   03B9 0008
        PULR    R1                              ; DB52   02B1
        PULR    R7                              ; DB53   02B7

L_DB54:
        PSHR    R5                              ; DB54   0275
        SDBD                                    ; DB55   0001
        MVII    #$D8B5, R0                      ; DB56   02B8 00B5 00D8

        JSR     R5,     L_5B59                  ; DB59   0004 0158 0359
        JSR     R5,     L_DB60                  ; DB5C   0004 01D8 0360

        PULR    R7                              ; DB5F   02B7

L_DB60:
        PSHR    R5                              ; DB60   0275
        PSHR    R3                              ; DB61   0273
        ANDI    #$03FF, R0                      ; DB62   03B8 03FF
        MOVR    R0,     R3                      ; DB64   0083
        MOVR    R0,     R1                      ; DB65   0081
        ANDI    #$000F, R0                      ; DB66   03B8 000F
        ANDI    #$0010, R1                      ; DB68   03B9 0010
        BEQ     L_DB6D                          ; DB6A   0204 0001

        NEGR    R0                              ; DB6C   0020
L_DB6D:
        MOVR    R3,     R1                      ; DB6D   0099
        SAR     R1,     2                       ; DB6E   006D
        SAR     R1,     2                       ; DB6F   006D
        SAR     R1,     1                       ; DB70   0069
        ANDI    #$000F, R1                      ; DB71   03B9 000F
        ANDI    #$0200, R3                      ; DB73   03BB 0200
        BEQ     L_DB78                          ; DB75   0204 0001

        NEGR    R1                              ; DB77   0021
L_DB78:
        PULR    R3                              ; DB78   02B3
        SLL     R0,     1                       ; DB79   0048
        SLL     R1,     1                       ; DB7A   0049
        PULR    R7                              ; DB7B   02B7

L_DB7C:
        PSHR    R5                              ; DB7C   0275

        JSR     R5,     L_DCA3                  ; DB7D   0004 01DC 00A3

        BEQ     L_DB96                          ; DB80   0204 0014

        PSHR    R2                              ; DB82   0272
        PSHR    R1                              ; DB83   0271
        MOVR    R0,     R1                      ; DB84   0081
        SLL     R1,     1                       ; DB85   0049
        MVII    #$0003, R2                      ; DB86   02BA 0003

        JSR     R5,     X_DIV                   ; DB88   0004 011C 01FB

        PULR    R1                              ; DB8B   02B1
        PSHR    R0                              ; DB8C   0270
        SLL     R1,     1                       ; DB8D   0049
        MVII    #$0003, R2                      ; DB8E   02BA 0003

        JSR     R5,     X_DIV                   ; DB90   0004 011C 01FB

        MOVR    R0,     R1                      ; DB93   0081
        PULR    R0                              ; DB94   02B0
        PULR    R2                              ; DB95   02B2

L_DB96:
        JSR     R5,     L_D171                  ; DB96   0004 01D0 0171

        BLE     L_DBA0                          ; DB99   0206 0005

        NEGR    R0                              ; DB9B   0020
        NEGR    R1                              ; DB9C   0021
        XORR    R0,     R1                      ; DB9D   01C1
        XORR    R1,     R0                      ; DB9E   01C8
        XORR    R0,     R1                      ; DB9F   01C1
L_DBA0:
        PULR    R7                              ; DBA0   02B7

L_DBA1:
        PSHR    R5                              ; DBA1   0275
        PSHR    R2                              ; DBA2   0272

        JSR     R5,     L_D181                  ; DBA3   0004 01D0 0181

        ADDI    #$0002, R1                      ; DBA6   02F9 0002
        PSHR    R1                              ; DBA8   0271
        INCR    R1                              ; DBA9   0009
        MVI@    R1,     R0                      ; DBAA   0288
        ADDI    #$0000, R0                      ; DBAB   02F8 0000

        JSR     R5,     L_D6A8                  ; DBAD   0004 01D4 02A8

        PULR    R1                              ; DBB0   02B1
        MVI@    R1,     R0                      ; DBB1   0288
        SDBD                                    ; DBB2   0001
        ADDI    #$0400, R0                      ; DBB3   02F8 0000 0004
        MOVR    R2,     R1                      ; DBB6   0091
        PSHR    R1                              ; DBB7   0271

        JSR     R5,     L_D687                  ; DBB8   0004 01D4 0287

        PULR    R1                              ; DBBB   02B1
        PULR    R2                              ; DBBC   02B2
        PULR    R7                              ; DBBD   02B7

L_DBBE:
        PSHR    R5                              ; DBBE   0275
        PSHR    R1                              ; DBBF   0271
        SUBR    R0,     R1                      ; DBC0   0101
        PULR    R1                              ; DBC1   02B1
        BEQ     L_DBDA                          ; DBC2   0204 0016

        ADDR    R3,     R0                      ; DBC4   00D8
        ADDR    R3,     R1                      ; DBC5   00D9
        CMPR    R0,     R4                      ; DBC6   0144
        BMI     L_DBDA                          ; DBC7   020B 0011
        BNEQ    L_DBCE                          ; DBC9   020C 0003

        JSR     R5,     L_DBDD                  ; DBCB   0004 01D8 03DD

L_DBCE:
        CMPR    R4,     R1                      ; DBCE   0161
        BMI     L_DBDA                          ; DBCF   020B 0009
        BNEQ    L_DBD6                          ; DBD1   020C 0003

        JSR     R5,     L_DBDD                  ; DBD3   0004 01D8 03DD

L_DBD6:
        SUBR    R0,     R4                      ; DBD6   0104
        MOVR    R4,     R0                      ; DBD7   00A0
        INCR    R0                              ; DBD8   0008
L_DBD9:
        PULR    R7                              ; DBD9   02B7

L_DBDA:
        CLRR    R0                              ; DBDA   01C0
        B       L_DBD9                          ; DBDB   0220 0003

L_DBDD:
        PSHR    R5                              ; DBDD   0275
        PSHR    R1                              ; DBDE   0271
        PSHR    R3                              ; DBDF   0273
        MVII    #$0010, R1                      ; DBE0   02B9 0010

        JSR     R5,     L_5B92                  ; DBE2   0004 0158 0392

        RRC     R3,     1                       ; DBE5   0073
        BNC     L_DBE9                          ; DBE6   0209 0001

        SLL     R1,     1                       ; DBE8   0049
L_DBE9:
        COMR    R1                              ; DBE9   0019
        MVI     G_0169, R3                      ; DBEA   0283 0169
        ANDR    R1,     R3                      ; DBEC   018B
        COMR    R1                              ; DBED   0019
        XORR    R1,     R3                      ; DBEE   01CB
        MVO     R3,     G_0169                  ; DBEF   0243 0169
        PULR    R3                              ; DBF1   02B3
        PULR    R1                              ; DBF2   02B1
        PULR    R7                              ; DBF3   02B7

L_DBF4:
        PSHR    R5                              ; DBF4   0275
        PSHR    R1                              ; DBF5   0271
        PSHR    R3                              ; DBF6   0273
        MVII    #$0010, R1                      ; DBF7   02B9 0010

        JSR     R5,     L_5B92                  ; DBF9   0004 0158 0392

        RRC     R3,     1                       ; DBFC   0073
        BNC     L_DC00                          ; DBFD   0209 0001

        SLL     R1,     1                       ; DBFF   0049
L_DC00:
        MVI     G_0169, R3                      ; DC00   0283 0169
        ANDR    R1,     R3                      ; DC02   018B
        PULR    R3                              ; DC03   02B3
        PULR    R1                              ; DC04   02B1
        PULR    R7                              ; DC05   02B7

L_DC06:
        PSHR    R5                              ; DC06   0275
        PSHR    R2                              ; DC07   0272
        MVI     G_0354, R1                      ; DC08   0281 0354
        SWAP    R1,     1                       ; DC0A   0041
        ANDI    #$00FF, R1                      ; DC0B   03B9 00FF
        SDBD                                    ; DC0D   0001
        MVII    #$7D00, R0                      ; DC0E   02B8 0000 007D
        SWAP    R0,     1                       ; DC11   0040
        ANDI    #$00FF, R0                      ; DC12   03B8 00FF

        JSR     R5,     L_D171                  ; DC14   0004 01D0 0171

        BLE     L_DC1C                          ; DC17   0206 0003

        XORR    R0,     R1                      ; DC19   01C1
        XORR    R1,     R0                      ; DC1A   01C8
        XORR    R0,     R1                      ; DC1B   01C1
L_DC1C:
        SUBR    R1,     R0                      ; DC1C   0108
        MVII    #$0008, R1                      ; DC1D   02B9 0008
        MVI     G_033C, R2                      ; DC1F   0282 033C
        TSTR    R2                              ; DC21   0092
        BPL     L_DC25                          ; DC22   0203 0001

        NEGR    R2                              ; DC24   0022

L_DC25:
        JSR     R5,     L_57CB                  ; DC25   0004 0154 03CB

        PULR    R2                              ; DC28   02B2
        PULR    R7                              ; DC29   02B7

L_DC2A:
        PSHR    R5                              ; DC2A   0275

        JSR     R5,     L_DC06                  ; DC2B   0004 01DC 0006

        PSHR    R2                              ; DC2E   0272
        PSHR    R3                              ; DC2F   0273
        PSHR    R0                              ; DC30   0270
        MVI     G_01B1, R1                      ; DC31   0281 01B1

        JSR     R5,     X_MPY                   ; DC33   0004 011C 01DC

        SLR     R2,     1                       ; DC36   0062
        MOVR    R2,     R3                      ; DC37   0093
        MVI     G_01EB, R1                      ; DC38   0281 01EB
        SWAP    R1,     1                       ; DC3A   0041
        MVI     G_032C, R2                      ; DC3B   0282 032C
        SUBR    R2,     R1                      ; DC3D   0111
        PULR    R2                              ; DC3E   02B2

        JSR     R5,     X_DIV                   ; DC3F   0004 011C 01FB

        ADDR    R3,     R0                      ; DC42   00D8
        PULR    R3                              ; DC43   02B3
        PULR    R2                              ; DC44   02B2

        JSR     R5,     L_DB4A                  ; DC45   0004 01D8 034A

        PSHR    R2                              ; DC48   0272
        BEQ     L_DC52                          ; DC49   0204 0007

        MVII    #$000E, R1                      ; DC4B   02B9 000E
        MVII    #$0008, R2                      ; DC4D   02BA 0008

        JSR     R5,     L_57CB                  ; DC4F   0004 0154 03CB

L_DC52:
        SDBD                                    ; DC52   0001
        MVII    #$D92C, R1                      ; DC53   02B9 002C 00D9
        ADD     G_01C8, R1                      ; DC56   02C1 01C8
        MVI@    R1,     R1                      ; DC58   0289
        CMPR    R1,     R0                      ; DC59   0148
        BLT     L_DC5D                          ; DC5A   0205 0001

        MOVR    R1,     R0                      ; DC5C   0088
L_DC5D:
        MVO     R0,     G_0344                  ; DC5D   0240 0344
        PULR    R2                              ; DC5F   02B2
        PULR    R7                              ; DC60   02B7

        PSHR    R5                              ; DC61   0275
        PSHR    R0                              ; DC62   0270
        MOVR    R1,     R3                      ; DC63   008B
        ANDI    #$00FF, R1                      ; DC64   03B9 00FF
        SDBD                                    ; DC66   0001
        ANDI    #$FF00, R3                      ; DC67   03BB 0000 00FF
        SWAP    R1,     1                       ; DC6A   0041
        PSHR    R1                              ; DC6B   0271

        JSR     R5,     L_57A4                  ; DC6C   0004 0154 03A4

        PULR    R1                              ; DC6F   02B1
        PULR    R0                              ; DC70   02B0
        PSHR    R3                              ; DC71   0273
        MOVR    R0,     R3                      ; DC72   0083

        JSR     R5,     L_5781                  ; DC73   0004 0154 0381

        PULR    R1                              ; DC76   02B1
        SWAP    R3,     1                       ; DC77   0043
        ANDI    #$00FF, R3                      ; DC78   03BB 00FF
        ADDR    R3,     R1                      ; DC7A   00D9
        PULR    R7                              ; DC7B   02B7

L_DC7C:
        PSHR    R5                              ; DC7C   0275
        PSHR    R1                              ; DC7D   0271
        MOVR    R0,     R1                      ; DC7E   0081

        JSR     R5,     L_DB40                  ; DC7F   0004 01D8 0340

        BNEQ    L_DC86                          ; DC82   020C 0002

L_DC84:
        PULR    R1                              ; DC84   02B1
        PULR    R7                              ; DC85   02B7

L_DC86:
        MVII    #$0164, R1                      ; DC86   02B9 0164
        ADDR    R2,     R1                      ; DC88   00D1
        MVI@    R1,     R1                      ; DC89   0289
        CMPI    #$0001, R1                      ; DC8A   0379 0001
        BEQ     L_DC98                          ; DC8C   0204 000A

        CMPI    #$0002, R1                      ; DC8E   0379 0002
        BEQ     L_DC98                          ; DC90   0204 0006

        MOVR    R0,     R1                      ; DC92   0081
        ADDR    R0,     R0                      ; DC93   00C0
        ADDR    R1,     R0                      ; DC94   00C8
        SLR     R0,     1                       ; DC95   0060
        B       L_DC84                          ; DC96   0220 0013

L_DC98:
        ADDR    R0,     R0                      ; DC98   00C0
        B       L_DC84                          ; DC99   0220 0016

        SLL     R0,     2                       ; DC9B   004C
        SUBR    R1,     R0                      ; DC9C   0108
        SLR     R0,     2                       ; DC9D   0064
        BNEQ    L_DC84                          ; DC9E   022C 001B

        INCR    R0                              ; DCA0   0008
        B       L_DC84                          ; DCA1   0220 001E

L_DCA3:
        PSHR    R5                              ; DCA3   0275
        PSHR    R1                              ; DCA4   0271
        MVII    #$018C, R1                      ; DCA5   02B9 018C
        ADDR    R2,     R1                      ; DCA7   00D1
        MVI@    R1,     R1                      ; DCA8   0289
        TSTR    R1                              ; DCA9   0089
        PULR    R1                              ; DCAA   02B1
        PULR    R7                              ; DCAB   02B7

        SAR     R1,     2                       ; DCAC   006D
        RLC     R1,     1                       ; DCAD   0051
        MOVR    R2,     R7                      ; DCAE   0097

        RLC     R1,     1                       ; DCAF   0051
        MOVR    R3,     R6                      ; DCB0   009E
        RLC     R1,     1                       ; DCB1   0051
        MOVR    R0,     R2                      ; DCB2   0082
        RLC     R1,     1                       ; DCB3   0051
        SLL     R2,     1                       ; DCB4   004A
        RLC     R1,     1                       ; DCB5   0051
        RLC     R1,     1                       ; DCB6   0051
        RLC     R1,     1                       ; DCB7   0051
        ADDR    R3,     R5                      ; DCB8   00DD
        RLC     R1,     1                       ; DCB9   0051
        ADDR    R5,     R3                      ; DCBA   00EB
        RLC     R1,     1                       ; DCBB   0051
        ADDR    R6,     R2                      ; DCBC   00F2
        RLC     R1,     1                       ; DCBD   0051
        ADDR    R4,     R4                      ; DCBE   00E4
        RLC     R1,     1                       ; DCBF   0051
        ADDR    R1,     R7                      ; DCC0   00CF

        DECLE   $0051,  $00D6,  $0051,  $0000   ; DCC1   0051 00D6 0051 0000
        DECLE   $00FB,  $0000,  $00FF,  $0000   ; DCC5   00FB 0000 00FF 0000
        DECLE   $00FE,  $0000,  $00F7,  $0000   ; DCC9   00FE 0000 00F7 0000
        DECLE   $00FD,  $0000,  $00FD,  $0000   ; DCCD   00FD 0000 00FD 0000
        DECLE   $0006,  $0000,  $0004,  $0000   ; DCD1   0006 0000 0004 0000
        DECLE   $00FB,  $0000,  $00FC,  $0000   ; DCD5   00FB 0000 00FC 0000
        DECLE   $00FD,  $0000,  $00FD,  $0000   ; DCD9   00FD 0000 00FD 0000
        DECLE   $00FA,  $0000,  $0008,  $0000   ; DCDD   00FA 0000 0008 0000
        DECLE   $0000,  $0000,  $00FB,  $0000   ; DCE1   0000 0000 00FB 0000
        DECLE   $00FD,  $0000,  $00FD,  $0000   ; DCE5   00FD 0000 00FD 0000
        DECLE   $0006,  $0000,  $0004,  $0000   ; DCE9   0006 0000 0004 0000
        DECLE   $0000,  $0000,  $00FB,  $0000   ; DCED   0000 0000 00FB 0000
        DECLE   $00FD,  $0000,  $00FD,  $0007   ; DCF1   00FD 0000 00FD 0007
        DECLE   $0000,  $0008,  $0000,  $0008   ; DCF5   0000 0008 0000 0008
        DECLE   $0000,  $0005,  $0000,  $0008   ; DCF9   0000 0005 0000 0008
        DECLE   $0000,  $0008,  $0000,  $0003   ; DCFD   0000 0008 0000 0003
        DECLE   $0000,  $0003,  $0000,  $0003   ; DD01   0000 0003 0000 0003
        DECLE   $0000,  $0005,  $0000,  $0003   ; DD05   0000 0005 0000 0003
        DECLE   $0000,  $0008,  $0000,  $0004   ; DD09   0000 0008 0000 0004
        DECLE   $0000,  $0005,  $0000,  $0005   ; DD0D   0000 0005 0000 0005
        DECLE   $0000,  $0000,  $0000,  $0005   ; DD11   0000 0000 0000 0005
        DECLE   $0000,  $0000,  $0000           ; DD15   0000 0000 0000

        SLR     R0,     1                       ; DD18   0060
        MOVR    R2,     R0                      ; DD19   0090
        SLL     R2,     2                       ; DD1A   004E
        SLLC    R0,     1                       ; DD1B   0058
        ADCR    R0                              ; DD1C   0028
        SLLC    R0,     1                       ; DD1D   0058
        SLL     R2,     2                       ; DD1E   004E
        SLLC    R0,     1                       ; DD1F   0058
        SLR     R0,     1                       ; DD20   0060
        TSTR    R0                              ; DD21   0080
        CLRC                                    ; DD22   0006
        DECR    R1                              ; DD23   0011
        RSWD    R0                              ; DD24   0038
        SLLC    R0,     1                       ; DD25   0058
        CLRC                                    ; DD26   0006
        DECR    R1                              ; DD27   0011
L_DD28:
        PSHR    R5                              ; DD28   0275
        B       L_DD5D                          ; DD29   0200 0032

        PSHR    R5                              ; DD2B   0275
        MVII    #$0002, R3                      ; DD2C   02BB 0002
        B       L_DD37                          ; DD2E   0200 0007

        PSHR    R5                              ; DD30   0275
        MVII    #$0001, R3                      ; DD31   02BB 0001
        B       L_DD37                          ; DD33   0200 0002

        PSHR    R5                              ; DD35   0275
        CLRR    R3                              ; DD36   01DB
L_DD37:
        MVI     G_017E, R2                      ; DD37   0282 017E
        TSTR    R2                              ; DD39   0092
        BNEQ    L_DDB2                          ; DD3A   020C 0076

        MVII    #$016F, R4                      ; DD3C   02BC 016F
L_DD3E:
        MVI@    R4,     R2                      ; DD3E   02A2
        TSTR    R2                              ; DD3F   0092
        BEQ     L_DD48                          ; DD40   0204 0006

        CMPI    #$0005, R2                      ; DD42   037A 0005
        BEQ     L_DD48                          ; DD44   0204 0002
        B       L_DDB2                          ; DD46   0200 006A

L_DD48:
        CMPI    #$0173, R4                      ; DD48   037C 0173
        BNEQ    L_DD3E                          ; DD4A   022C 000D

        MVI     G_016B, R2                      ; DD4C   0282 016B
        ANDI    #$0008, R2                      ; DD4E   03BA 0008
        BNEQ    L_DDB2                          ; DD50   020C 0060

        DECR    R0                              ; DD52   0010
        BNEQ    L_DDB2                          ; DD53   020C 005D

        INCR    R1                              ; DD55   0009
        MVII    #$0175, R4                      ; DD56   02BC 0175
        ADDR    R1,     R4                      ; DD58   00CC
        MVI@    R4,     R2                      ; DD59   02A2
        TSTR    R2                              ; DD5A   0092
        BEQ     L_DDB2                          ; DD5B   0204 0055

L_DD5D:
        MVII    #$0160, R1                      ; DD5D   02B9 0160
        ADDR    R2,     R1                      ; DD5F   00D1
        MVI@    R1,     R0                      ; DD60   0288
        ANDI    #$0002, R0                      ; DD61   03B8 0002
        BNEQ    L_DDB2                          ; DD63   020C 004D

        SDBD                                    ; DD65   0001
        MVII    #$FFF3, R0                      ; DD66   02B8 00F3 00FF
        MVI@    R1,     R4                      ; DD69   028C
        ANDR    R0,     R4                      ; DD6A   0184
        TSTR    R3                              ; DD6B   009B
        BEQ     L_DD73                          ; DD6C   0204 0005

        DECR    R3                              ; DD6E   0013
        BEQ     L_DD76                          ; DD6F   0204 0005

        XORI    #$0004, R4                      ; DD71   03FC 0004
L_DD73:
        MVO@    R4,     R1                      ; DD73   024C
        B       L_DD7A                          ; DD74   0200 0004

L_DD76:
        XORI    #$0008, R4                      ; DD76   03FC 0008
        B       L_DD73                          ; DD78   0220 0006

L_DD7A:
        MVI     G_016B, R0                      ; DD7A   0280 016B
        ANDI    #$0001, R0                      ; DD7C   03B8 0001
        BNEQ    L_DDB7                          ; DD7E   020C 0037

L_DD80:
        MVI     G_016B, R3                      ; DD80   0283 016B
        ANDI    #$0002, R3                      ; DD82   03BB 0002

        JSR     R5,     L_D171                  ; DD84   0004 01D0 0171

        BLE     L_DD8C                          ; DD87   0206 0003

        COMR    R3                              ; DD89   001B
        ANDI    #$0002, R3                      ; DD8A   03BB 0002
L_DD8C:
        TSTR    R3                              ; DD8C   009B
        BNEQ    L_DDB2                          ; DD8D   020C 0023

        MVI@    R1,     R0                      ; DD8F   0288
        XORI    #$0002, R0                      ; DD90   03F8 0002
        MVO@    R0,     R1                      ; DD92   0248

        JSR     R5,     L_DF75                  ; DD93   0004 01DC 0375
        JSR     R5,     L_DEB2                  ; DD96   0004 01DC 02B2

        MVII    #$0080, R0                      ; DD99   02B8 0080
        MVII    #$0164, R1                      ; DD9B   02B9 0164
        ADDR    R2,     R1                      ; DD9D   00D1
        MVI@    R1,     R1                      ; DD9E   0289
        DECR    R1                              ; DD9F   0011
        BEQ     L_DDAA                          ; DDA0   0204 0008

        DECR    R1                              ; DDA2   0011
        BEQ     L_DDAA                          ; DDA3   0204 0005

        JSR     R5,     L_5AFF                  ; DDA5   0004 0158 02FF

        B       L_DDAD                          ; DDA8   0200 0003

L_DDAA:
        JSR     R5,     L_5AE8                  ; DDAA   0004 0158 02E8
L_DDAD:
        JSR     R5,     L_D70B                  ; DDAD   0004 01D4 030B

L_DDB0:
        CLRR    R0                              ; DDB0   01C0
L_DDB1:
        PULR    R7                              ; DDB1   02B7

L_DDB2:
        MVII    #$0001, R0                      ; DDB2   02B8 0001
        TSTR    R0                              ; DDB4   0080
        B       L_DDB1                          ; DDB5   0220 0005

L_DDB7:
        MVI     G_01B8, R0                      ; DDB7   0280 01B8
        SUBR    R2,     R0                      ; DDB9   0110
        BNEQ    L_DD80                          ; DDBA   022C 003B

        JSR     R5,     L_DE2D                  ; DDBC   0004 01DC 022D

        BNEQ    L_DE26                          ; DDBF   020C 0065

        MVII    #$0160, R1                      ; DDC1   02B9 0160
        ADDR    R2,     R1                      ; DDC3   00D1
        MVI@    R1,     R0                      ; DDC4   0288
        SDBD                                    ; DDC5   0001
        ANDI    #$FFF7, R0                      ; DDC6   03B8 00F7 00FF
        MVO@    R0,     R1                      ; DDC9   0248
        ANDI    #$0012, R0                      ; DDCA   03B8 0012
        BNEQ    L_DDB2                          ; DDCC   022C 001B

        JSR     R5,     L_DF0E                  ; DDCE   0004 01DC 030E

        MVI@    R1,     R0                      ; DDD1   0288
        ANDI    #$0001, R0                      ; DDD2   03B8 0001
        BNEQ    L_DE0E                          ; DDD4   020C 0038

        PSHR    R1                              ; DDD6   0271
        MVI     G_01C0, R1                      ; DDD7   0281 01C0
        TSTR    R1                              ; DDD9   0089
        BNEQ    L_DE23                          ; DDDA   020C 0047

        MVII    #$0001, R1                      ; DDDC   02B9 0001
        MVO     R1,     G_01C1                  ; DDDE   0241 01C1
        MVII    #$0164, R3                      ; DDE0   02BB 0164
        ADDR    R2,     R3                      ; DDE2   00D3
        MVII    #$0004, R0                      ; DDE3   02B8 0004

        JSR     R5,     L_D171                  ; DDE5   0004 01D0 0171

        BLE     L_DDEC                          ; DDE8   0206 0002

        INCR    R0                              ; DDEA   0008
        INCR    R1                              ; DDEB   0009
L_DDEC:
        MVO@    R0,     R3                      ; DDEC   0258
        MVO     R1,     G_01A9                  ; DDED   0241 01A9
        MVI     G_016B, R1                      ; DDEF   0281 016B
        SDBD                                    ; DDF1   0001
        ANDI    #$FFFB, R1                      ; DDF2   03B9 00FB 00FF
        XORI    #$0004, R1                      ; DDF5   03F9 0004
        MVO     R1,     G_016B                  ; DDF7   0241 016B
        PULR    R1                              ; DDF9   02B1
        MVI@    R1,     R0                      ; DDFA   0288
        XORI    #$0001, R0                      ; DDFB   03F8 0001
        MVO@    R0,     R1                      ; DDFD   0248

        JSR     R5,     L_DEB2                  ; DDFE   0004 01DC 02B2

        MVII    #$0080, R0                      ; DE01   02B8 0080

        JSR     R5,     L_5AE8                  ; DE03   0004 0158 02E8
        JSR     R5,     L_DE63                  ; DE06   0004 01DC 0263
        JSR     R5,     L_DE6F                  ; DE09   0004 01DC 026F

        B       L_DDAD                          ; DE0C   0220 0060

L_DE0E:
        MVI@    R1,     R0                      ; DE0E   0288
        SDBD                                    ; DE0F   0001
        ANDI    #$FFFD, R0                      ; DE10   03B8 00FD 00FF
        XORI    #$0002, R0                      ; DE13   03F8 0002
        MVO@    R0,     R1                      ; DE15   0248
        MVI     G_016B, R0                      ; DE16   0280 016B
        SDBD                                    ; DE18   0001
        ANDI    #$FFFB, R0                      ; DE19   03B8 00FB 00FF
        MVO     R0,     G_016B                  ; DE1C   0240 016B

        JSR     R5,     L_DE7B                  ; DE1E   0004 01DC 027B

        B       L_DDB0                          ; DE21   0220 0072

L_DE23:
        PULR    R1                              ; DE23   02B1
        B       L_DDB2                          ; DE24   0220 0073

L_DE26:
        MVII    #$0002, R0                      ; DE26   02B8 0002

        JSR     R5,     X_PLAY_RAZZ4            ; DE28   0004 011C 02C4

        B       L_DDB2                          ; DE2B   0220 007A

L_DE2D:
        PSHR    R5                              ; DE2D   0275
        PSHR    R3                              ; DE2E   0273
        MVI     G_01BA, R3                      ; DE2F   0283 01BA
        DECR    R3                              ; DE31   0013
        SLL     R3,     2                       ; DE32   004F
        SDBD                                    ; DE33   0001
        ADDI    #$DD18, R3                      ; DE34   02FB 0018 00DD

        JSR     R5,     L_D181                  ; DE37   0004 01D0 0181

        ADDI    #$0002, R1                      ; DE3A   02F9 0002
        MVI@    R1,     R1                      ; DE3C   0289
        SWAP    R1,     1                       ; DE3D   0041
        ANDI    #$00FF, R1                      ; DE3E   03B9 00FF
        MVI@    R3,     R0                      ; DE40   0298
        CMPR    R1,     R0                      ; DE41   0148
        BC      L_DE5F                          ; DE42   0201 001B

        INCR    R3                              ; DE44   000B
        MVI@    R3,     R0                      ; DE45   0298
        CMPR    R1,     R0                      ; DE46   0148
        BNC     L_DE5F                          ; DE47   0209 0016

        JSR     R5,     L_D181                  ; DE49   0004 01D0 0181

        ADDI    #$0003, R1                      ; DE4C   02F9 0003
        MVI@    R1,     R1                      ; DE4E   0289
        SWAP    R1,     1                       ; DE4F   0041
        ANDI    #$00FF, R1                      ; DE50   03B9 00FF
        INCR    R3                              ; DE52   000B
        MVI@    R3,     R0                      ; DE53   0298
        CMPR    R1,     R0                      ; DE54   0148
        BC      L_DE5F                          ; DE55   0201 0008

        INCR    R3                              ; DE57   000B
        MVI@    R3,     R0                      ; DE58   0298
        CMPR    R1,     R0                      ; DE59   0148
        BNC     L_DE5F                          ; DE5A   0209 0003

        CLRR    R0                              ; DE5C   01C0
L_DE5D:
        PULR    R3                              ; DE5D   02B3
        PULR    R7                              ; DE5E   02B7

L_DE5F:
        CLRR    R0                              ; DE5F   01C0
        COMR    R0                              ; DE60   0018
        B       L_DE5D                          ; DE61   0220 0005

L_DE63:
        PSHR    R5                              ; DE63   0275
        DECLE   $0282,  $01B8,  $02BB,  $0006   ; DE64   0282 01B8 02BB 0006
        DECLE   $0004,  $01E0,  $0224,  $0010   ; DE68   0004 01E0 0224 0010

        MVO     R0,     G_032B                  ; DE6C   0240 032B
        PULR    R7                              ; DE6E   02B7

L_DE6F:
        PSHR    R5                              ; DE6F   0275
        DECLE   $0282,  $01B8,  $02BB,  $0002   ; DE70   0282 01B8 02BB 0002
        DECLE   $0004                           ; DE74   0004

        XORR    R4,     R0                      ; DE75   01E0
        BEQ     L_DE6F                          ; DE76   0224 0008

        MVO     R0,     G_0323                  ; DE78   0240 0323
        PULR    R7                              ; DE7A   02B7

L_DE7B:
        PSHR    R5                              ; DE7B   0275

        JSR     R5,     L_D181                  ; DE7C   0004 01D0 0181

        MOVR    R1,     R3                      ; DE7F   008B
        ADDI    #$0006, R1                      ; DE80   02F9 0006
        MVI@    R1,     R0                      ; DE82   0288
        SDBD                                    ; DE83   0001
        ANDI    #$7FFF, R0                      ; DE84   03B8 00FF 007F
        MVO@    R0,     R1                      ; DE87   0248

        JSR     R5,     L_5A82                  ; DE88   0004 0158 0282

        MOVR    R1,     R4                      ; DE8B   008C
        ADDI    #$0006, R1                      ; DE8C   02F9 0006
        MVI@    R1,     R0                      ; DE8E   0288
        SDBD                                    ; DE8F   0001
        ANDI    #$7FFF, R0                      ; DE90   03B8 00FF 007F
        MVO@    R0,     R1                      ; DE93   0248

        JSR     R5,     L_5B07                  ; DE94   0004 0158 0307

        SLL     R0,     2                       ; DE97   004C
        SLL     R0,     2                       ; DE98   004C
        ADDI    #$0005, R4                      ; DE99   02FC 0005
        ADDI    #$0005, R3                      ; DE9B   02FB 0005
        MVI@    R3,     R1                      ; DE9D   0299
        SDBD                                    ; DE9E   0001
        ANDI    #$FC0F, R1                      ; DE9F   03B9 000F 00FC
        XORR    R0,     R1                      ; DEA2   01C1
        INCR    R1                              ; DEA3   0009
        MVO@    R1,     R3                      ; DEA4   0259
        MVI@    R4,     R1                      ; DEA5   02A1
        DECR    R4                              ; DEA6   0014
        SDBD                                    ; DEA7   0001
        ANDI    #$FC0F, R1                      ; DEA8   03B9 000F 00FC
        XORR    R0,     R1                      ; DEAB   01C1
        INCR    R1                              ; DEAC   0009
        MVO@    R1,     R4                      ; DEAD   0261
        CLRR    R0                              ; DEAE   01C0
        MVO     R0,     G_032B                  ; DEAF   0240 032B
        PULR    R7                              ; DEB1   02B7

L_DEB2:
        PSHR    R5                              ; DEB2   0275
        CLRR    R0                              ; DEB3   01C0
        MVII    #$0179, R1                      ; DEB4   02B9 0179
        ADDR    R2,     R1                      ; DEB6   00D1
        MVO@    R0,     R1                      ; DEB7   0248

        JSR     R5,     L_5A8D                  ; DEB8   0004 0158 028D
        DECLE   $0004                           ; DEBB   0004

        XORR    R4,     R0                      ; DEBC   01E0
        XORR    R5,     R1                      ; DEBD   01E9

        JSR     R5,     L_5B07                  ; DEBE   0004 0158 0307

        SLL     R0,     2                       ; DEC1   004C
        SLL     R0,     2                       ; DEC2   004C
        MOVR    R0,     R3                      ; DEC3   0083

        JSR     R5,     L_5A99                  ; DEC4   0004 0158 0299

        MOVR    R3,     R0                      ; DEC7   0098

        JSR     R5,     L_5AA5                  ; DEC8   0004 0158 02A5

        SDBD                                    ; DECB   0001
        MVII    #$DCAC, R4                      ; DECC   02BC 00AC 00DC

        JSR     R5,     L_5A7B                  ; DECF   0004 0158 027B

        ADDR    R1,     R4                      ; DED2   00CC
        SDBD                                    ; DED3   0001
        MVI@    R4,     R3                      ; DED4   02A3

        JSR     R5,     L_D0C9                  ; DED5   0004 01D0 00C9

        SDBD                                    ; DED8   0001
        MVII    #$DCB8, R4                      ; DED9   02BC 00B8 00DC

        JSR     R5,     L_5A7B                  ; DEDC   0004 0158 027B

        ADDR    R1,     R4                      ; DEDF   00CC
        SDBD                                    ; DEE0   0001
        MVI@    R4,     R3                      ; DEE1   02A3

        JSR     R5,     L_5AAD                  ; DEE2   0004 0158 02AD
        JSR     R5,     L_5A7B                  ; DEE5   0004 0158 027B
        DECLE   $0001,  $02BC,  $00C4,  $00DC   ; DEE8   0001 02BC 00C4 00DC
        DECLE   $00C9,  $00CC,  $0001,  $02A0   ; DEEC   00C9 00CC 0001 02A0
        DECLE   $0001,  $02A1,  $0004,  $01E0   ; DEF0   0001 02A1 0004 01E0
        DECLE   $01C7,  $0001,  $02BC,  $00F4   ; DEF4   01C7 0001 02BC 00F4
        DECLE   $00DC,  $01C0,  $0004,  $01E0   ; DEF8   00DC 01C0 0004 01E0
        DECLE   $0206,  $0001,  $02BC,  $0000   ; DEFC   0206 0001 02BC 0000
        DECLE   $00DD,  $02B8,  $0001,  $0004   ; DF00   00DD 02B8 0001 0004
        DECLE   $01E0,  $0206,  $0001           ; DF04   01E0 0206 0001

        MVII    #$0040, R0                      ; DF07   02B8 0040
        DECR    R0                              ; DF09   0010

        JSR     R5,     L_5AE8                  ; DF0A   0004 0158 02E8

        PULR    R7                              ; DF0D   02B7

L_DF0E:
        PSHR    R5                              ; DF0E   0275
        PSHR    R0                              ; DF0F   0270
        PSHR    R1                              ; DF10   0271
        MVII    #$0002, R1                      ; DF11   02B9 0002
        MVI     G_01BA, R0                      ; DF13   0280 01BA
        SUBI    #$0003, R0                      ; DF15   0338 0003
        BMI     L_DF1A                          ; DF17   020B 0001

        CLRR    R1                              ; DF19   01C9
L_DF1A:
        MVI     G_016B, R0                      ; DF1A   0280 016B
        SDBD                                    ; DF1C   0001
        ANDI    #$FFFD, R0                      ; DF1D   03B8 00FD 00FF
        XORR    R1,     R0                      ; DF20   01C8
        MVO     R0,     G_016B                  ; DF21   0240 016B
        PULR    R1                              ; DF23   02B1
        PULR    R0                              ; DF24   02B0
        PULR    R7                              ; DF25   02B7

L_DF26:
        PSHR    R5                              ; DF26   0275
        MVI     G_01E5, R0                      ; DF27   0280 01E5
        SLL     R0,     2                       ; DF29   004C
        MVO     R0,     G_0344                  ; DF2A   0240 0344
        MVI     G_01E6, R0                      ; DF2C   0280 01E6
        SDBD                                    ; DF2E   0001
        ADDI    #$FF00, R0                      ; DF2F   02F8 0000 00FF

        JSR     R5,     L_D171                  ; DF32   0004 01D0 0171

        BLE     L_DF39                          ; DF35   0206 0002

        MVI     G_01E7, R0                      ; DF37   0280 01E7
L_DF39:
        MVO     R0,     G_0334                  ; DF39   0240 0334
        CLRR    R0                              ; DF3B   01C0
        MVO     R0,     G_033C                  ; DF3C   0240 033C
        PULR    R7                              ; DF3E   02B7

L_DF3F:
        PSHR    R5                              ; DF3F   0275
        PSHR    R2                              ; DF40   0272

        JSR     R5,     L_D181                  ; DF41   0004 01D0 0181

        ADDI    #$0002, R1                      ; DF44   02F9 0002
        MVI@    R1,     R3                      ; DF46   028B
        INCR    R1                              ; DF47   0009
        MVI@    R1,     R4                      ; DF48   028C
        ADDI    #$0300, R3                      ; DF49   02FB 0300
        ADDI    #$0000, R4                      ; DF4B   02FC 0000

        JSR     R5,     L_D171                  ; DF4D   0004 01D0 0171

        BGT     L_DF54                          ; DF50   020E 0002

        ADDI    #$0300, R3                      ; DF52   02FB 0300
L_DF54:
        MOVR    R4,     R0                      ; DF54   00A0

        JSR     R5,     L_D6A8                  ; DF55   0004 01D4 02A8

        MOVR    R2,     R1                      ; DF58   0091
        SWAP    R2,     1                       ; DF59   0042
        MVO     R2,     G_0354                  ; DF5A   0242 0354
        MOVR    R3,     R0                      ; DF5C   0098

        JSR     R5,     L_D687                  ; DF5D   0004 01D4 0287

        SWAP    R0,     1                       ; DF60   0040
        MVO     R0,     G_034C                  ; DF61   0240 034C
        MVII    #$000F, R0                      ; DF63   02B8 000F
        SWAP    R0,     1                       ; DF65   0040
        MVO     R0,     G_032C                  ; DF66   0240 032C
        MVII    #$00FF, R0                      ; DF68   02B8 00FF
        MVO     R0,     G_01C0                  ; DF6A   0240 01C0
        CLRR    R2                              ; DF6C   01D2
        MVO     R2,     G_01C3                  ; DF6D   0242 01C3
        MVII    #$0002, R2                      ; DF6F   02BA 0002
        MVO     R2,     G_01C1                  ; DF71   0242 01C1
        PULR    R2                              ; DF73   02B2
        PULR    R7                              ; DF74   02B7

L_DF75:
        PSHR    R5                              ; DF75   0275
        PSHR    R2                              ; DF76   0272

        JSR     R5,     L_DBA1                  ; DF77   0004 01D8 03A1

        MOVR    R0,     R3                      ; DF7A   0083
        MVI     G_0354, R0                      ; DF7B   0280 0354
        SWAP    R0,     1                       ; DF7D   0040
        ANDI    #$00FF, R0                      ; DF7E   03B8 00FF
        SUBR    R1,     R0                      ; DF80   0108
        MVII    #$0008, R1                      ; DF81   02B9 0008
        MVI     G_033C, R2                      ; DF83   0282 033C

        JSR     R5,     L_57CB                  ; DF85   0004 0154 03CB

        TSTR    R0                              ; DF88   0080
        BPL     L_DF8C                          ; DF89   0203 0001

        NEGR    R0                              ; DF8B   0020
L_DF8C:
        MOVR    R0,     R4                      ; DF8C   0084
        MVI     G_0334, R1                      ; DF8D   0281 0334
        MVII    #$0010, R2                      ; DF8F   02BA 0010

        JSR     R5,     L_57CB                  ; DF91   0004 0154 03CB

        MVI     G_034C, R1                      ; DF94   0281 034C
        SWAP    R1,     1                       ; DF96   0041
        ANDI    #$00FF, R1                      ; DF97   03B9 00FF
        ADDR    R0,     R1                      ; DF99   00C1
        PULR    R2                              ; DF9A   02B2
        SUBR    R1,     R3                      ; DF9B   010B
        SUBI    #$0002, R3                      ; DF9C   033B 0002
        MVI     G_0334, R0                      ; DF9E   0280 0334
        TSTR    R0                              ; DFA0   0080
        BPL     L_DFA5                          ; DFA1   0203 0002

        ADDI    #$0004, R3                      ; DFA3   02FB 0004

L_DFA5:
        JSR     R5,     L_D171                  ; DFA5   0004 01D0 0171

        BLE     L_DFAB                          ; DFA8   0206 0001

        NEGR    R3                              ; DFAA   0023
L_DFAB:
        CLRR    R0                              ; DFAB   01C0
        TSTR    R3                              ; DFAC   009B
        BPL     L_DFB1                          ; DFAD   0203 0002

        MVII    #$0003, R0                      ; DFAF   02B8 0003
L_DFB1:
        PSHR    R0                              ; DFB1   0270

        JSR     R5,     L_D181                  ; DFB2   0004 01D0 0181

        ADDI    #$0003, R1                      ; DFB5   02F9 0003
        MVI@    R1,     R1                      ; DFB7   0289
        SWAP    R1,     1                       ; DFB8   0041
        ANDI    #$00FF, R1                      ; DFB9   03B9 00FF

        JSR     R5,     L_D171                  ; DFBB   0004 01D0 0171

        BLE     L_DFCD                          ; DFBE   0206 000D

        CMPI    #$0058, R1                      ; DFC0   0379 0058
        BC      L_DFD1                          ; DFC2   0201 000D

L_DFC4:
        PULR    R0                              ; DFC4   02B0

        JSR     R5,     L_DFD4                  ; DFC5   0004 01DC 03D4

L_DFC8:
        MVII    #$0164, R1                      ; DFC8   02B9 0164
        ADDR    R2,     R1                      ; DFCA   00D1
        MVO@    R0,     R1                      ; DFCB   0248
        PULR    R7                              ; DFCC   02B7

L_DFCD:
        CMPI    #$0029, R1                      ; DFCD   0379 0029
        BNC     L_DFC4                          ; DFCF   0229 000C

L_DFD1:
        PULR    R0                              ; DFD1   02B0
        B       L_DFC8                          ; DFD2   0220 000B

L_DFD4:
        PSHR    R5                              ; DFD4   0275
        TSTR    R3                              ; DFD5   009B
        BPL     L_DFD9                          ; DFD6   0203 0001

        NEGR    R3                              ; DFD8   0023
L_DFD9:
        TSTR    R4                              ; DFD9   00A4
        DECLE   $0204,  $002B,  $037B,  $0004   ; DFDA   0204 002B 037B 0004
        DECLE   $0201,  $0027,  $0281,  $032C   ; DFDE   0201 0027 0281 032C
        DECLE   $0283,  $0344,  $00D9,  $0301   ; DFE2   0283 0344 00D9 0301
        DECLE   $01B1,  $020B,  $001F,  $0303   ; DFE6   01B1 020B 001F 0303
        DECLE   $01B1,  $0014,  $022C,  $0009   ; DFEA   01B1 0014 022C 0009
        DECLE   $0001,  $0379,  $0000,  $000C   ; DFEE   0001 0379 0000 000C
        DECLE   $0209                           ; DFF2   0209

        DECR    R3                              ; DFF3   0013
        MVII    #$0001, R0                      ; DFF4   02B8 0001

        JSR     R5,     L_D171                  ; DFF6   0004 01D0 0171

        BLE     L_DFFC                          ; DFF9   0206 0001

        INCR    R0                              ; DFFB   0008
L_DFFC:
        MVII    #$0160, R1                      ; DFFC   02B9 0160
        ADDR    R2,     R1                      ; DFFE   00D1
        MVI@    R1,     R3                      ; DFFF   028B

        ORG     $F000
        SDBD                                    ; F000   0001
        ANDI    #$FFF3, R3                      ; F001   03BB 00F3 00FF
        XORI    #$0004, R3                      ; F004   03FB 0004
        MVO@    R3,     R1                      ; F006   024B
        PULR    R7                              ; F007   02B7

        PSHR    R0                              ; F008   0270
        PSHR    R1                              ; F009   0271
        PSHR    R2                              ; F00A   0272
        MOVR    R3,     R0                      ; F00B   0098
        NEGR    R0                              ; F00C   0020
        MVI     G_019C, R1                      ; F00D   0281 019C
        MVII    #$0010, R2                      ; F00F   02BA 0010

        JSR     R5,     L_57CB                  ; F011   0004 0154 03CB
        DECLE   $0340,  $01B1,  $0209,  $0008   ; F014   0340 01B1 0209 0008
        DECLE   $0083,  $000C,  $000C,  $02B2   ; F018   0083 000C 000C 02B2
        DECLE   $02B1,  $02B0,  $0220,  $0034   ; F01C   02B1 02B0 0220 0034
        DECLE   $01DB,  $02BC,  $0001,  $02B2   ; F020   01DB 02BC 0001 02B2
        DECLE   $02B1,  $01C9,  $02B0,  $0220   ; F024   02B1 01C9 02B0 0220

        RSWD    R5                              ; F028   003D
        PSHR    R5                              ; F029   0275

        JSR     R5,     L_556E                  ; F02A   0004 0154 016E

        B       L_F030                          ; F02D   0200 0001

        PSHR    R5                              ; F02F   0275
L_F030:
        MVII    #$0160, R3                      ; F030   02BB 0160
        ADDR    R2,     R3                      ; F032   00D3
        MVI@    R3,     R4                      ; F033   029C
        PSHR    R4                              ; F034   0274
        SDBD                                    ; F035   0001
        ANDI    #$FFEC, R4                      ; F036   03BC 00EC 00FF
        MVO@    R4,     R3                      ; F039   025C
        CLRR    R0                              ; F03A   01C0

        JSR     R5,     L_5A99                  ; F03B   0004 0158 0299

        CLRR    R0                              ; F03E   01C0

        JSR     R5,     L_5A8D                  ; F03F   0004 0158 028D

        SDBD                                    ; F042   0001
        MVII    #$5158, R3                      ; F043   02BB 0058 0051

        JSR     R5,     L_D0C9                  ; F046   0004 01D0 00C9
        JSR     R5,     L_D181                  ; F049   0004 01D0 0181

        ADDI    #$0006, R1                      ; F04C   02F9 0006
        CLRR    R0                              ; F04E   01C0
        MVO@    R0,     R1                      ; F04F   0248

        JSR     R5,     L_5A82                  ; F050   0004 0158 0282
        DECLE   $02F9,  $0006,  $01C0,  $0248   ; F053   02F9 0006 01C0 0248
        DECLE   $0004                           ; F057   0004

        XORR    R4,     R0                      ; F058   01E0
        ADDR    R6,     R5                      ; F059   00F5

        JSR     R5,     L_DCA3                  ; F05A   0004 01DC 00A3
        DECLE   $02B4,  $0204,  $007C,  $02B9   ; F05D   02B4 0204 007C 02B9
        DECLE   $018C,  $00D1,  $02B8,  $0002   ; F061   018C 00D1 02B8 0002
        DECLE   $0248,  $03BC,  $0010,  $0204   ; F065   0248 03BC 0010 0204
        DECLE   $008A,  $0280,  $016B,  $03B8   ; F069   008A 0280 016B 03B8
        DECLE   $0008,  $020C,  $0084,  $0281   ; F06D   0008 020C 0084 0281
        DECLE   $0180,  $0379,  $0003,  $0206   ; F071   0180 0379 0003 0206
        DECLE   $003A,  $0283,  $0173,  $0004   ; F075   003A 0283 0173 0004
        DECLE   $01E4,  $016C,  $0150,  $0204   ; F079   01E4 016C 0150 0204
        DECLE   $002B,  $0151,  $0204,  $0022   ; F07D   002B 0151 0204 0022
        DECLE   $0283,  $0174,  $0004,  $01E4   ; F081   0283 0174 0004 01E4
        DECLE   $016C,  $0150,  $0204,  $0006   ; F085   016C 0150 0204 0006
        DECLE   $02BC,  $005C,  $02B8,  $0027   ; F089   02BC 005C 02B8 0027
        DECLE   $0200,  $0049                   ; F08D   0200 0049

        JSR     R5,     L_D181                  ; F08F   0004 01D0 0181

        MVII    #$0012, R0                      ; F092   02B8 0012
L_F094:
        ADDI    #$0002, R1                      ; F094   02F9 0002
        DECLE   $0289,  $02BC,  $0064,  $0001   ; F096   0289 02BC 0064 0001
        DECLE   $0379,  $0000,  $005C,  $020D   ; F09A   0379 0000 005C 020D
        DECLE   $0039,  $02BC,  $0054,  $0200   ; F09E   0039 02BC 0054 0200
        DECLE   $0035,  $02BC,  $005C,  $02B8   ; F0A2   0035 02BC 005C 02B8
        DECLE   $003A,  $0200,  $002F           ; F0A6   003A 0200 002F

        JSR     R5,     L_D181                  ; F0A9   0004 01D0 0181

        MVII    #$0050, R0                      ; F0AC   02B8 0050
        B       L_F094                          ; F0AE   0220 001B

        MVII    #$005C, R4                      ; F0B0   02BC 005C

        JSR     R5,     L_D181                  ; F0B2   0004 01D0 0181
        DECLE   $02F9,  $0003,  $0289,  $0001   ; F0B5   02F9 0003 0289 0001
        DECLE   $0379,  $0000,  $001A,  $0205   ; F0B9   0379 0000 001A 0205
        DECLE   $0018,  $0001,  $0379,  $0000   ; F0BD   0018 0001 0379 0000
        DECLE   $002D,  $0205,  $000E,  $0001   ; F0C1   002D 0205 000E 0001
        DECLE   $0379,  $0000,  $0042,  $0205   ; F0C5   0379 0000 0042 0205
        DECLE   $0004,  $02B8,  $004C,  $0200   ; F0C9   0004 02B8 004C 0200
        DECLE   $000A,  $02B8,  $003C,  $0200   ; F0CD   000A 02B8 003C 0200
        DECLE   $0006,  $02B8,  $0020,  $0200   ; F0D1   0006 02B8 0020 0200
        DECLE   $0002,  $02B8,  $0016,  $0004   ; F0D5   0002 02B8 0016 0004

        CLRR    R4                              ; F0D9   01E4
        ANDR    R4,     R4                      ; F0DA   01A4
        PULR    R7                              ; F0DB   02B7

        JSR     R5,     L_5B9D                  ; F0DC   0004 0158 039D

        MVII    #$011E, R1                      ; F0DF   02B9 011E
        ADDR    R3,     R1                      ; F0E1   00D9
        MVI@    R1,     R0                      ; F0E2   0288
        ANDI    #$0080, R0                      ; F0E3   03B8 0080
        BNEQ    L_F0F4                          ; F0E5   020C 000D

        MVI@    R1,     R0                      ; F0E7   0288
        ANDI    #$0040, R0                      ; F0E8   03B8 0040
        BNEQ    L_F0F4                          ; F0EA   020C 0008

        MVI@    R1,     R0                      ; F0EC   0288
        ANDI    #$003F, R0                      ; F0ED   03B8 003F
        MOVR    R3,     R1                      ; F0EF   0099
        DECR    R1                              ; F0F0   0011

        JSR     R5,     L_D000                  ; F0F1   0004 01D0 0000

L_F0F4:
        PULR    R7                              ; F0F4   02B7

        PSHR    R5                              ; F0F5   0275
        CLRR    R3                              ; F0F6   01DB
        MVII    #$016C, R1                      ; F0F7   02B9 016C
        MVI@    R1,     R0                      ; F0F9   0288
        CMPR    R0,     R2                      ; F0FA   0142
        BEQ     L_F104                          ; F0FB   0204 0007

        INCR    R1                              ; F0FD   0009
        INCR    R3                              ; F0FE   000B
        MVI@    R1,     R0                      ; F0FF   0288
        CMPR    R0,     R2                      ; F100   0142
        BEQ     L_F104                          ; F101   0204 0001

        NOP                                     ; F103   0034
L_F104:
        PSHR    R1                              ; F104   0271
        MOVR    R3,     R1                      ; F105   0099
        SDBD                                    ; F106   0001
        MVII    #$1000, R0                      ; F107   02B8 0000 0010

        JSR     R5,     L_5AFF                  ; F10A   0004 0158 02FF

        CLRR    R0                              ; F10D   01C0

        JSR     R5,     L_5AA5                  ; F10E   0004 0158 02A5

        MVII    #$0005, R0                      ; F111   02B8 0005
        TSTR    R1                              ; F113   0089
        BEQ     L_F117                          ; F114   0204 0001

        SLL     R0,     1                       ; F116   0048
L_F117:
        COMR    R0                              ; F117   0018
        MVI     G_0169, R3                      ; F118   0283 0169
        ANDR    R0,     R3                      ; F11A   0183
        MVO     R3,     G_0169                  ; F11B   0243 0169
        SDBD                                    ; F11D   0001
        MVII    #$51F9, R3                      ; F11E   02BB 00F9 0051

        JSR     R5,     L_5AAD                  ; F121   0004 0158 02AD

        PULR    R1                              ; F124   02B1
        CLRR    R0                              ; F125   01C0
        MVO@    R0,     R1                      ; F126   0248
        PULR    R7                              ; F127   02B7

        PSHR    R5                              ; F128   0275
        PSHR    R0                              ; F129   0270
        CLRR    R0                              ; F12A   01C0
        CMPI    #$033D, R1                      ; F12B   0379 033D
        BEQ     L_F130                          ; F12D   0204 0001

        INCR    R0                              ; F12F   0008
L_F130:
        MVII    #$016C, R1                      ; F130   02B9 016C
        ADDR    R0,     R1                      ; F132   00C1
        MVI@    R1,     R2                      ; F133   028A
        MVII    #$0164, R1                      ; F134   02B9 0164
        ADDR    R2,     R1                      ; F136   00D1
        MVI@    R1,     R1                      ; F137   0289
        DECR    R1                              ; F138   0011
        BEQ     L_F150                          ; F139   0204 0015

        DECR    R1                              ; F13B   0011
        BEQ     L_F160                          ; F13C   0204 0022

L_F13E:
        SDBD                                    ; F13E   0001
        MVII    #$DCDC, R4                      ; F13F   02BC 00DC 00DC

        JSR     R5,     L_5A7B                  ; F142   0004 0158 027B
        DECLE   $00C9,  $00CC,  $0001,  $02A0   ; F145   00C9 00CC 0001 02A0
        DECLE   $0001,  $02A1,  $0004,  $01E0   ; F149   0001 02A1 0004 01E0
        DECLE   $01C7                           ; F14D   01C7

        PULR    R0                              ; F14E   02B0
        PULR    R7                              ; F14F   02B7

L_F150:
        SDBD                                    ; F150   0001
        MVII    #$514A, R3                      ; F151   02BB 004A 0051

        JSR     R5,     L_D0C9                  ; F154   0004 01D0 00C9

        SDBD                                    ; F157   0001
        MVII    #$51CF, R3                      ; F158   02BB 00CF 0051

        JSR     R5,     L_5AAD                  ; F15B   0004 0158 02AD

        B       L_F13E                          ; F15E   0220 0021

L_F160:
        SDBD                                    ; F160   0001
        MVII    #$5151, R3                      ; F161   02BB 0051 0051

        JSR     R5,     L_D0C9                  ; F164   0004 01D0 00C9

        SDBD                                    ; F167   0001
        MVII    #$51D6, R3                      ; F168   02BB 00D6 0051

        JSR     R5,     L_5AAD                  ; F16B   0004 0158 02AD

        B       L_F13E                          ; F16E   0220 0031

        PSHR    R5                              ; F170   0275
        MVI     G_01B8, R2                      ; F171   0282 01B8

        JSR     R5,     L_D181                  ; F173   0004 01D0 0181
        JSR     R5,     L_DCA3                  ; F176   0004 01DC 00A3
        DECLE   $0204,  $0013                   ; F179   0204 0013

        MVI     G_016B, R0                      ; F17B   0280 016B
        MOVR    R0,     R3                      ; F17D   0083
        ANDI    #$0010, R0                      ; F17E   03B8 0010
        BNEQ    L_F198                          ; F180   020C 0016

        XORI    #$0010, R3                      ; F182   03FB 0010
        MVO     R3,     G_016B                  ; F184   0243 016B
        MVI     G_01EA, R0                      ; F186   0280 01EA
        TSTR    R0                              ; F188   0080
        BNEQ    L_F18C                          ; F189   020C 0001

        INCR    R0                              ; F18B   0008
L_F18C:
        MVO     R0,     G_032B                  ; F18C   0240 032B
        DECLE   $0004                           ; F18E   0004
L_F18F:
        XORR    R4,     R0                      ; F18F   01E0
        ANDR    R4,     R6                      ; F190   01A6

        JSR     R5,     L_5A82                  ; F191   0004 0158 0282
        DECLE   $0004                           ; F194   0004

        XORR    R4,     R0                      ; F195   01E0
        ANDR    R4,     R6                      ; F196   01A6
        PULR    R7                              ; F197   02B7

L_F198:
        MVI     G_016B, R0                      ; F198   0280 016B
        SDBD                                    ; F19A   0001
        ANDI    #$FFEF, R0                      ; F19B   03B8 00EF 00FF
        MVO     R0,     G_016B                  ; F19E   0240 016B
        MVII    #$0160, R1                      ; F1A0   02B9 0160
        ADDR    R2,     R1                      ; F1A2   00D1
        J       L_DD7A                          ; F1A3   0004 03DC 017A

        PSHR    R5                              ; F1A6   0275
        MOVR    R1,     R3                      ; F1A7   008B
        ADDI    #$0005, R1                      ; F1A8   02F9 0005
        MVI@    R1,     R0                      ; F1AA   0288
        SDBD                                    ; F1AB   0001
        ANDI    #$FC0F, R0                      ; F1AC   03B8 000F 00FC
        MVO@    R0,     R1                      ; F1AF   0248
        ADDI    #$0006, R3                      ; F1B0   02FB 0006
        MVI@    R3,     R0                      ; F1B2   0298
        SDBD                                    ; F1B3   0001
        ANDI    #$7FFF, R0                      ; F1B4   03B8 00FF 007F
        SDBD                                    ; F1B7   0001
        XORI    #$8000, R0                      ; F1B8   03F8 0000 0080
        MVO@    R0,     R3                      ; F1BB   0258
        PULR    R7                              ; F1BC   02B7

        PSHR    R5                              ; F1BD   0275
        MVI     G_01B8, R2                      ; F1BE   0282 01B8

        JSR     R5,     L_DF3F                  ; F1C0   0004 01DC 033F
        JSR     R5,     L_DF26                  ; F1C3   0004 01DC 0326

        PULR    R7                              ; F1C6   02B7

        PSHR    R5                              ; F1C7   0275
        PSHR    R3                              ; F1C8   0273
        PSHR    R4                              ; F1C9   0274
        PSHR    R1                              ; F1CA   0271
        PSHR    R0                              ; F1CB   0270

        JSR     R5,     L_D181                  ; F1CC   0004 01D0 0181

        ADDI    #$0002, R1                      ; F1CF   02F9 0002
        MVI@    R1,     R3                      ; F1D1   028B
        INCR    R1                              ; F1D2   0009
        MVI@    R1,     R4                      ; F1D3   028C

        JSR     R5,     L_D171                  ; F1D4   0004 01D0 0171

        PULR    R0                              ; F1D7   02B0
        BLE     L_F1DB                          ; F1D8   0206 0001

        NEGR    R0                              ; F1DA   0020
L_F1DB:
        ADDR    R0,     R3                      ; F1DB   00C3
        PULR    R0                              ; F1DC   02B0
        ADDR    R0,     R4                      ; F1DD   00C4

        JSR     R5,     L_5A82                  ; F1DE   0004 0158 0282

        ADDI    #$0002, R1                      ; F1E1   02F9 0002
        MVO@    R3,     R1                      ; F1E3   024B
        INCR    R1                              ; F1E4   0009
        MVO@    R4,     R1                      ; F1E5   024C
        PULR    R4                              ; F1E6   02B4
        PULR    R3                              ; F1E7   02B3
        PULR    R7                              ; F1E8   02B7

        PSHR    R5                              ; F1E9   0275
        PSHR    R0                              ; F1EA   0270
        PSHR    R1                              ; F1EB   0271
        MVI     G_0169, R0                      ; F1EC   0280 0169
        PSHR    R0                              ; F1EE   0270
        RRC     R0,     1                       ; F1EF   0070
        BNC     L_F1FC                          ; F1F0   0209 000A

        RRC     R0,     1                       ; F1F2   0070
        PULR    R0                              ; F1F3   02B0
        XORI    #$0002, R0                      ; F1F4   03F8 0002
        MVO     R0,     G_0169                  ; F1F6   0240 0169
        MVO     R2,     G_016D                  ; F1F8   0242 016D
        B       L_F203                          ; F1FA   0200 0007

L_F1FC:
        PULR    R0                              ; F1FC   02B0
        XORI    #$0001, R0                      ; F1FD   03F8 0001
        MVO     R0,     G_0169                  ; F1FF   0240 0169
        MVO     R2,     G_016C                  ; F201   0242 016C
L_F203:
        PULR    R1                              ; F203   02B1
        PULR    R0                              ; F204   02B0
        PULR    R7                              ; F205   02B7

        PSHR    R5                              ; F206   0275
        PSHR    R2                              ; F207   0272
        PSHR    R0                              ; F208   0270

        JSR     R5,     L_5A7B                  ; F209   0004 0158 027B
        DECLE   $00CC,  $0001,  $02A3,  $0004   ; F20C   00CC 0001 02A3 0004

        XORR    R4,     R0                      ; F210   01E0
        BEQ     L_F18F                          ; F211   0224 0083

        PULR    R1                              ; F213   02B1
        PULR    R2                              ; F214   02B2
        TSTR    R1                              ; F215   0089
        BNEQ    L_F21F                          ; F216   020C 0007

        JSR     R5,     L_D181                  ; F218   0004 01D0 0181

L_F21B:
        ADDI    #$0006, R1                      ; F21B   02F9 0006
        MVO@    R3,     R1                      ; F21D   024B
        PULR    R7                              ; F21E   02B7

L_F21F:
        JSR     R5,     L_5A82                  ; F21F   0004 0158 0282

        B       L_F21B                          ; F222   0220 0008

        PSHR    R5                              ; F224   0275

        JSR     R5,     L_5B07                  ; F225   0004 0158 0307

        B       L_F22B                          ; F228   0200 0001

        PSHR    R5                              ; F22A   0275
L_F22B:
        CLRR    R1                              ; F22B   01C9
        CLRR    R2                              ; F22C   01D2
        CMPI    #$003F, R0                      ; F22D   0378 003F
        BEQ     L_F24C                          ; F22F   0204 001B

        INCR    R3                              ; F231   000B
L_F232:
        DECR    R3                              ; F232   0013
        BEQ     L_F23F                          ; F233   0204 000A

        ANDI    #$003F, R2                      ; F235   03BA 003F
L_F237:
        ADDR    R0,     R2                      ; F237   00C2
        INCR    R1                              ; F238   0009
        CMPI    #$003F, R2                      ; F239   037A 003F
        BLE     L_F237                          ; F23B   0226 0005
        B       L_F232                          ; F23D   0220 000C

L_F23F:
        TSTR    R1                              ; F23F   0089
        BNEQ    L_F243                          ; F240   020C 0001

        INCR    R1                              ; F242   0009
L_F243:
        MOVR    R1,     R0                      ; F243   0088
        MVII    #$0004, R1                      ; F244   02B9 0004
        MVII    #$0003, R2                      ; F246   02BA 0003

        JSR     R5,     L_57CB                  ; F248   0004 0154 03CB

        PULR    R7                              ; F24B   02B7

L_F24C:
        MOVR    R3,     R1                      ; F24C   0099
        B       L_F23F                          ; F24D   0220 000F

        PSHR    R5                              ; F24F   0275
        MVI     G_033C, R0                      ; F250   0280 033C
        TSTR    R0                              ; F252   0080
        BEQ     L_F445                          ; F253   0204 01F0

        PSHR    R2                              ; F255   0272
        MVII    #$018C, R3                      ; F256   02BB 018C
        ADDR    R2,     R3                      ; F258   00D3
        MVI@    R3,     R0                      ; F259   0298
        SLL     R0,     1                       ; F25A   0048
        ADDR    R0,     R7                      ; F25B   00C7
        B       L_F443                          ; F25C   0200 01E5
        B       L_F4AA                          ; F25E   0200 024A
        B       L_F268                          ; F260   0200 0006
        B       L_F2C7                          ; F262   0200 0063
        B       L_F307                          ; F264   0200 00A1
        B       L_F318                          ; F266   0200 00B0

L_F268:
        PSHR    R3                              ; F268   0273
        DECLE   $0004                           ; F269   0004

        CLRR    R4                              ; F26A   01E4
        CMP@    R4,     R1                      ; F26B   0361
        CMPI    #$001F, R4                      ; F26C   037C 001F
        MVI     G_0354, R1                      ; F26E   0281 0354
        BGT     L_F284                          ; F270   020E 0012

        SDBD                                    ; F272   0001
        CMPI    #$7D00, R1                      ; F273   0379 0000 007D
        BNC     L_F442                          ; F276   0209 01CA

        MVI     G_033C, R1                      ; F278   0281 033C
        TSTR    R1                              ; F27A   0089
        BPL     L_F442                          ; F27B   0203 01C5

        MVI     G_01C2, R1                      ; F27D   0281 01C2
        DECR    R1                              ; F27F   0011
        BNEQ    L_F442                          ; F280   020C 01C0
        B       L_F294                          ; F282   0200 0010

L_F284:
        SDBD                                    ; F284   0001
        CMPI    #$7D00, R1                      ; F285   0379 0000 007D
        BC      L_F442                          ; F288   0201 01B8

        MVI     G_033C, R1                      ; F28A   0281 033C
        TSTR    R1                              ; F28C   0089
        BMI     L_F442                          ; F28D   020B 01B3

        MVI     G_01C2, R1                      ; F28F   0281 01C2
        DECR    R1                              ; F291   0011
        BEQ     L_F442                          ; F292   0204 01AE

L_F294:
        CLRR    R0                              ; F294   01C0
        MVO     R0,     G_0195                  ; F295   0240 0195
        MVO     R0,     G_0196                  ; F297   0240 0196
        PULR    R3                              ; F299   02B3
        MVII    #$0003, R0                      ; F29A   02B8 0003
        MVO@    R0,     R3                      ; F29C   0258
        MVI     G_034C, R0                      ; F29D   0280 034C
        SWAP    R0,     1                       ; F29F   0040
        MVO     R0,     G_018A                  ; F2A0   0240 018A
        MVI     G_0354, R0                      ; F2A2   0280 0354
        SWAP    R0,     1                       ; F2A4   0040
        MVO     R0,     G_018B                  ; F2A5   0240 018B
        MVI     G_032C, R0                      ; F2A7   0280 032C
        SWAP    R0,     1                       ; F2A9   0040
        MVO     R0,     G_018C                  ; F2AA   0240 018C
        MVI     G_0334, R1                      ; F2AC   0281 0334
        MVII    #$0002, R2                      ; F2AE   02BA 0002

        JSR     R5,     X_DIV                   ; F2B0   0004 011C 01FB

        MVO     R0,     G_0191                  ; F2B3   0240 0191
        MVI     G_033C, R1                      ; F2B5   0281 033C
        MVII    #$0002, R2                      ; F2B7   02BA 0002

        JSR     R5,     X_DIV                   ; F2B9   0004 011C 01FB
        DECLE   $0240,  $0192,  $0281,  $0344   ; F2BC   0240 0192 0281 0344
        DECLE   $0241,  $0324,  $0004           ; F2C0   0241 0324 0004

        CLRR    R4                              ; F2C3   01E4
        ANDR    R5,     R4                      ; F2C4   01AC
        B       L_F443                          ; F2C5   0200 017C

L_F2C7:
        PSHR    R3                              ; F2C7   0273
        DECLE   $02B8,  $0001,  $0258,  $0280   ; F2C8   02B8 0001 0258 0280
        DECLE   $0181,  $0004,  $01E4,  $0211   ; F2CC   0181 0004 01E4 0211

        TSTR    R4                              ; F2D0   00A4
        BEQ     L_F442                          ; F2D1   0204 016F

        SWAP    R2,     1                       ; F2D3   0042
        ANDI    #$00FF, R2                      ; F2D4   03BA 00FF
        SWAP    R3,     1                       ; F2D6   0043
        ANDI    #$00FF, R3                      ; F2D7   03BB 00FF

        JSR     R5,     L_D80E                  ; F2D9   0004 01D8 000E
        DECLE   $02A0,  $0338,  $0008,  $0143   ; F2DC   02A0 0338 0008 0143
        DECLE   $0209,  $0160,  $02A0,  $02F8   ; F2E0   0209 0160 02A0 02F8
        DECLE   $0008,  $0143,  $0201,  $015A   ; F2E4   0008 0143 0201 015A
        DECLE   $02A0,  $0338,  $0008,  $0142   ; F2E8   02A0 0338 0008 0142
        DECLE   $0209,  $0154,  $02A0,  $02F8   ; F2EC   0209 0154 02A0 02F8
        DECLE   $0008,  $0142,  $0201,  $014E   ; F2F0   0008 0142 0201 014E
        DECLE   $0242,  $0182,  $0243,  $0183   ; F2F4   0242 0182 0243 0183
        DECLE   $0004                           ; F2F8   0004

        CLRR    R4                              ; F2F9   01E4
        MVO@    R4,     R1                      ; F2FA   024C
        PULR    R3                              ; F2FB   02B3
        MVII    #$0004, R0                      ; F2FC   02B8 0004
        MVO@    R0,     R3                      ; F2FE   0258
        MVII    #$0005, R0                      ; F2FF   02B8 0005
        SUB     G_01C8, R0                      ; F301   0300 01C8
        MVO     R0,     G_0193                  ; F303   0240 0193
        B       L_F443                          ; F305   0200 013C

L_F307:
        MVII    #$0005, R0                      ; F307   02B8 0005
        DECLE   $0258,  $0280,  $0181,  $0004   ; F309   0258 0280 0181 0004
        DECLE   $01E4,  $0264,  $0090,  $0004   ; F30D   01E4 0264 0090 0004
        DECLE   $01E4,  $0272,  $0004           ; F311   01E4 0272 0004

        CLRR    R4                              ; F314   01E4
        ADD@    R3,     R6                      ; F315   02DE
        B       L_F443                          ; F316   0200 012B

L_F318:
        MVI     G_0193, R0                      ; F318   0280 0193
        DECLE   $0010,  $0240,  $0193,  $020C   ; F31A   0010 0240 0193 020C
        DECLE   $0124,  $02B2,  $0280,  $0198   ; F31E   0124 02B2 0280 0198
        DECLE   $0378,  $0003,  $020C,  $0090   ; F322   0378 0003 020C 0090
        DECLE   $02B8,  $0002,  $0240,  $018F   ; F326   02B8 0002 0240 018F
        DECLE   $0240,  $0190,  $02BA,  $0003   ; F32A   0240 0190 02BA 0003
        DECLE   $0283,  $0173,  $0004,  $01E4   ; F32E   0283 0173 0004 01E4
        DECLE   $016C,  $0151,  $0204,  $000A   ; F332   016C 0151 0204 000A
        DECLE   $0283,  $0174,  $0004           ; F336   0283 0174 0004

        CLRR    R4                              ; F339   01E4
        CMPR    R5,     R4                      ; F33A   016C
        CMPR    R2,     R1                      ; F33B   0151
        BEQ     L_F340                          ; F33C   0204 0002

        MVII    #$0004, R2                      ; F33E   02BA 0004
L_F340:
        MVI     G_016B, R0                      ; F340   0280 016B
        DECLE   $03B8,  $0001,  $0204,  $0024   ; F342   03B8 0001 0204 0024
        DECLE   $0272,  $0004                   ; F346   0272 0004

        CLRR    R4                              ; F348   01E4
        CMP@    R4,     R1                      ; F349   0361
        PULR    R2                              ; F34A   02B2
        PSHR    R2                              ; F34B   0272
        CMPI    #$001F, R4                      ; F34C   037C 001F
        BGE     L_F35C                          ; F34E   020D 000C

        MVII    #$0064, R4                      ; F350   02BC 0064
        MVI     G_01BA, R1                      ; F352   0281 01BA
        CMPI    #$0001, R1                      ; F354   0379 0001
        BEQ     L_F37C                          ; F356   0204 0024

        MVII    #$0054, R4                      ; F358   02BC 0054
        B       L_F37C                          ; F35A   0200 0020

L_F35C:
        MVII    #$003A, R0                      ; F35C   02B8 003A
        DECLE   $02BC,  $0064,  $0281,  $01BA   ; F35E   02BC 0064 0281 01BA
        DECLE   $0379,  $0003,  $0204,  $0018   ; F362   0379 0003 0204 0018
        DECLE   $02BC,  $0054,  $0200,  $0014   ; F366   02BC 0054 0200 0014
        DECLE   $0004                           ; F36A   0004

        CLRR    R4                              ; F36B   01E4
        AND     .BTAB.80,R1                     ; F36C   0381 0280
        ANDR    R1,     R0                      ; F36E   0188
        CMPI    #$001F, R0                      ; F36F   0378 001F
        BGE     L_F398                          ; F371   020D 0025

        SDBD                                    ; F373   0001
        CMPI    #$5600, R1                      ; F374   0379 0000 0056
        BC      L_F38C                          ; F377   0201 0013

        PSHR    R2                              ; F379   0272
        MVII    #$005C, R4                      ; F37A   02BC 005C
L_F37C:
        MVII    #$0027, R0                      ; F37C   02B8 0027
        DECLE   $0004,  $01E4,  $01A4,  $02B2   ; F37E   0004 01E4 01A4 02B2
        DECLE   $0004,  $01E4,  $0175,  $0004   ; F382   0004 01E4 0175 0004
        DECLE   $01E4,  $0381,  $0004,  $01E8   ; F386   01E4 0381 0004 01E8
        DECLE   $0027                           ; F38A   0027

        PULR    R7                              ; F38B   02B7

L_F38C:
        PSHR    R2                              ; F38C   0272
        DECLE   $0004,  $01E8,  $0027,  $02B2   ; F38D   0004 01E8 0027 02B2
        DECLE   $0004,  $01E4,  $0175,  $02B8   ; F391   0004 01E4 0175 02B8
        DECLE   $0012,  $0200,  $0017           ; F395   0012 0200 0017
L_F398:
        SDBD                                    ; F398   0001
        DECLE   $0379,  $0000,  $00AA,  $0209   ; F399   0379 0000 00AA 0209
        DECLE   $0007,  $0272,  $02B8,  $003A   ; F39D   0007 0272 02B8 003A
        DECLE   $02BC,  $005C,  $0220,  $0026   ; F3A1   02BC 005C 0220 0026
        DECLE   $0272,  $0004,  $01E8,  $0027   ; F3A5   0272 0004 01E8 0027
        DECLE   $02B2,  $0004,  $01E4,  $0175   ; F3A9   02B2 0004 01E4 0175
        DECLE   $02B8,  $0050,  $0004,  $01E8   ; F3AD   02B8 0050 0004 01E8
        DECLE   $0086,  $0004                   ; F3B1   0086 0004

        CLRR    R4                              ; F3B3   01E4
        ANDR    R4,     R4                      ; F3B4   01A4
        PULR    R7                              ; F3B5   02B7

        DECLE   $02BB,  $018C,  $00D3,  $02B8   ; F3B6   02BB 018C 00D3 02B8
        DECLE   $0002,  $0258,  $0280,  $016B   ; F3BA   0002 0258 0280 016B
        DECLE   $03B8,  $0001,  $0204,  $0031   ; F3BE   03B8 0001 0204 0031
        DECLE   $0283,  $0173,  $0004,  $01E4   ; F3C2   0283 0173 0004 01E4
        DECLE   $016C,  $0151,  $0204,  $0008   ; F3C6   016C 0151 0204 0008
        DECLE   $0283,  $0174,  $0004,  $01E4   ; F3CA   0283 0174 0004 01E4
        DECLE   $016C,  $0151,  $020C,  $0021   ; F3CE   016C 0151 020C 0021
        DECLE   $0272,  $0004                   ; F3D2   0272 0004

        CLRR    R4                              ; F3D4   01E4
        CMP@    R4,     R1                      ; F3D5   0361
        PULR    R2                              ; F3D6   02B2
        CMPI    #$001F, R4                      ; F3D7   037C 001F
        BGE     L_F3E7                          ; F3D9   020D 000C

        MVII    #$0064, R4                      ; F3DB   02BC 0064
        MVI     G_01BA, R1                      ; F3DD   0281 01BA
        CMPI    #$0001, R1                      ; F3DF   0379 0001
        BEQ     L_F41C                          ; F3E1   0204 0039

        MVII    #$0054, R4                      ; F3E3   02BC 0054
        B       L_F41C                          ; F3E5   0200 0035

L_F3E7:
        MVII    #$0064, R4                      ; F3E7   02BC 0064
        MVI     G_01BA, R1                      ; F3E9   0281 01BA
        CMPI    #$0003, R1                      ; F3EB   0379 0003
        BEQ     L_F43E                          ; F3ED   0204 004F

        MVII    #$0054, R4                      ; F3EF   02BC 0054
        B       L_F43E                          ; F3F1   0200 004B

        DECLE   $0004,  $01E4,  $0381,  $0280   ; F3F3   0004 01E4 0381 0280
        DECLE   $0198,  $0378,  $0004,  $020C   ; F3F7   0198 0378 0004 020C
        DECLE   $0014,  $0280,  $0188,  $0378   ; F3FB   0014 0280 0188 0378
        DECLE   $002D,  $020D,  $002A,  $0378   ; F3FF   002D 020D 002A 0378
        DECLE   $001F,  $020D,  $0030,  $0378   ; F403   001F 020D 0030 0378
        DECLE   $0013,  $020D,  $000A,  $0001   ; F407   0013 020D 000A 0001
        DECLE   $0379,  $0000,  $0056,  $0201   ; F40B   0379 0000 0056 0201
        DECLE   $0015,  $0004,  $01E8,  $0027   ; F40F   0015 0004 01E8 0027
        DECLE   $02B7,  $0001,  $0379,  $0000   ; F413   02B7 0001 0379 0000
        DECLE   $0056,  $0221,  $0009           ; F417   0056 0221 0009

        MVII    #$005C, R4                      ; F41A   02BC 005C
L_F41C:
        MVII    #$0027, R0                      ; F41C   02B8 0027
        DECLE   $0004                           ; F41E   0004

        CLRR    R4                              ; F41F   01E4
        ANDR    R4,     R4                      ; F420   01A4
        CLRR    R0                              ; F421   01C0
        MVO     R0,     G_0199                  ; F422   0240 0199
        PULR    R7                              ; F424   02B7

        DECLE   $02B8,  $0012,  $0004,  $01E8   ; F425   02B8 0012 0004 01E8
        DECLE   $0086,  $0220,  $000D,  $0001   ; F429   0086 0220 000D 0001
        DECLE   $0379,  $0000,  $00AA,  $0221   ; F42D   0379 0000 00AA 0221
        DECLE   $0021,  $02B8,  $0050,  $0220   ; F431   0021 02B8 0050 0220
        DECLE   $000E,  $0001,  $0379,  $0000   ; F435   000E 0001 0379 0000
        DECLE   $00AA,  $0229,  $002B           ; F439   00AA 0229 002B

        MVII    #$005C, R4                      ; F43C   02BC 005C
L_F43E:
        MVII    #$003A, R0                      ; F43E   02B8 003A
        DECLE   $0220,  $0023                   ; F440   0220 0023
L_F442:
        PULR    R3                              ; F442   02B3
L_F443:
        PULR    R2                              ; F443   02B2
L_F444:
        PULR    R7                              ; F444   02B7

L_F445:
        MVI     G_01B8, R2                      ; F445   0282 01B8
        TSTR    R2                              ; F447   0092
        BEQ     L_F444                          ; F448   0224 0005

        MVII    #$018C, R3                      ; F44A   02BB 018C
        ADDR    R2,     R3                      ; F44C   00D3
        MVI@    R3,     R0                      ; F44D   0298
        CMPI    #$000A, R0                      ; F44E   0378 000A
        BNEQ    L_F444                          ; F450   022C 000D

        MVI     G_01C4, R0                      ; F452   0280 01C4
        TSTR    R0                              ; F454   0080
        BNEQ    L_F467                          ; F455   020C 0010

        MVII    #$0002, R0                      ; F457   02B8 0002
        MVI     G_01C8, R1                      ; F459   0281 01C8
        CMPI    #$0004, R1                      ; F45B   0379 0004
        BEQ     L_F478                          ; F45D   0204 0019

L_F45F:
        MVII    #$0002, R0                      ; F45F   02B8 0002

        JSR     R5,     X_RAND2                 ; F461   0004 0114 029E

        SLL     R0,     1                       ; F464   0048
        B       L_F478                          ; F465   0200 0011

L_F467:
        MVI     G_01C8, R1                      ; F467   0281 01C8
        CMPI    #$0004, R1                      ; F469   0379 0004
        BEQ     L_F45F                          ; F46B   0224 000D

        MVII    #$0004, R0                      ; F46D   02B8 0004

        JSR     R5,     X_RAND2                 ; F46F   0004 0114 029E

        MOVR    R0,     R1                      ; F472   0081
        SLL     R1,     1                       ; F473   0049
        ADDR    R1,     R0                      ; F474   00C8
        ANDI    #$0008, R0                      ; F475   03B8 0008
        SLR     R0,     2                       ; F477   0064
L_F478:
        MOVR    R0,     R3                      ; F478   0083
        SDBD                                    ; F479   0001
        MVII    #$E4A1, R1                      ; F47A   02B9 00A1 00E4
        ADD     G_01C8, R1                      ; F47D   02C1 01C8
        MVI@    R1,     R0                      ; F47F   0288

        JSR     R5,     X_RAND2                 ; F480   0004 0114 029E

        SDBD                                    ; F483   0001
        MVII    #$E4A5, R1                      ; F484   02B9 00A5 00E4
        ADD     G_01C8, R1                      ; F487   02C1 01C8
        ADD@    R1,     R0                      ; F489   02C8
        MVO     R0,     G_01EA                  ; F48A   0240 01EA
        MVII    #$0003, R0                      ; F48C   02B8 0003

        JSR     R5,     X_RAND2                 ; F48E   0004 0114 029E

        MVO     R0,     G_01B9                  ; F491   0240 01B9

        JSR     R5,     L_DD28                  ; F493   0004 01DC 0128

        BNEQ    L_F444                          ; F496   022C 0053

        MVI     G_01B8, R2                      ; F498   0282 01B8
        MVII    #$018C, R3                      ; F49A   02BB 018C
        ADDR    R2,     R3                      ; F49C   00D3
        MVII    #$0002, R0                      ; F49D   02B8 0002
        MVO@    R0,     R3                      ; F49F   0258
        B       L_F444                          ; F4A0   0220 005D

        EIS                                     ; F4A2   0002
        SETC                                    ; F4A3   0007
        CLRC                                    ; F4A4   0006
        EIS                                     ; F4A5   0002
        DECR    R2                              ; F4A6   0012
        INCR    R3                              ; F4A7   000B
        INCR    R0                              ; F4A8   0008
        SETC                                    ; F4A9   0007
L_F4AA:
        MVI     G_0195, R0                      ; F4AA   0280 0195
        TSTR    R0                              ; F4AC   0080
        BEQ     L_F4B4                          ; F4AD   0204 0005

        INCR    R0                              ; F4AF   0008
        MVO     R0,     G_0195                  ; F4B0   0240 0195
        B       L_F443                          ; F4B2   0220 0070

L_F4B4:
        MVI     G_0196, R0                      ; F4B4   0280 0196
        DECLE   $0080,  $0224,  $0075,  $0010   ; F4B6   0080 0224 0075 0010
        DECLE   $0240,  $0196,  $022C,  $007A   ; F4BA   0240 0196 022C 007A
        DECLE   $01C0,  $0240,  $0199,  $02B2   ; F4BE   01C0 0240 0199 02B2
        DECLE   $0272,  $0283,  $0173,  $0004   ; F4C2   0272 0283 0173 0004

        CLRR    R4                              ; F4C6   01E4
        CMPR    R5,     R4                      ; F4C7   016C
        CMPR    R2,     R0                      ; F4C8   0150
        BEQ     L_F4CE                          ; F4C9   0204 0003

        CMPR    R2,     R1                      ; F4CB   0151
        BNEQ    L_F4D3                          ; F4CC   020C 0005

L_F4CE:
        MVI     G_0174, R3                      ; F4CE   0283 0174
        DECLE   $0004                           ; F4D0   0004

        CLRR    R4                              ; F4D1   01E4
        CMPR    R5,     R4                      ; F4D2   016C
L_F4D3:
        MVI     G_0180, R2                      ; F4D3   0282 0180
        DECLE   $037A,  $0003,  $020E,  $0044   ; F4D5   037A 0003 020E 0044
        DECLE   $0082,  $0004                   ; F4D9   0082 0004

        CLRR    R4                              ; F4DB   01E4
        CMP@    R4,     R1                      ; F4DC   0361
L_F4DD:
        MVII    #$0008, R1                      ; F4DD   02B9 0008
        MVII    #$000F, R3                      ; F4DF   02BB 000F
        MVI     G_01C8, R2                      ; F4E1   0282 01C8
        CMPI    #$0004, R2                      ; F4E3   037A 0004
        BNEQ    L_F4E9                          ; F4E5   020C 0002

        INCR    R1                              ; F4E7   0009
        DECR    R3                              ; F4E8   0013
L_F4E9:
        MOVR    R1,     R2                      ; F4E9   008A
        DECLE   $037C,  $002D,  $020D,  $0015   ; F4EA   037C 002D 020D 0015
        DECLE   $037C,  $001F,  $020D,  $0016   ; F4EE   037C 001F 020D 0016

        MVII    #$0007, R1                      ; F4F2   02B9 0007
        MVII    #$0000, R2                      ; F4F4   02BA 0000
        MVI     G_01C8, R3                      ; F4F6   0283 01C8
        CMPI    #$0004, R3                      ; F4F8   037B 0004
        BNEQ    L_F4FE                          ; F4FA   020C 0002

        DECR    R1                              ; F4FC   0011
        INCR    R2                              ; F4FD   000A
L_F4FE:
        MOVR    R2,     R3                      ; F4FE   0093
        DECLE   $037C,  $0013,  $020D,  $0005   ; F4FF   037C 0013 020D 0005
        DECLE   $0004                           ; F503   0004

        CLRR    R4                              ; F504   01E4
        SUBR    R6,     R1                      ; F505   0131
        B       L_F50B                          ; F506   0200 0003

        DECLE   $0004,  $01E4,  $0137           ; F508   0004 01E4 0137
L_F50B:
        PULR    R2                              ; F50B   02B2
        MOVR    R2,     R1                      ; F50C   0091
        DECR    R1                              ; F50D   0011
        MOVR    R1,     R0                      ; F50E   0088
        SLR     R1,     1                       ; F50F   0061
        ADDI    #$01E8, R1                      ; F510   02F9 01E8
        SARC    R0,     1                       ; F512   0078
        BNC     L_F517                          ; F513   0209 0002

        SLL     R3,     2                       ; F515   004F
        SLL     R3,     2                       ; F516   004F
L_F517:
        MVO@    R3,     R1                      ; F517   024B
        MOVR    R4,     R3                      ; F518   00A3

        JSR     R5,     L_DD28                  ; F519   0004 01DC 0128

        PULR    R7                              ; F51C   02B7

        DECLE   $0271,  $0082,  $0004,  $01E4   ; F51D   0271 0082 0004 01E4
        DECLE   $0361,  $02B2,  $0270,  $0274   ; F521   0361 02B2 0270 0274
        DECLE   $0004                           ; F525   0004

        CLRR    R4                              ; F526   01E4
        CMP@    R4,     R1                      ; F527   0361
        PULR    R3                              ; F528   02B3
        ADDR    R4,     R3                      ; F529   00E3
        SLR     R3,     1                       ; F52A   0063
        MOVR    R3,     R4                      ; F52B   009C
        PULR    R2                              ; F52C   02B2
        ADDR    R2,     R0                      ; F52D   00D0
        SLR     R0,     1                       ; F52E   0060
        B       L_F4DD                          ; F52F   0220 0053

        DECLE   $0275,  $0004,  $01E4,  $013F   ; F531   0275 0004 01E4 013F

        MOVR    R0,     R4                      ; F535   0084
        PULR    R7                              ; F536   02B7

        DECLE   $0275,  $0004,  $01E4,  $013F   ; F537   0275 0004 01E4 013F

        SLR     R0,     1                       ; F53B   0060
        INCR    R0                              ; F53C   0008
        MOVR    R0,     R4                      ; F53D   0084
        PULR    R7                              ; F53E   02B7

        PSHR    R5                              ; F53F   0275
        SUBI    #$0017, R0                      ; F540   0338 0017
        CMPI    #$0006, R0                      ; F542   0378 0006
        BGT     L_F560                          ; F544   020E 001A

        CMPI    #$0000, R0                      ; F546   0378 0000
        BGE     L_F54F                          ; F548   020D 0005

        NEGR    R0                              ; F54A   0020
        CMPI    #$0006, R0                      ; F54B   0378 0006
        BGT     L_F561                          ; F54D   020E 0012

L_F54F:
        MVII    #$0008, R0                      ; F54F   02B8 0008
        MVI     G_01C8, R3                      ; F551   0283 01C8
        CMPI    #$0004, R3                      ; F553   037B 0004
        BNEQ    L_F559                          ; F555   020C 0002

        MVII    #$0006, R0                      ; F557   02B8 0006

L_F559:
        JSR     R5,     X_RAND2                 ; F559   0004 0114 029E

        ADDR    R2,     R0                      ; F55C   00D0
        MOVR    R0,     R3                      ; F55D   0083
        B       L_F561                          ; F55E   0200 0001

L_F560:
        MOVR    R1,     R3                      ; F560   008B
L_F561:
        MVII    #$0004, R0                      ; F561   02B8 0004

        JSR     R5,     X_RAND2                 ; F563   0004 0114 029E

        INCR    R0                              ; F566   0008
        SLL     R0,     1                       ; F567   0048
        ANDI    #$0008, R0                      ; F568   03B8 0008
        SLR     R0,     2                       ; F56A   0064
        PULR    R7                              ; F56B   02B7

        MOVR    R3,     R0                      ; F56C   0098
        ANDI    #$0007, R0                      ; F56D   03B8 0007
        MOVR    R3,     R1                      ; F56F   0099
        ANDI    #$0038, R1                      ; F570   03B9 0038
        SLR     R1,     2                       ; F572   0065
        SLR     R1,     1                       ; F573   0061
        MOVR    R5,     R7                      ; F574   00AF

        CMPI    #$0003, R2                      ; F575   037A 0003
        BEQ     L_F57C                          ; F577   0204 0003

        MVII    #$0003, R2                      ; F579   02BA 0003
        MOVR    R5,     R7                      ; F57B   00AF

L_F57C:
        MVII    #$0004, R2                      ; F57C   02BA 0004
        MOVR    R5,     R7                      ; F57E   00AF

        PSHR    R5                              ; F57F   0275
        PSHR    R0                              ; F580   0270
        MVI     G_0187, R1                      ; F581   0281 0187
        SLL     R1,     2                       ; F583   004D
        SUBR    R2,     R1                      ; F584   0111
        MVI     G_0191, R0                      ; F585   0280 0191

        JSR     R5,     X_EXT_SIGN_LO           ; F587   0004 0114 0268

        SLL     R0,     1                       ; F58A   0048

        JSR     R5,     X_MPY                   ; F58B   0004 011C 01DC

        PULR    R0                              ; F58E   02B0
        PSHR    R2                              ; F58F   0272
        MVI     G_0188, R1                      ; F590   0281 0188
        SLL     R1,     2                       ; F592   004D
        SUBR    R0,     R1                      ; F593   0101
        MVI     G_0192, R0                      ; F594   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F596   0004 0114 0268

        SLL     R0,     2                       ; F599   004C

        JSR     R5,     X_MPY                   ; F59A   0004 011C 01DC

        PULR    R1                              ; F59D   02B1
        ADDR    R2,     R1                      ; F59E   00D1
        MOVR    R3,     R2                      ; F59F   009A

        JSR     R5,     X_DIV                   ; F5A0   0004 011C 01FB

        PULR    R7                              ; F5A3   02B7

        PSHR    R5                              ; F5A4   0275
        PSHR    R0                              ; F5A5   0270
        PSHR    R4                              ; F5A6   0274
        MVII    #$0005, R0                      ; F5A7   02B8 0005
        J       L_550B                          ; F5A9   0004 0354 010B

        PSHR    R5                              ; F5AC   0275
        MVI     G_0324, R1                      ; F5AD   0281 0324
        SLL     R1,     1                       ; F5AF   0049
        SUB     G_01B1, R1                      ; F5B0   0301 01B1
        PSHR    R1                              ; F5B2   0271
        MVII    #$0020, R2                      ; F5B3   02BA 0020

        JSR     R5,     X_DIV                   ; F5B5   0004 011C 01FB
        JSR     R5,     X_SQUARE                ; F5B8   0004 011C 01DB

        CLRR    R3                              ; F5BB   01DB
        TSTR    R2                              ; F5BC   0092
        BMI     L_F5C0                          ; F5BD   020B 0001

        MOVR    R2,     R3                      ; F5BF   0093
L_F5C0:
        MVI     G_01B1, R0                      ; F5C0   0280 01B1
        MVI     G_018C, R1                      ; F5C2   0281 018C
        SLL     R1,     1                       ; F5C4   0049

        JSR     R5,     X_MPY                   ; F5C5   0004 011C 01DC

        ADDR    R3,     R2                      ; F5C8   00DA
        BPL     L_F5CC                          ; F5C9   0203 0001

        NEGR    R2                              ; F5CB   0022
L_F5CC:
        MOVR    R2,     R1                      ; F5CC   0091

        JSR     R5,     X_SQRT                  ; F5CD   0004 011C 0223

        SLL     R2,     2                       ; F5D0   004E
        SLL     R2,     2                       ; F5D1   004E
        SLL     R2,     1                       ; F5D2   004A
        PULR    R1                              ; F5D3   02B1
        ADDR    R2,     R1                      ; F5D4   00D1
        MVI     G_01B1, R2                      ; F5D5   0282 01B1
        SLL     R2,     1                       ; F5D7   004A

        JSR     R5,     X_DIV                   ; F5D8   0004 011C 01FB
        DECLE   $0080,  $0204,  $0001,  $0010   ; F5DB   0080 0204 0001 0010
        DECLE   $0004,  $01E4,  $01F1,  $0004   ; F5DF   0004 01E4 01F1 0004

        CLRR    R4                              ; F5E3   01E4
        MVO@    R4,     R4                      ; F5E4   0264
        MOVR    R2,     R4                      ; F5E5   0094
L_F5E6:
        SUB     G_01B1, R4                      ; F5E6   0304 01B1
        ADDR    R4,     R3                      ; F5E8   00E3
        BMI     L_F5EE                          ; F5E9   020B 0003

        INCR    R0                              ; F5EB   0008
        B       L_F5E6                          ; F5EC   0220 0007

L_F5EE:
        MVO     R0,     G_0181                  ; F5EE   0240 0181
        PULR    R7                              ; F5F0   02B7

        PSHR    R5                              ; F5F1   0275
        PSHR    R1                              ; F5F2   0271
        PSHR    R0                              ; F5F3   0270
        MVI     G_0324, R1                      ; F5F4   0281 0324

        JSR     R5,     X_MPY                   ; F5F6   0004 011C 01DC

        MVI     G_018C, R0                      ; F5F9   0280 018C
        SWAP    R0,     1                       ; F5FB   0040
        ADDR    R0,     R2                      ; F5FC   00C2
L_F5FD:
        PULR    R0                              ; F5FD   02B0
        PSHR    R0                              ; F5FE   0270
        PSHR    R2                              ; F5FF   0272
        MOVR    R0,     R1                      ; F600   0081
        INCR    R1                              ; F601   0009
        MVII    #$0002, R2                      ; F602   02BA 0002

        JSR     R5,     L_57CB                  ; F604   0004 0154 03CB

        MVI     G_01B1, R1                      ; F607   0281 01B1

        JSR     R5,     X_MPY                   ; F609   0004 011C 01DC

        PULR    R3                              ; F60C   02B3
        SUBR    R2,     R3                      ; F60D   0113
        PULR    R0                              ; F60E   02B0
        PULR    R1                              ; F60F   02B1
        PULR    R7                              ; F610   02B7

        PSHR    R5                              ; F611   0275
        PSHR    R0                              ; F612   0270
        MOVR    R0,     R4                      ; F613   0084
        SLL     R0,     2                       ; F614   004C
        PSHR    R0                              ; F615   0270
        MOVR    R0,     R1                      ; F616   0081
        SLL     R1,     2                       ; F617   004D
        MVI     G_0192, R0                      ; F618   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F61A   0004 0114 0268
        JSR     R5,     X_MPY                   ; F61D   0004 011C 01DC

        MVI     G_018B, R0                      ; F620   0280 018B
        SWAP    R0,     1                       ; F622   0040
        SLR     R0,     2                       ; F623   0064
        ADDR    R0,     R2                      ; F624   00C2
        PULR    R1                              ; F625   02B1
        BMI     L_F649                          ; F626   020B 0021

        SDBD                                    ; F628   0001
        CMPI    #$3F00, R2                      ; F629   037A 0000 003F
        BC      L_F649                          ; F62C   0201 001B

        SLL     R2,     2                       ; F62E   004E
        MOVR    R2,     R3                      ; F62F   0093
        MVI     G_0191, R0                      ; F630   0280 0191

        JSR     R5,     X_EXT_SIGN_LO           ; F632   0004 0114 0268

        SLL     R0,     1                       ; F635   0048

        JSR     R5,     X_MPY                   ; F636   0004 011C 01DC

        MVI     G_018A, R0                      ; F639   0280 018A
        SWAP    R0,     1                       ; F63B   0040
        SLR     R0,     2                       ; F63C   0064
        ADDR    R0,     R2                      ; F63D   00C2
        BMI     L_F649                          ; F63E   020B 0009

        SDBD                                    ; F640   0001
        CMPI    #$2B00, R2                      ; F641   037A 0000 002B
        BC      L_F649                          ; F644   0201 0003

        SLL     R2,     2                       ; F646   004E
        PULR    R0                              ; F647   02B0
        PULR    R7                              ; F648   02B7

L_F649:
        CLRR    R4                              ; F649   01E4
        PULR    R0                              ; F64A   02B0
        PULR    R7                              ; F64B   02B7

        PSHR    R5                              ; F64C   0275
        MVI     G_0192, R0                      ; F64D   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F64F   0004 0114 0268

        MOVR    R0,     R2                      ; F652   0082
        MVII    #$01A4, R1                      ; F653   02B9 01A4
        TSTR    R2                              ; F655   0092
        BMI     L_F65A                          ; F656   020B 0002

        MVII    #$0244, R1                      ; F658   02B9 0244
L_F65A:
        MVI     G_018B, R0                      ; F65A   0280 018B
        SLL     R0,     2                       ; F65C   004C
        SUBR    R0,     R1                      ; F65D   0101

        JSR     R5,     X_DIV                   ; F65E   0004 011C 01FB

        MVO     R0,     G_0185                  ; F661   0240 0185
        PULR    R7                              ; F663   02B7

        PSHR    R5                              ; F664   0275
        PSHR    R1                              ; F665   0271
        PSHR    R0                              ; F666   0270
        MVI     G_01B1, R1                      ; F667   0281 01B1

        JSR     R5,     X_MPY                   ; F669   0004 011C 01DC

        SUB     G_0324, R2                      ; F66C   0302 0324
        NEGR    R2                              ; F66E   0022
        PULR    R0                              ; F66F   02B0
        PULR    R1                              ; F670   02B1
        PULR    R7                              ; F671   02B7

        DECLE   $0275,  $0004                   ; F672   0275 0004

        CLRR    R4                              ; F674   01E4
        CMP@    R1,     R4                      ; F675   034C
        NEGR    R0                              ; F676   0020
        MOVR    R0,     R4                      ; F677   0084
        CMP     G_01B1, R0                      ; F678   0340 01B1
        BLE     L_F697                          ; F67A   0206 001B

        SLL     R0,     1                       ; F67C   0048
        SUB     G_01B1, R0                      ; F67D   0300 01B1
        MOVR    R0,     R1                      ; F67F   0081
        MVI     G_01B1, R2                      ; F680   0282 01B1

        JSR     R5,     X_DIV                   ; F682   0004 011C 01FB
        DECLE   $0080,  $0204,  $0001,  $0010   ; F685   0080 0204 0001 0010
        DECLE   $0004,  $01E4,  $029B,  $0004   ; F689   0004 01E4 029B 0004

        CLRR    R4                              ; F68D   01E4
        MVI@    R4,     R4                      ; F68E   02A4
L_F68F:
        SUB     G_01B1, R4                      ; F68F   0304 01B1
        ADDR    R4,     R3                      ; F691   00E3
        BMI     L_F698                          ; F692   020B 0004

        INCR    R0                              ; F694   0008
        B       L_F68F                          ; F695   0220 0007

L_F697:
        CLRR    R0                              ; F697   01C0
L_F698:
        MVO     R0,     G_0184                  ; F698   0240 0184
        PULR    R7                              ; F69A   02B7

        PSHR    R5                              ; F69B   0275
        PSHR    R1                              ; F69C   0271
        PSHR    R0                              ; F69D   0270
        MOVR    R4,     R1                      ; F69E   00A1

        JSR     R5,     X_MPY                   ; F69F   0004 011C 01DC

        B       L_F5FD                          ; F6A2   0220 00A6

        PSHR    R5                              ; F6A4   0275
        PSHR    R1                              ; F6A5   0271
        PSHR    R0                              ; F6A6   0270
        MVI     G_01B1, R1                      ; F6A7   0281 01B1

        JSR     R5,     X_MPY                   ; F6A9   0004 011C 01DC

        SUBR    R2,     R4                      ; F6AC   0114
        PULR    R0                              ; F6AD   02B0
        PULR    R1                              ; F6AE   02B1
        PULR    R7                              ; F6AF   02B7

        PSHR    R5                              ; F6B0   0275
        PSHR    R0                              ; F6B1   0270
        PSHR    R0                              ; F6B2   0270
        MOVR    R0,     R1                      ; F6B3   0081
        SLL     R1,     2                       ; F6B4   004D
        MVI     G_0192, R0                      ; F6B5   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F6B7   0004 0114 0268
        JSR     R5,     X_MPY                   ; F6BA   0004 011C 01DC

        MOVR    R2,     R0                      ; F6BD   0090
        MVI     G_019C, R1                      ; F6BE   0281 019C

        JSR     R5,     X_MPY                   ; F6C0   0004 011C 01DC

        MVI     G_0183, R0                      ; F6C3   0280 0183
        SWAP    R0,     1                       ; F6C5   0040
        ADDR    R0,     R2                      ; F6C6   00C2
        MOVR    R2,     R3                      ; F6C7   0093
        PULR    R1                              ; F6C8   02B1
        MVI     G_0191, R0                      ; F6C9   0280 0191

        JSR     R5,     X_EXT_SIGN_LO           ; F6CB   0004 0114 0268

        SLL     R0,     1                       ; F6CE   0048

        JSR     R5,     X_MPY                   ; F6CF   0004 011C 01DC

        MOVR    R2,     R0                      ; F6D2   0090
        MVI     G_019C, R1                      ; F6D3   0281 019C

        JSR     R5,     X_MPY                   ; F6D5   0004 011C 01DC

        MVI     G_0182, R0                      ; F6D8   0280 0182
        SWAP    R0,     1                       ; F6DA   0040
        ADDR    R0,     R2                      ; F6DB   00C2
        PULR    R0                              ; F6DC   02B0
        PULR    R7                              ; F6DD   02B7

        PSHR    R5                              ; F6DE   0275
        SDBD                                    ; F6DF   0001
        MVII    #$A900, R1                      ; F6E0   02B9 0000 00A9
        MVI     G_0191, R0                      ; F6E3   0280 0191

        JSR     R5,     X_EXT_SIGN_LO           ; F6E5   0004 0114 0268

        TSTR    R0                              ; F6E8   0080
        BNEQ    L_F6EF                          ; F6E9   020C 0004

        MVII    #$007F, R0                      ; F6EB   02B8 007F
        B       L_F70D                          ; F6ED   0200 001E
L_F6EF:
        BPL     L_F6F5                          ; F6EF   0203 0004

        SDBD                                    ; F6F1   0001
        MVII    #$0A00, R1                      ; F6F2   02B9 0000 000A
L_F6F5:
        MVI     G_0182, R0                      ; F6F5   0280 0182
        SWAP    R0,     1                       ; F6F7   0040
        SUBR    R0,     R1                      ; F6F8   0101
        MVI     G_019C, R2                      ; F6F9   0282 019C

        JSR     R5,     X_DIV                   ; F6FB   0004 011C 01FB

        MOVR    R0,     R1                      ; F6FE   0081
        MVI     G_0191, R0                      ; F6FF   0280 0191

        JSR     R5,     X_EXT_SIGN_LO           ; F701   0004 0114 0268

        SLL     R0,     1                       ; F704   0048
        MOVR    R0,     R2                      ; F705   0082

        JSR     R5,     X_DIV                   ; F706   0004 011C 01FB

        TSTR    R0                              ; F709   0080
        BNEQ    L_F70D                          ; F70A   020C 0001

        CLRR    R0                              ; F70C   01C0
L_F70D:
        PSHR    R0                              ; F70D   0270
        SDBD                                    ; F70E   0001
        MVII    #$FA00, R1                      ; F70F   02B9 0000 00FA
        MVI     G_0192, R0                      ; F712   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F714   0004 0114 0268

        TSTR    R0                              ; F717   0080
        BNEQ    L_F71E                          ; F718   020C 0004

        MVII    #$007F, R0                      ; F71A   02B8 007F
        B       L_F73A                          ; F71C   0200 001C
L_F71E:
        BPL     L_F722                          ; F71E   0203 0002

        MVII    #$0000, R1                      ; F720   02B9 0000
L_F722:
        MVI     G_0183, R0                      ; F722   0280 0183
        SWAP    R0,     1                       ; F724   0040
        SUBR    R0,     R1                      ; F725   0101
        MVI     G_019C, R2                      ; F726   0282 019C
        SLL     R2,     2                       ; F728   004E

        JSR     R5,     X_DIV                   ; F729   0004 011C 01FB

        MOVR    R0,     R1                      ; F72C   0081
        MVI     G_0192, R0                      ; F72D   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F72F   0004 0114 0268

        MOVR    R0,     R2                      ; F732   0082

        JSR     R5,     X_DIV                   ; F733   0004 011C 01FB

        TSTR    R0                              ; F736   0080
        BNEQ    L_F73A                          ; F737   020C 0001

        CLRR    R0                              ; F739   01C0
L_F73A:
        PULR    R2                              ; F73A   02B2
        CMPR    R0,     R2                      ; F73B   0142
        BGE     L_F745                          ; F73C   020D 0007

        CMP     G_0184, R2                      ; F73E   0342 0184
        BGE     L_F74B                          ; F740   020D 0009

        MVO     R2,     G_0184                  ; F742   0242 0184
        PULR    R7                              ; F744   02B7

L_F745:
        CMP     G_0184, R0                      ; F745   0340 0184
        BGE     L_F74B                          ; F747   020D 0002

        MVO     R0,     G_0184                  ; F749   0240 0184
L_F74B:
        PULR    R7                              ; F74B   02B7

        PSHR    R5                              ; F74C   0275
        PSHR    R1                              ; F74D   0271
        PSHR    R2                              ; F74E   0272
        MVI     G_019C, R1                      ; F74F   0281 019C
        MVII    #$0010, R2                      ; F751   02BA 0010

        JSR     R5,     L_57CB                  ; F753   0004 0154 03CB

        TSTR    R0                              ; F756   0080
        BEQ     L_F75E                          ; F757   0204 0005

        DECR    R0                              ; F759   0010
        BPL     L_F75E                          ; F75A   0203 0002

        ADDI    #$0002, R0                      ; F75C   02F8 0002
L_F75E:
        PULR    R2                              ; F75E   02B2
        PULR    R1                              ; F75F   02B1
        PULR    R7                              ; F760   02B7

        PSHR    R5                              ; F761   0275

        JSR     R5,     L_D181                  ; F762   0004 01D0 0181

        ADDI    #$0003, R1                      ; F765   02F9 0003
        PSHR    R1                              ; F767   0271
        MVI@    R1,     R0                      ; F768   0288

        JSR     R5,     L_D6A8                  ; F769   0004 01D4 02A8

        MOVR    R2,     R1                      ; F76C   0091
        SLR     R1,     2                       ; F76D   0065
        MOVR    R1,     R4                      ; F76E   008C
        PULR    R1                              ; F76F   02B1
        DECR    R1                              ; F770   0011
        MVI@    R1,     R0                      ; F771   0288
        MOVR    R2,     R1                      ; F772   0091

        JSR     R5,     L_D687                  ; F773   0004 01D4 0287

        SLR     R0,     2                       ; F776   0064
        PULR    R7                              ; F777   02B7

        MVI     G_01B8, R1                      ; F778   0281 01B8
        MVII    #$018C, R3                      ; F77A   02BB 018C
        ADDR    R1,     R3                      ; F77C   00CB
        MVII    #$000A, R0                      ; F77D   02B8 000A
        MVO@    R0,     R3                      ; F77F   0258
        MOVR    R5,     R7                      ; F780   00AF

        DECLE   $0275,  $0272,  $0004           ; F781   0275 0272 0004

        CLRR    R4                              ; F784   01E4
        CMP@    R4,     R1                      ; F785   0361
        MVO     R0,     G_0187                  ; F786   0240 0187
        MVO     R4,     G_0188                  ; F788   0244 0188
        CLRR    R3                              ; F78A   01DB
        MVI     G_0191, R0                      ; F78B   0280 0191

        JSR     R5,     X_EXT_SIGN_LO           ; F78D   0004 0114 0268

        SLL     R0,     1                       ; F790   0048

        JSR     R5,     X_SQUARE                ; F791   0004 011C 01DB

        TSTR    R2                              ; F794   0092
        BMI     L_F798                          ; F795   020B 0001

        MOVR    R2,     R3                      ; F797   0093
L_F798:
        MVI     G_0192, R0                      ; F798   0280 0192

        JSR     R5,     X_EXT_SIGN_LO           ; F79A   0004 0114 0268

        SLL     R0,     2                       ; F79D   004C

        JSR     R5,     X_SQUARE                ; F79E   0004 011C 01DB

        TSTR    R2                              ; F7A1   0092
        BMI     L_F7A5                          ; F7A2   020B 0001

        ADDR    R2,     R3                      ; F7A4   00D3
L_F7A5:
        SLR     R3,     2                       ; F7A5   0067
        DECLE   $0067,  $0280,  $016B,  $03B8   ; F7A6   0067 0280 016B 03B8
        DECLE   $0001,  $0204,  $004D,  $0280   ; F7AA   0001 0204 004D 0280
        DECLE   $0184,  $0378,  $0002,  $020E   ; F7AE   0184 0378 0002 020E
        DECLE   $0004,  $02B8,  $0001,  $0200   ; F7B2   0004 02B8 0001 0200
        DECLE   $0028                           ; F7B6   0028
L_F7B7:
        MVI     G_0181, R0                      ; F7B7   0280 0181
        DECLE   $0004,  $01E4,  $0264,  $0090   ; F7B9   0004 01E4 0264 0090
        DECLE   $0004,  $01E4,  $034C,  $0020   ; F7BD   0004 01E4 034C 0020
        DECLE   $0084,  $0280,  $0184,  $0060   ; F7C1   0084 0280 0184 0060
        DECLE   $0004,  $01E4,  $029B,  $037B   ; F7C5   0004 01E4 029B 037B
        DECLE   $0200,  $0206,  $0013           ; F7C9   0200 0206 0013

        PSHR    R0                              ; F7CC   0270
        MVI     G_0184, R0                      ; F7CD   0280 0184
        MVII    #$0003, R1                      ; F7CF   02B9 0003
        MVII    #$0004, R2                      ; F7D1   02BA 0004

        JSR     R5,     L_57CB                  ; F7D3   0004 0154 03CB
        DECLE   $0004,  $01E4,  $029B,  $037B   ; F7D6   0004 01E4 029B 037B
        DECLE   $0200,  $02B1,  $020E,  $0001   ; F7DA   0200 02B1 020E 0001
        DECLE   $0088,  $0004                   ; F7DE   0088 0004

        CLRR    R4                              ; F7E0   01E4
        PULR    R0                              ; F7E1   02B0
        ADD     G_0181, R0                      ; F7E2   02C0 0181
        MVO     R0,     G_0194                  ; F7E4   0240 0194
        B       L_F823                          ; F7E6   0200 003B

L_F7E8:
        MVI     G_0185, R1                      ; F7E8   0281 0185
        CMPR    R1,     R0                      ; F7EA   0148
        BLT     L_F818                          ; F7EB   0205 002B

        MOVR    R0,     R1                      ; F7ED   0081
        B       L_F81A                          ; F7EE   0200 002A

        MVI     G_0181, R0                      ; F7F0   0280 0181
        DECR    R0                              ; F7F2   0010
L_F7F3:
        MVO     R0,     G_0194                  ; F7F3   0240 0194
        DECLE   $0004,  $01E4,  $0211,  $0200   ; F7F5   0004 01E4 0211 0200
        DECLE   $0029,  $0282,  $018A,  $0280   ; F7F9   0029 0282 018A 0280
        DECLE   $018B,  $0004                   ; F7FD   018B 0004

        CLRR    R4                              ; F7FF   01E4
        CMPR    R7,     R7                      ; F800   017F
        CMP     G_0181, R0                      ; F801   0340 0181
        BLT     L_F7E8                          ; F803   0225 001C

        MVI     G_0184, R0                      ; F805   0280 0184
        CMPI    #$0002, R0                      ; F807   0378 0002
        BLE     L_F818                          ; F809   0206 000D

        MVI     G_0181, R0                      ; F80B   0280 0181
        SUB     G_0185, R0                      ; F80D   0300 0185
        CMPI    #$000A, R0                      ; F80F   0378 000A
        BLT     L_F7B7                          ; F811   0225 005B

        SLR     R0,     1                       ; F813   0060
        ADD     G_0185, R0                      ; F814   02C0 0185
        B       L_F7F3                          ; F816   0220 0024

L_F818:
        MVI     G_0185, R1                      ; F818   0281 0185
L_F81A:
        MVI     G_0181, R0                      ; F81A   0280 0181
        DECLE   $00C8,  $0060,  $0240,  $0194   ; F81C   00C8 0060 0240 0194
        DECLE   $0004,  $01E4,  $0211           ; F820   0004 01E4 0211
L_F823:
        MOVR    R3,     R1                      ; F823   0099
        MOVR    R2,     R3                      ; F824   0093
        PULR    R2                              ; F825   02B2
        PULR    R7                              ; F826   02B7

        PSHR    R5                              ; F827   0275
        PSHR    R2                              ; F828   0272
        PSHR    R1                              ; F829   0271
        MVO     R2,     G_0199                  ; F82A   0242 0199
        MVII    #$018C, R4                      ; F82C   02BC 018C
        ADDR    R2,     R4                      ; F82E   00D4
        MVII    #$0001, R0                      ; F82F   02B8 0001
        MVO@    R0,     R4                      ; F831   0260
        MVII    #$0005, R0                      ; F832   02B8 0005
        SUB     G_01C8, R0                      ; F834   0300 01C8

        JSR     R5,     X_RAND2                 ; F836   0004 0114 029E

        SWAP    R0,     1                       ; F839   0040
        MOVR    R0,     R2                      ; F83A   0082
        MVI     G_0187, R0                      ; F83B   0280 0187
        SLL     R0,     2                       ; F83D   004C
        SWAP    R0,     1                       ; F83E   0040
        CMPR    R0,     R3                      ; F83F   0143
        BC      L_F851                          ; F840   0201 000F

        SUBI    #$0100, R3                      ; F842   033B 0100
        ADDR    R2,     R3                      ; F844   00D3
        MVI     G_0186, R2                      ; F845   0282 0186
        SDBD                                    ; F847   0001
        CMPI    #$7D00, R1                      ; F848   0379 0000 007D
        BNC     L_F860                          ; F84B   0209 0013

L_F84D:
        ADDI    #$0100, R1                      ; F84D   02F9 0100
        B       L_F862                          ; F84F   0200 0011

L_F851:
        SDBD                                    ; F851   0001
        SUBI    #$0400, R3                      ; F852   033B 0000 0004
        SUBR    R2,     R3                      ; F855   0113
        MVI     G_0186, R2                      ; F856   0282 0186
        SDBD                                    ; F858   0001
        CMPI    #$7D00, R1                      ; F859   0379 0000 007D
        BC      L_F84D                          ; F85C   0221 0010

        SUBI    #$0200, R3                      ; F85E   033B 0200
L_F860:
        SUBI    #$0100, R1                      ; F860   0339 0100
L_F862:
        MVII    #$0005, R0                      ; F862   02B8 0005
        SUB     G_01C8, R0                      ; F864   0300 01C8
        DECR    R0                              ; F866   0010
        ADDI    #$0002, R0                      ; F867   02F8 0002
        ADDR    R2,     R0                      ; F869   00D0
        MVO     R0,     G_0195                  ; F86A   0240 0195

        JSR     R5,     L_57A4                  ; F86C   0004 0154 03A4

        SWAP    R3,     1                       ; F86F   0043
        ANDI    #$00FF, R3                      ; F870   03BB 00FF
        PULR    R1                              ; F872   02B1
        PSHR    R3                              ; F873   0273
        CLRR    R3                              ; F874   01DB

        JSR     R5,     L_5781                  ; F875   0004 0154 0381
        DECLE   $0001,  $033B,  $0000,  $0010   ; F878   0001 033B 0000 0010
        DECLE   $0043,  $03BB,  $00FF,  $0098   ; F87C   0043 03BB 00FF 0098
        DECLE   $02B4,  $02B2,  $0004           ; F880   02B4 02B2 0004

        CLRR    R4                              ; F883   01E4
        ANDR    R4,     R4                      ; F884   01A4
        PULR    R7                              ; F885   02B7

        MVII    #$0064, R4                      ; F886   02BC 0064
        MVI     G_0187, R3                      ; F888   0283 0187
        CMPI    #$0017, R3                      ; F88A   037B 0017
        BGE     L_F890                          ; F88C   020D 0002

        MVII    #$0054, R4                      ; F88E   02BC 0054
L_F890:
        MOVR    R5,     R7                      ; F890   00AF

        PSHR    R5                              ; F891   0275
        MOVR    R3,     R4                      ; F892   009C
        MVII    #$00FF, R3                      ; F893   02BB 00FF
        MOVR    R2,     R1                      ; F895   0091
        ANDR    R3,     R1                      ; F896   0199
        MVI     G_0354, R0                      ; F897   0280 0354
        SDBD                                    ; F899   0001
        ANDI    #$FF00, R0                      ; F89A   03B8 0000 00FF
        SWAP    R0,     1                       ; F89D   0040
        SUBR    R0,     R1                      ; F89E   0101
        MOVR    R2,     R0                      ; F89F   0090
        SWAP    R0,     1                       ; F8A0   0040
        ANDR    R3,     R0                      ; F8A1   0198
        MOVR    R0,     R2                      ; F8A2   0082
        MVI     G_034C, R0                      ; F8A3   0280 034C
        SDBD                                    ; F8A5   0001
        ANDI    #$FF00, R0                      ; F8A6   03B8 0000 00FF
        SWAP    R0,     1                       ; F8A9   0040
        SUBR    R0,     R2                      ; F8AA   0102
        SAR     R2,     1                       ; F8AB   006A
        SAR     R1,     1                       ; F8AC   0069
        PSHR    R1                              ; F8AD   0271
        PSHR    R2                              ; F8AE   0272
        MOVR    R2,     R3                      ; F8AF   0093
        MOVR    R1,     R0                      ; F8B0   0088

        JSR     R5,     X_SQUARE                ; F8B1   0004 011C 01DB

        TSTR    R2                              ; F8B4   0092
        BMI     L_F8D5                          ; F8B5   020B 001E

L_F8B7:
        MOVR    R3,     R0                      ; F8B7   0098
        MOVR    R2,     R3                      ; F8B8   0093

        JSR     R5,     X_SQUARE                ; F8B9   0004 011C 01DB

        TSTR    R2                              ; F8BC   0092
        BMI     L_F8D9                          ; F8BD   020B 001A

L_F8BF:
        ADDR    R3,     R2                      ; F8BF   00DA
        MOVR    R2,     R1                      ; F8C0   0091

        JSR     R5,     X_SQRT                  ; F8C1   0004 011C 0223

        PULR    R1                              ; F8C4   02B1
        MOVR    R4,     R0                      ; F8C5   00A0
        MOVR    R2,     R3                      ; F8C6   0093

        JSR     R5,     L_57CB                  ; F8C7   0004 0154 03CB

        MOVR    R3,     R2                      ; F8CA   009A
        MOVR    R0,     R3                      ; F8CB   0083
        PULR    R1                              ; F8CC   02B1
        MOVR    R4,     R0                      ; F8CD   00A0

        JSR     R5,     L_57CB                  ; F8CE   0004 0154 03CB

        MOVR    R3,     R2                      ; F8D1   009A
        MOVR    R0,     R1                      ; F8D2   0081
        MOVR    R2,     R0                      ; F8D3   0090
        PULR    R7                              ; F8D4   02B7

L_F8D5:
        MVII    #$0001, R2                      ; F8D5   02BA 0001
        B       L_F8B7                          ; F8D7   0220 0021

L_F8D9:
        MVII    #$0001, R2                      ; F8D9   02BA 0001
        B       L_F8BF                          ; F8DB   0220 001D

        PSHR    R5                              ; F8DD   0275
        MOVR    R3,     R0                      ; F8DE   0098

        JSR     R5,     L_556E                  ; F8DF   0004 0154 016E

        MVI     G_032C, R3                      ; F8E2   0283 032C
        MOVR    R3,     R1                      ; F8E4   0099
        SDBD                                    ; F8E5   0001
        SUBI    #$0900, R3                      ; F8E6   033B 0000 0009
        BPL     L_F933                          ; F8E9   0203 0048

        SUBI    #$0300, R1                      ; F8EB   0339 0300
        BMI     L_F933                          ; F8ED   020B 0044

        MVII    #$0160, R1                      ; F8EF   02B9 0160
        ADDR    R2,     R1                      ; F8F1   00D1
        MVI@    R1,     R1                      ; F8F2   0289
        ANDI    #$0012, R1                      ; F8F3   03B9 0012
        BNEQ    L_F933                          ; F8F5   020C 003C

        JSR     R5,     L_DBA1                  ; F8F7   0004 01D8 03A1

        MVI     G_0354, R3                      ; F8FA   0283 0354
        SWAP    R3,     1                       ; F8FC   0043
        ANDI    #$00FF, R3                      ; F8FD   03BB 00FF

        JSR     R5,     L_D171                  ; F8FF   0004 01D0 0171

        BLE     L_F907                          ; F902   0206 0003

        XORR    R1,     R3                      ; F904   01CB
        XORR    R3,     R1                      ; F905   01D9
        XORR    R1,     R3                      ; F906   01CB
L_F907:
        SUBR    R3,     R1                      ; F907   0119
        DECR    R1                              ; F908   0011
        BMI     L_F933                          ; F909   020B 0028

        SUBI    #$0007, R1                      ; F90B   0339 0007
        BPL     L_F933                          ; F90D   0203 0024

        MVI     G_034C, R1                      ; F90F   0281 034C
        SWAP    R1,     1                       ; F911   0041
        ANDI    #$00FF, R1                      ; F912   03B9 00FF
        SUBR    R1,     R0                      ; F914   0108
        BPL     L_F918                          ; F915   0203 0001

        NEGR    R0                              ; F917   0020
L_F918:
        CMPI    #$0001, R0                      ; F918   0378 0001
        BGT     L_F933                          ; F91A   020E 0017

        CLRR    R0                              ; F91C   01C0
        MVO     R0,     G_0344                  ; F91D   0240 0344
        MVII    #$0004, R0                      ; F91F   02B8 0004

        JSR     R5,     L_D171                  ; F921   0004 01D0 0171

        BLE     L_F927                          ; F924   0206 0001

        NEGR    R0                              ; F926   0020
L_F927:
        MVO     R0,     G_0334                  ; F927   0240 0334
        MVO     R0,     G_033C                  ; F929   0240 033C
        MVI     G_01C3, R0                      ; F92B   0280 01C3
        TSTR    R0                              ; F92D   0080
        BEQ     L_F934                          ; F92E   0204 0004

        DECR    R0                              ; F930   0010
        BEQ     L_F949                          ; F931   0204 0016
L_F933:
        PULR    R7                              ; F933   02B7

L_F934:
        PSHR    R2                              ; F934   0272

        JSR     R5,     L_D78F                  ; F935   0004 01D4 038F

        PULR    R2                              ; F938   02B2
        BNC     L_F933                          ; F939   0229 0007

L_F93B:
        MVI     G_01C2, R0                      ; F93B   0280 01C2
        MVO     R0,     G_01A9                  ; F93D   0240 01A9
        MVII    #$0006, R0                      ; F93F   02B8 0006

        JSR     R5,     L_D742                  ; F941   0004 01D4 0342
        JSR     R5,     L_D84F                  ; F944   0004 01D8 004F

        B       L_F933                          ; F947   0220 0015

L_F949:
        MVI     G_01C1, R0                      ; F949   0280 01C1
        TSTR    R0                              ; F94B   0080
        BEQ     L_F933                          ; F94C   0224 001A
        B       L_F93B                          ; F94E   0220 0014

        PSHR    R5                              ; F950   0275
        PSHR    R0                              ; F951   0270
        MVI     G_01E0, R0                      ; F952   0280 01E0
        SLR     R0,     2                       ; F954   0064
        ANDI    #$0003, R0                      ; F955   03B8 0003
        MVII    #$0164, R1                      ; F957   02B9 0164
        ADDR    R2,     R1                      ; F959   00D1
        MVI@    R1,     R1                      ; F95A   0289
        CMPI    #$0002, R1                      ; F95B   0379 0002
        BPL     L_F962                          ; F95D   0203 0003

L_F95F:
        MOVR    R0,     R1                      ; F95F   0081
        PULR    R0                              ; F960   02B0
        PULR    R7                              ; F961   02B7

L_F962:
        ADDI    #$0004, R0                      ; F962   02F8 0004
        B       L_F95F                          ; F964   0220 0006

        DECLE   $002C,  $0061,  $0380,  $0071   ; F966   002C 0061 0380 0071
        DECLE   $0380,  $0001,  $03A0,  $0011   ; F96A   0380 0001 03A0 0011
        DECLE   $03A0,  $0021,  $03A0,  $0031   ; F96E   03A0 0021 03A0 0031
        DECLE   $01A0,  $002C,  $0061,  $0380   ; F972   01A0 002C 0061 0380
        DECLE   $0071,  $0300,  $0039,  $03A0   ; F976   0071 0300 0039 03A0
        DECLE   $0049,  $03A0,  $0059,  $0120   ; F97A   0049 03A0 0059 0120
        DECLE   $0025,  $03A0,  $0035,  $00A0   ; F97E   0025 03A0 0035 00A0
        DECLE   $002C,  $0061,  $0380,  $0071   ; F982   002C 0061 0380 0071
        DECLE   $0300,  $005F,  $03A0,  $006F   ; F986   0300 005F 03A0 006F
        DECLE   $03A0,  $007F,  $0120,  $0025   ; F98A   03A0 007F 0120 0025
        DECLE   $03A0,  $0035                   ; F98E   03A0 0035

        MOVR    R4,     R0                      ; F990   00A0
        PSHR    R5                              ; F991   0275
        SDBD                                    ; F992   0001
        MVII    #$EC87, R0                      ; F993   02B8 0087 00EC
        MVO     R0,     G_02F0                  ; F996   0240 02F0
        MVI     G_019E, R0                      ; F998   0280 019E
        SDBD                                    ; F99A   0001
        MVII    #$E966, R5                      ; F99B   02BD 0066 00E9
        TSTR    R0                              ; F99E   0080
        BEQ     L_F9AD                          ; F99F   0204 000C

        SDBD                                    ; F9A1   0001
        MVII    #$E973, R5                      ; F9A2   02BD 0073 00E9
        SUBI    #$0002, R0                      ; F9A5   0338 0002
        BEQ     L_F9AD                          ; F9A7   0204 0004

        SDBD                                    ; F9A9   0001
        MVII    #$E982, R5                      ; F9AA   02BD 0082 00E9

L_F9AD:
        JSRD    R4,     X_NEW_GRAM_INIT         ; F9AD   0004 001E 0335

        SDBD                                    ; F9B0   0001
        MVII    #$E9F3, R4                      ; F9B1   02BC 00F3 00E9
        MVII    #$0200, R5                      ; F9B4   02BD 0200
L_F9B6:
        SDBD                                    ; F9B6   0001
        MVI@    R4,     R0                      ; F9B7   02A0
        MVO@    R0,     R5                      ; F9B8   0268
        CMPI    #$02C8, R5                      ; F9B9   037D 02C8
        BNEQ    L_F9B6                          ; F9BB   022C 0006

        MVI     G_019E, R1                      ; F9BD   0281 019E
        TSTR    R1                              ; F9BF   0089
        BEQ     L_F9CE                          ; F9C0   0204 000C

        SDBD                                    ; F9C2   0001
        MVII    #$EBD3, R4                      ; F9C3   02BC 00D3 00EB
        SUBI    #$0002, R1                      ; F9C6   0339 0002
        BEQ     L_F9CE                          ; F9C8   0204 0004

        SDBD                                    ; F9CA   0001
        MVII    #$EC23, R4                      ; F9CB   02BC 0023 00EC
L_F9CE:
        SDBD                                    ; F9CE   0001
        MVI@    R4,     R0                      ; F9CF   02A0
        MVO@    R0,     R5                      ; F9D0   0268
        CMPI    #$02F0, R5                      ; F9D1   037D 02F0
        BNEQ    L_F9CE                          ; F9D3   022C 0006

        CLRR    R0                              ; F9D5   01C0
        CLRR    R1                              ; F9D6   01C9
L_F9D7:
        MVO@    R0,     R1                      ; F9D7   0248
        INCR    R1                              ; F9D8   0009
        CMPI    #$0008, R1                      ; F9D9   0379 0008
        BNEQ    L_F9D7                          ; F9DB   022C 0005

        MVII    #$0001, R0                      ; F9DD   02B8 0001
        MVO     R0,     G_01A6                  ; F9DF   0240 01A6
        MVI     G_01A4, R0                      ; F9E1   0280 01A4
        MVI     G_01A5, R1                      ; F9E3   0281 01A5
        MVO     R0,     .ISRVEC.0               ; F9E5   0240 0100
        MVO     R1,     .ISRVEC.1               ; F9E7   0241 0101
        MVII    #$0021, R1                      ; F9E9   02B9 0021
        MVO@    R0,     R1                      ; F9EB   0248
        DECR    R1                              ; F9EC   0011
        MVO@    R0,     R1                      ; F9ED   0248
        PULR    R5                              ; F9EE   02B5
        EIS                                     ; F9EF   0002
        J       X_PLAY_NOTE                     ; F9F0   0004 0318 02BD

        DECLE   $0048,  $003A,  $0048,  $003A   ; F9F3   0048 003A 0048 003A
        DECLE   $00A4,  $003B,  $0048,  $003A   ; F9F7   00A4 003B 0048 003A
        DECLE   $0048,  $003A,  $00AC,  $003B   ; F9FB   0048 003A 00AC 003B
        DECLE   $0048,  $003A,  $0048,  $003A   ; F9FF   0048 003A 0048 003A
        DECLE   $00AC,  $003B,  $0048,  $003A   ; FA03   00AC 003B 0048 003A
        DECLE   $0048,  $003A,  $00A4,  $003B   ; FA07   0048 003A 00A4 003B
        DECLE   $0048,  $003A,  $0048,  $003A   ; FA0B   0048 003A 0048 003A
        DECLE   $00AC,  $003B,  $0048,  $003A   ; FA0F   00AC 003B 0048 003A
        DECLE   $0048,  $003A,  $00A4,  $003B   ; FA13   0048 003A 00A4 003B
        DECLE   $0048,  $003A,  $0048,  $003A   ; FA17   0048 003A 0048 003A
        DECLE   $0048,  $003A,  $0044,  $003B   ; FA1B   0048 003A 0044 003B
        DECLE   $005C,  $003B,  $0044,  $003B   ; FA1F   005C 003B 0044 003B
        DECLE   $0044,  $003B,  $005C,  $003B   ; FA23   0044 003B 005C 003B
        DECLE   $0044,  $003B,  $0044,  $003B   ; FA27   0044 003B 0044 003B
        DECLE   $005C,  $003B,  $0044,  $003B   ; FA2B   005C 003B 0044 003B
        DECLE   $0044,  $003B,  $005C,  $003B   ; FA2F   0044 003B 005C 003B
        DECLE   $0044,  $003B,  $0044,  $003B   ; FA33   0044 003B 0044 003B
        DECLE   $005C,  $003B,  $0044,  $003B   ; FA37   005C 003B 0044 003B
        DECLE   $0044,  $003B,  $005C,  $003B   ; FA3B   0044 003B 005C 003B
        DECLE   $0044,  $003B,  $0048,  $003A   ; FA3F   0044 003B 0048 003A
        DECLE   $0048,  $003A,  $0000,  $0020   ; FA43   0048 003A 0000 0020
        DECLE   $0007,  $0000,  $0000,  $0020   ; FA47   0007 0000 0000 0020
        DECLE   $0007,  $0000,  $0000,  $0020   ; FA4B   0007 0000 0000 0020
        DECLE   $0007,  $0000,  $0000,  $0020   ; FA4F   0007 0000 0000 0020
        DECLE   $0007,  $0000,  $0000,  $0020   ; FA53   0007 0000 0000 0020
        DECLE   $0041,  $0028,  $0041,  $0028   ; FA57   0041 0028 0041 0028
        DECLE   $0000,  $0020,  $0007,  $0000   ; FA5B   0000 0020 0007 0000
        DECLE   $0000,  $0020,  $0000,  $0020   ; FA5F   0000 0020 0000 0020
        DECLE   $0007,  $0000,  $0000,  $0020   ; FA63   0007 0000 0000 0020
        DECLE   $0000,  $0020,  $0048,  $003A   ; FA67   0000 0020 0048 003A
        DECLE   $0048,  $003A,  $0000           ; FA6B   0048 003A 0000

        NEGR    R0                              ; FA6E   0020
        SETC                                    ; FA6F   0007
        ADCR    R0                              ; FA70   0028
        INCR    R7                              ; FA71   000F

        ADCR    R0                              ; FA72   0028
L_FA73:
        DECR    R7                              ; FA73   0017

        DECLE   $0028,  $001F,  $0028,  $0027   ; FA74   0028 001F 0028 0027
        DECLE   $0028,  $002F,  $0028,  $0037   ; FA78   0028 002F 0028 0037
        DECLE   $0028,  $003F,  $0028,  $0000   ; FA7C   0028 003F 0028 0000
        DECLE   $0020,  $0000,  $0020,  $002F   ; FA80   0020 0000 0020 002F
        DECLE   $0028,  $0037,  $0028,  $003F   ; FA84   0028 0037 0028 003F
        DECLE   $0028,  $0057,  $0028,  $005F   ; FA88   0028 0057 0028 005F
        DECLE   $0028,  $0067,  $0028,  $006F   ; FA8C   0028 0067 0028 006F
        DECLE   $0028,  $0048,  $003A,  $0048   ; FA90   0028 0048 003A 0048
        DECLE   $003A,  $0000,  $0020,  $0007   ; FA94   003A 0000 0020 0007
        DECLE   $0000,  $0000,  $0020,  $0007   ; FA98   0000 0000 0020 0007
        DECLE   $0000,  $0000,  $0020,  $0007   ; FA9C   0000 0000 0020 0007
        DECLE   $0000,  $0000,  $0020,  $0007   ; FAA0   0000 0000 0020 0007
        DECLE   $0000,  $0000,  $0020,  $0012   ; FAA4   0000 0000 0020 0012
        DECLE   $0009,  $0012,  $0009,  $0000   ; FAA8   0009 0012 0009 0000
        DECLE   $0020,  $0007,  $0000,  $0000   ; FAAC   0020 0007 0000 0000
        DECLE   $0020,  $0077,  $0028,  $0007   ; FAB0   0020 0077 0028 0007
        DECLE   $0000,  $0000,  $0020,  $0000   ; FAB4   0000 0000 0020 0000
        DECLE   $0020,  $0048,  $003A,  $0048   ; FAB8   0020 0048 003A 0048
        DECLE   $003A,  $0000,  $0020,  $0000   ; FABC   003A 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FAC0   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FAC4   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FAC8   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FACC   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FAD0   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FAD4   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FAD8   0020 0000 0020 0000
        DECLE   $0020,  $0000,  $0020,  $0000   ; FADC   0020 0000 0020 0000
        DECLE   $0020,  $0048,  $003A,  $0048   ; FAE0   0020 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FAE4   003A 0048 003A 0048
        DECLE   $003A,  $0054,  $003B,  $004C   ; FAE8   003A 0054 003B 004C
        DECLE   $003B,  $0048,  $003A,  $0048   ; FAEC   003B 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FAF0   003A 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FAF4   003A 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FAF8   003A 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FAFC   003A 0048 003A 0048
        DECLE   $003A,  $0054,  $003B,  $004C   ; FB00   003A 0054 003B 004C
        DECLE   $003B,  $0048,  $003A,  $0048   ; FB04   003B 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FB08   003A 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FB0C   003A 0048 003A 0048
        DECLE   $003A,  $00EB,  $003B,  $00BB   ; FB10   003A 00EB 003B 00BB
        DECLE   $003B,  $00CB,  $003B,  $00BB   ; FB14   003B 00CB 003B 00BB
        DECLE   $003B,  $00D3,  $003B,  $00EB   ; FB18   003B 00D3 003B 00EB
        DECLE   $003B,  $00CB,  $003B,  $00D3   ; FB1C   003B 00CB 003B 00D3
        DECLE   $003B,  $00CB,  $003B,  $00D3   ; FB20   003B 00CB 003B 00D3
        DECLE   $003B,  $00EB,  $003B,  $00D3   ; FB24   003B 00EB 003B 00D3
        DECLE   $003B,  $00EB,  $003B,  $00BB   ; FB28   003B 00EB 003B 00BB
        DECLE   $003B,  $0048,  $003A,  $0048   ; FB2C   003B 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FB30   003A 0048 003A 0048
        DECLE   $003A,  $0048,  $003A,  $00CB   ; FB34   003A 0048 003A 00CB
        DECLE   $003B,  $00E3,  $0019,  $00BB   ; FB38   003B 00E3 0019 00BB
        DECLE   $0019,  $00C3,  $0019,  $00D3   ; FB3C   0019 00C3 0019 00D3
        DECLE   $0019,  $00C3,  $0019,  $00CB   ; FB40   0019 00C3 0019 00CB
        DECLE   $0019,  $00BB,  $0019,  $00BB   ; FB44   0019 00BB 0019 00BB
        DECLE   $0019,  $00DB,  $0019,  $00CB   ; FB48   0019 00DB 0019 00CB
        DECLE   $0019,  $00BB,  $0019,  $00CB   ; FB4C   0019 00BB 0019 00CB
        DECLE   $0019,  $00C3,  $0019,  $00E3   ; FB50   0019 00C3 0019 00E3
        DECLE   $0019,  $00D3,  $003B,  $0048   ; FB54   0019 00D3 003B 0048
        DECLE   $003A,  $0048,  $003A,  $0048   ; FB58   003A 0048 003A 0048
        DECLE   $003A,  $00BB,  $003B,  $00C3   ; FB5C   003A 00BB 003B 00C3
        DECLE   $0019,  $00EB,  $0019,  $00BB   ; FB60   0019 00EB 0019 00BB
        DECLE   $0019,  $00BB,  $0019,  $00DB   ; FB64   0019 00BB 0019 00DB
        DECLE   $0019,  $00EB,  $0019,  $00C3   ; FB68   0019 00EB 0019 00C3
        DECLE   $0019,  $00CB,  $0019,  $00E3   ; FB6C   0019 00CB 0019 00E3
        DECLE   $0019,  $00D3,  $0019,  $00CB   ; FB70   0019 00D3 0019 00CB
        DECLE   $0019,  $00E3,  $0019,  $00BB   ; FB74   0019 00E3 0019 00BB
        DECLE   $0019,  $00BB,  $0019,  $00EB   ; FB78   0019 00BB 0019 00EB
        DECLE   $0019,  $00DB,  $0019,  $00CB   ; FB7C   0019 00DB 0019 00CB
        DECLE   $003B,  $0048,  $003A,  $0048   ; FB80   003B 0048 003A 0048
        DECLE   $003A,  $00B8,  $002A,  $00D8   ; FB84   003A 00B8 002A 00D8
        DECLE   $002A,  $00C0,  $002A,  $00E0   ; FB88   002A 00C0 002A 00E0
        DECLE   $002A,  $0045,  $0028,  $0045   ; FB8C   002A 0045 0028 0045
        DECLE   $0028,  $00F0,  $002A,  $00F8   ; FB90   0028 00F0 002A 00F8
        DECLE   $002A,  $0045,  $0028,  $0000   ; FB94   002A 0045 0028 0000
        DECLE   $002B,  $0045,  $0028,  $0045   ; FB98   002B 0045 0028 0045
        DECLE   $0028,  $0045,  $0028,  $0037   ; FB9C   0028 0045 0028 0037
        DECLE   $002B,  $0037                   ; FBA0   002B 0037

        ADCR    R3                              ; FBA2   002B
        ADCR    R7                              ; FBA3   002F

        ADCR    R3                              ; FBA4   002B
L_FBA5:
        SWAP    R1,     2                       ; FBA5   0045
        DECLE   $0028,  $0045,  $0028,  $0048   ; FBA6   0028 0045 0028 0048
        DECLE   $003A,  $0048,  $003A,  $00D0   ; FBAA   003A 0048 003A 00D0
        DECLE   $002A,  $00C8,  $002A,  $0078   ; FBAE   002A 00C8 002A 0078
        DECLE   $002A,  $0080,  $002A,  $0088   ; FBB2   002A 0080 002A 0088
        DECLE   $002A,  $0090,  $002A,  $0098   ; FBB6   002A 0090 002A 0098
        DECLE   $002A,  $00A0,  $002A,  $00A8   ; FBBA   002A 00A0 002A 00A8
        DECLE   $002A,  $00B0,  $002A,  $00E8   ; FBBE   002A 00B0 002A 00E8
        DECLE   $002A,  $0008,  $002B,  $0045   ; FBC2   002A 0008 002B 0045
        DECLE   $0028,  $0045,  $0028,  $0045   ; FBC6   0028 0045 0028 0045
        DECLE   $0028,  $0027,  $002B,  $001F   ; FBCA   0028 0027 002B 001F
        DECLE   $002B,  $0045,  $0028,  $0048   ; FBCE   002B 0045 0028 0048
        DECLE   $003A,  $0048,  $003A,  $00BF   ; FBD2   003A 0048 003A 00BF

        ADCR    R2                              ; FBD6   002A
        SWAP    R1,     2                       ; FBD7   0045
        ADCR    R0                              ; FBD8   0028
        ADDR    R3,     R7                      ; FBD9   00DF

        ADCR    R2                              ; FBDA   002A
        SWAP    R1,     2                       ; FBDB   0045
        ADCR    R2                              ; FBDC   002A
        ADDR    R0,     R7                      ; FBDD   00C7

        DECLE   $002A,  $0045,  $0028,  $00F7   ; FBDE   002A 0045 0028 00F7
        DECLE   $002A,  $0045,  $0028,  $0045   ; FBE2   002A 0045 0028 0045
        DECLE   $0028,  $0045,  $0028,  $0045   ; FBE6   0028 0045 0028 0045
        DECLE   $0028,  $0045,  $0028,  $0045   ; FBEA   0028 0045 0028 0045
        DECLE   $0028,  $0037,  $002B,  $0037   ; FBEE   0028 0037 002B 0037

        ADCR    R3                              ; FBF2   002B
        ADCR    R7                              ; FBF3   002F

        ADCR    R3                              ; FBF4   002B
L_FBF5:
        SWAP    R1,     2                       ; FBF5   0045
        ADCR    R0                              ; FBF6   0028
        SWAP    R1,     2                       ; FBF7   0045
        ADCR    R0                              ; FBF8   0028
        SLL     R0,     1                       ; FBF9   0048
        RSWD    R2                              ; FBFA   003A
        SLL     R0,     1                       ; FBFB   0048
        RSWD    R2                              ; FBFC   003A
        ADDR    R2,     R7                      ; FBFD   00D7

        ADCR    R2                              ; FBFE   002A
        ADDR    R1,     R7                      ; FBFF   00CF

        ADCR    R2                              ; FC00   002A
        SARC    R3,     2                       ; FC01   007F
        ADCR    R2                              ; FC02   002A
        MOVR    R0,     R7                      ; FC03   0087

        ADCR    R2                              ; FC04   002A
        MOVR    R1,     R7                      ; FC05   008F

        ADCR    R2                              ; FC06   002A
        SWAP    R1,     2                       ; FC07   0045
        ADCR    R0                              ; FC08   0028
        MOVR    R3,     R7                      ; FC09   009F

        ADCR    R2                              ; FC0A   002A
        MOVR    R4,     R7                      ; FC0B   00A7

        ADCR    R2                              ; FC0C   002A
        MOVR    R5,     R7                      ; FC0D   00AF

        DECLE   $002A,  $00B7                   ; FC0E   002A 00B7

        ADCR    R2                              ; FC10   002A
        INCR    R7                              ; FC11   000F

        ADCR    R3                              ; FC12   002B
L_FC13:
        SWAP    R1,     2                       ; FC13   0045
        DECLE   $0028,  $0045,  $0028,  $0045   ; FC14   0028 0045 0028 0045
        DECLE   $0028,  $0045,  $0028,  $0027   ; FC18   0028 0045 0028 0027
        DECLE   $002B,  $001F,  $002B,  $0045   ; FC1C   002B 001F 002B 0045
        DECLE   $0028,  $0048,  $003A,  $0048   ; FC20   0028 0048 003A 0048
        DECLE   $003A,  $00BE,  $002A,  $0045   ; FC24   003A 00BE 002A 0045
        DECLE   $0028,  $00DE,  $002A,  $00C6   ; FC28   0028 00DE 002A 00C6
        DECLE   $002A,  $00E6,  $002A,  $00EE   ; FC2C   002A 00E6 002A 00EE
        DECLE   $002A,  $00F6,  $002A,  $00FE   ; FC30   002A 00F6 002A 00FE
        DECLE   $002A,  $0006,  $002B,  $000E   ; FC34   002A 0006 002B 000E
        DECLE   $002B,  $0045,  $0028,  $0045   ; FC38   002B 0045 0028 0045
        DECLE   $0028,  $0045,  $0028,  $0037   ; FC3C   0028 0045 0028 0037
        DECLE   $002B,  $0037                   ; FC40   002B 0037

        ADCR    R3                              ; FC42   002B
        ADCR    R7                              ; FC43   002F

        ADCR    R3                              ; FC44   002B
L_FC45:
        SWAP    R1,     2                       ; FC45   0045
        DECLE   $0028,  $0045,  $0028,  $0048   ; FC46   0028 0045 0028 0048
        DECLE   $003A,  $0048,  $003A,  $00D6   ; FC4A   003A 0048 003A 00D6
        DECLE   $002A,  $00CE,  $002A,  $007E   ; FC4E   002A 00CE 002A 007E
        DECLE   $002A,  $0086,  $002A,  $008E   ; FC52   002A 0086 002A 008E
        DECLE   $002A,  $0096,  $002A,  $009E   ; FC56   002A 0096 002A 009E
        DECLE   $002A,  $00A6,  $002A,  $00AE   ; FC5A   002A 00A6 002A 00AE
        DECLE   $002A,  $00B6,  $002A,  $0045   ; FC5E   002A 00B6 002A 0045
        DECLE   $0028,  $0045,  $0028,  $0045   ; FC62   0028 0045 0028 0045
        DECLE   $0028,  $0045,  $0028,  $0045   ; FC66   0028 0045 0028 0045
        DECLE   $0028,  $0027,  $002B,  $001F   ; FC6A   0028 0027 002B 001F

        ADCR    R3                              ; FC6E   002B
        SWAP    R1,     2                       ; FC6F   0045
        ADCR    R0                              ; FC70   0028
        RLC     R0,     2                       ; FC71   0054
        RSWD    R3                              ; FC72   003B
        ADDR    R0,     R7                      ; FC73   00C7

        DECLE   $00EC,  $001C,  $0050,  $0000   ; FC74   00EC 001C 0050 0000
        DECLE   $0052,  $00BD,  $005E,  $0066   ; FC78   0052 00BD 005E 0066
        DECLE   $00E9,  $0048,  $0050,  $0080   ; FC7C   00E9 0048 0050 0080
        DECLE   $0000,  $0001,  $0003,  $0004   ; FC80   0000 0001 0003 0004
        DECLE   $0005,  $0006,  $0005,  $01F0   ; FC84   0005 0006 0005 01F0
        DECLE   $01E0,  $01D0,  $01C0,  $01B0   ; FC88   01E0 01D0 01C0 01B0
        DECLE   $01A0,  $0190,  $0180,  $0000   ; FC8C   01A0 0190 0180 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; FC90   0000 0000 0000 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC94   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0008,  $0004   ; FC98   0000 0000 0008 0004
        DECLE   $0000,  $0000,  $0000,  $0000   ; FC9C   0000 0000 0000 0000
        DECLE   $0000,  $0006,  $0014,  $0000   ; FCA0   0000 0006 0014 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCA4   0000 0000 0000 0000
        DECLE   $0006,  $0020,  $0000,  $0000   ; FCA8   0006 0020 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0008   ; FCAC   0000 0000 0000 0008
        DECLE   $002C,  $0000,  $0000,  $0000   ; FCB0   002C 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $003C   ; FCB4   0000 0000 0004 003C
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCB8   0000 0000 0000 0000
        DECLE   $0000,  $0002,  $0044,  $0000   ; FCBC   0000 0002 0044 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FCC0   0000 0000 0000 0000
        DECLE   $0001,  $0048,  $0000,  $0001   ; FCC4   0001 0048 0000 0001
        DECLE   $0031,  $0032,  $0004,  $0038   ; FCC8   0031 0032 0004 0038
        DECLE   $0070,  $00B0,  $0080,  $00B0   ; FCCC   0070 00B0 0080 00B0
        DECLE   $0028,  $0028,  $0048,  $0048   ; FCD0   0028 0028 0048 0048
        DECLE   $0050,  $0050,  $0058,  $0002   ; FCD4   0050 0050 0058 0002
        DECLE   $0032,  $0032,  $0004,  $0038   ; FCD8   0032 0032 0004 0038
        DECLE   $0070,  $00B0,  $0080,  $00B0   ; FCDC   0070 00B0 0080 00B0
        DECLE   $0028,  $0028,  $0048,  $0048   ; FCE0   0028 0028 0048 0048
        DECLE   $0050,  $0050,  $0058,  $0080   ; FCE4   0050 0050 0058 0080
        DECLE   $0098,  $0098,  $0018,  $0003   ; FCE8   0098 0098 0018 0003
        DECLE   $003B,  $0033,  $0030,  $0082   ; FCEC   003B 0033 0030 0082
        DECLE   $00D8,  $0090,  $0019,  $0001   ; FCF0   00D8 0090 0019 0001
        DECLE   $0001,  $0030,  $0030,  $0080   ; FCF4   0001 0030 0030 0080
        DECLE   $0098,  $0098,  $0018,  $0003   ; FCF8   0098 0098 0018 0003
        DECLE   $0057,  $0031,  $0030,  $00C1   ; FCFC   0057 0031 0030 00C1
        DECLE   $008C,  $009C,  $000D,  $0001   ; FD00   008C 009C 000D 0001

        SWAP    R3,     1                       ; FD04   0043
        GSWD    R0                              ; FD05   0030
        GSWD    R0                              ; FD06   0030
        TSTR    R0                              ; FD07   0080
        MOVR    R3,     R0                      ; FD08   0098
        MOVR    R3,     R0                      ; FD09   0098
        COMR    R0                              ; FD0A   0018
        DIS                                     ; FD0B   0003
        MOVR    R2,     R7                      ; FD0C   0097

        DECLE   $0031,  $0030,  $00C2,  $008C   ; FD0D   0031 0030 00C2 008C
        DECLE   $008C,  $000D,  $0001,  $0045   ; FD11   008C 000D 0001 0045
        DECLE   $0030,  $0030,  $0080,  $0098   ; FD15   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $005B   ; FD19   0098 0018 0003 005B
        DECLE   $0031,  $0030,  $00C4,  $008C   ; FD1D   0031 0030 00C4 008C
        DECLE   $00CC,  $000D,  $0001,  $0085   ; FD21   00CC 000D 0001 0085
        DECLE   $0030,  $0030,  $0080,  $0098   ; FD25   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $00BB   ; FD29   0098 0018 0003 00BB
        DECLE   $0031,  $0030,  $00C2,  $00D8   ; FD2D   0031 0030 00C2 00D8
        DECLE   $00D8,  $0019,  $0001,  $0043   ; FD31   00D8 0019 0001 0043
        DECLE   $0030,  $0030,  $0080,  $0098   ; FD35   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $0033   ; FD39   0098 0018 0003 0033
        DECLE   $0031,  $0030,  $00C1,  $00D8   ; FD3D   0031 0030 00C1 00D8
        DECLE   $00BC,  $0019,  $0001,  $0021   ; FD41   00BC 0019 0001 0021
        DECLE   $0030,  $0030,  $0080,  $0098   ; FD45   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $00BB   ; FD49   0098 0018 0003 00BB
        DECLE   $0031,  $0030,  $0080,  $00D8   ; FD4D   0031 0030 0080 00D8
        DECLE   $00DA,  $0019,  $0001,  $0030   ; FD51   00DA 0019 0001 0030
        DECLE   $0030,  $0030,  $0080,  $0098   ; FD55   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $003B   ; FD59   0098 0018 0003 003B
        DECLE   $0071,  $0030,  $00C1,  $00D8   ; FD5D   0071 0030 00C1 00D8
        DECLE   $00DC,  $0019,  $0001,  $0010   ; FD61   00DC 0019 0001 0010
        DECLE   $0030,  $0030,  $000C,  $0029   ; FD65   0030 0030 000C 0029
        DECLE   $000C,  $00D0,  $00C0,  $00DB   ; FD69   000C 00D0 00C0 00DB
        DECLE   $001B,  $003B,  $0000,  $001C   ; FD6D   001B 003B 0000 001C
        DECLE   $0000,  $0018,  $00D8,  $00DA   ; FD71   0000 0018 00D8 00DA
        DECLE   $0080,  $0003,  $000C,  $0048   ; FD75   0080 0003 000C 0048
        DECLE   $000C,  $00E0,  $00C0,  $00DB   ; FD79   000C 00E0 00C0 00DB
        DECLE   $001B,  $005B,  $0000,  $00A6   ; FD7D   001B 005B 0000 00A6
        DECLE   $0000,  $0018,  $00D8,  $00D9   ; FD81   0000 0018 00D8 00D9
        DECLE   $00C0,  $0003,  $000C,  $0089   ; FD85   00C0 0003 000C 0089
        DECLE   $000C,  $0080,  $00D8,  $00DB   ; FD89   000C 0080 00D8 00DB
        DECLE   $001B,  $0083,  $0000,  $0043   ; FD8D   001B 0083 0000 0043
        DECLE   $0000,  $0018,  $00D8,  $00D8   ; FD91   0000 0018 00D8 00D8
        DECLE   $00C0,  $0003,  $000C,  $004A   ; FD95   00C0 0003 000C 004A
        DECLE   $000C,  $00C0,  $00D8,  $00DB   ; FD99   000C 00C0 00D8 00DB
        DECLE   $001B,  $0043,  $0000,  $0025   ; FD9D   001B 0043 0000 0025
        DECLE   $0000,  $0018,  $0098,  $00D9   ; FDA1   0000 0018 0098 00D9
        DECLE   $00C0,  $0003,  $000C,  $002C   ; FDA5   00C0 0003 000C 002C
        DECLE   $000C,  $00C0,  $00D8,  $00DB   ; FDA9   000C 00C0 00D8 00DB
        DECLE   $001B,  $0023,  $0000,  $001A   ; FDAD   001B 0023 0000 001A
        DECLE   $0000,  $0018,  $0098,  $009A   ; FDB1   0000 0018 0098 009A
        DECLE   $00C0,  $0003,  $000C,  $001E   ; FDB5   00C0 0003 000C 001E
        DECLE   $000C,  $00C0,  $00D8,  $00DB   ; FDB9   000C 00C0 00D8 00DB
        DECLE   $001B,  $0013,  $0000,  $001A   ; FDBD   001B 0013 0000 001A
        DECLE   $0000,  $0018,  $0098,  $009A   ; FDC1   0000 0018 0098 009A
        DECLE   $00C0,  $0003,  $000C,  $0029   ; FDC5   00C0 0003 000C 0029
        DECLE   $000C,  $00D0,  $00C0,  $00DB   ; FDC9   000C 00D0 00C0 00DB
        DECLE   $001B,  $003B,  $0000,  $001C   ; FDCD   001B 003B 0000 001C
        DECLE   $0000,  $0018,  $00D8,  $00DA   ; FDD1   0000 0018 00D8 00DA
        DECLE   $0080,  $0003,  $000C,  $0048   ; FDD5   0080 0003 000C 0048
        DECLE   $000C,  $00E0,  $00C0,  $00DB   ; FDD9   000C 00E0 00C0 00DB
        DECLE   $001B,  $005B,  $0000,  $00A6   ; FDDD   001B 005B 0000 00A6
        DECLE   $0000,  $0018,  $00D8,  $00D9   ; FDE1   0000 0018 00D8 00D9
        DECLE   $00C0,  $0003,  $000C,  $0089   ; FDE5   00C0 0003 000C 0089
        DECLE   $000C,  $0080,  $00D8,  $00DB   ; FDE9   000C 0080 00D8 00DB
        DECLE   $001B,  $0083,  $0000,  $0043   ; FDED   001B 0083 0000 0043
        DECLE   $0000,  $0018,  $00D8,  $00D8   ; FDF1   0000 0018 00D8 00D8
        DECLE   $00C0,  $0003,  $000C,  $004A   ; FDF5   00C0 0003 000C 004A
        DECLE   $000C,  $00C0,  $00D8,  $00DB   ; FDF9   000C 00C0 00D8 00DB
        DECLE   $001B,  $0043,  $0000,  $0025   ; FDFD   001B 0043 0000 0025
        DECLE   $0000,  $0018,  $0098,  $00D9   ; FE01   0000 0018 0098 00D9
        DECLE   $00C0,  $0003,  $000C,  $002C   ; FE05   00C0 0003 000C 002C
        DECLE   $000C,  $00C0,  $00D8,  $00DB   ; FE09   000C 00C0 00D8 00DB
        DECLE   $001B,  $0023,  $0000,  $001A   ; FE0D   001B 0023 0000 001A
        DECLE   $0000,  $0018,  $0098,  $009A   ; FE11   0000 0018 0098 009A
        DECLE   $00C0,  $0003,  $000C,  $001E   ; FE15   00C0 0003 000C 001E
        DECLE   $000C,  $00C0,  $00D8,  $00DB   ; FE19   000C 00C0 00D8 00DB
        DECLE   $001B,  $0013,  $0000,  $001A   ; FE1D   001B 0013 0000 001A
        DECLE   $0000,  $0018,  $0098,  $009A   ; FE21   0000 0018 0098 009A
        DECLE   $00C0,  $0003,  $0080,  $0098   ; FE25   00C0 0003 0080 0098
        DECLE   $0098,  $0018,  $0003,  $003B   ; FE29   0098 0018 0003 003B
        DECLE   $0033,  $0030,  $0082,  $00D8   ; FE2D   0033 0030 0082 00D8
        DECLE   $0090,  $0019,  $0001,  $0001   ; FE31   0090 0019 0001 0001
        DECLE   $0030,  $0030,  $0080,  $0098   ; FE35   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $0057   ; FE39   0098 0018 0003 0057
        DECLE   $0031,  $0030,  $00C1,  $008C   ; FE3D   0031 0030 00C1 008C
        DECLE   $001C,  $000D,  $0001           ; FE41   001C 000D 0001

        SWAP    R3,     1                       ; FE44   0043
        GSWD    R0                              ; FE45   0030
        GSWD    R0                              ; FE46   0030
        TSTR    R0                              ; FE47   0080
        MOVR    R3,     R0                      ; FE48   0098
        MOVR    R3,     R0                      ; FE49   0098
        COMR    R0                              ; FE4A   0018
        DIS                                     ; FE4B   0003
        MOVR    R2,     R7                      ; FE4C   0097

        DECLE   $0031,  $0030,  $00C2,  $008C   ; FE4D   0031 0030 00C2 008C
        DECLE   $008C,  $000D,  $0001,  $0045   ; FE51   008C 000D 0001 0045
        DECLE   $0030,  $0010,  $0080,  $0098   ; FE55   0030 0010 0080 0098
        DECLE   $0098,  $0018,  $0003,  $005B   ; FE59   0098 0018 0003 005B
        DECLE   $0031,  $0030,  $00C4,  $008C   ; FE5D   0031 0030 00C4 008C
        DECLE   $00CC,  $000D,  $0001,  $0085   ; FE61   00CC 000D 0001 0085
        DECLE   $0030,  $0030,  $0080,  $0098   ; FE65   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $00BB   ; FE69   0098 0018 0003 00BB
        DECLE   $0031,  $0030,  $00C2,  $00D8   ; FE6D   0031 0030 00C2 00D8
        DECLE   $00D8,  $0019,  $0001,  $0043   ; FE71   00D8 0019 0001 0043
        DECLE   $0030,  $0030,  $0080,  $0098   ; FE75   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $0033   ; FE79   0098 0018 0003 0033
        DECLE   $0031,  $0030,  $00C1,  $00D8   ; FE7D   0031 0030 00C1 00D8
        DECLE   $00BC,  $0019,  $0001,  $0021   ; FE81   00BC 0019 0001 0021
        DECLE   $0030,  $0030,  $0080,  $0098   ; FE85   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $00BB   ; FE89   0098 0018 0003 00BB
        DECLE   $0031,  $0030,  $0080,  $00D8   ; FE8D   0031 0030 0080 00D8
        DECLE   $00DA,  $0019,  $0001,  $0030   ; FE91   00DA 0019 0001 0030
        DECLE   $0030,  $0030,  $0080,  $0098   ; FE95   0030 0030 0080 0098
        DECLE   $0098,  $0018,  $0003,  $003B   ; FE99   0098 0018 0003 003B
        DECLE   $0071,  $0030,  $00C1,  $00D8   ; FE9D   0071 0030 00C1 00D8
        DECLE   $00DC,  $0019,  $0001,  $0010   ; FEA1   00DC 0019 0001 0010
        DECLE   $0030,  $0030,  $0000,  $0000   ; FEA5   0030 0030 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0070   ; FEA9   0000 0000 0040 0070
        DECLE   $007F,  $005C,  $0000,  $0000   ; FEAD   007F 005C 0000 0000
        DECLE   $0000,  $0000,  $005E,  $007F   ; FEB1   0000 0000 005E 007F
        DECLE   $0070,  $0040,  $0000,  $0000   ; FEB5   0070 0040 0000 0000
        DECLE   $0000,  $0000,  $0040,  $007E   ; FEB9   0000 0000 0040 007E
        DECLE   $007F,  $0040,  $0000,  $0000   ; FEBD   007F 0040 0000 0000
        DECLE   $0000,  $0007,  $005C,  $0078   ; FEC1   0000 0007 005C 0078
        DECLE   $0070,  $0040,  $0000,  $0000   ; FEC5   0070 0040 0000 0000
        DECLE   $0000,  $0000,  $005E,  $007F   ; FEC9   0000 0000 005E 007F
        DECLE   $0070,  $0040,  $0000,  $0000   ; FECD   0070 0040 0000 0000
        DECLE   $0000,  $0000,  $0040,  $0070   ; FED1   0000 0000 0040 0070
        DECLE   $007F,  $005C,  $0000,  $0000   ; FED5   007F 005C 0000 0000
        DECLE   $0000,  $0007,  $005C,  $0078   ; FED9   0000 0007 005C 0078
        DECLE   $0070,  $0040,  $0000,  $0000   ; FEDD   0070 0040 0000 0000
        DECLE   $0000,  $0000,  $0040,  $007E   ; FEE1   0000 0000 0040 007E
        DECLE   $007F,  $0040,  $0001,  $0031   ; FEE5   007F 0040 0001 0031
        DECLE   $0032,  $0004,  $0038,  $0070   ; FEE9   0032 0004 0038 0070
        DECLE   $00B0,  $0080,  $00B0,  $0028   ; FEED   00B0 0080 00B0 0028
        DECLE   $0028,  $0048,  $0048,  $0050   ; FEF1   0028 0048 0048 0050
        DECLE   $0050,  $0058,  $0002,  $0032   ; FEF5   0050 0058 0002 0032
        DECLE   $0032,  $0004,  $0038,  $0070   ; FEF9   0032 0004 0038 0070
        DECLE   $00B0,  $0080,  $00B0,  $0028   ; FEFD   00B0 0080 00B0 0028
        DECLE   $0028,  $0048,  $0048,  $0050   ; FF01   0028 0048 0048 0050
        DECLE   $0050,  $0058,  $0000,  $0000   ; FF05   0050 0058 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF09   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0004   ; FF0D   0000 0000 0000 0004
        DECLE   $0118,  $007B                   ; FF11   0118 007B
        STRING  "  "                            ; FF13   0020 0020
        DECLE   $0000                           ; FF15   0000

        MVII    #$0007, R3                      ; FF16   02BB 0007
        MVII    #$02A7, R4                      ; FF18   02BC 02A7

        JSR     R5,     X_PRINT_R5              ; FF1A   0004 0118 007B
        STRING  "TENNIS"                        ; FF1D  
        DECLE   $0000                           ; FF23   0000

        MVII    #$02D3, R1                      ; FF24   02B9 02D3
        MVII    #$02D4, R2                      ; FF26   02BA 02D4
        MVI@    R1,     R0                      ; FF28   0288
        MVO@    R0,     R2                      ; FF29   0250
        DECR    R1                              ; FF2A   0011
        DECR    R2                              ; FF2B   0012
        MVI@    R1,     R0                      ; FF2C   0288
        MVO@    R0,     R2                      ; FF2D   0250
        DECR    R1                              ; FF2E   0011
        DECR    R2                              ; FF2F   0012
        MVI@    R1,     R0                      ; FF30   0288
        MVO@    R0,     R2                      ; FF31   0250
        DECR    R1                              ; FF32   0011
        DECR    R2                              ; FF33   0012
        MVI@    R1,     R0                      ; FF34   0288
        MVO@    R0,     R2                      ; FF35   0250
        DECR    R1                              ; FF36   0011
        DECR    R2                              ; FF37   0012
        MVI@    R1,     R0                      ; FF38   0288
        MVO@    R0,     R2                      ; FF39   0250
        DECR    R1                              ; FF3A   0011
        DECR    R2                              ; FF3B   0012
        MVI@    R1,     R0                      ; FF3C   0288
        MVO@    R0,     R2                      ; FF3D   0250
        DECR    R1                              ; FF3E   0011
        DECR    R2                              ; FF3F   0012
        MVII    #$02C8, R4                      ; FF40   02BC 02C8

        JSR     R5,     X_PRINT_R5              ; FF42   0004 0118 007B
        STRING  "       "                       ; FF45  
        DECLE   $0000                           ; FF4C   0000

        MVII    #$02D5, R4                      ; FF4D   02BC 02D5

        JSR     R5,     X_PRINT_R5              ; FF4F   0004 0118 007B
        STRING  "      "                        ; FF52  
        DECLE   $0000                           ; FF58   0000

        PULR    R7                              ; FF59   02B7

        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF5E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF62   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF66   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF6E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF72   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF76   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF7E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF82   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF86   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF8E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF92   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF96   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9A   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FF9E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFA6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFAE   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB2   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFB6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBA   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; FFBE   0000 0000 0000 0000
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
        DECLE   $0000,  $0000                   ; FFFE   0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5056       <entry>
;;  $5072       <entry>
;;  $507E       $5076  
;;  $5082       <entry>
;;  $5090       $508A  
;;  $5096       <entry>
;;  $50A4       $509A  
;;  $50B1       $50A9  
;;  $50B4       <entry>
;;  $50B7       $50B9  
;;  $50CB       $50D1  
;;  $50E7       $50DD   $50E0   $5108   $510B  
;;  $50FE       $50EB  
;;  $5104       $50DA  
;;  $5111       $5102  
;;  $5113       $50E5  
;;  $5200       <entry>
;;  $5207       $520D  
;;  $5265       $5262  
;;  $5288       $5284  
;;  $52A4       $529E  
;;  $52B1       $52AE  
;;  $52BB       $524B   $6501  
;;  $52BC       $52C7  
;;  $52CA       $5236   $523D   $52CD  
;;  $52EE       $52EC  
;;  $5372       $5092   $6597   $65F9  
;;  $53A6       $53A2  
;;  $53AF       $53CF  
;;  $53CC       $53B4  
;;  $53D5       $53D5  
;;  $53DA       $54C5   $54D1   $5554  
;;  $53FC       $53F6  
;;  $5400       $54A2  
;;  $5419       $540D  
;;  $541B       $5421  
;;  $5434       $542B  
;;  $5451       $541D   $5445  
;;  $5452       $54AE  
;;  $5471       $5469  
;;  $5474       $546E  
;;  $5477       $5460   $5464  
;;  $54B1       $D3D7   $D3DE  
;;  $54BE       $54B8  
;;  $54D4       $54CD  
;;  $54D5       $D39D  
;;  $54E1       $54DE  
;;  $54EF       $54E3   $54EC  
;;  $54F7       $5503  
;;  $5506       $54FC   $67CC   $67D5   $67EA  
;;  $550B       $6867   $6875   $F5A9  
;;  $551D       $67B3   $67BB   $67DF   $67EF  
;;  $551E       $54A6  
;;  $5531       $5525  
;;  $553B       $552E  
;;  $5545       $5542  
;;  $554D       $5535   $5539   $5549  
;;  $5554       $5550  
;;  $5558       $54AA  
;;  $5564       $5401   $5453   $5559  
;;  $556E       $5499   $5579   $D48E   $D4A8   $D4AE   $F02A   $F8DF  
;;  $5573       $53FC   $5519  
;;  $55AA       $55AF   $55B4  
;;  $55AE       $559F  
;;  $55B6       $55A2   $55A8  
;;  $55B7       $55AC  
;;  $55D6       $5078  
;;  $55F8       $55EB  
;;  $5624       $55F6  
;;  $5645       $5638  
;;  $566A       $5622  
;;  $566F       $5643  
;;  $56A4       $5866  
;;  $56B8       $56B2  
;;  $56D5       $56D2  
;;  $56E3       $56BE  
;;  $56E9       $566D   $568F   $5693   $569B   $56A2  
;;  $56FA       $56F4  
;;  $5700       $56EC   $56FC  
;;  $5720       $571B  
;;  $5739       $572C   $5735  
;;  $573F       $55DA  
;;  $5740       $56E3   $5773   $5870  
;;  $5746       $574D  
;;  $5753       $5746  
;;  $5763       $575C   $575F  
;;  $5766       $55E4   $55ED   $5631   $563A   $569D   $585D  
;;  $5777       $576C  
;;  $5778       $5769  
;;  $5781       $5704   $D6CD   $DC73   $F875  
;;  $57A4       $570D   $DC6C   $F86C  
;;  $57CB       $5758   $578D   $5799   $57B8   $57C0   $5B23   $5B3B   $5B53  
;;  $57CB       $5BB6   $639F   $63D4   $6443   $644B   $647C   $D69B   $D6B6  
;;  $57CB       $DAAF   $DC25   $DC4F   $DF85   $DF91   $F011   $F248   $F604  
;;  $57CB       $F753   $F7D3   $F8C7   $F8CE  
;;  $57D8       $5600   $564D   $5815  
;;  $57EA       $5603   $5651  
;;  $5804       $566A   $5680  
;;  $5868       $5812   $584F   $5853   $585B   $5862  
;;  $587D       $580D   $5878  
;;  $587F       $5436   $587A   $D7C9  
;;  $5886       $588B  
;;  $5891       $5899  
;;  $5896       $5893  
;;  $589C       $5718   $D6D8  
;;  $58AD       $58CF  
;;  $58B6       $58B8  
;;  $58BA       $58B4  
;;  $58CB       $58BB  
;;  $58DE       $58A2   $58A8   $58D6  
;;  $58E1       $58DC  
;;  $58E4       $58C9  
;;  $58E7       $58DF   $58E2  
;;  $58E9       <entry> $6641  
;;  $58FA       $58FC  
;;  $5911       $5914  
;;  $591C       $5928  
;;  $59B3       $59B9  
;;  $59BB       $59AF  
;;  $59FA       $5A13   $5A1A  
;;  $5A05       $59EC  
;;  $5A08       $59F8  
;;  $5A0C       $59F2   $5A06  
;;  $5A0E       $5A0A  
;;  $5A1C       $5A10   $5A17  
;;  $5A2F       $59B3  
;;  $5A4E       $59A3   $59A8  
;;  $5A56       $5A4F   $5A52  
;;  $5A6D       $543B   $5964  
;;  $5A6F       $5A78  
;;  $5A7B       $5B5E   $DECF   $DEDC   $DEE5   $F142   $F209  
;;  $5A82       $5AA8   $5AD0   $5AEB   $5B02   $DE88   $F050   $F191   $F1DE  
;;  $5A82       $F21F  
;;  $5A8C       $5A88  
;;  $5A8D       $D08E   $DEB8   $F03F  
;;  $5A99       $D05E   $DEC4   $F03B  
;;  $5A9F       $5AAB  
;;  $5AA5       $DEC8   $F10E  
;;  $5AAD       $DEE2   $F121   $F15B   $F16B  
;;  $5AB8       $5ABF  
;;  $5ABC       $5AB3  
;;  $5AC7       $5AD3  
;;  $5ACD       $5AB8  
;;  $5AD5       $50CB   $5377  
;;  $5ADB       $5AEE  
;;  $5AE8       $5AB5   $DDAA   $DE03   $DF0A  
;;  $5AF6       $5B05  
;;  $5AFF       $5ABC   $DDA5   $F10A  
;;  $5B07       $DE94   $DEBE   $F225  
;;  $5B29       $5B18   $5B57  
;;  $5B3F       $5B27   $5B2F   $5B34   $5B4C  
;;  $5B45       $5B48  
;;  $5B46       $5B43  
;;  $5B4A       $5B11   $5B15  
;;  $5B4E       $5B1C  
;;  $5B59       $DB59  
;;  $5B7D       $5B7D  
;;  $5B7F       $5B62   $5B67   $5B6C   $5B71   $5B76   $5B7B  
;;  $5B92       $DA12   $DBE2   $DBF9  
;;  $5B9B       $5B98  
;;  $5B9D       $F0DC  
;;  $5BA0       $5BA6  
;;  $5BAA       $DA7B   $DABB  
;;  $5BC0       $52B3  
;;  $5C2C       $50BB   $65ED  
;;  $5C2F       $5C31  
;;  $5C46       $5C49  
;;  $5C5A       $5C67  
;;  $5C7D       $5C4E   $5C53  
;;  $5CA5       $5C6B   $5C70  
;;  $5CB2       $5C7D  
;;  $5CE9       $5CF3  
;;  $5CF5       $5CEF  
;;  $5CF9       $5D03  
;;  $5D05       $5CFF  
;;  $5D3D       $5CEB   $5CFB   $5D5F  
;;  $5D45       $5D40  
;;  $5D4D       $5D43  
;;  $5D55       $5D50  
;;  $5D5D       $5D53  
;;  $5D62       $5C80   $64FA  
;;  $5D95       $5D6D  
;;  $5D96       $5C83  
;;  $5DC6       $5C86  
;;  $5DF3       $5C89  
;;  $5E1B       $5C8C  
;;  $5E3A       $5C8F  
;;  $5E51       $5C92  
;;  $5E68       $5C95  
;;  $5E7F       $5C98  
;;  $5E8A       $5C9B  
;;  $5E97       $5C9E  
;;  $5EAB       $5CA1  
;;  $62F1       $62F5  
;;  $630D       $D638  
;;  $6327       $6318  
;;  $6335       $632C  
;;  $6336       $630E   $D06A  
;;  $635C       $6354  
;;  $6370       $6362  
;;  $6378       $635A  
;;  $6391       $635E   $636E   $637C   $637F   $6385   $6428  
;;  $639A       $6394  
;;  $63A6       $6398  
;;  $63BD       $63AC  
;;  $63C6       $63C0  
;;  $63CE       $63C8  
;;  $63DB       $63C4   $63CC  
;;  $63EA       $636C   $6381   $638F   $63BB   $63E4  
;;  $63FE       $63B5   $63B9   $63DC   $63E8  
;;  $6400       $633C  
;;  $6401       $6348  
;;  $642A       $633E  
;;  $6455       $6436  
;;  $645D       $557C   $6430   $D061  
;;  $6478       $646E   $6472  
;;  $647A       $6476  
;;  $6482       $634F   $6425   $6463  
;;  $649C       $64A0  
;;  $64A3       $6496  
;;  $64B5       $6492  
;;  $64CF       $64C5  
;;  $64D5       $64BF   $64CD  
;;  $64D8       $64B3   $6592  
;;  $64ED       $64EF  
;;  $650E       $649D  
;;  $6542       $653C  
;;  $654E       $652C  
;;  $655A       $6554  
;;  $6564       $6540   $654C   $6558  
;;  $6568       $656C  
;;  $6570       $6569  
;;  $6584       $6587  
;;  $659C       $648E  
;;  $65BF       $65C4  
;;  $65DB       $65DE  
;;  $65E2       $65E4  
;;  $65FC       $659A  
;;  $6605       $65A0  
;;  $6623       $662B  
;;  $663F       $6636   $6639  
;;  $664F       $65AD  
;;  $6662       $665A   $665F  
;;  $6665       $64A5   $64AB   $64AF   $64B7   $64BD   $64CB   $64D3   $6510  
;;  $6665       $6514   $6528   $6530   $6534   $6538   $6544   $6548   $6550  
;;  $6665       $655C   $6560   $656E   $659E   $65A4   $65A8   $6608   $6655  
;;  $666B       $6610   $6615   $661A   $661F   $6628  
;;  $666C       $508C   $64F1  
;;  $666F       $6673  
;;  $6676       $657B   $666F  
;;  $669F       $64E8  
;;  $66BB       $66AF  
;;  $66C5       $66B9  
;;  $66C7       $66EE  
;;  $66CD       $66C3  
;;  $66CF       $6737  
;;  $66D5       $6725  
;;  $66DB       $66AD  
;;  $66FE       $66F8  
;;  $6700       $66FC  
;;  $670A       $6704  
;;  $670C       $6708  
;;  $6712       $66E7  
;;  $672D       $66E2  
;;  $6747       $6741  
;;  $6749       $6745  
;;  $6753       $674D  
;;  $6755       $6751  
;;  $675B       $6730  
;;  $6776       $66CB   $66D3   $66D9   $6710   $672B   $6759   $6772  
;;  $677E       $66DD  
;;  $6783       $677C  
;;  $6792       $64F4  
;;  $679C       $6798  
;;  $67B8       $67AF  
;;  $67BA       $67C2  
;;  $67C6       $67AD  
;;  $67CF       $67B6  
;;  $67DA       $67AB  
;;  $67DD       $67A9   $67D8  
;;  $67E4       $67A7  
;;  $67ED       $67E2  
;;  $67F2       $67C4  
;;  $6808       $6789   $678E  
;;  $681D       $6814  
;;  $6820       $677E  
;;  $6828       $684C  
;;  $6830       $683C   $6847  
;;  $6835       $682D  
;;  $6839       $6842  
;;  $683E       $6837  
;;  $6849       $6833  
;;  $685C       $65FC  
;;  $686A       $67DA  
;;  $D000       $F0F1  
;;  $D00B       $D00F  
;;  $D012       $D00C  
;;  $D020       $D023  
;;  $D039       $D005   $D014  
;;  $D061       $D05A  
;;  $D06E       $D051  
;;  $D081       $D03E   $D045   $D04D  
;;  $D082       $D064   $D073  
;;  $D092       $D067  
;;  $D0A6       $631B   $D098  
;;  $D0AC       $D0B7   $D0BF   $D0C7  
;;  $D0B1       $631E   $D0A4  
;;  $D0B9       $6321   $D0A0  
;;  $D0C1       $6324   $D09C  
;;  $D0C9       $5408   $545A   $5560   $5585   $6332   $63FA   $D07A   $D0AD  
;;  $D0C9       $DED5   $F046   $F154   $F164  
;;  $D0DA       $D0D4  
;;  $D0E7       $D0D8   $D0E1  
;;  $D0F3       $D0EF  
;;  $D122       $D0FE   $D10E   $D116  
;;  $D123       $D112   $D11A  
;;  $D124       $D156   $D15A  
;;  $D135       $D12F  
;;  $D13F       $D0F7  
;;  $D14F       $D144  
;;  $D15C       $D100   $D146  
;;  $D167       $D163  
;;  $D168       $D057  
;;  $D171       $5AAE   $D977   $D9C7   $DA59   $DA9A   $DB96   $DC14   $DD84  
;;  $D171       $DDE5   $DF32   $DF4D   $DFA5   $DFBB   $DFF6   $F1D4   $F8FF  
;;  $D171       $F921  
;;  $D181       $53E6   $5514   $58AE   $5A90   $5A9C   $5AC4   $5AD8   $5AF3  
;;  $D181       $5B81   $6342   $645F   $6518   $6850   $D0CB   $D124   $D169  
;;  $D181       $D174   $DBA3   $DE37   $DE49   $DE7C   $DF41   $DFB2   $F049  
;;  $D181       $F08F   $F0A9   $F0B2   $F173   $F1CC   $F218   $F762  
;;  $D199       $D875  
;;  $D1A9       $D1A1  
;;  $D1C2       $D1BD   $D1E5   $D1EB   $D1F0   $D1F5  
;;  $D1C9       $D1A7   $D24A   $D250   $D296  
;;  $D1CD       $D290  
;;  $D1E3       $D1B0  
;;  $D1E7       $D1C0  
;;  $D1ED       $D1B7  
;;  $D20E       $D1B2   $D1BB   $D200  
;;  $D23E       $D229   $D22D  
;;  $D24C       $D241  
;;  $D252       $D227   $D22F  
;;  $D27E       $D263  
;;  $D292       $D27C  
;;  $D298       $D19A   $D4EE  
;;  $D2A7       $D2A2  
;;  $D2A8       $D21E   $D25A   $D511   $D525  
;;  $D2B7       $D2B2  
;;  $D2C0       $D2BB  
;;  $D2C1       $D1C2   $D211   $D40C  
;;  $D2F7       $D2F0  
;;  $D2F8       $D2D7   $D2E9  
;;  $D318       $D31B  
;;  $D31A       $D310   $D316  
;;  $D31D       $D2FC  
;;  $D324       $D321  
;;  $D344       $D1FB   $D239  
;;  $D34E       $D348  
;;  $D350       $D34C  
;;  $D353       <entry> $50E2   $50ED  
;;  $D362       $D35B  
;;  $D36B       $D360   $D366  
;;  $D38E       $D37F  
;;  $D392       $D38C  
;;  $D396       $D413  
;;  $D3A2       $D377   $D419   $D41D  
;;  $D3AC       $D3A8  
;;  $D3BD       $D3E6   $D42C  
;;  $D3C0       $D3A0  
;;  $D3C7       $D354   $D3E3   $D3E9  
;;  $D3D2       $D3BD  
;;  $D3E2       <entry>
;;  $D3E8       <entry>
;;  $D3FE       $D3F8  
;;  $D415       $D402  
;;  $D41B       $D400  
;;  $D41F       $D3F4  
;;  $D432       $D383   $D389   $D3B8   $D53D   $D545  
;;  $D441       $D43A  
;;  $D443       $67A0   $D39A  
;;  $D45D       $D459  
;;  $D462       $D452  
;;  $D476       $D46D  
;;  $D478       $D474  
;;  $D47D       $D467  
;;  $D47E       $D447  
;;  $D48D       $D44F   $D456   $D464   $D471  
;;  $D4A1       $D496  
;;  $D4A3       $D49F  
;;  $D4A5       $D45F   $D47A   $D482   $D489  
;;  $D4CC       $D4D3  
;;  $D4D6       $D1DF  
;;  $D4DD       $D4DB  
;;  $D4E6       $D4EA  
;;  $D4ED       $5427   $5431  
;;  $D505       $D4F8   $D50A   $D50F   $D51B   $D51F   $D523  
;;  $D507       $D4FF  
;;  $D511       $D4FA   $D503  
;;  $D525       $D519   $D521  
;;  $D532       $D52D  
;;  $D535       $D368   $D429  
;;  $D543       $D53B  
;;  $D54B       <entry>
;;  $D563       $D551  
;;  $D56B       $D566  
;;  $D58B       $D585  
;;  $D591       $D589  
;;  $D593       $D572   $D57C   $D580   $D58D  
;;  $D5B7       $D5A8  
;;  $D5CA       $D5BA   $D5C0   $D5C6  
;;  $D5CE       $D561  
;;  $D5D1       $D5B5  
;;  $D635       $507E  
;;  $D638       $D641   $D648  
;;  $D64A       $D643  
;;  $D661       $D654  
;;  $D67C       $D652  
;;  $D681       $D650  
;;  $D686       $D64E  
;;  $D687       $DBB8   $DF5D   $F773  
;;  $D6A8       $58C0   $DBAD   $DF55   $F769  
;;  $D6BD       $507B  
;;  $D6E3       $D6EC  
;;  $D6E7       $D6C7   $D6DC  
;;  $D6EA       $D6E1  
;;  $D6EE       $5729   $D6DE  
;;  $D708       $D6F2   $D6F8   $D6FE   $D704  
;;  $D70B       $DDAD  
;;  $D717       $D9D7   $DA21  
;;  $D729       <entry>
;;  $D72D       $D759  
;;  $D742       $D7D6   $D7EA   $D801   $D993   $D9F0   $F941  
;;  $D74C       $586B  
;;  $D76B       $D768  
;;  $D77B       $D751  
;;  $D783       $D77E  
;;  $D78B       $D763  
;;  $D78E       $D757  
;;  $D78F       $D765   $D985   $D9E0   $F935  
;;  $D7A3       $D79A  
;;  $D7AD       $D7A4  
;;  $D7B9       $D7A1   $D7AB   $D7B4  
;;  $D7CC       $D7E1   $D7F3   $D80C  
;;  $D7D1       $D7BD  
;;  $D7D9       $D7F1  
;;  $D7E5       $D79F   $D7A9  
;;  $D7F5       $D7B7  
;;  $D7FC       $D7F8  
;;  $D808       $D7E3  
;;  $D80E       $D790   $F2D9  
;;  $D81E       $D812  
;;  $D84F       $561F   $5667   $D78B   $D7CC   $D996   $D9F3   $F944  
;;  $D858       $D853  
;;  $D859       $D855  
;;  $D865       $D860  
;;  $D870       $D868  
;;  $D875       $D86E  
;;  $D88C       $D21B   $D236   $D257   $D285   $D2F4   $D7C1   $D7D3   $D7E7  
;;  $D88C       $D7FE   $D990   $D9ED  
;;  $D893       $D896  
;;  $D89A       $D890  
;;  $D8AB       $D8A1  
;;  $D8AC       $D780  
;;  $D951       $D63B  
;;  $D97E       $D97A  
;;  $D98E       $D988  
;;  $D99D       $D96D   $D973   $D981  
;;  $D9C5       $D9FA  
;;  $D9CD       $D9CA  
;;  $D9DA       $D95A   $D962   $D967   $D99B   $DA24  
;;  $D9DB       $D9BB  
;;  $D9F7       $D9E4   $D9FF   $DA0F  
;;  $D9FC       $D9C0   $D9DD  
;;  $DA11       $D9D5  
;;  $DA1B       $DA18  
;;  $DA26       $D9F7  
;;  $DA32       $DA50  
;;  $DA4B       $DA54  
;;  $DA52       $DA49  
;;  $DA56       $DA2F   $DA4D  
;;  $DA64       $DA5C  
;;  $DA68       $DA62  
;;  $DA6A       $DA60   $DA66  
;;  $DA8A       $DA75  
;;  $DAA2       $DA9D  
;;  $DAB5       $D9C2  
;;  $DADA       $DAD6  
;;  $DAE0       $DABF  
;;  $DAF4       $D95D  
;;  $DB3C       $DB3E  
;;  $DB3D       $DB0E   $DB24   $DB38  
;;  $DB40       $DAD3   $DC7F  
;;  $DB4A       $DC45  
;;  $DB54       $DB01   $DB18   $DB2F  
;;  $DB60       $DB5C  
;;  $DB6D       $DB6A  
;;  $DB78       $DB75  
;;  $DB7C       $DB04   $DB1B  
;;  $DB96       $DB80  
;;  $DBA0       $DB99  
;;  $DBA1       $DAF5   $DF77   $F8F7  
;;  $DBBE       $DB07   $DB1E   $DB32  
;;  $DBCE       $DBC9  
;;  $DBD6       $DBD1  
;;  $DBD9       $DBDB  
;;  $DBDA       $DBC2   $DBC7   $DBCF  
;;  $DBDD       $DBCB   $DBD3  
;;  $DBE9       $DBE6  
;;  $DBF4       $D9D2  
;;  $DC00       $DBFD  
;;  $DC06       $DC2B  
;;  $DC1C       $DC17  
;;  $DC25       $DC22  
;;  $DC2A       $DA3A   $DADC  
;;  $DC52       $DC49  
;;  $DC5D       $DC5A  
;;  $DC7C       $DA78   $DAB8  
;;  $DC84       $DC96   $DC99   $DC9E   $DCA1  
;;  $DC86       $DC82  
;;  $DC98       $DC8C   $DC90  
;;  $DCA3       $5B31   $DA27   $DB7D   $F05A   $F176  
;;  $DD28       $F493   $F519  
;;  $DD37       $DD2E   $DD33  
;;  $DD3E       $DD4A  
;;  $DD48       $DD40   $DD44  
;;  $DD5D       $DD29  
;;  $DD73       $DD6C   $DD78  
;;  $DD76       $DD6F  
;;  $DD7A       $DD74   $F1A3  
;;  $DD80       $DDBA  
;;  $DD8C       $DD87  
;;  $DDAA       $DDA0   $DDA3  
;;  $DDAD       $DDA8   $DE0C  
;;  $DDB0       $DE21  
;;  $DDB1       $DDB5  
;;  $DDB2       $DD3A   $DD46   $DD50   $DD53   $DD5B   $DD63   $DD8D   $DDCC  
;;  $DDB2       $DE24   $DE2B  
;;  $DDB7       $DD7E  
;;  $DDEC       $DDE8  
;;  $DE0E       $D8B2   $DDD4  
;;  $DE23       $DDDA  
;;  $DE26       $DDBF  
;;  $DE2D       $DDBC  
;;  $DE5D       $DE61  
;;  $DE5F       $DE42   $DE47   $DE55   $DE5A  
;;  $DE63       $DE06  
;;  $DE6F       $DE09   $DE76  
;;  $DE7B       $DE1E  
;;  $DEB2       $DD96   $DDFE  
;;  $DF0E       $DDCE  
;;  $DF1A       $DF17  
;;  $DF26       $F1C3  
;;  $DF39       $DF35  
;;  $DF3F       $F1C0  
;;  $DF54       $DF50  
;;  $DF75       $DD93  
;;  $DF8C       $DF89  
;;  $DFA5       $DFA1  
;;  $DFAB       $DFA8  
;;  $DFB1       $DFAD  
;;  $DFC4       $DFCF  
;;  $DFC8       $DFD2  
;;  $DFCD       $DFBE  
;;  $DFD1       $DFC2  
;;  $DFD4       $DFC5  
;;  $DFD9       $DFD6  
;;  $DFFC       $DFF9  
;;  $F030       $F02D  
;;  $F094       $F0AE  
;;  $F0F4       $F0E5   $F0EA  
;;  $F104       $F0FB   $F101  
;;  $F117       $F114  
;;  $F130       $F12D  
;;  $F13E       $F15E   $F16E  
;;  $F150       $F139  
;;  $F160       $F13C  
;;  $F18C       $F189  
;;  $F18F       $F211  
;;  $F198       $F180  
;;  $F1DB       $F1D8  
;;  $F1FC       $F1F0  
;;  $F203       $F1FA  
;;  $F21B       $F222  
;;  $F21F       $F216  
;;  $F22B       $F228  
;;  $F232       $F23D  
;;  $F237       $F23B  
;;  $F23F       $F233   $F24D  
;;  $F243       $F240  
;;  $F24C       $F22F  
;;  $F268       $F260  
;;  $F284       $F270  
;;  $F294       $F282  
;;  $F2C7       $F262  
;;  $F307       $F264  
;;  $F318       $F266  
;;  $F340       $F33C  
;;  $F35C       $F34E  
;;  $F37C       $F356   $F35A  
;;  $F38C       $F377  
;;  $F398       $F371  
;;  $F3E7       $F3D9  
;;  $F41C       $F3E1   $F3E5  
;;  $F43E       $F3ED   $F3F1  
;;  $F442       $F276   $F27B   $F280   $F288   $F28D   $F292   $F2D1  
;;  $F443       $F25C   $F2C5   $F305   $F316   $F4B2  
;;  $F444       $F448   $F450   $F496   $F4A0  
;;  $F445       $F253  
;;  $F45F       $F46B  
;;  $F467       $F455  
;;  $F478       $F45D   $F465  
;;  $F4AA       $F25E  
;;  $F4B4       $F4AD  
;;  $F4CE       $F4C9  
;;  $F4D3       $F4CC  
;;  $F4DD       $F52F  
;;  $F4E9       $F4E5  
;;  $F4FE       $F4FA  
;;  $F50B       $F506  
;;  $F517       $F513  
;;  $F54F       $F548  
;;  $F559       $F555  
;;  $F560       $F544  
;;  $F561       $F54D   $F55E  
;;  $F57C       $F577  
;;  $F5C0       $F5BD  
;;  $F5CC       $F5C9  
;;  $F5E6       $F5EC  
;;  $F5EE       $F5E9  
;;  $F5FD       $F6A2  
;;  $F649       $F626   $F62C   $F63E   $F644  
;;  $F65A       $F656  
;;  $F68F       $F695  
;;  $F697       $F67A  
;;  $F698       $F692  
;;  $F6EF       $F6E9  
;;  $F6F5       $F6EF  
;;  $F70D       $F6ED   $F70A  
;;  $F71E       $F718  
;;  $F722       $F71E  
;;  $F73A       $F71C   $F737  
;;  $F745       $F73C  
;;  $F74B       $F740   $F747  
;;  $F75E       $F757   $F75A  
;;  $F798       $F795  
;;  $F7A5       $F7A2  
;;  $F7B7       $F811  
;;  $F7E8       $F803  
;;  $F7F3       $F816  
;;  $F818       $F7EB   $F809  
;;  $F81A       $F7EE  
;;  $F823       $F7E6  
;;  $F84D       $F85C  
;;  $F851       $F840  
;;  $F860       $F84B  
;;  $F862       $F84F  
;;  $F890       $F88C  
;;  $F8B7       $F8D7  
;;  $F8BF       $F8DB  
;;  $F8D5       $F8B5  
;;  $F8D9       $F8BD  
;;  $F907       $F902  
;;  $F918       $F915  
;;  $F927       $F924  
;;  $F933       $F8E9   $F8ED   $F8F5   $F909   $F90D   $F91A   $F939   $F947  
;;  $F933       $F94C  
;;  $F934       $F92E  
;;  $F93B       $F94E  
;;  $F949       $F931  
;;  $F95F       $F964  
;;  $F962       $F95D  
;;  $F9AD       $F99F   $F9A7  
;;  $F9B6       $F9BB  
;;  $F9CE       $F9C0   $F9C8   $F9D3  
;;  $F9D7       $F9DB  
;;  $FA73       $FA71   $FA73  
;;  $FBA5       $FBA3  
;;  $FBF5       $FBF3  
;;  $FC13       $FC11  
;;  $FC45       $FC43  
;; ======================================================================== ;;
