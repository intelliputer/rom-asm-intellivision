
        ORG     $5000
.HEADER:
        BIDECLE $0000           ; 5000  Ptr: MOB graphic images
        BIDECLE $501C           ; 5002  Ptr: EXEC timer table
        BIDECLE $5053           ; 5004  Ptr: Start of game
        BIDECLE $5114           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5134           ; 5008  Ptr: GRAM init sequence
        BIDECLE $5032           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0000,  $0008   ; 500F  Color Stack init (0, 1)
        DECLE   $0001,  $0008   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $01F0,  $01E0,  $01D0,  $01C0   ; 5014   01F0 01E0 01D0 01C0
        DECLE   $01B0,  $01A0,  $0190,  $0180   ; 5018   01B0 01A0 0190 0180
.TIMER:
        DECLE   $00F0,  $0051,  $0001,  $0000; 501C  Timer dispatch/interval
        DECLE   $00F2,  $0052,  $0010,  $0000; 5020  Timer dispatch/interval
        DECLE   $0097,  $0052,  $0010,  $0000; 5024  Timer dispatch/interval
        DECLE   $000F,  $005A,  $0001,  $0000; 5028  Timer dispatch/interval
        DECLE   $00AB,  $0057,  $0001,  $0000; 502C  Timer dispatch/interval
        BIDECLE $0000           ; 5030  End of timer table

.TITLE:
        DECLE   $0050                           ; 5032  Cartridge year
        STRING  "BOXING"                        ; 5033  Title string
        DECLE   $0000                           ; 5039  

.TITLECODE:
        PSHR    R5                              ; 503A   0275
        MVII    #$0007, R3                      ; 503B   02BB 0007
        CMP     .PSG0.lft_hand,R3               ; 503D   0343 01FF
        BNEQ    L_5052                          ; 503F   020C 0011

        MVII    #$02A7, R4                      ; 5041   02BC 02A7

        JSR     R5,     X_PRINT_R5              ; 5043   0004 0118 007B
        STRING  "D.E.I."                        ; 5046  
        DECLE   $0000                           ; 504C   0000

        MVII    #$0004, R0                      ; 504D   02B8 0004

        JSR     R5,     X_PLAY_CHEER1           ; 504F   0004 011C 02D5

L_5052:
        PULR    R7                              ; 5052   02B7

.START:
        PSHR    R5                              ; 5053   0275
        MVII    #$0200, R4                      ; 5054   02BC 0200
        MVII    #$00F0, R0                      ; 5056   02B8 00F0

        JSR     R5,     X_FILL_ZERO             ; 5058   0004 0114 0338
        JSR     R5,     .EXEC.607               ; 505B   0004 0114 0207

        MVII    #$0007, R3                      ; 505E   02BB 0007
        MVII    #$02B9, R4                      ; 5060   02BC 02B9

        JSR     R5,     X_PRINT_R5              ; 5062   0004 0118 007B
        STRING  "CHOOSE MEN"                    ; 5065  
        DECLE   $0000                           ; 506F   0000

        JSR     R5,     L_52D2                  ; 5070   0004 0150 02D2

        MVII    #$0002, R0                      ; 5073   02B8 0002
        MVO     R0,     G_0114                  ; 5075   0240 0114
        MVII    #$0100, R4                      ; 5077   02BC 0100
        MOVR    R4,     R5                      ; 5079   00A5
        SDBD                                    ; 507A   0001
        MVI@    R4,     R3                      ; 507B   02A3
        MVO     R3,     G_01A8                  ; 507C   0243 01A8
        SWAP    R3,     1                       ; 507E   0043
        MVO     R3,     G_01A9                  ; 507F   0243 01A9
        SDBD                                    ; 5081   0001
        MVII    #$58E1, R3                      ; 5082   02BB 00E1 0058
        MVO@    R3,     R5                      ; 5085   026B
        SWAP    R3,     1                       ; 5086   0043
        MVO@    R3,     R5                      ; 5087   026B
        INCR    R7                              ; 5088   000F

L_5089:
        PSHR    R5                              ; 5089   0275

L_508A:
        JSR     R5,     L_5616                  ; 508A   0004 0154 0216

        INCR    R7                              ; 508D   000F

L_508E:
        PSHR    R5                              ; 508E   0275
L_508F:
        CLRR    R0                              ; 508F   01C0
        MVII    #$001F, R1                      ; 5090   02B9 001F
        PSHR    R1                              ; 5092   0271

        JSR     R5,     L_58C5                  ; 5093   0004 0158 00C5

        INCR    R0                              ; 5096   0008
        PULR    R1                              ; 5097   02B1

        JSR     R5,     L_58C5                  ; 5098   0004 0158 00C5

        SDBD                                    ; 509B   0001
        MVII    #$5932, R1                      ; 509C   02B9 0032 0059
        MVO     R1,     G_035D                  ; 509F   0241 035D
        PULR    R7                              ; 50A1   02B7

        MVII    #$021A, R4                      ; 50A2   02BC 021A
        SDBD                                    ; 50A4   0001
        MVII    #$5149, R5                      ; 50A5   02BD 0049 0051
L_50A8:
        SDBD                                    ; 50A8   0001
        MVI@    R5,     R3                      ; 50A9   02AB
        SLLC    R3,     2                       ; 50AA   005F
        CLRR    R1                              ; 50AB   01C9
        RLC     R1,     2                       ; 50AC   0055
        MOVR    R3,     R0                      ; 50AD   0098
        BEQ     L_50D7                          ; 50AE   0204 0027

        SLR     R0,     2                       ; 50B0   0064
        SLL     R3,     1                       ; 50B1   004B
        SLR     R3,     1                       ; 50B2   0063
        SLR     R3,     2                       ; 50B3   0067
        INCR    R7                              ; 50B4   000F

L_50B5:
        MOVR    R3,     R0                      ; 50B5   0098
L_50B6:
        PSHR    R1                              ; 50B6   0271
        PSHR    R0                              ; 50B7   0270
        MOVR    R4,     R1                      ; 50B8   00A1
        SUBI    #$0002, R1                      ; 50B9   0339 0002
        MVII    #$000A, R2                      ; 50BB   02BA 000A
        PSHR    R5                              ; 50BD   0275

        JSR     R5,     X_DIV                   ; 50BE   0004 011C 01FB

        PULR    R5                              ; 50C1   02B5
        ADDR    R1,     R1                      ; 50C2   00C9
        BNEQ    L_50C7                          ; 50C3   020C 0002

        ADDI    #$000A, R4                      ; 50C5   02FC 000A
L_50C7:
        MVII    #$0013, R2                      ; 50C7   02BA 0013
        SUBR    R1,     R2                      ; 50C9   010A
        ADDR    R4,     R2                      ; 50CA   00E2
        PULR    R0                              ; 50CB   02B0
        MVO@    R0,     R4                      ; 50CC   0260
        MOVR    R3,     R1                      ; 50CD   0099
        ADDI    #$0068, R1                      ; 50CE   02F9 0068
        MVO@    R1,     R2                      ; 50D0   0251
        PULR    R1                              ; 50D1   02B1
        DECR    R1                              ; 50D2   0011
        BPL     L_50B5                          ; 50D3   0223 001F
        B       L_50A8                          ; 50D5   0220 002E

L_50D7:
        MVII    #$018E, R4                      ; 50D7   02BC 018E
L_50D9:
        MVII    #$01AE, R1                      ; 50D9   02B9 01AE
        ADDR    R3,     R1                      ; 50DB   00D9
        MVI@    R1,     R1                      ; 50DC   0289
        MOVR    R1,     R5                      ; 50DD   008D
        ADDR    R7,     R1                      ; 50DE   00F9
        ADDI    #$002F, R1                      ; 50DF   02F9 002F
        MVI@    R1,     R0                      ; 50E1   0288
        CMPI    #$0006, R5                      ; 50E2   037D 0006
        BNEQ    L_50EB                          ; 50E4   020C 0005

        MVII    #$000A, R0                      ; 50E6   02B8 000A

        JSR     R5,     X_RAND1                 ; 50E8   0004 0114 027D

L_50EB:
        MVII    #$0005, R1                      ; 50EB   02B9 0005
L_50ED:
        MOVR    R0,     R2                      ; 50ED   0082
        ANDI    #$0003, R2                      ; 50EE   03BA 0003
        SLR     R0,     2                       ; 50F0   0064
        MVO@    R2,     R4                      ; 50F1   0262
        DECR    R1                              ; 50F2   0011
        BNEQ    L_50ED                          ; 50F3   022C 0007

        INCR    R3                              ; 50F5   000B
        CMPI    #$0001, R3                      ; 50F6   037B 0001
        BEQ     L_50D9                          ; 50F8   0224 0020

        MVO     R3,     G_017C                  ; 50FA   0243 017C
        MVII    #$001B, R0                      ; 50FC   02B8 001B
        SDBD                                    ; 50FE   0001
        MVII    #$51B5, R4                      ; 50FF   02BC 00B5 0051
        MVII    #$015F, R1                      ; 5102   02B9 015F

        JSR     R5,     .EXEC.730               ; 5104   0004 0114 0330

        MVII    #$00D7, R0                      ; 5107   02B8 00D7
        MVO     R0,     .BTAB.E5                ; 5109   0240 02E5

        JSR     R5,     L_52F2                  ; 510B   0004 0150 02F2

        PULR    R7                              ; 510E   02B7

        DECLE   $0042,  $0099,  $00B5,  $0155   ; 510F   0042 0099 00B5 0155
        DECLE   $0155                           ; 5113   0155
.GFX_LIST_5114:
        DECLE   $0004,  $0002,  $0001,  $0080   ; 5114  CART PIC #00
        DECLE   $0040,  $0020,  $0010,  $0008   ; 5118  
        DECLE   $0084,  $00C2,  $00E1,  $00F0   ; 511C  CART PIC #01
        DECLE   $00F8,  $00FC,  $00FE,  $00FF   ; 5120  
        DECLE   $0018,  $0018,  $00E8,  $00D8   ; 5124  CART PIC #02
        DECLE   $0018,  $0018,  $0018,  $0018   ; 5128  
        DECLE   $0003,  $0003,  $00FE,  $000F   ; 512C  CART PIC #03
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5130  
.GRAM_INIT_5134:
        DECLE   $001A           ; 5134  # of GRAM cards to init
        DECLE   $0001,  $0082   ; 5135  #00   :  Algo #1
        DECLE   $0201,  $0180   ; 5137  #01-04:  CART #00-03 X---
        DECLE   $027F,  $01CE   ; 5139  #05   :  Algo #1
        DECLE   $027F,  $01C6   ; 513B  #06   :  Algo #1
        DECLE   $0201,  $0002   ; 513D  #07   :  Algo #1
        DECLE   $0001,  $0036   ; 513F  #08   :  Algo #1
        DECLE   $02A9,  $0152   ; 5141  #09   :  Algo #1
        DECLE   $008B,  $0140   ; 5143  #0A-0C:  GRAM #05-07 --I-
        DECLE   $0201,  $03C0   ; 5145  #0D-14:  GRAM #00-07 X---
        DECLE   $0211,  $0240   ; 5147  #15-19:  GRAM #08-0C X---


        RLC     R0,     1                       ; 5149   0050
        COMR    R0                              ; 514A   0018
        SLLC    R0,     1                       ; 514B   0058
        COMR    R0                              ; 514C   0018
        SLR     R0,     1                       ; 514D   0060
        SLLC    R0,     1                       ; 514E   0058
        SLR     R0,     1                       ; 514F   0060
        ADDR    R5,     R0                      ; 5150   00E8
        ADCR    R0                              ; 5151   0028
        INCR    R0                              ; 5152   0008
        GSWD    R0                              ; 5153   0030
L_5154:
        INCR    R0                              ; 5154   0008
        RSWD    R0                              ; 5155   0038
        ADDR    R1,     R0                      ; 5156   00C8
        SLR     R0,     1                       ; 5157   0060
        SLL     R0,     1                       ; 5158   0048
        ADCR    R0                              ; 5159   0028
        INCR    R0                              ; 515A   0008
        GSWD    R0                              ; 515B   0030
        INCR    R0                              ; 515C   0008
        SLR     R0,     1                       ; 515D   0060
        ADDR    R3,     R0                      ; 515E   00D8
        SLR     R0,     1                       ; 515F   0060
        SLLC    R0,     1                       ; 5160   0058
        ADCR    R0                              ; 5161   0028
        INCR    R0                              ; 5162   0008
        GSWD    R0                              ; 5163   0030
        INCR    R0                              ; 5164   0008
        SLR     R0,     1                       ; 5165   0060
        SLLC    R0,     1                       ; 5166   0058
        SETC                                    ; 5167   0007
        INCR    R0                              ; 5168   0008
        NEGR    R3                              ; 5169   0023
        INCR    R0                              ; 516A   0008
        SWAP    R3,     2                       ; 516B   0047
        ADDR    R1,     R0                      ; 516C   00C8
        SLR     R0,     1                       ; 516D   0060
        MOVR    R3,     R0                      ; 516E   0098
        SETC                                    ; 516F   0007
        INCR    R0                              ; 5170   0008
        INCR    R7                              ; 5171   000F

        INCR    R0                              ; 5172   0008
L_5173:
        NEGR    R3                              ; 5173   0023
        INCR    R0                              ; 5174   0008
        SWAP    R3,     2                       ; 5175   0047
        ADDR    R1,     R0                      ; 5176   00C8
        SLR     R0,     1                       ; 5177   0060
        SLLC    R0,     1                       ; 5178   0058
        SETC                                    ; 5179   0007
        INCR    R0                              ; 517A   0008
        INCR    R7                              ; 517B   000F

        SLL     R0,     1                       ; 517C   0048
L_517D:
        NEGR    R3                              ; 517D   0023
        INCR    R0                              ; 517E   0008
        SWAP    R3,     2                       ; 517F   0047
        ADDR    R1,     R0                      ; 5180   00C8
        RSWD    R0                              ; 5181   0038
        INCR    R0                              ; 5182   0008
        COMR    R3                              ; 5183   001B
        INCR    R0                              ; 5184   0008
        INCR    R7                              ; 5185   000F

        SLL     R0,     1                       ; 5186   0048
L_5187:
        DECR    R7                              ; 5187   0017

        INCR    R0                              ; 5188   0008
        SLR     R3,     2                       ; 5189   0067
        INCR    R0                              ; 518A   0008
        SLR     R3,     2                       ; 518B   0067
        ADDR    R1,     R0                      ; 518C   00C8
        RSWD    R0                              ; 518D   0038
        INCR    R0                              ; 518E   0008
        COMR    R3                              ; 518F   001B
        INCR    R0                              ; 5190   0008
        INCR    R7                              ; 5191   000F

        INCR    R0                              ; 5192   0008
L_5193:
        DECR    R7                              ; 5193   0017

        INCR    R0                              ; 5194   0008
        SLR     R3,     2                       ; 5195   0067
        SLL     R0,     1                       ; 5196   0048
        SLR     R3,     2                       ; 5197   0067
        ADDR    R1,     R0                      ; 5198   00C8
        RSWD    R0                              ; 5199   0038
        INCR    R0                              ; 519A   0008
        COMR    R3                              ; 519B   001B
        INCR    R0                              ; 519C   0008
L_519D:
        DECR    R7                              ; 519D   0017

        DECLE   $0008,  $0067,  $0088,  $0067   ; 519E   0008 0067 0088 0067
        DECLE   $00C8,  $0060,  $0018,  $004B   ; 51A2   00C8 0060 0018 004B
        DECLE   $0008,  $0063,  $00C8,  $0063   ; 51A6   0008 0063 00C8 0063
        DECLE   $00C8,  $0060,  $0038,  $0063   ; 51AA   00C8 0060 0038 0063
        DECLE   $0008,  $0038,  $00C8,  $0038   ; 51AE   0008 0038 00C8 0038
        DECLE   $00C8,  $0000,  $0000,  $0002   ; 51B2   00C8 0000 0000 0002
        DECLE   $0003,  $0000                   ; 51B6   0003 0000

        EIS                                     ; 51B8   0002
        INCR    R7                              ; 51B9   000F

        DECLE   $0000                           ; 51BA   0000
L_51BB:
        DIS                                     ; 51BB   0003
        DECLE   $0016,  $0000,  $0003,  $0023   ; 51BC   0016 0000 0003 0023
        DECLE   $0000,  $0007,  $00EA,  $0000   ; 51C0   0000 0007 00EA 0000
        DECLE   $0000,  $00E0,  $001F,  $0007   ; 51C4   0000 00E0 001F 0007
        DECLE   $00E6,  $0001,  $0007,  $00E4   ; 51C8   00E6 0001 0007 00E4
        DECLE   $003F,  $003F                   ; 51CC   003F 003F
L_51CE:
        CLRR    R0                              ; 51CE   01C0
L_51CF:
        PSHR    R5                              ; 51CF   0275
        MOVR    R2,     R3                      ; 51D0   0093
        ADDR    R2,     R3                      ; 51D1   00D3
        ADDR    R2,     R3                      ; 51D2   00D3
        ADDI    #$015E, R3                      ; 51D3   02FB 015E
        MVII    #$0001, R4                      ; 51D5   02BC 0001
L_51D7:
        PSHR    R4                              ; 51D7   0274
        PSHR    R3                              ; 51D8   0273
        PSHR    R0                              ; 51D9   0270

        JSR     R5,     L_5431                  ; 51DA   0004 0154 0031

        MOVR    R3,     R4                      ; 51DD   009C
        MVII    #$01AE, R3                      ; 51DE   02BB 01AE
        ADDR    R2,     R3                      ; 51E0   00D3
        MVI@    R3,     R3                      ; 51E1   029B
        MVI@    R4,     R0                      ; 51E2   02A0
        MVI@    R4,     R1                      ; 51E3   02A1

        JSR     R5,     L_5427                  ; 51E4   0004 0154 0027

        PULR    R0                              ; 51E7   02B0
        PULR    R3                              ; 51E8   02B3
        ADDI    #$0006, R3                      ; 51E9   02FB 0006
        PULR    R4                              ; 51EB   02B4
        DECR    R4                              ; 51EC   0014
        BEQ     L_51D7                          ; 51ED   0224 0017
        PULR    R7                              ; 51EF   02B7

L_51F0:
        PSHR    R5                              ; 51F0   0275
        MVI     G_0158, R0                      ; 51F1   0280 0158
        MVII    #$0188, R3                      ; 51F3   02BB 0188
        MVI@    R3,     R1                      ; 51F5   0299
        SUBI    #$0002, R1                      ; 51F6   0339 0002
        MVI     G_0185, R2                      ; 51F8   0282 0185
        ADD     G_0186, R2                      ; 51FA   02C2 0186
        SLL     R2,     2                       ; 51FC   004E
        ADDI    #$0040, R2                      ; 51FD   02FA 0040
        CMPR    R2,     R1                      ; 51FF   0151
        BGE     L_5203                          ; 5200   020D 0001

        MOVR    R2,     R1                      ; 5202   0091
