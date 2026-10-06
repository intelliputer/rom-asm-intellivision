
        ORG     $5000
.HEADER:
        BIDECLE $5396           ; 5000  Ptr: MOB graphic images
        BIDECLE $5050           ; 5002  Ptr: EXEC timer table
        BIDECLE $505A           ; 5004  Ptr: Start of game
        BIDECLE $52EE           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $5043           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0080           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $000E,  $0003   ; 500F  Color Stack init (0, 1)
        DECLE   $000E,  $0003   ; 5011  Color Stack init (2, 3)
        DECLE   $0001           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TITLE:
        DECLE   $004E                           ; 501C  Cartridge year
        STRING  "ARMOR BATTLE"                  ; 501D  Title string
        DECLE   $0000                           ; 5029  

.TITLECODE:
        PSHR    R5                              ; 502A   0275
        MVII    #$0007, R3                      ; 502B   02BB 0007
        CMP     .PSG0.lft_hand,R3               ; 502D   0343 01FF
        BNEQ    L_5042                          ; 502F   020C 0011

        MVII    #$02A7, R4                      ; 5031   02BC 02A7

        JSR     R5,     X_PRINT_R5              ; 5033   0004 0118 007B
        STRING  "D.E.I."                        ; 5036  
        DECLE   $0000                           ; 503C   0000

        MVII    #$0004, R0                      ; 503D   02B8 0004

        JSR     R5,     X_PLAY_CHEER1           ; 503F   0004 011C 02D5

L_5042:
        PULR    R7                              ; 5042   02B7

.GRAM_INIT_5043:
        DECLE   $0030           ; 5043  # of GRAM cards to init
        DECLE   $0001,  $0380   ; 5044  #00-07:  CART #00-07 ----
        DECLE   $0011,  $0380   ; 5046  #08-0F:  CART #08-0F ----
        DECLE   $0021,  $0380   ; 5048  #10-17:  CART #10-17 ----
        DECLE   $0031,  $0380   ; 504A  #18-1F:  CART #18-1F ----
        DECLE   $0041,  $0380   ; 504C  #20-27:  CART #20-27 ----
        DECLE   $0051,  $0380   ; 504E  #28-2F:  CART #28-2F ----

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5050  Timer dispatch/interval
        DECLE   $004E,  $0055,  $0001,  $0000; 5054  Timer dispatch/interval
        BIDECLE $0000           ; 5058  End of timer table

.START:
        PSHR    R5                              ; 505A   0275
        MVII    #$0034, R0                      ; 505B   02B8 0034
        MVO     R0,     G_015D                  ; 505D   0240 015D
        MVO     R0,     G_015E                  ; 505F   0240 015E
L_5061:
        MVII    #$00F0, R0                      ; 5061   02B8 00F0
        MVII    #$0200, R4                      ; 5063   02BC 0200

        JSR     R5,     X_FILL_ZERO             ; 5065   0004 0114 0338

        MVII    #$016B, R4                      ; 5068   02BC 016B
        MVII    #$015D, R3                      ; 506A   02BB 015D
        MVII    #$0001, R5                      ; 506C   02BD 0001
L_506E:
        MVI@    R4,     R0                      ; 506E   02A0
        SUBI    #$0002, R0                      ; 506F   0338 0002
        ADD@    R3,     R0                      ; 5071   02D8
        BPL     L_5075                          ; 5072   0203 0001

        CLRR    R0                              ; 5074   01C0
L_5075:
        MVO@    R0,     R3                      ; 5075   0258
        INCR    R3                              ; 5076   000B
        DECR    R5                              ; 5077   0015
        BPL     L_506E                          ; 5078   0223 000B

        MVII    #$0219, R4                      ; 507A   02BC 0219
        SDBD                                    ; 507C   0001
        MVII    #$510C, R1                      ; 507D   02B9 000C 0051
        MVII    #$0001, R3                      ; 5080   02BB 0001

        JSR     R5,     X_PRINT_R1              ; 5082   0004 0118 0067

        MVI     G_015D, R0                      ; 5085   0280 015D
        MVII    #$0003, R1                      ; 5087   02B9 0003

        JSR     R5,     X_PRNUM_RGT             ; 5089   0004 0118 00C5

        MVII    #$0241, R4                      ; 508C   02BC 0241
        SDBD                                    ; 508E   0001
        MVII    #$5114, R1                      ; 508F   02B9 0014 0051
        CLRR    R3                              ; 5092   01DB

        JSR     R5,     X_PRINT_R1              ; 5093   0004 0118 0067

        MVI     G_015E, R0                      ; 5096   0280 015E
        MVII    #$0004, R1                      ; 5098   02B9 0004

        JSR     R5,     X_PRNUM_RGT             ; 509A   0004 0118 00C5

        MVII    #$0025, R0                      ; 509D   02B8 0025
        MVII    #$0007, R3                      ; 509F   02BB 0007
        MVII    #$02A1, R4                      ; 50A1   02BC 02A1

        JSR     R5,     X_PRINT_R5              ; 50A3   0004 0118 007B
        STRING  "Push disc to play"             ; 50A6  
        DECLE   $0000                           ; 50B7   0000

        SDBD                                    ; 50B8   0001
        MVII    #$5054, R1                      ; 50B9   02B9 0054 0050

        JSR     R5,     X_TIMER_STOP            ; 50BC   0004 0118 0038

        SDBD                                    ; 50BF   0001
        MVII    #$1906, R0                      ; 50C0   02B8 0006 0019
        MVO     R0,     G_035D                  ; 50C3   0240 035D
        MVI     G_015D, R0                      ; 50C5   0280 015D
        TSTR    R0                              ; 50C7   0080
        BEQ     L_50F0                          ; 50C8   0204 0026

        MVI     G_015E, R0                      ; 50CA   0280 015E
        TSTR    R0                              ; 50CC   0080
        BEQ     L_50E5                          ; 50CD   0204 0016

        MVII    #$0014, R0                      ; 50CF   02B8 0014

        JSR     R5,     .EXEC.A62               ; 50D1   0004 0118 0262

        SDBD                                    ; 50D4   0001
        MVII    #$50DB, R0                      ; 50D5   02B8 00DB 0050
        MVO     R0,     G_035D                  ; 50D8   0240 035D
        PULR    R7                              ; 50DA   02B7

        MOVR    R1,     R3                      ; 50DB   008B
        RLC     R1,     1                       ; 50DC   0051
        MOVR    R1,     R3                      ; 50DD   008B
        RLC     R1,     1                       ; 50DE   0051
        MOVR    R1,     R3                      ; 50DF   008B
        RLC     R1,     1                       ; 50E0   0051
        MOVR    R1,     R3                      ; 50E1   008B
        RLC     R1,     1                       ; 50E2   0051
        MOVR    R1,     R3                      ; 50E3   008B
        RLC     R1,     1                       ; 50E4   0051
L_50E5:
        MVII    #$0001, R3                      ; 50E5   02BB 0001
        MVII    #$0002, R0                      ; 50E7   02B8 0002
        PSHR    R0                              ; 50E9   0270
        SDBD                                    ; 50EA   0001
        MVII    #$510C, R1                      ; 50EB   02B9 000C 0051
        B       L_50F8                          ; 50EE   0200 0008

L_50F0:
        CLRR    R3                              ; 50F0   01DB
        MVII    #$0001, R0                      ; 50F1   02B8 0001
        PSHR    R0                              ; 50F3   0270
        SDBD                                    ; 50F4   0001
        MVII    #$5114, R1                      ; 50F5   02B9 0014 0051
L_50F8:
        CLRR    R0                              ; 50F8   01C0
        MVII    #$02A1, R4                      ; 50F9   02BC 02A1
        MVO@    R0,     R4                      ; 50FB   0260
        MVO@    R0,     R4                      ; 50FC   0260
        MVO@    R0,     R4                      ; 50FD   0260

        JSR     R5,     X_PRINT_R1              ; 50FE   0004 0118 0067

        SUB@    R6,     R4                      ; 5101   0334
        SDBD                                    ; 5102   0001
        MVII    #$511C, R1                      ; 5103   02B9 001C 0051
        MVII    #$0028, R0                      ; 5106   02B8 0028

        JSR     R5,     X_PRPAD_R1              ; 5108   0004 0118 006C

        PULR    R7                              ; 510B   02B7

        DECLE   $0042,  $006C,  $0075,  $0065   ; 510C   0042 006C 0075 0065
        DECLE   $0020,  $0020,  $003A,  $0000   ; 5110   0020 0020 003A 0000

        SWAP    R2,     1                       ; 5114   0042
        SAR     R0,     2                       ; 5115   006C
        SLR     R1,     1                       ; 5116   0061
        SLR     R3,     1                       ; 5117   0063
        SAR     R3,     1                       ; 5118   006B
L_5119:
        NEGR    R0                              ; 5119   0020
        DECLE   $003A,  $0000,  $0077,  $0069   ; 511A   003A 0000 0077 0069
        DECLE   $006E,  $0073,  $0021,  $0000   ; 511E   006E 0073 0021 0000
        DECLE   $0300,  $0000,  $0005,  $005E   ; 5122   0300 0000 0005 005E
        DECLE   $0001,  $0000                   ; 5126   0001 0000

        INCR    R5                              ; 5128   000D
        ADDR    R7,     R2                      ; 5129   00FA
        RLC     R2,     2                       ; 512A   0056
        MOVR    R5,     R1                      ; 512B   00A9
        RLC     R3,     2                       ; 512C   0057
        MOVR    R5,     R1                      ; 512D   00A9
        CMPR    R2,     R7                      ; 512E   0157
        MVI@    R5,     R1                      ; 512F   02A9
        RLC     R3,     2                       ; 5130   0057
        ANDR    R5,     R1                      ; 5131   01A9
        RLC     R3,     2                       ; 5132   0057
        ANDR    R5,     R1                      ; 5133   01A9
        CMPR    R2,     R7                      ; 5134   0157
        AND@    R5,     R1                      ; 5135   03A9
        RLC     R3,     2                       ; 5136   0057
        XOR@    R3,     R4                      ; 5137   03DC
        DECR    R3                              ; 5138   0013
        ADCR    R6                              ; 5139   002E
        SLLC    R3,     2                       ; 513A   005F
        INCR    R1                              ; 513B   0009
        EIS                                     ; 513C   0002
        INCR    R5                              ; 513D   000D
        ADDR    R7,     R2                      ; 513E   00FA
        RLC     R2,     2                       ; 513F   0056
        MOVR    R7,     R1                      ; 5140   00B9
        RLC     R3,     2                       ; 5141   0057
        MOVR    R7,     R1                      ; 5142   00B9
        CMPR    R2,     R7                      ; 5143   0157
        MVII    #$0057, R1                      ; 5144   02B9 0057
        ANDR    R7,     R1                      ; 5146   01B9
        RLC     R3,     2                       ; 5147   0057
        ANDR    R7,     R1                      ; 5148   01B9
        CMPR    R2,     R7                      ; 5149   0157
        ANDI    #$0057, R1                      ; 514A   03B9 0057
        XOR@    R3,     R4                      ; 514C   03DC
        DECR    R3                              ; 514D   0013
        ADCR    R6                              ; 514E   002E
        SLLC    R3,     2                       ; 514F   005F
        INCR    R1                              ; 5150   0009
        DECR    R4                              ; 5151   0014
        INCR    R5                              ; 5152   000D
        ADDR    R7,     R2                      ; 5153   00FA
        RLC     R2,     2                       ; 5154   0056
        MOVR    R7,     R1                      ; 5155   00B9
        RLC     R3,     2                       ; 5156   0057
        MOVR    R7,     R1                      ; 5157   00B9
        CMPR    R2,     R7                      ; 5158   0157
        MVII    #$0057, R1                      ; 5159   02B9 0057
        ANDR    R7,     R1                      ; 515B   01B9
        RLC     R3,     2                       ; 515C   0057
        ANDR    R7,     R1                      ; 515D   01B9
        CMPR    R2,     R7                      ; 515E   0157
        ANDI    #$0057, R1                      ; 515F   03B9 0057
        MVI@    R5,     R6                      ; 5161   02AE
L_5162:
        DECR    R7                              ; 5162   0017

        DECLE   $00B2,  $005C,  $0001,  $0026   ; 5163   00B2 005C 0001 0026
        DECLE   $0000                           ; 5167   0000

        MVI@    R5,     R6                      ; 5168   02AE
L_5169:
        DECR    R7                              ; 5169   0017

        MOVR    R5,     R6                      ; 516A   00AE
L_516B:
        DECR    R7                              ; 516B   0017

        DECLE   $0001                           ; 516C   0001

        NEGR    R6                              ; 516D   0026
        INCR    R5                              ; 516E   000D
        EIS                                     ; 516F   0002
        SLLC    R1,     2                       ; 5170   005D
        ADCR    R1                              ; 5171   0029
        SLLC    R1,     2                       ; 5172   005D
        ADCR    R1                              ; 5173   0029
        CMPR    R3,     R5                      ; 5174   015D
        BNC     L_5119                          ; 5175   0229 005D

        SUBR    R5,     R1                      ; 5177   0129
        SLLC    R1,     2                       ; 5178   005D
        SUBR    R5,     R1                      ; 5179   0129
        CMPR    R3,     R5                      ; 517A   015D
        SUB@    R5,     R1                      ; 517B   0329
        SLLC    R1,     2                       ; 517C   005D
        ANDR    R5,     R6                      ; 517D   01AE
L_517E:
        DECR    R7                              ; 517E   0017

        DECLE   $001D,  $005E,  $0007,  $0027   ; 517F   001D 005E 0007 0027
        DECLE   $0000,  $0100,  $0000,  $0000   ; 5183   0000 0100 0000 0000
        DECLE   $0000,  $0001,  $0035,  $0000   ; 5187   0000 0001 0035 0000

        PSHR    R5                              ; 518B   0275
        CLRR    R0                              ; 518C   01C0
        MVO     R0,     G_0187                  ; 518D   0240 0187
        MVO     R0,     G_0161                  ; 518F   0240 0161
        MVII    #$01E0, R0                      ; 5191   02B8 01E0

        JSR     R5,     X_RAND2                 ; 5193   0004 0114 029E

        MVII    #$0028, R2                      ; 5196   02BA 0028
        MOVR    R0,     R1                      ; 5198   0081

        JSR     R5,     X_DIV                   ; 5199   0004 011C 01FB

        SLL     R0,     2                       ; 519C   004C
        SLL     R0,     2                       ; 519D   004C
        PSHR    R0                              ; 519E   0270
        SLL     R0,     2                       ; 519F   004C
        ADD@    R6,     R0                      ; 51A0   02F0
        ADDR    R1,     R0                      ; 51A1   00C8
        SDBD                                    ; 51A2   0001
        ADDI    #$5823, R0                      ; 51A3   02F8 0023 0058
        MVO     R0,     G_0316                  ; 51A6   0240 0316
        MOVR    R0,     R3                      ; 51A8   0083
        MVII    #$0200, R4                      ; 51A9   02BC 0200
        MVII    #$0214, R0                      ; 51AB   02B8 0214
        MVO     R0,     G_0318                  ; 51AD   0240 0318
L_51AF:
        MVI@    R3,     R0                      ; 51AF   0298
        MOVR    R0,     R1                      ; 51B0   0081
        ANDI    #$001F, R1                      ; 51B1   03B9 001F
        SLR     R0,     1                       ; 51B3   0060
        SLR     R0,     2                       ; 51B4   0064
        SLR     R0,     2                       ; 51B5   0064
        PSHR    R1                              ; 51B6   0271

        JSR     R5,     L_565C                  ; 51B7   0004 0154 025C

        PULR    R0                              ; 51BA   02B0

        JSR     R5,     L_565C                  ; 51BB   0004 0154 025C

        INCR    R3                              ; 51BE   000B
        CMP     G_0318, R4                      ; 51BF   0344 0318
        BMI     L_51CA                          ; 51C1   020B 0007

        MOVR    R4,     R0                      ; 51C3   00A0
        ADDI    #$0014, R0                      ; 51C4   02F8 0014
        MVO     R0,     G_0318                  ; 51C6   0240 0318
        ADDI    #$001E, R3                      ; 51C8   02FB 001E
L_51CA:
        SDBD                                    ; 51CA   0001
        CMPI    #$5BE3, R3                      ; 51CB   037B 00E3 005B
        BMI     L_51D2                          ; 51CE   020B 0002

        SUBI    #$03C0, R3                      ; 51D0   033B 03C0
L_51D2:
        CMPI    #$02F0, R4                      ; 51D2   037C 02F0
        BMI     L_51AF                          ; 51D4   022B 0026

        CLRR    R0                              ; 51D6   01C0
        MVII    #$031D, R4                      ; 51D7   02BC 031D

        JSR     R5,     L_51F8                  ; 51D9   0004 0150 01F8
        BIDECLE $1841                           ; 51DC   0041 0018
        DECLE   $0014,  $000C,  $0041,  $0018   ; 51DE   0014 000C 0041 0018
        DECLE   $001C,  $000C,  $0041,  $0038   ; 51E2   001C 000C 0041 0038
        DECLE   $0014,  $003E,  $0040,  $0018   ; 51E6   0014 003E 0040 0018
        DECLE   $0000,  $0000                   ; 51EA   0000 0000

        SWAP    R0,     1                       ; 51EC   0040
        COMR    R0                              ; 51ED   0018
        MOVR    R1,     R2                      ; 51EE   008A
        NEGR    R5                              ; 51EF   0025
        SWAP    R0,     1                       ; 51F0   0040
        COMR    R0                              ; 51F1   0018
        TSTR    R2                              ; 51F2   0092
        NEGR    R5                              ; 51F3   0025
        SWAP    R0,     1                       ; 51F4   0040
        RSWD    R0                              ; 51F5   0038
        MOVR    R1,     R2                      ; 51F6   008A
        RLC     R3,     2                       ; 51F7   0057
