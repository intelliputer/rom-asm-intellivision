
        ORG     $5000
.HEADER:
        BIDECLE $5E5B           ; 5000  Ptr: MOB graphic images
        BIDECLE $5024           ; 5002  Ptr: EXEC timer table
        BIDECLE $5052           ; 5004  Ptr: Start of game
        BIDECLE $51B4           ; 5006  Ptr: Backgnd gfx list
        BIDECLE $51F4           ; 5008  Ptr: GRAM init sequence
        BIDECLE $501C           ; 500A  Ptr: Date/Title
        DECLE   $0000           ; 500C  Key-click / flags
        DECLE   $0000           ; 500D  Border extension
        DECLE   $0000           ; 500E  Color Stack / FGBG
        DECLE   $0004,  $000F   ; 500F  Color Stack init (0, 1)
        DECLE   $0008,  $0007   ; 5011  Color Stack init (2, 3)
        DECLE   $0000           ; 5013  Border color init

        DECLE   $0180,  $0190,  $01A0,  $01B0   ; 5014   0180 0190 01A0 01B0
        DECLE   $01C0,  $01D0,  $01E0,  $01F0   ; 5018   01C0 01D0 01E0 01F0
.TITLE:
        DECLE   $004F                           ; 501C  Cartridge year
        STRING  "HOCKEY"                        ; 501D  Title string
        DECLE   $0000                           ; 5023  

.TIMER:
        DECLE   $0071,  $001A,  $0001,  $0080; 5024  Timer dispatch/interval
        DECLE   $009A,  $005C,  $000A,  $0000; 5028  Timer dispatch/interval
        DECLE   $0036,  $0050,  $0001,  $0000; 502C  Timer dispatch/interval
        DECLE   $004B,  $005D,  $0004,  $0000; 5030  Timer dispatch/interval
        BIDECLE $0000           ; 5034  End of timer table

L_5036:
        PSHR    R5                              ; 5036   0275

        JSR     R5,     L_5822                  ; 5037   0004 0158 0022
        JSR     R5,     L_54B8                  ; 503A   0004 0154 00B8
        JSR     R5,     L_5430                  ; 503D   0004 0154 0030
        JSR     R5,     L_5359                  ; 5040   0004 0150 0359

        J       L_5961                          ; 5043   0004 0358 0161

L_5046:
        MOVR    R7,     R1                      ; 5046   00B9
        SUBI    #$001F, R1                      ; 5047   0339 001F
        J       X_TIMER_START                   ; 5049   0004 0318 0044

L_504C:
        MOVR    R7,     R1                      ; 504C   00B9
        SUBI    #$0025, R1                      ; 504D   0339 0025
        J       X_TIMER_STOP                    ; 504F   0004 0318 0038

.START:
        PSHR    R5                              ; 5052   0275

        JSR     R5,     L_5275                  ; 5053   0004 0150 0275
        JSR     R5,     L_5CC8                  ; 5056   0004 015C 00C8
        JSR     R5,     L_5071                  ; 5059   0004 0150 0071
        JSR     R5,     L_504C                  ; 505C   0004 0150 004C

        MVII    #$0116, R1                      ; 505F   02B9 0116
        MVII    #$0004, R0                      ; 5061   02B8 0004
        PULR    R5                              ; 5063   02B5

        JSR     R4,     .EXEC.730               ; 5064   0004 0014 0330

        MOVR    R4,     R7                      ; 5067   00A7

        DECLE   $0000                           ; 5068   0000

        SLLC    R1,     1                       ; 5069   0059
        RSWD    R2                              ; 506A   003A
        PSHR    R5                              ; 506B   0275

        JSR     R5,     .EXEC.A61               ; 506C   0004 0118 0261

        INCR    R7                              ; 506F   000F
        INCR    R7                              ; 5070   000F

L_5071:
        PSHR    R5                              ; 5071   0275
L_5072:
        MVII    #$000A, R0                      ; 5072   02B8 000A

        JSR     R5,     X_PLAY_CHEER1           ; 5074   0004 011C 02D5

        MVI     G_01A4, R4                      ; 5077   0284 01A4
        INCR    R4                              ; 5079   000C
        CMPI    #$0004, R4                      ; 507A   037C 0004
L_507C:
        BGE     L_507C                          ; 507C   022D 0001

        MVO     R4,     G_01A4                  ; 507E   0244 01A4
        ADDR    R4,     R4                      ; 5080   00E4
        ADDI    #$0241, R4                      ; 5081   02FC 0241
        SDBD                                    ; 5083   0001
        MVII    #$0682, R0                      ; 5084   02B8 0082 0006
        MVO@    R0,     R4                      ; 5087   0260
        MVII    #$0014, R0                      ; 5088   02B8 0014
        MVO     R0,     G_01A8                  ; 508A   0240 01A8

        JSR     R5,     L_5CB2                  ; 508C   0004 015C 00B2
        JSR     R5,     L_512C                  ; 508F   0004 0150 012C

        PULR    R7                              ; 5092   02B7

        PSHR    R5                              ; 5093   0275
        CLRR    R3                              ; 5094   01DB
        MVO     R3,     G_034E                  ; 5095   0243 034E
        MVO     R3,     G_0356                  ; 5097   0243 0356

        JSR     R5,     L_5716                  ; 5099   0004 0154 0316

        INCR    R3                              ; 509C   000B

        JSR     R5,     L_5716                  ; 509D   0004 0154 0316
        JSR     R4,     L_50B3                  ; 50A0   0004 0050 00B3
        DECLE   $00D2,  $0050,  $00D2,  $0050   ; 50A3   00D2 0050 00D2 0050
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50A7   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 50AB   0000 0000

        ADDR    R7,     R0                      ; 50AD   00F8
        RLC     R0,     2                       ; 50AE   0054
        ADDR    R7,     R3                      ; 50AF   00FB
        RLC     R0,     2                       ; 50B0   0054
        ADDR    R7,     R3                      ; 50B1   00FB
        RLC     R0,     2                       ; 50B2   0054
L_50B3:
        MVO     R4,     G_035D                  ; 50B3   0244 035D
        PULR    R7                              ; 50B5   02B7

        DECLE   $0040,  $0018,  $006B,  $005E   ; 50B6   0040 0018 006B 005E
        DECLE   $0000,  $0038,  $0000,  $003A   ; 50BA   0000 0038 0000 003A
        DECLE   $0000,  $0000,  $0000,  $0000   ; 50BE   0000 0000 0000 0000
        DECLE   $0001,  $0000,  $0088,  $0058   ; 50C2   0001 0000 0088 0058
        DECLE   $0090,  $005E,  $0000,  $0054   ; 50C6   0090 005E 0000 0054
        DECLE   $0000,  $0049,  $0000,  $0000   ; 50CA   0000 0049 0000 0000
        DECLE   $0000,  $0000,  $0001,  $0000   ; 50CE   0000 0000 0001 0000

        PSHR    R5                              ; 50D2   0275
        SDBD                                    ; 50D3   0001
        MVII    #$1906, R0                      ; 50D4   02B8 0006 0019
        MVO     R0,     G_035D                  ; 50D7   0240 035D
        MVII    #$001E, R0                      ; 50D9   02B8 001E

        JSR     R5,     X_RAND2                 ; 50DB   0004 0114 029E

        ADDI    #$000A, R0                      ; 50DE   02F8 000A

        JSR     R5,     .EXEC.A62               ; 50E0   0004 0118 0262
        JSR     R5,     L_518D                  ; 50E3   0004 0150 018D

        CLRR    R3                              ; 50E6   01DB

        JSR     R5,     L_5724                  ; 50E7   0004 0154 0324

        MVII    #$0355, R2                      ; 50EA   02BA 0355
        MOVR    R7,     R1                      ; 50EC   00B9
        SUBI    #$0029, R1                      ; 50ED   0339 0029

        JSR     R5,     X_INIT_MOB              ; 50EF   0004 0114 02B2

        MVII    #$0007, R0                      ; 50F2   02B8 0007
        MVO     R0,     G_01A3                  ; 50F4   0240 01A3

        JSR     R5,     .EXEC.41C               ; 50F6   0004 0114 001C

        MVII    #$015D, R4                      ; 50F9   02BC 015D
        MVII    #$0046, R0                      ; 50FB   02B8 0046

        JSR     R5,     X_FILL_ZERO             ; 50FD   0004 0114 0338
        JSR     R5,     L_5046                  ; 5100   0004 0150 0046

        MOVR    R7,     R4                      ; 5103   00BC
        SUBI    #$005B, R4                      ; 5104   033C 005B
        B       L_50B3                          ; 5106   0220 0054

        MOVR    R2,     R3                      ; 5108   0093
        RLC     R0,     1                       ; 5109   0050
        CMPR    R1,     R1                      ; 510A   0149
        SLL     R2,     2                       ; 510B   004E
        SLL     R1,     1                       ; 510C   0049
        SLLC    R3,     1                       ; 510D   005B
        CMPR    R0,     R4                      ; 510E   0144
        SWAP    R0,     1                       ; 510F   0040
        SWAP    R0,     2                       ; 5110   0044
        SAR     R0,     1                       ; 5111   0068
        RLC     R2,     2                       ; 5112   0056
        SAR     R2,     1                       ; 5113   006A
        CMPR    R2,     R6                      ; 5114   0156
        RSWD    R6                              ; 5115   003E
        CMPR    R1,     R1                      ; 5116   0149
        ADCR    R0                              ; 5117   0028
        SLL     R1,     1                       ; 5118   0049
        TSTR    R0                              ; 5119   0080
        CMPR    R5,     R3                      ; 511A   016B
        RLC     R0,     1                       ; 511B   0050
        RSWD    R2                              ; 511C   003A
        RSWD    R0                              ; 511D   0038
        RSWD    R2                              ; 511E   003A
        RRC     R0,     1                       ; 511F   0070
        RSWD    R2                              ; 5120   003A
        RSWD    R0                              ; 5121   0038
        RSWD    R2                              ; 5122   003A
        RRC     R0,     1                       ; 5123   0070
        RSWD    R2                              ; 5124   003A
        RSWD    R0                              ; 5125   0038
        RSWD    R2                              ; 5126   003A
        RRC     R0,     1                       ; 5127   0070
        RSWD    R2                              ; 5128   003A
        RSWD    R0                              ; 5129   0038
        RSWD    R2                              ; 512A   003A
        RRC     R0,     1                       ; 512B   0070
L_512C:
        PSHR    R5                              ; 512C   0275
        MVII    #$031D, R2                      ; 512D   02BA 031D
        MOVR    R7,     R1                      ; 512F   00B9
        SUBI    #$007A, R1                      ; 5130   0339 007A
        MVII    #$0004, R4                      ; 5132   02BC 0004
        MVII    #$0070, R3                      ; 5134   02BB 0070
        SWAP    R3,     1                       ; 5136   0043

L_5137:
        JSR     R5,     X_INIT_MOB              ; 5137   0004 0114 02B2

        MVI@    R2,     R0                      ; 513A   0290
        SLL     R0,     1                       ; 513B   0048
        SETC                                    ; 513C   0007
        RRC     R0,     1                       ; 513D   0070
        MVO@    R0,     R2                      ; 513E   0250
        ADDI    #$0008, R2                      ; 513F   02FA 0008

        JSR     R5,     X_INIT_MOB              ; 5141   0004 0114 02B2

        ADDI    #$0002, R2                      ; 5144   02FA 0002
        MVO@    R3,     R2                      ; 5146   0253
        ADDI    #$0006, R2                      ; 5147   02FA 0006
        DECR    R4                              ; 5149   0014
        BNEQ    L_5137                          ; 514A   022C 0014
        INCR    R7                              ; 514C   000F

L_514D:
        PSHR    R5                              ; 514D   0275
L_514E:
        MOVR    R7,     R4                      ; 514E   00BC
        SUBI    #$0047, R4                      ; 514F   033C 0047

        JSR     R5,     L_5DFE                  ; 5151   0004 015C 01FE
        JSR     R5,     L_515B                  ; 5154   0004 0150 015B
        JSR     R5,     L_504C                  ; 5157   0004 0150 004C

        PULR    R7                              ; 515A   02B7

L_515B:
        PSHR    R5                              ; 515B   0275
        MVII    #$0174, R3                      ; 515C   02BB 0174
        MVI     G_01AF, R0                      ; 515E   0280 01AF
        MVII    #$01B7, R4                      ; 5160   02BC 01B7

        JSR     R5,     L_5166                  ; 5162   0004 0150 0166

        PULR    R5                              ; 5165   02B5
L_5166:
        MVI@    R4,     R2                      ; 5166   02A2
        TSTR    R2                              ; 5167   0092
        BEQ     L_516F                          ; 5168   0204 0005

        CLRR    R2                              ; 516A   01D2
        MVO@    R2,     R3                      ; 516B   025A
        DECR    R0                              ; 516C   0010
        MVO     R0,     G_01AF                  ; 516D   0240 01AF
L_516F:
        ADDI    #$0008, R3                      ; 516F   02FB 0008
        MOVR    R5,     R7                      ; 5171   00AF

L_5172:
        PSHR    R5                              ; 5172   0275
        CLRR    R0                              ; 5173   01C0
        MVO     R0,     G_01B7                  ; 5174   0240 01B7
        MVO     R0,     G_01B8                  ; 5176   0240 01B8

        JSR     R5,     L_5CF1                  ; 5178   0004 015C 00F1
        JSR     R5,     L_5747                  ; 517B   0004 0154 0347

        SDBD                                    ; 517E   0001
        MVII    #$5E6B, R5                      ; 517F   02BD 006B 005E
        MVO     R5,     G_034E                  ; 5182   0245 034E
        MVO     R5,     G_0356                  ; 5184   0245 0356
        MOVR    R7,     R4                      ; 5186   00BC
        SUBI    #$006D, R4                      ; 5187   033C 006D

        JSR     R5,     L_5DFE                  ; 5189   0004 015C 01FE

        PULR    R7                              ; 518C   02B7

L_518D:
        MVII    #$0008, R3                      ; 518D   02BB 0008
L_518F:
        PSHR    R5                              ; 518F   0275

        JSR     R5,     L_51A2                  ; 5190   0004 0150 01A2

        MVI     G_031D, R0                      ; 5193   0280 031D
        XORI    #$0010, R0                      ; 5195   03F8 0010
        MVO     R0,     G_031D                  ; 5197   0240 031D
        MVI     G_0325, R0                      ; 5199   0280 0325
        XORI    #$0010, R0                      ; 519B   03F8 0010
        MVO     R0,     G_0325                  ; 519D   0240 0325
        PULR    R7                              ; 519F   02B7

L_51A0:
        MVII    #$0008, R3                      ; 51A0   02BB 0008
L_51A2:
        MVII    #$031D, R1                      ; 51A2   02B9 031D
        MVII    #$0003, R2                      ; 51A4   02BA 0003
L_51A6:
        MVI@    R1,     R0                      ; 51A6   0288
        ANDI    #$0017, R0                      ; 51A7   03B8 0017
        XOR@    R1,     R0                      ; 51A9   03C8
        XORR    R2,     R0                      ; 51AA   01D0
        MVO@    R0,     R1                      ; 51AB   0248
        XORI    #$0006, R2                      ; 51AC   03FA 0006
        ADDI    #$0008, R1                      ; 51AE   02F9 0008
        DECR    R3                              ; 51B0   0013
        BNEQ    L_51A6                          ; 51B1   022C 000C
        MOVR    R5,     R7                      ; 51B3   00AF

.GFX_LIST_51B4:
        DECLE   $0001,  $0001,  $0002,  $0004   ; 51B4  CART PIC #00
        DECLE   $0004,  $0008,  $0010,  $0090   ; 51B8  
        DECLE   $0040,  $00A0,  $0040,  $00A0   ; 51BC  CART PIC #01
        DECLE   $0020,  $0040,  $0040,  $0080   ; 51C0  
        DECLE   $0001,  $0000,  $0001,  $0002   ; 51C4  CART PIC #02
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51C8  
        DECLE   $0001,  $0002,  $0005,  $000A   ; 51CC  CART PIC #03
        DECLE   $0010,  $0020,  $0060,  $00A0   ; 51D0  
        DECLE   $0020,  $00A0,  $0040,  $0080   ; 51D4  CART PIC #04
        DECLE   $0000,  $0000,  $0000,  $0000   ; 51D8  
        DECLE   $0001,  $0001,  $0001,  $000F   ; 51DC  CART PIC #05
        DECLE   $0071,  $0081,  $0001,  $0001   ; 51E0  
        DECLE   $0001,  $0081,  $0071,  $000F   ; 51E4  CART PIC #06
        DECLE   $0001,  $0001,  $0001,  $0001   ; 51E8  
        DECLE   $0010,  $0038,  $0044,  $0038   ; 51EC  CART PIC #07
        DECLE   $0014,  $002A,  $0068,  $0018   ; 51F0  
.GRAM_INIT_51F4:
        DECLE   $002B           ; 51F4  # of GRAM cards to init
        DECLE   $0001,  $0300   ; 51F5  #00-06:  CART #00-06 ----
        DECLE   $02FF,  $01E6   ; 51F7  #07   :  Algo #1
        DECLE   $02FF,  $01EE   ; 51F9  #08   :  Algo #1
        DECLE   $00E9,  $0030   ; 51FB  #09-09:  GROM #74-74 --I-
        DECLE   $0213,  $033D   ; 51FD  #0A   :  Algo #2
        DECLE   $0167,  $0102   ; 51FF  #0B   :  Algo #1
        DECLE   $0209,  $023A   ; 5201  #0C   :  Algo #1
        DECLE   $0003,  $0070   ; 5203  #0D-0D:  GROM #01-01 ----
        DECLE   $0051,  $03DE   ; 5205  #0E   :  Algo #1
        DECLE   $0021,  $02D6   ; 5207  #0F   :  Algo #1
        DECLE   $0151,  $0002   ; 5209  #10   :  Algo #1
        DECLE   $0029,  $02BA   ; 520B  #11   :  Algo #1
        DECLE   $0029,  $02AA   ; 520D  #12   :  Algo #1
        DECLE   $0029,  $02B2   ; 520F  #13   :  Algo #1
        DECLE   $0201,  $03C0   ; 5211  #14-1B:  GRAM #00-07 X---
        DECLE   $0211,  $03C0   ; 5213  #1C-23:  GRAM #08-0F X---
        DECLE   $0221,  $01C0   ; 5215  #24-27:  GRAM #10-13 X---
        DECLE   $000E           ; 5217  #28   :  CART #07    ----
        DECLE   $020E           ; 5218  #29   :  CART #07    X---
        DECLE   $003F,  $0030   ; 5219  #2A-2A:  GROM #5F-5F ----

        DECLE   $0000,  $02A0,  $0000,  $0260   ; 521B   0000 02A0 0000 0260
        DECLE   $000D,  $0066,  $0000,  $02A0   ; 521F   000D 0066 0000 02A0
        DECLE   $0000,  $02A0,  $0200,  $02B0   ; 5223   0000 02A0 0200 02B0
        DECLE   $0000,  $02A0,  $0000,  $0060   ; 5227   0000 02A0 0000 0060
        DECLE   $0184,  $0040,  $0183,  $0048   ; 522B   0184 0040 0183 0048
        DECLE   $0195,  $00E0,  $0000,  $0060   ; 522F   0195 00E0 0000 0060
        DECLE   $0195,  $00E0,  $0183,  $0058   ; 5233   0195 00E0 0183 0058
        DECLE   $0395,  $0060,  $0384,  $0058   ; 5237   0395 0060 0384 0058
        DECLE   $0080,  $0042,  $0000,  $00A0   ; 523B   0080 0042 0000 00A0
        DECLE   $0088,  $0041,  $0000,  $00A0   ; 523F   0088 0041 0000 00A0
        DECLE   $0086,  $004A,  $0395,  $0070   ; 5243   0086 004A 0395 0070
        DECLE   $0384,  $0058,  $0081,  $004A   ; 5247   0384 0058 0081 004A
        DECLE   $0082,  $0042,  $0000,  $00A0   ; 524B   0082 0042 0000 00A0
        DECLE   $0088,  $0049,  $0000           ; 524F   0088 0049 0000

        SLR     R0,     1                       ; 5252   0060
        MOVR    R0,     R7                      ; 5253   0087

        DECLE   $0042,  $0082,  $004A,  $0186   ; 5254   0042 0082 004A 0186
        DECLE   $0040,  $0081,  $0042,  $0080   ; 5258   0040 0081 0042 0080
        DECLE   $004A,  $0000,  $00E0,  $0089   ; 525C   004A 0000 00E0 0089
        DECLE   $0041,  $0000                   ; 5260   0041 0000

        SLR     R0,     1                       ; 5262   0060
        MOVR    R0,     R7                      ; 5263   0087

        DECLE   $004A,  $0083,  $0042,  $0185   ; 5264   004A 0083 0042 0185
        DECLE   $0040,  $0085,  $004A,  $0000   ; 5268   0040 0085 004A 0000
        DECLE   $0120,  $0089,  $0049,  $0000   ; 526C   0120 0089 0049 0000

        MOVR    R4,     R0                      ; 5270   00A0
        MOVR    R0,     R6                      ; 5271   0086
        SLL     R2,     1                       ; 5272   004A
        ANDR    R2,     R5                      ; 5273   0195
        MVI@    R4,     R0                      ; 5274   02A0