L_5203:
        MVO@    R1,     R3                      ; 5203   0259
        SUBR    R0,     R1                      ; 5204   0101
        SAR     R1,     2                       ; 5205   006D
        ADDR    R1,     R0                      ; 5206   00C8
        CMPI    #$0077, R0                      ; 5207   0378 0077
        BLE     L_520D                          ; 5209   0206 0002

        MVII    #$0077, R0                      ; 520B   02B8 0077
L_520D:
        MVO     R0,     G_0158                  ; 520D   0240 0158
        SLR     R0,     2                       ; 520F   0064
        SLR     R0,     1                       ; 5210   0060
        MVO     R0,     .PSG0.chn_c_vol         ; 5211   0240 01FD
        MVI     G_01B2, R0                      ; 5213   0280 01B2
        CLRR    R3                              ; 5215   01DB
        CMPI    #$0003, R0                      ; 5216   0378 0003
        BNEQ    L_5225                          ; 5218   020C 000B

        SDBD                                    ; 521A   0001
        MVII    #$5024, R1                      ; 521B   02B9 0024 0050

        JSR     R5,     X_TIMER_STOP            ; 521E   0004 0118 0038

        MVO     R3,     G_016D                  ; 5221   0243 016D
        B       L_5229                          ; 5223   0200 0004

L_5225:
        MVO     R3,     G_01AA                  ; 5225   0243 01AA
        MVO     R3,     G_01AB                  ; 5227   0243 01AB
L_5229:
        CMP     G_017C, R3                      ; 5229   0343 017C
        BNEQ    L_5284                          ; 522B   020C 0057

        MVI     G_0181, R0                      ; 522D   0280 0181
        SLR     R0,     2                       ; 522F   0064
        ANDI    #$000A, R0                      ; 5230   03B8 000A
        MOVR    R0,     R4                      ; 5232   0084
        MVI     G_0182, R2                      ; 5233   0282 0182
        SLR     R2,     2                       ; 5235   0066
        SLR     R2,     1                       ; 5236   0062
        ANDI    #$0005, R2                      ; 5237   03BA 0005
        ADDR    R2,     R0                      ; 5239   00D0
        MVO     R0,     G_017D                  ; 523A   0240 017D
        ADD     G_017E, R0                      ; 523C   02C0 017E
        BEQ     L_5284                          ; 523E   0204 0044

        JSR     R5,     L_5251                  ; 5240   0004 0150 0251

        MVI     G_017D, R0                      ; 5243   0280 017D
        CMPI    #$0003, R0                      ; 5245   0378 0003
        BLE     L_5284                          ; 5247   0206 003B

        SLR     R0,     2                       ; 5249   0064
        CMPI    #$0002, R0                      ; 524A   0378 0002
        BGT     L_540D                          ; 524C   020E 01BF

        SLR     R0,     1                       ; 524E   0060
        B       L_52AD                          ; 524F   0200 005C

L_5251:
        PSHR    R5                              ; 5251   0275
        MVII    #$0001, R1                      ; 5252   02B9 0001
        B       L_5258                          ; 5254   0200 0002

L_5256:
        PSHR    R5                              ; 5256   0275
        CLRR    R1                              ; 5257   01C9
L_5258:
        MVO     R1,     G_017E                  ; 5258   0241 017E
        CLRR    R1                              ; 525A   01C9
        MVO     R1,     G_018D                  ; 525B   0241 018D
        INCR    R1                              ; 525D   0009
L_525E:
        PSHR    R1                              ; 525E   0271
        TSTR    R2                              ; 525F   0092
        BNEQ    L_527F                          ; 5260   020C 001D

        MVII    #$0189, R5                      ; 5262   02BD 0189
        ADDR    R1,     R5                      ; 5264   00CD
        ADDR    R1,     R5                      ; 5265   00CD
        CLRR    R3                              ; 5266   01DB
        MVO@    R3,     R5                      ; 5267   026B
        MVO@    R3,     R5                      ; 5268   026B
        MOVR    R1,     R0                      ; 5269   0088
        SLL     R0,     2                       ; 526A   004C
        MVI     G_017E, R2                      ; 526B   0282 017E
        TSTR    R2                              ; 526D   0092
        BNEQ    L_5285                          ; 526E   020C 0015

        MVII    #$002C, R2                      ; 5270   02BA 002C
        TSTR    R1                              ; 5272   0089
        BEQ     L_5277                          ; 5273   0204 0002

        MVII    #$0075, R2                      ; 5275   02BA 0075
L_5277:
        SWAP    R2,     1                       ; 5277   0042
        ADDI    #$003B, R2                      ; 5278   02FA 003B
L_527A:
        MVII    #$0010, R3                      ; 527A   02BB 0010

        JSR     R5,     .EXEC.9B9               ; 527C   0004 0118 01B9

L_527F:
        PULR    R1                              ; 527F   02B1
        MOVR    R4,     R2                      ; 5280   00A2
        DECR    R1                              ; 5281   0011
        BEQ     L_525E                          ; 5282   0224 0025
L_5284:
        PULR    R7                              ; 5284   02B7

L_5285:
        MVII    #$0032, R2                      ; 5285   02BA 0032
        MVI     G_0320, R3                      ; 5287   0283 0320
        TSTR    R1                              ; 5289   0089
        BEQ     L_5290                          ; 528A   0204 0004

        MVII    #$006E, R2                      ; 528C   02BA 006E
        MVI     G_0340, R3                      ; 528E   0283 0340
L_5290:
        SWAP    R2,     1                       ; 5290   0042
        SWAP    R3,     1                       ; 5291   0043
        ANDI    #$00FF, R3                      ; 5292   03BB 00FF
        ADDR    R3,     R2                      ; 5294   00DA
        B       L_527A                          ; 5295   0220 001C

L_5297:
        PSHR    R5                              ; 5297   0275
        CLRR    R3                              ; 5298   01DB
        MVO     R3,     G_01B0                  ; 5299   0243 01B0
        MVO     R3,     G_01B1                  ; 529B   0243 01B1
        MVII    #$016D, R3                      ; 529D   02BB 016D
        MVI@    R3,     R2                      ; 529F   029A

        JSR     R5,     L_541B                  ; 52A0   0004 0154 001B

        CMPI    #$0009, R2                      ; 52A3   037A 0009
        BLT     L_52F1                          ; 52A5   0205 004A

        MVI     G_01B2, R0                      ; 52A7   0280 01B2
        TSTR    R0                              ; 52A9   0080
        BEQ     L_540D                          ; 52AA   0204 0161

        SLR     R0,     1                       ; 52AC   0060
L_52AD:
        MVII    #$0021, R1                      ; 52AD   02B9 0021

        JSR     R5,     L_58C5                  ; 52AF   0004 0158 00C5

        ADDI    #$01AE, R0                      ; 52B2   02F8 01AE
        MOVR    R0,     R3                      ; 52B4   0083
        MVI@    R3,     R3                      ; 52B5   029B
        MVII    #$0207, R4                      ; 52B6   02BC 0207

        JSR     R5,     X_PRINT_R5              ; 52B8   0004 0118 007B
        STRING  "WINNER"                        ; 52BB  
        DECLE   $0000                           ; 52C1   0000
L_52C2:
        MVII    #$000A, R0                      ; 52C2   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 52C4   0004 011C 02D5

L_52C7:
        MVII    #$0001, R1                      ; 52C7   02B9 0001
        MVO     R1,     G_017C                  ; 52C9   0241 017C
        SDBD                                    ; 52CB   0001
        MVII    #$1906, R1                      ; 52CC   02B9 0006 0019
        MVO     R1,     G_035D                  ; 52CF   0241 035D
        INCR    R7                              ; 52D1   000F

L_52D2:
        PSHR    R5                              ; 52D2   0275
L_52D3:
        SDBD                                    ; 52D3   0001
        MVII    #$5020, R1                      ; 52D4   02B9 0020 0050
        MVII    #$0003, R2                      ; 52D7   02BA 0003

L_52D9:
        JSR     R5,     X_TIMER_STOP            ; 52D9   0004 0118 0038

        ADDI    #$0004, R1                      ; 52DC   02F9 0004
        DECR    R2                              ; 52DE   0012
        BNEQ    L_52D9                          ; 52DF   022C 0007

        MVII    #$0189, R5                      ; 52E1   02BD 0189
        MVO@    R2,     R5                      ; 52E3   026A
        MVO@    R2,     R5                      ; 52E4   026A
        MVII    #$0080, R1                      ; 52E5   02B9 0080
        MVO@    R2,     R5                      ; 52E7   026A
        MVO@    R2,     R5                      ; 52E8   026A
        MVO     R1,     G_0181                  ; 52E9   0241 0181
        MVO     R1,     G_0182                  ; 52EB   0241 0182
        MVII    #$0004, R1                      ; 52ED   02B9 0004
        MVO     R1,     G_01A6                  ; 52EF   0241 01A6
L_52F1:
        PULR    R7                              ; 52F1   02B7

L_52F2:
        PSHR    R5                              ; 52F2   0275
        MVII    #$01AA, R3                      ; 52F3   02BB 01AA
        MVI@    R3,     R2                      ; 52F5   029A
        INCR    R2                              ; 52F6   000A
        MVO@    R2,     R3                      ; 52F7   025A
        INCR    R3                              ; 52F8   000B
        MVI@    R3,     R2                      ; 52F9   029A
        INCR    R2                              ; 52FA   000A
        MVO@    R2,     R3                      ; 52FB   025A
        MVII    #$0001, R2                      ; 52FC   02BA 0001
L_52FE:
        MVII    #$0003, R0                      ; 52FE   02B8 0003

        JSR     R5,     X_RAND2                 ; 5300   0004 0114 029E

        XORI    #$0001, R0                      ; 5303   03F8 0001
        NEGR    R0                              ; 5305   0020
        MOVR    R0,     R1                      ; 5306   0081
        MVII    #$017A, R3                      ; 5307   02BB 017A
        ADDR    R2,     R3                      ; 5309   00D3
        ADD@    R3,     R1                      ; 530A   02D9
        MOVR    R2,     R0                      ; 530B   0090

        JSR     R5,     L_59FD                  ; 530C   0004 0158 01FD

        MVO@    R1,     R3                      ; 530F   0259
        MOVR    R2,     R4                      ; 5310   0094
        SLL     R0,     2                       ; 5311   004C
        ADDR    R0,     R4                      ; 5312   00C4
        ADDI    #$0191, R4                      ; 5313   02FC 0191
        MVI@    R4,     R0                      ; 5315   02A0
        ADDI    #$0004, R0                      ; 5316   02F8 0004

        JSR     R5,     X_RAND2                 ; 5318   0004 0114 029E

        INCR    R0                              ; 531B   0008
        SUBI    #$0004, R3                      ; 531C   033B 0004
        ADD@    R3,     R0                      ; 531E   02D8
        CMPR    R1,     R0                      ; 531F   0148
        BLE     L_5323                          ; 5320   0206 0001

        MOVR    R1,     R0                      ; 5322   0088
L_5323:
        MVO@    R0,     R3                      ; 5323   0258
        DECR    R2                              ; 5324   0012
        BEQ     L_52FE                          ; 5325   0224 0028

        MVII    #$0170, R3                      ; 5327   02BB 0170

        JSR     R5,     L_542F                  ; 5329   0004 0154 002F

        MOVR    R1,     R2                      ; 532C   008A
        MOVR    R3,     R4                      ; 532D   009C

        JSR     R5,     L_5423                  ; 532E   0004 0154 0023

        MVII    #$0173, R4                      ; 5331   02BC 0173
        DECR    R1                              ; 5333   0011

        JSR     R5,     L_5425                  ; 5334   0004 0154 0025

        TSTR    R2                              ; 5337   0092
        BNEQ    L_5346                          ; 5338   020C 000C

        MVII    #$003C, R0                      ; 533A   02B8 003C
        MVO     R0,     G_0170                  ; 533C   0240 0170
        MVII    #$0173, R3                      ; 533E   02BB 0173

        JSR     R5,     L_542F                  ; 5340   0004 0154 002F

        TSTR    R1                              ; 5343   0089
        BMI     L_53D8                          ; 5344   020B 0092
L_5346:
        PULR    R7                              ; 5346   02B7

        PSHR    R5                              ; 5347   0275
        CLRR    R2                              ; 5348   01D2
        CMP     G_017C, R2                      ; 5349   0342 017C
        BEQ     L_53B8                          ; 534B   0204 006B

        MVII    #$01AC, R3                      ; 534D   02BB 01AC
        MOVR    R3,     R4                      ; 534F   009C
        ADDR    R1,     R3                      ; 5350   00CB
        INCR    R2                              ; 5351   000A
        MVO@    R2,     R3                      ; 5352   025A
        MVI@    R4,     R3                      ; 5353   02A3
        CMP@    R4,     R3                      ; 5354   0363
        BNEQ    L_5346                          ; 5355   022C 0010

        MVII    #$0003, R3                      ; 5357   02BB 0003
        MVO     R3,     G_01B2                  ; 5359   0243 01B2
        MVO     R2,     G_0173                  ; 535B   0242 0173
        MVII    #$001F, R1                      ; 535D   02B9 001F
        MVO     R1,     G_0170                  ; 535F   0241 0170
        MVII    #$016A, R3                      ; 5361   02BB 016A

        JSR     R5,     L_541B                  ; 5363   0004 0154 001B

        MVII    #$0080, R0                      ; 5366   02B8 0080
        MVI     G_016A, R1                      ; 5368   0281 016A
L_536A:
        DECR    R1                              ; 536A   0011
        BEQ     L_5370                          ; 536B   0204 0003

        SLR     R0,     1                       ; 536D   0060
        B       L_536A                          ; 536E   0220 0005

L_5370:
        ADDI    #$0040, R0                      ; 5370   02F8 0040
        INCR    R1                              ; 5372   0009
L_5373:
        MVII    #$0176, R3                      ; 5373   02BB 0176
        ADDR    R1,     R3                      ; 5375   00CB
        MVI@    R3,     R4                      ; 5376   029C
        ADDR    R0,     R4                      ; 5377   00C4
        CMPI    #$00FF, R4                      ; 5378   037C 00FF
        BLE     L_537E                          ; 537A   0206 0002

        MVII    #$00FF, R4                      ; 537C   02BC 00FF
L_537E:
        MVO@    R4,     R3                      ; 537E   025C
        ADDI    #$0004, R3                      ; 537F   02FB 0004
        MVO@    R4,     R3                      ; 5381   025C
        DECR    R1                              ; 5382   0011
        BEQ     L_5373                          ; 5383   0224 0011

L_5385:
        JSR     R5,     L_55D7                  ; 5385   0004 0154 01D7

        CLRR    R0                              ; 5388   01C0
        MVO     R0,     G_017E                  ; 5389   0240 017E
        MVO     R0,     G_01AA                  ; 538B   0240 01AA
        MVO     R0,     G_01AB                  ; 538D   0240 01AB
        CLRR    R2                              ; 538F   01D2
        MVO     R0,     G_017C                  ; 5390   0240 017C
        MVO     R0,     G_01A6                  ; 5392   0240 01A6
        MVO     R0,     G_01A4                  ; 5394   0240 01A4
        MVO     R0,     G_01A5                  ; 5396   0240 01A5
        DECR    R0                              ; 5398   0010
        MVII    #$016D, R3                      ; 5399   02BB 016D
        MVO@    R0,     R3                      ; 539B   0258

        JSR     R5,     L_541B                  ; 539C   0004 0154 001B
        JSR     R5,     L_51CE                  ; 539F   0004 0150 01CE

        INCR    R2                              ; 53A2   000A

        JSR     R5,     L_51CE                  ; 53A3   0004 0150 01CE

        SDBD                                    ; 53A6   0001
        MVII    #$5020, R1                      ; 53A7   02B9 0020 0050

        JSR     R5,     X_TIMER_START           ; 53AA   0004 0118 0044

        ADDI    #$0008, R1                      ; 53AD   02F9 0008

        JSR     R5,     X_TIMER_START           ; 53AF   0004 0118 0044

        SDBD                                    ; 53B2   0001
        MVII    #$593C, R1                      ; 53B3   02B9 003C 0059
        MVO     R1,     G_035D                  ; 53B6   0241 035D
L_53B8:
        PULR    R7                              ; 53B8   02B7

        MVII    #$0321, R1                      ; 53B9   02B9 0321
        B       L_53BF                          ; 53BB   0200 0002

        MVII    #$0341, R1                      ; 53BD   02B9 0341
L_53BF:
        CLRR    R0                              ; 53BF   01C0
        MVO@    R0,     R1                      ; 53C0   0248
        PSHR    R5                              ; 53C1   0275
        MVI     G_018D, R0                      ; 53C2   0280 018D
        INCR    R0                              ; 53C4   0008
        ANDI    #$0001, R0                      ; 53C5   03B8 0001
        MVO     R0,     G_018D                  ; 53C7   0240 018D
        BNEQ    L_53B8                          ; 53C9   022C 0012

        CMP     G_017E, R0                      ; 53CB   0340 017E
        BNEQ    L_5385                          ; 53CD   022C 0049

        MVI     G_016A, R1                      ; 53CF   0281 016A
        CMPI    #$000F, R1                      ; 53D1   0379 000F
        BEQ     L_53F7                          ; 53D3   0204 0022
        J       L_508F                          ; 53D5   0004 0350 008F

L_53D8:
        MVO     R2,     G_0173                  ; 53D8   0242 0173
        INCR    R2                              ; 53DA   000A
        MVO     R2,     G_0170                  ; 53DB   0242 0170
        MVI     G_017D, R1                      ; 53DD   0281 017D
        ANDI    #$0003, R1                      ; 53DF   03B9 0003
        BNEQ    L_53B8                          ; 53E1   022C 002A

        MVO     R2,     G_017C                  ; 53E3   0242 017C

        JSR     R5,     L_55D7                  ; 53E5   0004 0154 01D7

        CLRR    R2                              ; 53E8   01D2
        MVO     R2,     G_015E                  ; 53E9   0242 015E
        MVO     R2,     G_0161                  ; 53EB   0242 0161
        CLRR    R4                              ; 53ED   01E4
        MVO     R2,     G_01AC                  ; 53EE   0242 01AC
        MVO     R2,     G_01AD                  ; 53F0   0242 01AD

        JSR     R5,     L_5256                  ; 53F2   0004 0150 0256

        B       L_52C7                          ; 53F5   0220 012F

L_53F7:
        MVI     G_0167, R2                      ; 53F7   0282 0167
        CMP     G_0164, R2                      ; 53F9   0342 0164
        BEQ     L_540A                          ; 53FB   0204 000D
        BGT     L_5400                          ; 53FD   020E 0001

        INCR    R0                              ; 53FF   0008
L_5400:
        MVII    #$001F, R1                      ; 5400   02B9 001F

        JSR     R5,     L_58C5                  ; 5402   0004 0158 00C5

        NEGR    R0                              ; 5405   0020
        INCR    R0                              ; 5406   0008
        PULR    R5                              ; 5407   02B5
        B       L_52AD                          ; 5408   0220 015C

L_540A:
        JSR     R5,     L_508E                  ; 540A   0004 0150 008E

L_540D:
        MVII    #$0007, R3                      ; 540D   02BB 0007
        MVII    #$0208, R4                      ; 540F   02BC 0208

        JSR     R5,     X_PRINT_R5              ; 5411   0004 0118 007B
        STRING  "TIED"                          ; 5414   0054 0049 0045 0044
        DECLE   $0000                           ; 5418   0000

        B       L_52C2                          ; 5419   0220 0158