L_51F8:
        SDBD                                    ; 51F8   0001
        MVI@    R5,     R2                      ; 51F9   02AA
        MVO@    R2,     R4                      ; 51FA   0262
        INCR    R4                              ; 51FB   000C
        MVI@    R5,     R2                      ; 51FC   02AA
        SWAP    R2,     1                       ; 51FD   0042
        MVO@    R2,     R4                      ; 51FE   0262
        MVI@    R5,     R2                      ; 51FF   02AA
        SWAP    R2,     1                       ; 5200   0042
        MVO@    R2,     R4                      ; 5201   0262
        MVO@    R0,     R4                      ; 5202   0260
        MVO@    R0,     R4                      ; 5203   0260
        MVO@    R0,     R4                      ; 5204   0260
        INCR    R4                              ; 5205   000C
        CMPI    #$0355, R4                      ; 5206   037C 0355
        BMI     L_51F8                          ; 5208   022B 0011

        MVII    #$0001, R1                      ; 520A   02B9 0001
        MVO     R1,     G_0323                  ; 520C   0241 0323
        MVO     R1,     G_0343                  ; 520E   0241 0343
        SDBD                                    ; 5210   0001
        MVII    #$5122, R0                      ; 5211   02B8 0022 0051
        MVO     R0,     G_032E                  ; 5214   0240 032E
        MVO     R0,     G_034E                  ; 5216   0240 034E
        MVII    #$0008, R0                      ; 5218   02B8 0008
        SWAP    R0,     1                       ; 521A   0040
        MVO     R0,     G_0329                  ; 521B   0240 0329
        MVO     R0,     G_0349                  ; 521D   0240 0349
        MVII    #$0022, R0                      ; 521F   02B8 0022
        MVO     R0,     G_011A                  ; 5221   0240 011A
        MVII    #$031F, R0                      ; 5223   02B8 031F
        MVO     R0,     G_0315                  ; 5225   0240 0315
        CLRR    R1                              ; 5227   01C9
        MVO     R1,     G_0183                  ; 5228   0241 0183
L_522A:
        CLRR    R4                              ; 522A   01E4
        MVO     R4,     G_0182                  ; 522B   0244 0182
        MVO     R4,     G_0181                  ; 522D   0244 0181
        MVI     G_0315, R1                      ; 522F   0281 0315
        MVI@    R1,     R0                      ; 5231   0288
        SWAP    R0,     1                       ; 5232   0040
        MVO     R0,     G_0317                  ; 5233   0240 0317
        INCR    R1                              ; 5235   0009
        MVI@    R1,     R1                      ; 5236   0289
        SWAP    R1,     1                       ; 5237   0041
        MVO     R1,     G_0318                  ; 5238   0241 0318

L_523A:
        JSR     R5,     L_562D                  ; 523A   0004 0154 022D

        CMPI    #$000D, R0                      ; 523D   0378 000D
        BPL     L_524E                          ; 523F   0203 000D

        MVI     G_0317, R0                      ; 5241   0280 0317
        ADDI    #$0008, R0                      ; 5243   02F8 0008
        MVI     G_0318, R1                      ; 5245   0281 0318

        JSR     R5,     L_562D                  ; 5247   0004 0154 022D

        CMPI    #$000D, R0                      ; 524A   0378 000D
        BMI     L_5253                          ; 524C   020B 0005

L_524E:
        JSR     R5,     L_56B1                  ; 524E   0004 0154 02B1

        B       L_523A                          ; 5251   0220 0018

L_5253:
        MVI     G_0183, R2                      ; 5253   0282 0183
        MVI     G_0315, R1                      ; 5255   0281 0315
        MVI     G_0317, R0                      ; 5257   0280 0317
        SWAP    R0,     1                       ; 5259   0040
        MVO@    R0,     R1                      ; 525A   0248
        SDBD                                    ; 525B   0001
        ADDI    #$0800, R0                      ; 525C   02F8 0000 0008
        ADDI    #$0008, R1                      ; 525F   02F9 0008
        MVO@    R0,     R1                      ; 5261   0248
        SUBI    #$0007, R1                      ; 5262   0339 0007
        MVI     G_0318, R0                      ; 5264   0280 0318
        SWAP    R0,     1                       ; 5266   0040
        MVO@    R0,     R1                      ; 5267   0248
        ADDI    #$0008, R1                      ; 5268   02F9 0008
        MVO@    R0,     R1                      ; 526A   0248
        ADDI    #$0002, R2                      ; 526B   02FA 0002
        MVO     R2,     G_0183                  ; 526D   0242 0183
        MOVR    R2,     R1                      ; 526F   0091
        SLL     R1,     1                       ; 5270   0049
        SLL     R1,     2                       ; 5271   004D
        ADDI    #$031F, R1                      ; 5272   02F9 031F
        MVO     R1,     G_0315                  ; 5274   0241 0315
        CMPI    #$0007, R2                      ; 5276   037A 0007
        BMI     L_522A                          ; 5278   022B 004F

        MVII    #$0163, R4                      ; 527A   02BC 0163
        SDBD                                    ; 527C   0001
        MVII    #$001B, R0                      ; 527D   02B8 001B 0000

        JSR     R5,     X_FILL_ZERO             ; 5280   0004 0114 0338

        SDBD                                    ; 5283   0001
        MVII    #$5054, R1                      ; 5284   02B9 0054 0050

        JSR     R5,     X_TIMER_START           ; 5287   0004 0118 0044

        SDBD                                    ; 528A   0001
        MVII    #$52E4, R0                      ; 528B   02B8 00E4 0052
        MVO     R0,     G_035D                  ; 528E   0240 035D
        MVII    #$0008, R0                      ; 5290   02B8 0008
        MVO     R0,     G_0179                  ; 5292   0240 0179
        MVO     R0,     G_0175                  ; 5294   0240 0175
        MVII    #$0003, R5                      ; 5296   02BD 0003
        CLRR    R1                              ; 5298   01C9
        MVII    #$015D, R4                      ; 5299   02BC 015D
        MVII    #$0173, R3                      ; 529B   02BB 0173
        MVII    #$032E, R2                      ; 529D   02BA 032E
L_529F:
        MVI@    R4,     R0                      ; 529F   02A0
        CMPI    #$0001, R0                      ; 52A0   0378 0001
        BGT     L_52A9                          ; 52A2   020E 0005

        MVO@    R1,     R2                      ; 52A4   0251
        MVO@    R5,     R3                      ; 52A5   025D
        INCR    R0                              ; 52A6   0008
        DECR    R4                              ; 52A7   0014
        MVO@    R0,     R4                      ; 52A8   0260
L_52A9:
        ADDI    #$0008, R3                      ; 52A9   02FB 0008
        SDBD                                    ; 52AB   0001
        ADDI    #$0020, R2                      ; 52AC   02FA 0020 0000
        CMPI    #$017D, R3                      ; 52AF   037B 017D
        BMI     L_529F                          ; 52B1   022B 0013

        MVII    #$02F1, R6                      ; 52B3   02BE 02F1
L_52B5:
        EIS                                     ; 52B5   0002
        MVI     G_0102, R0                      ; 52B6   0280 0102
        DECR    R0                              ; 52B8   0010
        BPL     L_52B5                          ; 52B9   0223 0005

        MVI     G_0103, R1                      ; 52BB   0281 0103
        MVO     R1,     G_0102                  ; 52BD   0241 0102
        MVI     .PSG0.rgt_hand,R0               ; 52BF   0280 01FE
        CMPI    #$00BE, R0                      ; 52C1   0378 00BE
        BEQ     L_52C8                          ; 52C3   0204 0003

        COMR    R0                              ; 52C5   0018
        MVO     R0,     G_0124                  ; 52C6   0240 0124
L_52C8:
        MVI     .PSG0.lft_hand,R0               ; 52C8   0280 01FF
        CMPI    #$00BE, R0                      ; 52CA   0378 00BE
        BEQ     L_52D1                          ; 52CC   0204 0003

        COMR    R0                              ; 52CE   0018
        MVO     R0,     G_0123                  ; 52CF   0240 0123

L_52D1:
        JSR     R5,     .EXEC.1FA               ; 52D1   0004 0110 01FA
        JSR     R5,     .EXEC.4F1               ; 52D4   0004 0114 00F1
        JSR     R5,     .EXEC.7D5               ; 52D7   0004 0114 03D5
        JSR     R5,     .EXEC.AAD               ; 52DA   0004 0118 02AD

        MVII    #$0001, R0                      ; 52DD   02B8 0001

        JSR     R5,     X_RAND1                 ; 52DF   0004 0114 027D

        B       L_52B5                          ; 52E2   0220 002E

        DECLE   $0000,  $0000,  $00E3,  $005B   ; 52E4   0000 0000 00E3 005B
        DECLE   $0074,  $005C,  $002C,  $005C   ; 52E8   0074 005C 002C 005C
        DECLE   $002C,  $005C                   ; 52EC   002C 005C
.GFX_LIST_52EE:
        DECLE   $00F7,  $00FB,  $00FD,  $00FE   ; 52EE  CART PIC #00
        DECLE   $00FE,  $003E,  $000E,  $0002   ; 52F2  
        DECLE   $00FF,  $00FC,  $00F3,  $00CF   ; 52F6  CART PIC #01
        DECLE   $003F,  $00FC,  $00F0,  $00C0   ; 52FA  
        DECLE   $003F,  $00FC,  $00F0,  $00C0   ; 52FE  CART PIC #02
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5302  
        DECLE   $003F,  $00CF,  $00F3,  $00FC   ; 5306  CART PIC #03
        DECLE   $00FE,  $003E,  $000E,  $0002   ; 530A  
        DECLE   $00FC,  $00F0,  $00CC,  $003C   ; 530E  CART PIC #04
        DECLE   $00FC,  $00FC,  $00F0,  $00C0   ; 5312  
        DECLE   $003F,  $007F,  $00FF,  $00FF   ; 5316  CART PIC #05
        DECLE   $00AA,  $00FF,  $00AA,  $00FF   ; 531A  
        DECLE   $00FF,  $00FF,  $00FF,  $00FF   ; 531E  CART PIC #06
        DECLE   $00AA,  $00FF,  $00AA,  $00FF   ; 5322  
        DECLE   $00E0,  $00E0,  $00E0,  $00A0   ; 5326  CART PIC #07
        DECLE   $00E0,  $00A0,  $00C0,  $0080   ; 532A  
        DECLE   $00FE,  $003E,  $000E,  $0000   ; 532E  CART PIC #08
        DECLE   $0000,  $000F,  $003F,  $00FF   ; 5332  
        DECLE   $00FC,  $00F0,  $00C0,  $0000   ; 5336  CART PIC #09
        DECLE   $0000,  $0000,  $00C0,  $00F0   ; 533A  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 533E  CART PIC #0A
        DECLE   $0003,  $000E,  $0039,  $0007   ; 5342  
        DECLE   $0003,  $000E,  $0039,  $00E7   ; 5346  CART PIC #0B
        DECLE   $009F,  $007F,  $00FF,  $00FF   ; 534A  
        DECLE   $0098,  $007C,  $00FE,  $00FF   ; 534E  CART PIC #0C
        DECLE   $00FF,  $00FC,  $00F3,  $00C7   ; 5352  
        DECLE   $0003,  $000F,  $003F,  $00FF   ; 5356  CART PIC #0D
        DECLE   $007F,  $00CF,  $00F3,  $00FC   ; 535A  
        DECLE   $0080,  $00E0,  $00F8,  $00FE   ; 535E  CART PIC #0E
        DECLE   $00FE,  $00FA,  $00CE,  $003E   ; 5362  
        DECLE   $006C,  $00F6,  $005C,  $0001   ; 5366  CART PIC #0F
        DECLE   $00B4,  $007E,  $00DA,  $007F   ; 536A  
        DECLE   $00B4,  $007E,  $00DE,  $007F   ; 536E  CART PIC #10
        DECLE   $00EE,  $00FA,  $007C,  $0038   ; 5372  
        DECLE   $003C,  $005E,  $00FF,  $00F6   ; 5376  CART PIC #11
        DECLE   $007C,  $0010,  $0010,  $0010   ; 537A  
        DECLE   $00FE,  $00FA,  $007C,  $0038   ; 537E  CART PIC #12
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5382  
        DECLE   $0010,  $0010,  $0010,  $0010   ; 5386  CART PIC #13
        DECLE   $0000,  $0000,  $0000,  $0000   ; 538A  
        DECLE   $0042,  $007E,  $00F9,  $009F   ; 538E  CART PIC #14
        DECLE   $00F0,  $003D,  $00F8,  $006F   ; 5392  
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5396  CART PIC #15
        DECLE   $0070,  $007F,  $0030,  $0070   ; 539A  
        DECLE   $00FE,  $00FE,  $00FE,  $007C   ; 539E  CART PIC #16
        DECLE   $0000,  $0000,  $0000,  $0000   ; 53A2  
        DECLE   $0000,  $0030,  $003F,  $003C   ; 53A6  CART PIC #17
        DECLE   $0038,  $0038,  $0039,  $0009   ; 53AA  
        DECLE   $003E,  $003E,  $003E,  $003E   ; 53AE  CART PIC #18
        DECLE   $0031,  $0031,  $0001,  $0001   ; 53B2  
        DECLE   $0000,  $0001,  $000F,  $0058   ; 53B6  CART PIC #19
        DECLE   $0078,  $0068,  $005C,  $0054   ; 53BA  
        DECLE   $002F,  $002B,  $0017,  $0017   ; 53BE  CART PIC #1A
        DECLE   $000B,  $000A,  $0006,  $0004   ; 53C2  
        DECLE   $0007,  $0008,  $0010,  $0010   ; 53C6  CART PIC #1B
        DECLE   $0050,  $00E8,  $00B4,  $009B   ; 53CA  
        DECLE   $008D,  $0046,  $0023,  $0011   ; 53CE  CART PIC #1C
        DECLE   $0008,  $0004,  $0002,  $0001   ; 53D2  
        DECLE   $0000,  $0000,  $000E,  $001F   ; 53D6  CART PIC #1D
        DECLE   $0011,  $0020,  $0024,  $003C   ; 53DA  
        DECLE   $0047,  $00B8,  $0087,  $0080   ; 53DE  CART PIC #1E
        DECLE   $0040,  $0038,  $0007,  $0000   ; 53E2  
        DECLE   $0000,  $000F,  $0030,  $0040   ; 53E6  CART PIC #1F
        DECLE   $0040,  $0040,  $0060,  $0070   ; 53EA  
        DECLE   $007F,  $007F,  $007F,  $0080   ; 53EE  CART PIC #20
        DECLE   $0080,  $0080,  $0040,  $003F   ; 53F2  
        DECLE   $0000,  $0000,  $0000,  $0007   ; 53F6  CART PIC #21
        DECLE   $0018,  $0020,  $0060,  $00E0   ; 53FA  
        DECLE   $00F1,  $007F,  $003C,  $001B   ; 53FE  CART PIC #22
        DECLE   $000C,  $0004,  $0004,  $0003   ; 5402  
        DECLE   $0000,  $0000,  $0006,  $000F   ; 5406  CART PIC #23
        DECLE   $0010,  $0020,  $0060,  $00E0   ; 540A  
        DECLE   $00F1,  $00FF,  $00FE,  $006D   ; 540E  CART PIC #24
        DECLE   $0007,  $0001,  $0001,  $0000   ; 5412  
        DECLE   $0010,  $001C,  $003D,  $003E   ; 5416  CART PIC #25
        DECLE   $0070,  $0061,  $00E1,  $00E1   ; 541A  
        DECLE   $00F3,  $00FF,  $00FF,  $00FF   ; 541E  CART PIC #26
        DECLE   $004F,  $0007,  $0001,  $0001   ; 5422  
        DECLE   $0001,  $0001,  $0001,  $0001   ; 5426  CART PIC #27
        DECLE   $0031,  $003B,  $003B,  $000B   ; 542A  
        DECLE   $0038,  $0038,  $003C,  $003F   ; 542E  CART PIC #28
        DECLE   $003F,  $003F,  $0030,  $0030   ; 5432  
        DECLE   $0000,  $0030,  $00F8,  $0078   ; 5436  CART PIC #29
        DECLE   $0038,  $0038,  $0038,  $0060   ; 543A  
        DECLE   $00F8,  $00F8,  $00F8,  $00F8   ; 543E  CART PIC #2A
        DECLE   $0018,  $0018,  $0000,  $0000   ; 5442  
        DECLE   $0000,  $0080,  $00C0,  $00C0   ; 5446  CART PIC #2B
        DECLE   $00E0,  $00E0,  $00F0,  $00F0   ; 544A  
        DECLE   $0078,  $0078,  $0098,  $0048   ; 544E  CART PIC #2C
        DECLE   $0020,  $0020,  $0010,  $0010   ; 5452  
        DECLE   $0080,  $00C0,  $0060,  $0070   ; 5456  CART PIC #2D
        DECLE   $0078,  $003C,  $009E,  $00CA   ; 545A  
        DECLE   $00E8,  $00FC,  $0066,  $00C3   ; 545E  CART PIC #2E
        DECLE   $0081,  $0080,  $0080,  $0000   ; 5462  
        DECLE   $0000,  $0000,  $0000,  $00C0   ; 5466  CART PIC #2F
        DECLE   $00F8,  $00F8,  $00F8,  $0018   ; 546A  
        DECLE   $00E0,  $00FC,  $00C3,  $0080   ; 546E   00E0 00FC 00C3 0080
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5472   0000 0000 0000 0000
        DECLE   $0000,  $00F0,  $00F8,  $0070   ; 5476   0000 00F0 00F8 0070
        DECLE   $0070,  $000E,  $0070,  $00F0   ; 547A   0070 000E 0070 00F0
        DECLE   $00F0,  $00F0,  $00F0,  $0008   ; 547E   00F0 00F0 00F0 0008
        DECLE   $0004,  $0004,  $0008,  $00F0   ; 5482   0004 0004 0008 00F0
        DECLE   $0000,  $0000,  $0007,  $0018   ; 5486   0000 0000 0007 0018
        DECLE   $00E0,  $00E0,  $0080,  $00FC   ; 548A   00E0 00E0 0080 00FC
        DECLE   $00E2,  $001D,  $00E1,  $0001   ; 548E   00E2 001D 00E1 0001
        DECLE   $0002,  $001C,  $00E0,  $0000   ; 5492   0002 001C 00E0 0000
        DECLE   $0008,  $0018,  $0030,  $00E0   ; 5496   0008 0018 0030 00E0
        DECLE   $0040,  $00E4,  $00EE,  $00DA   ; 549A   0040 00E4 00EE 00DA
        DECLE   $00B2,  $0062,  $00C4,  $0088   ; 549E   00B2 0062 00C4 0088
        DECLE   $0010,  $0020,  $0040,  $0080   ; 54A2   0010 0020 0040 0080
        DECLE   $0040,  $0080,  $0080,  $0030   ; 54A6   0040 0080 0080 0030
        DECLE   $00E8,  $00E8,  $00C8,  $00D0   ; 54AA   00E8 00E8 00C8 00D0
        DECLE   $0090,  $00A0,  $0020,  $0040   ; 54AE   0090 00A0 0020 0040
        DECLE   $0040,  $0080,  $0080,  $0000   ; 54B2   0040 0080 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 54B6   0000 0000 0000 0000
        DECLE   $0018,  $0098,  $00B8,  $00A0   ; 54BA   0018 0098 00B8 00A0
        DECLE   $0038,  $0038,  $0078,  $00F8   ; 54BE   0038 0038 0078 00F8
        DECLE   $00F8,  $00F8,  $0018,  $0018   ; 54C2   00F8 00F8 0018 0018
        DECLE   $0000,  $0000,  $0000,  $0018   ; 54C6   0000 0000 0000 0018
        DECLE   $0018,  $0000,  $0000,  $0000   ; 54CA   0018 0000 0000 0000
        DECLE   $0080,  $0000,  $0002,  $0000   ; 54CE   0080 0000 0002 0000
        DECLE   $0000,  $0020,  $0018,  $0018   ; 54D2   0000 0020 0018 0018
        DECLE   $0000,  $0004,  $0020,  $0000   ; 54D6   0000 0004 0020 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 54DA   0000 0000 0080 0000
        DECLE   $0081,  $0000,  $0000,  $0000   ; 54DE   0081 0000 0000 0000
        DECLE   $0040,  $0018,  $0024,  $0024   ; 54E2   0040 0018 0024 0024
        DECLE   $0024,  $0024,  $0018,  $0000   ; 54E6   0024 0024 0018 0000
        DECLE   $0002,  $0000,  $0040,  $0000   ; 54EA   0002 0000 0040 0000
        DECLE   $0000,  $0000,  $0080,  $0000   ; 54EE   0000 0000 0080 0000
        DECLE   $003C,  $0042,  $0042,  $0042   ; 54F2   003C 0042 0042 0042
        DECLE   $004A,  $0042,  $0042,  $003C   ; 54F6   004A 0042 0042 003C
        DECLE   $0000,  $0000,  $0000,  $0081   ; 54FA   0000 0000 0000 0081
        DECLE   $0000,  $0000,  $0018,  $0024   ; 54FE   0000 0000 0018 0024
        DECLE   $0042,  $0042,  $0081,  $0089   ; 5502   0042 0042 0081 0089
        DECLE   $0081,  $0081,  $0046,  $0042   ; 5506   0081 0081 0046 0042
        DECLE   $0024,  $0018,  $0000,  $0000   ; 550A   0024 0018 0000 0000
        DECLE   $0018,  $0024,  $0042,  $0042   ; 550E   0018 0024 0042 0042
        DECLE   $0085,  $0081,  $0081,  $0081   ; 5512   0085 0081 0081 0081
        DECLE   $0091,  $0081,  $0081,  $0042   ; 5516   0091 0081 0081 0042
        DECLE   $0042,  $0025,  $0018,  $0000   ; 551A   0042 0025 0018 0000
        DECLE   $0024,  $0042,  $0081,  $0083   ; 551E   0024 0042 0081 0083
        DECLE   $0000,  $0000,  $0010,  $0008   ; 5522   0000 0000 0010 0008
        DECLE   $0000,  $0000,  $0020,  $0081   ; 5526   0000 0000 0020 0081
        DECLE   $0081,  $0042,  $0024,  $0024   ; 552A   0081 0042 0024 0024
        DECLE   $0063,  $0042,  $0081,  $0000   ; 552E   0063 0042 0081 0000
        DECLE   $0020,  $0004,  $0000,  $0010   ; 5532   0020 0004 0000 0010
        DECLE   $0010,  $0000,  $0004,  $0000   ; 5536   0010 0000 0004 0000
        DECLE   $0040,  $0001,  $0081,  $00C2   ; 553A   0040 0001 0081 00C2
        DECLE   $0000,  $0000,  $0030,  $001C   ; 553E   0000 0000 0030 001C
        DECLE   $0004,  $000C,  $0018,  $0070   ; 5542   0004 000C 0018 0070
        DECLE   $00E6,  $00E9,  $00D1,  $0021   ; 5546   00E6 00E9 00D1 0021
        DECLE   $0042,  $00FC,  $0000,  $0000   ; 554A   0042 00FC 0000 0000