L_5275:
        PSHR    R5                              ; 5275   0275
        MVII    #$0200, R4                      ; 5276   02BC 0200
        MOVR    R7,     R3                      ; 5278   00BB
        SUBI    #$005E, R3                      ; 5279   033B 005E
L_527B:
        MVII    #$000A, R2                      ; 527B   02BA 000A

L_527D:
        JSR     R5,     L_52D1                  ; 527D   0004 0150 02D1
        JSR     R5,     L_52C4                  ; 5280   0004 0150 02C4

        TSTR    R2                              ; 5283   0092
        BNEQ    L_527D                          ; 5284   022C 0008

        PSHR    R3                              ; 5286   0273
        ADDI    #$0002, R3                      ; 5287   02FB 0002
        MVII    #$000A, R2                      ; 5289   02BA 000A
L_528B:
        SUBI    #$0004, R3                      ; 528B   033B 0004

        JSR     R5,     L_52D1                  ; 528D   0004 0150 02D1

        BNC     L_5296                          ; 5290   0209 0004

        SDBD                                    ; 5292   0001
        XORI    #$2000, R0                      ; 5293   03F8 0000 0020
L_5296:
        BOV     L_529A                          ; 5296   0202 0002

        ADDI    #$00A0, R0                      ; 5298   02F8 00A0

L_529A:
        JSR     R5,     L_52C4                  ; 529A   0004 0150 02C4

        TSTR    R2                              ; 529D   0092
        BNEQ    L_528B                          ; 529E   022C 0014

        PULR    R3                              ; 52A0   02B3
        SDBD                                    ; 52A1   0001
        CMPI    #$5275, R3                      ; 52A2   037B 0075 0052
        BLT     L_527B                          ; 52A5   0225 002B

        MVII    #$0215, R4                      ; 52A7   02BC 0215
        SDBD                                    ; 52A9   0001
        MVII    #$0003, R3                      ; 52AA   02BB 0003 0000

        JSR     R5,     X_PRINT_R5              ; 52AD   0004 0118 007B
        STRING  "HOME"                          ; 52B0   0048 004F 004D 0045
        DECLE   $0000                           ; 52B4   0000

        ADDI    #$000A, R4                      ; 52B5   02FC 000A
        SDBD                                    ; 52B7   0001
        MVII    #$0005, R3                      ; 52B8   02BB 0005 0000

        JSR     R5,     X_PRINT_R5              ; 52BB   0004 0118 007B
        STRING  "VSTR"                          ; 52BE   0056 0053 0054 0052
        DECLE   $0000                           ; 52C2   0000

        PULR    R7                              ; 52C3   02B7

L_52C4:
        PSHR    R5                              ; 52C4   0275
        MVO@    R0,     R4                      ; 52C5   0260
        SDBD                                    ; 52C6   0001
        ANDI    #$DFFF, R0                      ; 52C7   03B8 00FF 00DF
        INCR    R7                              ; 52CA   000F

L_52CB:
        MVO@    R0,     R4                      ; 52CB   0260
L_52CC:
        DECR    R2                              ; 52CC   0012
        DECR    R1                              ; 52CD   0011
        BNEQ    L_52CB                          ; 52CE   022C 0004
        PULR    R7                              ; 52D0   02B7

L_52D1:
        MVI@    R3,     R0                      ; 52D1   0298
        SLL     R0,     2                       ; 52D2   004C
        SLL     R0,     2                       ; 52D3   004C
        PSHR    R0                              ; 52D4   0270
        INCR    R3                              ; 52D5   000B
        MVI@    R3,     R1                      ; 52D6   0299
        INCR    R3                              ; 52D7   000B
        MOVR    R1,     R0                      ; 52D8   0088
        ANDI    #$000F, R0                      ; 52D9   03B8 000F
        XOR@    R6,     R0                      ; 52DB   03F0
        SLR     R1,     2                       ; 52DC   0065
        SLR     R1,     2                       ; 52DD   0065
        SARC    R1,     2                       ; 52DE   007D
        MOVR    R5,     R7                      ; 52DF   00AF

L_52E0:
        PSHR    R5                              ; 52E0   0275
        MVII    #$031D, R1                      ; 52E1   02B9 031D
        MVII    #$015D, R4                      ; 52E3   02BC 015D
L_52E5:
        MVI@    R1,     R0                      ; 52E5   0288
        SWAP    R0,     1                       ; 52E6   0040
        ANDI    #$0040, R0                      ; 52E7   03B8 0040
        BNEQ    L_5318                          ; 52E9   020C 002D

        ADDI    #$0004, R1                      ; 52EB   02F9 0004
        MVI@    R1,     R2                      ; 52ED   028A
        MOVR    R2,     R3                      ; 52EE   0093
        ANDI    #$00FF, R2                      ; 52EF   03BA 00FF
        XORR    R2,     R3                      ; 52F1   01D3
        SWAP    R2,     1                       ; 52F2   0042
        ADDI    #$0003, R1                      ; 52F3   02F9 0003
        MVI@    R1,     R0                      ; 52F5   0288
        ANDI    #$00FF, R0                      ; 52F6   03B8 00FF
        XORR    R0,     R3                      ; 52F8   01C3
        XOR@    R1,     R0                      ; 52F9   03C8
        SWAP    R0,     1                       ; 52FA   0040
        XORR    R0,     R2                      ; 52FB   01C2

        JSR     R5,     L_5321                  ; 52FC   0004 0150 0321

        PSHR    R0                              ; 52FF   0270
        MOVR    R2,     R3                      ; 5300   0093

        JSR     R5,     L_5321                  ; 5301   0004 0150 0321

        PULR    R2                              ; 5304   02B2
        MOVR    R2,     R5                      ; 5305   0095
        ANDI    #$00FF, R5                      ; 5306   03BD 00FF
        XORR    R5,     R2                      ; 5308   01EA
        SWAP    R0,     1                       ; 5309   0040
        MOVR    R0,     R3                      ; 530A   0083
        ANDI    #$00FF, R3                      ; 530B   03BB 00FF
        XORR    R3,     R0                      ; 530D   01D8
        XORR    R5,     R0                      ; 530E   01E8
        XORR    R2,     R3                      ; 530F   01D3
        MVO@    R0,     R1                      ; 5310   0248
        SUBI    #$0003, R1                      ; 5311   0339 0003
        MVO@    R3,     R1                      ; 5313   024B
        SUBI    #$0004, R1                      ; 5314   0339 0004
        SUBI    #$0002, R4                      ; 5316   033C 0002
L_5318:
        ADDI    #$0008, R1                      ; 5318   02F9 0008
        ADDI    #$0008, R4                      ; 531A   02FC 0008
        CMPI    #$035D, R1                      ; 531C   0379 035D
        BLT     L_52E5                          ; 531E   0225 003A
        PULR    R7                              ; 5320   02B7

L_5321:
        MVI@    R4,     R0                      ; 5321   02A0
        SWAP    R0,     1                       ; 5322   0040
        SAR     R0,     2                       ; 5323   006C
        SAR     R0,     1                       ; 5324   0068
        ADDR    R3,     R0                      ; 5325   00D8
        MOVR    R0,     R3                      ; 5326   0083
        BEQ     L_532F                          ; 5327   0204 0006

        SAR     R3,     2                       ; 5329   006F
        SAR     R3,     2                       ; 532A   006F
        BMI     L_532E                          ; 532B   020B 0001

        INCR    R3                              ; 532D   000B
L_532E:
        SUBR    R3,     R0                      ; 532E   0118
L_532F:
        MOVR    R5,     R7                      ; 532F   00AF

L_5330:
        PSHR    R0                              ; 5330   0270
        MVI@    R5,     R0                      ; 5331   02A8
L_5332:
        PSHR    R5                              ; 5332   0275

        JSR     R5,     .EXEC.629               ; 5333   0004 0114 0229

        B       L_533C                          ; 5336   0200 0004

L_5338:
        PSHR    R5                              ; 5338   0275

        JSR     R5,     X_PACK_BYTES            ; 5339   0004 0114 034F

L_533C:
        PULR    R5                              ; 533C   02B5
        MOVR    R0,     R1                      ; 533D   0081
        PULR    R0                              ; 533E   02B0
L_533F:
        PSHR    R5                              ; 533F   0275
        SLL     R0,     2                       ; 5340   004C
        SLL     R0,     1                       ; 5341   0048
        MOVR    R0,     R5                      ; 5342   0085
        ADDI    #$015D, R5                      ; 5343   02FD 015D
        SLR     R0,     2                       ; 5345   0064
        SLR     R0,     1                       ; 5346   0060
        SWAP    R1,     1                       ; 5347   0041
        NOP                                     ; 5348   0034
        MVO@    R1,     R5                      ; 5349   0269
        SAR     R1,     1                       ; 534A   0069
        SWAP    R1,     1                       ; 534B   0041
        MVO@    R1,     R5                      ; 534C   0269
        PULR    R7                              ; 534D   02B7

L_534E:
        MVI     .PSG0.rgt_hand,R4               ; 534E   0284 01FE
        COMR    R4                              ; 5350   001C
        MVO     R4,     G_0124                  ; 5351   0244 0124
        MVI     .PSG0.lft_hand,R4               ; 5353   0284 01FF
        COMR    R4                              ; 5355   001C
        MVO     R4,     G_0123                  ; 5356   0244 0123
        MOVR    R5,     R7                      ; 5358   00AF

L_5359:
        PSHR    R5                              ; 5359   0275
        MVII    #$031D, R1                      ; 535A   02B9 031D
        MVII    #$015D, R4                      ; 535C   02BC 015D
L_535E:
        MVI@    R1,     R0                      ; 535E   0288
        MVII    #$0200, R5                      ; 535F   02BD 0200
        COMR    R5                              ; 5361   001D
        ANDR    R0,     R5                      ; 5362   0185
        MOVR    R1,     R2                      ; 5363   008A
        ADDI    #$0004, R2                      ; 5364   02FA 0004
        SWAP    R0,     1                       ; 5366   0040
        ANDI    #$0040, R0                      ; 5367   03B8 0040
        BNEQ    L_5373                          ; 5369   020C 0008

        XOR@    R2,     R0                      ; 536B   03D0
        BEQ     L_5373                          ; 536C   0204 0005
        BMI     L_5372                          ; 536E   020B 0002

        XORI    #$0200, R5                      ; 5370   03FD 0200
L_5372:
        MVO@    R5,     R1                      ; 5372   024D
L_5373:
        MOVR    R5,     R0                      ; 5373   00A8
        ANDI    #$0008, R0                      ; 5374   03B8 0008
        BNEQ    L_5390                          ; 5376   020C 0018

        INCR    R2                              ; 5378   000A
        PSHR    R4                              ; 5379   0274
        PSHR    R1                              ; 537A   0271
        MVI@    R4,     R0                      ; 537B   02A0
        MVI@    R4,     R1                      ; 537C   02A1

        JSR     R5,     L_5A41                  ; 537D   0004 0158 0241

        PULR    R1                              ; 5380   02B1
L_5381:
        MOVR    R4,     R3                      ; 5381   00A3
        MVII    #$003F, R4                      ; 5382   02BC 003F
        CMPR    R4,     R3                      ; 5384   0163
        BGT     L_5381                          ; 5385   022E 0005

        SLL     R3,     2                       ; 5387   004F
        SLL     R3,     2                       ; 5388   004F
        PULR    R4                              ; 5389   02B4
        MVII    #$03F0, R5                      ; 538A   02BD 03F0
        COMR    R5                              ; 538C   001D
        AND@    R2,     R5                      ; 538D   0395
        XORR    R3,     R5                      ; 538E   01DD
        MVO@    R5,     R2                      ; 538F   0255
L_5390:
        ADDI    #$0008, R1                      ; 5390   02F9 0008
        ADDI    #$0008, R4                      ; 5392   02FC 0008
        CMPI    #$035D, R1                      ; 5394   0379 035D
        BMI     L_535E                          ; 5396   022B 0039
        PULR    R7                              ; 5398   02B7

L_5399:
        PSHR    R0                              ; 5399   0270
        PSHR    R1                              ; 539A   0271
        MVI@    R5,     R0                      ; 539B   02A8
        J       .EXEC.6E9                       ; 539C   0004 0314 02E9

L_539F:
        PSHR    R0                              ; 539F   0270
        PSHR    R1                              ; 53A0   0271
        MVI@    R5,     R0                      ; 53A1   02A8
        J       .EXEC.6DE                       ; 53A2   0004 0314 02DE

L_53A5:
        MOVR    R5,     R4                      ; 53A5   00AC
        MVII    #$003C, R0                      ; 53A6   02B8 003C

        JSR     R5,     X_RAND2                 ; 53A8   0004 0114 029E

        CMP@    R4,     R0                      ; 53AB   0360
        MOVR    R4,     R7                      ; 53AC   00A7

L_53AD:
        PSHR    R5                              ; 53AD   0275
        MVII    #$0008, R0                      ; 53AE   02B8 0008
L_53B0:
        MVI@    R1,     R4                      ; 53B0   028C
        MVI@    R2,     R5                      ; 53B1   0295
        MVO@    R5,     R1                      ; 53B2   024D
        MVO@    R4,     R2                      ; 53B3   0254
        INCR    R1                              ; 53B4   0009
        INCR    R2                              ; 53B5   000A
        DECR    R0                              ; 53B6   0010
        BNEQ    L_53B0                          ; 53B7   022C 0008
        PULR    R7                              ; 53B9   02B7

        PSHR    R5                              ; 53BA   0275
        MVI     G_01A3, R5                      ; 53BB   0285 01A3
        CMPI    #$0007, R5                      ; 53BD   037D 0007
        BNEQ    L_549F                          ; 53BF   020C 00DE

        MVII    #$0004, R0                      ; 53C1   02B8 0004

        JSR     R5,     X_SET_BIT               ; 53C3   0004 0114 02DB

        ANDR    R4,     R2                      ; 53C6   01A2
        MVI     G_0359, R0                      ; 53C7   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 53C9   0004 0114 0357

        CMPI    #$0002, R3                      ; 53CC   037B 0002
        BPL     L_53D2                          ; 53CE   0203 0002

        NEGR    R0                              ; 53D0   0020
        INCR    R7                              ; 53D1   000F

L_53D2:
        NEGR    R1                              ; 53D2   0021
L_53D3:
        SAR     R0,     1                       ; 53D3   0068
        SAR     R1,     1                       ; 53D4   0069

        JSR     R5,     X_PACK_BYTES            ; 53D5   0004 0114 034F

        MVO     R0,     G_0359                  ; 53D8   0240 0359

        JSR     R5,     L_5FD4                  ; 53DA   0004 015C 03D4

        PULR    R7                              ; 53DD   02B7

        PSHR    R5                              ; 53DE   0275
        MVI     G_019D, R5                      ; 53DF   0285 019D
        ANDI    #$0004, R5                      ; 53E1   03BD 0004
        BNEQ    L_549F                          ; 53E3   020C 00BA

        MOVR    R0,     R2                      ; 53E5   0082
        SLL     R2,     2                       ; 53E6   004E
        SLL     R2,     1                       ; 53E7   004A
        ADDI    #$0161, R2                      ; 53E8   02FA 0161
        MVI@    R2,     R2                      ; 53EA   0292
        TSTR    R2                              ; 53EB   0092
        BNEQ    L_549F                          ; 53EC   020C 00B1

        MVI     G_01A3, R2                      ; 53EE   0282 01A3
        CMPI    #$0006, R2                      ; 53F0   037A 0006
        BGE     L_53F8                          ; 53F2   020D 0004

        XORR    R0,     R2                      ; 53F4   01C2
        SARC    R2,     1                       ; 53F5   007A
        BNC     L_549F                          ; 53F6   0209 00A7

L_53F8:
        PSHR    R0                              ; 53F8   0270
        SDBD                                    ; 53F9   0001
        MVII    #$0803, R4                      ; 53FA   02BC 0003 0008
        SLR     R0,     1                       ; 53FD   0060
        BEQ     L_540A                          ; 53FE   0204 000A

        MVI     G_01A3, R0                      ; 5400   0280 01A3
        CMPI    #$0007, R0                      ; 5402   0378 0007
        BNEQ    L_540A                          ; 5404   020C 0004

        SDBD                                    ; 5406   0001
        MVII    #$0805, R4                      ; 5407   02BC 0005 0008

L_540A:
        JSR     R5,     .EXEC.70F               ; 540A   0004 0114 030F

        PULR    R0                              ; 540D   02B0
        BNC     L_549F                          ; 540E   0209 008F

        MVI     G_01A3, R2                      ; 5410   0282 01A3
        CMPI    #$0007, R2                      ; 5412   037A 0007
        BEQ     L_542B                          ; 5414   0204 0015

        MVI@    R1,     R3                      ; 5416   028B
        ADDI    #$0002, R1                      ; 5417   02F9 0002
        MVII    #$0100, R2                      ; 5419   02BA 0100
        ANDI    #$0200, R3                      ; 541B   03BB 0200
        BEQ     L_5420                          ; 541D   0204 0001

        NEGR    R2                              ; 541F   0022
L_5420:
        ADD@    R1,     R2                      ; 5420   02CA
        CMP     G_0357, R2                      ; 5421   0342 0357
        TSTR    R3                              ; 5423   009B
        BC      L_5429                          ; 5424   0201 0003
        BNEQ    L_542B                          ; 5426   020C 0003
        PULR    R7                              ; 5428   02B7
L_5429:
        BNEQ    L_549F                          ; 5429   020C 0074

L_542B:
        JSR     R5,     X_CLR_BIT               ; 542B   0004 0114 02E6

        ANDR    R4,     R0                      ; 542E   01A0
        PULR    R7                              ; 542F   02B7

L_5430:
        PSHR    R5                              ; 5430   0275
        MVI     G_01A3, R3                      ; 5431   0283 01A3
        MVII    #$0007, R2                      ; 5433   02BA 0007
        MVI     G_019D, R5                      ; 5435   0285 019D
        ANDI    #$0004, R5                      ; 5437   03BD 0004
        BNEQ    L_5478                          ; 5439   020C 003D

        MVI     G_01A2, R5                      ; 543B   0285 01A2
        ANDI    #$0008, R5                      ; 543D   03BD 0008
        BNEQ    L_5476                          ; 543F   020C 0035

        MVI     G_019E, R1                      ; 5441   0281 019E
        TSTR    R1                              ; 5443   0089
        BEQ     L_544B                          ; 5444   0204 0005

        DECR    R1                              ; 5446   0011
        MVO     R1,     G_019E                  ; 5447   0241 019E
        MVI     G_019F, R1                      ; 5449   0281 019F
L_544B:
        COMR    R1                              ; 544B   0019
        AND     G_01A0, R1                      ; 544C   0381 01A0
        BEQ     L_5472                          ; 544E   0204 0022

        MOVR    R1,     R2                      ; 5450   008A
        CLRR    R0                              ; 5451   01C0
        INCR    R7                              ; 5452   000F

L_5453:
        INCR    R0                              ; 5453   0008