L_541B:
        PSHR    R5                              ; 541B   0275
        MVII    #$0001, R0                      ; 541C   02B8 0001

        JSR     R5,     L_5431                  ; 541E   0004 0154 0031

        MOVR    R3,     R4                      ; 5421   009C
        PULR    R5                              ; 5422   02B5
L_5423:
        MVII    #$0002, R1                      ; 5423   02B9 0002
L_5425:
        MVI@    R4,     R0                      ; 5425   02A0
        MVI@    R4,     R3                      ; 5426   02A3
L_5427:
        PSHR    R5                              ; 5427   0275
        MVI@    R4,     R4                      ; 5428   02A4
        ADDI    #$0200, R4                      ; 5429   02FC 0200

        JSR     R5,     X_PRNUM_ZRO             ; 542B   0004 0118 00AD

        PULR    R7                              ; 542E   02B7

L_542F:
        CLRR    R0                              ; 542F   01C0
        DECR    R0                              ; 5430   0010
L_5431:
        MVI@    R3,     R1                      ; 5431   0299
        ADDR    R0,     R1                      ; 5432   00C1
        MVO@    R1,     R3                      ; 5433   0259
        MOVR    R5,     R7                      ; 5434   00AF

        DECLE   $0000,  $0000                   ; 5435   0000 0000

        ADDR    R0,     R7                      ; 5437   00C7

        EIS                                     ; 5438   0002
        ADDR    R0,     R7                      ; 5439   00C7

        DECLE   $0001,  $00CB,  $0001,  $0034   ; 543A   0001 00CB 0001 0034
        DECLE   $000E,  $0034,  $000D,  $0038   ; 543E   000E 0034 000D 0038
        DECLE   $000D,  $0055,  $0005           ; 5442   000D 0055 0005

        NEGR    R4                              ; 5445   0024
        DECR    R0                              ; 5446   0010
        NEGR    R1                              ; 5447   0021
        NEGR    R1                              ; 5448   0021
        INCR    R5                              ; 5449   000D
        COMR    R6                              ; 544A   001E
        ADDR    R3,     R0                      ; 544B   00D8
        MVII    #$0001, R3                      ; 544C   02BB 0001
        B       L_5452                          ; 544E   0200 0002

        ADDR    R3,     R0                      ; 5450   00D8
        CLRR    R3                              ; 5451   01DB
L_5452:
        PSHR    R5                              ; 5452   0275
        MVI     G_017D, R4                      ; 5453   0284 017D
        TSTR    R4                              ; 5455   00A4
        BNEQ    L_5580                          ; 5456   020C 0128

        CMPI    #$000A, R0                      ; 5458   0378 000A
        BEQ     L_5580                          ; 545A   0204 0124

        MVII    #$0181, R2                      ; 545C   02BA 0181
        ADDR    R3,     R2                      ; 545E   00DA
        MVI@    R2,     R0                      ; 545F   0290
        ANDI    #$0087, R0                      ; 5460   03B8 0087
        BNEQ    L_5466                          ; 5462   020C 0002

        ADDI    #$0002, R2                      ; 5464   02FA 0002
L_5466:
        MVI@    R2,     R0                      ; 5466   0290
        SWAP    R0,     2                       ; 5467   0044
        BMI     L_5580                          ; 5468   020B 0116

        ADDI    #$0080, R0                      ; 546A   02F8 0080
        MVO@    R0,     R2                      ; 546C   0250
        ANDI    #$0007, R0                      ; 546D   03B8 0007
        BEQ     L_5580                          ; 546F   0204 010F

        MVII    #$0182, R2                      ; 5471   02BA 0182
        SUBR    R3,     R2                      ; 5473   011A
        MVI@    R2,     R4                      ; 5474   0294
        ANDI    #$00BF, R4                      ; 5475   03BC 00BF
        ADDI    #$0040, R4                      ; 5477   02FC 0040
        MVO@    R4,     R2                      ; 5479   0254
        ANDI    #$0007, R4                      ; 547A   03BC 0007
        ADDR    R4,     R4                      ; 547C   00E4
        SDBD                                    ; 547D   0001
        ADDI    #$5435, R4                      ; 547E   02FC 0035 0054
        SDBD                                    ; 5481   0001
        MVI@    R4,     R1                      ; 5482   02A1
        MOVR    R0,     R2                      ; 5483   0082
L_5484:
        DECR    R0                              ; 5484   0010
        BEQ     L_548A                          ; 5485   0204 0003

        SLR     R1,     2                       ; 5487   0065
        B       L_5484                          ; 5488   0220 0005

L_548A:
        ANDI    #$0003, R1                      ; 548A   03B9 0003
        SLL     R1,     2                       ; 548C   004D
        MVII    #$000D, R0                      ; 548D   02B8 000D

        JSR     R5,     X_RAND2                 ; 548F   0004 0114 029E

        CMPR    R1,     R0                      ; 5492   0148
        BGE     L_5539                          ; 5493   020D 00A4

L_5495:
        MOVR    R3,     R1                      ; 5495   0099
        SLL     R1,     2                       ; 5496   004D
        ADDR    R3,     R1                      ; 5497   00D9
        NEGR    R1                              ; 5498   0021
        ADDI    #$0193, R1                      ; 5499   02F9 0193
        MVI@    R1,     R1                      ; 549B   0289
        MVII    #$0004, R0                      ; 549C   02B8 0004

        JSR     R5,     X_RAND2                 ; 549E   0004 0114 029E

        INCR    R0                              ; 54A1   0008
        CMPR    R1,     R0                      ; 54A2   0148
        BLE     L_555C                          ; 54A3   0206 00B7

        MVII    #$01AB, R1                      ; 54A5   02B9 01AB
        SUBR    R3,     R1                      ; 54A7   0119
        CLRR    R0                              ; 54A8   01C0
        MVO     R0,     G_01A7                  ; 54A9   0240 01A7
        MVO@    R0,     R1                      ; 54AB   0248
        MVII    #$0027, R4                      ; 54AC   02BC 0027
        DECR    R2                              ; 54AE   0012
        BEQ     L_54B8                          ; 54AF   0204 0007

        CMPI    #$0003, R2                      ; 54B1   037A 0003
        BEQ     L_54B8                          ; 54B3   0204 0003

        CLRR    R4                              ; 54B5   01E4
        B       L_54C4                          ; 54B6   0200 000C

L_54B8:
        MVII    #$019C, R5                      ; 54B8   02BD 019C
        SUBR    R3,     R5                      ; 54BA   011D
        SUBR    R3,     R5                      ; 54BB   011D
        SDBD                                    ; 54BC   0001
        MVI@    R5,     R1                      ; 54BD   02A9
        SDBD                                    ; 54BE   0001
        CMPI    #$5767, R1                      ; 54BF   0379 0067 0057
        BEQ     L_555C                          ; 54C2   0204 0098

L_54C4:
        INCR    R0                              ; 54C4   0008
        PSHR    R3                              ; 54C5   0273
        PSHR    R2                              ; 54C6   0272
        MOVR    R3,     R2                      ; 54C7   009A
        PSHR    R4                              ; 54C8   0274

        JSR     R5,     L_51CF                  ; 54C9   0004 0150 01CF

        PULR    R4                              ; 54CC   02B4
        PULR    R2                              ; 54CD   02B2
        SDBD                                    ; 54CE   0001
        ADDI    #$5445, R2                      ; 54CF   02FA 0045 0054
        MVI@    R2,     R3                      ; 54D2   0293
        MVII    #$000C, R0                      ; 54D3   02B8 000C

        JSR     R5,     X_RAND2                 ; 54D5   0004 0114 029E

        SUBI    #$0004, R0                      ; 54D8   0338 0004
        ADDR    R0,     R3                      ; 54DA   00C3
        CMPI    #$0024, R3                      ; 54DB   037B 0024
        BLT     L_54E1                          ; 54DD   0205 0002

        MVII    #$0016, R4                      ; 54DF   02BC 0016
L_54E1:
        MVII    #$0176, R2                      ; 54E1   02BA 0176
        PULR    R0                              ; 54E3   02B0
        PSHR    R0                              ; 54E4   0270
        PSHR    R3                              ; 54E5   0273
        MOVR    R0,     R3                      ; 54E6   0083
        SLL     R3,     2                       ; 54E7   004F
        ADDR    R0,     R3                      ; 54E8   00C3
        ADDI    #$018F, R3                      ; 54E9   02FB 018F
        MVI@    R3,     R1                      ; 54EB   0299
        SLL     R1,     2                       ; 54EC   004D
        SUBI    #$0004, R1                      ; 54ED   0339 0004
        ADD@    R6,     R1                      ; 54EF   02F1
        BPL     L_54F3                          ; 54F0   0203 0001

        CLRR    R1                              ; 54F2   01C9
L_54F3:
        MVO     R1,     G_0187                  ; 54F3   0241 0187
        NEGR    R0                              ; 54F5   0020
        INCR    R0                              ; 54F6   0008
        ADDR    R0,     R2                      ; 54F7   00C2
        MVI@    R2,     R5                      ; 54F8   0295
        SUBR    R1,     R5                      ; 54F9   010D
        BPL     L_54FD                          ; 54FA   0203 0001

        CLRR    R5                              ; 54FC   01ED
L_54FD:
        MVO@    R5,     R2                      ; 54FD   0255
        SLR     R1,     1                       ; 54FE   0061
        MVII    #$0185, R3                      ; 54FF   02BB 0185
        ADDR    R0,     R3                      ; 5501   00C3
        MVI@    R3,     R3                      ; 5502   029B
        DECR    R3                              ; 5503   0013
        BEQ     L_550A                          ; 5504   0204 0004

        CMPI    #$0032, R5                      ; 5506   037D 0032
        BLE     L_5581                          ; 5508   0206 0077

L_550A:
        CMPI    #$0020, R5                      ; 550A   037D 0020
        BLE     L_5581                          ; 550C   0206 0073

        MVII    #$0010, R3                      ; 550E   02BB 0010
L_5510:
        MVII    #$0178, R2                      ; 5510   02BA 0178
        ADDR    R0,     R2                      ; 5512   00C2
        MVO@    R1,     R2                      ; 5513   0251
        MVII    #$0181, R1                      ; 5514   02B9 0181
        ADDR    R0,     R1                      ; 5516   00C1
        MVI@    R1,     R5                      ; 5517   028D
        ANDI    #$00C0, R5                      ; 5518   03BD 00C0
        ADDR    R5,     R3                      ; 551A   00EB
        MVO@    R3,     R1                      ; 551B   024B
        SUBI    #$0002, R1                      ; 551C   0339 0002
        CLRR    R3                              ; 551E   01DB
        MVO@    R3,     R1                      ; 551F   024B
        MOVR    R4,     R1                      ; 5520   00A1

        JSR     R5,     L_58C5                  ; 5521   0004 0158 00C5
        JSR     R5,     L_55A7                  ; 5524   0004 0154 01A7

        MVI     G_0187, R0                      ; 5527   0280 0187
        SLL     R0,     2                       ; 5529   004C
        CMPI    #$0080, R0                      ; 552A   0378 0080
        BLT     L_5530                          ; 552C   0205 0002

        MVII    #$007F, R0                      ; 552E   02B8 007F
L_5530:
        PULR    R3                              ; 5530   02B3
        MVII    #$01B4, R2                      ; 5531   02BA 01B4
        SUBR    R3,     R2                      ; 5533   011A
        MVII    #$0002, R4                      ; 5534   02BC 0002
        MVO@    R4,     R2                      ; 5536   0254
        B       L_5575                          ; 5537   0200 003C

L_5539:
        MOVR    R3,     R0                      ; 5539   0098
        PSHR    R3                              ; 553A   0273
        SLL     R3,     2                       ; 553B   004F
        ADDR    R0,     R3                      ; 553C   00C3
        NEGR    R3                              ; 553D   0023
        ADDI    #$0197, R3                      ; 553E   02FB 0197
        MVI@    R3,     R0                      ; 5540   0298
        PULR    R3                              ; 5541   02B3
        SLL     R0,     2                       ; 5542   004C
        ADDI    #$0010, R0                      ; 5543   02F8 0010
        MVII    #$017F, R1                      ; 5545   02B9 017F
        ADDR    R3,     R1                      ; 5547   00D9
        MVI@    R1,     R1                      ; 5548   0289
        TSTR    R1                              ; 5549   0089
        BEQ     L_554F                          ; 554A   0204 0003

        SLR     R0,     2                       ; 554C   0064
        ADDI    #$0002, R0                      ; 554D   02F8 0002
L_554F:
        MVII    #$01AB, R1                      ; 554F   02B9 01AB
        SUBR    R3,     R1                      ; 5551   0119
        SUB@    R1,     R0                      ; 5552   0308
        BPL     L_5556                          ; 5553   0203 0001

        CLRR    R0                              ; 5555   01C0

L_5556:
        JSR     R5,     X_RAND2                 ; 5556   0004 0114 029E

        TSTR    R0                              ; 5559   0080
        BEQ     L_5495                          ; 555A   0224 00C6

L_555C:
        MOVR    R3,     R0                      ; 555C   0098
        NEGR    R0                              ; 555D   0020
        INCR    R0                              ; 555E   0008
        MVII    #$0177, R2                      ; 555F   02BA 0177
        SUBR    R3,     R2                      ; 5561   011A
        MVI@    R2,     R1                      ; 5562   0291
        MVII    #$0186, R4                      ; 5563   02BC 0186
        SUBR    R3,     R4                      ; 5565   011C
        MVI@    R4,     R4                      ; 5566   02A4
        SUBR    R4,     R1                      ; 5567   0121

        JSR     R5,     L_59FD                  ; 5568   0004 0158 01FD

        MVO@    R1,     R2                      ; 556B   0251
        PSHR    R3                              ; 556C   0273

        JSR     R5,     L_55BC                  ; 556D   0004 0154 01BC

        PULR    R3                              ; 5570   02B3
        MVII    #$001E, R0                      ; 5571   02B8 001E
        INCR    R7                              ; 5573   000F

L_5574:
        PSHR    R5                              ; 5574   0275
L_5575:
        MVII    #$018B, R4                      ; 5575   02BC 018B
        SUBR    R3,     R4                      ; 5577   011C
        SUBR    R3,     R4                      ; 5578   011C
        TSTR    R3                              ; 5579   009B
        BEQ     L_557D                          ; 557A   0204 0001

        NEGR    R0                              ; 557C   0020
L_557D:
        MVO@    R0,     R4                      ; 557D   0260
        CLRR    R0                              ; 557E   01C0
        MVO@    R0,     R4                      ; 557F   0260
L_5580:
        PULR    R7                              ; 5580   02B7

L_5581:
        PSHR    R1                              ; 5581   0271
        CMPI    #$0010, R5                      ; 5582   037D 0010
        BLE     L_55A1                          ; 5584   0206 001B

        PSHR    R0                              ; 5586   0270
        INCR    R0                              ; 5587   0008
        MVI     G_01B2, R1                      ; 5588   0281 01B2
        SUBR    R0,     R1                      ; 558A   0101
        MVO     R1,     G_01B2                  ; 558B   0241 01B2
        SDBD                                    ; 558D   0001
        MVII    #$5024, R1                      ; 558E   02B9 0024 0050

        JSR     R5,     X_TIMER_START           ; 5591   0004 0118 0044

        MVII    #$0032, R0                      ; 5594   02B8 0032

        JSR     R5,     X_PLAY_CHEER1           ; 5596   0004 011C 02D5

        PULR    R0                              ; 5599   02B0
        MVII    #$0011, R4                      ; 559A   02BC 0011
        MVII    #$0018, R3                      ; 559C   02BB 0018
L_559E:
        PULR    R1                              ; 559E   02B1
        B       L_5510                          ; 559F   0220 0090

L_55A1:
        MVII    #$000A, R4                      ; 55A1   02BC 000A
        MVII    #$0020, R3                      ; 55A3   02BB 0020
        B       L_559E                          ; 55A5   0220 0008

L_55A7:
        PSHR    R5                              ; 55A7   0275

        JSR     R5,     X_PLAY_SFX2             ; 55A8   0004 0118 03BE
        DECLE   $0070                           ; 55AB  SFX prio
        DECLE   $01C9                           ; 55AC  SFX data
        DECLE   $03C0,  $0178                   ; 55AD  SFX data
        DECLE   $0348,  $017B                   ; 55AF  SFX data
        DECLE   $0077,  $00E8,  $0055           ; 55B1  SFX data
        DECLE   $0312                           ; 55B4  SFX data
        DECLE   $031A                           ; 55B5  SFX data
        DECLE   $0001,  $0103                   ; 55B6  SFX data
        DECLE   $00EB                           ; 55B8  SFX data
        DECLE   $0005                           ; 55B9  SFX data
        DECLE   $0025                           ; 55BA  SFX data
        DECLE   $03CF                           ; 55BB  SFX end

L_55BC:
        PSHR    R5                              ; 55BC   0275

        JSR     R5,     X_PLAY_SFX2             ; 55BD   0004 0118 03BE
        DECLE   $0060                           ; 55C0  SFX prio
        DECLE   $0050,  $0000                   ; 55C1  SFX data
        DECLE   $0058,  $0100                   ; 55C3  SFX data
        DECLE   $000C,  $0200                   ; 55C5  SFX data
        DECLE   $01C9                           ; 55C7  SFX data
        DECLE   $000B                           ; 55C8  SFX data
        DECLE   $03CF                           ; 55C9  SFX end

L_55CA:
        PSHR    R5                              ; 55CA   0275

        JSR     R5,     X_PLAY_SFX1             ; 55CB   0004 0118 03BB
        DECLE   $0040,  $0030                   ; 55CE  SFX data
        DECLE   $000C,  $002A                   ; 55D0  SFX data
        DECLE   $03E9                           ; 55D2  SFX data
        DECLE   $020B                           ; 55D3  SFX data
        DECLE   $008F,  $0011                   ; 55D4  SFX data
        DECLE   $02CF                           ; 55D6  SFX end

L_55D7:
        PSHR    R5                              ; 55D7   0275

        JSR     R5,     X_PLAY_SFX1             ; 55D8   0004 0118 03BB
        DECLE   $0040,  $0030                   ; 55DB  SFX data
        DECLE   $000C,  $002A                   ; 55DD  SFX data
        DECLE   $03E9                           ; 55DF  SFX data
        DECLE   $020B                           ; 55E0  SFX data
        DECLE   $008F,  $0011                   ; 55E1  SFX data
        DECLE   $0005                           ; 55E3  SFX data
        DECLE   $038D                           ; 55E4  SFX data
        DECLE   $01F9                           ; 55E5  SFX data
        DECLE   $02D5                           ; 55E6  SFX data
        DECLE   $03CF                           ; 55E7  SFX end