L_554E:
        PSHR    R5                              ; 554E   0275
        CLRR    R0                              ; 554F   01C0
        MVI     G_0184, R1                      ; 5550   0281 0184
        DECR    R1                              ; 5552   0011
        BPL     L_5556                          ; 5553   0203 0001

        CLRR    R1                              ; 5555   01C9
L_5556:
        MVO     R1,     G_0184                  ; 5556   0241 0184
        INCR    R0                              ; 5558   0008
L_5559:
        MVO     R0,     G_015F                  ; 5559   0240 015F
        MOVR    R0,     R1                      ; 555B   0081
        ADDI    #$0163, R1                      ; 555C   02F9 0163
        MVI@    R1,     R2                      ; 555E   028A
        DECR    R2                              ; 555F   0012
        BMI     L_5563                          ; 5560   020B 0001

        MVO@    R2,     R1                      ; 5562   024A
L_5563:
        MOVR    R0,     R1                      ; 5563   0081
        SLL     R1,     1                       ; 5564   0049
        SLL     R1,     2                       ; 5565   004D
        ADDI    #$016D, R1                      ; 5566   02F9 016D
        MVII    #$011F, R3                      ; 5568   02BB 011F
        ADDR    R0,     R3                      ; 556A   00C3
        MVI@    R3,     R0                      ; 556B   0298
        MVI     G_015F, R3                      ; 556C   0283 015F
        SLL     R3,     1                       ; 556E   004B
        SLL     R3,     2                       ; 556F   004F
        SLL     R3,     2                       ; 5570   004F
        MOVR    R3,     R4                      ; 5571   009C
        ADDI    #$0321, R4                      ; 5572   02FC 0321
        MVO     R1,     G_0318                  ; 5574   0241 0318
        MVI@    R1,     R3                      ; 5576   028B
        MVO     R3,     G_0161                  ; 5577   0243 0161
        ANDI    #$000F, R3                      ; 5579   03BB 000F
        CMPI    #$0040, R0                      ; 557B   0378 0040
        BPL     L_559D                          ; 557D   0203 001E

        SUBR    R3,     R0                      ; 557F   0118
        ANDI    #$000F, R0                      ; 5580   03B8 000F
        BEQ     L_559D                          ; 5582   0204 0019

        MVI@    R1,     R2                      ; 5584   028A
        SLL     R2,     2                       ; 5585   004E
        SWAP    R2,     1                       ; 5586   0042
        ADDI    #$0004, R2                      ; 5587   02FA 0004
        INCR    R1                              ; 5589   0009
        ADD@    R1,     R2                      ; 558A   02CA
        PSHR    R2                              ; 558B   0272
        ANDI    #$009F, R2                      ; 558C   03BA 009F
        MVO@    R2,     R1                      ; 558E   024A
        PULR    R1                              ; 558F   02B1
        ANDI    #$0020, R1                      ; 5590   03B9 0020
        BEQ     L_559D                          ; 5592   0204 0009

        CMPI    #$0008, R0                      ; 5594   0378 0008
        BPL     L_559A                          ; 5596   0203 0002

        INCR    R3                              ; 5598   000B
        INCR    R7                              ; 5599   000F

L_559A:
        DECR    R3                              ; 559A   0013
L_559B:
        ANDI    #$000F, R3                      ; 559B   03BB 000F
L_559D:
        CLRR    R0                              ; 559D   01C0
        MVI     G_0161, R2                      ; 559E   0282 0161
        ANDI    #$0010, R2                      ; 55A0   03BA 0010
        BEQ     L_55AD                          ; 55A2   0204 0009

        MVI     G_0161, R0                      ; 55A4   0280 0161
        SLR     R0,     2                       ; 55A6   0064
        SLR     R0,     2                       ; 55A7   0064
        MOVR    R3,     R1                      ; 55A8   0099
        SLL     R0,     1                       ; 55A9   0048

        JSR     R5,     L_5650                  ; 55AA   0004 0154 0250

L_55AD:
        MVI     G_0318, R2                      ; 55AD   0282 0318
        INCR    R2                              ; 55AF   000A
        MVI@    R2,     R1                      ; 55B0   0291
        ANDI    #$007F, R1                      ; 55B1   03B9 007F
        CMP@    R2,     R1                      ; 55B3   0351
        MVO@    R1,     R2                      ; 55B4   0251
        BNEQ    L_55B9                          ; 55B5   020C 0002

        MVO@    R0,     R4                      ; 55B7   0260
        DECR    R4                              ; 55B8   0014
L_55B9:
        SUBI    #$0002, R4                      ; 55B9   033C 0002
        MVI@    R4,     R0                      ; 55BB   02A0
        SDBD                                    ; 55BC   0001
        ADDI    #$0400, R0                      ; 55BD   02F8 0000 0004
        MVI@    R4,     R1                      ; 55C0   02A1

        JSR     R5,     L_5629                  ; 55C1   0004 0154 0229

        MVII    #$0080, R1                      ; 55C4   02B9 0080
        CMPI    #$0004, R0                      ; 55C6   0378 0004
        BMI     L_55D0                          ; 55C8   020B 0006

        CMPI    #$000D, R0                      ; 55CA   0378 000D
        BPL     L_55D0                          ; 55CC   0203 0002

        MVII    #$00E0, R1                      ; 55CE   02B9 00E0
L_55D0:
        ADDR    R3,     R1                      ; 55D0   00D9
        DECR    R2                              ; 55D1   0012
        MVO@    R1,     R2                      ; 55D2   0251
        SUBI    #$0005, R3                      ; 55D3   033B 0005
        ANDI    #$000F, R3                      ; 55D5   03BB 000F
        SUBI    #$0004, R4                      ; 55D7   033C 0004
        MVI@    R4,     R1                      ; 55D9   02A1
        SDBD                                    ; 55DA   0001
        ANDI    #$FDFF, R1                      ; 55DB   03B9 00FF 00FD
        DECR    R4                              ; 55DE   0014
        SDBD                                    ; 55DF   0001
        MVII    #$514C, R5                      ; 55E0   02BD 004C 0051
        SDBD                                    ; 55E3   0001
        MVII    #$5137, R2                      ; 55E4   02BA 0037 0051
        CMPI    #$0008, R3                      ; 55E7   037B 0008
        BPL     L_55F0                          ; 55E9   0203 0005

        XORR    R2,     R5                      ; 55EB   01D5
        XORR    R5,     R2                      ; 55EC   01EA
        XORR    R2,     R5                      ; 55ED   01D5
        XORI    #$0200, R1                      ; 55EE   03F9 0200
L_55F0:
        MVO@    R1,     R4                      ; 55F0   0261
        MVO@    R2,     R4                      ; 55F1   0262
        ADDI    #$0006, R4                      ; 55F2   02FC 0006
        MVII    #$0020, R0                      ; 55F4   02B8 0020
        COMR    R0                              ; 55F6   0018
        ANDR    R0,     R1                      ; 55F7   0181
        MVI@    R4,     R0                      ; 55F8   02A0
        ANDI    #$0020, R0                      ; 55F9   03B8 0020
        XORR    R0,     R1                      ; 55FB   01C1
        DECR    R4                              ; 55FC   0014
        MVO@    R1,     R4                      ; 55FD   0261
        MVO@    R5,     R4                      ; 55FE   0265
        ADDI    #$0009, R3                      ; 55FF   02FB 0009
        ANDI    #$000F, R3                      ; 5601   03BB 000F
        CMPI    #$0009, R3                      ; 5603   037B 0009
        BMI     L_560A                          ; 5605   020B 0003

        NEGR    R3                              ; 5607   0023
        ANDI    #$000F, R3                      ; 5608   03BB 000F
L_560A:
        SUBI    #$0005, R4                      ; 560A   033C 0005
        MVO@    R3,     R4                      ; 560C   0263
        ADDI    #$0007, R4                      ; 560D   02FC 0007
        MVO@    R3,     R4                      ; 560F   0263
        MVI     G_015F, R0                      ; 5610   0280 015F
        DECR    R0                              ; 5612   0010
        BPL     L_5559                          ; 5613   0223 00BB

        CLRR    R1                              ; 5615   01C9
        MVII    #$0186, R2                      ; 5616   02BA 0186
        MVI@    R2,     R0                      ; 5618   0290
        MVO@    R1,     R2                      ; 5619   0251
        DECR    R2                              ; 561A   0012
        CMP@    R2,     R0                      ; 561B   0350
        MVO@    R0,     R2                      ; 561C   0250
        BEQ     L_5628                          ; 561D   0204 0009
        BPL     L_5625                          ; 561F   0203 0004

        JSR     R5,     L_5E7A                  ; 5621   0004 015C 027A

        PULR    R7                              ; 5624   02B7

L_5625:
        JSR     R5,     L_5E63                  ; 5625   0004 015C 0263

L_5628:
        PULR    R7                              ; 5628   02B7

L_5629:
        SWAP    R0,     1                       ; 5629   0040
        ANDI    #$00FF, R0                      ; 562A   03B8 00FF
        SWAP    R1,     1                       ; 562C   0041
L_562D:
        SUBI    #$0004, R1                      ; 562D   0339 0004
        ANDI    #$00F8, R1                      ; 562F   03B9 00F8
        SLL     R1,     1                       ; 5631   0049
        PSHR    R1                              ; 5632   0271
        SLL     R1,     2                       ; 5633   004D
        ADD@    R6,     R1                      ; 5634   02F1
        SLR     R0,     2                       ; 5635   0064
        DECR    R0                              ; 5636   0010
        SLR     R0,     1                       ; 5637   0060
        ADDR    R0,     R1                      ; 5638   00C1
        SLR     R1,     1                       ; 5639   0061
        ADD     G_0316, R1                      ; 563A   02C1 0316
        SDBD                                    ; 563C   0001
        CMPI    #$5BE3, R1                      ; 563D   0379 00E3 005B
        BMI     L_5644                          ; 5640   020B 0002

        SUBI    #$03C0, R1                      ; 5642   0339 03C0
L_5644:
        MVI@    R1,     R1                      ; 5644   0289
        ANDI    #$0001, R0                      ; 5645   03B8 0001
        BNEQ    L_564C                          ; 5647   020C 0003

        SLR     R1,     1                       ; 5649   0061
        SLR     R1,     2                       ; 564A   0065
        SLR     R1,     2                       ; 564B   0065
L_564C:
        ANDI    #$001F, R1                      ; 564C   03B9 001F
        MOVR    R1,     R0                      ; 564E   0088
        MOVR    R5,     R7                      ; 564F   00AF

L_5650:
        PSHR    R5                              ; 5650   0275

        JSR     R5,     .EXEC.629               ; 5651   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 5654   0004 0114 0357

        SAR     R1,     1                       ; 5657   0069
        PULR    R5                              ; 5658   02B5
        J       X_PACK_BYTES                    ; 5659   0004 0314 034F

L_565C:
        PSHR    R5                              ; 565C   0275
        CLRR    R2                              ; 565D   01D2
        CMPI    #$000D, R0                      ; 565E   0378 000D
        BMI     L_566C                          ; 5660   020B 000A

        SUBI    #$000D, R0                      ; 5662   0338 000D
        SDBD                                    ; 5664   0001
        MVII    #$1003, R1                      ; 5665   02B9 0003 0010
        XORI    #$0100, R0                      ; 5668   03F8 0100
        B       L_56A5                          ; 566A   0200 0039

L_566C:
        CMPI    #$0005, R0                      ; 566C   0378 0005
        BPL     L_5679                          ; 566E   0203 0009

        MOVR    R0,     R1                      ; 5670   0081
        INCR    R1                              ; 5671   0009
        ADDR    R7,     R1                      ; 5672   00F9
        ADD@    R1,     R7                      ; 5673   02CF

        INCR    R3                              ; 5674   000B
        COMR    R2                              ; 5675   001A
        INCR    R7                              ; 5676   000F

        NEGR    R5                              ; 5677   0025
L_5678:
        ADCR    R5                              ; 5678   002D