L_5454:
        SARC    R2,     1                       ; 5454   007A
        BC      L_5453                          ; 5455   0221 0003
        BNEQ    L_5454                          ; 5457   022C 0004

        CMPI    #$0001, R0                      ; 5459   0378 0001
        BNEQ    L_5461                          ; 545B   020C 0004

        CMPI    #$0007, R3                      ; 545D   037B 0007
        BEQ     L_546B                          ; 545F   0204 000A

L_5461:
        INCR    R0                              ; 5461   0008

        JSR     R5,     X_RAND2                 ; 5462   0004 0114 029E

        B       L_546B                          ; 5465   0200 0004

L_5467:
        DECR    R0                              ; 5467   0010
        BEQ     L_5478                          ; 5468   0204 000E

L_546A:
        INCR    R2                              ; 546A   000A
L_546B:
        SARC    R1,     1                       ; 546B   0079
        BC      L_5467                          ; 546C   0221 0006
        BNEQ    L_546A                          ; 546E   022C 0005
        B       L_5476                          ; 5470   0200 0004

L_5472:
        MOVR    R3,     R0                      ; 5472   0098

        JSR     R5,     L_56E6                  ; 5473   0004 0154 02E6

L_5476:
        MVI     G_01A3, R2                      ; 5476   0282 01A3
L_5478:
        MVO     R2,     G_01A3                  ; 5478   0242 01A3
        CMPI    #$0007, R2                      ; 547A   037A 0007
        BEQ     L_549C                          ; 547C   0204 001E

        MVI     G_01A2, R0                      ; 547E   0280 01A2
        ANDI    #$00EF, R0                      ; 5480   03B8 00EF
        MVO     R0,     G_01A2                  ; 5482   0240 01A2
        CLRR    R5                              ; 5484   01ED
        MVO     R5,     G_0359                  ; 5485   0245 0359
        MOVR    R2,     R0                      ; 5487   0090

        JSR     R5,     .EXEC.76C               ; 5488   0004 0114 036C

        MVII    #$0300, R4                      ; 548B   02BC 0300
        MVI@    R1,     R2                      ; 548D   028A
        ANDI    #$0200, R2                      ; 548E   03BA 0200
        BNEQ    L_5493                          ; 5490   020C 0001

        NEGR    R4                              ; 5492   0024
L_5493:
        ADDI    #$0002, R1                      ; 5493   02F9 0002
        ADD@    R1,     R4                      ; 5495   02CC
        MVO     R4,     G_0357                  ; 5496   0244 0357
        INCR    R1                              ; 5498   0009
        MVI@    R1,     R4                      ; 5499   028C
        MVO     R4,     G_0358                  ; 549A   0244 0358
L_549C:
        CLRR    R5                              ; 549C   01ED
        MVO     R5,     G_01A0                  ; 549D   0245 01A0
L_549F:
        PULR    R7                              ; 549F   02B7

L_54A0:
        CLRR    R0                              ; 54A0   01C0
        MOVR    R2,     R1                      ; 54A1   0091
        ADDR    R3,     R1                      ; 54A2   00D9
        CMPI    #$0066, R1                      ; 54A3   0379 0066
        RLC     R0,     1                       ; 54A5   0050
        CMPI    #$0041, R2                      ; 54A6   037A 0041
        RLC     R0,     1                       ; 54A8   0050
        CMPI    #$004B, R2                      ; 54A9   037A 004B
        RLC     R0,     1                       ; 54AB   0050
        CMPI    #$0044, R3                      ; 54AC   037B 0044
        RLC     R0,     1                       ; 54AE   0050
        CMPI    #$004E, R3                      ; 54AF   037B 004E
        RLC     R0,     1                       ; 54B1   0050
        SLL     R0,     1                       ; 54B2   0048
        XOR     G_01B0, R0                      ; 54B3   03C0 01B0
        MVO     R0,     G_01A1                  ; 54B5   0240 01A1
        MOVR    R5,     R7                      ; 54B7   00AF

L_54B8:
        PSHR    R5                              ; 54B8   0275

        JSR     R5,     L_54D4                  ; 54B9   0004 0154 00D4
        JSR     R5,     L_5544                  ; 54BC   0004 0154 0144
        JSR     R5,     L_5692                  ; 54BF   0004 0154 0292
        JSR     R5,     L_52E0                  ; 54C2   0004 0150 02E0

        MVI     G_019D, R0                      ; 54C5   0280 019D
        ANDI    #$0005, R0                      ; 54C7   03B8 0005
        BNEQ    L_54D0                          ; 54C9   020C 0005

        MVI     G_01B6, R0                      ; 54CB   0280 01B6
        DECR    R0                              ; 54CD   0010
        BPL     L_561A                          ; 54CE   0203 014A

L_54D0:
        CLRR    R0                              ; 54D0   01C0
        MVO     R0,     G_01B6                  ; 54D1   0240 01B6
        PULR    R7                              ; 54D3   02B7

L_54D4:
        PSHR    R5                              ; 54D4   0275

        JSR     R5,     L_5530                  ; 54D5   0004 0154 0130

        CLRR    R3                              ; 54D8   01DB

        JSR     R5,     L_54DE                  ; 54D9   0004 0154 00DE

        INCR    R3                              ; 54DC   000B
        INCR    R7                              ; 54DD   000F

L_54DE:
        PSHR    R5                              ; 54DE   0275
L_54DF:
        MOVR    R3,     R0                      ; 54DF   0098

        JSR     R5,     L_54EF                  ; 54E0   0004 0154 00EF

        BNEQ    L_54EA                          ; 54E3   020C 0005

        JSR     R5,     L_5330                  ; 54E5   0004 0150 0330
        DECLE   $0018                           ; 54E8   0018

        PULR    R7                              ; 54E9   02B7

L_54EA:
        CLRR    R1                              ; 54EA   01C9

        JSR     R5,     L_533F                  ; 54EB   0004 0150 033F

        PULR    R7                              ; 54EE   02B7

L_54EF:
        PSHR    R5                              ; 54EF   0275
        MOVR    R3,     R1                      ; 54F0   0099
        ADDI    #$011F, R1                      ; 54F1   02F9 011F
        MVI@    R1,     R1                      ; 54F3   0289
        MOVR    R1,     R5                      ; 54F4   008D
        ANDI    #$00C0, R5                      ; 54F5   03BD 00C0
L_54F7:
        PULR    R7                              ; 54F7   02B7

        MVII    #$0001, R2                      ; 54F8   02BA 0001
        INCR    R7                              ; 54FA   000F

        CLRR    R2                              ; 54FB   01D2
L_54FC:
        PSHR    R5                              ; 54FC   0275

        JSR     R5,     L_5530                  ; 54FD   0004 0154 0130

        MOVR    R1,     R3                      ; 5500   008B
        SLL     R1,     2                       ; 5501   004D
        SLL     R1,     1                       ; 5502   0049
        MOVR    R1,     R4                      ; 5503   008C
        ADDI    #$0161, R1                      ; 5504   02F9 0161
        MVI@    R1,     R1                      ; 5506   0289
        TSTR    R1                              ; 5507   0089
        BNEQ    L_54F7                          ; 5508   022C 0012

        JSR     R5,     L_54EF                  ; 550A   0004 0154 00EF

        BNEQ    L_54F7                          ; 550D   022C 0017

        SLL     R1,     1                       ; 550F   0049
        XORR    R1,     R2                      ; 5510   01CA
        SETC                                    ; 5511   0007
        RLC     R2,     1                       ; 5512   0052
        MOVR    R4,     R3                      ; 5513   00A3
        ADDI    #$0160, R3                      ; 5514   02FB 0160
        MVI@    R3,     R5                      ; 5516   029D
        TSTR    R5                              ; 5517   00AD
        BNEQ    L_54F7                          ; 5518   022C 0022

        MVO@    R2,     R3                      ; 551A   025A
        DECR    R3                              ; 551B   0013
        MVII    #$0004, R5                      ; 551C   02BD 0004
        MVO@    R5,     R3                      ; 551E   025D
        MOVR    R4,     R1                      ; 551F   00A1
        ADDI    #$031D, R1                      ; 5520   02F9 031D

        JSR     R5,     L_5399                  ; 5522   0004 0150 0399
        DECLE   $0003                           ; 5525   0003

        JSR     R5,     L_5537                  ; 5526   0004 0154 0137
        BIDECLE $5E7D                           ; 5529   007D 005E
        DECLE   $02F0                           ; 552B   02F0

        JSR     R5,     L_5FF2                  ; 552C   0004 015C 03F2

        PULR    R7                              ; 552F   02B7

L_5530:
        MVI     G_019D, R4                      ; 5530   0284 019D
        ANDI    #$0001, R4                      ; 5532   03BC 0001
        BNEQ    L_54F7                          ; 5534   022C 003E
        MOVR    R5,     R7                      ; 5536   00AF

L_5537:
        PSHR    R0                              ; 5537   0270
        SDBD                                    ; 5538   0001
        MVI@    R5,     R0                      ; 5539   02A8
        INCR    R1                              ; 553A   0009
        MVO@    R0,     R1                      ; 553B   0248
        MVI@    R5,     R0                      ; 553C   02A8
        ADDI    #$0004, R1                      ; 553D   02F9 0004
        MVO@    R0,     R1                      ; 553F   0248
        PULR    R0                              ; 5540   02B0
        SUBI    #$0005, R1                      ; 5541   0339 0005
        MOVR    R5,     R7                      ; 5543   00AF

L_5544:
        PSHR    R5                              ; 5544   0275
        MVII    #$015F, R3                      ; 5545   02BB 015F
        CLRR    R4                              ; 5547   01E4
L_5548:
        MVI@    R3,     R0                      ; 5548   0298
        DECR    R0                              ; 5549   0010
        BPL     L_5554                          ; 554A   0203 0008

        INCR    R3                              ; 554C   000B
        MVI@    R3,     R0                      ; 554D   0298
        DECR    R0                              ; 554E   0010
        BMI     L_55A3                          ; 554F   020B 0052

        MVO@    R0,     R3                      ; 5551   0258
        B       L_55A3                          ; 5552   0200 004F

L_5554:
        MVO@    R0,     R3                      ; 5554   0258
        INCR    R3                              ; 5555   000B
        TSTR    R0                              ; 5556   0080
        BNEQ    L_55A3                          ; 5557   020C 004A

        MVI@    R3,     R2                      ; 5559   029A
        MVII    #$0009, R0                      ; 555A   02B8 0009
        MVO@    R0,     R3                      ; 555C   0258
        MOVR    R4,     R0                      ; 555D   00A0
        INCR    R3                              ; 555E   000B
        MVI@    R3,     R1                      ; 555F   0299
        DECR    R3                              ; 5560   0013
        TSTR    R1                              ; 5561   0089
        BNEQ    L_5571                          ; 5562   020C 000D

        JSR     R5,     .EXEC.76C               ; 5564   0004 0114 036C
        JSR     R5,     L_539F                  ; 5567   0004 0150 039F
        DECLE   $0003                           ; 556A   0003

        JSR     R5,     L_5537                  ; 556B   0004 0154 0137
        BIDECLE $5E6B                           ; 556E   006B 005E
        DECLE   $0000                           ; 5570   0000
L_5571:
        MVI     G_019D, R5                      ; 5571   0285 019D
        ANDI    #$0010, R5                      ; 5573   03BD 0010
        BNEQ    L_55A3                          ; 5575   020C 002C

        CMP     G_01A3, R4                      ; 5577   0344 01A3
        BNEQ    L_55AF                          ; 5579   020C 0034

        JSR     R5,     X_POW2                  ; 557B   0004 0114 0345

        MVO     R0,     G_019F                  ; 557E   0240 019F
        MVII    #$000A, R0                      ; 5580   02B8 000A
        MVO     R0,     G_019E                  ; 5582   0240 019E
        MVII    #$001E, R0                      ; 5584   02B8 001E
        SARC    R2,     2                       ; 5586   007E
        BNOV    L_558B                          ; 5587   020A 0002

        MVII    #$0028, R0                      ; 5589   02B8 0028
L_558B:
        MOVR    R2,     R1                      ; 558B   0091

        JSR     R5,     .EXEC.629               ; 558C   0004 0114 0229
        JSR     R5,     X_UNPK_BYTES            ; 558F   0004 0114 0357

        SAR     R1,     1                       ; 5592   0069

        JSR     R5,     X_PACK_BYTES            ; 5593   0004 0114 034F

        MVO     R0,     G_0359                  ; 5596   0240 0359
        MVII    #$0007, R0                      ; 5598   02B8 0007
        MVO     R0,     G_01A3                  ; 559A   0240 01A3
        PSHR    R4                              ; 559C   0274
        PSHR    R3                              ; 559D   0273

        JSR     R5,     L_5FC3                  ; 559E   0004 015C 03C3

        PULR    R3                              ; 55A1   02B3
        PULR    R4                              ; 55A2   02B4
L_55A3:
        ADDI    #$0002, R3                      ; 55A3   02FB 0002
        CLRR    R5                              ; 55A5   01ED
        MVO@    R5,     R3                      ; 55A6   025D
        ADDI    #$0005, R3                      ; 55A7   02FB 0005
        INCR    R4                              ; 55A9   000C
        CMPI    #$0006, R4                      ; 55AA   037C 0006
        BLT     L_5548                          ; 55AC   0225 0065
        PULR    R7                              ; 55AE   02B7

L_55AF:
        CMPI    #$0001, R4                      ; 55AF   037C 0001
        BGT     L_55A3                          ; 55B1   022E 000F

        MOVR    R4,     R1                      ; 55B3   00A1
        ADDI    #$01B7, R1                      ; 55B4   02F9 01B7
        MVI@    R1,     R0                      ; 55B6   0288
        TSTR    R0                              ; 55B7   0080
        BNEQ    L_55A3                          ; 55B8   022C 0016

        ADDI    #$0002, R3                      ; 55BA   02FB 0002
        MVI@    R3,     R2                      ; 55BC   029A
        SUBI    #$0002, R3                      ; 55BD   033B 0002
        CLRR    R0                              ; 55BF   01C0
L_55C0:
        SARC    R2,     1                       ; 55C0   007A
        BC      L_55C8                          ; 55C1   0201 0005
        BEQ     L_55A3                          ; 55C3   0224 0021

        INCR    R0                              ; 55C5   0008
        B       L_55C0                          ; 55C6   0220 0007

L_55C8:
        PSHR    R3                              ; 55C8   0273
        PSHR    R4                              ; 55C9   0274
        CMP     G_01A3, R0                      ; 55CA   0340 01A3
        BEQ     L_55F0                          ; 55CC   0204 0022

        MOVR    R0,     R1                      ; 55CE   0081
        SLL     R1,     2                       ; 55CF   004D
        SLL     R1,     1                       ; 55D0   0049
        ADDI    #$015F, R1                      ; 55D1   02F9 015F
        MVI@    R1,     R5                      ; 55D3   028D
        DECR    R5                              ; 55D4   0015
        BNEQ    L_55E0                          ; 55D5   020C 0009

        JSR     R5,     L_55FE                  ; 55D7   0004 0154 01FE

        MVII    #$0007, R0                      ; 55DA   02B8 0007
        MVO     R0,     G_01A3                  ; 55DC   0240 01A3
        B       L_55F3                          ; 55DE   0200 0013

L_55E0:
        JSR     R5,     L_55FE                  ; 55E0   0004 0154 01FE
        JSR     R5,     L_53A5                  ; 55E3   0004 0150 03A5
        DECLE   $0028,  $0209,  $000E,  $02B4   ; 55E6   0028 0209 000E 02B4
        DECLE   $0274,  $000C,  $0244,  $01B6   ; 55EA   0274 000C 0244 01B6
        DECLE   $0200,  $0007                   ; 55EE   0200 0007
L_55F0:
        MVO     R4,     G_01A3                  ; 55F0   0244 01A3
        INCR    R7                              ; 55F2   000F

L_55F3:
        MOVR    R4,     R0                      ; 55F3   00A0

L_55F4:
        JSR     R5,     L_55FE                  ; 55F4   0004 0154 01FE
        DECLE   $0004,  $015C,  $03E2           ; 55F7   0004 015C 03E2

        PULR    R3                              ; 55FA   02B3
        PULR    R4                              ; 55FB   02B4
        B       L_55A3                          ; 55FC   0220 005A

L_55FE:
        PSHR    R5                              ; 55FE   0275
        MOVR    R0,     R1                      ; 55FF   0081
        SLL     R1,     2                       ; 5600   004D
        SLL     R1,     1                       ; 5601   0049
        ADDI    #$015F, R1                      ; 5602   02F9 015F
        CLRR    R5                              ; 5604   01ED
        MVO@    R5,     R1                      ; 5605   024D
        ADDI    #$0002, R1                      ; 5606   02F9 0002
        MVII    #$0008, R5                      ; 5608   02BD 0008
        MVO@    R5,     R1                      ; 560A   024D
        SUBI    #$0161, R1                      ; 560B   0339 0161
        ADDI    #$031D, R1                      ; 560D   02F9 031D

        JSR     R5,     L_5399                  ; 560F   0004 0150 0399
        DECLE   $0003                           ; 5612   0003

        JSR     R5,     L_5537                  ; 5613   0004 0154 0137
        BIDECLE $5E6B                           ; 5616   006B 005E
        DECLE   $02FA                           ; 5618   02FA

        PULR    R7                              ; 5619   02B7

L_561A:
        MVII    #$0038, R1                      ; 561A   02B9 0038
        CLRR    R3                              ; 561C   01DB
        TSTR    R0                              ; 561D   0080
        BEQ     L_5623                          ; 561E   0204 0003

        MVII    #$0070, R1                      ; 5620   02B9 0070
        COMR    R3                              ; 5622   001B
L_5623:
        MVO     R3,     G_01AE                  ; 5623   0243 01AE
        SWAP    R1,     1                       ; 5625   0041
        ADDI    #$0039, R1                      ; 5626   02F9 0039

        JSR     R5,     L_5DF0                  ; 5628   0004 015C 01F0

        SWAP    R3,     1                       ; 562B   0043
        RLC     R2,     2                       ; 562C   0056
        CLRR    R0                              ; 562D   01C0
        MVO     R0,     G_0351                  ; 562E   0240 0351
        MVO     R0,     G_0359                  ; 5630   0240 0359
L_5632:
        CLRR    R1                              ; 5632   01C9

        JSR     R5,     L_533F                  ; 5633   0004 0150 033F

        INCR    R0                              ; 5636   0008
        CMPI    #$0006, R0                      ; 5637   0378 0006
        BLT     L_5632                          ; 5639   0225 0008

        MVII    #$0001, R0                      ; 563B   02B8 0001
        MVO     R0,     G_01BA                  ; 563D   0240 01BA

        JSR     R5,     L_504C                  ; 563F   0004 0150 004C

        PULR    R7                              ; 5642   02B7

        PSHR    R5                              ; 5643   0275
        ADDI    #$0003, R1                      ; 5644   02F9 0003
        MVII    #$000F, R0                      ; 5646   02B8 000F
        MVO@    R0,     R1                      ; 5648   0248

        JSR     R5,     .EXEC.766               ; 5649   0004 0114 0366

        MOVR    R0,     R3                      ; 564C   0083
        ADDI    #$01B7, R3                      ; 564D   02FB 01B7
        MVII    #$0081, R5                      ; 564F   02BD 0081
        MVO@    R5,     R3                      ; 5651   025D

        JSR     R5,     .EXEC.76C               ; 5652   0004 0114 036C
        JSR     R5,     L_5399                  ; 5655   0004 0150 0399
        DECLE   $0003                           ; 5658   0003

        JSR     R5,     L_539F                  ; 5659   0004 0150 039F
        DECLE   $000B                           ; 565C   000B

        ADDI    #$0002, R0                      ; 565D   02F8 0002

        JSR     R5,     L_56E6                  ; 565F   0004 0154 02E6

        MVII    #$0007, R0                      ; 5662   02B8 0007
        MVO     R0,     G_01A3                  ; 5664   0240 01A3
        MVII    #$0008, R0                      ; 5666   02B8 0008
        MVO     R0,     G_019D                  ; 5668   0240 019D

        JSR     R5,     L_5046                  ; 566A   0004 0150 0046
        JSR     R5,     L_5CF1                  ; 566D   0004 015C 00F1

        PULR    R7                              ; 5670   02B7

        PSHR    R5                              ; 5671   0275
        XORR    R3,     R0                      ; 5672   01D8
        SARC    R0,     1                       ; 5673   0078
        BNC     L_54F7                          ; 5674   0229 017E

        SDBD                                    ; 5676   0001
        MVII    #$0504, R4                      ; 5677   02BC 0004 0005

        JSR     R5,     .EXEC.70F               ; 567A   0004 0114 030F

        BNC     L_54F7                          ; 567D   0229 0187

        SUBI    #$031D, R1                      ; 567F   0339 031D
        ADDI    #$0162, R1                      ; 5681   02F9 0162
        MOVR    R3,     R0                      ; 5683   0098
        SLL     R3,     2                       ; 5684   004F
        SLL     R3,     1                       ; 5685   004B
        ADDI    #$0161, R3                      ; 5686   02FB 0161
        MVI@    R3,     R5                      ; 5688   029D
        TSTR    R5                              ; 5689   00AD
        BNEQ    L_54F7                          ; 568A   022C 0194

        JSR     R5,     X_POW2                  ; 568C   0004 0114 0345

        XOR@    R1,     R0                      ; 568F   03C8
        MVO@    R0,     R1                      ; 5690   0248
        PULR    R7                              ; 5691   02B7