UC_55E8:
        MVI     G_0187, R0                      ; 55E8  SLIB UCALL target
        SUBI    #$0014, R0                      ; 55EA   0338 0014
        SAR     R0,     2                       ; 55EC   006C
        ADDI    #$000A, R0                      ; 55ED   02F8 000A
        ADDI    #$000B, R3                      ; 55EF   02FB 000B
        MVO@    R0,     R3                      ; 55F1   0258
        INCR    R3                              ; 55F2   000B
        MVO@    R0,     R3                      ; 55F3   0258
        SLL     R0,     2                       ; 55F4   004C
        SLL     R0,     1                       ; 55F5   0048
        MVII    #$0156, R5                      ; 55F6   02BD 0156
        MVO@    R0,     R5                      ; 55F8   0268
        MVO@    R0,     R5                      ; 55F9   0268
        MVI@    R5,     R0                      ; 55FA   02A8
        ADD     G_0187, R0                      ; 55FB   02C0 0187
        MVO     R0,     G_0188                  ; 55FD   0240 0188
        PULR    R7                              ; 55FF   02B7

        DECLE   $0300,  $0000,  $00B9,  $0053   ; 5600   0300 0000 00B9 0053
        DECLE   $0000,  $0000,  $0004,  $0250   ; 5604   0000 0000 0004 0250
        DECLE   $0154,  $034B,  $0154,  $0300   ; 5608   0154 034B 0154 0300
        DECLE   $0000,  $00BD,  $0053,  $0000   ; 560C   0000 00BD 0053 0000
        DECLE   $0000                           ; 5610   0000

        JSR     R6,     L_5154                  ; 5611   0004 0250 0154

        CMP@    R1,     R3                      ; 5614   034B
        CMPR    R2,     R4                      ; 5615   0154
L_5616:
        PSHR    R5                              ; 5616   0275
        MVII    #$0040, R0                      ; 5617   02B8 0040
        MVII    #$031D, R4                      ; 5619   02BC 031D

        JSR     R5,     X_FILL_ZERO             ; 561B   0004 0114 0338

        MVII    #$0001, R5                      ; 561E   02BD 0001
        SDBD                                    ; 5620   0001
        MVII    #$3AC0, R0                      ; 5621   02B8 00C0 003A
        ADD     G_01AE, R0                      ; 5624   02C0 01AE
        SDBD                                    ; 5626   0001
        MVII    #$5600, R1                      ; 5627   02B9 0000 0056
        MVII    #$002C, R2                      ; 562A   02BA 002C
        SWAP    R2,     1                       ; 562C   0042
        MVII    #$003B, R3                      ; 562D   02BB 003B
        SWAP    R3,     1                       ; 562F   0043
        MVII    #$031D, R4                      ; 5630   02BC 031D
L_5632:
        PSHR    R5                              ; 5632   0275
        MVII    #$0004, R5                      ; 5633   02BD 0004
L_5635:
        MVO@    R0,     R4                      ; 5635   0260
        MVO@    R1,     R4                      ; 5636   0261
        MVO@    R2,     R4                      ; 5637   0262
        MVO@    R3,     R4                      ; 5638   0263
        ADDI    #$0004, R4                      ; 5639   02FC 0004
        DECR    R5                              ; 563B   0015
        BNEQ    L_5635                          ; 563C   022C 0008

        SDBD                                    ; 563E   0001
        MVII    #$38C0, R0                      ; 563F   02B8 00C0 0038
        ADD     G_01AF, R0                      ; 5642   02C0 01AF
        ADDI    #$000B, R1                      ; 5644   02F9 000B
        MVII    #$0075, R2                      ; 5646   02BA 0075
        SWAP    R2,     1                       ; 5648   0042
        PULR    R5                              ; 5649   02B5
        DECR    R5                              ; 564A   0015
        BEQ     L_5632                          ; 564B   0224 001A
        INCR    R7                              ; 564D   000F

L_564E:
        PSHR    R5                              ; 564E   0275
L_564F:
        CLRR    R0                              ; 564F   01C0
L_5650:
        PSHR    R0                              ; 5650   0270
        MVII    #$031F, R4                      ; 5651   02BC 031F
        SLL     R0,     1                       ; 5653   0048
        MOVR    R0,     R5                      ; 5654   0085
        SLL     R0,     2                       ; 5655   004C
        SLL     R0,     2                       ; 5656   004C
        ADDR    R0,     R4                      ; 5657   00C4
        MVI@    R4,     R1                      ; 5658   02A1
        MVI@    R4,     R2                      ; 5659   02A2
        MVO     R1,     G_0324                  ; 565A   0241 0324
        MVO     R2,     G_032C                  ; 565C   0242 032C
        ADDI    #$0189, R5                      ; 565E   02FD 0189
        MVI@    R5,     R0                      ; 5660   02A8
        SWAP    R0,     1                       ; 5661   0040
        ADD@    R5,     R0                      ; 5662   02E8

        JSR     R5,     .EXEC.477               ; 5663   0004 0114 0077
        DECLE   $02B0,  $0241,  $0334,  $0242   ; 5666   02B0 0241 0334 0242
        DECLE   $033C,  $02BC,  $0001,  $02BB   ; 566A   033C 02BC 0001 02BB
        DECLE   $0185,  $00C3,  $0001           ; 566E   0185 00C3 0001

        CMPI    #$0000, R2                      ; 5671   037A 0000
        SLL     R0,     1                       ; 5673   0048
        BGE     L_5708                          ; 5674   020D 0092

        SDBD                                    ; 5676   0001
        CMPI    #$3200, R2                      ; 5677   037A 0000 0032
        BLE     L_5708                          ; 567A   0206 008C

L_567C:
        CLRR    R5                              ; 567C   01ED
        SDBD                                    ; 567D   0001
        SUBI    #$5100, R1                      ; 567E   0339 0000 0051
        BPL     L_5686                          ; 5681   0203 0003

        MVII    #$0080, R5                      ; 5683   02BD 0080
        NEGR    R1                              ; 5685   0021
L_5686:
        SDBD                                    ; 5686   0001
        SUBI    #$1200, R2                      ; 5687   033A 0000 0012
        CMPR    R1,     R2                      ; 568A   014A
        BLE     L_570E                          ; 568B   0206 0081

        SUBI    #$0300, R2                      ; 568D   033A 0300
        CMPR    R1,     R2                      ; 568F   014A
        BLE     L_5723                          ; 5690   0206 0091

L_5692:
        MVI     G_017D, R2                      ; 5692   0282 017D
        TSTR    R2                              ; 5694   0092
        BNEQ    L_5698                          ; 5695   020C 0001

        MVO@    R4,     R3                      ; 5697   025C
L_5698:
        MVI     G_033C, R3                      ; 5698   0283 033C
        SWAP    R3,     1                       ; 569A   0043
        ANDI    #$00FF, R3                      ; 569B   03BB 00FF
        MVI     G_0334, R2                      ; 569D   0282 0334
        SDBD                                    ; 569F   0001
        ANDI    #$FF00, R2                      ; 56A0   03BA 0000 00FF
        ADDR    R3,     R2                      ; 56A3   00DA
        SDBD                                    ; 56A4   0001
        MVII    #$1606, R4                      ; 56A5   02BC 0006 0016
        MVII    #$033D, R1                      ; 56A8   02B9 033D
        PSHR    R0                              ; 56AA   0270
        SLL     R0,     2                       ; 56AB   004C
        SLL     R0,     2                       ; 56AC   004C
        SLL     R0,     1                       ; 56AD   0048
        SUBR    R0,     R1                      ; 56AE   0101
        PSHR    R1                              ; 56AF   0271

        JSR     R5,     .EXEC.6F7               ; 56B0   0004 0114 02F7

        PULR    R1                              ; 56B3   02B1
        BNC     L_56BA                          ; 56B4   0209 0004

        MVI     G_0324, R3                      ; 56B6   0283 0324
        MVO     R3,     G_0334                  ; 56B8   0243 0334
L_56BA:
        SDBD                                    ; 56BA   0001
        MVII    #$8005, R4                      ; 56BB   02BC 0005 0080

        JSR     R5,     .EXEC.6F7               ; 56BE   0004 0114 02F7

        PULR    R0                              ; 56C1   02B0
        TSTR    R4                              ; 56C2   00A4
        BPL     L_56C9                          ; 56C3   0203 0004

        MVI     G_032C, R1                      ; 56C5   0281 032C
        MVO     R1,     G_033C                  ; 56C7   0241 033C
L_56C9:
        MVI     G_0102, R1                      ; 56C9   0281 0102
        EIS                                     ; 56CB   0002
        CMPI    #$0001, R1                      ; 56CC   0379 0001
        BGT     L_56C9                          ; 56CE   022E 0006

        MVII    #$01A0, R4                      ; 56D0   02BC 01A0
        ADDR    R0,     R4                      ; 56D2   00C4
        MVI@    R4,     R4                      ; 56D3   02A4
        SDBD                                    ; 56D4   0001
        ADDI    #$5727, R4                      ; 56D5   02FC 0027 0057
        MVI     G_0334, R1                      ; 56D8   0281 0334
        MVI     G_033C, R2                      ; 56DA   0282 033C
        MVII    #$031F, R5                      ; 56DC   02BD 031F
        TSTR    R0                              ; 56DE   0080
        BEQ     L_56E3                          ; 56DF   0204 0002

        ADDI    #$0020, R5                      ; 56E1   02FD 0020
L_56E3:
        MVII    #$0004, R3                      ; 56E3   02BB 0004
        B       L_56F3                          ; 56E5   0200 000C

L_56E7:
        PSHR    R1                              ; 56E7   0271
        PSHR    R2                              ; 56E8   0272
        MVI@    R4,     R2                      ; 56E9   02A2
        MVI@    R4,     R1                      ; 56EA   02A1
        SWAP    R1,     1                       ; 56EB   0041
        SWAP    R2,     1                       ; 56EC   0042
        TSTR    R0                              ; 56ED   0080
        BNEQ    L_56F1                          ; 56EE   020C 0001

        NEGR    R1                              ; 56F0   0021
L_56F1:
        ADD@    R6,     R2                      ; 56F1   02F2
        ADD@    R6,     R1                      ; 56F2   02F1
L_56F3:
        MVO@    R1,     R5                      ; 56F3   0269
        MVO@    R2,     R5                      ; 56F4   026A
        ADDI    #$0006, R5                      ; 56F5   02FD 0006
        DECR    R3                              ; 56F7   0013
        BNEQ    L_56E7                          ; 56F8   022C 0012

        MVII    #$01A2, R1                      ; 56FA   02B9 01A2
        ADDR    R0,     R1                      ; 56FC   00C1
        MVI@    R1,     R5                      ; 56FD   028D
        MVII    #$0112, R1                      ; 56FE   02B9 0112
        ADDR    R0,     R1                      ; 5700   00C1
        MVO@    R5,     R1                      ; 5701   024D
        INCR    R0                              ; 5702   0008
        CMPI    #$0001, R0                      ; 5703   0378 0001
        BEQ     L_5650                          ; 5705   0224 00B6
        PULR    R7                              ; 5707   02B7

L_5708:
        MVI     G_032C, R2                      ; 5708   0282 032C
        MVO     R2,     G_033C                  ; 570A   0242 033C
        B       L_567C                          ; 570C   0220 0091

L_570E:
        MVII    #$0189, R4                      ; 570E   02BC 0189
        ADDR    R0,     R4                      ; 5710   00C4
        ADDR    R0,     R4                      ; 5711   00C4
        MVI@    R4,     R1                      ; 5712   02A1
        ADDR    R5,     R1                      ; 5713   00E9
        SWAP    R1,     2                       ; 5714   0045
        BMI     L_571B                          ; 5715   020B 0004

        MVI     G_0324, R1                      ; 5717   0281 0324
        MVO     R1,     G_0334                  ; 5719   0241 0334
L_571B:
        MVI@    R4,     R1                      ; 571B   02A1
        SWAP    R1,     2                       ; 571C   0045
        BPL     L_5723                          ; 571D   0203 0004

        MVI     G_032C, R2                      ; 571F   0282 032C
        MVO     R2,     G_033C                  ; 5721   0242 033C
L_5723:
        MVII    #$0003, R4                      ; 5723   02BC 0003
        B       L_5692                          ; 5725   0220 0094

        DECLE   $00F2,  $0000,  $00F0,  $0000   ; 5727   00F2 0000 00F0 0000
        DECLE   $0002,  $00F0,  $00F0,  $0004   ; 572B   0002 00F0 00F0 0004
        DECLE   $00F0,  $0000,  $0008,  $00F0   ; 572F   00F0 0000 0008 00F0
        DECLE   $00F0,  $0000,  $00F0,  $0000   ; 5733   00F0 0000 00F0 0000
        DECLE   $00F0,  $0000,  $00F2,  $0000   ; 5737   00F0 0000 00F2 0000
        DECLE   $00F0,  $0000,  $0008,  $00F0   ; 573B   00F0 0000 0008 00F0
        DECLE   $0000,  $0010,  $00F2,  $0002   ; 573F   0000 0010 00F2 0002
        DECLE   $0000,  $0010,  $0000,  $0010   ; 5743   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $00F0,  $0000   ; 5747   0000 0010 00F0 0000
        DECLE   $0000,  $0010,  $0000,  $0010   ; 574B   0000 0010 0000 0010
        DECLE   $0000,  $0010,  $00F0,  $0000   ; 574F   0000 0010 00F0 0000
        DECLE   $00F0,  $0000,  $0008,  $0010   ; 5753   00F0 0000 0008 0010
        DECLE   $0000,  $0002,  $0000,  $0000   ; 5757   0000 0002 0000 0000
        DECLE   $0010,  $0008,  $000C,  $0006   ; 575B   0010 0008 000C 0006
        DECLE   $0207,  $0105,  $0200,  $0273   ; 575F   0207 0105 0200 0273

        CMPR    R6,     R4                      ; 5763   0174
        B       L_5768                          ; 5764   0200 0002

        CMP@    R5,     R5                      ; 5766   036D
        CMPR    R5,     R5                      ; 5767   016D
L_5768:
        BLE     L_589F                          ; 5768   0206 0135

        DECLE   $0235                           ; 576A   0235

        MVI@    R2,     R6                      ; 576B   0296
        PULR    R7                              ; 576C   02B7

        DECLE   $03CE,  $03C8,  $0104,  $0035   ; 576D   03CE 03C8 0104 0035

        SUBR    R6,     R5                      ; 5771   0135
        ANDR    R2,     R6                      ; 5772   0196
        PULR    R7                              ; 5773   02B7

        DECLE   $0004,  $0035                   ; 5774   0004 0035

        MOVR    R2,     R6                      ; 5776   0096
        AND@    R2,     R6                      ; 5777   0396
        SUBR    R6,     R5                      ; 5778   0135
        DIS                                     ; 5779   0003
        PULR    R7                              ; 577A   02B7

        DECLE   $0296,  $0235,  $0101,  $0300   ; 577B   0296 0235 0101 0300
        DECLE   $0105,  $0300,  $0300,  $0300   ; 577F   0105 0300 0300 0300
        DECLE   $0300,  $034C,  $0001,  $0135   ; 5783   0300 034C 0001 0135
        DECLE   $0002,  $0121,  $0000,  $0002   ; 5787   0002 0121 0000 0002
        DECLE   $0123,  $0000,  $0004,  $0121   ; 578B   0123 0000 0004 0121
        DECLE   $0000,  $0302,  $0100,  $0004   ; 578F   0000 0302 0100 0004
        DECLE   $0123,  $0000,  $0304,  $0100   ; 5793   0123 0000 0304 0100
        DECLE   $0004,  $01EF,  $0000,  $0370   ; 5797   0004 01EF 0000 0370
        DECLE   $0100,  $0004,  $01F1,  $0000   ; 579B   0100 0004 01F1 0000
        DECLE   $0372,  $0100,  $0004,  $01E6   ; 579F   0372 0100 0004 01E6
        DECLE   $0000,  $0169,  $0000,  $0004   ; 57A3   0000 0169 0000 0004
        DECLE   $01EA,  $0000,  $016B,  $0000   ; 57A7   01EA 0000 016B 0000
L_57AB:
        PSHR    R5                              ; 57AB   0275
        CLRR    R0                              ; 57AC   01C0

        JSR     R5,     L_57CB                  ; 57AD   0004 0154 03CB

        INCR    R0                              ; 57B0   0008

        JSR     R5,     L_57CB                  ; 57B1   0004 0154 03CB
        JSR     R5,     L_564E                  ; 57B4   0004 0154 024E

        MVII    #$0001, R1                      ; 57B7   02B9 0001
L_57B9:
        MVII    #$01B0, R3                      ; 57B9   02BB 01B0
        ADDR    R1,     R3                      ; 57BB   00CB
        MVI@    R3,     R0                      ; 57BC   0298
        PSHR    R1                              ; 57BD   0271
        ANDI    #$00FD, R0                      ; 57BE   03B8 00FD
        BEQ     L_57C6                          ; 57C0   0204 0004

        MVI@    R3,     R0                      ; 57C2   0298

        JSR     R5,     L_59CB                  ; 57C3   0004 0158 01CB

L_57C6:
        PULR    R1                              ; 57C6   02B1
        DECR    R1                              ; 57C7   0011
        BEQ     L_57B9                          ; 57C8   0224 0010
        PULR    R7                              ; 57CA   02B7

L_57CB:
        PSHR    R5                              ; 57CB   0275
        MVII    #$0181, R2                      ; 57CC   02BA 0181
        ADDR    R0,     R2                      ; 57CE   00C2
        MVI@    R2,     R2                      ; 57CF   0292
        ANDI    #$0058, R2                      ; 57D0   03BA 0058
        BNEQ    L_57F4                          ; 57D2   020C 0020

        MVI     G_017D, R2                      ; 57D4   0282 017D
        ADD     G_017E, R2                      ; 57D6   02C2 017E
        BNEQ    L_57F4                          ; 57D8   020C 001A

        PSHR    R0                              ; 57DA   0270
        MOVR    R0,     R3                      ; 57DB   0083
        NEGR    R3                              ; 57DC   0023
        INCR    R3                              ; 57DD   000B
        MVII    #$0013, R4                      ; 57DE   02BC 0013
        MVI     G_01A6, R2                      ; 57E0   0282 01A6
        CMPI    #$0003, R2                      ; 57E2   037A 0003
        BGE     L_57F3                          ; 57E4   020D 000D

        TSTR    R2                              ; 57E6   0092
        BEQ     L_57EA                          ; 57E7   0204 0001

        CLRR    R4                              ; 57E9   01E4
L_57EA:
        INCR    R0                              ; 57EA   0008
        ANDR    R0,     R2                      ; 57EB   0182
        BNEQ    L_57F3                          ; 57EC   020C 0005

        MOVR    R4,     R0                      ; 57EE   00A0
        NEGR    R0                              ; 57EF   0020

        JSR     R5,     L_5574                  ; 57F0   0004 0154 0174

L_57F3:
        PULR    R0                              ; 57F3   02B0
L_57F4:
        MVII    #$019E, R1                      ; 57F4   02B9 019E
        ADDR    R0,     R1                      ; 57F6   00C1
        MVI@    R1,     R2                      ; 57F7   028A
        DECR    R2                              ; 57F8   0012
        MVO@    R2,     R1                      ; 57F9   024A
        BNEQ    L_5898                          ; 57FA   020C 009C

        SUBI    #$0006, R1                      ; 57FC   0339 0006
        MVI@    R1,     R2                      ; 57FE   028A
        DECR    R2                              ; 57FF   0012
        MVO@    R2,     R1                      ; 5800   024A
        BEQ     L_58A0                          ; 5801   0204 009D