L_5679:
        ADDI    #$0067, R0                      ; 5679   02F8 0067
        MVII    #$0003, R1                      ; 567B   02B9 0003
        B       L_56A5                          ; 567D   0200 0026

        CLRR    R0                              ; 567F   01C0
        CLRR    R1                              ; 5680   01C9
        B       L_56A5                          ; 5681   0200 0022

        MVII    #$0003, R0                      ; 5683   02B8 0003

        JSR     R5,     X_RAND2                 ; 5685   0004 0114 029E

        ADDI    #$0111, R0                      ; 5688   02F8 0111
        MVII    #$0004, R1                      ; 568A   02B9 0004
        B       L_56A5                          ; 568C   0200 0017

        MVII    #$0002, R0                      ; 568E   02B8 0002

        JSR     R5,     X_RAND2                 ; 5690   0004 0114 029E

        ADDI    #$010F, R0                      ; 5693   02F8 010F
        MVII    #$0004, R1                      ; 5695   02B9 0004
        B       L_56A5                          ; 5697   0200 000C

        MVII    #$0114, R0                      ; 5699   02B8 0114
        SDBD                                    ; 569B   0001
        MVII    #$1001, R1                      ; 569C   02B9 0001 0010
        B       L_56A5                          ; 569F   0200 0004

        CLRR    R0                              ; 56A1   01C0
        CLRR    R1                              ; 56A2   01C9
        MVII    #$0020, R2                      ; 56A3   02BA 0020
L_56A5:
        SLL     R0,     1                       ; 56A5   0048
        SLL     R0,     2                       ; 56A6   004C
        ADDR    R1,     R0                      ; 56A7   00C8
        MOVR    R2,     R1                      ; 56A8   0091
        XOR     G_0161, R1                      ; 56A9   03C1 0161
        SWAP    R1,     1                       ; 56AB   0041
        XORR    R1,     R0                      ; 56AC   01C8
        MVO@    R0,     R4                      ; 56AD   0260
        MVO     R2,     G_0161                  ; 56AE   0242 0161
        PULR    R7                              ; 56B0   02B7

L_56B1:
        PSHR    R5                              ; 56B1   0275
        MVII    #$0008, R0                      ; 56B2   02B8 0008
        MVI     G_0181, R1                      ; 56B4   0281 0181
        MOVR    R1,     R2                      ; 56B6   008A
        ANDI    #$0002, R2                      ; 56B7   03BA 0002
        BEQ     L_56BC                          ; 56B9   0204 0001

        NEGR    R0                              ; 56BB   0020
L_56BC:
        ANDI    #$0001, R1                      ; 56BC   03B9 0001
        BEQ     L_56C6                          ; 56BE   0204 0006

        ADD     G_0317, R0                      ; 56C0   02C0 0317
        MVO     R0,     G_0317                  ; 56C2   0240 0317
        B       L_56CA                          ; 56C4   0200 0004

L_56C6:
        ADD     G_0318, R0                      ; 56C6   02C0 0318
        MVO     R0,     G_0318                  ; 56C8   0240 0318
L_56CA:
        MVI     G_0318, R1                      ; 56CA   0281 0318
        MVI     G_0317, R0                      ; 56CC   0280 0317
        CMPI    #$0008, R0                      ; 56CE   0378 0008
        BMI     L_56DE                          ; 56D0   020B 000C

        CMPI    #$0098, R0                      ; 56D2   0378 0098
        BPL     L_56DE                          ; 56D4   0203 0008

        CMPI    #$0008, R1                      ; 56D6   0379 0008
        BMI     L_56DE                          ; 56D8   020B 0004

        CMPI    #$0060, R1                      ; 56DA   0379 0060
        BMI     L_56E2                          ; 56DC   020B 0004

L_56DE:
        MOVR    R7,     R3                      ; 56DE   00BB
        SUBI    #$002D, R3                      ; 56DF   033B 002D
        PSHR    R3                              ; 56E1   0273
L_56E2:
        DECR    R4                              ; 56E2   0014
        BPL     L_56F9                          ; 56E3   0203 0014

        MVI     G_0181, R3                      ; 56E5   0283 0181
        MOVR    R3,     R2                      ; 56E7   009A
        INCR    R3                              ; 56E8   000B
        ANDI    #$0003, R3                      ; 56E9   03BB 0003
        MVO     R3,     G_0181                  ; 56EB   0243 0181
        XORR    R2,     R3                      ; 56ED   01D3
        ANDI    #$0002, R3                      ; 56EE   03BB 0002
        BEQ     L_56F7                          ; 56F0   0204 0005

        MVI     G_0182, R2                      ; 56F2   0282 0182
        INCR    R2                              ; 56F4   000A
        MVO     R2,     G_0182                  ; 56F5   0242 0182
L_56F7:
        MVI     G_0182, R4                      ; 56F7   0284 0182
L_56F9:
        PULR    R7                              ; 56F9   02B7

        PSHR    R5                              ; 56FA   0275

        JSR     R5,     .EXEC.777               ; 56FB   0004 0114 0377

        ANDI    #$00F8, R3                      ; 56FE   03BB 00F8
        MVO     R3,     G_017E                  ; 5700   0243 017E
        SUBI    #$0008, R3                      ; 5702   033B 0008
        MOVR    R3,     R1                      ; 5704   0099
        SLL     R1,     2                       ; 5705   004D
        ADDR    R3,     R1                      ; 5706   00D9
        ANDI    #$00F8, R2                      ; 5707   03BA 00F8
        MVO     R2,     G_017D                  ; 5709   0242 017D
        SLR     R2,     1                       ; 570B   0062
        SLR     R2,     2                       ; 570C   0066
        DECR    R2                              ; 570D   0012
        MOVR    R2,     R0                      ; 570E   0090
        SLR     R0,     1                       ; 570F   0060
        ADDR    R0,     R1                      ; 5710   00C1
        ADD     G_0316, R1                      ; 5711   02C1 0316
        MVO     R1,     G_0318                  ; 5713   0241 0318
        ANDI    #$0001, R2                      ; 5715   03BA 0001
        MVO     R2,     G_0180                  ; 5717   0242 0180
        CLRR    R0                              ; 5719   01C0
        MVO     R0,     G_017F                  ; 571A   0240 017F
L_571C:
        SDBD                                    ; 571C   0001
        CMPI    #$5BE3, R1                      ; 571D   0379 00E3 005B
        BMI     L_5724                          ; 5720   020B 0002

        SUBI    #$03C0, R1                      ; 5722   0339 03C0
L_5724:
        MVI@    R1,     R0                      ; 5724   0288
        TSTR    R2                              ; 5725   0092
        BNEQ    L_572B                          ; 5726   020C 0003

        SLR     R0,     1                       ; 5728   0060
        SLR     R0,     2                       ; 5729   0064
        SLR     R0,     2                       ; 572A   0064
L_572B:
        ANDI    #$001F, R0                      ; 572B   03B8 001F
        BEQ     L_5732                          ; 572D   0204 0003

        JSR     R5,     L_5753                  ; 572F   0004 0154 0353

L_5732:
        MVI     G_017F, R3                      ; 5732   0283 017F
        INCR    R3                              ; 5734   000B
        MVO     R3,     G_017F                  ; 5735   0243 017F
        MVI     G_0318, R1                      ; 5737   0281 0318
        MVI     G_0180, R2                      ; 5739   0282 0180
        ADDR    R7,     R3                      ; 573B   00FB
        ADD@    R3,     R7                      ; 573C   02DF

        DECLE   $0004                           ; 573D   0004

        INCR    R2                              ; 573E   000A
        INCR    R6                              ; 573F   000E
        ADDR    R1,     R2                      ; 5740   00CA
        DECR    R2                              ; 5741   0012
        BNEQ    L_571C                          ; 5742   022C 0027

        INCR    R1                              ; 5744   0009
        B       L_571C                          ; 5745   0220 002A

        ADDI    #$0028, R1                      ; 5747   02F9 0028
        B       L_571C                          ; 5749   0220 002E

        ADDI    #$0028, R1                      ; 574B   02F9 0028
        DECR    R2                              ; 574D   0012
        BNEQ    L_571C                          ; 574E   022C 0033

        INCR    R1                              ; 5750   0009
        B       L_571C                          ; 5751   0220 0036

L_5753:
        PSHR    R5                              ; 5753   0275
        CMPI    #$0003, R0                      ; 5754   0378 0003
        BMI     L_578E                          ; 5756   020B 0036
        BEQ     L_5782                          ; 5758   0204 0028

        CMPI    #$000D, R0                      ; 575A   0378 000D
        BMI     L_577C                          ; 575C   020B 001E

        CMPI    #$0015, R0                      ; 575E   0378 0015
        BMI     L_5768                          ; 5760   020B 0006

        CMPI    #$0017, R0                      ; 5762   0378 0017
        BMI     L_5807                          ; 5764   020B 00A1
        B       L_5772                          ; 5766   0200 000A

L_5768:
        CMPI    #$0012, R0                      ; 5768   0378 0012
        BMI     L_5786                          ; 576A   020B 001A

        MVI     G_017F, R0                      ; 576C   0280 017F
        ANDI    #$0002, R0                      ; 576E   03B8 0002
        BEQ     L_5786                          ; 5770   0204 0014

L_5772:
        MVI     G_031B, R1                      ; 5772   0281 031B
        MVII    #$0020, R0                      ; 5774   02B8 0020
        COMR    R0                              ; 5776   0018
        AND@    R1,     R0                      ; 5777   0388
        XORI    #$0020, R0                      ; 5778   03F8 0020
        MVO@    R0,     R1                      ; 577A   0248
        PULR    R7                              ; 577B   02B7

L_577C:
        JSR     R5,     L_579C                  ; 577C   0004 0154 039C
        DECLE   $00E0                           ; 577F   00E0

        B       L_5786                          ; 5780   0200 0004

L_5782:
        JSR     R5,     L_579C                  ; 5782   0004 0154 039C
        DECLE   $0020                           ; 5785   0020
L_5786:
        MVI     G_031B, R1                      ; 5786   0281 031B
        MVII    #$0020, R0                      ; 5788   02B8 0020
        COMR    R0                              ; 578A   0018
        AND@    R1,     R0                      ; 578B   0388
        MVO@    R0,     R1                      ; 578C   0248
        PULR    R7                              ; 578D   02B7

L_578E:
        JSR     R5,     L_579C                  ; 578E   0004 0154 039C
        DECLE   $0040                           ; 5791   0040

        MVI     G_031B, R1                      ; 5792   0281 031B
        MVII    #$0020, R0                      ; 5794   02B8 0020
        COMR    R0                              ; 5796   0018
        AND@    R1,     R0                      ; 5797   0388
        XORI    #$0020, R0                      ; 5798   03F8 0020
        MVO@    R0,     R1                      ; 579A   0248
        PULR    R7                              ; 579B   02B7

L_579C:
        MVI     G_011B, R1                      ; 579C   0281 011B
        ANDI    #$0006, R1                      ; 579E   03B9 0006
        SLL     R1,     1                       ; 57A0   0049
        ADDI    #$016D, R1                      ; 57A1   02F9 016D
        MVI@    R1,     R2                      ; 57A3   028A
        ANDI    #$001F, R2                      ; 57A4   03BA 001F
        XOR@    R5,     R2                      ; 57A6   03EA
        MVO@    R2,     R1                      ; 57A7   024A
        MOVR    R5,     R7                      ; 57A8   00AF

        MOVR    R3,     R1                      ; 57A9   0099
        SLL     R3,     1                       ; 57AA   004B
        SLL     R3,     2                       ; 57AB   004F
        ADDI    #$031F, R3                      ; 57AC   02FB 031F
        MVI@    R3,     R0                      ; 57AE   0298
        SDBD                                    ; 57AF   0001
        ANDI    #$FF00, R0                      ; 57B0   03B8 0000 00FF
        MVII    #$03FF, R4                      ; 57B3   02BC 03FF
        INCR    R4                              ; 57B5   000C
        SUBR    R4,     R0                      ; 57B6   0120
        B       L_57C4                          ; 57B7   0200 000B

        MOVR    R3,     R1                      ; 57B9   0099
        SLL     R3,     1                       ; 57BA   004B
        SLL     R3,     2                       ; 57BB   004F
        ADDI    #$031F, R3                      ; 57BC   02FB 031F
        MVI@    R3,     R0                      ; 57BE   0298
        SDBD                                    ; 57BF   0001
        ANDI    #$FF00, R0                      ; 57C0   03B8 0000 00FF
        CLRR    R4                              ; 57C3   01E4
L_57C4:
        INCR    R3                              ; 57C4   000B
        MVI@    R3,     R2                      ; 57C5   029A
        SWAP    R2,     1                       ; 57C6   0042
        ANDI    #$00FF, R2                      ; 57C7   03BA 00FF
        XORR    R0,     R2                      ; 57C9   01C2
        SDBD                                    ; 57CA   0001
        ADDI    #$0808, R4                      ; 57CB   02FC 0008 0008
        ANDI    #$0002, R1                      ; 57CE   03B9 0002
        BEQ     L_57E0                          ; 57D0   0204 000E

        SUBI    #$0002, R3                      ; 57D2   033B 0002
        MVI@    R3,     R3                      ; 57D4   029B
        SDBD                                    ; 57D5   0001
        CMPI    #$5184, R3                      ; 57D6   037B 0084 0051
        BEQ     L_57E0                          ; 57D9   0204 0005

        MVII    #$0004, R0                      ; 57DB   02B8 0004
        SWAP    R0,     1                       ; 57DD   0040
        ADDR    R0,     R2                      ; 57DE   00C2
        ADDR    R0,     R4                      ; 57DF   00C4
L_57E0:
        PSHR    R5                              ; 57E0   0275
        MVI     G_031B, R1                      ; 57E1   0281 031B
        MVI     G_011B, R0                      ; 57E3   0280 011B
        ANDI    #$0001, R0                      ; 57E5   03B8 0001
        BNEQ    L_57ED                          ; 57E7   020C 0004

        JSR     R5,     .EXEC.2AE               ; 57E9   0004 0110 02AE

        PULR    R7                              ; 57EC   02B7

L_57ED:
        JSR     R5,     .EXEC.6F7               ; 57ED   0004 0114 02F7

        BNC     L_5807                          ; 57F0   0209 0015

        CMPR    R4,     R5                      ; 57F2   0165
        BLE     L_580B                          ; 57F3   0206 0016

        MOVR    R1,     R4                      ; 57F5   008C
        ADDI    #$0003, R1                      ; 57F6   02F9 0003
        SUBI    #$0004, R4                      ; 57F8   033C 0004
        SWAP    R2,     1                       ; 57FA   0042
        MVI@    R4,     R3                      ; 57FB   02A3
        SWAP    R3,     1                       ; 57FC   0043
        CMP@    R1,     R2                      ; 57FD   034A
        TSTR    R3                              ; 57FE   009B
        BC      L_5808                          ; 57FF   0201 0007
        BPL     L_5807                          ; 5801   0203 0004

L_5803:
        MVI@    R1,     R0                      ; 5803   0288
        SUBI    #$0008, R1                      ; 5804   0339 0008
        MVO@    R0,     R1                      ; 5806   0248
L_5807:
        PULR    R7                              ; 5807   02B7
L_5808:
        BPL     L_5803                          ; 5808   0223 0006
        PULR    R7                              ; 580A   02B7

L_580B:
        MOVR    R1,     R4                      ; 580B   008C
        ADDI    #$0002, R1                      ; 580C   02F9 0002
        SUBI    #$0004, R4                      ; 580E   033C 0004
        MVI@    R4,     R3                      ; 5810   02A3
        CMP@    R1,     R2                      ; 5811   034A
        TSTR    R3                              ; 5812   009B
        BC      L_5820                          ; 5813   0201 000B
        BPL     L_5807                          ; 5815   0223 000F

L_5817:
        MVI@    R1,     R0                      ; 5817   0288
        SUBI    #$0008, R1                      ; 5818   0339 0008
        SDBD                                    ; 581A   0001
        SUBI    #$0800, R0                      ; 581B   0338 0000 0008
        MVO@    R0,     R1                      ; 581E   0248
        PULR    R7                              ; 581F   02B7
L_5820:
        BPL     L_5817                          ; 5820   0223 000A
        PULR    R7                              ; 5822   02B7

        DECLE   $0004                           ; 5823   0004

        TSTR    R0                              ; 5824   0080