L_5692:
        PSHR    R5                              ; 5692   0275
        MVII    #$0161, R3                      ; 5693   02BB 0161
        MVII    #$031D, R1                      ; 5695   02B9 031D
L_5697:
        MVI@    R3,     R0                      ; 5697   0298
        CMPI    #$00FF, R0                      ; 5698   0378 00FF
        BNEQ    L_56C1                          ; 569A   020C 0025

        MVI     G_019D, R5                      ; 569C   0285 019D
        ANDI    #$0008, R5                      ; 569E   03BD 0008
        BNEQ    L_56A8                          ; 56A0   020C 0006

        JSR     R5,     L_53A5                  ; 56A2   0004 0150 03A5
        DECLE   $0001                           ; 56A5   0001

        BC      L_56DE                          ; 56A6   0201 0036

L_56A8:
        JSR     R5,     L_539F                  ; 56A8   0004 0150 039F
        DECLE   $0003                           ; 56AB   0003

        MOVR    R1,     R4                      ; 56AC   008C
        ADDI    #$0005, R4                      ; 56AD   02FC 0005
        CLRR    R5                              ; 56AF   01ED
        MVO@    R5,     R4                      ; 56B0   0265
        MVO@    R5,     R3                      ; 56B1   025D
L_56B2:
        ADDI    #$0008, R3                      ; 56B2   02FB 0008
        ADDI    #$0008, R1                      ; 56B4   02F9 0008
        CMPI    #$034D, R1                      ; 56B6   0379 034D
        BLT     L_5697                          ; 56B8   0225 0022

        MVII    #$0003, R0                      ; 56BA   02B8 0003

        JSR     R5,     X_SET_BIT               ; 56BC   0004 0114 02DB

        ANDR    R3,     R5                      ; 56BF   019D
        PULR    R7                              ; 56C0   02B7

L_56C1:
        DECR    R0                              ; 56C1   0010
        BMI     L_56B2                          ; 56C2   022B 0011

        MVO@    R0,     R3                      ; 56C4   0258
        BNEQ    L_56DE                          ; 56C5   020C 0017

        DECR    R0                              ; 56C7   0010
        MVO@    R0,     R3                      ; 56C8   0258
        PSHR    R3                              ; 56C9   0273
        PSHR    R1                              ; 56CA   0271
        MVI     G_01BA, R0                      ; 56CB   0280 01BA
        TSTR    R0                              ; 56CD   0080
        BEQ     L_56D6                          ; 56CE   0204 0006

        JSR     R5,     X_PLAY_WHST1            ; 56D0   0004 011C 031B

        CLRR    R0                              ; 56D3   01C0
        MVO     R0,     G_01BA                  ; 56D4   0240 01BA
L_56D6:
        PULR    R1                              ; 56D6   02B1
        PULR    R3                              ; 56D7   02B3
        MOVR    R1,     R4                      ; 56D8   008C
        ADDI    #$0005, R4                      ; 56D9   02FC 0005
        MVII    #$000E, R5                      ; 56DB   02BD 000E
        MVO@    R5,     R4                      ; 56DD   0265
L_56DE:
        MOVR    R3,     R5                      ; 56DE   009D
        SUBI    #$0004, R5                      ; 56DF   033D 0004
        CLRR    R0                              ; 56E1   01C0
        MVO@    R0,     R5                      ; 56E2   0268
        MVO@    R0,     R5                      ; 56E3   0268
        B       L_56B2                          ; 56E4   0220 0033

L_56E6:
        PSHR    R5                              ; 56E6   0275
        CMPI    #$0006, R0                      ; 56E7   0378 0006
        BGE     L_54F7                          ; 56E9   022D 01F3

        MOVR    R0,     R1                      ; 56EB   0081
        SLR     R1,     1                       ; 56EC   0061
        BEQ     L_54F7                          ; 56ED   0224 01F7

        JSR     R5,     .EXEC.76C               ; 56EF   0004 0114 036C

        MOVR    R1,     R2                      ; 56F2   008A
        ANDI    #$0001, R0                      ; 56F3   03B8 0001
        MVO     R0,     G_01A3                  ; 56F5   0240 01A3

        JSR     R5,     .EXEC.76C               ; 56F7   0004 0114 036C
        JSR     R5,     L_53AD                  ; 56FA   0004 0150 03AD

        SDBD                                    ; 56FD   0001
        MVII    #$01C8, R5                      ; 56FE   02BD 00C8 0001
        SUBR    R5,     R1                      ; 5701   0129
        SUBR    R5,     R2                      ; 5702   012A

        JSR     R5,     L_53AD                  ; 5703   0004 0150 03AD

        MVII    #$0006, R3                      ; 5706   02BB 0006

        JSR     R5,     L_518F                  ; 5708   0004 0150 018F

        PULR    R7                              ; 570B   02B7

L_570C:
        PSHR    R5                              ; 570C   0275
        MVII    #$02A4, R5                      ; 570D   02BD 02A4
        ANDI    #$0001, R3                      ; 570F   03BB 0001
        BEQ     L_5746                          ; 5711   0204 0033

        MVII    #$02AF, R5                      ; 5713   02BD 02AF
        PULR    R7                              ; 5715   02B7

L_5716:
        PSHR    R5                              ; 5716   0275
        SDBD                                    ; 5717   0001
        MVII    #$0945, R0                      ; 5718   02B8 0045 0009

        JSR     R5,     L_570C                  ; 571B   0004 0154 030C

        BNEQ    L_5722                          ; 571E   020C 0002

        ADDI    #$0006, R0                      ; 5720   02F8 0006
L_5722:
        MVO@    R0,     R5                      ; 5722   0268
        PULR    R7                              ; 5723   02B7

L_5724:
        MVII    #$034D, R2                      ; 5724   02BA 034D
L_5726:
        PSHR    R5                              ; 5726   0275
        MOVR    R7,     R1                      ; 5727   00B9
        ADDI    #$0052, R1                      ; 5728   02F9 0052

        JSR     R5,     X_INIT_MOB              ; 572A   0004 0114 02B2
        JSR     R5,     L_570C                  ; 572D   0004 0154 030C

        CLRR    R0                              ; 5730   01C0
        MVO@    R0,     R5                      ; 5731   0268
        MVI     G_01A2, R5                      ; 5732   0285 01A2
        ANDI    #$00FE, R5                      ; 5734   03BD 00FE
        XORR    R3,     R5                      ; 5736   01DD
        MVO     R5,     G_01A2                  ; 5737   0245 01A2
        TSTR    R3                              ; 5739   009B
        BEQ     L_5746                          ; 573A   0204 000A

        MVI@    R2,     R0                      ; 573C   0290
        XORI    #$0206, R0                      ; 573D   03F8 0206
        MVO@    R0,     R2                      ; 573F   0250
        ADDI    #$0002, R2                      ; 5740   02FA 0002
        MVII    #$0080, R0                      ; 5742   02B8 0080
        SWAP    R0,     1                       ; 5744   0040
        MVO@    R0,     R2                      ; 5745   0250
L_5746:
        PULR    R7                              ; 5746   02B7

L_5747:
        PSHR    R5                              ; 5747   0275
        MVI     G_01A2, R3                      ; 5748   0283 01A2
        MOVR    R3,     R5                      ; 574A   009D
        ANDI    #$0002, R5                      ; 574B   03BD 0002
        BEQ     L_575B                          ; 574D   0204 000C

        MVII    #$03F0, R5                      ; 574F   02BD 03F0
        COMR    R5                              ; 5751   001D
        AND     G_0352, R5                      ; 5752   0385 0352
        XORI    #$03D0, R5                      ; 5754   03FD 03D0
        MVO     R5,     G_0352                  ; 5756   0245 0352
        CLRR    R5                              ; 5758   01ED
        MVO     R5,     G_0353                  ; 5759   0245 0353
L_575B:
        ANDI    #$0001, R3                      ; 575B   03BB 0001
        BEQ     L_5772                          ; 575D   0204 0013

        MVII    #$034D, R4                      ; 575F   02BC 034D
        MVII    #$0355, R1                      ; 5761   02B9 0355
        MVII    #$0008, R0                      ; 5763   02B8 0008

        JSR     R5,     .EXEC.730               ; 5765   0004 0114 0330

        CLRR    R3                              ; 5768   01DB

        JSR     R5,     L_5724                  ; 5769   0004 0154 0324

L_576C:
        MVII    #$0006, R0                      ; 576C   02B8 0006

        JSR     R5,     .EXEC.41C               ; 576E   0004 0114 001C

        PULR    R7                              ; 5771   02B7

L_5772:
        INCR    R3                              ; 5772   000B
        MVII    #$0355, R2                      ; 5773   02BA 0355

        JSR     R5,     L_5726                  ; 5775   0004 0154 0326

        B       L_576C                          ; 5778   0220 000D

        DECLE   $004B,  $005A,  $0074,  $005E   ; 577A   004B 005A 0074 005E
        DECLE   $0000,  $0028,  $0000,  $0049   ; 577E   0000 0028 0000 0049
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5782   0000 0000 0000 0000
        DECLE   $0000,  $0000                   ; 5786   0000 0000

        PSHR    R5                              ; 5788   0275
        MVI     G_019D, R5                      ; 5789   0285 019D
        ANDI    #$0004, R5                      ; 578B   03BD 0004
        BNEQ    L_5746                          ; 578D   022C 0048

        MVI     G_01A2, R5                      ; 578F   0285 01A2
        MOVR    R5,     R4                      ; 5791   00AC
        ANDI    #$0018, R5                      ; 5792   03BD 0018
        BNEQ    L_5746                          ; 5794   022C 004F

        ANDI    #$0002, R4                      ; 5796   03BC 0002
        BEQ     L_57A0                          ; 5798   0204 0006

        JSR     R5,     L_53A5                  ; 579A   0004 0150 03A5

        DECR    R4                              ; 579D   0014
        BC      L_5746                          ; 579E   0221 0059

L_57A0:
        SDBD                                    ; 57A0   0001
        MVII    #$0804, R4                      ; 57A1   02BC 0004 0008

        JSR     R5,     .EXEC.70F               ; 57A4   0004 0114 030F

        BNC     L_5746                          ; 57A7   0229 0062

        MVI     G_0359, R0                      ; 57A9   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 57AB   0004 0114 0357
        JSR     R5,     L_5A41                  ; 57AE   0004 0158 0241
        JSR     R5,     X_RAND2                 ; 57B1   0004 0114 029E

        CMPI    #$0023, R0                      ; 57B4   0378 0023
        BMI     L_5801                          ; 57B6   020B 0049

        JSR     R5,     L_5FC3                  ; 57B8   0004 015C 03C3
        JSR     R5,     L_53A5                  ; 57BB   0004 0150 03A5

        ADCR    R5                              ; 57BE   002D
        BC      L_57D6                          ; 57BF   0201 0015

        MVI     G_01A2, R0                      ; 57C1   0280 01A2
        MOVR    R0,     R1                      ; 57C3   0081
        ANDI    #$0002, R0                      ; 57C4   03B8 0002
        BNEQ    L_57D6                          ; 57C6   020C 000E

        XORI    #$0002, R1                      ; 57C8   03F9 0002
        MVO     R1,     G_01A2                  ; 57CA   0241 01A2
        MVO     R0,     G_01B5                  ; 57CC   0240 01B5
        MVII    #$0008, R0                      ; 57CE   02B8 0008
        MVO     R0,     G_0353                  ; 57D0   0240 0353
        MVII    #$02F9, R0                      ; 57D2   02B8 02F9
        MVO     R0,     G_0352                  ; 57D4   0240 0352
L_57D6:
        MVII    #$0028, R2                      ; 57D6   02BA 0028
L_57D8:
        MVII    #$0004, R0                      ; 57D8   02B8 0004

        JSR     R5,     X_CLR_BIT               ; 57DA   0004 0114 02E6

        ANDR    R4,     R2                      ; 57DD   01A2
        MOVR    R2,     R0                      ; 57DE   0090

        JSR     R5,     X_RAND2                 ; 57DF   0004 0114 029E

        MOVR    R0,     R1                      ; 57E2   0081
        MOVR    R2,     R0                      ; 57E3   0090

        JSR     R5,     X_RAND2                 ; 57E4   0004 0114 029E

        SUBR    R0,     R1                      ; 57E7   0101
        MOVR    R1,     R2                      ; 57E8   008A
        BPL     L_57F0                          ; 57E9   0203 0005

        NEGR    R2                              ; 57EB   0022
        CMPR    R0,     R2                      ; 57EC   0142
        BLE     L_57F0                          ; 57ED   0206 0001

        MOVR    R2,     R0                      ; 57EF   0090
L_57F0:
        MVI     G_01A1, R5                      ; 57F0   0285 01A1
        ANDI    #$0001, R5                      ; 57F2   03BD 0001
        BEQ     L_57F7                          ; 57F4   0204 0001

        NEGR    R0                              ; 57F6   0020

L_57F7:
        JSR     R5,     X_PACK_BYTES            ; 57F7   0004 0114 034F

L_57FA:
        MVII    #$0007, R2                      ; 57FA   02BA 0007
        MVO     R2,     G_01A3                  ; 57FC   0242 01A3
        MVO     R0,     G_0359                  ; 57FE   0240 0359
        PULR    R7                              ; 5800   02B7

L_5801:
        JSR     R5,     L_5953                  ; 5801   0004 0158 0153

        BEQ     L_580E                          ; 5804   0204 0008
        BNC     L_5746                          ; 5806   0229 00C1

        JSR     R5,     L_53A5                  ; 5808   0004 0150 03A5

        COMR    R6                              ; 580B   001E
        BC      L_5746                          ; 580C   0221 00C7

L_580E:
        MVI     G_01A2, R0                      ; 580E   0280 01A2
        ANDI    #$00F5, R0                      ; 5810   03B8 00F5
        XORI    #$0008, R0                      ; 5812   03F8 0008
        MVO     R0,     G_01A2                  ; 5814   0240 01A2
        CLRR    R0                              ; 5816   01C0
        MVO     R0,     G_0353                  ; 5817   0240 0353
        MVII    #$0006, R0                      ; 5819   02B8 0006
        MVO     R0,     G_01A3                  ; 581B   0240 01A3
        MVII    #$000A, R0                      ; 581D   02B8 000A
        MVO     R0,     G_01B1                  ; 581F   0240 01B1
        PULR    R7                              ; 5821   02B7

L_5822:
        PSHR    R5                              ; 5822   0275
        MVI     G_019D, R5                      ; 5823   0285 019D
        MOVR    R5,     R4                      ; 5825   00AC
        ANDI    #$0004, R5                      ; 5826   03BD 0004
        BNEQ    L_5746                          ; 5828   022C 00E3

        MVI     G_01A2, R5                      ; 582A   0285 01A2
        MOVR    R5,     R3                      ; 582C   00AB
        ANDI    #$0008, R5                      ; 582D   03BD 0008
        BNEQ    L_5915                          ; 582F   020C 00E4

        MOVR    R3,     R5                      ; 5831   009D
        ANDI    #$0002, R5                      ; 5832   03BD 0002
        BNEQ    L_58AF                          ; 5834   020C 0079

        MOVR    R3,     R2                      ; 5836   009A
        XOR     G_01A1, R2                      ; 5837   03C2 01A1
        SARC    R2,     1                       ; 5839   007A
        BNC     L_5857                          ; 583A   0209 001B

        JSR     R5,     L_591D                  ; 583C   0004 0158 011D

        BNEQ    L_5746                          ; 583F   022C 00FA

        MVI     G_01A1, R0                      ; 5841   0280 01A1
        ANDI    #$0008, R0                      ; 5843   03B8 0008
        BNEQ    L_5746                          ; 5845   022C 0100

        MVI     G_01A2, R3                      ; 5847   0283 01A2
        ANDI    #$00EF, R3                      ; 5849   03BB 00EF
        XORI    #$0001, R3                      ; 584B   03FB 0001
        MVO     R3,     G_01A2                  ; 584D   0243 01A2
        INCR    R3                              ; 584F   000B

        JSR     R5,     L_5716                  ; 5850   0004 0154 0316

        INCR    R3                              ; 5853   000B

        JSR     R5,     L_5724                  ; 5854   0004 0154 0324

L_5857:
        MVI     G_01A2, R5                      ; 5857   0285 01A2
        ANDI    #$0004, R5                      ; 5859   03BD 0004
        BNEQ    L_5888                          ; 585B   020C 002B

        MVI     G_01A1, R0                      ; 585D   0280 01A1
        ANDI    #$0010, R0                      ; 585F   03B8 0010
        BNEQ    L_591E                          ; 5861   020C 00BB

        MVI     G_01AA, R0                      ; 5863   0280 01AA
        INCR    R0                              ; 5865   0008

        JSR     R5,     X_CLAMP                 ; 5866   0004 0114 0270

        SWAP    R0,     2                       ; 5869   0044
        SLL     R2,     2                       ; 586A   004E
        MOVR    R0,     R1                      ; 586B   0081
        NEGR    R0                              ; 586C   0020
        ADDI    #$0067, R0                      ; 586D   02F8 0067

        JSR     R5,     L_5923                  ; 586F   0004 0158 0123

        BNEQ    L_5746                          ; 5872   022C 012D

        JSR     R5,     L_5953                  ; 5874   0004 0158 0153

        BEQ     L_587B                          ; 5877   0204 0002
        BNC     L_5746                          ; 5879   0229 0134

L_587B:
        JSR     R5,     L_53A5                  ; 587B   0004 0150 03A5

        EIS                                     ; 587E   0002
        BC      L_5746                          ; 587F   0221 013A

        MVII    #$0002, R0                      ; 5881   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5883   0004 0114 02E6

        ANDR    R4,     R2                      ; 5886   01A2
        PULR    R7                              ; 5887   02B7

L_5888:
        JSR     R5,     L_5953                  ; 5888   0004 0158 0153

        BEQ     L_588F                          ; 588B   0204 0002
        BNC     L_58A1                          ; 588D   0209 0012

L_588F:
        MVI     G_01A9, R0                      ; 588F   0280 01A9
        MVI     G_01AA, R1                      ; 5891   0281 01AA
        MVI     G_01A1, R2                      ; 5893   0282 01A1
        XORI    #$0004, R2                      ; 5895   03FA 0004
        ANDI    #$0026, R2                      ; 5897   03BA 0026
        BEQ     L_58A1                          ; 5899   0204 0006

        INCR    R1                              ; 589B   0009

        JSR     R5,     L_5923                  ; 589C   0004 0158 0123

        BNEQ    L_58A8                          ; 589F   020C 0007

L_58A1:
        MVII    #$0002, R0                      ; 58A1   02B8 0002

        JSR     R5,     X_SET_BIT               ; 58A3   0004 0114 02DB

        ANDR    R4,     R2                      ; 58A6   01A2
        PULR    R7                              ; 58A7   02B7