L_5803:
        MVII    #$019A, R4                      ; 5803   02BC 019A
        ADDR    R0,     R4                      ; 5805   00C4
        ADDR    R0,     R4                      ; 5806   00C4
        PSHR    R4                              ; 5807   0274
        MOVR    R4,     R5                      ; 5808   00A5
        SDBD                                    ; 5809   0001
        MVI@    R4,     R1                      ; 580A   02A1
        MVI@    R1,     R3                      ; 580B   028B
        INCR    R1                              ; 580C   0009
        MVO@    R1,     R5                      ; 580D   0269
        SWAP    R1,     1                       ; 580E   0041
        MVO@    R1,     R5                      ; 580F   0269
        ADDI    #$0002, R4                      ; 5810   02FC 0002
        SUBR    R0,     R4                      ; 5812   0104
        MOVR    R3,     R2                      ; 5813   009A
        ANDI    #$00FF, R3                      ; 5814   03BB 00FF
        XORR    R3,     R2                      ; 5816   01DA
        SWAP    R2,     1                       ; 5817   0042
        SWAP    R1,     1                       ; 5818   0041
        SDBD                                    ; 5819   0001
        SUBI    #$578D, R1                      ; 581A   0339 008D 0057
        BMI     L_5835                          ; 581D   020B 0016

        PSHR    R2                              ; 581F   0272
        PSHR    R0                              ; 5820   0270
        MVII    #$0005, R2                      ; 5821   02BA 0005

        JSR     R5,     X_DIV                   ; 5823   0004 011C 01FB

        PULR    R0                              ; 5826   02B0
        PULR    R2                              ; 5827   02B2
        MOVR    R0,     R5                      ; 5828   0085
        ADDR    R5,     R5                      ; 5829   00ED
        ADDR    R5,     R5                      ; 582A   00ED
        ADDR    R0,     R5                      ; 582B   00C5
        ADDI    #$018F, R5                      ; 582C   02FD 018F
        MVI@    R5,     R5                      ; 582E   02AD
        DECR    R5                              ; 582F   0015
        CMPI    #$0004, R1                      ; 5830   0379 0004
        BNEQ    L_5835                          ; 5832   020C 0001

        ADDR    R5,     R2                      ; 5834   00EA
L_5835:
        SLL     R2,     1                       ; 5835   004A
        MVII    #$0176, R5                      ; 5836   02BD 0176
        ADDR    R0,     R5                      ; 5838   00C5
        MVI@    R5,     R1                      ; 5839   02A9
        SLR     R1,     2                       ; 583A   0065
        SLR     R1,     2                       ; 583B   0065
        PSHR    R0                              ; 583C   0270
        MVII    #$0004, R0                      ; 583D   02B8 0004

        JSR     R5,     X_RAND2                 ; 583F   0004 0114 029E

        MOVR    R1,     R5                      ; 5842   008D
        ANDI    #$0003, R5                      ; 5843   03BD 0003
        CMPR    R0,     R5                      ; 5845   0145
        BGT     L_5849                          ; 5846   020E 0001

        INCR    R2                              ; 5848   000A
L_5849:
        PULR    R0                              ; 5849   02B0
        SLR     R1,     2                       ; 584A   0065
        MVII    #$0003, R5                      ; 584B   02BD 0003
        SUBR    R1,     R5                      ; 584D   010D
        ADDR    R5,     R2                      ; 584E   00EA
        BNEQ    L_5852                          ; 584F   020C 0001

        INCR    R2                              ; 5851   000A
L_5852:
        MVO@    R2,     R4                      ; 5852   0262
        MOVR    R3,     R2                      ; 5853   009A
        ANDI    #$001F, R3                      ; 5854   03BB 001F
        XORR    R3,     R2                      ; 5856   01DA
        SLR     R2,     2                       ; 5857   0066
        MOVR    R2,     R1                      ; 5858   0091
        SLR     R1,     2                       ; 5859   0065
        SUBR    R1,     R2                      ; 585A   010A
        INCR    R4                              ; 585B   000C
        MVO@    R2,     R4                      ; 585C   0262
        PULR    R5                              ; 585D   02B5
        CLRR    R2                              ; 585E   01D2
        CMP     G_017D, R2                      ; 585F   0342 017D
        BEQ     L_5896                          ; 5861   0204 0033

        CMP     G_01A7, R2                      ; 5863   0342 01A7
        BNEQ    L_5896                          ; 5865   020C 002F

        SLR     R1,     1                       ; 5867   0061
        SDBD                                    ; 5868   0001
        ADDI    #$5757, R1                      ; 5869   02F9 0057 0057
        MVI@    R1,     R1                      ; 586C   0289
        SWAP    R1,     1                       ; 586D   0041
        SDBD                                    ; 586E   0001
        MVI@    R5,     R2                      ; 586F   02AA
        SDBD                                    ; 5870   0001
        CMPI    #$5785, R2                      ; 5871   037A 0085 0057
        BGT     L_5896                          ; 5874   020E 0020

        SDBD                                    ; 5876   0001
        CMPI    #$5778, R2                      ; 5877   037A 0078 0057
        BLE     L_587D                          ; 587A   0206 0001

        NEGR    R1                              ; 587C   0021
L_587D:
        MVII    #$031F, R2                      ; 587D   02BA 031F
        MOVR    R0,     R5                      ; 587F   0085
        BEQ     L_5885                          ; 5880   0204 0003

        NEGR    R1                              ; 5882   0021
        ADDI    #$0020, R2                      ; 5883   02FA 0020
L_5885:
        PSHR    R1                              ; 5885   0271
        MVI@    R2,     R1                      ; 5886   0291
        SWAP    R1,     1                       ; 5887   0041
        ANDI    #$00FF, R1                      ; 5888   03B9 00FF
        CMPI    #$0051, R1                      ; 588A   0379 0051
        BLE     L_5890                          ; 588C   0206 0002

        XORI    #$0001, R5                      ; 588E   03FD 0001
L_5890:
        PULR    R1                              ; 5890   02B1
        TSTR    R5                              ; 5891   00AD
        BNEQ    L_5896                          ; 5892   020C 0002

        ADD@    R2,     R1                      ; 5894   02D1
        MVO@    R1,     R2                      ; 5895   0251
L_5896:
        INCR    R4                              ; 5896   000C
        MVO@    R3,     R4                      ; 5897   0263
L_5898:
        MVII    #$0182, R1                      ; 5898   02B9 0182
        SUBR    R0,     R1                      ; 589A   0101
        MVI@    R1,     R2                      ; 589B   028A
        ADDI    #$0002, R1                      ; 589C   02F9 0002
        MVO@    R2,     R1                      ; 589E   024A
L_589F:
        PULR    R7                              ; 589F   02B7

L_58A0:
        MOVR    R1,     R4                      ; 58A0   008C
        MOVR    R4,     R2                      ; 58A1   00A2
        ADDI    #$000C, R2                      ; 58A2   02FA 000C
        MVI@    R2,     R2                      ; 58A4   0292
        TSTR    R2                              ; 58A5   0092
        BEQ     L_58B6                          ; 58A6   0204 000E

        MVO     R2,     G_01A7                  ; 58A8   0242 01A7
        MVO@    R2,     R4                      ; 58AA   0262
        INCR    R4                              ; 58AB   000C
        ADDR    R0,     R4                      ; 58AC   00C4
        MOVR    R4,     R5                      ; 58AD   00A5
        SDBD                                    ; 58AE   0001
        MVI@    R4,     R3                      ; 58AF   02A3
        SUBR    R2,     R3                      ; 58B0   0113
        MVO@    R3,     R5                      ; 58B1   026B
        SWAP    R3,     1                       ; 58B2   0043
        MVO@    R3,     R5                      ; 58B3   026B
        B       L_5803                          ; 58B4   0220 00B2

L_58B6:
        MVII    #$0181, R3                      ; 58B6   02BB 0181
        ADDR    R0,     R3                      ; 58B8   00C3
        MVI@    R3,     R2                      ; 58B9   029A
        MOVR    R2,     R1                      ; 58BA   0091
        ANDI    #$0050, R2                      ; 58BB   03BA 0050
        MVO@    R2,     R3                      ; 58BD   025A
        SUBI    #$0002, R3                      ; 58BE   033B 0002
        ANDI    #$0003, R1                      ; 58C0   03B9 0003
        MVO@    R1,     R3                      ; 58C2   0259
        CLRR    R1                              ; 58C3   01C9
        INCR    R7                              ; 58C4   000F

L_58C5:
        PSHR    R5                              ; 58C5   0275
L_58C6:
        SDBD                                    ; 58C6   0001
        ADDI    #$575E, R1                      ; 58C7   02F9 005E 0057
        MVI@    R1,     R2                      ; 58CA   028A
        INCR    R1                              ; 58CB   0009
        MVII    #$019A, R4                      ; 58CC   02BC 019A
        ADDR    R0,     R4                      ; 58CE   00C4
        ADDR    R0,     R4                      ; 58CF   00C4
        MVO@    R1,     R4                      ; 58D0   0261
        SWAP    R1,     1                       ; 58D1   0041
        MVO@    R1,     R4                      ; 58D2   0261
        MOVR    R2,     R3                      ; 58D3   0093
        ANDI    #$00FF, R2                      ; 58D4   03BA 00FF
        XORR    R2,     R3                      ; 58D6   01D3
        SWAP    R3,     1                       ; 58D7   0043
        MVII    #$01A4, R4                      ; 58D8   02BC 01A4
        ADDR    R0,     R4                      ; 58DA   00C4
        MVO@    R3,     R4                      ; 58DB   0263
        SUBI    #$000D, R4                      ; 58DC   033C 000D
        MVO@    R2,     R4                      ; 58DE   0262
        B       L_5803                          ; 58DF   0220 00DD

        PSHR    R5                              ; 58E1   0275
        MVI     G_0102, R1                      ; 58E2   0281 0102
        DECR    R1                              ; 58E4   0011
        BLE     L_592D                          ; 58E5   0206 0046

        CMPI    #$0003, R1                      ; 58E7   0379 0003
        BGE     L_592D                          ; 58E9   020D 0042

        MVO     R1,     G_0102                  ; 58EB   0241 0102

        JSR     R5,     .EXEC.154               ; 58ED   0004 0110 0154

        CLRR    R0                              ; 58F0   01C0
        MVO     R0,     .STIC.VIDEN             ; 58F1   0240 0020
        MVI     G_0102, R0                      ; 58F3   0280 0102
        SARC    R0,     1                       ; 58F5   0078
        SDBD                                    ; 58F6   0001
        MVII    #$39C0, R5                      ; 58F7   02BD 00C0 0039
        BNC     L_58FE                          ; 58FA   0209 0002

        SUBI    #$0040, R5                      ; 58FC   033D 0040
L_58FE:
        MVII    #$0113, R1                      ; 58FE   02B9 0113
        SUBR    R0,     R1                      ; 5900   0101
        MVI@    R1,     R2                      ; 5901   028A
        SLL     R2,     2                       ; 5902   004E
        SLL     R2,     2                       ; 5903   004E
        MOVR    R2,     R4                      ; 5904   0094
        ADDR    R2,     R4                      ; 5905   00D4
        ADDR    R2,     R4                      ; 5906   00D4
        SDBD                                    ; 5907   0001
        ADDI    #$5B7C, R4                      ; 5908   02FC 007C 005B
        MVII    #$0001, R3                      ; 590B   02BB 0001
        MVII    #$000C, R0                      ; 590D   02B8 000C
L_590F:
        MVI@    R4,     R2                      ; 590F   02A2
        MVO@    R2,     R5                      ; 5910   026A
        MVI@    R4,     R2                      ; 5911   02A2
        MVO@    R2,     R5                      ; 5912   026A
        MVI@    R4,     R2                      ; 5913   02A2
        MVO@    R2,     R5                      ; 5914   026A
        MVI@    R4,     R2                      ; 5915   02A2
        MVO@    R2,     R5                      ; 5916   026A
        DECR    R0                              ; 5917   0010
        BNEQ    L_590F                          ; 5918   022C 000A

        MVI@    R1,     R2                      ; 591A   028A
        SDBD                                    ; 591B   0001
        ADDI    #$5A74, R2                      ; 591C   02FA 0074 005A
        MVI@    R2,     R4                      ; 591F   0294
        SDBD                                    ; 5920   0001
        ADDI    #$5A8C, R4                      ; 5921   02FC 008C 005A
        MVII    #$0004, R0                      ; 5924   02B8 0004
        DECR    R3                              ; 5926   0013
        BEQ     L_590F                          ; 5927   0224 0019

        PULR    R5                              ; 5929   02B5
        J       X_PLAY_NOTE                     ; 592A   0004 0318 02BD

L_592D:
        PULR    R5                              ; 592D   02B5
        MVII    #$01A8, R4                      ; 592E   02BC 01A8
        SDBD                                    ; 5930   0001
        MVI@    R4,     R7                      ; 5931   02A7

        DECLE   $0047,  $0053,  $007E,  $0059   ; 5932   0047 0053 007E 0059
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5936   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0051,  $0059   ; 593A   0000 0000 0051 0059
        DECLE   $00CB,  $0059,  $0000,  $0000   ; 593E   00CB 0059 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5942   0000 0000 0000 0000
        DECLE   $014F,  $0000,  $0167,  $017C   ; 5946   014F 0000 0167 017C
        DECLE   $0038,  $01A1,  $021D           ; 594A   0038 01A1 021D

        RSWD    R0                              ; 594D   0038
        MVO     R2,     G_01CE                  ; 594E   0242 01CE
        XORR    R6,     R3                      ; 5950   01F3
        PSHR    R5                              ; 5951   0275
        MVII    #$0181, R3                      ; 5952   02BB 0181
        ADDR    R1,     R3                      ; 5954   00CB
        MVI@    R3,     R3                      ; 5955   029B
        ANDI    #$0058, R3                      ; 5956   03BB 0058
        ADD     G_017D, R3                      ; 5958   02C3 017D
        ADD     G_017E, R3                      ; 595A   02C3 017E
        BNEQ    L_597D                          ; 595C   020C 001F

        MOVR    R1,     R4                      ; 595E   008C
        INCR    R4                              ; 595F   000C
        MOVR    R4,     R2                      ; 5960   00A2
        PSHR    R1                              ; 5961   0271
        MOVR    R0,     R1                      ; 5962   0081
        BMI     L_596B                          ; 5963   020B 0006

        JSR     R5,     .EXEC.628               ; 5965   0004 0114 0228

L_5968:
        DECR    R7                              ; 5968   0017
        B       L_596D                          ; 5969   0200 0002

L_596B:
        CLRR    R0                              ; 596B   01C0
        CLRR    R4                              ; 596C   01E4
L_596D:
        PULR    R1                              ; 596D   02B1
        MVI     G_01A6, R3                      ; 596E   0283 01A6
        COMR    R2                              ; 5970   001A
        ANDR    R2,     R3                      ; 5971   0193
        ADDR    R4,     R3                      ; 5972   00E3
        MVO     R3,     G_01A6                  ; 5973   0243 01A6
        MVII    #$018A, R2                      ; 5975   02BA 018A
        ADDR    R1,     R2                      ; 5977   00CA
        ADDR    R1,     R2                      ; 5978   00CA
        MVO@    R0,     R2                      ; 5979   0250
        DECR    R2                              ; 597A   0012
        SWAP    R0,     1                       ; 597B   0040
        MVO@    R0,     R2                      ; 597C   0250
L_597D:
        PULR    R7                              ; 597D   02B7

        PSHR    R5                              ; 597E   0275
        CLRR    R2                              ; 597F   01D2
        MVII    #$01AC, R4                      ; 5980   02BC 01AC
        ADDR    R1,     R4                      ; 5982   00CC
        CMP@    R4,     R2                      ; 5983   0362
        BNEQ    L_59AA                          ; 5984   020C 0024

        CMP     G_017C, R2                      ; 5986   0342 017C
        BNEQ    L_59AA                          ; 5988   020C 0020

        MVII    #$0007, R5                      ; 598A   02BD 0007
        INCR    R4                              ; 598C   000C
        MVII    #$0208, R3                      ; 598D   02BB 0208
        ADDR    R1,     R3                      ; 598F   00CB
        ADDR    R1,     R3                      ; 5990   00CB
        ADDR    R1,     R3                      ; 5991   00CB
        CMPI    #$000B, R0                      ; 5992   0378 000B
        BEQ     L_59AB                          ; 5994   0204 0015

        CMPI    #$0006, R0                      ; 5996   0378 0006
        BGT     L_59A2                          ; 5998   020E 0008

        MOVR    R0,     R2                      ; 599A   0082
        BEQ     L_59A2                          ; 599B   0204 0005

        ADDI    #$0010, R0                      ; 599D   02F8 0010
        SLL     R0,     2                       ; 599F   004C
        SLL     R0,     1                       ; 59A0   0048
        ADDR    R0,     R5                      ; 59A1   00C5
L_59A2:
        MVO@    R2,     R4                      ; 59A2   0262
        MVO@    R5,     R3                      ; 59A3   025D

        JSR     R5,     .EXEC.607               ; 59A4   0004 0114 0207
        JSR     R5,     L_5089                  ; 59A7   0004 0150 0089

L_59AA:
        PULR    R7                              ; 59AA   02B7

L_59AB:
        MVI@    R4,     R0                      ; 59AB   02A0
        TSTR    R0                              ; 59AC   0080
        BEQ     L_59C7                          ; 59AD   0204 0018

        MVII    #$01AD, R4                      ; 59AF   02BC 01AD
        SUBR    R1,     R4                      ; 59B1   010C
        CMP@    R4,     R2                      ; 59B2   0362
        BEQ     L_59BE                          ; 59B3   0204 0009

        INCR    R4                              ; 59B5   000C
        CMP@    R4,     R0                      ; 59B6   0360
        BEQ     L_59C7                          ; 59B7   0204 000E

        SDBD                                    ; 59B9   0001
        MVII    #$50A2, R4                      ; 59BA   02BC 00A2 0050
        PSHR    R4                              ; 59BD   0274
L_59BE:
        NEGR    R5                              ; 59BE   0025
        ADD@    R3,     R5                      ; 59BF   02DD
        ADDR    R0,     R5                      ; 59C0   00C5
        MVII    #$01AC, R4                      ; 59C1   02BC 01AC
        ADDR    R1,     R4                      ; 59C3   00CC
        INCR    R2                              ; 59C4   000A
        B       L_59A2                          ; 59C5   0220 0024

L_59C7:
        JSR     R5,     L_55CA                  ; 59C7   0004 0154 01CA

        PULR    R7                              ; 59CA   02B7