L_5825:
        DECR    R7                              ; 5825   0017

        DECLE   $0319,  $0000,  $0000,  $0060   ; 5826   0319 0000 0000 0060
        DECLE   $0063,  $0063,  $0000,  $0000   ; 582A   0063 0063 0000 0000
        DECLE   $0003,  $0063,  $0063,  $0063   ; 582E   0003 0063 0063 0063
        DECLE   $0063,  $0060,  $0000,  $0042   ; 5832   0063 0060 0000 0042
        DECLE   $0021,  $0021,  $0041,  $0021   ; 5836   0021 0021 0041 0021
        DECLE   $0021,  $0021,  $0021,  $0022   ; 583A   0021 0021 0021 0022
        DECLE   $0000,  $0084,  $0003,  $0063   ; 583E   0000 0084 0003 0063
        DECLE   $0063,  $0000,  $0063,  $0000   ; 5842   0063 0000 0063 0000
        DECLE   $0000,  $0084,  $0146,  $0000   ; 5846   0000 0084 0146 0000
        DECLE   $0000,  $0004,  $0080,  $000D   ; 584A   0000 0004 0080 000D
        DECLE   $01CF,  $0000,  $0003,  $0063   ; 584E   01CF 0000 0003 0063
        DECLE   $0063,  $0000,  $0000,  $0000   ; 5852   0063 0000 0000 0000
        DECLE   $0003,  $0063,  $0063,  $0063   ; 5856   0003 0063 0063 0063
        DECLE   $0063,  $0063,  $0000,  $0000   ; 585A   0063 0063 0000 0000
        DECLE   $0022,  $0042,  $0002,  $0021   ; 585E   0022 0042 0002 0021
        DECLE   $0021,  $0021,  $0021,  $0040   ; 5862   0021 0021 0021 0040
        DECLE   $0000,  $0084,  $0063,  $0000   ; 5866   0000 0084 0063 0000
        DECLE   $0063,  $0063,  $0060,  $0000   ; 586A   0063 0063 0060 0000
        DECLE   $0000,  $00EB,  $0084,  $0084   ; 586E   0000 00EB 0084 0084
        DECLE   $0084,  $0084,  $0080,  $0000   ; 5872   0084 0084 0080 0000
        DECLE   $0000,  $0000,  $0000,  $0063   ; 5876   0000 0000 0000 0063
        DECLE   $0063,  $0000,  $0000,  $0000   ; 587A   0063 0000 0000 0000
        DECLE   $0000,  $0063,  $0063,  $0063   ; 587E   0000 0063 0063 0063
        DECLE   $0063,  $0063,  $0060,  $0000   ; 5882   0063 0063 0060 0000
        DECLE   $0020,  $0000,  $0000,  $0042   ; 5886   0020 0000 0000 0042
        DECLE   $0021,  $0021,  $0022,  $0000   ; 588A   0021 0021 0022 0000
        DECLE   $0003,  $0084,  $0060,  $0000   ; 588E   0003 0084 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5892   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5896   0000 0000 0000 0000
        DECLE   $0000,  $0007,  $016A,  $00C0   ; 589A   0000 0007 016A 00C0
        DECLE   $0005,  $0124,  $0084,  $0084   ; 589E   0005 0124 0084 0084
        DECLE   $0084,  $0084,  $0084,  $0146   ; 58A2   0084 0084 0084 0146
        DECLE   $0000,  $0000,  $0063,  $0063   ; 58A6   0000 0000 0063 0063
        DECLE   $0063,  $0000,  $0000,  $0000   ; 58AA   0063 0000 0000 0000
        DECLE   $0041,  $0000,  $0000,  $0000   ; 58AE   0041 0000 0000 0000
        DECLE   $0042,  $0041,  $0040,  $0000   ; 58B2   0042 0041 0040 0000
        DECLE   $0063,  $0084,  $0000,  $0000   ; 58B6   0063 0084 0000 0000
        DECLE   $0000,  $035B,  $0000,  $0000   ; 58BA   0000 035B 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0021   ; 58BE   0000 0000 0001 0021
        DECLE   $0000,  $0000                   ; 58C2   0000 0000

        SETC                                    ; 58C4   0007
        CMPR    R5,     R2                      ; 58C5   016A
        SUBR    R5,     R4                      ; 58C6   012C
        SUBR    R0,     R0                      ; 58C7   0100
L_58C8:
        DECR    R7                              ; 58C8   0017

        DECLE   $0319,  $001A,  $0360,  $0000   ; 58C9   0319 001A 0360 0000
        DECLE   $00EB,  $0146,  $0000,  $0000   ; 58CD   00EB 0146 0000 0000
        DECLE   $0063,  $0000,  $0000,  $035B   ; 58D1   0063 0000 0000 035B
        DECLE   $0000,  $0001,  $0020,  $0000   ; 58D5   0000 0001 0020 0000
        DECLE   $0000,  $0000,  $0002,  $0000   ; 58D9   0000 0000 0002 0000
        DECLE   $0003,  $0063,  $0084,  $0000   ; 58DD   0003 0063 0084 0000
        DECLE   $0000,  $0000,  $02B6,  $0000   ; 58E1   0000 0000 02B6 0000
        DECLE   $0000,  $0000,  $0001,  $0021   ; 58E5   0000 0000 0001 0021
        DECLE   $0021,  $0020,  $0020,  $0000   ; 58E9   0021 0020 0020 0000
        DECLE   $0007,  $016A,  $00C0,  $000D   ; 58ED   0007 016A 00C0 000D
        DECLE   $01CF,  $0015,  $02C0,  $0000   ; 58F1   01CF 0015 02C0 0000
        DECLE   $0000,  $00EB,  $0146,  $0000   ; 58F5   0000 00EB 0146 0000
        DECLE   $0000,  $0000,  $035B,  $02B6   ; 58F9   0000 0000 035B 02B6
        DECLE   $0000,  $0001,  $0021,  $0000   ; 58FD   0000 0001 0021 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5901   0000 0000 0000 0000
        DECLE   $0063,  $0063,  $0084,  $0000   ; 5905   0063 0063 0084 0000
        DECLE   $00A9,  $0084,  $0211,  $02F8   ; 5909   00A9 0084 0211 02F8
        DECLE   $0320,  $0000,  $0002,  $0042   ; 590D   0320 0000 0002 0042
        DECLE   $0041,  $0021,  $0021,  $0020   ; 5911   0041 0021 0021 0020
        DECLE   $0000,  $0004,  $0080,  $0000   ; 5915   0000 0004 0080 0000
        DECLE   $0000,  $0010,  $0220,  $0000   ; 5919   0000 0010 0220 0000
        DECLE   $0000,  $00A9,  $0188,  $0000   ; 591D   0000 00A9 0188 0000
        DECLE   $0021,  $0000,  $02B6,  $0211   ; 5921   0021 0000 02B6 0211
        DECLE   $0000,  $0001                   ; 5925   0000 0001

        NEGR    R1                              ; 5927   0021
        NEGR    R0                              ; 5928   0020
L_5929:
        DECR    R7                              ; 5929   0017

        DECLE   $0319,  $0000,  $0003,  $0063   ; 592A   0319 0000 0003 0063
        DECLE   $0060,  $0084,  $00A9,  $0084   ; 592E   0060 0084 00A9 0084
        DECLE   $0084,  $0084,  $01AE,  $01E0   ; 5932   0084 0084 01AE 01E0
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5936   0000 0000 0000 0002
        DECLE   $0042,  $0042,  $0041,  $0021   ; 593A   0042 0042 0041 0021
        DECLE   $0004,  $0080,  $0000,  $0000   ; 593E   0004 0080 0000 0000
        DECLE   $0000,  $0000,  $0000,  $00A9   ; 5942   0000 0000 0000 00A9
        DECLE   $0188,  $0000,  $0000,  $0021   ; 5946   0188 0000 0000 0021
        DECLE   $0000,  $0211,  $0000,  $0000   ; 594A   0000 0211 0000 0000
        DECLE   $0021,  $0021,  $0040,  $000D   ; 594E   0021 0021 0040 000D
        DECLE   $01CF,  $0000,  $0003,  $0000   ; 5952   01CF 0000 0003 0000
        DECLE   $0000,  $0084,  $0084,  $0188   ; 5956   0000 0084 0084 0188
        DECLE   $00EB,  $0084,  $0084,  $0000   ; 595A   00EB 0084 0084 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 595E   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0002,  $0042   ; 5962   0000 0000 0002 0042
        DECLE   $0024,  $0081,  $0020,  $0000   ; 5966   0024 0081 0020 0000
        DECLE   $0000,  $0000,  $00A9,  $0188   ; 596A   0000 0000 00A9 0188
        DECLE   $0000,  $0000,  $0021,  $0021   ; 596E   0000 0000 0021 0021
        DECLE   $0000,  $0254,  $0000,  $0001   ; 5972   0000 0254 0000 0001
        DECLE   $0021,  $0042,  $0000,  $0000   ; 5976   0021 0042 0000 0000
        DECLE   $0000,  $0000,  $0003,  $0000   ; 597A   0000 0000 0003 0000
        DECLE   $00A9,  $0084,  $0188,  $0000   ; 597E   00A9 0084 0188 0000
        DECLE   $0000,  $00EB,  $0188,  $0000   ; 5982   0000 00EB 0188 0000
L_5986:
        DECR    R7                              ; 5986   0017

        DECLE   $0319,  $0000,  $0000,  $0000   ; 5987   0319 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0044   ; 598B   0000 0000 0000 0044
        DECLE   $0081,  $0021,  $0000,  $0000   ; 598F   0081 0021 0000 0000
        DECLE   $00A9,  $0188,  $0000,  $0000   ; 5993   00A9 0188 0000 0000
        DECLE   $0021,  $0021,  $0021,  $0000   ; 5997   0021 0021 0021 0000
        DECLE   $0000,  $0000,  $0021,  $0042   ; 599B   0000 0000 0021 0042
        DECLE   $0000,  $0000,  $0000,  $00A9   ; 599F   0000 0000 0000 00A9
        DECLE   $0084,  $0084,  $0084,  $0084   ; 59A3   0084 0084 0084 0084
        DECLE   $0188,  $0000,  $0000,  $0000   ; 59A7   0188 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $000D   ; 59AB   0000 0000 0000 000D
        DECLE   $01CF,  $0000,  $02F8,  $0320   ; 59AF   01CF 0000 02F8 0320
        DECLE   $0000,  $0000,  $0000,  $0004   ; 59B3   0000 0000 0000 0004
        DECLE   $0082,  $0041,  $0000,  $0000   ; 59B7   0082 0041 0000 0000
        DECLE   $00EB,  $0146,  $0000,  $0000   ; 59BB   00EB 0146 0000 0000
        DECLE   $0042,  $0021,  $0021,  $0000   ; 59BF   0042 0021 0021 0000
        DECLE   $0000,  $0021,  $0042,  $0000   ; 59C3   0000 0021 0042 0000
        DECLE   $0000,  $0000,  $00A9,  $0188   ; 59C7   0000 0000 00A9 0188
        DECLE   $0000,  $0003,  $0060,  $0000   ; 59CB   0000 0003 0060 0000
        DECLE   $0000,  $0000,  $0021,  $0000   ; 59CF   0000 0000 0021 0000
        DECLE   $0000,  $0020,  $0000,  $0000   ; 59D3   0000 0020 0000 0000
        DECLE   $0000,  $0000,  $01AE,  $01E0   ; 59D7   0000 0000 01AE 01E0
        DECLE   $0000,  $0000,  $0000,  $0004   ; 59DB   0000 0000 0000 0004
        DECLE   $0080,  $0001,  $0021,  $0000   ; 59DF   0080 0001 0021 0000
        DECLE   $0000,  $00EB,  $0146,  $0000   ; 59E3   0000 00EB 0146 0000
        DECLE   $0000,  $0042,  $0021,  $0021   ; 59E7   0000 0042 0021 0021
        DECLE   $0021,  $0022,  $0000,  $0000   ; 59EB   0021 0022 0000 0000
        DECLE   $0000,  $00A9,  $0188,  $0000   ; 59EF   0000 00A9 0188 0000
        DECLE   $0000,  $0000,  $0060,  $0000   ; 59F3   0000 0000 0060 0000
        DECLE   $0001,  $0021,  $0042,  $0021   ; 59F7   0001 0021 0042 0021
        DECLE   $0021,  $0020,  $0000,  $0000   ; 59FB   0021 0020 0000 0000
        DECLE   $0000,  $035B,  $0000,  $0000   ; 59FF   0000 035B 0000 0000
        DECLE   $0000,  $0000,  $0005,  $012C   ; 5A03   0000 0000 0005 012C
        DECLE   $0100,  $0002,  $0021,  $0000   ; 5A07   0100 0002 0021 0000
        DECLE   $0000,  $0000,  $00EB,  $0146   ; 5A0B   0000 0000 00EB 0146
        DECLE   $0000,  $0000,  $0042,  $0021   ; 5A0F   0000 0000 0042 0021
        DECLE   $0042,  $0040,  $0000,  $0000   ; 5A13   0042 0040 0000 0000
        DECLE   $0000,  $00EB,  $0146,  $0000   ; 5A17   0000 00EB 0146 0000
        DECLE   $0000,  $0000,  $0063,  $0000   ; 5A1B   0000 0000 0063 0000
        DECLE   $0002,  $0042,  $0000,  $0042   ; 5A1F   0002 0042 0000 0042
        DECLE   $0021,  $0021,  $0020,  $0000   ; 5A23   0021 0021 0020 0000
        DECLE   $0000,  $02B6,  $0000,  $0000   ; 5A27   0000 02B6 0000 0000
        DECLE   $0000,  $0005,  $012C,  $0100   ; 5A2B   0000 0005 012C 0100
        DECLE   $0000,  $0000,  $0001,  $0021   ; 5A2F   0000 0000 0001 0021
        DECLE   $0000,  $0000,  $0000,  $00EB   ; 5A33   0000 0000 0000 00EB
        DECLE   $0146,  $0000,  $0000,  $0042   ; 5A37   0146 0000 0000 0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A3B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00EB,  $0146   ; 5A3F   0000 0000 00EB 0146
        DECLE   $0000,  $0000,  $0003,  $0060   ; 5A43   0000 0000 0003 0060
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A47   0000 0000 0000 0000
        DECLE   $0041,  $0021,  $0021,  $0020   ; 5A4B   0041 0021 0021 0020
        DECLE   $0000,  $0211,  $0000,  $0000   ; 5A4F   0000 0211 0000 0000
        DECLE   $0005,  $012C,  $0100,  $0000   ; 5A53   0005 012C 0100 0000
        DECLE   $0000,  $0000,  $0001,  $0021   ; 5A57   0000 0000 0001 0021
        DECLE   $0021,  $0000,  $0000,  $00A9   ; 5A5B   0021 0000 0000 00A9
        DECLE   $0084,  $0146,  $0000,  $0000   ; 5A5F   0084 0146 0000 0000
        DECLE   $0000,  $02F8,  $0320,  $0000   ; 5A63   0000 02F8 0320 0000
        DECLE   $0000,  $0000,  $00A9,  $0188   ; 5A67   0000 0000 00A9 0188
        DECLE   $0000,  $0000,  $0000,  $0063   ; 5A6B   0000 0000 0000 0063
        DECLE   $0063,  $0063,  $0063,  $0000   ; 5A6F   0063 0063 0063 0000
        DECLE   $0002,  $0021,  $0021,  $0021   ; 5A73   0002 0021 0021 0021
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A77   0000 0000 0000 0000
        DECLE   $0004,  $0080,  $0000,  $0000   ; 5A7B   0004 0080 0000 0000
        DECLE   $0000,  $0000,  $0021,  $0021   ; 5A7F   0000 0000 0021 0021
        DECLE   $0021,  $0021,  $0000,  $0084   ; 5A83   0021 0021 0000 0084
        DECLE   $0084,  $0084,  $0146,  $0000   ; 5A87   0084 0084 0146 0000
        DECLE   $0000,  $01AE,  $01E0,  $0000   ; 5A8B   0000 01AE 01E0 0000
        DECLE   $0000,  $00A9,  $0188,  $0000   ; 5A8F   0000 00A9 0188 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5A93   0000 0000 0000 0000
        DECLE   $0003,  $0060,  $0003,  $0060   ; 5A97   0003 0060 0003 0060
        DECLE   $0000,  $0041,  $0021,  $0021   ; 5A9B   0000 0041 0021 0021
        DECLE   $0020,  $0000,  $035B,  $0000   ; 5A9F   0020 0000 035B 0000
        DECLE   $0004,  $0080,  $0000,  $0000   ; 5AA3   0004 0080 0000 0000
        DECLE   $0000,  $0002,  $0021,  $0021   ; 5AA7   0000 0002 0021 0021
        DECLE   $0021,  $0041,  $0021,  $0021   ; 5AAB   0021 0041 0021 0021
        DECLE   $0021,  $0084,  $0084,  $0084   ; 5AAF   0021 0084 0084 0084
        DECLE   $0084,  $0084,  $0084,  $0084   ; 5AB3   0084 0084 0084 0084
        DECLE   $0084,  $0188,  $0000,  $0000   ; 5AB7   0084 0188 0000 0000
        DECLE   $035B,  $0000,  $0253,  $0280   ; 5ABB   035B 0000 0253 0280
        DECLE   $0000,  $0000,  $0000,  $0063   ; 5ABF   0000 0000 0000 0063
        DECLE   $0000,  $0001,  $0021,  $0042   ; 5AC3   0000 0001 0021 0042
        DECLE   $0042,  $0000,  $02B6,  $0000   ; 5AC7   0042 0000 02B6 0000
        DECLE   $0004,  $0092,  $0292,  $0292   ; 5ACB   0004 0092 0292 0292
        DECLE   $0280,  $0000,  $0042,  $0041   ; 5ACF   0280 0000 0042 0041
        DECLE   $0022,  $0001,  $0042,  $0042   ; 5AD3   0022 0001 0042 0042
        DECLE   $0044,  $0084,  $035B,  $0084   ; 5AD7   0044 0084 035B 0084
        DECLE   $0146,  $0000,  $0000,  $035B   ; 5ADB   0146 0000 0000 035B
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5ADF   0000 0000 0000 0000
        DECLE   $02B6,  $0000,  $0000,  $0000   ; 5AE3   02B6 0000 0000 0000
        DECLE   $0001,  $0021,  $0000,  $0003   ; 5AE7   0001 0021 0000 0003
        DECLE   $0060,  $0002,  $0021,  $0000   ; 5AEB   0060 0002 0021 0000
        DECLE   $0000,  $0000,  $0211,  $0000   ; 5AEF   0000 0000 0211 0000
        DECLE   $0004,  $0080,  $0000           ; 5AF3   0004 0080 0000
L_5AF6:
        DECR    R7                              ; 5AF6   0017

        DECLE   $0319,  $0000,  $0000,  $0002   ; 5AF7   0319 0000 0000 0002
        DECLE   $0040,  $0001,  $0000,  $0084   ; 5AFB   0040 0001 0000 0084
        DECLE   $0084,  $0084,  $02B6,  $0084   ; 5AFF   0084 0084 02B6 0084
        DECLE   $0084,  $0146,  $0000,  $02B6   ; 5B03   0084 0146 0000 02B6
        DECLE   $0000                           ; 5B07   0000