L_58A8:
        JSR     R5,     L_53A5                  ; 58A8   0004 0150 03A5
        DECLE   $000F                           ; 58AB   000F

        BNC     L_58A1                          ; 58AC   0229 000C
        PULR    R7                              ; 58AE   02B7

L_58AF:
        ANDI    #$0008, R4                      ; 58AF   03BC 0008
        BNEQ    L_58D1                          ; 58B1   020C 001E

        MVI     G_01A1, R5                      ; 58B3   0285 01A1
        ANDI    #$0010, R5                      ; 58B5   03BD 0010
        BNEQ    L_58D1                          ; 58B7   020C 0018

        MVI     G_0353, R5                      ; 58B9   0285 0353
        TSTR    R5                              ; 58BB   00AD
        BNEQ    L_5911                          ; 58BC   020C 0053

        JSR     R5,     L_53A5                  ; 58BE   0004 0150 03A5

        EIS                                     ; 58C1   0002
        BC      L_5911                          ; 58C2   0201 004D

L_58C4:
        MVII    #$0006, R0                      ; 58C4   02B8 0006
        MVO     R0,     G_0353                  ; 58C6   0240 0353
        MVII    #$0001, R0                      ; 58C8   02B8 0001
        MVO     R0,     G_01B5                  ; 58CA   0240 01B5
        CLRR    R0                              ; 58CC   01C0
        MVII    #$02FD, R1                      ; 58CD   02B9 02FD
        B       L_594E                          ; 58CF   0200 007D

L_58D1:
        XORI    #$0002, R3                      ; 58D1   03FB 0002
        MVO     R3,     G_01A2                  ; 58D3   0243 01A2
        B       L_58C4                          ; 58D5   0220 0012

L_58D7:
        ANDI    #$00E7, R3                      ; 58D7   03BB 00E7
        XORI    #$0010, R3                      ; 58D9   03FB 0010
        MVO     R3,     G_01A2                  ; 58DB   0243 01A2
        MOVR    R3,     R4                      ; 58DD   009C
        ANDI    #$0001, R4                      ; 58DE   03BC 0001
        MOVR    R4,     R0                      ; 58E0   00A0
        XORI    #$0002, R0                      ; 58E1   03F8 0002

        JSR     R5,     .EXEC.772               ; 58E3   0004 0114 0372

        CMPI    #$003A, R3                      ; 58E6   037B 003A
        BLT     L_58FC                          ; 58E8   0205 0012

        SWAP    R2,     1                       ; 58EA   0042
        XORR    R3,     R2                      ; 58EB   01DA
        MVII    #$001E, R3                      ; 58EC   02BB 001E
        MVII    #$0007, R0                      ; 58EE   02B8 0007

        JSR     R5,     .EXEC.9BB               ; 58F0   0004 0118 01BB

        MVI     G_0359, R0                      ; 58F3   0280 0359
        MVI     G_01A2, R3                      ; 58F5   0283 01A2
        RRC     R3,     1                       ; 58F7   0073
        RRC     R3,     1                       ; 58F8   0073
        XORR    R0,     R3                      ; 58F9   01C3
        BPL     L_57FA                          ; 58FA   0223 0101

L_58FC:
        MVII    #$004B, R2                      ; 58FC   02BA 004B
        B       L_57D8                          ; 58FE   0220 0127

        PSHR    R5                              ; 5900   0275
        MVI     G_01B5, R0                      ; 5901   0280 01B5
        TSTR    R0                              ; 5903   0080
        BEQ     L_590D                          ; 5904   0204 0007

        MVI     G_01A2, R0                      ; 5906   0280 01A2
        ANDI    #$00FD, R0                      ; 5908   03B8 00FD
        MVO     R0,     G_01A2                  ; 590A   0240 01A2
        PULR    R7                              ; 590C   02B7

L_590D:
        MVII    #$000D, R0                      ; 590D   02B8 000D
        MVO     R0,     G_0352                  ; 590F   0240 0352
L_5911:
        CLRR    R0                              ; 5911   01C0
        MVO     R0,     G_0351                  ; 5912   0240 0351
        PULR    R7                              ; 5914   02B7

L_5915:
        MVI     G_01B1, R0                      ; 5915   0280 01B1
        DECR    R0                              ; 5917   0010
        MVO     R0,     G_01B1                  ; 5918   0240 01B1
        BEQ     L_58D7                          ; 591A   0224 0044
        INCR    R7                              ; 591C   000F

L_591D:
        PSHR    R5                              ; 591D   0275
L_591E:
        MVII    #$0028, R0                      ; 591E   02B8 0028
        MVII    #$0049, R1                      ; 5920   02B9 0049
        INCR    R7                              ; 5922   000F

L_5923:
        PSHR    R5                              ; 5923   0275
L_5924:
        ANDI    #$0001, R3                      ; 5924   03BB 0001
        BEQ     L_592B                          ; 5926   0204 0003

        NEGR    R0                              ; 5928   0020
        ADDI    #$00A8, R0                      ; 5929   02F8 00A8
L_592B:
        PSHR    R3                              ; 592B   0273
        PSHR    R1                              ; 592C   0271
        MVII    #$034D, R1                      ; 592D   02B9 034D

        JSR     R5,     .EXEC.777               ; 592F   0004 0114 0377

        PULR    R1                              ; 5932   02B1
        SUBR    R3,     R1                      ; 5933   0119
        SUBR    R2,     R0                      ; 5934   0110

        JSR     R5,     L_5A37                  ; 5935   0004 0158 0237

        PULR    R3                              ; 5938   02B3
        CMPI    #$0002, R4                      ; 5939   037C 0002
        BLT     L_594C                          ; 593B   0205 000F

        MOVR    R5,     R1                      ; 593D   00A9
        MVII    #$0014, R0                      ; 593E   02B8 0014

        JSR     R5,     .EXEC.629               ; 5940   0004 0114 0229

        MVII    #$03F0, R1                      ; 5943   02B9 03F0
        COMR    R1                              ; 5945   0019
        AND     G_0352, R1                      ; 5946   0381 0352
        XORI    #$02F0, R1                      ; 5948   03F9 02F0
        B       L_594E                          ; 594A   0200 0002

L_594C:
        CLRR    R1                              ; 594C   01C9
        CLRR    R0                              ; 594D   01C0
L_594E:
        MVO     R0,     G_0351                  ; 594E   0240 0351
        MVO     R1,     G_0352                  ; 5950   0241 0352
        PULR    R7                              ; 5952   02B7

L_5953:
        PSHR    R5                              ; 5953   0275
        PSHR    R2                              ; 5954   0272
        MVI     G_01A3, R2                      ; 5955   0282 01A3
        MOVR    R2,     R5                      ; 5957   0095
        XOR     G_01A2, R2                      ; 5958   03C2 01A2
        SUBI    #$0007, R5                      ; 595A   033D 0007
        SARC    R2,     1                       ; 595C   007A
        TSTR    R5                              ; 595D   00AD
        PULR    R2                              ; 595E   02B2
        PULR    R7                              ; 595F   02B7

        PSHR    R5                              ; 5960   0275
L_5961:
        MVI     G_019D, R5                      ; 5961   0285 019D
        ANDI    #$0002, R5                      ; 5963   03BD 0002
        BNEQ    L_5A1F                          ; 5965   020C 00B8

        MVI     G_01B9, R0                      ; 5967   0280 01B9
        DECR    R0                              ; 5969   0010
        BPL     L_596E                          ; 596A   0203 0002

        MVII    #$0003, R0                      ; 596C   02B8 0003
L_596E:
        MVO     R0,     G_01B9                  ; 596E   0240 01B9
        ADDI    #$0002, R0                      ; 5970   02F8 0002
        MOVR    R0,     R3                      ; 5972   0083
        SLL     R3,     2                       ; 5973   004F
        SLL     R3,     1                       ; 5974   004B
        ADDI    #$0161, R3                      ; 5975   02FB 0161
        MVI@    R3,     R4                      ; 5977   029C
        TSTR    R4                              ; 5978   00A4
        BNEQ    L_5A1F                          ; 5979   020C 00A4

        JSR     R5,     .EXEC.772               ; 597B   0004 0114 0372

        MVI     G_01A3, R4                      ; 597E   0284 01A3
        SUBI    #$0007, R4                      ; 5980   033C 0007
        BEQ     L_598C                          ; 5982   0204 0008

        INCR    R4                              ; 5984   000C
        BEQ     L_598B                          ; 5985   0204 0004

        XORR    R0,     R4                      ; 5987   01C4
        ANDI    #$0001, R4                      ; 5988   03BC 0001
        INCR    R4                              ; 598A   000C
L_598B:
        INCR    R4                              ; 598B   000C
L_598C:
        PSHR    R0                              ; 598C   0270
        PSHR    R3                              ; 598D   0273
        CMPI    #$0054, R2                      ; 598E   037A 0054
        CLRR    R3                              ; 5990   01DB
        RLC     R3,     1                       ; 5991   0053
        MVO     R3,     G_01B0                  ; 5992   0243 01B0
        XORR    R3,     R0                      ; 5994   01D8
        MVI     G_01A1, R3                      ; 5995   0283 01A1
        SLR     R3,     2                       ; 5997   0067
        SARC    R3,     2                       ; 5998   007F
        PULR    R3                              ; 5999   02B3
        SARC    R0,     1                       ; 599A   0078
        DECR    R0                              ; 599B   0010
        PULR    R0                              ; 599C   02B0
        BEQ     L_59B1                          ; 599D   0204 0012
        BOV     L_59A3                          ; 599F   0202 0002
        BNC     L_59B5                          ; 59A1   0209 0012

L_59A3:
        TSTR    R4                              ; 59A3   00A4
        BNEQ    L_59A9                          ; 59A4   020C 0003

        JSR     R5,     L_59E5                  ; 59A6   0004 0158 01E5

L_59A9:
        MOVR    R0,     R4                      ; 59A9   0084
        ANDI    #$0001, R4                      ; 59AA   03BC 0001

        JSR     R5,     L_5A54                  ; 59AC   0004 0158 0254
        DECLE   $0019,  $0004                   ; 59AF   0019 0004
L_59B1:
        BOV     L_59C1                          ; 59B1   0202 000E
        BNC     L_59C1                          ; 59B3   0209 000C

L_59B5:
        MVII    #$0032, R1                      ; 59B5   02B9 0032
        SWAP    R1,     1                       ; 59B7   0041
        CMPI    #$0054, R2                      ; 59B8   037A 0054
        BLE     L_59BD                          ; 59BA   0206 0001

        NEGR    R1                              ; 59BC   0021

L_59BD:
        JSR     R5,     L_533F                  ; 59BD   0004 0150 033F

        PULR    R7                              ; 59C0   02B7

L_59C1:
        MOVR    R0,     R5                      ; 59C1   0085
        ANDI    #$0001, R5                      ; 59C2   03BD 0001
        ADDI    #$01B7, R5                      ; 59C4   02FD 01B7
        MVI@    R5,     R5                      ; 59C6   02AD
        TSTR    R5                              ; 59C7   00AD
        BNEQ    L_5A1F                          ; 59C8   020C 0055

        INCR    R4                              ; 59CA   000C
        ADDR    R7,     R4                      ; 59CB   00FC
        ADD@    R4,     R7                      ; 59CC   02E7

        DECLE   $0004                           ; 59CD   0004

        SETC                                    ; 59CE   0007
        SETC                                    ; 59CF   0007
        INCR    R2                              ; 59D0   000A

        JSR     R5,     L_59E5                  ; 59D1   0004 0158 01E5

L_59D4:
        CLRR    R1                              ; 59D4   01C9
        B       L_59BD                          ; 59D5   0220 0019

        MVI     G_01A1, R5                      ; 59D7   0285 01A1
        XORR    R0,     R5                      ; 59D9   01C5
        ANDI    #$0001, R5                      ; 59DA   03BD 0001
        BNEQ    L_59D4                          ; 59DC   022C 0009

        MVII    #$0007, R4                      ; 59DE   02BC 0007

        JSR     R5,     L_5A54                  ; 59E0   0004 0158 0254

        INCR    R5                              ; 59E3   000D
        DIS                                     ; 59E4   0003
L_59E5:
        PSHR    R5                              ; 59E5   0275
        MVII    #$0007, R4                      ; 59E6   02BC 0007
        SUBI    #$0002, R3                      ; 59E8   033B 0002

        JSR     R5,     L_5A20                  ; 59EA   0004 0158 0220

        ADDI    #$0002, R3                      ; 59ED   02FB 0002
        CMPI    #$003C, R4                      ; 59EF   037C 003C
        BGT     L_5A1F                          ; 59F1   020E 002C

        DECR    R6                              ; 59F3   0016
        PSHR    R0                              ; 59F4   0270
        PSHR    R5                              ; 59F5   0275
        MVI     G_0359, R0                      ; 59F6   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 59F8   0004 0114 0357
        JSR     R5,     L_5A37                  ; 59FB   0004 0158 0237

        PULR    R1                              ; 59FE   02B1
        PULR    R0                              ; 59FF   02B0
        CMPI    #$000A, R4                      ; 5A00   037C 000A
        BLE     L_5A17                          ; 5A02   0206 0013

        SUBR    R5,     R1                      ; 5A04   0129
        ANDI    #$000F, R1                      ; 5A05   03B9 000F
        BEQ     L_5A16                          ; 5A07   0204 000D

        MVII    #$0004, R4                      ; 5A09   02BC 0004
        CMPI    #$000C, R1                      ; 5A0B   0379 000C
        BLT     L_5A10                          ; 5A0D   0205 0001

        ADDR    R4,     R5                      ; 5A0F   00E5
L_5A10:
        CMPR    R4,     R1                      ; 5A10   0161
        BGT     L_5A1A                          ; 5A11   020E 0007

        SUBR    R4,     R5                      ; 5A13   0125
        B       L_5A1A                          ; 5A14   0200 0004

L_5A16:
        MOVR    R5,     R1                      ; 5A16   00A9
L_5A17:
        ADDI    #$0008, R1                      ; 5A17   02F9 0008
        INCR    R7                              ; 5A19   000F

L_5A1A:
        MOVR    R5,     R1                      ; 5A1A   00A9

L_5A1B:
        JSR     R5,     L_5330                  ; 5A1B   0004 0150 0330
        DECLE   $0019                           ; 5A1E   0019
L_5A1F:
        PULR    R7                              ; 5A1F   02B7

L_5A20:
        PSHR    R5                              ; 5A20   0275
        PSHR    R0                              ; 5A21   0270
        PSHR    R2                              ; 5A22   0272
        PSHR    R3                              ; 5A23   0273
        MOVR    R4,     R0                      ; 5A24   00A0

        JSR     R5,     .EXEC.772               ; 5A25   0004 0114 0372

        MOVR    R2,     R0                      ; 5A28   0090
        MOVR    R3,     R1                      ; 5A29   0099
        PULR    R3                              ; 5A2A   02B3
        PULR    R2                              ; 5A2B   02B2
        SUBR    R3,     R1                      ; 5A2C   0119
        SUBR    R2,     R0                      ; 5A2D   0110

        JSR     R5,     L_5A37                  ; 5A2E   0004 0158 0237

        ADDI    #$0008, R5                      ; 5A31   02FD 0008
        ANDI    #$000F, R5                      ; 5A33   03BD 000F
        PULR    R0                              ; 5A35   02B0
        PULR    R7                              ; 5A36   02B7

L_5A37:
        PSHR    R5                              ; 5A37   0275
        PSHR    R0                              ; 5A38   0270
        PSHR    R1                              ; 5A39   0271

        JSR     R5,     .EXEC.A2F               ; 5A3A   0004 0118 022F

        MOVR    R1,     R5                      ; 5A3D   008D
        PULR    R1                              ; 5A3E   02B1
        PULR    R0                              ; 5A3F   02B0
        INCR    R7                              ; 5A40   000F

L_5A41:
        PSHR    R5                              ; 5A41   0275
L_5A42:
        TSTR    R0                              ; 5A42   0080
        BPL     L_5A46                          ; 5A43   0203 0001

        NEGR    R0                              ; 5A45   0020
L_5A46:
        TSTR    R1                              ; 5A46   0089
        BPL     L_5A4A                          ; 5A47   0203 0001

        NEGR    R1                              ; 5A49   0021
L_5A4A:
        MOVR    R0,     R4                      ; 5A4A   0084
        CMPR    R0,     R1                      ; 5A4B   0141
        BLE     L_5A4F                          ; 5A4C   0206 0001

        MOVR    R1,     R4                      ; 5A4E   008C
L_5A4F:
        ADDR    R4,     R0                      ; 5A4F   00E0
        ADDR    R1,     R0                      ; 5A50   00C8
        SLR     R0,     1                       ; 5A51   0060
        MOVR    R0,     R4                      ; 5A52   0084
        PULR    R7                              ; 5A53   02B7

L_5A54:
        MVII    #$0032, R1                      ; 5A54   02B9 0032
        CMPI    #$003C, R3                      ; 5A56   037B 003C
        BLT     L_59BD                          ; 5A58   0225 009C

        NEGR    R1                              ; 5A5A   0021
        CMPI    #$0056, R3                      ; 5A5B   037B 0056
        BGT     L_59BD                          ; 5A5D   022E 00A1

        MOVR    R2,     R1                      ; 5A5F   0091
        MVI     G_01B0, R5                      ; 5A60   0285 01B0
        TSTR    R5                              ; 5A62   00AD
        BEQ     L_5A68                          ; 5A63   0204 0003

        NEGR    R1                              ; 5A65   0021
        ADDI    #$00A8, R1                      ; 5A66   02F9 00A8
L_5A68:
        ADDR    R3,     R1                      ; 5A68   00D9
        CMPI    #$0069, R1                      ; 5A69   0379 0069
        BGE     L_5A76                          ; 5A6B   020D 0009

        MVII    #$0032, R1                      ; 5A6D   02B9 0032
        SWAP    R1,     1                       ; 5A6F   0041
        TSTR    R5                              ; 5A70   00AD
        BEQ     L_59BD                          ; 5A71   0224 00B5

        NEGR    R1                              ; 5A73   0021
        B       L_59BD                          ; 5A74   0220 00B8

L_5A76:
        PSHR    R5                              ; 5A76   0275

        JSR     R5,     L_5A20                  ; 5A77   0004 0158 0220

        MOVR    R5,     R1                      ; 5A7A   00A9
        PULR    R5                              ; 5A7B   02B5
        SUB@    R5,     R4                      ; 5A7C   032C
        BLE     L_5A82                          ; 5A7D   0206 0003

        ADDI    #$0008, R1                      ; 5A7F   02F9 0008
        INCR    R7                              ; 5A81   000F

L_5A82:
        NEGR    R4                              ; 5A82   0024