L_59CB:
        PSHR    R5                              ; 59CB   0275
        MVII    #$01AA, R3                      ; 59CC   02BB 01AA
        ADDR    R1,     R3                      ; 59CE   00CB
        CLRR    R4                              ; 59CF   01E4
        MVO@    R4,     R3                      ; 59D0   025C
        MVII    #$0181, R3                      ; 59D1   02BB 0181
        ADDR    R1,     R3                      ; 59D3   00CB
        MVI@    R3,     R2                      ; 59D4   029A
        ADD     G_017D, R2                      ; 59D5   02C2 017D
        ADD     G_017E, R2                      ; 59D7   02C2 017E
        BNEQ    L_59F8                          ; 59D9   020C 001D

        PSHR    R1                              ; 59DB   0271
        MOVR    R0,     R4                      ; 59DC   0084
        SDBD                                    ; 59DD   0001
        ADDI    #$5945, R4                      ; 59DE   02FC 0045 0059
        MOVR    R1,     R0                      ; 59E1   0088
        MVI@    R4,     R1                      ; 59E2   02A1
        MOVR    R1,     R4                      ; 59E3   008C
        SLR     R1,     2                       ; 59E4   0065
        SLR     R1,     1                       ; 59E5   0061
        ANDI    #$0007, R4                      ; 59E6   03BC 0007
        MVO@    R4,     R3                      ; 59E8   025C

        JSR     R5,     L_58C5                  ; 59E9   0004 0158 00C5

        MVII    #$0176, R3                      ; 59EC   02BB 0176
        ADDR    R0,     R3                      ; 59EE   00C3
        MVI@    R3,     R1                      ; 59EF   0299
        DECR    R1                              ; 59F0   0011
        DECR    R1                              ; 59F1   0011

        JSR     R5,     L_59FD                  ; 59F2   0004 0158 01FD

        MVO@    R1,     R3                      ; 59F5   0259
        PULR    R1                              ; 59F6   02B1
        CLRR    R0                              ; 59F7   01C0
L_59F8:
        MVII    #$01B0, R3                      ; 59F8   02BB 01B0
        ADDR    R1,     R3                      ; 59FA   00CB
        MVO@    R0,     R3                      ; 59FB   0258
        PULR    R7                              ; 59FC   02B7

L_59FD:
        PSHR    R5                              ; 59FD   0275
        PSHR    R0                              ; 59FE   0270
        MOVR    R0,     R5                      ; 59FF   0085
        SLL     R0,     2                       ; 5A00   004C
        ADDR    R0,     R5                      ; 5A01   00C5
        ADDI    #$0190, R5                      ; 5A02   02FD 0190
        MVI@    R5,     R0                      ; 5A04   02A8
        SLL     R0,     2                       ; 5A05   004C
        SLL     R0,     1                       ; 5A06   0048
        ADDI    #$0030, R0                      ; 5A07   02F8 0030
        CMPR    R0,     R1                      ; 5A09   0141
        BGE     L_5A0D                          ; 5A0A   020D 0001

        MOVR    R0,     R1                      ; 5A0C   0081
L_5A0D:
        PULR    R0                              ; 5A0D   02B0
        PULR    R7                              ; 5A0E   02B7

L_5A0F:
        PSHR    R5                              ; 5A0F   0275
        CLRR    R0                              ; 5A10   01C0
        INCR    R0                              ; 5A11   0008
L_5A12:
        MVII    #$01B3, R1                      ; 5A12   02B9 01B3
        ADDR    R0,     R1                      ; 5A14   00C1
        MVI@    R1,     R2                      ; 5A15   028A
        INCR    R2                              ; 5A16   000A
        CMPI    #$0008, R2                      ; 5A17   037A 0008
        BLT     L_5A6F                          ; 5A19   0205 0054

        CLRR    R2                              ; 5A1B   01D2
        MVO@    R2,     R1                      ; 5A1C   024A
        MVII    #$0181, R2                      ; 5A1D   02BA 0181
        ADDR    R0,     R2                      ; 5A1F   00C2
        MVI@    R2,     R1                      ; 5A20   0291
        SLL     R1,     1                       ; 5A21   0049
        SWAP    R1,     2                       ; 5A22   0045
        BPL     L_5A30                          ; 5A23   0203 000B

        MVII    #$0189, R4                      ; 5A25   02BC 0189
        ADDR    R0,     R4                      ; 5A27   00C4
        ADDR    R0,     R4                      ; 5A28   00C4
        CLRR    R3                              ; 5A29   01DB
        MVO@    R3,     R4                      ; 5A2A   0263
        MVO@    R3,     R4                      ; 5A2B   0263
        MVI@    R2,     R4                      ; 5A2C   0294
        ANDI    #$00BF, R4                      ; 5A2D   03BC 00BF
        MVO@    R4,     R2                      ; 5A2F   0254
L_5A30:
        SLL     R1,     2                       ; 5A30   004D
        SWAP    R1,     2                       ; 5A31   0045
        BPL     L_5A70                          ; 5A32   0203 003C

        SLL     R1,     1                       ; 5A34   0049
        SWAP    R1,     2                       ; 5A35   0045
        BPL     L_5A62                          ; 5A36   0203 002A

        MVII    #$0176, R1                      ; 5A38   02B9 0176
        ADDR    R0,     R1                      ; 5A3A   00C1
        MVI@    R1,     R4                      ; 5A3B   028C
        MVII    #$0185, R3                      ; 5A3C   02BB 0185
        ADDR    R0,     R3                      ; 5A3E   00C3
        MVI@    R3,     R3                      ; 5A3F   029B
        DECR    R3                              ; 5A40   0013
        BEQ     L_5A47                          ; 5A41   0204 0004

        CMPI    #$0050, R4                      ; 5A43   037C 0050
        BLT     L_5A66                          ; 5A45   0205 001F

L_5A47:
        CMPI    #$0040, R4                      ; 5A47   037C 0040
        BLT     L_5A66                          ; 5A49   0205 001B

        ADDI    #$0012, R4                      ; 5A4B   02FC 0012
        SUB     G_016D, R4                      ; 5A4D   0304 016D
        SUB     G_016D, R4                      ; 5A4F   0304 016D
        MVO@    R4,     R1                      ; 5A51   024C
        PSHR    R2                              ; 5A52   0272
        CLRR    R1                              ; 5A53   01C9
        MVO     R1,     G_01A7                  ; 5A54   0241 01A7
        MVII    #$001B, R1                      ; 5A56   02B9 001B
        MOVR    R0,     R2                      ; 5A58   0082
        INCR    R2                              ; 5A59   000A
        ADD     G_01B2, R2                      ; 5A5A   02C2 01B2
        MVO     R2,     G_01B2                  ; 5A5C   0242 01B2

        JSR     R5,     L_58C5                  ; 5A5E   0004 0158 00C5

        PULR    R2                              ; 5A61   02B2
L_5A62:
        MVI@    R2,     R3                      ; 5A62   0293
        ANDI    #$0088, R3                      ; 5A63   03BB 0088
        MVO@    R3,     R2                      ; 5A65   0253
L_5A66:
        MVII    #$0178, R1                      ; 5A66   02B9 0178
        ADDR    R0,     R1                      ; 5A68   00C1
        MVI@    R1,     R2                      ; 5A69   028A
        CLRR    R3                              ; 5A6A   01DB
        MVO@    R3,     R1                      ; 5A6B   024B
        SUBI    #$0002, R1                      ; 5A6C   0339 0002
        ADD@    R1,     R2                      ; 5A6E   02CA
L_5A6F:
        MVO@    R2,     R1                      ; 5A6F   024A
L_5A70:
        DECR    R0                              ; 5A70   0010
        BEQ     L_5A12                          ; 5A71   0224 0060
        PULR    R7                              ; 5A73   02B7

        DECLE   $0000,  $0010,  $0020,  $0010   ; 5A74   0000 0010 0020 0010
        DECLE   $0020,  $0010,  $0030,  $0040   ; 5A78   0020 0010 0030 0040
        DECLE   $0050,  $0060,  $0030,  $0060   ; 5A7C   0050 0060 0030 0060
        DECLE   $0070,  $0080,  $0050,  $0090   ; 5A80   0070 0080 0050 0090
        DECLE   $00A0,  $0090,  $00A0,  $00B0   ; 5A84   00A0 0090 00A0 00B0
        DECLE   $00C0,  $00D0,  $00E0,  $0050   ; 5A88   00C0 00D0 00E0 0050
        DECLE   $007E,  $007C,  $007C,  $00FC   ; 5A8C   007E 007C 007C 00FC
        DECLE   $00FC,  $00EC,  $006C,  $006E   ; 5A90   00FC 00EC 006C 006E
        DECLE   $007E,  $0036,  $0036,  $0036   ; 5A94   007E 0036 0036 0036
        DECLE   $0037                           ; 5A98   0037

        GSWD    R3                              ; 5A99   0033
        ADDR    R4,     R7                      ; 5A9A   00E7

        DECLE   $00E6,  $007E,  $007C,  $00FC   ; 5A9B   00E6 007E 007C 00FC
        DECLE   $00FC,  $00EC,  $006C,  $007C   ; 5A9F   00FC 00EC 006C 007C
        DECLE   $003E,  $003E,  $0036,  $0036   ; 5AA3   003E 003E 0036 0036
        DECLE   $00F6,  $0073,  $0023,  $0007   ; 5AA7   00F6 0073 0023 0007
        DECLE   $0006,  $00FC,  $00F8,  $00F8   ; 5AAB   0006 00FC 00F8 00F8
        DECLE   $0078,  $0078,  $003C,  $003C   ; 5AAF   0078 0078 003C 003C
        DECLE   $003C,  $003C,  $00FE,  $0076   ; 5AB3   003C 003C 00FE 0076
        DECLE   $0026,  $0002,  $0006,  $0006   ; 5AB7   0026 0002 0006 0006
        DECLE   $0000,  $003E,  $003C,  $007C   ; 5ABB   0000 003E 003C 007C
        DECLE   $0078,  $0078,  $0038,  $003C   ; 5ABF   0078 0078 0038 003C
        DECLE   $003C,  $003E,  $003E,  $001E   ; 5AC3   003C 003E 003E 001E
        DECLE   $001B,  $001B,  $0037,  $0076   ; 5AC7   001B 001B 0037 0076
        DECLE   $0040,  $003E,  $007E,  $007E   ; 5ACB   0040 003E 007E 007E
        DECLE   $007C,  $007C,  $007C,  $003E   ; 5ACF   007C 007C 007C 003E
        DECLE   $0036,  $0036,  $001E,  $001E   ; 5AD3   0036 0036 001E 001E
        DECLE   $001F                           ; 5AD7   001F

        SARC    R3,     2                       ; 5AD8   007F
        RSWD    R3                              ; 5AD9   003B
L_5ADA:
        DECR    R7                              ; 5ADA   0017

        DECLE   $0006,  $0000,  $0000,  $0000   ; 5ADB   0006 0000 0000 0000
        DECLE   $0000,  $0001                   ; 5ADF   0000 0001

        DIS                                     ; 5AE1   0003
        DIS                                     ; 5AE2   0003
        SETC                                    ; 5AE3   0007
        SETC                                    ; 5AE4   0007
        INCR    R7                              ; 5AE5   000F

        INCR    R6                              ; 5AE6   000E
L_5AE7:
        COMR    R5                              ; 5AE7   001D
        DECLE   $001D,  $003B,  $00F7,  $00F6   ; 5AE8   001D 003B 00F7 00F6
        DECLE   $007C,  $007C,  $00FC,  $00F8   ; 5AEC   007C 007C 00FC 00F8
        DECLE   $00F8,  $0078,  $006C,  $006C   ; 5AF0   00F8 0078 006C 006C
        DECLE   $007C,  $003C,  $003E,  $0036   ; 5AF4   007C 003C 003E 0036
        DECLE   $0036,  $003C,  $00EC,  $00E0   ; 5AF8   0036 003C 00EC 00E0
        DECLE   $003E,  $003E,  $003C,  $003C   ; 5AFC   003E 003E 003C 003C
        DECLE   $007C,  $007C,  $0078,  $0038   ; 5B00   007C 007C 0078 0038
        DECLE   $0038,  $0038,  $003C,  $001C   ; 5B04   0038 0038 003C 001C
        DECLE   $001C,  $001C,  $007C,  $0070   ; 5B08   001C 001C 007C 0070
        DECLE   $003F,  $003F,  $003E,  $007E   ; 5B0C   003F 003F 003E 007E
        DECLE   $007C,  $007C,  $00F8,  $00F8   ; 5B10   007C 007C 00F8 00F8
        DECLE   $007C,  $007C,  $007E,  $0036   ; 5B14   007C 007C 007E 0036

        GSWD    R3                              ; 5B18   0033
        GSWD    R3                              ; 5B19   0033
        ADDR    R4,     R7                      ; 5B1A   00E7

        DECLE   $00E6,  $003E,  $003C,  $007C   ; 5B1B   00E6 003E 003C 007C
        DECLE   $0078,  $0078,  $0038,  $003C   ; 5B1F   0078 0078 0038 003C
        DECLE   $003C,  $003E,  $003E,  $001E   ; 5B23   003C 003E 003E 001E
        DECLE   $001B,  $001B,  $0037,  $0076   ; 5B27   001B 001B 0037 0076
        DECLE   $0040,  $007C,  $007C,  $00F8   ; 5B2B   0040 007C 007C 00F8
        DECLE   $00F8,  $00F8,  $0078,  $006C   ; 5B2F   00F8 00F8 0078 006C
        DECLE   $006C,  $007C,  $003C,  $003E   ; 5B33   006C 007C 003C 003E
        DECLE   $0036,  $0036,  $003C,  $00EC   ; 5B37   0036 0036 003C 00EC
        DECLE   $00E0,  $007C,  $007C,  $00F8   ; 5B3B   00E0 007C 007C 00F8
        DECLE   $00F8,  $00F8,  $007C,  $006C   ; 5B3F   00F8 00F8 007C 006C
        DECLE   $006E,  $0076,  $0037,  $0033   ; 5B43   006E 0076 0037 0033
        DECLE   $0037,  $0036,  $0030,  $00E0   ; 5B47   0037 0036 0030 00E0
        DECLE   $00E0,  $0078,  $0078,  $00F8   ; 5B4B   00E0 0078 0078 00F8
        DECLE   $00F0,  $00F0,  $00F0,  $0078   ; 5B4F   00F0 00F0 00F0 0078
        DECLE   $0078,  $007C,  $003C,  $0036   ; 5B53   0078 007C 003C 0036
        DECLE   $0036,  $003E,  $003C,  $00EC   ; 5B57   0036 003E 003C 00EC
        DECLE   $00E0,  $003F,  $003F,  $007E   ; 5B5B   00E0 003F 003F 007E
        DECLE   $007E,  $00EE,  $00EC,  $00FC   ; 5B5F   007E 00EE 00EC 00FC
        DECLE   $00F8,  $0078,  $007C,  $006C   ; 5B63   00F8 0078 007C 006C
        DECLE   $006C,  $003C,  $0076,  $00EE   ; 5B67   006C 003C 0076 00EE
        DECLE   $00EE,  $0000,  $0000,  $0000   ; 5B6B   00EE 0000 0000 0000
        DECLE   $001C,  $001F,  $003F,  $003F   ; 5B6F   001C 001F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003B   ; 5B73   003F 003F 003F 003B
        DECLE   $007C,  $007C,  $006E,  $00E6   ; 5B77   007C 007C 006E 00E6
        DECLE   $00EE,  $0000,  $0000,  $0000   ; 5B7B   00EE 0000 0000 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 5B7F   0000 0001 0001 0001
        DECLE   $0001,  $0001,  $0000,  $0000   ; 5B83   0001 0001 0000 0000
        DECLE   $0001,  $0003,  $0003,  $0003   ; 5B87   0001 0003 0003 0003
        DECLE   $0003,  $0000,  $0000,  $0030   ; 5B8B   0003 0000 0000 0030
        DECLE   $0078,  $0078,  $0078,  $00F8   ; 5B8F   0078 0078 0078 00F8
        DECLE   $00F8,  $005C,  $005E,  $00FE   ; 5B93   00F8 005C 005E 00FE
        DECLE   $00FE,  $00FE,  $007F,  $00BF   ; 5B97   00FE 00FE 007F 00BF
        DECLE   $00FF,  $00FF,  $00FF,  $007F   ; 5B9B   00FF 00FF 00FF 007F
        DECLE   $003F,  $001F,  $001F           ; 5B9F   003F 001F 001F

        COMR    R6                              ; 5BA2   001E
        INCR    R2                              ; 5BA3   000A
        COMR    R2                              ; 5BA4   001A
        COMR    R3                              ; 5BA5   001B
        DECR    R3                              ; 5BA6   0013
L_5BA7:
        DECR    R7                              ; 5BA7   0017

        DECLE   $003F,  $003F,  $003E,  $007E   ; 5BA8   003F 003F 003E 007E
        DECLE   $0003,  $0003,  $0002,  $0002   ; 5BAC   0003 0003 0002 0002
        DECLE   $0003,  $0001,  $0000,  $0000   ; 5BB0   0003 0001 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB4   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $00F6   ; 5BBC   0000 0000 0060 00F6
        DECLE   $00F7,  $00F7,  $00F7,  $00F3   ; 5BC0   00F7 00F7 00F7 00F3
        DECLE   $003B,  $00BF,  $00FE,  $00FE   ; 5BC4   003B 00BF 00FE 00FE
        DECLE   $00FE,  $00FC,  $00FC,  $00FC   ; 5BC8   00FE 00FC 00FC 00FC
        DECLE   $00FC,  $00FC,  $00FC,  $00FC   ; 5BCC   00FC 00FC 00FC 00FC
        DECLE   $00FC,  $007C,  $0078,  $0028   ; 5BD0   00FC 007C 0078 0028
        DECLE   $0068,  $006C,  $004C,  $005C   ; 5BD4   0068 006C 004C 005C
        DECLE   $007C,  $00FC,  $00F8,  $00F8   ; 5BD8   007C 00FC 00F8 00F8
        DECLE   $0000,  $0040,  $00E0,  $00E0   ; 5BDC   0000 0040 00E0 00E0
        DECLE   $00F1,  $00FD,  $001F           ; 5BE0   00F1 00FD 001F

        INCR    R7                              ; 5BE3   000F

        SETC                                    ; 5BE4   0007