L_5B08:
        DECR    R7                              ; 5B08   0017

        DECLE   $0319,  $0000,  $0211,  $0000   ; 5B09   0319 0000 0211 0000
        DECLE   $0000,  $0001,  $0022,  $0042   ; 5B0D   0000 0001 0022 0042
        DECLE   $0000,  $0000,  $0060,  $0000   ; 5B11   0000 0000 0060 0000
        DECLE   $0022,  $0000,  $00A9,  $0084   ; 5B15   0022 0000 00A9 0084
        DECLE   $0084,  $0084,  $0084,  $0083   ; 5B19   0084 0084 0084 0083
        DECLE   $0000,  $000D,  $01CF,  $02F8   ; 5B1D   0000 000D 01CF 02F8
        DECLE   $0320,  $0000,  $0000,  $0002   ; 5B21   0320 0000 0000 0002
        DECLE   $0000,  $00EB,  $0084,  $0084   ; 5B25   0000 00EB 0084 0084
        DECLE   $0211,  $0084,  $0084,  $0188   ; 5B29   0211 0084 0084 0188
        DECLE   $0000,  $0211,  $0000,  $000D   ; 5B2D   0000 0211 0000 000D
        DECLE   $01CF,  $0000,  $02F8,  $0320   ; 5B31   01CF 0000 02F8 0320
        DECLE   $0000,  $0002,  $0000,  $0000   ; 5B35   0000 0002 0000 0000
        DECLE   $0000,  $0000,  $0063,  $0000   ; 5B39   0000 0000 0063 0000
        DECLE   $0040,  $0000,  $0084,  $0100   ; 5B3D   0040 0000 0084 0100
        DECLE   $0000,  $0063,  $0064,  $0083   ; 5B41   0000 0063 0064 0083
        DECLE   $0060,  $0000,  $0000,  $01AE   ; 5B45   0060 0000 0000 01AE
        DECLE   $01E0,  $0000,  $0000,  $0000   ; 5B49   01E0 0000 0000 0000
        DECLE   $0000,  $0000,  $00EB,  $0084   ; 5B4D   0000 0000 00EB 0084
        DECLE   $0084,  $0084,  $0188,  $0000   ; 5B51   0084 0084 0188 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B55   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $01AE,  $01E0   ; 5B59   0000 0000 01AE 01E0
        DECLE   $0000,  $0000,  $0000,  $00A9   ; 5B5D   0000 0000 0000 00A9
        DECLE   $0146,  $0000,  $0063,  $0000   ; 5B61   0146 0000 0063 0000
        DECLE   $0000,  $0000,  $0084,  $0000   ; 5B65   0000 0000 0084 0000
        DECLE   $0003,  $0060,  $0004,  $0080   ; 5B69   0003 0060 0004 0080
        DECLE   $0063,  $0060,  $0000,  $0000   ; 5B6D   0063 0060 0000 0000
        DECLE   $0012,  $0280,  $0000,  $0063   ; 5B71   0012 0280 0000 0063
        DECLE   $0063,  $0000,  $0000,  $00EB   ; 5B75   0063 0000 0000 00EB
        DECLE   $0084,  $0188,  $0000,  $0000   ; 5B79   0084 0188 0000 0000
        DECLE   $0021,  $0021,  $0020,  $0000   ; 5B7D   0021 0021 0020 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5B81   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00A9,  $0084   ; 5B85   0000 0000 00A9 0084
        DECLE   $0188,  $0000,  $0063,  $0063   ; 5B89   0188 0000 0063 0063
        DECLE   $0060,  $0000,  $0084,  $0000   ; 5B8D   0060 0000 0084 0000
        DECLE   $0063,  $0060,  $0004,  $0080   ; 5B91   0063 0060 0004 0080
        DECLE   $0000,  $0063,  $0063,  $0060   ; 5B95   0000 0063 0063 0060
        DECLE   $0000,  $0000,  $0003,  $0063   ; 5B99   0000 0000 0003 0063
        DECLE   $0003,  $0063,  $0000,  $0000   ; 5B9D   0003 0063 0000 0000
        DECLE   $00E8,  $0000,  $0000,  $0001   ; 5BA1   00E8 0000 0000 0001
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5BA5   0021 0021 0021 0021
        DECLE   $0020,  $0001,  $0021,  $0000   ; 5BA9   0020 0001 0021 0000
        DECLE   $0000,  $0000,  $0084,  $0188   ; 5BAD   0000 0000 0084 0188
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5BB1   0000 0000 0000 0000
        DECLE   $0063,  $0063,  $0084,  $0063   ; 5BB5   0063 0063 0084 0063
        DECLE   $0060,  $0000,  $0004,  $0080   ; 5BB9   0060 0000 0004 0080
        DECLE   $0000,  $0000,  $0000,  $0063   ; 5BBD   0000 0000 0000 0063
        DECLE   $0060,  $0000,  $0063,  $0000   ; 5BC1   0060 0000 0063 0000
        DECLE   $0000,  $0003,  $0060,  $0000   ; 5BC5   0000 0003 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0002   ; 5BC9   0000 0000 0000 0002
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5BCD   0021 0021 0021 0021
        DECLE   $0021,  $0021,  $0021,  $0021   ; 5BD1   0021 0021 0021 0021
        DECLE   $0020,  $0000,  $0084,  $0000   ; 5BD5   0020 0000 0084 0000
        DECLE   $0000,  $0000,  $0000,  $0003   ; 5BD9   0000 0000 0000 0003
        DECLE   $0060,  $0000,  $0084,  $0000   ; 5BDD   0060 0000 0084 0000
        DECLE   $0000,  $0000                   ; 5BE1   0000 0000
L_5BE3:
        PSHR    R5                              ; 5BE3   0275
        CMPI    #$0002, R0                      ; 5BE4   0378 0002
        BEQ     L_5C3C                          ; 5BE6   0204 0054

        SLL     R1,     1                       ; 5BE8   0049
        SLL     R1,     2                       ; 5BE9   004D
        MOVR    R1,     R2                      ; 5BEA   008A
        SLL     R2,     2                       ; 5BEB   004E
        ADDI    #$033C, R2                      ; 5BEC   02FA 033C
        MVO     R1,     G_0160                  ; 5BEE   0241 0160
        ADDI    #$016D, R1                      ; 5BF0   02F9 016D
        MOVR    R1,     R4                      ; 5BF2   008C
        ADDI    #$0004, R4                      ; 5BF3   02FC 0004
        MOVR    R4,     R3                      ; 5BF5   00A3
        ADDI    #$0002, R3                      ; 5BF6   02FB 0002
        MVI@    R3,     R0                      ; 5BF8   0298
        CMPI    #$0003, R0                      ; 5BF9   0378 0003
        BPL     L_5C2B                          ; 5BFB   0203 002E

        MVI@    R2,     R0                      ; 5BFD   0290
        INCR    R0                              ; 5BFE   0008
        MVO@    R0,     R2                      ; 5BFF   0250
        MOVR    R4,     R2                      ; 5C00   00A2
        MVII    #$0002, R4                      ; 5C01   02BC 0002
        MVO     R4,     G_0184                  ; 5C03   0244 0184
L_5C05:
        MVI@    R2,     R3                      ; 5C05   0293
        MVI@    R1,     R0                      ; 5C06   0288
        MVO@    R0,     R2                      ; 5C07   0250
        MVO@    R3,     R1                      ; 5C08   024B
        INCR    R1                              ; 5C09   0009
        INCR    R2                              ; 5C0A   000A
        DECR    R4                              ; 5C0B   0014
        BPL     L_5C05                          ; 5C0C   0223 0008

        MVI     G_0160, R1                      ; 5C0E   0281 0160
        SLL     R1,     2                       ; 5C10   004D
        ADDI    #$031F, R1                      ; 5C11   02F9 031F
        MOVR    R1,     R2                      ; 5C13   008A
        ADDI    #$0010, R2                      ; 5C14   02FA 0010
        MVI@    R1,     R0                      ; 5C16   0288
        MVI@    R2,     R3                      ; 5C17   0293
        MVO@    R3,     R1                      ; 5C18   024B
        MVO@    R0,     R2                      ; 5C19   0250
        SDBD                                    ; 5C1A   0001
        ADDI    #$0800, R3                      ; 5C1B   02FB 0000 0008
        ADDI    #$0008, R1                      ; 5C1E   02F9 0008
        MVO@    R3,     R1                      ; 5C20   024B
        SUBI    #$0007, R1                      ; 5C21   0339 0007
        INCR    R2                              ; 5C23   000A
        MVI@    R1,     R0                      ; 5C24   0288
        MVI@    R2,     R3                      ; 5C25   0293
        MVO@    R3,     R1                      ; 5C26   024B
        MVO@    R0,     R2                      ; 5C27   0250
        ADDI    #$0008, R1                      ; 5C28   02F9 0008
        MVO@    R3,     R1                      ; 5C2A   024B
L_5C2B:
        PULR    R7                              ; 5C2B   02B7

        SLL     R1,     1                       ; 5C2C   0049
        SLL     R1,     2                       ; 5C2D   004D
        ADDI    #$016D, R1                      ; 5C2E   02F9 016D
        MVI@    R1,     R0                      ; 5C30   0288
        ANDI    #$00EF, R0                      ; 5C31   03B8 00EF
        XORI    #$0010, R0                      ; 5C33   03F8 0010
        MVO@    R0,     R1                      ; 5C35   0248
        MVI     G_0186, R0                      ; 5C36   0280 0186
        INCR    R0                              ; 5C38   0008
        MVO     R0,     G_0186                  ; 5C39   0240 0186
        MOVR    R5,     R7                      ; 5C3B   00AF

L_5C3C:
        MOVR    R1,     R2                      ; 5C3C   008A
        ADDI    #$0169, R2                      ; 5C3D   02FA 0169
        MVI@    R2,     R0                      ; 5C3F   0290
        TSTR    R0                              ; 5C40   0080
        BNEQ    L_5C2B                          ; 5C41   022C 0017

        MVII    #$0001, R0                      ; 5C43   02B8 0001
        MVO@    R0,     R2                      ; 5C45   0250
        MOVR    R1,     R2                      ; 5C46   008A
        SLL     R2,     1                       ; 5C47   004A
        ADDI    #$0165, R2                      ; 5C48   02FA 0165
        SLL     R1,     1                       ; 5C4A   0049
        SLL     R1,     2                       ; 5C4B   004D
        SLL     R1,     2                       ; 5C4C   004D
        ADDI    #$031F, R1                      ; 5C4D   02F9 031F
        MVI@    R1,     R0                      ; 5C4F   0288
        SWAP    R0,     1                       ; 5C50   0040
        MVO@    R0,     R2                      ; 5C51   0250
        INCR    R1                              ; 5C52   0009
        INCR    R2                              ; 5C53   000A
        MVI@    R1,     R0                      ; 5C54   0288
        SWAP    R0,     1                       ; 5C55   0040
        MVO@    R0,     R2                      ; 5C56   0250
        MVII    #$0032, R0                      ; 5C57   02B8 0032

        JSR     R5,     .EXEC.A62               ; 5C59   0004 0118 0262

        MVII    #$0002, R2                      ; 5C5C   02BA 0002
        MVII    #$0169, R1                      ; 5C5E   02B9 0169
        MVI@    R1,     R0                      ; 5C60   0288
        CMPI    #$0001, R0                      ; 5C61   0378 0001
        BNEQ    L_5C66                          ; 5C63   020C 0001

        MVO@    R2,     R1                      ; 5C65   024A
L_5C66:
        INCR    R1                              ; 5C66   0009
        MVI@    R1,     R0                      ; 5C67   0288
        CMPI    #$0001, R0                      ; 5C68   0378 0001
        BNEQ    L_5C6D                          ; 5C6A   020C 0001

        MVO@    R2,     R1                      ; 5C6C   024A
L_5C6D:
        MVII    #$0001, R0                      ; 5C6D   02B8 0001
        MVO     R0,     G_0333                  ; 5C6F   0240 0333
        MVO     R0,     G_0353                  ; 5C71   0240 0353
        PULR    R7                              ; 5C73   02B7

        PSHR    R5                              ; 5C74   0275
        MVI     G_0187, R0                      ; 5C75   0280 0187
        TSTR    R0                              ; 5C77   0080
        BNEQ    L_5D28                          ; 5C78   020C 00AE

        MOVR    R1,     R3                      ; 5C7A   008B
        ADDI    #$0163, R1                      ; 5C7B   02F9 0163
        MVI@    R1,     R0                      ; 5C7D   0288
        TSTR    R0                              ; 5C7E   0080
        BNEQ    L_5D28                          ; 5C7F   020C 00A7

        MOVR    R3,     R1                      ; 5C81   0099
        SLL     R1,     1                       ; 5C82   0049
        SLL     R1,     2                       ; 5C83   004D
        SLL     R1,     2                       ; 5C84   004D
        ADDI    #$0336, R1                      ; 5C85   02F9 0336
        MVI@    R1,     R0                      ; 5C87   0288
        TSTR    R0                              ; 5C88   0080
        BNEQ    L_5D28                          ; 5C89   020C 009D

        DECR    R1                              ; 5C8B   0011
        MOVR    R1,     R2                      ; 5C8C   008A
        SDBD                                    ; 5C8D   0001
        MVII    #$5DE3, R1                      ; 5C8E   02B9 00E3 005D

        JSR     R5,     X_INIT_MOB              ; 5C91   0004 0114 02B2

        MOVR    R2,     R1                      ; 5C94   0091
        SUBI    #$0016, R1                      ; 5C95   0339 0016
        MVI@    R1,     R0                      ; 5C97   0288
        ADDI    #$03FF, R0                      ; 5C98   02F8 03FF
        ADDI    #$0002, R2                      ; 5C9A   02FA 0002
        MVO@    R0,     R2                      ; 5C9C   0250
        INCR    R1                              ; 5C9D   0009
        INCR    R2                              ; 5C9E   000A
        MVI@    R1,     R0                      ; 5C9F   0288
        SUBI    #$0100, R0                      ; 5CA0   0338 0100
        MVO@    R0,     R2                      ; 5CA2   0250
        INCR    R2                              ; 5CA3   000A
        SLL     R3,     1                       ; 5CA4   004B
        SLL     R3,     2                       ; 5CA5   004F
        ADDI    #$016D, R3                      ; 5CA6   02FB 016D
        MVI@    R3,     R1                      ; 5CA8   0299
        ANDI    #$000F, R1                      ; 5CA9   03B9 000F
        MVII    #$003F, R0                      ; 5CAB   02B8 003F

        JSR     R5,     L_5650                  ; 5CAD   0004 0154 0250

        MVO@    R0,     R2                      ; 5CB0   0250
        PULR    R7                              ; 5CB1   02B7

        PSHR    R5                              ; 5CB2   0275
        MOVR    R0,     R2                      ; 5CB3   0082
        SLR     R2,     2                       ; 5CB4   0066
        ADDI    #$0163, R2                      ; 5CB5   02FA 0163
        MVII    #$0005, R0                      ; 5CB7   02B8 0005
        MVO@    R0,     R2                      ; 5CB9   0250
        MVI@    R1,     R0                      ; 5CBA   0288
        SDBD                                    ; 5CBB   0001
        XORI    #$1800, R0                      ; 5CBC   03F8 0000 0018
        MVO@    R0,     R1                      ; 5CBF   0248
        INCR    R1                              ; 5CC0   0009
        SDBD                                    ; 5CC1   0001
        MVII    #$5168, R0                      ; 5CC2   02B8 0068 0051
        MVO@    R0,     R1                      ; 5CC5   0248
        ADDI    #$0005, R1                      ; 5CC6   02F9 0005
        MVII    #$0013, R0                      ; 5CC8   02B8 0013
        MVO@    R0,     R1                      ; 5CCA   0248
        MOVR    R1,     R3                      ; 5CCB   008B
        SUBI    #$033B, R3                      ; 5CCC   033B 033B
        SLR     R3,     2                       ; 5CCE   0067
        MOVR    R3,     R2                      ; 5CCF   009A
        ADDI    #$016D, R2                      ; 5CD0   02FA 016D
        MVI@    R2,     R4                      ; 5CD2   0294
        MOVR    R4,     R0                      ; 5CD3   00A0
        PSHR    R0                              ; 5CD4   0270
        MVII    #$0003, R0                      ; 5CD5   02B8 0003

        JSR     R5,     X_RAND2                 ; 5CD7   0004 0114 029E

        DECR    R0                              ; 5CDA   0010
        ADD@    R6,     R0                      ; 5CDB   02F0
        ANDI    #$00F0, R4                      ; 5CDC   03BC 00F0
        ANDI    #$000F, R0                      ; 5CDE   03B8 000F
        ADDR    R0,     R4                      ; 5CE0   00C4
        MVO@    R4,     R2                      ; 5CE1   0254
        MVI     G_0187, R4                      ; 5CE2   0284 0187
        TSTR    R4                              ; 5CE4   00A4
        BNEQ    L_5D28                          ; 5CE5   020C 0041

        INCR    R2                              ; 5CE7   000A
        MVI@    R2,     R4                      ; 5CE8   0294
        ANDI    #$007F, R4                      ; 5CE9   03BC 007F
        XORI    #$0080, R4                      ; 5CEB   03FC 0080
        MVO@    R4,     R2                      ; 5CED   0254
        SLL     R3,     2                       ; 5CEE   004F
        ADDI    #$0321, R3                      ; 5CEF   02FB 0321
        MOVR    R0,     R1                      ; 5CF1   0081
        MVII    #$0005, R0                      ; 5CF2   02B8 0005

        JSR     R5,     X_RAND2                 ; 5CF4   0004 0114 029E

        ADDI    #$000A, R0                      ; 5CF7   02F8 000A
        NEGR    R0                              ; 5CF9   0020

        JSR     R5,     L_5650                  ; 5CFA   0004 0154 0250

        MVO@    R0,     R3                      ; 5CFD   0258

        JSR     R5,     L_5E32                  ; 5CFE   0004 015C 0232