L_5A83:
        CMP@    R5,     R4                      ; 5A83   036C
        BGT     L_5A1B                          ; 5A84   022E 006A

        SUBI    #$0004, R1                      ; 5A86   0339 0004
        B       L_5A1B                          ; 5A88   0220 006E

        PSHR    R5                              ; 5A8A   0275

        JSR     R5,     L_5C92                  ; 5A8B   0004 015C 0092
        JSR     R5,     L_5C3B                  ; 5A8E   0004 015C 003B
        JSR     R5,     L_5BE7                  ; 5A91   0004 0158 03E7

        MVI     G_01B2, R5                      ; 5A94   0285 01B2
        MVO     R5,     G_01B3                  ; 5A96   0245 01B3
        MVO     R4,     G_01B2                  ; 5A98   0244 01B2
        NOP                                     ; 5A9A   0034
        MVO     R3,     G_01AA                  ; 5A9B   0243 01AA
        MVO     R2,     G_01A9                  ; 5A9D   0242 01A9

        JSR     R5,     L_54A0                  ; 5A9F   0004 0154 00A0

        MVI     G_01A3, R0                      ; 5AA2   0280 01A3
        CMPI    #$0007, R0                      ; 5AA4   0378 0007
        BNEQ    L_5C79                          ; 5AA6   020C 01D1

        MVII    #$0005, R0                      ; 5AA8   02B8 0005

        JSR     R5,     X_SET_BIT               ; 5AAA   0004 0114 02DB

        CMP@    R2,     R5                      ; 5AAD   0355
        MVI     G_0359, R0                      ; 5AAE   0280 0359

        JSR     R5,     X_UNPK_BYTES            ; 5AB0   0004 0114 0357

        INCR    R4                              ; 5AB3   000C
        ADDR    R7,     R4                      ; 5AB4   00FC
        ADD@    R4,     R7                      ; 5AB5   02E7

        XORR    R0,     R3                      ; 5AB6   01C3
        INCR    R3                              ; 5AB7   000B
        XORR    R0,     R3                      ; 5AB8   01C3
        RLC     R3,     2                       ; 5AB9   0057
        SLR     R3,     2                       ; 5ABA   0067
        RRC     R2,     2                       ; 5ABB   0076
        MOVR    R2,     R5                      ; 5ABC   0095
        XORR    R0,     R3                      ; 5ABD   01C3
        SARC    R1,     2                       ; 5ABE   007D
        MOVR    R3,     R4                      ; 5ABF   009C
        MOVR    R5,     R6                      ; 5AC0   00AE
        MVI     G_031A, R3                      ; 5AC1   0283 031A
        SWAP    R3,     1                       ; 5AC3   0043
        ANDI    #$00FF, R3                      ; 5AC4   03BB 00FF
        CMPI    #$0045, R3                      ; 5AC6   037B 0045
        BLT     L_5B2C                          ; 5AC8   0205 0062

        CMPI    #$004D, R3                      ; 5ACA   037B 004D
        BGT     L_5B1D                          ; 5ACC   020E 004F

        MVI     G_01B3, R4                      ; 5ACE   0284 01B3
        SDBD                                    ; 5AD0   0001
        CMPI    #$0003, R4                      ; 5AD1   037C 0003 0000
        BEQ     L_5B0D                          ; 5AD4   0204 0037

        SDBD                                    ; 5AD6   0001
        CMPI    #$0007, R4                      ; 5AD7   037C 0007 0000
        BEQ     L_5B0D                          ; 5ADA   0204 0031

L_5ADC:
        MVI     G_01B0, R4                      ; 5ADC   0284 01B0
        MOVR    R4,     R3                      ; 5ADE   00A3
        XORI    #$0001, R4                      ; 5ADF   03FC 0001
        ADDI    #$01B7, R4                      ; 5AE1   02FC 01B7
        ADDI    #$01B7, R3                      ; 5AE3   02FB 01B7
        MVI@    R4,     R0                      ; 5AE5   02A0
        TSTR    R0                              ; 5AE6   0080
        BNEQ    L_5AEA                          ; 5AE7   020C 0001

        MVO@    R0,     R3                      ; 5AE9   0258
L_5AEA:
        MVII    #$01A6, R3                      ; 5AEA   02BB 01A6
        SUB     G_01B0, R3                      ; 5AEC   0303 01B0
        MVI@    R3,     R5                      ; 5AEE   029D
        INCR    R5                              ; 5AEF   000D
        MVO@    R5,     R3                      ; 5AF0   025D
        CLRR    R5                              ; 5AF1   01ED
        MVO     R5,     G_0351                  ; 5AF2   0245 0351

        JSR     R5,     L_5747                  ; 5AF4   0004 0154 0347
        JSR     R5,     L_514D                  ; 5AF7   0004 0150 014D
        JSR     R5,     L_5CC8                  ; 5AFA   0004 015C 00C8

        MVII    #$0005, R0                      ; 5AFD   02B8 0005

        JSR     R5,     X_PLAY_CHEER1           ; 5AFF   0004 011C 02D5

        MVII    #$0002, R0                      ; 5B02   02B8 0002

        JSR     R5,     X_CLR_BIT               ; 5B04   0004 0114 02E6

        ANDR    R3,     R5                      ; 5B07   019D
        PULR    R5                              ; 5B08   02B5

        JSR     R5,     L_5CF1                  ; 5B09   0004 015C 00F1

        PULR    R7                              ; 5B0C   02B7

L_5B0D:
        MVI     G_01B3, R4                      ; 5B0D   0284 01B3
        SDBD                                    ; 5B0F   0001
        CMPI    #$0002, R4                      ; 5B10   037C 0002 0000
        BEQ     L_5ADC                          ; 5B13   0224 0038

        CMPR    R0,     R1                      ; 5B15   0141
        BLT     L_5B33                          ; 5B16   0205 001B

        TSTR    R0                              ; 5B18   0080
        BMI     L_5B59                          ; 5B19   020B 003E
        B       L_5B58                          ; 5B1B   0200 003B

L_5B1D:
        TSTR    R1                              ; 5B1D   0089
        BPL     L_5B2F                          ; 5B1E   0203 000F

L_5B20:
        MOVR    R3,     R5                      ; 5B20   009D
        MVI     G_031A, R3                      ; 5B21   0283 031A
        SWAP    R3,     1                       ; 5B23   0043
        ANDI    #$00FF, R3                      ; 5B24   03BB 00FF
        CMPR    R3,     R5                      ; 5B26   015D
        BEQ     L_5B33                          ; 5B27   0204 000A

        NEGR    R1                              ; 5B29   0021
        B       L_5B34                          ; 5B2A   0200 0008

L_5B2C:
        TSTR    R1                              ; 5B2C   0089
        BPL     L_5B20                          ; 5B2D   0223 000E

L_5B2F:
        CMPI    #$0000, R0                      ; 5B2F   0378 0000
        BLE     L_5B20                          ; 5B31   0226 0012

L_5B33:
        NEGR    R0                              ; 5B33   0020
L_5B34:
        MOVR    R0,     R3                      ; 5B34   0083
        SAR     R3,     2                       ; 5B35   006F
        SUBR    R3,     R0                      ; 5B36   0118
        MOVR    R1,     R3                      ; 5B37   008B
        SAR     R3,     2                       ; 5B38   006F
        SUBR    R3,     R1                      ; 5B39   0119

        JSR     R5,     X_PACK_BYTES            ; 5B3A   0004 0114 034F

        MVO     R0,     G_0359                  ; 5B3D   0240 0359
        MVI     G_0319, R3                      ; 5B3F   0283 0319
        MVO     R3,     G_0317                  ; 5B41   0243 0317
        MVI     G_031A, R3                      ; 5B43   0283 031A
        MVO     R3,     G_0318                  ; 5B45   0243 0318

        JSR     R5,     L_5FD4                  ; 5B47   0004 015C 03D4

        PULR    R7                              ; 5B4A   02B7

        MVII    #$0005, R0                      ; 5B4B   02B8 0005

        JSR     R5,     X_CLR_BIT               ; 5B4D   0004 0114 02E6

        CMP@    R2,     R5                      ; 5B50   0355
        PULR    R7                              ; 5B51   02B7

        CMPR    R0,     R1                      ; 5B52   0141
        BGT     L_5B33                          ; 5B53   022E 0021

        TSTR    R0                              ; 5B55   0080
        BPL     L_5B59                          ; 5B56   0203 0001

L_5B58:
        NEGR    R0                              ; 5B58   0020
L_5B59:
        MOVR    R1,     R5                      ; 5B59   008D
        ADDR    R0,     R1                      ; 5B5A   00C1
        SUBR    R5,     R0                      ; 5B5B   0128
        MOVR    R0,     R3                      ; 5B5C   0083
        SAR     R3,     2                       ; 5B5D   006F
        SUBR    R3,     R0                      ; 5B5E   0118
        MOVR    R1,     R3                      ; 5B5F   008B
        SAR     R3,     2                       ; 5B60   006F
        SUBR    R3,     R1                      ; 5B61   0119
        B       L_5B34                          ; 5B62   0220 002F

        XORR    R0,     R1                      ; 5B64   01C1
        XORR    R1,     R0                      ; 5B65   01C8
        XORR    R0,     R1                      ; 5B66   01C1
        SAR     R1,     1                       ; 5B67   0069
        CMPR    R0,     R1                      ; 5B68   0141
        BLE     L_5B34                          ; 5B69   0226 0036

        MOVR    R0,     R1                      ; 5B6B   0081
        B       L_5B34                          ; 5B6C   0220 0039

        PSHR    R5                              ; 5B6E   0275

        JSR     R5,     L_534E                  ; 5B6F   0004 0150 034E
        JSR     R5,     L_5C89                  ; 5B72   0004 015C 0089
        JSR     R5,     L_5C3B                  ; 5B75   0004 015C 003B
        JSR     R5,     L_5BE4                  ; 5B78   0004 0158 03E4

        ADDI    #$0004, R1                      ; 5B7B   02F9 0004
        PSHR    R1                              ; 5B7D   0271
        MVI@    R1,     R0                      ; 5B7E   0288

        JSR     R5,     X_UNPK_BYTES            ; 5B7F   0004 0114 0357

        PULR    R5                              ; 5B82   02B5
        INCR    R4                              ; 5B83   000C
        ADDR    R7,     R4                      ; 5B84   00FC
        ADD@    R4,     R7                      ; 5B85   02E7

        ADDR    R6,     R3                      ; 5B86   00F3
        DECR    R5                              ; 5B87   0015
        DECR    R5                              ; 5B88   0015
        DECR    R5                              ; 5B89   0015
        SLL     R3,     2                       ; 5B8A   004F
        SLL     R3,     2                       ; 5B8B   004F
        ADDR    R6,     R3                      ; 5B8C   00F3
        INCR    R3                              ; 5B8D   000B
        SLLC    R3,     1                       ; 5B8E   005B
        DECR    R5                              ; 5B8F   0015
        COMR    R3                              ; 5B90   001B
        CMPI    #$0045, R3                      ; 5B91   037B 0045
        BEQ     L_5BD1                          ; 5B93   0204 003C
        BLT     L_5C79                          ; 5B95   0205 00E2

        CMPI    #$004D, R3                      ; 5B97   037B 004D
        BEQ     L_5BCC                          ; 5B99   0204 0031

L_5B9B:
        SUBR    R1,     R0                      ; 5B9B   0108
        MOVR    R0,     R1                      ; 5B9C   0081
        NEGR    R1                              ; 5B9D   0021
        INCR    R1                              ; 5B9E   0009
        B       L_5BA3                          ; 5B9F   0200 0002

        ADDR    R1,     R0                      ; 5BA1   00C8
        MOVR    R0,     R1                      ; 5BA2   0081
L_5BA3:
        SAR     R0,     1                       ; 5BA3   0068
        SAR     R1,     1                       ; 5BA4   0069
L_5BA5:
        MOVR    R5,     R2                      ; 5BA5   00AA

        JSR     R5,     X_PACK_BYTES            ; 5BA6   0004 0114 034F

        MVO@    R0,     R2                      ; 5BA9   0250
        MVI     G_0319, R1                      ; 5BAA   0281 0319
        MVI     G_031A, R2                      ; 5BAC   0282 031A

        JSR     R5,     .EXEC.477               ; 5BAE   0004 0114 0077

        SDBD                                    ; 5BB1   0001
        CMPI    #$0800, R1                      ; 5BB2   0379 0000 0008
        BNC     L_5BC5                          ; 5BB5   0209 000E

        SDBD                                    ; 5BB7   0001
        CMPI    #$3A00, R2                      ; 5BB8   037A 0000 003A
        BNC     L_5BC3                          ; 5BBB   0209 0006

        SDBD                                    ; 5BBD   0001
        CMPI    #$5900, R2                      ; 5BBE   037A 0000 0059
        BNC     L_5BC7                          ; 5BC1   0209 0004

L_5BC3:
        MVI     G_031A, R2                      ; 5BC3   0282 031A
L_5BC5:
        MVI     G_0319, R1                      ; 5BC5   0281 0319
L_5BC7:
        MVO     R1,     G_0317                  ; 5BC7   0241 0317
        MVO     R2,     G_0318                  ; 5BC9   0242 0318
        PULR    R7                              ; 5BCB   02B7

L_5BCC:
        TSTR    R1                              ; 5BCC   0089
        BPL     L_5B9B                          ; 5BCD   0223 0033
        B       L_5BD5                          ; 5BCF   0200 0004

L_5BD1:
        CMPI    #$0000, R1                      ; 5BD1   0379 0000
        BLE     L_5B9B                          ; 5BD3   0226 0039

L_5BD5:
        MOVR    R3,     R5                      ; 5BD5   009D
        MVI     G_031A, R3                      ; 5BD6   0283 031A
        SWAP    R3,     1                       ; 5BD8   0043
        ANDI    #$00FF, R3                      ; 5BD9   03BB 00FF
        CMPR    R3,     R5                      ; 5BDB   015D
        BEQ     L_5BE1                          ; 5BDC   0204 0003

        CLRR    R1                              ; 5BDE   01C9
        B       L_5BA5                          ; 5BDF   0220 003B

L_5BE1:
        CLRR    R0                              ; 5BE1   01C0
        B       L_5BA5                          ; 5BE2   0220 003E

L_5BE4:
        MVII    #$0003, R4                      ; 5BE4   02BC 0003
        INCR    R7                              ; 5BE6   000F

L_5BE7:
        CLRR    R4                              ; 5BE7   01E4
L_5BE8:
        PSHR    R5                              ; 5BE8   0275
        PSHR    R1                              ; 5BE9   0271
        MVII    #$0315, R1                      ; 5BEA   02B9 0315

        JSR     R5,     .EXEC.777               ; 5BEC   0004 0114 0377

        SUBR    R4,     R2                      ; 5BEF   0122
        MVII    #$000A, R4                      ; 5BF0   02BC 000A
        MOVR    R3,     R1                      ; 5BF2   0099
        MOVR    R3,     R5                      ; 5BF3   009D
        SUBR    R2,     R1                      ; 5BF4   0111
        ADDR    R2,     R5                      ; 5BF5   00D5
        CMPI    #$0051, R1                      ; 5BF6   0379 0051
        BGE     L_5C39                          ; 5BF8   020D 003F

        DECR    R4                              ; 5BFA   0014
        CMPI    #$0055, R5                      ; 5BFB   037D 0055
        BLE     L_5C39                          ; 5BFD   0206 003A

        DECR    R4                              ; 5BFF   0014
        CMPI    #$0004, R2                      ; 5C00   037A 0004
        BLE     L_5C39                          ; 5C02   0206 0035

        DECR    R4                              ; 5C04   0014
        CMPI    #$001E, R2                      ; 5C05   037A 001E
        BGE     L_5C38                          ; 5C07   020D 002F

        CMPI    #$0064, R5                      ; 5C09   037D 0064
        BGE     L_5C38                          ; 5C0B   020D 002B

        CMPI    #$004E, R3                      ; 5C0D   037B 004E
        BGE     L_5C38                          ; 5C0F   020D 0027

        CMPI    #$0040, R3                      ; 5C11   037B 0040
        BLE     L_5C38                          ; 5C13   0206 0023

        CMPI    #$0056, R5                      ; 5C15   037D 0056
        BLE     L_5C38                          ; 5C17   0206 001F

        CMPI    #$005C, R5                      ; 5C19   037D 005C
        BLE     L_5C39                          ; 5C1B   0206 001C

        DECR    R4                              ; 5C1D   0014
        CMPI    #$0044, R3                      ; 5C1E   037B 0044
        BLE     L_5C39                          ; 5C20   0206 0017

        DECR    R4                              ; 5C22   0014
        CMPI    #$0045, R3                      ; 5C23   037B 0045
        BLE     L_5C39                          ; 5C25   0206 0012

        DECR    R4                              ; 5C27   0014
        CMPI    #$004D, R3                      ; 5C28   037B 004D
        BGE     L_5C39                          ; 5C2A   020D 000D

        DECR    R4                              ; 5C2C   0014
        CMPI    #$005F, R5                      ; 5C2D   037D 005F
        BLE     L_5C39                          ; 5C2F   0206 0008

        DECR    R4                              ; 5C31   0014
        CMPI    #$0062, R5                      ; 5C32   037D 0062
        BGE     L_5C39                          ; 5C34   020D 0003

        DECR    R4                              ; 5C36   0014
        INCR    R7                              ; 5C37   000F

L_5C38:
        CLRR    R4                              ; 5C38   01E4
L_5C39:
        PULR    R1                              ; 5C39   02B1
        PULR    R7                              ; 5C3A   02B7

L_5C3B:
        CLRR    R4                              ; 5C3B   01E4
        MVI     G_031B, R1                      ; 5C3C   0281 031B
        ADDI    #$0002, R1                      ; 5C3E   02F9 0002
        MVI@    R1,     R2                      ; 5C40   028A
        SDBD                                    ; 5C41   0001
        CMPI    #$5400, R2                      ; 5C42   037A 0000 0054
        ADCR    R4                              ; 5C45   002C
        MVO     R4,     G_01B0                  ; 5C46   0244 01B0
        MOVR    R7,     R4                      ; 5C48   00BC
        ADDI    #$0010, R4                      ; 5C49   02FC 0010
        PSHR    R4                              ; 5C4B   0274
        PSHR    R5                              ; 5C4C   0275
        MOVR    R1,     R4                      ; 5C4D   008C
        MVI@    R4,     R2                      ; 5C4E   02A2

        JSR     R5,     L_5C7A                  ; 5C4F   0004 015C 007A

        MVO     R2,     G_0317                  ; 5C52   0242 0317
        MVI@    R4,     R2                      ; 5C54   02A2
        MVO     R2,     G_0318                  ; 5C55   0242 0318
        B       L_5C66                          ; 5C57   0200 000D

        MVI     G_031B, R4                      ; 5C59   0284 031B
        ADDI    #$0002, R4                      ; 5C5B   02FC 0002
        MVI     G_0317, R2                      ; 5C5D   0282 0317

        JSR     R5,     L_5C7A                  ; 5C5F   0004 015C 007A

        MVO@    R2,     R4                      ; 5C62   0262
        MVI     G_0318, R2                      ; 5C63   0282 0318
        MVO@    R2,     R4                      ; 5C65   0262
L_5C66:
        TSTR    R3                              ; 5C66   009B
        BEQ     L_5C75                          ; 5C67   0204 000C

        MVI     G_031B, R1                      ; 5C69   0281 031B
        ADDI    #$0004, R1                      ; 5C6B   02F9 0004
        MVI@    R1,     R0                      ; 5C6D   0288
        SDBD                                    ; 5C6E   0001
        XORI    #$FF00, R0                      ; 5C6F   03F8 0000 00FF
        ADDI    #$0100, R0                      ; 5C72   02F8 0100
        MVO@    R0,     R1                      ; 5C74   0248
L_5C75:
        MVI     G_031B, R1                      ; 5C75   0281 031B
        MVI     G_011B, R0                      ; 5C77   0280 011B
L_5C79:
        PULR    R7                              ; 5C79   02B7

L_5C7A:
        MVI     G_01B0, R3                      ; 5C7A   0283 01B0
        TSTR    R3                              ; 5C7C   009B
        BEQ     L_5C88                          ; 5C7D   0204 0009

        MVII    #$00A8, R3                      ; 5C7F   02BB 00A8
        SWAP    R3,     1                       ; 5C81   0043
        NEGR    R2                              ; 5C82   0022
        ADDR    R3,     R2                      ; 5C83   00DA
        SUB     G_0319, R3                      ; 5C84   0303 0319
        MVO     R3,     G_0319                  ; 5C86   0243 0319
L_5C88:
        MOVR    R5,     R7                      ; 5C88   00AF

L_5C89:
        MVI@    R1,     R3                      ; 5C89   028B
        SDBD                                    ; 5C8A   0001
        XORI    #$8000, R3                      ; 5C8B   03FB 0000 0080
        MVO@    R3,     R1                      ; 5C8E   024B
        RLC     R3,     1                       ; 5C8F   0053
        BNC     L_5C93                          ; 5C90   0209 0001

L_5C92:
        PSHR    R5                              ; 5C92   0275
L_5C93:
        MOVR    R1,     R4                      ; 5C93   008C
        ADDI    #$0006, R4                      ; 5C94   02FC 0006
        MVII    #$0001, R5                      ; 5C96   02BD 0001
        MVO@    R5,     R4                      ; 5C98   0265
        PULR    R7                              ; 5C99   02B7