L_5BE5:
        DIS                                     ; 5BE5   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BE6   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BEA   0000 0000 0000 0000
        DECLE   $0030,  $0078,  $0078,  $0078   ; 5BEE   0030 0078 0078 0078
        DECLE   $00F8,  $00F8,  $005C,  $005E   ; 5BF2   00F8 00F8 005C 005E
        DECLE   $00FE,  $00FE,  $00FE,  $00FF   ; 5BF6   00FE 00FE 00FE 00FF
        DECLE   $007F,  $007F,  $003F,  $003F   ; 5BFA   007F 007F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5BFE   003F 003F 003F 003F
        DECLE   $001E,  $000A,  $001A,  $001A   ; 5C02   001E 000A 001A 001A
        DECLE   $001A,  $0016,  $0036,  $003E   ; 5C06   001A 0016 0036 003E
        DECLE   $007E,  $007C,  $0000,  $0000   ; 5C0A   007E 007C 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0007   ; 5C0E   0000 0000 0002 0007
        DECLE   $0007,  $0007,  $0007,  $0007   ; 5C12   0007 0007 0007 0007
        DECLE   $0001,  $0000,  $0000,  $0000   ; 5C16   0001 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5C1A   0000 0000 0000 0000
        DECLE   $0067,  $00F5,  $00F5,  $00F7   ; 5C1E   0067 00F5 00F5 00F7
        DECLE   $00F3,  $00F3,  $007F,  $003F   ; 5C22   00F3 00F3 007F 003F
        DECLE   $003E,  $003E,  $003E,  $003C   ; 5C26   003E 003E 003E 003C
        DECLE   $003C,  $00BC,  $00FC,  $00FC   ; 5C2A   003C 00BC 00FC 00FC
        DECLE   $00FC,  $00FC,  $007C,  $007C   ; 5C2E   00FC 00FC 007C 007C
        DECLE   $007C,  $0028,  $0068,  $006C   ; 5C32   007C 0028 0068 006C
        DECLE   $004C,  $005C,  $007C,  $00FC   ; 5C36   004C 005C 007C 00FC
        DECLE   $00F8,  $00F8,  $0000,  $00E0   ; 5C3A   00F8 00F8 0000 00E0
        DECLE   $00E0,  $00A0,  $00B8,  $00FF   ; 5C3E   00E0 00A0 00B8 00FF
        DECLE   $001F,  $0003,  $0001,  $0000   ; 5C42   001F 0003 0001 0000
        DECLE   $0000,  $0002,  $0007,  $0007   ; 5C46   0000 0002 0007 0007
        DECLE   $0007,  $0007,  $0000,  $0000   ; 5C4A   0007 0007 0000 0000
        DECLE   $0060,  $00F0,  $00F0,  $00F0   ; 5C4E   0060 00F0 00F0 00F0
        DECLE   $00F0,  $00F0,  $00F8,  $00F8   ; 5C52   00F0 00F0 00F8 00F8
        DECLE   $00F8,  $007C,  $007C,  $007C   ; 5C56   00F8 007C 007C 007C
        DECLE   $007E,  $00FE,  $00FE,  $00FE   ; 5C5A   007E 00FE 00FE 00FE
        DECLE   $00FE,  $007E,  $003E,  $003E   ; 5C5E   00FE 007E 003E 003E
        DECLE   $003C,  $000A,  $001A,  $001A   ; 5C62   003C 000A 001A 001A
        DECLE   $001A,  $0016,  $0036,  $003E   ; 5C66   001A 0016 0036 003E
        DECLE   $007E,  $007C,  $0000,  $0000   ; 5C6A   007E 007C 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5C6E   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 5C72   0001 0001 0001 0000
        DECLE   $0000,  $0001,  $0003,  $0003   ; 5C76   0000 0001 0003 0003
        DECLE   $0003,  $0003,  $0000,  $0000   ; 5C7A   0003 0003 0000 0000
        DECLE   $0030,  $0078,  $0078,  $0078   ; 5C7E   0030 0078 0078 0078
        DECLE   $00F8,  $00F8,  $005C,  $005E   ; 5C82   00F8 00F8 005C 005E
        DECLE   $00FE,  $00FE,  $00FF,  $007F   ; 5C86   00FE 00FE 00FF 007F
        DECLE   $00BF,  $00FF,  $00FF,  $00FF   ; 5C8A   00BF 00FF 00FF 00FF
        DECLE   $007F,  $003F,  $001F,  $001F   ; 5C8E   007F 003F 001F 001F

        COMR    R6                              ; 5C92   001E
        INCR    R2                              ; 5C93   000A
        COMR    R2                              ; 5C94   001A
        COMR    R3                              ; 5C95   001B
        DECR    R3                              ; 5C96   0013
L_5C97:
        DECR    R7                              ; 5C97   0017

        DECLE   $001F,  $003F,  $003E,  $003E   ; 5C98   001F 003F 003E 003E
        DECLE   $0000,  $0080,  $00C0,  $00E0   ; 5C9C   0000 0080 00C0 00E0
        DECLE   $00F0,  $00D0,  $00F0,  $00E0   ; 5CA0   00F0 00D0 00F0 00E0
        DECLE   $00C0,  $0000,  $0000,  $0000   ; 5CA4   00C0 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CA8   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5CAC   0000 0000

        COMR    R0                              ; 5CAE   0018
        RSWD    R4                              ; 5CAF   003C
        RSWD    R4                              ; 5CB0   003C
        RSWD    R4                              ; 5CB1   003C
        ADDR    R7,     R4                      ; 5CB2   00FC
        ADDR    R7,     R4                      ; 5CB3   00FC
        MOVR    R5,     R6                      ; 5CB4   00AE
        MOVR    R5,     R7                      ; 5CB5   00AF

        DECLE   $00FF,  $007F,  $007F,  $003F   ; 5CB6   00FF 007F 007F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5CBA   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5CBE   003F 003F 003F 003F

        COMR    R6                              ; 5CC2   001E
        INCR    R2                              ; 5CC3   000A
        COMR    R2                              ; 5CC4   001A
        COMR    R2                              ; 5CC5   001A
        COMR    R3                              ; 5CC6   001B
L_5CC7:
        DECR    R7                              ; 5CC7   0017
L_5CC8:
        DECR    R7                              ; 5CC8   0017

        DECLE   $001F,  $003F,  $003E,  $0000   ; 5CC9   001F 003F 003E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CCD   0000 0000 0000 0000
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5CD1   0001 0001 0001 0001
        DECLE   $0001,  $0000,  $0000,  $0001   ; 5CD5   0001 0000 0000 0001
        DECLE   $0003,  $0003,  $0003,  $0000   ; 5CD9   0003 0003 0003 0000
        DECLE   $0000,  $0000,  $0030,  $0078   ; 5CDD   0000 0000 0030 0078
        DECLE   $0078,  $0078,  $00F8,  $00F8   ; 5CE1   0078 0078 00F8 00F8
        DECLE   $005C,  $005E,  $00FE,  $00FE   ; 5CE5   005C 005E 00FE 00FE
        DECLE   $00FE,  $007F,  $00BF,  $00FF   ; 5CE9   00FE 007F 00BF 00FF
        DECLE   $00FF,  $00FF,  $007F,  $003F   ; 5CED   00FF 00FF 007F 003F
        DECLE   $001F,  $001F                   ; 5CF1   001F 001F

        COMR    R6                              ; 5CF3   001E
        INCR    R2                              ; 5CF4   000A
        COMR    R2                              ; 5CF5   001A
        COMR    R3                              ; 5CF6   001B
        COMR    R3                              ; 5CF7   001B
L_5CF8:
        DECR    R7                              ; 5CF8   0017

        DECLE   $0037,  $003F,  $003E,  $0000   ; 5CF9   0037 003F 003E 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5CFD   0000 0000 0000 0000
        DECLE   $000A,  $0000,  $000A,  $0000   ; 5D01   000A 0000 000A 0000
        DECLE   $00C0,  $00EE,  $00FF,  $00FF   ; 5D05   00C0 00EE 00FF 00FF
        DECLE   $00FF,  $00FF,  $00EE,  $0000   ; 5D09   00FF 00FF 00EE 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D0D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D11   0000 0000 0000 0000
        DECLE   $0003,  $00FF,  $00FF,  $003F   ; 5D15   0003 00FF 00FF 003F
        DECLE   $00FF,  $00FF,  $00FF,  $0000   ; 5D19   00FF 00FF 00FF 0000
        DECLE   $0000,  $0000,  $0000,  $00A0   ; 5D1D   0000 0000 0000 00A0
        DECLE   $00F0,  $00F8,  $00FC,  $00FE   ; 5D21   00F0 00F8 00FC 00FE
        DECLE   $007F,  $00FF                   ; 5D25   007F 00FF

        ADDR    R3,     R5                      ; 5D27   00DD
        MOVR    R3,     R6                      ; 5D28   009E
        MOVR    R1,     R7                      ; 5D29   008F

        DECLE   $0007,  $0003,  $0001,  $0003   ; 5D2A   0007 0003 0001 0003
        DECLE   $0042,  $00E2,  $00FF,  $00FF   ; 5D2E   0042 00E2 00FF 00FF
        DECLE   $00FF,  $0003,  $0000,  $0000   ; 5D32   00FF 0003 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D36   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D3A   0000 0000 0000 0000
        DECLE   $0030,  $0078,  $0078,  $0078   ; 5D3E   0030 0078 0078 0078
        DECLE   $0078,  $0078,  $009C,  $009E   ; 5D42   0078 0078 009C 009E
        DECLE   $00FE,  $00FE,  $00FF,  $00FF   ; 5D46   00FE 00FE 00FF 00FF
        DECLE   $00FF,  $00FF,  $007F,  $001F   ; 5D4A   00FF 00FF 007F 001F
        DECLE   $001F,  $001F,  $001F,  $001F   ; 5D4E   001F 001F 001F 001F

        COMR    R6                              ; 5D52   001E
        INCR    R2                              ; 5D53   000A
        COMR    R2                              ; 5D54   001A
        COMR    R3                              ; 5D55   001B
L_5D56:
        DECR    R7                              ; 5D56   0017
L_5D57:
        DECR    R7                              ; 5D57   0017
L_5D58:
        DECR    R7                              ; 5D58   0017

        DECLE   $003F,  $003F,  $003E,  $0000   ; 5D59   003F 003F 003E 0000
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; 5D5D   0080 00C0 00E0 00F0
        DECLE   $00D0,  $0070,  $0060,  $00C0   ; 5D61   00D0 0070 0060 00C0
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D65   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D69   0000 0000 0000 0000
        DECLE   $0000                           ; 5D6D   0000

        COMR    R0                              ; 5D6E   0018
        RSWD    R4                              ; 5D6F   003C
        RSWD    R4                              ; 5D70   003C
        RSWD    R4                              ; 5D71   003C
        RSWD    R4                              ; 5D72   003C
        RSWD    R4                              ; 5D73   003C
        COMR    R6                              ; 5D74   001E
        INCR    R7                              ; 5D75   000F
        INCR    R7                              ; 5D76   000F
L_5D77:
        INCR    R7                              ; 5D77   000F
L_5D78:
        INCR    R7                              ; 5D78   000F
L_5D79:
        INCR    R7                              ; 5D79   000F

L_5D7A:
        SLL     R3,     2                       ; 5D7A   004F
L_5D7B:
        ADDR    R5,     R7                      ; 5D7B   00EF
        ADDR    R5,     R7                      ; 5D7C   00EF

        DECLE   $00FF,  $00FF,  $00FF,  $003F   ; 5D7D   00FF 00FF 00FF 003F
        DECLE   $001F                           ; 5D81   001F

        COMR    R6                              ; 5D82   001E
        COMR    R6                              ; 5D83   001E
        INCR    R2                              ; 5D84   000A
        COMR    R2                              ; 5D85   001A
        COMR    R2                              ; 5D86   001A
        COMR    R3                              ; 5D87   001B
L_5D88:
        DECR    R7                              ; 5D88   0017
L_5D89:
        DECR    R7                              ; 5D89   0017

        DECLE   $001F,  $003E,  $0000,  $0001   ; 5D8A   001F 003E 0000 0001
        DECLE   $0067,  $00FF,  $00BF,  $00BE   ; 5D8E   0067 00FF 00BF 00BE
        DECLE   $00E1,  $0003,  $0003,  $0003   ; 5D92   00E1 0003 0003 0003
        DECLE   $0003,  $0000,  $0000,  $0000   ; 5D96   0003 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5D9A   0000 0000 0000 0000

        SLR     R0,     1                       ; 5D9E   0060
        ADDR    R6,     R0                      ; 5D9F   00F0
        ADDR    R6,     R0                      ; 5DA0   00F0
        ADDR    R6,     R0                      ; 5DA1   00F0
        ADDR    R6,     R0                      ; 5DA2   00F0
        ADDR    R7,     R0                      ; 5DA3   00F8
        ADDR    R7,     R0                      ; 5DA4   00F8
        ADDR    R7,     R4                      ; 5DA5   00FC
        ADDR    R7,     R4                      ; 5DA6   00FC
        ADDR    R7,     R4                      ; 5DA7   00FC
        ADDR    R7,     R6                      ; 5DA8   00FE
        RSWD    R6                              ; 5DA9   003E
        RSWD    R6                              ; 5DAA   003E
        MOVR    R7,     R6                      ; 5DAB   00BE
        ADDR    R7,     R6                      ; 5DAC   00FE
        ADDR    R7,     R6                      ; 5DAD   00FE
        ADDR    R7,     R6                      ; 5DAE   00FE
        SARC    R2,     2                       ; 5DAF   007E
        SARC    R2,     2                       ; 5DB0   007E
        RSWD    R6                              ; 5DB1   003E
        RSWD    R4                              ; 5DB2   003C
        INCR    R2                              ; 5DB3   000A
        COMR    R2                              ; 5DB4   001A
        COMR    R3                              ; 5DB5   001B
L_5DB6:
        DECR    R7                              ; 5DB6   0017
L_5DB7:
        DECR    R7                              ; 5DB7   0017
L_5DB8:
        DECR    R7                              ; 5DB8   0017

        DECLE   $003F,  $003F,  $003E,  $0000   ; 5DB9   003F 003F 003E 0000
        DECLE   $0000                           ; 5DBD   0000

        SLR     R3,     2                       ; 5DBE   0067
        ADDR    R4,     R7                      ; 5DBF   00E7
        ADDR    R4,     R7                      ; 5DC0   00E7
        ADDR    R4,     R7                      ; 5DC1   00E7
        ADDR    R4,     R7                      ; 5DC2   00E7
        ADDR    R4,     R7                      ; 5DC3   00E7

        DECLE   $0062,  $0063,  $0063,  $0063   ; 5DC4   0062 0063 0063 0063
        DECLE   $0063,  $0077,  $0077,  $0076   ; 5DC8   0063 0077 0077 0076
        DECLE   $0036,  $0036,  $003E,  $007E   ; 5DCC   0036 0036 003E 007E
        DECLE   $007E,  $007E,  $007E,  $007E   ; 5DD0   007E 007E 007E 007E
        DECLE   $001E,  $001F,  $003F,  $007F   ; 5DD4   001E 001F 003F 007F
        DECLE   $007F,  $007F,  $007F,  $007F   ; 5DD8   007F 007F 007F 007F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5DDC   003F 003F 003F 003F
        DECLE   $003F,  $001E,  $000A,  $001A   ; 5DE0   003F 001E 000A 001A
        DECLE   $001B,  $001B,  $001B,  $001B   ; 5DE4   001B 001B 001B 001B
        DECLE   $001B,  $003F,  $003E,  $003E   ; 5DE8   001B 003F 003E 003E
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DEC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0007   ; 5DF0   0000 0000 0003 0007
        DECLE   $0005,  $0005,  $0007,  $0000   ; 5DF4   0005 0005 0007 0000
        DECLE   $0000,  $0001,  $0001,  $0001   ; 5DF8   0000 0001 0001 0001
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E00   0000 0000 0000 0000
        DECLE   $0000,  $0060,  $00F0,  $00F0   ; 5E04   0000 0060 00F0 00F0
        DECLE   $00F0,  $00F8,  $00FC,  $007E   ; 5E08   00F0 00F8 00FC 007E
        DECLE   $003E,  $00FF,  $00FF,  $00FF   ; 5E0C   003E 00FF 00FF 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5E10   00FF 00FF 00FF 00FF
        DECLE   $00DF,  $001F,  $001E,  $000A   ; 5E14   00DF 001F 001E 000A
        DECLE   $001A,  $001B,  $0013,  $003F   ; 5E18   001A 001B 0013 003F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E1C   0000 0000 0000 0000
        DECLE   $0004,  $0000,  $0011,  $0000   ; 5E20   0004 0000 0011 0000
        DECLE   $0004,  $00C0,  $00EE,  $00FF   ; 5E24   0004 00C0 00EE 00FF
        DECLE   $00FF,  $00FF,  $00FF,  $00EE   ; 5E28   00FF 00FF 00FF 00EE
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E2C   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E30   0000 0000 0000 0000
        DECLE   $0000,  $0003,  $00FF,  $00FF   ; 5E34   0000 0003 00FF 00FF
        DECLE   $003F,  $00FF,  $00FF,  $00FF   ; 5E38   003F 00FF 00FF 00FF
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E3C   0000 0000 0000 0000
        DECLE   $00A0,  $00F0,  $00F8,  $00FC   ; 5E40   00A0 00F0 00F8 00FC
        DECLE   $00FE,  $007F,  $00FF           ; 5E44   00FE 007F 00FF

        ADDR    R3,     R5                      ; 5E47   00DD
        MOVR    R3,     R6                      ; 5E48   009E
        MOVR    R1,     R7                      ; 5E49   008F

        DECLE   $0007,  $0003,  $0000,  $0000   ; 5E4A   0007 0003 0000 0000
        DECLE   $0080,  $00C0,  $00E0,  $00F0   ; 5E4E   0080 00C0 00E0 00F0
        DECLE   $00F8,  $0078,  $0038,  $0018   ; 5E52   00F8 0078 0038 0018
        DECLE   $0030,  $0060,  $00E0,  $00E0   ; 5E56   0030 0060 00E0 00E0
        DECLE   $00E0,  $00E0,  $0000,  $0000   ; 5E5A   00E0 00E0 0000 0000

        COMR    R0                              ; 5E5E   0018
        RSWD    R4                              ; 5E5F   003C
        RSWD    R4                              ; 5E60   003C
        RSWD    R4                              ; 5E61   003C
        ADDR    R7,     R4                      ; 5E62   00FC
        ADDR    R7,     R4                      ; 5E63   00FC
        MOVR    R5,     R6                      ; 5E64   00AE
        MOVR    R5,     R7                      ; 5E65   00AF

        DECLE   $00FF,  $007F,  $007F,  $003F   ; 5E66   00FF 007F 007F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5E6A   003F 003F 003F 003F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5E6E   003F 003F 003F 003F

        COMR    R6                              ; 5E72   001E
        INCR    R2                              ; 5E73   000A
        COMR    R2                              ; 5E74   001A
        COMR    R2                              ; 5E75   001A
        COMR    R3                              ; 5E76   001B
L_5E77:
        DECR    R7                              ; 5E77   0017
L_5E78:
        DECR    R7                              ; 5E78   0017

        DECLE   $001F,  $003F,  $003E,  $0001   ; 5E79   001F 003F 003E 0001
        DECLE   $0003,  $0002,  $0002,  $0003   ; 5E7D   0003 0002 0002 0003
        DECLE   $0000,  $0000,  $0000           ; 5E81   0000 0000 0000

        SWAP    R1,     1                       ; 5E84   0041
        ADDR    R5,     R7                      ; 5E85   00EF

        DECLE   $00FF,  $00FF,  $00E3,  $0000   ; 5E86   00FF 00FF 00E3 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E8A   0000 0000 0000 0000
        DECLE   $0030,  $0078,  $0078,  $0078   ; 5E8E   0030 0078 0078 0078
        DECLE   $0078,  $0078,  $009C,  $009E   ; 5E92   0078 0078 009C 009E
        DECLE   $00FE,  $00FF,  $00FF,  $003F   ; 5E96   00FE 00FF 00FF 003F
        DECLE   $007F,  $00FF,  $00FF,  $00FF   ; 5E9A   007F 00FF 00FF 00FF
        DECLE   $00FF,  $009F,  $001F,  $001F   ; 5E9E   00FF 009F 001F 001F

        COMR    R6                              ; 5EA2   001E
        INCR    R2                              ; 5EA3   000A
        COMR    R2                              ; 5EA4   001A
        COMR    R3                              ; 5EA5   001B