L_5D01:
        PULR    R7                              ; 5D01   02B7

        PSHR    R5                              ; 5D02   0275
        MOVR    R1,     R4                      ; 5D03   008C
        ADDI    #$0002, R4                      ; 5D04   02FC 0002
        MVI@    R4,     R0                      ; 5D06   02A0
        PSHR    R1                              ; 5D07   0271
        MVI@    R4,     R1                      ; 5D08   02A1

        JSR     R5,     L_5629                  ; 5D09   0004 0154 0229

        PULR    R1                              ; 5D0C   02B1
        CMPI    #$0003, R0                      ; 5D0D   0378 0003
        BMI     L_5D19                          ; 5D0F   020B 0008

        CMPI    #$000D, R0                      ; 5D11   0378 000D
        BMI     L_5D28                          ; 5D13   020B 0013

        JSR     R5,     .EXEC.7AE               ; 5D15   0004 0114 03AE

        PULR    R7                              ; 5D18   02B7

L_5D19:
        CMPI    #$0001, R0                      ; 5D19   0378 0001
        BMI     L_5D28                          ; 5D1B   020B 000B

        MVII    #$0004, R0                      ; 5D1D   02B8 0004

        JSR     R5,     X_RAND1                 ; 5D1F   0004 0114 027D

        TSTR    R0                              ; 5D22   0080
        BNEQ    L_5D28                          ; 5D23   020C 0003

        JSR     R5,     .EXEC.7AE               ; 5D25   0004 0114 03AE

L_5D28:
        PULR    R7                              ; 5D28   02B7

        PSHR    R5                              ; 5D29   0275
        MVI     G_0184, R2                      ; 5D2A   0282 0184
        TSTR    R2                              ; 5D2C   0092
        BNEQ    L_5D01                          ; 5D2D   022C 002D

        MVO     R3,     G_0161                  ; 5D2F   0243 0161
        MOVR    R3,     R2                      ; 5D31   009A
        ANDI    #$0006, R2                      ; 5D32   03BA 0006
        SLL     R2,     1                       ; 5D34   004A
        ADDI    #$016F, R2                      ; 5D35   02FA 016F
        MVI@    R2,     R2                      ; 5D37   0292
        CMPI    #$0003, R2                      ; 5D38   037A 0003
        BPL     L_5D01                          ; 5D3A   0223 003A

        SUBI    #$0335, R1                      ; 5D3C   0339 0335
        SLR     R1,     1                       ; 5D3E   0061
        SLR     R1,     2                       ; 5D3F   0065
        XORR    R3,     R1                      ; 5D40   01D9
        ANDI    #$0004, R1                      ; 5D41   03B9 0004
        BNEQ    L_5D53                          ; 5D43   020C 000E

        MVI     G_031B, R1                      ; 5D45   0281 031B
        ADDI    #$0007, R1                      ; 5D47   02F9 0007
        MVI@    R1,     R1                      ; 5D49   0289
        MOVR    R3,     R2                      ; 5D4A   009A
        ANDI    #$0002, R2                      ; 5D4B   03BA 0002
        SLR     R2,     1                       ; 5D4D   0062
        ADDR    R1,     R2                      ; 5D4E   00CA
        ANDI    #$0001, R2                      ; 5D4F   03BA 0001
        BEQ     L_5D28                          ; 5D51   0224 002A

L_5D53:
        JSR     R5,     L_5E43                  ; 5D53   0004 015C 0243

        MVI     G_0161, R3                      ; 5D56   0283 0161
        MOVR    R3,     R1                      ; 5D58   0099
        ANDI    #$0006, R1                      ; 5D59   03B9 0006
        SLL     R1,     1                       ; 5D5B   0049
        ADDI    #$016D, R1                      ; 5D5C   02F9 016D
        PSHR    R1                              ; 5D5E   0271
        MVI     G_031B, R2                      ; 5D5F   0282 031B
        ADDI    #$0004, R2                      ; 5D61   02FA 0004
        MVI@    R2,     R0                      ; 5D63   0290

        JSR     R5,     X_UNPK_BYTES            ; 5D64   0004 0114 0357
        JSR     R5,     .EXEC.A2F               ; 5D67   0004 0118 022F

        MVII    #$0003, R0                      ; 5D6A   02B8 0003

        JSR     R5,     X_RAND2                 ; 5D6C   0004 0114 029E

        ADDR    R0,     R1                      ; 5D6F   00C1
        DECR    R1                              ; 5D70   0011
        MVII    #$0005, R0                      ; 5D71   02B8 0005

        JSR     R5,     X_RAND2                 ; 5D73   0004 0114 029E

        ADDI    #$000A, R0                      ; 5D76   02F8 000A

        JSR     R5,     L_5650                  ; 5D78   0004 0154 0250

        ANDI    #$0006, R3                      ; 5D7B   03BB 0006
        SLL     R3,     1                       ; 5D7D   004B
        SLL     R3,     2                       ; 5D7E   004F
        ADDI    #$0321, R3                      ; 5D7F   02FB 0321
        MVI     G_0187, R2                      ; 5D81   0282 0187
        TSTR    R2                              ; 5D83   0092
        BNEQ    L_5D87                          ; 5D84   020C 0001

        MVO@    R0,     R3                      ; 5D86   0258
L_5D87:
        ADDI    #$0002, R3                      ; 5D87   02FB 0002
        MVII    #$0001, R0                      ; 5D89   02B8 0001
        MVO@    R0,     R3                      ; 5D8B   0258
        PULR    R1                              ; 5D8C   02B1
        MVI@    R1,     R2                      ; 5D8D   028A
        MOVR    R2,     R3                      ; 5D8E   0093
        ANDI    #$00F0, R2                      ; 5D8F   03BA 00F0
        MVII    #$0003, R0                      ; 5D91   02B8 0003

        JSR     R5,     X_RAND2                 ; 5D93   0004 0114 029E

        ADDR    R0,     R3                      ; 5D96   00C3
        DECR    R3                              ; 5D97   0013
        ANDI    #$000F, R3                      ; 5D98   03BB 000F
        ADDR    R3,     R2                      ; 5D9A   00DA
        MVO@    R2,     R1                      ; 5D9B   024A
        INCR    R1                              ; 5D9C   0009
        MVI@    R1,     R0                      ; 5D9D   0288
        ANDI    #$007F, R0                      ; 5D9E   03B8 007F
        XORI    #$0080, R0                      ; 5DA0   03F8 0080
        MVO@    R0,     R1                      ; 5DA2   0248
        PSHR    R1                              ; 5DA3   0271
        SDBD                                    ; 5DA4   0001
        MVII    #$5DF7, R1                      ; 5DA5   02B9 00F7 005D
        MVI     G_031B, R2                      ; 5DA8   0282 031B
        MOVR    R2,     R3                      ; 5DAA   0093
        ADDI    #$0002, R3                      ; 5DAB   02FB 0002
        MVI@    R3,     R4                      ; 5DAD   029C
        INCR    R3                              ; 5DAE   000B
        MVI@    R3,     R3                      ; 5DAF   029B

        JSR     R5,     X_INIT_MOB              ; 5DB0   0004 0114 02B2

        ADDI    #$0002, R2                      ; 5DB3   02FA 0002
        MVO@    R4,     R2                      ; 5DB5   0254
        INCR    R2                              ; 5DB6   000A
        MVO@    R3,     R2                      ; 5DB7   0253
        PULR    R1                              ; 5DB8   02B1
        INCR    R1                              ; 5DB9   0009
        MVI@    R1,     R0                      ; 5DBA   0288
        INCR    R0                              ; 5DBB   0008
        MVO@    R0,     R1                      ; 5DBC   0248
        CMPI    #$0003, R0                      ; 5DBD   0378 0003
        BMI     L_5D28                          ; 5DBF   022B 0098

        JSR     R5,     L_5EA0                  ; 5DC1   0004 015C 02A0

        PULR    R7                              ; 5DC4   02B7

        PSHR    R5                              ; 5DC5   0275
        MOVR    R1,     R4                      ; 5DC6   008C
        ADDI    #$0002, R4                      ; 5DC7   02FC 0002
        MVI@    R4,     R3                      ; 5DC9   02A3
        ADDI    #$03FF, R3                      ; 5DCA   02FB 03FF
        PSHR    R3                              ; 5DCC   0273
        MVI@    R4,     R3                      ; 5DCD   02A3
        ADDI    #$03FF, R3                      ; 5DCE   02FB 03FF
        MOVR    R1,     R2                      ; 5DD0   008A
        SDBD                                    ; 5DD1   0001
        MVII    #$5DF3, R1                      ; 5DD2   02B9 00F3 005D

        JSR     R5,     X_INIT_MOB              ; 5DD5   0004 0114 02B2

        SUBI    #$0002, R4                      ; 5DD8   033C 0002
        PULR    R2                              ; 5DDA   02B2
        MVO@    R2,     R4                      ; 5DDB   0262
        MVO@    R3,     R4                      ; 5DDC   0263
        MVI     G_0187, R0                      ; 5DDD   0280 0187
        TSTR    R0                              ; 5DDF   0080
        BNEQ    L_5E27                          ; 5DE0   020C 0045
        PULR    R7                              ; 5DE2   02B7

        DECLE   $0080,  $0000,  $0061,  $0051   ; 5DE3   0080 0000 0061 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DE7   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DEB   0000 0000 0000 0000
        DECLE   $0002,  $0000,  $0000,  $0000   ; 5DEF   0002 0000 0000 0000
        DECLE   $0040,  $0018,  $0084,  $0051   ; 5DF3   0040 0018 0084 0051
        DECLE   $0042,  $0010,  $007D,  $0051   ; 5DF7   0042 0010 007D 0051
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5DFB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00F0,  $0007   ; 5DFF   0000 0000 00F0 0007
        DECLE   $0012,  $0000                   ; 5E03   0012 0000

        PSHR    R5                              ; 5E05   0275
        PSHR    R1                              ; 5E06   0271

        JSR     R5,     L_5F2E                  ; 5E07   0004 015C 032E

        PULR    R1                              ; 5E0A   02B1
        ADDI    #$0004, R1                      ; 5E0B   02F9 0004
        CLRR    R0                              ; 5E0D   01C0
        MVO@    R0,     R1                      ; 5E0E   0248
        SUBI    #$0321, R1                      ; 5E0F   0339 0321
        ANDI    #$0006, R1                      ; 5E11   03B9 0006
        SLL     R1,     1                       ; 5E13   0049
        ADDI    #$016D, R1                      ; 5E14   02F9 016D
        MVI@    R1,     R1                      ; 5E16   0289
        INCR    R1                              ; 5E17   0009
        MVI@    R1,     R0                      ; 5E18   0288
        ANDI    #$007F, R0                      ; 5E19   03B8 007F
        MVO@    R0,     R1                      ; 5E1B   0248
        PULR    R7                              ; 5E1C   02B7

        PSHR    R5                              ; 5E1D   0275

        JSR     R5,     .EXEC.7AE               ; 5E1E   0004 0114 03AE

        MVI     G_0187, R0                      ; 5E21   0280 0187
        TSTR    R0                              ; 5E23   0080
        BNEQ    L_5E27                          ; 5E24   020C 0001
        PULR    R7                              ; 5E26   02B7

L_5E27:
        MVII    #$001E, R0                      ; 5E27   02B8 001E

        JSR     R5,     .EXEC.A62               ; 5E29   0004 0118 0262
        JSR     R5,     .EXEC.7B3               ; 5E2C   0004 0114 03B3

        J       L_5061                          ; 5E2F   0004 0350 0061

L_5E32:
        PSHR    R5                              ; 5E32   0275

        JSR     R5,     X_PLAY_SFX2             ; 5E33   0004 0118 03BE
        DECLE   $00B2                           ; 5E36  SFX prio
        DECLE   $0379                           ; 5E37  SFX data
        DECLE   $006C,  $0000                   ; 5E38  SFX data
        DECLE   $0035                           ; 5E3A  SFX data
        DECLE   $00B7                           ; 5E3B  SFX data
        DECLE   $030D                           ; 5E3C  SFX data
        DECLE   $000B                           ; 5E3D  SFX data
        DECLE   $008F,  $0013                   ; 5E3E  SFX data
        DECLE   $01CF                           ; 5E40  SFX end


        B       L_5E64                          ; 5E41   0200 0021

L_5E43:
        PSHR    R5                              ; 5E43   0275

        JSR     R5,     X_PLAY_SFX2             ; 5E44   0004 0118 03BE
        DECLE   $00BC                           ; 5E47  SFX prio
        DECLE   $0079                           ; 5E48  SFX data
        DECLE   $00AC,  $0000                   ; 5E49  SFX data
        DECLE   $03B7                           ; 5E4B  SFX data
        DECLE   $030D                           ; 5E4C  SFX data
        DECLE   $000B                           ; 5E4D  SFX data
        DECLE   $008F,  $003F                   ; 5E4E  SFX data
        DECLE   $01CF                           ; 5E50  SFX end


        B       L_5E64                          ; 5E51   0200 0011

L_5E53:
        PSHR    R5                              ; 5E53   0275

        JSR     R5,     X_PLAY_SFX2             ; 5E54   0004 0118 03BE
        DECLE   $00C6                           ; 5E57  SFX prio
        DECLE   $0079                           ; 5E58  SFX data
        DECLE   $020C,  $0000                   ; 5E59  SFX data
        DECLE   $03B7                           ; 5E5B  SFX data
        DECLE   $03ED                           ; 5E5C  SFX data
        DECLE   $000B                           ; 5E5D  SFX data
        DECLE   $008F,  $008F                   ; 5E5E  SFX data
        DECLE   $01CF                           ; 5E60  SFX end


        B       L_5E64                          ; 5E61   0200 0001

L_5E63:
        PSHR    R5                              ; 5E63   0275
L_5E64:
        MVI     G_0185, R0                      ; 5E64   0280 0185
        TSTR    R0                              ; 5E66   0080
        BNEQ    L_5E6A                          ; 5E67   020C 0001
        PULR    R7                              ; 5E69   02B7

L_5E6A:
        CMPI    #$0001, R0                      ; 5E6A   0378 0001
        BNEQ    L_5E89                          ; 5E6C   020C 001B

L_5E6E:
        JSR     R5,     X_PLAY_SFX2             ; 5E6E   0004 0118 03BE
        DECLE   $008A                           ; 5E71  SFX prio
        DECLE   $0369                           ; 5E72  SFX data
        DECLE   $0120,  $0200                   ; 5E73  SFX data
        DECLE   $03ED                           ; 5E75  SFX data
        DECLE   $0032                           ; 5E76  SFX data
        DECLE   $03EB                           ; 5E77  SFX data
        DECLE   $0002                           ; 5E78  SFX data
        DECLE   $03CF                           ; 5E79  SFX end

L_5E7A:
        PSHR    R5                              ; 5E7A   0275
        MVI     G_0185, R0                      ; 5E7B   0280 0185
        TSTR    R0                              ; 5E7D   0080
        BNEQ    L_5E95                          ; 5E7E   020C 0015

        JSR     R5,     X_PLAY_SFX2             ; 5E80   0004 0118 03BE
        DECLE   $008A                           ; 5E83  SFX prio
        DECLE   $03ED                           ; 5E84  SFX data
        DECLE   $02A5                           ; 5E85  SFX data
        DECLE   $03D2                           ; 5E86  SFX data
        DECLE   $03EB                           ; 5E87  SFX data
        DECLE   $02CF                           ; 5E88  SFX end

L_5E89:
        JSR     R5,     X_PLAY_SFX2             ; 5E89   0004 0118 03BE
        DECLE   $009E                           ; 5E8C  SFX prio
        DECLE   $03ED                           ; 5E8D  SFX data
        DECLE   $0369                           ; 5E8E  SFX data
        DECLE   $02A0,  $0200                   ; 5E8F  SFX data
        DECLE   $0012                           ; 5E91  SFX data
        DECLE   $03EB                           ; 5E92  SFX data
        DECLE   $0002                           ; 5E93  SFX data
        DECLE   $03CF                           ; 5E94  SFX end

L_5E95:
        JSR     R5,     X_PLAY_SFX2             ; 5E95   0004 0118 03BE
        DECLE   $009E                           ; 5E98  SFX prio
        DECLE   $03ED                           ; 5E99  SFX data
        DECLE   $0305                           ; 5E9A  SFX data
        DECLE   $03D2                           ; 5E9B  SFX data
        DECLE   $03EB                           ; 5E9C  SFX data
        DECLE   $01CF                           ; 5E9D  SFX end


        B       L_5E6E                          ; 5E9E   0220 0031

L_5EA0:
        PSHR    R5                              ; 5EA0   0275

        JSR     R5,     L_5E53                  ; 5EA1   0004 015C 0253

        MVI     G_0161, R1                      ; 5EA4   0281 0161
        SLR     R1,     2                       ; 5EA6   0065
        MVO     R1,     G_015F                  ; 5EA7   0241 015F

        JSR     R5,     L_5BE3                  ; 5EA9   0004 0158 03E3

        MVI     G_015F, R2                      ; 5EAC   0282 015F
        SLL     R2,     1                       ; 5EAE   004A
        SLL     R2,     2                       ; 5EAF   004E
        SLL     R2,     2                       ; 5EB0   004E
        ADDI    #$032D, R2                      ; 5EB1   02FA 032D
        MOVR    R2,     R3                      ; 5EB3   0093
        INCR    R3                              ; 5EB4   000B
        MVI@    R3,     R0                      ; 5EB5   0298
        SDBD                                    ; 5EB6   0001
        CMPI    #$5184, R0                      ; 5EB7   0378 0084 0051
        BEQ     L_5EC5                          ; 5EBA   0204 0009

        SDBD                                    ; 5EBC   0001
        CMPI    #$5F27, R0                      ; 5EBD   0378 0027 005F
        BEQ     L_5EC5                          ; 5EC0   0204 0003

        TSTR    R0                              ; 5EC2   0080
        BNEQ    L_5EE9                          ; 5EC3   020C 0024