L_5C9A:
        PSHR    R5                              ; 5C9A   0275

        JSR     R5,     L_5CF1                  ; 5C9B   0004 015C 00F1

        MVII    #$01A7, R4                      ; 5C9E   02BC 01A7
        MVI@    R4,     R1                      ; 5CA0   02A1
        DECR    R4                              ; 5CA1   0014
        SDBD                                    ; 5CA2   0001
        MVI@    R4,     R0                      ; 5CA3   02A0
        TSTR    R1                              ; 5CA4   0089
        BNEQ    L_5CA9                          ; 5CA5   020C 0002

        SUBI    #$00C4, R0                      ; 5CA7   0338 00C4
L_5CA9:
        DECR    R0                              ; 5CA9   0010
        BEQ     L_5CE2                          ; 5CAA   0204 0036

        PULR    R5                              ; 5CAC   02B5
L_5CAD:
        MVO     R0,     G_01A7                  ; 5CAD   0240 01A7
        SWAP    R0,     1                       ; 5CAF   0040
        MVO     R0,     G_01A8                  ; 5CB0   0240 01A8
L_5CB2:
        PSHR    R5                              ; 5CB2   0275
        MVI     G_01A8, R0                      ; 5CB3   0280 01A8
        MVII    #$0002, R1                      ; 5CB5   02B9 0002
        SDBD                                    ; 5CB7   0001
        MVII    #$0006, R3                      ; 5CB8   02BB 0006 0000
        MVII    #$021B, R4                      ; 5CBB   02BC 021B

        JSR     R5,     X_PRNUM_RGT             ; 5CBD   0004 0118 00C5

        MVI     G_01A7, R0                      ; 5CC0   0280 01A7
        MVII    #$021E, R4                      ; 5CC2   02BC 021E

        JSR     R5,     X_PRNUM_ZRO             ; 5CC4   0004 0118 00AD

        PULR    R7                              ; 5CC7   02B7

L_5CC8:
        PSHR    R5                              ; 5CC8   0275
        SDBD                                    ; 5CC9   0001
        MVII    #$0003, R3                      ; 5CCA   02BB 0003 0000
        MVII    #$0002, R1                      ; 5CCD   02B9 0002
        MVII    #$022A, R4                      ; 5CCF   02BC 022A
        MVI     G_01A5, R0                      ; 5CD1   0280 01A5

        JSR     R5,     X_PRNUM_RGT             ; 5CD3   0004 0118 00C5

        SDBD                                    ; 5CD6   0001
        MVII    #$0005, R3                      ; 5CD7   02BB 0005 0000
        MVII    #$0238, R4                      ; 5CDA   02BC 0238
        MVI     G_01A6, R0                      ; 5CDC   0280 01A6

        JSR     R5,     X_PRNUM_LFT             ; 5CDE   0004 0118 009E

        PULR    R7                              ; 5CE1   02B7

L_5CE2:
        JSR     R5,     L_5CAD                  ; 5CE2   0004 015C 00AD
        JSR     R5,     L_504C                  ; 5CE5   0004 0150 004C
        JSR     R5,     L_5172                  ; 5CE8   0004 0150 0172

        MVII    #$0014, R0                      ; 5CEB   02B8 0014

        JSR     R5,     X_PLAY_RAZZ4            ; 5CED   0004 011C 02C4

        PULR    R7                              ; 5CF0   02B7

L_5CF1:
        PSHR    R5                              ; 5CF1   0275
        MVII    #$01B7, R2                      ; 5CF2   02BA 01B7
        MVII    #$0002, R0                      ; 5CF4   02B8 0002
        MVII    #$0251, R4                      ; 5CF6   02BC 0251
        MVII    #$0003, R3                      ; 5CF8   02BB 0003

        JSR     R5,     L_5D04                  ; 5CFA   0004 015C 0104

        INCR    R0                              ; 5CFD   0008
        INCR    R2                              ; 5CFE   000A
        MVII    #$025F, R4                      ; 5CFF   02BC 025F
        MVII    #$0005, R3                      ; 5D01   02BB 0005
        INCR    R7                              ; 5D03   000F

L_5D04:
        PSHR    R5                              ; 5D04   0275
L_5D05:
        PSHR    R0                              ; 5D05   0270
        MVI@    R2,     R1                      ; 5D06   0291
        TSTR    R1                              ; 5D07   0089
        BNEQ    L_5D12                          ; 5D08   020C 0008

        CLRR    R3                              ; 5D0A   01DB
        MVII    #$0004, R0                      ; 5D0B   02B8 0004

        JSR     R5,     X_FILL_ZERO             ; 5D0D   0004 0114 0338

L_5D10:
        PULR    R0                              ; 5D10   02B0
        PULR    R7                              ; 5D11   02B7

L_5D12:
        MOVR    R1,     R0                      ; 5D12   0088
        ANDI    #$003F, R0                      ; 5D13   03B8 003F
        BNEQ    L_5D1B                          ; 5D15   020C 0004

        SUBI    #$0004, R1                      ; 5D17   0339 0004
        B       L_5D12                          ; 5D19   0220 0008

L_5D1B:
        PSHR    R1                              ; 5D1B   0271
        XORR    R0,     R1                      ; 5D1C   01C1
        SLR     R1,     2                       ; 5D1D   0065
        SLR     R1,     1                       ; 5D1E   0061
        DECR    R0                              ; 5D1F   0010
        ADDI    #$0080, R1                      ; 5D20   02F9 0080
        XORR    R3,     R1                      ; 5D22   01D9
        MVO@    R1,     R4                      ; 5D23   0261
        MOVR    R3,     R5                      ; 5D24   009D
        ADDI    #$00D0, R5                      ; 5D25   02FD 00D0
        MVO@    R5,     R4                      ; 5D27   0265
        MVII    #$0002, R1                      ; 5D28   02B9 0002

        JSR     R5,     X_PRNUM_ZRO             ; 5D2A   0004 0118 00AD

        PULR    R1                              ; 5D2D   02B1
        DECR    R1                              ; 5D2E   0011
        MVO@    R1,     R2                      ; 5D2F   0251
        BNEQ    L_5D10                          ; 5D30   022C 0021

        PULR    R0                              ; 5D32   02B0

        JSR     R5,     .EXEC.76C               ; 5D33   0004 0114 036C

        MVI@    R1,     R5                      ; 5D36   028D
        SDBD                                    ; 5D37   0001
        ANDI    #$FFF7, R5                      ; 5D38   03BD 00F7 00FF
        SDBD                                    ; 5D3B   0001
        XORI    #$0800, R5                      ; 5D3C   03FD 0000 0008
        MVO@    R5,     R1                      ; 5D3F   024D
        ADDI    #$0003, R1                      ; 5D40   02F9 0003
        MVI@    R1,     R5                      ; 5D42   028D
        ADDI    #$0100, R5                      ; 5D43   02FD 0100
        MVO@    R5,     R1                      ; 5D45   024D
        ADDI    #$0002, R1                      ; 5D46   02F9 0002
        CLRR    R5                              ; 5D48   01ED
        MVO@    R5,     R1                      ; 5D49   024D
        PULR    R7                              ; 5D4A   02B7

L_5D4B:
        PSHR    R5                              ; 5D4B   0275
        MVII    #$0163, R4                      ; 5D4C   02BC 0163
        CLRR    R0                              ; 5D4E   01C0
L_5D4F:
        MVI@    R4,     R2                      ; 5D4F   02A2
        MVI@    R4,     R3                      ; 5D50   02A3
        TSTR    R3                              ; 5D51   009B
        BEQ     L_5DBF                          ; 5D52   0204 006B

        PSHR    R0                              ; 5D54   0270
        PSHR    R4                              ; 5D55   0274

        JSR     R5,     .EXEC.76C               ; 5D56   0004 0114 036C

        PSHR    R1                              ; 5D59   0271
        MVI@    R1,     R4                      ; 5D5A   028C
        SDBD                                    ; 5D5B   0001
        ANDI    #$B7F7, R4                      ; 5D5C   03BC 00F7 00B7
        SDBD                                    ; 5D5F   0001
        XORI    #$0800, R4                      ; 5D60   03FC 0000 0008
        MVO@    R4,     R1                      ; 5D63   024C
        MOVR    R1,     R4                      ; 5D64   008C
        ADDI    #$0002, R4                      ; 5D65   02FC 0002

        JSR     R5,     .EXEC.784               ; 5D67   0004 0114 0384

        PULR    R4                              ; 5D6A   02B4
        ADDI    #$0004, R4                      ; 5D6B   02FC 0004
        MVI@    R4,     R3                      ; 5D6D   02A3
        CMPI    #$0064, R2                      ; 5D6E   037A 0064
        BNC     L_5D92                          ; 5D70   0209 0020

        JSR     R5,     .EXEC.A2F               ; 5D72   0004 0118 022F

        MOVR    R1,     R2                      ; 5D75   008A
        MOVR    R3,     R0                      ; 5D76   0098

        JSR     R5,     X_UNPK_BYTES            ; 5D77   0004 0114 0357

        SLL     R1,     1                       ; 5D7A   0049

        JSR     R5,     .EXEC.A2F               ; 5D7B   0004 0118 022F

        SUBR    R1,     R2                      ; 5D7E   010A
        ANDI    #$000F, R2                      ; 5D7F   03BA 000F
        CMPI    #$0008, R2                      ; 5D81   037A 0008
        BLE     L_5D87                          ; 5D83   0206 0002

        ADDI    #$0004, R1                      ; 5D85   02F9 0004
L_5D87:
        ADDR    R2,     R1                      ; 5D87   00D1
        SLR     R2,     2                       ; 5D88   0066
        SUBR    R2,     R1                      ; 5D89   0111
        PULR    R4                              ; 5D8A   02B4
        MVII    #$0023, R0                      ; 5D8B   02B8 0023

        JSR     R5,     L_5332                  ; 5D8D   0004 0150 0332

        B       L_5DBF                          ; 5D90   0200 002D

L_5D92:
        CMPI    #$0005, R2                      ; 5D92   037A 0005
        BNC     L_5DAF                          ; 5D94   0209 0019

        MOVR    R0,     R2                      ; 5D96   0082
        MOVR    R3,     R0                      ; 5D97   0098
        MOVR    R1,     R3                      ; 5D98   008B

        JSR     R5,     X_UNPK_BYTES            ; 5D99   0004 0114 0357

        SLL     R2,     1                       ; 5D9C   004A
        SUBR    R0,     R2                      ; 5D9D   0102

        JSR     R5,     L_5DC7                  ; 5D9E   0004 015C 01C7

        MOVR    R2,     R0                      ; 5DA1   0090
        MOVR    R3,     R2                      ; 5DA2   009A
        SLL     R2,     1                       ; 5DA3   004A
        SUBR    R1,     R2                      ; 5DA4   010A

        JSR     R5,     L_5DC7                  ; 5DA5   0004 015C 01C7

        MOVR    R2,     R1                      ; 5DA8   0091
        PULR    R4                              ; 5DA9   02B4

        JSR     R5,     L_5338                  ; 5DAA   0004 0150 0338

        B       L_5DBF                          ; 5DAD   0200 0010

L_5DAF:
        MOVR    R4,     R1                      ; 5DAF   00A1

        JSR     R5,     .EXEC.766               ; 5DB0   0004 0114 0366

        CLRR    R1                              ; 5DB3   01C9

        JSR     R5,     L_533F                  ; 5DB4   0004 0150 033F
        JSR     R5,     .EXEC.76C               ; 5DB7   0004 0114 036C
        JSR     R5,     L_5E1F                  ; 5DBA   0004 015C 021F

        PULR    R4                              ; 5DBD   02B4
        PULR    R0                              ; 5DBE   02B0
L_5DBF:
        ADDI    #$0006, R4                      ; 5DBF   02FC 0006
        INCR    R0                              ; 5DC1   0008
        CMPI    #$0008, R0                      ; 5DC2   0378 0008
        BMI     L_5D4F                          ; 5DC4   022B 0076
        PULR    R7                              ; 5DC6   02B7

L_5DC7:
        PSHR    R5                              ; 5DC7   0275
        SLL     R2,     1                       ; 5DC8   004A
        MVII    #$001E, R5                      ; 5DC9   02BD 001E
        CMPR    R5,     R2                      ; 5DCB   016A
        BPL     L_5DD2                          ; 5DCC   0203 0004

        NEGR    R5                              ; 5DCE   0025
        CMPR    R5,     R2                      ; 5DCF   016A
        BGE     L_5DD3                          ; 5DD0   020D 0001

L_5DD2:
        MOVR    R5,     R2                      ; 5DD2   00AA
L_5DD3:
        PULR    R7                              ; 5DD3   02B7

L_5DD4:
        PSHR    R5                              ; 5DD4   0275
        PSHR    R0                              ; 5DD5   0270
        SLL     R0,     2                       ; 5DD6   004C
        SLL     R0,     1                       ; 5DD7   0048
        MOVR    R0,     R5                      ; 5DD8   0085
        ADDI    #$0163, R5                      ; 5DD9   02FD 0163
        MOVR    R1,     R0                      ; 5DDB   0088
        SWAP    R0,     1                       ; 5DDC   0040
        MVO@    R0,     R5                      ; 5DDD   0268
        MVO@    R1,     R5                      ; 5DDE   0269
        PULR    R0                              ; 5DDF   02B0
        PULR    R7                              ; 5DE0   02B7

L_5DE1:
        PSHR    R5                              ; 5DE1   0275
        MVI@    R4,     R2                      ; 5DE2   02A2
        MVO     R2,     G_01AB                  ; 5DE3   0242 01AB
        SWAP    R2,     1                       ; 5DE5   0042
        MVO     R2,     G_01AD                  ; 5DE6   0242 01AD
        MVI@    R4,     R2                      ; 5DE8   02A2
        MVO     R2,     G_01AC                  ; 5DE9   0242 01AC
        MVII    #$0017, R0                      ; 5DEB   02B8 0017
        MVO     R0,     G_019D                  ; 5DED   0240 019D
        PULR    R7                              ; 5DEF   02B7

L_5DF0:
        MOVR    R5,     R4                      ; 5DF0   00AC

        JSR     R5,     L_5DD4                  ; 5DF1   0004 015C 01D4

        PSHR    R0                              ; 5DF4   0270

        JSR     R5,     L_5DE1                  ; 5DF5   0004 015C 01E1

        MVII    #$0001, R0                      ; 5DF8   02B8 0001
        MVO     R0,     G_01AF                  ; 5DFA   0240 01AF
        PULR    R0                              ; 5DFC   02B0
        MOVR    R4,     R7                      ; 5DFD   00A7

L_5DFE:
        PSHR    R5                              ; 5DFE   0275

        JSR     R5,     L_5DE1                  ; 5DFF   0004 015C 01E1

        XORI    #$0008, R0                      ; 5E02   03F8 0008
        MVO     R0,     G_019D                  ; 5E04   0240 019D
        CLRR    R0                              ; 5E06   01C0
L_5E07:
        MVI@    R4,     R1                      ; 5E07   02A1
        SWAP    R1,     1                       ; 5E08   0041
        SARC    R1,     1                       ; 5E09   0079
        RRC     R2,     1                       ; 5E0A   0072
        DECR    R4                              ; 5E0B   0014
        SDBD                                    ; 5E0C   0001
        MVI@    R4,     R1                      ; 5E0D   02A1

        JSR     R5,     L_5DD4                  ; 5E0E   0004 015C 01D4

        INCR    R0                              ; 5E11   0008
        CMPI    #$0008, R0                      ; 5E12   0378 0008
        BMI     L_5E07                          ; 5E14   022B 000E

        MVO     R0,     G_01AF                  ; 5E16   0240 01AF
        SWAP    R2,     1                       ; 5E18   0042
        MVO     R2,     G_01AE                  ; 5E19   0242 01AE

        JSR     R5,     L_51A0                  ; 5E1B   0004 0150 01A0

        PULR    R7                              ; 5E1E   02B7

L_5E1F:
        PSHR    R5                              ; 5E1F   0275
        MOVR    R0,     R3                      ; 5E20   0083
        SLL     R3,     2                       ; 5E21   004F
        SLL     R3,     1                       ; 5E22   004B
        ADDI    #$0164, R3                      ; 5E23   02FB 0164
        MVI     G_01AD, R2                      ; 5E25   0282 01AD
        INCR    R1                              ; 5E27   0009
        DECR    R2                              ; 5E28   0012
        BEQ     L_5E47                          ; 5E29   0204 001C

        JSR     R5,     X_POW2                  ; 5E2B   0004 0114 0345

        DECR    R1                              ; 5E2E   0011
        MVI@    R1,     R5                      ; 5E2F   028D
        SDBD                                    ; 5E30   0001
        ANDI    #$FDFF, R5                      ; 5E31   03BD 00FF 00FD
        AND     G_01AE, R0                      ; 5E34   0380 01AE
        BEQ     L_5E3A                          ; 5E36   0204 0002

        XORI    #$0200, R5                      ; 5E38   03FD 0200
L_5E3A:
        MVO@    R5,     R1                      ; 5E3A   024D
        CLRR    R5                              ; 5E3B   01ED
        ADDI    #$0004, R1                      ; 5E3C   02F9 0004
        MVO@    R5,     R1                      ; 5E3E   024D
        MOVR    R3,     R5                      ; 5E3F   009D
        DECR    R5                              ; 5E40   0015
        SDBD                                    ; 5E41   0001
        MVI@    R5,     R2                      ; 5E42   02AA
        DECR    R1                              ; 5E43   0011
        MVO@    R2,     R1                      ; 5E44   024A
        DECR    R1                              ; 5E45   0011
        SWAP    R2,     1                       ; 5E46   0042
L_5E47:
        MVO@    R2,     R1                      ; 5E47   024A
        CLRR    R5                              ; 5E48   01ED
        MVO@    R5,     R3                      ; 5E49   025D
        MVI     G_01AF, R0                      ; 5E4A   0280 01AF
        DECR    R0                              ; 5E4C   0010
        BEQ     L_5E52                          ; 5E4D   0204 0003

        MVO     R0,     G_01AF                  ; 5E4F   0240 01AF
        PULR    R7                              ; 5E51   02B7