L_5EA6:
        DECR    R7                              ; 5EA6   0017
L_5EA7:
        DECR    R7                              ; 5EA7   0017
L_5EA8:
        DECR    R7                              ; 5EA8   0017

        DECLE   $003F,  $003E,  $003C,  $0000   ; 5EA9   003F 003E 003C 0000
        DECLE   $0000,  $0080,  $00C0,  $00E0   ; 5EAD   0000 0080 00C0 00E0
        DECLE   $00F0,  $00F8,  $0078,  $0038   ; 5EB1   00F0 00F8 0078 0038
        DECLE   $0030,  $0060,  $00E0,  $00A0   ; 5EB5   0030 0060 00E0 00A0
        DECLE   $00A0,  $00E0,  $0000,  $0000   ; 5EB9   00A0 00E0 0000 0000
        DECLE   $0000                           ; 5EBD   0000

        COMR    R0                              ; 5EBE   0018
        RSWD    R4                              ; 5EBF   003C
        RSWD    R4                              ; 5EC0   003C
        RSWD    R4                              ; 5EC1   003C
        RSWD    R4                              ; 5EC2   003C
        RSWD    R4                              ; 5EC3   003C
        COMR    R6                              ; 5EC4   001E
        INCR    R7                              ; 5EC5   000F
        INCR    R7                              ; 5EC6   000F
L_5EC7:
        INCR    R7                              ; 5EC7   000F
L_5EC8:
        INCR    R7                              ; 5EC8   000F
L_5EC9:
        INCR    R7                              ; 5EC9   000F

L_5ECA:
        SLL     R3,     2                       ; 5ECA   004F
L_5ECB:
        ADDR    R5,     R7                      ; 5ECB   00EF
        ADDR    R5,     R7                      ; 5ECC   00EF

        DECLE   $00FF,  $00FF,  $00FF,  $003F   ; 5ECD   00FF 00FF 00FF 003F
        DECLE   $001F                           ; 5ED1   001F

        COMR    R6                              ; 5ED2   001E
        COMR    R6                              ; 5ED3   001E
        COMR    R2                              ; 5ED4   001A
        INCR    R2                              ; 5ED5   000A
        COMR    R2                              ; 5ED6   001A
        COMR    R3                              ; 5ED7   001B
L_5ED8:
        DECR    R7                              ; 5ED8   0017
L_5ED9:
        DECR    R7                              ; 5ED9   0017

        DECLE   $001F,  $003E,  $0000,  $0000   ; 5EDA   001F 003E 0000 0000
        DECLE   $0000,  $0001                   ; 5EDE   0000 0001

        DIS                                     ; 5EE0   0003
        SETC                                    ; 5EE1   0007
        INCR    R7                              ; 5EE2   000F

        COMR    R6                              ; 5EE3   001E
L_5EE4:
        RSWD    R5                              ; 5EE4   003D
        DECLE   $00FB,  $00B3,  $00A3,  $00E3   ; 5EE5   00FB 00B3 00A3 00E3
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5EE9   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5EED   0000 0000

        SLR     R0,     1                       ; 5EEF   0060
        ADDR    R6,     R0                      ; 5EF0   00F0
        ADDR    R6,     R0                      ; 5EF1   00F0
        ADDR    R6,     R0                      ; 5EF2   00F0
        ADDR    R6,     R0                      ; 5EF3   00F0
        ADDR    R6,     R0                      ; 5EF4   00F0
        SARC    R0,     1                       ; 5EF5   0078
        ADDR    R7,     R0                      ; 5EF6   00F8
        ADDR    R7,     R4                      ; 5EF7   00FC
        ADDR    R7,     R4                      ; 5EF8   00FC
        ADDR    R7,     R6                      ; 5EF9   00FE
        ADDR    R7,     R6                      ; 5EFA   00FE
        RSWD    R6                              ; 5EFB   003E
        MOVR    R7,     R6                      ; 5EFC   00BE
        ADDR    R7,     R6                      ; 5EFD   00FE
        ADDR    R7,     R6                      ; 5EFE   00FE
        ADDR    R7,     R6                      ; 5EFF   00FE
        SARC    R2,     2                       ; 5F00   007E
        SARC    R2,     2                       ; 5F01   007E
        RSWD    R4                              ; 5F02   003C
        INCR    R2                              ; 5F03   000A
        COMR    R2                              ; 5F04   001A
        COMR    R3                              ; 5F05   001B
L_5F06:
        DECR    R7                              ; 5F06   0017
L_5F07:
        DECR    R7                              ; 5F07   0017
L_5F08:
        DECR    R7                              ; 5F08   0017

        DECLE   $003F,  $003E,  $003C,  $0001   ; 5F09   003F 003E 003C 0001
        DECLE   $0003,  $0002,  $0002,  $0003   ; 5F0D   0003 0002 0002 0003
        DECLE   $0000,  $0000,  $0001,  $0001   ; 5F11   0000 0000 0001 0001
        DECLE   $0001,  $0001,  $0001,  $0000   ; 5F15   0001 0001 0001 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F19   0000 0000 0000 0000
        DECLE   $0000,  $0030,  $0078,  $0078   ; 5F1D   0000 0030 0078 0078
        DECLE   $0078,  $0078,  $0078,  $009C   ; 5F21   0078 0078 0078 009C
        DECLE   $009E,  $00FE,  $00FF,  $00FF   ; 5F25   009E 00FE 00FF 00FF

        SARC    R3,     2                       ; 5F29   007F
        MOVR    R3,     R7                      ; 5F2A   009F
        ADDR    R3,     R7                      ; 5F2B   00DF

        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 5F2C   00FF 00FF 00FF 00FF
        DECLE   $003F,  $001F                   ; 5F30   003F 001F

        COMR    R6                              ; 5F32   001E
        INCR    R2                              ; 5F33   000A
        COMR    R2                              ; 5F34   001A
        COMR    R3                              ; 5F35   001B
        DECR    R3                              ; 5F36   0013
L_5F37:
        DECR    R7                              ; 5F37   0017

        DECLE   $003F,  $003F,  $003E,  $003C   ; 5F38   003F 003F 003E 003C
        DECLE   $0003,  $0007,  $0005,  $0005   ; 5F3C   0003 0007 0005 0005
        DECLE   $0007,  $0000,  $0001,  $0003   ; 5F40   0007 0000 0001 0003
        DECLE   $0003,  $0003,  $0003,  $0003   ; 5F44   0003 0003 0003 0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F48   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0060,  $00F0   ; 5F4C   0000 0000 0060 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $00F0   ; 5F50   00F0 00F0 00F0 00F0
        DECLE   $0038,  $003C,  $00FC,  $00FE   ; 5F54   0038 003C 00FC 00FE
        DECLE   $00FE,  $00FE,  $003E,  $00BE   ; 5F58   00FE 00FE 003E 00BE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 5F5C   00FE 00FE 00FE 00FE
        DECLE   $007E,  $003E,  $003C,  $0014   ; 5F60   007E 003E 003C 0014
        DECLE   $0034,  $0036,  $0026,  $002E   ; 5F64   0034 0036 0026 002E
        DECLE   $007E,  $007E,  $007C,  $007C   ; 5F68   007E 007E 007C 007C
        DECLE   $0000,  $0000,  $000E,  $000E   ; 5F6C   0000 0000 000E 000E
        DECLE   $000A,  $000B,  $000F,  $0000   ; 5F70   000A 000B 000F 0000
        DECLE   $0000,  $0001,  $000F,  $000F   ; 5F74   0000 0001 000F 000F
        DECLE   $000F,  $000F,  $0000,  $0000   ; 5F78   000F 000F 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0018   ; 5F7C   0000 0000 0000 0018
        DECLE   $003C,  $003C,  $003C,  $003C   ; 5F80   003C 003C 003C 003C
        DECLE   $003C,  $0038,  $0038,  $0078   ; 5F84   003C 0038 0038 0078
        DECLE   $00FC,  $00FE,  $00FE,  $00FE   ; 5F88   00FC 00FE 00FE 00FE
        DECLE   $00FE,  $00FE,  $00FE,  $00FE   ; 5F8C   00FE 00FE 00FE 00FE
        DECLE   $00FE,  $007E,  $007E,  $003E   ; 5F90   00FE 007E 007E 003E
        DECLE   $003C,  $003C,  $0014,  $0034   ; 5F94   003C 003C 0014 0034
        DECLE   $0034,  $0034,  $006C,  $007C   ; 5F98   0034 0034 006C 007C
        DECLE   $0000,  $0080,  $0080,  $0080   ; 5F9C   0000 0080 0080 0080
        DECLE   $0080,  $0080,  $0000,  $0080   ; 5FA0   0080 0080 0000 0080
        DECLE   $00C0,  $00C0,  $00C0,  $00C0   ; 5FA4   00C0 00C0 00C0 00C0
        DECLE   $00C0,  $0080,  $0080,  $0080   ; 5FA8   00C0 0080 0080 0080
        DECLE   $0003,  $0007,  $0007,  $0007   ; 5FAC   0003 0007 0007 0007
        DECLE   $0007,  $0007,  $0003,  $0007   ; 5FB0   0007 0007 0003 0007
        DECLE   $000F,  $000F,  $001F,  $001F   ; 5FB4   000F 000F 001F 001F
        DECLE   $003F,  $003F,  $003F,  $003F   ; 5FB8   003F 003F 003F 003F
        DECLE   $001F,  $003F,  $003F,  $007F   ; 5FBC   001F 003F 003F 007F
        DECLE   $00FE,  $00FE,  $00FE,  $00AC   ; 5FC0   00FE 00FE 00FE 00AC
        DECLE   $00DC,  $00FC,  $00F8,  $0038   ; 5FC4   00DC 00FC 00F8 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FC8   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FCC   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FD0   0000 0000 0000 0000
        DECLE   $0000                           ; 5FD4   0000

        CLRC                                    ; 5FD5   0006
        INCR    R7                              ; 5FD6   000F
        INCR    R7                              ; 5FD7   000F
L_5FD8:
        INCR    R7                              ; 5FD8   000F
L_5FD9:
        INCR    R7                              ; 5FD9   000F
L_5FDA:
        INCR    R7                              ; 5FDA   000F

L_5FDB:
        CLRC                                    ; 5FDB   0006
L_5FDC:
        INCR    R6                              ; 5FDC   000E
        DECLE   $001F,  $001F,  $003F,  $003F   ; 5FDD   001F 001F 003F 003F
        DECLE   $007F,  $007F,  $007F,  $00FF   ; 5FE1   007F 007F 007F 00FF

        ADDR    R7,     R6                      ; 5FE5   00FE
        ADDR    R7,     R6                      ; 5FE6   00FE
        TSTR    R6                              ; 5FE7   00B6
        RRC     R2,     2                       ; 5FE8   0076
        ADDR    R5,     R7                      ; 5FE9   00EF
        ADDR    R5,     R7                      ; 5FEA   00EF
        ADDR    R0,     R7                      ; 5FEB   00C7

        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FEC   0000 0000 0000 0000
        DECLE   $00A0,  $00F0,  $00F8,  $00FC   ; 5FF0   00A0 00F0 00F8 00FC
        DECLE   $00FE,  $007F,  $00FF           ; 5FF4   00FE 007F 00FF

        ADDR    R3,     R5                      ; 5FF7   00DD
        MOVR    R3,     R6                      ; 5FF8   009E
        MOVR    R1,     R7                      ; 5FF9   008F

        SETC                                    ; 5FFA   0007
        DIS                                     ; 5FFB   0003
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FFC   0000 0000 0000 0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $503A       <entry>
;;  $5052       $503F  
;;  $5053       <entry>
;;  $5089       $59A7  
;;  $508A       $5088  
;;  $508E       $540A  
;;  $508F       $508D   $53D5  
;;  $50A8       $50D5  
;;  $50B5       $50D3  
;;  $50B6       $50B4  
;;  $50C7       $50C3  
;;  $50D7       $50AE  
;;  $50D9       $50F8  
;;  $50EB       $50E4  
;;  $50ED       $50F3  
;;  $5154       $5611  
;;  $5173       $5171  
;;  $517D       $517B  
;;  $5187       $5185   $5187  
;;  $5193       $5191   $5193  
;;  $519D       $519D  
;;  $51BB       $51B9  
;;  $51CE       $539F   $53A3  
;;  $51CF       $54C9  
;;  $51D7       $51ED  
;;  $51F0       <entry>
;;  $5203       $5200  
;;  $520D       $5209  
;;  $5225       $5218  
;;  $5229       $5223  
;;  $5251       $5240  
;;  $5256       $53F2  
;;  $5258       $5254  
;;  $525E       $5282  
;;  $5277       $5273  
;;  $527A       $5295  
;;  $527F       $5260  
;;  $5284       $522B   $523E   $5247  
;;  $5285       $526E  
;;  $5290       $528A  
;;  $5297       <entry>
;;  $52AD       $524F   $5408  
;;  $52C2       $5419  
;;  $52C7       $53F5  
;;  $52D2       $5070  
;;  $52D3       $52D1  
;;  $52D9       $52DF  
;;  $52F1       $52A5  
;;  $52F2       <entry> $510B  
;;  $52FE       $5325  
;;  $5323       $5320  
;;  $5346       $5338   $5355  
;;  $536A       $536E  
;;  $5370       $536B  
;;  $5373       $5383  
;;  $537E       $537A  
;;  $5385       $53CD  
;;  $53B8       $534B   $53C9   $53E1  
;;  $53BF       $53BB  
;;  $53D8       $5344  
;;  $53F7       $53D3  
;;  $5400       $53FD  
;;  $540A       $53FB  
;;  $540D       $524C   $52AA  
;;  $541B       $52A0   $5363   $539C  
;;  $5423       $532E  
;;  $5425       $5334  
;;  $5427       $51E4  
;;  $542F       $5329   $5340  
;;  $5431       $51DA   $541E  
;;  $5452       $544E  
;;  $5466       $5462  
;;  $5484       $5488  
;;  $548A       $5485  
;;  $5495       $555A  
;;  $54B8       $54AF   $54B3  
;;  $54C4       $54B6  
;;  $54E1       $54DD  
;;  $54F3       $54F0  
;;  $54FD       $54FA  
;;  $550A       $5504  
;;  $5510       $559F  
;;  $5530       $552C  
;;  $5539       $5493  
;;  $554F       $554A  
;;  $5556       $5553  
;;  $555C       $54A3   $54C2  
;;  $5574       $57F0  
;;  $5575       $5537   $5573  
;;  $557D       $557A  
;;  $5580       $5456   $545A   $5468   $546F  
;;  $5581       $5508   $550C  
;;  $559E       $55A5  
;;  $55A1       $5584  
;;  $55A7       $5524  
;;  $55BC       $556D  
;;  $55CA       $59C7  
;;  $55D7       $5385   $53E5  
;;  $55E8       <entry>
;;  $5616       $508A  
;;  $5632       $564B  
;;  $5635       $563C  
;;  $564E       $57B4  
;;  $564F       $564D  
;;  $5650       $5705  
;;  $567C       $570C  
;;  $5686       $5681  
;;  $5692       $5725  
;;  $5698       $5695  
;;  $56BA       $56B4  
;;  $56C9       $56C3   $56CE  
;;  $56E3       $56DF  
;;  $56E7       $56F8  
;;  $56F1       $56EE  
;;  $56F3       $56E5  
;;  $5708       $5674   $567A  
;;  $570E       $568B  
;;  $571B       $5715  
;;  $5723       $5690   $571D  
;;  $5768       $5764  
;;  $57AB       <entry>
;;  $57B9       $57C8  
;;  $57C6       $57C0  
;;  $57CB       $57AD   $57B1  
;;  $57EA       $57E7  
;;  $57F3       $57E4   $57EC  
;;  $57F4       $57D2   $57D8  
;;  $5803       $58B4   $58DF  
;;  $5835       $581D   $5832  
;;  $5849       $5846  
;;  $5852       $584F  
;;  $587D       $587A  
;;  $5885       $5880  
;;  $5890       $588C  
;;  $5896       $5861   $5865   $5874   $5892  
;;  $5898       $57FA  
;;  $589F       $5768  
;;  $58A0       $5801  
;;  $58B6       $58A6  
;;  $58C5       $5093   $5098   $52AF   $5402   $5521   $59E9   $5A5E  
;;  $58C6       $58C4  
;;  $58FE       $58FA  
;;  $590F       $5918   $5927  
;;  $592D       $58E5   $58E9  
;;  $5968       $5968  
;;  $596B       $5963  
;;  $596D       $5969  
;;  $597D       $595C  
;;  $59A2       $5998   $599B   $59C5  
;;  $59AA       $5984   $5988  
;;  $59AB       $5994  
;;  $59BE       $59B3  
;;  $59C7       $59AD   $59B7  
;;  $59CB       $57C3  
;;  $59F8       $59D9  
;;  $59FD       $530C   $5568   $59F2  
;;  $5A0D       $5A0A  
;;  $5A0F       <entry>
;;  $5A12       $5A71  
;;  $5A30       $5A23  
;;  $5A47       $5A41  
;;  $5A62       $5A36  
;;  $5A66       $5A45   $5A49  
;;  $5A6F       $5A19  
;;  $5A70       $5A32  
;;  $5ADA       $5ADA  
;;  $5AE7       $5AE5  
;;  $5BA7       $5BA7  
;;  $5BE5       $5BE3  
;;  $5C97       $5C97  
;;  $5CC7       $5CC7  
;;  $5CC8       $5CC8  
;;  $5CF8       $5CF8  
;;  $5D56       $5D56  
;;  $5D57       $5D57  
;;  $5D58       $5D58  
;;  $5D77       $5D75  
;;  $5D78       $5D76  
;;  $5D79       $5D77  
;;  $5D7A       $5D78  
;;  $5D7B       $5D79  
;;  $5D88       $5D88  
;;  $5D89       $5D89  
;;  $5DB6       $5DB6  
;;  $5DB7       $5DB7  
;;  $5DB8       $5DB8  
;;  $5E77       $5E77  
;;  $5E78       $5E78  
;;  $5EA6       $5EA6  
;;  $5EA7       $5EA7  
;;  $5EA8       $5EA8  
;;  $5EC7       $5EC5  
;;  $5EC8       $5EC6  
;;  $5EC9       $5EC7  
;;  $5ECA       $5EC8  
;;  $5ECB       $5EC9  
;;  $5ED8       $5ED8  
;;  $5ED9       $5ED9  
;;  $5EE4       $5EE2  
;;  $5F06       $5F06  
;;  $5F07       $5F07  
;;  $5F08       $5F08  
;;  $5F37       $5F37  
;;  $5FD8       $5FD6  
;;  $5FD9       $5FD7  
;;  $5FDA       $5FD8  
;;  $5FDB       $5FD9  
;;  $5FDC       $5FDA  
;; ======================================================================== ;;