L_5EC5:
        SUBI    #$0010, R2                      ; 5EC5   033A 0010
        MOVR    R2,     R3                      ; 5EC7   0093
        INCR    R3                              ; 5EC8   000B
        MOVR    R2,     R1                      ; 5EC9   0091
        ADDI    #$0008, R1                      ; 5ECA   02F9 0008

        JSR     R5,     .EXEC.7AE               ; 5ECC   0004 0114 03AE

        SDBD                                    ; 5ECF   0001
        MVII    #$5054, R1                      ; 5ED0   02B9 0054 0050

        JSR     R5,     X_TIMER_STOP            ; 5ED3   0004 0118 0038

        CLRR    R0                              ; 5ED6   01C0
        MVO     R0,     G_0185                  ; 5ED7   0240 0185
        MVO     R0,     G_0321                  ; 5ED9   0240 0321
        MVO     R0,     G_0331                  ; 5EDB   0240 0331
        MVO     R0,     G_0341                  ; 5EDD   0240 0341
        MVO     R0,     G_0351                  ; 5EDF   0240 0351
        MVO     R6,     G_0187                  ; 5EE1   0246 0187
        SDBD                                    ; 5EE3   0001
        MVII    #$1906, R0                      ; 5EE4   02B8 0006 0019
        MVO     R0,     G_035D                  ; 5EE7   0240 035D
L_5EE9:
        INCR    R3                              ; 5EE9   000B
        MVI@    R3,     R1                      ; 5EEA   0299
        PSHR    R1                              ; 5EEB   0271
        INCR    R3                              ; 5EEC   000B
        MVI@    R3,     R4                      ; 5EED   029C
        SUBI    #$03FF, R4                      ; 5EEE   033C 03FF
        INCR    R3                              ; 5EF0   000B
        CLRR    R1                              ; 5EF1   01C9
        MVO@    R1,     R3                      ; 5EF2   0259
        SDBD                                    ; 5EF3   0001
        MVII    #$5F19, R1                      ; 5EF4   02B9 0019 005F
        PULR    R3                              ; 5EF7   02B3

        JSR     R5,     X_INIT_MOB              ; 5EF8   0004 0114 02B2

        ADDI    #$0002, R2                      ; 5EFB   02FA 0002
        MVO@    R3,     R2                      ; 5EFD   0253
        INCR    R2                              ; 5EFE   000A
        MVO@    R4,     R2                      ; 5EFF   0254
        MVII    #$016B, R5                      ; 5F00   02BD 016B
        MVII    #$016F, R2                      ; 5F02   02BA 016F
        MVII    #$0001, R1                      ; 5F04   02B9 0001
L_5F06:
        CLRR    R0                              ; 5F06   01C0
        MVII    #$0001, R4                      ; 5F07   02BC 0001
L_5F09:
        MVI@    R2,     R3                      ; 5F09   0293
        CMPI    #$0003, R3                      ; 5F0A   037B 0003
        BPL     L_5F0F                          ; 5F0C   0203 0001

        INCR    R0                              ; 5F0E   0008
L_5F0F:
        ADDI    #$0004, R2                      ; 5F0F   02FA 0004
        DECR    R4                              ; 5F11   0014
        BPL     L_5F09                          ; 5F12   0223 000A

        MVO@    R0,     R5                      ; 5F14   0268
        DECR    R1                              ; 5F15   0011
        BPL     L_5F06                          ; 5F16   0223 0011
        PULR    R7                              ; 5F18   02B7

        DECLE   $00C0,  $0032,  $0027,  $005F   ; 5F19   00C0 0032 0027 005F
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F1D   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $00E0,  $0007   ; 5F21   0000 0000 00E0 0007
        DECLE   $0013,  $0000,  $0100,  $0000   ; 5F25   0013 0000 0100 0000
        DECLE   $00C5,  $005D,  $0007,  $0027   ; 5F29   00C5 005D 0007 0027
        DECLE   $0000                           ; 5F2D   0000
L_5F2E:
        PSHR    R5                              ; 5F2E   0275
        MOVR    R1,     R4                      ; 5F2F   008C
        ADDI    #$0006, R1                      ; 5F30   02F9 0006
        MVII    #$0001, R0                      ; 5F32   02B8 0001
        MVO@    R0,     R1                      ; 5F34   0248
        ADDI    #$0002, R4                      ; 5F35   02FC 0002
        MVI@    R4,     R0                      ; 5F37   02A0
        MVI@    R4,     R1                      ; 5F38   02A1

        JSR     R5,     L_5FB9                  ; 5F39   0004 015C 03B9
        BIDECLE $5F67                           ; 5F3C   0067 005F

        DECR    R4                              ; 5F3E   0014
        MVI     G_0319, R0                      ; 5F3F   0280 0319
        MVI@    R4,     R1                      ; 5F41   02A1

        JSR     R5,     L_5FB9                  ; 5F42   0004 015C 03B9
        BIDECLE $5F5F                           ; 5F45   005F 005F

        SUBI    #$0002, R4                      ; 5F47   033C 0002
        MVI@    R4,     R0                      ; 5F49   02A0
        MVI     G_031A, R1                      ; 5F4A   0281 031A

        JSR     R5,     L_5FB9                  ; 5F4C   0004 015C 03B9
        BIDECLE $5F58                           ; 5F4F   0058 005F

        MVI     G_0319, R0                      ; 5F51   0280 0319
        MVI     G_031A, R1                      ; 5F53   0281 031A
        INCR    R4                              ; 5F55   000C
        B       L_5F63                          ; 5F56   0200 000B

        MVI     G_031A, R1                      ; 5F58   0281 031A
        DECR    R4                              ; 5F5A   0014
        MVI@    R4,     R0                      ; 5F5B   02A0
        INCR    R4                              ; 5F5C   000C
        B       L_5F63                          ; 5F5D   0200 0004

        DECR    R4                              ; 5F5F   0014
        MVI@    R4,     R1                      ; 5F60   02A1
        MVI     G_0319, R0                      ; 5F61   0280 0319
L_5F63:
        SUBI    #$0002, R4                      ; 5F63   033C 0002
        MVO@    R0,     R4                      ; 5F65   0260
        MVO@    R1,     R4                      ; 5F66   0261
        MVII    #$0001, R3                      ; 5F67   02BB 0001
L_5F69:
        MOVR    R3,     R1                      ; 5F69   0099
        ADDI    #$0169, R1                      ; 5F6A   02F9 0169
        MVI@    R1,     R0                      ; 5F6C   0288
        CMPI    #$0002, R0                      ; 5F6D   0378 0002
        BNEQ    L_5F9A                          ; 5F6F   020C 0029

        SUBI    #$0004, R1                      ; 5F71   0339 0004
        ADDR    R3,     R1                      ; 5F73   00D9
        MVI@    R1,     R2                      ; 5F74   028A
        INCR    R1                              ; 5F75   0009
        PSHR    R3                              ; 5F76   0273
        MVI@    R1,     R3                      ; 5F77   028B
        MVI     G_031B, R4                      ; 5F78   0284 031B
        ADDI    #$0002, R4                      ; 5F7A   02FC 0002
        MVI@    R4,     R0                      ; 5F7C   02A0
        SWAP    R0,     1                       ; 5F7D   0040
        ANDI    #$00FF, R0                      ; 5F7E   03B8 00FF
        SUBR    R2,     R0                      ; 5F80   0110
        BPL     L_5F84                          ; 5F81   0203 0001

        NEGR    R0                              ; 5F83   0020
L_5F84:
        MVI@    R4,     R2                      ; 5F84   02A2
        SWAP    R2,     1                       ; 5F85   0042
        ANDI    #$00FF, R2                      ; 5F86   03BA 00FF
        SUBR    R3,     R2                      ; 5F88   011A
        BPL     L_5F8C                          ; 5F89   0203 0001

        NEGR    R2                              ; 5F8B   0022
L_5F8C:
        CMPR    R2,     R0                      ; 5F8C   0150
        BPL     L_5F93                          ; 5F8D   0203 0004

        SAR     R0,     1                       ; 5F8F   0068
        ADDR    R0,     R2                      ; 5F90   00C2
        B       L_5F95                          ; 5F91   0200 0002

L_5F93:
        SAR     R2,     1                       ; 5F93   006A
        ADDR    R0,     R2                      ; 5F94   00C2
L_5F95:
        PULR    R3                              ; 5F95   02B3
        CMPI    #$0005, R2                      ; 5F96   037A 0005
        BMI     L_5F9E                          ; 5F98   020B 0004

L_5F9A:
        DECR    R3                              ; 5F9A   0013
        BPL     L_5F69                          ; 5F9B   0223 0033
        PULR    R7                              ; 5F9D   02B7

L_5F9E:
        ADDI    #$0169, R3                      ; 5F9E   02FB 0169
        MVII    #$0003, R2                      ; 5FA0   02BA 0003
        MVO@    R2,     R3                      ; 5FA2   025A
        MVI     G_031B, R1                      ; 5FA3   0281 031B
        SUBI    #$031D, R1                      ; 5FA5   0339 031D
        SLR     R1,     1                       ; 5FA7   0061
        SLR     R1,     2                       ; 5FA8   0065
        ANDI    #$0006, R1                      ; 5FA9   03B9 0006
        MVO     R1,     G_0161                  ; 5FAB   0241 0161
        SLL     R1,     1                       ; 5FAD   0049
        ADDI    #$016D, R1                      ; 5FAE   02F9 016D
        ADDI    #$0002, R1                      ; 5FB0   02F9 0002
        MVII    #$0003, R0                      ; 5FB2   02B8 0003
        MVO@    R0,     R1                      ; 5FB4   0248
        PULR    R5                              ; 5FB5   02B5
        J       L_5EA0                          ; 5FB6   0004 035C 02A0

L_5FB9:
        SDBD                                    ; 5FB9   0001
        MVI@    R5,     R3                      ; 5FBA   02AB
        SWAP    R1,     1                       ; 5FBB   0041
        SUBI    #$0004, R1                      ; 5FBC   0339 0004
        ANDI    #$00F8, R1                      ; 5FBE   03B9 00F8
        MOVR    R1,     R2                      ; 5FC0   008A
        SLL     R1,     2                       ; 5FC1   004D
        ADDR    R2,     R1                      ; 5FC2   00D1
        SWAP    R0,     1                       ; 5FC3   0040
        SLR     R0,     2                       ; 5FC4   0064
        DECR    R0                              ; 5FC5   0010
        SLR     R0,     1                       ; 5FC6   0060
        ANDI    #$001F, R0                      ; 5FC7   03B8 001F
        MOVR    R0,     R2                      ; 5FC9   0082
        SLR     R0,     1                       ; 5FCA   0060
        ADDR    R0,     R1                      ; 5FCB   00C1
        ADD     G_0316, R1                      ; 5FCC   02C1 0316
        SDBD                                    ; 5FCE   0001
        CMPI    #$5BE3, R1                      ; 5FCF   0379 00E3 005B
        BMI     L_5FD6                          ; 5FD2   020B 0002

        SUBI    #$03C0, R1                      ; 5FD4   0339 03C0
L_5FD6:
        MVI@    R1,     R0                      ; 5FD6   0288
        ANDI    #$0001, R2                      ; 5FD7   03BA 0001
        BNEQ    L_5FDE                          ; 5FD9   020C 0003

        SLR     R0,     1                       ; 5FDB   0060
        SLR     R0,     2                       ; 5FDC   0064
        SLR     R0,     2                       ; 5FDD   0064
L_5FDE:
        ANDI    #$001F, R0                      ; 5FDE   03B8 001F
        CMPI    #$000D, R0                      ; 5FE0   0378 000D
        BPL     L_5FFE                          ; 5FE2   0203 001A

        DECR    R2                              ; 5FE4   0012
        BMI     L_5FF0                          ; 5FE5   020B 0009

        INCR    R1                              ; 5FE7   0009
        SDBD                                    ; 5FE8   0001
        CMPI    #$5BE3, R1                      ; 5FE9   0379 00E3 005B
        BMI     L_5FF0                          ; 5FEC   020B 0002

        SUBI    #$03C0, R1                      ; 5FEE   0339 03C0
L_5FF0:
        MVI@    R1,     R0                      ; 5FF0   0288
        TSTR    R2                              ; 5FF1   0092
        BNEQ    L_5FF7                          ; 5FF2   020C 0003

        SLR     R0,     1                       ; 5FF4   0060
        SLR     R0,     2                       ; 5FF5   0064
        SLR     R0,     2                       ; 5FF6   0064
L_5FF7:
        ANDI    #$001F, R0                      ; 5FF7   03B8 001F
        CMPI    #$000D, R0                      ; 5FF9   0378 000D
        BPL     L_5FFE                          ; 5FFB   0203 0001
        MOVR    R3,     R7                      ; 5FFD   009F
L_5FFE:
        MOVR    R5,     R7                      ; 5FFE   00AF

        DECLE   $0000                           ; 5FFF   0000
;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $502A       <entry>
;;  $5042       $502F  
;;  $505A       <entry>
;;  $5061       $5E2F  
;;  $506E       $5078  
;;  $5075       $5072  
;;  $50E5       $50CD  
;;  $50F0       $50C8  
;;  $50F8       $50EE  
;;  $5119       $5175  
;;  $5162       $5162  
;;  $5169       $5169  
;;  $516B       $516B  
;;  $517E       $517E  
;;  $51AF       $51D4  
;;  $51CA       $51C1  
;;  $51D2       $51CE  
;;  $51F8       $51D9   $5208  
;;  $522A       $5278  
;;  $523A       $5251  
;;  $524E       $523F  
;;  $5253       $524C  
;;  $529F       $52B1  
;;  $52A9       $52A2  
;;  $52B5       $52B9   $52E2  
;;  $52C8       $52C3  
;;  $52D1       $52CC  
;;  $554E       <entry>
;;  $5556       $5553  
;;  $5559       $5613  
;;  $5563       $5560  
;;  $559A       $5596  
;;  $559B       $5599  
;;  $559D       $557D   $5582   $5592  
;;  $55AD       $55A2  
;;  $55B9       $55B5  
;;  $55D0       $55C8   $55CC  
;;  $55F0       $55E9  
;;  $560A       $5605  
;;  $5625       $561F  
;;  $5628       $561D  
;;  $5629       $55C1   $5D09  
;;  $562D       $523A   $5247  
;;  $5644       $5640  
;;  $564C       $5647  
;;  $5650       $55AA   $5CAD   $5CFA   $5D78  
;;  $565C       $51B7   $51BB  
;;  $566C       $5660  
;;  $5678       $5676  
;;  $5679       $566E  
;;  $56A5       $566A   $567D   $5681   $568C   $5697   $569F  
;;  $56B1       $524E  
;;  $56BC       $56B9  
;;  $56C6       $56BE  
;;  $56CA       $56C4  
;;  $56DE       $56D0   $56D4   $56D8  
;;  $56E2       $56DC  
;;  $56F7       $56F0  
;;  $56F9       $56E3  
;;  $571C       $5742   $5745   $5749   $574E   $5751  
;;  $5724       $5720  
;;  $572B       $5726  
;;  $5732       $572D  
;;  $5753       $572F  
;;  $5768       $5760  
;;  $5772       $5766  
;;  $577C       $575C  
;;  $5782       $5758  
;;  $5786       $576A   $5770   $5780  
;;  $578E       $5756  
;;  $579C       $577C   $5782   $578E  
;;  $57C4       $57B7  
;;  $57E0       $57D0   $57D9  
;;  $57ED       $57E7  
;;  $5803       $5808  
;;  $5807       $5764   $57F0   $5801   $5815  
;;  $5808       $57FF  
;;  $580B       $57F3  
;;  $5817       $5820  
;;  $5820       $5813  
;;  $5825       $5825  
;;  $58C8       $58C8  
;;  $5929       $5929  
;;  $5986       $5986  
;;  $5AF6       $5AF6  
;;  $5B08       $5B08  
;;  $5BE3       $5EA9  
;;  $5C05       $5C0C  
;;  $5C2B       $5BFB   $5C41  
;;  $5C3C       $5BE6  
;;  $5C66       $5C63  
;;  $5C6D       $5C6A  
;;  $5D01       $5D2D   $5D3A  
;;  $5D19       $5D0F  
;;  $5D28       $5C78   $5C7F   $5C89   $5CE5   $5D13   $5D1B   $5D23   $5D51  
;;  $5D28       $5DBF  
;;  $5D53       $5D43  
;;  $5D87       $5D84  
;;  $5E27       $5DE0   $5E24  
;;  $5E32       $5CFE  
;;  $5E43       $5D53  
;;  $5E53       $5EA1  
;;  $5E63       $5625  
;;  $5E64       $5E41   $5E51   $5E61  
;;  $5E6A       $5E67  
;;  $5E6E       $5E9E  
;;  $5E7A       $5621  
;;  $5E89       $5E6C  
;;  $5E95       $5E7E  
;;  $5EA0       $5DC1   $5FB6  
;;  $5EC5       $5EBA   $5EC0  
;;  $5EE9       $5EC3  
;;  $5F06       $5F16  
;;  $5F09       $5F12  
;;  $5F0F       $5F0C  
;;  $5F2E       $5E07  
;;  $5F63       $5F56   $5F5D  
;;  $5F69       $5F9B  
;;  $5F84       $5F81  
;;  $5F8C       $5F89  
;;  $5F93       $5F8D  
;;  $5F95       $5F91  
;;  $5F9A       $5F6F  
;;  $5F9E       $5F98  
;;  $5FB9       $5F39   $5F42   $5F4C  
;;  $5FD6       $5FD2  
;;  $5FDE       $5FD9  
;;  $5FF0       $5FE5   $5FEC  
;;  $5FF7       $5FF2  
;;  $5FFE       $5FE2   $5FFB  
;; ======================================================================== ;;