L_5E52:
        MVII    #$01AB, R4                      ; 5E52   02BC 01AB
        SDBD                                    ; 5E54   0001
        MVI@    R4,     R3                      ; 5E55   02A3
        DECR    R4                              ; 5E56   0014
        CLRR    R5                              ; 5E57   01ED
        MVO@    R5,     R4                      ; 5E58   0265
        PULR    R5                              ; 5E59   02B5
        MOVR    R3,     R7                      ; 5E5A   009F

        DECLE   $0010,  $0010,  $0000,  $0018   ; 5E5B   0010 0010 0000 0018
        DECLE   $007C,  $005C,  $0020,  $003C   ; 5E5F   007C 005C 0020 003C
        DECLE   $0018,  $0038,  $0026,  $0028   ; 5E63   0018 0038 0026 0028
        DECLE   $0068,  $0068,  $0018,  $0018   ; 5E67   0068 0068 0018 0018
        DECLE   $0300,  $0000,  $006E,  $005B   ; 5E6B   0300 0000 006E 005B
        DECLE   $0003,  $000C,  $0002,  $03DE   ; 5E6F   0003 000C 0002 03DE
        DECLE   $0153,  $0300,  $0000,  $0000   ; 5E73   0153 0300 0000 0000
        DECLE   $0059,  $0001,  $0000,  $0002   ; 5E77   0059 0001 0000 0002
        DECLE   $0388,  $0157,  $0300,  $0000   ; 5E7B   0388 0157 0300 0000
        DECLE   $006E,  $005B,  $0002,  $0008   ; 5E7F   006E 005B 0002 0008
        DECLE   $000C,  $0071,  $0056,  $0071   ; 5E83   000C 0071 0056 0071
        DECLE   $0156,  $0271,  $0056,  $0271   ; 5E87   0156 0271 0056 0271
        DECLE   $0156,  $0171,  $0056,  $0171   ; 5E8B   0156 0171 0056 0171
        DECLE   $0156,  $03BA,  $0053,  $008A   ; 5E8F   0156 03BA 0053 008A
        DECLE   $005A,  $0001,  $002C,  $0000   ; 5E93   005A 0001 002C 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5E97   0000 0000 0000 0000
        DECLE   $0040,  $0040,  $0020,  $0030   ; 5E9B   0040 0040 0020 0030
        DECLE   $0038,  $0038,  $0028,  $0038   ; 5E9F   0038 0038 0028 0038
        DECLE   $0018,  $0014,  $002A,  $0029   ; 5EA3   0018 0014 002A 0029
        DECLE   $0065,  $0000,  $0000,  $0000   ; 5EA7   0065 0000 0000 0000
        DECLE   $0040,  $0040,  $0020,  $0030   ; 5EAB   0040 0040 0020 0030
        DECLE   $0038,  $0039,  $0029,  $003F   ; 5EAF   0038 0039 0029 003F
        DECLE   $0018,  $0034,  $0022,  $0021   ; 5EB3   0018 0034 0022 0021
        DECLE   $0061,  $0000,  $0000,  $0000   ; 5EB7   0061 0000 0000 0000
        DECLE   $0040,  $0040,  $0020,  $0030   ; 5EBB   0040 0040 0020 0030
        DECLE   $0038,  $003C,  $002C,  $003C   ; 5EBF   0038 003C 002C 003C
        DECLE   $0018,  $0034,  $0012,  $0051   ; 5EC3   0018 0034 0012 0051
        DECLE   $00B1,  $0000,  $0000,  $0000   ; 5EC7   00B1 0000 0000 0000
        DECLE   $0040,  $0040,  $0020,  $0030   ; 5ECB   0040 0040 0020 0030
        DECLE   $0038,  $003C,  $002C,  $003C   ; 5ECF   0038 003C 002C 003C
        DECLE   $0018,  $0028,  $0010,  $004C   ; 5ED3   0018 0028 0010 004C
        DECLE   $0098,  $0000,  $0000,  $0000   ; 5ED7   0098 0000 0000 0000
        DECLE   $0040,  $0040,  $0020,  $0030   ; 5EDB   0040 0040 0020 0030
        DECLE   $0038,  $003C,  $002C,  $003C   ; 5EDF   0038 003C 002C 003C
        DECLE   $0018,  $0030,  $0010,  $0058   ; 5EE3   0018 0030 0010 0058
        DECLE   $00B4,  $0000,  $0000,  $0000   ; 5EE7   00B4 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5EEB   0000 0000 0000 0010
        DECLE   $0010,  $0008,  $003E,  $005A   ; 5EEF   0010 0008 003E 005A
        DECLE   $0040,  $0058,  $0038,  $0030   ; 5EF3   0040 0058 0038 0030
        DECLE   $0028,  $0066,  $006C,  $000C   ; 5EF7   0028 0066 006C 000C
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5EFB   0000 0000 0000 0010
        DECLE   $0010,  $0008,  $001E,  $0038   ; 5EFF   0010 0008 001E 0038
        DECLE   $0040,  $0058,  $0018,  $0028   ; 5F03   0040 0058 0018 0028
        DECLE   $0028,  $0044,  $00C4,  $0002   ; 5F07   0028 0044 00C4 0002
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F0B   0000 0000 0000 0000
        DECLE   $0009,  $0009,  $0006,  $001C   ; 5F0F   0009 0009 0006 001C
        DECLE   $002C,  $0040,  $001C,  $002C   ; 5F13   002C 0040 001C 002C
        DECLE   $0048,  $00CE,  $0002,  $0000   ; 5F17   0048 00CE 0002 0000
        DECLE   $0000,  $0000,  $0000           ; 5F1B   0000 0000 0000

        INCR    R1                              ; 5F1E   0009
        INCR    R2                              ; 5F1F   000A

        JSR     R4,     .EXEC.C38               ; 5F20   0004 001C 0038
        DECLE   $0058,  $0008,  $0038,  $0038   ; 5F23   0058 0008 0038 0038
        DECLE   $0050,  $00E0,  $0060,  $0000   ; 5F27   0050 00E0 0060 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F2B   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0004,  $0004   ; 5F2F   0000 0000 0004 0004
        DECLE   $0000,  $000E,  $0012,  $00BD   ; 5F33   0000 000E 0012 00BD
        DECLE   $00D9,  $0018,  $0030,  $0000   ; 5F37   00D9 0018 0030 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F3B   0000 0000 0000 0000
        DECLE   $0009,  $0009,  $0006,  $001C   ; 5F3F   0009 0009 0006 001C
        DECLE   $002C,  $0040,  $001C,  $002C   ; 5F43   002C 0040 001C 002C
        DECLE   $0048,  $00CE,  $0002,  $0000   ; 5F47   0048 00CE 0002 0000
        DECLE   $0000,  $0000,  $0000,  $0010   ; 5F4B   0000 0000 0000 0010
        DECLE   $0010,  $0008,  $003E,  $005A   ; 5F4F   0010 0008 003E 005A
        DECLE   $0040,  $0058,  $0038,  $0030   ; 5F53   0040 0058 0038 0030
        DECLE   $0028,  $0066,  $006C,  $000C   ; 5F57   0028 0066 006C 000C
        DECLE   $0020,  $0020,  $0010,  $0018   ; 5F5B   0020 0020 0010 0018
        DECLE   $0008,  $001C,  $0014,  $001F   ; 5F5F   0008 001C 0014 001F
        DECLE   $000D,  $0028,  $0026,  $0042   ; 5F63   000D 0028 0026 0042
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F67   0000 0000 0000 0000
        DECLE   $0010,  $0021,  $0032,  $00B4   ; 5F6B   0010 0021 0032 00B4
        DECLE   $00B8,  $0039,  $002A,  $000C   ; 5F6F   00B8 0039 002A 000C
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5F73   0020 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F77   0000 0000 0000 0000
        DECLE   $0014,  $0000,  $0014,  $0014   ; 5F7B   0014 0000 0014 0014
        DECLE   $001C,  $0030,  $0030,  $0060   ; 5F7F   001C 0030 0030 0060
        DECLE   $00F8,  $0070,  $0000,  $0020   ; 5F83   00F8 0070 0000 0020
        DECLE   $0020,  $0000,  $0000,  $0000   ; 5F87   0020 0000 0000 0000
        DECLE   $0044,  $0060,  $0014,  $0018   ; 5F8B   0044 0060 0014 0018
        DECLE   $0010,  $0020,  $0030,  $0030   ; 5F8F   0010 0020 0030 0030
        DECLE   $0018,  $001A,  $000A,  $0038   ; 5F93   0018 001A 000A 0038
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F97   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5F9B   0000 0000 0000 0000
        DECLE   $0004,  $0004,  $0000,  $000E   ; 5F9F   0004 0004 0000 000E
        DECLE   $000A,  $000D,  $001D,  $00BC   ; 5FA3   000A 000D 001D 00BC
        DECLE   $00CD,  $0018,  $0030,  $0000   ; 5FA7   00CD 0018 0030 0000
        DECLE   $0000,  $0004,  $0004,  $0000   ; 5FAB   0000 0004 0004 0000
        DECLE   $0004,  $003E,  $000D,  $001D   ; 5FAF   0004 003E 000D 001D
        DECLE   $0038,  $0028,  $0028,  $0028   ; 5FB3   0038 0028 0028 0028
        DECLE   $0000,  $0028,  $0000,  $0000   ; 5FB7   0000 0028 0000 0000
        DECLE   $0000,  $0000,  $0000,  $0000   ; 5FBB   0000 0000 0000 0000
        DECLE   $0000,  $0000,  $001C,  $0000   ; 5FBF   0000 0000 001C 0000
L_5FC3:
        PSHR    R5                              ; 5FC3   0275

        JSR     R5,     X_PLAY_SFX1             ; 5FC4   0004 0118 03BB
        DECLE   $0040,  $0028                   ; 5FC7  SFX data
        DECLE   $0048,  $002B                   ; 5FC9  SFX data
        DECLE   $0044,  $002E                   ; 5FCB  SFX data
        DECLE   $010D                           ; 5FCD  SFX data
        DECLE   $005B                           ; 5FCE  SFX data
        DECLE   $000C,  $0100                   ; 5FCF  SFX data
        DECLE   $0209                           ; 5FD1  SFX data
        DECLE   $000B                           ; 5FD2  SFX data
        DECLE   $03CF                           ; 5FD3  SFX end

L_5FD4:
        PSHR    R5                              ; 5FD4   0275
        CLRR    R0                              ; 5FD5   01C0

        JSR     R5,     X_PLAY_SFX1             ; 5FD6   0004 0118 03BB
        DECLE   $0040,  $0020                   ; 5FD9  SFX data
        DECLE   $0048,  $0022                   ; 5FDB  SFX data
        DECLE   $0044,  $0025                   ; 5FDD  SFX data
        DECLE   $030D                           ; 5FDF  SFX data
        DECLE   $0003,  $03B0                   ; 5FE0  SFX data
        DECLE   $0275                           ; 5FE2  SFX data
        DECLE   $0004,  $0118                   ; 5FE3  SFX data
        DECLE   $03BB                           ; 5FE5  SFX data
        DECLE   $0389                           ; 5FE6  SFX data
        DECLE   $03C0,  $01C0                   ; 5FE7  SFX data
        DECLE   $03D8,  $0000                   ; 5FE9  SFX data
        DECLE   $03D4,  $0200                   ; 5FEB  SFX data
        DECLE   $03BE                           ; 5FED  SFX data
        DECLE   $0001,  $01E3                   ; 5FEE  SFX data
        DECLE   $03AB                           ; 5FF0  SFX data
        DECLE   $02CF                           ; 5FF1  SFX end

L_5FF2:
        PSHR    R5                              ; 5FF2   0275

        JSR     R5,     X_PLAY_SFX1             ; 5FF3   0004 0118 03BB
        DECLE   $0279                           ; 5FF6  SFX data
        DECLE   $000C,  $0100                   ; 5FF7  SFX data
        DECLE   $010D                           ; 5FF9  SFX data
        DECLE   $0035                           ; 5FFA  SFX data
        DECLE   $006E                           ; 5FFB  SFX data
        DECLE   $02EB                           ; 5FFC  SFX data
        DECLE   $03AE                           ; 5FFD  SFX data
        DECLE   $02EB                           ; 5FFE  SFX data
        DECLE   $02CF                           ; 5FFF  SFX end

;; ======================================================================== ;;
;;  Branch cross-reference
;; ------------------------------------------------------------------------ ;;
;;  Target      Target of
;;  $5036       <entry>
;;  $5046       $5100   $566A  
;;  $504C       $505C   $5157   $563F   $5CE5  
;;  $5052       <entry>
;;  $5071       $5059   $506F  
;;  $5072       $5070  
;;  $507C       $507C  
;;  $50B3       $50A0   $5106  
;;  $512C       $508F  
;;  $5137       $514A  
;;  $514D       $5AF7  
;;  $514E       $514C  
;;  $515B       $5154  
;;  $5166       $5162  
;;  $516F       $5168  
;;  $5172       $5CE8  
;;  $518D       $50E3  
;;  $518F       $5708  
;;  $51A0       $5E1B  
;;  $51A2       $5190  
;;  $51A6       $51B1  
;;  $5275       $5053  
;;  $527B       $52A5  
;;  $527D       $5284  
;;  $528B       $529E  
;;  $5296       $5290  
;;  $529A       $5296  
;;  $52C4       $5280   $529A  
;;  $52CB       $52CE  
;;  $52CC       $52CA  
;;  $52D1       $527D   $528D  
;;  $52E0       $54C2  
;;  $52E5       $531E  
;;  $5318       $52E9  
;;  $5321       $52FC   $5301  
;;  $532E       $532B  
;;  $532F       $5327  
;;  $5330       $54E5   $5A1B  
;;  $5332       $5D8D  
;;  $5338       $5DAA  
;;  $533C       $5336  
;;  $533F       $54EB   $5633   $59BD   $5DB4  
;;  $534E       $5B6F  
;;  $5359       $5040  
;;  $535E       $5396  
;;  $5372       $536E  
;;  $5373       $5369   $536C  
;;  $5381       $5385  
;;  $5390       $5376  
;;  $5399       $5522   $560F   $5655  
;;  $539F       $5567   $5659   $56A8  
;;  $53A5       $55E3   $56A2   $579A   $57BB   $5808   $587B   $58A8   $58BE  
;;  $53AD       $56FA   $5703  
;;  $53B0       $53B7  
;;  $53D2       $53CE  
;;  $53D3       $53D1  
;;  $53F8       $53F2  
;;  $540A       $53FE   $5404  
;;  $5420       $541D  
;;  $5429       $5424  
;;  $542B       $5414   $5426  
;;  $5430       $503D  
;;  $544B       $5444  
;;  $5453       $5455  
;;  $5454       $5452   $5457  
;;  $5461       $545B  
;;  $5467       $546C  
;;  $546A       $546E  
;;  $546B       $545F   $5465  
;;  $5472       $544E  
;;  $5476       $543F   $5470  
;;  $5478       $5439   $5468  
;;  $5493       $5490  
;;  $549C       $547C  
;;  $549F       $53BF   $53E3   $53EC   $53F6   $540E   $5429  
;;  $54A0       $5A9F  
;;  $54B8       $503A  
;;  $54D0       $54C9  
;;  $54D4       $54B9  
;;  $54DE       $54D9  
;;  $54DF       $54DD  
;;  $54EA       $54E3  
;;  $54EF       $54E0   $550A  
;;  $54F7       $5508   $550D   $5518   $5534   $5674   $567D   $568A   $56E9  
;;  $54F7       $56ED  
;;  $54FC       $54FA  
;;  $5530       $54D5   $54FD  
;;  $5537       $5526   $556B   $5613  
;;  $5544       $54BC  
;;  $5548       $55AC  
;;  $5554       $554A  
;;  $5571       $5562  
;;  $558B       $5587  
;;  $55A3       $554F   $5552   $5557   $5575   $55B1   $55B8   $55C3   $55FC  
;;  $55AF       $5579  
;;  $55C0       $55C6  
;;  $55C8       $55C1  
;;  $55E0       $55D5  
;;  $55F0       $55CC  
;;  $55F3       $55DE  
;;  $55F4       $55F2  
;;  $55FE       $55D7   $55E0   $55F4  
;;  $561A       $54CE  
;;  $5623       $561E  
;;  $5632       $5639  
;;  $5692       $54BF  
;;  $5697       $56B8  
;;  $56A8       $56A0  
;;  $56B2       $56C2   $56E4  
;;  $56C1       $569A  
;;  $56D6       $56CE  
;;  $56DE       $56A6   $56C5  
;;  $56E6       $5473   $565F  
;;  $570C       $571B   $572D  
;;  $5716       $5099   $509D   $5850  
;;  $5722       $571E  
;;  $5724       $50E7   $5769   $5854  
;;  $5726       $5775  
;;  $5746       $5711   $573A   $578D   $5794   $579E   $57A7   $5806   $580C  
;;  $5746       $5828   $583F   $5845   $5872   $5879   $587F  
;;  $5747       $517B   $5AF4  
;;  $575B       $574D  
;;  $576C       $5778  
;;  $5772       $575D  
;;  $57A0       $5798  
;;  $57D6       $57BF   $57C6  
;;  $57D8       $58FE  
;;  $57F0       $57E9   $57ED  
;;  $57F7       $57F4  
;;  $57FA       $58FA  
;;  $5801       $57B6  
;;  $580E       $5804  
;;  $5822       $5037  
;;  $5857       $583A  
;;  $587B       $5877  
;;  $5888       $585B  
;;  $588F       $588B  
;;  $58A1       $588D   $5899   $58AC  
;;  $58A8       $589F  
;;  $58AF       $5834  
;;  $58C4       $58D5  
;;  $58D1       $58B1   $58B7  
;;  $58D7       $591A  
;;  $58FC       $58E8  
;;  $590D       $5904  
;;  $5911       $58BC   $58C2  
;;  $5915       $582F  
;;  $591D       $583C  
;;  $591E       $5861   $591C  
;;  $5923       $586F   $589C  
;;  $5924       $5922  
;;  $592B       $5926  
;;  $594C       $593B  
;;  $594E       $58CF   $594A  
;;  $5953       $5801   $5874   $5888  
;;  $5961       $5043  
;;  $596E       $596A  
;;  $598B       $5985  
;;  $598C       $5982  
;;  $59A3       $599F  
;;  $59A9       $59A4  
;;  $59B1       $599D  
;;  $59B5       $59A1  
;;  $59BD       $59BA   $59D5   $5A58   $5A5D   $5A71   $5A74  
;;  $59C1       $59B1   $59B3  
;;  $59D4       $59DC  
;;  $59E5       $59A6   $59D1  
;;  $5A10       $5A0D  
;;  $5A16       $5A07  
;;  $5A17       $5A02  
;;  $5A1A       $5A11   $5A14  
;;  $5A1B       $5A19   $5A84   $5A88  
;;  $5A1F       $5965   $5979   $59C8   $59F1  
;;  $5A20       $59EA   $5A77  
;;  $5A37       $5935   $59FB   $5A2E  
;;  $5A41       $537D   $57AE  
;;  $5A42       $5A40  
;;  $5A46       $5A43  
;;  $5A4A       $5A47  
;;  $5A4F       $5A4C  
;;  $5A54       $59AC   $59E0  
;;  $5A68       $5A63  
;;  $5A76       $5A6B  
;;  $5A82       $5A7D  
;;  $5A83       $5A81  
;;  $5ADC       $5B13  
;;  $5AEA       $5AE7  
;;  $5B0D       $5AD4   $5ADA  
;;  $5B1D       $5ACC  
;;  $5B20       $5B2D   $5B31  
;;  $5B2C       $5AC8  
;;  $5B2F       $5B1E  
;;  $5B33       $5B16   $5B27   $5B53  
;;  $5B34       $5B2A   $5B62   $5B69   $5B6C  
;;  $5B58       $5B1B  
;;  $5B59       $5B19   $5B56  
;;  $5B9B       $5BCD   $5BD3  
;;  $5BA3       $5B9F  
;;  $5BA5       $5BDF   $5BE2  
;;  $5BC3       $5BBB  
;;  $5BC5       $5BB5  
;;  $5BC7       $5BC1  
;;  $5BCC       $5B99  
;;  $5BD1       $5B93  
;;  $5BD5       $5BCF  
;;  $5BE1       $5BDC  
;;  $5BE4       $5B78  
;;  $5BE7       $5A91  
;;  $5BE8       $5BE6  
;;  $5C38       $5C07   $5C0B   $5C0F   $5C13   $5C17  
;;  $5C39       $5BF8   $5BFD   $5C02   $5C1B   $5C20   $5C25   $5C2A   $5C2F  
;;  $5C39       $5C34   $5C37  
;;  $5C3B       $5A8E   $5B75  
;;  $5C66       $5C57  
;;  $5C75       $5C67  
;;  $5C79       $5AA6   $5B95  
;;  $5C7A       $5C4F   $5C5F  
;;  $5C88       $5C7D  
;;  $5C89       $5B72  
;;  $5C92       $5A8B  
;;  $5C93       $5C90  
;;  $5C9A       <entry>
;;  $5CA9       $5CA5  
;;  $5CAD       $5CE2  
;;  $5CB2       $508C  
;;  $5CC8       $5056   $5AFA  
;;  $5CE2       $5CAA  
;;  $5CF1       $5178   $566D   $5B09   $5C9B  
;;  $5D04       $5CFA  
;;  $5D05       $5D03  
;;  $5D10       $5D30  
;;  $5D12       $5D08   $5D19  
;;  $5D1B       $5D15  
;;  $5D4B       <entry>
;;  $5D4F       $5DC4  
;;  $5D87       $5D83  
;;  $5D92       $5D70  
;;  $5DAF       $5D94  
;;  $5DBF       $5D52   $5D90   $5DAD  
;;  $5DC7       $5D9E   $5DA5  
;;  $5DD2       $5DCC  
;;  $5DD3       $5DD0  
;;  $5DD4       $5DF1   $5E0E  
;;  $5DE1       $5DF5   $5DFF  
;;  $5DF0       $5628  
;;  $5DFE       $5151   $5189  
;;  $5E07       $5E14  
;;  $5E1F       $5DBA  
;;  $5E3A       $5E36  
;;  $5E47       $5E29  
;;  $5E52       $5E4D  
;;  $5FC3       $559E   $57B8  
;;  $5FD4       $53DA   $5B47  
;;  $5FF2       $552C  
;; ======================================================================== ;;
